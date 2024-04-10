; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5904 () Bool)

(assert start!5904)

(declare-fun b_free!1383 () Bool)

(declare-fun b_next!1383 () Bool)

(assert (=> start!5904 (= b_free!1383 (not b_next!1383))))

(declare-fun tp!5762 () Bool)

(declare-fun b_and!2415 () Bool)

(assert (=> start!5904 (= tp!5762 b_and!2415)))

(declare-fun res!24609 () Bool)

(declare-fun e!26242 () Bool)

(assert (=> start!5904 (=> (not res!24609) (not e!26242))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5904 (= res!24609 (validMask!0 mask!853))))

(assert (=> start!5904 e!26242))

(assert (=> start!5904 true))

(assert (=> start!5904 tp!5762))

(declare-fun b!41431 () Bool)

(declare-fun res!24606 () Bool)

(declare-fun e!26241 () Bool)

(assert (=> b!41431 (=> res!24606 e!26241)))

(declare-datatypes ((V!2123 0))(
  ( (V!2124 (val!925 Int)) )
))
(declare-datatypes ((tuple2!1504 0))(
  ( (tuple2!1505 (_1!763 (_ BitVec 64)) (_2!763 V!2123)) )
))
(declare-datatypes ((List!1072 0))(
  ( (Nil!1069) (Cons!1068 (h!1645 tuple2!1504) (t!3951 List!1072)) )
))
(declare-datatypes ((ListLongMap!1081 0))(
  ( (ListLongMap!1082 (toList!556 List!1072)) )
))
(declare-fun lt!16349 () ListLongMap!1081)

(declare-fun isEmpty!242 (List!1072) Bool)

(assert (=> b!41431 (= res!24606 (isEmpty!242 (toList!556 lt!16349)))))

(declare-fun b!41430 () Bool)

(assert (=> b!41430 (= e!26242 (not e!26241))))

(declare-fun res!24607 () Bool)

(assert (=> b!41430 (=> res!24607 e!26241)))

(assert (=> b!41430 (= res!24607 (= lt!16349 (ListLongMap!1082 Nil!1069)))))

(declare-datatypes ((ValueCell!639 0))(
  ( (ValueCellFull!639 (v!2009 V!2123)) (EmptyCell!639) )
))
(declare-datatypes ((array!2631 0))(
  ( (array!2632 (arr!1259 (Array (_ BitVec 32) ValueCell!639)) (size!1411 (_ BitVec 32))) )
))
(declare-fun lt!16348 () array!2631)

(declare-fun lt!16354 () V!2123)

(declare-datatypes ((array!2633 0))(
  ( (array!2634 (arr!1260 (Array (_ BitVec 32) (_ BitVec 64))) (size!1412 (_ BitVec 32))) )
))
(declare-fun lt!16353 () array!2633)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((LongMapFixedSize!258 0))(
  ( (LongMapFixedSize!259 (defaultEntry!1819 Int) (mask!5222 (_ BitVec 32)) (extraKeys!1710 (_ BitVec 32)) (zeroValue!1737 V!2123) (minValue!1737 V!2123) (_size!178 (_ BitVec 32)) (_keys!3326 array!2633) (_values!1802 array!2631) (_vacant!178 (_ BitVec 32))) )
))
(declare-fun map!705 (LongMapFixedSize!258) ListLongMap!1081)

