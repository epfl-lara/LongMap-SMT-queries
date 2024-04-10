; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137576 () Bool)

(assert start!137576)

(declare-fun b!1582129 () Bool)

(declare-fun e!882901 () Bool)

(declare-fun tp_is_empty!39285 () Bool)

(declare-fun tp!114680 () Bool)

(assert (=> b!1582129 (= e!882901 (and tp_is_empty!39285 tp!114680))))

(declare-fun b!1582127 () Bool)

(declare-fun res!1080879 () Bool)

(declare-fun e!882902 () Bool)

(assert (=> b!1582127 (=> (not res!1080879) (not e!882902))))

(declare-datatypes ((B!2740 0))(
  ( (B!2741 (val!19732 Int)) )
))
(declare-datatypes ((tuple2!25632 0))(
  ( (tuple2!25633 (_1!12827 (_ BitVec 64)) (_2!12827 B!2740)) )
))
(declare-datatypes ((List!36852 0))(
  ( (Nil!36849) (Cons!36848 (h!38391 tuple2!25632) (t!51766 List!36852)) )
))
(declare-fun l!1356 () List!36852)

(get-info :version)

(assert (=> b!1582127 (= res!1080879 ((_ is Nil!36849) l!1356))))

(declare-fun res!1080878 () Bool)

(assert (=> start!137576 (=> (not res!1080878) (not e!882902))))

(declare-fun isStrictlySorted!1107 (List!36852) Bool)

(assert (=> start!137576 (= res!1080878 (isStrictlySorted!1107 l!1356))))

(assert (=> start!137576 e!882902))

(assert (=> start!137576 e!882901))

(assert (=> start!137576 true))

(assert (=> start!137576 tp_is_empty!39285))

(declare-fun b!1582126 () Bool)

(declare-fun res!1080877 () Bool)

