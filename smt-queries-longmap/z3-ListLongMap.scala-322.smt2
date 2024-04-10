; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5916 () Bool)

(assert start!5916)

(declare-fun b_free!1395 () Bool)

(declare-fun b_next!1395 () Bool)

(assert (=> start!5916 (= b_free!1395 (not b_next!1395))))

(declare-fun tp!5780 () Bool)

(declare-fun b_and!2439 () Bool)

(assert (=> start!5916 (= tp!5780 b_and!2439)))

(declare-fun b!41516 () Bool)

(declare-fun res!24681 () Bool)

(declare-fun e!26277 () Bool)

(assert (=> b!41516 (=> res!24681 e!26277)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!41516 (= res!24681 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun res!24678 () Bool)

(declare-fun e!26278 () Bool)

(assert (=> start!5916 (=> (not res!24678) (not e!26278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5916 (= res!24678 (validMask!0 mask!853))))

(assert (=> start!5916 e!26278))

(assert (=> start!5916 true))

(assert (=> start!5916 tp!5780))

(declare-fun b!41517 () Bool)

(assert (=> b!41517 (= e!26277 true)))

(declare-fun lt!16497 () Bool)

(declare-datatypes ((V!2139 0))(
  ( (V!2140 (val!931 Int)) )
))
(declare-datatypes ((tuple2!1516 0))(
  ( (tuple2!1517 (_1!769 (_ BitVec 64)) (_2!769 V!2139)) )
))
(declare-datatypes ((List!1084 0))(
  ( (Nil!1081) (Cons!1080 (h!1657 tuple2!1516) (t!3975 List!1084)) )
))
(declare-datatypes ((ListLongMap!1093 0))(
  ( (ListLongMap!1094 (toList!562 List!1084)) )
))
(declare-fun lt!16494 () ListLongMap!1093)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2655 0))(
  ( (array!2656 (arr!1271 (Array (_ BitVec 32) (_ BitVec 64))) (size!1423 (_ BitVec 32))) )
))
(declare-fun lt!16498 () array!2655)

(declare-fun lt!16493 () V!2139)

(declare-datatypes ((ValueCell!645 0))(
  ( (ValueCellFull!645 (v!2015 V!2139)) (EmptyCell!645) )
))
(declare-datatypes ((array!2657 0))(
  ( (array!2658 (arr!1272 (Array (_ BitVec 32) ValueCell!645)) (size!1424 (_ BitVec 32))) )
))
(declare-fun lt!16496 () array!2657)

(declare-fun contains!530 (ListLongMap!1093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!323 (array!2655 array!2657 (_ BitVec 32) (_ BitVec 32) V!2139 V!2139 (_ BitVec 32) Int) ListLongMap!1093)

(declare-fun head!861 (List!1084) tuple2!1516)

(assert (=> b!41517 (= lt!16497 (contains!530 (getCurrentListMap!323 lt!16498 lt!16496 mask!853 #b00000000000000000000000000000000 lt!16493 lt!16493 #b00000000000000000000000000000000 defaultEntry!470) (_1!769 (head!861 (toList!562 lt!16494)))))))

(declare-fun b!41515 () Bool)

(declare-fun res!24680 () Bool)

(assert (=> b!41515 (=> res!24680 e!26277)))

(declare-fun isEmpty!248 (List!1084) Bool)

(assert (=> b!41515 (= res!24680 (isEmpty!248 (toList!562 lt!16494)))))

(declare-fun b!41514 () Bool)

(assert (=> b!41514 (= e!26278 (not e!26277))))

(declare-fun res!24679 () Bool)

(assert (=> b!41514 (=> res!24679 e!26277)))

(assert (=> b!41514 (= res!24679 (= lt!16494 (ListLongMap!1094 Nil!1081)))))

(declare-datatypes ((LongMapFixedSize!270 0))(
  ( (LongMapFixedSize!271 (defaultEntry!1825 Int) (mask!5232 (_ BitVec 32)) (extraKeys!1716 (_ BitVec 32)) (zeroValue!1743 V!2139) (minValue!1743 V!2139) (_size!184 (_ BitVec 32)) (_keys!3332 array!2655) (_values!1808 array!2657) (_vacant!184 (_ BitVec 32))) )
))
(declare-fun map!715 (LongMapFixedSize!270) ListLongMap!1093)

(assert (=> b!41514 (= lt!16494 (map!715 (LongMapFixedSize!271 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16493 lt!16493 #b00000000000000000000000000000000 lt!16498 lt!16496 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1085 0))(
  ( (Nil!1082) (Cons!1081 (h!1658 (_ BitVec 64)) (t!3976 List!1085)) )
))
(declare-fun arrayNoDuplicates!0 (array!2655 (_ BitVec 32) List!1085) Bool)

(assert (=> b!41514 (arrayNoDuplicates!0 lt!16498 #b00000000000000000000000000000000 Nil!1082)))

(declare-datatypes ((Unit!1025 0))(
  ( (Unit!1026) )
))
(declare-fun lt!16499 () Unit!1025)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2655 (_ BitVec 32) (_ BitVec 32) List!1085) Unit!1025)

(assert (=> b!41514 (= lt!16499 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16498 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2655 (_ BitVec 32)) Bool)

(assert (=> b!41514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16498 mask!853)))

(declare-fun lt!16495 () Unit!1025)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2655 (_ BitVec 32) (_ BitVec 32)) Unit!1025)

(assert (=> b!41514 (= lt!16495 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16498 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2655 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41514 (= (arrayCountValidKeys!0 lt!16498 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16492 () Unit!1025)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2655 (_ BitVec 32) (_ BitVec 32)) Unit!1025)

(assert (=> b!41514 (= lt!16492 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16498 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41514 (= lt!16496 (array!2658 ((as const (Array (_ BitVec 32) ValueCell!645)) EmptyCell!645) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41514 (= lt!16498 (array!2656 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!206 (Int (_ BitVec 64)) V!2139)

(assert (=> b!41514 (= lt!16493 (dynLambda!206 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5916 res!24678) b!41514))

(assert (= (and b!41514 (not res!24679)) b!41515))

(assert (= (and b!41515 (not res!24680)) b!41516))

(assert (= (and b!41516 (not res!24681)) b!41517))

(declare-fun b_lambda!2119 () Bool)

(assert (=> (not b_lambda!2119) (not b!41514)))

(declare-fun t!3974 () Bool)

(declare-fun tb!877 () Bool)

(assert (=> (and start!5916 (= defaultEntry!470 defaultEntry!470) t!3974) tb!877))

(declare-fun result!1505 () Bool)

(declare-fun tp_is_empty!1785 () Bool)

(assert (=> tb!877 (= result!1505 tp_is_empty!1785)))

(assert (=> b!41514 t!3974))

(declare-fun b_and!2441 () Bool)

(assert (= b_and!2439 (and (=> t!3974 result!1505) b_and!2441)))

(declare-fun m!34845 () Bool)

(assert (=> start!5916 m!34845))

(declare-fun m!34847 () Bool)

(assert (=> b!41517 m!34847))

(declare-fun m!34849 () Bool)

(assert (=> b!41517 m!34849))

(assert (=> b!41517 m!34847))

(declare-fun m!34851 () Bool)

(assert (=> b!41517 m!34851))

(declare-fun m!34853 () Bool)

(assert (=> b!41515 m!34853))

(declare-fun m!34855 () Bool)

(assert (=> b!41514 m!34855))

(declare-fun m!34857 () Bool)

(assert (=> b!41514 m!34857))

(declare-fun m!34859 () Bool)

(assert (=> b!41514 m!34859))

(declare-fun m!34861 () Bool)

(assert (=> b!41514 m!34861))

(declare-fun m!34863 () Bool)

(assert (=> b!41514 m!34863))

(declare-fun m!34865 () Bool)

(assert (=> b!41514 m!34865))

(declare-fun m!34867 () Bool)

(assert (=> b!41514 m!34867))

(declare-fun m!34869 () Bool)

(assert (=> b!41514 m!34869))

(check-sat b_and!2441 (not b_lambda!2119) (not b!41515) (not b!41514) (not b!41517) tp_is_empty!1785 (not b_next!1395) (not start!5916))
(check-sat b_and!2441 (not b_next!1395))
