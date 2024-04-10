; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109512 () Bool)

(assert start!109512)

(declare-fun b_free!29001 () Bool)

(declare-fun b_next!29001 () Bool)

(assert (=> start!109512 (= b_free!29001 (not b_next!29001))))

(declare-fun tp!102122 () Bool)

(declare-fun b_and!47091 () Bool)

(assert (=> start!109512 (= tp!102122 b_and!47091)))

(declare-fun b!1297047 () Bool)

(declare-fun e!739980 () Bool)

(declare-fun tp_is_empty!34641 () Bool)

(assert (=> b!1297047 (= e!739980 tp_is_empty!34641)))

(declare-fun b!1297048 () Bool)

(declare-fun e!739978 () Bool)

(assert (=> b!1297048 (= e!739978 false)))

(declare-datatypes ((V!51291 0))(
  ( (V!51292 (val!17395 Int)) )
))
(declare-fun minValue!1387 () V!51291)

(declare-fun zeroValue!1387 () V!51291)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580547 () Bool)

(declare-datatypes ((ValueCell!16422 0))(
  ( (ValueCellFull!16422 (v!19998 V!51291)) (EmptyCell!16422) )
))
(declare-datatypes ((array!86296 0))(
  ( (array!86297 (arr!41649 (Array (_ BitVec 32) ValueCell!16422)) (size!42199 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86296)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86298 0))(
  ( (array!86299 (arr!41650 (Array (_ BitVec 32) (_ BitVec 64))) (size!42200 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86298)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22414 0))(
  ( (tuple2!22415 (_1!11218 (_ BitVec 64)) (_2!11218 V!51291)) )
))
(declare-datatypes ((List!29549 0))(
  ( (Nil!29546) (Cons!29545 (h!30754 tuple2!22414) (t!43113 List!29549)) )
))
(declare-datatypes ((ListLongMap!20071 0))(
  ( (ListLongMap!20072 (toList!10051 List!29549)) )
))
(declare-fun contains!8169 (ListLongMap!20071 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5080 (array!86298 array!86296 (_ BitVec 32) (_ BitVec 32) V!51291 V!51291 (_ BitVec 32) Int) ListLongMap!20071)

(assert (=> b!1297048 (= lt!580547 (contains!8169 (getCurrentListMap!5080 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297049 () Bool)

(declare-fun e!739982 () Bool)

(assert (=> b!1297049 (= e!739982 tp_is_empty!34641)))

(declare-fun b!1297050 () Bool)

(declare-fun res!861999 () Bool)

(assert (=> b!1297050 (=> (not res!861999) (not e!739978))))

(assert (=> b!1297050 (= res!861999 (and (= (size!42199 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42200 _keys!1741) (size!42199 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53522 () Bool)

(declare-fun mapRes!53522 () Bool)

(assert (=> mapIsEmpty!53522 mapRes!53522))

(declare-fun res!862001 () Bool)

(assert (=> start!109512 (=> (not res!862001) (not e!739978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109512 (= res!862001 (validMask!0 mask!2175))))

(assert (=> start!109512 e!739978))

(assert (=> start!109512 tp_is_empty!34641))

(assert (=> start!109512 true))

(declare-fun e!739979 () Bool)

(declare-fun array_inv!31521 (array!86296) Bool)

(assert (=> start!109512 (and (array_inv!31521 _values!1445) e!739979)))

(declare-fun array_inv!31522 (array!86298) Bool)

(assert (=> start!109512 (array_inv!31522 _keys!1741)))

(assert (=> start!109512 tp!102122))

(declare-fun b!1297051 () Bool)

(assert (=> b!1297051 (= e!739979 (and e!739982 mapRes!53522))))

(declare-fun condMapEmpty!53522 () Bool)

(declare-fun mapDefault!53522 () ValueCell!16422)

(assert (=> b!1297051 (= condMapEmpty!53522 (= (arr!41649 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16422)) mapDefault!53522)))))

(declare-fun b!1297052 () Bool)

(declare-fun res!862002 () Bool)

(assert (=> b!1297052 (=> (not res!862002) (not e!739978))))

(declare-datatypes ((List!29550 0))(
  ( (Nil!29547) (Cons!29546 (h!30755 (_ BitVec 64)) (t!43114 List!29550)) )
))
(declare-fun arrayNoDuplicates!0 (array!86298 (_ BitVec 32) List!29550) Bool)

(assert (=> b!1297052 (= res!862002 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29547))))

(declare-fun b!1297053 () Bool)

(declare-fun res!862000 () Bool)

(assert (=> b!1297053 (=> (not res!862000) (not e!739978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86298 (_ BitVec 32)) Bool)

(assert (=> b!1297053 (= res!862000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297054 () Bool)

(declare-fun res!861998 () Bool)

(assert (=> b!1297054 (=> (not res!861998) (not e!739978))))

(assert (=> b!1297054 (= res!861998 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42200 _keys!1741))))))

(declare-fun mapNonEmpty!53522 () Bool)

(declare-fun tp!102121 () Bool)

(assert (=> mapNonEmpty!53522 (= mapRes!53522 (and tp!102121 e!739980))))

(declare-fun mapRest!53522 () (Array (_ BitVec 32) ValueCell!16422))

(declare-fun mapKey!53522 () (_ BitVec 32))

(declare-fun mapValue!53522 () ValueCell!16422)

(assert (=> mapNonEmpty!53522 (= (arr!41649 _values!1445) (store mapRest!53522 mapKey!53522 mapValue!53522))))

(assert (= (and start!109512 res!862001) b!1297050))

(assert (= (and b!1297050 res!861999) b!1297053))

(assert (= (and b!1297053 res!862000) b!1297052))

(assert (= (and b!1297052 res!862002) b!1297054))

(assert (= (and b!1297054 res!861998) b!1297048))

(assert (= (and b!1297051 condMapEmpty!53522) mapIsEmpty!53522))

(assert (= (and b!1297051 (not condMapEmpty!53522)) mapNonEmpty!53522))

(get-info :version)

(assert (= (and mapNonEmpty!53522 ((_ is ValueCellFull!16422) mapValue!53522)) b!1297047))

(assert (= (and b!1297051 ((_ is ValueCellFull!16422) mapDefault!53522)) b!1297049))

(assert (= start!109512 b!1297051))

(declare-fun m!1188771 () Bool)

(assert (=> b!1297053 m!1188771))

(declare-fun m!1188773 () Bool)

(assert (=> start!109512 m!1188773))

(declare-fun m!1188775 () Bool)

(assert (=> start!109512 m!1188775))

(declare-fun m!1188777 () Bool)

(assert (=> start!109512 m!1188777))

(declare-fun m!1188779 () Bool)

(assert (=> b!1297048 m!1188779))

(assert (=> b!1297048 m!1188779))

(declare-fun m!1188781 () Bool)

(assert (=> b!1297048 m!1188781))

(declare-fun m!1188783 () Bool)

(assert (=> b!1297052 m!1188783))

(declare-fun m!1188785 () Bool)

(assert (=> mapNonEmpty!53522 m!1188785))

(check-sat (not b!1297052) (not b_next!29001) (not start!109512) (not b!1297053) b_and!47091 (not mapNonEmpty!53522) (not b!1297048) tp_is_empty!34641)
(check-sat b_and!47091 (not b_next!29001))
