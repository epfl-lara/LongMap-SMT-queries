; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38034 () Bool)

(assert start!38034)

(declare-fun b_free!8995 () Bool)

(declare-fun b_next!8995 () Bool)

(assert (=> start!38034 (= b_free!8995 (not b_next!8995))))

(declare-fun tp!31758 () Bool)

(declare-fun b_and!16335 () Bool)

(assert (=> start!38034 (= tp!31758 b_and!16335)))

(declare-fun b!391746 () Bool)

(declare-fun e!237250 () Bool)

(declare-fun e!237249 () Bool)

(assert (=> b!391746 (= e!237250 e!237249)))

(declare-fun res!224331 () Bool)

(assert (=> b!391746 (=> (not res!224331) (not e!237249))))

(declare-datatypes ((array!23222 0))(
  ( (array!23223 (arr!11072 (Array (_ BitVec 32) (_ BitVec 64))) (size!11424 (_ BitVec 32))) )
))
(declare-fun lt!185031 () array!23222)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23222 (_ BitVec 32)) Bool)

(assert (=> b!391746 (= res!224331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185031 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23222)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391746 (= lt!185031 (array!23223 (store (arr!11072 _keys!658) i!548 k0!778) (size!11424 _keys!658)))))

(declare-datatypes ((V!13995 0))(
  ( (V!13996 (val!4878 Int)) )
))
(declare-datatypes ((tuple2!6440 0))(
  ( (tuple2!6441 (_1!3231 (_ BitVec 64)) (_2!3231 V!13995)) )
))
(declare-datatypes ((List!6287 0))(
  ( (Nil!6284) (Cons!6283 (h!7139 tuple2!6440) (t!11443 List!6287)) )
))
(declare-datatypes ((ListLongMap!5355 0))(
  ( (ListLongMap!5356 (toList!2693 List!6287)) )
))
(declare-fun lt!185029 () ListLongMap!5355)

(declare-fun b!391747 () Bool)

(declare-fun lt!185032 () ListLongMap!5355)

(declare-fun e!237244 () Bool)

(declare-fun minValue!472 () V!13995)

(declare-fun +!1047 (ListLongMap!5355 tuple2!6440) ListLongMap!5355)

