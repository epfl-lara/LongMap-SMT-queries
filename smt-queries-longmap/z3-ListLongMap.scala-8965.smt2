; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108740 () Bool)

(assert start!108740)

(declare-fun b_free!28063 () Bool)

(declare-fun b_next!28063 () Bool)

(assert (=> start!108740 (= b_free!28063 (not b_next!28063))))

(declare-fun tp!99299 () Bool)

(declare-fun b_and!46125 () Bool)

(assert (=> start!108740 (= tp!99299 b_and!46125)))

(declare-fun b!1282150 () Bool)

(declare-fun e!732683 () Bool)

(declare-fun tp_is_empty!33703 () Bool)

(assert (=> b!1282150 (= e!732683 tp_is_empty!33703)))

(declare-fun b!1282151 () Bool)

(declare-fun res!851343 () Bool)

(declare-fun e!732687 () Bool)

(assert (=> b!1282151 (=> (not res!851343) (not e!732687))))

(declare-datatypes ((V!50041 0))(
  ( (V!50042 (val!16926 Int)) )
))
(declare-fun minValue!1387 () V!50041)

(declare-fun zeroValue!1387 () V!50041)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15953 0))(
  ( (ValueCellFull!15953 (v!19521 V!50041)) (EmptyCell!15953) )
))
(declare-datatypes ((array!84509 0))(
  ( (array!84510 (arr!40754 (Array (_ BitVec 32) ValueCell!15953)) (size!41305 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84509)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84511 0))(
  ( (array!84512 (arr!40755 (Array (_ BitVec 32) (_ BitVec 64))) (size!41306 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84511)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21688 0))(
  ( (tuple2!21689 (_1!10855 (_ BitVec 64)) (_2!10855 V!50041)) )
))
(declare-datatypes ((List!28902 0))(
  ( (Nil!28899) (Cons!28898 (h!30116 tuple2!21688) (t!42434 List!28902)) )
))
(declare-datatypes ((ListLongMap!19353 0))(
  ( (ListLongMap!19354 (toList!9692 List!28902)) )
))
(declare-fun contains!7821 (ListLongMap!19353 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4761 (array!84511 array!84509 (_ BitVec 32) (_ BitVec 32) V!50041 V!50041 (_ BitVec 32) Int) ListLongMap!19353)

(assert (=> b!1282151 (= res!851343 (contains!7821 (getCurrentListMap!4761 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52106 () Bool)

(declare-fun mapRes!52106 () Bool)

(declare-fun tp!99298 () Bool)

(assert (=> mapNonEmpty!52106 (= mapRes!52106 (and tp!99298 e!732683))))

(declare-fun mapRest!52106 () (Array (_ BitVec 32) ValueCell!15953))

(declare-fun mapKey!52106 () (_ BitVec 32))

(declare-fun mapValue!52106 () ValueCell!15953)

(assert (=> mapNonEmpty!52106 (= (arr!40754 _values!1445) (store mapRest!52106 mapKey!52106 mapValue!52106))))

(declare-fun b!1282152 () Bool)

(declare-fun res!851338 () Bool)

(assert (=> b!1282152 (=> (not res!851338) (not e!732687))))

(assert (=> b!1282152 (= res!851338 (and (= (size!41305 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41306 _keys!1741) (size!41305 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282154 () Bool)

(declare-fun e!732685 () Bool)

(declare-fun e!732686 () Bool)

(assert (=> b!1282154 (= e!732685 (and e!732686 mapRes!52106))))

(declare-fun condMapEmpty!52106 () Bool)

(declare-fun mapDefault!52106 () ValueCell!15953)

(assert (=> b!1282154 (= condMapEmpty!52106 (= (arr!40754 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15953)) mapDefault!52106)))))

(declare-fun b!1282155 () Bool)

(declare-fun res!851341 () Bool)

(assert (=> b!1282155 (=> (not res!851341) (not e!732687))))

(assert (=> b!1282155 (= res!851341 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41306 _keys!1741))))))

(declare-fun b!1282156 () Bool)

(declare-fun res!851337 () Bool)

(assert (=> b!1282156 (=> (not res!851337) (not e!732687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84511 (_ BitVec 32)) Bool)

(assert (=> b!1282156 (= res!851337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282157 () Bool)

(declare-fun res!851340 () Bool)

(assert (=> b!1282157 (=> (not res!851340) (not e!732687))))

(declare-datatypes ((List!28903 0))(
  ( (Nil!28900) (Cons!28899 (h!30117 (_ BitVec 64)) (t!42435 List!28903)) )
))
(declare-fun arrayNoDuplicates!0 (array!84511 (_ BitVec 32) List!28903) Bool)

(assert (=> b!1282157 (= res!851340 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28900))))

(declare-fun b!1282158 () Bool)

(assert (=> b!1282158 (= e!732686 tp_is_empty!33703)))

(declare-fun res!851339 () Bool)

(assert (=> start!108740 (=> (not res!851339) (not e!732687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108740 (= res!851339 (validMask!0 mask!2175))))

(assert (=> start!108740 e!732687))

(assert (=> start!108740 tp_is_empty!33703))

(assert (=> start!108740 true))

(declare-fun array_inv!31137 (array!84509) Bool)

(assert (=> start!108740 (and (array_inv!31137 _values!1445) e!732685)))

(declare-fun array_inv!31138 (array!84511) Bool)

(assert (=> start!108740 (array_inv!31138 _keys!1741)))

(assert (=> start!108740 tp!99299))

(declare-fun b!1282153 () Bool)

(declare-fun res!851342 () Bool)

(assert (=> b!1282153 (=> (not res!851342) (not e!732687))))

(assert (=> b!1282153 (= res!851342 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41306 _keys!1741)) (not (= (select (arr!40755 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapIsEmpty!52106 () Bool)

(assert (=> mapIsEmpty!52106 mapRes!52106))

(declare-fun b!1282159 () Bool)

(assert (=> b!1282159 (= e!732687 (not true))))

(assert (=> b!1282159 (contains!7821 (getCurrentListMap!4761 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42374 0))(
  ( (Unit!42375) )
))
(declare-fun lt!576651 () Unit!42374)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!8 (array!84511 array!84509 (_ BitVec 32) (_ BitVec 32) V!50041 V!50041 (_ BitVec 64) (_ BitVec 32) Int) Unit!42374)

(assert (=> b!1282159 (= lt!576651 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!8 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(assert (= (and start!108740 res!851339) b!1282152))

(assert (= (and b!1282152 res!851338) b!1282156))

(assert (= (and b!1282156 res!851337) b!1282157))

(assert (= (and b!1282157 res!851340) b!1282155))

(assert (= (and b!1282155 res!851341) b!1282151))

(assert (= (and b!1282151 res!851343) b!1282153))

(assert (= (and b!1282153 res!851342) b!1282159))

(assert (= (and b!1282154 condMapEmpty!52106) mapIsEmpty!52106))

(assert (= (and b!1282154 (not condMapEmpty!52106)) mapNonEmpty!52106))

(get-info :version)

(assert (= (and mapNonEmpty!52106 ((_ is ValueCellFull!15953) mapValue!52106)) b!1282150))

(assert (= (and b!1282154 ((_ is ValueCellFull!15953) mapDefault!52106)) b!1282158))

(assert (= start!108740 b!1282154))

(declare-fun m!1176993 () Bool)

(assert (=> start!108740 m!1176993))

(declare-fun m!1176995 () Bool)

(assert (=> start!108740 m!1176995))

(declare-fun m!1176997 () Bool)

(assert (=> start!108740 m!1176997))

(declare-fun m!1176999 () Bool)

(assert (=> b!1282159 m!1176999))

(assert (=> b!1282159 m!1176999))

(declare-fun m!1177001 () Bool)

(assert (=> b!1282159 m!1177001))

(declare-fun m!1177003 () Bool)

(assert (=> b!1282159 m!1177003))

(declare-fun m!1177005 () Bool)

(assert (=> mapNonEmpty!52106 m!1177005))

(declare-fun m!1177007 () Bool)

(assert (=> b!1282157 m!1177007))

(declare-fun m!1177009 () Bool)

(assert (=> b!1282151 m!1177009))

(assert (=> b!1282151 m!1177009))

(declare-fun m!1177011 () Bool)

(assert (=> b!1282151 m!1177011))

(declare-fun m!1177013 () Bool)

(assert (=> b!1282153 m!1177013))

(declare-fun m!1177015 () Bool)

(assert (=> b!1282156 m!1177015))

(check-sat (not b!1282156) (not b!1282159) tp_is_empty!33703 (not b_next!28063) (not b!1282151) b_and!46125 (not mapNonEmpty!52106) (not start!108740) (not b!1282157))
(check-sat b_and!46125 (not b_next!28063))
