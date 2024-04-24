; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78562 () Bool)

(assert start!78562)

(declare-fun b_free!16759 () Bool)

(declare-fun b_next!16759 () Bool)

(assert (=> start!78562 (= b_free!16759 (not b_next!16759))))

(declare-fun tp!58565 () Bool)

(declare-fun b_and!27389 () Bool)

(assert (=> start!78562 (= tp!58565 b_and!27389)))

(declare-fun bm!40546 () Bool)

(declare-datatypes ((V!30535 0))(
  ( (V!30536 (val!9639 Int)) )
))
(declare-fun call!40549 () V!30535)

(declare-datatypes ((tuple2!12528 0))(
  ( (tuple2!12529 (_1!6275 (_ BitVec 64)) (_2!6275 V!30535)) )
))
(declare-datatypes ((List!18339 0))(
  ( (Nil!18336) (Cons!18335 (h!19487 tuple2!12528) (t!25942 List!18339)) )
))
(declare-datatypes ((ListLongMap!11227 0))(
  ( (ListLongMap!11228 (toList!5629 List!18339)) )
))
(declare-fun lt!411853 () ListLongMap!11227)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!535 (ListLongMap!11227 (_ BitVec 64)) V!30535)

(assert (=> bm!40546 (= call!40549 (apply!535 lt!411853 k0!1033))))

(declare-fun res!617097 () Bool)

(declare-fun e!513624 () Bool)

(assert (=> start!78562 (=> (not res!617097) (not e!513624))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78562 (= res!617097 (validMask!0 mask!1756))))

(assert (=> start!78562 e!513624))

