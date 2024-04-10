; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71272 () Bool)

(assert start!71272)

(declare-fun b_free!13419 () Bool)

(declare-fun b_next!13419 () Bool)

(assert (=> start!71272 (= b_free!13419 (not b_next!13419))))

(declare-fun tp!47019 () Bool)

(declare-fun b_and!22357 () Bool)

(assert (=> start!71272 (= tp!47019 b_and!22357)))

(declare-fun mapIsEmpty!24322 () Bool)

(declare-fun mapRes!24322 () Bool)

(assert (=> mapIsEmpty!24322 mapRes!24322))

(declare-fun b!827848 () Bool)

(declare-fun res!564210 () Bool)

(declare-fun e!461233 () Bool)

(assert (=> b!827848 (=> (not res!564210) (not e!461233))))

(declare-datatypes ((array!46422 0))(
  ( (array!46423 (arr!22255 (Array (_ BitVec 32) (_ BitVec 64))) (size!22676 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46422)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46422 (_ BitVec 32)) Bool)

(assert (=> b!827848 (= res!564210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827849 () Bool)

(declare-fun res!564211 () Bool)

(assert (=> b!827849 (=> (not res!564211) (not e!461233))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25173 0))(
  ( (V!25174 (val!7612 Int)) )
))
(declare-datatypes ((ValueCell!7149 0))(
  ( (ValueCellFull!7149 (v!10047 V!25173)) (EmptyCell!7149) )
))
(declare-datatypes ((array!46424 0))(
  ( (array!46425 (arr!22256 (Array (_ BitVec 32) ValueCell!7149)) (size!22677 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46424)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827849 (= res!564211 (and (= (size!22677 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22676 _keys!976) (size!22677 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827850 () Bool)

(declare-fun e!461230 () Bool)

(declare-fun e!461231 () Bool)

(assert (=> b!827850 (= e!461230 (and e!461231 mapRes!24322))))

(declare-fun condMapEmpty!24322 () Bool)

(declare-fun mapDefault!24322 () ValueCell!7149)

(assert (=> b!827850 (= condMapEmpty!24322 (= (arr!22256 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7149)) mapDefault!24322)))))

(declare-fun mapNonEmpty!24322 () Bool)

(declare-fun tp!47020 () Bool)

(declare-fun e!461232 () Bool)

(assert (=> mapNonEmpty!24322 (= mapRes!24322 (and tp!47020 e!461232))))

(declare-fun mapRest!24322 () (Array (_ BitVec 32) ValueCell!7149))

(declare-fun mapValue!24322 () ValueCell!7149)

(declare-fun mapKey!24322 () (_ BitVec 32))

(assert (=> mapNonEmpty!24322 (= (arr!22256 _values!788) (store mapRest!24322 mapKey!24322 mapValue!24322))))

(declare-fun b!827851 () Bool)

(declare-fun res!564212 () Bool)

(assert (=> b!827851 (=> (not res!564212) (not e!461233))))

(declare-datatypes ((List!15884 0))(
  ( (Nil!15881) (Cons!15880 (h!17009 (_ BitVec 64)) (t!22233 List!15884)) )
))
(declare-fun arrayNoDuplicates!0 (array!46422 (_ BitVec 32) List!15884) Bool)

(assert (=> b!827851 (= res!564212 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15881))))

(declare-fun res!564209 () Bool)

(assert (=> start!71272 (=> (not res!564209) (not e!461233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71272 (= res!564209 (validMask!0 mask!1312))))

(assert (=> start!71272 e!461233))

(declare-fun tp_is_empty!15129 () Bool)

(assert (=> start!71272 tp_is_empty!15129))

(declare-fun array_inv!17731 (array!46422) Bool)

(assert (=> start!71272 (array_inv!17731 _keys!976)))

(assert (=> start!71272 true))

(declare-fun array_inv!17732 (array!46424) Bool)

(assert (=> start!71272 (and (array_inv!17732 _values!788) e!461230)))

(assert (=> start!71272 tp!47019))

(declare-fun b!827852 () Bool)

(assert (=> b!827852 (= e!461231 tp_is_empty!15129)))

(declare-fun b!827853 () Bool)

(assert (=> b!827853 (= e!461233 (bvsgt #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(declare-fun zeroValueAfter!34 () V!25173)

(declare-fun minValue!754 () V!25173)

(declare-datatypes ((tuple2!10092 0))(
  ( (tuple2!10093 (_1!5057 (_ BitVec 64)) (_2!5057 V!25173)) )
))
(declare-datatypes ((List!15885 0))(
  ( (Nil!15882) (Cons!15881 (h!17010 tuple2!10092) (t!22234 List!15885)) )
))
(declare-datatypes ((ListLongMap!8915 0))(
  ( (ListLongMap!8916 (toList!4473 List!15885)) )
))
(declare-fun lt!375023 () ListLongMap!8915)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2475 (array!46422 array!46424 (_ BitVec 32) (_ BitVec 32) V!25173 V!25173 (_ BitVec 32) Int) ListLongMap!8915)

(assert (=> b!827853 (= lt!375023 (getCurrentListMapNoExtraKeys!2475 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25173)

(declare-fun lt!375022 () ListLongMap!8915)

(assert (=> b!827853 (= lt!375022 (getCurrentListMapNoExtraKeys!2475 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827854 () Bool)

(assert (=> b!827854 (= e!461232 tp_is_empty!15129)))

(assert (= (and start!71272 res!564209) b!827849))

(assert (= (and b!827849 res!564211) b!827848))

(assert (= (and b!827848 res!564210) b!827851))

(assert (= (and b!827851 res!564212) b!827853))

(assert (= (and b!827850 condMapEmpty!24322) mapIsEmpty!24322))

(assert (= (and b!827850 (not condMapEmpty!24322)) mapNonEmpty!24322))

(get-info :version)

(assert (= (and mapNonEmpty!24322 ((_ is ValueCellFull!7149) mapValue!24322)) b!827854))

(assert (= (and b!827850 ((_ is ValueCellFull!7149) mapDefault!24322)) b!827852))

(assert (= start!71272 b!827850))

(declare-fun m!770831 () Bool)

(assert (=> b!827851 m!770831))

(declare-fun m!770833 () Bool)

(assert (=> mapNonEmpty!24322 m!770833))

(declare-fun m!770835 () Bool)

(assert (=> b!827848 m!770835))

(declare-fun m!770837 () Bool)

(assert (=> start!71272 m!770837))

(declare-fun m!770839 () Bool)

(assert (=> start!71272 m!770839))

(declare-fun m!770841 () Bool)

(assert (=> start!71272 m!770841))

(declare-fun m!770843 () Bool)

(assert (=> b!827853 m!770843))

(declare-fun m!770845 () Bool)

(assert (=> b!827853 m!770845))

(check-sat (not b!827853) (not b_next!13419) (not start!71272) (not mapNonEmpty!24322) (not b!827851) b_and!22357 tp_is_empty!15129 (not b!827848))
(check-sat b_and!22357 (not b_next!13419))
(get-model)

(declare-fun bm!35946 () Bool)

(declare-fun call!35949 () ListLongMap!8915)

(assert (=> bm!35946 (= call!35949 (getCurrentListMapNoExtraKeys!2475 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!827900 () Bool)

(declare-fun e!461265 () ListLongMap!8915)

(assert (=> b!827900 (= e!461265 (ListLongMap!8916 Nil!15882))))

(declare-fun b!827901 () Bool)

(declare-fun res!564233 () Bool)

(declare-fun e!461264 () Bool)

(assert (=> b!827901 (=> (not res!564233) (not e!461264))))

(declare-fun lt!375050 () ListLongMap!8915)

(declare-fun contains!4185 (ListLongMap!8915 (_ BitVec 64)) Bool)

(assert (=> b!827901 (= res!564233 (not (contains!4185 lt!375050 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!461269 () Bool)

(declare-fun b!827902 () Bool)

(assert (=> b!827902 (= e!461269 (= lt!375050 (getCurrentListMapNoExtraKeys!2475 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!827903 () Bool)

(declare-fun isEmpty!646 (ListLongMap!8915) Bool)

(assert (=> b!827903 (= e!461269 (isEmpty!646 lt!375050))))

(declare-fun d!105129 () Bool)

(assert (=> d!105129 e!461264))

(declare-fun res!564234 () Bool)

(assert (=> d!105129 (=> (not res!564234) (not e!461264))))

(assert (=> d!105129 (= res!564234 (not (contains!4185 lt!375050 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105129 (= lt!375050 e!461265)))

(declare-fun c!89534 () Bool)

(assert (=> d!105129 (= c!89534 (bvsge #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(assert (=> d!105129 (validMask!0 mask!1312)))

(assert (=> d!105129 (= (getCurrentListMapNoExtraKeys!2475 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375050)))

(declare-fun b!827904 () Bool)

(declare-fun e!461266 () ListLongMap!8915)

(assert (=> b!827904 (= e!461266 call!35949)))

(declare-fun b!827905 () Bool)

(assert (=> b!827905 (= e!461265 e!461266)))

(declare-fun c!89532 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!827905 (= c!89532 (validKeyInArray!0 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827906 () Bool)

(declare-fun e!461270 () Bool)

(assert (=> b!827906 (= e!461270 (validKeyInArray!0 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827906 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!827907 () Bool)

(declare-datatypes ((Unit!28363 0))(
  ( (Unit!28364) )
))
(declare-fun lt!375046 () Unit!28363)

(declare-fun lt!375045 () Unit!28363)

(assert (=> b!827907 (= lt!375046 lt!375045)))

(declare-fun lt!375044 () V!25173)

(declare-fun lt!375047 () (_ BitVec 64))

(declare-fun lt!375049 () ListLongMap!8915)

(declare-fun lt!375048 () (_ BitVec 64))

(declare-fun +!1957 (ListLongMap!8915 tuple2!10092) ListLongMap!8915)

(assert (=> b!827907 (not (contains!4185 (+!1957 lt!375049 (tuple2!10093 lt!375047 lt!375044)) lt!375048))))

(declare-fun addStillNotContains!189 (ListLongMap!8915 (_ BitVec 64) V!25173 (_ BitVec 64)) Unit!28363)

(assert (=> b!827907 (= lt!375045 (addStillNotContains!189 lt!375049 lt!375047 lt!375044 lt!375048))))

(assert (=> b!827907 (= lt!375048 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11783 (ValueCell!7149 V!25173) V!25173)

(declare-fun dynLambda!975 (Int (_ BitVec 64)) V!25173)

(assert (=> b!827907 (= lt!375044 (get!11783 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!827907 (= lt!375047 (select (arr!22255 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827907 (= lt!375049 call!35949)))

(assert (=> b!827907 (= e!461266 (+!1957 call!35949 (tuple2!10093 (select (arr!22255 _keys!976) #b00000000000000000000000000000000) (get!11783 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!827908 () Bool)

(declare-fun e!461268 () Bool)

(declare-fun e!461267 () Bool)

(assert (=> b!827908 (= e!461268 e!461267)))

(assert (=> b!827908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(declare-fun res!564236 () Bool)

(assert (=> b!827908 (= res!564236 (contains!4185 lt!375050 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827908 (=> (not res!564236) (not e!461267))))

(declare-fun b!827909 () Bool)

(assert (=> b!827909 (= e!461264 e!461268)))

(declare-fun c!89531 () Bool)

(assert (=> b!827909 (= c!89531 e!461270)))

(declare-fun res!564235 () Bool)

(assert (=> b!827909 (=> (not res!564235) (not e!461270))))

(assert (=> b!827909 (= res!564235 (bvslt #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(declare-fun b!827910 () Bool)

(assert (=> b!827910 (= e!461268 e!461269)))

(declare-fun c!89533 () Bool)

(assert (=> b!827910 (= c!89533 (bvslt #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(declare-fun b!827911 () Bool)

(assert (=> b!827911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(assert (=> b!827911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22677 _values!788)))))

(declare-fun apply!364 (ListLongMap!8915 (_ BitVec 64)) V!25173)

(assert (=> b!827911 (= e!461267 (= (apply!364 lt!375050 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)) (get!11783 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!105129 c!89534) b!827900))

(assert (= (and d!105129 (not c!89534)) b!827905))

(assert (= (and b!827905 c!89532) b!827907))

(assert (= (and b!827905 (not c!89532)) b!827904))

(assert (= (or b!827907 b!827904) bm!35946))

(assert (= (and d!105129 res!564234) b!827901))

(assert (= (and b!827901 res!564233) b!827909))

(assert (= (and b!827909 res!564235) b!827906))

(assert (= (and b!827909 c!89531) b!827908))

(assert (= (and b!827909 (not c!89531)) b!827910))

(assert (= (and b!827908 res!564236) b!827911))

(assert (= (and b!827910 c!89533) b!827902))

(assert (= (and b!827910 (not c!89533)) b!827903))

(declare-fun b_lambda!11163 () Bool)

(assert (=> (not b_lambda!11163) (not b!827907)))

(declare-fun t!22236 () Bool)

(declare-fun tb!4209 () Bool)

(assert (=> (and start!71272 (= defaultEntry!796 defaultEntry!796) t!22236) tb!4209))

(declare-fun result!7967 () Bool)

(assert (=> tb!4209 (= result!7967 tp_is_empty!15129)))

(assert (=> b!827907 t!22236))

(declare-fun b_and!22361 () Bool)

(assert (= b_and!22357 (and (=> t!22236 result!7967) b_and!22361)))

(declare-fun b_lambda!11165 () Bool)

(assert (=> (not b_lambda!11165) (not b!827911)))

(assert (=> b!827911 t!22236))

(declare-fun b_and!22363 () Bool)

(assert (= b_and!22361 (and (=> t!22236 result!7967) b_and!22363)))

(declare-fun m!770863 () Bool)

(assert (=> b!827905 m!770863))

(assert (=> b!827905 m!770863))

(declare-fun m!770865 () Bool)

(assert (=> b!827905 m!770865))

(declare-fun m!770867 () Bool)

(assert (=> bm!35946 m!770867))

(declare-fun m!770869 () Bool)

(assert (=> b!827907 m!770869))

(declare-fun m!770871 () Bool)

(assert (=> b!827907 m!770871))

(assert (=> b!827907 m!770863))

(declare-fun m!770873 () Bool)

(assert (=> b!827907 m!770873))

(declare-fun m!770875 () Bool)

(assert (=> b!827907 m!770875))

(assert (=> b!827907 m!770871))

(declare-fun m!770877 () Bool)

(assert (=> b!827907 m!770877))

(declare-fun m!770879 () Bool)

(assert (=> b!827907 m!770879))

(declare-fun m!770881 () Bool)

(assert (=> b!827907 m!770881))

(assert (=> b!827907 m!770879))

(assert (=> b!827907 m!770875))

(assert (=> b!827908 m!770863))

(assert (=> b!827908 m!770863))

(declare-fun m!770883 () Bool)

(assert (=> b!827908 m!770883))

(declare-fun m!770885 () Bool)

(assert (=> d!105129 m!770885))

(assert (=> d!105129 m!770837))

(declare-fun m!770887 () Bool)

(assert (=> b!827901 m!770887))

(assert (=> b!827902 m!770867))

(assert (=> b!827911 m!770863))

(assert (=> b!827911 m!770875))

(assert (=> b!827911 m!770871))

(assert (=> b!827911 m!770877))

(assert (=> b!827911 m!770875))

(assert (=> b!827911 m!770863))

(declare-fun m!770889 () Bool)

(assert (=> b!827911 m!770889))

(assert (=> b!827911 m!770871))

(declare-fun m!770891 () Bool)

(assert (=> b!827903 m!770891))

(assert (=> b!827906 m!770863))

(assert (=> b!827906 m!770863))

(assert (=> b!827906 m!770865))

(assert (=> b!827853 d!105129))

(declare-fun bm!35947 () Bool)

(declare-fun call!35950 () ListLongMap!8915)

(assert (=> bm!35947 (= call!35950 (getCurrentListMapNoExtraKeys!2475 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!827914 () Bool)

(declare-fun e!461272 () ListLongMap!8915)

(assert (=> b!827914 (= e!461272 (ListLongMap!8916 Nil!15882))))

(declare-fun b!827915 () Bool)

(declare-fun res!564237 () Bool)

(declare-fun e!461271 () Bool)

(assert (=> b!827915 (=> (not res!564237) (not e!461271))))

(declare-fun lt!375057 () ListLongMap!8915)

(assert (=> b!827915 (= res!564237 (not (contains!4185 lt!375057 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!827916 () Bool)

(declare-fun e!461276 () Bool)

(assert (=> b!827916 (= e!461276 (= lt!375057 (getCurrentListMapNoExtraKeys!2475 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!827917 () Bool)

(assert (=> b!827917 (= e!461276 (isEmpty!646 lt!375057))))

(declare-fun d!105131 () Bool)

(assert (=> d!105131 e!461271))

(declare-fun res!564238 () Bool)

(assert (=> d!105131 (=> (not res!564238) (not e!461271))))

(assert (=> d!105131 (= res!564238 (not (contains!4185 lt!375057 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105131 (= lt!375057 e!461272)))

(declare-fun c!89538 () Bool)

(assert (=> d!105131 (= c!89538 (bvsge #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(assert (=> d!105131 (validMask!0 mask!1312)))

(assert (=> d!105131 (= (getCurrentListMapNoExtraKeys!2475 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375057)))

(declare-fun b!827918 () Bool)

(declare-fun e!461273 () ListLongMap!8915)

(assert (=> b!827918 (= e!461273 call!35950)))

(declare-fun b!827919 () Bool)

(assert (=> b!827919 (= e!461272 e!461273)))

(declare-fun c!89536 () Bool)

(assert (=> b!827919 (= c!89536 (validKeyInArray!0 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827920 () Bool)

(declare-fun e!461277 () Bool)

(assert (=> b!827920 (= e!461277 (validKeyInArray!0 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827920 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!827921 () Bool)

(declare-fun lt!375053 () Unit!28363)

(declare-fun lt!375052 () Unit!28363)

(assert (=> b!827921 (= lt!375053 lt!375052)))

(declare-fun lt!375054 () (_ BitVec 64))

(declare-fun lt!375051 () V!25173)

(declare-fun lt!375056 () ListLongMap!8915)

(declare-fun lt!375055 () (_ BitVec 64))

(assert (=> b!827921 (not (contains!4185 (+!1957 lt!375056 (tuple2!10093 lt!375054 lt!375051)) lt!375055))))

(assert (=> b!827921 (= lt!375052 (addStillNotContains!189 lt!375056 lt!375054 lt!375051 lt!375055))))

(assert (=> b!827921 (= lt!375055 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!827921 (= lt!375051 (get!11783 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!827921 (= lt!375054 (select (arr!22255 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827921 (= lt!375056 call!35950)))

(assert (=> b!827921 (= e!461273 (+!1957 call!35950 (tuple2!10093 (select (arr!22255 _keys!976) #b00000000000000000000000000000000) (get!11783 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!827922 () Bool)

(declare-fun e!461275 () Bool)

(declare-fun e!461274 () Bool)

(assert (=> b!827922 (= e!461275 e!461274)))

(assert (=> b!827922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(declare-fun res!564240 () Bool)

(assert (=> b!827922 (= res!564240 (contains!4185 lt!375057 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827922 (=> (not res!564240) (not e!461274))))

(declare-fun b!827923 () Bool)

(assert (=> b!827923 (= e!461271 e!461275)))

(declare-fun c!89535 () Bool)

(assert (=> b!827923 (= c!89535 e!461277)))

(declare-fun res!564239 () Bool)

(assert (=> b!827923 (=> (not res!564239) (not e!461277))))

(assert (=> b!827923 (= res!564239 (bvslt #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(declare-fun b!827924 () Bool)

(assert (=> b!827924 (= e!461275 e!461276)))

(declare-fun c!89537 () Bool)

(assert (=> b!827924 (= c!89537 (bvslt #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(declare-fun b!827925 () Bool)

(assert (=> b!827925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(assert (=> b!827925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22677 _values!788)))))

(assert (=> b!827925 (= e!461274 (= (apply!364 lt!375057 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)) (get!11783 (select (arr!22256 _values!788) #b00000000000000000000000000000000) (dynLambda!975 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!105131 c!89538) b!827914))

(assert (= (and d!105131 (not c!89538)) b!827919))

(assert (= (and b!827919 c!89536) b!827921))

(assert (= (and b!827919 (not c!89536)) b!827918))

(assert (= (or b!827921 b!827918) bm!35947))

(assert (= (and d!105131 res!564238) b!827915))

(assert (= (and b!827915 res!564237) b!827923))

(assert (= (and b!827923 res!564239) b!827920))

(assert (= (and b!827923 c!89535) b!827922))

(assert (= (and b!827923 (not c!89535)) b!827924))

(assert (= (and b!827922 res!564240) b!827925))

(assert (= (and b!827924 c!89537) b!827916))

(assert (= (and b!827924 (not c!89537)) b!827917))

(declare-fun b_lambda!11167 () Bool)

(assert (=> (not b_lambda!11167) (not b!827921)))

(assert (=> b!827921 t!22236))

(declare-fun b_and!22365 () Bool)

(assert (= b_and!22363 (and (=> t!22236 result!7967) b_and!22365)))

(declare-fun b_lambda!11169 () Bool)

(assert (=> (not b_lambda!11169) (not b!827925)))

(assert (=> b!827925 t!22236))

(declare-fun b_and!22367 () Bool)

(assert (= b_and!22365 (and (=> t!22236 result!7967) b_and!22367)))

(assert (=> b!827919 m!770863))

(assert (=> b!827919 m!770863))

(assert (=> b!827919 m!770865))

(declare-fun m!770893 () Bool)

(assert (=> bm!35947 m!770893))

(declare-fun m!770895 () Bool)

(assert (=> b!827921 m!770895))

(assert (=> b!827921 m!770871))

(assert (=> b!827921 m!770863))

(declare-fun m!770897 () Bool)

(assert (=> b!827921 m!770897))

(assert (=> b!827921 m!770875))

(assert (=> b!827921 m!770871))

(assert (=> b!827921 m!770877))

(declare-fun m!770899 () Bool)

(assert (=> b!827921 m!770899))

(declare-fun m!770901 () Bool)

(assert (=> b!827921 m!770901))

(assert (=> b!827921 m!770899))

(assert (=> b!827921 m!770875))

(assert (=> b!827922 m!770863))

(assert (=> b!827922 m!770863))

(declare-fun m!770903 () Bool)

(assert (=> b!827922 m!770903))

(declare-fun m!770905 () Bool)

(assert (=> d!105131 m!770905))

(assert (=> d!105131 m!770837))

(declare-fun m!770907 () Bool)

(assert (=> b!827915 m!770907))

(assert (=> b!827916 m!770893))

(assert (=> b!827925 m!770863))

(assert (=> b!827925 m!770875))

(assert (=> b!827925 m!770871))

(assert (=> b!827925 m!770877))

(assert (=> b!827925 m!770875))

(assert (=> b!827925 m!770863))

(declare-fun m!770909 () Bool)

(assert (=> b!827925 m!770909))

(assert (=> b!827925 m!770871))

(declare-fun m!770911 () Bool)

(assert (=> b!827917 m!770911))

(assert (=> b!827920 m!770863))

(assert (=> b!827920 m!770863))

(assert (=> b!827920 m!770865))

(assert (=> b!827853 d!105131))

(declare-fun d!105133 () Bool)

(assert (=> d!105133 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71272 d!105133))

(declare-fun d!105135 () Bool)

(assert (=> d!105135 (= (array_inv!17731 _keys!976) (bvsge (size!22676 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71272 d!105135))

(declare-fun d!105137 () Bool)

(assert (=> d!105137 (= (array_inv!17732 _values!788) (bvsge (size!22677 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71272 d!105137))

(declare-fun b!827936 () Bool)

(declare-fun e!461288 () Bool)

(declare-fun call!35953 () Bool)

(assert (=> b!827936 (= e!461288 call!35953)))

(declare-fun b!827937 () Bool)

(declare-fun e!461286 () Bool)

(declare-fun contains!4186 (List!15884 (_ BitVec 64)) Bool)

(assert (=> b!827937 (= e!461286 (contains!4186 Nil!15881 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35950 () Bool)

(declare-fun c!89541 () Bool)

(assert (=> bm!35950 (= call!35953 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89541 (Cons!15880 (select (arr!22255 _keys!976) #b00000000000000000000000000000000) Nil!15881) Nil!15881)))))

(declare-fun b!827938 () Bool)

(assert (=> b!827938 (= e!461288 call!35953)))

(declare-fun b!827940 () Bool)

(declare-fun e!461289 () Bool)

(assert (=> b!827940 (= e!461289 e!461288)))

(assert (=> b!827940 (= c!89541 (validKeyInArray!0 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827939 () Bool)

(declare-fun e!461287 () Bool)

(assert (=> b!827939 (= e!461287 e!461289)))

(declare-fun res!564249 () Bool)

(assert (=> b!827939 (=> (not res!564249) (not e!461289))))

(assert (=> b!827939 (= res!564249 (not e!461286))))

(declare-fun res!564247 () Bool)

(assert (=> b!827939 (=> (not res!564247) (not e!461286))))

(assert (=> b!827939 (= res!564247 (validKeyInArray!0 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105139 () Bool)

(declare-fun res!564248 () Bool)

(assert (=> d!105139 (=> res!564248 e!461287)))

(assert (=> d!105139 (= res!564248 (bvsge #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(assert (=> d!105139 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15881) e!461287)))

(assert (= (and d!105139 (not res!564248)) b!827939))

(assert (= (and b!827939 res!564247) b!827937))

(assert (= (and b!827939 res!564249) b!827940))

(assert (= (and b!827940 c!89541) b!827936))

(assert (= (and b!827940 (not c!89541)) b!827938))

(assert (= (or b!827936 b!827938) bm!35950))

(assert (=> b!827937 m!770863))

(assert (=> b!827937 m!770863))

(declare-fun m!770913 () Bool)

(assert (=> b!827937 m!770913))

(assert (=> bm!35950 m!770863))

(declare-fun m!770915 () Bool)

(assert (=> bm!35950 m!770915))

(assert (=> b!827940 m!770863))

(assert (=> b!827940 m!770863))

(assert (=> b!827940 m!770865))

(assert (=> b!827939 m!770863))

(assert (=> b!827939 m!770863))

(assert (=> b!827939 m!770865))

(assert (=> b!827851 d!105139))

(declare-fun d!105141 () Bool)

(declare-fun res!564254 () Bool)

(declare-fun e!461296 () Bool)

(assert (=> d!105141 (=> res!564254 e!461296)))

(assert (=> d!105141 (= res!564254 (bvsge #b00000000000000000000000000000000 (size!22676 _keys!976)))))

(assert (=> d!105141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!461296)))

(declare-fun b!827949 () Bool)

(declare-fun e!461297 () Bool)

(assert (=> b!827949 (= e!461296 e!461297)))

(declare-fun c!89544 () Bool)

(assert (=> b!827949 (= c!89544 (validKeyInArray!0 (select (arr!22255 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827950 () Bool)

(declare-fun e!461298 () Bool)

(assert (=> b!827950 (= e!461297 e!461298)))

(declare-fun lt!375065 () (_ BitVec 64))

(assert (=> b!827950 (= lt!375065 (select (arr!22255 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375064 () Unit!28363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46422 (_ BitVec 64) (_ BitVec 32)) Unit!28363)

(assert (=> b!827950 (= lt!375064 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375065 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!827950 (arrayContainsKey!0 _keys!976 lt!375065 #b00000000000000000000000000000000)))

(declare-fun lt!375066 () Unit!28363)

(assert (=> b!827950 (= lt!375066 lt!375064)))

(declare-fun res!564255 () Bool)

(declare-datatypes ((SeekEntryResult!8736 0))(
  ( (MissingZero!8736 (index!37315 (_ BitVec 32))) (Found!8736 (index!37316 (_ BitVec 32))) (Intermediate!8736 (undefined!9548 Bool) (index!37317 (_ BitVec 32)) (x!69909 (_ BitVec 32))) (Undefined!8736) (MissingVacant!8736 (index!37318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46422 (_ BitVec 32)) SeekEntryResult!8736)

(assert (=> b!827950 (= res!564255 (= (seekEntryOrOpen!0 (select (arr!22255 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8736 #b00000000000000000000000000000000)))))

(assert (=> b!827950 (=> (not res!564255) (not e!461298))))

(declare-fun bm!35953 () Bool)

(declare-fun call!35956 () Bool)

(assert (=> bm!35953 (= call!35956 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!827951 () Bool)

(assert (=> b!827951 (= e!461298 call!35956)))

(declare-fun b!827952 () Bool)

(assert (=> b!827952 (= e!461297 call!35956)))

(assert (= (and d!105141 (not res!564254)) b!827949))

(assert (= (and b!827949 c!89544) b!827950))

(assert (= (and b!827949 (not c!89544)) b!827952))

(assert (= (and b!827950 res!564255) b!827951))

(assert (= (or b!827951 b!827952) bm!35953))

(assert (=> b!827949 m!770863))

(assert (=> b!827949 m!770863))

(assert (=> b!827949 m!770865))

(assert (=> b!827950 m!770863))

(declare-fun m!770917 () Bool)

(assert (=> b!827950 m!770917))

(declare-fun m!770919 () Bool)

(assert (=> b!827950 m!770919))

(assert (=> b!827950 m!770863))

(declare-fun m!770921 () Bool)

(assert (=> b!827950 m!770921))

(declare-fun m!770923 () Bool)

(assert (=> bm!35953 m!770923))

(assert (=> b!827848 d!105141))

(declare-fun b!827960 () Bool)

(declare-fun e!461303 () Bool)

(assert (=> b!827960 (= e!461303 tp_is_empty!15129)))

(declare-fun mapIsEmpty!24328 () Bool)

(declare-fun mapRes!24328 () Bool)

(assert (=> mapIsEmpty!24328 mapRes!24328))

(declare-fun condMapEmpty!24328 () Bool)

(declare-fun mapDefault!24328 () ValueCell!7149)

(assert (=> mapNonEmpty!24322 (= condMapEmpty!24328 (= mapRest!24322 ((as const (Array (_ BitVec 32) ValueCell!7149)) mapDefault!24328)))))

(assert (=> mapNonEmpty!24322 (= tp!47020 (and e!461303 mapRes!24328))))

(declare-fun mapNonEmpty!24328 () Bool)

(declare-fun tp!47029 () Bool)

(declare-fun e!461304 () Bool)

(assert (=> mapNonEmpty!24328 (= mapRes!24328 (and tp!47029 e!461304))))

(declare-fun mapValue!24328 () ValueCell!7149)

(declare-fun mapKey!24328 () (_ BitVec 32))

(declare-fun mapRest!24328 () (Array (_ BitVec 32) ValueCell!7149))

(assert (=> mapNonEmpty!24328 (= mapRest!24322 (store mapRest!24328 mapKey!24328 mapValue!24328))))

(declare-fun b!827959 () Bool)

(assert (=> b!827959 (= e!461304 tp_is_empty!15129)))

(assert (= (and mapNonEmpty!24322 condMapEmpty!24328) mapIsEmpty!24328))

(assert (= (and mapNonEmpty!24322 (not condMapEmpty!24328)) mapNonEmpty!24328))

(assert (= (and mapNonEmpty!24328 ((_ is ValueCellFull!7149) mapValue!24328)) b!827959))

(assert (= (and mapNonEmpty!24322 ((_ is ValueCellFull!7149) mapDefault!24328)) b!827960))

(declare-fun m!770925 () Bool)

(assert (=> mapNonEmpty!24328 m!770925))

(declare-fun b_lambda!11171 () Bool)

(assert (= b_lambda!11163 (or (and start!71272 b_free!13419) b_lambda!11171)))

(declare-fun b_lambda!11173 () Bool)

(assert (= b_lambda!11167 (or (and start!71272 b_free!13419) b_lambda!11173)))

(declare-fun b_lambda!11175 () Bool)

(assert (= b_lambda!11169 (or (and start!71272 b_free!13419) b_lambda!11175)))

(declare-fun b_lambda!11177 () Bool)

(assert (= b_lambda!11165 (or (and start!71272 b_free!13419) b_lambda!11177)))

(check-sat (not b_lambda!11173) b_and!22367 (not b!827917) (not b!827903) (not bm!35950) (not b_next!13419) (not b!827920) (not b!827950) (not b!827915) (not b!827911) tp_is_empty!15129 (not b!827916) (not bm!35946) (not b!827925) (not b_lambda!11177) (not b!827922) (not d!105131) (not mapNonEmpty!24328) (not b!827949) (not b!827921) (not b!827908) (not b!827905) (not b!827901) (not bm!35953) (not b_lambda!11175) (not b!827906) (not b!827919) (not b_lambda!11171) (not b!827902) (not b!827937) (not b!827940) (not d!105129) (not b!827939) (not b!827907) (not bm!35947))
(check-sat b_and!22367 (not b_next!13419))
