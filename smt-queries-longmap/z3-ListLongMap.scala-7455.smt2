; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94626 () Bool)

(assert start!94626)

(declare-fun b_free!21909 () Bool)

(declare-fun b_next!21909 () Bool)

(assert (=> start!94626 (= b_free!21909 (not b_next!21909))))

(declare-fun tp!77179 () Bool)

(declare-fun b_and!34721 () Bool)

(assert (=> start!94626 (= tp!77179 b_and!34721)))

(declare-fun b!1069932 () Bool)

(declare-fun res!713833 () Bool)

(declare-fun e!610675 () Bool)

(assert (=> b!1069932 (=> (not res!713833) (not e!610675))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39427 0))(
  ( (V!39428 (val!12910 Int)) )
))
(declare-datatypes ((ValueCell!12156 0))(
  ( (ValueCellFull!12156 (v!15526 V!39427)) (EmptyCell!12156) )
))
(declare-datatypes ((array!68415 0))(
  ( (array!68416 (arr!32905 (Array (_ BitVec 32) ValueCell!12156)) (size!33441 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68415)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68417 0))(
  ( (array!68418 (arr!32906 (Array (_ BitVec 32) (_ BitVec 64))) (size!33442 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68417)

(assert (=> b!1069932 (= res!713833 (and (= (size!33441 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33442 _keys!1163) (size!33441 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069933 () Bool)

(declare-fun e!610677 () Bool)

(declare-fun tp_is_empty!25719 () Bool)

(assert (=> b!1069933 (= e!610677 tp_is_empty!25719)))

(declare-fun res!713831 () Bool)

(assert (=> start!94626 (=> (not res!713831) (not e!610675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94626 (= res!713831 (validMask!0 mask!1515))))

(assert (=> start!94626 e!610675))

(assert (=> start!94626 true))

(assert (=> start!94626 tp_is_empty!25719))

(declare-fun e!610676 () Bool)

(declare-fun array_inv!25456 (array!68415) Bool)

(assert (=> start!94626 (and (array_inv!25456 _values!955) e!610676)))

(assert (=> start!94626 tp!77179))

(declare-fun array_inv!25457 (array!68417) Bool)

(assert (=> start!94626 (array_inv!25457 _keys!1163)))

(declare-fun mapNonEmpty!40279 () Bool)

(declare-fun mapRes!40279 () Bool)

(declare-fun tp!77180 () Bool)

(assert (=> mapNonEmpty!40279 (= mapRes!40279 (and tp!77180 e!610677))))

(declare-fun mapValue!40279 () ValueCell!12156)

(declare-fun mapKey!40279 () (_ BitVec 32))

(declare-fun mapRest!40279 () (Array (_ BitVec 32) ValueCell!12156))

(assert (=> mapNonEmpty!40279 (= (arr!32905 _values!955) (store mapRest!40279 mapKey!40279 mapValue!40279))))

(declare-fun b!1069934 () Bool)

(declare-fun e!610674 () Bool)

(assert (=> b!1069934 (= e!610676 (and e!610674 mapRes!40279))))

(declare-fun condMapEmpty!40279 () Bool)

(declare-fun mapDefault!40279 () ValueCell!12156)

(assert (=> b!1069934 (= condMapEmpty!40279 (= (arr!32905 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12156)) mapDefault!40279)))))

(declare-fun b!1069935 () Bool)

(assert (=> b!1069935 (= e!610674 tp_is_empty!25719)))

(declare-fun b!1069936 () Bool)

(declare-fun res!713834 () Bool)

(assert (=> b!1069936 (=> (not res!713834) (not e!610675))))

(declare-datatypes ((List!22955 0))(
  ( (Nil!22952) (Cons!22951 (h!24160 (_ BitVec 64)) (t!32284 List!22955)) )
))
(declare-fun arrayNoDuplicates!0 (array!68417 (_ BitVec 32) List!22955) Bool)

(assert (=> b!1069936 (= res!713834 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22952))))

(declare-fun b!1069937 () Bool)

(declare-fun res!713832 () Bool)

(assert (=> b!1069937 (=> (not res!713832) (not e!610675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68417 (_ BitVec 32)) Bool)

(assert (=> b!1069937 (= res!713832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069938 () Bool)

(assert (=> b!1069938 (= e!610675 (not (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!33442 _keys!1163)))))))

(declare-datatypes ((tuple2!16412 0))(
  ( (tuple2!16413 (_1!8217 (_ BitVec 64)) (_2!8217 V!39427)) )
))
(declare-datatypes ((List!22956 0))(
  ( (Nil!22953) (Cons!22952 (h!24161 tuple2!16412) (t!32285 List!22956)) )
))
(declare-datatypes ((ListLongMap!14381 0))(
  ( (ListLongMap!14382 (toList!7206 List!22956)) )
))
(declare-fun lt!472822 () ListLongMap!14381)

(declare-fun lt!472823 () ListLongMap!14381)

(assert (=> b!1069938 (= lt!472822 lt!472823)))

(declare-fun zeroValueBefore!47 () V!39427)

(declare-datatypes ((Unit!35211 0))(
  ( (Unit!35212) )
))
(declare-fun lt!472824 () Unit!35211)

(declare-fun minValue!907 () V!39427)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39427)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!819 (array!68417 array!68415 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39427 V!39427 V!39427 V!39427 (_ BitVec 32) Int) Unit!35211)

(assert (=> b!1069938 (= lt!472824 (lemmaNoChangeToArrayThenSameMapNoExtras!819 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3782 (array!68417 array!68415 (_ BitVec 32) (_ BitVec 32) V!39427 V!39427 (_ BitVec 32) Int) ListLongMap!14381)

(assert (=> b!1069938 (= lt!472823 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069938 (= lt!472822 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40279 () Bool)

(assert (=> mapIsEmpty!40279 mapRes!40279))

(assert (= (and start!94626 res!713831) b!1069932))

(assert (= (and b!1069932 res!713833) b!1069937))

(assert (= (and b!1069937 res!713832) b!1069936))

(assert (= (and b!1069936 res!713834) b!1069938))

(assert (= (and b!1069934 condMapEmpty!40279) mapIsEmpty!40279))

(assert (= (and b!1069934 (not condMapEmpty!40279)) mapNonEmpty!40279))

(get-info :version)

(assert (= (and mapNonEmpty!40279 ((_ is ValueCellFull!12156) mapValue!40279)) b!1069933))

(assert (= (and b!1069934 ((_ is ValueCellFull!12156) mapDefault!40279)) b!1069935))

(assert (= start!94626 b!1069934))

(declare-fun m!988371 () Bool)

(assert (=> mapNonEmpty!40279 m!988371))

(declare-fun m!988373 () Bool)

(assert (=> b!1069938 m!988373))

(declare-fun m!988375 () Bool)

(assert (=> b!1069938 m!988375))

(declare-fun m!988377 () Bool)

(assert (=> b!1069938 m!988377))

(declare-fun m!988379 () Bool)

(assert (=> b!1069937 m!988379))

(declare-fun m!988381 () Bool)

(assert (=> b!1069936 m!988381))

(declare-fun m!988383 () Bool)

(assert (=> start!94626 m!988383))

(declare-fun m!988385 () Bool)

(assert (=> start!94626 m!988385))

(declare-fun m!988387 () Bool)

(assert (=> start!94626 m!988387))

(check-sat (not b!1069937) (not b_next!21909) b_and!34721 tp_is_empty!25719 (not start!94626) (not b!1069938) (not mapNonEmpty!40279) (not b!1069936))
(check-sat b_and!34721 (not b_next!21909))
(get-model)

(declare-fun d!129231 () Bool)

(assert (=> d!129231 (= (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472836 () Unit!35211)

(declare-fun choose!1739 (array!68417 array!68415 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39427 V!39427 V!39427 V!39427 (_ BitVec 32) Int) Unit!35211)

(assert (=> d!129231 (= lt!472836 (choose!1739 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129231 (validMask!0 mask!1515)))

(assert (=> d!129231 (= (lemmaNoChangeToArrayThenSameMapNoExtras!819 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472836)))

(declare-fun bs!31513 () Bool)

(assert (= bs!31513 d!129231))

(assert (=> bs!31513 m!988377))

(assert (=> bs!31513 m!988375))

(declare-fun m!988407 () Bool)

(assert (=> bs!31513 m!988407))

(assert (=> bs!31513 m!988383))

(assert (=> b!1069938 d!129231))

(declare-fun b!1069984 () Bool)

(declare-fun res!713857 () Bool)

(declare-fun e!610709 () Bool)

(assert (=> b!1069984 (=> (not res!713857) (not e!610709))))

(declare-fun lt!472852 () ListLongMap!14381)

(declare-fun contains!6317 (ListLongMap!14381 (_ BitVec 64)) Bool)

(assert (=> b!1069984 (= res!713857 (not (contains!6317 lt!472852 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1069985 () Bool)

(declare-fun e!610708 () ListLongMap!14381)

(declare-fun call!45163 () ListLongMap!14381)

(assert (=> b!1069985 (= e!610708 call!45163)))

(declare-fun b!1069986 () Bool)

(declare-fun e!610713 () Bool)

(declare-fun e!610710 () Bool)

(assert (=> b!1069986 (= e!610713 e!610710)))

(assert (=> b!1069986 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(declare-fun res!713855 () Bool)

(assert (=> b!1069986 (= res!713855 (contains!6317 lt!472852 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069986 (=> (not res!713855) (not e!610710))))

(declare-fun b!1069987 () Bool)

(declare-fun e!610707 () ListLongMap!14381)

(assert (=> b!1069987 (= e!610707 e!610708)))

(declare-fun c!107599 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1069987 (= c!107599 (validKeyInArray!0 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069988 () Bool)

(assert (=> b!1069988 (= e!610709 e!610713)))

(declare-fun c!107597 () Bool)

(declare-fun e!610712 () Bool)

(assert (=> b!1069988 (= c!107597 e!610712)))

(declare-fun res!713858 () Bool)

(assert (=> b!1069988 (=> (not res!713858) (not e!610712))))

(assert (=> b!1069988 (= res!713858 (bvslt #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(declare-fun b!1069989 () Bool)

(declare-fun e!610711 () Bool)

(assert (=> b!1069989 (= e!610713 e!610711)))

(declare-fun c!107598 () Bool)

(assert (=> b!1069989 (= c!107598 (bvslt #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(declare-fun b!1069990 () Bool)

(assert (=> b!1069990 (= e!610707 (ListLongMap!14382 Nil!22953))))

(declare-fun bm!45160 () Bool)

(assert (=> bm!45160 (= call!45163 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1069991 () Bool)

(declare-fun isEmpty!946 (ListLongMap!14381) Bool)

(assert (=> b!1069991 (= e!610711 (isEmpty!946 lt!472852))))

(declare-fun b!1069992 () Bool)

(assert (=> b!1069992 (= e!610712 (validKeyInArray!0 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069992 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1069993 () Bool)

(declare-fun lt!472853 () Unit!35211)

(declare-fun lt!472851 () Unit!35211)

(assert (=> b!1069993 (= lt!472853 lt!472851)))

(declare-fun lt!472855 () (_ BitVec 64))

(declare-fun lt!472854 () V!39427)

(declare-fun lt!472856 () (_ BitVec 64))

(declare-fun lt!472857 () ListLongMap!14381)

(declare-fun +!3163 (ListLongMap!14381 tuple2!16412) ListLongMap!14381)

(assert (=> b!1069993 (not (contains!6317 (+!3163 lt!472857 (tuple2!16413 lt!472856 lt!472854)) lt!472855))))

(declare-fun addStillNotContains!256 (ListLongMap!14381 (_ BitVec 64) V!39427 (_ BitVec 64)) Unit!35211)

(assert (=> b!1069993 (= lt!472851 (addStillNotContains!256 lt!472857 lt!472856 lt!472854 lt!472855))))

(assert (=> b!1069993 (= lt!472855 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17126 (ValueCell!12156 V!39427) V!39427)

(declare-fun dynLambda!2035 (Int (_ BitVec 64)) V!39427)

(assert (=> b!1069993 (= lt!472854 (get!17126 (select (arr!32905 _values!955) #b00000000000000000000000000000000) (dynLambda!2035 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1069993 (= lt!472856 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1069993 (= lt!472857 call!45163)))

(assert (=> b!1069993 (= e!610708 (+!3163 call!45163 (tuple2!16413 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000) (get!17126 (select (arr!32905 _values!955) #b00000000000000000000000000000000) (dynLambda!2035 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1069994 () Bool)

(assert (=> b!1069994 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(assert (=> b!1069994 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33441 _values!955)))))

(declare-fun apply!928 (ListLongMap!14381 (_ BitVec 64)) V!39427)

(assert (=> b!1069994 (= e!610710 (= (apply!928 lt!472852 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)) (get!17126 (select (arr!32905 _values!955) #b00000000000000000000000000000000) (dynLambda!2035 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1069995 () Bool)

(assert (=> b!1069995 (= e!610711 (= lt!472852 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!129233 () Bool)

(assert (=> d!129233 e!610709))

(declare-fun res!713856 () Bool)

(assert (=> d!129233 (=> (not res!713856) (not e!610709))))

(assert (=> d!129233 (= res!713856 (not (contains!6317 lt!472852 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129233 (= lt!472852 e!610707)))

(declare-fun c!107596 () Bool)

(assert (=> d!129233 (= c!107596 (bvsge #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(assert (=> d!129233 (validMask!0 mask!1515)))

(assert (=> d!129233 (= (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472852)))

(assert (= (and d!129233 c!107596) b!1069990))

(assert (= (and d!129233 (not c!107596)) b!1069987))

(assert (= (and b!1069987 c!107599) b!1069993))

(assert (= (and b!1069987 (not c!107599)) b!1069985))

(assert (= (or b!1069993 b!1069985) bm!45160))

(assert (= (and d!129233 res!713856) b!1069984))

(assert (= (and b!1069984 res!713857) b!1069988))

(assert (= (and b!1069988 res!713858) b!1069992))

(assert (= (and b!1069988 c!107597) b!1069986))

(assert (= (and b!1069988 (not c!107597)) b!1069989))

(assert (= (and b!1069986 res!713855) b!1069994))

(assert (= (and b!1069989 c!107598) b!1069995))

(assert (= (and b!1069989 (not c!107598)) b!1069991))

(declare-fun b_lambda!16641 () Bool)

(assert (=> (not b_lambda!16641) (not b!1069993)))

(declare-fun t!32289 () Bool)

(declare-fun tb!7151 () Bool)

(assert (=> (and start!94626 (= defaultEntry!963 defaultEntry!963) t!32289) tb!7151))

(declare-fun result!14761 () Bool)

(assert (=> tb!7151 (= result!14761 tp_is_empty!25719)))

(assert (=> b!1069993 t!32289))

(declare-fun b_and!34725 () Bool)

(assert (= b_and!34721 (and (=> t!32289 result!14761) b_and!34725)))

(declare-fun b_lambda!16643 () Bool)

(assert (=> (not b_lambda!16643) (not b!1069994)))

(assert (=> b!1069994 t!32289))

(declare-fun b_and!34727 () Bool)

(assert (= b_and!34725 (and (=> t!32289 result!14761) b_and!34727)))

(declare-fun m!988409 () Bool)

(assert (=> b!1069986 m!988409))

(assert (=> b!1069986 m!988409))

(declare-fun m!988411 () Bool)

(assert (=> b!1069986 m!988411))

(declare-fun m!988413 () Bool)

(assert (=> b!1069984 m!988413))

(declare-fun m!988415 () Bool)

(assert (=> b!1069995 m!988415))

(declare-fun m!988417 () Bool)

(assert (=> b!1069991 m!988417))

(assert (=> bm!45160 m!988415))

(declare-fun m!988419 () Bool)

(assert (=> d!129233 m!988419))

(assert (=> d!129233 m!988383))

(declare-fun m!988421 () Bool)

(assert (=> b!1069994 m!988421))

(declare-fun m!988423 () Bool)

(assert (=> b!1069994 m!988423))

(declare-fun m!988425 () Bool)

(assert (=> b!1069994 m!988425))

(assert (=> b!1069994 m!988421))

(assert (=> b!1069994 m!988409))

(assert (=> b!1069994 m!988409))

(declare-fun m!988427 () Bool)

(assert (=> b!1069994 m!988427))

(assert (=> b!1069994 m!988423))

(assert (=> b!1069992 m!988409))

(assert (=> b!1069992 m!988409))

(declare-fun m!988429 () Bool)

(assert (=> b!1069992 m!988429))

(assert (=> b!1069993 m!988421))

(assert (=> b!1069993 m!988423))

(assert (=> b!1069993 m!988425))

(declare-fun m!988431 () Bool)

(assert (=> b!1069993 m!988431))

(declare-fun m!988433 () Bool)

(assert (=> b!1069993 m!988433))

(assert (=> b!1069993 m!988431))

(declare-fun m!988435 () Bool)

(assert (=> b!1069993 m!988435))

(assert (=> b!1069993 m!988423))

(assert (=> b!1069993 m!988409))

(assert (=> b!1069993 m!988421))

(declare-fun m!988437 () Bool)

(assert (=> b!1069993 m!988437))

(assert (=> b!1069987 m!988409))

(assert (=> b!1069987 m!988409))

(assert (=> b!1069987 m!988429))

(assert (=> b!1069938 d!129233))

(declare-fun b!1069998 () Bool)

(declare-fun res!713861 () Bool)

(declare-fun e!610716 () Bool)

(assert (=> b!1069998 (=> (not res!713861) (not e!610716))))

(declare-fun lt!472859 () ListLongMap!14381)

(assert (=> b!1069998 (= res!713861 (not (contains!6317 lt!472859 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1069999 () Bool)

(declare-fun e!610715 () ListLongMap!14381)

(declare-fun call!45164 () ListLongMap!14381)

(assert (=> b!1069999 (= e!610715 call!45164)))

(declare-fun b!1070000 () Bool)

(declare-fun e!610720 () Bool)

(declare-fun e!610717 () Bool)

(assert (=> b!1070000 (= e!610720 e!610717)))

(assert (=> b!1070000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(declare-fun res!713859 () Bool)

(assert (=> b!1070000 (= res!713859 (contains!6317 lt!472859 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070000 (=> (not res!713859) (not e!610717))))

(declare-fun b!1070001 () Bool)

(declare-fun e!610714 () ListLongMap!14381)

(assert (=> b!1070001 (= e!610714 e!610715)))

(declare-fun c!107603 () Bool)

(assert (=> b!1070001 (= c!107603 (validKeyInArray!0 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070002 () Bool)

(assert (=> b!1070002 (= e!610716 e!610720)))

(declare-fun c!107601 () Bool)

(declare-fun e!610719 () Bool)

(assert (=> b!1070002 (= c!107601 e!610719)))

(declare-fun res!713862 () Bool)

(assert (=> b!1070002 (=> (not res!713862) (not e!610719))))

(assert (=> b!1070002 (= res!713862 (bvslt #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(declare-fun b!1070003 () Bool)

(declare-fun e!610718 () Bool)

(assert (=> b!1070003 (= e!610720 e!610718)))

(declare-fun c!107602 () Bool)

(assert (=> b!1070003 (= c!107602 (bvslt #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(declare-fun b!1070004 () Bool)

(assert (=> b!1070004 (= e!610714 (ListLongMap!14382 Nil!22953))))

(declare-fun bm!45161 () Bool)

(assert (=> bm!45161 (= call!45164 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1070005 () Bool)

(assert (=> b!1070005 (= e!610718 (isEmpty!946 lt!472859))))

(declare-fun b!1070006 () Bool)

(assert (=> b!1070006 (= e!610719 (validKeyInArray!0 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070006 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1070007 () Bool)

(declare-fun lt!472860 () Unit!35211)

(declare-fun lt!472858 () Unit!35211)

(assert (=> b!1070007 (= lt!472860 lt!472858)))

(declare-fun lt!472863 () (_ BitVec 64))

(declare-fun lt!472861 () V!39427)

(declare-fun lt!472862 () (_ BitVec 64))

(declare-fun lt!472864 () ListLongMap!14381)

(assert (=> b!1070007 (not (contains!6317 (+!3163 lt!472864 (tuple2!16413 lt!472863 lt!472861)) lt!472862))))

(assert (=> b!1070007 (= lt!472858 (addStillNotContains!256 lt!472864 lt!472863 lt!472861 lt!472862))))

(assert (=> b!1070007 (= lt!472862 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1070007 (= lt!472861 (get!17126 (select (arr!32905 _values!955) #b00000000000000000000000000000000) (dynLambda!2035 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1070007 (= lt!472863 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1070007 (= lt!472864 call!45164)))

(assert (=> b!1070007 (= e!610715 (+!3163 call!45164 (tuple2!16413 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000) (get!17126 (select (arr!32905 _values!955) #b00000000000000000000000000000000) (dynLambda!2035 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1070008 () Bool)

(assert (=> b!1070008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(assert (=> b!1070008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33441 _values!955)))))

(assert (=> b!1070008 (= e!610717 (= (apply!928 lt!472859 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)) (get!17126 (select (arr!32905 _values!955) #b00000000000000000000000000000000) (dynLambda!2035 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1070009 () Bool)

(assert (=> b!1070009 (= e!610718 (= lt!472859 (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!129235 () Bool)

(assert (=> d!129235 e!610716))

(declare-fun res!713860 () Bool)

(assert (=> d!129235 (=> (not res!713860) (not e!610716))))

(assert (=> d!129235 (= res!713860 (not (contains!6317 lt!472859 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129235 (= lt!472859 e!610714)))

(declare-fun c!107600 () Bool)

(assert (=> d!129235 (= c!107600 (bvsge #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(assert (=> d!129235 (validMask!0 mask!1515)))

(assert (=> d!129235 (= (getCurrentListMapNoExtraKeys!3782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472859)))

(assert (= (and d!129235 c!107600) b!1070004))

(assert (= (and d!129235 (not c!107600)) b!1070001))

(assert (= (and b!1070001 c!107603) b!1070007))

(assert (= (and b!1070001 (not c!107603)) b!1069999))

(assert (= (or b!1070007 b!1069999) bm!45161))

(assert (= (and d!129235 res!713860) b!1069998))

(assert (= (and b!1069998 res!713861) b!1070002))

(assert (= (and b!1070002 res!713862) b!1070006))

(assert (= (and b!1070002 c!107601) b!1070000))

(assert (= (and b!1070002 (not c!107601)) b!1070003))

(assert (= (and b!1070000 res!713859) b!1070008))

(assert (= (and b!1070003 c!107602) b!1070009))

(assert (= (and b!1070003 (not c!107602)) b!1070005))

(declare-fun b_lambda!16645 () Bool)

(assert (=> (not b_lambda!16645) (not b!1070007)))

(assert (=> b!1070007 t!32289))

(declare-fun b_and!34729 () Bool)

(assert (= b_and!34727 (and (=> t!32289 result!14761) b_and!34729)))

(declare-fun b_lambda!16647 () Bool)

(assert (=> (not b_lambda!16647) (not b!1070008)))

(assert (=> b!1070008 t!32289))

(declare-fun b_and!34731 () Bool)

(assert (= b_and!34729 (and (=> t!32289 result!14761) b_and!34731)))

(assert (=> b!1070000 m!988409))

(assert (=> b!1070000 m!988409))

(declare-fun m!988439 () Bool)

(assert (=> b!1070000 m!988439))

(declare-fun m!988441 () Bool)

(assert (=> b!1069998 m!988441))

(declare-fun m!988443 () Bool)

(assert (=> b!1070009 m!988443))

(declare-fun m!988445 () Bool)

(assert (=> b!1070005 m!988445))

(assert (=> bm!45161 m!988443))

(declare-fun m!988447 () Bool)

(assert (=> d!129235 m!988447))

(assert (=> d!129235 m!988383))

(assert (=> b!1070008 m!988421))

(assert (=> b!1070008 m!988423))

(assert (=> b!1070008 m!988425))

(assert (=> b!1070008 m!988421))

(assert (=> b!1070008 m!988409))

(assert (=> b!1070008 m!988409))

(declare-fun m!988449 () Bool)

(assert (=> b!1070008 m!988449))

(assert (=> b!1070008 m!988423))

(assert (=> b!1070006 m!988409))

(assert (=> b!1070006 m!988409))

(assert (=> b!1070006 m!988429))

(assert (=> b!1070007 m!988421))

(assert (=> b!1070007 m!988423))

(assert (=> b!1070007 m!988425))

(declare-fun m!988451 () Bool)

(assert (=> b!1070007 m!988451))

(declare-fun m!988453 () Bool)

(assert (=> b!1070007 m!988453))

(assert (=> b!1070007 m!988451))

(declare-fun m!988455 () Bool)

(assert (=> b!1070007 m!988455))

(assert (=> b!1070007 m!988423))

(assert (=> b!1070007 m!988409))

(assert (=> b!1070007 m!988421))

(declare-fun m!988457 () Bool)

(assert (=> b!1070007 m!988457))

(assert (=> b!1070001 m!988409))

(assert (=> b!1070001 m!988409))

(assert (=> b!1070001 m!988429))

(assert (=> b!1069938 d!129235))

(declare-fun b!1070018 () Bool)

(declare-fun e!610728 () Bool)

(declare-fun call!45167 () Bool)

(assert (=> b!1070018 (= e!610728 call!45167)))

(declare-fun b!1070019 () Bool)

(declare-fun e!610727 () Bool)

(assert (=> b!1070019 (= e!610727 e!610728)))

(declare-fun lt!472872 () (_ BitVec 64))

(assert (=> b!1070019 (= lt!472872 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472873 () Unit!35211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68417 (_ BitVec 64) (_ BitVec 32)) Unit!35211)

(assert (=> b!1070019 (= lt!472873 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!472872 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1070019 (arrayContainsKey!0 _keys!1163 lt!472872 #b00000000000000000000000000000000)))

(declare-fun lt!472871 () Unit!35211)

(assert (=> b!1070019 (= lt!472871 lt!472873)))

(declare-fun res!713868 () Bool)

(declare-datatypes ((SeekEntryResult!9881 0))(
  ( (MissingZero!9881 (index!41895 (_ BitVec 32))) (Found!9881 (index!41896 (_ BitVec 32))) (Intermediate!9881 (undefined!10693 Bool) (index!41897 (_ BitVec 32)) (x!95850 (_ BitVec 32))) (Undefined!9881) (MissingVacant!9881 (index!41898 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68417 (_ BitVec 32)) SeekEntryResult!9881)

(assert (=> b!1070019 (= res!713868 (= (seekEntryOrOpen!0 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9881 #b00000000000000000000000000000000)))))

(assert (=> b!1070019 (=> (not res!713868) (not e!610728))))

(declare-fun d!129237 () Bool)

(declare-fun res!713867 () Bool)

(declare-fun e!610729 () Bool)

(assert (=> d!129237 (=> res!713867 e!610729)))

(assert (=> d!129237 (= res!713867 (bvsge #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(assert (=> d!129237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!610729)))

(declare-fun b!1070020 () Bool)

(assert (=> b!1070020 (= e!610727 call!45167)))

(declare-fun bm!45164 () Bool)

(assert (=> bm!45164 (= call!45167 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1070021 () Bool)

(assert (=> b!1070021 (= e!610729 e!610727)))

(declare-fun c!107606 () Bool)

(assert (=> b!1070021 (= c!107606 (validKeyInArray!0 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129237 (not res!713867)) b!1070021))

(assert (= (and b!1070021 c!107606) b!1070019))

(assert (= (and b!1070021 (not c!107606)) b!1070020))

(assert (= (and b!1070019 res!713868) b!1070018))

(assert (= (or b!1070018 b!1070020) bm!45164))

(assert (=> b!1070019 m!988409))

(declare-fun m!988459 () Bool)

(assert (=> b!1070019 m!988459))

(declare-fun m!988461 () Bool)

(assert (=> b!1070019 m!988461))

(assert (=> b!1070019 m!988409))

(declare-fun m!988463 () Bool)

(assert (=> b!1070019 m!988463))

(declare-fun m!988465 () Bool)

(assert (=> bm!45164 m!988465))

(assert (=> b!1070021 m!988409))

(assert (=> b!1070021 m!988409))

(assert (=> b!1070021 m!988429))

(assert (=> b!1069937 d!129237))

(declare-fun d!129239 () Bool)

(declare-fun res!713875 () Bool)

(declare-fun e!610739 () Bool)

(assert (=> d!129239 (=> res!713875 e!610739)))

(assert (=> d!129239 (= res!713875 (bvsge #b00000000000000000000000000000000 (size!33442 _keys!1163)))))

(assert (=> d!129239 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22952) e!610739)))

(declare-fun bm!45167 () Bool)

(declare-fun call!45170 () Bool)

(declare-fun c!107609 () Bool)

(assert (=> bm!45167 (= call!45170 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107609 (Cons!22951 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000) Nil!22952) Nil!22952)))))

(declare-fun b!1070032 () Bool)

(declare-fun e!610738 () Bool)

(assert (=> b!1070032 (= e!610738 call!45170)))

(declare-fun b!1070033 () Bool)

(declare-fun e!610741 () Bool)

(assert (=> b!1070033 (= e!610741 e!610738)))

(assert (=> b!1070033 (= c!107609 (validKeyInArray!0 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070034 () Bool)

(assert (=> b!1070034 (= e!610739 e!610741)))

(declare-fun res!713877 () Bool)

(assert (=> b!1070034 (=> (not res!713877) (not e!610741))))

(declare-fun e!610740 () Bool)

(assert (=> b!1070034 (= res!713877 (not e!610740))))

(declare-fun res!713876 () Bool)

(assert (=> b!1070034 (=> (not res!713876) (not e!610740))))

(assert (=> b!1070034 (= res!713876 (validKeyInArray!0 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070035 () Bool)

(assert (=> b!1070035 (= e!610738 call!45170)))

(declare-fun b!1070036 () Bool)

(declare-fun contains!6318 (List!22955 (_ BitVec 64)) Bool)

(assert (=> b!1070036 (= e!610740 (contains!6318 Nil!22952 (select (arr!32906 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129239 (not res!713875)) b!1070034))

(assert (= (and b!1070034 res!713876) b!1070036))

(assert (= (and b!1070034 res!713877) b!1070033))

(assert (= (and b!1070033 c!107609) b!1070032))

(assert (= (and b!1070033 (not c!107609)) b!1070035))

(assert (= (or b!1070032 b!1070035) bm!45167))

(assert (=> bm!45167 m!988409))

(declare-fun m!988467 () Bool)

(assert (=> bm!45167 m!988467))

(assert (=> b!1070033 m!988409))

(assert (=> b!1070033 m!988409))

(assert (=> b!1070033 m!988429))

(assert (=> b!1070034 m!988409))

(assert (=> b!1070034 m!988409))

(assert (=> b!1070034 m!988429))

(assert (=> b!1070036 m!988409))

(assert (=> b!1070036 m!988409))

(declare-fun m!988469 () Bool)

(assert (=> b!1070036 m!988469))

(assert (=> b!1069936 d!129239))

(declare-fun d!129241 () Bool)

(assert (=> d!129241 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94626 d!129241))

(declare-fun d!129243 () Bool)

(assert (=> d!129243 (= (array_inv!25456 _values!955) (bvsge (size!33441 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94626 d!129243))

(declare-fun d!129245 () Bool)

(assert (=> d!129245 (= (array_inv!25457 _keys!1163) (bvsge (size!33442 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94626 d!129245))

(declare-fun b!1070044 () Bool)

(declare-fun e!610747 () Bool)

(assert (=> b!1070044 (= e!610747 tp_is_empty!25719)))

(declare-fun b!1070043 () Bool)

(declare-fun e!610746 () Bool)

(assert (=> b!1070043 (= e!610746 tp_is_empty!25719)))

(declare-fun mapNonEmpty!40285 () Bool)

(declare-fun mapRes!40285 () Bool)

(declare-fun tp!77189 () Bool)

(assert (=> mapNonEmpty!40285 (= mapRes!40285 (and tp!77189 e!610746))))

(declare-fun mapKey!40285 () (_ BitVec 32))

(declare-fun mapValue!40285 () ValueCell!12156)

(declare-fun mapRest!40285 () (Array (_ BitVec 32) ValueCell!12156))

(assert (=> mapNonEmpty!40285 (= mapRest!40279 (store mapRest!40285 mapKey!40285 mapValue!40285))))

(declare-fun mapIsEmpty!40285 () Bool)

(assert (=> mapIsEmpty!40285 mapRes!40285))

(declare-fun condMapEmpty!40285 () Bool)

(declare-fun mapDefault!40285 () ValueCell!12156)

(assert (=> mapNonEmpty!40279 (= condMapEmpty!40285 (= mapRest!40279 ((as const (Array (_ BitVec 32) ValueCell!12156)) mapDefault!40285)))))

(assert (=> mapNonEmpty!40279 (= tp!77180 (and e!610747 mapRes!40285))))

(assert (= (and mapNonEmpty!40279 condMapEmpty!40285) mapIsEmpty!40285))

(assert (= (and mapNonEmpty!40279 (not condMapEmpty!40285)) mapNonEmpty!40285))

(assert (= (and mapNonEmpty!40285 ((_ is ValueCellFull!12156) mapValue!40285)) b!1070043))

(assert (= (and mapNonEmpty!40279 ((_ is ValueCellFull!12156) mapDefault!40285)) b!1070044))

(declare-fun m!988471 () Bool)

(assert (=> mapNonEmpty!40285 m!988471))

(declare-fun b_lambda!16649 () Bool)

(assert (= b_lambda!16641 (or (and start!94626 b_free!21909) b_lambda!16649)))

(declare-fun b_lambda!16651 () Bool)

(assert (= b_lambda!16645 (or (and start!94626 b_free!21909) b_lambda!16651)))

(declare-fun b_lambda!16653 () Bool)

(assert (= b_lambda!16647 (or (and start!94626 b_free!21909) b_lambda!16653)))

(declare-fun b_lambda!16655 () Bool)

(assert (= b_lambda!16643 (or (and start!94626 b_free!21909) b_lambda!16655)))

(check-sat (not b!1070036) (not mapNonEmpty!40285) (not d!129233) (not b!1070000) (not b!1069994) (not bm!45164) tp_is_empty!25719 (not b_lambda!16651) (not b!1069987) (not b_lambda!16655) (not b!1069986) (not bm!45161) (not b!1070019) (not b!1070021) (not d!129235) (not b_next!21909) (not b!1069991) (not b!1069992) (not b!1070034) (not b!1070006) (not b!1069993) (not b!1069998) (not b!1070007) (not b!1069984) b_and!34731 (not d!129231) (not b!1070033) (not b_lambda!16653) (not b_lambda!16649) (not b!1070008) (not bm!45167) (not bm!45160) (not b!1070009) (not b!1070001) (not b!1069995) (not b!1070005))
(check-sat b_and!34731 (not b_next!21909))
