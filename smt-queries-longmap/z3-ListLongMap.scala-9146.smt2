; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109716 () Bool)

(assert start!109716)

(declare-fun b_free!29149 () Bool)

(declare-fun b_next!29149 () Bool)

(assert (=> start!109716 (= b_free!29149 (not b_next!29149))))

(declare-fun tp!102576 () Bool)

(declare-fun b_and!47233 () Bool)

(assert (=> start!109716 (= tp!102576 b_and!47233)))

(declare-fun mapIsEmpty!53753 () Bool)

(declare-fun mapRes!53753 () Bool)

(assert (=> mapIsEmpty!53753 mapRes!53753))

(declare-fun b!1299464 () Bool)

(declare-fun e!741347 () Bool)

(declare-fun e!741346 () Bool)

(assert (=> b!1299464 (= e!741347 (and e!741346 mapRes!53753))))

(declare-fun condMapEmpty!53753 () Bool)

(declare-datatypes ((V!51489 0))(
  ( (V!51490 (val!17469 Int)) )
))
(declare-datatypes ((ValueCell!16496 0))(
  ( (ValueCellFull!16496 (v!20074 V!51489)) (EmptyCell!16496) )
))
(declare-datatypes ((array!86485 0))(
  ( (array!86486 (arr!41741 (Array (_ BitVec 32) ValueCell!16496)) (size!42293 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86485)

(declare-fun mapDefault!53753 () ValueCell!16496)

(assert (=> b!1299464 (= condMapEmpty!53753 (= (arr!41741 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16496)) mapDefault!53753)))))

(declare-fun b!1299465 () Bool)

(declare-fun res!863551 () Bool)

(declare-fun e!741344 () Bool)

(assert (=> b!1299465 (=> (not res!863551) (not e!741344))))

(declare-datatypes ((array!86487 0))(
  ( (array!86488 (arr!41742 (Array (_ BitVec 32) (_ BitVec 64))) (size!42294 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86487)

(declare-datatypes ((List!29697 0))(
  ( (Nil!29694) (Cons!29693 (h!30902 (_ BitVec 64)) (t!43259 List!29697)) )
))
(declare-fun arrayNoDuplicates!0 (array!86487 (_ BitVec 32) List!29697) Bool)

(assert (=> b!1299465 (= res!863551 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29694))))

(declare-fun mapNonEmpty!53753 () Bool)

(declare-fun tp!102575 () Bool)

(declare-fun e!741343 () Bool)

(assert (=> mapNonEmpty!53753 (= mapRes!53753 (and tp!102575 e!741343))))

(declare-fun mapRest!53753 () (Array (_ BitVec 32) ValueCell!16496))

(declare-fun mapKey!53753 () (_ BitVec 32))

(declare-fun mapValue!53753 () ValueCell!16496)

(assert (=> mapNonEmpty!53753 (= (arr!41741 _values!1445) (store mapRest!53753 mapKey!53753 mapValue!53753))))

(declare-fun b!1299467 () Bool)

(declare-fun res!863553 () Bool)

(assert (=> b!1299467 (=> (not res!863553) (not e!741344))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1299467 (= res!863553 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42294 _keys!1741))))))

(declare-fun b!1299468 () Bool)

(declare-fun res!863548 () Bool)

(assert (=> b!1299468 (=> (not res!863548) (not e!741344))))

(assert (=> b!1299468 (= res!863548 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42294 _keys!1741))))))

(declare-fun b!1299469 () Bool)

(declare-fun res!863555 () Bool)

