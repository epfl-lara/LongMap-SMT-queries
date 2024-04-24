; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109848 () Bool)

(assert start!109848)

(declare-fun b_free!29113 () Bool)

(declare-fun b_next!29113 () Bool)

(assert (=> start!109848 (= b_free!29113 (not b_next!29113))))

(declare-fun tp!102458 () Bool)

(declare-fun b_and!47205 () Bool)

(assert (=> start!109848 (= tp!102458 b_and!47205)))

(declare-fun mapIsEmpty!53690 () Bool)

(declare-fun mapRes!53690 () Bool)

(assert (=> mapIsEmpty!53690 mapRes!53690))

(declare-fun res!863529 () Bool)

(declare-fun e!741666 () Bool)

(assert (=> start!109848 (=> (not res!863529) (not e!741666))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109848 (= res!863529 (validMask!0 mask!2175))))

(assert (=> start!109848 e!741666))

(declare-fun tp_is_empty!34753 () Bool)

(assert (=> start!109848 tp_is_empty!34753))

(assert (=> start!109848 true))

(declare-datatypes ((V!51441 0))(
  ( (V!51442 (val!17451 Int)) )
))
(declare-datatypes ((ValueCell!16478 0))(
  ( (ValueCellFull!16478 (v!20049 V!51441)) (EmptyCell!16478) )
))
(declare-datatypes ((array!86551 0))(
  ( (array!86552 (arr!41772 (Array (_ BitVec 32) ValueCell!16478)) (size!42323 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86551)

(declare-fun e!741668 () Bool)

(declare-fun array_inv!31847 (array!86551) Bool)

(assert (=> start!109848 (and (array_inv!31847 _values!1445) e!741668)))

(declare-datatypes ((array!86553 0))(
  ( (array!86554 (arr!41773 (Array (_ BitVec 32) (_ BitVec 64))) (size!42324 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86553)

(declare-fun array_inv!31848 (array!86553) Bool)

(assert (=> start!109848 (array_inv!31848 _keys!1741)))

(assert (=> start!109848 tp!102458))

(declare-fun b!1299862 () Bool)

(declare-fun res!863524 () Bool)

(assert (=> b!1299862 (=> (not res!863524) (not e!741666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86553 (_ BitVec 32)) Bool)

(assert (=> b!1299862 (= res!863524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299863 () Bool)

(declare-fun e!741669 () Bool)

(assert (=> b!1299863 (= e!741669 tp_is_empty!34753)))

(declare-fun b!1299864 () Bool)

(declare-fun e!741665 () Bool)

(assert (=> b!1299864 (= e!741665 tp_is_empty!34753)))

(declare-fun b!1299865 () Bool)

(declare-fun res!863528 () Bool)

(assert (=> b!1299865 (=> (not res!863528) (not e!741666))))

(declare-fun minValue!1387 () V!51441)

(declare-fun zeroValue!1387 () V!51441)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22512 0))(
  ( (tuple2!22513 (_1!11267 (_ BitVec 64)) (_2!11267 V!51441)) )
))
(declare-datatypes ((List!29672 0))(
  ( (Nil!29669) (Cons!29668 (h!30886 tuple2!22512) (t!43228 List!29672)) )
))
(declare-datatypes ((ListLongMap!20177 0))(
  ( (ListLongMap!20178 (toList!10104 List!29672)) )
))
(declare-fun contains!8234 (ListLongMap!20177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5123 (array!86553 array!86551 (_ BitVec 32) (_ BitVec 32) V!51441 V!51441 (_ BitVec 32) Int) ListLongMap!20177)

(assert (=> b!1299865 (= res!863528 (contains!8234 (getCurrentListMap!5123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53690 () Bool)

(declare-fun tp!102457 () Bool)

(assert (=> mapNonEmpty!53690 (= mapRes!53690 (and tp!102457 e!741665))))

(declare-fun mapValue!53690 () ValueCell!16478)

(declare-fun mapRest!53690 () (Array (_ BitVec 32) ValueCell!16478))

(declare-fun mapKey!53690 () (_ BitVec 32))

(assert (=> mapNonEmpty!53690 (= (arr!41772 _values!1445) (store mapRest!53690 mapKey!53690 mapValue!53690))))

(declare-fun b!1299866 () Bool)

(declare-fun res!863530 () Bool)

(assert (=> b!1299866 (=> (not res!863530) (not e!741666))))

(declare-datatypes ((List!29673 0))(
  ( (Nil!29670) (Cons!29669 (h!30887 (_ BitVec 64)) (t!43229 List!29673)) )
))
(declare-fun arrayNoDuplicates!0 (array!86553 (_ BitVec 32) List!29673) Bool)

(assert (=> b!1299866 (= res!863530 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29670))))

(declare-fun b!1299867 () Bool)

(declare-fun res!863526 () Bool)

(assert (=> b!1299867 (=> (not res!863526) (not e!741666))))

(assert (=> b!1299867 (= res!863526 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42324 _keys!1741))))))

(declare-fun b!1299868 () Bool)

(declare-fun res!863525 () Bool)

(assert (=> b!1299868 (=> (not res!863525) (not e!741666))))

(assert (=> b!1299868 (= res!863525 (and (= (size!42323 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42324 _keys!1741) (size!42323 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299869 () Bool)

(assert (=> b!1299869 (= e!741666 (not true))))

(assert (=> b!1299869 (contains!8234 (getCurrentListMap!5123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42961 0))(
  ( (Unit!42962) )
))
(declare-fun lt!581199 () Unit!42961)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!47 (array!86553 array!86551 (_ BitVec 32) (_ BitVec 32) V!51441 V!51441 (_ BitVec 64) (_ BitVec 32) Int) Unit!42961)

(assert (=> b!1299869 (= lt!581199 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!47 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1299870 () Bool)

(declare-fun res!863527 () Bool)

(assert (=> b!1299870 (=> (not res!863527) (not e!741666))))

(assert (=> b!1299870 (= res!863527 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42324 _keys!1741)) (not (= (select (arr!41773 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1299871 () Bool)

(assert (=> b!1299871 (= e!741668 (and e!741669 mapRes!53690))))

(declare-fun condMapEmpty!53690 () Bool)

(declare-fun mapDefault!53690 () ValueCell!16478)

(assert (=> b!1299871 (= condMapEmpty!53690 (= (arr!41772 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16478)) mapDefault!53690)))))

(assert (= (and start!109848 res!863529) b!1299868))

(assert (= (and b!1299868 res!863525) b!1299862))

(assert (= (and b!1299862 res!863524) b!1299866))

(assert (= (and b!1299866 res!863530) b!1299867))

(assert (= (and b!1299867 res!863526) b!1299865))

(assert (= (and b!1299865 res!863528) b!1299870))

(assert (= (and b!1299870 res!863527) b!1299869))

(assert (= (and b!1299871 condMapEmpty!53690) mapIsEmpty!53690))

(assert (= (and b!1299871 (not condMapEmpty!53690)) mapNonEmpty!53690))

(get-info :version)

(assert (= (and mapNonEmpty!53690 ((_ is ValueCellFull!16478) mapValue!53690)) b!1299864))

(assert (= (and b!1299871 ((_ is ValueCellFull!16478) mapDefault!53690)) b!1299863))

(assert (= start!109848 b!1299871))

(declare-fun m!1191501 () Bool)

(assert (=> b!1299862 m!1191501))

(declare-fun m!1191503 () Bool)

(assert (=> b!1299869 m!1191503))

(assert (=> b!1299869 m!1191503))

(declare-fun m!1191505 () Bool)

(assert (=> b!1299869 m!1191505))

(declare-fun m!1191507 () Bool)

(assert (=> b!1299869 m!1191507))

(declare-fun m!1191509 () Bool)

(assert (=> mapNonEmpty!53690 m!1191509))

(declare-fun m!1191511 () Bool)

(assert (=> b!1299866 m!1191511))

(declare-fun m!1191513 () Bool)

(assert (=> b!1299870 m!1191513))

(declare-fun m!1191515 () Bool)

(assert (=> b!1299865 m!1191515))

(assert (=> b!1299865 m!1191515))

(declare-fun m!1191517 () Bool)

(assert (=> b!1299865 m!1191517))

(declare-fun m!1191519 () Bool)

(assert (=> start!109848 m!1191519))

(declare-fun m!1191521 () Bool)

(assert (=> start!109848 m!1191521))

(declare-fun m!1191523 () Bool)

(assert (=> start!109848 m!1191523))

(check-sat (not start!109848) (not b!1299866) (not b!1299869) b_and!47205 (not mapNonEmpty!53690) (not b!1299862) (not b_next!29113) (not b!1299865) tp_is_empty!34753)
(check-sat b_and!47205 (not b_next!29113))
