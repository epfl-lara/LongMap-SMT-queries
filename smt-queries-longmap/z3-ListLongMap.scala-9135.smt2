; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109596 () Bool)

(assert start!109596)

(declare-fun b_free!29085 () Bool)

(declare-fun b_next!29085 () Bool)

(assert (=> start!109596 (= b_free!29085 (not b_next!29085))))

(declare-fun tp!102374 () Bool)

(declare-fun b_and!47175 () Bool)

(assert (=> start!109596 (= tp!102374 b_and!47175)))

(declare-fun b!1298137 () Bool)

(declare-fun e!740610 () Bool)

(assert (=> b!1298137 (= e!740610 (not true))))

(declare-datatypes ((V!51403 0))(
  ( (V!51404 (val!17437 Int)) )
))
(declare-fun minValue!1387 () V!51403)

(declare-fun zeroValue!1387 () V!51403)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16464 0))(
  ( (ValueCellFull!16464 (v!20040 V!51403)) (EmptyCell!16464) )
))
(declare-datatypes ((array!86456 0))(
  ( (array!86457 (arr!41729 (Array (_ BitVec 32) ValueCell!16464)) (size!42279 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86456)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!86458 0))(
  ( (array!86459 (arr!41730 (Array (_ BitVec 32) (_ BitVec 64))) (size!42280 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86458)

(declare-datatypes ((tuple2!22480 0))(
  ( (tuple2!22481 (_1!11251 (_ BitVec 64)) (_2!11251 V!51403)) )
))
(declare-datatypes ((List!29611 0))(
  ( (Nil!29608) (Cons!29607 (h!30816 tuple2!22480) (t!43175 List!29611)) )
))
(declare-datatypes ((ListLongMap!20137 0))(
  ( (ListLongMap!20138 (toList!10084 List!29611)) )
))
(declare-fun contains!8202 (ListLongMap!20137 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5113 (array!86458 array!86456 (_ BitVec 32) (_ BitVec 32) V!51403 V!51403 (_ BitVec 32) Int) ListLongMap!20137)

(assert (=> b!1298137 (contains!8202 (getCurrentListMap!5113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42979 0))(
  ( (Unit!42980) )
))
(declare-fun lt!580673 () Unit!42979)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!42 (array!86458 array!86456 (_ BitVec 32) (_ BitVec 32) V!51403 V!51403 (_ BitVec 64) (_ BitVec 32) Int) Unit!42979)

(assert (=> b!1298137 (= lt!580673 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!42 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298138 () Bool)

(declare-fun e!740608 () Bool)

(declare-fun tp_is_empty!34725 () Bool)

(assert (=> b!1298138 (= e!740608 tp_is_empty!34725)))

(declare-fun mapNonEmpty!53648 () Bool)

(declare-fun mapRes!53648 () Bool)

(declare-fun tp!102373 () Bool)

(declare-fun e!740612 () Bool)

(assert (=> mapNonEmpty!53648 (= mapRes!53648 (and tp!102373 e!740612))))

(declare-fun mapValue!53648 () ValueCell!16464)

(declare-fun mapKey!53648 () (_ BitVec 32))

(declare-fun mapRest!53648 () (Array (_ BitVec 32) ValueCell!16464))

(assert (=> mapNonEmpty!53648 (= (arr!41729 _values!1445) (store mapRest!53648 mapKey!53648 mapValue!53648))))

(declare-fun mapIsEmpty!53648 () Bool)

(assert (=> mapIsEmpty!53648 mapRes!53648))

(declare-fun res!862712 () Bool)

(assert (=> start!109596 (=> (not res!862712) (not e!740610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109596 (= res!862712 (validMask!0 mask!2175))))

(assert (=> start!109596 e!740610))

(assert (=> start!109596 tp_is_empty!34725))

(assert (=> start!109596 true))

(declare-fun e!740611 () Bool)

(declare-fun array_inv!31585 (array!86456) Bool)

(assert (=> start!109596 (and (array_inv!31585 _values!1445) e!740611)))

(declare-fun array_inv!31586 (array!86458) Bool)

(assert (=> start!109596 (array_inv!31586 _keys!1741)))

(assert (=> start!109596 tp!102374))

(declare-fun b!1298139 () Bool)

(declare-fun res!862716 () Bool)

(assert (=> b!1298139 (=> (not res!862716) (not e!740610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86458 (_ BitVec 32)) Bool)

(assert (=> b!1298139 (= res!862716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298140 () Bool)

(declare-fun res!862710 () Bool)

(assert (=> b!1298140 (=> (not res!862710) (not e!740610))))

(declare-datatypes ((List!29612 0))(
  ( (Nil!29609) (Cons!29608 (h!30817 (_ BitVec 64)) (t!43176 List!29612)) )
))
(declare-fun arrayNoDuplicates!0 (array!86458 (_ BitVec 32) List!29612) Bool)

(assert (=> b!1298140 (= res!862710 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29609))))

(declare-fun b!1298141 () Bool)

(declare-fun res!862713 () Bool)

(assert (=> b!1298141 (=> (not res!862713) (not e!740610))))

(assert (=> b!1298141 (= res!862713 (contains!8202 (getCurrentListMap!5113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298142 () Bool)

(assert (=> b!1298142 (= e!740612 tp_is_empty!34725)))

(declare-fun b!1298143 () Bool)

(assert (=> b!1298143 (= e!740611 (and e!740608 mapRes!53648))))

(declare-fun condMapEmpty!53648 () Bool)

(declare-fun mapDefault!53648 () ValueCell!16464)

(assert (=> b!1298143 (= condMapEmpty!53648 (= (arr!41729 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16464)) mapDefault!53648)))))

(declare-fun b!1298144 () Bool)

(declare-fun res!862711 () Bool)

(assert (=> b!1298144 (=> (not res!862711) (not e!740610))))

(assert (=> b!1298144 (= res!862711 (and (= (size!42279 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42280 _keys!1741) (size!42279 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298145 () Bool)

(declare-fun res!862714 () Bool)

(assert (=> b!1298145 (=> (not res!862714) (not e!740610))))

(assert (=> b!1298145 (= res!862714 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42280 _keys!1741)) (not (= (select (arr!41730 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1298146 () Bool)

(declare-fun res!862715 () Bool)

(assert (=> b!1298146 (=> (not res!862715) (not e!740610))))

(assert (=> b!1298146 (= res!862715 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42280 _keys!1741))))))

(assert (= (and start!109596 res!862712) b!1298144))

(assert (= (and b!1298144 res!862711) b!1298139))

(assert (= (and b!1298139 res!862716) b!1298140))

(assert (= (and b!1298140 res!862710) b!1298146))

(assert (= (and b!1298146 res!862715) b!1298141))

(assert (= (and b!1298141 res!862713) b!1298145))

(assert (= (and b!1298145 res!862714) b!1298137))

(assert (= (and b!1298143 condMapEmpty!53648) mapIsEmpty!53648))

(assert (= (and b!1298143 (not condMapEmpty!53648)) mapNonEmpty!53648))

(get-info :version)

(assert (= (and mapNonEmpty!53648 ((_ is ValueCellFull!16464) mapValue!53648)) b!1298142))

(assert (= (and b!1298143 ((_ is ValueCellFull!16464) mapDefault!53648)) b!1298138))

(assert (= start!109596 b!1298143))

(declare-fun m!1189547 () Bool)

(assert (=> b!1298145 m!1189547))

(declare-fun m!1189549 () Bool)

(assert (=> b!1298141 m!1189549))

(assert (=> b!1298141 m!1189549))

(declare-fun m!1189551 () Bool)

(assert (=> b!1298141 m!1189551))

(declare-fun m!1189553 () Bool)

(assert (=> start!109596 m!1189553))

(declare-fun m!1189555 () Bool)

(assert (=> start!109596 m!1189555))

(declare-fun m!1189557 () Bool)

(assert (=> start!109596 m!1189557))

(declare-fun m!1189559 () Bool)

(assert (=> mapNonEmpty!53648 m!1189559))

(declare-fun m!1189561 () Bool)

(assert (=> b!1298140 m!1189561))

(declare-fun m!1189563 () Bool)

(assert (=> b!1298137 m!1189563))

(assert (=> b!1298137 m!1189563))

(declare-fun m!1189565 () Bool)

(assert (=> b!1298137 m!1189565))

(declare-fun m!1189567 () Bool)

(assert (=> b!1298137 m!1189567))

(declare-fun m!1189569 () Bool)

(assert (=> b!1298139 m!1189569))

(check-sat (not b!1298140) (not b!1298137) tp_is_empty!34725 b_and!47175 (not mapNonEmpty!53648) (not start!109596) (not b!1298139) (not b!1298141) (not b_next!29085))
(check-sat b_and!47175 (not b_next!29085))
