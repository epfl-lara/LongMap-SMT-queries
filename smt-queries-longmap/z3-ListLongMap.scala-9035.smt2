; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108994 () Bool)

(assert start!108994)

(declare-fun b_free!28483 () Bool)

(declare-fun b_next!28483 () Bool)

(assert (=> start!108994 (= b_free!28483 (not b_next!28483))))

(declare-fun tp!100569 () Bool)

(declare-fun b_and!46555 () Bool)

(assert (=> start!108994 (= tp!100569 b_and!46555)))

(declare-fun res!855410 () Bool)

(declare-fun e!735472 () Bool)

(assert (=> start!108994 (=> (not res!855410) (not e!735472))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108994 (= res!855410 (validMask!0 mask!2175))))

(assert (=> start!108994 e!735472))

(declare-fun tp_is_empty!34123 () Bool)

(assert (=> start!108994 tp_is_empty!34123))

(assert (=> start!108994 true))

(declare-datatypes ((V!50601 0))(
  ( (V!50602 (val!17136 Int)) )
))
(declare-datatypes ((ValueCell!16163 0))(
  ( (ValueCellFull!16163 (v!19738 V!50601)) (EmptyCell!16163) )
))
(declare-datatypes ((array!85183 0))(
  ( (array!85184 (arr!41093 (Array (_ BitVec 32) ValueCell!16163)) (size!41645 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85183)

(declare-fun e!735471 () Bool)

(declare-fun array_inv!31315 (array!85183) Bool)

(assert (=> start!108994 (and (array_inv!31315 _values!1445) e!735471)))

(declare-datatypes ((array!85185 0))(
  ( (array!85186 (arr!41094 (Array (_ BitVec 32) (_ BitVec 64))) (size!41646 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85185)

(declare-fun array_inv!31316 (array!85185) Bool)

(assert (=> start!108994 (array_inv!31316 _keys!1741)))

(assert (=> start!108994 tp!100569))

(declare-fun mapIsEmpty!52745 () Bool)

(declare-fun mapRes!52745 () Bool)

(assert (=> mapIsEmpty!52745 mapRes!52745))

(declare-fun b!1287929 () Bool)

(declare-fun res!855412 () Bool)

(assert (=> b!1287929 (=> (not res!855412) (not e!735472))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287929 (= res!855412 (not (validKeyInArray!0 (select (arr!41094 _keys!1741) from!2144))))))

(declare-fun b!1287930 () Bool)

(declare-fun res!855415 () Bool)

(assert (=> b!1287930 (=> (not res!855415) (not e!735472))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1287930 (= res!855415 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41646 _keys!1741))))))

(declare-fun b!1287931 () Bool)

(declare-fun e!735473 () Bool)

(assert (=> b!1287931 (= e!735473 tp_is_empty!34123)))

(declare-fun b!1287932 () Bool)

(assert (=> b!1287932 (= e!735472 (not true))))

(declare-datatypes ((tuple2!22048 0))(
  ( (tuple2!22049 (_1!11035 (_ BitVec 64)) (_2!11035 V!50601)) )
))
(declare-datatypes ((List!29219 0))(
  ( (Nil!29216) (Cons!29215 (h!30424 tuple2!22048) (t!42775 List!29219)) )
))
(declare-datatypes ((ListLongMap!19705 0))(
  ( (ListLongMap!19706 (toList!9868 List!29219)) )
))
(declare-fun contains!7916 (ListLongMap!19705 (_ BitVec 64)) Bool)

(assert (=> b!1287932 (not (contains!7916 (ListLongMap!19706 Nil!29216) k0!1205))))

(declare-datatypes ((Unit!42442 0))(
  ( (Unit!42443) )
))
(declare-fun lt!577738 () Unit!42442)

(declare-fun emptyContainsNothing!28 ((_ BitVec 64)) Unit!42442)

(assert (=> b!1287932 (= lt!577738 (emptyContainsNothing!28 k0!1205))))

(declare-fun b!1287933 () Bool)

(declare-fun res!855417 () Bool)

(assert (=> b!1287933 (=> (not res!855417) (not e!735472))))

(assert (=> b!1287933 (= res!855417 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41646 _keys!1741))))))

(declare-fun mapNonEmpty!52745 () Bool)

(declare-fun tp!100568 () Bool)

(assert (=> mapNonEmpty!52745 (= mapRes!52745 (and tp!100568 e!735473))))

(declare-fun mapKey!52745 () (_ BitVec 32))

(declare-fun mapValue!52745 () ValueCell!16163)

(declare-fun mapRest!52745 () (Array (_ BitVec 32) ValueCell!16163))

(assert (=> mapNonEmpty!52745 (= (arr!41093 _values!1445) (store mapRest!52745 mapKey!52745 mapValue!52745))))

(declare-fun b!1287934 () Bool)

(declare-fun e!735470 () Bool)

(assert (=> b!1287934 (= e!735471 (and e!735470 mapRes!52745))))

(declare-fun condMapEmpty!52745 () Bool)

(declare-fun mapDefault!52745 () ValueCell!16163)

(assert (=> b!1287934 (= condMapEmpty!52745 (= (arr!41093 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16163)) mapDefault!52745)))))

