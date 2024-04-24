; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108662 () Bool)

(assert start!108662)

(declare-fun b_free!27985 () Bool)

(declare-fun b_next!27985 () Bool)

(assert (=> start!108662 (= b_free!27985 (not b_next!27985))))

(declare-fun tp!99065 () Bool)

(declare-fun b_and!46047 () Bool)

(assert (=> start!108662 (= tp!99065 b_and!46047)))

(declare-fun b!1281138 () Bool)

(declare-fun e!732102 () Bool)

(declare-fun e!732099 () Bool)

(declare-fun mapRes!51989 () Bool)

(assert (=> b!1281138 (= e!732102 (and e!732099 mapRes!51989))))

(declare-fun condMapEmpty!51989 () Bool)

(declare-datatypes ((V!49937 0))(
  ( (V!49938 (val!16887 Int)) )
))
(declare-datatypes ((ValueCell!15914 0))(
  ( (ValueCellFull!15914 (v!19482 V!49937)) (EmptyCell!15914) )
))
(declare-datatypes ((array!84359 0))(
  ( (array!84360 (arr!40679 (Array (_ BitVec 32) ValueCell!15914)) (size!41230 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84359)

(declare-fun mapDefault!51989 () ValueCell!15914)

(assert (=> b!1281138 (= condMapEmpty!51989 (= (arr!40679 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15914)) mapDefault!51989)))))

(declare-fun b!1281139 () Bool)

(declare-fun tp_is_empty!33625 () Bool)

(assert (=> b!1281139 (= e!732099 tp_is_empty!33625)))

(declare-fun res!850680 () Bool)

(declare-fun e!732098 () Bool)

(assert (=> start!108662 (=> (not res!850680) (not e!732098))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108662 (= res!850680 (validMask!0 mask!2175))))

(assert (=> start!108662 e!732098))

(assert (=> start!108662 tp_is_empty!33625))

(assert (=> start!108662 true))

(declare-fun array_inv!31077 (array!84359) Bool)

(assert (=> start!108662 (and (array_inv!31077 _values!1445) e!732102)))

(declare-datatypes ((array!84361 0))(
  ( (array!84362 (arr!40680 (Array (_ BitVec 32) (_ BitVec 64))) (size!41231 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84361)

(declare-fun array_inv!31078 (array!84361) Bool)

(assert (=> start!108662 (array_inv!31078 _keys!1741)))

(assert (=> start!108662 tp!99065))

(declare-fun mapIsEmpty!51989 () Bool)

(assert (=> mapIsEmpty!51989 mapRes!51989))

(declare-fun b!1281140 () Bool)

(declare-fun res!850679 () Bool)

(assert (=> b!1281140 (=> (not res!850679) (not e!732098))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281140 (= res!850679 (and (= (size!41230 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41231 _keys!1741) (size!41230 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281141 () Bool)

(declare-fun res!850677 () Bool)

(assert (=> b!1281141 (=> (not res!850677) (not e!732098))))

(declare-datatypes ((List!28845 0))(
  ( (Nil!28842) (Cons!28841 (h!30059 (_ BitVec 64)) (t!42377 List!28845)) )
))
(declare-fun arrayNoDuplicates!0 (array!84361 (_ BitVec 32) List!28845) Bool)

(assert (=> b!1281141 (= res!850677 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28842))))

(declare-fun b!1281142 () Bool)

(declare-fun e!732101 () Bool)

(assert (=> b!1281142 (= e!732101 tp_is_empty!33625)))

(declare-fun b!1281143 () Bool)

(assert (=> b!1281143 (= e!732098 false)))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun minValue!1387 () V!49937)

(declare-fun lt!576534 () Bool)

(declare-fun zeroValue!1387 () V!49937)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21632 0))(
  ( (tuple2!21633 (_1!10827 (_ BitVec 64)) (_2!10827 V!49937)) )
))
(declare-datatypes ((List!28846 0))(
  ( (Nil!28843) (Cons!28842 (h!30060 tuple2!21632) (t!42378 List!28846)) )
))
(declare-datatypes ((ListLongMap!19297 0))(
  ( (ListLongMap!19298 (toList!9664 List!28846)) )
))
(declare-fun contains!7793 (ListLongMap!19297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4733 (array!84361 array!84359 (_ BitVec 32) (_ BitVec 32) V!49937 V!49937 (_ BitVec 32) Int) ListLongMap!19297)

(assert (=> b!1281143 (= lt!576534 (contains!7793 (getCurrentListMap!4733 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!51989 () Bool)

(declare-fun tp!99064 () Bool)

(assert (=> mapNonEmpty!51989 (= mapRes!51989 (and tp!99064 e!732101))))

(declare-fun mapKey!51989 () (_ BitVec 32))

(declare-fun mapRest!51989 () (Array (_ BitVec 32) ValueCell!15914))

(declare-fun mapValue!51989 () ValueCell!15914)

(assert (=> mapNonEmpty!51989 (= (arr!40679 _values!1445) (store mapRest!51989 mapKey!51989 mapValue!51989))))

(declare-fun b!1281144 () Bool)

(declare-fun res!850678 () Bool)

(assert (=> b!1281144 (=> (not res!850678) (not e!732098))))

(assert (=> b!1281144 (= res!850678 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41231 _keys!1741))))))

(declare-fun b!1281145 () Bool)

(declare-fun res!850676 () Bool)

(assert (=> b!1281145 (=> (not res!850676) (not e!732098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84361 (_ BitVec 32)) Bool)

(assert (=> b!1281145 (= res!850676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108662 res!850680) b!1281140))

(assert (= (and b!1281140 res!850679) b!1281145))

(assert (= (and b!1281145 res!850676) b!1281141))

(assert (= (and b!1281141 res!850677) b!1281144))

(assert (= (and b!1281144 res!850678) b!1281143))

(assert (= (and b!1281138 condMapEmpty!51989) mapIsEmpty!51989))

(assert (= (and b!1281138 (not condMapEmpty!51989)) mapNonEmpty!51989))

(get-info :version)

(assert (= (and mapNonEmpty!51989 ((_ is ValueCellFull!15914) mapValue!51989)) b!1281142))

(assert (= (and b!1281138 ((_ is ValueCellFull!15914) mapDefault!51989)) b!1281139))

(assert (= start!108662 b!1281138))

(declare-fun m!1176273 () Bool)

(assert (=> start!108662 m!1176273))

(declare-fun m!1176275 () Bool)

(assert (=> start!108662 m!1176275))

(declare-fun m!1176277 () Bool)

(assert (=> start!108662 m!1176277))

(declare-fun m!1176279 () Bool)

(assert (=> b!1281145 m!1176279))

(declare-fun m!1176281 () Bool)

(assert (=> b!1281141 m!1176281))

(declare-fun m!1176283 () Bool)

(assert (=> b!1281143 m!1176283))

(assert (=> b!1281143 m!1176283))

(declare-fun m!1176285 () Bool)

(assert (=> b!1281143 m!1176285))

(declare-fun m!1176287 () Bool)

(assert (=> mapNonEmpty!51989 m!1176287))

(check-sat (not b!1281141) (not b!1281143) (not b_next!27985) (not b!1281145) b_and!46047 (not mapNonEmpty!51989) tp_is_empty!33625 (not start!108662))
(check-sat b_and!46047 (not b_next!27985))
