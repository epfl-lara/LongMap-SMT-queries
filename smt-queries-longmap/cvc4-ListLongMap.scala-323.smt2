; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5924 () Bool)

(assert start!5924)

(declare-fun b_free!1403 () Bool)

(declare-fun b_next!1403 () Bool)

(assert (=> start!5924 (= b_free!1403 (not b_next!1403))))

(declare-fun tp!5792 () Bool)

(declare-fun b_and!2455 () Bool)

(assert (=> start!5924 (= tp!5792 b_and!2455)))

(declare-fun b!41572 () Bool)

(declare-fun res!24726 () Bool)

(declare-fun e!26302 () Bool)

(assert (=> b!41572 (=> res!24726 e!26302)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!41572 (= res!24726 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun res!24729 () Bool)

(declare-fun e!26301 () Bool)

(assert (=> start!5924 (=> (not res!24729) (not e!26301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5924 (= res!24729 (validMask!0 mask!853))))

(assert (=> start!5924 e!26301))

(assert (=> start!5924 true))

(assert (=> start!5924 tp!5792))

(declare-fun b!41573 () Bool)

(assert (=> b!41573 (= e!26302 true)))

(declare-fun lt!16593 () Bool)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2149 0))(
  ( (V!2150 (val!935 Int)) )
))
(declare-datatypes ((ValueCell!649 0))(
  ( (ValueCellFull!649 (v!2019 V!2149)) (EmptyCell!649) )
))
(declare-datatypes ((array!2671 0))(
  ( (array!2672 (arr!1279 (Array (_ BitVec 32) ValueCell!649)) (size!1431 (_ BitVec 32))) )
))
(declare-fun lt!16590 () array!2671)

(declare-datatypes ((array!2673 0))(
  ( (array!2674 (arr!1280 (Array (_ BitVec 32) (_ BitVec 64))) (size!1432 (_ BitVec 32))) )
))
(declare-fun lt!16594 () array!2673)

(declare-datatypes ((tuple2!1524 0))(
  ( (tuple2!1525 (_1!773 (_ BitVec 64)) (_2!773 V!2149)) )
))
(declare-datatypes ((List!1092 0))(
  ( (Nil!1089) (Cons!1088 (h!1665 tuple2!1524) (t!3991 List!1092)) )
))
(declare-datatypes ((ListLongMap!1101 0))(
  ( (ListLongMap!1102 (toList!566 List!1092)) )
))
(declare-fun lt!16588 () ListLongMap!1101)

(declare-fun lt!16591 () V!2149)

(declare-fun contains!534 (ListLongMap!1101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!327 (array!2673 array!2671 (_ BitVec 32) (_ BitVec 32) V!2149 V!2149 (_ BitVec 32) Int) ListLongMap!1101)

(declare-fun head!865 (List!1092) tuple2!1524)

(assert (=> b!41573 (= lt!16593 (contains!534 (getCurrentListMap!327 lt!16594 lt!16590 mask!853 #b00000000000000000000000000000000 lt!16591 lt!16591 #b00000000000000000000000000000000 defaultEntry!470) (_1!773 (head!865 (toList!566 lt!16588)))))))

(declare-fun b!41570 () Bool)

(assert (=> b!41570 (= e!26301 (not e!26302))))

(declare-fun res!24727 () Bool)

(assert (=> b!41570 (=> res!24727 e!26302)))

(assert (=> b!41570 (= res!24727 (= lt!16588 (ListLongMap!1102 Nil!1089)))))

(declare-datatypes ((LongMapFixedSize!278 0))(
  ( (LongMapFixedSize!279 (defaultEntry!1829 Int) (mask!5238 (_ BitVec 32)) (extraKeys!1720 (_ BitVec 32)) (zeroValue!1747 V!2149) (minValue!1747 V!2149) (_size!188 (_ BitVec 32)) (_keys!3336 array!2673) (_values!1812 array!2671) (_vacant!188 (_ BitVec 32))) )
))
(declare-fun map!721 (LongMapFixedSize!278) ListLongMap!1101)

(assert (=> b!41570 (= lt!16588 (map!721 (LongMapFixedSize!279 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16591 lt!16591 #b00000000000000000000000000000000 lt!16594 lt!16590 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1093 0))(
  ( (Nil!1090) (Cons!1089 (h!1666 (_ BitVec 64)) (t!3992 List!1093)) )
))
(declare-fun arrayNoDuplicates!0 (array!2673 (_ BitVec 32) List!1093) Bool)

(assert (=> b!41570 (arrayNoDuplicates!0 lt!16594 #b00000000000000000000000000000000 Nil!1090)))

(declare-datatypes ((Unit!1033 0))(
  ( (Unit!1034) )
))
(declare-fun lt!16595 () Unit!1033)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2673 (_ BitVec 32) (_ BitVec 32) List!1093) Unit!1033)

(assert (=> b!41570 (= lt!16595 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16594 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2673 (_ BitVec 32)) Bool)

(assert (=> b!41570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16594 mask!853)))

(declare-fun lt!16589 () Unit!1033)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2673 (_ BitVec 32) (_ BitVec 32)) Unit!1033)

(assert (=> b!41570 (= lt!16589 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16594 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2673 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41570 (= (arrayCountValidKeys!0 lt!16594 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16592 () Unit!1033)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2673 (_ BitVec 32) (_ BitVec 32)) Unit!1033)

(assert (=> b!41570 (= lt!16592 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16594 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41570 (= lt!16590 (array!2672 ((as const (Array (_ BitVec 32) ValueCell!649)) EmptyCell!649) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41570 (= lt!16594 (array!2674 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!210 (Int (_ BitVec 64)) V!2149)

(assert (=> b!41570 (= lt!16591 (dynLambda!210 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41571 () Bool)

(declare-fun res!24728 () Bool)

(assert (=> b!41571 (=> res!24728 e!26302)))

(declare-fun isEmpty!252 (List!1092) Bool)

(assert (=> b!41571 (= res!24728 (isEmpty!252 (toList!566 lt!16588)))))

(assert (= (and start!5924 res!24729) b!41570))

(assert (= (and b!41570 (not res!24727)) b!41571))

(assert (= (and b!41571 (not res!24728)) b!41572))

(assert (= (and b!41572 (not res!24726)) b!41573))

(declare-fun b_lambda!2127 () Bool)

(assert (=> (not b_lambda!2127) (not b!41570)))

(declare-fun t!3990 () Bool)

(declare-fun tb!885 () Bool)

(assert (=> (and start!5924 (= defaultEntry!470 defaultEntry!470) t!3990) tb!885))

(declare-fun result!1521 () Bool)

(declare-fun tp_is_empty!1793 () Bool)

(assert (=> tb!885 (= result!1521 tp_is_empty!1793)))

(assert (=> b!41570 t!3990))

(declare-fun b_and!2457 () Bool)

(assert (= b_and!2455 (and (=> t!3990 result!1521) b_and!2457)))

(declare-fun m!34949 () Bool)

(assert (=> start!5924 m!34949))

(declare-fun m!34951 () Bool)

(assert (=> b!41573 m!34951))

(declare-fun m!34953 () Bool)

(assert (=> b!41573 m!34953))

(assert (=> b!41573 m!34951))

(declare-fun m!34955 () Bool)

(assert (=> b!41573 m!34955))

(declare-fun m!34957 () Bool)

(assert (=> b!41570 m!34957))

(declare-fun m!34959 () Bool)

(assert (=> b!41570 m!34959))

(declare-fun m!34961 () Bool)

(assert (=> b!41570 m!34961))

(declare-fun m!34963 () Bool)

(assert (=> b!41570 m!34963))

(declare-fun m!34965 () Bool)

(assert (=> b!41570 m!34965))

(declare-fun m!34967 () Bool)

(assert (=> b!41570 m!34967))

(declare-fun m!34969 () Bool)

(assert (=> b!41570 m!34969))

(declare-fun m!34971 () Bool)

(assert (=> b!41570 m!34971))

(declare-fun m!34973 () Bool)

(assert (=> b!41571 m!34973))

(push 1)

(assert (not b!41573))

(assert (not b_next!1403))

(assert (not b!41571))

(assert tp_is_empty!1793)

(assert (not b_lambda!2127))

(assert (not b!41570))

(assert b_and!2457)

(assert (not start!5924))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2457)

(assert (not b_next!1403))

(check-sat)

(pop 1)

