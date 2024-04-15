; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78954 () Bool)

(assert start!78954)

(declare-fun b_free!17185 () Bool)

(declare-fun b_next!17185 () Bool)

(assert (=> start!78954 (= b_free!17185 (not b_next!17185))))

(declare-fun tp!59996 () Bool)

(declare-fun b_and!28081 () Bool)

(assert (=> start!78954 (= tp!59996 b_and!28081)))

(declare-fun b!923998 () Bool)

(declare-fun e!518495 () Bool)

(assert (=> b!923998 (= e!518495 false)))

(declare-datatypes ((V!31223 0))(
  ( (V!31224 (val!9897 Int)) )
))
(declare-fun lt!415273 () V!31223)

(declare-datatypes ((tuple2!12956 0))(
  ( (tuple2!12957 (_1!6489 (_ BitVec 64)) (_2!6489 V!31223)) )
))
(declare-datatypes ((List!18735 0))(
  ( (Nil!18732) (Cons!18731 (h!19877 tuple2!12956) (t!26641 List!18735)) )
))
(declare-datatypes ((ListLongMap!11643 0))(
  ( (ListLongMap!11644 (toList!5837 List!18735)) )
))
(declare-fun lt!415283 () ListLongMap!11643)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!648 (ListLongMap!11643 (_ BitVec 64)) V!31223)

(assert (=> b!923998 (= lt!415273 (apply!648 lt!415283 k0!1099))))

(declare-fun b!923999 () Bool)

(declare-fun res!622924 () Bool)

(declare-fun e!518493 () Bool)

(assert (=> b!923999 (=> (not res!622924) (not e!518493))))

