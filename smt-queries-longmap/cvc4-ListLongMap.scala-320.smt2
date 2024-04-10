; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5906 () Bool)

(assert start!5906)

(declare-fun b_free!1385 () Bool)

(declare-fun b_next!1385 () Bool)

(assert (=> start!5906 (= b_free!1385 (not b_next!1385))))

(declare-fun tp!5765 () Bool)

(declare-fun b_and!2419 () Bool)

(assert (=> start!5906 (= tp!5765 b_and!2419)))

(declare-fun res!24620 () Bool)

(declare-fun e!26247 () Bool)

(assert (=> start!5906 (=> (not res!24620) (not e!26247))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5906 (= res!24620 (validMask!0 mask!853))))

(assert (=> start!5906 e!26247))

(assert (=> start!5906 true))

(assert (=> start!5906 tp!5765))

(declare-fun b!41447 () Bool)

(declare-fun e!26248 () Bool)

(assert (=> b!41447 (= e!26248 true)))

(declare-datatypes ((V!2125 0))(
  ( (V!2126 (val!926 Int)) )
))
(declare-datatypes ((tuple2!1506 0))(
  ( (tuple2!1507 (_1!764 (_ BitVec 64)) (_2!764 V!2125)) )
))
(declare-datatypes ((List!1074 0))(
  ( (Nil!1071) (Cons!1070 (h!1647 tuple2!1506) (t!3955 List!1074)) )
))
(declare-datatypes ((ListLongMap!1083 0))(
  ( (ListLongMap!1084 (toList!557 List!1074)) )
))
(declare-fun lt!16373 () ListLongMap!1083)

(declare-fun lt!16372 () Bool)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!640 0))(
  ( (ValueCellFull!640 (v!2010 V!2125)) (EmptyCell!640) )
))
(declare-datatypes ((array!2635 0))(
  ( (array!2636 (arr!1261 (Array (_ BitVec 32) ValueCell!640)) (size!1413 (_ BitVec 32))) )
))
(declare-fun lt!16377 () array!2635)

(declare-datatypes ((array!2637 0))(
  ( (array!2638 (arr!1262 (Array (_ BitVec 32) (_ BitVec 64))) (size!1414 (_ BitVec 32))) )
))
(declare-fun lt!16375 () array!2637)

(declare-fun lt!16376 () V!2125)

