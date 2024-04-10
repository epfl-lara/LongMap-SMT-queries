; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39930 () Bool)

(assert start!39930)

(declare-fun b_free!10197 () Bool)

(declare-fun b_next!10197 () Bool)

(assert (=> start!39930 (= b_free!10197 (not b_next!10197))))

(declare-fun tp!36120 () Bool)

(declare-fun b_and!18053 () Bool)

(assert (=> start!39930 (= tp!36120 b_and!18053)))

(declare-fun b!433308 () Bool)

(declare-fun res!255012 () Bool)

(declare-fun e!256215 () Bool)

(assert (=> b!433308 (=> (not res!255012) (not e!256215))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433308 (= res!255012 (validMask!0 mask!1025))))

(declare-fun b!433309 () Bool)

(declare-fun e!256220 () Bool)

(assert (=> b!433309 (= e!256215 e!256220)))

(declare-fun res!255015 () Bool)

(assert (=> b!433309 (=> (not res!255015) (not e!256220))))

(declare-datatypes ((array!26531 0))(
  ( (array!26532 (arr!12715 (Array (_ BitVec 32) (_ BitVec 64))) (size!13067 (_ BitVec 32))) )
))
(declare-fun lt!198943 () array!26531)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26531 (_ BitVec 32)) Bool)

(assert (=> b!433309 (= res!255015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198943 mask!1025))))

(declare-fun _keys!709 () array!26531)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433309 (= lt!198943 (array!26532 (store (arr!12715 _keys!709) i!563 k0!794) (size!13067 _keys!709)))))

(declare-fun b!433310 () Bool)

(declare-fun e!256218 () Bool)

(declare-fun tp_is_empty!11349 () Bool)

(assert (=> b!433310 (= e!256218 tp_is_empty!11349)))

(declare-fun b!433311 () Bool)

(declare-fun e!256212 () Bool)

(declare-fun e!256213 () Bool)

(assert (=> b!433311 (= e!256212 e!256213)))

(declare-fun res!255004 () Bool)

(assert (=> b!433311 (=> res!255004 e!256213)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433311 (= res!255004 (= k0!794 (select (arr!12715 _keys!709) from!863)))))

