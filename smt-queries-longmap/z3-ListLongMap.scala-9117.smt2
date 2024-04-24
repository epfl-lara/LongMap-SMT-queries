; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109710 () Bool)

(assert start!109710)

(declare-fun b_free!28975 () Bool)

(declare-fun b_next!28975 () Bool)

(assert (=> start!109710 (= b_free!28975 (not b_next!28975))))

(declare-fun tp!102044 () Bool)

(declare-fun b_and!47067 () Bool)

(assert (=> start!109710 (= tp!102044 b_and!47067)))

(declare-fun mapIsEmpty!53483 () Bool)

(declare-fun mapRes!53483 () Bool)

(assert (=> mapIsEmpty!53483 mapRes!53483))

(declare-fun b!1298031 () Bool)

(declare-fun e!740631 () Bool)

(declare-fun tp_is_empty!34615 () Bool)

(assert (=> b!1298031 (= e!740631 tp_is_empty!34615)))

(declare-fun b!1298032 () Bool)

(declare-fun res!862314 () Bool)

(declare-fun e!740634 () Bool)

(assert (=> b!1298032 (=> (not res!862314) (not e!740634))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86281 0))(
  ( (array!86282 (arr!41637 (Array (_ BitVec 32) (_ BitVec 64))) (size!42188 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86281)

(assert (=> b!1298032 (= res!862314 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42188 _keys!1741))))))

(declare-fun b!1298034 () Bool)

(declare-fun res!862317 () Bool)

(assert (=> b!1298034 (=> (not res!862317) (not e!740634))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51257 0))(
  ( (V!51258 (val!17382 Int)) )
))
(declare-datatypes ((ValueCell!16409 0))(
  ( (ValueCellFull!16409 (v!19980 V!51257)) (EmptyCell!16409) )
))
(declare-datatypes ((array!86283 0))(
  ( (array!86284 (arr!41638 (Array (_ BitVec 32) ValueCell!16409)) (size!42189 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86283)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298034 (= res!862317 (and (= (size!42189 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42188 _keys!1741) (size!42189 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53483 () Bool)

(declare-fun tp!102043 () Bool)

(assert (=> mapNonEmpty!53483 (= mapRes!53483 (and tp!102043 e!740631))))

(declare-fun mapKey!53483 () (_ BitVec 32))

(declare-fun mapRest!53483 () (Array (_ BitVec 32) ValueCell!16409))

(declare-fun mapValue!53483 () ValueCell!16409)

(assert (=> mapNonEmpty!53483 (= (arr!41638 _values!1445) (store mapRest!53483 mapKey!53483 mapValue!53483))))

(declare-fun b!1298033 () Bool)

(declare-fun e!740630 () Bool)

(assert (=> b!1298033 (= e!740630 tp_is_empty!34615)))

(declare-fun res!862318 () Bool)

(assert (=> start!109710 (=> (not res!862318) (not e!740634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109710 (= res!862318 (validMask!0 mask!2175))))

(assert (=> start!109710 e!740634))

(assert (=> start!109710 tp_is_empty!34615))

(assert (=> start!109710 true))

(declare-fun e!740632 () Bool)

(declare-fun array_inv!31755 (array!86283) Bool)

(assert (=> start!109710 (and (array_inv!31755 _values!1445) e!740632)))

(declare-fun array_inv!31756 (array!86281) Bool)

(assert (=> start!109710 (array_inv!31756 _keys!1741)))

(assert (=> start!109710 tp!102044))

(declare-fun b!1298035 () Bool)

(declare-fun res!862315 () Bool)

(assert (=> b!1298035 (=> (not res!862315) (not e!740634))))

(declare-datatypes ((List!29564 0))(
  ( (Nil!29561) (Cons!29560 (h!30778 (_ BitVec 64)) (t!43120 List!29564)) )
))
(declare-fun arrayNoDuplicates!0 (array!86281 (_ BitVec 32) List!29564) Bool)

(assert (=> b!1298035 (= res!862315 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29561))))

(declare-fun b!1298036 () Bool)

(assert (=> b!1298036 (= e!740634 false)))

(declare-fun minValue!1387 () V!51257)

(declare-fun zeroValue!1387 () V!51257)

(declare-fun lt!581001 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22400 0))(
  ( (tuple2!22401 (_1!11211 (_ BitVec 64)) (_2!11211 V!51257)) )
))
(declare-datatypes ((List!29565 0))(
  ( (Nil!29562) (Cons!29561 (h!30779 tuple2!22400) (t!43121 List!29565)) )
))
(declare-datatypes ((ListLongMap!20065 0))(
  ( (ListLongMap!20066 (toList!10048 List!29565)) )
))
(declare-fun contains!8178 (ListLongMap!20065 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5067 (array!86281 array!86283 (_ BitVec 32) (_ BitVec 32) V!51257 V!51257 (_ BitVec 32) Int) ListLongMap!20065)

(assert (=> b!1298036 (= lt!581001 (contains!8178 (getCurrentListMap!5067 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298037 () Bool)

(declare-fun res!862316 () Bool)

(assert (=> b!1298037 (=> (not res!862316) (not e!740634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86281 (_ BitVec 32)) Bool)

(assert (=> b!1298037 (= res!862316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298038 () Bool)

(assert (=> b!1298038 (= e!740632 (and e!740630 mapRes!53483))))

(declare-fun condMapEmpty!53483 () Bool)

(declare-fun mapDefault!53483 () ValueCell!16409)

(assert (=> b!1298038 (= condMapEmpty!53483 (= (arr!41638 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16409)) mapDefault!53483)))))

(assert (= (and start!109710 res!862318) b!1298034))

(assert (= (and b!1298034 res!862317) b!1298037))

(assert (= (and b!1298037 res!862316) b!1298035))

(assert (= (and b!1298035 res!862315) b!1298032))

(assert (= (and b!1298032 res!862314) b!1298036))

(assert (= (and b!1298038 condMapEmpty!53483) mapIsEmpty!53483))

(assert (= (and b!1298038 (not condMapEmpty!53483)) mapNonEmpty!53483))

(get-info :version)

(assert (= (and mapNonEmpty!53483 ((_ is ValueCellFull!16409) mapValue!53483)) b!1298031))

(assert (= (and b!1298038 ((_ is ValueCellFull!16409) mapDefault!53483)) b!1298033))

(assert (= start!109710 b!1298038))

(declare-fun m!1190181 () Bool)

(assert (=> b!1298036 m!1190181))

(assert (=> b!1298036 m!1190181))

(declare-fun m!1190183 () Bool)

(assert (=> b!1298036 m!1190183))

(declare-fun m!1190185 () Bool)

(assert (=> mapNonEmpty!53483 m!1190185))

(declare-fun m!1190187 () Bool)

(assert (=> b!1298035 m!1190187))

(declare-fun m!1190189 () Bool)

(assert (=> start!109710 m!1190189))

(declare-fun m!1190191 () Bool)

(assert (=> start!109710 m!1190191))

(declare-fun m!1190193 () Bool)

(assert (=> start!109710 m!1190193))

(declare-fun m!1190195 () Bool)

(assert (=> b!1298037 m!1190195))

(check-sat (not b_next!28975) (not mapNonEmpty!53483) (not b!1298037) tp_is_empty!34615 (not b!1298035) (not b!1298036) b_and!47067 (not start!109710))
(check-sat b_and!47067 (not b_next!28975))
