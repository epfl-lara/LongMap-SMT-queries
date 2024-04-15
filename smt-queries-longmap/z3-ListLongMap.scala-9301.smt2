; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111154 () Bool)

(assert start!111154)

(declare-fun b_free!29989 () Bool)

(declare-fun b_next!29989 () Bool)

(assert (=> start!111154 (= b_free!29989 (not b_next!29989))))

(declare-fun tp!105289 () Bool)

(declare-fun b_and!48179 () Bool)

(assert (=> start!111154 (= tp!105289 b_and!48179)))

(declare-fun b!1316008 () Bool)

(declare-fun res!873642 () Bool)

(declare-fun e!750745 () Bool)

(assert (=> b!1316008 (=> (not res!873642) (not e!750745))))

(declare-datatypes ((array!88305 0))(
  ( (array!88306 (arr!42633 (Array (_ BitVec 32) (_ BitVec 64))) (size!43185 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88305)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1316008 (= res!873642 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43185 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55207 () Bool)

(declare-fun mapRes!55207 () Bool)

(assert (=> mapIsEmpty!55207 mapRes!55207))

(declare-fun mapNonEmpty!55207 () Bool)

(declare-fun tp!105290 () Bool)

(declare-fun e!750748 () Bool)

(assert (=> mapNonEmpty!55207 (= mapRes!55207 (and tp!105290 e!750748))))

(declare-fun mapKey!55207 () (_ BitVec 32))

(declare-datatypes ((V!52729 0))(
  ( (V!52730 (val!17934 Int)) )
))
(declare-datatypes ((ValueCell!16961 0))(
  ( (ValueCellFull!16961 (v!20560 V!52729)) (EmptyCell!16961) )
))
(declare-fun mapValue!55207 () ValueCell!16961)

(declare-fun mapRest!55207 () (Array (_ BitVec 32) ValueCell!16961))

(declare-datatypes ((array!88307 0))(
  ( (array!88308 (arr!42634 (Array (_ BitVec 32) ValueCell!16961)) (size!43186 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88307)

(assert (=> mapNonEmpty!55207 (= (arr!42634 _values!1354) (store mapRest!55207 mapKey!55207 mapValue!55207))))

(declare-fun b!1316010 () Bool)

(declare-fun res!873643 () Bool)

(assert (=> b!1316010 (=> (not res!873643) (not e!750745))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316010 (= res!873643 (and (= (size!43186 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43185 _keys!1628) (size!43186 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316011 () Bool)

(declare-fun e!750746 () Bool)

(declare-fun tp_is_empty!35719 () Bool)

(assert (=> b!1316011 (= e!750746 tp_is_empty!35719)))

(declare-fun b!1316012 () Bool)

(declare-fun e!750749 () Bool)

(assert (=> b!1316012 (= e!750749 (and e!750746 mapRes!55207))))

(declare-fun condMapEmpty!55207 () Bool)

(declare-fun mapDefault!55207 () ValueCell!16961)

(assert (=> b!1316012 (= condMapEmpty!55207 (= (arr!42634 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16961)) mapDefault!55207)))))

(declare-fun b!1316013 () Bool)

(declare-fun res!873644 () Bool)

(assert (=> b!1316013 (=> (not res!873644) (not e!750745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88305 (_ BitVec 32)) Bool)

(assert (=> b!1316013 (= res!873644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316014 () Bool)

(declare-fun res!873646 () Bool)

(assert (=> b!1316014 (=> (not res!873646) (not e!750745))))

(declare-datatypes ((List!30337 0))(
  ( (Nil!30334) (Cons!30333 (h!31542 (_ BitVec 64)) (t!43935 List!30337)) )
))
(declare-fun arrayNoDuplicates!0 (array!88305 (_ BitVec 32) List!30337) Bool)

(assert (=> b!1316014 (= res!873646 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30334))))

(declare-fun b!1316015 () Bool)

(assert (=> b!1316015 (= e!750748 tp_is_empty!35719)))

(declare-fun b!1316009 () Bool)

(assert (=> b!1316009 (= e!750745 false)))

(declare-fun minValue!1296 () V!52729)

(declare-fun zeroValue!1296 () V!52729)

(declare-fun lt!585807 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!23222 0))(
  ( (tuple2!23223 (_1!11622 (_ BitVec 64)) (_2!11622 V!52729)) )
))
(declare-datatypes ((List!30338 0))(
  ( (Nil!30335) (Cons!30334 (h!31543 tuple2!23222) (t!43936 List!30338)) )
))
(declare-datatypes ((ListLongMap!20879 0))(
  ( (ListLongMap!20880 (toList!10455 List!30338)) )
))
(declare-fun contains!8532 (ListLongMap!20879 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5350 (array!88305 array!88307 (_ BitVec 32) (_ BitVec 32) V!52729 V!52729 (_ BitVec 32) Int) ListLongMap!20879)

(assert (=> b!1316009 (= lt!585807 (contains!8532 (getCurrentListMap!5350 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!873645 () Bool)

(assert (=> start!111154 (=> (not res!873645) (not e!750745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111154 (= res!873645 (validMask!0 mask!2040))))

(assert (=> start!111154 e!750745))

(assert (=> start!111154 tp!105289))

(declare-fun array_inv!32379 (array!88305) Bool)

(assert (=> start!111154 (array_inv!32379 _keys!1628)))

(assert (=> start!111154 true))

(assert (=> start!111154 tp_is_empty!35719))

(declare-fun array_inv!32380 (array!88307) Bool)

(assert (=> start!111154 (and (array_inv!32380 _values!1354) e!750749)))

(assert (= (and start!111154 res!873645) b!1316010))

(assert (= (and b!1316010 res!873643) b!1316013))

(assert (= (and b!1316013 res!873644) b!1316014))

(assert (= (and b!1316014 res!873646) b!1316008))

(assert (= (and b!1316008 res!873642) b!1316009))

(assert (= (and b!1316012 condMapEmpty!55207) mapIsEmpty!55207))

(assert (= (and b!1316012 (not condMapEmpty!55207)) mapNonEmpty!55207))

(get-info :version)

(assert (= (and mapNonEmpty!55207 ((_ is ValueCellFull!16961) mapValue!55207)) b!1316015))

(assert (= (and b!1316012 ((_ is ValueCellFull!16961) mapDefault!55207)) b!1316011))

(assert (= start!111154 b!1316012))

(declare-fun m!1203543 () Bool)

(assert (=> start!111154 m!1203543))

(declare-fun m!1203545 () Bool)

(assert (=> start!111154 m!1203545))

(declare-fun m!1203547 () Bool)

(assert (=> start!111154 m!1203547))

(declare-fun m!1203549 () Bool)

(assert (=> b!1316013 m!1203549))

(declare-fun m!1203551 () Bool)

(assert (=> b!1316014 m!1203551))

(declare-fun m!1203553 () Bool)

(assert (=> b!1316009 m!1203553))

(assert (=> b!1316009 m!1203553))

(declare-fun m!1203555 () Bool)

(assert (=> b!1316009 m!1203555))

(declare-fun m!1203557 () Bool)

(assert (=> mapNonEmpty!55207 m!1203557))

(check-sat (not b!1316013) (not b_next!29989) (not b!1316014) b_and!48179 tp_is_empty!35719 (not mapNonEmpty!55207) (not start!111154) (not b!1316009))
(check-sat b_and!48179 (not b_next!29989))
