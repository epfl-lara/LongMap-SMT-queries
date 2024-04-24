; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5942 () Bool)

(assert start!5942)

(declare-fun b_free!1417 () Bool)

(declare-fun b_next!1417 () Bool)

(assert (=> start!5942 (= b_free!1417 (not b_next!1417))))

(declare-fun tp!5813 () Bool)

(declare-fun b_and!2481 () Bool)

(assert (=> start!5942 (= tp!5813 b_and!2481)))

(declare-fun b!41611 () Bool)

(declare-fun e!26306 () Bool)

(declare-fun e!26307 () Bool)

(assert (=> b!41611 (= e!26306 (not e!26307))))

(declare-fun res!24788 () Bool)

(assert (=> b!41611 (=> res!24788 e!26307)))

(declare-datatypes ((V!2169 0))(
  ( (V!2170 (val!942 Int)) )
))
(declare-datatypes ((tuple2!1520 0))(
  ( (tuple2!1521 (_1!771 (_ BitVec 64)) (_2!771 V!2169)) )
))
(declare-datatypes ((List!1092 0))(
  ( (Nil!1089) (Cons!1088 (h!1665 tuple2!1520) (t!4005 List!1092)) )
))
(declare-datatypes ((ListLongMap!1091 0))(
  ( (ListLongMap!1092 (toList!561 List!1092)) )
))
(declare-fun lt!16716 () ListLongMap!1091)

(assert (=> b!41611 (= res!24788 (= lt!16716 (ListLongMap!1092 Nil!1089)))))

(declare-fun lt!16713 () V!2169)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2685 0))(
  ( (array!2686 (arr!1286 (Array (_ BitVec 32) (_ BitVec 64))) (size!1438 (_ BitVec 32))) )
))
(declare-fun lt!16715 () array!2685)

(declare-datatypes ((ValueCell!656 0))(
  ( (ValueCellFull!656 (v!2027 V!2169)) (EmptyCell!656) )
))
(declare-datatypes ((array!2687 0))(
  ( (array!2688 (arr!1287 (Array (_ BitVec 32) ValueCell!656)) (size!1439 (_ BitVec 32))) )
))
(declare-fun lt!16720 () array!2687)

(declare-datatypes ((LongMapFixedSize!292 0))(
  ( (LongMapFixedSize!293 (defaultEntry!1836 Int) (mask!5251 (_ BitVec 32)) (extraKeys!1727 (_ BitVec 32)) (zeroValue!1754 V!2169) (minValue!1754 V!2169) (_size!195 (_ BitVec 32)) (_keys!3343 array!2685) (_values!1819 array!2687) (_vacant!195 (_ BitVec 32))) )
))
(declare-fun map!734 (LongMapFixedSize!292) ListLongMap!1091)