(declare-datatypes ((ValueCell!9107 0))(
  ( (ValueCellFull!9107 (v!12152 V!30535)) (EmptyCell!9107) )
))
(declare-datatypes ((array!54407 0))(
  ( (array!54408 (arr!26150 (Array (_ BitVec 32) ValueCell!9107)) (size!26610 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54407)

(declare-fun e!513617 () Bool)

(declare-fun array_inv!20514 (array!54407) Bool)

(assert (=> start!78562 (and (array_inv!20514 _values!1152) e!513617)))

(assert (=> start!78562 tp!58565))

(assert (=> start!78562 true))

(declare-fun tp_is_empty!19177 () Bool)

(assert (=> start!78562 tp_is_empty!19177))

(declare-datatypes ((array!54409 0))(
  ( (array!54410 (arr!26151 (Array (_ BitVec 32) (_ BitVec 64))) (size!26611 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54409)

(declare-fun array_inv!20515 (array!54409) Bool)

(assert (=> start!78562 (array_inv!20515 _keys!1386)))

(declare-fun b!915419 () Bool)

(declare-fun res!617098 () Bool)

(assert (=> b!915419 (=> (not res!617098) (not e!513624))))

(declare-datatypes ((List!18340 0))(
  ( (Nil!18337) (Cons!18336 (h!19488 (_ BitVec 64)) (t!25943 List!18340)) )
))
(declare-fun arrayNoDuplicates!0 (array!54409 (_ BitVec 32) List!18340) Bool)

(assert (=> b!915419 (= res!617098 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18337))))

(declare-fun b!915420 () Bool)

(declare-fun e!513626 () Bool)

(declare-fun zeroValue!1094 () V!30535)

(assert (=> b!915420 (= e!513626 (not (= call!40549 zeroValue!1094)))))

(declare-fun mapNonEmpty!30504 () Bool)

(declare-fun mapRes!30504 () Bool)

(declare-fun tp!58566 () Bool)

(declare-fun e!513622 () Bool)

(assert (=> mapNonEmpty!30504 (= mapRes!30504 (and tp!58566 e!513622))))

(declare-fun mapValue!30504 () ValueCell!9107)

(declare-fun mapKey!30504 () (_ BitVec 32))

(declare-fun mapRest!30504 () (Array (_ BitVec 32) ValueCell!9107))

(assert (=> mapNonEmpty!30504 (= (arr!26150 _values!1152) (store mapRest!30504 mapKey!30504 mapValue!30504))))

(declare-fun b!915421 () Bool)

(declare-fun res!617100 () Bool)

(declare-fun e!513623 () Bool)

(assert (=> b!915421 (=> (not res!617100) (not e!513623))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!915421 (= res!617100 (inRange!0 i!717 mask!1756))))

(declare-fun b!915422 () Bool)

(declare-fun res!617093 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!915422 (= res!617093 (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun e!513619 () Bool)

(assert (=> b!915422 (=> res!617093 e!513619)))

(declare-fun e!513621 () Bool)

(assert (=> b!915422 (= e!513621 e!513619)))

(declare-fun mapIsEmpty!30504 () Bool)

(assert (=> mapIsEmpty!30504 mapRes!30504))

(declare-fun b!915423 () Bool)

(declare-fun res!617092 () Bool)

(assert (=> b!915423 (=> (not res!617092) (not e!513624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54409 (_ BitVec 32)) Bool)

(assert (=> b!915423 (= res!617092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!915424 () Bool)

(declare-fun e!513625 () Bool)

(assert (=> b!915424 (= e!513625 e!513621)))

(declare-fun res!617094 () Bool)

(assert (=> b!915424 (= res!617094 (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!915424 (=> (not res!617094) (not e!513621))))

(declare-fun b!915425 () Bool)

(declare-fun e!513618 () Bool)

(assert (=> b!915425 (= e!513618 tp_is_empty!19177)))

(declare-fun b!915426 () Bool)

(assert (=> b!915426 (= e!513624 e!513623)))

(declare-fun res!617096 () Bool)

(assert (=> b!915426 (=> (not res!617096) (not e!513623))))

(declare-fun contains!4688 (ListLongMap!11227 (_ BitVec 64)) Bool)

(assert (=> b!915426 (= res!617096 (contains!4688 lt!411853 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun minValue!1094 () V!30535)

(declare-fun getCurrentListMap!2889 (array!54409 array!54407 (_ BitVec 32) (_ BitVec 32) V!30535 V!30535 (_ BitVec 32) Int) ListLongMap!11227)

(assert (=> b!915426 (= lt!411853 (getCurrentListMap!2889 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!915427 () Bool)

(assert (=> b!915427 (= e!513619 (not (= call!40549 minValue!1094)))))

(declare-fun b!915428 () Bool)

(declare-fun res!617099 () Bool)

(assert (=> b!915428 (=> (not res!617099) (not e!513623))))

(assert (=> b!915428 (= res!617099 (and (= (select (arr!26151 _keys!1386) i!717) k0!1033) (or (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!915429 () Bool)

(assert (=> b!915429 (= e!513625 e!513626)))

(declare-fun res!617101 () Bool)

(assert (=> b!915429 (= res!617101 (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!915429 (=> res!617101 e!513626)))

(declare-fun b!915430 () Bool)

(assert (=> b!915430 (= e!513617 (and e!513618 mapRes!30504))))

(declare-fun condMapEmpty!30504 () Bool)

(declare-fun mapDefault!30504 () ValueCell!9107)

(assert (=> b!915430 (= condMapEmpty!30504 (= (arr!26150 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9107)) mapDefault!30504)))))

(declare-fun b!915431 () Bool)

(declare-fun res!617095 () Bool)

(assert (=> b!915431 (=> (not res!617095) (not e!513624))))

(assert (=> b!915431 (= res!617095 (and (= (size!26610 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26611 _keys!1386) (size!26610 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!915432 () Bool)

(assert (=> b!915432 (= e!513622 tp_is_empty!19177)))

(declare-fun b!915433 () Bool)

(assert (=> b!915433 (= e!513623 e!513625)))

(declare-fun c!96288 () Bool)

(assert (=> b!915433 (= c!96288 (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!78562 res!617097) b!915431))

(assert (= (and b!915431 res!617095) b!915423))

(assert (= (and b!915423 res!617092) b!915419))

(assert (= (and b!915419 res!617098) b!915426))

(assert (= (and b!915426 res!617096) b!915421))

(assert (= (and b!915421 res!617100) b!915428))

(assert (= (and b!915428 res!617099) b!915433))

(assert (= (and b!915433 c!96288) b!915429))

(assert (= (and b!915433 (not c!96288)) b!915424))

(assert (= (and b!915429 (not res!617101)) b!915420))

(assert (= (and b!915424 res!617094) b!915422))

(assert (= (and b!915422 (not res!617093)) b!915427))

(assert (= (or b!915420 b!915427) bm!40546))

(assert (= (and b!915430 condMapEmpty!30504) mapIsEmpty!30504))

(assert (= (and b!915430 (not condMapEmpty!30504)) mapNonEmpty!30504))

(get-info :version)

(assert (= (and mapNonEmpty!30504 ((_ is ValueCellFull!9107) mapValue!30504)) b!915432))

(assert (= (and b!915430 ((_ is ValueCellFull!9107) mapDefault!30504)) b!915425))

(assert (= start!78562 b!915430))

(declare-fun m!850517 () Bool)

(assert (=> b!915421 m!850517))

(declare-fun m!850519 () Bool)

(assert (=> b!915426 m!850519))

(declare-fun m!850521 () Bool)

(assert (=> b!915426 m!850521))

(declare-fun m!850523 () Bool)

(assert (=> b!915423 m!850523))

(declare-fun m!850525 () Bool)

(assert (=> mapNonEmpty!30504 m!850525))

(declare-fun m!850527 () Bool)

(assert (=> start!78562 m!850527))

(declare-fun m!850529 () Bool)

(assert (=> start!78562 m!850529))

(declare-fun m!850531 () Bool)

(assert (=> start!78562 m!850531))

(declare-fun m!850533 () Bool)

(assert (=> b!915428 m!850533))

(declare-fun m!850535 () Bool)

(assert (=> bm!40546 m!850535))

(declare-fun m!850537 () Bool)

(assert (=> b!915419 m!850537))

(check-sat (not b!915419) (not b!915426) (not b_next!16759) b_and!27389 (not b!915421) (not b!915423) (not start!78562) tp_is_empty!19177 (not mapNonEmpty!30504) (not bm!40546))
(check-sat b_and!27389 (not b_next!16759))
(get-model)

(declare-fun d!112997 () Bool)

(declare-fun e!513692 () Bool)

(assert (=> d!112997 e!513692))

(declare-fun res!617164 () Bool)

(assert (=> d!112997 (=> res!617164 e!513692)))

(declare-fun lt!411871 () Bool)

(assert (=> d!112997 (= res!617164 (not lt!411871))))

(declare-fun lt!411869 () Bool)

(assert (=> d!112997 (= lt!411871 lt!411869)))

(declare-datatypes ((Unit!30942 0))(
  ( (Unit!30943) )
))
(declare-fun lt!411868 () Unit!30942)

(declare-fun e!513691 () Unit!30942)

(assert (=> d!112997 (= lt!411868 e!513691)))

(declare-fun c!96297 () Bool)

(assert (=> d!112997 (= c!96297 lt!411869)))

(declare-fun containsKey!446 (List!18339 (_ BitVec 64)) Bool)

(assert (=> d!112997 (= lt!411869 (containsKey!446 (toList!5629 lt!411853) k0!1033))))

(assert (=> d!112997 (= (contains!4688 lt!411853 k0!1033) lt!411871)))

(declare-fun b!915530 () Bool)

(declare-fun lt!411870 () Unit!30942)

(assert (=> b!915530 (= e!513691 lt!411870)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!340 (List!18339 (_ BitVec 64)) Unit!30942)

(assert (=> b!915530 (= lt!411870 (lemmaContainsKeyImpliesGetValueByKeyDefined!340 (toList!5629 lt!411853) k0!1033))))

(declare-datatypes ((Option!481 0))(
  ( (Some!480 (v!12155 V!30535)) (None!479) )
))
(declare-fun isDefined!348 (Option!481) Bool)

(declare-fun getValueByKey!475 (List!18339 (_ BitVec 64)) Option!481)

(assert (=> b!915530 (isDefined!348 (getValueByKey!475 (toList!5629 lt!411853) k0!1033))))

(declare-fun b!915531 () Bool)

(declare-fun Unit!30944 () Unit!30942)

(assert (=> b!915531 (= e!513691 Unit!30944)))

(declare-fun b!915532 () Bool)

(assert (=> b!915532 (= e!513692 (isDefined!348 (getValueByKey!475 (toList!5629 lt!411853) k0!1033)))))

(assert (= (and d!112997 c!96297) b!915530))

(assert (= (and d!112997 (not c!96297)) b!915531))

(assert (= (and d!112997 (not res!617164)) b!915532))

(declare-fun m!850583 () Bool)

(assert (=> d!112997 m!850583))

(declare-fun m!850585 () Bool)

(assert (=> b!915530 m!850585))

(declare-fun m!850587 () Bool)

(assert (=> b!915530 m!850587))

(assert (=> b!915530 m!850587))

(declare-fun m!850589 () Bool)

(assert (=> b!915530 m!850589))

(assert (=> b!915532 m!850587))

(assert (=> b!915532 m!850587))

(assert (=> b!915532 m!850589))

(assert (=> b!915426 d!112997))

(declare-fun bm!40567 () Bool)

(declare-fun call!40574 () ListLongMap!11227)

(declare-fun call!40570 () ListLongMap!11227)

(assert (=> bm!40567 (= call!40574 call!40570)))

(declare-fun b!915575 () Bool)

(declare-fun e!513729 () Bool)

(declare-fun call!40575 () Bool)

(assert (=> b!915575 (= e!513729 (not call!40575))))

(declare-fun b!915576 () Bool)

(declare-fun e!513723 () Bool)

(declare-fun e!513725 () Bool)

(assert (=> b!915576 (= e!513723 e!513725)))

(declare-fun res!617191 () Bool)

(assert (=> b!915576 (=> (not res!617191) (not e!513725))))

(declare-fun lt!411918 () ListLongMap!11227)

(assert (=> b!915576 (= res!617191 (contains!4688 lt!411918 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!915576 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26611 _keys!1386)))))

(declare-fun b!915577 () Bool)

(declare-fun res!617185 () Bool)

(declare-fun e!513726 () Bool)

(assert (=> b!915577 (=> (not res!617185) (not e!513726))))

(assert (=> b!915577 (= res!617185 e!513723)))

(declare-fun res!617190 () Bool)

(assert (=> b!915577 (=> res!617190 e!513723)))

(declare-fun e!513728 () Bool)

(assert (=> b!915577 (= res!617190 (not e!513728))))

(declare-fun res!617186 () Bool)

(assert (=> b!915577 (=> (not res!617186) (not e!513728))))

(assert (=> b!915577 (= res!617186 (bvslt #b00000000000000000000000000000000 (size!26611 _keys!1386)))))

(declare-fun d!112999 () Bool)

(assert (=> d!112999 e!513726))

(declare-fun res!617188 () Bool)

(assert (=> d!112999 (=> (not res!617188) (not e!513726))))

(assert (=> d!112999 (= res!617188 (or (bvsge #b00000000000000000000000000000000 (size!26611 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26611 _keys!1386)))))))

(declare-fun lt!411917 () ListLongMap!11227)

(assert (=> d!112999 (= lt!411918 lt!411917)))

(declare-fun lt!411937 () Unit!30942)

(declare-fun e!513720 () Unit!30942)

(assert (=> d!112999 (= lt!411937 e!513720)))

(declare-fun c!96312 () Bool)

(declare-fun e!513719 () Bool)

(assert (=> d!112999 (= c!96312 e!513719)))

(declare-fun res!617189 () Bool)

(assert (=> d!112999 (=> (not res!617189) (not e!513719))))

(assert (=> d!112999 (= res!617189 (bvslt #b00000000000000000000000000000000 (size!26611 _keys!1386)))))

(declare-fun e!513721 () ListLongMap!11227)

(assert (=> d!112999 (= lt!411917 e!513721)))

(declare-fun c!96311 () Bool)

(assert (=> d!112999 (= c!96311 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112999 (validMask!0 mask!1756)))

(assert (=> d!112999 (= (getCurrentListMap!2889 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411918)))

(declare-fun bm!40568 () Bool)

(declare-fun call!40576 () ListLongMap!11227)

(assert (=> bm!40568 (= call!40570 call!40576)))

(declare-fun b!915578 () Bool)

(declare-fun e!513727 () Bool)

(assert (=> b!915578 (= e!513729 e!513727)))

(declare-fun res!617187 () Bool)

(assert (=> b!915578 (= res!617187 call!40575)))

(assert (=> b!915578 (=> (not res!617187) (not e!513727))))

(declare-fun b!915579 () Bool)

(declare-fun e!513722 () Bool)

(assert (=> b!915579 (= e!513726 e!513722)))

(declare-fun c!96313 () Bool)

(assert (=> b!915579 (= c!96313 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!915580 () Bool)

(declare-fun res!617183 () Bool)

(assert (=> b!915580 (=> (not res!617183) (not e!513726))))

(assert (=> b!915580 (= res!617183 e!513729)))

(declare-fun c!96314 () Bool)

(assert (=> b!915580 (= c!96314 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!915581 () Bool)

(declare-fun call!40573 () Bool)

(assert (=> b!915581 (= e!513722 (not call!40573))))

(declare-fun bm!40569 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3341 (array!54409 array!54407 (_ BitVec 32) (_ BitVec 32) V!30535 V!30535 (_ BitVec 32) Int) ListLongMap!11227)

(assert (=> bm!40569 (= call!40576 (getCurrentListMapNoExtraKeys!3341 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun bm!40570 () Bool)

(assert (=> bm!40570 (= call!40573 (contains!4688 lt!411918 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!915582 () Bool)

(assert (=> b!915582 (= e!513727 (= (apply!535 lt!411918 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!915583 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!915583 (= e!513719 (validKeyInArray!0 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!915584 () Bool)

(declare-fun e!513731 () Bool)

(assert (=> b!915584 (= e!513722 e!513731)))

(declare-fun res!617184 () Bool)

(assert (=> b!915584 (= res!617184 call!40573)))

(assert (=> b!915584 (=> (not res!617184) (not e!513731))))

(declare-fun b!915585 () Bool)

(declare-fun e!513730 () ListLongMap!11227)

(assert (=> b!915585 (= e!513721 e!513730)))

(declare-fun c!96310 () Bool)

(assert (=> b!915585 (= c!96310 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!915586 () Bool)

(assert (=> b!915586 (= e!513731 (= (apply!535 lt!411918 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun bm!40571 () Bool)

(assert (=> bm!40571 (= call!40575 (contains!4688 lt!411918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!915587 () Bool)

(declare-fun c!96315 () Bool)

(assert (=> b!915587 (= c!96315 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!513724 () ListLongMap!11227)

(assert (=> b!915587 (= e!513730 e!513724)))

(declare-fun b!915588 () Bool)

(assert (=> b!915588 (= e!513724 call!40574)))

(declare-fun b!915589 () Bool)

(declare-fun call!40571 () ListLongMap!11227)

(assert (=> b!915589 (= e!513724 call!40571)))

(declare-fun bm!40572 () Bool)

(declare-fun call!40572 () ListLongMap!11227)

(assert (=> bm!40572 (= call!40571 call!40572)))

(declare-fun b!915590 () Bool)

(declare-fun get!13744 (ValueCell!9107 V!30535) V!30535)

(declare-fun dynLambda!1417 (Int (_ BitVec 64)) V!30535)

(assert (=> b!915590 (= e!513725 (= (apply!535 lt!411918 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000)) (get!13744 (select (arr!26150 _values!1152) #b00000000000000000000000000000000) (dynLambda!1417 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!915590 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26610 _values!1152)))))

(assert (=> b!915590 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26611 _keys!1386)))))

(declare-fun b!915591 () Bool)

(assert (=> b!915591 (= e!513730 call!40571)))

(declare-fun bm!40573 () Bool)

(declare-fun +!2620 (ListLongMap!11227 tuple2!12528) ListLongMap!11227)

(assert (=> bm!40573 (= call!40572 (+!2620 (ite c!96311 call!40576 (ite c!96310 call!40570 call!40574)) (ite (or c!96311 c!96310) (tuple2!12529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!915592 () Bool)

(assert (=> b!915592 (= e!513728 (validKeyInArray!0 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!915593 () Bool)

(assert (=> b!915593 (= e!513721 (+!2620 call!40572 (tuple2!12529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!915594 () Bool)

(declare-fun Unit!30945 () Unit!30942)

(assert (=> b!915594 (= e!513720 Unit!30945)))

(declare-fun b!915595 () Bool)

(declare-fun lt!411924 () Unit!30942)

(assert (=> b!915595 (= e!513720 lt!411924)))

(declare-fun lt!411933 () ListLongMap!11227)

(assert (=> b!915595 (= lt!411933 (getCurrentListMapNoExtraKeys!3341 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411930 () (_ BitVec 64))

(assert (=> b!915595 (= lt!411930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411921 () (_ BitVec 64))

(assert (=> b!915595 (= lt!411921 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411916 () Unit!30942)

(declare-fun addStillContains!351 (ListLongMap!11227 (_ BitVec 64) V!30535 (_ BitVec 64)) Unit!30942)

(assert (=> b!915595 (= lt!411916 (addStillContains!351 lt!411933 lt!411930 zeroValue!1094 lt!411921))))

(assert (=> b!915595 (contains!4688 (+!2620 lt!411933 (tuple2!12529 lt!411930 zeroValue!1094)) lt!411921)))

(declare-fun lt!411922 () Unit!30942)

(assert (=> b!915595 (= lt!411922 lt!411916)))

(declare-fun lt!411936 () ListLongMap!11227)

(assert (=> b!915595 (= lt!411936 (getCurrentListMapNoExtraKeys!3341 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411929 () (_ BitVec 64))

(assert (=> b!915595 (= lt!411929 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411926 () (_ BitVec 64))

(assert (=> b!915595 (= lt!411926 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411925 () Unit!30942)

(declare-fun addApplyDifferent!351 (ListLongMap!11227 (_ BitVec 64) V!30535 (_ BitVec 64)) Unit!30942)

(assert (=> b!915595 (= lt!411925 (addApplyDifferent!351 lt!411936 lt!411929 minValue!1094 lt!411926))))

(assert (=> b!915595 (= (apply!535 (+!2620 lt!411936 (tuple2!12529 lt!411929 minValue!1094)) lt!411926) (apply!535 lt!411936 lt!411926))))

(declare-fun lt!411928 () Unit!30942)

(assert (=> b!915595 (= lt!411928 lt!411925)))

(declare-fun lt!411934 () ListLongMap!11227)

(assert (=> b!915595 (= lt!411934 (getCurrentListMapNoExtraKeys!3341 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411920 () (_ BitVec 64))

(assert (=> b!915595 (= lt!411920 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411923 () (_ BitVec 64))

(assert (=> b!915595 (= lt!411923 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411919 () Unit!30942)

(assert (=> b!915595 (= lt!411919 (addApplyDifferent!351 lt!411934 lt!411920 zeroValue!1094 lt!411923))))

(assert (=> b!915595 (= (apply!535 (+!2620 lt!411934 (tuple2!12529 lt!411920 zeroValue!1094)) lt!411923) (apply!535 lt!411934 lt!411923))))

(declare-fun lt!411927 () Unit!30942)

(assert (=> b!915595 (= lt!411927 lt!411919)))

(declare-fun lt!411931 () ListLongMap!11227)

(assert (=> b!915595 (= lt!411931 (getCurrentListMapNoExtraKeys!3341 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411932 () (_ BitVec 64))

(assert (=> b!915595 (= lt!411932 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411935 () (_ BitVec 64))

(assert (=> b!915595 (= lt!411935 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!915595 (= lt!411924 (addApplyDifferent!351 lt!411931 lt!411932 minValue!1094 lt!411935))))

(assert (=> b!915595 (= (apply!535 (+!2620 lt!411931 (tuple2!12529 lt!411932 minValue!1094)) lt!411935) (apply!535 lt!411931 lt!411935))))

(assert (= (and d!112999 c!96311) b!915593))

(assert (= (and d!112999 (not c!96311)) b!915585))

(assert (= (and b!915585 c!96310) b!915591))

(assert (= (and b!915585 (not c!96310)) b!915587))

(assert (= (and b!915587 c!96315) b!915589))

(assert (= (and b!915587 (not c!96315)) b!915588))

(assert (= (or b!915589 b!915588) bm!40567))

(assert (= (or b!915591 bm!40567) bm!40568))

(assert (= (or b!915591 b!915589) bm!40572))

(assert (= (or b!915593 bm!40568) bm!40569))

(assert (= (or b!915593 bm!40572) bm!40573))

(assert (= (and d!112999 res!617189) b!915583))

(assert (= (and d!112999 c!96312) b!915595))

(assert (= (and d!112999 (not c!96312)) b!915594))

(assert (= (and d!112999 res!617188) b!915577))

(assert (= (and b!915577 res!617186) b!915592))

(assert (= (and b!915577 (not res!617190)) b!915576))

(assert (= (and b!915576 res!617191) b!915590))

(assert (= (and b!915577 res!617185) b!915580))

(assert (= (and b!915580 c!96314) b!915578))

(assert (= (and b!915580 (not c!96314)) b!915575))

(assert (= (and b!915578 res!617187) b!915582))

(assert (= (or b!915578 b!915575) bm!40571))

(assert (= (and b!915580 res!617183) b!915579))

(assert (= (and b!915579 c!96313) b!915584))

(assert (= (and b!915579 (not c!96313)) b!915581))

(assert (= (and b!915584 res!617184) b!915586))

(assert (= (or b!915584 b!915581) bm!40570))

(declare-fun b_lambda!13397 () Bool)

(assert (=> (not b_lambda!13397) (not b!915590)))

(declare-fun t!25948 () Bool)

(declare-fun tb!5455 () Bool)

(assert (=> (and start!78562 (= defaultEntry!1160 defaultEntry!1160) t!25948) tb!5455))

(declare-fun result!10729 () Bool)

(assert (=> tb!5455 (= result!10729 tp_is_empty!19177)))

(assert (=> b!915590 t!25948))

(declare-fun b_and!27395 () Bool)

(assert (= b_and!27389 (and (=> t!25948 result!10729) b_and!27395)))

(declare-fun m!850591 () Bool)

(assert (=> b!915595 m!850591))

(declare-fun m!850593 () Bool)

(assert (=> b!915595 m!850593))

(declare-fun m!850595 () Bool)

(assert (=> b!915595 m!850595))

(declare-fun m!850597 () Bool)

(assert (=> b!915595 m!850597))

(assert (=> b!915595 m!850593))

(declare-fun m!850599 () Bool)

(assert (=> b!915595 m!850599))

(declare-fun m!850601 () Bool)

(assert (=> b!915595 m!850601))

(declare-fun m!850603 () Bool)

(assert (=> b!915595 m!850603))

(declare-fun m!850605 () Bool)

(assert (=> b!915595 m!850605))

(declare-fun m!850607 () Bool)

(assert (=> b!915595 m!850607))

(declare-fun m!850609 () Bool)

(assert (=> b!915595 m!850609))

(declare-fun m!850611 () Bool)

(assert (=> b!915595 m!850611))

(declare-fun m!850613 () Bool)

(assert (=> b!915595 m!850613))

(declare-fun m!850615 () Bool)

(assert (=> b!915595 m!850615))

(declare-fun m!850617 () Bool)

(assert (=> b!915595 m!850617))

(declare-fun m!850619 () Bool)

(assert (=> b!915595 m!850619))

(assert (=> b!915595 m!850615))

(declare-fun m!850621 () Bool)

(assert (=> b!915595 m!850621))

(assert (=> b!915595 m!850597))

(declare-fun m!850623 () Bool)

(assert (=> b!915595 m!850623))

(assert (=> b!915595 m!850599))

(assert (=> bm!40569 m!850621))

(assert (=> b!915583 m!850607))

(assert (=> b!915583 m!850607))

(declare-fun m!850625 () Bool)

(assert (=> b!915583 m!850625))

(declare-fun m!850627 () Bool)

(assert (=> bm!40571 m!850627))

(assert (=> b!915592 m!850607))

(assert (=> b!915592 m!850607))

(assert (=> b!915592 m!850625))

(declare-fun m!850629 () Bool)

(assert (=> b!915590 m!850629))

(declare-fun m!850631 () Bool)

(assert (=> b!915590 m!850631))

(declare-fun m!850633 () Bool)

(assert (=> b!915590 m!850633))

(assert (=> b!915590 m!850607))

(declare-fun m!850635 () Bool)

(assert (=> b!915590 m!850635))

(assert (=> b!915590 m!850629))

(assert (=> b!915590 m!850607))

(assert (=> b!915590 m!850631))

(assert (=> d!112999 m!850527))

(declare-fun m!850637 () Bool)

(assert (=> bm!40570 m!850637))

(declare-fun m!850639 () Bool)

(assert (=> bm!40573 m!850639))

(declare-fun m!850641 () Bool)

(assert (=> b!915582 m!850641))

(declare-fun m!850643 () Bool)

(assert (=> b!915586 m!850643))

(declare-fun m!850645 () Bool)

(assert (=> b!915593 m!850645))

(assert (=> b!915576 m!850607))

(assert (=> b!915576 m!850607))

(declare-fun m!850647 () Bool)

(assert (=> b!915576 m!850647))

(assert (=> b!915426 d!112999))

(declare-fun d!113001 () Bool)

(assert (=> d!113001 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!915421 d!113001))

(declare-fun d!113003 () Bool)

(declare-fun get!13745 (Option!481) V!30535)

(assert (=> d!113003 (= (apply!535 lt!411853 k0!1033) (get!13745 (getValueByKey!475 (toList!5629 lt!411853) k0!1033)))))

(declare-fun bs!25760 () Bool)

(assert (= bs!25760 d!113003))

(assert (=> bs!25760 m!850587))

(assert (=> bs!25760 m!850587))

(declare-fun m!850649 () Bool)

(assert (=> bs!25760 m!850649))

(assert (=> bm!40546 d!113003))

(declare-fun b!915606 () Bool)

(declare-fun e!513740 () Bool)

(declare-fun e!513739 () Bool)

(assert (=> b!915606 (= e!513740 e!513739)))

(declare-fun c!96318 () Bool)

(assert (=> b!915606 (= c!96318 (validKeyInArray!0 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!915607 () Bool)

(declare-fun call!40579 () Bool)

(assert (=> b!915607 (= e!513739 call!40579)))

(declare-fun bm!40576 () Bool)

(assert (=> bm!40576 (= call!40579 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!915608 () Bool)

(declare-fun e!513738 () Bool)

(assert (=> b!915608 (= e!513739 e!513738)))

(declare-fun lt!411945 () (_ BitVec 64))

(assert (=> b!915608 (= lt!411945 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411944 () Unit!30942)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54409 (_ BitVec 64) (_ BitVec 32)) Unit!30942)

(assert (=> b!915608 (= lt!411944 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411945 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!915608 (arrayContainsKey!0 _keys!1386 lt!411945 #b00000000000000000000000000000000)))

(declare-fun lt!411946 () Unit!30942)

(assert (=> b!915608 (= lt!411946 lt!411944)))

(declare-fun res!617196 () Bool)

(declare-datatypes ((SeekEntryResult!8925 0))(
  ( (MissingZero!8925 (index!38071 (_ BitVec 32))) (Found!8925 (index!38072 (_ BitVec 32))) (Intermediate!8925 (undefined!9737 Bool) (index!38073 (_ BitVec 32)) (x!78196 (_ BitVec 32))) (Undefined!8925) (MissingVacant!8925 (index!38074 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54409 (_ BitVec 32)) SeekEntryResult!8925)

(assert (=> b!915608 (= res!617196 (= (seekEntryOrOpen!0 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8925 #b00000000000000000000000000000000)))))

(assert (=> b!915608 (=> (not res!617196) (not e!513738))))

(declare-fun b!915609 () Bool)

(assert (=> b!915609 (= e!513738 call!40579)))

(declare-fun d!113005 () Bool)

(declare-fun res!617197 () Bool)

(assert (=> d!113005 (=> res!617197 e!513740)))

(assert (=> d!113005 (= res!617197 (bvsge #b00000000000000000000000000000000 (size!26611 _keys!1386)))))

(assert (=> d!113005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!513740)))

(assert (= (and d!113005 (not res!617197)) b!915606))

(assert (= (and b!915606 c!96318) b!915608))

(assert (= (and b!915606 (not c!96318)) b!915607))

(assert (= (and b!915608 res!617196) b!915609))

(assert (= (or b!915609 b!915607) bm!40576))

(assert (=> b!915606 m!850607))

(assert (=> b!915606 m!850607))

(assert (=> b!915606 m!850625))

(declare-fun m!850651 () Bool)

(assert (=> bm!40576 m!850651))

(assert (=> b!915608 m!850607))

(declare-fun m!850653 () Bool)

(assert (=> b!915608 m!850653))

(declare-fun m!850655 () Bool)

(assert (=> b!915608 m!850655))

(assert (=> b!915608 m!850607))

(declare-fun m!850657 () Bool)

(assert (=> b!915608 m!850657))

(assert (=> b!915423 d!113005))

(declare-fun d!113007 () Bool)

(assert (=> d!113007 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78562 d!113007))

(declare-fun d!113009 () Bool)

(assert (=> d!113009 (= (array_inv!20514 _values!1152) (bvsge (size!26610 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78562 d!113009))

(declare-fun d!113011 () Bool)

(assert (=> d!113011 (= (array_inv!20515 _keys!1386) (bvsge (size!26611 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78562 d!113011))

(declare-fun b!915620 () Bool)

(declare-fun e!513749 () Bool)

(declare-fun e!513750 () Bool)

(assert (=> b!915620 (= e!513749 e!513750)))

(declare-fun c!96321 () Bool)

(assert (=> b!915620 (= c!96321 (validKeyInArray!0 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!915621 () Bool)

(declare-fun call!40582 () Bool)

(assert (=> b!915621 (= e!513750 call!40582)))

(declare-fun d!113013 () Bool)

(declare-fun res!617206 () Bool)

(declare-fun e!513752 () Bool)

(assert (=> d!113013 (=> res!617206 e!513752)))

(assert (=> d!113013 (= res!617206 (bvsge #b00000000000000000000000000000000 (size!26611 _keys!1386)))))

(assert (=> d!113013 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18337) e!513752)))

(declare-fun b!915622 () Bool)

(assert (=> b!915622 (= e!513752 e!513749)))

(declare-fun res!617205 () Bool)

(assert (=> b!915622 (=> (not res!617205) (not e!513749))))

(declare-fun e!513751 () Bool)

(assert (=> b!915622 (= res!617205 (not e!513751))))

(declare-fun res!617204 () Bool)

(assert (=> b!915622 (=> (not res!617204) (not e!513751))))

(assert (=> b!915622 (= res!617204 (validKeyInArray!0 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!915623 () Bool)

(assert (=> b!915623 (= e!513750 call!40582)))

(declare-fun bm!40579 () Bool)

(assert (=> bm!40579 (= call!40582 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!96321 (Cons!18336 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000) Nil!18337) Nil!18337)))))

(declare-fun b!915624 () Bool)

(declare-fun contains!4689 (List!18340 (_ BitVec 64)) Bool)

(assert (=> b!915624 (= e!513751 (contains!4689 Nil!18337 (select (arr!26151 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!113013 (not res!617206)) b!915622))

(assert (= (and b!915622 res!617204) b!915624))

(assert (= (and b!915622 res!617205) b!915620))

(assert (= (and b!915620 c!96321) b!915621))

(assert (= (and b!915620 (not c!96321)) b!915623))

(assert (= (or b!915621 b!915623) bm!40579))

(assert (=> b!915620 m!850607))

(assert (=> b!915620 m!850607))

(assert (=> b!915620 m!850625))

(assert (=> b!915622 m!850607))

(assert (=> b!915622 m!850607))

(assert (=> b!915622 m!850625))

(assert (=> bm!40579 m!850607))

(declare-fun m!850659 () Bool)

(assert (=> bm!40579 m!850659))

(assert (=> b!915624 m!850607))

(assert (=> b!915624 m!850607))

(declare-fun m!850661 () Bool)

(assert (=> b!915624 m!850661))

(assert (=> b!915419 d!113013))

(declare-fun mapIsEmpty!30513 () Bool)

(declare-fun mapRes!30513 () Bool)

(assert (=> mapIsEmpty!30513 mapRes!30513))

(declare-fun mapNonEmpty!30513 () Bool)

(declare-fun tp!58581 () Bool)

(declare-fun e!513757 () Bool)

(assert (=> mapNonEmpty!30513 (= mapRes!30513 (and tp!58581 e!513757))))

(declare-fun mapValue!30513 () ValueCell!9107)

(declare-fun mapKey!30513 () (_ BitVec 32))

(declare-fun mapRest!30513 () (Array (_ BitVec 32) ValueCell!9107))

(assert (=> mapNonEmpty!30513 (= mapRest!30504 (store mapRest!30513 mapKey!30513 mapValue!30513))))

(declare-fun condMapEmpty!30513 () Bool)

(declare-fun mapDefault!30513 () ValueCell!9107)

(assert (=> mapNonEmpty!30504 (= condMapEmpty!30513 (= mapRest!30504 ((as const (Array (_ BitVec 32) ValueCell!9107)) mapDefault!30513)))))

(declare-fun e!513758 () Bool)

(assert (=> mapNonEmpty!30504 (= tp!58566 (and e!513758 mapRes!30513))))

(declare-fun b!915631 () Bool)

(assert (=> b!915631 (= e!513757 tp_is_empty!19177)))

(declare-fun b!915632 () Bool)

(assert (=> b!915632 (= e!513758 tp_is_empty!19177)))

(assert (= (and mapNonEmpty!30504 condMapEmpty!30513) mapIsEmpty!30513))

(assert (= (and mapNonEmpty!30504 (not condMapEmpty!30513)) mapNonEmpty!30513))

(assert (= (and mapNonEmpty!30513 ((_ is ValueCellFull!9107) mapValue!30513)) b!915631))

(assert (= (and mapNonEmpty!30504 ((_ is ValueCellFull!9107) mapDefault!30513)) b!915632))

(declare-fun m!850663 () Bool)

(assert (=> mapNonEmpty!30513 m!850663))

(declare-fun b_lambda!13399 () Bool)

(assert (= b_lambda!13397 (or (and start!78562 b_free!16759) b_lambda!13399)))

(check-sat (not d!112999) tp_is_empty!19177 (not b!915606) (not bm!40579) (not d!113003) (not b_next!16759) (not mapNonEmpty!30513) (not b!915583) (not bm!40569) (not b!915608) (not b!915532) (not d!112997) b_and!27395 (not b!915620) (not b!915624) (not bm!40571) (not b!915582) (not b!915590) (not b!915622) (not b!915576) (not b!915592) (not b!915595) (not b!915530) (not b_lambda!13399) (not b!915593) (not bm!40573) (not b!915586) (not bm!40570) (not bm!40576))
(check-sat b_and!27395 (not b_next!16759))
