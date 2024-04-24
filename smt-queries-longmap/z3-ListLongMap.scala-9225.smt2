; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110922 () Bool)

(assert start!110922)

(declare-fun b_free!29533 () Bool)

(declare-fun b_next!29533 () Bool)

(assert (=> start!110922 (= b_free!29533 (not b_next!29533))))

(declare-fun tp!103920 () Bool)

(declare-fun b_and!47743 () Bool)

(assert (=> start!110922 (= tp!103920 b_and!47743)))

(declare-fun b!1311238 () Bool)

(declare-fun res!870110 () Bool)

(declare-fun e!748204 () Bool)

(assert (=> b!1311238 (=> (not res!870110) (not e!748204))))

(declare-datatypes ((array!87579 0))(
  ( (array!87580 (arr!42265 (Array (_ BitVec 32) (_ BitVec 64))) (size!42816 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87579)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87579 (_ BitVec 32)) Bool)

(assert (=> b!1311238 (= res!870110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311239 () Bool)

(declare-fun res!870107 () Bool)

(assert (=> b!1311239 (=> (not res!870107) (not e!748204))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311239 (= res!870107 (validKeyInArray!0 (select (arr!42265 _keys!1628) from!2020)))))

(declare-fun b!1311240 () Bool)

(declare-fun res!870109 () Bool)

(assert (=> b!1311240 (=> (not res!870109) (not e!748204))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52121 0))(
  ( (V!52122 (val!17706 Int)) )
))
(declare-fun minValue!1296 () V!52121)

(declare-datatypes ((ValueCell!16733 0))(
  ( (ValueCellFull!16733 (v!20328 V!52121)) (EmptyCell!16733) )
))
(declare-datatypes ((array!87581 0))(
  ( (array!87582 (arr!42266 (Array (_ BitVec 32) ValueCell!16733)) (size!42817 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87581)

(declare-fun zeroValue!1296 () V!52121)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22850 0))(
  ( (tuple2!22851 (_1!11436 (_ BitVec 64)) (_2!11436 V!52121)) )
))
(declare-datatypes ((List!30006 0))(
  ( (Nil!30003) (Cons!30002 (h!31220 tuple2!22850) (t!43604 List!30006)) )
))
(declare-datatypes ((ListLongMap!20515 0))(
  ( (ListLongMap!20516 (toList!10273 List!30006)) )
))
(declare-fun contains!8435 (ListLongMap!20515 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5277 (array!87579 array!87581 (_ BitVec 32) (_ BitVec 32) V!52121 V!52121 (_ BitVec 32) Int) ListLongMap!20515)

(assert (=> b!1311240 (= res!870109 (contains!8435 (getCurrentListMap!5277 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311241 () Bool)

(declare-fun e!748201 () Bool)

(declare-fun e!748203 () Bool)

(declare-fun mapRes!54523 () Bool)

(assert (=> b!1311241 (= e!748201 (and e!748203 mapRes!54523))))

(declare-fun condMapEmpty!54523 () Bool)

(declare-fun mapDefault!54523 () ValueCell!16733)

(assert (=> b!1311241 (= condMapEmpty!54523 (= (arr!42266 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16733)) mapDefault!54523)))))

(declare-fun b!1311242 () Bool)

(assert (=> b!1311242 (= e!748204 (not true))))

(assert (=> b!1311242 (contains!8435 (getCurrentListMap!5277 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43289 0))(
  ( (Unit!43290) )
))
(declare-fun lt!585794 () Unit!43289)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!6 (array!87579 array!87581 (_ BitVec 32) (_ BitVec 32) V!52121 V!52121 (_ BitVec 64) (_ BitVec 32) Int) Unit!43289)

(assert (=> b!1311242 (= lt!585794 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!6 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311243 () Bool)

(declare-fun res!870105 () Bool)

(assert (=> b!1311243 (=> (not res!870105) (not e!748204))))

(assert (=> b!1311243 (= res!870105 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1311244 () Bool)

(declare-fun tp_is_empty!35263 () Bool)

(assert (=> b!1311244 (= e!748203 tp_is_empty!35263)))

(declare-fun b!1311245 () Bool)

(declare-fun e!748205 () Bool)

(assert (=> b!1311245 (= e!748205 tp_is_empty!35263)))

(declare-fun res!870108 () Bool)

(assert (=> start!110922 (=> (not res!870108) (not e!748204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110922 (= res!870108 (validMask!0 mask!2040))))

(assert (=> start!110922 e!748204))

(assert (=> start!110922 tp!103920))

(declare-fun array_inv!32209 (array!87579) Bool)

(assert (=> start!110922 (array_inv!32209 _keys!1628)))

(assert (=> start!110922 true))

(assert (=> start!110922 tp_is_empty!35263))

(declare-fun array_inv!32210 (array!87581) Bool)

(assert (=> start!110922 (and (array_inv!32210 _values!1354) e!748201)))

(declare-fun b!1311246 () Bool)

(declare-fun res!870104 () Bool)

(assert (=> b!1311246 (=> (not res!870104) (not e!748204))))

(assert (=> b!1311246 (= res!870104 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42816 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54523 () Bool)

(declare-fun tp!103921 () Bool)

(assert (=> mapNonEmpty!54523 (= mapRes!54523 (and tp!103921 e!748205))))

(declare-fun mapValue!54523 () ValueCell!16733)

(declare-fun mapKey!54523 () (_ BitVec 32))

(declare-fun mapRest!54523 () (Array (_ BitVec 32) ValueCell!16733))

(assert (=> mapNonEmpty!54523 (= (arr!42266 _values!1354) (store mapRest!54523 mapKey!54523 mapValue!54523))))

(declare-fun b!1311247 () Bool)

(declare-fun res!870103 () Bool)

(assert (=> b!1311247 (=> (not res!870103) (not e!748204))))

(assert (=> b!1311247 (= res!870103 (not (= (select (arr!42265 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1311248 () Bool)

(declare-fun res!870102 () Bool)

(assert (=> b!1311248 (=> (not res!870102) (not e!748204))))

(assert (=> b!1311248 (= res!870102 (and (= (size!42817 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42816 _keys!1628) (size!42817 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54523 () Bool)

(assert (=> mapIsEmpty!54523 mapRes!54523))

(declare-fun b!1311249 () Bool)

(declare-fun res!870106 () Bool)

(assert (=> b!1311249 (=> (not res!870106) (not e!748204))))

(declare-datatypes ((List!30007 0))(
  ( (Nil!30004) (Cons!30003 (h!31221 (_ BitVec 64)) (t!43605 List!30007)) )
))
(declare-fun arrayNoDuplicates!0 (array!87579 (_ BitVec 32) List!30007) Bool)

(assert (=> b!1311249 (= res!870106 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30004))))

(assert (= (and start!110922 res!870108) b!1311248))

(assert (= (and b!1311248 res!870102) b!1311238))

(assert (= (and b!1311238 res!870110) b!1311249))

(assert (= (and b!1311249 res!870106) b!1311246))

(assert (= (and b!1311246 res!870104) b!1311240))

(assert (= (and b!1311240 res!870109) b!1311247))

(assert (= (and b!1311247 res!870103) b!1311239))

(assert (= (and b!1311239 res!870107) b!1311243))

(assert (= (and b!1311243 res!870105) b!1311242))

(assert (= (and b!1311241 condMapEmpty!54523) mapIsEmpty!54523))

(assert (= (and b!1311241 (not condMapEmpty!54523)) mapNonEmpty!54523))

(get-info :version)

(assert (= (and mapNonEmpty!54523 ((_ is ValueCellFull!16733) mapValue!54523)) b!1311245))

(assert (= (and b!1311241 ((_ is ValueCellFull!16733) mapDefault!54523)) b!1311244))

(assert (= start!110922 b!1311241))

(declare-fun m!1201457 () Bool)

(assert (=> b!1311242 m!1201457))

(assert (=> b!1311242 m!1201457))

(declare-fun m!1201459 () Bool)

(assert (=> b!1311242 m!1201459))

(declare-fun m!1201461 () Bool)

(assert (=> b!1311242 m!1201461))

(declare-fun m!1201463 () Bool)

(assert (=> start!110922 m!1201463))

(declare-fun m!1201465 () Bool)

(assert (=> start!110922 m!1201465))

(declare-fun m!1201467 () Bool)

(assert (=> start!110922 m!1201467))

(declare-fun m!1201469 () Bool)

(assert (=> mapNonEmpty!54523 m!1201469))

(declare-fun m!1201471 () Bool)

(assert (=> b!1311238 m!1201471))

(declare-fun m!1201473 () Bool)

(assert (=> b!1311239 m!1201473))

(assert (=> b!1311239 m!1201473))

(declare-fun m!1201475 () Bool)

(assert (=> b!1311239 m!1201475))

(assert (=> b!1311247 m!1201473))

(declare-fun m!1201477 () Bool)

(assert (=> b!1311249 m!1201477))

(declare-fun m!1201479 () Bool)

(assert (=> b!1311240 m!1201479))

(assert (=> b!1311240 m!1201479))

(declare-fun m!1201481 () Bool)

(assert (=> b!1311240 m!1201481))

(check-sat tp_is_empty!35263 (not start!110922) (not b!1311242) (not b!1311238) (not b!1311239) (not mapNonEmpty!54523) (not b!1311240) (not b!1311249) b_and!47743 (not b_next!29533))
(check-sat b_and!47743 (not b_next!29533))
