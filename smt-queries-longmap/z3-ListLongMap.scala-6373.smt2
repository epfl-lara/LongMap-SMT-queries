; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81956 () Bool)

(assert start!81956)

(declare-fun b!955910 () Bool)

(declare-fun e!538559 () Bool)

(declare-fun tp_is_empty!21013 () Bool)

(assert (=> b!955910 (= e!538559 tp_is_empty!21013)))

(declare-fun b!955911 () Bool)

(declare-fun e!538557 () Bool)

(assert (=> b!955911 (= e!538557 false)))

(declare-fun lt!429861 () Bool)

(declare-datatypes ((array!58074 0))(
  ( (array!58075 (arr!27917 (Array (_ BitVec 32) (_ BitVec 64))) (size!28398 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58074)

(declare-datatypes ((List!19481 0))(
  ( (Nil!19478) (Cons!19477 (h!20639 (_ BitVec 64)) (t!27833 List!19481)) )
))
(declare-fun arrayNoDuplicates!0 (array!58074 (_ BitVec 32) List!19481) Bool)

(assert (=> b!955911 (= lt!429861 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19478))))

(declare-fun b!955912 () Bool)

(declare-fun e!538558 () Bool)

(assert (=> b!955912 (= e!538558 tp_is_empty!21013)))

(declare-fun mapNonEmpty!33481 () Bool)

(declare-fun mapRes!33481 () Bool)

(declare-fun tp!64060 () Bool)

(assert (=> mapNonEmpty!33481 (= mapRes!33481 (and tp!64060 e!538558))))

(declare-datatypes ((V!33001 0))(
  ( (V!33002 (val!10557 Int)) )
))
(declare-datatypes ((ValueCell!10025 0))(
  ( (ValueCellFull!10025 (v!13111 V!33001)) (EmptyCell!10025) )
))
(declare-fun mapRest!33481 () (Array (_ BitVec 32) ValueCell!10025))

(declare-fun mapValue!33481 () ValueCell!10025)

(declare-datatypes ((array!58076 0))(
  ( (array!58077 (arr!27918 (Array (_ BitVec 32) ValueCell!10025)) (size!28399 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58076)

(declare-fun mapKey!33481 () (_ BitVec 32))

(assert (=> mapNonEmpty!33481 (= (arr!27918 _values!1197) (store mapRest!33481 mapKey!33481 mapValue!33481))))

(declare-fun b!955913 () Bool)

(declare-fun res!640146 () Bool)

(assert (=> b!955913 (=> (not res!640146) (not e!538557))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58074 (_ BitVec 32)) Bool)

(assert (=> b!955913 (= res!640146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33481 () Bool)

(assert (=> mapIsEmpty!33481 mapRes!33481))

(declare-fun res!640145 () Bool)

(assert (=> start!81956 (=> (not res!640145) (not e!538557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81956 (= res!640145 (validMask!0 mask!1823))))

(assert (=> start!81956 e!538557))

(assert (=> start!81956 true))

(declare-fun e!538556 () Bool)

(declare-fun array_inv!21725 (array!58076) Bool)

(assert (=> start!81956 (and (array_inv!21725 _values!1197) e!538556)))

(declare-fun array_inv!21726 (array!58074) Bool)

(assert (=> start!81956 (array_inv!21726 _keys!1441)))

(declare-fun b!955914 () Bool)

(declare-fun res!640147 () Bool)

(assert (=> b!955914 (=> (not res!640147) (not e!538557))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955914 (= res!640147 (and (= (size!28399 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28398 _keys!1441) (size!28399 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955915 () Bool)

(assert (=> b!955915 (= e!538556 (and e!538559 mapRes!33481))))

(declare-fun condMapEmpty!33481 () Bool)

(declare-fun mapDefault!33481 () ValueCell!10025)

(assert (=> b!955915 (= condMapEmpty!33481 (= (arr!27918 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10025)) mapDefault!33481)))))

(assert (= (and start!81956 res!640145) b!955914))

(assert (= (and b!955914 res!640147) b!955913))

(assert (= (and b!955913 res!640146) b!955911))

(assert (= (and b!955915 condMapEmpty!33481) mapIsEmpty!33481))

(assert (= (and b!955915 (not condMapEmpty!33481)) mapNonEmpty!33481))

(get-info :version)

(assert (= (and mapNonEmpty!33481 ((_ is ValueCellFull!10025) mapValue!33481)) b!955912))

(assert (= (and b!955915 ((_ is ValueCellFull!10025) mapDefault!33481)) b!955910))

(assert (= start!81956 b!955915))

(declare-fun m!886767 () Bool)

(assert (=> b!955911 m!886767))

(declare-fun m!886769 () Bool)

(assert (=> mapNonEmpty!33481 m!886769))

(declare-fun m!886771 () Bool)

(assert (=> b!955913 m!886771))

(declare-fun m!886773 () Bool)

(assert (=> start!81956 m!886773))

(declare-fun m!886775 () Bool)

(assert (=> start!81956 m!886775))

(declare-fun m!886777 () Bool)

(assert (=> start!81956 m!886777))

(check-sat (not b!955913) (not mapNonEmpty!33481) (not start!81956) tp_is_empty!21013 (not b!955911))
(check-sat)
