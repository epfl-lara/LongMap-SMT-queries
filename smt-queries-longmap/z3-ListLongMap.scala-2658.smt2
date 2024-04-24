; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39752 () Bool)

(assert start!39752)

(declare-fun b_free!10033 () Bool)

(declare-fun b_next!10033 () Bool)

(assert (=> start!39752 (= b_free!10033 (not b_next!10033))))

(declare-fun tp!35628 () Bool)

(declare-fun b_and!17739 () Bool)

(assert (=> start!39752 (= tp!35628 b_and!17739)))

(declare-fun mapNonEmpty!18399 () Bool)

(declare-fun mapRes!18399 () Bool)

(declare-fun tp!35627 () Bool)

(declare-fun e!253808 () Bool)

(assert (=> mapNonEmpty!18399 (= mapRes!18399 (and tp!35627 e!253808))))

(declare-fun mapKey!18399 () (_ BitVec 32))

(declare-datatypes ((V!16019 0))(
  ( (V!16020 (val!5637 Int)) )
))
(declare-datatypes ((ValueCell!5249 0))(
  ( (ValueCellFull!5249 (v!7885 V!16019)) (EmptyCell!5249) )
))
(declare-fun mapValue!18399 () ValueCell!5249)

(declare-fun mapRest!18399 () (Array (_ BitVec 32) ValueCell!5249))

