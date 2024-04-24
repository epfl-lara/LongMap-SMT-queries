; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39794 () Bool)

(assert start!39794)

(declare-fun b_free!10075 () Bool)

(declare-fun b_next!10075 () Bool)

(assert (=> start!39794 (= b_free!10075 (not b_next!10075))))

(declare-fun tp!35754 () Bool)

(declare-fun b_and!17823 () Bool)

(assert (=> start!39794 (= tp!35754 b_and!17823)))

(declare-fun b!429502 () Bool)

(declare-fun res!252282 () Bool)

(declare-fun e!254382 () Bool)

(assert (=> b!429502 (=> (not res!252282) (not e!254382))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429502 (= res!252282 (validKeyInArray!0 k0!794))))

(declare-fun b!429503 () Bool)

(declare-fun e!254378 () Bool)

(assert (=> b!429503 (= e!254382 e!254378)))

(declare-fun res!252284 () Bool)

(assert (=> b!429503 (=> (not res!252284) (not e!254378))))

(declare-datatypes ((array!26294 0))(
  ( (array!26295 (arr!12596 (Array (_ BitVec 32) (_ BitVec 64))) (size!12948 (_ BitVec 32))) )
))
(declare-fun lt!196337 () array!26294)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26294 (_ BitVec 32)) Bool)

(assert (=> b!429503 (= res!252284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196337 mask!1025))))

(declare-fun _keys!709 () array!26294)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429503 (= lt!196337 (array!26295 (store (arr!12596 _keys!709) i!563 k0!794) (size!12948 _keys!709)))))

(declare-fun b!429504 () Bool)

(declare-fun e!254379 () Bool)

(declare-fun e!254383 () Bool)

(declare-fun mapRes!18462 () Bool)

(assert (=> b!429504 (= e!254379 (and e!254383 mapRes!18462))))

(declare-fun condMapEmpty!18462 () Bool)