(assert (=> b!1582126 (=> (not res!1080877) (not e!882902))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!953 (List!36852 (_ BitVec 64)) Bool)

(assert (=> b!1582126 (= res!1080877 (not (containsKey!953 l!1356 key!387)))))

(declare-fun b!1582128 () Bool)

(declare-fun value!184 () B!2740)

(declare-fun contains!10515 (List!36852 tuple2!25632) Bool)

(assert (=> b!1582128 (= e!882902 (contains!10515 l!1356 (tuple2!25633 key!387 value!184)))))

(assert (= (and start!137576 res!1080878) b!1582126))

(assert (= (and b!1582126 res!1080877) b!1582127))

(assert (= (and b!1582127 res!1080879) b!1582128))

(assert (= (and start!137576 ((_ is Cons!36848) l!1356)) b!1582129))

(declare-fun m!1452737 () Bool)

(assert (=> start!137576 m!1452737))

(declare-fun m!1452739 () Bool)

(assert (=> b!1582126 m!1452739))

(declare-fun m!1452741 () Bool)

(assert (=> b!1582128 m!1452741))

(check-sat (not start!137576) (not b!1582128) (not b!1582126) (not b!1582129) tp_is_empty!39285)
(check-sat)
(get-model)

(declare-fun d!166911 () Bool)

(declare-fun res!1080903 () Bool)

(declare-fun e!882923 () Bool)

(assert (=> d!166911 (=> res!1080903 e!882923)))

(assert (=> d!166911 (= res!1080903 (and ((_ is Cons!36848) l!1356) (= (_1!12827 (h!38391 l!1356)) key!387)))))

(assert (=> d!166911 (= (containsKey!953 l!1356 key!387) e!882923)))

(declare-fun b!1582156 () Bool)

(declare-fun e!882924 () Bool)

(assert (=> b!1582156 (= e!882923 e!882924)))

(declare-fun res!1080904 () Bool)

(assert (=> b!1582156 (=> (not res!1080904) (not e!882924))))

(assert (=> b!1582156 (= res!1080904 (and (or (not ((_ is Cons!36848) l!1356)) (bvsle (_1!12827 (h!38391 l!1356)) key!387)) ((_ is Cons!36848) l!1356) (bvslt (_1!12827 (h!38391 l!1356)) key!387)))))

(declare-fun b!1582157 () Bool)

(assert (=> b!1582157 (= e!882924 (containsKey!953 (t!51766 l!1356) key!387))))

(assert (= (and d!166911 (not res!1080903)) b!1582156))

(assert (= (and b!1582156 res!1080904) b!1582157))

(declare-fun m!1452751 () Bool)

(assert (=> b!1582157 m!1452751))

(assert (=> b!1582126 d!166911))

(declare-fun d!166919 () Bool)

(declare-fun res!1080917 () Bool)

(declare-fun e!882937 () Bool)

(assert (=> d!166919 (=> res!1080917 e!882937)))

(assert (=> d!166919 (= res!1080917 (or ((_ is Nil!36849) l!1356) ((_ is Nil!36849) (t!51766 l!1356))))))

(assert (=> d!166919 (= (isStrictlySorted!1107 l!1356) e!882937)))

(declare-fun b!1582168 () Bool)

(declare-fun e!882938 () Bool)

(assert (=> b!1582168 (= e!882937 e!882938)))

(declare-fun res!1080918 () Bool)

(assert (=> b!1582168 (=> (not res!1080918) (not e!882938))))

(assert (=> b!1582168 (= res!1080918 (bvslt (_1!12827 (h!38391 l!1356)) (_1!12827 (h!38391 (t!51766 l!1356)))))))

(declare-fun b!1582169 () Bool)

(assert (=> b!1582169 (= e!882938 (isStrictlySorted!1107 (t!51766 l!1356)))))

(assert (= (and d!166919 (not res!1080917)) b!1582168))

(assert (= (and b!1582168 res!1080918) b!1582169))

(declare-fun m!1452759 () Bool)

(assert (=> b!1582169 m!1452759))

(assert (=> start!137576 d!166919))

(declare-fun d!166923 () Bool)

(declare-fun lt!677052 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!857 (List!36852) (InoxSet tuple2!25632))

(assert (=> d!166923 (= lt!677052 (select (content!857 l!1356) (tuple2!25633 key!387 value!184)))))

(declare-fun e!882957 () Bool)

(assert (=> d!166923 (= lt!677052 e!882957)))

(declare-fun res!1080937 () Bool)

(assert (=> d!166923 (=> (not res!1080937) (not e!882957))))

(assert (=> d!166923 (= res!1080937 ((_ is Cons!36848) l!1356))))

(assert (=> d!166923 (= (contains!10515 l!1356 (tuple2!25633 key!387 value!184)) lt!677052)))

(declare-fun b!1582190 () Bool)

(declare-fun e!882958 () Bool)

(assert (=> b!1582190 (= e!882957 e!882958)))

(declare-fun res!1080938 () Bool)

(assert (=> b!1582190 (=> res!1080938 e!882958)))

(assert (=> b!1582190 (= res!1080938 (= (h!38391 l!1356) (tuple2!25633 key!387 value!184)))))

(declare-fun b!1582191 () Bool)

(assert (=> b!1582191 (= e!882958 (contains!10515 (t!51766 l!1356) (tuple2!25633 key!387 value!184)))))

(assert (= (and d!166923 res!1080937) b!1582190))

(assert (= (and b!1582190 (not res!1080938)) b!1582191))

(declare-fun m!1452769 () Bool)

(assert (=> d!166923 m!1452769))

(declare-fun m!1452771 () Bool)

(assert (=> d!166923 m!1452771))

(declare-fun m!1452773 () Bool)

(assert (=> b!1582191 m!1452773))

(assert (=> b!1582128 d!166923))

(declare-fun b!1582208 () Bool)

(declare-fun e!882969 () Bool)

(declare-fun tp!114690 () Bool)

(assert (=> b!1582208 (= e!882969 (and tp_is_empty!39285 tp!114690))))

(assert (=> b!1582129 (= tp!114680 e!882969)))

(assert (= (and b!1582129 ((_ is Cons!36848) (t!51766 l!1356))) b!1582208))

(check-sat (not b!1582169) (not b!1582208) tp_is_empty!39285 (not b!1582191) (not b!1582157) (not d!166923))
(check-sat)
