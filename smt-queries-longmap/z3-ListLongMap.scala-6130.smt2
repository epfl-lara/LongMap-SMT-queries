; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78870 () Bool)

(assert start!78870)

(declare-fun b_free!17101 () Bool)

(declare-fun b_next!17101 () Bool)

(assert (=> start!78870 (= b_free!17101 (not b_next!17101))))

(declare-fun tp!59744 () Bool)

(declare-fun b_and!27913 () Bool)

(assert (=> start!78870 (= tp!59744 b_and!27913)))

(declare-fun b!921856 () Bool)

(declare-fun e!517253 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!921856 (= e!517253 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921857 () Bool)

(declare-fun res!621720 () Bool)

(declare-fun e!517258 () Bool)

(assert (=> b!921857 (=> (not res!621720) (not e!517258))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55169 0))(
  ( (array!55170 (arr!26530 (Array (_ BitVec 32) (_ BitVec 64))) (size!26991 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55169)

(assert (=> b!921857 (= res!621720 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26991 _keys!1487))))))

(declare-fun b!921858 () Bool)

(declare-fun arrayContainsKey!0 (array!55169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921858 (= e!517253 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921859 () Bool)

(declare-fun e!517256 () Bool)

(declare-fun e!517255 () Bool)

(declare-fun mapRes!31170 () Bool)

(assert (=> b!921859 (= e!517256 (and e!517255 mapRes!31170))))

(declare-fun condMapEmpty!31170 () Bool)

(declare-datatypes ((V!31111 0))(
  ( (V!31112 (val!9855 Int)) )
))
(declare-datatypes ((ValueCell!9323 0))(
  ( (ValueCellFull!9323 (v!12372 V!31111)) (EmptyCell!9323) )
))
(declare-datatypes ((array!55171 0))(
  ( (array!55172 (arr!26531 (Array (_ BitVec 32) ValueCell!9323)) (size!26992 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55171)

(declare-fun mapDefault!31170 () ValueCell!9323)

(assert (=> b!921859 (= condMapEmpty!31170 (= (arr!26531 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9323)) mapDefault!31170)))))

(declare-fun b!921860 () Bool)

(declare-fun e!517257 () Bool)

(declare-fun tp_is_empty!19609 () Bool)

(assert (=> b!921860 (= e!517257 tp_is_empty!19609)))

(declare-fun b!921861 () Bool)

(declare-fun res!621718 () Bool)

(declare-fun e!517259 () Bool)

(assert (=> b!921861 (=> (not res!621718) (not e!517259))))

(assert (=> b!921861 (= res!621718 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921862 () Bool)

(declare-fun res!621721 () Bool)

(assert (=> b!921862 (=> (not res!621721) (not e!517259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921862 (= res!621721 (validKeyInArray!0 k0!1099))))

(declare-fun b!921863 () Bool)

(declare-fun e!517254 () Bool)

(assert (=> b!921863 (= e!517259 e!517254)))

(declare-fun res!621717 () Bool)

(assert (=> b!921863 (=> (not res!621717) (not e!517254))))

(declare-fun lt!413804 () (_ BitVec 64))

(assert (=> b!921863 (= res!621717 (validKeyInArray!0 lt!413804))))

(assert (=> b!921863 (= lt!413804 (select (arr!26530 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31170 () Bool)

(declare-fun tp!59745 () Bool)

(assert (=> mapNonEmpty!31170 (= mapRes!31170 (and tp!59745 e!517257))))

(declare-fun mapRest!31170 () (Array (_ BitVec 32) ValueCell!9323))

(declare-fun mapKey!31170 () (_ BitVec 32))

(declare-fun mapValue!31170 () ValueCell!9323)

(assert (=> mapNonEmpty!31170 (= (arr!26531 _values!1231) (store mapRest!31170 mapKey!31170 mapValue!31170))))

(declare-fun b!921864 () Bool)

(declare-fun res!621714 () Bool)

(assert (=> b!921864 (=> (not res!621714) (not e!517258))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55169 (_ BitVec 32)) Bool)

(assert (=> b!921864 (= res!621714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921866 () Bool)

(declare-fun res!621719 () Bool)

(assert (=> b!921866 (=> (not res!621719) (not e!517258))))

(assert (=> b!921866 (= res!621719 (and (= (size!26992 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26991 _keys!1487) (size!26992 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921867 () Bool)

(assert (=> b!921867 (= e!517258 e!517259)))

(declare-fun res!621722 () Bool)

(assert (=> b!921867 (=> (not res!621722) (not e!517259))))

(declare-datatypes ((tuple2!12882 0))(
  ( (tuple2!12883 (_1!6452 (_ BitVec 64)) (_2!6452 V!31111)) )
))
(declare-datatypes ((List!18665 0))(
  ( (Nil!18662) (Cons!18661 (h!19807 tuple2!12882) (t!26487 List!18665)) )
))
(declare-datatypes ((ListLongMap!11569 0))(
  ( (ListLongMap!11570 (toList!5800 List!18665)) )
))
(declare-fun lt!413802 () ListLongMap!11569)

(declare-fun contains!4816 (ListLongMap!11569 (_ BitVec 64)) Bool)

(assert (=> b!921867 (= res!621722 (contains!4816 lt!413802 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31111)

(declare-fun minValue!1173 () V!31111)

(declare-fun getCurrentListMap!2990 (array!55169 array!55171 (_ BitVec 32) (_ BitVec 32) V!31111 V!31111 (_ BitVec 32) Int) ListLongMap!11569)

(assert (=> b!921867 (= lt!413802 (getCurrentListMap!2990 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921868 () Bool)

(declare-fun res!621713 () Bool)

(assert (=> b!921868 (=> (not res!621713) (not e!517258))))

(declare-datatypes ((List!18666 0))(
  ( (Nil!18663) (Cons!18662 (h!19808 (_ BitVec 64)) (t!26488 List!18666)) )
))
(declare-fun arrayNoDuplicates!0 (array!55169 (_ BitVec 32) List!18666) Bool)

(assert (=> b!921868 (= res!621713 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18663))))

(declare-fun b!921869 () Bool)

(assert (=> b!921869 (= e!517254 (not true))))

(assert (=> b!921869 (not (= lt!413804 k0!1099))))

(declare-datatypes ((Unit!31028 0))(
  ( (Unit!31029) )
))
(declare-fun lt!413803 () Unit!31028)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55169 (_ BitVec 64) (_ BitVec 32) List!18666) Unit!31028)

(assert (=> b!921869 (= lt!413803 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18663))))

(assert (=> b!921869 e!517253))

(declare-fun c!96088 () Bool)

(assert (=> b!921869 (= c!96088 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!413807 () Unit!31028)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!196 (array!55169 array!55171 (_ BitVec 32) (_ BitVec 32) V!31111 V!31111 (_ BitVec 64) (_ BitVec 32) Int) Unit!31028)

(assert (=> b!921869 (= lt!413807 (lemmaListMapContainsThenArrayContainsFrom!196 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!921869 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18663)))

(declare-fun lt!413806 () Unit!31028)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55169 (_ BitVec 32) (_ BitVec 32)) Unit!31028)

(assert (=> b!921869 (= lt!413806 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413809 () tuple2!12882)

(declare-fun +!2708 (ListLongMap!11569 tuple2!12882) ListLongMap!11569)

(assert (=> b!921869 (contains!4816 (+!2708 lt!413802 lt!413809) k0!1099)))

(declare-fun lt!413805 () Unit!31028)

(declare-fun lt!413808 () V!31111)

(declare-fun addStillContains!405 (ListLongMap!11569 (_ BitVec 64) V!31111 (_ BitVec 64)) Unit!31028)

(assert (=> b!921869 (= lt!413805 (addStillContains!405 lt!413802 lt!413804 lt!413808 k0!1099))))

(assert (=> b!921869 (= (getCurrentListMap!2990 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2708 (getCurrentListMap!2990 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413809))))

(assert (=> b!921869 (= lt!413809 (tuple2!12883 lt!413804 lt!413808))))

(declare-fun get!13937 (ValueCell!9323 V!31111) V!31111)

(declare-fun dynLambda!1464 (Int (_ BitVec 64)) V!31111)

(assert (=> b!921869 (= lt!413808 (get!13937 (select (arr!26531 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1464 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413810 () Unit!31028)

(declare-fun lemmaListMapRecursiveValidKeyArray!72 (array!55169 array!55171 (_ BitVec 32) (_ BitVec 32) V!31111 V!31111 (_ BitVec 32) Int) Unit!31028)

(assert (=> b!921869 (= lt!413810 (lemmaListMapRecursiveValidKeyArray!72 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921870 () Bool)

(declare-fun res!621715 () Bool)

(assert (=> b!921870 (=> (not res!621715) (not e!517259))))

(declare-fun v!791 () V!31111)

(declare-fun apply!617 (ListLongMap!11569 (_ BitVec 64)) V!31111)

(assert (=> b!921870 (= res!621715 (= (apply!617 lt!413802 k0!1099) v!791))))

(declare-fun mapIsEmpty!31170 () Bool)

(assert (=> mapIsEmpty!31170 mapRes!31170))

(declare-fun res!621716 () Bool)

(assert (=> start!78870 (=> (not res!621716) (not e!517258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78870 (= res!621716 (validMask!0 mask!1881))))

(assert (=> start!78870 e!517258))

(assert (=> start!78870 true))

(assert (=> start!78870 tp_is_empty!19609))

(declare-fun array_inv!20754 (array!55171) Bool)

(assert (=> start!78870 (and (array_inv!20754 _values!1231) e!517256)))

(assert (=> start!78870 tp!59744))

(declare-fun array_inv!20755 (array!55169) Bool)

(assert (=> start!78870 (array_inv!20755 _keys!1487)))

(declare-fun b!921865 () Bool)

(assert (=> b!921865 (= e!517255 tp_is_empty!19609)))

(assert (= (and start!78870 res!621716) b!921866))

(assert (= (and b!921866 res!621719) b!921864))

(assert (= (and b!921864 res!621714) b!921868))

(assert (= (and b!921868 res!621713) b!921857))

(assert (= (and b!921857 res!621720) b!921867))

(assert (= (and b!921867 res!621722) b!921870))

(assert (= (and b!921870 res!621715) b!921861))

(assert (= (and b!921861 res!621718) b!921862))

(assert (= (and b!921862 res!621721) b!921863))

(assert (= (and b!921863 res!621717) b!921869))

(assert (= (and b!921869 c!96088) b!921858))

(assert (= (and b!921869 (not c!96088)) b!921856))

(assert (= (and b!921859 condMapEmpty!31170) mapIsEmpty!31170))

(assert (= (and b!921859 (not condMapEmpty!31170)) mapNonEmpty!31170))

(get-info :version)

(assert (= (and mapNonEmpty!31170 ((_ is ValueCellFull!9323) mapValue!31170)) b!921860))

(assert (= (and b!921859 ((_ is ValueCellFull!9323) mapDefault!31170)) b!921865))

(assert (= start!78870 b!921859))

(declare-fun b_lambda!13585 () Bool)

(assert (=> (not b_lambda!13585) (not b!921869)))

(declare-fun t!26486 () Bool)

(declare-fun tb!5673 () Bool)

(assert (=> (and start!78870 (= defaultEntry!1235 defaultEntry!1235) t!26486) tb!5673))

(declare-fun result!11177 () Bool)

(assert (=> tb!5673 (= result!11177 tp_is_empty!19609)))

(assert (=> b!921869 t!26486))

(declare-fun b_and!27915 () Bool)

(assert (= b_and!27913 (and (=> t!26486 result!11177) b_and!27915)))

(declare-fun m!855355 () Bool)

(assert (=> b!921870 m!855355))

(declare-fun m!855357 () Bool)

(assert (=> b!921863 m!855357))

(declare-fun m!855359 () Bool)

(assert (=> b!921863 m!855359))

(declare-fun m!855361 () Bool)

(assert (=> b!921867 m!855361))

(declare-fun m!855363 () Bool)

(assert (=> b!921867 m!855363))

(declare-fun m!855365 () Bool)

(assert (=> start!78870 m!855365))

(declare-fun m!855367 () Bool)

(assert (=> start!78870 m!855367))

(declare-fun m!855369 () Bool)

(assert (=> start!78870 m!855369))

(declare-fun m!855371 () Bool)

(assert (=> b!921862 m!855371))

(declare-fun m!855373 () Bool)

(assert (=> mapNonEmpty!31170 m!855373))

(declare-fun m!855375 () Bool)

(assert (=> b!921864 m!855375))

(declare-fun m!855377 () Bool)

(assert (=> b!921858 m!855377))

(declare-fun m!855379 () Bool)

(assert (=> b!921868 m!855379))

(declare-fun m!855381 () Bool)

(assert (=> b!921869 m!855381))

(declare-fun m!855383 () Bool)

(assert (=> b!921869 m!855383))

(declare-fun m!855385 () Bool)

(assert (=> b!921869 m!855385))

(assert (=> b!921869 m!855383))

(assert (=> b!921869 m!855385))

(declare-fun m!855387 () Bool)

(assert (=> b!921869 m!855387))

(declare-fun m!855389 () Bool)

(assert (=> b!921869 m!855389))

(declare-fun m!855391 () Bool)

(assert (=> b!921869 m!855391))

(declare-fun m!855393 () Bool)

(assert (=> b!921869 m!855393))

(declare-fun m!855395 () Bool)

(assert (=> b!921869 m!855395))

(declare-fun m!855397 () Bool)

(assert (=> b!921869 m!855397))

(declare-fun m!855399 () Bool)

(assert (=> b!921869 m!855399))

(declare-fun m!855401 () Bool)

(assert (=> b!921869 m!855401))

(assert (=> b!921869 m!855397))

(declare-fun m!855403 () Bool)

(assert (=> b!921869 m!855403))

(declare-fun m!855405 () Bool)

(assert (=> b!921869 m!855405))

(assert (=> b!921869 m!855403))

(declare-fun m!855407 () Bool)

(assert (=> b!921869 m!855407))

(check-sat (not b!921869) (not b!921858) (not start!78870) b_and!27915 (not b!921867) (not mapNonEmpty!31170) (not b!921868) (not b!921863) (not b!921864) tp_is_empty!19609 (not b_next!17101) (not b!921870) (not b_lambda!13585) (not b!921862))
(check-sat b_and!27915 (not b_next!17101))
