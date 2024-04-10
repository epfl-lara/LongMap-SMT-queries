; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5910 () Bool)

(assert start!5910)

(declare-fun b_free!1389 () Bool)

(declare-fun b_next!1389 () Bool)

(assert (=> start!5910 (= b_free!1389 (not b_next!1389))))

(declare-fun tp!5771 () Bool)

(declare-fun b_and!2427 () Bool)

(assert (=> start!5910 (= tp!5771 b_and!2427)))

(declare-fun res!24643 () Bool)

(declare-fun e!26259 () Bool)

(assert (=> start!5910 (=> (not res!24643) (not e!26259))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5910 (= res!24643 (validMask!0 mask!853))))

(assert (=> start!5910 e!26259))

(assert (=> start!5910 true))

(assert (=> start!5910 tp!5771))

(declare-fun b!41474 () Bool)

(declare-fun res!24645 () Bool)

(declare-fun e!26260 () Bool)

(assert (=> b!41474 (=> res!24645 e!26260)))

(assert (=> b!41474 (= res!24645 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41473 () Bool)

(declare-fun res!24644 () Bool)

(assert (=> b!41473 (=> res!24644 e!26260)))

(declare-datatypes ((V!2131 0))(
  ( (V!2132 (val!928 Int)) )
))
(declare-datatypes ((tuple2!1510 0))(
  ( (tuple2!1511 (_1!766 (_ BitVec 64)) (_2!766 V!2131)) )
))
(declare-datatypes ((List!1078 0))(
  ( (Nil!1075) (Cons!1074 (h!1651 tuple2!1510) (t!3963 List!1078)) )
))
(declare-datatypes ((ListLongMap!1087 0))(
  ( (ListLongMap!1088 (toList!559 List!1078)) )
))
(declare-fun lt!16421 () ListLongMap!1087)

(declare-fun isEmpty!245 (List!1078) Bool)

(assert (=> b!41473 (= res!24644 (isEmpty!245 (toList!559 lt!16421)))))

(declare-fun b!41475 () Bool)

(assert (=> b!41475 (= e!26260 true)))

(declare-datatypes ((array!2643 0))(
  ( (array!2644 (arr!1265 (Array (_ BitVec 32) (_ BitVec 64))) (size!1417 (_ BitVec 32))) )
))
(declare-fun lt!16426 () array!2643)

(declare-fun lt!16425 () V!2131)

(declare-datatypes ((ValueCell!642 0))(
  ( (ValueCellFull!642 (v!2012 V!2131)) (EmptyCell!642) )
))
(declare-datatypes ((array!2645 0))(
  ( (array!2646 (arr!1266 (Array (_ BitVec 32) ValueCell!642)) (size!1418 (_ BitVec 32))) )
))
(declare-fun lt!16423 () array!2645)

(declare-fun lt!16420 () Bool)

(declare-fun defaultEntry!470 () Int)

(declare-fun contains!527 (ListLongMap!1087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!320 (array!2643 array!2645 (_ BitVec 32) (_ BitVec 32) V!2131 V!2131 (_ BitVec 32) Int) ListLongMap!1087)

(declare-fun head!858 (List!1078) tuple2!1510)

(assert (=> b!41475 (= lt!16420 (contains!527 (getCurrentListMap!320 lt!16426 lt!16423 mask!853 #b00000000000000000000000000000000 lt!16425 lt!16425 #b00000000000000000000000000000000 defaultEntry!470) (_1!766 (head!858 (toList!559 lt!16421)))))))

(declare-fun b!41472 () Bool)

(assert (=> b!41472 (= e!26259 (not e!26260))))

(declare-fun res!24642 () Bool)

(assert (=> b!41472 (=> res!24642 e!26260)))

(assert (=> b!41472 (= res!24642 (= lt!16421 (ListLongMap!1088 Nil!1075)))))

(declare-datatypes ((LongMapFixedSize!264 0))(
  ( (LongMapFixedSize!265 (defaultEntry!1822 Int) (mask!5227 (_ BitVec 32)) (extraKeys!1713 (_ BitVec 32)) (zeroValue!1740 V!2131) (minValue!1740 V!2131) (_size!181 (_ BitVec 32)) (_keys!3329 array!2643) (_values!1805 array!2645) (_vacant!181 (_ BitVec 32))) )
))
(declare-fun map!710 (LongMapFixedSize!264) ListLongMap!1087)

(assert (=> b!41472 (= lt!16421 (map!710 (LongMapFixedSize!265 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16425 lt!16425 #b00000000000000000000000000000000 lt!16426 lt!16423 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1079 0))(
  ( (Nil!1076) (Cons!1075 (h!1652 (_ BitVec 64)) (t!3964 List!1079)) )
))
(declare-fun arrayNoDuplicates!0 (array!2643 (_ BitVec 32) List!1079) Bool)

(assert (=> b!41472 (arrayNoDuplicates!0 lt!16426 #b00000000000000000000000000000000 Nil!1076)))

(declare-datatypes ((Unit!1019 0))(
  ( (Unit!1020) )
))
(declare-fun lt!16422 () Unit!1019)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2643 (_ BitVec 32) (_ BitVec 32) List!1079) Unit!1019)

(assert (=> b!41472 (= lt!16422 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16426 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2643 (_ BitVec 32)) Bool)

(assert (=> b!41472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16426 mask!853)))

(declare-fun lt!16424 () Unit!1019)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2643 (_ BitVec 32) (_ BitVec 32)) Unit!1019)

(assert (=> b!41472 (= lt!16424 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16426 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2643 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41472 (= (arrayCountValidKeys!0 lt!16426 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16427 () Unit!1019)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2643 (_ BitVec 32) (_ BitVec 32)) Unit!1019)

(assert (=> b!41472 (= lt!16427 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16426 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41472 (= lt!16423 (array!2646 ((as const (Array (_ BitVec 32) ValueCell!642)) EmptyCell!642) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41472 (= lt!16426 (array!2644 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!203 (Int (_ BitVec 64)) V!2131)

(assert (=> b!41472 (= lt!16425 (dynLambda!203 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5910 res!24643) b!41472))

(assert (= (and b!41472 (not res!24642)) b!41473))

(assert (= (and b!41473 (not res!24644)) b!41474))

(assert (= (and b!41474 (not res!24645)) b!41475))

(declare-fun b_lambda!2113 () Bool)

(assert (=> (not b_lambda!2113) (not b!41472)))

(declare-fun t!3962 () Bool)

(declare-fun tb!871 () Bool)

(assert (=> (and start!5910 (= defaultEntry!470 defaultEntry!470) t!3962) tb!871))

(declare-fun result!1493 () Bool)

(declare-fun tp_is_empty!1779 () Bool)

(assert (=> tb!871 (= result!1493 tp_is_empty!1779)))

(assert (=> b!41472 t!3962))

(declare-fun b_and!2429 () Bool)

(assert (= b_and!2427 (and (=> t!3962 result!1493) b_and!2429)))

(declare-fun m!34767 () Bool)

(assert (=> start!5910 m!34767))

(declare-fun m!34769 () Bool)

(assert (=> b!41473 m!34769))

(declare-fun m!34771 () Bool)

(assert (=> b!41475 m!34771))

(declare-fun m!34773 () Bool)

(assert (=> b!41475 m!34773))

(assert (=> b!41475 m!34771))

(declare-fun m!34775 () Bool)

(assert (=> b!41475 m!34775))

(declare-fun m!34777 () Bool)

(assert (=> b!41472 m!34777))

(declare-fun m!34779 () Bool)

(assert (=> b!41472 m!34779))

(declare-fun m!34781 () Bool)

(assert (=> b!41472 m!34781))

(declare-fun m!34783 () Bool)

(assert (=> b!41472 m!34783))

(declare-fun m!34785 () Bool)

(assert (=> b!41472 m!34785))

(declare-fun m!34787 () Bool)

(assert (=> b!41472 m!34787))

(declare-fun m!34789 () Bool)

(assert (=> b!41472 m!34789))

(declare-fun m!34791 () Bool)

(assert (=> b!41472 m!34791))

(check-sat (not b_next!1389) (not start!5910) (not b_lambda!2113) tp_is_empty!1779 (not b!41472) (not b!41473) b_and!2429 (not b!41475))
(check-sat b_and!2429 (not b_next!1389))
