; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108988 () Bool)

(assert start!108988)

(declare-fun b_free!28477 () Bool)

(declare-fun b_next!28477 () Bool)

(assert (=> start!108988 (= b_free!28477 (not b_next!28477))))

(declare-fun tp!100550 () Bool)

(declare-fun b_and!46549 () Bool)

(assert (=> start!108988 (= tp!100550 b_and!46549)))

(declare-fun b!1287830 () Bool)

(declare-fun res!855339 () Bool)

(declare-fun e!735425 () Bool)

(assert (=> b!1287830 (=> (not res!855339) (not e!735425))))

(declare-datatypes ((array!85171 0))(
  ( (array!85172 (arr!41087 (Array (_ BitVec 32) (_ BitVec 64))) (size!41639 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85171)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85171 (_ BitVec 32)) Bool)

(assert (=> b!1287830 (= res!855339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287831 () Bool)

(declare-fun res!855341 () Bool)

(assert (=> b!1287831 (=> (not res!855341) (not e!735425))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287831 (= res!855341 (not (validKeyInArray!0 (select (arr!41087 _keys!1741) from!2144))))))

(declare-fun b!1287832 () Bool)

(declare-fun res!855344 () Bool)

(assert (=> b!1287832 (=> (not res!855344) (not e!735425))))

(declare-datatypes ((List!29214 0))(
  ( (Nil!29211) (Cons!29210 (h!30419 (_ BitVec 64)) (t!42770 List!29214)) )
))
(declare-fun arrayNoDuplicates!0 (array!85171 (_ BitVec 32) List!29214) Bool)

(assert (=> b!1287832 (= res!855344 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29211))))

(declare-fun b!1287833 () Bool)

(declare-fun res!855338 () Bool)

(assert (=> b!1287833 (=> (not res!855338) (not e!735425))))

(assert (=> b!1287833 (= res!855338 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41639 _keys!1741))))))

(declare-fun mapNonEmpty!52736 () Bool)

(declare-fun mapRes!52736 () Bool)

(declare-fun tp!100551 () Bool)

(declare-fun e!735427 () Bool)

(assert (=> mapNonEmpty!52736 (= mapRes!52736 (and tp!100551 e!735427))))

(declare-datatypes ((V!50593 0))(
  ( (V!50594 (val!17133 Int)) )
))
(declare-datatypes ((ValueCell!16160 0))(
  ( (ValueCellFull!16160 (v!19735 V!50593)) (EmptyCell!16160) )
))
(declare-fun mapValue!52736 () ValueCell!16160)

(declare-fun mapRest!52736 () (Array (_ BitVec 32) ValueCell!16160))

