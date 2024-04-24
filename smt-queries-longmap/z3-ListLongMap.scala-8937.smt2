; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108572 () Bool)

(assert start!108572)

(declare-fun b!1280108 () Bool)

(declare-fun e!731427 () Bool)

(declare-fun tp_is_empty!33535 () Bool)

(assert (=> b!1280108 (= e!731427 tp_is_empty!33535)))

(declare-fun b!1280109 () Bool)

(declare-fun res!850051 () Bool)

(declare-fun e!731423 () Bool)

(assert (=> b!1280109 (=> (not res!850051) (not e!731423))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49817 0))(
  ( (V!49818 (val!16842 Int)) )
))
(declare-datatypes ((ValueCell!15869 0))(
  ( (ValueCellFull!15869 (v!19437 V!49817)) (EmptyCell!15869) )
))
(declare-datatypes ((array!84189 0))(
  ( (array!84190 (arr!40594 (Array (_ BitVec 32) ValueCell!15869)) (size!41145 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84189)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84191 0))(
  ( (array!84192 (arr!40595 (Array (_ BitVec 32) (_ BitVec 64))) (size!41146 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84191)

(assert (=> b!1280109 (= res!850051 (and (= (size!41145 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41146 _keys!1741) (size!41145 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!850053 () Bool)

(assert (=> start!108572 (=> (not res!850053) (not e!731423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108572 (= res!850053 (validMask!0 mask!2175))))

(assert (=> start!108572 e!731423))

(assert (=> start!108572 true))

(declare-fun e!731426 () Bool)

(declare-fun array_inv!31019 (array!84189) Bool)

(assert (=> start!108572 (and (array_inv!31019 _values!1445) e!731426)))

(declare-fun array_inv!31020 (array!84191) Bool)

(assert (=> start!108572 (array_inv!31020 _keys!1741)))

(declare-fun b!1280110 () Bool)

(declare-fun res!850052 () Bool)

(assert (=> b!1280110 (=> (not res!850052) (not e!731423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84191 (_ BitVec 32)) Bool)

(assert (=> b!1280110 (= res!850052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280111 () Bool)

(declare-fun e!731425 () Bool)

(declare-fun mapRes!51854 () Bool)

(assert (=> b!1280111 (= e!731426 (and e!731425 mapRes!51854))))

(declare-fun condMapEmpty!51854 () Bool)

(declare-fun mapDefault!51854 () ValueCell!15869)

(assert (=> b!1280111 (= condMapEmpty!51854 (= (arr!40594 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15869)) mapDefault!51854)))))

(declare-fun b!1280112 () Bool)

(assert (=> b!1280112 (= e!731423 false)))

(declare-fun lt!576417 () Bool)

(declare-datatypes ((List!28788 0))(
  ( (Nil!28785) (Cons!28784 (h!30002 (_ BitVec 64)) (t!42320 List!28788)) )
))
(declare-fun arrayNoDuplicates!0 (array!84191 (_ BitVec 32) List!28788) Bool)

(assert (=> b!1280112 (= lt!576417 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28785))))

(declare-fun mapIsEmpty!51854 () Bool)

(assert (=> mapIsEmpty!51854 mapRes!51854))

(declare-fun b!1280113 () Bool)

(assert (=> b!1280113 (= e!731425 tp_is_empty!33535)))

(declare-fun mapNonEmpty!51854 () Bool)

(declare-fun tp!98828 () Bool)

(assert (=> mapNonEmpty!51854 (= mapRes!51854 (and tp!98828 e!731427))))

(declare-fun mapValue!51854 () ValueCell!15869)

(declare-fun mapKey!51854 () (_ BitVec 32))

(declare-fun mapRest!51854 () (Array (_ BitVec 32) ValueCell!15869))

(assert (=> mapNonEmpty!51854 (= (arr!40594 _values!1445) (store mapRest!51854 mapKey!51854 mapValue!51854))))

(assert (= (and start!108572 res!850053) b!1280109))

(assert (= (and b!1280109 res!850051) b!1280110))

(assert (= (and b!1280110 res!850052) b!1280112))

(assert (= (and b!1280111 condMapEmpty!51854) mapIsEmpty!51854))

(assert (= (and b!1280111 (not condMapEmpty!51854)) mapNonEmpty!51854))

(get-info :version)

(assert (= (and mapNonEmpty!51854 ((_ is ValueCellFull!15869) mapValue!51854)) b!1280108))

(assert (= (and b!1280111 ((_ is ValueCellFull!15869) mapDefault!51854)) b!1280113))

(assert (= start!108572 b!1280111))

(declare-fun m!1175601 () Bool)

(assert (=> start!108572 m!1175601))

(declare-fun m!1175603 () Bool)

(assert (=> start!108572 m!1175603))

(declare-fun m!1175605 () Bool)

(assert (=> start!108572 m!1175605))

(declare-fun m!1175607 () Bool)

(assert (=> b!1280110 m!1175607))

(declare-fun m!1175609 () Bool)

(assert (=> b!1280112 m!1175609))

(declare-fun m!1175611 () Bool)

(assert (=> mapNonEmpty!51854 m!1175611))

(check-sat (not mapNonEmpty!51854) (not b!1280110) (not b!1280112) (not start!108572) tp_is_empty!33535)
(check-sat)
