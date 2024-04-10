; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103800 () Bool)

(assert start!103800)

(declare-datatypes ((B!1892 0))(
  ( (B!1893 (val!15708 Int)) )
))
(declare-fun v1!20 () B!1892)

(declare-fun e!704489 () Bool)

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun b!1242712 () Bool)

(declare-datatypes ((tuple2!20288 0))(
  ( (tuple2!20289 (_1!10155 (_ BitVec 64)) (_2!10155 B!1892)) )
))
(declare-datatypes ((List!27373 0))(
  ( (Nil!27370) (Cons!27369 (h!28578 tuple2!20288) (t!40839 List!27373)) )
))
(declare-fun l!644 () List!27373)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun insertStrictlySorted!440 (List!27373 (_ BitVec 64) B!1892) List!27373)

(declare-fun removeStrictlySorted!133 (List!27373 (_ BitVec 64)) List!27373)

(assert (=> b!1242712 (= e!704489 (not (= (insertStrictlySorted!440 (removeStrictlySorted!133 l!644 key2!15) key1!25 v1!20) (removeStrictlySorted!133 (insertStrictlySorted!440 l!644 key1!25 v1!20) key2!15))))))

(declare-fun res!828730 () Bool)

(assert (=> start!103800 (=> (not res!828730) (not e!704489))))

(assert (=> start!103800 (= res!828730 (not (= key1!25 key2!15)))))

(assert (=> start!103800 e!704489))

(assert (=> start!103800 true))

(declare-fun e!704490 () Bool)

(assert (=> start!103800 e!704490))

(declare-fun tp_is_empty!31291 () Bool)

(assert (=> start!103800 tp_is_empty!31291))

(declare-fun b!1242710 () Bool)

(declare-fun res!828728 () Bool)

(assert (=> b!1242710 (=> (not res!828728) (not e!704489))))

(declare-fun isStrictlySorted!766 (List!27373) Bool)

(assert (=> b!1242710 (= res!828728 (isStrictlySorted!766 l!644))))

(declare-fun b!1242711 () Bool)

(declare-fun res!828729 () Bool)

(assert (=> b!1242711 (=> (not res!828729) (not e!704489))))

(assert (=> b!1242711 (= res!828729 (not (is-Cons!27369 l!644)))))

(declare-fun b!1242713 () Bool)

(declare-fun tp!92765 () Bool)

(assert (=> b!1242713 (= e!704490 (and tp_is_empty!31291 tp!92765))))

(assert (= (and start!103800 res!828730) b!1242710))

(assert (= (and b!1242710 res!828728) b!1242711))

(assert (= (and b!1242711 res!828729) b!1242712))

(assert (= (and start!103800 (is-Cons!27369 l!644)) b!1242713))

(declare-fun m!1145419 () Bool)

(assert (=> b!1242712 m!1145419))

(assert (=> b!1242712 m!1145419))

(declare-fun m!1145421 () Bool)

(assert (=> b!1242712 m!1145421))

(declare-fun m!1145423 () Bool)

(assert (=> b!1242712 m!1145423))

(assert (=> b!1242712 m!1145423))

(declare-fun m!1145425 () Bool)

(assert (=> b!1242712 m!1145425))

(declare-fun m!1145427 () Bool)

(assert (=> b!1242710 m!1145427))

(push 1)

(assert (not b!1242712))

(assert (not b!1242710))

(assert (not b!1242713))

(assert tp_is_empty!31291)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1242788 () Bool)

(declare-fun e!704530 () List!27373)

(declare-fun call!61371 () List!27373)

(assert (=> b!1242788 (= e!704530 call!61371)))

(declare-fun b!1242789 () Bool)

(assert (=> b!1242789 (= e!704530 call!61371)))

(declare-fun b!1242790 () Bool)

(declare-fun c!121711 () Bool)

(assert (=> b!1242790 (= c!121711 (and (is-Cons!27369 (removeStrictlySorted!133 l!644 key2!15)) (bvsgt (_1!10155 (h!28578 (removeStrictlySorted!133 l!644 key2!15))) key1!25)))))

(declare-fun e!704528 () List!27373)

(assert (=> b!1242790 (= e!704528 e!704530)))

(declare-fun b!1242791 () Bool)

(declare-fun call!61372 () List!27373)

(assert (=> b!1242791 (= e!704528 call!61372)))

(declare-fun bm!61367 () Bool)

(assert (=> bm!61367 (= call!61371 call!61372)))

(declare-fun b!1242792 () Bool)

(declare-fun res!828759 () Bool)

(declare-fun e!704531 () Bool)

(assert (=> b!1242792 (=> (not res!828759) (not e!704531))))

(declare-fun lt!562277 () List!27373)

(declare-fun containsKey!616 (List!27373 (_ BitVec 64)) Bool)

(assert (=> b!1242792 (= res!828759 (containsKey!616 lt!562277 key1!25))))

(declare-fun b!1242793 () Bool)

(declare-fun e!704529 () List!27373)

(declare-fun call!61370 () List!27373)

(assert (=> b!1242793 (= e!704529 call!61370)))

(declare-fun d!136899 () Bool)

(assert (=> d!136899 e!704531))

(declare-fun res!828760 () Bool)

(assert (=> d!136899 (=> (not res!828760) (not e!704531))))

(assert (=> d!136899 (= res!828760 (isStrictlySorted!766 lt!562277))))

(assert (=> d!136899 (= lt!562277 e!704529)))

(declare-fun c!121709 () Bool)

(assert (=> d!136899 (= c!121709 (and (is-Cons!27369 (removeStrictlySorted!133 l!644 key2!15)) (bvslt (_1!10155 (h!28578 (removeStrictlySorted!133 l!644 key2!15))) key1!25)))))

(assert (=> d!136899 (isStrictlySorted!766 (removeStrictlySorted!133 l!644 key2!15))))

(assert (=> d!136899 (= (insertStrictlySorted!440 (removeStrictlySorted!133 l!644 key2!15) key1!25 v1!20) lt!562277)))

(declare-fun b!1242794 () Bool)

(declare-fun e!704532 () List!27373)

(declare-fun c!121710 () Bool)

(assert (=> b!1242794 (= e!704532 (ite c!121710 (t!40839 (removeStrictlySorted!133 l!644 key2!15)) (ite c!121711 (Cons!27369 (h!28578 (removeStrictlySorted!133 l!644 key2!15)) (t!40839 (removeStrictlySorted!133 l!644 key2!15))) Nil!27370)))))

(declare-fun bm!61368 () Bool)

(assert (=> bm!61368 (= call!61372 call!61370)))

(declare-fun b!1242795 () Bool)

(assert (=> b!1242795 (= e!704532 (insertStrictlySorted!440 (t!40839 (removeStrictlySorted!133 l!644 key2!15)) key1!25 v1!20))))

(declare-fun b!1242796 () Bool)

(assert (=> b!1242796 (= e!704529 e!704528)))

(assert (=> b!1242796 (= c!121710 (and (is-Cons!27369 (removeStrictlySorted!133 l!644 key2!15)) (= (_1!10155 (h!28578 (removeStrictlySorted!133 l!644 key2!15))) key1!25)))))

(declare-fun bm!61369 () Bool)

(declare-fun $colon$colon!629 (List!27373 tuple2!20288) List!27373)

(assert (=> bm!61369 (= call!61370 ($colon$colon!629 e!704532 (ite c!121709 (h!28578 (removeStrictlySorted!133 l!644 key2!15)) (tuple2!20289 key1!25 v1!20))))))

