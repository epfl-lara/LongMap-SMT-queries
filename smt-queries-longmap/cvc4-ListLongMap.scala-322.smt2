; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5918 () Bool)

(assert start!5918)

(declare-fun b_free!1397 () Bool)

(declare-fun b_next!1397 () Bool)

(assert (=> start!5918 (= b_free!1397 (not b_next!1397))))

(declare-fun tp!5783 () Bool)

(declare-fun b_and!2443 () Bool)

(assert (=> start!5918 (= tp!5783 b_and!2443)))

(declare-fun b!41530 () Bool)

(declare-fun res!24690 () Bool)

(declare-fun e!26283 () Bool)

(assert (=> b!41530 (=> res!24690 e!26283)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!41530 (= res!24690 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41531 () Bool)

(assert (=> b!41531 (= e!26283 true)))

(declare-datatypes ((V!2141 0))(
  ( (V!2142 (val!932 Int)) )
))
(declare-datatypes ((ValueCell!646 0))(
  ( (ValueCellFull!646 (v!2016 V!2141)) (EmptyCell!646) )
))
(declare-datatypes ((array!2659 0))(
  ( (array!2660 (arr!1273 (Array (_ BitVec 32) ValueCell!646)) (size!1425 (_ BitVec 32))) )
))
(declare-fun lt!16521 () array!2659)

(declare-fun lt!16516 () Bool)

(declare-fun lt!16523 () V!2141)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2661 0))(
  ( (array!2662 (arr!1274 (Array (_ BitVec 32) (_ BitVec 64))) (size!1426 (_ BitVec 32))) )
))
(declare-fun lt!16517 () array!2661)

(declare-datatypes ((tuple2!1518 0))(
  ( (tuple2!1519 (_1!770 (_ BitVec 64)) (_2!770 V!2141)) )
))
(declare-datatypes ((List!1086 0))(
  ( (Nil!1083) (Cons!1082 (h!1659 tuple2!1518) (t!3979 List!1086)) )
))
(declare-datatypes ((ListLongMap!1095 0))(
  ( (ListLongMap!1096 (toList!563 List!1086)) )
))
(declare-fun lt!16518 () ListLongMap!1095)

