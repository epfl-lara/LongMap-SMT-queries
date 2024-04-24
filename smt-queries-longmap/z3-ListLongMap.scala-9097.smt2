; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109590 () Bool)

(assert start!109590)

(declare-fun b_free!28855 () Bool)

(declare-fun b_next!28855 () Bool)

(assert (=> start!109590 (= b_free!28855 (not b_next!28855))))

(declare-fun tp!101683 () Bool)

(declare-fun b_and!46947 () Bool)

(assert (=> start!109590 (= tp!101683 b_and!46947)))

(declare-fun b!1295841 () Bool)

(declare-fun res!860827 () Bool)

(declare-fun e!739544 () Bool)

(assert (=> b!1295841 (=> (not res!860827) (not e!739544))))

(declare-datatypes ((array!86045 0))(
  ( (array!86046 (arr!41519 (Array (_ BitVec 32) (_ BitVec 64))) (size!42070 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86045)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295841 (= res!860827 (not (validKeyInArray!0 (select (arr!41519 _keys!1741) from!2144))))))

(declare-fun b!1295842 () Bool)

(declare-fun e!739545 () Bool)

(declare-fun tp_is_empty!34495 () Bool)

(assert (=> b!1295842 (= e!739545 tp_is_empty!34495)))

(declare-fun res!860832 () Bool)

(assert (=> start!109590 (=> (not res!860832) (not e!739544))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109590 (= res!860832 (validMask!0 mask!2175))))

(assert (=> start!109590 e!739544))

(assert (=> start!109590 tp_is_empty!34495))

(assert (=> start!109590 true))

(declare-datatypes ((V!51097 0))(
  ( (V!51098 (val!17322 Int)) )
))
(declare-datatypes ((ValueCell!16349 0))(
  ( (ValueCellFull!16349 (v!19920 V!51097)) (EmptyCell!16349) )
))
(declare-datatypes ((array!86047 0))(
  ( (array!86048 (arr!41520 (Array (_ BitVec 32) ValueCell!16349)) (size!42071 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86047)

(declare-fun e!739543 () Bool)

(declare-fun array_inv!31675 (array!86047) Bool)

(assert (=> start!109590 (and (array_inv!31675 _values!1445) e!739543)))

(declare-fun array_inv!31676 (array!86045) Bool)

(assert (=> start!109590 (array_inv!31676 _keys!1741)))

(assert (=> start!109590 tp!101683))

(declare-fun b!1295843 () Bool)

(declare-fun res!860831 () Bool)

(assert (=> b!1295843 (=> (not res!860831) (not e!739544))))

(declare-datatypes ((List!29473 0))(
  ( (Nil!29470) (Cons!29469 (h!30687 (_ BitVec 64)) (t!43029 List!29473)) )
))
(declare-fun arrayNoDuplicates!0 (array!86045 (_ BitVec 32) List!29473) Bool)

(assert (=> b!1295843 (= res!860831 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29470))))

(declare-fun b!1295844 () Bool)

(declare-fun e!739542 () Bool)

(assert (=> b!1295844 (= e!739542 tp_is_empty!34495)))

(declare-fun b!1295845 () Bool)

(declare-fun mapRes!53303 () Bool)

(assert (=> b!1295845 (= e!739543 (and e!739542 mapRes!53303))))

(declare-fun condMapEmpty!53303 () Bool)

(declare-fun mapDefault!53303 () ValueCell!16349)

(assert (=> b!1295845 (= condMapEmpty!53303 (= (arr!41520 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16349)) mapDefault!53303)))))

(declare-fun b!1295846 () Bool)

(declare-fun res!860828 () Bool)

(assert (=> b!1295846 (=> (not res!860828) (not e!739544))))

(assert (=> b!1295846 (= res!860828 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42070 _keys!1741))))))

(declare-fun b!1295847 () Bool)

(declare-fun res!860826 () Bool)

