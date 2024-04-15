; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82492 () Bool)

(assert start!82492)

(declare-fun b!961329 () Bool)

(declare-fun e!542062 () Bool)

(declare-fun tp_is_empty!21445 () Bool)

(assert (=> b!961329 (= e!542062 tp_is_empty!21445)))

(declare-fun b!961330 () Bool)

(declare-fun e!542061 () Bool)

(assert (=> b!961330 (= e!542061 tp_is_empty!21445)))

(declare-fun b!961331 () Bool)

(declare-fun e!542060 () Bool)

(assert (=> b!961331 (= e!542060 false)))

(declare-fun lt!430541 () Bool)

(declare-datatypes ((array!58920 0))(
  ( (array!58921 (arr!28329 (Array (_ BitVec 32) (_ BitVec 64))) (size!28810 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58920)

(declare-datatypes ((List!19707 0))(
  ( (Nil!19704) (Cons!19703 (h!20865 (_ BitVec 64)) (t!28061 List!19707)) )
))
(declare-fun arrayNoDuplicates!0 (array!58920 (_ BitVec 32) List!19707) Bool)

(assert (=> b!961331 (= lt!430541 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19704))))

(declare-fun mapNonEmpty!34162 () Bool)

(declare-fun mapRes!34162 () Bool)

(declare-fun tp!65092 () Bool)

(assert (=> mapNonEmpty!34162 (= mapRes!34162 (and tp!65092 e!542062))))

(declare-datatypes ((V!33577 0))(
  ( (V!33578 (val!10773 Int)) )
))
(declare-datatypes ((ValueCell!10241 0))(
  ( (ValueCellFull!10241 (v!13330 V!33577)) (EmptyCell!10241) )
))
(declare-fun mapValue!34162 () ValueCell!10241)

(declare-datatypes ((array!58922 0))(
  ( (array!58923 (arr!28330 (Array (_ BitVec 32) ValueCell!10241)) (size!28811 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58922)

(declare-fun mapKey!34162 () (_ BitVec 32))

(declare-fun mapRest!34162 () (Array (_ BitVec 32) ValueCell!10241))

(assert (=> mapNonEmpty!34162 (= (arr!28330 _values!1400) (store mapRest!34162 mapKey!34162 mapValue!34162))))

(declare-fun res!643429 () Bool)

(assert (=> start!82492 (=> (not res!643429) (not e!542060))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82492 (= res!643429 (validMask!0 mask!2110))))

(assert (=> start!82492 e!542060))

(assert (=> start!82492 true))

(declare-fun e!542058 () Bool)

(declare-fun array_inv!22005 (array!58922) Bool)

(assert (=> start!82492 (and (array_inv!22005 _values!1400) e!542058)))

(declare-fun array_inv!22006 (array!58920) Bool)

(assert (=> start!82492 (array_inv!22006 _keys!1686)))

(declare-fun b!961332 () Bool)

(assert (=> b!961332 (= e!542058 (and e!542061 mapRes!34162))))

(declare-fun condMapEmpty!34162 () Bool)

(declare-fun mapDefault!34162 () ValueCell!10241)

(assert (=> b!961332 (= condMapEmpty!34162 (= (arr!28330 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10241)) mapDefault!34162)))))

(declare-fun mapIsEmpty!34162 () Bool)

(assert (=> mapIsEmpty!34162 mapRes!34162))

(declare-fun b!961333 () Bool)

(declare-fun res!643430 () Bool)

(assert (=> b!961333 (=> (not res!643430) (not e!542060))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961333 (= res!643430 (and (= (size!28811 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28810 _keys!1686) (size!28811 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961334 () Bool)

(declare-fun res!643428 () Bool)

(assert (=> b!961334 (=> (not res!643428) (not e!542060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58920 (_ BitVec 32)) Bool)

(assert (=> b!961334 (= res!643428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82492 res!643429) b!961333))

(assert (= (and b!961333 res!643430) b!961334))

(assert (= (and b!961334 res!643428) b!961331))

(assert (= (and b!961332 condMapEmpty!34162) mapIsEmpty!34162))

(assert (= (and b!961332 (not condMapEmpty!34162)) mapNonEmpty!34162))

(get-info :version)

(assert (= (and mapNonEmpty!34162 ((_ is ValueCellFull!10241) mapValue!34162)) b!961329))

(assert (= (and b!961332 ((_ is ValueCellFull!10241) mapDefault!34162)) b!961330))

(assert (= start!82492 b!961332))

(declare-fun m!890719 () Bool)

(assert (=> b!961331 m!890719))

(declare-fun m!890721 () Bool)

(assert (=> mapNonEmpty!34162 m!890721))

(declare-fun m!890723 () Bool)

(assert (=> start!82492 m!890723))

(declare-fun m!890725 () Bool)

(assert (=> start!82492 m!890725))

(declare-fun m!890727 () Bool)

(assert (=> start!82492 m!890727))

(declare-fun m!890729 () Bool)

(assert (=> b!961334 m!890729))

(check-sat (not mapNonEmpty!34162) (not b!961334) (not start!82492) (not b!961331) tp_is_empty!21445)
(check-sat)
