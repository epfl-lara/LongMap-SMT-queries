; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109606 () Bool)

(assert start!109606)

(declare-fun b_free!29095 () Bool)

(declare-fun b_next!29095 () Bool)

(assert (=> start!109606 (= b_free!29095 (not b_next!29095))))

(declare-fun tp!102405 () Bool)

(declare-fun b_and!47167 () Bool)

(assert (=> start!109606 (= tp!102405 b_and!47167)))

(declare-fun b!1298223 () Bool)

(declare-fun res!862790 () Bool)

(declare-fun e!740657 () Bool)

(assert (=> b!1298223 (=> (not res!862790) (not e!740657))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86371 0))(
  ( (array!86372 (arr!41687 (Array (_ BitVec 32) (_ BitVec 64))) (size!42239 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86371)

(assert (=> b!1298223 (= res!862790 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42239 _keys!1741)) (not (= (select (arr!41687 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1298224 () Bool)

(declare-fun res!862794 () Bool)

(assert (=> b!1298224 (=> (not res!862794) (not e!740657))))

(declare-datatypes ((List!29657 0))(
  ( (Nil!29654) (Cons!29653 (h!30862 (_ BitVec 64)) (t!43213 List!29657)) )
))
(declare-fun arrayNoDuplicates!0 (array!86371 (_ BitVec 32) List!29657) Bool)

(assert (=> b!1298224 (= res!862794 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29654))))

(declare-fun b!1298225 () Bool)

(declare-fun res!862788 () Bool)

(assert (=> b!1298225 (=> (not res!862788) (not e!740657))))

(assert (=> b!1298225 (= res!862788 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42239 _keys!1741))))))

(declare-fun b!1298226 () Bool)

(assert (=> b!1298226 (= e!740657 (not true))))

(declare-datatypes ((V!51417 0))(
  ( (V!51418 (val!17442 Int)) )
))
(declare-fun minValue!1387 () V!51417)

(declare-fun zeroValue!1387 () V!51417)

(declare-datatypes ((ValueCell!16469 0))(
  ( (ValueCellFull!16469 (v!20044 V!51417)) (EmptyCell!16469) )
))
(declare-datatypes ((array!86373 0))(
  ( (array!86374 (arr!41688 (Array (_ BitVec 32) ValueCell!16469)) (size!42240 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86373)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22534 0))(
  ( (tuple2!22535 (_1!11278 (_ BitVec 64)) (_2!11278 V!51417)) )
))
(declare-datatypes ((List!29658 0))(
  ( (Nil!29655) (Cons!29654 (h!30863 tuple2!22534) (t!43214 List!29658)) )
))
(declare-datatypes ((ListLongMap!20191 0))(
  ( (ListLongMap!20192 (toList!10111 List!29658)) )
))
(declare-fun contains!8159 (ListLongMap!20191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5027 (array!86371 array!86373 (_ BitVec 32) (_ BitVec 32) V!51417 V!51417 (_ BitVec 32) Int) ListLongMap!20191)

(assert (=> b!1298226 (contains!8159 (getCurrentListMap!5027 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42828 0))(
  ( (Unit!42829) )
))
(declare-fun lt!580510 () Unit!42828)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!39 (array!86371 array!86373 (_ BitVec 32) (_ BitVec 32) V!51417 V!51417 (_ BitVec 64) (_ BitVec 32) Int) Unit!42828)

(assert (=> b!1298226 (= lt!580510 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!39 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53663 () Bool)

(declare-fun mapRes!53663 () Bool)

(assert (=> mapIsEmpty!53663 mapRes!53663))

(declare-fun b!1298227 () Bool)

(declare-fun e!740654 () Bool)

(declare-fun tp_is_empty!34735 () Bool)

(assert (=> b!1298227 (= e!740654 tp_is_empty!34735)))

(declare-fun b!1298229 () Bool)

(declare-fun res!862791 () Bool)

(assert (=> b!1298229 (=> (not res!862791) (not e!740657))))

(assert (=> b!1298229 (= res!862791 (and (= (size!42240 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42239 _keys!1741) (size!42240 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53663 () Bool)

(declare-fun tp!102404 () Bool)

(assert (=> mapNonEmpty!53663 (= mapRes!53663 (and tp!102404 e!740654))))

(declare-fun mapValue!53663 () ValueCell!16469)

(declare-fun mapKey!53663 () (_ BitVec 32))

(declare-fun mapRest!53663 () (Array (_ BitVec 32) ValueCell!16469))

(assert (=> mapNonEmpty!53663 (= (arr!41688 _values!1445) (store mapRest!53663 mapKey!53663 mapValue!53663))))

(declare-fun b!1298230 () Bool)

(declare-fun res!862792 () Bool)

(assert (=> b!1298230 (=> (not res!862792) (not e!740657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86371 (_ BitVec 32)) Bool)

(assert (=> b!1298230 (= res!862792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298228 () Bool)

(declare-fun res!862793 () Bool)

(assert (=> b!1298228 (=> (not res!862793) (not e!740657))))

(assert (=> b!1298228 (= res!862793 (contains!8159 (getCurrentListMap!5027 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!862789 () Bool)

(assert (=> start!109606 (=> (not res!862789) (not e!740657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109606 (= res!862789 (validMask!0 mask!2175))))

(assert (=> start!109606 e!740657))

(assert (=> start!109606 tp_is_empty!34735))

(assert (=> start!109606 true))

(declare-fun e!740658 () Bool)

(declare-fun array_inv!31713 (array!86373) Bool)

(assert (=> start!109606 (and (array_inv!31713 _values!1445) e!740658)))

(declare-fun array_inv!31714 (array!86371) Bool)

(assert (=> start!109606 (array_inv!31714 _keys!1741)))

(assert (=> start!109606 tp!102405))

(declare-fun b!1298231 () Bool)

(declare-fun e!740655 () Bool)

(assert (=> b!1298231 (= e!740655 tp_is_empty!34735)))

(declare-fun b!1298232 () Bool)

(assert (=> b!1298232 (= e!740658 (and e!740655 mapRes!53663))))

(declare-fun condMapEmpty!53663 () Bool)

(declare-fun mapDefault!53663 () ValueCell!16469)

(assert (=> b!1298232 (= condMapEmpty!53663 (= (arr!41688 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16469)) mapDefault!53663)))))

(assert (= (and start!109606 res!862789) b!1298229))

(assert (= (and b!1298229 res!862791) b!1298230))

(assert (= (and b!1298230 res!862792) b!1298224))

(assert (= (and b!1298224 res!862794) b!1298225))

(assert (= (and b!1298225 res!862788) b!1298228))

(assert (= (and b!1298228 res!862793) b!1298223))

(assert (= (and b!1298223 res!862790) b!1298226))

(assert (= (and b!1298232 condMapEmpty!53663) mapIsEmpty!53663))

(assert (= (and b!1298232 (not condMapEmpty!53663)) mapNonEmpty!53663))

(get-info :version)

(assert (= (and mapNonEmpty!53663 ((_ is ValueCellFull!16469) mapValue!53663)) b!1298227))

(assert (= (and b!1298232 ((_ is ValueCellFull!16469) mapDefault!53663)) b!1298231))

(assert (= start!109606 b!1298232))

(declare-fun m!1189167 () Bool)

(assert (=> b!1298230 m!1189167))

(declare-fun m!1189169 () Bool)

(assert (=> start!109606 m!1189169))

(declare-fun m!1189171 () Bool)

(assert (=> start!109606 m!1189171))

(declare-fun m!1189173 () Bool)

(assert (=> start!109606 m!1189173))

(declare-fun m!1189175 () Bool)

(assert (=> mapNonEmpty!53663 m!1189175))

(declare-fun m!1189177 () Bool)

(assert (=> b!1298228 m!1189177))

(assert (=> b!1298228 m!1189177))

(declare-fun m!1189179 () Bool)

(assert (=> b!1298228 m!1189179))

(declare-fun m!1189181 () Bool)

(assert (=> b!1298224 m!1189181))

(declare-fun m!1189183 () Bool)

(assert (=> b!1298226 m!1189183))

(assert (=> b!1298226 m!1189183))

(declare-fun m!1189185 () Bool)

(assert (=> b!1298226 m!1189185))

(declare-fun m!1189187 () Bool)

(assert (=> b!1298226 m!1189187))

(declare-fun m!1189189 () Bool)

(assert (=> b!1298223 m!1189189))

(check-sat (not b_next!29095) (not mapNonEmpty!53663) (not b!1298228) b_and!47167 (not b!1298226) (not start!109606) (not b!1298224) (not b!1298230) tp_is_empty!34735)
(check-sat b_and!47167 (not b_next!29095))
