; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21220 () Bool)

(assert start!21220)

(declare-fun b_free!5647 () Bool)

(declare-fun b_next!5647 () Bool)

(assert (=> start!21220 (= b_free!5647 (not b_next!5647))))

(declare-fun tp!20014 () Bool)

(declare-fun b_and!12499 () Bool)

(assert (=> start!21220 (= tp!20014 b_and!12499)))

(declare-datatypes ((V!6993 0))(
  ( (V!6994 (val!2799 Int)) )
))
(declare-datatypes ((tuple2!4202 0))(
  ( (tuple2!4203 (_1!2112 (_ BitVec 64)) (_2!2112 V!6993)) )
))
(declare-datatypes ((List!3109 0))(
  ( (Nil!3106) (Cons!3105 (h!3747 tuple2!4202) (t!8053 List!3109)) )
))
(declare-datatypes ((ListLongMap!3105 0))(
  ( (ListLongMap!3106 (toList!1568 List!3109)) )
))
(declare-fun lt!110383 () ListLongMap!3105)

(declare-fun b!213619 () Bool)

(declare-fun lt!110379 () tuple2!4202)

(declare-fun e!138901 () Bool)

(declare-fun lt!110384 () ListLongMap!3105)

(declare-fun +!592 (ListLongMap!3105 tuple2!4202) ListLongMap!3105)

(assert (=> b!213619 (= e!138901 (= (+!592 lt!110384 lt!110379) lt!110383))))

(declare-fun b!213620 () Bool)

(declare-fun e!138902 () Bool)

(assert (=> b!213620 (= e!138902 (not e!138901))))

(declare-fun res!104562 () Bool)

(assert (=> b!213620 (=> res!104562 e!138901)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun lt!110381 () ListLongMap!3105)

(declare-fun lt!110386 () Bool)

(assert (=> b!213620 (= res!104562 (or (and (not lt!110386) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110386) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110386) (not (= lt!110383 lt!110381))))))

