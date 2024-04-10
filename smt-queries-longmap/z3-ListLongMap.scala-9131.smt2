; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109572 () Bool)

(assert start!109572)

(declare-fun b_free!29061 () Bool)

(declare-fun b_next!29061 () Bool)

(assert (=> start!109572 (= b_free!29061 (not b_next!29061))))

(declare-fun tp!102302 () Bool)

(declare-fun b_and!47151 () Bool)

(assert (=> start!109572 (= tp!102302 b_and!47151)))

(declare-fun res!862463 () Bool)

(declare-fun e!740428 () Bool)

(assert (=> start!109572 (=> (not res!862463) (not e!740428))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109572 (= res!862463 (validMask!0 mask!2175))))

(assert (=> start!109572 e!740428))

(declare-fun tp_is_empty!34701 () Bool)

(assert (=> start!109572 tp_is_empty!34701))

(assert (=> start!109572 true))

(declare-datatypes ((V!51371 0))(
  ( (V!51372 (val!17425 Int)) )
))
(declare-datatypes ((ValueCell!16452 0))(
  ( (ValueCellFull!16452 (v!20028 V!51371)) (EmptyCell!16452) )
))
(declare-datatypes ((array!86410 0))(
  ( (array!86411 (arr!41706 (Array (_ BitVec 32) ValueCell!16452)) (size!42256 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86410)

(declare-fun e!740431 () Bool)

(declare-fun array_inv!31567 (array!86410) Bool)

(assert (=> start!109572 (and (array_inv!31567 _values!1445) e!740431)))

(declare-datatypes ((array!86412 0))(
  ( (array!86413 (arr!41707 (Array (_ BitVec 32) (_ BitVec 64))) (size!42257 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86412)

(declare-fun array_inv!31568 (array!86412) Bool)

(assert (=> start!109572 (array_inv!31568 _keys!1741)))

(assert (=> start!109572 tp!102302))

(declare-fun b!1297777 () Bool)

(declare-fun e!740429 () Bool)

(declare-fun mapRes!53612 () Bool)

(assert (=> b!1297777 (= e!740431 (and e!740429 mapRes!53612))))

(declare-fun condMapEmpty!53612 () Bool)

(declare-fun mapDefault!53612 () ValueCell!16452)

(assert (=> b!1297777 (= condMapEmpty!53612 (= (arr!41706 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16452)) mapDefault!53612)))))

(declare-fun b!1297778 () Bool)

(declare-fun res!862464 () Bool)

(assert (=> b!1297778 (=> (not res!862464) (not e!740428))))

(declare-fun minValue!1387 () V!51371)

(declare-fun zeroValue!1387 () V!51371)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22458 0))(
  ( (tuple2!22459 (_1!11240 (_ BitVec 64)) (_2!11240 V!51371)) )
))
(declare-datatypes ((List!29591 0))(
  ( (Nil!29588) (Cons!29587 (h!30796 tuple2!22458) (t!43155 List!29591)) )
))
(declare-datatypes ((ListLongMap!20115 0))(
  ( (ListLongMap!20116 (toList!10073 List!29591)) )
))
(declare-fun contains!8191 (ListLongMap!20115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5102 (array!86412 array!86410 (_ BitVec 32) (_ BitVec 32) V!51371 V!51371 (_ BitVec 32) Int) ListLongMap!20115)

(assert (=> b!1297778 (= res!862464 (contains!8191 (getCurrentListMap!5102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297779 () Bool)

(declare-fun res!862461 () Bool)

(assert (=> b!1297779 (=> (not res!862461) (not e!740428))))

(assert (=> b!1297779 (= res!862461 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42257 _keys!1741))))))

(declare-fun b!1297780 () Bool)

(declare-fun res!862459 () Bool)

(assert (=> b!1297780 (=> (not res!862459) (not e!740428))))

(assert (=> b!1297780 (= res!862459 (and (= (size!42256 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42257 _keys!1741) (size!42256 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297781 () Bool)

(assert (=> b!1297781 (= e!740429 tp_is_empty!34701)))

(declare-fun b!1297782 () Bool)

(declare-fun res!862462 () Bool)

(assert (=> b!1297782 (=> (not res!862462) (not e!740428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86412 (_ BitVec 32)) Bool)

(assert (=> b!1297782 (= res!862462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297783 () Bool)

(assert (=> b!1297783 (= e!740428 (not true))))

(assert (=> b!1297783 (contains!8191 (getCurrentListMap!5102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42959 0))(
  ( (Unit!42960) )
))
(declare-fun lt!580637 () Unit!42959)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!32 (array!86412 array!86410 (_ BitVec 32) (_ BitVec 32) V!51371 V!51371 (_ BitVec 64) (_ BitVec 32) Int) Unit!42959)

(assert (=> b!1297783 (= lt!580637 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!32 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1297784 () Bool)

(declare-fun res!862458 () Bool)

(assert (=> b!1297784 (=> (not res!862458) (not e!740428))))

(declare-datatypes ((List!29592 0))(
  ( (Nil!29589) (Cons!29588 (h!30797 (_ BitVec 64)) (t!43156 List!29592)) )
))
(declare-fun arrayNoDuplicates!0 (array!86412 (_ BitVec 32) List!29592) Bool)

(assert (=> b!1297784 (= res!862458 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29589))))

(declare-fun mapIsEmpty!53612 () Bool)

(assert (=> mapIsEmpty!53612 mapRes!53612))

(declare-fun b!1297785 () Bool)

(declare-fun res!862460 () Bool)

(assert (=> b!1297785 (=> (not res!862460) (not e!740428))))

(assert (=> b!1297785 (= res!862460 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42257 _keys!1741)) (not (= (select (arr!41707 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1297786 () Bool)

(declare-fun e!740432 () Bool)

(assert (=> b!1297786 (= e!740432 tp_is_empty!34701)))

(declare-fun mapNonEmpty!53612 () Bool)

(declare-fun tp!102301 () Bool)

(assert (=> mapNonEmpty!53612 (= mapRes!53612 (and tp!102301 e!740432))))

(declare-fun mapValue!53612 () ValueCell!16452)

(declare-fun mapKey!53612 () (_ BitVec 32))

(declare-fun mapRest!53612 () (Array (_ BitVec 32) ValueCell!16452))

(assert (=> mapNonEmpty!53612 (= (arr!41706 _values!1445) (store mapRest!53612 mapKey!53612 mapValue!53612))))

(assert (= (and start!109572 res!862463) b!1297780))

(assert (= (and b!1297780 res!862459) b!1297782))

(assert (= (and b!1297782 res!862462) b!1297784))

(assert (= (and b!1297784 res!862458) b!1297779))

(assert (= (and b!1297779 res!862461) b!1297778))

(assert (= (and b!1297778 res!862464) b!1297785))

(assert (= (and b!1297785 res!862460) b!1297783))

(assert (= (and b!1297777 condMapEmpty!53612) mapIsEmpty!53612))

(assert (= (and b!1297777 (not condMapEmpty!53612)) mapNonEmpty!53612))

(get-info :version)

(assert (= (and mapNonEmpty!53612 ((_ is ValueCellFull!16452) mapValue!53612)) b!1297786))

(assert (= (and b!1297777 ((_ is ValueCellFull!16452) mapDefault!53612)) b!1297781))

(assert (= start!109572 b!1297777))

(declare-fun m!1189259 () Bool)

(assert (=> b!1297783 m!1189259))

(assert (=> b!1297783 m!1189259))

(declare-fun m!1189261 () Bool)

(assert (=> b!1297783 m!1189261))

(declare-fun m!1189263 () Bool)

(assert (=> b!1297783 m!1189263))

(declare-fun m!1189265 () Bool)

(assert (=> mapNonEmpty!53612 m!1189265))

(declare-fun m!1189267 () Bool)

(assert (=> start!109572 m!1189267))

(declare-fun m!1189269 () Bool)

(assert (=> start!109572 m!1189269))

(declare-fun m!1189271 () Bool)

(assert (=> start!109572 m!1189271))

(declare-fun m!1189273 () Bool)

(assert (=> b!1297784 m!1189273))

(declare-fun m!1189275 () Bool)

(assert (=> b!1297785 m!1189275))

(declare-fun m!1189277 () Bool)

(assert (=> b!1297778 m!1189277))

(assert (=> b!1297778 m!1189277))

(declare-fun m!1189279 () Bool)

(assert (=> b!1297778 m!1189279))

(declare-fun m!1189281 () Bool)

(assert (=> b!1297782 m!1189281))

(check-sat (not b!1297782) (not b!1297778) (not b_next!29061) tp_is_empty!34701 b_and!47151 (not b!1297783) (not mapNonEmpty!53612) (not start!109572) (not b!1297784))
(check-sat b_and!47151 (not b_next!29061))
