; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5944 () Bool)

(assert start!5944)

(declare-fun b_free!1423 () Bool)

(declare-fun b_next!1423 () Bool)

(assert (=> start!5944 (= b_free!1423 (not b_next!1423))))

(declare-fun tp!5822 () Bool)

(declare-fun b_and!2495 () Bool)

(assert (=> start!5944 (= tp!5822 b_and!2495)))

(declare-fun b!41712 () Bool)

(declare-fun res!24846 () Bool)

(declare-fun e!26362 () Bool)

(assert (=> b!41712 (=> res!24846 e!26362)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!41712 (= res!24846 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41713 () Bool)

(assert (=> b!41713 (= e!26362 true)))

(declare-datatypes ((V!2177 0))(
  ( (V!2178 (val!945 Int)) )
))
(declare-fun lt!16833 () V!2177)

(declare-fun lt!16829 () Bool)

(declare-datatypes ((array!2711 0))(
  ( (array!2712 (arr!1299 (Array (_ BitVec 32) (_ BitVec 64))) (size!1451 (_ BitVec 32))) )
))
(declare-fun lt!16831 () array!2711)

(declare-datatypes ((ValueCell!659 0))(
  ( (ValueCellFull!659 (v!2029 V!2177)) (EmptyCell!659) )
))
(declare-datatypes ((array!2713 0))(
  ( (array!2714 (arr!1300 (Array (_ BitVec 32) ValueCell!659)) (size!1452 (_ BitVec 32))) )
))
(declare-fun lt!16830 () array!2713)

(declare-datatypes ((tuple2!1544 0))(
  ( (tuple2!1545 (_1!783 (_ BitVec 64)) (_2!783 V!2177)) )
))
(declare-datatypes ((List!1112 0))(
  ( (Nil!1109) (Cons!1108 (h!1685 tuple2!1544) (t!4031 List!1112)) )
))
(declare-datatypes ((ListLongMap!1121 0))(
  ( (ListLongMap!1122 (toList!576 List!1112)) )
))
(declare-fun lt!16835 () ListLongMap!1121)

(declare-fun defaultEntry!470 () Int)

(declare-fun contains!544 (ListLongMap!1121 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!337 (array!2711 array!2713 (_ BitVec 32) (_ BitVec 32) V!2177 V!2177 (_ BitVec 32) Int) ListLongMap!1121)

(declare-fun head!875 (List!1112) tuple2!1544)

(assert (=> b!41713 (= lt!16829 (contains!544 (getCurrentListMap!337 lt!16831 lt!16830 mask!853 #b00000000000000000000000000000000 lt!16833 lt!16833 #b00000000000000000000000000000000 defaultEntry!470) (_1!783 (head!875 (toList!576 lt!16835)))))))

(declare-fun res!24847 () Bool)

(declare-fun e!26361 () Bool)

(assert (=> start!5944 (=> (not res!24847) (not e!26361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5944 (= res!24847 (validMask!0 mask!853))))

(assert (=> start!5944 e!26361))

(assert (=> start!5944 true))

(assert (=> start!5944 tp!5822))

(declare-fun b!41711 () Bool)

(declare-fun res!24848 () Bool)

(assert (=> b!41711 (=> res!24848 e!26362)))

(declare-fun isEmpty!262 (List!1112) Bool)

(assert (=> b!41711 (= res!24848 (isEmpty!262 (toList!576 lt!16835)))))

(declare-fun b!41710 () Bool)

(assert (=> b!41710 (= e!26361 (not e!26362))))

(declare-fun res!24849 () Bool)

(assert (=> b!41710 (=> res!24849 e!26362)))

(assert (=> b!41710 (= res!24849 (= lt!16835 (ListLongMap!1122 Nil!1109)))))

(declare-datatypes ((LongMapFixedSize!298 0))(
  ( (LongMapFixedSize!299 (defaultEntry!1839 Int) (mask!5256 (_ BitVec 32)) (extraKeys!1730 (_ BitVec 32)) (zeroValue!1757 V!2177) (minValue!1757 V!2177) (_size!198 (_ BitVec 32)) (_keys!3346 array!2711) (_values!1822 array!2713) (_vacant!198 (_ BitVec 32))) )
))
(declare-fun map!739 (LongMapFixedSize!298) ListLongMap!1121)

(assert (=> b!41710 (= lt!16835 (map!739 (LongMapFixedSize!299 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16833 lt!16833 #b00000000000000000000000000000000 lt!16831 lt!16830 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1113 0))(
  ( (Nil!1110) (Cons!1109 (h!1686 (_ BitVec 64)) (t!4032 List!1113)) )
))
(declare-fun arrayNoDuplicates!0 (array!2711 (_ BitVec 32) List!1113) Bool)

(assert (=> b!41710 (arrayNoDuplicates!0 lt!16831 #b00000000000000000000000000000000 Nil!1110)))

(declare-datatypes ((Unit!1053 0))(
  ( (Unit!1054) )
))
(declare-fun lt!16834 () Unit!1053)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2711 (_ BitVec 32) (_ BitVec 32) List!1113) Unit!1053)

(assert (=> b!41710 (= lt!16834 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16831 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2711 (_ BitVec 32)) Bool)

(assert (=> b!41710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16831 mask!853)))

(declare-fun lt!16832 () Unit!1053)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2711 (_ BitVec 32) (_ BitVec 32)) Unit!1053)

(assert (=> b!41710 (= lt!16832 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16831 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2711 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41710 (= (arrayCountValidKeys!0 lt!16831 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16828 () Unit!1053)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2711 (_ BitVec 32) (_ BitVec 32)) Unit!1053)

(assert (=> b!41710 (= lt!16828 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16831 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41710 (= lt!16830 (array!2714 ((as const (Array (_ BitVec 32) ValueCell!659)) EmptyCell!659) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41710 (= lt!16831 (array!2712 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!220 (Int (_ BitVec 64)) V!2177)

(assert (=> b!41710 (= lt!16833 (dynLambda!220 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5944 res!24847) b!41710))

(assert (= (and b!41710 (not res!24849)) b!41711))

(assert (= (and b!41711 (not res!24848)) b!41712))

(assert (= (and b!41712 (not res!24846)) b!41713))

(declare-fun b_lambda!2147 () Bool)

(assert (=> (not b_lambda!2147) (not b!41710)))

(declare-fun t!4030 () Bool)

(declare-fun tb!905 () Bool)

(assert (=> (and start!5944 (= defaultEntry!470 defaultEntry!470) t!4030) tb!905))

(declare-fun result!1561 () Bool)

(declare-fun tp_is_empty!1813 () Bool)

(assert (=> tb!905 (= result!1561 tp_is_empty!1813)))

(assert (=> b!41710 t!4030))

(declare-fun b_and!2497 () Bool)

(assert (= b_and!2495 (and (=> t!4030 result!1561) b_and!2497)))

(declare-fun m!35209 () Bool)

(assert (=> b!41713 m!35209))

(declare-fun m!35211 () Bool)

(assert (=> b!41713 m!35211))

(assert (=> b!41713 m!35209))

(declare-fun m!35213 () Bool)

(assert (=> b!41713 m!35213))

(declare-fun m!35215 () Bool)

(assert (=> start!5944 m!35215))

(declare-fun m!35217 () Bool)

(assert (=> b!41711 m!35217))

(declare-fun m!35219 () Bool)

(assert (=> b!41710 m!35219))

(declare-fun m!35221 () Bool)

(assert (=> b!41710 m!35221))

(declare-fun m!35223 () Bool)

(assert (=> b!41710 m!35223))

(declare-fun m!35225 () Bool)

(assert (=> b!41710 m!35225))

(declare-fun m!35227 () Bool)

(assert (=> b!41710 m!35227))

(declare-fun m!35229 () Bool)

(assert (=> b!41710 m!35229))

(declare-fun m!35231 () Bool)

(assert (=> b!41710 m!35231))

(declare-fun m!35233 () Bool)

(assert (=> b!41710 m!35233))

(push 1)

(assert (not start!5944))

(assert b_and!2497)

(assert (not b!41713))

(assert (not b_next!1423))

(assert tp_is_empty!1813)

(assert (not b_lambda!2147))

(assert (not b!41710))

(assert (not b!41711))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2497)

(assert (not b_next!1423))

(check-sat)

(pop 1)

