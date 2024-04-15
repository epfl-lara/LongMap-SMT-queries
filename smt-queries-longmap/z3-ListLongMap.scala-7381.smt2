; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94020 () Bool)

(assert start!94020)

(declare-fun b_free!21463 () Bool)

(declare-fun b_next!21463 () Bool)

(assert (=> start!94020 (= b_free!21463 (not b_next!21463))))

(declare-fun tp!75818 () Bool)

(declare-fun b_and!34169 () Bool)

(assert (=> start!94020 (= tp!75818 b_and!34169)))

(declare-fun b!1063331 () Bool)

(declare-fun e!605885 () Bool)

(declare-datatypes ((array!67484 0))(
  ( (array!67485 (arr!32448 (Array (_ BitVec 32) (_ BitVec 64))) (size!32986 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67484)

(assert (=> b!1063331 (= e!605885 (bvsle #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(declare-datatypes ((V!38833 0))(
  ( (V!38834 (val!12687 Int)) )
))
(declare-datatypes ((tuple2!16124 0))(
  ( (tuple2!16125 (_1!8073 (_ BitVec 64)) (_2!8073 V!38833)) )
))
(declare-datatypes ((List!22673 0))(
  ( (Nil!22670) (Cons!22669 (h!23878 tuple2!16124) (t!31977 List!22673)) )
))
(declare-datatypes ((ListLongMap!14093 0))(
  ( (ListLongMap!14094 (toList!7062 List!22673)) )
))
(declare-fun lt!468518 () ListLongMap!14093)

(declare-fun -!580 (ListLongMap!14093 (_ BitVec 64)) ListLongMap!14093)

(assert (=> b!1063331 (= (-!580 lt!468518 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468518)))

(declare-datatypes ((Unit!34713 0))(
  ( (Unit!34714) )
))
(declare-fun lt!468516 () Unit!34713)

(declare-fun removeNotPresentStillSame!32 (ListLongMap!14093 (_ BitVec 64)) Unit!34713)

(assert (=> b!1063331 (= lt!468516 (removeNotPresentStillSame!32 lt!468518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063332 () Bool)

(declare-fun e!605887 () Bool)

(declare-fun e!605886 () Bool)

(assert (=> b!1063332 (= e!605887 (not e!605886))))

(declare-fun res!710011 () Bool)

(assert (=> b!1063332 (=> res!710011 e!605886)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063332 (= res!710011 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468519 () ListLongMap!14093)

(declare-fun lt!468520 () ListLongMap!14093)

(assert (=> b!1063332 (= lt!468519 lt!468520)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38833)

(declare-fun lt!468517 () Unit!34713)

(declare-datatypes ((ValueCell!11933 0))(
  ( (ValueCellFull!11933 (v!15297 V!38833)) (EmptyCell!11933) )
))
(declare-datatypes ((array!67486 0))(
  ( (array!67487 (arr!32449 (Array (_ BitVec 32) ValueCell!11933)) (size!32987 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67486)

(declare-fun minValue!907 () V!38833)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38833)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!662 (array!67484 array!67486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38833 V!38833 V!38833 V!38833 (_ BitVec 32) Int) Unit!34713)

(assert (=> b!1063332 (= lt!468517 (lemmaNoChangeToArrayThenSameMapNoExtras!662 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3668 (array!67484 array!67486 (_ BitVec 32) (_ BitVec 32) V!38833 V!38833 (_ BitVec 32) Int) ListLongMap!14093)

(assert (=> b!1063332 (= lt!468520 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063332 (= lt!468519 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063333 () Bool)

(declare-fun e!605888 () Bool)

(declare-fun e!605891 () Bool)

(declare-fun mapRes!39586 () Bool)

(assert (=> b!1063333 (= e!605888 (and e!605891 mapRes!39586))))

(declare-fun condMapEmpty!39586 () Bool)

(declare-fun mapDefault!39586 () ValueCell!11933)

(assert (=> b!1063333 (= condMapEmpty!39586 (= (arr!32449 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11933)) mapDefault!39586)))))

(declare-fun mapIsEmpty!39586 () Bool)

(assert (=> mapIsEmpty!39586 mapRes!39586))

(declare-fun mapNonEmpty!39586 () Bool)

(declare-fun tp!75817 () Bool)

(declare-fun e!605890 () Bool)

(assert (=> mapNonEmpty!39586 (= mapRes!39586 (and tp!75817 e!605890))))

(declare-fun mapKey!39586 () (_ BitVec 32))

(declare-fun mapValue!39586 () ValueCell!11933)

(declare-fun mapRest!39586 () (Array (_ BitVec 32) ValueCell!11933))

(assert (=> mapNonEmpty!39586 (= (arr!32449 _values!955) (store mapRest!39586 mapKey!39586 mapValue!39586))))

(declare-fun b!1063334 () Bool)

(declare-fun tp_is_empty!25273 () Bool)

(assert (=> b!1063334 (= e!605891 tp_is_empty!25273)))

(declare-fun b!1063335 () Bool)

(assert (=> b!1063335 (= e!605890 tp_is_empty!25273)))

(declare-fun res!710012 () Bool)

(assert (=> start!94020 (=> (not res!710012) (not e!605887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94020 (= res!710012 (validMask!0 mask!1515))))

(assert (=> start!94020 e!605887))

(assert (=> start!94020 true))

(assert (=> start!94020 tp_is_empty!25273))

(declare-fun array_inv!25140 (array!67486) Bool)

(assert (=> start!94020 (and (array_inv!25140 _values!955) e!605888)))

(assert (=> start!94020 tp!75818))

(declare-fun array_inv!25141 (array!67484) Bool)

(assert (=> start!94020 (array_inv!25141 _keys!1163)))

(declare-fun b!1063336 () Bool)

(assert (=> b!1063336 (= e!605886 e!605885)))

(declare-fun res!710016 () Bool)

(assert (=> b!1063336 (=> res!710016 e!605885)))

(declare-fun contains!6230 (ListLongMap!14093 (_ BitVec 64)) Bool)

(assert (=> b!1063336 (= res!710016 (contains!6230 lt!468518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3961 (array!67484 array!67486 (_ BitVec 32) (_ BitVec 32) V!38833 V!38833 (_ BitVec 32) Int) ListLongMap!14093)

(assert (=> b!1063336 (= lt!468518 (getCurrentListMap!3961 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063337 () Bool)

(declare-fun res!710013 () Bool)

(assert (=> b!1063337 (=> (not res!710013) (not e!605887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67484 (_ BitVec 32)) Bool)

(assert (=> b!1063337 (= res!710013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063338 () Bool)

(declare-fun res!710014 () Bool)

(assert (=> b!1063338 (=> (not res!710014) (not e!605887))))

(assert (=> b!1063338 (= res!710014 (and (= (size!32987 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32986 _keys!1163) (size!32987 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063339 () Bool)

(declare-fun res!710015 () Bool)

(assert (=> b!1063339 (=> (not res!710015) (not e!605887))))

(declare-datatypes ((List!22674 0))(
  ( (Nil!22671) (Cons!22670 (h!23879 (_ BitVec 64)) (t!31978 List!22674)) )
))
(declare-fun arrayNoDuplicates!0 (array!67484 (_ BitVec 32) List!22674) Bool)

(assert (=> b!1063339 (= res!710015 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22671))))

(assert (= (and start!94020 res!710012) b!1063338))

(assert (= (and b!1063338 res!710014) b!1063337))

(assert (= (and b!1063337 res!710013) b!1063339))

(assert (= (and b!1063339 res!710015) b!1063332))

(assert (= (and b!1063332 (not res!710011)) b!1063336))

(assert (= (and b!1063336 (not res!710016)) b!1063331))

(assert (= (and b!1063333 condMapEmpty!39586) mapIsEmpty!39586))

(assert (= (and b!1063333 (not condMapEmpty!39586)) mapNonEmpty!39586))

(get-info :version)

(assert (= (and mapNonEmpty!39586 ((_ is ValueCellFull!11933) mapValue!39586)) b!1063335))

(assert (= (and b!1063333 ((_ is ValueCellFull!11933) mapDefault!39586)) b!1063334))

(assert (= start!94020 b!1063333))

(declare-fun m!981547 () Bool)

(assert (=> b!1063339 m!981547))

(declare-fun m!981549 () Bool)

(assert (=> b!1063337 m!981549))

(declare-fun m!981551 () Bool)

(assert (=> b!1063331 m!981551))

(declare-fun m!981553 () Bool)

(assert (=> b!1063331 m!981553))

(declare-fun m!981555 () Bool)

(assert (=> b!1063332 m!981555))

(declare-fun m!981557 () Bool)

(assert (=> b!1063332 m!981557))

(declare-fun m!981559 () Bool)

(assert (=> b!1063332 m!981559))

(declare-fun m!981561 () Bool)

(assert (=> start!94020 m!981561))

(declare-fun m!981563 () Bool)

(assert (=> start!94020 m!981563))

(declare-fun m!981565 () Bool)

(assert (=> start!94020 m!981565))

(declare-fun m!981567 () Bool)

(assert (=> mapNonEmpty!39586 m!981567))

(declare-fun m!981569 () Bool)

(assert (=> b!1063336 m!981569))

(declare-fun m!981571 () Bool)

(assert (=> b!1063336 m!981571))

(check-sat (not b!1063336) (not mapNonEmpty!39586) (not b!1063337) (not b!1063331) (not start!94020) (not b!1063332) tp_is_empty!25273 b_and!34169 (not b!1063339) (not b_next!21463))
(check-sat b_and!34169 (not b_next!21463))
(get-model)

(declare-fun d!128749 () Bool)

(assert (=> d!128749 (= (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468553 () Unit!34713)

(declare-fun choose!1733 (array!67484 array!67486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38833 V!38833 V!38833 V!38833 (_ BitVec 32) Int) Unit!34713)

(assert (=> d!128749 (= lt!468553 (choose!1733 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128749 (validMask!0 mask!1515)))

(assert (=> d!128749 (= (lemmaNoChangeToArrayThenSameMapNoExtras!662 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468553)))

(declare-fun bs!31242 () Bool)

(assert (= bs!31242 d!128749))

(assert (=> bs!31242 m!981559))

(assert (=> bs!31242 m!981557))

(declare-fun m!981625 () Bool)

(assert (=> bs!31242 m!981625))

(assert (=> bs!31242 m!981561))

(assert (=> b!1063332 d!128749))

(declare-fun e!605951 () Bool)

(declare-fun b!1063418 () Bool)

(declare-fun lt!468568 () ListLongMap!14093)

(assert (=> b!1063418 (= e!605951 (= lt!468568 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1063419 () Bool)

(assert (=> b!1063419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(assert (=> b!1063419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32987 _values!955)))))

(declare-fun e!605953 () Bool)

(declare-fun apply!913 (ListLongMap!14093 (_ BitVec 64)) V!38833)

(declare-fun get!16965 (ValueCell!11933 V!38833) V!38833)

(declare-fun dynLambda!2012 (Int (_ BitVec 64)) V!38833)

(assert (=> b!1063419 (= e!605953 (= (apply!913 lt!468568 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)) (get!16965 (select (arr!32449 _values!955) #b00000000000000000000000000000000) (dynLambda!2012 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1063420 () Bool)

(declare-fun e!605952 () Bool)

(assert (=> b!1063420 (= e!605952 e!605951)))

(declare-fun c!107254 () Bool)

(assert (=> b!1063420 (= c!107254 (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(declare-fun d!128751 () Bool)

(declare-fun e!605948 () Bool)

(assert (=> d!128751 e!605948))

(declare-fun res!710062 () Bool)

(assert (=> d!128751 (=> (not res!710062) (not e!605948))))

(assert (=> d!128751 (= res!710062 (not (contains!6230 lt!468568 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!605954 () ListLongMap!14093)

(assert (=> d!128751 (= lt!468568 e!605954)))

(declare-fun c!107255 () Bool)

(assert (=> d!128751 (= c!107255 (bvsge #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(assert (=> d!128751 (validMask!0 mask!1515)))

(assert (=> d!128751 (= (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468568)))

(declare-fun b!1063421 () Bool)

(declare-fun e!605950 () ListLongMap!14093)

(assert (=> b!1063421 (= e!605954 e!605950)))

(declare-fun c!107253 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1063421 (= c!107253 (validKeyInArray!0 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063422 () Bool)

(declare-fun lt!468570 () Unit!34713)

(declare-fun lt!468569 () Unit!34713)

(assert (=> b!1063422 (= lt!468570 lt!468569)))

(declare-fun lt!468573 () V!38833)

(declare-fun lt!468571 () ListLongMap!14093)

(declare-fun lt!468574 () (_ BitVec 64))

(declare-fun lt!468572 () (_ BitVec 64))

(declare-fun +!3144 (ListLongMap!14093 tuple2!16124) ListLongMap!14093)

(assert (=> b!1063422 (not (contains!6230 (+!3144 lt!468571 (tuple2!16125 lt!468572 lt!468573)) lt!468574))))

(declare-fun addStillNotContains!249 (ListLongMap!14093 (_ BitVec 64) V!38833 (_ BitVec 64)) Unit!34713)

(assert (=> b!1063422 (= lt!468569 (addStillNotContains!249 lt!468571 lt!468572 lt!468573 lt!468574))))

(assert (=> b!1063422 (= lt!468574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1063422 (= lt!468573 (get!16965 (select (arr!32449 _values!955) #b00000000000000000000000000000000) (dynLambda!2012 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1063422 (= lt!468572 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44920 () ListLongMap!14093)

(assert (=> b!1063422 (= lt!468571 call!44920)))

(assert (=> b!1063422 (= e!605950 (+!3144 call!44920 (tuple2!16125 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000) (get!16965 (select (arr!32449 _values!955) #b00000000000000000000000000000000) (dynLambda!2012 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1063423 () Bool)

(assert (=> b!1063423 (= e!605950 call!44920)))

(declare-fun b!1063424 () Bool)

(assert (=> b!1063424 (= e!605948 e!605952)))

(declare-fun c!107252 () Bool)

(declare-fun e!605949 () Bool)

(assert (=> b!1063424 (= c!107252 e!605949)))

(declare-fun res!710061 () Bool)

(assert (=> b!1063424 (=> (not res!710061) (not e!605949))))

(assert (=> b!1063424 (= res!710061 (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(declare-fun b!1063425 () Bool)

(declare-fun isEmpty!943 (ListLongMap!14093) Bool)

(assert (=> b!1063425 (= e!605951 (isEmpty!943 lt!468568))))

(declare-fun b!1063426 () Bool)

(assert (=> b!1063426 (= e!605949 (validKeyInArray!0 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063426 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1063427 () Bool)

(assert (=> b!1063427 (= e!605952 e!605953)))

(assert (=> b!1063427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(declare-fun res!710064 () Bool)

(assert (=> b!1063427 (= res!710064 (contains!6230 lt!468568 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063427 (=> (not res!710064) (not e!605953))))

(declare-fun bm!44917 () Bool)

(assert (=> bm!44917 (= call!44920 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1063428 () Bool)

(assert (=> b!1063428 (= e!605954 (ListLongMap!14094 Nil!22670))))

(declare-fun b!1063429 () Bool)

(declare-fun res!710063 () Bool)

(assert (=> b!1063429 (=> (not res!710063) (not e!605948))))

(assert (=> b!1063429 (= res!710063 (not (contains!6230 lt!468568 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128751 c!107255) b!1063428))

(assert (= (and d!128751 (not c!107255)) b!1063421))

(assert (= (and b!1063421 c!107253) b!1063422))

(assert (= (and b!1063421 (not c!107253)) b!1063423))

(assert (= (or b!1063422 b!1063423) bm!44917))

(assert (= (and d!128751 res!710062) b!1063429))

(assert (= (and b!1063429 res!710063) b!1063424))

(assert (= (and b!1063424 res!710061) b!1063426))

(assert (= (and b!1063424 c!107252) b!1063427))

(assert (= (and b!1063424 (not c!107252)) b!1063420))

(assert (= (and b!1063427 res!710064) b!1063419))

(assert (= (and b!1063420 c!107254) b!1063418))

(assert (= (and b!1063420 (not c!107254)) b!1063425))

(declare-fun b_lambda!16459 () Bool)

(assert (=> (not b_lambda!16459) (not b!1063419)))

(declare-fun t!31983 () Bool)

(declare-fun tb!7127 () Bool)

(assert (=> (and start!94020 (= defaultEntry!963 defaultEntry!963) t!31983) tb!7127))

(declare-fun result!14705 () Bool)

(assert (=> tb!7127 (= result!14705 tp_is_empty!25273)))

(assert (=> b!1063419 t!31983))

(declare-fun b_and!34175 () Bool)

(assert (= b_and!34169 (and (=> t!31983 result!14705) b_and!34175)))

(declare-fun b_lambda!16461 () Bool)

(assert (=> (not b_lambda!16461) (not b!1063422)))

(assert (=> b!1063422 t!31983))

(declare-fun b_and!34177 () Bool)

(assert (= b_and!34175 (and (=> t!31983 result!14705) b_and!34177)))

(declare-fun m!981627 () Bool)

(assert (=> b!1063422 m!981627))

(declare-fun m!981629 () Bool)

(assert (=> b!1063422 m!981629))

(declare-fun m!981631 () Bool)

(assert (=> b!1063422 m!981631))

(declare-fun m!981633 () Bool)

(assert (=> b!1063422 m!981633))

(declare-fun m!981635 () Bool)

(assert (=> b!1063422 m!981635))

(declare-fun m!981637 () Bool)

(assert (=> b!1063422 m!981637))

(assert (=> b!1063422 m!981637))

(declare-fun m!981639 () Bool)

(assert (=> b!1063422 m!981639))

(assert (=> b!1063422 m!981633))

(assert (=> b!1063422 m!981627))

(declare-fun m!981641 () Bool)

(assert (=> b!1063422 m!981641))

(declare-fun m!981643 () Bool)

(assert (=> d!128751 m!981643))

(assert (=> d!128751 m!981561))

(declare-fun m!981645 () Bool)

(assert (=> b!1063425 m!981645))

(assert (=> b!1063421 m!981635))

(assert (=> b!1063421 m!981635))

(declare-fun m!981647 () Bool)

(assert (=> b!1063421 m!981647))

(assert (=> b!1063419 m!981627))

(assert (=> b!1063419 m!981635))

(declare-fun m!981649 () Bool)

(assert (=> b!1063419 m!981649))

(assert (=> b!1063419 m!981633))

(assert (=> b!1063419 m!981635))

(assert (=> b!1063419 m!981633))

(assert (=> b!1063419 m!981627))

(assert (=> b!1063419 m!981641))

(declare-fun m!981651 () Bool)

(assert (=> b!1063418 m!981651))

(declare-fun m!981653 () Bool)

(assert (=> b!1063429 m!981653))

(assert (=> b!1063426 m!981635))

(assert (=> b!1063426 m!981635))

(assert (=> b!1063426 m!981647))

(assert (=> b!1063427 m!981635))

(assert (=> b!1063427 m!981635))

(declare-fun m!981655 () Bool)

(assert (=> b!1063427 m!981655))

(assert (=> bm!44917 m!981651))

(assert (=> b!1063332 d!128751))

(declare-fun b!1063432 () Bool)

(declare-fun lt!468575 () ListLongMap!14093)

(declare-fun e!605958 () Bool)

(assert (=> b!1063432 (= e!605958 (= lt!468575 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1063433 () Bool)

(assert (=> b!1063433 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(assert (=> b!1063433 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32987 _values!955)))))

(declare-fun e!605960 () Bool)

(assert (=> b!1063433 (= e!605960 (= (apply!913 lt!468575 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)) (get!16965 (select (arr!32449 _values!955) #b00000000000000000000000000000000) (dynLambda!2012 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1063434 () Bool)

(declare-fun e!605959 () Bool)

(assert (=> b!1063434 (= e!605959 e!605958)))

(declare-fun c!107258 () Bool)

(assert (=> b!1063434 (= c!107258 (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(declare-fun d!128753 () Bool)

(declare-fun e!605955 () Bool)

(assert (=> d!128753 e!605955))

(declare-fun res!710066 () Bool)

(assert (=> d!128753 (=> (not res!710066) (not e!605955))))

(assert (=> d!128753 (= res!710066 (not (contains!6230 lt!468575 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!605961 () ListLongMap!14093)

(assert (=> d!128753 (= lt!468575 e!605961)))

(declare-fun c!107259 () Bool)

(assert (=> d!128753 (= c!107259 (bvsge #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(assert (=> d!128753 (validMask!0 mask!1515)))

(assert (=> d!128753 (= (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468575)))

(declare-fun b!1063435 () Bool)

(declare-fun e!605957 () ListLongMap!14093)

(assert (=> b!1063435 (= e!605961 e!605957)))

(declare-fun c!107257 () Bool)

(assert (=> b!1063435 (= c!107257 (validKeyInArray!0 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063436 () Bool)

(declare-fun lt!468577 () Unit!34713)

(declare-fun lt!468576 () Unit!34713)

(assert (=> b!1063436 (= lt!468577 lt!468576)))

(declare-fun lt!468581 () (_ BitVec 64))

(declare-fun lt!468579 () (_ BitVec 64))

(declare-fun lt!468580 () V!38833)

(declare-fun lt!468578 () ListLongMap!14093)

(assert (=> b!1063436 (not (contains!6230 (+!3144 lt!468578 (tuple2!16125 lt!468579 lt!468580)) lt!468581))))

(assert (=> b!1063436 (= lt!468576 (addStillNotContains!249 lt!468578 lt!468579 lt!468580 lt!468581))))

(assert (=> b!1063436 (= lt!468581 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1063436 (= lt!468580 (get!16965 (select (arr!32449 _values!955) #b00000000000000000000000000000000) (dynLambda!2012 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1063436 (= lt!468579 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44921 () ListLongMap!14093)

(assert (=> b!1063436 (= lt!468578 call!44921)))

(assert (=> b!1063436 (= e!605957 (+!3144 call!44921 (tuple2!16125 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000) (get!16965 (select (arr!32449 _values!955) #b00000000000000000000000000000000) (dynLambda!2012 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1063437 () Bool)

(assert (=> b!1063437 (= e!605957 call!44921)))

(declare-fun b!1063438 () Bool)

(assert (=> b!1063438 (= e!605955 e!605959)))

(declare-fun c!107256 () Bool)

(declare-fun e!605956 () Bool)

(assert (=> b!1063438 (= c!107256 e!605956)))

(declare-fun res!710065 () Bool)

(assert (=> b!1063438 (=> (not res!710065) (not e!605956))))

(assert (=> b!1063438 (= res!710065 (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(declare-fun b!1063439 () Bool)

(assert (=> b!1063439 (= e!605958 (isEmpty!943 lt!468575))))

(declare-fun b!1063440 () Bool)

(assert (=> b!1063440 (= e!605956 (validKeyInArray!0 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063440 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1063441 () Bool)

(assert (=> b!1063441 (= e!605959 e!605960)))

(assert (=> b!1063441 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(declare-fun res!710068 () Bool)

(assert (=> b!1063441 (= res!710068 (contains!6230 lt!468575 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063441 (=> (not res!710068) (not e!605960))))

(declare-fun bm!44918 () Bool)

(assert (=> bm!44918 (= call!44921 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1063442 () Bool)

(assert (=> b!1063442 (= e!605961 (ListLongMap!14094 Nil!22670))))

(declare-fun b!1063443 () Bool)

(declare-fun res!710067 () Bool)

(assert (=> b!1063443 (=> (not res!710067) (not e!605955))))

(assert (=> b!1063443 (= res!710067 (not (contains!6230 lt!468575 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128753 c!107259) b!1063442))

(assert (= (and d!128753 (not c!107259)) b!1063435))

(assert (= (and b!1063435 c!107257) b!1063436))

(assert (= (and b!1063435 (not c!107257)) b!1063437))

(assert (= (or b!1063436 b!1063437) bm!44918))

(assert (= (and d!128753 res!710066) b!1063443))

(assert (= (and b!1063443 res!710067) b!1063438))

(assert (= (and b!1063438 res!710065) b!1063440))

(assert (= (and b!1063438 c!107256) b!1063441))

(assert (= (and b!1063438 (not c!107256)) b!1063434))

(assert (= (and b!1063441 res!710068) b!1063433))

(assert (= (and b!1063434 c!107258) b!1063432))

(assert (= (and b!1063434 (not c!107258)) b!1063439))

(declare-fun b_lambda!16463 () Bool)

(assert (=> (not b_lambda!16463) (not b!1063433)))

(assert (=> b!1063433 t!31983))

(declare-fun b_and!34179 () Bool)

(assert (= b_and!34177 (and (=> t!31983 result!14705) b_and!34179)))

(declare-fun b_lambda!16465 () Bool)

(assert (=> (not b_lambda!16465) (not b!1063436)))

(assert (=> b!1063436 t!31983))

(declare-fun b_and!34181 () Bool)

(assert (= b_and!34179 (and (=> t!31983 result!14705) b_and!34181)))

(assert (=> b!1063436 m!981627))

(declare-fun m!981657 () Bool)

(assert (=> b!1063436 m!981657))

(declare-fun m!981659 () Bool)

(assert (=> b!1063436 m!981659))

(assert (=> b!1063436 m!981633))

(assert (=> b!1063436 m!981635))

(declare-fun m!981661 () Bool)

(assert (=> b!1063436 m!981661))

(assert (=> b!1063436 m!981661))

(declare-fun m!981663 () Bool)

(assert (=> b!1063436 m!981663))

(assert (=> b!1063436 m!981633))

(assert (=> b!1063436 m!981627))

(assert (=> b!1063436 m!981641))

(declare-fun m!981665 () Bool)

(assert (=> d!128753 m!981665))

(assert (=> d!128753 m!981561))

(declare-fun m!981667 () Bool)

(assert (=> b!1063439 m!981667))

(assert (=> b!1063435 m!981635))

(assert (=> b!1063435 m!981635))

(assert (=> b!1063435 m!981647))

(assert (=> b!1063433 m!981627))

(assert (=> b!1063433 m!981635))

(declare-fun m!981669 () Bool)

(assert (=> b!1063433 m!981669))

(assert (=> b!1063433 m!981633))

(assert (=> b!1063433 m!981635))

(assert (=> b!1063433 m!981633))

(assert (=> b!1063433 m!981627))

(assert (=> b!1063433 m!981641))

(declare-fun m!981671 () Bool)

(assert (=> b!1063432 m!981671))

(declare-fun m!981673 () Bool)

(assert (=> b!1063443 m!981673))

(assert (=> b!1063440 m!981635))

(assert (=> b!1063440 m!981635))

(assert (=> b!1063440 m!981647))

(assert (=> b!1063441 m!981635))

(assert (=> b!1063441 m!981635))

(declare-fun m!981675 () Bool)

(assert (=> b!1063441 m!981675))

(assert (=> bm!44918 m!981671))

(assert (=> b!1063332 d!128753))

(declare-fun d!128755 () Bool)

(declare-fun e!605966 () Bool)

(assert (=> d!128755 e!605966))

(declare-fun res!710071 () Bool)

(assert (=> d!128755 (=> res!710071 e!605966)))

(declare-fun lt!468591 () Bool)

(assert (=> d!128755 (= res!710071 (not lt!468591))))

(declare-fun lt!468590 () Bool)

(assert (=> d!128755 (= lt!468591 lt!468590)))

(declare-fun lt!468592 () Unit!34713)

(declare-fun e!605967 () Unit!34713)

(assert (=> d!128755 (= lt!468592 e!605967)))

(declare-fun c!107262 () Bool)

(assert (=> d!128755 (= c!107262 lt!468590)))

(declare-fun containsKey!573 (List!22673 (_ BitVec 64)) Bool)

(assert (=> d!128755 (= lt!468590 (containsKey!573 (toList!7062 lt!468518) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128755 (= (contains!6230 lt!468518 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468591)))

(declare-fun b!1063450 () Bool)

(declare-fun lt!468593 () Unit!34713)

(assert (=> b!1063450 (= e!605967 lt!468593)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!405 (List!22673 (_ BitVec 64)) Unit!34713)

(assert (=> b!1063450 (= lt!468593 (lemmaContainsKeyImpliesGetValueByKeyDefined!405 (toList!7062 lt!468518) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!651 0))(
  ( (Some!650 (v!15300 V!38833)) (None!649) )
))
(declare-fun isDefined!448 (Option!651) Bool)

(declare-fun getValueByKey!600 (List!22673 (_ BitVec 64)) Option!651)

(assert (=> b!1063450 (isDefined!448 (getValueByKey!600 (toList!7062 lt!468518) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063451 () Bool)

(declare-fun Unit!34719 () Unit!34713)

(assert (=> b!1063451 (= e!605967 Unit!34719)))

(declare-fun b!1063452 () Bool)

(assert (=> b!1063452 (= e!605966 (isDefined!448 (getValueByKey!600 (toList!7062 lt!468518) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128755 c!107262) b!1063450))

(assert (= (and d!128755 (not c!107262)) b!1063451))

(assert (= (and d!128755 (not res!710071)) b!1063452))

(declare-fun m!981677 () Bool)

(assert (=> d!128755 m!981677))

(declare-fun m!981679 () Bool)

(assert (=> b!1063450 m!981679))

(declare-fun m!981681 () Bool)

(assert (=> b!1063450 m!981681))

(assert (=> b!1063450 m!981681))

(declare-fun m!981683 () Bool)

(assert (=> b!1063450 m!981683))

(assert (=> b!1063452 m!981681))

(assert (=> b!1063452 m!981681))

(assert (=> b!1063452 m!981683))

(assert (=> b!1063336 d!128755))

(declare-fun bm!44933 () Bool)

(declare-fun call!44939 () ListLongMap!14093)

(declare-fun call!44937 () ListLongMap!14093)

(assert (=> bm!44933 (= call!44939 call!44937)))

(declare-fun b!1063495 () Bool)

(declare-fun e!605999 () Unit!34713)

(declare-fun Unit!34720 () Unit!34713)

(assert (=> b!1063495 (= e!605999 Unit!34720)))

(declare-fun b!1063496 () Bool)

(declare-fun e!605998 () Bool)

(declare-fun e!606006 () Bool)

(assert (=> b!1063496 (= e!605998 e!606006)))

(declare-fun c!107278 () Bool)

(assert (=> b!1063496 (= c!107278 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44934 () Bool)

(declare-fun c!107280 () Bool)

(declare-fun c!107276 () Bool)

(declare-fun call!44938 () ListLongMap!14093)

(declare-fun call!44940 () ListLongMap!14093)

(assert (=> bm!44934 (= call!44940 (+!3144 (ite c!107276 call!44937 (ite c!107280 call!44939 call!44938)) (ite (or c!107276 c!107280) (tuple2!16125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1063497 () Bool)

(declare-fun call!44936 () Bool)

(assert (=> b!1063497 (= e!606006 (not call!44936))))

(declare-fun b!1063498 () Bool)

(declare-fun e!605997 () ListLongMap!14093)

(assert (=> b!1063498 (= e!605997 call!44938)))

(declare-fun bm!44935 () Bool)

(declare-fun call!44941 () Bool)

(declare-fun lt!468645 () ListLongMap!14093)

(assert (=> bm!44935 (= call!44941 (contains!6230 lt!468645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44936 () Bool)

(assert (=> bm!44936 (= call!44937 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063499 () Bool)

(declare-fun lt!468653 () Unit!34713)

(assert (=> b!1063499 (= e!605999 lt!468653)))

(declare-fun lt!468644 () ListLongMap!14093)

(assert (=> b!1063499 (= lt!468644 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468650 () (_ BitVec 64))

(assert (=> b!1063499 (= lt!468650 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468647 () (_ BitVec 64))

(assert (=> b!1063499 (= lt!468647 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468657 () Unit!34713)

(declare-fun addStillContains!630 (ListLongMap!14093 (_ BitVec 64) V!38833 (_ BitVec 64)) Unit!34713)

(assert (=> b!1063499 (= lt!468657 (addStillContains!630 lt!468644 lt!468650 zeroValueBefore!47 lt!468647))))

(assert (=> b!1063499 (contains!6230 (+!3144 lt!468644 (tuple2!16125 lt!468650 zeroValueBefore!47)) lt!468647)))

(declare-fun lt!468655 () Unit!34713)

(assert (=> b!1063499 (= lt!468655 lt!468657)))

(declare-fun lt!468654 () ListLongMap!14093)

(assert (=> b!1063499 (= lt!468654 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468643 () (_ BitVec 64))

(assert (=> b!1063499 (= lt!468643 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468656 () (_ BitVec 64))

(assert (=> b!1063499 (= lt!468656 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468646 () Unit!34713)

(declare-fun addApplyDifferent!486 (ListLongMap!14093 (_ BitVec 64) V!38833 (_ BitVec 64)) Unit!34713)

(assert (=> b!1063499 (= lt!468646 (addApplyDifferent!486 lt!468654 lt!468643 minValue!907 lt!468656))))

(assert (=> b!1063499 (= (apply!913 (+!3144 lt!468654 (tuple2!16125 lt!468643 minValue!907)) lt!468656) (apply!913 lt!468654 lt!468656))))

(declare-fun lt!468648 () Unit!34713)

(assert (=> b!1063499 (= lt!468648 lt!468646)))

(declare-fun lt!468640 () ListLongMap!14093)

(assert (=> b!1063499 (= lt!468640 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468651 () (_ BitVec 64))

(assert (=> b!1063499 (= lt!468651 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468658 () (_ BitVec 64))

(assert (=> b!1063499 (= lt!468658 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468639 () Unit!34713)

(assert (=> b!1063499 (= lt!468639 (addApplyDifferent!486 lt!468640 lt!468651 zeroValueBefore!47 lt!468658))))

(assert (=> b!1063499 (= (apply!913 (+!3144 lt!468640 (tuple2!16125 lt!468651 zeroValueBefore!47)) lt!468658) (apply!913 lt!468640 lt!468658))))

(declare-fun lt!468638 () Unit!34713)

(assert (=> b!1063499 (= lt!468638 lt!468639)))

(declare-fun lt!468641 () ListLongMap!14093)

(assert (=> b!1063499 (= lt!468641 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468652 () (_ BitVec 64))

(assert (=> b!1063499 (= lt!468652 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468649 () (_ BitVec 64))

(assert (=> b!1063499 (= lt!468649 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1063499 (= lt!468653 (addApplyDifferent!486 lt!468641 lt!468652 minValue!907 lt!468649))))

(assert (=> b!1063499 (= (apply!913 (+!3144 lt!468641 (tuple2!16125 lt!468652 minValue!907)) lt!468649) (apply!913 lt!468641 lt!468649))))

(declare-fun b!1063500 () Bool)

(declare-fun call!44942 () ListLongMap!14093)

(assert (=> b!1063500 (= e!605997 call!44942)))

(declare-fun b!1063501 () Bool)

(declare-fun res!710098 () Bool)

(assert (=> b!1063501 (=> (not res!710098) (not e!605998))))

(declare-fun e!606002 () Bool)

(assert (=> b!1063501 (= res!710098 e!606002)))

(declare-fun res!710097 () Bool)

(assert (=> b!1063501 (=> res!710097 e!606002)))

(declare-fun e!606004 () Bool)

(assert (=> b!1063501 (= res!710097 (not e!606004))))

(declare-fun res!710092 () Bool)

(assert (=> b!1063501 (=> (not res!710092) (not e!606004))))

(assert (=> b!1063501 (= res!710092 (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(declare-fun b!1063502 () Bool)

(declare-fun e!605994 () Bool)

(assert (=> b!1063502 (= e!605994 (not call!44941))))

(declare-fun bm!44937 () Bool)

(assert (=> bm!44937 (= call!44942 call!44940)))

(declare-fun b!1063504 () Bool)

(declare-fun e!606005 () Bool)

(assert (=> b!1063504 (= e!606005 (validKeyInArray!0 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063505 () Bool)

(declare-fun e!606000 () Bool)

(assert (=> b!1063505 (= e!606000 (= (apply!913 lt!468645 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1063506 () Bool)

(declare-fun e!605995 () Bool)

(assert (=> b!1063506 (= e!605995 (= (apply!913 lt!468645 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1063507 () Bool)

(declare-fun c!107275 () Bool)

(assert (=> b!1063507 (= c!107275 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!606003 () ListLongMap!14093)

(assert (=> b!1063507 (= e!606003 e!605997)))

(declare-fun b!1063508 () Bool)

(declare-fun e!605996 () Bool)

(assert (=> b!1063508 (= e!606002 e!605996)))

(declare-fun res!710091 () Bool)

(assert (=> b!1063508 (=> (not res!710091) (not e!605996))))

(assert (=> b!1063508 (= res!710091 (contains!6230 lt!468645 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063508 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(declare-fun b!1063509 () Bool)

(declare-fun e!606001 () ListLongMap!14093)

(assert (=> b!1063509 (= e!606001 e!606003)))

(assert (=> b!1063509 (= c!107280 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1063510 () Bool)

(assert (=> b!1063510 (= e!606001 (+!3144 call!44940 (tuple2!16125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1063511 () Bool)

(assert (=> b!1063511 (= e!605994 e!605995)))

(declare-fun res!710090 () Bool)

(assert (=> b!1063511 (= res!710090 call!44941)))

(assert (=> b!1063511 (=> (not res!710090) (not e!605995))))

(declare-fun bm!44938 () Bool)

(assert (=> bm!44938 (= call!44938 call!44939)))

(declare-fun b!1063512 () Bool)

(declare-fun res!710096 () Bool)

(assert (=> b!1063512 (=> (not res!710096) (not e!605998))))

(assert (=> b!1063512 (= res!710096 e!605994)))

(declare-fun c!107279 () Bool)

(assert (=> b!1063512 (= c!107279 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063513 () Bool)

(assert (=> b!1063513 (= e!606004 (validKeyInArray!0 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44939 () Bool)

(assert (=> bm!44939 (= call!44936 (contains!6230 lt!468645 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063503 () Bool)

(assert (=> b!1063503 (= e!606003 call!44942)))

(declare-fun d!128757 () Bool)

(assert (=> d!128757 e!605998))

(declare-fun res!710095 () Bool)

(assert (=> d!128757 (=> (not res!710095) (not e!605998))))

(assert (=> d!128757 (= res!710095 (or (bvsge #b00000000000000000000000000000000 (size!32986 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))))

(declare-fun lt!468659 () ListLongMap!14093)

(assert (=> d!128757 (= lt!468645 lt!468659)))

(declare-fun lt!468642 () Unit!34713)

(assert (=> d!128757 (= lt!468642 e!605999)))

(declare-fun c!107277 () Bool)

(assert (=> d!128757 (= c!107277 e!606005)))

(declare-fun res!710093 () Bool)

(assert (=> d!128757 (=> (not res!710093) (not e!606005))))

(assert (=> d!128757 (= res!710093 (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(assert (=> d!128757 (= lt!468659 e!606001)))

(assert (=> d!128757 (= c!107276 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!128757 (validMask!0 mask!1515)))

(assert (=> d!128757 (= (getCurrentListMap!3961 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468645)))

(declare-fun b!1063514 () Bool)

(assert (=> b!1063514 (= e!606006 e!606000)))

(declare-fun res!710094 () Bool)

(assert (=> b!1063514 (= res!710094 call!44936)))

(assert (=> b!1063514 (=> (not res!710094) (not e!606000))))

(declare-fun b!1063515 () Bool)

(assert (=> b!1063515 (= e!605996 (= (apply!913 lt!468645 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)) (get!16965 (select (arr!32449 _values!955) #b00000000000000000000000000000000) (dynLambda!2012 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1063515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32987 _values!955)))))

(assert (=> b!1063515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(assert (= (and d!128757 c!107276) b!1063510))

(assert (= (and d!128757 (not c!107276)) b!1063509))

(assert (= (and b!1063509 c!107280) b!1063503))

(assert (= (and b!1063509 (not c!107280)) b!1063507))

(assert (= (and b!1063507 c!107275) b!1063500))

(assert (= (and b!1063507 (not c!107275)) b!1063498))

(assert (= (or b!1063500 b!1063498) bm!44938))

(assert (= (or b!1063503 bm!44938) bm!44933))

(assert (= (or b!1063503 b!1063500) bm!44937))

(assert (= (or b!1063510 bm!44933) bm!44936))

(assert (= (or b!1063510 bm!44937) bm!44934))

(assert (= (and d!128757 res!710093) b!1063504))

(assert (= (and d!128757 c!107277) b!1063499))

(assert (= (and d!128757 (not c!107277)) b!1063495))

(assert (= (and d!128757 res!710095) b!1063501))

(assert (= (and b!1063501 res!710092) b!1063513))

(assert (= (and b!1063501 (not res!710097)) b!1063508))

(assert (= (and b!1063508 res!710091) b!1063515))

(assert (= (and b!1063501 res!710098) b!1063512))

(assert (= (and b!1063512 c!107279) b!1063511))

(assert (= (and b!1063512 (not c!107279)) b!1063502))

(assert (= (and b!1063511 res!710090) b!1063506))

(assert (= (or b!1063511 b!1063502) bm!44935))

(assert (= (and b!1063512 res!710096) b!1063496))

(assert (= (and b!1063496 c!107278) b!1063514))

(assert (= (and b!1063496 (not c!107278)) b!1063497))

(assert (= (and b!1063514 res!710094) b!1063505))

(assert (= (or b!1063514 b!1063497) bm!44939))

(declare-fun b_lambda!16467 () Bool)

(assert (=> (not b_lambda!16467) (not b!1063515)))

(assert (=> b!1063515 t!31983))

(declare-fun b_and!34183 () Bool)

(assert (= b_and!34181 (and (=> t!31983 result!14705) b_and!34183)))

(assert (=> bm!44936 m!981559))

(declare-fun m!981685 () Bool)

(assert (=> b!1063505 m!981685))

(declare-fun m!981687 () Bool)

(assert (=> b!1063499 m!981687))

(declare-fun m!981689 () Bool)

(assert (=> b!1063499 m!981689))

(declare-fun m!981691 () Bool)

(assert (=> b!1063499 m!981691))

(declare-fun m!981693 () Bool)

(assert (=> b!1063499 m!981693))

(declare-fun m!981695 () Bool)

(assert (=> b!1063499 m!981695))

(declare-fun m!981697 () Bool)

(assert (=> b!1063499 m!981697))

(declare-fun m!981699 () Bool)

(assert (=> b!1063499 m!981699))

(declare-fun m!981701 () Bool)

(assert (=> b!1063499 m!981701))

(declare-fun m!981703 () Bool)

(assert (=> b!1063499 m!981703))

(declare-fun m!981705 () Bool)

(assert (=> b!1063499 m!981705))

(assert (=> b!1063499 m!981559))

(assert (=> b!1063499 m!981635))

(declare-fun m!981707 () Bool)

(assert (=> b!1063499 m!981707))

(declare-fun m!981709 () Bool)

(assert (=> b!1063499 m!981709))

(assert (=> b!1063499 m!981705))

(declare-fun m!981711 () Bool)

(assert (=> b!1063499 m!981711))

(assert (=> b!1063499 m!981689))

(declare-fun m!981713 () Bool)

(assert (=> b!1063499 m!981713))

(assert (=> b!1063499 m!981695))

(assert (=> b!1063499 m!981699))

(declare-fun m!981715 () Bool)

(assert (=> b!1063499 m!981715))

(declare-fun m!981717 () Bool)

(assert (=> bm!44934 m!981717))

(declare-fun m!981719 () Bool)

(assert (=> bm!44935 m!981719))

(declare-fun m!981721 () Bool)

(assert (=> bm!44939 m!981721))

(assert (=> d!128757 m!981561))

(assert (=> b!1063515 m!981635))

(declare-fun m!981723 () Bool)

(assert (=> b!1063515 m!981723))

(assert (=> b!1063515 m!981627))

(assert (=> b!1063515 m!981633))

(assert (=> b!1063515 m!981633))

(assert (=> b!1063515 m!981627))

(assert (=> b!1063515 m!981641))

(assert (=> b!1063515 m!981635))

(declare-fun m!981725 () Bool)

(assert (=> b!1063510 m!981725))

(declare-fun m!981727 () Bool)

(assert (=> b!1063506 m!981727))

(assert (=> b!1063513 m!981635))

(assert (=> b!1063513 m!981635))

(assert (=> b!1063513 m!981647))

(assert (=> b!1063508 m!981635))

(assert (=> b!1063508 m!981635))

(declare-fun m!981729 () Bool)

(assert (=> b!1063508 m!981729))

(assert (=> b!1063504 m!981635))

(assert (=> b!1063504 m!981635))

(assert (=> b!1063504 m!981647))

(assert (=> b!1063336 d!128757))

(declare-fun b!1063524 () Bool)

(declare-fun e!606015 () Bool)

(declare-fun call!44945 () Bool)

(assert (=> b!1063524 (= e!606015 call!44945)))

(declare-fun b!1063525 () Bool)

(declare-fun e!606013 () Bool)

(assert (=> b!1063525 (= e!606015 e!606013)))

(declare-fun lt!468668 () (_ BitVec 64))

(assert (=> b!1063525 (= lt!468668 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468667 () Unit!34713)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67484 (_ BitVec 64) (_ BitVec 32)) Unit!34713)

(assert (=> b!1063525 (= lt!468667 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!468668 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1063525 (arrayContainsKey!0 _keys!1163 lt!468668 #b00000000000000000000000000000000)))

(declare-fun lt!468666 () Unit!34713)

(assert (=> b!1063525 (= lt!468666 lt!468667)))

(declare-fun res!710103 () Bool)

(declare-datatypes ((SeekEntryResult!9872 0))(
  ( (MissingZero!9872 (index!41859 (_ BitVec 32))) (Found!9872 (index!41860 (_ BitVec 32))) (Intermediate!9872 (undefined!10684 Bool) (index!41861 (_ BitVec 32)) (x!95158 (_ BitVec 32))) (Undefined!9872) (MissingVacant!9872 (index!41862 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67484 (_ BitVec 32)) SeekEntryResult!9872)

(assert (=> b!1063525 (= res!710103 (= (seekEntryOrOpen!0 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9872 #b00000000000000000000000000000000)))))

(assert (=> b!1063525 (=> (not res!710103) (not e!606013))))

(declare-fun b!1063526 () Bool)

(assert (=> b!1063526 (= e!606013 call!44945)))

(declare-fun bm!44942 () Bool)

(assert (=> bm!44942 (= call!44945 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun d!128759 () Bool)

(declare-fun res!710104 () Bool)

(declare-fun e!606014 () Bool)

(assert (=> d!128759 (=> res!710104 e!606014)))

(assert (=> d!128759 (= res!710104 (bvsge #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(assert (=> d!128759 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!606014)))

(declare-fun b!1063527 () Bool)

(assert (=> b!1063527 (= e!606014 e!606015)))

(declare-fun c!107283 () Bool)

(assert (=> b!1063527 (= c!107283 (validKeyInArray!0 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!128759 (not res!710104)) b!1063527))

(assert (= (and b!1063527 c!107283) b!1063525))

(assert (= (and b!1063527 (not c!107283)) b!1063524))

(assert (= (and b!1063525 res!710103) b!1063526))

(assert (= (or b!1063526 b!1063524) bm!44942))

(assert (=> b!1063525 m!981635))

(declare-fun m!981731 () Bool)

(assert (=> b!1063525 m!981731))

(declare-fun m!981733 () Bool)

(assert (=> b!1063525 m!981733))

(assert (=> b!1063525 m!981635))

(declare-fun m!981735 () Bool)

(assert (=> b!1063525 m!981735))

(declare-fun m!981737 () Bool)

(assert (=> bm!44942 m!981737))

(assert (=> b!1063527 m!981635))

(assert (=> b!1063527 m!981635))

(assert (=> b!1063527 m!981647))

(assert (=> b!1063337 d!128759))

(declare-fun d!128761 () Bool)

(assert (=> d!128761 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94020 d!128761))

(declare-fun d!128763 () Bool)

(assert (=> d!128763 (= (array_inv!25140 _values!955) (bvsge (size!32987 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94020 d!128763))

(declare-fun d!128765 () Bool)

(assert (=> d!128765 (= (array_inv!25141 _keys!1163) (bvsge (size!32986 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94020 d!128765))

(declare-fun bm!44945 () Bool)

(declare-fun call!44948 () Bool)

(declare-fun c!107286 () Bool)

(assert (=> bm!44945 (= call!44948 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107286 (Cons!22670 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000) Nil!22671) Nil!22671)))))

(declare-fun b!1063539 () Bool)

(declare-fun e!606024 () Bool)

(assert (=> b!1063539 (= e!606024 call!44948)))

(declare-fun b!1063540 () Bool)

(declare-fun e!606025 () Bool)

(assert (=> b!1063540 (= e!606025 e!606024)))

(assert (=> b!1063540 (= c!107286 (validKeyInArray!0 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063541 () Bool)

(assert (=> b!1063541 (= e!606024 call!44948)))

(declare-fun b!1063542 () Bool)

(declare-fun e!606026 () Bool)

(declare-fun contains!6232 (List!22674 (_ BitVec 64)) Bool)

(assert (=> b!1063542 (= e!606026 (contains!6232 Nil!22671 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128767 () Bool)

(declare-fun res!710113 () Bool)

(declare-fun e!606027 () Bool)

(assert (=> d!128767 (=> res!710113 e!606027)))

(assert (=> d!128767 (= res!710113 (bvsge #b00000000000000000000000000000000 (size!32986 _keys!1163)))))

(assert (=> d!128767 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22671) e!606027)))

(declare-fun b!1063538 () Bool)

(assert (=> b!1063538 (= e!606027 e!606025)))

(declare-fun res!710111 () Bool)

(assert (=> b!1063538 (=> (not res!710111) (not e!606025))))

(assert (=> b!1063538 (= res!710111 (not e!606026))))

(declare-fun res!710112 () Bool)

(assert (=> b!1063538 (=> (not res!710112) (not e!606026))))

(assert (=> b!1063538 (= res!710112 (validKeyInArray!0 (select (arr!32448 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!128767 (not res!710113)) b!1063538))

(assert (= (and b!1063538 res!710112) b!1063542))

(assert (= (and b!1063538 res!710111) b!1063540))

(assert (= (and b!1063540 c!107286) b!1063541))

(assert (= (and b!1063540 (not c!107286)) b!1063539))

(assert (= (or b!1063541 b!1063539) bm!44945))

(assert (=> bm!44945 m!981635))

(declare-fun m!981739 () Bool)

(assert (=> bm!44945 m!981739))

(assert (=> b!1063540 m!981635))

(assert (=> b!1063540 m!981635))

(assert (=> b!1063540 m!981647))

(assert (=> b!1063542 m!981635))

(assert (=> b!1063542 m!981635))

(declare-fun m!981741 () Bool)

(assert (=> b!1063542 m!981741))

(assert (=> b!1063538 m!981635))

(assert (=> b!1063538 m!981635))

(assert (=> b!1063538 m!981647))

(assert (=> b!1063339 d!128767))

(declare-fun d!128769 () Bool)

(declare-fun lt!468671 () ListLongMap!14093)

(assert (=> d!128769 (not (contains!6230 lt!468671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!68 (List!22673 (_ BitVec 64)) List!22673)

(assert (=> d!128769 (= lt!468671 (ListLongMap!14094 (removeStrictlySorted!68 (toList!7062 lt!468518) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128769 (= (-!580 lt!468518 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468671)))

(declare-fun bs!31243 () Bool)

(assert (= bs!31243 d!128769))

(declare-fun m!981743 () Bool)

(assert (=> bs!31243 m!981743))

(declare-fun m!981745 () Bool)

(assert (=> bs!31243 m!981745))

(assert (=> b!1063331 d!128769))

(declare-fun d!128771 () Bool)

(assert (=> d!128771 (= (-!580 lt!468518 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468518)))

(declare-fun lt!468674 () Unit!34713)

(declare-fun choose!1734 (ListLongMap!14093 (_ BitVec 64)) Unit!34713)

(assert (=> d!128771 (= lt!468674 (choose!1734 lt!468518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128771 (not (contains!6230 lt!468518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128771 (= (removeNotPresentStillSame!32 lt!468518 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468674)))

(declare-fun bs!31244 () Bool)

(assert (= bs!31244 d!128771))

(assert (=> bs!31244 m!981551))

(declare-fun m!981747 () Bool)

(assert (=> bs!31244 m!981747))

(assert (=> bs!31244 m!981569))

(assert (=> b!1063331 d!128771))

(declare-fun mapIsEmpty!39595 () Bool)

(declare-fun mapRes!39595 () Bool)

(assert (=> mapIsEmpty!39595 mapRes!39595))

(declare-fun condMapEmpty!39595 () Bool)

(declare-fun mapDefault!39595 () ValueCell!11933)

(assert (=> mapNonEmpty!39586 (= condMapEmpty!39595 (= mapRest!39586 ((as const (Array (_ BitVec 32) ValueCell!11933)) mapDefault!39595)))))

(declare-fun e!606033 () Bool)

(assert (=> mapNonEmpty!39586 (= tp!75817 (and e!606033 mapRes!39595))))

(declare-fun b!1063549 () Bool)

(declare-fun e!606032 () Bool)

(assert (=> b!1063549 (= e!606032 tp_is_empty!25273)))

(declare-fun b!1063550 () Bool)

(assert (=> b!1063550 (= e!606033 tp_is_empty!25273)))

(declare-fun mapNonEmpty!39595 () Bool)

(declare-fun tp!75833 () Bool)

(assert (=> mapNonEmpty!39595 (= mapRes!39595 (and tp!75833 e!606032))))

(declare-fun mapRest!39595 () (Array (_ BitVec 32) ValueCell!11933))

(declare-fun mapKey!39595 () (_ BitVec 32))

(declare-fun mapValue!39595 () ValueCell!11933)

(assert (=> mapNonEmpty!39595 (= mapRest!39586 (store mapRest!39595 mapKey!39595 mapValue!39595))))

(assert (= (and mapNonEmpty!39586 condMapEmpty!39595) mapIsEmpty!39595))

(assert (= (and mapNonEmpty!39586 (not condMapEmpty!39595)) mapNonEmpty!39595))

(assert (= (and mapNonEmpty!39595 ((_ is ValueCellFull!11933) mapValue!39595)) b!1063549))

(assert (= (and mapNonEmpty!39586 ((_ is ValueCellFull!11933) mapDefault!39595)) b!1063550))

(declare-fun m!981749 () Bool)

(assert (=> mapNonEmpty!39595 m!981749))

(declare-fun b_lambda!16469 () Bool)

(assert (= b_lambda!16467 (or (and start!94020 b_free!21463) b_lambda!16469)))

(declare-fun b_lambda!16471 () Bool)

(assert (= b_lambda!16459 (or (and start!94020 b_free!21463) b_lambda!16471)))

(declare-fun b_lambda!16473 () Bool)

(assert (= b_lambda!16461 (or (and start!94020 b_free!21463) b_lambda!16473)))

(declare-fun b_lambda!16475 () Bool)

(assert (= b_lambda!16463 (or (and start!94020 b_free!21463) b_lambda!16475)))

(declare-fun b_lambda!16477 () Bool)

(assert (= b_lambda!16465 (or (and start!94020 b_free!21463) b_lambda!16477)))

(check-sat (not b!1063508) (not b!1063436) (not b!1063505) (not d!128751) (not d!128753) (not d!128755) (not d!128771) (not b!1063422) (not b!1063452) (not b!1063513) (not b_lambda!16471) (not bm!44942) (not d!128749) (not b!1063504) (not b!1063542) (not mapNonEmpty!39595) (not b_lambda!16477) (not bm!44945) (not b!1063506) (not b!1063440) (not b!1063441) b_and!34183 (not bm!44917) (not b!1063426) (not b!1063439) (not b_lambda!16469) (not b!1063515) (not b!1063421) (not b_next!21463) (not b!1063499) (not b!1063429) (not b_lambda!16473) (not b!1063418) (not b!1063450) (not b!1063510) (not b!1063525) (not b!1063433) (not bm!44934) (not b!1063443) (not b!1063419) (not b!1063435) (not b!1063527) (not b!1063432) (not bm!44935) tp_is_empty!25273 (not bm!44936) (not d!128757) (not b!1063427) (not b!1063540) (not b!1063425) (not d!128769) (not bm!44939) (not b_lambda!16475) (not b!1063538) (not bm!44918))
(check-sat b_and!34183 (not b_next!21463))
