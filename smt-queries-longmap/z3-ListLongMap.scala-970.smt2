; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21022 () Bool)

(assert start!21022)

(declare-fun b_free!5569 () Bool)

(declare-fun b_next!5569 () Bool)

(assert (=> start!21022 (= b_free!5569 (not b_next!5569))))

(declare-fun tp!19763 () Bool)

(declare-fun b_and!12349 () Bool)

(assert (=> start!21022 (= tp!19763 b_and!12349)))

(declare-fun b!211132 () Bool)

(declare-fun e!137436 () Bool)

(declare-fun tp_is_empty!5431 () Bool)

(assert (=> b!211132 (= e!137436 tp_is_empty!5431)))

(declare-fun res!103076 () Bool)

(declare-fun e!137435 () Bool)

(assert (=> start!21022 (=> (not res!103076) (not e!137435))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21022 (= res!103076 (validMask!0 mask!1149))))

(assert (=> start!21022 e!137435))

(declare-datatypes ((V!6889 0))(
  ( (V!6890 (val!2760 Int)) )
))
(declare-datatypes ((ValueCell!2372 0))(
  ( (ValueCellFull!2372 (v!4744 V!6889)) (EmptyCell!2372) )
))
(declare-datatypes ((array!10053 0))(
  ( (array!10054 (arr!4771 (Array (_ BitVec 32) ValueCell!2372)) (size!5097 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10053)

(declare-fun e!137437 () Bool)

(declare-fun array_inv!3133 (array!10053) Bool)

(assert (=> start!21022 (and (array_inv!3133 _values!649) e!137437)))

(assert (=> start!21022 true))

(assert (=> start!21022 tp_is_empty!5431))

(declare-datatypes ((array!10055 0))(
  ( (array!10056 (arr!4772 (Array (_ BitVec 32) (_ BitVec 64))) (size!5098 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10055)

(declare-fun array_inv!3134 (array!10055) Bool)

(assert (=> start!21022 (array_inv!3134 _keys!825)))

(assert (=> start!21022 tp!19763))

(declare-fun b!211133 () Bool)

(declare-fun res!103074 () Bool)

(assert (=> b!211133 (=> (not res!103074) (not e!137435))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211133 (= res!103074 (and (= (size!5097 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5098 _keys!825) (size!5097 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211134 () Bool)

(declare-fun res!103075 () Bool)

(assert (=> b!211134 (=> (not res!103075) (not e!137435))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211134 (= res!103075 (validKeyInArray!0 k0!843))))

(declare-datatypes ((tuple2!4150 0))(
  ( (tuple2!4151 (_1!2086 (_ BitVec 64)) (_2!2086 V!6889)) )
))
(declare-datatypes ((List!3057 0))(
  ( (Nil!3054) (Cons!3053 (h!3695 tuple2!4150) (t!7989 List!3057)) )
))
(declare-datatypes ((ListLongMap!3053 0))(
  ( (ListLongMap!3054 (toList!1542 List!3057)) )
))
(declare-fun lt!108425 () ListLongMap!3053)

(declare-fun e!137438 () Bool)

(declare-fun lt!108424 () tuple2!4150)

(declare-fun lt!108418 () ListLongMap!3053)

(declare-fun b!211135 () Bool)

(declare-fun +!566 (ListLongMap!3053 tuple2!4150) ListLongMap!3053)

(assert (=> b!211135 (= e!137438 (= lt!108425 (+!566 lt!108418 lt!108424)))))

(declare-fun lt!108423 () ListLongMap!3053)

(declare-fun lt!108420 () ListLongMap!3053)

(assert (=> b!211135 (= lt!108423 (+!566 lt!108420 lt!108424))))

(declare-fun zeroValue!615 () V!6889)

(assert (=> b!211135 (= lt!108424 (tuple2!4151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!211136 () Bool)

(declare-fun e!137439 () Bool)

(assert (=> b!211136 (= e!137439 tp_is_empty!5431)))

(declare-fun mapIsEmpty!9230 () Bool)

(declare-fun mapRes!9230 () Bool)

(assert (=> mapIsEmpty!9230 mapRes!9230))

(declare-fun b!211137 () Bool)

(assert (=> b!211137 (= e!137435 (not e!137438))))

(declare-fun res!103073 () Bool)

(assert (=> b!211137 (=> res!103073 e!137438)))

(assert (=> b!211137 (= res!103073 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6889)

(declare-fun getCurrentListMap!1054 (array!10055 array!10053 (_ BitVec 32) (_ BitVec 32) V!6889 V!6889 (_ BitVec 32) Int) ListLongMap!3053)

(assert (=> b!211137 (= lt!108425 (getCurrentListMap!1054 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108419 () array!10053)

(assert (=> b!211137 (= lt!108423 (getCurrentListMap!1054 _keys!825 lt!108419 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108421 () ListLongMap!3053)

(assert (=> b!211137 (and (= lt!108420 lt!108421) (= lt!108421 lt!108420))))

(declare-fun v!520 () V!6889)

(assert (=> b!211137 (= lt!108421 (+!566 lt!108418 (tuple2!4151 k0!843 v!520)))))

(declare-datatypes ((Unit!6378 0))(
  ( (Unit!6379) )
))
(declare-fun lt!108422 () Unit!6378)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!215 (array!10055 array!10053 (_ BitVec 32) (_ BitVec 32) V!6889 V!6889 (_ BitVec 32) (_ BitVec 64) V!6889 (_ BitVec 32) Int) Unit!6378)

(assert (=> b!211137 (= lt!108422 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!215 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!491 (array!10055 array!10053 (_ BitVec 32) (_ BitVec 32) V!6889 V!6889 (_ BitVec 32) Int) ListLongMap!3053)

(assert (=> b!211137 (= lt!108420 (getCurrentListMapNoExtraKeys!491 _keys!825 lt!108419 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211137 (= lt!108419 (array!10054 (store (arr!4771 _values!649) i!601 (ValueCellFull!2372 v!520)) (size!5097 _values!649)))))

(assert (=> b!211137 (= lt!108418 (getCurrentListMapNoExtraKeys!491 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211138 () Bool)

(declare-fun res!103072 () Bool)

(assert (=> b!211138 (=> (not res!103072) (not e!137435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10055 (_ BitVec 32)) Bool)

(assert (=> b!211138 (= res!103072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211139 () Bool)

(declare-fun res!103077 () Bool)

(assert (=> b!211139 (=> (not res!103077) (not e!137435))))

(declare-datatypes ((List!3058 0))(
  ( (Nil!3055) (Cons!3054 (h!3696 (_ BitVec 64)) (t!7990 List!3058)) )
))
(declare-fun arrayNoDuplicates!0 (array!10055 (_ BitVec 32) List!3058) Bool)

(assert (=> b!211139 (= res!103077 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3055))))

(declare-fun b!211140 () Bool)

(declare-fun res!103078 () Bool)

(assert (=> b!211140 (=> (not res!103078) (not e!137435))))

(assert (=> b!211140 (= res!103078 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5098 _keys!825))))))

(declare-fun mapNonEmpty!9230 () Bool)

(declare-fun tp!19762 () Bool)

(assert (=> mapNonEmpty!9230 (= mapRes!9230 (and tp!19762 e!137439))))

(declare-fun mapValue!9230 () ValueCell!2372)

(declare-fun mapRest!9230 () (Array (_ BitVec 32) ValueCell!2372))

(declare-fun mapKey!9230 () (_ BitVec 32))

(assert (=> mapNonEmpty!9230 (= (arr!4771 _values!649) (store mapRest!9230 mapKey!9230 mapValue!9230))))

(declare-fun b!211141 () Bool)

(declare-fun res!103079 () Bool)

(assert (=> b!211141 (=> (not res!103079) (not e!137435))))

(assert (=> b!211141 (= res!103079 (= (select (arr!4772 _keys!825) i!601) k0!843))))

(declare-fun b!211142 () Bool)

(assert (=> b!211142 (= e!137437 (and e!137436 mapRes!9230))))

(declare-fun condMapEmpty!9230 () Bool)

(declare-fun mapDefault!9230 () ValueCell!2372)

(assert (=> b!211142 (= condMapEmpty!9230 (= (arr!4771 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2372)) mapDefault!9230)))))

(assert (= (and start!21022 res!103076) b!211133))

(assert (= (and b!211133 res!103074) b!211138))

(assert (= (and b!211138 res!103072) b!211139))

(assert (= (and b!211139 res!103077) b!211140))

(assert (= (and b!211140 res!103078) b!211134))

(assert (= (and b!211134 res!103075) b!211141))

(assert (= (and b!211141 res!103079) b!211137))

(assert (= (and b!211137 (not res!103073)) b!211135))

(assert (= (and b!211142 condMapEmpty!9230) mapIsEmpty!9230))

(assert (= (and b!211142 (not condMapEmpty!9230)) mapNonEmpty!9230))

(get-info :version)

(assert (= (and mapNonEmpty!9230 ((_ is ValueCellFull!2372) mapValue!9230)) b!211136))

(assert (= (and b!211142 ((_ is ValueCellFull!2372) mapDefault!9230)) b!211132))

(assert (= start!21022 b!211142))

(declare-fun m!238401 () Bool)

(assert (=> b!211135 m!238401))

(declare-fun m!238403 () Bool)

(assert (=> b!211135 m!238403))

(declare-fun m!238405 () Bool)

(assert (=> b!211137 m!238405))

(declare-fun m!238407 () Bool)

(assert (=> b!211137 m!238407))

(declare-fun m!238409 () Bool)

(assert (=> b!211137 m!238409))

(declare-fun m!238411 () Bool)

(assert (=> b!211137 m!238411))

(declare-fun m!238413 () Bool)

(assert (=> b!211137 m!238413))

(declare-fun m!238415 () Bool)

(assert (=> b!211137 m!238415))

(declare-fun m!238417 () Bool)

(assert (=> b!211137 m!238417))

(declare-fun m!238419 () Bool)

(assert (=> b!211141 m!238419))

(declare-fun m!238421 () Bool)

(assert (=> b!211134 m!238421))

(declare-fun m!238423 () Bool)

(assert (=> start!21022 m!238423))

(declare-fun m!238425 () Bool)

(assert (=> start!21022 m!238425))

(declare-fun m!238427 () Bool)

(assert (=> start!21022 m!238427))

(declare-fun m!238429 () Bool)

(assert (=> mapNonEmpty!9230 m!238429))

(declare-fun m!238431 () Bool)

(assert (=> b!211138 m!238431))

(declare-fun m!238433 () Bool)

(assert (=> b!211139 m!238433))

(check-sat (not b!211134) (not start!21022) (not b!211138) (not b!211135) (not b!211137) (not mapNonEmpty!9230) (not b_next!5569) (not b!211139) tp_is_empty!5431 b_and!12349)
(check-sat b_and!12349 (not b_next!5569))
(get-model)

(declare-fun b!211217 () Bool)

(declare-fun e!137484 () Bool)

(declare-fun call!19975 () Bool)

(assert (=> b!211217 (= e!137484 call!19975)))

(declare-fun b!211218 () Bool)

(declare-fun e!137483 () Bool)

(declare-fun e!137482 () Bool)

(assert (=> b!211218 (= e!137483 e!137482)))

(declare-fun c!35657 () Bool)

(assert (=> b!211218 (= c!35657 (validKeyInArray!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19972 () Bool)

(assert (=> bm!19972 (= call!19975 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!211219 () Bool)

(assert (=> b!211219 (= e!137482 e!137484)))

(declare-fun lt!108481 () (_ BitVec 64))

(assert (=> b!211219 (= lt!108481 (select (arr!4772 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108480 () Unit!6378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10055 (_ BitVec 64) (_ BitVec 32)) Unit!6378)

(assert (=> b!211219 (= lt!108480 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!108481 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!211219 (arrayContainsKey!0 _keys!825 lt!108481 #b00000000000000000000000000000000)))

(declare-fun lt!108482 () Unit!6378)

(assert (=> b!211219 (= lt!108482 lt!108480)))

(declare-fun res!103132 () Bool)

(declare-datatypes ((SeekEntryResult!710 0))(
  ( (MissingZero!710 (index!5010 (_ BitVec 32))) (Found!710 (index!5011 (_ BitVec 32))) (Intermediate!710 (undefined!1522 Bool) (index!5012 (_ BitVec 32)) (x!22098 (_ BitVec 32))) (Undefined!710) (MissingVacant!710 (index!5013 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10055 (_ BitVec 32)) SeekEntryResult!710)

(assert (=> b!211219 (= res!103132 (= (seekEntryOrOpen!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!710 #b00000000000000000000000000000000)))))

(assert (=> b!211219 (=> (not res!103132) (not e!137484))))

(declare-fun d!57891 () Bool)

(declare-fun res!103133 () Bool)

(assert (=> d!57891 (=> res!103133 e!137483)))

(assert (=> d!57891 (= res!103133 (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!57891 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137483)))

(declare-fun b!211220 () Bool)

(assert (=> b!211220 (= e!137482 call!19975)))

(assert (= (and d!57891 (not res!103133)) b!211218))

(assert (= (and b!211218 c!35657) b!211219))

(assert (= (and b!211218 (not c!35657)) b!211220))

(assert (= (and b!211219 res!103132) b!211217))

(assert (= (or b!211217 b!211220) bm!19972))

(declare-fun m!238503 () Bool)

(assert (=> b!211218 m!238503))

(assert (=> b!211218 m!238503))

(declare-fun m!238505 () Bool)

(assert (=> b!211218 m!238505))

(declare-fun m!238507 () Bool)

(assert (=> bm!19972 m!238507))

(assert (=> b!211219 m!238503))

(declare-fun m!238509 () Bool)

(assert (=> b!211219 m!238509))

(declare-fun m!238511 () Bool)

(assert (=> b!211219 m!238511))

(assert (=> b!211219 m!238503))

(declare-fun m!238513 () Bool)

(assert (=> b!211219 m!238513))

(assert (=> b!211138 d!57891))

(declare-fun d!57893 () Bool)

(assert (=> d!57893 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211134 d!57893))

(declare-fun b!211245 () Bool)

(declare-fun e!137504 () ListLongMap!3053)

(assert (=> b!211245 (= e!137504 (ListLongMap!3054 Nil!3054))))

(declare-fun b!211246 () Bool)

(declare-fun e!137500 () ListLongMap!3053)

(assert (=> b!211246 (= e!137504 e!137500)))

(declare-fun c!35669 () Bool)

(assert (=> b!211246 (= c!35669 (validKeyInArray!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211247 () Bool)

(assert (=> b!211247 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> b!211247 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5097 lt!108419)))))

(declare-fun e!137501 () Bool)

(declare-fun lt!108503 () ListLongMap!3053)

(declare-fun apply!194 (ListLongMap!3053 (_ BitVec 64)) V!6889)

(declare-fun get!2554 (ValueCell!2372 V!6889) V!6889)

(declare-fun dynLambda!528 (Int (_ BitVec 64)) V!6889)

(assert (=> b!211247 (= e!137501 (= (apply!194 lt!108503 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)) (get!2554 (select (arr!4771 lt!108419) #b00000000000000000000000000000000) (dynLambda!528 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211248 () Bool)

(declare-fun e!137505 () Bool)

(assert (=> b!211248 (= e!137505 (validKeyInArray!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211248 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun call!19978 () ListLongMap!3053)

(declare-fun bm!19975 () Bool)

(assert (=> bm!19975 (= call!19978 (getCurrentListMapNoExtraKeys!491 _keys!825 lt!108419 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun d!57895 () Bool)

(declare-fun e!137499 () Bool)

(assert (=> d!57895 e!137499))

(declare-fun res!103145 () Bool)

(assert (=> d!57895 (=> (not res!103145) (not e!137499))))

(declare-fun contains!1382 (ListLongMap!3053 (_ BitVec 64)) Bool)

(assert (=> d!57895 (= res!103145 (not (contains!1382 lt!108503 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57895 (= lt!108503 e!137504)))

(declare-fun c!35667 () Bool)

(assert (=> d!57895 (= c!35667 (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!57895 (validMask!0 mask!1149)))

(assert (=> d!57895 (= (getCurrentListMapNoExtraKeys!491 _keys!825 lt!108419 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108503)))

(declare-fun b!211249 () Bool)

(declare-fun e!137503 () Bool)

(assert (=> b!211249 (= e!137503 e!137501)))

(assert (=> b!211249 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun res!103142 () Bool)

(assert (=> b!211249 (= res!103142 (contains!1382 lt!108503 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211249 (=> (not res!103142) (not e!137501))))

(declare-fun b!211250 () Bool)

(declare-fun lt!108501 () Unit!6378)

(declare-fun lt!108499 () Unit!6378)

(assert (=> b!211250 (= lt!108501 lt!108499)))

(declare-fun lt!108500 () ListLongMap!3053)

(declare-fun lt!108498 () (_ BitVec 64))

(declare-fun lt!108502 () V!6889)

(declare-fun lt!108497 () (_ BitVec 64))

(assert (=> b!211250 (not (contains!1382 (+!566 lt!108500 (tuple2!4151 lt!108497 lt!108502)) lt!108498))))

(declare-fun addStillNotContains!104 (ListLongMap!3053 (_ BitVec 64) V!6889 (_ BitVec 64)) Unit!6378)

(assert (=> b!211250 (= lt!108499 (addStillNotContains!104 lt!108500 lt!108497 lt!108502 lt!108498))))

(assert (=> b!211250 (= lt!108498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211250 (= lt!108502 (get!2554 (select (arr!4771 lt!108419) #b00000000000000000000000000000000) (dynLambda!528 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211250 (= lt!108497 (select (arr!4772 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211250 (= lt!108500 call!19978)))

(assert (=> b!211250 (= e!137500 (+!566 call!19978 (tuple2!4151 (select (arr!4772 _keys!825) #b00000000000000000000000000000000) (get!2554 (select (arr!4771 lt!108419) #b00000000000000000000000000000000) (dynLambda!528 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211251 () Bool)

(assert (=> b!211251 (= e!137499 e!137503)))

(declare-fun c!35668 () Bool)

(assert (=> b!211251 (= c!35668 e!137505)))

(declare-fun res!103143 () Bool)

(assert (=> b!211251 (=> (not res!103143) (not e!137505))))

(assert (=> b!211251 (= res!103143 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211252 () Bool)

(declare-fun e!137502 () Bool)

(assert (=> b!211252 (= e!137503 e!137502)))

(declare-fun c!35666 () Bool)

(assert (=> b!211252 (= c!35666 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211253 () Bool)

(declare-fun isEmpty!499 (ListLongMap!3053) Bool)

(assert (=> b!211253 (= e!137502 (isEmpty!499 lt!108503))))

(declare-fun b!211254 () Bool)

(assert (=> b!211254 (= e!137502 (= lt!108503 (getCurrentListMapNoExtraKeys!491 _keys!825 lt!108419 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211255 () Bool)

(declare-fun res!103144 () Bool)

(assert (=> b!211255 (=> (not res!103144) (not e!137499))))

(assert (=> b!211255 (= res!103144 (not (contains!1382 lt!108503 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211256 () Bool)

(assert (=> b!211256 (= e!137500 call!19978)))

(assert (= (and d!57895 c!35667) b!211245))

(assert (= (and d!57895 (not c!35667)) b!211246))

(assert (= (and b!211246 c!35669) b!211250))

(assert (= (and b!211246 (not c!35669)) b!211256))

(assert (= (or b!211250 b!211256) bm!19975))

(assert (= (and d!57895 res!103145) b!211255))

(assert (= (and b!211255 res!103144) b!211251))

(assert (= (and b!211251 res!103143) b!211248))

(assert (= (and b!211251 c!35668) b!211249))

(assert (= (and b!211251 (not c!35668)) b!211252))

(assert (= (and b!211249 res!103142) b!211247))

(assert (= (and b!211252 c!35666) b!211254))

(assert (= (and b!211252 (not c!35666)) b!211253))

(declare-fun b_lambda!7641 () Bool)

(assert (=> (not b_lambda!7641) (not b!211247)))

(declare-fun t!7995 () Bool)

(declare-fun tb!2893 () Bool)

(assert (=> (and start!21022 (= defaultEntry!657 defaultEntry!657) t!7995) tb!2893))

(declare-fun result!4983 () Bool)

(assert (=> tb!2893 (= result!4983 tp_is_empty!5431)))

(assert (=> b!211247 t!7995))

(declare-fun b_and!12355 () Bool)

(assert (= b_and!12349 (and (=> t!7995 result!4983) b_and!12355)))

(declare-fun b_lambda!7643 () Bool)

(assert (=> (not b_lambda!7643) (not b!211250)))

(assert (=> b!211250 t!7995))

(declare-fun b_and!12357 () Bool)

(assert (= b_and!12355 (and (=> t!7995 result!4983) b_and!12357)))

(assert (=> b!211249 m!238503))

(assert (=> b!211249 m!238503))

(declare-fun m!238515 () Bool)

(assert (=> b!211249 m!238515))

(assert (=> b!211246 m!238503))

(assert (=> b!211246 m!238503))

(assert (=> b!211246 m!238505))

(declare-fun m!238517 () Bool)

(assert (=> b!211255 m!238517))

(declare-fun m!238519 () Bool)

(assert (=> b!211247 m!238519))

(assert (=> b!211247 m!238503))

(declare-fun m!238521 () Bool)

(assert (=> b!211247 m!238521))

(assert (=> b!211247 m!238521))

(assert (=> b!211247 m!238519))

(declare-fun m!238523 () Bool)

(assert (=> b!211247 m!238523))

(assert (=> b!211247 m!238503))

(declare-fun m!238525 () Bool)

(assert (=> b!211247 m!238525))

(declare-fun m!238527 () Bool)

(assert (=> b!211250 m!238527))

(declare-fun m!238529 () Bool)

(assert (=> b!211250 m!238529))

(assert (=> b!211250 m!238519))

(assert (=> b!211250 m!238503))

(declare-fun m!238531 () Bool)

(assert (=> b!211250 m!238531))

(assert (=> b!211250 m!238521))

(assert (=> b!211250 m!238521))

(assert (=> b!211250 m!238519))

(assert (=> b!211250 m!238523))

(assert (=> b!211250 m!238529))

(declare-fun m!238533 () Bool)

(assert (=> b!211250 m!238533))

(assert (=> b!211248 m!238503))

(assert (=> b!211248 m!238503))

(assert (=> b!211248 m!238505))

(declare-fun m!238535 () Bool)

(assert (=> b!211254 m!238535))

(declare-fun m!238537 () Bool)

(assert (=> d!57895 m!238537))

(assert (=> d!57895 m!238423))

(declare-fun m!238539 () Bool)

(assert (=> b!211253 m!238539))

(assert (=> bm!19975 m!238535))

(assert (=> b!211137 d!57895))

(declare-fun d!57897 () Bool)

(declare-fun e!137508 () Bool)

(assert (=> d!57897 e!137508))

(declare-fun res!103151 () Bool)

(assert (=> d!57897 (=> (not res!103151) (not e!137508))))

(declare-fun lt!108515 () ListLongMap!3053)

(assert (=> d!57897 (= res!103151 (contains!1382 lt!108515 (_1!2086 (tuple2!4151 k0!843 v!520))))))

(declare-fun lt!108513 () List!3057)

(assert (=> d!57897 (= lt!108515 (ListLongMap!3054 lt!108513))))

(declare-fun lt!108514 () Unit!6378)

(declare-fun lt!108512 () Unit!6378)

(assert (=> d!57897 (= lt!108514 lt!108512)))

(declare-datatypes ((Option!256 0))(
  ( (Some!255 (v!4750 V!6889)) (None!254) )
))
(declare-fun getValueByKey!250 (List!3057 (_ BitVec 64)) Option!256)

(assert (=> d!57897 (= (getValueByKey!250 lt!108513 (_1!2086 (tuple2!4151 k0!843 v!520))) (Some!255 (_2!2086 (tuple2!4151 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!140 (List!3057 (_ BitVec 64) V!6889) Unit!6378)

(assert (=> d!57897 (= lt!108512 (lemmaContainsTupThenGetReturnValue!140 lt!108513 (_1!2086 (tuple2!4151 k0!843 v!520)) (_2!2086 (tuple2!4151 k0!843 v!520))))))

(declare-fun insertStrictlySorted!143 (List!3057 (_ BitVec 64) V!6889) List!3057)

(assert (=> d!57897 (= lt!108513 (insertStrictlySorted!143 (toList!1542 lt!108418) (_1!2086 (tuple2!4151 k0!843 v!520)) (_2!2086 (tuple2!4151 k0!843 v!520))))))

(assert (=> d!57897 (= (+!566 lt!108418 (tuple2!4151 k0!843 v!520)) lt!108515)))

(declare-fun b!211263 () Bool)

(declare-fun res!103150 () Bool)

(assert (=> b!211263 (=> (not res!103150) (not e!137508))))

(assert (=> b!211263 (= res!103150 (= (getValueByKey!250 (toList!1542 lt!108515) (_1!2086 (tuple2!4151 k0!843 v!520))) (Some!255 (_2!2086 (tuple2!4151 k0!843 v!520)))))))

(declare-fun b!211264 () Bool)

(declare-fun contains!1383 (List!3057 tuple2!4150) Bool)

(assert (=> b!211264 (= e!137508 (contains!1383 (toList!1542 lt!108515) (tuple2!4151 k0!843 v!520)))))

(assert (= (and d!57897 res!103151) b!211263))

(assert (= (and b!211263 res!103150) b!211264))

(declare-fun m!238541 () Bool)

(assert (=> d!57897 m!238541))

(declare-fun m!238543 () Bool)

(assert (=> d!57897 m!238543))

(declare-fun m!238545 () Bool)

(assert (=> d!57897 m!238545))

(declare-fun m!238547 () Bool)

(assert (=> d!57897 m!238547))

(declare-fun m!238549 () Bool)

(assert (=> b!211263 m!238549))

(declare-fun m!238551 () Bool)

(assert (=> b!211264 m!238551))

(assert (=> b!211137 d!57897))

(declare-fun b!211265 () Bool)

(declare-fun e!137514 () ListLongMap!3053)

(assert (=> b!211265 (= e!137514 (ListLongMap!3054 Nil!3054))))

(declare-fun b!211266 () Bool)

(declare-fun e!137510 () ListLongMap!3053)

(assert (=> b!211266 (= e!137514 e!137510)))

(declare-fun c!35673 () Bool)

(assert (=> b!211266 (= c!35673 (validKeyInArray!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211267 () Bool)

(assert (=> b!211267 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> b!211267 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5097 _values!649)))))

(declare-fun e!137511 () Bool)

(declare-fun lt!108522 () ListLongMap!3053)

(assert (=> b!211267 (= e!137511 (= (apply!194 lt!108522 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)) (get!2554 (select (arr!4771 _values!649) #b00000000000000000000000000000000) (dynLambda!528 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211268 () Bool)

(declare-fun e!137515 () Bool)

(assert (=> b!211268 (= e!137515 (validKeyInArray!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211268 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun call!19979 () ListLongMap!3053)

(declare-fun bm!19976 () Bool)

(assert (=> bm!19976 (= call!19979 (getCurrentListMapNoExtraKeys!491 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun d!57899 () Bool)

(declare-fun e!137509 () Bool)

(assert (=> d!57899 e!137509))

(declare-fun res!103155 () Bool)

(assert (=> d!57899 (=> (not res!103155) (not e!137509))))

(assert (=> d!57899 (= res!103155 (not (contains!1382 lt!108522 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57899 (= lt!108522 e!137514)))

(declare-fun c!35671 () Bool)

(assert (=> d!57899 (= c!35671 (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!57899 (validMask!0 mask!1149)))

(assert (=> d!57899 (= (getCurrentListMapNoExtraKeys!491 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108522)))

(declare-fun b!211269 () Bool)

(declare-fun e!137513 () Bool)

(assert (=> b!211269 (= e!137513 e!137511)))

(assert (=> b!211269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun res!103152 () Bool)

(assert (=> b!211269 (= res!103152 (contains!1382 lt!108522 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211269 (=> (not res!103152) (not e!137511))))

(declare-fun b!211270 () Bool)

(declare-fun lt!108520 () Unit!6378)

(declare-fun lt!108518 () Unit!6378)

(assert (=> b!211270 (= lt!108520 lt!108518)))

(declare-fun lt!108516 () (_ BitVec 64))

(declare-fun lt!108521 () V!6889)

(declare-fun lt!108519 () ListLongMap!3053)

(declare-fun lt!108517 () (_ BitVec 64))

(assert (=> b!211270 (not (contains!1382 (+!566 lt!108519 (tuple2!4151 lt!108516 lt!108521)) lt!108517))))

(assert (=> b!211270 (= lt!108518 (addStillNotContains!104 lt!108519 lt!108516 lt!108521 lt!108517))))

(assert (=> b!211270 (= lt!108517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211270 (= lt!108521 (get!2554 (select (arr!4771 _values!649) #b00000000000000000000000000000000) (dynLambda!528 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211270 (= lt!108516 (select (arr!4772 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211270 (= lt!108519 call!19979)))

(assert (=> b!211270 (= e!137510 (+!566 call!19979 (tuple2!4151 (select (arr!4772 _keys!825) #b00000000000000000000000000000000) (get!2554 (select (arr!4771 _values!649) #b00000000000000000000000000000000) (dynLambda!528 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211271 () Bool)

(assert (=> b!211271 (= e!137509 e!137513)))

(declare-fun c!35672 () Bool)

(assert (=> b!211271 (= c!35672 e!137515)))

(declare-fun res!103153 () Bool)

(assert (=> b!211271 (=> (not res!103153) (not e!137515))))

(assert (=> b!211271 (= res!103153 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211272 () Bool)

(declare-fun e!137512 () Bool)

(assert (=> b!211272 (= e!137513 e!137512)))

(declare-fun c!35670 () Bool)

(assert (=> b!211272 (= c!35670 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211273 () Bool)

(assert (=> b!211273 (= e!137512 (isEmpty!499 lt!108522))))

(declare-fun b!211274 () Bool)

(assert (=> b!211274 (= e!137512 (= lt!108522 (getCurrentListMapNoExtraKeys!491 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211275 () Bool)

(declare-fun res!103154 () Bool)

(assert (=> b!211275 (=> (not res!103154) (not e!137509))))

(assert (=> b!211275 (= res!103154 (not (contains!1382 lt!108522 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211276 () Bool)

(assert (=> b!211276 (= e!137510 call!19979)))

(assert (= (and d!57899 c!35671) b!211265))

(assert (= (and d!57899 (not c!35671)) b!211266))

(assert (= (and b!211266 c!35673) b!211270))

(assert (= (and b!211266 (not c!35673)) b!211276))

(assert (= (or b!211270 b!211276) bm!19976))

(assert (= (and d!57899 res!103155) b!211275))

(assert (= (and b!211275 res!103154) b!211271))

(assert (= (and b!211271 res!103153) b!211268))

(assert (= (and b!211271 c!35672) b!211269))

(assert (= (and b!211271 (not c!35672)) b!211272))

(assert (= (and b!211269 res!103152) b!211267))

(assert (= (and b!211272 c!35670) b!211274))

(assert (= (and b!211272 (not c!35670)) b!211273))

(declare-fun b_lambda!7645 () Bool)

(assert (=> (not b_lambda!7645) (not b!211267)))

(assert (=> b!211267 t!7995))

(declare-fun b_and!12359 () Bool)

(assert (= b_and!12357 (and (=> t!7995 result!4983) b_and!12359)))

(declare-fun b_lambda!7647 () Bool)

(assert (=> (not b_lambda!7647) (not b!211270)))

(assert (=> b!211270 t!7995))

(declare-fun b_and!12361 () Bool)

(assert (= b_and!12359 (and (=> t!7995 result!4983) b_and!12361)))

(assert (=> b!211269 m!238503))

(assert (=> b!211269 m!238503))

(declare-fun m!238553 () Bool)

(assert (=> b!211269 m!238553))

(assert (=> b!211266 m!238503))

(assert (=> b!211266 m!238503))

(assert (=> b!211266 m!238505))

(declare-fun m!238555 () Bool)

(assert (=> b!211275 m!238555))

(assert (=> b!211267 m!238519))

(assert (=> b!211267 m!238503))

(declare-fun m!238557 () Bool)

(assert (=> b!211267 m!238557))

(assert (=> b!211267 m!238557))

(assert (=> b!211267 m!238519))

(declare-fun m!238559 () Bool)

(assert (=> b!211267 m!238559))

(assert (=> b!211267 m!238503))

(declare-fun m!238561 () Bool)

(assert (=> b!211267 m!238561))

(declare-fun m!238563 () Bool)

(assert (=> b!211270 m!238563))

(declare-fun m!238565 () Bool)

(assert (=> b!211270 m!238565))

(assert (=> b!211270 m!238519))

(assert (=> b!211270 m!238503))

(declare-fun m!238567 () Bool)

(assert (=> b!211270 m!238567))

(assert (=> b!211270 m!238557))

(assert (=> b!211270 m!238557))

(assert (=> b!211270 m!238519))

(assert (=> b!211270 m!238559))

(assert (=> b!211270 m!238565))

(declare-fun m!238569 () Bool)

(assert (=> b!211270 m!238569))

(assert (=> b!211268 m!238503))

(assert (=> b!211268 m!238503))

(assert (=> b!211268 m!238505))

(declare-fun m!238571 () Bool)

(assert (=> b!211274 m!238571))

(declare-fun m!238573 () Bool)

(assert (=> d!57899 m!238573))

(assert (=> d!57899 m!238423))

(declare-fun m!238575 () Bool)

(assert (=> b!211273 m!238575))

(assert (=> bm!19976 m!238571))

(assert (=> b!211137 d!57899))

(declare-fun bm!19991 () Bool)

(declare-fun call!19998 () Bool)

(declare-fun lt!108588 () ListLongMap!3053)

(assert (=> bm!19991 (= call!19998 (contains!1382 lt!108588 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211319 () Bool)

(declare-fun e!137548 () Bool)

(assert (=> b!211319 (= e!137548 (validKeyInArray!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211320 () Bool)

(declare-fun e!137552 () Bool)

(declare-fun e!137546 () Bool)

(assert (=> b!211320 (= e!137552 e!137546)))

(declare-fun res!103181 () Bool)

(declare-fun call!19999 () Bool)

(assert (=> b!211320 (= res!103181 call!19999)))

(assert (=> b!211320 (=> (not res!103181) (not e!137546))))

(declare-fun b!211321 () Bool)

(declare-fun e!137547 () ListLongMap!3053)

(declare-fun e!137542 () ListLongMap!3053)

(assert (=> b!211321 (= e!137547 e!137542)))

(declare-fun c!35688 () Bool)

(assert (=> b!211321 (= c!35688 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211322 () Bool)

(declare-fun res!103179 () Bool)

(declare-fun e!137551 () Bool)

(assert (=> b!211322 (=> (not res!103179) (not e!137551))))

(assert (=> b!211322 (= res!103179 e!137552)))

(declare-fun c!35690 () Bool)

(assert (=> b!211322 (= c!35690 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137549 () Bool)

(declare-fun b!211323 () Bool)

(assert (=> b!211323 (= e!137549 (= (apply!194 lt!108588 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)) (get!2554 (select (arr!4771 lt!108419) #b00000000000000000000000000000000) (dynLambda!528 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5097 lt!108419)))))

(assert (=> b!211323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211324 () Bool)

(declare-fun call!19997 () ListLongMap!3053)

(assert (=> b!211324 (= e!137542 call!19997)))

(declare-fun d!57901 () Bool)

(assert (=> d!57901 e!137551))

(declare-fun res!103182 () Bool)

(assert (=> d!57901 (=> (not res!103182) (not e!137551))))

(assert (=> d!57901 (= res!103182 (or (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))))

(declare-fun lt!108582 () ListLongMap!3053)

(assert (=> d!57901 (= lt!108588 lt!108582)))

(declare-fun lt!108570 () Unit!6378)

(declare-fun e!137544 () Unit!6378)

(assert (=> d!57901 (= lt!108570 e!137544)))

(declare-fun c!35687 () Bool)

(declare-fun e!137553 () Bool)

(assert (=> d!57901 (= c!35687 e!137553)))

(declare-fun res!103175 () Bool)

(assert (=> d!57901 (=> (not res!103175) (not e!137553))))

(assert (=> d!57901 (= res!103175 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!57901 (= lt!108582 e!137547)))

(declare-fun c!35686 () Bool)

(assert (=> d!57901 (= c!35686 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57901 (validMask!0 mask!1149)))

(assert (=> d!57901 (= (getCurrentListMap!1054 _keys!825 lt!108419 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108588)))

(declare-fun bm!19992 () Bool)

(declare-fun call!19995 () ListLongMap!3053)

(assert (=> bm!19992 (= call!19997 call!19995)))

(declare-fun bm!19993 () Bool)

(declare-fun call!19994 () ListLongMap!3053)

(declare-fun call!20000 () ListLongMap!3053)

(assert (=> bm!19993 (= call!19994 call!20000)))

(declare-fun b!211325 () Bool)

(declare-fun e!137550 () Bool)

(assert (=> b!211325 (= e!137550 (= (apply!194 lt!108588 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!19994 () Bool)

(declare-fun call!19996 () ListLongMap!3053)

(assert (=> bm!19994 (= call!19995 (+!566 (ite c!35686 call!20000 (ite c!35688 call!19994 call!19996)) (ite (or c!35686 c!35688) (tuple2!4151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!19995 () Bool)

(assert (=> bm!19995 (= call!19999 (contains!1382 lt!108588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211326 () Bool)

(declare-fun res!103177 () Bool)

(assert (=> b!211326 (=> (not res!103177) (not e!137551))))

(declare-fun e!137554 () Bool)

(assert (=> b!211326 (= res!103177 e!137554)))

(declare-fun res!103174 () Bool)

(assert (=> b!211326 (=> res!103174 e!137554)))

(assert (=> b!211326 (= res!103174 (not e!137548))))

(declare-fun res!103176 () Bool)

(assert (=> b!211326 (=> (not res!103176) (not e!137548))))

(assert (=> b!211326 (= res!103176 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211327 () Bool)

(assert (=> b!211327 (= e!137553 (validKeyInArray!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211328 () Bool)

(declare-fun c!35691 () Bool)

(assert (=> b!211328 (= c!35691 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137545 () ListLongMap!3053)

(assert (=> b!211328 (= e!137542 e!137545)))

(declare-fun b!211329 () Bool)

(declare-fun lt!108575 () Unit!6378)

(assert (=> b!211329 (= e!137544 lt!108575)))

(declare-fun lt!108584 () ListLongMap!3053)

(assert (=> b!211329 (= lt!108584 (getCurrentListMapNoExtraKeys!491 _keys!825 lt!108419 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108573 () (_ BitVec 64))

(assert (=> b!211329 (= lt!108573 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108577 () (_ BitVec 64))

(assert (=> b!211329 (= lt!108577 (select (arr!4772 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108568 () Unit!6378)

(declare-fun addStillContains!170 (ListLongMap!3053 (_ BitVec 64) V!6889 (_ BitVec 64)) Unit!6378)

(assert (=> b!211329 (= lt!108568 (addStillContains!170 lt!108584 lt!108573 zeroValue!615 lt!108577))))

(assert (=> b!211329 (contains!1382 (+!566 lt!108584 (tuple2!4151 lt!108573 zeroValue!615)) lt!108577)))

(declare-fun lt!108587 () Unit!6378)

(assert (=> b!211329 (= lt!108587 lt!108568)))

(declare-fun lt!108571 () ListLongMap!3053)

(assert (=> b!211329 (= lt!108571 (getCurrentListMapNoExtraKeys!491 _keys!825 lt!108419 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108586 () (_ BitVec 64))

(assert (=> b!211329 (= lt!108586 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108574 () (_ BitVec 64))

(assert (=> b!211329 (= lt!108574 (select (arr!4772 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108583 () Unit!6378)

(declare-fun addApplyDifferent!170 (ListLongMap!3053 (_ BitVec 64) V!6889 (_ BitVec 64)) Unit!6378)

(assert (=> b!211329 (= lt!108583 (addApplyDifferent!170 lt!108571 lt!108586 minValue!615 lt!108574))))

(assert (=> b!211329 (= (apply!194 (+!566 lt!108571 (tuple2!4151 lt!108586 minValue!615)) lt!108574) (apply!194 lt!108571 lt!108574))))

(declare-fun lt!108581 () Unit!6378)

(assert (=> b!211329 (= lt!108581 lt!108583)))

(declare-fun lt!108585 () ListLongMap!3053)

(assert (=> b!211329 (= lt!108585 (getCurrentListMapNoExtraKeys!491 _keys!825 lt!108419 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108580 () (_ BitVec 64))

(assert (=> b!211329 (= lt!108580 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108579 () (_ BitVec 64))

(assert (=> b!211329 (= lt!108579 (select (arr!4772 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108569 () Unit!6378)

(assert (=> b!211329 (= lt!108569 (addApplyDifferent!170 lt!108585 lt!108580 zeroValue!615 lt!108579))))

(assert (=> b!211329 (= (apply!194 (+!566 lt!108585 (tuple2!4151 lt!108580 zeroValue!615)) lt!108579) (apply!194 lt!108585 lt!108579))))

(declare-fun lt!108572 () Unit!6378)

(assert (=> b!211329 (= lt!108572 lt!108569)))

(declare-fun lt!108567 () ListLongMap!3053)

(assert (=> b!211329 (= lt!108567 (getCurrentListMapNoExtraKeys!491 _keys!825 lt!108419 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108578 () (_ BitVec 64))

(assert (=> b!211329 (= lt!108578 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108576 () (_ BitVec 64))

(assert (=> b!211329 (= lt!108576 (select (arr!4772 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211329 (= lt!108575 (addApplyDifferent!170 lt!108567 lt!108578 minValue!615 lt!108576))))

(assert (=> b!211329 (= (apply!194 (+!566 lt!108567 (tuple2!4151 lt!108578 minValue!615)) lt!108576) (apply!194 lt!108567 lt!108576))))

(declare-fun b!211330 () Bool)

(declare-fun e!137543 () Bool)

(assert (=> b!211330 (= e!137551 e!137543)))

(declare-fun c!35689 () Bool)

(assert (=> b!211330 (= c!35689 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211331 () Bool)

(assert (=> b!211331 (= e!137554 e!137549)))

(declare-fun res!103180 () Bool)

(assert (=> b!211331 (=> (not res!103180) (not e!137549))))

(assert (=> b!211331 (= res!103180 (contains!1382 lt!108588 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211331 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211332 () Bool)

(assert (=> b!211332 (= e!137543 e!137550)))

(declare-fun res!103178 () Bool)

(assert (=> b!211332 (= res!103178 call!19998)))

(assert (=> b!211332 (=> (not res!103178) (not e!137550))))

(declare-fun b!211333 () Bool)

(assert (=> b!211333 (= e!137547 (+!566 call!19995 (tuple2!4151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!19996 () Bool)

(assert (=> bm!19996 (= call!19996 call!19994)))

(declare-fun b!211334 () Bool)

(assert (=> b!211334 (= e!137545 call!19996)))

(declare-fun b!211335 () Bool)

(assert (=> b!211335 (= e!137543 (not call!19998))))

(declare-fun b!211336 () Bool)

(declare-fun Unit!6382 () Unit!6378)

(assert (=> b!211336 (= e!137544 Unit!6382)))

(declare-fun b!211337 () Bool)

(assert (=> b!211337 (= e!137552 (not call!19999))))

(declare-fun b!211338 () Bool)

(assert (=> b!211338 (= e!137545 call!19997)))

(declare-fun b!211339 () Bool)

(assert (=> b!211339 (= e!137546 (= (apply!194 lt!108588 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!19997 () Bool)

(assert (=> bm!19997 (= call!20000 (getCurrentListMapNoExtraKeys!491 _keys!825 lt!108419 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!57901 c!35686) b!211333))

(assert (= (and d!57901 (not c!35686)) b!211321))

(assert (= (and b!211321 c!35688) b!211324))

(assert (= (and b!211321 (not c!35688)) b!211328))

(assert (= (and b!211328 c!35691) b!211338))

(assert (= (and b!211328 (not c!35691)) b!211334))

(assert (= (or b!211338 b!211334) bm!19996))

(assert (= (or b!211324 bm!19996) bm!19993))

(assert (= (or b!211324 b!211338) bm!19992))

(assert (= (or b!211333 bm!19993) bm!19997))

(assert (= (or b!211333 bm!19992) bm!19994))

(assert (= (and d!57901 res!103175) b!211327))

(assert (= (and d!57901 c!35687) b!211329))

(assert (= (and d!57901 (not c!35687)) b!211336))

(assert (= (and d!57901 res!103182) b!211326))

(assert (= (and b!211326 res!103176) b!211319))

(assert (= (and b!211326 (not res!103174)) b!211331))

(assert (= (and b!211331 res!103180) b!211323))

(assert (= (and b!211326 res!103177) b!211322))

(assert (= (and b!211322 c!35690) b!211320))

(assert (= (and b!211322 (not c!35690)) b!211337))

(assert (= (and b!211320 res!103181) b!211339))

(assert (= (or b!211320 b!211337) bm!19995))

(assert (= (and b!211322 res!103179) b!211330))

(assert (= (and b!211330 c!35689) b!211332))

(assert (= (and b!211330 (not c!35689)) b!211335))

(assert (= (and b!211332 res!103178) b!211325))

(assert (= (or b!211332 b!211335) bm!19991))

(declare-fun b_lambda!7649 () Bool)

(assert (=> (not b_lambda!7649) (not b!211323)))

(assert (=> b!211323 t!7995))

(declare-fun b_and!12363 () Bool)

(assert (= b_and!12361 (and (=> t!7995 result!4983) b_and!12363)))

(assert (=> b!211327 m!238503))

(assert (=> b!211327 m!238503))

(assert (=> b!211327 m!238505))

(assert (=> bm!19997 m!238407))

(assert (=> b!211331 m!238503))

(assert (=> b!211331 m!238503))

(declare-fun m!238577 () Bool)

(assert (=> b!211331 m!238577))

(declare-fun m!238579 () Bool)

(assert (=> b!211325 m!238579))

(declare-fun m!238581 () Bool)

(assert (=> bm!19994 m!238581))

(declare-fun m!238583 () Bool)

(assert (=> b!211333 m!238583))

(declare-fun m!238585 () Bool)

(assert (=> bm!19995 m!238585))

(assert (=> d!57901 m!238423))

(assert (=> b!211319 m!238503))

(assert (=> b!211319 m!238503))

(assert (=> b!211319 m!238505))

(declare-fun m!238587 () Bool)

(assert (=> b!211339 m!238587))

(declare-fun m!238589 () Bool)

(assert (=> b!211329 m!238589))

(declare-fun m!238591 () Bool)

(assert (=> b!211329 m!238591))

(declare-fun m!238593 () Bool)

(assert (=> b!211329 m!238593))

(declare-fun m!238595 () Bool)

(assert (=> b!211329 m!238595))

(declare-fun m!238597 () Bool)

(assert (=> b!211329 m!238597))

(declare-fun m!238599 () Bool)

(assert (=> b!211329 m!238599))

(assert (=> b!211329 m!238597))

(declare-fun m!238601 () Bool)

(assert (=> b!211329 m!238601))

(assert (=> b!211329 m!238593))

(declare-fun m!238603 () Bool)

(assert (=> b!211329 m!238603))

(declare-fun m!238605 () Bool)

(assert (=> b!211329 m!238605))

(declare-fun m!238607 () Bool)

(assert (=> b!211329 m!238607))

(declare-fun m!238609 () Bool)

(assert (=> b!211329 m!238609))

(assert (=> b!211329 m!238503))

(declare-fun m!238611 () Bool)

(assert (=> b!211329 m!238611))

(declare-fun m!238613 () Bool)

(assert (=> b!211329 m!238613))

(declare-fun m!238615 () Bool)

(assert (=> b!211329 m!238615))

(assert (=> b!211329 m!238407))

(assert (=> b!211329 m!238607))

(assert (=> b!211329 m!238589))

(declare-fun m!238617 () Bool)

(assert (=> b!211329 m!238617))

(declare-fun m!238619 () Bool)

(assert (=> bm!19991 m!238619))

(assert (=> b!211323 m!238503))

(declare-fun m!238621 () Bool)

(assert (=> b!211323 m!238621))

(assert (=> b!211323 m!238503))

(assert (=> b!211323 m!238521))

(assert (=> b!211323 m!238519))

(assert (=> b!211323 m!238523))

(assert (=> b!211323 m!238519))

(assert (=> b!211323 m!238521))

(assert (=> b!211137 d!57901))

(declare-fun bm!20002 () Bool)

(declare-fun call!20006 () ListLongMap!3053)

(assert (=> bm!20002 (= call!20006 (getCurrentListMapNoExtraKeys!491 _keys!825 (array!10054 (store (arr!4771 _values!649) i!601 (ValueCellFull!2372 v!520)) (size!5097 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!57903 () Bool)

(declare-fun e!137559 () Bool)

(assert (=> d!57903 e!137559))

(declare-fun res!103185 () Bool)

(assert (=> d!57903 (=> (not res!103185) (not e!137559))))

(assert (=> d!57903 (= res!103185 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5097 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5097 _values!649))))))))

(declare-fun lt!108591 () Unit!6378)

(declare-fun choose!1085 (array!10055 array!10053 (_ BitVec 32) (_ BitVec 32) V!6889 V!6889 (_ BitVec 32) (_ BitVec 64) V!6889 (_ BitVec 32) Int) Unit!6378)

(assert (=> d!57903 (= lt!108591 (choose!1085 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57903 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!57903 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!215 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!108591)))

(declare-fun call!20005 () ListLongMap!3053)

(declare-fun bm!20003 () Bool)

(assert (=> bm!20003 (= call!20005 (getCurrentListMapNoExtraKeys!491 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211346 () Bool)

(declare-fun e!137560 () Bool)

(assert (=> b!211346 (= e!137560 (= call!20006 (+!566 call!20005 (tuple2!4151 k0!843 v!520))))))

(declare-fun b!211347 () Bool)

(assert (=> b!211347 (= e!137559 e!137560)))

(declare-fun c!35694 () Bool)

(assert (=> b!211347 (= c!35694 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!211348 () Bool)

(assert (=> b!211348 (= e!137560 (= call!20006 call!20005))))

(assert (= (and d!57903 res!103185) b!211347))

(assert (= (and b!211347 c!35694) b!211346))

(assert (= (and b!211347 (not c!35694)) b!211348))

(assert (= (or b!211346 b!211348) bm!20002))

(assert (= (or b!211346 b!211348) bm!20003))

(assert (=> bm!20002 m!238405))

(declare-fun m!238623 () Bool)

(assert (=> bm!20002 m!238623))

(declare-fun m!238625 () Bool)

(assert (=> d!57903 m!238625))

(assert (=> bm!20003 m!238417))

(declare-fun m!238627 () Bool)

(assert (=> b!211346 m!238627))

(assert (=> b!211137 d!57903))

(declare-fun bm!20004 () Bool)

(declare-fun call!20011 () Bool)

(declare-fun lt!108613 () ListLongMap!3053)

(assert (=> bm!20004 (= call!20011 (contains!1382 lt!108613 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211349 () Bool)

(declare-fun e!137567 () Bool)

(assert (=> b!211349 (= e!137567 (validKeyInArray!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211350 () Bool)

(declare-fun e!137571 () Bool)

(declare-fun e!137565 () Bool)

(assert (=> b!211350 (= e!137571 e!137565)))

(declare-fun res!103193 () Bool)

(declare-fun call!20012 () Bool)

(assert (=> b!211350 (= res!103193 call!20012)))

(assert (=> b!211350 (=> (not res!103193) (not e!137565))))

(declare-fun b!211351 () Bool)

(declare-fun e!137566 () ListLongMap!3053)

(declare-fun e!137561 () ListLongMap!3053)

(assert (=> b!211351 (= e!137566 e!137561)))

(declare-fun c!35697 () Bool)

(assert (=> b!211351 (= c!35697 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211352 () Bool)

(declare-fun res!103191 () Bool)

(declare-fun e!137570 () Bool)

(assert (=> b!211352 (=> (not res!103191) (not e!137570))))

(assert (=> b!211352 (= res!103191 e!137571)))

(declare-fun c!35699 () Bool)

(assert (=> b!211352 (= c!35699 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137568 () Bool)

(declare-fun b!211353 () Bool)

(assert (=> b!211353 (= e!137568 (= (apply!194 lt!108613 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)) (get!2554 (select (arr!4771 _values!649) #b00000000000000000000000000000000) (dynLambda!528 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5097 _values!649)))))

(assert (=> b!211353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211354 () Bool)

(declare-fun call!20010 () ListLongMap!3053)

(assert (=> b!211354 (= e!137561 call!20010)))

(declare-fun d!57905 () Bool)

(assert (=> d!57905 e!137570))

(declare-fun res!103194 () Bool)

(assert (=> d!57905 (=> (not res!103194) (not e!137570))))

(assert (=> d!57905 (= res!103194 (or (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))))

(declare-fun lt!108607 () ListLongMap!3053)

(assert (=> d!57905 (= lt!108613 lt!108607)))

(declare-fun lt!108595 () Unit!6378)

(declare-fun e!137563 () Unit!6378)

(assert (=> d!57905 (= lt!108595 e!137563)))

(declare-fun c!35696 () Bool)

(declare-fun e!137572 () Bool)

(assert (=> d!57905 (= c!35696 e!137572)))

(declare-fun res!103187 () Bool)

(assert (=> d!57905 (=> (not res!103187) (not e!137572))))

(assert (=> d!57905 (= res!103187 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!57905 (= lt!108607 e!137566)))

(declare-fun c!35695 () Bool)

(assert (=> d!57905 (= c!35695 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57905 (validMask!0 mask!1149)))

(assert (=> d!57905 (= (getCurrentListMap!1054 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108613)))

(declare-fun bm!20005 () Bool)

(declare-fun call!20008 () ListLongMap!3053)

(assert (=> bm!20005 (= call!20010 call!20008)))

(declare-fun bm!20006 () Bool)

(declare-fun call!20007 () ListLongMap!3053)

(declare-fun call!20013 () ListLongMap!3053)

(assert (=> bm!20006 (= call!20007 call!20013)))

(declare-fun b!211355 () Bool)

(declare-fun e!137569 () Bool)

(assert (=> b!211355 (= e!137569 (= (apply!194 lt!108613 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun call!20009 () ListLongMap!3053)

(declare-fun bm!20007 () Bool)

(assert (=> bm!20007 (= call!20008 (+!566 (ite c!35695 call!20013 (ite c!35697 call!20007 call!20009)) (ite (or c!35695 c!35697) (tuple2!4151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20008 () Bool)

(assert (=> bm!20008 (= call!20012 (contains!1382 lt!108613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211356 () Bool)

(declare-fun res!103189 () Bool)

(assert (=> b!211356 (=> (not res!103189) (not e!137570))))

(declare-fun e!137573 () Bool)

(assert (=> b!211356 (= res!103189 e!137573)))

(declare-fun res!103186 () Bool)

(assert (=> b!211356 (=> res!103186 e!137573)))

(assert (=> b!211356 (= res!103186 (not e!137567))))

(declare-fun res!103188 () Bool)

(assert (=> b!211356 (=> (not res!103188) (not e!137567))))

(assert (=> b!211356 (= res!103188 (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211357 () Bool)

(assert (=> b!211357 (= e!137572 (validKeyInArray!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211358 () Bool)

(declare-fun c!35700 () Bool)

(assert (=> b!211358 (= c!35700 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137564 () ListLongMap!3053)

(assert (=> b!211358 (= e!137561 e!137564)))

(declare-fun b!211359 () Bool)

(declare-fun lt!108600 () Unit!6378)

(assert (=> b!211359 (= e!137563 lt!108600)))

(declare-fun lt!108609 () ListLongMap!3053)

(assert (=> b!211359 (= lt!108609 (getCurrentListMapNoExtraKeys!491 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108598 () (_ BitVec 64))

(assert (=> b!211359 (= lt!108598 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108602 () (_ BitVec 64))

(assert (=> b!211359 (= lt!108602 (select (arr!4772 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108593 () Unit!6378)

(assert (=> b!211359 (= lt!108593 (addStillContains!170 lt!108609 lt!108598 zeroValue!615 lt!108602))))

(assert (=> b!211359 (contains!1382 (+!566 lt!108609 (tuple2!4151 lt!108598 zeroValue!615)) lt!108602)))

(declare-fun lt!108612 () Unit!6378)

(assert (=> b!211359 (= lt!108612 lt!108593)))

(declare-fun lt!108596 () ListLongMap!3053)

(assert (=> b!211359 (= lt!108596 (getCurrentListMapNoExtraKeys!491 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108611 () (_ BitVec 64))

(assert (=> b!211359 (= lt!108611 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108599 () (_ BitVec 64))

(assert (=> b!211359 (= lt!108599 (select (arr!4772 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108608 () Unit!6378)

(assert (=> b!211359 (= lt!108608 (addApplyDifferent!170 lt!108596 lt!108611 minValue!615 lt!108599))))

(assert (=> b!211359 (= (apply!194 (+!566 lt!108596 (tuple2!4151 lt!108611 minValue!615)) lt!108599) (apply!194 lt!108596 lt!108599))))

(declare-fun lt!108606 () Unit!6378)

(assert (=> b!211359 (= lt!108606 lt!108608)))

(declare-fun lt!108610 () ListLongMap!3053)

(assert (=> b!211359 (= lt!108610 (getCurrentListMapNoExtraKeys!491 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108605 () (_ BitVec 64))

(assert (=> b!211359 (= lt!108605 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108604 () (_ BitVec 64))

(assert (=> b!211359 (= lt!108604 (select (arr!4772 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108594 () Unit!6378)

(assert (=> b!211359 (= lt!108594 (addApplyDifferent!170 lt!108610 lt!108605 zeroValue!615 lt!108604))))

(assert (=> b!211359 (= (apply!194 (+!566 lt!108610 (tuple2!4151 lt!108605 zeroValue!615)) lt!108604) (apply!194 lt!108610 lt!108604))))

(declare-fun lt!108597 () Unit!6378)

(assert (=> b!211359 (= lt!108597 lt!108594)))

(declare-fun lt!108592 () ListLongMap!3053)

(assert (=> b!211359 (= lt!108592 (getCurrentListMapNoExtraKeys!491 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108603 () (_ BitVec 64))

(assert (=> b!211359 (= lt!108603 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108601 () (_ BitVec 64))

(assert (=> b!211359 (= lt!108601 (select (arr!4772 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211359 (= lt!108600 (addApplyDifferent!170 lt!108592 lt!108603 minValue!615 lt!108601))))

(assert (=> b!211359 (= (apply!194 (+!566 lt!108592 (tuple2!4151 lt!108603 minValue!615)) lt!108601) (apply!194 lt!108592 lt!108601))))

(declare-fun b!211360 () Bool)

(declare-fun e!137562 () Bool)

(assert (=> b!211360 (= e!137570 e!137562)))

(declare-fun c!35698 () Bool)

(assert (=> b!211360 (= c!35698 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211361 () Bool)

(assert (=> b!211361 (= e!137573 e!137568)))

(declare-fun res!103192 () Bool)

(assert (=> b!211361 (=> (not res!103192) (not e!137568))))

(assert (=> b!211361 (= res!103192 (contains!1382 lt!108613 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(declare-fun b!211362 () Bool)

(assert (=> b!211362 (= e!137562 e!137569)))

(declare-fun res!103190 () Bool)

(assert (=> b!211362 (= res!103190 call!20011)))

(assert (=> b!211362 (=> (not res!103190) (not e!137569))))

(declare-fun b!211363 () Bool)

(assert (=> b!211363 (= e!137566 (+!566 call!20008 (tuple2!4151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20009 () Bool)

(assert (=> bm!20009 (= call!20009 call!20007)))

(declare-fun b!211364 () Bool)

(assert (=> b!211364 (= e!137564 call!20009)))

(declare-fun b!211365 () Bool)

(assert (=> b!211365 (= e!137562 (not call!20011))))

(declare-fun b!211366 () Bool)

(declare-fun Unit!6383 () Unit!6378)

(assert (=> b!211366 (= e!137563 Unit!6383)))

(declare-fun b!211367 () Bool)

(assert (=> b!211367 (= e!137571 (not call!20012))))

(declare-fun b!211368 () Bool)

(assert (=> b!211368 (= e!137564 call!20010)))

(declare-fun b!211369 () Bool)

(assert (=> b!211369 (= e!137565 (= (apply!194 lt!108613 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20010 () Bool)

(assert (=> bm!20010 (= call!20013 (getCurrentListMapNoExtraKeys!491 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!57905 c!35695) b!211363))

(assert (= (and d!57905 (not c!35695)) b!211351))

(assert (= (and b!211351 c!35697) b!211354))

(assert (= (and b!211351 (not c!35697)) b!211358))

(assert (= (and b!211358 c!35700) b!211368))

(assert (= (and b!211358 (not c!35700)) b!211364))

(assert (= (or b!211368 b!211364) bm!20009))

(assert (= (or b!211354 bm!20009) bm!20006))

(assert (= (or b!211354 b!211368) bm!20005))

(assert (= (or b!211363 bm!20006) bm!20010))

(assert (= (or b!211363 bm!20005) bm!20007))

(assert (= (and d!57905 res!103187) b!211357))

(assert (= (and d!57905 c!35696) b!211359))

(assert (= (and d!57905 (not c!35696)) b!211366))

(assert (= (and d!57905 res!103194) b!211356))

(assert (= (and b!211356 res!103188) b!211349))

(assert (= (and b!211356 (not res!103186)) b!211361))

(assert (= (and b!211361 res!103192) b!211353))

(assert (= (and b!211356 res!103189) b!211352))

(assert (= (and b!211352 c!35699) b!211350))

(assert (= (and b!211352 (not c!35699)) b!211367))

(assert (= (and b!211350 res!103193) b!211369))

(assert (= (or b!211350 b!211367) bm!20008))

(assert (= (and b!211352 res!103191) b!211360))

(assert (= (and b!211360 c!35698) b!211362))

(assert (= (and b!211360 (not c!35698)) b!211365))

(assert (= (and b!211362 res!103190) b!211355))

(assert (= (or b!211362 b!211365) bm!20004))

(declare-fun b_lambda!7651 () Bool)

(assert (=> (not b_lambda!7651) (not b!211353)))

(assert (=> b!211353 t!7995))

(declare-fun b_and!12365 () Bool)

(assert (= b_and!12363 (and (=> t!7995 result!4983) b_and!12365)))

(assert (=> b!211357 m!238503))

(assert (=> b!211357 m!238503))

(assert (=> b!211357 m!238505))

(assert (=> bm!20010 m!238417))

(assert (=> b!211361 m!238503))

(assert (=> b!211361 m!238503))

(declare-fun m!238629 () Bool)

(assert (=> b!211361 m!238629))

(declare-fun m!238631 () Bool)

(assert (=> b!211355 m!238631))

(declare-fun m!238633 () Bool)

(assert (=> bm!20007 m!238633))

(declare-fun m!238635 () Bool)

(assert (=> b!211363 m!238635))

(declare-fun m!238637 () Bool)

(assert (=> bm!20008 m!238637))

(assert (=> d!57905 m!238423))

(assert (=> b!211349 m!238503))

(assert (=> b!211349 m!238503))

(assert (=> b!211349 m!238505))

(declare-fun m!238639 () Bool)

(assert (=> b!211369 m!238639))

(declare-fun m!238641 () Bool)

(assert (=> b!211359 m!238641))

(declare-fun m!238643 () Bool)

(assert (=> b!211359 m!238643))

(declare-fun m!238645 () Bool)

(assert (=> b!211359 m!238645))

(declare-fun m!238647 () Bool)

(assert (=> b!211359 m!238647))

(declare-fun m!238649 () Bool)

(assert (=> b!211359 m!238649))

(declare-fun m!238651 () Bool)

(assert (=> b!211359 m!238651))

(assert (=> b!211359 m!238649))

(declare-fun m!238653 () Bool)

(assert (=> b!211359 m!238653))

(assert (=> b!211359 m!238645))

(declare-fun m!238655 () Bool)

(assert (=> b!211359 m!238655))

(declare-fun m!238657 () Bool)

(assert (=> b!211359 m!238657))

(declare-fun m!238659 () Bool)

(assert (=> b!211359 m!238659))

(declare-fun m!238661 () Bool)

(assert (=> b!211359 m!238661))

(assert (=> b!211359 m!238503))

(declare-fun m!238663 () Bool)

(assert (=> b!211359 m!238663))

(declare-fun m!238665 () Bool)

(assert (=> b!211359 m!238665))

(declare-fun m!238667 () Bool)

(assert (=> b!211359 m!238667))

(assert (=> b!211359 m!238417))

(assert (=> b!211359 m!238659))

(assert (=> b!211359 m!238641))

(declare-fun m!238669 () Bool)

(assert (=> b!211359 m!238669))

(declare-fun m!238671 () Bool)

(assert (=> bm!20004 m!238671))

(assert (=> b!211353 m!238503))

(declare-fun m!238673 () Bool)

(assert (=> b!211353 m!238673))

(assert (=> b!211353 m!238503))

(assert (=> b!211353 m!238557))

(assert (=> b!211353 m!238519))

(assert (=> b!211353 m!238559))

(assert (=> b!211353 m!238519))

(assert (=> b!211353 m!238557))

(assert (=> b!211137 d!57905))

(declare-fun d!57907 () Bool)

(declare-fun e!137574 () Bool)

(assert (=> d!57907 e!137574))

(declare-fun res!103196 () Bool)

(assert (=> d!57907 (=> (not res!103196) (not e!137574))))

(declare-fun lt!108617 () ListLongMap!3053)

(assert (=> d!57907 (= res!103196 (contains!1382 lt!108617 (_1!2086 lt!108424)))))

(declare-fun lt!108615 () List!3057)

(assert (=> d!57907 (= lt!108617 (ListLongMap!3054 lt!108615))))

(declare-fun lt!108616 () Unit!6378)

(declare-fun lt!108614 () Unit!6378)

(assert (=> d!57907 (= lt!108616 lt!108614)))

(assert (=> d!57907 (= (getValueByKey!250 lt!108615 (_1!2086 lt!108424)) (Some!255 (_2!2086 lt!108424)))))

(assert (=> d!57907 (= lt!108614 (lemmaContainsTupThenGetReturnValue!140 lt!108615 (_1!2086 lt!108424) (_2!2086 lt!108424)))))

(assert (=> d!57907 (= lt!108615 (insertStrictlySorted!143 (toList!1542 lt!108418) (_1!2086 lt!108424) (_2!2086 lt!108424)))))

(assert (=> d!57907 (= (+!566 lt!108418 lt!108424) lt!108617)))

(declare-fun b!211370 () Bool)

(declare-fun res!103195 () Bool)

(assert (=> b!211370 (=> (not res!103195) (not e!137574))))

(assert (=> b!211370 (= res!103195 (= (getValueByKey!250 (toList!1542 lt!108617) (_1!2086 lt!108424)) (Some!255 (_2!2086 lt!108424))))))

(declare-fun b!211371 () Bool)

(assert (=> b!211371 (= e!137574 (contains!1383 (toList!1542 lt!108617) lt!108424))))

(assert (= (and d!57907 res!103196) b!211370))

(assert (= (and b!211370 res!103195) b!211371))

(declare-fun m!238675 () Bool)

(assert (=> d!57907 m!238675))

(declare-fun m!238677 () Bool)

(assert (=> d!57907 m!238677))

(declare-fun m!238679 () Bool)

(assert (=> d!57907 m!238679))

(declare-fun m!238681 () Bool)

(assert (=> d!57907 m!238681))

(declare-fun m!238683 () Bool)

(assert (=> b!211370 m!238683))

(declare-fun m!238685 () Bool)

(assert (=> b!211371 m!238685))

(assert (=> b!211135 d!57907))

(declare-fun d!57909 () Bool)

(declare-fun e!137575 () Bool)

(assert (=> d!57909 e!137575))

(declare-fun res!103198 () Bool)

(assert (=> d!57909 (=> (not res!103198) (not e!137575))))

(declare-fun lt!108621 () ListLongMap!3053)

(assert (=> d!57909 (= res!103198 (contains!1382 lt!108621 (_1!2086 lt!108424)))))

(declare-fun lt!108619 () List!3057)

(assert (=> d!57909 (= lt!108621 (ListLongMap!3054 lt!108619))))

(declare-fun lt!108620 () Unit!6378)

(declare-fun lt!108618 () Unit!6378)

(assert (=> d!57909 (= lt!108620 lt!108618)))

(assert (=> d!57909 (= (getValueByKey!250 lt!108619 (_1!2086 lt!108424)) (Some!255 (_2!2086 lt!108424)))))

(assert (=> d!57909 (= lt!108618 (lemmaContainsTupThenGetReturnValue!140 lt!108619 (_1!2086 lt!108424) (_2!2086 lt!108424)))))

(assert (=> d!57909 (= lt!108619 (insertStrictlySorted!143 (toList!1542 lt!108420) (_1!2086 lt!108424) (_2!2086 lt!108424)))))

(assert (=> d!57909 (= (+!566 lt!108420 lt!108424) lt!108621)))

(declare-fun b!211372 () Bool)

(declare-fun res!103197 () Bool)

(assert (=> b!211372 (=> (not res!103197) (not e!137575))))

(assert (=> b!211372 (= res!103197 (= (getValueByKey!250 (toList!1542 lt!108621) (_1!2086 lt!108424)) (Some!255 (_2!2086 lt!108424))))))

(declare-fun b!211373 () Bool)

(assert (=> b!211373 (= e!137575 (contains!1383 (toList!1542 lt!108621) lt!108424))))

(assert (= (and d!57909 res!103198) b!211372))

(assert (= (and b!211372 res!103197) b!211373))

(declare-fun m!238687 () Bool)

(assert (=> d!57909 m!238687))

(declare-fun m!238689 () Bool)

(assert (=> d!57909 m!238689))

(declare-fun m!238691 () Bool)

(assert (=> d!57909 m!238691))

(declare-fun m!238693 () Bool)

(assert (=> d!57909 m!238693))

(declare-fun m!238695 () Bool)

(assert (=> b!211372 m!238695))

(declare-fun m!238697 () Bool)

(assert (=> b!211373 m!238697))

(assert (=> b!211135 d!57909))

(declare-fun bm!20013 () Bool)

(declare-fun call!20016 () Bool)

(declare-fun c!35703 () Bool)

(assert (=> bm!20013 (= call!20016 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35703 (Cons!3054 (select (arr!4772 _keys!825) #b00000000000000000000000000000000) Nil!3055) Nil!3055)))))

(declare-fun b!211384 () Bool)

(declare-fun e!137586 () Bool)

(assert (=> b!211384 (= e!137586 call!20016)))

(declare-fun b!211385 () Bool)

(declare-fun e!137587 () Bool)

(declare-fun contains!1384 (List!3058 (_ BitVec 64)) Bool)

(assert (=> b!211385 (= e!137587 (contains!1384 Nil!3055 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211386 () Bool)

(declare-fun e!137584 () Bool)

(assert (=> b!211386 (= e!137584 e!137586)))

(assert (=> b!211386 (= c!35703 (validKeyInArray!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57911 () Bool)

(declare-fun res!103207 () Bool)

(declare-fun e!137585 () Bool)

(assert (=> d!57911 (=> res!103207 e!137585)))

(assert (=> d!57911 (= res!103207 (bvsge #b00000000000000000000000000000000 (size!5098 _keys!825)))))

(assert (=> d!57911 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3055) e!137585)))

(declare-fun b!211387 () Bool)

(assert (=> b!211387 (= e!137586 call!20016)))

(declare-fun b!211388 () Bool)

(assert (=> b!211388 (= e!137585 e!137584)))

(declare-fun res!103206 () Bool)

(assert (=> b!211388 (=> (not res!103206) (not e!137584))))

(assert (=> b!211388 (= res!103206 (not e!137587))))

(declare-fun res!103205 () Bool)

(assert (=> b!211388 (=> (not res!103205) (not e!137587))))

(assert (=> b!211388 (= res!103205 (validKeyInArray!0 (select (arr!4772 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57911 (not res!103207)) b!211388))

(assert (= (and b!211388 res!103205) b!211385))

(assert (= (and b!211388 res!103206) b!211386))

(assert (= (and b!211386 c!35703) b!211384))

(assert (= (and b!211386 (not c!35703)) b!211387))

(assert (= (or b!211384 b!211387) bm!20013))

(assert (=> bm!20013 m!238503))

(declare-fun m!238699 () Bool)

(assert (=> bm!20013 m!238699))

(assert (=> b!211385 m!238503))

(assert (=> b!211385 m!238503))

(declare-fun m!238701 () Bool)

(assert (=> b!211385 m!238701))

(assert (=> b!211386 m!238503))

(assert (=> b!211386 m!238503))

(assert (=> b!211386 m!238505))

(assert (=> b!211388 m!238503))

(assert (=> b!211388 m!238503))

(assert (=> b!211388 m!238505))

(assert (=> b!211139 d!57911))

(declare-fun d!57913 () Bool)

(assert (=> d!57913 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21022 d!57913))

(declare-fun d!57915 () Bool)

(assert (=> d!57915 (= (array_inv!3133 _values!649) (bvsge (size!5097 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21022 d!57915))

(declare-fun d!57917 () Bool)

(assert (=> d!57917 (= (array_inv!3134 _keys!825) (bvsge (size!5098 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21022 d!57917))

(declare-fun mapIsEmpty!9239 () Bool)

(declare-fun mapRes!9239 () Bool)

(assert (=> mapIsEmpty!9239 mapRes!9239))

(declare-fun b!211396 () Bool)

(declare-fun e!137592 () Bool)

(assert (=> b!211396 (= e!137592 tp_is_empty!5431)))

(declare-fun b!211395 () Bool)

(declare-fun e!137593 () Bool)

(assert (=> b!211395 (= e!137593 tp_is_empty!5431)))

(declare-fun condMapEmpty!9239 () Bool)

(declare-fun mapDefault!9239 () ValueCell!2372)

(assert (=> mapNonEmpty!9230 (= condMapEmpty!9239 (= mapRest!9230 ((as const (Array (_ BitVec 32) ValueCell!2372)) mapDefault!9239)))))

(assert (=> mapNonEmpty!9230 (= tp!19762 (and e!137592 mapRes!9239))))

(declare-fun mapNonEmpty!9239 () Bool)

(declare-fun tp!19778 () Bool)

(assert (=> mapNonEmpty!9239 (= mapRes!9239 (and tp!19778 e!137593))))

(declare-fun mapKey!9239 () (_ BitVec 32))

(declare-fun mapValue!9239 () ValueCell!2372)

(declare-fun mapRest!9239 () (Array (_ BitVec 32) ValueCell!2372))

(assert (=> mapNonEmpty!9239 (= mapRest!9230 (store mapRest!9239 mapKey!9239 mapValue!9239))))

(assert (= (and mapNonEmpty!9230 condMapEmpty!9239) mapIsEmpty!9239))

(assert (= (and mapNonEmpty!9230 (not condMapEmpty!9239)) mapNonEmpty!9239))

(assert (= (and mapNonEmpty!9239 ((_ is ValueCellFull!2372) mapValue!9239)) b!211395))

(assert (= (and mapNonEmpty!9230 ((_ is ValueCellFull!2372) mapDefault!9239)) b!211396))

(declare-fun m!238703 () Bool)

(assert (=> mapNonEmpty!9239 m!238703))

(declare-fun b_lambda!7653 () Bool)

(assert (= b_lambda!7649 (or (and start!21022 b_free!5569) b_lambda!7653)))

(declare-fun b_lambda!7655 () Bool)

(assert (= b_lambda!7651 (or (and start!21022 b_free!5569) b_lambda!7655)))

(declare-fun b_lambda!7657 () Bool)

(assert (= b_lambda!7641 (or (and start!21022 b_free!5569) b_lambda!7657)))

(declare-fun b_lambda!7659 () Bool)

(assert (= b_lambda!7645 (or (and start!21022 b_free!5569) b_lambda!7659)))

(declare-fun b_lambda!7661 () Bool)

(assert (= b_lambda!7643 (or (and start!21022 b_free!5569) b_lambda!7661)))

(declare-fun b_lambda!7663 () Bool)

(assert (= b_lambda!7647 (or (and start!21022 b_free!5569) b_lambda!7663)))

(check-sat (not b!211323) (not b_lambda!7653) (not b!211264) (not b!211329) (not b!211353) (not d!57905) (not bm!19976) (not b!211247) (not b!211357) (not bm!20003) (not b!211275) (not d!57899) (not b!211372) (not b!211385) (not b!211346) (not b!211253) (not b!211218) (not d!57897) (not b!211373) tp_is_empty!5431 (not b_lambda!7663) (not b!211266) (not b!211369) (not d!57909) (not bm!20004) (not bm!20002) (not b_lambda!7657) (not b_lambda!7659) (not b!211371) (not d!57895) (not b!211269) (not b!211386) (not d!57903) (not b!211388) (not b!211355) (not bm!20007) (not b!211254) (not bm!19994) (not b!211319) (not b!211370) (not b!211274) (not b!211363) (not bm!19975) (not b_lambda!7661) (not b!211361) (not b!211331) (not mapNonEmpty!9239) (not b!211246) (not bm!19997) (not b!211249) (not b!211263) (not b!211250) (not bm!20008) (not b!211327) (not b_next!5569) (not b!211270) (not b!211267) (not b!211359) (not b!211349) (not b!211273) (not b!211325) (not b!211333) (not d!57907) (not d!57901) (not b_lambda!7655) (not bm!19995) (not b!211339) (not bm!19991) (not b!211248) (not bm!19972) (not bm!20010) (not b!211255) (not b!211219) b_and!12365 (not b!211268) (not bm!20013))
(check-sat b_and!12365 (not b_next!5569))
