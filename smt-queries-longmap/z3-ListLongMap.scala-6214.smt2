; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79586 () Bool)

(assert start!79586)

(declare-fun b_free!17605 () Bool)

(declare-fun b_next!17605 () Bool)

(assert (=> start!79586 (= b_free!17605 (not b_next!17605))))

(declare-fun tp!61260 () Bool)

(declare-fun b_and!28779 () Bool)

(assert (=> start!79586 (= tp!61260 b_and!28779)))

(declare-fun b!934292 () Bool)

(declare-fun res!629027 () Bool)

(declare-fun e!524702 () Bool)

(assert (=> b!934292 (=> (not res!629027) (not e!524702))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934292 (= res!629027 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934293 () Bool)

(declare-fun res!629022 () Bool)

(declare-fun e!524698 () Bool)

(assert (=> b!934293 (=> (not res!629022) (not e!524698))))

(declare-datatypes ((array!56217 0))(
  ( (array!56218 (arr!27048 (Array (_ BitVec 32) (_ BitVec 64))) (size!27508 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56217)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56217 (_ BitVec 32)) Bool)

(assert (=> b!934293 (= res!629022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934294 () Bool)

(declare-fun e!524700 () Bool)

(assert (=> b!934294 (= e!524702 e!524700)))

(declare-fun res!629028 () Bool)

(assert (=> b!934294 (=> (not res!629028) (not e!524700))))

(declare-fun lt!420736 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934294 (= res!629028 (validKeyInArray!0 lt!420736))))

(assert (=> b!934294 (= lt!420736 (select (arr!27048 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934295 () Bool)

(declare-fun e!524701 () Bool)

(declare-fun e!524703 () Bool)

(declare-fun mapRes!31929 () Bool)

(assert (=> b!934295 (= e!524701 (and e!524703 mapRes!31929))))

(declare-fun condMapEmpty!31929 () Bool)

(declare-datatypes ((V!31783 0))(
  ( (V!31784 (val!10107 Int)) )
))
(declare-datatypes ((ValueCell!9575 0))(
  ( (ValueCellFull!9575 (v!12623 V!31783)) (EmptyCell!9575) )
))
(declare-datatypes ((array!56219 0))(
  ( (array!56220 (arr!27049 (Array (_ BitVec 32) ValueCell!9575)) (size!27509 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56219)

(declare-fun mapDefault!31929 () ValueCell!9575)

(assert (=> b!934295 (= condMapEmpty!31929 (= (arr!27049 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9575)) mapDefault!31929)))))

(declare-fun b!934296 () Bool)

(assert (=> b!934296 (= e!524700 (not true))))

(declare-datatypes ((List!19020 0))(
  ( (Nil!19017) (Cons!19016 (h!20168 (_ BitVec 64)) (t!27161 List!19020)) )
))
(declare-fun arrayNoDuplicates!0 (array!56217 (_ BitVec 32) List!19020) Bool)

(assert (=> b!934296 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19017)))

(declare-datatypes ((Unit!31490 0))(
  ( (Unit!31491) )
))
(declare-fun lt!420738 () Unit!31490)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56217 (_ BitVec 32) (_ BitVec 32)) Unit!31490)

(assert (=> b!934296 (= lt!420738 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13236 0))(
  ( (tuple2!13237 (_1!6629 (_ BitVec 64)) (_2!6629 V!31783)) )
))
(declare-datatypes ((List!19021 0))(
  ( (Nil!19018) (Cons!19017 (h!20169 tuple2!13236) (t!27162 List!19021)) )
))
(declare-datatypes ((ListLongMap!11935 0))(
  ( (ListLongMap!11936 (toList!5983 List!19021)) )
))
(declare-fun lt!420741 () ListLongMap!11935)

(declare-fun lt!420737 () tuple2!13236)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5048 (ListLongMap!11935 (_ BitVec 64)) Bool)

(declare-fun +!2810 (ListLongMap!11935 tuple2!13236) ListLongMap!11935)

(assert (=> b!934296 (contains!5048 (+!2810 lt!420741 lt!420737) k0!1099)))

(declare-fun lt!420740 () V!31783)

(declare-fun lt!420739 () Unit!31490)

(declare-fun addStillContains!513 (ListLongMap!11935 (_ BitVec 64) V!31783 (_ BitVec 64)) Unit!31490)

(assert (=> b!934296 (= lt!420739 (addStillContains!513 lt!420741 lt!420736 lt!420740 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31783)

(declare-fun minValue!1173 () V!31783)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3225 (array!56217 array!56219 (_ BitVec 32) (_ BitVec 32) V!31783 V!31783 (_ BitVec 32) Int) ListLongMap!11935)

(assert (=> b!934296 (= (getCurrentListMap!3225 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2810 (getCurrentListMap!3225 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420737))))

(assert (=> b!934296 (= lt!420737 (tuple2!13237 lt!420736 lt!420740))))

(declare-fun get!14250 (ValueCell!9575 V!31783) V!31783)

(declare-fun dynLambda!1607 (Int (_ BitVec 64)) V!31783)

(assert (=> b!934296 (= lt!420740 (get!14250 (select (arr!27049 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1607 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420735 () Unit!31490)

(declare-fun lemmaListMapRecursiveValidKeyArray!190 (array!56217 array!56219 (_ BitVec 32) (_ BitVec 32) V!31783 V!31783 (_ BitVec 32) Int) Unit!31490)

(assert (=> b!934296 (= lt!420735 (lemmaListMapRecursiveValidKeyArray!190 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934297 () Bool)

(declare-fun e!524697 () Bool)

(declare-fun tp_is_empty!20113 () Bool)

(assert (=> b!934297 (= e!524697 tp_is_empty!20113)))

(declare-fun b!934298 () Bool)

(declare-fun res!629024 () Bool)

(assert (=> b!934298 (=> (not res!629024) (not e!524698))))

(assert (=> b!934298 (= res!629024 (and (= (size!27509 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27508 _keys!1487) (size!27509 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934299 () Bool)

(declare-fun res!629023 () Bool)

(assert (=> b!934299 (=> (not res!629023) (not e!524698))))

(assert (=> b!934299 (= res!629023 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27508 _keys!1487))))))

(declare-fun b!934300 () Bool)

(declare-fun res!629025 () Bool)

(assert (=> b!934300 (=> (not res!629025) (not e!524702))))

(assert (=> b!934300 (= res!629025 (validKeyInArray!0 k0!1099))))

(declare-fun res!629019 () Bool)

(assert (=> start!79586 (=> (not res!629019) (not e!524698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79586 (= res!629019 (validMask!0 mask!1881))))

(assert (=> start!79586 e!524698))

(assert (=> start!79586 true))

(assert (=> start!79586 tp_is_empty!20113))

(declare-fun array_inv!21142 (array!56219) Bool)

(assert (=> start!79586 (and (array_inv!21142 _values!1231) e!524701)))

(assert (=> start!79586 tp!61260))

(declare-fun array_inv!21143 (array!56217) Bool)

(assert (=> start!79586 (array_inv!21143 _keys!1487)))

(declare-fun b!934291 () Bool)

(declare-fun res!629026 () Bool)

(assert (=> b!934291 (=> (not res!629026) (not e!524702))))

(declare-fun v!791 () V!31783)

(declare-fun apply!809 (ListLongMap!11935 (_ BitVec 64)) V!31783)

(assert (=> b!934291 (= res!629026 (= (apply!809 lt!420741 k0!1099) v!791))))

(declare-fun mapNonEmpty!31929 () Bool)

(declare-fun tp!61259 () Bool)

(assert (=> mapNonEmpty!31929 (= mapRes!31929 (and tp!61259 e!524697))))

(declare-fun mapValue!31929 () ValueCell!9575)

(declare-fun mapRest!31929 () (Array (_ BitVec 32) ValueCell!9575))

(declare-fun mapKey!31929 () (_ BitVec 32))

(assert (=> mapNonEmpty!31929 (= (arr!27049 _values!1231) (store mapRest!31929 mapKey!31929 mapValue!31929))))

(declare-fun b!934301 () Bool)

(assert (=> b!934301 (= e!524698 e!524702)))

(declare-fun res!629021 () Bool)

(assert (=> b!934301 (=> (not res!629021) (not e!524702))))

(assert (=> b!934301 (= res!629021 (contains!5048 lt!420741 k0!1099))))

(assert (=> b!934301 (= lt!420741 (getCurrentListMap!3225 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934302 () Bool)

(assert (=> b!934302 (= e!524703 tp_is_empty!20113)))

(declare-fun mapIsEmpty!31929 () Bool)

(assert (=> mapIsEmpty!31929 mapRes!31929))

(declare-fun b!934303 () Bool)

(declare-fun res!629020 () Bool)

(assert (=> b!934303 (=> (not res!629020) (not e!524698))))

(assert (=> b!934303 (= res!629020 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19017))))

(assert (= (and start!79586 res!629019) b!934298))

(assert (= (and b!934298 res!629024) b!934293))

(assert (= (and b!934293 res!629022) b!934303))

(assert (= (and b!934303 res!629020) b!934299))

(assert (= (and b!934299 res!629023) b!934301))

(assert (= (and b!934301 res!629021) b!934291))

(assert (= (and b!934291 res!629026) b!934292))

(assert (= (and b!934292 res!629027) b!934300))

(assert (= (and b!934300 res!629025) b!934294))

(assert (= (and b!934294 res!629028) b!934296))

(assert (= (and b!934295 condMapEmpty!31929) mapIsEmpty!31929))

(assert (= (and b!934295 (not condMapEmpty!31929)) mapNonEmpty!31929))

(get-info :version)

(assert (= (and mapNonEmpty!31929 ((_ is ValueCellFull!9575) mapValue!31929)) b!934297))

(assert (= (and b!934295 ((_ is ValueCellFull!9575) mapDefault!31929)) b!934302))

(assert (= start!79586 b!934295))

(declare-fun b_lambda!13953 () Bool)

(assert (=> (not b_lambda!13953) (not b!934296)))

(declare-fun t!27160 () Bool)

(declare-fun tb!5991 () Bool)

(assert (=> (and start!79586 (= defaultEntry!1235 defaultEntry!1235) t!27160) tb!5991))

(declare-fun result!11815 () Bool)

(assert (=> tb!5991 (= result!11815 tp_is_empty!20113)))

(assert (=> b!934296 t!27160))

(declare-fun b_and!28781 () Bool)

(assert (= b_and!28779 (and (=> t!27160 result!11815) b_and!28781)))

(declare-fun m!868805 () Bool)

(assert (=> mapNonEmpty!31929 m!868805))

(declare-fun m!868807 () Bool)

(assert (=> b!934301 m!868807))

(declare-fun m!868809 () Bool)

(assert (=> b!934301 m!868809))

(declare-fun m!868811 () Bool)

(assert (=> b!934291 m!868811))

(declare-fun m!868813 () Bool)

(assert (=> b!934300 m!868813))

(declare-fun m!868815 () Bool)

(assert (=> b!934303 m!868815))

(declare-fun m!868817 () Bool)

(assert (=> b!934293 m!868817))

(declare-fun m!868819 () Bool)

(assert (=> b!934294 m!868819))

(declare-fun m!868821 () Bool)

(assert (=> b!934294 m!868821))

(declare-fun m!868823 () Bool)

(assert (=> start!79586 m!868823))

(declare-fun m!868825 () Bool)

(assert (=> start!79586 m!868825))

(declare-fun m!868827 () Bool)

(assert (=> start!79586 m!868827))

(declare-fun m!868829 () Bool)

(assert (=> b!934296 m!868829))

(declare-fun m!868831 () Bool)

(assert (=> b!934296 m!868831))

(declare-fun m!868833 () Bool)

(assert (=> b!934296 m!868833))

(assert (=> b!934296 m!868829))

(declare-fun m!868835 () Bool)

(assert (=> b!934296 m!868835))

(assert (=> b!934296 m!868831))

(assert (=> b!934296 m!868833))

(declare-fun m!868837 () Bool)

(assert (=> b!934296 m!868837))

(declare-fun m!868839 () Bool)

(assert (=> b!934296 m!868839))

(declare-fun m!868841 () Bool)

(assert (=> b!934296 m!868841))

(declare-fun m!868843 () Bool)

(assert (=> b!934296 m!868843))

(declare-fun m!868845 () Bool)

(assert (=> b!934296 m!868845))

(declare-fun m!868847 () Bool)

(assert (=> b!934296 m!868847))

(declare-fun m!868849 () Bool)

(assert (=> b!934296 m!868849))

(assert (=> b!934296 m!868843))

(declare-fun m!868851 () Bool)

(assert (=> b!934296 m!868851))

(check-sat (not b!934294) (not b!934293) (not b_lambda!13953) (not b!934301) (not b!934296) (not b_next!17605) (not start!79586) (not mapNonEmpty!31929) b_and!28781 (not b!934300) (not b!934303) (not b!934291) tp_is_empty!20113)
(check-sat b_and!28781 (not b_next!17605))
