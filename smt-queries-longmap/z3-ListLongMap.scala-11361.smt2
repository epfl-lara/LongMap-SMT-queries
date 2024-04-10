; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132072 () Bool)

(assert start!132072)

(declare-fun b_free!31785 () Bool)

(declare-fun b_next!31785 () Bool)

(assert (=> start!132072 (= b_free!31785 (not b_next!31785))))

(declare-fun tp!111607 () Bool)

(declare-fun b_and!51195 () Bool)

(assert (=> start!132072 (= tp!111607 b_and!51195)))

(declare-fun b!1548281 () Bool)

(declare-fun res!1061055 () Bool)

(declare-fun e!861821 () Bool)

(assert (=> b!1548281 (=> (not res!1061055) (not e!861821))))

(declare-datatypes ((array!103322 0))(
  ( (array!103323 (arr!49863 (Array (_ BitVec 32) (_ BitVec 64))) (size!50413 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103322)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548281 (= res!1061055 (validKeyInArray!0 (select (arr!49863 _keys!618) from!762)))))

(declare-fun b!1548282 () Bool)

(declare-fun e!861822 () Bool)

(declare-fun e!861828 () Bool)

(declare-fun mapRes!58795 () Bool)

(assert (=> b!1548282 (= e!861822 (and e!861828 mapRes!58795))))

(declare-fun condMapEmpty!58795 () Bool)

(declare-datatypes ((V!59191 0))(
  ( (V!59192 (val!19108 Int)) )
))
(declare-datatypes ((ValueCell!18120 0))(
  ( (ValueCellFull!18120 (v!21909 V!59191)) (EmptyCell!18120) )
))
(declare-datatypes ((array!103324 0))(
  ( (array!103325 (arr!49864 (Array (_ BitVec 32) ValueCell!18120)) (size!50414 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103324)

(declare-fun mapDefault!58795 () ValueCell!18120)

(assert (=> b!1548282 (= condMapEmpty!58795 (= (arr!49864 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18120)) mapDefault!58795)))))

(declare-fun b!1548283 () Bool)

(declare-fun res!1061054 () Bool)

(declare-fun e!861820 () Bool)

(assert (=> b!1548283 (=> (not res!1061054) (not e!861820))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1548283 (= res!1061054 (and (= (size!50414 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50413 _keys!618) (size!50414 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!436 () V!59191)

(declare-datatypes ((tuple2!24596 0))(
  ( (tuple2!24597 (_1!12309 (_ BitVec 64)) (_2!12309 V!59191)) )
))
(declare-datatypes ((List!36088 0))(
  ( (Nil!36085) (Cons!36084 (h!37529 tuple2!24596) (t!50782 List!36088)) )
))
(declare-datatypes ((ListLongMap!22205 0))(
  ( (ListLongMap!22206 (toList!11118 List!36088)) )
))
(declare-fun call!70116 () ListLongMap!22205)

(declare-fun call!70119 () ListLongMap!22205)

(declare-fun c!142163 () Bool)

(declare-fun call!70117 () ListLongMap!22205)

(declare-fun c!142161 () Bool)

(declare-fun bm!70112 () Bool)

(declare-fun minValue!436 () V!59191)

(declare-fun call!70118 () ListLongMap!22205)

(declare-fun +!4949 (ListLongMap!22205 tuple2!24596) ListLongMap!22205)

(assert (=> bm!70112 (= call!70116 (+!4949 (ite c!142161 call!70118 (ite c!142163 call!70119 call!70117)) (ite (or c!142161 c!142163) (tuple2!24597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548284 () Bool)

(declare-fun res!1061050 () Bool)

(assert (=> b!1548284 (=> (not res!1061050) (not e!861820))))

(declare-datatypes ((List!36089 0))(
  ( (Nil!36086) (Cons!36085 (h!37530 (_ BitVec 64)) (t!50783 List!36089)) )
))
(declare-fun arrayNoDuplicates!0 (array!103322 (_ BitVec 32) List!36089) Bool)

(assert (=> b!1548284 (= res!1061050 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36086))))

(declare-fun b!1548285 () Bool)

(declare-fun e!861823 () ListLongMap!22205)

(assert (=> b!1548285 (= e!861823 call!70117)))

(declare-fun res!1061051 () Bool)

(assert (=> start!132072 (=> (not res!1061051) (not e!861820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132072 (= res!1061051 (validMask!0 mask!926))))

(assert (=> start!132072 e!861820))

(declare-fun array_inv!38771 (array!103322) Bool)

(assert (=> start!132072 (array_inv!38771 _keys!618)))

(declare-fun tp_is_empty!38061 () Bool)

(assert (=> start!132072 tp_is_empty!38061))

(assert (=> start!132072 true))

(assert (=> start!132072 tp!111607))

(declare-fun array_inv!38772 (array!103324) Bool)

(assert (=> start!132072 (and (array_inv!38772 _values!470) e!861822)))

(declare-fun b!1548286 () Bool)

(assert (=> b!1548286 (= e!861821 (not true))))

(declare-fun lt!667209 () V!59191)

(declare-fun lt!667208 () ListLongMap!22205)

(declare-fun apply!1067 (ListLongMap!22205 (_ BitVec 64)) V!59191)

(assert (=> b!1548286 (= (apply!1067 lt!667208 (select (arr!49863 _keys!618) from!762)) lt!667209)))

(declare-fun lt!667204 () ListLongMap!22205)

(declare-datatypes ((Unit!51584 0))(
  ( (Unit!51585) )
))
(declare-fun lt!667206 () Unit!51584)

(declare-fun addApplyDifferent!609 (ListLongMap!22205 (_ BitVec 64) V!59191 (_ BitVec 64)) Unit!51584)

(assert (=> b!1548286 (= lt!667206 (addApplyDifferent!609 lt!667204 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49863 _keys!618) from!762)))))

(declare-fun lt!667210 () V!59191)

(assert (=> b!1548286 (= lt!667210 lt!667209)))

(assert (=> b!1548286 (= lt!667209 (apply!1067 lt!667204 (select (arr!49863 _keys!618) from!762)))))

(assert (=> b!1548286 (= lt!667210 (apply!1067 (+!4949 lt!667204 (tuple2!24597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49863 _keys!618) from!762)))))

(declare-fun lt!667205 () Unit!51584)

(assert (=> b!1548286 (= lt!667205 (addApplyDifferent!609 lt!667204 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49863 _keys!618) from!762)))))

(declare-fun contains!10074 (ListLongMap!22205 (_ BitVec 64)) Bool)

(assert (=> b!1548286 (contains!10074 lt!667208 (select (arr!49863 _keys!618) from!762))))

(assert (=> b!1548286 (= lt!667208 (+!4949 lt!667204 (tuple2!24597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667211 () Unit!51584)

(declare-fun addStillContains!1262 (ListLongMap!22205 (_ BitVec 64) V!59191 (_ BitVec 64)) Unit!51584)

(assert (=> b!1548286 (= lt!667211 (addStillContains!1262 lt!667204 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49863 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6575 (array!103322 array!103324 (_ BitVec 32) (_ BitVec 32) V!59191 V!59191 (_ BitVec 32) Int) ListLongMap!22205)

(assert (=> b!1548286 (= lt!667204 (getCurrentListMapNoExtraKeys!6575 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70113 () Bool)

(assert (=> bm!70113 (= call!70119 call!70118)))

(declare-fun b!1548287 () Bool)

(declare-fun c!142162 () Bool)

(declare-fun lt!667203 () Bool)

(assert (=> b!1548287 (= c!142162 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667203))))

(declare-fun e!861824 () ListLongMap!22205)

(assert (=> b!1548287 (= e!861824 e!861823)))

(declare-fun bm!70114 () Bool)

(assert (=> bm!70114 (= call!70118 (getCurrentListMapNoExtraKeys!6575 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58795 () Bool)

(assert (=> mapIsEmpty!58795 mapRes!58795))

(declare-fun b!1548288 () Bool)

(declare-fun e!861825 () ListLongMap!22205)

(assert (=> b!1548288 (= e!861825 (+!4949 call!70116 (tuple2!24597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapNonEmpty!58795 () Bool)

(declare-fun tp!111606 () Bool)

(declare-fun e!861827 () Bool)

(assert (=> mapNonEmpty!58795 (= mapRes!58795 (and tp!111606 e!861827))))

(declare-fun mapRest!58795 () (Array (_ BitVec 32) ValueCell!18120))

(declare-fun mapValue!58795 () ValueCell!18120)

(declare-fun mapKey!58795 () (_ BitVec 32))

(assert (=> mapNonEmpty!58795 (= (arr!49864 _values!470) (store mapRest!58795 mapKey!58795 mapValue!58795))))

(declare-fun b!1548289 () Bool)

(declare-fun call!70115 () ListLongMap!22205)

(assert (=> b!1548289 (= e!861823 call!70115)))

(declare-fun b!1548290 () Bool)

(assert (=> b!1548290 (= e!861828 tp_is_empty!38061)))

(declare-fun b!1548291 () Bool)

(declare-fun res!1061049 () Bool)

(assert (=> b!1548291 (=> (not res!1061049) (not e!861820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103322 (_ BitVec 32)) Bool)

(assert (=> b!1548291 (= res!1061049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548292 () Bool)

(assert (=> b!1548292 (= e!861824 call!70115)))

(declare-fun b!1548293 () Bool)

(assert (=> b!1548293 (= e!861825 e!861824)))

(assert (=> b!1548293 (= c!142163 (and (not lt!667203) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548294 () Bool)

(assert (=> b!1548294 (= e!861820 e!861821)))

(declare-fun res!1061052 () Bool)

(assert (=> b!1548294 (=> (not res!1061052) (not e!861821))))

(assert (=> b!1548294 (= res!1061052 (bvslt from!762 (size!50413 _keys!618)))))

(declare-fun lt!667207 () ListLongMap!22205)

(assert (=> b!1548294 (= lt!667207 e!861825)))

(assert (=> b!1548294 (= c!142161 (and (not lt!667203) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548294 (= lt!667203 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70115 () Bool)

(assert (=> bm!70115 (= call!70117 call!70119)))

(declare-fun b!1548295 () Bool)

(assert (=> b!1548295 (= e!861827 tp_is_empty!38061)))

(declare-fun bm!70116 () Bool)

(assert (=> bm!70116 (= call!70115 call!70116)))

(declare-fun b!1548296 () Bool)

(declare-fun res!1061053 () Bool)

(assert (=> b!1548296 (=> (not res!1061053) (not e!861820))))

(assert (=> b!1548296 (= res!1061053 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50413 _keys!618))))))

(assert (= (and start!132072 res!1061051) b!1548283))

(assert (= (and b!1548283 res!1061054) b!1548291))

(assert (= (and b!1548291 res!1061049) b!1548284))

(assert (= (and b!1548284 res!1061050) b!1548296))

(assert (= (and b!1548296 res!1061053) b!1548294))

(assert (= (and b!1548294 c!142161) b!1548288))

(assert (= (and b!1548294 (not c!142161)) b!1548293))

(assert (= (and b!1548293 c!142163) b!1548292))

(assert (= (and b!1548293 (not c!142163)) b!1548287))

(assert (= (and b!1548287 c!142162) b!1548289))

(assert (= (and b!1548287 (not c!142162)) b!1548285))

(assert (= (or b!1548289 b!1548285) bm!70115))

(assert (= (or b!1548292 bm!70115) bm!70113))

(assert (= (or b!1548292 b!1548289) bm!70116))

(assert (= (or b!1548288 bm!70113) bm!70114))

(assert (= (or b!1548288 bm!70116) bm!70112))

(assert (= (and b!1548294 res!1061052) b!1548281))

(assert (= (and b!1548281 res!1061055) b!1548286))

(assert (= (and b!1548282 condMapEmpty!58795) mapIsEmpty!58795))

(assert (= (and b!1548282 (not condMapEmpty!58795)) mapNonEmpty!58795))

(get-info :version)

(assert (= (and mapNonEmpty!58795 ((_ is ValueCellFull!18120) mapValue!58795)) b!1548295))

(assert (= (and b!1548282 ((_ is ValueCellFull!18120) mapDefault!58795)) b!1548290))

(assert (= start!132072 b!1548282))

(declare-fun m!1427711 () Bool)

(assert (=> start!132072 m!1427711))

(declare-fun m!1427713 () Bool)

(assert (=> start!132072 m!1427713))

(declare-fun m!1427715 () Bool)

(assert (=> start!132072 m!1427715))

(declare-fun m!1427717 () Bool)

(assert (=> b!1548288 m!1427717))

(declare-fun m!1427719 () Bool)

(assert (=> mapNonEmpty!58795 m!1427719))

(declare-fun m!1427721 () Bool)

(assert (=> b!1548286 m!1427721))

(assert (=> b!1548286 m!1427721))

(declare-fun m!1427723 () Bool)

(assert (=> b!1548286 m!1427723))

(declare-fun m!1427725 () Bool)

(assert (=> b!1548286 m!1427725))

(assert (=> b!1548286 m!1427721))

(declare-fun m!1427727 () Bool)

(assert (=> b!1548286 m!1427727))

(assert (=> b!1548286 m!1427721))

(declare-fun m!1427729 () Bool)

(assert (=> b!1548286 m!1427729))

(declare-fun m!1427731 () Bool)

(assert (=> b!1548286 m!1427731))

(assert (=> b!1548286 m!1427721))

(declare-fun m!1427733 () Bool)

(assert (=> b!1548286 m!1427733))

(declare-fun m!1427735 () Bool)

(assert (=> b!1548286 m!1427735))

(assert (=> b!1548286 m!1427721))

(declare-fun m!1427737 () Bool)

(assert (=> b!1548286 m!1427737))

(assert (=> b!1548286 m!1427725))

(assert (=> b!1548286 m!1427721))

(declare-fun m!1427739 () Bool)

(assert (=> b!1548286 m!1427739))

(assert (=> b!1548286 m!1427721))

(declare-fun m!1427741 () Bool)

(assert (=> b!1548286 m!1427741))

(declare-fun m!1427743 () Bool)

(assert (=> b!1548284 m!1427743))

(assert (=> bm!70114 m!1427735))

(declare-fun m!1427745 () Bool)

(assert (=> bm!70112 m!1427745))

(assert (=> b!1548281 m!1427721))

(assert (=> b!1548281 m!1427721))

(declare-fun m!1427747 () Bool)

(assert (=> b!1548281 m!1427747))

(declare-fun m!1427749 () Bool)

(assert (=> b!1548291 m!1427749))

(check-sat (not bm!70112) (not b!1548291) tp_is_empty!38061 (not bm!70114) (not mapNonEmpty!58795) b_and!51195 (not start!132072) (not b_next!31785) (not b!1548281) (not b!1548288) (not b!1548286) (not b!1548284))
(check-sat b_and!51195 (not b_next!31785))
