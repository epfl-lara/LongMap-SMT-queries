; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78984 () Bool)

(assert start!78984)

(declare-fun b_free!17215 () Bool)

(declare-fun b_next!17215 () Bool)

(assert (=> start!78984 (= b_free!17215 (not b_next!17215))))

(declare-fun tp!60086 () Bool)

(declare-fun b_and!28141 () Bool)

(assert (=> start!78984 (= tp!60086 b_and!28141)))

(declare-fun b!924842 () Bool)

(declare-fun e!519035 () Bool)

(declare-fun e!519031 () Bool)

(assert (=> b!924842 (= e!519035 e!519031)))

(declare-fun res!623331 () Bool)

(assert (=> b!924842 (=> (not res!623331) (not e!519031))))

(declare-datatypes ((V!31263 0))(
  ( (V!31264 (val!9912 Int)) )
))
(declare-datatypes ((tuple2!12982 0))(
  ( (tuple2!12983 (_1!6502 (_ BitVec 64)) (_2!6502 V!31263)) )
))
(declare-datatypes ((List!18757 0))(
  ( (Nil!18754) (Cons!18753 (h!19899 tuple2!12982) (t!26693 List!18757)) )
))
(declare-datatypes ((ListLongMap!11669 0))(
  ( (ListLongMap!11670 (toList!5850 List!18757)) )
))
(declare-fun lt!415960 () ListLongMap!11669)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4862 (ListLongMap!11669 (_ BitVec 64)) Bool)

(assert (=> b!924842 (= res!623331 (contains!4862 lt!415960 k0!1099))))

