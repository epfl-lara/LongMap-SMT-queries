; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78792 () Bool)

(assert start!78792)

(declare-fun b_free!16837 () Bool)

(declare-fun b_next!16837 () Bool)

(assert (=> start!78792 (= b_free!16837 (not b_next!16837))))

(declare-fun tp!58952 () Bool)

(declare-fun b_and!27469 () Bool)

(assert (=> start!78792 (= tp!58952 b_and!27469)))

(declare-fun b!917469 () Bool)

(declare-fun res!618245 () Bool)

(declare-fun e!515101 () Bool)

(assert (=> b!917469 (=> (not res!618245) (not e!515101))))

(declare-datatypes ((array!54727 0))(
  ( (array!54728 (arr!26304 (Array (_ BitVec 32) (_ BitVec 64))) (size!26764 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54727)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54727 (_ BitVec 32)) Bool)

(assert (=> b!917469 (= res!618245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917470 () Bool)

(declare-fun e!515103 () Bool)

(declare-fun tp_is_empty!19345 () Bool)

(assert (=> b!917470 (= e!515103 tp_is_empty!19345)))

(declare-fun b!917471 () Bool)

(declare-fun res!618247 () Bool)

(assert (=> b!917471 (=> (not res!618247) (not e!515101))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30759 0))(
  ( (V!30760 (val!9723 Int)) )
))
(declare-datatypes ((ValueCell!9191 0))(
  ( (ValueCellFull!9191 (v!12238 V!30759)) (EmptyCell!9191) )
))
(declare-datatypes ((array!54729 0))(
  ( (array!54730 (arr!26305 (Array (_ BitVec 32) ValueCell!9191)) (size!26765 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54729)

(assert (=> b!917471 (= res!618247 (and (= (size!26765 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26764 _keys!1487) (size!26765 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917472 () Bool)

(declare-fun res!618244 () Bool)

(assert (=> b!917472 (=> (not res!618244) (not e!515101))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917472 (= res!618244 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26764 _keys!1487))))))

(declare-fun b!917473 () Bool)

(declare-fun e!515102 () Bool)

(assert (=> b!917473 (= e!515102 false)))

(declare-fun lt!412181 () V!30759)

(declare-datatypes ((tuple2!12584 0))(
  ( (tuple2!12585 (_1!6303 (_ BitVec 64)) (_2!6303 V!30759)) )
))
(declare-datatypes ((List!18411 0))(
  ( (Nil!18408) (Cons!18407 (h!19559 tuple2!12584) (t!26016 List!18411)) )
))
(declare-datatypes ((ListLongMap!11283 0))(
  ( (ListLongMap!11284 (toList!5657 List!18411)) )
))
(declare-fun lt!412180 () ListLongMap!11283)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!541 (ListLongMap!11283 (_ BitVec 64)) V!30759)

(assert (=> b!917473 (= lt!412181 (apply!541 lt!412180 k0!1099))))

(declare-fun mapIsEmpty!30774 () Bool)

(declare-fun mapRes!30774 () Bool)

(assert (=> mapIsEmpty!30774 mapRes!30774))

(declare-fun b!917474 () Bool)

(declare-fun res!618248 () Bool)

(assert (=> b!917474 (=> (not res!618248) (not e!515101))))

(declare-datatypes ((List!18412 0))(
  ( (Nil!18409) (Cons!18408 (h!19560 (_ BitVec 64)) (t!26017 List!18412)) )
))
(declare-fun arrayNoDuplicates!0 (array!54727 (_ BitVec 32) List!18412) Bool)

(assert (=> b!917474 (= res!618248 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18409))))

(declare-fun mapNonEmpty!30774 () Bool)

(declare-fun tp!58953 () Bool)

(declare-fun e!515104 () Bool)

(assert (=> mapNonEmpty!30774 (= mapRes!30774 (and tp!58953 e!515104))))

(declare-fun mapRest!30774 () (Array (_ BitVec 32) ValueCell!9191))

(declare-fun mapValue!30774 () ValueCell!9191)

(declare-fun mapKey!30774 () (_ BitVec 32))

(assert (=> mapNonEmpty!30774 (= (arr!26305 _values!1231) (store mapRest!30774 mapKey!30774 mapValue!30774))))

(declare-fun res!618249 () Bool)

(assert (=> start!78792 (=> (not res!618249) (not e!515101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78792 (= res!618249 (validMask!0 mask!1881))))

(assert (=> start!78792 e!515101))

(assert (=> start!78792 true))

(declare-fun e!515099 () Bool)

(declare-fun array_inv!20620 (array!54729) Bool)

(assert (=> start!78792 (and (array_inv!20620 _values!1231) e!515099)))

(assert (=> start!78792 tp!58952))

(declare-fun array_inv!20621 (array!54727) Bool)

(assert (=> start!78792 (array_inv!20621 _keys!1487)))

(assert (=> start!78792 tp_is_empty!19345))

(declare-fun b!917475 () Bool)

(assert (=> b!917475 (= e!515099 (and e!515103 mapRes!30774))))

(declare-fun condMapEmpty!30774 () Bool)

(declare-fun mapDefault!30774 () ValueCell!9191)

(assert (=> b!917475 (= condMapEmpty!30774 (= (arr!26305 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9191)) mapDefault!30774)))))

(declare-fun b!917476 () Bool)

(assert (=> b!917476 (= e!515101 e!515102)))

(declare-fun res!618246 () Bool)

(assert (=> b!917476 (=> (not res!618246) (not e!515102))))

(declare-fun contains!4718 (ListLongMap!11283 (_ BitVec 64)) Bool)

(assert (=> b!917476 (= res!618246 (contains!4718 lt!412180 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30759)

(declare-fun minValue!1173 () V!30759)

(declare-fun getCurrentListMap!2915 (array!54727 array!54729 (_ BitVec 32) (_ BitVec 32) V!30759 V!30759 (_ BitVec 32) Int) ListLongMap!11283)

(assert (=> b!917476 (= lt!412180 (getCurrentListMap!2915 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917477 () Bool)

(assert (=> b!917477 (= e!515104 tp_is_empty!19345)))

(assert (= (and start!78792 res!618249) b!917471))

(assert (= (and b!917471 res!618247) b!917469))

(assert (= (and b!917469 res!618245) b!917474))

(assert (= (and b!917474 res!618248) b!917472))

(assert (= (and b!917472 res!618244) b!917476))

(assert (= (and b!917476 res!618246) b!917473))

(assert (= (and b!917475 condMapEmpty!30774) mapIsEmpty!30774))

(assert (= (and b!917475 (not condMapEmpty!30774)) mapNonEmpty!30774))

(get-info :version)

(assert (= (and mapNonEmpty!30774 ((_ is ValueCellFull!9191) mapValue!30774)) b!917477))

(assert (= (and b!917475 ((_ is ValueCellFull!9191) mapDefault!30774)) b!917470))

(assert (= start!78792 b!917475))

(declare-fun m!851845 () Bool)

(assert (=> b!917469 m!851845))

(declare-fun m!851847 () Bool)

(assert (=> b!917473 m!851847))

(declare-fun m!851849 () Bool)

(assert (=> b!917476 m!851849))

(declare-fun m!851851 () Bool)

(assert (=> b!917476 m!851851))

(declare-fun m!851853 () Bool)

(assert (=> mapNonEmpty!30774 m!851853))

(declare-fun m!851855 () Bool)

(assert (=> b!917474 m!851855))

(declare-fun m!851857 () Bool)

(assert (=> start!78792 m!851857))

(declare-fun m!851859 () Bool)

(assert (=> start!78792 m!851859))

(declare-fun m!851861 () Bool)

(assert (=> start!78792 m!851861))

(check-sat (not b!917469) (not mapNonEmpty!30774) (not b_next!16837) (not start!78792) (not b!917473) (not b!917476) b_and!27469 tp_is_empty!19345 (not b!917474))
(check-sat b_and!27469 (not b_next!16837))
