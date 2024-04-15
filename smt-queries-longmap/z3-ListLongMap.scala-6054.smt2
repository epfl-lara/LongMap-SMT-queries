; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78296 () Bool)

(assert start!78296)

(declare-fun b_free!16735 () Bool)

(declare-fun b_next!16735 () Bool)

(assert (=> start!78296 (= b_free!16735 (not b_next!16735))))

(declare-fun tp!58490 () Bool)

(declare-fun b_and!27299 () Bool)

(assert (=> start!78296 (= tp!58490 b_and!27299)))

(declare-fun b!913514 () Bool)

(declare-fun e!512418 () Bool)

(declare-fun e!512415 () Bool)

(assert (=> b!913514 (= e!512418 (not e!512415))))

(declare-fun res!616193 () Bool)

(assert (=> b!913514 (=> res!616193 e!512415)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54301 0))(
  ( (array!54302 (arr!26103 (Array (_ BitVec 32) (_ BitVec 64))) (size!26564 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54301)

(assert (=> b!913514 (= res!616193 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26564 _keys!1386))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913514 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((V!30503 0))(
  ( (V!30504 (val!9627 Int)) )
))
(declare-fun zeroValue!1094 () V!30503)

(declare-datatypes ((Unit!30850 0))(
  ( (Unit!30851) )
))
(declare-fun lt!410876 () Unit!30850)

(declare-datatypes ((ValueCell!9095 0))(
  ( (ValueCellFull!9095 (v!12140 V!30503)) (EmptyCell!9095) )
))
(declare-datatypes ((array!54303 0))(
  ( (array!54304 (arr!26104 (Array (_ BitVec 32) ValueCell!9095)) (size!26565 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54303)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30503)

(declare-fun lemmaKeyInListMapIsInArray!275 (array!54301 array!54303 (_ BitVec 32) (_ BitVec 32) V!30503 V!30503 (_ BitVec 64) Int) Unit!30850)

(assert (=> b!913514 (= lt!410876 (lemmaKeyInListMapIsInArray!275 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913515 () Bool)

(declare-fun res!616196 () Bool)

(assert (=> b!913515 (=> (not res!616196) (not e!512418))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913515 (= res!616196 (inRange!0 i!717 mask!1756))))

(declare-fun b!913516 () Bool)

(declare-fun res!616191 () Bool)

(assert (=> b!913516 (=> (not res!616191) (not e!512418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54301 (_ BitVec 32)) Bool)

(assert (=> b!913516 (= res!616191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913517 () Bool)

(declare-fun res!616195 () Bool)

(assert (=> b!913517 (=> (not res!616195) (not e!512418))))

(assert (=> b!913517 (= res!616195 (and (= (size!26565 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26564 _keys!1386) (size!26565 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913518 () Bool)

(declare-fun res!616199 () Bool)

(assert (=> b!913518 (=> (not res!616199) (not e!512418))))

(declare-datatypes ((List!18373 0))(
  ( (Nil!18370) (Cons!18369 (h!19515 (_ BitVec 64)) (t!25959 List!18373)) )
))
(declare-fun arrayNoDuplicates!0 (array!54301 (_ BitVec 32) List!18373) Bool)

(assert (=> b!913518 (= res!616199 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18370))))

(declare-fun b!913519 () Bool)

(declare-fun e!512416 () Bool)

(declare-fun tp_is_empty!19153 () Bool)

(assert (=> b!913519 (= e!512416 tp_is_empty!19153)))

(declare-fun b!913520 () Bool)

(declare-fun e!512412 () Bool)

(assert (=> b!913520 (= e!512415 e!512412)))

(declare-fun res!616198 () Bool)

(assert (=> b!913520 (=> res!616198 e!512412)))

(declare-datatypes ((tuple2!12594 0))(
  ( (tuple2!12595 (_1!6308 (_ BitVec 64)) (_2!6308 V!30503)) )
))
(declare-datatypes ((List!18374 0))(
  ( (Nil!18371) (Cons!18370 (h!19516 tuple2!12594) (t!25960 List!18374)) )
))
(declare-datatypes ((ListLongMap!11281 0))(
  ( (ListLongMap!11282 (toList!5656 List!18374)) )
))
(declare-fun lt!410875 () ListLongMap!11281)

(declare-fun contains!4662 (ListLongMap!11281 (_ BitVec 64)) Bool)

(assert (=> b!913520 (= res!616198 (not (contains!4662 lt!410875 k0!1033)))))

(declare-fun getCurrentListMap!2858 (array!54301 array!54303 (_ BitVec 32) (_ BitVec 32) V!30503 V!30503 (_ BitVec 32) Int) ListLongMap!11281)

(assert (=> b!913520 (= lt!410875 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!913521 () Bool)

(declare-fun apply!521 (ListLongMap!11281 (_ BitVec 64)) V!30503)

(declare-fun get!13703 (ValueCell!9095 V!30503) V!30503)

(declare-fun dynLambda!1386 (Int (_ BitVec 64)) V!30503)

(assert (=> b!913521 (= e!512412 (= (apply!521 lt!410875 k0!1033) (get!13703 (select (arr!26104 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913522 () Bool)

(declare-fun res!616192 () Bool)

(assert (=> b!913522 (=> (not res!616192) (not e!512418))))

(assert (=> b!913522 (= res!616192 (contains!4662 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913523 () Bool)

(declare-fun res!616194 () Bool)

(assert (=> b!913523 (=> (not res!616194) (not e!512418))))

(assert (=> b!913523 (= res!616194 (and (= (select (arr!26103 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!30464 () Bool)

(declare-fun mapRes!30464 () Bool)

(assert (=> mapIsEmpty!30464 mapRes!30464))

(declare-fun mapNonEmpty!30464 () Bool)

(declare-fun tp!58489 () Bool)

(declare-fun e!512417 () Bool)

(assert (=> mapNonEmpty!30464 (= mapRes!30464 (and tp!58489 e!512417))))

(declare-fun mapKey!30464 () (_ BitVec 32))

(declare-fun mapValue!30464 () ValueCell!9095)

(declare-fun mapRest!30464 () (Array (_ BitVec 32) ValueCell!9095))

(assert (=> mapNonEmpty!30464 (= (arr!26104 _values!1152) (store mapRest!30464 mapKey!30464 mapValue!30464))))

(declare-fun res!616197 () Bool)

(assert (=> start!78296 (=> (not res!616197) (not e!512418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78296 (= res!616197 (validMask!0 mask!1756))))

(assert (=> start!78296 e!512418))

(declare-fun e!512413 () Bool)

(declare-fun array_inv!20466 (array!54303) Bool)

(assert (=> start!78296 (and (array_inv!20466 _values!1152) e!512413)))

(assert (=> start!78296 tp!58490))

(assert (=> start!78296 true))

(assert (=> start!78296 tp_is_empty!19153))

(declare-fun array_inv!20467 (array!54301) Bool)

(assert (=> start!78296 (array_inv!20467 _keys!1386)))

(declare-fun b!913524 () Bool)

(assert (=> b!913524 (= e!512413 (and e!512416 mapRes!30464))))

(declare-fun condMapEmpty!30464 () Bool)

(declare-fun mapDefault!30464 () ValueCell!9095)

(assert (=> b!913524 (= condMapEmpty!30464 (= (arr!26104 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9095)) mapDefault!30464)))))

(declare-fun b!913525 () Bool)

(assert (=> b!913525 (= e!512417 tp_is_empty!19153)))

(assert (= (and start!78296 res!616197) b!913517))

(assert (= (and b!913517 res!616195) b!913516))

(assert (= (and b!913516 res!616191) b!913518))

(assert (= (and b!913518 res!616199) b!913522))

(assert (= (and b!913522 res!616192) b!913515))

(assert (= (and b!913515 res!616196) b!913523))

(assert (= (and b!913523 res!616194) b!913514))

(assert (= (and b!913514 (not res!616193)) b!913520))

(assert (= (and b!913520 (not res!616198)) b!913521))

(assert (= (and b!913524 condMapEmpty!30464) mapIsEmpty!30464))

(assert (= (and b!913524 (not condMapEmpty!30464)) mapNonEmpty!30464))

(get-info :version)

(assert (= (and mapNonEmpty!30464 ((_ is ValueCellFull!9095) mapValue!30464)) b!913525))

(assert (= (and b!913524 ((_ is ValueCellFull!9095) mapDefault!30464)) b!913519))

(assert (= start!78296 b!913524))

(declare-fun b_lambda!13321 () Bool)

(assert (=> (not b_lambda!13321) (not b!913521)))

(declare-fun t!25958 () Bool)

(declare-fun tb!5437 () Bool)

(assert (=> (and start!78296 (= defaultEntry!1160 defaultEntry!1160) t!25958) tb!5437))

(declare-fun result!10691 () Bool)

(assert (=> tb!5437 (= result!10691 tp_is_empty!19153)))

(assert (=> b!913521 t!25958))

(declare-fun b_and!27301 () Bool)

(assert (= b_and!27299 (and (=> t!25958 result!10691) b_and!27301)))

(declare-fun m!847515 () Bool)

(assert (=> b!913516 m!847515))

(declare-fun m!847517 () Bool)

(assert (=> b!913514 m!847517))

(declare-fun m!847519 () Bool)

(assert (=> b!913514 m!847519))

(declare-fun m!847521 () Bool)

(assert (=> b!913515 m!847521))

(declare-fun m!847523 () Bool)

(assert (=> b!913518 m!847523))

(declare-fun m!847525 () Bool)

(assert (=> b!913521 m!847525))

(declare-fun m!847527 () Bool)

(assert (=> b!913521 m!847527))

(declare-fun m!847529 () Bool)

(assert (=> b!913521 m!847529))

(assert (=> b!913521 m!847527))

(assert (=> b!913521 m!847529))

(declare-fun m!847531 () Bool)

(assert (=> b!913521 m!847531))

(declare-fun m!847533 () Bool)

(assert (=> mapNonEmpty!30464 m!847533))

(declare-fun m!847535 () Bool)

(assert (=> b!913520 m!847535))

(declare-fun m!847537 () Bool)

(assert (=> b!913520 m!847537))

(declare-fun m!847539 () Bool)

(assert (=> b!913522 m!847539))

(assert (=> b!913522 m!847539))

(declare-fun m!847541 () Bool)

(assert (=> b!913522 m!847541))

(declare-fun m!847543 () Bool)

(assert (=> b!913523 m!847543))

(declare-fun m!847545 () Bool)

(assert (=> start!78296 m!847545))

(declare-fun m!847547 () Bool)

(assert (=> start!78296 m!847547))

(declare-fun m!847549 () Bool)

(assert (=> start!78296 m!847549))

(check-sat (not b!913521) (not mapNonEmpty!30464) (not b!913518) tp_is_empty!19153 (not b!913514) (not b!913515) (not b_next!16735) b_and!27301 (not b_lambda!13321) (not b!913522) (not start!78296) (not b!913516) (not b!913520))
(check-sat b_and!27301 (not b_next!16735))
(get-model)

(declare-fun b_lambda!13327 () Bool)

(assert (= b_lambda!13321 (or (and start!78296 b_free!16735) b_lambda!13327)))

(check-sat (not mapNonEmpty!30464) (not b!913518) tp_is_empty!19153 (not b!913514) (not b!913515) (not b_next!16735) b_and!27301 (not b!913522) (not start!78296) (not b_lambda!13327) (not b!913521) (not b!913516) (not b!913520))
(check-sat b_and!27301 (not b_next!16735))
(get-model)

(declare-fun d!112301 () Bool)

(assert (=> d!112301 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!913515 d!112301))

(declare-fun d!112303 () Bool)

(declare-fun res!616258 () Bool)

(declare-fun e!512465 () Bool)

(assert (=> d!112303 (=> res!616258 e!512465)))

(assert (=> d!112303 (= res!616258 (= (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112303 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!512465)))

(declare-fun b!913608 () Bool)

(declare-fun e!512466 () Bool)

(assert (=> b!913608 (= e!512465 e!512466)))

(declare-fun res!616259 () Bool)

(assert (=> b!913608 (=> (not res!616259) (not e!512466))))

(assert (=> b!913608 (= res!616259 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26564 _keys!1386)))))

(declare-fun b!913609 () Bool)

(assert (=> b!913609 (= e!512466 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112303 (not res!616258)) b!913608))

(assert (= (and b!913608 res!616259) b!913609))

(declare-fun m!847623 () Bool)

(assert (=> d!112303 m!847623))

(declare-fun m!847625 () Bool)

(assert (=> b!913609 m!847625))

(assert (=> b!913514 d!112303))

(declare-fun d!112305 () Bool)

(declare-fun e!512469 () Bool)

(assert (=> d!112305 e!512469))

(declare-fun c!95854 () Bool)

(assert (=> d!112305 (= c!95854 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!410891 () Unit!30850)

(declare-fun choose!1544 (array!54301 array!54303 (_ BitVec 32) (_ BitVec 32) V!30503 V!30503 (_ BitVec 64) Int) Unit!30850)

(assert (=> d!112305 (= lt!410891 (choose!1544 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112305 (validMask!0 mask!1756)))

(assert (=> d!112305 (= (lemmaKeyInListMapIsInArray!275 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!410891)))

(declare-fun b!913614 () Bool)

(assert (=> b!913614 (= e!512469 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!913615 () Bool)

(assert (=> b!913615 (= e!512469 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112305 c!95854) b!913614))

(assert (= (and d!112305 (not c!95854)) b!913615))

(declare-fun m!847627 () Bool)

(assert (=> d!112305 m!847627))

(assert (=> d!112305 m!847545))

(assert (=> b!913614 m!847517))

(assert (=> b!913514 d!112305))

(declare-fun d!112307 () Bool)

(assert (=> d!112307 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78296 d!112307))

(declare-fun d!112309 () Bool)

(assert (=> d!112309 (= (array_inv!20466 _values!1152) (bvsge (size!26565 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78296 d!112309))

(declare-fun d!112311 () Bool)

(assert (=> d!112311 (= (array_inv!20467 _keys!1386) (bvsge (size!26564 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78296 d!112311))

(declare-fun bm!40435 () Bool)

(declare-fun call!40438 () Bool)

(declare-fun c!95857 () Bool)

(assert (=> bm!40435 (= call!40438 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95857 (Cons!18369 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) Nil!18370) Nil!18370)))))

(declare-fun b!913627 () Bool)

(declare-fun e!512481 () Bool)

(assert (=> b!913627 (= e!512481 call!40438)))

(declare-fun b!913628 () Bool)

(assert (=> b!913628 (= e!512481 call!40438)))

(declare-fun b!913629 () Bool)

(declare-fun e!512480 () Bool)

(assert (=> b!913629 (= e!512480 e!512481)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!913629 (= c!95857 (validKeyInArray!0 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913630 () Bool)

(declare-fun e!512478 () Bool)

(assert (=> b!913630 (= e!512478 e!512480)))

(declare-fun res!616267 () Bool)

(assert (=> b!913630 (=> (not res!616267) (not e!512480))))

(declare-fun e!512479 () Bool)

(assert (=> b!913630 (= res!616267 (not e!512479))))

(declare-fun res!616266 () Bool)

(assert (=> b!913630 (=> (not res!616266) (not e!512479))))

(assert (=> b!913630 (= res!616266 (validKeyInArray!0 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112313 () Bool)

(declare-fun res!616268 () Bool)

(assert (=> d!112313 (=> res!616268 e!512478)))

(assert (=> d!112313 (= res!616268 (bvsge #b00000000000000000000000000000000 (size!26564 _keys!1386)))))

(assert (=> d!112313 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18370) e!512478)))

(declare-fun b!913626 () Bool)

(declare-fun contains!4664 (List!18373 (_ BitVec 64)) Bool)

(assert (=> b!913626 (= e!512479 (contains!4664 Nil!18370 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112313 (not res!616268)) b!913630))

(assert (= (and b!913630 res!616266) b!913626))

(assert (= (and b!913630 res!616267) b!913629))

(assert (= (and b!913629 c!95857) b!913627))

(assert (= (and b!913629 (not c!95857)) b!913628))

(assert (= (or b!913627 b!913628) bm!40435))

(assert (=> bm!40435 m!847623))

(declare-fun m!847629 () Bool)

(assert (=> bm!40435 m!847629))

(assert (=> b!913629 m!847623))

(assert (=> b!913629 m!847623))

(declare-fun m!847631 () Bool)

(assert (=> b!913629 m!847631))

(assert (=> b!913630 m!847623))

(assert (=> b!913630 m!847623))

(assert (=> b!913630 m!847631))

(assert (=> b!913626 m!847623))

(assert (=> b!913626 m!847623))

(declare-fun m!847633 () Bool)

(assert (=> b!913626 m!847633))

(assert (=> b!913518 d!112313))

(declare-fun d!112315 () Bool)

(declare-fun e!512486 () Bool)

(assert (=> d!112315 e!512486))

(declare-fun res!616271 () Bool)

(assert (=> d!112315 (=> res!616271 e!512486)))

(declare-fun lt!410903 () Bool)

(assert (=> d!112315 (= res!616271 (not lt!410903))))

(declare-fun lt!410900 () Bool)

(assert (=> d!112315 (= lt!410903 lt!410900)))

(declare-fun lt!410902 () Unit!30850)

(declare-fun e!512487 () Unit!30850)

(assert (=> d!112315 (= lt!410902 e!512487)))

(declare-fun c!95860 () Bool)

(assert (=> d!112315 (= c!95860 lt!410900)))

(declare-fun containsKey!443 (List!18374 (_ BitVec 64)) Bool)

(assert (=> d!112315 (= lt!410900 (containsKey!443 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112315 (= (contains!4662 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410903)))

(declare-fun b!913637 () Bool)

(declare-fun lt!410901 () Unit!30850)

(assert (=> b!913637 (= e!512487 lt!410901)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!338 (List!18374 (_ BitVec 64)) Unit!30850)

(assert (=> b!913637 (= lt!410901 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!485 0))(
  ( (Some!484 (v!12143 V!30503)) (None!483) )
))
(declare-fun isDefined!351 (Option!485) Bool)

(declare-fun getValueByKey!479 (List!18374 (_ BitVec 64)) Option!485)

(assert (=> b!913637 (isDefined!351 (getValueByKey!479 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!913638 () Bool)

(declare-fun Unit!30854 () Unit!30850)

(assert (=> b!913638 (= e!512487 Unit!30854)))

(declare-fun b!913639 () Bool)

(assert (=> b!913639 (= e!512486 (isDefined!351 (getValueByKey!479 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112315 c!95860) b!913637))

(assert (= (and d!112315 (not c!95860)) b!913638))

(assert (= (and d!112315 (not res!616271)) b!913639))

(declare-fun m!847635 () Bool)

(assert (=> d!112315 m!847635))

(declare-fun m!847637 () Bool)

(assert (=> b!913637 m!847637))

(declare-fun m!847639 () Bool)

(assert (=> b!913637 m!847639))

(assert (=> b!913637 m!847639))

(declare-fun m!847641 () Bool)

(assert (=> b!913637 m!847641))

(assert (=> b!913639 m!847639))

(assert (=> b!913639 m!847639))

(assert (=> b!913639 m!847641))

(assert (=> b!913522 d!112315))

(declare-fun b!913682 () Bool)

(declare-fun e!512514 () Bool)

(declare-fun lt!410950 () ListLongMap!11281)

(assert (=> b!913682 (= e!512514 (= (apply!521 lt!410950 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!913683 () Bool)

(declare-fun e!512517 () ListLongMap!11281)

(declare-fun call!40456 () ListLongMap!11281)

(assert (=> b!913683 (= e!512517 call!40456)))

(declare-fun b!913684 () Bool)

(declare-fun e!512523 () ListLongMap!11281)

(declare-fun call!40455 () ListLongMap!11281)

(assert (=> b!913684 (= e!512523 call!40455)))

(declare-fun b!913685 () Bool)

(declare-fun e!512516 () Bool)

(assert (=> b!913685 (= e!512516 (= (apply!521 lt!410950 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!913686 () Bool)

(declare-fun c!95874 () Bool)

(assert (=> b!913686 (= c!95874 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!913686 (= e!512517 e!512523)))

(declare-fun b!913687 () Bool)

(declare-fun e!512515 () Unit!30850)

(declare-fun Unit!30855 () Unit!30850)

(assert (=> b!913687 (= e!512515 Unit!30855)))

(declare-fun b!913688 () Bool)

(declare-fun e!512520 () Bool)

(declare-fun call!40454 () Bool)

(assert (=> b!913688 (= e!512520 (not call!40454))))

(declare-fun bm!40450 () Bool)

(declare-fun call!40453 () Bool)

(assert (=> bm!40450 (= call!40453 (contains!4662 lt!410950 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913689 () Bool)

(declare-fun e!512526 () ListLongMap!11281)

(assert (=> b!913689 (= e!512526 e!512517)))

(declare-fun c!95875 () Bool)

(assert (=> b!913689 (= c!95875 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913690 () Bool)

(declare-fun e!512521 () Bool)

(assert (=> b!913690 (= e!512521 (validKeyInArray!0 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913692 () Bool)

(declare-fun e!512519 () Bool)

(declare-fun e!512522 () Bool)

(assert (=> b!913692 (= e!512519 e!512522)))

(declare-fun c!95877 () Bool)

(assert (=> b!913692 (= c!95877 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913693 () Bool)

(assert (=> b!913693 (= e!512523 call!40456)))

(declare-fun c!95878 () Bool)

(declare-fun call!40459 () ListLongMap!11281)

(declare-fun call!40457 () ListLongMap!11281)

(declare-fun call!40458 () ListLongMap!11281)

(declare-fun bm!40451 () Bool)

(declare-fun +!2635 (ListLongMap!11281 tuple2!12594) ListLongMap!11281)

(assert (=> bm!40451 (= call!40458 (+!2635 (ite c!95878 call!40457 (ite c!95875 call!40459 call!40455)) (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!913694 () Bool)

(assert (=> b!913694 (= e!512526 (+!2635 call!40458 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun bm!40452 () Bool)

(assert (=> bm!40452 (= call!40459 call!40457)))

(declare-fun b!913695 () Bool)

(assert (=> b!913695 (= e!512520 e!512514)))

(declare-fun res!616290 () Bool)

(assert (=> b!913695 (= res!616290 call!40454)))

(assert (=> b!913695 (=> (not res!616290) (not e!512514))))

(declare-fun b!913696 () Bool)

(declare-fun lt!410960 () Unit!30850)

(assert (=> b!913696 (= e!512515 lt!410960)))

(declare-fun lt!410949 () ListLongMap!11281)

(declare-fun getCurrentListMapNoExtraKeys!3332 (array!54301 array!54303 (_ BitVec 32) (_ BitVec 32) V!30503 V!30503 (_ BitVec 32) Int) ListLongMap!11281)

(assert (=> b!913696 (= lt!410949 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410967 () (_ BitVec 64))

(assert (=> b!913696 (= lt!410967 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410961 () (_ BitVec 64))

(assert (=> b!913696 (= lt!410961 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410965 () Unit!30850)

(declare-fun addStillContains!350 (ListLongMap!11281 (_ BitVec 64) V!30503 (_ BitVec 64)) Unit!30850)

(assert (=> b!913696 (= lt!410965 (addStillContains!350 lt!410949 lt!410967 zeroValue!1094 lt!410961))))

(assert (=> b!913696 (contains!4662 (+!2635 lt!410949 (tuple2!12595 lt!410967 zeroValue!1094)) lt!410961)))

(declare-fun lt!410951 () Unit!30850)

(assert (=> b!913696 (= lt!410951 lt!410965)))

(declare-fun lt!410948 () ListLongMap!11281)

(assert (=> b!913696 (= lt!410948 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410964 () (_ BitVec 64))

(assert (=> b!913696 (= lt!410964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410966 () (_ BitVec 64))

(assert (=> b!913696 (= lt!410966 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410957 () Unit!30850)

(declare-fun addApplyDifferent!350 (ListLongMap!11281 (_ BitVec 64) V!30503 (_ BitVec 64)) Unit!30850)

(assert (=> b!913696 (= lt!410957 (addApplyDifferent!350 lt!410948 lt!410964 minValue!1094 lt!410966))))

(assert (=> b!913696 (= (apply!521 (+!2635 lt!410948 (tuple2!12595 lt!410964 minValue!1094)) lt!410966) (apply!521 lt!410948 lt!410966))))

(declare-fun lt!410954 () Unit!30850)

(assert (=> b!913696 (= lt!410954 lt!410957)))

(declare-fun lt!410963 () ListLongMap!11281)

(assert (=> b!913696 (= lt!410963 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410959 () (_ BitVec 64))

(assert (=> b!913696 (= lt!410959 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410955 () (_ BitVec 64))

(assert (=> b!913696 (= lt!410955 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410958 () Unit!30850)

(assert (=> b!913696 (= lt!410958 (addApplyDifferent!350 lt!410963 lt!410959 zeroValue!1094 lt!410955))))

(assert (=> b!913696 (= (apply!521 (+!2635 lt!410963 (tuple2!12595 lt!410959 zeroValue!1094)) lt!410955) (apply!521 lt!410963 lt!410955))))

(declare-fun lt!410953 () Unit!30850)

(assert (=> b!913696 (= lt!410953 lt!410958)))

(declare-fun lt!410956 () ListLongMap!11281)

(assert (=> b!913696 (= lt!410956 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410969 () (_ BitVec 64))

(assert (=> b!913696 (= lt!410969 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410962 () (_ BitVec 64))

(assert (=> b!913696 (= lt!410962 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!913696 (= lt!410960 (addApplyDifferent!350 lt!410956 lt!410969 minValue!1094 lt!410962))))

(assert (=> b!913696 (= (apply!521 (+!2635 lt!410956 (tuple2!12595 lt!410969 minValue!1094)) lt!410962) (apply!521 lt!410956 lt!410962))))

(declare-fun b!913697 () Bool)

(declare-fun e!512525 () Bool)

(assert (=> b!913697 (= e!512525 (= (apply!521 lt!410950 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)) (get!13703 (select (arr!26104 _values!1152) #b00000000000000000000000000000000) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913697 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26565 _values!1152)))))

(assert (=> b!913697 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26564 _keys!1386)))))

(declare-fun bm!40453 () Bool)

(assert (=> bm!40453 (= call!40456 call!40458)))

(declare-fun bm!40454 () Bool)

(assert (=> bm!40454 (= call!40457 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!913698 () Bool)

(declare-fun e!512518 () Bool)

(assert (=> b!913698 (= e!512518 e!512525)))

(declare-fun res!616294 () Bool)

(assert (=> b!913698 (=> (not res!616294) (not e!512525))))

(assert (=> b!913698 (= res!616294 (contains!4662 lt!410950 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26564 _keys!1386)))))

(declare-fun b!913699 () Bool)

(assert (=> b!913699 (= e!512522 (not call!40453))))

(declare-fun b!913700 () Bool)

(assert (=> b!913700 (= e!512522 e!512516)))

(declare-fun res!616298 () Bool)

(assert (=> b!913700 (= res!616298 call!40453)))

(assert (=> b!913700 (=> (not res!616298) (not e!512516))))

(declare-fun d!112317 () Bool)

(assert (=> d!112317 e!512519))

(declare-fun res!616297 () Bool)

(assert (=> d!112317 (=> (not res!616297) (not e!512519))))

(assert (=> d!112317 (= res!616297 (or (bvsge #b00000000000000000000000000000000 (size!26564 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26564 _keys!1386)))))))

(declare-fun lt!410968 () ListLongMap!11281)

(assert (=> d!112317 (= lt!410950 lt!410968)))

(declare-fun lt!410952 () Unit!30850)

(assert (=> d!112317 (= lt!410952 e!512515)))

(declare-fun c!95873 () Bool)

(declare-fun e!512524 () Bool)

(assert (=> d!112317 (= c!95873 e!512524)))

(declare-fun res!616292 () Bool)

(assert (=> d!112317 (=> (not res!616292) (not e!512524))))

(assert (=> d!112317 (= res!616292 (bvslt #b00000000000000000000000000000000 (size!26564 _keys!1386)))))

(assert (=> d!112317 (= lt!410968 e!512526)))

(assert (=> d!112317 (= c!95878 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112317 (validMask!0 mask!1756)))

(assert (=> d!112317 (= (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410950)))

(declare-fun b!913691 () Bool)

(declare-fun res!616293 () Bool)

(assert (=> b!913691 (=> (not res!616293) (not e!512519))))

(assert (=> b!913691 (= res!616293 e!512520)))

(declare-fun c!95876 () Bool)

(assert (=> b!913691 (= c!95876 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40455 () Bool)

(assert (=> bm!40455 (= call!40454 (contains!4662 lt!410950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913701 () Bool)

(declare-fun res!616296 () Bool)

(assert (=> b!913701 (=> (not res!616296) (not e!512519))))

(assert (=> b!913701 (= res!616296 e!512518)))

(declare-fun res!616291 () Bool)

(assert (=> b!913701 (=> res!616291 e!512518)))

(assert (=> b!913701 (= res!616291 (not e!512521))))

(declare-fun res!616295 () Bool)

(assert (=> b!913701 (=> (not res!616295) (not e!512521))))

(assert (=> b!913701 (= res!616295 (bvslt #b00000000000000000000000000000000 (size!26564 _keys!1386)))))

(declare-fun bm!40456 () Bool)

(assert (=> bm!40456 (= call!40455 call!40459)))

(declare-fun b!913702 () Bool)

(assert (=> b!913702 (= e!512524 (validKeyInArray!0 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112317 c!95878) b!913694))

(assert (= (and d!112317 (not c!95878)) b!913689))

(assert (= (and b!913689 c!95875) b!913683))

(assert (= (and b!913689 (not c!95875)) b!913686))

(assert (= (and b!913686 c!95874) b!913693))

(assert (= (and b!913686 (not c!95874)) b!913684))

(assert (= (or b!913693 b!913684) bm!40456))

(assert (= (or b!913683 bm!40456) bm!40452))

(assert (= (or b!913683 b!913693) bm!40453))

(assert (= (or b!913694 bm!40452) bm!40454))

(assert (= (or b!913694 bm!40453) bm!40451))

(assert (= (and d!112317 res!616292) b!913702))

(assert (= (and d!112317 c!95873) b!913696))

(assert (= (and d!112317 (not c!95873)) b!913687))

(assert (= (and d!112317 res!616297) b!913701))

(assert (= (and b!913701 res!616295) b!913690))

(assert (= (and b!913701 (not res!616291)) b!913698))

(assert (= (and b!913698 res!616294) b!913697))

(assert (= (and b!913701 res!616296) b!913691))

(assert (= (and b!913691 c!95876) b!913695))

(assert (= (and b!913691 (not c!95876)) b!913688))

(assert (= (and b!913695 res!616290) b!913682))

(assert (= (or b!913695 b!913688) bm!40455))

(assert (= (and b!913691 res!616293) b!913692))

(assert (= (and b!913692 c!95877) b!913700))

(assert (= (and b!913692 (not c!95877)) b!913699))

(assert (= (and b!913700 res!616298) b!913685))

(assert (= (or b!913700 b!913699) bm!40450))

(declare-fun b_lambda!13329 () Bool)

(assert (=> (not b_lambda!13329) (not b!913697)))

(assert (=> b!913697 t!25958))

(declare-fun b_and!27311 () Bool)

(assert (= b_and!27301 (and (=> t!25958 result!10691) b_and!27311)))

(declare-fun m!847643 () Bool)

(assert (=> b!913682 m!847643))

(declare-fun m!847645 () Bool)

(assert (=> b!913697 m!847645))

(assert (=> b!913697 m!847623))

(assert (=> b!913697 m!847623))

(declare-fun m!847647 () Bool)

(assert (=> b!913697 m!847647))

(assert (=> b!913697 m!847645))

(assert (=> b!913697 m!847529))

(declare-fun m!847649 () Bool)

(assert (=> b!913697 m!847649))

(assert (=> b!913697 m!847529))

(declare-fun m!847651 () Bool)

(assert (=> bm!40454 m!847651))

(declare-fun m!847653 () Bool)

(assert (=> bm!40451 m!847653))

(assert (=> d!112317 m!847545))

(assert (=> b!913690 m!847623))

(assert (=> b!913690 m!847623))

(assert (=> b!913690 m!847631))

(declare-fun m!847655 () Bool)

(assert (=> b!913694 m!847655))

(declare-fun m!847657 () Bool)

(assert (=> b!913696 m!847657))

(declare-fun m!847659 () Bool)

(assert (=> b!913696 m!847659))

(declare-fun m!847661 () Bool)

(assert (=> b!913696 m!847661))

(declare-fun m!847663 () Bool)

(assert (=> b!913696 m!847663))

(declare-fun m!847665 () Bool)

(assert (=> b!913696 m!847665))

(declare-fun m!847667 () Bool)

(assert (=> b!913696 m!847667))

(assert (=> b!913696 m!847657))

(declare-fun m!847669 () Bool)

(assert (=> b!913696 m!847669))

(declare-fun m!847671 () Bool)

(assert (=> b!913696 m!847671))

(assert (=> b!913696 m!847661))

(declare-fun m!847673 () Bool)

(assert (=> b!913696 m!847673))

(assert (=> b!913696 m!847623))

(declare-fun m!847675 () Bool)

(assert (=> b!913696 m!847675))

(declare-fun m!847677 () Bool)

(assert (=> b!913696 m!847677))

(assert (=> b!913696 m!847669))

(declare-fun m!847679 () Bool)

(assert (=> b!913696 m!847679))

(assert (=> b!913696 m!847651))

(assert (=> b!913696 m!847679))

(declare-fun m!847681 () Bool)

(assert (=> b!913696 m!847681))

(declare-fun m!847683 () Bool)

(assert (=> b!913696 m!847683))

(declare-fun m!847685 () Bool)

(assert (=> b!913696 m!847685))

(declare-fun m!847687 () Bool)

(assert (=> bm!40455 m!847687))

(declare-fun m!847689 () Bool)

(assert (=> b!913685 m!847689))

(declare-fun m!847691 () Bool)

(assert (=> bm!40450 m!847691))

(assert (=> b!913702 m!847623))

(assert (=> b!913702 m!847623))

(assert (=> b!913702 m!847631))

(assert (=> b!913698 m!847623))

(assert (=> b!913698 m!847623))

(declare-fun m!847693 () Bool)

(assert (=> b!913698 m!847693))

(assert (=> b!913522 d!112317))

(declare-fun b!913711 () Bool)

(declare-fun e!512535 () Bool)

(declare-fun e!512533 () Bool)

(assert (=> b!913711 (= e!512535 e!512533)))

(declare-fun lt!410978 () (_ BitVec 64))

(assert (=> b!913711 (= lt!410978 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410977 () Unit!30850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54301 (_ BitVec 64) (_ BitVec 32)) Unit!30850)

(assert (=> b!913711 (= lt!410977 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410978 #b00000000000000000000000000000000))))

(assert (=> b!913711 (arrayContainsKey!0 _keys!1386 lt!410978 #b00000000000000000000000000000000)))

(declare-fun lt!410976 () Unit!30850)

(assert (=> b!913711 (= lt!410976 lt!410977)))

(declare-fun res!616303 () Bool)

(declare-datatypes ((SeekEntryResult!8970 0))(
  ( (MissingZero!8970 (index!38251 (_ BitVec 32))) (Found!8970 (index!38252 (_ BitVec 32))) (Intermediate!8970 (undefined!9782 Bool) (index!38253 (_ BitVec 32)) (x!78163 (_ BitVec 32))) (Undefined!8970) (MissingVacant!8970 (index!38254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54301 (_ BitVec 32)) SeekEntryResult!8970)

(assert (=> b!913711 (= res!616303 (= (seekEntryOrOpen!0 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8970 #b00000000000000000000000000000000)))))

(assert (=> b!913711 (=> (not res!616303) (not e!512533))))

(declare-fun b!913712 () Bool)

(declare-fun e!512534 () Bool)

(assert (=> b!913712 (= e!512534 e!512535)))

(declare-fun c!95881 () Bool)

(assert (=> b!913712 (= c!95881 (validKeyInArray!0 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112319 () Bool)

(declare-fun res!616304 () Bool)

(assert (=> d!112319 (=> res!616304 e!512534)))

(assert (=> d!112319 (= res!616304 (bvsge #b00000000000000000000000000000000 (size!26564 _keys!1386)))))

(assert (=> d!112319 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!512534)))

(declare-fun bm!40459 () Bool)

(declare-fun call!40462 () Bool)

(assert (=> bm!40459 (= call!40462 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!913713 () Bool)

(assert (=> b!913713 (= e!512535 call!40462)))

(declare-fun b!913714 () Bool)

(assert (=> b!913714 (= e!512533 call!40462)))

(assert (= (and d!112319 (not res!616304)) b!913712))

(assert (= (and b!913712 c!95881) b!913711))

(assert (= (and b!913712 (not c!95881)) b!913713))

(assert (= (and b!913711 res!616303) b!913714))

(assert (= (or b!913714 b!913713) bm!40459))

(assert (=> b!913711 m!847623))

(declare-fun m!847695 () Bool)

(assert (=> b!913711 m!847695))

(declare-fun m!847697 () Bool)

(assert (=> b!913711 m!847697))

(assert (=> b!913711 m!847623))

(declare-fun m!847699 () Bool)

(assert (=> b!913711 m!847699))

(assert (=> b!913712 m!847623))

(assert (=> b!913712 m!847623))

(assert (=> b!913712 m!847631))

(declare-fun m!847701 () Bool)

(assert (=> bm!40459 m!847701))

(assert (=> b!913516 d!112319))

(declare-fun d!112321 () Bool)

(declare-fun e!512536 () Bool)

(assert (=> d!112321 e!512536))

(declare-fun res!616305 () Bool)

(assert (=> d!112321 (=> res!616305 e!512536)))

(declare-fun lt!410982 () Bool)

(assert (=> d!112321 (= res!616305 (not lt!410982))))

(declare-fun lt!410979 () Bool)

(assert (=> d!112321 (= lt!410982 lt!410979)))

(declare-fun lt!410981 () Unit!30850)

(declare-fun e!512537 () Unit!30850)

(assert (=> d!112321 (= lt!410981 e!512537)))

(declare-fun c!95882 () Bool)

(assert (=> d!112321 (= c!95882 lt!410979)))

(assert (=> d!112321 (= lt!410979 (containsKey!443 (toList!5656 lt!410875) k0!1033))))

(assert (=> d!112321 (= (contains!4662 lt!410875 k0!1033) lt!410982)))

(declare-fun b!913715 () Bool)

(declare-fun lt!410980 () Unit!30850)

(assert (=> b!913715 (= e!512537 lt!410980)))

(assert (=> b!913715 (= lt!410980 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 lt!410875) k0!1033))))

(assert (=> b!913715 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410875) k0!1033))))

(declare-fun b!913716 () Bool)

(declare-fun Unit!30856 () Unit!30850)

(assert (=> b!913716 (= e!512537 Unit!30856)))

(declare-fun b!913717 () Bool)

(assert (=> b!913717 (= e!512536 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410875) k0!1033)))))

(assert (= (and d!112321 c!95882) b!913715))

(assert (= (and d!112321 (not c!95882)) b!913716))

(assert (= (and d!112321 (not res!616305)) b!913717))

(declare-fun m!847703 () Bool)

(assert (=> d!112321 m!847703))

(declare-fun m!847705 () Bool)

(assert (=> b!913715 m!847705))

(declare-fun m!847707 () Bool)

(assert (=> b!913715 m!847707))

(assert (=> b!913715 m!847707))

(declare-fun m!847709 () Bool)

(assert (=> b!913715 m!847709))

(assert (=> b!913717 m!847707))

(assert (=> b!913717 m!847707))

(assert (=> b!913717 m!847709))

(assert (=> b!913520 d!112321))

(declare-fun b!913718 () Bool)

(declare-fun e!512538 () Bool)

(declare-fun lt!410985 () ListLongMap!11281)

(assert (=> b!913718 (= e!512538 (= (apply!521 lt!410985 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!913719 () Bool)

(declare-fun e!512541 () ListLongMap!11281)

(declare-fun call!40466 () ListLongMap!11281)

(assert (=> b!913719 (= e!512541 call!40466)))

(declare-fun b!913720 () Bool)

(declare-fun e!512547 () ListLongMap!11281)

(declare-fun call!40465 () ListLongMap!11281)

(assert (=> b!913720 (= e!512547 call!40465)))

(declare-fun b!913721 () Bool)

(declare-fun e!512540 () Bool)

(assert (=> b!913721 (= e!512540 (= (apply!521 lt!410985 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!913722 () Bool)

(declare-fun c!95884 () Bool)

(assert (=> b!913722 (= c!95884 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!913722 (= e!512541 e!512547)))

(declare-fun b!913723 () Bool)

(declare-fun e!512539 () Unit!30850)

(declare-fun Unit!30857 () Unit!30850)

(assert (=> b!913723 (= e!512539 Unit!30857)))

(declare-fun b!913724 () Bool)

(declare-fun e!512544 () Bool)

(declare-fun call!40464 () Bool)

(assert (=> b!913724 (= e!512544 (not call!40464))))

(declare-fun bm!40460 () Bool)

(declare-fun call!40463 () Bool)

(assert (=> bm!40460 (= call!40463 (contains!4662 lt!410985 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913725 () Bool)

(declare-fun e!512550 () ListLongMap!11281)

(assert (=> b!913725 (= e!512550 e!512541)))

(declare-fun c!95885 () Bool)

(assert (=> b!913725 (= c!95885 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913726 () Bool)

(declare-fun e!512545 () Bool)

(assert (=> b!913726 (= e!512545 (validKeyInArray!0 (select (arr!26103 _keys!1386) i!717)))))

(declare-fun b!913728 () Bool)

(declare-fun e!512543 () Bool)

(declare-fun e!512546 () Bool)

(assert (=> b!913728 (= e!512543 e!512546)))

(declare-fun c!95887 () Bool)

(assert (=> b!913728 (= c!95887 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913729 () Bool)

(assert (=> b!913729 (= e!512547 call!40466)))

(declare-fun bm!40461 () Bool)

(declare-fun call!40469 () ListLongMap!11281)

(declare-fun call!40467 () ListLongMap!11281)

(declare-fun c!95888 () Bool)

(declare-fun call!40468 () ListLongMap!11281)

(assert (=> bm!40461 (= call!40468 (+!2635 (ite c!95888 call!40467 (ite c!95885 call!40469 call!40465)) (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!913730 () Bool)

(assert (=> b!913730 (= e!512550 (+!2635 call!40468 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun bm!40462 () Bool)

(assert (=> bm!40462 (= call!40469 call!40467)))

(declare-fun b!913731 () Bool)

(assert (=> b!913731 (= e!512544 e!512538)))

(declare-fun res!616306 () Bool)

(assert (=> b!913731 (= res!616306 call!40464)))

(assert (=> b!913731 (=> (not res!616306) (not e!512538))))

(declare-fun b!913732 () Bool)

(declare-fun lt!410995 () Unit!30850)

(assert (=> b!913732 (= e!512539 lt!410995)))

(declare-fun lt!410984 () ListLongMap!11281)

(assert (=> b!913732 (= lt!410984 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411002 () (_ BitVec 64))

(assert (=> b!913732 (= lt!411002 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410996 () (_ BitVec 64))

(assert (=> b!913732 (= lt!410996 (select (arr!26103 _keys!1386) i!717))))

(declare-fun lt!411000 () Unit!30850)

(assert (=> b!913732 (= lt!411000 (addStillContains!350 lt!410984 lt!411002 zeroValue!1094 lt!410996))))

(assert (=> b!913732 (contains!4662 (+!2635 lt!410984 (tuple2!12595 lt!411002 zeroValue!1094)) lt!410996)))

(declare-fun lt!410986 () Unit!30850)

(assert (=> b!913732 (= lt!410986 lt!411000)))

(declare-fun lt!410983 () ListLongMap!11281)

(assert (=> b!913732 (= lt!410983 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!410999 () (_ BitVec 64))

(assert (=> b!913732 (= lt!410999 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411001 () (_ BitVec 64))

(assert (=> b!913732 (= lt!411001 (select (arr!26103 _keys!1386) i!717))))

(declare-fun lt!410992 () Unit!30850)

(assert (=> b!913732 (= lt!410992 (addApplyDifferent!350 lt!410983 lt!410999 minValue!1094 lt!411001))))

(assert (=> b!913732 (= (apply!521 (+!2635 lt!410983 (tuple2!12595 lt!410999 minValue!1094)) lt!411001) (apply!521 lt!410983 lt!411001))))

(declare-fun lt!410989 () Unit!30850)

(assert (=> b!913732 (= lt!410989 lt!410992)))

(declare-fun lt!410998 () ListLongMap!11281)

(assert (=> b!913732 (= lt!410998 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!410994 () (_ BitVec 64))

(assert (=> b!913732 (= lt!410994 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410990 () (_ BitVec 64))

(assert (=> b!913732 (= lt!410990 (select (arr!26103 _keys!1386) i!717))))

(declare-fun lt!410993 () Unit!30850)

(assert (=> b!913732 (= lt!410993 (addApplyDifferent!350 lt!410998 lt!410994 zeroValue!1094 lt!410990))))

(assert (=> b!913732 (= (apply!521 (+!2635 lt!410998 (tuple2!12595 lt!410994 zeroValue!1094)) lt!410990) (apply!521 lt!410998 lt!410990))))

(declare-fun lt!410988 () Unit!30850)

(assert (=> b!913732 (= lt!410988 lt!410993)))

(declare-fun lt!410991 () ListLongMap!11281)

(assert (=> b!913732 (= lt!410991 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411004 () (_ BitVec 64))

(assert (=> b!913732 (= lt!411004 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410997 () (_ BitVec 64))

(assert (=> b!913732 (= lt!410997 (select (arr!26103 _keys!1386) i!717))))

(assert (=> b!913732 (= lt!410995 (addApplyDifferent!350 lt!410991 lt!411004 minValue!1094 lt!410997))))

(assert (=> b!913732 (= (apply!521 (+!2635 lt!410991 (tuple2!12595 lt!411004 minValue!1094)) lt!410997) (apply!521 lt!410991 lt!410997))))

(declare-fun b!913733 () Bool)

(declare-fun e!512549 () Bool)

(assert (=> b!913733 (= e!512549 (= (apply!521 lt!410985 (select (arr!26103 _keys!1386) i!717)) (get!13703 (select (arr!26104 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913733 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26565 _values!1152)))))

(assert (=> b!913733 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26564 _keys!1386)))))

(declare-fun bm!40463 () Bool)

(assert (=> bm!40463 (= call!40466 call!40468)))

(declare-fun bm!40464 () Bool)

(assert (=> bm!40464 (= call!40467 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!913734 () Bool)

(declare-fun e!512542 () Bool)

(assert (=> b!913734 (= e!512542 e!512549)))

(declare-fun res!616310 () Bool)

(assert (=> b!913734 (=> (not res!616310) (not e!512549))))

(assert (=> b!913734 (= res!616310 (contains!4662 lt!410985 (select (arr!26103 _keys!1386) i!717)))))

(assert (=> b!913734 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26564 _keys!1386)))))

(declare-fun b!913735 () Bool)

(assert (=> b!913735 (= e!512546 (not call!40463))))

(declare-fun b!913736 () Bool)

(assert (=> b!913736 (= e!512546 e!512540)))

(declare-fun res!616314 () Bool)

(assert (=> b!913736 (= res!616314 call!40463)))

(assert (=> b!913736 (=> (not res!616314) (not e!512540))))

(declare-fun d!112323 () Bool)

(assert (=> d!112323 e!512543))

(declare-fun res!616313 () Bool)

(assert (=> d!112323 (=> (not res!616313) (not e!512543))))

(assert (=> d!112323 (= res!616313 (or (bvsge i!717 (size!26564 _keys!1386)) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26564 _keys!1386)))))))

(declare-fun lt!411003 () ListLongMap!11281)

(assert (=> d!112323 (= lt!410985 lt!411003)))

(declare-fun lt!410987 () Unit!30850)

(assert (=> d!112323 (= lt!410987 e!512539)))

(declare-fun c!95883 () Bool)

(declare-fun e!512548 () Bool)

(assert (=> d!112323 (= c!95883 e!512548)))

(declare-fun res!616308 () Bool)

(assert (=> d!112323 (=> (not res!616308) (not e!512548))))

(assert (=> d!112323 (= res!616308 (bvslt i!717 (size!26564 _keys!1386)))))

(assert (=> d!112323 (= lt!411003 e!512550)))

(assert (=> d!112323 (= c!95888 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112323 (validMask!0 mask!1756)))

(assert (=> d!112323 (= (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!410985)))

(declare-fun b!913727 () Bool)

(declare-fun res!616309 () Bool)

(assert (=> b!913727 (=> (not res!616309) (not e!512543))))

(assert (=> b!913727 (= res!616309 e!512544)))

(declare-fun c!95886 () Bool)

(assert (=> b!913727 (= c!95886 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40465 () Bool)

(assert (=> bm!40465 (= call!40464 (contains!4662 lt!410985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913737 () Bool)

(declare-fun res!616312 () Bool)

(assert (=> b!913737 (=> (not res!616312) (not e!512543))))

(assert (=> b!913737 (= res!616312 e!512542)))

(declare-fun res!616307 () Bool)

(assert (=> b!913737 (=> res!616307 e!512542)))

(assert (=> b!913737 (= res!616307 (not e!512545))))

(declare-fun res!616311 () Bool)

(assert (=> b!913737 (=> (not res!616311) (not e!512545))))

(assert (=> b!913737 (= res!616311 (bvslt i!717 (size!26564 _keys!1386)))))

(declare-fun bm!40466 () Bool)

(assert (=> bm!40466 (= call!40465 call!40469)))

(declare-fun b!913738 () Bool)

(assert (=> b!913738 (= e!512548 (validKeyInArray!0 (select (arr!26103 _keys!1386) i!717)))))

(assert (= (and d!112323 c!95888) b!913730))

(assert (= (and d!112323 (not c!95888)) b!913725))

(assert (= (and b!913725 c!95885) b!913719))

(assert (= (and b!913725 (not c!95885)) b!913722))

(assert (= (and b!913722 c!95884) b!913729))

(assert (= (and b!913722 (not c!95884)) b!913720))

(assert (= (or b!913729 b!913720) bm!40466))

(assert (= (or b!913719 bm!40466) bm!40462))

(assert (= (or b!913719 b!913729) bm!40463))

(assert (= (or b!913730 bm!40462) bm!40464))

(assert (= (or b!913730 bm!40463) bm!40461))

(assert (= (and d!112323 res!616308) b!913738))

(assert (= (and d!112323 c!95883) b!913732))

(assert (= (and d!112323 (not c!95883)) b!913723))

(assert (= (and d!112323 res!616313) b!913737))

(assert (= (and b!913737 res!616311) b!913726))

(assert (= (and b!913737 (not res!616307)) b!913734))

(assert (= (and b!913734 res!616310) b!913733))

(assert (= (and b!913737 res!616312) b!913727))

(assert (= (and b!913727 c!95886) b!913731))

(assert (= (and b!913727 (not c!95886)) b!913724))

(assert (= (and b!913731 res!616306) b!913718))

(assert (= (or b!913731 b!913724) bm!40465))

(assert (= (and b!913727 res!616309) b!913728))

(assert (= (and b!913728 c!95887) b!913736))

(assert (= (and b!913728 (not c!95887)) b!913735))

(assert (= (and b!913736 res!616314) b!913721))

(assert (= (or b!913736 b!913735) bm!40460))

(declare-fun b_lambda!13331 () Bool)

(assert (=> (not b_lambda!13331) (not b!913733)))

(assert (=> b!913733 t!25958))

(declare-fun b_and!27313 () Bool)

(assert (= b_and!27311 (and (=> t!25958 result!10691) b_and!27313)))

(declare-fun m!847711 () Bool)

(assert (=> b!913718 m!847711))

(assert (=> b!913733 m!847527))

(assert (=> b!913733 m!847543))

(assert (=> b!913733 m!847543))

(declare-fun m!847713 () Bool)

(assert (=> b!913733 m!847713))

(assert (=> b!913733 m!847527))

(assert (=> b!913733 m!847529))

(assert (=> b!913733 m!847531))

(assert (=> b!913733 m!847529))

(declare-fun m!847715 () Bool)

(assert (=> bm!40464 m!847715))

(declare-fun m!847717 () Bool)

(assert (=> bm!40461 m!847717))

(assert (=> d!112323 m!847545))

(assert (=> b!913726 m!847543))

(assert (=> b!913726 m!847543))

(declare-fun m!847719 () Bool)

(assert (=> b!913726 m!847719))

(declare-fun m!847721 () Bool)

(assert (=> b!913730 m!847721))

(declare-fun m!847723 () Bool)

(assert (=> b!913732 m!847723))

(declare-fun m!847725 () Bool)

(assert (=> b!913732 m!847725))

(declare-fun m!847727 () Bool)

(assert (=> b!913732 m!847727))

(declare-fun m!847729 () Bool)

(assert (=> b!913732 m!847729))

(declare-fun m!847731 () Bool)

(assert (=> b!913732 m!847731))

(declare-fun m!847733 () Bool)

(assert (=> b!913732 m!847733))

(assert (=> b!913732 m!847723))

(declare-fun m!847735 () Bool)

(assert (=> b!913732 m!847735))

(declare-fun m!847737 () Bool)

(assert (=> b!913732 m!847737))

(assert (=> b!913732 m!847727))

(declare-fun m!847739 () Bool)

(assert (=> b!913732 m!847739))

(assert (=> b!913732 m!847543))

(declare-fun m!847741 () Bool)

(assert (=> b!913732 m!847741))

(declare-fun m!847743 () Bool)

(assert (=> b!913732 m!847743))

(assert (=> b!913732 m!847735))

(declare-fun m!847745 () Bool)

(assert (=> b!913732 m!847745))

(assert (=> b!913732 m!847715))

(assert (=> b!913732 m!847745))

(declare-fun m!847747 () Bool)

(assert (=> b!913732 m!847747))

(declare-fun m!847749 () Bool)

(assert (=> b!913732 m!847749))

(declare-fun m!847751 () Bool)

(assert (=> b!913732 m!847751))

(declare-fun m!847753 () Bool)

(assert (=> bm!40465 m!847753))

(declare-fun m!847755 () Bool)

(assert (=> b!913721 m!847755))

(declare-fun m!847757 () Bool)

(assert (=> bm!40460 m!847757))

(assert (=> b!913738 m!847543))

(assert (=> b!913738 m!847543))

(assert (=> b!913738 m!847719))

(assert (=> b!913734 m!847543))

(assert (=> b!913734 m!847543))

(declare-fun m!847759 () Bool)

(assert (=> b!913734 m!847759))

(assert (=> b!913520 d!112323))

(declare-fun d!112325 () Bool)

(declare-fun get!13705 (Option!485) V!30503)

(assert (=> d!112325 (= (apply!521 lt!410875 k0!1033) (get!13705 (getValueByKey!479 (toList!5656 lt!410875) k0!1033)))))

(declare-fun bs!25678 () Bool)

(assert (= bs!25678 d!112325))

(assert (=> bs!25678 m!847707))

(assert (=> bs!25678 m!847707))

(declare-fun m!847761 () Bool)

(assert (=> bs!25678 m!847761))

(assert (=> b!913521 d!112325))

(declare-fun d!112327 () Bool)

(declare-fun c!95891 () Bool)

(assert (=> d!112327 (= c!95891 ((_ is ValueCellFull!9095) (select (arr!26104 _values!1152) i!717)))))

(declare-fun e!512553 () V!30503)

(assert (=> d!112327 (= (get!13703 (select (arr!26104 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!512553)))

(declare-fun b!913743 () Bool)

(declare-fun get!13706 (ValueCell!9095 V!30503) V!30503)

(assert (=> b!913743 (= e!512553 (get!13706 (select (arr!26104 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!913744 () Bool)

(declare-fun get!13707 (ValueCell!9095 V!30503) V!30503)

(assert (=> b!913744 (= e!512553 (get!13707 (select (arr!26104 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112327 c!95891) b!913743))

(assert (= (and d!112327 (not c!95891)) b!913744))

(assert (=> b!913743 m!847527))

(assert (=> b!913743 m!847529))

(declare-fun m!847763 () Bool)

(assert (=> b!913743 m!847763))

(assert (=> b!913744 m!847527))

(assert (=> b!913744 m!847529))

(declare-fun m!847765 () Bool)

(assert (=> b!913744 m!847765))

(assert (=> b!913521 d!112327))

(declare-fun mapNonEmpty!30473 () Bool)

(declare-fun mapRes!30473 () Bool)

(declare-fun tp!58505 () Bool)

(declare-fun e!512559 () Bool)

(assert (=> mapNonEmpty!30473 (= mapRes!30473 (and tp!58505 e!512559))))

(declare-fun mapKey!30473 () (_ BitVec 32))

(declare-fun mapValue!30473 () ValueCell!9095)

(declare-fun mapRest!30473 () (Array (_ BitVec 32) ValueCell!9095))

(assert (=> mapNonEmpty!30473 (= mapRest!30464 (store mapRest!30473 mapKey!30473 mapValue!30473))))

(declare-fun condMapEmpty!30473 () Bool)

(declare-fun mapDefault!30473 () ValueCell!9095)

(assert (=> mapNonEmpty!30464 (= condMapEmpty!30473 (= mapRest!30464 ((as const (Array (_ BitVec 32) ValueCell!9095)) mapDefault!30473)))))

(declare-fun e!512558 () Bool)

(assert (=> mapNonEmpty!30464 (= tp!58489 (and e!512558 mapRes!30473))))

(declare-fun b!913752 () Bool)

(assert (=> b!913752 (= e!512558 tp_is_empty!19153)))

(declare-fun mapIsEmpty!30473 () Bool)

(assert (=> mapIsEmpty!30473 mapRes!30473))

(declare-fun b!913751 () Bool)

(assert (=> b!913751 (= e!512559 tp_is_empty!19153)))

(assert (= (and mapNonEmpty!30464 condMapEmpty!30473) mapIsEmpty!30473))

(assert (= (and mapNonEmpty!30464 (not condMapEmpty!30473)) mapNonEmpty!30473))

(assert (= (and mapNonEmpty!30473 ((_ is ValueCellFull!9095) mapValue!30473)) b!913751))

(assert (= (and mapNonEmpty!30464 ((_ is ValueCellFull!9095) mapDefault!30473)) b!913752))

(declare-fun m!847767 () Bool)

(assert (=> mapNonEmpty!30473 m!847767))

(declare-fun b_lambda!13333 () Bool)

(assert (= b_lambda!13329 (or (and start!78296 b_free!16735) b_lambda!13333)))

(declare-fun b_lambda!13335 () Bool)

(assert (= b_lambda!13331 (or (and start!78296 b_free!16735) b_lambda!13335)))

(check-sat (not b!913696) (not b!913697) (not b!913682) (not b!913639) (not d!112317) (not b!913721) (not bm!40454) (not d!112315) (not bm!40461) (not b!913734) (not bm!40464) (not b_lambda!13335) (not b!913629) (not bm!40450) (not b!913609) (not b_lambda!13333) (not b!913726) (not b_lambda!13327) (not b!913718) (not d!112321) (not b!913698) (not b!913733) (not b!913690) (not b!913738) (not b!913732) (not b!913730) (not b!913717) (not b!913637) b_and!27313 (not b!913626) (not b!913744) (not bm!40435) (not d!112323) tp_is_empty!19153 (not b!913702) (not bm!40455) (not b!913712) (not mapNonEmpty!30473) (not bm!40459) (not b!913743) (not d!112305) (not b!913694) (not bm!40465) (not b!913630) (not b_next!16735) (not d!112325) (not bm!40460) (not b!913614) (not b!913711) (not bm!40451) (not b!913685) (not b!913715))
(check-sat b_and!27313 (not b_next!16735))
(get-model)

(declare-fun d!112329 () Bool)

(assert (=> d!112329 (= (validKeyInArray!0 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)) (and (not (= (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913702 d!112329))

(assert (=> b!913630 d!112329))

(declare-fun d!112331 () Bool)

(assert (=> d!112331 (isDefined!351 (getValueByKey!479 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun lt!411007 () Unit!30850)

(declare-fun choose!1545 (List!18374 (_ BitVec 64)) Unit!30850)

(assert (=> d!112331 (= lt!411007 (choose!1545 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun e!512562 () Bool)

(assert (=> d!112331 e!512562))

(declare-fun res!616317 () Bool)

(assert (=> d!112331 (=> (not res!616317) (not e!512562))))

(declare-fun isStrictlySorted!498 (List!18374) Bool)

(assert (=> d!112331 (= res!616317 (isStrictlySorted!498 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))

(assert (=> d!112331 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) lt!411007)))

(declare-fun b!913755 () Bool)

(assert (=> b!913755 (= e!512562 (containsKey!443 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (= (and d!112331 res!616317) b!913755))

(assert (=> d!112331 m!847639))

(assert (=> d!112331 m!847639))

(assert (=> d!112331 m!847641))

(declare-fun m!847769 () Bool)

(assert (=> d!112331 m!847769))

(declare-fun m!847771 () Bool)

(assert (=> d!112331 m!847771))

(assert (=> b!913755 m!847635))

(assert (=> b!913637 d!112331))

(declare-fun d!112333 () Bool)

(declare-fun isEmpty!699 (Option!485) Bool)

(assert (=> d!112333 (= (isDefined!351 (getValueByKey!479 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)) (not (isEmpty!699 (getValueByKey!479 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))))

(declare-fun bs!25679 () Bool)

(assert (= bs!25679 d!112333))

(assert (=> bs!25679 m!847639))

(declare-fun m!847773 () Bool)

(assert (=> bs!25679 m!847773))

(assert (=> b!913637 d!112333))

(declare-fun b!913767 () Bool)

(declare-fun e!512568 () Option!485)

(assert (=> b!913767 (= e!512568 None!483)))

(declare-fun b!913766 () Bool)

(assert (=> b!913766 (= e!512568 (getValueByKey!479 (t!25960 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(declare-fun b!913764 () Bool)

(declare-fun e!512567 () Option!485)

(assert (=> b!913764 (= e!512567 (Some!484 (_2!6308 (h!19516 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))))

(declare-fun b!913765 () Bool)

(assert (=> b!913765 (= e!512567 e!512568)))

(declare-fun c!95897 () Bool)

(assert (=> b!913765 (= c!95897 (and ((_ is Cons!18370) (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (not (= (_1!6308 (h!19516 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033))))))

(declare-fun c!95896 () Bool)

(declare-fun d!112335 () Bool)

(assert (=> d!112335 (= c!95896 (and ((_ is Cons!18370) (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6308 (h!19516 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112335 (= (getValueByKey!479 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!512567)))

(assert (= (and d!112335 c!95896) b!913764))

(assert (= (and d!112335 (not c!95896)) b!913765))

(assert (= (and b!913765 c!95897) b!913766))

(assert (= (and b!913765 (not c!95897)) b!913767))

(declare-fun m!847775 () Bool)

(assert (=> b!913766 m!847775))

(assert (=> b!913637 d!112335))

(declare-fun d!112337 () Bool)

(declare-fun e!512571 () Bool)

(assert (=> d!112337 e!512571))

(declare-fun res!616322 () Bool)

(assert (=> d!112337 (=> (not res!616322) (not e!512571))))

(declare-fun lt!411017 () ListLongMap!11281)

(assert (=> d!112337 (= res!616322 (contains!4662 lt!411017 (_1!6308 (tuple2!12595 lt!411004 minValue!1094))))))

(declare-fun lt!411016 () List!18374)

(assert (=> d!112337 (= lt!411017 (ListLongMap!11282 lt!411016))))

(declare-fun lt!411018 () Unit!30850)

(declare-fun lt!411019 () Unit!30850)

(assert (=> d!112337 (= lt!411018 lt!411019)))

(assert (=> d!112337 (= (getValueByKey!479 lt!411016 (_1!6308 (tuple2!12595 lt!411004 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!411004 minValue!1094))))))

(declare-fun lemmaContainsTupThenGetReturnValue!254 (List!18374 (_ BitVec 64) V!30503) Unit!30850)

(assert (=> d!112337 (= lt!411019 (lemmaContainsTupThenGetReturnValue!254 lt!411016 (_1!6308 (tuple2!12595 lt!411004 minValue!1094)) (_2!6308 (tuple2!12595 lt!411004 minValue!1094))))))

(declare-fun insertStrictlySorted!311 (List!18374 (_ BitVec 64) V!30503) List!18374)

(assert (=> d!112337 (= lt!411016 (insertStrictlySorted!311 (toList!5656 lt!410991) (_1!6308 (tuple2!12595 lt!411004 minValue!1094)) (_2!6308 (tuple2!12595 lt!411004 minValue!1094))))))

(assert (=> d!112337 (= (+!2635 lt!410991 (tuple2!12595 lt!411004 minValue!1094)) lt!411017)))

(declare-fun b!913772 () Bool)

(declare-fun res!616323 () Bool)

(assert (=> b!913772 (=> (not res!616323) (not e!512571))))

(assert (=> b!913772 (= res!616323 (= (getValueByKey!479 (toList!5656 lt!411017) (_1!6308 (tuple2!12595 lt!411004 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!411004 minValue!1094)))))))

(declare-fun b!913773 () Bool)

(declare-fun contains!4665 (List!18374 tuple2!12594) Bool)

(assert (=> b!913773 (= e!512571 (contains!4665 (toList!5656 lt!411017) (tuple2!12595 lt!411004 minValue!1094)))))

(assert (= (and d!112337 res!616322) b!913772))

(assert (= (and b!913772 res!616323) b!913773))

(declare-fun m!847777 () Bool)

(assert (=> d!112337 m!847777))

(declare-fun m!847779 () Bool)

(assert (=> d!112337 m!847779))

(declare-fun m!847781 () Bool)

(assert (=> d!112337 m!847781))

(declare-fun m!847783 () Bool)

(assert (=> d!112337 m!847783))

(declare-fun m!847785 () Bool)

(assert (=> b!913772 m!847785))

(declare-fun m!847787 () Bool)

(assert (=> b!913773 m!847787))

(assert (=> b!913732 d!112337))

(declare-fun d!112339 () Bool)

(assert (=> d!112339 (= (apply!521 (+!2635 lt!410983 (tuple2!12595 lt!410999 minValue!1094)) lt!411001) (apply!521 lt!410983 lt!411001))))

(declare-fun lt!411022 () Unit!30850)

(declare-fun choose!1546 (ListLongMap!11281 (_ BitVec 64) V!30503 (_ BitVec 64)) Unit!30850)

(assert (=> d!112339 (= lt!411022 (choose!1546 lt!410983 lt!410999 minValue!1094 lt!411001))))

(declare-fun e!512574 () Bool)

(assert (=> d!112339 e!512574))

(declare-fun res!616326 () Bool)

(assert (=> d!112339 (=> (not res!616326) (not e!512574))))

(assert (=> d!112339 (= res!616326 (contains!4662 lt!410983 lt!411001))))

(assert (=> d!112339 (= (addApplyDifferent!350 lt!410983 lt!410999 minValue!1094 lt!411001) lt!411022)))

(declare-fun b!913777 () Bool)

(assert (=> b!913777 (= e!512574 (not (= lt!411001 lt!410999)))))

(assert (= (and d!112339 res!616326) b!913777))

(assert (=> d!112339 m!847723))

(assert (=> d!112339 m!847725))

(declare-fun m!847789 () Bool)

(assert (=> d!112339 m!847789))

(declare-fun m!847791 () Bool)

(assert (=> d!112339 m!847791))

(assert (=> d!112339 m!847723))

(assert (=> d!112339 m!847751))

(assert (=> b!913732 d!112339))

(declare-fun b!913802 () Bool)

(declare-fun e!512595 () ListLongMap!11281)

(assert (=> b!913802 (= e!512595 (ListLongMap!11282 Nil!18371))))

(declare-fun call!40472 () ListLongMap!11281)

(declare-fun bm!40469 () Bool)

(assert (=> bm!40469 (= call!40472 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun b!913803 () Bool)

(assert (=> b!913803 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26564 _keys!1386)))))

(assert (=> b!913803 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26565 _values!1152)))))

(declare-fun lt!411040 () ListLongMap!11281)

(declare-fun e!512589 () Bool)

(assert (=> b!913803 (= e!512589 (= (apply!521 lt!411040 (select (arr!26103 _keys!1386) i!717)) (get!13703 (select (arr!26104 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913804 () Bool)

(declare-fun e!512590 () ListLongMap!11281)

(assert (=> b!913804 (= e!512595 e!512590)))

(declare-fun c!95906 () Bool)

(assert (=> b!913804 (= c!95906 (validKeyInArray!0 (select (arr!26103 _keys!1386) i!717)))))

(declare-fun b!913805 () Bool)

(declare-fun e!512591 () Bool)

(assert (=> b!913805 (= e!512591 (validKeyInArray!0 (select (arr!26103 _keys!1386) i!717)))))

(assert (=> b!913805 (bvsge i!717 #b00000000000000000000000000000000)))

(declare-fun b!913806 () Bool)

(declare-fun e!512594 () Bool)

(assert (=> b!913806 (= e!512594 e!512589)))

(assert (=> b!913806 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26564 _keys!1386)))))

(declare-fun res!616337 () Bool)

(assert (=> b!913806 (= res!616337 (contains!4662 lt!411040 (select (arr!26103 _keys!1386) i!717)))))

(assert (=> b!913806 (=> (not res!616337) (not e!512589))))

(declare-fun b!913807 () Bool)

(assert (=> b!913807 (= e!512590 call!40472)))

(declare-fun b!913808 () Bool)

(declare-fun e!512592 () Bool)

(assert (=> b!913808 (= e!512594 e!512592)))

(declare-fun c!95909 () Bool)

(assert (=> b!913808 (= c!95909 (bvslt i!717 (size!26564 _keys!1386)))))

(declare-fun d!112341 () Bool)

(declare-fun e!512593 () Bool)

(assert (=> d!112341 e!512593))

(declare-fun res!616336 () Bool)

(assert (=> d!112341 (=> (not res!616336) (not e!512593))))

(assert (=> d!112341 (= res!616336 (not (contains!4662 lt!411040 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!112341 (= lt!411040 e!512595)))

(declare-fun c!95908 () Bool)

(assert (=> d!112341 (= c!95908 (bvsge i!717 (size!26564 _keys!1386)))))

(assert (=> d!112341 (validMask!0 mask!1756)))

(assert (=> d!112341 (= (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!411040)))

(declare-fun b!913809 () Bool)

(declare-fun isEmpty!700 (ListLongMap!11281) Bool)

(assert (=> b!913809 (= e!512592 (isEmpty!700 lt!411040))))

(declare-fun b!913810 () Bool)

(assert (=> b!913810 (= e!512593 e!512594)))

(declare-fun c!95907 () Bool)

(assert (=> b!913810 (= c!95907 e!512591)))

(declare-fun res!616338 () Bool)

(assert (=> b!913810 (=> (not res!616338) (not e!512591))))

(assert (=> b!913810 (= res!616338 (bvslt i!717 (size!26564 _keys!1386)))))

(declare-fun b!913811 () Bool)

(declare-fun lt!411041 () Unit!30850)

(declare-fun lt!411042 () Unit!30850)

(assert (=> b!913811 (= lt!411041 lt!411042)))

(declare-fun lt!411038 () ListLongMap!11281)

(declare-fun lt!411039 () (_ BitVec 64))

(declare-fun lt!411043 () V!30503)

(declare-fun lt!411037 () (_ BitVec 64))

(assert (=> b!913811 (not (contains!4662 (+!2635 lt!411038 (tuple2!12595 lt!411039 lt!411043)) lt!411037))))

(declare-fun addStillNotContains!220 (ListLongMap!11281 (_ BitVec 64) V!30503 (_ BitVec 64)) Unit!30850)

(assert (=> b!913811 (= lt!411042 (addStillNotContains!220 lt!411038 lt!411039 lt!411043 lt!411037))))

(assert (=> b!913811 (= lt!411037 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!913811 (= lt!411043 (get!13703 (select (arr!26104 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!913811 (= lt!411039 (select (arr!26103 _keys!1386) i!717))))

(assert (=> b!913811 (= lt!411038 call!40472)))

(assert (=> b!913811 (= e!512590 (+!2635 call!40472 (tuple2!12595 (select (arr!26103 _keys!1386) i!717) (get!13703 (select (arr!26104 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!913812 () Bool)

(assert (=> b!913812 (= e!512592 (= lt!411040 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160)))))

(declare-fun b!913813 () Bool)

(declare-fun res!616335 () Bool)

(assert (=> b!913813 (=> (not res!616335) (not e!512593))))

(assert (=> b!913813 (= res!616335 (not (contains!4662 lt!411040 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112341 c!95908) b!913802))

(assert (= (and d!112341 (not c!95908)) b!913804))

(assert (= (and b!913804 c!95906) b!913811))

(assert (= (and b!913804 (not c!95906)) b!913807))

(assert (= (or b!913811 b!913807) bm!40469))

(assert (= (and d!112341 res!616336) b!913813))

(assert (= (and b!913813 res!616335) b!913810))

(assert (= (and b!913810 res!616338) b!913805))

(assert (= (and b!913810 c!95907) b!913806))

(assert (= (and b!913810 (not c!95907)) b!913808))

(assert (= (and b!913806 res!616337) b!913803))

(assert (= (and b!913808 c!95909) b!913812))

(assert (= (and b!913808 (not c!95909)) b!913809))

(declare-fun b_lambda!13337 () Bool)

(assert (=> (not b_lambda!13337) (not b!913803)))

(assert (=> b!913803 t!25958))

(declare-fun b_and!27315 () Bool)

(assert (= b_and!27313 (and (=> t!25958 result!10691) b_and!27315)))

(declare-fun b_lambda!13339 () Bool)

(assert (=> (not b_lambda!13339) (not b!913811)))

(assert (=> b!913811 t!25958))

(declare-fun b_and!27317 () Bool)

(assert (= b_and!27315 (and (=> t!25958 result!10691) b_and!27317)))

(declare-fun m!847793 () Bool)

(assert (=> d!112341 m!847793))

(assert (=> d!112341 m!847545))

(declare-fun m!847795 () Bool)

(assert (=> b!913812 m!847795))

(declare-fun m!847797 () Bool)

(assert (=> b!913809 m!847797))

(assert (=> bm!40469 m!847795))

(assert (=> b!913804 m!847543))

(assert (=> b!913804 m!847543))

(assert (=> b!913804 m!847719))

(assert (=> b!913803 m!847527))

(assert (=> b!913803 m!847543))

(assert (=> b!913803 m!847543))

(declare-fun m!847799 () Bool)

(assert (=> b!913803 m!847799))

(assert (=> b!913803 m!847529))

(assert (=> b!913803 m!847527))

(assert (=> b!913803 m!847529))

(assert (=> b!913803 m!847531))

(assert (=> b!913806 m!847543))

(assert (=> b!913806 m!847543))

(declare-fun m!847801 () Bool)

(assert (=> b!913806 m!847801))

(assert (=> b!913811 m!847527))

(declare-fun m!847803 () Bool)

(assert (=> b!913811 m!847803))

(assert (=> b!913811 m!847529))

(declare-fun m!847805 () Bool)

(assert (=> b!913811 m!847805))

(assert (=> b!913811 m!847527))

(assert (=> b!913811 m!847529))

(assert (=> b!913811 m!847531))

(declare-fun m!847807 () Bool)

(assert (=> b!913811 m!847807))

(declare-fun m!847809 () Bool)

(assert (=> b!913811 m!847809))

(assert (=> b!913811 m!847543))

(assert (=> b!913811 m!847807))

(assert (=> b!913805 m!847543))

(assert (=> b!913805 m!847543))

(assert (=> b!913805 m!847719))

(declare-fun m!847811 () Bool)

(assert (=> b!913813 m!847811))

(assert (=> b!913732 d!112341))

(declare-fun d!112343 () Bool)

(assert (=> d!112343 (= (apply!521 (+!2635 lt!410998 (tuple2!12595 lt!410994 zeroValue!1094)) lt!410990) (get!13705 (getValueByKey!479 (toList!5656 (+!2635 lt!410998 (tuple2!12595 lt!410994 zeroValue!1094))) lt!410990)))))

(declare-fun bs!25680 () Bool)

(assert (= bs!25680 d!112343))

(declare-fun m!847813 () Bool)

(assert (=> bs!25680 m!847813))

(assert (=> bs!25680 m!847813))

(declare-fun m!847815 () Bool)

(assert (=> bs!25680 m!847815))

(assert (=> b!913732 d!112343))

(declare-fun d!112345 () Bool)

(assert (=> d!112345 (= (apply!521 lt!410991 lt!410997) (get!13705 (getValueByKey!479 (toList!5656 lt!410991) lt!410997)))))

(declare-fun bs!25681 () Bool)

(assert (= bs!25681 d!112345))

(declare-fun m!847817 () Bool)

(assert (=> bs!25681 m!847817))

(assert (=> bs!25681 m!847817))

(declare-fun m!847819 () Bool)

(assert (=> bs!25681 m!847819))

(assert (=> b!913732 d!112345))

(declare-fun d!112347 () Bool)

(assert (=> d!112347 (= (apply!521 (+!2635 lt!410991 (tuple2!12595 lt!411004 minValue!1094)) lt!410997) (get!13705 (getValueByKey!479 (toList!5656 (+!2635 lt!410991 (tuple2!12595 lt!411004 minValue!1094))) lt!410997)))))

(declare-fun bs!25682 () Bool)

(assert (= bs!25682 d!112347))

(declare-fun m!847821 () Bool)

(assert (=> bs!25682 m!847821))

(assert (=> bs!25682 m!847821))

(declare-fun m!847823 () Bool)

(assert (=> bs!25682 m!847823))

(assert (=> b!913732 d!112347))

(declare-fun d!112349 () Bool)

(declare-fun e!512596 () Bool)

(assert (=> d!112349 e!512596))

(declare-fun res!616339 () Bool)

(assert (=> d!112349 (=> (not res!616339) (not e!512596))))

(declare-fun lt!411045 () ListLongMap!11281)

(assert (=> d!112349 (= res!616339 (contains!4662 lt!411045 (_1!6308 (tuple2!12595 lt!411002 zeroValue!1094))))))

(declare-fun lt!411044 () List!18374)

(assert (=> d!112349 (= lt!411045 (ListLongMap!11282 lt!411044))))

(declare-fun lt!411046 () Unit!30850)

(declare-fun lt!411047 () Unit!30850)

(assert (=> d!112349 (= lt!411046 lt!411047)))

(assert (=> d!112349 (= (getValueByKey!479 lt!411044 (_1!6308 (tuple2!12595 lt!411002 zeroValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!411002 zeroValue!1094))))))

(assert (=> d!112349 (= lt!411047 (lemmaContainsTupThenGetReturnValue!254 lt!411044 (_1!6308 (tuple2!12595 lt!411002 zeroValue!1094)) (_2!6308 (tuple2!12595 lt!411002 zeroValue!1094))))))

(assert (=> d!112349 (= lt!411044 (insertStrictlySorted!311 (toList!5656 lt!410984) (_1!6308 (tuple2!12595 lt!411002 zeroValue!1094)) (_2!6308 (tuple2!12595 lt!411002 zeroValue!1094))))))

(assert (=> d!112349 (= (+!2635 lt!410984 (tuple2!12595 lt!411002 zeroValue!1094)) lt!411045)))

(declare-fun b!913814 () Bool)

(declare-fun res!616340 () Bool)

(assert (=> b!913814 (=> (not res!616340) (not e!512596))))

(assert (=> b!913814 (= res!616340 (= (getValueByKey!479 (toList!5656 lt!411045) (_1!6308 (tuple2!12595 lt!411002 zeroValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!411002 zeroValue!1094)))))))

(declare-fun b!913815 () Bool)

(assert (=> b!913815 (= e!512596 (contains!4665 (toList!5656 lt!411045) (tuple2!12595 lt!411002 zeroValue!1094)))))

(assert (= (and d!112349 res!616339) b!913814))

(assert (= (and b!913814 res!616340) b!913815))

(declare-fun m!847825 () Bool)

(assert (=> d!112349 m!847825))

(declare-fun m!847827 () Bool)

(assert (=> d!112349 m!847827))

(declare-fun m!847829 () Bool)

(assert (=> d!112349 m!847829))

(declare-fun m!847831 () Bool)

(assert (=> d!112349 m!847831))

(declare-fun m!847833 () Bool)

(assert (=> b!913814 m!847833))

(declare-fun m!847835 () Bool)

(assert (=> b!913815 m!847835))

(assert (=> b!913732 d!112349))

(declare-fun d!112351 () Bool)

(declare-fun e!512597 () Bool)

(assert (=> d!112351 e!512597))

(declare-fun res!616341 () Bool)

(assert (=> d!112351 (=> res!616341 e!512597)))

(declare-fun lt!411051 () Bool)

(assert (=> d!112351 (= res!616341 (not lt!411051))))

(declare-fun lt!411048 () Bool)

(assert (=> d!112351 (= lt!411051 lt!411048)))

(declare-fun lt!411050 () Unit!30850)

(declare-fun e!512598 () Unit!30850)

(assert (=> d!112351 (= lt!411050 e!512598)))

(declare-fun c!95910 () Bool)

(assert (=> d!112351 (= c!95910 lt!411048)))

(assert (=> d!112351 (= lt!411048 (containsKey!443 (toList!5656 (+!2635 lt!410984 (tuple2!12595 lt!411002 zeroValue!1094))) lt!410996))))

(assert (=> d!112351 (= (contains!4662 (+!2635 lt!410984 (tuple2!12595 lt!411002 zeroValue!1094)) lt!410996) lt!411051)))

(declare-fun b!913816 () Bool)

(declare-fun lt!411049 () Unit!30850)

(assert (=> b!913816 (= e!512598 lt!411049)))

(assert (=> b!913816 (= lt!411049 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 (+!2635 lt!410984 (tuple2!12595 lt!411002 zeroValue!1094))) lt!410996))))

(assert (=> b!913816 (isDefined!351 (getValueByKey!479 (toList!5656 (+!2635 lt!410984 (tuple2!12595 lt!411002 zeroValue!1094))) lt!410996))))

(declare-fun b!913817 () Bool)

(declare-fun Unit!30858 () Unit!30850)

(assert (=> b!913817 (= e!512598 Unit!30858)))

(declare-fun b!913818 () Bool)

(assert (=> b!913818 (= e!512597 (isDefined!351 (getValueByKey!479 (toList!5656 (+!2635 lt!410984 (tuple2!12595 lt!411002 zeroValue!1094))) lt!410996)))))

(assert (= (and d!112351 c!95910) b!913816))

(assert (= (and d!112351 (not c!95910)) b!913817))

(assert (= (and d!112351 (not res!616341)) b!913818))

(declare-fun m!847837 () Bool)

(assert (=> d!112351 m!847837))

(declare-fun m!847839 () Bool)

(assert (=> b!913816 m!847839))

(declare-fun m!847841 () Bool)

(assert (=> b!913816 m!847841))

(assert (=> b!913816 m!847841))

(declare-fun m!847843 () Bool)

(assert (=> b!913816 m!847843))

(assert (=> b!913818 m!847841))

(assert (=> b!913818 m!847841))

(assert (=> b!913818 m!847843))

(assert (=> b!913732 d!112351))

(declare-fun d!112353 () Bool)

(declare-fun e!512599 () Bool)

(assert (=> d!112353 e!512599))

(declare-fun res!616342 () Bool)

(assert (=> d!112353 (=> (not res!616342) (not e!512599))))

(declare-fun lt!411053 () ListLongMap!11281)

(assert (=> d!112353 (= res!616342 (contains!4662 lt!411053 (_1!6308 (tuple2!12595 lt!410999 minValue!1094))))))

(declare-fun lt!411052 () List!18374)

(assert (=> d!112353 (= lt!411053 (ListLongMap!11282 lt!411052))))

(declare-fun lt!411054 () Unit!30850)

(declare-fun lt!411055 () Unit!30850)

(assert (=> d!112353 (= lt!411054 lt!411055)))

(assert (=> d!112353 (= (getValueByKey!479 lt!411052 (_1!6308 (tuple2!12595 lt!410999 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410999 minValue!1094))))))

(assert (=> d!112353 (= lt!411055 (lemmaContainsTupThenGetReturnValue!254 lt!411052 (_1!6308 (tuple2!12595 lt!410999 minValue!1094)) (_2!6308 (tuple2!12595 lt!410999 minValue!1094))))))

(assert (=> d!112353 (= lt!411052 (insertStrictlySorted!311 (toList!5656 lt!410983) (_1!6308 (tuple2!12595 lt!410999 minValue!1094)) (_2!6308 (tuple2!12595 lt!410999 minValue!1094))))))

(assert (=> d!112353 (= (+!2635 lt!410983 (tuple2!12595 lt!410999 minValue!1094)) lt!411053)))

(declare-fun b!913819 () Bool)

(declare-fun res!616343 () Bool)

(assert (=> b!913819 (=> (not res!616343) (not e!512599))))

(assert (=> b!913819 (= res!616343 (= (getValueByKey!479 (toList!5656 lt!411053) (_1!6308 (tuple2!12595 lt!410999 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410999 minValue!1094)))))))

(declare-fun b!913820 () Bool)

(assert (=> b!913820 (= e!512599 (contains!4665 (toList!5656 lt!411053) (tuple2!12595 lt!410999 minValue!1094)))))

(assert (= (and d!112353 res!616342) b!913819))

(assert (= (and b!913819 res!616343) b!913820))

(declare-fun m!847845 () Bool)

(assert (=> d!112353 m!847845))

(declare-fun m!847847 () Bool)

(assert (=> d!112353 m!847847))

(declare-fun m!847849 () Bool)

(assert (=> d!112353 m!847849))

(declare-fun m!847851 () Bool)

(assert (=> d!112353 m!847851))

(declare-fun m!847853 () Bool)

(assert (=> b!913819 m!847853))

(declare-fun m!847855 () Bool)

(assert (=> b!913820 m!847855))

(assert (=> b!913732 d!112353))

(declare-fun d!112355 () Bool)

(assert (=> d!112355 (contains!4662 (+!2635 lt!410984 (tuple2!12595 lt!411002 zeroValue!1094)) lt!410996)))

(declare-fun lt!411058 () Unit!30850)

(declare-fun choose!1547 (ListLongMap!11281 (_ BitVec 64) V!30503 (_ BitVec 64)) Unit!30850)

(assert (=> d!112355 (= lt!411058 (choose!1547 lt!410984 lt!411002 zeroValue!1094 lt!410996))))

(assert (=> d!112355 (contains!4662 lt!410984 lt!410996)))

(assert (=> d!112355 (= (addStillContains!350 lt!410984 lt!411002 zeroValue!1094 lt!410996) lt!411058)))

(declare-fun bs!25683 () Bool)

(assert (= bs!25683 d!112355))

(assert (=> bs!25683 m!847727))

(assert (=> bs!25683 m!847727))

(assert (=> bs!25683 m!847739))

(declare-fun m!847857 () Bool)

(assert (=> bs!25683 m!847857))

(declare-fun m!847859 () Bool)

(assert (=> bs!25683 m!847859))

(assert (=> b!913732 d!112355))

(declare-fun d!112357 () Bool)

(assert (=> d!112357 (= (apply!521 lt!410998 lt!410990) (get!13705 (getValueByKey!479 (toList!5656 lt!410998) lt!410990)))))

(declare-fun bs!25684 () Bool)

(assert (= bs!25684 d!112357))

(declare-fun m!847861 () Bool)

(assert (=> bs!25684 m!847861))

(assert (=> bs!25684 m!847861))

(declare-fun m!847863 () Bool)

(assert (=> bs!25684 m!847863))

(assert (=> b!913732 d!112357))

(declare-fun d!112359 () Bool)

(declare-fun e!512600 () Bool)

(assert (=> d!112359 e!512600))

(declare-fun res!616344 () Bool)

(assert (=> d!112359 (=> (not res!616344) (not e!512600))))

(declare-fun lt!411060 () ListLongMap!11281)

(assert (=> d!112359 (= res!616344 (contains!4662 lt!411060 (_1!6308 (tuple2!12595 lt!410994 zeroValue!1094))))))

(declare-fun lt!411059 () List!18374)

(assert (=> d!112359 (= lt!411060 (ListLongMap!11282 lt!411059))))

(declare-fun lt!411061 () Unit!30850)

(declare-fun lt!411062 () Unit!30850)

(assert (=> d!112359 (= lt!411061 lt!411062)))

(assert (=> d!112359 (= (getValueByKey!479 lt!411059 (_1!6308 (tuple2!12595 lt!410994 zeroValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410994 zeroValue!1094))))))

(assert (=> d!112359 (= lt!411062 (lemmaContainsTupThenGetReturnValue!254 lt!411059 (_1!6308 (tuple2!12595 lt!410994 zeroValue!1094)) (_2!6308 (tuple2!12595 lt!410994 zeroValue!1094))))))

(assert (=> d!112359 (= lt!411059 (insertStrictlySorted!311 (toList!5656 lt!410998) (_1!6308 (tuple2!12595 lt!410994 zeroValue!1094)) (_2!6308 (tuple2!12595 lt!410994 zeroValue!1094))))))

(assert (=> d!112359 (= (+!2635 lt!410998 (tuple2!12595 lt!410994 zeroValue!1094)) lt!411060)))

(declare-fun b!913822 () Bool)

(declare-fun res!616345 () Bool)

(assert (=> b!913822 (=> (not res!616345) (not e!512600))))

(assert (=> b!913822 (= res!616345 (= (getValueByKey!479 (toList!5656 lt!411060) (_1!6308 (tuple2!12595 lt!410994 zeroValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410994 zeroValue!1094)))))))

(declare-fun b!913823 () Bool)

(assert (=> b!913823 (= e!512600 (contains!4665 (toList!5656 lt!411060) (tuple2!12595 lt!410994 zeroValue!1094)))))

(assert (= (and d!112359 res!616344) b!913822))

(assert (= (and b!913822 res!616345) b!913823))

(declare-fun m!847865 () Bool)

(assert (=> d!112359 m!847865))

(declare-fun m!847867 () Bool)

(assert (=> d!112359 m!847867))

(declare-fun m!847869 () Bool)

(assert (=> d!112359 m!847869))

(declare-fun m!847871 () Bool)

(assert (=> d!112359 m!847871))

(declare-fun m!847873 () Bool)

(assert (=> b!913822 m!847873))

(declare-fun m!847875 () Bool)

(assert (=> b!913823 m!847875))

(assert (=> b!913732 d!112359))

(declare-fun d!112361 () Bool)

(assert (=> d!112361 (= (apply!521 (+!2635 lt!410991 (tuple2!12595 lt!411004 minValue!1094)) lt!410997) (apply!521 lt!410991 lt!410997))))

(declare-fun lt!411063 () Unit!30850)

(assert (=> d!112361 (= lt!411063 (choose!1546 lt!410991 lt!411004 minValue!1094 lt!410997))))

(declare-fun e!512601 () Bool)

(assert (=> d!112361 e!512601))

(declare-fun res!616346 () Bool)

(assert (=> d!112361 (=> (not res!616346) (not e!512601))))

(assert (=> d!112361 (= res!616346 (contains!4662 lt!410991 lt!410997))))

(assert (=> d!112361 (= (addApplyDifferent!350 lt!410991 lt!411004 minValue!1094 lt!410997) lt!411063)))

(declare-fun b!913824 () Bool)

(assert (=> b!913824 (= e!512601 (not (= lt!410997 lt!411004)))))

(assert (= (and d!112361 res!616346) b!913824))

(assert (=> d!112361 m!847745))

(assert (=> d!112361 m!847747))

(declare-fun m!847877 () Bool)

(assert (=> d!112361 m!847877))

(declare-fun m!847879 () Bool)

(assert (=> d!112361 m!847879))

(assert (=> d!112361 m!847745))

(assert (=> d!112361 m!847749))

(assert (=> b!913732 d!112361))

(declare-fun d!112363 () Bool)

(assert (=> d!112363 (= (apply!521 (+!2635 lt!410998 (tuple2!12595 lt!410994 zeroValue!1094)) lt!410990) (apply!521 lt!410998 lt!410990))))

(declare-fun lt!411064 () Unit!30850)

(assert (=> d!112363 (= lt!411064 (choose!1546 lt!410998 lt!410994 zeroValue!1094 lt!410990))))

(declare-fun e!512602 () Bool)

(assert (=> d!112363 e!512602))

(declare-fun res!616347 () Bool)

(assert (=> d!112363 (=> (not res!616347) (not e!512602))))

(assert (=> d!112363 (= res!616347 (contains!4662 lt!410998 lt!410990))))

(assert (=> d!112363 (= (addApplyDifferent!350 lt!410998 lt!410994 zeroValue!1094 lt!410990) lt!411064)))

(declare-fun b!913825 () Bool)

(assert (=> b!913825 (= e!512602 (not (= lt!410990 lt!410994)))))

(assert (= (and d!112363 res!616347) b!913825))

(assert (=> d!112363 m!847735))

(assert (=> d!112363 m!847737))

(declare-fun m!847881 () Bool)

(assert (=> d!112363 m!847881))

(declare-fun m!847883 () Bool)

(assert (=> d!112363 m!847883))

(assert (=> d!112363 m!847735))

(assert (=> d!112363 m!847731))

(assert (=> b!913732 d!112363))

(declare-fun d!112365 () Bool)

(assert (=> d!112365 (= (apply!521 (+!2635 lt!410983 (tuple2!12595 lt!410999 minValue!1094)) lt!411001) (get!13705 (getValueByKey!479 (toList!5656 (+!2635 lt!410983 (tuple2!12595 lt!410999 minValue!1094))) lt!411001)))))

(declare-fun bs!25685 () Bool)

(assert (= bs!25685 d!112365))

(declare-fun m!847885 () Bool)

(assert (=> bs!25685 m!847885))

(assert (=> bs!25685 m!847885))

(declare-fun m!847887 () Bool)

(assert (=> bs!25685 m!847887))

(assert (=> b!913732 d!112365))

(declare-fun d!112367 () Bool)

(assert (=> d!112367 (= (apply!521 lt!410983 lt!411001) (get!13705 (getValueByKey!479 (toList!5656 lt!410983) lt!411001)))))

(declare-fun bs!25686 () Bool)

(assert (= bs!25686 d!112367))

(declare-fun m!847889 () Bool)

(assert (=> bs!25686 m!847889))

(assert (=> bs!25686 m!847889))

(declare-fun m!847891 () Bool)

(assert (=> bs!25686 m!847891))

(assert (=> b!913732 d!112367))

(declare-fun d!112369 () Bool)

(assert (=> d!112369 (= (isDefined!351 (getValueByKey!479 (toList!5656 lt!410875) k0!1033)) (not (isEmpty!699 (getValueByKey!479 (toList!5656 lt!410875) k0!1033))))))

(declare-fun bs!25687 () Bool)

(assert (= bs!25687 d!112369))

(assert (=> bs!25687 m!847707))

(declare-fun m!847893 () Bool)

(assert (=> bs!25687 m!847893))

(assert (=> b!913717 d!112369))

(declare-fun b!913829 () Bool)

(declare-fun e!512604 () Option!485)

(assert (=> b!913829 (= e!512604 None!483)))

(declare-fun b!913828 () Bool)

(assert (=> b!913828 (= e!512604 (getValueByKey!479 (t!25960 (toList!5656 lt!410875)) k0!1033))))

(declare-fun b!913826 () Bool)

(declare-fun e!512603 () Option!485)

(assert (=> b!913826 (= e!512603 (Some!484 (_2!6308 (h!19516 (toList!5656 lt!410875)))))))

(declare-fun b!913827 () Bool)

(assert (=> b!913827 (= e!512603 e!512604)))

(declare-fun c!95912 () Bool)

(assert (=> b!913827 (= c!95912 (and ((_ is Cons!18370) (toList!5656 lt!410875)) (not (= (_1!6308 (h!19516 (toList!5656 lt!410875))) k0!1033))))))

(declare-fun d!112371 () Bool)

(declare-fun c!95911 () Bool)

(assert (=> d!112371 (= c!95911 (and ((_ is Cons!18370) (toList!5656 lt!410875)) (= (_1!6308 (h!19516 (toList!5656 lt!410875))) k0!1033)))))

(assert (=> d!112371 (= (getValueByKey!479 (toList!5656 lt!410875) k0!1033) e!512603)))

(assert (= (and d!112371 c!95911) b!913826))

(assert (= (and d!112371 (not c!95911)) b!913827))

(assert (= (and b!913827 c!95912) b!913828))

(assert (= (and b!913827 (not c!95912)) b!913829))

(declare-fun m!847895 () Bool)

(assert (=> b!913828 m!847895))

(assert (=> b!913717 d!112371))

(declare-fun d!112373 () Bool)

(assert (=> d!112373 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410875) k0!1033))))

(declare-fun lt!411065 () Unit!30850)

(assert (=> d!112373 (= lt!411065 (choose!1545 (toList!5656 lt!410875) k0!1033))))

(declare-fun e!512605 () Bool)

(assert (=> d!112373 e!512605))

(declare-fun res!616348 () Bool)

(assert (=> d!112373 (=> (not res!616348) (not e!512605))))

(assert (=> d!112373 (= res!616348 (isStrictlySorted!498 (toList!5656 lt!410875)))))

(assert (=> d!112373 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 lt!410875) k0!1033) lt!411065)))

(declare-fun b!913830 () Bool)

(assert (=> b!913830 (= e!512605 (containsKey!443 (toList!5656 lt!410875) k0!1033))))

(assert (= (and d!112373 res!616348) b!913830))

(assert (=> d!112373 m!847707))

(assert (=> d!112373 m!847707))

(assert (=> d!112373 m!847709))

(declare-fun m!847897 () Bool)

(assert (=> d!112373 m!847897))

(declare-fun m!847899 () Bool)

(assert (=> d!112373 m!847899))

(assert (=> b!913830 m!847703))

(assert (=> b!913715 d!112373))

(assert (=> b!913715 d!112369))

(assert (=> b!913715 d!112371))

(assert (=> b!913629 d!112329))

(declare-fun b!913831 () Bool)

(declare-fun e!512608 () Bool)

(declare-fun e!512606 () Bool)

(assert (=> b!913831 (= e!512608 e!512606)))

(declare-fun lt!411068 () (_ BitVec 64))

(assert (=> b!913831 (= lt!411068 (select (arr!26103 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!411067 () Unit!30850)

(assert (=> b!913831 (= lt!411067 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411068 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!913831 (arrayContainsKey!0 _keys!1386 lt!411068 #b00000000000000000000000000000000)))

(declare-fun lt!411066 () Unit!30850)

(assert (=> b!913831 (= lt!411066 lt!411067)))

(declare-fun res!616349 () Bool)

(assert (=> b!913831 (= res!616349 (= (seekEntryOrOpen!0 (select (arr!26103 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1386 mask!1756) (Found!8970 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!913831 (=> (not res!616349) (not e!512606))))

(declare-fun b!913832 () Bool)

(declare-fun e!512607 () Bool)

(assert (=> b!913832 (= e!512607 e!512608)))

(declare-fun c!95913 () Bool)

(assert (=> b!913832 (= c!95913 (validKeyInArray!0 (select (arr!26103 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!112375 () Bool)

(declare-fun res!616350 () Bool)

(assert (=> d!112375 (=> res!616350 e!512607)))

(assert (=> d!112375 (= res!616350 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26564 _keys!1386)))))

(assert (=> d!112375 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756) e!512607)))

(declare-fun bm!40470 () Bool)

(declare-fun call!40473 () Bool)

(assert (=> bm!40470 (= call!40473 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!913833 () Bool)

(assert (=> b!913833 (= e!512608 call!40473)))

(declare-fun b!913834 () Bool)

(assert (=> b!913834 (= e!512606 call!40473)))

(assert (= (and d!112375 (not res!616350)) b!913832))

(assert (= (and b!913832 c!95913) b!913831))

(assert (= (and b!913832 (not c!95913)) b!913833))

(assert (= (and b!913831 res!616349) b!913834))

(assert (= (or b!913834 b!913833) bm!40470))

(declare-fun m!847901 () Bool)

(assert (=> b!913831 m!847901))

(declare-fun m!847903 () Bool)

(assert (=> b!913831 m!847903))

(declare-fun m!847905 () Bool)

(assert (=> b!913831 m!847905))

(assert (=> b!913831 m!847901))

(declare-fun m!847907 () Bool)

(assert (=> b!913831 m!847907))

(assert (=> b!913832 m!847901))

(assert (=> b!913832 m!847901))

(declare-fun m!847909 () Bool)

(assert (=> b!913832 m!847909))

(declare-fun m!847911 () Bool)

(assert (=> bm!40470 m!847911))

(assert (=> bm!40459 d!112375))

(declare-fun d!112377 () Bool)

(assert (=> d!112377 (arrayContainsKey!0 _keys!1386 lt!410978 #b00000000000000000000000000000000)))

(declare-fun lt!411071 () Unit!30850)

(declare-fun choose!13 (array!54301 (_ BitVec 64) (_ BitVec 32)) Unit!30850)

(assert (=> d!112377 (= lt!411071 (choose!13 _keys!1386 lt!410978 #b00000000000000000000000000000000))))

(assert (=> d!112377 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!112377 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410978 #b00000000000000000000000000000000) lt!411071)))

(declare-fun bs!25688 () Bool)

(assert (= bs!25688 d!112377))

(assert (=> bs!25688 m!847697))

(declare-fun m!847913 () Bool)

(assert (=> bs!25688 m!847913))

(assert (=> b!913711 d!112377))

(declare-fun d!112379 () Bool)

(declare-fun res!616351 () Bool)

(declare-fun e!512609 () Bool)

(assert (=> d!112379 (=> res!616351 e!512609)))

(assert (=> d!112379 (= res!616351 (= (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) lt!410978))))

(assert (=> d!112379 (= (arrayContainsKey!0 _keys!1386 lt!410978 #b00000000000000000000000000000000) e!512609)))

(declare-fun b!913835 () Bool)

(declare-fun e!512610 () Bool)

(assert (=> b!913835 (= e!512609 e!512610)))

(declare-fun res!616352 () Bool)

(assert (=> b!913835 (=> (not res!616352) (not e!512610))))

(assert (=> b!913835 (= res!616352 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26564 _keys!1386)))))

(declare-fun b!913836 () Bool)

(assert (=> b!913836 (= e!512610 (arrayContainsKey!0 _keys!1386 lt!410978 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112379 (not res!616351)) b!913835))

(assert (= (and b!913835 res!616352) b!913836))

(assert (=> d!112379 m!847623))

(declare-fun m!847915 () Bool)

(assert (=> b!913836 m!847915))

(assert (=> b!913711 d!112379))

(declare-fun b!913849 () Bool)

(declare-fun e!512618 () SeekEntryResult!8970)

(assert (=> b!913849 (= e!512618 Undefined!8970)))

(declare-fun b!913850 () Bool)

(declare-fun e!512617 () SeekEntryResult!8970)

(assert (=> b!913850 (= e!512618 e!512617)))

(declare-fun lt!411078 () (_ BitVec 64))

(declare-fun lt!411080 () SeekEntryResult!8970)

(assert (=> b!913850 (= lt!411078 (select (arr!26103 _keys!1386) (index!38253 lt!411080)))))

(declare-fun c!95920 () Bool)

(assert (=> b!913850 (= c!95920 (= lt!411078 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913851 () Bool)

(assert (=> b!913851 (= e!512617 (Found!8970 (index!38253 lt!411080)))))

(declare-fun e!512619 () SeekEntryResult!8970)

(declare-fun b!913852 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54301 (_ BitVec 32)) SeekEntryResult!8970)

(assert (=> b!913852 (= e!512619 (seekKeyOrZeroReturnVacant!0 (x!78163 lt!411080) (index!38253 lt!411080) (index!38253 lt!411080) (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(declare-fun b!913853 () Bool)

(declare-fun c!95922 () Bool)

(assert (=> b!913853 (= c!95922 (= lt!411078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913853 (= e!512617 e!512619)))

(declare-fun d!112381 () Bool)

(declare-fun lt!411079 () SeekEntryResult!8970)

(assert (=> d!112381 (and (or ((_ is Undefined!8970) lt!411079) (not ((_ is Found!8970) lt!411079)) (and (bvsge (index!38252 lt!411079) #b00000000000000000000000000000000) (bvslt (index!38252 lt!411079) (size!26564 _keys!1386)))) (or ((_ is Undefined!8970) lt!411079) ((_ is Found!8970) lt!411079) (not ((_ is MissingZero!8970) lt!411079)) (and (bvsge (index!38251 lt!411079) #b00000000000000000000000000000000) (bvslt (index!38251 lt!411079) (size!26564 _keys!1386)))) (or ((_ is Undefined!8970) lt!411079) ((_ is Found!8970) lt!411079) ((_ is MissingZero!8970) lt!411079) (not ((_ is MissingVacant!8970) lt!411079)) (and (bvsge (index!38254 lt!411079) #b00000000000000000000000000000000) (bvslt (index!38254 lt!411079) (size!26564 _keys!1386)))) (or ((_ is Undefined!8970) lt!411079) (ite ((_ is Found!8970) lt!411079) (= (select (arr!26103 _keys!1386) (index!38252 lt!411079)) (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8970) lt!411079) (= (select (arr!26103 _keys!1386) (index!38251 lt!411079)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8970) lt!411079) (= (select (arr!26103 _keys!1386) (index!38254 lt!411079)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!112381 (= lt!411079 e!512618)))

(declare-fun c!95921 () Bool)

(assert (=> d!112381 (= c!95921 (and ((_ is Intermediate!8970) lt!411080) (undefined!9782 lt!411080)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54301 (_ BitVec 32)) SeekEntryResult!8970)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112381 (= lt!411080 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) mask!1756) (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(assert (=> d!112381 (validMask!0 mask!1756)))

(assert (=> d!112381 (= (seekEntryOrOpen!0 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) lt!411079)))

(declare-fun b!913854 () Bool)

(assert (=> b!913854 (= e!512619 (MissingZero!8970 (index!38253 lt!411080)))))

(assert (= (and d!112381 c!95921) b!913849))

(assert (= (and d!112381 (not c!95921)) b!913850))

(assert (= (and b!913850 c!95920) b!913851))

(assert (= (and b!913850 (not c!95920)) b!913853))

(assert (= (and b!913853 c!95922) b!913854))

(assert (= (and b!913853 (not c!95922)) b!913852))

(declare-fun m!847917 () Bool)

(assert (=> b!913850 m!847917))

(assert (=> b!913852 m!847623))

(declare-fun m!847919 () Bool)

(assert (=> b!913852 m!847919))

(declare-fun m!847921 () Bool)

(assert (=> d!112381 m!847921))

(declare-fun m!847923 () Bool)

(assert (=> d!112381 m!847923))

(assert (=> d!112381 m!847623))

(declare-fun m!847925 () Bool)

(assert (=> d!112381 m!847925))

(declare-fun m!847927 () Bool)

(assert (=> d!112381 m!847927))

(assert (=> d!112381 m!847545))

(declare-fun m!847929 () Bool)

(assert (=> d!112381 m!847929))

(assert (=> d!112381 m!847623))

(assert (=> d!112381 m!847923))

(assert (=> b!913711 d!112381))

(declare-fun d!112383 () Bool)

(assert (=> d!112383 (= (apply!521 lt!410950 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13705 (getValueByKey!479 (toList!5656 lt!410950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25689 () Bool)

(assert (= bs!25689 d!112383))

(declare-fun m!847931 () Bool)

(assert (=> bs!25689 m!847931))

(assert (=> bs!25689 m!847931))

(declare-fun m!847933 () Bool)

(assert (=> bs!25689 m!847933))

(assert (=> b!913685 d!112383))

(declare-fun d!112385 () Bool)

(declare-fun e!512620 () Bool)

(assert (=> d!112385 e!512620))

(declare-fun res!616353 () Bool)

(assert (=> d!112385 (=> (not res!616353) (not e!512620))))

(declare-fun lt!411082 () ListLongMap!11281)

(assert (=> d!112385 (= res!616353 (contains!4662 lt!411082 (_1!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!411081 () List!18374)

(assert (=> d!112385 (= lt!411082 (ListLongMap!11282 lt!411081))))

(declare-fun lt!411083 () Unit!30850)

(declare-fun lt!411084 () Unit!30850)

(assert (=> d!112385 (= lt!411083 lt!411084)))

(assert (=> d!112385 (= (getValueByKey!479 lt!411081 (_1!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112385 (= lt!411084 (lemmaContainsTupThenGetReturnValue!254 lt!411081 (_1!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112385 (= lt!411081 (insertStrictlySorted!311 (toList!5656 call!40468) (_1!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112385 (= (+!2635 call!40468 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!411082)))

(declare-fun b!913855 () Bool)

(declare-fun res!616354 () Bool)

(assert (=> b!913855 (=> (not res!616354) (not e!512620))))

(assert (=> b!913855 (= res!616354 (= (getValueByKey!479 (toList!5656 lt!411082) (_1!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!913856 () Bool)

(assert (=> b!913856 (= e!512620 (contains!4665 (toList!5656 lt!411082) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112385 res!616353) b!913855))

(assert (= (and b!913855 res!616354) b!913856))

(declare-fun m!847935 () Bool)

(assert (=> d!112385 m!847935))

(declare-fun m!847937 () Bool)

(assert (=> d!112385 m!847937))

(declare-fun m!847939 () Bool)

(assert (=> d!112385 m!847939))

(declare-fun m!847941 () Bool)

(assert (=> d!112385 m!847941))

(declare-fun m!847943 () Bool)

(assert (=> b!913855 m!847943))

(declare-fun m!847945 () Bool)

(assert (=> b!913856 m!847945))

(assert (=> b!913730 d!112385))

(assert (=> b!913712 d!112329))

(declare-fun c!95923 () Bool)

(declare-fun call!40474 () Bool)

(declare-fun bm!40471 () Bool)

(assert (=> bm!40471 (= call!40474 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!95923 (Cons!18369 (select (arr!26103 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!95857 (Cons!18369 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) Nil!18370) Nil!18370)) (ite c!95857 (Cons!18369 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) Nil!18370) Nil!18370))))))

(declare-fun b!913858 () Bool)

(declare-fun e!512624 () Bool)

(assert (=> b!913858 (= e!512624 call!40474)))

(declare-fun b!913859 () Bool)

(assert (=> b!913859 (= e!512624 call!40474)))

(declare-fun b!913860 () Bool)

(declare-fun e!512623 () Bool)

(assert (=> b!913860 (= e!512623 e!512624)))

(assert (=> b!913860 (= c!95923 (validKeyInArray!0 (select (arr!26103 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!913861 () Bool)

(declare-fun e!512621 () Bool)

(assert (=> b!913861 (= e!512621 e!512623)))

(declare-fun res!616356 () Bool)

(assert (=> b!913861 (=> (not res!616356) (not e!512623))))

(declare-fun e!512622 () Bool)

(assert (=> b!913861 (= res!616356 (not e!512622))))

(declare-fun res!616355 () Bool)

(assert (=> b!913861 (=> (not res!616355) (not e!512622))))

(assert (=> b!913861 (= res!616355 (validKeyInArray!0 (select (arr!26103 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!112387 () Bool)

(declare-fun res!616357 () Bool)

(assert (=> d!112387 (=> res!616357 e!512621)))

(assert (=> d!112387 (= res!616357 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26564 _keys!1386)))))

(assert (=> d!112387 (= (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95857 (Cons!18369 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) Nil!18370) Nil!18370)) e!512621)))

(declare-fun b!913857 () Bool)

(assert (=> b!913857 (= e!512622 (contains!4664 (ite c!95857 (Cons!18369 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) Nil!18370) Nil!18370) (select (arr!26103 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!112387 (not res!616357)) b!913861))

(assert (= (and b!913861 res!616355) b!913857))

(assert (= (and b!913861 res!616356) b!913860))

(assert (= (and b!913860 c!95923) b!913858))

(assert (= (and b!913860 (not c!95923)) b!913859))

(assert (= (or b!913858 b!913859) bm!40471))

(assert (=> bm!40471 m!847901))

(declare-fun m!847947 () Bool)

(assert (=> bm!40471 m!847947))

(assert (=> b!913860 m!847901))

(assert (=> b!913860 m!847901))

(assert (=> b!913860 m!847909))

(assert (=> b!913861 m!847901))

(assert (=> b!913861 m!847901))

(assert (=> b!913861 m!847909))

(assert (=> b!913857 m!847901))

(assert (=> b!913857 m!847901))

(declare-fun m!847949 () Bool)

(assert (=> b!913857 m!847949))

(assert (=> bm!40435 d!112387))

(declare-fun d!112389 () Bool)

(declare-fun e!512625 () Bool)

(assert (=> d!112389 e!512625))

(declare-fun res!616358 () Bool)

(assert (=> d!112389 (=> (not res!616358) (not e!512625))))

(declare-fun lt!411086 () ListLongMap!11281)

(assert (=> d!112389 (= res!616358 (contains!4662 lt!411086 (_1!6308 (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!411085 () List!18374)

(assert (=> d!112389 (= lt!411086 (ListLongMap!11282 lt!411085))))

(declare-fun lt!411087 () Unit!30850)

(declare-fun lt!411088 () Unit!30850)

(assert (=> d!112389 (= lt!411087 lt!411088)))

(assert (=> d!112389 (= (getValueByKey!479 lt!411085 (_1!6308 (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!484 (_2!6308 (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112389 (= lt!411088 (lemmaContainsTupThenGetReturnValue!254 lt!411085 (_1!6308 (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6308 (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112389 (= lt!411085 (insertStrictlySorted!311 (toList!5656 (ite c!95888 call!40467 (ite c!95885 call!40469 call!40465))) (_1!6308 (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6308 (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112389 (= (+!2635 (ite c!95888 call!40467 (ite c!95885 call!40469 call!40465)) (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!411086)))

(declare-fun b!913862 () Bool)

(declare-fun res!616359 () Bool)

(assert (=> b!913862 (=> (not res!616359) (not e!512625))))

(assert (=> b!913862 (= res!616359 (= (getValueByKey!479 (toList!5656 lt!411086) (_1!6308 (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!484 (_2!6308 (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!913863 () Bool)

(assert (=> b!913863 (= e!512625 (contains!4665 (toList!5656 lt!411086) (ite (or c!95888 c!95885) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112389 res!616358) b!913862))

(assert (= (and b!913862 res!616359) b!913863))

(declare-fun m!847951 () Bool)

(assert (=> d!112389 m!847951))

(declare-fun m!847953 () Bool)

(assert (=> d!112389 m!847953))

(declare-fun m!847955 () Bool)

(assert (=> d!112389 m!847955))

(declare-fun m!847957 () Bool)

(assert (=> d!112389 m!847957))

(declare-fun m!847959 () Bool)

(assert (=> b!913862 m!847959))

(declare-fun m!847961 () Bool)

(assert (=> b!913863 m!847961))

(assert (=> bm!40461 d!112389))

(declare-fun d!112391 () Bool)

(declare-fun e!512626 () Bool)

(assert (=> d!112391 e!512626))

(declare-fun res!616360 () Bool)

(assert (=> d!112391 (=> res!616360 e!512626)))

(declare-fun lt!411092 () Bool)

(assert (=> d!112391 (= res!616360 (not lt!411092))))

(declare-fun lt!411089 () Bool)

(assert (=> d!112391 (= lt!411092 lt!411089)))

(declare-fun lt!411091 () Unit!30850)

(declare-fun e!512627 () Unit!30850)

(assert (=> d!112391 (= lt!411091 e!512627)))

(declare-fun c!95924 () Bool)

(assert (=> d!112391 (= c!95924 lt!411089)))

(assert (=> d!112391 (= lt!411089 (containsKey!443 (toList!5656 lt!410950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112391 (= (contains!4662 lt!410950 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411092)))

(declare-fun b!913864 () Bool)

(declare-fun lt!411090 () Unit!30850)

(assert (=> b!913864 (= e!512627 lt!411090)))

(assert (=> b!913864 (= lt!411090 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 lt!410950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913864 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913865 () Bool)

(declare-fun Unit!30859 () Unit!30850)

(assert (=> b!913865 (= e!512627 Unit!30859)))

(declare-fun b!913866 () Bool)

(assert (=> b!913866 (= e!512626 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410950) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112391 c!95924) b!913864))

(assert (= (and d!112391 (not c!95924)) b!913865))

(assert (= (and d!112391 (not res!616360)) b!913866))

(declare-fun m!847963 () Bool)

(assert (=> d!112391 m!847963))

(declare-fun m!847965 () Bool)

(assert (=> b!913864 m!847965))

(declare-fun m!847967 () Bool)

(assert (=> b!913864 m!847967))

(assert (=> b!913864 m!847967))

(declare-fun m!847969 () Bool)

(assert (=> b!913864 m!847969))

(assert (=> b!913866 m!847967))

(assert (=> b!913866 m!847967))

(assert (=> b!913866 m!847969))

(assert (=> bm!40455 d!112391))

(declare-fun d!112393 () Bool)

(declare-fun lt!411095 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!402 (List!18373) (InoxSet (_ BitVec 64)))

(assert (=> d!112393 (= lt!411095 (select (content!402 Nil!18370) (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun e!512633 () Bool)

(assert (=> d!112393 (= lt!411095 e!512633)))

(declare-fun res!616366 () Bool)

(assert (=> d!112393 (=> (not res!616366) (not e!512633))))

(assert (=> d!112393 (= res!616366 ((_ is Cons!18369) Nil!18370))))

(assert (=> d!112393 (= (contains!4664 Nil!18370 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)) lt!411095)))

(declare-fun b!913871 () Bool)

(declare-fun e!512632 () Bool)

(assert (=> b!913871 (= e!512633 e!512632)))

(declare-fun res!616365 () Bool)

(assert (=> b!913871 (=> res!616365 e!512632)))

(assert (=> b!913871 (= res!616365 (= (h!19515 Nil!18370) (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913872 () Bool)

(assert (=> b!913872 (= e!512632 (contains!4664 (t!25959 Nil!18370) (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112393 res!616366) b!913871))

(assert (= (and b!913871 (not res!616365)) b!913872))

(declare-fun m!847971 () Bool)

(assert (=> d!112393 m!847971))

(assert (=> d!112393 m!847623))

(declare-fun m!847973 () Bool)

(assert (=> d!112393 m!847973))

(assert (=> b!913872 m!847623))

(declare-fun m!847975 () Bool)

(assert (=> b!913872 m!847975))

(assert (=> b!913626 d!112393))

(declare-fun d!112395 () Bool)

(declare-fun e!512634 () Bool)

(assert (=> d!112395 e!512634))

(declare-fun res!616367 () Bool)

(assert (=> d!112395 (=> res!616367 e!512634)))

(declare-fun lt!411099 () Bool)

(assert (=> d!112395 (= res!616367 (not lt!411099))))

(declare-fun lt!411096 () Bool)

(assert (=> d!112395 (= lt!411099 lt!411096)))

(declare-fun lt!411098 () Unit!30850)

(declare-fun e!512635 () Unit!30850)

(assert (=> d!112395 (= lt!411098 e!512635)))

(declare-fun c!95925 () Bool)

(assert (=> d!112395 (= c!95925 lt!411096)))

(assert (=> d!112395 (= lt!411096 (containsKey!443 (toList!5656 lt!410950) (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> d!112395 (= (contains!4662 lt!410950 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)) lt!411099)))

(declare-fun b!913873 () Bool)

(declare-fun lt!411097 () Unit!30850)

(assert (=> b!913873 (= e!512635 lt!411097)))

(assert (=> b!913873 (= lt!411097 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 lt!410950) (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913873 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410950) (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913874 () Bool)

(declare-fun Unit!30860 () Unit!30850)

(assert (=> b!913874 (= e!512635 Unit!30860)))

(declare-fun b!913875 () Bool)

(assert (=> b!913875 (= e!512634 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410950) (select (arr!26103 _keys!1386) #b00000000000000000000000000000000))))))

(assert (= (and d!112395 c!95925) b!913873))

(assert (= (and d!112395 (not c!95925)) b!913874))

(assert (= (and d!112395 (not res!616367)) b!913875))

(assert (=> d!112395 m!847623))

(declare-fun m!847977 () Bool)

(assert (=> d!112395 m!847977))

(assert (=> b!913873 m!847623))

(declare-fun m!847979 () Bool)

(assert (=> b!913873 m!847979))

(assert (=> b!913873 m!847623))

(declare-fun m!847981 () Bool)

(assert (=> b!913873 m!847981))

(assert (=> b!913873 m!847981))

(declare-fun m!847983 () Bool)

(assert (=> b!913873 m!847983))

(assert (=> b!913875 m!847623))

(assert (=> b!913875 m!847981))

(assert (=> b!913875 m!847981))

(assert (=> b!913875 m!847983))

(assert (=> b!913698 d!112395))

(assert (=> b!913614 d!112303))

(declare-fun d!112397 () Bool)

(assert (=> d!112397 (= (apply!521 lt!410950 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13705 (getValueByKey!479 (toList!5656 lt!410950) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25690 () Bool)

(assert (= bs!25690 d!112397))

(assert (=> bs!25690 m!847967))

(assert (=> bs!25690 m!847967))

(declare-fun m!847985 () Bool)

(assert (=> bs!25690 m!847985))

(assert (=> b!913682 d!112397))

(declare-fun d!112399 () Bool)

(assert (=> d!112399 (= (validKeyInArray!0 (select (arr!26103 _keys!1386) i!717)) (and (not (= (select (arr!26103 _keys!1386) i!717) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26103 _keys!1386) i!717) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913726 d!112399))

(declare-fun b!913876 () Bool)

(declare-fun e!512642 () ListLongMap!11281)

(assert (=> b!913876 (= e!512642 (ListLongMap!11282 Nil!18371))))

(declare-fun bm!40472 () Bool)

(declare-fun call!40475 () ListLongMap!11281)

(assert (=> bm!40472 (= call!40475 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun b!913877 () Bool)

(assert (=> b!913877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26564 _keys!1386)))))

(assert (=> b!913877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26565 _values!1152)))))

(declare-fun lt!411103 () ListLongMap!11281)

(declare-fun e!512636 () Bool)

(assert (=> b!913877 (= e!512636 (= (apply!521 lt!411103 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)) (get!13703 (select (arr!26104 _values!1152) #b00000000000000000000000000000000) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913878 () Bool)

(declare-fun e!512637 () ListLongMap!11281)

(assert (=> b!913878 (= e!512642 e!512637)))

(declare-fun c!95926 () Bool)

(assert (=> b!913878 (= c!95926 (validKeyInArray!0 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913879 () Bool)

(declare-fun e!512638 () Bool)

(assert (=> b!913879 (= e!512638 (validKeyInArray!0 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913879 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!913880 () Bool)

(declare-fun e!512641 () Bool)

(assert (=> b!913880 (= e!512641 e!512636)))

(assert (=> b!913880 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26564 _keys!1386)))))

(declare-fun res!616370 () Bool)

(assert (=> b!913880 (= res!616370 (contains!4662 lt!411103 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913880 (=> (not res!616370) (not e!512636))))

(declare-fun b!913881 () Bool)

(assert (=> b!913881 (= e!512637 call!40475)))

(declare-fun b!913882 () Bool)

(declare-fun e!512639 () Bool)

(assert (=> b!913882 (= e!512641 e!512639)))

(declare-fun c!95929 () Bool)

(assert (=> b!913882 (= c!95929 (bvslt #b00000000000000000000000000000000 (size!26564 _keys!1386)))))

(declare-fun d!112401 () Bool)

(declare-fun e!512640 () Bool)

(assert (=> d!112401 e!512640))

(declare-fun res!616369 () Bool)

(assert (=> d!112401 (=> (not res!616369) (not e!512640))))

(assert (=> d!112401 (= res!616369 (not (contains!4662 lt!411103 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!112401 (= lt!411103 e!512642)))

(declare-fun c!95928 () Bool)

(assert (=> d!112401 (= c!95928 (bvsge #b00000000000000000000000000000000 (size!26564 _keys!1386)))))

(assert (=> d!112401 (validMask!0 mask!1756)))

(assert (=> d!112401 (= (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411103)))

(declare-fun b!913883 () Bool)

(assert (=> b!913883 (= e!512639 (isEmpty!700 lt!411103))))

(declare-fun b!913884 () Bool)

(assert (=> b!913884 (= e!512640 e!512641)))

(declare-fun c!95927 () Bool)

(assert (=> b!913884 (= c!95927 e!512638)))

(declare-fun res!616371 () Bool)

(assert (=> b!913884 (=> (not res!616371) (not e!512638))))

(assert (=> b!913884 (= res!616371 (bvslt #b00000000000000000000000000000000 (size!26564 _keys!1386)))))

(declare-fun b!913885 () Bool)

(declare-fun lt!411104 () Unit!30850)

(declare-fun lt!411105 () Unit!30850)

(assert (=> b!913885 (= lt!411104 lt!411105)))

(declare-fun lt!411106 () V!30503)

(declare-fun lt!411102 () (_ BitVec 64))

(declare-fun lt!411100 () (_ BitVec 64))

(declare-fun lt!411101 () ListLongMap!11281)

(assert (=> b!913885 (not (contains!4662 (+!2635 lt!411101 (tuple2!12595 lt!411102 lt!411106)) lt!411100))))

(assert (=> b!913885 (= lt!411105 (addStillNotContains!220 lt!411101 lt!411102 lt!411106 lt!411100))))

(assert (=> b!913885 (= lt!411100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!913885 (= lt!411106 (get!13703 (select (arr!26104 _values!1152) #b00000000000000000000000000000000) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!913885 (= lt!411102 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!913885 (= lt!411101 call!40475)))

(assert (=> b!913885 (= e!512637 (+!2635 call!40475 (tuple2!12595 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000) (get!13703 (select (arr!26104 _values!1152) #b00000000000000000000000000000000) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!913886 () Bool)

(assert (=> b!913886 (= e!512639 (= lt!411103 (getCurrentListMapNoExtraKeys!3332 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160)))))

(declare-fun b!913887 () Bool)

(declare-fun res!616368 () Bool)

(assert (=> b!913887 (=> (not res!616368) (not e!512640))))

(assert (=> b!913887 (= res!616368 (not (contains!4662 lt!411103 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112401 c!95928) b!913876))

(assert (= (and d!112401 (not c!95928)) b!913878))

(assert (= (and b!913878 c!95926) b!913885))

(assert (= (and b!913878 (not c!95926)) b!913881))

(assert (= (or b!913885 b!913881) bm!40472))

(assert (= (and d!112401 res!616369) b!913887))

(assert (= (and b!913887 res!616368) b!913884))

(assert (= (and b!913884 res!616371) b!913879))

(assert (= (and b!913884 c!95927) b!913880))

(assert (= (and b!913884 (not c!95927)) b!913882))

(assert (= (and b!913880 res!616370) b!913877))

(assert (= (and b!913882 c!95929) b!913886))

(assert (= (and b!913882 (not c!95929)) b!913883))

(declare-fun b_lambda!13341 () Bool)

(assert (=> (not b_lambda!13341) (not b!913877)))

(assert (=> b!913877 t!25958))

(declare-fun b_and!27319 () Bool)

(assert (= b_and!27317 (and (=> t!25958 result!10691) b_and!27319)))

(declare-fun b_lambda!13343 () Bool)

(assert (=> (not b_lambda!13343) (not b!913885)))

(assert (=> b!913885 t!25958))

(declare-fun b_and!27321 () Bool)

(assert (= b_and!27319 (and (=> t!25958 result!10691) b_and!27321)))

(declare-fun m!847987 () Bool)

(assert (=> d!112401 m!847987))

(assert (=> d!112401 m!847545))

(declare-fun m!847989 () Bool)

(assert (=> b!913886 m!847989))

(declare-fun m!847991 () Bool)

(assert (=> b!913883 m!847991))

(assert (=> bm!40472 m!847989))

(assert (=> b!913878 m!847623))

(assert (=> b!913878 m!847623))

(assert (=> b!913878 m!847631))

(assert (=> b!913877 m!847645))

(assert (=> b!913877 m!847623))

(assert (=> b!913877 m!847623))

(declare-fun m!847993 () Bool)

(assert (=> b!913877 m!847993))

(assert (=> b!913877 m!847529))

(assert (=> b!913877 m!847645))

(assert (=> b!913877 m!847529))

(assert (=> b!913877 m!847649))

(assert (=> b!913880 m!847623))

(assert (=> b!913880 m!847623))

(declare-fun m!847995 () Bool)

(assert (=> b!913880 m!847995))

(assert (=> b!913885 m!847645))

(declare-fun m!847997 () Bool)

(assert (=> b!913885 m!847997))

(assert (=> b!913885 m!847529))

(declare-fun m!847999 () Bool)

(assert (=> b!913885 m!847999))

(assert (=> b!913885 m!847645))

(assert (=> b!913885 m!847529))

(assert (=> b!913885 m!847649))

(declare-fun m!848001 () Bool)

(assert (=> b!913885 m!848001))

(declare-fun m!848003 () Bool)

(assert (=> b!913885 m!848003))

(assert (=> b!913885 m!847623))

(assert (=> b!913885 m!848001))

(assert (=> b!913879 m!847623))

(assert (=> b!913879 m!847623))

(assert (=> b!913879 m!847631))

(declare-fun m!848005 () Bool)

(assert (=> b!913887 m!848005))

(assert (=> bm!40454 d!112401))

(declare-fun d!112403 () Bool)

(declare-fun e!512643 () Bool)

(assert (=> d!112403 e!512643))

(declare-fun res!616372 () Bool)

(assert (=> d!112403 (=> res!616372 e!512643)))

(declare-fun lt!411110 () Bool)

(assert (=> d!112403 (= res!616372 (not lt!411110))))

(declare-fun lt!411107 () Bool)

(assert (=> d!112403 (= lt!411110 lt!411107)))

(declare-fun lt!411109 () Unit!30850)

(declare-fun e!512644 () Unit!30850)

(assert (=> d!112403 (= lt!411109 e!512644)))

(declare-fun c!95930 () Bool)

(assert (=> d!112403 (= c!95930 lt!411107)))

(assert (=> d!112403 (= lt!411107 (containsKey!443 (toList!5656 lt!410985) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112403 (= (contains!4662 lt!410985 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411110)))

(declare-fun b!913888 () Bool)

(declare-fun lt!411108 () Unit!30850)

(assert (=> b!913888 (= e!512644 lt!411108)))

(assert (=> b!913888 (= lt!411108 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 lt!410985) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913888 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410985) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913889 () Bool)

(declare-fun Unit!30861 () Unit!30850)

(assert (=> b!913889 (= e!512644 Unit!30861)))

(declare-fun b!913890 () Bool)

(assert (=> b!913890 (= e!512643 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410985) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112403 c!95930) b!913888))

(assert (= (and d!112403 (not c!95930)) b!913889))

(assert (= (and d!112403 (not res!616372)) b!913890))

(declare-fun m!848007 () Bool)

(assert (=> d!112403 m!848007))

(declare-fun m!848009 () Bool)

(assert (=> b!913888 m!848009))

(declare-fun m!848011 () Bool)

(assert (=> b!913888 m!848011))

(assert (=> b!913888 m!848011))

(declare-fun m!848013 () Bool)

(assert (=> b!913888 m!848013))

(assert (=> b!913890 m!848011))

(assert (=> b!913890 m!848011))

(assert (=> b!913890 m!848013))

(assert (=> bm!40460 d!112403))

(declare-fun d!112405 () Bool)

(assert (=> d!112405 (= (apply!521 lt!410950 (select (arr!26103 _keys!1386) #b00000000000000000000000000000000)) (get!13705 (getValueByKey!479 (toList!5656 lt!410950) (select (arr!26103 _keys!1386) #b00000000000000000000000000000000))))))

(declare-fun bs!25691 () Bool)

(assert (= bs!25691 d!112405))

(assert (=> bs!25691 m!847623))

(assert (=> bs!25691 m!847981))

(assert (=> bs!25691 m!847981))

(declare-fun m!848015 () Bool)

(assert (=> bs!25691 m!848015))

(assert (=> b!913697 d!112405))

(declare-fun d!112407 () Bool)

(declare-fun c!95931 () Bool)

(assert (=> d!112407 (= c!95931 ((_ is ValueCellFull!9095) (select (arr!26104 _values!1152) #b00000000000000000000000000000000)))))

(declare-fun e!512645 () V!30503)

(assert (=> d!112407 (= (get!13703 (select (arr!26104 _values!1152) #b00000000000000000000000000000000) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!512645)))

(declare-fun b!913891 () Bool)

(assert (=> b!913891 (= e!512645 (get!13706 (select (arr!26104 _values!1152) #b00000000000000000000000000000000) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!913892 () Bool)

(assert (=> b!913892 (= e!512645 (get!13707 (select (arr!26104 _values!1152) #b00000000000000000000000000000000) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112407 c!95931) b!913891))

(assert (= (and d!112407 (not c!95931)) b!913892))

(assert (=> b!913891 m!847645))

(assert (=> b!913891 m!847529))

(declare-fun m!848017 () Bool)

(assert (=> b!913891 m!848017))

(assert (=> b!913892 m!847645))

(assert (=> b!913892 m!847529))

(declare-fun m!848019 () Bool)

(assert (=> b!913892 m!848019))

(assert (=> b!913697 d!112407))

(assert (=> d!112317 d!112307))

(declare-fun d!112409 () Bool)

(declare-fun e!512648 () Bool)

(assert (=> d!112409 e!512648))

(declare-fun c!95934 () Bool)

(assert (=> d!112409 (= c!95934 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!112409 true))

(declare-fun _$15!98 () Unit!30850)

(assert (=> d!112409 (= (choose!1544 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) _$15!98)))

(declare-fun b!913897 () Bool)

(assert (=> b!913897 (= e!512648 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!913898 () Bool)

(assert (=> b!913898 (= e!512648 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112409 c!95934) b!913897))

(assert (= (and d!112409 (not c!95934)) b!913898))

(assert (=> b!913897 m!847517))

(assert (=> d!112305 d!112409))

(assert (=> d!112305 d!112307))

(assert (=> b!913738 d!112399))

(assert (=> d!112323 d!112307))

(declare-fun d!112411 () Bool)

(declare-fun res!616377 () Bool)

(declare-fun e!512653 () Bool)

(assert (=> d!112411 (=> res!616377 e!512653)))

(assert (=> d!112411 (= res!616377 (and ((_ is Cons!18370) (toList!5656 lt!410875)) (= (_1!6308 (h!19516 (toList!5656 lt!410875))) k0!1033)))))

(assert (=> d!112411 (= (containsKey!443 (toList!5656 lt!410875) k0!1033) e!512653)))

(declare-fun b!913903 () Bool)

(declare-fun e!512654 () Bool)

(assert (=> b!913903 (= e!512653 e!512654)))

(declare-fun res!616378 () Bool)

(assert (=> b!913903 (=> (not res!616378) (not e!512654))))

(assert (=> b!913903 (= res!616378 (and (or (not ((_ is Cons!18370) (toList!5656 lt!410875))) (bvsle (_1!6308 (h!19516 (toList!5656 lt!410875))) k0!1033)) ((_ is Cons!18370) (toList!5656 lt!410875)) (bvslt (_1!6308 (h!19516 (toList!5656 lt!410875))) k0!1033)))))

(declare-fun b!913904 () Bool)

(assert (=> b!913904 (= e!512654 (containsKey!443 (t!25960 (toList!5656 lt!410875)) k0!1033))))

(assert (= (and d!112411 (not res!616377)) b!913903))

(assert (= (and b!913903 res!616378) b!913904))

(declare-fun m!848021 () Bool)

(assert (=> b!913904 m!848021))

(assert (=> d!112321 d!112411))

(declare-fun d!112413 () Bool)

(assert (=> d!112413 (= (apply!521 (+!2635 lt!410963 (tuple2!12595 lt!410959 zeroValue!1094)) lt!410955) (apply!521 lt!410963 lt!410955))))

(declare-fun lt!411111 () Unit!30850)

(assert (=> d!112413 (= lt!411111 (choose!1546 lt!410963 lt!410959 zeroValue!1094 lt!410955))))

(declare-fun e!512655 () Bool)

(assert (=> d!112413 e!512655))

(declare-fun res!616379 () Bool)

(assert (=> d!112413 (=> (not res!616379) (not e!512655))))

(assert (=> d!112413 (= res!616379 (contains!4662 lt!410963 lt!410955))))

(assert (=> d!112413 (= (addApplyDifferent!350 lt!410963 lt!410959 zeroValue!1094 lt!410955) lt!411111)))

(declare-fun b!913905 () Bool)

(assert (=> b!913905 (= e!512655 (not (= lt!410955 lt!410959)))))

(assert (= (and d!112413 res!616379) b!913905))

(assert (=> d!112413 m!847669))

(assert (=> d!112413 m!847671))

(declare-fun m!848023 () Bool)

(assert (=> d!112413 m!848023))

(declare-fun m!848025 () Bool)

(assert (=> d!112413 m!848025))

(assert (=> d!112413 m!847669))

(assert (=> d!112413 m!847665))

(assert (=> b!913696 d!112413))

(declare-fun d!112415 () Bool)

(assert (=> d!112415 (= (apply!521 lt!410956 lt!410962) (get!13705 (getValueByKey!479 (toList!5656 lt!410956) lt!410962)))))

(declare-fun bs!25692 () Bool)

(assert (= bs!25692 d!112415))

(declare-fun m!848027 () Bool)

(assert (=> bs!25692 m!848027))

(assert (=> bs!25692 m!848027))

(declare-fun m!848029 () Bool)

(assert (=> bs!25692 m!848029))

(assert (=> b!913696 d!112415))

(declare-fun d!112417 () Bool)

(declare-fun e!512656 () Bool)

(assert (=> d!112417 e!512656))

(declare-fun res!616380 () Bool)

(assert (=> d!112417 (=> res!616380 e!512656)))

(declare-fun lt!411115 () Bool)

(assert (=> d!112417 (= res!616380 (not lt!411115))))

(declare-fun lt!411112 () Bool)

(assert (=> d!112417 (= lt!411115 lt!411112)))

(declare-fun lt!411114 () Unit!30850)

(declare-fun e!512657 () Unit!30850)

(assert (=> d!112417 (= lt!411114 e!512657)))

(declare-fun c!95935 () Bool)

(assert (=> d!112417 (= c!95935 lt!411112)))

(assert (=> d!112417 (= lt!411112 (containsKey!443 (toList!5656 (+!2635 lt!410949 (tuple2!12595 lt!410967 zeroValue!1094))) lt!410961))))

(assert (=> d!112417 (= (contains!4662 (+!2635 lt!410949 (tuple2!12595 lt!410967 zeroValue!1094)) lt!410961) lt!411115)))

(declare-fun b!913906 () Bool)

(declare-fun lt!411113 () Unit!30850)

(assert (=> b!913906 (= e!512657 lt!411113)))

(assert (=> b!913906 (= lt!411113 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 (+!2635 lt!410949 (tuple2!12595 lt!410967 zeroValue!1094))) lt!410961))))

(assert (=> b!913906 (isDefined!351 (getValueByKey!479 (toList!5656 (+!2635 lt!410949 (tuple2!12595 lt!410967 zeroValue!1094))) lt!410961))))

(declare-fun b!913907 () Bool)

(declare-fun Unit!30862 () Unit!30850)

(assert (=> b!913907 (= e!512657 Unit!30862)))

(declare-fun b!913908 () Bool)

(assert (=> b!913908 (= e!512656 (isDefined!351 (getValueByKey!479 (toList!5656 (+!2635 lt!410949 (tuple2!12595 lt!410967 zeroValue!1094))) lt!410961)))))

(assert (= (and d!112417 c!95935) b!913906))

(assert (= (and d!112417 (not c!95935)) b!913907))

(assert (= (and d!112417 (not res!616380)) b!913908))

(declare-fun m!848031 () Bool)

(assert (=> d!112417 m!848031))

(declare-fun m!848033 () Bool)

(assert (=> b!913906 m!848033))

(declare-fun m!848035 () Bool)

(assert (=> b!913906 m!848035))

(assert (=> b!913906 m!848035))

(declare-fun m!848037 () Bool)

(assert (=> b!913906 m!848037))

(assert (=> b!913908 m!848035))

(assert (=> b!913908 m!848035))

(assert (=> b!913908 m!848037))

(assert (=> b!913696 d!112417))

(declare-fun d!112419 () Bool)

(assert (=> d!112419 (= (apply!521 lt!410963 lt!410955) (get!13705 (getValueByKey!479 (toList!5656 lt!410963) lt!410955)))))

(declare-fun bs!25693 () Bool)

(assert (= bs!25693 d!112419))

(declare-fun m!848039 () Bool)

(assert (=> bs!25693 m!848039))

(assert (=> bs!25693 m!848039))

(declare-fun m!848041 () Bool)

(assert (=> bs!25693 m!848041))

(assert (=> b!913696 d!112419))

(declare-fun d!112421 () Bool)

(assert (=> d!112421 (contains!4662 (+!2635 lt!410949 (tuple2!12595 lt!410967 zeroValue!1094)) lt!410961)))

(declare-fun lt!411116 () Unit!30850)

(assert (=> d!112421 (= lt!411116 (choose!1547 lt!410949 lt!410967 zeroValue!1094 lt!410961))))

(assert (=> d!112421 (contains!4662 lt!410949 lt!410961)))

(assert (=> d!112421 (= (addStillContains!350 lt!410949 lt!410967 zeroValue!1094 lt!410961) lt!411116)))

(declare-fun bs!25694 () Bool)

(assert (= bs!25694 d!112421))

(assert (=> bs!25694 m!847661))

(assert (=> bs!25694 m!847661))

(assert (=> bs!25694 m!847673))

(declare-fun m!848043 () Bool)

(assert (=> bs!25694 m!848043))

(declare-fun m!848045 () Bool)

(assert (=> bs!25694 m!848045))

(assert (=> b!913696 d!112421))

(declare-fun d!112423 () Bool)

(declare-fun e!512658 () Bool)

(assert (=> d!112423 e!512658))

(declare-fun res!616381 () Bool)

(assert (=> d!112423 (=> (not res!616381) (not e!512658))))

(declare-fun lt!411118 () ListLongMap!11281)

(assert (=> d!112423 (= res!616381 (contains!4662 lt!411118 (_1!6308 (tuple2!12595 lt!410959 zeroValue!1094))))))

(declare-fun lt!411117 () List!18374)

(assert (=> d!112423 (= lt!411118 (ListLongMap!11282 lt!411117))))

(declare-fun lt!411119 () Unit!30850)

(declare-fun lt!411120 () Unit!30850)

(assert (=> d!112423 (= lt!411119 lt!411120)))

(assert (=> d!112423 (= (getValueByKey!479 lt!411117 (_1!6308 (tuple2!12595 lt!410959 zeroValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410959 zeroValue!1094))))))

(assert (=> d!112423 (= lt!411120 (lemmaContainsTupThenGetReturnValue!254 lt!411117 (_1!6308 (tuple2!12595 lt!410959 zeroValue!1094)) (_2!6308 (tuple2!12595 lt!410959 zeroValue!1094))))))

(assert (=> d!112423 (= lt!411117 (insertStrictlySorted!311 (toList!5656 lt!410963) (_1!6308 (tuple2!12595 lt!410959 zeroValue!1094)) (_2!6308 (tuple2!12595 lt!410959 zeroValue!1094))))))

(assert (=> d!112423 (= (+!2635 lt!410963 (tuple2!12595 lt!410959 zeroValue!1094)) lt!411118)))

(declare-fun b!913909 () Bool)

(declare-fun res!616382 () Bool)

(assert (=> b!913909 (=> (not res!616382) (not e!512658))))

(assert (=> b!913909 (= res!616382 (= (getValueByKey!479 (toList!5656 lt!411118) (_1!6308 (tuple2!12595 lt!410959 zeroValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410959 zeroValue!1094)))))))

(declare-fun b!913910 () Bool)

(assert (=> b!913910 (= e!512658 (contains!4665 (toList!5656 lt!411118) (tuple2!12595 lt!410959 zeroValue!1094)))))

(assert (= (and d!112423 res!616381) b!913909))

(assert (= (and b!913909 res!616382) b!913910))

(declare-fun m!848047 () Bool)

(assert (=> d!112423 m!848047))

(declare-fun m!848049 () Bool)

(assert (=> d!112423 m!848049))

(declare-fun m!848051 () Bool)

(assert (=> d!112423 m!848051))

(declare-fun m!848053 () Bool)

(assert (=> d!112423 m!848053))

(declare-fun m!848055 () Bool)

(assert (=> b!913909 m!848055))

(declare-fun m!848057 () Bool)

(assert (=> b!913910 m!848057))

(assert (=> b!913696 d!112423))

(declare-fun d!112425 () Bool)

(declare-fun e!512659 () Bool)

(assert (=> d!112425 e!512659))

(declare-fun res!616383 () Bool)

(assert (=> d!112425 (=> (not res!616383) (not e!512659))))

(declare-fun lt!411122 () ListLongMap!11281)

(assert (=> d!112425 (= res!616383 (contains!4662 lt!411122 (_1!6308 (tuple2!12595 lt!410969 minValue!1094))))))

(declare-fun lt!411121 () List!18374)

(assert (=> d!112425 (= lt!411122 (ListLongMap!11282 lt!411121))))

(declare-fun lt!411123 () Unit!30850)

(declare-fun lt!411124 () Unit!30850)

(assert (=> d!112425 (= lt!411123 lt!411124)))

(assert (=> d!112425 (= (getValueByKey!479 lt!411121 (_1!6308 (tuple2!12595 lt!410969 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410969 minValue!1094))))))

(assert (=> d!112425 (= lt!411124 (lemmaContainsTupThenGetReturnValue!254 lt!411121 (_1!6308 (tuple2!12595 lt!410969 minValue!1094)) (_2!6308 (tuple2!12595 lt!410969 minValue!1094))))))

(assert (=> d!112425 (= lt!411121 (insertStrictlySorted!311 (toList!5656 lt!410956) (_1!6308 (tuple2!12595 lt!410969 minValue!1094)) (_2!6308 (tuple2!12595 lt!410969 minValue!1094))))))

(assert (=> d!112425 (= (+!2635 lt!410956 (tuple2!12595 lt!410969 minValue!1094)) lt!411122)))

(declare-fun b!913911 () Bool)

(declare-fun res!616384 () Bool)

(assert (=> b!913911 (=> (not res!616384) (not e!512659))))

(assert (=> b!913911 (= res!616384 (= (getValueByKey!479 (toList!5656 lt!411122) (_1!6308 (tuple2!12595 lt!410969 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410969 minValue!1094)))))))

(declare-fun b!913912 () Bool)

(assert (=> b!913912 (= e!512659 (contains!4665 (toList!5656 lt!411122) (tuple2!12595 lt!410969 minValue!1094)))))

(assert (= (and d!112425 res!616383) b!913911))

(assert (= (and b!913911 res!616384) b!913912))

(declare-fun m!848059 () Bool)

(assert (=> d!112425 m!848059))

(declare-fun m!848061 () Bool)

(assert (=> d!112425 m!848061))

(declare-fun m!848063 () Bool)

(assert (=> d!112425 m!848063))

(declare-fun m!848065 () Bool)

(assert (=> d!112425 m!848065))

(declare-fun m!848067 () Bool)

(assert (=> b!913911 m!848067))

(declare-fun m!848069 () Bool)

(assert (=> b!913912 m!848069))

(assert (=> b!913696 d!112425))

(declare-fun d!112427 () Bool)

(declare-fun e!512660 () Bool)

(assert (=> d!112427 e!512660))

(declare-fun res!616385 () Bool)

(assert (=> d!112427 (=> (not res!616385) (not e!512660))))

(declare-fun lt!411126 () ListLongMap!11281)

(assert (=> d!112427 (= res!616385 (contains!4662 lt!411126 (_1!6308 (tuple2!12595 lt!410967 zeroValue!1094))))))

(declare-fun lt!411125 () List!18374)

(assert (=> d!112427 (= lt!411126 (ListLongMap!11282 lt!411125))))

(declare-fun lt!411127 () Unit!30850)

(declare-fun lt!411128 () Unit!30850)

(assert (=> d!112427 (= lt!411127 lt!411128)))

(assert (=> d!112427 (= (getValueByKey!479 lt!411125 (_1!6308 (tuple2!12595 lt!410967 zeroValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410967 zeroValue!1094))))))

(assert (=> d!112427 (= lt!411128 (lemmaContainsTupThenGetReturnValue!254 lt!411125 (_1!6308 (tuple2!12595 lt!410967 zeroValue!1094)) (_2!6308 (tuple2!12595 lt!410967 zeroValue!1094))))))

(assert (=> d!112427 (= lt!411125 (insertStrictlySorted!311 (toList!5656 lt!410949) (_1!6308 (tuple2!12595 lt!410967 zeroValue!1094)) (_2!6308 (tuple2!12595 lt!410967 zeroValue!1094))))))

(assert (=> d!112427 (= (+!2635 lt!410949 (tuple2!12595 lt!410967 zeroValue!1094)) lt!411126)))

(declare-fun b!913913 () Bool)

(declare-fun res!616386 () Bool)

(assert (=> b!913913 (=> (not res!616386) (not e!512660))))

(assert (=> b!913913 (= res!616386 (= (getValueByKey!479 (toList!5656 lt!411126) (_1!6308 (tuple2!12595 lt!410967 zeroValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410967 zeroValue!1094)))))))

(declare-fun b!913914 () Bool)

(assert (=> b!913914 (= e!512660 (contains!4665 (toList!5656 lt!411126) (tuple2!12595 lt!410967 zeroValue!1094)))))

(assert (= (and d!112427 res!616385) b!913913))

(assert (= (and b!913913 res!616386) b!913914))

(declare-fun m!848071 () Bool)

(assert (=> d!112427 m!848071))

(declare-fun m!848073 () Bool)

(assert (=> d!112427 m!848073))

(declare-fun m!848075 () Bool)

(assert (=> d!112427 m!848075))

(declare-fun m!848077 () Bool)

(assert (=> d!112427 m!848077))

(declare-fun m!848079 () Bool)

(assert (=> b!913913 m!848079))

(declare-fun m!848081 () Bool)

(assert (=> b!913914 m!848081))

(assert (=> b!913696 d!112427))

(declare-fun d!112429 () Bool)

(assert (=> d!112429 (= (apply!521 (+!2635 lt!410956 (tuple2!12595 lt!410969 minValue!1094)) lt!410962) (apply!521 lt!410956 lt!410962))))

(declare-fun lt!411129 () Unit!30850)

(assert (=> d!112429 (= lt!411129 (choose!1546 lt!410956 lt!410969 minValue!1094 lt!410962))))

(declare-fun e!512661 () Bool)

(assert (=> d!112429 e!512661))

(declare-fun res!616387 () Bool)

(assert (=> d!112429 (=> (not res!616387) (not e!512661))))

(assert (=> d!112429 (= res!616387 (contains!4662 lt!410956 lt!410962))))

(assert (=> d!112429 (= (addApplyDifferent!350 lt!410956 lt!410969 minValue!1094 lt!410962) lt!411129)))

(declare-fun b!913915 () Bool)

(assert (=> b!913915 (= e!512661 (not (= lt!410962 lt!410969)))))

(assert (= (and d!112429 res!616387) b!913915))

(assert (=> d!112429 m!847679))

(assert (=> d!112429 m!847681))

(declare-fun m!848083 () Bool)

(assert (=> d!112429 m!848083))

(declare-fun m!848085 () Bool)

(assert (=> d!112429 m!848085))

(assert (=> d!112429 m!847679))

(assert (=> d!112429 m!847683))

(assert (=> b!913696 d!112429))

(declare-fun d!112431 () Bool)

(declare-fun e!512662 () Bool)

(assert (=> d!112431 e!512662))

(declare-fun res!616388 () Bool)

(assert (=> d!112431 (=> (not res!616388) (not e!512662))))

(declare-fun lt!411131 () ListLongMap!11281)

(assert (=> d!112431 (= res!616388 (contains!4662 lt!411131 (_1!6308 (tuple2!12595 lt!410964 minValue!1094))))))

(declare-fun lt!411130 () List!18374)

(assert (=> d!112431 (= lt!411131 (ListLongMap!11282 lt!411130))))

(declare-fun lt!411132 () Unit!30850)

(declare-fun lt!411133 () Unit!30850)

(assert (=> d!112431 (= lt!411132 lt!411133)))

(assert (=> d!112431 (= (getValueByKey!479 lt!411130 (_1!6308 (tuple2!12595 lt!410964 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410964 minValue!1094))))))

(assert (=> d!112431 (= lt!411133 (lemmaContainsTupThenGetReturnValue!254 lt!411130 (_1!6308 (tuple2!12595 lt!410964 minValue!1094)) (_2!6308 (tuple2!12595 lt!410964 minValue!1094))))))

(assert (=> d!112431 (= lt!411130 (insertStrictlySorted!311 (toList!5656 lt!410948) (_1!6308 (tuple2!12595 lt!410964 minValue!1094)) (_2!6308 (tuple2!12595 lt!410964 minValue!1094))))))

(assert (=> d!112431 (= (+!2635 lt!410948 (tuple2!12595 lt!410964 minValue!1094)) lt!411131)))

(declare-fun b!913916 () Bool)

(declare-fun res!616389 () Bool)

(assert (=> b!913916 (=> (not res!616389) (not e!512662))))

(assert (=> b!913916 (= res!616389 (= (getValueByKey!479 (toList!5656 lt!411131) (_1!6308 (tuple2!12595 lt!410964 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 lt!410964 minValue!1094)))))))

(declare-fun b!913917 () Bool)

(assert (=> b!913917 (= e!512662 (contains!4665 (toList!5656 lt!411131) (tuple2!12595 lt!410964 minValue!1094)))))

(assert (= (and d!112431 res!616388) b!913916))

(assert (= (and b!913916 res!616389) b!913917))

(declare-fun m!848087 () Bool)

(assert (=> d!112431 m!848087))

(declare-fun m!848089 () Bool)

(assert (=> d!112431 m!848089))

(declare-fun m!848091 () Bool)

(assert (=> d!112431 m!848091))

(declare-fun m!848093 () Bool)

(assert (=> d!112431 m!848093))

(declare-fun m!848095 () Bool)

(assert (=> b!913916 m!848095))

(declare-fun m!848097 () Bool)

(assert (=> b!913917 m!848097))

(assert (=> b!913696 d!112431))

(declare-fun d!112433 () Bool)

(assert (=> d!112433 (= (apply!521 (+!2635 lt!410948 (tuple2!12595 lt!410964 minValue!1094)) lt!410966) (get!13705 (getValueByKey!479 (toList!5656 (+!2635 lt!410948 (tuple2!12595 lt!410964 minValue!1094))) lt!410966)))))

(declare-fun bs!25695 () Bool)

(assert (= bs!25695 d!112433))

(declare-fun m!848099 () Bool)

(assert (=> bs!25695 m!848099))

(assert (=> bs!25695 m!848099))

(declare-fun m!848101 () Bool)

(assert (=> bs!25695 m!848101))

(assert (=> b!913696 d!112433))

(declare-fun d!112435 () Bool)

(assert (=> d!112435 (= (apply!521 lt!410948 lt!410966) (get!13705 (getValueByKey!479 (toList!5656 lt!410948) lt!410966)))))

(declare-fun bs!25696 () Bool)

(assert (= bs!25696 d!112435))

(declare-fun m!848103 () Bool)

(assert (=> bs!25696 m!848103))

(assert (=> bs!25696 m!848103))

(declare-fun m!848105 () Bool)

(assert (=> bs!25696 m!848105))

(assert (=> b!913696 d!112435))

(declare-fun d!112437 () Bool)

(assert (=> d!112437 (= (apply!521 (+!2635 lt!410956 (tuple2!12595 lt!410969 minValue!1094)) lt!410962) (get!13705 (getValueByKey!479 (toList!5656 (+!2635 lt!410956 (tuple2!12595 lt!410969 minValue!1094))) lt!410962)))))

(declare-fun bs!25697 () Bool)

(assert (= bs!25697 d!112437))

(declare-fun m!848107 () Bool)

(assert (=> bs!25697 m!848107))

(assert (=> bs!25697 m!848107))

(declare-fun m!848109 () Bool)

(assert (=> bs!25697 m!848109))

(assert (=> b!913696 d!112437))

(declare-fun d!112439 () Bool)

(assert (=> d!112439 (= (apply!521 (+!2635 lt!410963 (tuple2!12595 lt!410959 zeroValue!1094)) lt!410955) (get!13705 (getValueByKey!479 (toList!5656 (+!2635 lt!410963 (tuple2!12595 lt!410959 zeroValue!1094))) lt!410955)))))

(declare-fun bs!25698 () Bool)

(assert (= bs!25698 d!112439))

(declare-fun m!848111 () Bool)

(assert (=> bs!25698 m!848111))

(assert (=> bs!25698 m!848111))

(declare-fun m!848113 () Bool)

(assert (=> bs!25698 m!848113))

(assert (=> b!913696 d!112439))

(declare-fun d!112441 () Bool)

(assert (=> d!112441 (= (apply!521 (+!2635 lt!410948 (tuple2!12595 lt!410964 minValue!1094)) lt!410966) (apply!521 lt!410948 lt!410966))))

(declare-fun lt!411134 () Unit!30850)

(assert (=> d!112441 (= lt!411134 (choose!1546 lt!410948 lt!410964 minValue!1094 lt!410966))))

(declare-fun e!512663 () Bool)

(assert (=> d!112441 e!512663))

(declare-fun res!616390 () Bool)

(assert (=> d!112441 (=> (not res!616390) (not e!512663))))

(assert (=> d!112441 (= res!616390 (contains!4662 lt!410948 lt!410966))))

(assert (=> d!112441 (= (addApplyDifferent!350 lt!410948 lt!410964 minValue!1094 lt!410966) lt!411134)))

(declare-fun b!913918 () Bool)

(assert (=> b!913918 (= e!512663 (not (= lt!410966 lt!410964)))))

(assert (= (and d!112441 res!616390) b!913918))

(assert (=> d!112441 m!847657))

(assert (=> d!112441 m!847659))

(declare-fun m!848115 () Bool)

(assert (=> d!112441 m!848115))

(declare-fun m!848117 () Bool)

(assert (=> d!112441 m!848117))

(assert (=> d!112441 m!847657))

(assert (=> d!112441 m!847685))

(assert (=> b!913696 d!112441))

(assert (=> b!913696 d!112401))

(declare-fun d!112443 () Bool)

(assert (=> d!112443 (= (apply!521 lt!410985 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13705 (getValueByKey!479 (toList!5656 lt!410985) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25699 () Bool)

(assert (= bs!25699 d!112443))

(assert (=> bs!25699 m!848011))

(assert (=> bs!25699 m!848011))

(declare-fun m!848119 () Bool)

(assert (=> bs!25699 m!848119))

(assert (=> b!913721 d!112443))

(declare-fun d!112445 () Bool)

(declare-fun res!616391 () Bool)

(declare-fun e!512664 () Bool)

(assert (=> d!112445 (=> res!616391 e!512664)))

(assert (=> d!112445 (= res!616391 (and ((_ is Cons!18370) (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6308 (h!19516 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112445 (= (containsKey!443 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!512664)))

(declare-fun b!913919 () Bool)

(declare-fun e!512665 () Bool)

(assert (=> b!913919 (= e!512664 e!512665)))

(declare-fun res!616392 () Bool)

(assert (=> b!913919 (=> (not res!616392) (not e!512665))))

(assert (=> b!913919 (= res!616392 (and (or (not ((_ is Cons!18370) (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) (bvsle (_1!6308 (h!19516 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)) ((_ is Cons!18370) (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (bvslt (_1!6308 (h!19516 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(declare-fun b!913920 () Bool)

(assert (=> b!913920 (= e!512665 (containsKey!443 (t!25960 (toList!5656 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(assert (= (and d!112445 (not res!616391)) b!913919))

(assert (= (and b!913919 res!616392) b!913920))

(declare-fun m!848121 () Bool)

(assert (=> b!913920 m!848121))

(assert (=> d!112315 d!112445))

(declare-fun d!112447 () Bool)

(declare-fun e!512666 () Bool)

(assert (=> d!112447 e!512666))

(declare-fun res!616393 () Bool)

(assert (=> d!112447 (=> (not res!616393) (not e!512666))))

(declare-fun lt!411136 () ListLongMap!11281)

(assert (=> d!112447 (= res!616393 (contains!4662 lt!411136 (_1!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!411135 () List!18374)

(assert (=> d!112447 (= lt!411136 (ListLongMap!11282 lt!411135))))

(declare-fun lt!411137 () Unit!30850)

(declare-fun lt!411138 () Unit!30850)

(assert (=> d!112447 (= lt!411137 lt!411138)))

(assert (=> d!112447 (= (getValueByKey!479 lt!411135 (_1!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112447 (= lt!411138 (lemmaContainsTupThenGetReturnValue!254 lt!411135 (_1!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112447 (= lt!411135 (insertStrictlySorted!311 (toList!5656 call!40458) (_1!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112447 (= (+!2635 call!40458 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!411136)))

(declare-fun b!913921 () Bool)

(declare-fun res!616394 () Bool)

(assert (=> b!913921 (=> (not res!616394) (not e!512666))))

(assert (=> b!913921 (= res!616394 (= (getValueByKey!479 (toList!5656 lt!411136) (_1!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!484 (_2!6308 (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!913922 () Bool)

(assert (=> b!913922 (= e!512666 (contains!4665 (toList!5656 lt!411136) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112447 res!616393) b!913921))

(assert (= (and b!913921 res!616394) b!913922))

(declare-fun m!848123 () Bool)

(assert (=> d!112447 m!848123))

(declare-fun m!848125 () Bool)

(assert (=> d!112447 m!848125))

(declare-fun m!848127 () Bool)

(assert (=> d!112447 m!848127))

(declare-fun m!848129 () Bool)

(assert (=> d!112447 m!848129))

(declare-fun m!848131 () Bool)

(assert (=> b!913921 m!848131))

(declare-fun m!848133 () Bool)

(assert (=> b!913922 m!848133))

(assert (=> b!913694 d!112447))

(declare-fun d!112449 () Bool)

(declare-fun res!616395 () Bool)

(declare-fun e!512667 () Bool)

(assert (=> d!112449 (=> res!616395 e!512667)))

(assert (=> d!112449 (= res!616395 (= (select (arr!26103 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1033))))

(assert (=> d!112449 (= (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!512667)))

(declare-fun b!913923 () Bool)

(declare-fun e!512668 () Bool)

(assert (=> b!913923 (= e!512667 e!512668)))

(declare-fun res!616396 () Bool)

(assert (=> b!913923 (=> (not res!616396) (not e!512668))))

(assert (=> b!913923 (= res!616396 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!26564 _keys!1386)))))

(declare-fun b!913924 () Bool)

(assert (=> b!913924 (= e!512668 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!112449 (not res!616395)) b!913923))

(assert (= (and b!913923 res!616396) b!913924))

(assert (=> d!112449 m!847901))

(declare-fun m!848135 () Bool)

(assert (=> b!913924 m!848135))

(assert (=> b!913609 d!112449))

(declare-fun d!112451 () Bool)

(declare-fun e!512669 () Bool)

(assert (=> d!112451 e!512669))

(declare-fun res!616397 () Bool)

(assert (=> d!112451 (=> (not res!616397) (not e!512669))))

(declare-fun lt!411140 () ListLongMap!11281)

(assert (=> d!112451 (= res!616397 (contains!4662 lt!411140 (_1!6308 (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!411139 () List!18374)

(assert (=> d!112451 (= lt!411140 (ListLongMap!11282 lt!411139))))

(declare-fun lt!411141 () Unit!30850)

(declare-fun lt!411142 () Unit!30850)

(assert (=> d!112451 (= lt!411141 lt!411142)))

(assert (=> d!112451 (= (getValueByKey!479 lt!411139 (_1!6308 (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!484 (_2!6308 (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112451 (= lt!411142 (lemmaContainsTupThenGetReturnValue!254 lt!411139 (_1!6308 (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6308 (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112451 (= lt!411139 (insertStrictlySorted!311 (toList!5656 (ite c!95878 call!40457 (ite c!95875 call!40459 call!40455))) (_1!6308 (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6308 (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112451 (= (+!2635 (ite c!95878 call!40457 (ite c!95875 call!40459 call!40455)) (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!411140)))

(declare-fun b!913925 () Bool)

(declare-fun res!616398 () Bool)

(assert (=> b!913925 (=> (not res!616398) (not e!512669))))

(assert (=> b!913925 (= res!616398 (= (getValueByKey!479 (toList!5656 lt!411140) (_1!6308 (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!484 (_2!6308 (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!913926 () Bool)

(assert (=> b!913926 (= e!512669 (contains!4665 (toList!5656 lt!411140) (ite (or c!95878 c!95875) (tuple2!12595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112451 res!616397) b!913925))

(assert (= (and b!913925 res!616398) b!913926))

(declare-fun m!848137 () Bool)

(assert (=> d!112451 m!848137))

(declare-fun m!848139 () Bool)

(assert (=> d!112451 m!848139))

(declare-fun m!848141 () Bool)

(assert (=> d!112451 m!848141))

(declare-fun m!848143 () Bool)

(assert (=> d!112451 m!848143))

(declare-fun m!848145 () Bool)

(assert (=> b!913925 m!848145))

(declare-fun m!848147 () Bool)

(assert (=> b!913926 m!848147))

(assert (=> bm!40451 d!112451))

(declare-fun d!112453 () Bool)

(declare-fun e!512670 () Bool)

(assert (=> d!112453 e!512670))

(declare-fun res!616399 () Bool)

(assert (=> d!112453 (=> res!616399 e!512670)))

(declare-fun lt!411146 () Bool)

(assert (=> d!112453 (= res!616399 (not lt!411146))))

(declare-fun lt!411143 () Bool)

(assert (=> d!112453 (= lt!411146 lt!411143)))

(declare-fun lt!411145 () Unit!30850)

(declare-fun e!512671 () Unit!30850)

(assert (=> d!112453 (= lt!411145 e!512671)))

(declare-fun c!95936 () Bool)

(assert (=> d!112453 (= c!95936 lt!411143)))

(assert (=> d!112453 (= lt!411143 (containsKey!443 (toList!5656 lt!410985) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112453 (= (contains!4662 lt!410985 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411146)))

(declare-fun b!913927 () Bool)

(declare-fun lt!411144 () Unit!30850)

(assert (=> b!913927 (= e!512671 lt!411144)))

(assert (=> b!913927 (= lt!411144 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 lt!410985) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913927 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410985) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913928 () Bool)

(declare-fun Unit!30863 () Unit!30850)

(assert (=> b!913928 (= e!512671 Unit!30863)))

(declare-fun b!913929 () Bool)

(assert (=> b!913929 (= e!512670 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410985) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112453 c!95936) b!913927))

(assert (= (and d!112453 (not c!95936)) b!913928))

(assert (= (and d!112453 (not res!616399)) b!913929))

(declare-fun m!848149 () Bool)

(assert (=> d!112453 m!848149))

(declare-fun m!848151 () Bool)

(assert (=> b!913927 m!848151))

(declare-fun m!848153 () Bool)

(assert (=> b!913927 m!848153))

(assert (=> b!913927 m!848153))

(declare-fun m!848155 () Bool)

(assert (=> b!913927 m!848155))

(assert (=> b!913929 m!848153))

(assert (=> b!913929 m!848153))

(assert (=> b!913929 m!848155))

(assert (=> bm!40465 d!112453))

(declare-fun d!112455 () Bool)

(assert (=> d!112455 (= (get!13706 (select (arr!26104 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!12140 (select (arr!26104 _values!1152) i!717)))))

(assert (=> b!913743 d!112455))

(declare-fun d!112457 () Bool)

(assert (=> d!112457 (= (get!13707 (select (arr!26104 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913744 d!112457))

(declare-fun d!112459 () Bool)

(declare-fun e!512672 () Bool)

(assert (=> d!112459 e!512672))

(declare-fun res!616400 () Bool)

(assert (=> d!112459 (=> res!616400 e!512672)))

(declare-fun lt!411150 () Bool)

(assert (=> d!112459 (= res!616400 (not lt!411150))))

(declare-fun lt!411147 () Bool)

(assert (=> d!112459 (= lt!411150 lt!411147)))

(declare-fun lt!411149 () Unit!30850)

(declare-fun e!512673 () Unit!30850)

(assert (=> d!112459 (= lt!411149 e!512673)))

(declare-fun c!95937 () Bool)

(assert (=> d!112459 (= c!95937 lt!411147)))

(assert (=> d!112459 (= lt!411147 (containsKey!443 (toList!5656 lt!410985) (select (arr!26103 _keys!1386) i!717)))))

(assert (=> d!112459 (= (contains!4662 lt!410985 (select (arr!26103 _keys!1386) i!717)) lt!411150)))

(declare-fun b!913930 () Bool)

(declare-fun lt!411148 () Unit!30850)

(assert (=> b!913930 (= e!512673 lt!411148)))

(assert (=> b!913930 (= lt!411148 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 lt!410985) (select (arr!26103 _keys!1386) i!717)))))

(assert (=> b!913930 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410985) (select (arr!26103 _keys!1386) i!717)))))

(declare-fun b!913931 () Bool)

(declare-fun Unit!30864 () Unit!30850)

(assert (=> b!913931 (= e!512673 Unit!30864)))

(declare-fun b!913932 () Bool)

(assert (=> b!913932 (= e!512672 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410985) (select (arr!26103 _keys!1386) i!717))))))

(assert (= (and d!112459 c!95937) b!913930))

(assert (= (and d!112459 (not c!95937)) b!913931))

(assert (= (and d!112459 (not res!616400)) b!913932))

(assert (=> d!112459 m!847543))

(declare-fun m!848157 () Bool)

(assert (=> d!112459 m!848157))

(assert (=> b!913930 m!847543))

(declare-fun m!848159 () Bool)

(assert (=> b!913930 m!848159))

(assert (=> b!913930 m!847543))

(declare-fun m!848161 () Bool)

(assert (=> b!913930 m!848161))

(assert (=> b!913930 m!848161))

(declare-fun m!848163 () Bool)

(assert (=> b!913930 m!848163))

(assert (=> b!913932 m!847543))

(assert (=> b!913932 m!848161))

(assert (=> b!913932 m!848161))

(assert (=> b!913932 m!848163))

(assert (=> b!913734 d!112459))

(declare-fun d!112461 () Bool)

(assert (=> d!112461 (= (apply!521 lt!410985 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13705 (getValueByKey!479 (toList!5656 lt!410985) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25700 () Bool)

(assert (= bs!25700 d!112461))

(assert (=> bs!25700 m!848153))

(assert (=> bs!25700 m!848153))

(declare-fun m!848165 () Bool)

(assert (=> bs!25700 m!848165))

(assert (=> b!913718 d!112461))

(declare-fun d!112463 () Bool)

(assert (=> d!112463 (= (get!13705 (getValueByKey!479 (toList!5656 lt!410875) k0!1033)) (v!12143 (getValueByKey!479 (toList!5656 lt!410875) k0!1033)))))

(assert (=> d!112325 d!112463))

(assert (=> d!112325 d!112371))

(assert (=> b!913690 d!112329))

(assert (=> bm!40464 d!112341))

(declare-fun d!112465 () Bool)

(declare-fun e!512674 () Bool)

(assert (=> d!112465 e!512674))

(declare-fun res!616401 () Bool)

(assert (=> d!112465 (=> res!616401 e!512674)))

(declare-fun lt!411154 () Bool)

(assert (=> d!112465 (= res!616401 (not lt!411154))))

(declare-fun lt!411151 () Bool)

(assert (=> d!112465 (= lt!411154 lt!411151)))

(declare-fun lt!411153 () Unit!30850)

(declare-fun e!512675 () Unit!30850)

(assert (=> d!112465 (= lt!411153 e!512675)))

(declare-fun c!95938 () Bool)

(assert (=> d!112465 (= c!95938 lt!411151)))

(assert (=> d!112465 (= lt!411151 (containsKey!443 (toList!5656 lt!410950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112465 (= (contains!4662 lt!410950 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411154)))

(declare-fun b!913933 () Bool)

(declare-fun lt!411152 () Unit!30850)

(assert (=> b!913933 (= e!512675 lt!411152)))

(assert (=> b!913933 (= lt!411152 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5656 lt!410950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913933 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913934 () Bool)

(declare-fun Unit!30865 () Unit!30850)

(assert (=> b!913934 (= e!512675 Unit!30865)))

(declare-fun b!913935 () Bool)

(assert (=> b!913935 (= e!512674 (isDefined!351 (getValueByKey!479 (toList!5656 lt!410950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112465 c!95938) b!913933))

(assert (= (and d!112465 (not c!95938)) b!913934))

(assert (= (and d!112465 (not res!616401)) b!913935))

(declare-fun m!848167 () Bool)

(assert (=> d!112465 m!848167))

(declare-fun m!848169 () Bool)

(assert (=> b!913933 m!848169))

(assert (=> b!913933 m!847931))

(assert (=> b!913933 m!847931))

(declare-fun m!848171 () Bool)

(assert (=> b!913933 m!848171))

(assert (=> b!913935 m!847931))

(assert (=> b!913935 m!847931))

(assert (=> b!913935 m!848171))

(assert (=> bm!40450 d!112465))

(declare-fun d!112467 () Bool)

(assert (=> d!112467 (= (apply!521 lt!410985 (select (arr!26103 _keys!1386) i!717)) (get!13705 (getValueByKey!479 (toList!5656 lt!410985) (select (arr!26103 _keys!1386) i!717))))))

(declare-fun bs!25701 () Bool)

(assert (= bs!25701 d!112467))

(assert (=> bs!25701 m!847543))

(assert (=> bs!25701 m!848161))

(assert (=> bs!25701 m!848161))

(declare-fun m!848173 () Bool)

(assert (=> bs!25701 m!848173))

(assert (=> b!913733 d!112467))

(assert (=> b!913733 d!112327))

(assert (=> b!913639 d!112333))

(assert (=> b!913639 d!112335))

(declare-fun mapNonEmpty!30474 () Bool)

(declare-fun mapRes!30474 () Bool)

(declare-fun tp!58506 () Bool)

(declare-fun e!512677 () Bool)

(assert (=> mapNonEmpty!30474 (= mapRes!30474 (and tp!58506 e!512677))))

(declare-fun mapKey!30474 () (_ BitVec 32))

(declare-fun mapValue!30474 () ValueCell!9095)

(declare-fun mapRest!30474 () (Array (_ BitVec 32) ValueCell!9095))

(assert (=> mapNonEmpty!30474 (= mapRest!30473 (store mapRest!30474 mapKey!30474 mapValue!30474))))

(declare-fun condMapEmpty!30474 () Bool)

(declare-fun mapDefault!30474 () ValueCell!9095)

(assert (=> mapNonEmpty!30473 (= condMapEmpty!30474 (= mapRest!30473 ((as const (Array (_ BitVec 32) ValueCell!9095)) mapDefault!30474)))))

(declare-fun e!512676 () Bool)

(assert (=> mapNonEmpty!30473 (= tp!58505 (and e!512676 mapRes!30474))))

(declare-fun b!913937 () Bool)

(assert (=> b!913937 (= e!512676 tp_is_empty!19153)))

(declare-fun mapIsEmpty!30474 () Bool)

(assert (=> mapIsEmpty!30474 mapRes!30474))

(declare-fun b!913936 () Bool)

(assert (=> b!913936 (= e!512677 tp_is_empty!19153)))

(assert (= (and mapNonEmpty!30473 condMapEmpty!30474) mapIsEmpty!30474))

(assert (= (and mapNonEmpty!30473 (not condMapEmpty!30474)) mapNonEmpty!30474))

(assert (= (and mapNonEmpty!30474 ((_ is ValueCellFull!9095) mapValue!30474)) b!913936))

(assert (= (and mapNonEmpty!30473 ((_ is ValueCellFull!9095) mapDefault!30474)) b!913937))

(declare-fun m!848175 () Bool)

(assert (=> mapNonEmpty!30474 m!848175))

(declare-fun b_lambda!13345 () Bool)

(assert (= b_lambda!13337 (or (and start!78296 b_free!16735) b_lambda!13345)))

(declare-fun b_lambda!13347 () Bool)

(assert (= b_lambda!13343 (or (and start!78296 b_free!16735) b_lambda!13347)))

(declare-fun b_lambda!13349 () Bool)

(assert (= b_lambda!13341 (or (and start!78296 b_free!16735) b_lambda!13349)))

(declare-fun b_lambda!13351 () Bool)

(assert (= b_lambda!13339 (or (and start!78296 b_free!16735) b_lambda!13351)))

(check-sat (not d!112363) (not d!112431) (not b_lambda!13335) (not b!913920) (not bm!40471) (not b!913924) (not b_lambda!13333) (not bm!40469) (not b_lambda!13327) (not d!112451) (not d!112349) (not b!913811) (not b!913809) (not b!913930) (not b!913872) (not d!112331) (not d!112397) (not b_lambda!13347) (not b!913904) (not b!913935) (not b!913804) (not b!913877) (not b!913831) (not d!112439) (not d!112437) (not mapNonEmpty!30474) (not d!112377) (not b!913820) (not d!112443) (not b!913933) (not b!913897) (not d!112441) (not d!112425) (not d!112467) (not d!112369) (not b!913909) (not b!913832) (not d!112421) (not d!112417) (not b!913863) (not b!913875) (not b!913890) (not b!913819) (not d!112333) (not d!112465) (not d!112345) (not d!112429) (not b!913906) (not b!913830) (not d!112361) (not b!913823) (not b!913891) (not b!913818) (not b!913852) (not d!112337) (not d!112339) (not b_lambda!13351) (not bm!40472) (not d!112433) (not b!913880) (not b!913908) (not b_lambda!13349) (not b!913812) (not b!913855) tp_is_empty!19153 (not b!913857) (not b!913873) (not d!112461) (not b!913914) (not d!112391) (not b!913766) (not b!913886) (not d!112351) (not d!112403) (not d!112347) (not b!913921) (not d!112373) (not d!112343) (not b!913805) (not b!913856) (not b!913913) (not b!913864) (not d!112365) (not d!112401) (not b!913755) (not b!913910) (not b!913911) (not b!913773) (not b!913860) (not d!112459) (not b!913932) (not b!913803) (not b!913879) (not d!112383) (not b!913813) (not d!112427) (not b!913926) (not b!913929) (not d!112389) (not d!112393) (not b!913927) (not d!112419) (not d!112385) (not b!913861) (not d!112357) (not b!913828) (not d!112415) (not b!913836) (not b!913892) (not d!112395) (not d!112341) (not d!112435) (not d!112453) (not d!112359) (not b!913917) (not b_next!16735) (not b!913862) (not d!112447) (not b!913822) (not d!112367) (not b!913816) (not b!913887) (not b!913916) (not b_lambda!13345) (not b!913922) (not b!913925) (not d!112423) b_and!27321 (not b!913912) (not b!913772) (not b!913878) (not b!913814) (not b!913883) (not d!112413) (not b!913806) (not b!913815) (not b!913888) (not d!112405) (not d!112381) (not d!112353) (not d!112355) (not b!913885) (not bm!40470) (not b!913866))
(check-sat b_and!27321 (not b_next!16735))
