; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79652 () Bool)

(assert start!79652)

(declare-fun b_free!17719 () Bool)

(declare-fun b_next!17719 () Bool)

(assert (=> start!79652 (= b_free!17719 (not b_next!17719))))

(declare-fun tp!61614 () Bool)

(declare-fun b_and!29003 () Bool)

(assert (=> start!79652 (= tp!61614 b_and!29003)))

(declare-fun b!936699 () Bool)

(declare-datatypes ((Unit!31517 0))(
  ( (Unit!31518) )
))
(declare-fun e!525968 () Unit!31517)

(declare-fun Unit!31519 () Unit!31517)

(assert (=> b!936699 (= e!525968 Unit!31519)))

(declare-fun b!936700 () Bool)

(declare-fun e!525965 () Unit!31517)

(assert (=> b!936700 (= e!525965 e!525968)))

(declare-fun lt!422385 () (_ BitVec 64))

(declare-datatypes ((array!56361 0))(
  ( (array!56362 (arr!27121 (Array (_ BitVec 32) (_ BitVec 64))) (size!27582 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56361)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!936700 (= lt!422385 (select (arr!27121 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97423 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936700 (= c!97423 (validKeyInArray!0 lt!422385))))

(declare-fun b!936701 () Bool)

(declare-fun e!525960 () Bool)

(assert (=> b!936701 (= e!525960 false)))

(declare-fun lt!422378 () Unit!31517)

(assert (=> b!936701 (= lt!422378 e!525965)))

(declare-fun c!97421 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!936701 (= c!97421 (validKeyInArray!0 k0!1099))))

(declare-fun b!936702 () Bool)

(declare-fun Unit!31520 () Unit!31517)

(assert (=> b!936702 (= e!525965 Unit!31520)))

(declare-fun b!936703 () Bool)

(declare-fun res!630638 () Bool)

(declare-fun e!525962 () Bool)

(assert (=> b!936703 (=> (not res!630638) (not e!525962))))

(declare-datatypes ((List!19149 0))(
  ( (Nil!19146) (Cons!19145 (h!20291 (_ BitVec 64)) (t!27403 List!19149)) )
))
(declare-fun arrayNoDuplicates!0 (array!56361 (_ BitVec 32) List!19149) Bool)

(assert (=> b!936703 (= res!630638 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19146))))

(declare-fun res!630635 () Bool)

(assert (=> start!79652 (=> (not res!630635) (not e!525962))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79652 (= res!630635 (validMask!0 mask!1881))))

(assert (=> start!79652 e!525962))

(assert (=> start!79652 true))

(declare-fun tp_is_empty!20227 () Bool)

(assert (=> start!79652 tp_is_empty!20227))

(declare-datatypes ((V!31935 0))(
  ( (V!31936 (val!10164 Int)) )
))
(declare-datatypes ((ValueCell!9632 0))(
  ( (ValueCellFull!9632 (v!12688 V!31935)) (EmptyCell!9632) )
))
(declare-datatypes ((array!56363 0))(
  ( (array!56364 (arr!27122 (Array (_ BitVec 32) ValueCell!9632)) (size!27583 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56363)

(declare-fun e!525963 () Bool)

(declare-fun array_inv!21162 (array!56363) Bool)

(assert (=> start!79652 (and (array_inv!21162 _values!1231) e!525963)))

(assert (=> start!79652 tp!61614))

(declare-fun array_inv!21163 (array!56361) Bool)

(assert (=> start!79652 (array_inv!21163 _keys!1487)))

(declare-fun b!936704 () Bool)

(declare-fun res!630632 () Bool)

(assert (=> b!936704 (=> (not res!630632) (not e!525962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56361 (_ BitVec 32)) Bool)

(assert (=> b!936704 (= res!630632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936705 () Bool)

(declare-fun res!630634 () Bool)

(assert (=> b!936705 (=> (not res!630634) (not e!525962))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!936705 (= res!630634 (and (= (size!27583 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27582 _keys!1487) (size!27583 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936706 () Bool)

(declare-fun e!525961 () Bool)

(assert (=> b!936706 (= e!525961 tp_is_empty!20227)))

(declare-fun b!936707 () Bool)

(declare-fun res!630633 () Bool)

(assert (=> b!936707 (=> (not res!630633) (not e!525962))))

(assert (=> b!936707 (= res!630633 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27582 _keys!1487))))))

(declare-fun b!936708 () Bool)

(declare-fun e!525964 () Bool)

(assert (=> b!936708 (= e!525964 e!525960)))

(declare-fun res!630636 () Bool)

(assert (=> b!936708 (=> (not res!630636) (not e!525960))))

(declare-fun v!791 () V!31935)

(declare-fun lt!422384 () V!31935)

(assert (=> b!936708 (= res!630636 (and (= lt!422384 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13404 0))(
  ( (tuple2!13405 (_1!6713 (_ BitVec 64)) (_2!6713 V!31935)) )
))
(declare-datatypes ((List!19150 0))(
  ( (Nil!19147) (Cons!19146 (h!20292 tuple2!13404) (t!27404 List!19150)) )
))
(declare-datatypes ((ListLongMap!12091 0))(
  ( (ListLongMap!12092 (toList!6061 List!19150)) )
))
(declare-fun lt!422376 () ListLongMap!12091)

(declare-fun apply!836 (ListLongMap!12091 (_ BitVec 64)) V!31935)

(assert (=> b!936708 (= lt!422384 (apply!836 lt!422376 k0!1099))))

(declare-fun b!936709 () Bool)

(declare-fun mapRes!32112 () Bool)

(assert (=> b!936709 (= e!525963 (and e!525961 mapRes!32112))))

(declare-fun condMapEmpty!32112 () Bool)

(declare-fun mapDefault!32112 () ValueCell!9632)

(assert (=> b!936709 (= condMapEmpty!32112 (= (arr!27122 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9632)) mapDefault!32112)))))

(declare-fun b!936710 () Bool)

(declare-fun e!525959 () Bool)

(declare-fun arrayContainsKey!0 (array!56361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936710 (= e!525959 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!32112 () Bool)

(assert (=> mapIsEmpty!32112 mapRes!32112))

(declare-fun b!936711 () Bool)

(assert (=> b!936711 (= e!525959 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32112 () Bool)

(declare-fun tp!61613 () Bool)

(declare-fun e!525966 () Bool)

(assert (=> mapNonEmpty!32112 (= mapRes!32112 (and tp!61613 e!525966))))

(declare-fun mapRest!32112 () (Array (_ BitVec 32) ValueCell!9632))

(declare-fun mapValue!32112 () ValueCell!9632)

(declare-fun mapKey!32112 () (_ BitVec 32))

(assert (=> mapNonEmpty!32112 (= (arr!27122 _values!1231) (store mapRest!32112 mapKey!32112 mapValue!32112))))

(declare-fun b!936712 () Bool)

(assert (=> b!936712 (= e!525962 e!525964)))

(declare-fun res!630637 () Bool)

(assert (=> b!936712 (=> (not res!630637) (not e!525964))))

(declare-fun contains!5063 (ListLongMap!12091 (_ BitVec 64)) Bool)

(assert (=> b!936712 (= res!630637 (contains!5063 lt!422376 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31935)

(declare-fun minValue!1173 () V!31935)

(declare-fun getCurrentListMap!3225 (array!56361 array!56363 (_ BitVec 32) (_ BitVec 32) V!31935 V!31935 (_ BitVec 32) Int) ListLongMap!12091)

(assert (=> b!936712 (= lt!422376 (getCurrentListMap!3225 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936713 () Bool)

(declare-fun lt!422383 () ListLongMap!12091)

(assert (=> b!936713 (= (apply!836 lt!422383 k0!1099) lt!422384)))

(declare-fun lt!422379 () Unit!31517)

(declare-fun lt!422381 () V!31935)

(declare-fun addApplyDifferent!421 (ListLongMap!12091 (_ BitVec 64) V!31935 (_ BitVec 64)) Unit!31517)

(assert (=> b!936713 (= lt!422379 (addApplyDifferent!421 lt!422376 lt!422385 lt!422381 k0!1099))))

(assert (=> b!936713 (not (= lt!422385 k0!1099))))

(declare-fun lt!422386 () Unit!31517)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56361 (_ BitVec 64) (_ BitVec 32) List!19149) Unit!31517)

(assert (=> b!936713 (= lt!422386 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19146))))

(assert (=> b!936713 e!525959))

(declare-fun c!97422 () Bool)

(assert (=> b!936713 (= c!97422 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422380 () Unit!31517)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!299 (array!56361 array!56363 (_ BitVec 32) (_ BitVec 32) V!31935 V!31935 (_ BitVec 64) (_ BitVec 32) Int) Unit!31517)

(assert (=> b!936713 (= lt!422380 (lemmaListMapContainsThenArrayContainsFrom!299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!936713 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19146)))

(declare-fun lt!422387 () Unit!31517)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56361 (_ BitVec 32) (_ BitVec 32)) Unit!31517)

(assert (=> b!936713 (= lt!422387 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!936713 (contains!5063 lt!422383 k0!1099)))

(declare-fun lt!422388 () tuple2!13404)

(declare-fun +!2852 (ListLongMap!12091 tuple2!13404) ListLongMap!12091)

(assert (=> b!936713 (= lt!422383 (+!2852 lt!422376 lt!422388))))

(declare-fun lt!422382 () Unit!31517)

(declare-fun addStillContains!541 (ListLongMap!12091 (_ BitVec 64) V!31935 (_ BitVec 64)) Unit!31517)

(assert (=> b!936713 (= lt!422382 (addStillContains!541 lt!422376 lt!422385 lt!422381 k0!1099))))

(assert (=> b!936713 (= (getCurrentListMap!3225 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2852 (getCurrentListMap!3225 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422388))))

(assert (=> b!936713 (= lt!422388 (tuple2!13405 lt!422385 lt!422381))))

(declare-fun get!14302 (ValueCell!9632 V!31935) V!31935)

(declare-fun dynLambda!1608 (Int (_ BitVec 64)) V!31935)

(assert (=> b!936713 (= lt!422381 (get!14302 (select (arr!27122 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1608 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422377 () Unit!31517)

(declare-fun lemmaListMapRecursiveValidKeyArray!216 (array!56361 array!56363 (_ BitVec 32) (_ BitVec 32) V!31935 V!31935 (_ BitVec 32) Int) Unit!31517)

(assert (=> b!936713 (= lt!422377 (lemmaListMapRecursiveValidKeyArray!216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!936713 (= e!525968 lt!422379)))

(declare-fun b!936714 () Bool)

(assert (=> b!936714 (= e!525966 tp_is_empty!20227)))

(assert (= (and start!79652 res!630635) b!936705))

(assert (= (and b!936705 res!630634) b!936704))

(assert (= (and b!936704 res!630632) b!936703))

(assert (= (and b!936703 res!630638) b!936707))

(assert (= (and b!936707 res!630633) b!936712))

(assert (= (and b!936712 res!630637) b!936708))

(assert (= (and b!936708 res!630636) b!936701))

(assert (= (and b!936701 c!97421) b!936700))

(assert (= (and b!936701 (not c!97421)) b!936702))

(assert (= (and b!936700 c!97423) b!936713))

(assert (= (and b!936700 (not c!97423)) b!936699))

(assert (= (and b!936713 c!97422) b!936710))

(assert (= (and b!936713 (not c!97422)) b!936711))

(assert (= (and b!936709 condMapEmpty!32112) mapIsEmpty!32112))

(assert (= (and b!936709 (not condMapEmpty!32112)) mapNonEmpty!32112))

(get-info :version)

(assert (= (and mapNonEmpty!32112 ((_ is ValueCellFull!9632) mapValue!32112)) b!936714))

(assert (= (and b!936709 ((_ is ValueCellFull!9632) mapDefault!32112)) b!936706))

(assert (= start!79652 b!936709))

(declare-fun b_lambda!14107 () Bool)

(assert (=> (not b_lambda!14107) (not b!936713)))

(declare-fun t!27402 () Bool)

(declare-fun tb!6105 () Bool)

(assert (=> (and start!79652 (= defaultEntry!1235 defaultEntry!1235) t!27402) tb!6105))

(declare-fun result!12051 () Bool)

(assert (=> tb!6105 (= result!12051 tp_is_empty!20227)))

(assert (=> b!936713 t!27402))

(declare-fun b_and!29005 () Bool)

(assert (= b_and!29003 (and (=> t!27402 result!12051) b_and!29005)))

(declare-fun m!870863 () Bool)

(assert (=> b!936712 m!870863))

(declare-fun m!870865 () Bool)

(assert (=> b!936712 m!870865))

(declare-fun m!870867 () Bool)

(assert (=> b!936701 m!870867))

(declare-fun m!870869 () Bool)

(assert (=> mapNonEmpty!32112 m!870869))

(declare-fun m!870871 () Bool)

(assert (=> b!936700 m!870871))

(declare-fun m!870873 () Bool)

(assert (=> b!936700 m!870873))

(declare-fun m!870875 () Bool)

(assert (=> b!936713 m!870875))

(declare-fun m!870877 () Bool)

(assert (=> b!936713 m!870877))

(declare-fun m!870879 () Bool)

(assert (=> b!936713 m!870879))

(declare-fun m!870881 () Bool)

(assert (=> b!936713 m!870881))

(assert (=> b!936713 m!870879))

(declare-fun m!870883 () Bool)

(assert (=> b!936713 m!870883))

(declare-fun m!870885 () Bool)

(assert (=> b!936713 m!870885))

(declare-fun m!870887 () Bool)

(assert (=> b!936713 m!870887))

(declare-fun m!870889 () Bool)

(assert (=> b!936713 m!870889))

(declare-fun m!870891 () Bool)

(assert (=> b!936713 m!870891))

(declare-fun m!870893 () Bool)

(assert (=> b!936713 m!870893))

(declare-fun m!870895 () Bool)

(assert (=> b!936713 m!870895))

(declare-fun m!870897 () Bool)

(assert (=> b!936713 m!870897))

(declare-fun m!870899 () Bool)

(assert (=> b!936713 m!870899))

(declare-fun m!870901 () Bool)

(assert (=> b!936713 m!870901))

(declare-fun m!870903 () Bool)

(assert (=> b!936713 m!870903))

(assert (=> b!936713 m!870881))

(assert (=> b!936713 m!870891))

(declare-fun m!870905 () Bool)

(assert (=> b!936713 m!870905))

(declare-fun m!870907 () Bool)

(assert (=> b!936704 m!870907))

(declare-fun m!870909 () Bool)

(assert (=> b!936703 m!870909))

(declare-fun m!870911 () Bool)

(assert (=> b!936710 m!870911))

(declare-fun m!870913 () Bool)

(assert (=> b!936708 m!870913))

(declare-fun m!870915 () Bool)

(assert (=> start!79652 m!870915))

(declare-fun m!870917 () Bool)

(assert (=> start!79652 m!870917))

(declare-fun m!870919 () Bool)

(assert (=> start!79652 m!870919))

(check-sat (not b!936712) (not b!936701) (not b_next!17719) (not mapNonEmpty!32112) (not b!936708) (not start!79652) (not b!936710) tp_is_empty!20227 (not b_lambda!14107) (not b!936700) (not b!936713) (not b!936703) b_and!29005 (not b!936704))
(check-sat b_and!29005 (not b_next!17719))
