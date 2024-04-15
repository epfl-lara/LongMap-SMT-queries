; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137540 () Bool)

(assert start!137540)

(declare-fun res!1080740 () Bool)

(declare-fun e!882697 () Bool)

(assert (=> start!137540 (=> (not res!1080740) (not e!882697))))

(declare-datatypes ((B!2738 0))(
  ( (B!2739 (val!19731 Int)) )
))
(declare-datatypes ((tuple2!25698 0))(
  ( (tuple2!25699 (_1!12860 (_ BitVec 64)) (_2!12860 B!2738)) )
))
(declare-datatypes ((List!36892 0))(
  ( (Nil!36889) (Cons!36888 (h!38432 tuple2!25698) (t!51798 List!36892)) )
))
(declare-fun l!1356 () List!36892)

(declare-fun isStrictlySorted!1104 (List!36892) Bool)

(assert (=> start!137540 (= res!1080740 (isStrictlySorted!1104 l!1356))))

(assert (=> start!137540 e!882697))

(declare-fun e!882698 () Bool)

(assert (=> start!137540 e!882698))

(assert (=> start!137540 true))

(declare-fun tp_is_empty!39283 () Bool)

(assert (=> start!137540 tp_is_empty!39283))

(declare-fun b!1581801 () Bool)

(declare-fun res!1080739 () Bool)

