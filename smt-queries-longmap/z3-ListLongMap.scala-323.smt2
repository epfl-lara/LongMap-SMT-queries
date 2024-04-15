; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5914 () Bool)

(assert start!5914)

(declare-fun b_free!1399 () Bool)

(declare-fun b_next!1399 () Bool)

(assert (=> start!5914 (= b_free!1399 (not b_next!1399))))

(declare-fun tp!5786 () Bool)

(declare-fun b_and!2449 () Bool)

(assert (=> start!5914 (= tp!5786 b_and!2449)))

(declare-fun b!41463 () Bool)

(declare-fun res!24679 () Bool)

(declare-fun e!26236 () Bool)

(assert (=> b!41463 (=> res!24679 e!26236)))

(declare-datatypes ((V!2145 0))(
  ( (V!2146 (val!933 Int)) )
))
(declare-datatypes ((tuple2!1524 0))(
  ( (tuple2!1525 (_1!773 (_ BitVec 64)) (_2!773 V!2145)) )
))
(declare-datatypes ((List!1081 0))(
  ( (Nil!1078) (Cons!1077 (h!1654 tuple2!1524) (t!3975 List!1081)) )
))
(declare-datatypes ((ListLongMap!1089 0))(
  ( (ListLongMap!1090 (toList!560 List!1081)) )
))
(declare-fun lt!16529 () ListLongMap!1089)

(declare-fun isEmpty!252 (List!1081) Bool)

(assert (=> b!41463 (= res!24679 (isEmpty!252 (toList!560 lt!16529)))))

(declare-fun res!24677 () Bool)

(declare-fun e!26237 () Bool)

(assert (=> start!5914 (=> (not res!24677) (not e!26237))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5914 (= res!24677 (validMask!0 mask!853))))

(assert (=> start!5914 e!26237))

(assert (=> start!5914 true))

(assert (=> start!5914 tp!5786))

(declare-fun b!41464 () Bool)

(declare-fun res!24678 () Bool)

(assert (=> b!41464 (=> res!24678 e!26236)))

