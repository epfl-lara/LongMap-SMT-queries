; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132030 () Bool)

(assert start!132030)

(declare-fun b_free!31743 () Bool)

(declare-fun b_next!31743 () Bool)

(assert (=> start!132030 (= b_free!31743 (not b_next!31743))))

(declare-fun tp!111481 () Bool)

(declare-fun b_and!51153 () Bool)

(assert (=> start!132030 (= tp!111481 b_and!51153)))

(declare-fun b!1547273 () Bool)

(declare-datatypes ((V!59135 0))(
  ( (V!59136 (val!19087 Int)) )
))
(declare-datatypes ((tuple2!24554 0))(
  ( (tuple2!24555 (_1!12288 (_ BitVec 64)) (_2!12288 V!59135)) )
))
(declare-datatypes ((List!36054 0))(
  ( (Nil!36051) (Cons!36050 (h!37495 tuple2!24554) (t!50748 List!36054)) )
))
(declare-datatypes ((ListLongMap!22163 0))(
  ( (ListLongMap!22164 (toList!11097 List!36054)) )
))
(declare-fun e!861258 () ListLongMap!22163)

(declare-fun call!69801 () ListLongMap!22163)

(assert (=> b!1547273 (= e!861258 call!69801)))

(declare-fun b!1547274 () Bool)

(declare-fun res!1060611 () Bool)

(declare-fun e!861257 () Bool)

(assert (=> b!1547274 (=> (not res!1060611) (not e!861257))))

