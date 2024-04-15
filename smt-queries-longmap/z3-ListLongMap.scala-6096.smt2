; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78666 () Bool)

(assert start!78666)

(declare-fun b_free!16897 () Bool)

(declare-fun b_next!16897 () Bool)

(assert (=> start!78666 (= b_free!16897 (not b_next!16897))))

(declare-fun tp!59133 () Bool)

(declare-fun b_and!27505 () Bool)

(assert (=> start!78666 (= tp!59133 b_and!27505)))

(declare-fun mapNonEmpty!30864 () Bool)

(declare-fun mapRes!30864 () Bool)

(declare-fun tp!59132 () Bool)

(declare-fun e!514931 () Bool)

(assert (=> mapNonEmpty!30864 (= mapRes!30864 (and tp!59132 e!514931))))

(declare-datatypes ((V!30839 0))(
  ( (V!30840 (val!9753 Int)) )
))
(declare-datatypes ((ValueCell!9221 0))(
  ( (ValueCellFull!9221 (v!12270 V!30839)) (EmptyCell!9221) )
))
(declare-fun mapValue!30864 () ValueCell!9221)

(declare-fun mapRest!30864 () (Array (_ BitVec 32) ValueCell!9221))

(declare-fun mapKey!30864 () (_ BitVec 32))

