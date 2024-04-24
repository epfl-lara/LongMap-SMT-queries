; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5928 () Bool)

(assert start!5928)

(declare-fun b_free!1403 () Bool)

(declare-fun b_next!1403 () Bool)

(assert (=> start!5928 (= b_free!1403 (not b_next!1403))))

(declare-fun tp!5792 () Bool)

(declare-fun b_and!2453 () Bool)

(assert (=> start!5928 (= tp!5792 b_and!2453)))

(declare-fun b!41513 () Bool)

(declare-fun e!26264 () Bool)

(declare-fun e!26265 () Bool)

(assert (=> b!41513 (= e!26264 (not e!26265))))

(declare-fun res!24704 () Bool)

(assert (=> b!41513 (=> res!24704 e!26265)))

(declare-datatypes ((V!2149 0))(
  ( (V!2150 (val!935 Int)) )
))
(declare-datatypes ((tuple2!1506 0))(
  ( (tuple2!1507 (_1!764 (_ BitVec 64)) (_2!764 V!2149)) )
))
(declare-datatypes ((List!1078 0))(
  ( (Nil!1075) (Cons!1074 (h!1651 tuple2!1506) (t!3977 List!1078)) )
))
(declare-datatypes ((ListLongMap!1077 0))(
  ( (ListLongMap!1078 (toList!554 List!1078)) )
))
(declare-fun lt!16547 () ListLongMap!1077)

(assert (=> b!41513 (= res!24704 (= lt!16547 (ListLongMap!1078 Nil!1075)))))

(declare-datatypes ((array!2657 0))(
  ( (array!2658 (arr!1272 (Array (_ BitVec 32) (_ BitVec 64))) (size!1424 (_ BitVec 32))) )
))
(declare-fun lt!16550 () array!2657)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun lt!16549 () V!2149)

(declare-datatypes ((ValueCell!649 0))(
  ( (ValueCellFull!649 (v!2020 V!2149)) (EmptyCell!649) )
))
(declare-datatypes ((array!2659 0))(
  ( (array!2660 (arr!1273 (Array (_ BitVec 32) ValueCell!649)) (size!1425 (_ BitVec 32))) )
))
(declare-fun lt!16545 () array!2659)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((LongMapFixedSize!278 0))(
  ( (LongMapFixedSize!279 (defaultEntry!1829 Int) (mask!5238 (_ BitVec 32)) (extraKeys!1720 (_ BitVec 32)) (zeroValue!1747 V!2149) (minValue!1747 V!2149) (_size!188 (_ BitVec 32)) (_keys!3336 array!2657) (_values!1812 array!2659) (_vacant!188 (_ BitVec 32))) )
))
(declare-fun map!721 (LongMapFixedSize!278) ListLongMap!1077)

