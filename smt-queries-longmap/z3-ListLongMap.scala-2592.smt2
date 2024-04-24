; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39356 () Bool)

(assert start!39356)

(declare-fun b_free!9637 () Bool)

(declare-fun b_next!9637 () Bool)

(assert (=> start!39356 (= b_free!9637 (not b_next!9637))))

(declare-fun tp!34440 () Bool)

(declare-fun b_and!17163 () Bool)

(assert (=> start!39356 (= tp!34440 b_and!17163)))

(declare-fun b!418030 () Bool)

(declare-fun e!249319 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((V!15491 0))(
  ( (V!15492 (val!5439 Int)) )
))
(declare-datatypes ((tuple2!6984 0))(
  ( (tuple2!6985 (_1!3503 (_ BitVec 64)) (_2!3503 V!15491)) )
))
(declare-datatypes ((List!6998 0))(
  ( (Nil!6995) (Cons!6994 (h!7850 tuple2!6984) (t!12292 List!6998)) )
))
(declare-datatypes ((ListLongMap!5899 0))(
  ( (ListLongMap!5900 (toList!2965 List!6998)) )
))
(declare-fun call!29077 () ListLongMap!5899)

(declare-fun call!29076 () ListLongMap!5899)

(declare-fun v!412 () V!15491)

(declare-fun +!1234 (ListLongMap!5899 tuple2!6984) ListLongMap!5899)

(assert (=> b!418030 (= e!249319 (= call!29076 (+!1234 call!29077 (tuple2!6985 k0!794 v!412))))))

(declare-fun b!418031 () Bool)

(declare-fun e!249324 () Bool)

(declare-fun e!249323 () Bool)

(assert (=> b!418031 (= e!249324 (not e!249323))))

(declare-fun res!243560 () Bool)

(assert (=> b!418031 (=> res!243560 e!249323)))

