; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81952 () Bool)

(assert start!81952)

(declare-fun mapIsEmpty!33448 () Bool)

(declare-fun mapRes!33448 () Bool)

(assert (=> mapIsEmpty!33448 mapRes!33448))

(declare-fun res!640156 () Bool)

(declare-fun e!538541 () Bool)

(assert (=> start!81952 (=> (not res!640156) (not e!538541))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81952 (= res!640156 (validMask!0 mask!1823))))

(assert (=> start!81952 e!538541))

(assert (=> start!81952 true))

(declare-datatypes ((V!32971 0))(
  ( (V!32972 (val!10546 Int)) )
))
(declare-datatypes ((ValueCell!10014 0))(
  ( (ValueCellFull!10014 (v!13101 V!32971)) (EmptyCell!10014) )
))
(declare-datatypes ((array!58083 0))(
  ( (array!58084 (arr!27921 (Array (_ BitVec 32) ValueCell!10014)) (size!28400 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58083)

(declare-fun e!538543 () Bool)

(declare-fun array_inv!21665 (array!58083) Bool)

(assert (=> start!81952 (and (array_inv!21665 _values!1197) e!538543)))

(declare-datatypes ((array!58085 0))(
  ( (array!58086 (arr!27922 (Array (_ BitVec 32) (_ BitVec 64))) (size!28401 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58085)

(declare-fun array_inv!21666 (array!58085) Bool)

(assert (=> start!81952 (array_inv!21666 _keys!1441)))

(declare-fun b!955951 () Bool)

(assert (=> b!955951 (= e!538541 false)))

(declare-fun lt!430064 () Bool)

(declare-datatypes ((List!19461 0))(
  ( (Nil!19458) (Cons!19457 (h!20619 (_ BitVec 64)) (t!27822 List!19461)) )
))
(declare-fun arrayNoDuplicates!0 (array!58085 (_ BitVec 32) List!19461) Bool)

(assert (=> b!955951 (= lt!430064 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19458))))

(declare-fun b!955952 () Bool)

(declare-fun res!640157 () Bool)

(assert (=> b!955952 (=> (not res!640157) (not e!538541))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955952 (= res!640157 (and (= (size!28400 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28401 _keys!1441) (size!28400 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955953 () Bool)

(declare-fun e!538539 () Bool)

(declare-fun tp_is_empty!20991 () Bool)

(assert (=> b!955953 (= e!538539 tp_is_empty!20991)))

(declare-fun b!955954 () Bool)

(declare-fun e!538542 () Bool)

(assert (=> b!955954 (= e!538542 tp_is_empty!20991)))

(declare-fun b!955955 () Bool)

(declare-fun res!640158 () Bool)

(assert (=> b!955955 (=> (not res!640158) (not e!538541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58085 (_ BitVec 32)) Bool)

(assert (=> b!955955 (= res!640158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955956 () Bool)

(assert (=> b!955956 (= e!538543 (and e!538542 mapRes!33448))))

(declare-fun condMapEmpty!33448 () Bool)

(declare-fun mapDefault!33448 () ValueCell!10014)

(assert (=> b!955956 (= condMapEmpty!33448 (= (arr!27921 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10014)) mapDefault!33448)))))

(declare-fun mapNonEmpty!33448 () Bool)

(declare-fun tp!64026 () Bool)

(assert (=> mapNonEmpty!33448 (= mapRes!33448 (and tp!64026 e!538539))))

(declare-fun mapKey!33448 () (_ BitVec 32))

(declare-fun mapRest!33448 () (Array (_ BitVec 32) ValueCell!10014))

(declare-fun mapValue!33448 () ValueCell!10014)

(assert (=> mapNonEmpty!33448 (= (arr!27921 _values!1197) (store mapRest!33448 mapKey!33448 mapValue!33448))))

(assert (= (and start!81952 res!640156) b!955952))

(assert (= (and b!955952 res!640157) b!955955))

(assert (= (and b!955955 res!640158) b!955951))

(assert (= (and b!955956 condMapEmpty!33448) mapIsEmpty!33448))

(assert (= (and b!955956 (not condMapEmpty!33448)) mapNonEmpty!33448))

(get-info :version)

(assert (= (and mapNonEmpty!33448 ((_ is ValueCellFull!10014) mapValue!33448)) b!955953))

(assert (= (and b!955956 ((_ is ValueCellFull!10014) mapDefault!33448)) b!955954))

(assert (= start!81952 b!955956))

(declare-fun m!887393 () Bool)

(assert (=> start!81952 m!887393))

(declare-fun m!887395 () Bool)

(assert (=> start!81952 m!887395))

(declare-fun m!887397 () Bool)

(assert (=> start!81952 m!887397))

(declare-fun m!887399 () Bool)

(assert (=> b!955951 m!887399))

(declare-fun m!887401 () Bool)

(assert (=> b!955955 m!887401))

(declare-fun m!887403 () Bool)

(assert (=> mapNonEmpty!33448 m!887403))

(check-sat (not start!81952) (not mapNonEmpty!33448) (not b!955955) tp_is_empty!20991 (not b!955951))
(check-sat)
