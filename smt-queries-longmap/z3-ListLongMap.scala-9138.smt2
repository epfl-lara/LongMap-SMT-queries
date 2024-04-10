; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109614 () Bool)

(assert start!109614)

(declare-fun b_free!29103 () Bool)

(declare-fun b_next!29103 () Bool)

(assert (=> start!109614 (= b_free!29103 (not b_next!29103))))

(declare-fun tp!102427 () Bool)

(declare-fun b_and!47193 () Bool)

(assert (=> start!109614 (= tp!102427 b_and!47193)))

(declare-fun b!1298407 () Bool)

(declare-fun e!740744 () Bool)

(declare-fun e!740746 () Bool)

(declare-fun mapRes!53675 () Bool)

(assert (=> b!1298407 (= e!740744 (and e!740746 mapRes!53675))))

(declare-fun condMapEmpty!53675 () Bool)

(declare-datatypes ((V!51427 0))(
  ( (V!51428 (val!17446 Int)) )
))
(declare-datatypes ((ValueCell!16473 0))(
  ( (ValueCellFull!16473 (v!20049 V!51427)) (EmptyCell!16473) )
))
(declare-datatypes ((array!86492 0))(
  ( (array!86493 (arr!41747 (Array (_ BitVec 32) ValueCell!16473)) (size!42297 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86492)

(declare-fun mapDefault!53675 () ValueCell!16473)

(assert (=> b!1298407 (= condMapEmpty!53675 (= (arr!41747 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16473)) mapDefault!53675)))))

(declare-fun b!1298408 () Bool)

(declare-fun res!862903 () Bool)

(declare-fun e!740747 () Bool)

(assert (=> b!1298408 (=> (not res!862903) (not e!740747))))

(declare-datatypes ((array!86494 0))(
  ( (array!86495 (arr!41748 (Array (_ BitVec 32) (_ BitVec 64))) (size!42298 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86494)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86494 (_ BitVec 32)) Bool)

(assert (=> b!1298408 (= res!862903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298409 () Bool)

(declare-fun e!740743 () Bool)

(declare-fun tp_is_empty!34743 () Bool)

(assert (=> b!1298409 (= e!740743 tp_is_empty!34743)))

(declare-fun b!1298410 () Bool)

(declare-fun res!862901 () Bool)

(assert (=> b!1298410 (=> (not res!862901) (not e!740747))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298410 (= res!862901 (and (= (size!42297 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42298 _keys!1741) (size!42297 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298411 () Bool)

(declare-fun res!862899 () Bool)

(assert (=> b!1298411 (=> (not res!862899) (not e!740747))))

(declare-fun zeroValue!1387 () V!51427)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun minValue!1387 () V!51427)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22494 0))(
  ( (tuple2!22495 (_1!11258 (_ BitVec 64)) (_2!11258 V!51427)) )
))
(declare-datatypes ((List!29623 0))(
  ( (Nil!29620) (Cons!29619 (h!30828 tuple2!22494) (t!43187 List!29623)) )
))
(declare-datatypes ((ListLongMap!20151 0))(
  ( (ListLongMap!20152 (toList!10091 List!29623)) )
))
(declare-fun contains!8209 (ListLongMap!20151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5120 (array!86494 array!86492 (_ BitVec 32) (_ BitVec 32) V!51427 V!51427 (_ BitVec 32) Int) ListLongMap!20151)

(assert (=> b!1298411 (= res!862899 (contains!8209 (getCurrentListMap!5120 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298412 () Bool)

(assert (=> b!1298412 (= e!740747 (not true))))

(assert (=> b!1298412 (contains!8209 (getCurrentListMap!5120 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42991 0))(
  ( (Unit!42992) )
))
(declare-fun lt!580700 () Unit!42991)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!48 (array!86494 array!86492 (_ BitVec 32) (_ BitVec 32) V!51427 V!51427 (_ BitVec 64) (_ BitVec 32) Int) Unit!42991)

(assert (=> b!1298412 (= lt!580700 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!48 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53675 () Bool)

(assert (=> mapIsEmpty!53675 mapRes!53675))

(declare-fun b!1298413 () Bool)

(declare-fun res!862904 () Bool)

(assert (=> b!1298413 (=> (not res!862904) (not e!740747))))

(declare-datatypes ((List!29624 0))(
  ( (Nil!29621) (Cons!29620 (h!30829 (_ BitVec 64)) (t!43188 List!29624)) )
))
(declare-fun arrayNoDuplicates!0 (array!86494 (_ BitVec 32) List!29624) Bool)

(assert (=> b!1298413 (= res!862904 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29621))))

(declare-fun b!1298414 () Bool)

(assert (=> b!1298414 (= e!740746 tp_is_empty!34743)))

(declare-fun res!862902 () Bool)

(assert (=> start!109614 (=> (not res!862902) (not e!740747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109614 (= res!862902 (validMask!0 mask!2175))))

(assert (=> start!109614 e!740747))

(assert (=> start!109614 tp_is_empty!34743))

(assert (=> start!109614 true))

(declare-fun array_inv!31599 (array!86492) Bool)

(assert (=> start!109614 (and (array_inv!31599 _values!1445) e!740744)))

(declare-fun array_inv!31600 (array!86494) Bool)

(assert (=> start!109614 (array_inv!31600 _keys!1741)))

(assert (=> start!109614 tp!102427))

(declare-fun mapNonEmpty!53675 () Bool)

(declare-fun tp!102428 () Bool)

(assert (=> mapNonEmpty!53675 (= mapRes!53675 (and tp!102428 e!740743))))

(declare-fun mapKey!53675 () (_ BitVec 32))

(declare-fun mapValue!53675 () ValueCell!16473)

(declare-fun mapRest!53675 () (Array (_ BitVec 32) ValueCell!16473))

(assert (=> mapNonEmpty!53675 (= (arr!41747 _values!1445) (store mapRest!53675 mapKey!53675 mapValue!53675))))

(declare-fun b!1298415 () Bool)

(declare-fun res!862900 () Bool)

(assert (=> b!1298415 (=> (not res!862900) (not e!740747))))

(assert (=> b!1298415 (= res!862900 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42298 _keys!1741)) (not (= (select (arr!41748 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1298416 () Bool)

(declare-fun res!862905 () Bool)

(assert (=> b!1298416 (=> (not res!862905) (not e!740747))))

(assert (=> b!1298416 (= res!862905 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42298 _keys!1741))))))

(assert (= (and start!109614 res!862902) b!1298410))

(assert (= (and b!1298410 res!862901) b!1298408))

(assert (= (and b!1298408 res!862903) b!1298413))

(assert (= (and b!1298413 res!862904) b!1298416))

(assert (= (and b!1298416 res!862905) b!1298411))

(assert (= (and b!1298411 res!862899) b!1298415))

(assert (= (and b!1298415 res!862900) b!1298412))

(assert (= (and b!1298407 condMapEmpty!53675) mapIsEmpty!53675))

(assert (= (and b!1298407 (not condMapEmpty!53675)) mapNonEmpty!53675))

(get-info :version)

(assert (= (and mapNonEmpty!53675 ((_ is ValueCellFull!16473) mapValue!53675)) b!1298409))

(assert (= (and b!1298407 ((_ is ValueCellFull!16473) mapDefault!53675)) b!1298414))

(assert (= start!109614 b!1298407))

(declare-fun m!1189763 () Bool)

(assert (=> b!1298411 m!1189763))

(assert (=> b!1298411 m!1189763))

(declare-fun m!1189765 () Bool)

(assert (=> b!1298411 m!1189765))

(declare-fun m!1189767 () Bool)

(assert (=> start!109614 m!1189767))

(declare-fun m!1189769 () Bool)

(assert (=> start!109614 m!1189769))

(declare-fun m!1189771 () Bool)

(assert (=> start!109614 m!1189771))

(declare-fun m!1189773 () Bool)

(assert (=> b!1298412 m!1189773))

(assert (=> b!1298412 m!1189773))

(declare-fun m!1189775 () Bool)

(assert (=> b!1298412 m!1189775))

(declare-fun m!1189777 () Bool)

(assert (=> b!1298412 m!1189777))

(declare-fun m!1189779 () Bool)

(assert (=> b!1298413 m!1189779))

(declare-fun m!1189781 () Bool)

(assert (=> b!1298415 m!1189781))

(declare-fun m!1189783 () Bool)

(assert (=> b!1298408 m!1189783))

(declare-fun m!1189785 () Bool)

(assert (=> mapNonEmpty!53675 m!1189785))

(check-sat (not b!1298411) (not mapNonEmpty!53675) b_and!47193 tp_is_empty!34743 (not b!1298412) (not b!1298408) (not start!109614) (not b_next!29103) (not b!1298413))
(check-sat b_and!47193 (not b_next!29103))
