; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39492 () Bool)

(assert start!39492)

(declare-fun b_free!9759 () Bool)

(declare-fun b_next!9759 () Bool)

(assert (=> start!39492 (= b_free!9759 (not b_next!9759))))

(declare-fun tp!34806 () Bool)

(declare-fun b_and!17393 () Bool)

(assert (=> start!39492 (= tp!34806 b_and!17393)))

(declare-fun b!421678 () Bool)

(declare-fun res!246122 () Bool)

(declare-fun e!250999 () Bool)

(assert (=> b!421678 (=> (not res!246122) (not e!250999))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421678 (= res!246122 (validMask!0 mask!1025))))

(declare-fun b!421679 () Bool)

(declare-fun res!246131 () Bool)

(assert (=> b!421679 (=> (not res!246131) (not e!250999))))

(declare-datatypes ((array!25669 0))(
  ( (array!25670 (arr!12284 (Array (_ BitVec 32) (_ BitVec 64))) (size!12636 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25669)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421679 (= res!246131 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421680 () Bool)

(declare-fun res!246134 () Bool)

(assert (=> b!421680 (=> (not res!246134) (not e!250999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25669 (_ BitVec 32)) Bool)

(assert (=> b!421680 (= res!246134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421681 () Bool)

(declare-fun e!251002 () Bool)

(declare-fun e!251000 () Bool)

(declare-fun mapRes!17988 () Bool)

(assert (=> b!421681 (= e!251002 (and e!251000 mapRes!17988))))

(declare-fun condMapEmpty!17988 () Bool)

(declare-datatypes ((V!15653 0))(
  ( (V!15654 (val!5500 Int)) )
))
(declare-datatypes ((ValueCell!5112 0))(
  ( (ValueCellFull!5112 (v!7747 V!15653)) (EmptyCell!5112) )
))
(declare-datatypes ((array!25671 0))(
  ( (array!25672 (arr!12285 (Array (_ BitVec 32) ValueCell!5112)) (size!12637 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25671)

(declare-fun mapDefault!17988 () ValueCell!5112)

(assert (=> b!421681 (= condMapEmpty!17988 (= (arr!12285 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5112)) mapDefault!17988)))))

(declare-fun b!421682 () Bool)

(declare-fun e!250997 () Bool)

(declare-fun e!251001 () Bool)

(assert (=> b!421682 (= e!250997 (not e!251001))))

(declare-fun res!246124 () Bool)

(assert (=> b!421682 (=> res!246124 e!251001)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421682 (= res!246124 (validKeyInArray!0 (select (arr!12284 _keys!709) from!863)))))

(declare-fun e!250998 () Bool)

(assert (=> b!421682 e!250998))

(declare-fun c!55352 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421682 (= c!55352 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15653)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15653)

(declare-datatypes ((Unit!12450 0))(
  ( (Unit!12451) )
))
(declare-fun lt!193606 () Unit!12450)

(declare-fun v!412 () V!15653)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!471 (array!25669 array!25671 (_ BitVec 32) (_ BitVec 32) V!15653 V!15653 (_ BitVec 32) (_ BitVec 64) V!15653 (_ BitVec 32) Int) Unit!12450)

(assert (=> b!421682 (= lt!193606 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!471 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17988 () Bool)

(assert (=> mapIsEmpty!17988 mapRes!17988))

(declare-fun bm!29452 () Bool)

(declare-fun lt!193600 () array!25669)

(declare-datatypes ((tuple2!7214 0))(
  ( (tuple2!7215 (_1!3618 (_ BitVec 64)) (_2!3618 V!15653)) )
))
(declare-datatypes ((List!7220 0))(
  ( (Nil!7217) (Cons!7216 (h!8072 tuple2!7214) (t!12644 List!7220)) )
))
(declare-datatypes ((ListLongMap!6127 0))(
  ( (ListLongMap!6128 (toList!3079 List!7220)) )
))
(declare-fun call!29455 () ListLongMap!6127)

(declare-fun lt!193599 () array!25671)

(declare-fun getCurrentListMapNoExtraKeys!1283 (array!25669 array!25671 (_ BitVec 32) (_ BitVec 32) V!15653 V!15653 (_ BitVec 32) Int) ListLongMap!6127)

(assert (=> bm!29452 (= call!29455 (getCurrentListMapNoExtraKeys!1283 (ite c!55352 lt!193600 _keys!709) (ite c!55352 lt!193599 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421683 () Bool)

(declare-fun e!251003 () Bool)

(assert (=> b!421683 (= e!251003 e!250997)))

(declare-fun res!246135 () Bool)

(assert (=> b!421683 (=> (not res!246135) (not e!250997))))

(assert (=> b!421683 (= res!246135 (= from!863 i!563))))

(declare-fun lt!193602 () ListLongMap!6127)

(assert (=> b!421683 (= lt!193602 (getCurrentListMapNoExtraKeys!1283 lt!193600 lt!193599 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421683 (= lt!193599 (array!25672 (store (arr!12285 _values!549) i!563 (ValueCellFull!5112 v!412)) (size!12637 _values!549)))))

(declare-fun lt!193607 () ListLongMap!6127)

(assert (=> b!421683 (= lt!193607 (getCurrentListMapNoExtraKeys!1283 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421684 () Bool)

(declare-fun e!251004 () Bool)

(declare-fun tp_is_empty!10911 () Bool)

(assert (=> b!421684 (= e!251004 tp_is_empty!10911)))

(declare-fun b!421685 () Bool)

(assert (=> b!421685 (= e!251000 tp_is_empty!10911)))

(declare-fun res!246130 () Bool)

(assert (=> start!39492 (=> (not res!246130) (not e!250999))))

(assert (=> start!39492 (= res!246130 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12636 _keys!709))))))

(assert (=> start!39492 e!250999))

(assert (=> start!39492 tp_is_empty!10911))

(assert (=> start!39492 tp!34806))

(assert (=> start!39492 true))

(declare-fun array_inv!8950 (array!25671) Bool)

(assert (=> start!39492 (and (array_inv!8950 _values!549) e!251002)))

(declare-fun array_inv!8951 (array!25669) Bool)

(assert (=> start!39492 (array_inv!8951 _keys!709)))

(declare-fun call!29456 () ListLongMap!6127)

(declare-fun b!421686 () Bool)

(declare-fun +!1274 (ListLongMap!6127 tuple2!7214) ListLongMap!6127)

(assert (=> b!421686 (= e!250998 (= call!29455 (+!1274 call!29456 (tuple2!7215 k0!794 v!412))))))

(declare-fun b!421687 () Bool)

(declare-fun res!246127 () Bool)

(assert (=> b!421687 (=> (not res!246127) (not e!250999))))

(assert (=> b!421687 (= res!246127 (validKeyInArray!0 k0!794))))

(declare-fun b!421688 () Bool)

(declare-fun res!246128 () Bool)

(assert (=> b!421688 (=> (not res!246128) (not e!251003))))

(assert (=> b!421688 (= res!246128 (bvsle from!863 i!563))))

(declare-fun b!421689 () Bool)

(declare-fun res!246125 () Bool)

(assert (=> b!421689 (=> (not res!246125) (not e!250999))))

(assert (=> b!421689 (= res!246125 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12636 _keys!709))))))

(declare-fun mapNonEmpty!17988 () Bool)

(declare-fun tp!34805 () Bool)

(assert (=> mapNonEmpty!17988 (= mapRes!17988 (and tp!34805 e!251004))))

(declare-fun mapValue!17988 () ValueCell!5112)

(declare-fun mapRest!17988 () (Array (_ BitVec 32) ValueCell!5112))

(declare-fun mapKey!17988 () (_ BitVec 32))

(assert (=> mapNonEmpty!17988 (= (arr!12285 _values!549) (store mapRest!17988 mapKey!17988 mapValue!17988))))

(declare-fun b!421690 () Bool)

(declare-fun res!246133 () Bool)

(assert (=> b!421690 (=> (not res!246133) (not e!250999))))

(assert (=> b!421690 (= res!246133 (and (= (size!12637 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12636 _keys!709) (size!12637 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421691 () Bool)

(assert (=> b!421691 (= e!250999 e!251003)))

(declare-fun res!246126 () Bool)

(assert (=> b!421691 (=> (not res!246126) (not e!251003))))

(assert (=> b!421691 (= res!246126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193600 mask!1025))))

(assert (=> b!421691 (= lt!193600 (array!25670 (store (arr!12284 _keys!709) i!563 k0!794) (size!12636 _keys!709)))))

(declare-fun b!421692 () Bool)

(declare-fun res!246129 () Bool)

(assert (=> b!421692 (=> (not res!246129) (not e!250999))))

(declare-datatypes ((List!7221 0))(
  ( (Nil!7218) (Cons!7217 (h!8073 (_ BitVec 64)) (t!12645 List!7221)) )
))
(declare-fun arrayNoDuplicates!0 (array!25669 (_ BitVec 32) List!7221) Bool)

(assert (=> b!421692 (= res!246129 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7218))))

(declare-fun b!421693 () Bool)

(declare-fun res!246123 () Bool)

(assert (=> b!421693 (=> (not res!246123) (not e!250999))))

(assert (=> b!421693 (= res!246123 (or (= (select (arr!12284 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12284 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421694 () Bool)

(declare-fun res!246132 () Bool)

(assert (=> b!421694 (=> (not res!246132) (not e!251003))))

(assert (=> b!421694 (= res!246132 (arrayNoDuplicates!0 lt!193600 #b00000000000000000000000000000000 Nil!7218))))

(declare-fun b!421695 () Bool)

(assert (=> b!421695 (= e!250998 (= call!29456 call!29455))))

(declare-fun bm!29453 () Bool)

(assert (=> bm!29453 (= call!29456 (getCurrentListMapNoExtraKeys!1283 (ite c!55352 _keys!709 lt!193600) (ite c!55352 _values!549 lt!193599) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421696 () Bool)

(assert (=> b!421696 (= e!251001 true)))

(declare-fun lt!193601 () tuple2!7214)

(declare-fun lt!193597 () V!15653)

(declare-fun lt!193598 () ListLongMap!6127)

(assert (=> b!421696 (= (+!1274 lt!193598 lt!193601) (+!1274 (+!1274 lt!193598 (tuple2!7215 k0!794 lt!193597)) lt!193601))))

(declare-fun lt!193603 () V!15653)

(assert (=> b!421696 (= lt!193601 (tuple2!7215 k0!794 lt!193603))))

(declare-fun lt!193604 () Unit!12450)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!68 (ListLongMap!6127 (_ BitVec 64) V!15653 V!15653) Unit!12450)

(assert (=> b!421696 (= lt!193604 (addSameAsAddTwiceSameKeyDiffValues!68 lt!193598 k0!794 lt!193597 lt!193603))))

(declare-fun lt!193605 () V!15653)

(declare-fun get!6106 (ValueCell!5112 V!15653) V!15653)

(assert (=> b!421696 (= lt!193597 (get!6106 (select (arr!12285 _values!549) from!863) lt!193605))))

(assert (=> b!421696 (= lt!193602 (+!1274 lt!193598 (tuple2!7215 (select (arr!12284 lt!193600) from!863) lt!193603)))))

(assert (=> b!421696 (= lt!193603 (get!6106 (select (store (arr!12285 _values!549) i!563 (ValueCellFull!5112 v!412)) from!863) lt!193605))))

(declare-fun dynLambda!739 (Int (_ BitVec 64)) V!15653)

(assert (=> b!421696 (= lt!193605 (dynLambda!739 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!421696 (= lt!193598 (getCurrentListMapNoExtraKeys!1283 lt!193600 lt!193599 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39492 res!246130) b!421678))

(assert (= (and b!421678 res!246122) b!421690))

(assert (= (and b!421690 res!246133) b!421680))

(assert (= (and b!421680 res!246134) b!421692))

(assert (= (and b!421692 res!246129) b!421689))

(assert (= (and b!421689 res!246125) b!421687))

(assert (= (and b!421687 res!246127) b!421693))

(assert (= (and b!421693 res!246123) b!421679))

(assert (= (and b!421679 res!246131) b!421691))

(assert (= (and b!421691 res!246126) b!421694))

(assert (= (and b!421694 res!246132) b!421688))

(assert (= (and b!421688 res!246128) b!421683))

(assert (= (and b!421683 res!246135) b!421682))

(assert (= (and b!421682 c!55352) b!421686))

(assert (= (and b!421682 (not c!55352)) b!421695))

(assert (= (or b!421686 b!421695) bm!29452))

(assert (= (or b!421686 b!421695) bm!29453))

(assert (= (and b!421682 (not res!246124)) b!421696))

(assert (= (and b!421681 condMapEmpty!17988) mapIsEmpty!17988))

(assert (= (and b!421681 (not condMapEmpty!17988)) mapNonEmpty!17988))

(get-info :version)

(assert (= (and mapNonEmpty!17988 ((_ is ValueCellFull!5112) mapValue!17988)) b!421684))

(assert (= (and b!421681 ((_ is ValueCellFull!5112) mapDefault!17988)) b!421685))

(assert (= start!39492 b!421681))

(declare-fun b_lambda!9063 () Bool)

(assert (=> (not b_lambda!9063) (not b!421696)))

(declare-fun t!12643 () Bool)

(declare-fun tb!3381 () Bool)

(assert (=> (and start!39492 (= defaultEntry!557 defaultEntry!557) t!12643) tb!3381))

(declare-fun result!6289 () Bool)

(assert (=> tb!3381 (= result!6289 tp_is_empty!10911)))

(assert (=> b!421696 t!12643))

(declare-fun b_and!17395 () Bool)

(assert (= b_and!17393 (and (=> t!12643 result!6289) b_and!17395)))

(declare-fun m!411449 () Bool)

(assert (=> start!39492 m!411449))

(declare-fun m!411451 () Bool)

(assert (=> start!39492 m!411451))

(declare-fun m!411453 () Bool)

(assert (=> b!421686 m!411453))

(declare-fun m!411455 () Bool)

(assert (=> b!421693 m!411455))

(declare-fun m!411457 () Bool)

(assert (=> bm!29452 m!411457))

(declare-fun m!411459 () Bool)

(assert (=> b!421678 m!411459))

(declare-fun m!411461 () Bool)

(assert (=> b!421682 m!411461))

(assert (=> b!421682 m!411461))

(declare-fun m!411463 () Bool)

(assert (=> b!421682 m!411463))

(declare-fun m!411465 () Bool)

(assert (=> b!421682 m!411465))

(declare-fun m!411467 () Bool)

(assert (=> mapNonEmpty!17988 m!411467))

(declare-fun m!411469 () Bool)

(assert (=> b!421692 m!411469))

(declare-fun m!411471 () Bool)

(assert (=> b!421691 m!411471))

(declare-fun m!411473 () Bool)

(assert (=> b!421691 m!411473))

(declare-fun m!411475 () Bool)

(assert (=> b!421683 m!411475))

(declare-fun m!411477 () Bool)

(assert (=> b!421683 m!411477))

(declare-fun m!411479 () Bool)

(assert (=> b!421683 m!411479))

(declare-fun m!411481 () Bool)

(assert (=> b!421680 m!411481))

(declare-fun m!411483 () Bool)

(assert (=> b!421679 m!411483))

(declare-fun m!411485 () Bool)

(assert (=> b!421687 m!411485))

(declare-fun m!411487 () Bool)

(assert (=> b!421694 m!411487))

(declare-fun m!411489 () Bool)

(assert (=> bm!29453 m!411489))

(declare-fun m!411491 () Bool)

(assert (=> b!421696 m!411491))

(declare-fun m!411493 () Bool)

(assert (=> b!421696 m!411493))

(declare-fun m!411495 () Bool)

(assert (=> b!421696 m!411495))

(declare-fun m!411497 () Bool)

(assert (=> b!421696 m!411497))

(assert (=> b!421696 m!411477))

(declare-fun m!411499 () Bool)

(assert (=> b!421696 m!411499))

(declare-fun m!411501 () Bool)

(assert (=> b!421696 m!411501))

(declare-fun m!411503 () Bool)

(assert (=> b!421696 m!411503))

(declare-fun m!411505 () Bool)

(assert (=> b!421696 m!411505))

(declare-fun m!411507 () Bool)

(assert (=> b!421696 m!411507))

(declare-fun m!411509 () Bool)

(assert (=> b!421696 m!411509))

(declare-fun m!411511 () Bool)

(assert (=> b!421696 m!411511))

(assert (=> b!421696 m!411499))

(assert (=> b!421696 m!411507))

(assert (=> b!421696 m!411503))

(declare-fun m!411513 () Bool)

(assert (=> b!421696 m!411513))

(check-sat (not b!421680) tp_is_empty!10911 (not b!421691) (not bm!29453) (not b!421694) (not start!39492) (not b_next!9759) (not b!421679) (not b_lambda!9063) b_and!17395 (not mapNonEmpty!17988) (not bm!29452) (not b!421687) (not b!421682) (not b!421683) (not b!421692) (not b!421696) (not b!421678) (not b!421686))
(check-sat b_and!17395 (not b_next!9759))
