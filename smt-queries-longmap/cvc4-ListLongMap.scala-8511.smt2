; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103804 () Bool)

(assert start!103804)

(declare-fun res!828746 () Bool)

(declare-fun e!704502 () Bool)

(assert (=> start!103804 (=> (not res!828746) (not e!704502))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103804 (= res!828746 (not (= key1!25 key2!15)))))

(assert (=> start!103804 e!704502))

(assert (=> start!103804 true))

(declare-fun e!704501 () Bool)

(assert (=> start!103804 e!704501))

(declare-fun tp_is_empty!31295 () Bool)

(assert (=> start!103804 tp_is_empty!31295))

(declare-fun b!1242737 () Bool)

(declare-fun tp!92771 () Bool)

(assert (=> b!1242737 (= e!704501 (and tp_is_empty!31295 tp!92771))))

(declare-fun b!1242734 () Bool)

(declare-fun res!828748 () Bool)

(assert (=> b!1242734 (=> (not res!828748) (not e!704502))))

(declare-datatypes ((B!1896 0))(
  ( (B!1897 (val!15710 Int)) )
))
(declare-datatypes ((tuple2!20292 0))(
  ( (tuple2!20293 (_1!10157 (_ BitVec 64)) (_2!10157 B!1896)) )
))
(declare-datatypes ((List!27375 0))(
  ( (Nil!27372) (Cons!27371 (h!28580 tuple2!20292) (t!40841 List!27375)) )
))
(declare-fun l!644 () List!27375)

(declare-fun isStrictlySorted!768 (List!27375) Bool)

(assert (=> b!1242734 (= res!828748 (isStrictlySorted!768 l!644))))

(declare-fun v1!20 () B!1896)

(declare-fun b!1242736 () Bool)

(declare-fun insertStrictlySorted!442 (List!27375 (_ BitVec 64) B!1896) List!27375)

(declare-fun removeStrictlySorted!135 (List!27375 (_ BitVec 64)) List!27375)

(assert (=> b!1242736 (= e!704502 (not (= (insertStrictlySorted!442 (removeStrictlySorted!135 l!644 key2!15) key1!25 v1!20) (removeStrictlySorted!135 (insertStrictlySorted!442 l!644 key1!25 v1!20) key2!15))))))

(declare-fun b!1242735 () Bool)

(declare-fun res!828747 () Bool)

(assert (=> b!1242735 (=> (not res!828747) (not e!704502))))

(assert (=> b!1242735 (= res!828747 (not (is-Cons!27371 l!644)))))

(assert (= (and start!103804 res!828746) b!1242734))

(assert (= (and b!1242734 res!828748) b!1242735))

(assert (= (and b!1242735 res!828747) b!1242736))

(assert (= (and start!103804 (is-Cons!27371 l!644)) b!1242737))

(declare-fun m!1145439 () Bool)

(assert (=> b!1242734 m!1145439))

(declare-fun m!1145441 () Bool)

(assert (=> b!1242736 m!1145441))

(assert (=> b!1242736 m!1145441))

(declare-fun m!1145443 () Bool)

(assert (=> b!1242736 m!1145443))

(declare-fun m!1145445 () Bool)

(assert (=> b!1242736 m!1145445))

(assert (=> b!1242736 m!1145445))

(declare-fun m!1145447 () Bool)

(assert (=> b!1242736 m!1145447))

(push 1)

(assert (not b!1242736))

(assert (not b!1242734))

(assert (not b!1242737))

(assert tp_is_empty!31295)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!704526 () Bool)

(declare-fun b!1242778 () Bool)

(declare-fun lt!562276 () List!27375)

(declare-fun contains!7396 (List!27375 tuple2!20292) Bool)

(assert (=> b!1242778 (= e!704526 (contains!7396 lt!562276 (tuple2!20293 key1!25 v1!20)))))

(declare-fun b!1242779 () Bool)

(declare-fun e!704524 () List!27375)

(declare-fun e!704525 () List!27375)

(assert (=> b!1242779 (= e!704524 e!704525)))

(declare-fun c!121705 () Bool)

(assert (=> b!1242779 (= c!121705 (and (is-Cons!27371 (removeStrictlySorted!135 l!644 key2!15)) (= (_1!10157 (h!28580 (removeStrictlySorted!135 l!644 key2!15))) key1!25)))))

(declare-fun b!1242780 () Bool)

(declare-fun call!61368 () List!27375)

(assert (=> b!1242780 (= e!704525 call!61368)))

(declare-fun b!1242781 () Bool)

(declare-fun res!828757 () Bool)

(assert (=> b!1242781 (=> (not res!828757) (not e!704526))))

(declare-fun containsKey!615 (List!27375 (_ BitVec 64)) Bool)

(assert (=> b!1242781 (= res!828757 (containsKey!615 lt!562276 key1!25))))

(declare-fun b!1242782 () Bool)

(declare-fun e!704523 () List!27375)

(declare-fun call!61369 () List!27375)

(assert (=> b!1242782 (= e!704523 call!61369)))

(declare-fun bm!61364 () Bool)

(assert (=> bm!61364 (= call!61369 call!61368)))

(declare-fun d!136897 () Bool)

(assert (=> d!136897 e!704526))

(declare-fun res!828758 () Bool)

(assert (=> d!136897 (=> (not res!828758) (not e!704526))))

(assert (=> d!136897 (= res!828758 (isStrictlySorted!768 lt!562276))))

(assert (=> d!136897 (= lt!562276 e!704524)))

(declare-fun c!121706 () Bool)

(assert (=> d!136897 (= c!121706 (and (is-Cons!27371 (removeStrictlySorted!135 l!644 key2!15)) (bvslt (_1!10157 (h!28580 (removeStrictlySorted!135 l!644 key2!15))) key1!25)))))

(assert (=> d!136897 (isStrictlySorted!768 (removeStrictlySorted!135 l!644 key2!15))))

(assert (=> d!136897 (= (insertStrictlySorted!442 (removeStrictlySorted!135 l!644 key2!15) key1!25 v1!20) lt!562276)))

(declare-fun c!121707 () Bool)

(declare-fun b!1242783 () Bool)

(assert (=> b!1242783 (= c!121707 (and (is-Cons!27371 (removeStrictlySorted!135 l!644 key2!15)) (bvsgt (_1!10157 (h!28580 (removeStrictlySorted!135 l!644 key2!15))) key1!25)))))

(assert (=> b!1242783 (= e!704525 e!704523)))

(declare-fun b!1242784 () Bool)

(assert (=> b!1242784 (= e!704523 call!61369)))

(declare-fun b!1242785 () Bool)

(declare-fun e!704527 () List!27375)

