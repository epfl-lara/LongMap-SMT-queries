; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78858 () Bool)

(assert start!78858)

(declare-fun b_free!17089 () Bool)

(declare-fun b_next!17089 () Bool)

(assert (=> start!78858 (= b_free!17089 (not b_next!17089))))

(declare-fun tp!59708 () Bool)

(declare-fun b_and!27889 () Bool)

(assert (=> start!78858 (= tp!59708 b_and!27889)))

(declare-fun b!921574 () Bool)

(declare-fun e!517113 () Bool)

(declare-fun e!517114 () Bool)

(assert (=> b!921574 (= e!517113 e!517114)))

(declare-fun res!621538 () Bool)

(assert (=> b!921574 (=> (not res!621538) (not e!517114))))

(declare-fun lt!413648 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921574 (= res!621538 (validKeyInArray!0 lt!413648))))

(declare-datatypes ((array!55145 0))(
  ( (array!55146 (arr!26518 (Array (_ BitVec 32) (_ BitVec 64))) (size!26979 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55145)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921574 (= lt!413648 (select (arr!26518 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921575 () Bool)

(declare-fun e!517111 () Bool)

(declare-fun tp_is_empty!19597 () Bool)

(assert (=> b!921575 (= e!517111 tp_is_empty!19597)))

(declare-fun b!921576 () Bool)

(declare-fun res!621534 () Bool)

(declare-fun e!517116 () Bool)

(assert (=> b!921576 (=> (not res!621534) (not e!517116))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55145 (_ BitVec 32)) Bool)

(assert (=> b!921576 (= res!621534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921577 () Bool)

(declare-fun res!621541 () Bool)

(assert (=> b!921577 (=> (not res!621541) (not e!517113))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!921577 (= res!621541 (validKeyInArray!0 k0!1099))))

(declare-fun b!921578 () Bool)

(declare-fun res!621539 () Bool)

(assert (=> b!921578 (=> (not res!621539) (not e!517116))))

(assert (=> b!921578 (= res!621539 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26979 _keys!1487))))))

(declare-fun b!921579 () Bool)

(declare-fun e!517110 () Bool)

(declare-fun e!517115 () Bool)

(declare-fun mapRes!31152 () Bool)

(assert (=> b!921579 (= e!517110 (and e!517115 mapRes!31152))))

(declare-fun condMapEmpty!31152 () Bool)

(declare-datatypes ((V!31095 0))(
  ( (V!31096 (val!9849 Int)) )
))
(declare-datatypes ((ValueCell!9317 0))(
  ( (ValueCellFull!9317 (v!12366 V!31095)) (EmptyCell!9317) )
))
(declare-datatypes ((array!55147 0))(
  ( (array!55148 (arr!26519 (Array (_ BitVec 32) ValueCell!9317)) (size!26980 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55147)

(declare-fun mapDefault!31152 () ValueCell!9317)

(assert (=> b!921579 (= condMapEmpty!31152 (= (arr!26519 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9317)) mapDefault!31152)))))

(declare-fun mapNonEmpty!31152 () Bool)

(declare-fun tp!59709 () Bool)

(assert (=> mapNonEmpty!31152 (= mapRes!31152 (and tp!59709 e!517111))))

(declare-fun mapRest!31152 () (Array (_ BitVec 32) ValueCell!9317))

(declare-fun mapValue!31152 () ValueCell!9317)

(declare-fun mapKey!31152 () (_ BitVec 32))

(assert (=> mapNonEmpty!31152 (= (arr!26519 _values!1231) (store mapRest!31152 mapKey!31152 mapValue!31152))))

(declare-fun e!517112 () Bool)

(declare-fun b!921581 () Bool)

(declare-fun arrayContainsKey!0 (array!55145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921581 (= e!517112 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921582 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!921582 (= e!517112 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921583 () Bool)

(assert (=> b!921583 (= e!517115 tp_is_empty!19597)))

(declare-fun b!921584 () Bool)

(assert (=> b!921584 (= e!517116 e!517113)))

(declare-fun res!621536 () Bool)

(assert (=> b!921584 (=> (not res!621536) (not e!517113))))

(declare-datatypes ((tuple2!12870 0))(
  ( (tuple2!12871 (_1!6446 (_ BitVec 64)) (_2!6446 V!31095)) )
))
(declare-datatypes ((List!18654 0))(
  ( (Nil!18651) (Cons!18650 (h!19796 tuple2!12870) (t!26464 List!18654)) )
))
(declare-datatypes ((ListLongMap!11557 0))(
  ( (ListLongMap!11558 (toList!5794 List!18654)) )
))
(declare-fun lt!413642 () ListLongMap!11557)

(declare-fun contains!4811 (ListLongMap!11557 (_ BitVec 64)) Bool)

(assert (=> b!921584 (= res!621536 (contains!4811 lt!413642 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31095)

(declare-fun minValue!1173 () V!31095)

(declare-fun getCurrentListMap!2985 (array!55145 array!55147 (_ BitVec 32) (_ BitVec 32) V!31095 V!31095 (_ BitVec 32) Int) ListLongMap!11557)

(assert (=> b!921584 (= lt!413642 (getCurrentListMap!2985 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31152 () Bool)

(assert (=> mapIsEmpty!31152 mapRes!31152))

(declare-fun b!921585 () Bool)

(declare-fun res!621535 () Bool)

(assert (=> b!921585 (=> (not res!621535) (not e!517113))))

(assert (=> b!921585 (= res!621535 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921586 () Bool)

(assert (=> b!921586 (= e!517114 (not true))))

(assert (=> b!921586 (not (= lt!413648 k0!1099))))

(declare-datatypes ((Unit!31020 0))(
  ( (Unit!31021) )
))
(declare-fun lt!413646 () Unit!31020)

(declare-datatypes ((List!18655 0))(
  ( (Nil!18652) (Cons!18651 (h!19797 (_ BitVec 64)) (t!26465 List!18655)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55145 (_ BitVec 64) (_ BitVec 32) List!18655) Unit!31020)

(assert (=> b!921586 (= lt!413646 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18652))))

(assert (=> b!921586 e!517112))

(declare-fun c!96070 () Bool)

(assert (=> b!921586 (= c!96070 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!413640 () Unit!31020)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!192 (array!55145 array!55147 (_ BitVec 32) (_ BitVec 32) V!31095 V!31095 (_ BitVec 64) (_ BitVec 32) Int) Unit!31020)

(assert (=> b!921586 (= lt!413640 (lemmaListMapContainsThenArrayContainsFrom!192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55145 (_ BitVec 32) List!18655) Bool)

(assert (=> b!921586 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18652)))

(declare-fun lt!413644 () Unit!31020)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55145 (_ BitVec 32) (_ BitVec 32)) Unit!31020)

(assert (=> b!921586 (= lt!413644 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413645 () tuple2!12870)

(declare-fun +!2704 (ListLongMap!11557 tuple2!12870) ListLongMap!11557)

(assert (=> b!921586 (contains!4811 (+!2704 lt!413642 lt!413645) k0!1099)))

(declare-fun lt!413647 () V!31095)

(declare-fun lt!413643 () Unit!31020)

(declare-fun addStillContains!401 (ListLongMap!11557 (_ BitVec 64) V!31095 (_ BitVec 64)) Unit!31020)

(assert (=> b!921586 (= lt!413643 (addStillContains!401 lt!413642 lt!413648 lt!413647 k0!1099))))

(assert (=> b!921586 (= (getCurrentListMap!2985 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2704 (getCurrentListMap!2985 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413645))))

(assert (=> b!921586 (= lt!413645 (tuple2!12871 lt!413648 lt!413647))))

(declare-fun get!13929 (ValueCell!9317 V!31095) V!31095)

(declare-fun dynLambda!1460 (Int (_ BitVec 64)) V!31095)

(assert (=> b!921586 (= lt!413647 (get!13929 (select (arr!26519 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1460 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413641 () Unit!31020)

(declare-fun lemmaListMapRecursiveValidKeyArray!68 (array!55145 array!55147 (_ BitVec 32) (_ BitVec 32) V!31095 V!31095 (_ BitVec 32) Int) Unit!31020)

(assert (=> b!921586 (= lt!413641 (lemmaListMapRecursiveValidKeyArray!68 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921587 () Bool)

(declare-fun res!621533 () Bool)

(assert (=> b!921587 (=> (not res!621533) (not e!517113))))

(declare-fun v!791 () V!31095)

(declare-fun apply!613 (ListLongMap!11557 (_ BitVec 64)) V!31095)

(assert (=> b!921587 (= res!621533 (= (apply!613 lt!413642 k0!1099) v!791))))

(declare-fun b!921588 () Bool)

(declare-fun res!621540 () Bool)

(assert (=> b!921588 (=> (not res!621540) (not e!517116))))

(assert (=> b!921588 (= res!621540 (and (= (size!26980 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26979 _keys!1487) (size!26980 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921580 () Bool)

(declare-fun res!621537 () Bool)

(assert (=> b!921580 (=> (not res!621537) (not e!517116))))

(assert (=> b!921580 (= res!621537 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18652))))

(declare-fun res!621542 () Bool)

(assert (=> start!78858 (=> (not res!621542) (not e!517116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78858 (= res!621542 (validMask!0 mask!1881))))

(assert (=> start!78858 e!517116))

(assert (=> start!78858 true))

(assert (=> start!78858 tp_is_empty!19597))

(declare-fun array_inv!20746 (array!55147) Bool)

(assert (=> start!78858 (and (array_inv!20746 _values!1231) e!517110)))

(assert (=> start!78858 tp!59708))

(declare-fun array_inv!20747 (array!55145) Bool)

(assert (=> start!78858 (array_inv!20747 _keys!1487)))

(assert (= (and start!78858 res!621542) b!921588))

(assert (= (and b!921588 res!621540) b!921576))

(assert (= (and b!921576 res!621534) b!921580))

(assert (= (and b!921580 res!621537) b!921578))

(assert (= (and b!921578 res!621539) b!921584))

(assert (= (and b!921584 res!621536) b!921587))

(assert (= (and b!921587 res!621533) b!921585))

(assert (= (and b!921585 res!621535) b!921577))

(assert (= (and b!921577 res!621541) b!921574))

(assert (= (and b!921574 res!621538) b!921586))

(assert (= (and b!921586 c!96070) b!921581))

(assert (= (and b!921586 (not c!96070)) b!921582))

(assert (= (and b!921579 condMapEmpty!31152) mapIsEmpty!31152))

(assert (= (and b!921579 (not condMapEmpty!31152)) mapNonEmpty!31152))

(get-info :version)

(assert (= (and mapNonEmpty!31152 ((_ is ValueCellFull!9317) mapValue!31152)) b!921575))

(assert (= (and b!921579 ((_ is ValueCellFull!9317) mapDefault!31152)) b!921583))

(assert (= start!78858 b!921579))

(declare-fun b_lambda!13573 () Bool)

(assert (=> (not b_lambda!13573) (not b!921586)))

(declare-fun t!26463 () Bool)

(declare-fun tb!5661 () Bool)

(assert (=> (and start!78858 (= defaultEntry!1235 defaultEntry!1235) t!26463) tb!5661))

(declare-fun result!11153 () Bool)

(assert (=> tb!5661 (= result!11153 tp_is_empty!19597)))

(assert (=> b!921586 t!26463))

(declare-fun b_and!27891 () Bool)

(assert (= b_and!27889 (and (=> t!26463 result!11153) b_and!27891)))

(declare-fun m!855031 () Bool)

(assert (=> start!78858 m!855031))

(declare-fun m!855033 () Bool)

(assert (=> start!78858 m!855033))

(declare-fun m!855035 () Bool)

(assert (=> start!78858 m!855035))

(declare-fun m!855037 () Bool)

(assert (=> b!921581 m!855037))

(declare-fun m!855039 () Bool)

(assert (=> b!921574 m!855039))

(declare-fun m!855041 () Bool)

(assert (=> b!921574 m!855041))

(declare-fun m!855043 () Bool)

(assert (=> b!921584 m!855043))

(declare-fun m!855045 () Bool)

(assert (=> b!921584 m!855045))

(declare-fun m!855047 () Bool)

(assert (=> b!921577 m!855047))

(declare-fun m!855049 () Bool)

(assert (=> b!921576 m!855049))

(declare-fun m!855051 () Bool)

(assert (=> mapNonEmpty!31152 m!855051))

(declare-fun m!855053 () Bool)

(assert (=> b!921580 m!855053))

(declare-fun m!855055 () Bool)

(assert (=> b!921587 m!855055))

(declare-fun m!855057 () Bool)

(assert (=> b!921586 m!855057))

(declare-fun m!855059 () Bool)

(assert (=> b!921586 m!855059))

(declare-fun m!855061 () Bool)

(assert (=> b!921586 m!855061))

(assert (=> b!921586 m!855061))

(declare-fun m!855063 () Bool)

(assert (=> b!921586 m!855063))

(declare-fun m!855065 () Bool)

(assert (=> b!921586 m!855065))

(declare-fun m!855067 () Bool)

(assert (=> b!921586 m!855067))

(declare-fun m!855069 () Bool)

(assert (=> b!921586 m!855069))

(declare-fun m!855071 () Bool)

(assert (=> b!921586 m!855071))

(declare-fun m!855073 () Bool)

(assert (=> b!921586 m!855073))

(declare-fun m!855075 () Bool)

(assert (=> b!921586 m!855075))

(declare-fun m!855077 () Bool)

(assert (=> b!921586 m!855077))

(declare-fun m!855079 () Bool)

(assert (=> b!921586 m!855079))

(assert (=> b!921586 m!855067))

(assert (=> b!921586 m!855069))

(declare-fun m!855081 () Bool)

(assert (=> b!921586 m!855081))

(assert (=> b!921586 m!855057))

(declare-fun m!855083 () Bool)

(assert (=> b!921586 m!855083))

(check-sat (not b!921587) (not b!921574) (not b_lambda!13573) b_and!27891 (not b_next!17089) tp_is_empty!19597 (not start!78858) (not b!921581) (not b!921576) (not b!921577) (not mapNonEmpty!31152) (not b!921584) (not b!921586) (not b!921580))
(check-sat b_and!27891 (not b_next!17089))
