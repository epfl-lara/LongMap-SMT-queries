; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106244 () Bool)

(assert start!106244)

(declare-fun res!842164 () Bool)

(declare-fun e!720130 () Bool)

(assert (=> start!106244 (=> (not res!842164) (not e!720130))))

(declare-datatypes ((B!1920 0))(
  ( (B!1921 (val!16295 Int)) )
))
(declare-datatypes ((tuple2!21108 0))(
  ( (tuple2!21109 (_1!10565 (_ BitVec 64)) (_2!10565 B!1920)) )
))
(declare-datatypes ((List!28287 0))(
  ( (Nil!28284) (Cons!28283 (h!29492 tuple2!21108) (t!41808 List!28287)) )
))
(declare-datatypes ((ListLongMap!18981 0))(
  ( (ListLongMap!18982 (toList!9506 List!28287)) )
))
(declare-fun lm!212 () ListLongMap!18981)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7627 (ListLongMap!18981 (_ BitVec 64)) Bool)

(assert (=> start!106244 (= res!842164 (not (contains!7627 lm!212 a1!67)))))

(assert (=> start!106244 e!720130))

(declare-fun e!720131 () Bool)

(declare-fun inv!44082 (ListLongMap!18981) Bool)

(assert (=> start!106244 (and (inv!44082 lm!212) e!720131)))

(assert (=> start!106244 true))

(declare-fun b!1264601 () Bool)

(declare-fun res!842163 () Bool)

(assert (=> b!1264601 (=> (not res!842163) (not e!720130))))

(declare-fun isStrictlySorted!774 (List!28287) Bool)

(assert (=> b!1264601 (= res!842163 (isStrictlySorted!774 (toList!9506 lm!212)))))

(declare-fun b!1264602 () Bool)

(declare-fun containsKey!633 (List!28287 (_ BitVec 64)) Bool)

(assert (=> b!1264602 (= e!720130 (containsKey!633 (toList!9506 lm!212) a1!67))))

(declare-fun b!1264603 () Bool)

(declare-fun tp!96227 () Bool)

(assert (=> b!1264603 (= e!720131 tp!96227)))

(assert (= (and start!106244 res!842164) b!1264601))

(assert (= (and b!1264601 res!842163) b!1264602))

(assert (= start!106244 b!1264603))

(declare-fun m!1165135 () Bool)

(assert (=> start!106244 m!1165135))

(declare-fun m!1165137 () Bool)

(assert (=> start!106244 m!1165137))

(declare-fun m!1165139 () Bool)

(assert (=> b!1264601 m!1165139))

(declare-fun m!1165141 () Bool)

(assert (=> b!1264602 m!1165141))

(push 1)

(assert (not b!1264602))

(assert (not b!1264601))

(assert (not start!106244))

(assert (not b!1264603))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138757 () Bool)

(declare-fun res!842189 () Bool)

(declare-fun e!720156 () Bool)

(assert (=> d!138757 (=> res!842189 e!720156)))

(assert (=> d!138757 (= res!842189 (and (is-Cons!28283 (toList!9506 lm!212)) (= (_1!10565 (h!29492 (toList!9506 lm!212))) a1!67)))))

(assert (=> d!138757 (= (containsKey!633 (toList!9506 lm!212) a1!67) e!720156)))

(declare-fun b!1264626 () Bool)

(declare-fun e!720157 () Bool)

(assert (=> b!1264626 (= e!720156 e!720157)))

(declare-fun res!842190 () Bool)

(assert (=> b!1264626 (=> (not res!842190) (not e!720157))))

(assert (=> b!1264626 (= res!842190 (and (or (not (is-Cons!28283 (toList!9506 lm!212))) (bvsle (_1!10565 (h!29492 (toList!9506 lm!212))) a1!67)) (is-Cons!28283 (toList!9506 lm!212)) (bvslt (_1!10565 (h!29492 (toList!9506 lm!212))) a1!67)))))

(declare-fun b!1264627 () Bool)

(assert (=> b!1264627 (= e!720157 (containsKey!633 (t!41808 (toList!9506 lm!212)) a1!67))))

(assert (= (and d!138757 (not res!842189)) b!1264626))

(assert (= (and b!1264626 res!842190) b!1264627))

(declare-fun m!1165147 () Bool)

(assert (=> b!1264627 m!1165147))

(assert (=> b!1264602 d!138757))

(declare-fun d!138763 () Bool)

(declare-fun res!842199 () Bool)

(declare-fun e!720166 () Bool)

(assert (=> d!138763 (=> res!842199 e!720166)))

(assert (=> d!138763 (= res!842199 (or (is-Nil!28284 (toList!9506 lm!212)) (is-Nil!28284 (t!41808 (toList!9506 lm!212)))))))

(assert (=> d!138763 (= (isStrictlySorted!774 (toList!9506 lm!212)) e!720166)))

(declare-fun b!1264638 () Bool)

(declare-fun e!720167 () Bool)

(assert (=> b!1264638 (= e!720166 e!720167)))

(declare-fun res!842200 () Bool)

(assert (=> b!1264638 (=> (not res!842200) (not e!720167))))

(assert (=> b!1264638 (= res!842200 (bvslt (_1!10565 (h!29492 (toList!9506 lm!212))) (_1!10565 (h!29492 (t!41808 (toList!9506 lm!212))))))))

(declare-fun b!1264639 () Bool)

(assert (=> b!1264639 (= e!720167 (isStrictlySorted!774 (t!41808 (toList!9506 lm!212))))))

(assert (= (and d!138763 (not res!842199)) b!1264638))

(assert (= (and b!1264638 res!842200) b!1264639))

(declare-fun m!1165153 () Bool)

(assert (=> b!1264639 m!1165153))

(assert (=> b!1264601 d!138763))

(declare-fun d!138769 () Bool)

(declare-fun e!720188 () Bool)

(assert (=> d!138769 e!720188))

(declare-fun res!842209 () Bool)

(assert (=> d!138769 (=> res!842209 e!720188)))

(declare-fun lt!573875 () Bool)

(assert (=> d!138769 (= res!842209 (not lt!573875))))

(declare-fun lt!573874 () Bool)

(assert (=> d!138769 (= lt!573875 lt!573874)))

(declare-datatypes ((Unit!42160 0))(
  ( (Unit!42161) )
))
(declare-fun lt!573873 () Unit!42160)

(declare-fun e!720189 () Unit!42160)

(assert (=> d!138769 (= lt!573873 e!720189)))

(declare-fun c!123154 () Bool)

(assert (=> d!138769 (= c!123154 lt!573874)))

(assert (=> d!138769 (= lt!573874 (containsKey!633 (toList!9506 lm!212) a1!67))))

(assert (=> d!138769 (= (contains!7627 lm!212 a1!67) lt!573875)))

(declare-fun b!1264672 () Bool)

(declare-fun lt!573876 () Unit!42160)

(assert (=> b!1264672 (= e!720189 lt!573876)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!442 (List!28287 (_ BitVec 64)) Unit!42160)

(assert (=> b!1264672 (= lt!573876 (lemmaContainsKeyImpliesGetValueByKeyDefined!442 (toList!9506 lm!212) a1!67))))

