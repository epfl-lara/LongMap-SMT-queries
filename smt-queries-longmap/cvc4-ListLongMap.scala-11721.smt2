; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137178 () Bool)

(assert start!137178)

(declare-fun res!1079759 () Bool)

(declare-fun e!881761 () Bool)

(assert (=> start!137178 (=> (not res!1079759) (not e!881761))))

(declare-datatypes ((B!2670 0))(
  ( (B!2671 (val!19697 Int)) )
))
(declare-datatypes ((tuple2!25524 0))(
  ( (tuple2!25525 (_1!12773 (_ BitVec 64)) (_2!12773 B!2670)) )
))
(declare-datatypes ((List!36817 0))(
  ( (Nil!36814) (Cons!36813 (h!38356 tuple2!25524) (t!51731 List!36817)) )
))
(declare-fun l!1390 () List!36817)

(declare-fun isStrictlySorted!1075 (List!36817) Bool)

(assert (=> start!137178 (= res!1079759 (isStrictlySorted!1075 l!1390))))

(assert (=> start!137178 e!881761))

(declare-fun e!881762 () Bool)

(assert (=> start!137178 e!881762))

(assert (=> start!137178 true))

(declare-fun tp_is_empty!39215 () Bool)

(assert (=> start!137178 tp_is_empty!39215))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun b!1580548 () Bool)

(declare-fun e!881760 () Bool)

(declare-fun value!194 () B!2670)

(declare-datatypes ((Option!906 0))(
  ( (Some!905 (v!22406 B!2670)) (None!904) )
))
(declare-fun getValueByKey!816 (List!36817 (_ BitVec 64)) Option!906)

(assert (=> b!1580548 (= e!881760 (not (= (getValueByKey!816 l!1390 key!405) (Some!905 value!194))))))

(declare-fun b!1580549 () Bool)

(declare-fun res!1079762 () Bool)

(assert (=> b!1580549 (=> (not res!1079762) (not e!881761))))

(declare-fun containsKey!921 (List!36817 (_ BitVec 64)) Bool)

(assert (=> b!1580549 (= res!1079762 (containsKey!921 l!1390 key!405))))

(declare-fun b!1580550 () Bool)

(declare-fun res!1079761 () Bool)

(assert (=> b!1580550 (=> (not res!1079761) (not e!881760))))

(declare-datatypes ((tuple2!25526 0))(
  ( (tuple2!25527 (_1!12774 tuple2!25524) (_2!12774 List!36817)) )
))
(declare-datatypes ((Option!907 0))(
  ( (Some!906 (v!22407 tuple2!25526)) (None!905) )
))
(declare-fun lt!676792 () Option!907)

(declare-fun get!26795 (Option!907) tuple2!25526)

(assert (=> b!1580550 (= res!1079761 (is-Nil!36814 (_2!12774 (get!26795 lt!676792))))))

(declare-fun b!1580551 () Bool)

(declare-fun tp!114492 () Bool)

(assert (=> b!1580551 (= e!881762 (and tp_is_empty!39215 tp!114492))))

(declare-fun b!1580552 () Bool)

(assert (=> b!1580552 (= e!881761 e!881760)))

(declare-fun res!1079763 () Bool)

(assert (=> b!1580552 (=> (not res!1079763) (not e!881760))))

(declare-fun isEmpty!1168 (Option!907) Bool)

(assert (=> b!1580552 (= res!1079763 (not (isEmpty!1168 lt!676792)))))

(declare-fun unapply!84 (List!36817) Option!907)

(assert (=> b!1580552 (= lt!676792 (unapply!84 l!1390))))

(declare-fun b!1580553 () Bool)

(declare-fun res!1079760 () Bool)

(assert (=> b!1580553 (=> (not res!1079760) (not e!881761))))

(declare-fun contains!10489 (List!36817 tuple2!25524) Bool)

(assert (=> b!1580553 (= res!1079760 (contains!10489 l!1390 (tuple2!25525 key!405 value!194)))))

(assert (= (and start!137178 res!1079759) b!1580549))

(assert (= (and b!1580549 res!1079762) b!1580553))

(assert (= (and b!1580553 res!1079760) b!1580552))

(assert (= (and b!1580552 res!1079763) b!1580550))

(assert (= (and b!1580550 res!1079761) b!1580548))

