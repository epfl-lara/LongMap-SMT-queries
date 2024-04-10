; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78578 () Bool)

(assert start!78578)

(declare-fun b_free!16791 () Bool)

(declare-fun b_next!16791 () Bool)

(assert (=> start!78578 (= b_free!16791 (not b_next!16791))))

(declare-fun tp!58813 () Bool)

(declare-fun b_and!27413 () Bool)

(assert (=> start!78578 (= tp!58813 b_and!27413)))

(declare-fun res!617530 () Bool)

(declare-fun e!514152 () Bool)

(assert (=> start!78578 (=> (not res!617530) (not e!514152))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78578 (= res!617530 (validMask!0 mask!1881))))

(assert (=> start!78578 e!514152))

(assert (=> start!78578 true))

(declare-datatypes ((V!30697 0))(
  ( (V!30698 (val!9700 Int)) )
))
(declare-datatypes ((ValueCell!9168 0))(
  ( (ValueCellFull!9168 (v!12218 V!30697)) (EmptyCell!9168) )
))
(declare-datatypes ((array!54592 0))(
  ( (array!54593 (arr!26241 (Array (_ BitVec 32) ValueCell!9168)) (size!26700 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54592)

(declare-fun e!514156 () Bool)

(declare-fun array_inv!20472 (array!54592) Bool)

(assert (=> start!78578 (and (array_inv!20472 _values!1231) e!514156)))

(assert (=> start!78578 tp!58813))

(declare-datatypes ((array!54594 0))(
  ( (array!54595 (arr!26242 (Array (_ BitVec 32) (_ BitVec 64))) (size!26701 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54594)

(declare-fun array_inv!20473 (array!54594) Bool)

(assert (=> start!78578 (array_inv!20473 _keys!1487)))

(declare-fun tp_is_empty!19299 () Bool)

(assert (=> start!78578 tp_is_empty!19299))

(declare-fun b!915985 () Bool)

(declare-fun e!514153 () Bool)

(declare-fun mapRes!30705 () Bool)

(assert (=> b!915985 (= e!514156 (and e!514153 mapRes!30705))))

(declare-fun condMapEmpty!30705 () Bool)

(declare-fun mapDefault!30705 () ValueCell!9168)

(assert (=> b!915985 (= condMapEmpty!30705 (= (arr!26241 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9168)) mapDefault!30705)))))

(declare-fun mapIsEmpty!30705 () Bool)

(assert (=> mapIsEmpty!30705 mapRes!30705))

(declare-fun b!915986 () Bool)

(assert (=> b!915986 (= e!514153 tp_is_empty!19299)))

(declare-fun b!915987 () Bool)

(declare-fun res!617528 () Bool)

(assert (=> b!915987 (=> (not res!617528) (not e!514152))))

(declare-datatypes ((List!18398 0))(
  ( (Nil!18395) (Cons!18394 (h!19540 (_ BitVec 64)) (t!26011 List!18398)) )
))
(declare-fun arrayNoDuplicates!0 (array!54594 (_ BitVec 32) List!18398) Bool)

(assert (=> b!915987 (= res!617528 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18395))))

(declare-fun b!915988 () Bool)

(declare-fun res!617526 () Bool)

(assert (=> b!915988 (=> (not res!617526) (not e!514152))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915988 (= res!617526 (and (= (size!26700 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26701 _keys!1487) (size!26700 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915989 () Bool)

(assert (=> b!915989 (= e!514152 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!411739 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30697)

(declare-fun minValue!1173 () V!30697)

(declare-datatypes ((tuple2!12586 0))(
  ( (tuple2!12587 (_1!6304 (_ BitVec 64)) (_2!6304 V!30697)) )
))
(declare-datatypes ((List!18399 0))(
  ( (Nil!18396) (Cons!18395 (h!19541 tuple2!12586) (t!26012 List!18399)) )
))
(declare-datatypes ((ListLongMap!11283 0))(
  ( (ListLongMap!11284 (toList!5657 List!18399)) )
))
(declare-fun contains!4711 (ListLongMap!11283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2918 (array!54594 array!54592 (_ BitVec 32) (_ BitVec 32) V!30697 V!30697 (_ BitVec 32) Int) ListLongMap!11283)

(assert (=> b!915989 (= lt!411739 (contains!4711 (getCurrentListMap!2918 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!915990 () Bool)

(declare-fun res!617529 () Bool)

(assert (=> b!915990 (=> (not res!617529) (not e!514152))))

(assert (=> b!915990 (= res!617529 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26701 _keys!1487))))))

(declare-fun b!915991 () Bool)

(declare-fun e!514154 () Bool)

(assert (=> b!915991 (= e!514154 tp_is_empty!19299)))

(declare-fun b!915992 () Bool)

(declare-fun res!617527 () Bool)

(assert (=> b!915992 (=> (not res!617527) (not e!514152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54594 (_ BitVec 32)) Bool)

(assert (=> b!915992 (= res!617527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30705 () Bool)

(declare-fun tp!58814 () Bool)

(assert (=> mapNonEmpty!30705 (= mapRes!30705 (and tp!58814 e!514154))))

(declare-fun mapRest!30705 () (Array (_ BitVec 32) ValueCell!9168))

(declare-fun mapKey!30705 () (_ BitVec 32))

(declare-fun mapValue!30705 () ValueCell!9168)

(assert (=> mapNonEmpty!30705 (= (arr!26241 _values!1231) (store mapRest!30705 mapKey!30705 mapValue!30705))))

(assert (= (and start!78578 res!617530) b!915988))

(assert (= (and b!915988 res!617526) b!915992))

(assert (= (and b!915992 res!617527) b!915987))

(assert (= (and b!915987 res!617528) b!915990))

(assert (= (and b!915990 res!617529) b!915989))

(assert (= (and b!915985 condMapEmpty!30705) mapIsEmpty!30705))

(assert (= (and b!915985 (not condMapEmpty!30705)) mapNonEmpty!30705))

(get-info :version)

(assert (= (and mapNonEmpty!30705 ((_ is ValueCellFull!9168) mapValue!30705)) b!915991))

(assert (= (and b!915985 ((_ is ValueCellFull!9168) mapDefault!30705)) b!915986))

(assert (= start!78578 b!915985))

(declare-fun m!850171 () Bool)

(assert (=> start!78578 m!850171))

(declare-fun m!850173 () Bool)

(assert (=> start!78578 m!850173))

(declare-fun m!850175 () Bool)

(assert (=> start!78578 m!850175))

(declare-fun m!850177 () Bool)

(assert (=> b!915989 m!850177))

(assert (=> b!915989 m!850177))

(declare-fun m!850179 () Bool)

(assert (=> b!915989 m!850179))

(declare-fun m!850181 () Bool)

(assert (=> b!915987 m!850181))

(declare-fun m!850183 () Bool)

(assert (=> mapNonEmpty!30705 m!850183))

(declare-fun m!850185 () Bool)

(assert (=> b!915992 m!850185))

(check-sat (not b!915992) tp_is_empty!19299 (not b!915989) (not b_next!16791) b_and!27413 (not b!915987) (not start!78578) (not mapNonEmpty!30705))
(check-sat b_and!27413 (not b_next!16791))
