; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95012 () Bool)

(assert start!95012)

(declare-fun b_free!22171 () Bool)

(declare-fun b_next!22171 () Bool)

(assert (=> start!95012 (= b_free!22171 (not b_next!22171))))

(declare-fun tp!77987 () Bool)

(declare-fun b_and!35029 () Bool)

(assert (=> start!95012 (= tp!77987 b_and!35029)))

(declare-datatypes ((V!39777 0))(
  ( (V!39778 (val!13041 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39777)

(declare-datatypes ((ValueCell!12287 0))(
  ( (ValueCellFull!12287 (v!15660 V!39777)) (EmptyCell!12287) )
))
(declare-datatypes ((array!68856 0))(
  ( (array!68857 (arr!33119 (Array (_ BitVec 32) ValueCell!12287)) (size!33657 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68856)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39777)

(declare-datatypes ((tuple2!16668 0))(
  ( (tuple2!16669 (_1!8345 (_ BitVec 64)) (_2!8345 V!39777)) )
))
(declare-datatypes ((List!23193 0))(
  ( (Nil!23190) (Cons!23189 (h!24398 tuple2!16668) (t!32527 List!23193)) )
))
(declare-datatypes ((ListLongMap!14637 0))(
  ( (ListLongMap!14638 (toList!7334 List!23193)) )
))
(declare-fun lt!476285 () ListLongMap!14637)

(declare-fun b!1074037 () Bool)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun e!613678 () Bool)

(declare-datatypes ((array!68858 0))(
  ( (array!68859 (arr!33120 (Array (_ BitVec 32) (_ BitVec 64))) (size!33658 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68858)

(declare-fun getCurrentListMap!4107 (array!68858 array!68856 (_ BitVec 32) (_ BitVec 32) V!39777 V!39777 (_ BitVec 32) Int) ListLongMap!14637)

(declare-fun +!3240 (ListLongMap!14637 tuple2!16668) ListLongMap!14637)

(assert (=> b!1074037 (= e!613678 (= (getCurrentListMap!4107 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3240 lt!476285 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!476283 () ListLongMap!14637)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39777)

(assert (=> b!1074037 (= lt!476283 (getCurrentListMap!4107 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074038 () Bool)

(declare-fun e!613683 () Bool)

(declare-fun tp_is_empty!25981 () Bool)

(assert (=> b!1074038 (= e!613683 tp_is_empty!25981)))

(declare-fun b!1074039 () Bool)

(declare-fun res!716236 () Bool)

(declare-fun e!613682 () Bool)

(assert (=> b!1074039 (=> (not res!716236) (not e!613682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68858 (_ BitVec 32)) Bool)

(assert (=> b!1074039 (= res!716236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074040 () Bool)

(declare-fun res!716239 () Bool)

(assert (=> b!1074040 (=> (not res!716239) (not e!613682))))

(declare-datatypes ((List!23194 0))(
  ( (Nil!23191) (Cons!23190 (h!24399 (_ BitVec 64)) (t!32528 List!23194)) )
))
(declare-fun arrayNoDuplicates!0 (array!68858 (_ BitVec 32) List!23194) Bool)

(assert (=> b!1074040 (= res!716239 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23191))))

(declare-fun res!716237 () Bool)

(assert (=> start!95012 (=> (not res!716237) (not e!613682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95012 (= res!716237 (validMask!0 mask!1515))))

(assert (=> start!95012 e!613682))

(assert (=> start!95012 true))

(assert (=> start!95012 tp_is_empty!25981))

(declare-fun e!613679 () Bool)

(declare-fun array_inv!25622 (array!68856) Bool)

(assert (=> start!95012 (and (array_inv!25622 _values!955) e!613679)))

(assert (=> start!95012 tp!77987))

(declare-fun array_inv!25623 (array!68858) Bool)

(assert (=> start!95012 (array_inv!25623 _keys!1163)))

(declare-fun b!1074041 () Bool)

(declare-fun res!716235 () Bool)

(assert (=> b!1074041 (=> (not res!716235) (not e!613682))))

(assert (=> b!1074041 (= res!716235 (and (= (size!33657 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33658 _keys!1163) (size!33657 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074042 () Bool)

(declare-fun e!613680 () Bool)

(declare-fun mapRes!40693 () Bool)

(assert (=> b!1074042 (= e!613679 (and e!613680 mapRes!40693))))

(declare-fun condMapEmpty!40693 () Bool)

(declare-fun mapDefault!40693 () ValueCell!12287)

(assert (=> b!1074042 (= condMapEmpty!40693 (= (arr!33119 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12287)) mapDefault!40693)))))

(declare-fun mapIsEmpty!40693 () Bool)

(assert (=> mapIsEmpty!40693 mapRes!40693))

(declare-fun b!1074043 () Bool)

(assert (=> b!1074043 (= e!613680 tp_is_empty!25981)))

(declare-fun mapNonEmpty!40693 () Bool)

(declare-fun tp!77986 () Bool)

(assert (=> mapNonEmpty!40693 (= mapRes!40693 (and tp!77986 e!613683))))

(declare-fun mapKey!40693 () (_ BitVec 32))

(declare-fun mapValue!40693 () ValueCell!12287)

(declare-fun mapRest!40693 () (Array (_ BitVec 32) ValueCell!12287))

(assert (=> mapNonEmpty!40693 (= (arr!33119 _values!955) (store mapRest!40693 mapKey!40693 mapValue!40693))))

(declare-fun b!1074044 () Bool)

(assert (=> b!1074044 (= e!613682 (not e!613678))))

(declare-fun res!716238 () Bool)

(assert (=> b!1074044 (=> res!716238 e!613678)))

(assert (=> b!1074044 (= res!716238 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!476284 () ListLongMap!14637)

(assert (=> b!1074044 (= lt!476285 lt!476284)))

(declare-datatypes ((Unit!35208 0))(
  ( (Unit!35209) )
))
(declare-fun lt!476286 () Unit!35208)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!886 (array!68858 array!68856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39777 V!39777 V!39777 V!39777 (_ BitVec 32) Int) Unit!35208)

(assert (=> b!1074044 (= lt!476286 (lemmaNoChangeToArrayThenSameMapNoExtras!886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3914 (array!68858 array!68856 (_ BitVec 32) (_ BitVec 32) V!39777 V!39777 (_ BitVec 32) Int) ListLongMap!14637)

(assert (=> b!1074044 (= lt!476284 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074044 (= lt!476285 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95012 res!716237) b!1074041))

(assert (= (and b!1074041 res!716235) b!1074039))

(assert (= (and b!1074039 res!716236) b!1074040))

(assert (= (and b!1074040 res!716239) b!1074044))

(assert (= (and b!1074044 (not res!716238)) b!1074037))

(assert (= (and b!1074042 condMapEmpty!40693) mapIsEmpty!40693))

(assert (= (and b!1074042 (not condMapEmpty!40693)) mapNonEmpty!40693))

(get-info :version)

(assert (= (and mapNonEmpty!40693 ((_ is ValueCellFull!12287) mapValue!40693)) b!1074038))

(assert (= (and b!1074042 ((_ is ValueCellFull!12287) mapDefault!40693)) b!1074043))

(assert (= start!95012 b!1074042))

(declare-fun m!992439 () Bool)

(assert (=> b!1074040 m!992439))

(declare-fun m!992441 () Bool)

(assert (=> start!95012 m!992441))

(declare-fun m!992443 () Bool)

(assert (=> start!95012 m!992443))

(declare-fun m!992445 () Bool)

(assert (=> start!95012 m!992445))

(declare-fun m!992447 () Bool)

(assert (=> b!1074037 m!992447))

(declare-fun m!992449 () Bool)

(assert (=> b!1074037 m!992449))

(declare-fun m!992451 () Bool)

(assert (=> b!1074037 m!992451))

(declare-fun m!992453 () Bool)

(assert (=> mapNonEmpty!40693 m!992453))

(declare-fun m!992455 () Bool)

(assert (=> b!1074039 m!992455))

(declare-fun m!992457 () Bool)

(assert (=> b!1074044 m!992457))

(declare-fun m!992459 () Bool)

(assert (=> b!1074044 m!992459))

(declare-fun m!992461 () Bool)

(assert (=> b!1074044 m!992461))

(check-sat tp_is_empty!25981 (not mapNonEmpty!40693) (not b!1074037) (not b!1074044) b_and!35029 (not b!1074040) (not b!1074039) (not b_next!22171) (not start!95012))
(check-sat b_and!35029 (not b_next!22171))
(get-model)

(declare-fun b!1074103 () Bool)

(declare-fun e!613730 () Bool)

(declare-fun call!45336 () Bool)

(assert (=> b!1074103 (= e!613730 call!45336)))

(declare-fun b!1074104 () Bool)

(assert (=> b!1074104 (= e!613730 call!45336)))

(declare-fun bm!45333 () Bool)

(declare-fun c!107819 () Bool)

(assert (=> bm!45333 (= call!45336 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107819 (Cons!23190 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000) Nil!23191) Nil!23191)))))

(declare-fun d!129333 () Bool)

(declare-fun res!716276 () Bool)

(declare-fun e!613731 () Bool)

(assert (=> d!129333 (=> res!716276 e!613731)))

(assert (=> d!129333 (= res!716276 (bvsge #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(assert (=> d!129333 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23191) e!613731)))

(declare-fun b!1074105 () Bool)

(declare-fun e!613728 () Bool)

(declare-fun contains!6303 (List!23194 (_ BitVec 64)) Bool)

(assert (=> b!1074105 (= e!613728 (contains!6303 Nil!23191 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074106 () Bool)

(declare-fun e!613729 () Bool)

(assert (=> b!1074106 (= e!613731 e!613729)))

(declare-fun res!716278 () Bool)

(assert (=> b!1074106 (=> (not res!716278) (not e!613729))))

(assert (=> b!1074106 (= res!716278 (not e!613728))))

(declare-fun res!716277 () Bool)

(assert (=> b!1074106 (=> (not res!716277) (not e!613728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1074106 (= res!716277 (validKeyInArray!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074107 () Bool)

(assert (=> b!1074107 (= e!613729 e!613730)))

(assert (=> b!1074107 (= c!107819 (validKeyInArray!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129333 (not res!716276)) b!1074106))

(assert (= (and b!1074106 res!716277) b!1074105))

(assert (= (and b!1074106 res!716278) b!1074107))

(assert (= (and b!1074107 c!107819) b!1074103))

(assert (= (and b!1074107 (not c!107819)) b!1074104))

(assert (= (or b!1074103 b!1074104) bm!45333))

(declare-fun m!992511 () Bool)

(assert (=> bm!45333 m!992511))

(declare-fun m!992513 () Bool)

(assert (=> bm!45333 m!992513))

(assert (=> b!1074105 m!992511))

(assert (=> b!1074105 m!992511))

(declare-fun m!992515 () Bool)

(assert (=> b!1074105 m!992515))

(assert (=> b!1074106 m!992511))

(assert (=> b!1074106 m!992511))

(declare-fun m!992517 () Bool)

(assert (=> b!1074106 m!992517))

(assert (=> b!1074107 m!992511))

(assert (=> b!1074107 m!992511))

(assert (=> b!1074107 m!992517))

(assert (=> b!1074040 d!129333))

(declare-fun d!129335 () Bool)

(assert (=> d!129335 (= (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476313 () Unit!35208)

(declare-fun choose!1757 (array!68858 array!68856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39777 V!39777 V!39777 V!39777 (_ BitVec 32) Int) Unit!35208)

(assert (=> d!129335 (= lt!476313 (choose!1757 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129335 (validMask!0 mask!1515)))

(assert (=> d!129335 (= (lemmaNoChangeToArrayThenSameMapNoExtras!886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476313)))

(declare-fun bs!31632 () Bool)

(assert (= bs!31632 d!129335))

(assert (=> bs!31632 m!992461))

(assert (=> bs!31632 m!992459))

(declare-fun m!992519 () Bool)

(assert (=> bs!31632 m!992519))

(assert (=> bs!31632 m!992441))

(assert (=> b!1074044 d!129335))

(declare-fun b!1074132 () Bool)

(declare-fun e!613747 () Bool)

(declare-fun e!613749 () Bool)

(assert (=> b!1074132 (= e!613747 e!613749)))

(declare-fun c!107830 () Bool)

(declare-fun e!613751 () Bool)

(assert (=> b!1074132 (= c!107830 e!613751)))

(declare-fun res!716289 () Bool)

(assert (=> b!1074132 (=> (not res!716289) (not e!613751))))

(assert (=> b!1074132 (= res!716289 (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun b!1074133 () Bool)

(declare-fun lt!476332 () Unit!35208)

(declare-fun lt!476331 () Unit!35208)

(assert (=> b!1074133 (= lt!476332 lt!476331)))

(declare-fun lt!476334 () V!39777)

(declare-fun lt!476330 () ListLongMap!14637)

(declare-fun lt!476333 () (_ BitVec 64))

(declare-fun lt!476328 () (_ BitVec 64))

(declare-fun contains!6304 (ListLongMap!14637 (_ BitVec 64)) Bool)

(assert (=> b!1074133 (not (contains!6304 (+!3240 lt!476330 (tuple2!16669 lt!476328 lt!476334)) lt!476333))))

(declare-fun addStillNotContains!264 (ListLongMap!14637 (_ BitVec 64) V!39777 (_ BitVec 64)) Unit!35208)

(assert (=> b!1074133 (= lt!476331 (addStillNotContains!264 lt!476330 lt!476328 lt!476334 lt!476333))))

(assert (=> b!1074133 (= lt!476333 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17216 (ValueCell!12287 V!39777) V!39777)

(declare-fun dynLambda!2027 (Int (_ BitVec 64)) V!39777)

(assert (=> b!1074133 (= lt!476334 (get!17216 (select (arr!33119 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074133 (= lt!476328 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45339 () ListLongMap!14637)

(assert (=> b!1074133 (= lt!476330 call!45339)))

(declare-fun e!613752 () ListLongMap!14637)

(assert (=> b!1074133 (= e!613752 (+!3240 call!45339 (tuple2!16669 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000) (get!17216 (select (arr!33119 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!129337 () Bool)

(assert (=> d!129337 e!613747))

(declare-fun res!716290 () Bool)

(assert (=> d!129337 (=> (not res!716290) (not e!613747))))

(declare-fun lt!476329 () ListLongMap!14637)

(assert (=> d!129337 (= res!716290 (not (contains!6304 lt!476329 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!613748 () ListLongMap!14637)

(assert (=> d!129337 (= lt!476329 e!613748)))

(declare-fun c!107828 () Bool)

(assert (=> d!129337 (= c!107828 (bvsge #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(assert (=> d!129337 (validMask!0 mask!1515)))

(assert (=> d!129337 (= (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476329)))

(declare-fun e!613750 () Bool)

(declare-fun b!1074134 () Bool)

(assert (=> b!1074134 (= e!613750 (= lt!476329 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45336 () Bool)

(assert (=> bm!45336 (= call!45339 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074135 () Bool)

(declare-fun isEmpty!958 (ListLongMap!14637) Bool)

(assert (=> b!1074135 (= e!613750 (isEmpty!958 lt!476329))))

(declare-fun b!1074136 () Bool)

(assert (=> b!1074136 (= e!613752 call!45339)))

(declare-fun b!1074137 () Bool)

(assert (=> b!1074137 (= e!613748 (ListLongMap!14638 Nil!23190))))

(declare-fun b!1074138 () Bool)

(assert (=> b!1074138 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(assert (=> b!1074138 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33657 _values!955)))))

(declare-fun e!613746 () Bool)

(declare-fun apply!928 (ListLongMap!14637 (_ BitVec 64)) V!39777)

(assert (=> b!1074138 (= e!613746 (= (apply!928 lt!476329 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)) (get!17216 (select (arr!33119 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074139 () Bool)

(declare-fun res!716287 () Bool)

(assert (=> b!1074139 (=> (not res!716287) (not e!613747))))

(assert (=> b!1074139 (= res!716287 (not (contains!6304 lt!476329 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074140 () Bool)

(assert (=> b!1074140 (= e!613748 e!613752)))

(declare-fun c!107829 () Bool)

(assert (=> b!1074140 (= c!107829 (validKeyInArray!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074141 () Bool)

(assert (=> b!1074141 (= e!613751 (validKeyInArray!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074141 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074142 () Bool)

(assert (=> b!1074142 (= e!613749 e!613750)))

(declare-fun c!107831 () Bool)

(assert (=> b!1074142 (= c!107831 (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun b!1074143 () Bool)

(assert (=> b!1074143 (= e!613749 e!613746)))

(assert (=> b!1074143 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun res!716288 () Bool)

(assert (=> b!1074143 (= res!716288 (contains!6304 lt!476329 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074143 (=> (not res!716288) (not e!613746))))

(assert (= (and d!129337 c!107828) b!1074137))

(assert (= (and d!129337 (not c!107828)) b!1074140))

(assert (= (and b!1074140 c!107829) b!1074133))

(assert (= (and b!1074140 (not c!107829)) b!1074136))

(assert (= (or b!1074133 b!1074136) bm!45336))

(assert (= (and d!129337 res!716290) b!1074139))

(assert (= (and b!1074139 res!716287) b!1074132))

(assert (= (and b!1074132 res!716289) b!1074141))

(assert (= (and b!1074132 c!107830) b!1074143))

(assert (= (and b!1074132 (not c!107830)) b!1074142))

(assert (= (and b!1074143 res!716288) b!1074138))

(assert (= (and b!1074142 c!107831) b!1074134))

(assert (= (and b!1074142 (not c!107831)) b!1074135))

(declare-fun b_lambda!16763 () Bool)

(assert (=> (not b_lambda!16763) (not b!1074133)))

(declare-fun t!32533 () Bool)

(declare-fun tb!7157 () Bool)

(assert (=> (and start!95012 (= defaultEntry!963 defaultEntry!963) t!32533) tb!7157))

(declare-fun result!14795 () Bool)

(assert (=> tb!7157 (= result!14795 tp_is_empty!25981)))

(assert (=> b!1074133 t!32533))

(declare-fun b_and!35035 () Bool)

(assert (= b_and!35029 (and (=> t!32533 result!14795) b_and!35035)))

(declare-fun b_lambda!16765 () Bool)

(assert (=> (not b_lambda!16765) (not b!1074138)))

(assert (=> b!1074138 t!32533))

(declare-fun b_and!35037 () Bool)

(assert (= b_and!35035 (and (=> t!32533 result!14795) b_and!35037)))

(declare-fun m!992521 () Bool)

(assert (=> b!1074134 m!992521))

(assert (=> b!1074140 m!992511))

(assert (=> b!1074140 m!992511))

(assert (=> b!1074140 m!992517))

(assert (=> b!1074143 m!992511))

(assert (=> b!1074143 m!992511))

(declare-fun m!992523 () Bool)

(assert (=> b!1074143 m!992523))

(declare-fun m!992525 () Bool)

(assert (=> d!129337 m!992525))

(assert (=> d!129337 m!992441))

(assert (=> b!1074138 m!992511))

(declare-fun m!992527 () Bool)

(assert (=> b!1074138 m!992527))

(assert (=> b!1074138 m!992527))

(declare-fun m!992529 () Bool)

(assert (=> b!1074138 m!992529))

(declare-fun m!992531 () Bool)

(assert (=> b!1074138 m!992531))

(assert (=> b!1074138 m!992511))

(declare-fun m!992533 () Bool)

(assert (=> b!1074138 m!992533))

(assert (=> b!1074138 m!992529))

(declare-fun m!992535 () Bool)

(assert (=> b!1074133 m!992535))

(declare-fun m!992537 () Bool)

(assert (=> b!1074133 m!992537))

(assert (=> b!1074133 m!992511))

(assert (=> b!1074133 m!992527))

(assert (=> b!1074133 m!992527))

(assert (=> b!1074133 m!992529))

(assert (=> b!1074133 m!992531))

(declare-fun m!992539 () Bool)

(assert (=> b!1074133 m!992539))

(declare-fun m!992541 () Bool)

(assert (=> b!1074133 m!992541))

(assert (=> b!1074133 m!992535))

(assert (=> b!1074133 m!992529))

(declare-fun m!992543 () Bool)

(assert (=> b!1074135 m!992543))

(assert (=> bm!45336 m!992521))

(assert (=> b!1074141 m!992511))

(assert (=> b!1074141 m!992511))

(assert (=> b!1074141 m!992517))

(declare-fun m!992545 () Bool)

(assert (=> b!1074139 m!992545))

(assert (=> b!1074044 d!129337))

(declare-fun b!1074146 () Bool)

(declare-fun e!613754 () Bool)

(declare-fun e!613756 () Bool)

(assert (=> b!1074146 (= e!613754 e!613756)))

(declare-fun c!107834 () Bool)

(declare-fun e!613758 () Bool)

(assert (=> b!1074146 (= c!107834 e!613758)))

(declare-fun res!716293 () Bool)

(assert (=> b!1074146 (=> (not res!716293) (not e!613758))))

(assert (=> b!1074146 (= res!716293 (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun b!1074147 () Bool)

(declare-fun lt!476339 () Unit!35208)

(declare-fun lt!476338 () Unit!35208)

(assert (=> b!1074147 (= lt!476339 lt!476338)))

(declare-fun lt!476337 () ListLongMap!14637)

(declare-fun lt!476340 () (_ BitVec 64))

(declare-fun lt!476335 () (_ BitVec 64))

(declare-fun lt!476341 () V!39777)

(assert (=> b!1074147 (not (contains!6304 (+!3240 lt!476337 (tuple2!16669 lt!476335 lt!476341)) lt!476340))))

(assert (=> b!1074147 (= lt!476338 (addStillNotContains!264 lt!476337 lt!476335 lt!476341 lt!476340))))

(assert (=> b!1074147 (= lt!476340 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074147 (= lt!476341 (get!17216 (select (arr!33119 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074147 (= lt!476335 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45340 () ListLongMap!14637)

(assert (=> b!1074147 (= lt!476337 call!45340)))

(declare-fun e!613759 () ListLongMap!14637)

(assert (=> b!1074147 (= e!613759 (+!3240 call!45340 (tuple2!16669 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000) (get!17216 (select (arr!33119 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!129339 () Bool)

(assert (=> d!129339 e!613754))

(declare-fun res!716294 () Bool)

(assert (=> d!129339 (=> (not res!716294) (not e!613754))))

(declare-fun lt!476336 () ListLongMap!14637)

(assert (=> d!129339 (= res!716294 (not (contains!6304 lt!476336 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!613755 () ListLongMap!14637)

(assert (=> d!129339 (= lt!476336 e!613755)))

(declare-fun c!107832 () Bool)

(assert (=> d!129339 (= c!107832 (bvsge #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(assert (=> d!129339 (validMask!0 mask!1515)))

(assert (=> d!129339 (= (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476336)))

(declare-fun e!613757 () Bool)

(declare-fun b!1074148 () Bool)

(assert (=> b!1074148 (= e!613757 (= lt!476336 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45337 () Bool)

(assert (=> bm!45337 (= call!45340 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074149 () Bool)

(assert (=> b!1074149 (= e!613757 (isEmpty!958 lt!476336))))

(declare-fun b!1074150 () Bool)

(assert (=> b!1074150 (= e!613759 call!45340)))

(declare-fun b!1074151 () Bool)

(assert (=> b!1074151 (= e!613755 (ListLongMap!14638 Nil!23190))))

(declare-fun b!1074152 () Bool)

(assert (=> b!1074152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(assert (=> b!1074152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33657 _values!955)))))

(declare-fun e!613753 () Bool)

(assert (=> b!1074152 (= e!613753 (= (apply!928 lt!476336 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)) (get!17216 (select (arr!33119 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074153 () Bool)

(declare-fun res!716291 () Bool)

(assert (=> b!1074153 (=> (not res!716291) (not e!613754))))

(assert (=> b!1074153 (= res!716291 (not (contains!6304 lt!476336 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074154 () Bool)

(assert (=> b!1074154 (= e!613755 e!613759)))

(declare-fun c!107833 () Bool)

(assert (=> b!1074154 (= c!107833 (validKeyInArray!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074155 () Bool)

(assert (=> b!1074155 (= e!613758 (validKeyInArray!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074155 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074156 () Bool)

(assert (=> b!1074156 (= e!613756 e!613757)))

(declare-fun c!107835 () Bool)

(assert (=> b!1074156 (= c!107835 (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun b!1074157 () Bool)

(assert (=> b!1074157 (= e!613756 e!613753)))

(assert (=> b!1074157 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun res!716292 () Bool)

(assert (=> b!1074157 (= res!716292 (contains!6304 lt!476336 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074157 (=> (not res!716292) (not e!613753))))

(assert (= (and d!129339 c!107832) b!1074151))

(assert (= (and d!129339 (not c!107832)) b!1074154))

(assert (= (and b!1074154 c!107833) b!1074147))

(assert (= (and b!1074154 (not c!107833)) b!1074150))

(assert (= (or b!1074147 b!1074150) bm!45337))

(assert (= (and d!129339 res!716294) b!1074153))

(assert (= (and b!1074153 res!716291) b!1074146))

(assert (= (and b!1074146 res!716293) b!1074155))

(assert (= (and b!1074146 c!107834) b!1074157))

(assert (= (and b!1074146 (not c!107834)) b!1074156))

(assert (= (and b!1074157 res!716292) b!1074152))

(assert (= (and b!1074156 c!107835) b!1074148))

(assert (= (and b!1074156 (not c!107835)) b!1074149))

(declare-fun b_lambda!16767 () Bool)

(assert (=> (not b_lambda!16767) (not b!1074147)))

(assert (=> b!1074147 t!32533))

(declare-fun b_and!35039 () Bool)

(assert (= b_and!35037 (and (=> t!32533 result!14795) b_and!35039)))

(declare-fun b_lambda!16769 () Bool)

(assert (=> (not b_lambda!16769) (not b!1074152)))

(assert (=> b!1074152 t!32533))

(declare-fun b_and!35041 () Bool)

(assert (= b_and!35039 (and (=> t!32533 result!14795) b_and!35041)))

(declare-fun m!992547 () Bool)

(assert (=> b!1074148 m!992547))

(assert (=> b!1074154 m!992511))

(assert (=> b!1074154 m!992511))

(assert (=> b!1074154 m!992517))

(assert (=> b!1074157 m!992511))

(assert (=> b!1074157 m!992511))

(declare-fun m!992549 () Bool)

(assert (=> b!1074157 m!992549))

(declare-fun m!992551 () Bool)

(assert (=> d!129339 m!992551))

(assert (=> d!129339 m!992441))

(assert (=> b!1074152 m!992511))

(assert (=> b!1074152 m!992527))

(assert (=> b!1074152 m!992527))

(assert (=> b!1074152 m!992529))

(assert (=> b!1074152 m!992531))

(assert (=> b!1074152 m!992511))

(declare-fun m!992553 () Bool)

(assert (=> b!1074152 m!992553))

(assert (=> b!1074152 m!992529))

(declare-fun m!992555 () Bool)

(assert (=> b!1074147 m!992555))

(declare-fun m!992557 () Bool)

(assert (=> b!1074147 m!992557))

(assert (=> b!1074147 m!992511))

(assert (=> b!1074147 m!992527))

(assert (=> b!1074147 m!992527))

(assert (=> b!1074147 m!992529))

(assert (=> b!1074147 m!992531))

(declare-fun m!992559 () Bool)

(assert (=> b!1074147 m!992559))

(declare-fun m!992561 () Bool)

(assert (=> b!1074147 m!992561))

(assert (=> b!1074147 m!992555))

(assert (=> b!1074147 m!992529))

(declare-fun m!992563 () Bool)

(assert (=> b!1074149 m!992563))

(assert (=> bm!45337 m!992547))

(assert (=> b!1074155 m!992511))

(assert (=> b!1074155 m!992511))

(assert (=> b!1074155 m!992517))

(declare-fun m!992565 () Bool)

(assert (=> b!1074153 m!992565))

(assert (=> b!1074044 d!129339))

(declare-fun b!1074166 () Bool)

(declare-fun e!613768 () Bool)

(declare-fun e!613767 () Bool)

(assert (=> b!1074166 (= e!613768 e!613767)))

(declare-fun lt!476348 () (_ BitVec 64))

(assert (=> b!1074166 (= lt!476348 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476349 () Unit!35208)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68858 (_ BitVec 64) (_ BitVec 32)) Unit!35208)

(assert (=> b!1074166 (= lt!476349 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476348 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1074166 (arrayContainsKey!0 _keys!1163 lt!476348 #b00000000000000000000000000000000)))

(declare-fun lt!476350 () Unit!35208)

(assert (=> b!1074166 (= lt!476350 lt!476349)))

(declare-fun res!716300 () Bool)

(declare-datatypes ((SeekEntryResult!9887 0))(
  ( (MissingZero!9887 (index!41919 (_ BitVec 32))) (Found!9887 (index!41920 (_ BitVec 32))) (Intermediate!9887 (undefined!10699 Bool) (index!41921 (_ BitVec 32)) (x!96282 (_ BitVec 32))) (Undefined!9887) (MissingVacant!9887 (index!41922 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68858 (_ BitVec 32)) SeekEntryResult!9887)

(assert (=> b!1074166 (= res!716300 (= (seekEntryOrOpen!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9887 #b00000000000000000000000000000000)))))

(assert (=> b!1074166 (=> (not res!716300) (not e!613767))))

(declare-fun b!1074167 () Bool)

(declare-fun e!613766 () Bool)

(assert (=> b!1074167 (= e!613766 e!613768)))

(declare-fun c!107838 () Bool)

(assert (=> b!1074167 (= c!107838 (validKeyInArray!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074168 () Bool)

(declare-fun call!45343 () Bool)

(assert (=> b!1074168 (= e!613768 call!45343)))

(declare-fun b!1074169 () Bool)

(assert (=> b!1074169 (= e!613767 call!45343)))

(declare-fun bm!45340 () Bool)

(assert (=> bm!45340 (= call!45343 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun d!129341 () Bool)

(declare-fun res!716299 () Bool)

(assert (=> d!129341 (=> res!716299 e!613766)))

(assert (=> d!129341 (= res!716299 (bvsge #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(assert (=> d!129341 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!613766)))

(assert (= (and d!129341 (not res!716299)) b!1074167))

(assert (= (and b!1074167 c!107838) b!1074166))

(assert (= (and b!1074167 (not c!107838)) b!1074168))

(assert (= (and b!1074166 res!716300) b!1074169))

(assert (= (or b!1074169 b!1074168) bm!45340))

(assert (=> b!1074166 m!992511))

(declare-fun m!992567 () Bool)

(assert (=> b!1074166 m!992567))

(declare-fun m!992569 () Bool)

(assert (=> b!1074166 m!992569))

(assert (=> b!1074166 m!992511))

(declare-fun m!992571 () Bool)

(assert (=> b!1074166 m!992571))

(assert (=> b!1074167 m!992511))

(assert (=> b!1074167 m!992511))

(assert (=> b!1074167 m!992517))

(declare-fun m!992573 () Bool)

(assert (=> bm!45340 m!992573))

(assert (=> b!1074039 d!129341))

(declare-fun b!1074212 () Bool)

(declare-fun res!716322 () Bool)

(declare-fun e!613797 () Bool)

(assert (=> b!1074212 (=> (not res!716322) (not e!613797))))

(declare-fun e!613803 () Bool)

(assert (=> b!1074212 (= res!716322 e!613803)))

(declare-fun c!107852 () Bool)

(assert (=> b!1074212 (= c!107852 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074213 () Bool)

(declare-fun e!613799 () Bool)

(declare-fun lt!476408 () ListLongMap!14637)

(assert (=> b!1074213 (= e!613799 (= (apply!928 lt!476408 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1074214 () Bool)

(declare-fun e!613801 () Bool)

(declare-fun e!613804 () Bool)

(assert (=> b!1074214 (= e!613801 e!613804)))

(declare-fun res!716319 () Bool)

(assert (=> b!1074214 (=> (not res!716319) (not e!613804))))

(assert (=> b!1074214 (= res!716319 (contains!6304 lt!476408 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074214 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun b!1074215 () Bool)

(declare-fun e!613806 () Bool)

(declare-fun call!45361 () Bool)

(assert (=> b!1074215 (= e!613806 (not call!45361))))

(declare-fun b!1074216 () Bool)

(declare-fun e!613796 () Bool)

(assert (=> b!1074216 (= e!613796 (validKeyInArray!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074217 () Bool)

(declare-fun c!107856 () Bool)

(assert (=> b!1074217 (= c!107856 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!613795 () ListLongMap!14637)

(declare-fun e!613800 () ListLongMap!14637)

(assert (=> b!1074217 (= e!613795 e!613800)))

(declare-fun b!1074218 () Bool)

(declare-fun e!613802 () ListLongMap!14637)

(assert (=> b!1074218 (= e!613802 e!613795)))

(declare-fun c!107854 () Bool)

(assert (=> b!1074218 (= c!107854 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45355 () Bool)

(declare-fun call!45364 () ListLongMap!14637)

(declare-fun call!45359 () ListLongMap!14637)

(assert (=> bm!45355 (= call!45364 call!45359)))

(declare-fun c!107855 () Bool)

(declare-fun bm!45356 () Bool)

(declare-fun call!45362 () ListLongMap!14637)

(declare-fun call!45358 () ListLongMap!14637)

(declare-fun call!45363 () ListLongMap!14637)

(assert (=> bm!45356 (= call!45359 (+!3240 (ite c!107855 call!45358 (ite c!107854 call!45362 call!45363)) (ite (or c!107855 c!107854) (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1074219 () Bool)

(declare-fun e!613807 () Unit!35208)

(declare-fun Unit!35214 () Unit!35208)

(assert (=> b!1074219 (= e!613807 Unit!35214)))

(declare-fun b!1074220 () Bool)

(assert (=> b!1074220 (= e!613797 e!613806)))

(declare-fun c!107851 () Bool)

(assert (=> b!1074220 (= c!107851 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074221 () Bool)

(declare-fun res!716326 () Bool)

(assert (=> b!1074221 (=> (not res!716326) (not e!613797))))

(assert (=> b!1074221 (= res!716326 e!613801)))

(declare-fun res!716323 () Bool)

(assert (=> b!1074221 (=> res!716323 e!613801)))

(declare-fun e!613798 () Bool)

(assert (=> b!1074221 (= res!716323 (not e!613798))))

(declare-fun res!716320 () Bool)

(assert (=> b!1074221 (=> (not res!716320) (not e!613798))))

(assert (=> b!1074221 (= res!716320 (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun b!1074222 () Bool)

(declare-fun e!613805 () Bool)

(assert (=> b!1074222 (= e!613806 e!613805)))

(declare-fun res!716324 () Bool)

(assert (=> b!1074222 (= res!716324 call!45361)))

(assert (=> b!1074222 (=> (not res!716324) (not e!613805))))

(declare-fun d!129343 () Bool)

(assert (=> d!129343 e!613797))

(declare-fun res!716321 () Bool)

(assert (=> d!129343 (=> (not res!716321) (not e!613797))))

(assert (=> d!129343 (= res!716321 (or (bvsge #b00000000000000000000000000000000 (size!33658 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))))

(declare-fun lt!476395 () ListLongMap!14637)

(assert (=> d!129343 (= lt!476408 lt!476395)))

(declare-fun lt!476415 () Unit!35208)

(assert (=> d!129343 (= lt!476415 e!613807)))

(declare-fun c!107853 () Bool)

(assert (=> d!129343 (= c!107853 e!613796)))

(declare-fun res!716327 () Bool)

(assert (=> d!129343 (=> (not res!716327) (not e!613796))))

(assert (=> d!129343 (= res!716327 (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(assert (=> d!129343 (= lt!476395 e!613802)))

(assert (=> d!129343 (= c!107855 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129343 (validMask!0 mask!1515)))

(assert (=> d!129343 (= (getCurrentListMap!4107 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476408)))

(declare-fun bm!45357 () Bool)

(assert (=> bm!45357 (= call!45362 call!45358)))

(declare-fun b!1074223 () Bool)

(assert (=> b!1074223 (= e!613805 (= (apply!928 lt!476408 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45358 () Bool)

(declare-fun call!45360 () Bool)

(assert (=> bm!45358 (= call!45360 (contains!6304 lt!476408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074224 () Bool)

(assert (=> b!1074224 (= e!613800 call!45364)))

(declare-fun b!1074225 () Bool)

(assert (=> b!1074225 (= e!613804 (= (apply!928 lt!476408 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)) (get!17216 (select (arr!33119 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074225 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33657 _values!955)))))

(assert (=> b!1074225 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun bm!45359 () Bool)

(assert (=> bm!45359 (= call!45361 (contains!6304 lt!476408 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45360 () Bool)

(assert (=> bm!45360 (= call!45358 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074226 () Bool)

(assert (=> b!1074226 (= e!613798 (validKeyInArray!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074227 () Bool)

(declare-fun lt!476412 () Unit!35208)

(assert (=> b!1074227 (= e!613807 lt!476412)))

(declare-fun lt!476399 () ListLongMap!14637)

(assert (=> b!1074227 (= lt!476399 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476398 () (_ BitVec 64))

(assert (=> b!1074227 (= lt!476398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476413 () (_ BitVec 64))

(assert (=> b!1074227 (= lt!476413 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476411 () Unit!35208)

(declare-fun addStillContains!641 (ListLongMap!14637 (_ BitVec 64) V!39777 (_ BitVec 64)) Unit!35208)

(assert (=> b!1074227 (= lt!476411 (addStillContains!641 lt!476399 lt!476398 zeroValueBefore!47 lt!476413))))

(assert (=> b!1074227 (contains!6304 (+!3240 lt!476399 (tuple2!16669 lt!476398 zeroValueBefore!47)) lt!476413)))

(declare-fun lt!476400 () Unit!35208)

(assert (=> b!1074227 (= lt!476400 lt!476411)))

(declare-fun lt!476406 () ListLongMap!14637)

(assert (=> b!1074227 (= lt!476406 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476403 () (_ BitVec 64))

(assert (=> b!1074227 (= lt!476403 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476414 () (_ BitVec 64))

(assert (=> b!1074227 (= lt!476414 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476404 () Unit!35208)

(declare-fun addApplyDifferent!497 (ListLongMap!14637 (_ BitVec 64) V!39777 (_ BitVec 64)) Unit!35208)

(assert (=> b!1074227 (= lt!476404 (addApplyDifferent!497 lt!476406 lt!476403 minValue!907 lt!476414))))

(assert (=> b!1074227 (= (apply!928 (+!3240 lt!476406 (tuple2!16669 lt!476403 minValue!907)) lt!476414) (apply!928 lt!476406 lt!476414))))

(declare-fun lt!476402 () Unit!35208)

(assert (=> b!1074227 (= lt!476402 lt!476404)))

(declare-fun lt!476410 () ListLongMap!14637)

(assert (=> b!1074227 (= lt!476410 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476407 () (_ BitVec 64))

(assert (=> b!1074227 (= lt!476407 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476397 () (_ BitVec 64))

(assert (=> b!1074227 (= lt!476397 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476416 () Unit!35208)

(assert (=> b!1074227 (= lt!476416 (addApplyDifferent!497 lt!476410 lt!476407 zeroValueBefore!47 lt!476397))))

(assert (=> b!1074227 (= (apply!928 (+!3240 lt!476410 (tuple2!16669 lt!476407 zeroValueBefore!47)) lt!476397) (apply!928 lt!476410 lt!476397))))

(declare-fun lt!476409 () Unit!35208)

(assert (=> b!1074227 (= lt!476409 lt!476416)))

(declare-fun lt!476401 () ListLongMap!14637)

(assert (=> b!1074227 (= lt!476401 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476396 () (_ BitVec 64))

(assert (=> b!1074227 (= lt!476396 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476405 () (_ BitVec 64))

(assert (=> b!1074227 (= lt!476405 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074227 (= lt!476412 (addApplyDifferent!497 lt!476401 lt!476396 minValue!907 lt!476405))))

(assert (=> b!1074227 (= (apply!928 (+!3240 lt!476401 (tuple2!16669 lt!476396 minValue!907)) lt!476405) (apply!928 lt!476401 lt!476405))))

(declare-fun bm!45361 () Bool)

(assert (=> bm!45361 (= call!45363 call!45362)))

(declare-fun b!1074228 () Bool)

(assert (=> b!1074228 (= e!613802 (+!3240 call!45359 (tuple2!16669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1074229 () Bool)

(assert (=> b!1074229 (= e!613803 (not call!45360))))

(declare-fun b!1074230 () Bool)

(assert (=> b!1074230 (= e!613803 e!613799)))

(declare-fun res!716325 () Bool)

(assert (=> b!1074230 (= res!716325 call!45360)))

(assert (=> b!1074230 (=> (not res!716325) (not e!613799))))

(declare-fun b!1074231 () Bool)

(assert (=> b!1074231 (= e!613800 call!45363)))

(declare-fun b!1074232 () Bool)

(assert (=> b!1074232 (= e!613795 call!45364)))

(assert (= (and d!129343 c!107855) b!1074228))

(assert (= (and d!129343 (not c!107855)) b!1074218))

(assert (= (and b!1074218 c!107854) b!1074232))

(assert (= (and b!1074218 (not c!107854)) b!1074217))

(assert (= (and b!1074217 c!107856) b!1074224))

(assert (= (and b!1074217 (not c!107856)) b!1074231))

(assert (= (or b!1074224 b!1074231) bm!45361))

(assert (= (or b!1074232 bm!45361) bm!45357))

(assert (= (or b!1074232 b!1074224) bm!45355))

(assert (= (or b!1074228 bm!45357) bm!45360))

(assert (= (or b!1074228 bm!45355) bm!45356))

(assert (= (and d!129343 res!716327) b!1074216))

(assert (= (and d!129343 c!107853) b!1074227))

(assert (= (and d!129343 (not c!107853)) b!1074219))

(assert (= (and d!129343 res!716321) b!1074221))

(assert (= (and b!1074221 res!716320) b!1074226))

(assert (= (and b!1074221 (not res!716323)) b!1074214))

(assert (= (and b!1074214 res!716319) b!1074225))

(assert (= (and b!1074221 res!716326) b!1074212))

(assert (= (and b!1074212 c!107852) b!1074230))

(assert (= (and b!1074212 (not c!107852)) b!1074229))

(assert (= (and b!1074230 res!716325) b!1074213))

(assert (= (or b!1074230 b!1074229) bm!45358))

(assert (= (and b!1074212 res!716322) b!1074220))

(assert (= (and b!1074220 c!107851) b!1074222))

(assert (= (and b!1074220 (not c!107851)) b!1074215))

(assert (= (and b!1074222 res!716324) b!1074223))

(assert (= (or b!1074222 b!1074215) bm!45359))

(declare-fun b_lambda!16771 () Bool)

(assert (=> (not b_lambda!16771) (not b!1074225)))

(assert (=> b!1074225 t!32533))

(declare-fun b_and!35043 () Bool)

(assert (= b_and!35041 (and (=> t!32533 result!14795) b_and!35043)))

(assert (=> bm!45360 m!992461))

(assert (=> d!129343 m!992441))

(declare-fun m!992575 () Bool)

(assert (=> b!1074228 m!992575))

(declare-fun m!992577 () Bool)

(assert (=> b!1074227 m!992577))

(declare-fun m!992579 () Bool)

(assert (=> b!1074227 m!992579))

(declare-fun m!992581 () Bool)

(assert (=> b!1074227 m!992581))

(declare-fun m!992583 () Bool)

(assert (=> b!1074227 m!992583))

(declare-fun m!992585 () Bool)

(assert (=> b!1074227 m!992585))

(declare-fun m!992587 () Bool)

(assert (=> b!1074227 m!992587))

(declare-fun m!992589 () Bool)

(assert (=> b!1074227 m!992589))

(declare-fun m!992591 () Bool)

(assert (=> b!1074227 m!992591))

(assert (=> b!1074227 m!992585))

(declare-fun m!992593 () Bool)

(assert (=> b!1074227 m!992593))

(assert (=> b!1074227 m!992587))

(declare-fun m!992595 () Bool)

(assert (=> b!1074227 m!992595))

(declare-fun m!992597 () Bool)

(assert (=> b!1074227 m!992597))

(assert (=> b!1074227 m!992461))

(assert (=> b!1074227 m!992579))

(declare-fun m!992599 () Bool)

(assert (=> b!1074227 m!992599))

(declare-fun m!992601 () Bool)

(assert (=> b!1074227 m!992601))

(assert (=> b!1074227 m!992601))

(declare-fun m!992603 () Bool)

(assert (=> b!1074227 m!992603))

(declare-fun m!992605 () Bool)

(assert (=> b!1074227 m!992605))

(assert (=> b!1074227 m!992511))

(assert (=> b!1074226 m!992511))

(assert (=> b!1074226 m!992511))

(assert (=> b!1074226 m!992517))

(declare-fun m!992607 () Bool)

(assert (=> bm!45359 m!992607))

(assert (=> b!1074225 m!992527))

(assert (=> b!1074225 m!992529))

(assert (=> b!1074225 m!992531))

(assert (=> b!1074225 m!992529))

(assert (=> b!1074225 m!992527))

(assert (=> b!1074225 m!992511))

(declare-fun m!992609 () Bool)

(assert (=> b!1074225 m!992609))

(assert (=> b!1074225 m!992511))

(declare-fun m!992611 () Bool)

(assert (=> b!1074213 m!992611))

(declare-fun m!992613 () Bool)

(assert (=> bm!45356 m!992613))

(assert (=> b!1074214 m!992511))

(assert (=> b!1074214 m!992511))

(declare-fun m!992615 () Bool)

(assert (=> b!1074214 m!992615))

(declare-fun m!992617 () Bool)

(assert (=> b!1074223 m!992617))

(assert (=> b!1074216 m!992511))

(assert (=> b!1074216 m!992511))

(assert (=> b!1074216 m!992517))

(declare-fun m!992619 () Bool)

(assert (=> bm!45358 m!992619))

(assert (=> b!1074037 d!129343))

(declare-fun d!129345 () Bool)

(declare-fun e!613810 () Bool)

(assert (=> d!129345 e!613810))

(declare-fun res!716333 () Bool)

(assert (=> d!129345 (=> (not res!716333) (not e!613810))))

(declare-fun lt!476427 () ListLongMap!14637)

(assert (=> d!129345 (= res!716333 (contains!6304 lt!476427 (_1!8345 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!476426 () List!23193)

(assert (=> d!129345 (= lt!476427 (ListLongMap!14638 lt!476426))))

(declare-fun lt!476428 () Unit!35208)

(declare-fun lt!476425 () Unit!35208)

(assert (=> d!129345 (= lt!476428 lt!476425)))

(declare-datatypes ((Option!660 0))(
  ( (Some!659 (v!15663 V!39777)) (None!658) )
))
(declare-fun getValueByKey!609 (List!23193 (_ BitVec 64)) Option!660)

(assert (=> d!129345 (= (getValueByKey!609 lt!476426 (_1!8345 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!659 (_2!8345 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!287 (List!23193 (_ BitVec 64) V!39777) Unit!35208)

(assert (=> d!129345 (= lt!476425 (lemmaContainsTupThenGetReturnValue!287 lt!476426 (_1!8345 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8345 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!380 (List!23193 (_ BitVec 64) V!39777) List!23193)

(assert (=> d!129345 (= lt!476426 (insertStrictlySorted!380 (toList!7334 lt!476285) (_1!8345 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8345 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129345 (= (+!3240 lt!476285 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!476427)))

(declare-fun b!1074237 () Bool)

(declare-fun res!716332 () Bool)

(assert (=> b!1074237 (=> (not res!716332) (not e!613810))))

(assert (=> b!1074237 (= res!716332 (= (getValueByKey!609 (toList!7334 lt!476427) (_1!8345 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!659 (_2!8345 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1074238 () Bool)

(declare-fun contains!6305 (List!23193 tuple2!16668) Bool)

(assert (=> b!1074238 (= e!613810 (contains!6305 (toList!7334 lt!476427) (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129345 res!716333) b!1074237))

(assert (= (and b!1074237 res!716332) b!1074238))

(declare-fun m!992621 () Bool)

(assert (=> d!129345 m!992621))

(declare-fun m!992623 () Bool)

(assert (=> d!129345 m!992623))

(declare-fun m!992625 () Bool)

(assert (=> d!129345 m!992625))

(declare-fun m!992627 () Bool)

(assert (=> d!129345 m!992627))

(declare-fun m!992629 () Bool)

(assert (=> b!1074237 m!992629))

(declare-fun m!992631 () Bool)

(assert (=> b!1074238 m!992631))

(assert (=> b!1074037 d!129345))

(declare-fun b!1074239 () Bool)

(declare-fun res!716337 () Bool)

(declare-fun e!613813 () Bool)

(assert (=> b!1074239 (=> (not res!716337) (not e!613813))))

(declare-fun e!613819 () Bool)

(assert (=> b!1074239 (= res!716337 e!613819)))

(declare-fun c!107858 () Bool)

(assert (=> b!1074239 (= c!107858 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074240 () Bool)

(declare-fun e!613815 () Bool)

(declare-fun lt!476442 () ListLongMap!14637)

(assert (=> b!1074240 (= e!613815 (= (apply!928 lt!476442 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1074241 () Bool)

(declare-fun e!613817 () Bool)

(declare-fun e!613820 () Bool)

(assert (=> b!1074241 (= e!613817 e!613820)))

(declare-fun res!716334 () Bool)

(assert (=> b!1074241 (=> (not res!716334) (not e!613820))))

(assert (=> b!1074241 (= res!716334 (contains!6304 lt!476442 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074241 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun b!1074242 () Bool)

(declare-fun e!613822 () Bool)

(declare-fun call!45368 () Bool)

(assert (=> b!1074242 (= e!613822 (not call!45368))))

(declare-fun b!1074243 () Bool)

(declare-fun e!613812 () Bool)

(assert (=> b!1074243 (= e!613812 (validKeyInArray!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074244 () Bool)

(declare-fun c!107862 () Bool)

(assert (=> b!1074244 (= c!107862 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!613811 () ListLongMap!14637)

(declare-fun e!613816 () ListLongMap!14637)

(assert (=> b!1074244 (= e!613811 e!613816)))

(declare-fun b!1074245 () Bool)

(declare-fun e!613818 () ListLongMap!14637)

(assert (=> b!1074245 (= e!613818 e!613811)))

(declare-fun c!107860 () Bool)

(assert (=> b!1074245 (= c!107860 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45362 () Bool)

(declare-fun call!45371 () ListLongMap!14637)

(declare-fun call!45366 () ListLongMap!14637)

(assert (=> bm!45362 (= call!45371 call!45366)))

(declare-fun call!45365 () ListLongMap!14637)

(declare-fun bm!45363 () Bool)

(declare-fun c!107861 () Bool)

(declare-fun call!45369 () ListLongMap!14637)

(declare-fun call!45370 () ListLongMap!14637)

(assert (=> bm!45363 (= call!45366 (+!3240 (ite c!107861 call!45365 (ite c!107860 call!45369 call!45370)) (ite (or c!107861 c!107860) (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1074246 () Bool)

(declare-fun e!613823 () Unit!35208)

(declare-fun Unit!35215 () Unit!35208)

(assert (=> b!1074246 (= e!613823 Unit!35215)))

(declare-fun b!1074247 () Bool)

(assert (=> b!1074247 (= e!613813 e!613822)))

(declare-fun c!107857 () Bool)

(assert (=> b!1074247 (= c!107857 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1074248 () Bool)

(declare-fun res!716341 () Bool)

(assert (=> b!1074248 (=> (not res!716341) (not e!613813))))

(assert (=> b!1074248 (= res!716341 e!613817)))

(declare-fun res!716338 () Bool)

(assert (=> b!1074248 (=> res!716338 e!613817)))

(declare-fun e!613814 () Bool)

(assert (=> b!1074248 (= res!716338 (not e!613814))))

(declare-fun res!716335 () Bool)

(assert (=> b!1074248 (=> (not res!716335) (not e!613814))))

(assert (=> b!1074248 (= res!716335 (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun b!1074249 () Bool)

(declare-fun e!613821 () Bool)

(assert (=> b!1074249 (= e!613822 e!613821)))

(declare-fun res!716339 () Bool)

(assert (=> b!1074249 (= res!716339 call!45368)))

(assert (=> b!1074249 (=> (not res!716339) (not e!613821))))

(declare-fun d!129347 () Bool)

(assert (=> d!129347 e!613813))

(declare-fun res!716336 () Bool)

(assert (=> d!129347 (=> (not res!716336) (not e!613813))))

(assert (=> d!129347 (= res!716336 (or (bvsge #b00000000000000000000000000000000 (size!33658 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))))

(declare-fun lt!476429 () ListLongMap!14637)

(assert (=> d!129347 (= lt!476442 lt!476429)))

(declare-fun lt!476449 () Unit!35208)

(assert (=> d!129347 (= lt!476449 e!613823)))

(declare-fun c!107859 () Bool)

(assert (=> d!129347 (= c!107859 e!613812)))

(declare-fun res!716342 () Bool)

(assert (=> d!129347 (=> (not res!716342) (not e!613812))))

(assert (=> d!129347 (= res!716342 (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(assert (=> d!129347 (= lt!476429 e!613818)))

(assert (=> d!129347 (= c!107861 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129347 (validMask!0 mask!1515)))

(assert (=> d!129347 (= (getCurrentListMap!4107 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476442)))

(declare-fun bm!45364 () Bool)

(assert (=> bm!45364 (= call!45369 call!45365)))

(declare-fun b!1074250 () Bool)

(assert (=> b!1074250 (= e!613821 (= (apply!928 lt!476442 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45365 () Bool)

(declare-fun call!45367 () Bool)

(assert (=> bm!45365 (= call!45367 (contains!6304 lt!476442 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1074251 () Bool)

(assert (=> b!1074251 (= e!613816 call!45371)))

(declare-fun b!1074252 () Bool)

(assert (=> b!1074252 (= e!613820 (= (apply!928 lt!476442 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)) (get!17216 (select (arr!33119 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1074252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33657 _values!955)))))

(assert (=> b!1074252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33658 _keys!1163)))))

(declare-fun bm!45366 () Bool)

(assert (=> bm!45366 (= call!45368 (contains!6304 lt!476442 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45367 () Bool)

(assert (=> bm!45367 (= call!45365 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074253 () Bool)

(assert (=> b!1074253 (= e!613814 (validKeyInArray!0 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074254 () Bool)

(declare-fun lt!476446 () Unit!35208)

(assert (=> b!1074254 (= e!613823 lt!476446)))

(declare-fun lt!476433 () ListLongMap!14637)

(assert (=> b!1074254 (= lt!476433 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476432 () (_ BitVec 64))

(assert (=> b!1074254 (= lt!476432 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476447 () (_ BitVec 64))

(assert (=> b!1074254 (= lt!476447 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476445 () Unit!35208)

(assert (=> b!1074254 (= lt!476445 (addStillContains!641 lt!476433 lt!476432 zeroValueAfter!47 lt!476447))))

(assert (=> b!1074254 (contains!6304 (+!3240 lt!476433 (tuple2!16669 lt!476432 zeroValueAfter!47)) lt!476447)))

(declare-fun lt!476434 () Unit!35208)

(assert (=> b!1074254 (= lt!476434 lt!476445)))

(declare-fun lt!476440 () ListLongMap!14637)

(assert (=> b!1074254 (= lt!476440 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476437 () (_ BitVec 64))

(assert (=> b!1074254 (= lt!476437 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476448 () (_ BitVec 64))

(assert (=> b!1074254 (= lt!476448 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476438 () Unit!35208)

(assert (=> b!1074254 (= lt!476438 (addApplyDifferent!497 lt!476440 lt!476437 minValue!907 lt!476448))))

(assert (=> b!1074254 (= (apply!928 (+!3240 lt!476440 (tuple2!16669 lt!476437 minValue!907)) lt!476448) (apply!928 lt!476440 lt!476448))))

(declare-fun lt!476436 () Unit!35208)

(assert (=> b!1074254 (= lt!476436 lt!476438)))

(declare-fun lt!476444 () ListLongMap!14637)

(assert (=> b!1074254 (= lt!476444 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476441 () (_ BitVec 64))

(assert (=> b!1074254 (= lt!476441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476431 () (_ BitVec 64))

(assert (=> b!1074254 (= lt!476431 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476450 () Unit!35208)

(assert (=> b!1074254 (= lt!476450 (addApplyDifferent!497 lt!476444 lt!476441 zeroValueAfter!47 lt!476431))))

(assert (=> b!1074254 (= (apply!928 (+!3240 lt!476444 (tuple2!16669 lt!476441 zeroValueAfter!47)) lt!476431) (apply!928 lt!476444 lt!476431))))

(declare-fun lt!476443 () Unit!35208)

(assert (=> b!1074254 (= lt!476443 lt!476450)))

(declare-fun lt!476435 () ListLongMap!14637)

(assert (=> b!1074254 (= lt!476435 (getCurrentListMapNoExtraKeys!3914 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476430 () (_ BitVec 64))

(assert (=> b!1074254 (= lt!476430 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476439 () (_ BitVec 64))

(assert (=> b!1074254 (= lt!476439 (select (arr!33120 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074254 (= lt!476446 (addApplyDifferent!497 lt!476435 lt!476430 minValue!907 lt!476439))))

(assert (=> b!1074254 (= (apply!928 (+!3240 lt!476435 (tuple2!16669 lt!476430 minValue!907)) lt!476439) (apply!928 lt!476435 lt!476439))))

(declare-fun bm!45368 () Bool)

(assert (=> bm!45368 (= call!45370 call!45369)))

(declare-fun b!1074255 () Bool)

(assert (=> b!1074255 (= e!613818 (+!3240 call!45366 (tuple2!16669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1074256 () Bool)

(assert (=> b!1074256 (= e!613819 (not call!45367))))

(declare-fun b!1074257 () Bool)

(assert (=> b!1074257 (= e!613819 e!613815)))

(declare-fun res!716340 () Bool)

(assert (=> b!1074257 (= res!716340 call!45367)))

(assert (=> b!1074257 (=> (not res!716340) (not e!613815))))

(declare-fun b!1074258 () Bool)

(assert (=> b!1074258 (= e!613816 call!45370)))

(declare-fun b!1074259 () Bool)

(assert (=> b!1074259 (= e!613811 call!45371)))

(assert (= (and d!129347 c!107861) b!1074255))

(assert (= (and d!129347 (not c!107861)) b!1074245))

(assert (= (and b!1074245 c!107860) b!1074259))

(assert (= (and b!1074245 (not c!107860)) b!1074244))

(assert (= (and b!1074244 c!107862) b!1074251))

(assert (= (and b!1074244 (not c!107862)) b!1074258))

(assert (= (or b!1074251 b!1074258) bm!45368))

(assert (= (or b!1074259 bm!45368) bm!45364))

(assert (= (or b!1074259 b!1074251) bm!45362))

(assert (= (or b!1074255 bm!45364) bm!45367))

(assert (= (or b!1074255 bm!45362) bm!45363))

(assert (= (and d!129347 res!716342) b!1074243))

(assert (= (and d!129347 c!107859) b!1074254))

(assert (= (and d!129347 (not c!107859)) b!1074246))

(assert (= (and d!129347 res!716336) b!1074248))

(assert (= (and b!1074248 res!716335) b!1074253))

(assert (= (and b!1074248 (not res!716338)) b!1074241))

(assert (= (and b!1074241 res!716334) b!1074252))

(assert (= (and b!1074248 res!716341) b!1074239))

(assert (= (and b!1074239 c!107858) b!1074257))

(assert (= (and b!1074239 (not c!107858)) b!1074256))

(assert (= (and b!1074257 res!716340) b!1074240))

(assert (= (or b!1074257 b!1074256) bm!45365))

(assert (= (and b!1074239 res!716337) b!1074247))

(assert (= (and b!1074247 c!107857) b!1074249))

(assert (= (and b!1074247 (not c!107857)) b!1074242))

(assert (= (and b!1074249 res!716339) b!1074250))

(assert (= (or b!1074249 b!1074242) bm!45366))

(declare-fun b_lambda!16773 () Bool)

(assert (=> (not b_lambda!16773) (not b!1074252)))

(assert (=> b!1074252 t!32533))

(declare-fun b_and!35045 () Bool)

(assert (= b_and!35043 (and (=> t!32533 result!14795) b_and!35045)))

(assert (=> bm!45367 m!992459))

(assert (=> d!129347 m!992441))

(declare-fun m!992633 () Bool)

(assert (=> b!1074255 m!992633))

(declare-fun m!992635 () Bool)

(assert (=> b!1074254 m!992635))

(declare-fun m!992637 () Bool)

(assert (=> b!1074254 m!992637))

(declare-fun m!992639 () Bool)

(assert (=> b!1074254 m!992639))

(declare-fun m!992641 () Bool)

(assert (=> b!1074254 m!992641))

(declare-fun m!992643 () Bool)

(assert (=> b!1074254 m!992643))

(declare-fun m!992645 () Bool)

(assert (=> b!1074254 m!992645))

(declare-fun m!992647 () Bool)

(assert (=> b!1074254 m!992647))

(declare-fun m!992649 () Bool)

(assert (=> b!1074254 m!992649))

(assert (=> b!1074254 m!992643))

(declare-fun m!992651 () Bool)

(assert (=> b!1074254 m!992651))

(assert (=> b!1074254 m!992645))

(declare-fun m!992653 () Bool)

(assert (=> b!1074254 m!992653))

(declare-fun m!992655 () Bool)

(assert (=> b!1074254 m!992655))

(assert (=> b!1074254 m!992459))

(assert (=> b!1074254 m!992637))

(declare-fun m!992657 () Bool)

(assert (=> b!1074254 m!992657))

(declare-fun m!992659 () Bool)

(assert (=> b!1074254 m!992659))

(assert (=> b!1074254 m!992659))

(declare-fun m!992661 () Bool)

(assert (=> b!1074254 m!992661))

(declare-fun m!992663 () Bool)

(assert (=> b!1074254 m!992663))

(assert (=> b!1074254 m!992511))

(assert (=> b!1074253 m!992511))

(assert (=> b!1074253 m!992511))

(assert (=> b!1074253 m!992517))

(declare-fun m!992665 () Bool)

(assert (=> bm!45366 m!992665))

(assert (=> b!1074252 m!992527))

(assert (=> b!1074252 m!992529))

(assert (=> b!1074252 m!992531))

(assert (=> b!1074252 m!992529))

(assert (=> b!1074252 m!992527))

(assert (=> b!1074252 m!992511))

(declare-fun m!992667 () Bool)

(assert (=> b!1074252 m!992667))

(assert (=> b!1074252 m!992511))

(declare-fun m!992669 () Bool)

(assert (=> b!1074240 m!992669))

(declare-fun m!992671 () Bool)

(assert (=> bm!45363 m!992671))

(assert (=> b!1074241 m!992511))

(assert (=> b!1074241 m!992511))

(declare-fun m!992673 () Bool)

(assert (=> b!1074241 m!992673))

(declare-fun m!992675 () Bool)

(assert (=> b!1074250 m!992675))

(assert (=> b!1074243 m!992511))

(assert (=> b!1074243 m!992511))

(assert (=> b!1074243 m!992517))

(declare-fun m!992677 () Bool)

(assert (=> bm!45365 m!992677))

(assert (=> b!1074037 d!129347))

(declare-fun d!129349 () Bool)

(assert (=> d!129349 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95012 d!129349))

(declare-fun d!129351 () Bool)

(assert (=> d!129351 (= (array_inv!25622 _values!955) (bvsge (size!33657 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95012 d!129351))

(declare-fun d!129353 () Bool)

(assert (=> d!129353 (= (array_inv!25623 _keys!1163) (bvsge (size!33658 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95012 d!129353))

(declare-fun b!1074267 () Bool)

(declare-fun e!613829 () Bool)

(assert (=> b!1074267 (= e!613829 tp_is_empty!25981)))

(declare-fun condMapEmpty!40702 () Bool)

(declare-fun mapDefault!40702 () ValueCell!12287)

(assert (=> mapNonEmpty!40693 (= condMapEmpty!40702 (= mapRest!40693 ((as const (Array (_ BitVec 32) ValueCell!12287)) mapDefault!40702)))))

(declare-fun mapRes!40702 () Bool)

(assert (=> mapNonEmpty!40693 (= tp!77986 (and e!613829 mapRes!40702))))

(declare-fun b!1074266 () Bool)

(declare-fun e!613828 () Bool)

(assert (=> b!1074266 (= e!613828 tp_is_empty!25981)))

(declare-fun mapNonEmpty!40702 () Bool)

(declare-fun tp!78002 () Bool)

(assert (=> mapNonEmpty!40702 (= mapRes!40702 (and tp!78002 e!613828))))

(declare-fun mapValue!40702 () ValueCell!12287)

(declare-fun mapRest!40702 () (Array (_ BitVec 32) ValueCell!12287))

(declare-fun mapKey!40702 () (_ BitVec 32))

(assert (=> mapNonEmpty!40702 (= mapRest!40693 (store mapRest!40702 mapKey!40702 mapValue!40702))))

(declare-fun mapIsEmpty!40702 () Bool)

(assert (=> mapIsEmpty!40702 mapRes!40702))

(assert (= (and mapNonEmpty!40693 condMapEmpty!40702) mapIsEmpty!40702))

(assert (= (and mapNonEmpty!40693 (not condMapEmpty!40702)) mapNonEmpty!40702))

(assert (= (and mapNonEmpty!40702 ((_ is ValueCellFull!12287) mapValue!40702)) b!1074266))

(assert (= (and mapNonEmpty!40693 ((_ is ValueCellFull!12287) mapDefault!40702)) b!1074267))

(declare-fun m!992679 () Bool)

(assert (=> mapNonEmpty!40702 m!992679))

(declare-fun b_lambda!16775 () Bool)

(assert (= b_lambda!16767 (or (and start!95012 b_free!22171) b_lambda!16775)))

(declare-fun b_lambda!16777 () Bool)

(assert (= b_lambda!16771 (or (and start!95012 b_free!22171) b_lambda!16777)))

(declare-fun b_lambda!16779 () Bool)

(assert (= b_lambda!16769 (or (and start!95012 b_free!22171) b_lambda!16779)))

(declare-fun b_lambda!16781 () Bool)

(assert (= b_lambda!16765 (or (and start!95012 b_free!22171) b_lambda!16781)))

(declare-fun b_lambda!16783 () Bool)

(assert (= b_lambda!16773 (or (and start!95012 b_free!22171) b_lambda!16783)))

(declare-fun b_lambda!16785 () Bool)

(assert (= b_lambda!16763 (or (and start!95012 b_free!22171) b_lambda!16785)))

(check-sat (not b_lambda!16775) (not b!1074105) (not bm!45359) (not bm!45360) (not b_lambda!16779) (not bm!45367) (not b!1074240) (not b!1074250) (not b!1074143) (not b!1074213) (not b!1074135) (not b!1074253) (not d!129337) (not b_next!22171) (not b_lambda!16781) (not b!1074223) (not bm!45363) (not mapNonEmpty!40702) (not b!1074237) (not b!1074254) (not b!1074155) tp_is_empty!25981 (not bm!45366) (not d!129343) (not b!1074167) (not b_lambda!16783) (not d!129339) (not d!129347) (not b!1074226) (not bm!45336) (not b!1074139) (not b!1074252) (not bm!45340) (not bm!45365) (not b_lambda!16785) (not bm!45333) (not b!1074141) (not b!1074241) (not b!1074243) (not b!1074225) (not b_lambda!16777) (not b!1074255) (not bm!45358) (not b!1074214) (not b!1074157) (not b!1074153) (not b!1074134) (not b!1074133) (not b!1074147) (not b!1074166) (not b!1074227) (not b!1074228) (not b!1074106) (not b!1074107) (not bm!45337) (not b!1074216) b_and!35045 (not b!1074152) (not b!1074138) (not d!129335) (not d!129345) (not b!1074154) (not b!1074149) (not bm!45356) (not b!1074238) (not b!1074148) (not b!1074140))
(check-sat b_and!35045 (not b_next!22171))
