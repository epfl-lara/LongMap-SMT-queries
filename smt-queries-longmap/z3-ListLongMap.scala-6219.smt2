; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79462 () Bool)

(assert start!79462)

(declare-fun b_free!17635 () Bool)

(declare-fun b_next!17635 () Bool)

(assert (=> start!79462 (= b_free!17635 (not b_next!17635))))

(declare-fun tp!61353 () Bool)

(declare-fun b_and!28811 () Bool)

(assert (=> start!79462 (= tp!61353 b_and!28811)))

(declare-fun b!933991 () Bool)

(declare-fun res!629102 () Bool)

(declare-fun e!524426 () Bool)

(assert (=> b!933991 (=> (not res!629102) (not e!524426))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933991 (= res!629102 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933992 () Bool)

(declare-fun e!524430 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!933992 (= e!524430 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!933993 () Bool)

(declare-fun e!524429 () Bool)

(declare-fun tp_is_empty!20143 () Bool)

(assert (=> b!933993 (= e!524429 tp_is_empty!20143)))

(declare-fun b!933994 () Bool)

(declare-fun res!629101 () Bool)

(assert (=> b!933994 (=> (not res!629101) (not e!524426))))

(declare-datatypes ((V!31823 0))(
  ( (V!31824 (val!10122 Int)) )
))
(declare-fun v!791 () V!31823)

(declare-datatypes ((tuple2!13334 0))(
  ( (tuple2!13335 (_1!6678 (_ BitVec 64)) (_2!6678 V!31823)) )
))
(declare-datatypes ((List!19081 0))(
  ( (Nil!19078) (Cons!19077 (h!20223 tuple2!13334) (t!27251 List!19081)) )
))
(declare-datatypes ((ListLongMap!12021 0))(
  ( (ListLongMap!12022 (toList!6026 List!19081)) )
))
(declare-fun lt!420638 () ListLongMap!12021)

(declare-fun apply!808 (ListLongMap!12021 (_ BitVec 64)) V!31823)

(assert (=> b!933994 (= res!629101 (= (apply!808 lt!420638 k0!1099) v!791))))

(declare-fun mapIsEmpty!31977 () Bool)

(declare-fun mapRes!31977 () Bool)

(assert (=> mapIsEmpty!31977 mapRes!31977))

(declare-fun b!933995 () Bool)

(declare-fun e!524425 () Bool)

(assert (=> b!933995 (= e!524426 e!524425)))

(declare-fun res!629107 () Bool)

(assert (=> b!933995 (=> (not res!629107) (not e!524425))))

(declare-fun lt!420636 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933995 (= res!629107 (validKeyInArray!0 lt!420636))))

(declare-datatypes ((array!56189 0))(
  ( (array!56190 (arr!27038 (Array (_ BitVec 32) (_ BitVec 64))) (size!27499 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56189)

(assert (=> b!933995 (= lt!420636 (select (arr!27038 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933996 () Bool)

(assert (=> b!933996 (= e!524425 (not true))))

(assert (=> b!933996 e!524430))

(declare-fun c!97078 () Bool)

(assert (=> b!933996 (= c!97078 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31433 0))(
  ( (Unit!31434) )
))
(declare-fun lt!420643 () Unit!31433)

(declare-datatypes ((ValueCell!9590 0))(
  ( (ValueCellFull!9590 (v!12641 V!31823)) (EmptyCell!9590) )
))
(declare-datatypes ((array!56191 0))(
  ( (array!56192 (arr!27039 (Array (_ BitVec 32) ValueCell!9590)) (size!27500 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56191)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31823)

(declare-fun minValue!1173 () V!31823)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!276 (array!56189 array!56191 (_ BitVec 32) (_ BitVec 32) V!31823 V!31823 (_ BitVec 64) (_ BitVec 32) Int) Unit!31433)

(assert (=> b!933996 (= lt!420643 (lemmaListMapContainsThenArrayContainsFrom!276 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19082 0))(
  ( (Nil!19079) (Cons!19078 (h!20224 (_ BitVec 64)) (t!27252 List!19082)) )
))
(declare-fun arrayNoDuplicates!0 (array!56189 (_ BitVec 32) List!19082) Bool)

(assert (=> b!933996 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19079)))

(declare-fun lt!420637 () Unit!31433)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56189 (_ BitVec 32) (_ BitVec 32)) Unit!31433)

(assert (=> b!933996 (= lt!420637 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420642 () tuple2!13334)

(declare-fun contains!5024 (ListLongMap!12021 (_ BitVec 64)) Bool)

(declare-fun +!2829 (ListLongMap!12021 tuple2!13334) ListLongMap!12021)

(assert (=> b!933996 (contains!5024 (+!2829 lt!420638 lt!420642) k0!1099)))

(declare-fun lt!420639 () Unit!31433)

(declare-fun lt!420641 () V!31823)

(declare-fun addStillContains!518 (ListLongMap!12021 (_ BitVec 64) V!31823 (_ BitVec 64)) Unit!31433)

(assert (=> b!933996 (= lt!420639 (addStillContains!518 lt!420638 lt!420636 lt!420641 k0!1099))))

(declare-fun getCurrentListMap!3197 (array!56189 array!56191 (_ BitVec 32) (_ BitVec 32) V!31823 V!31823 (_ BitVec 32) Int) ListLongMap!12021)

(assert (=> b!933996 (= (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2829 (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420642))))

(assert (=> b!933996 (= lt!420642 (tuple2!13335 lt!420636 lt!420641))))

(declare-fun get!14242 (ValueCell!9590 V!31823) V!31823)

(declare-fun dynLambda!1585 (Int (_ BitVec 64)) V!31823)

(assert (=> b!933996 (= lt!420641 (get!14242 (select (arr!27039 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1585 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420640 () Unit!31433)

(declare-fun lemmaListMapRecursiveValidKeyArray!193 (array!56189 array!56191 (_ BitVec 32) (_ BitVec 32) V!31823 V!31823 (_ BitVec 32) Int) Unit!31433)

(assert (=> b!933996 (= lt!420640 (lemmaListMapRecursiveValidKeyArray!193 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933997 () Bool)

(declare-fun res!629108 () Bool)

(declare-fun e!524428 () Bool)

(assert (=> b!933997 (=> (not res!629108) (not e!524428))))

(assert (=> b!933997 (= res!629108 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27499 _keys!1487))))))

(declare-fun b!933998 () Bool)

(declare-fun res!629106 () Bool)

(assert (=> b!933998 (=> (not res!629106) (not e!524428))))

(assert (=> b!933998 (= res!629106 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19079))))

(declare-fun b!933999 () Bool)

(declare-fun e!524431 () Bool)

(assert (=> b!933999 (= e!524431 (and e!524429 mapRes!31977))))

(declare-fun condMapEmpty!31977 () Bool)

(declare-fun mapDefault!31977 () ValueCell!9590)

(assert (=> b!933999 (= condMapEmpty!31977 (= (arr!27039 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9590)) mapDefault!31977)))))

(declare-fun b!934001 () Bool)

(declare-fun arrayContainsKey!0 (array!56189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934001 (= e!524430 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapNonEmpty!31977 () Bool)

(declare-fun tp!61352 () Bool)

(declare-fun e!524432 () Bool)

(assert (=> mapNonEmpty!31977 (= mapRes!31977 (and tp!61352 e!524432))))

(declare-fun mapRest!31977 () (Array (_ BitVec 32) ValueCell!9590))

(declare-fun mapKey!31977 () (_ BitVec 32))

(declare-fun mapValue!31977 () ValueCell!9590)

(assert (=> mapNonEmpty!31977 (= (arr!27039 _values!1231) (store mapRest!31977 mapKey!31977 mapValue!31977))))

(declare-fun b!934002 () Bool)

(declare-fun res!629104 () Bool)

(assert (=> b!934002 (=> (not res!629104) (not e!524428))))

(assert (=> b!934002 (= res!629104 (and (= (size!27500 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27499 _keys!1487) (size!27500 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!629103 () Bool)

(assert (=> start!79462 (=> (not res!629103) (not e!524428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79462 (= res!629103 (validMask!0 mask!1881))))

(assert (=> start!79462 e!524428))

(assert (=> start!79462 true))

(assert (=> start!79462 tp_is_empty!20143))

(declare-fun array_inv!21106 (array!56191) Bool)

(assert (=> start!79462 (and (array_inv!21106 _values!1231) e!524431)))

(assert (=> start!79462 tp!61353))

(declare-fun array_inv!21107 (array!56189) Bool)

(assert (=> start!79462 (array_inv!21107 _keys!1487)))

(declare-fun b!934000 () Bool)

(assert (=> b!934000 (= e!524428 e!524426)))

(declare-fun res!629100 () Bool)

(assert (=> b!934000 (=> (not res!629100) (not e!524426))))

(assert (=> b!934000 (= res!629100 (contains!5024 lt!420638 k0!1099))))

(assert (=> b!934000 (= lt!420638 (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934003 () Bool)

(declare-fun res!629099 () Bool)

(assert (=> b!934003 (=> (not res!629099) (not e!524426))))

(assert (=> b!934003 (= res!629099 (validKeyInArray!0 k0!1099))))

(declare-fun b!934004 () Bool)

(assert (=> b!934004 (= e!524432 tp_is_empty!20143)))

(declare-fun b!934005 () Bool)

(declare-fun res!629105 () Bool)

(assert (=> b!934005 (=> (not res!629105) (not e!524428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56189 (_ BitVec 32)) Bool)

(assert (=> b!934005 (= res!629105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79462 res!629103) b!934002))

(assert (= (and b!934002 res!629104) b!934005))

(assert (= (and b!934005 res!629105) b!933998))

(assert (= (and b!933998 res!629106) b!933997))

(assert (= (and b!933997 res!629108) b!934000))

(assert (= (and b!934000 res!629100) b!933994))

(assert (= (and b!933994 res!629101) b!933991))

(assert (= (and b!933991 res!629102) b!934003))

(assert (= (and b!934003 res!629099) b!933995))

(assert (= (and b!933995 res!629107) b!933996))

(assert (= (and b!933996 c!97078) b!934001))

(assert (= (and b!933996 (not c!97078)) b!933992))

(assert (= (and b!933999 condMapEmpty!31977) mapIsEmpty!31977))

(assert (= (and b!933999 (not condMapEmpty!31977)) mapNonEmpty!31977))

(get-info :version)

(assert (= (and mapNonEmpty!31977 ((_ is ValueCellFull!9590) mapValue!31977)) b!934004))

(assert (= (and b!933999 ((_ is ValueCellFull!9590) mapDefault!31977)) b!933993))

(assert (= start!79462 b!933999))

(declare-fun b_lambda!13969 () Bool)

(assert (=> (not b_lambda!13969) (not b!933996)))

(declare-fun t!27250 () Bool)

(declare-fun tb!6021 () Bool)

(assert (=> (and start!79462 (= defaultEntry!1235 defaultEntry!1235) t!27250) tb!6021))

(declare-fun result!11877 () Bool)

(assert (=> tb!6021 (= result!11877 tp_is_empty!20143)))

(assert (=> b!933996 t!27250))

(declare-fun b_and!28813 () Bool)

(assert (= b_and!28811 (and (=> t!27250 result!11877) b_and!28813)))

(declare-fun m!867745 () Bool)

(assert (=> mapNonEmpty!31977 m!867745))

(declare-fun m!867747 () Bool)

(assert (=> b!934005 m!867747))

(declare-fun m!867749 () Bool)

(assert (=> b!934003 m!867749))

(declare-fun m!867751 () Bool)

(assert (=> start!79462 m!867751))

(declare-fun m!867753 () Bool)

(assert (=> start!79462 m!867753))

(declare-fun m!867755 () Bool)

(assert (=> start!79462 m!867755))

(declare-fun m!867757 () Bool)

(assert (=> b!933995 m!867757))

(declare-fun m!867759 () Bool)

(assert (=> b!933995 m!867759))

(declare-fun m!867761 () Bool)

(assert (=> b!933996 m!867761))

(declare-fun m!867763 () Bool)

(assert (=> b!933996 m!867763))

(declare-fun m!867765 () Bool)

(assert (=> b!933996 m!867765))

(declare-fun m!867767 () Bool)

(assert (=> b!933996 m!867767))

(declare-fun m!867769 () Bool)

(assert (=> b!933996 m!867769))

(assert (=> b!933996 m!867767))

(assert (=> b!933996 m!867769))

(declare-fun m!867771 () Bool)

(assert (=> b!933996 m!867771))

(assert (=> b!933996 m!867761))

(declare-fun m!867773 () Bool)

(assert (=> b!933996 m!867773))

(declare-fun m!867775 () Bool)

(assert (=> b!933996 m!867775))

(declare-fun m!867777 () Bool)

(assert (=> b!933996 m!867777))

(declare-fun m!867779 () Bool)

(assert (=> b!933996 m!867779))

(declare-fun m!867781 () Bool)

(assert (=> b!933996 m!867781))

(declare-fun m!867783 () Bool)

(assert (=> b!933996 m!867783))

(assert (=> b!933996 m!867781))

(declare-fun m!867785 () Bool)

(assert (=> b!933996 m!867785))

(declare-fun m!867787 () Bool)

(assert (=> b!934000 m!867787))

(declare-fun m!867789 () Bool)

(assert (=> b!934000 m!867789))

(declare-fun m!867791 () Bool)

(assert (=> b!933998 m!867791))

(declare-fun m!867793 () Bool)

(assert (=> b!933994 m!867793))

(declare-fun m!867795 () Bool)

(assert (=> b!934001 m!867795))

(check-sat (not mapNonEmpty!31977) (not b_lambda!13969) (not b!933995) (not start!79462) tp_is_empty!20143 (not b!934000) (not b!933994) (not b!934003) (not b!934005) (not b_next!17635) (not b!933996) (not b!933998) b_and!28813 (not b!934001))
(check-sat b_and!28813 (not b_next!17635))
