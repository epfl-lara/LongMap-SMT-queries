; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39380 () Bool)

(assert start!39380)

(declare-fun b_free!9661 () Bool)

(declare-fun b_next!9661 () Bool)

(assert (=> start!39380 (= b_free!9661 (not b_next!9661))))

(declare-fun tp!34512 () Bool)

(declare-fun b_and!17171 () Bool)

(assert (=> start!39380 (= tp!34512 b_and!17171)))

(declare-fun b!418516 () Bool)

(declare-fun res!243944 () Bool)

(declare-fun e!249507 () Bool)

(assert (=> b!418516 (=> (not res!243944) (not e!249507))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418516 (= res!243944 (validKeyInArray!0 k0!794))))

(declare-fun b!418517 () Bool)

(declare-fun e!249503 () Bool)

(declare-fun e!249501 () Bool)

(assert (=> b!418517 (= e!249503 (not e!249501))))

(declare-fun res!243938 () Bool)

(assert (=> b!418517 (=> res!243938 e!249501)))

(declare-datatypes ((array!25465 0))(
  ( (array!25466 (arr!12182 (Array (_ BitVec 32) (_ BitVec 64))) (size!12535 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25465)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!418517 (= res!243938 (validKeyInArray!0 (select (arr!12182 _keys!709) from!863)))))

(declare-fun e!249502 () Bool)

(assert (=> b!418517 e!249502))

(declare-fun c!55134 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418517 (= c!55134 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15523 0))(
  ( (V!15524 (val!5451 Int)) )
))
(declare-datatypes ((ValueCell!5063 0))(
  ( (ValueCellFull!5063 (v!7692 V!15523)) (EmptyCell!5063) )
))
(declare-datatypes ((array!25467 0))(
  ( (array!25468 (arr!12183 (Array (_ BitVec 32) ValueCell!5063)) (size!12536 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25467)

(declare-fun zeroValue!515 () V!15523)

(declare-fun v!412 () V!15523)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!12344 0))(
  ( (Unit!12345) )
))
(declare-fun lt!191756 () Unit!12344)

(declare-fun minValue!515 () V!15523)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!428 (array!25465 array!25467 (_ BitVec 32) (_ BitVec 32) V!15523 V!15523 (_ BitVec 32) (_ BitVec 64) V!15523 (_ BitVec 32) Int) Unit!12344)

(assert (=> b!418517 (= lt!191756 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!428 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418518 () Bool)

(declare-fun e!249506 () Bool)

(declare-fun e!249500 () Bool)

(declare-fun mapRes!17841 () Bool)

(assert (=> b!418518 (= e!249506 (and e!249500 mapRes!17841))))

(declare-fun condMapEmpty!17841 () Bool)

(declare-fun mapDefault!17841 () ValueCell!5063)

(assert (=> b!418518 (= condMapEmpty!17841 (= (arr!12183 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5063)) mapDefault!17841)))))

(declare-fun lt!191746 () array!25465)

(declare-fun bm!29133 () Bool)

(declare-fun lt!191749 () array!25467)

(declare-datatypes ((tuple2!7112 0))(
  ( (tuple2!7113 (_1!3567 (_ BitVec 64)) (_2!3567 V!15523)) )
))
(declare-datatypes ((List!7111 0))(
  ( (Nil!7108) (Cons!7107 (h!7963 tuple2!7112) (t!12428 List!7111)) )
))
(declare-datatypes ((ListLongMap!6015 0))(
  ( (ListLongMap!6016 (toList!3023 List!7111)) )
))
(declare-fun call!29137 () ListLongMap!6015)

(declare-fun getCurrentListMapNoExtraKeys!1234 (array!25465 array!25467 (_ BitVec 32) (_ BitVec 32) V!15523 V!15523 (_ BitVec 32) Int) ListLongMap!6015)

(assert (=> bm!29133 (= call!29137 (getCurrentListMapNoExtraKeys!1234 (ite c!55134 lt!191746 _keys!709) (ite c!55134 lt!191749 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17841 () Bool)

(assert (=> mapIsEmpty!17841 mapRes!17841))

(declare-fun b!418519 () Bool)

(declare-fun res!243941 () Bool)

(declare-fun e!249505 () Bool)

(assert (=> b!418519 (=> (not res!243941) (not e!249505))))

(assert (=> b!418519 (= res!243941 (bvsle from!863 i!563))))

(declare-fun b!418520 () Bool)

(declare-fun res!243948 () Bool)

(assert (=> b!418520 (=> (not res!243948) (not e!249507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418520 (= res!243948 (validMask!0 mask!1025))))

(declare-fun b!418521 () Bool)

(declare-fun tp_is_empty!10813 () Bool)

(assert (=> b!418521 (= e!249500 tp_is_empty!10813)))

(declare-fun b!418522 () Bool)

(declare-fun call!29136 () ListLongMap!6015)

(assert (=> b!418522 (= e!249502 (= call!29136 call!29137))))

(declare-fun b!418523 () Bool)

(assert (=> b!418523 (= e!249505 e!249503)))

(declare-fun res!243947 () Bool)

(assert (=> b!418523 (=> (not res!243947) (not e!249503))))

(assert (=> b!418523 (= res!243947 (= from!863 i!563))))

(declare-fun lt!191753 () ListLongMap!6015)

(assert (=> b!418523 (= lt!191753 (getCurrentListMapNoExtraKeys!1234 lt!191746 lt!191749 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418523 (= lt!191749 (array!25468 (store (arr!12183 _values!549) i!563 (ValueCellFull!5063 v!412)) (size!12536 _values!549)))))

(declare-fun lt!191748 () ListLongMap!6015)

(assert (=> b!418523 (= lt!191748 (getCurrentListMapNoExtraKeys!1234 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418524 () Bool)

(declare-fun res!243936 () Bool)

(assert (=> b!418524 (=> (not res!243936) (not e!249507))))

(assert (=> b!418524 (= res!243936 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12535 _keys!709))))))

(declare-fun b!418525 () Bool)

(declare-fun res!243939 () Bool)

(assert (=> b!418525 (=> (not res!243939) (not e!249507))))

(declare-fun arrayContainsKey!0 (array!25465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418525 (= res!243939 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418526 () Bool)

(declare-fun e!249504 () Bool)

(assert (=> b!418526 (= e!249504 tp_is_empty!10813)))

(declare-fun mapNonEmpty!17841 () Bool)

(declare-fun tp!34511 () Bool)

(assert (=> mapNonEmpty!17841 (= mapRes!17841 (and tp!34511 e!249504))))

(declare-fun mapValue!17841 () ValueCell!5063)

(declare-fun mapKey!17841 () (_ BitVec 32))

(declare-fun mapRest!17841 () (Array (_ BitVec 32) ValueCell!5063))

(assert (=> mapNonEmpty!17841 (= (arr!12183 _values!549) (store mapRest!17841 mapKey!17841 mapValue!17841))))

(declare-fun b!418527 () Bool)

(assert (=> b!418527 (= e!249501 true)))

(declare-fun lt!191754 () V!15523)

(declare-fun lt!191755 () ListLongMap!6015)

(declare-fun lt!191747 () tuple2!7112)

(declare-fun +!1250 (ListLongMap!6015 tuple2!7112) ListLongMap!6015)

(assert (=> b!418527 (= (+!1250 lt!191755 lt!191747) (+!1250 (+!1250 lt!191755 (tuple2!7113 k0!794 lt!191754)) lt!191747))))

(declare-fun lt!191752 () V!15523)

(assert (=> b!418527 (= lt!191747 (tuple2!7113 k0!794 lt!191752))))

(declare-fun lt!191750 () Unit!12344)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!36 (ListLongMap!6015 (_ BitVec 64) V!15523 V!15523) Unit!12344)

(assert (=> b!418527 (= lt!191750 (addSameAsAddTwiceSameKeyDiffValues!36 lt!191755 k0!794 lt!191754 lt!191752))))

(declare-fun lt!191751 () V!15523)

(declare-fun get!6031 (ValueCell!5063 V!15523) V!15523)

(assert (=> b!418527 (= lt!191754 (get!6031 (select (arr!12183 _values!549) from!863) lt!191751))))

(assert (=> b!418527 (= lt!191753 (+!1250 lt!191755 (tuple2!7113 (select (arr!12182 lt!191746) from!863) lt!191752)))))

(assert (=> b!418527 (= lt!191752 (get!6031 (select (store (arr!12183 _values!549) i!563 (ValueCellFull!5063 v!412)) from!863) lt!191751))))

(declare-fun dynLambda!693 (Int (_ BitVec 64)) V!15523)

(assert (=> b!418527 (= lt!191751 (dynLambda!693 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418527 (= lt!191755 (getCurrentListMapNoExtraKeys!1234 lt!191746 lt!191749 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418528 () Bool)

(declare-fun res!243943 () Bool)

(assert (=> b!418528 (=> (not res!243943) (not e!249507))))

(declare-datatypes ((List!7112 0))(
  ( (Nil!7109) (Cons!7108 (h!7964 (_ BitVec 64)) (t!12429 List!7112)) )
))
(declare-fun arrayNoDuplicates!0 (array!25465 (_ BitVec 32) List!7112) Bool)

(assert (=> b!418528 (= res!243943 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7109))))

(declare-fun b!418529 () Bool)

(assert (=> b!418529 (= e!249502 (= call!29137 (+!1250 call!29136 (tuple2!7113 k0!794 v!412))))))

(declare-fun b!418531 () Bool)

(declare-fun res!243942 () Bool)

(assert (=> b!418531 (=> (not res!243942) (not e!249507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25465 (_ BitVec 32)) Bool)

(assert (=> b!418531 (= res!243942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!243940 () Bool)

(assert (=> start!39380 (=> (not res!243940) (not e!249507))))

(assert (=> start!39380 (= res!243940 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12535 _keys!709))))))

(assert (=> start!39380 e!249507))

(assert (=> start!39380 tp_is_empty!10813))

(assert (=> start!39380 tp!34512))

(assert (=> start!39380 true))

(declare-fun array_inv!8928 (array!25467) Bool)

(assert (=> start!39380 (and (array_inv!8928 _values!549) e!249506)))

(declare-fun array_inv!8929 (array!25465) Bool)

(assert (=> start!39380 (array_inv!8929 _keys!709)))

(declare-fun b!418530 () Bool)

(declare-fun res!243937 () Bool)

(assert (=> b!418530 (=> (not res!243937) (not e!249507))))

(assert (=> b!418530 (= res!243937 (and (= (size!12536 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12535 _keys!709) (size!12536 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418532 () Bool)

(declare-fun res!243946 () Bool)

(assert (=> b!418532 (=> (not res!243946) (not e!249505))))

(assert (=> b!418532 (= res!243946 (arrayNoDuplicates!0 lt!191746 #b00000000000000000000000000000000 Nil!7109))))

(declare-fun b!418533 () Bool)

(declare-fun res!243935 () Bool)

(assert (=> b!418533 (=> (not res!243935) (not e!249507))))

(assert (=> b!418533 (= res!243935 (or (= (select (arr!12182 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12182 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418534 () Bool)

(assert (=> b!418534 (= e!249507 e!249505)))

(declare-fun res!243945 () Bool)

(assert (=> b!418534 (=> (not res!243945) (not e!249505))))

(assert (=> b!418534 (= res!243945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191746 mask!1025))))

(assert (=> b!418534 (= lt!191746 (array!25466 (store (arr!12182 _keys!709) i!563 k0!794) (size!12535 _keys!709)))))

(declare-fun bm!29134 () Bool)

(assert (=> bm!29134 (= call!29136 (getCurrentListMapNoExtraKeys!1234 (ite c!55134 _keys!709 lt!191746) (ite c!55134 _values!549 lt!191749) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39380 res!243940) b!418520))

(assert (= (and b!418520 res!243948) b!418530))

(assert (= (and b!418530 res!243937) b!418531))

(assert (= (and b!418531 res!243942) b!418528))

(assert (= (and b!418528 res!243943) b!418524))

(assert (= (and b!418524 res!243936) b!418516))

(assert (= (and b!418516 res!243944) b!418533))

(assert (= (and b!418533 res!243935) b!418525))

(assert (= (and b!418525 res!243939) b!418534))

(assert (= (and b!418534 res!243945) b!418532))

(assert (= (and b!418532 res!243946) b!418519))

(assert (= (and b!418519 res!243941) b!418523))

(assert (= (and b!418523 res!243947) b!418517))

(assert (= (and b!418517 c!55134) b!418529))

(assert (= (and b!418517 (not c!55134)) b!418522))

(assert (= (or b!418529 b!418522) bm!29133))

(assert (= (or b!418529 b!418522) bm!29134))

(assert (= (and b!418517 (not res!243938)) b!418527))

(assert (= (and b!418518 condMapEmpty!17841) mapIsEmpty!17841))

(assert (= (and b!418518 (not condMapEmpty!17841)) mapNonEmpty!17841))

(get-info :version)

(assert (= (and mapNonEmpty!17841 ((_ is ValueCellFull!5063) mapValue!17841)) b!418526))

(assert (= (and b!418518 ((_ is ValueCellFull!5063) mapDefault!17841)) b!418521))

(assert (= start!39380 b!418518))

(declare-fun b_lambda!8947 () Bool)

(assert (=> (not b_lambda!8947) (not b!418527)))

(declare-fun t!12427 () Bool)

(declare-fun tb!3275 () Bool)

(assert (=> (and start!39380 (= defaultEntry!557 defaultEntry!557) t!12427) tb!3275))

(declare-fun result!6085 () Bool)

(assert (=> tb!3275 (= result!6085 tp_is_empty!10813)))

(assert (=> b!418527 t!12427))

(declare-fun b_and!17173 () Bool)

(assert (= b_and!17171 (and (=> t!12427 result!6085) b_and!17173)))

(declare-fun m!407487 () Bool)

(assert (=> b!418529 m!407487))

(declare-fun m!407489 () Bool)

(assert (=> bm!29134 m!407489))

(declare-fun m!407491 () Bool)

(assert (=> b!418516 m!407491))

(declare-fun m!407493 () Bool)

(assert (=> b!418532 m!407493))

(declare-fun m!407495 () Bool)

(assert (=> b!418533 m!407495))

(declare-fun m!407497 () Bool)

(assert (=> b!418528 m!407497))

(declare-fun m!407499 () Bool)

(assert (=> b!418531 m!407499))

(declare-fun m!407501 () Bool)

(assert (=> bm!29133 m!407501))

(declare-fun m!407503 () Bool)

(assert (=> b!418534 m!407503))

(declare-fun m!407505 () Bool)

(assert (=> b!418534 m!407505))

(declare-fun m!407507 () Bool)

(assert (=> start!39380 m!407507))

(declare-fun m!407509 () Bool)

(assert (=> start!39380 m!407509))

(declare-fun m!407511 () Bool)

(assert (=> b!418523 m!407511))

(declare-fun m!407513 () Bool)

(assert (=> b!418523 m!407513))

(declare-fun m!407515 () Bool)

(assert (=> b!418523 m!407515))

(declare-fun m!407517 () Bool)

(assert (=> b!418527 m!407517))

(declare-fun m!407519 () Bool)

(assert (=> b!418527 m!407519))

(declare-fun m!407521 () Bool)

(assert (=> b!418527 m!407521))

(declare-fun m!407523 () Bool)

(assert (=> b!418527 m!407523))

(declare-fun m!407525 () Bool)

(assert (=> b!418527 m!407525))

(declare-fun m!407527 () Bool)

(assert (=> b!418527 m!407527))

(assert (=> b!418527 m!407525))

(assert (=> b!418527 m!407517))

(declare-fun m!407529 () Bool)

(assert (=> b!418527 m!407529))

(declare-fun m!407531 () Bool)

(assert (=> b!418527 m!407531))

(declare-fun m!407533 () Bool)

(assert (=> b!418527 m!407533))

(declare-fun m!407535 () Bool)

(assert (=> b!418527 m!407535))

(declare-fun m!407537 () Bool)

(assert (=> b!418527 m!407537))

(assert (=> b!418527 m!407535))

(declare-fun m!407539 () Bool)

(assert (=> b!418527 m!407539))

(assert (=> b!418527 m!407513))

(declare-fun m!407541 () Bool)

(assert (=> b!418525 m!407541))

(declare-fun m!407543 () Bool)

(assert (=> b!418517 m!407543))

(assert (=> b!418517 m!407543))

(declare-fun m!407545 () Bool)

(assert (=> b!418517 m!407545))

(declare-fun m!407547 () Bool)

(assert (=> b!418517 m!407547))

(declare-fun m!407549 () Bool)

(assert (=> b!418520 m!407549))

(declare-fun m!407551 () Bool)

(assert (=> mapNonEmpty!17841 m!407551))

(check-sat (not b!418531) (not b!418527) (not b_lambda!8947) (not b!418523) (not bm!29134) (not b_next!9661) (not b!418520) (not b!418528) (not b!418516) (not start!39380) (not b!418529) (not bm!29133) (not mapNonEmpty!17841) (not b!418525) b_and!17173 (not b!418517) (not b!418532) (not b!418534) tp_is_empty!10813)
(check-sat b_and!17173 (not b_next!9661))
