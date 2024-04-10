; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5908 () Bool)

(assert start!5908)

(declare-fun b_free!1387 () Bool)

(declare-fun b_next!1387 () Bool)

(assert (=> start!5908 (= b_free!1387 (not b_next!1387))))

(declare-fun tp!5768 () Bool)

(declare-fun b_and!2423 () Bool)

(assert (=> start!5908 (= tp!5768 b_and!2423)))

(declare-fun b!41459 () Bool)

(declare-fun res!24631 () Bool)

(declare-fun e!26254 () Bool)

(assert (=> b!41459 (=> res!24631 e!26254)))

(declare-datatypes ((V!2129 0))(
  ( (V!2130 (val!927 Int)) )
))
(declare-datatypes ((tuple2!1508 0))(
  ( (tuple2!1509 (_1!765 (_ BitVec 64)) (_2!765 V!2129)) )
))
(declare-datatypes ((List!1076 0))(
  ( (Nil!1073) (Cons!1072 (h!1649 tuple2!1508) (t!3959 List!1076)) )
))
(declare-datatypes ((ListLongMap!1085 0))(
  ( (ListLongMap!1086 (toList!558 List!1076)) )
))
(declare-fun lt!16397 () ListLongMap!1085)

(declare-fun isEmpty!244 (List!1076) Bool)

(assert (=> b!41459 (= res!24631 (isEmpty!244 (toList!558 lt!16397)))))

(declare-fun b!41461 () Bool)

(assert (=> b!41461 (= e!26254 true)))

(declare-fun lt!16398 () Bool)

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((array!2639 0))(
  ( (array!2640 (arr!1263 (Array (_ BitVec 32) (_ BitVec 64))) (size!1415 (_ BitVec 32))) )
))
(declare-fun lt!16399 () array!2639)

(declare-datatypes ((ValueCell!641 0))(
  ( (ValueCellFull!641 (v!2011 V!2129)) (EmptyCell!641) )
))
(declare-datatypes ((array!2641 0))(
  ( (array!2642 (arr!1264 (Array (_ BitVec 32) ValueCell!641)) (size!1416 (_ BitVec 32))) )
))
(declare-fun lt!16396 () array!2641)

(declare-fun lt!16403 () V!2129)

(declare-fun defaultEntry!470 () Int)