(declare-datatypes ((array!55391 0))(
  ( (array!55392 (arr!26641 (Array (_ BitVec 32) (_ BitVec 64))) (size!27102 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55391)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9380 0))(
  ( (ValueCellFull!9380 (v!12429 V!31263)) (EmptyCell!9380) )
))
(declare-datatypes ((array!55393 0))(
  ( (array!55394 (arr!26642 (Array (_ BitVec 32) ValueCell!9380)) (size!27103 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55393)

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31263)

(declare-fun minValue!1173 () V!31263)

(declare-fun getCurrentListMap!3036 (array!55391 array!55393 (_ BitVec 32) (_ BitVec 32) V!31263 V!31263 (_ BitVec 32) Int) ListLongMap!11669)

(assert (=> b!924842 (= lt!415960 (getCurrentListMap!3036 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924843 () Bool)

(declare-fun lt!415962 () ListLongMap!11669)

(declare-fun lt!415963 () V!31263)

(declare-fun apply!661 (ListLongMap!11669 (_ BitVec 64)) V!31263)

(assert (=> b!924843 (= (apply!661 lt!415962 k0!1099) lt!415963)))

(declare-datatypes ((Unit!31157 0))(
  ( (Unit!31158) )
))
(declare-fun lt!415955 () Unit!31157)

(declare-fun lt!415957 () (_ BitVec 64))

(declare-fun lt!415950 () V!31263)

(declare-fun addApplyDifferent!374 (ListLongMap!11669 (_ BitVec 64) V!31263 (_ BitVec 64)) Unit!31157)

(assert (=> b!924843 (= lt!415955 (addApplyDifferent!374 lt!415960 lt!415957 lt!415950 k0!1099))))

(assert (=> b!924843 (not (= lt!415957 k0!1099))))

(declare-fun lt!415958 () Unit!31157)

(declare-datatypes ((List!18758 0))(
  ( (Nil!18755) (Cons!18754 (h!19900 (_ BitVec 64)) (t!26694 List!18758)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55391 (_ BitVec 64) (_ BitVec 32) List!18758) Unit!31157)

(assert (=> b!924843 (= lt!415958 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18755))))

(declare-fun e!519033 () Bool)

(assert (=> b!924843 e!519033))

(declare-fun c!96463 () Bool)

(assert (=> b!924843 (= c!96463 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415949 () Unit!31157)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!234 (array!55391 array!55393 (_ BitVec 32) (_ BitVec 32) V!31263 V!31263 (_ BitVec 64) (_ BitVec 32) Int) Unit!31157)

(assert (=> b!924843 (= lt!415949 (lemmaListMapContainsThenArrayContainsFrom!234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55391 (_ BitVec 32) List!18758) Bool)

(assert (=> b!924843 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18755)))

(declare-fun lt!415964 () Unit!31157)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55391 (_ BitVec 32) (_ BitVec 32)) Unit!31157)

(assert (=> b!924843 (= lt!415964 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924843 (contains!4862 lt!415962 k0!1099)))

(declare-fun lt!415953 () tuple2!12982)

(declare-fun +!2746 (ListLongMap!11669 tuple2!12982) ListLongMap!11669)

(assert (=> b!924843 (= lt!415962 (+!2746 lt!415960 lt!415953))))

(declare-fun lt!415956 () Unit!31157)

(declare-fun addStillContains!443 (ListLongMap!11669 (_ BitVec 64) V!31263 (_ BitVec 64)) Unit!31157)

(assert (=> b!924843 (= lt!415956 (addStillContains!443 lt!415960 lt!415957 lt!415950 k0!1099))))

(assert (=> b!924843 (= (getCurrentListMap!3036 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2746 (getCurrentListMap!3036 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415953))))

(assert (=> b!924843 (= lt!415953 (tuple2!12983 lt!415957 lt!415950))))

(declare-fun get!14013 (ValueCell!9380 V!31263) V!31263)

(declare-fun dynLambda!1502 (Int (_ BitVec 64)) V!31263)

(assert (=> b!924843 (= lt!415950 (get!14013 (select (arr!26642 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1502 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415952 () Unit!31157)

(declare-fun lemmaListMapRecursiveValidKeyArray!110 (array!55391 array!55393 (_ BitVec 32) (_ BitVec 32) V!31263 V!31263 (_ BitVec 32) Int) Unit!31157)

(assert (=> b!924843 (= lt!415952 (lemmaListMapRecursiveValidKeyArray!110 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519029 () Unit!31157)

(assert (=> b!924843 (= e!519029 lt!415955)))

(declare-fun b!924844 () Bool)

(declare-fun res!623335 () Bool)

(assert (=> b!924844 (=> (not res!623335) (not e!519035))))

(assert (=> b!924844 (= res!623335 (and (= (size!27103 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27102 _keys!1487) (size!27103 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31341 () Bool)

(declare-fun mapRes!31341 () Bool)

(declare-fun tp!60087 () Bool)

(declare-fun e!519034 () Bool)

(assert (=> mapNonEmpty!31341 (= mapRes!31341 (and tp!60087 e!519034))))

(declare-fun mapValue!31341 () ValueCell!9380)

(declare-fun mapRest!31341 () (Array (_ BitVec 32) ValueCell!9380))

(declare-fun mapKey!31341 () (_ BitVec 32))

(assert (=> mapNonEmpty!31341 (= (arr!26642 _values!1231) (store mapRest!31341 mapKey!31341 mapValue!31341))))

(declare-fun b!924845 () Bool)

(declare-fun tp_is_empty!19723 () Bool)

(assert (=> b!924845 (= e!519034 tp_is_empty!19723)))

(declare-fun v!791 () V!31263)

(declare-fun lt!415954 () ListLongMap!11669)

(declare-fun e!519032 () Bool)

(declare-fun b!924846 () Bool)

(assert (=> b!924846 (= e!519032 (= (apply!661 lt!415954 k0!1099) v!791))))

(declare-fun b!924847 () Bool)

(declare-fun e!519039 () Bool)

(declare-fun e!519028 () Bool)

(assert (=> b!924847 (= e!519039 e!519028)))

(declare-fun res!623326 () Bool)

(assert (=> b!924847 (=> (not res!623326) (not e!519028))))

(declare-fun lt!415961 () ListLongMap!11669)

(assert (=> b!924847 (= res!623326 (contains!4862 lt!415961 k0!1099))))

(assert (=> b!924847 (= lt!415961 (getCurrentListMap!3036 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924848 () Bool)

(assert (=> b!924848 (= e!519028 (not true))))

(assert (=> b!924848 e!519032))

(declare-fun res!623336 () Bool)

(assert (=> b!924848 (=> (not res!623336) (not e!519032))))

(assert (=> b!924848 (= res!623336 (contains!4862 lt!415954 k0!1099))))

(assert (=> b!924848 (= lt!415954 (getCurrentListMap!3036 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!415959 () Unit!31157)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!72 (array!55391 array!55393 (_ BitVec 32) (_ BitVec 32) V!31263 V!31263 (_ BitVec 64) V!31263 (_ BitVec 32) Int) Unit!31157)

(assert (=> b!924848 (= lt!415959 (lemmaListMapApplyFromThenApplyFromZero!72 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924849 () Bool)

(declare-fun e!519037 () Bool)

(assert (=> b!924849 (= e!519031 e!519037)))

(declare-fun res!623333 () Bool)

(assert (=> b!924849 (=> (not res!623333) (not e!519037))))

(assert (=> b!924849 (= res!623333 (and (= lt!415963 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924849 (= lt!415963 (apply!661 lt!415960 k0!1099))))

(declare-fun b!924850 () Bool)

(declare-fun e!519038 () Unit!31157)

(declare-fun Unit!31159 () Unit!31157)

(assert (=> b!924850 (= e!519038 Unit!31159)))

(declare-fun mapIsEmpty!31341 () Bool)

(assert (=> mapIsEmpty!31341 mapRes!31341))

(declare-fun b!924851 () Bool)

(declare-fun e!519036 () Bool)

(assert (=> b!924851 (= e!519036 tp_is_empty!19723)))

(declare-fun b!924852 () Bool)

(declare-fun res!623330 () Bool)

(assert (=> b!924852 (=> (not res!623330) (not e!519028))))

(assert (=> b!924852 (= res!623330 (= (apply!661 lt!415961 k0!1099) v!791))))

(declare-fun b!924853 () Bool)

(declare-fun res!623327 () Bool)

(assert (=> b!924853 (=> (not res!623327) (not e!519035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55391 (_ BitVec 32)) Bool)

(assert (=> b!924853 (= res!623327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!623328 () Bool)

(assert (=> start!78984 (=> (not res!623328) (not e!519035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78984 (= res!623328 (validMask!0 mask!1881))))

(assert (=> start!78984 e!519035))

(assert (=> start!78984 true))

(assert (=> start!78984 tp_is_empty!19723))

(declare-fun e!519030 () Bool)

(declare-fun array_inv!20832 (array!55393) Bool)

(assert (=> start!78984 (and (array_inv!20832 _values!1231) e!519030)))

(assert (=> start!78984 tp!60086))

(declare-fun array_inv!20833 (array!55391) Bool)

(assert (=> start!78984 (array_inv!20833 _keys!1487)))

(declare-fun b!924854 () Bool)

(declare-fun Unit!31160 () Unit!31157)

(assert (=> b!924854 (= e!519029 Unit!31160)))

(declare-fun b!924855 () Bool)

(assert (=> b!924855 (= e!519037 e!519039)))

(declare-fun res!623334 () Bool)

(assert (=> b!924855 (=> (not res!623334) (not e!519039))))

(assert (=> b!924855 (= res!623334 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27102 _keys!1487)))))

(declare-fun lt!415951 () Unit!31157)

(assert (=> b!924855 (= lt!415951 e!519038)))

(declare-fun c!96461 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924855 (= c!96461 (validKeyInArray!0 k0!1099))))

(declare-fun b!924856 () Bool)

(declare-fun arrayContainsKey!0 (array!55391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924856 (= e!519033 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924857 () Bool)

(assert (=> b!924857 (= e!519030 (and e!519036 mapRes!31341))))

(declare-fun condMapEmpty!31341 () Bool)

(declare-fun mapDefault!31341 () ValueCell!9380)

(assert (=> b!924857 (= condMapEmpty!31341 (= (arr!26642 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9380)) mapDefault!31341)))))

(declare-fun b!924858 () Bool)

(assert (=> b!924858 (= e!519038 e!519029)))

(assert (=> b!924858 (= lt!415957 (select (arr!26641 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96462 () Bool)

(assert (=> b!924858 (= c!96462 (validKeyInArray!0 lt!415957))))

(declare-fun b!924859 () Bool)

(declare-fun res!623332 () Bool)

(assert (=> b!924859 (=> (not res!623332) (not e!519035))))

(assert (=> b!924859 (= res!623332 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18755))))

(declare-fun b!924860 () Bool)

(declare-fun res!623329 () Bool)

(assert (=> b!924860 (=> (not res!623329) (not e!519035))))

(assert (=> b!924860 (= res!623329 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27102 _keys!1487))))))

(declare-fun b!924861 () Bool)

(assert (=> b!924861 (= e!519033 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!78984 res!623328) b!924844))

(assert (= (and b!924844 res!623335) b!924853))

(assert (= (and b!924853 res!623327) b!924859))

(assert (= (and b!924859 res!623332) b!924860))

(assert (= (and b!924860 res!623329) b!924842))

(assert (= (and b!924842 res!623331) b!924849))

(assert (= (and b!924849 res!623333) b!924855))

(assert (= (and b!924855 c!96461) b!924858))

(assert (= (and b!924855 (not c!96461)) b!924850))

(assert (= (and b!924858 c!96462) b!924843))

(assert (= (and b!924858 (not c!96462)) b!924854))

(assert (= (and b!924843 c!96463) b!924856))

(assert (= (and b!924843 (not c!96463)) b!924861))

(assert (= (and b!924855 res!623334) b!924847))

(assert (= (and b!924847 res!623326) b!924852))

(assert (= (and b!924852 res!623330) b!924848))

(assert (= (and b!924848 res!623336) b!924846))

(assert (= (and b!924857 condMapEmpty!31341) mapIsEmpty!31341))

(assert (= (and b!924857 (not condMapEmpty!31341)) mapNonEmpty!31341))

(get-info :version)

(assert (= (and mapNonEmpty!31341 ((_ is ValueCellFull!9380) mapValue!31341)) b!924845))

(assert (= (and b!924857 ((_ is ValueCellFull!9380) mapDefault!31341)) b!924851))

(assert (= start!78984 b!924857))

(declare-fun b_lambda!13699 () Bool)

(assert (=> (not b_lambda!13699) (not b!924843)))

(declare-fun t!26692 () Bool)

(declare-fun tb!5787 () Bool)

(assert (=> (and start!78984 (= defaultEntry!1235 defaultEntry!1235) t!26692) tb!5787))

(declare-fun result!11405 () Bool)

(assert (=> tb!5787 (= result!11405 tp_is_empty!19723)))

(assert (=> b!924843 t!26692))

(declare-fun b_and!28143 () Bool)

(assert (= b_and!28141 (and (=> t!26692 result!11405) b_and!28143)))

(declare-fun m!858697 () Bool)

(assert (=> b!924858 m!858697))

(declare-fun m!858699 () Bool)

(assert (=> b!924858 m!858699))

(declare-fun m!858701 () Bool)

(assert (=> b!924843 m!858701))

(declare-fun m!858703 () Bool)

(assert (=> b!924843 m!858703))

(declare-fun m!858705 () Bool)

(assert (=> b!924843 m!858705))

(declare-fun m!858707 () Bool)

(assert (=> b!924843 m!858707))

(declare-fun m!858709 () Bool)

(assert (=> b!924843 m!858709))

(declare-fun m!858711 () Bool)

(assert (=> b!924843 m!858711))

(declare-fun m!858713 () Bool)

(assert (=> b!924843 m!858713))

(declare-fun m!858715 () Bool)

(assert (=> b!924843 m!858715))

(declare-fun m!858717 () Bool)

(assert (=> b!924843 m!858717))

(declare-fun m!858719 () Bool)

(assert (=> b!924843 m!858719))

(assert (=> b!924843 m!858705))

(assert (=> b!924843 m!858707))

(declare-fun m!858721 () Bool)

(assert (=> b!924843 m!858721))

(declare-fun m!858723 () Bool)

(assert (=> b!924843 m!858723))

(declare-fun m!858725 () Bool)

(assert (=> b!924843 m!858725))

(declare-fun m!858727 () Bool)

(assert (=> b!924843 m!858727))

(assert (=> b!924843 m!858721))

(declare-fun m!858729 () Bool)

(assert (=> b!924843 m!858729))

(declare-fun m!858731 () Bool)

(assert (=> b!924843 m!858731))

(declare-fun m!858733 () Bool)

(assert (=> b!924853 m!858733))

(declare-fun m!858735 () Bool)

(assert (=> b!924847 m!858735))

(assert (=> b!924847 m!858711))

(declare-fun m!858737 () Bool)

(assert (=> b!924852 m!858737))

(declare-fun m!858739 () Bool)

(assert (=> b!924855 m!858739))

(declare-fun m!858741 () Bool)

(assert (=> b!924848 m!858741))

(declare-fun m!858743 () Bool)

(assert (=> b!924848 m!858743))

(declare-fun m!858745 () Bool)

(assert (=> b!924848 m!858745))

(declare-fun m!858747 () Bool)

(assert (=> b!924856 m!858747))

(declare-fun m!858749 () Bool)

(assert (=> b!924846 m!858749))

(declare-fun m!858751 () Bool)

(assert (=> b!924842 m!858751))

(declare-fun m!858753 () Bool)

(assert (=> b!924842 m!858753))

(declare-fun m!858755 () Bool)

(assert (=> b!924849 m!858755))

(declare-fun m!858757 () Bool)

(assert (=> start!78984 m!858757))

(declare-fun m!858759 () Bool)

(assert (=> start!78984 m!858759))

(declare-fun m!858761 () Bool)

(assert (=> start!78984 m!858761))

(declare-fun m!858763 () Bool)

(assert (=> mapNonEmpty!31341 m!858763))

(declare-fun m!858765 () Bool)

(assert (=> b!924859 m!858765))

(check-sat (not mapNonEmpty!31341) (not b!924842) (not b!924859) (not b_lambda!13699) (not b!924856) (not start!78984) (not b!924848) (not b!924846) (not b!924852) b_and!28143 (not b!924853) (not b_next!17215) (not b!924847) tp_is_empty!19723 (not b!924858) (not b!924849) (not b!924843) (not b!924855))
(check-sat b_and!28143 (not b_next!17215))
