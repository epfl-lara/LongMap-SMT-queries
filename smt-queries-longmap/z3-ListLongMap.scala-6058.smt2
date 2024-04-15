; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78376 () Bool)

(assert start!78376)

(declare-fun b_free!16759 () Bool)

(declare-fun b_next!16759 () Bool)

(assert (=> start!78376 (= b_free!16759 (not b_next!16759))))

(declare-fun tp!58565 () Bool)

(declare-fun b_and!27353 () Bool)

(assert (=> start!78376 (= tp!58565 b_and!27353)))

(declare-fun b!914277 () Bool)

(declare-fun e!512894 () Bool)

(declare-datatypes ((V!30535 0))(
  ( (V!30536 (val!9639 Int)) )
))
(declare-fun call!40478 () V!30535)

(declare-fun zeroValue!1094 () V!30535)

(assert (=> b!914277 (= e!512894 (not (= call!40478 zeroValue!1094)))))

(declare-fun res!616644 () Bool)

(declare-fun e!512887 () Bool)

(assert (=> start!78376 (=> (not res!616644) (not e!512887))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78376 (= res!616644 (validMask!0 mask!1756))))

(assert (=> start!78376 e!512887))

(declare-datatypes ((ValueCell!9107 0))(
  ( (ValueCellFull!9107 (v!12154 V!30535)) (EmptyCell!9107) )
))
(declare-datatypes ((array!54349 0))(
  ( (array!54350 (arr!26126 (Array (_ BitVec 32) ValueCell!9107)) (size!26587 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54349)

(declare-fun e!512892 () Bool)

(declare-fun array_inv!20482 (array!54349) Bool)

(assert (=> start!78376 (and (array_inv!20482 _values!1152) e!512892)))

(assert (=> start!78376 tp!58565))

(assert (=> start!78376 true))

(declare-fun tp_is_empty!19177 () Bool)

(assert (=> start!78376 tp_is_empty!19177))

(declare-datatypes ((array!54351 0))(
  ( (array!54352 (arr!26127 (Array (_ BitVec 32) (_ BitVec 64))) (size!26588 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54351)

(declare-fun array_inv!20483 (array!54351) Bool)

(assert (=> start!78376 (array_inv!20483 _keys!1386)))

(declare-fun b!914278 () Bool)

(declare-fun res!616639 () Bool)

(assert (=> b!914278 (=> (not res!616639) (not e!512887))))

(declare-datatypes ((List!18389 0))(
  ( (Nil!18386) (Cons!18385 (h!19531 (_ BitVec 64)) (t!25991 List!18389)) )
))
(declare-fun arrayNoDuplicates!0 (array!54351 (_ BitVec 32) List!18389) Bool)

(assert (=> b!914278 (= res!616639 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18386))))

(declare-fun mapNonEmpty!30504 () Bool)

(declare-fun mapRes!30504 () Bool)

(declare-fun tp!58566 () Bool)

(declare-fun e!512893 () Bool)

(assert (=> mapNonEmpty!30504 (= mapRes!30504 (and tp!58566 e!512893))))

(declare-fun mapKey!30504 () (_ BitVec 32))

(declare-fun mapRest!30504 () (Array (_ BitVec 32) ValueCell!9107))

(declare-fun mapValue!30504 () ValueCell!9107)

(assert (=> mapNonEmpty!30504 (= (arr!26126 _values!1152) (store mapRest!30504 mapKey!30504 mapValue!30504))))

(declare-fun b!914279 () Bool)

(declare-fun e!512890 () Bool)

(declare-fun minValue!1094 () V!30535)

(assert (=> b!914279 (= e!512890 (not (= call!40478 minValue!1094)))))

(declare-fun b!914280 () Bool)

(declare-fun res!616646 () Bool)

(declare-fun e!512896 () Bool)

(assert (=> b!914280 (=> (not res!616646) (not e!512896))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!914280 (= res!616646 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!30504 () Bool)

(assert (=> mapIsEmpty!30504 mapRes!30504))

(declare-fun b!914281 () Bool)

(assert (=> b!914281 (= e!512893 tp_is_empty!19177)))

(declare-fun b!914282 () Bool)

(declare-fun e!512891 () Bool)

(assert (=> b!914282 (= e!512896 e!512891)))

(declare-fun c!95941 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!914282 (= c!95941 (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914283 () Bool)

(declare-fun e!512888 () Bool)

(assert (=> b!914283 (= e!512888 tp_is_empty!19177)))

(declare-fun b!914284 () Bool)

(declare-fun res!616641 () Bool)

(assert (=> b!914284 (=> (not res!616641) (not e!512896))))

(assert (=> b!914284 (= res!616641 (and (= (select (arr!26127 _keys!1386) i!717) k0!1033) (or (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914285 () Bool)

(declare-fun res!616647 () Bool)

(assert (=> b!914285 (=> (not res!616647) (not e!512887))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!914285 (= res!616647 (and (= (size!26587 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26588 _keys!1386) (size!26587 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914286 () Bool)

(assert (=> b!914286 (= e!512887 e!512896)))

(declare-fun res!616645 () Bool)

(assert (=> b!914286 (=> (not res!616645) (not e!512896))))

(declare-datatypes ((tuple2!12612 0))(
  ( (tuple2!12613 (_1!6317 (_ BitVec 64)) (_2!6317 V!30535)) )
))
(declare-datatypes ((List!18390 0))(
  ( (Nil!18387) (Cons!18386 (h!19532 tuple2!12612) (t!25992 List!18390)) )
))
(declare-datatypes ((ListLongMap!11299 0))(
  ( (ListLongMap!11300 (toList!5665 List!18390)) )
))
(declare-fun lt!411256 () ListLongMap!11299)

(declare-fun contains!4671 (ListLongMap!11299 (_ BitVec 64)) Bool)

(assert (=> b!914286 (= res!616645 (contains!4671 lt!411256 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun getCurrentListMap!2865 (array!54351 array!54349 (_ BitVec 32) (_ BitVec 32) V!30535 V!30535 (_ BitVec 32) Int) ListLongMap!11299)

(assert (=> b!914286 (= lt!411256 (getCurrentListMap!2865 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914287 () Bool)

(declare-fun res!616638 () Bool)

(assert (=> b!914287 (=> (not res!616638) (not e!512887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54351 (_ BitVec 32)) Bool)

(assert (=> b!914287 (= res!616638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!914288 () Bool)

(declare-fun res!616643 () Bool)

(assert (=> b!914288 (= res!616643 (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(assert (=> b!914288 (=> res!616643 e!512890)))

(declare-fun e!512889 () Bool)

(assert (=> b!914288 (= e!512889 e!512890)))

(declare-fun b!914289 () Bool)

(assert (=> b!914289 (= e!512892 (and e!512888 mapRes!30504))))

(declare-fun condMapEmpty!30504 () Bool)

(declare-fun mapDefault!30504 () ValueCell!9107)

(assert (=> b!914289 (= condMapEmpty!30504 (= (arr!26126 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9107)) mapDefault!30504)))))

(declare-fun b!914290 () Bool)

(assert (=> b!914290 (= e!512891 e!512894)))

(declare-fun res!616642 () Bool)

(assert (=> b!914290 (= res!616642 (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!914290 (=> res!616642 e!512894)))

(declare-fun bm!40475 () Bool)

(declare-fun apply!527 (ListLongMap!11299 (_ BitVec 64)) V!30535)

(assert (=> bm!40475 (= call!40478 (apply!527 lt!411256 k0!1033))))

(declare-fun b!914291 () Bool)

(assert (=> b!914291 (= e!512891 e!512889)))

(declare-fun res!616640 () Bool)

(assert (=> b!914291 (= res!616640 (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914291 (=> (not res!616640) (not e!512889))))

(assert (= (and start!78376 res!616644) b!914285))

(assert (= (and b!914285 res!616647) b!914287))

(assert (= (and b!914287 res!616638) b!914278))

(assert (= (and b!914278 res!616639) b!914286))

(assert (= (and b!914286 res!616645) b!914280))

(assert (= (and b!914280 res!616646) b!914284))

(assert (= (and b!914284 res!616641) b!914282))

(assert (= (and b!914282 c!95941) b!914290))

(assert (= (and b!914282 (not c!95941)) b!914291))

(assert (= (and b!914290 (not res!616642)) b!914277))

(assert (= (and b!914291 res!616640) b!914288))

(assert (= (and b!914288 (not res!616643)) b!914279))

(assert (= (or b!914277 b!914279) bm!40475))

(assert (= (and b!914289 condMapEmpty!30504) mapIsEmpty!30504))

(assert (= (and b!914289 (not condMapEmpty!30504)) mapNonEmpty!30504))

(get-info :version)

(assert (= (and mapNonEmpty!30504 ((_ is ValueCellFull!9107) mapValue!30504)) b!914281))

(assert (= (and b!914289 ((_ is ValueCellFull!9107) mapDefault!30504)) b!914283))

(assert (= start!78376 b!914289))

(declare-fun m!848465 () Bool)

(assert (=> bm!40475 m!848465))

(declare-fun m!848467 () Bool)

(assert (=> b!914284 m!848467))

(declare-fun m!848469 () Bool)

(assert (=> mapNonEmpty!30504 m!848469))

(declare-fun m!848471 () Bool)

(assert (=> b!914280 m!848471))

(declare-fun m!848473 () Bool)

(assert (=> b!914278 m!848473))

(declare-fun m!848475 () Bool)

(assert (=> start!78376 m!848475))

(declare-fun m!848477 () Bool)

(assert (=> start!78376 m!848477))

(declare-fun m!848479 () Bool)

(assert (=> start!78376 m!848479))

(declare-fun m!848481 () Bool)

(assert (=> b!914286 m!848481))

(declare-fun m!848483 () Bool)

(assert (=> b!914286 m!848483))

(declare-fun m!848485 () Bool)

(assert (=> b!914287 m!848485))

(check-sat (not b_next!16759) (not bm!40475) (not b!914287) (not start!78376) (not b!914280) (not b!914278) (not mapNonEmpty!30504) (not b!914286) tp_is_empty!19177 b_and!27353)
(check-sat b_and!27353 (not b_next!16759))
(get-model)

(declare-fun d!112477 () Bool)

(assert (=> d!112477 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!914280 d!112477))

(declare-fun d!112479 () Bool)

(declare-datatypes ((Option!486 0))(
  ( (Some!485 (v!12157 V!30535)) (None!484) )
))
(declare-fun get!13720 (Option!486) V!30535)

(declare-fun getValueByKey!480 (List!18390 (_ BitVec 64)) Option!486)

(assert (=> d!112479 (= (apply!527 lt!411256 k0!1033) (get!13720 (getValueByKey!480 (toList!5665 lt!411256) k0!1033)))))

(declare-fun bs!25714 () Bool)

(assert (= bs!25714 d!112479))

(declare-fun m!848531 () Bool)

(assert (=> bs!25714 m!848531))

(assert (=> bs!25714 m!848531))

(declare-fun m!848533 () Bool)

(assert (=> bs!25714 m!848533))

(assert (=> bm!40475 d!112479))

(declare-fun d!112481 () Bool)

(declare-fun e!512961 () Bool)

(assert (=> d!112481 e!512961))

(declare-fun res!616710 () Bool)

(assert (=> d!112481 (=> res!616710 e!512961)))

(declare-fun lt!411273 () Bool)

(assert (=> d!112481 (= res!616710 (not lt!411273))))

(declare-fun lt!411271 () Bool)

(assert (=> d!112481 (= lt!411273 lt!411271)))

(declare-datatypes ((Unit!30874 0))(
  ( (Unit!30875) )
))
(declare-fun lt!411272 () Unit!30874)

(declare-fun e!512962 () Unit!30874)

(assert (=> d!112481 (= lt!411272 e!512962)))

(declare-fun c!95950 () Bool)

(assert (=> d!112481 (= c!95950 lt!411271)))

(declare-fun containsKey!444 (List!18390 (_ BitVec 64)) Bool)

(assert (=> d!112481 (= lt!411271 (containsKey!444 (toList!5665 lt!411256) k0!1033))))

(assert (=> d!112481 (= (contains!4671 lt!411256 k0!1033) lt!411273)))

(declare-fun b!914388 () Bool)

(declare-fun lt!411274 () Unit!30874)

(assert (=> b!914388 (= e!512962 lt!411274)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!339 (List!18390 (_ BitVec 64)) Unit!30874)

(assert (=> b!914388 (= lt!411274 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5665 lt!411256) k0!1033))))

(declare-fun isDefined!352 (Option!486) Bool)

(assert (=> b!914388 (isDefined!352 (getValueByKey!480 (toList!5665 lt!411256) k0!1033))))

(declare-fun b!914389 () Bool)

(declare-fun Unit!30876 () Unit!30874)

(assert (=> b!914389 (= e!512962 Unit!30876)))

(declare-fun b!914390 () Bool)

(assert (=> b!914390 (= e!512961 (isDefined!352 (getValueByKey!480 (toList!5665 lt!411256) k0!1033)))))

(assert (= (and d!112481 c!95950) b!914388))

(assert (= (and d!112481 (not c!95950)) b!914389))

(assert (= (and d!112481 (not res!616710)) b!914390))

(declare-fun m!848535 () Bool)

(assert (=> d!112481 m!848535))

(declare-fun m!848537 () Bool)

(assert (=> b!914388 m!848537))

(assert (=> b!914388 m!848531))

(assert (=> b!914388 m!848531))

(declare-fun m!848539 () Bool)

(assert (=> b!914388 m!848539))

(assert (=> b!914390 m!848531))

(assert (=> b!914390 m!848531))

(assert (=> b!914390 m!848539))

(assert (=> b!914286 d!112481))

(declare-fun b!914433 () Bool)

(declare-fun e!512996 () ListLongMap!11299)

(declare-fun e!512995 () ListLongMap!11299)

(assert (=> b!914433 (= e!512996 e!512995)))

(declare-fun c!95965 () Bool)

(assert (=> b!914433 (= c!95965 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!914434 () Bool)

(declare-fun call!40499 () ListLongMap!11299)

(assert (=> b!914434 (= e!512995 call!40499)))

(declare-fun b!914435 () Bool)

(declare-fun res!616734 () Bool)

(declare-fun e!512997 () Bool)

(assert (=> b!914435 (=> (not res!616734) (not e!512997))))

(declare-fun e!512992 () Bool)

(assert (=> b!914435 (= res!616734 e!512992)))

(declare-fun c!95968 () Bool)

(assert (=> b!914435 (= c!95968 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!914436 () Bool)

(declare-fun c!95963 () Bool)

(assert (=> b!914436 (= c!95963 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!513001 () ListLongMap!11299)

(assert (=> b!914436 (= e!512995 e!513001)))

(declare-fun b!914437 () Bool)

(declare-fun call!40503 () ListLongMap!11299)

(assert (=> b!914437 (= e!513001 call!40503)))

(declare-fun b!914438 () Bool)

(assert (=> b!914438 (= e!513001 call!40499)))

(declare-fun call!40500 () ListLongMap!11299)

(declare-fun call!40501 () ListLongMap!11299)

(declare-fun call!40502 () ListLongMap!11299)

(declare-fun c!95964 () Bool)

(declare-fun bm!40496 () Bool)

(declare-fun +!2636 (ListLongMap!11299 tuple2!12612) ListLongMap!11299)

(assert (=> bm!40496 (= call!40500 (+!2636 (ite c!95964 call!40501 (ite c!95965 call!40502 call!40503)) (ite (or c!95964 c!95965) (tuple2!12613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!914439 () Bool)

(declare-fun res!616737 () Bool)

(assert (=> b!914439 (=> (not res!616737) (not e!512997))))

(declare-fun e!512994 () Bool)

(assert (=> b!914439 (= res!616737 e!512994)))

(declare-fun res!616736 () Bool)

(assert (=> b!914439 (=> res!616736 e!512994)))

(declare-fun e!512999 () Bool)

(assert (=> b!914439 (= res!616736 (not e!512999))))

(declare-fun res!616732 () Bool)

(assert (=> b!914439 (=> (not res!616732) (not e!512999))))

(assert (=> b!914439 (= res!616732 (bvslt #b00000000000000000000000000000000 (size!26588 _keys!1386)))))

(declare-fun b!914440 () Bool)

(declare-fun e!513000 () Bool)

(assert (=> b!914440 (= e!512997 e!513000)))

(declare-fun c!95967 () Bool)

(assert (=> b!914440 (= c!95967 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40497 () Bool)

(assert (=> bm!40497 (= call!40502 call!40501)))

(declare-fun b!914441 () Bool)

(declare-fun e!512990 () Unit!30874)

(declare-fun lt!411323 () Unit!30874)

(assert (=> b!914441 (= e!512990 lt!411323)))

(declare-fun lt!411330 () ListLongMap!11299)

(declare-fun getCurrentListMapNoExtraKeys!3333 (array!54351 array!54349 (_ BitVec 32) (_ BitVec 32) V!30535 V!30535 (_ BitVec 32) Int) ListLongMap!11299)

(assert (=> b!914441 (= lt!411330 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411339 () (_ BitVec 64))

(assert (=> b!914441 (= lt!411339 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411326 () (_ BitVec 64))

(assert (=> b!914441 (= lt!411326 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411333 () Unit!30874)

(declare-fun addStillContains!351 (ListLongMap!11299 (_ BitVec 64) V!30535 (_ BitVec 64)) Unit!30874)

(assert (=> b!914441 (= lt!411333 (addStillContains!351 lt!411330 lt!411339 zeroValue!1094 lt!411326))))

(assert (=> b!914441 (contains!4671 (+!2636 lt!411330 (tuple2!12613 lt!411339 zeroValue!1094)) lt!411326)))

(declare-fun lt!411321 () Unit!30874)

(assert (=> b!914441 (= lt!411321 lt!411333)))

(declare-fun lt!411340 () ListLongMap!11299)

(assert (=> b!914441 (= lt!411340 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411332 () (_ BitVec 64))

(assert (=> b!914441 (= lt!411332 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411320 () (_ BitVec 64))

(assert (=> b!914441 (= lt!411320 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411331 () Unit!30874)

(declare-fun addApplyDifferent!351 (ListLongMap!11299 (_ BitVec 64) V!30535 (_ BitVec 64)) Unit!30874)

(assert (=> b!914441 (= lt!411331 (addApplyDifferent!351 lt!411340 lt!411332 minValue!1094 lt!411320))))

(assert (=> b!914441 (= (apply!527 (+!2636 lt!411340 (tuple2!12613 lt!411332 minValue!1094)) lt!411320) (apply!527 lt!411340 lt!411320))))

(declare-fun lt!411327 () Unit!30874)

(assert (=> b!914441 (= lt!411327 lt!411331)))

(declare-fun lt!411324 () ListLongMap!11299)

(assert (=> b!914441 (= lt!411324 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411328 () (_ BitVec 64))

(assert (=> b!914441 (= lt!411328 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411334 () (_ BitVec 64))

(assert (=> b!914441 (= lt!411334 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411338 () Unit!30874)

(assert (=> b!914441 (= lt!411338 (addApplyDifferent!351 lt!411324 lt!411328 zeroValue!1094 lt!411334))))

(assert (=> b!914441 (= (apply!527 (+!2636 lt!411324 (tuple2!12613 lt!411328 zeroValue!1094)) lt!411334) (apply!527 lt!411324 lt!411334))))

(declare-fun lt!411336 () Unit!30874)

(assert (=> b!914441 (= lt!411336 lt!411338)))

(declare-fun lt!411325 () ListLongMap!11299)

(assert (=> b!914441 (= lt!411325 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411322 () (_ BitVec 64))

(assert (=> b!914441 (= lt!411322 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411337 () (_ BitVec 64))

(assert (=> b!914441 (= lt!411337 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!914441 (= lt!411323 (addApplyDifferent!351 lt!411325 lt!411322 minValue!1094 lt!411337))))

(assert (=> b!914441 (= (apply!527 (+!2636 lt!411325 (tuple2!12613 lt!411322 minValue!1094)) lt!411337) (apply!527 lt!411325 lt!411337))))

(declare-fun b!914442 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!914442 (= e!512999 (validKeyInArray!0 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40498 () Bool)

(declare-fun call!40504 () Bool)

(declare-fun lt!411329 () ListLongMap!11299)

(assert (=> bm!40498 (= call!40504 (contains!4671 lt!411329 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!112483 () Bool)

(assert (=> d!112483 e!512997))

(declare-fun res!616735 () Bool)

(assert (=> d!112483 (=> (not res!616735) (not e!512997))))

(assert (=> d!112483 (= res!616735 (or (bvsge #b00000000000000000000000000000000 (size!26588 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26588 _keys!1386)))))))

(declare-fun lt!411335 () ListLongMap!11299)

(assert (=> d!112483 (= lt!411329 lt!411335)))

(declare-fun lt!411319 () Unit!30874)

(assert (=> d!112483 (= lt!411319 e!512990)))

(declare-fun c!95966 () Bool)

(declare-fun e!512989 () Bool)

(assert (=> d!112483 (= c!95966 e!512989)))

(declare-fun res!616729 () Bool)

(assert (=> d!112483 (=> (not res!616729) (not e!512989))))

(assert (=> d!112483 (= res!616729 (bvslt #b00000000000000000000000000000000 (size!26588 _keys!1386)))))

(assert (=> d!112483 (= lt!411335 e!512996)))

(assert (=> d!112483 (= c!95964 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112483 (validMask!0 mask!1756)))

(assert (=> d!112483 (= (getCurrentListMap!2865 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411329)))

(declare-fun bm!40499 () Bool)

(declare-fun call!40505 () Bool)

(assert (=> bm!40499 (= call!40505 (contains!4671 lt!411329 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!512993 () Bool)

(declare-fun b!914443 () Bool)

(declare-fun get!13721 (ValueCell!9107 V!30535) V!30535)

(declare-fun dynLambda!1392 (Int (_ BitVec 64)) V!30535)

(assert (=> b!914443 (= e!512993 (= (apply!527 lt!411329 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000)) (get!13721 (select (arr!26126 _values!1152) #b00000000000000000000000000000000) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!914443 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26587 _values!1152)))))

(assert (=> b!914443 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26588 _keys!1386)))))

(declare-fun b!914444 () Bool)

(assert (=> b!914444 (= e!512992 (not call!40505))))

(declare-fun bm!40500 () Bool)

(assert (=> bm!40500 (= call!40501 (getCurrentListMapNoExtraKeys!3333 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914445 () Bool)

(assert (=> b!914445 (= e!512996 (+!2636 call!40500 (tuple2!12613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun bm!40501 () Bool)

(assert (=> bm!40501 (= call!40503 call!40502)))

(declare-fun bm!40502 () Bool)

(assert (=> bm!40502 (= call!40499 call!40500)))

(declare-fun b!914446 () Bool)

(assert (=> b!914446 (= e!512989 (validKeyInArray!0 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914447 () Bool)

(declare-fun e!512998 () Bool)

(assert (=> b!914447 (= e!513000 e!512998)))

(declare-fun res!616733 () Bool)

(assert (=> b!914447 (= res!616733 call!40504)))

(assert (=> b!914447 (=> (not res!616733) (not e!512998))))

(declare-fun b!914448 () Bool)

(declare-fun e!512991 () Bool)

(assert (=> b!914448 (= e!512992 e!512991)))

(declare-fun res!616730 () Bool)

(assert (=> b!914448 (= res!616730 call!40505)))

(assert (=> b!914448 (=> (not res!616730) (not e!512991))))

(declare-fun b!914449 () Bool)

(assert (=> b!914449 (= e!513000 (not call!40504))))

(declare-fun b!914450 () Bool)

(declare-fun Unit!30877 () Unit!30874)

(assert (=> b!914450 (= e!512990 Unit!30877)))

(declare-fun b!914451 () Bool)

(assert (=> b!914451 (= e!512998 (= (apply!527 lt!411329 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!914452 () Bool)

(assert (=> b!914452 (= e!512994 e!512993)))

(declare-fun res!616731 () Bool)

(assert (=> b!914452 (=> (not res!616731) (not e!512993))))

(assert (=> b!914452 (= res!616731 (contains!4671 lt!411329 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26588 _keys!1386)))))

(declare-fun b!914453 () Bool)

(assert (=> b!914453 (= e!512991 (= (apply!527 lt!411329 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(assert (= (and d!112483 c!95964) b!914445))

(assert (= (and d!112483 (not c!95964)) b!914433))

(assert (= (and b!914433 c!95965) b!914434))

(assert (= (and b!914433 (not c!95965)) b!914436))

(assert (= (and b!914436 c!95963) b!914438))

(assert (= (and b!914436 (not c!95963)) b!914437))

(assert (= (or b!914438 b!914437) bm!40501))

(assert (= (or b!914434 bm!40501) bm!40497))

(assert (= (or b!914434 b!914438) bm!40502))

(assert (= (or b!914445 bm!40497) bm!40500))

(assert (= (or b!914445 bm!40502) bm!40496))

(assert (= (and d!112483 res!616729) b!914446))

(assert (= (and d!112483 c!95966) b!914441))

(assert (= (and d!112483 (not c!95966)) b!914450))

(assert (= (and d!112483 res!616735) b!914439))

(assert (= (and b!914439 res!616732) b!914442))

(assert (= (and b!914439 (not res!616736)) b!914452))

(assert (= (and b!914452 res!616731) b!914443))

(assert (= (and b!914439 res!616737) b!914435))

(assert (= (and b!914435 c!95968) b!914448))

(assert (= (and b!914435 (not c!95968)) b!914444))

(assert (= (and b!914448 res!616730) b!914453))

(assert (= (or b!914448 b!914444) bm!40499))

(assert (= (and b!914435 res!616734) b!914440))

(assert (= (and b!914440 c!95967) b!914447))

(assert (= (and b!914440 (not c!95967)) b!914449))

(assert (= (and b!914447 res!616733) b!914451))

(assert (= (or b!914447 b!914449) bm!40498))

(declare-fun b_lambda!13365 () Bool)

(assert (=> (not b_lambda!13365) (not b!914443)))

(declare-fun t!25997 () Bool)

(declare-fun tb!5455 () Bool)

(assert (=> (and start!78376 (= defaultEntry!1160 defaultEntry!1160) t!25997) tb!5455))

(declare-fun result!10729 () Bool)

(assert (=> tb!5455 (= result!10729 tp_is_empty!19177)))

(assert (=> b!914443 t!25997))

(declare-fun b_and!27359 () Bool)

(assert (= b_and!27353 (and (=> t!25997 result!10729) b_and!27359)))

(declare-fun m!848541 () Bool)

(assert (=> bm!40496 m!848541))

(assert (=> d!112483 m!848475))

(declare-fun m!848543 () Bool)

(assert (=> bm!40499 m!848543))

(declare-fun m!848545 () Bool)

(assert (=> b!914443 m!848545))

(declare-fun m!848547 () Bool)

(assert (=> b!914443 m!848547))

(declare-fun m!848549 () Bool)

(assert (=> b!914443 m!848549))

(declare-fun m!848551 () Bool)

(assert (=> b!914443 m!848551))

(assert (=> b!914443 m!848545))

(declare-fun m!848553 () Bool)

(assert (=> b!914443 m!848553))

(assert (=> b!914443 m!848551))

(assert (=> b!914443 m!848547))

(declare-fun m!848555 () Bool)

(assert (=> b!914441 m!848555))

(declare-fun m!848557 () Bool)

(assert (=> b!914441 m!848557))

(declare-fun m!848559 () Bool)

(assert (=> b!914441 m!848559))

(declare-fun m!848561 () Bool)

(assert (=> b!914441 m!848561))

(declare-fun m!848563 () Bool)

(assert (=> b!914441 m!848563))

(declare-fun m!848565 () Bool)

(assert (=> b!914441 m!848565))

(assert (=> b!914441 m!848563))

(declare-fun m!848567 () Bool)

(assert (=> b!914441 m!848567))

(declare-fun m!848569 () Bool)

(assert (=> b!914441 m!848569))

(assert (=> b!914441 m!848567))

(declare-fun m!848571 () Bool)

(assert (=> b!914441 m!848571))

(declare-fun m!848573 () Bool)

(assert (=> b!914441 m!848573))

(declare-fun m!848575 () Bool)

(assert (=> b!914441 m!848575))

(declare-fun m!848577 () Bool)

(assert (=> b!914441 m!848577))

(assert (=> b!914441 m!848559))

(declare-fun m!848579 () Bool)

(assert (=> b!914441 m!848579))

(assert (=> b!914441 m!848575))

(declare-fun m!848581 () Bool)

(assert (=> b!914441 m!848581))

(assert (=> b!914441 m!848547))

(declare-fun m!848583 () Bool)

(assert (=> b!914441 m!848583))

(declare-fun m!848585 () Bool)

(assert (=> b!914441 m!848585))

(assert (=> b!914442 m!848547))

(assert (=> b!914442 m!848547))

(declare-fun m!848587 () Bool)

(assert (=> b!914442 m!848587))

(declare-fun m!848589 () Bool)

(assert (=> b!914453 m!848589))

(assert (=> bm!40500 m!848573))

(declare-fun m!848591 () Bool)

(assert (=> b!914445 m!848591))

(assert (=> b!914446 m!848547))

(assert (=> b!914446 m!848547))

(assert (=> b!914446 m!848587))

(assert (=> b!914452 m!848547))

(assert (=> b!914452 m!848547))

(declare-fun m!848593 () Bool)

(assert (=> b!914452 m!848593))

(declare-fun m!848595 () Bool)

(assert (=> bm!40498 m!848595))

(declare-fun m!848597 () Bool)

(assert (=> b!914451 m!848597))

(assert (=> b!914286 d!112483))

(declare-fun b!914466 () Bool)

(declare-fun e!513010 () Bool)

(declare-fun contains!4673 (List!18389 (_ BitVec 64)) Bool)

(assert (=> b!914466 (= e!513010 (contains!4673 Nil!18386 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914467 () Bool)

(declare-fun e!513012 () Bool)

(declare-fun e!513011 () Bool)

(assert (=> b!914467 (= e!513012 e!513011)))

(declare-fun c!95971 () Bool)

(assert (=> b!914467 (= c!95971 (validKeyInArray!0 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914468 () Bool)

(declare-fun call!40508 () Bool)

(assert (=> b!914468 (= e!513011 call!40508)))

(declare-fun d!112485 () Bool)

(declare-fun res!616744 () Bool)

(declare-fun e!513013 () Bool)

(assert (=> d!112485 (=> res!616744 e!513013)))

(assert (=> d!112485 (= res!616744 (bvsge #b00000000000000000000000000000000 (size!26588 _keys!1386)))))

(assert (=> d!112485 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18386) e!513013)))

(declare-fun b!914469 () Bool)

(assert (=> b!914469 (= e!513011 call!40508)))

(declare-fun bm!40505 () Bool)

(assert (=> bm!40505 (= call!40508 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95971 (Cons!18385 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000) Nil!18386) Nil!18386)))))

(declare-fun b!914470 () Bool)

(assert (=> b!914470 (= e!513013 e!513012)))

(declare-fun res!616746 () Bool)

(assert (=> b!914470 (=> (not res!616746) (not e!513012))))

(assert (=> b!914470 (= res!616746 (not e!513010))))

(declare-fun res!616745 () Bool)

(assert (=> b!914470 (=> (not res!616745) (not e!513010))))

(assert (=> b!914470 (= res!616745 (validKeyInArray!0 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112485 (not res!616744)) b!914470))

(assert (= (and b!914470 res!616745) b!914466))

(assert (= (and b!914470 res!616746) b!914467))

(assert (= (and b!914467 c!95971) b!914468))

(assert (= (and b!914467 (not c!95971)) b!914469))

(assert (= (or b!914468 b!914469) bm!40505))

(assert (=> b!914466 m!848547))

(assert (=> b!914466 m!848547))

(declare-fun m!848599 () Bool)

(assert (=> b!914466 m!848599))

(assert (=> b!914467 m!848547))

(assert (=> b!914467 m!848547))

(assert (=> b!914467 m!848587))

(assert (=> bm!40505 m!848547))

(declare-fun m!848601 () Bool)

(assert (=> bm!40505 m!848601))

(assert (=> b!914470 m!848547))

(assert (=> b!914470 m!848547))

(assert (=> b!914470 m!848587))

(assert (=> b!914278 d!112485))

(declare-fun b!914479 () Bool)

(declare-fun e!513022 () Bool)

(declare-fun e!513020 () Bool)

(assert (=> b!914479 (= e!513022 e!513020)))

(declare-fun c!95974 () Bool)

(assert (=> b!914479 (= c!95974 (validKeyInArray!0 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914480 () Bool)

(declare-fun e!513021 () Bool)

(declare-fun call!40511 () Bool)

(assert (=> b!914480 (= e!513021 call!40511)))

(declare-fun b!914481 () Bool)

(assert (=> b!914481 (= e!513020 e!513021)))

(declare-fun lt!411348 () (_ BitVec 64))

(assert (=> b!914481 (= lt!411348 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411349 () Unit!30874)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54351 (_ BitVec 64) (_ BitVec 32)) Unit!30874)

(assert (=> b!914481 (= lt!411349 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411348 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914481 (arrayContainsKey!0 _keys!1386 lt!411348 #b00000000000000000000000000000000)))

(declare-fun lt!411347 () Unit!30874)

(assert (=> b!914481 (= lt!411347 lt!411349)))

(declare-fun res!616751 () Bool)

(declare-datatypes ((SeekEntryResult!8971 0))(
  ( (MissingZero!8971 (index!38255 (_ BitVec 32))) (Found!8971 (index!38256 (_ BitVec 32))) (Intermediate!8971 (undefined!9783 Bool) (index!38257 (_ BitVec 32)) (x!78223 (_ BitVec 32))) (Undefined!8971) (MissingVacant!8971 (index!38258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54351 (_ BitVec 32)) SeekEntryResult!8971)

(assert (=> b!914481 (= res!616751 (= (seekEntryOrOpen!0 (select (arr!26127 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8971 #b00000000000000000000000000000000)))))

(assert (=> b!914481 (=> (not res!616751) (not e!513021))))

(declare-fun bm!40508 () Bool)

(assert (=> bm!40508 (= call!40511 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!914482 () Bool)

(assert (=> b!914482 (= e!513020 call!40511)))

(declare-fun d!112487 () Bool)

(declare-fun res!616752 () Bool)

(assert (=> d!112487 (=> res!616752 e!513022)))

(assert (=> d!112487 (= res!616752 (bvsge #b00000000000000000000000000000000 (size!26588 _keys!1386)))))

(assert (=> d!112487 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!513022)))

(assert (= (and d!112487 (not res!616752)) b!914479))

(assert (= (and b!914479 c!95974) b!914481))

(assert (= (and b!914479 (not c!95974)) b!914482))

(assert (= (and b!914481 res!616751) b!914480))

(assert (= (or b!914480 b!914482) bm!40508))

(assert (=> b!914479 m!848547))

(assert (=> b!914479 m!848547))

(assert (=> b!914479 m!848587))

(assert (=> b!914481 m!848547))

(declare-fun m!848603 () Bool)

(assert (=> b!914481 m!848603))

(declare-fun m!848605 () Bool)

(assert (=> b!914481 m!848605))

(assert (=> b!914481 m!848547))

(declare-fun m!848607 () Bool)

(assert (=> b!914481 m!848607))

(declare-fun m!848609 () Bool)

(assert (=> bm!40508 m!848609))

(assert (=> b!914287 d!112487))

(declare-fun d!112489 () Bool)

(assert (=> d!112489 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78376 d!112489))

(declare-fun d!112491 () Bool)

(assert (=> d!112491 (= (array_inv!20482 _values!1152) (bvsge (size!26587 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78376 d!112491))

(declare-fun d!112493 () Bool)

(assert (=> d!112493 (= (array_inv!20483 _keys!1386) (bvsge (size!26588 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78376 d!112493))

(declare-fun condMapEmpty!30513 () Bool)

(declare-fun mapDefault!30513 () ValueCell!9107)

(assert (=> mapNonEmpty!30504 (= condMapEmpty!30513 (= mapRest!30504 ((as const (Array (_ BitVec 32) ValueCell!9107)) mapDefault!30513)))))

(declare-fun e!513028 () Bool)

(declare-fun mapRes!30513 () Bool)

(assert (=> mapNonEmpty!30504 (= tp!58566 (and e!513028 mapRes!30513))))

(declare-fun mapNonEmpty!30513 () Bool)

(declare-fun tp!58581 () Bool)

(declare-fun e!513027 () Bool)

(assert (=> mapNonEmpty!30513 (= mapRes!30513 (and tp!58581 e!513027))))

(declare-fun mapKey!30513 () (_ BitVec 32))

(declare-fun mapValue!30513 () ValueCell!9107)

(declare-fun mapRest!30513 () (Array (_ BitVec 32) ValueCell!9107))

(assert (=> mapNonEmpty!30513 (= mapRest!30504 (store mapRest!30513 mapKey!30513 mapValue!30513))))

(declare-fun b!914489 () Bool)

(assert (=> b!914489 (= e!513027 tp_is_empty!19177)))

(declare-fun mapIsEmpty!30513 () Bool)

(assert (=> mapIsEmpty!30513 mapRes!30513))

(declare-fun b!914490 () Bool)

(assert (=> b!914490 (= e!513028 tp_is_empty!19177)))

(assert (= (and mapNonEmpty!30504 condMapEmpty!30513) mapIsEmpty!30513))

(assert (= (and mapNonEmpty!30504 (not condMapEmpty!30513)) mapNonEmpty!30513))

(assert (= (and mapNonEmpty!30513 ((_ is ValueCellFull!9107) mapValue!30513)) b!914489))

(assert (= (and mapNonEmpty!30504 ((_ is ValueCellFull!9107) mapDefault!30513)) b!914490))

(declare-fun m!848611 () Bool)

(assert (=> mapNonEmpty!30513 m!848611))

(declare-fun b_lambda!13367 () Bool)

(assert (= b_lambda!13365 (or (and start!78376 b_free!16759) b_lambda!13367)))

(check-sat (not b_next!16759) tp_is_empty!19177 (not d!112479) (not bm!40500) (not b!914451) (not mapNonEmpty!30513) (not b!914452) (not b!914467) (not bm!40496) (not b_lambda!13367) (not b!914446) (not b!914388) (not b!914466) (not bm!40505) (not b!914390) (not bm!40508) b_and!27359 (not b!914453) (not bm!40498) (not b!914445) (not b!914479) (not b!914481) (not b!914443) (not b!914442) (not bm!40499) (not d!112481) (not b!914470) (not d!112483) (not b!914441))
(check-sat b_and!27359 (not b_next!16759))