(declare-datatypes ((array!54785 0))(
  ( (array!54786 (arr!26338 (Array (_ BitVec 32) ValueCell!9221)) (size!26799 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54785)

(assert (=> mapNonEmpty!30864 (= (arr!26338 _values!1231) (store mapRest!30864 mapKey!30864 mapValue!30864))))

(declare-fun b!917229 () Bool)

(declare-fun res!618418 () Bool)

(declare-fun e!514934 () Bool)

(assert (=> b!917229 (=> (not res!618418) (not e!514934))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917229 (= res!618418 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917230 () Bool)

(declare-fun res!618416 () Bool)

(assert (=> b!917230 (=> (not res!618416) (not e!514934))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30839)

(declare-datatypes ((tuple2!12712 0))(
  ( (tuple2!12713 (_1!6367 (_ BitVec 64)) (_2!6367 V!30839)) )
))
(declare-datatypes ((List!18502 0))(
  ( (Nil!18499) (Cons!18498 (h!19644 tuple2!12712) (t!26120 List!18502)) )
))
(declare-datatypes ((ListLongMap!11399 0))(
  ( (ListLongMap!11400 (toList!5715 List!18502)) )
))
(declare-fun lt!411785 () ListLongMap!11399)

(declare-fun apply!553 (ListLongMap!11399 (_ BitVec 64)) V!30839)

(assert (=> b!917230 (= res!618416 (= (apply!553 lt!411785 k0!1099) v!791))))

(declare-fun res!618419 () Bool)

(declare-fun e!514930 () Bool)

(assert (=> start!78666 (=> (not res!618419) (not e!514930))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78666 (= res!618419 (validMask!0 mask!1881))))

(assert (=> start!78666 e!514930))

(assert (=> start!78666 true))

(declare-fun tp_is_empty!19405 () Bool)

(assert (=> start!78666 tp_is_empty!19405))

(declare-fun e!514933 () Bool)

(declare-fun array_inv!20618 (array!54785) Bool)

(assert (=> start!78666 (and (array_inv!20618 _values!1231) e!514933)))

(assert (=> start!78666 tp!59133))

(declare-datatypes ((array!54787 0))(
  ( (array!54788 (arr!26339 (Array (_ BitVec 32) (_ BitVec 64))) (size!26800 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54787)

(declare-fun array_inv!20619 (array!54787) Bool)

(assert (=> start!78666 (array_inv!20619 _keys!1487)))

(declare-fun b!917231 () Bool)

(declare-fun res!618412 () Bool)

(assert (=> b!917231 (=> (not res!618412) (not e!514930))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!917231 (= res!618412 (and (= (size!26799 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26800 _keys!1487) (size!26799 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917232 () Bool)

(declare-fun e!514932 () Bool)

(assert (=> b!917232 (= e!514932 (not true))))

(declare-fun lt!411783 () (_ BitVec 64))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30839)

(declare-fun minValue!1173 () V!30839)

(declare-fun getCurrentListMap!2909 (array!54787 array!54785 (_ BitVec 32) (_ BitVec 32) V!30839 V!30839 (_ BitVec 32) Int) ListLongMap!11399)

(declare-fun +!2641 (ListLongMap!11399 tuple2!12712) ListLongMap!11399)

(declare-fun get!13802 (ValueCell!9221 V!30839) V!30839)

(declare-fun dynLambda!1397 (Int (_ BitVec 64)) V!30839)

(assert (=> b!917232 (= (getCurrentListMap!2909 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2641 (getCurrentListMap!2909 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12713 lt!411783 (get!13802 (select (arr!26338 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1397 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30894 0))(
  ( (Unit!30895) )
))
(declare-fun lt!411784 () Unit!30894)

(declare-fun lemmaListMapRecursiveValidKeyArray!5 (array!54787 array!54785 (_ BitVec 32) (_ BitVec 32) V!30839 V!30839 (_ BitVec 32) Int) Unit!30894)

(assert (=> b!917232 (= lt!411784 (lemmaListMapRecursiveValidKeyArray!5 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917233 () Bool)

(declare-fun res!618417 () Bool)

(assert (=> b!917233 (=> (not res!618417) (not e!514930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54787 (_ BitVec 32)) Bool)

(assert (=> b!917233 (= res!618417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917234 () Bool)

(declare-fun res!618414 () Bool)

(assert (=> b!917234 (=> (not res!618414) (not e!514934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917234 (= res!618414 (validKeyInArray!0 k0!1099))))

(declare-fun b!917235 () Bool)

(assert (=> b!917235 (= e!514931 tp_is_empty!19405)))

(declare-fun b!917236 () Bool)

(declare-fun e!514935 () Bool)

(assert (=> b!917236 (= e!514933 (and e!514935 mapRes!30864))))

(declare-fun condMapEmpty!30864 () Bool)

(declare-fun mapDefault!30864 () ValueCell!9221)

(assert (=> b!917236 (= condMapEmpty!30864 (= (arr!26338 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9221)) mapDefault!30864)))))

(declare-fun b!917237 () Bool)

(declare-fun res!618411 () Bool)

(assert (=> b!917237 (=> (not res!618411) (not e!514930))))

(declare-datatypes ((List!18503 0))(
  ( (Nil!18500) (Cons!18499 (h!19645 (_ BitVec 64)) (t!26121 List!18503)) )
))
(declare-fun arrayNoDuplicates!0 (array!54787 (_ BitVec 32) List!18503) Bool)

(assert (=> b!917237 (= res!618411 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18500))))

(declare-fun mapIsEmpty!30864 () Bool)

(assert (=> mapIsEmpty!30864 mapRes!30864))

(declare-fun b!917238 () Bool)

(assert (=> b!917238 (= e!514930 e!514934)))

(declare-fun res!618415 () Bool)

(assert (=> b!917238 (=> (not res!618415) (not e!514934))))

(declare-fun contains!4719 (ListLongMap!11399 (_ BitVec 64)) Bool)

(assert (=> b!917238 (= res!618415 (contains!4719 lt!411785 k0!1099))))

(assert (=> b!917238 (= lt!411785 (getCurrentListMap!2909 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917239 () Bool)

(assert (=> b!917239 (= e!514934 e!514932)))

(declare-fun res!618410 () Bool)

(assert (=> b!917239 (=> (not res!618410) (not e!514932))))

(assert (=> b!917239 (= res!618410 (validKeyInArray!0 lt!411783))))

(assert (=> b!917239 (= lt!411783 (select (arr!26339 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917240 () Bool)

(assert (=> b!917240 (= e!514935 tp_is_empty!19405)))

(declare-fun b!917241 () Bool)

(declare-fun res!618413 () Bool)

(assert (=> b!917241 (=> (not res!618413) (not e!514930))))

(assert (=> b!917241 (= res!618413 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26800 _keys!1487))))))

(assert (= (and start!78666 res!618419) b!917231))

(assert (= (and b!917231 res!618412) b!917233))

(assert (= (and b!917233 res!618417) b!917237))

(assert (= (and b!917237 res!618411) b!917241))

(assert (= (and b!917241 res!618413) b!917238))

(assert (= (and b!917238 res!618415) b!917230))

(assert (= (and b!917230 res!618416) b!917229))

(assert (= (and b!917229 res!618418) b!917234))

(assert (= (and b!917234 res!618414) b!917239))

(assert (= (and b!917239 res!618410) b!917232))

(assert (= (and b!917236 condMapEmpty!30864) mapIsEmpty!30864))

(assert (= (and b!917236 (not condMapEmpty!30864)) mapNonEmpty!30864))

(get-info :version)

(assert (= (and mapNonEmpty!30864 ((_ is ValueCellFull!9221) mapValue!30864)) b!917235))

(assert (= (and b!917236 ((_ is ValueCellFull!9221) mapDefault!30864)) b!917240))

(assert (= start!78666 b!917236))

(declare-fun b_lambda!13381 () Bool)

(assert (=> (not b_lambda!13381) (not b!917232)))

(declare-fun t!26119 () Bool)

(declare-fun tb!5469 () Bool)

(assert (=> (and start!78666 (= defaultEntry!1235 defaultEntry!1235) t!26119) tb!5469))

(declare-fun result!10769 () Bool)

(assert (=> tb!5469 (= result!10769 tp_is_empty!19405)))

(assert (=> b!917232 t!26119))

(declare-fun b_and!27507 () Bool)

(assert (= b_and!27505 (and (=> t!26119 result!10769) b_and!27507)))

(declare-fun m!850453 () Bool)

(assert (=> start!78666 m!850453))

(declare-fun m!850455 () Bool)

(assert (=> start!78666 m!850455))

(declare-fun m!850457 () Bool)

(assert (=> start!78666 m!850457))

(declare-fun m!850459 () Bool)

(assert (=> b!917234 m!850459))

(declare-fun m!850461 () Bool)

(assert (=> b!917239 m!850461))

(declare-fun m!850463 () Bool)

(assert (=> b!917239 m!850463))

(declare-fun m!850465 () Bool)

(assert (=> b!917233 m!850465))

(declare-fun m!850467 () Bool)

(assert (=> b!917230 m!850467))

(declare-fun m!850469 () Bool)

(assert (=> b!917237 m!850469))

(declare-fun m!850471 () Bool)

(assert (=> b!917232 m!850471))

(declare-fun m!850473 () Bool)

(assert (=> b!917232 m!850473))

(declare-fun m!850475 () Bool)

(assert (=> b!917232 m!850475))

(declare-fun m!850477 () Bool)

(assert (=> b!917232 m!850477))

(assert (=> b!917232 m!850471))

(assert (=> b!917232 m!850473))

(declare-fun m!850479 () Bool)

(assert (=> b!917232 m!850479))

(declare-fun m!850481 () Bool)

(assert (=> b!917232 m!850481))

(assert (=> b!917232 m!850475))

(declare-fun m!850483 () Bool)

(assert (=> b!917232 m!850483))

(declare-fun m!850485 () Bool)

(assert (=> b!917238 m!850485))

(declare-fun m!850487 () Bool)

(assert (=> b!917238 m!850487))

(declare-fun m!850489 () Bool)

(assert (=> mapNonEmpty!30864 m!850489))

(check-sat (not b!917239) (not mapNonEmpty!30864) (not b_lambda!13381) (not b!917233) (not b!917238) (not b!917237) (not b!917230) (not b!917232) tp_is_empty!19405 b_and!27507 (not start!78666) (not b!917234) (not b_next!16897))
(check-sat b_and!27507 (not b_next!16897))
