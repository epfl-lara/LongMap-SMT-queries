; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39306 () Bool)

(assert start!39306)

(declare-fun b_free!9573 () Bool)

(declare-fun b_next!9573 () Bool)

(assert (=> start!39306 (= b_free!9573 (not b_next!9573))))

(declare-fun tp!34247 () Bool)

(declare-fun b_and!17021 () Bool)

(assert (=> start!39306 (= tp!34247 b_and!17021)))

(declare-fun b!416191 () Bool)

(declare-fun e!248487 () Bool)

(declare-fun tp_is_empty!10725 () Bool)

(assert (=> b!416191 (= e!248487 tp_is_empty!10725)))

(declare-fun b!416192 () Bool)

(declare-fun e!248492 () Bool)

(declare-fun e!248491 () Bool)

(assert (=> b!416192 (= e!248492 (not e!248491))))

(declare-fun res!242229 () Bool)

(assert (=> b!416192 (=> res!242229 e!248491)))

(declare-datatypes ((array!25305 0))(
  ( (array!25306 (arr!12102 (Array (_ BitVec 32) (_ BitVec 64))) (size!12454 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25305)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416192 (= res!242229 (validKeyInArray!0 (select (arr!12102 _keys!709) from!863)))))

(declare-fun e!248485 () Bool)

(assert (=> b!416192 e!248485))

(declare-fun c!55073 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416192 (= c!55073 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15405 0))(
  ( (V!15406 (val!5407 Int)) )
))
(declare-fun minValue!515 () V!15405)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5019 0))(
  ( (ValueCellFull!5019 (v!7654 V!15405)) (EmptyCell!5019) )
))
(declare-datatypes ((array!25307 0))(
  ( (array!25308 (arr!12103 (Array (_ BitVec 32) ValueCell!5019)) (size!12455 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25307)

(declare-fun zeroValue!515 () V!15405)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12300 0))(
  ( (Unit!12301) )
))
(declare-fun lt!190536 () Unit!12300)

(declare-fun v!412 () V!15405)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!407 (array!25305 array!25307 (_ BitVec 32) (_ BitVec 32) V!15405 V!15405 (_ BitVec 32) (_ BitVec 64) V!15405 (_ BitVec 32) Int) Unit!12300)

