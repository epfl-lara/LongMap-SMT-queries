; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5920 () Bool)

(assert start!5920)

(declare-fun b_free!1405 () Bool)

(declare-fun b_next!1405 () Bool)

(assert (=> start!5920 (= b_free!1405 (not b_next!1405))))

(declare-fun tp!5795 () Bool)

(declare-fun b_and!2461 () Bool)

(assert (=> start!5920 (= tp!5795 b_and!2461)))

(declare-fun b!41504 () Bool)

(declare-fun e!26255 () Bool)

(declare-fun e!26254 () Bool)

(assert (=> b!41504 (= e!26255 (not e!26254))))

(declare-fun res!24713 () Bool)

(assert (=> b!41504 (=> res!24713 e!26254)))

(declare-datatypes ((V!2153 0))(
  ( (V!2154 (val!936 Int)) )
))
(declare-datatypes ((tuple2!1530 0))(
  ( (tuple2!1531 (_1!776 (_ BitVec 64)) (_2!776 V!2153)) )
))
(declare-datatypes ((List!1087 0))(
  ( (Nil!1084) (Cons!1083 (h!1660 tuple2!1530) (t!3987 List!1087)) )
))
(declare-datatypes ((ListLongMap!1095 0))(
  ( (ListLongMap!1096 (toList!563 List!1087)) )
))
(declare-fun lt!16597 () ListLongMap!1095)

(assert (=> b!41504 (= res!24713 (= lt!16597 (ListLongMap!1096 Nil!1084)))))

(declare-fun lt!16596 () V!2153)

(declare-datatypes ((ValueCell!650 0))(
  ( (ValueCellFull!650 (v!2018 V!2153)) (EmptyCell!650) )
))
(declare-datatypes ((array!2649 0))(
  ( (array!2650 (arr!1268 (Array (_ BitVec 32) ValueCell!650)) (size!1420 (_ BitVec 32))) )
))
(declare-fun lt!16600 () array!2649)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2651 0))(
  ( (array!2652 (arr!1269 (Array (_ BitVec 32) (_ BitVec 64))) (size!1421 (_ BitVec 32))) )
))
(declare-fun lt!16595 () array!2651)

(declare-datatypes ((LongMapFixedSize!280 0))(
  ( (LongMapFixedSize!281 (defaultEntry!1830 Int) (mask!5240 (_ BitVec 32)) (extraKeys!1721 (_ BitVec 32)) (zeroValue!1748 V!2153) (minValue!1748 V!2153) (_size!189 (_ BitVec 32)) (_keys!3336 array!2651) (_values!1813 array!2649) (_vacant!189 (_ BitVec 32))) )
))
(declare-fun map!725 (LongMapFixedSize!280) ListLongMap!1095)

