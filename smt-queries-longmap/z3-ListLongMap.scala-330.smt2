; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6036 () Bool)

(assert start!6036)

(declare-fun b_free!1443 () Bool)

(declare-fun b_next!1443 () Bool)

(assert (=> start!6036 (= b_free!1443 (not b_next!1443))))

(declare-fun tp!5852 () Bool)

(declare-fun b_and!2535 () Bool)

(assert (=> start!6036 (= tp!5852 b_and!2535)))

(declare-fun res!25019 () Bool)

(declare-fun e!26553 () Bool)

(assert (=> start!6036 (=> (not res!25019) (not e!26553))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6036 (= res!25019 (validMask!0 mask!853))))

(assert (=> start!6036 e!26553))

(assert (=> start!6036 true))

(assert (=> start!6036 tp!5852))

(declare-fun b!42003 () Bool)

(assert (=> b!42003 (= e!26553 (not true))))

(declare-fun lt!17195 () Bool)

(declare-datatypes ((array!2751 0))(
  ( (array!2752 (arr!1319 (Array (_ BitVec 32) (_ BitVec 64))) (size!1477 (_ BitVec 32))) )
))
(declare-datatypes ((V!2203 0))(
  ( (V!2204 (val!955 Int)) )
))
(declare-datatypes ((ValueCell!669 0))(
  ( (ValueCellFull!669 (v!2039 V!2203)) (EmptyCell!669) )
))
(declare-datatypes ((array!2753 0))(
  ( (array!2754 (arr!1320 (Array (_ BitVec 32) ValueCell!669)) (size!1478 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!318 0))(
  ( (LongMapFixedSize!319 (defaultEntry!1852 Int) (mask!5284 (_ BitVec 32)) (extraKeys!1743 (_ BitVec 32)) (zeroValue!1770 V!2203) (minValue!1770 V!2203) (_size!208 (_ BitVec 32)) (_keys!3365 array!2751) (_values!1835 array!2753) (_vacant!208 (_ BitVec 32))) )
))
(declare-fun lt!17185 () LongMapFixedSize!318)

(declare-fun valid!122 (LongMapFixedSize!318) Bool)

(assert (=> b!42003 (= lt!17195 (valid!122 lt!17185))))

(declare-datatypes ((Unit!1075 0))(
  ( (Unit!1076) )
))
(declare-fun lt!17184 () Unit!1075)

(declare-fun e!26554 () Unit!1075)

(assert (=> b!42003 (= lt!17184 e!26554)))

(declare-fun c!5246 () Bool)

(declare-datatypes ((tuple2!1564 0))(
  ( (tuple2!1565 (_1!793 (_ BitVec 64)) (_2!793 V!2203)) )
))
(declare-datatypes ((List!1132 0))(
  ( (Nil!1129) (Cons!1128 (h!1705 tuple2!1564) (t!4071 List!1132)) )
))
(declare-datatypes ((ListLongMap!1141 0))(
  ( (ListLongMap!1142 (toList!586 List!1132)) )
))
(declare-fun lt!17183 () ListLongMap!1141)

(assert (=> b!42003 (= c!5246 (not (= lt!17183 (ListLongMap!1142 Nil!1129))))))

(declare-fun map!755 (LongMapFixedSize!318) ListLongMap!1141)

(assert (=> b!42003 (= lt!17183 (map!755 lt!17185))))

(declare-fun lt!17186 () array!2751)

(declare-datatypes ((List!1133 0))(
  ( (Nil!1130) (Cons!1129 (h!1706 (_ BitVec 64)) (t!4072 List!1133)) )
))
(declare-fun arrayNoDuplicates!0 (array!2751 (_ BitVec 32) List!1133) Bool)

(assert (=> b!42003 (arrayNoDuplicates!0 lt!17186 #b00000000000000000000000000000000 Nil!1130)))

(declare-fun lt!17192 () Unit!1075)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2751 (_ BitVec 32) (_ BitVec 32) List!1133) Unit!1075)

(assert (=> b!42003 (= lt!17192 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17186 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2751 (_ BitVec 32)) Bool)

(assert (=> b!42003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17186 mask!853)))

(declare-fun lt!17194 () Unit!1075)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2751 (_ BitVec 32) (_ BitVec 32)) Unit!1075)

(assert (=> b!42003 (= lt!17194 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17186 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2751 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42003 (= (arrayCountValidKeys!0 lt!17186 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17190 () Unit!1075)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2751 (_ BitVec 32) (_ BitVec 32)) Unit!1075)

(assert (=> b!42003 (= lt!17190 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17186 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!17189 () array!2753)

(declare-fun lt!17187 () V!2203)

(assert (=> b!42003 (= lt!17185 (LongMapFixedSize!319 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17187 lt!17187 #b00000000000000000000000000000000 lt!17186 lt!17189 #b00000000000000000000000000000000))))

(assert (=> b!42003 (= lt!17189 (array!2754 ((as const (Array (_ BitVec 32) ValueCell!669)) EmptyCell!669) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42003 (= lt!17186 (array!2752 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!230 (Int (_ BitVec 64)) V!2203)

(assert (=> b!42003 (= lt!17187 (dynLambda!230 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42004 () Bool)

(declare-fun Unit!1077 () Unit!1075)

(assert (=> b!42004 (= e!26554 Unit!1077)))

(declare-fun lt!17191 () tuple2!1564)

(declare-fun head!885 (List!1132) tuple2!1564)

(assert (=> b!42004 (= lt!17191 (head!885 (toList!586 lt!17183)))))

(declare-fun lt!17188 () Unit!1075)

(declare-fun lemmaKeyInListMapIsInArray!101 (array!2751 array!2753 (_ BitVec 32) (_ BitVec 32) V!2203 V!2203 (_ BitVec 64) Int) Unit!1075)

(assert (=> b!42004 (= lt!17188 (lemmaKeyInListMapIsInArray!101 lt!17186 lt!17189 mask!853 #b00000000000000000000000000000000 lt!17187 lt!17187 (_1!793 lt!17191) defaultEntry!470))))

(declare-fun res!25020 () Bool)

(assert (=> b!42004 (= res!25020 (and (not (= (_1!793 lt!17191) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!793 lt!17191) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!26552 () Bool)

(assert (=> b!42004 (=> (not res!25020) (not e!26552))))

(assert (=> b!42004 e!26552))

(declare-fun lt!17193 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2751 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42004 (= lt!17193 (arrayScanForKey!0 lt!17186 (_1!793 lt!17191) #b00000000000000000000000000000000))))

(assert (=> b!42004 false))

(declare-fun b!42006 () Bool)

(declare-fun arrayContainsKey!0 (array!2751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42006 (= e!26552 (arrayContainsKey!0 lt!17186 (_1!793 lt!17191) #b00000000000000000000000000000000))))

(declare-fun b!42005 () Bool)

(declare-fun Unit!1078 () Unit!1075)

(assert (=> b!42005 (= e!26554 Unit!1078)))

(assert (= (and start!6036 res!25019) b!42003))

(assert (= (and b!42003 c!5246) b!42004))

(assert (= (and b!42003 (not c!5246)) b!42005))

(assert (= (and b!42004 res!25020) b!42006))

(declare-fun b_lambda!2173 () Bool)

(assert (=> (not b_lambda!2173) (not b!42003)))

(declare-fun t!4070 () Bool)

(declare-fun tb!925 () Bool)

(assert (=> (and start!6036 (= defaultEntry!470 defaultEntry!470) t!4070) tb!925))

(declare-fun result!1601 () Bool)

(declare-fun tp_is_empty!1833 () Bool)

(assert (=> tb!925 (= result!1601 tp_is_empty!1833)))

(assert (=> b!42003 t!4070))

(declare-fun b_and!2537 () Bool)

(assert (= b_and!2535 (and (=> t!4070 result!1601) b_and!2537)))

(declare-fun m!35561 () Bool)

(assert (=> start!6036 m!35561))

(declare-fun m!35563 () Bool)

(assert (=> b!42003 m!35563))

(declare-fun m!35565 () Bool)

(assert (=> b!42003 m!35565))

(declare-fun m!35567 () Bool)

(assert (=> b!42003 m!35567))

(declare-fun m!35569 () Bool)

(assert (=> b!42003 m!35569))

(declare-fun m!35571 () Bool)

(assert (=> b!42003 m!35571))

(declare-fun m!35573 () Bool)

(assert (=> b!42003 m!35573))

(declare-fun m!35575 () Bool)

(assert (=> b!42003 m!35575))

(declare-fun m!35577 () Bool)

(assert (=> b!42003 m!35577))

(declare-fun m!35579 () Bool)

(assert (=> b!42003 m!35579))

(declare-fun m!35581 () Bool)

(assert (=> b!42004 m!35581))

(declare-fun m!35583 () Bool)

(assert (=> b!42004 m!35583))

(declare-fun m!35585 () Bool)

(assert (=> b!42004 m!35585))

(declare-fun m!35587 () Bool)

(assert (=> b!42006 m!35587))

(check-sat b_and!2537 (not b!42003) (not b_lambda!2173) (not b!42004) (not b_next!1443) (not b!42006) (not start!6036) tp_is_empty!1833)
(check-sat b_and!2537 (not b_next!1443))
