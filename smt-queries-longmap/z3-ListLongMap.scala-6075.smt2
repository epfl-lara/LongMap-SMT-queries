; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78540 () Bool)

(assert start!78540)

(declare-fun b_free!16771 () Bool)

(declare-fun b_next!16771 () Bool)

(assert (=> start!78540 (= b_free!16771 (not b_next!16771))))

(declare-fun tp!58755 () Bool)

(declare-fun b_and!27367 () Bool)

(assert (=> start!78540 (= tp!58755 b_and!27367)))

(declare-fun b!915506 () Bool)

(declare-fun e!513854 () Bool)

(declare-fun tp_is_empty!19279 () Bool)

(assert (=> b!915506 (= e!513854 tp_is_empty!19279)))

(declare-fun res!617269 () Bool)

(declare-fun e!513855 () Bool)

(assert (=> start!78540 (=> (not res!617269) (not e!513855))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78540 (= res!617269 (validMask!0 mask!1881))))

(assert (=> start!78540 e!513855))

(assert (=> start!78540 true))

(declare-datatypes ((V!30671 0))(
  ( (V!30672 (val!9690 Int)) )
))
(declare-datatypes ((ValueCell!9158 0))(
  ( (ValueCellFull!9158 (v!12207 V!30671)) (EmptyCell!9158) )
))
(declare-datatypes ((array!54543 0))(
  ( (array!54544 (arr!26217 (Array (_ BitVec 32) ValueCell!9158)) (size!26678 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54543)

(declare-fun e!513858 () Bool)

(declare-fun array_inv!20542 (array!54543) Bool)

(assert (=> start!78540 (and (array_inv!20542 _values!1231) e!513858)))

(assert (=> start!78540 tp!58755))

(declare-datatypes ((array!54545 0))(
  ( (array!54546 (arr!26218 (Array (_ BitVec 32) (_ BitVec 64))) (size!26679 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54545)

(declare-fun array_inv!20543 (array!54545) Bool)

(assert (=> start!78540 (array_inv!20543 _keys!1487)))

(assert (=> start!78540 tp_is_empty!19279))

(declare-fun b!915507 () Bool)

(declare-fun res!617268 () Bool)

(assert (=> b!915507 (=> (not res!617268) (not e!513855))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!915507 (= res!617268 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26679 _keys!1487))))))

(declare-fun b!915508 () Bool)

(declare-fun res!617270 () Bool)

(assert (=> b!915508 (=> (not res!617270) (not e!513855))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915508 (= res!617270 (and (= (size!26678 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26679 _keys!1487) (size!26678 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30675 () Bool)

(declare-fun mapRes!30675 () Bool)

(assert (=> mapIsEmpty!30675 mapRes!30675))

(declare-fun mapNonEmpty!30675 () Bool)

(declare-fun tp!58754 () Bool)

(assert (=> mapNonEmpty!30675 (= mapRes!30675 (and tp!58754 e!513854))))

(declare-fun mapValue!30675 () ValueCell!9158)

(declare-fun mapRest!30675 () (Array (_ BitVec 32) ValueCell!9158))

(declare-fun mapKey!30675 () (_ BitVec 32))

(assert (=> mapNonEmpty!30675 (= (arr!26217 _values!1231) (store mapRest!30675 mapKey!30675 mapValue!30675))))

(declare-fun b!915509 () Bool)

(declare-fun e!513856 () Bool)

(assert (=> b!915509 (= e!513856 tp_is_empty!19279)))

(declare-fun b!915510 () Bool)

(assert (=> b!915510 (= e!513858 (and e!513856 mapRes!30675))))

(declare-fun condMapEmpty!30675 () Bool)

(declare-fun mapDefault!30675 () ValueCell!9158)

(assert (=> b!915510 (= condMapEmpty!30675 (= (arr!26217 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9158)) mapDefault!30675)))))

(declare-fun b!915511 () Bool)

(declare-fun res!617267 () Bool)

(assert (=> b!915511 (=> (not res!617267) (not e!513855))))

(declare-datatypes ((List!18419 0))(
  ( (Nil!18416) (Cons!18415 (h!19561 (_ BitVec 64)) (t!26023 List!18419)) )
))
(declare-fun arrayNoDuplicates!0 (array!54545 (_ BitVec 32) List!18419) Bool)

(assert (=> b!915511 (= res!617267 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18416))))

(declare-fun b!915512 () Bool)

(declare-fun res!617266 () Bool)

(assert (=> b!915512 (=> (not res!617266) (not e!513855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54545 (_ BitVec 32)) Bool)

(assert (=> b!915512 (= res!617266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915513 () Bool)

(assert (=> b!915513 (= e!513855 false)))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!411473 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30671)

(declare-fun minValue!1173 () V!30671)

(declare-datatypes ((tuple2!12620 0))(
  ( (tuple2!12621 (_1!6321 (_ BitVec 64)) (_2!6321 V!30671)) )
))
(declare-datatypes ((List!18420 0))(
  ( (Nil!18417) (Cons!18416 (h!19562 tuple2!12620) (t!26024 List!18420)) )
))
(declare-datatypes ((ListLongMap!11307 0))(
  ( (ListLongMap!11308 (toList!5669 List!18420)) )
))
(declare-fun contains!4679 (ListLongMap!11307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2868 (array!54545 array!54543 (_ BitVec 32) (_ BitVec 32) V!30671 V!30671 (_ BitVec 32) Int) ListLongMap!11307)

(assert (=> b!915513 (= lt!411473 (contains!4679 (getCurrentListMap!2868 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(assert (= (and start!78540 res!617269) b!915508))

(assert (= (and b!915508 res!617270) b!915512))

(assert (= (and b!915512 res!617266) b!915511))

(assert (= (and b!915511 res!617267) b!915507))

(assert (= (and b!915507 res!617268) b!915513))

(assert (= (and b!915510 condMapEmpty!30675) mapIsEmpty!30675))

(assert (= (and b!915510 (not condMapEmpty!30675)) mapNonEmpty!30675))

(get-info :version)

(assert (= (and mapNonEmpty!30675 ((_ is ValueCellFull!9158) mapValue!30675)) b!915506))

(assert (= (and b!915510 ((_ is ValueCellFull!9158) mapDefault!30675)) b!915509))

(assert (= start!78540 b!915510))

(declare-fun m!849253 () Bool)

(assert (=> start!78540 m!849253))

(declare-fun m!849255 () Bool)

(assert (=> start!78540 m!849255))

(declare-fun m!849257 () Bool)

(assert (=> start!78540 m!849257))

(declare-fun m!849259 () Bool)

(assert (=> b!915513 m!849259))

(assert (=> b!915513 m!849259))

(declare-fun m!849261 () Bool)

(assert (=> b!915513 m!849261))

(declare-fun m!849263 () Bool)

(assert (=> b!915511 m!849263))

(declare-fun m!849265 () Bool)

(assert (=> mapNonEmpty!30675 m!849265))

(declare-fun m!849267 () Bool)

(assert (=> b!915512 m!849267))

(check-sat (not mapNonEmpty!30675) (not b_next!16771) (not b!915512) (not start!78540) b_and!27367 (not b!915511) (not b!915513) tp_is_empty!19279)
(check-sat b_and!27367 (not b_next!16771))