(declare-datatypes ((array!85173 0))(
  ( (array!85174 (arr!41088 (Array (_ BitVec 32) ValueCell!16160)) (size!41640 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85173)

(declare-fun mapKey!52736 () (_ BitVec 32))

(assert (=> mapNonEmpty!52736 (= (arr!41088 _values!1445) (store mapRest!52736 mapKey!52736 mapValue!52736))))

(declare-fun b!1287834 () Bool)

(assert (=> b!1287834 (= e!735425 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22044 0))(
  ( (tuple2!22045 (_1!11033 (_ BitVec 64)) (_2!11033 V!50593)) )
))
(declare-datatypes ((List!29215 0))(
  ( (Nil!29212) (Cons!29211 (h!30420 tuple2!22044) (t!42771 List!29215)) )
))
(declare-datatypes ((ListLongMap!19701 0))(
  ( (ListLongMap!19702 (toList!9866 List!29215)) )
))
(declare-fun contains!7914 (ListLongMap!19701 (_ BitVec 64)) Bool)

(assert (=> b!1287834 (not (contains!7914 (ListLongMap!19702 Nil!29212) k0!1205))))

(declare-datatypes ((Unit!42438 0))(
  ( (Unit!42439) )
))
(declare-fun lt!577729 () Unit!42438)

(declare-fun emptyContainsNothing!26 ((_ BitVec 64)) Unit!42438)

(assert (=> b!1287834 (= lt!577729 (emptyContainsNothing!26 k0!1205))))

(declare-fun b!1287835 () Bool)

(declare-fun tp_is_empty!34117 () Bool)

(assert (=> b!1287835 (= e!735427 tp_is_empty!34117)))

(declare-fun b!1287836 () Bool)

(declare-fun res!855342 () Bool)

(assert (=> b!1287836 (=> (not res!855342) (not e!735425))))

(declare-fun minValue!1387 () V!50593)

(declare-fun zeroValue!1387 () V!50593)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4825 (array!85171 array!85173 (_ BitVec 32) (_ BitVec 32) V!50593 V!50593 (_ BitVec 32) Int) ListLongMap!19701)

(assert (=> b!1287836 (= res!855342 (contains!7914 (getCurrentListMap!4825 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287838 () Bool)

(declare-fun e!735429 () Bool)

(declare-fun e!735426 () Bool)

(assert (=> b!1287838 (= e!735429 (and e!735426 mapRes!52736))))

(declare-fun condMapEmpty!52736 () Bool)

(declare-fun mapDefault!52736 () ValueCell!16160)

(assert (=> b!1287838 (= condMapEmpty!52736 (= (arr!41088 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16160)) mapDefault!52736)))))

(declare-fun mapIsEmpty!52736 () Bool)

(assert (=> mapIsEmpty!52736 mapRes!52736))

(declare-fun res!855343 () Bool)

(assert (=> start!108988 (=> (not res!855343) (not e!735425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108988 (= res!855343 (validMask!0 mask!2175))))

(assert (=> start!108988 e!735425))

(assert (=> start!108988 tp_is_empty!34117))

(assert (=> start!108988 true))

(declare-fun array_inv!31311 (array!85173) Bool)

(assert (=> start!108988 (and (array_inv!31311 _values!1445) e!735429)))

(declare-fun array_inv!31312 (array!85171) Bool)

(assert (=> start!108988 (array_inv!31312 _keys!1741)))

(assert (=> start!108988 tp!100550))

(declare-fun b!1287837 () Bool)

(declare-fun res!855345 () Bool)

(assert (=> b!1287837 (=> (not res!855345) (not e!735425))))

(assert (=> b!1287837 (= res!855345 (and (= (size!41640 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41639 _keys!1741) (size!41640 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287839 () Bool)

(declare-fun res!855340 () Bool)

(assert (=> b!1287839 (=> (not res!855340) (not e!735425))))

(assert (=> b!1287839 (= res!855340 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41639 _keys!1741))))))

(declare-fun b!1287840 () Bool)

(assert (=> b!1287840 (= e!735426 tp_is_empty!34117)))

(assert (= (and start!108988 res!855343) b!1287837))

(assert (= (and b!1287837 res!855345) b!1287830))

(assert (= (and b!1287830 res!855339) b!1287832))

(assert (= (and b!1287832 res!855344) b!1287833))

(assert (= (and b!1287833 res!855338) b!1287836))

(assert (= (and b!1287836 res!855342) b!1287839))

(assert (= (and b!1287839 res!855340) b!1287831))

(assert (= (and b!1287831 res!855341) b!1287834))

(assert (= (and b!1287838 condMapEmpty!52736) mapIsEmpty!52736))

(assert (= (and b!1287838 (not condMapEmpty!52736)) mapNonEmpty!52736))

(get-info :version)

(assert (= (and mapNonEmpty!52736 ((_ is ValueCellFull!16160) mapValue!52736)) b!1287835))

(assert (= (and b!1287838 ((_ is ValueCellFull!16160) mapDefault!52736)) b!1287840))

(assert (= start!108988 b!1287838))

(declare-fun m!1180131 () Bool)

(assert (=> b!1287832 m!1180131))

(declare-fun m!1180133 () Bool)

(assert (=> b!1287836 m!1180133))

(assert (=> b!1287836 m!1180133))

(declare-fun m!1180135 () Bool)

(assert (=> b!1287836 m!1180135))

(declare-fun m!1180137 () Bool)

(assert (=> b!1287830 m!1180137))

(declare-fun m!1180139 () Bool)

(assert (=> b!1287834 m!1180139))

(declare-fun m!1180141 () Bool)

(assert (=> b!1287834 m!1180141))

(declare-fun m!1180143 () Bool)

(assert (=> b!1287831 m!1180143))

(assert (=> b!1287831 m!1180143))

(declare-fun m!1180145 () Bool)

(assert (=> b!1287831 m!1180145))

(declare-fun m!1180147 () Bool)

(assert (=> start!108988 m!1180147))

(declare-fun m!1180149 () Bool)

(assert (=> start!108988 m!1180149))

(declare-fun m!1180151 () Bool)

(assert (=> start!108988 m!1180151))

(declare-fun m!1180153 () Bool)

(assert (=> mapNonEmpty!52736 m!1180153))

(check-sat (not b!1287836) (not b!1287831) (not start!108988) (not b!1287830) b_and!46549 (not b!1287832) (not b_next!28477) (not b!1287834) (not mapNonEmpty!52736) tp_is_empty!34117)
(check-sat b_and!46549 (not b_next!28477))
