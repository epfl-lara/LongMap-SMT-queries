; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5934 () Bool)

(assert start!5934)

(declare-fun b_free!1413 () Bool)

(declare-fun b_next!1413 () Bool)

(assert (=> start!5934 (= b_free!1413 (not b_next!1413))))

(declare-fun tp!5807 () Bool)

(declare-fun b_and!2475 () Bool)

(assert (=> start!5934 (= tp!5807 b_and!2475)))

(declare-fun b!41643 () Bool)

(declare-fun e!26331 () Bool)

(assert (=> b!41643 (= e!26331 true)))

(declare-datatypes ((V!2163 0))(
  ( (V!2164 (val!940 Int)) )
))
(declare-datatypes ((ValueCell!654 0))(
  ( (ValueCellFull!654 (v!2024 V!2163)) (EmptyCell!654) )
))
(declare-datatypes ((array!2691 0))(
  ( (array!2692 (arr!1289 (Array (_ BitVec 32) ValueCell!654)) (size!1441 (_ BitVec 32))) )
))
(declare-fun lt!16715 () array!2691)

(declare-datatypes ((array!2693 0))(
  ( (array!2694 (arr!1290 (Array (_ BitVec 32) (_ BitVec 64))) (size!1442 (_ BitVec 32))) )
))
(declare-fun lt!16714 () array!2693)

(declare-fun lt!16708 () V!2163)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1534 0))(
  ( (tuple2!1535 (_1!778 (_ BitVec 64)) (_2!778 V!2163)) )
))
(declare-datatypes ((List!1102 0))(
  ( (Nil!1099) (Cons!1098 (h!1675 tuple2!1534) (t!4011 List!1102)) )
))
(declare-datatypes ((ListLongMap!1111 0))(
  ( (ListLongMap!1112 (toList!571 List!1102)) )
))
(declare-fun lt!16710 () ListLongMap!1111)

(declare-fun lt!16713 () Bool)

