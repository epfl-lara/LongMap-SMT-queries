; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21020 () Bool)

(assert start!21020)

(declare-fun b_free!5571 () Bool)

(declare-fun b_next!5571 () Bool)

(assert (=> start!21020 (= b_free!5571 (not b_next!5571))))

(declare-fun tp!19768 () Bool)

(declare-fun b_and!12377 () Bool)

(assert (=> start!21020 (= tp!19768 b_and!12377)))

(declare-fun b!211312 () Bool)

(declare-fun res!103196 () Bool)

(declare-fun e!137557 () Bool)

(assert (=> b!211312 (=> (not res!103196) (not e!137557))))

(declare-datatypes ((array!10067 0))(
  ( (array!10068 (arr!4779 (Array (_ BitVec 32) (_ BitVec 64))) (size!5104 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10067)

(declare-datatypes ((V!6891 0))(
  ( (V!6892 (val!2761 Int)) )
))
(declare-datatypes ((ValueCell!2373 0))(
  ( (ValueCellFull!2373 (v!4751 V!6891)) (EmptyCell!2373) )
))
(declare-datatypes ((array!10069 0))(
  ( (array!10070 (arr!4780 (Array (_ BitVec 32) ValueCell!2373)) (size!5105 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10069)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211312 (= res!103196 (and (= (size!5105 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5104 _keys!825) (size!5105 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211313 () Bool)

(declare-fun e!137558 () Bool)

(declare-fun tp_is_empty!5433 () Bool)

(assert (=> b!211313 (= e!137558 tp_is_empty!5433)))

(declare-fun b!211314 () Bool)

(declare-fun e!137556 () Bool)

(declare-fun e!137553 () Bool)

(declare-fun mapRes!9233 () Bool)

(assert (=> b!211314 (= e!137556 (and e!137553 mapRes!9233))))

(declare-fun condMapEmpty!9233 () Bool)

(declare-fun mapDefault!9233 () ValueCell!2373)

(assert (=> b!211314 (= condMapEmpty!9233 (= (arr!4780 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2373)) mapDefault!9233)))))

(declare-fun res!103191 () Bool)

(assert (=> start!21020 (=> (not res!103191) (not e!137557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21020 (= res!103191 (validMask!0 mask!1149))))

(assert (=> start!21020 e!137557))

(declare-fun array_inv!3163 (array!10069) Bool)

(assert (=> start!21020 (and (array_inv!3163 _values!649) e!137556)))

(assert (=> start!21020 true))

(assert (=> start!21020 tp_is_empty!5433))

(declare-fun array_inv!3164 (array!10067) Bool)

(assert (=> start!21020 (array_inv!3164 _keys!825)))

(assert (=> start!21020 tp!19768))

(declare-datatypes ((tuple2!4174 0))(
  ( (tuple2!4175 (_1!2098 (_ BitVec 64)) (_2!2098 V!6891)) )
))
(declare-datatypes ((List!3066 0))(
  ( (Nil!3063) (Cons!3062 (h!3704 tuple2!4174) (t!8007 List!3066)) )
))
(declare-datatypes ((ListLongMap!3087 0))(
  ( (ListLongMap!3088 (toList!1559 List!3066)) )
))
(declare-fun lt!108628 () ListLongMap!3087)

(declare-fun lt!108625 () tuple2!4174)

(declare-fun lt!108626 () ListLongMap!3087)

(declare-fun b!211315 () Bool)

(declare-fun e!137554 () Bool)

(declare-fun +!562 (ListLongMap!3087 tuple2!4174) ListLongMap!3087)

(assert (=> b!211315 (= e!137554 (= lt!108628 (+!562 lt!108626 lt!108625)))))

(declare-fun lt!108623 () ListLongMap!3087)

(declare-fun lt!108630 () ListLongMap!3087)

(assert (=> b!211315 (= lt!108623 (+!562 lt!108630 lt!108625))))

(declare-fun zeroValue!615 () V!6891)

(assert (=> b!211315 (= lt!108625 (tuple2!4175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!211316 () Bool)

(declare-fun res!103197 () Bool)

(assert (=> b!211316 (=> (not res!103197) (not e!137557))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211316 (= res!103197 (validKeyInArray!0 k0!843))))

(declare-fun b!211317 () Bool)

(declare-fun res!103193 () Bool)

(assert (=> b!211317 (=> (not res!103193) (not e!137557))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!211317 (= res!103193 (= (select (arr!4779 _keys!825) i!601) k0!843))))

(declare-fun b!211318 () Bool)

(declare-fun res!103192 () Bool)

(assert (=> b!211318 (=> (not res!103192) (not e!137557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10067 (_ BitVec 32)) Bool)

(assert (=> b!211318 (= res!103192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211319 () Bool)

(declare-fun res!103194 () Bool)

(assert (=> b!211319 (=> (not res!103194) (not e!137557))))

(declare-datatypes ((List!3067 0))(
  ( (Nil!3064) (Cons!3063 (h!3705 (_ BitVec 64)) (t!8008 List!3067)) )
))
(declare-fun arrayNoDuplicates!0 (array!10067 (_ BitVec 32) List!3067) Bool)

(assert (=> b!211319 (= res!103194 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3064))))

(declare-fun b!211320 () Bool)

(assert (=> b!211320 (= e!137553 tp_is_empty!5433)))

(declare-fun b!211321 () Bool)

(declare-fun res!103198 () Bool)

(assert (=> b!211321 (=> (not res!103198) (not e!137557))))

(assert (=> b!211321 (= res!103198 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5104 _keys!825))))))

(declare-fun b!211322 () Bool)

(assert (=> b!211322 (= e!137557 (not e!137554))))

(declare-fun res!103195 () Bool)

(assert (=> b!211322 (=> res!103195 e!137554)))

(assert (=> b!211322 (= res!103195 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6891)

(declare-fun getCurrentListMap!1093 (array!10067 array!10069 (_ BitVec 32) (_ BitVec 32) V!6891 V!6891 (_ BitVec 32) Int) ListLongMap!3087)

(assert (=> b!211322 (= lt!108628 (getCurrentListMap!1093 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108629 () array!10069)

(assert (=> b!211322 (= lt!108623 (getCurrentListMap!1093 _keys!825 lt!108629 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108624 () ListLongMap!3087)

(assert (=> b!211322 (and (= lt!108630 lt!108624) (= lt!108624 lt!108630))))

(declare-fun v!520 () V!6891)

(assert (=> b!211322 (= lt!108624 (+!562 lt!108626 (tuple2!4175 k0!843 v!520)))))

(declare-datatypes ((Unit!6416 0))(
  ( (Unit!6417) )
))
(declare-fun lt!108627 () Unit!6416)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!210 (array!10067 array!10069 (_ BitVec 32) (_ BitVec 32) V!6891 V!6891 (_ BitVec 32) (_ BitVec 64) V!6891 (_ BitVec 32) Int) Unit!6416)

(assert (=> b!211322 (= lt!108627 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!210 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!495 (array!10067 array!10069 (_ BitVec 32) (_ BitVec 32) V!6891 V!6891 (_ BitVec 32) Int) ListLongMap!3087)

(assert (=> b!211322 (= lt!108630 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108629 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211322 (= lt!108629 (array!10070 (store (arr!4780 _values!649) i!601 (ValueCellFull!2373 v!520)) (size!5105 _values!649)))))

(assert (=> b!211322 (= lt!108626 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!9233 () Bool)

(assert (=> mapIsEmpty!9233 mapRes!9233))

(declare-fun mapNonEmpty!9233 () Bool)

(declare-fun tp!19769 () Bool)

(assert (=> mapNonEmpty!9233 (= mapRes!9233 (and tp!19769 e!137558))))

(declare-fun mapValue!9233 () ValueCell!2373)

(declare-fun mapRest!9233 () (Array (_ BitVec 32) ValueCell!2373))

(declare-fun mapKey!9233 () (_ BitVec 32))

(assert (=> mapNonEmpty!9233 (= (arr!4780 _values!649) (store mapRest!9233 mapKey!9233 mapValue!9233))))

(assert (= (and start!21020 res!103191) b!211312))

(assert (= (and b!211312 res!103196) b!211318))

(assert (= (and b!211318 res!103192) b!211319))

(assert (= (and b!211319 res!103194) b!211321))

(assert (= (and b!211321 res!103198) b!211316))

(assert (= (and b!211316 res!103197) b!211317))

(assert (= (and b!211317 res!103193) b!211322))

(assert (= (and b!211322 (not res!103195)) b!211315))

(assert (= (and b!211314 condMapEmpty!9233) mapIsEmpty!9233))

(assert (= (and b!211314 (not condMapEmpty!9233)) mapNonEmpty!9233))

(get-info :version)

(assert (= (and mapNonEmpty!9233 ((_ is ValueCellFull!2373) mapValue!9233)) b!211313))

(assert (= (and b!211314 ((_ is ValueCellFull!2373) mapDefault!9233)) b!211320))

(assert (= start!21020 b!211314))

(declare-fun m!239051 () Bool)

(assert (=> b!211319 m!239051))

(declare-fun m!239053 () Bool)

(assert (=> start!21020 m!239053))

(declare-fun m!239055 () Bool)

(assert (=> start!21020 m!239055))

(declare-fun m!239057 () Bool)

(assert (=> start!21020 m!239057))

(declare-fun m!239059 () Bool)

(assert (=> b!211317 m!239059))

(declare-fun m!239061 () Bool)

(assert (=> b!211315 m!239061))

(declare-fun m!239063 () Bool)

(assert (=> b!211315 m!239063))

(declare-fun m!239065 () Bool)

(assert (=> b!211318 m!239065))

(declare-fun m!239067 () Bool)

(assert (=> b!211316 m!239067))

(declare-fun m!239069 () Bool)

(assert (=> b!211322 m!239069))

(declare-fun m!239071 () Bool)

(assert (=> b!211322 m!239071))

(declare-fun m!239073 () Bool)

(assert (=> b!211322 m!239073))

(declare-fun m!239075 () Bool)

(assert (=> b!211322 m!239075))

(declare-fun m!239077 () Bool)

(assert (=> b!211322 m!239077))

(declare-fun m!239079 () Bool)

(assert (=> b!211322 m!239079))

(declare-fun m!239081 () Bool)

(assert (=> b!211322 m!239081))

(declare-fun m!239083 () Bool)

(assert (=> mapNonEmpty!9233 m!239083))

(check-sat (not b_next!5571) tp_is_empty!5433 (not mapNonEmpty!9233) (not start!21020) (not b!211322) b_and!12377 (not b!211318) (not b!211319) (not b!211315) (not b!211316))
(check-sat b_and!12377 (not b_next!5571))
(get-model)

(declare-fun b!211366 () Bool)

(declare-fun e!137587 () Bool)

(declare-fun call!19999 () Bool)

(assert (=> b!211366 (= e!137587 call!19999)))

(declare-fun b!211367 () Bool)

(declare-fun e!137588 () Bool)

(declare-fun contains!1404 (List!3067 (_ BitVec 64)) Bool)

(assert (=> b!211367 (= e!137588 (contains!1404 Nil!3064 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19996 () Bool)

(declare-fun c!35683 () Bool)

(assert (=> bm!19996 (= call!19999 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35683 (Cons!3063 (select (arr!4779 _keys!825) #b00000000000000000000000000000000) Nil!3064) Nil!3064)))))

(declare-fun b!211368 () Bool)

(declare-fun e!137585 () Bool)

(assert (=> b!211368 (= e!137585 e!137587)))

(assert (=> b!211368 (= c!35683 (validKeyInArray!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211369 () Bool)

(declare-fun e!137586 () Bool)

(assert (=> b!211369 (= e!137586 e!137585)))

(declare-fun res!103229 () Bool)

(assert (=> b!211369 (=> (not res!103229) (not e!137585))))

(assert (=> b!211369 (= res!103229 (not e!137588))))

(declare-fun res!103230 () Bool)

(assert (=> b!211369 (=> (not res!103230) (not e!137588))))

(assert (=> b!211369 (= res!103230 (validKeyInArray!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211370 () Bool)

(assert (=> b!211370 (= e!137587 call!19999)))

(declare-fun d!58039 () Bool)

(declare-fun res!103231 () Bool)

(assert (=> d!58039 (=> res!103231 e!137586)))

(assert (=> d!58039 (= res!103231 (bvsge #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(assert (=> d!58039 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3064) e!137586)))

(assert (= (and d!58039 (not res!103231)) b!211369))

(assert (= (and b!211369 res!103230) b!211367))

(assert (= (and b!211369 res!103229) b!211368))

(assert (= (and b!211368 c!35683) b!211370))

(assert (= (and b!211368 (not c!35683)) b!211366))

(assert (= (or b!211370 b!211366) bm!19996))

(declare-fun m!239119 () Bool)

(assert (=> b!211367 m!239119))

(assert (=> b!211367 m!239119))

(declare-fun m!239121 () Bool)

(assert (=> b!211367 m!239121))

(assert (=> bm!19996 m!239119))

(declare-fun m!239123 () Bool)

(assert (=> bm!19996 m!239123))

(assert (=> b!211368 m!239119))

(assert (=> b!211368 m!239119))

(declare-fun m!239125 () Bool)

(assert (=> b!211368 m!239125))

(assert (=> b!211369 m!239119))

(assert (=> b!211369 m!239119))

(assert (=> b!211369 m!239125))

(assert (=> b!211319 d!58039))

(declare-fun d!58041 () Bool)

(assert (=> d!58041 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21020 d!58041))

(declare-fun d!58043 () Bool)

(assert (=> d!58043 (= (array_inv!3163 _values!649) (bvsge (size!5105 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21020 d!58043))

(declare-fun d!58045 () Bool)

(assert (=> d!58045 (= (array_inv!3164 _keys!825) (bvsge (size!5104 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21020 d!58045))

(declare-fun d!58047 () Bool)

(declare-fun e!137591 () Bool)

(assert (=> d!58047 e!137591))

(declare-fun res!103236 () Bool)

(assert (=> d!58047 (=> (not res!103236) (not e!137591))))

(declare-fun lt!108663 () ListLongMap!3087)

(declare-fun contains!1405 (ListLongMap!3087 (_ BitVec 64)) Bool)

(assert (=> d!58047 (= res!103236 (contains!1405 lt!108663 (_1!2098 lt!108625)))))

(declare-fun lt!108664 () List!3066)

(assert (=> d!58047 (= lt!108663 (ListLongMap!3088 lt!108664))))

(declare-fun lt!108666 () Unit!6416)

(declare-fun lt!108665 () Unit!6416)

(assert (=> d!58047 (= lt!108666 lt!108665)))

(declare-datatypes ((Option!258 0))(
  ( (Some!257 (v!4756 V!6891)) (None!256) )
))
(declare-fun getValueByKey!252 (List!3066 (_ BitVec 64)) Option!258)

(assert (=> d!58047 (= (getValueByKey!252 lt!108664 (_1!2098 lt!108625)) (Some!257 (_2!2098 lt!108625)))))

(declare-fun lemmaContainsTupThenGetReturnValue!139 (List!3066 (_ BitVec 64) V!6891) Unit!6416)

(assert (=> d!58047 (= lt!108665 (lemmaContainsTupThenGetReturnValue!139 lt!108664 (_1!2098 lt!108625) (_2!2098 lt!108625)))))

(declare-fun insertStrictlySorted!142 (List!3066 (_ BitVec 64) V!6891) List!3066)

(assert (=> d!58047 (= lt!108664 (insertStrictlySorted!142 (toList!1559 lt!108626) (_1!2098 lt!108625) (_2!2098 lt!108625)))))

(assert (=> d!58047 (= (+!562 lt!108626 lt!108625) lt!108663)))

(declare-fun b!211375 () Bool)

(declare-fun res!103237 () Bool)

(assert (=> b!211375 (=> (not res!103237) (not e!137591))))

(assert (=> b!211375 (= res!103237 (= (getValueByKey!252 (toList!1559 lt!108663) (_1!2098 lt!108625)) (Some!257 (_2!2098 lt!108625))))))

(declare-fun b!211376 () Bool)

(declare-fun contains!1406 (List!3066 tuple2!4174) Bool)

(assert (=> b!211376 (= e!137591 (contains!1406 (toList!1559 lt!108663) lt!108625))))

(assert (= (and d!58047 res!103236) b!211375))

(assert (= (and b!211375 res!103237) b!211376))

(declare-fun m!239127 () Bool)

(assert (=> d!58047 m!239127))

(declare-fun m!239129 () Bool)

(assert (=> d!58047 m!239129))

(declare-fun m!239131 () Bool)

(assert (=> d!58047 m!239131))

(declare-fun m!239133 () Bool)

(assert (=> d!58047 m!239133))

(declare-fun m!239135 () Bool)

(assert (=> b!211375 m!239135))

(declare-fun m!239137 () Bool)

(assert (=> b!211376 m!239137))

(assert (=> b!211315 d!58047))

(declare-fun d!58049 () Bool)

(declare-fun e!137592 () Bool)

(assert (=> d!58049 e!137592))

(declare-fun res!103238 () Bool)

(assert (=> d!58049 (=> (not res!103238) (not e!137592))))

(declare-fun lt!108667 () ListLongMap!3087)

(assert (=> d!58049 (= res!103238 (contains!1405 lt!108667 (_1!2098 lt!108625)))))

(declare-fun lt!108668 () List!3066)

(assert (=> d!58049 (= lt!108667 (ListLongMap!3088 lt!108668))))

(declare-fun lt!108670 () Unit!6416)

(declare-fun lt!108669 () Unit!6416)

(assert (=> d!58049 (= lt!108670 lt!108669)))

(assert (=> d!58049 (= (getValueByKey!252 lt!108668 (_1!2098 lt!108625)) (Some!257 (_2!2098 lt!108625)))))

(assert (=> d!58049 (= lt!108669 (lemmaContainsTupThenGetReturnValue!139 lt!108668 (_1!2098 lt!108625) (_2!2098 lt!108625)))))

(assert (=> d!58049 (= lt!108668 (insertStrictlySorted!142 (toList!1559 lt!108630) (_1!2098 lt!108625) (_2!2098 lt!108625)))))

(assert (=> d!58049 (= (+!562 lt!108630 lt!108625) lt!108667)))

(declare-fun b!211377 () Bool)

(declare-fun res!103239 () Bool)

(assert (=> b!211377 (=> (not res!103239) (not e!137592))))

(assert (=> b!211377 (= res!103239 (= (getValueByKey!252 (toList!1559 lt!108667) (_1!2098 lt!108625)) (Some!257 (_2!2098 lt!108625))))))

(declare-fun b!211378 () Bool)

(assert (=> b!211378 (= e!137592 (contains!1406 (toList!1559 lt!108667) lt!108625))))

(assert (= (and d!58049 res!103238) b!211377))

(assert (= (and b!211377 res!103239) b!211378))

(declare-fun m!239139 () Bool)

(assert (=> d!58049 m!239139))

(declare-fun m!239141 () Bool)

(assert (=> d!58049 m!239141))

(declare-fun m!239143 () Bool)

(assert (=> d!58049 m!239143))

(declare-fun m!239145 () Bool)

(assert (=> d!58049 m!239145))

(declare-fun m!239147 () Bool)

(assert (=> b!211377 m!239147))

(declare-fun m!239149 () Bool)

(assert (=> b!211378 m!239149))

(assert (=> b!211315 d!58049))

(declare-fun b!211403 () Bool)

(declare-fun e!137610 () ListLongMap!3087)

(declare-fun e!137609 () ListLongMap!3087)

(assert (=> b!211403 (= e!137610 e!137609)))

(declare-fun c!35693 () Bool)

(assert (=> b!211403 (= c!35693 (validKeyInArray!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211404 () Bool)

(declare-fun res!103251 () Bool)

(declare-fun e!137611 () Bool)

(assert (=> b!211404 (=> (not res!103251) (not e!137611))))

(declare-fun lt!108686 () ListLongMap!3087)

(assert (=> b!211404 (= res!103251 (not (contains!1405 lt!108686 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211405 () Bool)

(declare-fun call!20002 () ListLongMap!3087)

(assert (=> b!211405 (= e!137609 call!20002)))

(declare-fun d!58051 () Bool)

(assert (=> d!58051 e!137611))

(declare-fun res!103250 () Bool)

(assert (=> d!58051 (=> (not res!103250) (not e!137611))))

(assert (=> d!58051 (= res!103250 (not (contains!1405 lt!108686 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58051 (= lt!108686 e!137610)))

(declare-fun c!35695 () Bool)

(assert (=> d!58051 (= c!35695 (bvsge #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(assert (=> d!58051 (validMask!0 mask!1149)))

(assert (=> d!58051 (= (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108686)))

(declare-fun bm!19999 () Bool)

(assert (=> bm!19999 (= call!20002 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211406 () Bool)

(assert (=> b!211406 (= e!137610 (ListLongMap!3088 Nil!3063))))

(declare-fun b!211407 () Bool)

(declare-fun lt!108687 () Unit!6416)

(declare-fun lt!108689 () Unit!6416)

(assert (=> b!211407 (= lt!108687 lt!108689)))

(declare-fun lt!108688 () V!6891)

(declare-fun lt!108685 () ListLongMap!3087)

(declare-fun lt!108691 () (_ BitVec 64))

(declare-fun lt!108690 () (_ BitVec 64))

(assert (=> b!211407 (not (contains!1405 (+!562 lt!108685 (tuple2!4175 lt!108691 lt!108688)) lt!108690))))

(declare-fun addStillNotContains!103 (ListLongMap!3087 (_ BitVec 64) V!6891 (_ BitVec 64)) Unit!6416)

(assert (=> b!211407 (= lt!108689 (addStillNotContains!103 lt!108685 lt!108691 lt!108688 lt!108690))))

(assert (=> b!211407 (= lt!108690 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2560 (ValueCell!2373 V!6891) V!6891)

(declare-fun dynLambda!537 (Int (_ BitVec 64)) V!6891)

(assert (=> b!211407 (= lt!108688 (get!2560 (select (arr!4780 _values!649) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211407 (= lt!108691 (select (arr!4779 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211407 (= lt!108685 call!20002)))

(assert (=> b!211407 (= e!137609 (+!562 call!20002 (tuple2!4175 (select (arr!4779 _keys!825) #b00000000000000000000000000000000) (get!2560 (select (arr!4780 _values!649) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211408 () Bool)

(declare-fun e!137608 () Bool)

(declare-fun e!137607 () Bool)

(assert (=> b!211408 (= e!137608 e!137607)))

(declare-fun c!35694 () Bool)

(assert (=> b!211408 (= c!35694 (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun b!211409 () Bool)

(declare-fun e!137612 () Bool)

(assert (=> b!211409 (= e!137612 (validKeyInArray!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211409 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!211410 () Bool)

(assert (=> b!211410 (= e!137607 (= lt!108686 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211411 () Bool)

(declare-fun e!137613 () Bool)

(assert (=> b!211411 (= e!137608 e!137613)))

(assert (=> b!211411 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun res!103249 () Bool)

(assert (=> b!211411 (= res!103249 (contains!1405 lt!108686 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211411 (=> (not res!103249) (not e!137613))))

(declare-fun b!211412 () Bool)

(declare-fun isEmpty!495 (ListLongMap!3087) Bool)

(assert (=> b!211412 (= e!137607 (isEmpty!495 lt!108686))))

(declare-fun b!211413 () Bool)

(assert (=> b!211413 (= e!137611 e!137608)))

(declare-fun c!35692 () Bool)

(assert (=> b!211413 (= c!35692 e!137612)))

(declare-fun res!103248 () Bool)

(assert (=> b!211413 (=> (not res!103248) (not e!137612))))

(assert (=> b!211413 (= res!103248 (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun b!211414 () Bool)

(assert (=> b!211414 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(assert (=> b!211414 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5105 _values!649)))))

(declare-fun apply!194 (ListLongMap!3087 (_ BitVec 64)) V!6891)

(assert (=> b!211414 (= e!137613 (= (apply!194 lt!108686 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)) (get!2560 (select (arr!4780 _values!649) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!58051 c!35695) b!211406))

(assert (= (and d!58051 (not c!35695)) b!211403))

(assert (= (and b!211403 c!35693) b!211407))

(assert (= (and b!211403 (not c!35693)) b!211405))

(assert (= (or b!211407 b!211405) bm!19999))

(assert (= (and d!58051 res!103250) b!211404))

(assert (= (and b!211404 res!103251) b!211413))

(assert (= (and b!211413 res!103248) b!211409))

(assert (= (and b!211413 c!35692) b!211411))

(assert (= (and b!211413 (not c!35692)) b!211408))

(assert (= (and b!211411 res!103249) b!211414))

(assert (= (and b!211408 c!35694) b!211410))

(assert (= (and b!211408 (not c!35694)) b!211412))

(declare-fun b_lambda!7659 () Bool)

(assert (=> (not b_lambda!7659) (not b!211407)))

(declare-fun t!8011 () Bool)

(declare-fun tb!2901 () Bool)

(assert (=> (and start!21020 (= defaultEntry!657 defaultEntry!657) t!8011) tb!2901))

(declare-fun result!4991 () Bool)

(assert (=> tb!2901 (= result!4991 tp_is_empty!5433)))

(assert (=> b!211407 t!8011))

(declare-fun b_and!12381 () Bool)

(assert (= b_and!12377 (and (=> t!8011 result!4991) b_and!12381)))

(declare-fun b_lambda!7661 () Bool)

(assert (=> (not b_lambda!7661) (not b!211414)))

(assert (=> b!211414 t!8011))

(declare-fun b_and!12383 () Bool)

(assert (= b_and!12381 (and (=> t!8011 result!4991) b_and!12383)))

(declare-fun m!239151 () Bool)

(assert (=> b!211410 m!239151))

(declare-fun m!239153 () Bool)

(assert (=> b!211412 m!239153))

(declare-fun m!239155 () Bool)

(assert (=> b!211404 m!239155))

(assert (=> b!211409 m!239119))

(assert (=> b!211409 m!239119))

(assert (=> b!211409 m!239125))

(declare-fun m!239157 () Bool)

(assert (=> b!211407 m!239157))

(declare-fun m!239159 () Bool)

(assert (=> b!211407 m!239159))

(declare-fun m!239161 () Bool)

(assert (=> b!211407 m!239161))

(declare-fun m!239163 () Bool)

(assert (=> b!211407 m!239163))

(declare-fun m!239165 () Bool)

(assert (=> b!211407 m!239165))

(assert (=> b!211407 m!239161))

(declare-fun m!239167 () Bool)

(assert (=> b!211407 m!239167))

(assert (=> b!211407 m!239119))

(assert (=> b!211407 m!239159))

(assert (=> b!211407 m!239165))

(declare-fun m!239169 () Bool)

(assert (=> b!211407 m!239169))

(assert (=> b!211403 m!239119))

(assert (=> b!211403 m!239119))

(assert (=> b!211403 m!239125))

(assert (=> b!211414 m!239159))

(assert (=> b!211414 m!239119))

(declare-fun m!239171 () Bool)

(assert (=> b!211414 m!239171))

(assert (=> b!211414 m!239165))

(assert (=> b!211414 m!239119))

(assert (=> b!211414 m!239159))

(assert (=> b!211414 m!239165))

(assert (=> b!211414 m!239169))

(declare-fun m!239173 () Bool)

(assert (=> d!58051 m!239173))

(assert (=> d!58051 m!239053))

(assert (=> bm!19999 m!239151))

(assert (=> b!211411 m!239119))

(assert (=> b!211411 m!239119))

(declare-fun m!239175 () Bool)

(assert (=> b!211411 m!239175))

(assert (=> b!211322 d!58051))

(declare-fun b!211459 () Bool)

(declare-fun e!137648 () Bool)

(declare-fun lt!108751 () ListLongMap!3087)

(assert (=> b!211459 (= e!137648 (= (apply!194 lt!108751 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211460 () Bool)

(declare-fun e!137644 () Unit!6416)

(declare-fun Unit!6420 () Unit!6416)

(assert (=> b!211460 (= e!137644 Unit!6420)))

(declare-fun b!211461 () Bool)

(declare-fun e!137647 () Bool)

(declare-fun e!137645 () Bool)

(assert (=> b!211461 (= e!137647 e!137645)))

(declare-fun res!103270 () Bool)

(assert (=> b!211461 (=> (not res!103270) (not e!137645))))

(assert (=> b!211461 (= res!103270 (contains!1405 lt!108751 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun b!211462 () Bool)

(declare-fun e!137652 () ListLongMap!3087)

(declare-fun call!20022 () ListLongMap!3087)

(assert (=> b!211462 (= e!137652 call!20022)))

(declare-fun bm!20014 () Bool)

(declare-fun call!20021 () Bool)

(assert (=> bm!20014 (= call!20021 (contains!1405 lt!108751 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211463 () Bool)

(declare-fun e!137640 () Bool)

(assert (=> b!211463 (= e!137640 (validKeyInArray!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun call!20019 () ListLongMap!3087)

(declare-fun call!20018 () ListLongMap!3087)

(declare-fun bm!20015 () Bool)

(declare-fun c!35709 () Bool)

(declare-fun c!35708 () Bool)

(declare-fun call!20023 () ListLongMap!3087)

(assert (=> bm!20015 (= call!20018 (+!562 (ite c!35709 call!20019 (ite c!35708 call!20023 call!20022)) (ite (or c!35709 c!35708) (tuple2!4175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20016 () Bool)

(assert (=> bm!20016 (= call!20019 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108629 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211464 () Bool)

(declare-fun e!137650 () Bool)

(assert (=> b!211464 (= e!137650 (= (apply!194 lt!108751 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun d!58053 () Bool)

(declare-fun e!137642 () Bool)

(assert (=> d!58053 e!137642))

(declare-fun res!103277 () Bool)

(assert (=> d!58053 (=> (not res!103277) (not e!137642))))

(assert (=> d!58053 (= res!103277 (or (bvsge #b00000000000000000000000000000000 (size!5104 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))))

(declare-fun lt!108749 () ListLongMap!3087)

(assert (=> d!58053 (= lt!108751 lt!108749)))

(declare-fun lt!108754 () Unit!6416)

(assert (=> d!58053 (= lt!108754 e!137644)))

(declare-fun c!35712 () Bool)

(assert (=> d!58053 (= c!35712 e!137640)))

(declare-fun res!103272 () Bool)

(assert (=> d!58053 (=> (not res!103272) (not e!137640))))

(assert (=> d!58053 (= res!103272 (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun e!137649 () ListLongMap!3087)

(assert (=> d!58053 (= lt!108749 e!137649)))

(assert (=> d!58053 (= c!35709 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58053 (validMask!0 mask!1149)))

(assert (=> d!58053 (= (getCurrentListMap!1093 _keys!825 lt!108629 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108751)))

(declare-fun b!211465 () Bool)

(declare-fun e!137646 () Bool)

(assert (=> b!211465 (= e!137646 e!137650)))

(declare-fun res!103271 () Bool)

(assert (=> b!211465 (= res!103271 call!20021)))

(assert (=> b!211465 (=> (not res!103271) (not e!137650))))

(declare-fun b!211466 () Bool)

(declare-fun res!103275 () Bool)

(assert (=> b!211466 (=> (not res!103275) (not e!137642))))

(declare-fun e!137651 () Bool)

(assert (=> b!211466 (= res!103275 e!137651)))

(declare-fun c!35710 () Bool)

(assert (=> b!211466 (= c!35710 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20017 () Bool)

(assert (=> bm!20017 (= call!20022 call!20023)))

(declare-fun b!211467 () Bool)

(declare-fun e!137641 () ListLongMap!3087)

(declare-fun call!20017 () ListLongMap!3087)

(assert (=> b!211467 (= e!137641 call!20017)))

(declare-fun b!211468 () Bool)

(assert (=> b!211468 (= e!137652 call!20017)))

(declare-fun bm!20018 () Bool)

(declare-fun call!20020 () Bool)

(assert (=> bm!20018 (= call!20020 (contains!1405 lt!108751 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211469 () Bool)

(declare-fun res!103278 () Bool)

(assert (=> b!211469 (=> (not res!103278) (not e!137642))))

(assert (=> b!211469 (= res!103278 e!137647)))

(declare-fun res!103274 () Bool)

(assert (=> b!211469 (=> res!103274 e!137647)))

(declare-fun e!137643 () Bool)

(assert (=> b!211469 (= res!103274 (not e!137643))))

(declare-fun res!103273 () Bool)

(assert (=> b!211469 (=> (not res!103273) (not e!137643))))

(assert (=> b!211469 (= res!103273 (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun b!211470 () Bool)

(assert (=> b!211470 (= e!137646 (not call!20021))))

(declare-fun b!211471 () Bool)

(declare-fun c!35713 () Bool)

(assert (=> b!211471 (= c!35713 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!211471 (= e!137641 e!137652)))

(declare-fun bm!20019 () Bool)

(assert (=> bm!20019 (= call!20017 call!20018)))

(declare-fun bm!20020 () Bool)

(assert (=> bm!20020 (= call!20023 call!20019)))

(declare-fun b!211472 () Bool)

(assert (=> b!211472 (= e!137643 (validKeyInArray!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211473 () Bool)

(assert (=> b!211473 (= e!137649 (+!562 call!20018 (tuple2!4175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!211474 () Bool)

(assert (=> b!211474 (= e!137649 e!137641)))

(assert (=> b!211474 (= c!35708 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211475 () Bool)

(assert (=> b!211475 (= e!137642 e!137646)))

(declare-fun c!35711 () Bool)

(assert (=> b!211475 (= c!35711 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211476 () Bool)

(assert (=> b!211476 (= e!137651 e!137648)))

(declare-fun res!103276 () Bool)

(assert (=> b!211476 (= res!103276 call!20020)))

(assert (=> b!211476 (=> (not res!103276) (not e!137648))))

(declare-fun b!211477 () Bool)

(declare-fun lt!108753 () Unit!6416)

(assert (=> b!211477 (= e!137644 lt!108753)))

(declare-fun lt!108756 () ListLongMap!3087)

(assert (=> b!211477 (= lt!108756 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108629 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108737 () (_ BitVec 64))

(assert (=> b!211477 (= lt!108737 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108745 () (_ BitVec 64))

(assert (=> b!211477 (= lt!108745 (select (arr!4779 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108741 () Unit!6416)

(declare-fun addStillContains!170 (ListLongMap!3087 (_ BitVec 64) V!6891 (_ BitVec 64)) Unit!6416)

(assert (=> b!211477 (= lt!108741 (addStillContains!170 lt!108756 lt!108737 zeroValue!615 lt!108745))))

(assert (=> b!211477 (contains!1405 (+!562 lt!108756 (tuple2!4175 lt!108737 zeroValue!615)) lt!108745)))

(declare-fun lt!108744 () Unit!6416)

(assert (=> b!211477 (= lt!108744 lt!108741)))

(declare-fun lt!108750 () ListLongMap!3087)

(assert (=> b!211477 (= lt!108750 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108629 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108757 () (_ BitVec 64))

(assert (=> b!211477 (= lt!108757 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108743 () (_ BitVec 64))

(assert (=> b!211477 (= lt!108743 (select (arr!4779 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108742 () Unit!6416)

(declare-fun addApplyDifferent!170 (ListLongMap!3087 (_ BitVec 64) V!6891 (_ BitVec 64)) Unit!6416)

(assert (=> b!211477 (= lt!108742 (addApplyDifferent!170 lt!108750 lt!108757 minValue!615 lt!108743))))

(assert (=> b!211477 (= (apply!194 (+!562 lt!108750 (tuple2!4175 lt!108757 minValue!615)) lt!108743) (apply!194 lt!108750 lt!108743))))

(declare-fun lt!108740 () Unit!6416)

(assert (=> b!211477 (= lt!108740 lt!108742)))

(declare-fun lt!108739 () ListLongMap!3087)

(assert (=> b!211477 (= lt!108739 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108629 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108752 () (_ BitVec 64))

(assert (=> b!211477 (= lt!108752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108746 () (_ BitVec 64))

(assert (=> b!211477 (= lt!108746 (select (arr!4779 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108755 () Unit!6416)

(assert (=> b!211477 (= lt!108755 (addApplyDifferent!170 lt!108739 lt!108752 zeroValue!615 lt!108746))))

(assert (=> b!211477 (= (apply!194 (+!562 lt!108739 (tuple2!4175 lt!108752 zeroValue!615)) lt!108746) (apply!194 lt!108739 lt!108746))))

(declare-fun lt!108747 () Unit!6416)

(assert (=> b!211477 (= lt!108747 lt!108755)))

(declare-fun lt!108736 () ListLongMap!3087)

(assert (=> b!211477 (= lt!108736 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108629 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108748 () (_ BitVec 64))

(assert (=> b!211477 (= lt!108748 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108738 () (_ BitVec 64))

(assert (=> b!211477 (= lt!108738 (select (arr!4779 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211477 (= lt!108753 (addApplyDifferent!170 lt!108736 lt!108748 minValue!615 lt!108738))))

(assert (=> b!211477 (= (apply!194 (+!562 lt!108736 (tuple2!4175 lt!108748 minValue!615)) lt!108738) (apply!194 lt!108736 lt!108738))))

(declare-fun b!211478 () Bool)

(assert (=> b!211478 (= e!137651 (not call!20020))))

(declare-fun b!211479 () Bool)

(assert (=> b!211479 (= e!137645 (= (apply!194 lt!108751 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)) (get!2560 (select (arr!4780 lt!108629) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5105 lt!108629)))))

(assert (=> b!211479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(assert (= (and d!58053 c!35709) b!211473))

(assert (= (and d!58053 (not c!35709)) b!211474))

(assert (= (and b!211474 c!35708) b!211467))

(assert (= (and b!211474 (not c!35708)) b!211471))

(assert (= (and b!211471 c!35713) b!211468))

(assert (= (and b!211471 (not c!35713)) b!211462))

(assert (= (or b!211468 b!211462) bm!20017))

(assert (= (or b!211467 bm!20017) bm!20020))

(assert (= (or b!211467 b!211468) bm!20019))

(assert (= (or b!211473 bm!20020) bm!20016))

(assert (= (or b!211473 bm!20019) bm!20015))

(assert (= (and d!58053 res!103272) b!211463))

(assert (= (and d!58053 c!35712) b!211477))

(assert (= (and d!58053 (not c!35712)) b!211460))

(assert (= (and d!58053 res!103277) b!211469))

(assert (= (and b!211469 res!103273) b!211472))

(assert (= (and b!211469 (not res!103274)) b!211461))

(assert (= (and b!211461 res!103270) b!211479))

(assert (= (and b!211469 res!103278) b!211466))

(assert (= (and b!211466 c!35710) b!211476))

(assert (= (and b!211466 (not c!35710)) b!211478))

(assert (= (and b!211476 res!103276) b!211459))

(assert (= (or b!211476 b!211478) bm!20018))

(assert (= (and b!211466 res!103275) b!211475))

(assert (= (and b!211475 c!35711) b!211465))

(assert (= (and b!211475 (not c!35711)) b!211470))

(assert (= (and b!211465 res!103271) b!211464))

(assert (= (or b!211465 b!211470) bm!20014))

(declare-fun b_lambda!7663 () Bool)

(assert (=> (not b_lambda!7663) (not b!211479)))

(assert (=> b!211479 t!8011))

(declare-fun b_and!12385 () Bool)

(assert (= b_and!12383 (and (=> t!8011 result!4991) b_and!12385)))

(declare-fun m!239177 () Bool)

(assert (=> b!211477 m!239177))

(declare-fun m!239179 () Bool)

(assert (=> b!211477 m!239179))

(declare-fun m!239181 () Bool)

(assert (=> b!211477 m!239181))

(declare-fun m!239183 () Bool)

(assert (=> b!211477 m!239183))

(declare-fun m!239185 () Bool)

(assert (=> b!211477 m!239185))

(declare-fun m!239187 () Bool)

(assert (=> b!211477 m!239187))

(assert (=> b!211477 m!239187))

(declare-fun m!239189 () Bool)

(assert (=> b!211477 m!239189))

(declare-fun m!239191 () Bool)

(assert (=> b!211477 m!239191))

(declare-fun m!239193 () Bool)

(assert (=> b!211477 m!239193))

(declare-fun m!239195 () Bool)

(assert (=> b!211477 m!239195))

(assert (=> b!211477 m!239179))

(declare-fun m!239197 () Bool)

(assert (=> b!211477 m!239197))

(assert (=> b!211477 m!239183))

(declare-fun m!239199 () Bool)

(assert (=> b!211477 m!239199))

(assert (=> b!211477 m!239191))

(assert (=> b!211477 m!239079))

(declare-fun m!239201 () Bool)

(assert (=> b!211477 m!239201))

(declare-fun m!239203 () Bool)

(assert (=> b!211477 m!239203))

(declare-fun m!239205 () Bool)

(assert (=> b!211477 m!239205))

(assert (=> b!211477 m!239119))

(declare-fun m!239207 () Bool)

(assert (=> b!211479 m!239207))

(assert (=> b!211479 m!239165))

(declare-fun m!239209 () Bool)

(assert (=> b!211479 m!239209))

(assert (=> b!211479 m!239165))

(assert (=> b!211479 m!239119))

(assert (=> b!211479 m!239207))

(assert (=> b!211479 m!239119))

(declare-fun m!239211 () Bool)

(assert (=> b!211479 m!239211))

(declare-fun m!239213 () Bool)

(assert (=> b!211473 m!239213))

(declare-fun m!239215 () Bool)

(assert (=> b!211464 m!239215))

(assert (=> d!58053 m!239053))

(assert (=> b!211472 m!239119))

(assert (=> b!211472 m!239119))

(assert (=> b!211472 m!239125))

(assert (=> bm!20016 m!239079))

(assert (=> b!211463 m!239119))

(assert (=> b!211463 m!239119))

(assert (=> b!211463 m!239125))

(declare-fun m!239217 () Bool)

(assert (=> b!211459 m!239217))

(declare-fun m!239219 () Bool)

(assert (=> bm!20015 m!239219))

(assert (=> b!211461 m!239119))

(assert (=> b!211461 m!239119))

(declare-fun m!239221 () Bool)

(assert (=> b!211461 m!239221))

(declare-fun m!239223 () Bool)

(assert (=> bm!20018 m!239223))

(declare-fun m!239225 () Bool)

(assert (=> bm!20014 m!239225))

(assert (=> b!211322 d!58053))

(declare-fun d!58055 () Bool)

(declare-fun e!137653 () Bool)

(assert (=> d!58055 e!137653))

(declare-fun res!103279 () Bool)

(assert (=> d!58055 (=> (not res!103279) (not e!137653))))

(declare-fun lt!108758 () ListLongMap!3087)

(assert (=> d!58055 (= res!103279 (contains!1405 lt!108758 (_1!2098 (tuple2!4175 k0!843 v!520))))))

(declare-fun lt!108759 () List!3066)

(assert (=> d!58055 (= lt!108758 (ListLongMap!3088 lt!108759))))

(declare-fun lt!108761 () Unit!6416)

(declare-fun lt!108760 () Unit!6416)

(assert (=> d!58055 (= lt!108761 lt!108760)))

(assert (=> d!58055 (= (getValueByKey!252 lt!108759 (_1!2098 (tuple2!4175 k0!843 v!520))) (Some!257 (_2!2098 (tuple2!4175 k0!843 v!520))))))

(assert (=> d!58055 (= lt!108760 (lemmaContainsTupThenGetReturnValue!139 lt!108759 (_1!2098 (tuple2!4175 k0!843 v!520)) (_2!2098 (tuple2!4175 k0!843 v!520))))))

(assert (=> d!58055 (= lt!108759 (insertStrictlySorted!142 (toList!1559 lt!108626) (_1!2098 (tuple2!4175 k0!843 v!520)) (_2!2098 (tuple2!4175 k0!843 v!520))))))

(assert (=> d!58055 (= (+!562 lt!108626 (tuple2!4175 k0!843 v!520)) lt!108758)))

(declare-fun b!211480 () Bool)

(declare-fun res!103280 () Bool)

(assert (=> b!211480 (=> (not res!103280) (not e!137653))))

(assert (=> b!211480 (= res!103280 (= (getValueByKey!252 (toList!1559 lt!108758) (_1!2098 (tuple2!4175 k0!843 v!520))) (Some!257 (_2!2098 (tuple2!4175 k0!843 v!520)))))))

(declare-fun b!211481 () Bool)

(assert (=> b!211481 (= e!137653 (contains!1406 (toList!1559 lt!108758) (tuple2!4175 k0!843 v!520)))))

(assert (= (and d!58055 res!103279) b!211480))

(assert (= (and b!211480 res!103280) b!211481))

(declare-fun m!239227 () Bool)

(assert (=> d!58055 m!239227))

(declare-fun m!239229 () Bool)

(assert (=> d!58055 m!239229))

(declare-fun m!239231 () Bool)

(assert (=> d!58055 m!239231))

(declare-fun m!239233 () Bool)

(assert (=> d!58055 m!239233))

(declare-fun m!239235 () Bool)

(assert (=> b!211480 m!239235))

(declare-fun m!239237 () Bool)

(assert (=> b!211481 m!239237))

(assert (=> b!211322 d!58055))

(declare-fun d!58057 () Bool)

(declare-fun e!137659 () Bool)

(assert (=> d!58057 e!137659))

(declare-fun res!103283 () Bool)

(assert (=> d!58057 (=> (not res!103283) (not e!137659))))

(assert (=> d!58057 (= res!103283 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5105 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5105 _values!649))))))))

(declare-fun lt!108764 () Unit!6416)

(declare-fun choose!1078 (array!10067 array!10069 (_ BitVec 32) (_ BitVec 32) V!6891 V!6891 (_ BitVec 32) (_ BitVec 64) V!6891 (_ BitVec 32) Int) Unit!6416)

(assert (=> d!58057 (= lt!108764 (choose!1078 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(assert (=> d!58057 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!210 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!108764)))

(declare-fun call!20029 () ListLongMap!3087)

(declare-fun b!211488 () Bool)

(declare-fun e!137658 () Bool)

(declare-fun call!20028 () ListLongMap!3087)

(assert (=> b!211488 (= e!137658 (= call!20029 (+!562 call!20028 (tuple2!4175 k0!843 v!520))))))

(declare-fun bm!20025 () Bool)

(assert (=> bm!20025 (= call!20029 (getCurrentListMapNoExtraKeys!495 _keys!825 (array!10070 (store (arr!4780 _values!649) i!601 (ValueCellFull!2373 v!520)) (size!5105 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!20026 () Bool)

(assert (=> bm!20026 (= call!20028 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211489 () Bool)

(assert (=> b!211489 (= e!137658 (= call!20029 call!20028))))

(declare-fun b!211490 () Bool)

(assert (=> b!211490 (= e!137659 e!137658)))

(declare-fun c!35716 () Bool)

(assert (=> b!211490 (= c!35716 (bvsle #b00000000000000000000000000000000 i!601))))

(assert (= (and d!58057 res!103283) b!211490))

(assert (= (and b!211490 c!35716) b!211488))

(assert (= (and b!211490 (not c!35716)) b!211489))

(assert (= (or b!211488 b!211489) bm!20025))

(assert (= (or b!211488 b!211489) bm!20026))

(declare-fun m!239239 () Bool)

(assert (=> d!58057 m!239239))

(declare-fun m!239241 () Bool)

(assert (=> b!211488 m!239241))

(assert (=> bm!20025 m!239073))

(declare-fun m!239243 () Bool)

(assert (=> bm!20025 m!239243))

(assert (=> bm!20026 m!239077))

(assert (=> b!211322 d!58057))

(declare-fun b!211491 () Bool)

(declare-fun e!137668 () Bool)

(declare-fun lt!108780 () ListLongMap!3087)

(assert (=> b!211491 (= e!137668 (= (apply!194 lt!108780 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211492 () Bool)

(declare-fun e!137664 () Unit!6416)

(declare-fun Unit!6421 () Unit!6416)

(assert (=> b!211492 (= e!137664 Unit!6421)))

(declare-fun b!211493 () Bool)

(declare-fun e!137667 () Bool)

(declare-fun e!137665 () Bool)

(assert (=> b!211493 (= e!137667 e!137665)))

(declare-fun res!103284 () Bool)

(assert (=> b!211493 (=> (not res!103284) (not e!137665))))

(assert (=> b!211493 (= res!103284 (contains!1405 lt!108780 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun b!211494 () Bool)

(declare-fun e!137672 () ListLongMap!3087)

(declare-fun call!20035 () ListLongMap!3087)

(assert (=> b!211494 (= e!137672 call!20035)))

(declare-fun bm!20027 () Bool)

(declare-fun call!20034 () Bool)

(assert (=> bm!20027 (= call!20034 (contains!1405 lt!108780 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211495 () Bool)

(declare-fun e!137660 () Bool)

(assert (=> b!211495 (= e!137660 (validKeyInArray!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun call!20032 () ListLongMap!3087)

(declare-fun call!20031 () ListLongMap!3087)

(declare-fun call!20036 () ListLongMap!3087)

(declare-fun bm!20028 () Bool)

(declare-fun c!35717 () Bool)

(declare-fun c!35718 () Bool)

(assert (=> bm!20028 (= call!20031 (+!562 (ite c!35718 call!20032 (ite c!35717 call!20036 call!20035)) (ite (or c!35718 c!35717) (tuple2!4175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20029 () Bool)

(assert (=> bm!20029 (= call!20032 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211496 () Bool)

(declare-fun e!137670 () Bool)

(assert (=> b!211496 (= e!137670 (= (apply!194 lt!108780 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun d!58059 () Bool)

(declare-fun e!137662 () Bool)

(assert (=> d!58059 e!137662))

(declare-fun res!103291 () Bool)

(assert (=> d!58059 (=> (not res!103291) (not e!137662))))

(assert (=> d!58059 (= res!103291 (or (bvsge #b00000000000000000000000000000000 (size!5104 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))))

(declare-fun lt!108778 () ListLongMap!3087)

(assert (=> d!58059 (= lt!108780 lt!108778)))

(declare-fun lt!108783 () Unit!6416)

(assert (=> d!58059 (= lt!108783 e!137664)))

(declare-fun c!35721 () Bool)

(assert (=> d!58059 (= c!35721 e!137660)))

(declare-fun res!103286 () Bool)

(assert (=> d!58059 (=> (not res!103286) (not e!137660))))

(assert (=> d!58059 (= res!103286 (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun e!137669 () ListLongMap!3087)

(assert (=> d!58059 (= lt!108778 e!137669)))

(assert (=> d!58059 (= c!35718 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58059 (validMask!0 mask!1149)))

(assert (=> d!58059 (= (getCurrentListMap!1093 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108780)))

(declare-fun b!211497 () Bool)

(declare-fun e!137666 () Bool)

(assert (=> b!211497 (= e!137666 e!137670)))

(declare-fun res!103285 () Bool)

(assert (=> b!211497 (= res!103285 call!20034)))

(assert (=> b!211497 (=> (not res!103285) (not e!137670))))

(declare-fun b!211498 () Bool)

(declare-fun res!103289 () Bool)

(assert (=> b!211498 (=> (not res!103289) (not e!137662))))

(declare-fun e!137671 () Bool)

(assert (=> b!211498 (= res!103289 e!137671)))

(declare-fun c!35719 () Bool)

(assert (=> b!211498 (= c!35719 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20030 () Bool)

(assert (=> bm!20030 (= call!20035 call!20036)))

(declare-fun b!211499 () Bool)

(declare-fun e!137661 () ListLongMap!3087)

(declare-fun call!20030 () ListLongMap!3087)

(assert (=> b!211499 (= e!137661 call!20030)))

(declare-fun b!211500 () Bool)

(assert (=> b!211500 (= e!137672 call!20030)))

(declare-fun bm!20031 () Bool)

(declare-fun call!20033 () Bool)

(assert (=> bm!20031 (= call!20033 (contains!1405 lt!108780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211501 () Bool)

(declare-fun res!103292 () Bool)

(assert (=> b!211501 (=> (not res!103292) (not e!137662))))

(assert (=> b!211501 (= res!103292 e!137667)))

(declare-fun res!103288 () Bool)

(assert (=> b!211501 (=> res!103288 e!137667)))

(declare-fun e!137663 () Bool)

(assert (=> b!211501 (= res!103288 (not e!137663))))

(declare-fun res!103287 () Bool)

(assert (=> b!211501 (=> (not res!103287) (not e!137663))))

(assert (=> b!211501 (= res!103287 (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun b!211502 () Bool)

(assert (=> b!211502 (= e!137666 (not call!20034))))

(declare-fun b!211503 () Bool)

(declare-fun c!35722 () Bool)

(assert (=> b!211503 (= c!35722 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!211503 (= e!137661 e!137672)))

(declare-fun bm!20032 () Bool)

(assert (=> bm!20032 (= call!20030 call!20031)))

(declare-fun bm!20033 () Bool)

(assert (=> bm!20033 (= call!20036 call!20032)))

(declare-fun b!211504 () Bool)

(assert (=> b!211504 (= e!137663 (validKeyInArray!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211505 () Bool)

(assert (=> b!211505 (= e!137669 (+!562 call!20031 (tuple2!4175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!211506 () Bool)

(assert (=> b!211506 (= e!137669 e!137661)))

(assert (=> b!211506 (= c!35717 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211507 () Bool)

(assert (=> b!211507 (= e!137662 e!137666)))

(declare-fun c!35720 () Bool)

(assert (=> b!211507 (= c!35720 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211508 () Bool)

(assert (=> b!211508 (= e!137671 e!137668)))

(declare-fun res!103290 () Bool)

(assert (=> b!211508 (= res!103290 call!20033)))

(assert (=> b!211508 (=> (not res!103290) (not e!137668))))

(declare-fun b!211509 () Bool)

(declare-fun lt!108782 () Unit!6416)

(assert (=> b!211509 (= e!137664 lt!108782)))

(declare-fun lt!108785 () ListLongMap!3087)

(assert (=> b!211509 (= lt!108785 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108766 () (_ BitVec 64))

(assert (=> b!211509 (= lt!108766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108774 () (_ BitVec 64))

(assert (=> b!211509 (= lt!108774 (select (arr!4779 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108770 () Unit!6416)

(assert (=> b!211509 (= lt!108770 (addStillContains!170 lt!108785 lt!108766 zeroValue!615 lt!108774))))

(assert (=> b!211509 (contains!1405 (+!562 lt!108785 (tuple2!4175 lt!108766 zeroValue!615)) lt!108774)))

(declare-fun lt!108773 () Unit!6416)

(assert (=> b!211509 (= lt!108773 lt!108770)))

(declare-fun lt!108779 () ListLongMap!3087)

(assert (=> b!211509 (= lt!108779 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108786 () (_ BitVec 64))

(assert (=> b!211509 (= lt!108786 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108772 () (_ BitVec 64))

(assert (=> b!211509 (= lt!108772 (select (arr!4779 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108771 () Unit!6416)

(assert (=> b!211509 (= lt!108771 (addApplyDifferent!170 lt!108779 lt!108786 minValue!615 lt!108772))))

(assert (=> b!211509 (= (apply!194 (+!562 lt!108779 (tuple2!4175 lt!108786 minValue!615)) lt!108772) (apply!194 lt!108779 lt!108772))))

(declare-fun lt!108769 () Unit!6416)

(assert (=> b!211509 (= lt!108769 lt!108771)))

(declare-fun lt!108768 () ListLongMap!3087)

(assert (=> b!211509 (= lt!108768 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108781 () (_ BitVec 64))

(assert (=> b!211509 (= lt!108781 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108775 () (_ BitVec 64))

(assert (=> b!211509 (= lt!108775 (select (arr!4779 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108784 () Unit!6416)

(assert (=> b!211509 (= lt!108784 (addApplyDifferent!170 lt!108768 lt!108781 zeroValue!615 lt!108775))))

(assert (=> b!211509 (= (apply!194 (+!562 lt!108768 (tuple2!4175 lt!108781 zeroValue!615)) lt!108775) (apply!194 lt!108768 lt!108775))))

(declare-fun lt!108776 () Unit!6416)

(assert (=> b!211509 (= lt!108776 lt!108784)))

(declare-fun lt!108765 () ListLongMap!3087)

(assert (=> b!211509 (= lt!108765 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108777 () (_ BitVec 64))

(assert (=> b!211509 (= lt!108777 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108767 () (_ BitVec 64))

(assert (=> b!211509 (= lt!108767 (select (arr!4779 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211509 (= lt!108782 (addApplyDifferent!170 lt!108765 lt!108777 minValue!615 lt!108767))))

(assert (=> b!211509 (= (apply!194 (+!562 lt!108765 (tuple2!4175 lt!108777 minValue!615)) lt!108767) (apply!194 lt!108765 lt!108767))))

(declare-fun b!211510 () Bool)

(assert (=> b!211510 (= e!137671 (not call!20033))))

(declare-fun b!211511 () Bool)

(assert (=> b!211511 (= e!137665 (= (apply!194 lt!108780 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)) (get!2560 (select (arr!4780 _values!649) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211511 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5105 _values!649)))))

(assert (=> b!211511 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(assert (= (and d!58059 c!35718) b!211505))

(assert (= (and d!58059 (not c!35718)) b!211506))

(assert (= (and b!211506 c!35717) b!211499))

(assert (= (and b!211506 (not c!35717)) b!211503))

(assert (= (and b!211503 c!35722) b!211500))

(assert (= (and b!211503 (not c!35722)) b!211494))

(assert (= (or b!211500 b!211494) bm!20030))

(assert (= (or b!211499 bm!20030) bm!20033))

(assert (= (or b!211499 b!211500) bm!20032))

(assert (= (or b!211505 bm!20033) bm!20029))

(assert (= (or b!211505 bm!20032) bm!20028))

(assert (= (and d!58059 res!103286) b!211495))

(assert (= (and d!58059 c!35721) b!211509))

(assert (= (and d!58059 (not c!35721)) b!211492))

(assert (= (and d!58059 res!103291) b!211501))

(assert (= (and b!211501 res!103287) b!211504))

(assert (= (and b!211501 (not res!103288)) b!211493))

(assert (= (and b!211493 res!103284) b!211511))

(assert (= (and b!211501 res!103292) b!211498))

(assert (= (and b!211498 c!35719) b!211508))

(assert (= (and b!211498 (not c!35719)) b!211510))

(assert (= (and b!211508 res!103290) b!211491))

(assert (= (or b!211508 b!211510) bm!20031))

(assert (= (and b!211498 res!103289) b!211507))

(assert (= (and b!211507 c!35720) b!211497))

(assert (= (and b!211507 (not c!35720)) b!211502))

(assert (= (and b!211497 res!103285) b!211496))

(assert (= (or b!211497 b!211502) bm!20027))

(declare-fun b_lambda!7665 () Bool)

(assert (=> (not b_lambda!7665) (not b!211511)))

(assert (=> b!211511 t!8011))

(declare-fun b_and!12387 () Bool)

(assert (= b_and!12385 (and (=> t!8011 result!4991) b_and!12387)))

(declare-fun m!239245 () Bool)

(assert (=> b!211509 m!239245))

(declare-fun m!239247 () Bool)

(assert (=> b!211509 m!239247))

(declare-fun m!239249 () Bool)

(assert (=> b!211509 m!239249))

(declare-fun m!239251 () Bool)

(assert (=> b!211509 m!239251))

(declare-fun m!239253 () Bool)

(assert (=> b!211509 m!239253))

(declare-fun m!239255 () Bool)

(assert (=> b!211509 m!239255))

(assert (=> b!211509 m!239255))

(declare-fun m!239257 () Bool)

(assert (=> b!211509 m!239257))

(declare-fun m!239259 () Bool)

(assert (=> b!211509 m!239259))

(declare-fun m!239261 () Bool)

(assert (=> b!211509 m!239261))

(declare-fun m!239263 () Bool)

(assert (=> b!211509 m!239263))

(assert (=> b!211509 m!239247))

(declare-fun m!239265 () Bool)

(assert (=> b!211509 m!239265))

(assert (=> b!211509 m!239251))

(declare-fun m!239267 () Bool)

(assert (=> b!211509 m!239267))

(assert (=> b!211509 m!239259))

(assert (=> b!211509 m!239077))

(declare-fun m!239269 () Bool)

(assert (=> b!211509 m!239269))

(declare-fun m!239271 () Bool)

(assert (=> b!211509 m!239271))

(declare-fun m!239273 () Bool)

(assert (=> b!211509 m!239273))

(assert (=> b!211509 m!239119))

(assert (=> b!211511 m!239159))

(assert (=> b!211511 m!239165))

(assert (=> b!211511 m!239169))

(assert (=> b!211511 m!239165))

(assert (=> b!211511 m!239119))

(assert (=> b!211511 m!239159))

(assert (=> b!211511 m!239119))

(declare-fun m!239275 () Bool)

(assert (=> b!211511 m!239275))

(declare-fun m!239277 () Bool)

(assert (=> b!211505 m!239277))

(declare-fun m!239279 () Bool)

(assert (=> b!211496 m!239279))

(assert (=> d!58059 m!239053))

(assert (=> b!211504 m!239119))

(assert (=> b!211504 m!239119))

(assert (=> b!211504 m!239125))

(assert (=> bm!20029 m!239077))

(assert (=> b!211495 m!239119))

(assert (=> b!211495 m!239119))

(assert (=> b!211495 m!239125))

(declare-fun m!239281 () Bool)

(assert (=> b!211491 m!239281))

(declare-fun m!239283 () Bool)

(assert (=> bm!20028 m!239283))

(assert (=> b!211493 m!239119))

(assert (=> b!211493 m!239119))

(declare-fun m!239285 () Bool)

(assert (=> b!211493 m!239285))

(declare-fun m!239287 () Bool)

(assert (=> bm!20031 m!239287))

(declare-fun m!239289 () Bool)

(assert (=> bm!20027 m!239289))

(assert (=> b!211322 d!58059))

(declare-fun b!211512 () Bool)

(declare-fun e!137676 () ListLongMap!3087)

(declare-fun e!137675 () ListLongMap!3087)

(assert (=> b!211512 (= e!137676 e!137675)))

(declare-fun c!35724 () Bool)

(assert (=> b!211512 (= c!35724 (validKeyInArray!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211513 () Bool)

(declare-fun res!103296 () Bool)

(declare-fun e!137677 () Bool)

(assert (=> b!211513 (=> (not res!103296) (not e!137677))))

(declare-fun lt!108788 () ListLongMap!3087)

(assert (=> b!211513 (= res!103296 (not (contains!1405 lt!108788 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211514 () Bool)

(declare-fun call!20037 () ListLongMap!3087)

(assert (=> b!211514 (= e!137675 call!20037)))

(declare-fun d!58061 () Bool)

(assert (=> d!58061 e!137677))

(declare-fun res!103295 () Bool)

(assert (=> d!58061 (=> (not res!103295) (not e!137677))))

(assert (=> d!58061 (= res!103295 (not (contains!1405 lt!108788 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58061 (= lt!108788 e!137676)))

(declare-fun c!35726 () Bool)

(assert (=> d!58061 (= c!35726 (bvsge #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(assert (=> d!58061 (validMask!0 mask!1149)))

(assert (=> d!58061 (= (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108629 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108788)))

(declare-fun bm!20034 () Bool)

(assert (=> bm!20034 (= call!20037 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108629 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211515 () Bool)

(assert (=> b!211515 (= e!137676 (ListLongMap!3088 Nil!3063))))

(declare-fun b!211516 () Bool)

(declare-fun lt!108789 () Unit!6416)

(declare-fun lt!108791 () Unit!6416)

(assert (=> b!211516 (= lt!108789 lt!108791)))

(declare-fun lt!108787 () ListLongMap!3087)

(declare-fun lt!108792 () (_ BitVec 64))

(declare-fun lt!108790 () V!6891)

(declare-fun lt!108793 () (_ BitVec 64))

(assert (=> b!211516 (not (contains!1405 (+!562 lt!108787 (tuple2!4175 lt!108793 lt!108790)) lt!108792))))

(assert (=> b!211516 (= lt!108791 (addStillNotContains!103 lt!108787 lt!108793 lt!108790 lt!108792))))

(assert (=> b!211516 (= lt!108792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211516 (= lt!108790 (get!2560 (select (arr!4780 lt!108629) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211516 (= lt!108793 (select (arr!4779 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211516 (= lt!108787 call!20037)))

(assert (=> b!211516 (= e!137675 (+!562 call!20037 (tuple2!4175 (select (arr!4779 _keys!825) #b00000000000000000000000000000000) (get!2560 (select (arr!4780 lt!108629) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211517 () Bool)

(declare-fun e!137674 () Bool)

(declare-fun e!137673 () Bool)

(assert (=> b!211517 (= e!137674 e!137673)))

(declare-fun c!35725 () Bool)

(assert (=> b!211517 (= c!35725 (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun b!211518 () Bool)

(declare-fun e!137678 () Bool)

(assert (=> b!211518 (= e!137678 (validKeyInArray!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211518 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!211519 () Bool)

(assert (=> b!211519 (= e!137673 (= lt!108788 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108629 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211520 () Bool)

(declare-fun e!137679 () Bool)

(assert (=> b!211520 (= e!137674 e!137679)))

(assert (=> b!211520 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun res!103294 () Bool)

(assert (=> b!211520 (= res!103294 (contains!1405 lt!108788 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211520 (=> (not res!103294) (not e!137679))))

(declare-fun b!211521 () Bool)

(assert (=> b!211521 (= e!137673 (isEmpty!495 lt!108788))))

(declare-fun b!211522 () Bool)

(assert (=> b!211522 (= e!137677 e!137674)))

(declare-fun c!35723 () Bool)

(assert (=> b!211522 (= c!35723 e!137678)))

(declare-fun res!103293 () Bool)

(assert (=> b!211522 (=> (not res!103293) (not e!137678))))

(assert (=> b!211522 (= res!103293 (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(declare-fun b!211523 () Bool)

(assert (=> b!211523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(assert (=> b!211523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5105 lt!108629)))))

(assert (=> b!211523 (= e!137679 (= (apply!194 lt!108788 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)) (get!2560 (select (arr!4780 lt!108629) #b00000000000000000000000000000000) (dynLambda!537 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!58061 c!35726) b!211515))

(assert (= (and d!58061 (not c!35726)) b!211512))

(assert (= (and b!211512 c!35724) b!211516))

(assert (= (and b!211512 (not c!35724)) b!211514))

(assert (= (or b!211516 b!211514) bm!20034))

(assert (= (and d!58061 res!103295) b!211513))

(assert (= (and b!211513 res!103296) b!211522))

(assert (= (and b!211522 res!103293) b!211518))

(assert (= (and b!211522 c!35723) b!211520))

(assert (= (and b!211522 (not c!35723)) b!211517))

(assert (= (and b!211520 res!103294) b!211523))

(assert (= (and b!211517 c!35725) b!211519))

(assert (= (and b!211517 (not c!35725)) b!211521))

(declare-fun b_lambda!7667 () Bool)

(assert (=> (not b_lambda!7667) (not b!211516)))

(assert (=> b!211516 t!8011))

(declare-fun b_and!12389 () Bool)

(assert (= b_and!12387 (and (=> t!8011 result!4991) b_and!12389)))

(declare-fun b_lambda!7669 () Bool)

(assert (=> (not b_lambda!7669) (not b!211523)))

(assert (=> b!211523 t!8011))

(declare-fun b_and!12391 () Bool)

(assert (= b_and!12389 (and (=> t!8011 result!4991) b_and!12391)))

(declare-fun m!239291 () Bool)

(assert (=> b!211519 m!239291))

(declare-fun m!239293 () Bool)

(assert (=> b!211521 m!239293))

(declare-fun m!239295 () Bool)

(assert (=> b!211513 m!239295))

(assert (=> b!211518 m!239119))

(assert (=> b!211518 m!239119))

(assert (=> b!211518 m!239125))

(declare-fun m!239297 () Bool)

(assert (=> b!211516 m!239297))

(assert (=> b!211516 m!239207))

(declare-fun m!239299 () Bool)

(assert (=> b!211516 m!239299))

(declare-fun m!239301 () Bool)

(assert (=> b!211516 m!239301))

(assert (=> b!211516 m!239165))

(assert (=> b!211516 m!239299))

(declare-fun m!239303 () Bool)

(assert (=> b!211516 m!239303))

(assert (=> b!211516 m!239119))

(assert (=> b!211516 m!239207))

(assert (=> b!211516 m!239165))

(assert (=> b!211516 m!239209))

(assert (=> b!211512 m!239119))

(assert (=> b!211512 m!239119))

(assert (=> b!211512 m!239125))

(assert (=> b!211523 m!239207))

(assert (=> b!211523 m!239119))

(declare-fun m!239305 () Bool)

(assert (=> b!211523 m!239305))

(assert (=> b!211523 m!239165))

(assert (=> b!211523 m!239119))

(assert (=> b!211523 m!239207))

(assert (=> b!211523 m!239165))

(assert (=> b!211523 m!239209))

(declare-fun m!239307 () Bool)

(assert (=> d!58061 m!239307))

(assert (=> d!58061 m!239053))

(assert (=> bm!20034 m!239291))

(assert (=> b!211520 m!239119))

(assert (=> b!211520 m!239119))

(declare-fun m!239309 () Bool)

(assert (=> b!211520 m!239309))

(assert (=> b!211322 d!58061))

(declare-fun d!58063 () Bool)

(assert (=> d!58063 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211316 d!58063))

(declare-fun b!211532 () Bool)

(declare-fun e!137686 () Bool)

(declare-fun call!20040 () Bool)

(assert (=> b!211532 (= e!137686 call!20040)))

(declare-fun b!211533 () Bool)

(declare-fun e!137688 () Bool)

(assert (=> b!211533 (= e!137688 call!20040)))

(declare-fun bm!20037 () Bool)

(assert (=> bm!20037 (= call!20040 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!211535 () Bool)

(declare-fun e!137687 () Bool)

(assert (=> b!211535 (= e!137687 e!137688)))

(declare-fun c!35729 () Bool)

(assert (=> b!211535 (= c!35729 (validKeyInArray!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211534 () Bool)

(assert (=> b!211534 (= e!137688 e!137686)))

(declare-fun lt!108800 () (_ BitVec 64))

(assert (=> b!211534 (= lt!108800 (select (arr!4779 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108801 () Unit!6416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10067 (_ BitVec 64) (_ BitVec 32)) Unit!6416)

(assert (=> b!211534 (= lt!108801 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!108800 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!211534 (arrayContainsKey!0 _keys!825 lt!108800 #b00000000000000000000000000000000)))

(declare-fun lt!108802 () Unit!6416)

(assert (=> b!211534 (= lt!108802 lt!108801)))

(declare-fun res!103301 () Bool)

(declare-datatypes ((SeekEntryResult!709 0))(
  ( (MissingZero!709 (index!5006 (_ BitVec 32))) (Found!709 (index!5007 (_ BitVec 32))) (Intermediate!709 (undefined!1521 Bool) (index!5008 (_ BitVec 32)) (x!22098 (_ BitVec 32))) (Undefined!709) (MissingVacant!709 (index!5009 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10067 (_ BitVec 32)) SeekEntryResult!709)

(assert (=> b!211534 (= res!103301 (= (seekEntryOrOpen!0 (select (arr!4779 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!709 #b00000000000000000000000000000000)))))

(assert (=> b!211534 (=> (not res!103301) (not e!137686))))

(declare-fun d!58065 () Bool)

(declare-fun res!103302 () Bool)

(assert (=> d!58065 (=> res!103302 e!137687)))

(assert (=> d!58065 (= res!103302 (bvsge #b00000000000000000000000000000000 (size!5104 _keys!825)))))

(assert (=> d!58065 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137687)))

(assert (= (and d!58065 (not res!103302)) b!211535))

(assert (= (and b!211535 c!35729) b!211534))

(assert (= (and b!211535 (not c!35729)) b!211533))

(assert (= (and b!211534 res!103301) b!211532))

(assert (= (or b!211532 b!211533) bm!20037))

(declare-fun m!239311 () Bool)

(assert (=> bm!20037 m!239311))

(assert (=> b!211535 m!239119))

(assert (=> b!211535 m!239119))

(assert (=> b!211535 m!239125))

(assert (=> b!211534 m!239119))

(declare-fun m!239313 () Bool)

(assert (=> b!211534 m!239313))

(declare-fun m!239315 () Bool)

(assert (=> b!211534 m!239315))

(assert (=> b!211534 m!239119))

(declare-fun m!239317 () Bool)

(assert (=> b!211534 m!239317))

(assert (=> b!211318 d!58065))

(declare-fun b!211542 () Bool)

(declare-fun e!137693 () Bool)

(assert (=> b!211542 (= e!137693 tp_is_empty!5433)))

(declare-fun b!211543 () Bool)

(declare-fun e!137694 () Bool)

(assert (=> b!211543 (= e!137694 tp_is_empty!5433)))

(declare-fun mapIsEmpty!9239 () Bool)

(declare-fun mapRes!9239 () Bool)

(assert (=> mapIsEmpty!9239 mapRes!9239))

(declare-fun condMapEmpty!9239 () Bool)

(declare-fun mapDefault!9239 () ValueCell!2373)

(assert (=> mapNonEmpty!9233 (= condMapEmpty!9239 (= mapRest!9233 ((as const (Array (_ BitVec 32) ValueCell!2373)) mapDefault!9239)))))

(assert (=> mapNonEmpty!9233 (= tp!19769 (and e!137694 mapRes!9239))))

(declare-fun mapNonEmpty!9239 () Bool)

(declare-fun tp!19778 () Bool)

(assert (=> mapNonEmpty!9239 (= mapRes!9239 (and tp!19778 e!137693))))

(declare-fun mapRest!9239 () (Array (_ BitVec 32) ValueCell!2373))

(declare-fun mapValue!9239 () ValueCell!2373)

(declare-fun mapKey!9239 () (_ BitVec 32))

(assert (=> mapNonEmpty!9239 (= mapRest!9233 (store mapRest!9239 mapKey!9239 mapValue!9239))))

(assert (= (and mapNonEmpty!9233 condMapEmpty!9239) mapIsEmpty!9239))

(assert (= (and mapNonEmpty!9233 (not condMapEmpty!9239)) mapNonEmpty!9239))

(assert (= (and mapNonEmpty!9239 ((_ is ValueCellFull!2373) mapValue!9239)) b!211542))

(assert (= (and mapNonEmpty!9233 ((_ is ValueCellFull!2373) mapDefault!9239)) b!211543))

(declare-fun m!239319 () Bool)

(assert (=> mapNonEmpty!9239 m!239319))

(declare-fun b_lambda!7671 () Bool)

(assert (= b_lambda!7669 (or (and start!21020 b_free!5571) b_lambda!7671)))

(declare-fun b_lambda!7673 () Bool)

(assert (= b_lambda!7659 (or (and start!21020 b_free!5571) b_lambda!7673)))

(declare-fun b_lambda!7675 () Bool)

(assert (= b_lambda!7661 (or (and start!21020 b_free!5571) b_lambda!7675)))

(declare-fun b_lambda!7677 () Bool)

(assert (= b_lambda!7667 (or (and start!21020 b_free!5571) b_lambda!7677)))

(declare-fun b_lambda!7679 () Bool)

(assert (= b_lambda!7663 (or (and start!21020 b_free!5571) b_lambda!7679)))

(declare-fun b_lambda!7681 () Bool)

(assert (= b_lambda!7665 (or (and start!21020 b_free!5571) b_lambda!7681)))

(check-sat (not b!211459) (not b!211414) (not d!58059) (not d!58057) (not bm!20037) (not d!58053) (not b!211368) (not b!211375) (not b!211461) (not b!211369) (not bm!20014) (not b_next!5571) (not b!211534) (not bm!20026) (not b!211481) (not bm!19996) (not b!211512) (not bm!20025) (not b!211410) (not bm!20018) (not d!58051) (not b!211516) (not b_lambda!7677) (not b!211473) tp_is_empty!5433 (not b!211477) (not bm!20031) (not d!58049) (not bm!20016) (not b_lambda!7671) (not b!211412) (not b!211378) (not b!211488) (not b!211511) (not b!211409) (not b!211491) (not b_lambda!7675) (not b!211376) (not b!211518) (not b!211404) (not b!211480) (not b!211403) (not b_lambda!7681) (not b!211519) (not mapNonEmpty!9239) (not b!211493) (not b!211479) (not d!58055) (not bm!20034) (not d!58047) (not b!211367) (not b!211521) (not b!211535) (not b!211463) (not b!211472) (not b!211523) (not b!211504) (not bm!20027) (not b!211407) (not b!211464) (not bm!19999) (not b!211495) (not bm!20029) (not b_lambda!7679) (not b_lambda!7673) (not b!211411) (not b!211509) (not b!211496) (not d!58061) b_and!12391 (not b!211520) (not b!211377) (not bm!20015) (not b!211505) (not b!211513) (not bm!20028))
(check-sat b_and!12391 (not b_next!5571))
