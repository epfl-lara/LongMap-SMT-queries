; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75340 () Bool)

(assert start!75340)

(declare-fun res!601844 () Bool)

(declare-fun e!493622 () Bool)

(assert (=> start!75340 (=> (not res!601844) (not e!493622))))

(declare-datatypes ((B!1286 0))(
  ( (B!1287 (val!8949 Int)) )
))
(declare-datatypes ((tuple2!11822 0))(
  ( (tuple2!11823 (_1!5922 (_ BitVec 64)) (_2!5922 B!1286)) )
))
(declare-datatypes ((List!17620 0))(
  ( (Nil!17617) (Cons!17616 (h!18753 tuple2!11822) (t!24889 List!17620)) )
))
(declare-fun l!906 () List!17620)

(declare-fun isStrictlySorted!471 (List!17620) Bool)

(assert (=> start!75340 (= res!601844 (isStrictlySorted!471 l!906))))

(assert (=> start!75340 e!493622))

(declare-fun e!493623 () Bool)

(assert (=> start!75340 e!493623))

(assert (=> start!75340 true))

(declare-fun b!886742 () Bool)

(declare-fun res!601845 () Bool)

(assert (=> b!886742 (=> (not res!601845) (not e!493622))))

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!886742 (= res!601845 (and ((_ is Cons!17616) l!906) (bvslt (_1!5922 (h!18753 l!906)) key1!49)))))

(declare-fun b!886743 () Bool)

(assert (=> b!886743 (= e!493622 (not (isStrictlySorted!471 (t!24889 l!906))))))

(declare-fun b!886744 () Bool)

(declare-fun tp_is_empty!17797 () Bool)

(declare-fun tp!54330 () Bool)

(assert (=> b!886744 (= e!493623 (and tp_is_empty!17797 tp!54330))))

(assert (= (and start!75340 res!601844) b!886742))

(assert (= (and b!886742 res!601845) b!886743))

(assert (= (and start!75340 ((_ is Cons!17616) l!906)) b!886744))

(declare-fun m!827159 () Bool)

(assert (=> start!75340 m!827159))

(declare-fun m!827161 () Bool)

(assert (=> b!886743 m!827161))

(check-sat (not b!886743) (not start!75340) (not b!886744) tp_is_empty!17797)
(check-sat)
(get-model)

(declare-fun d!109779 () Bool)

(declare-fun res!601862 () Bool)

(declare-fun e!493640 () Bool)

(assert (=> d!109779 (=> res!601862 e!493640)))

(assert (=> d!109779 (= res!601862 (or ((_ is Nil!17617) (t!24889 l!906)) ((_ is Nil!17617) (t!24889 (t!24889 l!906)))))))

(assert (=> d!109779 (= (isStrictlySorted!471 (t!24889 l!906)) e!493640)))

(declare-fun b!886767 () Bool)

(declare-fun e!493641 () Bool)

(assert (=> b!886767 (= e!493640 e!493641)))

(declare-fun res!601863 () Bool)

(assert (=> b!886767 (=> (not res!601863) (not e!493641))))

(assert (=> b!886767 (= res!601863 (bvslt (_1!5922 (h!18753 (t!24889 l!906))) (_1!5922 (h!18753 (t!24889 (t!24889 l!906))))))))

(declare-fun b!886768 () Bool)

(assert (=> b!886768 (= e!493641 (isStrictlySorted!471 (t!24889 (t!24889 l!906))))))

(assert (= (and d!109779 (not res!601862)) b!886767))

(assert (= (and b!886767 res!601863) b!886768))

(declare-fun m!827171 () Bool)

(assert (=> b!886768 m!827171))

(assert (=> b!886743 d!109779))

(declare-fun d!109783 () Bool)

(declare-fun res!601864 () Bool)

(declare-fun e!493642 () Bool)

(assert (=> d!109783 (=> res!601864 e!493642)))

(assert (=> d!109783 (= res!601864 (or ((_ is Nil!17617) l!906) ((_ is Nil!17617) (t!24889 l!906))))))

(assert (=> d!109783 (= (isStrictlySorted!471 l!906) e!493642)))

(declare-fun b!886769 () Bool)

(declare-fun e!493643 () Bool)

(assert (=> b!886769 (= e!493642 e!493643)))

(declare-fun res!601865 () Bool)

(assert (=> b!886769 (=> (not res!601865) (not e!493643))))

(assert (=> b!886769 (= res!601865 (bvslt (_1!5922 (h!18753 l!906)) (_1!5922 (h!18753 (t!24889 l!906)))))))

(declare-fun b!886770 () Bool)

(assert (=> b!886770 (= e!493643 (isStrictlySorted!471 (t!24889 l!906)))))

(assert (= (and d!109783 (not res!601864)) b!886769))

(assert (= (and b!886769 res!601865) b!886770))

(assert (=> b!886770 m!827161))

(assert (=> start!75340 d!109783))

(declare-fun b!886775 () Bool)

(declare-fun e!493646 () Bool)

(declare-fun tp!54339 () Bool)

(assert (=> b!886775 (= e!493646 (and tp_is_empty!17797 tp!54339))))

(assert (=> b!886744 (= tp!54330 e!493646)))

(assert (= (and b!886744 ((_ is Cons!17616) (t!24889 l!906))) b!886775))

(check-sat (not b!886768) (not b!886770) (not b!886775) tp_is_empty!17797)
(check-sat)
