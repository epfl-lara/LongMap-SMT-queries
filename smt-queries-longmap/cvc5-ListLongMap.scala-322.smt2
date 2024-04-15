; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5912 () Bool)

(assert start!5912)

(declare-fun b_free!1397 () Bool)

(declare-fun b_next!1397 () Bool)

(assert (=> start!5912 (= b_free!1397 (not b_next!1397))))

(declare-fun tp!5783 () Bool)

(declare-fun b_and!2445 () Bool)

(assert (=> start!5912 (= tp!5783 b_and!2445)))

(declare-fun b!41449 () Bool)

(declare-fun res!24667 () Bool)

(declare-fun e!26230 () Bool)

(assert (=> b!41449 (=> res!24667 e!26230)))

(declare-datatypes ((V!2141 0))(
  ( (V!2142 (val!932 Int)) )
))
(declare-datatypes ((tuple2!1522 0))(
  ( (tuple2!1523 (_1!772 (_ BitVec 64)) (_2!772 V!2141)) )
))
(declare-datatypes ((List!1079 0))(
  ( (Nil!1076) (Cons!1075 (h!1652 tuple2!1522) (t!3971 List!1079)) )
))
(declare-datatypes ((ListLongMap!1087 0))(
  ( (ListLongMap!1088 (toList!559 List!1079)) )
))
(declare-fun lt!16501 () ListLongMap!1087)

(declare-fun isEmpty!251 (List!1079) Bool)

(assert (=> b!41449 (= res!24667 (isEmpty!251 (toList!559 lt!16501)))))

(declare-fun res!24664 () Bool)

(declare-fun e!26231 () Bool)

(assert (=> start!5912 (=> (not res!24664) (not e!26231))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5912 (= res!24664 (validMask!0 mask!853))))

(assert (=> start!5912 e!26231))

(assert (=> start!5912 true))

(assert (=> start!5912 tp!5783))

(declare-fun b!41451 () Bool)

(assert (=> b!41451 (= e!26230 true)))

(declare-fun lt!16502 () V!2141)

(declare-datatypes ((ValueCell!646 0))(
  ( (ValueCellFull!646 (v!2014 V!2141)) (EmptyCell!646) )
))
(declare-datatypes ((array!2633 0))(
  ( (array!2634 (arr!1260 (Array (_ BitVec 32) ValueCell!646)) (size!1412 (_ BitVec 32))) )
))
(declare-fun lt!16500 () array!2633)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2635 0))(
  ( (array!2636 (arr!1261 (Array (_ BitVec 32) (_ BitVec 64))) (size!1413 (_ BitVec 32))) )
))
(declare-fun lt!16504 () array!2635)

(declare-fun lt!16503 () Bool)

