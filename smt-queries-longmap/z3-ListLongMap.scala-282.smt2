; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4582 () Bool)

(assert start!4582)

(declare-fun b_free!1281 () Bool)

(declare-fun b_next!1281 () Bool)

(assert (=> start!4582 (= b_free!1281 (not b_next!1281))))

(declare-fun tp!5290 () Bool)

(declare-fun b_and!2109 () Bool)

(assert (=> start!4582 (= tp!5290 b_and!2109)))

(declare-fun b!35863 () Bool)

(declare-fun res!21769 () Bool)

(declare-fun e!22656 () Bool)

(assert (=> b!35863 (=> (not res!21769) (not e!22656))))

(declare-datatypes ((V!2005 0))(
  ( (V!2006 (val!844 Int)) )
))
(declare-datatypes ((ValueCell!618 0))(
  ( (ValueCellFull!618 (v!1942 V!2005)) (EmptyCell!618) )
))
(declare-datatypes ((array!2485 0))(
  ( (array!2486 (arr!1187 (Array (_ BitVec 32) ValueCell!618)) (size!1288 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2485)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2487 0))(
  ( (array!2488 (arr!1188 (Array (_ BitVec 32) (_ BitVec 64))) (size!1289 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2487)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!35863 (= res!21769 (and (= (size!1288 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1289 _keys!1833) (size!1288 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!35864 () Bool)

(declare-datatypes ((SeekEntryResult!165 0))(
  ( (MissingZero!165 (index!2782 (_ BitVec 32))) (Found!165 (index!2783 (_ BitVec 32))) (Intermediate!165 (undefined!977 Bool) (index!2784 (_ BitVec 32)) (x!7053 (_ BitVec 32))) (Undefined!165) (MissingVacant!165 (index!2785 (_ BitVec 32))) )
))
(declare-fun lt!13219 () SeekEntryResult!165)

(get-info :version)

(assert (=> b!35864 (= e!22656 (and (not ((_ is Found!165) lt!13219)) (not ((_ is MissingZero!165) lt!13219)) (not ((_ is Undefined!165) lt!13219))))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2487 (_ BitVec 32)) SeekEntryResult!165)

(assert (=> b!35864 (= lt!13219 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35865 () Bool)

(declare-fun res!21771 () Bool)

(assert (=> b!35865 (=> (not res!21771) (not e!22656))))

(declare-datatypes ((List!948 0))(
  ( (Nil!945) (Cons!944 (h!1511 (_ BitVec 64)) (t!3659 List!948)) )
))
(declare-fun arrayNoDuplicates!0 (array!2487 (_ BitVec 32) List!948) Bool)

(assert (=> b!35865 (= res!21771 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!945))))

(declare-fun b!35866 () Bool)

(declare-fun e!22653 () Bool)

(declare-fun e!22655 () Bool)

(declare-fun mapRes!2008 () Bool)

(assert (=> b!35866 (= e!22653 (and e!22655 mapRes!2008))))

(declare-fun condMapEmpty!2008 () Bool)

(declare-fun mapDefault!2008 () ValueCell!618)

(assert (=> b!35866 (= condMapEmpty!2008 (= (arr!1187 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!618)) mapDefault!2008)))))

(declare-fun b!35867 () Bool)

(declare-fun e!22654 () Bool)

(declare-fun tp_is_empty!1635 () Bool)

(assert (=> b!35867 (= e!22654 tp_is_empty!1635)))

(declare-fun b!35868 () Bool)

(assert (=> b!35868 (= e!22655 tp_is_empty!1635)))

(declare-fun b!35869 () Bool)

(declare-fun res!21766 () Bool)

(assert (=> b!35869 (=> (not res!21766) (not e!22656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35869 (= res!21766 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!2008 () Bool)

(assert (=> mapIsEmpty!2008 mapRes!2008))

(declare-fun mapNonEmpty!2008 () Bool)

(declare-fun tp!5289 () Bool)

(assert (=> mapNonEmpty!2008 (= mapRes!2008 (and tp!5289 e!22654))))

(declare-fun mapKey!2008 () (_ BitVec 32))

(declare-fun mapRest!2008 () (Array (_ BitVec 32) ValueCell!618))

(declare-fun mapValue!2008 () ValueCell!618)

(assert (=> mapNonEmpty!2008 (= (arr!1187 _values!1501) (store mapRest!2008 mapKey!2008 mapValue!2008))))

(declare-fun b!35871 () Bool)

(declare-fun res!21770 () Bool)

(assert (=> b!35871 (=> (not res!21770) (not e!22656))))

(declare-fun arrayContainsKey!0 (array!2487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35871 (= res!21770 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!35872 () Bool)

(declare-fun res!21767 () Bool)

(assert (=> b!35872 (=> (not res!21767) (not e!22656))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun minValue!1443 () V!2005)

(declare-fun zeroValue!1443 () V!2005)

(declare-datatypes ((tuple2!1354 0))(
  ( (tuple2!1355 (_1!688 (_ BitVec 64)) (_2!688 V!2005)) )
))
(declare-datatypes ((List!949 0))(
  ( (Nil!946) (Cons!945 (h!1512 tuple2!1354) (t!3660 List!949)) )
))
(declare-datatypes ((ListLongMap!931 0))(
  ( (ListLongMap!932 (toList!481 List!949)) )
))
(declare-fun contains!430 (ListLongMap!931 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!305 (array!2487 array!2485 (_ BitVec 32) (_ BitVec 32) V!2005 V!2005 (_ BitVec 32) Int) ListLongMap!931)

(assert (=> b!35872 (= res!21767 (not (contains!430 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!35870 () Bool)

(declare-fun res!21768 () Bool)

(assert (=> b!35870 (=> (not res!21768) (not e!22656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2487 (_ BitVec 32)) Bool)

(assert (=> b!35870 (= res!21768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!21772 () Bool)

(assert (=> start!4582 (=> (not res!21772) (not e!22656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4582 (= res!21772 (validMask!0 mask!2294))))

(assert (=> start!4582 e!22656))

(assert (=> start!4582 true))

(assert (=> start!4582 tp!5290))

(declare-fun array_inv!833 (array!2485) Bool)

(assert (=> start!4582 (and (array_inv!833 _values!1501) e!22653)))

(declare-fun array_inv!834 (array!2487) Bool)

(assert (=> start!4582 (array_inv!834 _keys!1833)))

(assert (=> start!4582 tp_is_empty!1635))

(assert (= (and start!4582 res!21772) b!35863))

(assert (= (and b!35863 res!21769) b!35870))

(assert (= (and b!35870 res!21768) b!35865))

(assert (= (and b!35865 res!21771) b!35869))

(assert (= (and b!35869 res!21766) b!35872))

(assert (= (and b!35872 res!21767) b!35871))

(assert (= (and b!35871 res!21770) b!35864))

(assert (= (and b!35866 condMapEmpty!2008) mapIsEmpty!2008))

(assert (= (and b!35866 (not condMapEmpty!2008)) mapNonEmpty!2008))

(assert (= (and mapNonEmpty!2008 ((_ is ValueCellFull!618) mapValue!2008)) b!35867))

(assert (= (and b!35866 ((_ is ValueCellFull!618) mapDefault!2008)) b!35868))

(assert (= start!4582 b!35866))

(declare-fun m!28831 () Bool)

(assert (=> mapNonEmpty!2008 m!28831))

(declare-fun m!28833 () Bool)

(assert (=> b!35865 m!28833))

(declare-fun m!28835 () Bool)

(assert (=> b!35872 m!28835))

(assert (=> b!35872 m!28835))

(declare-fun m!28837 () Bool)

(assert (=> b!35872 m!28837))

(declare-fun m!28839 () Bool)

(assert (=> b!35870 m!28839))

(declare-fun m!28841 () Bool)

(assert (=> b!35869 m!28841))

(declare-fun m!28843 () Bool)

(assert (=> b!35864 m!28843))

(declare-fun m!28845 () Bool)

(assert (=> b!35871 m!28845))

(declare-fun m!28847 () Bool)

(assert (=> start!4582 m!28847))

(declare-fun m!28849 () Bool)

(assert (=> start!4582 m!28849))

(declare-fun m!28851 () Bool)

(assert (=> start!4582 m!28851))

(check-sat (not b_next!1281) (not start!4582) (not b!35869) (not b!35864) b_and!2109 (not b!35870) (not mapNonEmpty!2008) tp_is_empty!1635 (not b!35871) (not b!35872) (not b!35865))
(check-sat b_and!2109 (not b_next!1281))
(get-model)

(declare-fun d!5349 () Bool)

(declare-fun res!21798 () Bool)

(declare-fun e!22676 () Bool)

(assert (=> d!5349 (=> res!21798 e!22676)))

(assert (=> d!5349 (= res!21798 (= (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5349 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22676)))

(declare-fun b!35907 () Bool)

(declare-fun e!22677 () Bool)

(assert (=> b!35907 (= e!22676 e!22677)))

(declare-fun res!21799 () Bool)

(assert (=> b!35907 (=> (not res!21799) (not e!22677))))

(assert (=> b!35907 (= res!21799 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1289 _keys!1833)))))

(declare-fun b!35908 () Bool)

(assert (=> b!35908 (= e!22677 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5349 (not res!21798)) b!35907))

(assert (= (and b!35907 res!21799) b!35908))

(declare-fun m!28875 () Bool)

(assert (=> d!5349 m!28875))

(declare-fun m!28877 () Bool)

(assert (=> b!35908 m!28877))

(assert (=> b!35871 d!5349))

(declare-fun d!5351 () Bool)

(declare-fun e!22683 () Bool)

(assert (=> d!5351 e!22683))

(declare-fun res!21802 () Bool)

(assert (=> d!5351 (=> res!21802 e!22683)))

(declare-fun lt!13232 () Bool)

(assert (=> d!5351 (= res!21802 (not lt!13232))))

(declare-fun lt!13233 () Bool)

(assert (=> d!5351 (= lt!13232 lt!13233)))

(declare-datatypes ((Unit!792 0))(
  ( (Unit!793) )
))
(declare-fun lt!13231 () Unit!792)

(declare-fun e!22682 () Unit!792)

(assert (=> d!5351 (= lt!13231 e!22682)))

(declare-fun c!4070 () Bool)

(assert (=> d!5351 (= c!4070 lt!13233)))

(declare-fun containsKey!38 (List!949 (_ BitVec 64)) Bool)

(assert (=> d!5351 (= lt!13233 (containsKey!38 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5351 (= (contains!430 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!13232)))

(declare-fun b!35915 () Bool)

(declare-fun lt!13234 () Unit!792)

(assert (=> b!35915 (= e!22682 lt!13234)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!35 (List!949 (_ BitVec 64)) Unit!792)

(assert (=> b!35915 (= lt!13234 (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!80 0))(
  ( (Some!79 (v!1944 V!2005)) (None!78) )
))
(declare-fun isDefined!36 (Option!80) Bool)

(declare-fun getValueByKey!74 (List!949 (_ BitVec 64)) Option!80)

(assert (=> b!35915 (isDefined!36 (getValueByKey!74 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!35916 () Bool)

(declare-fun Unit!794 () Unit!792)

(assert (=> b!35916 (= e!22682 Unit!794)))

(declare-fun b!35917 () Bool)

(assert (=> b!35917 (= e!22683 (isDefined!36 (getValueByKey!74 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5351 c!4070) b!35915))

(assert (= (and d!5351 (not c!4070)) b!35916))

(assert (= (and d!5351 (not res!21802)) b!35917))

(declare-fun m!28879 () Bool)

(assert (=> d!5351 m!28879))

(declare-fun m!28881 () Bool)

(assert (=> b!35915 m!28881))

(declare-fun m!28883 () Bool)

(assert (=> b!35915 m!28883))

(assert (=> b!35915 m!28883))

(declare-fun m!28885 () Bool)

(assert (=> b!35915 m!28885))

(assert (=> b!35917 m!28883))

(assert (=> b!35917 m!28883))

(assert (=> b!35917 m!28885))

(assert (=> b!35872 d!5351))

(declare-fun d!5353 () Bool)

(declare-fun e!22718 () Bool)

(assert (=> d!5353 e!22718))

(declare-fun res!21826 () Bool)

(assert (=> d!5353 (=> (not res!21826) (not e!22718))))

(assert (=> d!5353 (= res!21826 (or (bvsge #b00000000000000000000000000000000 (size!1289 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1289 _keys!1833)))))))

(declare-fun lt!13283 () ListLongMap!931)

(declare-fun lt!13287 () ListLongMap!931)

(assert (=> d!5353 (= lt!13283 lt!13287)))

(declare-fun lt!13289 () Unit!792)

(declare-fun e!22716 () Unit!792)

(assert (=> d!5353 (= lt!13289 e!22716)))

(declare-fun c!4088 () Bool)

(declare-fun e!22720 () Bool)

(assert (=> d!5353 (= c!4088 e!22720)))

(declare-fun res!21823 () Bool)

(assert (=> d!5353 (=> (not res!21823) (not e!22720))))

(assert (=> d!5353 (= res!21823 (bvslt #b00000000000000000000000000000000 (size!1289 _keys!1833)))))

(declare-fun e!22719 () ListLongMap!931)

(assert (=> d!5353 (= lt!13287 e!22719)))

(declare-fun c!4084 () Bool)

(assert (=> d!5353 (= c!4084 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5353 (validMask!0 mask!2294)))

(assert (=> d!5353 (= (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!13283)))

(declare-fun bm!2844 () Bool)

(declare-fun call!2847 () ListLongMap!931)

(declare-fun call!2848 () ListLongMap!931)

(assert (=> bm!2844 (= call!2847 call!2848)))

(declare-fun bm!2845 () Bool)

(declare-fun call!2849 () ListLongMap!931)

(declare-fun call!2852 () ListLongMap!931)

(assert (=> bm!2845 (= call!2849 call!2852)))

(declare-fun b!35960 () Bool)

(declare-fun e!22714 () Bool)

(declare-fun apply!42 (ListLongMap!931 (_ BitVec 64)) V!2005)

(assert (=> b!35960 (= e!22714 (= (apply!42 lt!13283 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!35961 () Bool)

(declare-fun Unit!795 () Unit!792)

(assert (=> b!35961 (= e!22716 Unit!795)))

(declare-fun bm!2846 () Bool)

(declare-fun call!2851 () ListLongMap!931)

(assert (=> bm!2846 (= call!2851 call!2849)))

(declare-fun b!35962 () Bool)

(declare-fun +!60 (ListLongMap!931 tuple2!1354) ListLongMap!931)

(assert (=> b!35962 (= e!22719 (+!60 call!2848 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!35963 () Bool)

(declare-fun e!22715 () ListLongMap!931)

(assert (=> b!35963 (= e!22715 call!2851)))

(declare-fun b!35964 () Bool)

(declare-fun e!22712 () Bool)

(assert (=> b!35964 (= e!22712 (validKeyInArray!0 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35965 () Bool)

(declare-fun c!4083 () Bool)

(assert (=> b!35965 (= c!4083 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!22721 () ListLongMap!931)

(assert (=> b!35965 (= e!22721 e!22715)))

(declare-fun b!35966 () Bool)

(assert (=> b!35966 (= e!22715 call!2847)))

(declare-fun b!35967 () Bool)

(declare-fun e!22711 () Bool)

(assert (=> b!35967 (= e!22711 e!22714)))

(declare-fun res!21821 () Bool)

(declare-fun call!2853 () Bool)

(assert (=> b!35967 (= res!21821 call!2853)))

(assert (=> b!35967 (=> (not res!21821) (not e!22714))))

(declare-fun b!35968 () Bool)

(assert (=> b!35968 (= e!22721 call!2847)))

(declare-fun bm!2847 () Bool)

(assert (=> bm!2847 (= call!2853 (contains!430 lt!13283 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22722 () Bool)

(declare-fun b!35969 () Bool)

(declare-fun get!611 (ValueCell!618 V!2005) V!2005)

(declare-fun dynLambda!159 (Int (_ BitVec 64)) V!2005)

(assert (=> b!35969 (= e!22722 (= (apply!42 lt!13283 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)) (get!611 (select (arr!1187 _values!1501) #b00000000000000000000000000000000) (dynLambda!159 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1288 _values!1501)))))

(assert (=> b!35969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1289 _keys!1833)))))

(declare-fun b!35970 () Bool)

(assert (=> b!35970 (= e!22718 e!22711)))

(declare-fun c!4085 () Bool)

(assert (=> b!35970 (= c!4085 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2848 () Bool)

(declare-fun call!2850 () Bool)

(assert (=> bm!2848 (= call!2850 (contains!430 lt!13283 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35971 () Bool)

(assert (=> b!35971 (= e!22720 (validKeyInArray!0 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35972 () Bool)

(declare-fun e!22717 () Bool)

(declare-fun e!22713 () Bool)

(assert (=> b!35972 (= e!22717 e!22713)))

(declare-fun res!21822 () Bool)

(assert (=> b!35972 (= res!21822 call!2850)))

(assert (=> b!35972 (=> (not res!21822) (not e!22713))))

(declare-fun bm!2849 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!29 (array!2487 array!2485 (_ BitVec 32) (_ BitVec 32) V!2005 V!2005 (_ BitVec 32) Int) ListLongMap!931)

(assert (=> bm!2849 (= call!2852 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35973 () Bool)

(declare-fun res!21829 () Bool)

(assert (=> b!35973 (=> (not res!21829) (not e!22718))))

(declare-fun e!22710 () Bool)

(assert (=> b!35973 (= res!21829 e!22710)))

(declare-fun res!21825 () Bool)

(assert (=> b!35973 (=> res!21825 e!22710)))

(assert (=> b!35973 (= res!21825 (not e!22712))))

(declare-fun res!21828 () Bool)

(assert (=> b!35973 (=> (not res!21828) (not e!22712))))

(assert (=> b!35973 (= res!21828 (bvslt #b00000000000000000000000000000000 (size!1289 _keys!1833)))))

(declare-fun b!35974 () Bool)

(declare-fun res!21827 () Bool)

(assert (=> b!35974 (=> (not res!21827) (not e!22718))))

(assert (=> b!35974 (= res!21827 e!22717)))

(declare-fun c!4087 () Bool)

(assert (=> b!35974 (= c!4087 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!35975 () Bool)

(assert (=> b!35975 (= e!22719 e!22721)))

(declare-fun c!4086 () Bool)

(assert (=> b!35975 (= c!4086 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35976 () Bool)

(assert (=> b!35976 (= e!22711 (not call!2853))))

(declare-fun b!35977 () Bool)

(assert (=> b!35977 (= e!22713 (= (apply!42 lt!13283 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!35978 () Bool)

(assert (=> b!35978 (= e!22710 e!22722)))

(declare-fun res!21824 () Bool)

(assert (=> b!35978 (=> (not res!21824) (not e!22722))))

(assert (=> b!35978 (= res!21824 (contains!430 lt!13283 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35978 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1289 _keys!1833)))))

(declare-fun b!35979 () Bool)

(assert (=> b!35979 (= e!22717 (not call!2850))))

(declare-fun b!35980 () Bool)

(declare-fun lt!13290 () Unit!792)

(assert (=> b!35980 (= e!22716 lt!13290)))

(declare-fun lt!13298 () ListLongMap!931)

(assert (=> b!35980 (= lt!13298 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13291 () (_ BitVec 64))

(assert (=> b!35980 (= lt!13291 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13288 () (_ BitVec 64))

(assert (=> b!35980 (= lt!13288 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13295 () Unit!792)

(declare-fun addStillContains!27 (ListLongMap!931 (_ BitVec 64) V!2005 (_ BitVec 64)) Unit!792)

(assert (=> b!35980 (= lt!13295 (addStillContains!27 lt!13298 lt!13291 zeroValue!1443 lt!13288))))

(assert (=> b!35980 (contains!430 (+!60 lt!13298 (tuple2!1355 lt!13291 zeroValue!1443)) lt!13288)))

(declare-fun lt!13297 () Unit!792)

(assert (=> b!35980 (= lt!13297 lt!13295)))

(declare-fun lt!13293 () ListLongMap!931)

(assert (=> b!35980 (= lt!13293 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13294 () (_ BitVec 64))

(assert (=> b!35980 (= lt!13294 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13296 () (_ BitVec 64))

(assert (=> b!35980 (= lt!13296 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13286 () Unit!792)

(declare-fun addApplyDifferent!27 (ListLongMap!931 (_ BitVec 64) V!2005 (_ BitVec 64)) Unit!792)

(assert (=> b!35980 (= lt!13286 (addApplyDifferent!27 lt!13293 lt!13294 minValue!1443 lt!13296))))

(assert (=> b!35980 (= (apply!42 (+!60 lt!13293 (tuple2!1355 lt!13294 minValue!1443)) lt!13296) (apply!42 lt!13293 lt!13296))))

(declare-fun lt!13300 () Unit!792)

(assert (=> b!35980 (= lt!13300 lt!13286)))

(declare-fun lt!13299 () ListLongMap!931)

(assert (=> b!35980 (= lt!13299 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13280 () (_ BitVec 64))

(assert (=> b!35980 (= lt!13280 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13279 () (_ BitVec 64))

(assert (=> b!35980 (= lt!13279 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13282 () Unit!792)

(assert (=> b!35980 (= lt!13282 (addApplyDifferent!27 lt!13299 lt!13280 zeroValue!1443 lt!13279))))

(assert (=> b!35980 (= (apply!42 (+!60 lt!13299 (tuple2!1355 lt!13280 zeroValue!1443)) lt!13279) (apply!42 lt!13299 lt!13279))))

(declare-fun lt!13281 () Unit!792)

(assert (=> b!35980 (= lt!13281 lt!13282)))

(declare-fun lt!13285 () ListLongMap!931)

(assert (=> b!35980 (= lt!13285 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13284 () (_ BitVec 64))

(assert (=> b!35980 (= lt!13284 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13292 () (_ BitVec 64))

(assert (=> b!35980 (= lt!13292 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35980 (= lt!13290 (addApplyDifferent!27 lt!13285 lt!13284 minValue!1443 lt!13292))))

(assert (=> b!35980 (= (apply!42 (+!60 lt!13285 (tuple2!1355 lt!13284 minValue!1443)) lt!13292) (apply!42 lt!13285 lt!13292))))

(declare-fun bm!2850 () Bool)

(assert (=> bm!2850 (= call!2848 (+!60 (ite c!4084 call!2852 (ite c!4086 call!2849 call!2851)) (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (= (and d!5353 c!4084) b!35962))

(assert (= (and d!5353 (not c!4084)) b!35975))

(assert (= (and b!35975 c!4086) b!35968))

(assert (= (and b!35975 (not c!4086)) b!35965))

(assert (= (and b!35965 c!4083) b!35966))

(assert (= (and b!35965 (not c!4083)) b!35963))

(assert (= (or b!35966 b!35963) bm!2846))

(assert (= (or b!35968 bm!2846) bm!2845))

(assert (= (or b!35968 b!35966) bm!2844))

(assert (= (or b!35962 bm!2845) bm!2849))

(assert (= (or b!35962 bm!2844) bm!2850))

(assert (= (and d!5353 res!21823) b!35971))

(assert (= (and d!5353 c!4088) b!35980))

(assert (= (and d!5353 (not c!4088)) b!35961))

(assert (= (and d!5353 res!21826) b!35973))

(assert (= (and b!35973 res!21828) b!35964))

(assert (= (and b!35973 (not res!21825)) b!35978))

(assert (= (and b!35978 res!21824) b!35969))

(assert (= (and b!35973 res!21829) b!35974))

(assert (= (and b!35974 c!4087) b!35972))

(assert (= (and b!35974 (not c!4087)) b!35979))

(assert (= (and b!35972 res!21822) b!35977))

(assert (= (or b!35972 b!35979) bm!2848))

(assert (= (and b!35974 res!21827) b!35970))

(assert (= (and b!35970 c!4085) b!35967))

(assert (= (and b!35970 (not c!4085)) b!35976))

(assert (= (and b!35967 res!21821) b!35960))

(assert (= (or b!35967 b!35976) bm!2847))

(declare-fun b_lambda!1731 () Bool)

(assert (=> (not b_lambda!1731) (not b!35969)))

(declare-fun t!3662 () Bool)

(declare-fun tb!699 () Bool)

(assert (=> (and start!4582 (= defaultEntry!1504 defaultEntry!1504) t!3662) tb!699))

(declare-fun result!1207 () Bool)

(assert (=> tb!699 (= result!1207 tp_is_empty!1635)))

(assert (=> b!35969 t!3662))

(declare-fun b_and!2113 () Bool)

(assert (= b_and!2109 (and (=> t!3662 result!1207) b_and!2113)))

(declare-fun m!28887 () Bool)

(assert (=> b!35960 m!28887))

(declare-fun m!28889 () Bool)

(assert (=> b!35962 m!28889))

(declare-fun m!28891 () Bool)

(assert (=> b!35977 m!28891))

(assert (=> b!35969 m!28875))

(declare-fun m!28893 () Bool)

(assert (=> b!35969 m!28893))

(assert (=> b!35969 m!28875))

(declare-fun m!28895 () Bool)

(assert (=> b!35969 m!28895))

(assert (=> b!35969 m!28895))

(declare-fun m!28897 () Bool)

(assert (=> b!35969 m!28897))

(declare-fun m!28899 () Bool)

(assert (=> b!35969 m!28899))

(assert (=> b!35969 m!28897))

(declare-fun m!28901 () Bool)

(assert (=> bm!2847 m!28901))

(assert (=> d!5353 m!28847))

(assert (=> b!35964 m!28875))

(assert (=> b!35964 m!28875))

(declare-fun m!28903 () Bool)

(assert (=> b!35964 m!28903))

(declare-fun m!28905 () Bool)

(assert (=> bm!2850 m!28905))

(assert (=> b!35971 m!28875))

(assert (=> b!35971 m!28875))

(assert (=> b!35971 m!28903))

(declare-fun m!28907 () Bool)

(assert (=> bm!2849 m!28907))

(declare-fun m!28909 () Bool)

(assert (=> b!35980 m!28909))

(declare-fun m!28911 () Bool)

(assert (=> b!35980 m!28911))

(declare-fun m!28913 () Bool)

(assert (=> b!35980 m!28913))

(assert (=> b!35980 m!28909))

(declare-fun m!28915 () Bool)

(assert (=> b!35980 m!28915))

(declare-fun m!28917 () Bool)

(assert (=> b!35980 m!28917))

(declare-fun m!28919 () Bool)

(assert (=> b!35980 m!28919))

(assert (=> b!35980 m!28907))

(assert (=> b!35980 m!28875))

(declare-fun m!28921 () Bool)

(assert (=> b!35980 m!28921))

(declare-fun m!28923 () Bool)

(assert (=> b!35980 m!28923))

(declare-fun m!28925 () Bool)

(assert (=> b!35980 m!28925))

(assert (=> b!35980 m!28925))

(declare-fun m!28927 () Bool)

(assert (=> b!35980 m!28927))

(assert (=> b!35980 m!28919))

(declare-fun m!28929 () Bool)

(assert (=> b!35980 m!28929))

(assert (=> b!35980 m!28923))

(declare-fun m!28931 () Bool)

(assert (=> b!35980 m!28931))

(declare-fun m!28933 () Bool)

(assert (=> b!35980 m!28933))

(declare-fun m!28935 () Bool)

(assert (=> b!35980 m!28935))

(declare-fun m!28937 () Bool)

(assert (=> b!35980 m!28937))

(declare-fun m!28939 () Bool)

(assert (=> bm!2848 m!28939))

(assert (=> b!35978 m!28875))

(assert (=> b!35978 m!28875))

(declare-fun m!28941 () Bool)

(assert (=> b!35978 m!28941))

(assert (=> b!35872 d!5353))

(declare-fun d!5355 () Bool)

(assert (=> d!5355 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35869 d!5355))

(declare-fun d!5357 () Bool)

(assert (=> d!5357 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4582 d!5357))

(declare-fun d!5359 () Bool)

(assert (=> d!5359 (= (array_inv!833 _values!1501) (bvsge (size!1288 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4582 d!5359))

(declare-fun d!5361 () Bool)

(assert (=> d!5361 (= (array_inv!834 _keys!1833) (bvsge (size!1289 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4582 d!5361))

(declare-fun b!35995 () Bool)

(declare-fun c!4096 () Bool)

(declare-fun lt!13312 () (_ BitVec 64))

(assert (=> b!35995 (= c!4096 (= lt!13312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22730 () SeekEntryResult!165)

(declare-fun e!22729 () SeekEntryResult!165)

(assert (=> b!35995 (= e!22730 e!22729)))

(declare-fun b!35996 () Bool)

(declare-fun e!22731 () SeekEntryResult!165)

(assert (=> b!35996 (= e!22731 e!22730)))

(declare-fun lt!13311 () SeekEntryResult!165)

(assert (=> b!35996 (= lt!13312 (select (arr!1188 _keys!1833) (index!2784 lt!13311)))))

(declare-fun c!4097 () Bool)

(assert (=> b!35996 (= c!4097 (= lt!13312 k0!1304))))

(declare-fun b!35997 () Bool)

(assert (=> b!35997 (= e!22730 (Found!165 (index!2784 lt!13311)))))

(declare-fun b!35998 () Bool)

(assert (=> b!35998 (= e!22729 (MissingZero!165 (index!2784 lt!13311)))))

(declare-fun d!5363 () Bool)

(declare-fun lt!13309 () SeekEntryResult!165)

(assert (=> d!5363 (and (or ((_ is MissingVacant!165) lt!13309) (not ((_ is Found!165) lt!13309)) (and (bvsge (index!2783 lt!13309) #b00000000000000000000000000000000) (bvslt (index!2783 lt!13309) (size!1289 _keys!1833)))) (not ((_ is MissingVacant!165) lt!13309)) (or (not ((_ is Found!165) lt!13309)) (= (select (arr!1188 _keys!1833) (index!2783 lt!13309)) k0!1304)))))

(assert (=> d!5363 (= lt!13309 e!22731)))

(declare-fun c!4095 () Bool)

(assert (=> d!5363 (= c!4095 (and ((_ is Intermediate!165) lt!13311) (undefined!977 lt!13311)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2487 (_ BitVec 32)) SeekEntryResult!165)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5363 (= lt!13311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5363 (validMask!0 mask!2294)))

(assert (=> d!5363 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!13309)))

(declare-fun b!35999 () Bool)

(declare-fun lt!13310 () SeekEntryResult!165)

(assert (=> b!35999 (= e!22729 (ite ((_ is MissingVacant!165) lt!13310) (MissingZero!165 (index!2785 lt!13310)) lt!13310))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2487 (_ BitVec 32)) SeekEntryResult!165)

(assert (=> b!35999 (= lt!13310 (seekKeyOrZeroReturnVacant!0 (x!7053 lt!13311) (index!2784 lt!13311) (index!2784 lt!13311) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!36000 () Bool)

(assert (=> b!36000 (= e!22731 Undefined!165)))

(assert (= (and d!5363 c!4095) b!36000))

(assert (= (and d!5363 (not c!4095)) b!35996))

(assert (= (and b!35996 c!4097) b!35997))

(assert (= (and b!35996 (not c!4097)) b!35995))

(assert (= (and b!35995 c!4096) b!35998))

(assert (= (and b!35995 (not c!4096)) b!35999))

(declare-fun m!28943 () Bool)

(assert (=> b!35996 m!28943))

(declare-fun m!28945 () Bool)

(assert (=> d!5363 m!28945))

(declare-fun m!28947 () Bool)

(assert (=> d!5363 m!28947))

(assert (=> d!5363 m!28947))

(declare-fun m!28949 () Bool)

(assert (=> d!5363 m!28949))

(assert (=> d!5363 m!28847))

(declare-fun m!28951 () Bool)

(assert (=> b!35999 m!28951))

(assert (=> b!35864 d!5363))

(declare-fun b!36009 () Bool)

(declare-fun e!22738 () Bool)

(declare-fun call!2856 () Bool)

(assert (=> b!36009 (= e!22738 call!2856)))

(declare-fun d!5365 () Bool)

(declare-fun res!21835 () Bool)

(declare-fun e!22740 () Bool)

(assert (=> d!5365 (=> res!21835 e!22740)))

(assert (=> d!5365 (= res!21835 (bvsge #b00000000000000000000000000000000 (size!1289 _keys!1833)))))

(assert (=> d!5365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22740)))

(declare-fun b!36010 () Bool)

(declare-fun e!22739 () Bool)

(assert (=> b!36010 (= e!22739 e!22738)))

(declare-fun lt!13319 () (_ BitVec 64))

(assert (=> b!36010 (= lt!13319 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13321 () Unit!792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2487 (_ BitVec 64) (_ BitVec 32)) Unit!792)

(assert (=> b!36010 (= lt!13321 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13319 #b00000000000000000000000000000000))))

(assert (=> b!36010 (arrayContainsKey!0 _keys!1833 lt!13319 #b00000000000000000000000000000000)))

(declare-fun lt!13320 () Unit!792)

(assert (=> b!36010 (= lt!13320 lt!13321)))

(declare-fun res!21834 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2487 (_ BitVec 32)) SeekEntryResult!165)

(assert (=> b!36010 (= res!21834 (= (seekEntryOrOpen!0 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!165 #b00000000000000000000000000000000)))))

(assert (=> b!36010 (=> (not res!21834) (not e!22738))))

(declare-fun b!36011 () Bool)

(assert (=> b!36011 (= e!22739 call!2856)))

(declare-fun b!36012 () Bool)

(assert (=> b!36012 (= e!22740 e!22739)))

(declare-fun c!4100 () Bool)

(assert (=> b!36012 (= c!4100 (validKeyInArray!0 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2853 () Bool)

(assert (=> bm!2853 (= call!2856 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(assert (= (and d!5365 (not res!21835)) b!36012))

(assert (= (and b!36012 c!4100) b!36010))

(assert (= (and b!36012 (not c!4100)) b!36011))

(assert (= (and b!36010 res!21834) b!36009))

(assert (= (or b!36009 b!36011) bm!2853))

(assert (=> b!36010 m!28875))

(declare-fun m!28953 () Bool)

(assert (=> b!36010 m!28953))

(declare-fun m!28955 () Bool)

(assert (=> b!36010 m!28955))

(assert (=> b!36010 m!28875))

(declare-fun m!28957 () Bool)

(assert (=> b!36010 m!28957))

(assert (=> b!36012 m!28875))

(assert (=> b!36012 m!28875))

(assert (=> b!36012 m!28903))

(declare-fun m!28959 () Bool)

(assert (=> bm!2853 m!28959))

(assert (=> b!35870 d!5365))

(declare-fun b!36023 () Bool)

(declare-fun e!22751 () Bool)

(declare-fun e!22750 () Bool)

(assert (=> b!36023 (= e!22751 e!22750)))

(declare-fun c!4103 () Bool)

(assert (=> b!36023 (= c!4103 (validKeyInArray!0 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2856 () Bool)

(declare-fun call!2859 () Bool)

(assert (=> bm!2856 (= call!2859 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4103 (Cons!944 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) Nil!945) Nil!945)))))

(declare-fun d!5367 () Bool)

(declare-fun res!21844 () Bool)

(declare-fun e!22752 () Bool)

(assert (=> d!5367 (=> res!21844 e!22752)))

(assert (=> d!5367 (= res!21844 (bvsge #b00000000000000000000000000000000 (size!1289 _keys!1833)))))

(assert (=> d!5367 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!945) e!22752)))

(declare-fun b!36024 () Bool)

(assert (=> b!36024 (= e!22750 call!2859)))

(declare-fun b!36025 () Bool)

(assert (=> b!36025 (= e!22752 e!22751)))

(declare-fun res!21843 () Bool)

(assert (=> b!36025 (=> (not res!21843) (not e!22751))))

(declare-fun e!22749 () Bool)

(assert (=> b!36025 (= res!21843 (not e!22749))))

(declare-fun res!21842 () Bool)

(assert (=> b!36025 (=> (not res!21842) (not e!22749))))

(assert (=> b!36025 (= res!21842 (validKeyInArray!0 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36026 () Bool)

(declare-fun contains!431 (List!948 (_ BitVec 64)) Bool)

(assert (=> b!36026 (= e!22749 (contains!431 Nil!945 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36027 () Bool)

(assert (=> b!36027 (= e!22750 call!2859)))

(assert (= (and d!5367 (not res!21844)) b!36025))

(assert (= (and b!36025 res!21842) b!36026))

(assert (= (and b!36025 res!21843) b!36023))

(assert (= (and b!36023 c!4103) b!36024))

(assert (= (and b!36023 (not c!4103)) b!36027))

(assert (= (or b!36024 b!36027) bm!2856))

(assert (=> b!36023 m!28875))

(assert (=> b!36023 m!28875))

(assert (=> b!36023 m!28903))

(assert (=> bm!2856 m!28875))

(declare-fun m!28961 () Bool)

(assert (=> bm!2856 m!28961))

(assert (=> b!36025 m!28875))

(assert (=> b!36025 m!28875))

(assert (=> b!36025 m!28903))

(assert (=> b!36026 m!28875))

(assert (=> b!36026 m!28875))

(declare-fun m!28963 () Bool)

(assert (=> b!36026 m!28963))

(assert (=> b!35865 d!5367))

(declare-fun b!36035 () Bool)

(declare-fun e!22757 () Bool)

(assert (=> b!36035 (= e!22757 tp_is_empty!1635)))

(declare-fun condMapEmpty!2014 () Bool)

(declare-fun mapDefault!2014 () ValueCell!618)

(assert (=> mapNonEmpty!2008 (= condMapEmpty!2014 (= mapRest!2008 ((as const (Array (_ BitVec 32) ValueCell!618)) mapDefault!2014)))))

(declare-fun mapRes!2014 () Bool)

(assert (=> mapNonEmpty!2008 (= tp!5289 (and e!22757 mapRes!2014))))

(declare-fun b!36034 () Bool)

(declare-fun e!22758 () Bool)

(assert (=> b!36034 (= e!22758 tp_is_empty!1635)))

(declare-fun mapNonEmpty!2014 () Bool)

(declare-fun tp!5299 () Bool)

(assert (=> mapNonEmpty!2014 (= mapRes!2014 (and tp!5299 e!22758))))

(declare-fun mapKey!2014 () (_ BitVec 32))

(declare-fun mapValue!2014 () ValueCell!618)

(declare-fun mapRest!2014 () (Array (_ BitVec 32) ValueCell!618))

(assert (=> mapNonEmpty!2014 (= mapRest!2008 (store mapRest!2014 mapKey!2014 mapValue!2014))))

(declare-fun mapIsEmpty!2014 () Bool)

(assert (=> mapIsEmpty!2014 mapRes!2014))

(assert (= (and mapNonEmpty!2008 condMapEmpty!2014) mapIsEmpty!2014))

(assert (= (and mapNonEmpty!2008 (not condMapEmpty!2014)) mapNonEmpty!2014))

(assert (= (and mapNonEmpty!2014 ((_ is ValueCellFull!618) mapValue!2014)) b!36034))

(assert (= (and mapNonEmpty!2008 ((_ is ValueCellFull!618) mapDefault!2014)) b!36035))

(declare-fun m!28965 () Bool)

(assert (=> mapNonEmpty!2014 m!28965))

(declare-fun b_lambda!1733 () Bool)

(assert (= b_lambda!1731 (or (and start!4582 b_free!1281) b_lambda!1733)))

(check-sat (not b!35960) (not b!36026) (not mapNonEmpty!2014) (not b_next!1281) (not b!36023) (not b!35969) (not b!35908) (not b!35964) b_and!2113 (not bm!2853) (not b!35962) (not bm!2849) (not d!5351) (not b!36012) (not d!5363) (not d!5353) (not b!35917) (not bm!2848) (not b!35978) (not bm!2850) (not b!35915) (not b!35977) (not b!35999) tp_is_empty!1635 (not b!36025) (not b!35971) (not b!36010) (not b!35980) (not bm!2856) (not b_lambda!1733) (not bm!2847))
(check-sat b_and!2113 (not b_next!1281))
(get-model)

(declare-fun d!5369 () Bool)

(assert (=> d!5369 (arrayContainsKey!0 _keys!1833 lt!13319 #b00000000000000000000000000000000)))

(declare-fun lt!13324 () Unit!792)

(declare-fun choose!13 (array!2487 (_ BitVec 64) (_ BitVec 32)) Unit!792)

(assert (=> d!5369 (= lt!13324 (choose!13 _keys!1833 lt!13319 #b00000000000000000000000000000000))))

(assert (=> d!5369 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!5369 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13319 #b00000000000000000000000000000000) lt!13324)))

(declare-fun bs!1361 () Bool)

(assert (= bs!1361 d!5369))

(assert (=> bs!1361 m!28955))

(declare-fun m!28967 () Bool)

(assert (=> bs!1361 m!28967))

(assert (=> b!36010 d!5369))

(declare-fun d!5371 () Bool)

(declare-fun res!21845 () Bool)

(declare-fun e!22759 () Bool)

(assert (=> d!5371 (=> res!21845 e!22759)))

(assert (=> d!5371 (= res!21845 (= (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) lt!13319))))

(assert (=> d!5371 (= (arrayContainsKey!0 _keys!1833 lt!13319 #b00000000000000000000000000000000) e!22759)))

(declare-fun b!36036 () Bool)

(declare-fun e!22760 () Bool)

(assert (=> b!36036 (= e!22759 e!22760)))

(declare-fun res!21846 () Bool)

(assert (=> b!36036 (=> (not res!21846) (not e!22760))))

(assert (=> b!36036 (= res!21846 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1289 _keys!1833)))))

(declare-fun b!36037 () Bool)

(assert (=> b!36037 (= e!22760 (arrayContainsKey!0 _keys!1833 lt!13319 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5371 (not res!21845)) b!36036))

(assert (= (and b!36036 res!21846) b!36037))

(assert (=> d!5371 m!28875))

(declare-fun m!28969 () Bool)

(assert (=> b!36037 m!28969))

(assert (=> b!36010 d!5371))

(declare-fun d!5373 () Bool)

(declare-fun lt!13333 () SeekEntryResult!165)

(assert (=> d!5373 (and (or ((_ is Undefined!165) lt!13333) (not ((_ is Found!165) lt!13333)) (and (bvsge (index!2783 lt!13333) #b00000000000000000000000000000000) (bvslt (index!2783 lt!13333) (size!1289 _keys!1833)))) (or ((_ is Undefined!165) lt!13333) ((_ is Found!165) lt!13333) (not ((_ is MissingZero!165) lt!13333)) (and (bvsge (index!2782 lt!13333) #b00000000000000000000000000000000) (bvslt (index!2782 lt!13333) (size!1289 _keys!1833)))) (or ((_ is Undefined!165) lt!13333) ((_ is Found!165) lt!13333) ((_ is MissingZero!165) lt!13333) (not ((_ is MissingVacant!165) lt!13333)) (and (bvsge (index!2785 lt!13333) #b00000000000000000000000000000000) (bvslt (index!2785 lt!13333) (size!1289 _keys!1833)))) (or ((_ is Undefined!165) lt!13333) (ite ((_ is Found!165) lt!13333) (= (select (arr!1188 _keys!1833) (index!2783 lt!13333)) (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!165) lt!13333) (= (select (arr!1188 _keys!1833) (index!2782 lt!13333)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!165) lt!13333) (= (select (arr!1188 _keys!1833) (index!2785 lt!13333)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!22767 () SeekEntryResult!165)

(assert (=> d!5373 (= lt!13333 e!22767)))

(declare-fun c!4110 () Bool)

(declare-fun lt!13331 () SeekEntryResult!165)

(assert (=> d!5373 (= c!4110 (and ((_ is Intermediate!165) lt!13331) (undefined!977 lt!13331)))))

(assert (=> d!5373 (= lt!13331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) mask!2294) (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294))))

(assert (=> d!5373 (validMask!0 mask!2294)))

(assert (=> d!5373 (= (seekEntryOrOpen!0 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) lt!13333)))

(declare-fun b!36050 () Bool)

(assert (=> b!36050 (= e!22767 Undefined!165)))

(declare-fun b!36051 () Bool)

(declare-fun e!22768 () SeekEntryResult!165)

(assert (=> b!36051 (= e!22768 (MissingZero!165 (index!2784 lt!13331)))))

(declare-fun b!36052 () Bool)

(assert (=> b!36052 (= e!22768 (seekKeyOrZeroReturnVacant!0 (x!7053 lt!13331) (index!2784 lt!13331) (index!2784 lt!13331) (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294))))

(declare-fun b!36053 () Bool)

(declare-fun e!22769 () SeekEntryResult!165)

(assert (=> b!36053 (= e!22767 e!22769)))

(declare-fun lt!13332 () (_ BitVec 64))

(assert (=> b!36053 (= lt!13332 (select (arr!1188 _keys!1833) (index!2784 lt!13331)))))

(declare-fun c!4111 () Bool)

(assert (=> b!36053 (= c!4111 (= lt!13332 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36054 () Bool)

(declare-fun c!4112 () Bool)

(assert (=> b!36054 (= c!4112 (= lt!13332 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!36054 (= e!22769 e!22768)))

(declare-fun b!36055 () Bool)

(assert (=> b!36055 (= e!22769 (Found!165 (index!2784 lt!13331)))))

(assert (= (and d!5373 c!4110) b!36050))

(assert (= (and d!5373 (not c!4110)) b!36053))

(assert (= (and b!36053 c!4111) b!36055))

(assert (= (and b!36053 (not c!4111)) b!36054))

(assert (= (and b!36054 c!4112) b!36051))

(assert (= (and b!36054 (not c!4112)) b!36052))

(declare-fun m!28971 () Bool)

(assert (=> d!5373 m!28971))

(declare-fun m!28973 () Bool)

(assert (=> d!5373 m!28973))

(declare-fun m!28975 () Bool)

(assert (=> d!5373 m!28975))

(assert (=> d!5373 m!28875))

(declare-fun m!28977 () Bool)

(assert (=> d!5373 m!28977))

(assert (=> d!5373 m!28847))

(declare-fun m!28979 () Bool)

(assert (=> d!5373 m!28979))

(assert (=> d!5373 m!28875))

(assert (=> d!5373 m!28975))

(assert (=> b!36052 m!28875))

(declare-fun m!28981 () Bool)

(assert (=> b!36052 m!28981))

(declare-fun m!28983 () Bool)

(assert (=> b!36053 m!28983))

(assert (=> b!36010 d!5373))

(declare-fun d!5375 () Bool)

(declare-fun e!22771 () Bool)

(assert (=> d!5375 e!22771))

(declare-fun res!21847 () Bool)

(assert (=> d!5375 (=> res!21847 e!22771)))

(declare-fun lt!13335 () Bool)

(assert (=> d!5375 (= res!21847 (not lt!13335))))

(declare-fun lt!13336 () Bool)

(assert (=> d!5375 (= lt!13335 lt!13336)))

(declare-fun lt!13334 () Unit!792)

(declare-fun e!22770 () Unit!792)

(assert (=> d!5375 (= lt!13334 e!22770)))

(declare-fun c!4113 () Bool)

(assert (=> d!5375 (= c!4113 lt!13336)))

(assert (=> d!5375 (= lt!13336 (containsKey!38 (toList!481 lt!13283) (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> d!5375 (= (contains!430 lt!13283 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)) lt!13335)))

(declare-fun b!36056 () Bool)

(declare-fun lt!13337 () Unit!792)

(assert (=> b!36056 (= e!22770 lt!13337)))

(assert (=> b!36056 (= lt!13337 (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!481 lt!13283) (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!36056 (isDefined!36 (getValueByKey!74 (toList!481 lt!13283) (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36057 () Bool)

(declare-fun Unit!796 () Unit!792)

(assert (=> b!36057 (= e!22770 Unit!796)))

(declare-fun b!36058 () Bool)

(assert (=> b!36058 (= e!22771 (isDefined!36 (getValueByKey!74 (toList!481 lt!13283) (select (arr!1188 _keys!1833) #b00000000000000000000000000000000))))))

(assert (= (and d!5375 c!4113) b!36056))

(assert (= (and d!5375 (not c!4113)) b!36057))

(assert (= (and d!5375 (not res!21847)) b!36058))

(assert (=> d!5375 m!28875))

(declare-fun m!28985 () Bool)

(assert (=> d!5375 m!28985))

(assert (=> b!36056 m!28875))

(declare-fun m!28987 () Bool)

(assert (=> b!36056 m!28987))

(assert (=> b!36056 m!28875))

(declare-fun m!28989 () Bool)

(assert (=> b!36056 m!28989))

(assert (=> b!36056 m!28989))

(declare-fun m!28991 () Bool)

(assert (=> b!36056 m!28991))

(assert (=> b!36058 m!28875))

(assert (=> b!36058 m!28989))

(assert (=> b!36058 m!28989))

(assert (=> b!36058 m!28991))

(assert (=> b!35978 d!5375))

(declare-fun b!36059 () Bool)

(declare-fun e!22772 () Bool)

(declare-fun call!2860 () Bool)

(assert (=> b!36059 (= e!22772 call!2860)))

(declare-fun d!5377 () Bool)

(declare-fun res!21849 () Bool)

(declare-fun e!22774 () Bool)

(assert (=> d!5377 (=> res!21849 e!22774)))

(assert (=> d!5377 (= res!21849 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1289 _keys!1833)))))

(assert (=> d!5377 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294) e!22774)))

(declare-fun b!36060 () Bool)

(declare-fun e!22773 () Bool)

(assert (=> b!36060 (= e!22773 e!22772)))

(declare-fun lt!13338 () (_ BitVec 64))

(assert (=> b!36060 (= lt!13338 (select (arr!1188 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!13340 () Unit!792)

(assert (=> b!36060 (= lt!13340 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13338 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!36060 (arrayContainsKey!0 _keys!1833 lt!13338 #b00000000000000000000000000000000)))

(declare-fun lt!13339 () Unit!792)

(assert (=> b!36060 (= lt!13339 lt!13340)))

(declare-fun res!21848 () Bool)

(assert (=> b!36060 (= res!21848 (= (seekEntryOrOpen!0 (select (arr!1188 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1833 mask!2294) (Found!165 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!36060 (=> (not res!21848) (not e!22772))))

(declare-fun b!36061 () Bool)

(assert (=> b!36061 (= e!22773 call!2860)))

(declare-fun b!36062 () Bool)

(assert (=> b!36062 (= e!22774 e!22773)))

(declare-fun c!4114 () Bool)

(assert (=> b!36062 (= c!4114 (validKeyInArray!0 (select (arr!1188 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2857 () Bool)

(assert (=> bm!2857 (= call!2860 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(assert (= (and d!5377 (not res!21849)) b!36062))

(assert (= (and b!36062 c!4114) b!36060))

(assert (= (and b!36062 (not c!4114)) b!36061))

(assert (= (and b!36060 res!21848) b!36059))

(assert (= (or b!36059 b!36061) bm!2857))

(declare-fun m!28993 () Bool)

(assert (=> b!36060 m!28993))

(declare-fun m!28995 () Bool)

(assert (=> b!36060 m!28995))

(declare-fun m!28997 () Bool)

(assert (=> b!36060 m!28997))

(assert (=> b!36060 m!28993))

(declare-fun m!28999 () Bool)

(assert (=> b!36060 m!28999))

(assert (=> b!36062 m!28993))

(assert (=> b!36062 m!28993))

(declare-fun m!29001 () Bool)

(assert (=> b!36062 m!29001))

(declare-fun m!29003 () Bool)

(assert (=> bm!2857 m!29003))

(assert (=> bm!2853 d!5377))

(declare-fun d!5379 () Bool)

(declare-fun get!612 (Option!80) V!2005)

(assert (=> d!5379 (= (apply!42 lt!13283 #b1000000000000000000000000000000000000000000000000000000000000000) (get!612 (getValueByKey!74 (toList!481 lt!13283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1362 () Bool)

(assert (= bs!1362 d!5379))

(declare-fun m!29005 () Bool)

(assert (=> bs!1362 m!29005))

(assert (=> bs!1362 m!29005))

(declare-fun m!29007 () Bool)

(assert (=> bs!1362 m!29007))

(assert (=> b!35960 d!5379))

(declare-fun d!5381 () Bool)

(assert (=> d!5381 (= (apply!42 lt!13283 #b0000000000000000000000000000000000000000000000000000000000000000) (get!612 (getValueByKey!74 (toList!481 lt!13283) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1363 () Bool)

(assert (= bs!1363 d!5381))

(declare-fun m!29009 () Bool)

(assert (=> bs!1363 m!29009))

(assert (=> bs!1363 m!29009))

(declare-fun m!29011 () Bool)

(assert (=> bs!1363 m!29011))

(assert (=> b!35977 d!5381))

(declare-fun d!5383 () Bool)

(assert (=> d!5383 (= (validKeyInArray!0 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)) (and (not (= (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!36012 d!5383))

(assert (=> b!35971 d!5383))

(declare-fun b!36063 () Bool)

(declare-fun e!22777 () Bool)

(declare-fun e!22776 () Bool)

(assert (=> b!36063 (= e!22777 e!22776)))

(declare-fun c!4115 () Bool)

(assert (=> b!36063 (= c!4115 (validKeyInArray!0 (select (arr!1188 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2858 () Bool)

(declare-fun call!2861 () Bool)

(assert (=> bm!2858 (= call!2861 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4115 (Cons!944 (select (arr!1188 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4103 (Cons!944 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) Nil!945) Nil!945)) (ite c!4103 (Cons!944 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) Nil!945) Nil!945))))))

(declare-fun d!5385 () Bool)

(declare-fun res!21852 () Bool)

(declare-fun e!22778 () Bool)

(assert (=> d!5385 (=> res!21852 e!22778)))

(assert (=> d!5385 (= res!21852 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1289 _keys!1833)))))

(assert (=> d!5385 (= (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4103 (Cons!944 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) Nil!945) Nil!945)) e!22778)))

(declare-fun b!36064 () Bool)

(assert (=> b!36064 (= e!22776 call!2861)))

(declare-fun b!36065 () Bool)

(assert (=> b!36065 (= e!22778 e!22777)))

(declare-fun res!21851 () Bool)

(assert (=> b!36065 (=> (not res!21851) (not e!22777))))

(declare-fun e!22775 () Bool)

(assert (=> b!36065 (= res!21851 (not e!22775))))

(declare-fun res!21850 () Bool)

(assert (=> b!36065 (=> (not res!21850) (not e!22775))))

(assert (=> b!36065 (= res!21850 (validKeyInArray!0 (select (arr!1188 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!36066 () Bool)

(assert (=> b!36066 (= e!22775 (contains!431 (ite c!4103 (Cons!944 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) Nil!945) Nil!945) (select (arr!1188 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!36067 () Bool)

(assert (=> b!36067 (= e!22776 call!2861)))

(assert (= (and d!5385 (not res!21852)) b!36065))

(assert (= (and b!36065 res!21850) b!36066))

(assert (= (and b!36065 res!21851) b!36063))

(assert (= (and b!36063 c!4115) b!36064))

(assert (= (and b!36063 (not c!4115)) b!36067))

(assert (= (or b!36064 b!36067) bm!2858))

(assert (=> b!36063 m!28993))

(assert (=> b!36063 m!28993))

(assert (=> b!36063 m!29001))

(assert (=> bm!2858 m!28993))

(declare-fun m!29013 () Bool)

(assert (=> bm!2858 m!29013))

(assert (=> b!36065 m!28993))

(assert (=> b!36065 m!28993))

(assert (=> b!36065 m!29001))

(assert (=> b!36066 m!28993))

(assert (=> b!36066 m!28993))

(declare-fun m!29015 () Bool)

(assert (=> b!36066 m!29015))

(assert (=> bm!2856 d!5385))

(declare-fun d!5387 () Bool)

(declare-fun e!22780 () Bool)

(assert (=> d!5387 e!22780))

(declare-fun res!21853 () Bool)

(assert (=> d!5387 (=> res!21853 e!22780)))

(declare-fun lt!13342 () Bool)

(assert (=> d!5387 (= res!21853 (not lt!13342))))

(declare-fun lt!13343 () Bool)

(assert (=> d!5387 (= lt!13342 lt!13343)))

(declare-fun lt!13341 () Unit!792)

(declare-fun e!22779 () Unit!792)

(assert (=> d!5387 (= lt!13341 e!22779)))

(declare-fun c!4116 () Bool)

(assert (=> d!5387 (= c!4116 lt!13343)))

(assert (=> d!5387 (= lt!13343 (containsKey!38 (toList!481 lt!13283) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!5387 (= (contains!430 lt!13283 #b0000000000000000000000000000000000000000000000000000000000000000) lt!13342)))

(declare-fun b!36068 () Bool)

(declare-fun lt!13344 () Unit!792)

(assert (=> b!36068 (= e!22779 lt!13344)))

(assert (=> b!36068 (= lt!13344 (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!481 lt!13283) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!36068 (isDefined!36 (getValueByKey!74 (toList!481 lt!13283) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!36069 () Bool)

(declare-fun Unit!797 () Unit!792)

(assert (=> b!36069 (= e!22779 Unit!797)))

(declare-fun b!36070 () Bool)

(assert (=> b!36070 (= e!22780 (isDefined!36 (getValueByKey!74 (toList!481 lt!13283) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!5387 c!4116) b!36068))

(assert (= (and d!5387 (not c!4116)) b!36069))

(assert (= (and d!5387 (not res!21853)) b!36070))

(declare-fun m!29017 () Bool)

(assert (=> d!5387 m!29017))

(declare-fun m!29019 () Bool)

(assert (=> b!36068 m!29019))

(assert (=> b!36068 m!29009))

(assert (=> b!36068 m!29009))

(declare-fun m!29021 () Bool)

(assert (=> b!36068 m!29021))

(assert (=> b!36070 m!29009))

(assert (=> b!36070 m!29009))

(assert (=> b!36070 m!29021))

(assert (=> bm!2848 d!5387))

(assert (=> b!36023 d!5383))

(declare-fun b!36089 () Bool)

(declare-fun e!22792 () SeekEntryResult!165)

(declare-fun e!22793 () SeekEntryResult!165)

(assert (=> b!36089 (= e!22792 e!22793)))

(declare-fun c!4123 () Bool)

(declare-fun lt!13349 () (_ BitVec 64))

(assert (=> b!36089 (= c!4123 (or (= lt!13349 k0!1304) (= (bvadd lt!13349 lt!13349) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!36091 () Bool)

(declare-fun lt!13350 () SeekEntryResult!165)

(assert (=> b!36091 (and (bvsge (index!2784 lt!13350) #b00000000000000000000000000000000) (bvslt (index!2784 lt!13350) (size!1289 _keys!1833)))))

(declare-fun res!21861 () Bool)

(assert (=> b!36091 (= res!21861 (= (select (arr!1188 _keys!1833) (index!2784 lt!13350)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22795 () Bool)

(assert (=> b!36091 (=> res!21861 e!22795)))

(declare-fun b!36092 () Bool)

(assert (=> b!36092 (= e!22792 (Intermediate!165 true (toIndex!0 k0!1304 mask!2294) #b00000000000000000000000000000000))))

(declare-fun b!36093 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!36093 (= e!22793 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!1304 mask!2294) #b00000000000000000000000000000000 mask!2294) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!36094 () Bool)

(declare-fun e!22791 () Bool)

(assert (=> b!36094 (= e!22791 (bvsge (x!7053 lt!13350) #b01111111111111111111111111111110))))

(declare-fun b!36095 () Bool)

(assert (=> b!36095 (= e!22793 (Intermediate!165 false (toIndex!0 k0!1304 mask!2294) #b00000000000000000000000000000000))))

(declare-fun d!5389 () Bool)

(assert (=> d!5389 e!22791))

(declare-fun c!4124 () Bool)

(assert (=> d!5389 (= c!4124 (and ((_ is Intermediate!165) lt!13350) (undefined!977 lt!13350)))))

(assert (=> d!5389 (= lt!13350 e!22792)))

(declare-fun c!4125 () Bool)

(assert (=> d!5389 (= c!4125 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!5389 (= lt!13349 (select (arr!1188 _keys!1833) (toIndex!0 k0!1304 mask!2294)))))

(assert (=> d!5389 (validMask!0 mask!2294)))

(assert (=> d!5389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294) lt!13350)))

(declare-fun b!36090 () Bool)

(assert (=> b!36090 (and (bvsge (index!2784 lt!13350) #b00000000000000000000000000000000) (bvslt (index!2784 lt!13350) (size!1289 _keys!1833)))))

(declare-fun res!21862 () Bool)

(assert (=> b!36090 (= res!21862 (= (select (arr!1188 _keys!1833) (index!2784 lt!13350)) k0!1304))))

(assert (=> b!36090 (=> res!21862 e!22795)))

(declare-fun e!22794 () Bool)

(assert (=> b!36090 (= e!22794 e!22795)))

(declare-fun b!36096 () Bool)

(assert (=> b!36096 (= e!22791 e!22794)))

(declare-fun res!21860 () Bool)

(assert (=> b!36096 (= res!21860 (and ((_ is Intermediate!165) lt!13350) (not (undefined!977 lt!13350)) (bvslt (x!7053 lt!13350) #b01111111111111111111111111111110) (bvsge (x!7053 lt!13350) #b00000000000000000000000000000000) (bvsge (x!7053 lt!13350) #b00000000000000000000000000000000)))))

(assert (=> b!36096 (=> (not res!21860) (not e!22794))))

(declare-fun b!36097 () Bool)

(assert (=> b!36097 (and (bvsge (index!2784 lt!13350) #b00000000000000000000000000000000) (bvslt (index!2784 lt!13350) (size!1289 _keys!1833)))))

(assert (=> b!36097 (= e!22795 (= (select (arr!1188 _keys!1833) (index!2784 lt!13350)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!5389 c!4125) b!36092))

(assert (= (and d!5389 (not c!4125)) b!36089))

(assert (= (and b!36089 c!4123) b!36095))

(assert (= (and b!36089 (not c!4123)) b!36093))

(assert (= (and d!5389 c!4124) b!36094))

(assert (= (and d!5389 (not c!4124)) b!36096))

(assert (= (and b!36096 res!21860) b!36090))

(assert (= (and b!36090 (not res!21862)) b!36091))

(assert (= (and b!36091 (not res!21861)) b!36097))

(declare-fun m!29023 () Bool)

(assert (=> b!36090 m!29023))

(assert (=> d!5389 m!28947))

(declare-fun m!29025 () Bool)

(assert (=> d!5389 m!29025))

(assert (=> d!5389 m!28847))

(assert (=> b!36091 m!29023))

(assert (=> b!36093 m!28947))

(declare-fun m!29027 () Bool)

(assert (=> b!36093 m!29027))

(assert (=> b!36093 m!29027))

(declare-fun m!29029 () Bool)

(assert (=> b!36093 m!29029))

(assert (=> b!36097 m!29023))

(assert (=> d!5363 d!5389))

(declare-fun d!5391 () Bool)

(declare-fun lt!13356 () (_ BitVec 32))

(declare-fun lt!13355 () (_ BitVec 32))

(assert (=> d!5391 (= lt!13356 (bvmul (bvxor lt!13355 (bvlshr lt!13355 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!5391 (= lt!13355 ((_ extract 31 0) (bvand (bvxor k0!1304 (bvlshr k0!1304 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!5391 (and (bvsge mask!2294 #b00000000000000000000000000000000) (let ((res!21863 (let ((h!1513 ((_ extract 31 0) (bvand (bvxor k0!1304 (bvlshr k0!1304 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7069 (bvmul (bvxor h!1513 (bvlshr h!1513 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7069 (bvlshr x!7069 #b00000000000000000000000000001101)) mask!2294))))) (and (bvslt res!21863 (bvadd mask!2294 #b00000000000000000000000000000001)) (bvsge res!21863 #b00000000000000000000000000000000))))))

(assert (=> d!5391 (= (toIndex!0 k0!1304 mask!2294) (bvand (bvxor lt!13356 (bvlshr lt!13356 #b00000000000000000000000000001101)) mask!2294))))

(assert (=> d!5363 d!5391))

(assert (=> d!5363 d!5357))

(declare-fun d!5393 () Bool)

(declare-fun lt!13359 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!18 (List!948) (InoxSet (_ BitVec 64)))

(assert (=> d!5393 (= lt!13359 (select (content!18 Nil!945) (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun e!22800 () Bool)

(assert (=> d!5393 (= lt!13359 e!22800)))

(declare-fun res!21868 () Bool)

(assert (=> d!5393 (=> (not res!21868) (not e!22800))))

(assert (=> d!5393 (= res!21868 ((_ is Cons!944) Nil!945))))

(assert (=> d!5393 (= (contains!431 Nil!945 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)) lt!13359)))

(declare-fun b!36102 () Bool)

(declare-fun e!22801 () Bool)

(assert (=> b!36102 (= e!22800 e!22801)))

(declare-fun res!21869 () Bool)

(assert (=> b!36102 (=> res!21869 e!22801)))

(assert (=> b!36102 (= res!21869 (= (h!1511 Nil!945) (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36103 () Bool)

(assert (=> b!36103 (= e!22801 (contains!431 (t!3659 Nil!945) (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5393 res!21868) b!36102))

(assert (= (and b!36102 (not res!21869)) b!36103))

(declare-fun m!29031 () Bool)

(assert (=> d!5393 m!29031))

(assert (=> d!5393 m!28875))

(declare-fun m!29033 () Bool)

(assert (=> d!5393 m!29033))

(assert (=> b!36103 m!28875))

(declare-fun m!29035 () Bool)

(assert (=> b!36103 m!29035))

(assert (=> b!36026 d!5393))

(declare-fun b!36128 () Bool)

(declare-fun e!22821 () Bool)

(assert (=> b!36128 (= e!22821 (validKeyInArray!0 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!36128 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!36129 () Bool)

(declare-fun e!22822 () ListLongMap!931)

(assert (=> b!36129 (= e!22822 (ListLongMap!932 Nil!946))))

(declare-fun b!36130 () Bool)

(assert (=> b!36130 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1289 _keys!1833)))))

(assert (=> b!36130 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1288 _values!1501)))))

(declare-fun lt!13379 () ListLongMap!931)

(declare-fun e!22816 () Bool)

(assert (=> b!36130 (= e!22816 (= (apply!42 lt!13379 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)) (get!611 (select (arr!1187 _values!1501) #b00000000000000000000000000000000) (dynLambda!159 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!2864 () ListLongMap!931)

(declare-fun bm!2861 () Bool)

(assert (=> bm!2861 (= call!2864 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1504))))

(declare-fun b!36131 () Bool)

(declare-fun res!21881 () Bool)

(declare-fun e!22818 () Bool)

(assert (=> b!36131 (=> (not res!21881) (not e!22818))))

(assert (=> b!36131 (= res!21881 (not (contains!430 lt!13379 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!36132 () Bool)

(declare-fun e!22820 () Bool)

(assert (=> b!36132 (= e!22818 e!22820)))

(declare-fun c!4137 () Bool)

(assert (=> b!36132 (= c!4137 e!22821)))

(declare-fun res!21880 () Bool)

(assert (=> b!36132 (=> (not res!21880) (not e!22821))))

(assert (=> b!36132 (= res!21880 (bvslt #b00000000000000000000000000000000 (size!1289 _keys!1833)))))

(declare-fun b!36133 () Bool)

(declare-fun e!22817 () Bool)

(assert (=> b!36133 (= e!22820 e!22817)))

(declare-fun c!4135 () Bool)

(assert (=> b!36133 (= c!4135 (bvslt #b00000000000000000000000000000000 (size!1289 _keys!1833)))))

(declare-fun b!36134 () Bool)

(assert (=> b!36134 (= e!22817 (= lt!13379 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1504)))))

(declare-fun d!5395 () Bool)

(assert (=> d!5395 e!22818))

(declare-fun res!21878 () Bool)

(assert (=> d!5395 (=> (not res!21878) (not e!22818))))

(assert (=> d!5395 (= res!21878 (not (contains!430 lt!13379 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5395 (= lt!13379 e!22822)))

(declare-fun c!4134 () Bool)

(assert (=> d!5395 (= c!4134 (bvsge #b00000000000000000000000000000000 (size!1289 _keys!1833)))))

(assert (=> d!5395 (validMask!0 mask!2294)))

(assert (=> d!5395 (= (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!13379)))

(declare-fun b!36135 () Bool)

(assert (=> b!36135 (= e!22820 e!22816)))

(assert (=> b!36135 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1289 _keys!1833)))))

(declare-fun res!21879 () Bool)

(assert (=> b!36135 (= res!21879 (contains!430 lt!13379 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!36135 (=> (not res!21879) (not e!22816))))

(declare-fun b!36136 () Bool)

(declare-fun lt!13374 () Unit!792)

(declare-fun lt!13378 () Unit!792)

(assert (=> b!36136 (= lt!13374 lt!13378)))

(declare-fun lt!13376 () ListLongMap!931)

(declare-fun lt!13380 () (_ BitVec 64))

(declare-fun lt!13375 () V!2005)

(declare-fun lt!13377 () (_ BitVec 64))

(assert (=> b!36136 (not (contains!430 (+!60 lt!13376 (tuple2!1355 lt!13380 lt!13375)) lt!13377))))

(declare-fun addStillNotContains!3 (ListLongMap!931 (_ BitVec 64) V!2005 (_ BitVec 64)) Unit!792)

(assert (=> b!36136 (= lt!13378 (addStillNotContains!3 lt!13376 lt!13380 lt!13375 lt!13377))))

(assert (=> b!36136 (= lt!13377 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!36136 (= lt!13375 (get!611 (select (arr!1187 _values!1501) #b00000000000000000000000000000000) (dynLambda!159 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36136 (= lt!13380 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!36136 (= lt!13376 call!2864)))

(declare-fun e!22819 () ListLongMap!931)

(assert (=> b!36136 (= e!22819 (+!60 call!2864 (tuple2!1355 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000) (get!611 (select (arr!1187 _values!1501) #b00000000000000000000000000000000) (dynLambda!159 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!36137 () Bool)

(declare-fun isEmpty!174 (ListLongMap!931) Bool)

(assert (=> b!36137 (= e!22817 (isEmpty!174 lt!13379))))

(declare-fun b!36138 () Bool)

(assert (=> b!36138 (= e!22822 e!22819)))

(declare-fun c!4136 () Bool)

(assert (=> b!36138 (= c!4136 (validKeyInArray!0 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36139 () Bool)

(assert (=> b!36139 (= e!22819 call!2864)))

(assert (= (and d!5395 c!4134) b!36129))

(assert (= (and d!5395 (not c!4134)) b!36138))

(assert (= (and b!36138 c!4136) b!36136))

(assert (= (and b!36138 (not c!4136)) b!36139))

(assert (= (or b!36136 b!36139) bm!2861))

(assert (= (and d!5395 res!21878) b!36131))

(assert (= (and b!36131 res!21881) b!36132))

(assert (= (and b!36132 res!21880) b!36128))

(assert (= (and b!36132 c!4137) b!36135))

(assert (= (and b!36132 (not c!4137)) b!36133))

(assert (= (and b!36135 res!21879) b!36130))

(assert (= (and b!36133 c!4135) b!36134))

(assert (= (and b!36133 (not c!4135)) b!36137))

(declare-fun b_lambda!1735 () Bool)

(assert (=> (not b_lambda!1735) (not b!36130)))

(assert (=> b!36130 t!3662))

(declare-fun b_and!2115 () Bool)

(assert (= b_and!2113 (and (=> t!3662 result!1207) b_and!2115)))

(declare-fun b_lambda!1737 () Bool)

(assert (=> (not b_lambda!1737) (not b!36136)))

(assert (=> b!36136 t!3662))

(declare-fun b_and!2117 () Bool)

(assert (= b_and!2115 (and (=> t!3662 result!1207) b_and!2117)))

(assert (=> b!36138 m!28875))

(assert (=> b!36138 m!28875))

(assert (=> b!36138 m!28903))

(declare-fun m!29037 () Bool)

(assert (=> bm!2861 m!29037))

(assert (=> b!36128 m!28875))

(assert (=> b!36128 m!28875))

(assert (=> b!36128 m!28903))

(declare-fun m!29039 () Bool)

(assert (=> b!36137 m!29039))

(assert (=> b!36130 m!28897))

(assert (=> b!36130 m!28895))

(assert (=> b!36130 m!28875))

(declare-fun m!29041 () Bool)

(assert (=> b!36130 m!29041))

(assert (=> b!36130 m!28875))

(assert (=> b!36130 m!28895))

(assert (=> b!36130 m!28897))

(assert (=> b!36130 m!28899))

(declare-fun m!29043 () Bool)

(assert (=> d!5395 m!29043))

(assert (=> d!5395 m!28847))

(assert (=> b!36135 m!28875))

(assert (=> b!36135 m!28875))

(declare-fun m!29045 () Bool)

(assert (=> b!36135 m!29045))

(assert (=> b!36136 m!28897))

(assert (=> b!36136 m!28895))

(declare-fun m!29047 () Bool)

(assert (=> b!36136 m!29047))

(declare-fun m!29049 () Bool)

(assert (=> b!36136 m!29049))

(declare-fun m!29051 () Bool)

(assert (=> b!36136 m!29051))

(declare-fun m!29053 () Bool)

(assert (=> b!36136 m!29053))

(assert (=> b!36136 m!28875))

(assert (=> b!36136 m!28895))

(assert (=> b!36136 m!28897))

(assert (=> b!36136 m!28899))

(assert (=> b!36136 m!29047))

(assert (=> b!36134 m!29037))

(declare-fun m!29055 () Bool)

(assert (=> b!36131 m!29055))

(assert (=> bm!2849 d!5395))

(assert (=> d!5353 d!5357))

(assert (=> b!36025 d!5383))

(declare-fun d!5397 () Bool)

(declare-fun res!21886 () Bool)

(declare-fun e!22827 () Bool)

(assert (=> d!5397 (=> res!21886 e!22827)))

(assert (=> d!5397 (= res!21886 (and ((_ is Cons!945) (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (= (_1!688 (h!1512 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)))))

(assert (=> d!5397 (= (containsKey!38 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304) e!22827)))

(declare-fun b!36144 () Bool)

(declare-fun e!22828 () Bool)

(assert (=> b!36144 (= e!22827 e!22828)))

(declare-fun res!21887 () Bool)

(assert (=> b!36144 (=> (not res!21887) (not e!22828))))

(assert (=> b!36144 (= res!21887 (and (or (not ((_ is Cons!945) (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) (bvsle (_1!688 (h!1512 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)) ((_ is Cons!945) (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (bvslt (_1!688 (h!1512 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)))))

(declare-fun b!36145 () Bool)

(assert (=> b!36145 (= e!22828 (containsKey!38 (t!3660 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) k0!1304))))

(assert (= (and d!5397 (not res!21886)) b!36144))

(assert (= (and b!36144 res!21887) b!36145))

(declare-fun m!29057 () Bool)

(assert (=> b!36145 m!29057))

(assert (=> d!5351 d!5397))

(declare-fun d!5399 () Bool)

(assert (=> d!5399 (= (apply!42 lt!13283 (select (arr!1188 _keys!1833) #b00000000000000000000000000000000)) (get!612 (getValueByKey!74 (toList!481 lt!13283) (select (arr!1188 _keys!1833) #b00000000000000000000000000000000))))))

(declare-fun bs!1364 () Bool)

(assert (= bs!1364 d!5399))

(assert (=> bs!1364 m!28875))

(assert (=> bs!1364 m!28989))

(assert (=> bs!1364 m!28989))

(declare-fun m!29059 () Bool)

(assert (=> bs!1364 m!29059))

(assert (=> b!35969 d!5399))

(declare-fun d!5401 () Bool)

(declare-fun c!4140 () Bool)

(assert (=> d!5401 (= c!4140 ((_ is ValueCellFull!618) (select (arr!1187 _values!1501) #b00000000000000000000000000000000)))))

(declare-fun e!22831 () V!2005)

(assert (=> d!5401 (= (get!611 (select (arr!1187 _values!1501) #b00000000000000000000000000000000) (dynLambda!159 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)) e!22831)))

(declare-fun b!36150 () Bool)

(declare-fun get!613 (ValueCell!618 V!2005) V!2005)

(assert (=> b!36150 (= e!22831 (get!613 (select (arr!1187 _values!1501) #b00000000000000000000000000000000) (dynLambda!159 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!36151 () Bool)

(declare-fun get!614 (ValueCell!618 V!2005) V!2005)

(assert (=> b!36151 (= e!22831 (get!614 (select (arr!1187 _values!1501) #b00000000000000000000000000000000) (dynLambda!159 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!5401 c!4140) b!36150))

(assert (= (and d!5401 (not c!4140)) b!36151))

(assert (=> b!36150 m!28895))

(assert (=> b!36150 m!28897))

(declare-fun m!29061 () Bool)

(assert (=> b!36150 m!29061))

(assert (=> b!36151 m!28895))

(assert (=> b!36151 m!28897))

(declare-fun m!29063 () Bool)

(assert (=> b!36151 m!29063))

(assert (=> b!35969 d!5401))

(declare-fun d!5403 () Bool)

(declare-fun e!22833 () Bool)

(assert (=> d!5403 e!22833))

(declare-fun res!21888 () Bool)

(assert (=> d!5403 (=> res!21888 e!22833)))

(declare-fun lt!13382 () Bool)

(assert (=> d!5403 (= res!21888 (not lt!13382))))

(declare-fun lt!13383 () Bool)

(assert (=> d!5403 (= lt!13382 lt!13383)))

(declare-fun lt!13381 () Unit!792)

(declare-fun e!22832 () Unit!792)

(assert (=> d!5403 (= lt!13381 e!22832)))

(declare-fun c!4141 () Bool)

(assert (=> d!5403 (= c!4141 lt!13383)))

(assert (=> d!5403 (= lt!13383 (containsKey!38 (toList!481 lt!13283) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!5403 (= (contains!430 lt!13283 #b1000000000000000000000000000000000000000000000000000000000000000) lt!13382)))

(declare-fun b!36152 () Bool)

(declare-fun lt!13384 () Unit!792)

(assert (=> b!36152 (= e!22832 lt!13384)))

(assert (=> b!36152 (= lt!13384 (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!481 lt!13283) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!36152 (isDefined!36 (getValueByKey!74 (toList!481 lt!13283) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!36153 () Bool)

(declare-fun Unit!798 () Unit!792)

(assert (=> b!36153 (= e!22832 Unit!798)))

(declare-fun b!36154 () Bool)

(assert (=> b!36154 (= e!22833 (isDefined!36 (getValueByKey!74 (toList!481 lt!13283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!5403 c!4141) b!36152))

(assert (= (and d!5403 (not c!4141)) b!36153))

(assert (= (and d!5403 (not res!21888)) b!36154))

(declare-fun m!29065 () Bool)

(assert (=> d!5403 m!29065))

(declare-fun m!29067 () Bool)

(assert (=> b!36152 m!29067))

(assert (=> b!36152 m!29005))

(assert (=> b!36152 m!29005))

(declare-fun m!29069 () Bool)

(assert (=> b!36152 m!29069))

(assert (=> b!36154 m!29005))

(assert (=> b!36154 m!29005))

(assert (=> b!36154 m!29069))

(assert (=> bm!2847 d!5403))

(declare-fun d!5405 () Bool)

(declare-fun e!22836 () Bool)

(assert (=> d!5405 e!22836))

(declare-fun res!21894 () Bool)

(assert (=> d!5405 (=> (not res!21894) (not e!22836))))

(declare-fun lt!13395 () ListLongMap!931)

(assert (=> d!5405 (= res!21894 (contains!430 lt!13395 (_1!688 (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun lt!13394 () List!949)

(assert (=> d!5405 (= lt!13395 (ListLongMap!932 lt!13394))))

(declare-fun lt!13396 () Unit!792)

(declare-fun lt!13393 () Unit!792)

(assert (=> d!5405 (= lt!13396 lt!13393)))

(assert (=> d!5405 (= (getValueByKey!74 lt!13394 (_1!688 (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))) (Some!79 (_2!688 (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!19 (List!949 (_ BitVec 64) V!2005) Unit!792)

(assert (=> d!5405 (= lt!13393 (lemmaContainsTupThenGetReturnValue!19 lt!13394 (_1!688 (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (_2!688 (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun insertStrictlySorted!19 (List!949 (_ BitVec 64) V!2005) List!949)

(assert (=> d!5405 (= lt!13394 (insertStrictlySorted!19 (toList!481 (ite c!4084 call!2852 (ite c!4086 call!2849 call!2851))) (_1!688 (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (_2!688 (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(assert (=> d!5405 (= (+!60 (ite c!4084 call!2852 (ite c!4086 call!2849 call!2851)) (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) lt!13395)))

(declare-fun b!36159 () Bool)

(declare-fun res!21893 () Bool)

(assert (=> b!36159 (=> (not res!21893) (not e!22836))))

(assert (=> b!36159 (= res!21893 (= (getValueByKey!74 (toList!481 lt!13395) (_1!688 (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))) (Some!79 (_2!688 (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))))

(declare-fun b!36160 () Bool)

(declare-fun contains!432 (List!949 tuple2!1354) Bool)

(assert (=> b!36160 (= e!22836 (contains!432 (toList!481 lt!13395) (ite (or c!4084 c!4086) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (= (and d!5405 res!21894) b!36159))

(assert (= (and b!36159 res!21893) b!36160))

(declare-fun m!29071 () Bool)

(assert (=> d!5405 m!29071))

(declare-fun m!29073 () Bool)

(assert (=> d!5405 m!29073))

(declare-fun m!29075 () Bool)

(assert (=> d!5405 m!29075))

(declare-fun m!29077 () Bool)

(assert (=> d!5405 m!29077))

(declare-fun m!29079 () Bool)

(assert (=> b!36159 m!29079))

(declare-fun m!29081 () Bool)

(assert (=> b!36160 m!29081))

(assert (=> bm!2850 d!5405))

(declare-fun d!5407 () Bool)

(declare-fun e!22837 () Bool)

(assert (=> d!5407 e!22837))

(declare-fun res!21896 () Bool)

(assert (=> d!5407 (=> (not res!21896) (not e!22837))))

(declare-fun lt!13399 () ListLongMap!931)

(assert (=> d!5407 (= res!21896 (contains!430 lt!13399 (_1!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun lt!13398 () List!949)

(assert (=> d!5407 (= lt!13399 (ListLongMap!932 lt!13398))))

(declare-fun lt!13400 () Unit!792)

(declare-fun lt!13397 () Unit!792)

(assert (=> d!5407 (= lt!13400 lt!13397)))

(assert (=> d!5407 (= (getValueByKey!74 lt!13398 (_1!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (Some!79 (_2!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (=> d!5407 (= lt!13397 (lemmaContainsTupThenGetReturnValue!19 lt!13398 (_1!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)) (_2!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (=> d!5407 (= lt!13398 (insertStrictlySorted!19 (toList!481 call!2848) (_1!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)) (_2!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (=> d!5407 (= (+!60 call!2848 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)) lt!13399)))

(declare-fun b!36161 () Bool)

(declare-fun res!21895 () Bool)

(assert (=> b!36161 (=> (not res!21895) (not e!22837))))

(assert (=> b!36161 (= res!21895 (= (getValueByKey!74 (toList!481 lt!13399) (_1!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (Some!79 (_2!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun b!36162 () Bool)

(assert (=> b!36162 (= e!22837 (contains!432 (toList!481 lt!13399) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(assert (= (and d!5407 res!21896) b!36161))

(assert (= (and b!36161 res!21895) b!36162))

(declare-fun m!29083 () Bool)

(assert (=> d!5407 m!29083))

(declare-fun m!29085 () Bool)

(assert (=> d!5407 m!29085))

(declare-fun m!29087 () Bool)

(assert (=> d!5407 m!29087))

(declare-fun m!29089 () Bool)

(assert (=> d!5407 m!29089))

(declare-fun m!29091 () Bool)

(assert (=> b!36161 m!29091))

(declare-fun m!29093 () Bool)

(assert (=> b!36162 m!29093))

(assert (=> b!35962 d!5407))

(declare-fun d!5409 () Bool)

(declare-fun e!22838 () Bool)

(assert (=> d!5409 e!22838))

(declare-fun res!21898 () Bool)

(assert (=> d!5409 (=> (not res!21898) (not e!22838))))

(declare-fun lt!13403 () ListLongMap!931)

(assert (=> d!5409 (= res!21898 (contains!430 lt!13403 (_1!688 (tuple2!1355 lt!13284 minValue!1443))))))

(declare-fun lt!13402 () List!949)

(assert (=> d!5409 (= lt!13403 (ListLongMap!932 lt!13402))))

(declare-fun lt!13404 () Unit!792)

(declare-fun lt!13401 () Unit!792)

(assert (=> d!5409 (= lt!13404 lt!13401)))

(assert (=> d!5409 (= (getValueByKey!74 lt!13402 (_1!688 (tuple2!1355 lt!13284 minValue!1443))) (Some!79 (_2!688 (tuple2!1355 lt!13284 minValue!1443))))))

(assert (=> d!5409 (= lt!13401 (lemmaContainsTupThenGetReturnValue!19 lt!13402 (_1!688 (tuple2!1355 lt!13284 minValue!1443)) (_2!688 (tuple2!1355 lt!13284 minValue!1443))))))

(assert (=> d!5409 (= lt!13402 (insertStrictlySorted!19 (toList!481 lt!13285) (_1!688 (tuple2!1355 lt!13284 minValue!1443)) (_2!688 (tuple2!1355 lt!13284 minValue!1443))))))

(assert (=> d!5409 (= (+!60 lt!13285 (tuple2!1355 lt!13284 minValue!1443)) lt!13403)))

(declare-fun b!36163 () Bool)

(declare-fun res!21897 () Bool)

(assert (=> b!36163 (=> (not res!21897) (not e!22838))))

(assert (=> b!36163 (= res!21897 (= (getValueByKey!74 (toList!481 lt!13403) (_1!688 (tuple2!1355 lt!13284 minValue!1443))) (Some!79 (_2!688 (tuple2!1355 lt!13284 minValue!1443)))))))

(declare-fun b!36164 () Bool)

(assert (=> b!36164 (= e!22838 (contains!432 (toList!481 lt!13403) (tuple2!1355 lt!13284 minValue!1443)))))

(assert (= (and d!5409 res!21898) b!36163))

(assert (= (and b!36163 res!21897) b!36164))

(declare-fun m!29095 () Bool)

(assert (=> d!5409 m!29095))

(declare-fun m!29097 () Bool)

(assert (=> d!5409 m!29097))

(declare-fun m!29099 () Bool)

(assert (=> d!5409 m!29099))

(declare-fun m!29101 () Bool)

(assert (=> d!5409 m!29101))

(declare-fun m!29103 () Bool)

(assert (=> b!36163 m!29103))

(declare-fun m!29105 () Bool)

(assert (=> b!36164 m!29105))

(assert (=> b!35980 d!5409))

(declare-fun d!5411 () Bool)

(assert (=> d!5411 (contains!430 (+!60 lt!13298 (tuple2!1355 lt!13291 zeroValue!1443)) lt!13288)))

(declare-fun lt!13407 () Unit!792)

(declare-fun choose!221 (ListLongMap!931 (_ BitVec 64) V!2005 (_ BitVec 64)) Unit!792)

(assert (=> d!5411 (= lt!13407 (choose!221 lt!13298 lt!13291 zeroValue!1443 lt!13288))))

(assert (=> d!5411 (contains!430 lt!13298 lt!13288)))

(assert (=> d!5411 (= (addStillContains!27 lt!13298 lt!13291 zeroValue!1443 lt!13288) lt!13407)))

(declare-fun bs!1365 () Bool)

(assert (= bs!1365 d!5411))

(assert (=> bs!1365 m!28925))

(assert (=> bs!1365 m!28925))

(assert (=> bs!1365 m!28927))

(declare-fun m!29107 () Bool)

(assert (=> bs!1365 m!29107))

(declare-fun m!29109 () Bool)

(assert (=> bs!1365 m!29109))

(assert (=> b!35980 d!5411))

(declare-fun d!5413 () Bool)

(assert (=> d!5413 (= (apply!42 lt!13299 lt!13279) (get!612 (getValueByKey!74 (toList!481 lt!13299) lt!13279)))))

(declare-fun bs!1366 () Bool)

(assert (= bs!1366 d!5413))

(declare-fun m!29111 () Bool)

(assert (=> bs!1366 m!29111))

(assert (=> bs!1366 m!29111))

(declare-fun m!29113 () Bool)

(assert (=> bs!1366 m!29113))

(assert (=> b!35980 d!5413))

(declare-fun d!5415 () Bool)

(declare-fun e!22839 () Bool)

(assert (=> d!5415 e!22839))

(declare-fun res!21900 () Bool)

(assert (=> d!5415 (=> (not res!21900) (not e!22839))))

(declare-fun lt!13410 () ListLongMap!931)

(assert (=> d!5415 (= res!21900 (contains!430 lt!13410 (_1!688 (tuple2!1355 lt!13294 minValue!1443))))))

(declare-fun lt!13409 () List!949)

(assert (=> d!5415 (= lt!13410 (ListLongMap!932 lt!13409))))

(declare-fun lt!13411 () Unit!792)

(declare-fun lt!13408 () Unit!792)

(assert (=> d!5415 (= lt!13411 lt!13408)))

(assert (=> d!5415 (= (getValueByKey!74 lt!13409 (_1!688 (tuple2!1355 lt!13294 minValue!1443))) (Some!79 (_2!688 (tuple2!1355 lt!13294 minValue!1443))))))

(assert (=> d!5415 (= lt!13408 (lemmaContainsTupThenGetReturnValue!19 lt!13409 (_1!688 (tuple2!1355 lt!13294 minValue!1443)) (_2!688 (tuple2!1355 lt!13294 minValue!1443))))))

(assert (=> d!5415 (= lt!13409 (insertStrictlySorted!19 (toList!481 lt!13293) (_1!688 (tuple2!1355 lt!13294 minValue!1443)) (_2!688 (tuple2!1355 lt!13294 minValue!1443))))))

(assert (=> d!5415 (= (+!60 lt!13293 (tuple2!1355 lt!13294 minValue!1443)) lt!13410)))

(declare-fun b!36166 () Bool)

(declare-fun res!21899 () Bool)

(assert (=> b!36166 (=> (not res!21899) (not e!22839))))

(assert (=> b!36166 (= res!21899 (= (getValueByKey!74 (toList!481 lt!13410) (_1!688 (tuple2!1355 lt!13294 minValue!1443))) (Some!79 (_2!688 (tuple2!1355 lt!13294 minValue!1443)))))))

(declare-fun b!36167 () Bool)

(assert (=> b!36167 (= e!22839 (contains!432 (toList!481 lt!13410) (tuple2!1355 lt!13294 minValue!1443)))))

(assert (= (and d!5415 res!21900) b!36166))

(assert (= (and b!36166 res!21899) b!36167))

(declare-fun m!29115 () Bool)

(assert (=> d!5415 m!29115))

(declare-fun m!29117 () Bool)

(assert (=> d!5415 m!29117))

(declare-fun m!29119 () Bool)

(assert (=> d!5415 m!29119))

(declare-fun m!29121 () Bool)

(assert (=> d!5415 m!29121))

(declare-fun m!29123 () Bool)

(assert (=> b!36166 m!29123))

(declare-fun m!29125 () Bool)

(assert (=> b!36167 m!29125))

(assert (=> b!35980 d!5415))

(declare-fun d!5417 () Bool)

(assert (=> d!5417 (= (apply!42 lt!13293 lt!13296) (get!612 (getValueByKey!74 (toList!481 lt!13293) lt!13296)))))

(declare-fun bs!1367 () Bool)

(assert (= bs!1367 d!5417))

(declare-fun m!29127 () Bool)

(assert (=> bs!1367 m!29127))

(assert (=> bs!1367 m!29127))

(declare-fun m!29129 () Bool)

(assert (=> bs!1367 m!29129))

(assert (=> b!35980 d!5417))

(declare-fun d!5419 () Bool)

(assert (=> d!5419 (= (apply!42 (+!60 lt!13299 (tuple2!1355 lt!13280 zeroValue!1443)) lt!13279) (get!612 (getValueByKey!74 (toList!481 (+!60 lt!13299 (tuple2!1355 lt!13280 zeroValue!1443))) lt!13279)))))

(declare-fun bs!1368 () Bool)

(assert (= bs!1368 d!5419))

(declare-fun m!29131 () Bool)

(assert (=> bs!1368 m!29131))

(assert (=> bs!1368 m!29131))

(declare-fun m!29133 () Bool)

(assert (=> bs!1368 m!29133))

(assert (=> b!35980 d!5419))

(assert (=> b!35980 d!5395))

(declare-fun d!5421 () Bool)

(assert (=> d!5421 (= (apply!42 (+!60 lt!13285 (tuple2!1355 lt!13284 minValue!1443)) lt!13292) (get!612 (getValueByKey!74 (toList!481 (+!60 lt!13285 (tuple2!1355 lt!13284 minValue!1443))) lt!13292)))))

(declare-fun bs!1369 () Bool)

(assert (= bs!1369 d!5421))

(declare-fun m!29135 () Bool)

(assert (=> bs!1369 m!29135))

(assert (=> bs!1369 m!29135))

(declare-fun m!29137 () Bool)

(assert (=> bs!1369 m!29137))

(assert (=> b!35980 d!5421))

(declare-fun d!5423 () Bool)

(declare-fun e!22840 () Bool)

(assert (=> d!5423 e!22840))

(declare-fun res!21902 () Bool)

(assert (=> d!5423 (=> (not res!21902) (not e!22840))))

(declare-fun lt!13414 () ListLongMap!931)

(assert (=> d!5423 (= res!21902 (contains!430 lt!13414 (_1!688 (tuple2!1355 lt!13280 zeroValue!1443))))))

(declare-fun lt!13413 () List!949)

(assert (=> d!5423 (= lt!13414 (ListLongMap!932 lt!13413))))

(declare-fun lt!13415 () Unit!792)

(declare-fun lt!13412 () Unit!792)

(assert (=> d!5423 (= lt!13415 lt!13412)))

(assert (=> d!5423 (= (getValueByKey!74 lt!13413 (_1!688 (tuple2!1355 lt!13280 zeroValue!1443))) (Some!79 (_2!688 (tuple2!1355 lt!13280 zeroValue!1443))))))

(assert (=> d!5423 (= lt!13412 (lemmaContainsTupThenGetReturnValue!19 lt!13413 (_1!688 (tuple2!1355 lt!13280 zeroValue!1443)) (_2!688 (tuple2!1355 lt!13280 zeroValue!1443))))))

(assert (=> d!5423 (= lt!13413 (insertStrictlySorted!19 (toList!481 lt!13299) (_1!688 (tuple2!1355 lt!13280 zeroValue!1443)) (_2!688 (tuple2!1355 lt!13280 zeroValue!1443))))))

(assert (=> d!5423 (= (+!60 lt!13299 (tuple2!1355 lt!13280 zeroValue!1443)) lt!13414)))

(declare-fun b!36168 () Bool)

(declare-fun res!21901 () Bool)

(assert (=> b!36168 (=> (not res!21901) (not e!22840))))

(assert (=> b!36168 (= res!21901 (= (getValueByKey!74 (toList!481 lt!13414) (_1!688 (tuple2!1355 lt!13280 zeroValue!1443))) (Some!79 (_2!688 (tuple2!1355 lt!13280 zeroValue!1443)))))))

(declare-fun b!36169 () Bool)

(assert (=> b!36169 (= e!22840 (contains!432 (toList!481 lt!13414) (tuple2!1355 lt!13280 zeroValue!1443)))))

(assert (= (and d!5423 res!21902) b!36168))

(assert (= (and b!36168 res!21901) b!36169))

(declare-fun m!29139 () Bool)

(assert (=> d!5423 m!29139))

(declare-fun m!29141 () Bool)

(assert (=> d!5423 m!29141))

(declare-fun m!29143 () Bool)

(assert (=> d!5423 m!29143))

(declare-fun m!29145 () Bool)

(assert (=> d!5423 m!29145))

(declare-fun m!29147 () Bool)

(assert (=> b!36168 m!29147))

(declare-fun m!29149 () Bool)

(assert (=> b!36169 m!29149))

(assert (=> b!35980 d!5423))

(declare-fun d!5425 () Bool)

(declare-fun e!22841 () Bool)

(assert (=> d!5425 e!22841))

(declare-fun res!21904 () Bool)

(assert (=> d!5425 (=> (not res!21904) (not e!22841))))

(declare-fun lt!13418 () ListLongMap!931)

(assert (=> d!5425 (= res!21904 (contains!430 lt!13418 (_1!688 (tuple2!1355 lt!13291 zeroValue!1443))))))

(declare-fun lt!13417 () List!949)

(assert (=> d!5425 (= lt!13418 (ListLongMap!932 lt!13417))))

(declare-fun lt!13419 () Unit!792)

(declare-fun lt!13416 () Unit!792)

(assert (=> d!5425 (= lt!13419 lt!13416)))

(assert (=> d!5425 (= (getValueByKey!74 lt!13417 (_1!688 (tuple2!1355 lt!13291 zeroValue!1443))) (Some!79 (_2!688 (tuple2!1355 lt!13291 zeroValue!1443))))))

(assert (=> d!5425 (= lt!13416 (lemmaContainsTupThenGetReturnValue!19 lt!13417 (_1!688 (tuple2!1355 lt!13291 zeroValue!1443)) (_2!688 (tuple2!1355 lt!13291 zeroValue!1443))))))

(assert (=> d!5425 (= lt!13417 (insertStrictlySorted!19 (toList!481 lt!13298) (_1!688 (tuple2!1355 lt!13291 zeroValue!1443)) (_2!688 (tuple2!1355 lt!13291 zeroValue!1443))))))

(assert (=> d!5425 (= (+!60 lt!13298 (tuple2!1355 lt!13291 zeroValue!1443)) lt!13418)))

(declare-fun b!36170 () Bool)

(declare-fun res!21903 () Bool)

(assert (=> b!36170 (=> (not res!21903) (not e!22841))))

(assert (=> b!36170 (= res!21903 (= (getValueByKey!74 (toList!481 lt!13418) (_1!688 (tuple2!1355 lt!13291 zeroValue!1443))) (Some!79 (_2!688 (tuple2!1355 lt!13291 zeroValue!1443)))))))

(declare-fun b!36171 () Bool)

(assert (=> b!36171 (= e!22841 (contains!432 (toList!481 lt!13418) (tuple2!1355 lt!13291 zeroValue!1443)))))

(assert (= (and d!5425 res!21904) b!36170))

(assert (= (and b!36170 res!21903) b!36171))

(declare-fun m!29151 () Bool)

(assert (=> d!5425 m!29151))

(declare-fun m!29153 () Bool)

(assert (=> d!5425 m!29153))

(declare-fun m!29155 () Bool)

(assert (=> d!5425 m!29155))

(declare-fun m!29157 () Bool)

(assert (=> d!5425 m!29157))

(declare-fun m!29159 () Bool)

(assert (=> b!36170 m!29159))

(declare-fun m!29161 () Bool)

(assert (=> b!36171 m!29161))

(assert (=> b!35980 d!5425))

(declare-fun d!5427 () Bool)

(assert (=> d!5427 (= (apply!42 (+!60 lt!13293 (tuple2!1355 lt!13294 minValue!1443)) lt!13296) (get!612 (getValueByKey!74 (toList!481 (+!60 lt!13293 (tuple2!1355 lt!13294 minValue!1443))) lt!13296)))))

(declare-fun bs!1370 () Bool)

(assert (= bs!1370 d!5427))

(declare-fun m!29163 () Bool)

(assert (=> bs!1370 m!29163))

(assert (=> bs!1370 m!29163))

(declare-fun m!29165 () Bool)

(assert (=> bs!1370 m!29165))

(assert (=> b!35980 d!5427))

(declare-fun d!5429 () Bool)

(assert (=> d!5429 (= (apply!42 (+!60 lt!13285 (tuple2!1355 lt!13284 minValue!1443)) lt!13292) (apply!42 lt!13285 lt!13292))))

(declare-fun lt!13422 () Unit!792)

(declare-fun choose!222 (ListLongMap!931 (_ BitVec 64) V!2005 (_ BitVec 64)) Unit!792)

(assert (=> d!5429 (= lt!13422 (choose!222 lt!13285 lt!13284 minValue!1443 lt!13292))))

(declare-fun e!22844 () Bool)

(assert (=> d!5429 e!22844))

(declare-fun res!21907 () Bool)

(assert (=> d!5429 (=> (not res!21907) (not e!22844))))

(assert (=> d!5429 (= res!21907 (contains!430 lt!13285 lt!13292))))

(assert (=> d!5429 (= (addApplyDifferent!27 lt!13285 lt!13284 minValue!1443 lt!13292) lt!13422)))

(declare-fun b!36175 () Bool)

(assert (=> b!36175 (= e!22844 (not (= lt!13292 lt!13284)))))

(assert (= (and d!5429 res!21907) b!36175))

(assert (=> d!5429 m!28923))

(assert (=> d!5429 m!28931))

(assert (=> d!5429 m!28923))

(assert (=> d!5429 m!28921))

(declare-fun m!29167 () Bool)

(assert (=> d!5429 m!29167))

(declare-fun m!29169 () Bool)

(assert (=> d!5429 m!29169))

(assert (=> b!35980 d!5429))

(declare-fun d!5431 () Bool)

(assert (=> d!5431 (= (apply!42 (+!60 lt!13293 (tuple2!1355 lt!13294 minValue!1443)) lt!13296) (apply!42 lt!13293 lt!13296))))

(declare-fun lt!13423 () Unit!792)

(assert (=> d!5431 (= lt!13423 (choose!222 lt!13293 lt!13294 minValue!1443 lt!13296))))

(declare-fun e!22845 () Bool)

(assert (=> d!5431 e!22845))

(declare-fun res!21908 () Bool)

(assert (=> d!5431 (=> (not res!21908) (not e!22845))))

(assert (=> d!5431 (= res!21908 (contains!430 lt!13293 lt!13296))))

(assert (=> d!5431 (= (addApplyDifferent!27 lt!13293 lt!13294 minValue!1443 lt!13296) lt!13423)))

(declare-fun b!36176 () Bool)

(assert (=> b!36176 (= e!22845 (not (= lt!13296 lt!13294)))))

(assert (= (and d!5431 res!21908) b!36176))

(assert (=> d!5431 m!28909))

(assert (=> d!5431 m!28911))

(assert (=> d!5431 m!28909))

(assert (=> d!5431 m!28917))

(declare-fun m!29171 () Bool)

(assert (=> d!5431 m!29171))

(declare-fun m!29173 () Bool)

(assert (=> d!5431 m!29173))

(assert (=> b!35980 d!5431))

(declare-fun d!5433 () Bool)

(assert (=> d!5433 (= (apply!42 lt!13285 lt!13292) (get!612 (getValueByKey!74 (toList!481 lt!13285) lt!13292)))))

(declare-fun bs!1371 () Bool)

(assert (= bs!1371 d!5433))

(declare-fun m!29175 () Bool)

(assert (=> bs!1371 m!29175))

(assert (=> bs!1371 m!29175))

(declare-fun m!29177 () Bool)

(assert (=> bs!1371 m!29177))

(assert (=> b!35980 d!5433))

(declare-fun d!5435 () Bool)

(assert (=> d!5435 (= (apply!42 (+!60 lt!13299 (tuple2!1355 lt!13280 zeroValue!1443)) lt!13279) (apply!42 lt!13299 lt!13279))))

(declare-fun lt!13424 () Unit!792)

(assert (=> d!5435 (= lt!13424 (choose!222 lt!13299 lt!13280 zeroValue!1443 lt!13279))))

(declare-fun e!22846 () Bool)

(assert (=> d!5435 e!22846))

(declare-fun res!21909 () Bool)

(assert (=> d!5435 (=> (not res!21909) (not e!22846))))

(assert (=> d!5435 (= res!21909 (contains!430 lt!13299 lt!13279))))

(assert (=> d!5435 (= (addApplyDifferent!27 lt!13299 lt!13280 zeroValue!1443 lt!13279) lt!13424)))

(declare-fun b!36177 () Bool)

(assert (=> b!36177 (= e!22846 (not (= lt!13279 lt!13280)))))

(assert (= (and d!5435 res!21909) b!36177))

(assert (=> d!5435 m!28919))

(assert (=> d!5435 m!28929))

(assert (=> d!5435 m!28919))

(assert (=> d!5435 m!28935))

(declare-fun m!29179 () Bool)

(assert (=> d!5435 m!29179))

(declare-fun m!29181 () Bool)

(assert (=> d!5435 m!29181))

(assert (=> b!35980 d!5435))

(declare-fun d!5437 () Bool)

(declare-fun e!22848 () Bool)

(assert (=> d!5437 e!22848))

(declare-fun res!21910 () Bool)

(assert (=> d!5437 (=> res!21910 e!22848)))

(declare-fun lt!13426 () Bool)

(assert (=> d!5437 (= res!21910 (not lt!13426))))

(declare-fun lt!13427 () Bool)

(assert (=> d!5437 (= lt!13426 lt!13427)))

(declare-fun lt!13425 () Unit!792)

(declare-fun e!22847 () Unit!792)

(assert (=> d!5437 (= lt!13425 e!22847)))

(declare-fun c!4142 () Bool)

(assert (=> d!5437 (= c!4142 lt!13427)))

(assert (=> d!5437 (= lt!13427 (containsKey!38 (toList!481 (+!60 lt!13298 (tuple2!1355 lt!13291 zeroValue!1443))) lt!13288))))

(assert (=> d!5437 (= (contains!430 (+!60 lt!13298 (tuple2!1355 lt!13291 zeroValue!1443)) lt!13288) lt!13426)))

(declare-fun b!36178 () Bool)

(declare-fun lt!13428 () Unit!792)

(assert (=> b!36178 (= e!22847 lt!13428)))

(assert (=> b!36178 (= lt!13428 (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!481 (+!60 lt!13298 (tuple2!1355 lt!13291 zeroValue!1443))) lt!13288))))

(assert (=> b!36178 (isDefined!36 (getValueByKey!74 (toList!481 (+!60 lt!13298 (tuple2!1355 lt!13291 zeroValue!1443))) lt!13288))))

(declare-fun b!36179 () Bool)

(declare-fun Unit!799 () Unit!792)

(assert (=> b!36179 (= e!22847 Unit!799)))

(declare-fun b!36180 () Bool)

(assert (=> b!36180 (= e!22848 (isDefined!36 (getValueByKey!74 (toList!481 (+!60 lt!13298 (tuple2!1355 lt!13291 zeroValue!1443))) lt!13288)))))

(assert (= (and d!5437 c!4142) b!36178))

(assert (= (and d!5437 (not c!4142)) b!36179))

(assert (= (and d!5437 (not res!21910)) b!36180))

(declare-fun m!29183 () Bool)

(assert (=> d!5437 m!29183))

(declare-fun m!29185 () Bool)

(assert (=> b!36178 m!29185))

(declare-fun m!29187 () Bool)

(assert (=> b!36178 m!29187))

(assert (=> b!36178 m!29187))

(declare-fun m!29189 () Bool)

(assert (=> b!36178 m!29189))

(assert (=> b!36180 m!29187))

(assert (=> b!36180 m!29187))

(assert (=> b!36180 m!29189))

(assert (=> b!35980 d!5437))

(declare-fun b!36193 () Bool)

(declare-fun e!22855 () SeekEntryResult!165)

(assert (=> b!36193 (= e!22855 (MissingVacant!165 (index!2784 lt!13311)))))

(declare-fun b!36194 () Bool)

(declare-fun e!22857 () SeekEntryResult!165)

(declare-fun e!22856 () SeekEntryResult!165)

(assert (=> b!36194 (= e!22857 e!22856)))

(declare-fun c!4151 () Bool)

(declare-fun lt!13434 () (_ BitVec 64))

(assert (=> b!36194 (= c!4151 (= lt!13434 k0!1304))))

(declare-fun b!36195 () Bool)

(assert (=> b!36195 (= e!22856 (Found!165 (index!2784 lt!13311)))))

(declare-fun b!36196 () Bool)

(declare-fun c!4149 () Bool)

(assert (=> b!36196 (= c!4149 (= lt!13434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!36196 (= e!22856 e!22855)))

(declare-fun b!36197 () Bool)

(assert (=> b!36197 (= e!22855 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7053 lt!13311) #b00000000000000000000000000000001) (nextIndex!0 (index!2784 lt!13311) (x!7053 lt!13311) mask!2294) (index!2784 lt!13311) k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!13433 () SeekEntryResult!165)

(declare-fun d!5439 () Bool)

(assert (=> d!5439 (and (or ((_ is Undefined!165) lt!13433) (not ((_ is Found!165) lt!13433)) (and (bvsge (index!2783 lt!13433) #b00000000000000000000000000000000) (bvslt (index!2783 lt!13433) (size!1289 _keys!1833)))) (or ((_ is Undefined!165) lt!13433) ((_ is Found!165) lt!13433) (not ((_ is MissingVacant!165) lt!13433)) (not (= (index!2785 lt!13433) (index!2784 lt!13311))) (and (bvsge (index!2785 lt!13433) #b00000000000000000000000000000000) (bvslt (index!2785 lt!13433) (size!1289 _keys!1833)))) (or ((_ is Undefined!165) lt!13433) (ite ((_ is Found!165) lt!13433) (= (select (arr!1188 _keys!1833) (index!2783 lt!13433)) k0!1304) (and ((_ is MissingVacant!165) lt!13433) (= (index!2785 lt!13433) (index!2784 lt!13311)) (= (select (arr!1188 _keys!1833) (index!2785 lt!13433)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!5439 (= lt!13433 e!22857)))

(declare-fun c!4150 () Bool)

(assert (=> d!5439 (= c!4150 (bvsge (x!7053 lt!13311) #b01111111111111111111111111111110))))

(assert (=> d!5439 (= lt!13434 (select (arr!1188 _keys!1833) (index!2784 lt!13311)))))

(assert (=> d!5439 (validMask!0 mask!2294)))

(assert (=> d!5439 (= (seekKeyOrZeroReturnVacant!0 (x!7053 lt!13311) (index!2784 lt!13311) (index!2784 lt!13311) k0!1304 _keys!1833 mask!2294) lt!13433)))

(declare-fun b!36198 () Bool)

(assert (=> b!36198 (= e!22857 Undefined!165)))

(assert (= (and d!5439 c!4150) b!36198))

(assert (= (and d!5439 (not c!4150)) b!36194))

(assert (= (and b!36194 c!4151) b!36195))

(assert (= (and b!36194 (not c!4151)) b!36196))

(assert (= (and b!36196 c!4149) b!36193))

(assert (= (and b!36196 (not c!4149)) b!36197))

(declare-fun m!29191 () Bool)

(assert (=> b!36197 m!29191))

(assert (=> b!36197 m!29191))

(declare-fun m!29193 () Bool)

(assert (=> b!36197 m!29193))

(declare-fun m!29195 () Bool)

(assert (=> d!5439 m!29195))

(declare-fun m!29197 () Bool)

(assert (=> d!5439 m!29197))

(assert (=> d!5439 m!28943))

(assert (=> d!5439 m!28847))

(assert (=> b!35999 d!5439))

(declare-fun d!5441 () Bool)

(declare-fun isEmpty!175 (Option!80) Bool)

(assert (=> d!5441 (= (isDefined!36 (getValueByKey!74 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)) (not (isEmpty!175 (getValueByKey!74 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))))

(declare-fun bs!1372 () Bool)

(assert (= bs!1372 d!5441))

(assert (=> bs!1372 m!28883))

(declare-fun m!29199 () Bool)

(assert (=> bs!1372 m!29199))

(assert (=> b!35917 d!5441))

(declare-fun b!36210 () Bool)

(declare-fun e!22863 () Option!80)

(assert (=> b!36210 (= e!22863 None!78)))

(declare-fun c!4156 () Bool)

(declare-fun d!5443 () Bool)

(assert (=> d!5443 (= c!4156 (and ((_ is Cons!945) (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (= (_1!688 (h!1512 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)))))

(declare-fun e!22862 () Option!80)

(assert (=> d!5443 (= (getValueByKey!74 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304) e!22862)))

(declare-fun b!36207 () Bool)

(assert (=> b!36207 (= e!22862 (Some!79 (_2!688 (h!1512 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))))))

(declare-fun b!36209 () Bool)

(assert (=> b!36209 (= e!22863 (getValueByKey!74 (t!3660 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) k0!1304))))

(declare-fun b!36208 () Bool)

(assert (=> b!36208 (= e!22862 e!22863)))

(declare-fun c!4157 () Bool)

(assert (=> b!36208 (= c!4157 (and ((_ is Cons!945) (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (not (= (_1!688 (h!1512 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304))))))

(assert (= (and d!5443 c!4156) b!36207))

(assert (= (and d!5443 (not c!4156)) b!36208))

(assert (= (and b!36208 c!4157) b!36209))

(assert (= (and b!36208 (not c!4157)) b!36210))

(declare-fun m!29201 () Bool)

(assert (=> b!36209 m!29201))

(assert (=> b!35917 d!5443))

(declare-fun d!5445 () Bool)

(declare-fun res!21911 () Bool)

(declare-fun e!22864 () Bool)

(assert (=> d!5445 (=> res!21911 e!22864)))

(assert (=> d!5445 (= res!21911 (= (select (arr!1188 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1304))))

(assert (=> d!5445 (= (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!22864)))

(declare-fun b!36211 () Bool)

(declare-fun e!22865 () Bool)

(assert (=> b!36211 (= e!22864 e!22865)))

(declare-fun res!21912 () Bool)

(assert (=> b!36211 (=> (not res!21912) (not e!22865))))

(assert (=> b!36211 (= res!21912 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1289 _keys!1833)))))

(declare-fun b!36212 () Bool)

(assert (=> b!36212 (= e!22865 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!5445 (not res!21911)) b!36211))

(assert (= (and b!36211 res!21912) b!36212))

(assert (=> d!5445 m!28993))

(declare-fun m!29203 () Bool)

(assert (=> b!36212 m!29203))

(assert (=> b!35908 d!5445))

(assert (=> b!35964 d!5383))

(declare-fun d!5447 () Bool)

(assert (=> d!5447 (isDefined!36 (getValueByKey!74 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun lt!13437 () Unit!792)

(declare-fun choose!223 (List!949 (_ BitVec 64)) Unit!792)

(assert (=> d!5447 (= lt!13437 (choose!223 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun e!22868 () Bool)

(assert (=> d!5447 e!22868))

(declare-fun res!21915 () Bool)

(assert (=> d!5447 (=> (not res!21915) (not e!22868))))

(declare-fun isStrictlySorted!172 (List!949) Bool)

(assert (=> d!5447 (= res!21915 (isStrictlySorted!172 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))))

(assert (=> d!5447 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304) lt!13437)))

(declare-fun b!36215 () Bool)

(assert (=> b!36215 (= e!22868 (containsKey!38 (toList!481 (getCurrentListMap!305 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (= (and d!5447 res!21915) b!36215))

(assert (=> d!5447 m!28883))

(assert (=> d!5447 m!28883))

(assert (=> d!5447 m!28885))

(declare-fun m!29205 () Bool)

(assert (=> d!5447 m!29205))

(declare-fun m!29207 () Bool)

(assert (=> d!5447 m!29207))

(assert (=> b!36215 m!28879))

(assert (=> b!35915 d!5447))

(assert (=> b!35915 d!5441))

(assert (=> b!35915 d!5443))

(declare-fun b!36217 () Bool)

(declare-fun e!22869 () Bool)

(assert (=> b!36217 (= e!22869 tp_is_empty!1635)))

(declare-fun condMapEmpty!2015 () Bool)

(declare-fun mapDefault!2015 () ValueCell!618)

(assert (=> mapNonEmpty!2014 (= condMapEmpty!2015 (= mapRest!2014 ((as const (Array (_ BitVec 32) ValueCell!618)) mapDefault!2015)))))

(declare-fun mapRes!2015 () Bool)

(assert (=> mapNonEmpty!2014 (= tp!5299 (and e!22869 mapRes!2015))))

(declare-fun b!36216 () Bool)

(declare-fun e!22870 () Bool)

(assert (=> b!36216 (= e!22870 tp_is_empty!1635)))

(declare-fun mapNonEmpty!2015 () Bool)

(declare-fun tp!5300 () Bool)

(assert (=> mapNonEmpty!2015 (= mapRes!2015 (and tp!5300 e!22870))))

(declare-fun mapValue!2015 () ValueCell!618)

(declare-fun mapRest!2015 () (Array (_ BitVec 32) ValueCell!618))

(declare-fun mapKey!2015 () (_ BitVec 32))

(assert (=> mapNonEmpty!2015 (= mapRest!2014 (store mapRest!2015 mapKey!2015 mapValue!2015))))

(declare-fun mapIsEmpty!2015 () Bool)

(assert (=> mapIsEmpty!2015 mapRes!2015))

(assert (= (and mapNonEmpty!2014 condMapEmpty!2015) mapIsEmpty!2015))

(assert (= (and mapNonEmpty!2014 (not condMapEmpty!2015)) mapNonEmpty!2015))

(assert (= (and mapNonEmpty!2015 ((_ is ValueCellFull!618) mapValue!2015)) b!36216))

(assert (= (and mapNonEmpty!2014 ((_ is ValueCellFull!618) mapDefault!2015)) b!36217))

(declare-fun m!29209 () Bool)

(assert (=> mapNonEmpty!2015 m!29209))

(declare-fun b_lambda!1739 () Bool)

(assert (= b_lambda!1735 (or (and start!4582 b_free!1281) b_lambda!1739)))

(declare-fun b_lambda!1741 () Bool)

(assert (= b_lambda!1737 (or (and start!4582 b_free!1281) b_lambda!1741)))

(check-sat (not d!5415) (not b_lambda!1739) (not b!36212) (not b!36166) (not b!36162) (not b!36103) (not b!36136) (not b!36060) (not b_lambda!1741) (not bm!2861) (not d!5389) (not b!36134) (not b!36138) (not b!36170) (not d!5419) (not b!36151) (not d!5369) (not b!36168) (not d!5387) (not b!36130) (not b_next!1281) (not b!36145) b_and!2117 (not b!36169) (not b!36066) (not d!5393) (not d!5421) (not b!36058) (not d!5435) (not d!5433) (not b!36128) (not b!36135) (not d!5409) (not b!36062) (not d!5411) (not d!5413) (not b!36068) (not d!5373) (not d!5429) (not b!36154) (not b!36160) (not b!36197) (not b!36150) (not d!5375) (not b!36070) (not d!5447) (not mapNonEmpty!2015) tp_is_empty!1635 (not d!5379) (not b!36209) (not d!5407) (not d!5403) (not bm!2857) (not b!36037) (not b!36093) (not b!36152) (not b!36137) (not d!5399) (not b!36052) (not d!5381) (not d!5427) (not d!5431) (not d!5441) (not b!36215) (not b!36131) (not d!5423) (not bm!2858) (not b!36171) (not b!36178) (not b!36163) (not d!5417) (not d!5425) (not b!36056) (not b!36063) (not d!5439) (not b!36164) (not b!36180) (not d!5437) (not b!36065) (not b!36161) (not b_lambda!1733) (not b!36159) (not b!36167) (not d!5395) (not d!5405))
(check-sat b_and!2117 (not b_next!1281))
