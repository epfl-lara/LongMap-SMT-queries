; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109480 () Bool)

(assert start!109480)

(declare-fun b_free!28969 () Bool)

(declare-fun b_next!28969 () Bool)

(assert (=> start!109480 (= b_free!28969 (not b_next!28969))))

(declare-fun tp!102027 () Bool)

(declare-fun b_and!47041 () Bool)

(assert (=> start!109480 (= tp!102027 b_and!47041)))

(declare-fun b!1296590 () Bool)

(declare-fun e!739712 () Bool)

(assert (=> b!1296590 (= e!739712 false)))

(declare-datatypes ((V!51249 0))(
  ( (V!51250 (val!17379 Int)) )
))
(declare-fun minValue!1387 () V!51249)

(declare-fun zeroValue!1387 () V!51249)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580330 () Bool)

(declare-datatypes ((ValueCell!16406 0))(
  ( (ValueCellFull!16406 (v!19981 V!51249)) (EmptyCell!16406) )
))
(declare-datatypes ((array!86129 0))(
  ( (array!86130 (arr!41566 (Array (_ BitVec 32) ValueCell!16406)) (size!42118 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86129)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86131 0))(
  ( (array!86132 (arr!41567 (Array (_ BitVec 32) (_ BitVec 64))) (size!42119 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86131)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22446 0))(
  ( (tuple2!22447 (_1!11234 (_ BitVec 64)) (_2!11234 V!51249)) )
))
(declare-datatypes ((List!29572 0))(
  ( (Nil!29569) (Cons!29568 (h!30777 tuple2!22446) (t!43128 List!29572)) )
))
(declare-datatypes ((ListLongMap!20103 0))(
  ( (ListLongMap!20104 (toList!10067 List!29572)) )
))
(declare-fun contains!8115 (ListLongMap!20103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4983 (array!86131 array!86129 (_ BitVec 32) (_ BitVec 32) V!51249 V!51249 (_ BitVec 32) Int) ListLongMap!20103)

(assert (=> b!1296590 (= lt!580330 (contains!8115 (getCurrentListMap!4983 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296591 () Bool)

(declare-fun e!739711 () Bool)

(declare-fun tp_is_empty!34609 () Bool)

(assert (=> b!1296591 (= e!739711 tp_is_empty!34609)))

(declare-fun b!1296592 () Bool)

(declare-fun res!861723 () Bool)

(assert (=> b!1296592 (=> (not res!861723) (not e!739712))))

(declare-datatypes ((List!29573 0))(
  ( (Nil!29570) (Cons!29569 (h!30778 (_ BitVec 64)) (t!43129 List!29573)) )
))
(declare-fun arrayNoDuplicates!0 (array!86131 (_ BitVec 32) List!29573) Bool)

(assert (=> b!1296592 (= res!861723 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29570))))

(declare-fun b!1296593 () Bool)

(declare-fun res!861724 () Bool)

(assert (=> b!1296593 (=> (not res!861724) (not e!739712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86131 (_ BitVec 32)) Bool)

(assert (=> b!1296593 (= res!861724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296595 () Bool)

(declare-fun res!861722 () Bool)

(assert (=> b!1296595 (=> (not res!861722) (not e!739712))))

(assert (=> b!1296595 (= res!861722 (and (= (size!42118 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42119 _keys!1741) (size!42118 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53474 () Bool)

(declare-fun mapRes!53474 () Bool)

(assert (=> mapIsEmpty!53474 mapRes!53474))

(declare-fun mapNonEmpty!53474 () Bool)

(declare-fun tp!102026 () Bool)

(assert (=> mapNonEmpty!53474 (= mapRes!53474 (and tp!102026 e!739711))))

(declare-fun mapKey!53474 () (_ BitVec 32))

(declare-fun mapRest!53474 () (Array (_ BitVec 32) ValueCell!16406))

(declare-fun mapValue!53474 () ValueCell!16406)

(assert (=> mapNonEmpty!53474 (= (arr!41566 _values!1445) (store mapRest!53474 mapKey!53474 mapValue!53474))))

(declare-fun b!1296596 () Bool)

(declare-fun e!739710 () Bool)

(assert (=> b!1296596 (= e!739710 tp_is_empty!34609)))

(declare-fun b!1296597 () Bool)

(declare-fun e!739709 () Bool)

(assert (=> b!1296597 (= e!739709 (and e!739710 mapRes!53474))))

(declare-fun condMapEmpty!53474 () Bool)

(declare-fun mapDefault!53474 () ValueCell!16406)

(assert (=> b!1296597 (= condMapEmpty!53474 (= (arr!41566 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16406)) mapDefault!53474)))))

(declare-fun b!1296594 () Bool)

(declare-fun res!861726 () Bool)

(assert (=> b!1296594 (=> (not res!861726) (not e!739712))))

(assert (=> b!1296594 (= res!861726 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42119 _keys!1741))))))

(declare-fun res!861725 () Bool)

(assert (=> start!109480 (=> (not res!861725) (not e!739712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109480 (= res!861725 (validMask!0 mask!2175))))

(assert (=> start!109480 e!739712))

(assert (=> start!109480 tp_is_empty!34609))

(assert (=> start!109480 true))

(declare-fun array_inv!31627 (array!86129) Bool)

(assert (=> start!109480 (and (array_inv!31627 _values!1445) e!739709)))

(declare-fun array_inv!31628 (array!86131) Bool)

(assert (=> start!109480 (array_inv!31628 _keys!1741)))

(assert (=> start!109480 tp!102027))

(assert (= (and start!109480 res!861725) b!1296595))

(assert (= (and b!1296595 res!861722) b!1296593))

(assert (= (and b!1296593 res!861724) b!1296592))

(assert (= (and b!1296592 res!861723) b!1296594))

(assert (= (and b!1296594 res!861726) b!1296590))

(assert (= (and b!1296597 condMapEmpty!53474) mapIsEmpty!53474))

(assert (= (and b!1296597 (not condMapEmpty!53474)) mapNonEmpty!53474))

(get-info :version)

(assert (= (and mapNonEmpty!53474 ((_ is ValueCellFull!16406) mapValue!53474)) b!1296591))

(assert (= (and b!1296597 ((_ is ValueCellFull!16406) mapDefault!53474)) b!1296596))

(assert (= start!109480 b!1296597))

(declare-fun m!1188015 () Bool)

(assert (=> start!109480 m!1188015))

(declare-fun m!1188017 () Bool)

(assert (=> start!109480 m!1188017))

(declare-fun m!1188019 () Bool)

(assert (=> start!109480 m!1188019))

(declare-fun m!1188021 () Bool)

(assert (=> b!1296593 m!1188021))

(declare-fun m!1188023 () Bool)

(assert (=> b!1296592 m!1188023))

(declare-fun m!1188025 () Bool)

(assert (=> b!1296590 m!1188025))

(assert (=> b!1296590 m!1188025))

(declare-fun m!1188027 () Bool)

(assert (=> b!1296590 m!1188027))

(declare-fun m!1188029 () Bool)

(assert (=> mapNonEmpty!53474 m!1188029))

(check-sat b_and!47041 (not start!109480) (not b!1296593) (not b!1296592) tp_is_empty!34609 (not mapNonEmpty!53474) (not b_next!28969) (not b!1296590))
(check-sat b_and!47041 (not b_next!28969))