(declare-fun contains!525 (ListLongMap!1083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!318 (array!2637 array!2635 (_ BitVec 32) (_ BitVec 32) V!2125 V!2125 (_ BitVec 32) Int) ListLongMap!1083)

(declare-fun head!856 (List!1074) tuple2!1506)

(assert (=> b!41447 (= lt!16372 (contains!525 (getCurrentListMap!318 lt!16375 lt!16377 mask!853 #b00000000000000000000000000000000 lt!16376 lt!16376 #b00000000000000000000000000000000 defaultEntry!470) (_1!764 (head!856 (toList!557 lt!16373)))))))

(declare-fun b!41446 () Bool)

(declare-fun res!24619 () Bool)

(assert (=> b!41446 (=> res!24619 e!26248)))

(assert (=> b!41446 (= res!24619 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41445 () Bool)

(declare-fun res!24618 () Bool)

(assert (=> b!41445 (=> res!24618 e!26248)))

(declare-fun isEmpty!243 (List!1074) Bool)

(assert (=> b!41445 (= res!24618 (isEmpty!243 (toList!557 lt!16373)))))

(declare-fun b!41444 () Bool)

(assert (=> b!41444 (= e!26247 (not e!26248))))

(declare-fun res!24621 () Bool)

(assert (=> b!41444 (=> res!24621 e!26248)))

(assert (=> b!41444 (= res!24621 (= lt!16373 (ListLongMap!1084 Nil!1071)))))

(declare-datatypes ((LongMapFixedSize!260 0))(
  ( (LongMapFixedSize!261 (defaultEntry!1820 Int) (mask!5223 (_ BitVec 32)) (extraKeys!1711 (_ BitVec 32)) (zeroValue!1738 V!2125) (minValue!1738 V!2125) (_size!179 (_ BitVec 32)) (_keys!3327 array!2637) (_values!1803 array!2635) (_vacant!179 (_ BitVec 32))) )
))
(declare-fun map!706 (LongMapFixedSize!260) ListLongMap!1083)

(assert (=> b!41444 (= lt!16373 (map!706 (LongMapFixedSize!261 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16376 lt!16376 #b00000000000000000000000000000000 lt!16375 lt!16377 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1075 0))(
  ( (Nil!1072) (Cons!1071 (h!1648 (_ BitVec 64)) (t!3956 List!1075)) )
))
(declare-fun arrayNoDuplicates!0 (array!2637 (_ BitVec 32) List!1075) Bool)

(assert (=> b!41444 (arrayNoDuplicates!0 lt!16375 #b00000000000000000000000000000000 Nil!1072)))

(declare-datatypes ((Unit!1015 0))(
  ( (Unit!1016) )
))
(declare-fun lt!16374 () Unit!1015)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2637 (_ BitVec 32) (_ BitVec 32) List!1075) Unit!1015)

(assert (=> b!41444 (= lt!16374 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16375 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2637 (_ BitVec 32)) Bool)

(assert (=> b!41444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16375 mask!853)))

(declare-fun lt!16379 () Unit!1015)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2637 (_ BitVec 32) (_ BitVec 32)) Unit!1015)

(assert (=> b!41444 (= lt!16379 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16375 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2637 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41444 (= (arrayCountValidKeys!0 lt!16375 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16378 () Unit!1015)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2637 (_ BitVec 32) (_ BitVec 32)) Unit!1015)

(assert (=> b!41444 (= lt!16378 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16375 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41444 (= lt!16377 (array!2636 ((as const (Array (_ BitVec 32) ValueCell!640)) EmptyCell!640) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41444 (= lt!16375 (array!2638 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!201 (Int (_ BitVec 64)) V!2125)

(assert (=> b!41444 (= lt!16376 (dynLambda!201 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5906 res!24620) b!41444))

(assert (= (and b!41444 (not res!24621)) b!41445))

(assert (= (and b!41445 (not res!24618)) b!41446))

(assert (= (and b!41446 (not res!24619)) b!41447))

(declare-fun b_lambda!2109 () Bool)

(assert (=> (not b_lambda!2109) (not b!41444)))

(declare-fun t!3954 () Bool)

(declare-fun tb!867 () Bool)

(assert (=> (and start!5906 (= defaultEntry!470 defaultEntry!470) t!3954) tb!867))

(declare-fun result!1485 () Bool)

(declare-fun tp_is_empty!1775 () Bool)

(assert (=> tb!867 (= result!1485 tp_is_empty!1775)))

(assert (=> b!41444 t!3954))

(declare-fun b_and!2421 () Bool)

(assert (= b_and!2419 (and (=> t!3954 result!1485) b_and!2421)))

(declare-fun m!34715 () Bool)

(assert (=> start!5906 m!34715))

(declare-fun m!34717 () Bool)

(assert (=> b!41447 m!34717))

(declare-fun m!34719 () Bool)

(assert (=> b!41447 m!34719))

(assert (=> b!41447 m!34717))

(declare-fun m!34721 () Bool)

(assert (=> b!41447 m!34721))

(declare-fun m!34723 () Bool)

(assert (=> b!41445 m!34723))

(declare-fun m!34725 () Bool)

(assert (=> b!41444 m!34725))

(declare-fun m!34727 () Bool)

(assert (=> b!41444 m!34727))

(declare-fun m!34729 () Bool)

(assert (=> b!41444 m!34729))

(declare-fun m!34731 () Bool)

(assert (=> b!41444 m!34731))

(declare-fun m!34733 () Bool)

(assert (=> b!41444 m!34733))

(declare-fun m!34735 () Bool)

(assert (=> b!41444 m!34735))

(declare-fun m!34737 () Bool)

(assert (=> b!41444 m!34737))

(declare-fun m!34739 () Bool)

(assert (=> b!41444 m!34739))

(push 1)

(assert (not b!41445))

(assert (not b!41444))

(assert (not b!41447))

(assert (not start!5906))

(assert tp_is_empty!1775)

(assert (not b_lambda!2109))

(assert b_and!2421)

(assert (not b_next!1385))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2421)

(assert (not b_next!1385))

(check-sat)

