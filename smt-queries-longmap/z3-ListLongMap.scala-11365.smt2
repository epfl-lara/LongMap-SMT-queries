; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132044 () Bool)

(assert start!132044)

(declare-fun b_free!31807 () Bool)

(declare-fun b_next!31807 () Bool)

(assert (=> start!132044 (= b_free!31807 (not b_next!31807))))

(declare-fun tp!111674 () Bool)

(declare-fun b_and!51199 () Bool)

(assert (=> start!132044 (= tp!111674 b_and!51199)))

(declare-fun b!1548496 () Bool)

(declare-fun c!142173 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667220 () Bool)

(assert (=> b!1548496 (= c!142173 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667220))))

(declare-datatypes ((V!59221 0))(
  ( (V!59222 (val!19119 Int)) )
))
(declare-datatypes ((tuple2!24692 0))(
  ( (tuple2!24693 (_1!12357 (_ BitVec 64)) (_2!12357 V!59221)) )
))
(declare-datatypes ((List!36154 0))(
  ( (Nil!36151) (Cons!36150 (h!37596 tuple2!24692) (t!50840 List!36154)) )
))
(declare-datatypes ((ListLongMap!22301 0))(
  ( (ListLongMap!22302 (toList!11166 List!36154)) )
))
(declare-fun e!861919 () ListLongMap!22301)

(declare-fun e!861926 () ListLongMap!22301)

(assert (=> b!1548496 (= e!861919 e!861926)))

(declare-fun b!1548497 () Bool)

(declare-fun res!1061151 () Bool)

(declare-fun e!861923 () Bool)

(assert (=> b!1548497 (=> (not res!1061151) (not e!861923))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103292 0))(
  ( (array!103293 (arr!49849 (Array (_ BitVec 32) (_ BitVec 64))) (size!50401 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103292)

(assert (=> b!1548497 (= res!1061151 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50401 _keys!618))))))

(declare-fun b!1548498 () Bool)

(declare-fun call!70246 () ListLongMap!22301)

(assert (=> b!1548498 (= e!861926 call!70246)))

(declare-fun bm!70242 () Bool)

(declare-fun call!70248 () ListLongMap!22301)

(declare-fun call!70245 () ListLongMap!22301)

(assert (=> bm!70242 (= call!70248 call!70245)))

(declare-fun b!1548499 () Bool)

(declare-fun e!861925 () Bool)

(assert (=> b!1548499 (= e!861925 (not true))))

(declare-fun lt!667214 () V!59221)

(declare-fun lt!667216 () ListLongMap!22301)

(declare-fun apply!1067 (ListLongMap!22301 (_ BitVec 64)) V!59221)

(assert (=> b!1548499 (= (apply!1067 lt!667216 (select (arr!49849 _keys!618) from!762)) lt!667214)))

(declare-fun zeroValue!436 () V!59221)

(declare-datatypes ((Unit!51431 0))(
  ( (Unit!51432) )
))
(declare-fun lt!667218 () Unit!51431)

(declare-fun lt!667219 () ListLongMap!22301)

(declare-fun addApplyDifferent!605 (ListLongMap!22301 (_ BitVec 64) V!59221 (_ BitVec 64)) Unit!51431)

(assert (=> b!1548499 (= lt!667218 (addApplyDifferent!605 lt!667219 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49849 _keys!618) from!762)))))

(declare-fun lt!667215 () V!59221)

(assert (=> b!1548499 (= lt!667215 lt!667214)))