(assert (=> b!213620 (= lt!110386 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((ValueCell!2411 0))(
  ( (ValueCellFull!2411 (v!4807 V!6993)) (EmptyCell!2411) )
))
(declare-datatypes ((array!10213 0))(
  ( (array!10214 (arr!4845 (Array (_ BitVec 32) ValueCell!2411)) (size!5171 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10213)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6993)

(declare-datatypes ((array!10215 0))(
  ( (array!10216 (arr!4846 (Array (_ BitVec 32) (_ BitVec 64))) (size!5172 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10215)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6993)

(declare-fun getCurrentListMap!1077 (array!10215 array!10213 (_ BitVec 32) (_ BitVec 32) V!6993 V!6993 (_ BitVec 32) Int) ListLongMap!3105)

(assert (=> b!213620 (= lt!110384 (getCurrentListMap!1077 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110385 () array!10213)

(assert (=> b!213620 (= lt!110383 (getCurrentListMap!1077 _keys!825 lt!110385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110380 () ListLongMap!3105)

(assert (=> b!213620 (and (= lt!110381 lt!110380) (= lt!110380 lt!110381))))

(declare-fun lt!110387 () ListLongMap!3105)

(assert (=> b!213620 (= lt!110380 (+!592 lt!110387 lt!110379))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6993)

(assert (=> b!213620 (= lt!110379 (tuple2!4203 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6438 0))(
  ( (Unit!6439) )
))
(declare-fun lt!110382 () Unit!6438)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!238 (array!10215 array!10213 (_ BitVec 32) (_ BitVec 32) V!6993 V!6993 (_ BitVec 32) (_ BitVec 64) V!6993 (_ BitVec 32) Int) Unit!6438)

(assert (=> b!213620 (= lt!110382 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!238 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!514 (array!10215 array!10213 (_ BitVec 32) (_ BitVec 32) V!6993 V!6993 (_ BitVec 32) Int) ListLongMap!3105)

(assert (=> b!213620 (= lt!110381 (getCurrentListMapNoExtraKeys!514 _keys!825 lt!110385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213620 (= lt!110385 (array!10214 (store (arr!4845 _values!649) i!601 (ValueCellFull!2411 v!520)) (size!5171 _values!649)))))

(assert (=> b!213620 (= lt!110387 (getCurrentListMapNoExtraKeys!514 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213621 () Bool)

(declare-fun res!104564 () Bool)

(assert (=> b!213621 (=> (not res!104564) (not e!138902))))

(declare-datatypes ((List!3110 0))(
  ( (Nil!3107) (Cons!3106 (h!3748 (_ BitVec 64)) (t!8054 List!3110)) )
))
(declare-fun arrayNoDuplicates!0 (array!10215 (_ BitVec 32) List!3110) Bool)

(assert (=> b!213621 (= res!104564 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3107))))

(declare-fun mapIsEmpty!9365 () Bool)

(declare-fun mapRes!9365 () Bool)

(assert (=> mapIsEmpty!9365 mapRes!9365))

(declare-fun b!213622 () Bool)

(declare-fun res!104566 () Bool)

(assert (=> b!213622 (=> (not res!104566) (not e!138902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213622 (= res!104566 (validKeyInArray!0 k0!843))))

(declare-fun b!213623 () Bool)

(declare-fun e!138899 () Bool)

(declare-fun tp_is_empty!5509 () Bool)

(assert (=> b!213623 (= e!138899 tp_is_empty!5509)))

(declare-fun b!213625 () Bool)

(declare-fun e!138900 () Bool)

(assert (=> b!213625 (= e!138900 tp_is_empty!5509)))

(declare-fun b!213626 () Bool)

(declare-fun e!138898 () Bool)

(assert (=> b!213626 (= e!138898 (and e!138899 mapRes!9365))))

(declare-fun condMapEmpty!9365 () Bool)

(declare-fun mapDefault!9365 () ValueCell!2411)

(assert (=> b!213626 (= condMapEmpty!9365 (= (arr!4845 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2411)) mapDefault!9365)))))

(declare-fun b!213627 () Bool)

(declare-fun res!104561 () Bool)

(assert (=> b!213627 (=> (not res!104561) (not e!138902))))

(assert (=> b!213627 (= res!104561 (= (select (arr!4846 _keys!825) i!601) k0!843))))

(declare-fun b!213628 () Bool)

(declare-fun res!104565 () Bool)

(assert (=> b!213628 (=> (not res!104565) (not e!138902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10215 (_ BitVec 32)) Bool)

(assert (=> b!213628 (= res!104565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!104560 () Bool)

(assert (=> start!21220 (=> (not res!104560) (not e!138902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21220 (= res!104560 (validMask!0 mask!1149))))

(assert (=> start!21220 e!138902))

(declare-fun array_inv!3183 (array!10213) Bool)

(assert (=> start!21220 (and (array_inv!3183 _values!649) e!138898)))

(assert (=> start!21220 true))

(assert (=> start!21220 tp_is_empty!5509))

(declare-fun array_inv!3184 (array!10215) Bool)

(assert (=> start!21220 (array_inv!3184 _keys!825)))

(assert (=> start!21220 tp!20014))

(declare-fun b!213624 () Bool)

(declare-fun res!104567 () Bool)

(assert (=> b!213624 (=> (not res!104567) (not e!138902))))

(assert (=> b!213624 (= res!104567 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5172 _keys!825))))))

(declare-fun b!213629 () Bool)

(declare-fun res!104563 () Bool)

(assert (=> b!213629 (=> (not res!104563) (not e!138902))))

(assert (=> b!213629 (= res!104563 (and (= (size!5171 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5172 _keys!825) (size!5171 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9365 () Bool)

(declare-fun tp!20015 () Bool)

(assert (=> mapNonEmpty!9365 (= mapRes!9365 (and tp!20015 e!138900))))

(declare-fun mapRest!9365 () (Array (_ BitVec 32) ValueCell!2411))

(declare-fun mapValue!9365 () ValueCell!2411)

(declare-fun mapKey!9365 () (_ BitVec 32))

(assert (=> mapNonEmpty!9365 (= (arr!4845 _values!649) (store mapRest!9365 mapKey!9365 mapValue!9365))))

(assert (= (and start!21220 res!104560) b!213629))

(assert (= (and b!213629 res!104563) b!213628))

(assert (= (and b!213628 res!104565) b!213621))

(assert (= (and b!213621 res!104564) b!213624))

(assert (= (and b!213624 res!104567) b!213622))

(assert (= (and b!213622 res!104566) b!213627))

(assert (= (and b!213627 res!104561) b!213620))

(assert (= (and b!213620 (not res!104562)) b!213619))

(assert (= (and b!213626 condMapEmpty!9365) mapIsEmpty!9365))

(assert (= (and b!213626 (not condMapEmpty!9365)) mapNonEmpty!9365))

(get-info :version)

(assert (= (and mapNonEmpty!9365 ((_ is ValueCellFull!2411) mapValue!9365)) b!213625))

(assert (= (and b!213626 ((_ is ValueCellFull!2411) mapDefault!9365)) b!213623))

(assert (= start!21220 b!213626))

(declare-fun m!241017 () Bool)

(assert (=> mapNonEmpty!9365 m!241017))

(declare-fun m!241019 () Bool)

(assert (=> b!213620 m!241019))

(declare-fun m!241021 () Bool)

(assert (=> b!213620 m!241021))

(declare-fun m!241023 () Bool)

(assert (=> b!213620 m!241023))

(declare-fun m!241025 () Bool)

(assert (=> b!213620 m!241025))

(declare-fun m!241027 () Bool)

(assert (=> b!213620 m!241027))

(declare-fun m!241029 () Bool)

(assert (=> b!213620 m!241029))

(declare-fun m!241031 () Bool)

(assert (=> b!213620 m!241031))

(declare-fun m!241033 () Bool)

(assert (=> b!213628 m!241033))

(declare-fun m!241035 () Bool)

(assert (=> b!213627 m!241035))

(declare-fun m!241037 () Bool)

(assert (=> b!213622 m!241037))

(declare-fun m!241039 () Bool)

(assert (=> start!21220 m!241039))

(declare-fun m!241041 () Bool)

(assert (=> start!21220 m!241041))

(declare-fun m!241043 () Bool)

(assert (=> start!21220 m!241043))

(declare-fun m!241045 () Bool)

(assert (=> b!213619 m!241045))

(declare-fun m!241047 () Bool)

(assert (=> b!213621 m!241047))

(check-sat (not b!213620) (not b!213619) (not b!213622) (not mapNonEmpty!9365) (not start!21220) tp_is_empty!5509 (not b!213621) (not b!213628) (not b_next!5647) b_and!12499)
(check-sat b_and!12499 (not b_next!5647))
(get-model)

(declare-fun b!213704 () Bool)

(declare-fun e!138947 () Bool)

(declare-fun e!138948 () Bool)

(assert (=> b!213704 (= e!138947 e!138948)))

(declare-fun c!35951 () Bool)

(assert (=> b!213704 (= c!35951 (validKeyInArray!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213705 () Bool)

(declare-fun call!20239 () Bool)

(assert (=> b!213705 (= e!138948 call!20239)))

(declare-fun bm!20236 () Bool)

(assert (=> bm!20236 (= call!20239 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!213706 () Bool)

(declare-fun e!138946 () Bool)

(assert (=> b!213706 (= e!138948 e!138946)))

(declare-fun lt!110448 () (_ BitVec 64))

(assert (=> b!213706 (= lt!110448 (select (arr!4846 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110449 () Unit!6438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10215 (_ BitVec 64) (_ BitVec 32)) Unit!6438)

(assert (=> b!213706 (= lt!110449 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!110448 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!213706 (arrayContainsKey!0 _keys!825 lt!110448 #b00000000000000000000000000000000)))

(declare-fun lt!110450 () Unit!6438)

(assert (=> b!213706 (= lt!110450 lt!110449)))

(declare-fun res!104620 () Bool)

(declare-datatypes ((SeekEntryResult!716 0))(
  ( (MissingZero!716 (index!5034 (_ BitVec 32))) (Found!716 (index!5035 (_ BitVec 32))) (Intermediate!716 (undefined!1528 Bool) (index!5036 (_ BitVec 32)) (x!22274 (_ BitVec 32))) (Undefined!716) (MissingVacant!716 (index!5037 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10215 (_ BitVec 32)) SeekEntryResult!716)

(assert (=> b!213706 (= res!104620 (= (seekEntryOrOpen!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!716 #b00000000000000000000000000000000)))))

(assert (=> b!213706 (=> (not res!104620) (not e!138946))))

(declare-fun b!213707 () Bool)

(assert (=> b!213707 (= e!138946 call!20239)))

(declare-fun d!58085 () Bool)

(declare-fun res!104621 () Bool)

(assert (=> d!58085 (=> res!104621 e!138947)))

(assert (=> d!58085 (= res!104621 (bvsge #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(assert (=> d!58085 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138947)))

(assert (= (and d!58085 (not res!104621)) b!213704))

(assert (= (and b!213704 c!35951) b!213706))

(assert (= (and b!213704 (not c!35951)) b!213705))

(assert (= (and b!213706 res!104620) b!213707))

(assert (= (or b!213707 b!213705) bm!20236))

(declare-fun m!241113 () Bool)

(assert (=> b!213704 m!241113))

(assert (=> b!213704 m!241113))

(declare-fun m!241115 () Bool)

(assert (=> b!213704 m!241115))

(declare-fun m!241117 () Bool)

(assert (=> bm!20236 m!241117))

(assert (=> b!213706 m!241113))

(declare-fun m!241119 () Bool)

(assert (=> b!213706 m!241119))

(declare-fun m!241121 () Bool)

(assert (=> b!213706 m!241121))

(assert (=> b!213706 m!241113))

(declare-fun m!241123 () Bool)

(assert (=> b!213706 m!241123))

(assert (=> b!213628 d!58085))

(declare-fun d!58087 () Bool)

(declare-fun e!138951 () Bool)

(assert (=> d!58087 e!138951))

(declare-fun res!104626 () Bool)

(assert (=> d!58087 (=> (not res!104626) (not e!138951))))

(declare-fun lt!110461 () ListLongMap!3105)

(declare-fun contains!1400 (ListLongMap!3105 (_ BitVec 64)) Bool)

(assert (=> d!58087 (= res!104626 (contains!1400 lt!110461 (_1!2112 lt!110379)))))

(declare-fun lt!110459 () List!3109)

(assert (=> d!58087 (= lt!110461 (ListLongMap!3106 lt!110459))))

(declare-fun lt!110460 () Unit!6438)

(declare-fun lt!110462 () Unit!6438)

(assert (=> d!58087 (= lt!110460 lt!110462)))

(declare-datatypes ((Option!262 0))(
  ( (Some!261 (v!4813 V!6993)) (None!260) )
))
(declare-fun getValueByKey!256 (List!3109 (_ BitVec 64)) Option!262)

(assert (=> d!58087 (= (getValueByKey!256 lt!110459 (_1!2112 lt!110379)) (Some!261 (_2!2112 lt!110379)))))

(declare-fun lemmaContainsTupThenGetReturnValue!146 (List!3109 (_ BitVec 64) V!6993) Unit!6438)

(assert (=> d!58087 (= lt!110462 (lemmaContainsTupThenGetReturnValue!146 lt!110459 (_1!2112 lt!110379) (_2!2112 lt!110379)))))

(declare-fun insertStrictlySorted!149 (List!3109 (_ BitVec 64) V!6993) List!3109)

(assert (=> d!58087 (= lt!110459 (insertStrictlySorted!149 (toList!1568 lt!110384) (_1!2112 lt!110379) (_2!2112 lt!110379)))))

(assert (=> d!58087 (= (+!592 lt!110384 lt!110379) lt!110461)))

(declare-fun b!213712 () Bool)

(declare-fun res!104627 () Bool)

(assert (=> b!213712 (=> (not res!104627) (not e!138951))))

(assert (=> b!213712 (= res!104627 (= (getValueByKey!256 (toList!1568 lt!110461) (_1!2112 lt!110379)) (Some!261 (_2!2112 lt!110379))))))

(declare-fun b!213713 () Bool)

(declare-fun contains!1401 (List!3109 tuple2!4202) Bool)

(assert (=> b!213713 (= e!138951 (contains!1401 (toList!1568 lt!110461) lt!110379))))

(assert (= (and d!58087 res!104626) b!213712))

(assert (= (and b!213712 res!104627) b!213713))

(declare-fun m!241125 () Bool)

(assert (=> d!58087 m!241125))

(declare-fun m!241127 () Bool)

(assert (=> d!58087 m!241127))

(declare-fun m!241129 () Bool)

(assert (=> d!58087 m!241129))

(declare-fun m!241131 () Bool)

(assert (=> d!58087 m!241131))

(declare-fun m!241133 () Bool)

(assert (=> b!213712 m!241133))

(declare-fun m!241135 () Bool)

(assert (=> b!213713 m!241135))

(assert (=> b!213619 d!58087))

(declare-fun d!58089 () Bool)

(assert (=> d!58089 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213622 d!58089))

(declare-fun d!58091 () Bool)

(declare-fun res!104636 () Bool)

(declare-fun e!138962 () Bool)

(assert (=> d!58091 (=> res!104636 e!138962)))

(assert (=> d!58091 (= res!104636 (bvsge #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(assert (=> d!58091 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3107) e!138962)))

(declare-fun b!213724 () Bool)

(declare-fun e!138963 () Bool)

(assert (=> b!213724 (= e!138962 e!138963)))

(declare-fun res!104634 () Bool)

(assert (=> b!213724 (=> (not res!104634) (not e!138963))))

(declare-fun e!138961 () Bool)

(assert (=> b!213724 (= res!104634 (not e!138961))))

(declare-fun res!104635 () Bool)

(assert (=> b!213724 (=> (not res!104635) (not e!138961))))

(assert (=> b!213724 (= res!104635 (validKeyInArray!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213725 () Bool)

(declare-fun e!138960 () Bool)

(declare-fun call!20242 () Bool)

(assert (=> b!213725 (= e!138960 call!20242)))

(declare-fun bm!20239 () Bool)

(declare-fun c!35954 () Bool)

(assert (=> bm!20239 (= call!20242 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35954 (Cons!3106 (select (arr!4846 _keys!825) #b00000000000000000000000000000000) Nil!3107) Nil!3107)))))

(declare-fun b!213726 () Bool)

(assert (=> b!213726 (= e!138963 e!138960)))

(assert (=> b!213726 (= c!35954 (validKeyInArray!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213727 () Bool)

(assert (=> b!213727 (= e!138960 call!20242)))

(declare-fun b!213728 () Bool)

(declare-fun contains!1402 (List!3110 (_ BitVec 64)) Bool)

(assert (=> b!213728 (= e!138961 (contains!1402 Nil!3107 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58091 (not res!104636)) b!213724))

(assert (= (and b!213724 res!104635) b!213728))

(assert (= (and b!213724 res!104634) b!213726))

(assert (= (and b!213726 c!35954) b!213725))

(assert (= (and b!213726 (not c!35954)) b!213727))

(assert (= (or b!213725 b!213727) bm!20239))

(assert (=> b!213724 m!241113))

(assert (=> b!213724 m!241113))

(assert (=> b!213724 m!241115))

(assert (=> bm!20239 m!241113))

(declare-fun m!241137 () Bool)

(assert (=> bm!20239 m!241137))

(assert (=> b!213726 m!241113))

(assert (=> b!213726 m!241113))

(assert (=> b!213726 m!241115))

(assert (=> b!213728 m!241113))

(assert (=> b!213728 m!241113))

(declare-fun m!241139 () Bool)

(assert (=> b!213728 m!241139))

(assert (=> b!213621 d!58091))

(declare-fun d!58093 () Bool)

(assert (=> d!58093 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21220 d!58093))

(declare-fun d!58095 () Bool)

(assert (=> d!58095 (= (array_inv!3183 _values!649) (bvsge (size!5171 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21220 d!58095))

(declare-fun d!58097 () Bool)

(assert (=> d!58097 (= (array_inv!3184 _keys!825) (bvsge (size!5172 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21220 d!58097))

(declare-fun d!58099 () Bool)

(declare-fun e!138984 () Bool)

(assert (=> d!58099 e!138984))

(declare-fun res!104648 () Bool)

(assert (=> d!58099 (=> (not res!104648) (not e!138984))))

(declare-fun lt!110483 () ListLongMap!3105)

(assert (=> d!58099 (= res!104648 (not (contains!1400 lt!110483 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!138983 () ListLongMap!3105)

(assert (=> d!58099 (= lt!110483 e!138983)))

(declare-fun c!35963 () Bool)

(assert (=> d!58099 (= c!35963 (bvsge #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(assert (=> d!58099 (validMask!0 mask!1149)))

(assert (=> d!58099 (= (getCurrentListMapNoExtraKeys!514 _keys!825 lt!110385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110483)))

(declare-fun b!213753 () Bool)

(declare-fun e!138978 () ListLongMap!3105)

(declare-fun call!20245 () ListLongMap!3105)

(assert (=> b!213753 (= e!138978 call!20245)))

(declare-fun b!213754 () Bool)

(declare-fun e!138982 () Bool)

(declare-fun isEmpty!505 (ListLongMap!3105) Bool)

(assert (=> b!213754 (= e!138982 (isEmpty!505 lt!110483))))

(declare-fun b!213755 () Bool)

(declare-fun e!138981 () Bool)

(assert (=> b!213755 (= e!138981 (validKeyInArray!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213755 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!213756 () Bool)

(assert (=> b!213756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(assert (=> b!213756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5171 lt!110385)))))

(declare-fun e!138980 () Bool)

(declare-fun apply!200 (ListLongMap!3105 (_ BitVec 64)) V!6993)

(declare-fun get!2586 (ValueCell!2411 V!6993) V!6993)

(declare-fun dynLambda!534 (Int (_ BitVec 64)) V!6993)

(assert (=> b!213756 (= e!138980 (= (apply!200 lt!110483 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)) (get!2586 (select (arr!4845 lt!110385) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213757 () Bool)

(declare-fun e!138979 () Bool)

(assert (=> b!213757 (= e!138979 e!138982)))

(declare-fun c!35965 () Bool)

(assert (=> b!213757 (= c!35965 (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun b!213758 () Bool)

(declare-fun res!104645 () Bool)

(assert (=> b!213758 (=> (not res!104645) (not e!138984))))

(assert (=> b!213758 (= res!104645 (not (contains!1400 lt!110483 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213759 () Bool)

(declare-fun lt!110477 () Unit!6438)

(declare-fun lt!110479 () Unit!6438)

(assert (=> b!213759 (= lt!110477 lt!110479)))

(declare-fun lt!110478 () ListLongMap!3105)

(declare-fun lt!110480 () V!6993)

(declare-fun lt!110482 () (_ BitVec 64))

(declare-fun lt!110481 () (_ BitVec 64))

(assert (=> b!213759 (not (contains!1400 (+!592 lt!110478 (tuple2!4203 lt!110482 lt!110480)) lt!110481))))

(declare-fun addStillNotContains!110 (ListLongMap!3105 (_ BitVec 64) V!6993 (_ BitVec 64)) Unit!6438)

(assert (=> b!213759 (= lt!110479 (addStillNotContains!110 lt!110478 lt!110482 lt!110480 lt!110481))))

(assert (=> b!213759 (= lt!110481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213759 (= lt!110480 (get!2586 (select (arr!4845 lt!110385) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213759 (= lt!110482 (select (arr!4846 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213759 (= lt!110478 call!20245)))

(assert (=> b!213759 (= e!138978 (+!592 call!20245 (tuple2!4203 (select (arr!4846 _keys!825) #b00000000000000000000000000000000) (get!2586 (select (arr!4845 lt!110385) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!20242 () Bool)

(assert (=> bm!20242 (= call!20245 (getCurrentListMapNoExtraKeys!514 _keys!825 lt!110385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213760 () Bool)

(assert (=> b!213760 (= e!138983 (ListLongMap!3106 Nil!3106))))

(declare-fun b!213761 () Bool)

(assert (=> b!213761 (= e!138979 e!138980)))

(assert (=> b!213761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun res!104647 () Bool)

(assert (=> b!213761 (= res!104647 (contains!1400 lt!110483 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213761 (=> (not res!104647) (not e!138980))))

(declare-fun b!213762 () Bool)

(assert (=> b!213762 (= e!138983 e!138978)))

(declare-fun c!35964 () Bool)

(assert (=> b!213762 (= c!35964 (validKeyInArray!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213763 () Bool)

(assert (=> b!213763 (= e!138984 e!138979)))

(declare-fun c!35966 () Bool)

(assert (=> b!213763 (= c!35966 e!138981)))

(declare-fun res!104646 () Bool)

(assert (=> b!213763 (=> (not res!104646) (not e!138981))))

(assert (=> b!213763 (= res!104646 (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun b!213764 () Bool)

(assert (=> b!213764 (= e!138982 (= lt!110483 (getCurrentListMapNoExtraKeys!514 _keys!825 lt!110385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(assert (= (and d!58099 c!35963) b!213760))

(assert (= (and d!58099 (not c!35963)) b!213762))

(assert (= (and b!213762 c!35964) b!213759))

(assert (= (and b!213762 (not c!35964)) b!213753))

(assert (= (or b!213759 b!213753) bm!20242))

(assert (= (and d!58099 res!104648) b!213758))

(assert (= (and b!213758 res!104645) b!213763))

(assert (= (and b!213763 res!104646) b!213755))

(assert (= (and b!213763 c!35966) b!213761))

(assert (= (and b!213763 (not c!35966)) b!213757))

(assert (= (and b!213761 res!104647) b!213756))

(assert (= (and b!213757 c!35965) b!213764))

(assert (= (and b!213757 (not c!35965)) b!213754))

(declare-fun b_lambda!7785 () Bool)

(assert (=> (not b_lambda!7785) (not b!213756)))

(declare-fun t!8058 () Bool)

(declare-fun tb!2905 () Bool)

(assert (=> (and start!21220 (= defaultEntry!657 defaultEntry!657) t!8058) tb!2905))

(declare-fun result!5019 () Bool)

(assert (=> tb!2905 (= result!5019 tp_is_empty!5509)))

(assert (=> b!213756 t!8058))

(declare-fun b_and!12505 () Bool)

(assert (= b_and!12499 (and (=> t!8058 result!5019) b_and!12505)))

(declare-fun b_lambda!7787 () Bool)

(assert (=> (not b_lambda!7787) (not b!213759)))

(assert (=> b!213759 t!8058))

(declare-fun b_and!12507 () Bool)

(assert (= b_and!12505 (and (=> t!8058 result!5019) b_and!12507)))

(declare-fun m!241141 () Bool)

(assert (=> b!213764 m!241141))

(declare-fun m!241143 () Bool)

(assert (=> b!213754 m!241143))

(declare-fun m!241145 () Bool)

(assert (=> d!58099 m!241145))

(assert (=> d!58099 m!241039))

(assert (=> b!213755 m!241113))

(assert (=> b!213755 m!241113))

(assert (=> b!213755 m!241115))

(assert (=> b!213762 m!241113))

(assert (=> b!213762 m!241113))

(assert (=> b!213762 m!241115))

(assert (=> b!213756 m!241113))

(declare-fun m!241147 () Bool)

(assert (=> b!213756 m!241147))

(declare-fun m!241149 () Bool)

(assert (=> b!213756 m!241149))

(assert (=> b!213756 m!241113))

(declare-fun m!241151 () Bool)

(assert (=> b!213756 m!241151))

(assert (=> b!213756 m!241149))

(assert (=> b!213756 m!241147))

(declare-fun m!241153 () Bool)

(assert (=> b!213756 m!241153))

(assert (=> bm!20242 m!241141))

(assert (=> b!213759 m!241113))

(assert (=> b!213759 m!241147))

(declare-fun m!241155 () Bool)

(assert (=> b!213759 m!241155))

(declare-fun m!241157 () Bool)

(assert (=> b!213759 m!241157))

(assert (=> b!213759 m!241149))

(assert (=> b!213759 m!241149))

(assert (=> b!213759 m!241147))

(assert (=> b!213759 m!241153))

(declare-fun m!241159 () Bool)

(assert (=> b!213759 m!241159))

(assert (=> b!213759 m!241155))

(declare-fun m!241161 () Bool)

(assert (=> b!213759 m!241161))

(assert (=> b!213761 m!241113))

(assert (=> b!213761 m!241113))

(declare-fun m!241163 () Bool)

(assert (=> b!213761 m!241163))

(declare-fun m!241165 () Bool)

(assert (=> b!213758 m!241165))

(assert (=> b!213620 d!58099))

(declare-fun d!58101 () Bool)

(declare-fun e!138991 () Bool)

(assert (=> d!58101 e!138991))

(declare-fun res!104652 () Bool)

(assert (=> d!58101 (=> (not res!104652) (not e!138991))))

(declare-fun lt!110490 () ListLongMap!3105)

(assert (=> d!58101 (= res!104652 (not (contains!1400 lt!110490 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!138990 () ListLongMap!3105)

(assert (=> d!58101 (= lt!110490 e!138990)))

(declare-fun c!35967 () Bool)

(assert (=> d!58101 (= c!35967 (bvsge #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(assert (=> d!58101 (validMask!0 mask!1149)))

(assert (=> d!58101 (= (getCurrentListMapNoExtraKeys!514 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110490)))

(declare-fun b!213767 () Bool)

(declare-fun e!138985 () ListLongMap!3105)

(declare-fun call!20246 () ListLongMap!3105)

(assert (=> b!213767 (= e!138985 call!20246)))

(declare-fun b!213768 () Bool)

(declare-fun e!138989 () Bool)

(assert (=> b!213768 (= e!138989 (isEmpty!505 lt!110490))))

(declare-fun b!213769 () Bool)

(declare-fun e!138988 () Bool)

(assert (=> b!213769 (= e!138988 (validKeyInArray!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213769 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!213770 () Bool)

(assert (=> b!213770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(assert (=> b!213770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5171 _values!649)))))

(declare-fun e!138987 () Bool)

(assert (=> b!213770 (= e!138987 (= (apply!200 lt!110490 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)) (get!2586 (select (arr!4845 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213771 () Bool)

(declare-fun e!138986 () Bool)

(assert (=> b!213771 (= e!138986 e!138989)))

(declare-fun c!35969 () Bool)

(assert (=> b!213771 (= c!35969 (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun b!213772 () Bool)

(declare-fun res!104649 () Bool)

(assert (=> b!213772 (=> (not res!104649) (not e!138991))))

(assert (=> b!213772 (= res!104649 (not (contains!1400 lt!110490 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213773 () Bool)

(declare-fun lt!110484 () Unit!6438)

(declare-fun lt!110486 () Unit!6438)

(assert (=> b!213773 (= lt!110484 lt!110486)))

(declare-fun lt!110487 () V!6993)

(declare-fun lt!110485 () ListLongMap!3105)

(declare-fun lt!110488 () (_ BitVec 64))

(declare-fun lt!110489 () (_ BitVec 64))

(assert (=> b!213773 (not (contains!1400 (+!592 lt!110485 (tuple2!4203 lt!110489 lt!110487)) lt!110488))))

(assert (=> b!213773 (= lt!110486 (addStillNotContains!110 lt!110485 lt!110489 lt!110487 lt!110488))))

(assert (=> b!213773 (= lt!110488 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213773 (= lt!110487 (get!2586 (select (arr!4845 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213773 (= lt!110489 (select (arr!4846 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213773 (= lt!110485 call!20246)))

(assert (=> b!213773 (= e!138985 (+!592 call!20246 (tuple2!4203 (select (arr!4846 _keys!825) #b00000000000000000000000000000000) (get!2586 (select (arr!4845 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!20243 () Bool)

(assert (=> bm!20243 (= call!20246 (getCurrentListMapNoExtraKeys!514 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213774 () Bool)

(assert (=> b!213774 (= e!138990 (ListLongMap!3106 Nil!3106))))

(declare-fun b!213775 () Bool)

(assert (=> b!213775 (= e!138986 e!138987)))

(assert (=> b!213775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun res!104651 () Bool)

(assert (=> b!213775 (= res!104651 (contains!1400 lt!110490 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213775 (=> (not res!104651) (not e!138987))))

(declare-fun b!213776 () Bool)

(assert (=> b!213776 (= e!138990 e!138985)))

(declare-fun c!35968 () Bool)

(assert (=> b!213776 (= c!35968 (validKeyInArray!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213777 () Bool)

(assert (=> b!213777 (= e!138991 e!138986)))

(declare-fun c!35970 () Bool)

(assert (=> b!213777 (= c!35970 e!138988)))

(declare-fun res!104650 () Bool)

(assert (=> b!213777 (=> (not res!104650) (not e!138988))))

(assert (=> b!213777 (= res!104650 (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun b!213778 () Bool)

(assert (=> b!213778 (= e!138989 (= lt!110490 (getCurrentListMapNoExtraKeys!514 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(assert (= (and d!58101 c!35967) b!213774))

(assert (= (and d!58101 (not c!35967)) b!213776))

(assert (= (and b!213776 c!35968) b!213773))

(assert (= (and b!213776 (not c!35968)) b!213767))

(assert (= (or b!213773 b!213767) bm!20243))

(assert (= (and d!58101 res!104652) b!213772))

(assert (= (and b!213772 res!104649) b!213777))

(assert (= (and b!213777 res!104650) b!213769))

(assert (= (and b!213777 c!35970) b!213775))

(assert (= (and b!213777 (not c!35970)) b!213771))

(assert (= (and b!213775 res!104651) b!213770))

(assert (= (and b!213771 c!35969) b!213778))

(assert (= (and b!213771 (not c!35969)) b!213768))

(declare-fun b_lambda!7789 () Bool)

(assert (=> (not b_lambda!7789) (not b!213770)))

(assert (=> b!213770 t!8058))

(declare-fun b_and!12509 () Bool)

(assert (= b_and!12507 (and (=> t!8058 result!5019) b_and!12509)))

(declare-fun b_lambda!7791 () Bool)

(assert (=> (not b_lambda!7791) (not b!213773)))

(assert (=> b!213773 t!8058))

(declare-fun b_and!12511 () Bool)

(assert (= b_and!12509 (and (=> t!8058 result!5019) b_and!12511)))

(declare-fun m!241167 () Bool)

(assert (=> b!213778 m!241167))

(declare-fun m!241169 () Bool)

(assert (=> b!213768 m!241169))

(declare-fun m!241171 () Bool)

(assert (=> d!58101 m!241171))

(assert (=> d!58101 m!241039))

(assert (=> b!213769 m!241113))

(assert (=> b!213769 m!241113))

(assert (=> b!213769 m!241115))

(assert (=> b!213776 m!241113))

(assert (=> b!213776 m!241113))

(assert (=> b!213776 m!241115))

(assert (=> b!213770 m!241113))

(assert (=> b!213770 m!241147))

(declare-fun m!241173 () Bool)

(assert (=> b!213770 m!241173))

(assert (=> b!213770 m!241113))

(declare-fun m!241175 () Bool)

(assert (=> b!213770 m!241175))

(assert (=> b!213770 m!241173))

(assert (=> b!213770 m!241147))

(declare-fun m!241177 () Bool)

(assert (=> b!213770 m!241177))

(assert (=> bm!20243 m!241167))

(assert (=> b!213773 m!241113))

(assert (=> b!213773 m!241147))

(declare-fun m!241179 () Bool)

(assert (=> b!213773 m!241179))

(declare-fun m!241181 () Bool)

(assert (=> b!213773 m!241181))

(assert (=> b!213773 m!241173))

(assert (=> b!213773 m!241173))

(assert (=> b!213773 m!241147))

(assert (=> b!213773 m!241177))

(declare-fun m!241183 () Bool)

(assert (=> b!213773 m!241183))

(assert (=> b!213773 m!241179))

(declare-fun m!241185 () Bool)

(assert (=> b!213773 m!241185))

(assert (=> b!213775 m!241113))

(assert (=> b!213775 m!241113))

(declare-fun m!241187 () Bool)

(assert (=> b!213775 m!241187))

(declare-fun m!241189 () Bool)

(assert (=> b!213772 m!241189))

(assert (=> b!213620 d!58101))

(declare-fun d!58103 () Bool)

(declare-fun e!139025 () Bool)

(assert (=> d!58103 e!139025))

(declare-fun res!104674 () Bool)

(assert (=> d!58103 (=> (not res!104674) (not e!139025))))

(assert (=> d!58103 (= res!104674 (or (bvsge #b00000000000000000000000000000000 (size!5172 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))))

(declare-fun lt!110539 () ListLongMap!3105)

(declare-fun lt!110555 () ListLongMap!3105)

(assert (=> d!58103 (= lt!110539 lt!110555)))

(declare-fun lt!110543 () Unit!6438)

(declare-fun e!139026 () Unit!6438)

(assert (=> d!58103 (= lt!110543 e!139026)))

(declare-fun c!35987 () Bool)

(declare-fun e!139021 () Bool)

(assert (=> d!58103 (= c!35987 e!139021)))

(declare-fun res!104672 () Bool)

(assert (=> d!58103 (=> (not res!104672) (not e!139021))))

(assert (=> d!58103 (= res!104672 (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun e!139018 () ListLongMap!3105)

(assert (=> d!58103 (= lt!110555 e!139018)))

(declare-fun c!35986 () Bool)

(assert (=> d!58103 (= c!35986 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58103 (validMask!0 mask!1149)))

(assert (=> d!58103 (= (getCurrentListMap!1077 _keys!825 lt!110385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110539)))

(declare-fun b!213821 () Bool)

(declare-fun e!139020 () Bool)

(declare-fun e!139027 () Bool)

(assert (=> b!213821 (= e!139020 e!139027)))

(declare-fun res!104679 () Bool)

(declare-fun call!20263 () Bool)

(assert (=> b!213821 (= res!104679 call!20263)))

(assert (=> b!213821 (=> (not res!104679) (not e!139027))))

(declare-fun b!213822 () Bool)

(declare-fun res!104675 () Bool)

(assert (=> b!213822 (=> (not res!104675) (not e!139025))))

(assert (=> b!213822 (= res!104675 e!139020)))

(declare-fun c!35985 () Bool)

(assert (=> b!213822 (= c!35985 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!213823 () Bool)

(declare-fun e!139022 () Bool)

(assert (=> b!213823 (= e!139025 e!139022)))

(declare-fun c!35984 () Bool)

(assert (=> b!213823 (= c!35984 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213824 () Bool)

(declare-fun e!139019 () Bool)

(assert (=> b!213824 (= e!139019 (= (apply!200 lt!110539 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!213825 () Bool)

(declare-fun e!139024 () Bool)

(assert (=> b!213825 (= e!139024 (validKeyInArray!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213826 () Bool)

(declare-fun e!139023 () ListLongMap!3105)

(declare-fun call!20266 () ListLongMap!3105)

(assert (=> b!213826 (= e!139023 call!20266)))

(declare-fun b!213827 () Bool)

(declare-fun c!35983 () Bool)

(assert (=> b!213827 (= c!35983 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!139028 () ListLongMap!3105)

(assert (=> b!213827 (= e!139028 e!139023)))

(declare-fun bm!20258 () Bool)

(declare-fun call!20264 () ListLongMap!3105)

(declare-fun call!20261 () ListLongMap!3105)

(assert (=> bm!20258 (= call!20264 call!20261)))

(declare-fun b!213828 () Bool)

(assert (=> b!213828 (= e!139028 call!20264)))

(declare-fun bm!20259 () Bool)

(declare-fun call!20265 () ListLongMap!3105)

(declare-fun call!20262 () ListLongMap!3105)

(assert (=> bm!20259 (= call!20265 call!20262)))

(declare-fun bm!20260 () Bool)

(declare-fun c!35988 () Bool)

(assert (=> bm!20260 (= call!20261 (+!592 (ite c!35986 call!20262 (ite c!35988 call!20265 call!20266)) (ite (or c!35986 c!35988) (tuple2!4203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!213829 () Bool)

(declare-fun e!139029 () Bool)

(declare-fun e!139030 () Bool)

(assert (=> b!213829 (= e!139029 e!139030)))

(declare-fun res!104677 () Bool)

(assert (=> b!213829 (=> (not res!104677) (not e!139030))))

(assert (=> b!213829 (= res!104677 (contains!1400 lt!110539 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun b!213830 () Bool)

(assert (=> b!213830 (= e!139030 (= (apply!200 lt!110539 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)) (get!2586 (select (arr!4845 lt!110385) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5171 lt!110385)))))

(assert (=> b!213830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun bm!20261 () Bool)

(declare-fun call!20267 () Bool)

(assert (=> bm!20261 (= call!20267 (contains!1400 lt!110539 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20262 () Bool)

(assert (=> bm!20262 (= call!20266 call!20265)))

(declare-fun b!213831 () Bool)

(assert (=> b!213831 (= e!139022 e!139019)))

(declare-fun res!104671 () Bool)

(assert (=> b!213831 (= res!104671 call!20267)))

(assert (=> b!213831 (=> (not res!104671) (not e!139019))))

(declare-fun b!213832 () Bool)

(assert (=> b!213832 (= e!139020 (not call!20263))))

(declare-fun b!213833 () Bool)

(assert (=> b!213833 (= e!139018 e!139028)))

(assert (=> b!213833 (= c!35988 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20263 () Bool)

(assert (=> bm!20263 (= call!20263 (contains!1400 lt!110539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213834 () Bool)

(assert (=> b!213834 (= e!139027 (= (apply!200 lt!110539 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213835 () Bool)

(assert (=> b!213835 (= e!139023 call!20264)))

(declare-fun b!213836 () Bool)

(declare-fun lt!110554 () Unit!6438)

(assert (=> b!213836 (= e!139026 lt!110554)))

(declare-fun lt!110537 () ListLongMap!3105)

(assert (=> b!213836 (= lt!110537 (getCurrentListMapNoExtraKeys!514 _keys!825 lt!110385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110544 () (_ BitVec 64))

(assert (=> b!213836 (= lt!110544 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110546 () (_ BitVec 64))

(assert (=> b!213836 (= lt!110546 (select (arr!4846 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110541 () Unit!6438)

(declare-fun addStillContains!176 (ListLongMap!3105 (_ BitVec 64) V!6993 (_ BitVec 64)) Unit!6438)

(assert (=> b!213836 (= lt!110541 (addStillContains!176 lt!110537 lt!110544 zeroValue!615 lt!110546))))

(assert (=> b!213836 (contains!1400 (+!592 lt!110537 (tuple2!4203 lt!110544 zeroValue!615)) lt!110546)))

(declare-fun lt!110540 () Unit!6438)

(assert (=> b!213836 (= lt!110540 lt!110541)))

(declare-fun lt!110556 () ListLongMap!3105)

(assert (=> b!213836 (= lt!110556 (getCurrentListMapNoExtraKeys!514 _keys!825 lt!110385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110548 () (_ BitVec 64))

(assert (=> b!213836 (= lt!110548 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110535 () (_ BitVec 64))

(assert (=> b!213836 (= lt!110535 (select (arr!4846 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110538 () Unit!6438)

(declare-fun addApplyDifferent!176 (ListLongMap!3105 (_ BitVec 64) V!6993 (_ BitVec 64)) Unit!6438)

(assert (=> b!213836 (= lt!110538 (addApplyDifferent!176 lt!110556 lt!110548 minValue!615 lt!110535))))

(assert (=> b!213836 (= (apply!200 (+!592 lt!110556 (tuple2!4203 lt!110548 minValue!615)) lt!110535) (apply!200 lt!110556 lt!110535))))

(declare-fun lt!110553 () Unit!6438)

(assert (=> b!213836 (= lt!110553 lt!110538)))

(declare-fun lt!110547 () ListLongMap!3105)

(assert (=> b!213836 (= lt!110547 (getCurrentListMapNoExtraKeys!514 _keys!825 lt!110385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110551 () (_ BitVec 64))

(assert (=> b!213836 (= lt!110551 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110545 () (_ BitVec 64))

(assert (=> b!213836 (= lt!110545 (select (arr!4846 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110550 () Unit!6438)

(assert (=> b!213836 (= lt!110550 (addApplyDifferent!176 lt!110547 lt!110551 zeroValue!615 lt!110545))))

(assert (=> b!213836 (= (apply!200 (+!592 lt!110547 (tuple2!4203 lt!110551 zeroValue!615)) lt!110545) (apply!200 lt!110547 lt!110545))))

(declare-fun lt!110552 () Unit!6438)

(assert (=> b!213836 (= lt!110552 lt!110550)))

(declare-fun lt!110536 () ListLongMap!3105)

(assert (=> b!213836 (= lt!110536 (getCurrentListMapNoExtraKeys!514 _keys!825 lt!110385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110549 () (_ BitVec 64))

(assert (=> b!213836 (= lt!110549 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110542 () (_ BitVec 64))

(assert (=> b!213836 (= lt!110542 (select (arr!4846 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213836 (= lt!110554 (addApplyDifferent!176 lt!110536 lt!110549 minValue!615 lt!110542))))

(assert (=> b!213836 (= (apply!200 (+!592 lt!110536 (tuple2!4203 lt!110549 minValue!615)) lt!110542) (apply!200 lt!110536 lt!110542))))

(declare-fun b!213837 () Bool)

(assert (=> b!213837 (= e!139022 (not call!20267))))

(declare-fun b!213838 () Bool)

(declare-fun res!104678 () Bool)

(assert (=> b!213838 (=> (not res!104678) (not e!139025))))

(assert (=> b!213838 (= res!104678 e!139029)))

(declare-fun res!104673 () Bool)

(assert (=> b!213838 (=> res!104673 e!139029)))

(assert (=> b!213838 (= res!104673 (not e!139024))))

(declare-fun res!104676 () Bool)

(assert (=> b!213838 (=> (not res!104676) (not e!139024))))

(assert (=> b!213838 (= res!104676 (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun b!213839 () Bool)

(assert (=> b!213839 (= e!139021 (validKeyInArray!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213840 () Bool)

(assert (=> b!213840 (= e!139018 (+!592 call!20261 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20264 () Bool)

(assert (=> bm!20264 (= call!20262 (getCurrentListMapNoExtraKeys!514 _keys!825 lt!110385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213841 () Bool)

(declare-fun Unit!6444 () Unit!6438)

(assert (=> b!213841 (= e!139026 Unit!6444)))

(assert (= (and d!58103 c!35986) b!213840))

(assert (= (and d!58103 (not c!35986)) b!213833))

(assert (= (and b!213833 c!35988) b!213828))

(assert (= (and b!213833 (not c!35988)) b!213827))

(assert (= (and b!213827 c!35983) b!213835))

(assert (= (and b!213827 (not c!35983)) b!213826))

(assert (= (or b!213835 b!213826) bm!20262))

(assert (= (or b!213828 bm!20262) bm!20259))

(assert (= (or b!213828 b!213835) bm!20258))

(assert (= (or b!213840 bm!20259) bm!20264))

(assert (= (or b!213840 bm!20258) bm!20260))

(assert (= (and d!58103 res!104672) b!213839))

(assert (= (and d!58103 c!35987) b!213836))

(assert (= (and d!58103 (not c!35987)) b!213841))

(assert (= (and d!58103 res!104674) b!213838))

(assert (= (and b!213838 res!104676) b!213825))

(assert (= (and b!213838 (not res!104673)) b!213829))

(assert (= (and b!213829 res!104677) b!213830))

(assert (= (and b!213838 res!104678) b!213822))

(assert (= (and b!213822 c!35985) b!213821))

(assert (= (and b!213822 (not c!35985)) b!213832))

(assert (= (and b!213821 res!104679) b!213834))

(assert (= (or b!213821 b!213832) bm!20263))

(assert (= (and b!213822 res!104675) b!213823))

(assert (= (and b!213823 c!35984) b!213831))

(assert (= (and b!213823 (not c!35984)) b!213837))

(assert (= (and b!213831 res!104671) b!213824))

(assert (= (or b!213831 b!213837) bm!20261))

(declare-fun b_lambda!7793 () Bool)

(assert (=> (not b_lambda!7793) (not b!213830)))

(assert (=> b!213830 t!8058))

(declare-fun b_and!12513 () Bool)

(assert (= b_and!12511 (and (=> t!8058 result!5019) b_and!12513)))

(assert (=> bm!20264 m!241023))

(assert (=> b!213829 m!241113))

(assert (=> b!213829 m!241113))

(declare-fun m!241191 () Bool)

(assert (=> b!213829 m!241191))

(assert (=> b!213830 m!241147))

(assert (=> b!213830 m!241113))

(assert (=> b!213830 m!241113))

(declare-fun m!241193 () Bool)

(assert (=> b!213830 m!241193))

(assert (=> b!213830 m!241149))

(assert (=> b!213830 m!241147))

(assert (=> b!213830 m!241153))

(assert (=> b!213830 m!241149))

(declare-fun m!241195 () Bool)

(assert (=> b!213840 m!241195))

(declare-fun m!241197 () Bool)

(assert (=> b!213834 m!241197))

(declare-fun m!241199 () Bool)

(assert (=> b!213836 m!241199))

(assert (=> b!213836 m!241023))

(declare-fun m!241201 () Bool)

(assert (=> b!213836 m!241201))

(declare-fun m!241203 () Bool)

(assert (=> b!213836 m!241203))

(declare-fun m!241205 () Bool)

(assert (=> b!213836 m!241205))

(assert (=> b!213836 m!241199))

(declare-fun m!241207 () Bool)

(assert (=> b!213836 m!241207))

(declare-fun m!241209 () Bool)

(assert (=> b!213836 m!241209))

(declare-fun m!241211 () Bool)

(assert (=> b!213836 m!241211))

(assert (=> b!213836 m!241209))

(declare-fun m!241213 () Bool)

(assert (=> b!213836 m!241213))

(assert (=> b!213836 m!241113))

(declare-fun m!241215 () Bool)

(assert (=> b!213836 m!241215))

(assert (=> b!213836 m!241205))

(declare-fun m!241217 () Bool)

(assert (=> b!213836 m!241217))

(declare-fun m!241219 () Bool)

(assert (=> b!213836 m!241219))

(declare-fun m!241221 () Bool)

(assert (=> b!213836 m!241221))

(declare-fun m!241223 () Bool)

(assert (=> b!213836 m!241223))

(declare-fun m!241225 () Bool)

(assert (=> b!213836 m!241225))

(assert (=> b!213836 m!241219))

(declare-fun m!241227 () Bool)

(assert (=> b!213836 m!241227))

(declare-fun m!241229 () Bool)

(assert (=> b!213824 m!241229))

(assert (=> b!213825 m!241113))

(assert (=> b!213825 m!241113))

(assert (=> b!213825 m!241115))

(declare-fun m!241231 () Bool)

(assert (=> bm!20263 m!241231))

(declare-fun m!241233 () Bool)

(assert (=> bm!20261 m!241233))

(assert (=> b!213839 m!241113))

(assert (=> b!213839 m!241113))

(assert (=> b!213839 m!241115))

(declare-fun m!241235 () Bool)

(assert (=> bm!20260 m!241235))

(assert (=> d!58103 m!241039))

(assert (=> b!213620 d!58103))

(declare-fun call!20272 () ListLongMap!3105)

(declare-fun bm!20269 () Bool)

(assert (=> bm!20269 (= call!20272 (getCurrentListMapNoExtraKeys!514 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213849 () Bool)

(declare-fun e!139036 () Bool)

(declare-fun call!20273 () ListLongMap!3105)

(assert (=> b!213849 (= e!139036 (= call!20273 call!20272))))

(declare-fun bm!20270 () Bool)

(assert (=> bm!20270 (= call!20273 (getCurrentListMapNoExtraKeys!514 _keys!825 (array!10214 (store (arr!4845 _values!649) i!601 (ValueCellFull!2411 v!520)) (size!5171 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213850 () Bool)

(assert (=> b!213850 (= e!139036 (= call!20273 (+!592 call!20272 (tuple2!4203 k0!843 v!520))))))

(declare-fun d!58105 () Bool)

(declare-fun e!139035 () Bool)

(assert (=> d!58105 e!139035))

(declare-fun res!104682 () Bool)

(assert (=> d!58105 (=> (not res!104682) (not e!139035))))

(assert (=> d!58105 (= res!104682 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5171 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5171 _values!649))))))))

(declare-fun lt!110559 () Unit!6438)

(declare-fun choose!1091 (array!10215 array!10213 (_ BitVec 32) (_ BitVec 32) V!6993 V!6993 (_ BitVec 32) (_ BitVec 64) V!6993 (_ BitVec 32) Int) Unit!6438)

(assert (=> d!58105 (= lt!110559 (choose!1091 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58105 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(assert (=> d!58105 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!238 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!110559)))

(declare-fun b!213848 () Bool)

(assert (=> b!213848 (= e!139035 e!139036)))

(declare-fun c!35991 () Bool)

(assert (=> b!213848 (= c!35991 (bvsle #b00000000000000000000000000000000 i!601))))

(assert (= (and d!58105 res!104682) b!213848))

(assert (= (and b!213848 c!35991) b!213850))

(assert (= (and b!213848 (not c!35991)) b!213849))

(assert (= (or b!213850 b!213849) bm!20270))

(assert (= (or b!213850 b!213849) bm!20269))

(assert (=> bm!20269 m!241027))

(assert (=> bm!20270 m!241019))

(declare-fun m!241237 () Bool)

(assert (=> bm!20270 m!241237))

(declare-fun m!241239 () Bool)

(assert (=> b!213850 m!241239))

(declare-fun m!241241 () Bool)

(assert (=> d!58105 m!241241))

(assert (=> b!213620 d!58105))

(declare-fun d!58107 () Bool)

(declare-fun e!139037 () Bool)

(assert (=> d!58107 e!139037))

(declare-fun res!104683 () Bool)

(assert (=> d!58107 (=> (not res!104683) (not e!139037))))

(declare-fun lt!110562 () ListLongMap!3105)

(assert (=> d!58107 (= res!104683 (contains!1400 lt!110562 (_1!2112 lt!110379)))))

(declare-fun lt!110560 () List!3109)

(assert (=> d!58107 (= lt!110562 (ListLongMap!3106 lt!110560))))

(declare-fun lt!110561 () Unit!6438)

(declare-fun lt!110563 () Unit!6438)

(assert (=> d!58107 (= lt!110561 lt!110563)))

(assert (=> d!58107 (= (getValueByKey!256 lt!110560 (_1!2112 lt!110379)) (Some!261 (_2!2112 lt!110379)))))

(assert (=> d!58107 (= lt!110563 (lemmaContainsTupThenGetReturnValue!146 lt!110560 (_1!2112 lt!110379) (_2!2112 lt!110379)))))

(assert (=> d!58107 (= lt!110560 (insertStrictlySorted!149 (toList!1568 lt!110387) (_1!2112 lt!110379) (_2!2112 lt!110379)))))

(assert (=> d!58107 (= (+!592 lt!110387 lt!110379) lt!110562)))

(declare-fun b!213851 () Bool)

(declare-fun res!104684 () Bool)

(assert (=> b!213851 (=> (not res!104684) (not e!139037))))

(assert (=> b!213851 (= res!104684 (= (getValueByKey!256 (toList!1568 lt!110562) (_1!2112 lt!110379)) (Some!261 (_2!2112 lt!110379))))))

(declare-fun b!213852 () Bool)

(assert (=> b!213852 (= e!139037 (contains!1401 (toList!1568 lt!110562) lt!110379))))

(assert (= (and d!58107 res!104683) b!213851))

(assert (= (and b!213851 res!104684) b!213852))

(declare-fun m!241243 () Bool)

(assert (=> d!58107 m!241243))

(declare-fun m!241245 () Bool)

(assert (=> d!58107 m!241245))

(declare-fun m!241247 () Bool)

(assert (=> d!58107 m!241247))

(declare-fun m!241249 () Bool)

(assert (=> d!58107 m!241249))

(declare-fun m!241251 () Bool)

(assert (=> b!213851 m!241251))

(declare-fun m!241253 () Bool)

(assert (=> b!213852 m!241253))

(assert (=> b!213620 d!58107))

(declare-fun d!58109 () Bool)

(declare-fun e!139045 () Bool)

(assert (=> d!58109 e!139045))

(declare-fun res!104688 () Bool)

(assert (=> d!58109 (=> (not res!104688) (not e!139045))))

(assert (=> d!58109 (= res!104688 (or (bvsge #b00000000000000000000000000000000 (size!5172 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))))

(declare-fun lt!110568 () ListLongMap!3105)

(declare-fun lt!110584 () ListLongMap!3105)

(assert (=> d!58109 (= lt!110568 lt!110584)))

(declare-fun lt!110572 () Unit!6438)

(declare-fun e!139046 () Unit!6438)

(assert (=> d!58109 (= lt!110572 e!139046)))

(declare-fun c!35996 () Bool)

(declare-fun e!139041 () Bool)

(assert (=> d!58109 (= c!35996 e!139041)))

(declare-fun res!104686 () Bool)

(assert (=> d!58109 (=> (not res!104686) (not e!139041))))

(assert (=> d!58109 (= res!104686 (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun e!139038 () ListLongMap!3105)

(assert (=> d!58109 (= lt!110584 e!139038)))

(declare-fun c!35995 () Bool)

(assert (=> d!58109 (= c!35995 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58109 (validMask!0 mask!1149)))

(assert (=> d!58109 (= (getCurrentListMap!1077 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110568)))

(declare-fun b!213853 () Bool)

(declare-fun e!139040 () Bool)

(declare-fun e!139047 () Bool)

(assert (=> b!213853 (= e!139040 e!139047)))

(declare-fun res!104693 () Bool)

(declare-fun call!20276 () Bool)

(assert (=> b!213853 (= res!104693 call!20276)))

(assert (=> b!213853 (=> (not res!104693) (not e!139047))))

(declare-fun b!213854 () Bool)

(declare-fun res!104689 () Bool)

(assert (=> b!213854 (=> (not res!104689) (not e!139045))))

(assert (=> b!213854 (= res!104689 e!139040)))

(declare-fun c!35994 () Bool)

(assert (=> b!213854 (= c!35994 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!213855 () Bool)

(declare-fun e!139042 () Bool)

(assert (=> b!213855 (= e!139045 e!139042)))

(declare-fun c!35993 () Bool)

(assert (=> b!213855 (= c!35993 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213856 () Bool)

(declare-fun e!139039 () Bool)

(assert (=> b!213856 (= e!139039 (= (apply!200 lt!110568 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!213857 () Bool)

(declare-fun e!139044 () Bool)

(assert (=> b!213857 (= e!139044 (validKeyInArray!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213858 () Bool)

(declare-fun e!139043 () ListLongMap!3105)

(declare-fun call!20279 () ListLongMap!3105)

(assert (=> b!213858 (= e!139043 call!20279)))

(declare-fun b!213859 () Bool)

(declare-fun c!35992 () Bool)

(assert (=> b!213859 (= c!35992 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!139048 () ListLongMap!3105)

(assert (=> b!213859 (= e!139048 e!139043)))

(declare-fun bm!20271 () Bool)

(declare-fun call!20277 () ListLongMap!3105)

(declare-fun call!20274 () ListLongMap!3105)

(assert (=> bm!20271 (= call!20277 call!20274)))

(declare-fun b!213860 () Bool)

(assert (=> b!213860 (= e!139048 call!20277)))

(declare-fun bm!20272 () Bool)

(declare-fun call!20278 () ListLongMap!3105)

(declare-fun call!20275 () ListLongMap!3105)

(assert (=> bm!20272 (= call!20278 call!20275)))

(declare-fun bm!20273 () Bool)

(declare-fun c!35997 () Bool)

(assert (=> bm!20273 (= call!20274 (+!592 (ite c!35995 call!20275 (ite c!35997 call!20278 call!20279)) (ite (or c!35995 c!35997) (tuple2!4203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!213861 () Bool)

(declare-fun e!139049 () Bool)

(declare-fun e!139050 () Bool)

(assert (=> b!213861 (= e!139049 e!139050)))

(declare-fun res!104691 () Bool)

(assert (=> b!213861 (=> (not res!104691) (not e!139050))))

(assert (=> b!213861 (= res!104691 (contains!1400 lt!110568 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun b!213862 () Bool)

(assert (=> b!213862 (= e!139050 (= (apply!200 lt!110568 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)) (get!2586 (select (arr!4845 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213862 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5171 _values!649)))))

(assert (=> b!213862 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun bm!20274 () Bool)

(declare-fun call!20280 () Bool)

(assert (=> bm!20274 (= call!20280 (contains!1400 lt!110568 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20275 () Bool)

(assert (=> bm!20275 (= call!20279 call!20278)))

(declare-fun b!213863 () Bool)

(assert (=> b!213863 (= e!139042 e!139039)))

(declare-fun res!104685 () Bool)

(assert (=> b!213863 (= res!104685 call!20280)))

(assert (=> b!213863 (=> (not res!104685) (not e!139039))))

(declare-fun b!213864 () Bool)

(assert (=> b!213864 (= e!139040 (not call!20276))))

(declare-fun b!213865 () Bool)

(assert (=> b!213865 (= e!139038 e!139048)))

(assert (=> b!213865 (= c!35997 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20276 () Bool)

(assert (=> bm!20276 (= call!20276 (contains!1400 lt!110568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213866 () Bool)

(assert (=> b!213866 (= e!139047 (= (apply!200 lt!110568 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213867 () Bool)

(assert (=> b!213867 (= e!139043 call!20277)))

(declare-fun b!213868 () Bool)

(declare-fun lt!110583 () Unit!6438)

(assert (=> b!213868 (= e!139046 lt!110583)))

(declare-fun lt!110566 () ListLongMap!3105)

(assert (=> b!213868 (= lt!110566 (getCurrentListMapNoExtraKeys!514 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110573 () (_ BitVec 64))

(assert (=> b!213868 (= lt!110573 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110575 () (_ BitVec 64))

(assert (=> b!213868 (= lt!110575 (select (arr!4846 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110570 () Unit!6438)

(assert (=> b!213868 (= lt!110570 (addStillContains!176 lt!110566 lt!110573 zeroValue!615 lt!110575))))

(assert (=> b!213868 (contains!1400 (+!592 lt!110566 (tuple2!4203 lt!110573 zeroValue!615)) lt!110575)))

(declare-fun lt!110569 () Unit!6438)

(assert (=> b!213868 (= lt!110569 lt!110570)))

(declare-fun lt!110585 () ListLongMap!3105)

(assert (=> b!213868 (= lt!110585 (getCurrentListMapNoExtraKeys!514 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110577 () (_ BitVec 64))

(assert (=> b!213868 (= lt!110577 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110564 () (_ BitVec 64))

(assert (=> b!213868 (= lt!110564 (select (arr!4846 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110567 () Unit!6438)

(assert (=> b!213868 (= lt!110567 (addApplyDifferent!176 lt!110585 lt!110577 minValue!615 lt!110564))))

(assert (=> b!213868 (= (apply!200 (+!592 lt!110585 (tuple2!4203 lt!110577 minValue!615)) lt!110564) (apply!200 lt!110585 lt!110564))))

(declare-fun lt!110582 () Unit!6438)

(assert (=> b!213868 (= lt!110582 lt!110567)))

(declare-fun lt!110576 () ListLongMap!3105)

(assert (=> b!213868 (= lt!110576 (getCurrentListMapNoExtraKeys!514 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110580 () (_ BitVec 64))

(assert (=> b!213868 (= lt!110580 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110574 () (_ BitVec 64))

(assert (=> b!213868 (= lt!110574 (select (arr!4846 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110579 () Unit!6438)

(assert (=> b!213868 (= lt!110579 (addApplyDifferent!176 lt!110576 lt!110580 zeroValue!615 lt!110574))))

(assert (=> b!213868 (= (apply!200 (+!592 lt!110576 (tuple2!4203 lt!110580 zeroValue!615)) lt!110574) (apply!200 lt!110576 lt!110574))))

(declare-fun lt!110581 () Unit!6438)

(assert (=> b!213868 (= lt!110581 lt!110579)))

(declare-fun lt!110565 () ListLongMap!3105)

(assert (=> b!213868 (= lt!110565 (getCurrentListMapNoExtraKeys!514 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110578 () (_ BitVec 64))

(assert (=> b!213868 (= lt!110578 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110571 () (_ BitVec 64))

(assert (=> b!213868 (= lt!110571 (select (arr!4846 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213868 (= lt!110583 (addApplyDifferent!176 lt!110565 lt!110578 minValue!615 lt!110571))))

(assert (=> b!213868 (= (apply!200 (+!592 lt!110565 (tuple2!4203 lt!110578 minValue!615)) lt!110571) (apply!200 lt!110565 lt!110571))))

(declare-fun b!213869 () Bool)

(assert (=> b!213869 (= e!139042 (not call!20280))))

(declare-fun b!213870 () Bool)

(declare-fun res!104692 () Bool)

(assert (=> b!213870 (=> (not res!104692) (not e!139045))))

(assert (=> b!213870 (= res!104692 e!139049)))

(declare-fun res!104687 () Bool)

(assert (=> b!213870 (=> res!104687 e!139049)))

(assert (=> b!213870 (= res!104687 (not e!139044))))

(declare-fun res!104690 () Bool)

(assert (=> b!213870 (=> (not res!104690) (not e!139044))))

(assert (=> b!213870 (= res!104690 (bvslt #b00000000000000000000000000000000 (size!5172 _keys!825)))))

(declare-fun b!213871 () Bool)

(assert (=> b!213871 (= e!139041 (validKeyInArray!0 (select (arr!4846 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213872 () Bool)

(assert (=> b!213872 (= e!139038 (+!592 call!20274 (tuple2!4203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20277 () Bool)

(assert (=> bm!20277 (= call!20275 (getCurrentListMapNoExtraKeys!514 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213873 () Bool)

(declare-fun Unit!6445 () Unit!6438)

(assert (=> b!213873 (= e!139046 Unit!6445)))

(assert (= (and d!58109 c!35995) b!213872))

(assert (= (and d!58109 (not c!35995)) b!213865))

(assert (= (and b!213865 c!35997) b!213860))

(assert (= (and b!213865 (not c!35997)) b!213859))

(assert (= (and b!213859 c!35992) b!213867))

(assert (= (and b!213859 (not c!35992)) b!213858))

(assert (= (or b!213867 b!213858) bm!20275))

(assert (= (or b!213860 bm!20275) bm!20272))

(assert (= (or b!213860 b!213867) bm!20271))

(assert (= (or b!213872 bm!20272) bm!20277))

(assert (= (or b!213872 bm!20271) bm!20273))

(assert (= (and d!58109 res!104686) b!213871))

(assert (= (and d!58109 c!35996) b!213868))

(assert (= (and d!58109 (not c!35996)) b!213873))

(assert (= (and d!58109 res!104688) b!213870))

(assert (= (and b!213870 res!104690) b!213857))

(assert (= (and b!213870 (not res!104687)) b!213861))

(assert (= (and b!213861 res!104691) b!213862))

(assert (= (and b!213870 res!104692) b!213854))

(assert (= (and b!213854 c!35994) b!213853))

(assert (= (and b!213854 (not c!35994)) b!213864))

(assert (= (and b!213853 res!104693) b!213866))

(assert (= (or b!213853 b!213864) bm!20276))

(assert (= (and b!213854 res!104689) b!213855))

(assert (= (and b!213855 c!35993) b!213863))

(assert (= (and b!213855 (not c!35993)) b!213869))

(assert (= (and b!213863 res!104685) b!213856))

(assert (= (or b!213863 b!213869) bm!20274))

(declare-fun b_lambda!7795 () Bool)

(assert (=> (not b_lambda!7795) (not b!213862)))

(assert (=> b!213862 t!8058))

(declare-fun b_and!12515 () Bool)

(assert (= b_and!12513 (and (=> t!8058 result!5019) b_and!12515)))

(assert (=> bm!20277 m!241027))

(assert (=> b!213861 m!241113))

(assert (=> b!213861 m!241113))

(declare-fun m!241255 () Bool)

(assert (=> b!213861 m!241255))

(assert (=> b!213862 m!241147))

(assert (=> b!213862 m!241113))

(assert (=> b!213862 m!241113))

(declare-fun m!241257 () Bool)

(assert (=> b!213862 m!241257))

(assert (=> b!213862 m!241173))

(assert (=> b!213862 m!241147))

(assert (=> b!213862 m!241177))

(assert (=> b!213862 m!241173))

(declare-fun m!241259 () Bool)

(assert (=> b!213872 m!241259))

(declare-fun m!241261 () Bool)

(assert (=> b!213866 m!241261))

(declare-fun m!241263 () Bool)

(assert (=> b!213868 m!241263))

(assert (=> b!213868 m!241027))

(declare-fun m!241265 () Bool)

(assert (=> b!213868 m!241265))

(declare-fun m!241267 () Bool)

(assert (=> b!213868 m!241267))

(declare-fun m!241269 () Bool)

(assert (=> b!213868 m!241269))

(assert (=> b!213868 m!241263))

(declare-fun m!241271 () Bool)

(assert (=> b!213868 m!241271))

(declare-fun m!241273 () Bool)

(assert (=> b!213868 m!241273))

(declare-fun m!241275 () Bool)

(assert (=> b!213868 m!241275))

(assert (=> b!213868 m!241273))

(declare-fun m!241277 () Bool)

(assert (=> b!213868 m!241277))

(assert (=> b!213868 m!241113))

(declare-fun m!241279 () Bool)

(assert (=> b!213868 m!241279))

(assert (=> b!213868 m!241269))

(declare-fun m!241281 () Bool)

(assert (=> b!213868 m!241281))

(declare-fun m!241283 () Bool)

(assert (=> b!213868 m!241283))

(declare-fun m!241285 () Bool)

(assert (=> b!213868 m!241285))

(declare-fun m!241287 () Bool)

(assert (=> b!213868 m!241287))

(declare-fun m!241289 () Bool)

(assert (=> b!213868 m!241289))

(assert (=> b!213868 m!241283))

(declare-fun m!241291 () Bool)

(assert (=> b!213868 m!241291))

(declare-fun m!241293 () Bool)

(assert (=> b!213856 m!241293))

(assert (=> b!213857 m!241113))

(assert (=> b!213857 m!241113))

(assert (=> b!213857 m!241115))

(declare-fun m!241295 () Bool)

(assert (=> bm!20276 m!241295))

(declare-fun m!241297 () Bool)

(assert (=> bm!20274 m!241297))

(assert (=> b!213871 m!241113))

(assert (=> b!213871 m!241113))

(assert (=> b!213871 m!241115))

(declare-fun m!241299 () Bool)

(assert (=> bm!20273 m!241299))

(assert (=> d!58109 m!241039))

(assert (=> b!213620 d!58109))

(declare-fun mapNonEmpty!9374 () Bool)

(declare-fun mapRes!9374 () Bool)

(declare-fun tp!20030 () Bool)

(declare-fun e!139056 () Bool)

(assert (=> mapNonEmpty!9374 (= mapRes!9374 (and tp!20030 e!139056))))

(declare-fun mapRest!9374 () (Array (_ BitVec 32) ValueCell!2411))

(declare-fun mapValue!9374 () ValueCell!2411)

(declare-fun mapKey!9374 () (_ BitVec 32))

(assert (=> mapNonEmpty!9374 (= mapRest!9365 (store mapRest!9374 mapKey!9374 mapValue!9374))))

(declare-fun condMapEmpty!9374 () Bool)

(declare-fun mapDefault!9374 () ValueCell!2411)

(assert (=> mapNonEmpty!9365 (= condMapEmpty!9374 (= mapRest!9365 ((as const (Array (_ BitVec 32) ValueCell!2411)) mapDefault!9374)))))

(declare-fun e!139055 () Bool)

(assert (=> mapNonEmpty!9365 (= tp!20015 (and e!139055 mapRes!9374))))

(declare-fun b!213881 () Bool)

(assert (=> b!213881 (= e!139055 tp_is_empty!5509)))

(declare-fun b!213880 () Bool)

(assert (=> b!213880 (= e!139056 tp_is_empty!5509)))

(declare-fun mapIsEmpty!9374 () Bool)

(assert (=> mapIsEmpty!9374 mapRes!9374))

(assert (= (and mapNonEmpty!9365 condMapEmpty!9374) mapIsEmpty!9374))

(assert (= (and mapNonEmpty!9365 (not condMapEmpty!9374)) mapNonEmpty!9374))

(assert (= (and mapNonEmpty!9374 ((_ is ValueCellFull!2411) mapValue!9374)) b!213880))

(assert (= (and mapNonEmpty!9365 ((_ is ValueCellFull!2411) mapDefault!9374)) b!213881))

(declare-fun m!241301 () Bool)

(assert (=> mapNonEmpty!9374 m!241301))

(declare-fun b_lambda!7797 () Bool)

(assert (= b_lambda!7793 (or (and start!21220 b_free!5647) b_lambda!7797)))

(declare-fun b_lambda!7799 () Bool)

(assert (= b_lambda!7795 (or (and start!21220 b_free!5647) b_lambda!7799)))

(declare-fun b_lambda!7801 () Bool)

(assert (= b_lambda!7785 (or (and start!21220 b_free!5647) b_lambda!7801)))

(declare-fun b_lambda!7803 () Bool)

(assert (= b_lambda!7787 (or (and start!21220 b_free!5647) b_lambda!7803)))

(declare-fun b_lambda!7805 () Bool)

(assert (= b_lambda!7791 (or (and start!21220 b_free!5647) b_lambda!7805)))

(declare-fun b_lambda!7807 () Bool)

(assert (= b_lambda!7789 (or (and start!21220 b_free!5647) b_lambda!7807)))

(check-sat (not b!213761) (not b!213773) (not b_lambda!7807) (not b!213825) (not b_lambda!7801) (not b!213769) (not b!213775) (not b!213857) (not b!213768) (not b_lambda!7799) (not b!213724) (not b_lambda!7797) (not b!213728) (not b!213852) (not mapNonEmpty!9374) (not b!213758) (not bm!20261) (not b!213851) (not bm!20260) (not b!213712) (not b!213830) (not b!213868) (not b!213829) (not b!213778) (not b!213866) (not d!58087) (not b!213836) (not bm!20269) (not bm!20242) (not b!213834) (not bm!20239) (not b!213756) (not b!213770) (not bm!20243) (not bm!20273) (not b!213861) (not b!213762) (not b!213706) (not bm!20264) (not b!213755) (not b!213776) (not b!213704) (not b_next!5647) (not d!58107) (not b!213824) (not b!213772) (not b!213862) (not b!213754) b_and!12515 (not b!213840) (not d!58101) (not bm!20277) (not b!213856) (not bm!20274) (not b!213713) (not b!213839) (not bm!20236) (not d!58099) (not b!213759) (not d!58109) (not bm!20263) (not b!213850) (not b_lambda!7803) (not b!213764) (not b_lambda!7805) (not d!58105) (not d!58103) (not b!213726) tp_is_empty!5509 (not bm!20276) (not b!213872) (not b!213871) (not bm!20270))
(check-sat b_and!12515 (not b_next!5647))
