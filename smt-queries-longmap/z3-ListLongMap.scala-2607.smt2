; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39462 () Bool)

(assert start!39462)

(declare-fun b_free!9729 () Bool)

(declare-fun b_next!9729 () Bool)

(assert (=> start!39462 (= b_free!9729 (not b_next!9729))))

(declare-fun tp!34715 () Bool)

(declare-fun b_and!17333 () Bool)

(assert (=> start!39462 (= tp!34715 b_and!17333)))

(declare-fun b!420793 () Bool)

(declare-fun res!245500 () Bool)

(declare-fun e!250598 () Bool)

(assert (=> b!420793 (=> (not res!245500) (not e!250598))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420793 (= res!245500 (bvsle from!863 i!563))))

(declare-fun res!245496 () Bool)

(declare-fun e!250597 () Bool)

(assert (=> start!39462 (=> (not res!245496) (not e!250597))))

(declare-datatypes ((array!25611 0))(
  ( (array!25612 (arr!12255 (Array (_ BitVec 32) (_ BitVec 64))) (size!12607 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25611)

(assert (=> start!39462 (= res!245496 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12607 _keys!709))))))

(assert (=> start!39462 e!250597))

(declare-fun tp_is_empty!10881 () Bool)

(assert (=> start!39462 tp_is_empty!10881))

(assert (=> start!39462 tp!34715))

(assert (=> start!39462 true))

(declare-datatypes ((V!15613 0))(
  ( (V!15614 (val!5485 Int)) )
))
(declare-datatypes ((ValueCell!5097 0))(
  ( (ValueCellFull!5097 (v!7732 V!15613)) (EmptyCell!5097) )
))
(declare-datatypes ((array!25613 0))(
  ( (array!25614 (arr!12256 (Array (_ BitVec 32) ValueCell!5097)) (size!12608 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25613)

(declare-fun e!250592 () Bool)

(declare-fun array_inv!8934 (array!25613) Bool)

(assert (=> start!39462 (and (array_inv!8934 _values!549) e!250592)))

(declare-fun array_inv!8935 (array!25611) Bool)

(assert (=> start!39462 (array_inv!8935 _keys!709)))

(declare-fun b!420794 () Bool)

(declare-fun e!250594 () Bool)

(declare-datatypes ((tuple2!7192 0))(
  ( (tuple2!7193 (_1!3607 (_ BitVec 64)) (_2!3607 V!15613)) )
))
(declare-datatypes ((List!7199 0))(
  ( (Nil!7196) (Cons!7195 (h!8051 tuple2!7192) (t!12593 List!7199)) )
))
(declare-datatypes ((ListLongMap!6105 0))(
  ( (ListLongMap!6106 (toList!3068 List!7199)) )
))
(declare-fun call!29366 () ListLongMap!6105)

(declare-fun call!29365 () ListLongMap!6105)

(assert (=> b!420794 (= e!250594 (= call!29366 call!29365))))

(declare-fun b!420795 () Bool)

(declare-fun res!245503 () Bool)

(assert (=> b!420795 (=> (not res!245503) (not e!250597))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!420795 (= res!245503 (and (= (size!12608 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12607 _keys!709) (size!12608 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420796 () Bool)

(declare-fun e!250595 () Bool)

(declare-fun mapRes!17943 () Bool)

(assert (=> b!420796 (= e!250592 (and e!250595 mapRes!17943))))

(declare-fun condMapEmpty!17943 () Bool)

(declare-fun mapDefault!17943 () ValueCell!5097)

(assert (=> b!420796 (= condMapEmpty!17943 (= (arr!12256 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5097)) mapDefault!17943)))))

(declare-fun b!420797 () Bool)

(declare-fun res!245494 () Bool)

(assert (=> b!420797 (=> (not res!245494) (not e!250598))))

(declare-fun lt!193109 () array!25611)

(declare-datatypes ((List!7200 0))(
  ( (Nil!7197) (Cons!7196 (h!8052 (_ BitVec 64)) (t!12594 List!7200)) )
))
(declare-fun arrayNoDuplicates!0 (array!25611 (_ BitVec 32) List!7200) Bool)

(assert (=> b!420797 (= res!245494 (arrayNoDuplicates!0 lt!193109 #b00000000000000000000000000000000 Nil!7197))))

(declare-fun c!55307 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15613)

(declare-fun bm!29362 () Bool)

(declare-fun lt!193103 () array!25613)

(declare-fun minValue!515 () V!15613)

(declare-fun getCurrentListMapNoExtraKeys!1272 (array!25611 array!25613 (_ BitVec 32) (_ BitVec 32) V!15613 V!15613 (_ BitVec 32) Int) ListLongMap!6105)

(assert (=> bm!29362 (= call!29366 (getCurrentListMapNoExtraKeys!1272 (ite c!55307 _keys!709 lt!193109) (ite c!55307 _values!549 lt!193103) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420798 () Bool)

(declare-fun e!250599 () Bool)

(assert (=> b!420798 (= e!250599 tp_is_empty!10881)))

(declare-fun b!420799 () Bool)

(declare-fun res!245492 () Bool)

(assert (=> b!420799 (=> (not res!245492) (not e!250597))))

(assert (=> b!420799 (= res!245492 (or (= (select (arr!12255 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12255 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420800 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15613)

(declare-fun +!1265 (ListLongMap!6105 tuple2!7192) ListLongMap!6105)

(assert (=> b!420800 (= e!250594 (= call!29365 (+!1265 call!29366 (tuple2!7193 k0!794 v!412))))))

(declare-fun b!420801 () Bool)

(declare-fun res!245505 () Bool)

(assert (=> b!420801 (=> (not res!245505) (not e!250597))))

(assert (=> b!420801 (= res!245505 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12607 _keys!709))))))

(declare-fun b!420802 () Bool)

(assert (=> b!420802 (= e!250597 e!250598)))

(declare-fun res!245498 () Bool)

(assert (=> b!420802 (=> (not res!245498) (not e!250598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25611 (_ BitVec 32)) Bool)

(assert (=> b!420802 (= res!245498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193109 mask!1025))))

(assert (=> b!420802 (= lt!193109 (array!25612 (store (arr!12255 _keys!709) i!563 k0!794) (size!12607 _keys!709)))))

(declare-fun b!420803 () Bool)

(declare-fun res!245493 () Bool)

(assert (=> b!420803 (=> (not res!245493) (not e!250597))))

(declare-fun arrayContainsKey!0 (array!25611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420803 (= res!245493 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!420804 () Bool)

(declare-fun res!245499 () Bool)

(assert (=> b!420804 (=> (not res!245499) (not e!250597))))

(assert (=> b!420804 (= res!245499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420805 () Bool)

(declare-fun res!245495 () Bool)

(assert (=> b!420805 (=> (not res!245495) (not e!250597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420805 (= res!245495 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17943 () Bool)

(assert (=> mapIsEmpty!17943 mapRes!17943))

(declare-fun mapNonEmpty!17943 () Bool)

(declare-fun tp!34716 () Bool)

(assert (=> mapNonEmpty!17943 (= mapRes!17943 (and tp!34716 e!250599))))

(declare-fun mapValue!17943 () ValueCell!5097)

(declare-fun mapRest!17943 () (Array (_ BitVec 32) ValueCell!5097))

(declare-fun mapKey!17943 () (_ BitVec 32))

(assert (=> mapNonEmpty!17943 (= (arr!12256 _values!549) (store mapRest!17943 mapKey!17943 mapValue!17943))))

(declare-fun b!420806 () Bool)

(declare-fun e!250591 () Bool)

(assert (=> b!420806 (= e!250591 true)))

(declare-fun lt!193104 () V!15613)

(declare-fun lt!193102 () ListLongMap!6105)

(declare-fun lt!193111 () tuple2!7192)

(assert (=> b!420806 (= (+!1265 lt!193102 lt!193111) (+!1265 (+!1265 lt!193102 (tuple2!7193 k0!794 lt!193104)) lt!193111))))

(declare-fun lt!193107 () V!15613)

(assert (=> b!420806 (= lt!193111 (tuple2!7193 k0!794 lt!193107))))

(declare-datatypes ((Unit!12432 0))(
  ( (Unit!12433) )
))
(declare-fun lt!193105 () Unit!12432)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!60 (ListLongMap!6105 (_ BitVec 64) V!15613 V!15613) Unit!12432)

(assert (=> b!420806 (= lt!193105 (addSameAsAddTwiceSameKeyDiffValues!60 lt!193102 k0!794 lt!193104 lt!193107))))

(declare-fun lt!193112 () V!15613)

(declare-fun get!6088 (ValueCell!5097 V!15613) V!15613)

(assert (=> b!420806 (= lt!193104 (get!6088 (select (arr!12256 _values!549) from!863) lt!193112))))

(declare-fun lt!193108 () ListLongMap!6105)

(assert (=> b!420806 (= lt!193108 (+!1265 lt!193102 (tuple2!7193 (select (arr!12255 lt!193109) from!863) lt!193107)))))

(assert (=> b!420806 (= lt!193107 (get!6088 (select (store (arr!12256 _values!549) i!563 (ValueCellFull!5097 v!412)) from!863) lt!193112))))

(declare-fun dynLambda!731 (Int (_ BitVec 64)) V!15613)

(assert (=> b!420806 (= lt!193112 (dynLambda!731 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420806 (= lt!193102 (getCurrentListMapNoExtraKeys!1272 lt!193109 lt!193103 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420807 () Bool)

(declare-fun res!245501 () Bool)

(assert (=> b!420807 (=> (not res!245501) (not e!250597))))

(assert (=> b!420807 (= res!245501 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7197))))

(declare-fun bm!29363 () Bool)

(assert (=> bm!29363 (= call!29365 (getCurrentListMapNoExtraKeys!1272 (ite c!55307 lt!193109 _keys!709) (ite c!55307 lt!193103 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420808 () Bool)

(declare-fun e!250593 () Bool)

(assert (=> b!420808 (= e!250598 e!250593)))

(declare-fun res!245502 () Bool)

(assert (=> b!420808 (=> (not res!245502) (not e!250593))))

(assert (=> b!420808 (= res!245502 (= from!863 i!563))))

(assert (=> b!420808 (= lt!193108 (getCurrentListMapNoExtraKeys!1272 lt!193109 lt!193103 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420808 (= lt!193103 (array!25614 (store (arr!12256 _values!549) i!563 (ValueCellFull!5097 v!412)) (size!12608 _values!549)))))

(declare-fun lt!193110 () ListLongMap!6105)

(assert (=> b!420808 (= lt!193110 (getCurrentListMapNoExtraKeys!1272 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420809 () Bool)

(assert (=> b!420809 (= e!250593 (not e!250591))))

(declare-fun res!245497 () Bool)

(assert (=> b!420809 (=> res!245497 e!250591)))

(assert (=> b!420809 (= res!245497 (validKeyInArray!0 (select (arr!12255 _keys!709) from!863)))))

(assert (=> b!420809 e!250594))

(assert (=> b!420809 (= c!55307 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193106 () Unit!12432)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!463 (array!25611 array!25613 (_ BitVec 32) (_ BitVec 32) V!15613 V!15613 (_ BitVec 32) (_ BitVec 64) V!15613 (_ BitVec 32) Int) Unit!12432)

(assert (=> b!420809 (= lt!193106 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!463 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420810 () Bool)

(declare-fun res!245504 () Bool)

(assert (=> b!420810 (=> (not res!245504) (not e!250597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420810 (= res!245504 (validMask!0 mask!1025))))

(declare-fun b!420811 () Bool)

(assert (=> b!420811 (= e!250595 tp_is_empty!10881)))

(assert (= (and start!39462 res!245496) b!420810))

(assert (= (and b!420810 res!245504) b!420795))

(assert (= (and b!420795 res!245503) b!420804))

(assert (= (and b!420804 res!245499) b!420807))

(assert (= (and b!420807 res!245501) b!420801))

(assert (= (and b!420801 res!245505) b!420805))

(assert (= (and b!420805 res!245495) b!420799))

(assert (= (and b!420799 res!245492) b!420803))

(assert (= (and b!420803 res!245493) b!420802))

(assert (= (and b!420802 res!245498) b!420797))

(assert (= (and b!420797 res!245494) b!420793))

(assert (= (and b!420793 res!245500) b!420808))

(assert (= (and b!420808 res!245502) b!420809))

(assert (= (and b!420809 c!55307) b!420800))

(assert (= (and b!420809 (not c!55307)) b!420794))

(assert (= (or b!420800 b!420794) bm!29363))

(assert (= (or b!420800 b!420794) bm!29362))

(assert (= (and b!420809 (not res!245497)) b!420806))

(assert (= (and b!420796 condMapEmpty!17943) mapIsEmpty!17943))

(assert (= (and b!420796 (not condMapEmpty!17943)) mapNonEmpty!17943))

(get-info :version)

(assert (= (and mapNonEmpty!17943 ((_ is ValueCellFull!5097) mapValue!17943)) b!420798))

(assert (= (and b!420796 ((_ is ValueCellFull!5097) mapDefault!17943)) b!420811))

(assert (= start!39462 b!420796))

(declare-fun b_lambda!9033 () Bool)

(assert (=> (not b_lambda!9033) (not b!420806)))

(declare-fun t!12592 () Bool)

(declare-fun tb!3351 () Bool)

(assert (=> (and start!39462 (= defaultEntry!557 defaultEntry!557) t!12592) tb!3351))

(declare-fun result!6229 () Bool)

(assert (=> tb!3351 (= result!6229 tp_is_empty!10881)))

(assert (=> b!420806 t!12592))

(declare-fun b_and!17335 () Bool)

(assert (= b_and!17333 (and (=> t!12592 result!6229) b_and!17335)))

(declare-fun m!410459 () Bool)

(assert (=> b!420808 m!410459))

(declare-fun m!410461 () Bool)

(assert (=> b!420808 m!410461))

(declare-fun m!410463 () Bool)

(assert (=> b!420808 m!410463))

(declare-fun m!410465 () Bool)

(assert (=> b!420804 m!410465))

(declare-fun m!410467 () Bool)

(assert (=> b!420800 m!410467))

(declare-fun m!410469 () Bool)

(assert (=> b!420803 m!410469))

(declare-fun m!410471 () Bool)

(assert (=> b!420797 m!410471))

(declare-fun m!410473 () Bool)

(assert (=> b!420802 m!410473))

(declare-fun m!410475 () Bool)

(assert (=> b!420802 m!410475))

(declare-fun m!410477 () Bool)

(assert (=> b!420805 m!410477))

(declare-fun m!410479 () Bool)

(assert (=> start!39462 m!410479))

(declare-fun m!410481 () Bool)

(assert (=> start!39462 m!410481))

(declare-fun m!410483 () Bool)

(assert (=> bm!29362 m!410483))

(declare-fun m!410485 () Bool)

(assert (=> mapNonEmpty!17943 m!410485))

(declare-fun m!410487 () Bool)

(assert (=> b!420799 m!410487))

(declare-fun m!410489 () Bool)

(assert (=> bm!29363 m!410489))

(declare-fun m!410491 () Bool)

(assert (=> b!420810 m!410491))

(declare-fun m!410493 () Bool)

(assert (=> b!420806 m!410493))

(declare-fun m!410495 () Bool)

(assert (=> b!420806 m!410495))

(assert (=> b!420806 m!410461))

(declare-fun m!410497 () Bool)

(assert (=> b!420806 m!410497))

(declare-fun m!410499 () Bool)

(assert (=> b!420806 m!410499))

(declare-fun m!410501 () Bool)

(assert (=> b!420806 m!410501))

(declare-fun m!410503 () Bool)

(assert (=> b!420806 m!410503))

(declare-fun m!410505 () Bool)

(assert (=> b!420806 m!410505))

(declare-fun m!410507 () Bool)

(assert (=> b!420806 m!410507))

(assert (=> b!420806 m!410497))

(declare-fun m!410509 () Bool)

(assert (=> b!420806 m!410509))

(declare-fun m!410511 () Bool)

(assert (=> b!420806 m!410511))

(declare-fun m!410513 () Bool)

(assert (=> b!420806 m!410513))

(assert (=> b!420806 m!410501))

(assert (=> b!420806 m!410505))

(declare-fun m!410515 () Bool)

(assert (=> b!420806 m!410515))

(declare-fun m!410517 () Bool)

(assert (=> b!420807 m!410517))

(declare-fun m!410519 () Bool)

(assert (=> b!420809 m!410519))

(assert (=> b!420809 m!410519))

(declare-fun m!410521 () Bool)

(assert (=> b!420809 m!410521))

(declare-fun m!410523 () Bool)

(assert (=> b!420809 m!410523))

(check-sat (not b!420806) b_and!17335 (not b!420805) (not b_lambda!9033) (not b!420807) (not b!420810) (not b!420803) (not b!420800) (not b!420808) (not bm!29363) (not b!420797) (not b!420802) (not b!420804) (not b!420809) (not bm!29362) (not start!39462) tp_is_empty!10881 (not mapNonEmpty!17943) (not b_next!9729))
(check-sat b_and!17335 (not b_next!9729))