(assert (= (and start!137178 (is-Cons!36813 l!1390)) b!1580551))

(declare-fun m!1451921 () Bool)

(assert (=> b!1580548 m!1451921))

(declare-fun m!1451923 () Bool)

(assert (=> start!137178 m!1451923))

(declare-fun m!1451925 () Bool)

(assert (=> b!1580552 m!1451925))

(declare-fun m!1451927 () Bool)

(assert (=> b!1580552 m!1451927))

(declare-fun m!1451929 () Bool)

(assert (=> b!1580549 m!1451929))

(declare-fun m!1451931 () Bool)

(assert (=> b!1580550 m!1451931))

(declare-fun m!1451933 () Bool)

(assert (=> b!1580553 m!1451933))

(push 1)

(assert (not b!1580548))

(assert (not b!1580553))

(assert tp_is_empty!39215)

(assert (not b!1580552))

(assert (not start!137178))

(assert (not b!1580551))

(assert (not b!1580549))

(assert (not b!1580550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166439 () Bool)

(declare-fun res!1079768 () Bool)

(declare-fun e!881777 () Bool)

(assert (=> d!166439 (=> res!1079768 e!881777)))

(assert (=> d!166439 (= res!1079768 (and (is-Cons!36813 l!1390) (= (_1!12773 (h!38356 l!1390)) key!405)))))

(assert (=> d!166439 (= (containsKey!921 l!1390 key!405) e!881777)))

(declare-fun b!1580578 () Bool)

(declare-fun e!881778 () Bool)

(assert (=> b!1580578 (= e!881777 e!881778)))

(declare-fun res!1079769 () Bool)

(assert (=> b!1580578 (=> (not res!1079769) (not e!881778))))

(assert (=> b!1580578 (= res!1079769 (and (or (not (is-Cons!36813 l!1390)) (bvsle (_1!12773 (h!38356 l!1390)) key!405)) (is-Cons!36813 l!1390) (bvslt (_1!12773 (h!38356 l!1390)) key!405)))))

(declare-fun b!1580579 () Bool)

(assert (=> b!1580579 (= e!881778 (containsKey!921 (t!51731 l!1390) key!405))))

(assert (= (and d!166439 (not res!1079768)) b!1580578))

(assert (= (and b!1580578 res!1079769) b!1580579))

(declare-fun m!1451937 () Bool)

(assert (=> b!1580579 m!1451937))

(assert (=> b!1580549 d!166439))

(declare-fun d!166443 () Bool)

(declare-fun lt!676798 () Bool)

(declare-fun content!835 (List!36817) (Set tuple2!25524))

(assert (=> d!166443 (= lt!676798 (member (tuple2!25525 key!405 value!194) (content!835 l!1390)))))

(declare-fun e!881798 () Bool)

(assert (=> d!166443 (= lt!676798 e!881798)))

(declare-fun res!1079786 () Bool)

(assert (=> d!166443 (=> (not res!1079786) (not e!881798))))

(assert (=> d!166443 (= res!1079786 (is-Cons!36813 l!1390))))

(assert (=> d!166443 (= (contains!10489 l!1390 (tuple2!25525 key!405 value!194)) lt!676798)))

(declare-fun b!1580600 () Bool)

(declare-fun e!881797 () Bool)

(assert (=> b!1580600 (= e!881798 e!881797)))

(declare-fun res!1079787 () Bool)

(assert (=> b!1580600 (=> res!1079787 e!881797)))

(assert (=> b!1580600 (= res!1079787 (= (h!38356 l!1390) (tuple2!25525 key!405 value!194)))))

(declare-fun b!1580601 () Bool)

(assert (=> b!1580601 (= e!881797 (contains!10489 (t!51731 l!1390) (tuple2!25525 key!405 value!194)))))

(assert (= (and d!166443 res!1079786) b!1580600))

(assert (= (and b!1580600 (not res!1079787)) b!1580601))

(declare-fun m!1451949 () Bool)

(assert (=> d!166443 m!1451949))

(declare-fun m!1451951 () Bool)

(assert (=> d!166443 m!1451951))

(declare-fun m!1451953 () Bool)

(assert (=> b!1580601 m!1451953))

(assert (=> b!1580553 d!166443))

(declare-fun b!1580623 () Bool)

(declare-fun e!881815 () Option!906)

(declare-fun e!881816 () Option!906)

(assert (=> b!1580623 (= e!881815 e!881816)))

(declare-fun c!146550 () Bool)

(assert (=> b!1580623 (= c!146550 (and (is-Cons!36813 l!1390) (not (= (_1!12773 (h!38356 l!1390)) key!405))))))

(declare-fun b!1580622 () Bool)

(assert (=> b!1580622 (= e!881815 (Some!905 (_2!12773 (h!38356 l!1390))))))

(declare-fun b!1580624 () Bool)

(assert (=> b!1580624 (= e!881816 (getValueByKey!816 (t!51731 l!1390) key!405))))

(declare-fun b!1580625 () Bool)

(assert (=> b!1580625 (= e!881816 None!904)))

(declare-fun d!166451 () Bool)

(declare-fun c!146549 () Bool)

(assert (=> d!166451 (= c!146549 (and (is-Cons!36813 l!1390) (= (_1!12773 (h!38356 l!1390)) key!405)))))

(assert (=> d!166451 (= (getValueByKey!816 l!1390 key!405) e!881815)))

(assert (= (and d!166451 c!146549) b!1580622))

(assert (= (and d!166451 (not c!146549)) b!1580623))

(assert (= (and b!1580623 c!146550) b!1580624))

(assert (= (and b!1580623 (not c!146550)) b!1580625))

(declare-fun m!1451959 () Bool)

(assert (=> b!1580624 m!1451959))

(assert (=> b!1580548 d!166451))

(declare-fun d!166461 () Bool)

(assert (=> d!166461 (= (isEmpty!1168 lt!676792) (not (is-Some!906 lt!676792)))))

(assert (=> b!1580552 d!166461))

(declare-fun d!166465 () Bool)

(assert (=> d!166465 (= (unapply!84 l!1390) (ite (is-Nil!36814 l!1390) None!905 (Some!906 (tuple2!25527 (h!38356 l!1390) (t!51731 l!1390)))))))

(assert (=> b!1580552 d!166465))

(declare-fun d!166469 () Bool)

(declare-fun res!1079814 () Bool)

(declare-fun e!881831 () Bool)

(assert (=> d!166469 (=> res!1079814 e!881831)))

(assert (=> d!166469 (= res!1079814 (or (is-Nil!36814 l!1390) (is-Nil!36814 (t!51731 l!1390))))))

(assert (=> d!166469 (= (isStrictlySorted!1075 l!1390) e!881831)))

(declare-fun b!1580642 () Bool)

(declare-fun e!881832 () Bool)

(assert (=> b!1580642 (= e!881831 e!881832)))

(declare-fun res!1079815 () Bool)

(assert (=> b!1580642 (=> (not res!1079815) (not e!881832))))

(assert (=> b!1580642 (= res!1079815 (bvslt (_1!12773 (h!38356 l!1390)) (_1!12773 (h!38356 (t!51731 l!1390)))))))

(declare-fun b!1580643 () Bool)

(assert (=> b!1580643 (= e!881832 (isStrictlySorted!1075 (t!51731 l!1390)))))

(assert (= (and d!166469 (not res!1079814)) b!1580642))

(assert (= (and b!1580642 res!1079815) b!1580643))

(declare-fun m!1451963 () Bool)

(assert (=> b!1580643 m!1451963))

(assert (=> start!137178 d!166469))

(declare-fun d!166475 () Bool)

(assert (=> d!166475 (= (get!26795 lt!676792) (v!22407 lt!676792))))

(assert (=> b!1580550 d!166475))

(declare-fun b!1580658 () Bool)

(declare-fun e!881843 () Bool)

(declare-fun tp!114501 () Bool)

(assert (=> b!1580658 (= e!881843 (and tp_is_empty!39215 tp!114501))))

(assert (=> b!1580551 (= tp!114492 e!881843)))

(assert (= (and b!1580551 (is-Cons!36813 (t!51731 l!1390))) b!1580658))

(push 1)

(assert (not b!1580643))

(assert (not b!1580658))

(assert (not b!1580624))

(assert tp_is_empty!39215)

(assert (not d!166443))

(assert (not b!1580579))

(assert (not b!1580601))

(check-sat)

(pop 1)

(push 1)

(check-sat)

