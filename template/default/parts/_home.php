<?php
# @Author: Waris Agung Widodo <user>
# @Date:   2018-01-23T11:27:04+07:00
# @Email:  ido.alit@gmail.com
# @Filename: _home.php
# @Last modified by:   user
# @Last modified time: 2018-01-26T18:43:45+07:00

?>

<section id="section1 container-fluid">
    <header class="c-header">
        <div class="mask"></div>
      <?php
      // ------------------------------------------------------------------------
      // include navbar
      // ------------------------------------------------------------------------
      include '_navbar.php'; ?>
    </header>
  <?php
  // --------------------------------------------------------------------------
  // include search form part
  // --------------------------------------------------------------------------
  include '_search-form.php'; ?>
</section>
<style>
    .topic li a {
    font-size: 12px;
    color: #666;
    text-align: center;
    text-decoration: none;
    opacity: 0.8;
    font-size: 18px;
    font-weight: bold;
}
</style>
<div id="ecd-home">
<section class="mt-5 bg-white">
    <div class="container py-5">
        <!-- <h4 class="text-secondary text-center text-thin mt-5 mb-4"><?php echo __('Select the topic you are interested in'); ?></h4> -->
        <ul class="topic d-flex flex-wrap justify-content-center px-0">
        
        <li class="d-flex justify-content-center align-items-center m-2">
            <a href="index.php?resource_collection=စာအုပ်များ&search=search" class="d-flex flex-column">
                <img src="<?php echo assets('images/1-memory.png'); ?>" width="80" class="mb-3 mt-3 mx-auto">
                <h5>  <?php echo __('Books'); ?> </h5>
                <p><?php echo __('Books in the library'); ?> </p>
            </a>
        </li>
        <li class="d-flex justify-content-center align-items-center m-2">
            <a href="index.php?resource_collection=ပညာရေးဆိုင်ရာ&search=search" class="d-flex flex-column">
                <img src="<?php echo assets('images/1-memory.png'); ?>" width="80" class="mb-3 mt-3 mx-auto">
                <h5> <?php echo __('Educational') ?> </h5>
                <p><?php echo __('Educational books in the library') ?></p>
            </a>
        </li>
        
        <li class="d-flex justify-content-center align-items-center m-2">
                <a href="index.php?resource_collection=သတင်းစာများ&search=search" class="d-flex flex-column">
                    <img src="<?php echo assets('images/8-books.png'); ?>" width="80" class="mb-3 mt-3 mx-auto"/>
                    <h5><?php echo __('Newspapers') ?> </h5>
                    <p><?php echo __('Newspapers in the library') ?></p>
                </a>
            </li>
            <li class="d-flex justify-content-center align-items-center m-2">
                <a href="index.php?resource_collection=မြန်မာနိုင်ငံပြန်တမ်း&search=search" class="d-flex flex-column">
                    <img src="<?php echo assets('images/3-diploma.png'); ?>" width="80" class="mb-3 mt-3 mx-auto"/>
                    <h5> <?php echo __('Myanmar Returns') ?></h5>
                    <p><?php echo __('Myanmar Returns in the library') ?></p>
                </a>
            </li>
            <li class="d-flex justify-content-center align-items-center m-2">
                <a href="index.php?resource_collection=ဂျာနယ်&search=search" class="d-flex flex-column">
                    <img src="<?php echo assets('images/6-blackboard.png'); ?>" width="80" class="mb-3 mt-3 mx-auto"/>
                    <h5> <?php echo __('Journas') ?></h5>
                    <p><?php echo __('Journas in the library') ?></p>
                </a>
            </li>
            <li class="d-flex justify-content-center align-items-center m-2">
                <a href="index.php?resource_collection=မဂ္ဂဇင်း&search=search" class="d-flex flex-column">
                    <img src="<?php echo assets('images/7-quill.png'); ?>" width="80" class="mb-3 mt-3 mx-auto"/>
                    <h5> <?php echo __('Magazines') ?></h5>
                    <p><?php echo __('Magazines in the library') ?></p>
                </a>
            </li>
        
            <li class="d-flex justify-content-center align-items-center m-2">
                <a href="javascript:void(0)" class="d-flex flex-column" data-toggle="modal" data-target="#exampleModal">
                    <img src="<?php echo assets('images/icon/grid_icon.png'); ?>" width="80" class="mb-3 mx-auto"/>
                    <?php echo __('To See More...'); ?>
                </a>
            </li>
        </ul>
    </div>
</section>

<?php if ($sysconf['template']['classic_popular_collection']) : ?>
<section class="mt-5 container">
    <h4 class=" mb-4">
        <?php echo __('Popular among our collections'); ?>
        <br>
        <small class="subtitle-section"><?php echo __('Our library\'s line of collection that have been favoured by our users were shown here. Look for them. Borrow them. Hope you also like them');?></small>
    </h4>

    <slims-group-subject url="index.php?p=api/subject/popular"></slims-group-subject>
    <slims-collection url="index.php?p=api/biblio/popular"></slims-collection>

</section>
<?php endif; ?>

<?php if ($sysconf['template']['classic_new_collection']) : ?>
<section class="mt-5 container">
    <h2 class=" mb-4 centered">
        <?php echo __('New Arrivals');?>
        <br>
        <small class="subtitle-section">
            <?php echo __('Books and magazines new to the library');?>
        </small>
    </h2>

    <slims-group-subject url="index.php?p=api/subject/latest"></slims-group-subject>
    <slims-collection url="index.php?p=api/biblio/latest"></slims-collection>

</section>
<?php endif; ?>

<?php if ($sysconf['template']['classic_top_reader']) : ?>
<section class="mt-5 bg-white">
    <div class="container py-5">
        <h4 class="mb-4">
            <?php echo __('Top reader of the year');?>
            <br>
            <!-- <small class="subtitle-section"><?php echo __('Our best users, readers, so far. Continue to read if you want your name being mentioned here');?></small> -->
        </h4>
        <slims-group-member url="index.php?p=api/member/top"></slims-group-member>
    </div>
</section>
<?php endif; ?>

<?php if ($sysconf['template']['classic_map']) : ?>
<section class="my-5 bg-white">
    <div class="container py-5">
        <div class="row align-items-center">
            <div class="col-md-6">
                <iframe class="embed-responsive"
                        src="<?= $sysconf['template']['classic_map_link']; ?>"
                        height="420" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div>
            <div class="col-md-6 pt-8 md:pt-0">
                <h4><?= $sysconf['library_name']; ?></h4>
                <p><?= $sysconf['template']['classic_map_desc']; ?></p>
                <!-- <p class="d-flex flex-row pt-2">
                    <a target="_blank" href="<?= $sysconf['template']['classic_fb_link'] ?>" class="btn btn-primary mr-2" name="button"><i class="fab fa-facebook-square text-white"></i></a>
                    <a target="_blank" href="<?= $sysconf['template']['classic_twitter_link'] ?>" class="btn btn-info mr-2" name="button"><i class="fab fa-twitter-square text-white"></i></a>
                    <a target="_blank" href="<?= $sysconf['template']['classic_youtube_link'] ?>" class="btn btn-danger mr-2" name="button"><i class="fab fa-youtube text-white"></i></a>
                    <a target="_blank" href="<?= $sysconf['template']['classic_instagram_link'] ?>" class="btn btn-dark mr-2" name="button"><i class="fab fa-instagram text-white"></i></a>
                </p> -->
            </div>
        </div>
    </div>
</section>
<?php endif; ?>
</div>