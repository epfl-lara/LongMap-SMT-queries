; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132038 () Bool)

(assert start!132038)

(declare-fun b_free!31801 () Bool)

(declare-fun b_next!31801 () Bool)

(assert (=> start!132038 (= b_free!31801 (not b_next!31801))))

(declare-fun tp!111655 () Bool)

(declare-fun b_and!51193 () Bool)

(assert (=> start!132038 (= tp!111655 b_and!51193)))

(declare-fun b!1548352 () Bool)

(declare-fun res!1061089 () Bool)

(declare-fun e!861843 () Bool)

(assert (=> b!1548352 (=> (not res!1061089) (not e!861843))))

(declare-datatypes ((array!103280 0))(
  ( (array!103281 (arr!49843 (Array (_ BitVec 32) (_ BitVec 64))) (size!50395 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103280)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103280 (_ BitVec 32)) Bool)

(assert (=> b!1548352 (= res!1061089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548353 () Bool)

(declare-fun res!1061088 () Bool)

(assert (=> b!1548353 (=> (not res!1061088) (not e!861843))))

(declare-datatypes ((List!36149 0))(
  ( (Nil!36146) (Cons!36145 (h!37591 (_ BitVec 64)) (t!50835 List!36149)) )
))
(declare-fun arrayNoDuplicates!0 (array!103280 (_ BitVec 32) List!36149) Bool)

(assert (=> b!1548353 (= res!1061088 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36146))))

(declare-fun b!1548354 () Bool)

(declare-fun e!861838 () Bool)

(declare-fun tp_is_empty!38077 () Bool)

(assert (=> b!1548354 (= e!861838 tp_is_empty!38077)))

(declare-fun b!1548355 () Bool)

(declare-fun e!861839 () Bool)

(assert (=> b!1548355 (= e!861839 tp_is_empty!38077)))

(declare-fun b!1548357 () Bool)

(declare-fun c!142144 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667140 () Bool)

(assert (=> b!1548357 (= c!142144 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667140))))

(declare-datatypes ((V!59213 0))(
  ( (V!59214 (val!19116 Int)) )
))
(declare-datatypes ((tuple2!24686 0))(
  ( (tuple2!24687 (_1!12354 (_ BitVec 64)) (_2!12354 V!59213)) )
))
(declare-datatypes ((List!36150 0))(
  ( (Nil!36147) (Cons!36146 (h!37592 tuple2!24686) (t!50836 List!36150)) )
))
(declare-datatypes ((ListLongMap!22295 0))(
  ( (ListLongMap!22296 (toList!11163 List!36150)) )
))
(declare-fun e!861844 () ListLongMap!22295)

(declare-fun e!861840 () ListLongMap!22295)

(assert (=> b!1548357 (= e!861844 e!861840)))

(declare-fun c!142145 () Bool)

(declare-fun zeroValue!436 () V!59213)

(declare-fun c!142146 () Bool)

(declare-fun call!70202 () ListLongMap!22295)

(declare-fun minValue!436 () V!59213)

(declare-fun call!70200 () ListLongMap!22295)

(declare-fun call!70201 () ListLongMap!22295)

(declare-fun bm!70197 () Bool)

(declare-fun call!70203 () ListLongMap!22295)

(declare-fun +!4986 (ListLongMap!22295 tuple2!24686) ListLongMap!22295)

(assert (=> bm!70197 (= call!70202 (+!4986 (ite c!142146 call!70200 (ite c!142145 call!70201 call!70203)) (ite (or c!142146 c!142145) (tuple2!24687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24687 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548358 () Bool)

(declare-fun e!861842 () Bool)

(declare-fun mapRes!58819 () Bool)

(assert (=> b!1548358 (= e!861842 (and e!861839 mapRes!58819))))

(declare-fun condMapEmpty!58819 () Bool)

(declare-datatypes ((ValueCell!18128 0))(
  ( (ValueCellFull!18128 (v!21913 V!59213)) (EmptyCell!18128) )
))
(declare-datatypes ((array!103282 0))(
  ( (array!103283 (arr!49844 (Array (_ BitVec 32) ValueCell!18128)) (size!50396 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103282)

(declare-fun mapDefault!58819 () ValueCell!18128)

(assert (=> b!1548358 (= condMapEmpty!58819 (= (arr!49844 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18128)) mapDefault!58819)))))

(declare-fun b!1548359 () Bool)

(assert (=> b!1548359 (= e!861840 call!70203)))

(declare-fun b!1548360 () Bool)

(declare-fun res!1061093 () Bool)

(assert (=> b!1548360 (=> (not res!1061093) (not e!861843))))

(assert (=> b!1548360 (= res!1061093 (and (= (size!50396 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50395 _keys!618) (size!50396 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548361 () Bool)

(declare-fun e!861846 () Bool)

(assert (=> b!1548361 (= e!861846 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!667138 () ListLongMap!22295)

(declare-fun lt!667136 () V!59213)

(declare-fun apply!1065 (ListLongMap!22295 (_ BitVec 64)) V!59213)

(assert (=> b!1548361 (= (apply!1065 lt!667138 (select (arr!49843 _keys!618) from!762)) lt!667136)))

(declare-fun lt!667139 () ListLongMap!22295)

(declare-datatypes ((Unit!51427 0))(
  ( (Unit!51428) )
))
(declare-fun lt!667141 () Unit!51427)

(declare-fun addApplyDifferent!603 (ListLongMap!22295 (_ BitVec 64) V!59213 (_ BitVec 64)) Unit!51427)

(assert (=> b!1548361 (= lt!667141 (addApplyDifferent!603 lt!667139 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49843 _keys!618) from!762)))))

(declare-fun lt!667137 () V!59213)

(assert (=> b!1548361 (= lt!667137 lt!667136)))

(assert (=> b!1548361 (= lt!667136 (apply!1065 lt!667139 (select (arr!49843 _keys!618) from!762)))))

(assert (=> b!1548361 (= lt!667137 (apply!1065 (+!4986 lt!667139 (tuple2!24687 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49843 _keys!618) from!762)))))

(declare-fun lt!667133 () Unit!51427)

(assert (=> b!1548361 (= lt!667133 (addApplyDifferent!603 lt!667139 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49843 _keys!618) from!762)))))

(declare-fun contains!10040 (ListLongMap!22295 (_ BitVec 64)) Bool)

(assert (=> b!1548361 (contains!10040 lt!667138 (select (arr!49843 _keys!618) from!762))))

(assert (=> b!1548361 (= lt!667138 (+!4986 lt!667139 (tuple2!24687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667135 () Unit!51427)

(declare-fun addStillContains!1263 (ListLongMap!22295 (_ BitVec 64) V!59213 (_ BitVec 64)) Unit!51427)

(assert (=> b!1548361 (= lt!667135 (addStillContains!1263 lt!667139 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49843 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6612 (array!103280 array!103282 (_ BitVec 32) (_ BitVec 32) V!59213 V!59213 (_ BitVec 32) Int) ListLongMap!22295)

(assert (=> b!1548361 (= lt!667139 (getCurrentListMapNoExtraKeys!6612 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58819 () Bool)

(assert (=> mapIsEmpty!58819 mapRes!58819))

(declare-fun b!1548362 () Bool)

(assert (=> b!1548362 (= e!861843 e!861846)))

(declare-fun res!1061094 () Bool)

(assert (=> b!1548362 (=> (not res!1061094) (not e!861846))))

(assert (=> b!1548362 (= res!1061094 (bvslt from!762 (size!50395 _keys!618)))))

(declare-fun lt!667134 () ListLongMap!22295)

(declare-fun e!861841 () ListLongMap!22295)

(assert (=> b!1548362 (= lt!667134 e!861841)))

(assert (=> b!1548362 (= c!142146 (and (not lt!667140) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548362 (= lt!667140 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548363 () Bool)

(declare-fun call!70204 () ListLongMap!22295)

(assert (=> b!1548363 (= e!861840 call!70204)))

(declare-fun res!1061091 () Bool)

(assert (=> start!132038 (=> (not res!1061091) (not e!861843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132038 (= res!1061091 (validMask!0 mask!926))))

(assert (=> start!132038 e!861843))

(declare-fun array_inv!38963 (array!103280) Bool)

(assert (=> start!132038 (array_inv!38963 _keys!618)))

(assert (=> start!132038 tp_is_empty!38077))

(assert (=> start!132038 true))

(assert (=> start!132038 tp!111655))

(declare-fun array_inv!38964 (array!103282) Bool)

(assert (=> start!132038 (and (array_inv!38964 _values!470) e!861842)))

(declare-fun b!1548356 () Bool)

(assert (=> b!1548356 (= e!861841 e!861844)))

(assert (=> b!1548356 (= c!142145 (and (not lt!667140) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70198 () Bool)

(assert (=> bm!70198 (= call!70201 call!70200)))

(declare-fun bm!70199 () Bool)

(assert (=> bm!70199 (= call!70200 (getCurrentListMapNoExtraKeys!6612 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548364 () Bool)

(assert (=> b!1548364 (= e!861841 (+!4986 call!70202 (tuple2!24687 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548365 () Bool)

(assert (=> b!1548365 (= e!861844 call!70204)))

(declare-fun mapNonEmpty!58819 () Bool)

(declare-fun tp!111656 () Bool)

(assert (=> mapNonEmpty!58819 (= mapRes!58819 (and tp!111656 e!861838))))

(declare-fun mapRest!58819 () (Array (_ BitVec 32) ValueCell!18128))

(declare-fun mapValue!58819 () ValueCell!18128)

(declare-fun mapKey!58819 () (_ BitVec 32))

(assert (=> mapNonEmpty!58819 (= (arr!49844 _values!470) (store mapRest!58819 mapKey!58819 mapValue!58819))))

(declare-fun b!1548366 () Bool)

(declare-fun res!1061090 () Bool)

(assert (=> b!1548366 (=> (not res!1061090) (not e!861846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548366 (= res!1061090 (validKeyInArray!0 (select (arr!49843 _keys!618) from!762)))))

(declare-fun b!1548367 () Bool)

(declare-fun res!1061092 () Bool)

(assert (=> b!1548367 (=> (not res!1061092) (not e!861843))))

(assert (=> b!1548367 (= res!1061092 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50395 _keys!618))))))

(declare-fun bm!70200 () Bool)

(assert (=> bm!70200 (= call!70203 call!70201)))

(declare-fun bm!70201 () Bool)

(assert (=> bm!70201 (= call!70204 call!70202)))

(assert (= (and start!132038 res!1061091) b!1548360))

(assert (= (and b!1548360 res!1061093) b!1548352))

(assert (= (and b!1548352 res!1061089) b!1548353))

(assert (= (and b!1548353 res!1061088) b!1548367))

(assert (= (and b!1548367 res!1061092) b!1548362))

(assert (= (and b!1548362 c!142146) b!1548364))

(assert (= (and b!1548362 (not c!142146)) b!1548356))

(assert (= (and b!1548356 c!142145) b!1548365))

(assert (= (and b!1548356 (not c!142145)) b!1548357))

(assert (= (and b!1548357 c!142144) b!1548363))

(assert (= (and b!1548357 (not c!142144)) b!1548359))

(assert (= (or b!1548363 b!1548359) bm!70200))

(assert (= (or b!1548365 bm!70200) bm!70198))

(assert (= (or b!1548365 b!1548363) bm!70201))

(assert (= (or b!1548364 bm!70198) bm!70199))

(assert (= (or b!1548364 bm!70201) bm!70197))

(assert (= (and b!1548362 res!1061094) b!1548366))

(assert (= (and b!1548366 res!1061090) b!1548361))

(assert (= (and b!1548358 condMapEmpty!58819) mapIsEmpty!58819))

(assert (= (and b!1548358 (not condMapEmpty!58819)) mapNonEmpty!58819))

(get-info :version)

(assert (= (and mapNonEmpty!58819 ((_ is ValueCellFull!18128) mapValue!58819)) b!1548354))

(assert (= (and b!1548358 ((_ is ValueCellFull!18128) mapDefault!58819)) b!1548355))

(assert (= start!132038 b!1548358))

(declare-fun m!1427139 () Bool)

(assert (=> b!1548361 m!1427139))

(declare-fun m!1427141 () Bool)

(assert (=> b!1548361 m!1427141))

(declare-fun m!1427143 () Bool)

(assert (=> b!1548361 m!1427143))

(assert (=> b!1548361 m!1427139))

(declare-fun m!1427145 () Bool)

(assert (=> b!1548361 m!1427145))

(declare-fun m!1427147 () Bool)

(assert (=> b!1548361 m!1427147))

(assert (=> b!1548361 m!1427147))

(assert (=> b!1548361 m!1427139))

(declare-fun m!1427149 () Bool)

(assert (=> b!1548361 m!1427149))

(assert (=> b!1548361 m!1427139))

(declare-fun m!1427151 () Bool)

(assert (=> b!1548361 m!1427151))

(assert (=> b!1548361 m!1427139))

(declare-fun m!1427153 () Bool)

(assert (=> b!1548361 m!1427153))

(assert (=> b!1548361 m!1427139))

(declare-fun m!1427155 () Bool)

(assert (=> b!1548361 m!1427155))

(assert (=> b!1548361 m!1427139))

(declare-fun m!1427157 () Bool)

(assert (=> b!1548361 m!1427157))

(assert (=> b!1548361 m!1427139))

(declare-fun m!1427159 () Bool)

(assert (=> b!1548361 m!1427159))

(assert (=> b!1548366 m!1427139))

(assert (=> b!1548366 m!1427139))

(declare-fun m!1427161 () Bool)

(assert (=> b!1548366 m!1427161))

(assert (=> bm!70199 m!1427143))

(declare-fun m!1427163 () Bool)

(assert (=> b!1548353 m!1427163))

(declare-fun m!1427165 () Bool)

(assert (=> b!1548352 m!1427165))

(declare-fun m!1427167 () Bool)

(assert (=> mapNonEmpty!58819 m!1427167))

(declare-fun m!1427169 () Bool)

(assert (=> b!1548364 m!1427169))

(declare-fun m!1427171 () Bool)

(assert (=> start!132038 m!1427171))

(declare-fun m!1427173 () Bool)

(assert (=> start!132038 m!1427173))

(declare-fun m!1427175 () Bool)

(assert (=> start!132038 m!1427175))

(declare-fun m!1427177 () Bool)

(assert (=> bm!70197 m!1427177))

(check-sat (not bm!70199) (not b!1548352) (not b!1548361) (not mapNonEmpty!58819) (not start!132038) (not b!1548366) (not bm!70197) (not b_next!31801) (not b!1548364) b_and!51193 (not b!1548353) tp_is_empty!38077)
(check-sat b_and!51193 (not b_next!31801))
