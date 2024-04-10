; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78674 () Bool)

(assert start!78674)

(declare-fun b_free!16887 () Bool)

(declare-fun b_next!16887 () Bool)

(assert (=> start!78674 (= b_free!16887 (not b_next!16887))))

(declare-fun tp!59102 () Bool)

(declare-fun b_and!27511 () Bool)

(assert (=> start!78674 (= tp!59102 b_and!27511)))

(declare-fun b!917263 () Bool)

(declare-fun e!514975 () Bool)

(declare-fun e!514978 () Bool)

(assert (=> b!917263 (= e!514975 e!514978)))

(declare-fun res!618374 () Bool)

(assert (=> b!917263 (=> (not res!618374) (not e!514978))))

(declare-datatypes ((V!30825 0))(
  ( (V!30826 (val!9748 Int)) )
))
(declare-datatypes ((tuple2!12658 0))(
  ( (tuple2!12659 (_1!6340 (_ BitVec 64)) (_2!6340 V!30825)) )
))
(declare-datatypes ((List!18468 0))(
  ( (Nil!18465) (Cons!18464 (h!19610 tuple2!12658) (t!26085 List!18468)) )
))
(declare-datatypes ((ListLongMap!11355 0))(
  ( (ListLongMap!11356 (toList!5693 List!18468)) )
))
(declare-fun lt!411974 () ListLongMap!11355)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4745 (ListLongMap!11355 (_ BitVec 64)) Bool)

(assert (=> b!917263 (= res!618374 (contains!4745 lt!411974 k0!1099))))