(assert (=> b!1295847 (=> (not res!860826) (not e!739544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86045 (_ BitVec 32)) Bool)

(assert (=> b!1295847 (= res!860826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295848 () Bool)

(declare-fun res!860830 () Bool)

(assert (=> b!1295848 (=> (not res!860830) (not e!739544))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295848 (= res!860830 (and (= (size!42071 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42070 _keys!1741) (size!42071 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295849 () Bool)

(declare-fun res!860833 () Bool)

(assert (=> b!1295849 (=> (not res!860833) (not e!739544))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1295849 (= res!860833 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42070 _keys!1741))))))

(declare-fun b!1295850 () Bool)

(declare-fun res!860829 () Bool)

(assert (=> b!1295850 (=> (not res!860829) (not e!739544))))

(declare-fun minValue!1387 () V!51097)

(declare-fun zeroValue!1387 () V!51097)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22304 0))(
  ( (tuple2!22305 (_1!11163 (_ BitVec 64)) (_2!11163 V!51097)) )
))
(declare-datatypes ((List!29474 0))(
  ( (Nil!29471) (Cons!29470 (h!30688 tuple2!22304) (t!43030 List!29474)) )
))
(declare-datatypes ((ListLongMap!19969 0))(
  ( (ListLongMap!19970 (toList!10000 List!29474)) )
))
(declare-fun contains!8131 (ListLongMap!19969 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5027 (array!86045 array!86047 (_ BitVec 32) (_ BitVec 32) V!51097 V!51097 (_ BitVec 32) Int) ListLongMap!19969)

(assert (=> b!1295850 (= res!860829 (contains!8131 (getCurrentListMap!5027 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53303 () Bool)

(declare-fun tp!101684 () Bool)

(assert (=> mapNonEmpty!53303 (= mapRes!53303 (and tp!101684 e!739545))))

(declare-fun mapRest!53303 () (Array (_ BitVec 32) ValueCell!16349))

(declare-fun mapKey!53303 () (_ BitVec 32))

(declare-fun mapValue!53303 () ValueCell!16349)

(assert (=> mapNonEmpty!53303 (= (arr!41520 _values!1445) (store mapRest!53303 mapKey!53303 mapValue!53303))))

(declare-fun b!1295851 () Bool)

(assert (=> b!1295851 (= e!739544 (not true))))

(assert (=> b!1295851 (not (contains!8131 (ListLongMap!19970 Nil!29471) k0!1205))))

(declare-datatypes ((Unit!42833 0))(
  ( (Unit!42834) )
))
(declare-fun lt!580209 () Unit!42833)

(declare-fun emptyContainsNothing!159 ((_ BitVec 64)) Unit!42833)

(assert (=> b!1295851 (= lt!580209 (emptyContainsNothing!159 k0!1205))))

(declare-fun mapIsEmpty!53303 () Bool)

(assert (=> mapIsEmpty!53303 mapRes!53303))

(assert (= (and start!109590 res!860832) b!1295848))

(assert (= (and b!1295848 res!860830) b!1295847))

(assert (= (and b!1295847 res!860826) b!1295843))

(assert (= (and b!1295843 res!860831) b!1295846))

(assert (= (and b!1295846 res!860828) b!1295850))

(assert (= (and b!1295850 res!860829) b!1295849))

(assert (= (and b!1295849 res!860833) b!1295841))

(assert (= (and b!1295841 res!860827) b!1295851))

(assert (= (and b!1295845 condMapEmpty!53303) mapIsEmpty!53303))

(assert (= (and b!1295845 (not condMapEmpty!53303)) mapNonEmpty!53303))

(get-info :version)

(assert (= (and mapNonEmpty!53303 ((_ is ValueCellFull!16349) mapValue!53303)) b!1295842))

(assert (= (and b!1295845 ((_ is ValueCellFull!16349) mapDefault!53303)) b!1295844))

(assert (= start!109590 b!1295845))

(declare-fun m!1188333 () Bool)

(assert (=> b!1295843 m!1188333))

(declare-fun m!1188335 () Bool)

(assert (=> b!1295841 m!1188335))

(assert (=> b!1295841 m!1188335))

(declare-fun m!1188337 () Bool)

(assert (=> b!1295841 m!1188337))

(declare-fun m!1188339 () Bool)

(assert (=> b!1295847 m!1188339))

(declare-fun m!1188341 () Bool)

(assert (=> b!1295850 m!1188341))

(assert (=> b!1295850 m!1188341))

(declare-fun m!1188343 () Bool)

(assert (=> b!1295850 m!1188343))

(declare-fun m!1188345 () Bool)

(assert (=> mapNonEmpty!53303 m!1188345))

(declare-fun m!1188347 () Bool)

(assert (=> start!109590 m!1188347))

(declare-fun m!1188349 () Bool)

(assert (=> start!109590 m!1188349))

(declare-fun m!1188351 () Bool)

(assert (=> start!109590 m!1188351))

(declare-fun m!1188353 () Bool)

(assert (=> b!1295851 m!1188353))

(declare-fun m!1188355 () Bool)

(assert (=> b!1295851 m!1188355))

(check-sat (not b!1295841) (not b!1295850) tp_is_empty!34495 b_and!46947 (not b!1295851) (not b!1295847) (not mapNonEmpty!53303) (not b!1295843) (not b_next!28855) (not start!109590))
(check-sat b_and!46947 (not b_next!28855))
