; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81964 () Bool)

(assert start!81964)

(declare-fun b!956059 () Bool)

(declare-fun e!538633 () Bool)

(assert (=> b!956059 (= e!538633 false)))

(declare-fun lt!430082 () Bool)

(declare-datatypes ((array!58105 0))(
  ( (array!58106 (arr!27932 (Array (_ BitVec 32) (_ BitVec 64))) (size!28411 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58105)

(declare-datatypes ((List!19465 0))(
  ( (Nil!19462) (Cons!19461 (h!20623 (_ BitVec 64)) (t!27826 List!19465)) )
))
(declare-fun arrayNoDuplicates!0 (array!58105 (_ BitVec 32) List!19465) Bool)

(assert (=> b!956059 (= lt!430082 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19462))))

(declare-fun b!956060 () Bool)

(declare-fun res!640212 () Bool)

(assert (=> b!956060 (=> (not res!640212) (not e!538633))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-datatypes ((V!32987 0))(
  ( (V!32988 (val!10552 Int)) )
))
(declare-datatypes ((ValueCell!10020 0))(
  ( (ValueCellFull!10020 (v!13107 V!32987)) (EmptyCell!10020) )
))
(declare-datatypes ((array!58107 0))(
  ( (array!58108 (arr!27933 (Array (_ BitVec 32) ValueCell!10020)) (size!28412 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58107)

(assert (=> b!956060 (= res!640212 (and (= (size!28412 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28411 _keys!1441) (size!28412 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956061 () Bool)

(declare-fun res!640211 () Bool)

(assert (=> b!956061 (=> (not res!640211) (not e!538633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58105 (_ BitVec 32)) Bool)

(assert (=> b!956061 (= res!640211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33466 () Bool)

(declare-fun mapRes!33466 () Bool)

(assert (=> mapIsEmpty!33466 mapRes!33466))

(declare-fun res!640210 () Bool)

(assert (=> start!81964 (=> (not res!640210) (not e!538633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81964 (= res!640210 (validMask!0 mask!1823))))

(assert (=> start!81964 e!538633))

(assert (=> start!81964 true))

(declare-fun e!538632 () Bool)

(declare-fun array_inv!21675 (array!58107) Bool)

(assert (=> start!81964 (and (array_inv!21675 _values!1197) e!538632)))

(declare-fun array_inv!21676 (array!58105) Bool)

(assert (=> start!81964 (array_inv!21676 _keys!1441)))

(declare-fun b!956062 () Bool)

(declare-fun e!538629 () Bool)

(declare-fun tp_is_empty!21003 () Bool)

(assert (=> b!956062 (= e!538629 tp_is_empty!21003)))

(declare-fun b!956063 () Bool)

(declare-fun e!538631 () Bool)

(assert (=> b!956063 (= e!538631 tp_is_empty!21003)))

(declare-fun mapNonEmpty!33466 () Bool)

(declare-fun tp!64044 () Bool)

(assert (=> mapNonEmpty!33466 (= mapRes!33466 (and tp!64044 e!538631))))

(declare-fun mapRest!33466 () (Array (_ BitVec 32) ValueCell!10020))

(declare-fun mapValue!33466 () ValueCell!10020)

(declare-fun mapKey!33466 () (_ BitVec 32))

(assert (=> mapNonEmpty!33466 (= (arr!27933 _values!1197) (store mapRest!33466 mapKey!33466 mapValue!33466))))

(declare-fun b!956064 () Bool)

(assert (=> b!956064 (= e!538632 (and e!538629 mapRes!33466))))

(declare-fun condMapEmpty!33466 () Bool)

(declare-fun mapDefault!33466 () ValueCell!10020)

(assert (=> b!956064 (= condMapEmpty!33466 (= (arr!27933 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10020)) mapDefault!33466)))))

(assert (= (and start!81964 res!640210) b!956060))

(assert (= (and b!956060 res!640212) b!956061))

(assert (= (and b!956061 res!640211) b!956059))

(assert (= (and b!956064 condMapEmpty!33466) mapIsEmpty!33466))

(assert (= (and b!956064 (not condMapEmpty!33466)) mapNonEmpty!33466))

(get-info :version)

(assert (= (and mapNonEmpty!33466 ((_ is ValueCellFull!10020) mapValue!33466)) b!956063))

(assert (= (and b!956064 ((_ is ValueCellFull!10020) mapDefault!33466)) b!956062))

(assert (= start!81964 b!956064))

(declare-fun m!887465 () Bool)

(assert (=> b!956059 m!887465))

(declare-fun m!887467 () Bool)

(assert (=> b!956061 m!887467))

(declare-fun m!887469 () Bool)

(assert (=> start!81964 m!887469))

(declare-fun m!887471 () Bool)

(assert (=> start!81964 m!887471))

(declare-fun m!887473 () Bool)

(assert (=> start!81964 m!887473))

(declare-fun m!887475 () Bool)

(assert (=> mapNonEmpty!33466 m!887475))

(check-sat (not mapNonEmpty!33466) (not b!956061) tp_is_empty!21003 (not b!956059) (not start!81964))
(check-sat)
