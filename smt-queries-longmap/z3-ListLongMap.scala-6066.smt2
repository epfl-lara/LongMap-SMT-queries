; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78506 () Bool)

(assert start!78506)

(declare-fun b!915246 () Bool)

(declare-fun res!617112 () Bool)

(declare-fun e!513615 () Bool)

(assert (=> b!915246 (=> (not res!617112) (not e!513615))))

(declare-datatypes ((array!54452 0))(
  ( (array!54453 (arr!26171 (Array (_ BitVec 32) (_ BitVec 64))) (size!26630 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54452)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54452 (_ BitVec 32)) Bool)

(assert (=> b!915246 (= res!617112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915247 () Bool)

(declare-fun res!617111 () Bool)

(assert (=> b!915247 (=> (not res!617111) (not e!513615))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30601 0))(
  ( (V!30602 (val!9664 Int)) )
))
(declare-datatypes ((ValueCell!9132 0))(
  ( (ValueCellFull!9132 (v!12182 V!30601)) (EmptyCell!9132) )
))
(declare-datatypes ((array!54454 0))(
  ( (array!54455 (arr!26172 (Array (_ BitVec 32) ValueCell!9132)) (size!26631 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54454)

(assert (=> b!915247 (= res!617111 (and (= (size!26631 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26630 _keys!1487) (size!26631 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30597 () Bool)

(declare-fun mapRes!30597 () Bool)

(declare-fun tp!58664 () Bool)

(declare-fun e!513616 () Bool)

(assert (=> mapNonEmpty!30597 (= mapRes!30597 (and tp!58664 e!513616))))

(declare-fun mapKey!30597 () (_ BitVec 32))

(declare-fun mapRest!30597 () (Array (_ BitVec 32) ValueCell!9132))

(declare-fun mapValue!30597 () ValueCell!9132)

(assert (=> mapNonEmpty!30597 (= (arr!26172 _values!1231) (store mapRest!30597 mapKey!30597 mapValue!30597))))

(declare-fun b!915248 () Bool)

(declare-fun e!513614 () Bool)

(declare-fun e!513613 () Bool)

(assert (=> b!915248 (= e!513614 (and e!513613 mapRes!30597))))

(declare-fun condMapEmpty!30597 () Bool)

(declare-fun mapDefault!30597 () ValueCell!9132)

(assert (=> b!915248 (= condMapEmpty!30597 (= (arr!26172 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9132)) mapDefault!30597)))))

(declare-fun mapIsEmpty!30597 () Bool)

(assert (=> mapIsEmpty!30597 mapRes!30597))

(declare-fun res!617113 () Bool)

(assert (=> start!78506 (=> (not res!617113) (not e!513615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78506 (= res!617113 (validMask!0 mask!1881))))

(assert (=> start!78506 e!513615))

(assert (=> start!78506 true))

(declare-fun array_inv!20432 (array!54454) Bool)

(assert (=> start!78506 (and (array_inv!20432 _values!1231) e!513614)))

(declare-fun array_inv!20433 (array!54452) Bool)

(assert (=> start!78506 (array_inv!20433 _keys!1487)))

(declare-fun b!915249 () Bool)

(assert (=> b!915249 (= e!513615 false)))

(declare-fun lt!411640 () Bool)

(declare-datatypes ((List!18364 0))(
  ( (Nil!18361) (Cons!18360 (h!19506 (_ BitVec 64)) (t!25977 List!18364)) )
))
(declare-fun arrayNoDuplicates!0 (array!54452 (_ BitVec 32) List!18364) Bool)

(assert (=> b!915249 (= lt!411640 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18361))))

(declare-fun b!915250 () Bool)

(declare-fun tp_is_empty!19227 () Bool)

(assert (=> b!915250 (= e!513613 tp_is_empty!19227)))

(declare-fun b!915251 () Bool)

(assert (=> b!915251 (= e!513616 tp_is_empty!19227)))

(assert (= (and start!78506 res!617113) b!915247))

(assert (= (and b!915247 res!617111) b!915246))

(assert (= (and b!915246 res!617112) b!915249))

(assert (= (and b!915248 condMapEmpty!30597) mapIsEmpty!30597))

(assert (= (and b!915248 (not condMapEmpty!30597)) mapNonEmpty!30597))

(get-info :version)

(assert (= (and mapNonEmpty!30597 ((_ is ValueCellFull!9132) mapValue!30597)) b!915251))

(assert (= (and b!915248 ((_ is ValueCellFull!9132) mapDefault!30597)) b!915250))

(assert (= start!78506 b!915248))

(declare-fun m!849687 () Bool)

(assert (=> b!915246 m!849687))

(declare-fun m!849689 () Bool)

(assert (=> mapNonEmpty!30597 m!849689))

(declare-fun m!849691 () Bool)

(assert (=> start!78506 m!849691))

(declare-fun m!849693 () Bool)

(assert (=> start!78506 m!849693))

(declare-fun m!849695 () Bool)

(assert (=> start!78506 m!849695))

(declare-fun m!849697 () Bool)

(assert (=> b!915249 m!849697))

(check-sat tp_is_empty!19227 (not start!78506) (not b!915249) (not b!915246) (not mapNonEmpty!30597))
(check-sat)
