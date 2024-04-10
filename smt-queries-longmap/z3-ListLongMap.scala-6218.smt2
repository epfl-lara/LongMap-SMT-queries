; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79476 () Bool)

(assert start!79476)

(declare-fun b_free!17631 () Bool)

(declare-fun b_next!17631 () Bool)

(assert (=> start!79476 (= b_free!17631 (not b_next!17631))))

(declare-fun tp!61339 () Bool)

(declare-fun b_and!28829 () Bool)

(assert (=> start!79476 (= tp!61339 b_and!28829)))

(declare-fun b!934136 () Bool)

(declare-fun res!629154 () Bool)

(declare-fun e!524527 () Bool)

(assert (=> b!934136 (=> (not res!629154) (not e!524527))))

(declare-datatypes ((array!56216 0))(
  ( (array!56217 (arr!27051 (Array (_ BitVec 32) (_ BitVec 64))) (size!27510 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56216)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56216 (_ BitVec 32)) Bool)

(assert (=> b!934136 (= res!629154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!629156 () Bool)

(assert (=> start!79476 (=> (not res!629156) (not e!524527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79476 (= res!629156 (validMask!0 mask!1881))))

(assert (=> start!79476 e!524527))

(assert (=> start!79476 true))

(declare-fun tp_is_empty!20139 () Bool)

(assert (=> start!79476 tp_is_empty!20139))

(declare-datatypes ((V!31817 0))(
  ( (V!31818 (val!10120 Int)) )
))
(declare-datatypes ((ValueCell!9588 0))(
  ( (ValueCellFull!9588 (v!12640 V!31817)) (EmptyCell!9588) )
))
(declare-datatypes ((array!56218 0))(
  ( (array!56219 (arr!27052 (Array (_ BitVec 32) ValueCell!9588)) (size!27511 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56218)

(declare-fun e!524526 () Bool)

(declare-fun array_inv!21054 (array!56218) Bool)

(assert (=> start!79476 (and (array_inv!21054 _values!1231) e!524526)))

(assert (=> start!79476 tp!61339))

(declare-fun array_inv!21055 (array!56216) Bool)

(assert (=> start!79476 (array_inv!21055 _keys!1487)))

(declare-fun mapIsEmpty!31971 () Bool)

(declare-fun mapRes!31971 () Bool)

(assert (=> mapIsEmpty!31971 mapRes!31971))

(declare-fun b!934137 () Bool)

(declare-fun e!524529 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!934137 (= e!524529 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!934138 () Bool)

(declare-fun e!524530 () Bool)

(assert (=> b!934138 (= e!524530 tp_is_empty!20139)))

(declare-fun b!934139 () Bool)

(declare-fun e!524528 () Bool)

(assert (=> b!934139 (= e!524526 (and e!524528 mapRes!31971))))

(declare-fun condMapEmpty!31971 () Bool)

(declare-fun mapDefault!31971 () ValueCell!9588)

(assert (=> b!934139 (= condMapEmpty!31971 (= (arr!27052 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9588)) mapDefault!31971)))))

(declare-fun b!934140 () Bool)

(declare-fun res!629157 () Bool)

(declare-fun e!524531 () Bool)

(assert (=> b!934140 (=> (not res!629157) (not e!524531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934140 (= res!629157 (validKeyInArray!0 k0!1099))))

(declare-fun b!934141 () Bool)

(declare-fun e!524525 () Bool)

(assert (=> b!934141 (= e!524531 e!524525)))

(declare-fun res!629149 () Bool)

(assert (=> b!934141 (=> (not res!629149) (not e!524525))))

(declare-fun lt!420829 () (_ BitVec 64))

(assert (=> b!934141 (= res!629149 (validKeyInArray!0 lt!420829))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934141 (= lt!420829 (select (arr!27051 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934142 () Bool)

(declare-fun arrayContainsKey!0 (array!56216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934142 (= e!524529 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!934143 () Bool)

(assert (=> b!934143 (= e!524527 e!524531)))

(declare-fun res!629150 () Bool)

(assert (=> b!934143 (=> (not res!629150) (not e!524531))))

(declare-datatypes ((tuple2!13270 0))(
  ( (tuple2!13271 (_1!6646 (_ BitVec 64)) (_2!6646 V!31817)) )
))
(declare-datatypes ((List!19052 0))(
  ( (Nil!19049) (Cons!19048 (h!20194 tuple2!13270) (t!27227 List!19052)) )
))
(declare-datatypes ((ListLongMap!11967 0))(
  ( (ListLongMap!11968 (toList!5999 List!19052)) )
))
(declare-fun lt!420824 () ListLongMap!11967)

(declare-fun contains!5050 (ListLongMap!11967 (_ BitVec 64)) Bool)

(assert (=> b!934143 (= res!629150 (contains!5050 lt!420824 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31817)

(declare-fun minValue!1173 () V!31817)

(declare-fun getCurrentListMap!3237 (array!56216 array!56218 (_ BitVec 32) (_ BitVec 32) V!31817 V!31817 (_ BitVec 32) Int) ListLongMap!11967)

(assert (=> b!934143 (= lt!420824 (getCurrentListMap!3237 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934144 () Bool)

(declare-fun res!629152 () Bool)

(assert (=> b!934144 (=> (not res!629152) (not e!524531))))

(declare-fun v!791 () V!31817)

(declare-fun apply!806 (ListLongMap!11967 (_ BitVec 64)) V!31817)

(assert (=> b!934144 (= res!629152 (= (apply!806 lt!420824 k0!1099) v!791))))

(declare-fun b!934145 () Bool)

(assert (=> b!934145 (= e!524528 tp_is_empty!20139)))

(declare-fun mapNonEmpty!31971 () Bool)

(declare-fun tp!61340 () Bool)

(assert (=> mapNonEmpty!31971 (= mapRes!31971 (and tp!61340 e!524530))))

(declare-fun mapRest!31971 () (Array (_ BitVec 32) ValueCell!9588))

(declare-fun mapValue!31971 () ValueCell!9588)

(declare-fun mapKey!31971 () (_ BitVec 32))

(assert (=> mapNonEmpty!31971 (= (arr!27052 _values!1231) (store mapRest!31971 mapKey!31971 mapValue!31971))))

(declare-fun b!934146 () Bool)

(assert (=> b!934146 (= e!524525 (not true))))

(assert (=> b!934146 e!524529))

(declare-fun c!97137 () Bool)

(assert (=> b!934146 (= c!97137 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31518 0))(
  ( (Unit!31519) )
))
(declare-fun lt!420828 () Unit!31518)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!271 (array!56216 array!56218 (_ BitVec 32) (_ BitVec 32) V!31817 V!31817 (_ BitVec 64) (_ BitVec 32) Int) Unit!31518)

(assert (=> b!934146 (= lt!420828 (lemmaListMapContainsThenArrayContainsFrom!271 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19053 0))(
  ( (Nil!19050) (Cons!19049 (h!20195 (_ BitVec 64)) (t!27228 List!19053)) )
))
(declare-fun arrayNoDuplicates!0 (array!56216 (_ BitVec 32) List!19053) Bool)

(assert (=> b!934146 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19050)))

(declare-fun lt!420826 () Unit!31518)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56216 (_ BitVec 32) (_ BitVec 32)) Unit!31518)

(assert (=> b!934146 (= lt!420826 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420827 () tuple2!13270)

(declare-fun +!2799 (ListLongMap!11967 tuple2!13270) ListLongMap!11967)

(assert (=> b!934146 (contains!5050 (+!2799 lt!420824 lt!420827) k0!1099)))

(declare-fun lt!420830 () Unit!31518)

(declare-fun lt!420825 () V!31817)

(declare-fun addStillContains!518 (ListLongMap!11967 (_ BitVec 64) V!31817 (_ BitVec 64)) Unit!31518)

(assert (=> b!934146 (= lt!420830 (addStillContains!518 lt!420824 lt!420829 lt!420825 k0!1099))))

(assert (=> b!934146 (= (getCurrentListMap!3237 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2799 (getCurrentListMap!3237 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420827))))

(assert (=> b!934146 (= lt!420827 (tuple2!13271 lt!420829 lt!420825))))

(declare-fun get!14238 (ValueCell!9588 V!31817) V!31817)

(declare-fun dynLambda!1588 (Int (_ BitVec 64)) V!31817)

(assert (=> b!934146 (= lt!420825 (get!14238 (select (arr!27052 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1588 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420831 () Unit!31518)

(declare-fun lemmaListMapRecursiveValidKeyArray!189 (array!56216 array!56218 (_ BitVec 32) (_ BitVec 32) V!31817 V!31817 (_ BitVec 32) Int) Unit!31518)

(assert (=> b!934146 (= lt!420831 (lemmaListMapRecursiveValidKeyArray!189 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934147 () Bool)

(declare-fun res!629153 () Bool)

(assert (=> b!934147 (=> (not res!629153) (not e!524527))))

(assert (=> b!934147 (= res!629153 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27510 _keys!1487))))))

(declare-fun b!934148 () Bool)

(declare-fun res!629158 () Bool)

(assert (=> b!934148 (=> (not res!629158) (not e!524527))))

(assert (=> b!934148 (= res!629158 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19050))))

(declare-fun b!934149 () Bool)

(declare-fun res!629151 () Bool)

(assert (=> b!934149 (=> (not res!629151) (not e!524531))))

(assert (=> b!934149 (= res!629151 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934150 () Bool)

(declare-fun res!629155 () Bool)

(assert (=> b!934150 (=> (not res!629155) (not e!524527))))

(assert (=> b!934150 (= res!629155 (and (= (size!27511 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27510 _keys!1487) (size!27511 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79476 res!629156) b!934150))

(assert (= (and b!934150 res!629155) b!934136))

(assert (= (and b!934136 res!629154) b!934148))

(assert (= (and b!934148 res!629158) b!934147))

(assert (= (and b!934147 res!629153) b!934143))

(assert (= (and b!934143 res!629150) b!934144))

(assert (= (and b!934144 res!629152) b!934149))

(assert (= (and b!934149 res!629151) b!934140))

(assert (= (and b!934140 res!629157) b!934141))

(assert (= (and b!934141 res!629149) b!934146))

(assert (= (and b!934146 c!97137) b!934142))

(assert (= (and b!934146 (not c!97137)) b!934137))

(assert (= (and b!934139 condMapEmpty!31971) mapIsEmpty!31971))

(assert (= (and b!934139 (not condMapEmpty!31971)) mapNonEmpty!31971))

(get-info :version)

(assert (= (and mapNonEmpty!31971 ((_ is ValueCellFull!9588) mapValue!31971)) b!934138))

(assert (= (and b!934139 ((_ is ValueCellFull!9588) mapDefault!31971)) b!934145))

(assert (= start!79476 b!934139))

(declare-fun b_lambda!13983 () Bool)

(assert (=> (not b_lambda!13983) (not b!934146)))

(declare-fun t!27226 () Bool)

(declare-fun tb!6025 () Bool)

(assert (=> (and start!79476 (= defaultEntry!1235 defaultEntry!1235) t!27226) tb!6025))

(declare-fun result!11877 () Bool)

(assert (=> tb!6025 (= result!11877 tp_is_empty!20139)))

(assert (=> b!934146 t!27226))

(declare-fun b_and!28831 () Bool)

(assert (= b_and!28829 (and (=> t!27226 result!11877) b_and!28831)))

(declare-fun m!868399 () Bool)

(assert (=> b!934136 m!868399))

(declare-fun m!868401 () Bool)

(assert (=> b!934144 m!868401))

(declare-fun m!868403 () Bool)

(assert (=> b!934142 m!868403))

(declare-fun m!868405 () Bool)

(assert (=> b!934148 m!868405))

(declare-fun m!868407 () Bool)

(assert (=> b!934140 m!868407))

(declare-fun m!868409 () Bool)

(assert (=> b!934146 m!868409))

(declare-fun m!868411 () Bool)

(assert (=> b!934146 m!868411))

(declare-fun m!868413 () Bool)

(assert (=> b!934146 m!868413))

(declare-fun m!868415 () Bool)

(assert (=> b!934146 m!868415))

(declare-fun m!868417 () Bool)

(assert (=> b!934146 m!868417))

(declare-fun m!868419 () Bool)

(assert (=> b!934146 m!868419))

(assert (=> b!934146 m!868413))

(assert (=> b!934146 m!868415))

(declare-fun m!868421 () Bool)

(assert (=> b!934146 m!868421))

(declare-fun m!868423 () Bool)

(assert (=> b!934146 m!868423))

(declare-fun m!868425 () Bool)

(assert (=> b!934146 m!868425))

(declare-fun m!868427 () Bool)

(assert (=> b!934146 m!868427))

(assert (=> b!934146 m!868417))

(declare-fun m!868429 () Bool)

(assert (=> b!934146 m!868429))

(declare-fun m!868431 () Bool)

(assert (=> b!934146 m!868431))

(assert (=> b!934146 m!868409))

(declare-fun m!868433 () Bool)

(assert (=> b!934146 m!868433))

(declare-fun m!868435 () Bool)

(assert (=> start!79476 m!868435))

(declare-fun m!868437 () Bool)

(assert (=> start!79476 m!868437))

(declare-fun m!868439 () Bool)

(assert (=> start!79476 m!868439))

(declare-fun m!868441 () Bool)

(assert (=> mapNonEmpty!31971 m!868441))

(declare-fun m!868443 () Bool)

(assert (=> b!934143 m!868443))

(declare-fun m!868445 () Bool)

(assert (=> b!934143 m!868445))

(declare-fun m!868447 () Bool)

(assert (=> b!934141 m!868447))

(declare-fun m!868449 () Bool)

(assert (=> b!934141 m!868449))

(check-sat (not b!934146) (not b!934148) (not b!934143) (not b!934142) (not b_lambda!13983) b_and!28831 (not start!79476) tp_is_empty!20139 (not b_next!17631) (not b!934136) (not b!934141) (not b!934144) (not mapNonEmpty!31971) (not b!934140))
(check-sat b_and!28831 (not b_next!17631))
