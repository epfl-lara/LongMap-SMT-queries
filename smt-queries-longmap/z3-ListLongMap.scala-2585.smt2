; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39314 () Bool)

(assert start!39314)

(declare-fun b_free!9595 () Bool)

(declare-fun b_next!9595 () Bool)

(assert (=> start!39314 (= b_free!9595 (not b_next!9595))))

(declare-fun tp!34314 () Bool)

(declare-fun b_and!17079 () Bool)

(assert (=> start!39314 (= tp!34314 b_and!17079)))

(declare-fun b!416791 () Bool)

(declare-fun e!248756 () Bool)

(assert (=> b!416791 (= e!248756 true)))

(declare-datatypes ((V!15435 0))(
  ( (V!15436 (val!5418 Int)) )
))
(declare-datatypes ((tuple2!6946 0))(
  ( (tuple2!6947 (_1!3484 (_ BitVec 64)) (_2!3484 V!15435)) )
))
(declare-datatypes ((List!6963 0))(
  ( (Nil!6960) (Cons!6959 (h!7815 tuple2!6946) (t!12215 List!6963)) )
))
(declare-datatypes ((ListLongMap!5861 0))(
  ( (ListLongMap!5862 (toList!2946 List!6963)) )
))
(declare-fun lt!190917 () ListLongMap!5861)

(declare-fun lt!190920 () V!15435)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!190914 () tuple2!6946)

(declare-fun +!1217 (ListLongMap!5861 tuple2!6946) ListLongMap!5861)

(assert (=> b!416791 (= (+!1217 lt!190917 lt!190914) (+!1217 (+!1217 lt!190917 (tuple2!6947 k0!794 lt!190920)) lt!190914))))

(declare-fun lt!190918 () V!15435)

(assert (=> b!416791 (= lt!190914 (tuple2!6947 k0!794 lt!190918))))

(declare-datatypes ((Unit!12309 0))(
  ( (Unit!12310) )
))
(declare-fun lt!190915 () Unit!12309)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!11 (ListLongMap!5861 (_ BitVec 64) V!15435 V!15435) Unit!12309)

(assert (=> b!416791 (= lt!190915 (addSameAsAddTwiceSameKeyDiffValues!11 lt!190917 k0!794 lt!190920 lt!190918))))

