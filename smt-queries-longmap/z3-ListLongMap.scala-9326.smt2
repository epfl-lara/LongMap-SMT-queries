; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111394 () Bool)

(assert start!111394)

(declare-fun b_free!30051 () Bool)

(declare-fun b_next!30051 () Bool)

(assert (=> start!111394 (= b_free!30051 (not b_next!30051))))

(declare-fun tp!105629 () Bool)

(declare-fun b_and!48271 () Bool)

(assert (=> start!111394 (= tp!105629 b_and!48271)))

(declare-fun b!1318132 () Bool)

(declare-fun e!752222 () Bool)

(assert (=> b!1318132 (= e!752222 false)))

(declare-datatypes ((array!88690 0))(
  ( (array!88691 (arr!42819 (Array (_ BitVec 32) (_ BitVec 64))) (size!43369 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88690)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52931 0))(
  ( (V!52932 (val!18010 Int)) )
))
(declare-fun zeroValue!1279 () V!52931)

(declare-datatypes ((ValueCell!17037 0))(
  ( (ValueCellFull!17037 (v!20640 V!52931)) (EmptyCell!17037) )
))
(declare-datatypes ((array!88692 0))(
  ( (array!88693 (arr!42820 (Array (_ BitVec 32) ValueCell!17037)) (size!43370 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88692)

(declare-fun minValue!1279 () V!52931)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!586452 () Bool)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23180 0))(
  ( (tuple2!23181 (_1!11601 (_ BitVec 64)) (_2!11601 V!52931)) )
))
(declare-datatypes ((List!30336 0))(
  ( (Nil!30333) (Cons!30332 (h!31541 tuple2!23180) (t!43944 List!30336)) )
))
(declare-datatypes ((ListLongMap!20837 0))(
  ( (ListLongMap!20838 (toList!10434 List!30336)) )
))
(declare-fun contains!8589 (ListLongMap!20837 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5447 (array!88690 array!88692 (_ BitVec 32) (_ BitVec 32) V!52931 V!52931 (_ BitVec 32) Int) ListLongMap!20837)

(assert (=> b!1318132 (= lt!586452 (contains!8589 (getCurrentListMap!5447 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318133 () Bool)

(declare-fun res!874801 () Bool)

(assert (=> b!1318133 (=> (not res!874801) (not e!752222))))

(assert (=> b!1318133 (= res!874801 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43369 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318134 () Bool)

(declare-fun e!752223 () Bool)

(declare-fun tp_is_empty!35871 () Bool)

(assert (=> b!1318134 (= e!752223 tp_is_empty!35871)))

(declare-fun b!1318135 () Bool)

(declare-fun res!874803 () Bool)

(assert (=> b!1318135 (=> (not res!874803) (not e!752222))))

(declare-datatypes ((List!30337 0))(
  ( (Nil!30334) (Cons!30333 (h!31542 (_ BitVec 64)) (t!43945 List!30337)) )
))
(declare-fun arrayNoDuplicates!0 (array!88690 (_ BitVec 32) List!30337) Bool)

(assert (=> b!1318135 (= res!874803 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30334))))

(declare-fun b!1318136 () Bool)

(declare-fun res!874805 () Bool)

(assert (=> b!1318136 (=> (not res!874805) (not e!752222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88690 (_ BitVec 32)) Bool)

(assert (=> b!1318136 (= res!874805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55454 () Bool)

(declare-fun mapRes!55454 () Bool)

(declare-fun tp!105628 () Bool)

(declare-fun e!752224 () Bool)

(assert (=> mapNonEmpty!55454 (= mapRes!55454 (and tp!105628 e!752224))))

(declare-fun mapValue!55454 () ValueCell!17037)

(declare-fun mapKey!55454 () (_ BitVec 32))

(declare-fun mapRest!55454 () (Array (_ BitVec 32) ValueCell!17037))

(assert (=> mapNonEmpty!55454 (= (arr!42820 _values!1337) (store mapRest!55454 mapKey!55454 mapValue!55454))))

(declare-fun mapIsEmpty!55454 () Bool)

(assert (=> mapIsEmpty!55454 mapRes!55454))

(declare-fun res!874802 () Bool)

(assert (=> start!111394 (=> (not res!874802) (not e!752222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111394 (= res!874802 (validMask!0 mask!2019))))

(assert (=> start!111394 e!752222))

(declare-fun array_inv!32339 (array!88690) Bool)

(assert (=> start!111394 (array_inv!32339 _keys!1609)))

(assert (=> start!111394 true))

(assert (=> start!111394 tp_is_empty!35871))

(declare-fun e!752221 () Bool)

(declare-fun array_inv!32340 (array!88692) Bool)

(assert (=> start!111394 (and (array_inv!32340 _values!1337) e!752221)))

(assert (=> start!111394 tp!105629))

(declare-fun b!1318137 () Bool)

(assert (=> b!1318137 (= e!752221 (and e!752223 mapRes!55454))))

(declare-fun condMapEmpty!55454 () Bool)

(declare-fun mapDefault!55454 () ValueCell!17037)

(assert (=> b!1318137 (= condMapEmpty!55454 (= (arr!42820 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17037)) mapDefault!55454)))))

(declare-fun b!1318138 () Bool)

(declare-fun res!874804 () Bool)

(assert (=> b!1318138 (=> (not res!874804) (not e!752222))))

(assert (=> b!1318138 (= res!874804 (and (= (size!43370 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43369 _keys!1609) (size!43370 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318139 () Bool)

(assert (=> b!1318139 (= e!752224 tp_is_empty!35871)))

(assert (= (and start!111394 res!874802) b!1318138))

(assert (= (and b!1318138 res!874804) b!1318136))

(assert (= (and b!1318136 res!874805) b!1318135))

(assert (= (and b!1318135 res!874803) b!1318133))

(assert (= (and b!1318133 res!874801) b!1318132))

(assert (= (and b!1318137 condMapEmpty!55454) mapIsEmpty!55454))

(assert (= (and b!1318137 (not condMapEmpty!55454)) mapNonEmpty!55454))

(get-info :version)

(assert (= (and mapNonEmpty!55454 ((_ is ValueCellFull!17037) mapValue!55454)) b!1318139))

(assert (= (and b!1318137 ((_ is ValueCellFull!17037) mapDefault!55454)) b!1318134))

(assert (= start!111394 b!1318137))

(declare-fun m!1205755 () Bool)

(assert (=> mapNonEmpty!55454 m!1205755))

(declare-fun m!1205757 () Bool)

(assert (=> start!111394 m!1205757))

(declare-fun m!1205759 () Bool)

(assert (=> start!111394 m!1205759))

(declare-fun m!1205761 () Bool)

(assert (=> start!111394 m!1205761))

(declare-fun m!1205763 () Bool)

(assert (=> b!1318132 m!1205763))

(assert (=> b!1318132 m!1205763))

(declare-fun m!1205765 () Bool)

(assert (=> b!1318132 m!1205765))

(declare-fun m!1205767 () Bool)

(assert (=> b!1318135 m!1205767))

(declare-fun m!1205769 () Bool)

(assert (=> b!1318136 m!1205769))

(check-sat tp_is_empty!35871 (not b_next!30051) b_and!48271 (not b!1318132) (not start!111394) (not b!1318136) (not b!1318135) (not mapNonEmpty!55454))
(check-sat b_and!48271 (not b_next!30051))
