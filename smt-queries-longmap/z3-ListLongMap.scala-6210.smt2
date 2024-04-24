; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79562 () Bool)

(assert start!79562)

(declare-fun b_free!17581 () Bool)

(declare-fun b_next!17581 () Bool)

(assert (=> start!79562 (= b_free!17581 (not b_next!17581))))

(declare-fun tp!61188 () Bool)

(declare-fun b_and!28731 () Bool)

(assert (=> start!79562 (= tp!61188 b_and!28731)))

(declare-fun b!933799 () Bool)

(declare-fun e!524449 () Bool)

(declare-fun tp_is_empty!20089 () Bool)

(assert (=> b!933799 (= e!524449 tp_is_empty!20089)))

(declare-fun res!628666 () Bool)

(declare-fun e!524448 () Bool)

(assert (=> start!79562 (=> (not res!628666) (not e!524448))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79562 (= res!628666 (validMask!0 mask!1881))))

(assert (=> start!79562 e!524448))

(assert (=> start!79562 true))

(assert (=> start!79562 tp_is_empty!20089))

(declare-datatypes ((V!31751 0))(
  ( (V!31752 (val!10095 Int)) )
))
(declare-datatypes ((ValueCell!9563 0))(
  ( (ValueCellFull!9563 (v!12611 V!31751)) (EmptyCell!9563) )
))
(declare-datatypes ((array!56171 0))(
  ( (array!56172 (arr!27025 (Array (_ BitVec 32) ValueCell!9563)) (size!27485 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56171)

(declare-fun e!524446 () Bool)

(declare-fun array_inv!21124 (array!56171) Bool)

(assert (=> start!79562 (and (array_inv!21124 _values!1231) e!524446)))

(assert (=> start!79562 tp!61188))

(declare-datatypes ((array!56173 0))(
  ( (array!56174 (arr!27026 (Array (_ BitVec 32) (_ BitVec 64))) (size!27486 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56173)

(declare-fun array_inv!21125 (array!56173) Bool)

(assert (=> start!79562 (array_inv!21125 _keys!1487)))

(declare-fun b!933800 () Bool)

(declare-fun e!524447 () Bool)

(assert (=> b!933800 (= e!524447 tp_is_empty!20089)))

(declare-fun b!933801 () Bool)

(declare-fun res!628665 () Bool)

(declare-fun e!524445 () Bool)

(assert (=> b!933801 (=> (not res!628665) (not e!524445))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933801 (= res!628665 (validKeyInArray!0 k0!1099))))

(declare-fun b!933802 () Bool)

(declare-fun e!524450 () Bool)

(assert (=> b!933802 (= e!524445 e!524450)))

(declare-fun res!628663 () Bool)

(assert (=> b!933802 (=> (not res!628663) (not e!524450))))

(declare-fun lt!420484 () (_ BitVec 64))

(assert (=> b!933802 (= res!628663 (validKeyInArray!0 lt!420484))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933802 (= lt!420484 (select (arr!27026 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31893 () Bool)

(declare-fun mapRes!31893 () Bool)

(assert (=> mapIsEmpty!31893 mapRes!31893))

(declare-fun b!933803 () Bool)

(declare-fun res!628659 () Bool)

(assert (=> b!933803 (=> (not res!628659) (not e!524445))))

(assert (=> b!933803 (= res!628659 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933804 () Bool)

(assert (=> b!933804 (= e!524446 (and e!524447 mapRes!31893))))

(declare-fun condMapEmpty!31893 () Bool)

(declare-fun mapDefault!31893 () ValueCell!9563)

(assert (=> b!933804 (= condMapEmpty!31893 (= (arr!27025 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9563)) mapDefault!31893)))))

(declare-fun b!933805 () Bool)

(declare-fun res!628668 () Bool)

(assert (=> b!933805 (=> (not res!628668) (not e!524448))))

(assert (=> b!933805 (= res!628668 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27486 _keys!1487))))))

(declare-fun b!933806 () Bool)

(declare-fun res!628660 () Bool)

(assert (=> b!933806 (=> (not res!628660) (not e!524448))))

(declare-datatypes ((List!19001 0))(
  ( (Nil!18998) (Cons!18997 (h!20149 (_ BitVec 64)) (t!27118 List!19001)) )
))
(declare-fun arrayNoDuplicates!0 (array!56173 (_ BitVec 32) List!19001) Bool)

(assert (=> b!933806 (= res!628660 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18998))))

(declare-fun mapNonEmpty!31893 () Bool)

(declare-fun tp!61187 () Bool)

(assert (=> mapNonEmpty!31893 (= mapRes!31893 (and tp!61187 e!524449))))

(declare-fun mapRest!31893 () (Array (_ BitVec 32) ValueCell!9563))

(declare-fun mapValue!31893 () ValueCell!9563)

(declare-fun mapKey!31893 () (_ BitVec 32))

(assert (=> mapNonEmpty!31893 (= (arr!27025 _values!1231) (store mapRest!31893 mapKey!31893 mapValue!31893))))

(declare-fun b!933807 () Bool)

(assert (=> b!933807 (= e!524448 e!524445)))

(declare-fun res!628661 () Bool)

(assert (=> b!933807 (=> (not res!628661) (not e!524445))))

(declare-datatypes ((tuple2!13218 0))(
  ( (tuple2!13219 (_1!6620 (_ BitVec 64)) (_2!6620 V!31751)) )
))
(declare-datatypes ((List!19002 0))(
  ( (Nil!18999) (Cons!18998 (h!20150 tuple2!13218) (t!27119 List!19002)) )
))
(declare-datatypes ((ListLongMap!11917 0))(
  ( (ListLongMap!11918 (toList!5974 List!19002)) )
))
(declare-fun lt!420488 () ListLongMap!11917)

(declare-fun contains!5039 (ListLongMap!11917 (_ BitVec 64)) Bool)

(assert (=> b!933807 (= res!628661 (contains!5039 lt!420488 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31751)

(declare-fun minValue!1173 () V!31751)

(declare-fun getCurrentListMap!3216 (array!56173 array!56171 (_ BitVec 32) (_ BitVec 32) V!31751 V!31751 (_ BitVec 32) Int) ListLongMap!11917)

(assert (=> b!933807 (= lt!420488 (getCurrentListMap!3216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933808 () Bool)

(declare-fun res!628667 () Bool)

(assert (=> b!933808 (=> (not res!628667) (not e!524448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56173 (_ BitVec 32)) Bool)

(assert (=> b!933808 (= res!628667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933809 () Bool)

(declare-fun res!628662 () Bool)

(assert (=> b!933809 (=> (not res!628662) (not e!524445))))

(declare-fun v!791 () V!31751)

(declare-fun apply!801 (ListLongMap!11917 (_ BitVec 64)) V!31751)

(assert (=> b!933809 (= res!628662 (= (apply!801 lt!420488 k0!1099) v!791))))

(declare-fun b!933810 () Bool)

(assert (=> b!933810 (= e!524450 (not true))))

(assert (=> b!933810 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18998)))

(declare-datatypes ((Unit!31474 0))(
  ( (Unit!31475) )
))
(declare-fun lt!420489 () Unit!31474)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56173 (_ BitVec 32) (_ BitVec 32)) Unit!31474)

(assert (=> b!933810 (= lt!420489 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420487 () tuple2!13218)

(declare-fun +!2802 (ListLongMap!11917 tuple2!13218) ListLongMap!11917)

(assert (=> b!933810 (contains!5039 (+!2802 lt!420488 lt!420487) k0!1099)))

(declare-fun lt!420486 () Unit!31474)

(declare-fun lt!420483 () V!31751)

(declare-fun addStillContains!505 (ListLongMap!11917 (_ BitVec 64) V!31751 (_ BitVec 64)) Unit!31474)

(assert (=> b!933810 (= lt!420486 (addStillContains!505 lt!420488 lt!420484 lt!420483 k0!1099))))

(assert (=> b!933810 (= (getCurrentListMap!3216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2802 (getCurrentListMap!3216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420487))))

(assert (=> b!933810 (= lt!420487 (tuple2!13219 lt!420484 lt!420483))))

(declare-fun get!14234 (ValueCell!9563 V!31751) V!31751)

(declare-fun dynLambda!1599 (Int (_ BitVec 64)) V!31751)

(assert (=> b!933810 (= lt!420483 (get!14234 (select (arr!27025 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1599 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420485 () Unit!31474)

(declare-fun lemmaListMapRecursiveValidKeyArray!182 (array!56173 array!56171 (_ BitVec 32) (_ BitVec 32) V!31751 V!31751 (_ BitVec 32) Int) Unit!31474)

(assert (=> b!933810 (= lt!420485 (lemmaListMapRecursiveValidKeyArray!182 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933811 () Bool)

(declare-fun res!628664 () Bool)

(assert (=> b!933811 (=> (not res!628664) (not e!524448))))

(assert (=> b!933811 (= res!628664 (and (= (size!27485 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27486 _keys!1487) (size!27485 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79562 res!628666) b!933811))

(assert (= (and b!933811 res!628664) b!933808))

(assert (= (and b!933808 res!628667) b!933806))

(assert (= (and b!933806 res!628660) b!933805))

(assert (= (and b!933805 res!628668) b!933807))

(assert (= (and b!933807 res!628661) b!933809))

(assert (= (and b!933809 res!628662) b!933803))

(assert (= (and b!933803 res!628659) b!933801))

(assert (= (and b!933801 res!628665) b!933802))

(assert (= (and b!933802 res!628663) b!933810))

(assert (= (and b!933804 condMapEmpty!31893) mapIsEmpty!31893))

(assert (= (and b!933804 (not condMapEmpty!31893)) mapNonEmpty!31893))

(get-info :version)

(assert (= (and mapNonEmpty!31893 ((_ is ValueCellFull!9563) mapValue!31893)) b!933799))

(assert (= (and b!933804 ((_ is ValueCellFull!9563) mapDefault!31893)) b!933800))

(assert (= start!79562 b!933804))

(declare-fun b_lambda!13929 () Bool)

(assert (=> (not b_lambda!13929) (not b!933810)))

(declare-fun t!27117 () Bool)

(declare-fun tb!5967 () Bool)

(assert (=> (and start!79562 (= defaultEntry!1235 defaultEntry!1235) t!27117) tb!5967))

(declare-fun result!11767 () Bool)

(assert (=> tb!5967 (= result!11767 tp_is_empty!20089)))

(assert (=> b!933810 t!27117))

(declare-fun b_and!28733 () Bool)

(assert (= b_and!28731 (and (=> t!27117 result!11767) b_and!28733)))

(declare-fun m!868229 () Bool)

(assert (=> start!79562 m!868229))

(declare-fun m!868231 () Bool)

(assert (=> start!79562 m!868231))

(declare-fun m!868233 () Bool)

(assert (=> start!79562 m!868233))

(declare-fun m!868235 () Bool)

(assert (=> mapNonEmpty!31893 m!868235))

(declare-fun m!868237 () Bool)

(assert (=> b!933807 m!868237))

(declare-fun m!868239 () Bool)

(assert (=> b!933807 m!868239))

(declare-fun m!868241 () Bool)

(assert (=> b!933810 m!868241))

(declare-fun m!868243 () Bool)

(assert (=> b!933810 m!868243))

(declare-fun m!868245 () Bool)

(assert (=> b!933810 m!868245))

(declare-fun m!868247 () Bool)

(assert (=> b!933810 m!868247))

(declare-fun m!868249 () Bool)

(assert (=> b!933810 m!868249))

(assert (=> b!933810 m!868245))

(assert (=> b!933810 m!868247))

(declare-fun m!868251 () Bool)

(assert (=> b!933810 m!868251))

(declare-fun m!868253 () Bool)

(assert (=> b!933810 m!868253))

(assert (=> b!933810 m!868249))

(declare-fun m!868255 () Bool)

(assert (=> b!933810 m!868255))

(declare-fun m!868257 () Bool)

(assert (=> b!933810 m!868257))

(assert (=> b!933810 m!868241))

(declare-fun m!868259 () Bool)

(assert (=> b!933810 m!868259))

(declare-fun m!868261 () Bool)

(assert (=> b!933810 m!868261))

(declare-fun m!868263 () Bool)

(assert (=> b!933810 m!868263))

(declare-fun m!868265 () Bool)

(assert (=> b!933802 m!868265))

(declare-fun m!868267 () Bool)

(assert (=> b!933802 m!868267))

(declare-fun m!868269 () Bool)

(assert (=> b!933801 m!868269))

(declare-fun m!868271 () Bool)

(assert (=> b!933809 m!868271))

(declare-fun m!868273 () Bool)

(assert (=> b!933806 m!868273))

(declare-fun m!868275 () Bool)

(assert (=> b!933808 m!868275))

(check-sat (not b!933807) (not b!933810) (not b!933802) (not b!933808) (not start!79562) (not b!933801) (not b_next!17581) (not mapNonEmpty!31893) tp_is_empty!20089 (not b!933809) (not b!933806) (not b_lambda!13929) b_and!28733)
(check-sat b_and!28733 (not b_next!17581))
