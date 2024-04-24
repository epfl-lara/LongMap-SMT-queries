; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109584 () Bool)

(assert start!109584)

(declare-fun b_free!28849 () Bool)

(declare-fun b_next!28849 () Bool)

(assert (=> start!109584 (= b_free!28849 (not b_next!28849))))

(declare-fun tp!101665 () Bool)

(declare-fun b_and!46941 () Bool)

(assert (=> start!109584 (= tp!101665 b_and!46941)))

(declare-fun b!1295742 () Bool)

(declare-fun res!860759 () Bool)

(declare-fun e!739496 () Bool)

(assert (=> b!1295742 (=> (not res!860759) (not e!739496))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86033 0))(
  ( (array!86034 (arr!41513 (Array (_ BitVec 32) (_ BitVec 64))) (size!42064 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86033)

(assert (=> b!1295742 (= res!860759 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42064 _keys!1741))))))

(declare-fun b!1295743 () Bool)

(assert (=> b!1295743 (= e!739496 (not true))))

(declare-datatypes ((V!51089 0))(
  ( (V!51090 (val!17319 Int)) )
))
(declare-datatypes ((tuple2!22300 0))(
  ( (tuple2!22301 (_1!11161 (_ BitVec 64)) (_2!11161 V!51089)) )
))
(declare-datatypes ((List!29468 0))(
  ( (Nil!29465) (Cons!29464 (h!30682 tuple2!22300) (t!43024 List!29468)) )
))
(declare-datatypes ((ListLongMap!19965 0))(
  ( (ListLongMap!19966 (toList!9998 List!29468)) )
))
(declare-fun contains!8129 (ListLongMap!19965 (_ BitVec 64)) Bool)

(assert (=> b!1295743 (not (contains!8129 (ListLongMap!19966 Nil!29465) k0!1205))))

(declare-datatypes ((Unit!42829 0))(
  ( (Unit!42830) )
))
(declare-fun lt!580200 () Unit!42829)

(declare-fun emptyContainsNothing!157 ((_ BitVec 64)) Unit!42829)

(assert (=> b!1295743 (= lt!580200 (emptyContainsNothing!157 k0!1205))))

(declare-fun mapIsEmpty!53294 () Bool)

(declare-fun mapRes!53294 () Bool)

(assert (=> mapIsEmpty!53294 mapRes!53294))

(declare-fun mapNonEmpty!53294 () Bool)

(declare-fun tp!101666 () Bool)

(declare-fun e!739497 () Bool)

(assert (=> mapNonEmpty!53294 (= mapRes!53294 (and tp!101666 e!739497))))

(declare-fun mapKey!53294 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16346 0))(
  ( (ValueCellFull!16346 (v!19917 V!51089)) (EmptyCell!16346) )
))
(declare-fun mapRest!53294 () (Array (_ BitVec 32) ValueCell!16346))

