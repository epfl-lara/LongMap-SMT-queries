; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95226 () Bool)

(assert start!95226)

(declare-fun b_free!22165 () Bool)

(declare-fun b_next!22165 () Bool)

(assert (=> start!95226 (= b_free!22165 (not b_next!22165))))

(declare-fun tp!77966 () Bool)

(declare-fun b_and!35047 () Bool)

(assert (=> start!95226 (= tp!77966 b_and!35047)))

(declare-fun b!1075260 () Bool)

(declare-fun res!716708 () Bool)

(declare-fun e!614456 () Bool)

(assert (=> b!1075260 (=> (not res!716708) (not e!614456))))

(declare-datatypes ((array!68959 0))(
  ( (array!68960 (arr!33165 (Array (_ BitVec 32) (_ BitVec 64))) (size!33702 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68959)

(declare-datatypes ((List!23149 0))(
  ( (Nil!23146) (Cons!23145 (h!24363 (_ BitVec 64)) (t!32482 List!23149)) )
))
(declare-fun arrayNoDuplicates!0 (array!68959 (_ BitVec 32) List!23149) Bool)

(assert (=> b!1075260 (= res!716708 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23146))))

(declare-fun b!1075261 () Bool)

(declare-fun e!614455 () Bool)

(declare-fun e!614457 () Bool)

(declare-fun mapRes!40681 () Bool)

(assert (=> b!1075261 (= e!614455 (and e!614457 mapRes!40681))))

(declare-fun condMapEmpty!40681 () Bool)

(declare-datatypes ((V!39769 0))(
  ( (V!39770 (val!13038 Int)) )
))
(declare-datatypes ((ValueCell!12284 0))(
  ( (ValueCellFull!12284 (v!15653 V!39769)) (EmptyCell!12284) )
))
(declare-datatypes ((array!68961 0))(
  ( (array!68962 (arr!33166 (Array (_ BitVec 32) ValueCell!12284)) (size!33703 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68961)

(declare-fun mapDefault!40681 () ValueCell!12284)

(assert (=> b!1075261 (= condMapEmpty!40681 (= (arr!33166 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12284)) mapDefault!40681)))))

(declare-fun b!1075262 () Bool)

(declare-fun e!614453 () Bool)

(declare-fun tp_is_empty!25975 () Bool)

(assert (=> b!1075262 (= e!614453 tp_is_empty!25975)))

(declare-fun minValue!907 () V!39769)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun b!1075263 () Bool)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun e!614458 () Bool)

(declare-datatypes ((tuple2!16592 0))(
  ( (tuple2!16593 (_1!8307 (_ BitVec 64)) (_2!8307 V!39769)) )
))
(declare-datatypes ((List!23150 0))(
  ( (Nil!23147) (Cons!23146 (h!24364 tuple2!16592) (t!32483 List!23150)) )
))
(declare-datatypes ((ListLongMap!14569 0))(
  ( (ListLongMap!14570 (toList!7300 List!23150)) )
))
(declare-fun lt!476802 () ListLongMap!14569)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39769)

(declare-fun getCurrentListMap!4162 (array!68959 array!68961 (_ BitVec 32) (_ BitVec 32) V!39769 V!39769 (_ BitVec 32) Int) ListLongMap!14569)

(assert (=> b!1075263 (= e!614458 (= lt!476802 (getCurrentListMap!4162 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)))))

(declare-fun lt!476807 () ListLongMap!14569)

(assert (=> b!1075263 (= lt!476802 lt!476807)))

(declare-fun -!699 (ListLongMap!14569 (_ BitVec 64)) ListLongMap!14569)

(assert (=> b!1075263 (= lt!476802 (-!699 lt!476807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!35337 0))(
  ( (Unit!35338) )
))
(declare-fun lt!476806 () Unit!35337)

(declare-fun removeNotPresentStillSame!77 (ListLongMap!14569 (_ BitVec 64)) Unit!35337)

(assert (=> b!1075263 (= lt!476806 (removeNotPresentStillSame!77 lt!476807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075264 () Bool)

(declare-fun res!716709 () Bool)

(assert (=> b!1075264 (=> (not res!716709) (not e!614456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68959 (_ BitVec 32)) Bool)

(assert (=> b!1075264 (= res!716709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!716704 () Bool)

(assert (=> start!95226 (=> (not res!716704) (not e!614456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95226 (= res!716704 (validMask!0 mask!1515))))

(assert (=> start!95226 e!614456))

(assert (=> start!95226 true))

(assert (=> start!95226 tp_is_empty!25975))

(declare-fun array_inv!25674 (array!68961) Bool)

(assert (=> start!95226 (and (array_inv!25674 _values!955) e!614455)))

(assert (=> start!95226 tp!77966))

(declare-fun array_inv!25675 (array!68959) Bool)

(assert (=> start!95226 (array_inv!25675 _keys!1163)))

(declare-fun b!1075265 () Bool)

(declare-fun e!614454 () Bool)

(assert (=> b!1075265 (= e!614456 (not e!614454))))

(declare-fun res!716706 () Bool)

(assert (=> b!1075265 (=> res!716706 e!614454)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075265 (= res!716706 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!476805 () ListLongMap!14569)

(declare-fun lt!476804 () ListLongMap!14569)

(assert (=> b!1075265 (= lt!476805 lt!476804)))

(declare-fun zeroValueBefore!47 () V!39769)

(declare-fun lt!476803 () Unit!35337)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!877 (array!68959 array!68961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39769 V!39769 V!39769 V!39769 (_ BitVec 32) Int) Unit!35337)

(assert (=> b!1075265 (= lt!476803 (lemmaNoChangeToArrayThenSameMapNoExtras!877 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3897 (array!68959 array!68961 (_ BitVec 32) (_ BitVec 32) V!39769 V!39769 (_ BitVec 32) Int) ListLongMap!14569)

(assert (=> b!1075265 (= lt!476804 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075265 (= lt!476805 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40681 () Bool)

(declare-fun tp!77965 () Bool)

(assert (=> mapNonEmpty!40681 (= mapRes!40681 (and tp!77965 e!614453))))

(declare-fun mapKey!40681 () (_ BitVec 32))

(declare-fun mapValue!40681 () ValueCell!12284)

(declare-fun mapRest!40681 () (Array (_ BitVec 32) ValueCell!12284))

(assert (=> mapNonEmpty!40681 (= (arr!33166 _values!955) (store mapRest!40681 mapKey!40681 mapValue!40681))))

(declare-fun mapIsEmpty!40681 () Bool)

(assert (=> mapIsEmpty!40681 mapRes!40681))

(declare-fun b!1075266 () Bool)

(assert (=> b!1075266 (= e!614457 tp_is_empty!25975)))

(declare-fun b!1075267 () Bool)

(assert (=> b!1075267 (= e!614454 e!614458)))

(declare-fun res!716707 () Bool)

(assert (=> b!1075267 (=> res!716707 e!614458)))

(declare-fun contains!6357 (ListLongMap!14569 (_ BitVec 64)) Bool)

(assert (=> b!1075267 (= res!716707 (contains!6357 lt!476807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1075267 (= lt!476807 (getCurrentListMap!4162 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075268 () Bool)

(declare-fun res!716705 () Bool)

(assert (=> b!1075268 (=> (not res!716705) (not e!614456))))

(assert (=> b!1075268 (= res!716705 (and (= (size!33703 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33702 _keys!1163) (size!33703 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!95226 res!716704) b!1075268))

(assert (= (and b!1075268 res!716705) b!1075264))

(assert (= (and b!1075264 res!716709) b!1075260))

(assert (= (and b!1075260 res!716708) b!1075265))

(assert (= (and b!1075265 (not res!716706)) b!1075267))

(assert (= (and b!1075267 (not res!716707)) b!1075263))

(assert (= (and b!1075261 condMapEmpty!40681) mapIsEmpty!40681))

(assert (= (and b!1075261 (not condMapEmpty!40681)) mapNonEmpty!40681))

(get-info :version)

(assert (= (and mapNonEmpty!40681 ((_ is ValueCellFull!12284) mapValue!40681)) b!1075262))

(assert (= (and b!1075261 ((_ is ValueCellFull!12284) mapDefault!40681)) b!1075266))

(assert (= start!95226 b!1075261))

(declare-fun m!994481 () Bool)

(assert (=> b!1075264 m!994481))

(declare-fun m!994483 () Bool)

(assert (=> b!1075263 m!994483))

(declare-fun m!994485 () Bool)

(assert (=> b!1075263 m!994485))

(declare-fun m!994487 () Bool)

(assert (=> b!1075263 m!994487))

(declare-fun m!994489 () Bool)

(assert (=> b!1075265 m!994489))

(declare-fun m!994491 () Bool)

(assert (=> b!1075265 m!994491))

(declare-fun m!994493 () Bool)

(assert (=> b!1075265 m!994493))

(declare-fun m!994495 () Bool)

(assert (=> b!1075260 m!994495))

(declare-fun m!994497 () Bool)

(assert (=> start!95226 m!994497))

(declare-fun m!994499 () Bool)

(assert (=> start!95226 m!994499))

(declare-fun m!994501 () Bool)

(assert (=> start!95226 m!994501))

(declare-fun m!994503 () Bool)

(assert (=> mapNonEmpty!40681 m!994503))

(declare-fun m!994505 () Bool)

(assert (=> b!1075267 m!994505))

(declare-fun m!994507 () Bool)

(assert (=> b!1075267 m!994507))

(check-sat (not b!1075265) (not b!1075264) tp_is_empty!25975 (not b_next!22165) b_and!35047 (not start!95226) (not mapNonEmpty!40681) (not b!1075260) (not b!1075267) (not b!1075263))
(check-sat b_and!35047 (not b_next!22165))
(get-model)

(declare-fun bm!45397 () Bool)

(declare-fun call!45401 () ListLongMap!14569)

(declare-fun call!45406 () ListLongMap!14569)

(declare-fun c!108232 () Bool)

(declare-fun c!108233 () Bool)

(declare-fun call!45402 () ListLongMap!14569)

(declare-fun call!45403 () ListLongMap!14569)

(declare-fun +!3236 (ListLongMap!14569 tuple2!16592) ListLongMap!14569)

(assert (=> bm!45397 (= call!45406 (+!3236 (ite c!108232 call!45401 (ite c!108233 call!45402 call!45403)) (ite (or c!108232 c!108233) (tuple2!16593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075365 () Bool)

(declare-fun e!614530 () ListLongMap!14569)

(declare-fun e!614538 () ListLongMap!14569)

(assert (=> b!1075365 (= e!614530 e!614538)))

(assert (=> b!1075365 (= c!108233 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075366 () Bool)

(declare-fun e!614529 () Unit!35337)

(declare-fun lt!476889 () Unit!35337)

(assert (=> b!1075366 (= e!614529 lt!476889)))

(declare-fun lt!476905 () ListLongMap!14569)

(assert (=> b!1075366 (= lt!476905 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476890 () (_ BitVec 64))

(assert (=> b!1075366 (= lt!476890 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476896 () (_ BitVec 64))

(assert (=> b!1075366 (= lt!476896 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476891 () Unit!35337)

(declare-fun addStillContains!647 (ListLongMap!14569 (_ BitVec 64) V!39769 (_ BitVec 64)) Unit!35337)

(assert (=> b!1075366 (= lt!476891 (addStillContains!647 lt!476905 lt!476890 zeroValueAfter!47 lt!476896))))

(assert (=> b!1075366 (contains!6357 (+!3236 lt!476905 (tuple2!16593 lt!476890 zeroValueAfter!47)) lt!476896)))

(declare-fun lt!476903 () Unit!35337)

(assert (=> b!1075366 (= lt!476903 lt!476891)))

(declare-fun lt!476909 () ListLongMap!14569)

(assert (=> b!1075366 (= lt!476909 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476894 () (_ BitVec 64))

(assert (=> b!1075366 (= lt!476894 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476904 () (_ BitVec 64))

(assert (=> b!1075366 (= lt!476904 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476897 () Unit!35337)

(declare-fun addApplyDifferent!503 (ListLongMap!14569 (_ BitVec 64) V!39769 (_ BitVec 64)) Unit!35337)

(assert (=> b!1075366 (= lt!476897 (addApplyDifferent!503 lt!476909 lt!476894 minValue!907 lt!476904))))

(declare-fun apply!943 (ListLongMap!14569 (_ BitVec 64)) V!39769)

(assert (=> b!1075366 (= (apply!943 (+!3236 lt!476909 (tuple2!16593 lt!476894 minValue!907)) lt!476904) (apply!943 lt!476909 lt!476904))))

(declare-fun lt!476899 () Unit!35337)

(assert (=> b!1075366 (= lt!476899 lt!476897)))

(declare-fun lt!476900 () ListLongMap!14569)

(assert (=> b!1075366 (= lt!476900 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476893 () (_ BitVec 64))

(assert (=> b!1075366 (= lt!476893 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476898 () (_ BitVec 64))

(assert (=> b!1075366 (= lt!476898 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476895 () Unit!35337)

(assert (=> b!1075366 (= lt!476895 (addApplyDifferent!503 lt!476900 lt!476893 zeroValueAfter!47 lt!476898))))

(assert (=> b!1075366 (= (apply!943 (+!3236 lt!476900 (tuple2!16593 lt!476893 zeroValueAfter!47)) lt!476898) (apply!943 lt!476900 lt!476898))))

(declare-fun lt!476907 () Unit!35337)

(assert (=> b!1075366 (= lt!476907 lt!476895)))

(declare-fun lt!476888 () ListLongMap!14569)

(assert (=> b!1075366 (= lt!476888 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476901 () (_ BitVec 64))

(assert (=> b!1075366 (= lt!476901 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476908 () (_ BitVec 64))

(assert (=> b!1075366 (= lt!476908 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075366 (= lt!476889 (addApplyDifferent!503 lt!476888 lt!476901 minValue!907 lt!476908))))

(assert (=> b!1075366 (= (apply!943 (+!3236 lt!476888 (tuple2!16593 lt!476901 minValue!907)) lt!476908) (apply!943 lt!476888 lt!476908))))

(declare-fun b!1075367 () Bool)

(declare-fun e!614534 () Bool)

(declare-fun call!45400 () Bool)

(assert (=> b!1075367 (= e!614534 (not call!45400))))

(declare-fun bm!45398 () Bool)

(declare-fun call!45404 () Bool)

(declare-fun lt!476906 () ListLongMap!14569)

(assert (=> bm!45398 (= call!45404 (contains!6357 lt!476906 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075368 () Bool)

(declare-fun call!45405 () ListLongMap!14569)

(assert (=> b!1075368 (= e!614538 call!45405)))

(declare-fun b!1075370 () Bool)

(declare-fun e!614527 () Bool)

(assert (=> b!1075370 (= e!614527 (not call!45404))))

(declare-fun b!1075371 () Bool)

(declare-fun res!716770 () Bool)

(declare-fun e!614537 () Bool)

(assert (=> b!1075371 (=> (not res!716770) (not e!614537))))

(assert (=> b!1075371 (= res!716770 e!614534)))

(declare-fun c!108230 () Bool)

(assert (=> b!1075371 (= c!108230 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45399 () Bool)

(assert (=> bm!45399 (= call!45401 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45400 () Bool)

(assert (=> bm!45400 (= call!45403 call!45402)))

(declare-fun b!1075372 () Bool)

(declare-fun e!614532 () Bool)

(assert (=> b!1075372 (= e!614532 (= (apply!943 lt!476906 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075373 () Bool)

(declare-fun e!614528 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075373 (= e!614528 (validKeyInArray!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075374 () Bool)

(declare-fun e!614535 () ListLongMap!14569)

(assert (=> b!1075374 (= e!614535 call!45405)))

(declare-fun b!1075375 () Bool)

(assert (=> b!1075375 (= e!614527 e!614532)))

(declare-fun res!716767 () Bool)

(assert (=> b!1075375 (= res!716767 call!45404)))

(assert (=> b!1075375 (=> (not res!716767) (not e!614532))))

(declare-fun e!614536 () Bool)

(declare-fun b!1075376 () Bool)

(declare-fun get!17247 (ValueCell!12284 V!39769) V!39769)

(declare-fun dynLambda!2058 (Int (_ BitVec 64)) V!39769)

(assert (=> b!1075376 (= e!614536 (= (apply!943 lt!476906 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)) (get!17247 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2058 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075376 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33703 _values!955)))))

(assert (=> b!1075376 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun bm!45401 () Bool)

(assert (=> bm!45401 (= call!45400 (contains!6357 lt!476906 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075377 () Bool)

(declare-fun e!614539 () Bool)

(assert (=> b!1075377 (= e!614539 e!614536)))

(declare-fun res!716768 () Bool)

(assert (=> b!1075377 (=> (not res!716768) (not e!614536))))

(assert (=> b!1075377 (= res!716768 (contains!6357 lt!476906 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075377 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun b!1075378 () Bool)

(assert (=> b!1075378 (= e!614535 call!45403)))

(declare-fun b!1075379 () Bool)

(declare-fun Unit!35341 () Unit!35337)

(assert (=> b!1075379 (= e!614529 Unit!35341)))

(declare-fun b!1075380 () Bool)

(assert (=> b!1075380 (= e!614530 (+!3236 call!45406 (tuple2!16593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45402 () Bool)

(assert (=> bm!45402 (= call!45402 call!45401)))

(declare-fun b!1075381 () Bool)

(declare-fun e!614531 () Bool)

(assert (=> b!1075381 (= e!614531 (= (apply!943 lt!476906 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun bm!45403 () Bool)

(assert (=> bm!45403 (= call!45405 call!45406)))

(declare-fun b!1075369 () Bool)

(assert (=> b!1075369 (= e!614537 e!614527)))

(declare-fun c!108231 () Bool)

(assert (=> b!1075369 (= c!108231 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!129925 () Bool)

(assert (=> d!129925 e!614537))

(declare-fun res!716766 () Bool)

(assert (=> d!129925 (=> (not res!716766) (not e!614537))))

(assert (=> d!129925 (= res!716766 (or (bvsge #b00000000000000000000000000000000 (size!33702 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))))

(declare-fun lt!476902 () ListLongMap!14569)

(assert (=> d!129925 (= lt!476906 lt!476902)))

(declare-fun lt!476892 () Unit!35337)

(assert (=> d!129925 (= lt!476892 e!614529)))

(declare-fun c!108234 () Bool)

(declare-fun e!614533 () Bool)

(assert (=> d!129925 (= c!108234 e!614533)))

(declare-fun res!716764 () Bool)

(assert (=> d!129925 (=> (not res!716764) (not e!614533))))

(assert (=> d!129925 (= res!716764 (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(assert (=> d!129925 (= lt!476902 e!614530)))

(assert (=> d!129925 (= c!108232 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129925 (validMask!0 mask!1515)))

(assert (=> d!129925 (= (getCurrentListMap!4162 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476906)))

(declare-fun b!1075382 () Bool)

(declare-fun c!108229 () Bool)

(assert (=> b!1075382 (= c!108229 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1075382 (= e!614538 e!614535)))

(declare-fun b!1075383 () Bool)

(declare-fun res!716765 () Bool)

(assert (=> b!1075383 (=> (not res!716765) (not e!614537))))

(assert (=> b!1075383 (= res!716765 e!614539)))

(declare-fun res!716769 () Bool)

(assert (=> b!1075383 (=> res!716769 e!614539)))

(assert (=> b!1075383 (= res!716769 (not e!614528))))

(declare-fun res!716771 () Bool)

(assert (=> b!1075383 (=> (not res!716771) (not e!614528))))

(assert (=> b!1075383 (= res!716771 (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun b!1075384 () Bool)

(assert (=> b!1075384 (= e!614533 (validKeyInArray!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075385 () Bool)

(assert (=> b!1075385 (= e!614534 e!614531)))

(declare-fun res!716772 () Bool)

(assert (=> b!1075385 (= res!716772 call!45400)))

(assert (=> b!1075385 (=> (not res!716772) (not e!614531))))

(assert (= (and d!129925 c!108232) b!1075380))

(assert (= (and d!129925 (not c!108232)) b!1075365))

(assert (= (and b!1075365 c!108233) b!1075368))

(assert (= (and b!1075365 (not c!108233)) b!1075382))

(assert (= (and b!1075382 c!108229) b!1075374))

(assert (= (and b!1075382 (not c!108229)) b!1075378))

(assert (= (or b!1075374 b!1075378) bm!45400))

(assert (= (or b!1075368 bm!45400) bm!45402))

(assert (= (or b!1075368 b!1075374) bm!45403))

(assert (= (or b!1075380 bm!45402) bm!45399))

(assert (= (or b!1075380 bm!45403) bm!45397))

(assert (= (and d!129925 res!716764) b!1075384))

(assert (= (and d!129925 c!108234) b!1075366))

(assert (= (and d!129925 (not c!108234)) b!1075379))

(assert (= (and d!129925 res!716766) b!1075383))

(assert (= (and b!1075383 res!716771) b!1075373))

(assert (= (and b!1075383 (not res!716769)) b!1075377))

(assert (= (and b!1075377 res!716768) b!1075376))

(assert (= (and b!1075383 res!716765) b!1075371))

(assert (= (and b!1075371 c!108230) b!1075385))

(assert (= (and b!1075371 (not c!108230)) b!1075367))

(assert (= (and b!1075385 res!716772) b!1075381))

(assert (= (or b!1075385 b!1075367) bm!45401))

(assert (= (and b!1075371 res!716770) b!1075369))

(assert (= (and b!1075369 c!108231) b!1075375))

(assert (= (and b!1075369 (not c!108231)) b!1075370))

(assert (= (and b!1075375 res!716767) b!1075372))

(assert (= (or b!1075375 b!1075370) bm!45398))

(declare-fun b_lambda!16771 () Bool)

(assert (=> (not b_lambda!16771) (not b!1075376)))

(declare-fun t!32486 () Bool)

(declare-fun tb!7155 () Bool)

(assert (=> (and start!95226 (= defaultEntry!963 defaultEntry!963) t!32486) tb!7155))

(declare-fun result!14789 () Bool)

(assert (=> tb!7155 (= result!14789 tp_is_empty!25975)))

(assert (=> b!1075376 t!32486))

(declare-fun b_and!35053 () Bool)

(assert (= b_and!35047 (and (=> t!32486 result!14789) b_and!35053)))

(assert (=> d!129925 m!994497))

(declare-fun m!994565 () Bool)

(assert (=> b!1075377 m!994565))

(assert (=> b!1075377 m!994565))

(declare-fun m!994567 () Bool)

(assert (=> b!1075377 m!994567))

(assert (=> b!1075373 m!994565))

(assert (=> b!1075373 m!994565))

(declare-fun m!994569 () Bool)

(assert (=> b!1075373 m!994569))

(declare-fun m!994571 () Bool)

(assert (=> bm!45397 m!994571))

(declare-fun m!994573 () Bool)

(assert (=> b!1075380 m!994573))

(declare-fun m!994575 () Bool)

(assert (=> b!1075381 m!994575))

(declare-fun m!994577 () Bool)

(assert (=> b!1075366 m!994577))

(declare-fun m!994579 () Bool)

(assert (=> b!1075366 m!994579))

(declare-fun m!994581 () Bool)

(assert (=> b!1075366 m!994581))

(assert (=> b!1075366 m!994491))

(declare-fun m!994583 () Bool)

(assert (=> b!1075366 m!994583))

(declare-fun m!994585 () Bool)

(assert (=> b!1075366 m!994585))

(declare-fun m!994587 () Bool)

(assert (=> b!1075366 m!994587))

(declare-fun m!994589 () Bool)

(assert (=> b!1075366 m!994589))

(declare-fun m!994591 () Bool)

(assert (=> b!1075366 m!994591))

(declare-fun m!994593 () Bool)

(assert (=> b!1075366 m!994593))

(assert (=> b!1075366 m!994565))

(assert (=> b!1075366 m!994579))

(declare-fun m!994595 () Bool)

(assert (=> b!1075366 m!994595))

(declare-fun m!994597 () Bool)

(assert (=> b!1075366 m!994597))

(assert (=> b!1075366 m!994581))

(declare-fun m!994599 () Bool)

(assert (=> b!1075366 m!994599))

(declare-fun m!994601 () Bool)

(assert (=> b!1075366 m!994601))

(assert (=> b!1075366 m!994585))

(declare-fun m!994603 () Bool)

(assert (=> b!1075366 m!994603))

(assert (=> b!1075366 m!994603))

(declare-fun m!994605 () Bool)

(assert (=> b!1075366 m!994605))

(assert (=> bm!45399 m!994491))

(declare-fun m!994607 () Bool)

(assert (=> bm!45398 m!994607))

(declare-fun m!994609 () Bool)

(assert (=> b!1075372 m!994609))

(declare-fun m!994611 () Bool)

(assert (=> bm!45401 m!994611))

(assert (=> b!1075384 m!994565))

(assert (=> b!1075384 m!994565))

(assert (=> b!1075384 m!994569))

(assert (=> b!1075376 m!994565))

(declare-fun m!994613 () Bool)

(assert (=> b!1075376 m!994613))

(declare-fun m!994615 () Bool)

(assert (=> b!1075376 m!994615))

(declare-fun m!994617 () Bool)

(assert (=> b!1075376 m!994617))

(declare-fun m!994619 () Bool)

(assert (=> b!1075376 m!994619))

(assert (=> b!1075376 m!994617))

(assert (=> b!1075376 m!994565))

(assert (=> b!1075376 m!994615))

(assert (=> b!1075263 d!129925))

(declare-fun d!129927 () Bool)

(declare-fun lt!476912 () ListLongMap!14569)

(assert (=> d!129927 (not (contains!6357 lt!476912 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!74 (List!23150 (_ BitVec 64)) List!23150)

(assert (=> d!129927 (= lt!476912 (ListLongMap!14570 (removeStrictlySorted!74 (toList!7300 lt!476807) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129927 (= (-!699 lt!476807 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476912)))

(declare-fun bs!31675 () Bool)

(assert (= bs!31675 d!129927))

(declare-fun m!994621 () Bool)

(assert (=> bs!31675 m!994621))

(declare-fun m!994623 () Bool)

(assert (=> bs!31675 m!994623))

(assert (=> b!1075263 d!129927))

(declare-fun d!129929 () Bool)

(assert (=> d!129929 (= (-!699 lt!476807 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476807)))

(declare-fun lt!476915 () Unit!35337)

(declare-fun choose!1752 (ListLongMap!14569 (_ BitVec 64)) Unit!35337)

(assert (=> d!129929 (= lt!476915 (choose!1752 lt!476807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129929 (not (contains!6357 lt!476807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129929 (= (removeNotPresentStillSame!77 lt!476807 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476915)))

(declare-fun bs!31676 () Bool)

(assert (= bs!31676 d!129929))

(assert (=> bs!31676 m!994485))

(declare-fun m!994625 () Bool)

(assert (=> bs!31676 m!994625))

(assert (=> bs!31676 m!994505))

(assert (=> b!1075263 d!129929))

(declare-fun d!129931 () Bool)

(declare-fun e!614544 () Bool)

(assert (=> d!129931 e!614544))

(declare-fun res!716775 () Bool)

(assert (=> d!129931 (=> res!716775 e!614544)))

(declare-fun lt!476927 () Bool)

(assert (=> d!129931 (= res!716775 (not lt!476927))))

(declare-fun lt!476926 () Bool)

(assert (=> d!129931 (= lt!476927 lt!476926)))

(declare-fun lt!476925 () Unit!35337)

(declare-fun e!614545 () Unit!35337)

(assert (=> d!129931 (= lt!476925 e!614545)))

(declare-fun c!108237 () Bool)

(assert (=> d!129931 (= c!108237 lt!476926)))

(declare-fun containsKey!579 (List!23150 (_ BitVec 64)) Bool)

(assert (=> d!129931 (= lt!476926 (containsKey!579 (toList!7300 lt!476807) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129931 (= (contains!6357 lt!476807 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476927)))

(declare-fun b!1075394 () Bool)

(declare-fun lt!476924 () Unit!35337)

(assert (=> b!1075394 (= e!614545 lt!476924)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!410 (List!23150 (_ BitVec 64)) Unit!35337)

(assert (=> b!1075394 (= lt!476924 (lemmaContainsKeyImpliesGetValueByKeyDefined!410 (toList!7300 lt!476807) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!653 0))(
  ( (Some!652 (v!15656 V!39769)) (None!651) )
))
(declare-fun isDefined!448 (Option!653) Bool)

(declare-fun getValueByKey!602 (List!23150 (_ BitVec 64)) Option!653)

(assert (=> b!1075394 (isDefined!448 (getValueByKey!602 (toList!7300 lt!476807) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075395 () Bool)

(declare-fun Unit!35342 () Unit!35337)

(assert (=> b!1075395 (= e!614545 Unit!35342)))

(declare-fun b!1075396 () Bool)

(assert (=> b!1075396 (= e!614544 (isDefined!448 (getValueByKey!602 (toList!7300 lt!476807) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129931 c!108237) b!1075394))

(assert (= (and d!129931 (not c!108237)) b!1075395))

(assert (= (and d!129931 (not res!716775)) b!1075396))

(declare-fun m!994627 () Bool)

(assert (=> d!129931 m!994627))

(declare-fun m!994629 () Bool)

(assert (=> b!1075394 m!994629))

(declare-fun m!994631 () Bool)

(assert (=> b!1075394 m!994631))

(assert (=> b!1075394 m!994631))

(declare-fun m!994633 () Bool)

(assert (=> b!1075394 m!994633))

(assert (=> b!1075396 m!994631))

(assert (=> b!1075396 m!994631))

(assert (=> b!1075396 m!994633))

(assert (=> b!1075267 d!129931))

(declare-fun c!108241 () Bool)

(declare-fun call!45413 () ListLongMap!14569)

(declare-fun c!108242 () Bool)

(declare-fun call!45408 () ListLongMap!14569)

(declare-fun call!45409 () ListLongMap!14569)

(declare-fun call!45410 () ListLongMap!14569)

(declare-fun bm!45404 () Bool)

(assert (=> bm!45404 (= call!45413 (+!3236 (ite c!108241 call!45408 (ite c!108242 call!45409 call!45410)) (ite (or c!108241 c!108242) (tuple2!16593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075397 () Bool)

(declare-fun e!614549 () ListLongMap!14569)

(declare-fun e!614557 () ListLongMap!14569)

(assert (=> b!1075397 (= e!614549 e!614557)))

(assert (=> b!1075397 (= c!108242 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075398 () Bool)

(declare-fun e!614548 () Unit!35337)

(declare-fun lt!476929 () Unit!35337)

(assert (=> b!1075398 (= e!614548 lt!476929)))

(declare-fun lt!476945 () ListLongMap!14569)

(assert (=> b!1075398 (= lt!476945 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476930 () (_ BitVec 64))

(assert (=> b!1075398 (= lt!476930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476936 () (_ BitVec 64))

(assert (=> b!1075398 (= lt!476936 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476931 () Unit!35337)

(assert (=> b!1075398 (= lt!476931 (addStillContains!647 lt!476945 lt!476930 zeroValueBefore!47 lt!476936))))

(assert (=> b!1075398 (contains!6357 (+!3236 lt!476945 (tuple2!16593 lt!476930 zeroValueBefore!47)) lt!476936)))

(declare-fun lt!476943 () Unit!35337)

(assert (=> b!1075398 (= lt!476943 lt!476931)))

(declare-fun lt!476949 () ListLongMap!14569)

(assert (=> b!1075398 (= lt!476949 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476934 () (_ BitVec 64))

(assert (=> b!1075398 (= lt!476934 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476944 () (_ BitVec 64))

(assert (=> b!1075398 (= lt!476944 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476937 () Unit!35337)

(assert (=> b!1075398 (= lt!476937 (addApplyDifferent!503 lt!476949 lt!476934 minValue!907 lt!476944))))

(assert (=> b!1075398 (= (apply!943 (+!3236 lt!476949 (tuple2!16593 lt!476934 minValue!907)) lt!476944) (apply!943 lt!476949 lt!476944))))

(declare-fun lt!476939 () Unit!35337)

(assert (=> b!1075398 (= lt!476939 lt!476937)))

(declare-fun lt!476940 () ListLongMap!14569)

(assert (=> b!1075398 (= lt!476940 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476933 () (_ BitVec 64))

(assert (=> b!1075398 (= lt!476933 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476938 () (_ BitVec 64))

(assert (=> b!1075398 (= lt!476938 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476935 () Unit!35337)

(assert (=> b!1075398 (= lt!476935 (addApplyDifferent!503 lt!476940 lt!476933 zeroValueBefore!47 lt!476938))))

(assert (=> b!1075398 (= (apply!943 (+!3236 lt!476940 (tuple2!16593 lt!476933 zeroValueBefore!47)) lt!476938) (apply!943 lt!476940 lt!476938))))

(declare-fun lt!476947 () Unit!35337)

(assert (=> b!1075398 (= lt!476947 lt!476935)))

(declare-fun lt!476928 () ListLongMap!14569)

(assert (=> b!1075398 (= lt!476928 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476941 () (_ BitVec 64))

(assert (=> b!1075398 (= lt!476941 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476948 () (_ BitVec 64))

(assert (=> b!1075398 (= lt!476948 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075398 (= lt!476929 (addApplyDifferent!503 lt!476928 lt!476941 minValue!907 lt!476948))))

(assert (=> b!1075398 (= (apply!943 (+!3236 lt!476928 (tuple2!16593 lt!476941 minValue!907)) lt!476948) (apply!943 lt!476928 lt!476948))))

(declare-fun b!1075399 () Bool)

(declare-fun e!614553 () Bool)

(declare-fun call!45407 () Bool)

(assert (=> b!1075399 (= e!614553 (not call!45407))))

(declare-fun bm!45405 () Bool)

(declare-fun call!45411 () Bool)

(declare-fun lt!476946 () ListLongMap!14569)

(assert (=> bm!45405 (= call!45411 (contains!6357 lt!476946 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075400 () Bool)

(declare-fun call!45412 () ListLongMap!14569)

(assert (=> b!1075400 (= e!614557 call!45412)))

(declare-fun b!1075402 () Bool)

(declare-fun e!614546 () Bool)

(assert (=> b!1075402 (= e!614546 (not call!45411))))

(declare-fun b!1075403 () Bool)

(declare-fun res!716782 () Bool)

(declare-fun e!614556 () Bool)

(assert (=> b!1075403 (=> (not res!716782) (not e!614556))))

(assert (=> b!1075403 (= res!716782 e!614553)))

(declare-fun c!108239 () Bool)

(assert (=> b!1075403 (= c!108239 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45406 () Bool)

(assert (=> bm!45406 (= call!45408 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45407 () Bool)

(assert (=> bm!45407 (= call!45410 call!45409)))

(declare-fun b!1075404 () Bool)

(declare-fun e!614551 () Bool)

(assert (=> b!1075404 (= e!614551 (= (apply!943 lt!476946 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075405 () Bool)

(declare-fun e!614547 () Bool)

(assert (=> b!1075405 (= e!614547 (validKeyInArray!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075406 () Bool)

(declare-fun e!614554 () ListLongMap!14569)

(assert (=> b!1075406 (= e!614554 call!45412)))

(declare-fun b!1075407 () Bool)

(assert (=> b!1075407 (= e!614546 e!614551)))

(declare-fun res!716779 () Bool)

(assert (=> b!1075407 (= res!716779 call!45411)))

(assert (=> b!1075407 (=> (not res!716779) (not e!614551))))

(declare-fun e!614555 () Bool)

(declare-fun b!1075408 () Bool)

(assert (=> b!1075408 (= e!614555 (= (apply!943 lt!476946 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)) (get!17247 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2058 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075408 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33703 _values!955)))))

(assert (=> b!1075408 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun bm!45408 () Bool)

(assert (=> bm!45408 (= call!45407 (contains!6357 lt!476946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075409 () Bool)

(declare-fun e!614558 () Bool)

(assert (=> b!1075409 (= e!614558 e!614555)))

(declare-fun res!716780 () Bool)

(assert (=> b!1075409 (=> (not res!716780) (not e!614555))))

(assert (=> b!1075409 (= res!716780 (contains!6357 lt!476946 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075409 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun b!1075410 () Bool)

(assert (=> b!1075410 (= e!614554 call!45410)))

(declare-fun b!1075411 () Bool)

(declare-fun Unit!35343 () Unit!35337)

(assert (=> b!1075411 (= e!614548 Unit!35343)))

(declare-fun b!1075412 () Bool)

(assert (=> b!1075412 (= e!614549 (+!3236 call!45413 (tuple2!16593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45409 () Bool)

(assert (=> bm!45409 (= call!45409 call!45408)))

(declare-fun b!1075413 () Bool)

(declare-fun e!614550 () Bool)

(assert (=> b!1075413 (= e!614550 (= (apply!943 lt!476946 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun bm!45410 () Bool)

(assert (=> bm!45410 (= call!45412 call!45413)))

(declare-fun b!1075401 () Bool)

(assert (=> b!1075401 (= e!614556 e!614546)))

(declare-fun c!108240 () Bool)

(assert (=> b!1075401 (= c!108240 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!129933 () Bool)

(assert (=> d!129933 e!614556))

(declare-fun res!716778 () Bool)

(assert (=> d!129933 (=> (not res!716778) (not e!614556))))

(assert (=> d!129933 (= res!716778 (or (bvsge #b00000000000000000000000000000000 (size!33702 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))))

(declare-fun lt!476942 () ListLongMap!14569)

(assert (=> d!129933 (= lt!476946 lt!476942)))

(declare-fun lt!476932 () Unit!35337)

(assert (=> d!129933 (= lt!476932 e!614548)))

(declare-fun c!108243 () Bool)

(declare-fun e!614552 () Bool)

(assert (=> d!129933 (= c!108243 e!614552)))

(declare-fun res!716776 () Bool)

(assert (=> d!129933 (=> (not res!716776) (not e!614552))))

(assert (=> d!129933 (= res!716776 (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(assert (=> d!129933 (= lt!476942 e!614549)))

(assert (=> d!129933 (= c!108241 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129933 (validMask!0 mask!1515)))

(assert (=> d!129933 (= (getCurrentListMap!4162 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476946)))

(declare-fun b!1075414 () Bool)

(declare-fun c!108238 () Bool)

(assert (=> b!1075414 (= c!108238 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1075414 (= e!614557 e!614554)))

(declare-fun b!1075415 () Bool)

(declare-fun res!716777 () Bool)

(assert (=> b!1075415 (=> (not res!716777) (not e!614556))))

(assert (=> b!1075415 (= res!716777 e!614558)))

(declare-fun res!716781 () Bool)

(assert (=> b!1075415 (=> res!716781 e!614558)))

(assert (=> b!1075415 (= res!716781 (not e!614547))))

(declare-fun res!716783 () Bool)

(assert (=> b!1075415 (=> (not res!716783) (not e!614547))))

(assert (=> b!1075415 (= res!716783 (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun b!1075416 () Bool)

(assert (=> b!1075416 (= e!614552 (validKeyInArray!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075417 () Bool)

(assert (=> b!1075417 (= e!614553 e!614550)))

(declare-fun res!716784 () Bool)

(assert (=> b!1075417 (= res!716784 call!45407)))

(assert (=> b!1075417 (=> (not res!716784) (not e!614550))))

(assert (= (and d!129933 c!108241) b!1075412))

(assert (= (and d!129933 (not c!108241)) b!1075397))

(assert (= (and b!1075397 c!108242) b!1075400))

(assert (= (and b!1075397 (not c!108242)) b!1075414))

(assert (= (and b!1075414 c!108238) b!1075406))

(assert (= (and b!1075414 (not c!108238)) b!1075410))

(assert (= (or b!1075406 b!1075410) bm!45407))

(assert (= (or b!1075400 bm!45407) bm!45409))

(assert (= (or b!1075400 b!1075406) bm!45410))

(assert (= (or b!1075412 bm!45409) bm!45406))

(assert (= (or b!1075412 bm!45410) bm!45404))

(assert (= (and d!129933 res!716776) b!1075416))

(assert (= (and d!129933 c!108243) b!1075398))

(assert (= (and d!129933 (not c!108243)) b!1075411))

(assert (= (and d!129933 res!716778) b!1075415))

(assert (= (and b!1075415 res!716783) b!1075405))

(assert (= (and b!1075415 (not res!716781)) b!1075409))

(assert (= (and b!1075409 res!716780) b!1075408))

(assert (= (and b!1075415 res!716777) b!1075403))

(assert (= (and b!1075403 c!108239) b!1075417))

(assert (= (and b!1075403 (not c!108239)) b!1075399))

(assert (= (and b!1075417 res!716784) b!1075413))

(assert (= (or b!1075417 b!1075399) bm!45408))

(assert (= (and b!1075403 res!716782) b!1075401))

(assert (= (and b!1075401 c!108240) b!1075407))

(assert (= (and b!1075401 (not c!108240)) b!1075402))

(assert (= (and b!1075407 res!716779) b!1075404))

(assert (= (or b!1075407 b!1075402) bm!45405))

(declare-fun b_lambda!16773 () Bool)

(assert (=> (not b_lambda!16773) (not b!1075408)))

(assert (=> b!1075408 t!32486))

(declare-fun b_and!35055 () Bool)

(assert (= b_and!35053 (and (=> t!32486 result!14789) b_and!35055)))

(assert (=> d!129933 m!994497))

(assert (=> b!1075409 m!994565))

(assert (=> b!1075409 m!994565))

(declare-fun m!994635 () Bool)

(assert (=> b!1075409 m!994635))

(assert (=> b!1075405 m!994565))

(assert (=> b!1075405 m!994565))

(assert (=> b!1075405 m!994569))

(declare-fun m!994637 () Bool)

(assert (=> bm!45404 m!994637))

(declare-fun m!994639 () Bool)

(assert (=> b!1075412 m!994639))

(declare-fun m!994641 () Bool)

(assert (=> b!1075413 m!994641))

(declare-fun m!994643 () Bool)

(assert (=> b!1075398 m!994643))

(declare-fun m!994645 () Bool)

(assert (=> b!1075398 m!994645))

(declare-fun m!994647 () Bool)

(assert (=> b!1075398 m!994647))

(assert (=> b!1075398 m!994493))

(declare-fun m!994649 () Bool)

(assert (=> b!1075398 m!994649))

(declare-fun m!994651 () Bool)

(assert (=> b!1075398 m!994651))

(declare-fun m!994653 () Bool)

(assert (=> b!1075398 m!994653))

(declare-fun m!994655 () Bool)

(assert (=> b!1075398 m!994655))

(declare-fun m!994657 () Bool)

(assert (=> b!1075398 m!994657))

(declare-fun m!994659 () Bool)

(assert (=> b!1075398 m!994659))

(assert (=> b!1075398 m!994565))

(assert (=> b!1075398 m!994645))

(declare-fun m!994661 () Bool)

(assert (=> b!1075398 m!994661))

(declare-fun m!994663 () Bool)

(assert (=> b!1075398 m!994663))

(assert (=> b!1075398 m!994647))

(declare-fun m!994665 () Bool)

(assert (=> b!1075398 m!994665))

(declare-fun m!994667 () Bool)

(assert (=> b!1075398 m!994667))

(assert (=> b!1075398 m!994651))

(declare-fun m!994669 () Bool)

(assert (=> b!1075398 m!994669))

(assert (=> b!1075398 m!994669))

(declare-fun m!994671 () Bool)

(assert (=> b!1075398 m!994671))

(assert (=> bm!45406 m!994493))

(declare-fun m!994673 () Bool)

(assert (=> bm!45405 m!994673))

(declare-fun m!994675 () Bool)

(assert (=> b!1075404 m!994675))

(declare-fun m!994677 () Bool)

(assert (=> bm!45408 m!994677))

(assert (=> b!1075416 m!994565))

(assert (=> b!1075416 m!994565))

(assert (=> b!1075416 m!994569))

(assert (=> b!1075408 m!994565))

(declare-fun m!994679 () Bool)

(assert (=> b!1075408 m!994679))

(assert (=> b!1075408 m!994615))

(assert (=> b!1075408 m!994617))

(assert (=> b!1075408 m!994619))

(assert (=> b!1075408 m!994617))

(assert (=> b!1075408 m!994565))

(assert (=> b!1075408 m!994615))

(assert (=> b!1075267 d!129933))

(declare-fun b!1075426 () Bool)

(declare-fun e!614565 () Bool)

(declare-fun call!45416 () Bool)

(assert (=> b!1075426 (= e!614565 call!45416)))

(declare-fun bm!45413 () Bool)

(assert (=> bm!45413 (= call!45416 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1075427 () Bool)

(declare-fun e!614566 () Bool)

(assert (=> b!1075427 (= e!614566 e!614565)))

(declare-fun lt!476958 () (_ BitVec 64))

(assert (=> b!1075427 (= lt!476958 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476957 () Unit!35337)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68959 (_ BitVec 64) (_ BitVec 32)) Unit!35337)

(assert (=> b!1075427 (= lt!476957 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476958 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075427 (arrayContainsKey!0 _keys!1163 lt!476958 #b00000000000000000000000000000000)))

(declare-fun lt!476956 () Unit!35337)

(assert (=> b!1075427 (= lt!476956 lt!476957)))

(declare-fun res!716790 () Bool)

(declare-datatypes ((SeekEntryResult!9843 0))(
  ( (MissingZero!9843 (index!41743 (_ BitVec 32))) (Found!9843 (index!41744 (_ BitVec 32))) (Intermediate!9843 (undefined!10655 Bool) (index!41745 (_ BitVec 32)) (x!96244 (_ BitVec 32))) (Undefined!9843) (MissingVacant!9843 (index!41746 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68959 (_ BitVec 32)) SeekEntryResult!9843)

(assert (=> b!1075427 (= res!716790 (= (seekEntryOrOpen!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9843 #b00000000000000000000000000000000)))))

(assert (=> b!1075427 (=> (not res!716790) (not e!614565))))

(declare-fun d!129935 () Bool)

(declare-fun res!716789 () Bool)

(declare-fun e!614567 () Bool)

(assert (=> d!129935 (=> res!716789 e!614567)))

(assert (=> d!129935 (= res!716789 (bvsge #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(assert (=> d!129935 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614567)))

(declare-fun b!1075428 () Bool)

(assert (=> b!1075428 (= e!614567 e!614566)))

(declare-fun c!108246 () Bool)

(assert (=> b!1075428 (= c!108246 (validKeyInArray!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075429 () Bool)

(assert (=> b!1075429 (= e!614566 call!45416)))

(assert (= (and d!129935 (not res!716789)) b!1075428))

(assert (= (and b!1075428 c!108246) b!1075427))

(assert (= (and b!1075428 (not c!108246)) b!1075429))

(assert (= (and b!1075427 res!716790) b!1075426))

(assert (= (or b!1075426 b!1075429) bm!45413))

(declare-fun m!994681 () Bool)

(assert (=> bm!45413 m!994681))

(assert (=> b!1075427 m!994565))

(declare-fun m!994683 () Bool)

(assert (=> b!1075427 m!994683))

(declare-fun m!994685 () Bool)

(assert (=> b!1075427 m!994685))

(assert (=> b!1075427 m!994565))

(declare-fun m!994687 () Bool)

(assert (=> b!1075427 m!994687))

(assert (=> b!1075428 m!994565))

(assert (=> b!1075428 m!994565))

(assert (=> b!1075428 m!994569))

(assert (=> b!1075264 d!129935))

(declare-fun d!129937 () Bool)

(assert (=> d!129937 (= (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476961 () Unit!35337)

(declare-fun choose!1753 (array!68959 array!68961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39769 V!39769 V!39769 V!39769 (_ BitVec 32) Int) Unit!35337)

(assert (=> d!129937 (= lt!476961 (choose!1753 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129937 (validMask!0 mask!1515)))

(assert (=> d!129937 (= (lemmaNoChangeToArrayThenSameMapNoExtras!877 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476961)))

(declare-fun bs!31677 () Bool)

(assert (= bs!31677 d!129937))

(assert (=> bs!31677 m!994493))

(assert (=> bs!31677 m!994491))

(declare-fun m!994689 () Bool)

(assert (=> bs!31677 m!994689))

(assert (=> bs!31677 m!994497))

(assert (=> b!1075265 d!129937))

(declare-fun b!1075454 () Bool)

(declare-fun lt!476977 () Unit!35337)

(declare-fun lt!476979 () Unit!35337)

(assert (=> b!1075454 (= lt!476977 lt!476979)))

(declare-fun lt!476980 () ListLongMap!14569)

(declare-fun lt!476982 () (_ BitVec 64))

(declare-fun lt!476976 () (_ BitVec 64))

(declare-fun lt!476981 () V!39769)

(assert (=> b!1075454 (not (contains!6357 (+!3236 lt!476980 (tuple2!16593 lt!476976 lt!476981)) lt!476982))))

(declare-fun addStillNotContains!264 (ListLongMap!14569 (_ BitVec 64) V!39769 (_ BitVec 64)) Unit!35337)

(assert (=> b!1075454 (= lt!476979 (addStillNotContains!264 lt!476980 lt!476976 lt!476981 lt!476982))))

(assert (=> b!1075454 (= lt!476982 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075454 (= lt!476981 (get!17247 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2058 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075454 (= lt!476976 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45419 () ListLongMap!14569)

(assert (=> b!1075454 (= lt!476980 call!45419)))

(declare-fun e!614587 () ListLongMap!14569)

(assert (=> b!1075454 (= e!614587 (+!3236 call!45419 (tuple2!16593 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000) (get!17247 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2058 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075455 () Bool)

(assert (=> b!1075455 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(assert (=> b!1075455 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33703 _values!955)))))

(declare-fun e!614583 () Bool)

(declare-fun lt!476978 () ListLongMap!14569)

(assert (=> b!1075455 (= e!614583 (= (apply!943 lt!476978 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)) (get!17247 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2058 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075456 () Bool)

(declare-fun e!614584 () Bool)

(declare-fun e!614585 () Bool)

(assert (=> b!1075456 (= e!614584 e!614585)))

(declare-fun c!108258 () Bool)

(assert (=> b!1075456 (= c!108258 (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun b!1075457 () Bool)

(declare-fun e!614586 () Bool)

(assert (=> b!1075457 (= e!614586 e!614584)))

(declare-fun c!108257 () Bool)

(declare-fun e!614582 () Bool)

(assert (=> b!1075457 (= c!108257 e!614582)))

(declare-fun res!716799 () Bool)

(assert (=> b!1075457 (=> (not res!716799) (not e!614582))))

(assert (=> b!1075457 (= res!716799 (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun b!1075458 () Bool)

(assert (=> b!1075458 (= e!614587 call!45419)))

(declare-fun b!1075459 () Bool)

(declare-fun e!614588 () ListLongMap!14569)

(assert (=> b!1075459 (= e!614588 (ListLongMap!14570 Nil!23147))))

(declare-fun b!1075460 () Bool)

(declare-fun res!716802 () Bool)

(assert (=> b!1075460 (=> (not res!716802) (not e!614586))))

(assert (=> b!1075460 (= res!716802 (not (contains!6357 lt!476978 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075461 () Bool)

(assert (=> b!1075461 (= e!614582 (validKeyInArray!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075461 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075462 () Bool)

(assert (=> b!1075462 (= e!614588 e!614587)))

(declare-fun c!108255 () Bool)

(assert (=> b!1075462 (= c!108255 (validKeyInArray!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45416 () Bool)

(assert (=> bm!45416 (= call!45419 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun d!129939 () Bool)

(assert (=> d!129939 e!614586))

(declare-fun res!716801 () Bool)

(assert (=> d!129939 (=> (not res!716801) (not e!614586))))

(assert (=> d!129939 (= res!716801 (not (contains!6357 lt!476978 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129939 (= lt!476978 e!614588)))

(declare-fun c!108256 () Bool)

(assert (=> d!129939 (= c!108256 (bvsge #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(assert (=> d!129939 (validMask!0 mask!1515)))

(assert (=> d!129939 (= (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476978)))

(declare-fun b!1075463 () Bool)

(assert (=> b!1075463 (= e!614585 (= lt!476978 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075464 () Bool)

(declare-fun isEmpty!956 (ListLongMap!14569) Bool)

(assert (=> b!1075464 (= e!614585 (isEmpty!956 lt!476978))))

(declare-fun b!1075465 () Bool)

(assert (=> b!1075465 (= e!614584 e!614583)))

(assert (=> b!1075465 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun res!716800 () Bool)

(assert (=> b!1075465 (= res!716800 (contains!6357 lt!476978 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075465 (=> (not res!716800) (not e!614583))))

(assert (= (and d!129939 c!108256) b!1075459))

(assert (= (and d!129939 (not c!108256)) b!1075462))

(assert (= (and b!1075462 c!108255) b!1075454))

(assert (= (and b!1075462 (not c!108255)) b!1075458))

(assert (= (or b!1075454 b!1075458) bm!45416))

(assert (= (and d!129939 res!716801) b!1075460))

(assert (= (and b!1075460 res!716802) b!1075457))

(assert (= (and b!1075457 res!716799) b!1075461))

(assert (= (and b!1075457 c!108257) b!1075465))

(assert (= (and b!1075457 (not c!108257)) b!1075456))

(assert (= (and b!1075465 res!716800) b!1075455))

(assert (= (and b!1075456 c!108258) b!1075463))

(assert (= (and b!1075456 (not c!108258)) b!1075464))

(declare-fun b_lambda!16775 () Bool)

(assert (=> (not b_lambda!16775) (not b!1075454)))

(assert (=> b!1075454 t!32486))

(declare-fun b_and!35057 () Bool)

(assert (= b_and!35055 (and (=> t!32486 result!14789) b_and!35057)))

(declare-fun b_lambda!16777 () Bool)

(assert (=> (not b_lambda!16777) (not b!1075455)))

(assert (=> b!1075455 t!32486))

(declare-fun b_and!35059 () Bool)

(assert (= b_and!35057 (and (=> t!32486 result!14789) b_and!35059)))

(declare-fun m!994691 () Bool)

(assert (=> b!1075464 m!994691))

(assert (=> b!1075461 m!994565))

(assert (=> b!1075461 m!994565))

(assert (=> b!1075461 m!994569))

(assert (=> b!1075465 m!994565))

(assert (=> b!1075465 m!994565))

(declare-fun m!994693 () Bool)

(assert (=> b!1075465 m!994693))

(assert (=> b!1075455 m!994565))

(declare-fun m!994695 () Bool)

(assert (=> b!1075455 m!994695))

(assert (=> b!1075455 m!994615))

(assert (=> b!1075455 m!994615))

(assert (=> b!1075455 m!994617))

(assert (=> b!1075455 m!994619))

(assert (=> b!1075455 m!994617))

(assert (=> b!1075455 m!994565))

(assert (=> b!1075462 m!994565))

(assert (=> b!1075462 m!994565))

(assert (=> b!1075462 m!994569))

(declare-fun m!994697 () Bool)

(assert (=> b!1075463 m!994697))

(assert (=> bm!45416 m!994697))

(declare-fun m!994699 () Bool)

(assert (=> d!129939 m!994699))

(assert (=> d!129939 m!994497))

(declare-fun m!994701 () Bool)

(assert (=> b!1075454 m!994701))

(declare-fun m!994703 () Bool)

(assert (=> b!1075454 m!994703))

(declare-fun m!994705 () Bool)

(assert (=> b!1075454 m!994705))

(declare-fun m!994707 () Bool)

(assert (=> b!1075454 m!994707))

(assert (=> b!1075454 m!994615))

(assert (=> b!1075454 m!994615))

(assert (=> b!1075454 m!994617))

(assert (=> b!1075454 m!994619))

(assert (=> b!1075454 m!994617))

(assert (=> b!1075454 m!994705))

(assert (=> b!1075454 m!994565))

(declare-fun m!994709 () Bool)

(assert (=> b!1075460 m!994709))

(assert (=> b!1075265 d!129939))

(declare-fun b!1075466 () Bool)

(declare-fun lt!476984 () Unit!35337)

(declare-fun lt!476986 () Unit!35337)

(assert (=> b!1075466 (= lt!476984 lt!476986)))

(declare-fun lt!476989 () (_ BitVec 64))

(declare-fun lt!476983 () (_ BitVec 64))

(declare-fun lt!476988 () V!39769)

(declare-fun lt!476987 () ListLongMap!14569)

(assert (=> b!1075466 (not (contains!6357 (+!3236 lt!476987 (tuple2!16593 lt!476983 lt!476988)) lt!476989))))

(assert (=> b!1075466 (= lt!476986 (addStillNotContains!264 lt!476987 lt!476983 lt!476988 lt!476989))))

(assert (=> b!1075466 (= lt!476989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075466 (= lt!476988 (get!17247 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2058 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075466 (= lt!476983 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45420 () ListLongMap!14569)

(assert (=> b!1075466 (= lt!476987 call!45420)))

(declare-fun e!614594 () ListLongMap!14569)

(assert (=> b!1075466 (= e!614594 (+!3236 call!45420 (tuple2!16593 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000) (get!17247 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2058 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075467 () Bool)

(assert (=> b!1075467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(assert (=> b!1075467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33703 _values!955)))))

(declare-fun lt!476985 () ListLongMap!14569)

(declare-fun e!614590 () Bool)

(assert (=> b!1075467 (= e!614590 (= (apply!943 lt!476985 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)) (get!17247 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2058 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075468 () Bool)

(declare-fun e!614591 () Bool)

(declare-fun e!614592 () Bool)

(assert (=> b!1075468 (= e!614591 e!614592)))

(declare-fun c!108262 () Bool)

(assert (=> b!1075468 (= c!108262 (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun b!1075469 () Bool)

(declare-fun e!614593 () Bool)

(assert (=> b!1075469 (= e!614593 e!614591)))

(declare-fun c!108261 () Bool)

(declare-fun e!614589 () Bool)

(assert (=> b!1075469 (= c!108261 e!614589)))

(declare-fun res!716803 () Bool)

(assert (=> b!1075469 (=> (not res!716803) (not e!614589))))

(assert (=> b!1075469 (= res!716803 (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun b!1075470 () Bool)

(assert (=> b!1075470 (= e!614594 call!45420)))

(declare-fun b!1075471 () Bool)

(declare-fun e!614595 () ListLongMap!14569)

(assert (=> b!1075471 (= e!614595 (ListLongMap!14570 Nil!23147))))

(declare-fun b!1075472 () Bool)

(declare-fun res!716806 () Bool)

(assert (=> b!1075472 (=> (not res!716806) (not e!614593))))

(assert (=> b!1075472 (= res!716806 (not (contains!6357 lt!476985 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075473 () Bool)

(assert (=> b!1075473 (= e!614589 (validKeyInArray!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075473 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075474 () Bool)

(assert (=> b!1075474 (= e!614595 e!614594)))

(declare-fun c!108259 () Bool)

(assert (=> b!1075474 (= c!108259 (validKeyInArray!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45417 () Bool)

(assert (=> bm!45417 (= call!45420 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun d!129941 () Bool)

(assert (=> d!129941 e!614593))

(declare-fun res!716805 () Bool)

(assert (=> d!129941 (=> (not res!716805) (not e!614593))))

(assert (=> d!129941 (= res!716805 (not (contains!6357 lt!476985 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129941 (= lt!476985 e!614595)))

(declare-fun c!108260 () Bool)

(assert (=> d!129941 (= c!108260 (bvsge #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(assert (=> d!129941 (validMask!0 mask!1515)))

(assert (=> d!129941 (= (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476985)))

(declare-fun b!1075475 () Bool)

(assert (=> b!1075475 (= e!614592 (= lt!476985 (getCurrentListMapNoExtraKeys!3897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075476 () Bool)

(assert (=> b!1075476 (= e!614592 (isEmpty!956 lt!476985))))

(declare-fun b!1075477 () Bool)

(assert (=> b!1075477 (= e!614591 e!614590)))

(assert (=> b!1075477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(declare-fun res!716804 () Bool)

(assert (=> b!1075477 (= res!716804 (contains!6357 lt!476985 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075477 (=> (not res!716804) (not e!614590))))

(assert (= (and d!129941 c!108260) b!1075471))

(assert (= (and d!129941 (not c!108260)) b!1075474))

(assert (= (and b!1075474 c!108259) b!1075466))

(assert (= (and b!1075474 (not c!108259)) b!1075470))

(assert (= (or b!1075466 b!1075470) bm!45417))

(assert (= (and d!129941 res!716805) b!1075472))

(assert (= (and b!1075472 res!716806) b!1075469))

(assert (= (and b!1075469 res!716803) b!1075473))

(assert (= (and b!1075469 c!108261) b!1075477))

(assert (= (and b!1075469 (not c!108261)) b!1075468))

(assert (= (and b!1075477 res!716804) b!1075467))

(assert (= (and b!1075468 c!108262) b!1075475))

(assert (= (and b!1075468 (not c!108262)) b!1075476))

(declare-fun b_lambda!16779 () Bool)

(assert (=> (not b_lambda!16779) (not b!1075466)))

(assert (=> b!1075466 t!32486))

(declare-fun b_and!35061 () Bool)

(assert (= b_and!35059 (and (=> t!32486 result!14789) b_and!35061)))

(declare-fun b_lambda!16781 () Bool)

(assert (=> (not b_lambda!16781) (not b!1075467)))

(assert (=> b!1075467 t!32486))

(declare-fun b_and!35063 () Bool)

(assert (= b_and!35061 (and (=> t!32486 result!14789) b_and!35063)))

(declare-fun m!994711 () Bool)

(assert (=> b!1075476 m!994711))

(assert (=> b!1075473 m!994565))

(assert (=> b!1075473 m!994565))

(assert (=> b!1075473 m!994569))

(assert (=> b!1075477 m!994565))

(assert (=> b!1075477 m!994565))

(declare-fun m!994713 () Bool)

(assert (=> b!1075477 m!994713))

(assert (=> b!1075467 m!994565))

(declare-fun m!994715 () Bool)

(assert (=> b!1075467 m!994715))

(assert (=> b!1075467 m!994615))

(assert (=> b!1075467 m!994615))

(assert (=> b!1075467 m!994617))

(assert (=> b!1075467 m!994619))

(assert (=> b!1075467 m!994617))

(assert (=> b!1075467 m!994565))

(assert (=> b!1075474 m!994565))

(assert (=> b!1075474 m!994565))

(assert (=> b!1075474 m!994569))

(declare-fun m!994717 () Bool)

(assert (=> b!1075475 m!994717))

(assert (=> bm!45417 m!994717))

(declare-fun m!994719 () Bool)

(assert (=> d!129941 m!994719))

(assert (=> d!129941 m!994497))

(declare-fun m!994721 () Bool)

(assert (=> b!1075466 m!994721))

(declare-fun m!994723 () Bool)

(assert (=> b!1075466 m!994723))

(declare-fun m!994725 () Bool)

(assert (=> b!1075466 m!994725))

(declare-fun m!994727 () Bool)

(assert (=> b!1075466 m!994727))

(assert (=> b!1075466 m!994615))

(assert (=> b!1075466 m!994615))

(assert (=> b!1075466 m!994617))

(assert (=> b!1075466 m!994619))

(assert (=> b!1075466 m!994617))

(assert (=> b!1075466 m!994725))

(assert (=> b!1075466 m!994565))

(declare-fun m!994729 () Bool)

(assert (=> b!1075472 m!994729))

(assert (=> b!1075265 d!129941))

(declare-fun bm!45420 () Bool)

(declare-fun call!45423 () Bool)

(declare-fun c!108265 () Bool)

(assert (=> bm!45420 (= call!45423 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108265 (Cons!23145 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000) Nil!23146) Nil!23146)))))

(declare-fun b!1075488 () Bool)

(declare-fun e!614604 () Bool)

(declare-fun contains!6358 (List!23149 (_ BitVec 64)) Bool)

(assert (=> b!1075488 (= e!614604 (contains!6358 Nil!23146 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075489 () Bool)

(declare-fun e!614607 () Bool)

(assert (=> b!1075489 (= e!614607 call!45423)))

(declare-fun b!1075490 () Bool)

(declare-fun e!614606 () Bool)

(assert (=> b!1075490 (= e!614606 e!614607)))

(assert (=> b!1075490 (= c!108265 (validKeyInArray!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129943 () Bool)

(declare-fun res!716814 () Bool)

(declare-fun e!614605 () Bool)

(assert (=> d!129943 (=> res!716814 e!614605)))

(assert (=> d!129943 (= res!716814 (bvsge #b00000000000000000000000000000000 (size!33702 _keys!1163)))))

(assert (=> d!129943 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23146) e!614605)))

(declare-fun b!1075491 () Bool)

(assert (=> b!1075491 (= e!614607 call!45423)))

(declare-fun b!1075492 () Bool)

(assert (=> b!1075492 (= e!614605 e!614606)))

(declare-fun res!716815 () Bool)

(assert (=> b!1075492 (=> (not res!716815) (not e!614606))))

(assert (=> b!1075492 (= res!716815 (not e!614604))))

(declare-fun res!716813 () Bool)

(assert (=> b!1075492 (=> (not res!716813) (not e!614604))))

(assert (=> b!1075492 (= res!716813 (validKeyInArray!0 (select (arr!33165 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129943 (not res!716814)) b!1075492))

(assert (= (and b!1075492 res!716813) b!1075488))

(assert (= (and b!1075492 res!716815) b!1075490))

(assert (= (and b!1075490 c!108265) b!1075491))

(assert (= (and b!1075490 (not c!108265)) b!1075489))

(assert (= (or b!1075491 b!1075489) bm!45420))

(assert (=> bm!45420 m!994565))

(declare-fun m!994731 () Bool)

(assert (=> bm!45420 m!994731))

(assert (=> b!1075488 m!994565))

(assert (=> b!1075488 m!994565))

(declare-fun m!994733 () Bool)

(assert (=> b!1075488 m!994733))

(assert (=> b!1075490 m!994565))

(assert (=> b!1075490 m!994565))

(assert (=> b!1075490 m!994569))

(assert (=> b!1075492 m!994565))

(assert (=> b!1075492 m!994565))

(assert (=> b!1075492 m!994569))

(assert (=> b!1075260 d!129943))

(declare-fun d!129945 () Bool)

(assert (=> d!129945 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95226 d!129945))

(declare-fun d!129947 () Bool)

(assert (=> d!129947 (= (array_inv!25674 _values!955) (bvsge (size!33703 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95226 d!129947))

(declare-fun d!129949 () Bool)

(assert (=> d!129949 (= (array_inv!25675 _keys!1163) (bvsge (size!33702 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95226 d!129949))

(declare-fun mapNonEmpty!40690 () Bool)

(declare-fun mapRes!40690 () Bool)

(declare-fun tp!77981 () Bool)

(declare-fun e!614612 () Bool)

(assert (=> mapNonEmpty!40690 (= mapRes!40690 (and tp!77981 e!614612))))

(declare-fun mapRest!40690 () (Array (_ BitVec 32) ValueCell!12284))

(declare-fun mapKey!40690 () (_ BitVec 32))

(declare-fun mapValue!40690 () ValueCell!12284)

(assert (=> mapNonEmpty!40690 (= mapRest!40681 (store mapRest!40690 mapKey!40690 mapValue!40690))))

(declare-fun mapIsEmpty!40690 () Bool)

(assert (=> mapIsEmpty!40690 mapRes!40690))

(declare-fun condMapEmpty!40690 () Bool)

(declare-fun mapDefault!40690 () ValueCell!12284)

(assert (=> mapNonEmpty!40681 (= condMapEmpty!40690 (= mapRest!40681 ((as const (Array (_ BitVec 32) ValueCell!12284)) mapDefault!40690)))))

(declare-fun e!614613 () Bool)

(assert (=> mapNonEmpty!40681 (= tp!77965 (and e!614613 mapRes!40690))))

(declare-fun b!1075499 () Bool)

(assert (=> b!1075499 (= e!614612 tp_is_empty!25975)))

(declare-fun b!1075500 () Bool)

(assert (=> b!1075500 (= e!614613 tp_is_empty!25975)))

(assert (= (and mapNonEmpty!40681 condMapEmpty!40690) mapIsEmpty!40690))

(assert (= (and mapNonEmpty!40681 (not condMapEmpty!40690)) mapNonEmpty!40690))

(assert (= (and mapNonEmpty!40690 ((_ is ValueCellFull!12284) mapValue!40690)) b!1075499))

(assert (= (and mapNonEmpty!40681 ((_ is ValueCellFull!12284) mapDefault!40690)) b!1075500))

(declare-fun m!994735 () Bool)

(assert (=> mapNonEmpty!40690 m!994735))

(declare-fun b_lambda!16783 () Bool)

(assert (= b_lambda!16773 (or (and start!95226 b_free!22165) b_lambda!16783)))

(declare-fun b_lambda!16785 () Bool)

(assert (= b_lambda!16777 (or (and start!95226 b_free!22165) b_lambda!16785)))

(declare-fun b_lambda!16787 () Bool)

(assert (= b_lambda!16781 (or (and start!95226 b_free!22165) b_lambda!16787)))

(declare-fun b_lambda!16789 () Bool)

(assert (= b_lambda!16775 (or (and start!95226 b_free!22165) b_lambda!16789)))

(declare-fun b_lambda!16791 () Bool)

(assert (= b_lambda!16771 (or (and start!95226 b_free!22165) b_lambda!16791)))

(declare-fun b_lambda!16793 () Bool)

(assert (= b_lambda!16779 (or (and start!95226 b_free!22165) b_lambda!16793)))

(check-sat (not d!129933) b_and!35063 (not b!1075466) (not b!1075416) (not b!1075380) (not bm!45417) (not b!1075492) (not b!1075398) (not bm!45404) (not b!1075427) (not b!1075463) (not b!1075464) (not d!129937) (not bm!45399) (not b!1075490) (not b!1075413) (not d!129931) (not b!1075455) (not b!1075396) (not b!1075405) (not mapNonEmpty!40690) (not b!1075472) (not b!1075477) tp_is_empty!25975 (not b!1075412) (not b!1075404) (not d!129941) (not b!1075465) (not bm!45413) (not b!1075409) (not bm!45406) (not b!1075476) (not bm!45401) (not b!1075373) (not b_lambda!16783) (not b!1075366) (not d!129927) (not b_next!22165) (not b!1075460) (not bm!45420) (not d!129929) (not b!1075474) (not b!1075473) (not b!1075381) (not b!1075377) (not b!1075461) (not b!1075376) (not bm!45416) (not bm!45408) (not b_lambda!16791) (not b_lambda!16793) (not b!1075394) (not b!1075408) (not bm!45397) (not b!1075428) (not b_lambda!16789) (not b!1075454) (not b!1075488) (not b!1075384) (not b_lambda!16785) (not b!1075372) (not b!1075475) (not d!129925) (not b_lambda!16787) (not bm!45398) (not d!129939) (not bm!45405) (not b!1075462) (not b!1075467))
(check-sat b_and!35063 (not b_next!22165))
