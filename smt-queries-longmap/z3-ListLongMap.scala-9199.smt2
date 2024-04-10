; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110544 () Bool)

(assert start!110544)

(declare-fun b_free!29379 () Bool)

(declare-fun b_next!29379 () Bool)

(assert (=> start!110544 (= b_free!29379 (not b_next!29379))))

(declare-fun tp!103459 () Bool)

(declare-fun b_and!47587 () Bool)

(assert (=> start!110544 (= tp!103459 b_and!47587)))

(declare-fun mapNonEmpty!54292 () Bool)

(declare-fun mapRes!54292 () Bool)

(declare-fun tp!103458 () Bool)

(declare-fun e!746204 () Bool)

(assert (=> mapNonEmpty!54292 (= mapRes!54292 (and tp!103458 e!746204))))

(declare-fun mapKey!54292 () (_ BitVec 32))

(declare-datatypes ((V!51915 0))(
  ( (V!51916 (val!17629 Int)) )
))
(declare-datatypes ((ValueCell!16656 0))(
  ( (ValueCellFull!16656 (v!20256 V!51915)) (EmptyCell!16656) )
))
(declare-datatypes ((array!87218 0))(
  ( (array!87219 (arr!42089 (Array (_ BitVec 32) ValueCell!16656)) (size!42639 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87218)

(declare-fun mapValue!54292 () ValueCell!16656)

(declare-fun mapRest!54292 () (Array (_ BitVec 32) ValueCell!16656))

(assert (=> mapNonEmpty!54292 (= (arr!42089 _values!1354) (store mapRest!54292 mapKey!54292 mapValue!54292))))

(declare-fun b!1307687 () Bool)

(declare-fun res!868028 () Bool)

(declare-fun e!746205 () Bool)

(assert (=> b!1307687 (=> (not res!868028) (not e!746205))))

(declare-datatypes ((array!87220 0))(
  ( (array!87221 (arr!42090 (Array (_ BitVec 32) (_ BitVec 64))) (size!42640 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87220)

(declare-datatypes ((List!29835 0))(
  ( (Nil!29832) (Cons!29831 (h!31040 (_ BitVec 64)) (t!43441 List!29835)) )
))
(declare-fun arrayNoDuplicates!0 (array!87220 (_ BitVec 32) List!29835) Bool)

(assert (=> b!1307687 (= res!868028 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29832))))

(declare-fun b!1307688 () Bool)

(declare-fun res!868026 () Bool)

(assert (=> b!1307688 (=> (not res!868026) (not e!746205))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307688 (= res!868026 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42640 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!868029 () Bool)

(assert (=> start!110544 (=> (not res!868029) (not e!746205))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110544 (= res!868029 (validMask!0 mask!2040))))

(assert (=> start!110544 e!746205))

(assert (=> start!110544 tp!103459))

(declare-fun array_inv!31811 (array!87220) Bool)

(assert (=> start!110544 (array_inv!31811 _keys!1628)))

(assert (=> start!110544 true))

(declare-fun tp_is_empty!35109 () Bool)

(assert (=> start!110544 tp_is_empty!35109))

(declare-fun e!746207 () Bool)

(declare-fun array_inv!31812 (array!87218) Bool)

(assert (=> start!110544 (and (array_inv!31812 _values!1354) e!746207)))

(declare-fun b!1307689 () Bool)

(assert (=> b!1307689 (= e!746204 tp_is_empty!35109)))

(declare-fun b!1307690 () Bool)

(assert (=> b!1307690 (= e!746205 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51915)

(declare-fun lt!585087 () Bool)

(declare-fun zeroValue!1296 () V!51915)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22692 0))(
  ( (tuple2!22693 (_1!11357 (_ BitVec 64)) (_2!11357 V!51915)) )
))
(declare-datatypes ((List!29836 0))(
  ( (Nil!29833) (Cons!29832 (h!31041 tuple2!22692) (t!43442 List!29836)) )
))
(declare-datatypes ((ListLongMap!20349 0))(
  ( (ListLongMap!20350 (toList!10190 List!29836)) )
))
(declare-fun contains!8340 (ListLongMap!20349 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5203 (array!87220 array!87218 (_ BitVec 32) (_ BitVec 32) V!51915 V!51915 (_ BitVec 32) Int) ListLongMap!20349)

(assert (=> b!1307690 (= lt!585087 (contains!8340 (getCurrentListMap!5203 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54292 () Bool)

(assert (=> mapIsEmpty!54292 mapRes!54292))

(declare-fun b!1307691 () Bool)

(declare-fun res!868025 () Bool)

(assert (=> b!1307691 (=> (not res!868025) (not e!746205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87220 (_ BitVec 32)) Bool)

(assert (=> b!1307691 (= res!868025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307692 () Bool)

(declare-fun res!868027 () Bool)

(assert (=> b!1307692 (=> (not res!868027) (not e!746205))))

(assert (=> b!1307692 (= res!868027 (and (= (size!42639 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42640 _keys!1628) (size!42639 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307693 () Bool)

(declare-fun e!746203 () Bool)

(assert (=> b!1307693 (= e!746203 tp_is_empty!35109)))

(declare-fun b!1307694 () Bool)

(assert (=> b!1307694 (= e!746207 (and e!746203 mapRes!54292))))

(declare-fun condMapEmpty!54292 () Bool)

(declare-fun mapDefault!54292 () ValueCell!16656)

(assert (=> b!1307694 (= condMapEmpty!54292 (= (arr!42089 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16656)) mapDefault!54292)))))

(assert (= (and start!110544 res!868029) b!1307692))

(assert (= (and b!1307692 res!868027) b!1307691))

(assert (= (and b!1307691 res!868025) b!1307687))

(assert (= (and b!1307687 res!868028) b!1307688))

(assert (= (and b!1307688 res!868026) b!1307690))

(assert (= (and b!1307694 condMapEmpty!54292) mapIsEmpty!54292))

(assert (= (and b!1307694 (not condMapEmpty!54292)) mapNonEmpty!54292))

(get-info :version)

(assert (= (and mapNonEmpty!54292 ((_ is ValueCellFull!16656) mapValue!54292)) b!1307689))

(assert (= (and b!1307694 ((_ is ValueCellFull!16656) mapDefault!54292)) b!1307693))

(assert (= start!110544 b!1307694))

(declare-fun m!1198297 () Bool)

(assert (=> start!110544 m!1198297))

(declare-fun m!1198299 () Bool)

(assert (=> start!110544 m!1198299))

(declare-fun m!1198301 () Bool)

(assert (=> start!110544 m!1198301))

(declare-fun m!1198303 () Bool)

(assert (=> b!1307691 m!1198303))

(declare-fun m!1198305 () Bool)

(assert (=> b!1307687 m!1198305))

(declare-fun m!1198307 () Bool)

(assert (=> b!1307690 m!1198307))

(assert (=> b!1307690 m!1198307))

(declare-fun m!1198309 () Bool)

(assert (=> b!1307690 m!1198309))

(declare-fun m!1198311 () Bool)

(assert (=> mapNonEmpty!54292 m!1198311))

(check-sat (not b!1307691) b_and!47587 tp_is_empty!35109 (not b_next!29379) (not start!110544) (not b!1307687) (not mapNonEmpty!54292) (not b!1307690))
(check-sat b_and!47587 (not b_next!29379))