(assert (=> b!1242785 (= e!704527 (ite c!121705 (t!40841 (removeStrictlySorted!135 l!644 key2!15)) (ite c!121707 (Cons!27371 (h!28580 (removeStrictlySorted!135 l!644 key2!15)) (t!40841 (removeStrictlySorted!135 l!644 key2!15))) Nil!27372)))))

(declare-fun call!61367 () List!27375)

(declare-fun bm!61365 () Bool)

(declare-fun $colon$colon!630 (List!27375 tuple2!20292) List!27375)

(assert (=> bm!61365 (= call!61367 ($colon$colon!630 e!704527 (ite c!121706 (h!28580 (removeStrictlySorted!135 l!644 key2!15)) (tuple2!20293 key1!25 v1!20))))))

(declare-fun c!121704 () Bool)

(assert (=> bm!61365 (= c!121704 c!121706)))

(declare-fun b!1242786 () Bool)

(assert (=> b!1242786 (= e!704527 (insertStrictlySorted!442 (t!40841 (removeStrictlySorted!135 l!644 key2!15)) key1!25 v1!20))))

(declare-fun b!1242787 () Bool)

(assert (=> b!1242787 (= e!704524 call!61367)))

(declare-fun bm!61366 () Bool)

(assert (=> bm!61366 (= call!61368 call!61367)))

(assert (= (and d!136897 c!121706) b!1242787))

(assert (= (and d!136897 (not c!121706)) b!1242779))

(assert (= (and b!1242779 c!121705) b!1242780))

(assert (= (and b!1242779 (not c!121705)) b!1242783))

(assert (= (and b!1242783 c!121707) b!1242784))

(assert (= (and b!1242783 (not c!121707)) b!1242782))

(assert (= (or b!1242784 b!1242782) bm!61364))

(assert (= (or b!1242780 bm!61364) bm!61366))

(assert (= (or b!1242787 bm!61366) bm!61365))

(assert (= (and bm!61365 c!121704) b!1242786))

(assert (= (and bm!61365 (not c!121704)) b!1242785))

(assert (= (and d!136897 res!828758) b!1242781))

(assert (= (and b!1242781 res!828757) b!1242778))

(declare-fun m!1145449 () Bool)

(assert (=> b!1242781 m!1145449))

(declare-fun m!1145451 () Bool)

(assert (=> b!1242786 m!1145451))

(declare-fun m!1145453 () Bool)

(assert (=> bm!61365 m!1145453))

(declare-fun m!1145455 () Bool)

(assert (=> b!1242778 m!1145455))

(declare-fun m!1145457 () Bool)

(assert (=> d!136897 m!1145457))

(assert (=> d!136897 m!1145441))

(declare-fun m!1145459 () Bool)

(assert (=> d!136897 m!1145459))

(assert (=> b!1242736 d!136897))

(declare-fun b!1242839 () Bool)

(declare-fun e!704556 () List!27375)

(assert (=> b!1242839 (= e!704556 (t!40841 l!644))))

(declare-fun b!1242840 () Bool)

(declare-fun e!704557 () Bool)

(declare-fun lt!562284 () List!27375)

(assert (=> b!1242840 (= e!704557 (not (containsKey!615 lt!562284 key2!15)))))

(declare-fun b!1242841 () Bool)

(declare-fun e!704555 () List!27375)

(assert (=> b!1242841 (= e!704555 Nil!27372)))

(declare-fun b!1242842 () Bool)

(assert (=> b!1242842 (= e!704555 ($colon$colon!630 (removeStrictlySorted!135 (t!40841 l!644) key2!15) (h!28580 l!644)))))

(declare-fun d!136903 () Bool)

(assert (=> d!136903 e!704557))

(declare-fun res!828769 () Bool)

(assert (=> d!136903 (=> (not res!828769) (not e!704557))))

(assert (=> d!136903 (= res!828769 (isStrictlySorted!768 lt!562284))))

(assert (=> d!136903 (= lt!562284 e!704556)))

(declare-fun c!121728 () Bool)

(assert (=> d!136903 (= c!121728 (and (is-Cons!27371 l!644) (= (_1!10157 (h!28580 l!644)) key2!15)))))

(assert (=> d!136903 (isStrictlySorted!768 l!644)))

(assert (=> d!136903 (= (removeStrictlySorted!135 l!644 key2!15) lt!562284)))

(declare-fun b!1242838 () Bool)

(assert (=> b!1242838 (= e!704556 e!704555)))

(declare-fun c!121729 () Bool)

(assert (=> b!1242838 (= c!121729 (and (is-Cons!27371 l!644) (not (= (_1!10157 (h!28580 l!644)) key2!15))))))

(assert (= (and d!136903 c!121728) b!1242839))

(assert (= (and d!136903 (not c!121728)) b!1242838))

(assert (= (and b!1242838 c!121729) b!1242842))

(assert (= (and b!1242838 (not c!121729)) b!1242841))

(assert (= (and d!136903 res!828769) b!1242840))

(declare-fun m!1145473 () Bool)

(assert (=> b!1242840 m!1145473))

(declare-fun m!1145475 () Bool)

(assert (=> b!1242842 m!1145475))

(assert (=> b!1242842 m!1145475))

(declare-fun m!1145477 () Bool)

(assert (=> b!1242842 m!1145477))

(declare-fun m!1145479 () Bool)

(assert (=> d!136903 m!1145479))

(assert (=> d!136903 m!1145439))

(assert (=> b!1242736 d!136903))

(declare-fun b!1242844 () Bool)

(declare-fun e!704564 () List!27375)

(assert (=> b!1242844 (= e!704564 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20)))))

(declare-fun b!1242845 () Bool)

(declare-fun e!704565 () Bool)

(declare-fun lt!562285 () List!27375)

(assert (=> b!1242845 (= e!704565 (not (containsKey!615 lt!562285 key2!15)))))

(declare-fun b!1242847 () Bool)

(declare-fun e!704562 () List!27375)

(assert (=> b!1242847 (= e!704562 Nil!27372)))

(declare-fun b!1242849 () Bool)

(assert (=> b!1242849 (= e!704562 ($colon$colon!630 (removeStrictlySorted!135 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20)) key2!15) (h!28580 (insertStrictlySorted!442 l!644 key1!25 v1!20))))))

(declare-fun d!136907 () Bool)

(assert (=> d!136907 e!704565))

(declare-fun res!828772 () Bool)

(assert (=> d!136907 (=> (not res!828772) (not e!704565))))

(assert (=> d!136907 (= res!828772 (isStrictlySorted!768 lt!562285))))

(assert (=> d!136907 (= lt!562285 e!704564)))

(declare-fun c!121731 () Bool)

