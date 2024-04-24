; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39884 () Bool)

(assert start!39884)

(declare-fun b_free!10165 () Bool)

(declare-fun b_next!10165 () Bool)

(assert (=> start!39884 (= b_free!10165 (not b_next!10165))))

(declare-fun tp!36024 () Bool)

(declare-fun b_and!18003 () Bool)

(assert (=> start!39884 (= tp!36024 b_and!18003)))

(declare-fun b!432267 () Bool)

(declare-fun res!254289 () Bool)

(declare-fun e!255704 () Bool)

(assert (=> b!432267 (=> (not res!254289) (not e!255704))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432267 (= res!254289 (validKeyInArray!0 k0!794))))

(declare-fun b!432268 () Bool)

(declare-fun res!254284 () Bool)

(declare-fun e!255700 () Bool)

(assert (=> b!432268 (=> (not res!254284) (not e!255700))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432268 (= res!254284 (bvsle from!863 i!563))))

(declare-fun b!432269 () Bool)

(declare-fun e!255707 () Bool)

(declare-fun tp_is_empty!11317 () Bool)

(assert (=> b!432269 (= e!255707 tp_is_empty!11317)))

(declare-fun b!432270 () Bool)

(declare-fun res!254285 () Bool)

(assert (=> b!432270 (=> (not res!254285) (not e!255704))))

