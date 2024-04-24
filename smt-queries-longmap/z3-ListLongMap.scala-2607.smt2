; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39446 () Bool)

(assert start!39446)

(declare-fun b_free!9727 () Bool)

(declare-fun b_next!9727 () Bool)

(assert (=> start!39446 (= b_free!9727 (not b_next!9727))))

(declare-fun tp!34709 () Bool)

(declare-fun b_and!17343 () Bool)

(assert (=> start!39446 (= tp!34709 b_and!17343)))

(declare-fun b!420685 () Bool)

(declare-fun e!250536 () Bool)

(declare-fun e!250532 () Bool)

(declare-fun mapRes!17940 () Bool)

(assert (=> b!420685 (= e!250536 (and e!250532 mapRes!17940))))

(declare-fun condMapEmpty!17940 () Bool)

(declare-datatypes ((V!15611 0))(
  ( (V!15612 (val!5484 Int)) )
))
(declare-datatypes ((ValueCell!5096 0))(
  ( (ValueCellFull!5096 (v!7732 V!15611)) (EmptyCell!5096) )
))
(declare-datatypes ((array!25614 0))(
  ( (array!25615 (arr!12256 (Array (_ BitVec 32) ValueCell!5096)) (size!12608 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25614)

(declare-fun mapDefault!17940 () ValueCell!5096)

(assert (=> b!420685 (= condMapEmpty!17940 (= (arr!12256 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5096)) mapDefault!17940)))))

(declare-fun b!420686 () Bool)

(declare-fun res!245453 () Bool)

(declare-fun e!250540 () Bool)

(assert (=> b!420686 (=> (not res!245453) (not e!250540))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420686 (= res!245453 (bvsle from!863 i!563))))

(declare-fun b!420687 () Bool)

(declare-fun res!245458 () Bool)

(declare-fun e!250533 () Bool)

(assert (=> b!420687 (=> (not res!245458) (not e!250533))))

(declare-datatypes ((array!25616 0))(
  ( (array!25617 (arr!12257 (Array (_ BitVec 32) (_ BitVec 64))) (size!12609 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25616)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25616 (_ BitVec 32)) Bool)

(assert (=> b!420687 (= res!245458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420688 () Bool)

(declare-fun res!245460 () Bool)

(assert (=> b!420688 (=> (not res!245460) (not e!250533))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420688 (= res!245460 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!420689 () Bool)

(declare-fun res!245457 () Bool)

(assert (=> b!420689 (=> (not res!245457) (not e!250533))))

(assert (=> b!420689 (= res!245457 (or (= (select (arr!12257 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12257 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420690 () Bool)

(declare-fun e!250538 () Bool)

(assert (=> b!420690 (= e!250540 e!250538)))

(declare-fun res!245451 () Bool)

(assert (=> b!420690 (=> (not res!245451) (not e!250538))))

(assert (=> b!420690 (= res!245451 (= from!863 i!563))))

(declare-fun minValue!515 () V!15611)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15611)

(declare-fun lt!193095 () array!25614)

(declare-fun lt!193090 () array!25616)

(declare-datatypes ((tuple2!7070 0))(
  ( (tuple2!7071 (_1!3546 (_ BitVec 64)) (_2!3546 V!15611)) )
))
(declare-datatypes ((List!7076 0))(
  ( (Nil!7073) (Cons!7072 (h!7928 tuple2!7070) (t!12460 List!7076)) )
))
(declare-datatypes ((ListLongMap!5985 0))(
  ( (ListLongMap!5986 (toList!3008 List!7076)) )
))
(declare-fun lt!193092 () ListLongMap!5985)

(declare-fun getCurrentListMapNoExtraKeys!1254 (array!25616 array!25614 (_ BitVec 32) (_ BitVec 32) V!15611 V!15611 (_ BitVec 32) Int) ListLongMap!5985)

(assert (=> b!420690 (= lt!193092 (getCurrentListMapNoExtraKeys!1254 lt!193090 lt!193095 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15611)

(assert (=> b!420690 (= lt!193095 (array!25615 (store (arr!12256 _values!549) i!563 (ValueCellFull!5096 v!412)) (size!12608 _values!549)))))

(declare-fun lt!193089 () ListLongMap!5985)

(assert (=> b!420690 (= lt!193089 (getCurrentListMapNoExtraKeys!1254 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420691 () Bool)

(declare-fun tp_is_empty!10879 () Bool)

(assert (=> b!420691 (= e!250532 tp_is_empty!10879)))

(declare-fun b!420692 () Bool)

(declare-fun res!245450 () Bool)

(assert (=> b!420692 (=> (not res!245450) (not e!250533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420692 (= res!245450 (validKeyInArray!0 k0!794))))

(declare-fun b!420693 () Bool)

(declare-fun res!245449 () Bool)

(assert (=> b!420693 (=> (not res!245449) (not e!250533))))

(assert (=> b!420693 (= res!245449 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12609 _keys!709))))))

(declare-fun call!29346 () ListLongMap!5985)

(declare-fun b!420694 () Bool)

(declare-fun call!29347 () ListLongMap!5985)

(declare-fun e!250539 () Bool)

(declare-fun +!1271 (ListLongMap!5985 tuple2!7070) ListLongMap!5985)

(assert (=> b!420694 (= e!250539 (= call!29347 (+!1271 call!29346 (tuple2!7071 k0!794 v!412))))))

(declare-fun b!420695 () Bool)

(declare-fun res!245448 () Bool)

(assert (=> b!420695 (=> (not res!245448) (not e!250533))))

(assert (=> b!420695 (= res!245448 (and (= (size!12608 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12609 _keys!709) (size!12608 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420696 () Bool)

(declare-fun e!250537 () Bool)

(assert (=> b!420696 (= e!250538 (not e!250537))))

(declare-fun res!245455 () Bool)

(assert (=> b!420696 (=> res!245455 e!250537)))

(assert (=> b!420696 (= res!245455 (validKeyInArray!0 (select (arr!12257 _keys!709) from!863)))))

(assert (=> b!420696 e!250539))

(declare-fun c!55281 () Bool)

(assert (=> b!420696 (= c!55281 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12415 0))(
  ( (Unit!12416) )
))
(declare-fun lt!193097 () Unit!12415)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!459 (array!25616 array!25614 (_ BitVec 32) (_ BitVec 32) V!15611 V!15611 (_ BitVec 32) (_ BitVec 64) V!15611 (_ BitVec 32) Int) Unit!12415)

(assert (=> b!420696 (= lt!193097 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!459 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420697 () Bool)

(assert (=> b!420697 (= e!250533 e!250540)))

(declare-fun res!245447 () Bool)

(assert (=> b!420697 (=> (not res!245447) (not e!250540))))

(assert (=> b!420697 (= res!245447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193090 mask!1025))))

(assert (=> b!420697 (= lt!193090 (array!25617 (store (arr!12257 _keys!709) i!563 k0!794) (size!12609 _keys!709)))))

(declare-fun mapIsEmpty!17940 () Bool)

(assert (=> mapIsEmpty!17940 mapRes!17940))

(declare-fun bm!29343 () Bool)

(assert (=> bm!29343 (= call!29346 (getCurrentListMapNoExtraKeys!1254 (ite c!55281 _keys!709 lt!193090) (ite c!55281 _values!549 lt!193095) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420698 () Bool)

(declare-fun res!245459 () Bool)

(assert (=> b!420698 (=> (not res!245459) (not e!250540))))

(declare-datatypes ((List!7077 0))(
  ( (Nil!7074) (Cons!7073 (h!7929 (_ BitVec 64)) (t!12461 List!7077)) )
))
(declare-fun arrayNoDuplicates!0 (array!25616 (_ BitVec 32) List!7077) Bool)

(assert (=> b!420698 (= res!245459 (arrayNoDuplicates!0 lt!193090 #b00000000000000000000000000000000 Nil!7074))))

(declare-fun b!420699 () Bool)

(declare-fun res!245452 () Bool)

(assert (=> b!420699 (=> (not res!245452) (not e!250533))))

(assert (=> b!420699 (= res!245452 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7074))))

(declare-fun b!420700 () Bool)

(declare-fun e!250534 () Bool)

(assert (=> b!420700 (= e!250534 tp_is_empty!10879)))

(declare-fun mapNonEmpty!17940 () Bool)

(declare-fun tp!34710 () Bool)

(assert (=> mapNonEmpty!17940 (= mapRes!17940 (and tp!34710 e!250534))))

(declare-fun mapKey!17940 () (_ BitVec 32))

(declare-fun mapRest!17940 () (Array (_ BitVec 32) ValueCell!5096))

(declare-fun mapValue!17940 () ValueCell!5096)

(assert (=> mapNonEmpty!17940 (= (arr!12256 _values!549) (store mapRest!17940 mapKey!17940 mapValue!17940))))

(declare-fun b!420701 () Bool)

(assert (=> b!420701 (= e!250537 true)))

(declare-fun lt!193098 () V!15611)

(declare-fun lt!193096 () tuple2!7070)

(declare-fun lt!193093 () ListLongMap!5985)

(assert (=> b!420701 (= (+!1271 lt!193093 lt!193096) (+!1271 (+!1271 lt!193093 (tuple2!7071 k0!794 lt!193098)) lt!193096))))

(declare-fun lt!193088 () V!15611)

(assert (=> b!420701 (= lt!193096 (tuple2!7071 k0!794 lt!193088))))

(declare-fun lt!193094 () Unit!12415)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!61 (ListLongMap!5985 (_ BitVec 64) V!15611 V!15611) Unit!12415)

(assert (=> b!420701 (= lt!193094 (addSameAsAddTwiceSameKeyDiffValues!61 lt!193093 k0!794 lt!193098 lt!193088))))

(declare-fun lt!193091 () V!15611)

(declare-fun get!6091 (ValueCell!5096 V!15611) V!15611)

(assert (=> b!420701 (= lt!193098 (get!6091 (select (arr!12256 _values!549) from!863) lt!193091))))

(assert (=> b!420701 (= lt!193092 (+!1271 lt!193093 (tuple2!7071 (select (arr!12257 lt!193090) from!863) lt!193088)))))

(assert (=> b!420701 (= lt!193088 (get!6091 (select (store (arr!12256 _values!549) i!563 (ValueCellFull!5096 v!412)) from!863) lt!193091))))

(declare-fun dynLambda!728 (Int (_ BitVec 64)) V!15611)

(assert (=> b!420701 (= lt!193091 (dynLambda!728 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420701 (= lt!193093 (getCurrentListMapNoExtraKeys!1254 lt!193090 lt!193095 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420702 () Bool)

(assert (=> b!420702 (= e!250539 (= call!29346 call!29347))))

(declare-fun res!245456 () Bool)

(assert (=> start!39446 (=> (not res!245456) (not e!250533))))

(assert (=> start!39446 (= res!245456 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12609 _keys!709))))))

(assert (=> start!39446 e!250533))

(assert (=> start!39446 tp_is_empty!10879))

(assert (=> start!39446 tp!34709))

(assert (=> start!39446 true))

(declare-fun array_inv!9010 (array!25614) Bool)

(assert (=> start!39446 (and (array_inv!9010 _values!549) e!250536)))

(declare-fun array_inv!9011 (array!25616) Bool)

(assert (=> start!39446 (array_inv!9011 _keys!709)))

(declare-fun b!420703 () Bool)

(declare-fun res!245454 () Bool)

(assert (=> b!420703 (=> (not res!245454) (not e!250533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420703 (= res!245454 (validMask!0 mask!1025))))

(declare-fun bm!29344 () Bool)

(assert (=> bm!29344 (= call!29347 (getCurrentListMapNoExtraKeys!1254 (ite c!55281 lt!193090 _keys!709) (ite c!55281 lt!193095 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39446 res!245456) b!420703))

(assert (= (and b!420703 res!245454) b!420695))

(assert (= (and b!420695 res!245448) b!420687))

(assert (= (and b!420687 res!245458) b!420699))

(assert (= (and b!420699 res!245452) b!420693))

(assert (= (and b!420693 res!245449) b!420692))

(assert (= (and b!420692 res!245450) b!420689))

(assert (= (and b!420689 res!245457) b!420688))

(assert (= (and b!420688 res!245460) b!420697))

(assert (= (and b!420697 res!245447) b!420698))

(assert (= (and b!420698 res!245459) b!420686))

(assert (= (and b!420686 res!245453) b!420690))

(assert (= (and b!420690 res!245451) b!420696))

(assert (= (and b!420696 c!55281) b!420694))

(assert (= (and b!420696 (not c!55281)) b!420702))

(assert (= (or b!420694 b!420702) bm!29344))

(assert (= (or b!420694 b!420702) bm!29343))

(assert (= (and b!420696 (not res!245455)) b!420701))

(assert (= (and b!420685 condMapEmpty!17940) mapIsEmpty!17940))

(assert (= (and b!420685 (not condMapEmpty!17940)) mapNonEmpty!17940))

(get-info :version)

(assert (= (and mapNonEmpty!17940 ((_ is ValueCellFull!5096) mapValue!17940)) b!420700))

(assert (= (and b!420685 ((_ is ValueCellFull!5096) mapDefault!17940)) b!420691))

(assert (= start!39446 b!420685))

(declare-fun b_lambda!9053 () Bool)

(assert (=> (not b_lambda!9053) (not b!420701)))

(declare-fun t!12459 () Bool)

(declare-fun tb!3341 () Bool)

(assert (=> (and start!39446 (= defaultEntry!557 defaultEntry!557) t!12459) tb!3341))

(declare-fun result!6217 () Bool)

(assert (=> tb!3341 (= result!6217 tp_is_empty!10879)))

(assert (=> b!420701 t!12459))

(declare-fun b_and!17345 () Bool)

(assert (= b_and!17343 (and (=> t!12459 result!6217) b_and!17345)))

(declare-fun m!410611 () Bool)

(assert (=> b!420699 m!410611))

(declare-fun m!410613 () Bool)

(assert (=> b!420689 m!410613))

(declare-fun m!410615 () Bool)

(assert (=> b!420690 m!410615))

(declare-fun m!410617 () Bool)

(assert (=> b!420690 m!410617))

(declare-fun m!410619 () Bool)

(assert (=> b!420690 m!410619))

(declare-fun m!410621 () Bool)

(assert (=> b!420688 m!410621))

(declare-fun m!410623 () Bool)

(assert (=> b!420698 m!410623))

(declare-fun m!410625 () Bool)

(assert (=> b!420697 m!410625))

(declare-fun m!410627 () Bool)

(assert (=> b!420697 m!410627))

(declare-fun m!410629 () Bool)

(assert (=> b!420696 m!410629))

(assert (=> b!420696 m!410629))

(declare-fun m!410631 () Bool)

(assert (=> b!420696 m!410631))

(declare-fun m!410633 () Bool)

(assert (=> b!420696 m!410633))

(declare-fun m!410635 () Bool)

(assert (=> bm!29343 m!410635))

(declare-fun m!410637 () Bool)

(assert (=> b!420692 m!410637))

(declare-fun m!410639 () Bool)

(assert (=> b!420703 m!410639))

(declare-fun m!410641 () Bool)

(assert (=> bm!29344 m!410641))

(declare-fun m!410643 () Bool)

(assert (=> start!39446 m!410643))

(declare-fun m!410645 () Bool)

(assert (=> start!39446 m!410645))

(declare-fun m!410647 () Bool)

(assert (=> b!420701 m!410647))

(declare-fun m!410649 () Bool)

(assert (=> b!420701 m!410649))

(declare-fun m!410651 () Bool)

(assert (=> b!420701 m!410651))

(declare-fun m!410653 () Bool)

(assert (=> b!420701 m!410653))

(assert (=> b!420701 m!410617))

(declare-fun m!410655 () Bool)

(assert (=> b!420701 m!410655))

(declare-fun m!410657 () Bool)

(assert (=> b!420701 m!410657))

(declare-fun m!410659 () Bool)

(assert (=> b!420701 m!410659))

(assert (=> b!420701 m!410651))

(declare-fun m!410661 () Bool)

(assert (=> b!420701 m!410661))

(assert (=> b!420701 m!410659))

(declare-fun m!410663 () Bool)

(assert (=> b!420701 m!410663))

(assert (=> b!420701 m!410655))

(declare-fun m!410665 () Bool)

(assert (=> b!420701 m!410665))

(declare-fun m!410667 () Bool)

(assert (=> b!420701 m!410667))

(declare-fun m!410669 () Bool)

(assert (=> b!420701 m!410669))

(declare-fun m!410671 () Bool)

(assert (=> b!420694 m!410671))

(declare-fun m!410673 () Bool)

(assert (=> b!420687 m!410673))

(declare-fun m!410675 () Bool)

(assert (=> mapNonEmpty!17940 m!410675))

(check-sat (not b_lambda!9053) b_and!17345 (not b!420688) (not b!420699) (not b!420690) (not b!420697) (not bm!29344) (not bm!29343) (not mapNonEmpty!17940) (not b!420703) (not b!420692) (not b!420701) (not b_next!9727) (not b!420694) tp_is_empty!10879 (not b!420687) (not start!39446) (not b!420698) (not b!420696))
(check-sat b_and!17345 (not b_next!9727))