(assert (=> b!391747 (= e!237244 (= lt!185032 (+!1047 lt!185029 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!391748 () Bool)

(declare-fun e!237246 () Bool)

(declare-fun tp_is_empty!9667 () Bool)

(assert (=> b!391748 (= e!237246 tp_is_empty!9667)))

(declare-fun b!391749 () Bool)

(declare-fun res!224338 () Bool)

(assert (=> b!391749 (=> (not res!224338) (not e!237250))))

(assert (=> b!391749 (= res!224338 (or (= (select (arr!11072 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11072 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391750 () Bool)

(declare-fun res!224336 () Bool)

(assert (=> b!391750 (=> (not res!224336) (not e!237250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391750 (= res!224336 (validKeyInArray!0 k0!778))))

(declare-fun b!391751 () Bool)

(declare-fun e!237247 () Bool)

(assert (=> b!391751 (= e!237247 tp_is_empty!9667)))

(declare-fun b!391752 () Bool)

(declare-fun res!224329 () Bool)

(assert (=> b!391752 (=> (not res!224329) (not e!237250))))

(assert (=> b!391752 (= res!224329 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11424 _keys!658))))))

(declare-fun b!391753 () Bool)

(declare-fun e!237245 () Bool)

(declare-fun mapRes!16086 () Bool)

(assert (=> b!391753 (= e!237245 (and e!237246 mapRes!16086))))

(declare-fun condMapEmpty!16086 () Bool)

(declare-datatypes ((ValueCell!4490 0))(
  ( (ValueCellFull!4490 (v!7104 V!13995)) (EmptyCell!4490) )
))
(declare-datatypes ((array!23224 0))(
  ( (array!23225 (arr!11073 (Array (_ BitVec 32) ValueCell!4490)) (size!11425 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23224)

(declare-fun mapDefault!16086 () ValueCell!4490)

(assert (=> b!391753 (= condMapEmpty!16086 (= (arr!11073 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4490)) mapDefault!16086)))))

(declare-fun res!224335 () Bool)

(assert (=> start!38034 (=> (not res!224335) (not e!237250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38034 (= res!224335 (validMask!0 mask!970))))

(assert (=> start!38034 e!237250))

(declare-fun array_inv!8182 (array!23224) Bool)

(assert (=> start!38034 (and (array_inv!8182 _values!506) e!237245)))

(assert (=> start!38034 tp!31758))

(assert (=> start!38034 true))

(assert (=> start!38034 tp_is_empty!9667))

(declare-fun array_inv!8183 (array!23222) Bool)

(assert (=> start!38034 (array_inv!8183 _keys!658)))

(declare-fun b!391754 () Bool)

(declare-fun res!224337 () Bool)

(assert (=> b!391754 (=> (not res!224337) (not e!237250))))

(declare-fun arrayContainsKey!0 (array!23222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391754 (= res!224337 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!391755 () Bool)

(declare-fun res!224330 () Bool)

(assert (=> b!391755 (=> (not res!224330) (not e!237249))))

(declare-datatypes ((List!6288 0))(
  ( (Nil!6285) (Cons!6284 (h!7140 (_ BitVec 64)) (t!11444 List!6288)) )
))
(declare-fun arrayNoDuplicates!0 (array!23222 (_ BitVec 32) List!6288) Bool)

(assert (=> b!391755 (= res!224330 (arrayNoDuplicates!0 lt!185031 #b00000000000000000000000000000000 Nil!6285))))

(declare-fun b!391756 () Bool)

(assert (=> b!391756 (= e!237249 (not e!237244))))

(declare-fun res!224328 () Bool)

(assert (=> b!391756 (=> res!224328 e!237244)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391756 (= res!224328 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!185035 () ListLongMap!5355)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13995)

(declare-fun getCurrentListMap!2072 (array!23222 array!23224 (_ BitVec 32) (_ BitVec 32) V!13995 V!13995 (_ BitVec 32) Int) ListLongMap!5355)

(assert (=> b!391756 (= lt!185035 (getCurrentListMap!2072 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185028 () array!23224)

(assert (=> b!391756 (= lt!185032 (getCurrentListMap!2072 lt!185031 lt!185028 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185033 () ListLongMap!5355)

(assert (=> b!391756 (and (= lt!185029 lt!185033) (= lt!185033 lt!185029))))

(declare-fun lt!185034 () ListLongMap!5355)

(declare-fun v!373 () V!13995)

(assert (=> b!391756 (= lt!185033 (+!1047 lt!185034 (tuple2!6441 k0!778 v!373)))))

(declare-datatypes ((Unit!11965 0))(
  ( (Unit!11966) )
))
(declare-fun lt!185030 () Unit!11965)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!263 (array!23222 array!23224 (_ BitVec 32) (_ BitVec 32) V!13995 V!13995 (_ BitVec 32) (_ BitVec 64) V!13995 (_ BitVec 32) Int) Unit!11965)

(assert (=> b!391756 (= lt!185030 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!263 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!961 (array!23222 array!23224 (_ BitVec 32) (_ BitVec 32) V!13995 V!13995 (_ BitVec 32) Int) ListLongMap!5355)

(assert (=> b!391756 (= lt!185029 (getCurrentListMapNoExtraKeys!961 lt!185031 lt!185028 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391756 (= lt!185028 (array!23225 (store (arr!11073 _values!506) i!548 (ValueCellFull!4490 v!373)) (size!11425 _values!506)))))

(assert (=> b!391756 (= lt!185034 (getCurrentListMapNoExtraKeys!961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391757 () Bool)

(declare-fun res!224334 () Bool)

(assert (=> b!391757 (=> (not res!224334) (not e!237250))))

(assert (=> b!391757 (= res!224334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391758 () Bool)

(declare-fun res!224332 () Bool)

(assert (=> b!391758 (=> (not res!224332) (not e!237250))))

(assert (=> b!391758 (= res!224332 (and (= (size!11425 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11424 _keys!658) (size!11425 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391759 () Bool)

(declare-fun res!224333 () Bool)

(assert (=> b!391759 (=> (not res!224333) (not e!237250))))

(assert (=> b!391759 (= res!224333 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6285))))

(declare-fun mapNonEmpty!16086 () Bool)

(declare-fun tp!31757 () Bool)

(assert (=> mapNonEmpty!16086 (= mapRes!16086 (and tp!31757 e!237247))))

(declare-fun mapRest!16086 () (Array (_ BitVec 32) ValueCell!4490))

(declare-fun mapKey!16086 () (_ BitVec 32))

(declare-fun mapValue!16086 () ValueCell!4490)

(assert (=> mapNonEmpty!16086 (= (arr!11073 _values!506) (store mapRest!16086 mapKey!16086 mapValue!16086))))

(declare-fun mapIsEmpty!16086 () Bool)

(assert (=> mapIsEmpty!16086 mapRes!16086))

(assert (= (and start!38034 res!224335) b!391758))

(assert (= (and b!391758 res!224332) b!391757))

(assert (= (and b!391757 res!224334) b!391759))

(assert (= (and b!391759 res!224333) b!391752))

(assert (= (and b!391752 res!224329) b!391750))

(assert (= (and b!391750 res!224336) b!391749))

(assert (= (and b!391749 res!224338) b!391754))

(assert (= (and b!391754 res!224337) b!391746))

(assert (= (and b!391746 res!224331) b!391755))

(assert (= (and b!391755 res!224330) b!391756))

(assert (= (and b!391756 (not res!224328)) b!391747))

(assert (= (and b!391753 condMapEmpty!16086) mapIsEmpty!16086))

(assert (= (and b!391753 (not condMapEmpty!16086)) mapNonEmpty!16086))

(get-info :version)

(assert (= (and mapNonEmpty!16086 ((_ is ValueCellFull!4490) mapValue!16086)) b!391751))

(assert (= (and b!391753 ((_ is ValueCellFull!4490) mapDefault!16086)) b!391748))

(assert (= start!38034 b!391753))

(declare-fun m!388423 () Bool)

(assert (=> start!38034 m!388423))

(declare-fun m!388425 () Bool)

(assert (=> start!38034 m!388425))

(declare-fun m!388427 () Bool)

(assert (=> start!38034 m!388427))

(declare-fun m!388429 () Bool)

(assert (=> b!391747 m!388429))

(declare-fun m!388431 () Bool)

(assert (=> b!391746 m!388431))

(declare-fun m!388433 () Bool)

(assert (=> b!391746 m!388433))

(declare-fun m!388435 () Bool)

(assert (=> mapNonEmpty!16086 m!388435))

(declare-fun m!388437 () Bool)

(assert (=> b!391749 m!388437))

(declare-fun m!388439 () Bool)

(assert (=> b!391759 m!388439))

(declare-fun m!388441 () Bool)

(assert (=> b!391750 m!388441))

(declare-fun m!388443 () Bool)

(assert (=> b!391755 m!388443))

(declare-fun m!388445 () Bool)

(assert (=> b!391757 m!388445))

(declare-fun m!388447 () Bool)

(assert (=> b!391756 m!388447))

(declare-fun m!388449 () Bool)

(assert (=> b!391756 m!388449))

(declare-fun m!388451 () Bool)

(assert (=> b!391756 m!388451))

(declare-fun m!388453 () Bool)

(assert (=> b!391756 m!388453))

(declare-fun m!388455 () Bool)

(assert (=> b!391756 m!388455))

(declare-fun m!388457 () Bool)

(assert (=> b!391756 m!388457))

(declare-fun m!388459 () Bool)

(assert (=> b!391756 m!388459))

(declare-fun m!388461 () Bool)

(assert (=> b!391754 m!388461))

(check-sat (not b!391757) (not start!38034) (not b!391747) (not mapNonEmpty!16086) b_and!16335 (not b_next!8995) (not b!391746) (not b!391759) (not b!391754) tp_is_empty!9667 (not b!391750) (not b!391755) (not b!391756))
(check-sat b_and!16335 (not b_next!8995))
(get-model)

(declare-fun d!73121 () Bool)

(assert (=> d!73121 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38034 d!73121))

(declare-fun d!73123 () Bool)

(assert (=> d!73123 (= (array_inv!8182 _values!506) (bvsge (size!11425 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38034 d!73123))

(declare-fun d!73125 () Bool)

(assert (=> d!73125 (= (array_inv!8183 _keys!658) (bvsge (size!11424 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38034 d!73125))

(declare-fun d!73127 () Bool)

(declare-fun res!224409 () Bool)

(declare-fun e!237297 () Bool)

(assert (=> d!73127 (=> res!224409 e!237297)))

(assert (=> d!73127 (= res!224409 (= (select (arr!11072 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73127 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!237297)))

(declare-fun b!391848 () Bool)

(declare-fun e!237298 () Bool)

(assert (=> b!391848 (= e!237297 e!237298)))

(declare-fun res!224410 () Bool)

(assert (=> b!391848 (=> (not res!224410) (not e!237298))))

(assert (=> b!391848 (= res!224410 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11424 _keys!658)))))

(declare-fun b!391849 () Bool)

(assert (=> b!391849 (= e!237298 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73127 (not res!224409)) b!391848))

(assert (= (and b!391848 res!224410) b!391849))

(declare-fun m!388543 () Bool)

(assert (=> d!73127 m!388543))

(declare-fun m!388545 () Bool)

(assert (=> b!391849 m!388545))

(assert (=> b!391754 d!73127))

(declare-fun b!391858 () Bool)

(declare-fun e!237306 () Bool)

(declare-fun e!237305 () Bool)

(assert (=> b!391858 (= e!237306 e!237305)))

(declare-fun c!54261 () Bool)

(assert (=> b!391858 (= c!54261 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27617 () Bool)

(declare-fun call!27620 () Bool)

(assert (=> bm!27617 (= call!27620 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!391859 () Bool)

(declare-fun e!237307 () Bool)

(assert (=> b!391859 (= e!237307 call!27620)))

(declare-fun d!73129 () Bool)

(declare-fun res!224415 () Bool)

(assert (=> d!73129 (=> res!224415 e!237306)))

(assert (=> d!73129 (= res!224415 (bvsge #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(assert (=> d!73129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!237306)))

(declare-fun b!391860 () Bool)

(assert (=> b!391860 (= e!237305 call!27620)))

(declare-fun b!391861 () Bool)

(assert (=> b!391861 (= e!237305 e!237307)))

(declare-fun lt!185090 () (_ BitVec 64))

(assert (=> b!391861 (= lt!185090 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185092 () Unit!11965)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23222 (_ BitVec 64) (_ BitVec 32)) Unit!11965)

(assert (=> b!391861 (= lt!185092 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!185090 #b00000000000000000000000000000000))))

(assert (=> b!391861 (arrayContainsKey!0 _keys!658 lt!185090 #b00000000000000000000000000000000)))

(declare-fun lt!185091 () Unit!11965)

(assert (=> b!391861 (= lt!185091 lt!185092)))

(declare-fun res!224416 () Bool)

(declare-datatypes ((SeekEntryResult!3464 0))(
  ( (MissingZero!3464 (index!16035 (_ BitVec 32))) (Found!3464 (index!16036 (_ BitVec 32))) (Intermediate!3464 (undefined!4276 Bool) (index!16037 (_ BitVec 32)) (x!38331 (_ BitVec 32))) (Undefined!3464) (MissingVacant!3464 (index!16038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23222 (_ BitVec 32)) SeekEntryResult!3464)

(assert (=> b!391861 (= res!224416 (= (seekEntryOrOpen!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3464 #b00000000000000000000000000000000)))))

(assert (=> b!391861 (=> (not res!224416) (not e!237307))))

(assert (= (and d!73129 (not res!224415)) b!391858))

(assert (= (and b!391858 c!54261) b!391861))

(assert (= (and b!391858 (not c!54261)) b!391860))

(assert (= (and b!391861 res!224416) b!391859))

(assert (= (or b!391859 b!391860) bm!27617))

(assert (=> b!391858 m!388543))

(assert (=> b!391858 m!388543))

(declare-fun m!388547 () Bool)

(assert (=> b!391858 m!388547))

(declare-fun m!388549 () Bool)

(assert (=> bm!27617 m!388549))

(assert (=> b!391861 m!388543))

(declare-fun m!388551 () Bool)

(assert (=> b!391861 m!388551))

(declare-fun m!388553 () Bool)

(assert (=> b!391861 m!388553))

(assert (=> b!391861 m!388543))

(declare-fun m!388555 () Bool)

(assert (=> b!391861 m!388555))

(assert (=> b!391757 d!73129))

(declare-fun b!391872 () Bool)

(declare-fun e!237318 () Bool)

(declare-fun call!27623 () Bool)

(assert (=> b!391872 (= e!237318 call!27623)))

(declare-fun b!391873 () Bool)

(declare-fun e!237319 () Bool)

(assert (=> b!391873 (= e!237319 e!237318)))

(declare-fun c!54264 () Bool)

(assert (=> b!391873 (= c!54264 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27620 () Bool)

(assert (=> bm!27620 (= call!27623 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54264 (Cons!6284 (select (arr!11072 _keys!658) #b00000000000000000000000000000000) Nil!6285) Nil!6285)))))

(declare-fun b!391874 () Bool)

(declare-fun e!237316 () Bool)

(assert (=> b!391874 (= e!237316 e!237319)))

(declare-fun res!224425 () Bool)

(assert (=> b!391874 (=> (not res!224425) (not e!237319))))

(declare-fun e!237317 () Bool)

(assert (=> b!391874 (= res!224425 (not e!237317))))

(declare-fun res!224423 () Bool)

(assert (=> b!391874 (=> (not res!224423) (not e!237317))))

(assert (=> b!391874 (= res!224423 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391876 () Bool)

(assert (=> b!391876 (= e!237318 call!27623)))

(declare-fun d!73131 () Bool)

(declare-fun res!224424 () Bool)

(assert (=> d!73131 (=> res!224424 e!237316)))

(assert (=> d!73131 (= res!224424 (bvsge #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(assert (=> d!73131 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6285) e!237316)))

(declare-fun b!391875 () Bool)

(declare-fun contains!2440 (List!6288 (_ BitVec 64)) Bool)

(assert (=> b!391875 (= e!237317 (contains!2440 Nil!6285 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73131 (not res!224424)) b!391874))

(assert (= (and b!391874 res!224423) b!391875))

(assert (= (and b!391874 res!224425) b!391873))

(assert (= (and b!391873 c!54264) b!391876))

(assert (= (and b!391873 (not c!54264)) b!391872))

(assert (= (or b!391876 b!391872) bm!27620))

(assert (=> b!391873 m!388543))

(assert (=> b!391873 m!388543))

(assert (=> b!391873 m!388547))

(assert (=> bm!27620 m!388543))

(declare-fun m!388557 () Bool)

(assert (=> bm!27620 m!388557))

(assert (=> b!391874 m!388543))

(assert (=> b!391874 m!388543))

(assert (=> b!391874 m!388547))

(assert (=> b!391875 m!388543))

(assert (=> b!391875 m!388543))

(declare-fun m!388559 () Bool)

(assert (=> b!391875 m!388559))

(assert (=> b!391759 d!73131))

(declare-fun d!73133 () Bool)

(declare-fun e!237322 () Bool)

(assert (=> d!73133 e!237322))

(declare-fun res!224431 () Bool)

(assert (=> d!73133 (=> (not res!224431) (not e!237322))))

(declare-fun lt!185101 () ListLongMap!5355)

(declare-fun contains!2441 (ListLongMap!5355 (_ BitVec 64)) Bool)

(assert (=> d!73133 (= res!224431 (contains!2441 lt!185101 (_1!3231 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun lt!185104 () List!6287)

(assert (=> d!73133 (= lt!185101 (ListLongMap!5356 lt!185104))))

(declare-fun lt!185103 () Unit!11965)

(declare-fun lt!185102 () Unit!11965)

(assert (=> d!73133 (= lt!185103 lt!185102)))

(declare-datatypes ((Option!369 0))(
  ( (Some!368 (v!7110 V!13995)) (None!367) )
))
(declare-fun getValueByKey!363 (List!6287 (_ BitVec 64)) Option!369)

(assert (=> d!73133 (= (getValueByKey!363 lt!185104 (_1!3231 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!368 (_2!3231 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun lemmaContainsTupThenGetReturnValue!185 (List!6287 (_ BitVec 64) V!13995) Unit!11965)

(assert (=> d!73133 (= lt!185102 (lemmaContainsTupThenGetReturnValue!185 lt!185104 (_1!3231 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3231 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun insertStrictlySorted!188 (List!6287 (_ BitVec 64) V!13995) List!6287)

(assert (=> d!73133 (= lt!185104 (insertStrictlySorted!188 (toList!2693 lt!185029) (_1!3231 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3231 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (=> d!73133 (= (+!1047 lt!185029 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) lt!185101)))

(declare-fun b!391881 () Bool)

(declare-fun res!224430 () Bool)

(assert (=> b!391881 (=> (not res!224430) (not e!237322))))

(assert (=> b!391881 (= res!224430 (= (getValueByKey!363 (toList!2693 lt!185101) (_1!3231 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!368 (_2!3231 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))))

(declare-fun b!391882 () Bool)

(declare-fun contains!2442 (List!6287 tuple2!6440) Bool)

(assert (=> b!391882 (= e!237322 (contains!2442 (toList!2693 lt!185101) (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!73133 res!224431) b!391881))

(assert (= (and b!391881 res!224430) b!391882))

(declare-fun m!388561 () Bool)

(assert (=> d!73133 m!388561))

(declare-fun m!388563 () Bool)

(assert (=> d!73133 m!388563))

(declare-fun m!388565 () Bool)

(assert (=> d!73133 m!388565))

(declare-fun m!388567 () Bool)

(assert (=> d!73133 m!388567))

(declare-fun m!388569 () Bool)

(assert (=> b!391881 m!388569))

(declare-fun m!388571 () Bool)

(assert (=> b!391882 m!388571))

(assert (=> b!391747 d!73133))

(declare-fun b!391883 () Bool)

(declare-fun e!237324 () Bool)

(declare-fun e!237323 () Bool)

(assert (=> b!391883 (= e!237324 e!237323)))

(declare-fun c!54265 () Bool)

(assert (=> b!391883 (= c!54265 (validKeyInArray!0 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)))))

(declare-fun bm!27621 () Bool)

(declare-fun call!27624 () Bool)

(assert (=> bm!27621 (= call!27624 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!185031 mask!970))))

(declare-fun b!391884 () Bool)

(declare-fun e!237325 () Bool)

(assert (=> b!391884 (= e!237325 call!27624)))

(declare-fun d!73135 () Bool)

(declare-fun res!224432 () Bool)

(assert (=> d!73135 (=> res!224432 e!237324)))

(assert (=> d!73135 (= res!224432 (bvsge #b00000000000000000000000000000000 (size!11424 lt!185031)))))

(assert (=> d!73135 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185031 mask!970) e!237324)))

(declare-fun b!391885 () Bool)

(assert (=> b!391885 (= e!237323 call!27624)))

(declare-fun b!391886 () Bool)

(assert (=> b!391886 (= e!237323 e!237325)))

(declare-fun lt!185105 () (_ BitVec 64))

(assert (=> b!391886 (= lt!185105 (select (arr!11072 lt!185031) #b00000000000000000000000000000000))))

(declare-fun lt!185107 () Unit!11965)

(assert (=> b!391886 (= lt!185107 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!185031 lt!185105 #b00000000000000000000000000000000))))

(assert (=> b!391886 (arrayContainsKey!0 lt!185031 lt!185105 #b00000000000000000000000000000000)))

(declare-fun lt!185106 () Unit!11965)

(assert (=> b!391886 (= lt!185106 lt!185107)))

(declare-fun res!224433 () Bool)

(assert (=> b!391886 (= res!224433 (= (seekEntryOrOpen!0 (select (arr!11072 lt!185031) #b00000000000000000000000000000000) lt!185031 mask!970) (Found!3464 #b00000000000000000000000000000000)))))

(assert (=> b!391886 (=> (not res!224433) (not e!237325))))

(assert (= (and d!73135 (not res!224432)) b!391883))

(assert (= (and b!391883 c!54265) b!391886))

(assert (= (and b!391883 (not c!54265)) b!391885))

(assert (= (and b!391886 res!224433) b!391884))

(assert (= (or b!391884 b!391885) bm!27621))

(declare-fun m!388573 () Bool)

(assert (=> b!391883 m!388573))

(assert (=> b!391883 m!388573))

(declare-fun m!388575 () Bool)

(assert (=> b!391883 m!388575))

(declare-fun m!388577 () Bool)

(assert (=> bm!27621 m!388577))

(assert (=> b!391886 m!388573))

(declare-fun m!388579 () Bool)

(assert (=> b!391886 m!388579))

(declare-fun m!388581 () Bool)

(assert (=> b!391886 m!388581))

(assert (=> b!391886 m!388573))

(declare-fun m!388583 () Bool)

(assert (=> b!391886 m!388583))

(assert (=> b!391746 d!73135))

(declare-fun b!391887 () Bool)

(declare-fun e!237328 () Bool)

(declare-fun call!27625 () Bool)

(assert (=> b!391887 (= e!237328 call!27625)))

(declare-fun b!391888 () Bool)

(declare-fun e!237329 () Bool)

(assert (=> b!391888 (= e!237329 e!237328)))

(declare-fun c!54266 () Bool)

(assert (=> b!391888 (= c!54266 (validKeyInArray!0 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)))))

(declare-fun bm!27622 () Bool)

(assert (=> bm!27622 (= call!27625 (arrayNoDuplicates!0 lt!185031 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54266 (Cons!6284 (select (arr!11072 lt!185031) #b00000000000000000000000000000000) Nil!6285) Nil!6285)))))

(declare-fun b!391889 () Bool)

(declare-fun e!237326 () Bool)

(assert (=> b!391889 (= e!237326 e!237329)))

(declare-fun res!224436 () Bool)

(assert (=> b!391889 (=> (not res!224436) (not e!237329))))

(declare-fun e!237327 () Bool)

(assert (=> b!391889 (= res!224436 (not e!237327))))

(declare-fun res!224434 () Bool)

(assert (=> b!391889 (=> (not res!224434) (not e!237327))))

(assert (=> b!391889 (= res!224434 (validKeyInArray!0 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)))))

(declare-fun b!391891 () Bool)

(assert (=> b!391891 (= e!237328 call!27625)))

(declare-fun d!73137 () Bool)

(declare-fun res!224435 () Bool)

(assert (=> d!73137 (=> res!224435 e!237326)))

(assert (=> d!73137 (= res!224435 (bvsge #b00000000000000000000000000000000 (size!11424 lt!185031)))))

(assert (=> d!73137 (= (arrayNoDuplicates!0 lt!185031 #b00000000000000000000000000000000 Nil!6285) e!237326)))

(declare-fun b!391890 () Bool)

(assert (=> b!391890 (= e!237327 (contains!2440 Nil!6285 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)))))

(assert (= (and d!73137 (not res!224435)) b!391889))

(assert (= (and b!391889 res!224434) b!391890))

(assert (= (and b!391889 res!224436) b!391888))

(assert (= (and b!391888 c!54266) b!391891))

(assert (= (and b!391888 (not c!54266)) b!391887))

(assert (= (or b!391891 b!391887) bm!27622))

(assert (=> b!391888 m!388573))

(assert (=> b!391888 m!388573))

(assert (=> b!391888 m!388575))

(assert (=> bm!27622 m!388573))

(declare-fun m!388585 () Bool)

(assert (=> bm!27622 m!388585))

(assert (=> b!391889 m!388573))

(assert (=> b!391889 m!388573))

(assert (=> b!391889 m!388575))

(assert (=> b!391890 m!388573))

(assert (=> b!391890 m!388573))

(declare-fun m!388587 () Bool)

(assert (=> b!391890 m!388587))

(assert (=> b!391755 d!73137))

(declare-fun b!391916 () Bool)

(declare-fun e!237348 () Bool)

(declare-fun e!237346 () Bool)

(assert (=> b!391916 (= e!237348 e!237346)))

(assert (=> b!391916 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(declare-fun res!224447 () Bool)

(declare-fun lt!185125 () ListLongMap!5355)

(assert (=> b!391916 (= res!224447 (contains!2441 lt!185125 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391916 (=> (not res!224447) (not e!237346))))

(declare-fun d!73139 () Bool)

(declare-fun e!237347 () Bool)

(assert (=> d!73139 e!237347))

(declare-fun res!224446 () Bool)

(assert (=> d!73139 (=> (not res!224446) (not e!237347))))

(assert (=> d!73139 (= res!224446 (not (contains!2441 lt!185125 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!237344 () ListLongMap!5355)

(assert (=> d!73139 (= lt!185125 e!237344)))

(declare-fun c!54278 () Bool)

(assert (=> d!73139 (= c!54278 (bvsge #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(assert (=> d!73139 (validMask!0 mask!970)))

(assert (=> d!73139 (= (getCurrentListMapNoExtraKeys!961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185125)))

(declare-fun b!391917 () Bool)

(declare-fun res!224448 () Bool)

(assert (=> b!391917 (=> (not res!224448) (not e!237347))))

(assert (=> b!391917 (= res!224448 (not (contains!2441 lt!185125 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391918 () Bool)

(declare-fun e!237349 () Bool)

(assert (=> b!391918 (= e!237348 e!237349)))

(declare-fun c!54277 () Bool)

(assert (=> b!391918 (= c!54277 (bvslt #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(declare-fun b!391919 () Bool)

(assert (=> b!391919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(assert (=> b!391919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 _values!506)))))

(declare-fun apply!304 (ListLongMap!5355 (_ BitVec 64)) V!13995)

(declare-fun get!5606 (ValueCell!4490 V!13995) V!13995)

(declare-fun dynLambda!647 (Int (_ BitVec 64)) V!13995)

(assert (=> b!391919 (= e!237346 (= (apply!304 lt!185125 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)) (get!5606 (select (arr!11073 _values!506) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!391920 () Bool)

(declare-fun e!237350 () ListLongMap!5355)

(declare-fun call!27628 () ListLongMap!5355)

(assert (=> b!391920 (= e!237350 call!27628)))

(declare-fun b!391921 () Bool)

(declare-fun e!237345 () Bool)

(assert (=> b!391921 (= e!237345 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391921 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!391922 () Bool)

(assert (=> b!391922 (= e!237344 e!237350)))

(declare-fun c!54275 () Bool)

(assert (=> b!391922 (= c!54275 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391923 () Bool)

(assert (=> b!391923 (= e!237347 e!237348)))

(declare-fun c!54276 () Bool)

(assert (=> b!391923 (= c!54276 e!237345)))

(declare-fun res!224445 () Bool)

(assert (=> b!391923 (=> (not res!224445) (not e!237345))))

(assert (=> b!391923 (= res!224445 (bvslt #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(declare-fun b!391924 () Bool)

(declare-fun lt!185124 () Unit!11965)

(declare-fun lt!185123 () Unit!11965)

(assert (=> b!391924 (= lt!185124 lt!185123)))

(declare-fun lt!185122 () (_ BitVec 64))

(declare-fun lt!185127 () V!13995)

(declare-fun lt!185128 () (_ BitVec 64))

(declare-fun lt!185126 () ListLongMap!5355)

(assert (=> b!391924 (not (contains!2441 (+!1047 lt!185126 (tuple2!6441 lt!185122 lt!185127)) lt!185128))))

(declare-fun addStillNotContains!139 (ListLongMap!5355 (_ BitVec 64) V!13995 (_ BitVec 64)) Unit!11965)

(assert (=> b!391924 (= lt!185123 (addStillNotContains!139 lt!185126 lt!185122 lt!185127 lt!185128))))

(assert (=> b!391924 (= lt!185128 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!391924 (= lt!185127 (get!5606 (select (arr!11073 _values!506) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!391924 (= lt!185122 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!391924 (= lt!185126 call!27628)))

(assert (=> b!391924 (= e!237350 (+!1047 call!27628 (tuple2!6441 (select (arr!11072 _keys!658) #b00000000000000000000000000000000) (get!5606 (select (arr!11073 _values!506) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!391925 () Bool)

(declare-fun isEmpty!556 (ListLongMap!5355) Bool)

(assert (=> b!391925 (= e!237349 (isEmpty!556 lt!185125))))

(declare-fun b!391926 () Bool)

(assert (=> b!391926 (= e!237349 (= lt!185125 (getCurrentListMapNoExtraKeys!961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!391927 () Bool)

(assert (=> b!391927 (= e!237344 (ListLongMap!5356 Nil!6284))))

(declare-fun bm!27625 () Bool)

(assert (=> bm!27625 (= call!27628 (getCurrentListMapNoExtraKeys!961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(assert (= (and d!73139 c!54278) b!391927))

(assert (= (and d!73139 (not c!54278)) b!391922))

(assert (= (and b!391922 c!54275) b!391924))

(assert (= (and b!391922 (not c!54275)) b!391920))

(assert (= (or b!391924 b!391920) bm!27625))

(assert (= (and d!73139 res!224446) b!391917))

(assert (= (and b!391917 res!224448) b!391923))

(assert (= (and b!391923 res!224445) b!391921))

(assert (= (and b!391923 c!54276) b!391916))

(assert (= (and b!391923 (not c!54276)) b!391918))

(assert (= (and b!391916 res!224447) b!391919))

(assert (= (and b!391918 c!54277) b!391926))

(assert (= (and b!391918 (not c!54277)) b!391925))

(declare-fun b_lambda!8717 () Bool)

(assert (=> (not b_lambda!8717) (not b!391919)))

(declare-fun t!11448 () Bool)

(declare-fun tb!3115 () Bool)

(assert (=> (and start!38034 (= defaultEntry!514 defaultEntry!514) t!11448) tb!3115))

(declare-fun result!5741 () Bool)

(assert (=> tb!3115 (= result!5741 tp_is_empty!9667)))

(assert (=> b!391919 t!11448))

(declare-fun b_and!16341 () Bool)

(assert (= b_and!16335 (and (=> t!11448 result!5741) b_and!16341)))

(declare-fun b_lambda!8719 () Bool)

(assert (=> (not b_lambda!8719) (not b!391924)))

(assert (=> b!391924 t!11448))

(declare-fun b_and!16343 () Bool)

(assert (= b_and!16341 (and (=> t!11448 result!5741) b_and!16343)))

(declare-fun m!388589 () Bool)

(assert (=> b!391926 m!388589))

(declare-fun m!388591 () Bool)

(assert (=> b!391925 m!388591))

(declare-fun m!388593 () Bool)

(assert (=> b!391917 m!388593))

(declare-fun m!388595 () Bool)

(assert (=> b!391924 m!388595))

(assert (=> b!391924 m!388595))

(declare-fun m!388597 () Bool)

(assert (=> b!391924 m!388597))

(declare-fun m!388599 () Bool)

(assert (=> b!391924 m!388599))

(assert (=> b!391924 m!388543))

(declare-fun m!388601 () Bool)

(assert (=> b!391924 m!388601))

(declare-fun m!388603 () Bool)

(assert (=> b!391924 m!388603))

(declare-fun m!388605 () Bool)

(assert (=> b!391924 m!388605))

(assert (=> b!391924 m!388597))

(assert (=> b!391924 m!388603))

(declare-fun m!388607 () Bool)

(assert (=> b!391924 m!388607))

(assert (=> bm!27625 m!388589))

(declare-fun m!388609 () Bool)

(assert (=> d!73139 m!388609))

(assert (=> d!73139 m!388423))

(assert (=> b!391921 m!388543))

(assert (=> b!391921 m!388543))

(assert (=> b!391921 m!388547))

(assert (=> b!391916 m!388543))

(assert (=> b!391916 m!388543))

(declare-fun m!388611 () Bool)

(assert (=> b!391916 m!388611))

(assert (=> b!391919 m!388595))

(assert (=> b!391919 m!388595))

(assert (=> b!391919 m!388597))

(assert (=> b!391919 m!388599))

(assert (=> b!391919 m!388543))

(assert (=> b!391919 m!388543))

(declare-fun m!388613 () Bool)

(assert (=> b!391919 m!388613))

(assert (=> b!391919 m!388597))

(assert (=> b!391922 m!388543))

(assert (=> b!391922 m!388543))

(assert (=> b!391922 m!388547))

(assert (=> b!391756 d!73139))

(declare-fun b!391972 () Bool)

(declare-fun res!224472 () Bool)

(declare-fun e!237382 () Bool)

(assert (=> b!391972 (=> (not res!224472) (not e!237382))))

(declare-fun e!237385 () Bool)

(assert (=> b!391972 (= res!224472 e!237385)))

(declare-fun res!224468 () Bool)

(assert (=> b!391972 (=> res!224468 e!237385)))

(declare-fun e!237377 () Bool)

(assert (=> b!391972 (= res!224468 (not e!237377))))

(declare-fun res!224471 () Bool)

(assert (=> b!391972 (=> (not res!224471) (not e!237377))))

(assert (=> b!391972 (= res!224471 (bvslt #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(declare-fun bm!27640 () Bool)

(declare-fun call!27647 () ListLongMap!5355)

(assert (=> bm!27640 (= call!27647 (getCurrentListMapNoExtraKeys!961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391973 () Bool)

(declare-fun c!54295 () Bool)

(assert (=> b!391973 (= c!54295 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!237387 () ListLongMap!5355)

(declare-fun e!237381 () ListLongMap!5355)

(assert (=> b!391973 (= e!237387 e!237381)))

(declare-fun b!391974 () Bool)

(declare-fun e!237379 () Bool)

(declare-fun e!237386 () Bool)

(assert (=> b!391974 (= e!237379 e!237386)))

(declare-fun res!224469 () Bool)

(declare-fun call!27645 () Bool)

(assert (=> b!391974 (= res!224469 call!27645)))

(assert (=> b!391974 (=> (not res!224469) (not e!237386))))

(declare-fun bm!27641 () Bool)

(declare-fun call!27646 () ListLongMap!5355)

(declare-fun call!27649 () ListLongMap!5355)

(assert (=> bm!27641 (= call!27646 call!27649)))

(declare-fun b!391975 () Bool)

(declare-fun e!237383 () Bool)

(declare-fun e!237384 () Bool)

(assert (=> b!391975 (= e!237383 e!237384)))

(declare-fun res!224473 () Bool)

(declare-fun call!27648 () Bool)

(assert (=> b!391975 (= res!224473 call!27648)))

(assert (=> b!391975 (=> (not res!224473) (not e!237384))))

(declare-fun b!391976 () Bool)

(declare-fun lt!185193 () ListLongMap!5355)

(assert (=> b!391976 (= e!237386 (= (apply!304 lt!185193 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!391977 () Bool)

(declare-fun call!27643 () ListLongMap!5355)

(assert (=> b!391977 (= e!237387 call!27643)))

(declare-fun b!391978 () Bool)

(assert (=> b!391978 (= e!237377 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391979 () Bool)

(declare-fun e!237388 () Bool)

(assert (=> b!391979 (= e!237388 (= (apply!304 lt!185193 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)) (get!5606 (select (arr!11073 _values!506) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391979 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 _values!506)))))

(assert (=> b!391979 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(declare-fun b!391980 () Bool)

(assert (=> b!391980 (= e!237385 e!237388)))

(declare-fun res!224474 () Bool)

(assert (=> b!391980 (=> (not res!224474) (not e!237388))))

(assert (=> b!391980 (= res!224474 (contains!2441 lt!185193 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391980 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(declare-fun b!391981 () Bool)

(assert (=> b!391981 (= e!237379 (not call!27645))))

(declare-fun b!391982 () Bool)

(assert (=> b!391982 (= e!237381 call!27646)))

(declare-fun b!391983 () Bool)

(declare-fun e!237378 () Unit!11965)

(declare-fun Unit!11967 () Unit!11965)

(assert (=> b!391983 (= e!237378 Unit!11967)))

(declare-fun b!391984 () Bool)

(assert (=> b!391984 (= e!237381 call!27643)))

(declare-fun b!391985 () Bool)

(declare-fun res!224470 () Bool)

(assert (=> b!391985 (=> (not res!224470) (not e!237382))))

(assert (=> b!391985 (= res!224470 e!237383)))

(declare-fun c!54294 () Bool)

(assert (=> b!391985 (= c!54294 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!391986 () Bool)

(declare-fun e!237389 () ListLongMap!5355)

(assert (=> b!391986 (= e!237389 e!237387)))

(declare-fun c!54296 () Bool)

(assert (=> b!391986 (= c!54296 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391987 () Bool)

(assert (=> b!391987 (= e!237384 (= (apply!304 lt!185193 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun c!54291 () Bool)

(declare-fun call!27644 () ListLongMap!5355)

(declare-fun bm!27642 () Bool)

(assert (=> bm!27642 (= call!27644 (+!1047 (ite c!54291 call!27647 (ite c!54296 call!27649 call!27646)) (ite (or c!54291 c!54296) (tuple2!6441 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27643 () Bool)

(assert (=> bm!27643 (= call!27645 (contains!2441 lt!185193 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391988 () Bool)

(assert (=> b!391988 (= e!237389 (+!1047 call!27644 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27644 () Bool)

(assert (=> bm!27644 (= call!27643 call!27644)))

(declare-fun d!73141 () Bool)

(assert (=> d!73141 e!237382))

(declare-fun res!224467 () Bool)

(assert (=> d!73141 (=> (not res!224467) (not e!237382))))

(assert (=> d!73141 (= res!224467 (or (bvsge #b00000000000000000000000000000000 (size!11424 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11424 _keys!658)))))))

(declare-fun lt!185174 () ListLongMap!5355)

(assert (=> d!73141 (= lt!185193 lt!185174)))

(declare-fun lt!185179 () Unit!11965)

(assert (=> d!73141 (= lt!185179 e!237378)))

(declare-fun c!54293 () Bool)

(declare-fun e!237380 () Bool)

(assert (=> d!73141 (= c!54293 e!237380)))

(declare-fun res!224475 () Bool)

(assert (=> d!73141 (=> (not res!224475) (not e!237380))))

(assert (=> d!73141 (= res!224475 (bvslt #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(assert (=> d!73141 (= lt!185174 e!237389)))

(assert (=> d!73141 (= c!54291 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73141 (validMask!0 mask!970)))

(assert (=> d!73141 (= (getCurrentListMap!2072 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185193)))

(declare-fun b!391989 () Bool)

(assert (=> b!391989 (= e!237380 (validKeyInArray!0 (select (arr!11072 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391990 () Bool)

(declare-fun lt!185184 () Unit!11965)

(assert (=> b!391990 (= e!237378 lt!185184)))

(declare-fun lt!185186 () ListLongMap!5355)

(assert (=> b!391990 (= lt!185186 (getCurrentListMapNoExtraKeys!961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185178 () (_ BitVec 64))

(assert (=> b!391990 (= lt!185178 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185185 () (_ BitVec 64))

(assert (=> b!391990 (= lt!185185 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185192 () Unit!11965)

(declare-fun addStillContains!280 (ListLongMap!5355 (_ BitVec 64) V!13995 (_ BitVec 64)) Unit!11965)

(assert (=> b!391990 (= lt!185192 (addStillContains!280 lt!185186 lt!185178 zeroValue!472 lt!185185))))

(assert (=> b!391990 (contains!2441 (+!1047 lt!185186 (tuple2!6441 lt!185178 zeroValue!472)) lt!185185)))

(declare-fun lt!185194 () Unit!11965)

(assert (=> b!391990 (= lt!185194 lt!185192)))

(declare-fun lt!185191 () ListLongMap!5355)

(assert (=> b!391990 (= lt!185191 (getCurrentListMapNoExtraKeys!961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185176 () (_ BitVec 64))

(assert (=> b!391990 (= lt!185176 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185175 () (_ BitVec 64))

(assert (=> b!391990 (= lt!185175 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185187 () Unit!11965)

(declare-fun addApplyDifferent!280 (ListLongMap!5355 (_ BitVec 64) V!13995 (_ BitVec 64)) Unit!11965)

(assert (=> b!391990 (= lt!185187 (addApplyDifferent!280 lt!185191 lt!185176 minValue!472 lt!185175))))

(assert (=> b!391990 (= (apply!304 (+!1047 lt!185191 (tuple2!6441 lt!185176 minValue!472)) lt!185175) (apply!304 lt!185191 lt!185175))))

(declare-fun lt!185173 () Unit!11965)

(assert (=> b!391990 (= lt!185173 lt!185187)))

(declare-fun lt!185183 () ListLongMap!5355)

(assert (=> b!391990 (= lt!185183 (getCurrentListMapNoExtraKeys!961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185181 () (_ BitVec 64))

(assert (=> b!391990 (= lt!185181 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185180 () (_ BitVec 64))

(assert (=> b!391990 (= lt!185180 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185188 () Unit!11965)

(assert (=> b!391990 (= lt!185188 (addApplyDifferent!280 lt!185183 lt!185181 zeroValue!472 lt!185180))))

(assert (=> b!391990 (= (apply!304 (+!1047 lt!185183 (tuple2!6441 lt!185181 zeroValue!472)) lt!185180) (apply!304 lt!185183 lt!185180))))

(declare-fun lt!185189 () Unit!11965)

(assert (=> b!391990 (= lt!185189 lt!185188)))

(declare-fun lt!185177 () ListLongMap!5355)

(assert (=> b!391990 (= lt!185177 (getCurrentListMapNoExtraKeys!961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185190 () (_ BitVec 64))

(assert (=> b!391990 (= lt!185190 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185182 () (_ BitVec 64))

(assert (=> b!391990 (= lt!185182 (select (arr!11072 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!391990 (= lt!185184 (addApplyDifferent!280 lt!185177 lt!185190 minValue!472 lt!185182))))

(assert (=> b!391990 (= (apply!304 (+!1047 lt!185177 (tuple2!6441 lt!185190 minValue!472)) lt!185182) (apply!304 lt!185177 lt!185182))))

(declare-fun b!391991 () Bool)

(assert (=> b!391991 (= e!237382 e!237379)))

(declare-fun c!54292 () Bool)

(assert (=> b!391991 (= c!54292 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27645 () Bool)

(assert (=> bm!27645 (= call!27649 call!27647)))

(declare-fun bm!27646 () Bool)

(assert (=> bm!27646 (= call!27648 (contains!2441 lt!185193 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391992 () Bool)

(assert (=> b!391992 (= e!237383 (not call!27648))))

(assert (= (and d!73141 c!54291) b!391988))

(assert (= (and d!73141 (not c!54291)) b!391986))

(assert (= (and b!391986 c!54296) b!391977))

(assert (= (and b!391986 (not c!54296)) b!391973))

(assert (= (and b!391973 c!54295) b!391984))

(assert (= (and b!391973 (not c!54295)) b!391982))

(assert (= (or b!391984 b!391982) bm!27641))

(assert (= (or b!391977 bm!27641) bm!27645))

(assert (= (or b!391977 b!391984) bm!27644))

(assert (= (or b!391988 bm!27645) bm!27640))

(assert (= (or b!391988 bm!27644) bm!27642))

(assert (= (and d!73141 res!224475) b!391989))

(assert (= (and d!73141 c!54293) b!391990))

(assert (= (and d!73141 (not c!54293)) b!391983))

(assert (= (and d!73141 res!224467) b!391972))

(assert (= (and b!391972 res!224471) b!391978))

(assert (= (and b!391972 (not res!224468)) b!391980))

(assert (= (and b!391980 res!224474) b!391979))

(assert (= (and b!391972 res!224472) b!391985))

(assert (= (and b!391985 c!54294) b!391975))

(assert (= (and b!391985 (not c!54294)) b!391992))

(assert (= (and b!391975 res!224473) b!391987))

(assert (= (or b!391975 b!391992) bm!27646))

(assert (= (and b!391985 res!224470) b!391991))

(assert (= (and b!391991 c!54292) b!391974))

(assert (= (and b!391991 (not c!54292)) b!391981))

(assert (= (and b!391974 res!224469) b!391976))

(assert (= (or b!391974 b!391981) bm!27643))

(declare-fun b_lambda!8721 () Bool)

(assert (=> (not b_lambda!8721) (not b!391979)))

(assert (=> b!391979 t!11448))

(declare-fun b_and!16345 () Bool)

(assert (= b_and!16343 (and (=> t!11448 result!5741) b_and!16345)))

(assert (=> bm!27640 m!388447))

(declare-fun m!388615 () Bool)

(assert (=> bm!27646 m!388615))

(assert (=> d!73141 m!388423))

(declare-fun m!388617 () Bool)

(assert (=> b!391990 m!388617))

(declare-fun m!388619 () Bool)

(assert (=> b!391990 m!388619))

(declare-fun m!388621 () Bool)

(assert (=> b!391990 m!388621))

(assert (=> b!391990 m!388617))

(declare-fun m!388623 () Bool)

(assert (=> b!391990 m!388623))

(declare-fun m!388625 () Bool)

(assert (=> b!391990 m!388625))

(declare-fun m!388627 () Bool)

(assert (=> b!391990 m!388627))

(declare-fun m!388629 () Bool)

(assert (=> b!391990 m!388629))

(declare-fun m!388631 () Bool)

(assert (=> b!391990 m!388631))

(declare-fun m!388633 () Bool)

(assert (=> b!391990 m!388633))

(assert (=> b!391990 m!388627))

(declare-fun m!388635 () Bool)

(assert (=> b!391990 m!388635))

(declare-fun m!388637 () Bool)

(assert (=> b!391990 m!388637))

(declare-fun m!388639 () Bool)

(assert (=> b!391990 m!388639))

(declare-fun m!388641 () Bool)

(assert (=> b!391990 m!388641))

(declare-fun m!388643 () Bool)

(assert (=> b!391990 m!388643))

(assert (=> b!391990 m!388639))

(assert (=> b!391990 m!388621))

(declare-fun m!388645 () Bool)

(assert (=> b!391990 m!388645))

(assert (=> b!391990 m!388447))

(assert (=> b!391990 m!388543))

(assert (=> b!391978 m!388543))

(assert (=> b!391978 m!388543))

(assert (=> b!391978 m!388547))

(declare-fun m!388647 () Bool)

(assert (=> b!391976 m!388647))

(assert (=> b!391980 m!388543))

(assert (=> b!391980 m!388543))

(declare-fun m!388649 () Bool)

(assert (=> b!391980 m!388649))

(declare-fun m!388651 () Bool)

(assert (=> bm!27643 m!388651))

(declare-fun m!388653 () Bool)

(assert (=> b!391987 m!388653))

(declare-fun m!388655 () Bool)

(assert (=> bm!27642 m!388655))

(assert (=> b!391989 m!388543))

(assert (=> b!391989 m!388543))

(assert (=> b!391989 m!388547))

(assert (=> b!391979 m!388595))

(assert (=> b!391979 m!388595))

(assert (=> b!391979 m!388597))

(assert (=> b!391979 m!388599))

(assert (=> b!391979 m!388543))

(declare-fun m!388657 () Bool)

(assert (=> b!391979 m!388657))

(assert (=> b!391979 m!388597))

(assert (=> b!391979 m!388543))

(declare-fun m!388659 () Bool)

(assert (=> b!391988 m!388659))

(assert (=> b!391756 d!73141))

(declare-fun d!73143 () Bool)

(declare-fun e!237390 () Bool)

(assert (=> d!73143 e!237390))

(declare-fun res!224477 () Bool)

(assert (=> d!73143 (=> (not res!224477) (not e!237390))))

(declare-fun lt!185195 () ListLongMap!5355)

(assert (=> d!73143 (= res!224477 (contains!2441 lt!185195 (_1!3231 (tuple2!6441 k0!778 v!373))))))

(declare-fun lt!185198 () List!6287)

(assert (=> d!73143 (= lt!185195 (ListLongMap!5356 lt!185198))))

(declare-fun lt!185197 () Unit!11965)

(declare-fun lt!185196 () Unit!11965)

(assert (=> d!73143 (= lt!185197 lt!185196)))

(assert (=> d!73143 (= (getValueByKey!363 lt!185198 (_1!3231 (tuple2!6441 k0!778 v!373))) (Some!368 (_2!3231 (tuple2!6441 k0!778 v!373))))))

(assert (=> d!73143 (= lt!185196 (lemmaContainsTupThenGetReturnValue!185 lt!185198 (_1!3231 (tuple2!6441 k0!778 v!373)) (_2!3231 (tuple2!6441 k0!778 v!373))))))

(assert (=> d!73143 (= lt!185198 (insertStrictlySorted!188 (toList!2693 lt!185034) (_1!3231 (tuple2!6441 k0!778 v!373)) (_2!3231 (tuple2!6441 k0!778 v!373))))))

(assert (=> d!73143 (= (+!1047 lt!185034 (tuple2!6441 k0!778 v!373)) lt!185195)))

(declare-fun b!391993 () Bool)

(declare-fun res!224476 () Bool)

(assert (=> b!391993 (=> (not res!224476) (not e!237390))))

(assert (=> b!391993 (= res!224476 (= (getValueByKey!363 (toList!2693 lt!185195) (_1!3231 (tuple2!6441 k0!778 v!373))) (Some!368 (_2!3231 (tuple2!6441 k0!778 v!373)))))))

(declare-fun b!391994 () Bool)

(assert (=> b!391994 (= e!237390 (contains!2442 (toList!2693 lt!185195) (tuple2!6441 k0!778 v!373)))))

(assert (= (and d!73143 res!224477) b!391993))

(assert (= (and b!391993 res!224476) b!391994))

(declare-fun m!388661 () Bool)

(assert (=> d!73143 m!388661))

(declare-fun m!388663 () Bool)

(assert (=> d!73143 m!388663))

(declare-fun m!388665 () Bool)

(assert (=> d!73143 m!388665))

(declare-fun m!388667 () Bool)

(assert (=> d!73143 m!388667))

(declare-fun m!388669 () Bool)

(assert (=> b!391993 m!388669))

(declare-fun m!388671 () Bool)

(assert (=> b!391994 m!388671))

(assert (=> b!391756 d!73143))

(declare-fun bm!27651 () Bool)

(declare-fun call!27654 () ListLongMap!5355)

(assert (=> bm!27651 (= call!27654 (getCurrentListMapNoExtraKeys!961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392001 () Bool)

(declare-fun e!237396 () Bool)

(declare-fun call!27655 () ListLongMap!5355)

(assert (=> b!392001 (= e!237396 (= call!27655 call!27654))))

(declare-fun b!392002 () Bool)

(declare-fun e!237395 () Bool)

(assert (=> b!392002 (= e!237395 e!237396)))

(declare-fun c!54299 () Bool)

(assert (=> b!392002 (= c!54299 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun d!73145 () Bool)

(assert (=> d!73145 e!237395))

(declare-fun res!224480 () Bool)

(assert (=> d!73145 (=> (not res!224480) (not e!237395))))

(assert (=> d!73145 (= res!224480 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11424 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11425 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11424 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11425 _values!506))))))))

(declare-fun lt!185201 () Unit!11965)

(declare-fun choose!1326 (array!23222 array!23224 (_ BitVec 32) (_ BitVec 32) V!13995 V!13995 (_ BitVec 32) (_ BitVec 64) V!13995 (_ BitVec 32) Int) Unit!11965)

(assert (=> d!73145 (= lt!185201 (choose!1326 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73145 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11424 _keys!658)))))

(assert (=> d!73145 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!263 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!185201)))

(declare-fun bm!27652 () Bool)

(assert (=> bm!27652 (= call!27655 (getCurrentListMapNoExtraKeys!961 (array!23223 (store (arr!11072 _keys!658) i!548 k0!778) (size!11424 _keys!658)) (array!23225 (store (arr!11073 _values!506) i!548 (ValueCellFull!4490 v!373)) (size!11425 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392003 () Bool)

(assert (=> b!392003 (= e!237396 (= call!27655 (+!1047 call!27654 (tuple2!6441 k0!778 v!373))))))

(assert (= (and d!73145 res!224480) b!392002))

(assert (= (and b!392002 c!54299) b!392003))

(assert (= (and b!392002 (not c!54299)) b!392001))

(assert (= (or b!392003 b!392001) bm!27651))

(assert (= (or b!392003 b!392001) bm!27652))

(assert (=> bm!27651 m!388447))

(declare-fun m!388673 () Bool)

(assert (=> d!73145 m!388673))

(assert (=> bm!27652 m!388433))

(assert (=> bm!27652 m!388459))

(declare-fun m!388675 () Bool)

(assert (=> bm!27652 m!388675))

(declare-fun m!388677 () Bool)

(assert (=> b!392003 m!388677))

(assert (=> b!391756 d!73145))

(declare-fun b!392004 () Bool)

(declare-fun res!224486 () Bool)

(declare-fun e!237402 () Bool)

(assert (=> b!392004 (=> (not res!224486) (not e!237402))))

(declare-fun e!237405 () Bool)

(assert (=> b!392004 (= res!224486 e!237405)))

(declare-fun res!224482 () Bool)

(assert (=> b!392004 (=> res!224482 e!237405)))

(declare-fun e!237397 () Bool)

(assert (=> b!392004 (= res!224482 (not e!237397))))

(declare-fun res!224485 () Bool)

(assert (=> b!392004 (=> (not res!224485) (not e!237397))))

(assert (=> b!392004 (= res!224485 (bvslt #b00000000000000000000000000000000 (size!11424 lt!185031)))))

(declare-fun call!27660 () ListLongMap!5355)

(declare-fun bm!27653 () Bool)

(assert (=> bm!27653 (= call!27660 (getCurrentListMapNoExtraKeys!961 lt!185031 lt!185028 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392005 () Bool)

(declare-fun c!54304 () Bool)

(assert (=> b!392005 (= c!54304 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!237407 () ListLongMap!5355)

(declare-fun e!237401 () ListLongMap!5355)

(assert (=> b!392005 (= e!237407 e!237401)))

(declare-fun b!392006 () Bool)

(declare-fun e!237399 () Bool)

(declare-fun e!237406 () Bool)

(assert (=> b!392006 (= e!237399 e!237406)))

(declare-fun res!224483 () Bool)

(declare-fun call!27658 () Bool)

(assert (=> b!392006 (= res!224483 call!27658)))

(assert (=> b!392006 (=> (not res!224483) (not e!237406))))

(declare-fun bm!27654 () Bool)

(declare-fun call!27659 () ListLongMap!5355)

(declare-fun call!27662 () ListLongMap!5355)

(assert (=> bm!27654 (= call!27659 call!27662)))

(declare-fun b!392007 () Bool)

(declare-fun e!237403 () Bool)

(declare-fun e!237404 () Bool)

(assert (=> b!392007 (= e!237403 e!237404)))

(declare-fun res!224487 () Bool)

(declare-fun call!27661 () Bool)

(assert (=> b!392007 (= res!224487 call!27661)))

(assert (=> b!392007 (=> (not res!224487) (not e!237404))))

(declare-fun b!392008 () Bool)

(declare-fun lt!185222 () ListLongMap!5355)

(assert (=> b!392008 (= e!237406 (= (apply!304 lt!185222 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392009 () Bool)

(declare-fun call!27656 () ListLongMap!5355)

(assert (=> b!392009 (= e!237407 call!27656)))

(declare-fun b!392010 () Bool)

(assert (=> b!392010 (= e!237397 (validKeyInArray!0 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)))))

(declare-fun b!392011 () Bool)

(declare-fun e!237408 () Bool)

(assert (=> b!392011 (= e!237408 (= (apply!304 lt!185222 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)) (get!5606 (select (arr!11073 lt!185028) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392011 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 lt!185028)))))

(assert (=> b!392011 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11424 lt!185031)))))

(declare-fun b!392012 () Bool)

(assert (=> b!392012 (= e!237405 e!237408)))

(declare-fun res!224488 () Bool)

(assert (=> b!392012 (=> (not res!224488) (not e!237408))))

(assert (=> b!392012 (= res!224488 (contains!2441 lt!185222 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)))))

(assert (=> b!392012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11424 lt!185031)))))

(declare-fun b!392013 () Bool)

(assert (=> b!392013 (= e!237399 (not call!27658))))

(declare-fun b!392014 () Bool)

(assert (=> b!392014 (= e!237401 call!27659)))

(declare-fun b!392015 () Bool)

(declare-fun e!237398 () Unit!11965)

(declare-fun Unit!11968 () Unit!11965)

(assert (=> b!392015 (= e!237398 Unit!11968)))

(declare-fun b!392016 () Bool)

(assert (=> b!392016 (= e!237401 call!27656)))

(declare-fun b!392017 () Bool)

(declare-fun res!224484 () Bool)

(assert (=> b!392017 (=> (not res!224484) (not e!237402))))

(assert (=> b!392017 (= res!224484 e!237403)))

(declare-fun c!54303 () Bool)

(assert (=> b!392017 (= c!54303 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392018 () Bool)

(declare-fun e!237409 () ListLongMap!5355)

(assert (=> b!392018 (= e!237409 e!237407)))

(declare-fun c!54305 () Bool)

(assert (=> b!392018 (= c!54305 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392019 () Bool)

(assert (=> b!392019 (= e!237404 (= (apply!304 lt!185222 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun call!27657 () ListLongMap!5355)

(declare-fun bm!27655 () Bool)

(declare-fun c!54300 () Bool)

(assert (=> bm!27655 (= call!27657 (+!1047 (ite c!54300 call!27660 (ite c!54305 call!27662 call!27659)) (ite (or c!54300 c!54305) (tuple2!6441 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27656 () Bool)

(assert (=> bm!27656 (= call!27658 (contains!2441 lt!185222 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392020 () Bool)

(assert (=> b!392020 (= e!237409 (+!1047 call!27657 (tuple2!6441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27657 () Bool)

(assert (=> bm!27657 (= call!27656 call!27657)))

(declare-fun d!73147 () Bool)

(assert (=> d!73147 e!237402))

(declare-fun res!224481 () Bool)

(assert (=> d!73147 (=> (not res!224481) (not e!237402))))

(assert (=> d!73147 (= res!224481 (or (bvsge #b00000000000000000000000000000000 (size!11424 lt!185031)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11424 lt!185031)))))))

(declare-fun lt!185203 () ListLongMap!5355)

(assert (=> d!73147 (= lt!185222 lt!185203)))

(declare-fun lt!185208 () Unit!11965)

(assert (=> d!73147 (= lt!185208 e!237398)))

(declare-fun c!54302 () Bool)

(declare-fun e!237400 () Bool)

(assert (=> d!73147 (= c!54302 e!237400)))

(declare-fun res!224489 () Bool)

(assert (=> d!73147 (=> (not res!224489) (not e!237400))))

(assert (=> d!73147 (= res!224489 (bvslt #b00000000000000000000000000000000 (size!11424 lt!185031)))))

(assert (=> d!73147 (= lt!185203 e!237409)))

(assert (=> d!73147 (= c!54300 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73147 (validMask!0 mask!970)))

(assert (=> d!73147 (= (getCurrentListMap!2072 lt!185031 lt!185028 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185222)))

(declare-fun b!392021 () Bool)

(assert (=> b!392021 (= e!237400 (validKeyInArray!0 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)))))

(declare-fun b!392022 () Bool)

(declare-fun lt!185213 () Unit!11965)

(assert (=> b!392022 (= e!237398 lt!185213)))

(declare-fun lt!185215 () ListLongMap!5355)

(assert (=> b!392022 (= lt!185215 (getCurrentListMapNoExtraKeys!961 lt!185031 lt!185028 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185207 () (_ BitVec 64))

(assert (=> b!392022 (= lt!185207 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185214 () (_ BitVec 64))

(assert (=> b!392022 (= lt!185214 (select (arr!11072 lt!185031) #b00000000000000000000000000000000))))

(declare-fun lt!185221 () Unit!11965)

(assert (=> b!392022 (= lt!185221 (addStillContains!280 lt!185215 lt!185207 zeroValue!472 lt!185214))))

(assert (=> b!392022 (contains!2441 (+!1047 lt!185215 (tuple2!6441 lt!185207 zeroValue!472)) lt!185214)))

(declare-fun lt!185223 () Unit!11965)

(assert (=> b!392022 (= lt!185223 lt!185221)))

(declare-fun lt!185220 () ListLongMap!5355)

(assert (=> b!392022 (= lt!185220 (getCurrentListMapNoExtraKeys!961 lt!185031 lt!185028 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185205 () (_ BitVec 64))

(assert (=> b!392022 (= lt!185205 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185204 () (_ BitVec 64))

(assert (=> b!392022 (= lt!185204 (select (arr!11072 lt!185031) #b00000000000000000000000000000000))))

(declare-fun lt!185216 () Unit!11965)

(assert (=> b!392022 (= lt!185216 (addApplyDifferent!280 lt!185220 lt!185205 minValue!472 lt!185204))))

(assert (=> b!392022 (= (apply!304 (+!1047 lt!185220 (tuple2!6441 lt!185205 minValue!472)) lt!185204) (apply!304 lt!185220 lt!185204))))

(declare-fun lt!185202 () Unit!11965)

(assert (=> b!392022 (= lt!185202 lt!185216)))

(declare-fun lt!185212 () ListLongMap!5355)

(assert (=> b!392022 (= lt!185212 (getCurrentListMapNoExtraKeys!961 lt!185031 lt!185028 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185210 () (_ BitVec 64))

(assert (=> b!392022 (= lt!185210 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185209 () (_ BitVec 64))

(assert (=> b!392022 (= lt!185209 (select (arr!11072 lt!185031) #b00000000000000000000000000000000))))

(declare-fun lt!185217 () Unit!11965)

(assert (=> b!392022 (= lt!185217 (addApplyDifferent!280 lt!185212 lt!185210 zeroValue!472 lt!185209))))

(assert (=> b!392022 (= (apply!304 (+!1047 lt!185212 (tuple2!6441 lt!185210 zeroValue!472)) lt!185209) (apply!304 lt!185212 lt!185209))))

(declare-fun lt!185218 () Unit!11965)

(assert (=> b!392022 (= lt!185218 lt!185217)))

(declare-fun lt!185206 () ListLongMap!5355)

(assert (=> b!392022 (= lt!185206 (getCurrentListMapNoExtraKeys!961 lt!185031 lt!185028 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185219 () (_ BitVec 64))

(assert (=> b!392022 (= lt!185219 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185211 () (_ BitVec 64))

(assert (=> b!392022 (= lt!185211 (select (arr!11072 lt!185031) #b00000000000000000000000000000000))))

(assert (=> b!392022 (= lt!185213 (addApplyDifferent!280 lt!185206 lt!185219 minValue!472 lt!185211))))

(assert (=> b!392022 (= (apply!304 (+!1047 lt!185206 (tuple2!6441 lt!185219 minValue!472)) lt!185211) (apply!304 lt!185206 lt!185211))))

(declare-fun b!392023 () Bool)

(assert (=> b!392023 (= e!237402 e!237399)))

(declare-fun c!54301 () Bool)

(assert (=> b!392023 (= c!54301 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27658 () Bool)

(assert (=> bm!27658 (= call!27662 call!27660)))

(declare-fun bm!27659 () Bool)

(assert (=> bm!27659 (= call!27661 (contains!2441 lt!185222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392024 () Bool)

(assert (=> b!392024 (= e!237403 (not call!27661))))

(assert (= (and d!73147 c!54300) b!392020))

(assert (= (and d!73147 (not c!54300)) b!392018))

(assert (= (and b!392018 c!54305) b!392009))

(assert (= (and b!392018 (not c!54305)) b!392005))

(assert (= (and b!392005 c!54304) b!392016))

(assert (= (and b!392005 (not c!54304)) b!392014))

(assert (= (or b!392016 b!392014) bm!27654))

(assert (= (or b!392009 bm!27654) bm!27658))

(assert (= (or b!392009 b!392016) bm!27657))

(assert (= (or b!392020 bm!27658) bm!27653))

(assert (= (or b!392020 bm!27657) bm!27655))

(assert (= (and d!73147 res!224489) b!392021))

(assert (= (and d!73147 c!54302) b!392022))

(assert (= (and d!73147 (not c!54302)) b!392015))

(assert (= (and d!73147 res!224481) b!392004))

(assert (= (and b!392004 res!224485) b!392010))

(assert (= (and b!392004 (not res!224482)) b!392012))

(assert (= (and b!392012 res!224488) b!392011))

(assert (= (and b!392004 res!224486) b!392017))

(assert (= (and b!392017 c!54303) b!392007))

(assert (= (and b!392017 (not c!54303)) b!392024))

(assert (= (and b!392007 res!224487) b!392019))

(assert (= (or b!392007 b!392024) bm!27659))

(assert (= (and b!392017 res!224484) b!392023))

(assert (= (and b!392023 c!54301) b!392006))

(assert (= (and b!392023 (not c!54301)) b!392013))

(assert (= (and b!392006 res!224483) b!392008))

(assert (= (or b!392006 b!392013) bm!27656))

(declare-fun b_lambda!8723 () Bool)

(assert (=> (not b_lambda!8723) (not b!392011)))

(assert (=> b!392011 t!11448))

(declare-fun b_and!16347 () Bool)

(assert (= b_and!16345 (and (=> t!11448 result!5741) b_and!16347)))

(assert (=> bm!27653 m!388451))

(declare-fun m!388679 () Bool)

(assert (=> bm!27659 m!388679))

(assert (=> d!73147 m!388423))

(declare-fun m!388681 () Bool)

(assert (=> b!392022 m!388681))

(declare-fun m!388683 () Bool)

(assert (=> b!392022 m!388683))

(declare-fun m!388685 () Bool)

(assert (=> b!392022 m!388685))

(assert (=> b!392022 m!388681))

(declare-fun m!388687 () Bool)

(assert (=> b!392022 m!388687))

(declare-fun m!388689 () Bool)

(assert (=> b!392022 m!388689))

(declare-fun m!388691 () Bool)

(assert (=> b!392022 m!388691))

(declare-fun m!388693 () Bool)

(assert (=> b!392022 m!388693))

(declare-fun m!388695 () Bool)

(assert (=> b!392022 m!388695))

(declare-fun m!388697 () Bool)

(assert (=> b!392022 m!388697))

(assert (=> b!392022 m!388691))

(declare-fun m!388699 () Bool)

(assert (=> b!392022 m!388699))

(declare-fun m!388701 () Bool)

(assert (=> b!392022 m!388701))

(declare-fun m!388703 () Bool)

(assert (=> b!392022 m!388703))

(declare-fun m!388705 () Bool)

(assert (=> b!392022 m!388705))

(declare-fun m!388707 () Bool)

(assert (=> b!392022 m!388707))

(assert (=> b!392022 m!388703))

(assert (=> b!392022 m!388685))

(declare-fun m!388709 () Bool)

(assert (=> b!392022 m!388709))

(assert (=> b!392022 m!388451))

(assert (=> b!392022 m!388573))

(assert (=> b!392010 m!388573))

(assert (=> b!392010 m!388573))

(assert (=> b!392010 m!388575))

(declare-fun m!388711 () Bool)

(assert (=> b!392008 m!388711))

(assert (=> b!392012 m!388573))

(assert (=> b!392012 m!388573))

(declare-fun m!388713 () Bool)

(assert (=> b!392012 m!388713))

(declare-fun m!388715 () Bool)

(assert (=> bm!27656 m!388715))

(declare-fun m!388717 () Bool)

(assert (=> b!392019 m!388717))

(declare-fun m!388719 () Bool)

(assert (=> bm!27655 m!388719))

(assert (=> b!392021 m!388573))

(assert (=> b!392021 m!388573))

(assert (=> b!392021 m!388575))

(declare-fun m!388721 () Bool)

(assert (=> b!392011 m!388721))

(assert (=> b!392011 m!388721))

(assert (=> b!392011 m!388597))

(declare-fun m!388723 () Bool)

(assert (=> b!392011 m!388723))

(assert (=> b!392011 m!388573))

(declare-fun m!388725 () Bool)

(assert (=> b!392011 m!388725))

(assert (=> b!392011 m!388597))

(assert (=> b!392011 m!388573))

(declare-fun m!388727 () Bool)

(assert (=> b!392020 m!388727))

(assert (=> b!391756 d!73147))

(declare-fun b!392025 () Bool)

(declare-fun e!237414 () Bool)

(declare-fun e!237412 () Bool)

(assert (=> b!392025 (= e!237414 e!237412)))

(assert (=> b!392025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11424 lt!185031)))))

(declare-fun res!224492 () Bool)

(declare-fun lt!185227 () ListLongMap!5355)

(assert (=> b!392025 (= res!224492 (contains!2441 lt!185227 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)))))

(assert (=> b!392025 (=> (not res!224492) (not e!237412))))

(declare-fun d!73149 () Bool)

(declare-fun e!237413 () Bool)

(assert (=> d!73149 e!237413))

(declare-fun res!224491 () Bool)

(assert (=> d!73149 (=> (not res!224491) (not e!237413))))

(assert (=> d!73149 (= res!224491 (not (contains!2441 lt!185227 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!237410 () ListLongMap!5355)

(assert (=> d!73149 (= lt!185227 e!237410)))

(declare-fun c!54309 () Bool)

(assert (=> d!73149 (= c!54309 (bvsge #b00000000000000000000000000000000 (size!11424 lt!185031)))))

(assert (=> d!73149 (validMask!0 mask!970)))

(assert (=> d!73149 (= (getCurrentListMapNoExtraKeys!961 lt!185031 lt!185028 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185227)))

(declare-fun b!392026 () Bool)

(declare-fun res!224493 () Bool)

(assert (=> b!392026 (=> (not res!224493) (not e!237413))))

(assert (=> b!392026 (= res!224493 (not (contains!2441 lt!185227 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392027 () Bool)

(declare-fun e!237415 () Bool)

(assert (=> b!392027 (= e!237414 e!237415)))

(declare-fun c!54308 () Bool)

(assert (=> b!392027 (= c!54308 (bvslt #b00000000000000000000000000000000 (size!11424 lt!185031)))))

(declare-fun b!392028 () Bool)

(assert (=> b!392028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11424 lt!185031)))))

(assert (=> b!392028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11425 lt!185028)))))

(assert (=> b!392028 (= e!237412 (= (apply!304 lt!185227 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)) (get!5606 (select (arr!11073 lt!185028) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392029 () Bool)

(declare-fun e!237416 () ListLongMap!5355)

(declare-fun call!27663 () ListLongMap!5355)

(assert (=> b!392029 (= e!237416 call!27663)))

(declare-fun b!392030 () Bool)

(declare-fun e!237411 () Bool)

(assert (=> b!392030 (= e!237411 (validKeyInArray!0 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)))))

(assert (=> b!392030 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!392031 () Bool)

(assert (=> b!392031 (= e!237410 e!237416)))

(declare-fun c!54306 () Bool)

(assert (=> b!392031 (= c!54306 (validKeyInArray!0 (select (arr!11072 lt!185031) #b00000000000000000000000000000000)))))

(declare-fun b!392032 () Bool)

(assert (=> b!392032 (= e!237413 e!237414)))

(declare-fun c!54307 () Bool)

(assert (=> b!392032 (= c!54307 e!237411)))

(declare-fun res!224490 () Bool)

(assert (=> b!392032 (=> (not res!224490) (not e!237411))))

(assert (=> b!392032 (= res!224490 (bvslt #b00000000000000000000000000000000 (size!11424 lt!185031)))))

(declare-fun b!392033 () Bool)

(declare-fun lt!185226 () Unit!11965)

(declare-fun lt!185225 () Unit!11965)

(assert (=> b!392033 (= lt!185226 lt!185225)))

(declare-fun lt!185230 () (_ BitVec 64))

(declare-fun lt!185228 () ListLongMap!5355)

(declare-fun lt!185229 () V!13995)

(declare-fun lt!185224 () (_ BitVec 64))

(assert (=> b!392033 (not (contains!2441 (+!1047 lt!185228 (tuple2!6441 lt!185224 lt!185229)) lt!185230))))

(assert (=> b!392033 (= lt!185225 (addStillNotContains!139 lt!185228 lt!185224 lt!185229 lt!185230))))

(assert (=> b!392033 (= lt!185230 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392033 (= lt!185229 (get!5606 (select (arr!11073 lt!185028) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392033 (= lt!185224 (select (arr!11072 lt!185031) #b00000000000000000000000000000000))))

(assert (=> b!392033 (= lt!185228 call!27663)))

(assert (=> b!392033 (= e!237416 (+!1047 call!27663 (tuple2!6441 (select (arr!11072 lt!185031) #b00000000000000000000000000000000) (get!5606 (select (arr!11073 lt!185028) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392034 () Bool)

(assert (=> b!392034 (= e!237415 (isEmpty!556 lt!185227))))

(declare-fun b!392035 () Bool)

(assert (=> b!392035 (= e!237415 (= lt!185227 (getCurrentListMapNoExtraKeys!961 lt!185031 lt!185028 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!392036 () Bool)

(assert (=> b!392036 (= e!237410 (ListLongMap!5356 Nil!6284))))

(declare-fun bm!27660 () Bool)

(assert (=> bm!27660 (= call!27663 (getCurrentListMapNoExtraKeys!961 lt!185031 lt!185028 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(assert (= (and d!73149 c!54309) b!392036))

(assert (= (and d!73149 (not c!54309)) b!392031))

(assert (= (and b!392031 c!54306) b!392033))

(assert (= (and b!392031 (not c!54306)) b!392029))

(assert (= (or b!392033 b!392029) bm!27660))

(assert (= (and d!73149 res!224491) b!392026))

(assert (= (and b!392026 res!224493) b!392032))

(assert (= (and b!392032 res!224490) b!392030))

(assert (= (and b!392032 c!54307) b!392025))

(assert (= (and b!392032 (not c!54307)) b!392027))

(assert (= (and b!392025 res!224492) b!392028))

(assert (= (and b!392027 c!54308) b!392035))

(assert (= (and b!392027 (not c!54308)) b!392034))

(declare-fun b_lambda!8725 () Bool)

(assert (=> (not b_lambda!8725) (not b!392028)))

(assert (=> b!392028 t!11448))

(declare-fun b_and!16349 () Bool)

(assert (= b_and!16347 (and (=> t!11448 result!5741) b_and!16349)))

(declare-fun b_lambda!8727 () Bool)

(assert (=> (not b_lambda!8727) (not b!392033)))

(assert (=> b!392033 t!11448))

(declare-fun b_and!16351 () Bool)

(assert (= b_and!16349 (and (=> t!11448 result!5741) b_and!16351)))

(declare-fun m!388729 () Bool)

(assert (=> b!392035 m!388729))

(declare-fun m!388731 () Bool)

(assert (=> b!392034 m!388731))

(declare-fun m!388733 () Bool)

(assert (=> b!392026 m!388733))

(assert (=> b!392033 m!388721))

(assert (=> b!392033 m!388721))

(assert (=> b!392033 m!388597))

(assert (=> b!392033 m!388723))

(assert (=> b!392033 m!388573))

(declare-fun m!388735 () Bool)

(assert (=> b!392033 m!388735))

(declare-fun m!388737 () Bool)

(assert (=> b!392033 m!388737))

(declare-fun m!388739 () Bool)

(assert (=> b!392033 m!388739))

(assert (=> b!392033 m!388597))

(assert (=> b!392033 m!388737))

(declare-fun m!388741 () Bool)

(assert (=> b!392033 m!388741))

(assert (=> bm!27660 m!388729))

(declare-fun m!388743 () Bool)

(assert (=> d!73149 m!388743))

(assert (=> d!73149 m!388423))

(assert (=> b!392030 m!388573))

(assert (=> b!392030 m!388573))

(assert (=> b!392030 m!388575))

(assert (=> b!392025 m!388573))

(assert (=> b!392025 m!388573))

(declare-fun m!388745 () Bool)

(assert (=> b!392025 m!388745))

(assert (=> b!392028 m!388721))

(assert (=> b!392028 m!388721))

(assert (=> b!392028 m!388597))

(assert (=> b!392028 m!388723))

(assert (=> b!392028 m!388573))

(assert (=> b!392028 m!388573))

(declare-fun m!388747 () Bool)

(assert (=> b!392028 m!388747))

(assert (=> b!392028 m!388597))

(assert (=> b!392031 m!388573))

(assert (=> b!392031 m!388573))

(assert (=> b!392031 m!388575))

(assert (=> b!391756 d!73149))

(declare-fun d!73151 () Bool)

(assert (=> d!73151 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391750 d!73151))

(declare-fun mapNonEmpty!16095 () Bool)

(declare-fun mapRes!16095 () Bool)

(declare-fun tp!31773 () Bool)

(declare-fun e!237422 () Bool)

(assert (=> mapNonEmpty!16095 (= mapRes!16095 (and tp!31773 e!237422))))

(declare-fun mapKey!16095 () (_ BitVec 32))

(declare-fun mapValue!16095 () ValueCell!4490)

(declare-fun mapRest!16095 () (Array (_ BitVec 32) ValueCell!4490))

(assert (=> mapNonEmpty!16095 (= mapRest!16086 (store mapRest!16095 mapKey!16095 mapValue!16095))))

(declare-fun condMapEmpty!16095 () Bool)

(declare-fun mapDefault!16095 () ValueCell!4490)

(assert (=> mapNonEmpty!16086 (= condMapEmpty!16095 (= mapRest!16086 ((as const (Array (_ BitVec 32) ValueCell!4490)) mapDefault!16095)))))

(declare-fun e!237421 () Bool)

(assert (=> mapNonEmpty!16086 (= tp!31757 (and e!237421 mapRes!16095))))

(declare-fun b!392044 () Bool)

(assert (=> b!392044 (= e!237421 tp_is_empty!9667)))

(declare-fun b!392043 () Bool)

(assert (=> b!392043 (= e!237422 tp_is_empty!9667)))

(declare-fun mapIsEmpty!16095 () Bool)

(assert (=> mapIsEmpty!16095 mapRes!16095))

(assert (= (and mapNonEmpty!16086 condMapEmpty!16095) mapIsEmpty!16095))

(assert (= (and mapNonEmpty!16086 (not condMapEmpty!16095)) mapNonEmpty!16095))

(assert (= (and mapNonEmpty!16095 ((_ is ValueCellFull!4490) mapValue!16095)) b!392043))

(assert (= (and mapNonEmpty!16086 ((_ is ValueCellFull!4490) mapDefault!16095)) b!392044))

(declare-fun m!388749 () Bool)

(assert (=> mapNonEmpty!16095 m!388749))

(declare-fun b_lambda!8729 () Bool)

(assert (= b_lambda!8721 (or (and start!38034 b_free!8995) b_lambda!8729)))

(declare-fun b_lambda!8731 () Bool)

(assert (= b_lambda!8727 (or (and start!38034 b_free!8995) b_lambda!8731)))

(declare-fun b_lambda!8733 () Bool)

(assert (= b_lambda!8717 (or (and start!38034 b_free!8995) b_lambda!8733)))

(declare-fun b_lambda!8735 () Bool)

(assert (= b_lambda!8719 (or (and start!38034 b_free!8995) b_lambda!8735)))

(declare-fun b_lambda!8737 () Bool)

(assert (= b_lambda!8725 (or (and start!38034 b_free!8995) b_lambda!8737)))

(declare-fun b_lambda!8739 () Bool)

(assert (= b_lambda!8723 (or (and start!38034 b_free!8995) b_lambda!8739)))

(check-sat (not b!392008) (not d!73149) (not b!391994) (not b!391888) (not b!391883) (not d!73139) (not b!391916) (not b_lambda!8729) (not b!392034) (not bm!27653) (not b!391849) (not b!391919) (not bm!27640) (not d!73143) (not bm!27652) (not b!392012) (not bm!27656) (not b!391987) (not b!392022) (not b!391979) (not b!391881) (not b!391861) (not bm!27642) (not b!391922) (not d!73141) (not b!392003) (not bm!27622) tp_is_empty!9667 (not mapNonEmpty!16095) (not b!391917) (not b!392010) (not b!392033) (not bm!27621) (not bm!27617) (not b!391925) (not b!391890) (not bm!27655) (not bm!27651) (not b!391889) (not b!392035) (not b!391924) (not b!391993) (not b!392031) (not b!392020) (not b_lambda!8737) (not b!391875) (not b!391873) (not bm!27646) (not b_lambda!8733) (not bm!27620) (not b!391921) (not b!392025) (not b!391980) (not d!73147) (not b!391988) (not b_lambda!8731) (not b_next!8995) (not b!392030) (not b!391926) (not b_lambda!8735) (not b!391858) (not b!392019) (not b!391978) (not b!391989) (not b!391976) (not bm!27660) (not d!73133) (not b!391882) (not b!392021) (not bm!27659) (not b_lambda!8739) (not b!391990) (not bm!27625) (not b!391874) (not d!73145) (not bm!27643) b_and!16351 (not b!391886) (not b!392011) (not b!392028) (not b!392026))
(check-sat b_and!16351 (not b_next!8995))
