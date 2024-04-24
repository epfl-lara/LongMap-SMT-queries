; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95254 () Bool)

(assert start!95254)

(declare-fun b_free!22171 () Bool)

(declare-fun b_next!22171 () Bool)

(assert (=> start!95254 (= b_free!22171 (not b_next!22171))))

(declare-fun tp!77987 () Bool)

(declare-fun b_and!35065 () Bool)

(assert (=> start!95254 (= tp!77987 b_and!35065)))

(declare-fun mapNonEmpty!40693 () Bool)

(declare-fun mapRes!40693 () Bool)

(declare-fun tp!77986 () Bool)

(declare-fun e!614631 () Bool)

(assert (=> mapNonEmpty!40693 (= mapRes!40693 (and tp!77986 e!614631))))

(declare-fun mapKey!40693 () (_ BitVec 32))

(declare-datatypes ((V!39777 0))(
  ( (V!39778 (val!13041 Int)) )
))
(declare-datatypes ((ValueCell!12287 0))(
  ( (ValueCellFull!12287 (v!15657 V!39777)) (EmptyCell!12287) )
))
(declare-fun mapValue!40693 () ValueCell!12287)

(declare-datatypes ((array!68971 0))(
  ( (array!68972 (arr!33170 (Array (_ BitVec 32) ValueCell!12287)) (size!33707 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68971)

(declare-fun mapRest!40693 () (Array (_ BitVec 32) ValueCell!12287))

(assert (=> mapNonEmpty!40693 (= (arr!33170 _values!955) (store mapRest!40693 mapKey!40693 mapValue!40693))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39777)

(declare-datatypes ((tuple2!16596 0))(
  ( (tuple2!16597 (_1!8309 (_ BitVec 64)) (_2!8309 V!39777)) )
))
(declare-datatypes ((List!23152 0))(
  ( (Nil!23149) (Cons!23148 (h!24366 tuple2!16596) (t!32487 List!23152)) )
))
(declare-datatypes ((ListLongMap!14573 0))(
  ( (ListLongMap!14574 (toList!7302 List!23152)) )
))
(declare-fun lt!476998 () ListLongMap!14573)

(declare-fun b!1075517 () Bool)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39777)

(declare-fun e!614629 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68973 0))(
  ( (array!68974 (arr!33171 (Array (_ BitVec 32) (_ BitVec 64))) (size!33708 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68973)

(declare-fun getCurrentListMap!4163 (array!68973 array!68971 (_ BitVec 32) (_ BitVec 32) V!39777 V!39777 (_ BitVec 32) Int) ListLongMap!14573)

(declare-fun +!3237 (ListLongMap!14573 tuple2!16596) ListLongMap!14573)

(assert (=> b!1075517 (= e!614629 (= (getCurrentListMap!4163 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3237 lt!476998 (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!477001 () ListLongMap!14573)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39777)

(assert (=> b!1075517 (= lt!477001 (getCurrentListMap!4163 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075518 () Bool)

(declare-fun res!716830 () Bool)

(declare-fun e!614630 () Bool)

(assert (=> b!1075518 (=> (not res!716830) (not e!614630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68973 (_ BitVec 32)) Bool)

(assert (=> b!1075518 (= res!716830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1075519 () Bool)

(declare-fun e!614628 () Bool)

(declare-fun tp_is_empty!25981 () Bool)

(assert (=> b!1075519 (= e!614628 tp_is_empty!25981)))

(declare-fun mapIsEmpty!40693 () Bool)

(assert (=> mapIsEmpty!40693 mapRes!40693))

(declare-fun b!1075521 () Bool)

(declare-fun e!614626 () Bool)

(assert (=> b!1075521 (= e!614626 (and e!614628 mapRes!40693))))

(declare-fun condMapEmpty!40693 () Bool)

(declare-fun mapDefault!40693 () ValueCell!12287)

(assert (=> b!1075521 (= condMapEmpty!40693 (= (arr!33170 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12287)) mapDefault!40693)))))

(declare-fun b!1075522 () Bool)

(declare-fun res!716827 () Bool)

(assert (=> b!1075522 (=> (not res!716827) (not e!614630))))

(assert (=> b!1075522 (= res!716827 (and (= (size!33707 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33708 _keys!1163) (size!33707 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!716828 () Bool)

(assert (=> start!95254 (=> (not res!716828) (not e!614630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95254 (= res!716828 (validMask!0 mask!1515))))

(assert (=> start!95254 e!614630))

(assert (=> start!95254 true))

(assert (=> start!95254 tp_is_empty!25981))

(declare-fun array_inv!25676 (array!68971) Bool)

(assert (=> start!95254 (and (array_inv!25676 _values!955) e!614626)))

(assert (=> start!95254 tp!77987))

(declare-fun array_inv!25677 (array!68973) Bool)

(assert (=> start!95254 (array_inv!25677 _keys!1163)))

(declare-fun b!1075520 () Bool)

(assert (=> b!1075520 (= e!614630 (not e!614629))))

(declare-fun res!716829 () Bool)

(assert (=> b!1075520 (=> res!716829 e!614629)))

(assert (=> b!1075520 (= res!716829 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!476999 () ListLongMap!14573)

(assert (=> b!1075520 (= lt!476998 lt!476999)))

(declare-datatypes ((Unit!35344 0))(
  ( (Unit!35345) )
))
(declare-fun lt!477000 () Unit!35344)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!879 (array!68973 array!68971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39777 V!39777 V!39777 V!39777 (_ BitVec 32) Int) Unit!35344)

(assert (=> b!1075520 (= lt!477000 (lemmaNoChangeToArrayThenSameMapNoExtras!879 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3899 (array!68973 array!68971 (_ BitVec 32) (_ BitVec 32) V!39777 V!39777 (_ BitVec 32) Int) ListLongMap!14573)

(assert (=> b!1075520 (= lt!476999 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075520 (= lt!476998 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075523 () Bool)

(declare-fun res!716826 () Bool)

(assert (=> b!1075523 (=> (not res!716826) (not e!614630))))

(declare-datatypes ((List!23153 0))(
  ( (Nil!23150) (Cons!23149 (h!24367 (_ BitVec 64)) (t!32488 List!23153)) )
))
(declare-fun arrayNoDuplicates!0 (array!68973 (_ BitVec 32) List!23153) Bool)

(assert (=> b!1075523 (= res!716826 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23150))))

(declare-fun b!1075524 () Bool)

(assert (=> b!1075524 (= e!614631 tp_is_empty!25981)))

(assert (= (and start!95254 res!716828) b!1075522))

(assert (= (and b!1075522 res!716827) b!1075518))

(assert (= (and b!1075518 res!716830) b!1075523))

(assert (= (and b!1075523 res!716826) b!1075520))

(assert (= (and b!1075520 (not res!716829)) b!1075517))

(assert (= (and b!1075521 condMapEmpty!40693) mapIsEmpty!40693))

(assert (= (and b!1075521 (not condMapEmpty!40693)) mapNonEmpty!40693))

(get-info :version)

(assert (= (and mapNonEmpty!40693 ((_ is ValueCellFull!12287) mapValue!40693)) b!1075524))

(assert (= (and b!1075521 ((_ is ValueCellFull!12287) mapDefault!40693)) b!1075519))

(assert (= start!95254 b!1075521))

(declare-fun m!994737 () Bool)

(assert (=> b!1075518 m!994737))

(declare-fun m!994739 () Bool)

(assert (=> start!95254 m!994739))

(declare-fun m!994741 () Bool)

(assert (=> start!95254 m!994741))

(declare-fun m!994743 () Bool)

(assert (=> start!95254 m!994743))

(declare-fun m!994745 () Bool)

(assert (=> b!1075520 m!994745))

(declare-fun m!994747 () Bool)

(assert (=> b!1075520 m!994747))

(declare-fun m!994749 () Bool)

(assert (=> b!1075520 m!994749))

(declare-fun m!994751 () Bool)

(assert (=> b!1075523 m!994751))

(declare-fun m!994753 () Bool)

(assert (=> b!1075517 m!994753))

(declare-fun m!994755 () Bool)

(assert (=> b!1075517 m!994755))

(declare-fun m!994757 () Bool)

(assert (=> b!1075517 m!994757))

(declare-fun m!994759 () Bool)

(assert (=> mapNonEmpty!40693 m!994759))

(check-sat (not b!1075518) (not mapNonEmpty!40693) (not b!1075520) (not b_next!22171) tp_is_empty!25981 (not start!95254) (not b!1075523) (not b!1075517) b_and!35065)
(check-sat b_and!35065 (not b_next!22171))
(get-model)

(declare-fun d!129953 () Bool)

(assert (=> d!129953 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95254 d!129953))

(declare-fun d!129955 () Bool)

(assert (=> d!129955 (= (array_inv!25676 _values!955) (bvsge (size!33707 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95254 d!129955))

(declare-fun d!129957 () Bool)

(assert (=> d!129957 (= (array_inv!25677 _keys!1163) (bvsge (size!33708 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95254 d!129957))

(declare-fun d!129959 () Bool)

(assert (=> d!129959 (= (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477028 () Unit!35344)

(declare-fun choose!1754 (array!68973 array!68971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39777 V!39777 V!39777 V!39777 (_ BitVec 32) Int) Unit!35344)

(assert (=> d!129959 (= lt!477028 (choose!1754 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129959 (validMask!0 mask!1515)))

(assert (=> d!129959 (= (lemmaNoChangeToArrayThenSameMapNoExtras!879 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477028)))

(declare-fun bs!31681 () Bool)

(assert (= bs!31681 d!129959))

(assert (=> bs!31681 m!994749))

(assert (=> bs!31681 m!994747))

(declare-fun m!994809 () Bool)

(assert (=> bs!31681 m!994809))

(assert (=> bs!31681 m!994739))

(assert (=> b!1075520 d!129959))

(declare-fun b!1075597 () Bool)

(declare-fun e!614682 () Bool)

(declare-fun e!614685 () Bool)

(assert (=> b!1075597 (= e!614682 e!614685)))

(assert (=> b!1075597 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(declare-fun res!716872 () Bool)

(declare-fun lt!477043 () ListLongMap!14573)

(declare-fun contains!6359 (ListLongMap!14573 (_ BitVec 64)) Bool)

(assert (=> b!1075597 (= res!716872 (contains!6359 lt!477043 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075597 (=> (not res!716872) (not e!614685))))

(declare-fun b!1075598 () Bool)

(declare-fun e!614683 () Bool)

(assert (=> b!1075598 (= e!614683 e!614682)))

(declare-fun c!108276 () Bool)

(declare-fun e!614686 () Bool)

(assert (=> b!1075598 (= c!108276 e!614686)))

(declare-fun res!716869 () Bool)

(assert (=> b!1075598 (=> (not res!716869) (not e!614686))))

(assert (=> b!1075598 (= res!716869 (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(declare-fun b!1075599 () Bool)

(declare-fun e!614684 () ListLongMap!14573)

(declare-fun e!614688 () ListLongMap!14573)

(assert (=> b!1075599 (= e!614684 e!614688)))

(declare-fun c!108274 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075599 (= c!108274 (validKeyInArray!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075600 () Bool)

(declare-fun lt!477047 () Unit!35344)

(declare-fun lt!477044 () Unit!35344)

(assert (=> b!1075600 (= lt!477047 lt!477044)))

(declare-fun lt!477045 () (_ BitVec 64))

(declare-fun lt!477046 () ListLongMap!14573)

(declare-fun lt!477048 () (_ BitVec 64))

(declare-fun lt!477049 () V!39777)

(assert (=> b!1075600 (not (contains!6359 (+!3237 lt!477046 (tuple2!16597 lt!477048 lt!477049)) lt!477045))))

(declare-fun addStillNotContains!265 (ListLongMap!14573 (_ BitVec 64) V!39777 (_ BitVec 64)) Unit!35344)

(assert (=> b!1075600 (= lt!477044 (addStillNotContains!265 lt!477046 lt!477048 lt!477049 lt!477045))))

(assert (=> b!1075600 (= lt!477045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17250 (ValueCell!12287 V!39777) V!39777)

(declare-fun dynLambda!2059 (Int (_ BitVec 64)) V!39777)

(assert (=> b!1075600 (= lt!477049 (get!17250 (select (arr!33170 _values!955) #b00000000000000000000000000000000) (dynLambda!2059 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075600 (= lt!477048 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45426 () ListLongMap!14573)

(assert (=> b!1075600 (= lt!477046 call!45426)))

(assert (=> b!1075600 (= e!614688 (+!3237 call!45426 (tuple2!16597 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000) (get!17250 (select (arr!33170 _values!955) #b00000000000000000000000000000000) (dynLambda!2059 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075601 () Bool)

(assert (=> b!1075601 (= e!614686 (validKeyInArray!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075601 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075602 () Bool)

(declare-fun res!716870 () Bool)

(assert (=> b!1075602 (=> (not res!716870) (not e!614683))))

(assert (=> b!1075602 (= res!716870 (not (contains!6359 lt!477043 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!45423 () Bool)

(assert (=> bm!45423 (= call!45426 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075603 () Bool)

(declare-fun e!614687 () Bool)

(assert (=> b!1075603 (= e!614687 (= lt!477043 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075604 () Bool)

(assert (=> b!1075604 (= e!614682 e!614687)))

(declare-fun c!108277 () Bool)

(assert (=> b!1075604 (= c!108277 (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(declare-fun b!1075605 () Bool)

(assert (=> b!1075605 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(assert (=> b!1075605 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33707 _values!955)))))

(declare-fun apply!944 (ListLongMap!14573 (_ BitVec 64)) V!39777)

(assert (=> b!1075605 (= e!614685 (= (apply!944 lt!477043 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)) (get!17250 (select (arr!33170 _values!955) #b00000000000000000000000000000000) (dynLambda!2059 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075606 () Bool)

(declare-fun isEmpty!957 (ListLongMap!14573) Bool)

(assert (=> b!1075606 (= e!614687 (isEmpty!957 lt!477043))))

(declare-fun b!1075607 () Bool)

(assert (=> b!1075607 (= e!614684 (ListLongMap!14574 Nil!23149))))

(declare-fun d!129961 () Bool)

(assert (=> d!129961 e!614683))

(declare-fun res!716871 () Bool)

(assert (=> d!129961 (=> (not res!716871) (not e!614683))))

(assert (=> d!129961 (= res!716871 (not (contains!6359 lt!477043 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129961 (= lt!477043 e!614684)))

(declare-fun c!108275 () Bool)

(assert (=> d!129961 (= c!108275 (bvsge #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(assert (=> d!129961 (validMask!0 mask!1515)))

(assert (=> d!129961 (= (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477043)))

(declare-fun b!1075608 () Bool)

(assert (=> b!1075608 (= e!614688 call!45426)))

(assert (= (and d!129961 c!108275) b!1075607))

(assert (= (and d!129961 (not c!108275)) b!1075599))

(assert (= (and b!1075599 c!108274) b!1075600))

(assert (= (and b!1075599 (not c!108274)) b!1075608))

(assert (= (or b!1075600 b!1075608) bm!45423))

(assert (= (and d!129961 res!716871) b!1075602))

(assert (= (and b!1075602 res!716870) b!1075598))

(assert (= (and b!1075598 res!716869) b!1075601))

(assert (= (and b!1075598 c!108276) b!1075597))

(assert (= (and b!1075598 (not c!108276)) b!1075604))

(assert (= (and b!1075597 res!716872) b!1075605))

(assert (= (and b!1075604 c!108277) b!1075603))

(assert (= (and b!1075604 (not c!108277)) b!1075606))

(declare-fun b_lambda!16795 () Bool)

(assert (=> (not b_lambda!16795) (not b!1075600)))

(declare-fun t!32490 () Bool)

(declare-fun tb!7157 () Bool)

(assert (=> (and start!95254 (= defaultEntry!963 defaultEntry!963) t!32490) tb!7157))

(declare-fun result!14795 () Bool)

(assert (=> tb!7157 (= result!14795 tp_is_empty!25981)))

(assert (=> b!1075600 t!32490))

(declare-fun b_and!35071 () Bool)

(assert (= b_and!35065 (and (=> t!32490 result!14795) b_and!35071)))

(declare-fun b_lambda!16797 () Bool)

(assert (=> (not b_lambda!16797) (not b!1075605)))

(assert (=> b!1075605 t!32490))

(declare-fun b_and!35073 () Bool)

(assert (= b_and!35071 (and (=> t!32490 result!14795) b_and!35073)))

(declare-fun m!994811 () Bool)

(assert (=> d!129961 m!994811))

(assert (=> d!129961 m!994739))

(declare-fun m!994813 () Bool)

(assert (=> b!1075597 m!994813))

(assert (=> b!1075597 m!994813))

(declare-fun m!994815 () Bool)

(assert (=> b!1075597 m!994815))

(assert (=> b!1075599 m!994813))

(assert (=> b!1075599 m!994813))

(declare-fun m!994817 () Bool)

(assert (=> b!1075599 m!994817))

(declare-fun m!994819 () Bool)

(assert (=> b!1075602 m!994819))

(assert (=> b!1075605 m!994813))

(declare-fun m!994821 () Bool)

(assert (=> b!1075605 m!994821))

(assert (=> b!1075605 m!994813))

(declare-fun m!994823 () Bool)

(assert (=> b!1075605 m!994823))

(declare-fun m!994825 () Bool)

(assert (=> b!1075605 m!994825))

(declare-fun m!994827 () Bool)

(assert (=> b!1075605 m!994827))

(assert (=> b!1075605 m!994823))

(assert (=> b!1075605 m!994825))

(assert (=> b!1075601 m!994813))

(assert (=> b!1075601 m!994813))

(assert (=> b!1075601 m!994817))

(declare-fun m!994829 () Bool)

(assert (=> b!1075600 m!994829))

(declare-fun m!994831 () Bool)

(assert (=> b!1075600 m!994831))

(assert (=> b!1075600 m!994831))

(declare-fun m!994833 () Bool)

(assert (=> b!1075600 m!994833))

(assert (=> b!1075600 m!994823))

(assert (=> b!1075600 m!994825))

(assert (=> b!1075600 m!994827))

(assert (=> b!1075600 m!994823))

(assert (=> b!1075600 m!994825))

(assert (=> b!1075600 m!994813))

(declare-fun m!994835 () Bool)

(assert (=> b!1075600 m!994835))

(declare-fun m!994837 () Bool)

(assert (=> b!1075603 m!994837))

(declare-fun m!994839 () Bool)

(assert (=> b!1075606 m!994839))

(assert (=> bm!45423 m!994837))

(assert (=> b!1075520 d!129961))

(declare-fun b!1075611 () Bool)

(declare-fun e!614689 () Bool)

(declare-fun e!614692 () Bool)

(assert (=> b!1075611 (= e!614689 e!614692)))

(assert (=> b!1075611 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(declare-fun res!716876 () Bool)

(declare-fun lt!477050 () ListLongMap!14573)

(assert (=> b!1075611 (= res!716876 (contains!6359 lt!477050 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075611 (=> (not res!716876) (not e!614692))))

(declare-fun b!1075612 () Bool)

(declare-fun e!614690 () Bool)

(assert (=> b!1075612 (= e!614690 e!614689)))

(declare-fun c!108280 () Bool)

(declare-fun e!614693 () Bool)

(assert (=> b!1075612 (= c!108280 e!614693)))

(declare-fun res!716873 () Bool)

(assert (=> b!1075612 (=> (not res!716873) (not e!614693))))

(assert (=> b!1075612 (= res!716873 (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(declare-fun b!1075613 () Bool)

(declare-fun e!614691 () ListLongMap!14573)

(declare-fun e!614695 () ListLongMap!14573)

(assert (=> b!1075613 (= e!614691 e!614695)))

(declare-fun c!108278 () Bool)

(assert (=> b!1075613 (= c!108278 (validKeyInArray!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075614 () Bool)

(declare-fun lt!477054 () Unit!35344)

(declare-fun lt!477051 () Unit!35344)

(assert (=> b!1075614 (= lt!477054 lt!477051)))

(declare-fun lt!477055 () (_ BitVec 64))

(declare-fun lt!477052 () (_ BitVec 64))

(declare-fun lt!477056 () V!39777)

(declare-fun lt!477053 () ListLongMap!14573)

(assert (=> b!1075614 (not (contains!6359 (+!3237 lt!477053 (tuple2!16597 lt!477055 lt!477056)) lt!477052))))

(assert (=> b!1075614 (= lt!477051 (addStillNotContains!265 lt!477053 lt!477055 lt!477056 lt!477052))))

(assert (=> b!1075614 (= lt!477052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075614 (= lt!477056 (get!17250 (select (arr!33170 _values!955) #b00000000000000000000000000000000) (dynLambda!2059 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075614 (= lt!477055 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45427 () ListLongMap!14573)

(assert (=> b!1075614 (= lt!477053 call!45427)))

(assert (=> b!1075614 (= e!614695 (+!3237 call!45427 (tuple2!16597 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000) (get!17250 (select (arr!33170 _values!955) #b00000000000000000000000000000000) (dynLambda!2059 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075615 () Bool)

(assert (=> b!1075615 (= e!614693 (validKeyInArray!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075615 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075616 () Bool)

(declare-fun res!716874 () Bool)

(assert (=> b!1075616 (=> (not res!716874) (not e!614690))))

(assert (=> b!1075616 (= res!716874 (not (contains!6359 lt!477050 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!45424 () Bool)

(assert (=> bm!45424 (= call!45427 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075617 () Bool)

(declare-fun e!614694 () Bool)

(assert (=> b!1075617 (= e!614694 (= lt!477050 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075618 () Bool)

(assert (=> b!1075618 (= e!614689 e!614694)))

(declare-fun c!108281 () Bool)

(assert (=> b!1075618 (= c!108281 (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(declare-fun b!1075619 () Bool)

(assert (=> b!1075619 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(assert (=> b!1075619 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33707 _values!955)))))

(assert (=> b!1075619 (= e!614692 (= (apply!944 lt!477050 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)) (get!17250 (select (arr!33170 _values!955) #b00000000000000000000000000000000) (dynLambda!2059 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075620 () Bool)

(assert (=> b!1075620 (= e!614694 (isEmpty!957 lt!477050))))

(declare-fun b!1075621 () Bool)

(assert (=> b!1075621 (= e!614691 (ListLongMap!14574 Nil!23149))))

(declare-fun d!129963 () Bool)

(assert (=> d!129963 e!614690))

(declare-fun res!716875 () Bool)

(assert (=> d!129963 (=> (not res!716875) (not e!614690))))

(assert (=> d!129963 (= res!716875 (not (contains!6359 lt!477050 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129963 (= lt!477050 e!614691)))

(declare-fun c!108279 () Bool)

(assert (=> d!129963 (= c!108279 (bvsge #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(assert (=> d!129963 (validMask!0 mask!1515)))

(assert (=> d!129963 (= (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477050)))

(declare-fun b!1075622 () Bool)

(assert (=> b!1075622 (= e!614695 call!45427)))

(assert (= (and d!129963 c!108279) b!1075621))

(assert (= (and d!129963 (not c!108279)) b!1075613))

(assert (= (and b!1075613 c!108278) b!1075614))

(assert (= (and b!1075613 (not c!108278)) b!1075622))

(assert (= (or b!1075614 b!1075622) bm!45424))

(assert (= (and d!129963 res!716875) b!1075616))

(assert (= (and b!1075616 res!716874) b!1075612))

(assert (= (and b!1075612 res!716873) b!1075615))

(assert (= (and b!1075612 c!108280) b!1075611))

(assert (= (and b!1075612 (not c!108280)) b!1075618))

(assert (= (and b!1075611 res!716876) b!1075619))

(assert (= (and b!1075618 c!108281) b!1075617))

(assert (= (and b!1075618 (not c!108281)) b!1075620))

(declare-fun b_lambda!16799 () Bool)

(assert (=> (not b_lambda!16799) (not b!1075614)))

(assert (=> b!1075614 t!32490))

(declare-fun b_and!35075 () Bool)

(assert (= b_and!35073 (and (=> t!32490 result!14795) b_and!35075)))

(declare-fun b_lambda!16801 () Bool)

(assert (=> (not b_lambda!16801) (not b!1075619)))

(assert (=> b!1075619 t!32490))

(declare-fun b_and!35077 () Bool)

(assert (= b_and!35075 (and (=> t!32490 result!14795) b_and!35077)))

(declare-fun m!994841 () Bool)

(assert (=> d!129963 m!994841))

(assert (=> d!129963 m!994739))

(assert (=> b!1075611 m!994813))

(assert (=> b!1075611 m!994813))

(declare-fun m!994843 () Bool)

(assert (=> b!1075611 m!994843))

(assert (=> b!1075613 m!994813))

(assert (=> b!1075613 m!994813))

(assert (=> b!1075613 m!994817))

(declare-fun m!994845 () Bool)

(assert (=> b!1075616 m!994845))

(assert (=> b!1075619 m!994813))

(declare-fun m!994847 () Bool)

(assert (=> b!1075619 m!994847))

(assert (=> b!1075619 m!994813))

(assert (=> b!1075619 m!994823))

(assert (=> b!1075619 m!994825))

(assert (=> b!1075619 m!994827))

(assert (=> b!1075619 m!994823))

(assert (=> b!1075619 m!994825))

(assert (=> b!1075615 m!994813))

(assert (=> b!1075615 m!994813))

(assert (=> b!1075615 m!994817))

(declare-fun m!994849 () Bool)

(assert (=> b!1075614 m!994849))

(declare-fun m!994851 () Bool)

(assert (=> b!1075614 m!994851))

(assert (=> b!1075614 m!994851))

(declare-fun m!994853 () Bool)

(assert (=> b!1075614 m!994853))

(assert (=> b!1075614 m!994823))

(assert (=> b!1075614 m!994825))

(assert (=> b!1075614 m!994827))

(assert (=> b!1075614 m!994823))

(assert (=> b!1075614 m!994825))

(assert (=> b!1075614 m!994813))

(declare-fun m!994855 () Bool)

(assert (=> b!1075614 m!994855))

(declare-fun m!994857 () Bool)

(assert (=> b!1075617 m!994857))

(declare-fun m!994859 () Bool)

(assert (=> b!1075620 m!994859))

(assert (=> bm!45424 m!994857))

(assert (=> b!1075520 d!129963))

(declare-fun d!129965 () Bool)

(declare-fun res!716884 () Bool)

(declare-fun e!614704 () Bool)

(assert (=> d!129965 (=> res!716884 e!614704)))

(assert (=> d!129965 (= res!716884 (bvsge #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(assert (=> d!129965 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23150) e!614704)))

(declare-fun b!1075633 () Bool)

(declare-fun e!614706 () Bool)

(assert (=> b!1075633 (= e!614704 e!614706)))

(declare-fun res!716883 () Bool)

(assert (=> b!1075633 (=> (not res!716883) (not e!614706))))

(declare-fun e!614705 () Bool)

(assert (=> b!1075633 (= res!716883 (not e!614705))))

(declare-fun res!716885 () Bool)

(assert (=> b!1075633 (=> (not res!716885) (not e!614705))))

(assert (=> b!1075633 (= res!716885 (validKeyInArray!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075634 () Bool)

(declare-fun contains!6360 (List!23153 (_ BitVec 64)) Bool)

(assert (=> b!1075634 (= e!614705 (contains!6360 Nil!23150 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075635 () Bool)

(declare-fun e!614707 () Bool)

(assert (=> b!1075635 (= e!614706 e!614707)))

(declare-fun c!108284 () Bool)

(assert (=> b!1075635 (= c!108284 (validKeyInArray!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075636 () Bool)

(declare-fun call!45430 () Bool)

(assert (=> b!1075636 (= e!614707 call!45430)))

(declare-fun bm!45427 () Bool)

(assert (=> bm!45427 (= call!45430 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108284 (Cons!23149 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000) Nil!23150) Nil!23150)))))

(declare-fun b!1075637 () Bool)

(assert (=> b!1075637 (= e!614707 call!45430)))

(assert (= (and d!129965 (not res!716884)) b!1075633))

(assert (= (and b!1075633 res!716885) b!1075634))

(assert (= (and b!1075633 res!716883) b!1075635))

(assert (= (and b!1075635 c!108284) b!1075637))

(assert (= (and b!1075635 (not c!108284)) b!1075636))

(assert (= (or b!1075637 b!1075636) bm!45427))

(assert (=> b!1075633 m!994813))

(assert (=> b!1075633 m!994813))

(assert (=> b!1075633 m!994817))

(assert (=> b!1075634 m!994813))

(assert (=> b!1075634 m!994813))

(declare-fun m!994861 () Bool)

(assert (=> b!1075634 m!994861))

(assert (=> b!1075635 m!994813))

(assert (=> b!1075635 m!994813))

(assert (=> b!1075635 m!994817))

(assert (=> bm!45427 m!994813))

(declare-fun m!994863 () Bool)

(assert (=> bm!45427 m!994863))

(assert (=> b!1075523 d!129965))

(declare-fun bm!45430 () Bool)

(declare-fun call!45433 () Bool)

(assert (=> bm!45430 (= call!45433 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun d!129967 () Bool)

(declare-fun res!716890 () Bool)

(declare-fun e!614716 () Bool)

(assert (=> d!129967 (=> res!716890 e!614716)))

(assert (=> d!129967 (= res!716890 (bvsge #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(assert (=> d!129967 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614716)))

(declare-fun b!1075646 () Bool)

(declare-fun e!614714 () Bool)

(assert (=> b!1075646 (= e!614714 call!45433)))

(declare-fun b!1075647 () Bool)

(assert (=> b!1075647 (= e!614716 e!614714)))

(declare-fun c!108287 () Bool)

(assert (=> b!1075647 (= c!108287 (validKeyInArray!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075648 () Bool)

(declare-fun e!614715 () Bool)

(assert (=> b!1075648 (= e!614715 call!45433)))

(declare-fun b!1075649 () Bool)

(assert (=> b!1075649 (= e!614714 e!614715)))

(declare-fun lt!477065 () (_ BitVec 64))

(assert (=> b!1075649 (= lt!477065 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477063 () Unit!35344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68973 (_ BitVec 64) (_ BitVec 32)) Unit!35344)

(assert (=> b!1075649 (= lt!477063 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477065 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075649 (arrayContainsKey!0 _keys!1163 lt!477065 #b00000000000000000000000000000000)))

(declare-fun lt!477064 () Unit!35344)

(assert (=> b!1075649 (= lt!477064 lt!477063)))

(declare-fun res!716891 () Bool)

(declare-datatypes ((SeekEntryResult!9844 0))(
  ( (MissingZero!9844 (index!41747 (_ BitVec 32))) (Found!9844 (index!41748 (_ BitVec 32))) (Intermediate!9844 (undefined!10656 Bool) (index!41749 (_ BitVec 32)) (x!96264 (_ BitVec 32))) (Undefined!9844) (MissingVacant!9844 (index!41750 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68973 (_ BitVec 32)) SeekEntryResult!9844)

(assert (=> b!1075649 (= res!716891 (= (seekEntryOrOpen!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9844 #b00000000000000000000000000000000)))))

(assert (=> b!1075649 (=> (not res!716891) (not e!614715))))

(assert (= (and d!129967 (not res!716890)) b!1075647))

(assert (= (and b!1075647 c!108287) b!1075649))

(assert (= (and b!1075647 (not c!108287)) b!1075646))

(assert (= (and b!1075649 res!716891) b!1075648))

(assert (= (or b!1075648 b!1075646) bm!45430))

(declare-fun m!994865 () Bool)

(assert (=> bm!45430 m!994865))

(assert (=> b!1075647 m!994813))

(assert (=> b!1075647 m!994813))

(assert (=> b!1075647 m!994817))

(assert (=> b!1075649 m!994813))

(declare-fun m!994867 () Bool)

(assert (=> b!1075649 m!994867))

(declare-fun m!994869 () Bool)

(assert (=> b!1075649 m!994869))

(assert (=> b!1075649 m!994813))

(declare-fun m!994871 () Bool)

(assert (=> b!1075649 m!994871))

(assert (=> b!1075518 d!129967))

(declare-fun b!1075692 () Bool)

(declare-fun e!614747 () Unit!35344)

(declare-fun Unit!35346 () Unit!35344)

(assert (=> b!1075692 (= e!614747 Unit!35346)))

(declare-fun b!1075693 () Bool)

(declare-fun e!614743 () Bool)

(declare-fun e!614748 () Bool)

(assert (=> b!1075693 (= e!614743 e!614748)))

(declare-fun res!716914 () Bool)

(declare-fun call!45454 () Bool)

(assert (=> b!1075693 (= res!716914 call!45454)))

(assert (=> b!1075693 (=> (not res!716914) (not e!614748))))

(declare-fun b!1075694 () Bool)

(declare-fun e!614750 () ListLongMap!14573)

(declare-fun call!45449 () ListLongMap!14573)

(assert (=> b!1075694 (= e!614750 call!45449)))

(declare-fun b!1075695 () Bool)

(declare-fun c!108301 () Bool)

(assert (=> b!1075695 (= c!108301 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614753 () ListLongMap!14573)

(assert (=> b!1075695 (= e!614750 e!614753)))

(declare-fun b!1075696 () Bool)

(declare-fun e!614745 () Bool)

(declare-fun call!45453 () Bool)

(assert (=> b!1075696 (= e!614745 (not call!45453))))

(declare-fun b!1075697 () Bool)

(declare-fun e!614744 () Bool)

(assert (=> b!1075697 (= e!614744 (validKeyInArray!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075699 () Bool)

(assert (=> b!1075699 (= e!614743 (not call!45454))))

(declare-fun b!1075700 () Bool)

(declare-fun call!45451 () ListLongMap!14573)

(assert (=> b!1075700 (= e!614753 call!45451)))

(declare-fun bm!45445 () Bool)

(declare-fun call!45450 () ListLongMap!14573)

(assert (=> bm!45445 (= call!45450 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun call!45448 () ListLongMap!14573)

(declare-fun c!108302 () Bool)

(declare-fun c!108303 () Bool)

(declare-fun bm!45446 () Bool)

(declare-fun call!45452 () ListLongMap!14573)

(assert (=> bm!45446 (= call!45452 (+!3237 (ite c!108303 call!45450 (ite c!108302 call!45448 call!45451)) (ite (or c!108303 c!108302) (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075701 () Bool)

(assert (=> b!1075701 (= e!614753 call!45449)))

(declare-fun b!1075702 () Bool)

(declare-fun res!716915 () Bool)

(declare-fun e!614751 () Bool)

(assert (=> b!1075702 (=> (not res!716915) (not e!614751))))

(declare-fun e!614754 () Bool)

(assert (=> b!1075702 (= res!716915 e!614754)))

(declare-fun res!716910 () Bool)

(assert (=> b!1075702 (=> res!716910 e!614754)))

(declare-fun e!614752 () Bool)

(assert (=> b!1075702 (= res!716910 (not e!614752))))

(declare-fun res!716913 () Bool)

(assert (=> b!1075702 (=> (not res!716913) (not e!614752))))

(assert (=> b!1075702 (= res!716913 (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(declare-fun b!1075703 () Bool)

(declare-fun e!614755 () ListLongMap!14573)

(assert (=> b!1075703 (= e!614755 e!614750)))

(assert (=> b!1075703 (= c!108302 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45447 () Bool)

(assert (=> bm!45447 (= call!45451 call!45448)))

(declare-fun b!1075704 () Bool)

(assert (=> b!1075704 (= e!614755 (+!3237 call!45452 (tuple2!16597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1075705 () Bool)

(declare-fun e!614746 () Bool)

(assert (=> b!1075705 (= e!614754 e!614746)))

(declare-fun res!716916 () Bool)

(assert (=> b!1075705 (=> (not res!716916) (not e!614746))))

(declare-fun lt!477110 () ListLongMap!14573)

(assert (=> b!1075705 (= res!716916 (contains!6359 lt!477110 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075705 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(declare-fun b!1075706 () Bool)

(assert (=> b!1075706 (= e!614748 (= (apply!944 lt!477110 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075707 () Bool)

(declare-fun e!614749 () Bool)

(assert (=> b!1075707 (= e!614745 e!614749)))

(declare-fun res!716918 () Bool)

(assert (=> b!1075707 (= res!716918 call!45453)))

(assert (=> b!1075707 (=> (not res!716918) (not e!614749))))

(declare-fun b!1075708 () Bool)

(declare-fun res!716911 () Bool)

(assert (=> b!1075708 (=> (not res!716911) (not e!614751))))

(assert (=> b!1075708 (= res!716911 e!614745)))

(declare-fun c!108305 () Bool)

(assert (=> b!1075708 (= c!108305 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45448 () Bool)

(assert (=> bm!45448 (= call!45454 (contains!6359 lt!477110 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45449 () Bool)

(assert (=> bm!45449 (= call!45448 call!45450)))

(declare-fun bm!45450 () Bool)

(assert (=> bm!45450 (= call!45449 call!45452)))

(declare-fun bm!45451 () Bool)

(assert (=> bm!45451 (= call!45453 (contains!6359 lt!477110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!129969 () Bool)

(assert (=> d!129969 e!614751))

(declare-fun res!716917 () Bool)

(assert (=> d!129969 (=> (not res!716917) (not e!614751))))

(assert (=> d!129969 (= res!716917 (or (bvsge #b00000000000000000000000000000000 (size!33708 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))))

(declare-fun lt!477124 () ListLongMap!14573)

(assert (=> d!129969 (= lt!477110 lt!477124)))

(declare-fun lt!477114 () Unit!35344)

(assert (=> d!129969 (= lt!477114 e!614747)))

(declare-fun c!108304 () Bool)

(assert (=> d!129969 (= c!108304 e!614744)))

(declare-fun res!716912 () Bool)

(assert (=> d!129969 (=> (not res!716912) (not e!614744))))

(assert (=> d!129969 (= res!716912 (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(assert (=> d!129969 (= lt!477124 e!614755)))

(assert (=> d!129969 (= c!108303 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129969 (validMask!0 mask!1515)))

(assert (=> d!129969 (= (getCurrentListMap!4163 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477110)))

(declare-fun b!1075698 () Bool)

(assert (=> b!1075698 (= e!614751 e!614743)))

(declare-fun c!108300 () Bool)

(assert (=> b!1075698 (= c!108300 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075709 () Bool)

(assert (=> b!1075709 (= e!614749 (= (apply!944 lt!477110 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1075710 () Bool)

(assert (=> b!1075710 (= e!614752 (validKeyInArray!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075711 () Bool)

(declare-fun lt!477122 () Unit!35344)

(assert (=> b!1075711 (= e!614747 lt!477122)))

(declare-fun lt!477117 () ListLongMap!14573)

(assert (=> b!1075711 (= lt!477117 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477127 () (_ BitVec 64))

(assert (=> b!1075711 (= lt!477127 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477113 () (_ BitVec 64))

(assert (=> b!1075711 (= lt!477113 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477121 () Unit!35344)

(declare-fun addStillContains!648 (ListLongMap!14573 (_ BitVec 64) V!39777 (_ BitVec 64)) Unit!35344)

(assert (=> b!1075711 (= lt!477121 (addStillContains!648 lt!477117 lt!477127 zeroValueBefore!47 lt!477113))))

(assert (=> b!1075711 (contains!6359 (+!3237 lt!477117 (tuple2!16597 lt!477127 zeroValueBefore!47)) lt!477113)))

(declare-fun lt!477120 () Unit!35344)

(assert (=> b!1075711 (= lt!477120 lt!477121)))

(declare-fun lt!477111 () ListLongMap!14573)

(assert (=> b!1075711 (= lt!477111 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477119 () (_ BitVec 64))

(assert (=> b!1075711 (= lt!477119 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477130 () (_ BitVec 64))

(assert (=> b!1075711 (= lt!477130 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477118 () Unit!35344)

(declare-fun addApplyDifferent!504 (ListLongMap!14573 (_ BitVec 64) V!39777 (_ BitVec 64)) Unit!35344)

(assert (=> b!1075711 (= lt!477118 (addApplyDifferent!504 lt!477111 lt!477119 minValue!907 lt!477130))))

(assert (=> b!1075711 (= (apply!944 (+!3237 lt!477111 (tuple2!16597 lt!477119 minValue!907)) lt!477130) (apply!944 lt!477111 lt!477130))))

(declare-fun lt!477112 () Unit!35344)

(assert (=> b!1075711 (= lt!477112 lt!477118)))

(declare-fun lt!477115 () ListLongMap!14573)

(assert (=> b!1075711 (= lt!477115 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477116 () (_ BitVec 64))

(assert (=> b!1075711 (= lt!477116 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477128 () (_ BitVec 64))

(assert (=> b!1075711 (= lt!477128 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477131 () Unit!35344)

(assert (=> b!1075711 (= lt!477131 (addApplyDifferent!504 lt!477115 lt!477116 zeroValueBefore!47 lt!477128))))

(assert (=> b!1075711 (= (apply!944 (+!3237 lt!477115 (tuple2!16597 lt!477116 zeroValueBefore!47)) lt!477128) (apply!944 lt!477115 lt!477128))))

(declare-fun lt!477129 () Unit!35344)

(assert (=> b!1075711 (= lt!477129 lt!477131)))

(declare-fun lt!477123 () ListLongMap!14573)

(assert (=> b!1075711 (= lt!477123 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477125 () (_ BitVec 64))

(assert (=> b!1075711 (= lt!477125 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477126 () (_ BitVec 64))

(assert (=> b!1075711 (= lt!477126 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075711 (= lt!477122 (addApplyDifferent!504 lt!477123 lt!477125 minValue!907 lt!477126))))

(assert (=> b!1075711 (= (apply!944 (+!3237 lt!477123 (tuple2!16597 lt!477125 minValue!907)) lt!477126) (apply!944 lt!477123 lt!477126))))

(declare-fun b!1075712 () Bool)

(assert (=> b!1075712 (= e!614746 (= (apply!944 lt!477110 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)) (get!17250 (select (arr!33170 _values!955) #b00000000000000000000000000000000) (dynLambda!2059 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33707 _values!955)))))

(assert (=> b!1075712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(assert (= (and d!129969 c!108303) b!1075704))

(assert (= (and d!129969 (not c!108303)) b!1075703))

(assert (= (and b!1075703 c!108302) b!1075694))

(assert (= (and b!1075703 (not c!108302)) b!1075695))

(assert (= (and b!1075695 c!108301) b!1075701))

(assert (= (and b!1075695 (not c!108301)) b!1075700))

(assert (= (or b!1075701 b!1075700) bm!45447))

(assert (= (or b!1075694 bm!45447) bm!45449))

(assert (= (or b!1075694 b!1075701) bm!45450))

(assert (= (or b!1075704 bm!45449) bm!45445))

(assert (= (or b!1075704 bm!45450) bm!45446))

(assert (= (and d!129969 res!716912) b!1075697))

(assert (= (and d!129969 c!108304) b!1075711))

(assert (= (and d!129969 (not c!108304)) b!1075692))

(assert (= (and d!129969 res!716917) b!1075702))

(assert (= (and b!1075702 res!716913) b!1075710))

(assert (= (and b!1075702 (not res!716910)) b!1075705))

(assert (= (and b!1075705 res!716916) b!1075712))

(assert (= (and b!1075702 res!716915) b!1075708))

(assert (= (and b!1075708 c!108305) b!1075707))

(assert (= (and b!1075708 (not c!108305)) b!1075696))

(assert (= (and b!1075707 res!716918) b!1075709))

(assert (= (or b!1075707 b!1075696) bm!45451))

(assert (= (and b!1075708 res!716911) b!1075698))

(assert (= (and b!1075698 c!108300) b!1075693))

(assert (= (and b!1075698 (not c!108300)) b!1075699))

(assert (= (and b!1075693 res!716914) b!1075706))

(assert (= (or b!1075693 b!1075699) bm!45448))

(declare-fun b_lambda!16803 () Bool)

(assert (=> (not b_lambda!16803) (not b!1075712)))

(assert (=> b!1075712 t!32490))

(declare-fun b_and!35079 () Bool)

(assert (= b_and!35077 (and (=> t!32490 result!14795) b_and!35079)))

(assert (=> bm!45445 m!994749))

(declare-fun m!994873 () Bool)

(assert (=> bm!45451 m!994873))

(assert (=> b!1075710 m!994813))

(assert (=> b!1075710 m!994813))

(assert (=> b!1075710 m!994817))

(declare-fun m!994875 () Bool)

(assert (=> b!1075709 m!994875))

(assert (=> b!1075705 m!994813))

(assert (=> b!1075705 m!994813))

(declare-fun m!994877 () Bool)

(assert (=> b!1075705 m!994877))

(declare-fun m!994879 () Bool)

(assert (=> bm!45446 m!994879))

(declare-fun m!994881 () Bool)

(assert (=> b!1075711 m!994881))

(declare-fun m!994883 () Bool)

(assert (=> b!1075711 m!994883))

(declare-fun m!994885 () Bool)

(assert (=> b!1075711 m!994885))

(declare-fun m!994887 () Bool)

(assert (=> b!1075711 m!994887))

(declare-fun m!994889 () Bool)

(assert (=> b!1075711 m!994889))

(declare-fun m!994891 () Bool)

(assert (=> b!1075711 m!994891))

(declare-fun m!994893 () Bool)

(assert (=> b!1075711 m!994893))

(declare-fun m!994895 () Bool)

(assert (=> b!1075711 m!994895))

(declare-fun m!994897 () Bool)

(assert (=> b!1075711 m!994897))

(declare-fun m!994899 () Bool)

(assert (=> b!1075711 m!994899))

(declare-fun m!994901 () Bool)

(assert (=> b!1075711 m!994901))

(assert (=> b!1075711 m!994893))

(assert (=> b!1075711 m!994885))

(declare-fun m!994903 () Bool)

(assert (=> b!1075711 m!994903))

(declare-fun m!994905 () Bool)

(assert (=> b!1075711 m!994905))

(declare-fun m!994907 () Bool)

(assert (=> b!1075711 m!994907))

(declare-fun m!994909 () Bool)

(assert (=> b!1075711 m!994909))

(assert (=> b!1075711 m!994749))

(assert (=> b!1075711 m!994903))

(assert (=> b!1075711 m!994813))

(assert (=> b!1075711 m!994881))

(assert (=> b!1075712 m!994825))

(assert (=> b!1075712 m!994823))

(assert (=> b!1075712 m!994813))

(assert (=> b!1075712 m!994823))

(assert (=> b!1075712 m!994825))

(assert (=> b!1075712 m!994827))

(assert (=> b!1075712 m!994813))

(declare-fun m!994911 () Bool)

(assert (=> b!1075712 m!994911))

(assert (=> b!1075697 m!994813))

(assert (=> b!1075697 m!994813))

(assert (=> b!1075697 m!994817))

(declare-fun m!994913 () Bool)

(assert (=> bm!45448 m!994913))

(declare-fun m!994915 () Bool)

(assert (=> b!1075706 m!994915))

(declare-fun m!994917 () Bool)

(assert (=> b!1075704 m!994917))

(assert (=> d!129969 m!994739))

(assert (=> b!1075517 d!129969))

(declare-fun d!129971 () Bool)

(declare-fun e!614758 () Bool)

(assert (=> d!129971 e!614758))

(declare-fun res!716923 () Bool)

(assert (=> d!129971 (=> (not res!716923) (not e!614758))))

(declare-fun lt!477142 () ListLongMap!14573)

(assert (=> d!129971 (= res!716923 (contains!6359 lt!477142 (_1!8309 (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!477141 () List!23152)

(assert (=> d!129971 (= lt!477142 (ListLongMap!14574 lt!477141))))

(declare-fun lt!477143 () Unit!35344)

(declare-fun lt!477140 () Unit!35344)

(assert (=> d!129971 (= lt!477143 lt!477140)))

(declare-datatypes ((Option!654 0))(
  ( (Some!653 (v!15660 V!39777)) (None!652) )
))
(declare-fun getValueByKey!603 (List!23152 (_ BitVec 64)) Option!654)

(assert (=> d!129971 (= (getValueByKey!603 lt!477141 (_1!8309 (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!653 (_2!8309 (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!287 (List!23152 (_ BitVec 64) V!39777) Unit!35344)

(assert (=> d!129971 (= lt!477140 (lemmaContainsTupThenGetReturnValue!287 lt!477141 (_1!8309 (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8309 (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!380 (List!23152 (_ BitVec 64) V!39777) List!23152)

(assert (=> d!129971 (= lt!477141 (insertStrictlySorted!380 (toList!7302 lt!476998) (_1!8309 (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8309 (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129971 (= (+!3237 lt!476998 (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477142)))

(declare-fun b!1075717 () Bool)

(declare-fun res!716924 () Bool)

(assert (=> b!1075717 (=> (not res!716924) (not e!614758))))

(assert (=> b!1075717 (= res!716924 (= (getValueByKey!603 (toList!7302 lt!477142) (_1!8309 (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!653 (_2!8309 (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1075718 () Bool)

(declare-fun contains!6361 (List!23152 tuple2!16596) Bool)

(assert (=> b!1075718 (= e!614758 (contains!6361 (toList!7302 lt!477142) (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129971 res!716923) b!1075717))

(assert (= (and b!1075717 res!716924) b!1075718))

(declare-fun m!994919 () Bool)

(assert (=> d!129971 m!994919))

(declare-fun m!994921 () Bool)

(assert (=> d!129971 m!994921))

(declare-fun m!994923 () Bool)

(assert (=> d!129971 m!994923))

(declare-fun m!994925 () Bool)

(assert (=> d!129971 m!994925))

(declare-fun m!994927 () Bool)

(assert (=> b!1075717 m!994927))

(declare-fun m!994929 () Bool)

(assert (=> b!1075718 m!994929))

(assert (=> b!1075517 d!129971))

(declare-fun b!1075719 () Bool)

(declare-fun e!614763 () Unit!35344)

(declare-fun Unit!35347 () Unit!35344)

(assert (=> b!1075719 (= e!614763 Unit!35347)))

(declare-fun b!1075720 () Bool)

(declare-fun e!614759 () Bool)

(declare-fun e!614764 () Bool)

(assert (=> b!1075720 (= e!614759 e!614764)))

(declare-fun res!716929 () Bool)

(declare-fun call!45461 () Bool)

(assert (=> b!1075720 (= res!716929 call!45461)))

(assert (=> b!1075720 (=> (not res!716929) (not e!614764))))

(declare-fun b!1075721 () Bool)

(declare-fun e!614766 () ListLongMap!14573)

(declare-fun call!45456 () ListLongMap!14573)

(assert (=> b!1075721 (= e!614766 call!45456)))

(declare-fun b!1075722 () Bool)

(declare-fun c!108307 () Bool)

(assert (=> b!1075722 (= c!108307 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614769 () ListLongMap!14573)

(assert (=> b!1075722 (= e!614766 e!614769)))

(declare-fun b!1075723 () Bool)

(declare-fun e!614761 () Bool)

(declare-fun call!45460 () Bool)

(assert (=> b!1075723 (= e!614761 (not call!45460))))

(declare-fun b!1075724 () Bool)

(declare-fun e!614760 () Bool)

(assert (=> b!1075724 (= e!614760 (validKeyInArray!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075726 () Bool)

(assert (=> b!1075726 (= e!614759 (not call!45461))))

(declare-fun b!1075727 () Bool)

(declare-fun call!45458 () ListLongMap!14573)

(assert (=> b!1075727 (= e!614769 call!45458)))

(declare-fun bm!45452 () Bool)

(declare-fun call!45457 () ListLongMap!14573)

(assert (=> bm!45452 (= call!45457 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun call!45459 () ListLongMap!14573)

(declare-fun c!108309 () Bool)

(declare-fun call!45455 () ListLongMap!14573)

(declare-fun c!108308 () Bool)

(declare-fun bm!45453 () Bool)

(assert (=> bm!45453 (= call!45459 (+!3237 (ite c!108309 call!45457 (ite c!108308 call!45455 call!45458)) (ite (or c!108309 c!108308) (tuple2!16597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075728 () Bool)

(assert (=> b!1075728 (= e!614769 call!45456)))

(declare-fun b!1075729 () Bool)

(declare-fun res!716930 () Bool)

(declare-fun e!614767 () Bool)

(assert (=> b!1075729 (=> (not res!716930) (not e!614767))))

(declare-fun e!614770 () Bool)

(assert (=> b!1075729 (= res!716930 e!614770)))

(declare-fun res!716925 () Bool)

(assert (=> b!1075729 (=> res!716925 e!614770)))

(declare-fun e!614768 () Bool)

(assert (=> b!1075729 (= res!716925 (not e!614768))))

(declare-fun res!716928 () Bool)

(assert (=> b!1075729 (=> (not res!716928) (not e!614768))))

(assert (=> b!1075729 (= res!716928 (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(declare-fun b!1075730 () Bool)

(declare-fun e!614771 () ListLongMap!14573)

(assert (=> b!1075730 (= e!614771 e!614766)))

(assert (=> b!1075730 (= c!108308 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45454 () Bool)

(assert (=> bm!45454 (= call!45458 call!45455)))

(declare-fun b!1075731 () Bool)

(assert (=> b!1075731 (= e!614771 (+!3237 call!45459 (tuple2!16597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1075732 () Bool)

(declare-fun e!614762 () Bool)

(assert (=> b!1075732 (= e!614770 e!614762)))

(declare-fun res!716931 () Bool)

(assert (=> b!1075732 (=> (not res!716931) (not e!614762))))

(declare-fun lt!477144 () ListLongMap!14573)

(assert (=> b!1075732 (= res!716931 (contains!6359 lt!477144 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(declare-fun b!1075733 () Bool)

(assert (=> b!1075733 (= e!614764 (= (apply!944 lt!477144 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075734 () Bool)

(declare-fun e!614765 () Bool)

(assert (=> b!1075734 (= e!614761 e!614765)))

(declare-fun res!716933 () Bool)

(assert (=> b!1075734 (= res!716933 call!45460)))

(assert (=> b!1075734 (=> (not res!716933) (not e!614765))))

(declare-fun b!1075735 () Bool)

(declare-fun res!716926 () Bool)

(assert (=> b!1075735 (=> (not res!716926) (not e!614767))))

(assert (=> b!1075735 (= res!716926 e!614761)))

(declare-fun c!108311 () Bool)

(assert (=> b!1075735 (= c!108311 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45455 () Bool)

(assert (=> bm!45455 (= call!45461 (contains!6359 lt!477144 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45456 () Bool)

(assert (=> bm!45456 (= call!45455 call!45457)))

(declare-fun bm!45457 () Bool)

(assert (=> bm!45457 (= call!45456 call!45459)))

(declare-fun bm!45458 () Bool)

(assert (=> bm!45458 (= call!45460 (contains!6359 lt!477144 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!129973 () Bool)

(assert (=> d!129973 e!614767))

(declare-fun res!716932 () Bool)

(assert (=> d!129973 (=> (not res!716932) (not e!614767))))

(assert (=> d!129973 (= res!716932 (or (bvsge #b00000000000000000000000000000000 (size!33708 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))))

(declare-fun lt!477158 () ListLongMap!14573)

(assert (=> d!129973 (= lt!477144 lt!477158)))

(declare-fun lt!477148 () Unit!35344)

(assert (=> d!129973 (= lt!477148 e!614763)))

(declare-fun c!108310 () Bool)

(assert (=> d!129973 (= c!108310 e!614760)))

(declare-fun res!716927 () Bool)

(assert (=> d!129973 (=> (not res!716927) (not e!614760))))

(assert (=> d!129973 (= res!716927 (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(assert (=> d!129973 (= lt!477158 e!614771)))

(assert (=> d!129973 (= c!108309 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129973 (validMask!0 mask!1515)))

(assert (=> d!129973 (= (getCurrentListMap!4163 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477144)))

(declare-fun b!1075725 () Bool)

(assert (=> b!1075725 (= e!614767 e!614759)))

(declare-fun c!108306 () Bool)

(assert (=> b!1075725 (= c!108306 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075736 () Bool)

(assert (=> b!1075736 (= e!614765 (= (apply!944 lt!477144 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1075737 () Bool)

(assert (=> b!1075737 (= e!614768 (validKeyInArray!0 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075738 () Bool)

(declare-fun lt!477156 () Unit!35344)

(assert (=> b!1075738 (= e!614763 lt!477156)))

(declare-fun lt!477151 () ListLongMap!14573)

(assert (=> b!1075738 (= lt!477151 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477161 () (_ BitVec 64))

(assert (=> b!1075738 (= lt!477161 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477147 () (_ BitVec 64))

(assert (=> b!1075738 (= lt!477147 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477155 () Unit!35344)

(assert (=> b!1075738 (= lt!477155 (addStillContains!648 lt!477151 lt!477161 zeroValueAfter!47 lt!477147))))

(assert (=> b!1075738 (contains!6359 (+!3237 lt!477151 (tuple2!16597 lt!477161 zeroValueAfter!47)) lt!477147)))

(declare-fun lt!477154 () Unit!35344)

(assert (=> b!1075738 (= lt!477154 lt!477155)))

(declare-fun lt!477145 () ListLongMap!14573)

(assert (=> b!1075738 (= lt!477145 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477153 () (_ BitVec 64))

(assert (=> b!1075738 (= lt!477153 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477164 () (_ BitVec 64))

(assert (=> b!1075738 (= lt!477164 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477152 () Unit!35344)

(assert (=> b!1075738 (= lt!477152 (addApplyDifferent!504 lt!477145 lt!477153 minValue!907 lt!477164))))

(assert (=> b!1075738 (= (apply!944 (+!3237 lt!477145 (tuple2!16597 lt!477153 minValue!907)) lt!477164) (apply!944 lt!477145 lt!477164))))

(declare-fun lt!477146 () Unit!35344)

(assert (=> b!1075738 (= lt!477146 lt!477152)))

(declare-fun lt!477149 () ListLongMap!14573)

(assert (=> b!1075738 (= lt!477149 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477150 () (_ BitVec 64))

(assert (=> b!1075738 (= lt!477150 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477162 () (_ BitVec 64))

(assert (=> b!1075738 (= lt!477162 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477165 () Unit!35344)

(assert (=> b!1075738 (= lt!477165 (addApplyDifferent!504 lt!477149 lt!477150 zeroValueAfter!47 lt!477162))))

(assert (=> b!1075738 (= (apply!944 (+!3237 lt!477149 (tuple2!16597 lt!477150 zeroValueAfter!47)) lt!477162) (apply!944 lt!477149 lt!477162))))

(declare-fun lt!477163 () Unit!35344)

(assert (=> b!1075738 (= lt!477163 lt!477165)))

(declare-fun lt!477157 () ListLongMap!14573)

(assert (=> b!1075738 (= lt!477157 (getCurrentListMapNoExtraKeys!3899 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477159 () (_ BitVec 64))

(assert (=> b!1075738 (= lt!477159 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477160 () (_ BitVec 64))

(assert (=> b!1075738 (= lt!477160 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075738 (= lt!477156 (addApplyDifferent!504 lt!477157 lt!477159 minValue!907 lt!477160))))

(assert (=> b!1075738 (= (apply!944 (+!3237 lt!477157 (tuple2!16597 lt!477159 minValue!907)) lt!477160) (apply!944 lt!477157 lt!477160))))

(declare-fun b!1075739 () Bool)

(assert (=> b!1075739 (= e!614762 (= (apply!944 lt!477144 (select (arr!33171 _keys!1163) #b00000000000000000000000000000000)) (get!17250 (select (arr!33170 _values!955) #b00000000000000000000000000000000) (dynLambda!2059 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33707 _values!955)))))

(assert (=> b!1075739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33708 _keys!1163)))))

(assert (= (and d!129973 c!108309) b!1075731))

(assert (= (and d!129973 (not c!108309)) b!1075730))

(assert (= (and b!1075730 c!108308) b!1075721))

(assert (= (and b!1075730 (not c!108308)) b!1075722))

(assert (= (and b!1075722 c!108307) b!1075728))

(assert (= (and b!1075722 (not c!108307)) b!1075727))

(assert (= (or b!1075728 b!1075727) bm!45454))

(assert (= (or b!1075721 bm!45454) bm!45456))

(assert (= (or b!1075721 b!1075728) bm!45457))

(assert (= (or b!1075731 bm!45456) bm!45452))

(assert (= (or b!1075731 bm!45457) bm!45453))

(assert (= (and d!129973 res!716927) b!1075724))

(assert (= (and d!129973 c!108310) b!1075738))

(assert (= (and d!129973 (not c!108310)) b!1075719))

(assert (= (and d!129973 res!716932) b!1075729))

(assert (= (and b!1075729 res!716928) b!1075737))

(assert (= (and b!1075729 (not res!716925)) b!1075732))

(assert (= (and b!1075732 res!716931) b!1075739))

(assert (= (and b!1075729 res!716930) b!1075735))

(assert (= (and b!1075735 c!108311) b!1075734))

(assert (= (and b!1075735 (not c!108311)) b!1075723))

(assert (= (and b!1075734 res!716933) b!1075736))

(assert (= (or b!1075734 b!1075723) bm!45458))

(assert (= (and b!1075735 res!716926) b!1075725))

(assert (= (and b!1075725 c!108306) b!1075720))

(assert (= (and b!1075725 (not c!108306)) b!1075726))

(assert (= (and b!1075720 res!716929) b!1075733))

(assert (= (or b!1075720 b!1075726) bm!45455))

(declare-fun b_lambda!16805 () Bool)

(assert (=> (not b_lambda!16805) (not b!1075739)))

(assert (=> b!1075739 t!32490))

(declare-fun b_and!35081 () Bool)

(assert (= b_and!35079 (and (=> t!32490 result!14795) b_and!35081)))

(assert (=> bm!45452 m!994747))

(declare-fun m!994931 () Bool)

(assert (=> bm!45458 m!994931))

(assert (=> b!1075737 m!994813))

(assert (=> b!1075737 m!994813))

(assert (=> b!1075737 m!994817))

(declare-fun m!994933 () Bool)

(assert (=> b!1075736 m!994933))

(assert (=> b!1075732 m!994813))

(assert (=> b!1075732 m!994813))

(declare-fun m!994935 () Bool)

(assert (=> b!1075732 m!994935))

(declare-fun m!994937 () Bool)

(assert (=> bm!45453 m!994937))

(declare-fun m!994939 () Bool)

(assert (=> b!1075738 m!994939))

(declare-fun m!994941 () Bool)

(assert (=> b!1075738 m!994941))

(declare-fun m!994943 () Bool)

(assert (=> b!1075738 m!994943))

(declare-fun m!994945 () Bool)

(assert (=> b!1075738 m!994945))

(declare-fun m!994947 () Bool)

(assert (=> b!1075738 m!994947))

(declare-fun m!994949 () Bool)

(assert (=> b!1075738 m!994949))

(declare-fun m!994951 () Bool)

(assert (=> b!1075738 m!994951))

(declare-fun m!994953 () Bool)

(assert (=> b!1075738 m!994953))

(declare-fun m!994955 () Bool)

(assert (=> b!1075738 m!994955))

(declare-fun m!994957 () Bool)

(assert (=> b!1075738 m!994957))

(declare-fun m!994959 () Bool)

(assert (=> b!1075738 m!994959))

(assert (=> b!1075738 m!994951))

(assert (=> b!1075738 m!994943))

(declare-fun m!994961 () Bool)

(assert (=> b!1075738 m!994961))

(declare-fun m!994963 () Bool)

(assert (=> b!1075738 m!994963))

(declare-fun m!994965 () Bool)

(assert (=> b!1075738 m!994965))

(declare-fun m!994967 () Bool)

(assert (=> b!1075738 m!994967))

(assert (=> b!1075738 m!994747))

(assert (=> b!1075738 m!994961))

(assert (=> b!1075738 m!994813))

(assert (=> b!1075738 m!994939))

(assert (=> b!1075739 m!994825))

(assert (=> b!1075739 m!994823))

(assert (=> b!1075739 m!994813))

(assert (=> b!1075739 m!994823))

(assert (=> b!1075739 m!994825))

(assert (=> b!1075739 m!994827))

(assert (=> b!1075739 m!994813))

(declare-fun m!994969 () Bool)

(assert (=> b!1075739 m!994969))

(assert (=> b!1075724 m!994813))

(assert (=> b!1075724 m!994813))

(assert (=> b!1075724 m!994817))

(declare-fun m!994971 () Bool)

(assert (=> bm!45455 m!994971))

(declare-fun m!994973 () Bool)

(assert (=> b!1075733 m!994973))

(declare-fun m!994975 () Bool)

(assert (=> b!1075731 m!994975))

(assert (=> d!129973 m!994739))

(assert (=> b!1075517 d!129973))

(declare-fun condMapEmpty!40702 () Bool)

(declare-fun mapDefault!40702 () ValueCell!12287)

(assert (=> mapNonEmpty!40693 (= condMapEmpty!40702 (= mapRest!40693 ((as const (Array (_ BitVec 32) ValueCell!12287)) mapDefault!40702)))))

(declare-fun e!614777 () Bool)

(declare-fun mapRes!40702 () Bool)

(assert (=> mapNonEmpty!40693 (= tp!77986 (and e!614777 mapRes!40702))))

(declare-fun mapNonEmpty!40702 () Bool)

(declare-fun tp!78002 () Bool)

(declare-fun e!614776 () Bool)

(assert (=> mapNonEmpty!40702 (= mapRes!40702 (and tp!78002 e!614776))))

(declare-fun mapKey!40702 () (_ BitVec 32))

(declare-fun mapValue!40702 () ValueCell!12287)

(declare-fun mapRest!40702 () (Array (_ BitVec 32) ValueCell!12287))

(assert (=> mapNonEmpty!40702 (= mapRest!40693 (store mapRest!40702 mapKey!40702 mapValue!40702))))

(declare-fun mapIsEmpty!40702 () Bool)

(assert (=> mapIsEmpty!40702 mapRes!40702))

(declare-fun b!1075746 () Bool)

(assert (=> b!1075746 (= e!614776 tp_is_empty!25981)))

(declare-fun b!1075747 () Bool)

(assert (=> b!1075747 (= e!614777 tp_is_empty!25981)))

(assert (= (and mapNonEmpty!40693 condMapEmpty!40702) mapIsEmpty!40702))

(assert (= (and mapNonEmpty!40693 (not condMapEmpty!40702)) mapNonEmpty!40702))

(assert (= (and mapNonEmpty!40702 ((_ is ValueCellFull!12287) mapValue!40702)) b!1075746))

(assert (= (and mapNonEmpty!40693 ((_ is ValueCellFull!12287) mapDefault!40702)) b!1075747))

(declare-fun m!994977 () Bool)

(assert (=> mapNonEmpty!40702 m!994977))

(declare-fun b_lambda!16807 () Bool)

(assert (= b_lambda!16795 (or (and start!95254 b_free!22171) b_lambda!16807)))

(declare-fun b_lambda!16809 () Bool)

(assert (= b_lambda!16797 (or (and start!95254 b_free!22171) b_lambda!16809)))

(declare-fun b_lambda!16811 () Bool)

(assert (= b_lambda!16803 (or (and start!95254 b_free!22171) b_lambda!16811)))

(declare-fun b_lambda!16813 () Bool)

(assert (= b_lambda!16799 (or (and start!95254 b_free!22171) b_lambda!16813)))

(declare-fun b_lambda!16815 () Bool)

(assert (= b_lambda!16805 (or (and start!95254 b_free!22171) b_lambda!16815)))

(declare-fun b_lambda!16817 () Bool)

(assert (= b_lambda!16801 (or (and start!95254 b_free!22171) b_lambda!16817)))

(check-sat (not b!1075737) (not bm!45448) (not b!1075711) (not b!1075600) (not b!1075717) (not b!1075614) (not bm!45446) (not b!1075613) (not bm!45453) (not mapNonEmpty!40702) (not b!1075601) (not b!1075615) (not b!1075599) (not bm!45451) (not bm!45430) (not bm!45423) (not b!1075709) (not b!1075647) (not b!1075733) (not d!129961) (not b!1075603) (not b!1075697) (not b!1075732) (not b!1075704) (not d!129973) (not bm!45452) (not b!1075617) (not b!1075705) (not b!1075731) (not d!129963) (not b!1075633) (not b_next!22171) (not b!1075718) (not b_lambda!16811) (not b!1075606) (not b_lambda!16817) (not b!1075738) (not b!1075739) (not bm!45458) tp_is_empty!25981 (not b!1075611) (not b!1075634) b_and!35081 (not b!1075616) (not b!1075602) (not b_lambda!16807) (not b!1075712) (not b!1075635) (not b!1075706) (not bm!45427) (not bm!45445) (not b_lambda!16809) (not b!1075724) (not b!1075736) (not b_lambda!16813) (not b!1075597) (not b!1075620) (not b!1075710) (not b_lambda!16815) (not b!1075619) (not b!1075649) (not d!129971) (not d!129969) (not bm!45455) (not d!129959) (not b!1075605) (not bm!45424))
(check-sat b_and!35081 (not b_next!22171))
