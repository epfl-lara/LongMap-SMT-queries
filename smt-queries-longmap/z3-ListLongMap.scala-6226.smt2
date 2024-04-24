; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79796 () Bool)

(assert start!79796)

(declare-fun b_free!17677 () Bool)

(declare-fun b_next!17677 () Bool)

(assert (=> start!79796 (= b_free!17677 (not b_next!17677))))

(declare-fun tp!61488 () Bool)

(declare-fun b_and!28955 () Bool)

(assert (=> start!79796 (= tp!61488 b_and!28955)))

(declare-fun b!936816 () Bool)

(declare-fun e!526114 () Bool)

(declare-fun e!526116 () Bool)

(assert (=> b!936816 (= e!526114 e!526116)))

(declare-fun res!630577 () Bool)

(assert (=> b!936816 (=> (not res!630577) (not e!526116))))

(declare-fun lt!422257 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936816 (= res!630577 (validKeyInArray!0 lt!422257))))

(declare-datatypes ((array!56363 0))(
  ( (array!56364 (arr!27117 (Array (_ BitVec 32) (_ BitVec 64))) (size!27577 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56363)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!936816 (= lt!422257 (select (arr!27117 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!936817 () Bool)

(declare-fun res!630575 () Bool)

(declare-fun e!526115 () Bool)

(assert (=> b!936817 (=> (not res!630575) (not e!526115))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56363 (_ BitVec 32)) Bool)

(assert (=> b!936817 (= res!630575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936818 () Bool)

(declare-fun res!630579 () Bool)

(assert (=> b!936818 (=> (not res!630579) (not e!526115))))

(assert (=> b!936818 (= res!630579 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27577 _keys!1487))))))

(declare-fun res!630573 () Bool)

(assert (=> start!79796 (=> (not res!630573) (not e!526115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79796 (= res!630573 (validMask!0 mask!1881))))

(assert (=> start!79796 e!526115))

(assert (=> start!79796 true))

(declare-fun tp_is_empty!20185 () Bool)

(assert (=> start!79796 tp_is_empty!20185))

(declare-datatypes ((V!31879 0))(
  ( (V!31880 (val!10143 Int)) )
))
(declare-datatypes ((ValueCell!9611 0))(
  ( (ValueCellFull!9611 (v!12665 V!31879)) (EmptyCell!9611) )
))
(declare-datatypes ((array!56365 0))(
  ( (array!56366 (arr!27118 (Array (_ BitVec 32) ValueCell!9611)) (size!27578 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56365)

(declare-fun e!526110 () Bool)

(declare-fun array_inv!21180 (array!56365) Bool)

(assert (=> start!79796 (and (array_inv!21180 _values!1231) e!526110)))

(assert (=> start!79796 tp!61488))

(declare-fun array_inv!21181 (array!56363) Bool)

(assert (=> start!79796 (array_inv!21181 _keys!1487)))

(declare-fun mapNonEmpty!32049 () Bool)

(declare-fun mapRes!32049 () Bool)

(declare-fun tp!61487 () Bool)

(declare-fun e!526109 () Bool)

(assert (=> mapNonEmpty!32049 (= mapRes!32049 (and tp!61487 e!526109))))

(declare-fun mapValue!32049 () ValueCell!9611)

(declare-fun mapKey!32049 () (_ BitVec 32))

(declare-fun mapRest!32049 () (Array (_ BitVec 32) ValueCell!9611))

(assert (=> mapNonEmpty!32049 (= (arr!27118 _values!1231) (store mapRest!32049 mapKey!32049 mapValue!32049))))

(declare-fun b!936819 () Bool)

(declare-fun res!630571 () Bool)

(assert (=> b!936819 (=> (not res!630571) (not e!526115))))

(declare-datatypes ((List!19079 0))(
  ( (Nil!19076) (Cons!19075 (h!20227 (_ BitVec 64)) (t!27292 List!19079)) )
))
(declare-fun arrayNoDuplicates!0 (array!56363 (_ BitVec 32) List!19079) Bool)

(assert (=> b!936819 (= res!630571 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19076))))

(declare-fun b!936820 () Bool)

(declare-fun res!630576 () Bool)

(assert (=> b!936820 (=> (not res!630576) (not e!526114))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!936820 (= res!630576 (validKeyInArray!0 k0!1099))))

(declare-fun b!936821 () Bool)

(declare-fun res!630570 () Bool)

(assert (=> b!936821 (=> (not res!630570) (not e!526115))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!936821 (= res!630570 (and (= (size!27578 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27577 _keys!1487) (size!27578 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun e!526112 () Bool)

(declare-fun b!936822 () Bool)

(declare-fun arrayContainsKey!0 (array!56363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936822 (= e!526112 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936823 () Bool)

(assert (=> b!936823 (= e!526116 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27577 _keys!1487))))))

(assert (=> b!936823 (not (= lt!422257 k0!1099))))

(declare-datatypes ((Unit!31556 0))(
  ( (Unit!31557) )
))
(declare-fun lt!422256 () Unit!31556)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56363 (_ BitVec 64) (_ BitVec 32) List!19079) Unit!31556)

(assert (=> b!936823 (= lt!422256 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19076))))

(assert (=> b!936823 e!526112))

(declare-fun c!97629 () Bool)

(assert (=> b!936823 (= c!97629 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422254 () Unit!31556)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31879)

(declare-fun minValue!1173 () V!31879)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!287 (array!56363 array!56365 (_ BitVec 32) (_ BitVec 32) V!31879 V!31879 (_ BitVec 64) (_ BitVec 32) Int) Unit!31556)

(assert (=> b!936823 (= lt!422254 (lemmaListMapContainsThenArrayContainsFrom!287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!936823 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19076)))

(declare-fun lt!422260 () Unit!31556)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56363 (_ BitVec 32) (_ BitVec 32)) Unit!31556)

(assert (=> b!936823 (= lt!422260 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13298 0))(
  ( (tuple2!13299 (_1!6660 (_ BitVec 64)) (_2!6660 V!31879)) )
))
(declare-datatypes ((List!19080 0))(
  ( (Nil!19077) (Cons!19076 (h!20228 tuple2!13298) (t!27293 List!19080)) )
))
(declare-datatypes ((ListLongMap!11997 0))(
  ( (ListLongMap!11998 (toList!6014 List!19080)) )
))
(declare-fun lt!422258 () ListLongMap!11997)

(declare-fun lt!422255 () tuple2!13298)

(declare-fun contains!5087 (ListLongMap!11997 (_ BitVec 64)) Bool)

(declare-fun +!2833 (ListLongMap!11997 tuple2!13298) ListLongMap!11997)

(assert (=> b!936823 (contains!5087 (+!2833 lt!422258 lt!422255) k0!1099)))

(declare-fun lt!422259 () V!31879)

(declare-fun lt!422262 () Unit!31556)

(declare-fun addStillContains!536 (ListLongMap!11997 (_ BitVec 64) V!31879 (_ BitVec 64)) Unit!31556)

(assert (=> b!936823 (= lt!422262 (addStillContains!536 lt!422258 lt!422257 lt!422259 k0!1099))))

(declare-fun getCurrentListMap!3252 (array!56363 array!56365 (_ BitVec 32) (_ BitVec 32) V!31879 V!31879 (_ BitVec 32) Int) ListLongMap!11997)

(assert (=> b!936823 (= (getCurrentListMap!3252 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2833 (getCurrentListMap!3252 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422255))))

(assert (=> b!936823 (= lt!422255 (tuple2!13299 lt!422257 lt!422259))))

(declare-fun get!14309 (ValueCell!9611 V!31879) V!31879)

(declare-fun dynLambda!1630 (Int (_ BitVec 64)) V!31879)

(assert (=> b!936823 (= lt!422259 (get!14309 (select (arr!27118 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1630 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422261 () Unit!31556)

(declare-fun lemmaListMapRecursiveValidKeyArray!213 (array!56363 array!56365 (_ BitVec 32) (_ BitVec 32) V!31879 V!31879 (_ BitVec 32) Int) Unit!31556)

(assert (=> b!936823 (= lt!422261 (lemmaListMapRecursiveValidKeyArray!213 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!936824 () Bool)

(assert (=> b!936824 (= e!526109 tp_is_empty!20185)))

(declare-fun b!936825 () Bool)

(declare-fun e!526113 () Bool)

(assert (=> b!936825 (= e!526110 (and e!526113 mapRes!32049))))

(declare-fun condMapEmpty!32049 () Bool)

(declare-fun mapDefault!32049 () ValueCell!9611)

(assert (=> b!936825 (= condMapEmpty!32049 (= (arr!27118 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9611)) mapDefault!32049)))))

(declare-fun b!936826 () Bool)

(declare-fun res!630574 () Bool)

(assert (=> b!936826 (=> (not res!630574) (not e!526114))))

(assert (=> b!936826 (= res!630574 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!32049 () Bool)

(assert (=> mapIsEmpty!32049 mapRes!32049))

(declare-fun b!936827 () Bool)

(assert (=> b!936827 (= e!526113 tp_is_empty!20185)))

(declare-fun b!936828 () Bool)

(assert (=> b!936828 (= e!526112 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936829 () Bool)

(assert (=> b!936829 (= e!526115 e!526114)))

(declare-fun res!630572 () Bool)

(assert (=> b!936829 (=> (not res!630572) (not e!526114))))

(assert (=> b!936829 (= res!630572 (contains!5087 lt!422258 k0!1099))))

(assert (=> b!936829 (= lt!422258 (getCurrentListMap!3252 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936830 () Bool)

(declare-fun res!630578 () Bool)

(assert (=> b!936830 (=> (not res!630578) (not e!526114))))

(declare-fun v!791 () V!31879)

(declare-fun apply!834 (ListLongMap!11997 (_ BitVec 64)) V!31879)

(assert (=> b!936830 (= res!630578 (= (apply!834 lt!422258 k0!1099) v!791))))

(assert (= (and start!79796 res!630573) b!936821))

(assert (= (and b!936821 res!630570) b!936817))

(assert (= (and b!936817 res!630575) b!936819))

(assert (= (and b!936819 res!630571) b!936818))

(assert (= (and b!936818 res!630579) b!936829))

(assert (= (and b!936829 res!630572) b!936830))

(assert (= (and b!936830 res!630578) b!936826))

(assert (= (and b!936826 res!630574) b!936820))

(assert (= (and b!936820 res!630576) b!936816))

(assert (= (and b!936816 res!630577) b!936823))

(assert (= (and b!936823 c!97629) b!936822))

(assert (= (and b!936823 (not c!97629)) b!936828))

(assert (= (and b!936825 condMapEmpty!32049) mapIsEmpty!32049))

(assert (= (and b!936825 (not condMapEmpty!32049)) mapNonEmpty!32049))

(get-info :version)

(assert (= (and mapNonEmpty!32049 ((_ is ValueCellFull!9611) mapValue!32049)) b!936824))

(assert (= (and b!936825 ((_ is ValueCellFull!9611) mapDefault!32049)) b!936827))

(assert (= start!79796 b!936825))

(declare-fun b_lambda!14097 () Bool)

(assert (=> (not b_lambda!14097) (not b!936823)))

(declare-fun t!27291 () Bool)

(declare-fun tb!6063 () Bool)

(assert (=> (and start!79796 (= defaultEntry!1235 defaultEntry!1235) t!27291) tb!6063))

(declare-fun result!11967 () Bool)

(assert (=> tb!6063 (= result!11967 tp_is_empty!20185)))

(assert (=> b!936823 t!27291))

(declare-fun b_and!28957 () Bool)

(assert (= b_and!28955 (and (=> t!27291 result!11967) b_and!28957)))

(declare-fun m!871733 () Bool)

(assert (=> b!936823 m!871733))

(declare-fun m!871735 () Bool)

(assert (=> b!936823 m!871735))

(declare-fun m!871737 () Bool)

(assert (=> b!936823 m!871737))

(declare-fun m!871739 () Bool)

(assert (=> b!936823 m!871739))

(declare-fun m!871741 () Bool)

(assert (=> b!936823 m!871741))

(assert (=> b!936823 m!871739))

(assert (=> b!936823 m!871741))

(declare-fun m!871743 () Bool)

(assert (=> b!936823 m!871743))

(declare-fun m!871745 () Bool)

(assert (=> b!936823 m!871745))

(assert (=> b!936823 m!871733))

(declare-fun m!871747 () Bool)

(assert (=> b!936823 m!871747))

(declare-fun m!871749 () Bool)

(assert (=> b!936823 m!871749))

(declare-fun m!871751 () Bool)

(assert (=> b!936823 m!871751))

(declare-fun m!871753 () Bool)

(assert (=> b!936823 m!871753))

(declare-fun m!871755 () Bool)

(assert (=> b!936823 m!871755))

(declare-fun m!871757 () Bool)

(assert (=> b!936823 m!871757))

(assert (=> b!936823 m!871755))

(declare-fun m!871759 () Bool)

(assert (=> b!936823 m!871759))

(declare-fun m!871761 () Bool)

(assert (=> mapNonEmpty!32049 m!871761))

(declare-fun m!871763 () Bool)

(assert (=> start!79796 m!871763))

(declare-fun m!871765 () Bool)

(assert (=> start!79796 m!871765))

(declare-fun m!871767 () Bool)

(assert (=> start!79796 m!871767))

(declare-fun m!871769 () Bool)

(assert (=> b!936829 m!871769))

(declare-fun m!871771 () Bool)

(assert (=> b!936829 m!871771))

(declare-fun m!871773 () Bool)

(assert (=> b!936820 m!871773))

(declare-fun m!871775 () Bool)

(assert (=> b!936822 m!871775))

(declare-fun m!871777 () Bool)

(assert (=> b!936830 m!871777))

(declare-fun m!871779 () Bool)

(assert (=> b!936816 m!871779))

(declare-fun m!871781 () Bool)

(assert (=> b!936816 m!871781))

(declare-fun m!871783 () Bool)

(assert (=> b!936819 m!871783))

(declare-fun m!871785 () Bool)

(assert (=> b!936817 m!871785))

(check-sat (not b!936820) (not b!936829) (not mapNonEmpty!32049) tp_is_empty!20185 (not b!936822) (not b_lambda!14097) (not b_next!17677) (not b!936816) b_and!28957 (not b!936817) (not b!936823) (not b!936819) (not start!79796) (not b!936830))
(check-sat b_and!28957 (not b_next!17677))
