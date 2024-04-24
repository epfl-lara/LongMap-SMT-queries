; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108954 () Bool)

(assert start!108954)

(declare-fun b_free!28243 () Bool)

(declare-fun b_next!28243 () Bool)

(assert (=> start!108954 (= b_free!28243 (not b_next!28243))))

(declare-fun tp!99845 () Bool)

(declare-fun b_and!46311 () Bool)

(assert (=> start!108954 (= tp!99845 b_and!46311)))

(declare-fun b!1285117 () Bool)

(declare-fun res!853350 () Bool)

(declare-fun e!734230 () Bool)

(assert (=> b!1285117 (=> (not res!853350) (not e!734230))))

(declare-datatypes ((array!84855 0))(
  ( (array!84856 (arr!40925 (Array (_ BitVec 32) (_ BitVec 64))) (size!41476 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84855)

(declare-datatypes ((List!29022 0))(
  ( (Nil!29019) (Cons!29018 (h!30236 (_ BitVec 64)) (t!42558 List!29022)) )
))
(declare-fun arrayNoDuplicates!0 (array!84855 (_ BitVec 32) List!29022) Bool)

(assert (=> b!1285117 (= res!853350 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29019))))

(declare-fun b!1285118 () Bool)

(declare-fun res!853354 () Bool)

(assert (=> b!1285118 (=> (not res!853354) (not e!734230))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285118 (= res!853354 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41476 _keys!1741))))))

(declare-fun b!1285119 () Bool)

(declare-fun res!853352 () Bool)

(assert (=> b!1285119 (=> (not res!853352) (not e!734230))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84855 (_ BitVec 32)) Bool)

