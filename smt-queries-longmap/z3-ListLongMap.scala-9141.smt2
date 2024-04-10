; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109632 () Bool)

(assert start!109632)

(declare-fun b_free!29121 () Bool)

(declare-fun b_next!29121 () Bool)

(assert (=> start!109632 (= b_free!29121 (not b_next!29121))))

(declare-fun tp!102482 () Bool)

(declare-fun b_and!47211 () Bool)

(assert (=> start!109632 (= tp!102482 b_and!47211)))

(declare-fun b!1298677 () Bool)

(declare-fun res!863090 () Bool)

(declare-fun e!740881 () Bool)

(assert (=> b!1298677 (=> (not res!863090) (not e!740881))))

(declare-datatypes ((array!86528 0))(
  ( (array!86529 (arr!41765 (Array (_ BitVec 32) (_ BitVec 64))) (size!42315 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86528)

(declare-datatypes ((List!29640 0))(
  ( (Nil!29637) (Cons!29636 (h!30845 (_ BitVec 64)) (t!43204 List!29640)) )
))
(declare-fun arrayNoDuplicates!0 (array!86528 (_ BitVec 32) List!29640) Bool)

(assert (=> b!1298677 (= res!863090 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29637))))

(declare-fun b!1298678 () Bool)

(declare-fun e!740880 () Bool)

(declare-fun tp_is_empty!34761 () Bool)

(assert (=> b!1298678 (= e!740880 tp_is_empty!34761)))

(declare-fun b!1298679 () Bool)

(declare-fun e!740879 () Bool)

(declare-fun e!740882 () Bool)

(declare-fun mapRes!53702 () Bool)

(assert (=> b!1298679 (= e!740879 (and e!740882 mapRes!53702))))

(declare-fun condMapEmpty!53702 () Bool)

(declare-datatypes ((V!51451 0))(
  ( (V!51452 (val!17455 Int)) )
))
(declare-datatypes ((ValueCell!16482 0))(
  ( (ValueCellFull!16482 (v!20058 V!51451)) (EmptyCell!16482) )
))
(declare-datatypes ((array!86530 0))(
  ( (array!86531 (arr!41766 (Array (_ BitVec 32) ValueCell!16482)) (size!42316 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86530)

(declare-fun mapDefault!53702 () ValueCell!16482)

(assert (=> b!1298679 (= condMapEmpty!53702 (= (arr!41766 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16482)) mapDefault!53702)))))

(declare-fun b!1298680 () Bool)

(declare-fun res!863091 () Bool)

(assert (=> b!1298680 (=> (not res!863091) (not e!740881))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1298680 (= res!863091 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42315 _keys!1741)) (not (= (select (arr!41765 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapNonEmpty!53702 () Bool)

(declare-fun tp!102481 () Bool)

(assert (=> mapNonEmpty!53702 (= mapRes!53702 (and tp!102481 e!740880))))

(declare-fun mapKey!53702 () (_ BitVec 32))

(declare-fun mapRest!53702 () (Array (_ BitVec 32) ValueCell!16482))

(declare-fun mapValue!53702 () ValueCell!16482)

(assert (=> mapNonEmpty!53702 (= (arr!41766 _values!1445) (store mapRest!53702 mapKey!53702 mapValue!53702))))

(declare-fun b!1298681 () Bool)

(declare-fun res!863088 () Bool)

(assert (=> b!1298681 (=> (not res!863088) (not e!740881))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86528 (_ BitVec 32)) Bool)

(assert (=> b!1298681 (= res!863088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298682 () Bool)

(assert (=> b!1298682 (= e!740882 tp_is_empty!34761)))

(declare-fun mapIsEmpty!53702 () Bool)

(assert (=> mapIsEmpty!53702 mapRes!53702))

(declare-fun b!1298683 () Bool)

(declare-fun res!863092 () Bool)

(assert (=> b!1298683 (=> (not res!863092) (not e!740881))))

(assert (=> b!1298683 (= res!863092 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42315 _keys!1741))))))

(declare-fun b!1298685 () Bool)

(declare-fun res!863093 () Bool)

(assert (=> b!1298685 (=> (not res!863093) (not e!740881))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298685 (= res!863093 (and (= (size!42316 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42315 _keys!1741) (size!42316 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298686 () Bool)

(assert (=> b!1298686 (= e!740881 (not (or (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvsub (size!42315 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)) (bvsub (size!42315 _keys!1741) from!2144)))))))

(declare-fun minValue!1387 () V!51451)

(declare-fun zeroValue!1387 () V!51451)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22512 0))(
  ( (tuple2!22513 (_1!11267 (_ BitVec 64)) (_2!11267 V!51451)) )
))
(declare-datatypes ((List!29641 0))(
  ( (Nil!29638) (Cons!29637 (h!30846 tuple2!22512) (t!43205 List!29641)) )
))
(declare-datatypes ((ListLongMap!20169 0))(
  ( (ListLongMap!20170 (toList!10100 List!29641)) )
))
(declare-fun contains!8218 (ListLongMap!20169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5129 (array!86528 array!86530 (_ BitVec 32) (_ BitVec 32) V!51451 V!51451 (_ BitVec 32) Int) ListLongMap!20169)

(assert (=> b!1298686 (contains!8218 (getCurrentListMap!5129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!43005 0))(
  ( (Unit!43006) )
))
(declare-fun lt!580727 () Unit!43005)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!55 (array!86528 array!86530 (_ BitVec 32) (_ BitVec 32) V!51451 V!51451 (_ BitVec 64) (_ BitVec 32) Int) Unit!43005)

(assert (=> b!1298686 (= lt!580727 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!55 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298684 () Bool)

(declare-fun res!863089 () Bool)

(assert (=> b!1298684 (=> (not res!863089) (not e!740881))))

(assert (=> b!1298684 (= res!863089 (contains!8218 (getCurrentListMap!5129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!863094 () Bool)

(assert (=> start!109632 (=> (not res!863094) (not e!740881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109632 (= res!863094 (validMask!0 mask!2175))))

(assert (=> start!109632 e!740881))

(assert (=> start!109632 tp_is_empty!34761))

(assert (=> start!109632 true))

(declare-fun array_inv!31611 (array!86530) Bool)

(assert (=> start!109632 (and (array_inv!31611 _values!1445) e!740879)))

(declare-fun array_inv!31612 (array!86528) Bool)

(assert (=> start!109632 (array_inv!31612 _keys!1741)))

(assert (=> start!109632 tp!102482))

(assert (= (and start!109632 res!863094) b!1298685))

(assert (= (and b!1298685 res!863093) b!1298681))

(assert (= (and b!1298681 res!863088) b!1298677))

(assert (= (and b!1298677 res!863090) b!1298683))

(assert (= (and b!1298683 res!863092) b!1298684))

(assert (= (and b!1298684 res!863089) b!1298680))

(assert (= (and b!1298680 res!863091) b!1298686))

(assert (= (and b!1298679 condMapEmpty!53702) mapIsEmpty!53702))

(assert (= (and b!1298679 (not condMapEmpty!53702)) mapNonEmpty!53702))

(get-info :version)

(assert (= (and mapNonEmpty!53702 ((_ is ValueCellFull!16482) mapValue!53702)) b!1298678))

(assert (= (and b!1298679 ((_ is ValueCellFull!16482) mapDefault!53702)) b!1298682))

(assert (= start!109632 b!1298679))

(declare-fun m!1189979 () Bool)

(assert (=> b!1298684 m!1189979))

(assert (=> b!1298684 m!1189979))

(declare-fun m!1189981 () Bool)

(assert (=> b!1298684 m!1189981))

(declare-fun m!1189983 () Bool)

(assert (=> b!1298681 m!1189983))

(declare-fun m!1189985 () Bool)

(assert (=> mapNonEmpty!53702 m!1189985))

(declare-fun m!1189987 () Bool)

(assert (=> start!109632 m!1189987))

(declare-fun m!1189989 () Bool)

(assert (=> start!109632 m!1189989))

(declare-fun m!1189991 () Bool)

(assert (=> start!109632 m!1189991))

(declare-fun m!1189993 () Bool)

(assert (=> b!1298677 m!1189993))

(declare-fun m!1189995 () Bool)

(assert (=> b!1298680 m!1189995))

(declare-fun m!1189997 () Bool)

(assert (=> b!1298686 m!1189997))

(assert (=> b!1298686 m!1189997))

(declare-fun m!1189999 () Bool)

(assert (=> b!1298686 m!1189999))

(declare-fun m!1190001 () Bool)

(assert (=> b!1298686 m!1190001))

(check-sat (not b!1298681) (not b_next!29121) (not start!109632) (not mapNonEmpty!53702) (not b!1298677) tp_is_empty!34761 (not b!1298686) (not b!1298684) b_and!47211)
(check-sat b_and!47211 (not b_next!29121))