(declare-fun b!1287935 () Bool)

(declare-fun res!855414 () Bool)

(assert (=> b!1287935 (=> (not res!855414) (not e!735472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85185 (_ BitVec 32)) Bool)

(assert (=> b!1287935 (= res!855414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287936 () Bool)

(declare-fun res!855413 () Bool)

(assert (=> b!1287936 (=> (not res!855413) (not e!735472))))

(declare-fun minValue!1387 () V!50601)

(declare-fun zeroValue!1387 () V!50601)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4827 (array!85185 array!85183 (_ BitVec 32) (_ BitVec 32) V!50601 V!50601 (_ BitVec 32) Int) ListLongMap!19705)

(assert (=> b!1287936 (= res!855413 (contains!7916 (getCurrentListMap!4827 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287937 () Bool)

(declare-fun res!855411 () Bool)

(assert (=> b!1287937 (=> (not res!855411) (not e!735472))))

(assert (=> b!1287937 (= res!855411 (and (= (size!41645 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41646 _keys!1741) (size!41645 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287938 () Bool)

(assert (=> b!1287938 (= e!735470 tp_is_empty!34123)))

(declare-fun b!1287939 () Bool)

(declare-fun res!855416 () Bool)

(assert (=> b!1287939 (=> (not res!855416) (not e!735472))))

(declare-datatypes ((List!29220 0))(
  ( (Nil!29217) (Cons!29216 (h!30425 (_ BitVec 64)) (t!42776 List!29220)) )
))
(declare-fun arrayNoDuplicates!0 (array!85185 (_ BitVec 32) List!29220) Bool)

(assert (=> b!1287939 (= res!855416 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29217))))

(assert (= (and start!108994 res!855410) b!1287937))

(assert (= (and b!1287937 res!855411) b!1287935))

(assert (= (and b!1287935 res!855414) b!1287939))

(assert (= (and b!1287939 res!855416) b!1287933))

(assert (= (and b!1287933 res!855417) b!1287936))

(assert (= (and b!1287936 res!855413) b!1287930))

(assert (= (and b!1287930 res!855415) b!1287929))

(assert (= (and b!1287929 res!855412) b!1287932))

(assert (= (and b!1287934 condMapEmpty!52745) mapIsEmpty!52745))

(assert (= (and b!1287934 (not condMapEmpty!52745)) mapNonEmpty!52745))

(get-info :version)

(assert (= (and mapNonEmpty!52745 ((_ is ValueCellFull!16163) mapValue!52745)) b!1287931))

(assert (= (and b!1287934 ((_ is ValueCellFull!16163) mapDefault!52745)) b!1287938))

(assert (= start!108994 b!1287934))

(declare-fun m!1180203 () Bool)

(assert (=> mapNonEmpty!52745 m!1180203))

(declare-fun m!1180205 () Bool)

(assert (=> b!1287929 m!1180205))

(assert (=> b!1287929 m!1180205))

(declare-fun m!1180207 () Bool)

(assert (=> b!1287929 m!1180207))

(declare-fun m!1180209 () Bool)

(assert (=> b!1287936 m!1180209))

(assert (=> b!1287936 m!1180209))

(declare-fun m!1180211 () Bool)

(assert (=> b!1287936 m!1180211))

(declare-fun m!1180213 () Bool)

(assert (=> b!1287935 m!1180213))

(declare-fun m!1180215 () Bool)

(assert (=> start!108994 m!1180215))

(declare-fun m!1180217 () Bool)

(assert (=> start!108994 m!1180217))

(declare-fun m!1180219 () Bool)

(assert (=> start!108994 m!1180219))

(declare-fun m!1180221 () Bool)

(assert (=> b!1287932 m!1180221))

(declare-fun m!1180223 () Bool)

(assert (=> b!1287932 m!1180223))

(declare-fun m!1180225 () Bool)

(assert (=> b!1287939 m!1180225))

(check-sat (not b!1287932) (not b!1287936) b_and!46555 (not b_next!28483) (not start!108994) (not b!1287929) (not b!1287939) tp_is_empty!34123 (not mapNonEmpty!52745) (not b!1287935))
(check-sat b_and!46555 (not b_next!28483))
