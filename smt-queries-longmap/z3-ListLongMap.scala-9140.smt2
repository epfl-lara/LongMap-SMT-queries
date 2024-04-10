; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109626 () Bool)

(assert start!109626)

(declare-fun b_free!29115 () Bool)

(declare-fun b_next!29115 () Bool)

(assert (=> start!109626 (= b_free!29115 (not b_next!29115))))

(declare-fun tp!102464 () Bool)

(declare-fun b_and!47205 () Bool)

(assert (=> start!109626 (= tp!102464 b_and!47205)))

(declare-fun b!1298587 () Bool)

(declare-fun res!863028 () Bool)

(declare-fun e!740836 () Bool)

(assert (=> b!1298587 (=> (not res!863028) (not e!740836))))

(declare-datatypes ((array!86516 0))(
  ( (array!86517 (arr!41759 (Array (_ BitVec 32) (_ BitVec 64))) (size!42309 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86516)

(declare-datatypes ((List!29634 0))(
  ( (Nil!29631) (Cons!29630 (h!30839 (_ BitVec 64)) (t!43198 List!29634)) )
))
(declare-fun arrayNoDuplicates!0 (array!86516 (_ BitVec 32) List!29634) Bool)

(assert (=> b!1298587 (= res!863028 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29631))))

(declare-fun b!1298588 () Bool)

(declare-fun res!863026 () Bool)

(assert (=> b!1298588 (=> (not res!863026) (not e!740836))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86516 (_ BitVec 32)) Bool)

(assert (=> b!1298588 (= res!863026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298589 () Bool)

(assert (=> b!1298589 (= e!740836 (not true))))

(declare-datatypes ((V!51443 0))(
  ( (V!51444 (val!17452 Int)) )
))
(declare-fun minValue!1387 () V!51443)

(declare-fun zeroValue!1387 () V!51443)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16479 0))(
  ( (ValueCellFull!16479 (v!20055 V!51443)) (EmptyCell!16479) )
))
(declare-datatypes ((array!86518 0))(
  ( (array!86519 (arr!41760 (Array (_ BitVec 32) ValueCell!16479)) (size!42310 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86518)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22506 0))(
  ( (tuple2!22507 (_1!11264 (_ BitVec 64)) (_2!11264 V!51443)) )
))
(declare-datatypes ((List!29635 0))(
  ( (Nil!29632) (Cons!29631 (h!30840 tuple2!22506) (t!43199 List!29635)) )
))
(declare-datatypes ((ListLongMap!20163 0))(
  ( (ListLongMap!20164 (toList!10097 List!29635)) )
))
(declare-fun contains!8215 (ListLongMap!20163 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5126 (array!86516 array!86518 (_ BitVec 32) (_ BitVec 32) V!51443 V!51443 (_ BitVec 32) Int) ListLongMap!20163)

(assert (=> b!1298589 (contains!8215 (getCurrentListMap!5126 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!43001 0))(
  ( (Unit!43002) )
))
(declare-fun lt!580718 () Unit!43001)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!53 (array!86516 array!86518 (_ BitVec 32) (_ BitVec 32) V!51443 V!51443 (_ BitVec 64) (_ BitVec 32) Int) Unit!43001)

(assert (=> b!1298589 (= lt!580718 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!53 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298590 () Bool)

(declare-fun res!863031 () Bool)

(assert (=> b!1298590 (=> (not res!863031) (not e!740836))))

(assert (=> b!1298590 (= res!863031 (and (= (size!42310 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42309 _keys!1741) (size!42310 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298591 () Bool)

(declare-fun e!740835 () Bool)

(declare-fun tp_is_empty!34755 () Bool)

(assert (=> b!1298591 (= e!740835 tp_is_empty!34755)))

(declare-fun mapNonEmpty!53693 () Bool)

(declare-fun mapRes!53693 () Bool)

(declare-fun tp!102463 () Bool)

(declare-fun e!740833 () Bool)

(assert (=> mapNonEmpty!53693 (= mapRes!53693 (and tp!102463 e!740833))))

(declare-fun mapKey!53693 () (_ BitVec 32))

(declare-fun mapRest!53693 () (Array (_ BitVec 32) ValueCell!16479))

(declare-fun mapValue!53693 () ValueCell!16479)

(assert (=> mapNonEmpty!53693 (= (arr!41760 _values!1445) (store mapRest!53693 mapKey!53693 mapValue!53693))))

(declare-fun b!1298592 () Bool)

(assert (=> b!1298592 (= e!740833 tp_is_empty!34755)))

(declare-fun b!1298594 () Bool)

(declare-fun res!863029 () Bool)

(assert (=> b!1298594 (=> (not res!863029) (not e!740836))))

(assert (=> b!1298594 (= res!863029 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42309 _keys!1741)) (not (= (select (arr!41759 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1298595 () Bool)

(declare-fun res!863027 () Bool)

(assert (=> b!1298595 (=> (not res!863027) (not e!740836))))

(assert (=> b!1298595 (= res!863027 (contains!8215 (getCurrentListMap!5126 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53693 () Bool)

(assert (=> mapIsEmpty!53693 mapRes!53693))

(declare-fun b!1298596 () Bool)

(declare-fun e!740837 () Bool)

(assert (=> b!1298596 (= e!740837 (and e!740835 mapRes!53693))))

(declare-fun condMapEmpty!53693 () Bool)

(declare-fun mapDefault!53693 () ValueCell!16479)

(assert (=> b!1298596 (= condMapEmpty!53693 (= (arr!41760 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16479)) mapDefault!53693)))))

(declare-fun b!1298593 () Bool)

(declare-fun res!863025 () Bool)

(assert (=> b!1298593 (=> (not res!863025) (not e!740836))))

(assert (=> b!1298593 (= res!863025 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42309 _keys!1741))))))

(declare-fun res!863030 () Bool)

(assert (=> start!109626 (=> (not res!863030) (not e!740836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109626 (= res!863030 (validMask!0 mask!2175))))

(assert (=> start!109626 e!740836))

(assert (=> start!109626 tp_is_empty!34755))

(assert (=> start!109626 true))

(declare-fun array_inv!31607 (array!86518) Bool)

(assert (=> start!109626 (and (array_inv!31607 _values!1445) e!740837)))

(declare-fun array_inv!31608 (array!86516) Bool)

(assert (=> start!109626 (array_inv!31608 _keys!1741)))

(assert (=> start!109626 tp!102464))

(assert (= (and start!109626 res!863030) b!1298590))

(assert (= (and b!1298590 res!863031) b!1298588))

(assert (= (and b!1298588 res!863026) b!1298587))

(assert (= (and b!1298587 res!863028) b!1298593))

(assert (= (and b!1298593 res!863025) b!1298595))

(assert (= (and b!1298595 res!863027) b!1298594))

(assert (= (and b!1298594 res!863029) b!1298589))

(assert (= (and b!1298596 condMapEmpty!53693) mapIsEmpty!53693))

(assert (= (and b!1298596 (not condMapEmpty!53693)) mapNonEmpty!53693))

(get-info :version)

(assert (= (and mapNonEmpty!53693 ((_ is ValueCellFull!16479) mapValue!53693)) b!1298592))

(assert (= (and b!1298596 ((_ is ValueCellFull!16479) mapDefault!53693)) b!1298591))

(assert (= start!109626 b!1298596))

(declare-fun m!1189907 () Bool)

(assert (=> b!1298595 m!1189907))

(assert (=> b!1298595 m!1189907))

(declare-fun m!1189909 () Bool)

(assert (=> b!1298595 m!1189909))

(declare-fun m!1189911 () Bool)

(assert (=> mapNonEmpty!53693 m!1189911))

(declare-fun m!1189913 () Bool)

(assert (=> start!109626 m!1189913))

(declare-fun m!1189915 () Bool)

(assert (=> start!109626 m!1189915))

(declare-fun m!1189917 () Bool)

(assert (=> start!109626 m!1189917))

(declare-fun m!1189919 () Bool)

(assert (=> b!1298594 m!1189919))

(declare-fun m!1189921 () Bool)

(assert (=> b!1298589 m!1189921))

(assert (=> b!1298589 m!1189921))

(declare-fun m!1189923 () Bool)

(assert (=> b!1298589 m!1189923))

(declare-fun m!1189925 () Bool)

(assert (=> b!1298589 m!1189925))

(declare-fun m!1189927 () Bool)

(assert (=> b!1298587 m!1189927))

(declare-fun m!1189929 () Bool)

(assert (=> b!1298588 m!1189929))

(check-sat tp_is_empty!34755 (not start!109626) (not b!1298595) (not b_next!29115) (not mapNonEmpty!53693) (not b!1298588) (not b!1298587) (not b!1298589) b_and!47205)
(check-sat b_and!47205 (not b_next!29115))