(declare-datatypes ((array!26470 0))(
  ( (array!26471 (arr!12684 (Array (_ BitVec 32) (_ BitVec 64))) (size!13036 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26470)

(declare-fun arrayContainsKey!0 (array!26470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432270 (= res!254285 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432271 () Bool)

(declare-fun res!254291 () Bool)

(assert (=> b!432271 (=> (not res!254291) (not e!255704))))

(declare-datatypes ((List!7428 0))(
  ( (Nil!7425) (Cons!7424 (h!8280 (_ BitVec 64)) (t!13034 List!7428)) )
))
(declare-fun arrayNoDuplicates!0 (array!26470 (_ BitVec 32) List!7428) Bool)

(assert (=> b!432271 (= res!254291 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7425))))

(declare-fun res!254292 () Bool)

(assert (=> start!39884 (=> (not res!254292) (not e!255704))))

(assert (=> start!39884 (= res!254292 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13036 _keys!709))))))

(assert (=> start!39884 e!255704))

(assert (=> start!39884 tp_is_empty!11317))

(assert (=> start!39884 tp!36024))

(assert (=> start!39884 true))

(declare-datatypes ((V!16195 0))(
  ( (V!16196 (val!5703 Int)) )
))
(declare-datatypes ((ValueCell!5315 0))(
  ( (ValueCellFull!5315 (v!7951 V!16195)) (EmptyCell!5315) )
))
(declare-datatypes ((array!26472 0))(
  ( (array!26473 (arr!12685 (Array (_ BitVec 32) ValueCell!5315)) (size!13037 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26472)

(declare-fun e!255708 () Bool)

(declare-fun array_inv!9286 (array!26472) Bool)

(assert (=> start!39884 (and (array_inv!9286 _values!549) e!255708)))

(declare-fun array_inv!9287 (array!26470) Bool)

(assert (=> start!39884 (array_inv!9287 _keys!709)))

(declare-fun b!432272 () Bool)

(declare-fun e!255709 () Bool)

(assert (=> b!432272 (= e!255700 e!255709)))

(declare-fun res!254283 () Bool)

(assert (=> b!432272 (=> (not res!254283) (not e!255709))))

(assert (=> b!432272 (= res!254283 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!198248 () array!26470)

(declare-fun minValue!515 () V!16195)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16195)

(declare-fun lt!198240 () array!26472)

(declare-datatypes ((tuple2!7436 0))(
  ( (tuple2!7437 (_1!3729 (_ BitVec 64)) (_2!3729 V!16195)) )
))
(declare-datatypes ((List!7429 0))(
  ( (Nil!7426) (Cons!7425 (h!8281 tuple2!7436) (t!13035 List!7429)) )
))
(declare-datatypes ((ListLongMap!6351 0))(
  ( (ListLongMap!6352 (toList!3191 List!7429)) )
))
(declare-fun lt!198237 () ListLongMap!6351)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1430 (array!26470 array!26472 (_ BitVec 32) (_ BitVec 32) V!16195 V!16195 (_ BitVec 32) Int) ListLongMap!6351)

(assert (=> b!432272 (= lt!198237 (getCurrentListMapNoExtraKeys!1430 lt!198248 lt!198240 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16195)

(assert (=> b!432272 (= lt!198240 (array!26473 (store (arr!12685 _values!549) i!563 (ValueCellFull!5315 v!412)) (size!13037 _values!549)))))

(declare-fun lt!198243 () ListLongMap!6351)

(assert (=> b!432272 (= lt!198243 (getCurrentListMapNoExtraKeys!1430 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432273 () Bool)

(declare-fun res!254287 () Bool)

(assert (=> b!432273 (=> (not res!254287) (not e!255704))))

(assert (=> b!432273 (= res!254287 (or (= (select (arr!12684 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12684 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432274 () Bool)

(declare-fun res!254279 () Bool)

(assert (=> b!432274 (=> (not res!254279) (not e!255704))))

(assert (=> b!432274 (= res!254279 (and (= (size!13037 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13036 _keys!709) (size!13037 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432275 () Bool)

(declare-fun e!255701 () Bool)

(assert (=> b!432275 (= e!255701 tp_is_empty!11317)))

(declare-fun mapIsEmpty!18597 () Bool)

(declare-fun mapRes!18597 () Bool)

(assert (=> mapIsEmpty!18597 mapRes!18597))

(declare-fun b!432276 () Bool)

(declare-fun res!254286 () Bool)

(assert (=> b!432276 (=> (not res!254286) (not e!255704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432276 (= res!254286 (validMask!0 mask!1025))))

(declare-fun b!432277 () Bool)

(declare-fun res!254288 () Bool)

(assert (=> b!432277 (=> (not res!254288) (not e!255704))))

(assert (=> b!432277 (= res!254288 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13036 _keys!709))))))

(declare-fun b!432278 () Bool)

(declare-datatypes ((Unit!12768 0))(
  ( (Unit!12769) )
))
(declare-fun e!255702 () Unit!12768)

(declare-fun Unit!12770 () Unit!12768)

(assert (=> b!432278 (= e!255702 Unit!12770)))

(declare-fun lt!198245 () Unit!12768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26470 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12768)

(assert (=> b!432278 (= lt!198245 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432278 false))

(declare-fun mapNonEmpty!18597 () Bool)

(declare-fun tp!36023 () Bool)

(assert (=> mapNonEmpty!18597 (= mapRes!18597 (and tp!36023 e!255701))))

(declare-fun mapRest!18597 () (Array (_ BitVec 32) ValueCell!5315))

(declare-fun mapValue!18597 () ValueCell!5315)

(declare-fun mapKey!18597 () (_ BitVec 32))

(assert (=> mapNonEmpty!18597 (= (arr!12685 _values!549) (store mapRest!18597 mapKey!18597 mapValue!18597))))

(declare-fun b!432279 () Bool)

(declare-fun Unit!12771 () Unit!12768)

(assert (=> b!432279 (= e!255702 Unit!12771)))

(declare-fun b!432280 () Bool)

(declare-fun res!254281 () Bool)

(assert (=> b!432280 (=> (not res!254281) (not e!255700))))

(assert (=> b!432280 (= res!254281 (arrayNoDuplicates!0 lt!198248 #b00000000000000000000000000000000 Nil!7425))))

(declare-fun b!432281 () Bool)

(declare-fun res!254282 () Bool)

(assert (=> b!432281 (=> (not res!254282) (not e!255704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26470 (_ BitVec 32)) Bool)

(assert (=> b!432281 (= res!254282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432282 () Bool)

(declare-fun e!255706 () Bool)

(declare-fun e!255703 () Bool)

(assert (=> b!432282 (= e!255706 e!255703)))

(declare-fun res!254280 () Bool)

(assert (=> b!432282 (=> res!254280 e!255703)))

(assert (=> b!432282 (= res!254280 (= k0!794 (select (arr!12684 _keys!709) from!863)))))

(assert (=> b!432282 (not (= (select (arr!12684 _keys!709) from!863) k0!794))))

(declare-fun lt!198244 () Unit!12768)

(assert (=> b!432282 (= lt!198244 e!255702)))

(declare-fun c!55560 () Bool)

(assert (=> b!432282 (= c!55560 (= (select (arr!12684 _keys!709) from!863) k0!794))))

(declare-fun lt!198239 () ListLongMap!6351)

(assert (=> b!432282 (= lt!198237 lt!198239)))

(declare-fun lt!198249 () ListLongMap!6351)

(declare-fun lt!198241 () tuple2!7436)

(declare-fun +!1398 (ListLongMap!6351 tuple2!7436) ListLongMap!6351)

(assert (=> b!432282 (= lt!198239 (+!1398 lt!198249 lt!198241))))

(declare-fun lt!198235 () V!16195)

(assert (=> b!432282 (= lt!198241 (tuple2!7437 (select (arr!12684 _keys!709) from!863) lt!198235))))

(declare-fun get!6313 (ValueCell!5315 V!16195) V!16195)

(declare-fun dynLambda!804 (Int (_ BitVec 64)) V!16195)

(assert (=> b!432282 (= lt!198235 (get!6313 (select (arr!12685 _values!549) from!863) (dynLambda!804 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432283 () Bool)

(assert (=> b!432283 (= e!255709 (not e!255706))))

(declare-fun res!254278 () Bool)

(assert (=> b!432283 (=> res!254278 e!255706)))

(assert (=> b!432283 (= res!254278 (not (validKeyInArray!0 (select (arr!12684 _keys!709) from!863))))))

(declare-fun lt!198242 () ListLongMap!6351)

(assert (=> b!432283 (= lt!198242 lt!198249)))

(declare-fun lt!198247 () ListLongMap!6351)

(declare-fun lt!198246 () tuple2!7436)

(assert (=> b!432283 (= lt!198249 (+!1398 lt!198247 lt!198246))))

(assert (=> b!432283 (= lt!198242 (getCurrentListMapNoExtraKeys!1430 lt!198248 lt!198240 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432283 (= lt!198246 (tuple2!7437 k0!794 v!412))))

(assert (=> b!432283 (= lt!198247 (getCurrentListMapNoExtraKeys!1430 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198236 () Unit!12768)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!569 (array!26470 array!26472 (_ BitVec 32) (_ BitVec 32) V!16195 V!16195 (_ BitVec 32) (_ BitVec 64) V!16195 (_ BitVec 32) Int) Unit!12768)

(assert (=> b!432283 (= lt!198236 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!569 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432284 () Bool)

(assert (=> b!432284 (= e!255703 true)))

(assert (=> b!432284 (= lt!198239 (+!1398 (+!1398 lt!198247 lt!198241) lt!198246))))

(declare-fun lt!198238 () Unit!12768)

(declare-fun addCommutativeForDiffKeys!377 (ListLongMap!6351 (_ BitVec 64) V!16195 (_ BitVec 64) V!16195) Unit!12768)

(assert (=> b!432284 (= lt!198238 (addCommutativeForDiffKeys!377 lt!198247 k0!794 v!412 (select (arr!12684 _keys!709) from!863) lt!198235))))

(declare-fun b!432285 () Bool)

(assert (=> b!432285 (= e!255704 e!255700)))

(declare-fun res!254290 () Bool)

(assert (=> b!432285 (=> (not res!254290) (not e!255700))))

(assert (=> b!432285 (= res!254290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198248 mask!1025))))

(assert (=> b!432285 (= lt!198248 (array!26471 (store (arr!12684 _keys!709) i!563 k0!794) (size!13036 _keys!709)))))

(declare-fun b!432286 () Bool)

(assert (=> b!432286 (= e!255708 (and e!255707 mapRes!18597))))

(declare-fun condMapEmpty!18597 () Bool)

(declare-fun mapDefault!18597 () ValueCell!5315)

(assert (=> b!432286 (= condMapEmpty!18597 (= (arr!12685 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5315)) mapDefault!18597)))))

(assert (= (and start!39884 res!254292) b!432276))

(assert (= (and b!432276 res!254286) b!432274))

(assert (= (and b!432274 res!254279) b!432281))

(assert (= (and b!432281 res!254282) b!432271))

(assert (= (and b!432271 res!254291) b!432277))

(assert (= (and b!432277 res!254288) b!432267))

(assert (= (and b!432267 res!254289) b!432273))

(assert (= (and b!432273 res!254287) b!432270))

(assert (= (and b!432270 res!254285) b!432285))

(assert (= (and b!432285 res!254290) b!432280))

(assert (= (and b!432280 res!254281) b!432268))

(assert (= (and b!432268 res!254284) b!432272))

(assert (= (and b!432272 res!254283) b!432283))

(assert (= (and b!432283 (not res!254278)) b!432282))

(assert (= (and b!432282 c!55560) b!432278))

(assert (= (and b!432282 (not c!55560)) b!432279))

(assert (= (and b!432282 (not res!254280)) b!432284))

(assert (= (and b!432286 condMapEmpty!18597) mapIsEmpty!18597))

(assert (= (and b!432286 (not condMapEmpty!18597)) mapNonEmpty!18597))

(get-info :version)

(assert (= (and mapNonEmpty!18597 ((_ is ValueCellFull!5315) mapValue!18597)) b!432275))

(assert (= (and b!432286 ((_ is ValueCellFull!5315) mapDefault!18597)) b!432269))

(assert (= start!39884 b!432286))

(declare-fun b_lambda!9275 () Bool)

(assert (=> (not b_lambda!9275) (not b!432282)))

(declare-fun t!13033 () Bool)

(declare-fun tb!3563 () Bool)

(assert (=> (and start!39884 (= defaultEntry!557 defaultEntry!557) t!13033) tb!3563))

(declare-fun result!6661 () Bool)

(assert (=> tb!3563 (= result!6661 tp_is_empty!11317)))

(assert (=> b!432282 t!13033))

(declare-fun b_and!18005 () Bool)

(assert (= b_and!18003 (and (=> t!13033 result!6661) b_and!18005)))

(declare-fun m!420623 () Bool)

(assert (=> b!432270 m!420623))

(declare-fun m!420625 () Bool)

(assert (=> b!432282 m!420625))

(declare-fun m!420627 () Bool)

(assert (=> b!432282 m!420627))

(declare-fun m!420629 () Bool)

(assert (=> b!432282 m!420629))

(declare-fun m!420631 () Bool)

(assert (=> b!432282 m!420631))

(assert (=> b!432282 m!420629))

(assert (=> b!432282 m!420627))

(declare-fun m!420633 () Bool)

(assert (=> b!432282 m!420633))

(assert (=> b!432283 m!420625))

(declare-fun m!420635 () Bool)

(assert (=> b!432283 m!420635))

(declare-fun m!420637 () Bool)

(assert (=> b!432283 m!420637))

(assert (=> b!432283 m!420625))

(declare-fun m!420639 () Bool)

(assert (=> b!432283 m!420639))

(declare-fun m!420641 () Bool)

(assert (=> b!432283 m!420641))

(declare-fun m!420643 () Bool)

(assert (=> b!432283 m!420643))

(declare-fun m!420645 () Bool)

(assert (=> b!432281 m!420645))

(declare-fun m!420647 () Bool)

(assert (=> b!432285 m!420647))

(declare-fun m!420649 () Bool)

(assert (=> b!432285 m!420649))

(declare-fun m!420651 () Bool)

(assert (=> b!432273 m!420651))

(declare-fun m!420653 () Bool)

(assert (=> b!432272 m!420653))

(declare-fun m!420655 () Bool)

(assert (=> b!432272 m!420655))

(declare-fun m!420657 () Bool)

(assert (=> b!432272 m!420657))

(declare-fun m!420659 () Bool)

(assert (=> start!39884 m!420659))

(declare-fun m!420661 () Bool)

(assert (=> start!39884 m!420661))

(declare-fun m!420663 () Bool)

(assert (=> b!432267 m!420663))

(declare-fun m!420665 () Bool)

(assert (=> b!432284 m!420665))

(assert (=> b!432284 m!420665))

(declare-fun m!420667 () Bool)

(assert (=> b!432284 m!420667))

(assert (=> b!432284 m!420625))

(assert (=> b!432284 m!420625))

(declare-fun m!420669 () Bool)

(assert (=> b!432284 m!420669))

(declare-fun m!420671 () Bool)

(assert (=> b!432271 m!420671))

(declare-fun m!420673 () Bool)

(assert (=> b!432278 m!420673))

(declare-fun m!420675 () Bool)

(assert (=> b!432276 m!420675))

(declare-fun m!420677 () Bool)

(assert (=> b!432280 m!420677))

(declare-fun m!420679 () Bool)

(assert (=> mapNonEmpty!18597 m!420679))

(check-sat (not b!432284) (not b!432280) (not b!432272) b_and!18005 (not mapNonEmpty!18597) (not b_next!10165) (not b!432278) (not b!432281) (not b!432282) tp_is_empty!11317 (not start!39884) (not b!432267) (not b!432283) (not b!432271) (not b!432285) (not b!432270) (not b_lambda!9275) (not b!432276))
(check-sat b_and!18005 (not b_next!10165))
