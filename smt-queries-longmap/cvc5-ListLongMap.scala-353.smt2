; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6460 () Bool)

(assert start!6460)

(declare-fun b_free!1495 () Bool)

(declare-fun b_next!1495 () Bool)

(assert (=> start!6460 (= b_free!1495 (not b_next!1495))))

(declare-fun tp!5930 () Bool)

(declare-fun b_and!2639 () Bool)

(assert (=> start!6460 (= tp!5930 b_and!2639)))

(declare-fun res!25527 () Bool)

(declare-fun e!27235 () Bool)

(assert (=> start!6460 (=> (not res!25527) (not e!27235))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6460 (= res!25527 (validMask!0 mask!853))))

(assert (=> start!6460 e!27235))

(assert (=> start!6460 true))

(assert (=> start!6460 tp!5930))

(declare-fun b!42967 () Bool)

(assert (=> b!42967 (= e!27235 (not true))))

(declare-datatypes ((array!2915 0))(
  ( (array!2916 (arr!1401 (Array (_ BitVec 32) (_ BitVec 64))) (size!1586 (_ BitVec 32))) )
))
(declare-fun lt!18298 () array!2915)

(declare-datatypes ((V!2301 0))(
  ( (V!2302 (val!981 Int)) )
))
(declare-datatypes ((tuple2!1616 0))(
  ( (tuple2!1617 (_1!819 (_ BitVec 64)) (_2!819 V!2301)) )
))
(declare-datatypes ((List!1190 0))(
  ( (Nil!1187) (Cons!1186 (h!1763 tuple2!1616) (t!4181 List!1190)) )
))
(declare-datatypes ((ListLongMap!1193 0))(
  ( (ListLongMap!1194 (toList!612 List!1190)) )
))
(declare-fun lt!18301 () ListLongMap!1193)

(declare-fun lt!18302 () V!2301)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!695 0))(
  ( (ValueCellFull!695 (v!2071 V!2301)) (EmptyCell!695) )
))
(declare-datatypes ((array!2917 0))(
  ( (array!2918 (arr!1402 (Array (_ BitVec 32) ValueCell!695)) (size!1587 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!370 0))(
  ( (LongMapFixedSize!371 (defaultEntry!1878 Int) (mask!5425 (_ BitVec 32)) (extraKeys!1769 (_ BitVec 32)) (zeroValue!1796 V!2301) (minValue!1796 V!2301) (_size!234 (_ BitVec 32)) (_keys!3427 array!2915) (_values!1861 array!2917) (_vacant!234 (_ BitVec 32))) )
))
(declare-fun map!827 (LongMapFixedSize!370) ListLongMap!1193)

(assert (=> b!42967 (= lt!18301 (map!827 (LongMapFixedSize!371 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18302 lt!18302 #b00000000000000000000000000000000 lt!18298 (array!2918 ((as const (Array (_ BitVec 32) ValueCell!695)) EmptyCell!695) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1191 0))(
  ( (Nil!1188) (Cons!1187 (h!1764 (_ BitVec 64)) (t!4182 List!1191)) )
))
(declare-fun arrayNoDuplicates!0 (array!2915 (_ BitVec 32) List!1191) Bool)

(assert (=> b!42967 (arrayNoDuplicates!0 lt!18298 #b00000000000000000000000000000000 Nil!1188)))

(declare-datatypes ((Unit!1191 0))(
  ( (Unit!1192) )
))
(declare-fun lt!18299 () Unit!1191)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2915 (_ BitVec 32) (_ BitVec 32) List!1191) Unit!1191)

(assert (=> b!42967 (= lt!18299 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18298 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2915 (_ BitVec 32)) Bool)

(assert (=> b!42967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18298 mask!853)))

(declare-fun lt!18300 () Unit!1191)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2915 (_ BitVec 32) (_ BitVec 32)) Unit!1191)

(assert (=> b!42967 (= lt!18300 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18298 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2915 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42967 (= (arrayCountValidKeys!0 lt!18298 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18297 () Unit!1191)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2915 (_ BitVec 32) (_ BitVec 32)) Unit!1191)

(assert (=> b!42967 (= lt!18297 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18298 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42967 (= lt!18298 (array!2916 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!256 (Int (_ BitVec 64)) V!2301)

(assert (=> b!42967 (= lt!18302 (dynLambda!256 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6460 res!25527) b!42967))

(declare-fun b_lambda!2237 () Bool)

(assert (=> (not b_lambda!2237) (not b!42967)))

(declare-fun t!4180 () Bool)

(declare-fun tb!977 () Bool)

(assert (=> (and start!6460 (= defaultEntry!470 defaultEntry!470) t!4180) tb!977))

(declare-fun result!1705 () Bool)

(declare-fun tp_is_empty!1885 () Bool)

(assert (=> tb!977 (= result!1705 tp_is_empty!1885)))

(assert (=> b!42967 t!4180))

(declare-fun b_and!2641 () Bool)

(assert (= b_and!2639 (and (=> t!4180 result!1705) b_and!2641)))

(declare-fun m!36833 () Bool)

(assert (=> start!6460 m!36833))

(declare-fun m!36835 () Bool)

(assert (=> b!42967 m!36835))

(declare-fun m!36837 () Bool)

(assert (=> b!42967 m!36837))

(declare-fun m!36839 () Bool)

(assert (=> b!42967 m!36839))

(declare-fun m!36841 () Bool)

(assert (=> b!42967 m!36841))

(declare-fun m!36843 () Bool)

(assert (=> b!42967 m!36843))

(declare-fun m!36845 () Bool)

(assert (=> b!42967 m!36845))

(declare-fun m!36847 () Bool)

(assert (=> b!42967 m!36847))

(declare-fun m!36849 () Bool)

(assert (=> b!42967 m!36849))

(push 1)

(assert (not b!42967))

(assert b_and!2641)

(assert (not b_next!1495))

(assert (not start!6460))

(assert tp_is_empty!1885)

(assert (not b_lambda!2237))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2641)

(assert (not b_next!1495))

(check-sat)

(pop 1)

