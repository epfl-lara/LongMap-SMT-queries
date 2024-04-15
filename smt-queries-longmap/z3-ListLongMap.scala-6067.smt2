; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78492 () Bool)

(assert start!78492)

(declare-fun b!915043 () Bool)

(declare-fun e!513495 () Bool)

(declare-fun tp_is_empty!19231 () Bool)

(assert (=> b!915043 (= e!513495 tp_is_empty!19231)))

(declare-fun mapIsEmpty!30603 () Bool)

(declare-fun mapRes!30603 () Bool)

(assert (=> mapIsEmpty!30603 mapRes!30603))

(declare-fun b!915044 () Bool)

(declare-fun e!513494 () Bool)

(assert (=> b!915044 (= e!513494 false)))

(declare-fun lt!411410 () Bool)

(declare-datatypes ((array!54455 0))(
  ( (array!54456 (arr!26173 (Array (_ BitVec 32) (_ BitVec 64))) (size!26634 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54455)

(declare-datatypes ((List!18402 0))(
  ( (Nil!18399) (Cons!18398 (h!19544 (_ BitVec 64)) (t!26006 List!18402)) )
))
(declare-fun arrayNoDuplicates!0 (array!54455 (_ BitVec 32) List!18402) Bool)

(assert (=> b!915044 (= lt!411410 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18399))))

(declare-fun mapNonEmpty!30603 () Bool)

(declare-fun tp!58671 () Bool)

(assert (=> mapNonEmpty!30603 (= mapRes!30603 (and tp!58671 e!513495))))

(declare-datatypes ((V!30607 0))(
  ( (V!30608 (val!9666 Int)) )
))
(declare-datatypes ((ValueCell!9134 0))(
  ( (ValueCellFull!9134 (v!12183 V!30607)) (EmptyCell!9134) )
))
(declare-fun mapValue!30603 () ValueCell!9134)

(declare-fun mapKey!30603 () (_ BitVec 32))

(declare-datatypes ((array!54457 0))(
  ( (array!54458 (arr!26174 (Array (_ BitVec 32) ValueCell!9134)) (size!26635 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54457)

(declare-fun mapRest!30603 () (Array (_ BitVec 32) ValueCell!9134))

(assert (=> mapNonEmpty!30603 (= (arr!26174 _values!1231) (store mapRest!30603 mapKey!30603 mapValue!30603))))

(declare-fun b!915046 () Bool)

(declare-fun e!513498 () Bool)

(declare-fun e!513497 () Bool)

(assert (=> b!915046 (= e!513498 (and e!513497 mapRes!30603))))

(declare-fun condMapEmpty!30603 () Bool)

(declare-fun mapDefault!30603 () ValueCell!9134)

(assert (=> b!915046 (= condMapEmpty!30603 (= (arr!26174 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9134)) mapDefault!30603)))))

(declare-fun b!915047 () Bool)

(assert (=> b!915047 (= e!513497 tp_is_empty!19231)))

(declare-fun b!915048 () Bool)

(declare-fun res!617021 () Bool)

(assert (=> b!915048 (=> (not res!617021) (not e!513494))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915048 (= res!617021 (and (= (size!26635 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26634 _keys!1487) (size!26635 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!617019 () Bool)

(assert (=> start!78492 (=> (not res!617019) (not e!513494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78492 (= res!617019 (validMask!0 mask!1881))))

(assert (=> start!78492 e!513494))

(assert (=> start!78492 true))

(declare-fun array_inv!20516 (array!54457) Bool)

(assert (=> start!78492 (and (array_inv!20516 _values!1231) e!513498)))

(declare-fun array_inv!20517 (array!54455) Bool)

(assert (=> start!78492 (array_inv!20517 _keys!1487)))

(declare-fun b!915045 () Bool)

(declare-fun res!617020 () Bool)

(assert (=> b!915045 (=> (not res!617020) (not e!513494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54455 (_ BitVec 32)) Bool)

(assert (=> b!915045 (= res!617020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78492 res!617019) b!915048))

(assert (= (and b!915048 res!617021) b!915045))

(assert (= (and b!915045 res!617020) b!915044))

(assert (= (and b!915046 condMapEmpty!30603) mapIsEmpty!30603))

(assert (= (and b!915046 (not condMapEmpty!30603)) mapNonEmpty!30603))

(get-info :version)

(assert (= (and mapNonEmpty!30603 ((_ is ValueCellFull!9134) mapValue!30603)) b!915043))

(assert (= (and b!915046 ((_ is ValueCellFull!9134) mapDefault!30603)) b!915047))

(assert (= start!78492 b!915046))

(declare-fun m!848953 () Bool)

(assert (=> b!915044 m!848953))

(declare-fun m!848955 () Bool)

(assert (=> mapNonEmpty!30603 m!848955))

(declare-fun m!848957 () Bool)

(assert (=> start!78492 m!848957))

(declare-fun m!848959 () Bool)

(assert (=> start!78492 m!848959))

(declare-fun m!848961 () Bool)

(assert (=> start!78492 m!848961))

(declare-fun m!848963 () Bool)

(assert (=> b!915045 m!848963))

(check-sat (not start!78492) (not b!915045) tp_is_empty!19231 (not b!915044) (not mapNonEmpty!30603))
(check-sat)
