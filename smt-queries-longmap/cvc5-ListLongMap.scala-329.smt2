; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6028 () Bool)

(assert start!6028)

(declare-fun b_free!1435 () Bool)

(declare-fun b_next!1435 () Bool)

(assert (=> start!6028 (= b_free!1435 (not b_next!1435))))

(declare-fun tp!5840 () Bool)

(declare-fun b_and!2519 () Bool)

(assert (=> start!6028 (= tp!5840 b_and!2519)))

(declare-fun b!41947 () Bool)

(declare-fun e!26517 () Bool)

(declare-fun e!26516 () Bool)

(assert (=> b!41947 (= e!26517 (not e!26516))))

(declare-fun res!24981 () Bool)

(assert (=> b!41947 (=> res!24981 e!26516)))

(declare-datatypes ((V!2193 0))(
  ( (V!2194 (val!951 Int)) )
))
(declare-datatypes ((tuple2!1556 0))(
  ( (tuple2!1557 (_1!789 (_ BitVec 64)) (_2!789 V!2193)) )
))
(declare-datatypes ((List!1124 0))(
  ( (Nil!1121) (Cons!1120 (h!1697 tuple2!1556) (t!4055 List!1124)) )
))
(declare-datatypes ((ListLongMap!1133 0))(
  ( (ListLongMap!1134 (toList!582 List!1124)) )
))
(declare-fun lt!17056 () ListLongMap!1133)

(assert (=> b!41947 (= res!24981 (= lt!17056 (ListLongMap!1134 Nil!1121)))))

(declare-datatypes ((array!2735 0))(
  ( (array!2736 (arr!1311 (Array (_ BitVec 32) (_ BitVec 64))) (size!1469 (_ BitVec 32))) )
))
(declare-fun lt!17061 () array!2735)

(declare-datatypes ((ValueCell!665 0))(
  ( (ValueCellFull!665 (v!2035 V!2193)) (EmptyCell!665) )
))
(declare-datatypes ((array!2737 0))(
  ( (array!2738 (arr!1312 (Array (_ BitVec 32) ValueCell!665)) (size!1470 (_ BitVec 32))) )
))
(declare-fun lt!17057 () array!2737)

(declare-fun lt!17062 () V!2193)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((LongMapFixedSize!310 0))(
  ( (LongMapFixedSize!311 (defaultEntry!1848 Int) (mask!5278 (_ BitVec 32)) (extraKeys!1739 (_ BitVec 32)) (zeroValue!1766 V!2193) (minValue!1766 V!2193) (_size!204 (_ BitVec 32)) (_keys!3361 array!2735) (_values!1831 array!2737) (_vacant!204 (_ BitVec 32))) )
))
(declare-fun map!749 (LongMapFixedSize!310) ListLongMap!1133)

