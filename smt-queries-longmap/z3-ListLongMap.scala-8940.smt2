; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108590 () Bool)

(assert start!108590)

(declare-fun b!1280272 () Bool)

(declare-fun e!731562 () Bool)

(declare-fun e!731558 () Bool)

(declare-fun mapRes!51881 () Bool)

(assert (=> b!1280272 (= e!731562 (and e!731558 mapRes!51881))))

(declare-fun condMapEmpty!51881 () Bool)

(declare-datatypes ((V!49841 0))(
  ( (V!49842 (val!16851 Int)) )
))
(declare-datatypes ((ValueCell!15878 0))(
  ( (ValueCellFull!15878 (v!19446 V!49841)) (EmptyCell!15878) )
))
(declare-datatypes ((array!84223 0))(
  ( (array!84224 (arr!40611 (Array (_ BitVec 32) ValueCell!15878)) (size!41162 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84223)

(declare-fun mapDefault!51881 () ValueCell!15878)

(assert (=> b!1280272 (= condMapEmpty!51881 (= (arr!40611 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15878)) mapDefault!51881)))))

(declare-fun b!1280273 () Bool)

(declare-fun res!850135 () Bool)

(declare-fun e!731561 () Bool)

(assert (=> b!1280273 (=> (not res!850135) (not e!731561))))

(declare-datatypes ((array!84225 0))(
  ( (array!84226 (arr!40612 (Array (_ BitVec 32) (_ BitVec 64))) (size!41163 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84225)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84225 (_ BitVec 32)) Bool)

(assert (=> b!1280273 (= res!850135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280274 () Bool)

(declare-fun res!850137 () Bool)

(assert (=> b!1280274 (=> (not res!850137) (not e!731561))))

(declare-datatypes ((List!28795 0))(
  ( (Nil!28792) (Cons!28791 (h!30009 (_ BitVec 64)) (t!42327 List!28795)) )
))
(declare-fun arrayNoDuplicates!0 (array!84225 (_ BitVec 32) List!28795) Bool)

(assert (=> b!1280274 (= res!850137 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28792))))

(declare-fun b!1280275 () Bool)

(declare-fun res!850134 () Bool)

(assert (=> b!1280275 (=> (not res!850134) (not e!731561))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280275 (= res!850134 (and (= (size!41162 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41163 _keys!1741) (size!41162 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280276 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280276 (= e!731561 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41163 _keys!1741)) (bvsgt from!2144 (size!41163 _keys!1741))))))

(declare-fun b!1280277 () Bool)

(declare-fun e!731559 () Bool)

(declare-fun tp_is_empty!33553 () Bool)

(assert (=> b!1280277 (= e!731559 tp_is_empty!33553)))

(declare-fun res!850136 () Bool)

(assert (=> start!108590 (=> (not res!850136) (not e!731561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108590 (= res!850136 (validMask!0 mask!2175))))

(assert (=> start!108590 e!731561))

(assert (=> start!108590 true))

(declare-fun array_inv!31031 (array!84223) Bool)

(assert (=> start!108590 (and (array_inv!31031 _values!1445) e!731562)))

(declare-fun array_inv!31032 (array!84225) Bool)

(assert (=> start!108590 (array_inv!31032 _keys!1741)))

(declare-fun mapNonEmpty!51881 () Bool)

(declare-fun tp!98855 () Bool)

(assert (=> mapNonEmpty!51881 (= mapRes!51881 (and tp!98855 e!731559))))

(declare-fun mapRest!51881 () (Array (_ BitVec 32) ValueCell!15878))

(declare-fun mapKey!51881 () (_ BitVec 32))

(declare-fun mapValue!51881 () ValueCell!15878)

(assert (=> mapNonEmpty!51881 (= (arr!40611 _values!1445) (store mapRest!51881 mapKey!51881 mapValue!51881))))

(declare-fun mapIsEmpty!51881 () Bool)

(assert (=> mapIsEmpty!51881 mapRes!51881))

(declare-fun b!1280278 () Bool)

(assert (=> b!1280278 (= e!731558 tp_is_empty!33553)))

(assert (= (and start!108590 res!850136) b!1280275))

(assert (= (and b!1280275 res!850134) b!1280273))

(assert (= (and b!1280273 res!850135) b!1280274))

(assert (= (and b!1280274 res!850137) b!1280276))

(assert (= (and b!1280272 condMapEmpty!51881) mapIsEmpty!51881))

(assert (= (and b!1280272 (not condMapEmpty!51881)) mapNonEmpty!51881))

(get-info :version)

(assert (= (and mapNonEmpty!51881 ((_ is ValueCellFull!15878) mapValue!51881)) b!1280277))

(assert (= (and b!1280272 ((_ is ValueCellFull!15878) mapDefault!51881)) b!1280278))

(assert (= start!108590 b!1280272))

(declare-fun m!1175709 () Bool)

(assert (=> b!1280273 m!1175709))

(declare-fun m!1175711 () Bool)

(assert (=> b!1280274 m!1175711))

(declare-fun m!1175713 () Bool)

(assert (=> start!108590 m!1175713))

(declare-fun m!1175715 () Bool)

(assert (=> start!108590 m!1175715))

(declare-fun m!1175717 () Bool)

(assert (=> start!108590 m!1175717))

(declare-fun m!1175719 () Bool)

(assert (=> mapNonEmpty!51881 m!1175719))

(check-sat (not start!108590) (not b!1280274) (not b!1280273) tp_is_empty!33553 (not mapNonEmpty!51881))
(check-sat)
