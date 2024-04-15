; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40780 () Bool)

(assert start!40780)

(declare-fun b_free!10783 () Bool)

(declare-fun b_next!10783 () Bool)

(assert (=> start!40780 (= b_free!10783 (not b_next!10783))))

(declare-fun tp!38171 () Bool)

(declare-fun b_and!18827 () Bool)

(assert (=> start!40780 (= tp!38171 b_and!18827)))

(declare-fun b!452200 () Bool)

(declare-fun e!264756 () Bool)

(declare-fun e!264753 () Bool)

(declare-fun mapRes!19818 () Bool)

(assert (=> b!452200 (= e!264756 (and e!264753 mapRes!19818))))

(declare-fun condMapEmpty!19818 () Bool)

(declare-datatypes ((V!17267 0))(
  ( (V!17268 (val!6105 Int)) )
))
(declare-datatypes ((ValueCell!5717 0))(
  ( (ValueCellFull!5717 (v!8358 V!17267)) (EmptyCell!5717) )
))
(declare-datatypes ((array!28039 0))(
  ( (array!28040 (arr!13464 (Array (_ BitVec 32) ValueCell!5717)) (size!13817 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28039)

(declare-fun mapDefault!19818 () ValueCell!5717)

(assert (=> b!452200 (= condMapEmpty!19818 (= (arr!13464 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5717)) mapDefault!19818)))))

(declare-fun b!452201 () Bool)

(declare-fun res!269384 () Bool)

(declare-fun e!264754 () Bool)

(assert (=> b!452201 (=> (not res!269384) (not e!264754))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28041 0))(
  ( (array!28042 (arr!13465 (Array (_ BitVec 32) (_ BitVec 64))) (size!13818 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28041)

(assert (=> b!452201 (= res!269384 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13818 _keys!709))))))

(declare-fun b!452203 () Bool)

(declare-fun res!269381 () Bool)

(assert (=> b!452203 (=> (not res!269381) (not e!264754))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!452203 (= res!269381 (and (= (size!13817 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13818 _keys!709) (size!13817 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452204 () Bool)

(declare-fun res!269383 () Bool)

(declare-fun e!264755 () Bool)

(assert (=> b!452204 (=> (not res!269383) (not e!264755))))

(declare-fun lt!205024 () array!28041)

(declare-datatypes ((List!8103 0))(
  ( (Nil!8100) (Cons!8099 (h!8955 (_ BitVec 64)) (t!13900 List!8103)) )
))
(declare-fun arrayNoDuplicates!0 (array!28041 (_ BitVec 32) List!8103) Bool)

(assert (=> b!452204 (= res!269383 (arrayNoDuplicates!0 lt!205024 #b00000000000000000000000000000000 Nil!8100))))

(declare-fun b!452205 () Bool)

(declare-fun res!269386 () Bool)

(assert (=> b!452205 (=> (not res!269386) (not e!264754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452205 (= res!269386 (validMask!0 mask!1025))))

(declare-fun b!452206 () Bool)

(declare-fun e!264750 () Bool)

(declare-datatypes ((tuple2!8044 0))(
  ( (tuple2!8045 (_1!4033 (_ BitVec 64)) (_2!4033 V!17267)) )
))
(declare-datatypes ((List!8104 0))(
  ( (Nil!8101) (Cons!8100 (h!8956 tuple2!8044) (t!13901 List!8104)) )
))
(declare-datatypes ((ListLongMap!6947 0))(
  ( (ListLongMap!6948 (toList!3489 List!8104)) )
))
(declare-fun call!29938 () ListLongMap!6947)

(declare-fun call!29937 () ListLongMap!6947)

(assert (=> b!452206 (= e!264750 (= call!29938 call!29937))))

(declare-fun bm!29934 () Bool)

(declare-fun minValue!515 () V!17267)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17267)

(declare-fun c!56052 () Bool)

(declare-fun lt!205026 () array!28039)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1685 (array!28041 array!28039 (_ BitVec 32) (_ BitVec 32) V!17267 V!17267 (_ BitVec 32) Int) ListLongMap!6947)

(assert (=> bm!29934 (= call!29937 (getCurrentListMapNoExtraKeys!1685 (ite c!56052 lt!205024 _keys!709) (ite c!56052 lt!205026 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452207 () Bool)

(declare-fun res!269389 () Bool)

(assert (=> b!452207 (=> (not res!269389) (not e!264754))))

(assert (=> b!452207 (= res!269389 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8100))))

(declare-fun mapNonEmpty!19818 () Bool)

(declare-fun tp!38172 () Bool)

(declare-fun e!264758 () Bool)

(assert (=> mapNonEmpty!19818 (= mapRes!19818 (and tp!38172 e!264758))))

(declare-fun mapRest!19818 () (Array (_ BitVec 32) ValueCell!5717))

(declare-fun mapValue!19818 () ValueCell!5717)

(declare-fun mapKey!19818 () (_ BitVec 32))

(assert (=> mapNonEmpty!19818 (= (arr!13464 _values!549) (store mapRest!19818 mapKey!19818 mapValue!19818))))

(declare-fun b!452208 () Bool)

(declare-fun e!264752 () Bool)

(declare-fun e!264757 () Bool)

(assert (=> b!452208 (= e!264752 (not e!264757))))

(declare-fun res!269385 () Bool)

(assert (=> b!452208 (=> res!269385 e!264757)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452208 (= res!269385 (validKeyInArray!0 (select (arr!13465 _keys!709) from!863)))))

(assert (=> b!452208 e!264750))

(assert (=> b!452208 (= c!56052 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13195 0))(
  ( (Unit!13196) )
))
(declare-fun lt!205021 () Unit!13195)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17267)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!724 (array!28041 array!28039 (_ BitVec 32) (_ BitVec 32) V!17267 V!17267 (_ BitVec 32) (_ BitVec 64) V!17267 (_ BitVec 32) Int) Unit!13195)

(assert (=> b!452208 (= lt!205021 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!724 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452209 () Bool)

(declare-fun res!269390 () Bool)

(assert (=> b!452209 (=> (not res!269390) (not e!264754))))

(declare-fun arrayContainsKey!0 (array!28041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452209 (= res!269390 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452210 () Bool)

(declare-fun res!269382 () Bool)

(assert (=> b!452210 (=> (not res!269382) (not e!264754))))

(assert (=> b!452210 (= res!269382 (validKeyInArray!0 k0!794))))

(declare-fun b!452211 () Bool)

(declare-fun tp_is_empty!12121 () Bool)

(assert (=> b!452211 (= e!264753 tp_is_empty!12121)))

(declare-fun res!269377 () Bool)

(assert (=> start!40780 (=> (not res!269377) (not e!264754))))

(assert (=> start!40780 (= res!269377 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13818 _keys!709))))))

(assert (=> start!40780 e!264754))

(assert (=> start!40780 tp_is_empty!12121))

(assert (=> start!40780 tp!38171))

(assert (=> start!40780 true))

(declare-fun array_inv!9812 (array!28039) Bool)

(assert (=> start!40780 (and (array_inv!9812 _values!549) e!264756)))

(declare-fun array_inv!9813 (array!28041) Bool)

(assert (=> start!40780 (array_inv!9813 _keys!709)))

(declare-fun b!452202 () Bool)

(assert (=> b!452202 (= e!264754 e!264755)))

(declare-fun res!269387 () Bool)

(assert (=> b!452202 (=> (not res!269387) (not e!264755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28041 (_ BitVec 32)) Bool)

(assert (=> b!452202 (= res!269387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205024 mask!1025))))

(assert (=> b!452202 (= lt!205024 (array!28042 (store (arr!13465 _keys!709) i!563 k0!794) (size!13818 _keys!709)))))

(declare-fun b!452212 () Bool)

(declare-fun +!1586 (ListLongMap!6947 tuple2!8044) ListLongMap!6947)

(assert (=> b!452212 (= e!264750 (= call!29937 (+!1586 call!29938 (tuple2!8045 k0!794 v!412))))))

(declare-fun mapIsEmpty!19818 () Bool)

(assert (=> mapIsEmpty!19818 mapRes!19818))

(declare-fun b!452213 () Bool)

(declare-fun res!269388 () Bool)

(assert (=> b!452213 (=> (not res!269388) (not e!264754))))

(assert (=> b!452213 (= res!269388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452214 () Bool)

(declare-fun res!269378 () Bool)

(assert (=> b!452214 (=> (not res!269378) (not e!264755))))

(assert (=> b!452214 (= res!269378 (bvsle from!863 i!563))))

(declare-fun b!452215 () Bool)

(declare-fun res!269380 () Bool)

(assert (=> b!452215 (=> (not res!269380) (not e!264754))))

(assert (=> b!452215 (= res!269380 (or (= (select (arr!13465 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13465 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452216 () Bool)

(assert (=> b!452216 (= e!264757 (bvslt i!563 (size!13817 _values!549)))))

(declare-fun lt!205027 () ListLongMap!6947)

(declare-fun lt!205029 () tuple2!8044)

(declare-fun lt!205030 () V!17267)

(assert (=> b!452216 (= (+!1586 lt!205027 lt!205029) (+!1586 (+!1586 lt!205027 (tuple2!8045 k0!794 lt!205030)) lt!205029))))

(declare-fun lt!205023 () V!17267)

(assert (=> b!452216 (= lt!205029 (tuple2!8045 k0!794 lt!205023))))

(declare-fun lt!205025 () Unit!13195)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!82 (ListLongMap!6947 (_ BitVec 64) V!17267 V!17267) Unit!13195)

(assert (=> b!452216 (= lt!205025 (addSameAsAddTwiceSameKeyDiffValues!82 lt!205027 k0!794 lt!205030 lt!205023))))

(declare-fun lt!205028 () V!17267)

(declare-fun get!6637 (ValueCell!5717 V!17267) V!17267)

(assert (=> b!452216 (= lt!205030 (get!6637 (select (arr!13464 _values!549) from!863) lt!205028))))

(declare-fun lt!205022 () ListLongMap!6947)

(assert (=> b!452216 (= lt!205022 (+!1586 lt!205027 (tuple2!8045 (select (arr!13465 lt!205024) from!863) lt!205023)))))

(assert (=> b!452216 (= lt!205023 (get!6637 (select (store (arr!13464 _values!549) i!563 (ValueCellFull!5717 v!412)) from!863) lt!205028))))

(declare-fun dynLambda!861 (Int (_ BitVec 64)) V!17267)

(assert (=> b!452216 (= lt!205028 (dynLambda!861 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452216 (= lt!205027 (getCurrentListMapNoExtraKeys!1685 lt!205024 lt!205026 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29935 () Bool)

(assert (=> bm!29935 (= call!29938 (getCurrentListMapNoExtraKeys!1685 (ite c!56052 _keys!709 lt!205024) (ite c!56052 _values!549 lt!205026) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452217 () Bool)

(assert (=> b!452217 (= e!264755 e!264752)))

(declare-fun res!269379 () Bool)

(assert (=> b!452217 (=> (not res!269379) (not e!264752))))

(assert (=> b!452217 (= res!269379 (= from!863 i!563))))

(assert (=> b!452217 (= lt!205022 (getCurrentListMapNoExtraKeys!1685 lt!205024 lt!205026 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452217 (= lt!205026 (array!28040 (store (arr!13464 _values!549) i!563 (ValueCellFull!5717 v!412)) (size!13817 _values!549)))))

(declare-fun lt!205031 () ListLongMap!6947)

(assert (=> b!452217 (= lt!205031 (getCurrentListMapNoExtraKeys!1685 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452218 () Bool)

(assert (=> b!452218 (= e!264758 tp_is_empty!12121)))

(assert (= (and start!40780 res!269377) b!452205))

(assert (= (and b!452205 res!269386) b!452203))

(assert (= (and b!452203 res!269381) b!452213))

(assert (= (and b!452213 res!269388) b!452207))

(assert (= (and b!452207 res!269389) b!452201))

(assert (= (and b!452201 res!269384) b!452210))

(assert (= (and b!452210 res!269382) b!452215))

(assert (= (and b!452215 res!269380) b!452209))

(assert (= (and b!452209 res!269390) b!452202))

(assert (= (and b!452202 res!269387) b!452204))

(assert (= (and b!452204 res!269383) b!452214))

(assert (= (and b!452214 res!269378) b!452217))

(assert (= (and b!452217 res!269379) b!452208))

(assert (= (and b!452208 c!56052) b!452212))

(assert (= (and b!452208 (not c!56052)) b!452206))

(assert (= (or b!452212 b!452206) bm!29934))

(assert (= (or b!452212 b!452206) bm!29935))

(assert (= (and b!452208 (not res!269385)) b!452216))

(assert (= (and b!452200 condMapEmpty!19818) mapIsEmpty!19818))

(assert (= (and b!452200 (not condMapEmpty!19818)) mapNonEmpty!19818))

(get-info :version)

(assert (= (and mapNonEmpty!19818 ((_ is ValueCellFull!5717) mapValue!19818)) b!452218))

(assert (= (and b!452200 ((_ is ValueCellFull!5717) mapDefault!19818)) b!452211))

(assert (= start!40780 b!452200))

(declare-fun b_lambda!9543 () Bool)

(assert (=> (not b_lambda!9543) (not b!452216)))

(declare-fun t!13899 () Bool)

(declare-fun tb!3755 () Bool)

(assert (=> (and start!40780 (= defaultEntry!557 defaultEntry!557) t!13899) tb!3755))

(declare-fun result!7055 () Bool)

(assert (=> tb!3755 (= result!7055 tp_is_empty!12121)))

(assert (=> b!452216 t!13899))

(declare-fun b_and!18829 () Bool)

(assert (= b_and!18827 (and (=> t!13899 result!7055) b_and!18829)))

(declare-fun m!435461 () Bool)

(assert (=> b!452213 m!435461))

(declare-fun m!435463 () Bool)

(assert (=> b!452210 m!435463))

(declare-fun m!435465 () Bool)

(assert (=> bm!29935 m!435465))

(declare-fun m!435467 () Bool)

(assert (=> b!452208 m!435467))

(assert (=> b!452208 m!435467))

(declare-fun m!435469 () Bool)

(assert (=> b!452208 m!435469))

(declare-fun m!435471 () Bool)

(assert (=> b!452208 m!435471))

(declare-fun m!435473 () Bool)

(assert (=> mapNonEmpty!19818 m!435473))

(declare-fun m!435475 () Bool)

(assert (=> b!452217 m!435475))

(declare-fun m!435477 () Bool)

(assert (=> b!452217 m!435477))

(declare-fun m!435479 () Bool)

(assert (=> b!452217 m!435479))

(declare-fun m!435481 () Bool)

(assert (=> b!452212 m!435481))

(declare-fun m!435483 () Bool)

(assert (=> b!452216 m!435483))

(declare-fun m!435485 () Bool)

(assert (=> b!452216 m!435485))

(declare-fun m!435487 () Bool)

(assert (=> b!452216 m!435487))

(declare-fun m!435489 () Bool)

(assert (=> b!452216 m!435489))

(declare-fun m!435491 () Bool)

(assert (=> b!452216 m!435491))

(declare-fun m!435493 () Bool)

(assert (=> b!452216 m!435493))

(declare-fun m!435495 () Bool)

(assert (=> b!452216 m!435495))

(declare-fun m!435497 () Bool)

(assert (=> b!452216 m!435497))

(assert (=> b!452216 m!435483))

(assert (=> b!452216 m!435477))

(declare-fun m!435499 () Bool)

(assert (=> b!452216 m!435499))

(declare-fun m!435501 () Bool)

(assert (=> b!452216 m!435501))

(assert (=> b!452216 m!435497))

(declare-fun m!435503 () Bool)

(assert (=> b!452216 m!435503))

(assert (=> b!452216 m!435493))

(declare-fun m!435505 () Bool)

(assert (=> b!452216 m!435505))

(declare-fun m!435507 () Bool)

(assert (=> b!452205 m!435507))

(declare-fun m!435509 () Bool)

(assert (=> b!452204 m!435509))

(declare-fun m!435511 () Bool)

(assert (=> b!452207 m!435511))

(declare-fun m!435513 () Bool)

(assert (=> start!40780 m!435513))

(declare-fun m!435515 () Bool)

(assert (=> start!40780 m!435515))

(declare-fun m!435517 () Bool)

(assert (=> b!452209 m!435517))

(declare-fun m!435519 () Bool)

(assert (=> b!452215 m!435519))

(declare-fun m!435521 () Bool)

(assert (=> bm!29934 m!435521))

(declare-fun m!435523 () Bool)

(assert (=> b!452202 m!435523))

(declare-fun m!435525 () Bool)

(assert (=> b!452202 m!435525))

(check-sat (not start!40780) (not b!452202) (not b!452210) (not b!452209) (not b!452207) (not b!452212) (not b!452208) (not b!452204) (not b!452216) (not b_lambda!9543) (not b!452205) (not b_next!10783) (not b!452213) (not bm!29935) (not b!452217) b_and!18829 tp_is_empty!12121 (not bm!29934) (not mapNonEmpty!19818))
(check-sat b_and!18829 (not b_next!10783))