(assert (=> d!136907 (= c!121731 (and (is-Cons!27371 (insertStrictlySorted!442 l!644 key1!25 v1!20)) (= (_1!10157 (h!28580 (insertStrictlySorted!442 l!644 key1!25 v1!20))) key2!15)))))

(assert (=> d!136907 (isStrictlySorted!768 (insertStrictlySorted!442 l!644 key1!25 v1!20))))

(assert (=> d!136907 (= (removeStrictlySorted!135 (insertStrictlySorted!442 l!644 key1!25 v1!20) key2!15) lt!562285)))

(declare-fun b!1242843 () Bool)

(assert (=> b!1242843 (= e!704564 e!704562)))

(declare-fun c!121733 () Bool)

(assert (=> b!1242843 (= c!121733 (and (is-Cons!27371 (insertStrictlySorted!442 l!644 key1!25 v1!20)) (not (= (_1!10157 (h!28580 (insertStrictlySorted!442 l!644 key1!25 v1!20))) key2!15))))))

(assert (= (and d!136907 c!121731) b!1242844))

(assert (= (and d!136907 (not c!121731)) b!1242843))

(assert (= (and b!1242843 c!121733) b!1242849))

(assert (= (and b!1242843 (not c!121733)) b!1242847))

(assert (= (and d!136907 res!828772) b!1242845))

(declare-fun m!1145481 () Bool)

(assert (=> b!1242845 m!1145481))

(declare-fun m!1145483 () Bool)

(assert (=> b!1242849 m!1145483))

(assert (=> b!1242849 m!1145483))

(declare-fun m!1145487 () Bool)

(assert (=> b!1242849 m!1145487))

(declare-fun m!1145491 () Bool)

(assert (=> d!136907 m!1145491))

(assert (=> d!136907 m!1145445))

(declare-fun m!1145495 () Bool)

(assert (=> d!136907 m!1145495))

(assert (=> b!1242736 d!136907))

(declare-fun lt!562288 () List!27375)

(declare-fun e!704572 () Bool)

(declare-fun b!1242863 () Bool)

(assert (=> b!1242863 (= e!704572 (contains!7396 lt!562288 (tuple2!20293 key1!25 v1!20)))))

(declare-fun b!1242864 () Bool)

(declare-fun e!704570 () List!27375)

(declare-fun e!704571 () List!27375)

(assert (=> b!1242864 (= e!704570 e!704571)))

(declare-fun c!121739 () Bool)

(assert (=> b!1242864 (= c!121739 (and (is-Cons!27371 l!644) (= (_1!10157 (h!28580 l!644)) key1!25)))))

(declare-fun b!1242865 () Bool)

(declare-fun call!61383 () List!27375)

(assert (=> b!1242865 (= e!704571 call!61383)))

(declare-fun b!1242866 () Bool)

(declare-fun res!828774 () Bool)

(assert (=> b!1242866 (=> (not res!828774) (not e!704572))))

(assert (=> b!1242866 (= res!828774 (containsKey!615 lt!562288 key1!25))))

(declare-fun b!1242867 () Bool)

(declare-fun e!704569 () List!27375)

(declare-fun call!61384 () List!27375)

(assert (=> b!1242867 (= e!704569 call!61384)))

(declare-fun bm!61379 () Bool)

(assert (=> bm!61379 (= call!61384 call!61383)))

(declare-fun d!136909 () Bool)

(assert (=> d!136909 e!704572))

(declare-fun res!828775 () Bool)

(assert (=> d!136909 (=> (not res!828775) (not e!704572))))

(assert (=> d!136909 (= res!828775 (isStrictlySorted!768 lt!562288))))

(assert (=> d!136909 (= lt!562288 e!704570)))

(declare-fun c!121740 () Bool)

(assert (=> d!136909 (= c!121740 (and (is-Cons!27371 l!644) (bvslt (_1!10157 (h!28580 l!644)) key1!25)))))

(assert (=> d!136909 (isStrictlySorted!768 l!644)))

(assert (=> d!136909 (= (insertStrictlySorted!442 l!644 key1!25 v1!20) lt!562288)))

(declare-fun b!1242868 () Bool)

(declare-fun c!121741 () Bool)

(assert (=> b!1242868 (= c!121741 (and (is-Cons!27371 l!644) (bvsgt (_1!10157 (h!28580 l!644)) key1!25)))))

(assert (=> b!1242868 (= e!704571 e!704569)))

(declare-fun b!1242869 () Bool)

(assert (=> b!1242869 (= e!704569 call!61384)))

(declare-fun b!1242870 () Bool)

(declare-fun e!704573 () List!27375)

(assert (=> b!1242870 (= e!704573 (ite c!121739 (t!40841 l!644) (ite c!121741 (Cons!27371 (h!28580 l!644) (t!40841 l!644)) Nil!27372)))))

(declare-fun bm!61380 () Bool)

(declare-fun call!61382 () List!27375)

(assert (=> bm!61380 (= call!61382 ($colon$colon!630 e!704573 (ite c!121740 (h!28580 l!644) (tuple2!20293 key1!25 v1!20))))))

(declare-fun c!121738 () Bool)

(assert (=> bm!61380 (= c!121738 c!121740)))

(declare-fun b!1242871 () Bool)

(assert (=> b!1242871 (= e!704573 (insertStrictlySorted!442 (t!40841 l!644) key1!25 v1!20))))

(declare-fun b!1242872 () Bool)

(assert (=> b!1242872 (= e!704570 call!61382)))

(declare-fun bm!61381 () Bool)

(assert (=> bm!61381 (= call!61383 call!61382)))

(assert (= (and d!136909 c!121740) b!1242872))

(assert (= (and d!136909 (not c!121740)) b!1242864))

(assert (= (and b!1242864 c!121739) b!1242865))

(assert (= (and b!1242864 (not c!121739)) b!1242868))

(assert (= (and b!1242868 c!121741) b!1242869))

(assert (= (and b!1242868 (not c!121741)) b!1242867))

(assert (= (or b!1242869 b!1242867) bm!61379))

(assert (= (or b!1242865 bm!61379) bm!61381))

(assert (= (or b!1242872 bm!61381) bm!61380))

(assert (= (and bm!61380 c!121738) b!1242871))

(assert (= (and bm!61380 (not c!121738)) b!1242870))

(assert (= (and d!136909 res!828775) b!1242866))

(assert (= (and b!1242866 res!828774) b!1242863))

(declare-fun m!1145521 () Bool)

(assert (=> b!1242866 m!1145521))

(declare-fun m!1145523 () Bool)

(assert (=> b!1242871 m!1145523))

(declare-fun m!1145525 () Bool)

(assert (=> bm!61380 m!1145525))

(declare-fun m!1145527 () Bool)

