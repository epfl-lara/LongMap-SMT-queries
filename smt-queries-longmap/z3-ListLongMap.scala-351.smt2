; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6450 () Bool)

(assert start!6450)

(declare-fun b_free!1485 () Bool)

(declare-fun b_next!1485 () Bool)

(assert (=> start!6450 (= b_free!1485 (not b_next!1485))))

(declare-fun tp!5915 () Bool)

(declare-fun b_and!2619 () Bool)

(assert (=> start!6450 (= tp!5915 b_and!2619)))

(declare-fun res!25512 () Bool)

(declare-fun e!27220 () Bool)

(assert (=> start!6450 (=> (not res!25512) (not e!27220))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6450 (= res!25512 (validMask!0 mask!853))))

(assert (=> start!6450 e!27220))

(assert (=> start!6450 true))

(assert (=> start!6450 tp!5915))

(declare-fun b!42942 () Bool)

(assert (=> b!42942 (= e!27220 (not true))))

(declare-datatypes ((array!2895 0))(
  ( (array!2896 (arr!1391 (Array (_ BitVec 32) (_ BitVec 64))) (size!1576 (_ BitVec 32))) )
))
(declare-fun lt!18210 () array!2895)

(declare-datatypes ((V!2287 0))(
  ( (V!2288 (val!976 Int)) )
))
(declare-fun lt!18208 () V!2287)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1606 0))(
  ( (tuple2!1607 (_1!814 (_ BitVec 64)) (_2!814 V!2287)) )
))
(declare-datatypes ((List!1180 0))(
  ( (Nil!1177) (Cons!1176 (h!1753 tuple2!1606) (t!4161 List!1180)) )
))
(declare-datatypes ((ListLongMap!1183 0))(
  ( (ListLongMap!1184 (toList!607 List!1180)) )
))
(declare-fun lt!18207 () ListLongMap!1183)

(declare-datatypes ((ValueCell!690 0))(
  ( (ValueCellFull!690 (v!2066 V!2287)) (EmptyCell!690) )
))
(declare-datatypes ((array!2897 0))(
  ( (array!2898 (arr!1392 (Array (_ BitVec 32) ValueCell!690)) (size!1577 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!360 0))(
  ( (LongMapFixedSize!361 (defaultEntry!1873 Int) (mask!5416 (_ BitVec 32)) (extraKeys!1764 (_ BitVec 32)) (zeroValue!1791 V!2287) (minValue!1791 V!2287) (_size!229 (_ BitVec 32)) (_keys!3422 array!2895) (_values!1856 array!2897) (_vacant!229 (_ BitVec 32))) )
))
(declare-fun map!818 (LongMapFixedSize!360) ListLongMap!1183)

(assert (=> b!42942 (= lt!18207 (map!818 (LongMapFixedSize!361 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18208 lt!18208 #b00000000000000000000000000000000 lt!18210 (array!2898 ((as const (Array (_ BitVec 32) ValueCell!690)) EmptyCell!690) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1181 0))(
  ( (Nil!1178) (Cons!1177 (h!1754 (_ BitVec 64)) (t!4162 List!1181)) )
))
(declare-fun arrayNoDuplicates!0 (array!2895 (_ BitVec 32) List!1181) Bool)

(assert (=> b!42942 (arrayNoDuplicates!0 lt!18210 #b00000000000000000000000000000000 Nil!1178)))

(declare-datatypes ((Unit!1181 0))(
  ( (Unit!1182) )
))
(declare-fun lt!18209 () Unit!1181)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2895 (_ BitVec 32) (_ BitVec 32) List!1181) Unit!1181)

(assert (=> b!42942 (= lt!18209 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18210 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2895 (_ BitVec 32)) Bool)

(assert (=> b!42942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18210 mask!853)))

(declare-fun lt!18212 () Unit!1181)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2895 (_ BitVec 32) (_ BitVec 32)) Unit!1181)

(assert (=> b!42942 (= lt!18212 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18210 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2895 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42942 (= (arrayCountValidKeys!0 lt!18210 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18211 () Unit!1181)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2895 (_ BitVec 32) (_ BitVec 32)) Unit!1181)

(assert (=> b!42942 (= lt!18211 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18210 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42942 (= lt!18210 (array!2896 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!251 (Int (_ BitVec 64)) V!2287)

(assert (=> b!42942 (= lt!18208 (dynLambda!251 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6450 res!25512) b!42942))

(declare-fun b_lambda!2227 () Bool)

(assert (=> (not b_lambda!2227) (not b!42942)))

(declare-fun t!4160 () Bool)

(declare-fun tb!967 () Bool)

(assert (=> (and start!6450 (= defaultEntry!470 defaultEntry!470) t!4160) tb!967))

(declare-fun result!1685 () Bool)

(declare-fun tp_is_empty!1875 () Bool)

(assert (=> tb!967 (= result!1685 tp_is_empty!1875)))

(assert (=> b!42942 t!4160))

(declare-fun b_and!2621 () Bool)

(assert (= b_and!2619 (and (=> t!4160 result!1685) b_and!2621)))

(declare-fun m!36743 () Bool)

(assert (=> start!6450 m!36743))

(declare-fun m!36745 () Bool)

(assert (=> b!42942 m!36745))

(declare-fun m!36747 () Bool)

(assert (=> b!42942 m!36747))

(declare-fun m!36749 () Bool)

(assert (=> b!42942 m!36749))

(declare-fun m!36751 () Bool)

(assert (=> b!42942 m!36751))

(declare-fun m!36753 () Bool)

(assert (=> b!42942 m!36753))

(declare-fun m!36755 () Bool)

(assert (=> b!42942 m!36755))

(declare-fun m!36757 () Bool)

(assert (=> b!42942 m!36757))

(declare-fun m!36759 () Bool)

(assert (=> b!42942 m!36759))

(check-sat (not b_lambda!2227) b_and!2621 (not b!42942) (not b_next!1485) (not start!6450) tp_is_empty!1875)
(check-sat b_and!2621 (not b_next!1485))
