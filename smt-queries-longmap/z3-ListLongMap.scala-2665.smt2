; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39794 () Bool)

(assert start!39794)

(declare-fun b_free!10075 () Bool)

(declare-fun b_next!10075 () Bool)

(assert (=> start!39794 (= b_free!10075 (not b_next!10075))))

(declare-fun tp!35753 () Bool)

(declare-fun b_and!17783 () Bool)

(assert (=> start!39794 (= tp!35753 b_and!17783)))

(declare-fun mapIsEmpty!18462 () Bool)

(declare-fun mapRes!18462 () Bool)

(assert (=> mapIsEmpty!18462 mapRes!18462))

(declare-fun b!429280 () Bool)

(declare-fun res!252152 () Bool)

(declare-fun e!254234 () Bool)

(assert (=> b!429280 (=> (not res!252152) (not e!254234))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26283 0))(
  ( (array!26284 (arr!12591 (Array (_ BitVec 32) (_ BitVec 64))) (size!12944 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26283)

(assert (=> b!429280 (= res!252152 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12944 _keys!709))))))

(declare-fun b!429281 () Bool)

(declare-datatypes ((Unit!12613 0))(
  ( (Unit!12614) )
))
(declare-fun e!254240 () Unit!12613)

(declare-fun Unit!12615 () Unit!12613)

(assert (=> b!429281 (= e!254240 Unit!12615)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!196083 () Unit!12613)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12613)