(declare-datatypes ((ValueCell!5030 0))(
  ( (ValueCellFull!5030 (v!7666 V!15435)) (EmptyCell!5030) )
))
(declare-datatypes ((array!25354 0))(
  ( (array!25355 (arr!12126 (Array (_ BitVec 32) ValueCell!5030)) (size!12478 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25354)

(declare-fun lt!190919 () V!15435)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun get!5997 (ValueCell!5030 V!15435) V!15435)

(assert (=> b!416791 (= lt!190920 (get!5997 (select (arr!12126 _values!549) from!863) lt!190919))))

(declare-fun lt!190916 () ListLongMap!5861)

(declare-datatypes ((array!25356 0))(
  ( (array!25357 (arr!12127 (Array (_ BitVec 32) (_ BitVec 64))) (size!12479 (_ BitVec 32))) )
))
(declare-fun lt!190913 () array!25356)

(assert (=> b!416791 (= lt!190916 (+!1217 lt!190917 (tuple2!6947 (select (arr!12127 lt!190913) from!863) lt!190918)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15435)

(assert (=> b!416791 (= lt!190918 (get!5997 (select (store (arr!12126 _values!549) i!563 (ValueCellFull!5030 v!412)) from!863) lt!190919))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!678 (Int (_ BitVec 64)) V!15435)

(assert (=> b!416791 (= lt!190919 (dynLambda!678 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15435)

(declare-fun zeroValue!515 () V!15435)

(declare-fun lt!190910 () array!25354)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1193 (array!25356 array!25354 (_ BitVec 32) (_ BitVec 32) V!15435 V!15435 (_ BitVec 32) Int) ListLongMap!5861)

(assert (=> b!416791 (= lt!190917 (getCurrentListMapNoExtraKeys!1193 lt!190913 lt!190910 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416792 () Bool)

(declare-fun res!242682 () Bool)

(declare-fun e!248752 () Bool)

(assert (=> b!416792 (=> (not res!242682) (not e!248752))))

(declare-datatypes ((List!6964 0))(
  ( (Nil!6961) (Cons!6960 (h!7816 (_ BitVec 64)) (t!12216 List!6964)) )
))
(declare-fun arrayNoDuplicates!0 (array!25356 (_ BitVec 32) List!6964) Bool)

(assert (=> b!416792 (= res!242682 (arrayNoDuplicates!0 lt!190913 #b00000000000000000000000000000000 Nil!6961))))

(declare-fun mapNonEmpty!17742 () Bool)

(declare-fun mapRes!17742 () Bool)

(declare-fun tp!34313 () Bool)

(declare-fun e!248753 () Bool)

(assert (=> mapNonEmpty!17742 (= mapRes!17742 (and tp!34313 e!248753))))

(declare-fun mapRest!17742 () (Array (_ BitVec 32) ValueCell!5030))

(declare-fun mapValue!17742 () ValueCell!5030)

(declare-fun mapKey!17742 () (_ BitVec 32))

(assert (=> mapNonEmpty!17742 (= (arr!12126 _values!549) (store mapRest!17742 mapKey!17742 mapValue!17742))))

(declare-fun b!416793 () Bool)

(declare-fun res!242684 () Bool)

(declare-fun e!248751 () Bool)

(assert (=> b!416793 (=> (not res!242684) (not e!248751))))

(declare-fun _keys!709 () array!25356)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25356 (_ BitVec 32)) Bool)

(assert (=> b!416793 (= res!242684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416794 () Bool)

(declare-fun e!248757 () Bool)

(assert (=> b!416794 (= e!248752 e!248757)))

(declare-fun res!242685 () Bool)

(assert (=> b!416794 (=> (not res!242685) (not e!248757))))

(assert (=> b!416794 (= res!242685 (= from!863 i!563))))

(assert (=> b!416794 (= lt!190916 (getCurrentListMapNoExtraKeys!1193 lt!190913 lt!190910 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416794 (= lt!190910 (array!25355 (store (arr!12126 _values!549) i!563 (ValueCellFull!5030 v!412)) (size!12478 _values!549)))))

(declare-fun lt!190911 () ListLongMap!5861)

(assert (=> b!416794 (= lt!190911 (getCurrentListMapNoExtraKeys!1193 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416795 () Bool)

(declare-fun res!242686 () Bool)

(assert (=> b!416795 (=> (not res!242686) (not e!248751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416795 (= res!242686 (validMask!0 mask!1025))))

(declare-fun c!55083 () Bool)

(declare-fun bm!28947 () Bool)

(declare-fun call!28950 () ListLongMap!5861)

(assert (=> bm!28947 (= call!28950 (getCurrentListMapNoExtraKeys!1193 (ite c!55083 lt!190913 _keys!709) (ite c!55083 lt!190910 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28948 () Bool)

(declare-fun call!28951 () ListLongMap!5861)

(assert (=> bm!28948 (= call!28951 (getCurrentListMapNoExtraKeys!1193 (ite c!55083 _keys!709 lt!190913) (ite c!55083 _values!549 lt!190910) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416796 () Bool)

(declare-fun res!242688 () Bool)

(assert (=> b!416796 (=> (not res!242688) (not e!248751))))

(assert (=> b!416796 (= res!242688 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6961))))

(declare-fun res!242679 () Bool)

(assert (=> start!39314 (=> (not res!242679) (not e!248751))))

(assert (=> start!39314 (= res!242679 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12479 _keys!709))))))

(assert (=> start!39314 e!248751))

(declare-fun tp_is_empty!10747 () Bool)

(assert (=> start!39314 tp_is_empty!10747))

(assert (=> start!39314 tp!34314))

(assert (=> start!39314 true))

(declare-fun e!248750 () Bool)

(declare-fun array_inv!8924 (array!25354) Bool)

(assert (=> start!39314 (and (array_inv!8924 _values!549) e!248750)))

(declare-fun array_inv!8925 (array!25356) Bool)

(assert (=> start!39314 (array_inv!8925 _keys!709)))

(declare-fun b!416797 () Bool)

(declare-fun res!242675 () Bool)

(assert (=> b!416797 (=> (not res!242675) (not e!248751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416797 (= res!242675 (validKeyInArray!0 k0!794))))

(declare-fun b!416798 () Bool)

(assert (=> b!416798 (= e!248757 (not e!248756))))

(declare-fun res!242683 () Bool)

(assert (=> b!416798 (=> res!242683 e!248756)))

(assert (=> b!416798 (= res!242683 (validKeyInArray!0 (select (arr!12127 _keys!709) from!863)))))

(declare-fun e!248758 () Bool)

(assert (=> b!416798 e!248758))

(assert (=> b!416798 (= c!55083 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!190912 () Unit!12309)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!420 (array!25356 array!25354 (_ BitVec 32) (_ BitVec 32) V!15435 V!15435 (_ BitVec 32) (_ BitVec 64) V!15435 (_ BitVec 32) Int) Unit!12309)

(assert (=> b!416798 (= lt!190912 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!420 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416799 () Bool)

(declare-fun res!242678 () Bool)

(assert (=> b!416799 (=> (not res!242678) (not e!248751))))

(declare-fun arrayContainsKey!0 (array!25356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416799 (= res!242678 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416800 () Bool)

(declare-fun res!242680 () Bool)

(assert (=> b!416800 (=> (not res!242680) (not e!248752))))

(assert (=> b!416800 (= res!242680 (bvsle from!863 i!563))))

(declare-fun b!416801 () Bool)

(declare-fun res!242687 () Bool)

(assert (=> b!416801 (=> (not res!242687) (not e!248751))))

(assert (=> b!416801 (= res!242687 (or (= (select (arr!12127 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12127 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416802 () Bool)

(declare-fun e!248755 () Bool)

(assert (=> b!416802 (= e!248755 tp_is_empty!10747)))

(declare-fun b!416803 () Bool)

(declare-fun res!242676 () Bool)

(assert (=> b!416803 (=> (not res!242676) (not e!248751))))

(assert (=> b!416803 (= res!242676 (and (= (size!12478 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12479 _keys!709) (size!12478 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416804 () Bool)

(assert (=> b!416804 (= e!248750 (and e!248755 mapRes!17742))))

(declare-fun condMapEmpty!17742 () Bool)

(declare-fun mapDefault!17742 () ValueCell!5030)

(assert (=> b!416804 (= condMapEmpty!17742 (= (arr!12126 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5030)) mapDefault!17742)))))

(declare-fun b!416805 () Bool)

(assert (=> b!416805 (= e!248758 (= call!28950 (+!1217 call!28951 (tuple2!6947 k0!794 v!412))))))

(declare-fun mapIsEmpty!17742 () Bool)

(assert (=> mapIsEmpty!17742 mapRes!17742))

(declare-fun b!416806 () Bool)

(assert (=> b!416806 (= e!248751 e!248752)))

(declare-fun res!242677 () Bool)

(assert (=> b!416806 (=> (not res!242677) (not e!248752))))

(assert (=> b!416806 (= res!242677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190913 mask!1025))))

(assert (=> b!416806 (= lt!190913 (array!25357 (store (arr!12127 _keys!709) i!563 k0!794) (size!12479 _keys!709)))))

(declare-fun b!416807 () Bool)

(declare-fun res!242681 () Bool)

(assert (=> b!416807 (=> (not res!242681) (not e!248751))))

(assert (=> b!416807 (= res!242681 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12479 _keys!709))))))

(declare-fun b!416808 () Bool)

(assert (=> b!416808 (= e!248753 tp_is_empty!10747)))

(declare-fun b!416809 () Bool)

(assert (=> b!416809 (= e!248758 (= call!28951 call!28950))))

(assert (= (and start!39314 res!242679) b!416795))

(assert (= (and b!416795 res!242686) b!416803))

(assert (= (and b!416803 res!242676) b!416793))

(assert (= (and b!416793 res!242684) b!416796))

(assert (= (and b!416796 res!242688) b!416807))

(assert (= (and b!416807 res!242681) b!416797))

(assert (= (and b!416797 res!242675) b!416801))

(assert (= (and b!416801 res!242687) b!416799))

(assert (= (and b!416799 res!242678) b!416806))

(assert (= (and b!416806 res!242677) b!416792))

(assert (= (and b!416792 res!242682) b!416800))

(assert (= (and b!416800 res!242680) b!416794))

(assert (= (and b!416794 res!242685) b!416798))

(assert (= (and b!416798 c!55083) b!416805))

(assert (= (and b!416798 (not c!55083)) b!416809))

(assert (= (or b!416805 b!416809) bm!28947))

(assert (= (or b!416805 b!416809) bm!28948))

(assert (= (and b!416798 (not res!242683)) b!416791))

(assert (= (and b!416804 condMapEmpty!17742) mapIsEmpty!17742))

(assert (= (and b!416804 (not condMapEmpty!17742)) mapNonEmpty!17742))

(get-info :version)

(assert (= (and mapNonEmpty!17742 ((_ is ValueCellFull!5030) mapValue!17742)) b!416808))

(assert (= (and b!416804 ((_ is ValueCellFull!5030) mapDefault!17742)) b!416802))

(assert (= start!39314 b!416804))

(declare-fun b_lambda!8921 () Bool)

(assert (=> (not b_lambda!8921) (not b!416791)))

(declare-fun t!12214 () Bool)

(declare-fun tb!3209 () Bool)

(assert (=> (and start!39314 (= defaultEntry!557 defaultEntry!557) t!12214) tb!3209))

(declare-fun result!5953 () Bool)

(assert (=> tb!3209 (= result!5953 tp_is_empty!10747)))

(assert (=> b!416791 t!12214))

(declare-fun b_and!17081 () Bool)

(assert (= b_and!17079 (and (=> t!12214 result!5953) b_and!17081)))

(declare-fun m!406267 () Bool)

(assert (=> b!416806 m!406267))

(declare-fun m!406269 () Bool)

(assert (=> b!416806 m!406269))

(declare-fun m!406271 () Bool)

(assert (=> b!416798 m!406271))

(assert (=> b!416798 m!406271))

(declare-fun m!406273 () Bool)

(assert (=> b!416798 m!406273))

(declare-fun m!406275 () Bool)

(assert (=> b!416798 m!406275))

(declare-fun m!406277 () Bool)

(assert (=> b!416805 m!406277))

(declare-fun m!406279 () Bool)

(assert (=> b!416797 m!406279))

(declare-fun m!406281 () Bool)

(assert (=> bm!28947 m!406281))

(declare-fun m!406283 () Bool)

(assert (=> bm!28948 m!406283))

(declare-fun m!406285 () Bool)

(assert (=> b!416793 m!406285))

(declare-fun m!406287 () Bool)

(assert (=> start!39314 m!406287))

(declare-fun m!406289 () Bool)

(assert (=> start!39314 m!406289))

(declare-fun m!406291 () Bool)

(assert (=> mapNonEmpty!17742 m!406291))

(declare-fun m!406293 () Bool)

(assert (=> b!416801 m!406293))

(declare-fun m!406295 () Bool)

(assert (=> b!416792 m!406295))

(declare-fun m!406297 () Bool)

(assert (=> b!416794 m!406297))

(declare-fun m!406299 () Bool)

(assert (=> b!416794 m!406299))

(declare-fun m!406301 () Bool)

(assert (=> b!416794 m!406301))

(declare-fun m!406303 () Bool)

(assert (=> b!416799 m!406303))

(declare-fun m!406305 () Bool)

(assert (=> b!416791 m!406305))

(declare-fun m!406307 () Bool)

(assert (=> b!416791 m!406307))

(declare-fun m!406309 () Bool)

(assert (=> b!416791 m!406309))

(declare-fun m!406311 () Bool)

(assert (=> b!416791 m!406311))

(declare-fun m!406313 () Bool)

(assert (=> b!416791 m!406313))

(assert (=> b!416791 m!406299))

(declare-fun m!406315 () Bool)

(assert (=> b!416791 m!406315))

(declare-fun m!406317 () Bool)

(assert (=> b!416791 m!406317))

(declare-fun m!406319 () Bool)

(assert (=> b!416791 m!406319))

(declare-fun m!406321 () Bool)

(assert (=> b!416791 m!406321))

(declare-fun m!406323 () Bool)

(assert (=> b!416791 m!406323))

(assert (=> b!416791 m!406319))

(declare-fun m!406325 () Bool)

(assert (=> b!416791 m!406325))

(assert (=> b!416791 m!406315))

(assert (=> b!416791 m!406321))

(declare-fun m!406327 () Bool)

(assert (=> b!416791 m!406327))

(declare-fun m!406329 () Bool)

(assert (=> b!416795 m!406329))

(declare-fun m!406331 () Bool)

(assert (=> b!416796 m!406331))

(check-sat (not b_next!9595) (not b!416792) (not start!39314) (not b!416791) (not b!416805) (not b!416797) tp_is_empty!10747 b_and!17081 (not b!416794) (not b_lambda!8921) (not b!416799) (not bm!28947) (not b!416793) (not b!416798) (not b!416806) (not mapNonEmpty!17742) (not b!416795) (not bm!28948) (not b!416796))
(check-sat b_and!17081 (not b_next!9595))
