; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78510 () Bool)

(assert start!78510)

(declare-fun mapIsEmpty!30630 () Bool)

(declare-fun mapRes!30630 () Bool)

(assert (=> mapIsEmpty!30630 mapRes!30630))

(declare-fun b!915205 () Bool)

(declare-fun e!513629 () Bool)

(declare-fun tp_is_empty!19249 () Bool)

(assert (=> b!915205 (= e!513629 tp_is_empty!19249)))

(declare-fun b!915206 () Bool)

(declare-fun e!513631 () Bool)

(assert (=> b!915206 (= e!513631 (and e!513629 mapRes!30630))))

(declare-fun condMapEmpty!30630 () Bool)

(declare-datatypes ((V!30631 0))(
  ( (V!30632 (val!9675 Int)) )
))
(declare-datatypes ((ValueCell!9143 0))(
  ( (ValueCellFull!9143 (v!12192 V!30631)) (EmptyCell!9143) )
))
(declare-datatypes ((array!54489 0))(
  ( (array!54490 (arr!26190 (Array (_ BitVec 32) ValueCell!9143)) (size!26651 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54489)

(declare-fun mapDefault!30630 () ValueCell!9143)

(assert (=> b!915206 (= condMapEmpty!30630 (= (arr!26190 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9143)) mapDefault!30630)))))

(declare-fun res!617101 () Bool)

(declare-fun e!513630 () Bool)

(assert (=> start!78510 (=> (not res!617101) (not e!513630))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78510 (= res!617101 (validMask!0 mask!1881))))

(assert (=> start!78510 e!513630))

(assert (=> start!78510 true))

(declare-fun array_inv!20524 (array!54489) Bool)

(assert (=> start!78510 (and (array_inv!20524 _values!1231) e!513631)))

(declare-datatypes ((array!54491 0))(
  ( (array!54492 (arr!26191 (Array (_ BitVec 32) (_ BitVec 64))) (size!26652 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54491)

(declare-fun array_inv!20525 (array!54491) Bool)

(assert (=> start!78510 (array_inv!20525 _keys!1487)))

(declare-fun b!915207 () Bool)

(assert (=> b!915207 (= e!513630 false)))

(declare-fun lt!411437 () Bool)

(declare-datatypes ((List!18408 0))(
  ( (Nil!18405) (Cons!18404 (h!19550 (_ BitVec 64)) (t!26012 List!18408)) )
))
(declare-fun arrayNoDuplicates!0 (array!54491 (_ BitVec 32) List!18408) Bool)

(assert (=> b!915207 (= lt!411437 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18405))))

(declare-fun b!915208 () Bool)

(declare-fun res!617100 () Bool)

(assert (=> b!915208 (=> (not res!617100) (not e!513630))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915208 (= res!617100 (and (= (size!26651 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26652 _keys!1487) (size!26651 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30630 () Bool)

(declare-fun tp!58698 () Bool)

(declare-fun e!513633 () Bool)

(assert (=> mapNonEmpty!30630 (= mapRes!30630 (and tp!58698 e!513633))))

(declare-fun mapValue!30630 () ValueCell!9143)

(declare-fun mapKey!30630 () (_ BitVec 32))

(declare-fun mapRest!30630 () (Array (_ BitVec 32) ValueCell!9143))

(assert (=> mapNonEmpty!30630 (= (arr!26190 _values!1231) (store mapRest!30630 mapKey!30630 mapValue!30630))))

(declare-fun b!915209 () Bool)

(declare-fun res!617102 () Bool)

(assert (=> b!915209 (=> (not res!617102) (not e!513630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54491 (_ BitVec 32)) Bool)

(assert (=> b!915209 (= res!617102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915210 () Bool)

(assert (=> b!915210 (= e!513633 tp_is_empty!19249)))

(assert (= (and start!78510 res!617101) b!915208))

(assert (= (and b!915208 res!617100) b!915209))

(assert (= (and b!915209 res!617102) b!915207))

(assert (= (and b!915206 condMapEmpty!30630) mapIsEmpty!30630))

(assert (= (and b!915206 (not condMapEmpty!30630)) mapNonEmpty!30630))

(get-info :version)

(assert (= (and mapNonEmpty!30630 ((_ is ValueCellFull!9143) mapValue!30630)) b!915210))

(assert (= (and b!915206 ((_ is ValueCellFull!9143) mapDefault!30630)) b!915205))

(assert (= start!78510 b!915206))

(declare-fun m!849061 () Bool)

(assert (=> start!78510 m!849061))

(declare-fun m!849063 () Bool)

(assert (=> start!78510 m!849063))

(declare-fun m!849065 () Bool)

(assert (=> start!78510 m!849065))

(declare-fun m!849067 () Bool)

(assert (=> b!915207 m!849067))

(declare-fun m!849069 () Bool)

(assert (=> mapNonEmpty!30630 m!849069))

(declare-fun m!849071 () Bool)

(assert (=> b!915209 m!849071))

(check-sat (not b!915207) tp_is_empty!19249 (not mapNonEmpty!30630) (not start!78510) (not b!915209))
(check-sat)
