; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109842 () Bool)

(assert start!109842)

(declare-fun b_free!29107 () Bool)

(declare-fun b_next!29107 () Bool)

(assert (=> start!109842 (= b_free!29107 (not b_next!29107))))

(declare-fun tp!102440 () Bool)

(declare-fun b_and!47199 () Bool)

(assert (=> start!109842 (= tp!102440 b_and!47199)))

(declare-fun b!1299772 () Bool)

(declare-fun res!863461 () Bool)

(declare-fun e!741621 () Bool)

(assert (=> b!1299772 (=> (not res!863461) (not e!741621))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86539 0))(
  ( (array!86540 (arr!41766 (Array (_ BitVec 32) (_ BitVec 64))) (size!42317 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86539)

(assert (=> b!1299772 (= res!863461 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42317 _keys!1741)) (not (= (select (arr!41766 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1299773 () Bool)

(declare-fun e!741623 () Bool)

(declare-fun tp_is_empty!34747 () Bool)

(assert (=> b!1299773 (= e!741623 tp_is_empty!34747)))

(declare-fun b!1299774 () Bool)

(declare-fun e!741624 () Bool)

(declare-fun mapRes!53681 () Bool)

(assert (=> b!1299774 (= e!741624 (and e!741623 mapRes!53681))))

(declare-fun condMapEmpty!53681 () Bool)

(declare-datatypes ((V!51433 0))(
  ( (V!51434 (val!17448 Int)) )
))
(declare-datatypes ((ValueCell!16475 0))(
  ( (ValueCellFull!16475 (v!20046 V!51433)) (EmptyCell!16475) )
))
(declare-datatypes ((array!86541 0))(
  ( (array!86542 (arr!41767 (Array (_ BitVec 32) ValueCell!16475)) (size!42318 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86541)

(declare-fun mapDefault!53681 () ValueCell!16475)

(assert (=> b!1299774 (= condMapEmpty!53681 (= (arr!41767 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16475)) mapDefault!53681)))))

(declare-fun mapIsEmpty!53681 () Bool)

(assert (=> mapIsEmpty!53681 mapRes!53681))

(declare-fun b!1299775 () Bool)

(declare-fun res!863466 () Bool)

(assert (=> b!1299775 (=> (not res!863466) (not e!741621))))

(assert (=> b!1299775 (= res!863466 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42317 _keys!1741))))))

(declare-fun b!1299776 () Bool)

(declare-fun res!863465 () Bool)

(assert (=> b!1299776 (=> (not res!863465) (not e!741621))))

(declare-fun minValue!1387 () V!51433)

(declare-fun zeroValue!1387 () V!51433)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22508 0))(
  ( (tuple2!22509 (_1!11265 (_ BitVec 64)) (_2!11265 V!51433)) )
))
(declare-datatypes ((List!29667 0))(
  ( (Nil!29664) (Cons!29663 (h!30881 tuple2!22508) (t!43223 List!29667)) )
))
(declare-datatypes ((ListLongMap!20173 0))(
  ( (ListLongMap!20174 (toList!10102 List!29667)) )
))
(declare-fun contains!8232 (ListLongMap!20173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5121 (array!86539 array!86541 (_ BitVec 32) (_ BitVec 32) V!51433 V!51433 (_ BitVec 32) Int) ListLongMap!20173)

(assert (=> b!1299776 (= res!863465 (contains!8232 (getCurrentListMap!5121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299777 () Bool)

(declare-fun res!863462 () Bool)

(assert (=> b!1299777 (=> (not res!863462) (not e!741621))))

(declare-datatypes ((List!29668 0))(
  ( (Nil!29665) (Cons!29664 (h!30882 (_ BitVec 64)) (t!43224 List!29668)) )
))
(declare-fun arrayNoDuplicates!0 (array!86539 (_ BitVec 32) List!29668) Bool)

(assert (=> b!1299777 (= res!863462 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29665))))

(declare-fun mapNonEmpty!53681 () Bool)

(declare-fun tp!102439 () Bool)

(declare-fun e!741620 () Bool)

(assert (=> mapNonEmpty!53681 (= mapRes!53681 (and tp!102439 e!741620))))

(declare-fun mapValue!53681 () ValueCell!16475)

(declare-fun mapKey!53681 () (_ BitVec 32))

(declare-fun mapRest!53681 () (Array (_ BitVec 32) ValueCell!16475))

(assert (=> mapNonEmpty!53681 (= (arr!41767 _values!1445) (store mapRest!53681 mapKey!53681 mapValue!53681))))

(declare-fun b!1299778 () Bool)

(assert (=> b!1299778 (= e!741620 tp_is_empty!34747)))

(declare-fun b!1299780 () Bool)

(assert (=> b!1299780 (= e!741621 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000)))))

(assert (=> b!1299780 (contains!8232 (getCurrentListMap!5121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42957 0))(
  ( (Unit!42958) )
))
(declare-fun lt!581190 () Unit!42957)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!45 (array!86539 array!86541 (_ BitVec 32) (_ BitVec 32) V!51433 V!51433 (_ BitVec 64) (_ BitVec 32) Int) Unit!42957)

(assert (=> b!1299780 (= lt!581190 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!45 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1299781 () Bool)

(declare-fun res!863467 () Bool)

(assert (=> b!1299781 (=> (not res!863467) (not e!741621))))

(assert (=> b!1299781 (= res!863467 (and (= (size!42318 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42317 _keys!1741) (size!42318 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!863464 () Bool)

(assert (=> start!109842 (=> (not res!863464) (not e!741621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109842 (= res!863464 (validMask!0 mask!2175))))

(assert (=> start!109842 e!741621))

(assert (=> start!109842 tp_is_empty!34747))

(assert (=> start!109842 true))

(declare-fun array_inv!31843 (array!86541) Bool)

(assert (=> start!109842 (and (array_inv!31843 _values!1445) e!741624)))

(declare-fun array_inv!31844 (array!86539) Bool)

(assert (=> start!109842 (array_inv!31844 _keys!1741)))

(assert (=> start!109842 tp!102440))

(declare-fun b!1299779 () Bool)

(declare-fun res!863463 () Bool)

(assert (=> b!1299779 (=> (not res!863463) (not e!741621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86539 (_ BitVec 32)) Bool)

(assert (=> b!1299779 (= res!863463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109842 res!863464) b!1299781))

(assert (= (and b!1299781 res!863467) b!1299779))

(assert (= (and b!1299779 res!863463) b!1299777))

(assert (= (and b!1299777 res!863462) b!1299775))

(assert (= (and b!1299775 res!863466) b!1299776))

(assert (= (and b!1299776 res!863465) b!1299772))

(assert (= (and b!1299772 res!863461) b!1299780))

(assert (= (and b!1299774 condMapEmpty!53681) mapIsEmpty!53681))

(assert (= (and b!1299774 (not condMapEmpty!53681)) mapNonEmpty!53681))

(get-info :version)

(assert (= (and mapNonEmpty!53681 ((_ is ValueCellFull!16475) mapValue!53681)) b!1299778))

(assert (= (and b!1299774 ((_ is ValueCellFull!16475) mapDefault!53681)) b!1299773))

(assert (= start!109842 b!1299774))

(declare-fun m!1191429 () Bool)

(assert (=> start!109842 m!1191429))

(declare-fun m!1191431 () Bool)

(assert (=> start!109842 m!1191431))

(declare-fun m!1191433 () Bool)

(assert (=> start!109842 m!1191433))

(declare-fun m!1191435 () Bool)

(assert (=> b!1299772 m!1191435))

(declare-fun m!1191437 () Bool)

(assert (=> b!1299776 m!1191437))

(assert (=> b!1299776 m!1191437))

(declare-fun m!1191439 () Bool)

(assert (=> b!1299776 m!1191439))

(declare-fun m!1191441 () Bool)

(assert (=> b!1299780 m!1191441))

(assert (=> b!1299780 m!1191441))

(declare-fun m!1191443 () Bool)

(assert (=> b!1299780 m!1191443))

(declare-fun m!1191445 () Bool)

(assert (=> b!1299780 m!1191445))

(declare-fun m!1191447 () Bool)

(assert (=> b!1299777 m!1191447))

(declare-fun m!1191449 () Bool)

(assert (=> b!1299779 m!1191449))

(declare-fun m!1191451 () Bool)

(assert (=> mapNonEmpty!53681 m!1191451))

(check-sat tp_is_empty!34747 (not b!1299779) b_and!47199 (not mapNonEmpty!53681) (not b_next!29107) (not start!109842) (not b!1299780) (not b!1299776) (not b!1299777))
(check-sat b_and!47199 (not b_next!29107))
