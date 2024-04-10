; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5928 () Bool)

(assert start!5928)

(declare-fun b_free!1407 () Bool)

(declare-fun b_next!1407 () Bool)

(assert (=> start!5928 (= b_free!1407 (not b_next!1407))))

(declare-fun tp!5798 () Bool)

(declare-fun b_and!2463 () Bool)

(assert (=> start!5928 (= tp!5798 b_and!2463)))

(declare-fun b!41601 () Bool)

(declare-fun e!26313 () Bool)

(assert (=> b!41601 (= e!26313 true)))

(declare-datatypes ((V!2155 0))(
  ( (V!2156 (val!937 Int)) )
))
(declare-datatypes ((tuple2!1528 0))(
  ( (tuple2!1529 (_1!775 (_ BitVec 64)) (_2!775 V!2155)) )
))
(declare-datatypes ((List!1096 0))(
  ( (Nil!1093) (Cons!1092 (h!1669 tuple2!1528) (t!3999 List!1096)) )
))
(declare-datatypes ((ListLongMap!1105 0))(
  ( (ListLongMap!1106 (toList!568 List!1096)) )
))
(declare-fun lt!16643 () ListLongMap!1105)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun lt!16638 () V!2155)

(declare-datatypes ((ValueCell!651 0))(
  ( (ValueCellFull!651 (v!2021 V!2155)) (EmptyCell!651) )
))
(declare-datatypes ((array!2679 0))(
  ( (array!2680 (arr!1283 (Array (_ BitVec 32) ValueCell!651)) (size!1435 (_ BitVec 32))) )
))
(declare-fun lt!16640 () array!2679)

(declare-datatypes ((array!2681 0))(
  ( (array!2682 (arr!1284 (Array (_ BitVec 32) (_ BitVec 64))) (size!1436 (_ BitVec 32))) )
))
(declare-fun lt!16637 () array!2681)

(declare-fun lt!16642 () Bool)

(declare-fun defaultEntry!470 () Int)

