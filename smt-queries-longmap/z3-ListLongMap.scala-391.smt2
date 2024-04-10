; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7366 () Bool)

(assert start!7366)

(declare-fun b!47289 () Bool)

(declare-fun res!27512 () Bool)

(declare-fun e!30269 () Bool)

(assert (=> b!47289 (=> (not res!27512) (not e!30269))))

(declare-datatypes ((array!3113 0))(
  ( (array!3114 (arr!1493 (Array (_ BitVec 32) (_ BitVec 64))) (size!1715 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3113)

(assert (=> b!47289 (= res!27512 (and (bvsle #b00000000000000000000000000000000 (size!1715 _keys!1940)) (bvslt (size!1715 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun b!47290 () Bool)

(declare-fun res!27511 () Bool)

(assert (=> b!47290 (=> (not res!27511) (not e!30269))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3113 (_ BitVec 32)) Bool)

(assert (=> b!47290 (= res!27511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47291 () Bool)

(declare-fun e!30268 () Bool)

(declare-fun e!30267 () Bool)

(declare-fun mapRes!2075 () Bool)

(assert (=> b!47291 (= e!30268 (and e!30267 mapRes!2075))))

(declare-fun condMapEmpty!2075 () Bool)

(declare-datatypes ((V!2433 0))(
  ( (V!2434 (val!1051 Int)) )
))
(declare-datatypes ((ValueCell!723 0))(
  ( (ValueCellFull!723 (v!2111 V!2433)) (EmptyCell!723) )
))
(declare-datatypes ((array!3115 0))(
  ( (array!3116 (arr!1494 (Array (_ BitVec 32) ValueCell!723)) (size!1716 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3115)

(declare-fun mapDefault!2075 () ValueCell!723)

(assert (=> b!47291 (= condMapEmpty!2075 (= (arr!1494 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!723)) mapDefault!2075)))))

(declare-fun b!47292 () Bool)

(declare-fun e!30265 () Bool)

(declare-fun tp_is_empty!2025 () Bool)

(assert (=> b!47292 (= e!30265 tp_is_empty!2025)))

(declare-fun b!47293 () Bool)

(declare-datatypes ((List!1256 0))(
  ( (Nil!1253) (Cons!1252 (h!1832 (_ BitVec 64)) (t!4284 List!1256)) )
))
(declare-fun noDuplicate!37 (List!1256) Bool)

(assert (=> b!47293 (= e!30269 (not (noDuplicate!37 Nil!1253)))))

(declare-fun mapNonEmpty!2075 () Bool)

(declare-fun tp!6224 () Bool)

(assert (=> mapNonEmpty!2075 (= mapRes!2075 (and tp!6224 e!30265))))

(declare-fun mapValue!2075 () ValueCell!723)

(declare-fun mapRest!2075 () (Array (_ BitVec 32) ValueCell!723))

(declare-fun mapKey!2075 () (_ BitVec 32))

(assert (=> mapNonEmpty!2075 (= (arr!1494 _values!1550) (store mapRest!2075 mapKey!2075 mapValue!2075))))

(declare-fun b!47295 () Bool)

(declare-fun res!27510 () Bool)

(assert (=> b!47295 (=> (not res!27510) (not e!30269))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47295 (= res!27510 (and (= (size!1716 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1715 _keys!1940) (size!1716 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!2075 () Bool)

(assert (=> mapIsEmpty!2075 mapRes!2075))

(declare-fun b!47294 () Bool)

(assert (=> b!47294 (= e!30267 tp_is_empty!2025)))

(declare-fun res!27513 () Bool)

(assert (=> start!7366 (=> (not res!27513) (not e!30269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7366 (= res!27513 (validMask!0 mask!2458))))

(assert (=> start!7366 e!30269))

(assert (=> start!7366 true))

(declare-fun array_inv!898 (array!3115) Bool)

(assert (=> start!7366 (and (array_inv!898 _values!1550) e!30268)))

(declare-fun array_inv!899 (array!3113) Bool)

(assert (=> start!7366 (array_inv!899 _keys!1940)))

(assert (= (and start!7366 res!27513) b!47295))

(assert (= (and b!47295 res!27510) b!47290))

(assert (= (and b!47290 res!27511) b!47289))

(assert (= (and b!47289 res!27512) b!47293))

(assert (= (and b!47291 condMapEmpty!2075) mapIsEmpty!2075))

(assert (= (and b!47291 (not condMapEmpty!2075)) mapNonEmpty!2075))

(get-info :version)

(assert (= (and mapNonEmpty!2075 ((_ is ValueCellFull!723) mapValue!2075)) b!47292))

(assert (= (and b!47291 ((_ is ValueCellFull!723) mapDefault!2075)) b!47294))

(assert (= start!7366 b!47291))

(declare-fun m!41559 () Bool)

(assert (=> b!47290 m!41559))

(declare-fun m!41561 () Bool)

(assert (=> b!47293 m!41561))

(declare-fun m!41563 () Bool)

(assert (=> mapNonEmpty!2075 m!41563))

(declare-fun m!41565 () Bool)

(assert (=> start!7366 m!41565))

(declare-fun m!41567 () Bool)

(assert (=> start!7366 m!41567))

(declare-fun m!41569 () Bool)

(assert (=> start!7366 m!41569))

(check-sat (not b!47293) tp_is_empty!2025 (not mapNonEmpty!2075) (not b!47290) (not start!7366))
(check-sat)
(get-model)

(declare-fun d!9435 () Bool)

(assert (=> d!9435 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7366 d!9435))

(declare-fun d!9437 () Bool)

(assert (=> d!9437 (= (array_inv!898 _values!1550) (bvsge (size!1716 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7366 d!9437))

(declare-fun d!9439 () Bool)

(assert (=> d!9439 (= (array_inv!899 _keys!1940) (bvsge (size!1715 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7366 d!9439))

(declare-fun bm!3715 () Bool)

(declare-fun call!3718 () Bool)

(assert (=> bm!3715 (= call!3718 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(declare-fun d!9441 () Bool)

(declare-fun res!27530 () Bool)

(declare-fun e!30292 () Bool)

(assert (=> d!9441 (=> res!27530 e!30292)))

(assert (=> d!9441 (= res!27530 (bvsge #b00000000000000000000000000000000 (size!1715 _keys!1940)))))

(assert (=> d!9441 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30292)))

(declare-fun b!47325 () Bool)

(declare-fun e!30293 () Bool)

(declare-fun e!30291 () Bool)

(assert (=> b!47325 (= e!30293 e!30291)))

(declare-fun lt!20406 () (_ BitVec 64))

(assert (=> b!47325 (= lt!20406 (select (arr!1493 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1331 0))(
  ( (Unit!1332) )
))
(declare-fun lt!20407 () Unit!1331)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3113 (_ BitVec 64) (_ BitVec 32)) Unit!1331)

(assert (=> b!47325 (= lt!20407 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20406 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47325 (arrayContainsKey!0 _keys!1940 lt!20406 #b00000000000000000000000000000000)))

(declare-fun lt!20405 () Unit!1331)

(assert (=> b!47325 (= lt!20405 lt!20407)))

(declare-fun res!27531 () Bool)

(declare-datatypes ((SeekEntryResult!207 0))(
  ( (MissingZero!207 (index!2950 (_ BitVec 32))) (Found!207 (index!2951 (_ BitVec 32))) (Intermediate!207 (undefined!1019 Bool) (index!2952 (_ BitVec 32)) (x!8737 (_ BitVec 32))) (Undefined!207) (MissingVacant!207 (index!2953 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3113 (_ BitVec 32)) SeekEntryResult!207)

(assert (=> b!47325 (= res!27531 (= (seekEntryOrOpen!0 (select (arr!1493 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!207 #b00000000000000000000000000000000)))))

(assert (=> b!47325 (=> (not res!27531) (not e!30291))))

(declare-fun b!47326 () Bool)

(assert (=> b!47326 (= e!30293 call!3718)))

(declare-fun b!47327 () Bool)

(assert (=> b!47327 (= e!30291 call!3718)))

(declare-fun b!47328 () Bool)

(assert (=> b!47328 (= e!30292 e!30293)))

(declare-fun c!6405 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47328 (= c!6405 (validKeyInArray!0 (select (arr!1493 _keys!1940) #b00000000000000000000000000000000)))))

(assert (= (and d!9441 (not res!27530)) b!47328))

(assert (= (and b!47328 c!6405) b!47325))

(assert (= (and b!47328 (not c!6405)) b!47326))

(assert (= (and b!47325 res!27531) b!47327))

(assert (= (or b!47327 b!47326) bm!3715))

(declare-fun m!41583 () Bool)

(assert (=> bm!3715 m!41583))

(declare-fun m!41585 () Bool)

(assert (=> b!47325 m!41585))

(declare-fun m!41587 () Bool)

(assert (=> b!47325 m!41587))

(declare-fun m!41589 () Bool)

(assert (=> b!47325 m!41589))

(assert (=> b!47325 m!41585))

(declare-fun m!41591 () Bool)

(assert (=> b!47325 m!41591))

(assert (=> b!47328 m!41585))

(assert (=> b!47328 m!41585))

(declare-fun m!41593 () Bool)

(assert (=> b!47328 m!41593))

(assert (=> b!47290 d!9441))

(declare-fun d!9443 () Bool)

(declare-fun res!27536 () Bool)

(declare-fun e!30298 () Bool)

(assert (=> d!9443 (=> res!27536 e!30298)))

(assert (=> d!9443 (= res!27536 ((_ is Nil!1253) Nil!1253))))

(assert (=> d!9443 (= (noDuplicate!37 Nil!1253) e!30298)))

(declare-fun b!47333 () Bool)

(declare-fun e!30299 () Bool)

(assert (=> b!47333 (= e!30298 e!30299)))

(declare-fun res!27537 () Bool)

(assert (=> b!47333 (=> (not res!27537) (not e!30299))))

(declare-fun contains!583 (List!1256 (_ BitVec 64)) Bool)

(assert (=> b!47333 (= res!27537 (not (contains!583 (t!4284 Nil!1253) (h!1832 Nil!1253))))))

(declare-fun b!47334 () Bool)

(assert (=> b!47334 (= e!30299 (noDuplicate!37 (t!4284 Nil!1253)))))

(assert (= (and d!9443 (not res!27536)) b!47333))

(assert (= (and b!47333 res!27537) b!47334))

(declare-fun m!41595 () Bool)

(assert (=> b!47333 m!41595))

(declare-fun m!41597 () Bool)

(assert (=> b!47334 m!41597))

(assert (=> b!47293 d!9443))

(declare-fun condMapEmpty!2081 () Bool)

(declare-fun mapDefault!2081 () ValueCell!723)

(assert (=> mapNonEmpty!2075 (= condMapEmpty!2081 (= mapRest!2075 ((as const (Array (_ BitVec 32) ValueCell!723)) mapDefault!2081)))))

(declare-fun e!30304 () Bool)

(declare-fun mapRes!2081 () Bool)

(assert (=> mapNonEmpty!2075 (= tp!6224 (and e!30304 mapRes!2081))))

(declare-fun b!47342 () Bool)

(assert (=> b!47342 (= e!30304 tp_is_empty!2025)))

(declare-fun mapIsEmpty!2081 () Bool)

(assert (=> mapIsEmpty!2081 mapRes!2081))

(declare-fun b!47341 () Bool)

(declare-fun e!30305 () Bool)

(assert (=> b!47341 (= e!30305 tp_is_empty!2025)))

(declare-fun mapNonEmpty!2081 () Bool)

(declare-fun tp!6230 () Bool)

(assert (=> mapNonEmpty!2081 (= mapRes!2081 (and tp!6230 e!30305))))

(declare-fun mapRest!2081 () (Array (_ BitVec 32) ValueCell!723))

(declare-fun mapKey!2081 () (_ BitVec 32))

(declare-fun mapValue!2081 () ValueCell!723)

(assert (=> mapNonEmpty!2081 (= mapRest!2075 (store mapRest!2081 mapKey!2081 mapValue!2081))))

(assert (= (and mapNonEmpty!2075 condMapEmpty!2081) mapIsEmpty!2081))

(assert (= (and mapNonEmpty!2075 (not condMapEmpty!2081)) mapNonEmpty!2081))

(assert (= (and mapNonEmpty!2081 ((_ is ValueCellFull!723) mapValue!2081)) b!47341))

(assert (= (and mapNonEmpty!2075 ((_ is ValueCellFull!723) mapDefault!2081)) b!47342))

(declare-fun m!41599 () Bool)

(assert (=> mapNonEmpty!2081 m!41599))

(check-sat (not bm!3715) (not b!47333) (not b!47328) tp_is_empty!2025 (not mapNonEmpty!2081) (not b!47334) (not b!47325))
(check-sat)