(assert (=> b!41611 (= lt!16716 (map!734 (LongMapFixedSize!293 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16713 lt!16713 #b00000000000000000000000000000000 lt!16715 lt!16720 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1093 0))(
  ( (Nil!1090) (Cons!1089 (h!1666 (_ BitVec 64)) (t!4006 List!1093)) )
))
(declare-fun arrayNoDuplicates!0 (array!2685 (_ BitVec 32) List!1093) Bool)

(assert (=> b!41611 (arrayNoDuplicates!0 lt!16715 #b00000000000000000000000000000000 Nil!1090)))

(declare-datatypes ((Unit!1059 0))(
  ( (Unit!1060) )
))
(declare-fun lt!16719 () Unit!1059)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2685 (_ BitVec 32) (_ BitVec 32) List!1093) Unit!1059)

(assert (=> b!41611 (= lt!16719 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16715 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2685 (_ BitVec 32)) Bool)

(assert (=> b!41611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16715 mask!853)))

(declare-fun lt!16717 () Unit!1059)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2685 (_ BitVec 32) (_ BitVec 32)) Unit!1059)

(assert (=> b!41611 (= lt!16717 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16715 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2685 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41611 (= (arrayCountValidKeys!0 lt!16715 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16718 () Unit!1059)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2685 (_ BitVec 32) (_ BitVec 32)) Unit!1059)

(assert (=> b!41611 (= lt!16718 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16715 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41611 (= lt!16720 (array!2688 ((as const (Array (_ BitVec 32) ValueCell!656)) EmptyCell!656) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41611 (= lt!16715 (array!2686 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!213 (Int (_ BitVec 64)) V!2169)

(assert (=> b!41611 (= lt!16713 (dynLambda!213 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24785 () Bool)

(assert (=> start!5942 (=> (not res!24785) (not e!26306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5942 (= res!24785 (validMask!0 mask!853))))

(assert (=> start!5942 e!26306))

(assert (=> start!5942 true))

(assert (=> start!5942 tp!5813))

(declare-fun b!41613 () Bool)

(declare-fun res!24786 () Bool)

(assert (=> b!41613 (=> res!24786 e!26307)))

(assert (=> b!41613 (= res!24786 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41612 () Bool)

(declare-fun res!24787 () Bool)

(assert (=> b!41612 (=> res!24787 e!26307)))

(declare-fun isEmpty!263 (List!1092) Bool)

(assert (=> b!41612 (= res!24787 (isEmpty!263 (toList!561 lt!16716)))))

(declare-fun b!41614 () Bool)

(assert (=> b!41614 (= e!26307 true)))

(declare-fun lt!16714 () Bool)

(declare-fun contains!532 (ListLongMap!1091 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!318 (array!2685 array!2687 (_ BitVec 32) (_ BitVec 32) V!2169 V!2169 (_ BitVec 32) Int) ListLongMap!1091)

(declare-fun head!870 (List!1092) tuple2!1520)

(assert (=> b!41614 (= lt!16714 (contains!532 (getCurrentListMap!318 lt!16715 lt!16720 mask!853 #b00000000000000000000000000000000 lt!16713 lt!16713 #b00000000000000000000000000000000 defaultEntry!470) (_1!771 (head!870 (toList!561 lt!16716)))))))

(assert (= (and start!5942 res!24785) b!41611))

(assert (= (and b!41611 (not res!24788)) b!41612))

(assert (= (and b!41612 (not res!24787)) b!41613))

(assert (= (and b!41613 (not res!24786)) b!41614))

(declare-fun b_lambda!2141 () Bool)

(assert (=> (not b_lambda!2141) (not b!41611)))

(declare-fun t!4004 () Bool)

(declare-fun tb!899 () Bool)

(assert (=> (and start!5942 (= defaultEntry!470 defaultEntry!470) t!4004) tb!899))

(declare-fun result!1549 () Bool)

(declare-fun tp_is_empty!1807 () Bool)

(assert (=> tb!899 (= result!1549 tp_is_empty!1807)))

(assert (=> b!41611 t!4004))

(declare-fun b_and!2483 () Bool)

(assert (= b_and!2481 (and (=> t!4004 result!1549) b_and!2483)))

(declare-fun m!35005 () Bool)

(assert (=> b!41611 m!35005))

(declare-fun m!35007 () Bool)

(assert (=> b!41611 m!35007))

(declare-fun m!35009 () Bool)

(assert (=> b!41611 m!35009))

(declare-fun m!35011 () Bool)

(assert (=> b!41611 m!35011))

(declare-fun m!35013 () Bool)

(assert (=> b!41611 m!35013))

(declare-fun m!35015 () Bool)

(assert (=> b!41611 m!35015))

(declare-fun m!35017 () Bool)

(assert (=> b!41611 m!35017))

(declare-fun m!35019 () Bool)

(assert (=> b!41611 m!35019))

(declare-fun m!35021 () Bool)

(assert (=> start!5942 m!35021))

(declare-fun m!35023 () Bool)

(assert (=> b!41612 m!35023))

(declare-fun m!35025 () Bool)

(assert (=> b!41614 m!35025))

(declare-fun m!35027 () Bool)

(assert (=> b!41614 m!35027))

(assert (=> b!41614 m!35025))

(declare-fun m!35029 () Bool)

(assert (=> b!41614 m!35029))

(check-sat (not b!41612) tp_is_empty!1807 (not start!5942) (not b_next!1417) (not b_lambda!2141) b_and!2483 (not b!41614) (not b!41611))
(check-sat b_and!2483 (not b_next!1417))