(declare-datatypes ((array!103238 0))(
  ( (array!103239 (arr!49821 (Array (_ BitVec 32) (_ BitVec 64))) (size!50371 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103238)

(declare-datatypes ((List!36055 0))(
  ( (Nil!36052) (Cons!36051 (h!37496 (_ BitVec 64)) (t!50749 List!36055)) )
))
(declare-fun arrayNoDuplicates!0 (array!103238 (_ BitVec 32) List!36055) Bool)

(assert (=> b!1547274 (= res!1060611 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36052))))

(declare-fun b!1547275 () Bool)

(declare-fun e!861260 () ListLongMap!22163)

(declare-fun call!69800 () ListLongMap!22163)

(assert (=> b!1547275 (= e!861260 call!69800)))

(declare-fun b!1547276 () Bool)

(declare-fun e!861254 () Bool)

(assert (=> b!1547276 (= e!861254 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun minValue!436 () V!59135)

(declare-fun lt!666827 () ListLongMap!22163)

(declare-fun apply!1050 (ListLongMap!22163 (_ BitVec 64)) V!59135)

(declare-fun +!4928 (ListLongMap!22163 tuple2!24554) ListLongMap!22163)

(assert (=> b!1547276 (= (apply!1050 (+!4928 lt!666827 (tuple2!24555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49821 _keys!618) from!762)) (apply!1050 lt!666827 (select (arr!49821 _keys!618) from!762)))))

(declare-datatypes ((Unit!51550 0))(
  ( (Unit!51551) )
))
(declare-fun lt!666824 () Unit!51550)

(declare-fun addApplyDifferent!592 (ListLongMap!22163 (_ BitVec 64) V!59135 (_ BitVec 64)) Unit!51550)

(assert (=> b!1547276 (= lt!666824 (addApplyDifferent!592 lt!666827 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49821 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59135)

(declare-fun contains!10057 (ListLongMap!22163 (_ BitVec 64)) Bool)

(assert (=> b!1547276 (contains!10057 (+!4928 lt!666827 (tuple2!24555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49821 _keys!618) from!762))))

(declare-fun lt!666823 () Unit!51550)

(declare-fun addStillContains!1245 (ListLongMap!22163 (_ BitVec 64) V!59135 (_ BitVec 64)) Unit!51550)

(assert (=> b!1547276 (= lt!666823 (addStillContains!1245 lt!666827 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49821 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18099 0))(
  ( (ValueCellFull!18099 (v!21888 V!59135)) (EmptyCell!18099) )
))
(declare-datatypes ((array!103240 0))(
  ( (array!103241 (arr!49822 (Array (_ BitVec 32) ValueCell!18099)) (size!50372 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103240)

(declare-fun getCurrentListMapNoExtraKeys!6557 (array!103238 array!103240 (_ BitVec 32) (_ BitVec 32) V!59135 V!59135 (_ BitVec 32) Int) ListLongMap!22163)

(assert (=> b!1547276 (= lt!666827 (getCurrentListMapNoExtraKeys!6557 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547277 () Bool)

(declare-fun res!1060613 () Bool)

(assert (=> b!1547277 (=> (not res!1060613) (not e!861257))))

(assert (=> b!1547277 (= res!1060613 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50371 _keys!618))))))

(declare-fun c!141972 () Bool)

(declare-fun bm!69797 () Bool)

(declare-fun call!69803 () ListLongMap!22163)

(declare-fun call!69804 () ListLongMap!22163)

(declare-fun call!69802 () ListLongMap!22163)

(declare-fun c!141974 () Bool)

(assert (=> bm!69797 (= call!69802 (+!4928 (ite c!141974 call!69804 (ite c!141972 call!69803 call!69801)) (ite (or c!141974 c!141972) (tuple2!24555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1060610 () Bool)

(assert (=> start!132030 (=> (not res!1060610) (not e!861257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132030 (= res!1060610 (validMask!0 mask!926))))

(assert (=> start!132030 e!861257))

(declare-fun array_inv!38747 (array!103238) Bool)

(assert (=> start!132030 (array_inv!38747 _keys!618)))

(declare-fun tp_is_empty!38019 () Bool)

(assert (=> start!132030 tp_is_empty!38019))

(assert (=> start!132030 true))

(assert (=> start!132030 tp!111481))

(declare-fun e!861255 () Bool)

(declare-fun array_inv!38748 (array!103240) Bool)

(assert (=> start!132030 (and (array_inv!38748 _values!470) e!861255)))

(declare-fun bm!69798 () Bool)

(assert (=> bm!69798 (= call!69804 (getCurrentListMapNoExtraKeys!6557 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69799 () Bool)

(assert (=> bm!69799 (= call!69800 call!69802)))

(declare-fun bm!69800 () Bool)

(assert (=> bm!69800 (= call!69801 call!69803)))

(declare-fun b!1547278 () Bool)

(declare-fun res!1060612 () Bool)

(assert (=> b!1547278 (=> (not res!1060612) (not e!861254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547278 (= res!1060612 (validKeyInArray!0 (select (arr!49821 _keys!618) from!762)))))

(declare-fun b!1547279 () Bool)

(declare-fun res!1060614 () Bool)

(assert (=> b!1547279 (=> (not res!1060614) (not e!861257))))

(assert (=> b!1547279 (= res!1060614 (and (= (size!50372 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50371 _keys!618) (size!50372 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547280 () Bool)

(declare-fun e!861253 () Bool)

(assert (=> b!1547280 (= e!861253 tp_is_empty!38019)))

(declare-fun b!1547281 () Bool)

(declare-fun c!141973 () Bool)

(declare-fun lt!666825 () Bool)

(assert (=> b!1547281 (= c!141973 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666825))))

(assert (=> b!1547281 (= e!861260 e!861258)))

(declare-fun bm!69801 () Bool)

(assert (=> bm!69801 (= call!69803 call!69804)))

(declare-fun mapNonEmpty!58732 () Bool)

(declare-fun mapRes!58732 () Bool)

(declare-fun tp!111480 () Bool)

(declare-fun e!861259 () Bool)

(assert (=> mapNonEmpty!58732 (= mapRes!58732 (and tp!111480 e!861259))))

(declare-fun mapRest!58732 () (Array (_ BitVec 32) ValueCell!18099))

(declare-fun mapValue!58732 () ValueCell!18099)

(declare-fun mapKey!58732 () (_ BitVec 32))

(assert (=> mapNonEmpty!58732 (= (arr!49822 _values!470) (store mapRest!58732 mapKey!58732 mapValue!58732))))

(declare-fun b!1547282 () Bool)

(assert (=> b!1547282 (= e!861255 (and e!861253 mapRes!58732))))

(declare-fun condMapEmpty!58732 () Bool)

(declare-fun mapDefault!58732 () ValueCell!18099)

(assert (=> b!1547282 (= condMapEmpty!58732 (= (arr!49822 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18099)) mapDefault!58732)))))

(declare-fun b!1547283 () Bool)

(declare-fun res!1060609 () Bool)

(assert (=> b!1547283 (=> (not res!1060609) (not e!861257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103238 (_ BitVec 32)) Bool)

(assert (=> b!1547283 (= res!1060609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1547284 () Bool)

(assert (=> b!1547284 (= e!861257 e!861254)))

(declare-fun res!1060608 () Bool)

(assert (=> b!1547284 (=> (not res!1060608) (not e!861254))))

(assert (=> b!1547284 (= res!1060608 (bvslt from!762 (size!50371 _keys!618)))))

(declare-fun lt!666826 () ListLongMap!22163)

(declare-fun e!861256 () ListLongMap!22163)

(assert (=> b!1547284 (= lt!666826 e!861256)))

(assert (=> b!1547284 (= c!141974 (and (not lt!666825) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547284 (= lt!666825 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547285 () Bool)

(assert (=> b!1547285 (= e!861259 tp_is_empty!38019)))

(declare-fun mapIsEmpty!58732 () Bool)

(assert (=> mapIsEmpty!58732 mapRes!58732))

(declare-fun b!1547286 () Bool)

(assert (=> b!1547286 (= e!861258 call!69800)))

(declare-fun b!1547287 () Bool)

(assert (=> b!1547287 (= e!861256 e!861260)))

(assert (=> b!1547287 (= c!141972 (and (not lt!666825) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547288 () Bool)

(assert (=> b!1547288 (= e!861256 (+!4928 call!69802 (tuple2!24555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!132030 res!1060610) b!1547279))

(assert (= (and b!1547279 res!1060614) b!1547283))

(assert (= (and b!1547283 res!1060609) b!1547274))

(assert (= (and b!1547274 res!1060611) b!1547277))

(assert (= (and b!1547277 res!1060613) b!1547284))

(assert (= (and b!1547284 c!141974) b!1547288))

(assert (= (and b!1547284 (not c!141974)) b!1547287))

(assert (= (and b!1547287 c!141972) b!1547275))

(assert (= (and b!1547287 (not c!141972)) b!1547281))

(assert (= (and b!1547281 c!141973) b!1547286))

(assert (= (and b!1547281 (not c!141973)) b!1547273))

(assert (= (or b!1547286 b!1547273) bm!69800))

(assert (= (or b!1547275 bm!69800) bm!69801))

(assert (= (or b!1547275 b!1547286) bm!69799))

(assert (= (or b!1547288 bm!69801) bm!69798))

(assert (= (or b!1547288 bm!69799) bm!69797))

(assert (= (and b!1547284 res!1060608) b!1547278))

(assert (= (and b!1547278 res!1060612) b!1547276))

(assert (= (and b!1547282 condMapEmpty!58732) mapIsEmpty!58732))

(assert (= (and b!1547282 (not condMapEmpty!58732)) mapNonEmpty!58732))

(get-info :version)

(assert (= (and mapNonEmpty!58732 ((_ is ValueCellFull!18099) mapValue!58732)) b!1547285))

(assert (= (and b!1547282 ((_ is ValueCellFull!18099) mapDefault!58732)) b!1547280))

(assert (= start!132030 b!1547282))

(declare-fun m!1426933 () Bool)

(assert (=> bm!69797 m!1426933))

(declare-fun m!1426935 () Bool)

(assert (=> b!1547288 m!1426935))

(declare-fun m!1426937 () Bool)

(assert (=> b!1547274 m!1426937))

(declare-fun m!1426939 () Bool)

(assert (=> start!132030 m!1426939))

(declare-fun m!1426941 () Bool)

(assert (=> start!132030 m!1426941))

(declare-fun m!1426943 () Bool)

(assert (=> start!132030 m!1426943))

(declare-fun m!1426945 () Bool)

(assert (=> b!1547276 m!1426945))

(declare-fun m!1426947 () Bool)

(assert (=> b!1547276 m!1426947))

(assert (=> b!1547276 m!1426945))

(declare-fun m!1426949 () Bool)

(assert (=> b!1547276 m!1426949))

(declare-fun m!1426951 () Bool)

(assert (=> b!1547276 m!1426951))

(assert (=> b!1547276 m!1426945))

(declare-fun m!1426953 () Bool)

(assert (=> b!1547276 m!1426953))

(assert (=> b!1547276 m!1426945))

(declare-fun m!1426955 () Bool)

(assert (=> b!1547276 m!1426955))

(declare-fun m!1426957 () Bool)

(assert (=> b!1547276 m!1426957))

(assert (=> b!1547276 m!1426957))

(assert (=> b!1547276 m!1426945))

(declare-fun m!1426959 () Bool)

(assert (=> b!1547276 m!1426959))

(assert (=> b!1547276 m!1426945))

(declare-fun m!1426961 () Bool)

(assert (=> b!1547276 m!1426961))

(assert (=> b!1547276 m!1426953))

(assert (=> b!1547278 m!1426945))

(assert (=> b!1547278 m!1426945))

(declare-fun m!1426963 () Bool)

(assert (=> b!1547278 m!1426963))

(declare-fun m!1426965 () Bool)

(assert (=> mapNonEmpty!58732 m!1426965))

(declare-fun m!1426967 () Bool)

(assert (=> b!1547283 m!1426967))

(assert (=> bm!69798 m!1426951))

(check-sat (not mapNonEmpty!58732) (not b!1547276) tp_is_empty!38019 (not b!1547283) (not b!1547278) (not bm!69797) (not b!1547274) (not b!1547288) (not start!132030) b_and!51153 (not b_next!31743) (not bm!69798))
(check-sat b_and!51153 (not b_next!31743))
