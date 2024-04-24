; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6452 () Bool)

(assert start!6452)

(declare-fun b_free!1483 () Bool)

(declare-fun b_next!1483 () Bool)

(assert (=> start!6452 (= b_free!1483 (not b_next!1483))))

(declare-fun tp!5912 () Bool)

(declare-fun b_and!2613 () Bool)

(assert (=> start!6452 (= tp!5912 b_and!2613)))

(declare-fun res!25484 () Bool)

(declare-fun e!27180 () Bool)

(assert (=> start!6452 (=> (not res!25484) (not e!27180))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6452 (= res!25484 (validMask!0 mask!853))))

(assert (=> start!6452 e!27180))

(assert (=> start!6452 true))

(assert (=> start!6452 tp!5912))

(declare-fun b!42880 () Bool)

(assert (=> b!42880 (= e!27180 (not true))))

(declare-datatypes ((array!2877 0))(
  ( (array!2878 (arr!1382 (Array (_ BitVec 32) (_ BitVec 64))) (size!1567 (_ BitVec 32))) )
))
(declare-fun lt!18151 () array!2877)

(declare-datatypes ((V!2285 0))(
  ( (V!2286 (val!975 Int)) )
))
(declare-fun lt!18148 () V!2285)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1586 0))(
  ( (tuple2!1587 (_1!804 (_ BitVec 64)) (_2!804 V!2285)) )
))
(declare-datatypes ((List!1164 0))(
  ( (Nil!1161) (Cons!1160 (h!1737 tuple2!1586) (t!4143 List!1164)) )
))
(declare-datatypes ((ListLongMap!1157 0))(
  ( (ListLongMap!1158 (toList!594 List!1164)) )
))
(declare-fun lt!18150 () ListLongMap!1157)

(declare-datatypes ((ValueCell!689 0))(
  ( (ValueCellFull!689 (v!2066 V!2285)) (EmptyCell!689) )
))
(declare-datatypes ((array!2879 0))(
  ( (array!2880 (arr!1383 (Array (_ BitVec 32) ValueCell!689)) (size!1568 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!358 0))(
  ( (LongMapFixedSize!359 (defaultEntry!1872 Int) (mask!5415 (_ BitVec 32)) (extraKeys!1763 (_ BitVec 32)) (zeroValue!1790 V!2285) (minValue!1790 V!2285) (_size!228 (_ BitVec 32)) (_keys!3421 array!2877) (_values!1855 array!2879) (_vacant!228 (_ BitVec 32))) )
))
(declare-fun map!817 (LongMapFixedSize!358) ListLongMap!1157)

(assert (=> b!42880 (= lt!18150 (map!817 (LongMapFixedSize!359 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18148 lt!18148 #b00000000000000000000000000000000 lt!18151 (array!2880 ((as const (Array (_ BitVec 32) ValueCell!689)) EmptyCell!689) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1165 0))(
  ( (Nil!1162) (Cons!1161 (h!1738 (_ BitVec 64)) (t!4144 List!1165)) )
))
(declare-fun arrayNoDuplicates!0 (array!2877 (_ BitVec 32) List!1165) Bool)

(assert (=> b!42880 (arrayNoDuplicates!0 lt!18151 #b00000000000000000000000000000000 Nil!1162)))

(declare-datatypes ((Unit!1191 0))(
  ( (Unit!1192) )
))
(declare-fun lt!18147 () Unit!1191)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2877 (_ BitVec 32) (_ BitVec 32) List!1165) Unit!1191)

(assert (=> b!42880 (= lt!18147 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18151 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2877 (_ BitVec 32)) Bool)

(assert (=> b!42880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18151 mask!853)))

(declare-fun lt!18146 () Unit!1191)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2877 (_ BitVec 32) (_ BitVec 32)) Unit!1191)

(assert (=> b!42880 (= lt!18146 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18151 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2877 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42880 (= (arrayCountValidKeys!0 lt!18151 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18149 () Unit!1191)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2877 (_ BitVec 32) (_ BitVec 32)) Unit!1191)

(assert (=> b!42880 (= lt!18149 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18151 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42880 (= lt!18151 (array!2878 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!246 (Int (_ BitVec 64)) V!2285)

(assert (=> b!42880 (= lt!18148 (dynLambda!246 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6452 res!25484) b!42880))

(declare-fun b_lambda!2225 () Bool)

(assert (=> (not b_lambda!2225) (not b!42880)))

(declare-fun t!4142 () Bool)

(declare-fun tb!965 () Bool)

(assert (=> (and start!6452 (= defaultEntry!470 defaultEntry!470) t!4142) tb!965))

(declare-fun result!1681 () Bool)

(declare-fun tp_is_empty!1873 () Bool)

(assert (=> tb!965 (= result!1681 tp_is_empty!1873)))

(assert (=> b!42880 t!4142))

(declare-fun b_and!2615 () Bool)

(assert (= b_and!2613 (and (=> t!4142 result!1681) b_and!2615)))

(declare-fun m!36601 () Bool)

(assert (=> start!6452 m!36601))

(declare-fun m!36603 () Bool)

(assert (=> b!42880 m!36603))

(declare-fun m!36605 () Bool)

(assert (=> b!42880 m!36605))

(declare-fun m!36607 () Bool)

(assert (=> b!42880 m!36607))

(declare-fun m!36609 () Bool)

(assert (=> b!42880 m!36609))

(declare-fun m!36611 () Bool)

(assert (=> b!42880 m!36611))

(declare-fun m!36613 () Bool)

(assert (=> b!42880 m!36613))

(declare-fun m!36615 () Bool)

(assert (=> b!42880 m!36615))

(declare-fun m!36617 () Bool)

(assert (=> b!42880 m!36617))

(check-sat (not start!6452) b_and!2615 (not b_next!1483) (not b_lambda!2225) (not b!42880) tp_is_empty!1873)
(check-sat b_and!2615 (not b_next!1483))
