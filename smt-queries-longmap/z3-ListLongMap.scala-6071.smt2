; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78536 () Bool)

(assert start!78536)

(declare-fun res!617247 () Bool)

(declare-fun e!513839 () Bool)

(assert (=> start!78536 (=> (not res!617247) (not e!513839))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78536 (= res!617247 (validMask!0 mask!1881))))

(assert (=> start!78536 e!513839))

(assert (=> start!78536 true))

(declare-datatypes ((V!30641 0))(
  ( (V!30642 (val!9679 Int)) )
))
(declare-datatypes ((ValueCell!9147 0))(
  ( (ValueCellFull!9147 (v!12197 V!30641)) (EmptyCell!9147) )
))
(declare-datatypes ((array!54510 0))(
  ( (array!54511 (arr!26200 (Array (_ BitVec 32) ValueCell!9147)) (size!26659 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54510)

(declare-fun e!513840 () Bool)

(declare-fun array_inv!20450 (array!54510) Bool)

(assert (=> start!78536 (and (array_inv!20450 _values!1231) e!513840)))

(declare-datatypes ((array!54512 0))(
  ( (array!54513 (arr!26201 (Array (_ BitVec 32) (_ BitVec 64))) (size!26660 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54512)

(declare-fun array_inv!20451 (array!54512) Bool)

(assert (=> start!78536 (array_inv!20451 _keys!1487)))

(declare-fun b!915516 () Bool)

(declare-fun e!513837 () Bool)

(declare-fun mapRes!30642 () Bool)

(assert (=> b!915516 (= e!513840 (and e!513837 mapRes!30642))))

(declare-fun condMapEmpty!30642 () Bool)

(declare-fun mapDefault!30642 () ValueCell!9147)

(assert (=> b!915516 (= condMapEmpty!30642 (= (arr!26200 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9147)) mapDefault!30642)))))

(declare-fun mapIsEmpty!30642 () Bool)

(assert (=> mapIsEmpty!30642 mapRes!30642))

(declare-fun b!915517 () Bool)

(declare-fun res!617246 () Bool)

(assert (=> b!915517 (=> (not res!617246) (not e!513839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54512 (_ BitVec 32)) Bool)

(assert (=> b!915517 (= res!617246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915518 () Bool)

(declare-fun tp_is_empty!19257 () Bool)

(assert (=> b!915518 (= e!513837 tp_is_empty!19257)))

(declare-fun b!915519 () Bool)

(declare-fun res!617248 () Bool)

(assert (=> b!915519 (=> (not res!617248) (not e!513839))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915519 (= res!617248 (and (= (size!26659 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26660 _keys!1487) (size!26659 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915520 () Bool)

(declare-fun e!513838 () Bool)

(assert (=> b!915520 (= e!513838 tp_is_empty!19257)))

(declare-fun b!915521 () Bool)

(assert (=> b!915521 (= e!513839 false)))

(declare-fun lt!411685 () Bool)

(declare-datatypes ((List!18376 0))(
  ( (Nil!18373) (Cons!18372 (h!19518 (_ BitVec 64)) (t!25989 List!18376)) )
))
(declare-fun arrayNoDuplicates!0 (array!54512 (_ BitVec 32) List!18376) Bool)

(assert (=> b!915521 (= lt!411685 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18373))))

(declare-fun mapNonEmpty!30642 () Bool)

(declare-fun tp!58709 () Bool)

(assert (=> mapNonEmpty!30642 (= mapRes!30642 (and tp!58709 e!513838))))

(declare-fun mapKey!30642 () (_ BitVec 32))

(declare-fun mapRest!30642 () (Array (_ BitVec 32) ValueCell!9147))

(declare-fun mapValue!30642 () ValueCell!9147)

(assert (=> mapNonEmpty!30642 (= (arr!26200 _values!1231) (store mapRest!30642 mapKey!30642 mapValue!30642))))

(assert (= (and start!78536 res!617247) b!915519))

(assert (= (and b!915519 res!617248) b!915517))

(assert (= (and b!915517 res!617246) b!915521))

(assert (= (and b!915516 condMapEmpty!30642) mapIsEmpty!30642))

(assert (= (and b!915516 (not condMapEmpty!30642)) mapNonEmpty!30642))

(get-info :version)

(assert (= (and mapNonEmpty!30642 ((_ is ValueCellFull!9147) mapValue!30642)) b!915520))

(assert (= (and b!915516 ((_ is ValueCellFull!9147) mapDefault!30642)) b!915518))

(assert (= start!78536 b!915516))

(declare-fun m!849867 () Bool)

(assert (=> start!78536 m!849867))

(declare-fun m!849869 () Bool)

(assert (=> start!78536 m!849869))

(declare-fun m!849871 () Bool)

(assert (=> start!78536 m!849871))

(declare-fun m!849873 () Bool)

(assert (=> b!915517 m!849873))

(declare-fun m!849875 () Bool)

(assert (=> b!915521 m!849875))

(declare-fun m!849877 () Bool)

(assert (=> mapNonEmpty!30642 m!849877))

(check-sat (not mapNonEmpty!30642) (not b!915521) tp_is_empty!19257 (not start!78536) (not b!915517))
(check-sat)
