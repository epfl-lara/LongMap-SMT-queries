; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95278 () Bool)

(assert start!95278)

(declare-fun b_free!22177 () Bool)

(declare-fun b_next!22177 () Bool)

(assert (=> start!95278 (= b_free!22177 (not b_next!22177))))

(declare-fun tp!78008 () Bool)

(declare-fun b_and!35083 () Bool)

(assert (=> start!95278 (= tp!78008 b_and!35083)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39785 0))(
  ( (V!39786 (val!13044 Int)) )
))
(declare-datatypes ((tuple2!16598 0))(
  ( (tuple2!16599 (_1!8310 (_ BitVec 64)) (_2!8310 V!39785)) )
))
(declare-datatypes ((List!23154 0))(
  ( (Nil!23151) (Cons!23150 (h!24368 tuple2!16598) (t!32491 List!23154)) )
))
(declare-datatypes ((ListLongMap!14575 0))(
  ( (ListLongMap!14576 (toList!7303 List!23154)) )
))
(declare-fun lt!477173 () ListLongMap!14575)

(declare-fun e!614796 () Bool)

(declare-datatypes ((ValueCell!12290 0))(
  ( (ValueCellFull!12290 (v!15661 V!39785)) (EmptyCell!12290) )
))
(declare-datatypes ((array!68983 0))(
  ( (array!68984 (arr!33175 (Array (_ BitVec 32) ValueCell!12290)) (size!33712 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68983)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39785)

(declare-fun b!1075769 () Bool)

(declare-fun zeroValueBefore!47 () V!39785)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68985 0))(
  ( (array!68986 (arr!33176 (Array (_ BitVec 32) (_ BitVec 64))) (size!33713 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68985)

(declare-fun getCurrentListMap!4164 (array!68985 array!68983 (_ BitVec 32) (_ BitVec 32) V!39785 V!39785 (_ BitVec 32) Int) ListLongMap!14575)

(declare-fun +!3238 (ListLongMap!14575 tuple2!16598) ListLongMap!14575)

(assert (=> b!1075769 (= e!614796 (= (getCurrentListMap!4164 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3238 lt!477173 (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun b!1075770 () Bool)

(declare-fun e!614800 () Bool)

(assert (=> b!1075770 (= e!614800 e!614796)))

(declare-fun res!716952 () Bool)

(assert (=> b!1075770 (=> res!716952 e!614796)))

(assert (=> b!1075770 (= res!716952 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075771 () Bool)

(declare-fun res!716954 () Bool)

(declare-fun e!614799 () Bool)

(assert (=> b!1075771 (=> (not res!716954) (not e!614799))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1075771 (= res!716954 (and (= (size!33712 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33713 _keys!1163) (size!33712 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075772 () Bool)

(declare-fun res!716953 () Bool)

(assert (=> b!1075772 (=> (not res!716953) (not e!614799))))

(declare-datatypes ((List!23155 0))(
  ( (Nil!23152) (Cons!23151 (h!24369 (_ BitVec 64)) (t!32492 List!23155)) )
))
(declare-fun arrayNoDuplicates!0 (array!68985 (_ BitVec 32) List!23155) Bool)

(assert (=> b!1075772 (= res!716953 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23152))))

(declare-fun b!1075773 () Bool)

(declare-fun e!614798 () Bool)

(declare-fun tp_is_empty!25987 () Bool)

(assert (=> b!1075773 (= e!614798 tp_is_empty!25987)))

(declare-fun mapIsEmpty!40705 () Bool)

(declare-fun mapRes!40705 () Bool)

(assert (=> mapIsEmpty!40705 mapRes!40705))

(declare-fun mapNonEmpty!40705 () Bool)

(declare-fun tp!78007 () Bool)

(declare-fun e!614795 () Bool)

(assert (=> mapNonEmpty!40705 (= mapRes!40705 (and tp!78007 e!614795))))

(declare-fun mapValue!40705 () ValueCell!12290)

(declare-fun mapRest!40705 () (Array (_ BitVec 32) ValueCell!12290))

(declare-fun mapKey!40705 () (_ BitVec 32))

(assert (=> mapNonEmpty!40705 (= (arr!33175 _values!955) (store mapRest!40705 mapKey!40705 mapValue!40705))))

(declare-fun b!1075774 () Bool)

(declare-fun res!716949 () Bool)

(assert (=> b!1075774 (=> (not res!716949) (not e!614799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68985 (_ BitVec 32)) Bool)

(assert (=> b!1075774 (= res!716949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1075775 () Bool)

(declare-fun e!614797 () Bool)

(assert (=> b!1075775 (= e!614799 (not e!614797))))

(declare-fun res!716951 () Bool)

(assert (=> b!1075775 (=> res!716951 e!614797)))

(assert (=> b!1075775 (= res!716951 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1075775 e!614800))

(declare-fun res!716950 () Bool)

(assert (=> b!1075775 (=> (not res!716950) (not e!614800))))

(declare-fun lt!477174 () ListLongMap!14575)

(assert (=> b!1075775 (= res!716950 (= lt!477173 lt!477174))))

(declare-fun zeroValueAfter!47 () V!39785)

(declare-datatypes ((Unit!35348 0))(
  ( (Unit!35349) )
))
(declare-fun lt!477172 () Unit!35348)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!880 (array!68985 array!68983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39785 V!39785 V!39785 V!39785 (_ BitVec 32) Int) Unit!35348)

(assert (=> b!1075775 (= lt!477172 (lemmaNoChangeToArrayThenSameMapNoExtras!880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3900 (array!68985 array!68983 (_ BitVec 32) (_ BitVec 32) V!39785 V!39785 (_ BitVec 32) Int) ListLongMap!14575)

(assert (=> b!1075775 (= lt!477174 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075775 (= lt!477173 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075776 () Bool)

(declare-fun e!614794 () Bool)

(assert (=> b!1075776 (= e!614794 (and e!614798 mapRes!40705))))

(declare-fun condMapEmpty!40705 () Bool)

(declare-fun mapDefault!40705 () ValueCell!12290)

(assert (=> b!1075776 (= condMapEmpty!40705 (= (arr!33175 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12290)) mapDefault!40705)))))

(declare-fun b!1075777 () Bool)

(assert (=> b!1075777 (= e!614795 tp_is_empty!25987)))

(declare-fun res!716948 () Bool)

(assert (=> start!95278 (=> (not res!716948) (not e!614799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95278 (= res!716948 (validMask!0 mask!1515))))

(assert (=> start!95278 e!614799))

(assert (=> start!95278 true))

(assert (=> start!95278 tp_is_empty!25987))

(declare-fun array_inv!25678 (array!68983) Bool)

(assert (=> start!95278 (and (array_inv!25678 _values!955) e!614794)))

(assert (=> start!95278 tp!78008))

(declare-fun array_inv!25679 (array!68985) Bool)

(assert (=> start!95278 (array_inv!25679 _keys!1163)))

(declare-fun b!1075768 () Bool)

(assert (=> b!1075768 (= e!614797 (= (getCurrentListMap!4164 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477174))))

(assert (= (and start!95278 res!716948) b!1075771))

(assert (= (and b!1075771 res!716954) b!1075774))

(assert (= (and b!1075774 res!716949) b!1075772))

(assert (= (and b!1075772 res!716953) b!1075775))

(assert (= (and b!1075775 res!716950) b!1075770))

(assert (= (and b!1075770 (not res!716952)) b!1075769))

(assert (= (and b!1075775 (not res!716951)) b!1075768))

(assert (= (and b!1075776 condMapEmpty!40705) mapIsEmpty!40705))

(assert (= (and b!1075776 (not condMapEmpty!40705)) mapNonEmpty!40705))

(get-info :version)

(assert (= (and mapNonEmpty!40705 ((_ is ValueCellFull!12290) mapValue!40705)) b!1075777))

(assert (= (and b!1075776 ((_ is ValueCellFull!12290) mapDefault!40705)) b!1075773))

(assert (= start!95278 b!1075776))

(declare-fun m!994979 () Bool)

(assert (=> mapNonEmpty!40705 m!994979))

(declare-fun m!994981 () Bool)

(assert (=> b!1075769 m!994981))

(declare-fun m!994983 () Bool)

(assert (=> b!1075769 m!994983))

(declare-fun m!994985 () Bool)

(assert (=> b!1075772 m!994985))

(declare-fun m!994987 () Bool)

(assert (=> b!1075768 m!994987))

(declare-fun m!994989 () Bool)

(assert (=> start!95278 m!994989))

(declare-fun m!994991 () Bool)

(assert (=> start!95278 m!994991))

(declare-fun m!994993 () Bool)

(assert (=> start!95278 m!994993))

(declare-fun m!994995 () Bool)

(assert (=> b!1075775 m!994995))

(declare-fun m!994997 () Bool)

(assert (=> b!1075775 m!994997))

(declare-fun m!994999 () Bool)

(assert (=> b!1075775 m!994999))

(declare-fun m!995001 () Bool)

(assert (=> b!1075774 m!995001))

(check-sat (not b!1075772) (not b_next!22177) (not mapNonEmpty!40705) b_and!35083 (not b!1075775) (not b!1075774) tp_is_empty!25987 (not b!1075768) (not b!1075769) (not start!95278))
(check-sat b_and!35083 (not b_next!22177))
(get-model)

(declare-fun b!1075880 () Bool)

(declare-fun e!614877 () Bool)

(declare-fun call!45478 () Bool)

(assert (=> b!1075880 (= e!614877 (not call!45478))))

(declare-fun b!1075881 () Bool)

(declare-fun e!614888 () Bool)

(declare-fun lt!477251 () ListLongMap!14575)

(declare-fun apply!945 (ListLongMap!14575 (_ BitVec 64)) V!39785)

(assert (=> b!1075881 (= e!614888 (= (apply!945 lt!477251 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun call!45480 () ListLongMap!14575)

(declare-fun bm!45473 () Bool)

(assert (=> bm!45473 (= call!45480 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45474 () Bool)

(declare-fun call!45479 () ListLongMap!14575)

(declare-fun call!45481 () ListLongMap!14575)

(assert (=> bm!45474 (= call!45479 call!45481)))

(declare-fun b!1075883 () Bool)

(declare-fun e!614881 () Bool)

(assert (=> b!1075883 (= e!614881 e!614888)))

(declare-fun res!717022 () Bool)

(declare-fun call!45482 () Bool)

(assert (=> b!1075883 (= res!717022 call!45482)))

(assert (=> b!1075883 (=> (not res!717022) (not e!614888))))

(declare-fun b!1075884 () Bool)

(declare-fun e!614885 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075884 (= e!614885 (validKeyInArray!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075885 () Bool)

(declare-fun res!717023 () Bool)

(declare-fun e!614882 () Bool)

(assert (=> b!1075885 (=> (not res!717023) (not e!614882))))

(assert (=> b!1075885 (= res!717023 e!614881)))

(declare-fun c!108328 () Bool)

(assert (=> b!1075885 (= c!108328 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075886 () Bool)

(declare-fun e!614879 () Bool)

(declare-fun e!614878 () Bool)

(assert (=> b!1075886 (= e!614879 e!614878)))

(declare-fun res!717021 () Bool)

(assert (=> b!1075886 (=> (not res!717021) (not e!614878))))

(declare-fun contains!6362 (ListLongMap!14575 (_ BitVec 64)) Bool)

(assert (=> b!1075886 (= res!717021 (contains!6362 lt!477251 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075886 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun b!1075887 () Bool)

(declare-fun e!614880 () ListLongMap!14575)

(declare-fun call!45477 () ListLongMap!14575)

(assert (=> b!1075887 (= e!614880 call!45477)))

(declare-fun b!1075888 () Bool)

(declare-fun e!614887 () ListLongMap!14575)

(declare-fun call!45476 () ListLongMap!14575)

(assert (=> b!1075888 (= e!614887 (+!3238 call!45476 (tuple2!16599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45475 () Bool)

(assert (=> bm!45475 (= call!45478 (contains!6362 lt!477251 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075889 () Bool)

(declare-fun c!108326 () Bool)

(assert (=> b!1075889 (= c!108326 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614883 () ListLongMap!14575)

(assert (=> b!1075889 (= e!614880 e!614883)))

(declare-fun b!1075890 () Bool)

(assert (=> b!1075890 (= e!614883 call!45477)))

(declare-fun b!1075891 () Bool)

(assert (=> b!1075891 (= e!614881 (not call!45482))))

(declare-fun b!1075892 () Bool)

(assert (=> b!1075892 (= e!614887 e!614880)))

(declare-fun c!108324 () Bool)

(assert (=> b!1075892 (= c!108324 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075893 () Bool)

(declare-fun res!717016 () Bool)

(assert (=> b!1075893 (=> (not res!717016) (not e!614882))))

(assert (=> b!1075893 (= res!717016 e!614879)))

(declare-fun res!717017 () Bool)

(assert (=> b!1075893 (=> res!717017 e!614879)))

(declare-fun e!614886 () Bool)

(assert (=> b!1075893 (= res!717017 (not e!614886))))

(declare-fun res!717019 () Bool)

(assert (=> b!1075893 (=> (not res!717019) (not e!614886))))

(assert (=> b!1075893 (= res!717019 (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun b!1075894 () Bool)

(assert (=> b!1075894 (= e!614886 (validKeyInArray!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45476 () Bool)

(assert (=> bm!45476 (= call!45482 (contains!6362 lt!477251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45477 () Bool)

(assert (=> bm!45477 (= call!45477 call!45476)))

(declare-fun bm!45478 () Bool)

(declare-fun c!108325 () Bool)

(assert (=> bm!45478 (= call!45476 (+!3238 (ite c!108325 call!45480 (ite c!108324 call!45481 call!45479)) (ite (or c!108325 c!108324) (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075882 () Bool)

(declare-fun e!614884 () Bool)

(assert (=> b!1075882 (= e!614877 e!614884)))

(declare-fun res!717015 () Bool)

(assert (=> b!1075882 (= res!717015 call!45478)))

(assert (=> b!1075882 (=> (not res!717015) (not e!614884))))

(declare-fun d!129977 () Bool)

(assert (=> d!129977 e!614882))

(declare-fun res!717018 () Bool)

(assert (=> d!129977 (=> (not res!717018) (not e!614882))))

(assert (=> d!129977 (= res!717018 (or (bvsge #b00000000000000000000000000000000 (size!33713 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))))

(declare-fun lt!477253 () ListLongMap!14575)

(assert (=> d!129977 (= lt!477251 lt!477253)))

(declare-fun lt!477247 () Unit!35348)

(declare-fun e!614876 () Unit!35348)

(assert (=> d!129977 (= lt!477247 e!614876)))

(declare-fun c!108329 () Bool)

(assert (=> d!129977 (= c!108329 e!614885)))

(declare-fun res!717020 () Bool)

(assert (=> d!129977 (=> (not res!717020) (not e!614885))))

(assert (=> d!129977 (= res!717020 (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(assert (=> d!129977 (= lt!477253 e!614887)))

(assert (=> d!129977 (= c!108325 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129977 (validMask!0 mask!1515)))

(assert (=> d!129977 (= (getCurrentListMap!4164 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477251)))

(declare-fun b!1075895 () Bool)

(assert (=> b!1075895 (= e!614884 (= (apply!945 lt!477251 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075896 () Bool)

(assert (=> b!1075896 (= e!614883 call!45479)))

(declare-fun b!1075897 () Bool)

(assert (=> b!1075897 (= e!614882 e!614877)))

(declare-fun c!108327 () Bool)

(assert (=> b!1075897 (= c!108327 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075898 () Bool)

(declare-fun Unit!35352 () Unit!35348)

(assert (=> b!1075898 (= e!614876 Unit!35352)))

(declare-fun bm!45479 () Bool)

(assert (=> bm!45479 (= call!45481 call!45480)))

(declare-fun b!1075899 () Bool)

(declare-fun get!17253 (ValueCell!12290 V!39785) V!39785)

(declare-fun dynLambda!2060 (Int (_ BitVec 64)) V!39785)

(assert (=> b!1075899 (= e!614878 (= (apply!945 lt!477251 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)) (get!17253 (select (arr!33175 _values!955) #b00000000000000000000000000000000) (dynLambda!2060 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075899 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33712 _values!955)))))

(assert (=> b!1075899 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun b!1075900 () Bool)

(declare-fun lt!477258 () Unit!35348)

(assert (=> b!1075900 (= e!614876 lt!477258)))

(declare-fun lt!477242 () ListLongMap!14575)

(assert (=> b!1075900 (= lt!477242 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477237 () (_ BitVec 64))

(assert (=> b!1075900 (= lt!477237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477250 () (_ BitVec 64))

(assert (=> b!1075900 (= lt!477250 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477252 () Unit!35348)

(declare-fun addStillContains!649 (ListLongMap!14575 (_ BitVec 64) V!39785 (_ BitVec 64)) Unit!35348)

(assert (=> b!1075900 (= lt!477252 (addStillContains!649 lt!477242 lt!477237 zeroValueAfter!47 lt!477250))))

(assert (=> b!1075900 (contains!6362 (+!3238 lt!477242 (tuple2!16599 lt!477237 zeroValueAfter!47)) lt!477250)))

(declare-fun lt!477241 () Unit!35348)

(assert (=> b!1075900 (= lt!477241 lt!477252)))

(declare-fun lt!477248 () ListLongMap!14575)

(assert (=> b!1075900 (= lt!477248 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477243 () (_ BitVec 64))

(assert (=> b!1075900 (= lt!477243 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477255 () (_ BitVec 64))

(assert (=> b!1075900 (= lt!477255 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477244 () Unit!35348)

(declare-fun addApplyDifferent!505 (ListLongMap!14575 (_ BitVec 64) V!39785 (_ BitVec 64)) Unit!35348)

(assert (=> b!1075900 (= lt!477244 (addApplyDifferent!505 lt!477248 lt!477243 minValue!907 lt!477255))))

(assert (=> b!1075900 (= (apply!945 (+!3238 lt!477248 (tuple2!16599 lt!477243 minValue!907)) lt!477255) (apply!945 lt!477248 lt!477255))))

(declare-fun lt!477256 () Unit!35348)

(assert (=> b!1075900 (= lt!477256 lt!477244)))

(declare-fun lt!477254 () ListLongMap!14575)

(assert (=> b!1075900 (= lt!477254 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477240 () (_ BitVec 64))

(assert (=> b!1075900 (= lt!477240 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477238 () (_ BitVec 64))

(assert (=> b!1075900 (= lt!477238 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477257 () Unit!35348)

(assert (=> b!1075900 (= lt!477257 (addApplyDifferent!505 lt!477254 lt!477240 zeroValueAfter!47 lt!477238))))

(assert (=> b!1075900 (= (apply!945 (+!3238 lt!477254 (tuple2!16599 lt!477240 zeroValueAfter!47)) lt!477238) (apply!945 lt!477254 lt!477238))))

(declare-fun lt!477245 () Unit!35348)

(assert (=> b!1075900 (= lt!477245 lt!477257)))

(declare-fun lt!477239 () ListLongMap!14575)

(assert (=> b!1075900 (= lt!477239 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477249 () (_ BitVec 64))

(assert (=> b!1075900 (= lt!477249 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477246 () (_ BitVec 64))

(assert (=> b!1075900 (= lt!477246 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075900 (= lt!477258 (addApplyDifferent!505 lt!477239 lt!477249 minValue!907 lt!477246))))

(assert (=> b!1075900 (= (apply!945 (+!3238 lt!477239 (tuple2!16599 lt!477249 minValue!907)) lt!477246) (apply!945 lt!477239 lt!477246))))

(assert (= (and d!129977 c!108325) b!1075888))

(assert (= (and d!129977 (not c!108325)) b!1075892))

(assert (= (and b!1075892 c!108324) b!1075887))

(assert (= (and b!1075892 (not c!108324)) b!1075889))

(assert (= (and b!1075889 c!108326) b!1075890))

(assert (= (and b!1075889 (not c!108326)) b!1075896))

(assert (= (or b!1075890 b!1075896) bm!45474))

(assert (= (or b!1075887 bm!45474) bm!45479))

(assert (= (or b!1075887 b!1075890) bm!45477))

(assert (= (or b!1075888 bm!45479) bm!45473))

(assert (= (or b!1075888 bm!45477) bm!45478))

(assert (= (and d!129977 res!717020) b!1075884))

(assert (= (and d!129977 c!108329) b!1075900))

(assert (= (and d!129977 (not c!108329)) b!1075898))

(assert (= (and d!129977 res!717018) b!1075893))

(assert (= (and b!1075893 res!717019) b!1075894))

(assert (= (and b!1075893 (not res!717017)) b!1075886))

(assert (= (and b!1075886 res!717021) b!1075899))

(assert (= (and b!1075893 res!717016) b!1075885))

(assert (= (and b!1075885 c!108328) b!1075883))

(assert (= (and b!1075885 (not c!108328)) b!1075891))

(assert (= (and b!1075883 res!717022) b!1075881))

(assert (= (or b!1075883 b!1075891) bm!45476))

(assert (= (and b!1075885 res!717023) b!1075897))

(assert (= (and b!1075897 c!108327) b!1075882))

(assert (= (and b!1075897 (not c!108327)) b!1075880))

(assert (= (and b!1075882 res!717015) b!1075895))

(assert (= (or b!1075882 b!1075880) bm!45475))

(declare-fun b_lambda!16819 () Bool)

(assert (=> (not b_lambda!16819) (not b!1075899)))

(declare-fun t!32497 () Bool)

(declare-fun tb!7159 () Bool)

(assert (=> (and start!95278 (= defaultEntry!963 defaultEntry!963) t!32497) tb!7159))

(declare-fun result!14801 () Bool)

(assert (=> tb!7159 (= result!14801 tp_is_empty!25987)))

(assert (=> b!1075899 t!32497))

(declare-fun b_and!35089 () Bool)

(assert (= b_and!35083 (and (=> t!32497 result!14801) b_and!35089)))

(declare-fun m!995051 () Bool)

(assert (=> b!1075884 m!995051))

(assert (=> b!1075884 m!995051))

(declare-fun m!995053 () Bool)

(assert (=> b!1075884 m!995053))

(assert (=> b!1075886 m!995051))

(assert (=> b!1075886 m!995051))

(declare-fun m!995055 () Bool)

(assert (=> b!1075886 m!995055))

(declare-fun m!995057 () Bool)

(assert (=> bm!45476 m!995057))

(declare-fun m!995059 () Bool)

(assert (=> b!1075881 m!995059))

(assert (=> d!129977 m!994989))

(declare-fun m!995061 () Bool)

(assert (=> b!1075888 m!995061))

(declare-fun m!995063 () Bool)

(assert (=> b!1075900 m!995063))

(declare-fun m!995065 () Bool)

(assert (=> b!1075900 m!995065))

(declare-fun m!995067 () Bool)

(assert (=> b!1075900 m!995067))

(assert (=> b!1075900 m!995063))

(declare-fun m!995069 () Bool)

(assert (=> b!1075900 m!995069))

(declare-fun m!995071 () Bool)

(assert (=> b!1075900 m!995071))

(declare-fun m!995073 () Bool)

(assert (=> b!1075900 m!995073))

(declare-fun m!995075 () Bool)

(assert (=> b!1075900 m!995075))

(declare-fun m!995077 () Bool)

(assert (=> b!1075900 m!995077))

(declare-fun m!995079 () Bool)

(assert (=> b!1075900 m!995079))

(declare-fun m!995081 () Bool)

(assert (=> b!1075900 m!995081))

(assert (=> b!1075900 m!995079))

(assert (=> b!1075900 m!995051))

(assert (=> b!1075900 m!995077))

(declare-fun m!995083 () Bool)

(assert (=> b!1075900 m!995083))

(assert (=> b!1075900 m!995073))

(declare-fun m!995085 () Bool)

(assert (=> b!1075900 m!995085))

(declare-fun m!995087 () Bool)

(assert (=> b!1075900 m!995087))

(declare-fun m!995089 () Bool)

(assert (=> b!1075900 m!995089))

(declare-fun m!995091 () Bool)

(assert (=> b!1075900 m!995091))

(assert (=> b!1075900 m!994997))

(assert (=> bm!45473 m!994997))

(declare-fun m!995093 () Bool)

(assert (=> b!1075895 m!995093))

(assert (=> b!1075899 m!995051))

(declare-fun m!995095 () Bool)

(assert (=> b!1075899 m!995095))

(declare-fun m!995097 () Bool)

(assert (=> b!1075899 m!995097))

(assert (=> b!1075899 m!995095))

(assert (=> b!1075899 m!995097))

(declare-fun m!995099 () Bool)

(assert (=> b!1075899 m!995099))

(assert (=> b!1075899 m!995051))

(declare-fun m!995101 () Bool)

(assert (=> b!1075899 m!995101))

(declare-fun m!995103 () Bool)

(assert (=> bm!45478 m!995103))

(declare-fun m!995105 () Bool)

(assert (=> bm!45475 m!995105))

(assert (=> b!1075894 m!995051))

(assert (=> b!1075894 m!995051))

(assert (=> b!1075894 m!995053))

(assert (=> b!1075768 d!129977))

(declare-fun d!129979 () Bool)

(declare-fun res!717031 () Bool)

(declare-fun e!614899 () Bool)

(assert (=> d!129979 (=> res!717031 e!614899)))

(assert (=> d!129979 (= res!717031 (bvsge #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(assert (=> d!129979 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23152) e!614899)))

(declare-fun b!1075913 () Bool)

(declare-fun e!614897 () Bool)

(declare-fun call!45485 () Bool)

(assert (=> b!1075913 (= e!614897 call!45485)))

(declare-fun b!1075914 () Bool)

(declare-fun e!614900 () Bool)

(declare-fun contains!6363 (List!23155 (_ BitVec 64)) Bool)

(assert (=> b!1075914 (= e!614900 (contains!6363 Nil!23152 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075915 () Bool)

(assert (=> b!1075915 (= e!614897 call!45485)))

(declare-fun b!1075916 () Bool)

(declare-fun e!614898 () Bool)

(assert (=> b!1075916 (= e!614899 e!614898)))

(declare-fun res!717032 () Bool)

(assert (=> b!1075916 (=> (not res!717032) (not e!614898))))

(assert (=> b!1075916 (= res!717032 (not e!614900))))

(declare-fun res!717030 () Bool)

(assert (=> b!1075916 (=> (not res!717030) (not e!614900))))

(assert (=> b!1075916 (= res!717030 (validKeyInArray!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45482 () Bool)

(declare-fun c!108332 () Bool)

(assert (=> bm!45482 (= call!45485 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108332 (Cons!23151 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000) Nil!23152) Nil!23152)))))

(declare-fun b!1075917 () Bool)

(assert (=> b!1075917 (= e!614898 e!614897)))

(assert (=> b!1075917 (= c!108332 (validKeyInArray!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129979 (not res!717031)) b!1075916))

(assert (= (and b!1075916 res!717030) b!1075914))

(assert (= (and b!1075916 res!717032) b!1075917))

(assert (= (and b!1075917 c!108332) b!1075915))

(assert (= (and b!1075917 (not c!108332)) b!1075913))

(assert (= (or b!1075915 b!1075913) bm!45482))

(assert (=> b!1075914 m!995051))

(assert (=> b!1075914 m!995051))

(declare-fun m!995107 () Bool)

(assert (=> b!1075914 m!995107))

(assert (=> b!1075916 m!995051))

(assert (=> b!1075916 m!995051))

(assert (=> b!1075916 m!995053))

(assert (=> bm!45482 m!995051))

(declare-fun m!995109 () Bool)

(assert (=> bm!45482 m!995109))

(assert (=> b!1075917 m!995051))

(assert (=> b!1075917 m!995051))

(assert (=> b!1075917 m!995053))

(assert (=> b!1075772 d!129979))

(declare-fun d!129981 () Bool)

(assert (=> d!129981 (= (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477261 () Unit!35348)

(declare-fun choose!1755 (array!68985 array!68983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39785 V!39785 V!39785 V!39785 (_ BitVec 32) Int) Unit!35348)

(assert (=> d!129981 (= lt!477261 (choose!1755 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129981 (validMask!0 mask!1515)))

(assert (=> d!129981 (= (lemmaNoChangeToArrayThenSameMapNoExtras!880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477261)))

(declare-fun bs!31685 () Bool)

(assert (= bs!31685 d!129981))

(assert (=> bs!31685 m!994999))

(assert (=> bs!31685 m!994997))

(declare-fun m!995111 () Bool)

(assert (=> bs!31685 m!995111))

(assert (=> bs!31685 m!994989))

(assert (=> b!1075775 d!129981))

(declare-fun b!1075942 () Bool)

(declare-fun e!614917 () ListLongMap!14575)

(declare-fun call!45488 () ListLongMap!14575)

(assert (=> b!1075942 (= e!614917 call!45488)))

(declare-fun bm!45485 () Bool)

(assert (=> bm!45485 (= call!45488 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075943 () Bool)

(declare-fun e!614916 () ListLongMap!14575)

(assert (=> b!1075943 (= e!614916 e!614917)))

(declare-fun c!108343 () Bool)

(assert (=> b!1075943 (= c!108343 (validKeyInArray!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075944 () Bool)

(declare-fun e!614920 () Bool)

(assert (=> b!1075944 (= e!614920 (validKeyInArray!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075944 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075945 () Bool)

(declare-fun e!614918 () Bool)

(declare-fun e!614919 () Bool)

(assert (=> b!1075945 (= e!614918 e!614919)))

(assert (=> b!1075945 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun res!717044 () Bool)

(declare-fun lt!477276 () ListLongMap!14575)

(assert (=> b!1075945 (= res!717044 (contains!6362 lt!477276 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075945 (=> (not res!717044) (not e!614919))))

(declare-fun b!1075946 () Bool)

(declare-fun e!614921 () Bool)

(assert (=> b!1075946 (= e!614921 e!614918)))

(declare-fun c!108344 () Bool)

(assert (=> b!1075946 (= c!108344 e!614920)))

(declare-fun res!717041 () Bool)

(assert (=> b!1075946 (=> (not res!717041) (not e!614920))))

(assert (=> b!1075946 (= res!717041 (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun d!129983 () Bool)

(assert (=> d!129983 e!614921))

(declare-fun res!717043 () Bool)

(assert (=> d!129983 (=> (not res!717043) (not e!614921))))

(assert (=> d!129983 (= res!717043 (not (contains!6362 lt!477276 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129983 (= lt!477276 e!614916)))

(declare-fun c!108341 () Bool)

(assert (=> d!129983 (= c!108341 (bvsge #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(assert (=> d!129983 (validMask!0 mask!1515)))

(assert (=> d!129983 (= (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477276)))

(declare-fun b!1075947 () Bool)

(declare-fun e!614915 () Bool)

(assert (=> b!1075947 (= e!614918 e!614915)))

(declare-fun c!108342 () Bool)

(assert (=> b!1075947 (= c!108342 (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun b!1075948 () Bool)

(declare-fun isEmpty!958 (ListLongMap!14575) Bool)

(assert (=> b!1075948 (= e!614915 (isEmpty!958 lt!477276))))

(declare-fun b!1075949 () Bool)

(assert (=> b!1075949 (= e!614915 (= lt!477276 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075950 () Bool)

(declare-fun res!717042 () Bool)

(assert (=> b!1075950 (=> (not res!717042) (not e!614921))))

(assert (=> b!1075950 (= res!717042 (not (contains!6362 lt!477276 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075951 () Bool)

(assert (=> b!1075951 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(assert (=> b!1075951 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33712 _values!955)))))

(assert (=> b!1075951 (= e!614919 (= (apply!945 lt!477276 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)) (get!17253 (select (arr!33175 _values!955) #b00000000000000000000000000000000) (dynLambda!2060 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075952 () Bool)

(assert (=> b!1075952 (= e!614916 (ListLongMap!14576 Nil!23151))))

(declare-fun b!1075953 () Bool)

(declare-fun lt!477282 () Unit!35348)

(declare-fun lt!477279 () Unit!35348)

(assert (=> b!1075953 (= lt!477282 lt!477279)))

(declare-fun lt!477278 () ListLongMap!14575)

(declare-fun lt!477280 () (_ BitVec 64))

(declare-fun lt!477277 () (_ BitVec 64))

(declare-fun lt!477281 () V!39785)

(assert (=> b!1075953 (not (contains!6362 (+!3238 lt!477278 (tuple2!16599 lt!477277 lt!477281)) lt!477280))))

(declare-fun addStillNotContains!266 (ListLongMap!14575 (_ BitVec 64) V!39785 (_ BitVec 64)) Unit!35348)

(assert (=> b!1075953 (= lt!477279 (addStillNotContains!266 lt!477278 lt!477277 lt!477281 lt!477280))))

(assert (=> b!1075953 (= lt!477280 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075953 (= lt!477281 (get!17253 (select (arr!33175 _values!955) #b00000000000000000000000000000000) (dynLambda!2060 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075953 (= lt!477277 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075953 (= lt!477278 call!45488)))

(assert (=> b!1075953 (= e!614917 (+!3238 call!45488 (tuple2!16599 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000) (get!17253 (select (arr!33175 _values!955) #b00000000000000000000000000000000) (dynLambda!2060 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!129983 c!108341) b!1075952))

(assert (= (and d!129983 (not c!108341)) b!1075943))

(assert (= (and b!1075943 c!108343) b!1075953))

(assert (= (and b!1075943 (not c!108343)) b!1075942))

(assert (= (or b!1075953 b!1075942) bm!45485))

(assert (= (and d!129983 res!717043) b!1075950))

(assert (= (and b!1075950 res!717042) b!1075946))

(assert (= (and b!1075946 res!717041) b!1075944))

(assert (= (and b!1075946 c!108344) b!1075945))

(assert (= (and b!1075946 (not c!108344)) b!1075947))

(assert (= (and b!1075945 res!717044) b!1075951))

(assert (= (and b!1075947 c!108342) b!1075949))

(assert (= (and b!1075947 (not c!108342)) b!1075948))

(declare-fun b_lambda!16821 () Bool)

(assert (=> (not b_lambda!16821) (not b!1075951)))

(assert (=> b!1075951 t!32497))

(declare-fun b_and!35091 () Bool)

(assert (= b_and!35089 (and (=> t!32497 result!14801) b_and!35091)))

(declare-fun b_lambda!16823 () Bool)

(assert (=> (not b_lambda!16823) (not b!1075953)))

(assert (=> b!1075953 t!32497))

(declare-fun b_and!35093 () Bool)

(assert (= b_and!35091 (and (=> t!32497 result!14801) b_and!35093)))

(declare-fun m!995113 () Bool)

(assert (=> b!1075948 m!995113))

(assert (=> b!1075951 m!995051))

(assert (=> b!1075951 m!995097))

(assert (=> b!1075951 m!995051))

(declare-fun m!995115 () Bool)

(assert (=> b!1075951 m!995115))

(assert (=> b!1075951 m!995095))

(assert (=> b!1075951 m!995097))

(assert (=> b!1075951 m!995099))

(assert (=> b!1075951 m!995095))

(declare-fun m!995117 () Bool)

(assert (=> b!1075950 m!995117))

(assert (=> b!1075945 m!995051))

(assert (=> b!1075945 m!995051))

(declare-fun m!995119 () Bool)

(assert (=> b!1075945 m!995119))

(declare-fun m!995121 () Bool)

(assert (=> b!1075953 m!995121))

(assert (=> b!1075953 m!995121))

(declare-fun m!995123 () Bool)

(assert (=> b!1075953 m!995123))

(declare-fun m!995125 () Bool)

(assert (=> b!1075953 m!995125))

(assert (=> b!1075953 m!995051))

(assert (=> b!1075953 m!995097))

(assert (=> b!1075953 m!995095))

(assert (=> b!1075953 m!995097))

(assert (=> b!1075953 m!995099))

(assert (=> b!1075953 m!995095))

(declare-fun m!995127 () Bool)

(assert (=> b!1075953 m!995127))

(declare-fun m!995129 () Bool)

(assert (=> bm!45485 m!995129))

(declare-fun m!995131 () Bool)

(assert (=> d!129983 m!995131))

(assert (=> d!129983 m!994989))

(assert (=> b!1075943 m!995051))

(assert (=> b!1075943 m!995051))

(assert (=> b!1075943 m!995053))

(assert (=> b!1075949 m!995129))

(assert (=> b!1075944 m!995051))

(assert (=> b!1075944 m!995051))

(assert (=> b!1075944 m!995053))

(assert (=> b!1075775 d!129983))

(declare-fun b!1075954 () Bool)

(declare-fun e!614924 () ListLongMap!14575)

(declare-fun call!45489 () ListLongMap!14575)

(assert (=> b!1075954 (= e!614924 call!45489)))

(declare-fun bm!45486 () Bool)

(assert (=> bm!45486 (= call!45489 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075955 () Bool)

(declare-fun e!614923 () ListLongMap!14575)

(assert (=> b!1075955 (= e!614923 e!614924)))

(declare-fun c!108347 () Bool)

(assert (=> b!1075955 (= c!108347 (validKeyInArray!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075956 () Bool)

(declare-fun e!614927 () Bool)

(assert (=> b!1075956 (= e!614927 (validKeyInArray!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075956 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075957 () Bool)

(declare-fun e!614925 () Bool)

(declare-fun e!614926 () Bool)

(assert (=> b!1075957 (= e!614925 e!614926)))

(assert (=> b!1075957 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun res!717048 () Bool)

(declare-fun lt!477283 () ListLongMap!14575)

(assert (=> b!1075957 (= res!717048 (contains!6362 lt!477283 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075957 (=> (not res!717048) (not e!614926))))

(declare-fun b!1075958 () Bool)

(declare-fun e!614928 () Bool)

(assert (=> b!1075958 (= e!614928 e!614925)))

(declare-fun c!108348 () Bool)

(assert (=> b!1075958 (= c!108348 e!614927)))

(declare-fun res!717045 () Bool)

(assert (=> b!1075958 (=> (not res!717045) (not e!614927))))

(assert (=> b!1075958 (= res!717045 (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun d!129985 () Bool)

(assert (=> d!129985 e!614928))

(declare-fun res!717047 () Bool)

(assert (=> d!129985 (=> (not res!717047) (not e!614928))))

(assert (=> d!129985 (= res!717047 (not (contains!6362 lt!477283 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129985 (= lt!477283 e!614923)))

(declare-fun c!108345 () Bool)

(assert (=> d!129985 (= c!108345 (bvsge #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(assert (=> d!129985 (validMask!0 mask!1515)))

(assert (=> d!129985 (= (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477283)))

(declare-fun b!1075959 () Bool)

(declare-fun e!614922 () Bool)

(assert (=> b!1075959 (= e!614925 e!614922)))

(declare-fun c!108346 () Bool)

(assert (=> b!1075959 (= c!108346 (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun b!1075960 () Bool)

(assert (=> b!1075960 (= e!614922 (isEmpty!958 lt!477283))))

(declare-fun b!1075961 () Bool)

(assert (=> b!1075961 (= e!614922 (= lt!477283 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075962 () Bool)

(declare-fun res!717046 () Bool)

(assert (=> b!1075962 (=> (not res!717046) (not e!614928))))

(assert (=> b!1075962 (= res!717046 (not (contains!6362 lt!477283 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075963 () Bool)

(assert (=> b!1075963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(assert (=> b!1075963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33712 _values!955)))))

(assert (=> b!1075963 (= e!614926 (= (apply!945 lt!477283 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)) (get!17253 (select (arr!33175 _values!955) #b00000000000000000000000000000000) (dynLambda!2060 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075964 () Bool)

(assert (=> b!1075964 (= e!614923 (ListLongMap!14576 Nil!23151))))

(declare-fun b!1075965 () Bool)

(declare-fun lt!477289 () Unit!35348)

(declare-fun lt!477286 () Unit!35348)

(assert (=> b!1075965 (= lt!477289 lt!477286)))

(declare-fun lt!477285 () ListLongMap!14575)

(declare-fun lt!477288 () V!39785)

(declare-fun lt!477284 () (_ BitVec 64))

(declare-fun lt!477287 () (_ BitVec 64))

(assert (=> b!1075965 (not (contains!6362 (+!3238 lt!477285 (tuple2!16599 lt!477284 lt!477288)) lt!477287))))

(assert (=> b!1075965 (= lt!477286 (addStillNotContains!266 lt!477285 lt!477284 lt!477288 lt!477287))))

(assert (=> b!1075965 (= lt!477287 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075965 (= lt!477288 (get!17253 (select (arr!33175 _values!955) #b00000000000000000000000000000000) (dynLambda!2060 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075965 (= lt!477284 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075965 (= lt!477285 call!45489)))

(assert (=> b!1075965 (= e!614924 (+!3238 call!45489 (tuple2!16599 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000) (get!17253 (select (arr!33175 _values!955) #b00000000000000000000000000000000) (dynLambda!2060 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!129985 c!108345) b!1075964))

(assert (= (and d!129985 (not c!108345)) b!1075955))

(assert (= (and b!1075955 c!108347) b!1075965))

(assert (= (and b!1075955 (not c!108347)) b!1075954))

(assert (= (or b!1075965 b!1075954) bm!45486))

(assert (= (and d!129985 res!717047) b!1075962))

(assert (= (and b!1075962 res!717046) b!1075958))

(assert (= (and b!1075958 res!717045) b!1075956))

(assert (= (and b!1075958 c!108348) b!1075957))

(assert (= (and b!1075958 (not c!108348)) b!1075959))

(assert (= (and b!1075957 res!717048) b!1075963))

(assert (= (and b!1075959 c!108346) b!1075961))

(assert (= (and b!1075959 (not c!108346)) b!1075960))

(declare-fun b_lambda!16825 () Bool)

(assert (=> (not b_lambda!16825) (not b!1075963)))

(assert (=> b!1075963 t!32497))

(declare-fun b_and!35095 () Bool)

(assert (= b_and!35093 (and (=> t!32497 result!14801) b_and!35095)))

(declare-fun b_lambda!16827 () Bool)

(assert (=> (not b_lambda!16827) (not b!1075965)))

(assert (=> b!1075965 t!32497))

(declare-fun b_and!35097 () Bool)

(assert (= b_and!35095 (and (=> t!32497 result!14801) b_and!35097)))

(declare-fun m!995133 () Bool)

(assert (=> b!1075960 m!995133))

(assert (=> b!1075963 m!995051))

(assert (=> b!1075963 m!995097))

(assert (=> b!1075963 m!995051))

(declare-fun m!995135 () Bool)

(assert (=> b!1075963 m!995135))

(assert (=> b!1075963 m!995095))

(assert (=> b!1075963 m!995097))

(assert (=> b!1075963 m!995099))

(assert (=> b!1075963 m!995095))

(declare-fun m!995137 () Bool)

(assert (=> b!1075962 m!995137))

(assert (=> b!1075957 m!995051))

(assert (=> b!1075957 m!995051))

(declare-fun m!995139 () Bool)

(assert (=> b!1075957 m!995139))

(declare-fun m!995141 () Bool)

(assert (=> b!1075965 m!995141))

(assert (=> b!1075965 m!995141))

(declare-fun m!995143 () Bool)

(assert (=> b!1075965 m!995143))

(declare-fun m!995145 () Bool)

(assert (=> b!1075965 m!995145))

(assert (=> b!1075965 m!995051))

(assert (=> b!1075965 m!995097))

(assert (=> b!1075965 m!995095))

(assert (=> b!1075965 m!995097))

(assert (=> b!1075965 m!995099))

(assert (=> b!1075965 m!995095))

(declare-fun m!995147 () Bool)

(assert (=> b!1075965 m!995147))

(declare-fun m!995149 () Bool)

(assert (=> bm!45486 m!995149))

(declare-fun m!995151 () Bool)

(assert (=> d!129985 m!995151))

(assert (=> d!129985 m!994989))

(assert (=> b!1075955 m!995051))

(assert (=> b!1075955 m!995051))

(assert (=> b!1075955 m!995053))

(assert (=> b!1075961 m!995149))

(assert (=> b!1075956 m!995051))

(assert (=> b!1075956 m!995051))

(assert (=> b!1075956 m!995053))

(assert (=> b!1075775 d!129985))

(declare-fun d!129987 () Bool)

(assert (=> d!129987 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95278 d!129987))

(declare-fun d!129989 () Bool)

(assert (=> d!129989 (= (array_inv!25678 _values!955) (bvsge (size!33712 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95278 d!129989))

(declare-fun d!129991 () Bool)

(assert (=> d!129991 (= (array_inv!25679 _keys!1163) (bvsge (size!33713 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95278 d!129991))

(declare-fun d!129993 () Bool)

(declare-fun res!717053 () Bool)

(declare-fun e!614935 () Bool)

(assert (=> d!129993 (=> res!717053 e!614935)))

(assert (=> d!129993 (= res!717053 (bvsge #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(assert (=> d!129993 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614935)))

(declare-fun b!1075974 () Bool)

(declare-fun e!614936 () Bool)

(declare-fun call!45492 () Bool)

(assert (=> b!1075974 (= e!614936 call!45492)))

(declare-fun b!1075975 () Bool)

(assert (=> b!1075975 (= e!614935 e!614936)))

(declare-fun c!108351 () Bool)

(assert (=> b!1075975 (= c!108351 (validKeyInArray!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075976 () Bool)

(declare-fun e!614937 () Bool)

(assert (=> b!1075976 (= e!614937 call!45492)))

(declare-fun b!1075977 () Bool)

(assert (=> b!1075977 (= e!614936 e!614937)))

(declare-fun lt!477298 () (_ BitVec 64))

(assert (=> b!1075977 (= lt!477298 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477297 () Unit!35348)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68985 (_ BitVec 64) (_ BitVec 32)) Unit!35348)

(assert (=> b!1075977 (= lt!477297 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477298 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075977 (arrayContainsKey!0 _keys!1163 lt!477298 #b00000000000000000000000000000000)))

(declare-fun lt!477296 () Unit!35348)

(assert (=> b!1075977 (= lt!477296 lt!477297)))

(declare-fun res!717054 () Bool)

(declare-datatypes ((SeekEntryResult!9845 0))(
  ( (MissingZero!9845 (index!41751 (_ BitVec 32))) (Found!9845 (index!41752 (_ BitVec 32))) (Intermediate!9845 (undefined!10657 Bool) (index!41753 (_ BitVec 32)) (x!96284 (_ BitVec 32))) (Undefined!9845) (MissingVacant!9845 (index!41754 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68985 (_ BitVec 32)) SeekEntryResult!9845)

(assert (=> b!1075977 (= res!717054 (= (seekEntryOrOpen!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9845 #b00000000000000000000000000000000)))))

(assert (=> b!1075977 (=> (not res!717054) (not e!614937))))

(declare-fun bm!45489 () Bool)

(assert (=> bm!45489 (= call!45492 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129993 (not res!717053)) b!1075975))

(assert (= (and b!1075975 c!108351) b!1075977))

(assert (= (and b!1075975 (not c!108351)) b!1075974))

(assert (= (and b!1075977 res!717054) b!1075976))

(assert (= (or b!1075976 b!1075974) bm!45489))

(assert (=> b!1075975 m!995051))

(assert (=> b!1075975 m!995051))

(assert (=> b!1075975 m!995053))

(assert (=> b!1075977 m!995051))

(declare-fun m!995153 () Bool)

(assert (=> b!1075977 m!995153))

(declare-fun m!995155 () Bool)

(assert (=> b!1075977 m!995155))

(assert (=> b!1075977 m!995051))

(declare-fun m!995157 () Bool)

(assert (=> b!1075977 m!995157))

(declare-fun m!995159 () Bool)

(assert (=> bm!45489 m!995159))

(assert (=> b!1075774 d!129993))

(declare-fun b!1075978 () Bool)

(declare-fun e!614939 () Bool)

(declare-fun call!45495 () Bool)

(assert (=> b!1075978 (= e!614939 (not call!45495))))

(declare-fun b!1075979 () Bool)

(declare-fun e!614950 () Bool)

(declare-fun lt!477313 () ListLongMap!14575)

(assert (=> b!1075979 (= e!614950 (= (apply!945 lt!477313 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun bm!45490 () Bool)

(declare-fun call!45497 () ListLongMap!14575)

(assert (=> bm!45490 (= call!45497 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45491 () Bool)

(declare-fun call!45496 () ListLongMap!14575)

(declare-fun call!45498 () ListLongMap!14575)

(assert (=> bm!45491 (= call!45496 call!45498)))

(declare-fun b!1075981 () Bool)

(declare-fun e!614943 () Bool)

(assert (=> b!1075981 (= e!614943 e!614950)))

(declare-fun res!717062 () Bool)

(declare-fun call!45499 () Bool)

(assert (=> b!1075981 (= res!717062 call!45499)))

(assert (=> b!1075981 (=> (not res!717062) (not e!614950))))

(declare-fun b!1075982 () Bool)

(declare-fun e!614947 () Bool)

(assert (=> b!1075982 (= e!614947 (validKeyInArray!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075983 () Bool)

(declare-fun res!717063 () Bool)

(declare-fun e!614944 () Bool)

(assert (=> b!1075983 (=> (not res!717063) (not e!614944))))

(assert (=> b!1075983 (= res!717063 e!614943)))

(declare-fun c!108356 () Bool)

(assert (=> b!1075983 (= c!108356 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075984 () Bool)

(declare-fun e!614941 () Bool)

(declare-fun e!614940 () Bool)

(assert (=> b!1075984 (= e!614941 e!614940)))

(declare-fun res!717061 () Bool)

(assert (=> b!1075984 (=> (not res!717061) (not e!614940))))

(assert (=> b!1075984 (= res!717061 (contains!6362 lt!477313 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075984 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun b!1075985 () Bool)

(declare-fun e!614942 () ListLongMap!14575)

(declare-fun call!45494 () ListLongMap!14575)

(assert (=> b!1075985 (= e!614942 call!45494)))

(declare-fun b!1075986 () Bool)

(declare-fun e!614949 () ListLongMap!14575)

(declare-fun call!45493 () ListLongMap!14575)

(assert (=> b!1075986 (= e!614949 (+!3238 call!45493 (tuple2!16599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45492 () Bool)

(assert (=> bm!45492 (= call!45495 (contains!6362 lt!477313 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075987 () Bool)

(declare-fun c!108354 () Bool)

(assert (=> b!1075987 (= c!108354 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614945 () ListLongMap!14575)

(assert (=> b!1075987 (= e!614942 e!614945)))

(declare-fun b!1075988 () Bool)

(assert (=> b!1075988 (= e!614945 call!45494)))

(declare-fun b!1075989 () Bool)

(assert (=> b!1075989 (= e!614943 (not call!45499))))

(declare-fun b!1075990 () Bool)

(assert (=> b!1075990 (= e!614949 e!614942)))

(declare-fun c!108352 () Bool)

(assert (=> b!1075990 (= c!108352 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075991 () Bool)

(declare-fun res!717056 () Bool)

(assert (=> b!1075991 (=> (not res!717056) (not e!614944))))

(assert (=> b!1075991 (= res!717056 e!614941)))

(declare-fun res!717057 () Bool)

(assert (=> b!1075991 (=> res!717057 e!614941)))

(declare-fun e!614948 () Bool)

(assert (=> b!1075991 (= res!717057 (not e!614948))))

(declare-fun res!717059 () Bool)

(assert (=> b!1075991 (=> (not res!717059) (not e!614948))))

(assert (=> b!1075991 (= res!717059 (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun b!1075992 () Bool)

(assert (=> b!1075992 (= e!614948 (validKeyInArray!0 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45493 () Bool)

(assert (=> bm!45493 (= call!45499 (contains!6362 lt!477313 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45494 () Bool)

(assert (=> bm!45494 (= call!45494 call!45493)))

(declare-fun c!108353 () Bool)

(declare-fun bm!45495 () Bool)

(assert (=> bm!45495 (= call!45493 (+!3238 (ite c!108353 call!45497 (ite c!108352 call!45498 call!45496)) (ite (or c!108353 c!108352) (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075980 () Bool)

(declare-fun e!614946 () Bool)

(assert (=> b!1075980 (= e!614939 e!614946)))

(declare-fun res!717055 () Bool)

(assert (=> b!1075980 (= res!717055 call!45495)))

(assert (=> b!1075980 (=> (not res!717055) (not e!614946))))

(declare-fun d!129995 () Bool)

(assert (=> d!129995 e!614944))

(declare-fun res!717058 () Bool)

(assert (=> d!129995 (=> (not res!717058) (not e!614944))))

(assert (=> d!129995 (= res!717058 (or (bvsge #b00000000000000000000000000000000 (size!33713 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))))

(declare-fun lt!477315 () ListLongMap!14575)

(assert (=> d!129995 (= lt!477313 lt!477315)))

(declare-fun lt!477309 () Unit!35348)

(declare-fun e!614938 () Unit!35348)

(assert (=> d!129995 (= lt!477309 e!614938)))

(declare-fun c!108357 () Bool)

(assert (=> d!129995 (= c!108357 e!614947)))

(declare-fun res!717060 () Bool)

(assert (=> d!129995 (=> (not res!717060) (not e!614947))))

(assert (=> d!129995 (= res!717060 (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(assert (=> d!129995 (= lt!477315 e!614949)))

(assert (=> d!129995 (= c!108353 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129995 (validMask!0 mask!1515)))

(assert (=> d!129995 (= (getCurrentListMap!4164 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477313)))

(declare-fun b!1075993 () Bool)

(assert (=> b!1075993 (= e!614946 (= (apply!945 lt!477313 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1075994 () Bool)

(assert (=> b!1075994 (= e!614945 call!45496)))

(declare-fun b!1075995 () Bool)

(assert (=> b!1075995 (= e!614944 e!614939)))

(declare-fun c!108355 () Bool)

(assert (=> b!1075995 (= c!108355 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075996 () Bool)

(declare-fun Unit!35353 () Unit!35348)

(assert (=> b!1075996 (= e!614938 Unit!35353)))

(declare-fun bm!45496 () Bool)

(assert (=> bm!45496 (= call!45498 call!45497)))

(declare-fun b!1075997 () Bool)

(assert (=> b!1075997 (= e!614940 (= (apply!945 lt!477313 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000)) (get!17253 (select (arr!33175 _values!955) #b00000000000000000000000000000000) (dynLambda!2060 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33712 _values!955)))))

(assert (=> b!1075997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33713 _keys!1163)))))

(declare-fun b!1075998 () Bool)

(declare-fun lt!477320 () Unit!35348)

(assert (=> b!1075998 (= e!614938 lt!477320)))

(declare-fun lt!477304 () ListLongMap!14575)

(assert (=> b!1075998 (= lt!477304 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477299 () (_ BitVec 64))

(assert (=> b!1075998 (= lt!477299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477312 () (_ BitVec 64))

(assert (=> b!1075998 (= lt!477312 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477314 () Unit!35348)

(assert (=> b!1075998 (= lt!477314 (addStillContains!649 lt!477304 lt!477299 zeroValueBefore!47 lt!477312))))

(assert (=> b!1075998 (contains!6362 (+!3238 lt!477304 (tuple2!16599 lt!477299 zeroValueBefore!47)) lt!477312)))

(declare-fun lt!477303 () Unit!35348)

(assert (=> b!1075998 (= lt!477303 lt!477314)))

(declare-fun lt!477310 () ListLongMap!14575)

(assert (=> b!1075998 (= lt!477310 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477305 () (_ BitVec 64))

(assert (=> b!1075998 (= lt!477305 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477317 () (_ BitVec 64))

(assert (=> b!1075998 (= lt!477317 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477306 () Unit!35348)

(assert (=> b!1075998 (= lt!477306 (addApplyDifferent!505 lt!477310 lt!477305 minValue!907 lt!477317))))

(assert (=> b!1075998 (= (apply!945 (+!3238 lt!477310 (tuple2!16599 lt!477305 minValue!907)) lt!477317) (apply!945 lt!477310 lt!477317))))

(declare-fun lt!477318 () Unit!35348)

(assert (=> b!1075998 (= lt!477318 lt!477306)))

(declare-fun lt!477316 () ListLongMap!14575)

(assert (=> b!1075998 (= lt!477316 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477302 () (_ BitVec 64))

(assert (=> b!1075998 (= lt!477302 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477300 () (_ BitVec 64))

(assert (=> b!1075998 (= lt!477300 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477319 () Unit!35348)

(assert (=> b!1075998 (= lt!477319 (addApplyDifferent!505 lt!477316 lt!477302 zeroValueBefore!47 lt!477300))))

(assert (=> b!1075998 (= (apply!945 (+!3238 lt!477316 (tuple2!16599 lt!477302 zeroValueBefore!47)) lt!477300) (apply!945 lt!477316 lt!477300))))

(declare-fun lt!477307 () Unit!35348)

(assert (=> b!1075998 (= lt!477307 lt!477319)))

(declare-fun lt!477301 () ListLongMap!14575)

(assert (=> b!1075998 (= lt!477301 (getCurrentListMapNoExtraKeys!3900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477311 () (_ BitVec 64))

(assert (=> b!1075998 (= lt!477311 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477308 () (_ BitVec 64))

(assert (=> b!1075998 (= lt!477308 (select (arr!33176 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075998 (= lt!477320 (addApplyDifferent!505 lt!477301 lt!477311 minValue!907 lt!477308))))

(assert (=> b!1075998 (= (apply!945 (+!3238 lt!477301 (tuple2!16599 lt!477311 minValue!907)) lt!477308) (apply!945 lt!477301 lt!477308))))

(assert (= (and d!129995 c!108353) b!1075986))

(assert (= (and d!129995 (not c!108353)) b!1075990))

(assert (= (and b!1075990 c!108352) b!1075985))

(assert (= (and b!1075990 (not c!108352)) b!1075987))

(assert (= (and b!1075987 c!108354) b!1075988))

(assert (= (and b!1075987 (not c!108354)) b!1075994))

(assert (= (or b!1075988 b!1075994) bm!45491))

(assert (= (or b!1075985 bm!45491) bm!45496))

(assert (= (or b!1075985 b!1075988) bm!45494))

(assert (= (or b!1075986 bm!45496) bm!45490))

(assert (= (or b!1075986 bm!45494) bm!45495))

(assert (= (and d!129995 res!717060) b!1075982))

(assert (= (and d!129995 c!108357) b!1075998))

(assert (= (and d!129995 (not c!108357)) b!1075996))

(assert (= (and d!129995 res!717058) b!1075991))

(assert (= (and b!1075991 res!717059) b!1075992))

(assert (= (and b!1075991 (not res!717057)) b!1075984))

(assert (= (and b!1075984 res!717061) b!1075997))

(assert (= (and b!1075991 res!717056) b!1075983))

(assert (= (and b!1075983 c!108356) b!1075981))

(assert (= (and b!1075983 (not c!108356)) b!1075989))

(assert (= (and b!1075981 res!717062) b!1075979))

(assert (= (or b!1075981 b!1075989) bm!45493))

(assert (= (and b!1075983 res!717063) b!1075995))

(assert (= (and b!1075995 c!108355) b!1075980))

(assert (= (and b!1075995 (not c!108355)) b!1075978))

(assert (= (and b!1075980 res!717055) b!1075993))

(assert (= (or b!1075980 b!1075978) bm!45492))

(declare-fun b_lambda!16829 () Bool)

(assert (=> (not b_lambda!16829) (not b!1075997)))

(assert (=> b!1075997 t!32497))

(declare-fun b_and!35099 () Bool)

(assert (= b_and!35097 (and (=> t!32497 result!14801) b_and!35099)))

(assert (=> b!1075982 m!995051))

(assert (=> b!1075982 m!995051))

(assert (=> b!1075982 m!995053))

(assert (=> b!1075984 m!995051))

(assert (=> b!1075984 m!995051))

(declare-fun m!995161 () Bool)

(assert (=> b!1075984 m!995161))

(declare-fun m!995163 () Bool)

(assert (=> bm!45493 m!995163))

(declare-fun m!995165 () Bool)

(assert (=> b!1075979 m!995165))

(assert (=> d!129995 m!994989))

(declare-fun m!995167 () Bool)

(assert (=> b!1075986 m!995167))

(declare-fun m!995169 () Bool)

(assert (=> b!1075998 m!995169))

(declare-fun m!995171 () Bool)

(assert (=> b!1075998 m!995171))

(declare-fun m!995173 () Bool)

(assert (=> b!1075998 m!995173))

(assert (=> b!1075998 m!995169))

(declare-fun m!995175 () Bool)

(assert (=> b!1075998 m!995175))

(declare-fun m!995177 () Bool)

(assert (=> b!1075998 m!995177))

(declare-fun m!995179 () Bool)

(assert (=> b!1075998 m!995179))

(declare-fun m!995181 () Bool)

(assert (=> b!1075998 m!995181))

(declare-fun m!995183 () Bool)

(assert (=> b!1075998 m!995183))

(declare-fun m!995185 () Bool)

(assert (=> b!1075998 m!995185))

(declare-fun m!995187 () Bool)

(assert (=> b!1075998 m!995187))

(assert (=> b!1075998 m!995185))

(assert (=> b!1075998 m!995051))

(assert (=> b!1075998 m!995183))

(declare-fun m!995189 () Bool)

(assert (=> b!1075998 m!995189))

(assert (=> b!1075998 m!995179))

(declare-fun m!995191 () Bool)

(assert (=> b!1075998 m!995191))

(declare-fun m!995193 () Bool)

(assert (=> b!1075998 m!995193))

(declare-fun m!995195 () Bool)

(assert (=> b!1075998 m!995195))

(declare-fun m!995197 () Bool)

(assert (=> b!1075998 m!995197))

(assert (=> b!1075998 m!994999))

(assert (=> bm!45490 m!994999))

(declare-fun m!995199 () Bool)

(assert (=> b!1075993 m!995199))

(assert (=> b!1075997 m!995051))

(assert (=> b!1075997 m!995095))

(assert (=> b!1075997 m!995097))

(assert (=> b!1075997 m!995095))

(assert (=> b!1075997 m!995097))

(assert (=> b!1075997 m!995099))

(assert (=> b!1075997 m!995051))

(declare-fun m!995201 () Bool)

(assert (=> b!1075997 m!995201))

(declare-fun m!995203 () Bool)

(assert (=> bm!45495 m!995203))

(declare-fun m!995205 () Bool)

(assert (=> bm!45492 m!995205))

(assert (=> b!1075992 m!995051))

(assert (=> b!1075992 m!995051))

(assert (=> b!1075992 m!995053))

(assert (=> b!1075769 d!129995))

(declare-fun d!129997 () Bool)

(declare-fun e!614953 () Bool)

(assert (=> d!129997 e!614953))

(declare-fun res!717069 () Bool)

(assert (=> d!129997 (=> (not res!717069) (not e!614953))))

(declare-fun lt!477329 () ListLongMap!14575)

(assert (=> d!129997 (= res!717069 (contains!6362 lt!477329 (_1!8310 (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!477331 () List!23154)

(assert (=> d!129997 (= lt!477329 (ListLongMap!14576 lt!477331))))

(declare-fun lt!477330 () Unit!35348)

(declare-fun lt!477332 () Unit!35348)

(assert (=> d!129997 (= lt!477330 lt!477332)))

(declare-datatypes ((Option!655 0))(
  ( (Some!654 (v!15664 V!39785)) (None!653) )
))
(declare-fun getValueByKey!604 (List!23154 (_ BitVec 64)) Option!655)

(assert (=> d!129997 (= (getValueByKey!604 lt!477331 (_1!8310 (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!654 (_2!8310 (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!288 (List!23154 (_ BitVec 64) V!39785) Unit!35348)

(assert (=> d!129997 (= lt!477332 (lemmaContainsTupThenGetReturnValue!288 lt!477331 (_1!8310 (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8310 (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!381 (List!23154 (_ BitVec 64) V!39785) List!23154)

(assert (=> d!129997 (= lt!477331 (insertStrictlySorted!381 (toList!7303 lt!477173) (_1!8310 (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8310 (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129997 (= (+!3238 lt!477173 (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477329)))

(declare-fun b!1076003 () Bool)

(declare-fun res!717068 () Bool)

(assert (=> b!1076003 (=> (not res!717068) (not e!614953))))

(assert (=> b!1076003 (= res!717068 (= (getValueByKey!604 (toList!7303 lt!477329) (_1!8310 (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!654 (_2!8310 (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1076004 () Bool)

(declare-fun contains!6364 (List!23154 tuple2!16598) Bool)

(assert (=> b!1076004 (= e!614953 (contains!6364 (toList!7303 lt!477329) (tuple2!16599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129997 res!717069) b!1076003))

(assert (= (and b!1076003 res!717068) b!1076004))

(declare-fun m!995207 () Bool)

(assert (=> d!129997 m!995207))

(declare-fun m!995209 () Bool)

(assert (=> d!129997 m!995209))

(declare-fun m!995211 () Bool)

(assert (=> d!129997 m!995211))

(declare-fun m!995213 () Bool)

(assert (=> d!129997 m!995213))

(declare-fun m!995215 () Bool)

(assert (=> b!1076003 m!995215))

(declare-fun m!995217 () Bool)

(assert (=> b!1076004 m!995217))

(assert (=> b!1075769 d!129997))

(declare-fun b!1076011 () Bool)

(declare-fun e!614959 () Bool)

(assert (=> b!1076011 (= e!614959 tp_is_empty!25987)))

(declare-fun mapIsEmpty!40714 () Bool)

(declare-fun mapRes!40714 () Bool)

(assert (=> mapIsEmpty!40714 mapRes!40714))

(declare-fun condMapEmpty!40714 () Bool)

(declare-fun mapDefault!40714 () ValueCell!12290)

(assert (=> mapNonEmpty!40705 (= condMapEmpty!40714 (= mapRest!40705 ((as const (Array (_ BitVec 32) ValueCell!12290)) mapDefault!40714)))))

(declare-fun e!614958 () Bool)

(assert (=> mapNonEmpty!40705 (= tp!78007 (and e!614958 mapRes!40714))))

(declare-fun b!1076012 () Bool)

(assert (=> b!1076012 (= e!614958 tp_is_empty!25987)))

(declare-fun mapNonEmpty!40714 () Bool)

(declare-fun tp!78023 () Bool)

(assert (=> mapNonEmpty!40714 (= mapRes!40714 (and tp!78023 e!614959))))

(declare-fun mapKey!40714 () (_ BitVec 32))

(declare-fun mapValue!40714 () ValueCell!12290)

(declare-fun mapRest!40714 () (Array (_ BitVec 32) ValueCell!12290))

(assert (=> mapNonEmpty!40714 (= mapRest!40705 (store mapRest!40714 mapKey!40714 mapValue!40714))))

(assert (= (and mapNonEmpty!40705 condMapEmpty!40714) mapIsEmpty!40714))

(assert (= (and mapNonEmpty!40705 (not condMapEmpty!40714)) mapNonEmpty!40714))

(assert (= (and mapNonEmpty!40714 ((_ is ValueCellFull!12290) mapValue!40714)) b!1076011))

(assert (= (and mapNonEmpty!40705 ((_ is ValueCellFull!12290) mapDefault!40714)) b!1076012))

(declare-fun m!995219 () Bool)

(assert (=> mapNonEmpty!40714 m!995219))

(declare-fun b_lambda!16831 () Bool)

(assert (= b_lambda!16821 (or (and start!95278 b_free!22177) b_lambda!16831)))

(declare-fun b_lambda!16833 () Bool)

(assert (= b_lambda!16829 (or (and start!95278 b_free!22177) b_lambda!16833)))

(declare-fun b_lambda!16835 () Bool)

(assert (= b_lambda!16823 (or (and start!95278 b_free!22177) b_lambda!16835)))

(declare-fun b_lambda!16837 () Bool)

(assert (= b_lambda!16827 (or (and start!95278 b_free!22177) b_lambda!16837)))

(declare-fun b_lambda!16839 () Bool)

(assert (= b_lambda!16825 (or (and start!95278 b_free!22177) b_lambda!16839)))

(declare-fun b_lambda!16841 () Bool)

(assert (= b_lambda!16819 (or (and start!95278 b_free!22177) b_lambda!16841)))

(check-sat (not b!1075888) (not bm!45478) (not b!1075917) (not b!1075899) (not bm!45495) (not b_lambda!16839) (not bm!45486) (not bm!45493) (not b!1075916) (not b!1076003) (not b!1075997) (not d!129997) (not b!1075984) (not b!1075961) (not bm!45482) (not b!1075963) (not b!1075986) (not d!129983) (not bm!45475) (not b!1076004) (not b!1075977) (not b!1075965) (not b!1075943) (not b!1075895) (not bm!45489) (not b_next!22177) (not b!1075955) (not b!1075951) (not b!1075960) (not b!1075881) (not b!1075914) (not b!1075950) (not b!1075993) (not b!1075894) (not bm!45485) (not b!1075982) (not b!1075949) (not d!129977) (not b_lambda!16835) (not b!1075975) (not b!1075886) (not b!1075957) (not b!1075956) (not b!1075900) (not b!1075884) (not b!1075945) (not d!129995) (not bm!45473) (not mapNonEmpty!40714) (not bm!45490) (not d!129981) (not b_lambda!16841) (not b_lambda!16837) (not b_lambda!16833) (not b!1075962) (not b!1075979) (not b!1075998) tp_is_empty!25987 (not b!1075944) (not b!1075992) (not bm!45476) b_and!35099 (not b!1075953) (not d!129985) (not b_lambda!16831) (not b!1075948) (not bm!45492))
(check-sat b_and!35099 (not b_next!22177))
