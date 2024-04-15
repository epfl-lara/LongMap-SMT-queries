; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78714 () Bool)

(assert start!78714)

(declare-fun b_free!16945 () Bool)

(declare-fun b_next!16945 () Bool)

(assert (=> start!78714 (= b_free!16945 (not b_next!16945))))

(declare-fun tp!59277 () Bool)

(declare-fun b_and!27601 () Bool)

(assert (=> start!78714 (= tp!59277 b_and!27601)))

(declare-fun b!918213 () Bool)

(declare-fun e!515433 () Bool)

(declare-fun e!515437 () Bool)

(assert (=> b!918213 (= e!515433 e!515437)))

(declare-fun res!619139 () Bool)

(assert (=> b!918213 (=> (not res!619139) (not e!515437))))

(declare-datatypes ((V!30903 0))(
  ( (V!30904 (val!9777 Int)) )
))
(declare-datatypes ((tuple2!12750 0))(
  ( (tuple2!12751 (_1!6386 (_ BitVec 64)) (_2!6386 V!30903)) )
))
(declare-datatypes ((List!18539 0))(
  ( (Nil!18536) (Cons!18535 (h!19681 tuple2!12750) (t!26205 List!18539)) )
))
(declare-datatypes ((ListLongMap!11437 0))(
  ( (ListLongMap!11438 (toList!5734 List!18539)) )
))
(declare-fun lt!412008 () ListLongMap!11437)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4735 (ListLongMap!11437 (_ BitVec 64)) Bool)

(assert (=> b!918213 (= res!619139 (contains!4735 lt!412008 k0!1099))))

