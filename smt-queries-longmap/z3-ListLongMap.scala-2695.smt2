; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39974 () Bool)

(assert start!39974)

(declare-fun b_free!10255 () Bool)

(declare-fun b_next!10255 () Bool)

(assert (=> start!39974 (= b_free!10255 (not b_next!10255))))

(declare-fun tp!36293 () Bool)

(declare-fun b_and!18183 () Bool)

(assert (=> start!39974 (= tp!36293 b_and!18183)))

(declare-fun b!435057 () Bool)

(declare-fun e!257053 () Bool)

(declare-fun e!257055 () Bool)

(assert (=> b!435057 (= e!257053 e!257055)))

(declare-fun res!256303 () Bool)

(assert (=> b!435057 (=> (not res!256303) (not e!257055))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435057 (= res!256303 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16315 0))(
  ( (V!16316 (val!5748 Int)) )
))
(declare-fun minValue!515 () V!16315)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7512 0))(
  ( (tuple2!7513 (_1!3767 (_ BitVec 64)) (_2!3767 V!16315)) )
))
(declare-datatypes ((List!7503 0))(
  ( (Nil!7500) (Cons!7499 (h!8355 tuple2!7512) (t!13199 List!7503)) )
))
(declare-datatypes ((ListLongMap!6427 0))(
  ( (ListLongMap!6428 (toList!3229 List!7503)) )
))
(declare-fun lt!200262 () ListLongMap!6427)

(declare-fun zeroValue!515 () V!16315)

(declare-datatypes ((array!26648 0))(
  ( (array!26649 (arr!12773 (Array (_ BitVec 32) (_ BitVec 64))) (size!13125 (_ BitVec 32))) )
))
(declare-fun lt!200272 () array!26648)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5360 0))(
  ( (ValueCellFull!5360 (v!7996 V!16315)) (EmptyCell!5360) )
))
(declare-datatypes ((array!26650 0))(
  ( (array!26651 (arr!12774 (Array (_ BitVec 32) ValueCell!5360)) (size!13126 (_ BitVec 32))) )
))
(declare-fun lt!200264 () array!26650)

(declare-fun getCurrentListMapNoExtraKeys!1464 (array!26648 array!26650 (_ BitVec 32) (_ BitVec 32) V!16315 V!16315 (_ BitVec 32) Int) ListLongMap!6427)

