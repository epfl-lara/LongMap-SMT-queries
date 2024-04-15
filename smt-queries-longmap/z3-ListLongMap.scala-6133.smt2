; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78888 () Bool)

(assert start!78888)

(declare-fun b_free!17119 () Bool)

(declare-fun b_next!17119 () Bool)

(assert (=> start!78888 (= b_free!17119 (not b_next!17119))))

(declare-fun tp!59798 () Bool)

(declare-fun b_and!27949 () Bool)

(assert (=> start!78888 (= tp!59798 b_and!27949)))

(declare-fun b!922280 () Bool)

(declare-fun res!621987 () Bool)

(declare-fun e!517469 () Bool)

(assert (=> b!922280 (=> (not res!621987) (not e!517469))))

(declare-datatypes ((array!55205 0))(
  ( (array!55206 (arr!26548 (Array (_ BitVec 32) (_ BitVec 64))) (size!27009 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55205)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55205 (_ BitVec 32)) Bool)

(assert (=> b!922280 (= res!621987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922281 () Bool)

(declare-fun e!517475 () Bool)

(declare-fun tp_is_empty!19627 () Bool)

(assert (=> b!922281 (= e!517475 tp_is_empty!19627)))

(declare-fun b!922282 () Bool)

(declare-fun e!517471 () Bool)

(assert (=> b!922282 (= e!517471 tp_is_empty!19627)))

(declare-fun b!922283 () Bool)

(declare-fun res!621989 () Bool)

(assert (=> b!922283 (=> (not res!621989) (not e!517469))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31135 0))(
  ( (V!31136 (val!9864 Int)) )
))
(declare-datatypes ((ValueCell!9332 0))(
  ( (ValueCellFull!9332 (v!12381 V!31135)) (EmptyCell!9332) )
))
(declare-datatypes ((array!55207 0))(
  ( (array!55208 (arr!26549 (Array (_ BitVec 32) ValueCell!9332)) (size!27010 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55207)

(assert (=> b!922283 (= res!621989 (and (= (size!27010 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27009 _keys!1487) (size!27010 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922284 () Bool)

(declare-fun res!621988 () Bool)

(declare-fun e!517470 () Bool)

(assert (=> b!922284 (=> (not res!621988) (not e!517470))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922284 (= res!621988 (validKeyInArray!0 k0!1099))))

(declare-fun b!922285 () Bool)

(declare-fun res!621986 () Bool)

(assert (=> b!922285 (=> (not res!621986) (not e!517470))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922285 (= res!621986 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31197 () Bool)

(declare-fun mapRes!31197 () Bool)

(assert (=> mapIsEmpty!31197 mapRes!31197))

(declare-fun b!922286 () Bool)

(declare-fun e!517473 () Bool)

(assert (=> b!922286 (= e!517473 (not true))))

(declare-fun lt!414047 () (_ BitVec 64))

(assert (=> b!922286 (not (= lt!414047 k0!1099))))

(declare-datatypes ((Unit!31042 0))(
  ( (Unit!31043) )
))
(declare-fun lt!414045 () Unit!31042)

(declare-datatypes ((List!18681 0))(
  ( (Nil!18678) (Cons!18677 (h!19823 (_ BitVec 64)) (t!26521 List!18681)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55205 (_ BitVec 64) (_ BitVec 32) List!18681) Unit!31042)

(assert (=> b!922286 (= lt!414045 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18678))))

(declare-fun e!517476 () Bool)

(assert (=> b!922286 e!517476))

(declare-fun c!96115 () Bool)

(assert (=> b!922286 (= c!96115 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!414050 () Unit!31042)

(declare-fun zeroValue!1173 () V!31135)

(declare-fun minValue!1173 () V!31135)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!203 (array!55205 array!55207 (_ BitVec 32) (_ BitVec 32) V!31135 V!31135 (_ BitVec 64) (_ BitVec 32) Int) Unit!31042)

(assert (=> b!922286 (= lt!414050 (lemmaListMapContainsThenArrayContainsFrom!203 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55205 (_ BitVec 32) List!18681) Bool)

(assert (=> b!922286 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18678)))

(declare-fun lt!414048 () Unit!31042)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55205 (_ BitVec 32) (_ BitVec 32)) Unit!31042)

(assert (=> b!922286 (= lt!414048 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12898 0))(
  ( (tuple2!12899 (_1!6460 (_ BitVec 64)) (_2!6460 V!31135)) )
))
(declare-datatypes ((List!18682 0))(
  ( (Nil!18679) (Cons!18678 (h!19824 tuple2!12898) (t!26522 List!18682)) )
))
(declare-datatypes ((ListLongMap!11585 0))(
  ( (ListLongMap!11586 (toList!5808 List!18682)) )
))
(declare-fun lt!414046 () ListLongMap!11585)

(declare-fun lt!414049 () tuple2!12898)

(declare-fun contains!4823 (ListLongMap!11585 (_ BitVec 64)) Bool)

(declare-fun +!2715 (ListLongMap!11585 tuple2!12898) ListLongMap!11585)

(assert (=> b!922286 (contains!4823 (+!2715 lt!414046 lt!414049) k0!1099)))

(declare-fun lt!414052 () V!31135)

(declare-fun lt!414051 () Unit!31042)

(declare-fun addStillContains!412 (ListLongMap!11585 (_ BitVec 64) V!31135 (_ BitVec 64)) Unit!31042)

(assert (=> b!922286 (= lt!414051 (addStillContains!412 lt!414046 lt!414047 lt!414052 k0!1099))))

(declare-fun getCurrentListMap!2997 (array!55205 array!55207 (_ BitVec 32) (_ BitVec 32) V!31135 V!31135 (_ BitVec 32) Int) ListLongMap!11585)

(assert (=> b!922286 (= (getCurrentListMap!2997 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2715 (getCurrentListMap!2997 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414049))))

(assert (=> b!922286 (= lt!414049 (tuple2!12899 lt!414047 lt!414052))))

(declare-fun get!13950 (ValueCell!9332 V!31135) V!31135)

(declare-fun dynLambda!1471 (Int (_ BitVec 64)) V!31135)

(assert (=> b!922286 (= lt!414052 (get!13950 (select (arr!26549 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1471 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414053 () Unit!31042)

(declare-fun lemmaListMapRecursiveValidKeyArray!79 (array!55205 array!55207 (_ BitVec 32) (_ BitVec 32) V!31135 V!31135 (_ BitVec 32) Int) Unit!31042)

(assert (=> b!922286 (= lt!414053 (lemmaListMapRecursiveValidKeyArray!79 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922287 () Bool)

(declare-fun res!621985 () Bool)

(assert (=> b!922287 (=> (not res!621985) (not e!517469))))

(assert (=> b!922287 (= res!621985 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27009 _keys!1487))))))

(declare-fun b!922288 () Bool)

(declare-fun res!621984 () Bool)

(assert (=> b!922288 (=> (not res!621984) (not e!517470))))

(declare-fun v!791 () V!31135)

(declare-fun apply!624 (ListLongMap!11585 (_ BitVec 64)) V!31135)

(assert (=> b!922288 (= res!621984 (= (apply!624 lt!414046 k0!1099) v!791))))

(declare-fun b!922289 () Bool)

(declare-fun e!517474 () Bool)

(assert (=> b!922289 (= e!517474 (and e!517471 mapRes!31197))))

(declare-fun condMapEmpty!31197 () Bool)

(declare-fun mapDefault!31197 () ValueCell!9332)

(assert (=> b!922289 (= condMapEmpty!31197 (= (arr!26549 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9332)) mapDefault!31197)))))

(declare-fun mapNonEmpty!31197 () Bool)

(declare-fun tp!59799 () Bool)

(assert (=> mapNonEmpty!31197 (= mapRes!31197 (and tp!59799 e!517475))))

(declare-fun mapKey!31197 () (_ BitVec 32))

(declare-fun mapValue!31197 () ValueCell!9332)

(declare-fun mapRest!31197 () (Array (_ BitVec 32) ValueCell!9332))

(assert (=> mapNonEmpty!31197 (= (arr!26549 _values!1231) (store mapRest!31197 mapKey!31197 mapValue!31197))))

(declare-fun b!922290 () Bool)

(declare-fun res!621991 () Bool)

(assert (=> b!922290 (=> (not res!621991) (not e!517469))))

(assert (=> b!922290 (= res!621991 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18678))))

(declare-fun b!922291 () Bool)

(assert (=> b!922291 (= e!517476 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!621990 () Bool)

(assert (=> start!78888 (=> (not res!621990) (not e!517469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78888 (= res!621990 (validMask!0 mask!1881))))

(assert (=> start!78888 e!517469))

(assert (=> start!78888 true))

(assert (=> start!78888 tp_is_empty!19627))

(declare-fun array_inv!20768 (array!55207) Bool)

(assert (=> start!78888 (and (array_inv!20768 _values!1231) e!517474)))

(assert (=> start!78888 tp!59798))

(declare-fun array_inv!20769 (array!55205) Bool)

(assert (=> start!78888 (array_inv!20769 _keys!1487)))

(declare-fun b!922279 () Bool)

(assert (=> b!922279 (= e!517470 e!517473)))

(declare-fun res!621992 () Bool)

(assert (=> b!922279 (=> (not res!621992) (not e!517473))))

(assert (=> b!922279 (= res!621992 (validKeyInArray!0 lt!414047))))

(assert (=> b!922279 (= lt!414047 (select (arr!26548 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922292 () Bool)

(declare-fun arrayContainsKey!0 (array!55205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922292 (= e!517476 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922293 () Bool)

(assert (=> b!922293 (= e!517469 e!517470)))

(declare-fun res!621983 () Bool)

(assert (=> b!922293 (=> (not res!621983) (not e!517470))))

(assert (=> b!922293 (= res!621983 (contains!4823 lt!414046 k0!1099))))

(assert (=> b!922293 (= lt!414046 (getCurrentListMap!2997 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78888 res!621990) b!922283))

(assert (= (and b!922283 res!621989) b!922280))

(assert (= (and b!922280 res!621987) b!922290))

(assert (= (and b!922290 res!621991) b!922287))

(assert (= (and b!922287 res!621985) b!922293))

(assert (= (and b!922293 res!621983) b!922288))

(assert (= (and b!922288 res!621984) b!922285))

(assert (= (and b!922285 res!621986) b!922284))

(assert (= (and b!922284 res!621988) b!922279))

(assert (= (and b!922279 res!621992) b!922286))

(assert (= (and b!922286 c!96115) b!922292))

(assert (= (and b!922286 (not c!96115)) b!922291))

(assert (= (and b!922289 condMapEmpty!31197) mapIsEmpty!31197))

(assert (= (and b!922289 (not condMapEmpty!31197)) mapNonEmpty!31197))

(get-info :version)

(assert (= (and mapNonEmpty!31197 ((_ is ValueCellFull!9332) mapValue!31197)) b!922281))

(assert (= (and b!922289 ((_ is ValueCellFull!9332) mapDefault!31197)) b!922282))

(assert (= start!78888 b!922289))

(declare-fun b_lambda!13603 () Bool)

(assert (=> (not b_lambda!13603) (not b!922286)))

(declare-fun t!26520 () Bool)

(declare-fun tb!5691 () Bool)

(assert (=> (and start!78888 (= defaultEntry!1235 defaultEntry!1235) t!26520) tb!5691))

(declare-fun result!11213 () Bool)

(assert (=> tb!5691 (= result!11213 tp_is_empty!19627)))

(assert (=> b!922286 t!26520))

(declare-fun b_and!27951 () Bool)

(assert (= b_and!27949 (and (=> t!26520 result!11213) b_and!27951)))

(declare-fun m!855841 () Bool)

(assert (=> b!922280 m!855841))

(declare-fun m!855843 () Bool)

(assert (=> b!922284 m!855843))

(declare-fun m!855845 () Bool)

(assert (=> b!922292 m!855845))

(declare-fun m!855847 () Bool)

(assert (=> start!78888 m!855847))

(declare-fun m!855849 () Bool)

(assert (=> start!78888 m!855849))

(declare-fun m!855851 () Bool)

(assert (=> start!78888 m!855851))

(declare-fun m!855853 () Bool)

(assert (=> b!922290 m!855853))

(declare-fun m!855855 () Bool)

(assert (=> mapNonEmpty!31197 m!855855))

(declare-fun m!855857 () Bool)

(assert (=> b!922279 m!855857))

(declare-fun m!855859 () Bool)

(assert (=> b!922279 m!855859))

(declare-fun m!855861 () Bool)

(assert (=> b!922293 m!855861))

(declare-fun m!855863 () Bool)

(assert (=> b!922293 m!855863))

(declare-fun m!855865 () Bool)

(assert (=> b!922288 m!855865))

(declare-fun m!855867 () Bool)

(assert (=> b!922286 m!855867))

(declare-fun m!855869 () Bool)

(assert (=> b!922286 m!855869))

(declare-fun m!855871 () Bool)

(assert (=> b!922286 m!855871))

(declare-fun m!855873 () Bool)

(assert (=> b!922286 m!855873))

(declare-fun m!855875 () Bool)

(assert (=> b!922286 m!855875))

(declare-fun m!855877 () Bool)

(assert (=> b!922286 m!855877))

(assert (=> b!922286 m!855873))

(declare-fun m!855879 () Bool)

(assert (=> b!922286 m!855879))

(declare-fun m!855881 () Bool)

(assert (=> b!922286 m!855881))

(declare-fun m!855883 () Bool)

(assert (=> b!922286 m!855883))

(declare-fun m!855885 () Bool)

(assert (=> b!922286 m!855885))

(declare-fun m!855887 () Bool)

(assert (=> b!922286 m!855887))

(assert (=> b!922286 m!855875))

(declare-fun m!855889 () Bool)

(assert (=> b!922286 m!855889))

(assert (=> b!922286 m!855879))

(declare-fun m!855891 () Bool)

(assert (=> b!922286 m!855891))

(assert (=> b!922286 m!855867))

(declare-fun m!855893 () Bool)

(assert (=> b!922286 m!855893))

(check-sat (not b!922290) b_and!27951 (not b!922288) tp_is_empty!19627 (not b!922279) (not b!922293) (not b_lambda!13603) (not b!922284) (not b!922292) (not b!922280) (not b_next!17119) (not start!78888) (not mapNonEmpty!31197) (not b!922286))
(check-sat b_and!27951 (not b_next!17119))
