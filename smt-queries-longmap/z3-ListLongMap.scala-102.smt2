; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1680 () Bool)

(assert start!1680)

(declare-fun b!11935 () Bool)

(declare-fun e!7108 () Bool)

(assert (=> b!11935 (= e!7108 (not true))))

(declare-datatypes ((B!416 0))(
  ( (B!417 (val!303 Int)) )
))
(declare-datatypes ((tuple2!402 0))(
  ( (tuple2!403 (_1!201 (_ BitVec 64)) (_2!201 B!416)) )
))
(declare-datatypes ((List!351 0))(
  ( (Nil!348) (Cons!347 (h!913 tuple2!402) (t!2738 List!351)) )
))
(declare-datatypes ((ListLongMap!383 0))(
  ( (ListLongMap!384 (toList!207 List!351)) )
))
(declare-fun lm!265 () ListLongMap!383)

(declare-fun a!527 () (_ BitVec 64))

(declare-fun b!100 () B!416)

(declare-fun contains!175 (List!351 tuple2!402) Bool)

(assert (=> b!11935 (contains!175 (toList!207 lm!265) (tuple2!403 a!527 b!100))))

(declare-datatypes ((Unit!268 0))(
  ( (Unit!269) )
))
(declare-fun lt!3081 () Unit!268)

(declare-fun lemmaGetValueByKeyImpliesContainsTuple!1 (List!351 (_ BitVec 64) B!416) Unit!268)

(assert (=> b!11935 (= lt!3081 (lemmaGetValueByKeyImpliesContainsTuple!1 (toList!207 lm!265) a!527 b!100))))

(declare-fun b!11934 () Bool)

(declare-fun res!9799 () Bool)

(assert (=> b!11934 (=> (not res!9799) (not e!7108))))

(declare-fun isStrictlySorted!51 (List!351) Bool)

(assert (=> b!11934 (= res!9799 (isStrictlySorted!51 (toList!207 lm!265)))))

(declare-fun res!9798 () Bool)

(assert (=> start!1680 (=> (not res!9798) (not e!7108))))

(declare-fun contains!176 (ListLongMap!383 (_ BitVec 64)) Bool)

(assert (=> start!1680 (= res!9798 (contains!176 lm!265 a!527))))

(assert (=> start!1680 e!7108))

(declare-fun e!7109 () Bool)

(declare-fun inv!598 (ListLongMap!383) Bool)

(assert (=> start!1680 (and (inv!598 lm!265) e!7109)))

(assert (=> start!1680 true))

(declare-fun tp_is_empty!589 () Bool)

(assert (=> start!1680 tp_is_empty!589))

(declare-fun b!11933 () Bool)

(declare-fun res!9797 () Bool)

(assert (=> b!11933 (=> (not res!9797) (not e!7108))))

(declare-datatypes ((Option!41 0))(
  ( (Some!40 (v!1355 B!416)) (None!39) )
))
(declare-fun getValueByKey!35 (List!351 (_ BitVec 64)) Option!41)

(assert (=> b!11933 (= res!9797 (= (getValueByKey!35 (toList!207 lm!265) a!527) (Some!40 b!100)))))

(declare-fun b!11936 () Bool)

(declare-fun tp!1997 () Bool)

(assert (=> b!11936 (= e!7109 tp!1997)))

(assert (= (and start!1680 res!9798) b!11933))

(assert (= (and b!11933 res!9797) b!11934))

(assert (= (and b!11934 res!9799) b!11935))

(assert (= start!1680 b!11936))

(declare-fun m!8291 () Bool)

(assert (=> b!11935 m!8291))

(declare-fun m!8293 () Bool)

(assert (=> b!11935 m!8293))

(declare-fun m!8295 () Bool)

(assert (=> b!11934 m!8295))

(declare-fun m!8297 () Bool)

(assert (=> start!1680 m!8297))

(declare-fun m!8299 () Bool)

(assert (=> start!1680 m!8299))

(declare-fun m!8301 () Bool)

(assert (=> b!11933 m!8301))

(check-sat tp_is_empty!589 (not b!11933) (not start!1680) (not b!11935) (not b!11936) (not b!11934))
(check-sat)