(declare-datatypes ((V!16075 0))(
  ( (V!16076 (val!5658 Int)) )
))
(declare-datatypes ((ValueCell!5270 0))(
  ( (ValueCellFull!5270 (v!7906 V!16075)) (EmptyCell!5270) )
))
(declare-datatypes ((array!26296 0))(
  ( (array!26297 (arr!12597 (Array (_ BitVec 32) ValueCell!5270)) (size!12949 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26296)

(declare-fun mapDefault!18462 () ValueCell!5270)

(assert (=> b!429504 (= condMapEmpty!18462 (= (arr!12597 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5270)) mapDefault!18462)))))

(declare-fun b!429505 () Bool)

(declare-fun res!252278 () Bool)

(assert (=> b!429505 (=> (not res!252278) (not e!254382))))

(declare-datatypes ((List!7352 0))(
  ( (Nil!7349) (Cons!7348 (h!8204 (_ BitVec 64)) (t!12868 List!7352)) )
))
(declare-fun arrayNoDuplicates!0 (array!26294 (_ BitVec 32) List!7352) Bool)

(assert (=> b!429505 (= res!252278 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7349))))

(declare-fun mapIsEmpty!18462 () Bool)

(assert (=> mapIsEmpty!18462 mapRes!18462))

(declare-fun mapNonEmpty!18462 () Bool)

(declare-fun tp!35753 () Bool)

(declare-fun e!254381 () Bool)

(assert (=> mapNonEmpty!18462 (= mapRes!18462 (and tp!35753 e!254381))))

(declare-fun mapRest!18462 () (Array (_ BitVec 32) ValueCell!5270))

(declare-fun mapValue!18462 () ValueCell!5270)

(declare-fun mapKey!18462 () (_ BitVec 32))

(assert (=> mapNonEmpty!18462 (= (arr!12597 _values!549) (store mapRest!18462 mapKey!18462 mapValue!18462))))

(declare-fun b!429506 () Bool)

(declare-fun e!254376 () Bool)

(assert (=> b!429506 (= e!254376 true)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!429506 (not (= (select (arr!12596 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12625 0))(
  ( (Unit!12626) )
))
(declare-fun lt!196340 () Unit!12625)

(declare-fun e!254375 () Unit!12625)

(assert (=> b!429506 (= lt!196340 e!254375)))

(declare-fun c!55425 () Bool)

(assert (=> b!429506 (= c!55425 (= (select (arr!12596 _keys!709) from!863) k0!794))))

(declare-datatypes ((tuple2!7352 0))(
  ( (tuple2!7353 (_1!3687 (_ BitVec 64)) (_2!3687 V!16075)) )
))
(declare-datatypes ((List!7353 0))(
  ( (Nil!7350) (Cons!7349 (h!8205 tuple2!7352) (t!12869 List!7353)) )
))
(declare-datatypes ((ListLongMap!6267 0))(
  ( (ListLongMap!6268 (toList!3149 List!7353)) )
))
(declare-fun lt!196342 () ListLongMap!6267)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!196343 () ListLongMap!6267)

(declare-fun +!1361 (ListLongMap!6267 tuple2!7352) ListLongMap!6267)

(declare-fun get!6254 (ValueCell!5270 V!16075) V!16075)

(declare-fun dynLambda!775 (Int (_ BitVec 64)) V!16075)

(assert (=> b!429506 (= lt!196342 (+!1361 lt!196343 (tuple2!7353 (select (arr!12596 _keys!709) from!863) (get!6254 (select (arr!12597 _values!549) from!863) (dynLambda!775 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429507 () Bool)

(declare-fun e!254380 () Bool)

(assert (=> b!429507 (= e!254378 e!254380)))

(declare-fun res!252291 () Bool)

(assert (=> b!429507 (=> (not res!252291) (not e!254380))))

(assert (=> b!429507 (= res!252291 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16075)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16075)

(declare-fun lt!196344 () array!26296)

(declare-fun getCurrentListMapNoExtraKeys!1393 (array!26294 array!26296 (_ BitVec 32) (_ BitVec 32) V!16075 V!16075 (_ BitVec 32) Int) ListLongMap!6267)

(assert (=> b!429507 (= lt!196342 (getCurrentListMapNoExtraKeys!1393 lt!196337 lt!196344 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16075)

(assert (=> b!429507 (= lt!196344 (array!26297 (store (arr!12597 _values!549) i!563 (ValueCellFull!5270 v!412)) (size!12949 _values!549)))))

(declare-fun lt!196339 () ListLongMap!6267)

(assert (=> b!429507 (= lt!196339 (getCurrentListMapNoExtraKeys!1393 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429508 () Bool)

(declare-fun res!252286 () Bool)

(assert (=> b!429508 (=> (not res!252286) (not e!254382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429508 (= res!252286 (validMask!0 mask!1025))))

(declare-fun b!429509 () Bool)

(declare-fun tp_is_empty!11227 () Bool)

(assert (=> b!429509 (= e!254383 tp_is_empty!11227)))

(declare-fun b!429510 () Bool)

(declare-fun Unit!12627 () Unit!12625)

(assert (=> b!429510 (= e!254375 Unit!12627)))

(declare-fun b!429512 () Bool)

(declare-fun res!252285 () Bool)

(assert (=> b!429512 (=> (not res!252285) (not e!254382))))

(assert (=> b!429512 (= res!252285 (and (= (size!12949 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12948 _keys!709) (size!12949 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429513 () Bool)

(declare-fun res!252290 () Bool)

(assert (=> b!429513 (=> (not res!252290) (not e!254378))))

(assert (=> b!429513 (= res!252290 (arrayNoDuplicates!0 lt!196337 #b00000000000000000000000000000000 Nil!7349))))

(declare-fun b!429514 () Bool)

(declare-fun res!252283 () Bool)

(assert (=> b!429514 (=> (not res!252283) (not e!254378))))

(assert (=> b!429514 (= res!252283 (bvsle from!863 i!563))))

(declare-fun b!429515 () Bool)

(declare-fun res!252280 () Bool)

(assert (=> b!429515 (=> (not res!252280) (not e!254382))))

(declare-fun arrayContainsKey!0 (array!26294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429515 (= res!252280 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429516 () Bool)

(assert (=> b!429516 (= e!254380 (not e!254376))))

(declare-fun res!252279 () Bool)

(assert (=> b!429516 (=> res!252279 e!254376)))

(assert (=> b!429516 (= res!252279 (not (validKeyInArray!0 (select (arr!12596 _keys!709) from!863))))))

(declare-fun lt!196338 () ListLongMap!6267)

(assert (=> b!429516 (= lt!196338 lt!196343)))

(declare-fun lt!196335 () ListLongMap!6267)

(assert (=> b!429516 (= lt!196343 (+!1361 lt!196335 (tuple2!7353 k0!794 v!412)))))

(assert (=> b!429516 (= lt!196338 (getCurrentListMapNoExtraKeys!1393 lt!196337 lt!196344 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429516 (= lt!196335 (getCurrentListMapNoExtraKeys!1393 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196341 () Unit!12625)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!539 (array!26294 array!26296 (_ BitVec 32) (_ BitVec 32) V!16075 V!16075 (_ BitVec 32) (_ BitVec 64) V!16075 (_ BitVec 32) Int) Unit!12625)

(assert (=> b!429516 (= lt!196341 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!539 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429517 () Bool)

(assert (=> b!429517 (= e!254381 tp_is_empty!11227)))

(declare-fun b!429518 () Bool)

(declare-fun Unit!12628 () Unit!12625)

(assert (=> b!429518 (= e!254375 Unit!12628)))

(declare-fun lt!196336 () Unit!12625)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26294 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12625)

(assert (=> b!429518 (= lt!196336 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429518 false))

(declare-fun b!429519 () Bool)

(declare-fun res!252288 () Bool)

(assert (=> b!429519 (=> (not res!252288) (not e!254382))))

(assert (=> b!429519 (= res!252288 (or (= (select (arr!12596 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12596 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429520 () Bool)

(declare-fun res!252289 () Bool)

(assert (=> b!429520 (=> (not res!252289) (not e!254382))))

(assert (=> b!429520 (= res!252289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429511 () Bool)

(declare-fun res!252281 () Bool)

(assert (=> b!429511 (=> (not res!252281) (not e!254382))))

(assert (=> b!429511 (= res!252281 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12948 _keys!709))))))

(declare-fun res!252287 () Bool)

(assert (=> start!39794 (=> (not res!252287) (not e!254382))))

(assert (=> start!39794 (= res!252287 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12948 _keys!709))))))

(assert (=> start!39794 e!254382))

(assert (=> start!39794 tp_is_empty!11227))

(assert (=> start!39794 tp!35754))

(assert (=> start!39794 true))

(declare-fun array_inv!9240 (array!26296) Bool)

(assert (=> start!39794 (and (array_inv!9240 _values!549) e!254379)))

(declare-fun array_inv!9241 (array!26294) Bool)

(assert (=> start!39794 (array_inv!9241 _keys!709)))

(assert (= (and start!39794 res!252287) b!429508))

(assert (= (and b!429508 res!252286) b!429512))

(assert (= (and b!429512 res!252285) b!429520))

(assert (= (and b!429520 res!252289) b!429505))

(assert (= (and b!429505 res!252278) b!429511))

(assert (= (and b!429511 res!252281) b!429502))

(assert (= (and b!429502 res!252282) b!429519))

(assert (= (and b!429519 res!252288) b!429515))

(assert (= (and b!429515 res!252280) b!429503))

(assert (= (and b!429503 res!252284) b!429513))

(assert (= (and b!429513 res!252290) b!429514))

(assert (= (and b!429514 res!252283) b!429507))

(assert (= (and b!429507 res!252291) b!429516))

(assert (= (and b!429516 (not res!252279)) b!429506))

(assert (= (and b!429506 c!55425) b!429518))

(assert (= (and b!429506 (not c!55425)) b!429510))

(assert (= (and b!429504 condMapEmpty!18462) mapIsEmpty!18462))

(assert (= (and b!429504 (not condMapEmpty!18462)) mapNonEmpty!18462))

(get-info :version)

(assert (= (and mapNonEmpty!18462 ((_ is ValueCellFull!5270) mapValue!18462)) b!429517))

(assert (= (and b!429504 ((_ is ValueCellFull!5270) mapDefault!18462)) b!429509))

(assert (= start!39794 b!429504))

(declare-fun b_lambda!9185 () Bool)

(assert (=> (not b_lambda!9185) (not b!429506)))

(declare-fun t!12867 () Bool)

(declare-fun tb!3473 () Bool)

(assert (=> (and start!39794 (= defaultEntry!557 defaultEntry!557) t!12867) tb!3473))

(declare-fun result!6481 () Bool)

(assert (=> tb!3473 (= result!6481 tp_is_empty!11227)))

(assert (=> b!429506 t!12867))

(declare-fun b_and!17825 () Bool)

(assert (= b_and!17823 (and (=> t!12867 result!6481) b_and!17825)))

(declare-fun m!418067 () Bool)

(assert (=> b!429508 m!418067))

(declare-fun m!418069 () Bool)

(assert (=> start!39794 m!418069))

(declare-fun m!418071 () Bool)

(assert (=> start!39794 m!418071))

(declare-fun m!418073 () Bool)

(assert (=> b!429513 m!418073))

(declare-fun m!418075 () Bool)

(assert (=> b!429507 m!418075))

(declare-fun m!418077 () Bool)

(assert (=> b!429507 m!418077))

(declare-fun m!418079 () Bool)

(assert (=> b!429507 m!418079))

(declare-fun m!418081 () Bool)

(assert (=> b!429518 m!418081))

(declare-fun m!418083 () Bool)

(assert (=> b!429502 m!418083))

(declare-fun m!418085 () Bool)

(assert (=> b!429503 m!418085))

(declare-fun m!418087 () Bool)

(assert (=> b!429503 m!418087))

(declare-fun m!418089 () Bool)

(assert (=> b!429516 m!418089))

(declare-fun m!418091 () Bool)

(assert (=> b!429516 m!418091))

(declare-fun m!418093 () Bool)

(assert (=> b!429516 m!418093))

(assert (=> b!429516 m!418089))

(declare-fun m!418095 () Bool)

(assert (=> b!429516 m!418095))

(declare-fun m!418097 () Bool)

(assert (=> b!429516 m!418097))

(declare-fun m!418099 () Bool)

(assert (=> b!429516 m!418099))

(declare-fun m!418101 () Bool)

(assert (=> b!429515 m!418101))

(assert (=> b!429506 m!418089))

(declare-fun m!418103 () Bool)

(assert (=> b!429506 m!418103))

(declare-fun m!418105 () Bool)

(assert (=> b!429506 m!418105))

(assert (=> b!429506 m!418105))

(assert (=> b!429506 m!418103))

(declare-fun m!418107 () Bool)

(assert (=> b!429506 m!418107))

(declare-fun m!418109 () Bool)

(assert (=> b!429506 m!418109))

(declare-fun m!418111 () Bool)

(assert (=> b!429505 m!418111))

(declare-fun m!418113 () Bool)

(assert (=> b!429520 m!418113))

(declare-fun m!418115 () Bool)

(assert (=> mapNonEmpty!18462 m!418115))

(declare-fun m!418117 () Bool)

(assert (=> b!429519 m!418117))

(check-sat (not b!429513) (not b_lambda!9185) b_and!17825 (not b!429520) (not b!429502) (not start!39794) tp_is_empty!11227 (not b!429515) (not mapNonEmpty!18462) (not b!429503) (not b_next!10075) (not b!429508) (not b!429506) (not b!429518) (not b!429505) (not b!429516) (not b!429507))
(check-sat b_and!17825 (not b_next!10075))