(declare-datatypes ((array!26216 0))(
  ( (array!26217 (arr!12557 (Array (_ BitVec 32) ValueCell!5249)) (size!12909 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26216)

(assert (=> mapNonEmpty!18399 (= (arr!12557 _values!549) (store mapRest!18399 mapKey!18399 mapValue!18399))))

(declare-fun b!428263 () Bool)

(declare-fun res!251402 () Bool)

(declare-fun e!253811 () Bool)

(assert (=> b!428263 (=> (not res!251402) (not e!253811))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428263 (= res!251402 (validKeyInArray!0 k0!794))))

(declare-fun b!428264 () Bool)

(declare-fun tp_is_empty!11185 () Bool)

(assert (=> b!428264 (= e!253808 tp_is_empty!11185)))

(declare-fun b!428265 () Bool)

(declare-fun e!253814 () Bool)

(declare-fun e!253810 () Bool)

(assert (=> b!428265 (= e!253814 e!253810)))

(declare-fun res!251409 () Bool)

(assert (=> b!428265 (=> (not res!251409) (not e!253810))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428265 (= res!251409 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16019)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16019)

(declare-fun lt!195714 () array!26216)

(declare-datatypes ((array!26218 0))(
  ( (array!26219 (arr!12558 (Array (_ BitVec 32) (_ BitVec 64))) (size!12910 (_ BitVec 32))) )
))
(declare-fun lt!195708 () array!26218)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7318 0))(
  ( (tuple2!7319 (_1!3670 (_ BitVec 64)) (_2!3670 V!16019)) )
))
(declare-datatypes ((List!7320 0))(
  ( (Nil!7317) (Cons!7316 (h!8172 tuple2!7318) (t!12794 List!7320)) )
))
(declare-datatypes ((ListLongMap!6233 0))(
  ( (ListLongMap!6234 (toList!3132 List!7320)) )
))
(declare-fun lt!195707 () ListLongMap!6233)

(declare-fun getCurrentListMapNoExtraKeys!1377 (array!26218 array!26216 (_ BitVec 32) (_ BitVec 32) V!16019 V!16019 (_ BitVec 32) Int) ListLongMap!6233)

(assert (=> b!428265 (= lt!195707 (getCurrentListMapNoExtraKeys!1377 lt!195708 lt!195714 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16019)

(assert (=> b!428265 (= lt!195714 (array!26217 (store (arr!12557 _values!549) i!563 (ValueCellFull!5249 v!412)) (size!12909 _values!549)))))

(declare-fun lt!195706 () ListLongMap!6233)

(declare-fun _keys!709 () array!26218)

(assert (=> b!428265 (= lt!195706 (getCurrentListMapNoExtraKeys!1377 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428266 () Bool)

(declare-datatypes ((Unit!12559 0))(
  ( (Unit!12560) )
))
(declare-fun e!253809 () Unit!12559)

(declare-fun Unit!12561 () Unit!12559)

(assert (=> b!428266 (= e!253809 Unit!12561)))

(declare-fun b!428267 () Bool)

(declare-fun e!253816 () Bool)

(assert (=> b!428267 (= e!253816 true)))

(assert (=> b!428267 (not (= (select (arr!12558 _keys!709) from!863) k0!794))))

(declare-fun lt!195712 () Unit!12559)

(assert (=> b!428267 (= lt!195712 e!253809)))

(declare-fun c!55362 () Bool)

(assert (=> b!428267 (= c!55362 (= (select (arr!12558 _keys!709) from!863) k0!794))))

(declare-fun lt!195710 () ListLongMap!6233)

(declare-fun +!1344 (ListLongMap!6233 tuple2!7318) ListLongMap!6233)

(declare-fun get!6225 (ValueCell!5249 V!16019) V!16019)

(declare-fun dynLambda!760 (Int (_ BitVec 64)) V!16019)

(assert (=> b!428267 (= lt!195707 (+!1344 lt!195710 (tuple2!7319 (select (arr!12558 _keys!709) from!863) (get!6225 (select (arr!12557 _values!549) from!863) (dynLambda!760 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428268 () Bool)

(declare-fun e!253813 () Bool)

(declare-fun e!253815 () Bool)

(assert (=> b!428268 (= e!253813 (and e!253815 mapRes!18399))))

(declare-fun condMapEmpty!18399 () Bool)

(declare-fun mapDefault!18399 () ValueCell!5249)

(assert (=> b!428268 (= condMapEmpty!18399 (= (arr!12557 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5249)) mapDefault!18399)))))

(declare-fun b!428269 () Bool)

(declare-fun res!251405 () Bool)

(assert (=> b!428269 (=> (not res!251405) (not e!253811))))

(declare-datatypes ((List!7321 0))(
  ( (Nil!7318) (Cons!7317 (h!8173 (_ BitVec 64)) (t!12795 List!7321)) )
))
(declare-fun arrayNoDuplicates!0 (array!26218 (_ BitVec 32) List!7321) Bool)

(assert (=> b!428269 (= res!251405 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7318))))

(declare-fun b!428270 () Bool)

(declare-fun res!251407 () Bool)

(assert (=> b!428270 (=> (not res!251407) (not e!253814))))

(assert (=> b!428270 (= res!251407 (arrayNoDuplicates!0 lt!195708 #b00000000000000000000000000000000 Nil!7318))))

(declare-fun b!428271 () Bool)

(assert (=> b!428271 (= e!253810 (not e!253816))))

(declare-fun res!251408 () Bool)

(assert (=> b!428271 (=> res!251408 e!253816)))

(assert (=> b!428271 (= res!251408 (not (validKeyInArray!0 (select (arr!12558 _keys!709) from!863))))))

(declare-fun lt!195705 () ListLongMap!6233)

(assert (=> b!428271 (= lt!195705 lt!195710)))

(declare-fun lt!195711 () ListLongMap!6233)

(assert (=> b!428271 (= lt!195710 (+!1344 lt!195711 (tuple2!7319 k0!794 v!412)))))

(assert (=> b!428271 (= lt!195705 (getCurrentListMapNoExtraKeys!1377 lt!195708 lt!195714 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428271 (= lt!195711 (getCurrentListMapNoExtraKeys!1377 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195713 () Unit!12559)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!526 (array!26218 array!26216 (_ BitVec 32) (_ BitVec 32) V!16019 V!16019 (_ BitVec 32) (_ BitVec 64) V!16019 (_ BitVec 32) Int) Unit!12559)

(assert (=> b!428271 (= lt!195713 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!526 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428272 () Bool)

(declare-fun Unit!12562 () Unit!12559)

(assert (=> b!428272 (= e!253809 Unit!12562)))

(declare-fun lt!195709 () Unit!12559)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26218 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12559)

(assert (=> b!428272 (= lt!195709 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428272 false))

(declare-fun b!428273 () Bool)

(declare-fun res!251398 () Bool)

(assert (=> b!428273 (=> (not res!251398) (not e!253811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26218 (_ BitVec 32)) Bool)

(assert (=> b!428273 (= res!251398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428274 () Bool)

(declare-fun res!251401 () Bool)

(assert (=> b!428274 (=> (not res!251401) (not e!253811))))

(declare-fun arrayContainsKey!0 (array!26218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428274 (= res!251401 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428275 () Bool)

(declare-fun res!251404 () Bool)

(assert (=> b!428275 (=> (not res!251404) (not e!253811))))

(assert (=> b!428275 (= res!251404 (or (= (select (arr!12558 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12558 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428276 () Bool)

(assert (=> b!428276 (= e!253815 tp_is_empty!11185)))

(declare-fun res!251399 () Bool)

(assert (=> start!39752 (=> (not res!251399) (not e!253811))))

(assert (=> start!39752 (= res!251399 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12910 _keys!709))))))

(assert (=> start!39752 e!253811))

(assert (=> start!39752 tp_is_empty!11185))

(assert (=> start!39752 tp!35628))

(assert (=> start!39752 true))

(declare-fun array_inv!9216 (array!26216) Bool)

(assert (=> start!39752 (and (array_inv!9216 _values!549) e!253813)))

(declare-fun array_inv!9217 (array!26218) Bool)

(assert (=> start!39752 (array_inv!9217 _keys!709)))

(declare-fun b!428277 () Bool)

(assert (=> b!428277 (= e!253811 e!253814)))

(declare-fun res!251397 () Bool)

(assert (=> b!428277 (=> (not res!251397) (not e!253814))))

(assert (=> b!428277 (= res!251397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195708 mask!1025))))

(assert (=> b!428277 (= lt!195708 (array!26219 (store (arr!12558 _keys!709) i!563 k0!794) (size!12910 _keys!709)))))

(declare-fun b!428278 () Bool)

(declare-fun res!251400 () Bool)

(assert (=> b!428278 (=> (not res!251400) (not e!253811))))

(assert (=> b!428278 (= res!251400 (and (= (size!12909 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12910 _keys!709) (size!12909 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428279 () Bool)

(declare-fun res!251406 () Bool)

(assert (=> b!428279 (=> (not res!251406) (not e!253811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428279 (= res!251406 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18399 () Bool)

(assert (=> mapIsEmpty!18399 mapRes!18399))

(declare-fun b!428280 () Bool)

(declare-fun res!251396 () Bool)

(assert (=> b!428280 (=> (not res!251396) (not e!253814))))

(assert (=> b!428280 (= res!251396 (bvsle from!863 i!563))))

(declare-fun b!428281 () Bool)

(declare-fun res!251403 () Bool)

(assert (=> b!428281 (=> (not res!251403) (not e!253811))))

(assert (=> b!428281 (= res!251403 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12910 _keys!709))))))

(assert (= (and start!39752 res!251399) b!428279))

(assert (= (and b!428279 res!251406) b!428278))

(assert (= (and b!428278 res!251400) b!428273))

(assert (= (and b!428273 res!251398) b!428269))

(assert (= (and b!428269 res!251405) b!428281))

(assert (= (and b!428281 res!251403) b!428263))

(assert (= (and b!428263 res!251402) b!428275))

(assert (= (and b!428275 res!251404) b!428274))

(assert (= (and b!428274 res!251401) b!428277))

(assert (= (and b!428277 res!251397) b!428270))

(assert (= (and b!428270 res!251407) b!428280))

(assert (= (and b!428280 res!251396) b!428265))

(assert (= (and b!428265 res!251409) b!428271))

(assert (= (and b!428271 (not res!251408)) b!428267))

(assert (= (and b!428267 c!55362) b!428272))

(assert (= (and b!428267 (not c!55362)) b!428266))

(assert (= (and b!428268 condMapEmpty!18399) mapIsEmpty!18399))

(assert (= (and b!428268 (not condMapEmpty!18399)) mapNonEmpty!18399))

(get-info :version)

(assert (= (and mapNonEmpty!18399 ((_ is ValueCellFull!5249) mapValue!18399)) b!428264))

(assert (= (and b!428268 ((_ is ValueCellFull!5249) mapDefault!18399)) b!428276))

(assert (= start!39752 b!428268))

(declare-fun b_lambda!9143 () Bool)

(assert (=> (not b_lambda!9143) (not b!428267)))

(declare-fun t!12793 () Bool)

(declare-fun tb!3431 () Bool)

(assert (=> (and start!39752 (= defaultEntry!557 defaultEntry!557) t!12793) tb!3431))

(declare-fun result!6397 () Bool)

(assert (=> tb!3431 (= result!6397 tp_is_empty!11185)))

(assert (=> b!428267 t!12793))

(declare-fun b_and!17741 () Bool)

(assert (= b_and!17739 (and (=> t!12793 result!6397) b_and!17741)))

(declare-fun m!416975 () Bool)

(assert (=> b!428269 m!416975))

(declare-fun m!416977 () Bool)

(assert (=> b!428279 m!416977))

(declare-fun m!416979 () Bool)

(assert (=> mapNonEmpty!18399 m!416979))

(declare-fun m!416981 () Bool)

(assert (=> b!428273 m!416981))

(declare-fun m!416983 () Bool)

(assert (=> b!428277 m!416983))

(declare-fun m!416985 () Bool)

(assert (=> b!428277 m!416985))

(declare-fun m!416987 () Bool)

(assert (=> b!428275 m!416987))

(declare-fun m!416989 () Bool)

(assert (=> b!428271 m!416989))

(declare-fun m!416991 () Bool)

(assert (=> b!428271 m!416991))

(declare-fun m!416993 () Bool)

(assert (=> b!428271 m!416993))

(declare-fun m!416995 () Bool)

(assert (=> b!428271 m!416995))

(assert (=> b!428271 m!416989))

(declare-fun m!416997 () Bool)

(assert (=> b!428271 m!416997))

(declare-fun m!416999 () Bool)

(assert (=> b!428271 m!416999))

(declare-fun m!417001 () Bool)

(assert (=> b!428265 m!417001))

(declare-fun m!417003 () Bool)

(assert (=> b!428265 m!417003))

(declare-fun m!417005 () Bool)

(assert (=> b!428265 m!417005))

(declare-fun m!417007 () Bool)

(assert (=> b!428274 m!417007))

(assert (=> b!428267 m!416989))

(declare-fun m!417009 () Bool)

(assert (=> b!428267 m!417009))

(declare-fun m!417011 () Bool)

(assert (=> b!428267 m!417011))

(declare-fun m!417013 () Bool)

(assert (=> b!428267 m!417013))

(assert (=> b!428267 m!417013))

(assert (=> b!428267 m!417009))

(declare-fun m!417015 () Bool)

(assert (=> b!428267 m!417015))

(declare-fun m!417017 () Bool)

(assert (=> start!39752 m!417017))

(declare-fun m!417019 () Bool)

(assert (=> start!39752 m!417019))

(declare-fun m!417021 () Bool)

(assert (=> b!428272 m!417021))

(declare-fun m!417023 () Bool)

(assert (=> b!428263 m!417023))

(declare-fun m!417025 () Bool)

(assert (=> b!428270 m!417025))

(check-sat (not b!428269) (not b_next!10033) (not b!428279) (not b!428271) (not b_lambda!9143) tp_is_empty!11185 (not start!39752) (not b!428274) (not b!428265) (not b!428267) (not b!428270) (not b!428277) b_and!17741 (not b!428272) (not mapNonEmpty!18399) (not b!428273) (not b!428263))
(check-sat b_and!17741 (not b_next!10033))
