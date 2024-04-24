; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35132 () Bool)

(assert start!35132)

(declare-fun b_free!7765 () Bool)

(declare-fun b_next!7765 () Bool)

(assert (=> start!35132 (= b_free!7765 (not b_next!7765))))

(declare-fun tp!26883 () Bool)

(declare-fun b_and!15015 () Bool)

(assert (=> start!35132 (= tp!26883 b_and!15015)))

(declare-fun b!352296 () Bool)

(declare-fun e!215733 () Bool)

(declare-fun e!215731 () Bool)

(assert (=> b!352296 (= e!215733 e!215731)))

(declare-fun res!195392 () Bool)

(assert (=> b!352296 (=> (not res!195392) (not e!215731))))

(declare-fun lt!165211 () Bool)

(assert (=> b!352296 (= res!195392 (not lt!165211))))

(declare-datatypes ((Unit!10878 0))(
  ( (Unit!10879) )
))
(declare-fun lt!165209 () Unit!10878)

(declare-fun e!215729 () Unit!10878)

(assert (=> b!352296 (= lt!165209 e!215729)))

(declare-fun c!53543 () Bool)

(assert (=> b!352296 (= c!53543 lt!165211)))

(declare-datatypes ((array!19014 0))(
  ( (array!19015 (arr!9009 (Array (_ BitVec 32) (_ BitVec 64))) (size!9361 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19014)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!352296 (= lt!165211 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!13056 () Bool)

(declare-fun mapRes!13056 () Bool)

(assert (=> mapIsEmpty!13056 mapRes!13056))

(declare-fun b!352297 () Bool)

(declare-fun e!215738 () Bool)

(declare-fun tp_is_empty!7717 () Bool)

(assert (=> b!352297 (= e!215738 tp_is_empty!7717)))

(declare-fun b!352298 () Bool)

(declare-fun e!215735 () Bool)

(assert (=> b!352298 (= e!215735 e!215733)))

(declare-fun res!195391 () Bool)

(assert (=> b!352298 (=> (not res!195391) (not e!215733))))

(declare-datatypes ((SeekEntryResult!3421 0))(
  ( (MissingZero!3421 (index!15863 (_ BitVec 32))) (Found!3421 (index!15864 (_ BitVec 32))) (Intermediate!3421 (undefined!4233 Bool) (index!15865 (_ BitVec 32)) (x!35008 (_ BitVec 32))) (Undefined!3421) (MissingVacant!3421 (index!15866 (_ BitVec 32))) )
))
(declare-fun lt!165210 () SeekEntryResult!3421)

(get-info :version)

(assert (=> b!352298 (= res!195391 (and (not ((_ is Found!3421) lt!165210)) (not ((_ is MissingZero!3421) lt!165210)) ((_ is MissingVacant!3421) lt!165210)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19014 (_ BitVec 32)) SeekEntryResult!3421)

(assert (=> b!352298 (= lt!165210 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352299 () Bool)

(declare-fun e!215736 () Bool)

(declare-fun e!215730 () Bool)

(assert (=> b!352299 (= e!215736 e!215730)))

(declare-fun res!195387 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!352299 (= res!195387 (not (inRange!0 (index!15866 lt!165210) mask!2385)))))

(assert (=> b!352299 (=> res!195387 e!215730)))

(declare-fun b!352300 () Bool)

(assert (=> b!352300 (= e!215731 e!215736)))

(declare-fun c!53542 () Bool)

(assert (=> b!352300 (= c!53542 ((_ is MissingVacant!3421) lt!165210))))

(declare-fun b!352301 () Bool)

(declare-fun e!215734 () Bool)

(declare-fun e!215732 () Bool)

(assert (=> b!352301 (= e!215734 (and e!215732 mapRes!13056))))

(declare-fun condMapEmpty!13056 () Bool)

(declare-datatypes ((V!11267 0))(
  ( (V!11268 (val!3903 Int)) )
))
(declare-datatypes ((ValueCell!3515 0))(
  ( (ValueCellFull!3515 (v!6094 V!11267)) (EmptyCell!3515) )
))
(declare-datatypes ((array!19016 0))(
  ( (array!19017 (arr!9010 (Array (_ BitVec 32) ValueCell!3515)) (size!9362 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19016)

(declare-fun mapDefault!13056 () ValueCell!3515)

(assert (=> b!352301 (= condMapEmpty!13056 (= (arr!9010 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3515)) mapDefault!13056)))))

(declare-fun b!352302 () Bool)

(assert (=> b!352302 (= e!215736 (not ((_ is Undefined!3421) lt!165210)))))

(declare-fun b!352303 () Bool)

(declare-fun res!195389 () Bool)

(assert (=> b!352303 (=> (not res!195389) (not e!215735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352303 (= res!195389 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!13056 () Bool)

(declare-fun tp!26882 () Bool)

(assert (=> mapNonEmpty!13056 (= mapRes!13056 (and tp!26882 e!215738))))

(declare-fun mapKey!13056 () (_ BitVec 32))

(declare-fun mapValue!13056 () ValueCell!3515)

(declare-fun mapRest!13056 () (Array (_ BitVec 32) ValueCell!3515))

(assert (=> mapNonEmpty!13056 (= (arr!9010 _values!1525) (store mapRest!13056 mapKey!13056 mapValue!13056))))

(declare-fun b!352304 () Bool)

(declare-fun res!195395 () Bool)

(assert (=> b!352304 (=> (not res!195395) (not e!215735))))

(declare-datatypes ((List!5151 0))(
  ( (Nil!5148) (Cons!5147 (h!6003 (_ BitVec 64)) (t!10287 List!5151)) )
))
(declare-fun arrayNoDuplicates!0 (array!19014 (_ BitVec 32) List!5151) Bool)

(assert (=> b!352304 (= res!195395 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5148))))

(declare-fun b!352305 () Bool)

(declare-fun Unit!10880 () Unit!10878)

(assert (=> b!352305 (= e!215729 Unit!10880)))

(declare-fun zeroValue!1467 () V!11267)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!165208 () Unit!10878)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11267)

(declare-fun lemmaArrayContainsKeyThenInListMap!345 (array!19014 array!19016 (_ BitVec 32) (_ BitVec 32) V!11267 V!11267 (_ BitVec 64) (_ BitVec 32) Int) Unit!10878)

(declare-fun arrayScanForKey!0 (array!19014 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!352305 (= lt!165208 (lemmaArrayContainsKeyThenInListMap!345 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!352305 false))

(declare-fun b!352306 () Bool)

(assert (=> b!352306 (= e!215730 (not (= (select (arr!9009 _keys!1895) (index!15866 lt!165210)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!352307 () Bool)

(declare-fun res!195394 () Bool)

(assert (=> b!352307 (=> (not res!195394) (not e!215735))))

(declare-datatypes ((tuple2!5546 0))(
  ( (tuple2!5547 (_1!2784 (_ BitVec 64)) (_2!2784 V!11267)) )
))
(declare-datatypes ((List!5152 0))(
  ( (Nil!5149) (Cons!5148 (h!6004 tuple2!5546) (t!10288 List!5152)) )
))
(declare-datatypes ((ListLongMap!4461 0))(
  ( (ListLongMap!4462 (toList!2246 List!5152)) )
))
(declare-fun contains!2337 (ListLongMap!4461 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1774 (array!19014 array!19016 (_ BitVec 32) (_ BitVec 32) V!11267 V!11267 (_ BitVec 32) Int) ListLongMap!4461)

(assert (=> b!352307 (= res!195394 (not (contains!2337 (getCurrentListMap!1774 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352308 () Bool)

(assert (=> b!352308 (= e!215732 tp_is_empty!7717)))

(declare-fun b!352309 () Bool)

(declare-fun res!195393 () Bool)

(assert (=> b!352309 (=> (not res!195393) (not e!215735))))

(assert (=> b!352309 (= res!195393 (and (= (size!9362 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9361 _keys!1895) (size!9362 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!195388 () Bool)

(assert (=> start!35132 (=> (not res!195388) (not e!215735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35132 (= res!195388 (validMask!0 mask!2385))))

(assert (=> start!35132 e!215735))

(assert (=> start!35132 true))

(assert (=> start!35132 tp_is_empty!7717))

(assert (=> start!35132 tp!26883))

(declare-fun array_inv!6656 (array!19016) Bool)

(assert (=> start!35132 (and (array_inv!6656 _values!1525) e!215734)))

(declare-fun array_inv!6657 (array!19014) Bool)

(assert (=> start!35132 (array_inv!6657 _keys!1895)))

(declare-fun b!352310 () Bool)

(declare-fun res!195390 () Bool)

(assert (=> b!352310 (=> (not res!195390) (not e!215735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19014 (_ BitVec 32)) Bool)

(assert (=> b!352310 (= res!195390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352311 () Bool)

(declare-fun Unit!10881 () Unit!10878)

(assert (=> b!352311 (= e!215729 Unit!10881)))

(assert (= (and start!35132 res!195388) b!352309))

(assert (= (and b!352309 res!195393) b!352310))

(assert (= (and b!352310 res!195390) b!352304))

(assert (= (and b!352304 res!195395) b!352303))

(assert (= (and b!352303 res!195389) b!352307))

(assert (= (and b!352307 res!195394) b!352298))

(assert (= (and b!352298 res!195391) b!352296))

(assert (= (and b!352296 c!53543) b!352305))

(assert (= (and b!352296 (not c!53543)) b!352311))

(assert (= (and b!352296 res!195392) b!352300))

(assert (= (and b!352300 c!53542) b!352299))

(assert (= (and b!352300 (not c!53542)) b!352302))

(assert (= (and b!352299 (not res!195387)) b!352306))

(assert (= (and b!352301 condMapEmpty!13056) mapIsEmpty!13056))

(assert (= (and b!352301 (not condMapEmpty!13056)) mapNonEmpty!13056))

(assert (= (and mapNonEmpty!13056 ((_ is ValueCellFull!3515) mapValue!13056)) b!352297))

(assert (= (and b!352301 ((_ is ValueCellFull!3515) mapDefault!13056)) b!352308))

(assert (= start!35132 b!352301))

(declare-fun m!352239 () Bool)

(assert (=> mapNonEmpty!13056 m!352239))

(declare-fun m!352241 () Bool)

(assert (=> b!352298 m!352241))

(declare-fun m!352243 () Bool)

(assert (=> b!352304 m!352243))

(declare-fun m!352245 () Bool)

(assert (=> b!352307 m!352245))

(assert (=> b!352307 m!352245))

(declare-fun m!352247 () Bool)

(assert (=> b!352307 m!352247))

(declare-fun m!352249 () Bool)

(assert (=> b!352303 m!352249))

(declare-fun m!352251 () Bool)

(assert (=> b!352306 m!352251))

(declare-fun m!352253 () Bool)

(assert (=> start!35132 m!352253))

(declare-fun m!352255 () Bool)

(assert (=> start!35132 m!352255))

(declare-fun m!352257 () Bool)

(assert (=> start!35132 m!352257))

(declare-fun m!352259 () Bool)

(assert (=> b!352310 m!352259))

(declare-fun m!352261 () Bool)

(assert (=> b!352296 m!352261))

(declare-fun m!352263 () Bool)

(assert (=> b!352305 m!352263))

(assert (=> b!352305 m!352263))

(declare-fun m!352265 () Bool)

(assert (=> b!352305 m!352265))

(declare-fun m!352267 () Bool)

(assert (=> b!352299 m!352267))

(check-sat (not mapNonEmpty!13056) tp_is_empty!7717 (not b!352305) (not b!352299) (not b!352298) (not b!352303) (not b!352310) (not b!352296) (not b_next!7765) (not start!35132) b_and!15015 (not b!352304) (not b!352307))
(check-sat b_and!15015 (not b_next!7765))
(get-model)

(declare-fun b!352418 () Bool)

(declare-fun e!215810 () Bool)

(declare-fun e!215807 () Bool)

(assert (=> b!352418 (= e!215810 e!215807)))

(declare-fun res!195457 () Bool)

(assert (=> b!352418 (=> (not res!195457) (not e!215807))))

(declare-fun e!215808 () Bool)

(assert (=> b!352418 (= res!195457 (not e!215808))))

(declare-fun res!195458 () Bool)

(assert (=> b!352418 (=> (not res!195458) (not e!215808))))

(assert (=> b!352418 (= res!195458 (validKeyInArray!0 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352419 () Bool)

(declare-fun e!215809 () Bool)

(declare-fun call!27050 () Bool)

(assert (=> b!352419 (= e!215809 call!27050)))

(declare-fun bm!27047 () Bool)

(declare-fun c!53558 () Bool)

(assert (=> bm!27047 (= call!27050 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53558 (Cons!5147 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000) Nil!5148) Nil!5148)))))

(declare-fun b!352420 () Bool)

(assert (=> b!352420 (= e!215809 call!27050)))

(declare-fun d!71561 () Bool)

(declare-fun res!195456 () Bool)

(assert (=> d!71561 (=> res!195456 e!215810)))

(assert (=> d!71561 (= res!195456 (bvsge #b00000000000000000000000000000000 (size!9361 _keys!1895)))))

(assert (=> d!71561 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5148) e!215810)))

(declare-fun b!352421 () Bool)

(declare-fun contains!2338 (List!5151 (_ BitVec 64)) Bool)

(assert (=> b!352421 (= e!215808 (contains!2338 Nil!5148 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352422 () Bool)

(assert (=> b!352422 (= e!215807 e!215809)))

(assert (=> b!352422 (= c!53558 (validKeyInArray!0 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71561 (not res!195456)) b!352418))

(assert (= (and b!352418 res!195458) b!352421))

(assert (= (and b!352418 res!195457) b!352422))

(assert (= (and b!352422 c!53558) b!352419))

(assert (= (and b!352422 (not c!53558)) b!352420))

(assert (= (or b!352419 b!352420) bm!27047))

(declare-fun m!352329 () Bool)

(assert (=> b!352418 m!352329))

(assert (=> b!352418 m!352329))

(declare-fun m!352331 () Bool)

(assert (=> b!352418 m!352331))

(assert (=> bm!27047 m!352329))

(declare-fun m!352333 () Bool)

(assert (=> bm!27047 m!352333))

(assert (=> b!352421 m!352329))

(assert (=> b!352421 m!352329))

(declare-fun m!352335 () Bool)

(assert (=> b!352421 m!352335))

(assert (=> b!352422 m!352329))

(assert (=> b!352422 m!352329))

(assert (=> b!352422 m!352331))

(assert (=> b!352304 d!71561))

(declare-fun d!71563 () Bool)

(declare-fun res!195463 () Bool)

(declare-fun e!215815 () Bool)

(assert (=> d!71563 (=> res!195463 e!215815)))

(assert (=> d!71563 (= res!195463 (= (select (arr!9009 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71563 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215815)))

(declare-fun b!352427 () Bool)

(declare-fun e!215816 () Bool)

(assert (=> b!352427 (= e!215815 e!215816)))

(declare-fun res!195464 () Bool)

(assert (=> b!352427 (=> (not res!195464) (not e!215816))))

(assert (=> b!352427 (= res!195464 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9361 _keys!1895)))))

(declare-fun b!352428 () Bool)

(assert (=> b!352428 (= e!215816 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71563 (not res!195463)) b!352427))

(assert (= (and b!352427 res!195464) b!352428))

(assert (=> d!71563 m!352329))

(declare-fun m!352337 () Bool)

(assert (=> b!352428 m!352337))

(assert (=> b!352296 d!71563))

(declare-fun d!71565 () Bool)

(declare-fun res!195469 () Bool)

(declare-fun e!215825 () Bool)

(assert (=> d!71565 (=> res!195469 e!215825)))

(assert (=> d!71565 (= res!195469 (bvsge #b00000000000000000000000000000000 (size!9361 _keys!1895)))))

(assert (=> d!71565 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215825)))

(declare-fun b!352437 () Bool)

(declare-fun e!215823 () Bool)

(declare-fun call!27053 () Bool)

(assert (=> b!352437 (= e!215823 call!27053)))

(declare-fun b!352438 () Bool)

(assert (=> b!352438 (= e!215825 e!215823)))

(declare-fun c!53561 () Bool)

(assert (=> b!352438 (= c!53561 (validKeyInArray!0 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27050 () Bool)

(assert (=> bm!27050 (= call!27053 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!352439 () Bool)

(declare-fun e!215824 () Bool)

(assert (=> b!352439 (= e!215824 call!27053)))

(declare-fun b!352440 () Bool)

(assert (=> b!352440 (= e!215823 e!215824)))

(declare-fun lt!165242 () (_ BitVec 64))

(assert (=> b!352440 (= lt!165242 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165243 () Unit!10878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19014 (_ BitVec 64) (_ BitVec 32)) Unit!10878)

(assert (=> b!352440 (= lt!165243 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!165242 #b00000000000000000000000000000000))))

(assert (=> b!352440 (arrayContainsKey!0 _keys!1895 lt!165242 #b00000000000000000000000000000000)))

(declare-fun lt!165244 () Unit!10878)

(assert (=> b!352440 (= lt!165244 lt!165243)))

(declare-fun res!195470 () Bool)

(assert (=> b!352440 (= res!195470 (= (seekEntryOrOpen!0 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3421 #b00000000000000000000000000000000)))))

(assert (=> b!352440 (=> (not res!195470) (not e!215824))))

(assert (= (and d!71565 (not res!195469)) b!352438))

(assert (= (and b!352438 c!53561) b!352440))

(assert (= (and b!352438 (not c!53561)) b!352437))

(assert (= (and b!352440 res!195470) b!352439))

(assert (= (or b!352439 b!352437) bm!27050))

(assert (=> b!352438 m!352329))

(assert (=> b!352438 m!352329))

(assert (=> b!352438 m!352331))

(declare-fun m!352339 () Bool)

(assert (=> bm!27050 m!352339))

(assert (=> b!352440 m!352329))

(declare-fun m!352341 () Bool)

(assert (=> b!352440 m!352341))

(declare-fun m!352343 () Bool)

(assert (=> b!352440 m!352343))

(assert (=> b!352440 m!352329))

(declare-fun m!352345 () Bool)

(assert (=> b!352440 m!352345))

(assert (=> b!352310 d!71565))

(declare-fun d!71567 () Bool)

(assert (=> d!71567 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35132 d!71567))

(declare-fun d!71569 () Bool)

(assert (=> d!71569 (= (array_inv!6656 _values!1525) (bvsge (size!9362 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35132 d!71569))

(declare-fun d!71571 () Bool)

(assert (=> d!71571 (= (array_inv!6657 _keys!1895) (bvsge (size!9361 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35132 d!71571))

(declare-fun d!71573 () Bool)

(assert (=> d!71573 (contains!2337 (getCurrentListMap!1774 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!165247 () Unit!10878)

(declare-fun choose!1316 (array!19014 array!19016 (_ BitVec 32) (_ BitVec 32) V!11267 V!11267 (_ BitVec 64) (_ BitVec 32) Int) Unit!10878)

(assert (=> d!71573 (= lt!165247 (choose!1316 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71573 (validMask!0 mask!2385)))

(assert (=> d!71573 (= (lemmaArrayContainsKeyThenInListMap!345 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!165247)))

(declare-fun bs!12006 () Bool)

(assert (= bs!12006 d!71573))

(assert (=> bs!12006 m!352245))

(assert (=> bs!12006 m!352245))

(assert (=> bs!12006 m!352247))

(assert (=> bs!12006 m!352263))

(declare-fun m!352347 () Bool)

(assert (=> bs!12006 m!352347))

(assert (=> bs!12006 m!352253))

(assert (=> b!352305 d!71573))

(declare-fun d!71575 () Bool)

(declare-fun lt!165250 () (_ BitVec 32))

(assert (=> d!71575 (and (or (bvslt lt!165250 #b00000000000000000000000000000000) (bvsge lt!165250 (size!9361 _keys!1895)) (and (bvsge lt!165250 #b00000000000000000000000000000000) (bvslt lt!165250 (size!9361 _keys!1895)))) (bvsge lt!165250 #b00000000000000000000000000000000) (bvslt lt!165250 (size!9361 _keys!1895)) (= (select (arr!9009 _keys!1895) lt!165250) k0!1348))))

(declare-fun e!215828 () (_ BitVec 32))

(assert (=> d!71575 (= lt!165250 e!215828)))

(declare-fun c!53564 () Bool)

(assert (=> d!71575 (= c!53564 (= (select (arr!9009 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71575 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9361 _keys!1895)) (bvslt (size!9361 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71575 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!165250)))

(declare-fun b!352445 () Bool)

(assert (=> b!352445 (= e!215828 #b00000000000000000000000000000000)))

(declare-fun b!352446 () Bool)

(assert (=> b!352446 (= e!215828 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71575 c!53564) b!352445))

(assert (= (and d!71575 (not c!53564)) b!352446))

(declare-fun m!352349 () Bool)

(assert (=> d!71575 m!352349))

(assert (=> d!71575 m!352329))

(declare-fun m!352351 () Bool)

(assert (=> b!352446 m!352351))

(assert (=> b!352305 d!71575))

(declare-fun d!71577 () Bool)

(assert (=> d!71577 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352303 d!71577))

(declare-fun d!71579 () Bool)

(declare-fun e!215834 () Bool)

(assert (=> d!71579 e!215834))

(declare-fun res!195473 () Bool)

(assert (=> d!71579 (=> res!195473 e!215834)))

(declare-fun lt!165259 () Bool)

(assert (=> d!71579 (= res!195473 (not lt!165259))))

(declare-fun lt!165260 () Bool)

(assert (=> d!71579 (= lt!165259 lt!165260)))

(declare-fun lt!165261 () Unit!10878)

(declare-fun e!215833 () Unit!10878)

(assert (=> d!71579 (= lt!165261 e!215833)))

(declare-fun c!53567 () Bool)

(assert (=> d!71579 (= c!53567 lt!165260)))

(declare-fun containsKey!344 (List!5152 (_ BitVec 64)) Bool)

(assert (=> d!71579 (= lt!165260 (containsKey!344 (toList!2246 (getCurrentListMap!1774 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71579 (= (contains!2337 (getCurrentListMap!1774 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!165259)))

(declare-fun b!352453 () Bool)

(declare-fun lt!165262 () Unit!10878)

(assert (=> b!352453 (= e!215833 lt!165262)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!292 (List!5152 (_ BitVec 64)) Unit!10878)

(assert (=> b!352453 (= lt!165262 (lemmaContainsKeyImpliesGetValueByKeyDefined!292 (toList!2246 (getCurrentListMap!1774 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!359 0))(
  ( (Some!358 (v!6097 V!11267)) (None!357) )
))
(declare-fun isDefined!293 (Option!359) Bool)

(declare-fun getValueByKey!353 (List!5152 (_ BitVec 64)) Option!359)

(assert (=> b!352453 (isDefined!293 (getValueByKey!353 (toList!2246 (getCurrentListMap!1774 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!352454 () Bool)

(declare-fun Unit!10885 () Unit!10878)

(assert (=> b!352454 (= e!215833 Unit!10885)))

(declare-fun b!352455 () Bool)

(assert (=> b!352455 (= e!215834 (isDefined!293 (getValueByKey!353 (toList!2246 (getCurrentListMap!1774 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71579 c!53567) b!352453))

(assert (= (and d!71579 (not c!53567)) b!352454))

(assert (= (and d!71579 (not res!195473)) b!352455))

(declare-fun m!352353 () Bool)

(assert (=> d!71579 m!352353))

(declare-fun m!352355 () Bool)

(assert (=> b!352453 m!352355))

(declare-fun m!352357 () Bool)

(assert (=> b!352453 m!352357))

(assert (=> b!352453 m!352357))

(declare-fun m!352359 () Bool)

(assert (=> b!352453 m!352359))

(assert (=> b!352455 m!352357))

(assert (=> b!352455 m!352357))

(assert (=> b!352455 m!352359))

(assert (=> b!352307 d!71579))

(declare-fun b!352498 () Bool)

(declare-fun e!215870 () ListLongMap!4461)

(declare-fun call!27073 () ListLongMap!4461)

(declare-fun +!745 (ListLongMap!4461 tuple2!5546) ListLongMap!4461)

(assert (=> b!352498 (= e!215870 (+!745 call!27073 (tuple2!5547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!352499 () Bool)

(declare-fun e!215864 () ListLongMap!4461)

(declare-fun call!27070 () ListLongMap!4461)

(assert (=> b!352499 (= e!215864 call!27070)))

(declare-fun b!352500 () Bool)

(declare-fun res!195494 () Bool)

(declare-fun e!215869 () Bool)

(assert (=> b!352500 (=> (not res!195494) (not e!215869))))

(declare-fun e!215868 () Bool)

(assert (=> b!352500 (= res!195494 e!215868)))

(declare-fun res!195495 () Bool)

(assert (=> b!352500 (=> res!195495 e!215868)))

(declare-fun e!215867 () Bool)

(assert (=> b!352500 (= res!195495 (not e!215867))))

(declare-fun res!195493 () Bool)

(assert (=> b!352500 (=> (not res!195493) (not e!215867))))

(assert (=> b!352500 (= res!195493 (bvslt #b00000000000000000000000000000000 (size!9361 _keys!1895)))))

(declare-fun bm!27065 () Bool)

(declare-fun call!27072 () ListLongMap!4461)

(declare-fun call!27068 () ListLongMap!4461)

(assert (=> bm!27065 (= call!27072 call!27068)))

(declare-fun b!352501 () Bool)

(declare-fun e!215863 () Unit!10878)

(declare-fun Unit!10886 () Unit!10878)

(assert (=> b!352501 (= e!215863 Unit!10886)))

(declare-fun b!352502 () Bool)

(declare-fun e!215865 () Bool)

(assert (=> b!352502 (= e!215865 (validKeyInArray!0 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352503 () Bool)

(declare-fun e!215866 () Bool)

(declare-fun lt!165314 () ListLongMap!4461)

(declare-fun apply!294 (ListLongMap!4461 (_ BitVec 64)) V!11267)

(assert (=> b!352503 (= e!215866 (= (apply!294 lt!165314 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!27066 () Bool)

(declare-fun call!27069 () Bool)

(assert (=> bm!27066 (= call!27069 (contains!2337 lt!165314 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27067 () Bool)

(assert (=> bm!27067 (= call!27070 call!27072)))

(declare-fun b!352504 () Bool)

(declare-fun e!215862 () ListLongMap!4461)

(declare-fun call!27074 () ListLongMap!4461)

(assert (=> b!352504 (= e!215862 call!27074)))

(declare-fun bm!27068 () Bool)

(assert (=> bm!27068 (= call!27074 call!27073)))

(declare-fun bm!27069 () Bool)

(declare-fun call!27071 () Bool)

(assert (=> bm!27069 (= call!27071 (contains!2337 lt!165314 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!352505 () Bool)

(declare-fun e!215872 () Bool)

(assert (=> b!352505 (= e!215868 e!215872)))

(declare-fun res!195499 () Bool)

(assert (=> b!352505 (=> (not res!195499) (not e!215872))))

(assert (=> b!352505 (= res!195499 (contains!2337 lt!165314 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!352505 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9361 _keys!1895)))))

(declare-fun b!352506 () Bool)

(declare-fun e!215873 () Bool)

(declare-fun e!215871 () Bool)

(assert (=> b!352506 (= e!215873 e!215871)))

(declare-fun res!195496 () Bool)

(assert (=> b!352506 (= res!195496 call!27069)))

(assert (=> b!352506 (=> (not res!195496) (not e!215871))))

(declare-fun b!352507 () Bool)

(assert (=> b!352507 (= e!215870 e!215862)))

(declare-fun c!53585 () Bool)

(assert (=> b!352507 (= c!53585 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!352508 () Bool)

(assert (=> b!352508 (= e!215869 e!215873)))

(declare-fun c!53584 () Bool)

(assert (=> b!352508 (= c!53584 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27070 () Bool)

(declare-fun c!53581 () Bool)

(assert (=> bm!27070 (= call!27073 (+!745 (ite c!53581 call!27068 (ite c!53585 call!27072 call!27070)) (ite (or c!53581 c!53585) (tuple2!5547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!352509 () Bool)

(declare-fun lt!165324 () Unit!10878)

(assert (=> b!352509 (= e!215863 lt!165324)))

(declare-fun lt!165323 () ListLongMap!4461)

(declare-fun getCurrentListMapNoExtraKeys!610 (array!19014 array!19016 (_ BitVec 32) (_ BitVec 32) V!11267 V!11267 (_ BitVec 32) Int) ListLongMap!4461)

(assert (=> b!352509 (= lt!165323 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165322 () (_ BitVec 64))

(assert (=> b!352509 (= lt!165322 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165308 () (_ BitVec 64))

(assert (=> b!352509 (= lt!165308 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165317 () Unit!10878)

(declare-fun addStillContains!270 (ListLongMap!4461 (_ BitVec 64) V!11267 (_ BitVec 64)) Unit!10878)

(assert (=> b!352509 (= lt!165317 (addStillContains!270 lt!165323 lt!165322 zeroValue!1467 lt!165308))))

(assert (=> b!352509 (contains!2337 (+!745 lt!165323 (tuple2!5547 lt!165322 zeroValue!1467)) lt!165308)))

(declare-fun lt!165312 () Unit!10878)

(assert (=> b!352509 (= lt!165312 lt!165317)))

(declare-fun lt!165316 () ListLongMap!4461)

(assert (=> b!352509 (= lt!165316 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165307 () (_ BitVec 64))

(assert (=> b!352509 (= lt!165307 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165320 () (_ BitVec 64))

(assert (=> b!352509 (= lt!165320 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165309 () Unit!10878)

(declare-fun addApplyDifferent!270 (ListLongMap!4461 (_ BitVec 64) V!11267 (_ BitVec 64)) Unit!10878)

(assert (=> b!352509 (= lt!165309 (addApplyDifferent!270 lt!165316 lt!165307 minValue!1467 lt!165320))))

(assert (=> b!352509 (= (apply!294 (+!745 lt!165316 (tuple2!5547 lt!165307 minValue!1467)) lt!165320) (apply!294 lt!165316 lt!165320))))

(declare-fun lt!165328 () Unit!10878)

(assert (=> b!352509 (= lt!165328 lt!165309)))

(declare-fun lt!165310 () ListLongMap!4461)

(assert (=> b!352509 (= lt!165310 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165311 () (_ BitVec 64))

(assert (=> b!352509 (= lt!165311 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165313 () (_ BitVec 64))

(assert (=> b!352509 (= lt!165313 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165321 () Unit!10878)

(assert (=> b!352509 (= lt!165321 (addApplyDifferent!270 lt!165310 lt!165311 zeroValue!1467 lt!165313))))

(assert (=> b!352509 (= (apply!294 (+!745 lt!165310 (tuple2!5547 lt!165311 zeroValue!1467)) lt!165313) (apply!294 lt!165310 lt!165313))))

(declare-fun lt!165327 () Unit!10878)

(assert (=> b!352509 (= lt!165327 lt!165321)))

(declare-fun lt!165319 () ListLongMap!4461)

(assert (=> b!352509 (= lt!165319 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165326 () (_ BitVec 64))

(assert (=> b!352509 (= lt!165326 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165325 () (_ BitVec 64))

(assert (=> b!352509 (= lt!165325 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!352509 (= lt!165324 (addApplyDifferent!270 lt!165319 lt!165326 minValue!1467 lt!165325))))

(assert (=> b!352509 (= (apply!294 (+!745 lt!165319 (tuple2!5547 lt!165326 minValue!1467)) lt!165325) (apply!294 lt!165319 lt!165325))))

(declare-fun b!352510 () Bool)

(assert (=> b!352510 (= e!215864 call!27074)))

(declare-fun b!352511 () Bool)

(declare-fun e!215861 () Bool)

(assert (=> b!352511 (= e!215861 (not call!27071))))

(declare-fun b!352512 () Bool)

(assert (=> b!352512 (= e!215871 (= (apply!294 lt!165314 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!352513 () Bool)

(declare-fun get!4818 (ValueCell!3515 V!11267) V!11267)

(declare-fun dynLambda!637 (Int (_ BitVec 64)) V!11267)

(assert (=> b!352513 (= e!215872 (= (apply!294 lt!165314 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000)) (get!4818 (select (arr!9010 _values!1525) #b00000000000000000000000000000000) (dynLambda!637 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9362 _values!1525)))))

(assert (=> b!352513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9361 _keys!1895)))))

(declare-fun b!352514 () Bool)

(assert (=> b!352514 (= e!215861 e!215866)))

(declare-fun res!195497 () Bool)

(assert (=> b!352514 (= res!195497 call!27071)))

(assert (=> b!352514 (=> (not res!195497) (not e!215866))))

(declare-fun b!352515 () Bool)

(assert (=> b!352515 (= e!215873 (not call!27069))))

(declare-fun bm!27071 () Bool)

(assert (=> bm!27071 (= call!27068 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!352516 () Bool)

(assert (=> b!352516 (= e!215867 (validKeyInArray!0 (select (arr!9009 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71581 () Bool)

(assert (=> d!71581 e!215869))

(declare-fun res!195498 () Bool)

(assert (=> d!71581 (=> (not res!195498) (not e!215869))))

(assert (=> d!71581 (= res!195498 (or (bvsge #b00000000000000000000000000000000 (size!9361 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9361 _keys!1895)))))))

(declare-fun lt!165315 () ListLongMap!4461)

(assert (=> d!71581 (= lt!165314 lt!165315)))

(declare-fun lt!165318 () Unit!10878)

(assert (=> d!71581 (= lt!165318 e!215863)))

(declare-fun c!53582 () Bool)

(assert (=> d!71581 (= c!53582 e!215865)))

(declare-fun res!195500 () Bool)

(assert (=> d!71581 (=> (not res!195500) (not e!215865))))

(assert (=> d!71581 (= res!195500 (bvslt #b00000000000000000000000000000000 (size!9361 _keys!1895)))))

(assert (=> d!71581 (= lt!165315 e!215870)))

(assert (=> d!71581 (= c!53581 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71581 (validMask!0 mask!2385)))

(assert (=> d!71581 (= (getCurrentListMap!1774 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!165314)))

(declare-fun b!352517 () Bool)

(declare-fun c!53580 () Bool)

(assert (=> b!352517 (= c!53580 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!352517 (= e!215862 e!215864)))

(declare-fun b!352518 () Bool)

(declare-fun res!195492 () Bool)

(assert (=> b!352518 (=> (not res!195492) (not e!215869))))

(assert (=> b!352518 (= res!195492 e!215861)))

(declare-fun c!53583 () Bool)

(assert (=> b!352518 (= c!53583 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!71581 c!53581) b!352498))

(assert (= (and d!71581 (not c!53581)) b!352507))

(assert (= (and b!352507 c!53585) b!352504))

(assert (= (and b!352507 (not c!53585)) b!352517))

(assert (= (and b!352517 c!53580) b!352510))

(assert (= (and b!352517 (not c!53580)) b!352499))

(assert (= (or b!352510 b!352499) bm!27067))

(assert (= (or b!352504 bm!27067) bm!27065))

(assert (= (or b!352504 b!352510) bm!27068))

(assert (= (or b!352498 bm!27065) bm!27071))

(assert (= (or b!352498 bm!27068) bm!27070))

(assert (= (and d!71581 res!195500) b!352502))

(assert (= (and d!71581 c!53582) b!352509))

(assert (= (and d!71581 (not c!53582)) b!352501))

(assert (= (and d!71581 res!195498) b!352500))

(assert (= (and b!352500 res!195493) b!352516))

(assert (= (and b!352500 (not res!195495)) b!352505))

(assert (= (and b!352505 res!195499) b!352513))

(assert (= (and b!352500 res!195494) b!352518))

(assert (= (and b!352518 c!53583) b!352514))

(assert (= (and b!352518 (not c!53583)) b!352511))

(assert (= (and b!352514 res!195497) b!352503))

(assert (= (or b!352514 b!352511) bm!27069))

(assert (= (and b!352518 res!195492) b!352508))

(assert (= (and b!352508 c!53584) b!352506))

(assert (= (and b!352508 (not c!53584)) b!352515))

(assert (= (and b!352506 res!195496) b!352512))

(assert (= (or b!352506 b!352515) bm!27066))

(declare-fun b_lambda!8537 () Bool)

(assert (=> (not b_lambda!8537) (not b!352513)))

(declare-fun t!10290 () Bool)

(declare-fun tb!3095 () Bool)

(assert (=> (and start!35132 (= defaultEntry!1528 defaultEntry!1528) t!10290) tb!3095))

(declare-fun result!5631 () Bool)

(assert (=> tb!3095 (= result!5631 tp_is_empty!7717)))

(assert (=> b!352513 t!10290))

(declare-fun b_and!15021 () Bool)

(assert (= b_and!15015 (and (=> t!10290 result!5631) b_and!15021)))

(declare-fun m!352361 () Bool)

(assert (=> b!352498 m!352361))

(declare-fun m!352363 () Bool)

(assert (=> b!352512 m!352363))

(declare-fun m!352365 () Bool)

(assert (=> bm!27069 m!352365))

(declare-fun m!352367 () Bool)

(assert (=> b!352509 m!352367))

(declare-fun m!352369 () Bool)

(assert (=> b!352509 m!352369))

(declare-fun m!352371 () Bool)

(assert (=> b!352509 m!352371))

(declare-fun m!352373 () Bool)

(assert (=> b!352509 m!352373))

(assert (=> b!352509 m!352329))

(assert (=> b!352509 m!352369))

(declare-fun m!352375 () Bool)

(assert (=> b!352509 m!352375))

(declare-fun m!352377 () Bool)

(assert (=> b!352509 m!352377))

(declare-fun m!352379 () Bool)

(assert (=> b!352509 m!352379))

(declare-fun m!352381 () Bool)

(assert (=> b!352509 m!352381))

(declare-fun m!352383 () Bool)

(assert (=> b!352509 m!352383))

(declare-fun m!352385 () Bool)

(assert (=> b!352509 m!352385))

(declare-fun m!352387 () Bool)

(assert (=> b!352509 m!352387))

(declare-fun m!352389 () Bool)

(assert (=> b!352509 m!352389))

(assert (=> b!352509 m!352385))

(declare-fun m!352391 () Bool)

(assert (=> b!352509 m!352391))

(declare-fun m!352393 () Bool)

(assert (=> b!352509 m!352393))

(declare-fun m!352395 () Bool)

(assert (=> b!352509 m!352395))

(assert (=> b!352509 m!352381))

(assert (=> b!352509 m!352379))

(declare-fun m!352397 () Bool)

(assert (=> b!352509 m!352397))

(declare-fun m!352399 () Bool)

(assert (=> b!352513 m!352399))

(declare-fun m!352401 () Bool)

(assert (=> b!352513 m!352401))

(assert (=> b!352513 m!352329))

(assert (=> b!352513 m!352399))

(assert (=> b!352513 m!352401))

(declare-fun m!352403 () Bool)

(assert (=> b!352513 m!352403))

(assert (=> b!352513 m!352329))

(declare-fun m!352405 () Bool)

(assert (=> b!352513 m!352405))

(assert (=> d!71581 m!352253))

(declare-fun m!352407 () Bool)

(assert (=> bm!27066 m!352407))

(assert (=> b!352516 m!352329))

(assert (=> b!352516 m!352329))

(assert (=> b!352516 m!352331))

(declare-fun m!352409 () Bool)

(assert (=> bm!27070 m!352409))

(assert (=> bm!27071 m!352375))

(declare-fun m!352411 () Bool)

(assert (=> b!352503 m!352411))

(assert (=> b!352502 m!352329))

(assert (=> b!352502 m!352329))

(assert (=> b!352502 m!352331))

(assert (=> b!352505 m!352329))

(assert (=> b!352505 m!352329))

(declare-fun m!352413 () Bool)

(assert (=> b!352505 m!352413))

(assert (=> b!352307 d!71581))

(declare-fun b!352533 () Bool)

(declare-fun c!53592 () Bool)

(declare-fun lt!165337 () (_ BitVec 64))

(assert (=> b!352533 (= c!53592 (= lt!165337 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!215880 () SeekEntryResult!3421)

(declare-fun e!215881 () SeekEntryResult!3421)

(assert (=> b!352533 (= e!215880 e!215881)))

(declare-fun b!352534 () Bool)

(declare-fun lt!165335 () SeekEntryResult!3421)

(assert (=> b!352534 (= e!215881 (MissingZero!3421 (index!15865 lt!165335)))))

(declare-fun b!352535 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19014 (_ BitVec 32)) SeekEntryResult!3421)

(assert (=> b!352535 (= e!215881 (seekKeyOrZeroReturnVacant!0 (x!35008 lt!165335) (index!15865 lt!165335) (index!15865 lt!165335) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352536 () Bool)

(declare-fun e!215882 () SeekEntryResult!3421)

(assert (=> b!352536 (= e!215882 e!215880)))

(assert (=> b!352536 (= lt!165337 (select (arr!9009 _keys!1895) (index!15865 lt!165335)))))

(declare-fun c!53593 () Bool)

(assert (=> b!352536 (= c!53593 (= lt!165337 k0!1348))))

(declare-fun d!71583 () Bool)

(declare-fun lt!165336 () SeekEntryResult!3421)

(assert (=> d!71583 (and (or ((_ is Undefined!3421) lt!165336) (not ((_ is Found!3421) lt!165336)) (and (bvsge (index!15864 lt!165336) #b00000000000000000000000000000000) (bvslt (index!15864 lt!165336) (size!9361 _keys!1895)))) (or ((_ is Undefined!3421) lt!165336) ((_ is Found!3421) lt!165336) (not ((_ is MissingZero!3421) lt!165336)) (and (bvsge (index!15863 lt!165336) #b00000000000000000000000000000000) (bvslt (index!15863 lt!165336) (size!9361 _keys!1895)))) (or ((_ is Undefined!3421) lt!165336) ((_ is Found!3421) lt!165336) ((_ is MissingZero!3421) lt!165336) (not ((_ is MissingVacant!3421) lt!165336)) (and (bvsge (index!15866 lt!165336) #b00000000000000000000000000000000) (bvslt (index!15866 lt!165336) (size!9361 _keys!1895)))) (or ((_ is Undefined!3421) lt!165336) (ite ((_ is Found!3421) lt!165336) (= (select (arr!9009 _keys!1895) (index!15864 lt!165336)) k0!1348) (ite ((_ is MissingZero!3421) lt!165336) (= (select (arr!9009 _keys!1895) (index!15863 lt!165336)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3421) lt!165336) (= (select (arr!9009 _keys!1895) (index!15866 lt!165336)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71583 (= lt!165336 e!215882)))

(declare-fun c!53594 () Bool)

(assert (=> d!71583 (= c!53594 (and ((_ is Intermediate!3421) lt!165335) (undefined!4233 lt!165335)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19014 (_ BitVec 32)) SeekEntryResult!3421)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71583 (= lt!165335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71583 (validMask!0 mask!2385)))

(assert (=> d!71583 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!165336)))

(declare-fun b!352537 () Bool)

(assert (=> b!352537 (= e!215882 Undefined!3421)))

(declare-fun b!352538 () Bool)

(assert (=> b!352538 (= e!215880 (Found!3421 (index!15865 lt!165335)))))

(assert (= (and d!71583 c!53594) b!352537))

(assert (= (and d!71583 (not c!53594)) b!352536))

(assert (= (and b!352536 c!53593) b!352538))

(assert (= (and b!352536 (not c!53593)) b!352533))

(assert (= (and b!352533 c!53592) b!352534))

(assert (= (and b!352533 (not c!53592)) b!352535))

(declare-fun m!352415 () Bool)

(assert (=> b!352535 m!352415))

(declare-fun m!352417 () Bool)

(assert (=> b!352536 m!352417))

(declare-fun m!352419 () Bool)

(assert (=> d!71583 m!352419))

(assert (=> d!71583 m!352253))

(declare-fun m!352421 () Bool)

(assert (=> d!71583 m!352421))

(declare-fun m!352423 () Bool)

(assert (=> d!71583 m!352423))

(declare-fun m!352425 () Bool)

(assert (=> d!71583 m!352425))

(assert (=> d!71583 m!352425))

(declare-fun m!352427 () Bool)

(assert (=> d!71583 m!352427))

(assert (=> b!352298 d!71583))

(declare-fun d!71585 () Bool)

(assert (=> d!71585 (= (inRange!0 (index!15866 lt!165210) mask!2385) (and (bvsge (index!15866 lt!165210) #b00000000000000000000000000000000) (bvslt (index!15866 lt!165210) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!352299 d!71585))

(declare-fun b!352545 () Bool)

(declare-fun e!215888 () Bool)

(assert (=> b!352545 (= e!215888 tp_is_empty!7717)))

(declare-fun mapIsEmpty!13065 () Bool)

(declare-fun mapRes!13065 () Bool)

(assert (=> mapIsEmpty!13065 mapRes!13065))

(declare-fun condMapEmpty!13065 () Bool)

(declare-fun mapDefault!13065 () ValueCell!3515)

(assert (=> mapNonEmpty!13056 (= condMapEmpty!13065 (= mapRest!13056 ((as const (Array (_ BitVec 32) ValueCell!3515)) mapDefault!13065)))))

(declare-fun e!215887 () Bool)

(assert (=> mapNonEmpty!13056 (= tp!26882 (and e!215887 mapRes!13065))))

(declare-fun mapNonEmpty!13065 () Bool)

(declare-fun tp!26898 () Bool)

(assert (=> mapNonEmpty!13065 (= mapRes!13065 (and tp!26898 e!215888))))

(declare-fun mapRest!13065 () (Array (_ BitVec 32) ValueCell!3515))

(declare-fun mapValue!13065 () ValueCell!3515)

(declare-fun mapKey!13065 () (_ BitVec 32))

(assert (=> mapNonEmpty!13065 (= mapRest!13056 (store mapRest!13065 mapKey!13065 mapValue!13065))))

(declare-fun b!352546 () Bool)

(assert (=> b!352546 (= e!215887 tp_is_empty!7717)))

(assert (= (and mapNonEmpty!13056 condMapEmpty!13065) mapIsEmpty!13065))

(assert (= (and mapNonEmpty!13056 (not condMapEmpty!13065)) mapNonEmpty!13065))

(assert (= (and mapNonEmpty!13065 ((_ is ValueCellFull!3515) mapValue!13065)) b!352545))

(assert (= (and mapNonEmpty!13056 ((_ is ValueCellFull!3515) mapDefault!13065)) b!352546))

(declare-fun m!352429 () Bool)

(assert (=> mapNonEmpty!13065 m!352429))

(declare-fun b_lambda!8539 () Bool)

(assert (= b_lambda!8537 (or (and start!35132 b_free!7765) b_lambda!8539)))

(check-sat tp_is_empty!7717 (not bm!27071) (not b!352428) (not b!352422) (not b!352502) (not mapNonEmpty!13065) (not b!352503) (not b!352535) (not bm!27047) (not b!352505) (not b_next!7765) (not d!71581) (not bm!27066) (not d!71579) (not bm!27069) (not b!352509) (not b!352440) (not b!352438) b_and!15021 (not b!352512) (not bm!27050) (not b!352453) (not b!352513) (not b!352516) (not b!352455) (not b!352446) (not bm!27070) (not d!71573) (not b!352498) (not b!352421) (not b!352418) (not d!71583) (not b_lambda!8539))
(check-sat b_and!15021 (not b_next!7765))
