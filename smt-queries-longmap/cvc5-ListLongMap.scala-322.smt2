; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5914 () Bool)

(assert start!5914)

(declare-fun b_free!1393 () Bool)

(declare-fun b_next!1393 () Bool)

(assert (=> start!5914 (= b_free!1393 (not b_next!1393))))

(declare-fun tp!5777 () Bool)

(declare-fun b_and!2435 () Bool)

(assert (=> start!5914 (= tp!5777 b_and!2435)))

(declare-fun res!24669 () Bool)

(declare-fun e!26272 () Bool)

(assert (=> start!5914 (=> (not res!24669) (not e!26272))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5914 (= res!24669 (validMask!0 mask!853))))

(assert (=> start!5914 e!26272))

(assert (=> start!5914 true))

(assert (=> start!5914 tp!5777))

(declare-fun b!41502 () Bool)

(declare-fun res!24666 () Bool)

(declare-fun e!26271 () Bool)

(assert (=> b!41502 (=> res!24666 e!26271)))

(assert (=> b!41502 (= res!24666 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41500 () Bool)

(assert (=> b!41500 (= e!26272 (not e!26271))))

(declare-fun res!24667 () Bool)

(assert (=> b!41500 (=> res!24667 e!26271)))

(declare-datatypes ((V!2137 0))(
  ( (V!2138 (val!930 Int)) )
))
(declare-datatypes ((tuple2!1514 0))(
  ( (tuple2!1515 (_1!768 (_ BitVec 64)) (_2!768 V!2137)) )
))
(declare-datatypes ((List!1082 0))(
  ( (Nil!1079) (Cons!1078 (h!1655 tuple2!1514) (t!3971 List!1082)) )
))
(declare-datatypes ((ListLongMap!1091 0))(
  ( (ListLongMap!1092 (toList!561 List!1082)) )
))
(declare-fun lt!16473 () ListLongMap!1091)

(assert (=> b!41500 (= res!24667 (= lt!16473 (ListLongMap!1092 Nil!1079)))))

(declare-datatypes ((ValueCell!644 0))(
  ( (ValueCellFull!644 (v!2014 V!2137)) (EmptyCell!644) )
))
(declare-datatypes ((array!2651 0))(
  ( (array!2652 (arr!1269 (Array (_ BitVec 32) ValueCell!644)) (size!1421 (_ BitVec 32))) )
))
(declare-fun lt!16474 () array!2651)

(declare-fun lt!16475 () V!2137)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2653 0))(
  ( (array!2654 (arr!1270 (Array (_ BitVec 32) (_ BitVec 64))) (size!1422 (_ BitVec 32))) )
))
(declare-fun lt!16470 () array!2653)

(declare-datatypes ((LongMapFixedSize!268 0))(
  ( (LongMapFixedSize!269 (defaultEntry!1824 Int) (mask!5231 (_ BitVec 32)) (extraKeys!1715 (_ BitVec 32)) (zeroValue!1742 V!2137) (minValue!1742 V!2137) (_size!183 (_ BitVec 32)) (_keys!3331 array!2653) (_values!1807 array!2651) (_vacant!183 (_ BitVec 32))) )
))
(declare-fun map!714 (LongMapFixedSize!268) ListLongMap!1091)