(assert (=> b!435057 (= lt!200262 (getCurrentListMapNoExtraKeys!1464 lt!200272 lt!200264 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26650)

(declare-fun v!412 () V!16315)

(assert (=> b!435057 (= lt!200264 (array!26651 (store (arr!12774 _values!549) i!563 (ValueCellFull!5360 v!412)) (size!13126 _values!549)))))

(declare-fun _keys!709 () array!26648)

(declare-fun lt!200268 () ListLongMap!6427)

(assert (=> b!435057 (= lt!200268 (getCurrentListMapNoExtraKeys!1464 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435058 () Bool)

(declare-fun res!256316 () Bool)

(declare-fun e!257056 () Bool)

(assert (=> b!435058 (=> (not res!256316) (not e!257056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435058 (= res!256316 (validMask!0 mask!1025))))

(declare-fun b!435059 () Bool)

(declare-datatypes ((Unit!12911 0))(
  ( (Unit!12912) )
))
(declare-fun e!257051 () Unit!12911)

(declare-fun Unit!12913 () Unit!12911)

(assert (=> b!435059 (= e!257051 Unit!12913)))

(declare-fun b!435060 () Bool)

(declare-fun res!256317 () Bool)

(assert (=> b!435060 (=> (not res!256317) (not e!257053))))

(declare-datatypes ((List!7504 0))(
  ( (Nil!7501) (Cons!7500 (h!8356 (_ BitVec 64)) (t!13200 List!7504)) )
))
(declare-fun arrayNoDuplicates!0 (array!26648 (_ BitVec 32) List!7504) Bool)

(assert (=> b!435060 (= res!256317 (arrayNoDuplicates!0 lt!200272 #b00000000000000000000000000000000 Nil!7501))))

(declare-fun res!256308 () Bool)

(assert (=> start!39974 (=> (not res!256308) (not e!257056))))

(assert (=> start!39974 (= res!256308 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13125 _keys!709))))))

(assert (=> start!39974 e!257056))

(declare-fun tp_is_empty!11407 () Bool)

(assert (=> start!39974 tp_is_empty!11407))

(assert (=> start!39974 tp!36293))

(assert (=> start!39974 true))

(declare-fun e!257050 () Bool)

(declare-fun array_inv!9346 (array!26650) Bool)

(assert (=> start!39974 (and (array_inv!9346 _values!549) e!257050)))

(declare-fun array_inv!9347 (array!26648) Bool)

(assert (=> start!39974 (array_inv!9347 _keys!709)))

(declare-fun b!435061 () Bool)

(declare-fun e!257058 () Bool)

(declare-fun mapRes!18732 () Bool)

(assert (=> b!435061 (= e!257050 (and e!257058 mapRes!18732))))

(declare-fun condMapEmpty!18732 () Bool)

(declare-fun mapDefault!18732 () ValueCell!5360)

(assert (=> b!435061 (= condMapEmpty!18732 (= (arr!12774 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5360)) mapDefault!18732)))))

(declare-fun b!435062 () Bool)

(declare-fun res!256306 () Bool)

(assert (=> b!435062 (=> (not res!256306) (not e!257056))))

(assert (=> b!435062 (= res!256306 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13125 _keys!709))))))

(declare-fun b!435063 () Bool)

(declare-fun res!256309 () Bool)

(assert (=> b!435063 (=> (not res!256309) (not e!257056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26648 (_ BitVec 32)) Bool)

(assert (=> b!435063 (= res!256309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435064 () Bool)

(declare-fun Unit!12914 () Unit!12911)

(assert (=> b!435064 (= e!257051 Unit!12914)))

(declare-fun lt!200265 () Unit!12911)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26648 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12911)

(assert (=> b!435064 (= lt!200265 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435064 false))

(declare-fun b!435065 () Bool)

(declare-fun e!257052 () Bool)

(assert (=> b!435065 (= e!257055 (not e!257052))))

(declare-fun res!256305 () Bool)

(assert (=> b!435065 (=> res!256305 e!257052)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435065 (= res!256305 (not (validKeyInArray!0 (select (arr!12773 _keys!709) from!863))))))

(declare-fun lt!200260 () ListLongMap!6427)

(declare-fun lt!200266 () ListLongMap!6427)

(assert (=> b!435065 (= lt!200260 lt!200266)))

(declare-fun lt!200273 () ListLongMap!6427)

(declare-fun lt!200274 () tuple2!7512)

(declare-fun +!1433 (ListLongMap!6427 tuple2!7512) ListLongMap!6427)

(assert (=> b!435065 (= lt!200266 (+!1433 lt!200273 lt!200274))))

(assert (=> b!435065 (= lt!200260 (getCurrentListMapNoExtraKeys!1464 lt!200272 lt!200264 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435065 (= lt!200274 (tuple2!7513 k0!794 v!412))))

(assert (=> b!435065 (= lt!200273 (getCurrentListMapNoExtraKeys!1464 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200267 () Unit!12911)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!596 (array!26648 array!26650 (_ BitVec 32) (_ BitVec 32) V!16315 V!16315 (_ BitVec 32) (_ BitVec 64) V!16315 (_ BitVec 32) Int) Unit!12911)

(assert (=> b!435065 (= lt!200267 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!596 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435066 () Bool)

(declare-fun res!256304 () Bool)

(assert (=> b!435066 (=> (not res!256304) (not e!257056))))

(assert (=> b!435066 (= res!256304 (validKeyInArray!0 k0!794))))

(declare-fun b!435067 () Bool)

(declare-fun e!257059 () Bool)

(assert (=> b!435067 (= e!257059 true)))

(declare-fun lt!200271 () ListLongMap!6427)

(declare-fun lt!200269 () tuple2!7512)

(assert (=> b!435067 (= lt!200271 (+!1433 (+!1433 lt!200273 lt!200269) lt!200274))))

(declare-fun lt!200263 () Unit!12911)

(declare-fun lt!200261 () V!16315)

(declare-fun addCommutativeForDiffKeys!403 (ListLongMap!6427 (_ BitVec 64) V!16315 (_ BitVec 64) V!16315) Unit!12911)

(assert (=> b!435067 (= lt!200263 (addCommutativeForDiffKeys!403 lt!200273 k0!794 v!412 (select (arr!12773 _keys!709) from!863) lt!200261))))

(declare-fun mapIsEmpty!18732 () Bool)

(assert (=> mapIsEmpty!18732 mapRes!18732))

(declare-fun b!435068 () Bool)

(assert (=> b!435068 (= e!257056 e!257053)))

(declare-fun res!256311 () Bool)

(assert (=> b!435068 (=> (not res!256311) (not e!257053))))

(assert (=> b!435068 (= res!256311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200272 mask!1025))))

(assert (=> b!435068 (= lt!200272 (array!26649 (store (arr!12773 _keys!709) i!563 k0!794) (size!13125 _keys!709)))))

(declare-fun b!435069 () Bool)

(declare-fun res!256310 () Bool)

(assert (=> b!435069 (=> (not res!256310) (not e!257053))))

(assert (=> b!435069 (= res!256310 (bvsle from!863 i!563))))

(declare-fun b!435070 () Bool)

(assert (=> b!435070 (= e!257052 e!257059)))

(declare-fun res!256307 () Bool)

(assert (=> b!435070 (=> res!256307 e!257059)))

(assert (=> b!435070 (= res!256307 (= k0!794 (select (arr!12773 _keys!709) from!863)))))

(assert (=> b!435070 (not (= (select (arr!12773 _keys!709) from!863) k0!794))))

(declare-fun lt!200270 () Unit!12911)

(assert (=> b!435070 (= lt!200270 e!257051)))

(declare-fun c!55695 () Bool)

(assert (=> b!435070 (= c!55695 (= (select (arr!12773 _keys!709) from!863) k0!794))))

(assert (=> b!435070 (= lt!200262 lt!200271)))

(assert (=> b!435070 (= lt!200271 (+!1433 lt!200266 lt!200269))))

(assert (=> b!435070 (= lt!200269 (tuple2!7513 (select (arr!12773 _keys!709) from!863) lt!200261))))

(declare-fun get!6374 (ValueCell!5360 V!16315) V!16315)

(declare-fun dynLambda!835 (Int (_ BitVec 64)) V!16315)

(assert (=> b!435070 (= lt!200261 (get!6374 (select (arr!12774 _values!549) from!863) (dynLambda!835 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435071 () Bool)

(assert (=> b!435071 (= e!257058 tp_is_empty!11407)))

(declare-fun b!435072 () Bool)

(declare-fun res!256312 () Bool)

(assert (=> b!435072 (=> (not res!256312) (not e!257056))))

(assert (=> b!435072 (= res!256312 (and (= (size!13126 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13125 _keys!709) (size!13126 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18732 () Bool)

(declare-fun tp!36294 () Bool)

(declare-fun e!257057 () Bool)

(assert (=> mapNonEmpty!18732 (= mapRes!18732 (and tp!36294 e!257057))))

(declare-fun mapRest!18732 () (Array (_ BitVec 32) ValueCell!5360))

(declare-fun mapValue!18732 () ValueCell!5360)

(declare-fun mapKey!18732 () (_ BitVec 32))

(assert (=> mapNonEmpty!18732 (= (arr!12774 _values!549) (store mapRest!18732 mapKey!18732 mapValue!18732))))

(declare-fun b!435073 () Bool)

(declare-fun res!256314 () Bool)

(assert (=> b!435073 (=> (not res!256314) (not e!257056))))

(assert (=> b!435073 (= res!256314 (or (= (select (arr!12773 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12773 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435074 () Bool)

(declare-fun res!256313 () Bool)

(assert (=> b!435074 (=> (not res!256313) (not e!257056))))

(assert (=> b!435074 (= res!256313 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7501))))

(declare-fun b!435075 () Bool)

(declare-fun res!256315 () Bool)

(assert (=> b!435075 (=> (not res!256315) (not e!257056))))

(declare-fun arrayContainsKey!0 (array!26648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435075 (= res!256315 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435076 () Bool)

(assert (=> b!435076 (= e!257057 tp_is_empty!11407)))

(assert (= (and start!39974 res!256308) b!435058))

(assert (= (and b!435058 res!256316) b!435072))

(assert (= (and b!435072 res!256312) b!435063))

(assert (= (and b!435063 res!256309) b!435074))

(assert (= (and b!435074 res!256313) b!435062))

(assert (= (and b!435062 res!256306) b!435066))

(assert (= (and b!435066 res!256304) b!435073))

(assert (= (and b!435073 res!256314) b!435075))

(assert (= (and b!435075 res!256315) b!435068))

(assert (= (and b!435068 res!256311) b!435060))

(assert (= (and b!435060 res!256317) b!435069))

(assert (= (and b!435069 res!256310) b!435057))

(assert (= (and b!435057 res!256303) b!435065))

(assert (= (and b!435065 (not res!256305)) b!435070))

(assert (= (and b!435070 c!55695) b!435064))

(assert (= (and b!435070 (not c!55695)) b!435059))

(assert (= (and b!435070 (not res!256307)) b!435067))

(assert (= (and b!435061 condMapEmpty!18732) mapIsEmpty!18732))

(assert (= (and b!435061 (not condMapEmpty!18732)) mapNonEmpty!18732))

(get-info :version)

(assert (= (and mapNonEmpty!18732 ((_ is ValueCellFull!5360) mapValue!18732)) b!435076))

(assert (= (and b!435061 ((_ is ValueCellFull!5360) mapDefault!18732)) b!435071))

(assert (= start!39974 b!435061))

(declare-fun b_lambda!9365 () Bool)

(assert (=> (not b_lambda!9365) (not b!435070)))

(declare-fun t!13198 () Bool)

(declare-fun tb!3653 () Bool)

(assert (=> (and start!39974 (= defaultEntry!557 defaultEntry!557) t!13198) tb!3653))

(declare-fun result!6841 () Bool)

(assert (=> tb!3653 (= result!6841 tp_is_empty!11407)))

(assert (=> b!435070 t!13198))

(declare-fun b_and!18185 () Bool)

(assert (= b_and!18183 (and (=> t!13198 result!6841) b_and!18185)))

(declare-fun m!423233 () Bool)

(assert (=> b!435065 m!423233))

(declare-fun m!423235 () Bool)

(assert (=> b!435065 m!423235))

(declare-fun m!423237 () Bool)

(assert (=> b!435065 m!423237))

(declare-fun m!423239 () Bool)

(assert (=> b!435065 m!423239))

(assert (=> b!435065 m!423233))

(declare-fun m!423241 () Bool)

(assert (=> b!435065 m!423241))

(declare-fun m!423243 () Bool)

(assert (=> b!435065 m!423243))

(declare-fun m!423245 () Bool)

(assert (=> b!435057 m!423245))

(declare-fun m!423247 () Bool)

(assert (=> b!435057 m!423247))

(declare-fun m!423249 () Bool)

(assert (=> b!435057 m!423249))

(declare-fun m!423251 () Bool)

(assert (=> b!435074 m!423251))

(declare-fun m!423253 () Bool)

(assert (=> b!435058 m!423253))

(declare-fun m!423255 () Bool)

(assert (=> b!435075 m!423255))

(assert (=> b!435070 m!423233))

(declare-fun m!423257 () Bool)

(assert (=> b!435070 m!423257))

(declare-fun m!423259 () Bool)

(assert (=> b!435070 m!423259))

(assert (=> b!435070 m!423259))

(assert (=> b!435070 m!423257))

(declare-fun m!423261 () Bool)

(assert (=> b!435070 m!423261))

(declare-fun m!423263 () Bool)

(assert (=> b!435070 m!423263))

(declare-fun m!423265 () Bool)

(assert (=> b!435063 m!423265))

(declare-fun m!423267 () Bool)

(assert (=> b!435066 m!423267))

(declare-fun m!423269 () Bool)

(assert (=> b!435068 m!423269))

(declare-fun m!423271 () Bool)

(assert (=> b!435068 m!423271))

(declare-fun m!423273 () Bool)

(assert (=> b!435064 m!423273))

(declare-fun m!423275 () Bool)

(assert (=> b!435073 m!423275))

(declare-fun m!423277 () Bool)

(assert (=> mapNonEmpty!18732 m!423277))

(declare-fun m!423279 () Bool)

(assert (=> start!39974 m!423279))

(declare-fun m!423281 () Bool)

(assert (=> start!39974 m!423281))

(declare-fun m!423283 () Bool)

(assert (=> b!435060 m!423283))

(declare-fun m!423285 () Bool)

(assert (=> b!435067 m!423285))

(assert (=> b!435067 m!423285))

(declare-fun m!423287 () Bool)

(assert (=> b!435067 m!423287))

(assert (=> b!435067 m!423233))

(assert (=> b!435067 m!423233))

(declare-fun m!423289 () Bool)

(assert (=> b!435067 m!423289))

(check-sat (not start!39974) (not b!435075) (not b!435070) (not b!435064) tp_is_empty!11407 (not b!435058) (not b!435060) (not b!435057) (not b!435074) (not b_lambda!9365) b_and!18185 (not b!435063) (not mapNonEmpty!18732) (not b!435065) (not b!435067) (not b!435066) (not b_next!10255) (not b!435068))
(check-sat b_and!18185 (not b_next!10255))
