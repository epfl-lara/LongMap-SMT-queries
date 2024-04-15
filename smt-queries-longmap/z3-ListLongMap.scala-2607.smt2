; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39446 () Bool)

(assert start!39446)

(declare-fun b_free!9727 () Bool)

(declare-fun b_next!9727 () Bool)

(assert (=> start!39446 (= b_free!9727 (not b_next!9727))))

(declare-fun tp!34710 () Bool)

(declare-fun b_and!17303 () Bool)

(assert (=> start!39446 (= tp!34710 b_and!17303)))

(declare-fun mapNonEmpty!17940 () Bool)

(declare-fun mapRes!17940 () Bool)

(declare-fun tp!34709 () Bool)

(declare-fun e!250390 () Bool)

(assert (=> mapNonEmpty!17940 (= mapRes!17940 (and tp!34709 e!250390))))

(declare-datatypes ((V!15611 0))(
  ( (V!15612 (val!5484 Int)) )
))
(declare-datatypes ((ValueCell!5096 0))(
  ( (ValueCellFull!5096 (v!7725 V!15611)) (EmptyCell!5096) )
))
(declare-datatypes ((array!25591 0))(
  ( (array!25592 (arr!12245 (Array (_ BitVec 32) ValueCell!5096)) (size!12598 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25591)

(declare-fun mapRest!17940 () (Array (_ BitVec 32) ValueCell!5096))

(declare-fun mapValue!17940 () ValueCell!5096)

(declare-fun mapKey!17940 () (_ BitVec 32))

(assert (=> mapNonEmpty!17940 (= (arr!12245 _values!549) (store mapRest!17940 mapKey!17940 mapValue!17940))))

(declare-fun b!420463 () Bool)

(declare-fun e!250393 () Bool)

(declare-fun e!250394 () Bool)

(assert (=> b!420463 (= e!250393 (not e!250394))))

(declare-fun res!245324 () Bool)

(assert (=> b!420463 (=> res!245324 e!250394)))

(declare-datatypes ((array!25593 0))(
  ( (array!25594 (arr!12246 (Array (_ BitVec 32) (_ BitVec 64))) (size!12599 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25593)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420463 (= res!245324 (validKeyInArray!0 (select (arr!12246 _keys!709) from!863)))))

(declare-fun e!250391 () Bool)

(assert (=> b!420463 e!250391))

(declare-fun c!55233 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420463 (= c!55233 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15611)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15611)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15611)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!12400 0))(
  ( (Unit!12401) )
))
(declare-fun lt!192839 () Unit!12400)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!451 (array!25593 array!25591 (_ BitVec 32) (_ BitVec 32) V!15611 V!15611 (_ BitVec 32) (_ BitVec 64) V!15611 (_ BitVec 32) Int) Unit!12400)

(assert (=> b!420463 (= lt!192839 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!451 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420464 () Bool)

(declare-datatypes ((tuple2!7174 0))(
  ( (tuple2!7175 (_1!3598 (_ BitVec 64)) (_2!3598 V!15611)) )
))
(declare-datatypes ((List!7170 0))(
  ( (Nil!7167) (Cons!7166 (h!8022 tuple2!7174) (t!12553 List!7170)) )
))
(declare-datatypes ((ListLongMap!6077 0))(
  ( (ListLongMap!6078 (toList!3054 List!7170)) )
))
(declare-fun call!29335 () ListLongMap!6077)

(declare-fun call!29334 () ListLongMap!6077)

(assert (=> b!420464 (= e!250391 (= call!29335 call!29334))))

(declare-fun b!420465 () Bool)

(declare-fun e!250396 () Bool)

(assert (=> b!420465 (= e!250396 e!250393)))

(declare-fun res!245323 () Bool)

(assert (=> b!420465 (=> (not res!245323) (not e!250393))))

(assert (=> b!420465 (= res!245323 (= from!863 i!563))))

(declare-fun lt!192837 () array!25593)

(declare-fun lt!192845 () array!25591)

(declare-fun lt!192843 () ListLongMap!6077)

(declare-fun getCurrentListMapNoExtraKeys!1264 (array!25593 array!25591 (_ BitVec 32) (_ BitVec 32) V!15611 V!15611 (_ BitVec 32) Int) ListLongMap!6077)

(assert (=> b!420465 (= lt!192843 (getCurrentListMapNoExtraKeys!1264 lt!192837 lt!192845 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420465 (= lt!192845 (array!25592 (store (arr!12245 _values!549) i!563 (ValueCellFull!5096 v!412)) (size!12598 _values!549)))))

(declare-fun lt!192835 () ListLongMap!6077)

(assert (=> b!420465 (= lt!192835 (getCurrentListMapNoExtraKeys!1264 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420466 () Bool)

(declare-fun e!250392 () Bool)

(declare-fun tp_is_empty!10879 () Bool)

(assert (=> b!420466 (= e!250392 tp_is_empty!10879)))

(declare-fun b!420467 () Bool)

(declare-fun res!245332 () Bool)

(assert (=> b!420467 (=> (not res!245332) (not e!250396))))

(declare-datatypes ((List!7171 0))(
  ( (Nil!7168) (Cons!7167 (h!8023 (_ BitVec 64)) (t!12554 List!7171)) )
))
(declare-fun arrayNoDuplicates!0 (array!25593 (_ BitVec 32) List!7171) Bool)

(assert (=> b!420467 (= res!245332 (arrayNoDuplicates!0 lt!192837 #b00000000000000000000000000000000 Nil!7168))))

(declare-fun b!420468 () Bool)

(declare-fun res!245326 () Bool)

(declare-fun e!250395 () Bool)

(assert (=> b!420468 (=> (not res!245326) (not e!250395))))

(assert (=> b!420468 (= res!245326 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12599 _keys!709))))))

(declare-fun b!420469 () Bool)

(declare-fun res!245327 () Bool)

(assert (=> b!420469 (=> (not res!245327) (not e!250395))))

(assert (=> b!420469 (= res!245327 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7168))))

(declare-fun b!420470 () Bool)

(declare-fun e!250397 () Bool)

(assert (=> b!420470 (= e!250397 (and e!250392 mapRes!17940))))

(declare-fun condMapEmpty!17940 () Bool)

(declare-fun mapDefault!17940 () ValueCell!5096)

(assert (=> b!420470 (= condMapEmpty!17940 (= (arr!12245 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5096)) mapDefault!17940)))))

(declare-fun bm!29331 () Bool)

(assert (=> bm!29331 (= call!29334 (getCurrentListMapNoExtraKeys!1264 (ite c!55233 lt!192837 _keys!709) (ite c!55233 lt!192845 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420471 () Bool)

(assert (=> b!420471 (= e!250394 true)))

(declare-fun lt!192841 () tuple2!7174)

(declare-fun lt!192840 () V!15611)

(declare-fun lt!192844 () ListLongMap!6077)

(declare-fun +!1277 (ListLongMap!6077 tuple2!7174) ListLongMap!6077)

(assert (=> b!420471 (= (+!1277 lt!192844 lt!192841) (+!1277 (+!1277 lt!192844 (tuple2!7175 k0!794 lt!192840)) lt!192841))))

(declare-fun lt!192836 () V!15611)

(assert (=> b!420471 (= lt!192841 (tuple2!7175 k0!794 lt!192836))))

(declare-fun lt!192842 () Unit!12400)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!61 (ListLongMap!6077 (_ BitVec 64) V!15611 V!15611) Unit!12400)

(assert (=> b!420471 (= lt!192842 (addSameAsAddTwiceSameKeyDiffValues!61 lt!192844 k0!794 lt!192840 lt!192836))))

(declare-fun lt!192838 () V!15611)

(declare-fun get!6078 (ValueCell!5096 V!15611) V!15611)

(assert (=> b!420471 (= lt!192840 (get!6078 (select (arr!12245 _values!549) from!863) lt!192838))))

(assert (=> b!420471 (= lt!192843 (+!1277 lt!192844 (tuple2!7175 (select (arr!12246 lt!192837) from!863) lt!192836)))))

(assert (=> b!420471 (= lt!192836 (get!6078 (select (store (arr!12245 _values!549) i!563 (ValueCellFull!5096 v!412)) from!863) lt!192838))))

(declare-fun dynLambda!718 (Int (_ BitVec 64)) V!15611)

(assert (=> b!420471 (= lt!192838 (dynLambda!718 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420471 (= lt!192844 (getCurrentListMapNoExtraKeys!1264 lt!192837 lt!192845 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420472 () Bool)

(assert (=> b!420472 (= e!250391 (= call!29334 (+!1277 call!29335 (tuple2!7175 k0!794 v!412))))))

(declare-fun b!420473 () Bool)

(declare-fun res!245330 () Bool)

(assert (=> b!420473 (=> (not res!245330) (not e!250395))))

(assert (=> b!420473 (= res!245330 (validKeyInArray!0 k0!794))))

(declare-fun b!420474 () Bool)

(declare-fun res!245329 () Bool)

(assert (=> b!420474 (=> (not res!245329) (not e!250395))))

(assert (=> b!420474 (= res!245329 (or (= (select (arr!12246 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12246 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420475 () Bool)

(declare-fun res!245331 () Bool)

(assert (=> b!420475 (=> (not res!245331) (not e!250395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25593 (_ BitVec 32)) Bool)

(assert (=> b!420475 (= res!245331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420476 () Bool)

(declare-fun res!245328 () Bool)

(assert (=> b!420476 (=> (not res!245328) (not e!250395))))

(declare-fun arrayContainsKey!0 (array!25593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420476 (= res!245328 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!420477 () Bool)

(assert (=> b!420477 (= e!250390 tp_is_empty!10879)))

(declare-fun b!420478 () Bool)

(declare-fun res!245325 () Bool)

(assert (=> b!420478 (=> (not res!245325) (not e!250395))))

(assert (=> b!420478 (= res!245325 (and (= (size!12598 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12599 _keys!709) (size!12598 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17940 () Bool)

(assert (=> mapIsEmpty!17940 mapRes!17940))

(declare-fun b!420479 () Bool)

(declare-fun res!245321 () Bool)

(assert (=> b!420479 (=> (not res!245321) (not e!250396))))

(assert (=> b!420479 (= res!245321 (bvsle from!863 i!563))))

(declare-fun b!420480 () Bool)

(declare-fun res!245322 () Bool)

(assert (=> b!420480 (=> (not res!245322) (not e!250395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420480 (= res!245322 (validMask!0 mask!1025))))

(declare-fun b!420481 () Bool)

(assert (=> b!420481 (= e!250395 e!250396)))

(declare-fun res!245334 () Bool)

(assert (=> b!420481 (=> (not res!245334) (not e!250396))))

(assert (=> b!420481 (= res!245334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192837 mask!1025))))

(assert (=> b!420481 (= lt!192837 (array!25594 (store (arr!12246 _keys!709) i!563 k0!794) (size!12599 _keys!709)))))

(declare-fun bm!29332 () Bool)

(assert (=> bm!29332 (= call!29335 (getCurrentListMapNoExtraKeys!1264 (ite c!55233 _keys!709 lt!192837) (ite c!55233 _values!549 lt!192845) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!245333 () Bool)

(assert (=> start!39446 (=> (not res!245333) (not e!250395))))

(assert (=> start!39446 (= res!245333 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12599 _keys!709))))))

(assert (=> start!39446 e!250395))

(assert (=> start!39446 tp_is_empty!10879))

(assert (=> start!39446 tp!34710))

(assert (=> start!39446 true))

(declare-fun array_inv!8966 (array!25591) Bool)

(assert (=> start!39446 (and (array_inv!8966 _values!549) e!250397)))

(declare-fun array_inv!8967 (array!25593) Bool)

(assert (=> start!39446 (array_inv!8967 _keys!709)))

(assert (= (and start!39446 res!245333) b!420480))

(assert (= (and b!420480 res!245322) b!420478))

(assert (= (and b!420478 res!245325) b!420475))

(assert (= (and b!420475 res!245331) b!420469))

(assert (= (and b!420469 res!245327) b!420468))

(assert (= (and b!420468 res!245326) b!420473))

(assert (= (and b!420473 res!245330) b!420474))

(assert (= (and b!420474 res!245329) b!420476))

(assert (= (and b!420476 res!245328) b!420481))

(assert (= (and b!420481 res!245334) b!420467))

(assert (= (and b!420467 res!245332) b!420479))

(assert (= (and b!420479 res!245321) b!420465))

(assert (= (and b!420465 res!245323) b!420463))

(assert (= (and b!420463 c!55233) b!420472))

(assert (= (and b!420463 (not c!55233)) b!420464))

(assert (= (or b!420472 b!420464) bm!29331))

(assert (= (or b!420472 b!420464) bm!29332))

(assert (= (and b!420463 (not res!245324)) b!420471))

(assert (= (and b!420470 condMapEmpty!17940) mapIsEmpty!17940))

(assert (= (and b!420470 (not condMapEmpty!17940)) mapNonEmpty!17940))

(get-info :version)

(assert (= (and mapNonEmpty!17940 ((_ is ValueCellFull!5096) mapValue!17940)) b!420477))

(assert (= (and b!420470 ((_ is ValueCellFull!5096) mapDefault!17940)) b!420466))

(assert (= start!39446 b!420470))

(declare-fun b_lambda!9013 () Bool)

(assert (=> (not b_lambda!9013) (not b!420471)))

(declare-fun t!12552 () Bool)

(declare-fun tb!3341 () Bool)

(assert (=> (and start!39446 (= defaultEntry!557 defaultEntry!557) t!12552) tb!3341))

(declare-fun result!6217 () Bool)

(assert (=> tb!3341 (= result!6217 tp_is_empty!10879)))

(assert (=> b!420471 t!12552))

(declare-fun b_and!17305 () Bool)

(assert (= b_and!17303 (and (=> t!12552 result!6217) b_and!17305)))

(declare-fun m!409659 () Bool)

(assert (=> b!420469 m!409659))

(declare-fun m!409661 () Bool)

(assert (=> bm!29332 m!409661))

(declare-fun m!409663 () Bool)

(assert (=> b!420463 m!409663))

(assert (=> b!420463 m!409663))

(declare-fun m!409665 () Bool)

(assert (=> b!420463 m!409665))

(declare-fun m!409667 () Bool)

(assert (=> b!420463 m!409667))

(declare-fun m!409669 () Bool)

(assert (=> b!420465 m!409669))

(declare-fun m!409671 () Bool)

(assert (=> b!420465 m!409671))

(declare-fun m!409673 () Bool)

(assert (=> b!420465 m!409673))

(declare-fun m!409675 () Bool)

(assert (=> b!420476 m!409675))

(declare-fun m!409677 () Bool)

(assert (=> b!420474 m!409677))

(declare-fun m!409679 () Bool)

(assert (=> b!420481 m!409679))

(declare-fun m!409681 () Bool)

(assert (=> b!420481 m!409681))

(declare-fun m!409683 () Bool)

(assert (=> b!420472 m!409683))

(declare-fun m!409685 () Bool)

(assert (=> b!420480 m!409685))

(declare-fun m!409687 () Bool)

(assert (=> start!39446 m!409687))

(declare-fun m!409689 () Bool)

(assert (=> start!39446 m!409689))

(declare-fun m!409691 () Bool)

(assert (=> b!420475 m!409691))

(declare-fun m!409693 () Bool)

(assert (=> b!420473 m!409693))

(declare-fun m!409695 () Bool)

(assert (=> b!420471 m!409695))

(declare-fun m!409697 () Bool)

(assert (=> b!420471 m!409697))

(declare-fun m!409699 () Bool)

(assert (=> b!420471 m!409699))

(declare-fun m!409701 () Bool)

(assert (=> b!420471 m!409701))

(declare-fun m!409703 () Bool)

(assert (=> b!420471 m!409703))

(assert (=> b!420471 m!409699))

(assert (=> b!420471 m!409695))

(declare-fun m!409705 () Bool)

(assert (=> b!420471 m!409705))

(declare-fun m!409707 () Bool)

(assert (=> b!420471 m!409707))

(assert (=> b!420471 m!409705))

(declare-fun m!409709 () Bool)

(assert (=> b!420471 m!409709))

(declare-fun m!409711 () Bool)

(assert (=> b!420471 m!409711))

(declare-fun m!409713 () Bool)

(assert (=> b!420471 m!409713))

(declare-fun m!409715 () Bool)

(assert (=> b!420471 m!409715))

(declare-fun m!409717 () Bool)

(assert (=> b!420471 m!409717))

(assert (=> b!420471 m!409671))

(declare-fun m!409719 () Bool)

(assert (=> mapNonEmpty!17940 m!409719))

(declare-fun m!409721 () Bool)

(assert (=> b!420467 m!409721))

(declare-fun m!409723 () Bool)

(assert (=> bm!29331 m!409723))

(check-sat (not start!39446) (not b!420467) (not b!420463) (not b!420481) (not bm!29332) (not bm!29331) (not b!420469) (not b!420471) (not b!420465) (not mapNonEmpty!17940) (not b!420472) (not b!420480) (not b_next!9727) (not b!420475) (not b!420476) tp_is_empty!10879 (not b!420473) b_and!17305 (not b_lambda!9013))
(check-sat b_and!17305 (not b_next!9727))
