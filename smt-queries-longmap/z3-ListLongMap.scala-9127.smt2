; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109546 () Bool)

(assert start!109546)

(declare-fun b_free!29035 () Bool)

(declare-fun b_next!29035 () Bool)

(assert (=> start!109546 (= b_free!29035 (not b_next!29035))))

(declare-fun tp!102225 () Bool)

(declare-fun b_and!47107 () Bool)

(assert (=> start!109546 (= tp!102225 b_and!47107)))

(declare-fun mapNonEmpty!53573 () Bool)

(declare-fun mapRes!53573 () Bool)

(declare-fun tp!102224 () Bool)

(declare-fun e!740207 () Bool)

(assert (=> mapNonEmpty!53573 (= mapRes!53573 (and tp!102224 e!740207))))

(declare-datatypes ((V!51337 0))(
  ( (V!51338 (val!17412 Int)) )
))
(declare-datatypes ((ValueCell!16439 0))(
  ( (ValueCellFull!16439 (v!20014 V!51337)) (EmptyCell!16439) )
))
(declare-fun mapValue!53573 () ValueCell!16439)

(declare-fun mapKey!53573 () (_ BitVec 32))

(declare-datatypes ((array!86255 0))(
  ( (array!86256 (arr!41629 (Array (_ BitVec 32) ValueCell!16439)) (size!42181 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86255)

(declare-fun mapRest!53573 () (Array (_ BitVec 32) ValueCell!16439))

(assert (=> mapNonEmpty!53573 (= (arr!41629 _values!1445) (store mapRest!53573 mapKey!53573 mapValue!53573))))

(declare-fun b!1297391 () Bool)

(declare-fun res!862230 () Bool)

(declare-fun e!740205 () Bool)

(assert (=> b!1297391 (=> (not res!862230) (not e!740205))))

(declare-datatypes ((array!86257 0))(
  ( (array!86258 (arr!41630 (Array (_ BitVec 32) (_ BitVec 64))) (size!42182 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86257)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86257 (_ BitVec 32)) Bool)

(assert (=> b!1297391 (= res!862230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297392 () Bool)

(declare-fun res!862228 () Bool)

(assert (=> b!1297392 (=> (not res!862228) (not e!740205))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297392 (= res!862228 (and (= (size!42181 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42182 _keys!1741) (size!42181 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53573 () Bool)

(assert (=> mapIsEmpty!53573 mapRes!53573))

(declare-fun b!1297393 () Bool)

(assert (=> b!1297393 (= e!740205 false)))

(declare-fun minValue!1387 () V!51337)

(declare-fun zeroValue!1387 () V!51337)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580420 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22492 0))(
  ( (tuple2!22493 (_1!11257 (_ BitVec 64)) (_2!11257 V!51337)) )
))
(declare-datatypes ((List!29618 0))(
  ( (Nil!29615) (Cons!29614 (h!30823 tuple2!22492) (t!43174 List!29618)) )
))
(declare-datatypes ((ListLongMap!20149 0))(
  ( (ListLongMap!20150 (toList!10090 List!29618)) )
))
(declare-fun contains!8138 (ListLongMap!20149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5006 (array!86257 array!86255 (_ BitVec 32) (_ BitVec 32) V!51337 V!51337 (_ BitVec 32) Int) ListLongMap!20149)

(assert (=> b!1297393 (= lt!580420 (contains!8138 (getCurrentListMap!5006 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297394 () Bool)

(declare-fun res!862229 () Bool)

(assert (=> b!1297394 (=> (not res!862229) (not e!740205))))

(assert (=> b!1297394 (= res!862229 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42182 _keys!1741))))))

(declare-fun b!1297395 () Bool)

(declare-fun e!740208 () Bool)

(declare-fun e!740206 () Bool)

(assert (=> b!1297395 (= e!740208 (and e!740206 mapRes!53573))))

(declare-fun condMapEmpty!53573 () Bool)

(declare-fun mapDefault!53573 () ValueCell!16439)

(assert (=> b!1297395 (= condMapEmpty!53573 (= (arr!41629 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16439)) mapDefault!53573)))))

(declare-fun res!862227 () Bool)

(assert (=> start!109546 (=> (not res!862227) (not e!740205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109546 (= res!862227 (validMask!0 mask!2175))))

(assert (=> start!109546 e!740205))

(declare-fun tp_is_empty!34675 () Bool)

(assert (=> start!109546 tp_is_empty!34675))

(assert (=> start!109546 true))

(declare-fun array_inv!31673 (array!86255) Bool)

(assert (=> start!109546 (and (array_inv!31673 _values!1445) e!740208)))

(declare-fun array_inv!31674 (array!86257) Bool)

(assert (=> start!109546 (array_inv!31674 _keys!1741)))

(assert (=> start!109546 tp!102225))

(declare-fun b!1297396 () Bool)

(assert (=> b!1297396 (= e!740207 tp_is_empty!34675)))

(declare-fun b!1297397 () Bool)

(declare-fun res!862226 () Bool)

(assert (=> b!1297397 (=> (not res!862226) (not e!740205))))

(declare-datatypes ((List!29619 0))(
  ( (Nil!29616) (Cons!29615 (h!30824 (_ BitVec 64)) (t!43175 List!29619)) )
))
(declare-fun arrayNoDuplicates!0 (array!86257 (_ BitVec 32) List!29619) Bool)

(assert (=> b!1297397 (= res!862226 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29616))))

(declare-fun b!1297398 () Bool)

(assert (=> b!1297398 (= e!740206 tp_is_empty!34675)))

(assert (= (and start!109546 res!862227) b!1297392))

(assert (= (and b!1297392 res!862228) b!1297391))

(assert (= (and b!1297391 res!862230) b!1297397))

(assert (= (and b!1297397 res!862226) b!1297394))

(assert (= (and b!1297394 res!862229) b!1297393))

(assert (= (and b!1297395 condMapEmpty!53573) mapIsEmpty!53573))

(assert (= (and b!1297395 (not condMapEmpty!53573)) mapNonEmpty!53573))

(get-info :version)

(assert (= (and mapNonEmpty!53573 ((_ is ValueCellFull!16439) mapValue!53573)) b!1297396))

(assert (= (and b!1297395 ((_ is ValueCellFull!16439) mapDefault!53573)) b!1297398))

(assert (= start!109546 b!1297395))

(declare-fun m!1188543 () Bool)

(assert (=> start!109546 m!1188543))

(declare-fun m!1188545 () Bool)

(assert (=> start!109546 m!1188545))

(declare-fun m!1188547 () Bool)

(assert (=> start!109546 m!1188547))

(declare-fun m!1188549 () Bool)

(assert (=> b!1297397 m!1188549))

(declare-fun m!1188551 () Bool)

(assert (=> b!1297391 m!1188551))

(declare-fun m!1188553 () Bool)

(assert (=> b!1297393 m!1188553))

(assert (=> b!1297393 m!1188553))

(declare-fun m!1188555 () Bool)

(assert (=> b!1297393 m!1188555))

(declare-fun m!1188557 () Bool)

(assert (=> mapNonEmpty!53573 m!1188557))

(check-sat (not b_next!29035) (not b!1297393) (not b!1297391) (not start!109546) (not b!1297397) tp_is_empty!34675 (not mapNonEmpty!53573) b_and!47107)
(check-sat b_and!47107 (not b_next!29035))
