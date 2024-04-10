; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6038 () Bool)

(assert start!6038)

(declare-fun b_free!1445 () Bool)

(declare-fun b_next!1445 () Bool)

(assert (=> start!6038 (= b_free!1445 (not b_next!1445))))

(declare-fun tp!5855 () Bool)

(declare-fun b_and!2539 () Bool)

(assert (=> start!6038 (= tp!5855 b_and!2539)))

(declare-fun b!42019 () Bool)

(declare-datatypes ((Unit!1079 0))(
  ( (Unit!1080) )
))
(declare-fun e!26562 () Unit!1079)

(declare-fun Unit!1081 () Unit!1079)

(assert (=> b!42019 (= e!26562 Unit!1081)))

(declare-fun b!42018 () Bool)

(declare-fun Unit!1082 () Unit!1079)

(assert (=> b!42018 (= e!26562 Unit!1082)))

(declare-datatypes ((V!2205 0))(
  ( (V!2206 (val!956 Int)) )
))
(declare-datatypes ((tuple2!1566 0))(
  ( (tuple2!1567 (_1!794 (_ BitVec 64)) (_2!794 V!2205)) )
))
(declare-fun lt!17226 () tuple2!1566)

(declare-datatypes ((List!1134 0))(
  ( (Nil!1131) (Cons!1130 (h!1707 tuple2!1566) (t!4075 List!1134)) )
))
(declare-datatypes ((ListLongMap!1143 0))(
  ( (ListLongMap!1144 (toList!587 List!1134)) )
))
(declare-fun lt!17234 () ListLongMap!1143)

(declare-fun head!886 (List!1134) tuple2!1566)

(assert (=> b!42018 (= lt!17226 (head!886 (toList!587 lt!17234)))))

(declare-datatypes ((ValueCell!670 0))(
  ( (ValueCellFull!670 (v!2040 V!2205)) (EmptyCell!670) )
))
(declare-datatypes ((array!2755 0))(
  ( (array!2756 (arr!1321 (Array (_ BitVec 32) ValueCell!670)) (size!1479 (_ BitVec 32))) )
))
(declare-fun lt!17231 () array!2755)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!17227 () V!2205)

(declare-fun lt!17224 () Unit!1079)

(declare-datatypes ((array!2757 0))(
  ( (array!2758 (arr!1322 (Array (_ BitVec 32) (_ BitVec 64))) (size!1480 (_ BitVec 32))) )
))
(declare-fun lt!17222 () array!2757)

(declare-fun lemmaKeyInListMapIsInArray!102 (array!2757 array!2755 (_ BitVec 32) (_ BitVec 32) V!2205 V!2205 (_ BitVec 64) Int) Unit!1079)