(assert (=> b!1242863 m!1145527))

(declare-fun m!1145529 () Bool)

(assert (=> d!136909 m!1145529))

(assert (=> d!136909 m!1145439))

(assert (=> b!1242736 d!136909))

(declare-fun d!136917 () Bool)

(declare-fun res!828787 () Bool)

(declare-fun e!704590 () Bool)

(assert (=> d!136917 (=> res!828787 e!704590)))

(assert (=> d!136917 (= res!828787 (or (is-Nil!27372 l!644) (is-Nil!27372 (t!40841 l!644))))))

(assert (=> d!136917 (= (isStrictlySorted!768 l!644) e!704590)))

(declare-fun b!1242896 () Bool)

(declare-fun e!704591 () Bool)

(assert (=> b!1242896 (= e!704590 e!704591)))

(declare-fun res!828788 () Bool)

(assert (=> b!1242896 (=> (not res!828788) (not e!704591))))

(assert (=> b!1242896 (= res!828788 (bvslt (_1!10157 (h!28580 l!644)) (_1!10157 (h!28580 (t!40841 l!644)))))))

(declare-fun b!1242897 () Bool)

(assert (=> b!1242897 (= e!704591 (isStrictlySorted!768 (t!40841 l!644)))))

(assert (= (and d!136917 (not res!828787)) b!1242896))

(assert (= (and b!1242896 res!828788) b!1242897))

(declare-fun m!1145541 () Bool)

(assert (=> b!1242897 m!1145541))

(assert (=> b!1242734 d!136917))

(declare-fun b!1242906 () Bool)

(declare-fun e!704596 () Bool)

(declare-fun tp!92774 () Bool)

(assert (=> b!1242906 (= e!704596 (and tp_is_empty!31295 tp!92774))))

(assert (=> b!1242737 (= tp!92771 e!704596)))

(assert (= (and b!1242737 (is-Cons!27371 (t!40841 l!644))) b!1242906))

(push 1)

(assert (not b!1242897))

(assert (not b!1242845))

(assert (not b!1242786))

(assert (not b!1242849))

(assert (not b!1242866))

(assert (not d!136909))

(assert (not bm!61365))

(assert (not b!1242842))

(assert (not bm!61380))

(assert (not b!1242778))

(assert tp_is_empty!31295)

(assert (not b!1242863))

(assert (not b!1242781))

(assert (not b!1242871))

(assert (not b!1242840))

(assert (not d!136907))

(assert (not d!136897))

(assert (not b!1242906))

(assert (not d!136903))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136969 () Bool)

(assert (=> d!136969 (= ($colon$colon!630 (removeStrictlySorted!135 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20)) key2!15) (h!28580 (insertStrictlySorted!442 l!644 key1!25 v1!20))) (Cons!27371 (h!28580 (insertStrictlySorted!442 l!644 key1!25 v1!20)) (removeStrictlySorted!135 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20)) key2!15)))))

(assert (=> b!1242849 d!136969))

(declare-fun b!1243031 () Bool)

(declare-fun e!704690 () List!27375)

(assert (=> b!1243031 (= e!704690 (t!40841 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20))))))

(declare-fun b!1243032 () Bool)

(declare-fun e!704691 () Bool)

(declare-fun lt!562307 () List!27375)

(assert (=> b!1243032 (= e!704691 (not (containsKey!615 lt!562307 key2!15)))))

(declare-fun b!1243033 () Bool)

(declare-fun e!704689 () List!27375)

(assert (=> b!1243033 (= e!704689 Nil!27372)))

(declare-fun b!1243034 () Bool)

(assert (=> b!1243034 (= e!704689 ($colon$colon!630 (removeStrictlySorted!135 (t!40841 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20))) key2!15) (h!28580 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20)))))))

(declare-fun d!136977 () Bool)

(assert (=> d!136977 e!704691))

(declare-fun res!828854 () Bool)

(assert (=> d!136977 (=> (not res!828854) (not e!704691))))

(assert (=> d!136977 (= res!828854 (isStrictlySorted!768 lt!562307))))

(assert (=> d!136977 (= lt!562307 e!704690)))

(declare-fun c!121774 () Bool)

(assert (=> d!136977 (= c!121774 (and (is-Cons!27371 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20))) (= (_1!10157 (h!28580 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20)))) key2!15)))))

(assert (=> d!136977 (isStrictlySorted!768 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20)))))

(assert (=> d!136977 (= (removeStrictlySorted!135 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20)) key2!15) lt!562307)))

(declare-fun b!1243030 () Bool)

(assert (=> b!1243030 (= e!704690 e!704689)))

(declare-fun c!121775 () Bool)

(assert (=> b!1243030 (= c!121775 (and (is-Cons!27371 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20))) (not (= (_1!10157 (h!28580 (t!40841 (insertStrictlySorted!442 l!644 key1!25 v1!20)))) key2!15))))))

(assert (= (and d!136977 c!121774) b!1243031))

(assert (= (and d!136977 (not c!121774)) b!1243030))

(assert (= (and b!1243030 c!121775) b!1243034))

(assert (= (and b!1243030 (not c!121775)) b!1243033))

(assert (= (and d!136977 res!828854) b!1243032))

(declare-fun m!1145655 () Bool)

(assert (=> b!1243032 m!1145655))

(declare-fun m!1145657 () Bool)

(assert (=> b!1243034 m!1145657))

(assert (=> b!1243034 m!1145657))

(declare-fun m!1145659 () Bool)

(assert (=> b!1243034 m!1145659))

(declare-fun m!1145661 () Bool)

(assert (=> d!136977 m!1145661))

(declare-fun m!1145663 () Bool)

(assert (=> d!136977 m!1145663))

(assert (=> b!1242849 d!136977))

(declare-fun d!136985 () Bool)

(declare-fun lt!562314 () Bool)

(declare-fun content!607 (List!27375) (Set tuple2!20292))

(assert (=> d!136985 (= lt!562314 (member (tuple2!20293 key1!25 v1!20) (content!607 lt!562276)))))

(declare-fun e!704725 () Bool)

(assert (=> d!136985 (= lt!562314 e!704725)))

(declare-fun res!828882 () Bool)

(assert (=> d!136985 (=> (not res!828882) (not e!704725))))

(assert (=> d!136985 (= res!828882 (is-Cons!27371 lt!562276))))

(assert (=> d!136985 (= (contains!7396 lt!562276 (tuple2!20293 key1!25 v1!20)) lt!562314)))

(declare-fun b!1243078 () Bool)

(declare-fun e!704726 () Bool)

(assert (=> b!1243078 (= e!704725 e!704726)))

(declare-fun res!828881 () Bool)

(assert (=> b!1243078 (=> res!828881 e!704726)))

