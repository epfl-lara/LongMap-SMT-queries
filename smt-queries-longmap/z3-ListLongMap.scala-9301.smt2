; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111378 () Bool)

(assert start!111378)

(declare-fun b_free!29989 () Bool)

(declare-fun b_next!29989 () Bool)

(assert (=> start!111378 (= b_free!29989 (not b_next!29989))))

(declare-fun tp!105288 () Bool)

(declare-fun b_and!48199 () Bool)

(assert (=> start!111378 (= tp!105288 b_and!48199)))

(declare-fun b!1317377 () Bool)

(declare-fun res!874190 () Bool)

(declare-fun e!751624 () Bool)

(assert (=> b!1317377 (=> (not res!874190) (not e!751624))))

(declare-datatypes ((array!88453 0))(
  ( (array!88454 (arr!42702 (Array (_ BitVec 32) (_ BitVec 64))) (size!43253 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88453)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88453 (_ BitVec 32)) Bool)

(assert (=> b!1317377 (= res!874190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1317378 () Bool)

(declare-fun e!751622 () Bool)

(declare-fun tp_is_empty!35719 () Bool)

(assert (=> b!1317378 (= e!751622 tp_is_empty!35719)))

(declare-fun b!1317379 () Bool)

(declare-fun res!874192 () Bool)

(assert (=> b!1317379 (=> (not res!874192) (not e!751624))))

(declare-datatypes ((V!52729 0))(
  ( (V!52730 (val!17934 Int)) )
))
(declare-datatypes ((ValueCell!16961 0))(
  ( (ValueCellFull!16961 (v!20556 V!52729)) (EmptyCell!16961) )
))
(declare-datatypes ((array!88455 0))(
  ( (array!88456 (arr!42703 (Array (_ BitVec 32) ValueCell!16961)) (size!43254 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88455)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1317379 (= res!874192 (and (= (size!43254 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43253 _keys!1628) (size!43254 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1317380 () Bool)

(assert (=> b!1317380 (= e!751624 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586469 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52729)

(declare-fun zeroValue!1296 () V!52729)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23164 0))(
  ( (tuple2!23165 (_1!11593 (_ BitVec 64)) (_2!11593 V!52729)) )
))
(declare-datatypes ((List!30308 0))(
  ( (Nil!30305) (Cons!30304 (h!31522 tuple2!23164) (t!43906 List!30308)) )
))
(declare-datatypes ((ListLongMap!20829 0))(
  ( (ListLongMap!20830 (toList!10430 List!30308)) )
))
(declare-fun contains!8592 (ListLongMap!20829 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5434 (array!88453 array!88455 (_ BitVec 32) (_ BitVec 32) V!52729 V!52729 (_ BitVec 32) Int) ListLongMap!20829)

(assert (=> b!1317380 (= lt!586469 (contains!8592 (getCurrentListMap!5434 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1317381 () Bool)

(declare-fun res!874193 () Bool)

(assert (=> b!1317381 (=> (not res!874193) (not e!751624))))

(declare-datatypes ((List!30309 0))(
  ( (Nil!30306) (Cons!30305 (h!31523 (_ BitVec 64)) (t!43907 List!30309)) )
))
(declare-fun arrayNoDuplicates!0 (array!88453 (_ BitVec 32) List!30309) Bool)

(assert (=> b!1317381 (= res!874193 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30306))))

(declare-fun b!1317382 () Bool)

(declare-fun res!874191 () Bool)

(assert (=> b!1317382 (=> (not res!874191) (not e!751624))))

(assert (=> b!1317382 (= res!874191 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43253 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55207 () Bool)

(declare-fun mapRes!55207 () Bool)

(assert (=> mapIsEmpty!55207 mapRes!55207))

(declare-fun b!1317383 () Bool)

(declare-fun e!751621 () Bool)

(assert (=> b!1317383 (= e!751621 tp_is_empty!35719)))

(declare-fun b!1317384 () Bool)

(declare-fun e!751623 () Bool)

(assert (=> b!1317384 (= e!751623 (and e!751621 mapRes!55207))))

(declare-fun condMapEmpty!55207 () Bool)

(declare-fun mapDefault!55207 () ValueCell!16961)

(assert (=> b!1317384 (= condMapEmpty!55207 (= (arr!42703 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16961)) mapDefault!55207)))))

(declare-fun mapNonEmpty!55207 () Bool)

(declare-fun tp!105289 () Bool)

(assert (=> mapNonEmpty!55207 (= mapRes!55207 (and tp!105289 e!751622))))

(declare-fun mapValue!55207 () ValueCell!16961)

(declare-fun mapKey!55207 () (_ BitVec 32))

(declare-fun mapRest!55207 () (Array (_ BitVec 32) ValueCell!16961))

(assert (=> mapNonEmpty!55207 (= (arr!42703 _values!1354) (store mapRest!55207 mapKey!55207 mapValue!55207))))

(declare-fun res!874189 () Bool)

(assert (=> start!111378 (=> (not res!874189) (not e!751624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111378 (= res!874189 (validMask!0 mask!2040))))

(assert (=> start!111378 e!751624))

(assert (=> start!111378 tp!105288))

(declare-fun array_inv!32517 (array!88453) Bool)

(assert (=> start!111378 (array_inv!32517 _keys!1628)))

(assert (=> start!111378 true))

(assert (=> start!111378 tp_is_empty!35719))

(declare-fun array_inv!32518 (array!88455) Bool)

(assert (=> start!111378 (and (array_inv!32518 _values!1354) e!751623)))

(assert (= (and start!111378 res!874189) b!1317379))

(assert (= (and b!1317379 res!874192) b!1317377))

(assert (= (and b!1317377 res!874190) b!1317381))

(assert (= (and b!1317381 res!874193) b!1317382))

(assert (= (and b!1317382 res!874191) b!1317380))

(assert (= (and b!1317384 condMapEmpty!55207) mapIsEmpty!55207))

(assert (= (and b!1317384 (not condMapEmpty!55207)) mapNonEmpty!55207))

(get-info :version)

(assert (= (and mapNonEmpty!55207 ((_ is ValueCellFull!16961) mapValue!55207)) b!1317378))

(assert (= (and b!1317384 ((_ is ValueCellFull!16961) mapDefault!55207)) b!1317383))

(assert (= start!111378 b!1317384))

(declare-fun m!1205657 () Bool)

(assert (=> mapNonEmpty!55207 m!1205657))

(declare-fun m!1205659 () Bool)

(assert (=> b!1317377 m!1205659))

(declare-fun m!1205661 () Bool)

(assert (=> start!111378 m!1205661))

(declare-fun m!1205663 () Bool)

(assert (=> start!111378 m!1205663))

(declare-fun m!1205665 () Bool)

(assert (=> start!111378 m!1205665))

(declare-fun m!1205667 () Bool)

(assert (=> b!1317381 m!1205667))

(declare-fun m!1205669 () Bool)

(assert (=> b!1317380 m!1205669))

(assert (=> b!1317380 m!1205669))

(declare-fun m!1205671 () Bool)

(assert (=> b!1317380 m!1205671))

(check-sat (not mapNonEmpty!55207) (not start!111378) (not b_next!29989) tp_is_empty!35719 (not b!1317377) (not b!1317381) b_and!48199 (not b!1317380))
(check-sat b_and!48199 (not b_next!29989))