(assert (=> b!42018 (= lt!17224 (lemmaKeyInListMapIsInArray!102 lt!17222 lt!17231 mask!853 #b00000000000000000000000000000000 lt!17227 lt!17227 (_1!794 lt!17226) defaultEntry!470))))

(declare-fun res!25025 () Bool)

(assert (=> b!42018 (= res!25025 (and (not (= (_1!794 lt!17226) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!794 lt!17226) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!26561 () Bool)

(assert (=> b!42018 (=> (not res!25025) (not e!26561))))

(assert (=> b!42018 e!26561))

(declare-fun lt!17223 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2757 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42018 (= lt!17223 (arrayScanForKey!0 lt!17222 (_1!794 lt!17226) #b00000000000000000000000000000000))))

(assert (=> b!42018 false))

(declare-fun b!42017 () Bool)

(declare-fun e!26563 () Bool)

(assert (=> b!42017 (= e!26563 (not true))))

(declare-fun lt!17233 () Bool)

(declare-datatypes ((LongMapFixedSize!320 0))(
  ( (LongMapFixedSize!321 (defaultEntry!1853 Int) (mask!5285 (_ BitVec 32)) (extraKeys!1744 (_ BitVec 32)) (zeroValue!1771 V!2205) (minValue!1771 V!2205) (_size!209 (_ BitVec 32)) (_keys!3366 array!2757) (_values!1836 array!2755) (_vacant!209 (_ BitVec 32))) )
))
(declare-fun lt!17229 () LongMapFixedSize!320)

(declare-fun valid!123 (LongMapFixedSize!320) Bool)

(assert (=> b!42017 (= lt!17233 (valid!123 lt!17229))))

(declare-fun lt!17230 () Unit!1079)

(assert (=> b!42017 (= lt!17230 e!26562)))

(declare-fun c!5249 () Bool)

(assert (=> b!42017 (= c!5249 (not (= lt!17234 (ListLongMap!1144 Nil!1131))))))

(declare-fun map!756 (LongMapFixedSize!320) ListLongMap!1143)

(assert (=> b!42017 (= lt!17234 (map!756 lt!17229))))

(declare-datatypes ((List!1135 0))(
  ( (Nil!1132) (Cons!1131 (h!1708 (_ BitVec 64)) (t!4076 List!1135)) )
))
(declare-fun arrayNoDuplicates!0 (array!2757 (_ BitVec 32) List!1135) Bool)

(assert (=> b!42017 (arrayNoDuplicates!0 lt!17222 #b00000000000000000000000000000000 Nil!1132)))

(declare-fun lt!17225 () Unit!1079)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2757 (_ BitVec 32) (_ BitVec 32) List!1135) Unit!1079)

(assert (=> b!42017 (= lt!17225 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17222 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2757 (_ BitVec 32)) Bool)

(assert (=> b!42017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17222 mask!853)))

(declare-fun lt!17232 () Unit!1079)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2757 (_ BitVec 32) (_ BitVec 32)) Unit!1079)

(assert (=> b!42017 (= lt!17232 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17222 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2757 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42017 (= (arrayCountValidKeys!0 lt!17222 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17228 () Unit!1079)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2757 (_ BitVec 32) (_ BitVec 32)) Unit!1079)

(assert (=> b!42017 (= lt!17228 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17222 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42017 (= lt!17229 (LongMapFixedSize!321 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17227 lt!17227 #b00000000000000000000000000000000 lt!17222 lt!17231 #b00000000000000000000000000000000))))

(assert (=> b!42017 (= lt!17231 (array!2756 ((as const (Array (_ BitVec 32) ValueCell!670)) EmptyCell!670) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42017 (= lt!17222 (array!2758 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!231 (Int (_ BitVec 64)) V!2205)

(assert (=> b!42017 (= lt!17227 (dynLambda!231 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!25026 () Bool)

(assert (=> start!6038 (=> (not res!25026) (not e!26563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6038 (= res!25026 (validMask!0 mask!853))))

(assert (=> start!6038 e!26563))

(assert (=> start!6038 true))

(assert (=> start!6038 tp!5855))

(declare-fun b!42020 () Bool)

(declare-fun arrayContainsKey!0 (array!2757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42020 (= e!26561 (arrayContainsKey!0 lt!17222 (_1!794 lt!17226) #b00000000000000000000000000000000))))

(assert (= (and start!6038 res!25026) b!42017))

(assert (= (and b!42017 c!5249) b!42018))

(assert (= (and b!42017 (not c!5249)) b!42019))

(assert (= (and b!42018 res!25025) b!42020))

(declare-fun b_lambda!2175 () Bool)

(assert (=> (not b_lambda!2175) (not b!42017)))

(declare-fun t!4074 () Bool)

(declare-fun tb!927 () Bool)

(assert (=> (and start!6038 (= defaultEntry!470 defaultEntry!470) t!4074) tb!927))

(declare-fun result!1605 () Bool)

(declare-fun tp_is_empty!1835 () Bool)

(assert (=> tb!927 (= result!1605 tp_is_empty!1835)))

(assert (=> b!42017 t!4074))

(declare-fun b_and!2541 () Bool)

(assert (= b_and!2539 (and (=> t!4074 result!1605) b_and!2541)))

(declare-fun m!35589 () Bool)

(assert (=> b!42018 m!35589))

(declare-fun m!35591 () Bool)

(assert (=> b!42018 m!35591))

(declare-fun m!35593 () Bool)

(assert (=> b!42018 m!35593))

(declare-fun m!35595 () Bool)

(assert (=> b!42017 m!35595))

(declare-fun m!35597 () Bool)

(assert (=> b!42017 m!35597))

(declare-fun m!35599 () Bool)

(assert (=> b!42017 m!35599))

(declare-fun m!35601 () Bool)

(assert (=> b!42017 m!35601))

(declare-fun m!35603 () Bool)

(assert (=> b!42017 m!35603))

(declare-fun m!35605 () Bool)

(assert (=> b!42017 m!35605))

(declare-fun m!35607 () Bool)

(assert (=> b!42017 m!35607))

(declare-fun m!35609 () Bool)

(assert (=> b!42017 m!35609))

(declare-fun m!35611 () Bool)

(assert (=> b!42017 m!35611))

(declare-fun m!35613 () Bool)

(assert (=> start!6038 m!35613))

(declare-fun m!35615 () Bool)

(assert (=> b!42020 m!35615))

(push 1)

(assert (not b_lambda!2175))

(assert b_and!2541)

(assert (not b!42017))

(assert (not b!42018))

(assert (not b_next!1445))

(assert tp_is_empty!1835)

(assert (not start!6038))

(assert (not b!42020))

(check-sat)

