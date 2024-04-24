; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39410 () Bool)

(assert start!39410)

(declare-fun b_free!9691 () Bool)

(declare-fun b_next!9691 () Bool)

(assert (=> start!39410 (= b_free!9691 (not b_next!9691))))

(declare-fun tp!34601 () Bool)

(declare-fun b_and!17271 () Bool)

(assert (=> start!39410 (= tp!34601 b_and!17271)))

(declare-fun b!419623 () Bool)

(declare-fun e!250051 () Bool)

(declare-fun e!250047 () Bool)

(assert (=> b!419623 (= e!250051 e!250047)))

(declare-fun res!244700 () Bool)

(assert (=> b!419623 (=> (not res!244700) (not e!250047))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419623 (= res!244700 (= from!863 i!563))))

(declare-datatypes ((V!15563 0))(
  ( (V!15564 (val!5466 Int)) )
))
(declare-fun minValue!515 () V!15563)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5078 0))(
  ( (ValueCellFull!5078 (v!7714 V!15563)) (EmptyCell!5078) )
))
(declare-datatypes ((array!25542 0))(
  ( (array!25543 (arr!12220 (Array (_ BitVec 32) ValueCell!5078)) (size!12572 (_ BitVec 32))) )
))
(declare-fun lt!192496 () array!25542)

(declare-datatypes ((array!25544 0))(
  ( (array!25545 (arr!12221 (Array (_ BitVec 32) (_ BitVec 64))) (size!12573 (_ BitVec 32))) )
))
(declare-fun lt!192504 () array!25544)

(declare-fun zeroValue!515 () V!15563)

(declare-datatypes ((tuple2!7034 0))(
  ( (tuple2!7035 (_1!3528 (_ BitVec 64)) (_2!3528 V!15563)) )
))
(declare-datatypes ((List!7044 0))(
  ( (Nil!7041) (Cons!7040 (h!7896 tuple2!7034) (t!12392 List!7044)) )
))
(declare-datatypes ((ListLongMap!5949 0))(
  ( (ListLongMap!5950 (toList!2990 List!7044)) )
))
(declare-fun lt!192503 () ListLongMap!5949)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1236 (array!25544 array!25542 (_ BitVec 32) (_ BitVec 32) V!15563 V!15563 (_ BitVec 32) Int) ListLongMap!5949)