(declare-datatypes ((array!55331 0))(
  ( (array!55332 (arr!26611 (Array (_ BitVec 32) (_ BitVec 64))) (size!27072 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55331)

(declare-datatypes ((List!18736 0))(
  ( (Nil!18733) (Cons!18732 (h!19878 (_ BitVec 64)) (t!26642 List!18736)) )
))
(declare-fun arrayNoDuplicates!0 (array!55331 (_ BitVec 32) List!18736) Bool)

(assert (=> b!923999 (= res!622924 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18733))))

(declare-fun b!924000 () Bool)

(declare-fun e!518496 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!924000 (= e!518496 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924001 () Bool)

(declare-fun e!518488 () Bool)

(declare-fun tp_is_empty!19693 () Bool)

(assert (=> b!924001 (= e!518488 tp_is_empty!19693)))

(declare-fun b!924002 () Bool)

(declare-fun lt!415279 () ListLongMap!11643)

(declare-fun lt!415284 () V!31223)

(assert (=> b!924002 (= (apply!648 lt!415279 k0!1099) lt!415284)))

(declare-fun lt!415285 () (_ BitVec 64))

(declare-fun lt!415275 () V!31223)

(declare-datatypes ((Unit!31114 0))(
  ( (Unit!31115) )
))
(declare-fun lt!415274 () Unit!31114)

(declare-fun lt!415282 () ListLongMap!11643)

(declare-fun addApplyDifferent!365 (ListLongMap!11643 (_ BitVec 64) V!31223 (_ BitVec 64)) Unit!31114)

(assert (=> b!924002 (= lt!415274 (addApplyDifferent!365 lt!415282 lt!415285 lt!415275 k0!1099))))

(assert (=> b!924002 (not (= lt!415285 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!415277 () Unit!31114)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55331 (_ BitVec 64) (_ BitVec 32) List!18736) Unit!31114)

(assert (=> b!924002 (= lt!415277 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18733))))

(assert (=> b!924002 e!518496))

(declare-fun c!96327 () Bool)

(assert (=> b!924002 (= c!96327 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415286 () Unit!31114)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9365 0))(
  ( (ValueCellFull!9365 (v!12414 V!31223)) (EmptyCell!9365) )
))
(declare-datatypes ((array!55333 0))(
  ( (array!55334 (arr!26612 (Array (_ BitVec 32) ValueCell!9365)) (size!27073 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55333)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31223)

(declare-fun minValue!1173 () V!31223)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!225 (array!55331 array!55333 (_ BitVec 32) (_ BitVec 32) V!31223 V!31223 (_ BitVec 64) (_ BitVec 32) Int) Unit!31114)

(assert (=> b!924002 (= lt!415286 (lemmaListMapContainsThenArrayContainsFrom!225 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!924002 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18733)))

(declare-fun lt!415272 () Unit!31114)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55331 (_ BitVec 32) (_ BitVec 32)) Unit!31114)

(assert (=> b!924002 (= lt!415272 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4850 (ListLongMap!11643 (_ BitVec 64)) Bool)

(assert (=> b!924002 (contains!4850 lt!415279 k0!1099)))

(declare-fun lt!415278 () tuple2!12956)

(declare-fun +!2737 (ListLongMap!11643 tuple2!12956) ListLongMap!11643)

(assert (=> b!924002 (= lt!415279 (+!2737 lt!415282 lt!415278))))

(declare-fun lt!415280 () Unit!31114)

(declare-fun addStillContains!434 (ListLongMap!11643 (_ BitVec 64) V!31223 (_ BitVec 64)) Unit!31114)

(assert (=> b!924002 (= lt!415280 (addStillContains!434 lt!415282 lt!415285 lt!415275 k0!1099))))

(declare-fun getCurrentListMap!3024 (array!55331 array!55333 (_ BitVec 32) (_ BitVec 32) V!31223 V!31223 (_ BitVec 32) Int) ListLongMap!11643)

(assert (=> b!924002 (= (getCurrentListMap!3024 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2737 (getCurrentListMap!3024 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415278))))

(assert (=> b!924002 (= lt!415278 (tuple2!12957 lt!415285 lt!415275))))

(declare-fun get!13994 (ValueCell!9365 V!31223) V!31223)

(declare-fun dynLambda!1493 (Int (_ BitVec 64)) V!31223)

(assert (=> b!924002 (= lt!415275 (get!13994 (select (arr!26612 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1493 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415276 () Unit!31114)

(declare-fun lemmaListMapRecursiveValidKeyArray!101 (array!55331 array!55333 (_ BitVec 32) (_ BitVec 32) V!31223 V!31223 (_ BitVec 32) Int) Unit!31114)

(assert (=> b!924002 (= lt!415276 (lemmaListMapRecursiveValidKeyArray!101 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!518489 () Unit!31114)

(assert (=> b!924002 (= e!518489 lt!415274)))

(declare-fun mapNonEmpty!31296 () Bool)

(declare-fun mapRes!31296 () Bool)

(declare-fun tp!59997 () Bool)

(declare-fun e!518486 () Bool)

(assert (=> mapNonEmpty!31296 (= mapRes!31296 (and tp!59997 e!518486))))

(declare-fun mapKey!31296 () (_ BitVec 32))

(declare-fun mapValue!31296 () ValueCell!9365)

(declare-fun mapRest!31296 () (Array (_ BitVec 32) ValueCell!9365))

(assert (=> mapNonEmpty!31296 (= (arr!26612 _values!1231) (store mapRest!31296 mapKey!31296 mapValue!31296))))

(declare-fun res!622923 () Bool)

(assert (=> start!78954 (=> (not res!622923) (not e!518493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78954 (= res!622923 (validMask!0 mask!1881))))

(assert (=> start!78954 e!518493))

(assert (=> start!78954 true))

(assert (=> start!78954 tp_is_empty!19693))

(declare-fun e!518490 () Bool)

(declare-fun array_inv!20810 (array!55333) Bool)

(assert (=> start!78954 (and (array_inv!20810 _values!1231) e!518490)))

(assert (=> start!78954 tp!59996))

(declare-fun array_inv!20811 (array!55331) Bool)

(assert (=> start!78954 (array_inv!20811 _keys!1487)))

(declare-fun b!924003 () Bool)

(assert (=> b!924003 (= e!518490 (and e!518488 mapRes!31296))))

(declare-fun condMapEmpty!31296 () Bool)

(declare-fun mapDefault!31296 () ValueCell!9365)

(assert (=> b!924003 (= condMapEmpty!31296 (= (arr!26612 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9365)) mapDefault!31296)))))

(declare-fun b!924004 () Bool)

(declare-fun res!622922 () Bool)

(assert (=> b!924004 (=> (not res!622922) (not e!518493))))

(assert (=> b!924004 (= res!622922 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27072 _keys!1487))))))

(declare-fun b!924005 () Bool)

(declare-fun e!518491 () Unit!31114)

(declare-fun Unit!31116 () Unit!31114)

(assert (=> b!924005 (= e!518491 Unit!31116)))

(declare-fun b!924006 () Bool)

(declare-fun e!518485 () Bool)

(assert (=> b!924006 (= e!518485 e!518495)))

(declare-fun res!622917 () Bool)

(assert (=> b!924006 (=> (not res!622917) (not e!518495))))

(assert (=> b!924006 (= res!622917 (contains!4850 lt!415283 k0!1099))))

(assert (=> b!924006 (= lt!415283 (getCurrentListMap!3024 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924007 () Bool)

(declare-fun arrayContainsKey!0 (array!55331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924007 (= e!518496 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924008 () Bool)

(declare-fun e!518487 () Bool)

(assert (=> b!924008 (= e!518487 e!518485)))

(declare-fun res!622920 () Bool)

(assert (=> b!924008 (=> (not res!622920) (not e!518485))))

(assert (=> b!924008 (= res!622920 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27072 _keys!1487)))))

(declare-fun lt!415281 () Unit!31114)

(assert (=> b!924008 (= lt!415281 e!518491)))

(declare-fun c!96328 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924008 (= c!96328 (validKeyInArray!0 k0!1099))))

(declare-fun b!924009 () Bool)

(declare-fun res!622921 () Bool)

(assert (=> b!924009 (=> (not res!622921) (not e!518493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55331 (_ BitVec 32)) Bool)

(assert (=> b!924009 (= res!622921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31296 () Bool)

(assert (=> mapIsEmpty!31296 mapRes!31296))

(declare-fun b!924010 () Bool)

(declare-fun e!518492 () Bool)

(assert (=> b!924010 (= e!518492 e!518487)))

(declare-fun res!622919 () Bool)

(assert (=> b!924010 (=> (not res!622919) (not e!518487))))

(declare-fun v!791 () V!31223)

(assert (=> b!924010 (= res!622919 (and (= lt!415284 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924010 (= lt!415284 (apply!648 lt!415282 k0!1099))))

(declare-fun b!924011 () Bool)

(assert (=> b!924011 (= e!518491 e!518489)))

(assert (=> b!924011 (= lt!415285 (select (arr!26611 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96326 () Bool)

(assert (=> b!924011 (= c!96326 (validKeyInArray!0 lt!415285))))

(declare-fun b!924012 () Bool)

(assert (=> b!924012 (= e!518486 tp_is_empty!19693)))

(declare-fun b!924013 () Bool)

(declare-fun res!622925 () Bool)

(assert (=> b!924013 (=> (not res!622925) (not e!518493))))

(assert (=> b!924013 (= res!622925 (and (= (size!27073 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27072 _keys!1487) (size!27073 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924014 () Bool)

(assert (=> b!924014 (= e!518493 e!518492)))

(declare-fun res!622918 () Bool)

(assert (=> b!924014 (=> (not res!622918) (not e!518492))))

(assert (=> b!924014 (= res!622918 (contains!4850 lt!415282 k0!1099))))

(assert (=> b!924014 (= lt!415282 (getCurrentListMap!3024 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924015 () Bool)

(declare-fun Unit!31117 () Unit!31114)

(assert (=> b!924015 (= e!518489 Unit!31117)))

(assert (= (and start!78954 res!622923) b!924013))

(assert (= (and b!924013 res!622925) b!924009))

(assert (= (and b!924009 res!622921) b!923999))

(assert (= (and b!923999 res!622924) b!924004))

(assert (= (and b!924004 res!622922) b!924014))

(assert (= (and b!924014 res!622918) b!924010))

(assert (= (and b!924010 res!622919) b!924008))

(assert (= (and b!924008 c!96328) b!924011))

(assert (= (and b!924008 (not c!96328)) b!924005))

(assert (= (and b!924011 c!96326) b!924002))

(assert (= (and b!924011 (not c!96326)) b!924015))

(assert (= (and b!924002 c!96327) b!924007))

(assert (= (and b!924002 (not c!96327)) b!924000))

(assert (= (and b!924008 res!622920) b!924006))

(assert (= (and b!924006 res!622917) b!923998))

(assert (= (and b!924003 condMapEmpty!31296) mapIsEmpty!31296))

(assert (= (and b!924003 (not condMapEmpty!31296)) mapNonEmpty!31296))

(get-info :version)

(assert (= (and mapNonEmpty!31296 ((_ is ValueCellFull!9365) mapValue!31296)) b!924012))

(assert (= (and b!924003 ((_ is ValueCellFull!9365) mapDefault!31296)) b!924001))

(assert (= start!78954 b!924003))

(declare-fun b_lambda!13669 () Bool)

(assert (=> (not b_lambda!13669) (not b!924002)))

(declare-fun t!26640 () Bool)

(declare-fun tb!5757 () Bool)

(assert (=> (and start!78954 (= defaultEntry!1235 defaultEntry!1235) t!26640) tb!5757))

(declare-fun result!11345 () Bool)

(assert (=> tb!5757 (= result!11345 tp_is_empty!19693)))

(assert (=> b!924002 t!26640))

(declare-fun b_and!28083 () Bool)

(assert (= b_and!28081 (and (=> t!26640 result!11345) b_and!28083)))

(declare-fun m!857767 () Bool)

(assert (=> b!923999 m!857767))

(declare-fun m!857769 () Bool)

(assert (=> start!78954 m!857769))

(declare-fun m!857771 () Bool)

(assert (=> start!78954 m!857771))

(declare-fun m!857773 () Bool)

(assert (=> start!78954 m!857773))

(declare-fun m!857775 () Bool)

(assert (=> b!924009 m!857775))

(declare-fun m!857777 () Bool)

(assert (=> b!924011 m!857777))

(declare-fun m!857779 () Bool)

(assert (=> b!924011 m!857779))

(declare-fun m!857781 () Bool)

(assert (=> b!924002 m!857781))

(declare-fun m!857783 () Bool)

(assert (=> b!924002 m!857783))

(declare-fun m!857785 () Bool)

(assert (=> b!924002 m!857785))

(declare-fun m!857787 () Bool)

(assert (=> b!924002 m!857787))

(declare-fun m!857789 () Bool)

(assert (=> b!924002 m!857789))

(assert (=> b!924002 m!857787))

(assert (=> b!924002 m!857789))

(declare-fun m!857791 () Bool)

(assert (=> b!924002 m!857791))

(declare-fun m!857793 () Bool)

(assert (=> b!924002 m!857793))

(declare-fun m!857795 () Bool)

(assert (=> b!924002 m!857795))

(declare-fun m!857797 () Bool)

(assert (=> b!924002 m!857797))

(declare-fun m!857799 () Bool)

(assert (=> b!924002 m!857799))

(declare-fun m!857801 () Bool)

(assert (=> b!924002 m!857801))

(declare-fun m!857803 () Bool)

(assert (=> b!924002 m!857803))

(declare-fun m!857805 () Bool)

(assert (=> b!924002 m!857805))

(declare-fun m!857807 () Bool)

(assert (=> b!924002 m!857807))

(declare-fun m!857809 () Bool)

(assert (=> b!924002 m!857809))

(assert (=> b!924002 m!857795))

(declare-fun m!857811 () Bool)

(assert (=> b!924002 m!857811))

(declare-fun m!857813 () Bool)

(assert (=> b!924006 m!857813))

(assert (=> b!924006 m!857809))

(declare-fun m!857815 () Bool)

(assert (=> b!924008 m!857815))

(declare-fun m!857817 () Bool)

(assert (=> b!923998 m!857817))

(declare-fun m!857819 () Bool)

(assert (=> b!924014 m!857819))

(declare-fun m!857821 () Bool)

(assert (=> b!924014 m!857821))

(declare-fun m!857823 () Bool)

(assert (=> b!924010 m!857823))

(declare-fun m!857825 () Bool)

(assert (=> mapNonEmpty!31296 m!857825))

(declare-fun m!857827 () Bool)

(assert (=> b!924007 m!857827))

(check-sat (not b!924007) (not b!923998) (not b!923999) (not b!924011) (not b_lambda!13669) (not b!924002) tp_is_empty!19693 (not b!924008) (not mapNonEmpty!31296) b_and!28083 (not b!924009) (not start!78954) (not b_next!17185) (not b!924006) (not b!924014) (not b!924010))
(check-sat b_and!28083 (not b_next!17185))
