; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132500 () Bool)

(assert start!132500)

(declare-fun b!1553922 () Bool)

(declare-fun res!1063510 () Bool)

(declare-fun e!865213 () Bool)

(assert (=> b!1553922 (=> (not res!1063510) (not e!865213))))

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553922 (= res!1063510 (not (= a0!49 a!523)))))

(declare-fun b!1553923 () Bool)

(declare-fun e!865211 () Bool)

(assert (=> b!1553923 (= e!865213 (not e!865211))))

(declare-fun res!1063512 () Bool)

(assert (=> b!1553923 (=> res!1063512 e!865211)))

(declare-datatypes ((B!2222 0))(
  ( (B!2223 (val!19197 Int)) )
))
(declare-datatypes ((tuple2!24770 0))(
  ( (tuple2!24771 (_1!12396 (_ BitVec 64)) (_2!12396 B!2222)) )
))
(declare-datatypes ((List!36231 0))(
  ( (Nil!36228) (Cons!36227 (h!37673 tuple2!24770) (t!50952 List!36231)) )
))
(declare-datatypes ((ListLongMap!22379 0))(
  ( (ListLongMap!22380 (toList!11205 List!36231)) )
))
(declare-fun lm!249 () ListLongMap!22379)

(declare-fun isStrictlySorted!894 (List!36231) Bool)

(assert (=> b!1553923 (= res!1063512 (not (isStrictlySorted!894 (toList!11205 lm!249))))))

(declare-fun e!865212 () Bool)

(assert (=> b!1553923 e!865212))

(declare-fun res!1063513 () Bool)

(assert (=> b!1553923 (=> (not res!1063513) (not e!865212))))

(declare-fun lt!669858 () List!36231)

(declare-fun containsKey!764 (List!36231 (_ BitVec 64)) Bool)

(assert (=> b!1553923 (= res!1063513 (containsKey!764 lt!669858 a0!49))))

(declare-fun b!96 () B!2222)

(declare-fun insertStrictlySorted!510 (List!36231 (_ BitVec 64) B!2222) List!36231)

(assert (=> b!1553923 (= lt!669858 (insertStrictlySorted!510 (toList!11205 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51761 0))(
  ( (Unit!51762) )
))
(declare-fun lt!669860 () Unit!51761)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!7 (List!36231 (_ BitVec 64) B!2222 (_ BitVec 64)) Unit!51761)

(assert (=> b!1553923 (= lt!669860 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!7 (toList!11205 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1553924 () Bool)

(assert (=> b!1553924 (= e!865211 true)))

(declare-datatypes ((Option!818 0))(
  ( (Some!817 (v!22002 B!2222)) (None!816) )
))
(declare-fun isDefined!555 (Option!818) Bool)

(declare-fun getValueByKey!742 (List!36231 (_ BitVec 64)) Option!818)

(assert (=> b!1553924 (isDefined!555 (getValueByKey!742 (toList!11205 lm!249) a0!49))))

(declare-fun lt!669859 () Unit!51761)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!507 (List!36231 (_ BitVec 64)) Unit!51761)

(assert (=> b!1553924 (= lt!669859 (lemmaContainsKeyImpliesGetValueByKeyDefined!507 (toList!11205 lm!249) a0!49))))

(declare-fun res!1063509 () Bool)

(assert (=> start!132500 (=> (not res!1063509) (not e!865213))))

(declare-fun contains!10150 (ListLongMap!22379 (_ BitVec 64)) Bool)

(assert (=> start!132500 (= res!1063509 (contains!10150 lm!249 a0!49))))

(assert (=> start!132500 e!865213))

(declare-fun e!865214 () Bool)

(declare-fun inv!57319 (ListLongMap!22379) Bool)

(assert (=> start!132500 (and (inv!57319 lm!249) e!865214)))

(assert (=> start!132500 true))

(declare-fun tp_is_empty!38233 () Bool)

(assert (=> start!132500 tp_is_empty!38233))

(declare-fun b!1553925 () Bool)

(declare-fun res!1063511 () Bool)

(assert (=> b!1553925 (=> (not res!1063511) (not e!865213))))

(assert (=> b!1553925 (= res!1063511 (containsKey!764 (toList!11205 lm!249) a0!49))))

(declare-fun b!1553926 () Bool)

(assert (=> b!1553926 (= e!865212 (= (getValueByKey!742 lt!669858 a0!49) (getValueByKey!742 (toList!11205 lm!249) a0!49)))))

(declare-fun b!1553927 () Bool)

(declare-fun tp!112137 () Bool)

(assert (=> b!1553927 (= e!865214 tp!112137)))

(assert (= (and start!132500 res!1063509) b!1553922))

(assert (= (and b!1553922 res!1063510) b!1553925))

(assert (= (and b!1553925 res!1063511) b!1553923))

(assert (= (and b!1553923 res!1063513) b!1553926))

(assert (= (and b!1553923 (not res!1063512)) b!1553924))

(assert (= start!132500 b!1553927))

(declare-fun m!1432461 () Bool)

(assert (=> start!132500 m!1432461))

(declare-fun m!1432463 () Bool)

(assert (=> start!132500 m!1432463))

(declare-fun m!1432465 () Bool)

(assert (=> b!1553925 m!1432465))

(declare-fun m!1432467 () Bool)

(assert (=> b!1553926 m!1432467))

(declare-fun m!1432469 () Bool)

(assert (=> b!1553926 m!1432469))

(assert (=> b!1553924 m!1432469))

(assert (=> b!1553924 m!1432469))

(declare-fun m!1432471 () Bool)

(assert (=> b!1553924 m!1432471))

(declare-fun m!1432473 () Bool)

(assert (=> b!1553924 m!1432473))

(declare-fun m!1432475 () Bool)

(assert (=> b!1553923 m!1432475))

(declare-fun m!1432477 () Bool)

(assert (=> b!1553923 m!1432477))

(declare-fun m!1432479 () Bool)

(assert (=> b!1553923 m!1432479))

(declare-fun m!1432481 () Bool)

(assert (=> b!1553923 m!1432481))

(push 1)

(assert (not b!1553925))

(assert tp_is_empty!38233)

(assert (not b!1553926))

(assert (not b!1553923))

(assert (not b!1553927))

(assert (not b!1553924))

(assert (not start!132500))

(check-sat)

