; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4326 () Bool)

(assert start!4326)

(declare-fun b_free!1177 () Bool)

(declare-fun b_next!1177 () Bool)

(assert (=> start!4326 (= b_free!1177 (not b_next!1177))))

(declare-fun tp!4960 () Bool)

(declare-fun b_and!1987 () Bool)

(assert (=> start!4326 (= tp!4960 b_and!1987)))

(declare-fun b!33378 () Bool)

(declare-fun e!21190 () Bool)

(declare-fun tp_is_empty!1531 () Bool)

(assert (=> b!33378 (= e!21190 tp_is_empty!1531)))

(declare-fun b!33379 () Bool)

(declare-fun e!21191 () Bool)

(assert (=> b!33379 (= e!21191 tp_is_empty!1531)))

(declare-fun b!33380 () Bool)

(declare-fun e!21189 () Bool)

(declare-fun e!21192 () Bool)

(assert (=> b!33380 (= e!21189 e!21192)))

(declare-fun res!20294 () Bool)

(assert (=> b!33380 (=> (not res!20294) (not e!21192))))

(declare-datatypes ((V!1867 0))(
  ( (V!1868 (val!792 Int)) )
))
(declare-datatypes ((tuple2!1288 0))(
  ( (tuple2!1289 (_1!655 (_ BitVec 64)) (_2!655 V!1867)) )
))
(declare-datatypes ((List!871 0))(
  ( (Nil!868) (Cons!867 (h!1434 tuple2!1288) (t!3563 List!871)) )
))
(declare-datatypes ((ListLongMap!853 0))(
  ( (ListLongMap!854 (toList!442 List!871)) )
))
(declare-fun lt!12181 () ListLongMap!853)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!386 (ListLongMap!853 (_ BitVec 64)) Bool)

