; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132502 () Bool)

(assert start!132502)

(declare-fun res!1063524 () Bool)

(declare-fun e!865225 () Bool)

(assert (=> start!132502 (=> (not res!1063524) (not e!865225))))

(declare-datatypes ((B!2224 0))(
  ( (B!2225 (val!19198 Int)) )
))
(declare-datatypes ((tuple2!24772 0))(
  ( (tuple2!24773 (_1!12397 (_ BitVec 64)) (_2!12397 B!2224)) )
))
(declare-datatypes ((List!36232 0))(
  ( (Nil!36229) (Cons!36228 (h!37674 tuple2!24772) (t!50953 List!36232)) )
))
(declare-datatypes ((ListLongMap!22381 0))(
  ( (ListLongMap!22382 (toList!11206 List!36232)) )
))
(declare-fun lm!249 () ListLongMap!22381)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10151 (ListLongMap!22381 (_ BitVec 64)) Bool)

(assert (=> start!132502 (= res!1063524 (contains!10151 lm!249 a0!49))))

(assert (=> start!132502 e!865225))

(declare-fun e!865226 () Bool)

(declare-fun inv!57320 (ListLongMap!22381) Bool)

(assert (=> start!132502 (and (inv!57320 lm!249) e!865226)))

(assert (=> start!132502 true))

(declare-fun tp_is_empty!38235 () Bool)

(assert (=> start!132502 tp_is_empty!38235))

(declare-fun b!1553940 () Bool)

(declare-fun res!1063525 () Bool)

(assert (=> b!1553940 (=> (not res!1063525) (not e!865225))))

(declare-fun containsKey!765 (List!36232 (_ BitVec 64)) Bool)

(assert (=> b!1553940 (= res!1063525 (containsKey!765 (toList!11206 lm!249) a0!49))))

(declare-fun b!1553941 () Bool)

(declare-fun e!865223 () Bool)

(assert (=> b!1553941 (= e!865223 true)))

(declare-datatypes ((Option!819 0))(
  ( (Some!818 (v!22003 B!2224)) (None!817) )
))
(declare-fun isDefined!556 (Option!819) Bool)

(declare-fun getValueByKey!743 (List!36232 (_ BitVec 64)) Option!819)

(assert (=> b!1553941 (isDefined!556 (getValueByKey!743 (toList!11206 lm!249) a0!49))))

(declare-datatypes ((Unit!51763 0))(
  ( (Unit!51764) )
))
(declare-fun lt!669868 () Unit!51763)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!508 (List!36232 (_ BitVec 64)) Unit!51763)

(assert (=> b!1553941 (= lt!669868 (lemmaContainsKeyImpliesGetValueByKeyDefined!508 (toList!11206 lm!249) a0!49))))

(declare-fun b!1553942 () Bool)

(declare-fun tp!112140 () Bool)

(assert (=> b!1553942 (= e!865226 tp!112140)))

(declare-fun e!865224 () Bool)

(declare-fun lt!669867 () List!36232)

(declare-fun b!1553943 () Bool)

(assert (=> b!1553943 (= e!865224 (= (getValueByKey!743 lt!669867 a0!49) (getValueByKey!743 (toList!11206 lm!249) a0!49)))))

(declare-fun b!1553944 () Bool)

(assert (=> b!1553944 (= e!865225 (not e!865223))))

(declare-fun res!1063527 () Bool)

(assert (=> b!1553944 (=> res!1063527 e!865223)))

(declare-fun isStrictlySorted!895 (List!36232) Bool)

(assert (=> b!1553944 (= res!1063527 (not (isStrictlySorted!895 (toList!11206 lm!249))))))

(assert (=> b!1553944 e!865224))

(declare-fun res!1063528 () Bool)

(assert (=> b!1553944 (=> (not res!1063528) (not e!865224))))

(assert (=> b!1553944 (= res!1063528 (containsKey!765 lt!669867 a0!49))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2224)

(declare-fun insertStrictlySorted!511 (List!36232 (_ BitVec 64) B!2224) List!36232)

(assert (=> b!1553944 (= lt!669867 (insertStrictlySorted!511 (toList!11206 lm!249) a!523 b!96))))

(declare-fun lt!669869 () Unit!51763)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!8 (List!36232 (_ BitVec 64) B!2224 (_ BitVec 64)) Unit!51763)

(assert (=> b!1553944 (= lt!669869 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!8 (toList!11206 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1553945 () Bool)

(declare-fun res!1063526 () Bool)

(assert (=> b!1553945 (=> (not res!1063526) (not e!865225))))

(assert (=> b!1553945 (= res!1063526 (not (= a0!49 a!523)))))

(assert (= (and start!132502 res!1063524) b!1553945))

(assert (= (and b!1553945 res!1063526) b!1553940))

(assert (= (and b!1553940 res!1063525) b!1553944))

(assert (= (and b!1553944 res!1063528) b!1553943))

(assert (= (and b!1553944 (not res!1063527)) b!1553941))

(assert (= start!132502 b!1553942))

(declare-fun m!1432483 () Bool)

(assert (=> b!1553941 m!1432483))

(assert (=> b!1553941 m!1432483))

(declare-fun m!1432485 () Bool)

(assert (=> b!1553941 m!1432485))

(declare-fun m!1432487 () Bool)

(assert (=> b!1553941 m!1432487))

(declare-fun m!1432489 () Bool)

(assert (=> b!1553944 m!1432489))

(declare-fun m!1432491 () Bool)

(assert (=> b!1553944 m!1432491))

(declare-fun m!1432493 () Bool)

(assert (=> b!1553944 m!1432493))

(declare-fun m!1432495 () Bool)

(assert (=> b!1553944 m!1432495))

(declare-fun m!1432497 () Bool)

(assert (=> start!132502 m!1432497))

(declare-fun m!1432499 () Bool)

(assert (=> start!132502 m!1432499))

(declare-fun m!1432501 () Bool)

(assert (=> b!1553940 m!1432501))

(declare-fun m!1432503 () Bool)

(assert (=> b!1553943 m!1432503))

(assert (=> b!1553943 m!1432483))

(check-sat (not b!1553942) (not b!1553943) (not b!1553944) tp_is_empty!38235 (not start!132502) (not b!1553940) (not b!1553941))
(check-sat)
