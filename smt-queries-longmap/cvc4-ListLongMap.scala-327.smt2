; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5948 () Bool)

(assert start!5948)

(declare-fun b_free!1427 () Bool)

(declare-fun b_next!1427 () Bool)

(assert (=> start!5948 (= b_free!1427 (not b_next!1427))))

(declare-fun tp!5828 () Bool)

(declare-fun b_and!2503 () Bool)

(assert (=> start!5948 (= tp!5828 b_and!2503)))

(declare-fun res!24871 () Bool)

(declare-fun e!26373 () Bool)

(assert (=> start!5948 (=> (not res!24871) (not e!26373))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5948 (= res!24871 (validMask!0 mask!853))))

(assert (=> start!5948 e!26373))

(assert (=> start!5948 true))

(assert (=> start!5948 tp!5828))

(declare-fun b!41740 () Bool)

(declare-fun res!24870 () Bool)

(declare-fun e!26374 () Bool)

(assert (=> b!41740 (=> res!24870 e!26374)))

(assert (=> b!41740 (= res!24870 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41741 () Bool)

(assert (=> b!41741 (= e!26374 true)))

(declare-fun lt!16877 () Bool)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2719 0))(
  ( (array!2720 (arr!1303 (Array (_ BitVec 32) (_ BitVec 64))) (size!1455 (_ BitVec 32))) )
))
(declare-fun lt!16879 () array!2719)

(declare-datatypes ((V!2181 0))(
  ( (V!2182 (val!947 Int)) )
))
(declare-fun lt!16876 () V!2181)

(declare-datatypes ((ValueCell!661 0))(
  ( (ValueCellFull!661 (v!2031 V!2181)) (EmptyCell!661) )
))
(declare-datatypes ((array!2721 0))(
  ( (array!2722 (arr!1304 (Array (_ BitVec 32) ValueCell!661)) (size!1456 (_ BitVec 32))) )
))
(declare-fun lt!16878 () array!2721)

(declare-datatypes ((tuple2!1548 0))(
  ( (tuple2!1549 (_1!785 (_ BitVec 64)) (_2!785 V!2181)) )
))
(declare-datatypes ((List!1116 0))(
  ( (Nil!1113) (Cons!1112 (h!1689 tuple2!1548) (t!4039 List!1116)) )
))
(declare-datatypes ((ListLongMap!1125 0))(
  ( (ListLongMap!1126 (toList!578 List!1116)) )
))
(declare-fun lt!16883 () ListLongMap!1125)

