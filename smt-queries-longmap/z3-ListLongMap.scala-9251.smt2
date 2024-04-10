; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110856 () Bool)

(assert start!110856)

(declare-fun b_free!29691 () Bool)

(declare-fun b_next!29691 () Bool)

(assert (=> start!110856 (= b_free!29691 (not b_next!29691))))

(declare-fun tp!104394 () Bool)

(declare-fun b_and!47899 () Bool)

(assert (=> start!110856 (= tp!104394 b_and!47899)))

(declare-fun res!871291 () Bool)

(declare-fun e!748544 () Bool)

(assert (=> start!110856 (=> (not res!871291) (not e!748544))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110856 (= res!871291 (validMask!0 mask!2040))))

(assert (=> start!110856 e!748544))

(assert (=> start!110856 tp!104394))

(declare-datatypes ((array!87830 0))(
  ( (array!87831 (arr!42395 (Array (_ BitVec 32) (_ BitVec 64))) (size!42945 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87830)

(declare-fun array_inv!32035 (array!87830) Bool)

(assert (=> start!110856 (array_inv!32035 _keys!1628)))

(assert (=> start!110856 true))

(declare-fun tp_is_empty!35421 () Bool)

(assert (=> start!110856 tp_is_empty!35421))

(declare-datatypes ((V!52331 0))(
  ( (V!52332 (val!17785 Int)) )
))
(declare-datatypes ((ValueCell!16812 0))(
  ( (ValueCellFull!16812 (v!20412 V!52331)) (EmptyCell!16812) )
))
(declare-datatypes ((array!87832 0))(
  ( (array!87833 (arr!42396 (Array (_ BitVec 32) ValueCell!16812)) (size!42946 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87832)

(declare-fun e!748545 () Bool)

(declare-fun array_inv!32036 (array!87832) Bool)

(assert (=> start!110856 (and (array_inv!32036 _values!1354) e!748545)))

(declare-fun b!1312351 () Bool)

(declare-fun res!871288 () Bool)

(assert (=> b!1312351 (=> (not res!871288) (not e!748544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87830 (_ BitVec 32)) Bool)

(assert (=> b!1312351 (= res!871288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312352 () Bool)

(declare-fun res!871292 () Bool)

(assert (=> b!1312352 (=> (not res!871292) (not e!748544))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312352 (= res!871292 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42945 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312353 () Bool)

(declare-fun e!748543 () Bool)

(assert (=> b!1312353 (= e!748543 tp_is_empty!35421)))

(declare-fun b!1312354 () Bool)

(declare-fun res!871286 () Bool)

(assert (=> b!1312354 (=> (not res!871286) (not e!748544))))

(declare-fun minValue!1296 () V!52331)

(declare-fun zeroValue!1296 () V!52331)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22926 0))(
  ( (tuple2!22927 (_1!11474 (_ BitVec 64)) (_2!11474 V!52331)) )
))
(declare-datatypes ((List!30064 0))(
  ( (Nil!30061) (Cons!30060 (h!31269 tuple2!22926) (t!43670 List!30064)) )
))
(declare-datatypes ((ListLongMap!20583 0))(
  ( (ListLongMap!20584 (toList!10307 List!30064)) )
))
(declare-fun contains!8457 (ListLongMap!20583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5320 (array!87830 array!87832 (_ BitVec 32) (_ BitVec 32) V!52331 V!52331 (_ BitVec 32) Int) ListLongMap!20583)

(assert (=> b!1312354 (= res!871286 (contains!8457 (getCurrentListMap!5320 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54760 () Bool)

(declare-fun mapRes!54760 () Bool)

(assert (=> mapIsEmpty!54760 mapRes!54760))

(declare-fun b!1312355 () Bool)

(declare-fun res!871289 () Bool)

(assert (=> b!1312355 (=> (not res!871289) (not e!748544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312355 (= res!871289 (validKeyInArray!0 (select (arr!42395 _keys!1628) from!2020)))))

(declare-fun b!1312356 () Bool)

(declare-fun res!871285 () Bool)

(assert (=> b!1312356 (=> (not res!871285) (not e!748544))))

(assert (=> b!1312356 (= res!871285 (and (= (size!42946 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42945 _keys!1628) (size!42946 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312357 () Bool)

(declare-fun res!871287 () Bool)

(assert (=> b!1312357 (=> (not res!871287) (not e!748544))))

(assert (=> b!1312357 (= res!871287 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312358 () Bool)

(assert (=> b!1312358 (= e!748544 (not true))))

(assert (=> b!1312358 (contains!8457 (getCurrentListMap!5320 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43380 0))(
  ( (Unit!43381) )
))
(declare-fun lt!585555 () Unit!43380)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!17 (array!87830 array!87832 (_ BitVec 32) (_ BitVec 32) V!52331 V!52331 (_ BitVec 64) (_ BitVec 32) Int) Unit!43380)

(assert (=> b!1312358 (= lt!585555 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!17 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312359 () Bool)

(declare-fun res!871293 () Bool)

(assert (=> b!1312359 (=> (not res!871293) (not e!748544))))

(assert (=> b!1312359 (= res!871293 (not (= (select (arr!42395 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1312360 () Bool)

(declare-fun res!871290 () Bool)

(assert (=> b!1312360 (=> (not res!871290) (not e!748544))))

(declare-datatypes ((List!30065 0))(
  ( (Nil!30062) (Cons!30061 (h!31270 (_ BitVec 64)) (t!43671 List!30065)) )
))
(declare-fun arrayNoDuplicates!0 (array!87830 (_ BitVec 32) List!30065) Bool)

(assert (=> b!1312360 (= res!871290 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30062))))

(declare-fun mapNonEmpty!54760 () Bool)

(declare-fun tp!104395 () Bool)

(declare-fun e!748546 () Bool)

(assert (=> mapNonEmpty!54760 (= mapRes!54760 (and tp!104395 e!748546))))

(declare-fun mapKey!54760 () (_ BitVec 32))

(declare-fun mapValue!54760 () ValueCell!16812)

(declare-fun mapRest!54760 () (Array (_ BitVec 32) ValueCell!16812))

(assert (=> mapNonEmpty!54760 (= (arr!42396 _values!1354) (store mapRest!54760 mapKey!54760 mapValue!54760))))

(declare-fun b!1312361 () Bool)

(assert (=> b!1312361 (= e!748546 tp_is_empty!35421)))

(declare-fun b!1312362 () Bool)

(assert (=> b!1312362 (= e!748545 (and e!748543 mapRes!54760))))

(declare-fun condMapEmpty!54760 () Bool)

(declare-fun mapDefault!54760 () ValueCell!16812)

(assert (=> b!1312362 (= condMapEmpty!54760 (= (arr!42396 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16812)) mapDefault!54760)))))

(assert (= (and start!110856 res!871291) b!1312356))

(assert (= (and b!1312356 res!871285) b!1312351))

(assert (= (and b!1312351 res!871288) b!1312360))

(assert (= (and b!1312360 res!871290) b!1312352))

(assert (= (and b!1312352 res!871292) b!1312354))

(assert (= (and b!1312354 res!871286) b!1312359))

(assert (= (and b!1312359 res!871293) b!1312355))

(assert (= (and b!1312355 res!871289) b!1312357))

(assert (= (and b!1312357 res!871287) b!1312358))

(assert (= (and b!1312362 condMapEmpty!54760) mapIsEmpty!54760))

(assert (= (and b!1312362 (not condMapEmpty!54760)) mapNonEmpty!54760))

(get-info :version)

(assert (= (and mapNonEmpty!54760 ((_ is ValueCellFull!16812) mapValue!54760)) b!1312361))

(assert (= (and b!1312362 ((_ is ValueCellFull!16812) mapDefault!54760)) b!1312353))

(assert (= start!110856 b!1312362))

(declare-fun m!1201553 () Bool)

(assert (=> b!1312354 m!1201553))

(assert (=> b!1312354 m!1201553))

(declare-fun m!1201555 () Bool)

(assert (=> b!1312354 m!1201555))

(declare-fun m!1201557 () Bool)

(assert (=> b!1312355 m!1201557))

(assert (=> b!1312355 m!1201557))

(declare-fun m!1201559 () Bool)

(assert (=> b!1312355 m!1201559))

(declare-fun m!1201561 () Bool)

(assert (=> b!1312358 m!1201561))

(assert (=> b!1312358 m!1201561))

(declare-fun m!1201563 () Bool)

(assert (=> b!1312358 m!1201563))

(declare-fun m!1201565 () Bool)

(assert (=> b!1312358 m!1201565))

(declare-fun m!1201567 () Bool)

(assert (=> mapNonEmpty!54760 m!1201567))

(declare-fun m!1201569 () Bool)

(assert (=> b!1312360 m!1201569))

(declare-fun m!1201571 () Bool)

(assert (=> start!110856 m!1201571))

(declare-fun m!1201573 () Bool)

(assert (=> start!110856 m!1201573))

(declare-fun m!1201575 () Bool)

(assert (=> start!110856 m!1201575))

(assert (=> b!1312359 m!1201557))

(declare-fun m!1201577 () Bool)

(assert (=> b!1312351 m!1201577))

(check-sat tp_is_empty!35421 (not mapNonEmpty!54760) (not b_next!29691) (not b!1312351) (not b!1312360) (not b!1312355) b_and!47899 (not b!1312354) (not b!1312358) (not start!110856))
(check-sat b_and!47899 (not b_next!29691))
