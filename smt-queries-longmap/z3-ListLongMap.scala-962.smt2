; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20872 () Bool)

(assert start!20872)

(declare-fun b_free!5521 () Bool)

(declare-fun b_next!5521 () Bool)

(assert (=> start!20872 (= b_free!5521 (not b_next!5521))))

(declare-fun tp!19604 () Bool)

(declare-fun b_and!12241 () Bool)

(assert (=> start!20872 (= tp!19604 b_and!12241)))

(declare-fun b!209335 () Bool)

(declare-fun e!136367 () Bool)

(declare-fun e!136369 () Bool)

(declare-fun mapRes!9143 () Bool)

(assert (=> b!209335 (= e!136367 (and e!136369 mapRes!9143))))

(declare-fun condMapEmpty!9143 () Bool)

(declare-datatypes ((V!6825 0))(
  ( (V!6826 (val!2736 Int)) )
))
(declare-datatypes ((ValueCell!2348 0))(
  ( (ValueCellFull!2348 (v!4700 V!6825)) (EmptyCell!2348) )
))
(declare-datatypes ((array!9951 0))(
  ( (array!9952 (arr!4725 (Array (_ BitVec 32) ValueCell!2348)) (size!5051 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9951)

(declare-fun mapDefault!9143 () ValueCell!2348)

(assert (=> b!209335 (= condMapEmpty!9143 (= (arr!4725 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2348)) mapDefault!9143)))))

(declare-fun b!209336 () Bool)

(declare-fun res!102038 () Bool)

(declare-fun e!136370 () Bool)

(assert (=> b!209336 (=> (not res!102038) (not e!136370))))

(declare-datatypes ((array!9953 0))(
  ( (array!9954 (arr!4726 (Array (_ BitVec 32) (_ BitVec 64))) (size!5052 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9953)

(declare-datatypes ((List!3023 0))(
  ( (Nil!3020) (Cons!3019 (h!3661 (_ BitVec 64)) (t!7945 List!3023)) )
))
(declare-fun arrayNoDuplicates!0 (array!9953 (_ BitVec 32) List!3023) Bool)

(assert (=> b!209336 (= res!102038 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3020))))

(declare-fun b!209337 () Bool)

(declare-fun minValue!615 () V!6825)

(declare-fun e!136366 () Bool)

(declare-datatypes ((tuple2!4114 0))(
  ( (tuple2!4115 (_1!2068 (_ BitVec 64)) (_2!2068 V!6825)) )
))
(declare-datatypes ((List!3024 0))(
  ( (Nil!3021) (Cons!3020 (h!3662 tuple2!4114) (t!7946 List!3024)) )
))
(declare-datatypes ((ListLongMap!3017 0))(
  ( (ListLongMap!3018 (toList!1524 List!3024)) )
))
(declare-fun lt!106864 () ListLongMap!3017)

(declare-fun lt!106862 () ListLongMap!3017)

(declare-fun zeroValue!615 () V!6825)

(declare-fun +!548 (ListLongMap!3017 tuple2!4114) ListLongMap!3017)

(assert (=> b!209337 (= e!136366 (= lt!106862 (+!548 (+!548 lt!106864 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun mapNonEmpty!9143 () Bool)

(declare-fun tp!19603 () Bool)

(declare-fun e!136368 () Bool)

(assert (=> mapNonEmpty!9143 (= mapRes!9143 (and tp!19603 e!136368))))

(declare-fun mapKey!9143 () (_ BitVec 32))

(declare-fun mapRest!9143 () (Array (_ BitVec 32) ValueCell!2348))

(declare-fun mapValue!9143 () ValueCell!2348)

(assert (=> mapNonEmpty!9143 (= (arr!4725 _values!649) (store mapRest!9143 mapKey!9143 mapValue!9143))))

(declare-fun b!209339 () Bool)

(declare-fun res!102036 () Bool)

(assert (=> b!209339 (=> (not res!102036) (not e!136370))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209339 (= res!102036 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5052 _keys!825))))))

(declare-fun b!209340 () Bool)

(declare-fun res!102037 () Bool)

(assert (=> b!209340 (=> (not res!102037) (not e!136370))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9953 (_ BitVec 32)) Bool)

(assert (=> b!209340 (= res!102037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209341 () Bool)

(declare-fun res!102035 () Bool)

(assert (=> b!209341 (=> (not res!102035) (not e!136370))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209341 (= res!102035 (validKeyInArray!0 k0!843))))

(declare-fun b!209342 () Bool)

(declare-fun res!102031 () Bool)

(assert (=> b!209342 (=> (not res!102031) (not e!136370))))

(assert (=> b!209342 (= res!102031 (= (select (arr!4726 _keys!825) i!601) k0!843))))

(declare-fun b!209343 () Bool)

(assert (=> b!209343 (= e!136370 (not e!136366))))

(declare-fun res!102034 () Bool)

(assert (=> b!209343 (=> res!102034 e!136366)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209343 (= res!102034 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!106859 () ListLongMap!3017)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1038 (array!9953 array!9951 (_ BitVec 32) (_ BitVec 32) V!6825 V!6825 (_ BitVec 32) Int) ListLongMap!3017)

(assert (=> b!209343 (= lt!106859 (getCurrentListMap!1038 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106860 () array!9951)

(assert (=> b!209343 (= lt!106862 (getCurrentListMap!1038 _keys!825 lt!106860 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106865 () ListLongMap!3017)

(assert (=> b!209343 (and (= lt!106864 lt!106865) (= lt!106865 lt!106864))))

(declare-fun lt!106863 () ListLongMap!3017)

(declare-fun v!520 () V!6825)

(assert (=> b!209343 (= lt!106865 (+!548 lt!106863 (tuple2!4115 k0!843 v!520)))))

(declare-datatypes ((Unit!6336 0))(
  ( (Unit!6337) )
))
(declare-fun lt!106861 () Unit!6336)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!199 (array!9953 array!9951 (_ BitVec 32) (_ BitVec 32) V!6825 V!6825 (_ BitVec 32) (_ BitVec 64) V!6825 (_ BitVec 32) Int) Unit!6336)

(assert (=> b!209343 (= lt!106861 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!199 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!475 (array!9953 array!9951 (_ BitVec 32) (_ BitVec 32) V!6825 V!6825 (_ BitVec 32) Int) ListLongMap!3017)

(assert (=> b!209343 (= lt!106864 (getCurrentListMapNoExtraKeys!475 _keys!825 lt!106860 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209343 (= lt!106860 (array!9952 (store (arr!4725 _values!649) i!601 (ValueCellFull!2348 v!520)) (size!5051 _values!649)))))

(assert (=> b!209343 (= lt!106863 (getCurrentListMapNoExtraKeys!475 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209344 () Bool)

(declare-fun res!102033 () Bool)

(assert (=> b!209344 (=> (not res!102033) (not e!136370))))

(assert (=> b!209344 (= res!102033 (and (= (size!5051 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5052 _keys!825) (size!5051 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209338 () Bool)

(declare-fun tp_is_empty!5383 () Bool)

(assert (=> b!209338 (= e!136369 tp_is_empty!5383)))

(declare-fun res!102032 () Bool)

(assert (=> start!20872 (=> (not res!102032) (not e!136370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20872 (= res!102032 (validMask!0 mask!1149))))

(assert (=> start!20872 e!136370))

(declare-fun array_inv!3103 (array!9951) Bool)

(assert (=> start!20872 (and (array_inv!3103 _values!649) e!136367)))

(assert (=> start!20872 true))

(assert (=> start!20872 tp_is_empty!5383))

(declare-fun array_inv!3104 (array!9953) Bool)

(assert (=> start!20872 (array_inv!3104 _keys!825)))

(assert (=> start!20872 tp!19604))

(declare-fun b!209345 () Bool)

(assert (=> b!209345 (= e!136368 tp_is_empty!5383)))

(declare-fun mapIsEmpty!9143 () Bool)

(assert (=> mapIsEmpty!9143 mapRes!9143))

(assert (= (and start!20872 res!102032) b!209344))

(assert (= (and b!209344 res!102033) b!209340))

(assert (= (and b!209340 res!102037) b!209336))

(assert (= (and b!209336 res!102038) b!209339))

(assert (= (and b!209339 res!102036) b!209341))

(assert (= (and b!209341 res!102035) b!209342))

(assert (= (and b!209342 res!102031) b!209343))

(assert (= (and b!209343 (not res!102034)) b!209337))

(assert (= (and b!209335 condMapEmpty!9143) mapIsEmpty!9143))

(assert (= (and b!209335 (not condMapEmpty!9143)) mapNonEmpty!9143))

(get-info :version)

(assert (= (and mapNonEmpty!9143 ((_ is ValueCellFull!2348) mapValue!9143)) b!209345))

(assert (= (and b!209335 ((_ is ValueCellFull!2348) mapDefault!9143)) b!209338))

(assert (= start!20872 b!209335))

(declare-fun m!236241 () Bool)

(assert (=> b!209337 m!236241))

(assert (=> b!209337 m!236241))

(declare-fun m!236243 () Bool)

(assert (=> b!209337 m!236243))

(declare-fun m!236245 () Bool)

(assert (=> b!209342 m!236245))

(declare-fun m!236247 () Bool)

(assert (=> mapNonEmpty!9143 m!236247))

(declare-fun m!236249 () Bool)

(assert (=> b!209343 m!236249))

(declare-fun m!236251 () Bool)

(assert (=> b!209343 m!236251))

(declare-fun m!236253 () Bool)

(assert (=> b!209343 m!236253))

(declare-fun m!236255 () Bool)

(assert (=> b!209343 m!236255))

(declare-fun m!236257 () Bool)

(assert (=> b!209343 m!236257))

(declare-fun m!236259 () Bool)

(assert (=> b!209343 m!236259))

(declare-fun m!236261 () Bool)

(assert (=> b!209343 m!236261))

(declare-fun m!236263 () Bool)

(assert (=> start!20872 m!236263))

(declare-fun m!236265 () Bool)

(assert (=> start!20872 m!236265))

(declare-fun m!236267 () Bool)

(assert (=> start!20872 m!236267))

(declare-fun m!236269 () Bool)

(assert (=> b!209340 m!236269))

(declare-fun m!236271 () Bool)

(assert (=> b!209341 m!236271))

(declare-fun m!236273 () Bool)

(assert (=> b!209336 m!236273))

(check-sat (not mapNonEmpty!9143) b_and!12241 (not b!209340) (not b_next!5521) (not b!209343) (not b!209337) tp_is_empty!5383 (not start!20872) (not b!209341) (not b!209336))
(check-sat b_and!12241 (not b_next!5521))
(get-model)

(declare-fun d!57713 () Bool)

(assert (=> d!57713 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20872 d!57713))

(declare-fun d!57715 () Bool)

(assert (=> d!57715 (= (array_inv!3103 _values!649) (bvsge (size!5051 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20872 d!57715))

(declare-fun d!57717 () Bool)

(assert (=> d!57717 (= (array_inv!3104 _keys!825) (bvsge (size!5052 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20872 d!57717))

(declare-fun b!209422 () Bool)

(declare-fun e!136416 () Bool)

(declare-fun e!136418 () Bool)

(assert (=> b!209422 (= e!136416 e!136418)))

(declare-fun c!35412 () Bool)

(assert (=> b!209422 (= c!35412 (validKeyInArray!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209423 () Bool)

(declare-fun e!136417 () Bool)

(assert (=> b!209423 (= e!136417 e!136416)))

(declare-fun res!102094 () Bool)

(assert (=> b!209423 (=> (not res!102094) (not e!136416))))

(declare-fun e!136419 () Bool)

(assert (=> b!209423 (= res!102094 (not e!136419))))

(declare-fun res!102093 () Bool)

(assert (=> b!209423 (=> (not res!102093) (not e!136419))))

(assert (=> b!209423 (= res!102093 (validKeyInArray!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209424 () Bool)

(declare-fun call!19755 () Bool)

(assert (=> b!209424 (= e!136418 call!19755)))

(declare-fun b!209425 () Bool)

(assert (=> b!209425 (= e!136418 call!19755)))

(declare-fun b!209426 () Bool)

(declare-fun contains!1367 (List!3023 (_ BitVec 64)) Bool)

(assert (=> b!209426 (= e!136419 (contains!1367 Nil!3020 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57719 () Bool)

(declare-fun res!102095 () Bool)

(assert (=> d!57719 (=> res!102095 e!136417)))

(assert (=> d!57719 (= res!102095 (bvsge #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(assert (=> d!57719 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3020) e!136417)))

(declare-fun bm!19752 () Bool)

(assert (=> bm!19752 (= call!19755 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35412 (Cons!3019 (select (arr!4726 _keys!825) #b00000000000000000000000000000000) Nil!3020) Nil!3020)))))

(assert (= (and d!57719 (not res!102095)) b!209423))

(assert (= (and b!209423 res!102093) b!209426))

(assert (= (and b!209423 res!102094) b!209422))

(assert (= (and b!209422 c!35412) b!209425))

(assert (= (and b!209422 (not c!35412)) b!209424))

(assert (= (or b!209425 b!209424) bm!19752))

(declare-fun m!236343 () Bool)

(assert (=> b!209422 m!236343))

(assert (=> b!209422 m!236343))

(declare-fun m!236345 () Bool)

(assert (=> b!209422 m!236345))

(assert (=> b!209423 m!236343))

(assert (=> b!209423 m!236343))

(assert (=> b!209423 m!236345))

(assert (=> b!209426 m!236343))

(assert (=> b!209426 m!236343))

(declare-fun m!236347 () Bool)

(assert (=> b!209426 m!236347))

(assert (=> bm!19752 m!236343))

(declare-fun m!236349 () Bool)

(assert (=> bm!19752 m!236349))

(assert (=> b!209336 d!57719))

(declare-fun d!57721 () Bool)

(declare-fun e!136422 () Bool)

(assert (=> d!57721 e!136422))

(declare-fun res!102101 () Bool)

(assert (=> d!57721 (=> (not res!102101) (not e!136422))))

(declare-fun lt!106916 () ListLongMap!3017)

(declare-fun contains!1368 (ListLongMap!3017 (_ BitVec 64)) Bool)

(assert (=> d!57721 (= res!102101 (contains!1368 lt!106916 (_1!2068 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun lt!106917 () List!3024)

(assert (=> d!57721 (= lt!106916 (ListLongMap!3018 lt!106917))))

(declare-fun lt!106919 () Unit!6336)

(declare-fun lt!106918 () Unit!6336)

(assert (=> d!57721 (= lt!106919 lt!106918)))

(declare-datatypes ((Option!251 0))(
  ( (Some!250 (v!4706 V!6825)) (None!249) )
))
(declare-fun getValueByKey!245 (List!3024 (_ BitVec 64)) Option!251)

(assert (=> d!57721 (= (getValueByKey!245 lt!106917 (_1!2068 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!250 (_2!2068 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun lemmaContainsTupThenGetReturnValue!135 (List!3024 (_ BitVec 64) V!6825) Unit!6336)

(assert (=> d!57721 (= lt!106918 (lemmaContainsTupThenGetReturnValue!135 lt!106917 (_1!2068 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2068 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun insertStrictlySorted!138 (List!3024 (_ BitVec 64) V!6825) List!3024)

(assert (=> d!57721 (= lt!106917 (insertStrictlySorted!138 (toList!1524 (+!548 lt!106864 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (_1!2068 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2068 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (=> d!57721 (= (+!548 (+!548 lt!106864 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) lt!106916)))

(declare-fun b!209431 () Bool)

(declare-fun res!102100 () Bool)

(assert (=> b!209431 (=> (not res!102100) (not e!136422))))

(assert (=> b!209431 (= res!102100 (= (getValueByKey!245 (toList!1524 lt!106916) (_1!2068 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!250 (_2!2068 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))))

(declare-fun b!209432 () Bool)

(declare-fun contains!1369 (List!3024 tuple2!4114) Bool)

(assert (=> b!209432 (= e!136422 (contains!1369 (toList!1524 lt!106916) (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(assert (= (and d!57721 res!102101) b!209431))

(assert (= (and b!209431 res!102100) b!209432))

(declare-fun m!236351 () Bool)

(assert (=> d!57721 m!236351))

(declare-fun m!236353 () Bool)

(assert (=> d!57721 m!236353))

(declare-fun m!236355 () Bool)

(assert (=> d!57721 m!236355))

(declare-fun m!236357 () Bool)

(assert (=> d!57721 m!236357))

(declare-fun m!236359 () Bool)

(assert (=> b!209431 m!236359))

(declare-fun m!236361 () Bool)

(assert (=> b!209432 m!236361))

(assert (=> b!209337 d!57721))

(declare-fun d!57723 () Bool)

(declare-fun e!136423 () Bool)

(assert (=> d!57723 e!136423))

(declare-fun res!102103 () Bool)

(assert (=> d!57723 (=> (not res!102103) (not e!136423))))

(declare-fun lt!106920 () ListLongMap!3017)

(assert (=> d!57723 (= res!102103 (contains!1368 lt!106920 (_1!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun lt!106921 () List!3024)

(assert (=> d!57723 (= lt!106920 (ListLongMap!3018 lt!106921))))

(declare-fun lt!106923 () Unit!6336)

(declare-fun lt!106922 () Unit!6336)

(assert (=> d!57723 (= lt!106923 lt!106922)))

(assert (=> d!57723 (= (getValueByKey!245 lt!106921 (_1!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!250 (_2!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!57723 (= lt!106922 (lemmaContainsTupThenGetReturnValue!135 lt!106921 (_1!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!57723 (= lt!106921 (insertStrictlySorted!138 (toList!1524 lt!106864) (_1!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!57723 (= (+!548 lt!106864 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) lt!106920)))

(declare-fun b!209433 () Bool)

(declare-fun res!102102 () Bool)

(assert (=> b!209433 (=> (not res!102102) (not e!136423))))

(assert (=> b!209433 (= res!102102 (= (getValueByKey!245 (toList!1524 lt!106920) (_1!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!250 (_2!2068 (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))))

(declare-fun b!209434 () Bool)

(assert (=> b!209434 (= e!136423 (contains!1369 (toList!1524 lt!106920) (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))

(assert (= (and d!57723 res!102103) b!209433))

(assert (= (and b!209433 res!102102) b!209434))

(declare-fun m!236363 () Bool)

(assert (=> d!57723 m!236363))

(declare-fun m!236365 () Bool)

(assert (=> d!57723 m!236365))

(declare-fun m!236367 () Bool)

(assert (=> d!57723 m!236367))

(declare-fun m!236369 () Bool)

(assert (=> d!57723 m!236369))

(declare-fun m!236371 () Bool)

(assert (=> b!209433 m!236371))

(declare-fun m!236373 () Bool)

(assert (=> b!209434 m!236373))

(assert (=> b!209337 d!57723))

(declare-fun d!57725 () Bool)

(assert (=> d!57725 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209341 d!57725))

(declare-fun c!35425 () Bool)

(declare-fun call!19775 () ListLongMap!3017)

(declare-fun c!35428 () Bool)

(declare-fun bm!19767 () Bool)

(declare-fun call!19770 () ListLongMap!3017)

(declare-fun call!19771 () ListLongMap!3017)

(declare-fun call!19773 () ListLongMap!3017)

(assert (=> bm!19767 (= call!19770 (+!548 (ite c!35425 call!19773 (ite c!35428 call!19775 call!19771)) (ite (or c!35425 c!35428) (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun d!57727 () Bool)

(declare-fun e!136456 () Bool)

(assert (=> d!57727 e!136456))

(declare-fun res!102130 () Bool)

(assert (=> d!57727 (=> (not res!102130) (not e!136456))))

(assert (=> d!57727 (= res!102130 (or (bvsge #b00000000000000000000000000000000 (size!5052 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))))

(declare-fun lt!106983 () ListLongMap!3017)

(declare-fun lt!106977 () ListLongMap!3017)

(assert (=> d!57727 (= lt!106983 lt!106977)))

(declare-fun lt!106980 () Unit!6336)

(declare-fun e!136459 () Unit!6336)

(assert (=> d!57727 (= lt!106980 e!136459)))

(declare-fun c!35429 () Bool)

(declare-fun e!136451 () Bool)

(assert (=> d!57727 (= c!35429 e!136451)))

(declare-fun res!102127 () Bool)

(assert (=> d!57727 (=> (not res!102127) (not e!136451))))

(assert (=> d!57727 (= res!102127 (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun e!136450 () ListLongMap!3017)

(assert (=> d!57727 (= lt!106977 e!136450)))

(assert (=> d!57727 (= c!35425 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57727 (validMask!0 mask!1149)))

(assert (=> d!57727 (= (getCurrentListMap!1038 _keys!825 lt!106860 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!106983)))

(declare-fun b!209477 () Bool)

(declare-fun e!136452 () ListLongMap!3017)

(declare-fun call!19776 () ListLongMap!3017)

(assert (=> b!209477 (= e!136452 call!19776)))

(declare-fun b!209478 () Bool)

(declare-fun e!136458 () Bool)

(declare-fun e!136455 () Bool)

(assert (=> b!209478 (= e!136458 e!136455)))

(declare-fun res!102122 () Bool)

(assert (=> b!209478 (=> (not res!102122) (not e!136455))))

(assert (=> b!209478 (= res!102122 (contains!1368 lt!106983 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209478 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun b!209479 () Bool)

(declare-fun e!136460 () Bool)

(declare-fun apply!189 (ListLongMap!3017 (_ BitVec 64)) V!6825)

(assert (=> b!209479 (= e!136460 (= (apply!189 lt!106983 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!19768 () Bool)

(declare-fun call!19774 () Bool)

(assert (=> bm!19768 (= call!19774 (contains!1368 lt!106983 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19769 () Bool)

(assert (=> bm!19769 (= call!19771 call!19775)))

(declare-fun b!209480 () Bool)

(declare-fun e!136462 () Bool)

(assert (=> b!209480 (= e!136462 (not call!19774))))

(declare-fun b!209481 () Bool)

(declare-fun e!136461 () Bool)

(assert (=> b!209481 (= e!136456 e!136461)))

(declare-fun c!35430 () Bool)

(assert (=> b!209481 (= c!35430 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209482 () Bool)

(declare-fun e!136454 () Bool)

(assert (=> b!209482 (= e!136454 (validKeyInArray!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209483 () Bool)

(assert (=> b!209483 (= e!136450 e!136452)))

(assert (=> b!209483 (= c!35428 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209484 () Bool)

(assert (=> b!209484 (= e!136461 e!136460)))

(declare-fun res!102125 () Bool)

(declare-fun call!19772 () Bool)

(assert (=> b!209484 (= res!102125 call!19772)))

(assert (=> b!209484 (=> (not res!102125) (not e!136460))))

(declare-fun bm!19770 () Bool)

(assert (=> bm!19770 (= call!19773 (getCurrentListMapNoExtraKeys!475 _keys!825 lt!106860 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209485 () Bool)

(declare-fun Unit!6338 () Unit!6336)

(assert (=> b!209485 (= e!136459 Unit!6338)))

(declare-fun b!209486 () Bool)

(declare-fun e!136453 () Bool)

(assert (=> b!209486 (= e!136462 e!136453)))

(declare-fun res!102124 () Bool)

(assert (=> b!209486 (= res!102124 call!19774)))

(assert (=> b!209486 (=> (not res!102124) (not e!136453))))

(declare-fun b!209487 () Bool)

(assert (=> b!209487 (= e!136461 (not call!19772))))

(declare-fun b!209488 () Bool)

(declare-fun res!102126 () Bool)

(assert (=> b!209488 (=> (not res!102126) (not e!136456))))

(assert (=> b!209488 (= res!102126 e!136458)))

(declare-fun res!102123 () Bool)

(assert (=> b!209488 (=> res!102123 e!136458)))

(assert (=> b!209488 (= res!102123 (not e!136454))))

(declare-fun res!102129 () Bool)

(assert (=> b!209488 (=> (not res!102129) (not e!136454))))

(assert (=> b!209488 (= res!102129 (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun b!209489 () Bool)

(declare-fun e!136457 () ListLongMap!3017)

(assert (=> b!209489 (= e!136457 call!19776)))

(declare-fun b!209490 () Bool)

(assert (=> b!209490 (= e!136453 (= (apply!189 lt!106983 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!19771 () Bool)

(assert (=> bm!19771 (= call!19776 call!19770)))

(declare-fun b!209491 () Bool)

(assert (=> b!209491 (= e!136451 (validKeyInArray!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209492 () Bool)

(declare-fun lt!106987 () Unit!6336)

(assert (=> b!209492 (= e!136459 lt!106987)))

(declare-fun lt!106981 () ListLongMap!3017)

(assert (=> b!209492 (= lt!106981 (getCurrentListMapNoExtraKeys!475 _keys!825 lt!106860 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106988 () (_ BitVec 64))

(assert (=> b!209492 (= lt!106988 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!106968 () (_ BitVec 64))

(assert (=> b!209492 (= lt!106968 (select (arr!4726 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!106985 () Unit!6336)

(declare-fun addStillContains!165 (ListLongMap!3017 (_ BitVec 64) V!6825 (_ BitVec 64)) Unit!6336)

(assert (=> b!209492 (= lt!106985 (addStillContains!165 lt!106981 lt!106988 zeroValue!615 lt!106968))))

(assert (=> b!209492 (contains!1368 (+!548 lt!106981 (tuple2!4115 lt!106988 zeroValue!615)) lt!106968)))

(declare-fun lt!106970 () Unit!6336)

(assert (=> b!209492 (= lt!106970 lt!106985)))

(declare-fun lt!106971 () ListLongMap!3017)

(assert (=> b!209492 (= lt!106971 (getCurrentListMapNoExtraKeys!475 _keys!825 lt!106860 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106979 () (_ BitVec 64))

(assert (=> b!209492 (= lt!106979 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!106976 () (_ BitVec 64))

(assert (=> b!209492 (= lt!106976 (select (arr!4726 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!106989 () Unit!6336)

(declare-fun addApplyDifferent!165 (ListLongMap!3017 (_ BitVec 64) V!6825 (_ BitVec 64)) Unit!6336)

(assert (=> b!209492 (= lt!106989 (addApplyDifferent!165 lt!106971 lt!106979 minValue!615 lt!106976))))

(assert (=> b!209492 (= (apply!189 (+!548 lt!106971 (tuple2!4115 lt!106979 minValue!615)) lt!106976) (apply!189 lt!106971 lt!106976))))

(declare-fun lt!106973 () Unit!6336)

(assert (=> b!209492 (= lt!106973 lt!106989)))

(declare-fun lt!106974 () ListLongMap!3017)

(assert (=> b!209492 (= lt!106974 (getCurrentListMapNoExtraKeys!475 _keys!825 lt!106860 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106978 () (_ BitVec 64))

(assert (=> b!209492 (= lt!106978 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!106982 () (_ BitVec 64))

(assert (=> b!209492 (= lt!106982 (select (arr!4726 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!106972 () Unit!6336)

(assert (=> b!209492 (= lt!106972 (addApplyDifferent!165 lt!106974 lt!106978 zeroValue!615 lt!106982))))

(assert (=> b!209492 (= (apply!189 (+!548 lt!106974 (tuple2!4115 lt!106978 zeroValue!615)) lt!106982) (apply!189 lt!106974 lt!106982))))

(declare-fun lt!106984 () Unit!6336)

(assert (=> b!209492 (= lt!106984 lt!106972)))

(declare-fun lt!106986 () ListLongMap!3017)

(assert (=> b!209492 (= lt!106986 (getCurrentListMapNoExtraKeys!475 _keys!825 lt!106860 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106969 () (_ BitVec 64))

(assert (=> b!209492 (= lt!106969 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!106975 () (_ BitVec 64))

(assert (=> b!209492 (= lt!106975 (select (arr!4726 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209492 (= lt!106987 (addApplyDifferent!165 lt!106986 lt!106969 minValue!615 lt!106975))))

(assert (=> b!209492 (= (apply!189 (+!548 lt!106986 (tuple2!4115 lt!106969 minValue!615)) lt!106975) (apply!189 lt!106986 lt!106975))))

(declare-fun b!209493 () Bool)

(declare-fun c!35426 () Bool)

(assert (=> b!209493 (= c!35426 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!209493 (= e!136452 e!136457)))

(declare-fun b!209494 () Bool)

(assert (=> b!209494 (= e!136450 (+!548 call!19770 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!209495 () Bool)

(declare-fun res!102128 () Bool)

(assert (=> b!209495 (=> (not res!102128) (not e!136456))))

(assert (=> b!209495 (= res!102128 e!136462)))

(declare-fun c!35427 () Bool)

(assert (=> b!209495 (= c!35427 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19772 () Bool)

(assert (=> bm!19772 (= call!19775 call!19773)))

(declare-fun b!209496 () Bool)

(assert (=> b!209496 (= e!136457 call!19771)))

(declare-fun b!209497 () Bool)

(declare-fun get!2533 (ValueCell!2348 V!6825) V!6825)

(declare-fun dynLambda!523 (Int (_ BitVec 64)) V!6825)

(assert (=> b!209497 (= e!136455 (= (apply!189 lt!106983 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)) (get!2533 (select (arr!4725 lt!106860) #b00000000000000000000000000000000) (dynLambda!523 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5051 lt!106860)))))

(assert (=> b!209497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun bm!19773 () Bool)

(assert (=> bm!19773 (= call!19772 (contains!1368 lt!106983 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57727 c!35425) b!209494))

(assert (= (and d!57727 (not c!35425)) b!209483))

(assert (= (and b!209483 c!35428) b!209477))

(assert (= (and b!209483 (not c!35428)) b!209493))

(assert (= (and b!209493 c!35426) b!209489))

(assert (= (and b!209493 (not c!35426)) b!209496))

(assert (= (or b!209489 b!209496) bm!19769))

(assert (= (or b!209477 bm!19769) bm!19772))

(assert (= (or b!209477 b!209489) bm!19771))

(assert (= (or b!209494 bm!19772) bm!19770))

(assert (= (or b!209494 bm!19771) bm!19767))

(assert (= (and d!57727 res!102127) b!209491))

(assert (= (and d!57727 c!35429) b!209492))

(assert (= (and d!57727 (not c!35429)) b!209485))

(assert (= (and d!57727 res!102130) b!209488))

(assert (= (and b!209488 res!102129) b!209482))

(assert (= (and b!209488 (not res!102123)) b!209478))

(assert (= (and b!209478 res!102122) b!209497))

(assert (= (and b!209488 res!102126) b!209495))

(assert (= (and b!209495 c!35427) b!209486))

(assert (= (and b!209495 (not c!35427)) b!209480))

(assert (= (and b!209486 res!102124) b!209490))

(assert (= (or b!209486 b!209480) bm!19768))

(assert (= (and b!209495 res!102128) b!209481))

(assert (= (and b!209481 c!35430) b!209484))

(assert (= (and b!209481 (not c!35430)) b!209487))

(assert (= (and b!209484 res!102125) b!209479))

(assert (= (or b!209484 b!209487) bm!19773))

(declare-fun b_lambda!7521 () Bool)

(assert (=> (not b_lambda!7521) (not b!209497)))

(declare-fun t!7949 () Bool)

(declare-fun tb!2883 () Bool)

(assert (=> (and start!20872 (= defaultEntry!657 defaultEntry!657) t!7949) tb!2883))

(declare-fun result!4953 () Bool)

(assert (=> tb!2883 (= result!4953 tp_is_empty!5383)))

(assert (=> b!209497 t!7949))

(declare-fun b_and!12247 () Bool)

(assert (= b_and!12241 (and (=> t!7949 result!4953) b_and!12247)))

(assert (=> d!57727 m!236263))

(declare-fun m!236375 () Bool)

(assert (=> bm!19767 m!236375))

(declare-fun m!236377 () Bool)

(assert (=> b!209490 m!236377))

(assert (=> b!209491 m!236343))

(assert (=> b!209491 m!236343))

(assert (=> b!209491 m!236345))

(declare-fun m!236379 () Bool)

(assert (=> bm!19768 m!236379))

(declare-fun m!236381 () Bool)

(assert (=> b!209479 m!236381))

(declare-fun m!236383 () Bool)

(assert (=> b!209494 m!236383))

(assert (=> bm!19770 m!236255))

(assert (=> b!209478 m!236343))

(assert (=> b!209478 m!236343))

(declare-fun m!236385 () Bool)

(assert (=> b!209478 m!236385))

(declare-fun m!236387 () Bool)

(assert (=> bm!19773 m!236387))

(declare-fun m!236389 () Bool)

(assert (=> b!209497 m!236389))

(assert (=> b!209497 m!236389))

(declare-fun m!236391 () Bool)

(assert (=> b!209497 m!236391))

(declare-fun m!236393 () Bool)

(assert (=> b!209497 m!236393))

(assert (=> b!209497 m!236343))

(assert (=> b!209497 m!236343))

(declare-fun m!236395 () Bool)

(assert (=> b!209497 m!236395))

(assert (=> b!209497 m!236391))

(assert (=> b!209482 m!236343))

(assert (=> b!209482 m!236343))

(assert (=> b!209482 m!236345))

(declare-fun m!236397 () Bool)

(assert (=> b!209492 m!236397))

(assert (=> b!209492 m!236255))

(declare-fun m!236399 () Bool)

(assert (=> b!209492 m!236399))

(assert (=> b!209492 m!236343))

(declare-fun m!236401 () Bool)

(assert (=> b!209492 m!236401))

(declare-fun m!236403 () Bool)

(assert (=> b!209492 m!236403))

(declare-fun m!236405 () Bool)

(assert (=> b!209492 m!236405))

(declare-fun m!236407 () Bool)

(assert (=> b!209492 m!236407))

(declare-fun m!236409 () Bool)

(assert (=> b!209492 m!236409))

(declare-fun m!236411 () Bool)

(assert (=> b!209492 m!236411))

(declare-fun m!236413 () Bool)

(assert (=> b!209492 m!236413))

(declare-fun m!236415 () Bool)

(assert (=> b!209492 m!236415))

(declare-fun m!236417 () Bool)

(assert (=> b!209492 m!236417))

(declare-fun m!236419 () Bool)

(assert (=> b!209492 m!236419))

(assert (=> b!209492 m!236411))

(declare-fun m!236421 () Bool)

(assert (=> b!209492 m!236421))

(assert (=> b!209492 m!236407))

(assert (=> b!209492 m!236417))

(assert (=> b!209492 m!236401))

(declare-fun m!236423 () Bool)

(assert (=> b!209492 m!236423))

(declare-fun m!236425 () Bool)

(assert (=> b!209492 m!236425))

(assert (=> b!209343 d!57727))

(declare-fun d!57729 () Bool)

(declare-fun e!136463 () Bool)

(assert (=> d!57729 e!136463))

(declare-fun res!102132 () Bool)

(assert (=> d!57729 (=> (not res!102132) (not e!136463))))

(declare-fun lt!106990 () ListLongMap!3017)

(assert (=> d!57729 (= res!102132 (contains!1368 lt!106990 (_1!2068 (tuple2!4115 k0!843 v!520))))))

(declare-fun lt!106991 () List!3024)

(assert (=> d!57729 (= lt!106990 (ListLongMap!3018 lt!106991))))

(declare-fun lt!106993 () Unit!6336)

(declare-fun lt!106992 () Unit!6336)

(assert (=> d!57729 (= lt!106993 lt!106992)))

(assert (=> d!57729 (= (getValueByKey!245 lt!106991 (_1!2068 (tuple2!4115 k0!843 v!520))) (Some!250 (_2!2068 (tuple2!4115 k0!843 v!520))))))

(assert (=> d!57729 (= lt!106992 (lemmaContainsTupThenGetReturnValue!135 lt!106991 (_1!2068 (tuple2!4115 k0!843 v!520)) (_2!2068 (tuple2!4115 k0!843 v!520))))))

(assert (=> d!57729 (= lt!106991 (insertStrictlySorted!138 (toList!1524 lt!106863) (_1!2068 (tuple2!4115 k0!843 v!520)) (_2!2068 (tuple2!4115 k0!843 v!520))))))

(assert (=> d!57729 (= (+!548 lt!106863 (tuple2!4115 k0!843 v!520)) lt!106990)))

(declare-fun b!209500 () Bool)

(declare-fun res!102131 () Bool)

(assert (=> b!209500 (=> (not res!102131) (not e!136463))))

(assert (=> b!209500 (= res!102131 (= (getValueByKey!245 (toList!1524 lt!106990) (_1!2068 (tuple2!4115 k0!843 v!520))) (Some!250 (_2!2068 (tuple2!4115 k0!843 v!520)))))))

(declare-fun b!209501 () Bool)

(assert (=> b!209501 (= e!136463 (contains!1369 (toList!1524 lt!106990) (tuple2!4115 k0!843 v!520)))))

(assert (= (and d!57729 res!102132) b!209500))

(assert (= (and b!209500 res!102131) b!209501))

(declare-fun m!236427 () Bool)

(assert (=> d!57729 m!236427))

(declare-fun m!236429 () Bool)

(assert (=> d!57729 m!236429))

(declare-fun m!236431 () Bool)

(assert (=> d!57729 m!236431))

(declare-fun m!236433 () Bool)

(assert (=> d!57729 m!236433))

(declare-fun m!236435 () Bool)

(assert (=> b!209500 m!236435))

(declare-fun m!236437 () Bool)

(assert (=> b!209501 m!236437))

(assert (=> b!209343 d!57729))

(declare-fun b!209526 () Bool)

(declare-fun lt!107009 () Unit!6336)

(declare-fun lt!107008 () Unit!6336)

(assert (=> b!209526 (= lt!107009 lt!107008)))

(declare-fun lt!107012 () ListLongMap!3017)

(declare-fun lt!107010 () (_ BitVec 64))

(declare-fun lt!107014 () V!6825)

(declare-fun lt!107011 () (_ BitVec 64))

(assert (=> b!209526 (not (contains!1368 (+!548 lt!107012 (tuple2!4115 lt!107010 lt!107014)) lt!107011))))

(declare-fun addStillNotContains!99 (ListLongMap!3017 (_ BitVec 64) V!6825 (_ BitVec 64)) Unit!6336)

(assert (=> b!209526 (= lt!107008 (addStillNotContains!99 lt!107012 lt!107010 lt!107014 lt!107011))))

(assert (=> b!209526 (= lt!107011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!209526 (= lt!107014 (get!2533 (select (arr!4725 _values!649) #b00000000000000000000000000000000) (dynLambda!523 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209526 (= lt!107010 (select (arr!4726 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!19779 () ListLongMap!3017)

(assert (=> b!209526 (= lt!107012 call!19779)))

(declare-fun e!136483 () ListLongMap!3017)

(assert (=> b!209526 (= e!136483 (+!548 call!19779 (tuple2!4115 (select (arr!4726 _keys!825) #b00000000000000000000000000000000) (get!2533 (select (arr!4725 _values!649) #b00000000000000000000000000000000) (dynLambda!523 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209528 () Bool)

(assert (=> b!209528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(assert (=> b!209528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5051 _values!649)))))

(declare-fun e!136481 () Bool)

(declare-fun lt!107013 () ListLongMap!3017)

(assert (=> b!209528 (= e!136481 (= (apply!189 lt!107013 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)) (get!2533 (select (arr!4725 _values!649) #b00000000000000000000000000000000) (dynLambda!523 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!209529 () Bool)

(declare-fun e!136484 () Bool)

(declare-fun e!136479 () Bool)

(assert (=> b!209529 (= e!136484 e!136479)))

(declare-fun c!35440 () Bool)

(declare-fun e!136478 () Bool)

(assert (=> b!209529 (= c!35440 e!136478)))

(declare-fun res!102144 () Bool)

(assert (=> b!209529 (=> (not res!102144) (not e!136478))))

(assert (=> b!209529 (= res!102144 (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun b!209530 () Bool)

(declare-fun e!136480 () Bool)

(assert (=> b!209530 (= e!136479 e!136480)))

(declare-fun c!35442 () Bool)

(assert (=> b!209530 (= c!35442 (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun b!209531 () Bool)

(declare-fun e!136482 () ListLongMap!3017)

(assert (=> b!209531 (= e!136482 (ListLongMap!3018 Nil!3021))))

(declare-fun b!209532 () Bool)

(declare-fun isEmpty!494 (ListLongMap!3017) Bool)

(assert (=> b!209532 (= e!136480 (isEmpty!494 lt!107013))))

(declare-fun b!209533 () Bool)

(assert (=> b!209533 (= e!136478 (validKeyInArray!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209533 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!209534 () Bool)

(assert (=> b!209534 (= e!136479 e!136481)))

(assert (=> b!209534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun res!102143 () Bool)

(assert (=> b!209534 (= res!102143 (contains!1368 lt!107013 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209534 (=> (not res!102143) (not e!136481))))

(declare-fun d!57731 () Bool)

(assert (=> d!57731 e!136484))

(declare-fun res!102142 () Bool)

(assert (=> d!57731 (=> (not res!102142) (not e!136484))))

(assert (=> d!57731 (= res!102142 (not (contains!1368 lt!107013 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57731 (= lt!107013 e!136482)))

(declare-fun c!35439 () Bool)

(assert (=> d!57731 (= c!35439 (bvsge #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(assert (=> d!57731 (validMask!0 mask!1149)))

(assert (=> d!57731 (= (getCurrentListMapNoExtraKeys!475 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107013)))

(declare-fun b!209527 () Bool)

(assert (=> b!209527 (= e!136482 e!136483)))

(declare-fun c!35441 () Bool)

(assert (=> b!209527 (= c!35441 (validKeyInArray!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209535 () Bool)

(assert (=> b!209535 (= e!136483 call!19779)))

(declare-fun b!209536 () Bool)

(declare-fun res!102141 () Bool)

(assert (=> b!209536 (=> (not res!102141) (not e!136484))))

(assert (=> b!209536 (= res!102141 (not (contains!1368 lt!107013 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!209537 () Bool)

(assert (=> b!209537 (= e!136480 (= lt!107013 (getCurrentListMapNoExtraKeys!475 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun bm!19776 () Bool)

(assert (=> bm!19776 (= call!19779 (getCurrentListMapNoExtraKeys!475 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(assert (= (and d!57731 c!35439) b!209531))

(assert (= (and d!57731 (not c!35439)) b!209527))

(assert (= (and b!209527 c!35441) b!209526))

(assert (= (and b!209527 (not c!35441)) b!209535))

(assert (= (or b!209526 b!209535) bm!19776))

(assert (= (and d!57731 res!102142) b!209536))

(assert (= (and b!209536 res!102141) b!209529))

(assert (= (and b!209529 res!102144) b!209533))

(assert (= (and b!209529 c!35440) b!209534))

(assert (= (and b!209529 (not c!35440)) b!209530))

(assert (= (and b!209534 res!102143) b!209528))

(assert (= (and b!209530 c!35442) b!209537))

(assert (= (and b!209530 (not c!35442)) b!209532))

(declare-fun b_lambda!7523 () Bool)

(assert (=> (not b_lambda!7523) (not b!209526)))

(assert (=> b!209526 t!7949))

(declare-fun b_and!12249 () Bool)

(assert (= b_and!12247 (and (=> t!7949 result!4953) b_and!12249)))

(declare-fun b_lambda!7525 () Bool)

(assert (=> (not b_lambda!7525) (not b!209528)))

(assert (=> b!209528 t!7949))

(declare-fun b_and!12251 () Bool)

(assert (= b_and!12249 (and (=> t!7949 result!4953) b_and!12251)))

(assert (=> b!209528 m!236343))

(assert (=> b!209528 m!236343))

(declare-fun m!236439 () Bool)

(assert (=> b!209528 m!236439))

(declare-fun m!236441 () Bool)

(assert (=> b!209528 m!236441))

(assert (=> b!209528 m!236391))

(assert (=> b!209528 m!236441))

(assert (=> b!209528 m!236391))

(declare-fun m!236443 () Bool)

(assert (=> b!209528 m!236443))

(assert (=> b!209533 m!236343))

(assert (=> b!209533 m!236343))

(assert (=> b!209533 m!236345))

(declare-fun m!236445 () Bool)

(assert (=> b!209532 m!236445))

(declare-fun m!236447 () Bool)

(assert (=> bm!19776 m!236447))

(declare-fun m!236449 () Bool)

(assert (=> d!57731 m!236449))

(assert (=> d!57731 m!236263))

(assert (=> b!209534 m!236343))

(assert (=> b!209534 m!236343))

(declare-fun m!236451 () Bool)

(assert (=> b!209534 m!236451))

(assert (=> b!209526 m!236343))

(declare-fun m!236453 () Bool)

(assert (=> b!209526 m!236453))

(assert (=> b!209526 m!236453))

(declare-fun m!236455 () Bool)

(assert (=> b!209526 m!236455))

(assert (=> b!209526 m!236441))

(assert (=> b!209526 m!236391))

(assert (=> b!209526 m!236441))

(assert (=> b!209526 m!236391))

(assert (=> b!209526 m!236443))

(declare-fun m!236457 () Bool)

(assert (=> b!209526 m!236457))

(declare-fun m!236459 () Bool)

(assert (=> b!209526 m!236459))

(assert (=> b!209537 m!236447))

(declare-fun m!236461 () Bool)

(assert (=> b!209536 m!236461))

(assert (=> b!209527 m!236343))

(assert (=> b!209527 m!236343))

(assert (=> b!209527 m!236345))

(assert (=> b!209343 d!57731))

(declare-fun b!209538 () Bool)

(declare-fun lt!107016 () Unit!6336)

(declare-fun lt!107015 () Unit!6336)

(assert (=> b!209538 (= lt!107016 lt!107015)))

(declare-fun lt!107021 () V!6825)

(declare-fun lt!107019 () ListLongMap!3017)

(declare-fun lt!107017 () (_ BitVec 64))

(declare-fun lt!107018 () (_ BitVec 64))

(assert (=> b!209538 (not (contains!1368 (+!548 lt!107019 (tuple2!4115 lt!107017 lt!107021)) lt!107018))))

(assert (=> b!209538 (= lt!107015 (addStillNotContains!99 lt!107019 lt!107017 lt!107021 lt!107018))))

(assert (=> b!209538 (= lt!107018 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!209538 (= lt!107021 (get!2533 (select (arr!4725 lt!106860) #b00000000000000000000000000000000) (dynLambda!523 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209538 (= lt!107017 (select (arr!4726 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!19780 () ListLongMap!3017)

(assert (=> b!209538 (= lt!107019 call!19780)))

(declare-fun e!136490 () ListLongMap!3017)

(assert (=> b!209538 (= e!136490 (+!548 call!19780 (tuple2!4115 (select (arr!4726 _keys!825) #b00000000000000000000000000000000) (get!2533 (select (arr!4725 lt!106860) #b00000000000000000000000000000000) (dynLambda!523 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209540 () Bool)

(assert (=> b!209540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(assert (=> b!209540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5051 lt!106860)))))

(declare-fun e!136488 () Bool)

(declare-fun lt!107020 () ListLongMap!3017)

(assert (=> b!209540 (= e!136488 (= (apply!189 lt!107020 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)) (get!2533 (select (arr!4725 lt!106860) #b00000000000000000000000000000000) (dynLambda!523 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!209541 () Bool)

(declare-fun e!136491 () Bool)

(declare-fun e!136486 () Bool)

(assert (=> b!209541 (= e!136491 e!136486)))

(declare-fun c!35444 () Bool)

(declare-fun e!136485 () Bool)

(assert (=> b!209541 (= c!35444 e!136485)))

(declare-fun res!102148 () Bool)

(assert (=> b!209541 (=> (not res!102148) (not e!136485))))

(assert (=> b!209541 (= res!102148 (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun b!209542 () Bool)

(declare-fun e!136487 () Bool)

(assert (=> b!209542 (= e!136486 e!136487)))

(declare-fun c!35446 () Bool)

(assert (=> b!209542 (= c!35446 (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun b!209543 () Bool)

(declare-fun e!136489 () ListLongMap!3017)

(assert (=> b!209543 (= e!136489 (ListLongMap!3018 Nil!3021))))

(declare-fun b!209544 () Bool)

(assert (=> b!209544 (= e!136487 (isEmpty!494 lt!107020))))

(declare-fun b!209545 () Bool)

(assert (=> b!209545 (= e!136485 (validKeyInArray!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209545 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!209546 () Bool)

(assert (=> b!209546 (= e!136486 e!136488)))

(assert (=> b!209546 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun res!102147 () Bool)

(assert (=> b!209546 (= res!102147 (contains!1368 lt!107020 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209546 (=> (not res!102147) (not e!136488))))

(declare-fun d!57733 () Bool)

(assert (=> d!57733 e!136491))

(declare-fun res!102146 () Bool)

(assert (=> d!57733 (=> (not res!102146) (not e!136491))))

(assert (=> d!57733 (= res!102146 (not (contains!1368 lt!107020 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57733 (= lt!107020 e!136489)))

(declare-fun c!35443 () Bool)

(assert (=> d!57733 (= c!35443 (bvsge #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(assert (=> d!57733 (validMask!0 mask!1149)))

(assert (=> d!57733 (= (getCurrentListMapNoExtraKeys!475 _keys!825 lt!106860 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107020)))

(declare-fun b!209539 () Bool)

(assert (=> b!209539 (= e!136489 e!136490)))

(declare-fun c!35445 () Bool)

(assert (=> b!209539 (= c!35445 (validKeyInArray!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209547 () Bool)

(assert (=> b!209547 (= e!136490 call!19780)))

(declare-fun b!209548 () Bool)

(declare-fun res!102145 () Bool)

(assert (=> b!209548 (=> (not res!102145) (not e!136491))))

(assert (=> b!209548 (= res!102145 (not (contains!1368 lt!107020 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!209549 () Bool)

(assert (=> b!209549 (= e!136487 (= lt!107020 (getCurrentListMapNoExtraKeys!475 _keys!825 lt!106860 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun bm!19777 () Bool)

(assert (=> bm!19777 (= call!19780 (getCurrentListMapNoExtraKeys!475 _keys!825 lt!106860 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(assert (= (and d!57733 c!35443) b!209543))

(assert (= (and d!57733 (not c!35443)) b!209539))

(assert (= (and b!209539 c!35445) b!209538))

(assert (= (and b!209539 (not c!35445)) b!209547))

(assert (= (or b!209538 b!209547) bm!19777))

(assert (= (and d!57733 res!102146) b!209548))

(assert (= (and b!209548 res!102145) b!209541))

(assert (= (and b!209541 res!102148) b!209545))

(assert (= (and b!209541 c!35444) b!209546))

(assert (= (and b!209541 (not c!35444)) b!209542))

(assert (= (and b!209546 res!102147) b!209540))

(assert (= (and b!209542 c!35446) b!209549))

(assert (= (and b!209542 (not c!35446)) b!209544))

(declare-fun b_lambda!7527 () Bool)

(assert (=> (not b_lambda!7527) (not b!209538)))

(assert (=> b!209538 t!7949))

(declare-fun b_and!12253 () Bool)

(assert (= b_and!12251 (and (=> t!7949 result!4953) b_and!12253)))

(declare-fun b_lambda!7529 () Bool)

(assert (=> (not b_lambda!7529) (not b!209540)))

(assert (=> b!209540 t!7949))

(declare-fun b_and!12255 () Bool)

(assert (= b_and!12253 (and (=> t!7949 result!4953) b_and!12255)))

(assert (=> b!209540 m!236343))

(assert (=> b!209540 m!236343))

(declare-fun m!236463 () Bool)

(assert (=> b!209540 m!236463))

(assert (=> b!209540 m!236389))

(assert (=> b!209540 m!236391))

(assert (=> b!209540 m!236389))

(assert (=> b!209540 m!236391))

(assert (=> b!209540 m!236393))

(assert (=> b!209545 m!236343))

(assert (=> b!209545 m!236343))

(assert (=> b!209545 m!236345))

(declare-fun m!236465 () Bool)

(assert (=> b!209544 m!236465))

(declare-fun m!236467 () Bool)

(assert (=> bm!19777 m!236467))

(declare-fun m!236469 () Bool)

(assert (=> d!57733 m!236469))

(assert (=> d!57733 m!236263))

(assert (=> b!209546 m!236343))

(assert (=> b!209546 m!236343))

(declare-fun m!236471 () Bool)

(assert (=> b!209546 m!236471))

(assert (=> b!209538 m!236343))

(declare-fun m!236473 () Bool)

(assert (=> b!209538 m!236473))

(assert (=> b!209538 m!236473))

(declare-fun m!236475 () Bool)

(assert (=> b!209538 m!236475))

(assert (=> b!209538 m!236389))

(assert (=> b!209538 m!236391))

(assert (=> b!209538 m!236389))

(assert (=> b!209538 m!236391))

(assert (=> b!209538 m!236393))

(declare-fun m!236477 () Bool)

(assert (=> b!209538 m!236477))

(declare-fun m!236479 () Bool)

(assert (=> b!209538 m!236479))

(assert (=> b!209549 m!236467))

(declare-fun m!236481 () Bool)

(assert (=> b!209548 m!236481))

(assert (=> b!209539 m!236343))

(assert (=> b!209539 m!236343))

(assert (=> b!209539 m!236345))

(assert (=> b!209343 d!57733))

(declare-fun b!209556 () Bool)

(declare-fun e!136496 () Bool)

(declare-fun e!136497 () Bool)

(assert (=> b!209556 (= e!136496 e!136497)))

(declare-fun c!35449 () Bool)

(assert (=> b!209556 (= c!35449 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun d!57735 () Bool)

(assert (=> d!57735 e!136496))

(declare-fun res!102151 () Bool)

(assert (=> d!57735 (=> (not res!102151) (not e!136496))))

(assert (=> d!57735 (= res!102151 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5051 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5051 _values!649))))))))

(declare-fun lt!107024 () Unit!6336)

(declare-fun choose!1079 (array!9953 array!9951 (_ BitVec 32) (_ BitVec 32) V!6825 V!6825 (_ BitVec 32) (_ BitVec 64) V!6825 (_ BitVec 32) Int) Unit!6336)

(assert (=> d!57735 (= lt!107024 (choose!1079 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(assert (=> d!57735 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!199 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!107024)))

(declare-fun bm!19782 () Bool)

(declare-fun call!19785 () ListLongMap!3017)

(assert (=> bm!19782 (= call!19785 (getCurrentListMapNoExtraKeys!475 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209557 () Bool)

(declare-fun call!19786 () ListLongMap!3017)

(assert (=> b!209557 (= e!136497 (= call!19786 (+!548 call!19785 (tuple2!4115 k0!843 v!520))))))

(declare-fun b!209558 () Bool)

(assert (=> b!209558 (= e!136497 (= call!19786 call!19785))))

(declare-fun bm!19783 () Bool)

(assert (=> bm!19783 (= call!19786 (getCurrentListMapNoExtraKeys!475 _keys!825 (array!9952 (store (arr!4725 _values!649) i!601 (ValueCellFull!2348 v!520)) (size!5051 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!57735 res!102151) b!209556))

(assert (= (and b!209556 c!35449) b!209557))

(assert (= (and b!209556 (not c!35449)) b!209558))

(assert (= (or b!209557 b!209558) bm!19783))

(assert (= (or b!209557 b!209558) bm!19782))

(declare-fun m!236483 () Bool)

(assert (=> d!57735 m!236483))

(assert (=> bm!19782 m!236261))

(declare-fun m!236485 () Bool)

(assert (=> b!209557 m!236485))

(assert (=> bm!19783 m!236251))

(declare-fun m!236487 () Bool)

(assert (=> bm!19783 m!236487))

(assert (=> b!209343 d!57735))

(declare-fun call!19787 () ListLongMap!3017)

(declare-fun c!35450 () Bool)

(declare-fun call!19790 () ListLongMap!3017)

(declare-fun call!19788 () ListLongMap!3017)

(declare-fun c!35453 () Bool)

(declare-fun call!19792 () ListLongMap!3017)

(declare-fun bm!19784 () Bool)

(assert (=> bm!19784 (= call!19787 (+!548 (ite c!35450 call!19790 (ite c!35453 call!19792 call!19788)) (ite (or c!35450 c!35453) (tuple2!4115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun d!57737 () Bool)

(declare-fun e!136504 () Bool)

(assert (=> d!57737 e!136504))

(declare-fun res!102160 () Bool)

(assert (=> d!57737 (=> (not res!102160) (not e!136504))))

(assert (=> d!57737 (= res!102160 (or (bvsge #b00000000000000000000000000000000 (size!5052 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))))

(declare-fun lt!107040 () ListLongMap!3017)

(declare-fun lt!107034 () ListLongMap!3017)

(assert (=> d!57737 (= lt!107040 lt!107034)))

(declare-fun lt!107037 () Unit!6336)

(declare-fun e!136507 () Unit!6336)

(assert (=> d!57737 (= lt!107037 e!136507)))

(declare-fun c!35454 () Bool)

(declare-fun e!136499 () Bool)

(assert (=> d!57737 (= c!35454 e!136499)))

(declare-fun res!102157 () Bool)

(assert (=> d!57737 (=> (not res!102157) (not e!136499))))

(assert (=> d!57737 (= res!102157 (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun e!136498 () ListLongMap!3017)

(assert (=> d!57737 (= lt!107034 e!136498)))

(assert (=> d!57737 (= c!35450 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57737 (validMask!0 mask!1149)))

(assert (=> d!57737 (= (getCurrentListMap!1038 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107040)))

(declare-fun b!209559 () Bool)

(declare-fun e!136500 () ListLongMap!3017)

(declare-fun call!19793 () ListLongMap!3017)

(assert (=> b!209559 (= e!136500 call!19793)))

(declare-fun b!209560 () Bool)

(declare-fun e!136506 () Bool)

(declare-fun e!136503 () Bool)

(assert (=> b!209560 (= e!136506 e!136503)))

(declare-fun res!102152 () Bool)

(assert (=> b!209560 (=> (not res!102152) (not e!136503))))

(assert (=> b!209560 (= res!102152 (contains!1368 lt!107040 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun b!209561 () Bool)

(declare-fun e!136508 () Bool)

(assert (=> b!209561 (= e!136508 (= (apply!189 lt!107040 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!19785 () Bool)

(declare-fun call!19791 () Bool)

(assert (=> bm!19785 (= call!19791 (contains!1368 lt!107040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19786 () Bool)

(assert (=> bm!19786 (= call!19788 call!19792)))

(declare-fun b!209562 () Bool)

(declare-fun e!136510 () Bool)

(assert (=> b!209562 (= e!136510 (not call!19791))))

(declare-fun b!209563 () Bool)

(declare-fun e!136509 () Bool)

(assert (=> b!209563 (= e!136504 e!136509)))

(declare-fun c!35455 () Bool)

(assert (=> b!209563 (= c!35455 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209564 () Bool)

(declare-fun e!136502 () Bool)

(assert (=> b!209564 (= e!136502 (validKeyInArray!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209565 () Bool)

(assert (=> b!209565 (= e!136498 e!136500)))

(assert (=> b!209565 (= c!35453 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209566 () Bool)

(assert (=> b!209566 (= e!136509 e!136508)))

(declare-fun res!102155 () Bool)

(declare-fun call!19789 () Bool)

(assert (=> b!209566 (= res!102155 call!19789)))

(assert (=> b!209566 (=> (not res!102155) (not e!136508))))

(declare-fun bm!19787 () Bool)

(assert (=> bm!19787 (= call!19790 (getCurrentListMapNoExtraKeys!475 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209567 () Bool)

(declare-fun Unit!6339 () Unit!6336)

(assert (=> b!209567 (= e!136507 Unit!6339)))

(declare-fun b!209568 () Bool)

(declare-fun e!136501 () Bool)

(assert (=> b!209568 (= e!136510 e!136501)))

(declare-fun res!102154 () Bool)

(assert (=> b!209568 (= res!102154 call!19791)))

(assert (=> b!209568 (=> (not res!102154) (not e!136501))))

(declare-fun b!209569 () Bool)

(assert (=> b!209569 (= e!136509 (not call!19789))))

(declare-fun b!209570 () Bool)

(declare-fun res!102156 () Bool)

(assert (=> b!209570 (=> (not res!102156) (not e!136504))))

(assert (=> b!209570 (= res!102156 e!136506)))

(declare-fun res!102153 () Bool)

(assert (=> b!209570 (=> res!102153 e!136506)))

(assert (=> b!209570 (= res!102153 (not e!136502))))

(declare-fun res!102159 () Bool)

(assert (=> b!209570 (=> (not res!102159) (not e!136502))))

(assert (=> b!209570 (= res!102159 (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun b!209571 () Bool)

(declare-fun e!136505 () ListLongMap!3017)

(assert (=> b!209571 (= e!136505 call!19793)))

(declare-fun b!209572 () Bool)

(assert (=> b!209572 (= e!136501 (= (apply!189 lt!107040 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!19788 () Bool)

(assert (=> bm!19788 (= call!19793 call!19787)))

(declare-fun b!209573 () Bool)

(assert (=> b!209573 (= e!136499 (validKeyInArray!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209574 () Bool)

(declare-fun lt!107044 () Unit!6336)

(assert (=> b!209574 (= e!136507 lt!107044)))

(declare-fun lt!107038 () ListLongMap!3017)

(assert (=> b!209574 (= lt!107038 (getCurrentListMapNoExtraKeys!475 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107045 () (_ BitVec 64))

(assert (=> b!209574 (= lt!107045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107025 () (_ BitVec 64))

(assert (=> b!209574 (= lt!107025 (select (arr!4726 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107042 () Unit!6336)

(assert (=> b!209574 (= lt!107042 (addStillContains!165 lt!107038 lt!107045 zeroValue!615 lt!107025))))

(assert (=> b!209574 (contains!1368 (+!548 lt!107038 (tuple2!4115 lt!107045 zeroValue!615)) lt!107025)))

(declare-fun lt!107027 () Unit!6336)

(assert (=> b!209574 (= lt!107027 lt!107042)))

(declare-fun lt!107028 () ListLongMap!3017)

(assert (=> b!209574 (= lt!107028 (getCurrentListMapNoExtraKeys!475 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107036 () (_ BitVec 64))

(assert (=> b!209574 (= lt!107036 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107033 () (_ BitVec 64))

(assert (=> b!209574 (= lt!107033 (select (arr!4726 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107046 () Unit!6336)

(assert (=> b!209574 (= lt!107046 (addApplyDifferent!165 lt!107028 lt!107036 minValue!615 lt!107033))))

(assert (=> b!209574 (= (apply!189 (+!548 lt!107028 (tuple2!4115 lt!107036 minValue!615)) lt!107033) (apply!189 lt!107028 lt!107033))))

(declare-fun lt!107030 () Unit!6336)

(assert (=> b!209574 (= lt!107030 lt!107046)))

(declare-fun lt!107031 () ListLongMap!3017)

(assert (=> b!209574 (= lt!107031 (getCurrentListMapNoExtraKeys!475 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107035 () (_ BitVec 64))

(assert (=> b!209574 (= lt!107035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107039 () (_ BitVec 64))

(assert (=> b!209574 (= lt!107039 (select (arr!4726 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107029 () Unit!6336)

(assert (=> b!209574 (= lt!107029 (addApplyDifferent!165 lt!107031 lt!107035 zeroValue!615 lt!107039))))

(assert (=> b!209574 (= (apply!189 (+!548 lt!107031 (tuple2!4115 lt!107035 zeroValue!615)) lt!107039) (apply!189 lt!107031 lt!107039))))

(declare-fun lt!107041 () Unit!6336)

(assert (=> b!209574 (= lt!107041 lt!107029)))

(declare-fun lt!107043 () ListLongMap!3017)

(assert (=> b!209574 (= lt!107043 (getCurrentListMapNoExtraKeys!475 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107026 () (_ BitVec 64))

(assert (=> b!209574 (= lt!107026 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107032 () (_ BitVec 64))

(assert (=> b!209574 (= lt!107032 (select (arr!4726 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209574 (= lt!107044 (addApplyDifferent!165 lt!107043 lt!107026 minValue!615 lt!107032))))

(assert (=> b!209574 (= (apply!189 (+!548 lt!107043 (tuple2!4115 lt!107026 minValue!615)) lt!107032) (apply!189 lt!107043 lt!107032))))

(declare-fun b!209575 () Bool)

(declare-fun c!35451 () Bool)

(assert (=> b!209575 (= c!35451 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!209575 (= e!136500 e!136505)))

(declare-fun b!209576 () Bool)

(assert (=> b!209576 (= e!136498 (+!548 call!19787 (tuple2!4115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!209577 () Bool)

(declare-fun res!102158 () Bool)

(assert (=> b!209577 (=> (not res!102158) (not e!136504))))

(assert (=> b!209577 (= res!102158 e!136510)))

(declare-fun c!35452 () Bool)

(assert (=> b!209577 (= c!35452 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19789 () Bool)

(assert (=> bm!19789 (= call!19792 call!19790)))

(declare-fun b!209578 () Bool)

(assert (=> b!209578 (= e!136505 call!19788)))

(declare-fun b!209579 () Bool)

(assert (=> b!209579 (= e!136503 (= (apply!189 lt!107040 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)) (get!2533 (select (arr!4725 _values!649) #b00000000000000000000000000000000) (dynLambda!523 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209579 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5051 _values!649)))))

(assert (=> b!209579 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(declare-fun bm!19790 () Bool)

(assert (=> bm!19790 (= call!19789 (contains!1368 lt!107040 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57737 c!35450) b!209576))

(assert (= (and d!57737 (not c!35450)) b!209565))

(assert (= (and b!209565 c!35453) b!209559))

(assert (= (and b!209565 (not c!35453)) b!209575))

(assert (= (and b!209575 c!35451) b!209571))

(assert (= (and b!209575 (not c!35451)) b!209578))

(assert (= (or b!209571 b!209578) bm!19786))

(assert (= (or b!209559 bm!19786) bm!19789))

(assert (= (or b!209559 b!209571) bm!19788))

(assert (= (or b!209576 bm!19789) bm!19787))

(assert (= (or b!209576 bm!19788) bm!19784))

(assert (= (and d!57737 res!102157) b!209573))

(assert (= (and d!57737 c!35454) b!209574))

(assert (= (and d!57737 (not c!35454)) b!209567))

(assert (= (and d!57737 res!102160) b!209570))

(assert (= (and b!209570 res!102159) b!209564))

(assert (= (and b!209570 (not res!102153)) b!209560))

(assert (= (and b!209560 res!102152) b!209579))

(assert (= (and b!209570 res!102156) b!209577))

(assert (= (and b!209577 c!35452) b!209568))

(assert (= (and b!209577 (not c!35452)) b!209562))

(assert (= (and b!209568 res!102154) b!209572))

(assert (= (or b!209568 b!209562) bm!19785))

(assert (= (and b!209577 res!102158) b!209563))

(assert (= (and b!209563 c!35455) b!209566))

(assert (= (and b!209563 (not c!35455)) b!209569))

(assert (= (and b!209566 res!102155) b!209561))

(assert (= (or b!209566 b!209569) bm!19790))

(declare-fun b_lambda!7531 () Bool)

(assert (=> (not b_lambda!7531) (not b!209579)))

(assert (=> b!209579 t!7949))

(declare-fun b_and!12257 () Bool)

(assert (= b_and!12255 (and (=> t!7949 result!4953) b_and!12257)))

(assert (=> d!57737 m!236263))

(declare-fun m!236489 () Bool)

(assert (=> bm!19784 m!236489))

(declare-fun m!236491 () Bool)

(assert (=> b!209572 m!236491))

(assert (=> b!209573 m!236343))

(assert (=> b!209573 m!236343))

(assert (=> b!209573 m!236345))

(declare-fun m!236493 () Bool)

(assert (=> bm!19785 m!236493))

(declare-fun m!236495 () Bool)

(assert (=> b!209561 m!236495))

(declare-fun m!236497 () Bool)

(assert (=> b!209576 m!236497))

(assert (=> bm!19787 m!236261))

(assert (=> b!209560 m!236343))

(assert (=> b!209560 m!236343))

(declare-fun m!236499 () Bool)

(assert (=> b!209560 m!236499))

(declare-fun m!236501 () Bool)

(assert (=> bm!19790 m!236501))

(assert (=> b!209579 m!236441))

(assert (=> b!209579 m!236441))

(assert (=> b!209579 m!236391))

(assert (=> b!209579 m!236443))

(assert (=> b!209579 m!236343))

(assert (=> b!209579 m!236343))

(declare-fun m!236503 () Bool)

(assert (=> b!209579 m!236503))

(assert (=> b!209579 m!236391))

(assert (=> b!209564 m!236343))

(assert (=> b!209564 m!236343))

(assert (=> b!209564 m!236345))

(declare-fun m!236505 () Bool)

(assert (=> b!209574 m!236505))

(assert (=> b!209574 m!236261))

(declare-fun m!236507 () Bool)

(assert (=> b!209574 m!236507))

(assert (=> b!209574 m!236343))

(declare-fun m!236509 () Bool)

(assert (=> b!209574 m!236509))

(declare-fun m!236511 () Bool)

(assert (=> b!209574 m!236511))

(declare-fun m!236513 () Bool)

(assert (=> b!209574 m!236513))

(declare-fun m!236515 () Bool)

(assert (=> b!209574 m!236515))

(declare-fun m!236517 () Bool)

(assert (=> b!209574 m!236517))

(declare-fun m!236519 () Bool)

(assert (=> b!209574 m!236519))

(declare-fun m!236521 () Bool)

(assert (=> b!209574 m!236521))

(declare-fun m!236523 () Bool)

(assert (=> b!209574 m!236523))

(declare-fun m!236525 () Bool)

(assert (=> b!209574 m!236525))

(declare-fun m!236527 () Bool)

(assert (=> b!209574 m!236527))

(assert (=> b!209574 m!236519))

(declare-fun m!236529 () Bool)

(assert (=> b!209574 m!236529))

(assert (=> b!209574 m!236515))

(assert (=> b!209574 m!236525))

(assert (=> b!209574 m!236509))

(declare-fun m!236531 () Bool)

(assert (=> b!209574 m!236531))

(declare-fun m!236533 () Bool)

(assert (=> b!209574 m!236533))

(assert (=> b!209343 d!57737))

(declare-fun bm!19793 () Bool)

(declare-fun call!19796 () Bool)

(assert (=> bm!19793 (= call!19796 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun d!57739 () Bool)

(declare-fun res!102165 () Bool)

(declare-fun e!136519 () Bool)

(assert (=> d!57739 (=> res!102165 e!136519)))

(assert (=> d!57739 (= res!102165 (bvsge #b00000000000000000000000000000000 (size!5052 _keys!825)))))

(assert (=> d!57739 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!136519)))

(declare-fun b!209588 () Bool)

(declare-fun e!136518 () Bool)

(assert (=> b!209588 (= e!136519 e!136518)))

(declare-fun c!35458 () Bool)

(assert (=> b!209588 (= c!35458 (validKeyInArray!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209589 () Bool)

(declare-fun e!136517 () Bool)

(assert (=> b!209589 (= e!136518 e!136517)))

(declare-fun lt!107055 () (_ BitVec 64))

(assert (=> b!209589 (= lt!107055 (select (arr!4726 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107053 () Unit!6336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!9953 (_ BitVec 64) (_ BitVec 32)) Unit!6336)

(assert (=> b!209589 (= lt!107053 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!107055 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!9953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!209589 (arrayContainsKey!0 _keys!825 lt!107055 #b00000000000000000000000000000000)))

(declare-fun lt!107054 () Unit!6336)

(assert (=> b!209589 (= lt!107054 lt!107053)))

(declare-fun res!102166 () Bool)

(declare-datatypes ((SeekEntryResult!705 0))(
  ( (MissingZero!705 (index!4990 (_ BitVec 32))) (Found!705 (index!4991 (_ BitVec 32))) (Intermediate!705 (undefined!1517 Bool) (index!4992 (_ BitVec 32)) (x!21974 (_ BitVec 32))) (Undefined!705) (MissingVacant!705 (index!4993 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!9953 (_ BitVec 32)) SeekEntryResult!705)

(assert (=> b!209589 (= res!102166 (= (seekEntryOrOpen!0 (select (arr!4726 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!705 #b00000000000000000000000000000000)))))

(assert (=> b!209589 (=> (not res!102166) (not e!136517))))

(declare-fun b!209590 () Bool)

(assert (=> b!209590 (= e!136518 call!19796)))

(declare-fun b!209591 () Bool)

(assert (=> b!209591 (= e!136517 call!19796)))

(assert (= (and d!57739 (not res!102165)) b!209588))

(assert (= (and b!209588 c!35458) b!209589))

(assert (= (and b!209588 (not c!35458)) b!209590))

(assert (= (and b!209589 res!102166) b!209591))

(assert (= (or b!209591 b!209590) bm!19793))

(declare-fun m!236535 () Bool)

(assert (=> bm!19793 m!236535))

(assert (=> b!209588 m!236343))

(assert (=> b!209588 m!236343))

(assert (=> b!209588 m!236345))

(assert (=> b!209589 m!236343))

(declare-fun m!236537 () Bool)

(assert (=> b!209589 m!236537))

(declare-fun m!236539 () Bool)

(assert (=> b!209589 m!236539))

(assert (=> b!209589 m!236343))

(declare-fun m!236541 () Bool)

(assert (=> b!209589 m!236541))

(assert (=> b!209340 d!57739))

(declare-fun mapIsEmpty!9152 () Bool)

(declare-fun mapRes!9152 () Bool)

(assert (=> mapIsEmpty!9152 mapRes!9152))

(declare-fun mapNonEmpty!9152 () Bool)

(declare-fun tp!19619 () Bool)

(declare-fun e!136525 () Bool)

(assert (=> mapNonEmpty!9152 (= mapRes!9152 (and tp!19619 e!136525))))

(declare-fun mapRest!9152 () (Array (_ BitVec 32) ValueCell!2348))

(declare-fun mapKey!9152 () (_ BitVec 32))

(declare-fun mapValue!9152 () ValueCell!2348)

(assert (=> mapNonEmpty!9152 (= mapRest!9143 (store mapRest!9152 mapKey!9152 mapValue!9152))))

(declare-fun b!209599 () Bool)

(declare-fun e!136524 () Bool)

(assert (=> b!209599 (= e!136524 tp_is_empty!5383)))

(declare-fun b!209598 () Bool)

(assert (=> b!209598 (= e!136525 tp_is_empty!5383)))

(declare-fun condMapEmpty!9152 () Bool)

(declare-fun mapDefault!9152 () ValueCell!2348)

(assert (=> mapNonEmpty!9143 (= condMapEmpty!9152 (= mapRest!9143 ((as const (Array (_ BitVec 32) ValueCell!2348)) mapDefault!9152)))))

(assert (=> mapNonEmpty!9143 (= tp!19603 (and e!136524 mapRes!9152))))

(assert (= (and mapNonEmpty!9143 condMapEmpty!9152) mapIsEmpty!9152))

(assert (= (and mapNonEmpty!9143 (not condMapEmpty!9152)) mapNonEmpty!9152))

(assert (= (and mapNonEmpty!9152 ((_ is ValueCellFull!2348) mapValue!9152)) b!209598))

(assert (= (and mapNonEmpty!9143 ((_ is ValueCellFull!2348) mapDefault!9152)) b!209599))

(declare-fun m!236543 () Bool)

(assert (=> mapNonEmpty!9152 m!236543))

(declare-fun b_lambda!7533 () Bool)

(assert (= b_lambda!7527 (or (and start!20872 b_free!5521) b_lambda!7533)))

(declare-fun b_lambda!7535 () Bool)

(assert (= b_lambda!7529 (or (and start!20872 b_free!5521) b_lambda!7535)))

(declare-fun b_lambda!7537 () Bool)

(assert (= b_lambda!7525 (or (and start!20872 b_free!5521) b_lambda!7537)))

(declare-fun b_lambda!7539 () Bool)

(assert (= b_lambda!7521 (or (and start!20872 b_free!5521) b_lambda!7539)))

(declare-fun b_lambda!7541 () Bool)

(assert (= b_lambda!7531 (or (and start!20872 b_free!5521) b_lambda!7541)))

(declare-fun b_lambda!7543 () Bool)

(assert (= b_lambda!7523 (or (and start!20872 b_free!5521) b_lambda!7543)))

(check-sat (not b!209478) (not b!209574) (not b!209537) tp_is_empty!5383 (not bm!19777) (not b!209588) (not b_lambda!7543) (not bm!19776) (not b_lambda!7537) (not d!57731) (not bm!19787) (not bm!19770) (not d!57727) (not b!209540) (not d!57729) (not b!209482) (not b!209491) (not bm!19768) (not bm!19752) (not b!209545) (not b!209546) (not b!209532) (not b!209431) (not b!209423) (not b!209572) (not b!209501) (not d!57733) (not b!209533) (not b!209497) (not b!209576) (not d!57737) (not bm!19767) (not b_lambda!7535) (not b!209548) (not bm!19790) (not b!209500) (not d!57723) (not b!209557) (not b!209564) (not b_next!5521) (not bm!19784) (not b!209526) (not b!209579) (not b!209527) (not b!209549) (not b!209422) (not b!209494) (not bm!19793) (not d!57721) (not b_lambda!7539) (not d!57735) (not b_lambda!7533) (not b!209560) (not bm!19785) (not mapNonEmpty!9152) (not b!209426) (not b!209539) (not b!209534) (not b!209538) (not b!209432) b_and!12257 (not b!209561) (not b!209492) (not b!209589) (not b!209573) (not bm!19773) (not b!209479) (not b!209536) (not b!209433) (not b_lambda!7541) (not b!209544) (not b!209434) (not bm!19782) (not bm!19783) (not b!209528) (not b!209490))
(check-sat b_and!12257 (not b_next!5521))