(declare-datatypes ((array!86035 0))(
  ( (array!86036 (arr!41514 (Array (_ BitVec 32) ValueCell!16346)) (size!42065 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86035)

(declare-fun mapValue!53294 () ValueCell!16346)

(assert (=> mapNonEmpty!53294 (= (arr!41514 _values!1445) (store mapRest!53294 mapKey!53294 mapValue!53294))))

(declare-fun b!1295744 () Bool)

(declare-fun res!860755 () Bool)

(assert (=> b!1295744 (=> (not res!860755) (not e!739496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295744 (= res!860755 (not (validKeyInArray!0 (select (arr!41513 _keys!1741) from!2144))))))

(declare-fun b!1295745 () Bool)

(declare-fun res!860756 () Bool)

(assert (=> b!1295745 (=> (not res!860756) (not e!739496))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86033 (_ BitVec 32)) Bool)

(assert (=> b!1295745 (= res!860756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295746 () Bool)

(declare-fun res!860754 () Bool)

(assert (=> b!1295746 (=> (not res!860754) (not e!739496))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295746 (= res!860754 (and (= (size!42065 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42064 _keys!1741) (size!42065 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295747 () Bool)

(declare-fun e!739498 () Bool)

(declare-fun tp_is_empty!34489 () Bool)

(assert (=> b!1295747 (= e!739498 tp_is_empty!34489)))

(declare-fun b!1295748 () Bool)

(declare-fun res!860757 () Bool)

(assert (=> b!1295748 (=> (not res!860757) (not e!739496))))

(assert (=> b!1295748 (= res!860757 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42064 _keys!1741))))))

(declare-fun res!860760 () Bool)

(assert (=> start!109584 (=> (not res!860760) (not e!739496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109584 (= res!860760 (validMask!0 mask!2175))))

(assert (=> start!109584 e!739496))

(assert (=> start!109584 tp_is_empty!34489))

(assert (=> start!109584 true))

(declare-fun e!739499 () Bool)

(declare-fun array_inv!31669 (array!86035) Bool)

(assert (=> start!109584 (and (array_inv!31669 _values!1445) e!739499)))

(declare-fun array_inv!31670 (array!86033) Bool)

(assert (=> start!109584 (array_inv!31670 _keys!1741)))

(assert (=> start!109584 tp!101665))

(declare-fun b!1295749 () Bool)

(assert (=> b!1295749 (= e!739499 (and e!739498 mapRes!53294))))

(declare-fun condMapEmpty!53294 () Bool)

(declare-fun mapDefault!53294 () ValueCell!16346)

(assert (=> b!1295749 (= condMapEmpty!53294 (= (arr!41514 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16346)) mapDefault!53294)))))

(declare-fun b!1295750 () Bool)

(declare-fun res!860761 () Bool)

(assert (=> b!1295750 (=> (not res!860761) (not e!739496))))

(declare-datatypes ((List!29469 0))(
  ( (Nil!29466) (Cons!29465 (h!30683 (_ BitVec 64)) (t!43025 List!29469)) )
))
(declare-fun arrayNoDuplicates!0 (array!86033 (_ BitVec 32) List!29469) Bool)

(assert (=> b!1295750 (= res!860761 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29466))))

(declare-fun b!1295751 () Bool)

(assert (=> b!1295751 (= e!739497 tp_is_empty!34489)))

(declare-fun b!1295752 () Bool)

(declare-fun res!860758 () Bool)

(assert (=> b!1295752 (=> (not res!860758) (not e!739496))))

(declare-fun minValue!1387 () V!51089)

(declare-fun zeroValue!1387 () V!51089)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5025 (array!86033 array!86035 (_ BitVec 32) (_ BitVec 32) V!51089 V!51089 (_ BitVec 32) Int) ListLongMap!19965)

(assert (=> b!1295752 (= res!860758 (contains!8129 (getCurrentListMap!5025 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109584 res!860760) b!1295746))

(assert (= (and b!1295746 res!860754) b!1295745))

(assert (= (and b!1295745 res!860756) b!1295750))

(assert (= (and b!1295750 res!860761) b!1295748))

(assert (= (and b!1295748 res!860757) b!1295752))

(assert (= (and b!1295752 res!860758) b!1295742))

(assert (= (and b!1295742 res!860759) b!1295744))

(assert (= (and b!1295744 res!860755) b!1295743))

(assert (= (and b!1295749 condMapEmpty!53294) mapIsEmpty!53294))

(assert (= (and b!1295749 (not condMapEmpty!53294)) mapNonEmpty!53294))

(get-info :version)

(assert (= (and mapNonEmpty!53294 ((_ is ValueCellFull!16346) mapValue!53294)) b!1295751))

(assert (= (and b!1295749 ((_ is ValueCellFull!16346) mapDefault!53294)) b!1295747))

(assert (= start!109584 b!1295749))

(declare-fun m!1188261 () Bool)

(assert (=> b!1295750 m!1188261))

(declare-fun m!1188263 () Bool)

(assert (=> start!109584 m!1188263))

(declare-fun m!1188265 () Bool)

(assert (=> start!109584 m!1188265))

(declare-fun m!1188267 () Bool)

(assert (=> start!109584 m!1188267))

(declare-fun m!1188269 () Bool)

(assert (=> mapNonEmpty!53294 m!1188269))

(declare-fun m!1188271 () Bool)

(assert (=> b!1295745 m!1188271))

(declare-fun m!1188273 () Bool)

(assert (=> b!1295743 m!1188273))

(declare-fun m!1188275 () Bool)

(assert (=> b!1295743 m!1188275))

(declare-fun m!1188277 () Bool)

(assert (=> b!1295744 m!1188277))

(assert (=> b!1295744 m!1188277))

(declare-fun m!1188279 () Bool)

(assert (=> b!1295744 m!1188279))

(declare-fun m!1188281 () Bool)

(assert (=> b!1295752 m!1188281))

(assert (=> b!1295752 m!1188281))

(declare-fun m!1188283 () Bool)

(assert (=> b!1295752 m!1188283))

(check-sat (not mapNonEmpty!53294) (not b!1295745) (not b_next!28849) (not b!1295750) (not start!109584) (not b!1295743) b_and!46941 (not b!1295752) (not b!1295744) tp_is_empty!34489)
(check-sat b_and!46941 (not b_next!28849))
