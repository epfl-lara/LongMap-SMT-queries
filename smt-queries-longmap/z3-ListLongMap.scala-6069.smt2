; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78504 () Bool)

(assert start!78504)

(declare-fun b!915151 () Bool)

(declare-fun res!617074 () Bool)

(declare-fun e!513584 () Bool)

(assert (=> b!915151 (=> (not res!617074) (not e!513584))))

(declare-datatypes ((array!54477 0))(
  ( (array!54478 (arr!26184 (Array (_ BitVec 32) (_ BitVec 64))) (size!26645 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54477)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54477 (_ BitVec 32)) Bool)

(assert (=> b!915151 (= res!617074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30621 () Bool)

(declare-fun mapRes!30621 () Bool)

(assert (=> mapIsEmpty!30621 mapRes!30621))

(declare-fun b!915153 () Bool)

(declare-fun e!513587 () Bool)

(declare-fun e!513585 () Bool)

(assert (=> b!915153 (= e!513587 (and e!513585 mapRes!30621))))

(declare-fun condMapEmpty!30621 () Bool)

(declare-datatypes ((V!30623 0))(
  ( (V!30624 (val!9672 Int)) )
))
(declare-datatypes ((ValueCell!9140 0))(
  ( (ValueCellFull!9140 (v!12189 V!30623)) (EmptyCell!9140) )
))
(declare-datatypes ((array!54479 0))(
  ( (array!54480 (arr!26185 (Array (_ BitVec 32) ValueCell!9140)) (size!26646 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54479)

(declare-fun mapDefault!30621 () ValueCell!9140)

(assert (=> b!915153 (= condMapEmpty!30621 (= (arr!26185 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9140)) mapDefault!30621)))))

(declare-fun res!617073 () Bool)

(assert (=> start!78504 (=> (not res!617073) (not e!513584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78504 (= res!617073 (validMask!0 mask!1881))))

(assert (=> start!78504 e!513584))

(assert (=> start!78504 true))

(declare-fun array_inv!20522 (array!54479) Bool)

(assert (=> start!78504 (and (array_inv!20522 _values!1231) e!513587)))

(declare-fun array_inv!20523 (array!54477) Bool)

(assert (=> start!78504 (array_inv!20523 _keys!1487)))

(declare-fun b!915152 () Bool)

(declare-fun tp_is_empty!19243 () Bool)

(assert (=> b!915152 (= e!513585 tp_is_empty!19243)))

(declare-fun b!915154 () Bool)

(declare-fun res!617075 () Bool)

(assert (=> b!915154 (=> (not res!617075) (not e!513584))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915154 (= res!617075 (and (= (size!26646 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26645 _keys!1487) (size!26646 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915155 () Bool)

(declare-fun e!513586 () Bool)

(assert (=> b!915155 (= e!513586 tp_is_empty!19243)))

(declare-fun mapNonEmpty!30621 () Bool)

(declare-fun tp!58689 () Bool)

(assert (=> mapNonEmpty!30621 (= mapRes!30621 (and tp!58689 e!513586))))

(declare-fun mapRest!30621 () (Array (_ BitVec 32) ValueCell!9140))

(declare-fun mapKey!30621 () (_ BitVec 32))

(declare-fun mapValue!30621 () ValueCell!9140)

(assert (=> mapNonEmpty!30621 (= (arr!26185 _values!1231) (store mapRest!30621 mapKey!30621 mapValue!30621))))

(declare-fun b!915156 () Bool)

(assert (=> b!915156 (= e!513584 false)))

(declare-fun lt!411428 () Bool)

(declare-datatypes ((List!18406 0))(
  ( (Nil!18403) (Cons!18402 (h!19548 (_ BitVec 64)) (t!26010 List!18406)) )
))
(declare-fun arrayNoDuplicates!0 (array!54477 (_ BitVec 32) List!18406) Bool)

(assert (=> b!915156 (= lt!411428 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18403))))

(assert (= (and start!78504 res!617073) b!915154))

(assert (= (and b!915154 res!617075) b!915151))

(assert (= (and b!915151 res!617074) b!915156))

(assert (= (and b!915153 condMapEmpty!30621) mapIsEmpty!30621))

(assert (= (and b!915153 (not condMapEmpty!30621)) mapNonEmpty!30621))

(get-info :version)

(assert (= (and mapNonEmpty!30621 ((_ is ValueCellFull!9140) mapValue!30621)) b!915155))

(assert (= (and b!915153 ((_ is ValueCellFull!9140) mapDefault!30621)) b!915152))

(assert (= start!78504 b!915153))

(declare-fun m!849025 () Bool)

(assert (=> b!915151 m!849025))

(declare-fun m!849027 () Bool)

(assert (=> start!78504 m!849027))

(declare-fun m!849029 () Bool)

(assert (=> start!78504 m!849029))

(declare-fun m!849031 () Bool)

(assert (=> start!78504 m!849031))

(declare-fun m!849033 () Bool)

(assert (=> mapNonEmpty!30621 m!849033))

(declare-fun m!849035 () Bool)

(assert (=> b!915156 m!849035))

(check-sat (not start!78504) (not mapNonEmpty!30621) (not b!915151) (not b!915156) tp_is_empty!19243)
(check-sat)
