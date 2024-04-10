; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39396 () Bool)

(assert start!39396)

(declare-fun b_free!9663 () Bool)

(declare-fun b_next!9663 () Bool)

(assert (=> start!39396 (= b_free!9663 (not b_next!9663))))

(declare-fun tp!34517 () Bool)

(declare-fun b_and!17201 () Bool)

(assert (=> start!39396 (= tp!34517 b_and!17201)))

(declare-datatypes ((V!15525 0))(
  ( (V!15526 (val!5452 Int)) )
))
(declare-fun minValue!515 () V!15525)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29164 () Bool)

(declare-datatypes ((array!25481 0))(
  ( (array!25482 (arr!12190 (Array (_ BitVec 32) (_ BitVec 64))) (size!12542 (_ BitVec 32))) )
))
(declare-fun lt!192022 () array!25481)

(declare-datatypes ((tuple2!7132 0))(
  ( (tuple2!7133 (_1!3577 (_ BitVec 64)) (_2!3577 V!15525)) )
))
(declare-datatypes ((List!7144 0))(
  ( (Nil!7141) (Cons!7140 (h!7996 tuple2!7132) (t!12472 List!7144)) )
))
(declare-datatypes ((ListLongMap!6045 0))(
  ( (ListLongMap!6046 (toList!3038 List!7144)) )
))
(declare-fun call!29167 () ListLongMap!6045)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25481)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5064 0))(
  ( (ValueCellFull!5064 (v!7699 V!15525)) (EmptyCell!5064) )
))
(declare-datatypes ((array!25483 0))(
  ( (array!25484 (arr!12191 (Array (_ BitVec 32) ValueCell!5064)) (size!12543 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25483)

(declare-fun lt!192015 () array!25483)

(declare-fun zeroValue!515 () V!15525)

(declare-fun c!55208 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1243 (array!25481 array!25483 (_ BitVec 32) (_ BitVec 32) V!15525 V!15525 (_ BitVec 32) Int) ListLongMap!6045)

(assert (=> bm!29164 (= call!29167 (getCurrentListMapNoExtraKeys!1243 (ite c!55208 lt!192022 _keys!709) (ite c!55208 lt!192015 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418847 () Bool)

(declare-fun e!249706 () Bool)

(declare-fun call!29168 () ListLongMap!6045)

(assert (=> b!418847 (= e!249706 (= call!29168 call!29167))))

(declare-fun b!418848 () Bool)

(declare-fun e!249705 () Bool)

(declare-fun e!249700 () Bool)

(assert (=> b!418848 (= e!249705 e!249700)))

(declare-fun res!244111 () Bool)

(assert (=> b!418848 (=> (not res!244111) (not e!249700))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418848 (= res!244111 (= from!863 i!563))))

(declare-fun lt!192019 () ListLongMap!6045)

(assert (=> b!418848 (= lt!192019 (getCurrentListMapNoExtraKeys!1243 lt!192022 lt!192015 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15525)

(assert (=> b!418848 (= lt!192015 (array!25484 (store (arr!12191 _values!549) i!563 (ValueCellFull!5064 v!412)) (size!12543 _values!549)))))

(declare-fun lt!192014 () ListLongMap!6045)

(assert (=> b!418848 (= lt!192014 (getCurrentListMapNoExtraKeys!1243 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418849 () Bool)

(declare-fun e!249703 () Bool)

(declare-fun tp_is_empty!10815 () Bool)

(assert (=> b!418849 (= e!249703 tp_is_empty!10815)))

(declare-fun b!418850 () Bool)

(declare-fun res!244116 () Bool)

(declare-fun e!249707 () Bool)

(assert (=> b!418850 (=> (not res!244116) (not e!249707))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418850 (= res!244116 (validKeyInArray!0 k0!794))))

(declare-fun b!418851 () Bool)

(declare-fun res!244110 () Bool)

(assert (=> b!418851 (=> (not res!244110) (not e!249707))))

(assert (=> b!418851 (= res!244110 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12542 _keys!709))))))

(declare-fun b!418852 () Bool)

(declare-fun e!249701 () Bool)

(declare-fun e!249704 () Bool)

(declare-fun mapRes!17844 () Bool)

(assert (=> b!418852 (= e!249701 (and e!249704 mapRes!17844))))

(declare-fun condMapEmpty!17844 () Bool)

(declare-fun mapDefault!17844 () ValueCell!5064)

(assert (=> b!418852 (= condMapEmpty!17844 (= (arr!12191 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5064)) mapDefault!17844)))))

(declare-fun b!418853 () Bool)

(assert (=> b!418853 (= e!249704 tp_is_empty!10815)))

(declare-fun b!418846 () Bool)

(declare-fun res!244118 () Bool)

(assert (=> b!418846 (=> (not res!244118) (not e!249705))))

(declare-datatypes ((List!7145 0))(
  ( (Nil!7142) (Cons!7141 (h!7997 (_ BitVec 64)) (t!12473 List!7145)) )
))
(declare-fun arrayNoDuplicates!0 (array!25481 (_ BitVec 32) List!7145) Bool)

(assert (=> b!418846 (= res!244118 (arrayNoDuplicates!0 lt!192022 #b00000000000000000000000000000000 Nil!7142))))

(declare-fun res!244109 () Bool)

(assert (=> start!39396 (=> (not res!244109) (not e!249707))))

(assert (=> start!39396 (= res!244109 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12542 _keys!709))))))

(assert (=> start!39396 e!249707))

(assert (=> start!39396 tp_is_empty!10815))

(assert (=> start!39396 tp!34517))

(assert (=> start!39396 true))

(declare-fun array_inv!8888 (array!25483) Bool)

(assert (=> start!39396 (and (array_inv!8888 _values!549) e!249701)))

(declare-fun array_inv!8889 (array!25481) Bool)

(assert (=> start!39396 (array_inv!8889 _keys!709)))

(declare-fun b!418854 () Bool)

(assert (=> b!418854 (= e!249707 e!249705)))

(declare-fun res!244108 () Bool)

(assert (=> b!418854 (=> (not res!244108) (not e!249705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25481 (_ BitVec 32)) Bool)

(assert (=> b!418854 (= res!244108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192022 mask!1025))))

(assert (=> b!418854 (= lt!192022 (array!25482 (store (arr!12190 _keys!709) i!563 k0!794) (size!12542 _keys!709)))))

(declare-fun bm!29165 () Bool)

(assert (=> bm!29165 (= call!29168 (getCurrentListMapNoExtraKeys!1243 (ite c!55208 _keys!709 lt!192022) (ite c!55208 _values!549 lt!192015) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17844 () Bool)

(assert (=> mapIsEmpty!17844 mapRes!17844))

(declare-fun b!418855 () Bool)

(declare-fun res!244114 () Bool)

(assert (=> b!418855 (=> (not res!244114) (not e!249707))))

(assert (=> b!418855 (= res!244114 (or (= (select (arr!12190 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12190 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418856 () Bool)

(declare-fun res!244106 () Bool)

(assert (=> b!418856 (=> (not res!244106) (not e!249707))))

(assert (=> b!418856 (= res!244106 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7142))))

(declare-fun b!418857 () Bool)

(declare-fun res!244112 () Bool)

(assert (=> b!418857 (=> (not res!244112) (not e!249705))))

(assert (=> b!418857 (= res!244112 (bvsle from!863 i!563))))

(declare-fun b!418858 () Bool)

(declare-fun +!1237 (ListLongMap!6045 tuple2!7132) ListLongMap!6045)

(assert (=> b!418858 (= e!249706 (= call!29167 (+!1237 call!29168 (tuple2!7133 k0!794 v!412))))))

(declare-fun b!418859 () Bool)

(declare-fun e!249708 () Bool)

(assert (=> b!418859 (= e!249700 (not e!249708))))

(declare-fun res!244119 () Bool)

(assert (=> b!418859 (=> res!244119 e!249708)))

(assert (=> b!418859 (= res!244119 (validKeyInArray!0 (select (arr!12190 _keys!709) from!863)))))

(assert (=> b!418859 e!249706))

(assert (=> b!418859 (= c!55208 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12380 0))(
  ( (Unit!12381) )
))
(declare-fun lt!192017 () Unit!12380)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!441 (array!25481 array!25483 (_ BitVec 32) (_ BitVec 32) V!15525 V!15525 (_ BitVec 32) (_ BitVec 64) V!15525 (_ BitVec 32) Int) Unit!12380)

(assert (=> b!418859 (= lt!192017 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!441 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418860 () Bool)

(declare-fun res!244115 () Bool)

(assert (=> b!418860 (=> (not res!244115) (not e!249707))))

(assert (=> b!418860 (= res!244115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418861 () Bool)

(declare-fun res!244107 () Bool)

(assert (=> b!418861 (=> (not res!244107) (not e!249707))))

(assert (=> b!418861 (= res!244107 (and (= (size!12543 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12542 _keys!709) (size!12543 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418862 () Bool)

(declare-fun res!244113 () Bool)

(assert (=> b!418862 (=> (not res!244113) (not e!249707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418862 (= res!244113 (validMask!0 mask!1025))))

(declare-fun b!418863 () Bool)

(declare-fun res!244117 () Bool)

(assert (=> b!418863 (=> (not res!244117) (not e!249707))))

(declare-fun arrayContainsKey!0 (array!25481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418863 (= res!244117 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418864 () Bool)

(assert (=> b!418864 (= e!249708 true)))

(declare-fun lt!192021 () ListLongMap!6045)

(declare-fun lt!192023 () tuple2!7132)

(declare-fun lt!192018 () V!15525)

(assert (=> b!418864 (= (+!1237 lt!192021 lt!192023) (+!1237 (+!1237 lt!192021 (tuple2!7133 k0!794 lt!192018)) lt!192023))))

(declare-fun lt!192020 () V!15525)

(assert (=> b!418864 (= lt!192023 (tuple2!7133 k0!794 lt!192020))))

(declare-fun lt!192013 () Unit!12380)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!36 (ListLongMap!6045 (_ BitVec 64) V!15525 V!15525) Unit!12380)

(assert (=> b!418864 (= lt!192013 (addSameAsAddTwiceSameKeyDiffValues!36 lt!192021 k0!794 lt!192018 lt!192020))))

(declare-fun lt!192016 () V!15525)

(declare-fun get!6042 (ValueCell!5064 V!15525) V!15525)

(assert (=> b!418864 (= lt!192018 (get!6042 (select (arr!12191 _values!549) from!863) lt!192016))))

(assert (=> b!418864 (= lt!192019 (+!1237 lt!192021 (tuple2!7133 (select (arr!12190 lt!192022) from!863) lt!192020)))))

(assert (=> b!418864 (= lt!192020 (get!6042 (select (store (arr!12191 _values!549) i!563 (ValueCellFull!5064 v!412)) from!863) lt!192016))))

(declare-fun dynLambda!707 (Int (_ BitVec 64)) V!15525)

(assert (=> b!418864 (= lt!192016 (dynLambda!707 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418864 (= lt!192021 (getCurrentListMapNoExtraKeys!1243 lt!192022 lt!192015 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17844 () Bool)

(declare-fun tp!34518 () Bool)

(assert (=> mapNonEmpty!17844 (= mapRes!17844 (and tp!34518 e!249703))))

(declare-fun mapRest!17844 () (Array (_ BitVec 32) ValueCell!5064))

(declare-fun mapValue!17844 () ValueCell!5064)

(declare-fun mapKey!17844 () (_ BitVec 32))

(assert (=> mapNonEmpty!17844 (= (arr!12191 _values!549) (store mapRest!17844 mapKey!17844 mapValue!17844))))

(assert (= (and start!39396 res!244109) b!418862))

(assert (= (and b!418862 res!244113) b!418861))

(assert (= (and b!418861 res!244107) b!418860))

(assert (= (and b!418860 res!244115) b!418856))

(assert (= (and b!418856 res!244106) b!418851))

(assert (= (and b!418851 res!244110) b!418850))

(assert (= (and b!418850 res!244116) b!418855))

(assert (= (and b!418855 res!244114) b!418863))

(assert (= (and b!418863 res!244117) b!418854))

(assert (= (and b!418854 res!244108) b!418846))

(assert (= (and b!418846 res!244118) b!418857))

(assert (= (and b!418857 res!244112) b!418848))

(assert (= (and b!418848 res!244111) b!418859))

(assert (= (and b!418859 c!55208) b!418858))

(assert (= (and b!418859 (not c!55208)) b!418847))

(assert (= (or b!418858 b!418847) bm!29164))

(assert (= (or b!418858 b!418847) bm!29165))

(assert (= (and b!418859 (not res!244119)) b!418864))

(assert (= (and b!418852 condMapEmpty!17844) mapIsEmpty!17844))

(assert (= (and b!418852 (not condMapEmpty!17844)) mapNonEmpty!17844))

(get-info :version)

(assert (= (and mapNonEmpty!17844 ((_ is ValueCellFull!5064) mapValue!17844)) b!418849))

(assert (= (and b!418852 ((_ is ValueCellFull!5064) mapDefault!17844)) b!418853))

(assert (= start!39396 b!418852))

(declare-fun b_lambda!8967 () Bool)

(assert (=> (not b_lambda!8967) (not b!418864)))

(declare-fun t!12471 () Bool)

(declare-fun tb!3285 () Bool)

(assert (=> (and start!39396 (= defaultEntry!557 defaultEntry!557) t!12471) tb!3285))

(declare-fun result!6097 () Bool)

(assert (=> tb!3285 (= result!6097 tp_is_empty!10815)))

(assert (=> b!418864 t!12471))

(declare-fun b_and!17203 () Bool)

(assert (= b_and!17201 (and (=> t!12471 result!6097) b_and!17203)))

(declare-fun m!408281 () Bool)

(assert (=> bm!29165 m!408281))

(declare-fun m!408283 () Bool)

(assert (=> b!418859 m!408283))

(assert (=> b!418859 m!408283))

(declare-fun m!408285 () Bool)

(assert (=> b!418859 m!408285))

(declare-fun m!408287 () Bool)

(assert (=> b!418859 m!408287))

(declare-fun m!408289 () Bool)

(assert (=> start!39396 m!408289))

(declare-fun m!408291 () Bool)

(assert (=> start!39396 m!408291))

(declare-fun m!408293 () Bool)

(assert (=> mapNonEmpty!17844 m!408293))

(declare-fun m!408295 () Bool)

(assert (=> b!418863 m!408295))

(declare-fun m!408297 () Bool)

(assert (=> b!418862 m!408297))

(declare-fun m!408299 () Bool)

(assert (=> b!418856 m!408299))

(declare-fun m!408301 () Bool)

(assert (=> b!418850 m!408301))

(declare-fun m!408303 () Bool)

(assert (=> b!418858 m!408303))

(declare-fun m!408305 () Bool)

(assert (=> b!418864 m!408305))

(declare-fun m!408307 () Bool)

(assert (=> b!418864 m!408307))

(declare-fun m!408309 () Bool)

(assert (=> b!418864 m!408309))

(declare-fun m!408311 () Bool)

(assert (=> b!418864 m!408311))

(declare-fun m!408313 () Bool)

(assert (=> b!418864 m!408313))

(declare-fun m!408315 () Bool)

(assert (=> b!418864 m!408315))

(declare-fun m!408317 () Bool)

(assert (=> b!418864 m!408317))

(declare-fun m!408319 () Bool)

(assert (=> b!418864 m!408319))

(declare-fun m!408321 () Bool)

(assert (=> b!418864 m!408321))

(assert (=> b!418864 m!408319))

(declare-fun m!408323 () Bool)

(assert (=> b!418864 m!408323))

(declare-fun m!408325 () Bool)

(assert (=> b!418864 m!408325))

(assert (=> b!418864 m!408305))

(declare-fun m!408327 () Bool)

(assert (=> b!418864 m!408327))

(declare-fun m!408329 () Bool)

(assert (=> b!418864 m!408329))

(assert (=> b!418864 m!408327))

(declare-fun m!408331 () Bool)

(assert (=> b!418848 m!408331))

(assert (=> b!418848 m!408317))

(declare-fun m!408333 () Bool)

(assert (=> b!418848 m!408333))

(declare-fun m!408335 () Bool)

(assert (=> bm!29164 m!408335))

(declare-fun m!408337 () Bool)

(assert (=> b!418855 m!408337))

(declare-fun m!408339 () Bool)

(assert (=> b!418846 m!408339))

(declare-fun m!408341 () Bool)

(assert (=> b!418854 m!408341))

(declare-fun m!408343 () Bool)

(assert (=> b!418854 m!408343))

(declare-fun m!408345 () Bool)

(assert (=> b!418860 m!408345))

(check-sat (not b!418846) (not b!418858) (not b_lambda!8967) (not b!418859) (not b!418856) (not b!418854) (not mapNonEmpty!17844) (not b_next!9663) (not b!418860) (not b!418864) (not start!39396) (not bm!29164) (not b!418863) (not b!418848) (not bm!29165) (not b!418850) (not b!418862) b_and!17203 tp_is_empty!10815)
(check-sat b_and!17203 (not b_next!9663))
