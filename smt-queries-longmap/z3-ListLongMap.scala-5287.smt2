; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71058 () Bool)

(assert start!71058)

(declare-fun b_free!13129 () Bool)

(declare-fun b_next!13129 () Bool)

(assert (=> start!71058 (= b_free!13129 (not b_next!13129))))

(declare-fun tp!46135 () Bool)

(declare-fun b_and!22023 () Bool)

(assert (=> start!71058 (= tp!46135 b_and!22023)))

(declare-fun b!824297 () Bool)

(declare-fun e!458539 () Bool)

(declare-fun tp_is_empty!14839 () Bool)

(assert (=> b!824297 (= e!458539 tp_is_empty!14839)))

(declare-fun b!824298 () Bool)

(declare-fun res!561867 () Bool)

(declare-fun e!458540 () Bool)

(assert (=> b!824298 (=> (not res!561867) (not e!458540))))

(declare-datatypes ((array!45871 0))(
  ( (array!45872 (arr!21980 (Array (_ BitVec 32) (_ BitVec 64))) (size!22400 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45871)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45871 (_ BitVec 32)) Bool)

(assert (=> b!824298 (= res!561867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824299 () Bool)

(declare-fun e!458538 () Bool)

(assert (=> b!824299 (= e!458538 (bvsle #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-datatypes ((V!24787 0))(
  ( (V!24788 (val!7467 Int)) )
))
(declare-datatypes ((tuple2!9788 0))(
  ( (tuple2!9789 (_1!4905 (_ BitVec 64)) (_2!4905 V!24787)) )
))
(declare-datatypes ((List!15575 0))(
  ( (Nil!15572) (Cons!15571 (h!16706 tuple2!9788) (t!21906 List!15575)) )
))
(declare-datatypes ((ListLongMap!8613 0))(
  ( (ListLongMap!8614 (toList!4322 List!15575)) )
))
(declare-fun lt!371606 () ListLongMap!8613)

(declare-fun lt!371600 () ListLongMap!8613)

(declare-fun lt!371605 () tuple2!9788)

(declare-fun +!1910 (ListLongMap!8613 tuple2!9788) ListLongMap!8613)

(assert (=> b!824299 (= lt!371606 (+!1910 lt!371600 lt!371605))))

(declare-fun zeroValueAfter!34 () V!24787)

(declare-fun minValue!754 () V!24787)

(declare-datatypes ((Unit!28195 0))(
  ( (Unit!28196) )
))
(declare-fun lt!371598 () Unit!28195)

(declare-fun lt!371597 () ListLongMap!8613)

(declare-fun addCommutativeForDiffKeys!468 (ListLongMap!8613 (_ BitVec 64) V!24787 (_ BitVec 64) V!24787) Unit!28195)

(assert (=> b!824299 (= lt!371598 (addCommutativeForDiffKeys!468 lt!371597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371602 () ListLongMap!8613)

(assert (=> b!824299 (= lt!371602 lt!371606)))

(declare-fun lt!371599 () tuple2!9788)

(assert (=> b!824299 (= lt!371606 (+!1910 (+!1910 lt!371597 lt!371605) lt!371599))))

(assert (=> b!824299 (= lt!371605 (tuple2!9789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371601 () ListLongMap!8613)

(assert (=> b!824299 (= lt!371601 lt!371600)))

(assert (=> b!824299 (= lt!371600 (+!1910 lt!371597 lt!371599))))

(assert (=> b!824299 (= lt!371599 (tuple2!9789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!7004 0))(
  ( (ValueCellFull!7004 (v!9899 V!24787)) (EmptyCell!7004) )
))
(declare-datatypes ((array!45873 0))(
  ( (array!45874 (arr!21981 (Array (_ BitVec 32) ValueCell!7004)) (size!22401 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45873)

(declare-fun getCurrentListMap!2474 (array!45871 array!45873 (_ BitVec 32) (_ BitVec 32) V!24787 V!24787 (_ BitVec 32) Int) ListLongMap!8613)

(assert (=> b!824299 (= lt!371602 (getCurrentListMap!2474 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24787)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824299 (= lt!371601 (getCurrentListMap!2474 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824300 () Bool)

(declare-fun e!458542 () Bool)

(declare-fun e!458537 () Bool)

(declare-fun mapRes!23872 () Bool)

(assert (=> b!824300 (= e!458542 (and e!458537 mapRes!23872))))

(declare-fun condMapEmpty!23872 () Bool)

(declare-fun mapDefault!23872 () ValueCell!7004)

(assert (=> b!824300 (= condMapEmpty!23872 (= (arr!21981 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7004)) mapDefault!23872)))))

(declare-fun b!824301 () Bool)

(assert (=> b!824301 (= e!458537 tp_is_empty!14839)))

(declare-fun mapNonEmpty!23872 () Bool)

(declare-fun tp!46134 () Bool)

(assert (=> mapNonEmpty!23872 (= mapRes!23872 (and tp!46134 e!458539))))

(declare-fun mapRest!23872 () (Array (_ BitVec 32) ValueCell!7004))

(declare-fun mapKey!23872 () (_ BitVec 32))

(declare-fun mapValue!23872 () ValueCell!7004)

(assert (=> mapNonEmpty!23872 (= (arr!21981 _values!788) (store mapRest!23872 mapKey!23872 mapValue!23872))))

(declare-fun mapIsEmpty!23872 () Bool)

(assert (=> mapIsEmpty!23872 mapRes!23872))

(declare-fun b!824302 () Bool)

(declare-fun res!561866 () Bool)

(assert (=> b!824302 (=> (not res!561866) (not e!458540))))

(declare-datatypes ((List!15576 0))(
  ( (Nil!15573) (Cons!15572 (h!16707 (_ BitVec 64)) (t!21907 List!15576)) )
))
(declare-fun arrayNoDuplicates!0 (array!45871 (_ BitVec 32) List!15576) Bool)

(assert (=> b!824302 (= res!561866 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15573))))

(declare-fun b!824303 () Bool)

(declare-fun res!561868 () Bool)

(assert (=> b!824303 (=> (not res!561868) (not e!458540))))

(assert (=> b!824303 (= res!561868 (and (= (size!22401 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22400 _keys!976) (size!22401 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824304 () Bool)

(assert (=> b!824304 (= e!458540 (not e!458538))))

(declare-fun res!561869 () Bool)

(assert (=> b!824304 (=> res!561869 e!458538)))

(assert (=> b!824304 (= res!561869 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!371603 () ListLongMap!8613)

(assert (=> b!824304 (= lt!371597 lt!371603)))

(declare-fun lt!371604 () Unit!28195)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!493 (array!45871 array!45873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24787 V!24787 V!24787 V!24787 (_ BitVec 32) Int) Unit!28195)

(assert (=> b!824304 (= lt!371604 (lemmaNoChangeToArrayThenSameMapNoExtras!493 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2405 (array!45871 array!45873 (_ BitVec 32) (_ BitVec 32) V!24787 V!24787 (_ BitVec 32) Int) ListLongMap!8613)

(assert (=> b!824304 (= lt!371603 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824304 (= lt!371597 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561865 () Bool)

(assert (=> start!71058 (=> (not res!561865) (not e!458540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71058 (= res!561865 (validMask!0 mask!1312))))

(assert (=> start!71058 e!458540))

(assert (=> start!71058 tp_is_empty!14839))

(declare-fun array_inv!17579 (array!45871) Bool)

(assert (=> start!71058 (array_inv!17579 _keys!976)))

(assert (=> start!71058 true))

(declare-fun array_inv!17580 (array!45873) Bool)

(assert (=> start!71058 (and (array_inv!17580 _values!788) e!458542)))

(assert (=> start!71058 tp!46135))

(assert (= (and start!71058 res!561865) b!824303))

(assert (= (and b!824303 res!561868) b!824298))

(assert (= (and b!824298 res!561867) b!824302))

(assert (= (and b!824302 res!561866) b!824304))

(assert (= (and b!824304 (not res!561869)) b!824299))

(assert (= (and b!824300 condMapEmpty!23872) mapIsEmpty!23872))

(assert (= (and b!824300 (not condMapEmpty!23872)) mapNonEmpty!23872))

(get-info :version)

(assert (= (and mapNonEmpty!23872 ((_ is ValueCellFull!7004) mapValue!23872)) b!824297))

(assert (= (and b!824300 ((_ is ValueCellFull!7004) mapDefault!23872)) b!824301))

(assert (= start!71058 b!824300))

(declare-fun m!766835 () Bool)

(assert (=> b!824299 m!766835))

(declare-fun m!766837 () Bool)

(assert (=> b!824299 m!766837))

(declare-fun m!766839 () Bool)

(assert (=> b!824299 m!766839))

(assert (=> b!824299 m!766837))

(declare-fun m!766841 () Bool)

(assert (=> b!824299 m!766841))

(declare-fun m!766843 () Bool)

(assert (=> b!824299 m!766843))

(declare-fun m!766845 () Bool)

(assert (=> b!824299 m!766845))

(declare-fun m!766847 () Bool)

(assert (=> b!824299 m!766847))

(declare-fun m!766849 () Bool)

(assert (=> b!824304 m!766849))

(declare-fun m!766851 () Bool)

(assert (=> b!824304 m!766851))

(declare-fun m!766853 () Bool)

(assert (=> b!824304 m!766853))

(declare-fun m!766855 () Bool)

(assert (=> b!824302 m!766855))

(declare-fun m!766857 () Bool)

(assert (=> start!71058 m!766857))

(declare-fun m!766859 () Bool)

(assert (=> start!71058 m!766859))

(declare-fun m!766861 () Bool)

(assert (=> start!71058 m!766861))

(declare-fun m!766863 () Bool)

(assert (=> b!824298 m!766863))

(declare-fun m!766865 () Bool)

(assert (=> mapNonEmpty!23872 m!766865))

(check-sat (not mapNonEmpty!23872) (not b!824304) (not start!71058) (not b!824298) (not b!824302) (not b!824299) b_and!22023 tp_is_empty!14839 (not b_next!13129))
(check-sat b_and!22023 (not b_next!13129))
(get-model)

(declare-fun d!105197 () Bool)

(assert (=> d!105197 (= (+!1910 (+!1910 lt!371597 (tuple2!9789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!9789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (+!1910 (+!1910 lt!371597 (tuple2!9789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (tuple2!9789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!371669 () Unit!28195)

(declare-fun choose!1407 (ListLongMap!8613 (_ BitVec 64) V!24787 (_ BitVec 64) V!24787) Unit!28195)

(assert (=> d!105197 (= lt!371669 (choose!1407 lt!371597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> d!105197 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105197 (= (addCommutativeForDiffKeys!468 lt!371597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754) lt!371669)))

(declare-fun bs!23000 () Bool)

(assert (= bs!23000 d!105197))

(declare-fun m!766931 () Bool)

(assert (=> bs!23000 m!766931))

(declare-fun m!766933 () Bool)

(assert (=> bs!23000 m!766933))

(assert (=> bs!23000 m!766933))

(declare-fun m!766935 () Bool)

(assert (=> bs!23000 m!766935))

(assert (=> bs!23000 m!766931))

(declare-fun m!766937 () Bool)

(assert (=> bs!23000 m!766937))

(declare-fun m!766939 () Bool)

(assert (=> bs!23000 m!766939))

(assert (=> b!824299 d!105197))

(declare-fun d!105199 () Bool)

(declare-fun e!458581 () Bool)

(assert (=> d!105199 e!458581))

(declare-fun res!561904 () Bool)

(assert (=> d!105199 (=> (not res!561904) (not e!458581))))

(declare-fun lt!371678 () ListLongMap!8613)

(declare-fun contains!4150 (ListLongMap!8613 (_ BitVec 64)) Bool)

(assert (=> d!105199 (= res!561904 (contains!4150 lt!371678 (_1!4905 lt!371599)))))

(declare-fun lt!371679 () List!15575)

(assert (=> d!105199 (= lt!371678 (ListLongMap!8614 lt!371679))))

(declare-fun lt!371681 () Unit!28195)

(declare-fun lt!371680 () Unit!28195)

(assert (=> d!105199 (= lt!371681 lt!371680)))

(declare-datatypes ((Option!412 0))(
  ( (Some!411 (v!9902 V!24787)) (None!410) )
))
(declare-fun getValueByKey!406 (List!15575 (_ BitVec 64)) Option!412)

(assert (=> d!105199 (= (getValueByKey!406 lt!371679 (_1!4905 lt!371599)) (Some!411 (_2!4905 lt!371599)))))

(declare-fun lemmaContainsTupThenGetReturnValue!220 (List!15575 (_ BitVec 64) V!24787) Unit!28195)

(assert (=> d!105199 (= lt!371680 (lemmaContainsTupThenGetReturnValue!220 lt!371679 (_1!4905 lt!371599) (_2!4905 lt!371599)))))

(declare-fun insertStrictlySorted!259 (List!15575 (_ BitVec 64) V!24787) List!15575)

(assert (=> d!105199 (= lt!371679 (insertStrictlySorted!259 (toList!4322 (+!1910 lt!371597 lt!371605)) (_1!4905 lt!371599) (_2!4905 lt!371599)))))

(assert (=> d!105199 (= (+!1910 (+!1910 lt!371597 lt!371605) lt!371599) lt!371678)))

(declare-fun b!824357 () Bool)

(declare-fun res!561905 () Bool)

(assert (=> b!824357 (=> (not res!561905) (not e!458581))))

(assert (=> b!824357 (= res!561905 (= (getValueByKey!406 (toList!4322 lt!371678) (_1!4905 lt!371599)) (Some!411 (_2!4905 lt!371599))))))

(declare-fun b!824358 () Bool)

(declare-fun contains!4151 (List!15575 tuple2!9788) Bool)

(assert (=> b!824358 (= e!458581 (contains!4151 (toList!4322 lt!371678) lt!371599))))

(assert (= (and d!105199 res!561904) b!824357))

(assert (= (and b!824357 res!561905) b!824358))

(declare-fun m!766941 () Bool)

(assert (=> d!105199 m!766941))

(declare-fun m!766943 () Bool)

(assert (=> d!105199 m!766943))

(declare-fun m!766945 () Bool)

(assert (=> d!105199 m!766945))

(declare-fun m!766947 () Bool)

(assert (=> d!105199 m!766947))

(declare-fun m!766949 () Bool)

(assert (=> b!824357 m!766949))

(declare-fun m!766951 () Bool)

(assert (=> b!824358 m!766951))

(assert (=> b!824299 d!105199))

(declare-fun d!105201 () Bool)

(declare-fun e!458582 () Bool)

(assert (=> d!105201 e!458582))

(declare-fun res!561906 () Bool)

(assert (=> d!105201 (=> (not res!561906) (not e!458582))))

(declare-fun lt!371682 () ListLongMap!8613)

(assert (=> d!105201 (= res!561906 (contains!4150 lt!371682 (_1!4905 lt!371605)))))

(declare-fun lt!371683 () List!15575)

(assert (=> d!105201 (= lt!371682 (ListLongMap!8614 lt!371683))))

(declare-fun lt!371685 () Unit!28195)

(declare-fun lt!371684 () Unit!28195)

(assert (=> d!105201 (= lt!371685 lt!371684)))

(assert (=> d!105201 (= (getValueByKey!406 lt!371683 (_1!4905 lt!371605)) (Some!411 (_2!4905 lt!371605)))))

(assert (=> d!105201 (= lt!371684 (lemmaContainsTupThenGetReturnValue!220 lt!371683 (_1!4905 lt!371605) (_2!4905 lt!371605)))))

(assert (=> d!105201 (= lt!371683 (insertStrictlySorted!259 (toList!4322 lt!371600) (_1!4905 lt!371605) (_2!4905 lt!371605)))))

(assert (=> d!105201 (= (+!1910 lt!371600 lt!371605) lt!371682)))

(declare-fun b!824359 () Bool)

(declare-fun res!561907 () Bool)

(assert (=> b!824359 (=> (not res!561907) (not e!458582))))

(assert (=> b!824359 (= res!561907 (= (getValueByKey!406 (toList!4322 lt!371682) (_1!4905 lt!371605)) (Some!411 (_2!4905 lt!371605))))))

(declare-fun b!824360 () Bool)

(assert (=> b!824360 (= e!458582 (contains!4151 (toList!4322 lt!371682) lt!371605))))

(assert (= (and d!105201 res!561906) b!824359))

(assert (= (and b!824359 res!561907) b!824360))

(declare-fun m!766953 () Bool)

(assert (=> d!105201 m!766953))

(declare-fun m!766955 () Bool)

(assert (=> d!105201 m!766955))

(declare-fun m!766957 () Bool)

(assert (=> d!105201 m!766957))

(declare-fun m!766959 () Bool)

(assert (=> d!105201 m!766959))

(declare-fun m!766961 () Bool)

(assert (=> b!824359 m!766961))

(declare-fun m!766963 () Bool)

(assert (=> b!824360 m!766963))

(assert (=> b!824299 d!105201))

(declare-fun d!105203 () Bool)

(declare-fun e!458583 () Bool)

(assert (=> d!105203 e!458583))

(declare-fun res!561908 () Bool)

(assert (=> d!105203 (=> (not res!561908) (not e!458583))))

(declare-fun lt!371686 () ListLongMap!8613)

(assert (=> d!105203 (= res!561908 (contains!4150 lt!371686 (_1!4905 lt!371605)))))

(declare-fun lt!371687 () List!15575)

(assert (=> d!105203 (= lt!371686 (ListLongMap!8614 lt!371687))))

(declare-fun lt!371689 () Unit!28195)

(declare-fun lt!371688 () Unit!28195)

(assert (=> d!105203 (= lt!371689 lt!371688)))

(assert (=> d!105203 (= (getValueByKey!406 lt!371687 (_1!4905 lt!371605)) (Some!411 (_2!4905 lt!371605)))))

(assert (=> d!105203 (= lt!371688 (lemmaContainsTupThenGetReturnValue!220 lt!371687 (_1!4905 lt!371605) (_2!4905 lt!371605)))))

(assert (=> d!105203 (= lt!371687 (insertStrictlySorted!259 (toList!4322 lt!371597) (_1!4905 lt!371605) (_2!4905 lt!371605)))))

(assert (=> d!105203 (= (+!1910 lt!371597 lt!371605) lt!371686)))

(declare-fun b!824361 () Bool)

(declare-fun res!561909 () Bool)

(assert (=> b!824361 (=> (not res!561909) (not e!458583))))

(assert (=> b!824361 (= res!561909 (= (getValueByKey!406 (toList!4322 lt!371686) (_1!4905 lt!371605)) (Some!411 (_2!4905 lt!371605))))))

(declare-fun b!824362 () Bool)

(assert (=> b!824362 (= e!458583 (contains!4151 (toList!4322 lt!371686) lt!371605))))

(assert (= (and d!105203 res!561908) b!824361))

(assert (= (and b!824361 res!561909) b!824362))

(declare-fun m!766965 () Bool)

(assert (=> d!105203 m!766965))

(declare-fun m!766967 () Bool)

(assert (=> d!105203 m!766967))

(declare-fun m!766969 () Bool)

(assert (=> d!105203 m!766969))

(declare-fun m!766971 () Bool)

(assert (=> d!105203 m!766971))

(declare-fun m!766973 () Bool)

(assert (=> b!824361 m!766973))

(declare-fun m!766975 () Bool)

(assert (=> b!824362 m!766975))

(assert (=> b!824299 d!105203))

(declare-fun call!35857 () ListLongMap!8613)

(declare-fun bm!35848 () Bool)

(assert (=> bm!35848 (= call!35857 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824405 () Bool)

(declare-fun e!458620 () Bool)

(declare-fun lt!371746 () ListLongMap!8613)

(declare-fun apply!359 (ListLongMap!8613 (_ BitVec 64)) V!24787)

(assert (=> b!824405 (= e!458620 (= (apply!359 lt!371746 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun e!458619 () Bool)

(declare-fun b!824406 () Bool)

(declare-fun get!11685 (ValueCell!7004 V!24787) V!24787)

(declare-fun dynLambda!967 (Int (_ BitVec 64)) V!24787)

(assert (=> b!824406 (= e!458619 (= (apply!359 lt!371746 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)) (get!11685 (select (arr!21981 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!824406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22401 _values!788)))))

(assert (=> b!824406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun b!824407 () Bool)

(declare-fun e!458621 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!824407 (= e!458621 (validKeyInArray!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824408 () Bool)

(declare-fun e!458618 () Bool)

(declare-fun call!35854 () Bool)

(assert (=> b!824408 (= e!458618 (not call!35854))))

(declare-fun bm!35849 () Bool)

(assert (=> bm!35849 (= call!35854 (contains!4150 lt!371746 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!824409 () Bool)

(declare-fun e!458616 () Bool)

(assert (=> b!824409 (= e!458616 e!458619)))

(declare-fun res!561935 () Bool)

(assert (=> b!824409 (=> (not res!561935) (not e!458619))))

(assert (=> b!824409 (= res!561935 (contains!4150 lt!371746 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824409 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun b!824410 () Bool)

(declare-fun e!458610 () ListLongMap!8613)

(declare-fun call!35853 () ListLongMap!8613)

(assert (=> b!824410 (= e!458610 call!35853)))

(declare-fun b!824411 () Bool)

(declare-fun e!458611 () Unit!28195)

(declare-fun lt!371749 () Unit!28195)

(assert (=> b!824411 (= e!458611 lt!371749)))

(declare-fun lt!371737 () ListLongMap!8613)

(assert (=> b!824411 (= lt!371737 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371750 () (_ BitVec 64))

(assert (=> b!824411 (= lt!371750 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371753 () (_ BitVec 64))

(assert (=> b!824411 (= lt!371753 (select (arr!21980 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371736 () Unit!28195)

(declare-fun addStillContains!312 (ListLongMap!8613 (_ BitVec 64) V!24787 (_ BitVec 64)) Unit!28195)

(assert (=> b!824411 (= lt!371736 (addStillContains!312 lt!371737 lt!371750 zeroValueBefore!34 lt!371753))))

(assert (=> b!824411 (contains!4150 (+!1910 lt!371737 (tuple2!9789 lt!371750 zeroValueBefore!34)) lt!371753)))

(declare-fun lt!371752 () Unit!28195)

(assert (=> b!824411 (= lt!371752 lt!371736)))

(declare-fun lt!371735 () ListLongMap!8613)

(assert (=> b!824411 (= lt!371735 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371751 () (_ BitVec 64))

(assert (=> b!824411 (= lt!371751 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371744 () (_ BitVec 64))

(assert (=> b!824411 (= lt!371744 (select (arr!21980 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371739 () Unit!28195)

(declare-fun addApplyDifferent!312 (ListLongMap!8613 (_ BitVec 64) V!24787 (_ BitVec 64)) Unit!28195)

(assert (=> b!824411 (= lt!371739 (addApplyDifferent!312 lt!371735 lt!371751 minValue!754 lt!371744))))

(assert (=> b!824411 (= (apply!359 (+!1910 lt!371735 (tuple2!9789 lt!371751 minValue!754)) lt!371744) (apply!359 lt!371735 lt!371744))))

(declare-fun lt!371738 () Unit!28195)

(assert (=> b!824411 (= lt!371738 lt!371739)))

(declare-fun lt!371742 () ListLongMap!8613)

(assert (=> b!824411 (= lt!371742 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371754 () (_ BitVec 64))

(assert (=> b!824411 (= lt!371754 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371755 () (_ BitVec 64))

(assert (=> b!824411 (= lt!371755 (select (arr!21980 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371743 () Unit!28195)

(assert (=> b!824411 (= lt!371743 (addApplyDifferent!312 lt!371742 lt!371754 zeroValueBefore!34 lt!371755))))

(assert (=> b!824411 (= (apply!359 (+!1910 lt!371742 (tuple2!9789 lt!371754 zeroValueBefore!34)) lt!371755) (apply!359 lt!371742 lt!371755))))

(declare-fun lt!371740 () Unit!28195)

(assert (=> b!824411 (= lt!371740 lt!371743)))

(declare-fun lt!371747 () ListLongMap!8613)

(assert (=> b!824411 (= lt!371747 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371745 () (_ BitVec 64))

(assert (=> b!824411 (= lt!371745 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371741 () (_ BitVec 64))

(assert (=> b!824411 (= lt!371741 (select (arr!21980 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!824411 (= lt!371749 (addApplyDifferent!312 lt!371747 lt!371745 minValue!754 lt!371741))))

(assert (=> b!824411 (= (apply!359 (+!1910 lt!371747 (tuple2!9789 lt!371745 minValue!754)) lt!371741) (apply!359 lt!371747 lt!371741))))

(declare-fun b!824412 () Bool)

(declare-fun res!561930 () Bool)

(declare-fun e!458615 () Bool)

(assert (=> b!824412 (=> (not res!561930) (not e!458615))))

(assert (=> b!824412 (= res!561930 e!458618)))

(declare-fun c!89613 () Bool)

(assert (=> b!824412 (= c!89613 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!824413 () Bool)

(declare-fun e!458617 () Bool)

(declare-fun call!35856 () Bool)

(assert (=> b!824413 (= e!458617 (not call!35856))))

(declare-fun c!89616 () Bool)

(declare-fun call!35851 () ListLongMap!8613)

(declare-fun call!35855 () ListLongMap!8613)

(declare-fun call!35852 () ListLongMap!8613)

(declare-fun bm!35850 () Bool)

(declare-fun c!89615 () Bool)

(assert (=> bm!35850 (= call!35852 (+!1910 (ite c!89615 call!35857 (ite c!89616 call!35855 call!35851)) (ite (or c!89615 c!89616) (tuple2!9789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!35851 () Bool)

(assert (=> bm!35851 (= call!35856 (contains!4150 lt!371746 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!824414 () Bool)

(declare-fun Unit!28201 () Unit!28195)

(assert (=> b!824414 (= e!458611 Unit!28201)))

(declare-fun b!824415 () Bool)

(declare-fun c!89614 () Bool)

(assert (=> b!824415 (= c!89614 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!458613 () ListLongMap!8613)

(assert (=> b!824415 (= e!458613 e!458610)))

(declare-fun bm!35852 () Bool)

(assert (=> bm!35852 (= call!35855 call!35857)))

(declare-fun b!824416 () Bool)

(declare-fun res!561934 () Bool)

(assert (=> b!824416 (=> (not res!561934) (not e!458615))))

(assert (=> b!824416 (= res!561934 e!458616)))

(declare-fun res!561936 () Bool)

(assert (=> b!824416 (=> res!561936 e!458616)))

(declare-fun e!458614 () Bool)

(assert (=> b!824416 (= res!561936 (not e!458614))))

(declare-fun res!561932 () Bool)

(assert (=> b!824416 (=> (not res!561932) (not e!458614))))

(assert (=> b!824416 (= res!561932 (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun bm!35853 () Bool)

(assert (=> bm!35853 (= call!35851 call!35855)))

(declare-fun b!824417 () Bool)

(assert (=> b!824417 (= e!458615 e!458617)))

(declare-fun c!89617 () Bool)

(assert (=> b!824417 (= c!89617 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!824418 () Bool)

(assert (=> b!824418 (= e!458613 call!35853)))

(declare-fun bm!35854 () Bool)

(assert (=> bm!35854 (= call!35853 call!35852)))

(declare-fun b!824419 () Bool)

(declare-fun e!458622 () Bool)

(assert (=> b!824419 (= e!458617 e!458622)))

(declare-fun res!561929 () Bool)

(assert (=> b!824419 (= res!561929 call!35856)))

(assert (=> b!824419 (=> (not res!561929) (not e!458622))))

(declare-fun d!105205 () Bool)

(assert (=> d!105205 e!458615))

(declare-fun res!561928 () Bool)

(assert (=> d!105205 (=> (not res!561928) (not e!458615))))

(assert (=> d!105205 (= res!561928 (or (bvsge #b00000000000000000000000000000000 (size!22400 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))))

(declare-fun lt!371734 () ListLongMap!8613)

(assert (=> d!105205 (= lt!371746 lt!371734)))

(declare-fun lt!371748 () Unit!28195)

(assert (=> d!105205 (= lt!371748 e!458611)))

(declare-fun c!89612 () Bool)

(assert (=> d!105205 (= c!89612 e!458621)))

(declare-fun res!561931 () Bool)

(assert (=> d!105205 (=> (not res!561931) (not e!458621))))

(assert (=> d!105205 (= res!561931 (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun e!458612 () ListLongMap!8613)

(assert (=> d!105205 (= lt!371734 e!458612)))

(assert (=> d!105205 (= c!89615 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105205 (validMask!0 mask!1312)))

(assert (=> d!105205 (= (getCurrentListMap!2474 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371746)))

(declare-fun b!824420 () Bool)

(assert (=> b!824420 (= e!458622 (= (apply!359 lt!371746 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!824421 () Bool)

(assert (=> b!824421 (= e!458610 call!35851)))

(declare-fun b!824422 () Bool)

(assert (=> b!824422 (= e!458612 (+!1910 call!35852 (tuple2!9789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!824423 () Bool)

(assert (=> b!824423 (= e!458612 e!458613)))

(assert (=> b!824423 (= c!89616 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!824424 () Bool)

(assert (=> b!824424 (= e!458618 e!458620)))

(declare-fun res!561933 () Bool)

(assert (=> b!824424 (= res!561933 call!35854)))

(assert (=> b!824424 (=> (not res!561933) (not e!458620))))

(declare-fun b!824425 () Bool)

(assert (=> b!824425 (= e!458614 (validKeyInArray!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105205 c!89615) b!824422))

(assert (= (and d!105205 (not c!89615)) b!824423))

(assert (= (and b!824423 c!89616) b!824418))

(assert (= (and b!824423 (not c!89616)) b!824415))

(assert (= (and b!824415 c!89614) b!824410))

(assert (= (and b!824415 (not c!89614)) b!824421))

(assert (= (or b!824410 b!824421) bm!35853))

(assert (= (or b!824418 bm!35853) bm!35852))

(assert (= (or b!824418 b!824410) bm!35854))

(assert (= (or b!824422 bm!35852) bm!35848))

(assert (= (or b!824422 bm!35854) bm!35850))

(assert (= (and d!105205 res!561931) b!824407))

(assert (= (and d!105205 c!89612) b!824411))

(assert (= (and d!105205 (not c!89612)) b!824414))

(assert (= (and d!105205 res!561928) b!824416))

(assert (= (and b!824416 res!561932) b!824425))

(assert (= (and b!824416 (not res!561936)) b!824409))

(assert (= (and b!824409 res!561935) b!824406))

(assert (= (and b!824416 res!561934) b!824412))

(assert (= (and b!824412 c!89613) b!824424))

(assert (= (and b!824412 (not c!89613)) b!824408))

(assert (= (and b!824424 res!561933) b!824405))

(assert (= (or b!824424 b!824408) bm!35849))

(assert (= (and b!824412 res!561930) b!824417))

(assert (= (and b!824417 c!89617) b!824419))

(assert (= (and b!824417 (not c!89617)) b!824413))

(assert (= (and b!824419 res!561929) b!824420))

(assert (= (or b!824419 b!824413) bm!35851))

(declare-fun b_lambda!11069 () Bool)

(assert (=> (not b_lambda!11069) (not b!824406)))

(declare-fun t!21912 () Bool)

(declare-fun tb!4191 () Bool)

(assert (=> (and start!71058 (= defaultEntry!796 defaultEntry!796) t!21912) tb!4191))

(declare-fun result!7929 () Bool)

(assert (=> tb!4191 (= result!7929 tp_is_empty!14839)))

(assert (=> b!824406 t!21912))

(declare-fun b_and!22029 () Bool)

(assert (= b_and!22023 (and (=> t!21912 result!7929) b_and!22029)))

(assert (=> bm!35848 m!766853))

(declare-fun m!766977 () Bool)

(assert (=> bm!35849 m!766977))

(declare-fun m!766979 () Bool)

(assert (=> b!824406 m!766979))

(declare-fun m!766981 () Bool)

(assert (=> b!824406 m!766981))

(declare-fun m!766983 () Bool)

(assert (=> b!824406 m!766983))

(declare-fun m!766985 () Bool)

(assert (=> b!824406 m!766985))

(declare-fun m!766987 () Bool)

(assert (=> b!824406 m!766987))

(assert (=> b!824406 m!766979))

(assert (=> b!824406 m!766985))

(assert (=> b!824406 m!766981))

(assert (=> b!824407 m!766985))

(assert (=> b!824407 m!766985))

(declare-fun m!766989 () Bool)

(assert (=> b!824407 m!766989))

(declare-fun m!766991 () Bool)

(assert (=> bm!35851 m!766991))

(assert (=> b!824409 m!766985))

(assert (=> b!824409 m!766985))

(declare-fun m!766993 () Bool)

(assert (=> b!824409 m!766993))

(declare-fun m!766995 () Bool)

(assert (=> bm!35850 m!766995))

(assert (=> d!105205 m!766857))

(declare-fun m!766997 () Bool)

(assert (=> b!824411 m!766997))

(declare-fun m!766999 () Bool)

(assert (=> b!824411 m!766999))

(declare-fun m!767001 () Bool)

(assert (=> b!824411 m!767001))

(declare-fun m!767003 () Bool)

(assert (=> b!824411 m!767003))

(declare-fun m!767005 () Bool)

(assert (=> b!824411 m!767005))

(assert (=> b!824411 m!767005))

(declare-fun m!767007 () Bool)

(assert (=> b!824411 m!767007))

(declare-fun m!767009 () Bool)

(assert (=> b!824411 m!767009))

(declare-fun m!767011 () Bool)

(assert (=> b!824411 m!767011))

(assert (=> b!824411 m!766985))

(declare-fun m!767013 () Bool)

(assert (=> b!824411 m!767013))

(assert (=> b!824411 m!767001))

(declare-fun m!767015 () Bool)

(assert (=> b!824411 m!767015))

(assert (=> b!824411 m!767015))

(declare-fun m!767017 () Bool)

(assert (=> b!824411 m!767017))

(assert (=> b!824411 m!766853))

(declare-fun m!767019 () Bool)

(assert (=> b!824411 m!767019))

(declare-fun m!767021 () Bool)

(assert (=> b!824411 m!767021))

(declare-fun m!767023 () Bool)

(assert (=> b!824411 m!767023))

(assert (=> b!824411 m!767011))

(declare-fun m!767025 () Bool)

(assert (=> b!824411 m!767025))

(assert (=> b!824425 m!766985))

(assert (=> b!824425 m!766985))

(assert (=> b!824425 m!766989))

(declare-fun m!767027 () Bool)

(assert (=> b!824405 m!767027))

(declare-fun m!767029 () Bool)

(assert (=> b!824422 m!767029))

(declare-fun m!767031 () Bool)

(assert (=> b!824420 m!767031))

(assert (=> b!824299 d!105205))

(declare-fun bm!35855 () Bool)

(declare-fun call!35864 () ListLongMap!8613)

(assert (=> bm!35855 (= call!35864 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824428 () Bool)

(declare-fun e!458633 () Bool)

(declare-fun lt!371768 () ListLongMap!8613)

(assert (=> b!824428 (= e!458633 (= (apply!359 lt!371768 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun e!458632 () Bool)

(declare-fun b!824429 () Bool)

(assert (=> b!824429 (= e!458632 (= (apply!359 lt!371768 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)) (get!11685 (select (arr!21981 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!824429 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22401 _values!788)))))

(assert (=> b!824429 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun b!824430 () Bool)

(declare-fun e!458634 () Bool)

(assert (=> b!824430 (= e!458634 (validKeyInArray!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824431 () Bool)

(declare-fun e!458631 () Bool)

(declare-fun call!35861 () Bool)

(assert (=> b!824431 (= e!458631 (not call!35861))))

(declare-fun bm!35856 () Bool)

(assert (=> bm!35856 (= call!35861 (contains!4150 lt!371768 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!824432 () Bool)

(declare-fun e!458629 () Bool)

(assert (=> b!824432 (= e!458629 e!458632)))

(declare-fun res!561944 () Bool)

(assert (=> b!824432 (=> (not res!561944) (not e!458632))))

(assert (=> b!824432 (= res!561944 (contains!4150 lt!371768 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824432 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun b!824433 () Bool)

(declare-fun e!458623 () ListLongMap!8613)

(declare-fun call!35860 () ListLongMap!8613)

(assert (=> b!824433 (= e!458623 call!35860)))

(declare-fun b!824434 () Bool)

(declare-fun e!458624 () Unit!28195)

(declare-fun lt!371771 () Unit!28195)

(assert (=> b!824434 (= e!458624 lt!371771)))

(declare-fun lt!371759 () ListLongMap!8613)

(assert (=> b!824434 (= lt!371759 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371772 () (_ BitVec 64))

(assert (=> b!824434 (= lt!371772 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371775 () (_ BitVec 64))

(assert (=> b!824434 (= lt!371775 (select (arr!21980 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371758 () Unit!28195)

(assert (=> b!824434 (= lt!371758 (addStillContains!312 lt!371759 lt!371772 zeroValueAfter!34 lt!371775))))

(assert (=> b!824434 (contains!4150 (+!1910 lt!371759 (tuple2!9789 lt!371772 zeroValueAfter!34)) lt!371775)))

(declare-fun lt!371774 () Unit!28195)

(assert (=> b!824434 (= lt!371774 lt!371758)))

(declare-fun lt!371757 () ListLongMap!8613)

(assert (=> b!824434 (= lt!371757 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371773 () (_ BitVec 64))

(assert (=> b!824434 (= lt!371773 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371766 () (_ BitVec 64))

(assert (=> b!824434 (= lt!371766 (select (arr!21980 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371761 () Unit!28195)

(assert (=> b!824434 (= lt!371761 (addApplyDifferent!312 lt!371757 lt!371773 minValue!754 lt!371766))))

(assert (=> b!824434 (= (apply!359 (+!1910 lt!371757 (tuple2!9789 lt!371773 minValue!754)) lt!371766) (apply!359 lt!371757 lt!371766))))

(declare-fun lt!371760 () Unit!28195)

(assert (=> b!824434 (= lt!371760 lt!371761)))

(declare-fun lt!371764 () ListLongMap!8613)

(assert (=> b!824434 (= lt!371764 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371776 () (_ BitVec 64))

(assert (=> b!824434 (= lt!371776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371777 () (_ BitVec 64))

(assert (=> b!824434 (= lt!371777 (select (arr!21980 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371765 () Unit!28195)

(assert (=> b!824434 (= lt!371765 (addApplyDifferent!312 lt!371764 lt!371776 zeroValueAfter!34 lt!371777))))

(assert (=> b!824434 (= (apply!359 (+!1910 lt!371764 (tuple2!9789 lt!371776 zeroValueAfter!34)) lt!371777) (apply!359 lt!371764 lt!371777))))

(declare-fun lt!371762 () Unit!28195)

(assert (=> b!824434 (= lt!371762 lt!371765)))

(declare-fun lt!371769 () ListLongMap!8613)

(assert (=> b!824434 (= lt!371769 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371767 () (_ BitVec 64))

(assert (=> b!824434 (= lt!371767 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!371763 () (_ BitVec 64))

(assert (=> b!824434 (= lt!371763 (select (arr!21980 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!824434 (= lt!371771 (addApplyDifferent!312 lt!371769 lt!371767 minValue!754 lt!371763))))

(assert (=> b!824434 (= (apply!359 (+!1910 lt!371769 (tuple2!9789 lt!371767 minValue!754)) lt!371763) (apply!359 lt!371769 lt!371763))))

(declare-fun b!824435 () Bool)

(declare-fun res!561939 () Bool)

(declare-fun e!458628 () Bool)

(assert (=> b!824435 (=> (not res!561939) (not e!458628))))

(assert (=> b!824435 (= res!561939 e!458631)))

(declare-fun c!89619 () Bool)

(assert (=> b!824435 (= c!89619 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!824436 () Bool)

(declare-fun e!458630 () Bool)

(declare-fun call!35863 () Bool)

(assert (=> b!824436 (= e!458630 (not call!35863))))

(declare-fun call!35858 () ListLongMap!8613)

(declare-fun c!89621 () Bool)

(declare-fun call!35859 () ListLongMap!8613)

(declare-fun bm!35857 () Bool)

(declare-fun call!35862 () ListLongMap!8613)

(declare-fun c!89622 () Bool)

(assert (=> bm!35857 (= call!35859 (+!1910 (ite c!89621 call!35864 (ite c!89622 call!35862 call!35858)) (ite (or c!89621 c!89622) (tuple2!9789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!35858 () Bool)

(assert (=> bm!35858 (= call!35863 (contains!4150 lt!371768 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!824437 () Bool)

(declare-fun Unit!28202 () Unit!28195)

(assert (=> b!824437 (= e!458624 Unit!28202)))

(declare-fun b!824438 () Bool)

(declare-fun c!89620 () Bool)

(assert (=> b!824438 (= c!89620 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!458626 () ListLongMap!8613)

(assert (=> b!824438 (= e!458626 e!458623)))

(declare-fun bm!35859 () Bool)

(assert (=> bm!35859 (= call!35862 call!35864)))

(declare-fun b!824439 () Bool)

(declare-fun res!561943 () Bool)

(assert (=> b!824439 (=> (not res!561943) (not e!458628))))

(assert (=> b!824439 (= res!561943 e!458629)))

(declare-fun res!561945 () Bool)

(assert (=> b!824439 (=> res!561945 e!458629)))

(declare-fun e!458627 () Bool)

(assert (=> b!824439 (= res!561945 (not e!458627))))

(declare-fun res!561941 () Bool)

(assert (=> b!824439 (=> (not res!561941) (not e!458627))))

(assert (=> b!824439 (= res!561941 (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun bm!35860 () Bool)

(assert (=> bm!35860 (= call!35858 call!35862)))

(declare-fun b!824440 () Bool)

(assert (=> b!824440 (= e!458628 e!458630)))

(declare-fun c!89623 () Bool)

(assert (=> b!824440 (= c!89623 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!824441 () Bool)

(assert (=> b!824441 (= e!458626 call!35860)))

(declare-fun bm!35861 () Bool)

(assert (=> bm!35861 (= call!35860 call!35859)))

(declare-fun b!824442 () Bool)

(declare-fun e!458635 () Bool)

(assert (=> b!824442 (= e!458630 e!458635)))

(declare-fun res!561938 () Bool)

(assert (=> b!824442 (= res!561938 call!35863)))

(assert (=> b!824442 (=> (not res!561938) (not e!458635))))

(declare-fun d!105207 () Bool)

(assert (=> d!105207 e!458628))

(declare-fun res!561937 () Bool)

(assert (=> d!105207 (=> (not res!561937) (not e!458628))))

(assert (=> d!105207 (= res!561937 (or (bvsge #b00000000000000000000000000000000 (size!22400 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))))

(declare-fun lt!371756 () ListLongMap!8613)

(assert (=> d!105207 (= lt!371768 lt!371756)))

(declare-fun lt!371770 () Unit!28195)

(assert (=> d!105207 (= lt!371770 e!458624)))

(declare-fun c!89618 () Bool)

(assert (=> d!105207 (= c!89618 e!458634)))

(declare-fun res!561940 () Bool)

(assert (=> d!105207 (=> (not res!561940) (not e!458634))))

(assert (=> d!105207 (= res!561940 (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun e!458625 () ListLongMap!8613)

(assert (=> d!105207 (= lt!371756 e!458625)))

(assert (=> d!105207 (= c!89621 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105207 (validMask!0 mask!1312)))

(assert (=> d!105207 (= (getCurrentListMap!2474 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371768)))

(declare-fun b!824443 () Bool)

(assert (=> b!824443 (= e!458635 (= (apply!359 lt!371768 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!824444 () Bool)

(assert (=> b!824444 (= e!458623 call!35858)))

(declare-fun b!824445 () Bool)

(assert (=> b!824445 (= e!458625 (+!1910 call!35859 (tuple2!9789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!824446 () Bool)

(assert (=> b!824446 (= e!458625 e!458626)))

(assert (=> b!824446 (= c!89622 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!824447 () Bool)

(assert (=> b!824447 (= e!458631 e!458633)))

(declare-fun res!561942 () Bool)

(assert (=> b!824447 (= res!561942 call!35861)))

(assert (=> b!824447 (=> (not res!561942) (not e!458633))))

(declare-fun b!824448 () Bool)

(assert (=> b!824448 (= e!458627 (validKeyInArray!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105207 c!89621) b!824445))

(assert (= (and d!105207 (not c!89621)) b!824446))

(assert (= (and b!824446 c!89622) b!824441))

(assert (= (and b!824446 (not c!89622)) b!824438))

(assert (= (and b!824438 c!89620) b!824433))

(assert (= (and b!824438 (not c!89620)) b!824444))

(assert (= (or b!824433 b!824444) bm!35860))

(assert (= (or b!824441 bm!35860) bm!35859))

(assert (= (or b!824441 b!824433) bm!35861))

(assert (= (or b!824445 bm!35859) bm!35855))

(assert (= (or b!824445 bm!35861) bm!35857))

(assert (= (and d!105207 res!561940) b!824430))

(assert (= (and d!105207 c!89618) b!824434))

(assert (= (and d!105207 (not c!89618)) b!824437))

(assert (= (and d!105207 res!561937) b!824439))

(assert (= (and b!824439 res!561941) b!824448))

(assert (= (and b!824439 (not res!561945)) b!824432))

(assert (= (and b!824432 res!561944) b!824429))

(assert (= (and b!824439 res!561943) b!824435))

(assert (= (and b!824435 c!89619) b!824447))

(assert (= (and b!824435 (not c!89619)) b!824431))

(assert (= (and b!824447 res!561942) b!824428))

(assert (= (or b!824447 b!824431) bm!35856))

(assert (= (and b!824435 res!561939) b!824440))

(assert (= (and b!824440 c!89623) b!824442))

(assert (= (and b!824440 (not c!89623)) b!824436))

(assert (= (and b!824442 res!561938) b!824443))

(assert (= (or b!824442 b!824436) bm!35858))

(declare-fun b_lambda!11071 () Bool)

(assert (=> (not b_lambda!11071) (not b!824429)))

(assert (=> b!824429 t!21912))

(declare-fun b_and!22031 () Bool)

(assert (= b_and!22029 (and (=> t!21912 result!7929) b_and!22031)))

(assert (=> bm!35855 m!766851))

(declare-fun m!767033 () Bool)

(assert (=> bm!35856 m!767033))

(assert (=> b!824429 m!766979))

(assert (=> b!824429 m!766981))

(assert (=> b!824429 m!766983))

(assert (=> b!824429 m!766985))

(declare-fun m!767035 () Bool)

(assert (=> b!824429 m!767035))

(assert (=> b!824429 m!766979))

(assert (=> b!824429 m!766985))

(assert (=> b!824429 m!766981))

(assert (=> b!824430 m!766985))

(assert (=> b!824430 m!766985))

(assert (=> b!824430 m!766989))

(declare-fun m!767037 () Bool)

(assert (=> bm!35858 m!767037))

(assert (=> b!824432 m!766985))

(assert (=> b!824432 m!766985))

(declare-fun m!767039 () Bool)

(assert (=> b!824432 m!767039))

(declare-fun m!767041 () Bool)

(assert (=> bm!35857 m!767041))

(assert (=> d!105207 m!766857))

(declare-fun m!767043 () Bool)

(assert (=> b!824434 m!767043))

(declare-fun m!767045 () Bool)

(assert (=> b!824434 m!767045))

(declare-fun m!767047 () Bool)

(assert (=> b!824434 m!767047))

(declare-fun m!767049 () Bool)

(assert (=> b!824434 m!767049))

(declare-fun m!767051 () Bool)

(assert (=> b!824434 m!767051))

(assert (=> b!824434 m!767051))

(declare-fun m!767053 () Bool)

(assert (=> b!824434 m!767053))

(declare-fun m!767055 () Bool)

(assert (=> b!824434 m!767055))

(declare-fun m!767057 () Bool)

(assert (=> b!824434 m!767057))

(assert (=> b!824434 m!766985))

(declare-fun m!767059 () Bool)

(assert (=> b!824434 m!767059))

(assert (=> b!824434 m!767047))

(declare-fun m!767061 () Bool)

(assert (=> b!824434 m!767061))

(assert (=> b!824434 m!767061))

(declare-fun m!767063 () Bool)

(assert (=> b!824434 m!767063))

(assert (=> b!824434 m!766851))

(declare-fun m!767065 () Bool)

(assert (=> b!824434 m!767065))

(declare-fun m!767067 () Bool)

(assert (=> b!824434 m!767067))

(declare-fun m!767069 () Bool)

(assert (=> b!824434 m!767069))

(assert (=> b!824434 m!767057))

(declare-fun m!767071 () Bool)

(assert (=> b!824434 m!767071))

(assert (=> b!824448 m!766985))

(assert (=> b!824448 m!766985))

(assert (=> b!824448 m!766989))

(declare-fun m!767073 () Bool)

(assert (=> b!824428 m!767073))

(declare-fun m!767075 () Bool)

(assert (=> b!824445 m!767075))

(declare-fun m!767077 () Bool)

(assert (=> b!824443 m!767077))

(assert (=> b!824299 d!105207))

(declare-fun d!105209 () Bool)

(declare-fun e!458636 () Bool)

(assert (=> d!105209 e!458636))

(declare-fun res!561946 () Bool)

(assert (=> d!105209 (=> (not res!561946) (not e!458636))))

(declare-fun lt!371778 () ListLongMap!8613)

(assert (=> d!105209 (= res!561946 (contains!4150 lt!371778 (_1!4905 lt!371599)))))

(declare-fun lt!371779 () List!15575)

(assert (=> d!105209 (= lt!371778 (ListLongMap!8614 lt!371779))))

(declare-fun lt!371781 () Unit!28195)

(declare-fun lt!371780 () Unit!28195)

(assert (=> d!105209 (= lt!371781 lt!371780)))

(assert (=> d!105209 (= (getValueByKey!406 lt!371779 (_1!4905 lt!371599)) (Some!411 (_2!4905 lt!371599)))))

(assert (=> d!105209 (= lt!371780 (lemmaContainsTupThenGetReturnValue!220 lt!371779 (_1!4905 lt!371599) (_2!4905 lt!371599)))))

(assert (=> d!105209 (= lt!371779 (insertStrictlySorted!259 (toList!4322 lt!371597) (_1!4905 lt!371599) (_2!4905 lt!371599)))))

(assert (=> d!105209 (= (+!1910 lt!371597 lt!371599) lt!371778)))

(declare-fun b!824449 () Bool)

(declare-fun res!561947 () Bool)

(assert (=> b!824449 (=> (not res!561947) (not e!458636))))

(assert (=> b!824449 (= res!561947 (= (getValueByKey!406 (toList!4322 lt!371778) (_1!4905 lt!371599)) (Some!411 (_2!4905 lt!371599))))))

(declare-fun b!824450 () Bool)

(assert (=> b!824450 (= e!458636 (contains!4151 (toList!4322 lt!371778) lt!371599))))

(assert (= (and d!105209 res!561946) b!824449))

(assert (= (and b!824449 res!561947) b!824450))

(declare-fun m!767079 () Bool)

(assert (=> d!105209 m!767079))

(declare-fun m!767081 () Bool)

(assert (=> d!105209 m!767081))

(declare-fun m!767083 () Bool)

(assert (=> d!105209 m!767083))

(declare-fun m!767085 () Bool)

(assert (=> d!105209 m!767085))

(declare-fun m!767087 () Bool)

(assert (=> b!824449 m!767087))

(declare-fun m!767089 () Bool)

(assert (=> b!824450 m!767089))

(assert (=> b!824299 d!105209))

(declare-fun d!105211 () Bool)

(assert (=> d!105211 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71058 d!105211))

(declare-fun d!105213 () Bool)

(assert (=> d!105213 (= (array_inv!17579 _keys!976) (bvsge (size!22400 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71058 d!105213))

(declare-fun d!105215 () Bool)

(assert (=> d!105215 (= (array_inv!17580 _values!788) (bvsge (size!22401 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71058 d!105215))

(declare-fun d!105217 () Bool)

(assert (=> d!105217 (= (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371784 () Unit!28195)

(declare-fun choose!1408 (array!45871 array!45873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24787 V!24787 V!24787 V!24787 (_ BitVec 32) Int) Unit!28195)

(assert (=> d!105217 (= lt!371784 (choose!1408 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105217 (validMask!0 mask!1312)))

(assert (=> d!105217 (= (lemmaNoChangeToArrayThenSameMapNoExtras!493 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371784)))

(declare-fun bs!23001 () Bool)

(assert (= bs!23001 d!105217))

(assert (=> bs!23001 m!766853))

(assert (=> bs!23001 m!766851))

(declare-fun m!767091 () Bool)

(assert (=> bs!23001 m!767091))

(assert (=> bs!23001 m!766857))

(assert (=> b!824304 d!105217))

(declare-fun b!824475 () Bool)

(declare-fun e!458655 () Bool)

(declare-fun e!458657 () Bool)

(assert (=> b!824475 (= e!458655 e!458657)))

(declare-fun c!89635 () Bool)

(assert (=> b!824475 (= c!89635 (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun b!824476 () Bool)

(declare-fun lt!371802 () ListLongMap!8613)

(declare-fun isEmpty!647 (ListLongMap!8613) Bool)

(assert (=> b!824476 (= e!458657 (isEmpty!647 lt!371802))))

(declare-fun b!824477 () Bool)

(declare-fun e!458653 () Bool)

(assert (=> b!824477 (= e!458653 (validKeyInArray!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824477 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!824478 () Bool)

(declare-fun e!458651 () ListLongMap!8613)

(declare-fun call!35867 () ListLongMap!8613)

(assert (=> b!824478 (= e!458651 call!35867)))

(declare-fun bm!35864 () Bool)

(assert (=> bm!35864 (= call!35867 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!824479 () Bool)

(declare-fun e!458656 () ListLongMap!8613)

(assert (=> b!824479 (= e!458656 (ListLongMap!8614 Nil!15572))))

(declare-fun b!824480 () Bool)

(declare-fun lt!371804 () Unit!28195)

(declare-fun lt!371799 () Unit!28195)

(assert (=> b!824480 (= lt!371804 lt!371799)))

(declare-fun lt!371805 () V!24787)

(declare-fun lt!371800 () (_ BitVec 64))

(declare-fun lt!371801 () (_ BitVec 64))

(declare-fun lt!371803 () ListLongMap!8613)

(assert (=> b!824480 (not (contains!4150 (+!1910 lt!371803 (tuple2!9789 lt!371801 lt!371805)) lt!371800))))

(declare-fun addStillNotContains!186 (ListLongMap!8613 (_ BitVec 64) V!24787 (_ BitVec 64)) Unit!28195)

(assert (=> b!824480 (= lt!371799 (addStillNotContains!186 lt!371803 lt!371801 lt!371805 lt!371800))))

(assert (=> b!824480 (= lt!371800 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!824480 (= lt!371805 (get!11685 (select (arr!21981 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!824480 (= lt!371801 (select (arr!21980 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!824480 (= lt!371803 call!35867)))

(assert (=> b!824480 (= e!458651 (+!1910 call!35867 (tuple2!9789 (select (arr!21980 _keys!976) #b00000000000000000000000000000000) (get!11685 (select (arr!21981 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!824481 () Bool)

(assert (=> b!824481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(assert (=> b!824481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22401 _values!788)))))

(declare-fun e!458654 () Bool)

(assert (=> b!824481 (= e!458654 (= (apply!359 lt!371802 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)) (get!11685 (select (arr!21981 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!824482 () Bool)

(assert (=> b!824482 (= e!458656 e!458651)))

(declare-fun c!89632 () Bool)

(assert (=> b!824482 (= c!89632 (validKeyInArray!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824483 () Bool)

(assert (=> b!824483 (= e!458655 e!458654)))

(assert (=> b!824483 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun res!561957 () Bool)

(assert (=> b!824483 (= res!561957 (contains!4150 lt!371802 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824483 (=> (not res!561957) (not e!458654))))

(declare-fun d!105219 () Bool)

(declare-fun e!458652 () Bool)

(assert (=> d!105219 e!458652))

(declare-fun res!561958 () Bool)

(assert (=> d!105219 (=> (not res!561958) (not e!458652))))

(assert (=> d!105219 (= res!561958 (not (contains!4150 lt!371802 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105219 (= lt!371802 e!458656)))

(declare-fun c!89634 () Bool)

(assert (=> d!105219 (= c!89634 (bvsge #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(assert (=> d!105219 (validMask!0 mask!1312)))

(assert (=> d!105219 (= (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371802)))

(declare-fun b!824484 () Bool)

(assert (=> b!824484 (= e!458652 e!458655)))

(declare-fun c!89633 () Bool)

(assert (=> b!824484 (= c!89633 e!458653)))

(declare-fun res!561959 () Bool)

(assert (=> b!824484 (=> (not res!561959) (not e!458653))))

(assert (=> b!824484 (= res!561959 (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun b!824485 () Bool)

(assert (=> b!824485 (= e!458657 (= lt!371802 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!824486 () Bool)

(declare-fun res!561956 () Bool)

(assert (=> b!824486 (=> (not res!561956) (not e!458652))))

(assert (=> b!824486 (= res!561956 (not (contains!4150 lt!371802 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105219 c!89634) b!824479))

(assert (= (and d!105219 (not c!89634)) b!824482))

(assert (= (and b!824482 c!89632) b!824480))

(assert (= (and b!824482 (not c!89632)) b!824478))

(assert (= (or b!824480 b!824478) bm!35864))

(assert (= (and d!105219 res!561958) b!824486))

(assert (= (and b!824486 res!561956) b!824484))

(assert (= (and b!824484 res!561959) b!824477))

(assert (= (and b!824484 c!89633) b!824483))

(assert (= (and b!824484 (not c!89633)) b!824475))

(assert (= (and b!824483 res!561957) b!824481))

(assert (= (and b!824475 c!89635) b!824485))

(assert (= (and b!824475 (not c!89635)) b!824476))

(declare-fun b_lambda!11073 () Bool)

(assert (=> (not b_lambda!11073) (not b!824480)))

(assert (=> b!824480 t!21912))

(declare-fun b_and!22033 () Bool)

(assert (= b_and!22031 (and (=> t!21912 result!7929) b_and!22033)))

(declare-fun b_lambda!11075 () Bool)

(assert (=> (not b_lambda!11075) (not b!824481)))

(assert (=> b!824481 t!21912))

(declare-fun b_and!22035 () Bool)

(assert (= b_and!22033 (and (=> t!21912 result!7929) b_and!22035)))

(assert (=> b!824483 m!766985))

(assert (=> b!824483 m!766985))

(declare-fun m!767093 () Bool)

(assert (=> b!824483 m!767093))

(assert (=> b!824477 m!766985))

(assert (=> b!824477 m!766985))

(assert (=> b!824477 m!766989))

(assert (=> b!824482 m!766985))

(assert (=> b!824482 m!766985))

(assert (=> b!824482 m!766989))

(declare-fun m!767095 () Bool)

(assert (=> b!824476 m!767095))

(declare-fun m!767097 () Bool)

(assert (=> d!105219 m!767097))

(assert (=> d!105219 m!766857))

(assert (=> b!824481 m!766979))

(assert (=> b!824481 m!766985))

(declare-fun m!767099 () Bool)

(assert (=> b!824481 m!767099))

(assert (=> b!824481 m!766981))

(assert (=> b!824481 m!766985))

(assert (=> b!824481 m!766979))

(assert (=> b!824481 m!766981))

(assert (=> b!824481 m!766983))

(declare-fun m!767101 () Bool)

(assert (=> b!824480 m!767101))

(declare-fun m!767103 () Bool)

(assert (=> b!824480 m!767103))

(assert (=> b!824480 m!766979))

(assert (=> b!824480 m!766981))

(assert (=> b!824480 m!766985))

(declare-fun m!767105 () Bool)

(assert (=> b!824480 m!767105))

(assert (=> b!824480 m!767101))

(assert (=> b!824480 m!766979))

(assert (=> b!824480 m!766981))

(assert (=> b!824480 m!766983))

(declare-fun m!767107 () Bool)

(assert (=> b!824480 m!767107))

(declare-fun m!767109 () Bool)

(assert (=> b!824486 m!767109))

(declare-fun m!767111 () Bool)

(assert (=> b!824485 m!767111))

(assert (=> bm!35864 m!767111))

(assert (=> b!824304 d!105219))

(declare-fun b!824487 () Bool)

(declare-fun e!458662 () Bool)

(declare-fun e!458664 () Bool)

(assert (=> b!824487 (= e!458662 e!458664)))

(declare-fun c!89639 () Bool)

(assert (=> b!824487 (= c!89639 (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun b!824488 () Bool)

(declare-fun lt!371809 () ListLongMap!8613)

(assert (=> b!824488 (= e!458664 (isEmpty!647 lt!371809))))

(declare-fun b!824489 () Bool)

(declare-fun e!458660 () Bool)

(assert (=> b!824489 (= e!458660 (validKeyInArray!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824489 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!824490 () Bool)

(declare-fun e!458658 () ListLongMap!8613)

(declare-fun call!35868 () ListLongMap!8613)

(assert (=> b!824490 (= e!458658 call!35868)))

(declare-fun bm!35865 () Bool)

(assert (=> bm!35865 (= call!35868 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!824491 () Bool)

(declare-fun e!458663 () ListLongMap!8613)

(assert (=> b!824491 (= e!458663 (ListLongMap!8614 Nil!15572))))

(declare-fun b!824492 () Bool)

(declare-fun lt!371811 () Unit!28195)

(declare-fun lt!371806 () Unit!28195)

(assert (=> b!824492 (= lt!371811 lt!371806)))

(declare-fun lt!371807 () (_ BitVec 64))

(declare-fun lt!371810 () ListLongMap!8613)

(declare-fun lt!371812 () V!24787)

(declare-fun lt!371808 () (_ BitVec 64))

(assert (=> b!824492 (not (contains!4150 (+!1910 lt!371810 (tuple2!9789 lt!371808 lt!371812)) lt!371807))))

(assert (=> b!824492 (= lt!371806 (addStillNotContains!186 lt!371810 lt!371808 lt!371812 lt!371807))))

(assert (=> b!824492 (= lt!371807 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!824492 (= lt!371812 (get!11685 (select (arr!21981 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!824492 (= lt!371808 (select (arr!21980 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!824492 (= lt!371810 call!35868)))

(assert (=> b!824492 (= e!458658 (+!1910 call!35868 (tuple2!9789 (select (arr!21980 _keys!976) #b00000000000000000000000000000000) (get!11685 (select (arr!21981 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!824493 () Bool)

(assert (=> b!824493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(assert (=> b!824493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22401 _values!788)))))

(declare-fun e!458661 () Bool)

(assert (=> b!824493 (= e!458661 (= (apply!359 lt!371809 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)) (get!11685 (select (arr!21981 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!824494 () Bool)

(assert (=> b!824494 (= e!458663 e!458658)))

(declare-fun c!89636 () Bool)

(assert (=> b!824494 (= c!89636 (validKeyInArray!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824495 () Bool)

(assert (=> b!824495 (= e!458662 e!458661)))

(assert (=> b!824495 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun res!561961 () Bool)

(assert (=> b!824495 (= res!561961 (contains!4150 lt!371809 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824495 (=> (not res!561961) (not e!458661))))

(declare-fun d!105221 () Bool)

(declare-fun e!458659 () Bool)

(assert (=> d!105221 e!458659))

(declare-fun res!561962 () Bool)

(assert (=> d!105221 (=> (not res!561962) (not e!458659))))

(assert (=> d!105221 (= res!561962 (not (contains!4150 lt!371809 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105221 (= lt!371809 e!458663)))

(declare-fun c!89638 () Bool)

(assert (=> d!105221 (= c!89638 (bvsge #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(assert (=> d!105221 (validMask!0 mask!1312)))

(assert (=> d!105221 (= (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371809)))

(declare-fun b!824496 () Bool)

(assert (=> b!824496 (= e!458659 e!458662)))

(declare-fun c!89637 () Bool)

(assert (=> b!824496 (= c!89637 e!458660)))

(declare-fun res!561963 () Bool)

(assert (=> b!824496 (=> (not res!561963) (not e!458660))))

(assert (=> b!824496 (= res!561963 (bvslt #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(declare-fun b!824497 () Bool)

(assert (=> b!824497 (= e!458664 (= lt!371809 (getCurrentListMapNoExtraKeys!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!824498 () Bool)

(declare-fun res!561960 () Bool)

(assert (=> b!824498 (=> (not res!561960) (not e!458659))))

(assert (=> b!824498 (= res!561960 (not (contains!4150 lt!371809 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105221 c!89638) b!824491))

(assert (= (and d!105221 (not c!89638)) b!824494))

(assert (= (and b!824494 c!89636) b!824492))

(assert (= (and b!824494 (not c!89636)) b!824490))

(assert (= (or b!824492 b!824490) bm!35865))

(assert (= (and d!105221 res!561962) b!824498))

(assert (= (and b!824498 res!561960) b!824496))

(assert (= (and b!824496 res!561963) b!824489))

(assert (= (and b!824496 c!89637) b!824495))

(assert (= (and b!824496 (not c!89637)) b!824487))

(assert (= (and b!824495 res!561961) b!824493))

(assert (= (and b!824487 c!89639) b!824497))

(assert (= (and b!824487 (not c!89639)) b!824488))

(declare-fun b_lambda!11077 () Bool)

(assert (=> (not b_lambda!11077) (not b!824492)))

(assert (=> b!824492 t!21912))

(declare-fun b_and!22037 () Bool)

(assert (= b_and!22035 (and (=> t!21912 result!7929) b_and!22037)))

(declare-fun b_lambda!11079 () Bool)

(assert (=> (not b_lambda!11079) (not b!824493)))

(assert (=> b!824493 t!21912))

(declare-fun b_and!22039 () Bool)

(assert (= b_and!22037 (and (=> t!21912 result!7929) b_and!22039)))

(assert (=> b!824495 m!766985))

(assert (=> b!824495 m!766985))

(declare-fun m!767113 () Bool)

(assert (=> b!824495 m!767113))

(assert (=> b!824489 m!766985))

(assert (=> b!824489 m!766985))

(assert (=> b!824489 m!766989))

(assert (=> b!824494 m!766985))

(assert (=> b!824494 m!766985))

(assert (=> b!824494 m!766989))

(declare-fun m!767115 () Bool)

(assert (=> b!824488 m!767115))

(declare-fun m!767117 () Bool)

(assert (=> d!105221 m!767117))

(assert (=> d!105221 m!766857))

(assert (=> b!824493 m!766979))

(assert (=> b!824493 m!766985))

(declare-fun m!767119 () Bool)

(assert (=> b!824493 m!767119))

(assert (=> b!824493 m!766981))

(assert (=> b!824493 m!766985))

(assert (=> b!824493 m!766979))

(assert (=> b!824493 m!766981))

(assert (=> b!824493 m!766983))

(declare-fun m!767121 () Bool)

(assert (=> b!824492 m!767121))

(declare-fun m!767123 () Bool)

(assert (=> b!824492 m!767123))

(assert (=> b!824492 m!766979))

(assert (=> b!824492 m!766981))

(assert (=> b!824492 m!766985))

(declare-fun m!767125 () Bool)

(assert (=> b!824492 m!767125))

(assert (=> b!824492 m!767121))

(assert (=> b!824492 m!766979))

(assert (=> b!824492 m!766981))

(assert (=> b!824492 m!766983))

(declare-fun m!767127 () Bool)

(assert (=> b!824492 m!767127))

(declare-fun m!767129 () Bool)

(assert (=> b!824498 m!767129))

(declare-fun m!767131 () Bool)

(assert (=> b!824497 m!767131))

(assert (=> bm!35865 m!767131))

(assert (=> b!824304 d!105221))

(declare-fun b!824509 () Bool)

(declare-fun e!458675 () Bool)

(declare-fun e!458676 () Bool)

(assert (=> b!824509 (= e!458675 e!458676)))

(declare-fun c!89642 () Bool)

(assert (=> b!824509 (= c!89642 (validKeyInArray!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824510 () Bool)

(declare-fun e!458674 () Bool)

(assert (=> b!824510 (= e!458674 e!458675)))

(declare-fun res!561970 () Bool)

(assert (=> b!824510 (=> (not res!561970) (not e!458675))))

(declare-fun e!458673 () Bool)

(assert (=> b!824510 (= res!561970 (not e!458673))))

(declare-fun res!561972 () Bool)

(assert (=> b!824510 (=> (not res!561972) (not e!458673))))

(assert (=> b!824510 (= res!561972 (validKeyInArray!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824511 () Bool)

(declare-fun contains!4152 (List!15576 (_ BitVec 64)) Bool)

(assert (=> b!824511 (= e!458673 (contains!4152 Nil!15573 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824512 () Bool)

(declare-fun call!35871 () Bool)

(assert (=> b!824512 (= e!458676 call!35871)))

(declare-fun d!105223 () Bool)

(declare-fun res!561971 () Bool)

(assert (=> d!105223 (=> res!561971 e!458674)))

(assert (=> d!105223 (= res!561971 (bvsge #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(assert (=> d!105223 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15573) e!458674)))

(declare-fun bm!35868 () Bool)

(assert (=> bm!35868 (= call!35871 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89642 (Cons!15572 (select (arr!21980 _keys!976) #b00000000000000000000000000000000) Nil!15573) Nil!15573)))))

(declare-fun b!824513 () Bool)

(assert (=> b!824513 (= e!458676 call!35871)))

(assert (= (and d!105223 (not res!561971)) b!824510))

(assert (= (and b!824510 res!561972) b!824511))

(assert (= (and b!824510 res!561970) b!824509))

(assert (= (and b!824509 c!89642) b!824512))

(assert (= (and b!824509 (not c!89642)) b!824513))

(assert (= (or b!824512 b!824513) bm!35868))

(assert (=> b!824509 m!766985))

(assert (=> b!824509 m!766985))

(assert (=> b!824509 m!766989))

(assert (=> b!824510 m!766985))

(assert (=> b!824510 m!766985))

(assert (=> b!824510 m!766989))

(assert (=> b!824511 m!766985))

(assert (=> b!824511 m!766985))

(declare-fun m!767133 () Bool)

(assert (=> b!824511 m!767133))

(assert (=> bm!35868 m!766985))

(declare-fun m!767135 () Bool)

(assert (=> bm!35868 m!767135))

(assert (=> b!824302 d!105223))

(declare-fun b!824522 () Bool)

(declare-fun e!458685 () Bool)

(declare-fun call!35874 () Bool)

(assert (=> b!824522 (= e!458685 call!35874)))

(declare-fun bm!35871 () Bool)

(assert (=> bm!35871 (= call!35874 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!824523 () Bool)

(declare-fun e!458684 () Bool)

(assert (=> b!824523 (= e!458684 e!458685)))

(declare-fun c!89645 () Bool)

(assert (=> b!824523 (= c!89645 (validKeyInArray!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105225 () Bool)

(declare-fun res!561977 () Bool)

(assert (=> d!105225 (=> res!561977 e!458684)))

(assert (=> d!105225 (= res!561977 (bvsge #b00000000000000000000000000000000 (size!22400 _keys!976)))))

(assert (=> d!105225 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!458684)))

(declare-fun b!824524 () Bool)

(declare-fun e!458683 () Bool)

(assert (=> b!824524 (= e!458683 call!35874)))

(declare-fun b!824525 () Bool)

(assert (=> b!824525 (= e!458685 e!458683)))

(declare-fun lt!371819 () (_ BitVec 64))

(assert (=> b!824525 (= lt!371819 (select (arr!21980 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371820 () Unit!28195)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45871 (_ BitVec 64) (_ BitVec 32)) Unit!28195)

(assert (=> b!824525 (= lt!371820 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!371819 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!824525 (arrayContainsKey!0 _keys!976 lt!371819 #b00000000000000000000000000000000)))

(declare-fun lt!371821 () Unit!28195)

(assert (=> b!824525 (= lt!371821 lt!371820)))

(declare-fun res!561978 () Bool)

(declare-datatypes ((SeekEntryResult!8682 0))(
  ( (MissingZero!8682 (index!37099 (_ BitVec 32))) (Found!8682 (index!37100 (_ BitVec 32))) (Intermediate!8682 (undefined!9494 Bool) (index!37101 (_ BitVec 32)) (x!69430 (_ BitVec 32))) (Undefined!8682) (MissingVacant!8682 (index!37102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45871 (_ BitVec 32)) SeekEntryResult!8682)

(assert (=> b!824525 (= res!561978 (= (seekEntryOrOpen!0 (select (arr!21980 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8682 #b00000000000000000000000000000000)))))

(assert (=> b!824525 (=> (not res!561978) (not e!458683))))

(assert (= (and d!105225 (not res!561977)) b!824523))

(assert (= (and b!824523 c!89645) b!824525))

(assert (= (and b!824523 (not c!89645)) b!824522))

(assert (= (and b!824525 res!561978) b!824524))

(assert (= (or b!824524 b!824522) bm!35871))

(declare-fun m!767137 () Bool)

(assert (=> bm!35871 m!767137))

(assert (=> b!824523 m!766985))

(assert (=> b!824523 m!766985))

(assert (=> b!824523 m!766989))

(assert (=> b!824525 m!766985))

(declare-fun m!767139 () Bool)

(assert (=> b!824525 m!767139))

(declare-fun m!767141 () Bool)

(assert (=> b!824525 m!767141))

(assert (=> b!824525 m!766985))

(declare-fun m!767143 () Bool)

(assert (=> b!824525 m!767143))

(assert (=> b!824298 d!105225))

(declare-fun b!824532 () Bool)

(declare-fun e!458690 () Bool)

(assert (=> b!824532 (= e!458690 tp_is_empty!14839)))

(declare-fun condMapEmpty!23881 () Bool)

(declare-fun mapDefault!23881 () ValueCell!7004)

(assert (=> mapNonEmpty!23872 (= condMapEmpty!23881 (= mapRest!23872 ((as const (Array (_ BitVec 32) ValueCell!7004)) mapDefault!23881)))))

(declare-fun e!458691 () Bool)

(declare-fun mapRes!23881 () Bool)

(assert (=> mapNonEmpty!23872 (= tp!46134 (and e!458691 mapRes!23881))))

(declare-fun b!824533 () Bool)

(assert (=> b!824533 (= e!458691 tp_is_empty!14839)))

(declare-fun mapNonEmpty!23881 () Bool)

(declare-fun tp!46150 () Bool)

(assert (=> mapNonEmpty!23881 (= mapRes!23881 (and tp!46150 e!458690))))

(declare-fun mapRest!23881 () (Array (_ BitVec 32) ValueCell!7004))

(declare-fun mapKey!23881 () (_ BitVec 32))

(declare-fun mapValue!23881 () ValueCell!7004)

(assert (=> mapNonEmpty!23881 (= mapRest!23872 (store mapRest!23881 mapKey!23881 mapValue!23881))))

(declare-fun mapIsEmpty!23881 () Bool)

(assert (=> mapIsEmpty!23881 mapRes!23881))

(assert (= (and mapNonEmpty!23872 condMapEmpty!23881) mapIsEmpty!23881))

(assert (= (and mapNonEmpty!23872 (not condMapEmpty!23881)) mapNonEmpty!23881))

(assert (= (and mapNonEmpty!23881 ((_ is ValueCellFull!7004) mapValue!23881)) b!824532))

(assert (= (and mapNonEmpty!23872 ((_ is ValueCellFull!7004) mapDefault!23881)) b!824533))

(declare-fun m!767145 () Bool)

(assert (=> mapNonEmpty!23881 m!767145))

(declare-fun b_lambda!11081 () Bool)

(assert (= b_lambda!11073 (or (and start!71058 b_free!13129) b_lambda!11081)))

(declare-fun b_lambda!11083 () Bool)

(assert (= b_lambda!11079 (or (and start!71058 b_free!13129) b_lambda!11083)))

(declare-fun b_lambda!11085 () Bool)

(assert (= b_lambda!11069 (or (and start!71058 b_free!13129) b_lambda!11085)))

(declare-fun b_lambda!11087 () Bool)

(assert (= b_lambda!11071 (or (and start!71058 b_free!13129) b_lambda!11087)))

(declare-fun b_lambda!11089 () Bool)

(assert (= b_lambda!11077 (or (and start!71058 b_free!13129) b_lambda!11089)))

(declare-fun b_lambda!11091 () Bool)

(assert (= b_lambda!11075 (or (and start!71058 b_free!13129) b_lambda!11091)))

(check-sat (not d!105197) (not b!824409) (not b!824405) (not b!824432) (not b!824486) (not b!824422) (not b!824358) (not b!824406) (not b!824429) (not bm!35855) (not b!824525) (not b!824362) (not b!824450) (not b!824428) (not d!105209) (not d!105203) (not b!824483) (not bm!35865) (not b!824425) (not bm!35848) (not b!824492) (not b!824510) (not d!105219) (not b_lambda!11085) (not b!824477) (not b!824489) (not d!105217) (not b!824498) (not b!824443) (not b!824448) (not d!105201) (not b_lambda!11081) (not b!824445) (not bm!35857) (not bm!35849) (not b!824523) (not b!824509) (not b!824360) (not mapNonEmpty!23881) (not bm!35868) (not b!824485) (not bm!35850) (not b!824511) (not b!824361) (not b!824494) (not b!824482) (not b!824420) (not bm!35864) (not b!824359) (not b_lambda!11091) (not bm!35851) (not b_lambda!11083) (not b_lambda!11089) (not b!824434) (not d!105205) (not b!824476) (not b!824497) (not d!105207) (not b!824449) (not b!824357) (not d!105221) (not b!824495) (not b!824411) (not b!824488) (not b!824493) (not bm!35858) tp_is_empty!14839 (not b!824430) (not d!105199) (not bm!35871) (not b!824481) (not b_lambda!11087) (not bm!35856) (not b!824407) b_and!22039 (not b!824480) (not b_next!13129))
(check-sat b_and!22039 (not b_next!13129))