(assert (=> b!41464 (= res!24678 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41462 () Bool)

(assert (=> b!41462 (= e!26237 (not e!26236))))

(declare-fun res!24676 () Bool)

(assert (=> b!41462 (=> res!24676 e!26236)))

(assert (=> b!41462 (= res!24676 (= lt!16529 (ListLongMap!1090 Nil!1078)))))

(declare-datatypes ((ValueCell!647 0))(
  ( (ValueCellFull!647 (v!2015 V!2145)) (EmptyCell!647) )
))
(declare-datatypes ((array!2637 0))(
  ( (array!2638 (arr!1262 (Array (_ BitVec 32) ValueCell!647)) (size!1414 (_ BitVec 32))) )
))
(declare-fun lt!16527 () array!2637)

(declare-datatypes ((array!2639 0))(
  ( (array!2640 (arr!1263 (Array (_ BitVec 32) (_ BitVec 64))) (size!1415 (_ BitVec 32))) )
))
(declare-fun lt!16528 () array!2639)

(declare-fun lt!16524 () V!2145)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((LongMapFixedSize!274 0))(
  ( (LongMapFixedSize!275 (defaultEntry!1827 Int) (mask!5235 (_ BitVec 32)) (extraKeys!1718 (_ BitVec 32)) (zeroValue!1745 V!2145) (minValue!1745 V!2145) (_size!186 (_ BitVec 32)) (_keys!3333 array!2639) (_values!1810 array!2637) (_vacant!186 (_ BitVec 32))) )
))
(declare-fun map!720 (LongMapFixedSize!274) ListLongMap!1089)

(assert (=> b!41462 (= lt!16529 (map!720 (LongMapFixedSize!275 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16524 lt!16524 #b00000000000000000000000000000000 lt!16528 lt!16527 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1082 0))(
  ( (Nil!1079) (Cons!1078 (h!1655 (_ BitVec 64)) (t!3976 List!1082)) )
))
(declare-fun arrayNoDuplicates!0 (array!2639 (_ BitVec 32) List!1082) Bool)

(assert (=> b!41462 (arrayNoDuplicates!0 lt!16528 #b00000000000000000000000000000000 Nil!1079)))

(declare-datatypes ((Unit!1036 0))(
  ( (Unit!1037) )
))
(declare-fun lt!16522 () Unit!1036)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2639 (_ BitVec 32) (_ BitVec 32) List!1082) Unit!1036)

(assert (=> b!41462 (= lt!16522 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16528 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2639 (_ BitVec 32)) Bool)

(assert (=> b!41462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16528 mask!853)))

(declare-fun lt!16523 () Unit!1036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2639 (_ BitVec 32) (_ BitVec 32)) Unit!1036)

(assert (=> b!41462 (= lt!16523 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16528 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2639 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41462 (= (arrayCountValidKeys!0 lt!16528 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16526 () Unit!1036)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2639 (_ BitVec 32) (_ BitVec 32)) Unit!1036)

(assert (=> b!41462 (= lt!16526 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16528 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41462 (= lt!16527 (array!2638 ((as const (Array (_ BitVec 32) ValueCell!647)) EmptyCell!647) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41462 (= lt!16528 (array!2640 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!207 (Int (_ BitVec 64)) V!2145)

(assert (=> b!41462 (= lt!16524 (dynLambda!207 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41465 () Bool)

(assert (=> b!41465 (= e!26236 true)))

(declare-fun lt!16525 () Bool)

(declare-fun contains!530 (ListLongMap!1089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!315 (array!2639 array!2637 (_ BitVec 32) (_ BitVec 32) V!2145 V!2145 (_ BitVec 32) Int) ListLongMap!1089)

(declare-fun head!863 (List!1081) tuple2!1524)

(assert (=> b!41465 (= lt!16525 (contains!530 (getCurrentListMap!315 lt!16528 lt!16527 mask!853 #b00000000000000000000000000000000 lt!16524 lt!16524 #b00000000000000000000000000000000 defaultEntry!470) (_1!773 (head!863 (toList!560 lt!16529)))))))

(assert (= (and start!5914 res!24677) b!41462))

(assert (= (and b!41462 (not res!24676)) b!41463))

(assert (= (and b!41463 (not res!24679)) b!41464))

(assert (= (and b!41464 (not res!24678)) b!41465))

(declare-fun b_lambda!2127 () Bool)

(assert (=> (not b_lambda!2127) (not b!41462)))

(declare-fun t!3974 () Bool)

(declare-fun tb!881 () Bool)

(assert (=> (and start!5914 (= defaultEntry!470 defaultEntry!470) t!3974) tb!881))

(declare-fun result!1513 () Bool)

(declare-fun tp_is_empty!1789 () Bool)

(assert (=> tb!881 (= result!1513 tp_is_empty!1789)))

(assert (=> b!41462 t!3974))

(declare-fun b_and!2451 () Bool)

(assert (= b_and!2449 (and (=> t!3974 result!1513) b_and!2451)))

(declare-fun m!34799 () Bool)

(assert (=> b!41463 m!34799))

(declare-fun m!34801 () Bool)

(assert (=> start!5914 m!34801))

(declare-fun m!34803 () Bool)

(assert (=> b!41462 m!34803))

(declare-fun m!34805 () Bool)

(assert (=> b!41462 m!34805))

(declare-fun m!34807 () Bool)

(assert (=> b!41462 m!34807))

(declare-fun m!34809 () Bool)

(assert (=> b!41462 m!34809))

(declare-fun m!34811 () Bool)

(assert (=> b!41462 m!34811))

(declare-fun m!34813 () Bool)

(assert (=> b!41462 m!34813))

(declare-fun m!34815 () Bool)

(assert (=> b!41462 m!34815))

(declare-fun m!34817 () Bool)

(assert (=> b!41462 m!34817))

(declare-fun m!34819 () Bool)

(assert (=> b!41465 m!34819))

(declare-fun m!34821 () Bool)

(assert (=> b!41465 m!34821))

(assert (=> b!41465 m!34819))

(declare-fun m!34823 () Bool)

(assert (=> b!41465 m!34823))

(check-sat tp_is_empty!1789 (not start!5914) (not b!41462) (not b_lambda!2127) (not b_next!1399) b_and!2451 (not b!41463) (not b!41465))
(check-sat b_and!2451 (not b_next!1399))
