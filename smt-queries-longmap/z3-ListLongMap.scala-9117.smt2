; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109486 () Bool)

(assert start!109486)

(declare-fun b_free!28975 () Bool)

(declare-fun b_next!28975 () Bool)

(assert (=> start!109486 (= b_free!28975 (not b_next!28975))))

(declare-fun tp!102045 () Bool)

(declare-fun b_and!47047 () Bool)

(assert (=> start!109486 (= tp!102045 b_and!47047)))

(declare-fun mapNonEmpty!53483 () Bool)

(declare-fun mapRes!53483 () Bool)

(declare-fun tp!102044 () Bool)

(declare-fun e!739757 () Bool)

(assert (=> mapNonEmpty!53483 (= mapRes!53483 (and tp!102044 e!739757))))

(declare-datatypes ((V!51257 0))(
  ( (V!51258 (val!17382 Int)) )
))
(declare-datatypes ((ValueCell!16409 0))(
  ( (ValueCellFull!16409 (v!19984 V!51257)) (EmptyCell!16409) )
))
(declare-fun mapValue!53483 () ValueCell!16409)

(declare-fun mapRest!53483 () (Array (_ BitVec 32) ValueCell!16409))

(declare-datatypes ((array!86141 0))(
  ( (array!86142 (arr!41572 (Array (_ BitVec 32) ValueCell!16409)) (size!42124 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86141)

(declare-fun mapKey!53483 () (_ BitVec 32))

(assert (=> mapNonEmpty!53483 (= (arr!41572 _values!1445) (store mapRest!53483 mapKey!53483 mapValue!53483))))

(declare-fun b!1296662 () Bool)

(declare-fun res!861767 () Bool)

(declare-fun e!739754 () Bool)

(assert (=> b!1296662 (=> (not res!861767) (not e!739754))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86143 0))(
  ( (array!86144 (arr!41573 (Array (_ BitVec 32) (_ BitVec 64))) (size!42125 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86143)

(assert (=> b!1296662 (= res!861767 (and (= (size!42124 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42125 _keys!1741) (size!42124 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296664 () Bool)

(declare-fun e!739756 () Bool)

(declare-fun e!739755 () Bool)

(assert (=> b!1296664 (= e!739756 (and e!739755 mapRes!53483))))

(declare-fun condMapEmpty!53483 () Bool)

(declare-fun mapDefault!53483 () ValueCell!16409)

(assert (=> b!1296664 (= condMapEmpty!53483 (= (arr!41572 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16409)) mapDefault!53483)))))

(declare-fun b!1296665 () Bool)

(declare-fun res!861769 () Bool)

(assert (=> b!1296665 (=> (not res!861769) (not e!739754))))

(declare-datatypes ((List!29576 0))(
  ( (Nil!29573) (Cons!29572 (h!30781 (_ BitVec 64)) (t!43132 List!29576)) )
))
(declare-fun arrayNoDuplicates!0 (array!86143 (_ BitVec 32) List!29576) Bool)

(assert (=> b!1296665 (= res!861769 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29573))))

(declare-fun mapIsEmpty!53483 () Bool)

(assert (=> mapIsEmpty!53483 mapRes!53483))

(declare-fun b!1296666 () Bool)

(declare-fun res!861768 () Bool)

(assert (=> b!1296666 (=> (not res!861768) (not e!739754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86143 (_ BitVec 32)) Bool)

(assert (=> b!1296666 (= res!861768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296667 () Bool)

(declare-fun res!861770 () Bool)

(assert (=> b!1296667 (=> (not res!861770) (not e!739754))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1296667 (= res!861770 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42125 _keys!1741))))))

(declare-fun b!1296663 () Bool)

(declare-fun tp_is_empty!34615 () Bool)

(assert (=> b!1296663 (= e!739755 tp_is_empty!34615)))

(declare-fun res!861771 () Bool)

(assert (=> start!109486 (=> (not res!861771) (not e!739754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109486 (= res!861771 (validMask!0 mask!2175))))

(assert (=> start!109486 e!739754))

(assert (=> start!109486 tp_is_empty!34615))

(assert (=> start!109486 true))

(declare-fun array_inv!31633 (array!86141) Bool)

(assert (=> start!109486 (and (array_inv!31633 _values!1445) e!739756)))

(declare-fun array_inv!31634 (array!86143) Bool)

(assert (=> start!109486 (array_inv!31634 _keys!1741)))

(assert (=> start!109486 tp!102045))

(declare-fun b!1296668 () Bool)

(assert (=> b!1296668 (= e!739754 false)))

(declare-fun minValue!1387 () V!51257)

(declare-fun zeroValue!1387 () V!51257)

(declare-fun lt!580339 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22452 0))(
  ( (tuple2!22453 (_1!11237 (_ BitVec 64)) (_2!11237 V!51257)) )
))
(declare-datatypes ((List!29577 0))(
  ( (Nil!29574) (Cons!29573 (h!30782 tuple2!22452) (t!43133 List!29577)) )
))
(declare-datatypes ((ListLongMap!20109 0))(
  ( (ListLongMap!20110 (toList!10070 List!29577)) )
))
(declare-fun contains!8118 (ListLongMap!20109 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4986 (array!86143 array!86141 (_ BitVec 32) (_ BitVec 32) V!51257 V!51257 (_ BitVec 32) Int) ListLongMap!20109)

(assert (=> b!1296668 (= lt!580339 (contains!8118 (getCurrentListMap!4986 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296669 () Bool)

(assert (=> b!1296669 (= e!739757 tp_is_empty!34615)))

(assert (= (and start!109486 res!861771) b!1296662))

(assert (= (and b!1296662 res!861767) b!1296666))

(assert (= (and b!1296666 res!861768) b!1296665))

(assert (= (and b!1296665 res!861769) b!1296667))

(assert (= (and b!1296667 res!861770) b!1296668))

(assert (= (and b!1296664 condMapEmpty!53483) mapIsEmpty!53483))

(assert (= (and b!1296664 (not condMapEmpty!53483)) mapNonEmpty!53483))

(get-info :version)

(assert (= (and mapNonEmpty!53483 ((_ is ValueCellFull!16409) mapValue!53483)) b!1296669))

(assert (= (and b!1296664 ((_ is ValueCellFull!16409) mapDefault!53483)) b!1296663))

(assert (= start!109486 b!1296664))

(declare-fun m!1188063 () Bool)

(assert (=> mapNonEmpty!53483 m!1188063))

(declare-fun m!1188065 () Bool)

(assert (=> b!1296668 m!1188065))

(assert (=> b!1296668 m!1188065))

(declare-fun m!1188067 () Bool)

(assert (=> b!1296668 m!1188067))

(declare-fun m!1188069 () Bool)

(assert (=> start!109486 m!1188069))

(declare-fun m!1188071 () Bool)

(assert (=> start!109486 m!1188071))

(declare-fun m!1188073 () Bool)

(assert (=> start!109486 m!1188073))

(declare-fun m!1188075 () Bool)

(assert (=> b!1296666 m!1188075))

(declare-fun m!1188077 () Bool)

(assert (=> b!1296665 m!1188077))

(check-sat (not b_next!28975) (not b!1296666) (not mapNonEmpty!53483) tp_is_empty!34615 (not b!1296668) (not b!1296665) (not start!109486) b_and!47047)
(check-sat b_and!47047 (not b_next!28975))
