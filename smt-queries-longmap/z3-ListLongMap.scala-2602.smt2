; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39416 () Bool)

(assert start!39416)

(declare-fun b_free!9697 () Bool)

(declare-fun b_next!9697 () Bool)

(assert (=> start!39416 (= b_free!9697 (not b_next!9697))))

(declare-fun tp!34620 () Bool)

(declare-fun b_and!17283 () Bool)

(assert (=> start!39416 (= tp!34620 b_and!17283)))

(declare-fun b!419800 () Bool)

(declare-fun res!244827 () Bool)

(declare-fun e!250129 () Bool)

(assert (=> b!419800 (=> (not res!244827) (not e!250129))))

(declare-datatypes ((array!25554 0))(
  ( (array!25555 (arr!12226 (Array (_ BitVec 32) (_ BitVec 64))) (size!12578 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25554)

(declare-datatypes ((V!15571 0))(
  ( (V!15572 (val!5469 Int)) )
))
(declare-datatypes ((ValueCell!5081 0))(
  ( (ValueCellFull!5081 (v!7717 V!15571)) (EmptyCell!5081) )
))
(declare-datatypes ((array!25556 0))(
  ( (array!25557 (arr!12227 (Array (_ BitVec 32) ValueCell!5081)) (size!12579 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25556)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!419800 (= res!244827 (and (= (size!12579 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12578 _keys!709) (size!12579 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419801 () Bool)

(declare-datatypes ((tuple2!7040 0))(
  ( (tuple2!7041 (_1!3531 (_ BitVec 64)) (_2!3531 V!15571)) )
))
(declare-datatypes ((List!7049 0))(
  ( (Nil!7046) (Cons!7045 (h!7901 tuple2!7040) (t!12403 List!7049)) )
))
(declare-datatypes ((ListLongMap!5955 0))(
  ( (ListLongMap!5956 (toList!2993 List!7049)) )
))
(declare-fun call!29257 () ListLongMap!5955)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!29256 () ListLongMap!5955)

(declare-fun e!250134 () Bool)

(declare-fun v!412 () V!15571)

(declare-fun +!1257 (ListLongMap!5955 tuple2!7040) ListLongMap!5955)

(assert (=> b!419801 (= e!250134 (= call!29257 (+!1257 call!29256 (tuple2!7041 k0!794 v!412))))))

(declare-fun lt!192600 () array!25554)

(declare-fun minValue!515 () V!15571)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!192597 () array!25556)

(declare-fun bm!29253 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15571)

(declare-fun c!55236 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1239 (array!25554 array!25556 (_ BitVec 32) (_ BitVec 32) V!15571 V!15571 (_ BitVec 32) Int) ListLongMap!5955)

(assert (=> bm!29253 (= call!29256 (getCurrentListMapNoExtraKeys!1239 (ite c!55236 _keys!709 lt!192600) (ite c!55236 _values!549 lt!192597) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419802 () Bool)

(declare-fun e!250132 () Bool)

(declare-fun e!250131 () Bool)

(declare-fun mapRes!17895 () Bool)

(assert (=> b!419802 (= e!250132 (and e!250131 mapRes!17895))))

(declare-fun condMapEmpty!17895 () Bool)

(declare-fun mapDefault!17895 () ValueCell!5081)

(assert (=> b!419802 (= condMapEmpty!17895 (= (arr!12227 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5081)) mapDefault!17895)))))

(declare-fun b!419803 () Bool)

(declare-fun res!244829 () Bool)

(assert (=> b!419803 (=> (not res!244829) (not e!250129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419803 (= res!244829 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17895 () Bool)

(assert (=> mapIsEmpty!17895 mapRes!17895))

(declare-fun b!419804 () Bool)

(declare-fun res!244819 () Bool)

(assert (=> b!419804 (=> (not res!244819) (not e!250129))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419804 (= res!244819 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12578 _keys!709))))))

(declare-fun b!419805 () Bool)

(declare-fun e!250127 () Bool)

(assert (=> b!419805 (= e!250129 e!250127)))

(declare-fun res!244826 () Bool)

(assert (=> b!419805 (=> (not res!244826) (not e!250127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25554 (_ BitVec 32)) Bool)

(assert (=> b!419805 (= res!244826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192600 mask!1025))))

(assert (=> b!419805 (= lt!192600 (array!25555 (store (arr!12226 _keys!709) i!563 k0!794) (size!12578 _keys!709)))))

(declare-fun bm!29254 () Bool)

(assert (=> bm!29254 (= call!29257 (getCurrentListMapNoExtraKeys!1239 (ite c!55236 lt!192600 _keys!709) (ite c!55236 lt!192597 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419806 () Bool)

(declare-fun res!244820 () Bool)

(assert (=> b!419806 (=> (not res!244820) (not e!250129))))

(declare-fun arrayContainsKey!0 (array!25554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419806 (= res!244820 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!419807 () Bool)

(declare-fun e!250130 () Bool)

(declare-fun e!250135 () Bool)

(assert (=> b!419807 (= e!250130 (not e!250135))))

(declare-fun res!244825 () Bool)

(assert (=> b!419807 (=> res!244825 e!250135)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419807 (= res!244825 (validKeyInArray!0 (select (arr!12226 _keys!709) from!863)))))

(assert (=> b!419807 e!250134))

(assert (=> b!419807 (= c!55236 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12387 0))(
  ( (Unit!12388) )
))
(declare-fun lt!192593 () Unit!12387)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!448 (array!25554 array!25556 (_ BitVec 32) (_ BitVec 32) V!15571 V!15571 (_ BitVec 32) (_ BitVec 64) V!15571 (_ BitVec 32) Int) Unit!12387)

(assert (=> b!419807 (= lt!192593 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!448 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17895 () Bool)

(declare-fun tp!34619 () Bool)

(declare-fun e!250133 () Bool)

(assert (=> mapNonEmpty!17895 (= mapRes!17895 (and tp!34619 e!250133))))

(declare-fun mapKey!17895 () (_ BitVec 32))

(declare-fun mapRest!17895 () (Array (_ BitVec 32) ValueCell!5081))

(declare-fun mapValue!17895 () ValueCell!5081)

(assert (=> mapNonEmpty!17895 (= (arr!12227 _values!549) (store mapRest!17895 mapKey!17895 mapValue!17895))))

(declare-fun res!244818 () Bool)

(assert (=> start!39416 (=> (not res!244818) (not e!250129))))

(assert (=> start!39416 (= res!244818 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12578 _keys!709))))))

(assert (=> start!39416 e!250129))

(declare-fun tp_is_empty!10849 () Bool)

(assert (=> start!39416 tp_is_empty!10849))

(assert (=> start!39416 tp!34620))

(assert (=> start!39416 true))

(declare-fun array_inv!8986 (array!25556) Bool)

(assert (=> start!39416 (and (array_inv!8986 _values!549) e!250132)))

(declare-fun array_inv!8987 (array!25554) Bool)

(assert (=> start!39416 (array_inv!8987 _keys!709)))

(declare-fun b!419808 () Bool)

(assert (=> b!419808 (= e!250127 e!250130)))

(declare-fun res!244828 () Bool)

(assert (=> b!419808 (=> (not res!244828) (not e!250130))))

(assert (=> b!419808 (= res!244828 (= from!863 i!563))))

(declare-fun lt!192594 () ListLongMap!5955)

(assert (=> b!419808 (= lt!192594 (getCurrentListMapNoExtraKeys!1239 lt!192600 lt!192597 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419808 (= lt!192597 (array!25557 (store (arr!12227 _values!549) i!563 (ValueCellFull!5081 v!412)) (size!12579 _values!549)))))

(declare-fun lt!192595 () ListLongMap!5955)

(assert (=> b!419808 (= lt!192595 (getCurrentListMapNoExtraKeys!1239 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419809 () Bool)

(declare-fun res!244817 () Bool)

(assert (=> b!419809 (=> (not res!244817) (not e!250127))))

(assert (=> b!419809 (= res!244817 (bvsle from!863 i!563))))

(declare-fun b!419810 () Bool)

(declare-fun res!244824 () Bool)

(assert (=> b!419810 (=> (not res!244824) (not e!250129))))

(declare-datatypes ((List!7050 0))(
  ( (Nil!7047) (Cons!7046 (h!7902 (_ BitVec 64)) (t!12404 List!7050)) )
))
(declare-fun arrayNoDuplicates!0 (array!25554 (_ BitVec 32) List!7050) Bool)

(assert (=> b!419810 (= res!244824 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7047))))

(declare-fun b!419811 () Bool)

(assert (=> b!419811 (= e!250135 true)))

(declare-fun lt!192596 () V!15571)

(declare-fun lt!192599 () ListLongMap!5955)

(declare-fun lt!192601 () tuple2!7040)

(assert (=> b!419811 (= (+!1257 lt!192599 lt!192601) (+!1257 (+!1257 lt!192599 (tuple2!7041 k0!794 lt!192596)) lt!192601))))

(declare-fun lt!192602 () V!15571)

(assert (=> b!419811 (= lt!192601 (tuple2!7041 k0!794 lt!192602))))

(declare-fun lt!192598 () Unit!12387)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!47 (ListLongMap!5955 (_ BitVec 64) V!15571 V!15571) Unit!12387)

(assert (=> b!419811 (= lt!192598 (addSameAsAddTwiceSameKeyDiffValues!47 lt!192599 k0!794 lt!192596 lt!192602))))

(declare-fun lt!192603 () V!15571)

(declare-fun get!6067 (ValueCell!5081 V!15571) V!15571)

(assert (=> b!419811 (= lt!192596 (get!6067 (select (arr!12227 _values!549) from!863) lt!192603))))

(assert (=> b!419811 (= lt!192594 (+!1257 lt!192599 (tuple2!7041 (select (arr!12226 lt!192600) from!863) lt!192602)))))

(assert (=> b!419811 (= lt!192602 (get!6067 (select (store (arr!12227 _values!549) i!563 (ValueCellFull!5081 v!412)) from!863) lt!192603))))

(declare-fun dynLambda!714 (Int (_ BitVec 64)) V!15571)

(assert (=> b!419811 (= lt!192603 (dynLambda!714 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419811 (= lt!192599 (getCurrentListMapNoExtraKeys!1239 lt!192600 lt!192597 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419812 () Bool)

(declare-fun res!244823 () Bool)

(assert (=> b!419812 (=> (not res!244823) (not e!250129))))

(assert (=> b!419812 (= res!244823 (or (= (select (arr!12226 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12226 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419813 () Bool)

(assert (=> b!419813 (= e!250131 tp_is_empty!10849)))

(declare-fun b!419814 () Bool)

(assert (=> b!419814 (= e!250133 tp_is_empty!10849)))

(declare-fun b!419815 () Bool)

(assert (=> b!419815 (= e!250134 (= call!29256 call!29257))))

(declare-fun b!419816 () Bool)

(declare-fun res!244830 () Bool)

(assert (=> b!419816 (=> (not res!244830) (not e!250129))))

(assert (=> b!419816 (= res!244830 (validKeyInArray!0 k0!794))))

(declare-fun b!419817 () Bool)

(declare-fun res!244822 () Bool)

(assert (=> b!419817 (=> (not res!244822) (not e!250127))))

(assert (=> b!419817 (= res!244822 (arrayNoDuplicates!0 lt!192600 #b00000000000000000000000000000000 Nil!7047))))

(declare-fun b!419818 () Bool)

(declare-fun res!244821 () Bool)

(assert (=> b!419818 (=> (not res!244821) (not e!250129))))

(assert (=> b!419818 (= res!244821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39416 res!244818) b!419803))

(assert (= (and b!419803 res!244829) b!419800))

(assert (= (and b!419800 res!244827) b!419818))

(assert (= (and b!419818 res!244821) b!419810))

(assert (= (and b!419810 res!244824) b!419804))

(assert (= (and b!419804 res!244819) b!419816))

(assert (= (and b!419816 res!244830) b!419812))

(assert (= (and b!419812 res!244823) b!419806))

(assert (= (and b!419806 res!244820) b!419805))

(assert (= (and b!419805 res!244826) b!419817))

(assert (= (and b!419817 res!244822) b!419809))

(assert (= (and b!419809 res!244817) b!419808))

(assert (= (and b!419808 res!244828) b!419807))

(assert (= (and b!419807 c!55236) b!419801))

(assert (= (and b!419807 (not c!55236)) b!419815))

(assert (= (or b!419801 b!419815) bm!29254))

(assert (= (or b!419801 b!419815) bm!29253))

(assert (= (and b!419807 (not res!244825)) b!419811))

(assert (= (and b!419802 condMapEmpty!17895) mapIsEmpty!17895))

(assert (= (and b!419802 (not condMapEmpty!17895)) mapNonEmpty!17895))

(get-info :version)

(assert (= (and mapNonEmpty!17895 ((_ is ValueCellFull!5081) mapValue!17895)) b!419814))

(assert (= (and b!419802 ((_ is ValueCellFull!5081) mapDefault!17895)) b!419813))

(assert (= start!39416 b!419802))

(declare-fun b_lambda!9023 () Bool)

(assert (=> (not b_lambda!9023) (not b!419811)))

(declare-fun t!12402 () Bool)

(declare-fun tb!3311 () Bool)

(assert (=> (and start!39416 (= defaultEntry!557 defaultEntry!557) t!12402) tb!3311))

(declare-fun result!6157 () Bool)

(assert (=> tb!3311 (= result!6157 tp_is_empty!10849)))

(assert (=> b!419811 t!12402))

(declare-fun b_and!17285 () Bool)

(assert (= b_and!17283 (and (=> t!12402 result!6157) b_and!17285)))

(declare-fun m!409621 () Bool)

(assert (=> b!419812 m!409621))

(declare-fun m!409623 () Bool)

(assert (=> b!419818 m!409623))

(declare-fun m!409625 () Bool)

(assert (=> bm!29254 m!409625))

(declare-fun m!409627 () Bool)

(assert (=> b!419810 m!409627))

(declare-fun m!409629 () Bool)

(assert (=> b!419806 m!409629))

(declare-fun m!409631 () Bool)

(assert (=> b!419811 m!409631))

(declare-fun m!409633 () Bool)

(assert (=> b!419811 m!409633))

(declare-fun m!409635 () Bool)

(assert (=> b!419811 m!409635))

(declare-fun m!409637 () Bool)

(assert (=> b!419811 m!409637))

(declare-fun m!409639 () Bool)

(assert (=> b!419811 m!409639))

(declare-fun m!409641 () Bool)

(assert (=> b!419811 m!409641))

(declare-fun m!409643 () Bool)

(assert (=> b!419811 m!409643))

(assert (=> b!419811 m!409631))

(declare-fun m!409645 () Bool)

(assert (=> b!419811 m!409645))

(declare-fun m!409647 () Bool)

(assert (=> b!419811 m!409647))

(declare-fun m!409649 () Bool)

(assert (=> b!419811 m!409649))

(declare-fun m!409651 () Bool)

(assert (=> b!419811 m!409651))

(declare-fun m!409653 () Bool)

(assert (=> b!419811 m!409653))

(assert (=> b!419811 m!409641))

(declare-fun m!409655 () Bool)

(assert (=> b!419811 m!409655))

(assert (=> b!419811 m!409651))

(declare-fun m!409657 () Bool)

(assert (=> b!419807 m!409657))

(assert (=> b!419807 m!409657))

(declare-fun m!409659 () Bool)

(assert (=> b!419807 m!409659))

(declare-fun m!409661 () Bool)

(assert (=> b!419807 m!409661))

(declare-fun m!409663 () Bool)

(assert (=> b!419803 m!409663))

(declare-fun m!409665 () Bool)

(assert (=> b!419817 m!409665))

(declare-fun m!409667 () Bool)

(assert (=> b!419808 m!409667))

(assert (=> b!419808 m!409637))

(declare-fun m!409669 () Bool)

(assert (=> b!419808 m!409669))

(declare-fun m!409671 () Bool)

(assert (=> bm!29253 m!409671))

(declare-fun m!409673 () Bool)

(assert (=> b!419805 m!409673))

(declare-fun m!409675 () Bool)

(assert (=> b!419805 m!409675))

(declare-fun m!409677 () Bool)

(assert (=> b!419816 m!409677))

(declare-fun m!409679 () Bool)

(assert (=> b!419801 m!409679))

(declare-fun m!409681 () Bool)

(assert (=> mapNonEmpty!17895 m!409681))

(declare-fun m!409683 () Bool)

(assert (=> start!39416 m!409683))

(declare-fun m!409685 () Bool)

(assert (=> start!39416 m!409685))

(check-sat (not b!419808) (not b!419801) (not b!419806) (not b_next!9697) (not b!419811) (not b!419817) (not b_lambda!9023) (not mapNonEmpty!17895) (not bm!29253) (not b!419803) (not b!419805) (not b!419807) (not b!419810) (not b!419818) (not bm!29254) (not start!39416) (not b!419816) b_and!17285 tp_is_empty!10849)
(check-sat b_and!17285 (not b_next!9697))
