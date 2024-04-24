; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106464 () Bool)

(assert start!106464)

(declare-fun res!842672 () Bool)

(declare-fun e!720966 () Bool)

(assert (=> start!106464 (=> (not res!842672) (not e!720966))))

(declare-datatypes ((B!1916 0))(
  ( (B!1917 (val!16293 Int)) )
))
(declare-datatypes ((tuple2!21114 0))(
  ( (tuple2!21115 (_1!10568 (_ BitVec 64)) (_2!10568 B!1916)) )
))
(declare-datatypes ((List!28321 0))(
  ( (Nil!28318) (Cons!28317 (h!29535 tuple2!21114) (t!41834 List!28321)) )
))
(declare-datatypes ((ListLongMap!18995 0))(
  ( (ListLongMap!18996 (toList!9513 List!28321)) )
))
(declare-fun lm!212 () ListLongMap!18995)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7650 (ListLongMap!18995 (_ BitVec 64)) Bool)

(assert (=> start!106464 (= res!842672 (not (contains!7650 lm!212 a1!67)))))

(assert (=> start!106464 e!720966))

(declare-fun e!720965 () Bool)

(declare-fun inv!44080 (ListLongMap!18995) Bool)

(assert (=> start!106464 (and (inv!44080 lm!212) e!720965)))

(assert (=> start!106464 true))

(declare-fun b!1265888 () Bool)

(declare-fun res!842671 () Bool)

(assert (=> b!1265888 (=> (not res!842671) (not e!720966))))

(declare-fun isStrictlySorted!760 (List!28321) Bool)

(assert (=> b!1265888 (= res!842671 (isStrictlySorted!760 (toList!9513 lm!212)))))

(declare-fun b!1265889 () Bool)

(declare-fun containsKey!631 (List!28321 (_ BitVec 64)) Bool)

(assert (=> b!1265889 (= e!720966 (containsKey!631 (toList!9513 lm!212) a1!67))))

(declare-fun b!1265890 () Bool)

(declare-fun tp!96221 () Bool)

(assert (=> b!1265890 (= e!720965 tp!96221)))

(assert (= (and start!106464 res!842672) b!1265888))

(assert (= (and b!1265888 res!842671) b!1265889))

(assert (= start!106464 b!1265890))

(declare-fun m!1166731 () Bool)

(assert (=> start!106464 m!1166731))

(declare-fun m!1166733 () Bool)

(assert (=> start!106464 m!1166733))

(declare-fun m!1166735 () Bool)

(assert (=> b!1265888 m!1166735))

(declare-fun m!1166737 () Bool)

(assert (=> b!1265889 m!1166737))

(check-sat (not start!106464) (not b!1265888) (not b!1265889) (not b!1265890))
(check-sat)
(get-model)

(declare-fun d!139201 () Bool)

(declare-fun e!720984 () Bool)

(assert (=> d!139201 e!720984))

(declare-fun res!842687 () Bool)

(assert (=> d!139201 (=> res!842687 e!720984)))

(declare-fun lt!574334 () Bool)

(assert (=> d!139201 (= res!842687 (not lt!574334))))

(declare-fun lt!574333 () Bool)

(assert (=> d!139201 (= lt!574334 lt!574333)))

(declare-datatypes ((Unit!42127 0))(
  ( (Unit!42128) )
))
(declare-fun lt!574335 () Unit!42127)

(declare-fun e!720983 () Unit!42127)

(assert (=> d!139201 (= lt!574335 e!720983)))

(declare-fun c!123548 () Bool)

(assert (=> d!139201 (= c!123548 lt!574333)))

(assert (=> d!139201 (= lt!574333 (containsKey!631 (toList!9513 lm!212) a1!67))))

(assert (=> d!139201 (= (contains!7650 lm!212 a1!67) lt!574334)))

(declare-fun b!1265915 () Bool)

(declare-fun lt!574336 () Unit!42127)

