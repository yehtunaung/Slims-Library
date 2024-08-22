<?php
/**
 * @Created by          : Waris Agung Widodo (ido.alit@gmail.com)
 * @Date                : 2020-01-02 16:27
 * @File name           : _modal_topic.php
 */

?>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><?=  __('Select the topic you are interested in'); ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <ul class="topic d-flex flex-wrap justify-content-center p-0">
                    <li class="d-flex justify-content-center align-items-center m-2">
                        <a href="index.php?resource_collection=စာအုပ်များ&search=search" class="d-flex flex-column">
                            <img src="<?=  assets('images/0-chemical.png'); ?>" width="80" class="mb-3 mx-auto"/>
                            <?=  __('စာအုပ်များ'); ?>
                        </a>
                    </li>
                    <li class="d-flex justify-content-center align-items-center m-2">
                        <a href="index.php?resource_collection=ပညာရေးဆိုင်ရာ&search=search" class="d-flex flex-column">
                            <img src="<?=  assets('images/1-memory.png'); ?>" width="80" class="mb-3 mx-auto"/>
                            <?=  __('ပညာရေးဆိုင်ရာ'); ?>
                        </a>
                    </li>
                    <li class="d-flex justify-content-center align-items-center m-2">
                        <a href="index.php?resource_collection=သတင်းစာများ&search=search" class="d-flex flex-column">
                            <img src="<?=  assets('images/2-mosque.png'); ?>" width="80" class="mb-3 mx-auto"/>
                            <?=  __('သတင်းစာများ'); ?>
                        </a>
                    </li>
                    <li class="d-flex justify-content-center align-items-center m-2">
                        <a href="index.php?resource_collection=မြန်မာနိုင်ငံပြန်တမ်း&search=search" class="d-flex flex-column">
                            <img src="<?=  assets('images/3-diploma.png'); ?>" width="80" class="mb-3 mx-auto"/>
                            <?=  __('မြန်မာနိုင်ငံပြန်တမ်း'); ?>
                        </a>
                    </li>
                    <li class="d-flex justify-content-center align-items-center m-2">
                        <a href="index.php?resource_collection=ဂျာနယ်&search=search" class="d-flex flex-column">
                            <img src="<?=  assets('images/4-translation.png'); ?>" width="80" class="mb-3 mx-auto"/>
                            <?=  __('ဂျာနယ်'); ?>
                        </a>
                    </li>
                    <li class="d-flex justify-content-center align-items-center m-2">
                        <a href="index.php?resource_collection=မဂ္ဂဇင်း&search=search" class="d-flex flex-column">
                            <img src="<?=  assets('images/5-math.png'); ?>" width="80" class="mb-3 mx-auto"/>
                            <?=  __('မဂ္ဂဇင်း'); ?>
                        </a>
                    </li>
                    <li class="d-flex justify-content-center align-items-center m-2">
                        <a href="index.php?resource_collection=6&search=search" class="d-flex flex-column">
                            <img src="<?=  assets('images/6-blackboard.png'); ?>" width="80" class="mb-3 mx-auto"/>
                            <?=  __('Applied Sciences'); ?>
                        </a>
                    </li>
                    <li class="d-flex justify-content-center align-items-center m-2">
                        <a href="index.php?resource_collection=7&search=search" class="d-flex flex-column">
                            <img src="<?=  assets('images/7-quill.png'); ?>" width="80" class="mb-3 mx-auto"/>
                            <?=  __('Art & Recreation'); ?>
                        </a>
                    </li>
                    <li class="d-flex justify-content-center align-items-center m-2">
                        <a href="index.php?resource_collection=8&search=search" class="d-flex flex-column">
                            <img src="<?=  assets('images/8-books.png'); ?>" width="80" class="mb-3 mx-auto"/>
                            <?=  __('Literature'); ?>
                        </a>
                    </li>
                    <li class="d-flex justify-content-center align-items-center m-2">
                        <a href="index.php?resource_collection=9&search=search" class="d-flex flex-column">
                            <img src="<?=  assets('images/9-return-to-the-past.png'); ?>" width="80" class="mb-3 mx-auto"/>
                            <?=  __('History & Geography'); ?>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="modal-footer text-muted text-sm">
                <div>Resource Collection</div>
            </div>
        </div>
    </div>
</div>
