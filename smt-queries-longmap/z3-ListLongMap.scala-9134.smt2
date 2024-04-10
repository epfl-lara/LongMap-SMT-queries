; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109590 () Bool)

(assert start!109590)

(declare-fun b_free!29079 () Bool)

(declare-fun b_next!29079 () Bool)

(assert (=> start!109590 (= b_free!29079 (not b_next!29079))))

(declare-fun tp!102355 () Bool)

(declare-fun b_and!47169 () Bool)

(assert (=> start!109590 (= tp!102355 b_and!47169)))

(declare-fun mapIsEmpty!53639 () Bool)

(declare-fun mapRes!53639 () Bool)

(assert (=> mapIsEmpty!53639 mapRes!53639))

(declare-fun b!1298047 () Bool)

(declare-fun e!740567 () Bool)

(declare-fun e!740565 () Bool)

(assert (=> b!1298047 (= e!740567 (and e!740565 mapRes!53639))))

(declare-fun condMapEmpty!53639 () Bool)

(declare-datatypes ((V!51395 0))(
  ( (V!51396 (val!17434 Int)) )
))
(declare-datatypes ((ValueCell!16461 0))(
  ( (ValueCellFull!16461 (v!20037 V!51395)) (EmptyCell!16461) )
))
(declare-datatypes ((array!86444 0))(
  ( (array!86445 (arr!41723 (Array (_ BitVec 32) ValueCell!16461)) (size!42273 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86444)

(declare-fun mapDefault!53639 () ValueCell!16461)

(assert (=> b!1298047 (= condMapEmpty!53639 (= (arr!41723 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16461)) mapDefault!53639)))))

(declare-fun b!1298048 () Bool)

(declare-fun res!862652 () Bool)

(declare-fun e!740564 () Bool)

(assert (=> b!1298048 (=> (not res!862652) (not e!740564))))

(declare-fun minValue!1387 () V!51395)

(declare-fun zeroValue!1387 () V!51395)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86446 0))(
  ( (array!86447 (arr!41724 (Array (_ BitVec 32) (_ BitVec 64))) (size!42274 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86446)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22474 0))(
  ( (tuple2!22475 (_1!11248 (_ BitVec 64)) (_2!11248 V!51395)) )
))
(declare-datatypes ((List!29605 0))(
  ( (Nil!29602) (Cons!29601 (h!30810 tuple2!22474) (t!43169 List!29605)) )
))
(declare-datatypes ((ListLongMap!20131 0))(
  ( (ListLongMap!20132 (toList!10081 List!29605)) )
))
(declare-fun contains!8199 (ListLongMap!20131 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5110 (array!86446 array!86444 (_ BitVec 32) (_ BitVec 32) V!51395 V!51395 (_ BitVec 32) Int) ListLongMap!20131)

(assert (=> b!1298048 (= res!862652 (contains!8199 (getCurrentListMap!5110 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53639 () Bool)

(declare-fun tp!102356 () Bool)

(declare-fun e!740563 () Bool)

(assert (=> mapNonEmpty!53639 (= mapRes!53639 (and tp!102356 e!740563))))

(declare-fun mapValue!53639 () ValueCell!16461)

(declare-fun mapKey!53639 () (_ BitVec 32))

(declare-fun mapRest!53639 () (Array (_ BitVec 32) ValueCell!16461))

(assert (=> mapNonEmpty!53639 (= (arr!41723 _values!1445) (store mapRest!53639 mapKey!53639 mapValue!53639))))

(declare-fun b!1298049 () Bool)

(declare-fun tp_is_empty!34719 () Bool)

(assert (=> b!1298049 (= e!740565 tp_is_empty!34719)))

(declare-fun res!862649 () Bool)

(assert (=> start!109590 (=> (not res!862649) (not e!740564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109590 (= res!862649 (validMask!0 mask!2175))))

(assert (=> start!109590 e!740564))

(assert (=> start!109590 tp_is_empty!34719))

(assert (=> start!109590 true))

(declare-fun array_inv!31579 (array!86444) Bool)

(assert (=> start!109590 (and (array_inv!31579 _values!1445) e!740567)))

(declare-fun array_inv!31580 (array!86446) Bool)

(assert (=> start!109590 (array_inv!31580 _keys!1741)))

(assert (=> start!109590 tp!102355))

(declare-fun b!1298050 () Bool)

(assert (=> b!1298050 (= e!740564 (not true))))

(assert (=> b!1298050 (contains!8199 (getCurrentListMap!5110 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42975 0))(
  ( (Unit!42976) )
))
(declare-fun lt!580664 () Unit!42975)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!40 (array!86446 array!86444 (_ BitVec 32) (_ BitVec 32) V!51395 V!51395 (_ BitVec 64) (_ BitVec 32) Int) Unit!42975)

(assert (=> b!1298050 (= lt!580664 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!40 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298051 () Bool)

(declare-fun res!862648 () Bool)

(assert (=> b!1298051 (=> (not res!862648) (not e!740564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86446 (_ BitVec 32)) Bool)

(assert (=> b!1298051 (= res!862648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298052 () Bool)

(declare-fun res!862653 () Bool)

(assert (=> b!1298052 (=> (not res!862653) (not e!740564))))

(declare-datatypes ((List!29606 0))(
  ( (Nil!29603) (Cons!29602 (h!30811 (_ BitVec 64)) (t!43170 List!29606)) )
))
(declare-fun arrayNoDuplicates!0 (array!86446 (_ BitVec 32) List!29606) Bool)

(assert (=> b!1298052 (= res!862653 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29603))))

(declare-fun b!1298053 () Bool)

(declare-fun res!862651 () Bool)

(assert (=> b!1298053 (=> (not res!862651) (not e!740564))))

(assert (=> b!1298053 (= res!862651 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42274 _keys!1741))))))

(declare-fun b!1298054 () Bool)

(declare-fun res!862650 () Bool)

(assert (=> b!1298054 (=> (not res!862650) (not e!740564))))

(assert (=> b!1298054 (= res!862650 (and (= (size!42273 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42274 _keys!1741) (size!42273 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298055 () Bool)

(assert (=> b!1298055 (= e!740563 tp_is_empty!34719)))

(declare-fun b!1298056 () Bool)

(declare-fun res!862647 () Bool)

(assert (=> b!1298056 (=> (not res!862647) (not e!740564))))

(assert (=> b!1298056 (= res!862647 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42274 _keys!1741)) (not (= (select (arr!41724 _keys!1741) from!2144) k0!1205))))))

(assert (= (and start!109590 res!862649) b!1298054))

(assert (= (and b!1298054 res!862650) b!1298051))

(assert (= (and b!1298051 res!862648) b!1298052))

(assert (= (and b!1298052 res!862653) b!1298053))

(assert (= (and b!1298053 res!862651) b!1298048))

(assert (= (and b!1298048 res!862652) b!1298056))

(assert (= (and b!1298056 res!862647) b!1298050))

(assert (= (and b!1298047 condMapEmpty!53639) mapIsEmpty!53639))

(assert (= (and b!1298047 (not condMapEmpty!53639)) mapNonEmpty!53639))

(get-info :version)

(assert (= (and mapNonEmpty!53639 ((_ is ValueCellFull!16461) mapValue!53639)) b!1298055))

(assert (= (and b!1298047 ((_ is ValueCellFull!16461) mapDefault!53639)) b!1298049))

(assert (= start!109590 b!1298047))

(declare-fun m!1189475 () Bool)

(assert (=> b!1298052 m!1189475))

(declare-fun m!1189477 () Bool)

(assert (=> b!1298051 m!1189477))

(declare-fun m!1189479 () Bool)

(assert (=> b!1298056 m!1189479))

(declare-fun m!1189481 () Bool)

(assert (=> b!1298048 m!1189481))

(assert (=> b!1298048 m!1189481))

(declare-fun m!1189483 () Bool)

(assert (=> b!1298048 m!1189483))

(declare-fun m!1189485 () Bool)

(assert (=> start!109590 m!1189485))

(declare-fun m!1189487 () Bool)

(assert (=> start!109590 m!1189487))

(declare-fun m!1189489 () Bool)

(assert (=> start!109590 m!1189489))

(declare-fun m!1189491 () Bool)

(assert (=> mapNonEmpty!53639 m!1189491))

(declare-fun m!1189493 () Bool)

(assert (=> b!1298050 m!1189493))

(assert (=> b!1298050 m!1189493))

(declare-fun m!1189495 () Bool)

(assert (=> b!1298050 m!1189495))

(declare-fun m!1189497 () Bool)

(assert (=> b!1298050 m!1189497))

(check-sat (not b_next!29079) (not start!109590) (not b!1298051) tp_is_empty!34719 (not b!1298048) (not b!1298050) (not b!1298052) (not mapNonEmpty!53639) b_and!47169)
(check-sat b_and!47169 (not b_next!29079))
