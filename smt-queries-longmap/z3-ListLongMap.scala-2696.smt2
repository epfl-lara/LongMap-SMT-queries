; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39980 () Bool)

(assert start!39980)

(declare-fun b_free!10261 () Bool)

(declare-fun b_next!10261 () Bool)

(assert (=> start!39980 (= b_free!10261 (not b_next!10261))))

(declare-fun tp!36312 () Bool)

(declare-fun b_and!18195 () Bool)

(assert (=> start!39980 (= tp!36312 b_and!18195)))

(declare-fun res!256438 () Bool)

(declare-fun e!257140 () Bool)

(assert (=> start!39980 (=> (not res!256438) (not e!257140))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26658 0))(
  ( (array!26659 (arr!12778 (Array (_ BitVec 32) (_ BitVec 64))) (size!13130 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26658)

(assert (=> start!39980 (= res!256438 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13130 _keys!709))))))

(assert (=> start!39980 e!257140))

(declare-fun tp_is_empty!11413 () Bool)

(assert (=> start!39980 tp_is_empty!11413))

(assert (=> start!39980 tp!36312))

(assert (=> start!39980 true))

(declare-datatypes ((V!16323 0))(
  ( (V!16324 (val!5751 Int)) )
))
(declare-datatypes ((ValueCell!5363 0))(
  ( (ValueCellFull!5363 (v!7999 V!16323)) (EmptyCell!5363) )
))
(declare-datatypes ((array!26660 0))(
  ( (array!26661 (arr!12779 (Array (_ BitVec 32) ValueCell!5363)) (size!13131 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26660)

(declare-fun e!257146 () Bool)

(declare-fun array_inv!9350 (array!26660) Bool)

(assert (=> start!39980 (and (array_inv!9350 _values!549) e!257146)))

(declare-fun array_inv!9351 (array!26658) Bool)

(assert (=> start!39980 (array_inv!9351 _keys!709)))

(declare-fun b!435243 () Bool)

(declare-fun res!256442 () Bool)

(declare-fun e!257145 () Bool)

(assert (=> b!435243 (=> (not res!256442) (not e!257145))))

(declare-fun lt!200403 () array!26658)

(declare-datatypes ((List!7507 0))(
  ( (Nil!7504) (Cons!7503 (h!8359 (_ BitVec 64)) (t!13209 List!7507)) )
))
(declare-fun arrayNoDuplicates!0 (array!26658 (_ BitVec 32) List!7507) Bool)

(assert (=> b!435243 (= res!256442 (arrayNoDuplicates!0 lt!200403 #b00000000000000000000000000000000 Nil!7504))))

(declare-fun b!435244 () Bool)

(declare-fun res!256451 () Bool)

(assert (=> b!435244 (=> (not res!256451) (not e!257140))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435244 (= res!256451 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13130 _keys!709))))))

(declare-fun b!435245 () Bool)

(declare-fun res!256440 () Bool)

(assert (=> b!435245 (=> (not res!256440) (not e!257140))))

(assert (=> b!435245 (= res!256440 (or (= (select (arr!12778 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12778 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18741 () Bool)

(declare-fun mapRes!18741 () Bool)

(assert (=> mapIsEmpty!18741 mapRes!18741))

(declare-fun b!435246 () Bool)

(declare-fun e!257143 () Bool)

(assert (=> b!435246 (= e!257143 true)))

(declare-datatypes ((tuple2!7516 0))(
  ( (tuple2!7517 (_1!3769 (_ BitVec 64)) (_2!3769 V!16323)) )
))
(declare-fun lt!200408 () tuple2!7516)

(declare-datatypes ((List!7508 0))(
  ( (Nil!7505) (Cons!7504 (h!8360 tuple2!7516) (t!13210 List!7508)) )
))
(declare-datatypes ((ListLongMap!6431 0))(
  ( (ListLongMap!6432 (toList!3231 List!7508)) )
))
(declare-fun lt!200395 () ListLongMap!6431)

(declare-fun lt!200397 () tuple2!7516)

(declare-fun lt!200404 () ListLongMap!6431)

(declare-fun +!1435 (ListLongMap!6431 tuple2!7516) ListLongMap!6431)

(assert (=> b!435246 (= lt!200404 (+!1435 (+!1435 lt!200395 lt!200397) lt!200408))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!200406 () V!16323)

(declare-datatypes ((Unit!12918 0))(
  ( (Unit!12919) )
))
(declare-fun lt!200398 () Unit!12918)

(declare-fun v!412 () V!16323)

(declare-fun addCommutativeForDiffKeys!405 (ListLongMap!6431 (_ BitVec 64) V!16323 (_ BitVec 64) V!16323) Unit!12918)

(assert (=> b!435246 (= lt!200398 (addCommutativeForDiffKeys!405 lt!200395 k0!794 v!412 (select (arr!12778 _keys!709) from!863) lt!200406))))

(declare-fun b!435247 () Bool)

(declare-fun res!256450 () Bool)

(assert (=> b!435247 (=> (not res!256450) (not e!257140))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!435247 (= res!256450 (and (= (size!13131 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13130 _keys!709) (size!13131 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435248 () Bool)

(declare-fun e!257149 () Unit!12918)

(declare-fun Unit!12920 () Unit!12918)

(assert (=> b!435248 (= e!257149 Unit!12920)))

(declare-fun lt!200400 () Unit!12918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26658 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12918)

(assert (=> b!435248 (= lt!200400 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435248 false))

(declare-fun b!435249 () Bool)

(assert (=> b!435249 (= e!257140 e!257145)))

(declare-fun res!256439 () Bool)

(assert (=> b!435249 (=> (not res!256439) (not e!257145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26658 (_ BitVec 32)) Bool)

(assert (=> b!435249 (= res!256439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200403 mask!1025))))

(assert (=> b!435249 (= lt!200403 (array!26659 (store (arr!12778 _keys!709) i!563 k0!794) (size!13130 _keys!709)))))

(declare-fun b!435250 () Bool)

(declare-fun res!256449 () Bool)

(assert (=> b!435250 (=> (not res!256449) (not e!257140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435250 (= res!256449 (validMask!0 mask!1025))))

(declare-fun b!435251 () Bool)

(declare-fun res!256443 () Bool)

(assert (=> b!435251 (=> (not res!256443) (not e!257140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435251 (= res!256443 (validKeyInArray!0 k0!794))))

(declare-fun b!435252 () Bool)

(declare-fun e!257148 () Bool)

(declare-fun e!257147 () Bool)

(assert (=> b!435252 (= e!257148 (not e!257147))))

(declare-fun res!256448 () Bool)

(assert (=> b!435252 (=> res!256448 e!257147)))

(assert (=> b!435252 (= res!256448 (not (validKeyInArray!0 (select (arr!12778 _keys!709) from!863))))))

(declare-fun lt!200407 () ListLongMap!6431)

(declare-fun lt!200399 () ListLongMap!6431)

(assert (=> b!435252 (= lt!200407 lt!200399)))

(assert (=> b!435252 (= lt!200399 (+!1435 lt!200395 lt!200408))))

(declare-fun minValue!515 () V!16323)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!200396 () array!26660)

(declare-fun zeroValue!515 () V!16323)

(declare-fun getCurrentListMapNoExtraKeys!1466 (array!26658 array!26660 (_ BitVec 32) (_ BitVec 32) V!16323 V!16323 (_ BitVec 32) Int) ListLongMap!6431)

(assert (=> b!435252 (= lt!200407 (getCurrentListMapNoExtraKeys!1466 lt!200403 lt!200396 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435252 (= lt!200408 (tuple2!7517 k0!794 v!412))))

(assert (=> b!435252 (= lt!200395 (getCurrentListMapNoExtraKeys!1466 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200402 () Unit!12918)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!598 (array!26658 array!26660 (_ BitVec 32) (_ BitVec 32) V!16323 V!16323 (_ BitVec 32) (_ BitVec 64) V!16323 (_ BitVec 32) Int) Unit!12918)

(assert (=> b!435252 (= lt!200402 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!598 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435253 () Bool)

(declare-fun Unit!12921 () Unit!12918)

(assert (=> b!435253 (= e!257149 Unit!12921)))

(declare-fun b!435254 () Bool)

(assert (=> b!435254 (= e!257145 e!257148)))

(declare-fun res!256441 () Bool)

(assert (=> b!435254 (=> (not res!256441) (not e!257148))))

(assert (=> b!435254 (= res!256441 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200405 () ListLongMap!6431)

(assert (=> b!435254 (= lt!200405 (getCurrentListMapNoExtraKeys!1466 lt!200403 lt!200396 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435254 (= lt!200396 (array!26661 (store (arr!12779 _values!549) i!563 (ValueCellFull!5363 v!412)) (size!13131 _values!549)))))

(declare-fun lt!200401 () ListLongMap!6431)

(assert (=> b!435254 (= lt!200401 (getCurrentListMapNoExtraKeys!1466 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435255 () Bool)

(declare-fun res!256444 () Bool)

(assert (=> b!435255 (=> (not res!256444) (not e!257140))))

(assert (=> b!435255 (= res!256444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435256 () Bool)

(declare-fun res!256447 () Bool)

(assert (=> b!435256 (=> (not res!256447) (not e!257145))))

(assert (=> b!435256 (= res!256447 (bvsle from!863 i!563))))

(declare-fun b!435257 () Bool)

(declare-fun res!256452 () Bool)

(assert (=> b!435257 (=> (not res!256452) (not e!257140))))

(assert (=> b!435257 (= res!256452 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7504))))

(declare-fun b!435258 () Bool)

(declare-fun e!257142 () Bool)

(assert (=> b!435258 (= e!257142 tp_is_empty!11413)))

(declare-fun mapNonEmpty!18741 () Bool)

(declare-fun tp!36311 () Bool)

(assert (=> mapNonEmpty!18741 (= mapRes!18741 (and tp!36311 e!257142))))

(declare-fun mapValue!18741 () ValueCell!5363)

(declare-fun mapKey!18741 () (_ BitVec 32))

(declare-fun mapRest!18741 () (Array (_ BitVec 32) ValueCell!5363))

(assert (=> mapNonEmpty!18741 (= (arr!12779 _values!549) (store mapRest!18741 mapKey!18741 mapValue!18741))))

(declare-fun b!435259 () Bool)

(declare-fun res!256446 () Bool)

(assert (=> b!435259 (=> (not res!256446) (not e!257140))))

(declare-fun arrayContainsKey!0 (array!26658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435259 (= res!256446 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435260 () Bool)

(assert (=> b!435260 (= e!257147 e!257143)))

(declare-fun res!256445 () Bool)

(assert (=> b!435260 (=> res!256445 e!257143)))

(assert (=> b!435260 (= res!256445 (= k0!794 (select (arr!12778 _keys!709) from!863)))))

(assert (=> b!435260 (not (= (select (arr!12778 _keys!709) from!863) k0!794))))

(declare-fun lt!200409 () Unit!12918)

(assert (=> b!435260 (= lt!200409 e!257149)))

(declare-fun c!55704 () Bool)

(assert (=> b!435260 (= c!55704 (= (select (arr!12778 _keys!709) from!863) k0!794))))

(assert (=> b!435260 (= lt!200405 lt!200404)))

(assert (=> b!435260 (= lt!200404 (+!1435 lt!200399 lt!200397))))

(assert (=> b!435260 (= lt!200397 (tuple2!7517 (select (arr!12778 _keys!709) from!863) lt!200406))))

(declare-fun get!6378 (ValueCell!5363 V!16323) V!16323)

(declare-fun dynLambda!837 (Int (_ BitVec 64)) V!16323)

(assert (=> b!435260 (= lt!200406 (get!6378 (select (arr!12779 _values!549) from!863) (dynLambda!837 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435261 () Bool)

(declare-fun e!257144 () Bool)

(assert (=> b!435261 (= e!257146 (and e!257144 mapRes!18741))))

(declare-fun condMapEmpty!18741 () Bool)

(declare-fun mapDefault!18741 () ValueCell!5363)

(assert (=> b!435261 (= condMapEmpty!18741 (= (arr!12779 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5363)) mapDefault!18741)))))

(declare-fun b!435262 () Bool)

(assert (=> b!435262 (= e!257144 tp_is_empty!11413)))

(assert (= (and start!39980 res!256438) b!435250))

(assert (= (and b!435250 res!256449) b!435247))

(assert (= (and b!435247 res!256450) b!435255))

(assert (= (and b!435255 res!256444) b!435257))

(assert (= (and b!435257 res!256452) b!435244))

(assert (= (and b!435244 res!256451) b!435251))

(assert (= (and b!435251 res!256443) b!435245))

(assert (= (and b!435245 res!256440) b!435259))

(assert (= (and b!435259 res!256446) b!435249))

(assert (= (and b!435249 res!256439) b!435243))

(assert (= (and b!435243 res!256442) b!435256))

(assert (= (and b!435256 res!256447) b!435254))

(assert (= (and b!435254 res!256441) b!435252))

(assert (= (and b!435252 (not res!256448)) b!435260))

(assert (= (and b!435260 c!55704) b!435248))

(assert (= (and b!435260 (not c!55704)) b!435253))

(assert (= (and b!435260 (not res!256445)) b!435246))

(assert (= (and b!435261 condMapEmpty!18741) mapIsEmpty!18741))

(assert (= (and b!435261 (not condMapEmpty!18741)) mapNonEmpty!18741))

(get-info :version)

(assert (= (and mapNonEmpty!18741 ((_ is ValueCellFull!5363) mapValue!18741)) b!435258))

(assert (= (and b!435261 ((_ is ValueCellFull!5363) mapDefault!18741)) b!435262))

(assert (= start!39980 b!435261))

(declare-fun b_lambda!9371 () Bool)

(assert (=> (not b_lambda!9371) (not b!435260)))

(declare-fun t!13208 () Bool)

(declare-fun tb!3659 () Bool)

(assert (=> (and start!39980 (= defaultEntry!557 defaultEntry!557) t!13208) tb!3659))

(declare-fun result!6853 () Bool)

(assert (=> tb!3659 (= result!6853 tp_is_empty!11413)))

(assert (=> b!435260 t!13208))

(declare-fun b_and!18197 () Bool)

(assert (= b_and!18195 (and (=> t!13208 result!6853) b_and!18197)))

(declare-fun m!423407 () Bool)

(assert (=> b!435251 m!423407))

(declare-fun m!423409 () Bool)

(assert (=> b!435252 m!423409))

(declare-fun m!423411 () Bool)

(assert (=> b!435252 m!423411))

(declare-fun m!423413 () Bool)

(assert (=> b!435252 m!423413))

(declare-fun m!423415 () Bool)

(assert (=> b!435252 m!423415))

(assert (=> b!435252 m!423409))

(declare-fun m!423417 () Bool)

(assert (=> b!435252 m!423417))

(declare-fun m!423419 () Bool)

(assert (=> b!435252 m!423419))

(declare-fun m!423421 () Bool)

(assert (=> b!435257 m!423421))

(declare-fun m!423423 () Bool)

(assert (=> b!435255 m!423423))

(declare-fun m!423425 () Bool)

(assert (=> b!435250 m!423425))

(declare-fun m!423427 () Bool)

(assert (=> b!435245 m!423427))

(declare-fun m!423429 () Bool)

(assert (=> mapNonEmpty!18741 m!423429))

(declare-fun m!423431 () Bool)

(assert (=> start!39980 m!423431))

(declare-fun m!423433 () Bool)

(assert (=> start!39980 m!423433))

(declare-fun m!423435 () Bool)

(assert (=> b!435248 m!423435))

(assert (=> b!435260 m!423409))

(declare-fun m!423437 () Bool)

(assert (=> b!435260 m!423437))

(declare-fun m!423439 () Bool)

(assert (=> b!435260 m!423439))

(declare-fun m!423441 () Bool)

(assert (=> b!435260 m!423441))

(assert (=> b!435260 m!423439))

(assert (=> b!435260 m!423437))

(declare-fun m!423443 () Bool)

(assert (=> b!435260 m!423443))

(declare-fun m!423445 () Bool)

(assert (=> b!435243 m!423445))

(declare-fun m!423447 () Bool)

(assert (=> b!435254 m!423447))

(declare-fun m!423449 () Bool)

(assert (=> b!435254 m!423449))

(declare-fun m!423451 () Bool)

(assert (=> b!435254 m!423451))

(declare-fun m!423453 () Bool)

(assert (=> b!435246 m!423453))

(assert (=> b!435246 m!423453))

(declare-fun m!423455 () Bool)

(assert (=> b!435246 m!423455))

(assert (=> b!435246 m!423409))

(assert (=> b!435246 m!423409))

(declare-fun m!423457 () Bool)

(assert (=> b!435246 m!423457))

(declare-fun m!423459 () Bool)

(assert (=> b!435249 m!423459))

(declare-fun m!423461 () Bool)

(assert (=> b!435249 m!423461))

(declare-fun m!423463 () Bool)

(assert (=> b!435259 m!423463))

(check-sat (not b!435246) (not b!435248) (not b_next!10261) (not b_lambda!9371) b_and!18197 (not b!435243) (not b!435255) (not b!435249) (not b!435251) (not b!435252) (not b!435260) (not mapNonEmpty!18741) (not start!39980) (not b!435254) (not b!435250) (not b!435257) tp_is_empty!11413 (not b!435259))
(check-sat b_and!18197 (not b_next!10261))