(declare-fun contains!531 (ListLongMap!1095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!324 (array!2661 array!2659 (_ BitVec 32) (_ BitVec 32) V!2141 V!2141 (_ BitVec 32) Int) ListLongMap!1095)

(declare-fun head!862 (List!1086) tuple2!1518)

(assert (=> b!41531 (= lt!16516 (contains!531 (getCurrentListMap!324 lt!16517 lt!16521 mask!853 #b00000000000000000000000000000000 lt!16523 lt!16523 #b00000000000000000000000000000000 defaultEntry!470) (_1!770 (head!862 (toList!563 lt!16518)))))))

(declare-fun b!41528 () Bool)

(declare-fun e!26284 () Bool)

(assert (=> b!41528 (= e!26284 (not e!26283))))

(declare-fun res!24692 () Bool)

(assert (=> b!41528 (=> res!24692 e!26283)))

(assert (=> b!41528 (= res!24692 (= lt!16518 (ListLongMap!1096 Nil!1083)))))

(declare-datatypes ((LongMapFixedSize!272 0))(
  ( (LongMapFixedSize!273 (defaultEntry!1826 Int) (mask!5233 (_ BitVec 32)) (extraKeys!1717 (_ BitVec 32)) (zeroValue!1744 V!2141) (minValue!1744 V!2141) (_size!185 (_ BitVec 32)) (_keys!3333 array!2661) (_values!1809 array!2659) (_vacant!185 (_ BitVec 32))) )
))
(declare-fun map!716 (LongMapFixedSize!272) ListLongMap!1095)

(assert (=> b!41528 (= lt!16518 (map!716 (LongMapFixedSize!273 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16523 lt!16523 #b00000000000000000000000000000000 lt!16517 lt!16521 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1087 0))(
  ( (Nil!1084) (Cons!1083 (h!1660 (_ BitVec 64)) (t!3980 List!1087)) )
))
(declare-fun arrayNoDuplicates!0 (array!2661 (_ BitVec 32) List!1087) Bool)

(assert (=> b!41528 (arrayNoDuplicates!0 lt!16517 #b00000000000000000000000000000000 Nil!1084)))

(declare-datatypes ((Unit!1027 0))(
  ( (Unit!1028) )
))
(declare-fun lt!16519 () Unit!1027)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2661 (_ BitVec 32) (_ BitVec 32) List!1087) Unit!1027)

(assert (=> b!41528 (= lt!16519 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16517 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2661 (_ BitVec 32)) Bool)

(assert (=> b!41528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16517 mask!853)))

(declare-fun lt!16520 () Unit!1027)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2661 (_ BitVec 32) (_ BitVec 32)) Unit!1027)

(assert (=> b!41528 (= lt!16520 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16517 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2661 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41528 (= (arrayCountValidKeys!0 lt!16517 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16522 () Unit!1027)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2661 (_ BitVec 32) (_ BitVec 32)) Unit!1027)

(assert (=> b!41528 (= lt!16522 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16517 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41528 (= lt!16521 (array!2660 ((as const (Array (_ BitVec 32) ValueCell!646)) EmptyCell!646) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41528 (= lt!16517 (array!2662 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!207 (Int (_ BitVec 64)) V!2141)

(assert (=> b!41528 (= lt!16523 (dynLambda!207 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24693 () Bool)

(assert (=> start!5918 (=> (not res!24693) (not e!26284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5918 (= res!24693 (validMask!0 mask!853))))

(assert (=> start!5918 e!26284))

(assert (=> start!5918 true))

(assert (=> start!5918 tp!5783))

(declare-fun b!41529 () Bool)

(declare-fun res!24691 () Bool)

(assert (=> b!41529 (=> res!24691 e!26283)))

(declare-fun isEmpty!249 (List!1086) Bool)

(assert (=> b!41529 (= res!24691 (isEmpty!249 (toList!563 lt!16518)))))

(assert (= (and start!5918 res!24693) b!41528))

(assert (= (and b!41528 (not res!24692)) b!41529))

(assert (= (and b!41529 (not res!24691)) b!41530))

(assert (= (and b!41530 (not res!24690)) b!41531))

(declare-fun b_lambda!2121 () Bool)

(assert (=> (not b_lambda!2121) (not b!41528)))

(declare-fun t!3978 () Bool)

(declare-fun tb!879 () Bool)

(assert (=> (and start!5918 (= defaultEntry!470 defaultEntry!470) t!3978) tb!879))

(declare-fun result!1509 () Bool)

(declare-fun tp_is_empty!1787 () Bool)

(assert (=> tb!879 (= result!1509 tp_is_empty!1787)))

(assert (=> b!41528 t!3978))

(declare-fun b_and!2445 () Bool)

(assert (= b_and!2443 (and (=> t!3978 result!1509) b_and!2445)))

(declare-fun m!34871 () Bool)

(assert (=> b!41531 m!34871))

(declare-fun m!34873 () Bool)

(assert (=> b!41531 m!34873))

(assert (=> b!41531 m!34871))

(declare-fun m!34875 () Bool)

(assert (=> b!41531 m!34875))

(declare-fun m!34877 () Bool)

(assert (=> b!41528 m!34877))

(declare-fun m!34879 () Bool)

(assert (=> b!41528 m!34879))

(declare-fun m!34881 () Bool)

(assert (=> b!41528 m!34881))

(declare-fun m!34883 () Bool)

(assert (=> b!41528 m!34883))

(declare-fun m!34885 () Bool)

(assert (=> b!41528 m!34885))

(declare-fun m!34887 () Bool)

(assert (=> b!41528 m!34887))

(declare-fun m!34889 () Bool)

(assert (=> b!41528 m!34889))

(declare-fun m!34891 () Bool)

(assert (=> b!41528 m!34891))

(declare-fun m!34893 () Bool)

(assert (=> start!5918 m!34893))

(declare-fun m!34895 () Bool)

(assert (=> b!41529 m!34895))

(push 1)

(assert (not b!41528))

(assert (not b_lambda!2121))

(assert b_and!2445)

(assert (not b!41529))

(assert tp_is_empty!1787)

(assert (not b!41531))

(assert (not b_next!1397))

(assert (not start!5918))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2445)

(assert (not b_next!1397))

(check-sat)

