; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111300 () Bool)

(assert start!111300)

(declare-fun b_free!29911 () Bool)

(declare-fun b_next!29911 () Bool)

(assert (=> start!111300 (= b_free!29911 (not b_next!29911))))

(declare-fun tp!105055 () Bool)

(declare-fun b_and!48121 () Bool)

(assert (=> start!111300 (= tp!105055 b_and!48121)))

(declare-fun b!1316405 () Bool)

(declare-fun res!873570 () Bool)

(declare-fun e!751036 () Bool)

(assert (=> b!1316405 (=> (not res!873570) (not e!751036))))

(declare-datatypes ((array!88303 0))(
  ( (array!88304 (arr!42627 (Array (_ BitVec 32) (_ BitVec 64))) (size!43178 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88303)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((V!52625 0))(
  ( (V!52626 (val!17895 Int)) )
))
(declare-datatypes ((ValueCell!16922 0))(
  ( (ValueCellFull!16922 (v!20517 V!52625)) (EmptyCell!16922) )
))
(declare-datatypes ((array!88305 0))(
  ( (array!88306 (arr!42628 (Array (_ BitVec 32) ValueCell!16922)) (size!43179 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88305)

(assert (=> b!1316405 (= res!873570 (and (= (size!43179 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43178 _keys!1628) (size!43179 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316406 () Bool)

(declare-fun res!873571 () Bool)

(assert (=> b!1316406 (=> (not res!873571) (not e!751036))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1316406 (= res!873571 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43178 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316407 () Bool)

(declare-fun e!751037 () Bool)

(declare-fun tp_is_empty!35641 () Bool)

(assert (=> b!1316407 (= e!751037 tp_is_empty!35641)))

(declare-fun b!1316408 () Bool)

(declare-fun res!873569 () Bool)

(assert (=> b!1316408 (=> (not res!873569) (not e!751036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88303 (_ BitVec 32)) Bool)

(assert (=> b!1316408 (= res!873569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316409 () Bool)

(assert (=> b!1316409 (= e!751036 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586352 () Bool)

(declare-fun minValue!1296 () V!52625)

(declare-fun zeroValue!1296 () V!52625)

(declare-datatypes ((tuple2!23106 0))(
  ( (tuple2!23107 (_1!11564 (_ BitVec 64)) (_2!11564 V!52625)) )
))
(declare-datatypes ((List!30253 0))(
  ( (Nil!30250) (Cons!30249 (h!31467 tuple2!23106) (t!43851 List!30253)) )
))
(declare-datatypes ((ListLongMap!20771 0))(
  ( (ListLongMap!20772 (toList!10401 List!30253)) )
))
(declare-fun contains!8563 (ListLongMap!20771 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5405 (array!88303 array!88305 (_ BitVec 32) (_ BitVec 32) V!52625 V!52625 (_ BitVec 32) Int) ListLongMap!20771)

(assert (=> b!1316409 (= lt!586352 (contains!8563 (getCurrentListMap!5405 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316410 () Bool)

(declare-fun e!751040 () Bool)

(declare-fun mapRes!55090 () Bool)

(assert (=> b!1316410 (= e!751040 (and e!751037 mapRes!55090))))

(declare-fun condMapEmpty!55090 () Bool)

(declare-fun mapDefault!55090 () ValueCell!16922)

(assert (=> b!1316410 (= condMapEmpty!55090 (= (arr!42628 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16922)) mapDefault!55090)))))

(declare-fun b!1316412 () Bool)

(declare-fun res!873572 () Bool)

(assert (=> b!1316412 (=> (not res!873572) (not e!751036))))

(declare-datatypes ((List!30254 0))(
  ( (Nil!30251) (Cons!30250 (h!31468 (_ BitVec 64)) (t!43852 List!30254)) )
))
(declare-fun arrayNoDuplicates!0 (array!88303 (_ BitVec 32) List!30254) Bool)

(assert (=> b!1316412 (= res!873572 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30251))))

(declare-fun mapIsEmpty!55090 () Bool)

(assert (=> mapIsEmpty!55090 mapRes!55090))

(declare-fun mapNonEmpty!55090 () Bool)

(declare-fun tp!105054 () Bool)

(declare-fun e!751039 () Bool)

(assert (=> mapNonEmpty!55090 (= mapRes!55090 (and tp!105054 e!751039))))

(declare-fun mapKey!55090 () (_ BitVec 32))

(declare-fun mapRest!55090 () (Array (_ BitVec 32) ValueCell!16922))

(declare-fun mapValue!55090 () ValueCell!16922)

(assert (=> mapNonEmpty!55090 (= (arr!42628 _values!1354) (store mapRest!55090 mapKey!55090 mapValue!55090))))

(declare-fun res!873568 () Bool)

(assert (=> start!111300 (=> (not res!873568) (not e!751036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111300 (= res!873568 (validMask!0 mask!2040))))

(assert (=> start!111300 e!751036))

(assert (=> start!111300 tp!105055))

(declare-fun array_inv!32461 (array!88303) Bool)

(assert (=> start!111300 (array_inv!32461 _keys!1628)))

(assert (=> start!111300 true))

(assert (=> start!111300 tp_is_empty!35641))

(declare-fun array_inv!32462 (array!88305) Bool)

(assert (=> start!111300 (and (array_inv!32462 _values!1354) e!751040)))

(declare-fun b!1316411 () Bool)

(assert (=> b!1316411 (= e!751039 tp_is_empty!35641)))

(assert (= (and start!111300 res!873568) b!1316405))

(assert (= (and b!1316405 res!873570) b!1316408))

(assert (= (and b!1316408 res!873569) b!1316412))

(assert (= (and b!1316412 res!873572) b!1316406))

(assert (= (and b!1316406 res!873571) b!1316409))

(assert (= (and b!1316410 condMapEmpty!55090) mapIsEmpty!55090))

(assert (= (and b!1316410 (not condMapEmpty!55090)) mapNonEmpty!55090))

(get-info :version)

(assert (= (and mapNonEmpty!55090 ((_ is ValueCellFull!16922) mapValue!55090)) b!1316411))

(assert (= (and b!1316410 ((_ is ValueCellFull!16922) mapDefault!55090)) b!1316407))

(assert (= start!111300 b!1316410))

(declare-fun m!1205003 () Bool)

(assert (=> start!111300 m!1205003))

(declare-fun m!1205005 () Bool)

(assert (=> start!111300 m!1205005))

(declare-fun m!1205007 () Bool)

(assert (=> start!111300 m!1205007))

(declare-fun m!1205009 () Bool)

(assert (=> mapNonEmpty!55090 m!1205009))

(declare-fun m!1205011 () Bool)

(assert (=> b!1316408 m!1205011))

(declare-fun m!1205013 () Bool)

(assert (=> b!1316412 m!1205013))

(declare-fun m!1205015 () Bool)

(assert (=> b!1316409 m!1205015))

(assert (=> b!1316409 m!1205015))

(declare-fun m!1205017 () Bool)

(assert (=> b!1316409 m!1205017))

(check-sat (not b!1316408) (not b!1316409) tp_is_empty!35641 (not start!111300) (not b!1316412) (not mapNonEmpty!55090) (not b_next!29911) b_and!48121)
(check-sat b_and!48121 (not b_next!29911))