(assert (=> b!1299469 (=> (not res!863555) (not e!741344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299469 (= res!863555 (validKeyInArray!0 (select (arr!41742 _keys!1741) from!2144)))))

(declare-fun b!1299470 () Bool)

(declare-fun res!863549 () Bool)

(assert (=> b!1299470 (=> (not res!863549) (not e!741344))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86487 (_ BitVec 32)) Bool)

(assert (=> b!1299470 (= res!863549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299471 () Bool)

(declare-fun tp_is_empty!34789 () Bool)

(assert (=> b!1299471 (= e!741346 tp_is_empty!34789)))

(declare-fun b!1299472 () Bool)

(declare-fun res!863550 () Bool)

(assert (=> b!1299472 (=> (not res!863550) (not e!741344))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1299472 (= res!863550 (and (= (size!42293 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42294 _keys!1741) (size!42293 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299473 () Bool)

(declare-fun res!863552 () Bool)

(assert (=> b!1299473 (=> (not res!863552) (not e!741344))))

(declare-fun minValue!1387 () V!51489)

(declare-fun zeroValue!1387 () V!51489)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22578 0))(
  ( (tuple2!22579 (_1!11300 (_ BitVec 64)) (_2!11300 V!51489)) )
))
(declare-datatypes ((List!29698 0))(
  ( (Nil!29695) (Cons!29694 (h!30903 tuple2!22578) (t!43260 List!29698)) )
))
(declare-datatypes ((ListLongMap!20235 0))(
  ( (ListLongMap!20236 (toList!10133 List!29698)) )
))
(declare-fun contains!8185 (ListLongMap!20235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5048 (array!86487 array!86485 (_ BitVec 32) (_ BitVec 32) V!51489 V!51489 (_ BitVec 32) Int) ListLongMap!20235)

(assert (=> b!1299473 (= res!863552 (contains!8185 (getCurrentListMap!5048 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!863556 () Bool)

(assert (=> start!109716 (=> (not res!863556) (not e!741344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109716 (= res!863556 (validMask!0 mask!2175))))

(assert (=> start!109716 e!741344))

(assert (=> start!109716 tp_is_empty!34789))

(assert (=> start!109716 true))

(declare-fun array_inv!31747 (array!86485) Bool)

(assert (=> start!109716 (and (array_inv!31747 _values!1445) e!741347)))

(declare-fun array_inv!31748 (array!86487) Bool)

(assert (=> start!109716 (array_inv!31748 _keys!1741)))

(assert (=> start!109716 tp!102576))

(declare-fun b!1299466 () Bool)

(assert (=> b!1299466 (= e!741344 false)))

(declare-fun lt!580916 () Bool)

(declare-fun +!4478 (ListLongMap!20235 tuple2!22578) ListLongMap!20235)

(declare-fun getCurrentListMapNoExtraKeys!6109 (array!86487 array!86485 (_ BitVec 32) (_ BitVec 32) V!51489 V!51489 (_ BitVec 32) Int) ListLongMap!20235)

(assert (=> b!1299466 (= lt!580916 (contains!8185 (+!4478 (+!4478 (getCurrentListMapNoExtraKeys!6109 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1299474 () Bool)

(assert (=> b!1299474 (= e!741343 tp_is_empty!34789)))

(declare-fun b!1299475 () Bool)

(declare-fun res!863554 () Bool)

(assert (=> b!1299475 (=> (not res!863554) (not e!741344))))

(assert (=> b!1299475 (= res!863554 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!109716 res!863556) b!1299472))

(assert (= (and b!1299472 res!863550) b!1299470))

(assert (= (and b!1299470 res!863549) b!1299465))

(assert (= (and b!1299465 res!863551) b!1299468))

(assert (= (and b!1299468 res!863548) b!1299473))

(assert (= (and b!1299473 res!863552) b!1299467))

(assert (= (and b!1299467 res!863553) b!1299469))

(assert (= (and b!1299469 res!863555) b!1299475))

(assert (= (and b!1299475 res!863554) b!1299466))

(assert (= (and b!1299464 condMapEmpty!53753) mapIsEmpty!53753))

(assert (= (and b!1299464 (not condMapEmpty!53753)) mapNonEmpty!53753))

(get-info :version)

(assert (= (and mapNonEmpty!53753 ((_ is ValueCellFull!16496) mapValue!53753)) b!1299474))

(assert (= (and b!1299464 ((_ is ValueCellFull!16496) mapDefault!53753)) b!1299471))

(assert (= start!109716 b!1299464))

(declare-fun m!1190181 () Bool)

(assert (=> b!1299465 m!1190181))

(declare-fun m!1190183 () Bool)

(assert (=> b!1299469 m!1190183))

(assert (=> b!1299469 m!1190183))

(declare-fun m!1190185 () Bool)

(assert (=> b!1299469 m!1190185))

(declare-fun m!1190187 () Bool)

(assert (=> b!1299473 m!1190187))

(assert (=> b!1299473 m!1190187))

(declare-fun m!1190189 () Bool)

(assert (=> b!1299473 m!1190189))

(declare-fun m!1190191 () Bool)

(assert (=> mapNonEmpty!53753 m!1190191))

(declare-fun m!1190193 () Bool)

(assert (=> start!109716 m!1190193))

(declare-fun m!1190195 () Bool)

(assert (=> start!109716 m!1190195))

(declare-fun m!1190197 () Bool)

(assert (=> start!109716 m!1190197))

(declare-fun m!1190199 () Bool)

(assert (=> b!1299466 m!1190199))

(assert (=> b!1299466 m!1190199))

(declare-fun m!1190201 () Bool)

(assert (=> b!1299466 m!1190201))

(assert (=> b!1299466 m!1190201))

(declare-fun m!1190203 () Bool)

(assert (=> b!1299466 m!1190203))

(assert (=> b!1299466 m!1190203))

(declare-fun m!1190205 () Bool)

(assert (=> b!1299466 m!1190205))

(declare-fun m!1190207 () Bool)

(assert (=> b!1299470 m!1190207))

(check-sat (not mapNonEmpty!53753) (not start!109716) b_and!47233 (not b!1299470) (not b!1299466) (not b!1299465) tp_is_empty!34789 (not b!1299469) (not b!1299473) (not b_next!29149))
(check-sat b_and!47233 (not b_next!29149))
