; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39752 () Bool)

(assert start!39752)

(declare-fun b_free!10033 () Bool)

(declare-fun b_next!10033 () Bool)

(assert (=> start!39752 (= b_free!10033 (not b_next!10033))))

(declare-fun tp!35627 () Bool)

(declare-fun b_and!17699 () Bool)

(assert (=> start!39752 (= tp!35627 b_and!17699)))

(declare-fun b!428041 () Bool)

(declare-fun res!251276 () Bool)

(declare-fun e!253668 () Bool)

(assert (=> b!428041 (=> (not res!251276) (not e!253668))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428041 (= res!251276 (bvsle from!863 i!563))))

(declare-fun b!428042 () Bool)

(declare-fun res!251274 () Bool)

(declare-fun e!253666 () Bool)

(assert (=> b!428042 (=> (not res!251274) (not e!253666))))

(declare-datatypes ((array!26199 0))(
  ( (array!26200 (arr!12549 (Array (_ BitVec 32) (_ BitVec 64))) (size!12902 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26199)

(declare-datatypes ((List!7419 0))(
  ( (Nil!7416) (Cons!7415 (h!8271 (_ BitVec 64)) (t!12892 List!7419)) )
))
(declare-fun arrayNoDuplicates!0 (array!26199 (_ BitVec 32) List!7419) Bool)

(assert (=> b!428042 (= res!251274 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7416))))

(declare-fun b!428043 () Bool)

(declare-fun e!253674 () Bool)

(declare-fun e!253673 () Bool)

(assert (=> b!428043 (= e!253674 (not e!253673))))

(declare-fun res!251283 () Bool)

(assert (=> b!428043 (=> res!251283 e!253673)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428043 (= res!251283 (not (validKeyInArray!0 (select (arr!12549 _keys!709) from!863))))))

(declare-datatypes ((V!16019 0))(
  ( (V!16020 (val!5637 Int)) )
))
(declare-datatypes ((tuple2!7418 0))(
  ( (tuple2!7419 (_1!3720 (_ BitVec 64)) (_2!3720 V!16019)) )
))
(declare-datatypes ((List!7420 0))(
  ( (Nil!7417) (Cons!7416 (h!8272 tuple2!7418) (t!12893 List!7420)) )
))
(declare-datatypes ((ListLongMap!6321 0))(
  ( (ListLongMap!6322 (toList!3176 List!7420)) )
))
(declare-fun lt!195458 () ListLongMap!6321)

(declare-fun lt!195457 () ListLongMap!6321)

(assert (=> b!428043 (= lt!195458 lt!195457)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16019)

(declare-fun lt!195452 () ListLongMap!6321)

(declare-fun +!1355 (ListLongMap!6321 tuple2!7418) ListLongMap!6321)

(assert (=> b!428043 (= lt!195457 (+!1355 lt!195452 (tuple2!7419 k0!794 v!412)))))

(declare-fun minValue!515 () V!16019)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16019)

(declare-fun lt!195456 () array!26199)

(declare-datatypes ((ValueCell!5249 0))(
  ( (ValueCellFull!5249 (v!7878 V!16019)) (EmptyCell!5249) )
))
(declare-datatypes ((array!26201 0))(
  ( (array!26202 (arr!12550 (Array (_ BitVec 32) ValueCell!5249)) (size!12903 (_ BitVec 32))) )
))
(declare-fun lt!195461 () array!26201)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1383 (array!26199 array!26201 (_ BitVec 32) (_ BitVec 32) V!16019 V!16019 (_ BitVec 32) Int) ListLongMap!6321)

(assert (=> b!428043 (= lt!195458 (getCurrentListMapNoExtraKeys!1383 lt!195456 lt!195461 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!26201)

(assert (=> b!428043 (= lt!195452 (getCurrentListMapNoExtraKeys!1383 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12546 0))(
  ( (Unit!12547) )
))
(declare-fun lt!195454 () Unit!12546)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!521 (array!26199 array!26201 (_ BitVec 32) (_ BitVec 32) V!16019 V!16019 (_ BitVec 32) (_ BitVec 64) V!16019 (_ BitVec 32) Int) Unit!12546)

(assert (=> b!428043 (= lt!195454 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!521 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428044 () Bool)

(declare-fun res!251272 () Bool)

(assert (=> b!428044 (=> (not res!251272) (not e!253666))))

(assert (=> b!428044 (= res!251272 (validKeyInArray!0 k0!794))))

(declare-fun b!428045 () Bool)

(declare-fun e!253667 () Bool)

(declare-fun e!253672 () Bool)

(declare-fun mapRes!18399 () Bool)

(assert (=> b!428045 (= e!253667 (and e!253672 mapRes!18399))))

(declare-fun condMapEmpty!18399 () Bool)

(declare-fun mapDefault!18399 () ValueCell!5249)

(assert (=> b!428045 (= condMapEmpty!18399 (= (arr!12550 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5249)) mapDefault!18399)))))

(declare-fun b!428046 () Bool)

(declare-fun tp_is_empty!11185 () Bool)

(assert (=> b!428046 (= e!253672 tp_is_empty!11185)))

(declare-fun mapIsEmpty!18399 () Bool)

(assert (=> mapIsEmpty!18399 mapRes!18399))

(declare-fun mapNonEmpty!18399 () Bool)

(declare-fun tp!35628 () Bool)

(declare-fun e!253671 () Bool)

(assert (=> mapNonEmpty!18399 (= mapRes!18399 (and tp!35628 e!253671))))

(declare-fun mapRest!18399 () (Array (_ BitVec 32) ValueCell!5249))

(declare-fun mapValue!18399 () ValueCell!5249)

(declare-fun mapKey!18399 () (_ BitVec 32))

(assert (=> mapNonEmpty!18399 (= (arr!12550 _values!549) (store mapRest!18399 mapKey!18399 mapValue!18399))))

(declare-fun b!428048 () Bool)

(declare-fun res!251282 () Bool)

(assert (=> b!428048 (=> (not res!251282) (not e!253666))))

(declare-fun arrayContainsKey!0 (array!26199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428048 (= res!251282 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428049 () Bool)

(declare-fun res!251275 () Bool)

(assert (=> b!428049 (=> (not res!251275) (not e!253666))))

(assert (=> b!428049 (= res!251275 (or (= (select (arr!12549 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12549 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428050 () Bool)

(declare-fun e!253669 () Unit!12546)

(declare-fun Unit!12548 () Unit!12546)

(assert (=> b!428050 (= e!253669 Unit!12548)))

(declare-fun lt!195455 () Unit!12546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26199 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12546)

(assert (=> b!428050 (= lt!195455 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428050 false))

(declare-fun b!428051 () Bool)

(assert (=> b!428051 (= e!253668 e!253674)))

(declare-fun res!251271 () Bool)

(assert (=> b!428051 (=> (not res!251271) (not e!253674))))

(assert (=> b!428051 (= res!251271 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195459 () ListLongMap!6321)

(assert (=> b!428051 (= lt!195459 (getCurrentListMapNoExtraKeys!1383 lt!195456 lt!195461 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428051 (= lt!195461 (array!26202 (store (arr!12550 _values!549) i!563 (ValueCellFull!5249 v!412)) (size!12903 _values!549)))))

(declare-fun lt!195453 () ListLongMap!6321)

(assert (=> b!428051 (= lt!195453 (getCurrentListMapNoExtraKeys!1383 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428052 () Bool)

(assert (=> b!428052 (= e!253671 tp_is_empty!11185)))

(declare-fun b!428053 () Bool)

(declare-fun res!251270 () Bool)

(assert (=> b!428053 (=> (not res!251270) (not e!253666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428053 (= res!251270 (validMask!0 mask!1025))))

(declare-fun b!428054 () Bool)

(declare-fun res!251279 () Bool)

(assert (=> b!428054 (=> (not res!251279) (not e!253666))))

(assert (=> b!428054 (= res!251279 (and (= (size!12903 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12902 _keys!709) (size!12903 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428055 () Bool)

(assert (=> b!428055 (= e!253673 true)))

(assert (=> b!428055 (not (= (select (arr!12549 _keys!709) from!863) k0!794))))

(declare-fun lt!195460 () Unit!12546)

(assert (=> b!428055 (= lt!195460 e!253669)))

(declare-fun c!55314 () Bool)

(assert (=> b!428055 (= c!55314 (= (select (arr!12549 _keys!709) from!863) k0!794))))

(declare-fun get!6216 (ValueCell!5249 V!16019) V!16019)

(declare-fun dynLambda!754 (Int (_ BitVec 64)) V!16019)

(assert (=> b!428055 (= lt!195459 (+!1355 lt!195457 (tuple2!7419 (select (arr!12549 _keys!709) from!863) (get!6216 (select (arr!12550 _values!549) from!863) (dynLambda!754 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428056 () Bool)

(declare-fun Unit!12549 () Unit!12546)

(assert (=> b!428056 (= e!253669 Unit!12549)))

(declare-fun b!428057 () Bool)

(declare-fun res!251277 () Bool)

(assert (=> b!428057 (=> (not res!251277) (not e!253668))))

(assert (=> b!428057 (= res!251277 (arrayNoDuplicates!0 lt!195456 #b00000000000000000000000000000000 Nil!7416))))

(declare-fun b!428047 () Bool)

(declare-fun res!251278 () Bool)

(assert (=> b!428047 (=> (not res!251278) (not e!253666))))

(assert (=> b!428047 (= res!251278 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12902 _keys!709))))))

(declare-fun res!251273 () Bool)

(assert (=> start!39752 (=> (not res!251273) (not e!253666))))

(assert (=> start!39752 (= res!251273 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12902 _keys!709))))))

(assert (=> start!39752 e!253666))

(assert (=> start!39752 tp_is_empty!11185))

(assert (=> start!39752 tp!35627))

(assert (=> start!39752 true))

(declare-fun array_inv!9174 (array!26201) Bool)

(assert (=> start!39752 (and (array_inv!9174 _values!549) e!253667)))

(declare-fun array_inv!9175 (array!26199) Bool)

(assert (=> start!39752 (array_inv!9175 _keys!709)))

(declare-fun b!428058 () Bool)

(declare-fun res!251280 () Bool)

(assert (=> b!428058 (=> (not res!251280) (not e!253666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26199 (_ BitVec 32)) Bool)

(assert (=> b!428058 (= res!251280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428059 () Bool)

(assert (=> b!428059 (= e!253666 e!253668)))

(declare-fun res!251281 () Bool)

(assert (=> b!428059 (=> (not res!251281) (not e!253668))))

(assert (=> b!428059 (= res!251281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195456 mask!1025))))

(assert (=> b!428059 (= lt!195456 (array!26200 (store (arr!12549 _keys!709) i!563 k0!794) (size!12902 _keys!709)))))

(assert (= (and start!39752 res!251273) b!428053))

(assert (= (and b!428053 res!251270) b!428054))

(assert (= (and b!428054 res!251279) b!428058))

(assert (= (and b!428058 res!251280) b!428042))

(assert (= (and b!428042 res!251274) b!428047))

(assert (= (and b!428047 res!251278) b!428044))

(assert (= (and b!428044 res!251272) b!428049))

(assert (= (and b!428049 res!251275) b!428048))

(assert (= (and b!428048 res!251282) b!428059))

(assert (= (and b!428059 res!251281) b!428057))

(assert (= (and b!428057 res!251277) b!428041))

(assert (= (and b!428041 res!251276) b!428051))

(assert (= (and b!428051 res!251271) b!428043))

(assert (= (and b!428043 (not res!251283)) b!428055))

(assert (= (and b!428055 c!55314) b!428050))

(assert (= (and b!428055 (not c!55314)) b!428056))

(assert (= (and b!428045 condMapEmpty!18399) mapIsEmpty!18399))

(assert (= (and b!428045 (not condMapEmpty!18399)) mapNonEmpty!18399))

(get-info :version)

(assert (= (and mapNonEmpty!18399 ((_ is ValueCellFull!5249) mapValue!18399)) b!428052))

(assert (= (and b!428045 ((_ is ValueCellFull!5249) mapDefault!18399)) b!428046))

(assert (= start!39752 b!428045))

(declare-fun b_lambda!9103 () Bool)

(assert (=> (not b_lambda!9103) (not b!428055)))

(declare-fun t!12891 () Bool)

(declare-fun tb!3431 () Bool)

(assert (=> (and start!39752 (= defaultEntry!557 defaultEntry!557) t!12891) tb!3431))

(declare-fun result!6397 () Bool)

(assert (=> tb!3431 (= result!6397 tp_is_empty!11185)))

(assert (=> b!428055 t!12891))

(declare-fun b_and!17701 () Bool)

(assert (= b_and!17699 (and (=> t!12891 result!6397) b_and!17701)))

(declare-fun m!416025 () Bool)

(assert (=> b!428042 m!416025))

(declare-fun m!416027 () Bool)

(assert (=> b!428053 m!416027))

(declare-fun m!416029 () Bool)

(assert (=> b!428058 m!416029))

(declare-fun m!416031 () Bool)

(assert (=> b!428043 m!416031))

(declare-fun m!416033 () Bool)

(assert (=> b!428043 m!416033))

(declare-fun m!416035 () Bool)

(assert (=> b!428043 m!416035))

(declare-fun m!416037 () Bool)

(assert (=> b!428043 m!416037))

(assert (=> b!428043 m!416031))

(declare-fun m!416039 () Bool)

(assert (=> b!428043 m!416039))

(declare-fun m!416041 () Bool)

(assert (=> b!428043 m!416041))

(assert (=> b!428055 m!416031))

(declare-fun m!416043 () Bool)

(assert (=> b!428055 m!416043))

(declare-fun m!416045 () Bool)

(assert (=> b!428055 m!416045))

(declare-fun m!416047 () Bool)

(assert (=> b!428055 m!416047))

(assert (=> b!428055 m!416047))

(assert (=> b!428055 m!416043))

(declare-fun m!416049 () Bool)

(assert (=> b!428055 m!416049))

(declare-fun m!416051 () Bool)

(assert (=> b!428057 m!416051))

(declare-fun m!416053 () Bool)

(assert (=> start!39752 m!416053))

(declare-fun m!416055 () Bool)

(assert (=> start!39752 m!416055))

(declare-fun m!416057 () Bool)

(assert (=> b!428050 m!416057))

(declare-fun m!416059 () Bool)

(assert (=> mapNonEmpty!18399 m!416059))

(declare-fun m!416061 () Bool)

(assert (=> b!428048 m!416061))

(declare-fun m!416063 () Bool)

(assert (=> b!428059 m!416063))

(declare-fun m!416065 () Bool)

(assert (=> b!428059 m!416065))

(declare-fun m!416067 () Bool)

(assert (=> b!428044 m!416067))

(declare-fun m!416069 () Bool)

(assert (=> b!428051 m!416069))

(declare-fun m!416071 () Bool)

(assert (=> b!428051 m!416071))

(declare-fun m!416073 () Bool)

(assert (=> b!428051 m!416073))

(declare-fun m!416075 () Bool)

(assert (=> b!428049 m!416075))

(check-sat (not b_lambda!9103) (not b!428048) (not b!428053) (not b!428057) (not b!428059) (not b!428058) (not start!39752) (not b_next!10033) (not b!428055) (not b!428051) (not mapNonEmpty!18399) (not b!428044) b_and!17701 (not b!428050) (not b!428042) tp_is_empty!11185 (not b!428043))
(check-sat b_and!17701 (not b_next!10033))
