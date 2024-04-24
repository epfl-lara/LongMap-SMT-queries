; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79128 () Bool)

(assert start!79128)

(declare-fun b_free!17173 () Bool)

(declare-fun b_next!17173 () Bool)

(assert (=> start!79128 (= b_free!17173 (not b_next!17173))))

(declare-fun tp!59961 () Bool)

(declare-fun b_and!28093 () Bool)

(assert (=> start!79128 (= tp!59961 b_and!28093)))

(declare-fun b!924804 () Bool)

(declare-fun res!623210 () Bool)

(declare-fun e!519001 () Bool)

(assert (=> b!924804 (=> (not res!623210) (not e!519001))))

(declare-datatypes ((array!55383 0))(
  ( (array!55384 (arr!26632 (Array (_ BitVec 32) (_ BitVec 64))) (size!27092 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55383)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31207 0))(
  ( (V!31208 (val!9891 Int)) )
))
(declare-datatypes ((ValueCell!9359 0))(
  ( (ValueCellFull!9359 (v!12406 V!31207)) (EmptyCell!9359) )
))
(declare-datatypes ((array!55385 0))(
  ( (array!55386 (arr!26633 (Array (_ BitVec 32) ValueCell!9359)) (size!27093 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55385)

(assert (=> b!924804 (= res!623210 (and (= (size!27093 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27092 _keys!1487) (size!27093 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924805 () Bool)

(declare-fun e!519004 () Bool)

(declare-fun e!519010 () Bool)

(assert (=> b!924805 (= e!519004 e!519010)))

(declare-fun res!623216 () Bool)

(assert (=> b!924805 (=> (not res!623216) (not e!519010))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!924805 (= res!623216 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27092 _keys!1487)))))

(declare-datatypes ((Unit!31180 0))(
  ( (Unit!31181) )
))
(declare-fun lt!415613 () Unit!31180)

(declare-fun e!519009 () Unit!31180)

(assert (=> b!924805 (= lt!415613 e!519009)))

(declare-fun c!96620 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924805 (= c!96620 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!31278 () Bool)

(declare-fun mapRes!31278 () Bool)

(assert (=> mapIsEmpty!31278 mapRes!31278))

(declare-fun b!924806 () Bool)

(declare-fun e!519008 () Bool)

(assert (=> b!924806 (= e!519008 e!519004)))

(declare-fun res!623213 () Bool)

(assert (=> b!924806 (=> (not res!623213) (not e!519004))))

(declare-fun v!791 () V!31207)

(declare-fun lt!415599 () V!31207)

(assert (=> b!924806 (= res!623213 (and (= lt!415599 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12874 0))(
  ( (tuple2!12875 (_1!6448 (_ BitVec 64)) (_2!6448 V!31207)) )
))
(declare-datatypes ((List!18689 0))(
  ( (Nil!18686) (Cons!18685 (h!19837 tuple2!12874) (t!26584 List!18689)) )
))
(declare-datatypes ((ListLongMap!11573 0))(
  ( (ListLongMap!11574 (toList!5802 List!18689)) )
))
(declare-fun lt!415602 () ListLongMap!11573)

(declare-fun apply!655 (ListLongMap!11573 (_ BitVec 64)) V!31207)

(assert (=> b!924806 (= lt!415599 (apply!655 lt!415602 k0!1099))))

(declare-fun b!924807 () Bool)

(declare-fun e!519006 () Unit!31180)

(declare-fun Unit!31182 () Unit!31180)

(assert (=> b!924807 (= e!519006 Unit!31182)))

(declare-fun b!924808 () Bool)

(declare-fun e!519003 () Bool)

(declare-fun tp_is_empty!19681 () Bool)

(assert (=> b!924808 (= e!519003 tp_is_empty!19681)))

(declare-fun e!518999 () Bool)

(declare-fun b!924809 () Bool)

(declare-fun arrayContainsKey!0 (array!55383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924809 (= e!518999 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924810 () Bool)

(declare-fun e!519007 () Bool)

(assert (=> b!924810 (= e!519007 false)))

(declare-fun lt!415609 () V!31207)

(declare-fun lt!415600 () ListLongMap!11573)

(assert (=> b!924810 (= lt!415609 (apply!655 lt!415600 k0!1099))))

(declare-fun b!924811 () Bool)

(declare-fun e!519002 () Bool)

(declare-fun e!519000 () Bool)

(assert (=> b!924811 (= e!519002 (and e!519000 mapRes!31278))))

(declare-fun condMapEmpty!31278 () Bool)

(declare-fun mapDefault!31278 () ValueCell!9359)

(assert (=> b!924811 (= condMapEmpty!31278 (= (arr!26633 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9359)) mapDefault!31278)))))

(declare-fun b!924812 () Bool)

(declare-fun res!623209 () Bool)

(assert (=> b!924812 (=> (not res!623209) (not e!519001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55383 (_ BitVec 32)) Bool)

(assert (=> b!924812 (= res!623209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924813 () Bool)

(declare-fun lt!415601 () ListLongMap!11573)

(assert (=> b!924813 (= (apply!655 lt!415601 k0!1099) lt!415599)))

(declare-fun lt!415610 () (_ BitVec 64))

(declare-fun lt!415604 () V!31207)

(declare-fun lt!415608 () Unit!31180)

(declare-fun addApplyDifferent!360 (ListLongMap!11573 (_ BitVec 64) V!31207 (_ BitVec 64)) Unit!31180)

(assert (=> b!924813 (= lt!415608 (addApplyDifferent!360 lt!415602 lt!415610 lt!415604 k0!1099))))

(assert (=> b!924813 (not (= lt!415610 k0!1099))))

(declare-fun lt!415606 () Unit!31180)

(declare-datatypes ((List!18690 0))(
  ( (Nil!18687) (Cons!18686 (h!19838 (_ BitVec 64)) (t!26585 List!18690)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55383 (_ BitVec 64) (_ BitVec 32) List!18690) Unit!31180)

(assert (=> b!924813 (= lt!415606 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18687))))

(assert (=> b!924813 e!518999))

(declare-fun c!96619 () Bool)

(assert (=> b!924813 (= c!96619 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415612 () Unit!31180)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31207)

(declare-fun minValue!1173 () V!31207)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!215 (array!55383 array!55385 (_ BitVec 32) (_ BitVec 32) V!31207 V!31207 (_ BitVec 64) (_ BitVec 32) Int) Unit!31180)

(assert (=> b!924813 (= lt!415612 (lemmaListMapContainsThenArrayContainsFrom!215 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55383 (_ BitVec 32) List!18690) Bool)

(assert (=> b!924813 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18687)))

(declare-fun lt!415611 () Unit!31180)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55383 (_ BitVec 32) (_ BitVec 32)) Unit!31180)

(assert (=> b!924813 (= lt!415611 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4874 (ListLongMap!11573 (_ BitVec 64)) Bool)

(assert (=> b!924813 (contains!4874 lt!415601 k0!1099)))

(declare-fun lt!415607 () tuple2!12874)

(declare-fun +!2724 (ListLongMap!11573 tuple2!12874) ListLongMap!11573)

(assert (=> b!924813 (= lt!415601 (+!2724 lt!415602 lt!415607))))

(declare-fun lt!415605 () Unit!31180)

(declare-fun addStillContains!433 (ListLongMap!11573 (_ BitVec 64) V!31207 (_ BitVec 64)) Unit!31180)

(assert (=> b!924813 (= lt!415605 (addStillContains!433 lt!415602 lt!415610 lt!415604 k0!1099))))

(declare-fun getCurrentListMap!3052 (array!55383 array!55385 (_ BitVec 32) (_ BitVec 32) V!31207 V!31207 (_ BitVec 32) Int) ListLongMap!11573)

(assert (=> b!924813 (= (getCurrentListMap!3052 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2724 (getCurrentListMap!3052 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415607))))

(assert (=> b!924813 (= lt!415607 (tuple2!12875 lt!415610 lt!415604))))

(declare-fun get!14017 (ValueCell!9359 V!31207) V!31207)

(declare-fun dynLambda!1521 (Int (_ BitVec 64)) V!31207)

(assert (=> b!924813 (= lt!415604 (get!14017 (select (arr!26633 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1521 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415603 () Unit!31180)

(declare-fun lemmaListMapRecursiveValidKeyArray!104 (array!55383 array!55385 (_ BitVec 32) (_ BitVec 32) V!31207 V!31207 (_ BitVec 32) Int) Unit!31180)

(assert (=> b!924813 (= lt!415603 (lemmaListMapRecursiveValidKeyArray!104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924813 (= e!519006 lt!415608)))

(declare-fun b!924815 () Bool)

(declare-fun res!623215 () Bool)

(assert (=> b!924815 (=> (not res!623215) (not e!519001))))

(assert (=> b!924815 (= res!623215 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27092 _keys!1487))))))

(declare-fun b!924816 () Bool)

(declare-fun Unit!31183 () Unit!31180)

(assert (=> b!924816 (= e!519009 Unit!31183)))

(declare-fun b!924817 () Bool)

(assert (=> b!924817 (= e!518999 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!31278 () Bool)

(declare-fun tp!59960 () Bool)

(assert (=> mapNonEmpty!31278 (= mapRes!31278 (and tp!59960 e!519003))))

(declare-fun mapValue!31278 () ValueCell!9359)

(declare-fun mapRest!31278 () (Array (_ BitVec 32) ValueCell!9359))

(declare-fun mapKey!31278 () (_ BitVec 32))

(assert (=> mapNonEmpty!31278 (= (arr!26633 _values!1231) (store mapRest!31278 mapKey!31278 mapValue!31278))))

(declare-fun b!924818 () Bool)

(assert (=> b!924818 (= e!519000 tp_is_empty!19681)))

(declare-fun b!924819 () Bool)

(assert (=> b!924819 (= e!519001 e!519008)))

(declare-fun res!623212 () Bool)

(assert (=> b!924819 (=> (not res!623212) (not e!519008))))

(assert (=> b!924819 (= res!623212 (contains!4874 lt!415602 k0!1099))))

(assert (=> b!924819 (= lt!415602 (getCurrentListMap!3052 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924814 () Bool)

(assert (=> b!924814 (= e!519010 e!519007)))

(declare-fun res!623217 () Bool)

(assert (=> b!924814 (=> (not res!623217) (not e!519007))))

(assert (=> b!924814 (= res!623217 (contains!4874 lt!415600 k0!1099))))

(assert (=> b!924814 (= lt!415600 (getCurrentListMap!3052 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!623214 () Bool)

(assert (=> start!79128 (=> (not res!623214) (not e!519001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79128 (= res!623214 (validMask!0 mask!1881))))

(assert (=> start!79128 e!519001))

(assert (=> start!79128 true))

(assert (=> start!79128 tp_is_empty!19681))

(declare-fun array_inv!20844 (array!55385) Bool)

(assert (=> start!79128 (and (array_inv!20844 _values!1231) e!519002)))

(assert (=> start!79128 tp!59961))

(declare-fun array_inv!20845 (array!55383) Bool)

(assert (=> start!79128 (array_inv!20845 _keys!1487)))

(declare-fun b!924820 () Bool)

(declare-fun res!623211 () Bool)

(assert (=> b!924820 (=> (not res!623211) (not e!519001))))

(assert (=> b!924820 (= res!623211 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18687))))

(declare-fun b!924821 () Bool)

(assert (=> b!924821 (= e!519009 e!519006)))

(assert (=> b!924821 (= lt!415610 (select (arr!26632 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96621 () Bool)

(assert (=> b!924821 (= c!96621 (validKeyInArray!0 lt!415610))))

(assert (= (and start!79128 res!623214) b!924804))

(assert (= (and b!924804 res!623210) b!924812))

(assert (= (and b!924812 res!623209) b!924820))

(assert (= (and b!924820 res!623211) b!924815))

(assert (= (and b!924815 res!623215) b!924819))

(assert (= (and b!924819 res!623212) b!924806))

(assert (= (and b!924806 res!623213) b!924805))

(assert (= (and b!924805 c!96620) b!924821))

(assert (= (and b!924805 (not c!96620)) b!924816))

(assert (= (and b!924821 c!96621) b!924813))

(assert (= (and b!924821 (not c!96621)) b!924807))

(assert (= (and b!924813 c!96619) b!924809))

(assert (= (and b!924813 (not c!96619)) b!924817))

(assert (= (and b!924805 res!623216) b!924814))

(assert (= (and b!924814 res!623217) b!924810))

(assert (= (and b!924811 condMapEmpty!31278) mapIsEmpty!31278))

(assert (= (and b!924811 (not condMapEmpty!31278)) mapNonEmpty!31278))

(get-info :version)

(assert (= (and mapNonEmpty!31278 ((_ is ValueCellFull!9359) mapValue!31278)) b!924808))

(assert (= (and b!924811 ((_ is ValueCellFull!9359) mapDefault!31278)) b!924818))

(assert (= start!79128 b!924811))

(declare-fun b_lambda!13689 () Bool)

(assert (=> (not b_lambda!13689) (not b!924813)))

(declare-fun t!26583 () Bool)

(declare-fun tb!5745 () Bool)

(assert (=> (and start!79128 (= defaultEntry!1235 defaultEntry!1235) t!26583) tb!5745))

(declare-fun result!11321 () Bool)

(assert (=> tb!5745 (= result!11321 tp_is_empty!19681)))

(assert (=> b!924813 t!26583))

(declare-fun b_and!28095 () Bool)

(assert (= b_and!28093 (and (=> t!26583 result!11321) b_and!28095)))

(declare-fun m!859447 () Bool)

(assert (=> b!924810 m!859447))

(declare-fun m!859449 () Bool)

(assert (=> b!924821 m!859449))

(declare-fun m!859451 () Bool)

(assert (=> b!924821 m!859451))

(declare-fun m!859453 () Bool)

(assert (=> b!924809 m!859453))

(declare-fun m!859455 () Bool)

(assert (=> mapNonEmpty!31278 m!859455))

(declare-fun m!859457 () Bool)

(assert (=> b!924806 m!859457))

(declare-fun m!859459 () Bool)

(assert (=> b!924805 m!859459))

(declare-fun m!859461 () Bool)

(assert (=> b!924814 m!859461))

(declare-fun m!859463 () Bool)

(assert (=> b!924814 m!859463))

(declare-fun m!859465 () Bool)

(assert (=> b!924812 m!859465))

(declare-fun m!859467 () Bool)

(assert (=> b!924813 m!859467))

(declare-fun m!859469 () Bool)

(assert (=> b!924813 m!859469))

(declare-fun m!859471 () Bool)

(assert (=> b!924813 m!859471))

(declare-fun m!859473 () Bool)

(assert (=> b!924813 m!859473))

(declare-fun m!859475 () Bool)

(assert (=> b!924813 m!859475))

(declare-fun m!859477 () Bool)

(assert (=> b!924813 m!859477))

(declare-fun m!859479 () Bool)

(assert (=> b!924813 m!859479))

(declare-fun m!859481 () Bool)

(assert (=> b!924813 m!859481))

(assert (=> b!924813 m!859475))

(assert (=> b!924813 m!859477))

(declare-fun m!859483 () Bool)

(assert (=> b!924813 m!859483))

(assert (=> b!924813 m!859463))

(declare-fun m!859485 () Bool)

(assert (=> b!924813 m!859485))

(declare-fun m!859487 () Bool)

(assert (=> b!924813 m!859487))

(declare-fun m!859489 () Bool)

(assert (=> b!924813 m!859489))

(assert (=> b!924813 m!859479))

(declare-fun m!859491 () Bool)

(assert (=> b!924813 m!859491))

(declare-fun m!859493 () Bool)

(assert (=> b!924813 m!859493))

(declare-fun m!859495 () Bool)

(assert (=> b!924813 m!859495))

(declare-fun m!859497 () Bool)

(assert (=> b!924820 m!859497))

(declare-fun m!859499 () Bool)

(assert (=> start!79128 m!859499))

(declare-fun m!859501 () Bool)

(assert (=> start!79128 m!859501))

(declare-fun m!859503 () Bool)

(assert (=> start!79128 m!859503))

(declare-fun m!859505 () Bool)

(assert (=> b!924819 m!859505))

(declare-fun m!859507 () Bool)

(assert (=> b!924819 m!859507))

(check-sat (not b_lambda!13689) (not b_next!17173) (not b!924805) (not b!924806) b_and!28095 (not start!79128) (not b!924820) (not b!924821) (not b!924819) (not mapNonEmpty!31278) (not b!924814) (not b!924812) (not b!924810) (not b!924809) (not b!924813) tp_is_empty!19681)
(check-sat b_and!28095 (not b_next!17173))