(declare-fun c!121708 () Bool)

(assert (=> bm!61369 (= c!121708 c!121709)))

(declare-fun b!1242797 () Bool)

(declare-fun contains!7397 (List!27373 tuple2!20288) Bool)

(assert (=> b!1242797 (= e!704531 (contains!7397 lt!562277 (tuple2!20289 key1!25 v1!20)))))

(assert (= (and d!136899 c!121709) b!1242793))

(assert (= (and d!136899 (not c!121709)) b!1242796))

(assert (= (and b!1242796 c!121710) b!1242791))

(assert (= (and b!1242796 (not c!121710)) b!1242790))

(assert (= (and b!1242790 c!121711) b!1242788))

(assert (= (and b!1242790 (not c!121711)) b!1242789))

(assert (= (or b!1242788 b!1242789) bm!61367))

(assert (= (or b!1242791 bm!61367) bm!61368))

(assert (= (or b!1242793 bm!61368) bm!61369))

(assert (= (and bm!61369 c!121708) b!1242795))

(assert (= (and bm!61369 (not c!121708)) b!1242794))

(assert (= (and d!136899 res!828760) b!1242792))

(assert (= (and b!1242792 res!828759) b!1242797))

(declare-fun m!1145461 () Bool)

(assert (=> b!1242795 m!1145461))

(declare-fun m!1145463 () Bool)

(assert (=> b!1242797 m!1145463))

(declare-fun m!1145465 () Bool)

(assert (=> bm!61369 m!1145465))

(declare-fun m!1145467 () Bool)

(assert (=> d!136899 m!1145467))

(assert (=> d!136899 m!1145419))

(declare-fun m!1145469 () Bool)

(assert (=> d!136899 m!1145469))

(declare-fun m!1145471 () Bool)

(assert (=> b!1242792 m!1145471))

(assert (=> b!1242712 d!136899))

(declare-fun b!1242858 () Bool)

(declare-fun e!704567 () Bool)

(declare-fun lt!562287 () List!27373)

(assert (=> b!1242858 (= e!704567 (not (containsKey!616 lt!562287 key2!15)))))

(declare-fun d!136905 () Bool)

(assert (=> d!136905 e!704567))

(declare-fun res!828773 () Bool)

(assert (=> d!136905 (=> (not res!828773) (not e!704567))))

(assert (=> d!136905 (= res!828773 (isStrictlySorted!766 lt!562287))))

(declare-fun e!704568 () List!27373)

(assert (=> d!136905 (= lt!562287 e!704568)))

(declare-fun c!121736 () Bool)

(assert (=> d!136905 (= c!121736 (and (is-Cons!27369 l!644) (= (_1!10155 (h!28578 l!644)) key2!15)))))

(assert (=> d!136905 (isStrictlySorted!766 l!644)))

(assert (=> d!136905 (= (removeStrictlySorted!133 l!644 key2!15) lt!562287)))

(declare-fun b!1242859 () Bool)

(declare-fun e!704566 () List!27373)

(assert (=> b!1242859 (= e!704566 ($colon$colon!629 (removeStrictlySorted!133 (t!40839 l!644) key2!15) (h!28578 l!644)))))

(declare-fun b!1242860 () Bool)

(assert (=> b!1242860 (= e!704568 (t!40839 l!644))))

(declare-fun b!1242861 () Bool)

(assert (=> b!1242861 (= e!704568 e!704566)))

(declare-fun c!121737 () Bool)

(assert (=> b!1242861 (= c!121737 (and (is-Cons!27369 l!644) (not (= (_1!10155 (h!28578 l!644)) key2!15))))))

(declare-fun b!1242862 () Bool)

(assert (=> b!1242862 (= e!704566 Nil!27370)))

(assert (= (and d!136905 c!121736) b!1242860))

(assert (= (and d!136905 (not c!121736)) b!1242861))

(assert (= (and b!1242861 c!121737) b!1242859))

(assert (= (and b!1242861 (not c!121737)) b!1242862))

(assert (= (and d!136905 res!828773) b!1242858))

(declare-fun m!1145485 () Bool)

(assert (=> b!1242858 m!1145485))

(declare-fun m!1145489 () Bool)

(assert (=> d!136905 m!1145489))

(assert (=> d!136905 m!1145427))

(declare-fun m!1145494 () Bool)

(assert (=> b!1242859 m!1145494))

(assert (=> b!1242859 m!1145494))

(declare-fun m!1145497 () Bool)

(assert (=> b!1242859 m!1145497))

(assert (=> b!1242712 d!136905))

(declare-fun b!1242873 () Bool)

(declare-fun e!704575 () Bool)

(declare-fun lt!562289 () List!27373)

(assert (=> b!1242873 (= e!704575 (not (containsKey!616 lt!562289 key2!15)))))

(declare-fun d!136911 () Bool)

(assert (=> d!136911 e!704575))

(declare-fun res!828776 () Bool)

(assert (=> d!136911 (=> (not res!828776) (not e!704575))))

(assert (=> d!136911 (= res!828776 (isStrictlySorted!766 lt!562289))))

(declare-fun e!704576 () List!27373)

(assert (=> d!136911 (= lt!562289 e!704576)))

(declare-fun c!121742 () Bool)

