; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5168 () Bool)

(assert start!5168)

(declare-fun res!22807 () Bool)

(declare-fun e!23960 () Bool)

(assert (=> start!5168 (=> (not res!22807) (not e!23960))))

(declare-datatypes ((B!776 0))(
  ( (B!777 (val!888 Int)) )
))
(declare-fun b!99 () B!776)

(declare-datatypes ((tuple2!1440 0))(
  ( (tuple2!1441 (_1!731 (_ BitVec 64)) (_2!731 B!776)) )
))
(declare-datatypes ((List!991 0))(
  ( (Nil!988) (Cons!987 (h!1555 tuple2!1440) (t!3823 List!991)) )
))
(declare-datatypes ((ListLongMap!1005 0))(
  ( (ListLongMap!1006 (toList!518 List!991)) )
))
(declare-fun lm!264 () ListLongMap!1005)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!470 (List!991 tuple2!1440) Bool)

(assert (=> start!5168 (= res!22807 (contains!470 (toList!518 lm!264) (tuple2!1441 a!526 b!99)))))

(assert (=> start!5168 e!23960))

(declare-fun e!23961 () Bool)

(declare-fun inv!1683 (ListLongMap!1005) Bool)

(assert (=> start!5168 (and (inv!1683 lm!264) e!23961)))

(assert (=> start!5168 true))

(declare-fun tp_is_empty!1699 () Bool)

(assert (=> start!5168 tp_is_empty!1699))

(declare-fun b!37791 () Bool)

(declare-fun isStrictlySorted!188 (List!991) Bool)

(assert (=> b!37791 (= e!23960 (not (isStrictlySorted!188 (toList!518 lm!264))))))

(declare-fun b!37792 () Bool)

(declare-fun tp!5606 () Bool)

(assert (=> b!37792 (= e!23961 tp!5606)))

(assert (= (and start!5168 res!22807) b!37791))

(assert (= start!5168 b!37792))

(declare-fun m!30515 () Bool)

(assert (=> start!5168 m!30515))

(declare-fun m!30517 () Bool)

(assert (=> start!5168 m!30517))

(declare-fun m!30519 () Bool)

(assert (=> b!37791 m!30519))

(check-sat (not b!37791) (not start!5168) (not b!37792) tp_is_empty!1699)
(check-sat)
(get-model)

(declare-fun d!6089 () Bool)

(declare-fun res!22828 () Bool)

(declare-fun e!23988 () Bool)

(assert (=> d!6089 (=> res!22828 e!23988)))

(get-info :version)

(assert (=> d!6089 (= res!22828 (or ((_ is Nil!988) (toList!518 lm!264)) ((_ is Nil!988) (t!3823 (toList!518 lm!264)))))))

(assert (=> d!6089 (= (isStrictlySorted!188 (toList!518 lm!264)) e!23988)))

(declare-fun b!37819 () Bool)

(declare-fun e!23989 () Bool)

(assert (=> b!37819 (= e!23988 e!23989)))

(declare-fun res!22829 () Bool)

(assert (=> b!37819 (=> (not res!22829) (not e!23989))))

(assert (=> b!37819 (= res!22829 (bvslt (_1!731 (h!1555 (toList!518 lm!264))) (_1!731 (h!1555 (t!3823 (toList!518 lm!264))))))))

(declare-fun b!37820 () Bool)

(assert (=> b!37820 (= e!23989 (isStrictlySorted!188 (t!3823 (toList!518 lm!264))))))

(assert (= (and d!6089 (not res!22828)) b!37819))

(assert (= (and b!37819 res!22829) b!37820))

(declare-fun m!30535 () Bool)

(assert (=> b!37820 m!30535))

(assert (=> b!37791 d!6089))

(declare-fun lt!13930 () Bool)

(declare-fun d!6093 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!20 (List!991) (InoxSet tuple2!1440))

(assert (=> d!6093 (= lt!13930 (select (content!20 (toList!518 lm!264)) (tuple2!1441 a!526 b!99)))))

(declare-fun e!24005 () Bool)

(assert (=> d!6093 (= lt!13930 e!24005)))

(declare-fun res!22844 () Bool)

(assert (=> d!6093 (=> (not res!22844) (not e!24005))))

(assert (=> d!6093 (= res!22844 ((_ is Cons!987) (toList!518 lm!264)))))

(assert (=> d!6093 (= (contains!470 (toList!518 lm!264) (tuple2!1441 a!526 b!99)) lt!13930)))

(declare-fun b!37835 () Bool)

(declare-fun e!24004 () Bool)

(assert (=> b!37835 (= e!24005 e!24004)))

(declare-fun res!22845 () Bool)

(assert (=> b!37835 (=> res!22845 e!24004)))

(assert (=> b!37835 (= res!22845 (= (h!1555 (toList!518 lm!264)) (tuple2!1441 a!526 b!99)))))

(declare-fun b!37836 () Bool)

(assert (=> b!37836 (= e!24004 (contains!470 (t!3823 (toList!518 lm!264)) (tuple2!1441 a!526 b!99)))))

(assert (= (and d!6093 res!22844) b!37835))

(assert (= (and b!37835 (not res!22845)) b!37836))

(declare-fun m!30543 () Bool)

(assert (=> d!6093 m!30543))

(declare-fun m!30547 () Bool)

(assert (=> d!6093 m!30547))

(declare-fun m!30549 () Bool)

(assert (=> b!37836 m!30549))

(assert (=> start!5168 d!6093))

(declare-fun d!6099 () Bool)

(assert (=> d!6099 (= (inv!1683 lm!264) (isStrictlySorted!188 (toList!518 lm!264)))))

(declare-fun bs!1504 () Bool)

(assert (= bs!1504 d!6099))

(assert (=> bs!1504 m!30519))

(assert (=> start!5168 d!6099))

(declare-fun b!37854 () Bool)

(declare-fun e!24017 () Bool)

(declare-fun tp!5620 () Bool)

(assert (=> b!37854 (= e!24017 (and tp_is_empty!1699 tp!5620))))

(assert (=> b!37792 (= tp!5606 e!24017)))

(assert (= (and b!37792 ((_ is Cons!987) (toList!518 lm!264))) b!37854))

(check-sat (not b!37854) (not b!37820) (not d!6099) tp_is_empty!1699 (not d!6093) (not b!37836))
(check-sat)