(assert (=> b!41500 (= lt!16473 (map!714 (LongMapFixedSize!269 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16475 lt!16475 #b00000000000000000000000000000000 lt!16470 lt!16474 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1083 0))(
  ( (Nil!1080) (Cons!1079 (h!1656 (_ BitVec 64)) (t!3972 List!1083)) )
))
(declare-fun arrayNoDuplicates!0 (array!2653 (_ BitVec 32) List!1083) Bool)

(assert (=> b!41500 (arrayNoDuplicates!0 lt!16470 #b00000000000000000000000000000000 Nil!1080)))

(declare-datatypes ((Unit!1023 0))(
  ( (Unit!1024) )
))
(declare-fun lt!16472 () Unit!1023)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2653 (_ BitVec 32) (_ BitVec 32) List!1083) Unit!1023)

(assert (=> b!41500 (= lt!16472 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16470 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2653 (_ BitVec 32)) Bool)

(assert (=> b!41500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16470 mask!853)))

(declare-fun lt!16468 () Unit!1023)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2653 (_ BitVec 32) (_ BitVec 32)) Unit!1023)

(assert (=> b!41500 (= lt!16468 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16470 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2653 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41500 (= (arrayCountValidKeys!0 lt!16470 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16469 () Unit!1023)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2653 (_ BitVec 32) (_ BitVec 32)) Unit!1023)

(assert (=> b!41500 (= lt!16469 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16470 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41500 (= lt!16474 (array!2652 ((as const (Array (_ BitVec 32) ValueCell!644)) EmptyCell!644) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41500 (= lt!16470 (array!2654 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!205 (Int (_ BitVec 64)) V!2137)

(assert (=> b!41500 (= lt!16475 (dynLambda!205 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41501 () Bool)

(declare-fun res!24668 () Bool)

(assert (=> b!41501 (=> res!24668 e!26271)))

(declare-fun isEmpty!247 (List!1082) Bool)

(assert (=> b!41501 (= res!24668 (isEmpty!247 (toList!561 lt!16473)))))

(declare-fun b!41503 () Bool)

(assert (=> b!41503 (= e!26271 true)))

(declare-fun lt!16471 () Bool)

(declare-fun contains!529 (ListLongMap!1091 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!322 (array!2653 array!2651 (_ BitVec 32) (_ BitVec 32) V!2137 V!2137 (_ BitVec 32) Int) ListLongMap!1091)

(declare-fun head!860 (List!1082) tuple2!1514)

(assert (=> b!41503 (= lt!16471 (contains!529 (getCurrentListMap!322 lt!16470 lt!16474 mask!853 #b00000000000000000000000000000000 lt!16475 lt!16475 #b00000000000000000000000000000000 defaultEntry!470) (_1!768 (head!860 (toList!561 lt!16473)))))))

(assert (= (and start!5914 res!24669) b!41500))

(assert (= (and b!41500 (not res!24667)) b!41501))

(assert (= (and b!41501 (not res!24668)) b!41502))

(assert (= (and b!41502 (not res!24666)) b!41503))

(declare-fun b_lambda!2117 () Bool)

(assert (=> (not b_lambda!2117) (not b!41500)))

(declare-fun t!3970 () Bool)

(declare-fun tb!875 () Bool)

(assert (=> (and start!5914 (= defaultEntry!470 defaultEntry!470) t!3970) tb!875))

(declare-fun result!1501 () Bool)

(declare-fun tp_is_empty!1783 () Bool)

(assert (=> tb!875 (= result!1501 tp_is_empty!1783)))

(assert (=> b!41500 t!3970))

(declare-fun b_and!2437 () Bool)

(assert (= b_and!2435 (and (=> t!3970 result!1501) b_and!2437)))

(declare-fun m!34819 () Bool)

(assert (=> start!5914 m!34819))

(declare-fun m!34821 () Bool)

(assert (=> b!41500 m!34821))

(declare-fun m!34823 () Bool)

(assert (=> b!41500 m!34823))

(declare-fun m!34825 () Bool)

(assert (=> b!41500 m!34825))

(declare-fun m!34827 () Bool)

(assert (=> b!41500 m!34827))

(declare-fun m!34829 () Bool)

(assert (=> b!41500 m!34829))

(declare-fun m!34831 () Bool)

(assert (=> b!41500 m!34831))

(declare-fun m!34833 () Bool)

(assert (=> b!41500 m!34833))

(declare-fun m!34835 () Bool)

(assert (=> b!41500 m!34835))

(declare-fun m!34837 () Bool)

(assert (=> b!41501 m!34837))

(declare-fun m!34839 () Bool)

(assert (=> b!41503 m!34839))

(declare-fun m!34841 () Bool)

(assert (=> b!41503 m!34841))

(assert (=> b!41503 m!34839))

(declare-fun m!34843 () Bool)

(assert (=> b!41503 m!34843))

(push 1)

(assert (not b_next!1393))

(assert (not b!41501))

(assert tp_is_empty!1783)

(assert (not b_lambda!2117))

(assert (not b!41503))

(assert (not start!5914))

(assert (not b!41500))

(assert b_and!2437)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2437)

(assert (not b_next!1393))

(check-sat)

(pop 1)

