; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34632 () Bool)

(assert start!34632)

(declare-fun b_free!7479 () Bool)

(declare-fun b_next!7479 () Bool)

(assert (=> start!34632 (= b_free!7479 (not b_next!7479))))

(declare-fun tp!25994 () Bool)

(declare-fun b_and!14695 () Bool)

(assert (=> start!34632 (= tp!25994 b_and!14695)))

(declare-fun b!346071 () Bool)

(declare-fun res!191436 () Bool)

(declare-fun e!212105 () Bool)

(assert (=> b!346071 (=> (not res!191436) (not e!212105))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10885 0))(
  ( (V!10886 (val!3760 Int)) )
))
(declare-datatypes ((ValueCell!3372 0))(
  ( (ValueCellFull!3372 (v!5940 V!10885)) (EmptyCell!3372) )
))
(declare-datatypes ((array!18451 0))(
  ( (array!18452 (arr!8738 (Array (_ BitVec 32) ValueCell!3372)) (size!9090 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18451)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((array!18453 0))(
  ( (array!18454 (arr!8739 (Array (_ BitVec 32) (_ BitVec 64))) (size!9091 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18453)

(assert (=> b!346071 (= res!191436 (and (= (size!9090 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9091 _keys!1895) (size!9090 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346072 () Bool)

(declare-fun res!191437 () Bool)

(declare-fun e!212107 () Bool)

(assert (=> b!346072 (=> (not res!191437) (not e!212107))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3368 0))(
  ( (MissingZero!3368 (index!15651 (_ BitVec 32))) (Found!3368 (index!15652 (_ BitVec 32))) (Intermediate!3368 (undefined!4180 Bool) (index!15653 (_ BitVec 32)) (x!34474 (_ BitVec 32))) (Undefined!3368) (MissingVacant!3368 (index!15654 (_ BitVec 32))) )
))
(declare-fun lt!163177 () SeekEntryResult!3368)

(declare-fun arrayContainsKey!0 (array!18453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346072 (= res!191437 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15652 lt!163177)))))

(declare-fun b!346073 () Bool)

(declare-fun e!212106 () Bool)

(declare-fun tp_is_empty!7431 () Bool)

(assert (=> b!346073 (= e!212106 tp_is_empty!7431)))

(declare-fun mapIsEmpty!12597 () Bool)

(declare-fun mapRes!12597 () Bool)

(assert (=> mapIsEmpty!12597 mapRes!12597))

(declare-fun b!346075 () Bool)

(assert (=> b!346075 (= e!212105 e!212107)))

(declare-fun res!191432 () Bool)

(assert (=> b!346075 (=> (not res!191432) (not e!212107))))

(get-info :version)

(assert (=> b!346075 (= res!191432 (and ((_ is Found!3368) lt!163177) (= (select (arr!8739 _keys!1895) (index!15652 lt!163177)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18453 (_ BitVec 32)) SeekEntryResult!3368)

(assert (=> b!346075 (= lt!163177 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346076 () Bool)

(declare-fun e!212104 () Bool)

(assert (=> b!346076 (= e!212104 tp_is_empty!7431)))

(declare-fun b!346077 () Bool)

(declare-fun e!212109 () Bool)

(assert (=> b!346077 (= e!212109 (and e!212104 mapRes!12597))))

(declare-fun condMapEmpty!12597 () Bool)

(declare-fun mapDefault!12597 () ValueCell!3372)

(assert (=> b!346077 (= condMapEmpty!12597 (= (arr!8738 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3372)) mapDefault!12597)))))

(declare-fun b!346078 () Bool)

(declare-fun res!191438 () Bool)

(assert (=> b!346078 (=> (not res!191438) (not e!212105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346078 (= res!191438 (validKeyInArray!0 k0!1348))))

(declare-fun b!346079 () Bool)

(declare-fun res!191435 () Bool)

(assert (=> b!346079 (=> (not res!191435) (not e!212105))))

(declare-datatypes ((List!5059 0))(
  ( (Nil!5056) (Cons!5055 (h!5911 (_ BitVec 64)) (t!10183 List!5059)) )
))
(declare-fun arrayNoDuplicates!0 (array!18453 (_ BitVec 32) List!5059) Bool)

(assert (=> b!346079 (= res!191435 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5056))))

(declare-fun b!346080 () Bool)

(declare-fun res!191433 () Bool)

(assert (=> b!346080 (=> (not res!191433) (not e!212105))))

(declare-fun zeroValue!1467 () V!10885)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10885)

(declare-datatypes ((tuple2!5436 0))(
  ( (tuple2!5437 (_1!2729 (_ BitVec 64)) (_2!2729 V!10885)) )
))
(declare-datatypes ((List!5060 0))(
  ( (Nil!5057) (Cons!5056 (h!5912 tuple2!5436) (t!10184 List!5060)) )
))
(declare-datatypes ((ListLongMap!4349 0))(
  ( (ListLongMap!4350 (toList!2190 List!5060)) )
))
(declare-fun contains!2252 (ListLongMap!4349 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1711 (array!18453 array!18451 (_ BitVec 32) (_ BitVec 32) V!10885 V!10885 (_ BitVec 32) Int) ListLongMap!4349)

(assert (=> b!346080 (= res!191433 (not (contains!2252 (getCurrentListMap!1711 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!191431 () Bool)

(assert (=> start!34632 (=> (not res!191431) (not e!212105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34632 (= res!191431 (validMask!0 mask!2385))))

(assert (=> start!34632 e!212105))

(assert (=> start!34632 true))

(assert (=> start!34632 tp_is_empty!7431))

(assert (=> start!34632 tp!25994))

(declare-fun array_inv!6466 (array!18451) Bool)

(assert (=> start!34632 (and (array_inv!6466 _values!1525) e!212109)))

(declare-fun array_inv!6467 (array!18453) Bool)

(assert (=> start!34632 (array_inv!6467 _keys!1895)))

(declare-fun b!346074 () Bool)

(assert (=> b!346074 (= e!212107 (and (bvsge (index!15652 lt!163177) #b00000000000000000000000000000000) (bvsge (index!15652 lt!163177) (size!9091 _keys!1895))))))

(declare-fun mapNonEmpty!12597 () Bool)

(declare-fun tp!25995 () Bool)

(assert (=> mapNonEmpty!12597 (= mapRes!12597 (and tp!25995 e!212106))))

(declare-fun mapRest!12597 () (Array (_ BitVec 32) ValueCell!3372))

(declare-fun mapValue!12597 () ValueCell!3372)

(declare-fun mapKey!12597 () (_ BitVec 32))

(assert (=> mapNonEmpty!12597 (= (arr!8738 _values!1525) (store mapRest!12597 mapKey!12597 mapValue!12597))))

(declare-fun b!346081 () Bool)

(declare-fun res!191434 () Bool)

(assert (=> b!346081 (=> (not res!191434) (not e!212105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18453 (_ BitVec 32)) Bool)

(assert (=> b!346081 (= res!191434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34632 res!191431) b!346071))

(assert (= (and b!346071 res!191436) b!346081))

(assert (= (and b!346081 res!191434) b!346079))

(assert (= (and b!346079 res!191435) b!346078))

(assert (= (and b!346078 res!191438) b!346080))

(assert (= (and b!346080 res!191433) b!346075))

(assert (= (and b!346075 res!191432) b!346072))

(assert (= (and b!346072 res!191437) b!346074))

(assert (= (and b!346077 condMapEmpty!12597) mapIsEmpty!12597))

(assert (= (and b!346077 (not condMapEmpty!12597)) mapNonEmpty!12597))

(assert (= (and mapNonEmpty!12597 ((_ is ValueCellFull!3372) mapValue!12597)) b!346073))

(assert (= (and b!346077 ((_ is ValueCellFull!3372) mapDefault!12597)) b!346076))

(assert (= start!34632 b!346077))

(declare-fun m!347271 () Bool)

(assert (=> mapNonEmpty!12597 m!347271))

(declare-fun m!347273 () Bool)

(assert (=> b!346072 m!347273))

(declare-fun m!347275 () Bool)

(assert (=> b!346080 m!347275))

(assert (=> b!346080 m!347275))

(declare-fun m!347277 () Bool)

(assert (=> b!346080 m!347277))

(declare-fun m!347279 () Bool)

(assert (=> start!34632 m!347279))

(declare-fun m!347281 () Bool)

(assert (=> start!34632 m!347281))

(declare-fun m!347283 () Bool)

(assert (=> start!34632 m!347283))

(declare-fun m!347285 () Bool)

(assert (=> b!346079 m!347285))

(declare-fun m!347287 () Bool)

(assert (=> b!346081 m!347287))

(declare-fun m!347289 () Bool)

(assert (=> b!346075 m!347289))

(declare-fun m!347291 () Bool)

(assert (=> b!346075 m!347291))

(declare-fun m!347293 () Bool)

(assert (=> b!346078 m!347293))

(check-sat (not start!34632) b_and!14695 (not b!346078) (not b!346080) (not b_next!7479) (not b!346081) (not b!346072) tp_is_empty!7431 (not b!346075) (not b!346079) (not mapNonEmpty!12597))
(check-sat b_and!14695 (not b_next!7479))
(get-model)

(declare-fun d!71203 () Bool)

(declare-fun res!191468 () Bool)

(declare-fun e!212136 () Bool)

(assert (=> d!71203 (=> res!191468 e!212136)))

(assert (=> d!71203 (= res!191468 (bvsge #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(assert (=> d!71203 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!212136)))

(declare-fun bm!26782 () Bool)

(declare-fun call!26785 () Bool)

(assert (=> bm!26782 (= call!26785 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!346123 () Bool)

(declare-fun e!212135 () Bool)

(declare-fun e!212134 () Bool)

(assert (=> b!346123 (= e!212135 e!212134)))

(declare-fun lt!163188 () (_ BitVec 64))

(assert (=> b!346123 (= lt!163188 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10745 0))(
  ( (Unit!10746) )
))
(declare-fun lt!163189 () Unit!10745)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18453 (_ BitVec 64) (_ BitVec 32)) Unit!10745)

(assert (=> b!346123 (= lt!163189 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163188 #b00000000000000000000000000000000))))

(assert (=> b!346123 (arrayContainsKey!0 _keys!1895 lt!163188 #b00000000000000000000000000000000)))

(declare-fun lt!163187 () Unit!10745)

(assert (=> b!346123 (= lt!163187 lt!163189)))

(declare-fun res!191467 () Bool)

(assert (=> b!346123 (= res!191467 (= (seekEntryOrOpen!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3368 #b00000000000000000000000000000000)))))

(assert (=> b!346123 (=> (not res!191467) (not e!212134))))

(declare-fun b!346124 () Bool)

(assert (=> b!346124 (= e!212136 e!212135)))

(declare-fun c!53103 () Bool)

(assert (=> b!346124 (= c!53103 (validKeyInArray!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346125 () Bool)

(assert (=> b!346125 (= e!212134 call!26785)))

(declare-fun b!346126 () Bool)

(assert (=> b!346126 (= e!212135 call!26785)))

(assert (= (and d!71203 (not res!191468)) b!346124))

(assert (= (and b!346124 c!53103) b!346123))

(assert (= (and b!346124 (not c!53103)) b!346126))

(assert (= (and b!346123 res!191467) b!346125))

(assert (= (or b!346125 b!346126) bm!26782))

(declare-fun m!347319 () Bool)

(assert (=> bm!26782 m!347319))

(declare-fun m!347321 () Bool)

(assert (=> b!346123 m!347321))

(declare-fun m!347323 () Bool)

(assert (=> b!346123 m!347323))

(declare-fun m!347325 () Bool)

(assert (=> b!346123 m!347325))

(assert (=> b!346123 m!347321))

(declare-fun m!347327 () Bool)

(assert (=> b!346123 m!347327))

(assert (=> b!346124 m!347321))

(assert (=> b!346124 m!347321))

(declare-fun m!347329 () Bool)

(assert (=> b!346124 m!347329))

(assert (=> b!346081 d!71203))

(declare-fun d!71205 () Bool)

(declare-fun res!191473 () Bool)

(declare-fun e!212141 () Bool)

(assert (=> d!71205 (=> res!191473 e!212141)))

(assert (=> d!71205 (= res!191473 (= (select (arr!8739 _keys!1895) (index!15652 lt!163177)) k0!1348))))

(assert (=> d!71205 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15652 lt!163177)) e!212141)))

(declare-fun b!346131 () Bool)

(declare-fun e!212142 () Bool)

(assert (=> b!346131 (= e!212141 e!212142)))

(declare-fun res!191474 () Bool)

(assert (=> b!346131 (=> (not res!191474) (not e!212142))))

(assert (=> b!346131 (= res!191474 (bvslt (bvadd (index!15652 lt!163177) #b00000000000000000000000000000001) (size!9091 _keys!1895)))))

(declare-fun b!346132 () Bool)

(assert (=> b!346132 (= e!212142 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15652 lt!163177) #b00000000000000000000000000000001)))))

(assert (= (and d!71205 (not res!191473)) b!346131))

(assert (= (and b!346131 res!191474) b!346132))

(assert (=> d!71205 m!347289))

(declare-fun m!347331 () Bool)

(assert (=> b!346132 m!347331))

(assert (=> b!346072 d!71205))

(declare-fun d!71207 () Bool)

(declare-fun e!212148 () Bool)

(assert (=> d!71207 e!212148))

(declare-fun res!191477 () Bool)

(assert (=> d!71207 (=> res!191477 e!212148)))

(declare-fun lt!163199 () Bool)

(assert (=> d!71207 (= res!191477 (not lt!163199))))

(declare-fun lt!163200 () Bool)

(assert (=> d!71207 (= lt!163199 lt!163200)))

(declare-fun lt!163201 () Unit!10745)

(declare-fun e!212147 () Unit!10745)

(assert (=> d!71207 (= lt!163201 e!212147)))

(declare-fun c!53106 () Bool)

(assert (=> d!71207 (= c!53106 lt!163200)))

(declare-fun containsKey!334 (List!5060 (_ BitVec 64)) Bool)

(assert (=> d!71207 (= lt!163200 (containsKey!334 (toList!2190 (getCurrentListMap!1711 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71207 (= (contains!2252 (getCurrentListMap!1711 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163199)))

(declare-fun b!346139 () Bool)

(declare-fun lt!163198 () Unit!10745)

(assert (=> b!346139 (= e!212147 lt!163198)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!282 (List!5060 (_ BitVec 64)) Unit!10745)

(assert (=> b!346139 (= lt!163198 (lemmaContainsKeyImpliesGetValueByKeyDefined!282 (toList!2190 (getCurrentListMap!1711 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!348 0))(
  ( (Some!347 (v!5942 V!10885)) (None!346) )
))
(declare-fun isDefined!283 (Option!348) Bool)

(declare-fun getValueByKey!342 (List!5060 (_ BitVec 64)) Option!348)

(assert (=> b!346139 (isDefined!283 (getValueByKey!342 (toList!2190 (getCurrentListMap!1711 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!346140 () Bool)

(declare-fun Unit!10747 () Unit!10745)

(assert (=> b!346140 (= e!212147 Unit!10747)))

(declare-fun b!346141 () Bool)

(assert (=> b!346141 (= e!212148 (isDefined!283 (getValueByKey!342 (toList!2190 (getCurrentListMap!1711 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71207 c!53106) b!346139))

(assert (= (and d!71207 (not c!53106)) b!346140))

(assert (= (and d!71207 (not res!191477)) b!346141))

(declare-fun m!347333 () Bool)

(assert (=> d!71207 m!347333))

(declare-fun m!347335 () Bool)

(assert (=> b!346139 m!347335))

(declare-fun m!347337 () Bool)

(assert (=> b!346139 m!347337))

(assert (=> b!346139 m!347337))

(declare-fun m!347339 () Bool)

(assert (=> b!346139 m!347339))

(assert (=> b!346141 m!347337))

(assert (=> b!346141 m!347337))

(assert (=> b!346141 m!347339))

(assert (=> b!346080 d!71207))

(declare-fun bm!26797 () Bool)

(declare-fun call!26806 () ListLongMap!4349)

(declare-fun call!26804 () ListLongMap!4349)

(assert (=> bm!26797 (= call!26806 call!26804)))

(declare-fun b!346184 () Bool)

(declare-fun res!191496 () Bool)

(declare-fun e!212186 () Bool)

(assert (=> b!346184 (=> (not res!191496) (not e!212186))))

(declare-fun e!212175 () Bool)

(assert (=> b!346184 (= res!191496 e!212175)))

(declare-fun c!53124 () Bool)

(assert (=> b!346184 (= c!53124 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26798 () Bool)

(declare-fun call!26801 () Bool)

(declare-fun lt!163251 () ListLongMap!4349)

(assert (=> bm!26798 (= call!26801 (contains!2252 lt!163251 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!346185 () Bool)

(declare-fun e!212187 () Bool)

(declare-fun apply!284 (ListLongMap!4349 (_ BitVec 64)) V!10885)

(assert (=> b!346185 (= e!212187 (= (apply!284 lt!163251 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!346186 () Bool)

(declare-fun call!26803 () Bool)

(assert (=> b!346186 (= e!212175 (not call!26803))))

(declare-fun bm!26799 () Bool)

(declare-fun call!26802 () ListLongMap!4349)

(declare-fun call!26805 () ListLongMap!4349)

(assert (=> bm!26799 (= call!26802 call!26805)))

(declare-fun b!346187 () Bool)

(declare-fun e!212183 () Bool)

(declare-fun get!4706 (ValueCell!3372 V!10885) V!10885)

(declare-fun dynLambda!627 (Int (_ BitVec 64)) V!10885)

(assert (=> b!346187 (= e!212183 (= (apply!284 lt!163251 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)) (get!4706 (select (arr!8738 _values!1525) #b00000000000000000000000000000000) (dynLambda!627 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!346187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9090 _values!1525)))))

(assert (=> b!346187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(declare-fun b!346188 () Bool)

(declare-fun e!212178 () Unit!10745)

(declare-fun Unit!10748 () Unit!10745)

(assert (=> b!346188 (= e!212178 Unit!10748)))

(declare-fun b!346189 () Bool)

(declare-fun e!212184 () Bool)

(assert (=> b!346189 (= e!212175 e!212184)))

(declare-fun res!191501 () Bool)

(assert (=> b!346189 (= res!191501 call!26803)))

(assert (=> b!346189 (=> (not res!191501) (not e!212184))))

(declare-fun bm!26800 () Bool)

(declare-fun call!26800 () ListLongMap!4349)

(assert (=> bm!26800 (= call!26800 call!26802)))

(declare-fun b!346190 () Bool)

(declare-fun e!212177 () ListLongMap!4349)

(assert (=> b!346190 (= e!212177 call!26800)))

(declare-fun b!346191 () Bool)

(assert (=> b!346191 (= e!212184 (= (apply!284 lt!163251 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!346192 () Bool)

(declare-fun e!212181 () Bool)

(assert (=> b!346192 (= e!212181 (not call!26801))))

(declare-fun b!346193 () Bool)

(declare-fun e!212185 () Bool)

(assert (=> b!346193 (= e!212185 (validKeyInArray!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346194 () Bool)

(assert (=> b!346194 (= e!212186 e!212181)))

(declare-fun c!53119 () Bool)

(assert (=> b!346194 (= c!53119 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!346195 () Bool)

(declare-fun e!212176 () Bool)

(assert (=> b!346195 (= e!212176 (validKeyInArray!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346196 () Bool)

(declare-fun lt!163249 () Unit!10745)

(assert (=> b!346196 (= e!212178 lt!163249)))

(declare-fun lt!163262 () ListLongMap!4349)

(declare-fun getCurrentListMapNoExtraKeys!606 (array!18453 array!18451 (_ BitVec 32) (_ BitVec 32) V!10885 V!10885 (_ BitVec 32) Int) ListLongMap!4349)

(assert (=> b!346196 (= lt!163262 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163263 () (_ BitVec 64))

(assert (=> b!346196 (= lt!163263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163247 () (_ BitVec 64))

(assert (=> b!346196 (= lt!163247 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163250 () Unit!10745)

(declare-fun addStillContains!260 (ListLongMap!4349 (_ BitVec 64) V!10885 (_ BitVec 64)) Unit!10745)

(assert (=> b!346196 (= lt!163250 (addStillContains!260 lt!163262 lt!163263 zeroValue!1467 lt!163247))))

(declare-fun +!733 (ListLongMap!4349 tuple2!5436) ListLongMap!4349)

(assert (=> b!346196 (contains!2252 (+!733 lt!163262 (tuple2!5437 lt!163263 zeroValue!1467)) lt!163247)))

(declare-fun lt!163253 () Unit!10745)

(assert (=> b!346196 (= lt!163253 lt!163250)))

(declare-fun lt!163256 () ListLongMap!4349)

(assert (=> b!346196 (= lt!163256 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163254 () (_ BitVec 64))

(assert (=> b!346196 (= lt!163254 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163261 () (_ BitVec 64))

(assert (=> b!346196 (= lt!163261 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163258 () Unit!10745)

(declare-fun addApplyDifferent!260 (ListLongMap!4349 (_ BitVec 64) V!10885 (_ BitVec 64)) Unit!10745)

(assert (=> b!346196 (= lt!163258 (addApplyDifferent!260 lt!163256 lt!163254 minValue!1467 lt!163261))))

(assert (=> b!346196 (= (apply!284 (+!733 lt!163256 (tuple2!5437 lt!163254 minValue!1467)) lt!163261) (apply!284 lt!163256 lt!163261))))

(declare-fun lt!163255 () Unit!10745)

(assert (=> b!346196 (= lt!163255 lt!163258)))

(declare-fun lt!163248 () ListLongMap!4349)

(assert (=> b!346196 (= lt!163248 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163264 () (_ BitVec 64))

(assert (=> b!346196 (= lt!163264 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163257 () (_ BitVec 64))

(assert (=> b!346196 (= lt!163257 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163252 () Unit!10745)

(assert (=> b!346196 (= lt!163252 (addApplyDifferent!260 lt!163248 lt!163264 zeroValue!1467 lt!163257))))

(assert (=> b!346196 (= (apply!284 (+!733 lt!163248 (tuple2!5437 lt!163264 zeroValue!1467)) lt!163257) (apply!284 lt!163248 lt!163257))))

(declare-fun lt!163266 () Unit!10745)

(assert (=> b!346196 (= lt!163266 lt!163252)))

(declare-fun lt!163267 () ListLongMap!4349)

(assert (=> b!346196 (= lt!163267 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163246 () (_ BitVec 64))

(assert (=> b!346196 (= lt!163246 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163259 () (_ BitVec 64))

(assert (=> b!346196 (= lt!163259 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!346196 (= lt!163249 (addApplyDifferent!260 lt!163267 lt!163246 minValue!1467 lt!163259))))

(assert (=> b!346196 (= (apply!284 (+!733 lt!163267 (tuple2!5437 lt!163246 minValue!1467)) lt!163259) (apply!284 lt!163267 lt!163259))))

(declare-fun b!346197 () Bool)

(declare-fun e!212179 () ListLongMap!4349)

(assert (=> b!346197 (= e!212179 call!26806)))

(declare-fun c!53120 () Bool)

(declare-fun c!53121 () Bool)

(declare-fun bm!26801 () Bool)

(assert (=> bm!26801 (= call!26804 (+!733 (ite c!53120 call!26805 (ite c!53121 call!26802 call!26800)) (ite (or c!53120 c!53121) (tuple2!5437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26802 () Bool)

(assert (=> bm!26802 (= call!26803 (contains!2252 lt!163251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!346198 () Bool)

(declare-fun c!53122 () Bool)

(assert (=> b!346198 (= c!53122 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!346198 (= e!212179 e!212177)))

(declare-fun bm!26803 () Bool)

(assert (=> bm!26803 (= call!26805 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!346199 () Bool)

(assert (=> b!346199 (= e!212181 e!212187)))

(declare-fun res!191503 () Bool)

(assert (=> b!346199 (= res!191503 call!26801)))

(assert (=> b!346199 (=> (not res!191503) (not e!212187))))

(declare-fun b!346200 () Bool)

(assert (=> b!346200 (= e!212177 call!26806)))

(declare-fun d!71209 () Bool)

(assert (=> d!71209 e!212186))

(declare-fun res!191498 () Bool)

(assert (=> d!71209 (=> (not res!191498) (not e!212186))))

(assert (=> d!71209 (= res!191498 (or (bvsge #b00000000000000000000000000000000 (size!9091 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9091 _keys!1895)))))))

(declare-fun lt!163260 () ListLongMap!4349)

(assert (=> d!71209 (= lt!163251 lt!163260)))

(declare-fun lt!163265 () Unit!10745)

(assert (=> d!71209 (= lt!163265 e!212178)))

(declare-fun c!53123 () Bool)

(assert (=> d!71209 (= c!53123 e!212185)))

(declare-fun res!191499 () Bool)

(assert (=> d!71209 (=> (not res!191499) (not e!212185))))

(assert (=> d!71209 (= res!191499 (bvslt #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(declare-fun e!212180 () ListLongMap!4349)

(assert (=> d!71209 (= lt!163260 e!212180)))

(assert (=> d!71209 (= c!53120 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71209 (validMask!0 mask!2385)))

(assert (=> d!71209 (= (getCurrentListMap!1711 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163251)))

(declare-fun b!346201 () Bool)

(declare-fun e!212182 () Bool)

(assert (=> b!346201 (= e!212182 e!212183)))

(declare-fun res!191504 () Bool)

(assert (=> b!346201 (=> (not res!191504) (not e!212183))))

(assert (=> b!346201 (= res!191504 (contains!2252 lt!163251 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!346201 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(declare-fun b!346202 () Bool)

(assert (=> b!346202 (= e!212180 (+!733 call!26804 (tuple2!5437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!346203 () Bool)

(assert (=> b!346203 (= e!212180 e!212179)))

(assert (=> b!346203 (= c!53121 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!346204 () Bool)

(declare-fun res!191500 () Bool)

(assert (=> b!346204 (=> (not res!191500) (not e!212186))))

(assert (=> b!346204 (= res!191500 e!212182)))

(declare-fun res!191497 () Bool)

(assert (=> b!346204 (=> res!191497 e!212182)))

(assert (=> b!346204 (= res!191497 (not e!212176))))

(declare-fun res!191502 () Bool)

(assert (=> b!346204 (=> (not res!191502) (not e!212176))))

(assert (=> b!346204 (= res!191502 (bvslt #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(assert (= (and d!71209 c!53120) b!346202))

(assert (= (and d!71209 (not c!53120)) b!346203))

(assert (= (and b!346203 c!53121) b!346197))

(assert (= (and b!346203 (not c!53121)) b!346198))

(assert (= (and b!346198 c!53122) b!346200))

(assert (= (and b!346198 (not c!53122)) b!346190))

(assert (= (or b!346200 b!346190) bm!26800))

(assert (= (or b!346197 bm!26800) bm!26799))

(assert (= (or b!346197 b!346200) bm!26797))

(assert (= (or b!346202 bm!26799) bm!26803))

(assert (= (or b!346202 bm!26797) bm!26801))

(assert (= (and d!71209 res!191499) b!346193))

(assert (= (and d!71209 c!53123) b!346196))

(assert (= (and d!71209 (not c!53123)) b!346188))

(assert (= (and d!71209 res!191498) b!346204))

(assert (= (and b!346204 res!191502) b!346195))

(assert (= (and b!346204 (not res!191497)) b!346201))

(assert (= (and b!346201 res!191504) b!346187))

(assert (= (and b!346204 res!191500) b!346184))

(assert (= (and b!346184 c!53124) b!346189))

(assert (= (and b!346184 (not c!53124)) b!346186))

(assert (= (and b!346189 res!191501) b!346191))

(assert (= (or b!346189 b!346186) bm!26802))

(assert (= (and b!346184 res!191496) b!346194))

(assert (= (and b!346194 c!53119) b!346199))

(assert (= (and b!346194 (not c!53119)) b!346192))

(assert (= (and b!346199 res!191503) b!346185))

(assert (= (or b!346199 b!346192) bm!26798))

(declare-fun b_lambda!8475 () Bool)

(assert (=> (not b_lambda!8475) (not b!346187)))

(declare-fun t!10188 () Bool)

(declare-fun tb!3083 () Bool)

(assert (=> (and start!34632 (= defaultEntry!1528 defaultEntry!1528) t!10188) tb!3083))

(declare-fun result!5579 () Bool)

(assert (=> tb!3083 (= result!5579 tp_is_empty!7431)))

(assert (=> b!346187 t!10188))

(declare-fun b_and!14699 () Bool)

(assert (= b_and!14695 (and (=> t!10188 result!5579) b_and!14699)))

(declare-fun m!347341 () Bool)

(assert (=> b!346187 m!347341))

(assert (=> b!346187 m!347321))

(assert (=> b!346187 m!347341))

(declare-fun m!347343 () Bool)

(assert (=> b!346187 m!347343))

(declare-fun m!347345 () Bool)

(assert (=> b!346187 m!347345))

(assert (=> b!346187 m!347343))

(assert (=> b!346187 m!347321))

(declare-fun m!347347 () Bool)

(assert (=> b!346187 m!347347))

(declare-fun m!347349 () Bool)

(assert (=> b!346191 m!347349))

(assert (=> d!71209 m!347279))

(declare-fun m!347351 () Bool)

(assert (=> bm!26798 m!347351))

(assert (=> b!346201 m!347321))

(assert (=> b!346201 m!347321))

(declare-fun m!347353 () Bool)

(assert (=> b!346201 m!347353))

(declare-fun m!347355 () Bool)

(assert (=> b!346196 m!347355))

(declare-fun m!347357 () Bool)

(assert (=> b!346196 m!347357))

(declare-fun m!347359 () Bool)

(assert (=> b!346196 m!347359))

(declare-fun m!347361 () Bool)

(assert (=> b!346196 m!347361))

(declare-fun m!347363 () Bool)

(assert (=> b!346196 m!347363))

(declare-fun m!347365 () Bool)

(assert (=> b!346196 m!347365))

(declare-fun m!347367 () Bool)

(assert (=> b!346196 m!347367))

(assert (=> b!346196 m!347363))

(declare-fun m!347369 () Bool)

(assert (=> b!346196 m!347369))

(declare-fun m!347371 () Bool)

(assert (=> b!346196 m!347371))

(declare-fun m!347373 () Bool)

(assert (=> b!346196 m!347373))

(assert (=> b!346196 m!347321))

(declare-fun m!347375 () Bool)

(assert (=> b!346196 m!347375))

(declare-fun m!347377 () Bool)

(assert (=> b!346196 m!347377))

(assert (=> b!346196 m!347373))

(declare-fun m!347379 () Bool)

(assert (=> b!346196 m!347379))

(assert (=> b!346196 m!347355))

(assert (=> b!346196 m!347367))

(declare-fun m!347381 () Bool)

(assert (=> b!346196 m!347381))

(declare-fun m!347383 () Bool)

(assert (=> b!346196 m!347383))

(declare-fun m!347385 () Bool)

(assert (=> b!346196 m!347385))

(declare-fun m!347387 () Bool)

(assert (=> bm!26801 m!347387))

(declare-fun m!347389 () Bool)

(assert (=> b!346185 m!347389))

(assert (=> bm!26803 m!347361))

(assert (=> b!346193 m!347321))

(assert (=> b!346193 m!347321))

(assert (=> b!346193 m!347329))

(declare-fun m!347391 () Bool)

(assert (=> b!346202 m!347391))

(declare-fun m!347393 () Bool)

(assert (=> bm!26802 m!347393))

(assert (=> b!346195 m!347321))

(assert (=> b!346195 m!347321))

(assert (=> b!346195 m!347329))

(assert (=> b!346080 d!71209))

(declare-fun b!346219 () Bool)

(declare-fun e!212195 () SeekEntryResult!3368)

(declare-fun e!212196 () SeekEntryResult!3368)

(assert (=> b!346219 (= e!212195 e!212196)))

(declare-fun lt!163275 () (_ BitVec 64))

(declare-fun lt!163276 () SeekEntryResult!3368)

(assert (=> b!346219 (= lt!163275 (select (arr!8739 _keys!1895) (index!15653 lt!163276)))))

(declare-fun c!53132 () Bool)

(assert (=> b!346219 (= c!53132 (= lt!163275 k0!1348))))

(declare-fun b!346220 () Bool)

(declare-fun e!212194 () SeekEntryResult!3368)

(assert (=> b!346220 (= e!212194 (MissingZero!3368 (index!15653 lt!163276)))))

(declare-fun d!71211 () Bool)

(declare-fun lt!163274 () SeekEntryResult!3368)

(assert (=> d!71211 (and (or ((_ is Undefined!3368) lt!163274) (not ((_ is Found!3368) lt!163274)) (and (bvsge (index!15652 lt!163274) #b00000000000000000000000000000000) (bvslt (index!15652 lt!163274) (size!9091 _keys!1895)))) (or ((_ is Undefined!3368) lt!163274) ((_ is Found!3368) lt!163274) (not ((_ is MissingZero!3368) lt!163274)) (and (bvsge (index!15651 lt!163274) #b00000000000000000000000000000000) (bvslt (index!15651 lt!163274) (size!9091 _keys!1895)))) (or ((_ is Undefined!3368) lt!163274) ((_ is Found!3368) lt!163274) ((_ is MissingZero!3368) lt!163274) (not ((_ is MissingVacant!3368) lt!163274)) (and (bvsge (index!15654 lt!163274) #b00000000000000000000000000000000) (bvslt (index!15654 lt!163274) (size!9091 _keys!1895)))) (or ((_ is Undefined!3368) lt!163274) (ite ((_ is Found!3368) lt!163274) (= (select (arr!8739 _keys!1895) (index!15652 lt!163274)) k0!1348) (ite ((_ is MissingZero!3368) lt!163274) (= (select (arr!8739 _keys!1895) (index!15651 lt!163274)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3368) lt!163274) (= (select (arr!8739 _keys!1895) (index!15654 lt!163274)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71211 (= lt!163274 e!212195)))

(declare-fun c!53133 () Bool)

(assert (=> d!71211 (= c!53133 (and ((_ is Intermediate!3368) lt!163276) (undefined!4180 lt!163276)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18453 (_ BitVec 32)) SeekEntryResult!3368)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71211 (= lt!163276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71211 (validMask!0 mask!2385)))

(assert (=> d!71211 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163274)))

(declare-fun b!346221 () Bool)

(declare-fun c!53131 () Bool)

(assert (=> b!346221 (= c!53131 (= lt!163275 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!346221 (= e!212196 e!212194)))

(declare-fun b!346222 () Bool)

(assert (=> b!346222 (= e!212196 (Found!3368 (index!15653 lt!163276)))))

(declare-fun b!346223 () Bool)

(assert (=> b!346223 (= e!212195 Undefined!3368)))

(declare-fun b!346224 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18453 (_ BitVec 32)) SeekEntryResult!3368)

(assert (=> b!346224 (= e!212194 (seekKeyOrZeroReturnVacant!0 (x!34474 lt!163276) (index!15653 lt!163276) (index!15653 lt!163276) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!71211 c!53133) b!346223))

(assert (= (and d!71211 (not c!53133)) b!346219))

(assert (= (and b!346219 c!53132) b!346222))

(assert (= (and b!346219 (not c!53132)) b!346221))

(assert (= (and b!346221 c!53131) b!346220))

(assert (= (and b!346221 (not c!53131)) b!346224))

(declare-fun m!347395 () Bool)

(assert (=> b!346219 m!347395))

(declare-fun m!347397 () Bool)

(assert (=> d!71211 m!347397))

(assert (=> d!71211 m!347279))

(declare-fun m!347399 () Bool)

(assert (=> d!71211 m!347399))

(assert (=> d!71211 m!347399))

(declare-fun m!347401 () Bool)

(assert (=> d!71211 m!347401))

(declare-fun m!347403 () Bool)

(assert (=> d!71211 m!347403))

(declare-fun m!347405 () Bool)

(assert (=> d!71211 m!347405))

(declare-fun m!347407 () Bool)

(assert (=> b!346224 m!347407))

(assert (=> b!346075 d!71211))

(declare-fun d!71213 () Bool)

(assert (=> d!71213 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34632 d!71213))

(declare-fun d!71215 () Bool)

(assert (=> d!71215 (= (array_inv!6466 _values!1525) (bvsge (size!9090 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34632 d!71215))

(declare-fun d!71217 () Bool)

(assert (=> d!71217 (= (array_inv!6467 _keys!1895) (bvsge (size!9091 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34632 d!71217))

(declare-fun b!346235 () Bool)

(declare-fun e!212205 () Bool)

(declare-fun e!212208 () Bool)

(assert (=> b!346235 (= e!212205 e!212208)))

(declare-fun c!53136 () Bool)

(assert (=> b!346235 (= c!53136 (validKeyInArray!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71219 () Bool)

(declare-fun res!191511 () Bool)

(declare-fun e!212207 () Bool)

(assert (=> d!71219 (=> res!191511 e!212207)))

(assert (=> d!71219 (= res!191511 (bvsge #b00000000000000000000000000000000 (size!9091 _keys!1895)))))

(assert (=> d!71219 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5056) e!212207)))

(declare-fun b!346236 () Bool)

(declare-fun call!26809 () Bool)

(assert (=> b!346236 (= e!212208 call!26809)))

(declare-fun b!346237 () Bool)

(declare-fun e!212206 () Bool)

(declare-fun contains!2254 (List!5059 (_ BitVec 64)) Bool)

(assert (=> b!346237 (= e!212206 (contains!2254 Nil!5056 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346238 () Bool)

(assert (=> b!346238 (= e!212207 e!212205)))

(declare-fun res!191512 () Bool)

(assert (=> b!346238 (=> (not res!191512) (not e!212205))))

(assert (=> b!346238 (= res!191512 (not e!212206))))

(declare-fun res!191513 () Bool)

(assert (=> b!346238 (=> (not res!191513) (not e!212206))))

(assert (=> b!346238 (= res!191513 (validKeyInArray!0 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26806 () Bool)

(assert (=> bm!26806 (= call!26809 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53136 (Cons!5055 (select (arr!8739 _keys!1895) #b00000000000000000000000000000000) Nil!5056) Nil!5056)))))

(declare-fun b!346239 () Bool)

(assert (=> b!346239 (= e!212208 call!26809)))

(assert (= (and d!71219 (not res!191511)) b!346238))

(assert (= (and b!346238 res!191513) b!346237))

(assert (= (and b!346238 res!191512) b!346235))

(assert (= (and b!346235 c!53136) b!346239))

(assert (= (and b!346235 (not c!53136)) b!346236))

(assert (= (or b!346239 b!346236) bm!26806))

(assert (=> b!346235 m!347321))

(assert (=> b!346235 m!347321))

(assert (=> b!346235 m!347329))

(assert (=> b!346237 m!347321))

(assert (=> b!346237 m!347321))

(declare-fun m!347409 () Bool)

(assert (=> b!346237 m!347409))

(assert (=> b!346238 m!347321))

(assert (=> b!346238 m!347321))

(assert (=> b!346238 m!347329))

(assert (=> bm!26806 m!347321))

(declare-fun m!347411 () Bool)

(assert (=> bm!26806 m!347411))

(assert (=> b!346079 d!71219))

(declare-fun d!71221 () Bool)

(assert (=> d!71221 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!346078 d!71221))

(declare-fun b!346246 () Bool)

(declare-fun e!212214 () Bool)

(assert (=> b!346246 (= e!212214 tp_is_empty!7431)))

(declare-fun mapNonEmpty!12603 () Bool)

(declare-fun mapRes!12603 () Bool)

(declare-fun tp!26004 () Bool)

(assert (=> mapNonEmpty!12603 (= mapRes!12603 (and tp!26004 e!212214))))

(declare-fun mapRest!12603 () (Array (_ BitVec 32) ValueCell!3372))

(declare-fun mapKey!12603 () (_ BitVec 32))

(declare-fun mapValue!12603 () ValueCell!3372)

(assert (=> mapNonEmpty!12603 (= mapRest!12597 (store mapRest!12603 mapKey!12603 mapValue!12603))))

(declare-fun b!346247 () Bool)

(declare-fun e!212213 () Bool)

(assert (=> b!346247 (= e!212213 tp_is_empty!7431)))

(declare-fun condMapEmpty!12603 () Bool)

(declare-fun mapDefault!12603 () ValueCell!3372)

(assert (=> mapNonEmpty!12597 (= condMapEmpty!12603 (= mapRest!12597 ((as const (Array (_ BitVec 32) ValueCell!3372)) mapDefault!12603)))))

(assert (=> mapNonEmpty!12597 (= tp!25995 (and e!212213 mapRes!12603))))

(declare-fun mapIsEmpty!12603 () Bool)

(assert (=> mapIsEmpty!12603 mapRes!12603))

(assert (= (and mapNonEmpty!12597 condMapEmpty!12603) mapIsEmpty!12603))

(assert (= (and mapNonEmpty!12597 (not condMapEmpty!12603)) mapNonEmpty!12603))

(assert (= (and mapNonEmpty!12603 ((_ is ValueCellFull!3372) mapValue!12603)) b!346246))

(assert (= (and mapNonEmpty!12597 ((_ is ValueCellFull!3372) mapDefault!12603)) b!346247))

(declare-fun m!347413 () Bool)

(assert (=> mapNonEmpty!12603 m!347413))

(declare-fun b_lambda!8477 () Bool)

(assert (= b_lambda!8475 (or (and start!34632 b_free!7479) b_lambda!8477)))

(check-sat (not b!346141) (not b!346139) (not b!346237) (not b!346124) (not bm!26803) (not d!71211) (not d!71207) (not b!346191) (not b!346224) (not b_next!7479) (not bm!26801) (not b!346202) (not b!346132) (not bm!26806) (not b!346185) (not bm!26802) (not b!346123) (not b!346187) (not b!346193) b_and!14699 (not bm!26798) (not b!346201) (not b!346196) (not b!346235) (not b!346238) (not d!71209) (not bm!26782) (not b!346195) (not b_lambda!8477) tp_is_empty!7431 (not mapNonEmpty!12603))
(check-sat b_and!14699 (not b_next!7479))
