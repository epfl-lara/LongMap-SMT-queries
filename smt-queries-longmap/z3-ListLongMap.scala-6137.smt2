; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79098 () Bool)

(assert start!79098)

(declare-fun b_free!17143 () Bool)

(declare-fun b_next!17143 () Bool)

(assert (=> start!79098 (= b_free!17143 (not b_next!17143))))

(declare-fun tp!59871 () Bool)

(declare-fun b_and!28033 () Bool)

(assert (=> start!79098 (= tp!59871 b_and!28033)))

(declare-fun b!923985 () Bool)

(declare-fun res!622797 () Bool)

(declare-fun e!518493 () Bool)

(assert (=> b!923985 (=> (not res!622797) (not e!518493))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923985 (= res!622797 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!923986 () Bool)

(declare-fun e!518487 () Bool)

(declare-fun tp_is_empty!19651 () Bool)

(assert (=> b!923986 (= e!518487 tp_is_empty!19651)))

(declare-fun b!923987 () Bool)

(declare-fun res!622802 () Bool)

(assert (=> b!923987 (=> (not res!622802) (not e!518493))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31167 0))(
  ( (V!31168 (val!9876 Int)) )
))
(declare-fun v!791 () V!31167)

(declare-datatypes ((tuple2!12848 0))(
  ( (tuple2!12849 (_1!6435 (_ BitVec 64)) (_2!6435 V!31167)) )
))
(declare-datatypes ((List!18664 0))(
  ( (Nil!18661) (Cons!18660 (h!19812 tuple2!12848) (t!26529 List!18664)) )
))
(declare-datatypes ((ListLongMap!11547 0))(
  ( (ListLongMap!11548 (toList!5789 List!18664)) )
))
(declare-fun lt!414968 () ListLongMap!11547)

(declare-fun apply!644 (ListLongMap!11547 (_ BitVec 64)) V!31167)

(assert (=> b!923987 (= res!622802 (= (apply!644 lt!414968 k0!1099) v!791))))

(declare-fun b!923988 () Bool)

(declare-fun res!622806 () Bool)

(declare-fun e!518488 () Bool)

(assert (=> b!923988 (=> (not res!622806) (not e!518488))))

(declare-datatypes ((array!55325 0))(
  ( (array!55326 (arr!26603 (Array (_ BitVec 32) (_ BitVec 64))) (size!27063 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55325)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55325 (_ BitVec 32)) Bool)

(assert (=> b!923988 (= res!622806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923990 () Bool)

(assert (=> b!923990 (= e!518488 e!518493)))

(declare-fun res!622804 () Bool)

(assert (=> b!923990 (=> (not res!622804) (not e!518493))))

(declare-fun contains!4862 (ListLongMap!11547 (_ BitVec 64)) Bool)

(assert (=> b!923990 (= res!622804 (contains!4862 lt!414968 k0!1099))))

(declare-datatypes ((ValueCell!9344 0))(
  ( (ValueCellFull!9344 (v!12391 V!31167)) (EmptyCell!9344) )
))
(declare-datatypes ((array!55327 0))(
  ( (array!55328 (arr!26604 (Array (_ BitVec 32) ValueCell!9344)) (size!27064 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55327)

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31167)

(declare-fun minValue!1173 () V!31167)

(declare-fun getCurrentListMap!3040 (array!55325 array!55327 (_ BitVec 32) (_ BitVec 32) V!31167 V!31167 (_ BitVec 32) Int) ListLongMap!11547)

(assert (=> b!923990 (= lt!414968 (getCurrentListMap!3040 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923991 () Bool)

(declare-fun res!622803 () Bool)

(assert (=> b!923991 (=> (not res!622803) (not e!518488))))

(declare-datatypes ((List!18665 0))(
  ( (Nil!18662) (Cons!18661 (h!19813 (_ BitVec 64)) (t!26530 List!18665)) )
))
(declare-fun arrayNoDuplicates!0 (array!55325 (_ BitVec 32) List!18665) Bool)

(assert (=> b!923991 (= res!622803 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18662))))

(declare-fun mapIsEmpty!31233 () Bool)

(declare-fun mapRes!31233 () Bool)

(assert (=> mapIsEmpty!31233 mapRes!31233))

(declare-fun e!518490 () Bool)

(declare-fun b!923992 () Bool)

(declare-fun arrayContainsKey!0 (array!55325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923992 (= e!518490 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923993 () Bool)

(assert (=> b!923993 (= e!518490 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923994 () Bool)

(declare-fun res!622805 () Bool)

(assert (=> b!923994 (=> (not res!622805) (not e!518488))))

(assert (=> b!923994 (= res!622805 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27063 _keys!1487))))))

(declare-fun b!923995 () Bool)

(declare-fun e!518489 () Bool)

(assert (=> b!923995 (= e!518489 (and e!518487 mapRes!31233))))

(declare-fun condMapEmpty!31233 () Bool)

(declare-fun mapDefault!31233 () ValueCell!9344)

(assert (=> b!923995 (= condMapEmpty!31233 (= (arr!26604 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9344)) mapDefault!31233)))))

(declare-fun mapNonEmpty!31233 () Bool)

(declare-fun tp!59870 () Bool)

(declare-fun e!518492 () Bool)

(assert (=> mapNonEmpty!31233 (= mapRes!31233 (and tp!59870 e!518492))))

(declare-fun mapValue!31233 () ValueCell!9344)

(declare-fun mapRest!31233 () (Array (_ BitVec 32) ValueCell!9344))

(declare-fun mapKey!31233 () (_ BitVec 32))

(assert (=> mapNonEmpty!31233 (= (arr!26604 _values!1231) (store mapRest!31233 mapKey!31233 mapValue!31233))))

(declare-fun b!923996 () Bool)

(assert (=> b!923996 (= e!518492 tp_is_empty!19651)))

(declare-fun b!923997 () Bool)

(declare-fun e!518494 () Bool)

(assert (=> b!923997 (= e!518493 e!518494)))

(declare-fun res!622799 () Bool)

(assert (=> b!923997 (=> (not res!622799) (not e!518494))))

(declare-fun lt!414971 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923997 (= res!622799 (validKeyInArray!0 lt!414971))))

(assert (=> b!923997 (= lt!414971 (select (arr!26603 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!923998 () Bool)

(declare-fun res!622801 () Bool)

(assert (=> b!923998 (=> (not res!622801) (not e!518488))))

(assert (=> b!923998 (= res!622801 (and (= (size!27064 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27063 _keys!1487) (size!27064 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923999 () Bool)

(assert (=> b!923999 (= e!518494 (not true))))

(assert (=> b!923999 (not (= lt!414971 k0!1099))))

(declare-datatypes ((Unit!31140 0))(
  ( (Unit!31141) )
))
(declare-fun lt!414970 () Unit!31140)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55325 (_ BitVec 64) (_ BitVec 32) List!18665) Unit!31140)

(assert (=> b!923999 (= lt!414970 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18662))))

(assert (=> b!923999 e!518490))

(declare-fun c!96498 () Bool)

(assert (=> b!923999 (= c!96498 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414967 () Unit!31140)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!205 (array!55325 array!55327 (_ BitVec 32) (_ BitVec 32) V!31167 V!31167 (_ BitVec 64) (_ BitVec 32) Int) Unit!31140)

(assert (=> b!923999 (= lt!414967 (lemmaListMapContainsThenArrayContainsFrom!205 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923999 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18662)))

(declare-fun lt!414966 () Unit!31140)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55325 (_ BitVec 32) (_ BitVec 32)) Unit!31140)

(assert (=> b!923999 (= lt!414966 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414969 () tuple2!12848)

(declare-fun +!2714 (ListLongMap!11547 tuple2!12848) ListLongMap!11547)

(assert (=> b!923999 (contains!4862 (+!2714 lt!414968 lt!414969) k0!1099)))

(declare-fun lt!414972 () Unit!31140)

(declare-fun lt!414973 () V!31167)

(declare-fun addStillContains!423 (ListLongMap!11547 (_ BitVec 64) V!31167 (_ BitVec 64)) Unit!31140)

(assert (=> b!923999 (= lt!414972 (addStillContains!423 lt!414968 lt!414971 lt!414973 k0!1099))))

(assert (=> b!923999 (= (getCurrentListMap!3040 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2714 (getCurrentListMap!3040 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414969))))

(assert (=> b!923999 (= lt!414969 (tuple2!12849 lt!414971 lt!414973))))

(declare-fun get!13997 (ValueCell!9344 V!31167) V!31167)

(declare-fun dynLambda!1511 (Int (_ BitVec 64)) V!31167)

(assert (=> b!923999 (= lt!414973 (get!13997 (select (arr!26604 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1511 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414974 () Unit!31140)

(declare-fun lemmaListMapRecursiveValidKeyArray!94 (array!55325 array!55327 (_ BitVec 32) (_ BitVec 32) V!31167 V!31167 (_ BitVec 32) Int) Unit!31140)

(assert (=> b!923999 (= lt!414974 (lemmaListMapRecursiveValidKeyArray!94 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923989 () Bool)

(declare-fun res!622800 () Bool)

(assert (=> b!923989 (=> (not res!622800) (not e!518493))))

(assert (=> b!923989 (= res!622800 (validKeyInArray!0 k0!1099))))

(declare-fun res!622798 () Bool)

(assert (=> start!79098 (=> (not res!622798) (not e!518488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79098 (= res!622798 (validMask!0 mask!1881))))

(assert (=> start!79098 e!518488))

(assert (=> start!79098 true))

(assert (=> start!79098 tp_is_empty!19651))

(declare-fun array_inv!20820 (array!55327) Bool)

(assert (=> start!79098 (and (array_inv!20820 _values!1231) e!518489)))

(assert (=> start!79098 tp!59871))

(declare-fun array_inv!20821 (array!55325) Bool)

(assert (=> start!79098 (array_inv!20821 _keys!1487)))

(assert (= (and start!79098 res!622798) b!923998))

(assert (= (and b!923998 res!622801) b!923988))

(assert (= (and b!923988 res!622806) b!923991))

(assert (= (and b!923991 res!622803) b!923994))

(assert (= (and b!923994 res!622805) b!923990))

(assert (= (and b!923990 res!622804) b!923987))

(assert (= (and b!923987 res!622802) b!923985))

(assert (= (and b!923985 res!622797) b!923989))

(assert (= (and b!923989 res!622800) b!923997))

(assert (= (and b!923997 res!622799) b!923999))

(assert (= (and b!923999 c!96498) b!923992))

(assert (= (and b!923999 (not c!96498)) b!923993))

(assert (= (and b!923995 condMapEmpty!31233) mapIsEmpty!31233))

(assert (= (and b!923995 (not condMapEmpty!31233)) mapNonEmpty!31233))

(get-info :version)

(assert (= (and mapNonEmpty!31233 ((_ is ValueCellFull!9344) mapValue!31233)) b!923996))

(assert (= (and b!923995 ((_ is ValueCellFull!9344) mapDefault!31233)) b!923986))

(assert (= start!79098 b!923995))

(declare-fun b_lambda!13659 () Bool)

(assert (=> (not b_lambda!13659) (not b!923999)))

(declare-fun t!26528 () Bool)

(declare-fun tb!5715 () Bool)

(assert (=> (and start!79098 (= defaultEntry!1235 defaultEntry!1235) t!26528) tb!5715))

(declare-fun result!11261 () Bool)

(assert (=> tb!5715 (= result!11261 tp_is_empty!19651)))

(assert (=> b!923999 t!26528))

(declare-fun b_and!28035 () Bool)

(assert (= b_and!28033 (and (=> t!26528 result!11261) b_and!28035)))

(declare-fun m!858541 () Bool)

(assert (=> b!923989 m!858541))

(declare-fun m!858543 () Bool)

(assert (=> b!923997 m!858543))

(declare-fun m!858545 () Bool)

(assert (=> b!923997 m!858545))

(declare-fun m!858547 () Bool)

(assert (=> b!923987 m!858547))

(declare-fun m!858549 () Bool)

(assert (=> b!923992 m!858549))

(declare-fun m!858551 () Bool)

(assert (=> b!923990 m!858551))

(declare-fun m!858553 () Bool)

(assert (=> b!923990 m!858553))

(declare-fun m!858555 () Bool)

(assert (=> b!923988 m!858555))

(declare-fun m!858557 () Bool)

(assert (=> b!923991 m!858557))

(declare-fun m!858559 () Bool)

(assert (=> b!923999 m!858559))

(declare-fun m!858561 () Bool)

(assert (=> b!923999 m!858561))

(declare-fun m!858563 () Bool)

(assert (=> b!923999 m!858563))

(declare-fun m!858565 () Bool)

(assert (=> b!923999 m!858565))

(declare-fun m!858567 () Bool)

(assert (=> b!923999 m!858567))

(declare-fun m!858569 () Bool)

(assert (=> b!923999 m!858569))

(declare-fun m!858571 () Bool)

(assert (=> b!923999 m!858571))

(assert (=> b!923999 m!858569))

(assert (=> b!923999 m!858571))

(declare-fun m!858573 () Bool)

(assert (=> b!923999 m!858573))

(declare-fun m!858575 () Bool)

(assert (=> b!923999 m!858575))

(declare-fun m!858577 () Bool)

(assert (=> b!923999 m!858577))

(assert (=> b!923999 m!858565))

(declare-fun m!858579 () Bool)

(assert (=> b!923999 m!858579))

(declare-fun m!858581 () Bool)

(assert (=> b!923999 m!858581))

(declare-fun m!858583 () Bool)

(assert (=> b!923999 m!858583))

(assert (=> b!923999 m!858561))

(declare-fun m!858585 () Bool)

(assert (=> b!923999 m!858585))

(declare-fun m!858587 () Bool)

(assert (=> start!79098 m!858587))

(declare-fun m!858589 () Bool)

(assert (=> start!79098 m!858589))

(declare-fun m!858591 () Bool)

(assert (=> start!79098 m!858591))

(declare-fun m!858593 () Bool)

(assert (=> mapNonEmpty!31233 m!858593))

(check-sat (not b!923999) b_and!28035 (not start!79098) (not b!923997) (not b_next!17143) (not b!923992) (not b!923988) (not b!923990) (not b!923989) (not b_lambda!13659) (not b!923987) (not b!923991) (not mapNonEmpty!31233) tp_is_empty!19651)
(check-sat b_and!28035 (not b_next!17143))
