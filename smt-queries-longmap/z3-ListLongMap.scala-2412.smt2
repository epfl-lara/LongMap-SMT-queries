; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38158 () Bool)

(assert start!38158)

(declare-fun b_free!9039 () Bool)

(declare-fun b_next!9039 () Bool)

(assert (=> start!38158 (= b_free!9039 (not b_next!9039))))

(declare-fun tp!31898 () Bool)

(declare-fun b_and!16401 () Bool)

(assert (=> start!38158 (= tp!31898 b_and!16401)))

(declare-fun mapNonEmpty!16161 () Bool)

(declare-fun mapRes!16161 () Bool)

(declare-fun tp!31899 () Bool)

(declare-fun e!238172 () Bool)

(assert (=> mapNonEmpty!16161 (= mapRes!16161 (and tp!31899 e!238172))))

(declare-fun mapKey!16161 () (_ BitVec 32))

(declare-datatypes ((V!14053 0))(
  ( (V!14054 (val!4900 Int)) )
))
(declare-datatypes ((ValueCell!4512 0))(
  ( (ValueCellFull!4512 (v!7137 V!14053)) (EmptyCell!4512) )
))
(declare-datatypes ((array!23327 0))(
  ( (array!23328 (arr!11122 (Array (_ BitVec 32) ValueCell!4512)) (size!11474 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23327)

(declare-fun mapRest!16161 () (Array (_ BitVec 32) ValueCell!4512))

(declare-fun mapValue!16161 () ValueCell!4512)

(assert (=> mapNonEmpty!16161 (= (arr!11122 _values!506) (store mapRest!16161 mapKey!16161 mapValue!16161))))

(declare-fun b!393379 () Bool)

(declare-fun res!225390 () Bool)

(declare-fun e!238174 () Bool)

(assert (=> b!393379 (=> (not res!225390) (not e!238174))))

(declare-datatypes ((array!23329 0))(
  ( (array!23330 (arr!11123 (Array (_ BitVec 32) (_ BitVec 64))) (size!11475 (_ BitVec 32))) )
))
(declare-fun lt!186165 () array!23329)

(declare-datatypes ((List!6465 0))(
  ( (Nil!6462) (Cons!6461 (h!7317 (_ BitVec 64)) (t!11635 List!6465)) )
))
(declare-fun arrayNoDuplicates!0 (array!23329 (_ BitVec 32) List!6465) Bool)

(assert (=> b!393379 (= res!225390 (arrayNoDuplicates!0 lt!186165 #b00000000000000000000000000000000 Nil!6462))))

(declare-fun b!393380 () Bool)

(declare-fun res!225383 () Bool)

(declare-fun e!238173 () Bool)

(assert (=> b!393380 (=> (not res!225383) (not e!238173))))

(declare-fun _keys!658 () array!23329)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23329 (_ BitVec 32)) Bool)

(assert (=> b!393380 (= res!225383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun lt!186162 () Bool)

(declare-fun b!393381 () Bool)

(declare-datatypes ((tuple2!6612 0))(
  ( (tuple2!6613 (_1!3317 (_ BitVec 64)) (_2!3317 V!14053)) )
))
(declare-datatypes ((List!6466 0))(
  ( (Nil!6463) (Cons!6462 (h!7318 tuple2!6612) (t!11636 List!6466)) )
))
(declare-datatypes ((ListLongMap!5525 0))(
  ( (ListLongMap!5526 (toList!2778 List!6466)) )
))
(declare-fun lt!186163 () ListLongMap!5525)

(declare-fun lt!186164 () ListLongMap!5525)

(assert (=> b!393381 (= e!238174 (not (or (and (not lt!186162) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186162) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186162) (= lt!186164 lt!186163))))))

(assert (=> b!393381 (= lt!186162 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14053)

(declare-fun lt!186169 () ListLongMap!5525)

(declare-fun minValue!472 () V!14053)

(declare-fun getCurrentListMap!2119 (array!23329 array!23327 (_ BitVec 32) (_ BitVec 32) V!14053 V!14053 (_ BitVec 32) Int) ListLongMap!5525)

(assert (=> b!393381 (= lt!186169 (getCurrentListMap!2119 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186167 () array!23327)

(assert (=> b!393381 (= lt!186164 (getCurrentListMap!2119 lt!186165 lt!186167 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186161 () ListLongMap!5525)

(assert (=> b!393381 (and (= lt!186163 lt!186161) (= lt!186161 lt!186163))))

(declare-fun v!373 () V!14053)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!186168 () ListLongMap!5525)

(declare-fun +!1073 (ListLongMap!5525 tuple2!6612) ListLongMap!5525)

(assert (=> b!393381 (= lt!186161 (+!1073 lt!186168 (tuple2!6613 k0!778 v!373)))))

(declare-datatypes ((Unit!12032 0))(
  ( (Unit!12033) )
))
(declare-fun lt!186166 () Unit!12032)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!283 (array!23329 array!23327 (_ BitVec 32) (_ BitVec 32) V!14053 V!14053 (_ BitVec 32) (_ BitVec 64) V!14053 (_ BitVec 32) Int) Unit!12032)

(assert (=> b!393381 (= lt!186166 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!283 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!999 (array!23329 array!23327 (_ BitVec 32) (_ BitVec 32) V!14053 V!14053 (_ BitVec 32) Int) ListLongMap!5525)

(assert (=> b!393381 (= lt!186163 (getCurrentListMapNoExtraKeys!999 lt!186165 lt!186167 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393381 (= lt!186167 (array!23328 (store (arr!11122 _values!506) i!548 (ValueCellFull!4512 v!373)) (size!11474 _values!506)))))

(assert (=> b!393381 (= lt!186168 (getCurrentListMapNoExtraKeys!999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393382 () Bool)

(declare-fun res!225386 () Bool)

(assert (=> b!393382 (=> (not res!225386) (not e!238173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393382 (= res!225386 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!16161 () Bool)

(assert (=> mapIsEmpty!16161 mapRes!16161))

(declare-fun res!225382 () Bool)

(assert (=> start!38158 (=> (not res!225382) (not e!238173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38158 (= res!225382 (validMask!0 mask!970))))

(assert (=> start!38158 e!238173))

(declare-fun e!238175 () Bool)

(declare-fun array_inv!8168 (array!23327) Bool)

(assert (=> start!38158 (and (array_inv!8168 _values!506) e!238175)))

(assert (=> start!38158 tp!31898))

(assert (=> start!38158 true))

(declare-fun tp_is_empty!9711 () Bool)

(assert (=> start!38158 tp_is_empty!9711))

(declare-fun array_inv!8169 (array!23329) Bool)

(assert (=> start!38158 (array_inv!8169 _keys!658)))

(declare-fun b!393383 () Bool)

(declare-fun res!225387 () Bool)

(assert (=> b!393383 (=> (not res!225387) (not e!238173))))

(assert (=> b!393383 (= res!225387 (or (= (select (arr!11123 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11123 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393384 () Bool)

(declare-fun e!238176 () Bool)

(assert (=> b!393384 (= e!238175 (and e!238176 mapRes!16161))))

(declare-fun condMapEmpty!16161 () Bool)

(declare-fun mapDefault!16161 () ValueCell!4512)

(assert (=> b!393384 (= condMapEmpty!16161 (= (arr!11122 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4512)) mapDefault!16161)))))

(declare-fun b!393385 () Bool)

(declare-fun res!225381 () Bool)

(assert (=> b!393385 (=> (not res!225381) (not e!238173))))

(assert (=> b!393385 (= res!225381 (and (= (size!11474 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11475 _keys!658) (size!11474 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393386 () Bool)

(assert (=> b!393386 (= e!238173 e!238174)))

(declare-fun res!225388 () Bool)

(assert (=> b!393386 (=> (not res!225388) (not e!238174))))

(assert (=> b!393386 (= res!225388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186165 mask!970))))

(assert (=> b!393386 (= lt!186165 (array!23330 (store (arr!11123 _keys!658) i!548 k0!778) (size!11475 _keys!658)))))

(declare-fun b!393387 () Bool)

(declare-fun res!225385 () Bool)

(assert (=> b!393387 (=> (not res!225385) (not e!238173))))

(declare-fun arrayContainsKey!0 (array!23329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393387 (= res!225385 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393388 () Bool)

(assert (=> b!393388 (= e!238172 tp_is_empty!9711)))

(declare-fun b!393389 () Bool)

(assert (=> b!393389 (= e!238176 tp_is_empty!9711)))

(declare-fun b!393390 () Bool)

(declare-fun res!225389 () Bool)

(assert (=> b!393390 (=> (not res!225389) (not e!238173))))

(assert (=> b!393390 (= res!225389 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6462))))

(declare-fun b!393391 () Bool)

(declare-fun res!225384 () Bool)

(assert (=> b!393391 (=> (not res!225384) (not e!238173))))

(assert (=> b!393391 (= res!225384 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11475 _keys!658))))))

(assert (= (and start!38158 res!225382) b!393385))

(assert (= (and b!393385 res!225381) b!393380))

(assert (= (and b!393380 res!225383) b!393390))

(assert (= (and b!393390 res!225389) b!393391))

(assert (= (and b!393391 res!225384) b!393382))

(assert (= (and b!393382 res!225386) b!393383))

(assert (= (and b!393383 res!225387) b!393387))

(assert (= (and b!393387 res!225385) b!393386))

(assert (= (and b!393386 res!225388) b!393379))

(assert (= (and b!393379 res!225390) b!393381))

(assert (= (and b!393384 condMapEmpty!16161) mapIsEmpty!16161))

(assert (= (and b!393384 (not condMapEmpty!16161)) mapNonEmpty!16161))

(get-info :version)

(assert (= (and mapNonEmpty!16161 ((_ is ValueCellFull!4512) mapValue!16161)) b!393388))

(assert (= (and b!393384 ((_ is ValueCellFull!4512) mapDefault!16161)) b!393389))

(assert (= start!38158 b!393384))

(declare-fun m!389851 () Bool)

(assert (=> b!393381 m!389851))

(declare-fun m!389853 () Bool)

(assert (=> b!393381 m!389853))

(declare-fun m!389855 () Bool)

(assert (=> b!393381 m!389855))

(declare-fun m!389857 () Bool)

(assert (=> b!393381 m!389857))

(declare-fun m!389859 () Bool)

(assert (=> b!393381 m!389859))

(declare-fun m!389861 () Bool)

(assert (=> b!393381 m!389861))

(declare-fun m!389863 () Bool)

(assert (=> b!393381 m!389863))

(declare-fun m!389865 () Bool)

(assert (=> b!393387 m!389865))

(declare-fun m!389867 () Bool)

(assert (=> b!393386 m!389867))

(declare-fun m!389869 () Bool)

(assert (=> b!393386 m!389869))

(declare-fun m!389871 () Bool)

(assert (=> b!393382 m!389871))

(declare-fun m!389873 () Bool)

(assert (=> b!393390 m!389873))

(declare-fun m!389875 () Bool)

(assert (=> b!393383 m!389875))

(declare-fun m!389877 () Bool)

(assert (=> b!393379 m!389877))

(declare-fun m!389879 () Bool)

(assert (=> start!38158 m!389879))

(declare-fun m!389881 () Bool)

(assert (=> start!38158 m!389881))

(declare-fun m!389883 () Bool)

(assert (=> start!38158 m!389883))

(declare-fun m!389885 () Bool)

(assert (=> mapNonEmpty!16161 m!389885))

(declare-fun m!389887 () Bool)

(assert (=> b!393380 m!389887))

(check-sat (not b!393386) b_and!16401 (not b!393387) (not b!393382) (not b!393390) (not b!393380) (not mapNonEmpty!16161) (not start!38158) tp_is_empty!9711 (not b!393381) (not b_next!9039) (not b!393379))
(check-sat b_and!16401 (not b_next!9039))
(get-model)

(declare-fun b!393441 () Bool)

(declare-fun e!238207 () Bool)

(declare-fun e!238204 () Bool)

(assert (=> b!393441 (= e!238207 e!238204)))

(declare-fun res!225427 () Bool)

(assert (=> b!393441 (=> (not res!225427) (not e!238204))))

(declare-fun e!238205 () Bool)

(assert (=> b!393441 (= res!225427 (not e!238205))))

(declare-fun res!225429 () Bool)

(assert (=> b!393441 (=> (not res!225429) (not e!238205))))

(assert (=> b!393441 (= res!225429 (validKeyInArray!0 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393442 () Bool)

(declare-fun contains!2470 (List!6465 (_ BitVec 64)) Bool)

(assert (=> b!393442 (= e!238205 (contains!2470 Nil!6462 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393443 () Bool)

(declare-fun e!238206 () Bool)

(assert (=> b!393443 (= e!238204 e!238206)))

(declare-fun c!54437 () Bool)

(assert (=> b!393443 (= c!54437 (validKeyInArray!0 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393444 () Bool)

(declare-fun call!27771 () Bool)

(assert (=> b!393444 (= e!238206 call!27771)))

(declare-fun bm!27768 () Bool)

(assert (=> bm!27768 (= call!27771 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54437 (Cons!6461 (select (arr!11123 _keys!658) #b00000000000000000000000000000000) Nil!6462) Nil!6462)))))

(declare-fun d!73209 () Bool)

(declare-fun res!225428 () Bool)

(assert (=> d!73209 (=> res!225428 e!238207)))

(assert (=> d!73209 (= res!225428 (bvsge #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(assert (=> d!73209 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6462) e!238207)))

(declare-fun b!393445 () Bool)

(assert (=> b!393445 (= e!238206 call!27771)))

(assert (= (and d!73209 (not res!225428)) b!393441))

(assert (= (and b!393441 res!225429) b!393442))

(assert (= (and b!393441 res!225427) b!393443))

(assert (= (and b!393443 c!54437) b!393444))

(assert (= (and b!393443 (not c!54437)) b!393445))

(assert (= (or b!393444 b!393445) bm!27768))

(declare-fun m!389927 () Bool)

(assert (=> b!393441 m!389927))

(assert (=> b!393441 m!389927))

(declare-fun m!389929 () Bool)

(assert (=> b!393441 m!389929))

(assert (=> b!393442 m!389927))

(assert (=> b!393442 m!389927))

(declare-fun m!389931 () Bool)

(assert (=> b!393442 m!389931))

(assert (=> b!393443 m!389927))

(assert (=> b!393443 m!389927))

(assert (=> b!393443 m!389929))

(assert (=> bm!27768 m!389927))

(declare-fun m!389933 () Bool)

(assert (=> bm!27768 m!389933))

(assert (=> b!393390 d!73209))

(declare-fun b!393488 () Bool)

(declare-fun e!238239 () Bool)

(assert (=> b!393488 (= e!238239 (validKeyInArray!0 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)))))

(declare-fun c!54453 () Bool)

(declare-fun bm!27783 () Bool)

(declare-fun call!27790 () ListLongMap!5525)

(declare-fun c!54455 () Bool)

(declare-fun call!27792 () ListLongMap!5525)

(declare-fun call!27789 () ListLongMap!5525)

(declare-fun call!27791 () ListLongMap!5525)

(assert (=> bm!27783 (= call!27791 (+!1073 (ite c!54455 call!27789 (ite c!54453 call!27792 call!27790)) (ite (or c!54455 c!54453) (tuple2!6613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!393490 () Bool)

(declare-fun e!238240 () ListLongMap!5525)

(declare-fun call!27786 () ListLongMap!5525)

(assert (=> b!393490 (= e!238240 call!27786)))

(declare-fun b!393491 () Bool)

(declare-fun res!225454 () Bool)

(declare-fun e!238237 () Bool)

(assert (=> b!393491 (=> (not res!225454) (not e!238237))))

(declare-fun e!238235 () Bool)

(assert (=> b!393491 (= res!225454 e!238235)))

(declare-fun res!225453 () Bool)

(assert (=> b!393491 (=> res!225453 e!238235)))

(declare-fun e!238245 () Bool)

(assert (=> b!393491 (= res!225453 (not e!238245))))

(declare-fun res!225449 () Bool)

(assert (=> b!393491 (=> (not res!225449) (not e!238245))))

(assert (=> b!393491 (= res!225449 (bvslt #b00000000000000000000000000000000 (size!11475 lt!186165)))))

(declare-fun bm!27784 () Bool)

(assert (=> bm!27784 (= call!27792 call!27789)))

(declare-fun b!393492 () Bool)

(declare-fun e!238243 () Bool)

(declare-fun e!238236 () Bool)

(assert (=> b!393492 (= e!238243 e!238236)))

(declare-fun res!225451 () Bool)

(declare-fun call!27787 () Bool)

(assert (=> b!393492 (= res!225451 call!27787)))

(assert (=> b!393492 (=> (not res!225451) (not e!238236))))

(declare-fun b!393493 () Bool)

(declare-fun e!238241 () Bool)

(declare-fun call!27788 () Bool)

(assert (=> b!393493 (= e!238241 (not call!27788))))

(declare-fun b!393494 () Bool)

(declare-fun e!238246 () ListLongMap!5525)

(assert (=> b!393494 (= e!238246 call!27786)))

(declare-fun bm!27785 () Bool)

(assert (=> bm!27785 (= call!27786 call!27791)))

(declare-fun b!393495 () Bool)

(declare-fun e!238238 () Unit!12032)

(declare-fun Unit!12036 () Unit!12032)

(assert (=> b!393495 (= e!238238 Unit!12036)))

(declare-fun b!393496 () Bool)

(declare-fun lt!186250 () Unit!12032)

(assert (=> b!393496 (= e!238238 lt!186250)))

(declare-fun lt!186249 () ListLongMap!5525)

(assert (=> b!393496 (= lt!186249 (getCurrentListMapNoExtraKeys!999 lt!186165 lt!186167 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186258 () (_ BitVec 64))

(assert (=> b!393496 (= lt!186258 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186245 () (_ BitVec 64))

(assert (=> b!393496 (= lt!186245 (select (arr!11123 lt!186165) #b00000000000000000000000000000000))))

(declare-fun lt!186254 () Unit!12032)

(declare-fun addStillContains!283 (ListLongMap!5525 (_ BitVec 64) V!14053 (_ BitVec 64)) Unit!12032)

(assert (=> b!393496 (= lt!186254 (addStillContains!283 lt!186249 lt!186258 zeroValue!472 lt!186245))))

(declare-fun contains!2471 (ListLongMap!5525 (_ BitVec 64)) Bool)

(assert (=> b!393496 (contains!2471 (+!1073 lt!186249 (tuple2!6613 lt!186258 zeroValue!472)) lt!186245)))

(declare-fun lt!186260 () Unit!12032)

(assert (=> b!393496 (= lt!186260 lt!186254)))

(declare-fun lt!186251 () ListLongMap!5525)

(assert (=> b!393496 (= lt!186251 (getCurrentListMapNoExtraKeys!999 lt!186165 lt!186167 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186253 () (_ BitVec 64))

(assert (=> b!393496 (= lt!186253 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186259 () (_ BitVec 64))

(assert (=> b!393496 (= lt!186259 (select (arr!11123 lt!186165) #b00000000000000000000000000000000))))

(declare-fun lt!186257 () Unit!12032)

(declare-fun addApplyDifferent!283 (ListLongMap!5525 (_ BitVec 64) V!14053 (_ BitVec 64)) Unit!12032)

(assert (=> b!393496 (= lt!186257 (addApplyDifferent!283 lt!186251 lt!186253 minValue!472 lt!186259))))

(declare-fun apply!307 (ListLongMap!5525 (_ BitVec 64)) V!14053)

(assert (=> b!393496 (= (apply!307 (+!1073 lt!186251 (tuple2!6613 lt!186253 minValue!472)) lt!186259) (apply!307 lt!186251 lt!186259))))

(declare-fun lt!186262 () Unit!12032)

(assert (=> b!393496 (= lt!186262 lt!186257)))

(declare-fun lt!186248 () ListLongMap!5525)

(assert (=> b!393496 (= lt!186248 (getCurrentListMapNoExtraKeys!999 lt!186165 lt!186167 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186246 () (_ BitVec 64))

(assert (=> b!393496 (= lt!186246 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186241 () (_ BitVec 64))

(assert (=> b!393496 (= lt!186241 (select (arr!11123 lt!186165) #b00000000000000000000000000000000))))

(declare-fun lt!186242 () Unit!12032)

(assert (=> b!393496 (= lt!186242 (addApplyDifferent!283 lt!186248 lt!186246 zeroValue!472 lt!186241))))

(assert (=> b!393496 (= (apply!307 (+!1073 lt!186248 (tuple2!6613 lt!186246 zeroValue!472)) lt!186241) (apply!307 lt!186248 lt!186241))))

(declare-fun lt!186256 () Unit!12032)

(assert (=> b!393496 (= lt!186256 lt!186242)))

(declare-fun lt!186261 () ListLongMap!5525)

(assert (=> b!393496 (= lt!186261 (getCurrentListMapNoExtraKeys!999 lt!186165 lt!186167 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186252 () (_ BitVec 64))

(assert (=> b!393496 (= lt!186252 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186247 () (_ BitVec 64))

(assert (=> b!393496 (= lt!186247 (select (arr!11123 lt!186165) #b00000000000000000000000000000000))))

(assert (=> b!393496 (= lt!186250 (addApplyDifferent!283 lt!186261 lt!186252 minValue!472 lt!186247))))

(assert (=> b!393496 (= (apply!307 (+!1073 lt!186261 (tuple2!6613 lt!186252 minValue!472)) lt!186247) (apply!307 lt!186261 lt!186247))))

(declare-fun e!238244 () Bool)

(declare-fun lt!186243 () ListLongMap!5525)

(declare-fun b!393497 () Bool)

(declare-fun get!5617 (ValueCell!4512 V!14053) V!14053)

(declare-fun dynLambda!650 (Int (_ BitVec 64)) V!14053)

(assert (=> b!393497 (= e!238244 (= (apply!307 lt!186243 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)) (get!5617 (select (arr!11122 lt!186167) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11474 lt!186167)))))

(assert (=> b!393497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11475 lt!186165)))))

(declare-fun b!393498 () Bool)

(assert (=> b!393498 (= e!238243 (not call!27787))))

(declare-fun b!393499 () Bool)

(declare-fun e!238234 () ListLongMap!5525)

(assert (=> b!393499 (= e!238234 e!238240)))

(assert (=> b!393499 (= c!54453 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27786 () Bool)

(assert (=> bm!27786 (= call!27790 call!27792)))

(declare-fun b!393489 () Bool)

(declare-fun e!238242 () Bool)

(assert (=> b!393489 (= e!238242 (= (apply!307 lt!186243 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun d!73211 () Bool)

(assert (=> d!73211 e!238237))

(declare-fun res!225450 () Bool)

(assert (=> d!73211 (=> (not res!225450) (not e!238237))))

(assert (=> d!73211 (= res!225450 (or (bvsge #b00000000000000000000000000000000 (size!11475 lt!186165)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11475 lt!186165)))))))

(declare-fun lt!186255 () ListLongMap!5525)

(assert (=> d!73211 (= lt!186243 lt!186255)))

(declare-fun lt!186244 () Unit!12032)

(assert (=> d!73211 (= lt!186244 e!238238)))

(declare-fun c!54451 () Bool)

(assert (=> d!73211 (= c!54451 e!238239)))

(declare-fun res!225456 () Bool)

(assert (=> d!73211 (=> (not res!225456) (not e!238239))))

(assert (=> d!73211 (= res!225456 (bvslt #b00000000000000000000000000000000 (size!11475 lt!186165)))))

(assert (=> d!73211 (= lt!186255 e!238234)))

(assert (=> d!73211 (= c!54455 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73211 (validMask!0 mask!970)))

(assert (=> d!73211 (= (getCurrentListMap!2119 lt!186165 lt!186167 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186243)))

(declare-fun bm!27787 () Bool)

(assert (=> bm!27787 (= call!27789 (getCurrentListMapNoExtraKeys!999 lt!186165 lt!186167 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393500 () Bool)

(assert (=> b!393500 (= e!238235 e!238244)))

(declare-fun res!225455 () Bool)

(assert (=> b!393500 (=> (not res!225455) (not e!238244))))

(assert (=> b!393500 (= res!225455 (contains!2471 lt!186243 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)))))

(assert (=> b!393500 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11475 lt!186165)))))

(declare-fun b!393501 () Bool)

(assert (=> b!393501 (= e!238246 call!27790)))

(declare-fun b!393502 () Bool)

(assert (=> b!393502 (= e!238237 e!238243)))

(declare-fun c!54452 () Bool)

(assert (=> b!393502 (= c!54452 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!393503 () Bool)

(declare-fun c!54454 () Bool)

(assert (=> b!393503 (= c!54454 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!393503 (= e!238240 e!238246)))

(declare-fun b!393504 () Bool)

(assert (=> b!393504 (= e!238236 (= (apply!307 lt!186243 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!393505 () Bool)

(declare-fun res!225448 () Bool)

(assert (=> b!393505 (=> (not res!225448) (not e!238237))))

(assert (=> b!393505 (= res!225448 e!238241)))

(declare-fun c!54450 () Bool)

(assert (=> b!393505 (= c!54450 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27788 () Bool)

(assert (=> bm!27788 (= call!27788 (contains!2471 lt!186243 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27789 () Bool)

(assert (=> bm!27789 (= call!27787 (contains!2471 lt!186243 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!393506 () Bool)

(assert (=> b!393506 (= e!238234 (+!1073 call!27791 (tuple2!6613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!393507 () Bool)

(assert (=> b!393507 (= e!238245 (validKeyInArray!0 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)))))

(declare-fun b!393508 () Bool)

(assert (=> b!393508 (= e!238241 e!238242)))

(declare-fun res!225452 () Bool)

(assert (=> b!393508 (= res!225452 call!27788)))

(assert (=> b!393508 (=> (not res!225452) (not e!238242))))

(assert (= (and d!73211 c!54455) b!393506))

(assert (= (and d!73211 (not c!54455)) b!393499))

(assert (= (and b!393499 c!54453) b!393490))

(assert (= (and b!393499 (not c!54453)) b!393503))

(assert (= (and b!393503 c!54454) b!393494))

(assert (= (and b!393503 (not c!54454)) b!393501))

(assert (= (or b!393494 b!393501) bm!27786))

(assert (= (or b!393490 bm!27786) bm!27784))

(assert (= (or b!393490 b!393494) bm!27785))

(assert (= (or b!393506 bm!27784) bm!27787))

(assert (= (or b!393506 bm!27785) bm!27783))

(assert (= (and d!73211 res!225456) b!393488))

(assert (= (and d!73211 c!54451) b!393496))

(assert (= (and d!73211 (not c!54451)) b!393495))

(assert (= (and d!73211 res!225450) b!393491))

(assert (= (and b!393491 res!225449) b!393507))

(assert (= (and b!393491 (not res!225453)) b!393500))

(assert (= (and b!393500 res!225455) b!393497))

(assert (= (and b!393491 res!225454) b!393505))

(assert (= (and b!393505 c!54450) b!393508))

(assert (= (and b!393505 (not c!54450)) b!393493))

(assert (= (and b!393508 res!225452) b!393489))

(assert (= (or b!393508 b!393493) bm!27788))

(assert (= (and b!393505 res!225448) b!393502))

(assert (= (and b!393502 c!54452) b!393492))

(assert (= (and b!393502 (not c!54452)) b!393498))

(assert (= (and b!393492 res!225451) b!393504))

(assert (= (or b!393492 b!393498) bm!27789))

(declare-fun b_lambda!8767 () Bool)

(assert (=> (not b_lambda!8767) (not b!393497)))

(declare-fun t!11640 () Bool)

(declare-fun tb!3129 () Bool)

(assert (=> (and start!38158 (= defaultEntry!514 defaultEntry!514) t!11640) tb!3129))

(declare-fun result!5767 () Bool)

(assert (=> tb!3129 (= result!5767 tp_is_empty!9711)))

(assert (=> b!393497 t!11640))

(declare-fun b_and!16405 () Bool)

(assert (= b_and!16401 (and (=> t!11640 result!5767) b_and!16405)))

(declare-fun m!389935 () Bool)

(assert (=> bm!27788 m!389935))

(declare-fun m!389937 () Bool)

(assert (=> b!393496 m!389937))

(declare-fun m!389939 () Bool)

(assert (=> b!393496 m!389939))

(declare-fun m!389941 () Bool)

(assert (=> b!393496 m!389941))

(declare-fun m!389943 () Bool)

(assert (=> b!393496 m!389943))

(declare-fun m!389945 () Bool)

(assert (=> b!393496 m!389945))

(declare-fun m!389947 () Bool)

(assert (=> b!393496 m!389947))

(declare-fun m!389949 () Bool)

(assert (=> b!393496 m!389949))

(declare-fun m!389951 () Bool)

(assert (=> b!393496 m!389951))

(declare-fun m!389953 () Bool)

(assert (=> b!393496 m!389953))

(declare-fun m!389955 () Bool)

(assert (=> b!393496 m!389955))

(assert (=> b!393496 m!389937))

(declare-fun m!389957 () Bool)

(assert (=> b!393496 m!389957))

(assert (=> b!393496 m!389855))

(declare-fun m!389959 () Bool)

(assert (=> b!393496 m!389959))

(declare-fun m!389961 () Bool)

(assert (=> b!393496 m!389961))

(assert (=> b!393496 m!389959))

(declare-fun m!389963 () Bool)

(assert (=> b!393496 m!389963))

(assert (=> b!393496 m!389951))

(declare-fun m!389965 () Bool)

(assert (=> b!393496 m!389965))

(declare-fun m!389967 () Bool)

(assert (=> b!393496 m!389967))

(assert (=> b!393496 m!389947))

(declare-fun m!389969 () Bool)

(assert (=> b!393497 m!389969))

(declare-fun m!389971 () Bool)

(assert (=> b!393497 m!389971))

(assert (=> b!393497 m!389963))

(assert (=> b!393497 m!389963))

(declare-fun m!389973 () Bool)

(assert (=> b!393497 m!389973))

(assert (=> b!393497 m!389971))

(assert (=> b!393497 m!389969))

(declare-fun m!389975 () Bool)

(assert (=> b!393497 m!389975))

(assert (=> b!393507 m!389963))

(assert (=> b!393507 m!389963))

(declare-fun m!389977 () Bool)

(assert (=> b!393507 m!389977))

(declare-fun m!389979 () Bool)

(assert (=> bm!27789 m!389979))

(declare-fun m!389981 () Bool)

(assert (=> bm!27783 m!389981))

(assert (=> b!393500 m!389963))

(assert (=> b!393500 m!389963))

(declare-fun m!389983 () Bool)

(assert (=> b!393500 m!389983))

(declare-fun m!389985 () Bool)

(assert (=> b!393504 m!389985))

(declare-fun m!389987 () Bool)

(assert (=> b!393489 m!389987))

(assert (=> b!393488 m!389963))

(assert (=> b!393488 m!389963))

(assert (=> b!393488 m!389977))

(assert (=> d!73211 m!389879))

(assert (=> bm!27787 m!389855))

(declare-fun m!389989 () Bool)

(assert (=> b!393506 m!389989))

(assert (=> b!393381 d!73211))

(declare-fun b!393535 () Bool)

(declare-fun e!238266 () ListLongMap!5525)

(assert (=> b!393535 (= e!238266 (ListLongMap!5526 Nil!6463))))

(declare-fun b!393536 () Bool)

(declare-fun e!238261 () Bool)

(declare-fun lt!186277 () ListLongMap!5525)

(declare-fun isEmpty!553 (ListLongMap!5525) Bool)

(assert (=> b!393536 (= e!238261 (isEmpty!553 lt!186277))))

(declare-fun b!393537 () Bool)

(declare-fun e!238262 () Bool)

(assert (=> b!393537 (= e!238262 e!238261)))

(declare-fun c!54465 () Bool)

(assert (=> b!393537 (= c!54465 (bvslt #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(declare-fun b!393538 () Bool)

(declare-fun e!238263 () ListLongMap!5525)

(assert (=> b!393538 (= e!238266 e!238263)))

(declare-fun c!54466 () Bool)

(assert (=> b!393538 (= c!54466 (validKeyInArray!0 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393539 () Bool)

(declare-fun e!238265 () Bool)

(assert (=> b!393539 (= e!238262 e!238265)))

(assert (=> b!393539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(declare-fun res!225465 () Bool)

(assert (=> b!393539 (= res!225465 (contains!2471 lt!186277 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393539 (=> (not res!225465) (not e!238265))))

(declare-fun b!393541 () Bool)

(declare-fun lt!186283 () Unit!12032)

(declare-fun lt!186278 () Unit!12032)

(assert (=> b!393541 (= lt!186283 lt!186278)))

(declare-fun lt!186281 () (_ BitVec 64))

(declare-fun lt!186279 () V!14053)

(declare-fun lt!186280 () (_ BitVec 64))

(declare-fun lt!186282 () ListLongMap!5525)

(assert (=> b!393541 (not (contains!2471 (+!1073 lt!186282 (tuple2!6613 lt!186281 lt!186279)) lt!186280))))

(declare-fun addStillNotContains!140 (ListLongMap!5525 (_ BitVec 64) V!14053 (_ BitVec 64)) Unit!12032)

(assert (=> b!393541 (= lt!186278 (addStillNotContains!140 lt!186282 lt!186281 lt!186279 lt!186280))))

(assert (=> b!393541 (= lt!186280 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!393541 (= lt!186279 (get!5617 (select (arr!11122 _values!506) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!393541 (= lt!186281 (select (arr!11123 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27795 () ListLongMap!5525)

(assert (=> b!393541 (= lt!186282 call!27795)))

(assert (=> b!393541 (= e!238263 (+!1073 call!27795 (tuple2!6613 (select (arr!11123 _keys!658) #b00000000000000000000000000000000) (get!5617 (select (arr!11122 _values!506) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!393542 () Bool)

(declare-fun e!238267 () Bool)

(assert (=> b!393542 (= e!238267 (validKeyInArray!0 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393542 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!393543 () Bool)

(assert (=> b!393543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(assert (=> b!393543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11474 _values!506)))))

(assert (=> b!393543 (= e!238265 (= (apply!307 lt!186277 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)) (get!5617 (select (arr!11122 _values!506) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!393544 () Bool)

(assert (=> b!393544 (= e!238263 call!27795)))

(declare-fun b!393545 () Bool)

(assert (=> b!393545 (= e!238261 (= lt!186277 (getCurrentListMapNoExtraKeys!999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun bm!27792 () Bool)

(assert (=> bm!27792 (= call!27795 (getCurrentListMapNoExtraKeys!999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!393546 () Bool)

(declare-fun e!238264 () Bool)

(assert (=> b!393546 (= e!238264 e!238262)))

(declare-fun c!54464 () Bool)

(assert (=> b!393546 (= c!54464 e!238267)))

(declare-fun res!225467 () Bool)

(assert (=> b!393546 (=> (not res!225467) (not e!238267))))

(assert (=> b!393546 (= res!225467 (bvslt #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(declare-fun d!73213 () Bool)

(assert (=> d!73213 e!238264))

(declare-fun res!225466 () Bool)

(assert (=> d!73213 (=> (not res!225466) (not e!238264))))

(assert (=> d!73213 (= res!225466 (not (contains!2471 lt!186277 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73213 (= lt!186277 e!238266)))

(declare-fun c!54467 () Bool)

(assert (=> d!73213 (= c!54467 (bvsge #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(assert (=> d!73213 (validMask!0 mask!970)))

(assert (=> d!73213 (= (getCurrentListMapNoExtraKeys!999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186277)))

(declare-fun b!393540 () Bool)

(declare-fun res!225468 () Bool)

(assert (=> b!393540 (=> (not res!225468) (not e!238264))))

(assert (=> b!393540 (= res!225468 (not (contains!2471 lt!186277 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!73213 c!54467) b!393535))

(assert (= (and d!73213 (not c!54467)) b!393538))

(assert (= (and b!393538 c!54466) b!393541))

(assert (= (and b!393538 (not c!54466)) b!393544))

(assert (= (or b!393541 b!393544) bm!27792))

(assert (= (and d!73213 res!225466) b!393540))

(assert (= (and b!393540 res!225468) b!393546))

(assert (= (and b!393546 res!225467) b!393542))

(assert (= (and b!393546 c!54464) b!393539))

(assert (= (and b!393546 (not c!54464)) b!393537))

(assert (= (and b!393539 res!225465) b!393543))

(assert (= (and b!393537 c!54465) b!393545))

(assert (= (and b!393537 (not c!54465)) b!393536))

(declare-fun b_lambda!8769 () Bool)

(assert (=> (not b_lambda!8769) (not b!393541)))

(assert (=> b!393541 t!11640))

(declare-fun b_and!16407 () Bool)

(assert (= b_and!16405 (and (=> t!11640 result!5767) b_and!16407)))

(declare-fun b_lambda!8771 () Bool)

(assert (=> (not b_lambda!8771) (not b!393543)))

(assert (=> b!393543 t!11640))

(declare-fun b_and!16409 () Bool)

(assert (= b_and!16407 (and (=> t!11640 result!5767) b_and!16409)))

(declare-fun m!389991 () Bool)

(assert (=> b!393540 m!389991))

(assert (=> b!393539 m!389927))

(assert (=> b!393539 m!389927))

(declare-fun m!389993 () Bool)

(assert (=> b!393539 m!389993))

(assert (=> b!393542 m!389927))

(assert (=> b!393542 m!389927))

(assert (=> b!393542 m!389929))

(declare-fun m!389995 () Bool)

(assert (=> d!73213 m!389995))

(assert (=> d!73213 m!389879))

(declare-fun m!389997 () Bool)

(assert (=> b!393545 m!389997))

(assert (=> b!393538 m!389927))

(assert (=> b!393538 m!389927))

(assert (=> b!393538 m!389929))

(declare-fun m!389999 () Bool)

(assert (=> b!393543 m!389999))

(assert (=> b!393543 m!389969))

(declare-fun m!390001 () Bool)

(assert (=> b!393543 m!390001))

(assert (=> b!393543 m!389927))

(declare-fun m!390003 () Bool)

(assert (=> b!393543 m!390003))

(assert (=> b!393543 m!389999))

(assert (=> b!393543 m!389969))

(assert (=> b!393543 m!389927))

(declare-fun m!390005 () Bool)

(assert (=> b!393541 m!390005))

(assert (=> b!393541 m!390005))

(declare-fun m!390007 () Bool)

(assert (=> b!393541 m!390007))

(assert (=> b!393541 m!389999))

(assert (=> b!393541 m!389969))

(assert (=> b!393541 m!390001))

(declare-fun m!390009 () Bool)

(assert (=> b!393541 m!390009))

(declare-fun m!390011 () Bool)

(assert (=> b!393541 m!390011))

(assert (=> b!393541 m!389999))

(assert (=> b!393541 m!389969))

(assert (=> b!393541 m!389927))

(declare-fun m!390013 () Bool)

(assert (=> b!393536 m!390013))

(assert (=> bm!27792 m!389997))

(assert (=> b!393381 d!73213))

(declare-fun b!393547 () Bool)

(declare-fun e!238273 () Bool)

(assert (=> b!393547 (= e!238273 (validKeyInArray!0 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun call!27801 () ListLongMap!5525)

(declare-fun call!27799 () ListLongMap!5525)

(declare-fun call!27802 () ListLongMap!5525)

(declare-fun call!27800 () ListLongMap!5525)

(declare-fun bm!27793 () Bool)

(declare-fun c!54471 () Bool)

(declare-fun c!54473 () Bool)

(assert (=> bm!27793 (= call!27801 (+!1073 (ite c!54473 call!27799 (ite c!54471 call!27802 call!27800)) (ite (or c!54473 c!54471) (tuple2!6613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!393549 () Bool)

(declare-fun e!238274 () ListLongMap!5525)

(declare-fun call!27796 () ListLongMap!5525)

(assert (=> b!393549 (= e!238274 call!27796)))

(declare-fun b!393550 () Bool)

(declare-fun res!225475 () Bool)

(declare-fun e!238271 () Bool)

(assert (=> b!393550 (=> (not res!225475) (not e!238271))))

(declare-fun e!238269 () Bool)

(assert (=> b!393550 (= res!225475 e!238269)))

(declare-fun res!225474 () Bool)

(assert (=> b!393550 (=> res!225474 e!238269)))

(declare-fun e!238279 () Bool)

(assert (=> b!393550 (= res!225474 (not e!238279))))

(declare-fun res!225470 () Bool)

(assert (=> b!393550 (=> (not res!225470) (not e!238279))))

(assert (=> b!393550 (= res!225470 (bvslt #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(declare-fun bm!27794 () Bool)

(assert (=> bm!27794 (= call!27802 call!27799)))

(declare-fun b!393551 () Bool)

(declare-fun e!238277 () Bool)

(declare-fun e!238270 () Bool)

(assert (=> b!393551 (= e!238277 e!238270)))

(declare-fun res!225472 () Bool)

(declare-fun call!27797 () Bool)

(assert (=> b!393551 (= res!225472 call!27797)))

(assert (=> b!393551 (=> (not res!225472) (not e!238270))))

(declare-fun b!393552 () Bool)

(declare-fun e!238275 () Bool)

(declare-fun call!27798 () Bool)

(assert (=> b!393552 (= e!238275 (not call!27798))))

(declare-fun b!393553 () Bool)

(declare-fun e!238280 () ListLongMap!5525)

(assert (=> b!393553 (= e!238280 call!27796)))

(declare-fun bm!27795 () Bool)

(assert (=> bm!27795 (= call!27796 call!27801)))

(declare-fun b!393554 () Bool)

(declare-fun e!238272 () Unit!12032)

(declare-fun Unit!12037 () Unit!12032)

(assert (=> b!393554 (= e!238272 Unit!12037)))

(declare-fun b!393555 () Bool)

(declare-fun lt!186293 () Unit!12032)

(assert (=> b!393555 (= e!238272 lt!186293)))

(declare-fun lt!186292 () ListLongMap!5525)

(assert (=> b!393555 (= lt!186292 (getCurrentListMapNoExtraKeys!999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186301 () (_ BitVec 64))

(assert (=> b!393555 (= lt!186301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186288 () (_ BitVec 64))

(assert (=> b!393555 (= lt!186288 (select (arr!11123 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186297 () Unit!12032)

(assert (=> b!393555 (= lt!186297 (addStillContains!283 lt!186292 lt!186301 zeroValue!472 lt!186288))))

(assert (=> b!393555 (contains!2471 (+!1073 lt!186292 (tuple2!6613 lt!186301 zeroValue!472)) lt!186288)))

(declare-fun lt!186303 () Unit!12032)

(assert (=> b!393555 (= lt!186303 lt!186297)))

(declare-fun lt!186294 () ListLongMap!5525)

(assert (=> b!393555 (= lt!186294 (getCurrentListMapNoExtraKeys!999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186296 () (_ BitVec 64))

(assert (=> b!393555 (= lt!186296 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186302 () (_ BitVec 64))

(assert (=> b!393555 (= lt!186302 (select (arr!11123 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186300 () Unit!12032)

(assert (=> b!393555 (= lt!186300 (addApplyDifferent!283 lt!186294 lt!186296 minValue!472 lt!186302))))

(assert (=> b!393555 (= (apply!307 (+!1073 lt!186294 (tuple2!6613 lt!186296 minValue!472)) lt!186302) (apply!307 lt!186294 lt!186302))))

(declare-fun lt!186305 () Unit!12032)

(assert (=> b!393555 (= lt!186305 lt!186300)))

(declare-fun lt!186291 () ListLongMap!5525)

(assert (=> b!393555 (= lt!186291 (getCurrentListMapNoExtraKeys!999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186289 () (_ BitVec 64))

(assert (=> b!393555 (= lt!186289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186284 () (_ BitVec 64))

(assert (=> b!393555 (= lt!186284 (select (arr!11123 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186285 () Unit!12032)

(assert (=> b!393555 (= lt!186285 (addApplyDifferent!283 lt!186291 lt!186289 zeroValue!472 lt!186284))))

(assert (=> b!393555 (= (apply!307 (+!1073 lt!186291 (tuple2!6613 lt!186289 zeroValue!472)) lt!186284) (apply!307 lt!186291 lt!186284))))

(declare-fun lt!186299 () Unit!12032)

(assert (=> b!393555 (= lt!186299 lt!186285)))

(declare-fun lt!186304 () ListLongMap!5525)

(assert (=> b!393555 (= lt!186304 (getCurrentListMapNoExtraKeys!999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186295 () (_ BitVec 64))

(assert (=> b!393555 (= lt!186295 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186290 () (_ BitVec 64))

(assert (=> b!393555 (= lt!186290 (select (arr!11123 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!393555 (= lt!186293 (addApplyDifferent!283 lt!186304 lt!186295 minValue!472 lt!186290))))

(assert (=> b!393555 (= (apply!307 (+!1073 lt!186304 (tuple2!6613 lt!186295 minValue!472)) lt!186290) (apply!307 lt!186304 lt!186290))))

(declare-fun e!238278 () Bool)

(declare-fun b!393556 () Bool)

(declare-fun lt!186286 () ListLongMap!5525)

(assert (=> b!393556 (= e!238278 (= (apply!307 lt!186286 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)) (get!5617 (select (arr!11122 _values!506) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393556 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11474 _values!506)))))

(assert (=> b!393556 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(declare-fun b!393557 () Bool)

(assert (=> b!393557 (= e!238277 (not call!27797))))

(declare-fun b!393558 () Bool)

(declare-fun e!238268 () ListLongMap!5525)

(assert (=> b!393558 (= e!238268 e!238274)))

(assert (=> b!393558 (= c!54471 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27796 () Bool)

(assert (=> bm!27796 (= call!27800 call!27802)))

(declare-fun b!393548 () Bool)

(declare-fun e!238276 () Bool)

(assert (=> b!393548 (= e!238276 (= (apply!307 lt!186286 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun d!73215 () Bool)

(assert (=> d!73215 e!238271))

(declare-fun res!225471 () Bool)

(assert (=> d!73215 (=> (not res!225471) (not e!238271))))

(assert (=> d!73215 (= res!225471 (or (bvsge #b00000000000000000000000000000000 (size!11475 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11475 _keys!658)))))))

(declare-fun lt!186298 () ListLongMap!5525)

(assert (=> d!73215 (= lt!186286 lt!186298)))

(declare-fun lt!186287 () Unit!12032)

(assert (=> d!73215 (= lt!186287 e!238272)))

(declare-fun c!54469 () Bool)

(assert (=> d!73215 (= c!54469 e!238273)))

(declare-fun res!225477 () Bool)

(assert (=> d!73215 (=> (not res!225477) (not e!238273))))

(assert (=> d!73215 (= res!225477 (bvslt #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(assert (=> d!73215 (= lt!186298 e!238268)))

(assert (=> d!73215 (= c!54473 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73215 (validMask!0 mask!970)))

(assert (=> d!73215 (= (getCurrentListMap!2119 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186286)))

(declare-fun bm!27797 () Bool)

(assert (=> bm!27797 (= call!27799 (getCurrentListMapNoExtraKeys!999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393559 () Bool)

(assert (=> b!393559 (= e!238269 e!238278)))

(declare-fun res!225476 () Bool)

(assert (=> b!393559 (=> (not res!225476) (not e!238278))))

(assert (=> b!393559 (= res!225476 (contains!2471 lt!186286 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(declare-fun b!393560 () Bool)

(assert (=> b!393560 (= e!238280 call!27800)))

(declare-fun b!393561 () Bool)

(assert (=> b!393561 (= e!238271 e!238277)))

(declare-fun c!54470 () Bool)

(assert (=> b!393561 (= c!54470 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!393562 () Bool)

(declare-fun c!54472 () Bool)

(assert (=> b!393562 (= c!54472 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!393562 (= e!238274 e!238280)))

(declare-fun b!393563 () Bool)

(assert (=> b!393563 (= e!238270 (= (apply!307 lt!186286 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!393564 () Bool)

(declare-fun res!225469 () Bool)

(assert (=> b!393564 (=> (not res!225469) (not e!238271))))

(assert (=> b!393564 (= res!225469 e!238275)))

(declare-fun c!54468 () Bool)

(assert (=> b!393564 (= c!54468 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27798 () Bool)

(assert (=> bm!27798 (= call!27798 (contains!2471 lt!186286 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27799 () Bool)

(assert (=> bm!27799 (= call!27797 (contains!2471 lt!186286 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!393565 () Bool)

(assert (=> b!393565 (= e!238268 (+!1073 call!27801 (tuple2!6613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!393566 () Bool)

(assert (=> b!393566 (= e!238279 (validKeyInArray!0 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393567 () Bool)

(assert (=> b!393567 (= e!238275 e!238276)))

(declare-fun res!225473 () Bool)

(assert (=> b!393567 (= res!225473 call!27798)))

(assert (=> b!393567 (=> (not res!225473) (not e!238276))))

(assert (= (and d!73215 c!54473) b!393565))

(assert (= (and d!73215 (not c!54473)) b!393558))

(assert (= (and b!393558 c!54471) b!393549))

(assert (= (and b!393558 (not c!54471)) b!393562))

(assert (= (and b!393562 c!54472) b!393553))

(assert (= (and b!393562 (not c!54472)) b!393560))

(assert (= (or b!393553 b!393560) bm!27796))

(assert (= (or b!393549 bm!27796) bm!27794))

(assert (= (or b!393549 b!393553) bm!27795))

(assert (= (or b!393565 bm!27794) bm!27797))

(assert (= (or b!393565 bm!27795) bm!27793))

(assert (= (and d!73215 res!225477) b!393547))

(assert (= (and d!73215 c!54469) b!393555))

(assert (= (and d!73215 (not c!54469)) b!393554))

(assert (= (and d!73215 res!225471) b!393550))

(assert (= (and b!393550 res!225470) b!393566))

(assert (= (and b!393550 (not res!225474)) b!393559))

(assert (= (and b!393559 res!225476) b!393556))

(assert (= (and b!393550 res!225475) b!393564))

(assert (= (and b!393564 c!54468) b!393567))

(assert (= (and b!393564 (not c!54468)) b!393552))

(assert (= (and b!393567 res!225473) b!393548))

(assert (= (or b!393567 b!393552) bm!27798))

(assert (= (and b!393564 res!225469) b!393561))

(assert (= (and b!393561 c!54470) b!393551))

(assert (= (and b!393561 (not c!54470)) b!393557))

(assert (= (and b!393551 res!225472) b!393563))

(assert (= (or b!393551 b!393557) bm!27799))

(declare-fun b_lambda!8773 () Bool)

(assert (=> (not b_lambda!8773) (not b!393556)))

(assert (=> b!393556 t!11640))

(declare-fun b_and!16411 () Bool)

(assert (= b_and!16409 (and (=> t!11640 result!5767) b_and!16411)))

(declare-fun m!390015 () Bool)

(assert (=> bm!27798 m!390015))

(declare-fun m!390017 () Bool)

(assert (=> b!393555 m!390017))

(declare-fun m!390019 () Bool)

(assert (=> b!393555 m!390019))

(declare-fun m!390021 () Bool)

(assert (=> b!393555 m!390021))

(declare-fun m!390023 () Bool)

(assert (=> b!393555 m!390023))

(declare-fun m!390025 () Bool)

(assert (=> b!393555 m!390025))

(declare-fun m!390027 () Bool)

(assert (=> b!393555 m!390027))

(declare-fun m!390029 () Bool)

(assert (=> b!393555 m!390029))

(declare-fun m!390031 () Bool)

(assert (=> b!393555 m!390031))

(declare-fun m!390033 () Bool)

(assert (=> b!393555 m!390033))

(declare-fun m!390035 () Bool)

(assert (=> b!393555 m!390035))

(assert (=> b!393555 m!390017))

(declare-fun m!390037 () Bool)

(assert (=> b!393555 m!390037))

(assert (=> b!393555 m!389851))

(declare-fun m!390039 () Bool)

(assert (=> b!393555 m!390039))

(declare-fun m!390041 () Bool)

(assert (=> b!393555 m!390041))

(assert (=> b!393555 m!390039))

(assert (=> b!393555 m!389927))

(assert (=> b!393555 m!390031))

(declare-fun m!390043 () Bool)

(assert (=> b!393555 m!390043))

(declare-fun m!390045 () Bool)

(assert (=> b!393555 m!390045))

(assert (=> b!393555 m!390027))

(assert (=> b!393556 m!389969))

(assert (=> b!393556 m!389999))

(assert (=> b!393556 m!389927))

(assert (=> b!393556 m!389927))

(declare-fun m!390047 () Bool)

(assert (=> b!393556 m!390047))

(assert (=> b!393556 m!389999))

(assert (=> b!393556 m!389969))

(assert (=> b!393556 m!390001))

(assert (=> b!393566 m!389927))

(assert (=> b!393566 m!389927))

(assert (=> b!393566 m!389929))

(declare-fun m!390049 () Bool)

(assert (=> bm!27799 m!390049))

(declare-fun m!390051 () Bool)

(assert (=> bm!27793 m!390051))

(assert (=> b!393559 m!389927))

(assert (=> b!393559 m!389927))

(declare-fun m!390053 () Bool)

(assert (=> b!393559 m!390053))

(declare-fun m!390055 () Bool)

(assert (=> b!393563 m!390055))

(declare-fun m!390057 () Bool)

(assert (=> b!393548 m!390057))

(assert (=> b!393547 m!389927))

(assert (=> b!393547 m!389927))

(assert (=> b!393547 m!389929))

(assert (=> d!73215 m!389879))

(assert (=> bm!27797 m!389851))

(declare-fun m!390059 () Bool)

(assert (=> b!393565 m!390059))

(assert (=> b!393381 d!73215))

(declare-fun b!393568 () Bool)

(declare-fun e!238286 () ListLongMap!5525)

(assert (=> b!393568 (= e!238286 (ListLongMap!5526 Nil!6463))))

(declare-fun b!393569 () Bool)

(declare-fun e!238281 () Bool)

(declare-fun lt!186306 () ListLongMap!5525)

(assert (=> b!393569 (= e!238281 (isEmpty!553 lt!186306))))

(declare-fun b!393570 () Bool)

(declare-fun e!238282 () Bool)

(assert (=> b!393570 (= e!238282 e!238281)))

(declare-fun c!54475 () Bool)

(assert (=> b!393570 (= c!54475 (bvslt #b00000000000000000000000000000000 (size!11475 lt!186165)))))

(declare-fun b!393571 () Bool)

(declare-fun e!238283 () ListLongMap!5525)

(assert (=> b!393571 (= e!238286 e!238283)))

(declare-fun c!54476 () Bool)

(assert (=> b!393571 (= c!54476 (validKeyInArray!0 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)))))

(declare-fun b!393572 () Bool)

(declare-fun e!238285 () Bool)

(assert (=> b!393572 (= e!238282 e!238285)))

(assert (=> b!393572 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11475 lt!186165)))))

(declare-fun res!225478 () Bool)

(assert (=> b!393572 (= res!225478 (contains!2471 lt!186306 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)))))

(assert (=> b!393572 (=> (not res!225478) (not e!238285))))

(declare-fun b!393574 () Bool)

(declare-fun lt!186312 () Unit!12032)

(declare-fun lt!186307 () Unit!12032)

(assert (=> b!393574 (= lt!186312 lt!186307)))

(declare-fun lt!186310 () (_ BitVec 64))

(declare-fun lt!186311 () ListLongMap!5525)

(declare-fun lt!186309 () (_ BitVec 64))

(declare-fun lt!186308 () V!14053)

(assert (=> b!393574 (not (contains!2471 (+!1073 lt!186311 (tuple2!6613 lt!186310 lt!186308)) lt!186309))))

(assert (=> b!393574 (= lt!186307 (addStillNotContains!140 lt!186311 lt!186310 lt!186308 lt!186309))))

(assert (=> b!393574 (= lt!186309 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!393574 (= lt!186308 (get!5617 (select (arr!11122 lt!186167) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!393574 (= lt!186310 (select (arr!11123 lt!186165) #b00000000000000000000000000000000))))

(declare-fun call!27803 () ListLongMap!5525)

(assert (=> b!393574 (= lt!186311 call!27803)))

(assert (=> b!393574 (= e!238283 (+!1073 call!27803 (tuple2!6613 (select (arr!11123 lt!186165) #b00000000000000000000000000000000) (get!5617 (select (arr!11122 lt!186167) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!393575 () Bool)

(declare-fun e!238287 () Bool)

(assert (=> b!393575 (= e!238287 (validKeyInArray!0 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)))))

(assert (=> b!393575 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!393576 () Bool)

(assert (=> b!393576 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11475 lt!186165)))))

(assert (=> b!393576 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11474 lt!186167)))))

(assert (=> b!393576 (= e!238285 (= (apply!307 lt!186306 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)) (get!5617 (select (arr!11122 lt!186167) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!393577 () Bool)

(assert (=> b!393577 (= e!238283 call!27803)))

(declare-fun b!393578 () Bool)

(assert (=> b!393578 (= e!238281 (= lt!186306 (getCurrentListMapNoExtraKeys!999 lt!186165 lt!186167 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun bm!27800 () Bool)

(assert (=> bm!27800 (= call!27803 (getCurrentListMapNoExtraKeys!999 lt!186165 lt!186167 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!393579 () Bool)

(declare-fun e!238284 () Bool)

(assert (=> b!393579 (= e!238284 e!238282)))

(declare-fun c!54474 () Bool)

(assert (=> b!393579 (= c!54474 e!238287)))

(declare-fun res!225480 () Bool)

(assert (=> b!393579 (=> (not res!225480) (not e!238287))))

(assert (=> b!393579 (= res!225480 (bvslt #b00000000000000000000000000000000 (size!11475 lt!186165)))))

(declare-fun d!73217 () Bool)

(assert (=> d!73217 e!238284))

(declare-fun res!225479 () Bool)

(assert (=> d!73217 (=> (not res!225479) (not e!238284))))

(assert (=> d!73217 (= res!225479 (not (contains!2471 lt!186306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73217 (= lt!186306 e!238286)))

(declare-fun c!54477 () Bool)

(assert (=> d!73217 (= c!54477 (bvsge #b00000000000000000000000000000000 (size!11475 lt!186165)))))

(assert (=> d!73217 (validMask!0 mask!970)))

(assert (=> d!73217 (= (getCurrentListMapNoExtraKeys!999 lt!186165 lt!186167 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186306)))

(declare-fun b!393573 () Bool)

(declare-fun res!225481 () Bool)

(assert (=> b!393573 (=> (not res!225481) (not e!238284))))

(assert (=> b!393573 (= res!225481 (not (contains!2471 lt!186306 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!73217 c!54477) b!393568))

(assert (= (and d!73217 (not c!54477)) b!393571))

(assert (= (and b!393571 c!54476) b!393574))

(assert (= (and b!393571 (not c!54476)) b!393577))

(assert (= (or b!393574 b!393577) bm!27800))

(assert (= (and d!73217 res!225479) b!393573))

(assert (= (and b!393573 res!225481) b!393579))

(assert (= (and b!393579 res!225480) b!393575))

(assert (= (and b!393579 c!54474) b!393572))

(assert (= (and b!393579 (not c!54474)) b!393570))

(assert (= (and b!393572 res!225478) b!393576))

(assert (= (and b!393570 c!54475) b!393578))

(assert (= (and b!393570 (not c!54475)) b!393569))

(declare-fun b_lambda!8775 () Bool)

(assert (=> (not b_lambda!8775) (not b!393574)))

(assert (=> b!393574 t!11640))

(declare-fun b_and!16413 () Bool)

(assert (= b_and!16411 (and (=> t!11640 result!5767) b_and!16413)))

(declare-fun b_lambda!8777 () Bool)

(assert (=> (not b_lambda!8777) (not b!393576)))

(assert (=> b!393576 t!11640))

(declare-fun b_and!16415 () Bool)

(assert (= b_and!16413 (and (=> t!11640 result!5767) b_and!16415)))

(declare-fun m!390061 () Bool)

(assert (=> b!393573 m!390061))

(assert (=> b!393572 m!389963))

(assert (=> b!393572 m!389963))

(declare-fun m!390063 () Bool)

(assert (=> b!393572 m!390063))

(assert (=> b!393575 m!389963))

(assert (=> b!393575 m!389963))

(assert (=> b!393575 m!389977))

(declare-fun m!390065 () Bool)

(assert (=> d!73217 m!390065))

(assert (=> d!73217 m!389879))

(declare-fun m!390067 () Bool)

(assert (=> b!393578 m!390067))

(assert (=> b!393571 m!389963))

(assert (=> b!393571 m!389963))

(assert (=> b!393571 m!389977))

(assert (=> b!393576 m!389971))

(assert (=> b!393576 m!389969))

(assert (=> b!393576 m!389975))

(assert (=> b!393576 m!389963))

(declare-fun m!390069 () Bool)

(assert (=> b!393576 m!390069))

(assert (=> b!393576 m!389971))

(assert (=> b!393576 m!389969))

(assert (=> b!393576 m!389963))

(declare-fun m!390071 () Bool)

(assert (=> b!393574 m!390071))

(assert (=> b!393574 m!390071))

(declare-fun m!390073 () Bool)

(assert (=> b!393574 m!390073))

(assert (=> b!393574 m!389971))

(assert (=> b!393574 m!389969))

(assert (=> b!393574 m!389975))

(declare-fun m!390075 () Bool)

(assert (=> b!393574 m!390075))

(declare-fun m!390077 () Bool)

(assert (=> b!393574 m!390077))

(assert (=> b!393574 m!389971))

(assert (=> b!393574 m!389969))

(assert (=> b!393574 m!389963))

(declare-fun m!390079 () Bool)

(assert (=> b!393569 m!390079))

(assert (=> bm!27800 m!390067))

(assert (=> b!393381 d!73217))

(declare-fun d!73219 () Bool)

(declare-fun e!238290 () Bool)

(assert (=> d!73219 e!238290))

(declare-fun res!225487 () Bool)

(assert (=> d!73219 (=> (not res!225487) (not e!238290))))

(declare-fun lt!186321 () ListLongMap!5525)

(assert (=> d!73219 (= res!225487 (contains!2471 lt!186321 (_1!3317 (tuple2!6613 k0!778 v!373))))))

(declare-fun lt!186324 () List!6466)

(assert (=> d!73219 (= lt!186321 (ListLongMap!5526 lt!186324))))

(declare-fun lt!186322 () Unit!12032)

(declare-fun lt!186323 () Unit!12032)

(assert (=> d!73219 (= lt!186322 lt!186323)))

(declare-datatypes ((Option!371 0))(
  ( (Some!370 (v!7142 V!14053)) (None!369) )
))
(declare-fun getValueByKey!365 (List!6466 (_ BitVec 64)) Option!371)

(assert (=> d!73219 (= (getValueByKey!365 lt!186324 (_1!3317 (tuple2!6613 k0!778 v!373))) (Some!370 (_2!3317 (tuple2!6613 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!187 (List!6466 (_ BitVec 64) V!14053) Unit!12032)

(assert (=> d!73219 (= lt!186323 (lemmaContainsTupThenGetReturnValue!187 lt!186324 (_1!3317 (tuple2!6613 k0!778 v!373)) (_2!3317 (tuple2!6613 k0!778 v!373))))))

(declare-fun insertStrictlySorted!190 (List!6466 (_ BitVec 64) V!14053) List!6466)

(assert (=> d!73219 (= lt!186324 (insertStrictlySorted!190 (toList!2778 lt!186168) (_1!3317 (tuple2!6613 k0!778 v!373)) (_2!3317 (tuple2!6613 k0!778 v!373))))))

(assert (=> d!73219 (= (+!1073 lt!186168 (tuple2!6613 k0!778 v!373)) lt!186321)))

(declare-fun b!393584 () Bool)

(declare-fun res!225486 () Bool)

(assert (=> b!393584 (=> (not res!225486) (not e!238290))))

(assert (=> b!393584 (= res!225486 (= (getValueByKey!365 (toList!2778 lt!186321) (_1!3317 (tuple2!6613 k0!778 v!373))) (Some!370 (_2!3317 (tuple2!6613 k0!778 v!373)))))))

(declare-fun b!393585 () Bool)

(declare-fun contains!2472 (List!6466 tuple2!6612) Bool)

(assert (=> b!393585 (= e!238290 (contains!2472 (toList!2778 lt!186321) (tuple2!6613 k0!778 v!373)))))

(assert (= (and d!73219 res!225487) b!393584))

(assert (= (and b!393584 res!225486) b!393585))

(declare-fun m!390081 () Bool)

(assert (=> d!73219 m!390081))

(declare-fun m!390083 () Bool)

(assert (=> d!73219 m!390083))

(declare-fun m!390085 () Bool)

(assert (=> d!73219 m!390085))

(declare-fun m!390087 () Bool)

(assert (=> d!73219 m!390087))

(declare-fun m!390089 () Bool)

(assert (=> b!393584 m!390089))

(declare-fun m!390091 () Bool)

(assert (=> b!393585 m!390091))

(assert (=> b!393381 d!73219))

(declare-fun call!27808 () ListLongMap!5525)

(declare-fun call!27809 () ListLongMap!5525)

(declare-fun b!393592 () Bool)

(declare-fun e!238296 () Bool)

(assert (=> b!393592 (= e!238296 (= call!27809 (+!1073 call!27808 (tuple2!6613 k0!778 v!373))))))

(declare-fun bm!27805 () Bool)

(assert (=> bm!27805 (= call!27808 (getCurrentListMapNoExtraKeys!999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27806 () Bool)

(assert (=> bm!27806 (= call!27809 (getCurrentListMapNoExtraKeys!999 (array!23330 (store (arr!11123 _keys!658) i!548 k0!778) (size!11475 _keys!658)) (array!23328 (store (arr!11122 _values!506) i!548 (ValueCellFull!4512 v!373)) (size!11474 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393594 () Bool)

(declare-fun e!238295 () Bool)

(assert (=> b!393594 (= e!238295 e!238296)))

(declare-fun c!54480 () Bool)

(assert (=> b!393594 (= c!54480 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun d!73221 () Bool)

(assert (=> d!73221 e!238295))

(declare-fun res!225490 () Bool)

(assert (=> d!73221 (=> (not res!225490) (not e!238295))))

(assert (=> d!73221 (= res!225490 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11475 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11474 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11475 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11474 _values!506))))))))

(declare-fun lt!186327 () Unit!12032)

(declare-fun choose!1322 (array!23329 array!23327 (_ BitVec 32) (_ BitVec 32) V!14053 V!14053 (_ BitVec 32) (_ BitVec 64) V!14053 (_ BitVec 32) Int) Unit!12032)

(assert (=> d!73221 (= lt!186327 (choose!1322 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(assert (=> d!73221 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!283 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!186327)))

(declare-fun b!393593 () Bool)

(assert (=> b!393593 (= e!238296 (= call!27809 call!27808))))

(assert (= (and d!73221 res!225490) b!393594))

(assert (= (and b!393594 c!54480) b!393592))

(assert (= (and b!393594 (not c!54480)) b!393593))

(assert (= (or b!393592 b!393593) bm!27805))

(assert (= (or b!393592 b!393593) bm!27806))

(declare-fun m!390093 () Bool)

(assert (=> b!393592 m!390093))

(assert (=> bm!27805 m!389851))

(assert (=> bm!27806 m!389869))

(assert (=> bm!27806 m!389857))

(declare-fun m!390095 () Bool)

(assert (=> bm!27806 m!390095))

(declare-fun m!390097 () Bool)

(assert (=> d!73221 m!390097))

(assert (=> b!393381 d!73221))

(declare-fun b!393603 () Bool)

(declare-fun e!238303 () Bool)

(declare-fun call!27812 () Bool)

(assert (=> b!393603 (= e!238303 call!27812)))

(declare-fun b!393604 () Bool)

(declare-fun e!238304 () Bool)

(assert (=> b!393604 (= e!238304 e!238303)))

(declare-fun lt!186334 () (_ BitVec 64))

(assert (=> b!393604 (= lt!186334 (select (arr!11123 lt!186165) #b00000000000000000000000000000000))))

(declare-fun lt!186335 () Unit!12032)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23329 (_ BitVec 64) (_ BitVec 32)) Unit!12032)

(assert (=> b!393604 (= lt!186335 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!186165 lt!186334 #b00000000000000000000000000000000))))

(assert (=> b!393604 (arrayContainsKey!0 lt!186165 lt!186334 #b00000000000000000000000000000000)))

(declare-fun lt!186336 () Unit!12032)

(assert (=> b!393604 (= lt!186336 lt!186335)))

(declare-fun res!225495 () Bool)

(declare-datatypes ((SeekEntryResult!3518 0))(
  ( (MissingZero!3518 (index!16251 (_ BitVec 32))) (Found!3518 (index!16252 (_ BitVec 32))) (Intermediate!3518 (undefined!4330 Bool) (index!16253 (_ BitVec 32)) (x!38477 (_ BitVec 32))) (Undefined!3518) (MissingVacant!3518 (index!16254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23329 (_ BitVec 32)) SeekEntryResult!3518)

(assert (=> b!393604 (= res!225495 (= (seekEntryOrOpen!0 (select (arr!11123 lt!186165) #b00000000000000000000000000000000) lt!186165 mask!970) (Found!3518 #b00000000000000000000000000000000)))))

(assert (=> b!393604 (=> (not res!225495) (not e!238303))))

(declare-fun b!393605 () Bool)

(assert (=> b!393605 (= e!238304 call!27812)))

(declare-fun d!73223 () Bool)

(declare-fun res!225496 () Bool)

(declare-fun e!238305 () Bool)

(assert (=> d!73223 (=> res!225496 e!238305)))

(assert (=> d!73223 (= res!225496 (bvsge #b00000000000000000000000000000000 (size!11475 lt!186165)))))

(assert (=> d!73223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186165 mask!970) e!238305)))

(declare-fun b!393606 () Bool)

(assert (=> b!393606 (= e!238305 e!238304)))

(declare-fun c!54483 () Bool)

(assert (=> b!393606 (= c!54483 (validKeyInArray!0 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)))))

(declare-fun bm!27809 () Bool)

(assert (=> bm!27809 (= call!27812 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!186165 mask!970))))

(assert (= (and d!73223 (not res!225496)) b!393606))

(assert (= (and b!393606 c!54483) b!393604))

(assert (= (and b!393606 (not c!54483)) b!393605))

(assert (= (and b!393604 res!225495) b!393603))

(assert (= (or b!393603 b!393605) bm!27809))

(assert (=> b!393604 m!389963))

(declare-fun m!390099 () Bool)

(assert (=> b!393604 m!390099))

(declare-fun m!390101 () Bool)

(assert (=> b!393604 m!390101))

(assert (=> b!393604 m!389963))

(declare-fun m!390103 () Bool)

(assert (=> b!393604 m!390103))

(assert (=> b!393606 m!389963))

(assert (=> b!393606 m!389963))

(assert (=> b!393606 m!389977))

(declare-fun m!390105 () Bool)

(assert (=> bm!27809 m!390105))

(assert (=> b!393386 d!73223))

(declare-fun d!73225 () Bool)

(assert (=> d!73225 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393382 d!73225))

(declare-fun d!73227 () Bool)

(declare-fun res!225501 () Bool)

(declare-fun e!238310 () Bool)

(assert (=> d!73227 (=> res!225501 e!238310)))

(assert (=> d!73227 (= res!225501 (= (select (arr!11123 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73227 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!238310)))

(declare-fun b!393611 () Bool)

(declare-fun e!238311 () Bool)

(assert (=> b!393611 (= e!238310 e!238311)))

(declare-fun res!225502 () Bool)

(assert (=> b!393611 (=> (not res!225502) (not e!238311))))

(assert (=> b!393611 (= res!225502 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11475 _keys!658)))))

(declare-fun b!393612 () Bool)

(assert (=> b!393612 (= e!238311 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73227 (not res!225501)) b!393611))

(assert (= (and b!393611 res!225502) b!393612))

(assert (=> d!73227 m!389927))

(declare-fun m!390107 () Bool)

(assert (=> b!393612 m!390107))

(assert (=> b!393387 d!73227))

(declare-fun d!73229 () Bool)

(assert (=> d!73229 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38158 d!73229))

(declare-fun d!73231 () Bool)

(assert (=> d!73231 (= (array_inv!8168 _values!506) (bvsge (size!11474 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38158 d!73231))

(declare-fun d!73233 () Bool)

(assert (=> d!73233 (= (array_inv!8169 _keys!658) (bvsge (size!11475 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38158 d!73233))

(declare-fun b!393613 () Bool)

(declare-fun e!238315 () Bool)

(declare-fun e!238312 () Bool)

(assert (=> b!393613 (= e!238315 e!238312)))

(declare-fun res!225503 () Bool)

(assert (=> b!393613 (=> (not res!225503) (not e!238312))))

(declare-fun e!238313 () Bool)

(assert (=> b!393613 (= res!225503 (not e!238313))))

(declare-fun res!225505 () Bool)

(assert (=> b!393613 (=> (not res!225505) (not e!238313))))

(assert (=> b!393613 (= res!225505 (validKeyInArray!0 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)))))

(declare-fun b!393614 () Bool)

(assert (=> b!393614 (= e!238313 (contains!2470 Nil!6462 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)))))

(declare-fun b!393615 () Bool)

(declare-fun e!238314 () Bool)

(assert (=> b!393615 (= e!238312 e!238314)))

(declare-fun c!54484 () Bool)

(assert (=> b!393615 (= c!54484 (validKeyInArray!0 (select (arr!11123 lt!186165) #b00000000000000000000000000000000)))))

(declare-fun b!393616 () Bool)

(declare-fun call!27813 () Bool)

(assert (=> b!393616 (= e!238314 call!27813)))

(declare-fun bm!27810 () Bool)

(assert (=> bm!27810 (= call!27813 (arrayNoDuplicates!0 lt!186165 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54484 (Cons!6461 (select (arr!11123 lt!186165) #b00000000000000000000000000000000) Nil!6462) Nil!6462)))))

(declare-fun d!73235 () Bool)

(declare-fun res!225504 () Bool)

(assert (=> d!73235 (=> res!225504 e!238315)))

(assert (=> d!73235 (= res!225504 (bvsge #b00000000000000000000000000000000 (size!11475 lt!186165)))))

(assert (=> d!73235 (= (arrayNoDuplicates!0 lt!186165 #b00000000000000000000000000000000 Nil!6462) e!238315)))

(declare-fun b!393617 () Bool)

(assert (=> b!393617 (= e!238314 call!27813)))

(assert (= (and d!73235 (not res!225504)) b!393613))

(assert (= (and b!393613 res!225505) b!393614))

(assert (= (and b!393613 res!225503) b!393615))

(assert (= (and b!393615 c!54484) b!393616))

(assert (= (and b!393615 (not c!54484)) b!393617))

(assert (= (or b!393616 b!393617) bm!27810))

(assert (=> b!393613 m!389963))

(assert (=> b!393613 m!389963))

(assert (=> b!393613 m!389977))

(assert (=> b!393614 m!389963))

(assert (=> b!393614 m!389963))

(declare-fun m!390109 () Bool)

(assert (=> b!393614 m!390109))

(assert (=> b!393615 m!389963))

(assert (=> b!393615 m!389963))

(assert (=> b!393615 m!389977))

(assert (=> bm!27810 m!389963))

(declare-fun m!390111 () Bool)

(assert (=> bm!27810 m!390111))

(assert (=> b!393379 d!73235))

(declare-fun b!393618 () Bool)

(declare-fun e!238316 () Bool)

(declare-fun call!27814 () Bool)

(assert (=> b!393618 (= e!238316 call!27814)))

(declare-fun b!393619 () Bool)

(declare-fun e!238317 () Bool)

(assert (=> b!393619 (= e!238317 e!238316)))

(declare-fun lt!186337 () (_ BitVec 64))

(assert (=> b!393619 (= lt!186337 (select (arr!11123 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186338 () Unit!12032)

(assert (=> b!393619 (= lt!186338 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!186337 #b00000000000000000000000000000000))))

(assert (=> b!393619 (arrayContainsKey!0 _keys!658 lt!186337 #b00000000000000000000000000000000)))

(declare-fun lt!186339 () Unit!12032)

(assert (=> b!393619 (= lt!186339 lt!186338)))

(declare-fun res!225506 () Bool)

(assert (=> b!393619 (= res!225506 (= (seekEntryOrOpen!0 (select (arr!11123 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3518 #b00000000000000000000000000000000)))))

(assert (=> b!393619 (=> (not res!225506) (not e!238316))))

(declare-fun b!393620 () Bool)

(assert (=> b!393620 (= e!238317 call!27814)))

(declare-fun d!73237 () Bool)

(declare-fun res!225507 () Bool)

(declare-fun e!238318 () Bool)

(assert (=> d!73237 (=> res!225507 e!238318)))

(assert (=> d!73237 (= res!225507 (bvsge #b00000000000000000000000000000000 (size!11475 _keys!658)))))

(assert (=> d!73237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!238318)))

(declare-fun b!393621 () Bool)

(assert (=> b!393621 (= e!238318 e!238317)))

(declare-fun c!54485 () Bool)

(assert (=> b!393621 (= c!54485 (validKeyInArray!0 (select (arr!11123 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27811 () Bool)

(assert (=> bm!27811 (= call!27814 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!73237 (not res!225507)) b!393621))

(assert (= (and b!393621 c!54485) b!393619))

(assert (= (and b!393621 (not c!54485)) b!393620))

(assert (= (and b!393619 res!225506) b!393618))

(assert (= (or b!393618 b!393620) bm!27811))

(assert (=> b!393619 m!389927))

(declare-fun m!390113 () Bool)

(assert (=> b!393619 m!390113))

(declare-fun m!390115 () Bool)

(assert (=> b!393619 m!390115))

(assert (=> b!393619 m!389927))

(declare-fun m!390117 () Bool)

(assert (=> b!393619 m!390117))

(assert (=> b!393621 m!389927))

(assert (=> b!393621 m!389927))

(assert (=> b!393621 m!389929))

(declare-fun m!390119 () Bool)

(assert (=> bm!27811 m!390119))

(assert (=> b!393380 d!73237))

(declare-fun condMapEmpty!16167 () Bool)

(declare-fun mapDefault!16167 () ValueCell!4512)

(assert (=> mapNonEmpty!16161 (= condMapEmpty!16167 (= mapRest!16161 ((as const (Array (_ BitVec 32) ValueCell!4512)) mapDefault!16167)))))

(declare-fun e!238323 () Bool)

(declare-fun mapRes!16167 () Bool)

(assert (=> mapNonEmpty!16161 (= tp!31899 (and e!238323 mapRes!16167))))

(declare-fun b!393629 () Bool)

(assert (=> b!393629 (= e!238323 tp_is_empty!9711)))

(declare-fun mapIsEmpty!16167 () Bool)

(assert (=> mapIsEmpty!16167 mapRes!16167))

(declare-fun mapNonEmpty!16167 () Bool)

(declare-fun tp!31908 () Bool)

(declare-fun e!238324 () Bool)

(assert (=> mapNonEmpty!16167 (= mapRes!16167 (and tp!31908 e!238324))))

(declare-fun mapKey!16167 () (_ BitVec 32))

(declare-fun mapRest!16167 () (Array (_ BitVec 32) ValueCell!4512))

(declare-fun mapValue!16167 () ValueCell!4512)

(assert (=> mapNonEmpty!16167 (= mapRest!16161 (store mapRest!16167 mapKey!16167 mapValue!16167))))

(declare-fun b!393628 () Bool)

(assert (=> b!393628 (= e!238324 tp_is_empty!9711)))

(assert (= (and mapNonEmpty!16161 condMapEmpty!16167) mapIsEmpty!16167))

(assert (= (and mapNonEmpty!16161 (not condMapEmpty!16167)) mapNonEmpty!16167))

(assert (= (and mapNonEmpty!16167 ((_ is ValueCellFull!4512) mapValue!16167)) b!393628))

(assert (= (and mapNonEmpty!16161 ((_ is ValueCellFull!4512) mapDefault!16167)) b!393629))

(declare-fun m!390121 () Bool)

(assert (=> mapNonEmpty!16167 m!390121))

(declare-fun b_lambda!8779 () Bool)

(assert (= b_lambda!8773 (or (and start!38158 b_free!9039) b_lambda!8779)))

(declare-fun b_lambda!8781 () Bool)

(assert (= b_lambda!8769 (or (and start!38158 b_free!9039) b_lambda!8781)))

(declare-fun b_lambda!8783 () Bool)

(assert (= b_lambda!8775 (or (and start!38158 b_free!9039) b_lambda!8783)))

(declare-fun b_lambda!8785 () Bool)

(assert (= b_lambda!8771 (or (and start!38158 b_free!9039) b_lambda!8785)))

(declare-fun b_lambda!8787 () Bool)

(assert (= b_lambda!8777 (or (and start!38158 b_free!9039) b_lambda!8787)))

(declare-fun b_lambda!8789 () Bool)

(assert (= b_lambda!8767 (or (and start!38158 b_free!9039) b_lambda!8789)))

(check-sat (not b!393443) (not b_lambda!8779) (not d!73219) (not b!393615) (not b!393488) (not bm!27806) (not b!393559) (not b!393619) (not bm!27811) (not b!393545) (not b!393575) (not bm!27799) tp_is_empty!9711 (not b!393565) (not bm!27797) (not b!393614) (not b!393572) (not b!393506) (not d!73215) (not b!393507) (not b!393442) (not bm!27788) (not b!393536) (not bm!27805) (not bm!27783) (not bm!27768) (not b_lambda!8785) b_and!16415 (not bm!27809) (not bm!27787) (not b!393606) (not b!393563) (not bm!27792) (not b!393540) (not b!393574) (not bm!27798) (not b_lambda!8789) (not mapNonEmpty!16167) (not b!393556) (not d!73213) (not d!73217) (not b!393621) (not d!73211) (not d!73221) (not b!393541) (not b!393441) (not b!393576) (not bm!27789) (not b!393613) (not b!393569) (not b!393539) (not b!393566) (not b!393547) (not b!393585) (not b!393542) (not b!393497) (not b!393592) (not b!393489) (not b!393538) (not bm!27810) (not b!393612) (not b!393543) (not b!393573) (not b_lambda!8783) (not b_lambda!8781) (not b!393548) (not b!393496) (not b!393555) (not b!393571) (not b!393604) (not b!393500) (not bm!27800) (not b_next!9039) (not b_lambda!8787) (not bm!27793) (not b!393578) (not b!393504) (not b!393584))
(check-sat b_and!16415 (not b_next!9039))
