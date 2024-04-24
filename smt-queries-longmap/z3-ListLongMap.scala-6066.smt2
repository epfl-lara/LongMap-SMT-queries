; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78672 () Bool)

(assert start!78672)

(declare-fun res!617446 () Bool)

(declare-fun e!514180 () Bool)

(assert (=> start!78672 (=> (not res!617446) (not e!514180))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78672 (= res!617446 (validMask!0 mask!1881))))

(assert (=> start!78672 e!514180))

(assert (=> start!78672 true))

(declare-datatypes ((V!30599 0))(
  ( (V!30600 (val!9663 Int)) )
))
(declare-datatypes ((ValueCell!9131 0))(
  ( (ValueCellFull!9131 (v!12178 V!30599)) (EmptyCell!9131) )
))
(declare-datatypes ((array!54507 0))(
  ( (array!54508 (arr!26194 (Array (_ BitVec 32) ValueCell!9131)) (size!26654 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54507)

(declare-fun e!514179 () Bool)

(declare-fun array_inv!20546 (array!54507) Bool)

(assert (=> start!78672 (and (array_inv!20546 _values!1231) e!514179)))

(declare-datatypes ((array!54509 0))(
  ( (array!54510 (arr!26195 (Array (_ BitVec 32) (_ BitVec 64))) (size!26655 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54509)

(declare-fun array_inv!20547 (array!54509) Bool)

(assert (=> start!78672 (array_inv!20547 _keys!1487)))

(declare-fun b!916131 () Bool)

(declare-fun res!617448 () Bool)

(assert (=> b!916131 (=> (not res!617448) (not e!514180))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916131 (= res!617448 (and (= (size!26654 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26655 _keys!1487) (size!26654 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30594 () Bool)

(declare-fun mapRes!30594 () Bool)

(declare-fun tp!58662 () Bool)

(declare-fun e!514182 () Bool)

(assert (=> mapNonEmpty!30594 (= mapRes!30594 (and tp!58662 e!514182))))

(declare-fun mapRest!30594 () (Array (_ BitVec 32) ValueCell!9131))

(declare-fun mapKey!30594 () (_ BitVec 32))

(declare-fun mapValue!30594 () ValueCell!9131)

(assert (=> mapNonEmpty!30594 (= (arr!26194 _values!1231) (store mapRest!30594 mapKey!30594 mapValue!30594))))

(declare-fun b!916132 () Bool)

(assert (=> b!916132 (= e!514180 false)))

(declare-fun lt!411998 () Bool)

(declare-datatypes ((List!18352 0))(
  ( (Nil!18349) (Cons!18348 (h!19500 (_ BitVec 64)) (t!25957 List!18352)) )
))
(declare-fun arrayNoDuplicates!0 (array!54509 (_ BitVec 32) List!18352) Bool)

(assert (=> b!916132 (= lt!411998 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18349))))

(declare-fun b!916133 () Bool)

(declare-fun e!514181 () Bool)

(assert (=> b!916133 (= e!514179 (and e!514181 mapRes!30594))))

(declare-fun condMapEmpty!30594 () Bool)

(declare-fun mapDefault!30594 () ValueCell!9131)

(assert (=> b!916133 (= condMapEmpty!30594 (= (arr!26194 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9131)) mapDefault!30594)))))

(declare-fun b!916134 () Bool)

(declare-fun tp_is_empty!19225 () Bool)

(assert (=> b!916134 (= e!514182 tp_is_empty!19225)))

(declare-fun b!916135 () Bool)

(declare-fun res!617447 () Bool)

(assert (=> b!916135 (=> (not res!617447) (not e!514180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54509 (_ BitVec 32)) Bool)

(assert (=> b!916135 (= res!617447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916136 () Bool)

(assert (=> b!916136 (= e!514181 tp_is_empty!19225)))

(declare-fun mapIsEmpty!30594 () Bool)

(assert (=> mapIsEmpty!30594 mapRes!30594))

(assert (= (and start!78672 res!617446) b!916131))

(assert (= (and b!916131 res!617448) b!916135))

(assert (= (and b!916135 res!617447) b!916132))

(assert (= (and b!916133 condMapEmpty!30594) mapIsEmpty!30594))

(assert (= (and b!916133 (not condMapEmpty!30594)) mapNonEmpty!30594))

(get-info :version)

(assert (= (and mapNonEmpty!30594 ((_ is ValueCellFull!9131) mapValue!30594)) b!916134))

(assert (= (and b!916133 ((_ is ValueCellFull!9131) mapDefault!30594)) b!916136))

(assert (= start!78672 b!916133))

(declare-fun m!850969 () Bool)

(assert (=> start!78672 m!850969))

(declare-fun m!850971 () Bool)

(assert (=> start!78672 m!850971))

(declare-fun m!850973 () Bool)

(assert (=> start!78672 m!850973))

(declare-fun m!850975 () Bool)

(assert (=> mapNonEmpty!30594 m!850975))

(declare-fun m!850977 () Bool)

(assert (=> b!916132 m!850977))

(declare-fun m!850979 () Bool)

(assert (=> b!916135 m!850979))

(check-sat (not start!78672) tp_is_empty!19225 (not b!916135) (not mapNonEmpty!30594) (not b!916132))
(check-sat)