(assert (=> b!1243078 (= res!828881 (= (h!28580 lt!562276) (tuple2!20293 key1!25 v1!20)))))

(declare-fun b!1243079 () Bool)

(assert (=> b!1243079 (= e!704726 (contains!7396 (t!40841 lt!562276) (tuple2!20293 key1!25 v1!20)))))

(assert (= (and d!136985 res!828882) b!1243078))

(assert (= (and b!1243078 (not res!828881)) b!1243079))

(declare-fun m!1145701 () Bool)

(assert (=> d!136985 m!1145701))

(declare-fun m!1145703 () Bool)

(assert (=> d!136985 m!1145703))

(declare-fun m!1145705 () Bool)

(assert (=> b!1243079 m!1145705))

(assert (=> b!1242778 d!136985))

(declare-fun d!137007 () Bool)

(declare-fun res!828883 () Bool)

(declare-fun e!704727 () Bool)

(assert (=> d!137007 (=> res!828883 e!704727)))

(assert (=> d!137007 (= res!828883 (or (is-Nil!27372 lt!562288) (is-Nil!27372 (t!40841 lt!562288))))))

(assert (=> d!137007 (= (isStrictlySorted!768 lt!562288) e!704727)))

(declare-fun b!1243080 () Bool)

(declare-fun e!704728 () Bool)

(assert (=> b!1243080 (= e!704727 e!704728)))

(declare-fun res!828884 () Bool)

(assert (=> b!1243080 (=> (not res!828884) (not e!704728))))

(assert (=> b!1243080 (= res!828884 (bvslt (_1!10157 (h!28580 lt!562288)) (_1!10157 (h!28580 (t!40841 lt!562288)))))))

(declare-fun b!1243081 () Bool)

(assert (=> b!1243081 (= e!704728 (isStrictlySorted!768 (t!40841 lt!562288)))))

(assert (= (and d!137007 (not res!828883)) b!1243080))

(assert (= (and b!1243080 res!828884) b!1243081))

(declare-fun m!1145707 () Bool)

(assert (=> b!1243081 m!1145707))

(assert (=> d!136909 d!137007))

(assert (=> d!136909 d!136917))

(declare-fun d!137009 () Bool)

(declare-fun res!828885 () Bool)

(declare-fun e!704729 () Bool)

(assert (=> d!137009 (=> res!828885 e!704729)))

(assert (=> d!137009 (= res!828885 (or (is-Nil!27372 lt!562284) (is-Nil!27372 (t!40841 lt!562284))))))

(assert (=> d!137009 (= (isStrictlySorted!768 lt!562284) e!704729)))

(declare-fun b!1243082 () Bool)

(declare-fun e!704730 () Bool)

(assert (=> b!1243082 (= e!704729 e!704730)))

(declare-fun res!828886 () Bool)

(assert (=> b!1243082 (=> (not res!828886) (not e!704730))))

(assert (=> b!1243082 (= res!828886 (bvslt (_1!10157 (h!28580 lt!562284)) (_1!10157 (h!28580 (t!40841 lt!562284)))))))

(declare-fun b!1243083 () Bool)

(assert (=> b!1243083 (= e!704730 (isStrictlySorted!768 (t!40841 lt!562284)))))

(assert (= (and d!137009 (not res!828885)) b!1243082))

(assert (= (and b!1243082 res!828886) b!1243083))

(declare-fun m!1145719 () Bool)

(assert (=> b!1243083 m!1145719))

(assert (=> d!136903 d!137009))

(assert (=> d!136903 d!136917))

(declare-fun d!137013 () Bool)

(assert (=> d!137013 (= ($colon$colon!630 e!704527 (ite c!121706 (h!28580 (removeStrictlySorted!135 l!644 key2!15)) (tuple2!20293 key1!25 v1!20))) (Cons!27371 (ite c!121706 (h!28580 (removeStrictlySorted!135 l!644 key2!15)) (tuple2!20293 key1!25 v1!20)) e!704527))))

(assert (=> bm!61365 d!137013))

(declare-fun e!704736 () Bool)

(declare-fun lt!562315 () List!27375)

(declare-fun b!1243086 () Bool)

(assert (=> b!1243086 (= e!704736 (contains!7396 lt!562315 (tuple2!20293 key1!25 v1!20)))))

(declare-fun b!1243087 () Bool)

(declare-fun e!704734 () List!27375)

(declare-fun e!704735 () List!27375)

(assert (=> b!1243087 (= e!704734 e!704735)))

(declare-fun c!121785 () Bool)

(assert (=> b!1243087 (= c!121785 (and (is-Cons!27371 (t!40841 (removeStrictlySorted!135 l!644 key2!15))) (= (_1!10157 (h!28580 (t!40841 (removeStrictlySorted!135 l!644 key2!15)))) key1!25)))))

(declare-fun b!1243088 () Bool)

(declare-fun call!61404 () List!27375)

(assert (=> b!1243088 (= e!704735 call!61404)))

(declare-fun b!1243089 () Bool)

(declare-fun res!828889 () Bool)

(assert (=> b!1243089 (=> (not res!828889) (not e!704736))))

(assert (=> b!1243089 (= res!828889 (containsKey!615 lt!562315 key1!25))))

(declare-fun b!1243090 () Bool)

(declare-fun e!704733 () List!27375)

(declare-fun call!61405 () List!27375)

(assert (=> b!1243090 (= e!704733 call!61405)))

(declare-fun bm!61400 () Bool)

(assert (=> bm!61400 (= call!61405 call!61404)))

(declare-fun d!137015 () Bool)

(assert (=> d!137015 e!704736))

(declare-fun res!828890 () Bool)

(assert (=> d!137015 (=> (not res!828890) (not e!704736))))

(assert (=> d!137015 (= res!828890 (isStrictlySorted!768 lt!562315))))

(assert (=> d!137015 (= lt!562315 e!704734)))

(declare-fun c!121786 () Bool)

(assert (=> d!137015 (= c!121786 (and (is-Cons!27371 (t!40841 (removeStrictlySorted!135 l!644 key2!15))) (bvslt (_1!10157 (h!28580 (t!40841 (removeStrictlySorted!135 l!644 key2!15)))) key1!25)))))

(assert (=> d!137015 (isStrictlySorted!768 (t!40841 (removeStrictlySorted!135 l!644 key2!15)))))

(assert (=> d!137015 (= (insertStrictlySorted!442 (t!40841 (removeStrictlySorted!135 l!644 key2!15)) key1!25 v1!20) lt!562315)))

(declare-fun b!1243091 () Bool)

(declare-fun c!121787 () Bool)

