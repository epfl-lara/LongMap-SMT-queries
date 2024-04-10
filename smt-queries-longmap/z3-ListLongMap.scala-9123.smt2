; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109524 () Bool)

(assert start!109524)

(declare-fun b_free!29013 () Bool)

(declare-fun b_next!29013 () Bool)

(assert (=> start!109524 (= b_free!29013 (not b_next!29013))))

(declare-fun tp!102157 () Bool)

(declare-fun b_and!47103 () Bool)

(assert (=> start!109524 (= tp!102157 b_and!47103)))

(declare-fun b!1297191 () Bool)

(declare-fun e!740069 () Bool)

(declare-fun e!740072 () Bool)

(declare-fun mapRes!53540 () Bool)

(assert (=> b!1297191 (= e!740069 (and e!740072 mapRes!53540))))

(declare-fun condMapEmpty!53540 () Bool)

(declare-datatypes ((V!51307 0))(
  ( (V!51308 (val!17401 Int)) )
))
(declare-datatypes ((ValueCell!16428 0))(
  ( (ValueCellFull!16428 (v!20004 V!51307)) (EmptyCell!16428) )
))
(declare-datatypes ((array!86316 0))(
  ( (array!86317 (arr!41659 (Array (_ BitVec 32) ValueCell!16428)) (size!42209 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86316)

(declare-fun mapDefault!53540 () ValueCell!16428)

(assert (=> b!1297191 (= condMapEmpty!53540 (= (arr!41659 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16428)) mapDefault!53540)))))

(declare-fun res!862091 () Bool)

(declare-fun e!740070 () Bool)

(assert (=> start!109524 (=> (not res!862091) (not e!740070))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109524 (= res!862091 (validMask!0 mask!2175))))

(assert (=> start!109524 e!740070))

(declare-fun tp_is_empty!34653 () Bool)

(assert (=> start!109524 tp_is_empty!34653))

(assert (=> start!109524 true))

(declare-fun array_inv!31529 (array!86316) Bool)

(assert (=> start!109524 (and (array_inv!31529 _values!1445) e!740069)))

(declare-datatypes ((array!86318 0))(
  ( (array!86319 (arr!41660 (Array (_ BitVec 32) (_ BitVec 64))) (size!42210 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86318)

(declare-fun array_inv!31530 (array!86318) Bool)

(assert (=> start!109524 (array_inv!31530 _keys!1741)))

(assert (=> start!109524 tp!102157))

(declare-fun mapIsEmpty!53540 () Bool)

(assert (=> mapIsEmpty!53540 mapRes!53540))

(declare-fun mapNonEmpty!53540 () Bool)

(declare-fun tp!102158 () Bool)

(declare-fun e!740071 () Bool)

(assert (=> mapNonEmpty!53540 (= mapRes!53540 (and tp!102158 e!740071))))

(declare-fun mapValue!53540 () ValueCell!16428)

(declare-fun mapRest!53540 () (Array (_ BitVec 32) ValueCell!16428))

(declare-fun mapKey!53540 () (_ BitVec 32))

(assert (=> mapNonEmpty!53540 (= (arr!41659 _values!1445) (store mapRest!53540 mapKey!53540 mapValue!53540))))

(declare-fun b!1297192 () Bool)

(declare-fun res!862089 () Bool)

(assert (=> b!1297192 (=> (not res!862089) (not e!740070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86318 (_ BitVec 32)) Bool)

(assert (=> b!1297192 (= res!862089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297193 () Bool)

(assert (=> b!1297193 (= e!740072 tp_is_empty!34653)))

(declare-fun b!1297194 () Bool)

(declare-fun res!862090 () Bool)

(assert (=> b!1297194 (=> (not res!862090) (not e!740070))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297194 (= res!862090 (and (= (size!42209 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42210 _keys!1741) (size!42209 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297195 () Bool)

(declare-fun res!862092 () Bool)

(assert (=> b!1297195 (=> (not res!862092) (not e!740070))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1297195 (= res!862092 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42210 _keys!1741))))))

(declare-fun b!1297196 () Bool)

(assert (=> b!1297196 (= e!740070 false)))

(declare-fun minValue!1387 () V!51307)

(declare-fun zeroValue!1387 () V!51307)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!580565 () Bool)

(declare-datatypes ((tuple2!22420 0))(
  ( (tuple2!22421 (_1!11221 (_ BitVec 64)) (_2!11221 V!51307)) )
))
(declare-datatypes ((List!29555 0))(
  ( (Nil!29552) (Cons!29551 (h!30760 tuple2!22420) (t!43119 List!29555)) )
))
(declare-datatypes ((ListLongMap!20077 0))(
  ( (ListLongMap!20078 (toList!10054 List!29555)) )
))
(declare-fun contains!8172 (ListLongMap!20077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5083 (array!86318 array!86316 (_ BitVec 32) (_ BitVec 32) V!51307 V!51307 (_ BitVec 32) Int) ListLongMap!20077)

(assert (=> b!1297196 (= lt!580565 (contains!8172 (getCurrentListMap!5083 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297197 () Bool)

(assert (=> b!1297197 (= e!740071 tp_is_empty!34653)))

(declare-fun b!1297198 () Bool)

(declare-fun res!862088 () Bool)

(assert (=> b!1297198 (=> (not res!862088) (not e!740070))))

(declare-datatypes ((List!29556 0))(
  ( (Nil!29553) (Cons!29552 (h!30761 (_ BitVec 64)) (t!43120 List!29556)) )
))
(declare-fun arrayNoDuplicates!0 (array!86318 (_ BitVec 32) List!29556) Bool)

(assert (=> b!1297198 (= res!862088 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29553))))

(assert (= (and start!109524 res!862091) b!1297194))

(assert (= (and b!1297194 res!862090) b!1297192))

(assert (= (and b!1297192 res!862089) b!1297198))

(assert (= (and b!1297198 res!862088) b!1297195))

(assert (= (and b!1297195 res!862092) b!1297196))

(assert (= (and b!1297191 condMapEmpty!53540) mapIsEmpty!53540))

(assert (= (and b!1297191 (not condMapEmpty!53540)) mapNonEmpty!53540))

(get-info :version)

(assert (= (and mapNonEmpty!53540 ((_ is ValueCellFull!16428) mapValue!53540)) b!1297197))

(assert (= (and b!1297191 ((_ is ValueCellFull!16428) mapDefault!53540)) b!1297193))

(assert (= start!109524 b!1297191))

(declare-fun m!1188867 () Bool)

(assert (=> b!1297196 m!1188867))

(assert (=> b!1297196 m!1188867))

(declare-fun m!1188869 () Bool)

(assert (=> b!1297196 m!1188869))

(declare-fun m!1188871 () Bool)

(assert (=> mapNonEmpty!53540 m!1188871))

(declare-fun m!1188873 () Bool)

(assert (=> b!1297192 m!1188873))

(declare-fun m!1188875 () Bool)

(assert (=> b!1297198 m!1188875))

(declare-fun m!1188877 () Bool)

(assert (=> start!109524 m!1188877))

(declare-fun m!1188879 () Bool)

(assert (=> start!109524 m!1188879))

(declare-fun m!1188881 () Bool)

(assert (=> start!109524 m!1188881))

(check-sat (not b!1297198) tp_is_empty!34653 (not start!109524) b_and!47103 (not mapNonEmpty!53540) (not b!1297192) (not b_next!29013) (not b!1297196))
(check-sat b_and!47103 (not b_next!29013))