(assert (=> b!1285119 (= res!853352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285120 () Bool)

(declare-fun res!853348 () Bool)

(assert (=> b!1285120 (=> (not res!853348) (not e!734230))))

(declare-datatypes ((V!50281 0))(
  ( (V!50282 (val!17016 Int)) )
))
(declare-fun minValue!1387 () V!50281)

(declare-fun zeroValue!1387 () V!50281)

(declare-datatypes ((ValueCell!16043 0))(
  ( (ValueCellFull!16043 (v!19613 V!50281)) (EmptyCell!16043) )
))
(declare-datatypes ((array!84857 0))(
  ( (array!84858 (arr!40926 (Array (_ BitVec 32) ValueCell!16043)) (size!41477 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84857)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21814 0))(
  ( (tuple2!21815 (_1!10918 (_ BitVec 64)) (_2!10918 V!50281)) )
))
(declare-datatypes ((List!29023 0))(
  ( (Nil!29020) (Cons!29019 (h!30237 tuple2!21814) (t!42559 List!29023)) )
))
(declare-datatypes ((ListLongMap!19479 0))(
  ( (ListLongMap!19480 (toList!9755 List!29023)) )
))
(declare-fun contains!7886 (ListLongMap!19479 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4821 (array!84855 array!84857 (_ BitVec 32) (_ BitVec 32) V!50281 V!50281 (_ BitVec 32) Int) ListLongMap!19479)

(assert (=> b!1285120 (= res!853348 (contains!7886 (getCurrentListMap!4821 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285121 () Bool)

(declare-fun e!734232 () Bool)

(declare-fun e!734231 () Bool)

(declare-fun mapRes!52382 () Bool)

(assert (=> b!1285121 (= e!734232 (and e!734231 mapRes!52382))))

(declare-fun condMapEmpty!52382 () Bool)

(declare-fun mapDefault!52382 () ValueCell!16043)

(assert (=> b!1285121 (= condMapEmpty!52382 (= (arr!40926 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16043)) mapDefault!52382)))))

(declare-fun res!853353 () Bool)

(assert (=> start!108954 (=> (not res!853353) (not e!734230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108954 (= res!853353 (validMask!0 mask!2175))))

(assert (=> start!108954 e!734230))

(declare-fun tp_is_empty!33883 () Bool)

(assert (=> start!108954 tp_is_empty!33883))

(assert (=> start!108954 true))

(declare-fun array_inv!31255 (array!84857) Bool)

(assert (=> start!108954 (and (array_inv!31255 _values!1445) e!734232)))

(declare-fun array_inv!31256 (array!84855) Bool)

(assert (=> start!108954 (array_inv!31256 _keys!1741)))

(assert (=> start!108954 tp!99845))

(declare-fun b!1285122 () Bool)

(declare-fun e!734229 () Bool)

(assert (=> b!1285122 (= e!734229 tp_is_empty!33883)))

(declare-fun b!1285123 () Bool)

(declare-fun res!853347 () Bool)

(assert (=> b!1285123 (=> (not res!853347) (not e!734230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285123 (= res!853347 (validKeyInArray!0 (select (arr!40925 _keys!1741) from!2144)))))

(declare-fun b!1285124 () Bool)

(assert (=> b!1285124 (= e!734231 tp_is_empty!33883)))

(declare-fun b!1285125 () Bool)

(declare-fun res!853349 () Bool)

(assert (=> b!1285125 (=> (not res!853349) (not e!734230))))

(assert (=> b!1285125 (= res!853349 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41476 _keys!1741))))))

(declare-fun b!1285126 () Bool)

(declare-fun res!853351 () Bool)

(assert (=> b!1285126 (=> (not res!853351) (not e!734230))))

(assert (=> b!1285126 (= res!853351 (and (= (size!41477 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41476 _keys!1741) (size!41477 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52382 () Bool)

(assert (=> mapIsEmpty!52382 mapRes!52382))

(declare-fun mapNonEmpty!52382 () Bool)

(declare-fun tp!99844 () Bool)

(assert (=> mapNonEmpty!52382 (= mapRes!52382 (and tp!99844 e!734229))))

(declare-fun mapValue!52382 () ValueCell!16043)

(declare-fun mapKey!52382 () (_ BitVec 32))

(declare-fun mapRest!52382 () (Array (_ BitVec 32) ValueCell!16043))

(assert (=> mapNonEmpty!52382 (= (arr!40926 _values!1445) (store mapRest!52382 mapKey!52382 mapValue!52382))))

(declare-fun b!1285127 () Bool)

(assert (=> b!1285127 (= e!734230 (not true))))

(declare-fun lt!577202 () ListLongMap!19479)

(assert (=> b!1285127 (contains!7886 lt!577202 k0!1205)))

(declare-datatypes ((Unit!42450 0))(
  ( (Unit!42451) )
))
(declare-fun lt!577201 () Unit!42450)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!15 ((_ BitVec 64) (_ BitVec 64) V!50281 ListLongMap!19479) Unit!42450)

(assert (=> b!1285127 (= lt!577201 (lemmaInListMapAfterAddingDiffThenInBefore!15 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577202))))

(declare-fun +!4340 (ListLongMap!19479 tuple2!21814) ListLongMap!19479)

(declare-fun getCurrentListMapNoExtraKeys!5972 (array!84855 array!84857 (_ BitVec 32) (_ BitVec 32) V!50281 V!50281 (_ BitVec 32) Int) ListLongMap!19479)

(assert (=> b!1285127 (= lt!577202 (+!4340 (getCurrentListMapNoExtraKeys!5972 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21815 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1285128 () Bool)

(declare-fun res!853346 () Bool)

(assert (=> b!1285128 (=> (not res!853346) (not e!734230))))

(assert (=> b!1285128 (= res!853346 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!108954 res!853353) b!1285126))

(assert (= (and b!1285126 res!853351) b!1285119))

(assert (= (and b!1285119 res!853352) b!1285117))

(assert (= (and b!1285117 res!853350) b!1285118))

(assert (= (and b!1285118 res!853354) b!1285120))

(assert (= (and b!1285120 res!853348) b!1285125))

(assert (= (and b!1285125 res!853349) b!1285123))

(assert (= (and b!1285123 res!853347) b!1285128))

(assert (= (and b!1285128 res!853346) b!1285127))

(assert (= (and b!1285121 condMapEmpty!52382) mapIsEmpty!52382))

(assert (= (and b!1285121 (not condMapEmpty!52382)) mapNonEmpty!52382))

(get-info :version)

(assert (= (and mapNonEmpty!52382 ((_ is ValueCellFull!16043) mapValue!52382)) b!1285122))

(assert (= (and b!1285121 ((_ is ValueCellFull!16043) mapDefault!52382)) b!1285124))

(assert (= start!108954 b!1285121))

(declare-fun m!1179265 () Bool)

(assert (=> b!1285119 m!1179265))

(declare-fun m!1179267 () Bool)

(assert (=> b!1285120 m!1179267))

(assert (=> b!1285120 m!1179267))

(declare-fun m!1179269 () Bool)

(assert (=> b!1285120 m!1179269))

(declare-fun m!1179271 () Bool)

(assert (=> b!1285117 m!1179271))

(declare-fun m!1179273 () Bool)

(assert (=> mapNonEmpty!52382 m!1179273))

(declare-fun m!1179275 () Bool)

(assert (=> b!1285127 m!1179275))

(declare-fun m!1179277 () Bool)

(assert (=> b!1285127 m!1179277))

(declare-fun m!1179279 () Bool)

(assert (=> b!1285127 m!1179279))

(assert (=> b!1285127 m!1179279))

(declare-fun m!1179281 () Bool)

(assert (=> b!1285127 m!1179281))

(declare-fun m!1179283 () Bool)

(assert (=> start!108954 m!1179283))

(declare-fun m!1179285 () Bool)

(assert (=> start!108954 m!1179285))

(declare-fun m!1179287 () Bool)

(assert (=> start!108954 m!1179287))

(declare-fun m!1179289 () Bool)

(assert (=> b!1285123 m!1179289))

(assert (=> b!1285123 m!1179289))

(declare-fun m!1179291 () Bool)

(assert (=> b!1285123 m!1179291))

(check-sat (not mapNonEmpty!52382) b_and!46311 tp_is_empty!33883 (not start!108954) (not b_next!28243) (not b!1285119) (not b!1285120) (not b!1285127) (not b!1285117) (not b!1285123))
(check-sat b_and!46311 (not b_next!28243))
