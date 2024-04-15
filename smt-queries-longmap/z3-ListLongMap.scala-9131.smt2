; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109570 () Bool)

(assert start!109570)

(declare-fun b_free!29059 () Bool)

(declare-fun b_next!29059 () Bool)

(assert (=> start!109570 (= b_free!29059 (not b_next!29059))))

(declare-fun tp!102296 () Bool)

(declare-fun b_and!47131 () Bool)

(assert (=> start!109570 (= tp!102296 b_and!47131)))

(declare-fun b!1297683 () Bool)

(declare-fun e!740385 () Bool)

(declare-fun tp_is_empty!34699 () Bool)

(assert (=> b!1297683 (= e!740385 tp_is_empty!34699)))

(declare-fun b!1297684 () Bool)

(declare-fun res!862413 () Bool)

(declare-fun e!740388 () Bool)

(assert (=> b!1297684 (=> (not res!862413) (not e!740388))))

(declare-datatypes ((array!86299 0))(
  ( (array!86300 (arr!41651 (Array (_ BitVec 32) (_ BitVec 64))) (size!42203 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86299)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86299 (_ BitVec 32)) Bool)

(assert (=> b!1297684 (= res!862413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53609 () Bool)

(declare-fun mapRes!53609 () Bool)

(declare-fun tp!102297 () Bool)

(declare-fun e!740387 () Bool)

(assert (=> mapNonEmpty!53609 (= mapRes!53609 (and tp!102297 e!740387))))

(declare-datatypes ((V!51369 0))(
  ( (V!51370 (val!17424 Int)) )
))
(declare-datatypes ((ValueCell!16451 0))(
  ( (ValueCellFull!16451 (v!20026 V!51369)) (EmptyCell!16451) )
))
(declare-fun mapValue!53609 () ValueCell!16451)

(declare-fun mapKey!53609 () (_ BitVec 32))

(declare-fun mapRest!53609 () (Array (_ BitVec 32) ValueCell!16451))

(declare-datatypes ((array!86301 0))(
  ( (array!86302 (arr!41652 (Array (_ BitVec 32) ValueCell!16451)) (size!42204 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86301)

(assert (=> mapNonEmpty!53609 (= (arr!41652 _values!1445) (store mapRest!53609 mapKey!53609 mapValue!53609))))

(declare-fun res!862416 () Bool)

(assert (=> start!109570 (=> (not res!862416) (not e!740388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109570 (= res!862416 (validMask!0 mask!2175))))

(assert (=> start!109570 e!740388))

(assert (=> start!109570 tp_is_empty!34699))

(assert (=> start!109570 true))

(declare-fun e!740386 () Bool)

(declare-fun array_inv!31685 (array!86301) Bool)

(assert (=> start!109570 (and (array_inv!31685 _values!1445) e!740386)))

(declare-fun array_inv!31686 (array!86299) Bool)

(assert (=> start!109570 (array_inv!31686 _keys!1741)))

(assert (=> start!109570 tp!102296))

(declare-fun b!1297685 () Bool)

(assert (=> b!1297685 (= e!740387 tp_is_empty!34699)))

(declare-fun b!1297686 () Bool)

(declare-fun res!862415 () Bool)

(assert (=> b!1297686 (=> (not res!862415) (not e!740388))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297686 (= res!862415 (and (= (size!42204 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42203 _keys!1741) (size!42204 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53609 () Bool)

(assert (=> mapIsEmpty!53609 mapRes!53609))

(declare-fun b!1297687 () Bool)

(declare-fun res!862412 () Bool)

(assert (=> b!1297687 (=> (not res!862412) (not e!740388))))

(declare-fun minValue!1387 () V!51369)

(declare-fun zeroValue!1387 () V!51369)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22506 0))(
  ( (tuple2!22507 (_1!11264 (_ BitVec 64)) (_2!11264 V!51369)) )
))
(declare-datatypes ((List!29631 0))(
  ( (Nil!29628) (Cons!29627 (h!30836 tuple2!22506) (t!43187 List!29631)) )
))
(declare-datatypes ((ListLongMap!20163 0))(
  ( (ListLongMap!20164 (toList!10097 List!29631)) )
))
(declare-fun contains!8145 (ListLongMap!20163 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5013 (array!86299 array!86301 (_ BitVec 32) (_ BitVec 32) V!51369 V!51369 (_ BitVec 32) Int) ListLongMap!20163)

(assert (=> b!1297687 (= res!862412 (contains!8145 (getCurrentListMap!5013 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297688 () Bool)

(declare-fun res!862414 () Bool)

(assert (=> b!1297688 (=> (not res!862414) (not e!740388))))

(assert (=> b!1297688 (= res!862414 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42203 _keys!1741)) (not (= (select (arr!41651 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1297689 () Bool)

(assert (=> b!1297689 (= e!740386 (and e!740385 mapRes!53609))))

(declare-fun condMapEmpty!53609 () Bool)

(declare-fun mapDefault!53609 () ValueCell!16451)

(assert (=> b!1297689 (= condMapEmpty!53609 (= (arr!41652 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16451)) mapDefault!53609)))))

(declare-fun b!1297690 () Bool)

(declare-fun res!862410 () Bool)

(assert (=> b!1297690 (=> (not res!862410) (not e!740388))))

(declare-datatypes ((List!29632 0))(
  ( (Nil!29629) (Cons!29628 (h!30837 (_ BitVec 64)) (t!43188 List!29632)) )
))
(declare-fun arrayNoDuplicates!0 (array!86299 (_ BitVec 32) List!29632) Bool)

(assert (=> b!1297690 (= res!862410 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29629))))

(declare-fun b!1297691 () Bool)

(assert (=> b!1297691 (= e!740388 (not true))))

(assert (=> b!1297691 (contains!8145 (getCurrentListMap!5013 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42804 0))(
  ( (Unit!42805) )
))
(declare-fun lt!580456 () Unit!42804)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!27 (array!86299 array!86301 (_ BitVec 32) (_ BitVec 32) V!51369 V!51369 (_ BitVec 64) (_ BitVec 32) Int) Unit!42804)

(assert (=> b!1297691 (= lt!580456 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!27 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1297692 () Bool)

(declare-fun res!862411 () Bool)

(assert (=> b!1297692 (=> (not res!862411) (not e!740388))))

(assert (=> b!1297692 (= res!862411 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42203 _keys!1741))))))

(assert (= (and start!109570 res!862416) b!1297686))

(assert (= (and b!1297686 res!862415) b!1297684))

(assert (= (and b!1297684 res!862413) b!1297690))

(assert (= (and b!1297690 res!862410) b!1297692))

(assert (= (and b!1297692 res!862411) b!1297687))

(assert (= (and b!1297687 res!862412) b!1297688))

(assert (= (and b!1297688 res!862414) b!1297691))

(assert (= (and b!1297689 condMapEmpty!53609) mapIsEmpty!53609))

(assert (= (and b!1297689 (not condMapEmpty!53609)) mapNonEmpty!53609))

(get-info :version)

(assert (= (and mapNonEmpty!53609 ((_ is ValueCellFull!16451) mapValue!53609)) b!1297685))

(assert (= (and b!1297689 ((_ is ValueCellFull!16451) mapDefault!53609)) b!1297683))

(assert (= start!109570 b!1297689))

(declare-fun m!1188735 () Bool)

(assert (=> b!1297687 m!1188735))

(assert (=> b!1297687 m!1188735))

(declare-fun m!1188737 () Bool)

(assert (=> b!1297687 m!1188737))

(declare-fun m!1188739 () Bool)

(assert (=> b!1297691 m!1188739))

(assert (=> b!1297691 m!1188739))

(declare-fun m!1188741 () Bool)

(assert (=> b!1297691 m!1188741))

(declare-fun m!1188743 () Bool)

(assert (=> b!1297691 m!1188743))

(declare-fun m!1188745 () Bool)

(assert (=> b!1297688 m!1188745))

(declare-fun m!1188747 () Bool)

(assert (=> b!1297690 m!1188747))

(declare-fun m!1188749 () Bool)

(assert (=> start!109570 m!1188749))

(declare-fun m!1188751 () Bool)

(assert (=> start!109570 m!1188751))

(declare-fun m!1188753 () Bool)

(assert (=> start!109570 m!1188753))

(declare-fun m!1188755 () Bool)

(assert (=> mapNonEmpty!53609 m!1188755))

(declare-fun m!1188757 () Bool)

(assert (=> b!1297684 m!1188757))

(check-sat (not mapNonEmpty!53609) b_and!47131 (not b!1297690) (not start!109570) tp_is_empty!34699 (not b_next!29059) (not b!1297691) (not b!1297687) (not b!1297684))
(check-sat b_and!47131 (not b_next!29059))
