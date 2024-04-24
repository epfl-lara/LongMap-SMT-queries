; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105222 () Bool)

(assert start!105222)

(declare-fun b_free!26767 () Bool)

(declare-fun b_next!26767 () Bool)

(assert (=> start!105222 (= b_free!26767 (not b_next!26767))))

(declare-fun tp!93797 () Bool)

(declare-fun b_and!44555 () Bool)

(assert (=> start!105222 (= tp!93797 b_and!44555)))

(declare-fun b!1252809 () Bool)

(declare-fun e!711531 () Bool)

(declare-fun tp_is_empty!31669 () Bool)

(assert (=> b!1252809 (= e!711531 tp_is_empty!31669)))

(declare-fun b!1252810 () Bool)

(declare-fun e!711535 () Bool)

(declare-fun mapRes!49270 () Bool)

(assert (=> b!1252810 (= e!711535 (and e!711531 mapRes!49270))))

(declare-fun condMapEmpty!49270 () Bool)

(declare-datatypes ((V!47591 0))(
  ( (V!47592 (val!15897 Int)) )
))
(declare-datatypes ((ValueCell!15071 0))(
  ( (ValueCellFull!15071 (v!18590 V!47591)) (EmptyCell!15071) )
))
(declare-datatypes ((array!81051 0))(
  ( (array!81052 (arr!39086 (Array (_ BitVec 32) ValueCell!15071)) (size!39623 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81051)

(declare-fun mapDefault!49270 () ValueCell!15071)

(assert (=> b!1252810 (= condMapEmpty!49270 (= (arr!39086 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15071)) mapDefault!49270)))))

(declare-fun mapIsEmpty!49270 () Bool)

(assert (=> mapIsEmpty!49270 mapRes!49270))

(declare-fun b!1252811 () Bool)

(declare-fun e!711532 () Bool)

(declare-datatypes ((array!81053 0))(
  ( (array!81054 (arr!39087 (Array (_ BitVec 32) (_ BitVec 64))) (size!39624 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81053)

(assert (=> b!1252811 (= e!711532 (bvsle #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(declare-datatypes ((tuple2!20524 0))(
  ( (tuple2!20525 (_1!10273 (_ BitVec 64)) (_2!10273 V!47591)) )
))
(declare-datatypes ((List!27769 0))(
  ( (Nil!27766) (Cons!27765 (h!28983 tuple2!20524) (t!41236 List!27769)) )
))
(declare-datatypes ((ListLongMap!18405 0))(
  ( (ListLongMap!18406 (toList!9218 List!27769)) )
))
(declare-fun lt!565344 () ListLongMap!18405)

(declare-fun -!2000 (ListLongMap!18405 (_ BitVec 64)) ListLongMap!18405)

(assert (=> b!1252811 (= (-!2000 lt!565344 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565344)))

(declare-datatypes ((Unit!41572 0))(
  ( (Unit!41573) )
))
(declare-fun lt!565341 () Unit!41572)

(declare-fun removeNotPresentStillSame!110 (ListLongMap!18405 (_ BitVec 64)) Unit!41572)

(assert (=> b!1252811 (= lt!565341 (removeNotPresentStillSame!110 lt!565344 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1252812 () Bool)

(declare-fun res!835257 () Bool)

(declare-fun e!711534 () Bool)

(assert (=> b!1252812 (=> (not res!835257) (not e!711534))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81053 (_ BitVec 32)) Bool)

(assert (=> b!1252812 (= res!835257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252814 () Bool)

(declare-fun res!835260 () Bool)

(assert (=> b!1252814 (=> (not res!835260) (not e!711534))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252814 (= res!835260 (and (= (size!39623 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39624 _keys!1118) (size!39623 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252815 () Bool)

(declare-fun e!711530 () Bool)

(assert (=> b!1252815 (= e!711530 tp_is_empty!31669)))

(declare-fun b!1252816 () Bool)

(declare-fun e!711529 () Bool)

(assert (=> b!1252816 (= e!711534 (not e!711529))))

(declare-fun res!835255 () Bool)

(assert (=> b!1252816 (=> res!835255 e!711529)))

(assert (=> b!1252816 (= res!835255 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!565343 () ListLongMap!18405)

(declare-fun lt!565342 () ListLongMap!18405)

(assert (=> b!1252816 (= lt!565343 lt!565342)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47591)

(declare-fun minValueBefore!43 () V!47591)

(declare-fun lt!565345 () Unit!41572)

(declare-fun minValueAfter!43 () V!47591)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!959 (array!81053 array!81051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47591 V!47591 V!47591 V!47591 (_ BitVec 32) Int) Unit!41572)

(assert (=> b!1252816 (= lt!565345 (lemmaNoChangeToArrayThenSameMapNoExtras!959 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5645 (array!81053 array!81051 (_ BitVec 32) (_ BitVec 32) V!47591 V!47591 (_ BitVec 32) Int) ListLongMap!18405)

(assert (=> b!1252816 (= lt!565342 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252816 (= lt!565343 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252817 () Bool)

(assert (=> b!1252817 (= e!711529 e!711532)))

(declare-fun res!835259 () Bool)

(assert (=> b!1252817 (=> res!835259 e!711532)))

(declare-fun contains!7540 (ListLongMap!18405 (_ BitVec 64)) Bool)

(assert (=> b!1252817 (= res!835259 (contains!7540 lt!565344 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4476 (array!81053 array!81051 (_ BitVec 32) (_ BitVec 32) V!47591 V!47591 (_ BitVec 32) Int) ListLongMap!18405)

(assert (=> b!1252817 (= lt!565344 (getCurrentListMap!4476 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49270 () Bool)

(declare-fun tp!93796 () Bool)

(assert (=> mapNonEmpty!49270 (= mapRes!49270 (and tp!93796 e!711530))))

(declare-fun mapValue!49270 () ValueCell!15071)

(declare-fun mapRest!49270 () (Array (_ BitVec 32) ValueCell!15071))

(declare-fun mapKey!49270 () (_ BitVec 32))

(assert (=> mapNonEmpty!49270 (= (arr!39086 _values!914) (store mapRest!49270 mapKey!49270 mapValue!49270))))

(declare-fun res!835258 () Bool)

(assert (=> start!105222 (=> (not res!835258) (not e!711534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105222 (= res!835258 (validMask!0 mask!1466))))

(assert (=> start!105222 e!711534))

(assert (=> start!105222 true))

(assert (=> start!105222 tp!93797))

(assert (=> start!105222 tp_is_empty!31669))

(declare-fun array_inv!29927 (array!81053) Bool)

(assert (=> start!105222 (array_inv!29927 _keys!1118)))

(declare-fun array_inv!29928 (array!81051) Bool)

(assert (=> start!105222 (and (array_inv!29928 _values!914) e!711535)))

(declare-fun b!1252813 () Bool)

(declare-fun res!835256 () Bool)

(assert (=> b!1252813 (=> (not res!835256) (not e!711534))))

(declare-datatypes ((List!27770 0))(
  ( (Nil!27767) (Cons!27766 (h!28984 (_ BitVec 64)) (t!41237 List!27770)) )
))
(declare-fun arrayNoDuplicates!0 (array!81053 (_ BitVec 32) List!27770) Bool)

(assert (=> b!1252813 (= res!835256 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27767))))

(assert (= (and start!105222 res!835258) b!1252814))

(assert (= (and b!1252814 res!835260) b!1252812))

(assert (= (and b!1252812 res!835257) b!1252813))

(assert (= (and b!1252813 res!835256) b!1252816))

(assert (= (and b!1252816 (not res!835255)) b!1252817))

(assert (= (and b!1252817 (not res!835259)) b!1252811))

(assert (= (and b!1252810 condMapEmpty!49270) mapIsEmpty!49270))

(assert (= (and b!1252810 (not condMapEmpty!49270)) mapNonEmpty!49270))

(get-info :version)

(assert (= (and mapNonEmpty!49270 ((_ is ValueCellFull!15071) mapValue!49270)) b!1252815))

(assert (= (and b!1252810 ((_ is ValueCellFull!15071) mapDefault!49270)) b!1252809))

(assert (= start!105222 b!1252810))

(declare-fun m!1153881 () Bool)

(assert (=> b!1252812 m!1153881))

(declare-fun m!1153883 () Bool)

(assert (=> mapNonEmpty!49270 m!1153883))

(declare-fun m!1153885 () Bool)

(assert (=> b!1252813 m!1153885))

(declare-fun m!1153887 () Bool)

(assert (=> start!105222 m!1153887))

(declare-fun m!1153889 () Bool)

(assert (=> start!105222 m!1153889))

(declare-fun m!1153891 () Bool)

(assert (=> start!105222 m!1153891))

(declare-fun m!1153893 () Bool)

(assert (=> b!1252816 m!1153893))

(declare-fun m!1153895 () Bool)

(assert (=> b!1252816 m!1153895))

(declare-fun m!1153897 () Bool)

(assert (=> b!1252816 m!1153897))

(declare-fun m!1153899 () Bool)

(assert (=> b!1252817 m!1153899))

(declare-fun m!1153901 () Bool)

(assert (=> b!1252817 m!1153901))

(declare-fun m!1153903 () Bool)

(assert (=> b!1252811 m!1153903))

(declare-fun m!1153905 () Bool)

(assert (=> b!1252811 m!1153905))

(check-sat (not start!105222) (not b!1252816) (not b!1252817) (not b!1252811) (not b_next!26767) tp_is_empty!31669 b_and!44555 (not b!1252812) (not b!1252813) (not mapNonEmpty!49270))
(check-sat b_and!44555 (not b_next!26767))
(get-model)

(declare-fun b!1252880 () Bool)

(declare-fun e!711585 () Bool)

(declare-fun e!711586 () Bool)

(assert (=> b!1252880 (= e!711585 e!711586)))

(declare-fun c!122592 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1252880 (= c!122592 (validKeyInArray!0 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138391 () Bool)

(declare-fun res!835302 () Bool)

(assert (=> d!138391 (=> res!835302 e!711585)))

(assert (=> d!138391 (= res!835302 (bvsge #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(assert (=> d!138391 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!711585)))

(declare-fun b!1252881 () Bool)

(declare-fun e!711584 () Bool)

(assert (=> b!1252881 (= e!711586 e!711584)))

(declare-fun lt!565382 () (_ BitVec 64))

(assert (=> b!1252881 (= lt!565382 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565383 () Unit!41572)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81053 (_ BitVec 64) (_ BitVec 32)) Unit!41572)

(assert (=> b!1252881 (= lt!565383 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!565382 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1252881 (arrayContainsKey!0 _keys!1118 lt!565382 #b00000000000000000000000000000000)))

(declare-fun lt!565384 () Unit!41572)

(assert (=> b!1252881 (= lt!565384 lt!565383)))

(declare-fun res!835301 () Bool)

(declare-datatypes ((SeekEntryResult!9916 0))(
  ( (MissingZero!9916 (index!42035 (_ BitVec 32))) (Found!9916 (index!42036 (_ BitVec 32))) (Intermediate!9916 (undefined!10728 Bool) (index!42037 (_ BitVec 32)) (x!110091 (_ BitVec 32))) (Undefined!9916) (MissingVacant!9916 (index!42038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81053 (_ BitVec 32)) SeekEntryResult!9916)

(assert (=> b!1252881 (= res!835301 (= (seekEntryOrOpen!0 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9916 #b00000000000000000000000000000000)))))

(assert (=> b!1252881 (=> (not res!835301) (not e!711584))))

(declare-fun b!1252882 () Bool)

(declare-fun call!61687 () Bool)

(assert (=> b!1252882 (= e!711584 call!61687)))

(declare-fun bm!61684 () Bool)

(assert (=> bm!61684 (= call!61687 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1252883 () Bool)

(assert (=> b!1252883 (= e!711586 call!61687)))

(assert (= (and d!138391 (not res!835302)) b!1252880))

(assert (= (and b!1252880 c!122592) b!1252881))

(assert (= (and b!1252880 (not c!122592)) b!1252883))

(assert (= (and b!1252881 res!835301) b!1252882))

(assert (= (or b!1252882 b!1252883) bm!61684))

(declare-fun m!1153959 () Bool)

(assert (=> b!1252880 m!1153959))

(assert (=> b!1252880 m!1153959))

(declare-fun m!1153961 () Bool)

(assert (=> b!1252880 m!1153961))

(assert (=> b!1252881 m!1153959))

(declare-fun m!1153963 () Bool)

(assert (=> b!1252881 m!1153963))

(declare-fun m!1153965 () Bool)

(assert (=> b!1252881 m!1153965))

(assert (=> b!1252881 m!1153959))

(declare-fun m!1153967 () Bool)

(assert (=> b!1252881 m!1153967))

(declare-fun m!1153969 () Bool)

(assert (=> bm!61684 m!1153969))

(assert (=> b!1252812 d!138391))

(declare-fun b!1252894 () Bool)

(declare-fun e!711598 () Bool)

(declare-fun e!711596 () Bool)

(assert (=> b!1252894 (= e!711598 e!711596)))

(declare-fun c!122595 () Bool)

(assert (=> b!1252894 (= c!122595 (validKeyInArray!0 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252895 () Bool)

(declare-fun call!61690 () Bool)

(assert (=> b!1252895 (= e!711596 call!61690)))

(declare-fun d!138393 () Bool)

(declare-fun res!835309 () Bool)

(declare-fun e!711597 () Bool)

(assert (=> d!138393 (=> res!835309 e!711597)))

(assert (=> d!138393 (= res!835309 (bvsge #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(assert (=> d!138393 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27767) e!711597)))

(declare-fun bm!61687 () Bool)

(assert (=> bm!61687 (= call!61690 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122595 (Cons!27766 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000) Nil!27767) Nil!27767)))))

(declare-fun b!1252896 () Bool)

(assert (=> b!1252896 (= e!711596 call!61690)))

(declare-fun b!1252897 () Bool)

(declare-fun e!711595 () Bool)

(declare-fun contains!7542 (List!27770 (_ BitVec 64)) Bool)

(assert (=> b!1252897 (= e!711595 (contains!7542 Nil!27767 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252898 () Bool)

(assert (=> b!1252898 (= e!711597 e!711598)))

(declare-fun res!835310 () Bool)

(assert (=> b!1252898 (=> (not res!835310) (not e!711598))))

(assert (=> b!1252898 (= res!835310 (not e!711595))))

(declare-fun res!835311 () Bool)

(assert (=> b!1252898 (=> (not res!835311) (not e!711595))))

(assert (=> b!1252898 (= res!835311 (validKeyInArray!0 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138393 (not res!835309)) b!1252898))

(assert (= (and b!1252898 res!835311) b!1252897))

(assert (= (and b!1252898 res!835310) b!1252894))

(assert (= (and b!1252894 c!122595) b!1252896))

(assert (= (and b!1252894 (not c!122595)) b!1252895))

(assert (= (or b!1252896 b!1252895) bm!61687))

(assert (=> b!1252894 m!1153959))

(assert (=> b!1252894 m!1153959))

(assert (=> b!1252894 m!1153961))

(assert (=> bm!61687 m!1153959))

(declare-fun m!1153971 () Bool)

(assert (=> bm!61687 m!1153971))

(assert (=> b!1252897 m!1153959))

(assert (=> b!1252897 m!1153959))

(declare-fun m!1153973 () Bool)

(assert (=> b!1252897 m!1153973))

(assert (=> b!1252898 m!1153959))

(assert (=> b!1252898 m!1153959))

(assert (=> b!1252898 m!1153961))

(assert (=> b!1252813 d!138393))

(declare-fun d!138395 () Bool)

(assert (=> d!138395 (= (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565387 () Unit!41572)

(declare-fun choose!1853 (array!81053 array!81051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47591 V!47591 V!47591 V!47591 (_ BitVec 32) Int) Unit!41572)

(assert (=> d!138395 (= lt!565387 (choose!1853 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138395 (validMask!0 mask!1466)))

(assert (=> d!138395 (= (lemmaNoChangeToArrayThenSameMapNoExtras!959 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565387)))

(declare-fun bs!35353 () Bool)

(assert (= bs!35353 d!138395))

(assert (=> bs!35353 m!1153897))

(assert (=> bs!35353 m!1153895))

(declare-fun m!1153975 () Bool)

(assert (=> bs!35353 m!1153975))

(assert (=> bs!35353 m!1153887))

(assert (=> b!1252816 d!138395))

(declare-fun b!1252923 () Bool)

(declare-fun e!711617 () Bool)

(declare-fun e!711616 () Bool)

(assert (=> b!1252923 (= e!711617 e!711616)))

(declare-fun c!122605 () Bool)

(declare-fun e!711613 () Bool)

(assert (=> b!1252923 (= c!122605 e!711613)))

(declare-fun res!835320 () Bool)

(assert (=> b!1252923 (=> (not res!835320) (not e!711613))))

(assert (=> b!1252923 (= res!835320 (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(declare-fun b!1252924 () Bool)

(declare-fun e!711618 () Bool)

(assert (=> b!1252924 (= e!711616 e!711618)))

(declare-fun c!122604 () Bool)

(assert (=> b!1252924 (= c!122604 (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(declare-fun b!1252925 () Bool)

(declare-fun e!711619 () ListLongMap!18405)

(declare-fun call!61693 () ListLongMap!18405)

(assert (=> b!1252925 (= e!711619 call!61693)))

(declare-fun b!1252926 () Bool)

(declare-fun e!711615 () Bool)

(assert (=> b!1252926 (= e!711616 e!711615)))

(assert (=> b!1252926 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(declare-fun res!835322 () Bool)

(declare-fun lt!565403 () ListLongMap!18405)

(assert (=> b!1252926 (= res!835322 (contains!7540 lt!565403 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252926 (=> (not res!835322) (not e!711615))))

(declare-fun b!1252927 () Bool)

(assert (=> b!1252927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(assert (=> b!1252927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39623 _values!914)))))

(declare-fun apply!991 (ListLongMap!18405 (_ BitVec 64)) V!47591)

(declare-fun get!20074 (ValueCell!15071 V!47591) V!47591)

(declare-fun dynLambda!3443 (Int (_ BitVec 64)) V!47591)

(assert (=> b!1252927 (= e!711615 (= (apply!991 lt!565403 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)) (get!20074 (select (arr!39086 _values!914) #b00000000000000000000000000000000) (dynLambda!3443 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1252928 () Bool)

(declare-fun e!711614 () ListLongMap!18405)

(assert (=> b!1252928 (= e!711614 e!711619)))

(declare-fun c!122607 () Bool)

(assert (=> b!1252928 (= c!122607 (validKeyInArray!0 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252929 () Bool)

(declare-fun isEmpty!1028 (ListLongMap!18405) Bool)

(assert (=> b!1252929 (= e!711618 (isEmpty!1028 lt!565403))))

(declare-fun b!1252930 () Bool)

(assert (=> b!1252930 (= e!711618 (= lt!565403 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1252931 () Bool)

(declare-fun lt!565408 () Unit!41572)

(declare-fun lt!565406 () Unit!41572)

(assert (=> b!1252931 (= lt!565408 lt!565406)))

(declare-fun lt!565405 () (_ BitVec 64))

(declare-fun lt!565402 () ListLongMap!18405)

(declare-fun lt!565407 () (_ BitVec 64))

(declare-fun lt!565404 () V!47591)

(declare-fun +!4195 (ListLongMap!18405 tuple2!20524) ListLongMap!18405)

(assert (=> b!1252931 (not (contains!7540 (+!4195 lt!565402 (tuple2!20525 lt!565405 lt!565404)) lt!565407))))

(declare-fun addStillNotContains!312 (ListLongMap!18405 (_ BitVec 64) V!47591 (_ BitVec 64)) Unit!41572)

(assert (=> b!1252931 (= lt!565406 (addStillNotContains!312 lt!565402 lt!565405 lt!565404 lt!565407))))

(assert (=> b!1252931 (= lt!565407 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1252931 (= lt!565404 (get!20074 (select (arr!39086 _values!914) #b00000000000000000000000000000000) (dynLambda!3443 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1252931 (= lt!565405 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1252931 (= lt!565402 call!61693)))

(assert (=> b!1252931 (= e!711619 (+!4195 call!61693 (tuple2!20525 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000) (get!20074 (select (arr!39086 _values!914) #b00000000000000000000000000000000) (dynLambda!3443 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1252933 () Bool)

(declare-fun res!835321 () Bool)

(assert (=> b!1252933 (=> (not res!835321) (not e!711617))))

(assert (=> b!1252933 (= res!835321 (not (contains!7540 lt!565403 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1252934 () Bool)

(assert (=> b!1252934 (= e!711613 (validKeyInArray!0 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252934 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!61690 () Bool)

(assert (=> bm!61690 (= call!61693 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun d!138397 () Bool)

(assert (=> d!138397 e!711617))

(declare-fun res!835323 () Bool)

(assert (=> d!138397 (=> (not res!835323) (not e!711617))))

(assert (=> d!138397 (= res!835323 (not (contains!7540 lt!565403 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138397 (= lt!565403 e!711614)))

(declare-fun c!122606 () Bool)

(assert (=> d!138397 (= c!122606 (bvsge #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(assert (=> d!138397 (validMask!0 mask!1466)))

(assert (=> d!138397 (= (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565403)))

(declare-fun b!1252932 () Bool)

(assert (=> b!1252932 (= e!711614 (ListLongMap!18406 Nil!27766))))

(assert (= (and d!138397 c!122606) b!1252932))

(assert (= (and d!138397 (not c!122606)) b!1252928))

(assert (= (and b!1252928 c!122607) b!1252931))

(assert (= (and b!1252928 (not c!122607)) b!1252925))

(assert (= (or b!1252931 b!1252925) bm!61690))

(assert (= (and d!138397 res!835323) b!1252933))

(assert (= (and b!1252933 res!835321) b!1252923))

(assert (= (and b!1252923 res!835320) b!1252934))

(assert (= (and b!1252923 c!122605) b!1252926))

(assert (= (and b!1252923 (not c!122605)) b!1252924))

(assert (= (and b!1252926 res!835322) b!1252927))

(assert (= (and b!1252924 c!122604) b!1252930))

(assert (= (and b!1252924 (not c!122604)) b!1252929))

(declare-fun b_lambda!22541 () Bool)

(assert (=> (not b_lambda!22541) (not b!1252927)))

(declare-fun t!41242 () Bool)

(declare-fun tb!11283 () Bool)

(assert (=> (and start!105222 (= defaultEntry!922 defaultEntry!922) t!41242) tb!11283))

(declare-fun result!23273 () Bool)

(assert (=> tb!11283 (= result!23273 tp_is_empty!31669)))

(assert (=> b!1252927 t!41242))

(declare-fun b_and!44561 () Bool)

(assert (= b_and!44555 (and (=> t!41242 result!23273) b_and!44561)))

(declare-fun b_lambda!22543 () Bool)

(assert (=> (not b_lambda!22543) (not b!1252931)))

(assert (=> b!1252931 t!41242))

(declare-fun b_and!44563 () Bool)

(assert (= b_and!44561 (and (=> t!41242 result!23273) b_and!44563)))

(declare-fun m!1153977 () Bool)

(assert (=> b!1252933 m!1153977))

(declare-fun m!1153979 () Bool)

(assert (=> b!1252929 m!1153979))

(declare-fun m!1153981 () Bool)

(assert (=> bm!61690 m!1153981))

(declare-fun m!1153983 () Bool)

(assert (=> d!138397 m!1153983))

(assert (=> d!138397 m!1153887))

(declare-fun m!1153985 () Bool)

(assert (=> b!1252931 m!1153985))

(declare-fun m!1153987 () Bool)

(assert (=> b!1252931 m!1153987))

(declare-fun m!1153989 () Bool)

(assert (=> b!1252931 m!1153989))

(assert (=> b!1252931 m!1153959))

(assert (=> b!1252931 m!1153985))

(declare-fun m!1153991 () Bool)

(assert (=> b!1252931 m!1153991))

(declare-fun m!1153993 () Bool)

(assert (=> b!1252931 m!1153993))

(assert (=> b!1252931 m!1153991))

(declare-fun m!1153995 () Bool)

(assert (=> b!1252931 m!1153995))

(assert (=> b!1252931 m!1153987))

(declare-fun m!1153997 () Bool)

(assert (=> b!1252931 m!1153997))

(assert (=> b!1252928 m!1153959))

(assert (=> b!1252928 m!1153959))

(assert (=> b!1252928 m!1153961))

(assert (=> b!1252930 m!1153981))

(assert (=> b!1252926 m!1153959))

(assert (=> b!1252926 m!1153959))

(declare-fun m!1153999 () Bool)

(assert (=> b!1252926 m!1153999))

(assert (=> b!1252934 m!1153959))

(assert (=> b!1252934 m!1153959))

(assert (=> b!1252934 m!1153961))

(assert (=> b!1252927 m!1153959))

(declare-fun m!1154001 () Bool)

(assert (=> b!1252927 m!1154001))

(assert (=> b!1252927 m!1153985))

(assert (=> b!1252927 m!1153987))

(assert (=> b!1252927 m!1153989))

(assert (=> b!1252927 m!1153987))

(assert (=> b!1252927 m!1153959))

(assert (=> b!1252927 m!1153985))

(assert (=> b!1252816 d!138397))

(declare-fun b!1252937 () Bool)

(declare-fun e!711624 () Bool)

(declare-fun e!711623 () Bool)

(assert (=> b!1252937 (= e!711624 e!711623)))

(declare-fun c!122609 () Bool)

(declare-fun e!711620 () Bool)

(assert (=> b!1252937 (= c!122609 e!711620)))

(declare-fun res!835324 () Bool)

(assert (=> b!1252937 (=> (not res!835324) (not e!711620))))

(assert (=> b!1252937 (= res!835324 (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(declare-fun b!1252938 () Bool)

(declare-fun e!711625 () Bool)

(assert (=> b!1252938 (= e!711623 e!711625)))

(declare-fun c!122608 () Bool)

(assert (=> b!1252938 (= c!122608 (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(declare-fun b!1252939 () Bool)

(declare-fun e!711626 () ListLongMap!18405)

(declare-fun call!61694 () ListLongMap!18405)

(assert (=> b!1252939 (= e!711626 call!61694)))

(declare-fun b!1252940 () Bool)

(declare-fun e!711622 () Bool)

(assert (=> b!1252940 (= e!711623 e!711622)))

(assert (=> b!1252940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(declare-fun res!835326 () Bool)

(declare-fun lt!565410 () ListLongMap!18405)

(assert (=> b!1252940 (= res!835326 (contains!7540 lt!565410 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252940 (=> (not res!835326) (not e!711622))))

(declare-fun b!1252941 () Bool)

(assert (=> b!1252941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(assert (=> b!1252941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39623 _values!914)))))

(assert (=> b!1252941 (= e!711622 (= (apply!991 lt!565410 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)) (get!20074 (select (arr!39086 _values!914) #b00000000000000000000000000000000) (dynLambda!3443 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1252942 () Bool)

(declare-fun e!711621 () ListLongMap!18405)

(assert (=> b!1252942 (= e!711621 e!711626)))

(declare-fun c!122611 () Bool)

(assert (=> b!1252942 (= c!122611 (validKeyInArray!0 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252943 () Bool)

(assert (=> b!1252943 (= e!711625 (isEmpty!1028 lt!565410))))

(declare-fun b!1252944 () Bool)

(assert (=> b!1252944 (= e!711625 (= lt!565410 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1252945 () Bool)

(declare-fun lt!565415 () Unit!41572)

(declare-fun lt!565413 () Unit!41572)

(assert (=> b!1252945 (= lt!565415 lt!565413)))

(declare-fun lt!565412 () (_ BitVec 64))

(declare-fun lt!565409 () ListLongMap!18405)

(declare-fun lt!565414 () (_ BitVec 64))

(declare-fun lt!565411 () V!47591)

(assert (=> b!1252945 (not (contains!7540 (+!4195 lt!565409 (tuple2!20525 lt!565412 lt!565411)) lt!565414))))

(assert (=> b!1252945 (= lt!565413 (addStillNotContains!312 lt!565409 lt!565412 lt!565411 lt!565414))))

(assert (=> b!1252945 (= lt!565414 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1252945 (= lt!565411 (get!20074 (select (arr!39086 _values!914) #b00000000000000000000000000000000) (dynLambda!3443 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1252945 (= lt!565412 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1252945 (= lt!565409 call!61694)))

(assert (=> b!1252945 (= e!711626 (+!4195 call!61694 (tuple2!20525 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000) (get!20074 (select (arr!39086 _values!914) #b00000000000000000000000000000000) (dynLambda!3443 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1252947 () Bool)

(declare-fun res!835325 () Bool)

(assert (=> b!1252947 (=> (not res!835325) (not e!711624))))

(assert (=> b!1252947 (= res!835325 (not (contains!7540 lt!565410 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1252948 () Bool)

(assert (=> b!1252948 (= e!711620 (validKeyInArray!0 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252948 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!61691 () Bool)

(assert (=> bm!61691 (= call!61694 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun d!138399 () Bool)

(assert (=> d!138399 e!711624))

(declare-fun res!835327 () Bool)

(assert (=> d!138399 (=> (not res!835327) (not e!711624))))

(assert (=> d!138399 (= res!835327 (not (contains!7540 lt!565410 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138399 (= lt!565410 e!711621)))

(declare-fun c!122610 () Bool)

(assert (=> d!138399 (= c!122610 (bvsge #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(assert (=> d!138399 (validMask!0 mask!1466)))

(assert (=> d!138399 (= (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565410)))

(declare-fun b!1252946 () Bool)

(assert (=> b!1252946 (= e!711621 (ListLongMap!18406 Nil!27766))))

(assert (= (and d!138399 c!122610) b!1252946))

(assert (= (and d!138399 (not c!122610)) b!1252942))

(assert (= (and b!1252942 c!122611) b!1252945))

(assert (= (and b!1252942 (not c!122611)) b!1252939))

(assert (= (or b!1252945 b!1252939) bm!61691))

(assert (= (and d!138399 res!835327) b!1252947))

(assert (= (and b!1252947 res!835325) b!1252937))

(assert (= (and b!1252937 res!835324) b!1252948))

(assert (= (and b!1252937 c!122609) b!1252940))

(assert (= (and b!1252937 (not c!122609)) b!1252938))

(assert (= (and b!1252940 res!835326) b!1252941))

(assert (= (and b!1252938 c!122608) b!1252944))

(assert (= (and b!1252938 (not c!122608)) b!1252943))

(declare-fun b_lambda!22545 () Bool)

(assert (=> (not b_lambda!22545) (not b!1252941)))

(assert (=> b!1252941 t!41242))

(declare-fun b_and!44565 () Bool)

(assert (= b_and!44563 (and (=> t!41242 result!23273) b_and!44565)))

(declare-fun b_lambda!22547 () Bool)

(assert (=> (not b_lambda!22547) (not b!1252945)))

(assert (=> b!1252945 t!41242))

(declare-fun b_and!44567 () Bool)

(assert (= b_and!44565 (and (=> t!41242 result!23273) b_and!44567)))

(declare-fun m!1154003 () Bool)

(assert (=> b!1252947 m!1154003))

(declare-fun m!1154005 () Bool)

(assert (=> b!1252943 m!1154005))

(declare-fun m!1154007 () Bool)

(assert (=> bm!61691 m!1154007))

(declare-fun m!1154009 () Bool)

(assert (=> d!138399 m!1154009))

(assert (=> d!138399 m!1153887))

(assert (=> b!1252945 m!1153985))

(assert (=> b!1252945 m!1153987))

(assert (=> b!1252945 m!1153989))

(assert (=> b!1252945 m!1153959))

(assert (=> b!1252945 m!1153985))

(declare-fun m!1154011 () Bool)

(assert (=> b!1252945 m!1154011))

(declare-fun m!1154013 () Bool)

(assert (=> b!1252945 m!1154013))

(assert (=> b!1252945 m!1154011))

(declare-fun m!1154015 () Bool)

(assert (=> b!1252945 m!1154015))

(assert (=> b!1252945 m!1153987))

(declare-fun m!1154017 () Bool)

(assert (=> b!1252945 m!1154017))

(assert (=> b!1252942 m!1153959))

(assert (=> b!1252942 m!1153959))

(assert (=> b!1252942 m!1153961))

(assert (=> b!1252944 m!1154007))

(assert (=> b!1252940 m!1153959))

(assert (=> b!1252940 m!1153959))

(declare-fun m!1154019 () Bool)

(assert (=> b!1252940 m!1154019))

(assert (=> b!1252948 m!1153959))

(assert (=> b!1252948 m!1153959))

(assert (=> b!1252948 m!1153961))

(assert (=> b!1252941 m!1153959))

(declare-fun m!1154021 () Bool)

(assert (=> b!1252941 m!1154021))

(assert (=> b!1252941 m!1153985))

(assert (=> b!1252941 m!1153987))

(assert (=> b!1252941 m!1153989))

(assert (=> b!1252941 m!1153987))

(assert (=> b!1252941 m!1153959))

(assert (=> b!1252941 m!1153985))

(assert (=> b!1252816 d!138399))

(declare-fun d!138401 () Bool)

(declare-fun lt!565418 () ListLongMap!18405)

(assert (=> d!138401 (not (contains!7540 lt!565418 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!136 (List!27769 (_ BitVec 64)) List!27769)

(assert (=> d!138401 (= lt!565418 (ListLongMap!18406 (removeStrictlySorted!136 (toList!9218 lt!565344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138401 (= (-!2000 lt!565344 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565418)))

(declare-fun bs!35354 () Bool)

(assert (= bs!35354 d!138401))

(declare-fun m!1154023 () Bool)

(assert (=> bs!35354 m!1154023))

(declare-fun m!1154025 () Bool)

(assert (=> bs!35354 m!1154025))

(assert (=> b!1252811 d!138401))

(declare-fun d!138403 () Bool)

(assert (=> d!138403 (= (-!2000 lt!565344 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565344)))

(declare-fun lt!565421 () Unit!41572)

(declare-fun choose!1854 (ListLongMap!18405 (_ BitVec 64)) Unit!41572)

(assert (=> d!138403 (= lt!565421 (choose!1854 lt!565344 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138403 (not (contains!7540 lt!565344 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138403 (= (removeNotPresentStillSame!110 lt!565344 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565421)))

(declare-fun bs!35355 () Bool)

(assert (= bs!35355 d!138403))

(assert (=> bs!35355 m!1153903))

(declare-fun m!1154027 () Bool)

(assert (=> bs!35355 m!1154027))

(assert (=> bs!35355 m!1153899))

(assert (=> b!1252811 d!138403))

(declare-fun d!138405 () Bool)

(assert (=> d!138405 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105222 d!138405))

(declare-fun d!138407 () Bool)

(assert (=> d!138407 (= (array_inv!29927 _keys!1118) (bvsge (size!39624 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105222 d!138407))

(declare-fun d!138409 () Bool)

(assert (=> d!138409 (= (array_inv!29928 _values!914) (bvsge (size!39623 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105222 d!138409))

(declare-fun d!138411 () Bool)

(declare-fun e!711632 () Bool)

(assert (=> d!138411 e!711632))

(declare-fun res!835330 () Bool)

(assert (=> d!138411 (=> res!835330 e!711632)))

(declare-fun lt!565433 () Bool)

(assert (=> d!138411 (= res!835330 (not lt!565433))))

(declare-fun lt!565432 () Bool)

(assert (=> d!138411 (= lt!565433 lt!565432)))

(declare-fun lt!565431 () Unit!41572)

(declare-fun e!711631 () Unit!41572)

(assert (=> d!138411 (= lt!565431 e!711631)))

(declare-fun c!122614 () Bool)

(assert (=> d!138411 (= c!122614 lt!565432)))

(declare-fun containsKey!619 (List!27769 (_ BitVec 64)) Bool)

(assert (=> d!138411 (= lt!565432 (containsKey!619 (toList!9218 lt!565344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138411 (= (contains!7540 lt!565344 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565433)))

(declare-fun b!1252955 () Bool)

(declare-fun lt!565430 () Unit!41572)

(assert (=> b!1252955 (= e!711631 lt!565430)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!428 (List!27769 (_ BitVec 64)) Unit!41572)

(assert (=> b!1252955 (= lt!565430 (lemmaContainsKeyImpliesGetValueByKeyDefined!428 (toList!9218 lt!565344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!700 0))(
  ( (Some!699 (v!18593 V!47591)) (None!698) )
))
(declare-fun isDefined!466 (Option!700) Bool)

(declare-fun getValueByKey!649 (List!27769 (_ BitVec 64)) Option!700)

(assert (=> b!1252955 (isDefined!466 (getValueByKey!649 (toList!9218 lt!565344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1252956 () Bool)

(declare-fun Unit!41578 () Unit!41572)

(assert (=> b!1252956 (= e!711631 Unit!41578)))

(declare-fun b!1252957 () Bool)

(assert (=> b!1252957 (= e!711632 (isDefined!466 (getValueByKey!649 (toList!9218 lt!565344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138411 c!122614) b!1252955))

(assert (= (and d!138411 (not c!122614)) b!1252956))

(assert (= (and d!138411 (not res!835330)) b!1252957))

(declare-fun m!1154029 () Bool)

(assert (=> d!138411 m!1154029))

(declare-fun m!1154031 () Bool)

(assert (=> b!1252955 m!1154031))

(declare-fun m!1154033 () Bool)

(assert (=> b!1252955 m!1154033))

(assert (=> b!1252955 m!1154033))

(declare-fun m!1154035 () Bool)

(assert (=> b!1252955 m!1154035))

(assert (=> b!1252957 m!1154033))

(assert (=> b!1252957 m!1154033))

(assert (=> b!1252957 m!1154035))

(assert (=> b!1252817 d!138411))

(declare-fun b!1253000 () Bool)

(declare-fun e!711671 () Bool)

(declare-fun e!711665 () Bool)

(assert (=> b!1253000 (= e!711671 e!711665)))

(declare-fun res!835350 () Bool)

(declare-fun call!61715 () Bool)

(assert (=> b!1253000 (= res!835350 call!61715)))

(assert (=> b!1253000 (=> (not res!835350) (not e!711665))))

(declare-fun d!138413 () Bool)

(declare-fun e!711666 () Bool)

(assert (=> d!138413 e!711666))

(declare-fun res!835356 () Bool)

(assert (=> d!138413 (=> (not res!835356) (not e!711666))))

(assert (=> d!138413 (= res!835356 (or (bvsge #b00000000000000000000000000000000 (size!39624 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))))

(declare-fun lt!565490 () ListLongMap!18405)

(declare-fun lt!565491 () ListLongMap!18405)

(assert (=> d!138413 (= lt!565490 lt!565491)))

(declare-fun lt!565492 () Unit!41572)

(declare-fun e!711664 () Unit!41572)

(assert (=> d!138413 (= lt!565492 e!711664)))

(declare-fun c!122631 () Bool)

(declare-fun e!711661 () Bool)

(assert (=> d!138413 (= c!122631 e!711661)))

(declare-fun res!835354 () Bool)

(assert (=> d!138413 (=> (not res!835354) (not e!711661))))

(assert (=> d!138413 (= res!835354 (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(declare-fun e!711670 () ListLongMap!18405)

(assert (=> d!138413 (= lt!565491 e!711670)))

(declare-fun c!122632 () Bool)

(assert (=> d!138413 (= c!122632 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138413 (validMask!0 mask!1466)))

(assert (=> d!138413 (= (getCurrentListMap!4476 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565490)))

(declare-fun bm!61706 () Bool)

(assert (=> bm!61706 (= call!61715 (contains!7540 lt!565490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253001 () Bool)

(declare-fun res!835355 () Bool)

(assert (=> b!1253001 (=> (not res!835355) (not e!711666))))

(declare-fun e!711668 () Bool)

(assert (=> b!1253001 (= res!835355 e!711668)))

(declare-fun res!835352 () Bool)

(assert (=> b!1253001 (=> res!835352 e!711668)))

(declare-fun e!711669 () Bool)

(assert (=> b!1253001 (= res!835352 (not e!711669))))

(declare-fun res!835349 () Bool)

(assert (=> b!1253001 (=> (not res!835349) (not e!711669))))

(assert (=> b!1253001 (= res!835349 (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(declare-fun b!1253002 () Bool)

(declare-fun e!711667 () ListLongMap!18405)

(declare-fun call!61710 () ListLongMap!18405)

(assert (=> b!1253002 (= e!711667 call!61710)))

(declare-fun b!1253003 () Bool)

(assert (=> b!1253003 (= e!711661 (validKeyInArray!0 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253004 () Bool)

(declare-fun lt!565488 () Unit!41572)

(assert (=> b!1253004 (= e!711664 lt!565488)))

(declare-fun lt!565481 () ListLongMap!18405)

(assert (=> b!1253004 (= lt!565481 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565485 () (_ BitVec 64))

(assert (=> b!1253004 (= lt!565485 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565499 () (_ BitVec 64))

(assert (=> b!1253004 (= lt!565499 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565498 () Unit!41572)

(declare-fun addStillContains!1084 (ListLongMap!18405 (_ BitVec 64) V!47591 (_ BitVec 64)) Unit!41572)

(assert (=> b!1253004 (= lt!565498 (addStillContains!1084 lt!565481 lt!565485 zeroValue!871 lt!565499))))

(assert (=> b!1253004 (contains!7540 (+!4195 lt!565481 (tuple2!20525 lt!565485 zeroValue!871)) lt!565499)))

(declare-fun lt!565495 () Unit!41572)

(assert (=> b!1253004 (= lt!565495 lt!565498)))

(declare-fun lt!565480 () ListLongMap!18405)

(assert (=> b!1253004 (= lt!565480 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565487 () (_ BitVec 64))

(assert (=> b!1253004 (= lt!565487 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565482 () (_ BitVec 64))

(assert (=> b!1253004 (= lt!565482 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565486 () Unit!41572)

(declare-fun addApplyDifferent!526 (ListLongMap!18405 (_ BitVec 64) V!47591 (_ BitVec 64)) Unit!41572)

(assert (=> b!1253004 (= lt!565486 (addApplyDifferent!526 lt!565480 lt!565487 minValueBefore!43 lt!565482))))

(assert (=> b!1253004 (= (apply!991 (+!4195 lt!565480 (tuple2!20525 lt!565487 minValueBefore!43)) lt!565482) (apply!991 lt!565480 lt!565482))))

(declare-fun lt!565479 () Unit!41572)

(assert (=> b!1253004 (= lt!565479 lt!565486)))

(declare-fun lt!565497 () ListLongMap!18405)

(assert (=> b!1253004 (= lt!565497 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565493 () (_ BitVec 64))

(assert (=> b!1253004 (= lt!565493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565494 () (_ BitVec 64))

(assert (=> b!1253004 (= lt!565494 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565489 () Unit!41572)

(assert (=> b!1253004 (= lt!565489 (addApplyDifferent!526 lt!565497 lt!565493 zeroValue!871 lt!565494))))

(assert (=> b!1253004 (= (apply!991 (+!4195 lt!565497 (tuple2!20525 lt!565493 zeroValue!871)) lt!565494) (apply!991 lt!565497 lt!565494))))

(declare-fun lt!565496 () Unit!41572)

(assert (=> b!1253004 (= lt!565496 lt!565489)))

(declare-fun lt!565484 () ListLongMap!18405)

(assert (=> b!1253004 (= lt!565484 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565483 () (_ BitVec 64))

(assert (=> b!1253004 (= lt!565483 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565478 () (_ BitVec 64))

(assert (=> b!1253004 (= lt!565478 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1253004 (= lt!565488 (addApplyDifferent!526 lt!565484 lt!565483 minValueBefore!43 lt!565478))))

(assert (=> b!1253004 (= (apply!991 (+!4195 lt!565484 (tuple2!20525 lt!565483 minValueBefore!43)) lt!565478) (apply!991 lt!565484 lt!565478))))

(declare-fun e!711660 () Bool)

(declare-fun b!1253005 () Bool)

(assert (=> b!1253005 (= e!711660 (= (apply!991 lt!565490 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)) (get!20074 (select (arr!39086 _values!914) #b00000000000000000000000000000000) (dynLambda!3443 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1253005 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39623 _values!914)))))

(assert (=> b!1253005 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(declare-fun b!1253006 () Bool)

(declare-fun c!122630 () Bool)

(assert (=> b!1253006 (= c!122630 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!711659 () ListLongMap!18405)

(assert (=> b!1253006 (= e!711659 e!711667)))

(declare-fun bm!61707 () Bool)

(declare-fun call!61713 () ListLongMap!18405)

(declare-fun c!122628 () Bool)

(declare-fun call!61712 () ListLongMap!18405)

(declare-fun call!61709 () ListLongMap!18405)

(declare-fun call!61714 () ListLongMap!18405)

(assert (=> bm!61707 (= call!61709 (+!4195 (ite c!122632 call!61712 (ite c!122628 call!61713 call!61714)) (ite (or c!122632 c!122628) (tuple2!20525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20525 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!61708 () Bool)

(assert (=> bm!61708 (= call!61712 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61709 () Bool)

(assert (=> bm!61709 (= call!61710 call!61709)))

(declare-fun bm!61710 () Bool)

(assert (=> bm!61710 (= call!61713 call!61712)))

(declare-fun b!1253007 () Bool)

(assert (=> b!1253007 (= e!711668 e!711660)))

(declare-fun res!835357 () Bool)

(assert (=> b!1253007 (=> (not res!835357) (not e!711660))))

(assert (=> b!1253007 (= res!835357 (contains!7540 lt!565490 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39624 _keys!1118)))))

(declare-fun b!1253008 () Bool)

(assert (=> b!1253008 (= e!711667 call!61714)))

(declare-fun b!1253009 () Bool)

(assert (=> b!1253009 (= e!711665 (= (apply!991 lt!565490 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1253010 () Bool)

(assert (=> b!1253010 (= e!711671 (not call!61715))))

(declare-fun b!1253011 () Bool)

(assert (=> b!1253011 (= e!711669 (validKeyInArray!0 (select (arr!39087 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253012 () Bool)

(declare-fun e!711662 () Bool)

(assert (=> b!1253012 (= e!711662 (= (apply!991 lt!565490 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!61711 () Bool)

(assert (=> bm!61711 (= call!61714 call!61713)))

(declare-fun b!1253013 () Bool)

(declare-fun e!711663 () Bool)

(assert (=> b!1253013 (= e!711666 e!711663)))

(declare-fun c!122627 () Bool)

(assert (=> b!1253013 (= c!122627 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253014 () Bool)

(declare-fun res!835351 () Bool)

(assert (=> b!1253014 (=> (not res!835351) (not e!711666))))

(assert (=> b!1253014 (= res!835351 e!711671)))

(declare-fun c!122629 () Bool)

(assert (=> b!1253014 (= c!122629 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1253015 () Bool)

(declare-fun call!61711 () Bool)

(assert (=> b!1253015 (= e!711663 (not call!61711))))

(declare-fun b!1253016 () Bool)

(declare-fun Unit!41579 () Unit!41572)

(assert (=> b!1253016 (= e!711664 Unit!41579)))

(declare-fun bm!61712 () Bool)

(assert (=> bm!61712 (= call!61711 (contains!7540 lt!565490 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253017 () Bool)

(assert (=> b!1253017 (= e!711670 (+!4195 call!61709 (tuple2!20525 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1253018 () Bool)

(assert (=> b!1253018 (= e!711663 e!711662)))

(declare-fun res!835353 () Bool)

(assert (=> b!1253018 (= res!835353 call!61711)))

(assert (=> b!1253018 (=> (not res!835353) (not e!711662))))

(declare-fun b!1253019 () Bool)

(assert (=> b!1253019 (= e!711659 call!61710)))

(declare-fun b!1253020 () Bool)

(assert (=> b!1253020 (= e!711670 e!711659)))

(assert (=> b!1253020 (= c!122628 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!138413 c!122632) b!1253017))

(assert (= (and d!138413 (not c!122632)) b!1253020))

(assert (= (and b!1253020 c!122628) b!1253019))

(assert (= (and b!1253020 (not c!122628)) b!1253006))

(assert (= (and b!1253006 c!122630) b!1253002))

(assert (= (and b!1253006 (not c!122630)) b!1253008))

(assert (= (or b!1253002 b!1253008) bm!61711))

(assert (= (or b!1253019 bm!61711) bm!61710))

(assert (= (or b!1253019 b!1253002) bm!61709))

(assert (= (or b!1253017 bm!61710) bm!61708))

(assert (= (or b!1253017 bm!61709) bm!61707))

(assert (= (and d!138413 res!835354) b!1253003))

(assert (= (and d!138413 c!122631) b!1253004))

(assert (= (and d!138413 (not c!122631)) b!1253016))

(assert (= (and d!138413 res!835356) b!1253001))

(assert (= (and b!1253001 res!835349) b!1253011))

(assert (= (and b!1253001 (not res!835352)) b!1253007))

(assert (= (and b!1253007 res!835357) b!1253005))

(assert (= (and b!1253001 res!835355) b!1253014))

(assert (= (and b!1253014 c!122629) b!1253000))

(assert (= (and b!1253014 (not c!122629)) b!1253010))

(assert (= (and b!1253000 res!835350) b!1253009))

(assert (= (or b!1253000 b!1253010) bm!61706))

(assert (= (and b!1253014 res!835351) b!1253013))

(assert (= (and b!1253013 c!122627) b!1253018))

(assert (= (and b!1253013 (not c!122627)) b!1253015))

(assert (= (and b!1253018 res!835353) b!1253012))

(assert (= (or b!1253018 b!1253015) bm!61712))

(declare-fun b_lambda!22549 () Bool)

(assert (=> (not b_lambda!22549) (not b!1253005)))

(assert (=> b!1253005 t!41242))

(declare-fun b_and!44569 () Bool)

(assert (= b_and!44567 (and (=> t!41242 result!23273) b_and!44569)))

(declare-fun m!1154037 () Bool)

(assert (=> bm!61706 m!1154037))

(assert (=> b!1253007 m!1153959))

(assert (=> b!1253007 m!1153959))

(declare-fun m!1154039 () Bool)

(assert (=> b!1253007 m!1154039))

(declare-fun m!1154041 () Bool)

(assert (=> b!1253004 m!1154041))

(declare-fun m!1154043 () Bool)

(assert (=> b!1253004 m!1154043))

(declare-fun m!1154045 () Bool)

(assert (=> b!1253004 m!1154045))

(declare-fun m!1154047 () Bool)

(assert (=> b!1253004 m!1154047))

(declare-fun m!1154049 () Bool)

(assert (=> b!1253004 m!1154049))

(declare-fun m!1154051 () Bool)

(assert (=> b!1253004 m!1154051))

(assert (=> b!1253004 m!1154043))

(assert (=> b!1253004 m!1153897))

(declare-fun m!1154053 () Bool)

(assert (=> b!1253004 m!1154053))

(declare-fun m!1154055 () Bool)

(assert (=> b!1253004 m!1154055))

(assert (=> b!1253004 m!1154049))

(declare-fun m!1154057 () Bool)

(assert (=> b!1253004 m!1154057))

(assert (=> b!1253004 m!1153959))

(declare-fun m!1154059 () Bool)

(assert (=> b!1253004 m!1154059))

(declare-fun m!1154061 () Bool)

(assert (=> b!1253004 m!1154061))

(assert (=> b!1253004 m!1154053))

(assert (=> b!1253004 m!1154061))

(declare-fun m!1154063 () Bool)

(assert (=> b!1253004 m!1154063))

(declare-fun m!1154065 () Bool)

(assert (=> b!1253004 m!1154065))

(declare-fun m!1154067 () Bool)

(assert (=> b!1253004 m!1154067))

(declare-fun m!1154069 () Bool)

(assert (=> b!1253004 m!1154069))

(assert (=> b!1253011 m!1153959))

(assert (=> b!1253011 m!1153959))

(assert (=> b!1253011 m!1153961))

(declare-fun m!1154071 () Bool)

(assert (=> b!1253017 m!1154071))

(declare-fun m!1154073 () Bool)

(assert (=> b!1253009 m!1154073))

(assert (=> d!138413 m!1153887))

(assert (=> b!1253003 m!1153959))

(assert (=> b!1253003 m!1153959))

(assert (=> b!1253003 m!1153961))

(declare-fun m!1154075 () Bool)

(assert (=> bm!61712 m!1154075))

(assert (=> bm!61708 m!1153897))

(assert (=> b!1253005 m!1153985))

(assert (=> b!1253005 m!1153987))

(assert (=> b!1253005 m!1153989))

(assert (=> b!1253005 m!1153959))

(declare-fun m!1154077 () Bool)

(assert (=> b!1253005 m!1154077))

(assert (=> b!1253005 m!1153987))

(assert (=> b!1253005 m!1153985))

(assert (=> b!1253005 m!1153959))

(declare-fun m!1154079 () Bool)

(assert (=> b!1253012 m!1154079))

(declare-fun m!1154081 () Bool)

(assert (=> bm!61707 m!1154081))

(assert (=> b!1252817 d!138413))

(declare-fun mapNonEmpty!49279 () Bool)

(declare-fun mapRes!49279 () Bool)

(declare-fun tp!93812 () Bool)

(declare-fun e!711676 () Bool)

(assert (=> mapNonEmpty!49279 (= mapRes!49279 (and tp!93812 e!711676))))

(declare-fun mapRest!49279 () (Array (_ BitVec 32) ValueCell!15071))

(declare-fun mapKey!49279 () (_ BitVec 32))

(declare-fun mapValue!49279 () ValueCell!15071)

(assert (=> mapNonEmpty!49279 (= mapRest!49270 (store mapRest!49279 mapKey!49279 mapValue!49279))))

(declare-fun b!1253028 () Bool)

(declare-fun e!711677 () Bool)

(assert (=> b!1253028 (= e!711677 tp_is_empty!31669)))

(declare-fun b!1253027 () Bool)

(assert (=> b!1253027 (= e!711676 tp_is_empty!31669)))

(declare-fun mapIsEmpty!49279 () Bool)

(assert (=> mapIsEmpty!49279 mapRes!49279))

(declare-fun condMapEmpty!49279 () Bool)

(declare-fun mapDefault!49279 () ValueCell!15071)

(assert (=> mapNonEmpty!49270 (= condMapEmpty!49279 (= mapRest!49270 ((as const (Array (_ BitVec 32) ValueCell!15071)) mapDefault!49279)))))

(assert (=> mapNonEmpty!49270 (= tp!93796 (and e!711677 mapRes!49279))))

(assert (= (and mapNonEmpty!49270 condMapEmpty!49279) mapIsEmpty!49279))

(assert (= (and mapNonEmpty!49270 (not condMapEmpty!49279)) mapNonEmpty!49279))

(assert (= (and mapNonEmpty!49279 ((_ is ValueCellFull!15071) mapValue!49279)) b!1253027))

(assert (= (and mapNonEmpty!49270 ((_ is ValueCellFull!15071) mapDefault!49279)) b!1253028))

(declare-fun m!1154083 () Bool)

(assert (=> mapNonEmpty!49279 m!1154083))

(declare-fun b_lambda!22551 () Bool)

(assert (= b_lambda!22549 (or (and start!105222 b_free!26767) b_lambda!22551)))

(declare-fun b_lambda!22553 () Bool)

(assert (= b_lambda!22543 (or (and start!105222 b_free!26767) b_lambda!22553)))

(declare-fun b_lambda!22555 () Bool)

(assert (= b_lambda!22541 (or (and start!105222 b_free!26767) b_lambda!22555)))

(declare-fun b_lambda!22557 () Bool)

(assert (= b_lambda!22547 (or (and start!105222 b_free!26767) b_lambda!22557)))

(declare-fun b_lambda!22559 () Bool)

(assert (= b_lambda!22545 (or (and start!105222 b_free!26767) b_lambda!22559)))

(check-sat (not b_lambda!22553) (not b!1252880) (not b!1252897) (not b!1252945) (not bm!61690) (not d!138403) (not b!1252944) (not bm!61708) (not b_lambda!22555) (not b!1253004) (not b!1252934) (not b!1252943) (not b!1253011) (not b!1253007) (not b_lambda!22551) (not b!1252948) (not b!1252930) (not b!1253005) (not d!138395) (not bm!61687) (not b!1252928) (not b_lambda!22557) (not d!138413) (not b!1252898) (not b!1252881) (not b!1252931) (not b!1252940) (not b!1252926) (not b!1252929) (not b!1253017) (not b!1253003) (not b!1253009) (not b!1252894) (not b!1252927) (not b!1253012) (not bm!61706) (not bm!61691) (not b_lambda!22559) (not mapNonEmpty!49279) (not bm!61684) (not d!138399) (not b_next!26767) (not b!1252947) (not b!1252941) (not b!1252942) (not b!1252957) tp_is_empty!31669 (not d!138397) b_and!44569 (not d!138401) (not b!1252955) (not d!138411) (not bm!61707) (not b!1252933) (not bm!61712))
(check-sat b_and!44569 (not b_next!26767))
