; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39476 () Bool)

(assert start!39476)

(declare-fun b_free!9757 () Bool)

(declare-fun b_next!9757 () Bool)

(assert (=> start!39476 (= b_free!9757 (not b_next!9757))))

(declare-fun tp!34800 () Bool)

(declare-fun b_and!17403 () Bool)

(assert (=> start!39476 (= tp!34800 b_and!17403)))

(declare-fun b!421570 () Bool)

(declare-fun e!250938 () Bool)

(assert (=> b!421570 (= e!250938 true)))

(declare-datatypes ((V!15651 0))(
  ( (V!15652 (val!5499 Int)) )
))
(declare-datatypes ((tuple2!7098 0))(
  ( (tuple2!7099 (_1!3560 (_ BitVec 64)) (_2!3560 V!15651)) )
))
(declare-datatypes ((List!7098 0))(
  ( (Nil!7095) (Cons!7094 (h!7950 tuple2!7098) (t!12512 List!7098)) )
))
(declare-datatypes ((ListLongMap!6013 0))(
  ( (ListLongMap!6014 (toList!3022 List!7098)) )
))
(declare-fun lt!193591 () ListLongMap!6013)

(declare-fun lt!193592 () tuple2!7098)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!193590 () V!15651)

(declare-fun +!1282 (ListLongMap!6013 tuple2!7098) ListLongMap!6013)

(assert (=> b!421570 (= (+!1282 lt!193591 lt!193592) (+!1282 (+!1282 lt!193591 (tuple2!7099 k0!794 lt!193590)) lt!193592))))

(declare-fun lt!193585 () V!15651)

(assert (=> b!421570 (= lt!193592 (tuple2!7099 k0!794 lt!193585))))

(declare-datatypes ((Unit!12439 0))(
  ( (Unit!12440) )
))
(declare-fun lt!193588 () Unit!12439)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!72 (ListLongMap!6013 (_ BitVec 64) V!15651 V!15651) Unit!12439)