(declare-datatypes ((array!54776 0))(
  ( (array!54777 (arr!26333 (Array (_ BitVec 32) (_ BitVec 64))) (size!26792 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54776)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9216 0))(
  ( (ValueCellFull!9216 (v!12266 V!30825)) (EmptyCell!9216) )
))
(declare-datatypes ((array!54778 0))(
  ( (array!54779 (arr!26334 (Array (_ BitVec 32) ValueCell!9216)) (size!26793 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54778)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30825)

(declare-fun minValue!1173 () V!30825)

(declare-fun getCurrentListMap!2952 (array!54776 array!54778 (_ BitVec 32) (_ BitVec 32) V!30825 V!30825 (_ BitVec 32) Int) ListLongMap!11355)

(assert (=> b!917263 (= lt!411974 (getCurrentListMap!2952 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917264 () Bool)

(declare-fun res!618370 () Bool)

(assert (=> b!917264 (=> (not res!618370) (not e!514975))))

(assert (=> b!917264 (= res!618370 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26792 _keys!1487))))))

(declare-fun b!917265 () Bool)

(declare-fun res!618377 () Bool)

(assert (=> b!917265 (=> (not res!618377) (not e!514975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54776 (_ BitVec 32)) Bool)

(assert (=> b!917265 (= res!618377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917267 () Bool)

(declare-fun res!618375 () Bool)

(assert (=> b!917267 (=> (not res!618375) (not e!514975))))

(declare-datatypes ((List!18469 0))(
  ( (Nil!18466) (Cons!18465 (h!19611 (_ BitVec 64)) (t!26086 List!18469)) )
))
(declare-fun arrayNoDuplicates!0 (array!54776 (_ BitVec 32) List!18469) Bool)

(assert (=> b!917267 (= res!618375 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18466))))

(declare-fun b!917268 () Bool)

(declare-fun e!514977 () Bool)

(declare-fun e!514973 () Bool)

(declare-fun mapRes!30849 () Bool)

(assert (=> b!917268 (= e!514977 (and e!514973 mapRes!30849))))

(declare-fun condMapEmpty!30849 () Bool)

(declare-fun mapDefault!30849 () ValueCell!9216)

(assert (=> b!917268 (= condMapEmpty!30849 (= (arr!26334 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9216)) mapDefault!30849)))))

(declare-fun b!917269 () Bool)

(declare-fun res!618372 () Bool)

(assert (=> b!917269 (=> (not res!618372) (not e!514978))))

(declare-fun v!791 () V!30825)

(declare-fun apply!548 (ListLongMap!11355 (_ BitVec 64)) V!30825)

(assert (=> b!917269 (= res!618372 (= (apply!548 lt!411974 k0!1099) v!791))))

(declare-fun b!917270 () Bool)

(declare-fun res!618379 () Bool)

(assert (=> b!917270 (=> (not res!618379) (not e!514978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917270 (= res!618379 (validKeyInArray!0 k0!1099))))

(declare-fun b!917271 () Bool)

(declare-fun e!514974 () Bool)

(assert (=> b!917271 (= e!514974 (not true))))

(declare-fun lt!411975 () (_ BitVec 64))

(declare-fun +!2611 (ListLongMap!11355 tuple2!12658) ListLongMap!11355)

(declare-fun get!13796 (ValueCell!9216 V!30825) V!30825)

(declare-fun dynLambda!1400 (Int (_ BitVec 64)) V!30825)

(assert (=> b!917271 (= (getCurrentListMap!2952 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2611 (getCurrentListMap!2952 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12659 lt!411975 (get!13796 (select (arr!26334 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1400 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30970 0))(
  ( (Unit!30971) )
))
(declare-fun lt!411976 () Unit!30970)

(declare-fun lemmaListMapRecursiveValidKeyArray!1 (array!54776 array!54778 (_ BitVec 32) (_ BitVec 32) V!30825 V!30825 (_ BitVec 32) Int) Unit!30970)

(assert (=> b!917271 (= lt!411976 (lemmaListMapRecursiveValidKeyArray!1 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!30849 () Bool)

(assert (=> mapIsEmpty!30849 mapRes!30849))

(declare-fun b!917272 () Bool)

(assert (=> b!917272 (= e!514978 e!514974)))

(declare-fun res!618371 () Bool)

(assert (=> b!917272 (=> (not res!618371) (not e!514974))))

(assert (=> b!917272 (= res!618371 (validKeyInArray!0 lt!411975))))

(assert (=> b!917272 (= lt!411975 (select (arr!26333 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917273 () Bool)

(declare-fun tp_is_empty!19395 () Bool)

(assert (=> b!917273 (= e!514973 tp_is_empty!19395)))

(declare-fun b!917274 () Bool)

(declare-fun res!618378 () Bool)

(assert (=> b!917274 (=> (not res!618378) (not e!514975))))

(assert (=> b!917274 (= res!618378 (and (= (size!26793 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26792 _keys!1487) (size!26793 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917275 () Bool)

(declare-fun e!514976 () Bool)

(assert (=> b!917275 (= e!514976 tp_is_empty!19395)))

(declare-fun mapNonEmpty!30849 () Bool)

(declare-fun tp!59101 () Bool)

(assert (=> mapNonEmpty!30849 (= mapRes!30849 (and tp!59101 e!514976))))

(declare-fun mapRest!30849 () (Array (_ BitVec 32) ValueCell!9216))

(declare-fun mapValue!30849 () ValueCell!9216)

(declare-fun mapKey!30849 () (_ BitVec 32))

(assert (=> mapNonEmpty!30849 (= (arr!26334 _values!1231) (store mapRest!30849 mapKey!30849 mapValue!30849))))

(declare-fun res!618376 () Bool)

(assert (=> start!78674 (=> (not res!618376) (not e!514975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78674 (= res!618376 (validMask!0 mask!1881))))

(assert (=> start!78674 e!514975))

(assert (=> start!78674 true))

(assert (=> start!78674 tp_is_empty!19395))

(declare-fun array_inv!20536 (array!54778) Bool)

(assert (=> start!78674 (and (array_inv!20536 _values!1231) e!514977)))

(assert (=> start!78674 tp!59102))

(declare-fun array_inv!20537 (array!54776) Bool)

(assert (=> start!78674 (array_inv!20537 _keys!1487)))

(declare-fun b!917266 () Bool)

(declare-fun res!618373 () Bool)

(assert (=> b!917266 (=> (not res!618373) (not e!514978))))

(assert (=> b!917266 (= res!618373 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!78674 res!618376) b!917274))

(assert (= (and b!917274 res!618378) b!917265))

(assert (= (and b!917265 res!618377) b!917267))

(assert (= (and b!917267 res!618375) b!917264))

(assert (= (and b!917264 res!618370) b!917263))

(assert (= (and b!917263 res!618374) b!917269))

(assert (= (and b!917269 res!618372) b!917266))

(assert (= (and b!917266 res!618373) b!917270))

(assert (= (and b!917270 res!618379) b!917272))

(assert (= (and b!917272 res!618371) b!917271))

(assert (= (and b!917268 condMapEmpty!30849) mapIsEmpty!30849))

(assert (= (and b!917268 (not condMapEmpty!30849)) mapNonEmpty!30849))

(get-info :version)

(assert (= (and mapNonEmpty!30849 ((_ is ValueCellFull!9216) mapValue!30849)) b!917275))

(assert (= (and b!917268 ((_ is ValueCellFull!9216) mapDefault!30849)) b!917273))

(assert (= start!78674 b!917268))

(declare-fun b_lambda!13389 () Bool)

(assert (=> (not b_lambda!13389) (not b!917271)))

(declare-fun t!26084 () Bool)

(declare-fun tb!5467 () Bool)

(assert (=> (and start!78674 (= defaultEntry!1235 defaultEntry!1235) t!26084) tb!5467))

(declare-fun result!10757 () Bool)

(assert (=> tb!5467 (= result!10757 tp_is_empty!19395)))

(assert (=> b!917271 t!26084))

(declare-fun b_and!27513 () Bool)

(assert (= b_and!27511 (and (=> t!26084 result!10757) b_and!27513)))

(declare-fun m!851021 () Bool)

(assert (=> b!917269 m!851021))

(declare-fun m!851023 () Bool)

(assert (=> start!78674 m!851023))

(declare-fun m!851025 () Bool)

(assert (=> start!78674 m!851025))

(declare-fun m!851027 () Bool)

(assert (=> start!78674 m!851027))

(declare-fun m!851029 () Bool)

(assert (=> b!917267 m!851029))

(declare-fun m!851031 () Bool)

(assert (=> b!917270 m!851031))

(declare-fun m!851033 () Bool)

(assert (=> mapNonEmpty!30849 m!851033))

(declare-fun m!851035 () Bool)

(assert (=> b!917265 m!851035))

(declare-fun m!851037 () Bool)

(assert (=> b!917272 m!851037))

(declare-fun m!851039 () Bool)

(assert (=> b!917272 m!851039))

(declare-fun m!851041 () Bool)

(assert (=> b!917263 m!851041))

(declare-fun m!851043 () Bool)

(assert (=> b!917263 m!851043))

(declare-fun m!851045 () Bool)

(assert (=> b!917271 m!851045))

(declare-fun m!851047 () Bool)

(assert (=> b!917271 m!851047))

(declare-fun m!851049 () Bool)

(assert (=> b!917271 m!851049))

(declare-fun m!851051 () Bool)

(assert (=> b!917271 m!851051))

(assert (=> b!917271 m!851045))

(assert (=> b!917271 m!851047))

(declare-fun m!851053 () Bool)

(assert (=> b!917271 m!851053))

(declare-fun m!851055 () Bool)

(assert (=> b!917271 m!851055))

(assert (=> b!917271 m!851049))

(declare-fun m!851057 () Bool)

(assert (=> b!917271 m!851057))

(check-sat (not b_next!16887) (not b!917269) (not b!917271) (not mapNonEmpty!30849) (not b!917272) (not b!917265) tp_is_empty!19395 (not b!917263) (not b_lambda!13389) b_and!27513 (not b!917267) (not b!917270) (not start!78674))
(check-sat b_and!27513 (not b_next!16887))
