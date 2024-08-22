<?php
# @Author: Waris Agung Widodo <user>
# @Date:   2018-01-25T10:31:54+07:00
# @Email:  ido.alit@gmail.com
# @Filename: _search-form.php
# @Last modified by:   user
# @Last modified time: 2018-01-26T16:53:56+07:00

if ($opac->invalid_token) {
    //die($opac->error('invalid CSRF token'));
}
?>

<div class="search" id="search-wraper">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 mx-auto">
                <div class="card border-0 shadow">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <select name="searchBy" id="search-select" class="form-control col-md-2">
                                <option value="keywords"><?= __('Any Fields'); ?></option>
                                <option value="title"><?= __('Title'); ?></option>
                                <option value="author"><?= __('Author'); ?></option>
                                <option value="subject"><?= __('Subject(s)'); ?></option>
                                <option value="isbn"><?= __('ISBN/ISSN'); ?></option>
                                <option value="publishyear"><?= __('Public Date'); ?></option>
                                <option value="publisher"><?= __('Publisher'); ?></option>
                                <option value="series_title"><?= __('Series'); ?></option>
                                <!-- <option value="rsource_collection"><?= __('Resource Collection'); ?></option> -->
                                <option value="colltype"><?= __('Collection Type'); ?></option>
                                <option value="gmd"><?= __('GMD'); ?></option>
                                <option value="class_number"><?= __('Class Number'); ?></option>
                            </select>
                            <input type="hidden" name="search" value="search">
                            <input type="text" id="search-input" name="keywords" class="input-transparent w-100"
                                value="<?= htmlentities($_GET['keywords'] ?? '') ?>"
                                placeholder="<?= __('Enter search keyword...'); ?>" />
                            <!-- <button type="submit" class="btn btn-primary ml-2" id="search-btn"><?= __('Search'); ?></button> -->
                            <button type="submit" class="btn " id="search-btn"> </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var searchButton = document.getElementById('search-btn');

        searchButton.onclick = function() {
            var searchBy = document.getElementById('search-select').value;
            var keywords = document.getElementById('search-input').value;

            var queryString = `${searchBy}=${encodeURIComponent(keywords)}&search=search&`;
            window.location.href = `index.php?${queryString}`;
        };
    });
</script>
