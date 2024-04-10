; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81970 () Bool)

(assert start!81970)

(declare-fun res!640239 () Bool)

(declare-fun e!538675 () Bool)

(assert (=> start!81970 (=> (not res!640239) (not e!538675))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81970 (= res!640239 (validMask!0 mask!1823))))

(assert (=> start!81970 e!538675))

(assert (=> start!81970 true))

(declare-datatypes ((V!32995 0))(
  ( (V!32996 (val!10555 Int)) )
))
(declare-datatypes ((ValueCell!10023 0))(
  ( (ValueCellFull!10023 (v!13110 V!32995)) (EmptyCell!10023) )
))
(declare-datatypes ((array!58117 0))(
  ( (array!58118 (arr!27938 (Array (_ BitVec 32) ValueCell!10023)) (size!28417 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58117)

(declare-fun e!538676 () Bool)

(declare-fun array_inv!21681 (array!58117) Bool)

(assert (=> start!81970 (and (array_inv!21681 _values!1197) e!538676)))

(declare-datatypes ((array!58119 0))(
  ( (array!58120 (arr!27939 (Array (_ BitVec 32) (_ BitVec 64))) (size!28418 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58119)

(declare-fun array_inv!21682 (array!58119) Bool)

(assert (=> start!81970 (array_inv!21682 _keys!1441)))

(declare-fun b!956113 () Bool)

(declare-fun e!538674 () Bool)

(declare-fun mapRes!33475 () Bool)

(assert (=> b!956113 (= e!538676 (and e!538674 mapRes!33475))))

(declare-fun condMapEmpty!33475 () Bool)

(declare-fun mapDefault!33475 () ValueCell!10023)

(assert (=> b!956113 (= condMapEmpty!33475 (= (arr!27938 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10023)) mapDefault!33475)))))

(declare-fun b!956114 () Bool)

(declare-fun res!640237 () Bool)

(assert (=> b!956114 (=> (not res!640237) (not e!538675))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956114 (= res!640237 (and (= (size!28417 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28418 _keys!1441) (size!28417 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33475 () Bool)

(assert (=> mapIsEmpty!33475 mapRes!33475))

(declare-fun b!956115 () Bool)

(declare-fun tp_is_empty!21009 () Bool)

(assert (=> b!956115 (= e!538674 tp_is_empty!21009)))

(declare-fun b!956116 () Bool)

(assert (=> b!956116 (= e!538675 false)))

(declare-fun lt!430091 () Bool)

(declare-datatypes ((List!19468 0))(
  ( (Nil!19465) (Cons!19464 (h!20626 (_ BitVec 64)) (t!27829 List!19468)) )
))
(declare-fun arrayNoDuplicates!0 (array!58119 (_ BitVec 32) List!19468) Bool)

(assert (=> b!956116 (= lt!430091 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19465))))

(declare-fun mapNonEmpty!33475 () Bool)

(declare-fun tp!64053 () Bool)

(declare-fun e!538677 () Bool)

(assert (=> mapNonEmpty!33475 (= mapRes!33475 (and tp!64053 e!538677))))

(declare-fun mapKey!33475 () (_ BitVec 32))

(declare-fun mapValue!33475 () ValueCell!10023)

(declare-fun mapRest!33475 () (Array (_ BitVec 32) ValueCell!10023))

(assert (=> mapNonEmpty!33475 (= (arr!27938 _values!1197) (store mapRest!33475 mapKey!33475 mapValue!33475))))

(declare-fun b!956117 () Bool)

(declare-fun res!640238 () Bool)

(assert (=> b!956117 (=> (not res!640238) (not e!538675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58119 (_ BitVec 32)) Bool)

(assert (=> b!956117 (= res!640238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956118 () Bool)

(assert (=> b!956118 (= e!538677 tp_is_empty!21009)))

(assert (= (and start!81970 res!640239) b!956114))

(assert (= (and b!956114 res!640237) b!956117))

(assert (= (and b!956117 res!640238) b!956116))

(assert (= (and b!956113 condMapEmpty!33475) mapIsEmpty!33475))

(assert (= (and b!956113 (not condMapEmpty!33475)) mapNonEmpty!33475))

(get-info :version)

(assert (= (and mapNonEmpty!33475 ((_ is ValueCellFull!10023) mapValue!33475)) b!956118))

(assert (= (and b!956113 ((_ is ValueCellFull!10023) mapDefault!33475)) b!956115))

(assert (= start!81970 b!956113))

(declare-fun m!887501 () Bool)

(assert (=> start!81970 m!887501))

(declare-fun m!887503 () Bool)

(assert (=> start!81970 m!887503))

(declare-fun m!887505 () Bool)

(assert (=> start!81970 m!887505))

(declare-fun m!887507 () Bool)

(assert (=> b!956116 m!887507))

(declare-fun m!887509 () Bool)

(assert (=> mapNonEmpty!33475 m!887509))

(declare-fun m!887511 () Bool)

(assert (=> b!956117 m!887511))

(check-sat (not mapNonEmpty!33475) (not start!81970) tp_is_empty!21009 (not b!956117) (not b!956116))
(check-sat)