(declare-fun contains!546 (ListLongMap!1125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!339 (array!2719 array!2721 (_ BitVec 32) (_ BitVec 32) V!2181 V!2181 (_ BitVec 32) Int) ListLongMap!1125)

(declare-fun head!877 (List!1116) tuple2!1548)

(assert (=> b!41741 (= lt!16877 (contains!546 (getCurrentListMap!339 lt!16879 lt!16878 mask!853 #b00000000000000000000000000000000 lt!16876 lt!16876 #b00000000000000000000000000000000 defaultEntry!470) (_1!785 (head!877 (toList!578 lt!16883)))))))

(declare-fun b!41738 () Bool)

(assert (=> b!41738 (= e!26373 (not e!26374))))

(declare-fun res!24872 () Bool)

(assert (=> b!41738 (=> res!24872 e!26374)))

(assert (=> b!41738 (= res!24872 (= lt!16883 (ListLongMap!1126 Nil!1113)))))

(declare-datatypes ((LongMapFixedSize!302 0))(
  ( (LongMapFixedSize!303 (defaultEntry!1841 Int) (mask!5258 (_ BitVec 32)) (extraKeys!1732 (_ BitVec 32)) (zeroValue!1759 V!2181) (minValue!1759 V!2181) (_size!200 (_ BitVec 32)) (_keys!3348 array!2719) (_values!1824 array!2721) (_vacant!200 (_ BitVec 32))) )
))
(declare-fun map!741 (LongMapFixedSize!302) ListLongMap!1125)

(assert (=> b!41738 (= lt!16883 (map!741 (LongMapFixedSize!303 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16876 lt!16876 #b00000000000000000000000000000000 lt!16879 lt!16878 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1117 0))(
  ( (Nil!1114) (Cons!1113 (h!1690 (_ BitVec 64)) (t!4040 List!1117)) )
))
(declare-fun arrayNoDuplicates!0 (array!2719 (_ BitVec 32) List!1117) Bool)

(assert (=> b!41738 (arrayNoDuplicates!0 lt!16879 #b00000000000000000000000000000000 Nil!1114)))

(declare-datatypes ((Unit!1057 0))(
  ( (Unit!1058) )
))
(declare-fun lt!16880 () Unit!1057)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2719 (_ BitVec 32) (_ BitVec 32) List!1117) Unit!1057)

(assert (=> b!41738 (= lt!16880 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16879 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2719 (_ BitVec 32)) Bool)

(assert (=> b!41738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16879 mask!853)))

(declare-fun lt!16881 () Unit!1057)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2719 (_ BitVec 32) (_ BitVec 32)) Unit!1057)

(assert (=> b!41738 (= lt!16881 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16879 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2719 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41738 (= (arrayCountValidKeys!0 lt!16879 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16882 () Unit!1057)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2719 (_ BitVec 32) (_ BitVec 32)) Unit!1057)

(assert (=> b!41738 (= lt!16882 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16879 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41738 (= lt!16878 (array!2722 ((as const (Array (_ BitVec 32) ValueCell!661)) EmptyCell!661) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41738 (= lt!16879 (array!2720 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!222 (Int (_ BitVec 64)) V!2181)

(assert (=> b!41738 (= lt!16876 (dynLambda!222 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41739 () Bool)

(declare-fun res!24873 () Bool)

(assert (=> b!41739 (=> res!24873 e!26374)))

(declare-fun isEmpty!264 (List!1116) Bool)

(assert (=> b!41739 (= res!24873 (isEmpty!264 (toList!578 lt!16883)))))

(assert (= (and start!5948 res!24871) b!41738))

(assert (= (and b!41738 (not res!24872)) b!41739))

(assert (= (and b!41739 (not res!24873)) b!41740))

(assert (= (and b!41740 (not res!24870)) b!41741))

(declare-fun b_lambda!2151 () Bool)

(assert (=> (not b_lambda!2151) (not b!41738)))

(declare-fun t!4038 () Bool)

(declare-fun tb!909 () Bool)

(assert (=> (and start!5948 (= defaultEntry!470 defaultEntry!470) t!4038) tb!909))

(declare-fun result!1569 () Bool)

(declare-fun tp_is_empty!1817 () Bool)

(assert (=> tb!909 (= result!1569 tp_is_empty!1817)))

(assert (=> b!41738 t!4038))

(declare-fun b_and!2505 () Bool)

(assert (= b_and!2503 (and (=> t!4038 result!1569) b_and!2505)))

(declare-fun m!35261 () Bool)

(assert (=> start!5948 m!35261))

(declare-fun m!35263 () Bool)

(assert (=> b!41741 m!35263))

(declare-fun m!35265 () Bool)

(assert (=> b!41741 m!35265))

(assert (=> b!41741 m!35263))

(declare-fun m!35267 () Bool)

(assert (=> b!41741 m!35267))

(declare-fun m!35269 () Bool)

(assert (=> b!41738 m!35269))

(declare-fun m!35271 () Bool)

(assert (=> b!41738 m!35271))

(declare-fun m!35273 () Bool)

(assert (=> b!41738 m!35273))

(declare-fun m!35275 () Bool)

(assert (=> b!41738 m!35275))

(declare-fun m!35277 () Bool)

(assert (=> b!41738 m!35277))

(declare-fun m!35279 () Bool)

(assert (=> b!41738 m!35279))

(declare-fun m!35281 () Bool)

(assert (=> b!41738 m!35281))

(declare-fun m!35283 () Bool)

(assert (=> b!41738 m!35283))

(declare-fun m!35285 () Bool)

(assert (=> b!41739 m!35285))

(push 1)

(assert (not b!41738))

(assert (not start!5948))

(assert (not b!41741))

(assert (not b_next!1427))

(assert b_and!2505)

(assert (not b!41739))

(assert (not b_lambda!2151))

(assert tp_is_empty!1817)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2505)

(assert (not b_next!1427))

(check-sat)

(pop 1)