(declare-fun contains!539 (ListLongMap!1111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!332 (array!2693 array!2691 (_ BitVec 32) (_ BitVec 32) V!2163 V!2163 (_ BitVec 32) Int) ListLongMap!1111)

(declare-fun head!870 (List!1102) tuple2!1534)

(assert (=> b!41643 (= lt!16713 (contains!539 (getCurrentListMap!332 lt!16714 lt!16715 mask!853 #b00000000000000000000000000000000 lt!16708 lt!16708 #b00000000000000000000000000000000 defaultEntry!470) (_1!778 (head!870 (toList!571 lt!16710)))))))

(declare-fun b!41642 () Bool)

(declare-fun res!24786 () Bool)

(assert (=> b!41642 (=> res!24786 e!26331)))

(assert (=> b!41642 (= res!24786 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun res!24788 () Bool)

(declare-fun e!26332 () Bool)

(assert (=> start!5934 (=> (not res!24788) (not e!26332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5934 (= res!24788 (validMask!0 mask!853))))

(assert (=> start!5934 e!26332))

(assert (=> start!5934 true))

(assert (=> start!5934 tp!5807))

(declare-fun b!41641 () Bool)

(declare-fun res!24789 () Bool)

(assert (=> b!41641 (=> res!24789 e!26331)))

(declare-fun isEmpty!257 (List!1102) Bool)

(assert (=> b!41641 (= res!24789 (isEmpty!257 (toList!571 lt!16710)))))

(declare-fun b!41640 () Bool)

(assert (=> b!41640 (= e!26332 (not e!26331))))

(declare-fun res!24787 () Bool)

(assert (=> b!41640 (=> res!24787 e!26331)))

(assert (=> b!41640 (= res!24787 (= lt!16710 (ListLongMap!1112 Nil!1099)))))

(declare-datatypes ((LongMapFixedSize!288 0))(
  ( (LongMapFixedSize!289 (defaultEntry!1834 Int) (mask!5247 (_ BitVec 32)) (extraKeys!1725 (_ BitVec 32)) (zeroValue!1752 V!2163) (minValue!1752 V!2163) (_size!193 (_ BitVec 32)) (_keys!3341 array!2693) (_values!1817 array!2691) (_vacant!193 (_ BitVec 32))) )
))
(declare-fun map!730 (LongMapFixedSize!288) ListLongMap!1111)

(assert (=> b!41640 (= lt!16710 (map!730 (LongMapFixedSize!289 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16708 lt!16708 #b00000000000000000000000000000000 lt!16714 lt!16715 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1103 0))(
  ( (Nil!1100) (Cons!1099 (h!1676 (_ BitVec 64)) (t!4012 List!1103)) )
))
(declare-fun arrayNoDuplicates!0 (array!2693 (_ BitVec 32) List!1103) Bool)

(assert (=> b!41640 (arrayNoDuplicates!0 lt!16714 #b00000000000000000000000000000000 Nil!1100)))

(declare-datatypes ((Unit!1043 0))(
  ( (Unit!1044) )
))
(declare-fun lt!16711 () Unit!1043)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2693 (_ BitVec 32) (_ BitVec 32) List!1103) Unit!1043)

(assert (=> b!41640 (= lt!16711 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16714 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2693 (_ BitVec 32)) Bool)

(assert (=> b!41640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16714 mask!853)))

(declare-fun lt!16709 () Unit!1043)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2693 (_ BitVec 32) (_ BitVec 32)) Unit!1043)

(assert (=> b!41640 (= lt!16709 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16714 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2693 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41640 (= (arrayCountValidKeys!0 lt!16714 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16712 () Unit!1043)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2693 (_ BitVec 32) (_ BitVec 32)) Unit!1043)

(assert (=> b!41640 (= lt!16712 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16714 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41640 (= lt!16715 (array!2692 ((as const (Array (_ BitVec 32) ValueCell!654)) EmptyCell!654) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41640 (= lt!16714 (array!2694 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!215 (Int (_ BitVec 64)) V!2163)

(assert (=> b!41640 (= lt!16708 (dynLambda!215 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5934 res!24788) b!41640))

(assert (= (and b!41640 (not res!24787)) b!41641))

(assert (= (and b!41641 (not res!24789)) b!41642))

(assert (= (and b!41642 (not res!24786)) b!41643))

(declare-fun b_lambda!2137 () Bool)

(assert (=> (not b_lambda!2137) (not b!41640)))

(declare-fun t!4010 () Bool)

(declare-fun tb!895 () Bool)

(assert (=> (and start!5934 (= defaultEntry!470 defaultEntry!470) t!4010) tb!895))

(declare-fun result!1541 () Bool)

(declare-fun tp_is_empty!1803 () Bool)

(assert (=> tb!895 (= result!1541 tp_is_empty!1803)))

(assert (=> b!41640 t!4010))

(declare-fun b_and!2477 () Bool)

(assert (= b_and!2475 (and (=> t!4010 result!1541) b_and!2477)))

(declare-fun m!35079 () Bool)

(assert (=> b!41643 m!35079))

(declare-fun m!35081 () Bool)

(assert (=> b!41643 m!35081))

(assert (=> b!41643 m!35079))

(declare-fun m!35083 () Bool)

(assert (=> b!41643 m!35083))

(declare-fun m!35085 () Bool)

(assert (=> start!5934 m!35085))

(declare-fun m!35087 () Bool)

(assert (=> b!41641 m!35087))

(declare-fun m!35089 () Bool)

(assert (=> b!41640 m!35089))

(declare-fun m!35091 () Bool)

(assert (=> b!41640 m!35091))

(declare-fun m!35093 () Bool)

(assert (=> b!41640 m!35093))

(declare-fun m!35095 () Bool)

(assert (=> b!41640 m!35095))

(declare-fun m!35097 () Bool)

(assert (=> b!41640 m!35097))

(declare-fun m!35099 () Bool)

(assert (=> b!41640 m!35099))

(declare-fun m!35101 () Bool)

(assert (=> b!41640 m!35101))

(declare-fun m!35103 () Bool)

(assert (=> b!41640 m!35103))

(check-sat tp_is_empty!1803 (not b_next!1413) (not b!41643) (not b!41640) (not b_lambda!2137) b_and!2477 (not b!41641) (not start!5934))
(check-sat b_and!2477 (not b_next!1413))
