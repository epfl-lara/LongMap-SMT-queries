; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94096 () Bool)

(assert start!94096)

(declare-fun b_free!21517 () Bool)

(declare-fun b_next!21517 () Bool)

(assert (=> start!94096 (= b_free!21517 (not b_next!21517))))

(declare-fun tp!75983 () Bool)

(declare-fun b_and!34233 () Bool)

(assert (=> start!94096 (= tp!75983 b_and!34233)))

(declare-fun mapIsEmpty!39670 () Bool)

(declare-fun mapRes!39670 () Bool)

(assert (=> mapIsEmpty!39670 mapRes!39670))

(declare-fun b!1064069 () Bool)

(declare-fun res!710411 () Bool)

(declare-fun e!606404 () Bool)

(assert (=> b!1064069 (=> (not res!710411) (not e!606404))))

(declare-datatypes ((array!67588 0))(
  ( (array!67589 (arr!32499 (Array (_ BitVec 32) (_ BitVec 64))) (size!33037 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67588)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67588 (_ BitVec 32)) Bool)

(assert (=> b!1064069 (= res!710411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064070 () Bool)

(declare-fun e!606406 () Bool)

(declare-fun e!606405 () Bool)

(assert (=> b!1064070 (= e!606406 (and e!606405 mapRes!39670))))

(declare-fun condMapEmpty!39670 () Bool)

(declare-datatypes ((V!38905 0))(
  ( (V!38906 (val!12714 Int)) )
))
(declare-datatypes ((ValueCell!11960 0))(
  ( (ValueCellFull!11960 (v!15325 V!38905)) (EmptyCell!11960) )
))
(declare-datatypes ((array!67590 0))(
  ( (array!67591 (arr!32500 (Array (_ BitVec 32) ValueCell!11960)) (size!33038 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67590)

(declare-fun mapDefault!39670 () ValueCell!11960)

(assert (=> b!1064070 (= condMapEmpty!39670 (= (arr!32500 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11960)) mapDefault!39670)))))

(declare-fun b!1064071 () Bool)

(declare-fun e!606408 () Bool)

(declare-fun tp_is_empty!25327 () Bool)

(assert (=> b!1064071 (= e!606408 tp_is_empty!25327)))

(declare-fun b!1064072 () Bool)

(declare-fun res!710413 () Bool)

(assert (=> b!1064072 (=> (not res!710413) (not e!606404))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064072 (= res!710413 (and (= (size!33038 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33037 _keys!1163) (size!33038 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064074 () Bool)

(assert (=> b!1064074 (= e!606405 tp_is_empty!25327)))

(declare-fun mapNonEmpty!39670 () Bool)

(declare-fun tp!75982 () Bool)

(assert (=> mapNonEmpty!39670 (= mapRes!39670 (and tp!75982 e!606408))))

(declare-fun mapValue!39670 () ValueCell!11960)

(declare-fun mapRest!39670 () (Array (_ BitVec 32) ValueCell!11960))

(declare-fun mapKey!39670 () (_ BitVec 32))

(assert (=> mapNonEmpty!39670 (= (arr!32500 _values!955) (store mapRest!39670 mapKey!39670 mapValue!39670))))

(declare-fun b!1064075 () Bool)

(declare-fun res!710412 () Bool)

(assert (=> b!1064075 (=> (not res!710412) (not e!606404))))

(declare-datatypes ((List!22709 0))(
  ( (Nil!22706) (Cons!22705 (h!23914 (_ BitVec 64)) (t!32015 List!22709)) )
))
(declare-fun arrayNoDuplicates!0 (array!67588 (_ BitVec 32) List!22709) Bool)

(assert (=> b!1064075 (= res!710412 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22706))))

(declare-fun res!710410 () Bool)

(assert (=> start!94096 (=> (not res!710410) (not e!606404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94096 (= res!710410 (validMask!0 mask!1515))))

(assert (=> start!94096 e!606404))

(assert (=> start!94096 true))

(assert (=> start!94096 tp_is_empty!25327))

(declare-fun array_inv!25172 (array!67590) Bool)

(assert (=> start!94096 (and (array_inv!25172 _values!955) e!606406)))

(assert (=> start!94096 tp!75983))

(declare-fun array_inv!25173 (array!67588) Bool)

(assert (=> start!94096 (array_inv!25173 _keys!1163)))

(declare-fun b!1064073 () Bool)

(assert (=> b!1064073 (= e!606404 (not (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!33037 _keys!1163)))))))

(declare-datatypes ((tuple2!16160 0))(
  ( (tuple2!16161 (_1!8091 (_ BitVec 64)) (_2!8091 V!38905)) )
))
(declare-datatypes ((List!22710 0))(
  ( (Nil!22707) (Cons!22706 (h!23915 tuple2!16160) (t!32016 List!22710)) )
))
(declare-datatypes ((ListLongMap!14129 0))(
  ( (ListLongMap!14130 (toList!7080 List!22710)) )
))
(declare-fun lt!468897 () ListLongMap!14129)

(declare-fun lt!468899 () ListLongMap!14129)

(assert (=> b!1064073 (= lt!468897 lt!468899)))

(declare-fun zeroValueBefore!47 () V!38905)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38905)

(declare-fun minValue!907 () V!38905)

(declare-datatypes ((Unit!34751 0))(
  ( (Unit!34752) )
))
(declare-fun lt!468898 () Unit!34751)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!680 (array!67588 array!67590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38905 V!38905 V!38905 V!38905 (_ BitVec 32) Int) Unit!34751)

(assert (=> b!1064073 (= lt!468898 (lemmaNoChangeToArrayThenSameMapNoExtras!680 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3686 (array!67588 array!67590 (_ BitVec 32) (_ BitVec 32) V!38905 V!38905 (_ BitVec 32) Int) ListLongMap!14129)

(assert (=> b!1064073 (= lt!468899 (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064073 (= lt!468897 (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94096 res!710410) b!1064072))

(assert (= (and b!1064072 res!710413) b!1064069))

(assert (= (and b!1064069 res!710411) b!1064075))

(assert (= (and b!1064075 res!710412) b!1064073))

(assert (= (and b!1064070 condMapEmpty!39670) mapIsEmpty!39670))

(assert (= (and b!1064070 (not condMapEmpty!39670)) mapNonEmpty!39670))

(get-info :version)

(assert (= (and mapNonEmpty!39670 ((_ is ValueCellFull!11960) mapValue!39670)) b!1064071))

(assert (= (and b!1064070 ((_ is ValueCellFull!11960) mapDefault!39670)) b!1064074))

(assert (= start!94096 b!1064070))

(declare-fun m!982183 () Bool)

(assert (=> mapNonEmpty!39670 m!982183))

(declare-fun m!982185 () Bool)

(assert (=> start!94096 m!982185))

(declare-fun m!982187 () Bool)

(assert (=> start!94096 m!982187))

(declare-fun m!982189 () Bool)

(assert (=> start!94096 m!982189))

(declare-fun m!982191 () Bool)

(assert (=> b!1064069 m!982191))

(declare-fun m!982193 () Bool)

(assert (=> b!1064073 m!982193))

(declare-fun m!982195 () Bool)

(assert (=> b!1064073 m!982195))

(declare-fun m!982197 () Bool)

(assert (=> b!1064073 m!982197))

(declare-fun m!982199 () Bool)

(assert (=> b!1064075 m!982199))

(check-sat tp_is_empty!25327 (not b_next!21517) (not b!1064075) (not b!1064069) (not start!94096) (not b!1064073) b_and!34233 (not mapNonEmpty!39670))
(check-sat b_and!34233 (not b_next!21517))
(get-model)

(declare-fun d!128791 () Bool)

(assert (=> d!128791 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94096 d!128791))

(declare-fun d!128793 () Bool)

(assert (=> d!128793 (= (array_inv!25172 _values!955) (bvsge (size!33038 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94096 d!128793))

(declare-fun d!128795 () Bool)

(assert (=> d!128795 (= (array_inv!25173 _keys!1163) (bvsge (size!33037 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94096 d!128795))

(declare-fun d!128797 () Bool)

(assert (=> d!128797 (= (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468920 () Unit!34751)

(declare-fun choose!1735 (array!67588 array!67590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38905 V!38905 V!38905 V!38905 (_ BitVec 32) Int) Unit!34751)

(assert (=> d!128797 (= lt!468920 (choose!1735 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128797 (validMask!0 mask!1515)))

(assert (=> d!128797 (= (lemmaNoChangeToArrayThenSameMapNoExtras!680 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468920)))

(declare-fun bs!31272 () Bool)

(assert (= bs!31272 d!128797))

(assert (=> bs!31272 m!982197))

(assert (=> bs!31272 m!982195))

(declare-fun m!982237 () Bool)

(assert (=> bs!31272 m!982237))

(assert (=> bs!31272 m!982185))

(assert (=> b!1064073 d!128797))

(declare-fun b!1064142 () Bool)

(declare-fun e!606456 () Bool)

(declare-fun e!606455 () Bool)

(assert (=> b!1064142 (= e!606456 e!606455)))

(assert (=> b!1064142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(declare-fun res!710449 () Bool)

(declare-fun lt!468937 () ListLongMap!14129)

(declare-fun contains!6233 (ListLongMap!14129 (_ BitVec 64)) Bool)

(assert (=> b!1064142 (= res!710449 (contains!6233 lt!468937 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064142 (=> (not res!710449) (not e!606455))))

(declare-fun b!1064143 () Bool)

(declare-fun e!606457 () Bool)

(assert (=> b!1064143 (= e!606457 e!606456)))

(declare-fun c!107295 () Bool)

(declare-fun e!606458 () Bool)

(assert (=> b!1064143 (= c!107295 e!606458)))

(declare-fun res!710447 () Bool)

(assert (=> b!1064143 (=> (not res!710447) (not e!606458))))

(assert (=> b!1064143 (= res!710447 (bvslt #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(declare-fun b!1064144 () Bool)

(declare-fun e!606454 () Bool)

(assert (=> b!1064144 (= e!606456 e!606454)))

(declare-fun c!107296 () Bool)

(assert (=> b!1064144 (= c!107296 (bvslt #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(declare-fun b!1064145 () Bool)

(declare-fun lt!468936 () Unit!34751)

(declare-fun lt!468941 () Unit!34751)

(assert (=> b!1064145 (= lt!468936 lt!468941)))

(declare-fun lt!468940 () ListLongMap!14129)

(declare-fun lt!468939 () (_ BitVec 64))

(declare-fun lt!468935 () V!38905)

(declare-fun lt!468938 () (_ BitVec 64))

(declare-fun +!3145 (ListLongMap!14129 tuple2!16160) ListLongMap!14129)

(assert (=> b!1064145 (not (contains!6233 (+!3145 lt!468940 (tuple2!16161 lt!468938 lt!468935)) lt!468939))))

(declare-fun addStillNotContains!250 (ListLongMap!14129 (_ BitVec 64) V!38905 (_ BitVec 64)) Unit!34751)

(assert (=> b!1064145 (= lt!468941 (addStillNotContains!250 lt!468940 lt!468938 lt!468935 lt!468939))))

(assert (=> b!1064145 (= lt!468939 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!16984 (ValueCell!11960 V!38905) V!38905)

(declare-fun dynLambda!2013 (Int (_ BitVec 64)) V!38905)

(assert (=> b!1064145 (= lt!468935 (get!16984 (select (arr!32500 _values!955) #b00000000000000000000000000000000) (dynLambda!2013 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1064145 (= lt!468938 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44951 () ListLongMap!14129)

(assert (=> b!1064145 (= lt!468940 call!44951)))

(declare-fun e!606459 () ListLongMap!14129)

(assert (=> b!1064145 (= e!606459 (+!3145 call!44951 (tuple2!16161 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000) (get!16984 (select (arr!32500 _values!955) #b00000000000000000000000000000000) (dynLambda!2013 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!128799 () Bool)

(assert (=> d!128799 e!606457))

(declare-fun res!710448 () Bool)

(assert (=> d!128799 (=> (not res!710448) (not e!606457))))

(assert (=> d!128799 (= res!710448 (not (contains!6233 lt!468937 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!606453 () ListLongMap!14129)

(assert (=> d!128799 (= lt!468937 e!606453)))

(declare-fun c!107297 () Bool)

(assert (=> d!128799 (= c!107297 (bvsge #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(assert (=> d!128799 (validMask!0 mask!1515)))

(assert (=> d!128799 (= (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468937)))

(declare-fun b!1064146 () Bool)

(assert (=> b!1064146 (= e!606454 (= lt!468937 (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!44948 () Bool)

(assert (=> bm!44948 (= call!44951 (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1064147 () Bool)

(assert (=> b!1064147 (= e!606459 call!44951)))

(declare-fun b!1064148 () Bool)

(declare-fun res!710446 () Bool)

(assert (=> b!1064148 (=> (not res!710446) (not e!606457))))

(assert (=> b!1064148 (= res!710446 (not (contains!6233 lt!468937 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1064149 () Bool)

(declare-fun isEmpty!944 (ListLongMap!14129) Bool)

(assert (=> b!1064149 (= e!606454 (isEmpty!944 lt!468937))))

(declare-fun b!1064150 () Bool)

(assert (=> b!1064150 (= e!606453 (ListLongMap!14130 Nil!22707))))

(declare-fun b!1064151 () Bool)

(assert (=> b!1064151 (= e!606453 e!606459)))

(declare-fun c!107298 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1064151 (= c!107298 (validKeyInArray!0 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064152 () Bool)

(assert (=> b!1064152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(assert (=> b!1064152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33038 _values!955)))))

(declare-fun apply!914 (ListLongMap!14129 (_ BitVec 64)) V!38905)

(assert (=> b!1064152 (= e!606455 (= (apply!914 lt!468937 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)) (get!16984 (select (arr!32500 _values!955) #b00000000000000000000000000000000) (dynLambda!2013 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1064153 () Bool)

(assert (=> b!1064153 (= e!606458 (validKeyInArray!0 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064153 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!128799 c!107297) b!1064150))

(assert (= (and d!128799 (not c!107297)) b!1064151))

(assert (= (and b!1064151 c!107298) b!1064145))

(assert (= (and b!1064151 (not c!107298)) b!1064147))

(assert (= (or b!1064145 b!1064147) bm!44948))

(assert (= (and d!128799 res!710448) b!1064148))

(assert (= (and b!1064148 res!710446) b!1064143))

(assert (= (and b!1064143 res!710447) b!1064153))

(assert (= (and b!1064143 c!107295) b!1064142))

(assert (= (and b!1064143 (not c!107295)) b!1064144))

(assert (= (and b!1064142 res!710449) b!1064152))

(assert (= (and b!1064144 c!107296) b!1064146))

(assert (= (and b!1064144 (not c!107296)) b!1064149))

(declare-fun b_lambda!16479 () Bool)

(assert (=> (not b_lambda!16479) (not b!1064145)))

(declare-fun t!32022 () Bool)

(declare-fun tb!7129 () Bool)

(assert (=> (and start!94096 (= defaultEntry!963 defaultEntry!963) t!32022) tb!7129))

(declare-fun result!14711 () Bool)

(assert (=> tb!7129 (= result!14711 tp_is_empty!25327)))

(assert (=> b!1064145 t!32022))

(declare-fun b_and!34239 () Bool)

(assert (= b_and!34233 (and (=> t!32022 result!14711) b_and!34239)))

(declare-fun b_lambda!16481 () Bool)

(assert (=> (not b_lambda!16481) (not b!1064152)))

(assert (=> b!1064152 t!32022))

(declare-fun b_and!34241 () Bool)

(assert (= b_and!34239 (and (=> t!32022 result!14711) b_and!34241)))

(declare-fun m!982239 () Bool)

(assert (=> b!1064149 m!982239))

(declare-fun m!982241 () Bool)

(assert (=> b!1064152 m!982241))

(declare-fun m!982243 () Bool)

(assert (=> b!1064152 m!982243))

(declare-fun m!982245 () Bool)

(assert (=> b!1064152 m!982245))

(declare-fun m!982247 () Bool)

(assert (=> b!1064152 m!982247))

(declare-fun m!982249 () Bool)

(assert (=> b!1064152 m!982249))

(assert (=> b!1064152 m!982247))

(assert (=> b!1064152 m!982241))

(assert (=> b!1064152 m!982243))

(assert (=> b!1064153 m!982247))

(assert (=> b!1064153 m!982247))

(declare-fun m!982251 () Bool)

(assert (=> b!1064153 m!982251))

(declare-fun m!982253 () Bool)

(assert (=> b!1064146 m!982253))

(assert (=> b!1064142 m!982247))

(assert (=> b!1064142 m!982247))

(declare-fun m!982255 () Bool)

(assert (=> b!1064142 m!982255))

(declare-fun m!982257 () Bool)

(assert (=> b!1064148 m!982257))

(declare-fun m!982259 () Bool)

(assert (=> b!1064145 m!982259))

(assert (=> b!1064145 m!982241))

(assert (=> b!1064145 m!982243))

(assert (=> b!1064145 m!982245))

(declare-fun m!982261 () Bool)

(assert (=> b!1064145 m!982261))

(declare-fun m!982263 () Bool)

(assert (=> b!1064145 m!982263))

(assert (=> b!1064145 m!982259))

(declare-fun m!982265 () Bool)

(assert (=> b!1064145 m!982265))

(assert (=> b!1064145 m!982247))

(assert (=> b!1064145 m!982241))

(assert (=> b!1064145 m!982243))

(assert (=> bm!44948 m!982253))

(assert (=> b!1064151 m!982247))

(assert (=> b!1064151 m!982247))

(assert (=> b!1064151 m!982251))

(declare-fun m!982267 () Bool)

(assert (=> d!128799 m!982267))

(assert (=> d!128799 m!982185))

(assert (=> b!1064073 d!128799))

(declare-fun b!1064156 () Bool)

(declare-fun e!606463 () Bool)

(declare-fun e!606462 () Bool)

(assert (=> b!1064156 (= e!606463 e!606462)))

(assert (=> b!1064156 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(declare-fun res!710453 () Bool)

(declare-fun lt!468944 () ListLongMap!14129)

(assert (=> b!1064156 (= res!710453 (contains!6233 lt!468944 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064156 (=> (not res!710453) (not e!606462))))

(declare-fun b!1064157 () Bool)

(declare-fun e!606464 () Bool)

(assert (=> b!1064157 (= e!606464 e!606463)))

(declare-fun c!107299 () Bool)

(declare-fun e!606465 () Bool)

(assert (=> b!1064157 (= c!107299 e!606465)))

(declare-fun res!710451 () Bool)

(assert (=> b!1064157 (=> (not res!710451) (not e!606465))))

(assert (=> b!1064157 (= res!710451 (bvslt #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(declare-fun b!1064158 () Bool)

(declare-fun e!606461 () Bool)

(assert (=> b!1064158 (= e!606463 e!606461)))

(declare-fun c!107300 () Bool)

(assert (=> b!1064158 (= c!107300 (bvslt #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(declare-fun b!1064159 () Bool)

(declare-fun lt!468943 () Unit!34751)

(declare-fun lt!468948 () Unit!34751)

(assert (=> b!1064159 (= lt!468943 lt!468948)))

(declare-fun lt!468946 () (_ BitVec 64))

(declare-fun lt!468945 () (_ BitVec 64))

(declare-fun lt!468942 () V!38905)

(declare-fun lt!468947 () ListLongMap!14129)

(assert (=> b!1064159 (not (contains!6233 (+!3145 lt!468947 (tuple2!16161 lt!468945 lt!468942)) lt!468946))))

(assert (=> b!1064159 (= lt!468948 (addStillNotContains!250 lt!468947 lt!468945 lt!468942 lt!468946))))

(assert (=> b!1064159 (= lt!468946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1064159 (= lt!468942 (get!16984 (select (arr!32500 _values!955) #b00000000000000000000000000000000) (dynLambda!2013 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1064159 (= lt!468945 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44952 () ListLongMap!14129)

(assert (=> b!1064159 (= lt!468947 call!44952)))

(declare-fun e!606466 () ListLongMap!14129)

(assert (=> b!1064159 (= e!606466 (+!3145 call!44952 (tuple2!16161 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000) (get!16984 (select (arr!32500 _values!955) #b00000000000000000000000000000000) (dynLambda!2013 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!128801 () Bool)

(assert (=> d!128801 e!606464))

(declare-fun res!710452 () Bool)

(assert (=> d!128801 (=> (not res!710452) (not e!606464))))

(assert (=> d!128801 (= res!710452 (not (contains!6233 lt!468944 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!606460 () ListLongMap!14129)

(assert (=> d!128801 (= lt!468944 e!606460)))

(declare-fun c!107301 () Bool)

(assert (=> d!128801 (= c!107301 (bvsge #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(assert (=> d!128801 (validMask!0 mask!1515)))

(assert (=> d!128801 (= (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468944)))

(declare-fun b!1064160 () Bool)

(assert (=> b!1064160 (= e!606461 (= lt!468944 (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!44949 () Bool)

(assert (=> bm!44949 (= call!44952 (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1064161 () Bool)

(assert (=> b!1064161 (= e!606466 call!44952)))

(declare-fun b!1064162 () Bool)

(declare-fun res!710450 () Bool)

(assert (=> b!1064162 (=> (not res!710450) (not e!606464))))

(assert (=> b!1064162 (= res!710450 (not (contains!6233 lt!468944 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1064163 () Bool)

(assert (=> b!1064163 (= e!606461 (isEmpty!944 lt!468944))))

(declare-fun b!1064164 () Bool)

(assert (=> b!1064164 (= e!606460 (ListLongMap!14130 Nil!22707))))

(declare-fun b!1064165 () Bool)

(assert (=> b!1064165 (= e!606460 e!606466)))

(declare-fun c!107302 () Bool)

(assert (=> b!1064165 (= c!107302 (validKeyInArray!0 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064166 () Bool)

(assert (=> b!1064166 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(assert (=> b!1064166 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33038 _values!955)))))

(assert (=> b!1064166 (= e!606462 (= (apply!914 lt!468944 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)) (get!16984 (select (arr!32500 _values!955) #b00000000000000000000000000000000) (dynLambda!2013 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1064167 () Bool)

(assert (=> b!1064167 (= e!606465 (validKeyInArray!0 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064167 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!128801 c!107301) b!1064164))

(assert (= (and d!128801 (not c!107301)) b!1064165))

(assert (= (and b!1064165 c!107302) b!1064159))

(assert (= (and b!1064165 (not c!107302)) b!1064161))

(assert (= (or b!1064159 b!1064161) bm!44949))

(assert (= (and d!128801 res!710452) b!1064162))

(assert (= (and b!1064162 res!710450) b!1064157))

(assert (= (and b!1064157 res!710451) b!1064167))

(assert (= (and b!1064157 c!107299) b!1064156))

(assert (= (and b!1064157 (not c!107299)) b!1064158))

(assert (= (and b!1064156 res!710453) b!1064166))

(assert (= (and b!1064158 c!107300) b!1064160))

(assert (= (and b!1064158 (not c!107300)) b!1064163))

(declare-fun b_lambda!16483 () Bool)

(assert (=> (not b_lambda!16483) (not b!1064159)))

(assert (=> b!1064159 t!32022))

(declare-fun b_and!34243 () Bool)

(assert (= b_and!34241 (and (=> t!32022 result!14711) b_and!34243)))

(declare-fun b_lambda!16485 () Bool)

(assert (=> (not b_lambda!16485) (not b!1064166)))

(assert (=> b!1064166 t!32022))

(declare-fun b_and!34245 () Bool)

(assert (= b_and!34243 (and (=> t!32022 result!14711) b_and!34245)))

(declare-fun m!982269 () Bool)

(assert (=> b!1064163 m!982269))

(assert (=> b!1064166 m!982241))

(assert (=> b!1064166 m!982243))

(assert (=> b!1064166 m!982245))

(assert (=> b!1064166 m!982247))

(declare-fun m!982271 () Bool)

(assert (=> b!1064166 m!982271))

(assert (=> b!1064166 m!982247))

(assert (=> b!1064166 m!982241))

(assert (=> b!1064166 m!982243))

(assert (=> b!1064167 m!982247))

(assert (=> b!1064167 m!982247))

(assert (=> b!1064167 m!982251))

(declare-fun m!982273 () Bool)

(assert (=> b!1064160 m!982273))

(assert (=> b!1064156 m!982247))

(assert (=> b!1064156 m!982247))

(declare-fun m!982275 () Bool)

(assert (=> b!1064156 m!982275))

(declare-fun m!982277 () Bool)

(assert (=> b!1064162 m!982277))

(declare-fun m!982279 () Bool)

(assert (=> b!1064159 m!982279))

(assert (=> b!1064159 m!982241))

(assert (=> b!1064159 m!982243))

(assert (=> b!1064159 m!982245))

(declare-fun m!982281 () Bool)

(assert (=> b!1064159 m!982281))

(declare-fun m!982283 () Bool)

(assert (=> b!1064159 m!982283))

(assert (=> b!1064159 m!982279))

(declare-fun m!982285 () Bool)

(assert (=> b!1064159 m!982285))

(assert (=> b!1064159 m!982247))

(assert (=> b!1064159 m!982241))

(assert (=> b!1064159 m!982243))

(assert (=> bm!44949 m!982273))

(assert (=> b!1064165 m!982247))

(assert (=> b!1064165 m!982247))

(assert (=> b!1064165 m!982251))

(declare-fun m!982287 () Bool)

(assert (=> d!128801 m!982287))

(assert (=> d!128801 m!982185))

(assert (=> b!1064073 d!128801))

(declare-fun b!1064178 () Bool)

(declare-fun e!606475 () Bool)

(declare-fun call!44955 () Bool)

(assert (=> b!1064178 (= e!606475 call!44955)))

(declare-fun b!1064179 () Bool)

(declare-fun e!606476 () Bool)

(declare-fun contains!6234 (List!22709 (_ BitVec 64)) Bool)

(assert (=> b!1064179 (= e!606476 (contains!6234 Nil!22706 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128803 () Bool)

(declare-fun res!710461 () Bool)

(declare-fun e!606478 () Bool)

(assert (=> d!128803 (=> res!710461 e!606478)))

(assert (=> d!128803 (= res!710461 (bvsge #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(assert (=> d!128803 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22706) e!606478)))

(declare-fun b!1064180 () Bool)

(declare-fun e!606477 () Bool)

(assert (=> b!1064180 (= e!606478 e!606477)))

(declare-fun res!710462 () Bool)

(assert (=> b!1064180 (=> (not res!710462) (not e!606477))))

(assert (=> b!1064180 (= res!710462 (not e!606476))))

(declare-fun res!710460 () Bool)

(assert (=> b!1064180 (=> (not res!710460) (not e!606476))))

(assert (=> b!1064180 (= res!710460 (validKeyInArray!0 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064181 () Bool)

(assert (=> b!1064181 (= e!606475 call!44955)))

(declare-fun bm!44952 () Bool)

(declare-fun c!107305 () Bool)

(assert (=> bm!44952 (= call!44955 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107305 (Cons!22705 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000) Nil!22706) Nil!22706)))))

(declare-fun b!1064182 () Bool)

(assert (=> b!1064182 (= e!606477 e!606475)))

(assert (=> b!1064182 (= c!107305 (validKeyInArray!0 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!128803 (not res!710461)) b!1064180))

(assert (= (and b!1064180 res!710460) b!1064179))

(assert (= (and b!1064180 res!710462) b!1064182))

(assert (= (and b!1064182 c!107305) b!1064181))

(assert (= (and b!1064182 (not c!107305)) b!1064178))

(assert (= (or b!1064181 b!1064178) bm!44952))

(assert (=> b!1064179 m!982247))

(assert (=> b!1064179 m!982247))

(declare-fun m!982289 () Bool)

(assert (=> b!1064179 m!982289))

(assert (=> b!1064180 m!982247))

(assert (=> b!1064180 m!982247))

(assert (=> b!1064180 m!982251))

(assert (=> bm!44952 m!982247))

(declare-fun m!982291 () Bool)

(assert (=> bm!44952 m!982291))

(assert (=> b!1064182 m!982247))

(assert (=> b!1064182 m!982247))

(assert (=> b!1064182 m!982251))

(assert (=> b!1064075 d!128803))

(declare-fun d!128805 () Bool)

(declare-fun res!710468 () Bool)

(declare-fun e!606486 () Bool)

(assert (=> d!128805 (=> res!710468 e!606486)))

(assert (=> d!128805 (= res!710468 (bvsge #b00000000000000000000000000000000 (size!33037 _keys!1163)))))

(assert (=> d!128805 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!606486)))

(declare-fun b!1064191 () Bool)

(declare-fun e!606485 () Bool)

(declare-fun call!44958 () Bool)

(assert (=> b!1064191 (= e!606485 call!44958)))

(declare-fun b!1064192 () Bool)

(declare-fun e!606487 () Bool)

(assert (=> b!1064192 (= e!606485 e!606487)))

(declare-fun lt!468956 () (_ BitVec 64))

(assert (=> b!1064192 (= lt!468956 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468957 () Unit!34751)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67588 (_ BitVec 64) (_ BitVec 32)) Unit!34751)

(assert (=> b!1064192 (= lt!468957 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!468956 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1064192 (arrayContainsKey!0 _keys!1163 lt!468956 #b00000000000000000000000000000000)))

(declare-fun lt!468955 () Unit!34751)

(assert (=> b!1064192 (= lt!468955 lt!468957)))

(declare-fun res!710467 () Bool)

(declare-datatypes ((SeekEntryResult!9873 0))(
  ( (MissingZero!9873 (index!41863 (_ BitVec 32))) (Found!9873 (index!41864 (_ BitVec 32))) (Intermediate!9873 (undefined!10685 Bool) (index!41865 (_ BitVec 32)) (x!95242 (_ BitVec 32))) (Undefined!9873) (MissingVacant!9873 (index!41866 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67588 (_ BitVec 32)) SeekEntryResult!9873)

(assert (=> b!1064192 (= res!710467 (= (seekEntryOrOpen!0 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9873 #b00000000000000000000000000000000)))))

(assert (=> b!1064192 (=> (not res!710467) (not e!606487))))

(declare-fun b!1064193 () Bool)

(assert (=> b!1064193 (= e!606487 call!44958)))

(declare-fun b!1064194 () Bool)

(assert (=> b!1064194 (= e!606486 e!606485)))

(declare-fun c!107308 () Bool)

(assert (=> b!1064194 (= c!107308 (validKeyInArray!0 (select (arr!32499 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44955 () Bool)

(assert (=> bm!44955 (= call!44958 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!128805 (not res!710468)) b!1064194))

(assert (= (and b!1064194 c!107308) b!1064192))

(assert (= (and b!1064194 (not c!107308)) b!1064191))

(assert (= (and b!1064192 res!710467) b!1064193))

(assert (= (or b!1064193 b!1064191) bm!44955))

(assert (=> b!1064192 m!982247))

(declare-fun m!982293 () Bool)

(assert (=> b!1064192 m!982293))

(declare-fun m!982295 () Bool)

(assert (=> b!1064192 m!982295))

(assert (=> b!1064192 m!982247))

(declare-fun m!982297 () Bool)

(assert (=> b!1064192 m!982297))

(assert (=> b!1064194 m!982247))

(assert (=> b!1064194 m!982247))

(assert (=> b!1064194 m!982251))

(declare-fun m!982299 () Bool)

(assert (=> bm!44955 m!982299))

(assert (=> b!1064069 d!128805))

(declare-fun mapNonEmpty!39679 () Bool)

(declare-fun mapRes!39679 () Bool)

(declare-fun tp!75998 () Bool)

(declare-fun e!606492 () Bool)

(assert (=> mapNonEmpty!39679 (= mapRes!39679 (and tp!75998 e!606492))))

(declare-fun mapRest!39679 () (Array (_ BitVec 32) ValueCell!11960))

(declare-fun mapValue!39679 () ValueCell!11960)

(declare-fun mapKey!39679 () (_ BitVec 32))

(assert (=> mapNonEmpty!39679 (= mapRest!39670 (store mapRest!39679 mapKey!39679 mapValue!39679))))

(declare-fun mapIsEmpty!39679 () Bool)

(assert (=> mapIsEmpty!39679 mapRes!39679))

(declare-fun condMapEmpty!39679 () Bool)

(declare-fun mapDefault!39679 () ValueCell!11960)

(assert (=> mapNonEmpty!39670 (= condMapEmpty!39679 (= mapRest!39670 ((as const (Array (_ BitVec 32) ValueCell!11960)) mapDefault!39679)))))

(declare-fun e!606493 () Bool)

(assert (=> mapNonEmpty!39670 (= tp!75982 (and e!606493 mapRes!39679))))

(declare-fun b!1064202 () Bool)

(assert (=> b!1064202 (= e!606493 tp_is_empty!25327)))

(declare-fun b!1064201 () Bool)

(assert (=> b!1064201 (= e!606492 tp_is_empty!25327)))

(assert (= (and mapNonEmpty!39670 condMapEmpty!39679) mapIsEmpty!39679))

(assert (= (and mapNonEmpty!39670 (not condMapEmpty!39679)) mapNonEmpty!39679))

(assert (= (and mapNonEmpty!39679 ((_ is ValueCellFull!11960) mapValue!39679)) b!1064201))

(assert (= (and mapNonEmpty!39670 ((_ is ValueCellFull!11960) mapDefault!39679)) b!1064202))

(declare-fun m!982301 () Bool)

(assert (=> mapNonEmpty!39679 m!982301))

(declare-fun b_lambda!16487 () Bool)

(assert (= b_lambda!16481 (or (and start!94096 b_free!21517) b_lambda!16487)))

(declare-fun b_lambda!16489 () Bool)

(assert (= b_lambda!16485 (or (and start!94096 b_free!21517) b_lambda!16489)))

(declare-fun b_lambda!16491 () Bool)

(assert (= b_lambda!16483 (or (and start!94096 b_free!21517) b_lambda!16491)))

(declare-fun b_lambda!16493 () Bool)

(assert (= b_lambda!16479 (or (and start!94096 b_free!21517) b_lambda!16493)))

(check-sat tp_is_empty!25327 (not b!1064179) (not b_next!21517) (not mapNonEmpty!39679) (not b!1064145) (not b!1064167) (not bm!44952) (not bm!44948) (not d!128801) (not b!1064148) (not b_lambda!16487) (not bm!44955) (not b_lambda!16493) (not b!1064160) (not b!1064151) (not d!128799) b_and!34245 (not b!1064156) (not d!128797) (not b!1064162) (not b!1064146) (not b!1064180) (not bm!44949) (not b!1064142) (not b_lambda!16489) (not b_lambda!16491) (not b!1064152) (not b!1064192) (not b!1064182) (not b!1064166) (not b!1064159) (not b!1064165) (not b!1064163) (not b!1064149) (not b!1064153) (not b!1064194))
(check-sat b_and!34245 (not b_next!21517))
