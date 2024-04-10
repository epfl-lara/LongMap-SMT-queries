; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5926 () Bool)

(assert start!5926)

(declare-fun b_free!1405 () Bool)

(declare-fun b_next!1405 () Bool)

(assert (=> start!5926 (= b_free!1405 (not b_next!1405))))

(declare-fun tp!5795 () Bool)

(declare-fun b_and!2459 () Bool)

(assert (=> start!5926 (= tp!5795 b_and!2459)))

(declare-fun b!41584 () Bool)

(declare-fun e!26308 () Bool)

(declare-fun e!26307 () Bool)

(assert (=> b!41584 (= e!26308 (not e!26307))))

(declare-fun res!24738 () Bool)

(assert (=> b!41584 (=> res!24738 e!26307)))

(declare-datatypes ((V!2153 0))(
  ( (V!2154 (val!936 Int)) )
))
(declare-datatypes ((tuple2!1526 0))(
  ( (tuple2!1527 (_1!774 (_ BitVec 64)) (_2!774 V!2153)) )
))
(declare-datatypes ((List!1094 0))(
  ( (Nil!1091) (Cons!1090 (h!1667 tuple2!1526) (t!3995 List!1094)) )
))
(declare-datatypes ((ListLongMap!1103 0))(
  ( (ListLongMap!1104 (toList!567 List!1094)) )
))
(declare-fun lt!16616 () ListLongMap!1103)

(assert (=> b!41584 (= res!24738 (= lt!16616 (ListLongMap!1104 Nil!1091)))))

(declare-datatypes ((array!2675 0))(
  ( (array!2676 (arr!1281 (Array (_ BitVec 32) (_ BitVec 64))) (size!1433 (_ BitVec 32))) )
))
(declare-fun lt!16619 () array!2675)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!650 0))(
  ( (ValueCellFull!650 (v!2020 V!2153)) (EmptyCell!650) )
))
(declare-datatypes ((array!2677 0))(
  ( (array!2678 (arr!1282 (Array (_ BitVec 32) ValueCell!650)) (size!1434 (_ BitVec 32))) )
))
(declare-fun lt!16617 () array!2677)

(declare-fun lt!16613 () V!2153)

(declare-datatypes ((LongMapFixedSize!280 0))(
  ( (LongMapFixedSize!281 (defaultEntry!1830 Int) (mask!5241 (_ BitVec 32)) (extraKeys!1721 (_ BitVec 32)) (zeroValue!1748 V!2153) (minValue!1748 V!2153) (_size!189 (_ BitVec 32)) (_keys!3337 array!2675) (_values!1813 array!2677) (_vacant!189 (_ BitVec 32))) )
))
(declare-fun map!724 (LongMapFixedSize!280) ListLongMap!1103)

