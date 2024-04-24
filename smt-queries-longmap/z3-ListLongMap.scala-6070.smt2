; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78696 () Bool)

(assert start!78696)

(declare-fun b!916347 () Bool)

(declare-fun e!514361 () Bool)

(declare-fun tp_is_empty!19249 () Bool)

(assert (=> b!916347 (= e!514361 tp_is_empty!19249)))

(declare-fun b!916349 () Bool)

(declare-fun res!617556 () Bool)

(declare-fun e!514363 () Bool)

(assert (=> b!916349 (=> (not res!617556) (not e!514363))))

(declare-datatypes ((array!54547 0))(
  ( (array!54548 (arr!26214 (Array (_ BitVec 32) (_ BitVec 64))) (size!26674 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54547)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54547 (_ BitVec 32)) Bool)

(assert (=> b!916349 (= res!617556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916350 () Bool)

(declare-fun e!514362 () Bool)

(assert (=> b!916350 (= e!514362 tp_is_empty!19249)))

(declare-fun b!916348 () Bool)

(declare-fun res!617555 () Bool)

(assert (=> b!916348 (=> (not res!617555) (not e!514363))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30631 0))(
  ( (V!30632 (val!9675 Int)) )
))
(declare-datatypes ((ValueCell!9143 0))(
  ( (ValueCellFull!9143 (v!12190 V!30631)) (EmptyCell!9143) )
))
(declare-datatypes ((array!54549 0))(
  ( (array!54550 (arr!26215 (Array (_ BitVec 32) ValueCell!9143)) (size!26675 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54549)

(assert (=> b!916348 (= res!617555 (and (= (size!26675 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26674 _keys!1487) (size!26675 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!617554 () Bool)

(assert (=> start!78696 (=> (not res!617554) (not e!514363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78696 (= res!617554 (validMask!0 mask!1881))))

(assert (=> start!78696 e!514363))

(assert (=> start!78696 true))

(declare-fun e!514359 () Bool)

(declare-fun array_inv!20562 (array!54549) Bool)

(assert (=> start!78696 (and (array_inv!20562 _values!1231) e!514359)))

(declare-fun array_inv!20563 (array!54547) Bool)

(assert (=> start!78696 (array_inv!20563 _keys!1487)))

(declare-fun mapIsEmpty!30630 () Bool)

(declare-fun mapRes!30630 () Bool)

(assert (=> mapIsEmpty!30630 mapRes!30630))

(declare-fun b!916351 () Bool)

(assert (=> b!916351 (= e!514359 (and e!514361 mapRes!30630))))

(declare-fun condMapEmpty!30630 () Bool)

(declare-fun mapDefault!30630 () ValueCell!9143)

(assert (=> b!916351 (= condMapEmpty!30630 (= (arr!26215 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9143)) mapDefault!30630)))))

(declare-fun b!916352 () Bool)

(assert (=> b!916352 (= e!514363 false)))

(declare-fun lt!412034 () Bool)

(declare-datatypes ((List!18359 0))(
  ( (Nil!18356) (Cons!18355 (h!19507 (_ BitVec 64)) (t!25964 List!18359)) )
))
(declare-fun arrayNoDuplicates!0 (array!54547 (_ BitVec 32) List!18359) Bool)

(assert (=> b!916352 (= lt!412034 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18356))))

(declare-fun mapNonEmpty!30630 () Bool)

(declare-fun tp!58698 () Bool)

(assert (=> mapNonEmpty!30630 (= mapRes!30630 (and tp!58698 e!514362))))

(declare-fun mapValue!30630 () ValueCell!9143)

(declare-fun mapRest!30630 () (Array (_ BitVec 32) ValueCell!9143))

(declare-fun mapKey!30630 () (_ BitVec 32))

(assert (=> mapNonEmpty!30630 (= (arr!26215 _values!1231) (store mapRest!30630 mapKey!30630 mapValue!30630))))

(assert (= (and start!78696 res!617554) b!916348))

(assert (= (and b!916348 res!617555) b!916349))

(assert (= (and b!916349 res!617556) b!916352))

(assert (= (and b!916351 condMapEmpty!30630) mapIsEmpty!30630))

(assert (= (and b!916351 (not condMapEmpty!30630)) mapNonEmpty!30630))

(get-info :version)

(assert (= (and mapNonEmpty!30630 ((_ is ValueCellFull!9143) mapValue!30630)) b!916350))

(assert (= (and b!916351 ((_ is ValueCellFull!9143) mapDefault!30630)) b!916347))

(assert (= start!78696 b!916351))

(declare-fun m!851113 () Bool)

(assert (=> b!916349 m!851113))

(declare-fun m!851115 () Bool)

(assert (=> start!78696 m!851115))

(declare-fun m!851117 () Bool)

(assert (=> start!78696 m!851117))

(declare-fun m!851119 () Bool)

(assert (=> start!78696 m!851119))

(declare-fun m!851121 () Bool)

(assert (=> b!916352 m!851121))

(declare-fun m!851123 () Bool)

(assert (=> mapNonEmpty!30630 m!851123))

(check-sat (not mapNonEmpty!30630) tp_is_empty!19249 (not b!916349) (not b!916352) (not start!78696))
(check-sat)
