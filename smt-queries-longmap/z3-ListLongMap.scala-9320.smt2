; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111580 () Bool)

(assert start!111580)

(declare-fun b_free!30013 () Bool)

(declare-fun b_next!30013 () Bool)

(assert (=> start!111580 (= b_free!30013 (not b_next!30013))))

(declare-fun tp!105514 () Bool)

(declare-fun b_and!48235 () Bool)

(assert (=> start!111580 (= tp!105514 b_and!48235)))

(declare-fun b!1318975 () Bool)

(declare-fun res!875035 () Bool)

(declare-fun e!752778 () Bool)

(assert (=> b!1318975 (=> (not res!875035) (not e!752778))))

(declare-datatypes ((array!88687 0))(
  ( (array!88688 (arr!42813 (Array (_ BitVec 32) (_ BitVec 64))) (size!43364 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88687)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52881 0))(
  ( (V!52882 (val!17991 Int)) )
))
(declare-datatypes ((ValueCell!17018 0))(
  ( (ValueCellFull!17018 (v!20616 V!52881)) (EmptyCell!17018) )
))
(declare-datatypes ((array!88689 0))(
  ( (array!88690 (arr!42814 (Array (_ BitVec 32) ValueCell!17018)) (size!43365 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88689)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1318975 (= res!875035 (and (= (size!43365 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43364 _keys!1609) (size!43365 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!875037 () Bool)

(assert (=> start!111580 (=> (not res!875037) (not e!752778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111580 (= res!875037 (validMask!0 mask!2019))))

(assert (=> start!111580 e!752778))

(declare-fun array_inv!32607 (array!88687) Bool)

(assert (=> start!111580 (array_inv!32607 _keys!1609)))

(assert (=> start!111580 true))

(declare-fun tp_is_empty!35833 () Bool)

(assert (=> start!111580 tp_is_empty!35833))

(declare-fun e!752782 () Bool)

(declare-fun array_inv!32608 (array!88689) Bool)

(assert (=> start!111580 (and (array_inv!32608 _values!1337) e!752782)))

(assert (=> start!111580 tp!105514))

(declare-fun b!1318976 () Bool)

(declare-fun res!875036 () Bool)

(assert (=> b!1318976 (=> (not res!875036) (not e!752778))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318976 (= res!875036 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43364 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318977 () Bool)

(assert (=> b!1318977 (= e!752778 false)))

(declare-fun zeroValue!1279 () V!52881)

(declare-fun lt!586871 () Bool)

(declare-fun minValue!1279 () V!52881)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23184 0))(
  ( (tuple2!23185 (_1!11603 (_ BitVec 64)) (_2!11603 V!52881)) )
))
(declare-datatypes ((List!30348 0))(
  ( (Nil!30345) (Cons!30344 (h!31562 tuple2!23184) (t!43948 List!30348)) )
))
(declare-datatypes ((ListLongMap!20849 0))(
  ( (ListLongMap!20850 (toList!10440 List!30348)) )
))
(declare-fun contains!8607 (ListLongMap!20849 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5444 (array!88687 array!88689 (_ BitVec 32) (_ BitVec 32) V!52881 V!52881 (_ BitVec 32) Int) ListLongMap!20849)

(assert (=> b!1318977 (= lt!586871 (contains!8607 (getCurrentListMap!5444 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318978 () Bool)

(declare-fun e!752780 () Bool)

(assert (=> b!1318978 (= e!752780 tp_is_empty!35833)))

(declare-fun b!1318979 () Bool)

(declare-fun mapRes!55397 () Bool)

(assert (=> b!1318979 (= e!752782 (and e!752780 mapRes!55397))))

(declare-fun condMapEmpty!55397 () Bool)

(declare-fun mapDefault!55397 () ValueCell!17018)

(assert (=> b!1318979 (= condMapEmpty!55397 (= (arr!42814 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17018)) mapDefault!55397)))))

(declare-fun mapNonEmpty!55397 () Bool)

(declare-fun tp!105515 () Bool)

(declare-fun e!752779 () Bool)

(assert (=> mapNonEmpty!55397 (= mapRes!55397 (and tp!105515 e!752779))))

(declare-fun mapRest!55397 () (Array (_ BitVec 32) ValueCell!17018))

(declare-fun mapKey!55397 () (_ BitVec 32))

(declare-fun mapValue!55397 () ValueCell!17018)

(assert (=> mapNonEmpty!55397 (= (arr!42814 _values!1337) (store mapRest!55397 mapKey!55397 mapValue!55397))))

(declare-fun b!1318980 () Bool)

(declare-fun res!875034 () Bool)

(assert (=> b!1318980 (=> (not res!875034) (not e!752778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88687 (_ BitVec 32)) Bool)

(assert (=> b!1318980 (= res!875034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318981 () Bool)

(declare-fun res!875038 () Bool)

(assert (=> b!1318981 (=> (not res!875038) (not e!752778))))

(declare-datatypes ((List!30349 0))(
  ( (Nil!30346) (Cons!30345 (h!31563 (_ BitVec 64)) (t!43949 List!30349)) )
))
(declare-fun arrayNoDuplicates!0 (array!88687 (_ BitVec 32) List!30349) Bool)

(assert (=> b!1318981 (= res!875038 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30346))))

(declare-fun b!1318982 () Bool)

(assert (=> b!1318982 (= e!752779 tp_is_empty!35833)))

(declare-fun mapIsEmpty!55397 () Bool)

(assert (=> mapIsEmpty!55397 mapRes!55397))

(assert (= (and start!111580 res!875037) b!1318975))

(assert (= (and b!1318975 res!875035) b!1318980))

(assert (= (and b!1318980 res!875034) b!1318981))

(assert (= (and b!1318981 res!875038) b!1318976))

(assert (= (and b!1318976 res!875036) b!1318977))

(assert (= (and b!1318979 condMapEmpty!55397) mapIsEmpty!55397))

(assert (= (and b!1318979 (not condMapEmpty!55397)) mapNonEmpty!55397))

(get-info :version)

(assert (= (and mapNonEmpty!55397 ((_ is ValueCellFull!17018) mapValue!55397)) b!1318982))

(assert (= (and b!1318979 ((_ is ValueCellFull!17018) mapDefault!55397)) b!1318978))

(assert (= start!111580 b!1318979))

(declare-fun m!1207049 () Bool)

(assert (=> b!1318981 m!1207049))

(declare-fun m!1207051 () Bool)

(assert (=> mapNonEmpty!55397 m!1207051))

(declare-fun m!1207053 () Bool)

(assert (=> b!1318980 m!1207053))

(declare-fun m!1207055 () Bool)

(assert (=> start!111580 m!1207055))

(declare-fun m!1207057 () Bool)

(assert (=> start!111580 m!1207057))

(declare-fun m!1207059 () Bool)

(assert (=> start!111580 m!1207059))

(declare-fun m!1207061 () Bool)

(assert (=> b!1318977 m!1207061))

(assert (=> b!1318977 m!1207061))

(declare-fun m!1207063 () Bool)

(assert (=> b!1318977 m!1207063))

(check-sat tp_is_empty!35833 (not b_next!30013) b_and!48235 (not mapNonEmpty!55397) (not b!1318980) (not start!111580) (not b!1318977) (not b!1318981))
(check-sat b_and!48235 (not b_next!30013))