(assert (=> b!1265915 (= e!720983 lt!574336)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!440 (List!28321 (_ BitVec 64)) Unit!42127)

(assert (=> b!1265915 (= lt!574336 (lemmaContainsKeyImpliesGetValueByKeyDefined!440 (toList!9513 lm!212) a1!67))))

(declare-datatypes ((Option!720 0))(
  ( (Some!719 (v!18997 B!1916)) (None!718) )
))
(declare-fun isDefined!478 (Option!720) Bool)

(declare-fun getValueByKey!669 (List!28321 (_ BitVec 64)) Option!720)

(assert (=> b!1265915 (isDefined!478 (getValueByKey!669 (toList!9513 lm!212) a1!67))))

(declare-fun b!1265916 () Bool)

(declare-fun Unit!42129 () Unit!42127)

(assert (=> b!1265916 (= e!720983 Unit!42129)))

(declare-fun b!1265917 () Bool)

(assert (=> b!1265917 (= e!720984 (isDefined!478 (getValueByKey!669 (toList!9513 lm!212) a1!67)))))

(assert (= (and d!139201 c!123548) b!1265915))

(assert (= (and d!139201 (not c!123548)) b!1265916))

(assert (= (and d!139201 (not res!842687)) b!1265917))

(assert (=> d!139201 m!1166737))

(declare-fun m!1166755 () Bool)

(assert (=> b!1265915 m!1166755))

(declare-fun m!1166757 () Bool)

(assert (=> b!1265915 m!1166757))

(assert (=> b!1265915 m!1166757))

(declare-fun m!1166759 () Bool)

(assert (=> b!1265915 m!1166759))

(assert (=> b!1265917 m!1166757))

(assert (=> b!1265917 m!1166757))

(assert (=> b!1265917 m!1166759))

(assert (=> start!106464 d!139201))

(declare-fun d!139207 () Bool)

(assert (=> d!139207 (= (inv!44080 lm!212) (isStrictlySorted!760 (toList!9513 lm!212)))))

(declare-fun bs!35796 () Bool)

(assert (= bs!35796 d!139207))

(assert (=> bs!35796 m!1166735))

(assert (=> start!106464 d!139207))

(declare-fun d!139209 () Bool)

(declare-fun res!842696 () Bool)

(declare-fun e!720997 () Bool)

(assert (=> d!139209 (=> res!842696 e!720997)))

(get-info :version)

(assert (=> d!139209 (= res!842696 (or ((_ is Nil!28318) (toList!9513 lm!212)) ((_ is Nil!28318) (t!41834 (toList!9513 lm!212)))))))

(assert (=> d!139209 (= (isStrictlySorted!760 (toList!9513 lm!212)) e!720997)))

(declare-fun b!1265934 () Bool)

(declare-fun e!720998 () Bool)

(assert (=> b!1265934 (= e!720997 e!720998)))

(declare-fun res!842697 () Bool)

(assert (=> b!1265934 (=> (not res!842697) (not e!720998))))

(assert (=> b!1265934 (= res!842697 (bvslt (_1!10568 (h!29535 (toList!9513 lm!212))) (_1!10568 (h!29535 (t!41834 (toList!9513 lm!212))))))))

(declare-fun b!1265935 () Bool)

(assert (=> b!1265935 (= e!720998 (isStrictlySorted!760 (t!41834 (toList!9513 lm!212))))))

(assert (= (and d!139209 (not res!842696)) b!1265934))

(assert (= (and b!1265934 res!842697) b!1265935))

(declare-fun m!1166761 () Bool)

(assert (=> b!1265935 m!1166761))

(assert (=> b!1265888 d!139209))

(declare-fun d!139211 () Bool)

(declare-fun res!842704 () Bool)

(declare-fun e!721007 () Bool)

(assert (=> d!139211 (=> res!842704 e!721007)))

(assert (=> d!139211 (= res!842704 (and ((_ is Cons!28317) (toList!9513 lm!212)) (= (_1!10568 (h!29535 (toList!9513 lm!212))) a1!67)))))

(assert (=> d!139211 (= (containsKey!631 (toList!9513 lm!212) a1!67) e!721007)))

(declare-fun b!1265946 () Bool)

(declare-fun e!721008 () Bool)

(assert (=> b!1265946 (= e!721007 e!721008)))

(declare-fun res!842705 () Bool)

(assert (=> b!1265946 (=> (not res!842705) (not e!721008))))

(assert (=> b!1265946 (= res!842705 (and (or (not ((_ is Cons!28317) (toList!9513 lm!212))) (bvsle (_1!10568 (h!29535 (toList!9513 lm!212))) a1!67)) ((_ is Cons!28317) (toList!9513 lm!212)) (bvslt (_1!10568 (h!29535 (toList!9513 lm!212))) a1!67)))))

(declare-fun b!1265947 () Bool)

(assert (=> b!1265947 (= e!721008 (containsKey!631 (t!41834 (toList!9513 lm!212)) a1!67))))

(assert (= (and d!139211 (not res!842704)) b!1265946))

(assert (= (and b!1265946 res!842705) b!1265947))

(declare-fun m!1166775 () Bool)

(assert (=> b!1265947 m!1166775))

(assert (=> b!1265889 d!139211))

(declare-fun b!1265952 () Bool)

(declare-fun e!721011 () Bool)

(declare-fun tp_is_empty!32449 () Bool)

(declare-fun tp!96230 () Bool)

(assert (=> b!1265952 (= e!721011 (and tp_is_empty!32449 tp!96230))))

(assert (=> b!1265890 (= tp!96221 e!721011)))

(assert (= (and b!1265890 ((_ is Cons!28317) (toList!9513 lm!212))) b!1265952))

(check-sat (not d!139207) tp_is_empty!32449 (not b!1265917) (not d!139201) (not b!1265915) (not b!1265947) (not b!1265935) (not b!1265952))
(check-sat)
