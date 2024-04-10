; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81994 () Bool)

(assert start!81994)

(declare-fun mapNonEmpty!33511 () Bool)

(declare-fun mapRes!33511 () Bool)

(declare-fun tp!64089 () Bool)

(declare-fun e!538857 () Bool)

(assert (=> mapNonEmpty!33511 (= mapRes!33511 (and tp!64089 e!538857))))

(declare-datatypes ((V!33027 0))(
  ( (V!33028 (val!10567 Int)) )
))
(declare-datatypes ((ValueCell!10035 0))(
  ( (ValueCellFull!10035 (v!13122 V!33027)) (EmptyCell!10035) )
))
(declare-fun mapRest!33511 () (Array (_ BitVec 32) ValueCell!10035))

(declare-fun mapKey!33511 () (_ BitVec 32))

(declare-datatypes ((array!58163 0))(
  ( (array!58164 (arr!27961 (Array (_ BitVec 32) ValueCell!10035)) (size!28440 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58163)

(declare-fun mapValue!33511 () ValueCell!10035)

(assert (=> mapNonEmpty!33511 (= (arr!27961 _values!1197) (store mapRest!33511 mapKey!33511 mapValue!33511))))

(declare-fun b!956329 () Bool)

(declare-fun e!538854 () Bool)

(assert (=> b!956329 (= e!538854 false)))

(declare-fun lt!430127 () Bool)

(declare-datatypes ((array!58165 0))(
  ( (array!58166 (arr!27962 (Array (_ BitVec 32) (_ BitVec 64))) (size!28441 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58165)

(declare-datatypes ((List!19477 0))(
  ( (Nil!19474) (Cons!19473 (h!20635 (_ BitVec 64)) (t!27838 List!19477)) )
))
(declare-fun arrayNoDuplicates!0 (array!58165 (_ BitVec 32) List!19477) Bool)

(assert (=> b!956329 (= lt!430127 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19474))))

(declare-fun res!640345 () Bool)

(assert (=> start!81994 (=> (not res!640345) (not e!538854))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81994 (= res!640345 (validMask!0 mask!1823))))

(assert (=> start!81994 e!538854))

(assert (=> start!81994 true))

(declare-fun e!538858 () Bool)

(declare-fun array_inv!21697 (array!58163) Bool)

(assert (=> start!81994 (and (array_inv!21697 _values!1197) e!538858)))

(declare-fun array_inv!21698 (array!58165) Bool)

(assert (=> start!81994 (array_inv!21698 _keys!1441)))

(declare-fun b!956330 () Bool)

(declare-fun tp_is_empty!21033 () Bool)

(assert (=> b!956330 (= e!538857 tp_is_empty!21033)))

(declare-fun b!956331 () Bool)

(declare-fun e!538856 () Bool)

(assert (=> b!956331 (= e!538856 tp_is_empty!21033)))

(declare-fun b!956332 () Bool)

(declare-fun res!640347 () Bool)

(assert (=> b!956332 (=> (not res!640347) (not e!538854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58165 (_ BitVec 32)) Bool)

(assert (=> b!956332 (= res!640347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956333 () Bool)

(declare-fun res!640346 () Bool)

(assert (=> b!956333 (=> (not res!640346) (not e!538854))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956333 (= res!640346 (and (= (size!28440 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28441 _keys!1441) (size!28440 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956334 () Bool)

(assert (=> b!956334 (= e!538858 (and e!538856 mapRes!33511))))

(declare-fun condMapEmpty!33511 () Bool)

(declare-fun mapDefault!33511 () ValueCell!10035)

(assert (=> b!956334 (= condMapEmpty!33511 (= (arr!27961 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10035)) mapDefault!33511)))))

(declare-fun mapIsEmpty!33511 () Bool)

(assert (=> mapIsEmpty!33511 mapRes!33511))

(assert (= (and start!81994 res!640345) b!956333))

(assert (= (and b!956333 res!640346) b!956332))

(assert (= (and b!956332 res!640347) b!956329))

(assert (= (and b!956334 condMapEmpty!33511) mapIsEmpty!33511))

(assert (= (and b!956334 (not condMapEmpty!33511)) mapNonEmpty!33511))

(get-info :version)

(assert (= (and mapNonEmpty!33511 ((_ is ValueCellFull!10035) mapValue!33511)) b!956330))

(assert (= (and b!956334 ((_ is ValueCellFull!10035) mapDefault!33511)) b!956331))

(assert (= start!81994 b!956334))

(declare-fun m!887645 () Bool)

(assert (=> mapNonEmpty!33511 m!887645))

(declare-fun m!887647 () Bool)

(assert (=> b!956329 m!887647))

(declare-fun m!887649 () Bool)

(assert (=> start!81994 m!887649))

(declare-fun m!887651 () Bool)

(assert (=> start!81994 m!887651))

(declare-fun m!887653 () Bool)

(assert (=> start!81994 m!887653))

(declare-fun m!887655 () Bool)

(assert (=> b!956332 m!887655))

(check-sat (not start!81994) tp_is_empty!21033 (not b!956332) (not mapNonEmpty!33511) (not b!956329))
(check-sat)