(declare-datatypes ((array!54873 0))(
  ( (array!54874 (arr!26382 (Array (_ BitVec 32) (_ BitVec 64))) (size!26843 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54873)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9245 0))(
  ( (ValueCellFull!9245 (v!12294 V!30903)) (EmptyCell!9245) )
))
(declare-datatypes ((array!54875 0))(
  ( (array!54876 (arr!26383 (Array (_ BitVec 32) ValueCell!9245)) (size!26844 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54875)

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30903)

(declare-fun minValue!1173 () V!30903)

(declare-fun getCurrentListMap!2927 (array!54873 array!54875 (_ BitVec 32) (_ BitVec 32) V!30903 V!30903 (_ BitVec 32) Int) ListLongMap!11437)

(assert (=> b!918213 (= lt!412008 (getCurrentListMap!2927 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!30936 () Bool)

(declare-fun mapRes!30936 () Bool)

(assert (=> mapIsEmpty!30936 mapRes!30936))

(declare-fun b!918214 () Bool)

(declare-fun e!515436 () Bool)

(assert (=> b!918214 (= e!515436 (not true))))

(declare-fun lt!412009 () tuple2!12750)

(declare-fun +!2655 (ListLongMap!11437 tuple2!12750) ListLongMap!11437)

(assert (=> b!918214 (contains!4735 (+!2655 lt!412008 lt!412009) k0!1099)))

(declare-fun lt!412005 () (_ BitVec 64))

(declare-datatypes ((Unit!30922 0))(
  ( (Unit!30923) )
))
(declare-fun lt!412010 () Unit!30922)

(declare-fun lt!412007 () V!30903)

(declare-fun addStillContains!352 (ListLongMap!11437 (_ BitVec 64) V!30903 (_ BitVec 64)) Unit!30922)

(assert (=> b!918214 (= lt!412010 (addStillContains!352 lt!412008 lt!412005 lt!412007 k0!1099))))

(assert (=> b!918214 (= (getCurrentListMap!2927 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2655 (getCurrentListMap!2927 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412009))))

(assert (=> b!918214 (= lt!412009 (tuple2!12751 lt!412005 lt!412007))))

(declare-fun get!13832 (ValueCell!9245 V!30903) V!30903)

(declare-fun dynLambda!1411 (Int (_ BitVec 64)) V!30903)

(assert (=> b!918214 (= lt!412007 (get!13832 (select (arr!26383 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1411 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412006 () Unit!30922)

(declare-fun lemmaListMapRecursiveValidKeyArray!19 (array!54873 array!54875 (_ BitVec 32) (_ BitVec 32) V!30903 V!30903 (_ BitVec 32) Int) Unit!30922)

(assert (=> b!918214 (= lt!412006 (lemmaListMapRecursiveValidKeyArray!19 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918215 () Bool)

(declare-fun e!515435 () Bool)

(declare-fun e!515434 () Bool)

(assert (=> b!918215 (= e!515435 (and e!515434 mapRes!30936))))

(declare-fun condMapEmpty!30936 () Bool)

(declare-fun mapDefault!30936 () ValueCell!9245)

(assert (=> b!918215 (= condMapEmpty!30936 (= (arr!26383 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9245)) mapDefault!30936)))))

(declare-fun b!918216 () Bool)

(declare-fun res!619132 () Bool)

(assert (=> b!918216 (=> (not res!619132) (not e!515433))))

(assert (=> b!918216 (= res!619132 (and (= (size!26844 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26843 _keys!1487) (size!26844 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918217 () Bool)

(declare-fun e!515439 () Bool)

(declare-fun tp_is_empty!19453 () Bool)

(assert (=> b!918217 (= e!515439 tp_is_empty!19453)))

(declare-fun res!619138 () Bool)

(assert (=> start!78714 (=> (not res!619138) (not e!515433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78714 (= res!619138 (validMask!0 mask!1881))))

(assert (=> start!78714 e!515433))

(assert (=> start!78714 true))

(assert (=> start!78714 tp_is_empty!19453))

(declare-fun array_inv!20648 (array!54875) Bool)

(assert (=> start!78714 (and (array_inv!20648 _values!1231) e!515435)))

(assert (=> start!78714 tp!59277))

(declare-fun array_inv!20649 (array!54873) Bool)

(assert (=> start!78714 (array_inv!20649 _keys!1487)))

(declare-fun b!918218 () Bool)

(assert (=> b!918218 (= e!515437 e!515436)))

(declare-fun res!619135 () Bool)

(assert (=> b!918218 (=> (not res!619135) (not e!515436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918218 (= res!619135 (validKeyInArray!0 lt!412005))))

(assert (=> b!918218 (= lt!412005 (select (arr!26382 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918219 () Bool)

(declare-fun res!619131 () Bool)

(assert (=> b!918219 (=> (not res!619131) (not e!515437))))

(assert (=> b!918219 (= res!619131 (validKeyInArray!0 k0!1099))))

(declare-fun b!918220 () Bool)

(declare-fun res!619130 () Bool)

(assert (=> b!918220 (=> (not res!619130) (not e!515433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54873 (_ BitVec 32)) Bool)

(assert (=> b!918220 (= res!619130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918221 () Bool)

(declare-fun res!619133 () Bool)

(assert (=> b!918221 (=> (not res!619133) (not e!515433))))

(declare-datatypes ((List!18540 0))(
  ( (Nil!18537) (Cons!18536 (h!19682 (_ BitVec 64)) (t!26206 List!18540)) )
))
(declare-fun arrayNoDuplicates!0 (array!54873 (_ BitVec 32) List!18540) Bool)

(assert (=> b!918221 (= res!619133 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18537))))

(declare-fun mapNonEmpty!30936 () Bool)

(declare-fun tp!59276 () Bool)

(assert (=> mapNonEmpty!30936 (= mapRes!30936 (and tp!59276 e!515439))))

(declare-fun mapRest!30936 () (Array (_ BitVec 32) ValueCell!9245))

(declare-fun mapKey!30936 () (_ BitVec 32))

(declare-fun mapValue!30936 () ValueCell!9245)

(assert (=> mapNonEmpty!30936 (= (arr!26383 _values!1231) (store mapRest!30936 mapKey!30936 mapValue!30936))))

(declare-fun b!918222 () Bool)

(assert (=> b!918222 (= e!515434 tp_is_empty!19453)))

(declare-fun b!918223 () Bool)

(declare-fun res!619137 () Bool)

(assert (=> b!918223 (=> (not res!619137) (not e!515437))))

(assert (=> b!918223 (= res!619137 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918224 () Bool)

(declare-fun res!619136 () Bool)

(assert (=> b!918224 (=> (not res!619136) (not e!515437))))

(declare-fun v!791 () V!30903)

(declare-fun apply!567 (ListLongMap!11437 (_ BitVec 64)) V!30903)

(assert (=> b!918224 (= res!619136 (= (apply!567 lt!412008 k0!1099) v!791))))

(declare-fun b!918225 () Bool)

(declare-fun res!619134 () Bool)

(assert (=> b!918225 (=> (not res!619134) (not e!515433))))

(assert (=> b!918225 (= res!619134 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26843 _keys!1487))))))

(assert (= (and start!78714 res!619138) b!918216))

(assert (= (and b!918216 res!619132) b!918220))

(assert (= (and b!918220 res!619130) b!918221))

(assert (= (and b!918221 res!619133) b!918225))

(assert (= (and b!918225 res!619134) b!918213))

(assert (= (and b!918213 res!619139) b!918224))

(assert (= (and b!918224 res!619136) b!918223))

(assert (= (and b!918223 res!619137) b!918219))

(assert (= (and b!918219 res!619131) b!918218))

(assert (= (and b!918218 res!619135) b!918214))

(assert (= (and b!918215 condMapEmpty!30936) mapIsEmpty!30936))

(assert (= (and b!918215 (not condMapEmpty!30936)) mapNonEmpty!30936))

(get-info :version)

(assert (= (and mapNonEmpty!30936 ((_ is ValueCellFull!9245) mapValue!30936)) b!918217))

(assert (= (and b!918215 ((_ is ValueCellFull!9245) mapDefault!30936)) b!918222))

(assert (= start!78714 b!918215))

(declare-fun b_lambda!13429 () Bool)

(assert (=> (not b_lambda!13429) (not b!918214)))

(declare-fun t!26204 () Bool)

(declare-fun tb!5517 () Bool)

(assert (=> (and start!78714 (= defaultEntry!1235 defaultEntry!1235) t!26204) tb!5517))

(declare-fun result!10865 () Bool)

(assert (=> tb!5517 (= result!10865 tp_is_empty!19453)))

(assert (=> b!918214 t!26204))

(declare-fun b_and!27603 () Bool)

(assert (= b_and!27601 (and (=> t!26204 result!10865) b_and!27603)))

(declare-fun m!851365 () Bool)

(assert (=> b!918213 m!851365))

(declare-fun m!851367 () Bool)

(assert (=> b!918213 m!851367))

(declare-fun m!851369 () Bool)

(assert (=> b!918221 m!851369))

(declare-fun m!851371 () Bool)

(assert (=> b!918218 m!851371))

(declare-fun m!851373 () Bool)

(assert (=> b!918218 m!851373))

(declare-fun m!851375 () Bool)

(assert (=> mapNonEmpty!30936 m!851375))

(declare-fun m!851377 () Bool)

(assert (=> start!78714 m!851377))

(declare-fun m!851379 () Bool)

(assert (=> start!78714 m!851379))

(declare-fun m!851381 () Bool)

(assert (=> start!78714 m!851381))

(declare-fun m!851383 () Bool)

(assert (=> b!918214 m!851383))

(declare-fun m!851385 () Bool)

(assert (=> b!918214 m!851385))

(declare-fun m!851387 () Bool)

(assert (=> b!918214 m!851387))

(declare-fun m!851389 () Bool)

(assert (=> b!918214 m!851389))

(declare-fun m!851391 () Bool)

(assert (=> b!918214 m!851391))

(assert (=> b!918214 m!851385))

(assert (=> b!918214 m!851391))

(declare-fun m!851393 () Bool)

(assert (=> b!918214 m!851393))

(declare-fun m!851395 () Bool)

(assert (=> b!918214 m!851395))

(declare-fun m!851397 () Bool)

(assert (=> b!918214 m!851397))

(declare-fun m!851399 () Bool)

(assert (=> b!918214 m!851399))

(assert (=> b!918214 m!851387))

(assert (=> b!918214 m!851397))

(declare-fun m!851401 () Bool)

(assert (=> b!918214 m!851401))

(declare-fun m!851403 () Bool)

(assert (=> b!918219 m!851403))

(declare-fun m!851405 () Bool)

(assert (=> b!918220 m!851405))

(declare-fun m!851407 () Bool)

(assert (=> b!918224 m!851407))

(check-sat (not mapNonEmpty!30936) (not b!918218) (not b!918221) tp_is_empty!19453 (not b!918219) (not b!918224) (not b_next!16945) b_and!27603 (not start!78714) (not b_lambda!13429) (not b!918220) (not b!918214) (not b!918213))
(check-sat b_and!27603 (not b_next!16945))