(assert (=> b!433311 (not (= (select (arr!12715 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12820 0))(
  ( (Unit!12821) )
))
(declare-fun lt!198945 () Unit!12820)

(declare-fun e!256219 () Unit!12820)

(assert (=> b!433311 (= lt!198945 e!256219)))

(declare-fun c!55631 () Bool)

(assert (=> b!433311 (= c!55631 (= (select (arr!12715 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16237 0))(
  ( (V!16238 (val!5719 Int)) )
))
(declare-datatypes ((tuple2!7556 0))(
  ( (tuple2!7557 (_1!3789 (_ BitVec 64)) (_2!3789 V!16237)) )
))
(declare-datatypes ((List!7565 0))(
  ( (Nil!7562) (Cons!7561 (h!8417 tuple2!7556) (t!13211 List!7565)) )
))
(declare-datatypes ((ListLongMap!6469 0))(
  ( (ListLongMap!6470 (toList!3250 List!7565)) )
))
(declare-fun lt!198947 () ListLongMap!6469)

(declare-fun lt!198949 () ListLongMap!6469)

(assert (=> b!433311 (= lt!198947 lt!198949)))

(declare-fun lt!198937 () ListLongMap!6469)

(declare-fun lt!198939 () tuple2!7556)

(declare-fun +!1398 (ListLongMap!6469 tuple2!7556) ListLongMap!6469)

(assert (=> b!433311 (= lt!198949 (+!1398 lt!198937 lt!198939))))

(declare-fun lt!198944 () V!16237)

(assert (=> b!433311 (= lt!198939 (tuple2!7557 (select (arr!12715 _keys!709) from!863) lt!198944))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5331 0))(
  ( (ValueCellFull!5331 (v!7966 V!16237)) (EmptyCell!5331) )
))
(declare-datatypes ((array!26533 0))(
  ( (array!26534 (arr!12716 (Array (_ BitVec 32) ValueCell!5331)) (size!13068 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26533)

(declare-fun get!6324 (ValueCell!5331 V!16237) V!16237)

(declare-fun dynLambda!811 (Int (_ BitVec 64)) V!16237)

(assert (=> b!433311 (= lt!198944 (get!6324 (select (arr!12716 _values!549) from!863) (dynLambda!811 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433312 () Bool)

(declare-fun Unit!12822 () Unit!12820)

(assert (=> b!433312 (= e!256219 Unit!12822)))

(declare-fun b!433313 () Bool)

(declare-fun res!255005 () Bool)

(assert (=> b!433313 (=> (not res!255005) (not e!256215))))

(assert (=> b!433313 (= res!255005 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13067 _keys!709))))))

(declare-fun res!255006 () Bool)

(assert (=> start!39930 (=> (not res!255006) (not e!256215))))

(assert (=> start!39930 (= res!255006 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13067 _keys!709))))))

(assert (=> start!39930 e!256215))

(assert (=> start!39930 tp_is_empty!11349))

(assert (=> start!39930 tp!36120))

(assert (=> start!39930 true))

(declare-fun e!256217 () Bool)

(declare-fun array_inv!9252 (array!26533) Bool)

(assert (=> start!39930 (and (array_inv!9252 _values!549) e!256217)))

(declare-fun array_inv!9253 (array!26531) Bool)

(assert (=> start!39930 (array_inv!9253 _keys!709)))

(declare-fun b!433314 () Bool)

(declare-fun res!255014 () Bool)

(assert (=> b!433314 (=> (not res!255014) (not e!256215))))

(assert (=> b!433314 (= res!255014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18645 () Bool)

(declare-fun mapRes!18645 () Bool)

(declare-fun tp!36119 () Bool)

(assert (=> mapNonEmpty!18645 (= mapRes!18645 (and tp!36119 e!256218))))

(declare-fun mapRest!18645 () (Array (_ BitVec 32) ValueCell!5331))

(declare-fun mapValue!18645 () ValueCell!5331)

(declare-fun mapKey!18645 () (_ BitVec 32))

(assert (=> mapNonEmpty!18645 (= (arr!12716 _values!549) (store mapRest!18645 mapKey!18645 mapValue!18645))))

(declare-fun b!433315 () Bool)

(declare-fun e!256214 () Bool)

(assert (=> b!433315 (= e!256217 (and e!256214 mapRes!18645))))

(declare-fun condMapEmpty!18645 () Bool)

(declare-fun mapDefault!18645 () ValueCell!5331)

(assert (=> b!433315 (= condMapEmpty!18645 (= (arr!12716 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5331)) mapDefault!18645)))))

(declare-fun mapIsEmpty!18645 () Bool)

(assert (=> mapIsEmpty!18645 mapRes!18645))

(declare-fun b!433316 () Bool)

(declare-fun res!255009 () Bool)

(assert (=> b!433316 (=> (not res!255009) (not e!256220))))

(declare-datatypes ((List!7566 0))(
  ( (Nil!7563) (Cons!7562 (h!8418 (_ BitVec 64)) (t!13212 List!7566)) )
))
(declare-fun arrayNoDuplicates!0 (array!26531 (_ BitVec 32) List!7566) Bool)

(assert (=> b!433316 (= res!255009 (arrayNoDuplicates!0 lt!198943 #b00000000000000000000000000000000 Nil!7563))))

(declare-fun b!433317 () Bool)

(assert (=> b!433317 (= e!256213 true)))

(declare-fun lt!198950 () ListLongMap!6469)

(declare-fun lt!198946 () tuple2!7556)

(assert (=> b!433317 (= lt!198949 (+!1398 (+!1398 lt!198950 lt!198939) lt!198946))))

(declare-fun lt!198941 () Unit!12820)

(declare-fun v!412 () V!16237)

(declare-fun addCommutativeForDiffKeys!387 (ListLongMap!6469 (_ BitVec 64) V!16237 (_ BitVec 64) V!16237) Unit!12820)

(assert (=> b!433317 (= lt!198941 (addCommutativeForDiffKeys!387 lt!198950 k0!794 v!412 (select (arr!12715 _keys!709) from!863) lt!198944))))

(declare-fun b!433318 () Bool)

(declare-fun e!256221 () Bool)

(assert (=> b!433318 (= e!256220 e!256221)))

(declare-fun res!255008 () Bool)

(assert (=> b!433318 (=> (not res!255008) (not e!256221))))

(assert (=> b!433318 (= res!255008 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16237)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!198940 () array!26533)

(declare-fun zeroValue!515 () V!16237)

(declare-fun getCurrentListMapNoExtraKeys!1446 (array!26531 array!26533 (_ BitVec 32) (_ BitVec 32) V!16237 V!16237 (_ BitVec 32) Int) ListLongMap!6469)

(assert (=> b!433318 (= lt!198947 (getCurrentListMapNoExtraKeys!1446 lt!198943 lt!198940 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433318 (= lt!198940 (array!26534 (store (arr!12716 _values!549) i!563 (ValueCellFull!5331 v!412)) (size!13068 _values!549)))))

(declare-fun lt!198942 () ListLongMap!6469)

(assert (=> b!433318 (= lt!198942 (getCurrentListMapNoExtraKeys!1446 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433319 () Bool)

(declare-fun res!255003 () Bool)

(assert (=> b!433319 (=> (not res!255003) (not e!256215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433319 (= res!255003 (validKeyInArray!0 k0!794))))

(declare-fun b!433320 () Bool)

(declare-fun Unit!12823 () Unit!12820)

(assert (=> b!433320 (= e!256219 Unit!12823)))

(declare-fun lt!198936 () Unit!12820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26531 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12820)

(assert (=> b!433320 (= lt!198936 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433320 false))

(declare-fun b!433321 () Bool)

(declare-fun res!255010 () Bool)

(assert (=> b!433321 (=> (not res!255010) (not e!256220))))

(assert (=> b!433321 (= res!255010 (bvsle from!863 i!563))))

(declare-fun b!433322 () Bool)

(declare-fun res!255007 () Bool)

(assert (=> b!433322 (=> (not res!255007) (not e!256215))))

(declare-fun arrayContainsKey!0 (array!26531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433322 (= res!255007 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433323 () Bool)

(assert (=> b!433323 (= e!256214 tp_is_empty!11349)))

(declare-fun b!433324 () Bool)

(declare-fun res!255011 () Bool)

(assert (=> b!433324 (=> (not res!255011) (not e!256215))))

(assert (=> b!433324 (= res!255011 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7563))))

(declare-fun b!433325 () Bool)

(assert (=> b!433325 (= e!256221 (not e!256212))))

(declare-fun res!255002 () Bool)

(assert (=> b!433325 (=> res!255002 e!256212)))

(assert (=> b!433325 (= res!255002 (not (validKeyInArray!0 (select (arr!12715 _keys!709) from!863))))))

(declare-fun lt!198948 () ListLongMap!6469)

(assert (=> b!433325 (= lt!198948 lt!198937)))

(assert (=> b!433325 (= lt!198937 (+!1398 lt!198950 lt!198946))))

(assert (=> b!433325 (= lt!198948 (getCurrentListMapNoExtraKeys!1446 lt!198943 lt!198940 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433325 (= lt!198946 (tuple2!7557 k0!794 v!412))))

(assert (=> b!433325 (= lt!198950 (getCurrentListMapNoExtraKeys!1446 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198938 () Unit!12820)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!579 (array!26531 array!26533 (_ BitVec 32) (_ BitVec 32) V!16237 V!16237 (_ BitVec 32) (_ BitVec 64) V!16237 (_ BitVec 32) Int) Unit!12820)

(assert (=> b!433325 (= lt!198938 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!579 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433326 () Bool)

(declare-fun res!255001 () Bool)

(assert (=> b!433326 (=> (not res!255001) (not e!256215))))

(assert (=> b!433326 (= res!255001 (or (= (select (arr!12715 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12715 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433327 () Bool)

(declare-fun res!255013 () Bool)

(assert (=> b!433327 (=> (not res!255013) (not e!256215))))

(assert (=> b!433327 (= res!255013 (and (= (size!13068 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13067 _keys!709) (size!13068 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39930 res!255006) b!433308))

(assert (= (and b!433308 res!255012) b!433327))

(assert (= (and b!433327 res!255013) b!433314))

(assert (= (and b!433314 res!255014) b!433324))

(assert (= (and b!433324 res!255011) b!433313))

(assert (= (and b!433313 res!255005) b!433319))

(assert (= (and b!433319 res!255003) b!433326))

(assert (= (and b!433326 res!255001) b!433322))

(assert (= (and b!433322 res!255007) b!433309))

(assert (= (and b!433309 res!255015) b!433316))

(assert (= (and b!433316 res!255009) b!433321))

(assert (= (and b!433321 res!255010) b!433318))

(assert (= (and b!433318 res!255008) b!433325))

(assert (= (and b!433325 (not res!255002)) b!433311))

(assert (= (and b!433311 c!55631) b!433320))

(assert (= (and b!433311 (not c!55631)) b!433312))

(assert (= (and b!433311 (not res!255004)) b!433317))

(assert (= (and b!433315 condMapEmpty!18645) mapIsEmpty!18645))

(assert (= (and b!433315 (not condMapEmpty!18645)) mapNonEmpty!18645))

(get-info :version)

(assert (= (and mapNonEmpty!18645 ((_ is ValueCellFull!5331) mapValue!18645)) b!433310))

(assert (= (and b!433315 ((_ is ValueCellFull!5331) mapDefault!18645)) b!433323))

(assert (= start!39930 b!433315))

(declare-fun b_lambda!9285 () Bool)

(assert (=> (not b_lambda!9285) (not b!433311)))

(declare-fun t!13210 () Bool)

(declare-fun tb!3603 () Bool)

(assert (=> (and start!39930 (= defaultEntry!557 defaultEntry!557) t!13210) tb!3603))

(declare-fun result!6733 () Bool)

(assert (=> tb!3603 (= result!6733 tp_is_empty!11349)))

(assert (=> b!433311 t!13210))

(declare-fun b_and!18055 () Bool)

(assert (= b_and!18053 (and (=> t!13210 result!6733) b_and!18055)))

(declare-fun m!421333 () Bool)

(assert (=> b!433308 m!421333))

(declare-fun m!421335 () Bool)

(assert (=> b!433326 m!421335))

(declare-fun m!421337 () Bool)

(assert (=> b!433318 m!421337))

(declare-fun m!421339 () Bool)

(assert (=> b!433318 m!421339))

(declare-fun m!421341 () Bool)

(assert (=> b!433318 m!421341))

(declare-fun m!421343 () Bool)

(assert (=> b!433314 m!421343))

(declare-fun m!421345 () Bool)

(assert (=> b!433316 m!421345))

(declare-fun m!421347 () Bool)

(assert (=> b!433311 m!421347))

(declare-fun m!421349 () Bool)

(assert (=> b!433311 m!421349))

(declare-fun m!421351 () Bool)

(assert (=> b!433311 m!421351))

(declare-fun m!421353 () Bool)

(assert (=> b!433311 m!421353))

(assert (=> b!433311 m!421353))

(assert (=> b!433311 m!421351))

(declare-fun m!421355 () Bool)

(assert (=> b!433311 m!421355))

(declare-fun m!421357 () Bool)

(assert (=> b!433319 m!421357))

(assert (=> b!433325 m!421347))

(declare-fun m!421359 () Bool)

(assert (=> b!433325 m!421359))

(declare-fun m!421361 () Bool)

(assert (=> b!433325 m!421361))

(declare-fun m!421363 () Bool)

(assert (=> b!433325 m!421363))

(assert (=> b!433325 m!421347))

(declare-fun m!421365 () Bool)

(assert (=> b!433325 m!421365))

(declare-fun m!421367 () Bool)

(assert (=> b!433325 m!421367))

(declare-fun m!421369 () Bool)

(assert (=> start!39930 m!421369))

(declare-fun m!421371 () Bool)

(assert (=> start!39930 m!421371))

(declare-fun m!421373 () Bool)

(assert (=> b!433320 m!421373))

(declare-fun m!421375 () Bool)

(assert (=> b!433324 m!421375))

(declare-fun m!421377 () Bool)

(assert (=> b!433309 m!421377))

(declare-fun m!421379 () Bool)

(assert (=> b!433309 m!421379))

(declare-fun m!421381 () Bool)

(assert (=> b!433322 m!421381))

(declare-fun m!421383 () Bool)

(assert (=> b!433317 m!421383))

(assert (=> b!433317 m!421383))

(declare-fun m!421385 () Bool)

(assert (=> b!433317 m!421385))

(assert (=> b!433317 m!421347))

(assert (=> b!433317 m!421347))

(declare-fun m!421387 () Bool)

(assert (=> b!433317 m!421387))

(declare-fun m!421389 () Bool)

(assert (=> mapNonEmpty!18645 m!421389))

(check-sat (not b_next!10197) (not b!433311) (not b!433322) (not b!433314) (not b!433317) (not b!433320) (not b!433318) b_and!18055 (not b!433309) (not b!433308) tp_is_empty!11349 (not b!433324) (not b!433316) (not b!433325) (not mapNonEmpty!18645) (not b_lambda!9285) (not start!39930) (not b!433319))
(check-sat b_and!18055 (not b_next!10197))