(assert (=> b!1581801 (=> (not res!1080739) (not e!882697))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!950 (List!36892 (_ BitVec 64)) Bool)

(assert (=> b!1581801 (= res!1080739 (not (containsKey!950 l!1356 key!387)))))

(declare-fun b!1581803 () Bool)

(declare-fun value!184 () B!2738)

(declare-fun contains!10469 (List!36892 tuple2!25698) Bool)

(assert (=> b!1581803 (= e!882697 (contains!10469 l!1356 (tuple2!25699 key!387 value!184)))))

(declare-fun b!1581804 () Bool)

(declare-fun tp!114678 () Bool)

(assert (=> b!1581804 (= e!882698 (and tp_is_empty!39283 tp!114678))))

(declare-fun b!1581802 () Bool)

(declare-fun res!1080741 () Bool)

(assert (=> b!1581802 (=> (not res!1080741) (not e!882697))))

(get-info :version)

(assert (=> b!1581802 (= res!1080741 ((_ is Nil!36889) l!1356))))

(assert (= (and start!137540 res!1080740) b!1581801))

(assert (= (and b!1581801 res!1080739) b!1581802))

(assert (= (and b!1581802 res!1080741) b!1581803))

(assert (= (and start!137540 ((_ is Cons!36888) l!1356)) b!1581804))

(declare-fun m!1451851 () Bool)

(assert (=> start!137540 m!1451851))

(declare-fun m!1451853 () Bool)

(assert (=> b!1581801 m!1451853))

(declare-fun m!1451855 () Bool)

(assert (=> b!1581803 m!1451855))

(check-sat (not b!1581801) (not b!1581803) (not b!1581804) (not start!137540) tp_is_empty!39283)
(check-sat)
(get-model)

(declare-fun d!166673 () Bool)

(declare-fun res!1080774 () Bool)

(declare-fun e!882725 () Bool)

(assert (=> d!166673 (=> res!1080774 e!882725)))

(assert (=> d!166673 (= res!1080774 (and ((_ is Cons!36888) l!1356) (= (_1!12860 (h!38432 l!1356)) key!387)))))

(assert (=> d!166673 (= (containsKey!950 l!1356 key!387) e!882725)))

(declare-fun b!1581843 () Bool)

(declare-fun e!882726 () Bool)

(assert (=> b!1581843 (= e!882725 e!882726)))

(declare-fun res!1080775 () Bool)

(assert (=> b!1581843 (=> (not res!1080775) (not e!882726))))

(assert (=> b!1581843 (= res!1080775 (and (or (not ((_ is Cons!36888) l!1356)) (bvsle (_1!12860 (h!38432 l!1356)) key!387)) ((_ is Cons!36888) l!1356) (bvslt (_1!12860 (h!38432 l!1356)) key!387)))))

(declare-fun b!1581844 () Bool)

(assert (=> b!1581844 (= e!882726 (containsKey!950 (t!51798 l!1356) key!387))))

(assert (= (and d!166673 (not res!1080774)) b!1581843))

(assert (= (and b!1581843 res!1080775) b!1581844))

(declare-fun m!1451871 () Bool)

(assert (=> b!1581844 m!1451871))

(assert (=> b!1581801 d!166673))

(declare-fun d!166681 () Bool)

(declare-fun lt!676766 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!846 (List!36892) (InoxSet tuple2!25698))

(assert (=> d!166681 (= lt!676766 (select (content!846 l!1356) (tuple2!25699 key!387 value!184)))))

(declare-fun e!882746 () Bool)

(assert (=> d!166681 (= lt!676766 e!882746)))

(declare-fun res!1080795 () Bool)

(assert (=> d!166681 (=> (not res!1080795) (not e!882746))))

(assert (=> d!166681 (= res!1080795 ((_ is Cons!36888) l!1356))))

(assert (=> d!166681 (= (contains!10469 l!1356 (tuple2!25699 key!387 value!184)) lt!676766)))

(declare-fun b!1581863 () Bool)

(declare-fun e!882745 () Bool)

(assert (=> b!1581863 (= e!882746 e!882745)))

(declare-fun res!1080794 () Bool)

(assert (=> b!1581863 (=> res!1080794 e!882745)))

(assert (=> b!1581863 (= res!1080794 (= (h!38432 l!1356) (tuple2!25699 key!387 value!184)))))

(declare-fun b!1581864 () Bool)

(assert (=> b!1581864 (= e!882745 (contains!10469 (t!51798 l!1356) (tuple2!25699 key!387 value!184)))))

(assert (= (and d!166681 res!1080795) b!1581863))

(assert (= (and b!1581863 (not res!1080794)) b!1581864))

(declare-fun m!1451883 () Bool)

(assert (=> d!166681 m!1451883))

(declare-fun m!1451885 () Bool)

(assert (=> d!166681 m!1451885))

(declare-fun m!1451887 () Bool)

(assert (=> b!1581864 m!1451887))

(assert (=> b!1581803 d!166681))

(declare-fun d!166689 () Bool)

(declare-fun res!1080808 () Bool)

(declare-fun e!882759 () Bool)

(assert (=> d!166689 (=> res!1080808 e!882759)))

(assert (=> d!166689 (= res!1080808 (or ((_ is Nil!36889) l!1356) ((_ is Nil!36889) (t!51798 l!1356))))))

(assert (=> d!166689 (= (isStrictlySorted!1104 l!1356) e!882759)))

(declare-fun b!1581877 () Bool)

(declare-fun e!882760 () Bool)

(assert (=> b!1581877 (= e!882759 e!882760)))

(declare-fun res!1080809 () Bool)

(assert (=> b!1581877 (=> (not res!1080809) (not e!882760))))

(assert (=> b!1581877 (= res!1080809 (bvslt (_1!12860 (h!38432 l!1356)) (_1!12860 (h!38432 (t!51798 l!1356)))))))

(declare-fun b!1581878 () Bool)

(assert (=> b!1581878 (= e!882760 (isStrictlySorted!1104 (t!51798 l!1356)))))

(assert (= (and d!166689 (not res!1080808)) b!1581877))

(assert (= (and b!1581877 res!1080809) b!1581878))

(declare-fun m!1451889 () Bool)

(assert (=> b!1581878 m!1451889))

(assert (=> start!137540 d!166689))

(declare-fun b!1581895 () Bool)

(declare-fun e!882771 () Bool)

(declare-fun tp!114691 () Bool)

(assert (=> b!1581895 (= e!882771 (and tp_is_empty!39283 tp!114691))))

(assert (=> b!1581804 (= tp!114678 e!882771)))

(assert (= (and b!1581804 ((_ is Cons!36888) (t!51798 l!1356))) b!1581895))

(check-sat (not b!1581878) (not d!166681) (not b!1581895) tp_is_empty!39283 (not b!1581844) (not b!1581864))
(check-sat)