(assert (=> b!41947 (= lt!17056 (map!749 (LongMapFixedSize!311 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17062 lt!17062 #b00000000000000000000000000000000 lt!17061 lt!17057 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1125 0))(
  ( (Nil!1122) (Cons!1121 (h!1698 (_ BitVec 64)) (t!4056 List!1125)) )
))
(declare-fun arrayNoDuplicates!0 (array!2735 (_ BitVec 32) List!1125) Bool)

(assert (=> b!41947 (arrayNoDuplicates!0 lt!17061 #b00000000000000000000000000000000 Nil!1122)))

(declare-datatypes ((Unit!1065 0))(
  ( (Unit!1066) )
))
(declare-fun lt!17060 () Unit!1065)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2735 (_ BitVec 32) (_ BitVec 32) List!1125) Unit!1065)

(assert (=> b!41947 (= lt!17060 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17061 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2735 (_ BitVec 32)) Bool)

(assert (=> b!41947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17061 mask!853)))

(declare-fun lt!17058 () Unit!1065)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2735 (_ BitVec 32) (_ BitVec 32)) Unit!1065)

(assert (=> b!41947 (= lt!17058 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17061 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2735 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41947 (= (arrayCountValidKeys!0 lt!17061 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17063 () Unit!1065)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2735 (_ BitVec 32) (_ BitVec 32)) Unit!1065)

(assert (=> b!41947 (= lt!17063 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17061 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41947 (= lt!17057 (array!2738 ((as const (Array (_ BitVec 32) ValueCell!665)) EmptyCell!665) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41947 (= lt!17061 (array!2736 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!226 (Int (_ BitVec 64)) V!2193)

(assert (=> b!41947 (= lt!17062 (dynLambda!226 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41949 () Bool)

(assert (=> b!41949 (= e!26516 true)))

(declare-fun e!26518 () Bool)

(assert (=> b!41949 e!26518))

(declare-fun res!24982 () Bool)

(assert (=> b!41949 (=> (not res!24982) (not e!26518))))

(declare-fun lt!17059 () tuple2!1556)

(assert (=> b!41949 (= res!24982 (and (not (= (_1!789 lt!17059) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!789 lt!17059) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!17055 () Unit!1065)

(declare-fun lemmaKeyInListMapIsInArray!97 (array!2735 array!2737 (_ BitVec 32) (_ BitVec 32) V!2193 V!2193 (_ BitVec 64) Int) Unit!1065)

(assert (=> b!41949 (= lt!17055 (lemmaKeyInListMapIsInArray!97 lt!17061 lt!17057 mask!853 #b00000000000000000000000000000000 lt!17062 lt!17062 (_1!789 lt!17059) defaultEntry!470))))

(declare-fun head!881 (List!1124) tuple2!1556)

(assert (=> b!41949 (= lt!17059 (head!881 (toList!582 lt!17056)))))

(declare-fun res!24983 () Bool)

(assert (=> start!6028 (=> (not res!24983) (not e!26517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6028 (= res!24983 (validMask!0 mask!853))))

(assert (=> start!6028 e!26517))

(assert (=> start!6028 true))

(assert (=> start!6028 tp!5840))

(declare-fun b!41950 () Bool)

(declare-fun arrayContainsKey!0 (array!2735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41950 (= e!26518 (arrayContainsKey!0 lt!17061 (_1!789 lt!17059) #b00000000000000000000000000000000))))

(declare-fun b!41948 () Bool)

(declare-fun res!24984 () Bool)

(assert (=> b!41948 (=> res!24984 e!26516)))

(declare-fun isEmpty!268 (List!1124) Bool)

(assert (=> b!41948 (= res!24984 (isEmpty!268 (toList!582 lt!17056)))))

(assert (= (and start!6028 res!24983) b!41947))

(assert (= (and b!41947 (not res!24981)) b!41948))

(assert (= (and b!41948 (not res!24984)) b!41949))

(assert (= (and b!41949 res!24982) b!41950))

(declare-fun b_lambda!2165 () Bool)

(assert (=> (not b_lambda!2165) (not b!41947)))

(declare-fun t!4054 () Bool)

(declare-fun tb!917 () Bool)

(assert (=> (and start!6028 (= defaultEntry!470 defaultEntry!470) t!4054) tb!917))

(declare-fun result!1585 () Bool)

(declare-fun tp_is_empty!1825 () Bool)

(assert (=> tb!917 (= result!1585 tp_is_empty!1825)))

(assert (=> b!41947 t!4054))

(declare-fun b_and!2521 () Bool)

(assert (= b_and!2519 (and (=> t!4054 result!1585) b_and!2521)))

(declare-fun m!35455 () Bool)

(assert (=> b!41949 m!35455))

(declare-fun m!35457 () Bool)

(assert (=> b!41949 m!35457))

(declare-fun m!35459 () Bool)

(assert (=> b!41950 m!35459))

(declare-fun m!35461 () Bool)

(assert (=> b!41948 m!35461))

(declare-fun m!35463 () Bool)

(assert (=> b!41947 m!35463))

(declare-fun m!35465 () Bool)

(assert (=> b!41947 m!35465))

(declare-fun m!35467 () Bool)

(assert (=> b!41947 m!35467))

(declare-fun m!35469 () Bool)

(assert (=> b!41947 m!35469))

(declare-fun m!35471 () Bool)

(assert (=> b!41947 m!35471))

(declare-fun m!35473 () Bool)

(assert (=> b!41947 m!35473))

(declare-fun m!35475 () Bool)

(assert (=> b!41947 m!35475))

(declare-fun m!35477 () Bool)

(assert (=> b!41947 m!35477))

(declare-fun m!35479 () Bool)

(assert (=> start!6028 m!35479))

(push 1)

(assert (not b_next!1435))

(assert (not b!41949))

(assert (not b!41950))

(assert b_and!2521)

(assert tp_is_empty!1825)

(assert (not b!41948))

(assert (not start!6028))

(assert (not b_lambda!2165))

(assert (not b!41947))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2521)

(assert (not b_next!1435))

(check-sat)

(pop 1)

