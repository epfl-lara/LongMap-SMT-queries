; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79050 () Bool)

(assert start!79050)

(declare-fun b_free!17281 () Bool)

(declare-fun b_next!17281 () Bool)

(assert (=> start!79050 (= b_free!17281 (not b_next!17281))))

(declare-fun tp!60285 () Bool)

(declare-fun b_and!28273 () Bool)

(assert (=> start!79050 (= tp!60285 b_and!28273)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!926888 () Bool)

(declare-fun e!520319 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55515 0))(
  ( (array!55516 (arr!26703 (Array (_ BitVec 32) (_ BitVec 64))) (size!27164 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55515)

(declare-fun arrayContainsKey!0 (array!55515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926888 (= e!520319 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!926889 () Bool)

(declare-fun res!624420 () Bool)

(declare-fun e!520325 () Bool)

(assert (=> b!926889 (=> (not res!624420) (not e!520325))))

(declare-datatypes ((List!18808 0))(
  ( (Nil!18805) (Cons!18804 (h!19950 (_ BitVec 64)) (t!26810 List!18808)) )
))
(declare-fun arrayNoDuplicates!0 (array!55515 (_ BitVec 32) List!18808) Bool)

(assert (=> b!926889 (= res!624420 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18805))))

(declare-fun b!926890 () Bool)

(declare-fun e!520324 () Bool)

(assert (=> b!926890 (= e!520325 e!520324)))

(declare-fun res!624424 () Bool)

(assert (=> b!926890 (=> (not res!624424) (not e!520324))))

(declare-datatypes ((V!31351 0))(
  ( (V!31352 (val!9945 Int)) )
))
(declare-datatypes ((tuple2!13038 0))(
  ( (tuple2!13039 (_1!6530 (_ BitVec 64)) (_2!6530 V!31351)) )
))
(declare-datatypes ((List!18809 0))(
  ( (Nil!18806) (Cons!18805 (h!19951 tuple2!13038) (t!26811 List!18809)) )
))
(declare-datatypes ((ListLongMap!11725 0))(
  ( (ListLongMap!11726 (toList!5878 List!18809)) )
))
(declare-fun lt!417548 () ListLongMap!11725)

(declare-fun contains!4889 (ListLongMap!11725 (_ BitVec 64)) Bool)

(assert (=> b!926890 (= res!624424 (contains!4889 lt!417548 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9413 0))(
  ( (ValueCellFull!9413 (v!12462 V!31351)) (EmptyCell!9413) )
))
(declare-datatypes ((array!55517 0))(
  ( (array!55518 (arr!26704 (Array (_ BitVec 32) ValueCell!9413)) (size!27165 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55517)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31351)

(declare-fun minValue!1173 () V!31351)

(declare-fun getCurrentListMap!3063 (array!55515 array!55517 (_ BitVec 32) (_ BitVec 32) V!31351 V!31351 (_ BitVec 32) Int) ListLongMap!11725)

(assert (=> b!926890 (= lt!417548 (getCurrentListMap!3063 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926891 () Bool)

(declare-fun v!791 () V!31351)

(declare-fun lt!417544 () ListLongMap!11725)

(declare-fun e!520315 () Bool)

(declare-fun apply!688 (ListLongMap!11725 (_ BitVec 64)) V!31351)

(assert (=> b!926891 (= e!520315 (= (apply!688 lt!417544 k0!1099) v!791))))

(declare-fun res!624416 () Bool)

(assert (=> start!79050 (=> (not res!624416) (not e!520325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79050 (= res!624416 (validMask!0 mask!1881))))

(assert (=> start!79050 e!520325))

(assert (=> start!79050 true))

(declare-fun tp_is_empty!19789 () Bool)

(assert (=> start!79050 tp_is_empty!19789))

(declare-fun e!520318 () Bool)

(declare-fun array_inv!20878 (array!55517) Bool)

(assert (=> start!79050 (and (array_inv!20878 _values!1231) e!520318)))

(assert (=> start!79050 tp!60285))

(declare-fun array_inv!20879 (array!55515) Bool)

(assert (=> start!79050 (array_inv!20879 _keys!1487)))

(declare-fun b!926892 () Bool)

(declare-fun e!520316 () Bool)

(assert (=> b!926892 (= e!520316 tp_is_empty!19789)))

(declare-fun b!926893 () Bool)

(declare-fun res!624425 () Bool)

(assert (=> b!926893 (=> (not res!624425) (not e!520325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55515 (_ BitVec 32)) Bool)

(assert (=> b!926893 (= res!624425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926894 () Bool)

(declare-fun res!624421 () Bool)

(declare-fun e!520314 () Bool)

(assert (=> b!926894 (=> (not res!624421) (not e!520314))))

(declare-fun lt!417534 () ListLongMap!11725)

(assert (=> b!926894 (= res!624421 (= (apply!688 lt!417534 k0!1099) v!791))))

(declare-fun b!926895 () Bool)

(declare-fun mapRes!31440 () Bool)

(assert (=> b!926895 (= e!520318 (and e!520316 mapRes!31440))))

(declare-fun condMapEmpty!31440 () Bool)

(declare-fun mapDefault!31440 () ValueCell!9413)

(assert (=> b!926895 (= condMapEmpty!31440 (= (arr!26704 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9413)) mapDefault!31440)))))

(declare-fun b!926896 () Bool)

(declare-datatypes ((Unit!31261 0))(
  ( (Unit!31262) )
))
(declare-fun e!520322 () Unit!31261)

(declare-fun Unit!31263 () Unit!31261)

(assert (=> b!926896 (= e!520322 Unit!31263)))

(declare-fun b!926897 () Bool)

(assert (=> b!926897 (= e!520319 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31440 () Bool)

(assert (=> mapIsEmpty!31440 mapRes!31440))

(declare-fun b!926898 () Bool)

(declare-fun e!520321 () Bool)

(declare-fun e!520326 () Bool)

(assert (=> b!926898 (= e!520321 e!520326)))

(declare-fun res!624419 () Bool)

(assert (=> b!926898 (=> (not res!624419) (not e!520326))))

(assert (=> b!926898 (= res!624419 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27164 _keys!1487)))))

(declare-fun lt!417535 () Unit!31261)

(declare-fun e!520317 () Unit!31261)

(assert (=> b!926898 (= lt!417535 e!520317)))

(declare-fun c!96760 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926898 (= c!96760 (validKeyInArray!0 k0!1099))))

(declare-fun b!926899 () Bool)

(declare-fun lt!417539 () ListLongMap!11725)

(declare-fun lt!417537 () V!31351)

(assert (=> b!926899 (= (apply!688 lt!417539 k0!1099) lt!417537)))

(declare-fun lt!417541 () Unit!31261)

(declare-fun lt!417546 () (_ BitVec 64))

(declare-fun lt!417542 () V!31351)

(declare-fun addApplyDifferent!394 (ListLongMap!11725 (_ BitVec 64) V!31351 (_ BitVec 64)) Unit!31261)

(assert (=> b!926899 (= lt!417541 (addApplyDifferent!394 lt!417548 lt!417546 lt!417542 k0!1099))))

(assert (=> b!926899 (not (= lt!417546 k0!1099))))

(declare-fun lt!417540 () Unit!31261)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55515 (_ BitVec 64) (_ BitVec 32) List!18808) Unit!31261)

(assert (=> b!926899 (= lt!417540 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18805))))

(assert (=> b!926899 e!520319))

(declare-fun c!96759 () Bool)

(assert (=> b!926899 (= c!96759 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417533 () Unit!31261)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!254 (array!55515 array!55517 (_ BitVec 32) (_ BitVec 32) V!31351 V!31351 (_ BitVec 64) (_ BitVec 32) Int) Unit!31261)

(assert (=> b!926899 (= lt!417533 (lemmaListMapContainsThenArrayContainsFrom!254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!926899 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18805)))

(declare-fun lt!417543 () Unit!31261)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55515 (_ BitVec 32) (_ BitVec 32)) Unit!31261)

(assert (=> b!926899 (= lt!417543 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926899 (contains!4889 lt!417539 k0!1099)))

(declare-fun lt!417545 () tuple2!13038)

(declare-fun +!2766 (ListLongMap!11725 tuple2!13038) ListLongMap!11725)

(assert (=> b!926899 (= lt!417539 (+!2766 lt!417548 lt!417545))))

(declare-fun lt!417538 () Unit!31261)

(declare-fun addStillContains!463 (ListLongMap!11725 (_ BitVec 64) V!31351 (_ BitVec 64)) Unit!31261)

(assert (=> b!926899 (= lt!417538 (addStillContains!463 lt!417548 lt!417546 lt!417542 k0!1099))))

(assert (=> b!926899 (= (getCurrentListMap!3063 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2766 (getCurrentListMap!3063 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417545))))

(assert (=> b!926899 (= lt!417545 (tuple2!13039 lt!417546 lt!417542))))

(declare-fun get!14055 (ValueCell!9413 V!31351) V!31351)

(declare-fun dynLambda!1522 (Int (_ BitVec 64)) V!31351)

(assert (=> b!926899 (= lt!417542 (get!14055 (select (arr!26704 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1522 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417547 () Unit!31261)

(declare-fun lemmaListMapRecursiveValidKeyArray!130 (array!55515 array!55517 (_ BitVec 32) (_ BitVec 32) V!31351 V!31351 (_ BitVec 32) Int) Unit!31261)

(assert (=> b!926899 (= lt!417547 (lemmaListMapRecursiveValidKeyArray!130 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926899 (= e!520322 lt!417541)))

(declare-fun b!926900 () Bool)

(declare-fun res!624423 () Bool)

(assert (=> b!926900 (=> (not res!624423) (not e!520325))))

(assert (=> b!926900 (= res!624423 (and (= (size!27165 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27164 _keys!1487) (size!27165 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926901 () Bool)

(declare-fun e!520323 () Bool)

(assert (=> b!926901 (= e!520323 tp_is_empty!19789)))

(declare-fun b!926902 () Bool)

(declare-fun res!624418 () Bool)

(assert (=> b!926902 (=> (not res!624418) (not e!520325))))

(assert (=> b!926902 (= res!624418 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27164 _keys!1487))))))

(declare-fun b!926903 () Bool)

(declare-fun Unit!31264 () Unit!31261)

(assert (=> b!926903 (= e!520317 Unit!31264)))

(declare-fun b!926904 () Bool)

(assert (=> b!926904 (= e!520317 e!520322)))

(assert (=> b!926904 (= lt!417546 (select (arr!26703 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96758 () Bool)

(assert (=> b!926904 (= c!96758 (validKeyInArray!0 lt!417546))))

(declare-fun b!926905 () Bool)

(assert (=> b!926905 (= e!520314 (not true))))

(assert (=> b!926905 e!520315))

(declare-fun res!624417 () Bool)

(assert (=> b!926905 (=> (not res!624417) (not e!520315))))

(assert (=> b!926905 (= res!624417 (contains!4889 lt!417544 k0!1099))))

(assert (=> b!926905 (= lt!417544 (getCurrentListMap!3063 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417536 () Unit!31261)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!91 (array!55515 array!55517 (_ BitVec 32) (_ BitVec 32) V!31351 V!31351 (_ BitVec 64) V!31351 (_ BitVec 32) Int) Unit!31261)

(assert (=> b!926905 (= lt!417536 (lemmaListMapApplyFromThenApplyFromZero!91 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31440 () Bool)

(declare-fun tp!60284 () Bool)

(assert (=> mapNonEmpty!31440 (= mapRes!31440 (and tp!60284 e!520323))))

(declare-fun mapKey!31440 () (_ BitVec 32))

(declare-fun mapRest!31440 () (Array (_ BitVec 32) ValueCell!9413))

(declare-fun mapValue!31440 () ValueCell!9413)

(assert (=> mapNonEmpty!31440 (= (arr!26704 _values!1231) (store mapRest!31440 mapKey!31440 mapValue!31440))))

(declare-fun b!926906 () Bool)

(assert (=> b!926906 (= e!520324 e!520321)))

(declare-fun res!624415 () Bool)

(assert (=> b!926906 (=> (not res!624415) (not e!520321))))

(assert (=> b!926906 (= res!624415 (and (= lt!417537 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926906 (= lt!417537 (apply!688 lt!417548 k0!1099))))

(declare-fun b!926907 () Bool)

(assert (=> b!926907 (= e!520326 e!520314)))

(declare-fun res!624422 () Bool)

(assert (=> b!926907 (=> (not res!624422) (not e!520314))))

(assert (=> b!926907 (= res!624422 (contains!4889 lt!417534 k0!1099))))

(assert (=> b!926907 (= lt!417534 (getCurrentListMap!3063 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!79050 res!624416) b!926900))

(assert (= (and b!926900 res!624423) b!926893))

(assert (= (and b!926893 res!624425) b!926889))

(assert (= (and b!926889 res!624420) b!926902))

(assert (= (and b!926902 res!624418) b!926890))

(assert (= (and b!926890 res!624424) b!926906))

(assert (= (and b!926906 res!624415) b!926898))

(assert (= (and b!926898 c!96760) b!926904))

(assert (= (and b!926898 (not c!96760)) b!926903))

(assert (= (and b!926904 c!96758) b!926899))

(assert (= (and b!926904 (not c!96758)) b!926896))

(assert (= (and b!926899 c!96759) b!926888))

(assert (= (and b!926899 (not c!96759)) b!926897))

(assert (= (and b!926898 res!624419) b!926907))

(assert (= (and b!926907 res!624422) b!926894))

(assert (= (and b!926894 res!624421) b!926905))

(assert (= (and b!926905 res!624417) b!926891))

(assert (= (and b!926895 condMapEmpty!31440) mapIsEmpty!31440))

(assert (= (and b!926895 (not condMapEmpty!31440)) mapNonEmpty!31440))

(get-info :version)

(assert (= (and mapNonEmpty!31440 ((_ is ValueCellFull!9413) mapValue!31440)) b!926901))

(assert (= (and b!926895 ((_ is ValueCellFull!9413) mapDefault!31440)) b!926892))

(assert (= start!79050 b!926895))

(declare-fun b_lambda!13765 () Bool)

(assert (=> (not b_lambda!13765) (not b!926899)))

(declare-fun t!26809 () Bool)

(declare-fun tb!5853 () Bool)

(assert (=> (and start!79050 (= defaultEntry!1235 defaultEntry!1235) t!26809) tb!5853))

(declare-fun result!11537 () Bool)

(assert (=> tb!5853 (= result!11537 tp_is_empty!19789)))

(assert (=> b!926899 t!26809))

(declare-fun b_and!28275 () Bool)

(assert (= b_and!28273 (and (=> t!26809 result!11537) b_and!28275)))

(declare-fun m!861007 () Bool)

(assert (=> b!926894 m!861007))

(declare-fun m!861009 () Bool)

(assert (=> b!926906 m!861009))

(declare-fun m!861011 () Bool)

(assert (=> b!926893 m!861011))

(declare-fun m!861013 () Bool)

(assert (=> b!926890 m!861013))

(declare-fun m!861015 () Bool)

(assert (=> b!926890 m!861015))

(declare-fun m!861017 () Bool)

(assert (=> b!926904 m!861017))

(declare-fun m!861019 () Bool)

(assert (=> b!926904 m!861019))

(declare-fun m!861021 () Bool)

(assert (=> b!926888 m!861021))

(declare-fun m!861023 () Bool)

(assert (=> mapNonEmpty!31440 m!861023))

(declare-fun m!861025 () Bool)

(assert (=> start!79050 m!861025))

(declare-fun m!861027 () Bool)

(assert (=> start!79050 m!861027))

(declare-fun m!861029 () Bool)

(assert (=> start!79050 m!861029))

(declare-fun m!861031 () Bool)

(assert (=> b!926889 m!861031))

(declare-fun m!861033 () Bool)

(assert (=> b!926891 m!861033))

(declare-fun m!861035 () Bool)

(assert (=> b!926905 m!861035))

(declare-fun m!861037 () Bool)

(assert (=> b!926905 m!861037))

(declare-fun m!861039 () Bool)

(assert (=> b!926905 m!861039))

(declare-fun m!861041 () Bool)

(assert (=> b!926907 m!861041))

(declare-fun m!861043 () Bool)

(assert (=> b!926907 m!861043))

(declare-fun m!861045 () Bool)

(assert (=> b!926898 m!861045))

(declare-fun m!861047 () Bool)

(assert (=> b!926899 m!861047))

(declare-fun m!861049 () Bool)

(assert (=> b!926899 m!861049))

(declare-fun m!861051 () Bool)

(assert (=> b!926899 m!861051))

(declare-fun m!861053 () Bool)

(assert (=> b!926899 m!861053))

(declare-fun m!861055 () Bool)

(assert (=> b!926899 m!861055))

(declare-fun m!861057 () Bool)

(assert (=> b!926899 m!861057))

(assert (=> b!926899 m!861053))

(assert (=> b!926899 m!861055))

(declare-fun m!861059 () Bool)

(assert (=> b!926899 m!861059))

(declare-fun m!861061 () Bool)

(assert (=> b!926899 m!861061))

(declare-fun m!861063 () Bool)

(assert (=> b!926899 m!861063))

(declare-fun m!861065 () Bool)

(assert (=> b!926899 m!861065))

(declare-fun m!861067 () Bool)

(assert (=> b!926899 m!861067))

(declare-fun m!861069 () Bool)

(assert (=> b!926899 m!861069))

(declare-fun m!861071 () Bool)

(assert (=> b!926899 m!861071))

(declare-fun m!861073 () Bool)

(assert (=> b!926899 m!861073))

(assert (=> b!926899 m!861043))

(assert (=> b!926899 m!861067))

(declare-fun m!861075 () Bool)

(assert (=> b!926899 m!861075))

(check-sat tp_is_empty!19789 (not b!926898) (not b_next!17281) (not b!926889) (not b!926904) (not mapNonEmpty!31440) (not b!926888) (not b!926907) (not b!926905) (not b!926894) (not b_lambda!13765) (not start!79050) (not b!926899) (not b!926906) b_and!28275 (not b!926890) (not b!926891) (not b!926893))
(check-sat b_and!28275 (not b_next!17281))
