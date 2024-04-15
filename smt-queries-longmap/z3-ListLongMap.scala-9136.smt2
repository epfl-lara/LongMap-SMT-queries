; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109600 () Bool)

(assert start!109600)

(declare-fun b_free!29089 () Bool)

(declare-fun b_next!29089 () Bool)

(assert (=> start!109600 (= b_free!29089 (not b_next!29089))))

(declare-fun tp!102386 () Bool)

(declare-fun b_and!47161 () Bool)

(assert (=> start!109600 (= tp!102386 b_and!47161)))

(declare-fun res!862729 () Bool)

(declare-fun e!740611 () Bool)

(assert (=> start!109600 (=> (not res!862729) (not e!740611))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109600 (= res!862729 (validMask!0 mask!2175))))

(assert (=> start!109600 e!740611))

(declare-fun tp_is_empty!34729 () Bool)

(assert (=> start!109600 tp_is_empty!34729))

(assert (=> start!109600 true))

(declare-datatypes ((V!51409 0))(
  ( (V!51410 (val!17439 Int)) )
))
(declare-datatypes ((ValueCell!16466 0))(
  ( (ValueCellFull!16466 (v!20041 V!51409)) (EmptyCell!16466) )
))
(declare-datatypes ((array!86359 0))(
  ( (array!86360 (arr!41681 (Array (_ BitVec 32) ValueCell!16466)) (size!42233 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86359)

(declare-fun e!740612 () Bool)

(declare-fun array_inv!31709 (array!86359) Bool)

(assert (=> start!109600 (and (array_inv!31709 _values!1445) e!740612)))

(declare-datatypes ((array!86361 0))(
  ( (array!86362 (arr!41682 (Array (_ BitVec 32) (_ BitVec 64))) (size!42234 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86361)

(declare-fun array_inv!31710 (array!86361) Bool)

(assert (=> start!109600 (array_inv!31710 _keys!1741)))

(assert (=> start!109600 tp!102386))

(declare-fun b!1298133 () Bool)

(declare-fun e!740610 () Bool)

(assert (=> b!1298133 (= e!740610 tp_is_empty!34729)))

(declare-fun mapNonEmpty!53654 () Bool)

(declare-fun mapRes!53654 () Bool)

(declare-fun tp!102387 () Bool)

(assert (=> mapNonEmpty!53654 (= mapRes!53654 (and tp!102387 e!740610))))

(declare-fun mapRest!53654 () (Array (_ BitVec 32) ValueCell!16466))

(declare-fun mapKey!53654 () (_ BitVec 32))

(declare-fun mapValue!53654 () ValueCell!16466)

(assert (=> mapNonEmpty!53654 (= (arr!41681 _values!1445) (store mapRest!53654 mapKey!53654 mapValue!53654))))

(declare-fun b!1298134 () Bool)

(declare-fun res!862727 () Bool)

(assert (=> b!1298134 (=> (not res!862727) (not e!740611))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298134 (= res!862727 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42234 _keys!1741))))))

(declare-fun b!1298135 () Bool)

(assert (=> b!1298135 (= e!740611 (not true))))

(declare-fun minValue!1387 () V!51409)

(declare-fun zeroValue!1387 () V!51409)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22530 0))(
  ( (tuple2!22531 (_1!11276 (_ BitVec 64)) (_2!11276 V!51409)) )
))
(declare-datatypes ((List!29652 0))(
  ( (Nil!29649) (Cons!29648 (h!30857 tuple2!22530) (t!43208 List!29652)) )
))
(declare-datatypes ((ListLongMap!20187 0))(
  ( (ListLongMap!20188 (toList!10109 List!29652)) )
))
(declare-fun contains!8157 (ListLongMap!20187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5025 (array!86361 array!86359 (_ BitVec 32) (_ BitVec 32) V!51409 V!51409 (_ BitVec 32) Int) ListLongMap!20187)

(assert (=> b!1298135 (contains!8157 (getCurrentListMap!5025 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42826 0))(
  ( (Unit!42827) )
))
(declare-fun lt!580501 () Unit!42826)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!38 (array!86361 array!86359 (_ BitVec 32) (_ BitVec 32) V!51409 V!51409 (_ BitVec 64) (_ BitVec 32) Int) Unit!42826)

(assert (=> b!1298135 (= lt!580501 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!38 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298136 () Bool)

(declare-fun res!862730 () Bool)

(assert (=> b!1298136 (=> (not res!862730) (not e!740611))))

(declare-datatypes ((List!29653 0))(
  ( (Nil!29650) (Cons!29649 (h!30858 (_ BitVec 64)) (t!43209 List!29653)) )
))
(declare-fun arrayNoDuplicates!0 (array!86361 (_ BitVec 32) List!29653) Bool)

(assert (=> b!1298136 (= res!862730 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29650))))

(declare-fun mapIsEmpty!53654 () Bool)

(assert (=> mapIsEmpty!53654 mapRes!53654))

(declare-fun b!1298137 () Bool)

(declare-fun e!740613 () Bool)

(assert (=> b!1298137 (= e!740612 (and e!740613 mapRes!53654))))

(declare-fun condMapEmpty!53654 () Bool)

(declare-fun mapDefault!53654 () ValueCell!16466)

(assert (=> b!1298137 (= condMapEmpty!53654 (= (arr!41681 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16466)) mapDefault!53654)))))

(declare-fun b!1298138 () Bool)

(assert (=> b!1298138 (= e!740613 tp_is_empty!34729)))

(declare-fun b!1298139 () Bool)

(declare-fun res!862731 () Bool)

(assert (=> b!1298139 (=> (not res!862731) (not e!740611))))

(assert (=> b!1298139 (= res!862731 (and (= (size!42233 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42234 _keys!1741) (size!42233 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298140 () Bool)

(declare-fun res!862726 () Bool)

(assert (=> b!1298140 (=> (not res!862726) (not e!740611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86361 (_ BitVec 32)) Bool)

(assert (=> b!1298140 (= res!862726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298141 () Bool)

(declare-fun res!862725 () Bool)

(assert (=> b!1298141 (=> (not res!862725) (not e!740611))))

(assert (=> b!1298141 (= res!862725 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42234 _keys!1741)) (not (= (select (arr!41682 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1298142 () Bool)

(declare-fun res!862728 () Bool)

(assert (=> b!1298142 (=> (not res!862728) (not e!740611))))

(assert (=> b!1298142 (= res!862728 (contains!8157 (getCurrentListMap!5025 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109600 res!862729) b!1298139))

(assert (= (and b!1298139 res!862731) b!1298140))

(assert (= (and b!1298140 res!862726) b!1298136))

(assert (= (and b!1298136 res!862730) b!1298134))

(assert (= (and b!1298134 res!862727) b!1298142))

(assert (= (and b!1298142 res!862728) b!1298141))

(assert (= (and b!1298141 res!862725) b!1298135))

(assert (= (and b!1298137 condMapEmpty!53654) mapIsEmpty!53654))

(assert (= (and b!1298137 (not condMapEmpty!53654)) mapNonEmpty!53654))

(get-info :version)

(assert (= (and mapNonEmpty!53654 ((_ is ValueCellFull!16466) mapValue!53654)) b!1298133))

(assert (= (and b!1298137 ((_ is ValueCellFull!16466) mapDefault!53654)) b!1298138))

(assert (= start!109600 b!1298137))

(declare-fun m!1189095 () Bool)

(assert (=> b!1298135 m!1189095))

(assert (=> b!1298135 m!1189095))

(declare-fun m!1189097 () Bool)

(assert (=> b!1298135 m!1189097))

(declare-fun m!1189099 () Bool)

(assert (=> b!1298135 m!1189099))

(declare-fun m!1189101 () Bool)

(assert (=> b!1298140 m!1189101))

(declare-fun m!1189103 () Bool)

(assert (=> b!1298141 m!1189103))

(declare-fun m!1189105 () Bool)

(assert (=> b!1298142 m!1189105))

(assert (=> b!1298142 m!1189105))

(declare-fun m!1189107 () Bool)

(assert (=> b!1298142 m!1189107))

(declare-fun m!1189109 () Bool)

(assert (=> b!1298136 m!1189109))

(declare-fun m!1189111 () Bool)

(assert (=> mapNonEmpty!53654 m!1189111))

(declare-fun m!1189113 () Bool)

(assert (=> start!109600 m!1189113))

(declare-fun m!1189115 () Bool)

(assert (=> start!109600 m!1189115))

(declare-fun m!1189117 () Bool)

(assert (=> start!109600 m!1189117))

(check-sat (not b!1298142) (not b_next!29089) (not b!1298136) tp_is_empty!34729 (not mapNonEmpty!53654) (not b!1298140) b_and!47161 (not start!109600) (not b!1298135))
(check-sat b_and!47161 (not b_next!29089))