(assert (=> b!421570 (= lt!193588 (addSameAsAddTwiceSameKeyDiffValues!72 lt!193591 k0!794 lt!193590 lt!193585))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5111 0))(
  ( (ValueCellFull!5111 (v!7747 V!15651)) (EmptyCell!5111) )
))
(declare-datatypes ((array!25672 0))(
  ( (array!25673 (arr!12285 (Array (_ BitVec 32) ValueCell!5111)) (size!12637 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25672)

(declare-fun lt!193587 () V!15651)

(declare-fun get!6112 (ValueCell!5111 V!15651) V!15651)

(assert (=> b!421570 (= lt!193590 (get!6112 (select (arr!12285 _values!549) from!863) lt!193587))))

(declare-fun lt!193586 () ListLongMap!6013)

(declare-datatypes ((array!25674 0))(
  ( (array!25675 (arr!12286 (Array (_ BitVec 32) (_ BitVec 64))) (size!12638 (_ BitVec 32))) )
))
(declare-fun lt!193584 () array!25674)

(assert (=> b!421570 (= lt!193586 (+!1282 lt!193591 (tuple2!7099 (select (arr!12286 lt!193584) from!863) lt!193585)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15651)

(assert (=> b!421570 (= lt!193585 (get!6112 (select (store (arr!12285 _values!549) i!563 (ValueCellFull!5111 v!412)) from!863) lt!193587))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!739 (Int (_ BitVec 64)) V!15651)

(assert (=> b!421570 (= lt!193587 (dynLambda!739 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15651)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15651)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!193589 () array!25672)

(declare-fun getCurrentListMapNoExtraKeys!1268 (array!25674 array!25672 (_ BitVec 32) (_ BitVec 32) V!15651 V!15651 (_ BitVec 32) Int) ListLongMap!6013)

(assert (=> b!421570 (= lt!193591 (getCurrentListMapNoExtraKeys!1268 lt!193584 lt!193589 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!246086 () Bool)

(declare-fun e!250945 () Bool)

(assert (=> start!39476 (=> (not res!246086) (not e!250945))))

(declare-fun _keys!709 () array!25674)

(assert (=> start!39476 (= res!246086 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12638 _keys!709))))))

(assert (=> start!39476 e!250945))

(declare-fun tp_is_empty!10909 () Bool)

(assert (=> start!39476 tp_is_empty!10909))

(assert (=> start!39476 tp!34800))

(assert (=> start!39476 true))

(declare-fun e!250943 () Bool)

(declare-fun array_inv!9028 (array!25672) Bool)

(assert (=> start!39476 (and (array_inv!9028 _values!549) e!250943)))

(declare-fun array_inv!9029 (array!25674) Bool)

(assert (=> start!39476 (array_inv!9029 _keys!709)))

(declare-fun call!29437 () ListLongMap!6013)

(declare-fun call!29436 () ListLongMap!6013)

(declare-fun b!421571 () Bool)

(declare-fun e!250940 () Bool)

(assert (=> b!421571 (= e!250940 (= call!29437 (+!1282 call!29436 (tuple2!7099 k0!794 v!412))))))

(declare-fun b!421572 () Bool)

(declare-fun res!246088 () Bool)

(assert (=> b!421572 (=> (not res!246088) (not e!250945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421572 (= res!246088 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17985 () Bool)

(declare-fun mapRes!17985 () Bool)

(assert (=> mapIsEmpty!17985 mapRes!17985))

(declare-fun c!55326 () Bool)

(declare-fun bm!29433 () Bool)

(assert (=> bm!29433 (= call!29437 (getCurrentListMapNoExtraKeys!1268 (ite c!55326 lt!193584 _keys!709) (ite c!55326 lt!193589 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421573 () Bool)

(declare-fun res!246089 () Bool)

(assert (=> b!421573 (=> (not res!246089) (not e!250945))))

(declare-datatypes ((List!7099 0))(
  ( (Nil!7096) (Cons!7095 (h!7951 (_ BitVec 64)) (t!12513 List!7099)) )
))
(declare-fun arrayNoDuplicates!0 (array!25674 (_ BitVec 32) List!7099) Bool)

(assert (=> b!421573 (= res!246089 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7096))))

(declare-fun b!421574 () Bool)

(declare-fun res!246090 () Bool)

(declare-fun e!250942 () Bool)

(assert (=> b!421574 (=> (not res!246090) (not e!250942))))

(assert (=> b!421574 (= res!246090 (arrayNoDuplicates!0 lt!193584 #b00000000000000000000000000000000 Nil!7096))))

(declare-fun mapNonEmpty!17985 () Bool)

(declare-fun tp!34799 () Bool)

(declare-fun e!250944 () Bool)

(assert (=> mapNonEmpty!17985 (= mapRes!17985 (and tp!34799 e!250944))))

(declare-fun mapRest!17985 () (Array (_ BitVec 32) ValueCell!5111))

(declare-fun mapValue!17985 () ValueCell!5111)

(declare-fun mapKey!17985 () (_ BitVec 32))

(assert (=> mapNonEmpty!17985 (= (arr!12285 _values!549) (store mapRest!17985 mapKey!17985 mapValue!17985))))

(declare-fun b!421575 () Bool)

(assert (=> b!421575 (= e!250945 e!250942)))

(declare-fun res!246079 () Bool)

(assert (=> b!421575 (=> (not res!246079) (not e!250942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25674 (_ BitVec 32)) Bool)

(assert (=> b!421575 (= res!246079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193584 mask!1025))))

(assert (=> b!421575 (= lt!193584 (array!25675 (store (arr!12286 _keys!709) i!563 k0!794) (size!12638 _keys!709)))))

(declare-fun b!421576 () Bool)

(declare-fun res!246077 () Bool)

(assert (=> b!421576 (=> (not res!246077) (not e!250945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421576 (= res!246077 (validMask!0 mask!1025))))

(declare-fun b!421577 () Bool)

(declare-fun e!250937 () Bool)

(assert (=> b!421577 (= e!250937 tp_is_empty!10909)))

(declare-fun b!421578 () Bool)

(declare-fun res!246083 () Bool)

(assert (=> b!421578 (=> (not res!246083) (not e!250942))))

(assert (=> b!421578 (= res!246083 (bvsle from!863 i!563))))

(declare-fun b!421579 () Bool)

(assert (=> b!421579 (= e!250940 (= call!29436 call!29437))))

(declare-fun b!421580 () Bool)

(declare-fun e!250939 () Bool)

(assert (=> b!421580 (= e!250939 (not e!250938))))

(declare-fun res!246085 () Bool)

(assert (=> b!421580 (=> res!246085 e!250938)))

(assert (=> b!421580 (= res!246085 (validKeyInArray!0 (select (arr!12286 _keys!709) from!863)))))

(assert (=> b!421580 e!250940))

(assert (=> b!421580 (= c!55326 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193593 () Unit!12439)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!468 (array!25674 array!25672 (_ BitVec 32) (_ BitVec 32) V!15651 V!15651 (_ BitVec 32) (_ BitVec 64) V!15651 (_ BitVec 32) Int) Unit!12439)

(assert (=> b!421580 (= lt!193593 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!468 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421581 () Bool)

(declare-fun res!246087 () Bool)

(assert (=> b!421581 (=> (not res!246087) (not e!250945))))

(assert (=> b!421581 (= res!246087 (and (= (size!12637 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12638 _keys!709) (size!12637 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421582 () Bool)

(assert (=> b!421582 (= e!250944 tp_is_empty!10909)))

(declare-fun b!421583 () Bool)

(declare-fun res!246080 () Bool)

(assert (=> b!421583 (=> (not res!246080) (not e!250945))))

(assert (=> b!421583 (= res!246080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421584 () Bool)

(assert (=> b!421584 (= e!250942 e!250939)))

(declare-fun res!246081 () Bool)

(assert (=> b!421584 (=> (not res!246081) (not e!250939))))

(assert (=> b!421584 (= res!246081 (= from!863 i!563))))

(assert (=> b!421584 (= lt!193586 (getCurrentListMapNoExtraKeys!1268 lt!193584 lt!193589 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421584 (= lt!193589 (array!25673 (store (arr!12285 _values!549) i!563 (ValueCellFull!5111 v!412)) (size!12637 _values!549)))))

(declare-fun lt!193583 () ListLongMap!6013)

(assert (=> b!421584 (= lt!193583 (getCurrentListMapNoExtraKeys!1268 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421585 () Bool)

(declare-fun res!246078 () Bool)

(assert (=> b!421585 (=> (not res!246078) (not e!250945))))

(assert (=> b!421585 (= res!246078 (or (= (select (arr!12286 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12286 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421586 () Bool)

(assert (=> b!421586 (= e!250943 (and e!250937 mapRes!17985))))

(declare-fun condMapEmpty!17985 () Bool)

(declare-fun mapDefault!17985 () ValueCell!5111)

(assert (=> b!421586 (= condMapEmpty!17985 (= (arr!12285 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5111)) mapDefault!17985)))))

(declare-fun b!421587 () Bool)

(declare-fun res!246084 () Bool)

(assert (=> b!421587 (=> (not res!246084) (not e!250945))))

(declare-fun arrayContainsKey!0 (array!25674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421587 (= res!246084 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421588 () Bool)

(declare-fun res!246082 () Bool)

(assert (=> b!421588 (=> (not res!246082) (not e!250945))))

(assert (=> b!421588 (= res!246082 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12638 _keys!709))))))

(declare-fun bm!29434 () Bool)

(assert (=> bm!29434 (= call!29436 (getCurrentListMapNoExtraKeys!1268 (ite c!55326 _keys!709 lt!193584) (ite c!55326 _values!549 lt!193589) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39476 res!246086) b!421576))

(assert (= (and b!421576 res!246077) b!421581))

(assert (= (and b!421581 res!246087) b!421583))

(assert (= (and b!421583 res!246080) b!421573))

(assert (= (and b!421573 res!246089) b!421588))

(assert (= (and b!421588 res!246082) b!421572))

(assert (= (and b!421572 res!246088) b!421585))

(assert (= (and b!421585 res!246078) b!421587))

(assert (= (and b!421587 res!246084) b!421575))

(assert (= (and b!421575 res!246079) b!421574))

(assert (= (and b!421574 res!246090) b!421578))

(assert (= (and b!421578 res!246083) b!421584))

(assert (= (and b!421584 res!246081) b!421580))

(assert (= (and b!421580 c!55326) b!421571))

(assert (= (and b!421580 (not c!55326)) b!421579))

(assert (= (or b!421571 b!421579) bm!29433))

(assert (= (or b!421571 b!421579) bm!29434))

(assert (= (and b!421580 (not res!246085)) b!421570))

(assert (= (and b!421586 condMapEmpty!17985) mapIsEmpty!17985))

(assert (= (and b!421586 (not condMapEmpty!17985)) mapNonEmpty!17985))

(get-info :version)

(assert (= (and mapNonEmpty!17985 ((_ is ValueCellFull!5111) mapValue!17985)) b!421582))

(assert (= (and b!421586 ((_ is ValueCellFull!5111) mapDefault!17985)) b!421577))

(assert (= start!39476 b!421586))

(declare-fun b_lambda!9083 () Bool)

(assert (=> (not b_lambda!9083) (not b!421570)))

(declare-fun t!12511 () Bool)

(declare-fun tb!3371 () Bool)

(assert (=> (and start!39476 (= defaultEntry!557 defaultEntry!557) t!12511) tb!3371))

(declare-fun result!6277 () Bool)

(assert (=> tb!3371 (= result!6277 tp_is_empty!10909)))

(assert (=> b!421570 t!12511))

(declare-fun b_and!17405 () Bool)

(assert (= b_and!17403 (and (=> t!12511 result!6277) b_and!17405)))

(declare-fun m!411599 () Bool)

(assert (=> bm!29433 m!411599))

(declare-fun m!411601 () Bool)

(assert (=> b!421585 m!411601))

(declare-fun m!411603 () Bool)

(assert (=> b!421587 m!411603))

(declare-fun m!411605 () Bool)

(assert (=> b!421574 m!411605))

(declare-fun m!411607 () Bool)

(assert (=> b!421571 m!411607))

(declare-fun m!411609 () Bool)

(assert (=> b!421580 m!411609))

(assert (=> b!421580 m!411609))

(declare-fun m!411611 () Bool)

(assert (=> b!421580 m!411611))

(declare-fun m!411613 () Bool)

(assert (=> b!421580 m!411613))

(declare-fun m!411615 () Bool)

(assert (=> b!421573 m!411615))

(declare-fun m!411617 () Bool)

(assert (=> bm!29434 m!411617))

(declare-fun m!411619 () Bool)

(assert (=> b!421575 m!411619))

(declare-fun m!411621 () Bool)

(assert (=> b!421575 m!411621))

(declare-fun m!411623 () Bool)

(assert (=> b!421570 m!411623))

(declare-fun m!411625 () Bool)

(assert (=> b!421570 m!411625))

(declare-fun m!411627 () Bool)

(assert (=> b!421570 m!411627))

(declare-fun m!411629 () Bool)

(assert (=> b!421570 m!411629))

(declare-fun m!411631 () Bool)

(assert (=> b!421570 m!411631))

(declare-fun m!411633 () Bool)

(assert (=> b!421570 m!411633))

(declare-fun m!411635 () Bool)

(assert (=> b!421570 m!411635))

(declare-fun m!411637 () Bool)

(assert (=> b!421570 m!411637))

(assert (=> b!421570 m!411631))

(declare-fun m!411639 () Bool)

(assert (=> b!421570 m!411639))

(declare-fun m!411641 () Bool)

(assert (=> b!421570 m!411641))

(assert (=> b!421570 m!411627))

(declare-fun m!411643 () Bool)

(assert (=> b!421570 m!411643))

(declare-fun m!411645 () Bool)

(assert (=> b!421570 m!411645))

(declare-fun m!411647 () Bool)

(assert (=> b!421570 m!411647))

(assert (=> b!421570 m!411623))

(declare-fun m!411649 () Bool)

(assert (=> start!39476 m!411649))

(declare-fun m!411651 () Bool)

(assert (=> start!39476 m!411651))

(declare-fun m!411653 () Bool)

(assert (=> mapNonEmpty!17985 m!411653))

(declare-fun m!411655 () Bool)

(assert (=> b!421572 m!411655))

(declare-fun m!411657 () Bool)

(assert (=> b!421584 m!411657))

(assert (=> b!421584 m!411637))

(declare-fun m!411659 () Bool)

(assert (=> b!421584 m!411659))

(declare-fun m!411661 () Bool)

(assert (=> b!421583 m!411661))

(declare-fun m!411663 () Bool)

(assert (=> b!421576 m!411663))

(check-sat (not b!421572) (not bm!29434) (not b!421570) (not b!421584) (not b!421580) (not b!421575) (not mapNonEmpty!17985) (not b!421583) (not b!421576) (not b!421573) b_and!17405 (not b!421571) (not b!421587) (not b!421574) (not b_next!9757) (not start!39476) tp_is_empty!10909 (not bm!29433) (not b_lambda!9083))
(check-sat b_and!17405 (not b_next!9757))