(assert (=> b!41430 (= lt!16349 (map!705 (LongMapFixedSize!259 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16354 lt!16354 #b00000000000000000000000000000000 lt!16353 lt!16348 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1073 0))(
  ( (Nil!1070) (Cons!1069 (h!1646 (_ BitVec 64)) (t!3952 List!1073)) )
))
(declare-fun arrayNoDuplicates!0 (array!2633 (_ BitVec 32) List!1073) Bool)

(assert (=> b!41430 (arrayNoDuplicates!0 lt!16353 #b00000000000000000000000000000000 Nil!1070)))

(declare-datatypes ((Unit!1013 0))(
  ( (Unit!1014) )
))
(declare-fun lt!16350 () Unit!1013)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2633 (_ BitVec 32) (_ BitVec 32) List!1073) Unit!1013)

(assert (=> b!41430 (= lt!16350 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2633 (_ BitVec 32)) Bool)

(assert (=> b!41430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16353 mask!853)))

(declare-fun lt!16351 () Unit!1013)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2633 (_ BitVec 32) (_ BitVec 32)) Unit!1013)

(assert (=> b!41430 (= lt!16351 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16353 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2633 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41430 (= (arrayCountValidKeys!0 lt!16353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16352 () Unit!1013)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2633 (_ BitVec 32) (_ BitVec 32)) Unit!1013)

(assert (=> b!41430 (= lt!16352 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41430 (= lt!16348 (array!2632 ((as const (Array (_ BitVec 32) ValueCell!639)) EmptyCell!639) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41430 (= lt!16353 (array!2634 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!200 (Int (_ BitVec 64)) V!2123)

(assert (=> b!41430 (= lt!16354 (dynLambda!200 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41433 () Bool)

(assert (=> b!41433 (= e!26241 true)))

(declare-fun lt!16355 () Bool)

(declare-fun contains!524 (ListLongMap!1081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!317 (array!2633 array!2631 (_ BitVec 32) (_ BitVec 32) V!2123 V!2123 (_ BitVec 32) Int) ListLongMap!1081)

(declare-fun head!855 (List!1072) tuple2!1504)

(assert (=> b!41433 (= lt!16355 (contains!524 (getCurrentListMap!317 lt!16353 lt!16348 mask!853 #b00000000000000000000000000000000 lt!16354 lt!16354 #b00000000000000000000000000000000 defaultEntry!470) (_1!763 (head!855 (toList!556 lt!16349)))))))

(declare-fun b!41432 () Bool)

(declare-fun res!24608 () Bool)

(assert (=> b!41432 (=> res!24608 e!26241)))

(assert (=> b!41432 (= res!24608 (bvslt mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!5904 res!24609) b!41430))

(assert (= (and b!41430 (not res!24607)) b!41431))

(assert (= (and b!41431 (not res!24606)) b!41432))

(assert (= (and b!41432 (not res!24608)) b!41433))

(declare-fun b_lambda!2107 () Bool)

(assert (=> (not b_lambda!2107) (not b!41430)))

(declare-fun t!3950 () Bool)

(declare-fun tb!865 () Bool)

(assert (=> (and start!5904 (= defaultEntry!470 defaultEntry!470) t!3950) tb!865))

(declare-fun result!1481 () Bool)

(declare-fun tp_is_empty!1773 () Bool)

(assert (=> tb!865 (= result!1481 tp_is_empty!1773)))

(assert (=> b!41430 t!3950))

(declare-fun b_and!2417 () Bool)

(assert (= b_and!2415 (and (=> t!3950 result!1481) b_and!2417)))

(declare-fun m!34689 () Bool)

(assert (=> start!5904 m!34689))

(declare-fun m!34691 () Bool)

(assert (=> b!41431 m!34691))

(declare-fun m!34693 () Bool)

(assert (=> b!41430 m!34693))

(declare-fun m!34695 () Bool)

(assert (=> b!41430 m!34695))

(declare-fun m!34697 () Bool)

(assert (=> b!41430 m!34697))

(declare-fun m!34699 () Bool)

(assert (=> b!41430 m!34699))

(declare-fun m!34701 () Bool)

(assert (=> b!41430 m!34701))

(declare-fun m!34703 () Bool)

(assert (=> b!41430 m!34703))

(declare-fun m!34705 () Bool)

(assert (=> b!41430 m!34705))

(declare-fun m!34707 () Bool)

(assert (=> b!41430 m!34707))

(declare-fun m!34709 () Bool)

(assert (=> b!41433 m!34709))

(declare-fun m!34711 () Bool)

(assert (=> b!41433 m!34711))

(assert (=> b!41433 m!34709))

(declare-fun m!34713 () Bool)

(assert (=> b!41433 m!34713))

(check-sat tp_is_empty!1773 b_and!2417 (not b!41431) (not b_lambda!2107) (not b!41430) (not b_next!1383) (not b!41433) (not start!5904))
(check-sat b_and!2417 (not b_next!1383))