(declare-fun contains!526 (ListLongMap!1085 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!319 (array!2639 array!2641 (_ BitVec 32) (_ BitVec 32) V!2129 V!2129 (_ BitVec 32) Int) ListLongMap!1085)

(declare-fun head!857 (List!1076) tuple2!1508)

(assert (=> b!41461 (= lt!16398 (contains!526 (getCurrentListMap!319 lt!16399 lt!16396 mask!853 #b00000000000000000000000000000000 lt!16403 lt!16403 #b00000000000000000000000000000000 defaultEntry!470) (_1!765 (head!857 (toList!558 lt!16397)))))))

(declare-fun res!24633 () Bool)

(declare-fun e!26253 () Bool)

(assert (=> start!5908 (=> (not res!24633) (not e!26253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5908 (= res!24633 (validMask!0 mask!853))))

(assert (=> start!5908 e!26253))

(assert (=> start!5908 true))

(assert (=> start!5908 tp!5768))

(declare-fun b!41460 () Bool)

(declare-fun res!24632 () Bool)

(assert (=> b!41460 (=> res!24632 e!26254)))

(assert (=> b!41460 (= res!24632 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41458 () Bool)

(assert (=> b!41458 (= e!26253 (not e!26254))))

(declare-fun res!24630 () Bool)

(assert (=> b!41458 (=> res!24630 e!26254)))

(assert (=> b!41458 (= res!24630 (= lt!16397 (ListLongMap!1086 Nil!1073)))))

(declare-datatypes ((LongMapFixedSize!262 0))(
  ( (LongMapFixedSize!263 (defaultEntry!1821 Int) (mask!5226 (_ BitVec 32)) (extraKeys!1712 (_ BitVec 32)) (zeroValue!1739 V!2129) (minValue!1739 V!2129) (_size!180 (_ BitVec 32)) (_keys!3328 array!2639) (_values!1804 array!2641) (_vacant!180 (_ BitVec 32))) )
))
(declare-fun map!709 (LongMapFixedSize!262) ListLongMap!1085)

(assert (=> b!41458 (= lt!16397 (map!709 (LongMapFixedSize!263 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16403 lt!16403 #b00000000000000000000000000000000 lt!16399 lt!16396 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1077 0))(
  ( (Nil!1074) (Cons!1073 (h!1650 (_ BitVec 64)) (t!3960 List!1077)) )
))
(declare-fun arrayNoDuplicates!0 (array!2639 (_ BitVec 32) List!1077) Bool)

(assert (=> b!41458 (arrayNoDuplicates!0 lt!16399 #b00000000000000000000000000000000 Nil!1074)))

(declare-datatypes ((Unit!1017 0))(
  ( (Unit!1018) )
))
(declare-fun lt!16402 () Unit!1017)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2639 (_ BitVec 32) (_ BitVec 32) List!1077) Unit!1017)

(assert (=> b!41458 (= lt!16402 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16399 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2639 (_ BitVec 32)) Bool)

(assert (=> b!41458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16399 mask!853)))

(declare-fun lt!16401 () Unit!1017)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2639 (_ BitVec 32) (_ BitVec 32)) Unit!1017)

(assert (=> b!41458 (= lt!16401 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16399 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2639 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41458 (= (arrayCountValidKeys!0 lt!16399 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16400 () Unit!1017)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2639 (_ BitVec 32) (_ BitVec 32)) Unit!1017)

(assert (=> b!41458 (= lt!16400 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16399 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41458 (= lt!16396 (array!2642 ((as const (Array (_ BitVec 32) ValueCell!641)) EmptyCell!641) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41458 (= lt!16399 (array!2640 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!202 (Int (_ BitVec 64)) V!2129)

(assert (=> b!41458 (= lt!16403 (dynLambda!202 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5908 res!24633) b!41458))

(assert (= (and b!41458 (not res!24630)) b!41459))

(assert (= (and b!41459 (not res!24631)) b!41460))

(assert (= (and b!41460 (not res!24632)) b!41461))

(declare-fun b_lambda!2111 () Bool)

(assert (=> (not b_lambda!2111) (not b!41458)))

(declare-fun t!3958 () Bool)

(declare-fun tb!869 () Bool)

(assert (=> (and start!5908 (= defaultEntry!470 defaultEntry!470) t!3958) tb!869))

(declare-fun result!1489 () Bool)

(declare-fun tp_is_empty!1777 () Bool)

(assert (=> tb!869 (= result!1489 tp_is_empty!1777)))

(assert (=> b!41458 t!3958))

(declare-fun b_and!2425 () Bool)

(assert (= b_and!2423 (and (=> t!3958 result!1489) b_and!2425)))

(declare-fun m!34741 () Bool)

(assert (=> b!41459 m!34741))

(declare-fun m!34743 () Bool)

(assert (=> b!41461 m!34743))

(declare-fun m!34745 () Bool)

(assert (=> b!41461 m!34745))

(assert (=> b!41461 m!34743))

(declare-fun m!34747 () Bool)

(assert (=> b!41461 m!34747))

(declare-fun m!34749 () Bool)

(assert (=> start!5908 m!34749))

(declare-fun m!34751 () Bool)

(assert (=> b!41458 m!34751))

(declare-fun m!34753 () Bool)

(assert (=> b!41458 m!34753))

(declare-fun m!34755 () Bool)

(assert (=> b!41458 m!34755))

(declare-fun m!34757 () Bool)

(assert (=> b!41458 m!34757))

(declare-fun m!34759 () Bool)

(assert (=> b!41458 m!34759))

(declare-fun m!34761 () Bool)

(assert (=> b!41458 m!34761))

(declare-fun m!34763 () Bool)

(assert (=> b!41458 m!34763))

(declare-fun m!34765 () Bool)

(assert (=> b!41458 m!34765))

(push 1)

(assert b_and!2425)

(assert (not b_next!1387))

(assert (not start!5908))

(assert tp_is_empty!1777)

(assert (not b_lambda!2111))

(assert (not b!41458))

(assert (not b!41461))

(assert (not b!41459))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2425)

(assert (not b_next!1387))

(check-sat)

(pop 1)