(assert (=> b!1243091 (= c!121787 (and (is-Cons!27371 (t!40841 (removeStrictlySorted!135 l!644 key2!15))) (bvsgt (_1!10157 (h!28580 (t!40841 (removeStrictlySorted!135 l!644 key2!15)))) key1!25)))))

(assert (=> b!1243091 (= e!704735 e!704733)))

(declare-fun b!1243092 () Bool)

(assert (=> b!1243092 (= e!704733 call!61405)))

(declare-fun e!704737 () List!27375)

(declare-fun b!1243093 () Bool)

(assert (=> b!1243093 (= e!704737 (ite c!121785 (t!40841 (t!40841 (removeStrictlySorted!135 l!644 key2!15))) (ite c!121787 (Cons!27371 (h!28580 (t!40841 (removeStrictlySorted!135 l!644 key2!15))) (t!40841 (t!40841 (removeStrictlySorted!135 l!644 key2!15)))) Nil!27372)))))

(declare-fun bm!61401 () Bool)

(declare-fun call!61403 () List!27375)

(assert (=> bm!61401 (= call!61403 ($colon$colon!630 e!704737 (ite c!121786 (h!28580 (t!40841 (removeStrictlySorted!135 l!644 key2!15))) (tuple2!20293 key1!25 v1!20))))))

(declare-fun c!121784 () Bool)

(assert (=> bm!61401 (= c!121784 c!121786)))

(declare-fun b!1243094 () Bool)

(assert (=> b!1243094 (= e!704737 (insertStrictlySorted!442 (t!40841 (t!40841 (removeStrictlySorted!135 l!644 key2!15))) key1!25 v1!20))))

(declare-fun b!1243095 () Bool)

(assert (=> b!1243095 (= e!704734 call!61403)))

(declare-fun bm!61402 () Bool)

(assert (=> bm!61402 (= call!61404 call!61403)))

(assert (= (and d!137015 c!121786) b!1243095))

(assert (= (and d!137015 (not c!121786)) b!1243087))

(assert (= (and b!1243087 c!121785) b!1243088))

(assert (= (and b!1243087 (not c!121785)) b!1243091))

(assert (= (and b!1243091 c!121787) b!1243092))

(assert (= (and b!1243091 (not c!121787)) b!1243090))

(assert (= (or b!1243092 b!1243090) bm!61400))

(assert (= (or b!1243088 bm!61400) bm!61402))

(assert (= (or b!1243095 bm!61402) bm!61401))

(assert (= (and bm!61401 c!121784) b!1243094))

(assert (= (and bm!61401 (not c!121784)) b!1243093))

(assert (= (and d!137015 res!828890) b!1243089))

(assert (= (and b!1243089 res!828889) b!1243086))

(declare-fun m!1145723 () Bool)

(assert (=> b!1243089 m!1145723))

(declare-fun m!1145727 () Bool)

(assert (=> b!1243094 m!1145727))

(declare-fun m!1145731 () Bool)

(assert (=> bm!61401 m!1145731))

(declare-fun m!1145735 () Bool)

(assert (=> b!1243086 m!1145735))

(declare-fun m!1145739 () Bool)

(assert (=> d!137015 m!1145739))

(declare-fun m!1145741 () Bool)

(assert (=> d!137015 m!1145741))

(assert (=> b!1242786 d!137015))

(declare-fun d!137021 () Bool)

(declare-fun res!828900 () Bool)

(declare-fun e!704750 () Bool)

(assert (=> d!137021 (=> res!828900 e!704750)))

(assert (=> d!137021 (= res!828900 (and (is-Cons!27371 lt!562288) (= (_1!10157 (h!28580 lt!562288)) key1!25)))))

(assert (=> d!137021 (= (containsKey!615 lt!562288 key1!25) e!704750)))

(declare-fun b!1243110 () Bool)

(declare-fun e!704751 () Bool)

(assert (=> b!1243110 (= e!704750 e!704751)))

(declare-fun res!828901 () Bool)

(assert (=> b!1243110 (=> (not res!828901) (not e!704751))))

(assert (=> b!1243110 (= res!828901 (and (or (not (is-Cons!27371 lt!562288)) (bvsle (_1!10157 (h!28580 lt!562288)) key1!25)) (is-Cons!27371 lt!562288) (bvslt (_1!10157 (h!28580 lt!562288)) key1!25)))))

(declare-fun b!1243111 () Bool)

(assert (=> b!1243111 (= e!704751 (containsKey!615 (t!40841 lt!562288) key1!25))))

(assert (= (and d!137021 (not res!828900)) b!1243110))

(assert (= (and b!1243110 res!828901) b!1243111))

(declare-fun m!1145747 () Bool)

(assert (=> b!1243111 m!1145747))

(assert (=> b!1242866 d!137021))

(declare-fun d!137027 () Bool)

(declare-fun res!828902 () Bool)

(declare-fun e!704752 () Bool)

(assert (=> d!137027 (=> res!828902 e!704752)))

(assert (=> d!137027 (= res!828902 (and (is-Cons!27371 lt!562285) (= (_1!10157 (h!28580 lt!562285)) key2!15)))))

(assert (=> d!137027 (= (containsKey!615 lt!562285 key2!15) e!704752)))

(declare-fun b!1243112 () Bool)

(declare-fun e!704753 () Bool)

(assert (=> b!1243112 (= e!704752 e!704753)))

(declare-fun res!828903 () Bool)

(assert (=> b!1243112 (=> (not res!828903) (not e!704753))))

(assert (=> b!1243112 (= res!828903 (and (or (not (is-Cons!27371 lt!562285)) (bvsle (_1!10157 (h!28580 lt!562285)) key2!15)) (is-Cons!27371 lt!562285) (bvslt (_1!10157 (h!28580 lt!562285)) key2!15)))))

(declare-fun b!1243113 () Bool)

(assert (=> b!1243113 (= e!704753 (containsKey!615 (t!40841 lt!562285) key2!15))))

(assert (= (and d!137027 (not res!828902)) b!1243112))

(assert (= (and b!1243112 res!828903) b!1243113))

(declare-fun m!1145749 () Bool)

(assert (=> b!1243113 m!1145749))

(assert (=> b!1242845 d!137027))

(declare-fun d!137029 () Bool)

(declare-fun res!828904 () Bool)

(declare-fun e!704754 () Bool)

(assert (=> d!137029 (=> res!828904 e!704754)))

(assert (=> d!137029 (= res!828904 (or (is-Nil!27372 (t!40841 l!644)) (is-Nil!27372 (t!40841 (t!40841 l!644)))))))

(assert (=> d!137029 (= (isStrictlySorted!768 (t!40841 l!644)) e!704754)))

(declare-fun b!1243114 () Bool)

(declare-fun e!704755 () Bool)