(assert (=> b!1548499 (= lt!667214 (apply!1067 lt!667219 (select (arr!49849 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59221)

(declare-fun +!4988 (ListLongMap!22301 tuple2!24692) ListLongMap!22301)

(assert (=> b!1548499 (= lt!667215 (apply!1067 (+!4988 lt!667219 (tuple2!24693 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49849 _keys!618) from!762)))))

(declare-fun lt!667221 () Unit!51431)

(assert (=> b!1548499 (= lt!667221 (addApplyDifferent!605 lt!667219 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49849 _keys!618) from!762)))))

(declare-fun contains!10042 (ListLongMap!22301 (_ BitVec 64)) Bool)

(assert (=> b!1548499 (contains!10042 lt!667216 (select (arr!49849 _keys!618) from!762))))

(assert (=> b!1548499 (= lt!667216 (+!4988 lt!667219 (tuple2!24693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667222 () Unit!51431)

(declare-fun addStillContains!1265 (ListLongMap!22301 (_ BitVec 64) V!59221 (_ BitVec 64)) Unit!51431)

(assert (=> b!1548499 (= lt!667222 (addStillContains!1265 lt!667219 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49849 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18131 0))(
  ( (ValueCellFull!18131 (v!21916 V!59221)) (EmptyCell!18131) )
))
(declare-datatypes ((array!103294 0))(
  ( (array!103295 (arr!49850 (Array (_ BitVec 32) ValueCell!18131)) (size!50402 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103294)

(declare-fun getCurrentListMapNoExtraKeys!6615 (array!103292 array!103294 (_ BitVec 32) (_ BitVec 32) V!59221 V!59221 (_ BitVec 32) Int) ListLongMap!22301)

(assert (=> b!1548499 (= lt!667219 (getCurrentListMapNoExtraKeys!6615 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70243 () Bool)

(declare-fun call!70247 () ListLongMap!22301)

(assert (=> bm!70243 (= call!70247 (getCurrentListMapNoExtraKeys!6615 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548500 () Bool)

(declare-fun res!1061155 () Bool)

(assert (=> b!1548500 (=> (not res!1061155) (not e!861923))))

(assert (=> b!1548500 (= res!1061155 (and (= (size!50402 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50401 _keys!618) (size!50402 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548501 () Bool)

(declare-fun e!861922 () ListLongMap!22301)

(assert (=> b!1548501 (= e!861922 e!861919)))

(declare-fun c!142172 () Bool)

(assert (=> b!1548501 (= c!142172 (and (not lt!667220) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70244 () Bool)

(declare-fun call!70249 () ListLongMap!22301)

(assert (=> bm!70244 (= call!70246 call!70249)))

(declare-fun b!1548502 () Bool)

(assert (=> b!1548502 (= e!861922 (+!4988 call!70245 (tuple2!24693 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548503 () Bool)

(declare-fun res!1061152 () Bool)

(assert (=> b!1548503 (=> (not res!1061152) (not e!861923))))

(declare-datatypes ((List!36155 0))(
  ( (Nil!36152) (Cons!36151 (h!37597 (_ BitVec 64)) (t!50841 List!36155)) )
))
(declare-fun arrayNoDuplicates!0 (array!103292 (_ BitVec 32) List!36155) Bool)

(assert (=> b!1548503 (= res!1061152 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36152))))

(declare-fun b!1548504 () Bool)

(declare-fun res!1061153 () Bool)

(assert (=> b!1548504 (=> (not res!1061153) (not e!861923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103292 (_ BitVec 32)) Bool)

(assert (=> b!1548504 (= res!1061153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548505 () Bool)

(declare-fun e!861921 () Bool)

(declare-fun tp_is_empty!38083 () Bool)

(assert (=> b!1548505 (= e!861921 tp_is_empty!38083)))

(declare-fun b!1548506 () Bool)

(declare-fun e!861927 () Bool)

(assert (=> b!1548506 (= e!861927 tp_is_empty!38083)))

(declare-fun b!1548507 () Bool)

(assert (=> b!1548507 (= e!861923 e!861925)))

(declare-fun res!1061156 () Bool)

(assert (=> b!1548507 (=> (not res!1061156) (not e!861925))))

(assert (=> b!1548507 (= res!1061156 (bvslt from!762 (size!50401 _keys!618)))))

(declare-fun lt!667217 () ListLongMap!22301)

(assert (=> b!1548507 (= lt!667217 e!861922)))

(declare-fun c!142171 () Bool)

(assert (=> b!1548507 (= c!142171 (and (not lt!667220) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548507 (= lt!667220 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548508 () Bool)

(assert (=> b!1548508 (= e!861926 call!70248)))

(declare-fun res!1061157 () Bool)

(assert (=> start!132044 (=> (not res!1061157) (not e!861923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132044 (= res!1061157 (validMask!0 mask!926))))

(assert (=> start!132044 e!861923))

(declare-fun array_inv!38967 (array!103292) Bool)

(assert (=> start!132044 (array_inv!38967 _keys!618)))

(assert (=> start!132044 tp_is_empty!38083))

(assert (=> start!132044 true))

(assert (=> start!132044 tp!111674))

(declare-fun e!861920 () Bool)

(declare-fun array_inv!38968 (array!103294) Bool)

(assert (=> start!132044 (and (array_inv!38968 _values!470) e!861920)))

(declare-fun bm!70245 () Bool)

(assert (=> bm!70245 (= call!70245 (+!4988 (ite c!142171 call!70247 (ite c!142172 call!70249 call!70246)) (ite (or c!142171 c!142172) (tuple2!24693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24693 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548509 () Bool)

(declare-fun res!1061154 () Bool)

(assert (=> b!1548509 (=> (not res!1061154) (not e!861925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548509 (= res!1061154 (validKeyInArray!0 (select (arr!49849 _keys!618) from!762)))))

(declare-fun mapIsEmpty!58828 () Bool)

(declare-fun mapRes!58828 () Bool)

(assert (=> mapIsEmpty!58828 mapRes!58828))

(declare-fun b!1548510 () Bool)

(assert (=> b!1548510 (= e!861919 call!70248)))

(declare-fun b!1548511 () Bool)

(assert (=> b!1548511 (= e!861920 (and e!861921 mapRes!58828))))

(declare-fun condMapEmpty!58828 () Bool)

(declare-fun mapDefault!58828 () ValueCell!18131)

(assert (=> b!1548511 (= condMapEmpty!58828 (= (arr!49850 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18131)) mapDefault!58828)))))

(declare-fun bm!70246 () Bool)

(assert (=> bm!70246 (= call!70249 call!70247)))

(declare-fun mapNonEmpty!58828 () Bool)

(declare-fun tp!111673 () Bool)

(assert (=> mapNonEmpty!58828 (= mapRes!58828 (and tp!111673 e!861927))))

(declare-fun mapRest!58828 () (Array (_ BitVec 32) ValueCell!18131))

(declare-fun mapKey!58828 () (_ BitVec 32))

(declare-fun mapValue!58828 () ValueCell!18131)

(assert (=> mapNonEmpty!58828 (= (arr!49850 _values!470) (store mapRest!58828 mapKey!58828 mapValue!58828))))

(assert (= (and start!132044 res!1061157) b!1548500))

(assert (= (and b!1548500 res!1061155) b!1548504))

(assert (= (and b!1548504 res!1061153) b!1548503))

(assert (= (and b!1548503 res!1061152) b!1548497))

(assert (= (and b!1548497 res!1061151) b!1548507))

(assert (= (and b!1548507 c!142171) b!1548502))

(assert (= (and b!1548507 (not c!142171)) b!1548501))

(assert (= (and b!1548501 c!142172) b!1548510))

(assert (= (and b!1548501 (not c!142172)) b!1548496))

(assert (= (and b!1548496 c!142173) b!1548508))

(assert (= (and b!1548496 (not c!142173)) b!1548498))

(assert (= (or b!1548508 b!1548498) bm!70244))

(assert (= (or b!1548510 bm!70244) bm!70246))

(assert (= (or b!1548510 b!1548508) bm!70242))

(assert (= (or b!1548502 bm!70246) bm!70243))

(assert (= (or b!1548502 bm!70242) bm!70245))

(assert (= (and b!1548507 res!1061156) b!1548509))

(assert (= (and b!1548509 res!1061154) b!1548499))

(assert (= (and b!1548511 condMapEmpty!58828) mapIsEmpty!58828))

(assert (= (and b!1548511 (not condMapEmpty!58828)) mapNonEmpty!58828))

(get-info :version)

(assert (= (and mapNonEmpty!58828 ((_ is ValueCellFull!18131) mapValue!58828)) b!1548506))

(assert (= (and b!1548511 ((_ is ValueCellFull!18131) mapDefault!58828)) b!1548505))

(assert (= start!132044 b!1548511))

(declare-fun m!1427259 () Bool)

(assert (=> start!132044 m!1427259))

(declare-fun m!1427261 () Bool)

(assert (=> start!132044 m!1427261))

(declare-fun m!1427263 () Bool)

(assert (=> start!132044 m!1427263))

(declare-fun m!1427265 () Bool)

(assert (=> b!1548499 m!1427265))

(assert (=> b!1548499 m!1427265))

(declare-fun m!1427267 () Bool)

(assert (=> b!1548499 m!1427267))

(assert (=> b!1548499 m!1427265))

(declare-fun m!1427269 () Bool)

(assert (=> b!1548499 m!1427269))

(declare-fun m!1427271 () Bool)

(assert (=> b!1548499 m!1427271))

(assert (=> b!1548499 m!1427265))

(declare-fun m!1427273 () Bool)

(assert (=> b!1548499 m!1427273))

(declare-fun m!1427275 () Bool)

(assert (=> b!1548499 m!1427275))

(assert (=> b!1548499 m!1427265))

(declare-fun m!1427277 () Bool)

(assert (=> b!1548499 m!1427277))

(assert (=> b!1548499 m!1427265))

(declare-fun m!1427279 () Bool)

(assert (=> b!1548499 m!1427279))

(assert (=> b!1548499 m!1427271))

(assert (=> b!1548499 m!1427265))

(declare-fun m!1427281 () Bool)

(assert (=> b!1548499 m!1427281))

(declare-fun m!1427283 () Bool)

(assert (=> b!1548499 m!1427283))

(assert (=> b!1548499 m!1427265))

(declare-fun m!1427285 () Bool)

(assert (=> b!1548499 m!1427285))

(declare-fun m!1427287 () Bool)

(assert (=> b!1548503 m!1427287))

(declare-fun m!1427289 () Bool)

(assert (=> bm!70245 m!1427289))

(declare-fun m!1427291 () Bool)

(assert (=> b!1548502 m!1427291))

(assert (=> bm!70243 m!1427275))

(declare-fun m!1427293 () Bool)

(assert (=> b!1548504 m!1427293))

(assert (=> b!1548509 m!1427265))

(assert (=> b!1548509 m!1427265))

(declare-fun m!1427295 () Bool)

(assert (=> b!1548509 m!1427295))

(declare-fun m!1427297 () Bool)

(assert (=> mapNonEmpty!58828 m!1427297))

(check-sat (not b!1548502) (not b!1548509) (not start!132044) (not b!1548503) (not b_next!31807) tp_is_empty!38083 (not bm!70243) (not b!1548504) b_and!51199 (not b!1548499) (not mapNonEmpty!58828) (not bm!70245))
(check-sat b_and!51199 (not b_next!31807))