(assert (=> d!136911 (= c!121742 (and (is-Cons!27369 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (= (_1!10155 (h!28578 (insertStrictlySorted!440 l!644 key1!25 v1!20))) key2!15)))))

(assert (=> d!136911 (isStrictlySorted!766 (insertStrictlySorted!440 l!644 key1!25 v1!20))))

(assert (=> d!136911 (= (removeStrictlySorted!133 (insertStrictlySorted!440 l!644 key1!25 v1!20) key2!15) lt!562289)))

(declare-fun b!1242874 () Bool)

(declare-fun e!704574 () List!27373)

(assert (=> b!1242874 (= e!704574 ($colon$colon!629 (removeStrictlySorted!133 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15) (h!28578 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))

(declare-fun b!1242875 () Bool)

(assert (=> b!1242875 (= e!704576 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))

(declare-fun b!1242876 () Bool)

(assert (=> b!1242876 (= e!704576 e!704574)))

(declare-fun c!121743 () Bool)

(assert (=> b!1242876 (= c!121743 (and (is-Cons!27369 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (not (= (_1!10155 (h!28578 (insertStrictlySorted!440 l!644 key1!25 v1!20))) key2!15))))))

(declare-fun b!1242877 () Bool)

(assert (=> b!1242877 (= e!704574 Nil!27370)))

(assert (= (and d!136911 c!121742) b!1242875))

(assert (= (and d!136911 (not c!121742)) b!1242876))

(assert (= (and b!1242876 c!121743) b!1242874))

(assert (= (and b!1242876 (not c!121743)) b!1242877))

(assert (= (and d!136911 res!828776) b!1242873))

(declare-fun m!1145511 () Bool)

(assert (=> b!1242873 m!1145511))

(declare-fun m!1145513 () Bool)

(assert (=> d!136911 m!1145513))

(assert (=> d!136911 m!1145423))

(declare-fun m!1145515 () Bool)

(assert (=> d!136911 m!1145515))

(declare-fun m!1145517 () Bool)

(assert (=> b!1242874 m!1145517))

(assert (=> b!1242874 m!1145517))

(declare-fun m!1145519 () Bool)

(assert (=> b!1242874 m!1145519))

(assert (=> b!1242712 d!136911))

(declare-fun b!1242878 () Bool)

(declare-fun e!704579 () List!27373)

(declare-fun call!61386 () List!27373)

(assert (=> b!1242878 (= e!704579 call!61386)))

(declare-fun b!1242879 () Bool)

(assert (=> b!1242879 (= e!704579 call!61386)))

(declare-fun b!1242880 () Bool)

(declare-fun c!121747 () Bool)

(assert (=> b!1242880 (= c!121747 (and (is-Cons!27369 l!644) (bvsgt (_1!10155 (h!28578 l!644)) key1!25)))))

(declare-fun e!704577 () List!27373)

(assert (=> b!1242880 (= e!704577 e!704579)))

(declare-fun b!1242881 () Bool)

(declare-fun call!61387 () List!27373)

(assert (=> b!1242881 (= e!704577 call!61387)))

(declare-fun bm!61382 () Bool)

(assert (=> bm!61382 (= call!61386 call!61387)))

(declare-fun b!1242882 () Bool)

(declare-fun res!828777 () Bool)

(declare-fun e!704580 () Bool)

(assert (=> b!1242882 (=> (not res!828777) (not e!704580))))

(declare-fun lt!562290 () List!27373)

(assert (=> b!1242882 (= res!828777 (containsKey!616 lt!562290 key1!25))))

(declare-fun b!1242883 () Bool)

(declare-fun e!704578 () List!27373)

(declare-fun call!61385 () List!27373)

(assert (=> b!1242883 (= e!704578 call!61385)))

(declare-fun d!136915 () Bool)

(assert (=> d!136915 e!704580))

(declare-fun res!828778 () Bool)

(assert (=> d!136915 (=> (not res!828778) (not e!704580))))

(assert (=> d!136915 (= res!828778 (isStrictlySorted!766 lt!562290))))

(assert (=> d!136915 (= lt!562290 e!704578)))

(declare-fun c!121745 () Bool)

(assert (=> d!136915 (= c!121745 (and (is-Cons!27369 l!644) (bvslt (_1!10155 (h!28578 l!644)) key1!25)))))

(assert (=> d!136915 (isStrictlySorted!766 l!644)))

(assert (=> d!136915 (= (insertStrictlySorted!440 l!644 key1!25 v1!20) lt!562290)))

(declare-fun b!1242884 () Bool)

(declare-fun e!704581 () List!27373)

(declare-fun c!121746 () Bool)

(assert (=> b!1242884 (= e!704581 (ite c!121746 (t!40839 l!644) (ite c!121747 (Cons!27369 (h!28578 l!644) (t!40839 l!644)) Nil!27370)))))

(declare-fun bm!61383 () Bool)

(assert (=> bm!61383 (= call!61387 call!61385)))

(declare-fun b!1242885 () Bool)

(assert (=> b!1242885 (= e!704581 (insertStrictlySorted!440 (t!40839 l!644) key1!25 v1!20))))

(declare-fun b!1242886 () Bool)

(assert (=> b!1242886 (= e!704578 e!704577)))

(assert (=> b!1242886 (= c!121746 (and (is-Cons!27369 l!644) (= (_1!10155 (h!28578 l!644)) key1!25)))))

(declare-fun bm!61384 () Bool)

(assert (=> bm!61384 (= call!61385 ($colon$colon!629 e!704581 (ite c!121745 (h!28578 l!644) (tuple2!20289 key1!25 v1!20))))))

(declare-fun c!121744 () Bool)

(assert (=> bm!61384 (= c!121744 c!121745)))

(declare-fun b!1242887 () Bool)

(assert (=> b!1242887 (= e!704580 (contains!7397 lt!562290 (tuple2!20289 key1!25 v1!20)))))

(assert (= (and d!136915 c!121745) b!1242883))

(assert (= (and d!136915 (not c!121745)) b!1242886))

(assert (= (and b!1242886 c!121746) b!1242881))

(assert (= (and b!1242886 (not c!121746)) b!1242880))

(assert (= (and b!1242880 c!121747) b!1242878))

(assert (= (and b!1242880 (not c!121747)) b!1242879))

(assert (= (or b!1242878 b!1242879) bm!61382))

(assert (= (or b!1242881 bm!61382) bm!61383))

(assert (= (or b!1242883 bm!61383) bm!61384))

(assert (= (and bm!61384 c!121744) b!1242885))

(assert (= (and bm!61384 (not c!121744)) b!1242884))

(assert (= (and d!136915 res!828778) b!1242882))

(assert (= (and b!1242882 res!828777) b!1242887))

(declare-fun m!1145531 () Bool)

(assert (=> b!1242885 m!1145531))

(declare-fun m!1145533 () Bool)

(assert (=> b!1242887 m!1145533))

(declare-fun m!1145535 () Bool)

(assert (=> bm!61384 m!1145535))

(declare-fun m!1145537 () Bool)

(assert (=> d!136915 m!1145537))

(assert (=> d!136915 m!1145427))

(declare-fun m!1145539 () Bool)

(assert (=> b!1242882 m!1145539))

(assert (=> b!1242712 d!136915))

(declare-fun d!136919 () Bool)

(declare-fun res!828789 () Bool)

(declare-fun e!704599 () Bool)

(assert (=> d!136919 (=> res!828789 e!704599)))

(assert (=> d!136919 (= res!828789 (or (is-Nil!27370 l!644) (is-Nil!27370 (t!40839 l!644))))))

(assert (=> d!136919 (= (isStrictlySorted!766 l!644) e!704599)))

(declare-fun b!1242911 () Bool)

(declare-fun e!704600 () Bool)

(assert (=> b!1242911 (= e!704599 e!704600)))

(declare-fun res!828790 () Bool)

(assert (=> b!1242911 (=> (not res!828790) (not e!704600))))

(assert (=> b!1242911 (= res!828790 (bvslt (_1!10155 (h!28578 l!644)) (_1!10155 (h!28578 (t!40839 l!644)))))))

(declare-fun b!1242912 () Bool)

(assert (=> b!1242912 (= e!704600 (isStrictlySorted!766 (t!40839 l!644)))))

(assert (= (and d!136919 (not res!828789)) b!1242911))

(assert (= (and b!1242911 res!828790) b!1242912))

(declare-fun m!1145543 () Bool)

(assert (=> b!1242912 m!1145543))

(assert (=> b!1242710 d!136919))

(declare-fun b!1242919 () Bool)

(declare-fun e!704605 () Bool)

(declare-fun tp!92777 () Bool)

(assert (=> b!1242919 (= e!704605 (and tp_is_empty!31291 tp!92777))))

(assert (=> b!1242713 (= tp!92765 e!704605)))

(assert (= (and b!1242713 (is-Cons!27369 (t!40839 l!644))) b!1242919))

(push 1)

(assert (not d!136905))

(assert (not b!1242885))

(assert (not b!1242882))

(assert (not b!1242797))

(assert (not b!1242792))

(assert (not d!136915))

(assert (not b!1242795))

(assert (not d!136899))

(assert (not d!136911))

(assert (not b!1242919))

(assert (not b!1242912))

(assert (not b!1242858))

(assert (not b!1242874))

(assert (not bm!61369))

(assert (not b!1242873))

(assert tp_is_empty!31291)

(assert (not bm!61384))

(assert (not b!1242859))

(assert (not b!1242887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!562299 () Bool)

(declare-fun d!136933 () Bool)

(declare-fun content!605 (List!27373) (Set tuple2!20288))

(assert (=> d!136933 (= lt!562299 (set.member (tuple2!20289 key1!25 v1!20) (content!605 lt!562277)))))

(declare-fun e!704639 () Bool)

(assert (=> d!136933 (= lt!562299 e!704639)))

(declare-fun res!828815 () Bool)

(assert (=> d!136933 (=> (not res!828815) (not e!704639))))

(assert (=> d!136933 (= res!828815 (is-Cons!27369 lt!562277))))

(assert (=> d!136933 (= (contains!7397 lt!562277 (tuple2!20289 key1!25 v1!20)) lt!562299)))

(declare-fun b!1242966 () Bool)

(declare-fun e!704640 () Bool)

(assert (=> b!1242966 (= e!704639 e!704640)))

(declare-fun res!828814 () Bool)

(assert (=> b!1242966 (=> res!828814 e!704640)))

(assert (=> b!1242966 (= res!828814 (= (h!28578 lt!562277) (tuple2!20289 key1!25 v1!20)))))

(declare-fun b!1242967 () Bool)

(assert (=> b!1242967 (= e!704640 (contains!7397 (t!40839 lt!562277) (tuple2!20289 key1!25 v1!20)))))

(assert (= (and d!136933 res!828815) b!1242966))

(assert (= (and b!1242966 (not res!828814)) b!1242967))

(declare-fun m!1145585 () Bool)

(assert (=> d!136933 m!1145585))

(declare-fun m!1145587 () Bool)

(assert (=> d!136933 m!1145587))

(declare-fun m!1145589 () Bool)

(assert (=> b!1242967 m!1145589))

(assert (=> b!1242797 d!136933))

(declare-fun d!136935 () Bool)

(assert (=> d!136935 (= ($colon$colon!629 (removeStrictlySorted!133 (t!40839 l!644) key2!15) (h!28578 l!644)) (Cons!27369 (h!28578 l!644) (removeStrictlySorted!133 (t!40839 l!644) key2!15)))))

(assert (=> b!1242859 d!136935))

(declare-fun b!1242968 () Bool)

(declare-fun e!704642 () Bool)

(declare-fun lt!562300 () List!27373)

(assert (=> b!1242968 (= e!704642 (not (containsKey!616 lt!562300 key2!15)))))

(declare-fun d!136937 () Bool)

(assert (=> d!136937 e!704642))

(declare-fun res!828816 () Bool)

(assert (=> d!136937 (=> (not res!828816) (not e!704642))))

(assert (=> d!136937 (= res!828816 (isStrictlySorted!766 lt!562300))))

(declare-fun e!704643 () List!27373)

(assert (=> d!136937 (= lt!562300 e!704643)))

(declare-fun c!121762 () Bool)

(assert (=> d!136937 (= c!121762 (and (is-Cons!27369 (t!40839 l!644)) (= (_1!10155 (h!28578 (t!40839 l!644))) key2!15)))))

(assert (=> d!136937 (isStrictlySorted!766 (t!40839 l!644))))

(assert (=> d!136937 (= (removeStrictlySorted!133 (t!40839 l!644) key2!15) lt!562300)))

(declare-fun b!1242969 () Bool)

(declare-fun e!704641 () List!27373)

(assert (=> b!1242969 (= e!704641 ($colon$colon!629 (removeStrictlySorted!133 (t!40839 (t!40839 l!644)) key2!15) (h!28578 (t!40839 l!644))))))

(declare-fun b!1242970 () Bool)

(assert (=> b!1242970 (= e!704643 (t!40839 (t!40839 l!644)))))

(declare-fun b!1242971 () Bool)

(assert (=> b!1242971 (= e!704643 e!704641)))

(declare-fun c!121763 () Bool)

(assert (=> b!1242971 (= c!121763 (and (is-Cons!27369 (t!40839 l!644)) (not (= (_1!10155 (h!28578 (t!40839 l!644))) key2!15))))))

(declare-fun b!1242972 () Bool)

(assert (=> b!1242972 (= e!704641 Nil!27370)))

(assert (= (and d!136937 c!121762) b!1242970))

(assert (= (and d!136937 (not c!121762)) b!1242971))

(assert (= (and b!1242971 c!121763) b!1242969))

(assert (= (and b!1242971 (not c!121763)) b!1242972))

(assert (= (and d!136937 res!828816) b!1242968))

(declare-fun m!1145591 () Bool)

(assert (=> b!1242968 m!1145591))

(declare-fun m!1145593 () Bool)

(assert (=> d!136937 m!1145593))

(assert (=> d!136937 m!1145543))

(declare-fun m!1145595 () Bool)

(assert (=> b!1242969 m!1145595))

(assert (=> b!1242969 m!1145595))

(declare-fun m!1145597 () Bool)

(assert (=> b!1242969 m!1145597))

(assert (=> b!1242859 d!136937))

(declare-fun d!136939 () Bool)

(declare-fun res!828817 () Bool)

(declare-fun e!704644 () Bool)

(assert (=> d!136939 (=> res!828817 e!704644)))

(assert (=> d!136939 (= res!828817 (or (is-Nil!27370 (t!40839 l!644)) (is-Nil!27370 (t!40839 (t!40839 l!644)))))))

(assert (=> d!136939 (= (isStrictlySorted!766 (t!40839 l!644)) e!704644)))

(declare-fun b!1242973 () Bool)

(declare-fun e!704645 () Bool)

(assert (=> b!1242973 (= e!704644 e!704645)))

(declare-fun res!828818 () Bool)

(assert (=> b!1242973 (=> (not res!828818) (not e!704645))))

(assert (=> b!1242973 (= res!828818 (bvslt (_1!10155 (h!28578 (t!40839 l!644))) (_1!10155 (h!28578 (t!40839 (t!40839 l!644))))))))

(declare-fun b!1242974 () Bool)

(assert (=> b!1242974 (= e!704645 (isStrictlySorted!766 (t!40839 (t!40839 l!644))))))

(assert (= (and d!136939 (not res!828817)) b!1242973))

(assert (= (and b!1242973 res!828818) b!1242974))

(declare-fun m!1145599 () Bool)

(assert (=> b!1242974 m!1145599))

(assert (=> b!1242912 d!136939))

(declare-fun d!136941 () Bool)

(declare-fun res!828819 () Bool)

(declare-fun e!704646 () Bool)

(assert (=> d!136941 (=> res!828819 e!704646)))

(assert (=> d!136941 (= res!828819 (or (is-Nil!27370 lt!562289) (is-Nil!27370 (t!40839 lt!562289))))))

(assert (=> d!136941 (= (isStrictlySorted!766 lt!562289) e!704646)))

(declare-fun b!1242975 () Bool)

(declare-fun e!704647 () Bool)

(assert (=> b!1242975 (= e!704646 e!704647)))

(declare-fun res!828820 () Bool)

(assert (=> b!1242975 (=> (not res!828820) (not e!704647))))

(assert (=> b!1242975 (= res!828820 (bvslt (_1!10155 (h!28578 lt!562289)) (_1!10155 (h!28578 (t!40839 lt!562289)))))))

(declare-fun b!1242976 () Bool)

(assert (=> b!1242976 (= e!704647 (isStrictlySorted!766 (t!40839 lt!562289)))))

(assert (= (and d!136941 (not res!828819)) b!1242975))

(assert (= (and b!1242975 res!828820) b!1242976))

(declare-fun m!1145601 () Bool)

(assert (=> b!1242976 m!1145601))

(assert (=> d!136911 d!136941))

(declare-fun d!136943 () Bool)

(declare-fun res!828821 () Bool)

(declare-fun e!704648 () Bool)

(assert (=> d!136943 (=> res!828821 e!704648)))

(assert (=> d!136943 (= res!828821 (or (is-Nil!27370 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (is-Nil!27370 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))))

(assert (=> d!136943 (= (isStrictlySorted!766 (insertStrictlySorted!440 l!644 key1!25 v1!20)) e!704648)))

(declare-fun b!1242977 () Bool)

(declare-fun e!704649 () Bool)

(assert (=> b!1242977 (= e!704648 e!704649)))

(declare-fun res!828822 () Bool)

(assert (=> b!1242977 (=> (not res!828822) (not e!704649))))

(assert (=> b!1242977 (= res!828822 (bvslt (_1!10155 (h!28578 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (_1!10155 (h!28578 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))))

(declare-fun b!1242978 () Bool)

(assert (=> b!1242978 (= e!704649 (isStrictlySorted!766 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))

(assert (= (and d!136943 (not res!828821)) b!1242977))

(assert (= (and b!1242977 res!828822) b!1242978))

(declare-fun m!1145603 () Bool)

(assert (=> b!1242978 m!1145603))

(assert (=> d!136911 d!136943))

(declare-fun b!1242979 () Bool)

(declare-fun e!704652 () List!27373)

(declare-fun call!61392 () List!27373)

(assert (=> b!1242979 (= e!704652 call!61392)))

(declare-fun b!1242980 () Bool)

(assert (=> b!1242980 (= e!704652 call!61392)))

(declare-fun b!1242981 () Bool)

(declare-fun c!121767 () Bool)

(assert (=> b!1242981 (= c!121767 (and (is-Cons!27369 (t!40839 l!644)) (bvsgt (_1!10155 (h!28578 (t!40839 l!644))) key1!25)))))

(declare-fun e!704650 () List!27373)

(assert (=> b!1242981 (= e!704650 e!704652)))

(declare-fun b!1242982 () Bool)

(declare-fun call!61393 () List!27373)

(assert (=> b!1242982 (= e!704650 call!61393)))

(declare-fun bm!61388 () Bool)

(assert (=> bm!61388 (= call!61392 call!61393)))

(declare-fun b!1242983 () Bool)

(declare-fun res!828823 () Bool)

(declare-fun e!704653 () Bool)

(assert (=> b!1242983 (=> (not res!828823) (not e!704653))))

(declare-fun lt!562301 () List!27373)

(assert (=> b!1242983 (= res!828823 (containsKey!616 lt!562301 key1!25))))

(declare-fun b!1242984 () Bool)

(declare-fun e!704651 () List!27373)

(declare-fun call!61391 () List!27373)

(assert (=> b!1242984 (= e!704651 call!61391)))

(declare-fun d!136945 () Bool)

(assert (=> d!136945 e!704653))

(declare-fun res!828824 () Bool)

(assert (=> d!136945 (=> (not res!828824) (not e!704653))))

(assert (=> d!136945 (= res!828824 (isStrictlySorted!766 lt!562301))))

(assert (=> d!136945 (= lt!562301 e!704651)))

(declare-fun c!121765 () Bool)

(assert (=> d!136945 (= c!121765 (and (is-Cons!27369 (t!40839 l!644)) (bvslt (_1!10155 (h!28578 (t!40839 l!644))) key1!25)))))

(assert (=> d!136945 (isStrictlySorted!766 (t!40839 l!644))))

(assert (=> d!136945 (= (insertStrictlySorted!440 (t!40839 l!644) key1!25 v1!20) lt!562301)))

(declare-fun b!1242985 () Bool)

(declare-fun c!121766 () Bool)

(declare-fun e!704654 () List!27373)

(assert (=> b!1242985 (= e!704654 (ite c!121766 (t!40839 (t!40839 l!644)) (ite c!121767 (Cons!27369 (h!28578 (t!40839 l!644)) (t!40839 (t!40839 l!644))) Nil!27370)))))

(declare-fun bm!61389 () Bool)

(assert (=> bm!61389 (= call!61393 call!61391)))

(declare-fun b!1242986 () Bool)

(assert (=> b!1242986 (= e!704654 (insertStrictlySorted!440 (t!40839 (t!40839 l!644)) key1!25 v1!20))))

(declare-fun b!1242987 () Bool)

(assert (=> b!1242987 (= e!704651 e!704650)))

(assert (=> b!1242987 (= c!121766 (and (is-Cons!27369 (t!40839 l!644)) (= (_1!10155 (h!28578 (t!40839 l!644))) key1!25)))))

(declare-fun bm!61390 () Bool)

(assert (=> bm!61390 (= call!61391 ($colon$colon!629 e!704654 (ite c!121765 (h!28578 (t!40839 l!644)) (tuple2!20289 key1!25 v1!20))))))

(declare-fun c!121764 () Bool)

(assert (=> bm!61390 (= c!121764 c!121765)))

(declare-fun b!1242988 () Bool)

(assert (=> b!1242988 (= e!704653 (contains!7397 lt!562301 (tuple2!20289 key1!25 v1!20)))))

(assert (= (and d!136945 c!121765) b!1242984))

(assert (= (and d!136945 (not c!121765)) b!1242987))

(assert (= (and b!1242987 c!121766) b!1242982))

(assert (= (and b!1242987 (not c!121766)) b!1242981))

(assert (= (and b!1242981 c!121767) b!1242979))

(assert (= (and b!1242981 (not c!121767)) b!1242980))

(assert (= (or b!1242979 b!1242980) bm!61388))

(assert (= (or b!1242982 bm!61388) bm!61389))

(assert (= (or b!1242984 bm!61389) bm!61390))

(assert (= (and bm!61390 c!121764) b!1242986))

(assert (= (and bm!61390 (not c!121764)) b!1242985))

(assert (= (and d!136945 res!828824) b!1242983))

(assert (= (and b!1242983 res!828823) b!1242988))

(declare-fun m!1145605 () Bool)

(assert (=> b!1242986 m!1145605))

(declare-fun m!1145607 () Bool)

(assert (=> b!1242988 m!1145607))

(declare-fun m!1145609 () Bool)

(assert (=> bm!61390 m!1145609))

(declare-fun m!1145611 () Bool)

(assert (=> d!136945 m!1145611))

(assert (=> d!136945 m!1145543))

(declare-fun m!1145613 () Bool)

(assert (=> b!1242983 m!1145613))

(assert (=> b!1242885 d!136945))

(declare-fun d!136951 () Bool)

(assert (=> d!136951 (= ($colon$colon!629 e!704532 (ite c!121709 (h!28578 (removeStrictlySorted!133 l!644 key2!15)) (tuple2!20289 key1!25 v1!20))) (Cons!27369 (ite c!121709 (h!28578 (removeStrictlySorted!133 l!644 key2!15)) (tuple2!20289 key1!25 v1!20)) e!704532))))

(assert (=> bm!61369 d!136951))

(declare-fun d!136955 () Bool)

(declare-fun res!828829 () Bool)

(declare-fun e!704659 () Bool)

(assert (=> d!136955 (=> res!828829 e!704659)))

(assert (=> d!136955 (= res!828829 (or (is-Nil!27370 lt!562277) (is-Nil!27370 (t!40839 lt!562277))))))

(assert (=> d!136955 (= (isStrictlySorted!766 lt!562277) e!704659)))

(declare-fun b!1242993 () Bool)

(declare-fun e!704660 () Bool)

(assert (=> b!1242993 (= e!704659 e!704660)))

(declare-fun res!828830 () Bool)

(assert (=> b!1242993 (=> (not res!828830) (not e!704660))))

(assert (=> b!1242993 (= res!828830 (bvslt (_1!10155 (h!28578 lt!562277)) (_1!10155 (h!28578 (t!40839 lt!562277)))))))

(declare-fun b!1242994 () Bool)

(assert (=> b!1242994 (= e!704660 (isStrictlySorted!766 (t!40839 lt!562277)))))

(assert (= (and d!136955 (not res!828829)) b!1242993))

(assert (= (and b!1242993 res!828830) b!1242994))

(declare-fun m!1145619 () Bool)

(assert (=> b!1242994 m!1145619))

(assert (=> d!136899 d!136955))

(declare-fun d!136959 () Bool)

(declare-fun res!828833 () Bool)

(declare-fun e!704663 () Bool)

(assert (=> d!136959 (=> res!828833 e!704663)))

(assert (=> d!136959 (= res!828833 (or (is-Nil!27370 (removeStrictlySorted!133 l!644 key2!15)) (is-Nil!27370 (t!40839 (removeStrictlySorted!133 l!644 key2!15)))))))

(assert (=> d!136959 (= (isStrictlySorted!766 (removeStrictlySorted!133 l!644 key2!15)) e!704663)))

(declare-fun b!1242997 () Bool)

(declare-fun e!704664 () Bool)

(assert (=> b!1242997 (= e!704663 e!704664)))

(declare-fun res!828834 () Bool)

(assert (=> b!1242997 (=> (not res!828834) (not e!704664))))

(assert (=> b!1242997 (= res!828834 (bvslt (_1!10155 (h!28578 (removeStrictlySorted!133 l!644 key2!15))) (_1!10155 (h!28578 (t!40839 (removeStrictlySorted!133 l!644 key2!15))))))))

(declare-fun b!1242998 () Bool)

(assert (=> b!1242998 (= e!704664 (isStrictlySorted!766 (t!40839 (removeStrictlySorted!133 l!644 key2!15))))))

(assert (= (and d!136959 (not res!828833)) b!1242997))

(assert (= (and b!1242997 res!828834) b!1242998))

(declare-fun m!1145623 () Bool)

(assert (=> b!1242998 m!1145623))

(assert (=> d!136899 d!136959))

(declare-fun b!1242999 () Bool)

(declare-fun e!704667 () List!27373)

(declare-fun call!61395 () List!27373)

(assert (=> b!1242999 (= e!704667 call!61395)))

(declare-fun b!1243000 () Bool)

(assert (=> b!1243000 (= e!704667 call!61395)))

(declare-fun b!1243001 () Bool)

(declare-fun c!121771 () Bool)

(assert (=> b!1243001 (= c!121771 (and (is-Cons!27369 (t!40839 (removeStrictlySorted!133 l!644 key2!15))) (bvsgt (_1!10155 (h!28578 (t!40839 (removeStrictlySorted!133 l!644 key2!15)))) key1!25)))))

(declare-fun e!704665 () List!27373)

(assert (=> b!1243001 (= e!704665 e!704667)))

(declare-fun b!1243002 () Bool)

(declare-fun call!61396 () List!27373)

(assert (=> b!1243002 (= e!704665 call!61396)))

(declare-fun bm!61391 () Bool)

(assert (=> bm!61391 (= call!61395 call!61396)))

(declare-fun b!1243003 () Bool)

(declare-fun res!828835 () Bool)

(declare-fun e!704668 () Bool)

(assert (=> b!1243003 (=> (not res!828835) (not e!704668))))

(declare-fun lt!562302 () List!27373)

(assert (=> b!1243003 (= res!828835 (containsKey!616 lt!562302 key1!25))))

(declare-fun b!1243004 () Bool)

(declare-fun e!704666 () List!27373)

(declare-fun call!61394 () List!27373)

(assert (=> b!1243004 (= e!704666 call!61394)))

(declare-fun d!136963 () Bool)

(assert (=> d!136963 e!704668))

(declare-fun res!828836 () Bool)

(assert (=> d!136963 (=> (not res!828836) (not e!704668))))

(assert (=> d!136963 (= res!828836 (isStrictlySorted!766 lt!562302))))

(assert (=> d!136963 (= lt!562302 e!704666)))

(declare-fun c!121769 () Bool)

(assert (=> d!136963 (= c!121769 (and (is-Cons!27369 (t!40839 (removeStrictlySorted!133 l!644 key2!15))) (bvslt (_1!10155 (h!28578 (t!40839 (removeStrictlySorted!133 l!644 key2!15)))) key1!25)))))

(assert (=> d!136963 (isStrictlySorted!766 (t!40839 (removeStrictlySorted!133 l!644 key2!15)))))

(assert (=> d!136963 (= (insertStrictlySorted!440 (t!40839 (removeStrictlySorted!133 l!644 key2!15)) key1!25 v1!20) lt!562302)))

(declare-fun b!1243005 () Bool)

(declare-fun e!704669 () List!27373)

(declare-fun c!121770 () Bool)

(assert (=> b!1243005 (= e!704669 (ite c!121770 (t!40839 (t!40839 (removeStrictlySorted!133 l!644 key2!15))) (ite c!121771 (Cons!27369 (h!28578 (t!40839 (removeStrictlySorted!133 l!644 key2!15))) (t!40839 (t!40839 (removeStrictlySorted!133 l!644 key2!15)))) Nil!27370)))))

(declare-fun bm!61392 () Bool)

(assert (=> bm!61392 (= call!61396 call!61394)))

(declare-fun b!1243006 () Bool)

(assert (=> b!1243006 (= e!704669 (insertStrictlySorted!440 (t!40839 (t!40839 (removeStrictlySorted!133 l!644 key2!15))) key1!25 v1!20))))

(declare-fun b!1243007 () Bool)

(assert (=> b!1243007 (= e!704666 e!704665)))

(assert (=> b!1243007 (= c!121770 (and (is-Cons!27369 (t!40839 (removeStrictlySorted!133 l!644 key2!15))) (= (_1!10155 (h!28578 (t!40839 (removeStrictlySorted!133 l!644 key2!15)))) key1!25)))))

(declare-fun bm!61393 () Bool)

(assert (=> bm!61393 (= call!61394 ($colon$colon!629 e!704669 (ite c!121769 (h!28578 (t!40839 (removeStrictlySorted!133 l!644 key2!15))) (tuple2!20289 key1!25 v1!20))))))

(declare-fun c!121768 () Bool)

(assert (=> bm!61393 (= c!121768 c!121769)))

(declare-fun b!1243008 () Bool)

(assert (=> b!1243008 (= e!704668 (contains!7397 lt!562302 (tuple2!20289 key1!25 v1!20)))))

(assert (= (and d!136963 c!121769) b!1243004))

(assert (= (and d!136963 (not c!121769)) b!1243007))

(assert (= (and b!1243007 c!121770) b!1243002))

(assert (= (and b!1243007 (not c!121770)) b!1243001))

(assert (= (and b!1243001 c!121771) b!1242999))

(assert (= (and b!1243001 (not c!121771)) b!1243000))

(assert (= (or b!1242999 b!1243000) bm!61391))

(assert (= (or b!1243002 bm!61391) bm!61392))

(assert (= (or b!1243004 bm!61392) bm!61393))

(assert (= (and bm!61393 c!121768) b!1243006))

(assert (= (and bm!61393 (not c!121768)) b!1243005))

(assert (= (and d!136963 res!828836) b!1243003))

(assert (= (and b!1243003 res!828835) b!1243008))

(declare-fun m!1145625 () Bool)

(assert (=> b!1243006 m!1145625))

(declare-fun m!1145627 () Bool)

(assert (=> b!1243008 m!1145627))

(declare-fun m!1145629 () Bool)

(assert (=> bm!61393 m!1145629))

(declare-fun m!1145631 () Bool)

(assert (=> d!136963 m!1145631))

(assert (=> d!136963 m!1145623))

(declare-fun m!1145633 () Bool)

(assert (=> b!1243003 m!1145633))

(assert (=> b!1242795 d!136963))

(declare-fun d!136965 () Bool)

(declare-fun res!828845 () Bool)

(declare-fun e!704678 () Bool)

(assert (=> d!136965 (=> res!828845 e!704678)))

(assert (=> d!136965 (= res!828845 (and (is-Cons!27369 lt!562287) (= (_1!10155 (h!28578 lt!562287)) key2!15)))))

(assert (=> d!136965 (= (containsKey!616 lt!562287 key2!15) e!704678)))

(declare-fun b!1243017 () Bool)

(declare-fun e!704679 () Bool)

(assert (=> b!1243017 (= e!704678 e!704679)))

(declare-fun res!828846 () Bool)

(assert (=> b!1243017 (=> (not res!828846) (not e!704679))))

(assert (=> b!1243017 (= res!828846 (and (or (not (is-Cons!27369 lt!562287)) (bvsle (_1!10155 (h!28578 lt!562287)) key2!15)) (is-Cons!27369 lt!562287) (bvslt (_1!10155 (h!28578 lt!562287)) key2!15)))))

(declare-fun b!1243018 () Bool)

(assert (=> b!1243018 (= e!704679 (containsKey!616 (t!40839 lt!562287) key2!15))))

(assert (= (and d!136965 (not res!828845)) b!1243017))

(assert (= (and b!1243017 res!828846) b!1243018))

(declare-fun m!1145635 () Bool)

(assert (=> b!1243018 m!1145635))

(assert (=> b!1242858 d!136965))

(declare-fun d!136967 () Bool)

(declare-fun res!828849 () Bool)

(declare-fun e!704682 () Bool)

(assert (=> d!136967 (=> res!828849 e!704682)))

(assert (=> d!136967 (= res!828849 (and (is-Cons!27369 lt!562289) (= (_1!10155 (h!28578 lt!562289)) key2!15)))))

(assert (=> d!136967 (= (containsKey!616 lt!562289 key2!15) e!704682)))

(declare-fun b!1243021 () Bool)

(declare-fun e!704683 () Bool)

(assert (=> b!1243021 (= e!704682 e!704683)))

(declare-fun res!828850 () Bool)

(assert (=> b!1243021 (=> (not res!828850) (not e!704683))))

(assert (=> b!1243021 (= res!828850 (and (or (not (is-Cons!27369 lt!562289)) (bvsle (_1!10155 (h!28578 lt!562289)) key2!15)) (is-Cons!27369 lt!562289) (bvslt (_1!10155 (h!28578 lt!562289)) key2!15)))))

(declare-fun b!1243022 () Bool)

(assert (=> b!1243022 (= e!704683 (containsKey!616 (t!40839 lt!562289) key2!15))))

(assert (= (and d!136967 (not res!828849)) b!1243021))

(assert (= (and b!1243021 res!828850) b!1243022))

(declare-fun m!1145643 () Bool)

(assert (=> b!1243022 m!1145643))

(assert (=> b!1242873 d!136967))

(declare-fun d!136973 () Bool)

(assert (=> d!136973 (= ($colon$colon!629 (removeStrictlySorted!133 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15) (h!28578 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (Cons!27369 (h!28578 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (removeStrictlySorted!133 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15)))))

(assert (=> b!1242874 d!136973))

(declare-fun b!1243025 () Bool)

(declare-fun e!704687 () Bool)

(declare-fun lt!562306 () List!27373)

(assert (=> b!1243025 (= e!704687 (not (containsKey!616 lt!562306 key2!15)))))

(declare-fun d!136975 () Bool)

(assert (=> d!136975 e!704687))

(declare-fun res!828853 () Bool)

(assert (=> d!136975 (=> (not res!828853) (not e!704687))))

(assert (=> d!136975 (= res!828853 (isStrictlySorted!766 lt!562306))))

(declare-fun e!704688 () List!27373)

(assert (=> d!136975 (= lt!562306 e!704688)))

(declare-fun c!121772 () Bool)

(assert (=> d!136975 (= c!121772 (and (is-Cons!27369 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (= (_1!10155 (h!28578 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20)))) key2!15)))))

(assert (=> d!136975 (isStrictlySorted!766 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))

(assert (=> d!136975 (= (removeStrictlySorted!133 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15) lt!562306)))

(declare-fun e!704686 () List!27373)

(declare-fun b!1243026 () Bool)

(assert (=> b!1243026 (= e!704686 ($colon$colon!629 (removeStrictlySorted!133 (t!40839 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20))) key2!15) (h!28578 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))))

(declare-fun b!1243027 () Bool)

(assert (=> b!1243027 (= e!704688 (t!40839 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))

(declare-fun b!1243028 () Bool)

(assert (=> b!1243028 (= e!704688 e!704686)))

(declare-fun c!121773 () Bool)

(assert (=> b!1243028 (= c!121773 (and (is-Cons!27369 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (not (= (_1!10155 (h!28578 (t!40839 (insertStrictlySorted!440 l!644 key1!25 v1!20)))) key2!15))))))

(declare-fun b!1243029 () Bool)

(assert (=> b!1243029 (= e!704686 Nil!27370)))

(assert (= (and d!136975 c!121772) b!1243027))

(assert (= (and d!136975 (not c!121772)) b!1243028))

(assert (= (and b!1243028 c!121773) b!1243026))

(assert (= (and b!1243028 (not c!121773)) b!1243029))

(assert (= (and d!136975 res!828853) b!1243025))

(declare-fun m!1145647 () Bool)

(assert (=> b!1243025 m!1145647))

(declare-fun m!1145649 () Bool)

(assert (=> d!136975 m!1145649))

(assert (=> d!136975 m!1145603))

(declare-fun m!1145651 () Bool)

(assert (=> b!1243026 m!1145651))

(assert (=> b!1243026 m!1145651))

(declare-fun m!1145653 () Bool)

(assert (=> b!1243026 m!1145653))

(assert (=> b!1242874 d!136975))

(declare-fun d!136983 () Bool)

(declare-fun res!828857 () Bool)

(declare-fun e!704697 () Bool)

(assert (=> d!136983 (=> res!828857 e!704697)))

(assert (=> d!136983 (= res!828857 (or (is-Nil!27370 lt!562287) (is-Nil!27370 (t!40839 lt!562287))))))

(assert (=> d!136983 (= (isStrictlySorted!766 lt!562287) e!704697)))

(declare-fun b!1243045 () Bool)

(declare-fun e!704698 () Bool)

(assert (=> b!1243045 (= e!704697 e!704698)))

(declare-fun res!828858 () Bool)

(assert (=> b!1243045 (=> (not res!828858) (not e!704698))))

(assert (=> b!1243045 (= res!828858 (bvslt (_1!10155 (h!28578 lt!562287)) (_1!10155 (h!28578 (t!40839 lt!562287)))))))

(declare-fun b!1243046 () Bool)

(assert (=> b!1243046 (= e!704698 (isStrictlySorted!766 (t!40839 lt!562287)))))

(assert (= (and d!136983 (not res!828857)) b!1243045))

(assert (= (and b!1243045 res!828858) b!1243046))

(declare-fun m!1145665 () Bool)

(assert (=> b!1243046 m!1145665))

(assert (=> d!136905 d!136983))

(assert (=> d!136905 d!136919))

(declare-fun d!136987 () Bool)

(declare-fun res!828859 () Bool)

(declare-fun e!704699 () Bool)

(assert (=> d!136987 (=> res!828859 e!704699)))

(assert (=> d!136987 (= res!828859 (and (is-Cons!27369 lt!562290) (= (_1!10155 (h!28578 lt!562290)) key1!25)))))

(assert (=> d!136987 (= (containsKey!616 lt!562290 key1!25) e!704699)))

(declare-fun b!1243047 () Bool)

(declare-fun e!704700 () Bool)

(assert (=> b!1243047 (= e!704699 e!704700)))

(declare-fun res!828860 () Bool)

(assert (=> b!1243047 (=> (not res!828860) (not e!704700))))

(assert (=> b!1243047 (= res!828860 (and (or (not (is-Cons!27369 lt!562290)) (bvsle (_1!10155 (h!28578 lt!562290)) key1!25)) (is-Cons!27369 lt!562290) (bvslt (_1!10155 (h!28578 lt!562290)) key1!25)))))

(declare-fun b!1243048 () Bool)

(assert (=> b!1243048 (= e!704700 (containsKey!616 (t!40839 lt!562290) key1!25))))

(assert (= (and d!136987 (not res!828859)) b!1243047))

(assert (= (and b!1243047 res!828860) b!1243048))

(declare-fun m!1145667 () Bool)

(assert (=> b!1243048 m!1145667))

(assert (=> b!1242882 d!136987))

(declare-fun d!136989 () Bool)

(declare-fun res!828861 () Bool)

(declare-fun e!704701 () Bool)

(assert (=> d!136989 (=> res!828861 e!704701)))

(assert (=> d!136989 (= res!828861 (and (is-Cons!27369 lt!562277) (= (_1!10155 (h!28578 lt!562277)) key1!25)))))

(assert (=> d!136989 (= (containsKey!616 lt!562277 key1!25) e!704701)))

(declare-fun b!1243049 () Bool)

(declare-fun e!704702 () Bool)

(assert (=> b!1243049 (= e!704701 e!704702)))

(declare-fun res!828862 () Bool)

(assert (=> b!1243049 (=> (not res!828862) (not e!704702))))

(assert (=> b!1243049 (= res!828862 (and (or (not (is-Cons!27369 lt!562277)) (bvsle (_1!10155 (h!28578 lt!562277)) key1!25)) (is-Cons!27369 lt!562277) (bvslt (_1!10155 (h!28578 lt!562277)) key1!25)))))

(declare-fun b!1243050 () Bool)

(assert (=> b!1243050 (= e!704702 (containsKey!616 (t!40839 lt!562277) key1!25))))

(assert (= (and d!136989 (not res!828861)) b!1243049))

(assert (= (and b!1243049 res!828862) b!1243050))

(declare-fun m!1145675 () Bool)

(assert (=> b!1243050 m!1145675))

(assert (=> b!1242792 d!136989))

(declare-fun d!136991 () Bool)

(declare-fun res!828863 () Bool)

(declare-fun e!704703 () Bool)

(assert (=> d!136991 (=> res!828863 e!704703)))

(assert (=> d!136991 (= res!828863 (or (is-Nil!27370 lt!562290) (is-Nil!27370 (t!40839 lt!562290))))))

(assert (=> d!136991 (= (isStrictlySorted!766 lt!562290) e!704703)))

(declare-fun b!1243051 () Bool)

(declare-fun e!704704 () Bool)

(assert (=> b!1243051 (= e!704703 e!704704)))

(declare-fun res!828864 () Bool)

(assert (=> b!1243051 (=> (not res!828864) (not e!704704))))

(assert (=> b!1243051 (= res!828864 (bvslt (_1!10155 (h!28578 lt!562290)) (_1!10155 (h!28578 (t!40839 lt!562290)))))))

(declare-fun b!1243052 () Bool)

(assert (=> b!1243052 (= e!704704 (isStrictlySorted!766 (t!40839 lt!562290)))))

(assert (= (and d!136991 (not res!828863)) b!1243051))

(assert (= (and b!1243051 res!828864) b!1243052))

(declare-fun m!1145681 () Bool)

(assert (=> b!1243052 m!1145681))

(assert (=> d!136915 d!136991))

(assert (=> d!136915 d!136919))

(declare-fun lt!562310 () Bool)

(declare-fun d!136995 () Bool)

(assert (=> d!136995 (= lt!562310 (set.member (tuple2!20289 key1!25 v1!20) (content!605 lt!562290)))))

(declare-fun e!704707 () Bool)

(assert (=> d!136995 (= lt!562310 e!704707)))

(declare-fun res!828868 () Bool)

(assert (=> d!136995 (=> (not res!828868) (not e!704707))))

(assert (=> d!136995 (= res!828868 (is-Cons!27369 lt!562290))))

(assert (=> d!136995 (= (contains!7397 lt!562290 (tuple2!20289 key1!25 v1!20)) lt!562310)))

(declare-fun b!1243055 () Bool)

(declare-fun e!704708 () Bool)

(assert (=> b!1243055 (= e!704707 e!704708)))

(declare-fun res!828867 () Bool)

(assert (=> b!1243055 (=> res!828867 e!704708)))

(assert (=> b!1243055 (= res!828867 (= (h!28578 lt!562290) (tuple2!20289 key1!25 v1!20)))))

(declare-fun b!1243056 () Bool)

(assert (=> b!1243056 (= e!704708 (contains!7397 (t!40839 lt!562290) (tuple2!20289 key1!25 v1!20)))))

(assert (= (and d!136995 res!828868) b!1243055))

(assert (= (and b!1243055 (not res!828867)) b!1243056))

(declare-fun m!1145689 () Bool)

(assert (=> d!136995 m!1145689))

(declare-fun m!1145691 () Bool)

(assert (=> d!136995 m!1145691))

(declare-fun m!1145693 () Bool)

(assert (=> b!1243056 m!1145693))

(assert (=> b!1242887 d!136995))

(declare-fun d!136999 () Bool)

(assert (=> d!136999 (= ($colon$colon!629 e!704581 (ite c!121745 (h!28578 l!644) (tuple2!20289 key1!25 v1!20))) (Cons!27369 (ite c!121745 (h!28578 l!644) (tuple2!20289 key1!25 v1!20)) e!704581))))

(assert (=> bm!61384 d!136999))

(declare-fun b!1243059 () Bool)

(declare-fun e!704711 () Bool)

(declare-fun tp!92781 () Bool)

(assert (=> b!1243059 (= e!704711 (and tp_is_empty!31291 tp!92781))))

(assert (=> b!1242919 (= tp!92777 e!704711)))

(assert (= (and b!1242919 (is-Cons!27369 (t!40839 (t!40839 l!644)))) b!1243059))

(push 1)