(assert (=> b!1243114 (= e!704754 e!704755)))

(declare-fun res!828905 () Bool)

(assert (=> b!1243114 (=> (not res!828905) (not e!704755))))

(assert (=> b!1243114 (= res!828905 (bvslt (_1!10157 (h!28580 (t!40841 l!644))) (_1!10157 (h!28580 (t!40841 (t!40841 l!644))))))))

(declare-fun b!1243115 () Bool)

(assert (=> b!1243115 (= e!704755 (isStrictlySorted!768 (t!40841 (t!40841 l!644))))))

(assert (= (and d!137029 (not res!828904)) b!1243114))

(assert (= (and b!1243114 res!828905) b!1243115))

(declare-fun m!1145751 () Bool)

(assert (=> b!1243115 m!1145751))

(assert (=> b!1242897 d!137029))

(declare-fun b!1243116 () Bool)

(declare-fun e!704759 () Bool)

(declare-fun lt!562317 () List!27375)

(assert (=> b!1243116 (= e!704759 (contains!7396 lt!562317 (tuple2!20293 key1!25 v1!20)))))

(declare-fun b!1243117 () Bool)

(declare-fun e!704757 () List!27375)

(declare-fun e!704758 () List!27375)

(assert (=> b!1243117 (= e!704757 e!704758)))

(declare-fun c!121791 () Bool)

(assert (=> b!1243117 (= c!121791 (and (is-Cons!27371 (t!40841 l!644)) (= (_1!10157 (h!28580 (t!40841 l!644))) key1!25)))))

(declare-fun b!1243118 () Bool)

(declare-fun call!61407 () List!27375)

(assert (=> b!1243118 (= e!704758 call!61407)))

(declare-fun b!1243119 () Bool)

(declare-fun res!828906 () Bool)

(assert (=> b!1243119 (=> (not res!828906) (not e!704759))))

(assert (=> b!1243119 (= res!828906 (containsKey!615 lt!562317 key1!25))))

(declare-fun b!1243120 () Bool)

(declare-fun e!704756 () List!27375)

(declare-fun call!61408 () List!27375)

(assert (=> b!1243120 (= e!704756 call!61408)))

(declare-fun bm!61403 () Bool)

(assert (=> bm!61403 (= call!61408 call!61407)))

(declare-fun d!137031 () Bool)

(assert (=> d!137031 e!704759))

(declare-fun res!828907 () Bool)

(assert (=> d!137031 (=> (not res!828907) (not e!704759))))

(assert (=> d!137031 (= res!828907 (isStrictlySorted!768 lt!562317))))

(assert (=> d!137031 (= lt!562317 e!704757)))

(declare-fun c!121792 () Bool)

(assert (=> d!137031 (= c!121792 (and (is-Cons!27371 (t!40841 l!644)) (bvslt (_1!10157 (h!28580 (t!40841 l!644))) key1!25)))))

(assert (=> d!137031 (isStrictlySorted!768 (t!40841 l!644))))

(assert (=> d!137031 (= (insertStrictlySorted!442 (t!40841 l!644) key1!25 v1!20) lt!562317)))

(declare-fun b!1243121 () Bool)

(declare-fun c!121793 () Bool)

(assert (=> b!1243121 (= c!121793 (and (is-Cons!27371 (t!40841 l!644)) (bvsgt (_1!10157 (h!28580 (t!40841 l!644))) key1!25)))))

(assert (=> b!1243121 (= e!704758 e!704756)))

(declare-fun b!1243122 () Bool)

(assert (=> b!1243122 (= e!704756 call!61408)))

(declare-fun e!704760 () List!27375)

(declare-fun b!1243123 () Bool)

(assert (=> b!1243123 (= e!704760 (ite c!121791 (t!40841 (t!40841 l!644)) (ite c!121793 (Cons!27371 (h!28580 (t!40841 l!644)) (t!40841 (t!40841 l!644))) Nil!27372)))))

(declare-fun call!61406 () List!27375)

(declare-fun bm!61404 () Bool)

(assert (=> bm!61404 (= call!61406 ($colon$colon!630 e!704760 (ite c!121792 (h!28580 (t!40841 l!644)) (tuple2!20293 key1!25 v1!20))))))

(declare-fun c!121790 () Bool)

(assert (=> bm!61404 (= c!121790 c!121792)))

(declare-fun b!1243124 () Bool)

(assert (=> b!1243124 (= e!704760 (insertStrictlySorted!442 (t!40841 (t!40841 l!644)) key1!25 v1!20))))

(declare-fun b!1243125 () Bool)

(assert (=> b!1243125 (= e!704757 call!61406)))

(declare-fun bm!61405 () Bool)

(assert (=> bm!61405 (= call!61407 call!61406)))

(assert (= (and d!137031 c!121792) b!1243125))

(assert (= (and d!137031 (not c!121792)) b!1243117))

(assert (= (and b!1243117 c!121791) b!1243118))

(assert (= (and b!1243117 (not c!121791)) b!1243121))

(assert (= (and b!1243121 c!121793) b!1243122))

(assert (= (and b!1243121 (not c!121793)) b!1243120))

(assert (= (or b!1243122 b!1243120) bm!61403))

(assert (= (or b!1243118 bm!61403) bm!61405))

(assert (= (or b!1243125 bm!61405) bm!61404))

(assert (= (and bm!61404 c!121790) b!1243124))

(assert (= (and bm!61404 (not c!121790)) b!1243123))

(assert (= (and d!137031 res!828907) b!1243119))

(assert (= (and b!1243119 res!828906) b!1243116))

(declare-fun m!1145753 () Bool)

(assert (=> b!1243119 m!1145753))

(declare-fun m!1145755 () Bool)

(assert (=> b!1243124 m!1145755))

(declare-fun m!1145757 () Bool)

(assert (=> bm!61404 m!1145757))

(declare-fun m!1145759 () Bool)

(assert (=> b!1243116 m!1145759))

(declare-fun m!1145761 () Bool)

(assert (=> d!137031 m!1145761))

(assert (=> d!137031 m!1145541))

(assert (=> b!1242871 d!137031))

(declare-fun d!137033 () Bool)

(declare-fun res!828908 () Bool)

(declare-fun e!704761 () Bool)

(assert (=> d!137033 (=> res!828908 e!704761)))

(assert (=> d!137033 (= res!828908 (or (is-Nil!27372 lt!562276) (is-Nil!27372 (t!40841 lt!562276))))))

(assert (=> d!137033 (= (isStrictlySorted!768 lt!562276) e!704761)))

(declare-fun b!1243126 () Bool)

(declare-fun e!704762 () Bool)

(assert (=> b!1243126 (= e!704761 e!704762)))