(assert (=> b!41584 (= lt!16616 (map!724 (LongMapFixedSize!281 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16613 lt!16613 #b00000000000000000000000000000000 lt!16619 lt!16617 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1095 0))(
  ( (Nil!1092) (Cons!1091 (h!1668 (_ BitVec 64)) (t!3996 List!1095)) )
))
(declare-fun arrayNoDuplicates!0 (array!2675 (_ BitVec 32) List!1095) Bool)

(assert (=> b!41584 (arrayNoDuplicates!0 lt!16619 #b00000000000000000000000000000000 Nil!1092)))

(declare-datatypes ((Unit!1035 0))(
  ( (Unit!1036) )
))
(declare-fun lt!16618 () Unit!1035)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2675 (_ BitVec 32) (_ BitVec 32) List!1095) Unit!1035)

(assert (=> b!41584 (= lt!16618 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16619 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2675 (_ BitVec 32)) Bool)

(assert (=> b!41584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16619 mask!853)))

(declare-fun lt!16614 () Unit!1035)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2675 (_ BitVec 32) (_ BitVec 32)) Unit!1035)

(assert (=> b!41584 (= lt!16614 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16619 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2675 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41584 (= (arrayCountValidKeys!0 lt!16619 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16615 () Unit!1035)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2675 (_ BitVec 32) (_ BitVec 32)) Unit!1035)

(assert (=> b!41584 (= lt!16615 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16619 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41584 (= lt!16617 (array!2678 ((as const (Array (_ BitVec 32) ValueCell!650)) EmptyCell!650) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41584 (= lt!16619 (array!2676 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!211 (Int (_ BitVec 64)) V!2153)

(assert (=> b!41584 (= lt!16613 (dynLambda!211 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24740 () Bool)

(assert (=> start!5926 (=> (not res!24740) (not e!26308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5926 (= res!24740 (validMask!0 mask!853))))

(assert (=> start!5926 e!26308))

(assert (=> start!5926 true))

(assert (=> start!5926 tp!5795))

(declare-fun b!41586 () Bool)

(declare-fun res!24739 () Bool)

(assert (=> b!41586 (=> res!24739 e!26307)))

(assert (=> b!41586 (= res!24739 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41587 () Bool)

(assert (=> b!41587 (= e!26307 true)))

(declare-fun lt!16612 () Bool)

(declare-fun contains!535 (ListLongMap!1103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!328 (array!2675 array!2677 (_ BitVec 32) (_ BitVec 32) V!2153 V!2153 (_ BitVec 32) Int) ListLongMap!1103)

(declare-fun head!866 (List!1094) tuple2!1526)

(assert (=> b!41587 (= lt!16612 (contains!535 (getCurrentListMap!328 lt!16619 lt!16617 mask!853 #b00000000000000000000000000000000 lt!16613 lt!16613 #b00000000000000000000000000000000 defaultEntry!470) (_1!774 (head!866 (toList!567 lt!16616)))))))

(declare-fun b!41585 () Bool)

(declare-fun res!24741 () Bool)

(assert (=> b!41585 (=> res!24741 e!26307)))

(declare-fun isEmpty!253 (List!1094) Bool)

(assert (=> b!41585 (= res!24741 (isEmpty!253 (toList!567 lt!16616)))))

(assert (= (and start!5926 res!24740) b!41584))

(assert (= (and b!41584 (not res!24738)) b!41585))

(assert (= (and b!41585 (not res!24741)) b!41586))

(assert (= (and b!41586 (not res!24739)) b!41587))

(declare-fun b_lambda!2129 () Bool)

(assert (=> (not b_lambda!2129) (not b!41584)))

(declare-fun t!3994 () Bool)

(declare-fun tb!887 () Bool)

(assert (=> (and start!5926 (= defaultEntry!470 defaultEntry!470) t!3994) tb!887))

(declare-fun result!1525 () Bool)

(declare-fun tp_is_empty!1795 () Bool)

(assert (=> tb!887 (= result!1525 tp_is_empty!1795)))

(assert (=> b!41584 t!3994))

(declare-fun b_and!2461 () Bool)

(assert (= b_and!2459 (and (=> t!3994 result!1525) b_and!2461)))

(declare-fun m!34975 () Bool)

(assert (=> b!41584 m!34975))

(declare-fun m!34977 () Bool)

(assert (=> b!41584 m!34977))

(declare-fun m!34979 () Bool)

(assert (=> b!41584 m!34979))

(declare-fun m!34981 () Bool)

(assert (=> b!41584 m!34981))

(declare-fun m!34983 () Bool)

(assert (=> b!41584 m!34983))

(declare-fun m!34985 () Bool)

(assert (=> b!41584 m!34985))

(declare-fun m!34987 () Bool)

(assert (=> b!41584 m!34987))

(declare-fun m!34989 () Bool)

(assert (=> b!41584 m!34989))

(declare-fun m!34991 () Bool)

(assert (=> start!5926 m!34991))

(declare-fun m!34993 () Bool)

(assert (=> b!41587 m!34993))

(declare-fun m!34995 () Bool)

(assert (=> b!41587 m!34995))

(assert (=> b!41587 m!34993))

(declare-fun m!34997 () Bool)

(assert (=> b!41587 m!34997))

(declare-fun m!34999 () Bool)

(assert (=> b!41585 m!34999))

(push 1)

(assert (not b!41587))

(assert (not b_next!1405))

(assert (not start!5926))

(assert tp_is_empty!1795)

(assert (not b!41585))

(assert (not b!41584))

(assert (not b_lambda!2129))

(assert b_and!2461)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2461)

(assert (not b_next!1405))

(check-sat)

(pop 1)