(assert (=> b!416192 (= lt!190536 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!407 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416194 () Bool)

(declare-fun res!242227 () Bool)

(declare-fun e!248486 () Bool)

(assert (=> b!416194 (=> (not res!242227) (not e!248486))))

(assert (=> b!416194 (= res!242227 (bvsle from!863 i!563))))

(declare-datatypes ((tuple2!7048 0))(
  ( (tuple2!7049 (_1!3535 (_ BitVec 64)) (_2!3535 V!15405)) )
))
(declare-datatypes ((List!7067 0))(
  ( (Nil!7064) (Cons!7063 (h!7919 tuple2!7048) (t!12305 List!7067)) )
))
(declare-datatypes ((ListLongMap!5961 0))(
  ( (ListLongMap!5962 (toList!2996 List!7067)) )
))
(declare-fun call!28897 () ListLongMap!5961)

(declare-fun lt!190537 () array!25307)

(declare-fun lt!190534 () array!25305)

(declare-fun bm!28894 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1201 (array!25305 array!25307 (_ BitVec 32) (_ BitVec 32) V!15405 V!15405 (_ BitVec 32) Int) ListLongMap!5961)

(assert (=> bm!28894 (= call!28897 (getCurrentListMapNoExtraKeys!1201 (ite c!55073 lt!190534 _keys!709) (ite c!55073 lt!190537 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17709 () Bool)

(declare-fun mapRes!17709 () Bool)

(declare-fun tp!34248 () Bool)

(declare-fun e!248493 () Bool)

(assert (=> mapNonEmpty!17709 (= mapRes!17709 (and tp!34248 e!248493))))

(declare-fun mapKey!17709 () (_ BitVec 32))

(declare-fun mapValue!17709 () ValueCell!5019)

(declare-fun mapRest!17709 () (Array (_ BitVec 32) ValueCell!5019))

(assert (=> mapNonEmpty!17709 (= (arr!12103 _values!549) (store mapRest!17709 mapKey!17709 mapValue!17709))))

(declare-fun bm!28895 () Bool)

(declare-fun call!28898 () ListLongMap!5961)

(assert (=> bm!28895 (= call!28898 (getCurrentListMapNoExtraKeys!1201 (ite c!55073 _keys!709 lt!190534) (ite c!55073 _values!549 lt!190537) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416195 () Bool)

(declare-fun res!242221 () Bool)

(declare-fun e!248488 () Bool)

(assert (=> b!416195 (=> (not res!242221) (not e!248488))))

(declare-fun arrayContainsKey!0 (array!25305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416195 (= res!242221 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416196 () Bool)

(declare-fun res!242218 () Bool)

(assert (=> b!416196 (=> (not res!242218) (not e!248488))))

(assert (=> b!416196 (= res!242218 (or (= (select (arr!12102 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12102 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17709 () Bool)

(assert (=> mapIsEmpty!17709 mapRes!17709))

(declare-fun b!416197 () Bool)

(declare-fun res!242219 () Bool)

(assert (=> b!416197 (=> (not res!242219) (not e!248488))))

(assert (=> b!416197 (= res!242219 (validKeyInArray!0 k0!794))))

(declare-fun b!416198 () Bool)

(assert (=> b!416198 (= e!248485 (= call!28898 call!28897))))

(declare-fun b!416199 () Bool)

(declare-fun e!248490 () Bool)

(assert (=> b!416199 (= e!248490 (and e!248487 mapRes!17709))))

(declare-fun condMapEmpty!17709 () Bool)

(declare-fun mapDefault!17709 () ValueCell!5019)

(assert (=> b!416199 (= condMapEmpty!17709 (= (arr!12103 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5019)) mapDefault!17709)))))

(declare-fun b!416193 () Bool)

(declare-fun res!242217 () Bool)

(assert (=> b!416193 (=> (not res!242217) (not e!248488))))

(assert (=> b!416193 (= res!242217 (and (= (size!12455 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12454 _keys!709) (size!12455 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!242222 () Bool)

(assert (=> start!39306 (=> (not res!242222) (not e!248488))))

(assert (=> start!39306 (= res!242222 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12454 _keys!709))))))

(assert (=> start!39306 e!248488))

(assert (=> start!39306 tp_is_empty!10725))

(assert (=> start!39306 tp!34247))

(assert (=> start!39306 true))

(declare-fun array_inv!8826 (array!25307) Bool)

(assert (=> start!39306 (and (array_inv!8826 _values!549) e!248490)))

(declare-fun array_inv!8827 (array!25305) Bool)

(assert (=> start!39306 (array_inv!8827 _keys!709)))

(declare-fun b!416200 () Bool)

(declare-fun res!242223 () Bool)

(assert (=> b!416200 (=> (not res!242223) (not e!248486))))

(declare-datatypes ((List!7068 0))(
  ( (Nil!7065) (Cons!7064 (h!7920 (_ BitVec 64)) (t!12306 List!7068)) )
))
(declare-fun arrayNoDuplicates!0 (array!25305 (_ BitVec 32) List!7068) Bool)

(assert (=> b!416200 (= res!242223 (arrayNoDuplicates!0 lt!190534 #b00000000000000000000000000000000 Nil!7065))))

(declare-fun b!416201 () Bool)

(declare-fun res!242220 () Bool)

(assert (=> b!416201 (=> (not res!242220) (not e!248488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25305 (_ BitVec 32)) Bool)

(assert (=> b!416201 (= res!242220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416202 () Bool)

(assert (=> b!416202 (= e!248486 e!248492)))

(declare-fun res!242228 () Bool)

(assert (=> b!416202 (=> (not res!242228) (not e!248492))))

(assert (=> b!416202 (= res!242228 (= from!863 i!563))))

(declare-fun lt!190530 () ListLongMap!5961)

(assert (=> b!416202 (= lt!190530 (getCurrentListMapNoExtraKeys!1201 lt!190534 lt!190537 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416202 (= lt!190537 (array!25308 (store (arr!12103 _values!549) i!563 (ValueCellFull!5019 v!412)) (size!12455 _values!549)))))

(declare-fun lt!190532 () ListLongMap!5961)

(assert (=> b!416202 (= lt!190532 (getCurrentListMapNoExtraKeys!1201 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416203 () Bool)

(declare-fun res!242224 () Bool)

(assert (=> b!416203 (=> (not res!242224) (not e!248488))))

(assert (=> b!416203 (= res!242224 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12454 _keys!709))))))

(declare-fun b!416204 () Bool)

(declare-fun res!242216 () Bool)

(assert (=> b!416204 (=> (not res!242216) (not e!248488))))

(assert (=> b!416204 (= res!242216 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7065))))

(declare-fun b!416205 () Bool)

(declare-fun +!1198 (ListLongMap!5961 tuple2!7048) ListLongMap!5961)

(assert (=> b!416205 (= e!248485 (= call!28897 (+!1198 call!28898 (tuple2!7049 k0!794 v!412))))))

(declare-fun b!416206 () Bool)

(assert (=> b!416206 (= e!248493 tp_is_empty!10725)))

(declare-fun b!416207 () Bool)

(declare-fun res!242226 () Bool)

(assert (=> b!416207 (=> (not res!242226) (not e!248488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416207 (= res!242226 (validMask!0 mask!1025))))

(declare-fun b!416208 () Bool)

(assert (=> b!416208 (= e!248491 true)))

(declare-fun lt!190533 () ListLongMap!5961)

(declare-fun lt!190538 () V!15405)

(declare-fun lt!190531 () tuple2!7048)

(assert (=> b!416208 (= (+!1198 lt!190533 lt!190531) (+!1198 (+!1198 lt!190533 (tuple2!7049 k0!794 lt!190538)) lt!190531))))

(declare-fun lt!190529 () V!15405)

(assert (=> b!416208 (= lt!190531 (tuple2!7049 k0!794 lt!190529))))

(declare-fun lt!190535 () Unit!12300)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!3 (ListLongMap!5961 (_ BitVec 64) V!15405 V!15405) Unit!12300)

(assert (=> b!416208 (= lt!190535 (addSameAsAddTwiceSameKeyDiffValues!3 lt!190533 k0!794 lt!190538 lt!190529))))

(declare-fun lt!190528 () V!15405)

(declare-fun get!5979 (ValueCell!5019 V!15405) V!15405)

(assert (=> b!416208 (= lt!190538 (get!5979 (select (arr!12103 _values!549) from!863) lt!190528))))

(assert (=> b!416208 (= lt!190530 (+!1198 lt!190533 (tuple2!7049 (select (arr!12102 lt!190534) from!863) lt!190529)))))

(assert (=> b!416208 (= lt!190529 (get!5979 (select (store (arr!12103 _values!549) i!563 (ValueCellFull!5019 v!412)) from!863) lt!190528))))

(declare-fun dynLambda!674 (Int (_ BitVec 64)) V!15405)

(assert (=> b!416208 (= lt!190528 (dynLambda!674 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416208 (= lt!190533 (getCurrentListMapNoExtraKeys!1201 lt!190534 lt!190537 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416209 () Bool)

(assert (=> b!416209 (= e!248488 e!248486)))

(declare-fun res!242225 () Bool)

(assert (=> b!416209 (=> (not res!242225) (not e!248486))))

(assert (=> b!416209 (= res!242225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190534 mask!1025))))

(assert (=> b!416209 (= lt!190534 (array!25306 (store (arr!12102 _keys!709) i!563 k0!794) (size!12454 _keys!709)))))

(assert (= (and start!39306 res!242222) b!416207))

(assert (= (and b!416207 res!242226) b!416193))

(assert (= (and b!416193 res!242217) b!416201))

(assert (= (and b!416201 res!242220) b!416204))

(assert (= (and b!416204 res!242216) b!416203))

(assert (= (and b!416203 res!242224) b!416197))

(assert (= (and b!416197 res!242219) b!416196))

(assert (= (and b!416196 res!242218) b!416195))

(assert (= (and b!416195 res!242221) b!416209))

(assert (= (and b!416209 res!242225) b!416200))

(assert (= (and b!416200 res!242223) b!416194))

(assert (= (and b!416194 res!242227) b!416202))

(assert (= (and b!416202 res!242228) b!416192))

(assert (= (and b!416192 c!55073) b!416205))

(assert (= (and b!416192 (not c!55073)) b!416198))

(assert (= (or b!416205 b!416198) bm!28894))

(assert (= (or b!416205 b!416198) bm!28895))

(assert (= (and b!416192 (not res!242229)) b!416208))

(assert (= (and b!416199 condMapEmpty!17709) mapIsEmpty!17709))

(assert (= (and b!416199 (not condMapEmpty!17709)) mapNonEmpty!17709))

(get-info :version)

(assert (= (and mapNonEmpty!17709 ((_ is ValueCellFull!5019) mapValue!17709)) b!416206))

(assert (= (and b!416199 ((_ is ValueCellFull!5019) mapDefault!17709)) b!416191))

(assert (= start!39306 b!416199))

(declare-fun b_lambda!8877 () Bool)

(assert (=> (not b_lambda!8877) (not b!416208)))

(declare-fun t!12304 () Bool)

(declare-fun tb!3195 () Bool)

(assert (=> (and start!39306 (= defaultEntry!557 defaultEntry!557) t!12304) tb!3195))

(declare-fun result!5917 () Bool)

(assert (=> tb!3195 (= result!5917 tp_is_empty!10725)))

(assert (=> b!416208 t!12304))

(declare-fun b_and!17023 () Bool)

(assert (= b_and!17021 (and (=> t!12304 result!5917) b_and!17023)))

(declare-fun m!405311 () Bool)

(assert (=> b!416201 m!405311))

(declare-fun m!405313 () Bool)

(assert (=> start!39306 m!405313))

(declare-fun m!405315 () Bool)

(assert (=> start!39306 m!405315))

(declare-fun m!405317 () Bool)

(assert (=> b!416192 m!405317))

(assert (=> b!416192 m!405317))

(declare-fun m!405319 () Bool)

(assert (=> b!416192 m!405319))

(declare-fun m!405321 () Bool)

(assert (=> b!416192 m!405321))

(declare-fun m!405323 () Bool)

(assert (=> b!416202 m!405323))

(declare-fun m!405325 () Bool)

(assert (=> b!416202 m!405325))

(declare-fun m!405327 () Bool)

(assert (=> b!416202 m!405327))

(declare-fun m!405329 () Bool)

(assert (=> b!416208 m!405329))

(declare-fun m!405331 () Bool)

(assert (=> b!416208 m!405331))

(declare-fun m!405333 () Bool)

(assert (=> b!416208 m!405333))

(declare-fun m!405335 () Bool)

(assert (=> b!416208 m!405335))

(declare-fun m!405337 () Bool)

(assert (=> b!416208 m!405337))

(declare-fun m!405339 () Bool)

(assert (=> b!416208 m!405339))

(declare-fun m!405341 () Bool)

(assert (=> b!416208 m!405341))

(declare-fun m!405343 () Bool)

(assert (=> b!416208 m!405343))

(assert (=> b!416208 m!405337))

(assert (=> b!416208 m!405335))

(declare-fun m!405345 () Bool)

(assert (=> b!416208 m!405345))

(assert (=> b!416208 m!405325))

(declare-fun m!405347 () Bool)

(assert (=> b!416208 m!405347))

(declare-fun m!405349 () Bool)

(assert (=> b!416208 m!405349))

(declare-fun m!405351 () Bool)

(assert (=> b!416208 m!405351))

(assert (=> b!416208 m!405331))

(declare-fun m!405353 () Bool)

(assert (=> b!416205 m!405353))

(declare-fun m!405355 () Bool)

(assert (=> b!416209 m!405355))

(declare-fun m!405357 () Bool)

(assert (=> b!416209 m!405357))

(declare-fun m!405359 () Bool)

(assert (=> b!416197 m!405359))

(declare-fun m!405361 () Bool)

(assert (=> b!416207 m!405361))

(declare-fun m!405363 () Bool)

(assert (=> b!416200 m!405363))

(declare-fun m!405365 () Bool)

(assert (=> bm!28895 m!405365))

(declare-fun m!405367 () Bool)

(assert (=> mapNonEmpty!17709 m!405367))

(declare-fun m!405369 () Bool)

(assert (=> b!416196 m!405369))

(declare-fun m!405371 () Bool)

(assert (=> b!416204 m!405371))

(declare-fun m!405373 () Bool)

(assert (=> b!416195 m!405373))

(declare-fun m!405375 () Bool)

(assert (=> bm!28894 m!405375))

(check-sat (not b!416204) (not b!416207) (not b!416209) (not bm!28894) (not b_lambda!8877) (not start!39306) (not b_next!9573) tp_is_empty!10725 (not b!416197) b_and!17023 (not b!416202) (not bm!28895) (not b!416195) (not b!416200) (not mapNonEmpty!17709) (not b!416201) (not b!416205) (not b!416192) (not b!416208))
(check-sat b_and!17023 (not b_next!9573))