(declare-fun res!828909 () Bool)

(assert (=> b!1243126 (=> (not res!828909) (not e!704762))))

(assert (=> b!1243126 (= res!828909 (bvslt (_1!10157 (h!28580 lt!562276)) (_1!10157 (h!28580 (t!40841 lt!562276)))))))

(declare-fun b!1243127 () Bool)

(assert (=> b!1243127 (= e!704762 (isStrictlySorted!768 (t!40841 lt!562276)))))

(assert (= (and d!137033 (not res!828908)) b!1243126))

(assert (= (and b!1243126 res!828909) b!1243127))

(declare-fun m!1145763 () Bool)

(assert (=> b!1243127 m!1145763))

(assert (=> d!136897 d!137033))

(declare-fun d!137035 () Bool)

(declare-fun res!828910 () Bool)

(declare-fun e!704763 () Bool)

(assert (=> d!137035 (=> res!828910 e!704763)))

(assert (=> d!137035 (= res!828910 (or (is-Nil!27372 (removeStrictlySorted!135 l!644 key2!15)) (is-Nil!27372 (t!40841 (removeStrictlySorted!135 l!644 key2!15)))))))

(assert (=> d!137035 (= (isStrictlySorted!768 (removeStrictlySorted!135 l!644 key2!15)) e!704763)))

(declare-fun b!1243128 () Bool)

(declare-fun e!704764 () Bool)

(assert (=> b!1243128 (= e!704763 e!704764)))

(declare-fun res!828911 () Bool)

(assert (=> b!1243128 (=> (not res!828911) (not e!704764))))

(assert (=> b!1243128 (= res!828911 (bvslt (_1!10157 (h!28580 (removeStrictlySorted!135 l!644 key2!15))) (_1!10157 (h!28580 (t!40841 (removeStrictlySorted!135 l!644 key2!15))))))))

(declare-fun b!1243129 () Bool)

(assert (=> b!1243129 (= e!704764 (isStrictlySorted!768 (t!40841 (removeStrictlySorted!135 l!644 key2!15))))))

(assert (= (and d!137035 (not res!828910)) b!1243128))

(assert (= (and b!1243128 res!828911) b!1243129))

(assert (=> b!1243129 m!1145741))

(assert (=> d!136897 d!137035))

(declare-fun d!137037 () Bool)

(declare-fun lt!562318 () Bool)

(assert (=> d!137037 (= lt!562318 (member (tuple2!20293 key1!25 v1!20) (content!607 lt!562288)))))

(declare-fun e!704765 () Bool)

(assert (=> d!137037 (= lt!562318 e!704765)))

(declare-fun res!828913 () Bool)

(assert (=> d!137037 (=> (not res!828913) (not e!704765))))

(assert (=> d!137037 (= res!828913 (is-Cons!27371 lt!562288))))

(assert (=> d!137037 (= (contains!7396 lt!562288 (tuple2!20293 key1!25 v1!20)) lt!562318)))

(declare-fun b!1243130 () Bool)

(declare-fun e!704766 () Bool)

(assert (=> b!1243130 (= e!704765 e!704766)))

(declare-fun res!828912 () Bool)

(assert (=> b!1243130 (=> res!828912 e!704766)))

(assert (=> b!1243130 (= res!828912 (= (h!28580 lt!562288) (tuple2!20293 key1!25 v1!20)))))

(declare-fun b!1243131 () Bool)

(assert (=> b!1243131 (= e!704766 (contains!7396 (t!40841 lt!562288) (tuple2!20293 key1!25 v1!20)))))

(assert (= (and d!137037 res!828913) b!1243130))

(assert (= (and b!1243130 (not res!828912)) b!1243131))

(declare-fun m!1145765 () Bool)

(assert (=> d!137037 m!1145765))

(declare-fun m!1145767 () Bool)

(assert (=> d!137037 m!1145767))

(declare-fun m!1145769 () Bool)

(assert (=> b!1243131 m!1145769))

(assert (=> b!1242863 d!137037))

(declare-fun d!137039 () Bool)

(assert (=> d!137039 (= ($colon$colon!630 e!704573 (ite c!121740 (h!28580 l!644) (tuple2!20293 key1!25 v1!20))) (Cons!27371 (ite c!121740 (h!28580 l!644) (tuple2!20293 key1!25 v1!20)) e!704573))))

(assert (=> bm!61380 d!137039))

(declare-fun d!137041 () Bool)

(assert (=> d!137041 (= ($colon$colon!630 (removeStrictlySorted!135 (t!40841 l!644) key2!15) (h!28580 l!644)) (Cons!27371 (h!28580 l!644) (removeStrictlySorted!135 (t!40841 l!644) key2!15)))))

(assert (=> b!1242842 d!137041))

(declare-fun b!1243133 () Bool)

(declare-fun e!704768 () List!27375)

(assert (=> b!1243133 (= e!704768 (t!40841 (t!40841 l!644)))))

(declare-fun b!1243134 () Bool)

(declare-fun e!704769 () Bool)

(declare-fun lt!562319 () List!27375)

(assert (=> b!1243134 (= e!704769 (not (containsKey!615 lt!562319 key2!15)))))

(declare-fun b!1243135 () Bool)

(declare-fun e!704767 () List!27375)

(assert (=> b!1243135 (= e!704767 Nil!27372)))

(declare-fun b!1243136 () Bool)

(assert (=> b!1243136 (= e!704767 ($colon$colon!630 (removeStrictlySorted!135 (t!40841 (t!40841 l!644)) key2!15) (h!28580 (t!40841 l!644))))))

(declare-fun d!137043 () Bool)

(assert (=> d!137043 e!704769))

(declare-fun res!828914 () Bool)

(assert (=> d!137043 (=> (not res!828914) (not e!704769))))

(assert (=> d!137043 (= res!828914 (isStrictlySorted!768 lt!562319))))

(assert (=> d!137043 (= lt!562319 e!704768)))

(declare-fun c!121794 () Bool)

(assert (=> d!137043 (= c!121794 (and (is-Cons!27371 (t!40841 l!644)) (= (_1!10157 (h!28580 (t!40841 l!644))) key2!15)))))

(assert (=> d!137043 (isStrictlySorted!768 (t!40841 l!644))))

(assert (=> d!137043 (= (removeStrictlySorted!135 (t!40841 l!644) key2!15) lt!562319)))

(declare-fun b!1243132 () Bool)

(assert (=> b!1243132 (= e!704768 e!704767)))

(declare-fun c!121795 () Bool)

(assert (=> b!1243132 (= c!121795 (and (is-Cons!27371 (t!40841 l!644)) (not (= (_1!10157 (h!28580 (t!40841 l!644))) key2!15))))))