(assert (=> b!41504 (= lt!16597 (map!725 (LongMapFixedSize!281 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16596 lt!16596 #b00000000000000000000000000000000 lt!16595 lt!16600 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1088 0))(
  ( (Nil!1085) (Cons!1084 (h!1661 (_ BitVec 64)) (t!3988 List!1088)) )
))
(declare-fun arrayNoDuplicates!0 (array!2651 (_ BitVec 32) List!1088) Bool)

(assert (=> b!41504 (arrayNoDuplicates!0 lt!16595 #b00000000000000000000000000000000 Nil!1085)))

(declare-datatypes ((Unit!1042 0))(
  ( (Unit!1043) )
))
(declare-fun lt!16598 () Unit!1042)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2651 (_ BitVec 32) (_ BitVec 32) List!1088) Unit!1042)

(assert (=> b!41504 (= lt!16598 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16595 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2651 (_ BitVec 32)) Bool)

(assert (=> b!41504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16595 mask!853)))

(declare-fun lt!16599 () Unit!1042)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2651 (_ BitVec 32) (_ BitVec 32)) Unit!1042)

(assert (=> b!41504 (= lt!16599 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16595 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2651 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41504 (= (arrayCountValidKeys!0 lt!16595 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16594 () Unit!1042)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2651 (_ BitVec 32) (_ BitVec 32)) Unit!1042)

(assert (=> b!41504 (= lt!16594 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16595 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41504 (= lt!16600 (array!2650 ((as const (Array (_ BitVec 32) ValueCell!650)) EmptyCell!650) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41504 (= lt!16595 (array!2652 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!210 (Int (_ BitVec 64)) V!2153)

(assert (=> b!41504 (= lt!16596 (dynLambda!210 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41506 () Bool)

(declare-fun res!24714 () Bool)

(assert (=> b!41506 (=> res!24714 e!26254)))

(assert (=> b!41506 (= res!24714 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41505 () Bool)

(declare-fun res!24712 () Bool)

(assert (=> b!41505 (=> res!24712 e!26254)))

(declare-fun isEmpty!255 (List!1087) Bool)

(assert (=> b!41505 (= res!24712 (isEmpty!255 (toList!563 lt!16597)))))

(declare-fun b!41507 () Bool)

(assert (=> b!41507 (= e!26254 true)))

(declare-fun lt!16601 () Bool)

(declare-fun contains!533 (ListLongMap!1095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!318 (array!2651 array!2649 (_ BitVec 32) (_ BitVec 32) V!2153 V!2153 (_ BitVec 32) Int) ListLongMap!1095)

(declare-fun head!866 (List!1087) tuple2!1530)

(assert (=> b!41507 (= lt!16601 (contains!533 (getCurrentListMap!318 lt!16595 lt!16600 mask!853 #b00000000000000000000000000000000 lt!16596 lt!16596 #b00000000000000000000000000000000 defaultEntry!470) (_1!776 (head!866 (toList!563 lt!16597)))))))

(declare-fun res!24715 () Bool)

(assert (=> start!5920 (=> (not res!24715) (not e!26255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5920 (= res!24715 (validMask!0 mask!853))))

(assert (=> start!5920 e!26255))

(assert (=> start!5920 true))

(assert (=> start!5920 tp!5795))

(assert (= (and start!5920 res!24715) b!41504))

(assert (= (and b!41504 (not res!24713)) b!41505))

(assert (= (and b!41505 (not res!24712)) b!41506))

(assert (= (and b!41506 (not res!24714)) b!41507))

(declare-fun b_lambda!2133 () Bool)

(assert (=> (not b_lambda!2133) (not b!41504)))

(declare-fun t!3986 () Bool)

(declare-fun tb!887 () Bool)

(assert (=> (and start!5920 (= defaultEntry!470 defaultEntry!470) t!3986) tb!887))

(declare-fun result!1525 () Bool)

(declare-fun tp_is_empty!1795 () Bool)

(assert (=> tb!887 (= result!1525 tp_is_empty!1795)))

(assert (=> b!41504 t!3986))

(declare-fun b_and!2463 () Bool)

(assert (= b_and!2461 (and (=> t!3986 result!1525) b_and!2463)))

(declare-fun m!34877 () Bool)

(assert (=> b!41504 m!34877))

(declare-fun m!34879 () Bool)

(assert (=> b!41504 m!34879))

(declare-fun m!34881 () Bool)

(assert (=> b!41504 m!34881))

(declare-fun m!34883 () Bool)

(assert (=> b!41504 m!34883))

(declare-fun m!34885 () Bool)

(assert (=> b!41504 m!34885))

(declare-fun m!34887 () Bool)

(assert (=> b!41504 m!34887))

(declare-fun m!34889 () Bool)

(assert (=> b!41504 m!34889))

(declare-fun m!34891 () Bool)

(assert (=> b!41504 m!34891))

(declare-fun m!34893 () Bool)

(assert (=> b!41505 m!34893))

(declare-fun m!34895 () Bool)

(assert (=> b!41507 m!34895))

(declare-fun m!34897 () Bool)

(assert (=> b!41507 m!34897))

(assert (=> b!41507 m!34895))

(declare-fun m!34899 () Bool)

(assert (=> b!41507 m!34899))

(declare-fun m!34901 () Bool)

(assert (=> start!5920 m!34901))

(check-sat (not start!5920) (not b!41505) (not b!41504) (not b_lambda!2133) (not b!41507) tp_is_empty!1795 b_and!2463 (not b_next!1405))
(check-sat b_and!2463 (not b_next!1405))
