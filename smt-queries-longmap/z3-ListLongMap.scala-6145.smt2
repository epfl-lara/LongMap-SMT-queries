; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78980 () Bool)

(assert start!78980)

(declare-fun b_free!17193 () Bool)

(declare-fun b_next!17193 () Bool)

(assert (=> start!78980 (= b_free!17193 (not b_next!17193))))

(declare-fun tp!60019 () Bool)

(declare-fun b_and!28123 () Bool)

(assert (=> start!78980 (= tp!60019 b_and!28123)))

(declare-fun b!924461 () Bool)

(declare-datatypes ((Unit!31209 0))(
  ( (Unit!31210) )
))
(declare-fun e!518785 () Unit!31209)

(declare-fun Unit!31211 () Unit!31209)

(assert (=> b!924461 (= e!518785 Unit!31211)))

(declare-fun b!924462 () Bool)

(declare-fun res!623138 () Bool)

(declare-fun e!518778 () Bool)

(assert (=> b!924462 (=> (not res!623138) (not e!518778))))

(declare-datatypes ((array!55372 0))(
  ( (array!55373 (arr!26631 (Array (_ BitVec 32) (_ BitVec 64))) (size!27090 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55372)

(declare-datatypes ((List!18702 0))(
  ( (Nil!18699) (Cons!18698 (h!19844 (_ BitVec 64)) (t!26625 List!18702)) )
))
(declare-fun arrayNoDuplicates!0 (array!55372 (_ BitVec 32) List!18702) Bool)

(assert (=> b!924462 (= res!623138 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18699))))

(declare-fun b!924463 () Bool)

(declare-fun e!518784 () Bool)

(declare-fun e!518783 () Bool)

(assert (=> b!924463 (= e!518784 e!518783)))

(declare-fun res!623140 () Bool)

(assert (=> b!924463 (=> (not res!623140) (not e!518783))))

(declare-datatypes ((V!31233 0))(
  ( (V!31234 (val!9901 Int)) )
))
(declare-datatypes ((tuple2!12900 0))(
  ( (tuple2!12901 (_1!6461 (_ BitVec 64)) (_2!6461 V!31233)) )
))
(declare-datatypes ((List!18703 0))(
  ( (Nil!18700) (Cons!18699 (h!19845 tuple2!12900) (t!26626 List!18703)) )
))
(declare-datatypes ((ListLongMap!11597 0))(
  ( (ListLongMap!11598 (toList!5814 List!18703)) )
))
(declare-fun lt!415699 () ListLongMap!11597)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4874 (ListLongMap!11597 (_ BitVec 64)) Bool)

(assert (=> b!924463 (= res!623140 (contains!4874 lt!415699 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9369 0))(
  ( (ValueCellFull!9369 (v!12419 V!31233)) (EmptyCell!9369) )
))
(declare-datatypes ((array!55374 0))(
  ( (array!55375 (arr!26632 (Array (_ BitVec 32) ValueCell!9369)) (size!27091 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55374)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31233)

(declare-fun minValue!1173 () V!31233)

(declare-fun getCurrentListMap!3065 (array!55372 array!55374 (_ BitVec 32) (_ BitVec 32) V!31233 V!31233 (_ BitVec 32) Int) ListLongMap!11597)

(assert (=> b!924463 (= lt!415699 (getCurrentListMap!3065 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!623139 () Bool)

(assert (=> start!78980 (=> (not res!623139) (not e!518778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78980 (= res!623139 (validMask!0 mask!1881))))

(assert (=> start!78980 e!518778))

(assert (=> start!78980 true))

(declare-fun tp_is_empty!19701 () Bool)

(assert (=> start!78980 tp_is_empty!19701))

(declare-fun e!518788 () Bool)

(declare-fun array_inv!20740 (array!55374) Bool)

(assert (=> start!78980 (and (array_inv!20740 _values!1231) e!518788)))

(assert (=> start!78980 tp!60019))

(declare-fun array_inv!20741 (array!55372) Bool)

(assert (=> start!78980 (array_inv!20741 _keys!1487)))

(declare-fun b!924464 () Bool)

(declare-fun e!518777 () Bool)

(declare-fun mapRes!31308 () Bool)

(assert (=> b!924464 (= e!518788 (and e!518777 mapRes!31308))))

(declare-fun condMapEmpty!31308 () Bool)

(declare-fun mapDefault!31308 () ValueCell!9369)

(assert (=> b!924464 (= condMapEmpty!31308 (= (arr!26632 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9369)) mapDefault!31308)))))

(declare-fun b!924465 () Bool)

(declare-fun e!518780 () Bool)

(declare-fun e!518779 () Bool)

(assert (=> b!924465 (= e!518780 e!518779)))

(declare-fun res!623142 () Bool)

(assert (=> b!924465 (=> (not res!623142) (not e!518779))))

(declare-fun v!791 () V!31233)

(declare-fun lt!415688 () V!31233)

(assert (=> b!924465 (= res!623142 (and (= lt!415688 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!415690 () ListLongMap!11597)

(declare-fun apply!644 (ListLongMap!11597 (_ BitVec 64)) V!31233)

(assert (=> b!924465 (= lt!415688 (apply!644 lt!415690 k0!1099))))

(declare-fun b!924466 () Bool)

(declare-fun e!518787 () Unit!31209)

(assert (=> b!924466 (= e!518787 e!518785)))

(declare-fun lt!415693 () (_ BitVec 64))

(assert (=> b!924466 (= lt!415693 (select (arr!26631 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96429 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924466 (= c!96429 (validKeyInArray!0 lt!415693))))

(declare-fun b!924467 () Bool)

(declare-fun e!518781 () Bool)

(assert (=> b!924467 (= e!518781 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924468 () Bool)

(assert (=> b!924468 (= e!518779 e!518784)))

(declare-fun res!623135 () Bool)

(assert (=> b!924468 (=> (not res!623135) (not e!518784))))

(assert (=> b!924468 (= res!623135 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27090 _keys!1487)))))

(declare-fun lt!415695 () Unit!31209)

(assert (=> b!924468 (= lt!415695 e!518787)))

(declare-fun c!96427 () Bool)

(assert (=> b!924468 (= c!96427 (validKeyInArray!0 k0!1099))))

(declare-fun b!924469 () Bool)

(declare-fun e!518782 () Bool)

(assert (=> b!924469 (= e!518782 tp_is_empty!19701)))

(declare-fun b!924470 () Bool)

(declare-fun lt!415698 () ListLongMap!11597)

(assert (=> b!924470 (= (apply!644 lt!415698 k0!1099) lt!415688)))

(declare-fun lt!415689 () V!31233)

(declare-fun lt!415702 () Unit!31209)

(declare-fun addApplyDifferent!366 (ListLongMap!11597 (_ BitVec 64) V!31233 (_ BitVec 64)) Unit!31209)

(assert (=> b!924470 (= lt!415702 (addApplyDifferent!366 lt!415690 lt!415693 lt!415689 k0!1099))))

(assert (=> b!924470 (not (= lt!415693 k0!1099))))

(declare-fun lt!415692 () Unit!31209)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55372 (_ BitVec 64) (_ BitVec 32) List!18702) Unit!31209)

(assert (=> b!924470 (= lt!415692 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18699))))

(assert (=> b!924470 e!518781))

(declare-fun c!96428 () Bool)

(assert (=> b!924470 (= c!96428 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415696 () Unit!31209)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!217 (array!55372 array!55374 (_ BitVec 32) (_ BitVec 32) V!31233 V!31233 (_ BitVec 64) (_ BitVec 32) Int) Unit!31209)

(assert (=> b!924470 (= lt!415696 (lemmaListMapContainsThenArrayContainsFrom!217 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!924470 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18699)))

(declare-fun lt!415701 () Unit!31209)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55372 (_ BitVec 32) (_ BitVec 32)) Unit!31209)

(assert (=> b!924470 (= lt!415701 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924470 (contains!4874 lt!415698 k0!1099)))

(declare-fun lt!415697 () tuple2!12900)

(declare-fun +!2710 (ListLongMap!11597 tuple2!12900) ListLongMap!11597)

(assert (=> b!924470 (= lt!415698 (+!2710 lt!415690 lt!415697))))

(declare-fun lt!415700 () Unit!31209)

(declare-fun addStillContains!434 (ListLongMap!11597 (_ BitVec 64) V!31233 (_ BitVec 64)) Unit!31209)

(assert (=> b!924470 (= lt!415700 (addStillContains!434 lt!415690 lt!415693 lt!415689 k0!1099))))

(assert (=> b!924470 (= (getCurrentListMap!3065 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2710 (getCurrentListMap!3065 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415697))))

(assert (=> b!924470 (= lt!415697 (tuple2!12901 lt!415693 lt!415689))))

(declare-fun get!13997 (ValueCell!9369 V!31233) V!31233)

(declare-fun dynLambda!1499 (Int (_ BitVec 64)) V!31233)

(assert (=> b!924470 (= lt!415689 (get!13997 (select (arr!26632 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1499 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415691 () Unit!31209)

(declare-fun lemmaListMapRecursiveValidKeyArray!100 (array!55372 array!55374 (_ BitVec 32) (_ BitVec 32) V!31233 V!31233 (_ BitVec 32) Int) Unit!31209)

(assert (=> b!924470 (= lt!415691 (lemmaListMapRecursiveValidKeyArray!100 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924470 (= e!518785 lt!415702)))

(declare-fun b!924471 () Bool)

(assert (=> b!924471 (= e!518778 e!518780)))

(declare-fun res!623136 () Bool)

(assert (=> b!924471 (=> (not res!623136) (not e!518780))))

(assert (=> b!924471 (= res!623136 (contains!4874 lt!415690 k0!1099))))

(assert (=> b!924471 (= lt!415690 (getCurrentListMap!3065 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924472 () Bool)

(declare-fun arrayContainsKey!0 (array!55372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924472 (= e!518781 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924473 () Bool)

(declare-fun res!623137 () Bool)

(assert (=> b!924473 (=> (not res!623137) (not e!518778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55372 (_ BitVec 32)) Bool)

(assert (=> b!924473 (= res!623137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924474 () Bool)

(assert (=> b!924474 (= e!518777 tp_is_empty!19701)))

(declare-fun b!924475 () Bool)

(declare-fun res!623143 () Bool)

(assert (=> b!924475 (=> (not res!623143) (not e!518778))))

(assert (=> b!924475 (= res!623143 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27090 _keys!1487))))))

(declare-fun mapIsEmpty!31308 () Bool)

(assert (=> mapIsEmpty!31308 mapRes!31308))

(declare-fun b!924476 () Bool)

(assert (=> b!924476 (= e!518783 false)))

(declare-fun lt!415694 () V!31233)

(assert (=> b!924476 (= lt!415694 (apply!644 lt!415699 k0!1099))))

(declare-fun mapNonEmpty!31308 () Bool)

(declare-fun tp!60020 () Bool)

(assert (=> mapNonEmpty!31308 (= mapRes!31308 (and tp!60020 e!518782))))

(declare-fun mapKey!31308 () (_ BitVec 32))

(declare-fun mapRest!31308 () (Array (_ BitVec 32) ValueCell!9369))

(declare-fun mapValue!31308 () ValueCell!9369)

(assert (=> mapNonEmpty!31308 (= (arr!26632 _values!1231) (store mapRest!31308 mapKey!31308 mapValue!31308))))

(declare-fun b!924477 () Bool)

(declare-fun Unit!31212 () Unit!31209)

(assert (=> b!924477 (= e!518787 Unit!31212)))

(declare-fun b!924478 () Bool)

(declare-fun res!623141 () Bool)

(assert (=> b!924478 (=> (not res!623141) (not e!518778))))

(assert (=> b!924478 (= res!623141 (and (= (size!27091 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27090 _keys!1487) (size!27091 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78980 res!623139) b!924478))

(assert (= (and b!924478 res!623141) b!924473))

(assert (= (and b!924473 res!623137) b!924462))

(assert (= (and b!924462 res!623138) b!924475))

(assert (= (and b!924475 res!623143) b!924471))

(assert (= (and b!924471 res!623136) b!924465))

(assert (= (and b!924465 res!623142) b!924468))

(assert (= (and b!924468 c!96427) b!924466))

(assert (= (and b!924468 (not c!96427)) b!924477))

(assert (= (and b!924466 c!96429) b!924470))

(assert (= (and b!924466 (not c!96429)) b!924461))

(assert (= (and b!924470 c!96428) b!924472))

(assert (= (and b!924470 (not c!96428)) b!924467))

(assert (= (and b!924468 res!623135) b!924463))

(assert (= (and b!924463 res!623140) b!924476))

(assert (= (and b!924464 condMapEmpty!31308) mapIsEmpty!31308))

(assert (= (and b!924464 (not condMapEmpty!31308)) mapNonEmpty!31308))

(get-info :version)

(assert (= (and mapNonEmpty!31308 ((_ is ValueCellFull!9369) mapValue!31308)) b!924469))

(assert (= (and b!924464 ((_ is ValueCellFull!9369) mapDefault!31308)) b!924474))

(assert (= start!78980 b!924464))

(declare-fun b_lambda!13695 () Bool)

(assert (=> (not b_lambda!13695) (not b!924470)))

(declare-fun t!26624 () Bool)

(declare-fun tb!5773 () Bool)

(assert (=> (and start!78980 (= defaultEntry!1235 defaultEntry!1235) t!26624) tb!5773))

(declare-fun result!11369 () Bool)

(assert (=> tb!5773 (= result!11369 tp_is_empty!19701)))

(assert (=> b!924470 t!26624))

(declare-fun b_and!28125 () Bool)

(assert (= b_and!28123 (and (=> t!26624 result!11369) b_and!28125)))

(declare-fun m!858773 () Bool)

(assert (=> b!924466 m!858773))

(declare-fun m!858775 () Bool)

(assert (=> b!924466 m!858775))

(declare-fun m!858777 () Bool)

(assert (=> start!78980 m!858777))

(declare-fun m!858779 () Bool)

(assert (=> start!78980 m!858779))

(declare-fun m!858781 () Bool)

(assert (=> start!78980 m!858781))

(declare-fun m!858783 () Bool)

(assert (=> b!924472 m!858783))

(declare-fun m!858785 () Bool)

(assert (=> b!924465 m!858785))

(declare-fun m!858787 () Bool)

(assert (=> b!924462 m!858787))

(declare-fun m!858789 () Bool)

(assert (=> b!924476 m!858789))

(declare-fun m!858791 () Bool)

(assert (=> mapNonEmpty!31308 m!858791))

(declare-fun m!858793 () Bool)

(assert (=> b!924473 m!858793))

(declare-fun m!858795 () Bool)

(assert (=> b!924471 m!858795))

(declare-fun m!858797 () Bool)

(assert (=> b!924471 m!858797))

(declare-fun m!858799 () Bool)

(assert (=> b!924468 m!858799))

(declare-fun m!858801 () Bool)

(assert (=> b!924463 m!858801))

(declare-fun m!858803 () Bool)

(assert (=> b!924463 m!858803))

(declare-fun m!858805 () Bool)

(assert (=> b!924470 m!858805))

(declare-fun m!858807 () Bool)

(assert (=> b!924470 m!858807))

(declare-fun m!858809 () Bool)

(assert (=> b!924470 m!858809))

(declare-fun m!858811 () Bool)

(assert (=> b!924470 m!858811))

(declare-fun m!858813 () Bool)

(assert (=> b!924470 m!858813))

(declare-fun m!858815 () Bool)

(assert (=> b!924470 m!858815))

(declare-fun m!858817 () Bool)

(assert (=> b!924470 m!858817))

(declare-fun m!858819 () Bool)

(assert (=> b!924470 m!858819))

(declare-fun m!858821 () Bool)

(assert (=> b!924470 m!858821))

(assert (=> b!924470 m!858815))

(assert (=> b!924470 m!858817))

(declare-fun m!858823 () Bool)

(assert (=> b!924470 m!858823))

(assert (=> b!924470 m!858803))

(declare-fun m!858825 () Bool)

(assert (=> b!924470 m!858825))

(declare-fun m!858827 () Bool)

(assert (=> b!924470 m!858827))

(declare-fun m!858829 () Bool)

(assert (=> b!924470 m!858829))

(declare-fun m!858831 () Bool)

(assert (=> b!924470 m!858831))

(assert (=> b!924470 m!858811))

(declare-fun m!858833 () Bool)

(assert (=> b!924470 m!858833))

(check-sat (not mapNonEmpty!31308) (not b!924465) (not b!924462) (not b!924472) b_and!28125 (not b!924476) (not b_next!17193) (not start!78980) (not b!924468) (not b!924473) (not b!924471) tp_is_empty!19701 (not b!924466) (not b_lambda!13695) (not b!924463) (not b!924470))
(check-sat b_and!28125 (not b_next!17193))