(declare-datatypes ((array!25436 0))(
  ( (array!25437 (arr!12167 (Array (_ BitVec 32) (_ BitVec 64))) (size!12519 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25436)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418031 (= res!243560 (validKeyInArray!0 (select (arr!12167 _keys!709) from!863)))))

(assert (=> b!418031 e!249319))

(declare-fun c!55146 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418031 (= c!55146 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15491)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15491)

(declare-datatypes ((Unit!12339 0))(
  ( (Unit!12340) )
))
(declare-fun lt!191609 () Unit!12339)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5051 0))(
  ( (ValueCellFull!5051 (v!7687 V!15491)) (EmptyCell!5051) )
))
(declare-datatypes ((array!25438 0))(
  ( (array!25439 (arr!12168 (Array (_ BitVec 32) ValueCell!5051)) (size!12520 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25438)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!429 (array!25436 array!25438 (_ BitVec 32) (_ BitVec 32) V!15491 V!15491 (_ BitVec 32) (_ BitVec 64) V!15491 (_ BitVec 32) Int) Unit!12339)

(assert (=> b!418031 (= lt!191609 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!429 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418032 () Bool)

(declare-fun res!243568 () Bool)

(declare-fun e!249325 () Bool)

(assert (=> b!418032 (=> (not res!243568) (not e!249325))))

(assert (=> b!418032 (= res!243568 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12519 _keys!709))))))

(declare-fun b!418033 () Bool)

(declare-fun res!243559 () Bool)

(declare-fun e!249320 () Bool)

(assert (=> b!418033 (=> (not res!243559) (not e!249320))))

(declare-fun lt!191604 () array!25436)

(declare-datatypes ((List!6999 0))(
  ( (Nil!6996) (Cons!6995 (h!7851 (_ BitVec 64)) (t!12293 List!6999)) )
))
(declare-fun arrayNoDuplicates!0 (array!25436 (_ BitVec 32) List!6999) Bool)

(assert (=> b!418033 (= res!243559 (arrayNoDuplicates!0 lt!191604 #b00000000000000000000000000000000 Nil!6996))))

(declare-fun b!418034 () Bool)

(declare-fun e!249317 () Bool)

(declare-fun e!249322 () Bool)

(declare-fun mapRes!17805 () Bool)

(assert (=> b!418034 (= e!249317 (and e!249322 mapRes!17805))))

(declare-fun condMapEmpty!17805 () Bool)

(declare-fun mapDefault!17805 () ValueCell!5051)

(assert (=> b!418034 (= condMapEmpty!17805 (= (arr!12168 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5051)) mapDefault!17805)))))

(declare-fun b!418035 () Bool)

(assert (=> b!418035 (= e!249323 true)))

(declare-fun lt!191606 () tuple2!6984)

(declare-fun lt!191608 () ListLongMap!5899)

(declare-fun lt!191605 () V!15491)

(assert (=> b!418035 (= (+!1234 lt!191608 lt!191606) (+!1234 (+!1234 lt!191608 (tuple2!6985 k0!794 lt!191605)) lt!191606))))

(declare-fun lt!191610 () V!15491)

(assert (=> b!418035 (= lt!191606 (tuple2!6985 k0!794 lt!191610))))

(declare-fun lt!191612 () Unit!12339)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!25 (ListLongMap!5899 (_ BitVec 64) V!15491 V!15491) Unit!12339)

(assert (=> b!418035 (= lt!191612 (addSameAsAddTwiceSameKeyDiffValues!25 lt!191608 k0!794 lt!191605 lt!191610))))

(declare-fun lt!191603 () V!15491)

(declare-fun get!6025 (ValueCell!5051 V!15491) V!15491)

(assert (=> b!418035 (= lt!191605 (get!6025 (select (arr!12168 _values!549) from!863) lt!191603))))

(declare-fun lt!191607 () ListLongMap!5899)

(assert (=> b!418035 (= lt!191607 (+!1234 lt!191608 (tuple2!6985 (select (arr!12167 lt!191604) from!863) lt!191610)))))

(assert (=> b!418035 (= lt!191610 (get!6025 (select (store (arr!12168 _values!549) i!563 (ValueCellFull!5051 v!412)) from!863) lt!191603))))

(declare-fun dynLambda!692 (Int (_ BitVec 64)) V!15491)

(assert (=> b!418035 (= lt!191603 (dynLambda!692 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!191611 () array!25438)

(declare-fun getCurrentListMapNoExtraKeys!1211 (array!25436 array!25438 (_ BitVec 32) (_ BitVec 32) V!15491 V!15491 (_ BitVec 32) Int) ListLongMap!5899)

(assert (=> b!418035 (= lt!191608 (getCurrentListMapNoExtraKeys!1211 lt!191604 lt!191611 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418036 () Bool)

(declare-fun res!243566 () Bool)

(assert (=> b!418036 (=> (not res!243566) (not e!249325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25436 (_ BitVec 32)) Bool)

(assert (=> b!418036 (= res!243566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418037 () Bool)

(declare-fun e!249318 () Bool)

(declare-fun tp_is_empty!10789 () Bool)

(assert (=> b!418037 (= e!249318 tp_is_empty!10789)))

(declare-fun bm!29073 () Bool)

(assert (=> bm!29073 (= call!29077 (getCurrentListMapNoExtraKeys!1211 (ite c!55146 _keys!709 lt!191604) (ite c!55146 _values!549 lt!191611) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29074 () Bool)

(assert (=> bm!29074 (= call!29076 (getCurrentListMapNoExtraKeys!1211 (ite c!55146 lt!191604 _keys!709) (ite c!55146 lt!191611 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418039 () Bool)

(declare-fun res!243562 () Bool)

(assert (=> b!418039 (=> (not res!243562) (not e!249325))))

(declare-fun arrayContainsKey!0 (array!25436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418039 (= res!243562 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418040 () Bool)

(declare-fun res!243557 () Bool)

(assert (=> b!418040 (=> (not res!243557) (not e!249325))))

(assert (=> b!418040 (= res!243557 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6996))))

(declare-fun b!418041 () Bool)

(declare-fun res!243565 () Bool)

(assert (=> b!418041 (=> (not res!243565) (not e!249325))))

(assert (=> b!418041 (= res!243565 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17805 () Bool)

(assert (=> mapIsEmpty!17805 mapRes!17805))

(declare-fun b!418042 () Bool)

(declare-fun res!243563 () Bool)

(assert (=> b!418042 (=> (not res!243563) (not e!249325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418042 (= res!243563 (validMask!0 mask!1025))))

(declare-fun b!418043 () Bool)

(assert (=> b!418043 (= e!249319 (= call!29077 call!29076))))

(declare-fun b!418044 () Bool)

(assert (=> b!418044 (= e!249322 tp_is_empty!10789)))

(declare-fun b!418045 () Bool)

(declare-fun res!243558 () Bool)

(assert (=> b!418045 (=> (not res!243558) (not e!249320))))

(assert (=> b!418045 (= res!243558 (bvsle from!863 i!563))))

(declare-fun b!418046 () Bool)

(assert (=> b!418046 (= e!249320 e!249324)))

(declare-fun res!243561 () Bool)

(assert (=> b!418046 (=> (not res!243561) (not e!249324))))

(assert (=> b!418046 (= res!243561 (= from!863 i!563))))

(assert (=> b!418046 (= lt!191607 (getCurrentListMapNoExtraKeys!1211 lt!191604 lt!191611 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418046 (= lt!191611 (array!25439 (store (arr!12168 _values!549) i!563 (ValueCellFull!5051 v!412)) (size!12520 _values!549)))))

(declare-fun lt!191613 () ListLongMap!5899)

(assert (=> b!418046 (= lt!191613 (getCurrentListMapNoExtraKeys!1211 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17805 () Bool)

(declare-fun tp!34439 () Bool)

(assert (=> mapNonEmpty!17805 (= mapRes!17805 (and tp!34439 e!249318))))

(declare-fun mapRest!17805 () (Array (_ BitVec 32) ValueCell!5051))

(declare-fun mapValue!17805 () ValueCell!5051)

(declare-fun mapKey!17805 () (_ BitVec 32))

(assert (=> mapNonEmpty!17805 (= (arr!12168 _values!549) (store mapRest!17805 mapKey!17805 mapValue!17805))))

(declare-fun res!243570 () Bool)

(assert (=> start!39356 (=> (not res!243570) (not e!249325))))

(assert (=> start!39356 (= res!243570 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12519 _keys!709))))))

(assert (=> start!39356 e!249325))

(assert (=> start!39356 tp_is_empty!10789))

(assert (=> start!39356 tp!34440))

(assert (=> start!39356 true))

(declare-fun array_inv!8948 (array!25438) Bool)

(assert (=> start!39356 (and (array_inv!8948 _values!549) e!249317)))

(declare-fun array_inv!8949 (array!25436) Bool)

(assert (=> start!39356 (array_inv!8949 _keys!709)))

(declare-fun b!418038 () Bool)

(declare-fun res!243569 () Bool)

(assert (=> b!418038 (=> (not res!243569) (not e!249325))))

(assert (=> b!418038 (= res!243569 (and (= (size!12520 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12519 _keys!709) (size!12520 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418047 () Bool)

(declare-fun res!243567 () Bool)

(assert (=> b!418047 (=> (not res!243567) (not e!249325))))

(assert (=> b!418047 (= res!243567 (or (= (select (arr!12167 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12167 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418048 () Bool)

(assert (=> b!418048 (= e!249325 e!249320)))

(declare-fun res!243564 () Bool)

(assert (=> b!418048 (=> (not res!243564) (not e!249320))))

(assert (=> b!418048 (= res!243564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191604 mask!1025))))

(assert (=> b!418048 (= lt!191604 (array!25437 (store (arr!12167 _keys!709) i!563 k0!794) (size!12519 _keys!709)))))

(assert (= (and start!39356 res!243570) b!418042))

(assert (= (and b!418042 res!243563) b!418038))

(assert (= (and b!418038 res!243569) b!418036))

(assert (= (and b!418036 res!243566) b!418040))

(assert (= (and b!418040 res!243557) b!418032))

(assert (= (and b!418032 res!243568) b!418041))

(assert (= (and b!418041 res!243565) b!418047))

(assert (= (and b!418047 res!243567) b!418039))

(assert (= (and b!418039 res!243562) b!418048))

(assert (= (and b!418048 res!243564) b!418033))

(assert (= (and b!418033 res!243559) b!418045))

(assert (= (and b!418045 res!243558) b!418046))

(assert (= (and b!418046 res!243561) b!418031))

(assert (= (and b!418031 c!55146) b!418030))

(assert (= (and b!418031 (not c!55146)) b!418043))

(assert (= (or b!418030 b!418043) bm!29074))

(assert (= (or b!418030 b!418043) bm!29073))

(assert (= (and b!418031 (not res!243560)) b!418035))

(assert (= (and b!418034 condMapEmpty!17805) mapIsEmpty!17805))

(assert (= (and b!418034 (not condMapEmpty!17805)) mapNonEmpty!17805))

(get-info :version)

(assert (= (and mapNonEmpty!17805 ((_ is ValueCellFull!5051) mapValue!17805)) b!418037))

(assert (= (and b!418034 ((_ is ValueCellFull!5051) mapDefault!17805)) b!418044))

(assert (= start!39356 b!418034))

(declare-fun b_lambda!8963 () Bool)

(assert (=> (not b_lambda!8963) (not b!418035)))

(declare-fun t!12291 () Bool)

(declare-fun tb!3251 () Bool)

(assert (=> (and start!39356 (= defaultEntry!557 defaultEntry!557) t!12291) tb!3251))

(declare-fun result!6037 () Bool)

(assert (=> tb!3251 (= result!6037 tp_is_empty!10789)))

(assert (=> b!418035 t!12291))

(declare-fun b_and!17165 () Bool)

(assert (= b_and!17163 (and (=> t!12291 result!6037) b_and!17165)))

(declare-fun m!407649 () Bool)

(assert (=> b!418035 m!407649))

(declare-fun m!407651 () Bool)

(assert (=> b!418035 m!407651))

(declare-fun m!407653 () Bool)

(assert (=> b!418035 m!407653))

(declare-fun m!407655 () Bool)

(assert (=> b!418035 m!407655))

(declare-fun m!407657 () Bool)

(assert (=> b!418035 m!407657))

(declare-fun m!407659 () Bool)

(assert (=> b!418035 m!407659))

(declare-fun m!407661 () Bool)

(assert (=> b!418035 m!407661))

(declare-fun m!407663 () Bool)

(assert (=> b!418035 m!407663))

(declare-fun m!407665 () Bool)

(assert (=> b!418035 m!407665))

(declare-fun m!407667 () Bool)

(assert (=> b!418035 m!407667))

(declare-fun m!407669 () Bool)

(assert (=> b!418035 m!407669))

(assert (=> b!418035 m!407667))

(assert (=> b!418035 m!407661))

(declare-fun m!407671 () Bool)

(assert (=> b!418035 m!407671))

(declare-fun m!407673 () Bool)

(assert (=> b!418035 m!407673))

(assert (=> b!418035 m!407663))

(declare-fun m!407675 () Bool)

(assert (=> mapNonEmpty!17805 m!407675))

(declare-fun m!407677 () Bool)

(assert (=> b!418039 m!407677))

(declare-fun m!407679 () Bool)

(assert (=> b!418046 m!407679))

(assert (=> b!418046 m!407657))

(declare-fun m!407681 () Bool)

(assert (=> b!418046 m!407681))

(declare-fun m!407683 () Bool)

(assert (=> b!418048 m!407683))

(declare-fun m!407685 () Bool)

(assert (=> b!418048 m!407685))

(declare-fun m!407687 () Bool)

(assert (=> b!418030 m!407687))

(declare-fun m!407689 () Bool)

(assert (=> b!418042 m!407689))

(declare-fun m!407691 () Bool)

(assert (=> bm!29073 m!407691))

(declare-fun m!407693 () Bool)

(assert (=> b!418041 m!407693))

(declare-fun m!407695 () Bool)

(assert (=> b!418033 m!407695))

(declare-fun m!407697 () Bool)

(assert (=> b!418031 m!407697))

(assert (=> b!418031 m!407697))

(declare-fun m!407699 () Bool)

(assert (=> b!418031 m!407699))

(declare-fun m!407701 () Bool)

(assert (=> b!418031 m!407701))

(declare-fun m!407703 () Bool)

(assert (=> b!418040 m!407703))

(declare-fun m!407705 () Bool)

(assert (=> bm!29074 m!407705))

(declare-fun m!407707 () Bool)

(assert (=> b!418036 m!407707))

(declare-fun m!407709 () Bool)

(assert (=> b!418047 m!407709))

(declare-fun m!407711 () Bool)

(assert (=> start!39356 m!407711))

(declare-fun m!407713 () Bool)

(assert (=> start!39356 m!407713))

(check-sat (not b!418041) tp_is_empty!10789 (not b!418035) (not b_next!9637) (not b!418040) (not bm!29074) (not b!418031) (not bm!29073) b_and!17165 (not b!418033) (not b!418036) (not b!418042) (not b!418048) (not mapNonEmpty!17805) (not b!418030) (not b!418046) (not b!418039) (not b_lambda!8963) (not start!39356))
(check-sat b_and!17165 (not b_next!9637))
