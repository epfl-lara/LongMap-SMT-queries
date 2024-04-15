; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109504 () Bool)

(assert start!109504)

(declare-fun b_free!28993 () Bool)

(declare-fun b_next!28993 () Bool)

(assert (=> start!109504 (= b_free!28993 (not b_next!28993))))

(declare-fun tp!102098 () Bool)

(declare-fun b_and!47065 () Bool)

(assert (=> start!109504 (= tp!102098 b_and!47065)))

(declare-fun b!1296887 () Bool)

(declare-fun e!739892 () Bool)

(declare-fun e!739893 () Bool)

(declare-fun mapRes!53510 () Bool)

(assert (=> b!1296887 (= e!739892 (and e!739893 mapRes!53510))))

(declare-fun condMapEmpty!53510 () Bool)

(declare-datatypes ((V!51281 0))(
  ( (V!51282 (val!17391 Int)) )
))
(declare-datatypes ((ValueCell!16418 0))(
  ( (ValueCellFull!16418 (v!19993 V!51281)) (EmptyCell!16418) )
))
(declare-datatypes ((array!86175 0))(
  ( (array!86176 (arr!41589 (Array (_ BitVec 32) ValueCell!16418)) (size!42141 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86175)

(declare-fun mapDefault!53510 () ValueCell!16418)

(assert (=> b!1296887 (= condMapEmpty!53510 (= (arr!41589 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16418)) mapDefault!53510)))))

(declare-fun b!1296888 () Bool)

(declare-fun res!861911 () Bool)

(declare-fun e!739891 () Bool)

(assert (=> b!1296888 (=> (not res!861911) (not e!739891))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86177 0))(
  ( (array!86178 (arr!41590 (Array (_ BitVec 32) (_ BitVec 64))) (size!42142 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86177)

(assert (=> b!1296888 (= res!861911 (and (= (size!42141 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42142 _keys!1741) (size!42141 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296889 () Bool)

(declare-fun tp_is_empty!34633 () Bool)

(assert (=> b!1296889 (= e!739893 tp_is_empty!34633)))

(declare-fun b!1296890 () Bool)

(assert (=> b!1296890 (= e!739891 false)))

(declare-fun minValue!1387 () V!51281)

(declare-fun zeroValue!1387 () V!51281)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580357 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22464 0))(
  ( (tuple2!22465 (_1!11243 (_ BitVec 64)) (_2!11243 V!51281)) )
))
(declare-datatypes ((List!29588 0))(
  ( (Nil!29585) (Cons!29584 (h!30793 tuple2!22464) (t!43144 List!29588)) )
))
(declare-datatypes ((ListLongMap!20121 0))(
  ( (ListLongMap!20122 (toList!10076 List!29588)) )
))
(declare-fun contains!8124 (ListLongMap!20121 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4992 (array!86177 array!86175 (_ BitVec 32) (_ BitVec 32) V!51281 V!51281 (_ BitVec 32) Int) ListLongMap!20121)

(assert (=> b!1296890 (= lt!580357 (contains!8124 (getCurrentListMap!4992 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53510 () Bool)

(assert (=> mapIsEmpty!53510 mapRes!53510))

(declare-fun mapNonEmpty!53510 () Bool)

(declare-fun tp!102099 () Bool)

(declare-fun e!739889 () Bool)

(assert (=> mapNonEmpty!53510 (= mapRes!53510 (and tp!102099 e!739889))))

(declare-fun mapValue!53510 () ValueCell!16418)

(declare-fun mapKey!53510 () (_ BitVec 32))

(declare-fun mapRest!53510 () (Array (_ BitVec 32) ValueCell!16418))

(assert (=> mapNonEmpty!53510 (= (arr!41589 _values!1445) (store mapRest!53510 mapKey!53510 mapValue!53510))))

(declare-fun b!1296891 () Bool)

(declare-fun res!861913 () Bool)

(assert (=> b!1296891 (=> (not res!861913) (not e!739891))))

(declare-datatypes ((List!29589 0))(
  ( (Nil!29586) (Cons!29585 (h!30794 (_ BitVec 64)) (t!43145 List!29589)) )
))
(declare-fun arrayNoDuplicates!0 (array!86177 (_ BitVec 32) List!29589) Bool)

(assert (=> b!1296891 (= res!861913 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29586))))

(declare-fun b!1296892 () Bool)

(declare-fun res!861915 () Bool)

(assert (=> b!1296892 (=> (not res!861915) (not e!739891))))

(assert (=> b!1296892 (= res!861915 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42142 _keys!1741))))))

(declare-fun res!861914 () Bool)

(assert (=> start!109504 (=> (not res!861914) (not e!739891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109504 (= res!861914 (validMask!0 mask!2175))))

(assert (=> start!109504 e!739891))

(assert (=> start!109504 tp_is_empty!34633))

(assert (=> start!109504 true))

(declare-fun array_inv!31643 (array!86175) Bool)

(assert (=> start!109504 (and (array_inv!31643 _values!1445) e!739892)))

(declare-fun array_inv!31644 (array!86177) Bool)

(assert (=> start!109504 (array_inv!31644 _keys!1741)))

(assert (=> start!109504 tp!102098))

(declare-fun b!1296893 () Bool)

(assert (=> b!1296893 (= e!739889 tp_is_empty!34633)))

(declare-fun b!1296894 () Bool)

(declare-fun res!861912 () Bool)

(assert (=> b!1296894 (=> (not res!861912) (not e!739891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86177 (_ BitVec 32)) Bool)

(assert (=> b!1296894 (= res!861912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109504 res!861914) b!1296888))

(assert (= (and b!1296888 res!861911) b!1296894))

(assert (= (and b!1296894 res!861912) b!1296891))

(assert (= (and b!1296891 res!861913) b!1296892))

(assert (= (and b!1296892 res!861915) b!1296890))

(assert (= (and b!1296887 condMapEmpty!53510) mapIsEmpty!53510))

(assert (= (and b!1296887 (not condMapEmpty!53510)) mapNonEmpty!53510))

(get-info :version)

(assert (= (and mapNonEmpty!53510 ((_ is ValueCellFull!16418) mapValue!53510)) b!1296893))

(assert (= (and b!1296887 ((_ is ValueCellFull!16418) mapDefault!53510)) b!1296889))

(assert (= start!109504 b!1296887))

(declare-fun m!1188207 () Bool)

(assert (=> b!1296890 m!1188207))

(assert (=> b!1296890 m!1188207))

(declare-fun m!1188209 () Bool)

(assert (=> b!1296890 m!1188209))

(declare-fun m!1188211 () Bool)

(assert (=> b!1296891 m!1188211))

(declare-fun m!1188213 () Bool)

(assert (=> b!1296894 m!1188213))

(declare-fun m!1188215 () Bool)

(assert (=> mapNonEmpty!53510 m!1188215))

(declare-fun m!1188217 () Bool)

(assert (=> start!109504 m!1188217))

(declare-fun m!1188219 () Bool)

(assert (=> start!109504 m!1188219))

(declare-fun m!1188221 () Bool)

(assert (=> start!109504 m!1188221))

(check-sat (not b!1296891) (not b!1296894) tp_is_empty!34633 (not b!1296890) (not b_next!28993) (not mapNonEmpty!53510) b_and!47065 (not start!109504))
(check-sat b_and!47065 (not b_next!28993))