(assert (=> b!41513 (= lt!16547 (map!721 (LongMapFixedSize!279 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16549 lt!16549 #b00000000000000000000000000000000 lt!16550 lt!16545 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1079 0))(
  ( (Nil!1076) (Cons!1075 (h!1652 (_ BitVec 64)) (t!3978 List!1079)) )
))
(declare-fun arrayNoDuplicates!0 (array!2657 (_ BitVec 32) List!1079) Bool)

(assert (=> b!41513 (arrayNoDuplicates!0 lt!16550 #b00000000000000000000000000000000 Nil!1076)))

(declare-datatypes ((Unit!1045 0))(
  ( (Unit!1046) )
))
(declare-fun lt!16552 () Unit!1045)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2657 (_ BitVec 32) (_ BitVec 32) List!1079) Unit!1045)

(assert (=> b!41513 (= lt!16552 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16550 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2657 (_ BitVec 32)) Bool)

(assert (=> b!41513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16550 mask!853)))

(declare-fun lt!16546 () Unit!1045)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2657 (_ BitVec 32) (_ BitVec 32)) Unit!1045)

(assert (=> b!41513 (= lt!16546 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16550 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2657 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41513 (= (arrayCountValidKeys!0 lt!16550 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16548 () Unit!1045)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2657 (_ BitVec 32) (_ BitVec 32)) Unit!1045)

(assert (=> b!41513 (= lt!16548 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16550 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41513 (= lt!16545 (array!2660 ((as const (Array (_ BitVec 32) ValueCell!649)) EmptyCell!649) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41513 (= lt!16550 (array!2658 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!206 (Int (_ BitVec 64)) V!2149)

(assert (=> b!41513 (= lt!16549 (dynLambda!206 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41515 () Bool)

(declare-fun res!24701 () Bool)

(assert (=> b!41515 (=> res!24701 e!26265)))

(assert (=> b!41515 (= res!24701 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41516 () Bool)

(assert (=> b!41516 (= e!26265 true)))

(declare-fun lt!16551 () Bool)

(declare-fun contains!525 (ListLongMap!1077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!311 (array!2657 array!2659 (_ BitVec 32) (_ BitVec 32) V!2149 V!2149 (_ BitVec 32) Int) ListLongMap!1077)

(declare-fun head!863 (List!1078) tuple2!1506)

(assert (=> b!41516 (= lt!16551 (contains!525 (getCurrentListMap!311 lt!16550 lt!16545 mask!853 #b00000000000000000000000000000000 lt!16549 lt!16549 #b00000000000000000000000000000000 defaultEntry!470) (_1!764 (head!863 (toList!554 lt!16547)))))))

(declare-fun b!41514 () Bool)

(declare-fun res!24702 () Bool)

(assert (=> b!41514 (=> res!24702 e!26265)))

(declare-fun isEmpty!256 (List!1078) Bool)

(assert (=> b!41514 (= res!24702 (isEmpty!256 (toList!554 lt!16547)))))

(declare-fun res!24703 () Bool)

(assert (=> start!5928 (=> (not res!24703) (not e!26264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5928 (= res!24703 (validMask!0 mask!853))))

(assert (=> start!5928 e!26264))

(assert (=> start!5928 true))

(assert (=> start!5928 tp!5792))

(assert (= (and start!5928 res!24703) b!41513))

(assert (= (and b!41513 (not res!24704)) b!41514))

(assert (= (and b!41514 (not res!24702)) b!41515))

(assert (= (and b!41515 (not res!24701)) b!41516))

(declare-fun b_lambda!2127 () Bool)

(assert (=> (not b_lambda!2127) (not b!41513)))

(declare-fun t!3976 () Bool)

(declare-fun tb!885 () Bool)

(assert (=> (and start!5928 (= defaultEntry!470 defaultEntry!470) t!3976) tb!885))

(declare-fun result!1521 () Bool)

(declare-fun tp_is_empty!1793 () Bool)

(assert (=> tb!885 (= result!1521 tp_is_empty!1793)))

(assert (=> b!41513 t!3976))

(declare-fun b_and!2455 () Bool)

(assert (= b_and!2453 (and (=> t!3976 result!1521) b_and!2455)))

(declare-fun m!34823 () Bool)

(assert (=> b!41513 m!34823))

(declare-fun m!34825 () Bool)

(assert (=> b!41513 m!34825))

(declare-fun m!34827 () Bool)

(assert (=> b!41513 m!34827))

(declare-fun m!34829 () Bool)

(assert (=> b!41513 m!34829))

(declare-fun m!34831 () Bool)

(assert (=> b!41513 m!34831))

(declare-fun m!34833 () Bool)

(assert (=> b!41513 m!34833))

(declare-fun m!34835 () Bool)

(assert (=> b!41513 m!34835))

(declare-fun m!34837 () Bool)

(assert (=> b!41513 m!34837))

(declare-fun m!34839 () Bool)

(assert (=> b!41516 m!34839))

(declare-fun m!34841 () Bool)

(assert (=> b!41516 m!34841))

(assert (=> b!41516 m!34839))

(declare-fun m!34843 () Bool)

(assert (=> b!41516 m!34843))

(declare-fun m!34845 () Bool)

(assert (=> b!41514 m!34845))

(declare-fun m!34847 () Bool)

(assert (=> start!5928 m!34847))

(push 1)

(assert tp_is_empty!1793)

(assert (not b!41513))

(assert (not start!5928))

(assert (not b_lambda!2127))

(assert (not b_next!1403))

(assert (not b!41514))

(assert b_and!2455)

(assert (not b!41516))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2455)

(assert (not b_next!1403))

(check-sat)

(pop 1)