(assert (=> b!429281 (= lt!196083 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429281 false))

(declare-fun mapNonEmpty!18462 () Bool)

(declare-fun tp!35754 () Bool)

(declare-fun e!254241 () Bool)

(assert (=> mapNonEmpty!18462 (= mapRes!18462 (and tp!35754 e!254241))))

(declare-datatypes ((V!16075 0))(
  ( (V!16076 (val!5658 Int)) )
))
(declare-datatypes ((ValueCell!5270 0))(
  ( (ValueCellFull!5270 (v!7899 V!16075)) (EmptyCell!5270) )
))
(declare-fun mapRest!18462 () (Array (_ BitVec 32) ValueCell!5270))

(declare-datatypes ((array!26285 0))(
  ( (array!26286 (arr!12592 (Array (_ BitVec 32) ValueCell!5270)) (size!12945 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26285)

(declare-fun mapValue!18462 () ValueCell!5270)

(declare-fun mapKey!18462 () (_ BitVec 32))

(assert (=> mapNonEmpty!18462 (= (arr!12592 _values!549) (store mapRest!18462 mapKey!18462 mapValue!18462))))

(declare-fun b!429282 () Bool)

(declare-fun res!252164 () Bool)

(declare-fun e!254239 () Bool)

(assert (=> b!429282 (=> (not res!252164) (not e!254239))))

(assert (=> b!429282 (= res!252164 (bvsle from!863 i!563))))

(declare-fun b!429283 () Bool)

(declare-fun e!254233 () Bool)

(declare-fun tp_is_empty!11227 () Bool)

(assert (=> b!429283 (= e!254233 tp_is_empty!11227)))

(declare-fun b!429284 () Bool)

(declare-fun res!252165 () Bool)

(assert (=> b!429284 (=> (not res!252165) (not e!254234))))

(assert (=> b!429284 (= res!252165 (or (= (select (arr!12591 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12591 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429285 () Bool)

(declare-fun res!252160 () Bool)

(assert (=> b!429285 (=> (not res!252160) (not e!254234))))

(declare-datatypes ((List!7455 0))(
  ( (Nil!7452) (Cons!7451 (h!8307 (_ BitVec 64)) (t!12970 List!7455)) )
))
(declare-fun arrayNoDuplicates!0 (array!26283 (_ BitVec 32) List!7455) Bool)

(assert (=> b!429285 (= res!252160 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7452))))

(declare-fun b!429286 () Bool)

(assert (=> b!429286 (= e!254241 tp_is_empty!11227)))

(declare-fun b!429287 () Bool)

(declare-fun res!252159 () Bool)

(assert (=> b!429287 (=> (not res!252159) (not e!254234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429287 (= res!252159 (validKeyInArray!0 k0!794))))

(declare-fun b!429288 () Bool)

(declare-fun Unit!12616 () Unit!12613)

(assert (=> b!429288 (= e!254240 Unit!12616)))

(declare-fun b!429290 () Bool)

(declare-fun res!252158 () Bool)

(assert (=> b!429290 (=> (not res!252158) (not e!254234))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!429290 (= res!252158 (and (= (size!12945 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12944 _keys!709) (size!12945 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429291 () Bool)

(declare-fun res!252156 () Bool)

(assert (=> b!429291 (=> (not res!252156) (not e!254239))))

(declare-fun lt!196084 () array!26283)

(assert (=> b!429291 (= res!252156 (arrayNoDuplicates!0 lt!196084 #b00000000000000000000000000000000 Nil!7452))))

(declare-fun b!429292 () Bool)

(declare-fun e!254235 () Bool)

(declare-fun e!254236 () Bool)

(assert (=> b!429292 (= e!254235 (not e!254236))))

(declare-fun res!252163 () Bool)

(assert (=> b!429292 (=> res!252163 e!254236)))

(assert (=> b!429292 (= res!252163 (not (validKeyInArray!0 (select (arr!12591 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7456 0))(
  ( (tuple2!7457 (_1!3739 (_ BitVec 64)) (_2!3739 V!16075)) )
))
(declare-datatypes ((List!7456 0))(
  ( (Nil!7453) (Cons!7452 (h!8308 tuple2!7456) (t!12971 List!7456)) )
))
(declare-datatypes ((ListLongMap!6359 0))(
  ( (ListLongMap!6360 (toList!3195 List!7456)) )
))
(declare-fun lt!196089 () ListLongMap!6359)

(declare-fun lt!196088 () ListLongMap!6359)

(assert (=> b!429292 (= lt!196089 lt!196088)))

(declare-fun lt!196087 () ListLongMap!6359)

(declare-fun v!412 () V!16075)

(declare-fun +!1373 (ListLongMap!6359 tuple2!7456) ListLongMap!6359)

(assert (=> b!429292 (= lt!196088 (+!1373 lt!196087 (tuple2!7457 k0!794 v!412)))))

(declare-fun minValue!515 () V!16075)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16075)

(declare-fun lt!196085 () array!26285)

(declare-fun getCurrentListMapNoExtraKeys!1402 (array!26283 array!26285 (_ BitVec 32) (_ BitVec 32) V!16075 V!16075 (_ BitVec 32) Int) ListLongMap!6359)

(assert (=> b!429292 (= lt!196089 (getCurrentListMapNoExtraKeys!1402 lt!196084 lt!196085 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429292 (= lt!196087 (getCurrentListMapNoExtraKeys!1402 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196086 () Unit!12613)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!538 (array!26283 array!26285 (_ BitVec 32) (_ BitVec 32) V!16075 V!16075 (_ BitVec 32) (_ BitVec 64) V!16075 (_ BitVec 32) Int) Unit!12613)

(assert (=> b!429292 (= lt!196086 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!538 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429293 () Bool)

(declare-fun res!252155 () Bool)

(assert (=> b!429293 (=> (not res!252155) (not e!254234))))

(declare-fun arrayContainsKey!0 (array!26283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429293 (= res!252155 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429294 () Bool)

(declare-fun res!252154 () Bool)

(assert (=> b!429294 (=> (not res!252154) (not e!254234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26283 (_ BitVec 32)) Bool)

(assert (=> b!429294 (= res!252154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429295 () Bool)

(assert (=> b!429295 (= e!254236 true)))

(assert (=> b!429295 (not (= (select (arr!12591 _keys!709) from!863) k0!794))))

(declare-fun lt!196082 () Unit!12613)

(assert (=> b!429295 (= lt!196082 e!254240)))

(declare-fun c!55377 () Bool)

(assert (=> b!429295 (= c!55377 (= (select (arr!12591 _keys!709) from!863) k0!794))))

(declare-fun lt!196090 () ListLongMap!6359)

(declare-fun get!6245 (ValueCell!5270 V!16075) V!16075)

(declare-fun dynLambda!769 (Int (_ BitVec 64)) V!16075)

(assert (=> b!429295 (= lt!196090 (+!1373 lt!196088 (tuple2!7457 (select (arr!12591 _keys!709) from!863) (get!6245 (select (arr!12592 _values!549) from!863) (dynLambda!769 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!252162 () Bool)

(assert (=> start!39794 (=> (not res!252162) (not e!254234))))

(assert (=> start!39794 (= res!252162 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12944 _keys!709))))))

(assert (=> start!39794 e!254234))

(assert (=> start!39794 tp_is_empty!11227))

(assert (=> start!39794 tp!35753))

(assert (=> start!39794 true))

(declare-fun e!254238 () Bool)

(declare-fun array_inv!9204 (array!26285) Bool)

(assert (=> start!39794 (and (array_inv!9204 _values!549) e!254238)))

(declare-fun array_inv!9205 (array!26283) Bool)

(assert (=> start!39794 (array_inv!9205 _keys!709)))

(declare-fun b!429289 () Bool)

(assert (=> b!429289 (= e!254234 e!254239)))

(declare-fun res!252161 () Bool)

(assert (=> b!429289 (=> (not res!252161) (not e!254239))))

(assert (=> b!429289 (= res!252161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196084 mask!1025))))

(assert (=> b!429289 (= lt!196084 (array!26284 (store (arr!12591 _keys!709) i!563 k0!794) (size!12944 _keys!709)))))

(declare-fun b!429296 () Bool)

(assert (=> b!429296 (= e!254239 e!254235)))

(declare-fun res!252153 () Bool)

(assert (=> b!429296 (=> (not res!252153) (not e!254235))))

(assert (=> b!429296 (= res!252153 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!429296 (= lt!196090 (getCurrentListMapNoExtraKeys!1402 lt!196084 lt!196085 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429296 (= lt!196085 (array!26286 (store (arr!12592 _values!549) i!563 (ValueCellFull!5270 v!412)) (size!12945 _values!549)))))

(declare-fun lt!196091 () ListLongMap!6359)

(assert (=> b!429296 (= lt!196091 (getCurrentListMapNoExtraKeys!1402 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429297 () Bool)

(declare-fun res!252157 () Bool)

(assert (=> b!429297 (=> (not res!252157) (not e!254234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429297 (= res!252157 (validMask!0 mask!1025))))

(declare-fun b!429298 () Bool)

(assert (=> b!429298 (= e!254238 (and e!254233 mapRes!18462))))

(declare-fun condMapEmpty!18462 () Bool)

(declare-fun mapDefault!18462 () ValueCell!5270)

(assert (=> b!429298 (= condMapEmpty!18462 (= (arr!12592 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5270)) mapDefault!18462)))))

(assert (= (and start!39794 res!252162) b!429297))

(assert (= (and b!429297 res!252157) b!429290))

(assert (= (and b!429290 res!252158) b!429294))

(assert (= (and b!429294 res!252154) b!429285))

(assert (= (and b!429285 res!252160) b!429280))

(assert (= (and b!429280 res!252152) b!429287))

(assert (= (and b!429287 res!252159) b!429284))

(assert (= (and b!429284 res!252165) b!429293))

(assert (= (and b!429293 res!252155) b!429289))

(assert (= (and b!429289 res!252161) b!429291))

(assert (= (and b!429291 res!252156) b!429282))

(assert (= (and b!429282 res!252164) b!429296))

(assert (= (and b!429296 res!252153) b!429292))

(assert (= (and b!429292 (not res!252163)) b!429295))

(assert (= (and b!429295 c!55377) b!429281))

(assert (= (and b!429295 (not c!55377)) b!429288))

(assert (= (and b!429298 condMapEmpty!18462) mapIsEmpty!18462))

(assert (= (and b!429298 (not condMapEmpty!18462)) mapNonEmpty!18462))

(get-info :version)

(assert (= (and mapNonEmpty!18462 ((_ is ValueCellFull!5270) mapValue!18462)) b!429286))

(assert (= (and b!429298 ((_ is ValueCellFull!5270) mapDefault!18462)) b!429283))

(assert (= start!39794 b!429298))

(declare-fun b_lambda!9145 () Bool)

(assert (=> (not b_lambda!9145) (not b!429295)))

(declare-fun t!12969 () Bool)

(declare-fun tb!3473 () Bool)

(assert (=> (and start!39794 (= defaultEntry!557 defaultEntry!557) t!12969) tb!3473))

(declare-fun result!6481 () Bool)

(assert (=> tb!3473 (= result!6481 tp_is_empty!11227)))

(assert (=> b!429295 t!12969))

(declare-fun b_and!17785 () Bool)

(assert (= b_and!17783 (and (=> t!12969 result!6481) b_and!17785)))

(declare-fun m!417117 () Bool)

(assert (=> b!429297 m!417117))

(declare-fun m!417119 () Bool)

(assert (=> b!429281 m!417119))

(declare-fun m!417121 () Bool)

(assert (=> b!429291 m!417121))

(declare-fun m!417123 () Bool)

(assert (=> b!429289 m!417123))

(declare-fun m!417125 () Bool)

(assert (=> b!429289 m!417125))

(declare-fun m!417127 () Bool)

(assert (=> b!429284 m!417127))

(declare-fun m!417129 () Bool)

(assert (=> b!429293 m!417129))

(declare-fun m!417131 () Bool)

(assert (=> b!429296 m!417131))

(declare-fun m!417133 () Bool)

(assert (=> b!429296 m!417133))

(declare-fun m!417135 () Bool)

(assert (=> b!429296 m!417135))

(declare-fun m!417137 () Bool)

(assert (=> start!39794 m!417137))

(declare-fun m!417139 () Bool)

(assert (=> start!39794 m!417139))

(declare-fun m!417141 () Bool)

(assert (=> b!429287 m!417141))

(declare-fun m!417143 () Bool)

(assert (=> mapNonEmpty!18462 m!417143))

(declare-fun m!417145 () Bool)

(assert (=> b!429285 m!417145))

(declare-fun m!417147 () Bool)

(assert (=> b!429294 m!417147))

(declare-fun m!417149 () Bool)

(assert (=> b!429295 m!417149))

(declare-fun m!417151 () Bool)

(assert (=> b!429295 m!417151))

(declare-fun m!417153 () Bool)

(assert (=> b!429295 m!417153))

(declare-fun m!417155 () Bool)

(assert (=> b!429295 m!417155))

(assert (=> b!429295 m!417155))

(assert (=> b!429295 m!417153))

(declare-fun m!417157 () Bool)

(assert (=> b!429295 m!417157))

(assert (=> b!429292 m!417149))

(declare-fun m!417159 () Bool)

(assert (=> b!429292 m!417159))

(declare-fun m!417161 () Bool)

(assert (=> b!429292 m!417161))

(assert (=> b!429292 m!417149))

(declare-fun m!417163 () Bool)

(assert (=> b!429292 m!417163))

(declare-fun m!417165 () Bool)

(assert (=> b!429292 m!417165))

(declare-fun m!417167 () Bool)

(assert (=> b!429292 m!417167))

(check-sat (not b!429296) (not b_next!10075) (not b_lambda!9145) (not b!429292) (not b!429295) (not b!429285) b_and!17785 (not b!429294) (not b!429297) (not mapNonEmpty!18462) (not b!429293) (not b!429281) (not b!429287) (not start!39794) tp_is_empty!11227 (not b!429289) (not b!429291))
(check-sat b_and!17785 (not b_next!10075))