(declare-fun contains!529 (ListLongMap!1087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!314 (array!2635 array!2633 (_ BitVec 32) (_ BitVec 32) V!2141 V!2141 (_ BitVec 32) Int) ListLongMap!1087)

(declare-fun head!862 (List!1079) tuple2!1522)

(assert (=> b!41451 (= lt!16503 (contains!529 (getCurrentListMap!314 lt!16504 lt!16500 mask!853 #b00000000000000000000000000000000 lt!16502 lt!16502 #b00000000000000000000000000000000 defaultEntry!470) (_1!772 (head!862 (toList!559 lt!16501)))))))

(declare-fun b!41448 () Bool)

(assert (=> b!41448 (= e!26231 (not e!26230))))

(declare-fun res!24666 () Bool)

(assert (=> b!41448 (=> res!24666 e!26230)))

(assert (=> b!41448 (= res!24666 (= lt!16501 (ListLongMap!1088 Nil!1076)))))

(declare-datatypes ((LongMapFixedSize!272 0))(
  ( (LongMapFixedSize!273 (defaultEntry!1826 Int) (mask!5232 (_ BitVec 32)) (extraKeys!1717 (_ BitVec 32)) (zeroValue!1744 V!2141) (minValue!1744 V!2141) (_size!185 (_ BitVec 32)) (_keys!3332 array!2635) (_values!1809 array!2633) (_vacant!185 (_ BitVec 32))) )
))
(declare-fun map!717 (LongMapFixedSize!272) ListLongMap!1087)

(assert (=> b!41448 (= lt!16501 (map!717 (LongMapFixedSize!273 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16502 lt!16502 #b00000000000000000000000000000000 lt!16504 lt!16500 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1080 0))(
  ( (Nil!1077) (Cons!1076 (h!1653 (_ BitVec 64)) (t!3972 List!1080)) )
))
(declare-fun arrayNoDuplicates!0 (array!2635 (_ BitVec 32) List!1080) Bool)

(assert (=> b!41448 (arrayNoDuplicates!0 lt!16504 #b00000000000000000000000000000000 Nil!1077)))

(declare-datatypes ((Unit!1034 0))(
  ( (Unit!1035) )
))
(declare-fun lt!16498 () Unit!1034)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2635 (_ BitVec 32) (_ BitVec 32) List!1080) Unit!1034)

(assert (=> b!41448 (= lt!16498 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16504 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2635 (_ BitVec 32)) Bool)

(assert (=> b!41448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16504 mask!853)))

(declare-fun lt!16499 () Unit!1034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2635 (_ BitVec 32) (_ BitVec 32)) Unit!1034)

(assert (=> b!41448 (= lt!16499 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16504 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2635 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41448 (= (arrayCountValidKeys!0 lt!16504 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16505 () Unit!1034)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2635 (_ BitVec 32) (_ BitVec 32)) Unit!1034)

(assert (=> b!41448 (= lt!16505 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16504 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41448 (= lt!16500 (array!2634 ((as const (Array (_ BitVec 32) ValueCell!646)) EmptyCell!646) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41448 (= lt!16504 (array!2636 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!206 (Int (_ BitVec 64)) V!2141)

(assert (=> b!41448 (= lt!16502 (dynLambda!206 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41450 () Bool)

(declare-fun res!24665 () Bool)

(assert (=> b!41450 (=> res!24665 e!26230)))

(assert (=> b!41450 (= res!24665 (bvslt mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!5912 res!24664) b!41448))

(assert (= (and b!41448 (not res!24666)) b!41449))

(assert (= (and b!41449 (not res!24667)) b!41450))

(assert (= (and b!41450 (not res!24665)) b!41451))

(declare-fun b_lambda!2125 () Bool)

(assert (=> (not b_lambda!2125) (not b!41448)))

(declare-fun t!3970 () Bool)

(declare-fun tb!879 () Bool)

(assert (=> (and start!5912 (= defaultEntry!470 defaultEntry!470) t!3970) tb!879))

(declare-fun result!1509 () Bool)

(declare-fun tp_is_empty!1787 () Bool)

(assert (=> tb!879 (= result!1509 tp_is_empty!1787)))

(assert (=> b!41448 t!3970))

(declare-fun b_and!2447 () Bool)

(assert (= b_and!2445 (and (=> t!3970 result!1509) b_and!2447)))

(declare-fun m!34773 () Bool)

(assert (=> b!41449 m!34773))

(declare-fun m!34775 () Bool)

(assert (=> start!5912 m!34775))

(declare-fun m!34777 () Bool)

(assert (=> b!41451 m!34777))

(declare-fun m!34779 () Bool)

(assert (=> b!41451 m!34779))

(assert (=> b!41451 m!34777))

(declare-fun m!34781 () Bool)

(assert (=> b!41451 m!34781))

(declare-fun m!34783 () Bool)

(assert (=> b!41448 m!34783))

(declare-fun m!34785 () Bool)

(assert (=> b!41448 m!34785))

(declare-fun m!34787 () Bool)

(assert (=> b!41448 m!34787))

(declare-fun m!34789 () Bool)

(assert (=> b!41448 m!34789))

(declare-fun m!34791 () Bool)

(assert (=> b!41448 m!34791))

(declare-fun m!34793 () Bool)

(assert (=> b!41448 m!34793))

(declare-fun m!34795 () Bool)

(assert (=> b!41448 m!34795))

(declare-fun m!34797 () Bool)

(assert (=> b!41448 m!34797))

(push 1)

(assert b_and!2447)

(assert (not b!41449))

(assert (not b!41448))

(assert tp_is_empty!1787)

(assert (not b!41451))

(assert (not start!5912))

(assert (not b_lambda!2125))

(assert (not b_next!1397))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2447)

(assert (not b_next!1397))

(check-sat)

(pop 1)