(assert (=> b!33380 (= res!20294 (not (contains!386 lt!12181 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!566 0))(
  ( (ValueCellFull!566 (v!1883 V!1867)) (EmptyCell!566) )
))
(declare-datatypes ((array!2249 0))(
  ( (array!2250 (arr!1075 (Array (_ BitVec 32) ValueCell!566)) (size!1176 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2249)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2251 0))(
  ( (array!2252 (arr!1076 (Array (_ BitVec 32) (_ BitVec 64))) (size!1177 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2251)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1867)

(declare-fun minValue!1443 () V!1867)

(declare-fun getCurrentListMap!262 (array!2251 array!2249 (_ BitVec 32) (_ BitVec 32) V!1867 V!1867 (_ BitVec 32) Int) ListLongMap!853)

(assert (=> b!33380 (= lt!12181 (getCurrentListMap!262 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33381 () Bool)

(declare-fun res!20296 () Bool)

(assert (=> b!33381 (=> (not res!20296) (not e!21189))))

(declare-datatypes ((List!872 0))(
  ( (Nil!869) (Cons!868 (h!1435 (_ BitVec 64)) (t!3564 List!872)) )
))
(declare-fun arrayNoDuplicates!0 (array!2251 (_ BitVec 32) List!872) Bool)

(assert (=> b!33381 (= res!20296 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!869))))

(declare-fun b!33382 () Bool)

(declare-fun e!21187 () Bool)

(declare-fun mapRes!1834 () Bool)

(assert (=> b!33382 (= e!21187 (and e!21190 mapRes!1834))))

(declare-fun condMapEmpty!1834 () Bool)

(declare-fun mapDefault!1834 () ValueCell!566)

(assert (=> b!33382 (= condMapEmpty!1834 (= (arr!1075 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!566)) mapDefault!1834)))))

(declare-fun b!33383 () Bool)

(assert (=> b!33383 (= e!21192 (not (or (not (= (size!1177 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))) (bvsle #b00000000000000000000000000000000 (size!1177 _keys!1833)))))))

(declare-datatypes ((SeekEntryResult!137 0))(
  ( (MissingZero!137 (index!2670 (_ BitVec 32))) (Found!137 (index!2671 (_ BitVec 32))) (Intermediate!137 (undefined!949 Bool) (index!2672 (_ BitVec 32)) (x!6829 (_ BitVec 32))) (Undefined!137) (MissingVacant!137 (index!2673 (_ BitVec 32))) )
))
(declare-fun lt!12178 () SeekEntryResult!137)

(declare-fun lt!12179 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33383 (and ((_ is Found!137) lt!12178) (= (index!2671 lt!12178) lt!12179))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2251 (_ BitVec 32)) SeekEntryResult!137)

(assert (=> b!33383 (= lt!12178 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!747 0))(
  ( (Unit!748) )
))
(declare-fun lt!12182 () Unit!747)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2251 (_ BitVec 32)) Unit!747)

(assert (=> b!33383 (= lt!12182 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12179 _keys!1833 mask!2294))))

(assert (=> b!33383 (contains!386 lt!12181 (select (arr!1076 _keys!1833) lt!12179))))

(declare-fun lt!12180 () Unit!747)

(declare-fun lemmaValidKeyInArrayIsInListMap!58 (array!2251 array!2249 (_ BitVec 32) (_ BitVec 32) V!1867 V!1867 (_ BitVec 32) Int) Unit!747)

(assert (=> b!33383 (= lt!12180 (lemmaValidKeyInArrayIsInListMap!58 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12179 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2251 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33383 (= lt!12179 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33384 () Bool)

(declare-fun res!20295 () Bool)

(assert (=> b!33384 (=> (not res!20295) (not e!21192))))

(declare-fun arrayContainsKey!0 (array!2251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33384 (= res!20295 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33385 () Bool)

(declare-fun res!20291 () Bool)

(assert (=> b!33385 (=> (not res!20291) (not e!21189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2251 (_ BitVec 32)) Bool)

(assert (=> b!33385 (= res!20291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33386 () Bool)

(declare-fun res!20297 () Bool)

(assert (=> b!33386 (=> (not res!20297) (not e!21189))))

(assert (=> b!33386 (= res!20297 (and (= (size!1176 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1177 _keys!1833) (size!1176 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!20292 () Bool)

(assert (=> start!4326 (=> (not res!20292) (not e!21189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4326 (= res!20292 (validMask!0 mask!2294))))

(assert (=> start!4326 e!21189))

(assert (=> start!4326 true))

(assert (=> start!4326 tp!4960))

(declare-fun array_inv!763 (array!2249) Bool)

(assert (=> start!4326 (and (array_inv!763 _values!1501) e!21187)))

(declare-fun array_inv!764 (array!2251) Bool)

(assert (=> start!4326 (array_inv!764 _keys!1833)))

(assert (=> start!4326 tp_is_empty!1531))

(declare-fun mapIsEmpty!1834 () Bool)

(assert (=> mapIsEmpty!1834 mapRes!1834))

(declare-fun mapNonEmpty!1834 () Bool)

(declare-fun tp!4959 () Bool)

(assert (=> mapNonEmpty!1834 (= mapRes!1834 (and tp!4959 e!21191))))

(declare-fun mapKey!1834 () (_ BitVec 32))

(declare-fun mapRest!1834 () (Array (_ BitVec 32) ValueCell!566))

(declare-fun mapValue!1834 () ValueCell!566)

(assert (=> mapNonEmpty!1834 (= (arr!1075 _values!1501) (store mapRest!1834 mapKey!1834 mapValue!1834))))

(declare-fun b!33387 () Bool)

(declare-fun res!20293 () Bool)

(assert (=> b!33387 (=> (not res!20293) (not e!21189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33387 (= res!20293 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4326 res!20292) b!33386))

(assert (= (and b!33386 res!20297) b!33385))

(assert (= (and b!33385 res!20291) b!33381))

(assert (= (and b!33381 res!20296) b!33387))

(assert (= (and b!33387 res!20293) b!33380))

(assert (= (and b!33380 res!20294) b!33384))

(assert (= (and b!33384 res!20295) b!33383))

(assert (= (and b!33382 condMapEmpty!1834) mapIsEmpty!1834))

(assert (= (and b!33382 (not condMapEmpty!1834)) mapNonEmpty!1834))

(assert (= (and mapNonEmpty!1834 ((_ is ValueCellFull!566) mapValue!1834)) b!33379))

(assert (= (and b!33382 ((_ is ValueCellFull!566) mapDefault!1834)) b!33378))

(assert (= start!4326 b!33382))

(declare-fun m!26765 () Bool)

(assert (=> b!33380 m!26765))

(declare-fun m!26767 () Bool)

(assert (=> b!33380 m!26767))

(declare-fun m!26769 () Bool)

(assert (=> mapNonEmpty!1834 m!26769))

(declare-fun m!26771 () Bool)

(assert (=> b!33385 m!26771))

(declare-fun m!26773 () Bool)

(assert (=> b!33381 m!26773))

(declare-fun m!26775 () Bool)

(assert (=> b!33387 m!26775))

(declare-fun m!26777 () Bool)

(assert (=> start!4326 m!26777))

(declare-fun m!26779 () Bool)

(assert (=> start!4326 m!26779))

(declare-fun m!26781 () Bool)

(assert (=> start!4326 m!26781))

(declare-fun m!26783 () Bool)

(assert (=> b!33384 m!26783))

(declare-fun m!26785 () Bool)

(assert (=> b!33383 m!26785))

(declare-fun m!26787 () Bool)

(assert (=> b!33383 m!26787))

(declare-fun m!26789 () Bool)

(assert (=> b!33383 m!26789))

(declare-fun m!26791 () Bool)

(assert (=> b!33383 m!26791))

(declare-fun m!26793 () Bool)

(assert (=> b!33383 m!26793))

(declare-fun m!26795 () Bool)

(assert (=> b!33383 m!26795))

(assert (=> b!33383 m!26793))

(check-sat (not mapNonEmpty!1834) b_and!1987 (not b_next!1177) (not b!33387) (not start!4326) (not b!33383) (not b!33384) (not b!33380) tp_is_empty!1531 (not b!33385) (not b!33381))
(check-sat b_and!1987 (not b_next!1177))
(get-model)

(declare-fun b!33458 () Bool)

(declare-fun e!21240 () Bool)

(declare-fun e!21237 () Bool)

(assert (=> b!33458 (= e!21240 e!21237)))

(declare-fun c!3829 () Bool)

(assert (=> b!33458 (= c!3829 (validKeyInArray!0 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5123 () Bool)

(declare-fun res!20347 () Bool)

(declare-fun e!21239 () Bool)

(assert (=> d!5123 (=> res!20347 e!21239)))

(assert (=> d!5123 (= res!20347 (bvsge #b00000000000000000000000000000000 (size!1177 _keys!1833)))))

(assert (=> d!5123 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!869) e!21239)))

(declare-fun b!33459 () Bool)

(declare-fun call!2672 () Bool)

(assert (=> b!33459 (= e!21237 call!2672)))

(declare-fun bm!2669 () Bool)

(assert (=> bm!2669 (= call!2672 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3829 (Cons!868 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000) Nil!869) Nil!869)))))

(declare-fun b!33460 () Bool)

(assert (=> b!33460 (= e!21239 e!21240)))

(declare-fun res!20346 () Bool)

(assert (=> b!33460 (=> (not res!20346) (not e!21240))))

(declare-fun e!21238 () Bool)

(assert (=> b!33460 (= res!20346 (not e!21238))))

(declare-fun res!20348 () Bool)

(assert (=> b!33460 (=> (not res!20348) (not e!21238))))

(assert (=> b!33460 (= res!20348 (validKeyInArray!0 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33461 () Bool)

(assert (=> b!33461 (= e!21237 call!2672)))

(declare-fun b!33462 () Bool)

(declare-fun contains!389 (List!872 (_ BitVec 64)) Bool)

(assert (=> b!33462 (= e!21238 (contains!389 Nil!869 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5123 (not res!20347)) b!33460))

(assert (= (and b!33460 res!20348) b!33462))

(assert (= (and b!33460 res!20346) b!33458))

(assert (= (and b!33458 c!3829) b!33459))

(assert (= (and b!33458 (not c!3829)) b!33461))

(assert (= (or b!33459 b!33461) bm!2669))

(declare-fun m!26861 () Bool)

(assert (=> b!33458 m!26861))

(assert (=> b!33458 m!26861))

(declare-fun m!26863 () Bool)

(assert (=> b!33458 m!26863))

(assert (=> bm!2669 m!26861))

(declare-fun m!26865 () Bool)

(assert (=> bm!2669 m!26865))

(assert (=> b!33460 m!26861))

(assert (=> b!33460 m!26861))

(assert (=> b!33460 m!26863))

(assert (=> b!33462 m!26861))

(assert (=> b!33462 m!26861))

(declare-fun m!26867 () Bool)

(assert (=> b!33462 m!26867))

(assert (=> b!33381 d!5123))

(declare-fun d!5125 () Bool)

(declare-fun e!21245 () Bool)

(assert (=> d!5125 e!21245))

(declare-fun res!20351 () Bool)

(assert (=> d!5125 (=> res!20351 e!21245)))

(declare-fun lt!12221 () Bool)

(assert (=> d!5125 (= res!20351 (not lt!12221))))

(declare-fun lt!12222 () Bool)

(assert (=> d!5125 (= lt!12221 lt!12222)))

(declare-fun lt!12223 () Unit!747)

(declare-fun e!21246 () Unit!747)

(assert (=> d!5125 (= lt!12223 e!21246)))

(declare-fun c!3832 () Bool)

(assert (=> d!5125 (= c!3832 lt!12222)))

(declare-fun containsKey!31 (List!871 (_ BitVec 64)) Bool)

(assert (=> d!5125 (= lt!12222 (containsKey!31 (toList!442 lt!12181) k0!1304))))

(assert (=> d!5125 (= (contains!386 lt!12181 k0!1304) lt!12221)))

(declare-fun b!33469 () Bool)

(declare-fun lt!12224 () Unit!747)

(assert (=> b!33469 (= e!21246 lt!12224)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!28 (List!871 (_ BitVec 64)) Unit!747)

(assert (=> b!33469 (= lt!12224 (lemmaContainsKeyImpliesGetValueByKeyDefined!28 (toList!442 lt!12181) k0!1304))))

(declare-datatypes ((Option!73 0))(
  ( (Some!72 (v!1886 V!1867)) (None!71) )
))
(declare-fun isDefined!29 (Option!73) Bool)

(declare-fun getValueByKey!67 (List!871 (_ BitVec 64)) Option!73)

(assert (=> b!33469 (isDefined!29 (getValueByKey!67 (toList!442 lt!12181) k0!1304))))

(declare-fun b!33470 () Bool)

(declare-fun Unit!751 () Unit!747)

(assert (=> b!33470 (= e!21246 Unit!751)))

(declare-fun b!33471 () Bool)

(assert (=> b!33471 (= e!21245 (isDefined!29 (getValueByKey!67 (toList!442 lt!12181) k0!1304)))))

(assert (= (and d!5125 c!3832) b!33469))

(assert (= (and d!5125 (not c!3832)) b!33470))

(assert (= (and d!5125 (not res!20351)) b!33471))

(declare-fun m!26869 () Bool)

(assert (=> d!5125 m!26869))

(declare-fun m!26871 () Bool)

(assert (=> b!33469 m!26871))

(declare-fun m!26873 () Bool)

(assert (=> b!33469 m!26873))

(assert (=> b!33469 m!26873))

(declare-fun m!26875 () Bool)

(assert (=> b!33469 m!26875))

(assert (=> b!33471 m!26873))

(assert (=> b!33471 m!26873))

(assert (=> b!33471 m!26875))

(assert (=> b!33380 d!5125))

(declare-fun b!33514 () Bool)

(declare-fun e!21282 () Bool)

(declare-fun lt!12269 () ListLongMap!853)

(declare-fun apply!36 (ListLongMap!853 (_ BitVec 64)) V!1867)

(assert (=> b!33514 (= e!21282 (= (apply!36 lt!12269 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun call!2693 () ListLongMap!853)

(declare-fun c!3848 () Bool)

(declare-fun call!2688 () ListLongMap!853)

(declare-fun c!3849 () Bool)

(declare-fun bm!2684 () Bool)

(declare-fun call!2687 () ListLongMap!853)

(declare-fun call!2689 () ListLongMap!853)

(declare-fun +!54 (ListLongMap!853 tuple2!1288) ListLongMap!853)

(assert (=> bm!2684 (= call!2689 (+!54 (ite c!3848 call!2693 (ite c!3849 call!2687 call!2688)) (ite (or c!3848 c!3849) (tuple2!1289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!33515 () Bool)

(declare-fun e!21284 () Bool)

(assert (=> b!33515 (= e!21284 (= (apply!36 lt!12269 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!33516 () Bool)

(declare-fun e!21285 () ListLongMap!853)

(assert (=> b!33516 (= e!21285 call!2688)))

(declare-fun b!33518 () Bool)

(declare-fun e!21279 () Bool)

(assert (=> b!33518 (= e!21279 (validKeyInArray!0 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun e!21278 () Bool)

(declare-fun b!33519 () Bool)

(declare-fun get!571 (ValueCell!566 V!1867) V!1867)

(declare-fun dynLambda!152 (Int (_ BitVec 64)) V!1867)

(assert (=> b!33519 (= e!21278 (= (apply!36 lt!12269 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000)) (get!571 (select (arr!1075 _values!1501) #b00000000000000000000000000000000) (dynLambda!152 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1176 _values!1501)))))

(assert (=> b!33519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1177 _keys!1833)))))

(declare-fun b!33520 () Bool)

(declare-fun res!20375 () Bool)

(declare-fun e!21273 () Bool)

(assert (=> b!33520 (=> (not res!20375) (not e!21273))))

(declare-fun e!21283 () Bool)

(assert (=> b!33520 (= res!20375 e!21283)))

(declare-fun res!20376 () Bool)

(assert (=> b!33520 (=> res!20376 e!21283)))

(assert (=> b!33520 (= res!20376 (not e!21279))))

(declare-fun res!20370 () Bool)

(assert (=> b!33520 (=> (not res!20370) (not e!21279))))

(assert (=> b!33520 (= res!20370 (bvslt #b00000000000000000000000000000000 (size!1177 _keys!1833)))))

(declare-fun b!33521 () Bool)

(declare-fun e!21280 () Bool)

(assert (=> b!33521 (= e!21273 e!21280)))

(declare-fun c!3845 () Bool)

(assert (=> b!33521 (= c!3845 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!33522 () Bool)

(declare-fun e!21274 () Bool)

(declare-fun call!2690 () Bool)

(assert (=> b!33522 (= e!21274 (not call!2690))))

(declare-fun b!33523 () Bool)

(declare-fun e!21275 () Unit!747)

(declare-fun lt!12287 () Unit!747)

(assert (=> b!33523 (= e!21275 lt!12287)))

(declare-fun lt!12282 () ListLongMap!853)

(declare-fun getCurrentListMapNoExtraKeys!23 (array!2251 array!2249 (_ BitVec 32) (_ BitVec 32) V!1867 V!1867 (_ BitVec 32) Int) ListLongMap!853)

(assert (=> b!33523 (= lt!12282 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12277 () (_ BitVec 64))

(assert (=> b!33523 (= lt!12277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12286 () (_ BitVec 64))

(assert (=> b!33523 (= lt!12286 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12273 () Unit!747)

(declare-fun addStillContains!21 (ListLongMap!853 (_ BitVec 64) V!1867 (_ BitVec 64)) Unit!747)

(assert (=> b!33523 (= lt!12273 (addStillContains!21 lt!12282 lt!12277 zeroValue!1443 lt!12286))))

(assert (=> b!33523 (contains!386 (+!54 lt!12282 (tuple2!1289 lt!12277 zeroValue!1443)) lt!12286)))

(declare-fun lt!12281 () Unit!747)

(assert (=> b!33523 (= lt!12281 lt!12273)))

(declare-fun lt!12280 () ListLongMap!853)

(assert (=> b!33523 (= lt!12280 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12290 () (_ BitVec 64))

(assert (=> b!33523 (= lt!12290 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12279 () (_ BitVec 64))

(assert (=> b!33523 (= lt!12279 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12285 () Unit!747)

(declare-fun addApplyDifferent!21 (ListLongMap!853 (_ BitVec 64) V!1867 (_ BitVec 64)) Unit!747)

(assert (=> b!33523 (= lt!12285 (addApplyDifferent!21 lt!12280 lt!12290 minValue!1443 lt!12279))))

(assert (=> b!33523 (= (apply!36 (+!54 lt!12280 (tuple2!1289 lt!12290 minValue!1443)) lt!12279) (apply!36 lt!12280 lt!12279))))

(declare-fun lt!12278 () Unit!747)

(assert (=> b!33523 (= lt!12278 lt!12285)))

(declare-fun lt!12288 () ListLongMap!853)

(assert (=> b!33523 (= lt!12288 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12270 () (_ BitVec 64))

(assert (=> b!33523 (= lt!12270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12289 () (_ BitVec 64))

(assert (=> b!33523 (= lt!12289 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12283 () Unit!747)

(assert (=> b!33523 (= lt!12283 (addApplyDifferent!21 lt!12288 lt!12270 zeroValue!1443 lt!12289))))

(assert (=> b!33523 (= (apply!36 (+!54 lt!12288 (tuple2!1289 lt!12270 zeroValue!1443)) lt!12289) (apply!36 lt!12288 lt!12289))))

(declare-fun lt!12276 () Unit!747)

(assert (=> b!33523 (= lt!12276 lt!12283)))

(declare-fun lt!12272 () ListLongMap!853)

(assert (=> b!33523 (= lt!12272 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12274 () (_ BitVec 64))

(assert (=> b!33523 (= lt!12274 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12284 () (_ BitVec 64))

(assert (=> b!33523 (= lt!12284 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!33523 (= lt!12287 (addApplyDifferent!21 lt!12272 lt!12274 minValue!1443 lt!12284))))

(assert (=> b!33523 (= (apply!36 (+!54 lt!12272 (tuple2!1289 lt!12274 minValue!1443)) lt!12284) (apply!36 lt!12272 lt!12284))))

(declare-fun b!33524 () Bool)

(assert (=> b!33524 (= e!21280 e!21282)))

(declare-fun res!20372 () Bool)

(declare-fun call!2691 () Bool)

(assert (=> b!33524 (= res!20372 call!2691)))

(assert (=> b!33524 (=> (not res!20372) (not e!21282))))

(declare-fun bm!2685 () Bool)

(assert (=> bm!2685 (= call!2691 (contains!386 lt!12269 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2686 () Bool)

(assert (=> bm!2686 (= call!2688 call!2687)))

(declare-fun bm!2687 () Bool)

(assert (=> bm!2687 (= call!2693 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun bm!2688 () Bool)

(assert (=> bm!2688 (= call!2687 call!2693)))

(declare-fun b!33525 () Bool)

(assert (=> b!33525 (= e!21274 e!21284)))

(declare-fun res!20378 () Bool)

(assert (=> b!33525 (= res!20378 call!2690)))

(assert (=> b!33525 (=> (not res!20378) (not e!21284))))

(declare-fun b!33526 () Bool)

(assert (=> b!33526 (= e!21283 e!21278)))

(declare-fun res!20373 () Bool)

(assert (=> b!33526 (=> (not res!20373) (not e!21278))))

(assert (=> b!33526 (= res!20373 (contains!386 lt!12269 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!33526 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1177 _keys!1833)))))

(declare-fun bm!2689 () Bool)

(assert (=> bm!2689 (= call!2690 (contains!386 lt!12269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!33527 () Bool)

(declare-fun e!21281 () ListLongMap!853)

(declare-fun call!2692 () ListLongMap!853)

(assert (=> b!33527 (= e!21281 call!2692)))

(declare-fun b!33528 () Bool)

(declare-fun res!20374 () Bool)

(assert (=> b!33528 (=> (not res!20374) (not e!21273))))

(assert (=> b!33528 (= res!20374 e!21274)))

(declare-fun c!3847 () Bool)

(assert (=> b!33528 (= c!3847 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!33529 () Bool)

(declare-fun e!21276 () ListLongMap!853)

(assert (=> b!33529 (= e!21276 e!21281)))

(assert (=> b!33529 (= c!3849 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!33530 () Bool)

(assert (=> b!33530 (= e!21276 (+!54 call!2689 (tuple2!1289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!33531 () Bool)

(declare-fun Unit!752 () Unit!747)

(assert (=> b!33531 (= e!21275 Unit!752)))

(declare-fun d!5127 () Bool)

(assert (=> d!5127 e!21273))

(declare-fun res!20377 () Bool)

(assert (=> d!5127 (=> (not res!20377) (not e!21273))))

(assert (=> d!5127 (= res!20377 (or (bvsge #b00000000000000000000000000000000 (size!1177 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1177 _keys!1833)))))))

(declare-fun lt!12271 () ListLongMap!853)

(assert (=> d!5127 (= lt!12269 lt!12271)))

(declare-fun lt!12275 () Unit!747)

(assert (=> d!5127 (= lt!12275 e!21275)))

(declare-fun c!3846 () Bool)

(declare-fun e!21277 () Bool)

(assert (=> d!5127 (= c!3846 e!21277)))

(declare-fun res!20371 () Bool)

(assert (=> d!5127 (=> (not res!20371) (not e!21277))))

(assert (=> d!5127 (= res!20371 (bvslt #b00000000000000000000000000000000 (size!1177 _keys!1833)))))

(assert (=> d!5127 (= lt!12271 e!21276)))

(assert (=> d!5127 (= c!3848 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5127 (validMask!0 mask!2294)))

(assert (=> d!5127 (= (getCurrentListMap!262 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12269)))

(declare-fun b!33517 () Bool)

(declare-fun c!3850 () Bool)

(assert (=> b!33517 (= c!3850 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!33517 (= e!21281 e!21285)))

(declare-fun bm!2690 () Bool)

(assert (=> bm!2690 (= call!2692 call!2689)))

(declare-fun b!33532 () Bool)

(assert (=> b!33532 (= e!21277 (validKeyInArray!0 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33533 () Bool)

(assert (=> b!33533 (= e!21285 call!2692)))

(declare-fun b!33534 () Bool)

(assert (=> b!33534 (= e!21280 (not call!2691))))

(assert (= (and d!5127 c!3848) b!33530))

(assert (= (and d!5127 (not c!3848)) b!33529))

(assert (= (and b!33529 c!3849) b!33527))

(assert (= (and b!33529 (not c!3849)) b!33517))

(assert (= (and b!33517 c!3850) b!33533))

(assert (= (and b!33517 (not c!3850)) b!33516))

(assert (= (or b!33533 b!33516) bm!2686))

(assert (= (or b!33527 bm!2686) bm!2688))

(assert (= (or b!33527 b!33533) bm!2690))

(assert (= (or b!33530 bm!2688) bm!2687))

(assert (= (or b!33530 bm!2690) bm!2684))

(assert (= (and d!5127 res!20371) b!33532))

(assert (= (and d!5127 c!3846) b!33523))

(assert (= (and d!5127 (not c!3846)) b!33531))

(assert (= (and d!5127 res!20377) b!33520))

(assert (= (and b!33520 res!20370) b!33518))

(assert (= (and b!33520 (not res!20376)) b!33526))

(assert (= (and b!33526 res!20373) b!33519))

(assert (= (and b!33520 res!20375) b!33528))

(assert (= (and b!33528 c!3847) b!33525))

(assert (= (and b!33528 (not c!3847)) b!33522))

(assert (= (and b!33525 res!20378) b!33515))

(assert (= (or b!33525 b!33522) bm!2689))

(assert (= (and b!33528 res!20374) b!33521))

(assert (= (and b!33521 c!3845) b!33524))

(assert (= (and b!33521 (not c!3845)) b!33534))

(assert (= (and b!33524 res!20372) b!33514))

(assert (= (or b!33524 b!33534) bm!2685))

(declare-fun b_lambda!1695 () Bool)

(assert (=> (not b_lambda!1695) (not b!33519)))

(declare-fun t!3570 () Bool)

(declare-fun tb!681 () Bool)

(assert (=> (and start!4326 (= defaultEntry!1504 defaultEntry!1504) t!3570) tb!681))

(declare-fun result!1165 () Bool)

(assert (=> tb!681 (= result!1165 tp_is_empty!1531)))

(assert (=> b!33519 t!3570))

(declare-fun b_and!1993 () Bool)

(assert (= b_and!1987 (and (=> t!3570 result!1165) b_and!1993)))

(declare-fun m!26877 () Bool)

(assert (=> b!33523 m!26877))

(declare-fun m!26879 () Bool)

(assert (=> b!33523 m!26879))

(declare-fun m!26881 () Bool)

(assert (=> b!33523 m!26881))

(declare-fun m!26883 () Bool)

(assert (=> b!33523 m!26883))

(declare-fun m!26885 () Bool)

(assert (=> b!33523 m!26885))

(declare-fun m!26887 () Bool)

(assert (=> b!33523 m!26887))

(assert (=> b!33523 m!26877))

(declare-fun m!26889 () Bool)

(assert (=> b!33523 m!26889))

(assert (=> b!33523 m!26861))

(assert (=> b!33523 m!26889))

(declare-fun m!26891 () Bool)

(assert (=> b!33523 m!26891))

(declare-fun m!26893 () Bool)

(assert (=> b!33523 m!26893))

(declare-fun m!26895 () Bool)

(assert (=> b!33523 m!26895))

(assert (=> b!33523 m!26881))

(declare-fun m!26897 () Bool)

(assert (=> b!33523 m!26897))

(declare-fun m!26899 () Bool)

(assert (=> b!33523 m!26899))

(declare-fun m!26901 () Bool)

(assert (=> b!33523 m!26901))

(assert (=> b!33523 m!26893))

(declare-fun m!26903 () Bool)

(assert (=> b!33523 m!26903))

(declare-fun m!26905 () Bool)

(assert (=> b!33523 m!26905))

(declare-fun m!26907 () Bool)

(assert (=> b!33523 m!26907))

(assert (=> b!33532 m!26861))

(assert (=> b!33532 m!26861))

(assert (=> b!33532 m!26863))

(assert (=> bm!2687 m!26901))

(declare-fun m!26909 () Bool)

(assert (=> b!33530 m!26909))

(declare-fun m!26911 () Bool)

(assert (=> b!33519 m!26911))

(declare-fun m!26913 () Bool)

(assert (=> b!33519 m!26913))

(declare-fun m!26915 () Bool)

(assert (=> b!33519 m!26915))

(assert (=> b!33519 m!26861))

(declare-fun m!26917 () Bool)

(assert (=> b!33519 m!26917))

(assert (=> b!33519 m!26913))

(assert (=> b!33519 m!26911))

(assert (=> b!33519 m!26861))

(assert (=> b!33518 m!26861))

(assert (=> b!33518 m!26861))

(assert (=> b!33518 m!26863))

(assert (=> d!5127 m!26777))

(declare-fun m!26919 () Bool)

(assert (=> bm!2689 m!26919))

(declare-fun m!26921 () Bool)

(assert (=> b!33515 m!26921))

(declare-fun m!26923 () Bool)

(assert (=> bm!2685 m!26923))

(assert (=> b!33526 m!26861))

(assert (=> b!33526 m!26861))

(declare-fun m!26925 () Bool)

(assert (=> b!33526 m!26925))

(declare-fun m!26927 () Bool)

(assert (=> b!33514 m!26927))

(declare-fun m!26929 () Bool)

(assert (=> bm!2684 m!26929))

(assert (=> b!33380 d!5127))

(declare-fun b!33545 () Bool)

(declare-fun e!21293 () Bool)

(declare-fun e!21294 () Bool)

(assert (=> b!33545 (= e!21293 e!21294)))

(declare-fun lt!12299 () (_ BitVec 64))

(assert (=> b!33545 (= lt!12299 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12298 () Unit!747)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2251 (_ BitVec 64) (_ BitVec 32)) Unit!747)

(assert (=> b!33545 (= lt!12298 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12299 #b00000000000000000000000000000000))))

(assert (=> b!33545 (arrayContainsKey!0 _keys!1833 lt!12299 #b00000000000000000000000000000000)))

(declare-fun lt!12297 () Unit!747)

(assert (=> b!33545 (= lt!12297 lt!12298)))

(declare-fun res!20383 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2251 (_ BitVec 32)) SeekEntryResult!137)

(assert (=> b!33545 (= res!20383 (= (seekEntryOrOpen!0 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!137 #b00000000000000000000000000000000)))))

(assert (=> b!33545 (=> (not res!20383) (not e!21294))))

(declare-fun b!33546 () Bool)

(declare-fun e!21292 () Bool)

(assert (=> b!33546 (= e!21292 e!21293)))

(declare-fun c!3853 () Bool)

(assert (=> b!33546 (= c!3853 (validKeyInArray!0 (select (arr!1076 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5129 () Bool)

(declare-fun res!20384 () Bool)

(assert (=> d!5129 (=> res!20384 e!21292)))

(assert (=> d!5129 (= res!20384 (bvsge #b00000000000000000000000000000000 (size!1177 _keys!1833)))))

(assert (=> d!5129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21292)))

(declare-fun b!33547 () Bool)

(declare-fun call!2696 () Bool)

(assert (=> b!33547 (= e!21293 call!2696)))

(declare-fun b!33548 () Bool)

(assert (=> b!33548 (= e!21294 call!2696)))

(declare-fun bm!2693 () Bool)

(assert (=> bm!2693 (= call!2696 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(assert (= (and d!5129 (not res!20384)) b!33546))

(assert (= (and b!33546 c!3853) b!33545))

(assert (= (and b!33546 (not c!3853)) b!33547))

(assert (= (and b!33545 res!20383) b!33548))

(assert (= (or b!33548 b!33547) bm!2693))

(assert (=> b!33545 m!26861))

(declare-fun m!26931 () Bool)

(assert (=> b!33545 m!26931))

(declare-fun m!26933 () Bool)

(assert (=> b!33545 m!26933))

(assert (=> b!33545 m!26861))

(declare-fun m!26935 () Bool)

(assert (=> b!33545 m!26935))

(assert (=> b!33546 m!26861))

(assert (=> b!33546 m!26861))

(assert (=> b!33546 m!26863))

(declare-fun m!26937 () Bool)

(assert (=> bm!2693 m!26937))

(assert (=> b!33385 d!5129))

(declare-fun d!5131 () Bool)

(assert (=> d!5131 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4326 d!5131))

(declare-fun d!5133 () Bool)

(assert (=> d!5133 (= (array_inv!763 _values!1501) (bvsge (size!1176 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4326 d!5133))

(declare-fun d!5135 () Bool)

(assert (=> d!5135 (= (array_inv!764 _keys!1833) (bvsge (size!1177 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4326 d!5135))

(declare-fun d!5137 () Bool)

(declare-fun res!20389 () Bool)

(declare-fun e!21299 () Bool)

(assert (=> d!5137 (=> res!20389 e!21299)))

(assert (=> d!5137 (= res!20389 (= (select (arr!1076 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5137 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!21299)))

(declare-fun b!33553 () Bool)

(declare-fun e!21300 () Bool)

(assert (=> b!33553 (= e!21299 e!21300)))

(declare-fun res!20390 () Bool)

(assert (=> b!33553 (=> (not res!20390) (not e!21300))))

(assert (=> b!33553 (= res!20390 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1177 _keys!1833)))))

(declare-fun b!33554 () Bool)

(assert (=> b!33554 (= e!21300 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5137 (not res!20389)) b!33553))

(assert (= (and b!33553 res!20390) b!33554))

(assert (=> d!5137 m!26861))

(declare-fun m!26939 () Bool)

(assert (=> b!33554 m!26939))

(assert (=> b!33384 d!5137))

(declare-fun d!5139 () Bool)

(declare-fun lt!12305 () SeekEntryResult!137)

(assert (=> d!5139 (and ((_ is Found!137) lt!12305) (= (index!2671 lt!12305) lt!12179))))

(assert (=> d!5139 (= lt!12305 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12304 () Unit!747)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!2251 (_ BitVec 32)) Unit!747)

(assert (=> d!5139 (= lt!12304 (choose!0 k0!1304 lt!12179 _keys!1833 mask!2294))))

(assert (=> d!5139 (validMask!0 mask!2294)))

(assert (=> d!5139 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12179 _keys!1833 mask!2294) lt!12304)))

(declare-fun bs!1304 () Bool)

(assert (= bs!1304 d!5139))

(assert (=> bs!1304 m!26787))

(declare-fun m!26941 () Bool)

(assert (=> bs!1304 m!26941))

(assert (=> bs!1304 m!26777))

(assert (=> b!33383 d!5139))

(declare-fun d!5141 () Bool)

(declare-fun lt!12308 () (_ BitVec 32))

(assert (=> d!5141 (and (or (bvslt lt!12308 #b00000000000000000000000000000000) (bvsge lt!12308 (size!1177 _keys!1833)) (and (bvsge lt!12308 #b00000000000000000000000000000000) (bvslt lt!12308 (size!1177 _keys!1833)))) (bvsge lt!12308 #b00000000000000000000000000000000) (bvslt lt!12308 (size!1177 _keys!1833)) (= (select (arr!1076 _keys!1833) lt!12308) k0!1304))))

(declare-fun e!21303 () (_ BitVec 32))

(assert (=> d!5141 (= lt!12308 e!21303)))

(declare-fun c!3856 () Bool)

(assert (=> d!5141 (= c!3856 (= (select (arr!1076 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1177 _keys!1833)) (bvslt (size!1177 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5141 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!12308)))

(declare-fun b!33559 () Bool)

(assert (=> b!33559 (= e!21303 #b00000000000000000000000000000000)))

(declare-fun b!33560 () Bool)

(assert (=> b!33560 (= e!21303 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5141 c!3856) b!33559))

(assert (= (and d!5141 (not c!3856)) b!33560))

(declare-fun m!26943 () Bool)

(assert (=> d!5141 m!26943))

(assert (=> d!5141 m!26861))

(declare-fun m!26945 () Bool)

(assert (=> b!33560 m!26945))

(assert (=> b!33383 d!5141))

(declare-fun b!33573 () Bool)

(declare-fun e!21311 () SeekEntryResult!137)

(declare-fun lt!12318 () SeekEntryResult!137)

(assert (=> b!33573 (= e!21311 (Found!137 (index!2672 lt!12318)))))

(declare-fun d!5143 () Bool)

(declare-fun lt!12317 () SeekEntryResult!137)

(assert (=> d!5143 (and (or ((_ is MissingVacant!137) lt!12317) (not ((_ is Found!137) lt!12317)) (and (bvsge (index!2671 lt!12317) #b00000000000000000000000000000000) (bvslt (index!2671 lt!12317) (size!1177 _keys!1833)))) (not ((_ is MissingVacant!137) lt!12317)) (or (not ((_ is Found!137) lt!12317)) (= (select (arr!1076 _keys!1833) (index!2671 lt!12317)) k0!1304)))))

(declare-fun e!21312 () SeekEntryResult!137)

(assert (=> d!5143 (= lt!12317 e!21312)))

(declare-fun c!3865 () Bool)

(assert (=> d!5143 (= c!3865 (and ((_ is Intermediate!137) lt!12318) (undefined!949 lt!12318)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2251 (_ BitVec 32)) SeekEntryResult!137)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5143 (= lt!12318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5143 (validMask!0 mask!2294)))

(assert (=> d!5143 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12317)))

(declare-fun b!33574 () Bool)

(declare-fun c!3864 () Bool)

(declare-fun lt!12320 () (_ BitVec 64))

(assert (=> b!33574 (= c!3864 (= lt!12320 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21310 () SeekEntryResult!137)

(assert (=> b!33574 (= e!21311 e!21310)))

(declare-fun b!33575 () Bool)

(assert (=> b!33575 (= e!21310 (MissingZero!137 (index!2672 lt!12318)))))

(declare-fun b!33576 () Bool)

(assert (=> b!33576 (= e!21312 Undefined!137)))

(declare-fun b!33577 () Bool)

(declare-fun lt!12319 () SeekEntryResult!137)

(assert (=> b!33577 (= e!21310 (ite ((_ is MissingVacant!137) lt!12319) (MissingZero!137 (index!2673 lt!12319)) lt!12319))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2251 (_ BitVec 32)) SeekEntryResult!137)

(assert (=> b!33577 (= lt!12319 (seekKeyOrZeroReturnVacant!0 (x!6829 lt!12318) (index!2672 lt!12318) (index!2672 lt!12318) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!33578 () Bool)

(assert (=> b!33578 (= e!21312 e!21311)))

(assert (=> b!33578 (= lt!12320 (select (arr!1076 _keys!1833) (index!2672 lt!12318)))))

(declare-fun c!3863 () Bool)

(assert (=> b!33578 (= c!3863 (= lt!12320 k0!1304))))

(assert (= (and d!5143 c!3865) b!33576))

(assert (= (and d!5143 (not c!3865)) b!33578))

(assert (= (and b!33578 c!3863) b!33573))

(assert (= (and b!33578 (not c!3863)) b!33574))

(assert (= (and b!33574 c!3864) b!33575))

(assert (= (and b!33574 (not c!3864)) b!33577))

(declare-fun m!26947 () Bool)

(assert (=> d!5143 m!26947))

(declare-fun m!26949 () Bool)

(assert (=> d!5143 m!26949))

(assert (=> d!5143 m!26949))

(declare-fun m!26951 () Bool)

(assert (=> d!5143 m!26951))

(assert (=> d!5143 m!26777))

(declare-fun m!26953 () Bool)

(assert (=> b!33577 m!26953))

(declare-fun m!26955 () Bool)

(assert (=> b!33578 m!26955))

(assert (=> b!33383 d!5143))

(declare-fun d!5145 () Bool)

(declare-fun e!21315 () Bool)

(assert (=> d!5145 e!21315))

(declare-fun res!20393 () Bool)

(assert (=> d!5145 (=> (not res!20393) (not e!21315))))

(assert (=> d!5145 (= res!20393 (and (bvsge lt!12179 #b00000000000000000000000000000000) (bvslt lt!12179 (size!1177 _keys!1833))))))

(declare-fun lt!12323 () Unit!747)

(declare-fun choose!217 (array!2251 array!2249 (_ BitVec 32) (_ BitVec 32) V!1867 V!1867 (_ BitVec 32) Int) Unit!747)

(assert (=> d!5145 (= lt!12323 (choose!217 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12179 defaultEntry!1504))))

(assert (=> d!5145 (validMask!0 mask!2294)))

(assert (=> d!5145 (= (lemmaValidKeyInArrayIsInListMap!58 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12179 defaultEntry!1504) lt!12323)))

(declare-fun b!33581 () Bool)

(assert (=> b!33581 (= e!21315 (contains!386 (getCurrentListMap!262 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1076 _keys!1833) lt!12179)))))

(assert (= (and d!5145 res!20393) b!33581))

(declare-fun m!26957 () Bool)

(assert (=> d!5145 m!26957))

(assert (=> d!5145 m!26777))

(assert (=> b!33581 m!26767))

(assert (=> b!33581 m!26793))

(assert (=> b!33581 m!26767))

(assert (=> b!33581 m!26793))

(declare-fun m!26959 () Bool)

(assert (=> b!33581 m!26959))

(assert (=> b!33383 d!5145))

(declare-fun d!5147 () Bool)

(declare-fun e!21316 () Bool)

(assert (=> d!5147 e!21316))

(declare-fun res!20394 () Bool)

(assert (=> d!5147 (=> res!20394 e!21316)))

(declare-fun lt!12324 () Bool)

(assert (=> d!5147 (= res!20394 (not lt!12324))))

(declare-fun lt!12325 () Bool)

(assert (=> d!5147 (= lt!12324 lt!12325)))

(declare-fun lt!12326 () Unit!747)

(declare-fun e!21317 () Unit!747)

(assert (=> d!5147 (= lt!12326 e!21317)))

(declare-fun c!3866 () Bool)

(assert (=> d!5147 (= c!3866 lt!12325)))

(assert (=> d!5147 (= lt!12325 (containsKey!31 (toList!442 lt!12181) (select (arr!1076 _keys!1833) lt!12179)))))

(assert (=> d!5147 (= (contains!386 lt!12181 (select (arr!1076 _keys!1833) lt!12179)) lt!12324)))

(declare-fun b!33582 () Bool)

(declare-fun lt!12327 () Unit!747)

(assert (=> b!33582 (= e!21317 lt!12327)))

(assert (=> b!33582 (= lt!12327 (lemmaContainsKeyImpliesGetValueByKeyDefined!28 (toList!442 lt!12181) (select (arr!1076 _keys!1833) lt!12179)))))

(assert (=> b!33582 (isDefined!29 (getValueByKey!67 (toList!442 lt!12181) (select (arr!1076 _keys!1833) lt!12179)))))

(declare-fun b!33583 () Bool)

(declare-fun Unit!753 () Unit!747)

(assert (=> b!33583 (= e!21317 Unit!753)))

(declare-fun b!33584 () Bool)

(assert (=> b!33584 (= e!21316 (isDefined!29 (getValueByKey!67 (toList!442 lt!12181) (select (arr!1076 _keys!1833) lt!12179))))))

(assert (= (and d!5147 c!3866) b!33582))

(assert (= (and d!5147 (not c!3866)) b!33583))

(assert (= (and d!5147 (not res!20394)) b!33584))

(assert (=> d!5147 m!26793))

(declare-fun m!26961 () Bool)

(assert (=> d!5147 m!26961))

(assert (=> b!33582 m!26793))

(declare-fun m!26963 () Bool)

(assert (=> b!33582 m!26963))

(assert (=> b!33582 m!26793))

(declare-fun m!26965 () Bool)

(assert (=> b!33582 m!26965))

(assert (=> b!33582 m!26965))

(declare-fun m!26967 () Bool)

(assert (=> b!33582 m!26967))

(assert (=> b!33584 m!26793))

(assert (=> b!33584 m!26965))

(assert (=> b!33584 m!26965))

(assert (=> b!33584 m!26967))

(assert (=> b!33383 d!5147))

(declare-fun d!5149 () Bool)

(assert (=> d!5149 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33387 d!5149))

(declare-fun b!33591 () Bool)

(declare-fun e!21322 () Bool)

(assert (=> b!33591 (= e!21322 tp_is_empty!1531)))

(declare-fun condMapEmpty!1843 () Bool)

(declare-fun mapDefault!1843 () ValueCell!566)

(assert (=> mapNonEmpty!1834 (= condMapEmpty!1843 (= mapRest!1834 ((as const (Array (_ BitVec 32) ValueCell!566)) mapDefault!1843)))))

(declare-fun e!21323 () Bool)

(declare-fun mapRes!1843 () Bool)

(assert (=> mapNonEmpty!1834 (= tp!4959 (and e!21323 mapRes!1843))))

(declare-fun mapNonEmpty!1843 () Bool)

(declare-fun tp!4975 () Bool)

(assert (=> mapNonEmpty!1843 (= mapRes!1843 (and tp!4975 e!21322))))

(declare-fun mapRest!1843 () (Array (_ BitVec 32) ValueCell!566))

(declare-fun mapKey!1843 () (_ BitVec 32))

(declare-fun mapValue!1843 () ValueCell!566)

(assert (=> mapNonEmpty!1843 (= mapRest!1834 (store mapRest!1843 mapKey!1843 mapValue!1843))))

(declare-fun b!33592 () Bool)

(assert (=> b!33592 (= e!21323 tp_is_empty!1531)))

(declare-fun mapIsEmpty!1843 () Bool)

(assert (=> mapIsEmpty!1843 mapRes!1843))

(assert (= (and mapNonEmpty!1834 condMapEmpty!1843) mapIsEmpty!1843))

(assert (= (and mapNonEmpty!1834 (not condMapEmpty!1843)) mapNonEmpty!1843))

(assert (= (and mapNonEmpty!1843 ((_ is ValueCellFull!566) mapValue!1843)) b!33591))

(assert (= (and mapNonEmpty!1834 ((_ is ValueCellFull!566) mapDefault!1843)) b!33592))

(declare-fun m!26969 () Bool)

(assert (=> mapNonEmpty!1843 m!26969))

(declare-fun b_lambda!1697 () Bool)

(assert (= b_lambda!1695 (or (and start!4326 b_free!1177) b_lambda!1697)))

(check-sat (not b!33462) (not b!33469) (not bm!2689) (not b!33581) (not bm!2685) (not bm!2687) b_and!1993 (not d!5127) (not mapNonEmpty!1843) (not bm!2693) (not b!33471) (not b!33560) (not b!33554) (not b!33514) (not bm!2684) (not b!33545) (not b!33526) (not d!5125) (not b!33460) (not b!33582) (not b!33523) (not d!5147) (not d!5139) (not d!5143) (not b!33584) (not b_next!1177) (not b!33518) (not d!5145) (not bm!2669) (not b!33577) (not b!33519) tp_is_empty!1531 (not b!33546) (not b!33530) (not b!33532) (not b!33458) (not b!33515) (not b_lambda!1697))
(check-sat b_and!1993 (not b_next!1177))