(assert (=> b!419623 (= lt!192503 (getCurrentListMapNoExtraKeys!1236 lt!192504 lt!192496 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25542)

(declare-fun v!412 () V!15563)

(assert (=> b!419623 (= lt!192496 (array!25543 (store (arr!12220 _values!549) i!563 (ValueCellFull!5078 v!412)) (size!12572 _values!549)))))

(declare-fun lt!192494 () ListLongMap!5949)

(declare-fun _keys!709 () array!25544)

(assert (=> b!419623 (= lt!192494 (getCurrentListMapNoExtraKeys!1236 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun call!29238 () ListLongMap!5949)

(declare-fun call!29239 () ListLongMap!5949)

(declare-fun b!419624 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!250049 () Bool)

(declare-fun +!1254 (ListLongMap!5949 tuple2!7034) ListLongMap!5949)

(assert (=> b!419624 (= e!250049 (= call!29238 (+!1254 call!29239 (tuple2!7035 k0!794 v!412))))))

(declare-fun b!419625 () Bool)

(declare-fun e!250052 () Bool)

(assert (=> b!419625 (= e!250047 (not e!250052))))

(declare-fun res!244694 () Bool)

(assert (=> b!419625 (=> res!244694 e!250052)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419625 (= res!244694 (validKeyInArray!0 (select (arr!12221 _keys!709) from!863)))))

(assert (=> b!419625 e!250049))

(declare-fun c!55227 () Bool)

(assert (=> b!419625 (= c!55227 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12381 0))(
  ( (Unit!12382) )
))
(declare-fun lt!192502 () Unit!12381)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!445 (array!25544 array!25542 (_ BitVec 32) (_ BitVec 32) V!15563 V!15563 (_ BitVec 32) (_ BitVec 64) V!15563 (_ BitVec 32) Int) Unit!12381)

(assert (=> b!419625 (= lt!192502 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!445 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419626 () Bool)

(declare-fun res!244698 () Bool)

(declare-fun e!250046 () Bool)

(assert (=> b!419626 (=> (not res!244698) (not e!250046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419626 (= res!244698 (validMask!0 mask!1025))))

(declare-fun b!419627 () Bool)

(declare-fun res!244702 () Bool)

(assert (=> b!419627 (=> (not res!244702) (not e!250046))))

(declare-fun arrayContainsKey!0 (array!25544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419627 (= res!244702 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!419628 () Bool)

(declare-fun e!250050 () Bool)

(declare-fun tp_is_empty!10843 () Bool)

(assert (=> b!419628 (= e!250050 tp_is_empty!10843)))

(declare-fun b!419629 () Bool)

(declare-fun res!244703 () Bool)

(assert (=> b!419629 (=> (not res!244703) (not e!250046))))

(assert (=> b!419629 (= res!244703 (and (= (size!12572 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12573 _keys!709) (size!12572 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17886 () Bool)

(declare-fun mapRes!17886 () Bool)

(declare-fun tp!34602 () Bool)

(assert (=> mapNonEmpty!17886 (= mapRes!17886 (and tp!34602 e!250050))))

(declare-fun mapRest!17886 () (Array (_ BitVec 32) ValueCell!5078))

(declare-fun mapKey!17886 () (_ BitVec 32))

(declare-fun mapValue!17886 () ValueCell!5078)

(assert (=> mapNonEmpty!17886 (= (arr!12220 _values!549) (store mapRest!17886 mapKey!17886 mapValue!17886))))

(declare-fun b!419630 () Bool)

(declare-fun e!250053 () Bool)

(declare-fun e!250048 () Bool)

(assert (=> b!419630 (= e!250053 (and e!250048 mapRes!17886))))

(declare-fun condMapEmpty!17886 () Bool)

(declare-fun mapDefault!17886 () ValueCell!5078)

(assert (=> b!419630 (= condMapEmpty!17886 (= (arr!12220 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5078)) mapDefault!17886)))))

(declare-fun b!419631 () Bool)

(assert (=> b!419631 (= e!250049 (= call!29239 call!29238))))

(declare-fun b!419632 () Bool)

(declare-fun res!244699 () Bool)

(assert (=> b!419632 (=> (not res!244699) (not e!250046))))

(assert (=> b!419632 (= res!244699 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12573 _keys!709))))))

(declare-fun b!419633 () Bool)

(assert (=> b!419633 (= e!250052 true)))

(declare-fun lt!192500 () tuple2!7034)

(declare-fun lt!192501 () V!15563)

(declare-fun lt!192495 () ListLongMap!5949)

(assert (=> b!419633 (= (+!1254 lt!192495 lt!192500) (+!1254 (+!1254 lt!192495 (tuple2!7035 k0!794 lt!192501)) lt!192500))))

(declare-fun lt!192497 () V!15563)

(assert (=> b!419633 (= lt!192500 (tuple2!7035 k0!794 lt!192497))))

(declare-fun lt!192499 () Unit!12381)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!44 (ListLongMap!5949 (_ BitVec 64) V!15563 V!15563) Unit!12381)

(assert (=> b!419633 (= lt!192499 (addSameAsAddTwiceSameKeyDiffValues!44 lt!192495 k0!794 lt!192501 lt!192497))))

(declare-fun lt!192498 () V!15563)

(declare-fun get!6062 (ValueCell!5078 V!15563) V!15563)

(assert (=> b!419633 (= lt!192501 (get!6062 (select (arr!12220 _values!549) from!863) lt!192498))))

(assert (=> b!419633 (= lt!192503 (+!1254 lt!192495 (tuple2!7035 (select (arr!12221 lt!192504) from!863) lt!192497)))))

(assert (=> b!419633 (= lt!192497 (get!6062 (select (store (arr!12220 _values!549) i!563 (ValueCellFull!5078 v!412)) from!863) lt!192498))))

(declare-fun dynLambda!711 (Int (_ BitVec 64)) V!15563)

(assert (=> b!419633 (= lt!192498 (dynLambda!711 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419633 (= lt!192495 (getCurrentListMapNoExtraKeys!1236 lt!192504 lt!192496 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419634 () Bool)

(declare-fun res!244697 () Bool)

(assert (=> b!419634 (=> (not res!244697) (not e!250046))))

(assert (=> b!419634 (= res!244697 (or (= (select (arr!12221 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12221 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419635 () Bool)

(assert (=> b!419635 (= e!250048 tp_is_empty!10843)))

(declare-fun bm!29235 () Bool)

(assert (=> bm!29235 (= call!29238 (getCurrentListMapNoExtraKeys!1236 (ite c!55227 lt!192504 _keys!709) (ite c!55227 lt!192496 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419636 () Bool)

(declare-fun res!244696 () Bool)

(assert (=> b!419636 (=> (not res!244696) (not e!250046))))

(declare-datatypes ((List!7045 0))(
  ( (Nil!7042) (Cons!7041 (h!7897 (_ BitVec 64)) (t!12393 List!7045)) )
))
(declare-fun arrayNoDuplicates!0 (array!25544 (_ BitVec 32) List!7045) Bool)

(assert (=> b!419636 (= res!244696 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7042))))

(declare-fun res!244695 () Bool)

(assert (=> start!39410 (=> (not res!244695) (not e!250046))))

(assert (=> start!39410 (= res!244695 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12573 _keys!709))))))

(assert (=> start!39410 e!250046))

(assert (=> start!39410 tp_is_empty!10843))

(assert (=> start!39410 tp!34601))

(assert (=> start!39410 true))

(declare-fun array_inv!8984 (array!25542) Bool)

(assert (=> start!39410 (and (array_inv!8984 _values!549) e!250053)))

(declare-fun array_inv!8985 (array!25544) Bool)

(assert (=> start!39410 (array_inv!8985 _keys!709)))

(declare-fun b!419637 () Bool)

(assert (=> b!419637 (= e!250046 e!250051)))

(declare-fun res!244704 () Bool)

(assert (=> b!419637 (=> (not res!244704) (not e!250051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25544 (_ BitVec 32)) Bool)

(assert (=> b!419637 (= res!244704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192504 mask!1025))))

(assert (=> b!419637 (= lt!192504 (array!25545 (store (arr!12221 _keys!709) i!563 k0!794) (size!12573 _keys!709)))))

(declare-fun b!419638 () Bool)

(declare-fun res!244692 () Bool)

(assert (=> b!419638 (=> (not res!244692) (not e!250051))))

(assert (=> b!419638 (= res!244692 (bvsle from!863 i!563))))

(declare-fun b!419639 () Bool)

(declare-fun res!244691 () Bool)

(assert (=> b!419639 (=> (not res!244691) (not e!250046))))

(assert (=> b!419639 (= res!244691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17886 () Bool)

(assert (=> mapIsEmpty!17886 mapRes!17886))

(declare-fun b!419640 () Bool)

(declare-fun res!244693 () Bool)

(assert (=> b!419640 (=> (not res!244693) (not e!250046))))

(assert (=> b!419640 (= res!244693 (validKeyInArray!0 k0!794))))

(declare-fun b!419641 () Bool)

(declare-fun res!244701 () Bool)

(assert (=> b!419641 (=> (not res!244701) (not e!250051))))

(assert (=> b!419641 (= res!244701 (arrayNoDuplicates!0 lt!192504 #b00000000000000000000000000000000 Nil!7042))))

(declare-fun bm!29236 () Bool)

(assert (=> bm!29236 (= call!29239 (getCurrentListMapNoExtraKeys!1236 (ite c!55227 _keys!709 lt!192504) (ite c!55227 _values!549 lt!192496) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39410 res!244695) b!419626))

(assert (= (and b!419626 res!244698) b!419629))

(assert (= (and b!419629 res!244703) b!419639))

(assert (= (and b!419639 res!244691) b!419636))

(assert (= (and b!419636 res!244696) b!419632))

(assert (= (and b!419632 res!244699) b!419640))

(assert (= (and b!419640 res!244693) b!419634))

(assert (= (and b!419634 res!244697) b!419627))

(assert (= (and b!419627 res!244702) b!419637))

(assert (= (and b!419637 res!244704) b!419641))

(assert (= (and b!419641 res!244701) b!419638))

(assert (= (and b!419638 res!244692) b!419623))

(assert (= (and b!419623 res!244700) b!419625))

(assert (= (and b!419625 c!55227) b!419624))

(assert (= (and b!419625 (not c!55227)) b!419631))

(assert (= (or b!419624 b!419631) bm!29235))

(assert (= (or b!419624 b!419631) bm!29236))

(assert (= (and b!419625 (not res!244694)) b!419633))

(assert (= (and b!419630 condMapEmpty!17886) mapIsEmpty!17886))

(assert (= (and b!419630 (not condMapEmpty!17886)) mapNonEmpty!17886))

(get-info :version)

(assert (= (and mapNonEmpty!17886 ((_ is ValueCellFull!5078) mapValue!17886)) b!419628))

(assert (= (and b!419630 ((_ is ValueCellFull!5078) mapDefault!17886)) b!419635))

(assert (= start!39410 b!419630))

(declare-fun b_lambda!9017 () Bool)

(assert (=> (not b_lambda!9017) (not b!419633)))

(declare-fun t!12391 () Bool)

(declare-fun tb!3305 () Bool)

(assert (=> (and start!39410 (= defaultEntry!557 defaultEntry!557) t!12391) tb!3305))

(declare-fun result!6145 () Bool)

(assert (=> tb!3305 (= result!6145 tp_is_empty!10843)))

(assert (=> b!419633 t!12391))

(declare-fun b_and!17273 () Bool)

(assert (= b_and!17271 (and (=> t!12391 result!6145) b_and!17273)))

(declare-fun m!409423 () Bool)

(assert (=> b!419641 m!409423))

(declare-fun m!409425 () Bool)

(assert (=> b!419625 m!409425))

(assert (=> b!419625 m!409425))

(declare-fun m!409427 () Bool)

(assert (=> b!419625 m!409427))

(declare-fun m!409429 () Bool)

(assert (=> b!419625 m!409429))

(declare-fun m!409431 () Bool)

(assert (=> b!419636 m!409431))

(declare-fun m!409433 () Bool)

(assert (=> b!419637 m!409433))

(declare-fun m!409435 () Bool)

(assert (=> b!419637 m!409435))

(declare-fun m!409437 () Bool)

(assert (=> b!419623 m!409437))

(declare-fun m!409439 () Bool)

(assert (=> b!419623 m!409439))

(declare-fun m!409441 () Bool)

(assert (=> b!419623 m!409441))

(declare-fun m!409443 () Bool)

(assert (=> b!419624 m!409443))

(declare-fun m!409445 () Bool)

(assert (=> mapNonEmpty!17886 m!409445))

(declare-fun m!409447 () Bool)

(assert (=> b!419634 m!409447))

(declare-fun m!409449 () Bool)

(assert (=> b!419640 m!409449))

(declare-fun m!409451 () Bool)

(assert (=> b!419633 m!409451))

(declare-fun m!409453 () Bool)

(assert (=> b!419633 m!409453))

(declare-fun m!409455 () Bool)

(assert (=> b!419633 m!409455))

(declare-fun m!409457 () Bool)

(assert (=> b!419633 m!409457))

(declare-fun m!409459 () Bool)

(assert (=> b!419633 m!409459))

(declare-fun m!409461 () Bool)

(assert (=> b!419633 m!409461))

(assert (=> b!419633 m!409455))

(declare-fun m!409463 () Bool)

(assert (=> b!419633 m!409463))

(assert (=> b!419633 m!409459))

(declare-fun m!409465 () Bool)

(assert (=> b!419633 m!409465))

(declare-fun m!409467 () Bool)

(assert (=> b!419633 m!409467))

(declare-fun m!409469 () Bool)

(assert (=> b!419633 m!409469))

(assert (=> b!419633 m!409439))

(assert (=> b!419633 m!409467))

(declare-fun m!409471 () Bool)

(assert (=> b!419633 m!409471))

(declare-fun m!409473 () Bool)

(assert (=> b!419633 m!409473))

(declare-fun m!409475 () Bool)

(assert (=> bm!29235 m!409475))

(declare-fun m!409477 () Bool)

(assert (=> b!419639 m!409477))

(declare-fun m!409479 () Bool)

(assert (=> b!419626 m!409479))

(declare-fun m!409481 () Bool)

(assert (=> bm!29236 m!409481))

(declare-fun m!409483 () Bool)

(assert (=> start!39410 m!409483))

(declare-fun m!409485 () Bool)

(assert (=> start!39410 m!409485))

(declare-fun m!409487 () Bool)

(assert (=> b!419627 m!409487))

(check-sat (not b!419636) (not b!419623) (not b!419640) (not b_lambda!9017) (not bm!29235) (not bm!29236) (not start!39410) (not mapNonEmpty!17886) tp_is_empty!10843 (not b!419627) (not b!419625) (not b!419624) (not b!419641) (not b!419639) (not b!419637) b_and!17273 (not b!419633) (not b_next!9691) (not b!419626))
(check-sat b_and!17273 (not b_next!9691))
