; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108566 () Bool)

(assert start!108566)

(declare-fun mapNonEmpty!51845 () Bool)

(declare-fun mapRes!51845 () Bool)

(declare-fun tp!98819 () Bool)

(declare-fun e!731380 () Bool)

(assert (=> mapNonEmpty!51845 (= mapRes!51845 (and tp!98819 e!731380))))

(declare-fun mapKey!51845 () (_ BitVec 32))

(declare-datatypes ((V!49809 0))(
  ( (V!49810 (val!16839 Int)) )
))
(declare-datatypes ((ValueCell!15866 0))(
  ( (ValueCellFull!15866 (v!19434 V!49809)) (EmptyCell!15866) )
))
(declare-fun mapRest!51845 () (Array (_ BitVec 32) ValueCell!15866))

(declare-datatypes ((array!84177 0))(
  ( (array!84178 (arr!40588 (Array (_ BitVec 32) ValueCell!15866)) (size!41139 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84177)

(declare-fun mapValue!51845 () ValueCell!15866)

(assert (=> mapNonEmpty!51845 (= (arr!40588 _values!1445) (store mapRest!51845 mapKey!51845 mapValue!51845))))

(declare-fun b!1280054 () Bool)

(declare-fun e!731379 () Bool)

(declare-fun tp_is_empty!33529 () Bool)

(assert (=> b!1280054 (= e!731379 tp_is_empty!33529)))

(declare-fun b!1280055 () Bool)

(assert (=> b!1280055 (= e!731380 tp_is_empty!33529)))

(declare-fun mapIsEmpty!51845 () Bool)

(assert (=> mapIsEmpty!51845 mapRes!51845))

(declare-fun b!1280056 () Bool)

(declare-fun res!850024 () Bool)

(declare-fun e!731382 () Bool)

(assert (=> b!1280056 (=> (not res!850024) (not e!731382))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84179 0))(
  ( (array!84180 (arr!40589 (Array (_ BitVec 32) (_ BitVec 64))) (size!41140 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84179)

(assert (=> b!1280056 (= res!850024 (and (= (size!41139 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41140 _keys!1741) (size!41139 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280057 () Bool)

(declare-fun res!850026 () Bool)

(assert (=> b!1280057 (=> (not res!850026) (not e!731382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84179 (_ BitVec 32)) Bool)

(assert (=> b!1280057 (= res!850026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280058 () Bool)

(assert (=> b!1280058 (= e!731382 false)))

(declare-fun lt!576408 () Bool)

(declare-datatypes ((List!28786 0))(
  ( (Nil!28783) (Cons!28782 (h!30000 (_ BitVec 64)) (t!42318 List!28786)) )
))
(declare-fun arrayNoDuplicates!0 (array!84179 (_ BitVec 32) List!28786) Bool)

(assert (=> b!1280058 (= lt!576408 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28783))))

(declare-fun res!850025 () Bool)

(assert (=> start!108566 (=> (not res!850025) (not e!731382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108566 (= res!850025 (validMask!0 mask!2175))))

(assert (=> start!108566 e!731382))

(assert (=> start!108566 true))

(declare-fun e!731378 () Bool)

(declare-fun array_inv!31017 (array!84177) Bool)

(assert (=> start!108566 (and (array_inv!31017 _values!1445) e!731378)))

(declare-fun array_inv!31018 (array!84179) Bool)

(assert (=> start!108566 (array_inv!31018 _keys!1741)))

(declare-fun b!1280059 () Bool)

(assert (=> b!1280059 (= e!731378 (and e!731379 mapRes!51845))))

(declare-fun condMapEmpty!51845 () Bool)

(declare-fun mapDefault!51845 () ValueCell!15866)

(assert (=> b!1280059 (= condMapEmpty!51845 (= (arr!40588 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15866)) mapDefault!51845)))))

(assert (= (and start!108566 res!850025) b!1280056))

(assert (= (and b!1280056 res!850024) b!1280057))

(assert (= (and b!1280057 res!850026) b!1280058))

(assert (= (and b!1280059 condMapEmpty!51845) mapIsEmpty!51845))

(assert (= (and b!1280059 (not condMapEmpty!51845)) mapNonEmpty!51845))

(get-info :version)

(assert (= (and mapNonEmpty!51845 ((_ is ValueCellFull!15866) mapValue!51845)) b!1280055))

(assert (= (and b!1280059 ((_ is ValueCellFull!15866) mapDefault!51845)) b!1280054))

(assert (= start!108566 b!1280059))

(declare-fun m!1175565 () Bool)

(assert (=> mapNonEmpty!51845 m!1175565))

(declare-fun m!1175567 () Bool)

(assert (=> b!1280057 m!1175567))

(declare-fun m!1175569 () Bool)

(assert (=> b!1280058 m!1175569))

(declare-fun m!1175571 () Bool)

(assert (=> start!108566 m!1175571))

(declare-fun m!1175573 () Bool)

(assert (=> start!108566 m!1175573))

(declare-fun m!1175575 () Bool)

(assert (=> start!108566 m!1175575))

(check-sat (not b!1280058) (not b!1280057) tp_is_empty!33529 (not start!108566) (not mapNonEmpty!51845))
(check-sat)
