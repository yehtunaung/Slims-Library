<?php

/**
 * @Created by          : Waris Agung Widodo (ido.alit@gmail.com)
 * @Date                : 2019-01-30 00:58
 * @File name           : detail_template.php
 */
$setBookmarked = trim(isset($_SESSION['bookmark'][$biblio_id]) ? 'bg-success text-white rounded-lg px-2 py-1' : 'text-secondary px-2 py-1');
?>
<style>
    .marc-field {
        margin-bottom: 1rem;
    }

    .marc-label {
        font-weight: bold;
        margin-right: 1rem;
        /* Optional: add space between label and subfield */
    }

    .marc-subfield {
        flex-grow: 1;
    }

    .marc-value {
        text-align: right;
    }
</style>

<div class="container">
    <div class="flex flex-wrap">
        <div class="w-64 mb-2">
            <div class="bg-grey-light p-12 rounded">
                <div class="shadow">
                    <?= $image; ?>
                </div>
            </div>
            <div class="d-flex flex-row justify-content-center text-sm my-3">
                <a href="#" data-id="<?= $biblio_id ?>" data-detail="true" class="bookMarkBook text-decoration-none <?= $setBookmarked ?> font-weight-bolder mr-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-postcard-heart" viewBox="0 0 16 16">
                        <path d="M8 4.5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7Zm3.5.878c1.482-1.42 4.795 1.392 0 4.622-4.795-3.23-1.482-6.043 0-4.622ZM2.5 5a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1h-3Zm0 2a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1h-3Zm0 2a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1h-3Z" />
                        <path fill-rule="evenodd" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H2Z" />
                    </svg>
                    <?= in_array($biblio_id, $_SESSION['bookmark'] ?? []) ? __('Bookmarked') : __('Bookmark') ?>
                </a>
                <a href="javascript:void(0)" data-toggle="modal" data-id="<?= $biblio_id ?>" data-title="<?= $title ?>" data-target="#mediaSocialModal" class="text-decoration-none text-secondary font-weight-bolder mr-3 px-2 py-1">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
                        <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z" />
                    </svg>
                    <?= __('Share') ?>
                </a>
            </div>
        </div>
        <div class="flex-1 p-0 px-md-4">
            <p class="lead"><i class="fas fa-bookmark text-green"></i> <?= $gmd_name; ?></p>
            <blockquote class="blockquote">
                <h4 class="mb-2"><?= $title; ?></h4>
                <footer class="blockquote-footer"><?= str_replace("<br />", '။ ', $authors); ?></footer>
            </blockquote>
            <hr>
            <p class="text-grey-darker">
                <?= $notes ? $notes : '<i>' . __('Description Not Available') . '</i>'; ?>
            </p>
            <hr>

            <h5 class="mt-4 mb-1"><?= __('Holdings'); ?></h5>
            <?= ($availability) ? $availability : '<p class="text-grey-dark">' . __('No copy data') . '</p>'; ?>

            <!-- View Button -->
            <ul class="nav nav-pills mt-3">
                <li class="nav-item">
                    <a class="nav-link active" id="custom-tabs-normal-view-tab" data-toggle="pill" href="#custom-tabs-normal-view" role="tab" aria-controls="custom-tabs-normal-view" aria-selected="true">Normal View</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-march-view-tab" data-toggle="pill" href="#custom-tabs-march-view" role="tab" aria-controls="custom-tabs-march-view" aria-selected="false">March View</a>
                </li>
            </ul>

            <!-- <h5 class="mt-4 mb-1"><?= __('Detail Information'); ?></h5> -->

            <div class="tab-content" id="custom-tabs-four-tabContent">
                <!-- Norma view -->
                <div class="tab-pane fade show active" id="custom-tabs-normal-view" role="tabpanel" aria-labelledby="custom-tabs-normal-view-tab">
                    <dl class="row">
                        <dt class="col-sm-3"><?= __('Series Title'); ?></dt>
                        <dd class="col-sm-9">
                            <div itemprop="alternativeHeadline"
                                property="alternativeHeadline"><?php echo ($series_title) ? $series_title : '-'; ?></div>
                        </dd>

                        <dt class="col-sm-3"><?= __('Resource Collection'); ?></dt>
                        <dd class="col-sm-9">
                            <div><?php echo ($call_number) ? $call_number : '-'; ?></div>
                        </dd>
                        <dt class="col-sm-3"><?= __('Publisher'); ?></dt>
                        <dd class="col-sm-9">
                            <span itemprop="publisher" property="publisher" itemtype="http://schema.org/Organization"
                                itemscope><?php echo $publish_place ?></span> :
                            <span itemprop="publisher" property="publisher"><?php echo $publisher_name ?></span>.,
                            <span itemprop="datePublished" property="datePublished"><?php echo $publish_year ?></span>
                        </dd>
                        <dt class="col-sm-3"><?= __('Collation'); ?></dt>
                        <dd class="col-sm-9">
                            <div itemprop="numberOfPages"
                                property="numberOfPages"><?php echo ($collation) ? $collation : '-'; ?></div>
                        </dd>
                        <dt class="col-sm-3"><?= __('Language'); ?></dt>
                        <dd class="col-sm-9">
                            <div>
                                <meta itemprop="inLanguage" property="inLanguage"
                                    content="<?php echo $language_name ?>" /><?php echo $language_name ?>
                            </div>
                        </dd>
                        <dt class="col-sm-3"><?= __('ISBN/ISSN'); ?></dt>
                        <dd class="col-sm-9">
                            <div itemprop="isbn" property="isbn"><?php echo ($isbn_issn) ? $isbn_issn : '-'; ?></div>
                        </dd>
                        <dt class="col-sm-3"><?= __('Classification'); ?></dt>
                        <dd class="col-sm-9">
                            <div><?php echo ($classification) ? $classification : '-'; ?></div>
                        </dd>
                        <dt class="col-sm-3"><?= __('Content Type'); ?></dt>
                        <dd class="col-sm-9">
                            <div itemprop="bookFormat"
                                property="bookFormat"><?php echo ($content_type) ? $content_type : '-'; ?></div>
                        </dd>
                        <dt class="col-sm-3"><?= __('Media Type'); ?></dt>
                        <dd class="col-sm-9">
                            <div itemprop="bookFormat"
                                property="bookFormat"><?php echo ($media_type) ? $media_type : '-'; ?></div>
                        </dd>
                        <dt class="col-sm-3"><?= __('Carrier Type'); ?></dt>
                        <dd class="col-sm-9">
                            <div itemprop="bookFormat"
                                property="bookFormat"><?php echo ($carrier_type) ? $carrier_type : '-'; ?></div>
                        </dd>
                        <dt class="col-sm-3"><?= __('Edition'); ?></dt>
                        <dd class="col-sm-9">
                            <div itemprop="bookEdition" property="bookEdition"><?php echo ($edition) ? $edition : '-'; ?></div>
                        </dd>
                        <dt class="col-sm-3"><?= __('Subject(s)'); ?></dt>
                        <dd class="col-sm-9">
                            <div class="s-subject" itemprop="keywords"
                                property="keywords"><?php echo ($subjects) ? $subjects : '-'; ?></div>
                        </dd>
                        <dt class="col-sm-3"><?= __('Specific Detail Info'); ?></dt>
                        <dd class="col-sm-9">
                            <div><?php echo ($spec_detail_info) ? $spec_detail_info : '-'; ?></div>
                        </dd>
                        <dt class="col-sm-3"><?= __('Statement of Responsibility'); ?></dt>
                        <dd class="col-sm-9">
                            <div itemprop="author" property="author"><?php echo ($sor) ? $sor : '-'; ?></div>
                        </dd>
                    </dl>

                    <?php if (count($biblio_custom) > 0) {; ?>
                        <h5 class="mt-4 mb-1"><?= __('Other Information'); ?></h5>
                        <dl class="row">
                            <?php foreach ($biblio_custom as $item) { ?>
                                <dt class="col-sm-3"><?= $item['label']; ?></dt>
                                <dd class="col-sm-9">
                                    <div itemprop="alternativeHeadline"
                                        property="alternativeHeadline"><?php echo ($item['value']) ? $item['value'] : '-'; ?></div>
                                </dd>
                            <?php }; ?>
                        </dl>
                    <?php }; ?>


                </div>

                <!-- Edit By Ye Htun -->

                <!-- March View -->
                <div class="tab-pane fade" id="custom-tabs-march-view" role="tabpanel" aria-labelledby="custom-tabs-march-view-tab">
                    <div class="container mt-4">

                        <div class="marc-label row">020 - ISBN/ISSN</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">ISBN</div>
                                <div class="marc-value ms-auto"><?php echo ($isbn_issn) ? $isbn_issn : '-'; ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">041 - Language</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">The language type of the book</div>
                                <div class="marc-value ms-auto"><?php echo $language_name ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">082 ## - DEWEY DECIMAL CLASSIFICATION NUMBER</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">Classification number</div>
                                <div class="marc-value ms-auto"><?php echo ($classification) ? $classification : '-'; ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">100 ## - MAIN ENTRY--PERSONAL NAME</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">Personal name</div>
                                <div class="marc-value ms-auto"><?php
                                                                if (is_array($personal_name)) {
                                                                    echo implode('။ ', $personal_name); // Join array elements into a comma-separated string
                                                                } else {
                                                                    echo $personal_name; // In case it's a string
                                                                }
                                                                ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">110 #0 -ORGANIZATION AUTHOR </div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">Title</div>
                                <div class="marc-value ms-auto"><?php
                                                                if (is_array($organization_name)) {
                                                                    echo implode('။ ', $organization_name); // Join array elements into a comma-separated string
                                                                } else {
                                                                    echo $organization_name; // In case it's a string
                                                                }
                                                                ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">245 #0 - TITLE STATEMENT</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">Title</div>
                                <div class="marc-value ms-auto"><?= $title; ?></div>
                            </div>
                        </div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">Statement of responsibility, etc. </div>
                                <div class="marc-value ms-auto"><?php
                                                                if (is_array($conference)) {
                                                                    echo implode('။ ', $conference); // Join array elements into a comma-separated string
                                                                } else {
                                                                    echo $conference; // In case it's a string
                                                                }
                                                                ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">250 ## - EDITION STATEMENT</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">Edition statement</div>
                                <div class="marc-value ms-auto"><?php echo ($edition) ? $edition : '-'; ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">250 ## - - PUBLICATION, DISTRIBUTION, ETC.</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">Name of publisher, distributor, etc. </div>
                                <div class="marc-value ms-auto"><?php echo ($publish_place) ? $publish_place : '-'; ?></div>
                            </div>
                        </div>

                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">Date of publication, distribution, etc. </div>
                                <div class="marc-value ms-auto"><?php echo ($publisher_name) ? $publisher_name : '-'; ?></div>
                            </div>
                        </div>

                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">Place of publication, distribution, etc. </div>
                                <div class="marc-value ms-auto"><?php echo ($publish_year) ? $publish_year : '-'; ?></div>
                            </div>
                        </div>


                        <div class="marc-label row">300 ## - PHYSICAL DESCRIPTION</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield">Extent , Dimensions</div>
                                <div class="marc-value ms-auto"><?php echo ($collation) ? $collation : '-'; ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">490 ## - SERIES TITLE</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield"> Series Title</div>
                                <div class="marc-value ms-auto"><?php echo ($series_title) ? $series_title : '-'; ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">500 ## - GENERAL NOTE</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield"> General note</div>
                                <div class="marc-value ms-auto"><?= $notes ? $notes : '<i>' . __('Description Not Available') . '</i>'; ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">650 ## - SUBJECT ADDED ENTRY--TOPICAL TERM</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield"> Topical term or geographic name entry element </div>
                                <div class="marc-value ms-auto"><?php echo ($subjects) ? $subjects : '-'; ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">700 ## - ADDED ENTRY--PERSONAL NAME</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield"> Personal Name </div>
                                <div class="marc-value ms-auto"><?php
                                                                if (is_array($personal_name)) {
                                                                    echo implode('။ ', $personal_name); // Join array elements into a comma-separated string
                                                                } else {
                                                                    echo $personal_name; // In case it's a string
                                                                }
                                                                ?></div>
                            </div>
                        </div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield"> Miscellaneous information </div>
                                <div class="marc-value ms-auto"><?php
                                                                if (is_array($author_prefix)) {
                                                                    echo implode('။ ', $author_prefix); // Join array elements into a comma-separated string
                                                                } else {
                                                                    echo $author_prefix; // In case it's a string
                                                                }
                                                                ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">910 ## - Keywords</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield"> User-option data </div>
                                <div class="marc-value ms-auto"><?php echo ($spec_detail_info) ? $spec_detail_info : '-'; ?></div>
                            </div>
                        </div>

                        <div class="marc-label row">942 ## - ADDED ENTRY ELEMENTS</div>
                        <div class="marc-field d-flex justify-content-between">
                            <div class="d-flex flex-grow-1 col">
                                <div class="marc-subfield"> Item Type </div>
                                <div class="marc-value ms-auto"><?php echo ($media_type) ? $media_type : '-'; ?></div>
                            </div>
                        </div>

                    </div>
                </div>
                <h5 class="mt-4 mb-1"><?= __('Other version/related'); ?></h5>
                <div>
                    <?php echo ($related) ? $related : '<p class="text-grey-dark">' . __('No other version available') . '</p>'; ?>
                </div>

                <h5 id="attachment" class="mt-4 mb-1"><?= __('File Attachment'); ?></h5>
                <div itemprop="associatedMedia">
                    <?= !$file_att  ? '<i>' . __('No Data') . '</i>' : $file_att; ?>
                </div>

                <h5 id="comment" class="mt-4 mb-1"><?= __('Comments'); ?></h5>
                <?php echo showComment($biblio_id); ?>
                <?php if (!isset($_SESSION['mid']) && $sysconf['comment']['enable']) : ?>
                    <hr>
                    <a href="index.php?p=member" class="btn btn-outline-primary"><?= __('You must be logged in to post a comment'); ?></a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>