(declare-fun contains!536 (ListLongMap!1105 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!329 (array!2681 array!2679 (_ BitVec 32) (_ BitVec 32) V!2155 V!2155 (_ BitVec 32) Int) ListLongMap!1105)

(declare-fun head!867 (List!1096) tuple2!1528)

(assert (=> b!41601 (= lt!16642 (contains!536 (getCurrentListMap!329 lt!16637 lt!16640 mask!853 #b00000000000000000000000000000000 lt!16638 lt!16638 #b00000000000000000000000000000000 defaultEntry!470) (_1!775 (head!867 (toList!568 lt!16643)))))))

(declare-fun res!24750 () Bool)

(declare-fun e!26314 () Bool)

(assert (=> start!5928 (=> (not res!24750) (not e!26314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5928 (= res!24750 (validMask!0 mask!853))))

(assert (=> start!5928 e!26314))

(assert (=> start!5928 true))

(assert (=> start!5928 tp!5798))

(declare-fun b!41598 () Bool)

(assert (=> b!41598 (= e!26314 (not e!26313))))

(declare-fun res!24753 () Bool)

(assert (=> b!41598 (=> res!24753 e!26313)))

(assert (=> b!41598 (= res!24753 (= lt!16643 (ListLongMap!1106 Nil!1093)))))

(declare-datatypes ((LongMapFixedSize!282 0))(
  ( (LongMapFixedSize!283 (defaultEntry!1831 Int) (mask!5242 (_ BitVec 32)) (extraKeys!1722 (_ BitVec 32)) (zeroValue!1749 V!2155) (minValue!1749 V!2155) (_size!190 (_ BitVec 32)) (_keys!3338 array!2681) (_values!1814 array!2679) (_vacant!190 (_ BitVec 32))) )
))
(declare-fun map!725 (LongMapFixedSize!282) ListLongMap!1105)

(assert (=> b!41598 (= lt!16643 (map!725 (LongMapFixedSize!283 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16638 lt!16638 #b00000000000000000000000000000000 lt!16637 lt!16640 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1097 0))(
  ( (Nil!1094) (Cons!1093 (h!1670 (_ BitVec 64)) (t!4000 List!1097)) )
))
(declare-fun arrayNoDuplicates!0 (array!2681 (_ BitVec 32) List!1097) Bool)

(assert (=> b!41598 (arrayNoDuplicates!0 lt!16637 #b00000000000000000000000000000000 Nil!1094)))

(declare-datatypes ((Unit!1037 0))(
  ( (Unit!1038) )
))
(declare-fun lt!16641 () Unit!1037)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2681 (_ BitVec 32) (_ BitVec 32) List!1097) Unit!1037)

(assert (=> b!41598 (= lt!16641 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16637 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2681 (_ BitVec 32)) Bool)

(assert (=> b!41598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16637 mask!853)))

(declare-fun lt!16636 () Unit!1037)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2681 (_ BitVec 32) (_ BitVec 32)) Unit!1037)

(assert (=> b!41598 (= lt!16636 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16637 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2681 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41598 (= (arrayCountValidKeys!0 lt!16637 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16639 () Unit!1037)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2681 (_ BitVec 32) (_ BitVec 32)) Unit!1037)

(assert (=> b!41598 (= lt!16639 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16637 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41598 (= lt!16640 (array!2680 ((as const (Array (_ BitVec 32) ValueCell!651)) EmptyCell!651) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41598 (= lt!16637 (array!2682 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!212 (Int (_ BitVec 64)) V!2155)

(assert (=> b!41598 (= lt!16638 (dynLambda!212 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41600 () Bool)

(declare-fun res!24752 () Bool)

(assert (=> b!41600 (=> res!24752 e!26313)))

(assert (=> b!41600 (= res!24752 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41599 () Bool)

(declare-fun res!24751 () Bool)

(assert (=> b!41599 (=> res!24751 e!26313)))

(declare-fun isEmpty!254 (List!1096) Bool)

(assert (=> b!41599 (= res!24751 (isEmpty!254 (toList!568 lt!16643)))))

(assert (= (and start!5928 res!24750) b!41598))

(assert (= (and b!41598 (not res!24753)) b!41599))

(assert (= (and b!41599 (not res!24751)) b!41600))

(assert (= (and b!41600 (not res!24752)) b!41601))

(declare-fun b_lambda!2131 () Bool)

(assert (=> (not b_lambda!2131) (not b!41598)))

(declare-fun t!3998 () Bool)

(declare-fun tb!889 () Bool)

(assert (=> (and start!5928 (= defaultEntry!470 defaultEntry!470) t!3998) tb!889))

(declare-fun result!1529 () Bool)

(declare-fun tp_is_empty!1797 () Bool)

(assert (=> tb!889 (= result!1529 tp_is_empty!1797)))

(assert (=> b!41598 t!3998))

(declare-fun b_and!2465 () Bool)

(assert (= b_and!2463 (and (=> t!3998 result!1529) b_and!2465)))

(declare-fun m!35001 () Bool)

(assert (=> b!41601 m!35001))

(declare-fun m!35003 () Bool)

(assert (=> b!41601 m!35003))

(assert (=> b!41601 m!35001))

(declare-fun m!35005 () Bool)

(assert (=> b!41601 m!35005))

(declare-fun m!35007 () Bool)

(assert (=> start!5928 m!35007))

(declare-fun m!35009 () Bool)

(assert (=> b!41598 m!35009))

(declare-fun m!35011 () Bool)

(assert (=> b!41598 m!35011))

(declare-fun m!35013 () Bool)

(assert (=> b!41598 m!35013))

(declare-fun m!35015 () Bool)

(assert (=> b!41598 m!35015))

(declare-fun m!35017 () Bool)

(assert (=> b!41598 m!35017))

(declare-fun m!35019 () Bool)

(assert (=> b!41598 m!35019))

(declare-fun m!35021 () Bool)

(assert (=> b!41598 m!35021))

(declare-fun m!35023 () Bool)

(assert (=> b!41598 m!35023))

(declare-fun m!35025 () Bool)

(assert (=> b!41599 m!35025))

(check-sat tp_is_empty!1797 (not b_next!1407) (not start!5928) (not b!41599) (not b_lambda!2131) (not b!41598) b_and!2465 (not b!41601))
(check-sat b_and!2465 (not b_next!1407))
