; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109440 () Bool)

(assert start!109440)

(declare-fun b_free!28705 () Bool)

(declare-fun b_next!28705 () Bool)

(assert (=> start!109440 (= b_free!28705 (not b_next!28705))))

(declare-fun tp!101234 () Bool)

(declare-fun b_and!46797 () Bool)

(assert (=> start!109440 (= tp!101234 b_and!46797)))

(declare-fun mapNonEmpty!53078 () Bool)

(declare-fun mapRes!53078 () Bool)

(declare-fun tp!101233 () Bool)

(declare-fun e!738308 () Bool)

(assert (=> mapNonEmpty!53078 (= mapRes!53078 (and tp!101233 e!738308))))

(declare-datatypes ((V!50897 0))(
  ( (V!50898 (val!17247 Int)) )
))
(declare-datatypes ((ValueCell!16274 0))(
  ( (ValueCellFull!16274 (v!19845 V!50897)) (EmptyCell!16274) )
))
(declare-datatypes ((array!85757 0))(
  ( (array!85758 (arr!41375 (Array (_ BitVec 32) ValueCell!16274)) (size!41926 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85757)

(declare-fun mapValue!53078 () ValueCell!16274)

(declare-fun mapKey!53078 () (_ BitVec 32))

(declare-fun mapRest!53078 () (Array (_ BitVec 32) ValueCell!16274))

(assert (=> mapNonEmpty!53078 (= (arr!41375 _values!1445) (store mapRest!53078 mapKey!53078 mapValue!53078))))

(declare-fun b!1293258 () Bool)

(declare-fun res!858921 () Bool)

(declare-fun e!738309 () Bool)

(assert (=> b!1293258 (=> (not res!858921) (not e!738309))))

(declare-datatypes ((array!85759 0))(
  ( (array!85760 (arr!41376 (Array (_ BitVec 32) (_ BitVec 64))) (size!41927 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85759)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293258 (= res!858921 (not (validKeyInArray!0 (select (arr!41376 _keys!1741) from!2144))))))

(declare-fun b!1293259 () Bool)

(declare-fun res!858923 () Bool)

(assert (=> b!1293259 (=> (not res!858923) (not e!738309))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85759 (_ BitVec 32)) Bool)

(assert (=> b!1293259 (= res!858923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293260 () Bool)

(declare-fun res!858920 () Bool)

(assert (=> b!1293260 (=> (not res!858920) (not e!738309))))

(declare-datatypes ((List!29368 0))(
  ( (Nil!29365) (Cons!29364 (h!30582 (_ BitVec 64)) (t!42924 List!29368)) )
))
(declare-fun arrayNoDuplicates!0 (array!85759 (_ BitVec 32) List!29368) Bool)

(assert (=> b!1293260 (= res!858920 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29365))))

(declare-fun mapIsEmpty!53078 () Bool)

(assert (=> mapIsEmpty!53078 mapRes!53078))

(declare-fun b!1293261 () Bool)

(declare-fun res!858925 () Bool)

(assert (=> b!1293261 (=> (not res!858925) (not e!738309))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293261 (= res!858925 (and (= (size!41926 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41927 _keys!1741) (size!41926 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293262 () Bool)

(declare-fun res!858922 () Bool)

(assert (=> b!1293262 (=> (not res!858922) (not e!738309))))

(declare-fun minValue!1387 () V!50897)

(declare-fun zeroValue!1387 () V!50897)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22196 0))(
  ( (tuple2!22197 (_1!11109 (_ BitVec 64)) (_2!11109 V!50897)) )
))
(declare-datatypes ((List!29369 0))(
  ( (Nil!29366) (Cons!29365 (h!30583 tuple2!22196) (t!42925 List!29369)) )
))
(declare-datatypes ((ListLongMap!19861 0))(
  ( (ListLongMap!19862 (toList!9946 List!29369)) )
))
(declare-fun contains!8077 (ListLongMap!19861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4979 (array!85759 array!85757 (_ BitVec 32) (_ BitVec 32) V!50897 V!50897 (_ BitVec 32) Int) ListLongMap!19861)

(assert (=> b!1293262 (= res!858922 (contains!8077 (getCurrentListMap!4979 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293263 () Bool)

(declare-fun res!858918 () Bool)

(assert (=> b!1293263 (=> (not res!858918) (not e!738309))))

(assert (=> b!1293263 (= res!858918 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41927 _keys!1741))))))

(declare-fun res!858924 () Bool)

(assert (=> start!109440 (=> (not res!858924) (not e!738309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109440 (= res!858924 (validMask!0 mask!2175))))

(assert (=> start!109440 e!738309))

(declare-fun tp_is_empty!34345 () Bool)

(assert (=> start!109440 tp_is_empty!34345))

(assert (=> start!109440 true))

(declare-fun e!738310 () Bool)

(declare-fun array_inv!31579 (array!85757) Bool)

(assert (=> start!109440 (and (array_inv!31579 _values!1445) e!738310)))

(declare-fun array_inv!31580 (array!85759) Bool)

(assert (=> start!109440 (array_inv!31580 _keys!1741)))

(assert (=> start!109440 tp!101234))

(declare-fun b!1293264 () Bool)

(declare-fun res!858919 () Bool)

(assert (=> b!1293264 (=> (not res!858919) (not e!738309))))

(assert (=> b!1293264 (= res!858919 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41927 _keys!1741))))))

(declare-fun b!1293265 () Bool)

(assert (=> b!1293265 (= e!738309 (not true))))

(assert (=> b!1293265 (not (contains!8077 (ListLongMap!19862 Nil!29366) k0!1205))))

(declare-datatypes ((Unit!42735 0))(
  ( (Unit!42736) )
))
(declare-fun lt!579777 () Unit!42735)

(declare-fun emptyContainsNothing!113 ((_ BitVec 64)) Unit!42735)

(assert (=> b!1293265 (= lt!579777 (emptyContainsNothing!113 k0!1205))))

(declare-fun b!1293266 () Bool)

(declare-fun e!738311 () Bool)

(assert (=> b!1293266 (= e!738311 tp_is_empty!34345)))

(declare-fun b!1293267 () Bool)

(assert (=> b!1293267 (= e!738308 tp_is_empty!34345)))

(declare-fun b!1293268 () Bool)

(assert (=> b!1293268 (= e!738310 (and e!738311 mapRes!53078))))

(declare-fun condMapEmpty!53078 () Bool)

(declare-fun mapDefault!53078 () ValueCell!16274)

(assert (=> b!1293268 (= condMapEmpty!53078 (= (arr!41375 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16274)) mapDefault!53078)))))

(assert (= (and start!109440 res!858924) b!1293261))

(assert (= (and b!1293261 res!858925) b!1293259))

(assert (= (and b!1293259 res!858923) b!1293260))

(assert (= (and b!1293260 res!858920) b!1293264))

(assert (= (and b!1293264 res!858919) b!1293262))

(assert (= (and b!1293262 res!858922) b!1293263))

(assert (= (and b!1293263 res!858918) b!1293258))

(assert (= (and b!1293258 res!858921) b!1293265))

(assert (= (and b!1293268 condMapEmpty!53078) mapIsEmpty!53078))

(assert (= (and b!1293268 (not condMapEmpty!53078)) mapNonEmpty!53078))

(get-info :version)

(assert (= (and mapNonEmpty!53078 ((_ is ValueCellFull!16274) mapValue!53078)) b!1293267))

(assert (= (and b!1293268 ((_ is ValueCellFull!16274) mapDefault!53078)) b!1293266))

(assert (= start!109440 b!1293268))

(declare-fun m!1186257 () Bool)

(assert (=> b!1293262 m!1186257))

(assert (=> b!1293262 m!1186257))

(declare-fun m!1186259 () Bool)

(assert (=> b!1293262 m!1186259))

(declare-fun m!1186261 () Bool)

(assert (=> b!1293265 m!1186261))

(declare-fun m!1186263 () Bool)

(assert (=> b!1293265 m!1186263))

(declare-fun m!1186265 () Bool)

(assert (=> b!1293260 m!1186265))

(declare-fun m!1186267 () Bool)

(assert (=> mapNonEmpty!53078 m!1186267))

(declare-fun m!1186269 () Bool)

(assert (=> start!109440 m!1186269))

(declare-fun m!1186271 () Bool)

(assert (=> start!109440 m!1186271))

(declare-fun m!1186273 () Bool)

(assert (=> start!109440 m!1186273))

(declare-fun m!1186275 () Bool)

(assert (=> b!1293259 m!1186275))

(declare-fun m!1186277 () Bool)

(assert (=> b!1293258 m!1186277))

(assert (=> b!1293258 m!1186277))

(declare-fun m!1186279 () Bool)

(assert (=> b!1293258 m!1186279))

(check-sat tp_is_empty!34345 (not start!109440) (not b!1293258) (not mapNonEmpty!53078) b_and!46797 (not b!1293262) (not b_next!28705) (not b!1293259) (not b!1293260) (not b!1293265))
(check-sat b_and!46797 (not b_next!28705))
