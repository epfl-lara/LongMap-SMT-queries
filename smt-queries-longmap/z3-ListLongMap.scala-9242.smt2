; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111024 () Bool)

(assert start!111024)

(declare-fun b_free!29635 () Bool)

(declare-fun b_next!29635 () Bool)

(assert (=> start!111024 (= b_free!29635 (not b_next!29635))))

(declare-fun tp!104226 () Bool)

(declare-fun b_and!47845 () Bool)

(assert (=> start!111024 (= tp!104226 b_and!47845)))

(declare-fun b!1312706 () Bool)

(declare-fun e!748966 () Bool)

(declare-fun tp_is_empty!35365 () Bool)

(assert (=> b!1312706 (= e!748966 tp_is_empty!35365)))

(declare-fun b!1312707 () Bool)

(declare-fun e!748968 () Bool)

(declare-fun mapRes!54676 () Bool)

(assert (=> b!1312707 (= e!748968 (and e!748966 mapRes!54676))))

(declare-fun condMapEmpty!54676 () Bool)

(declare-datatypes ((V!52257 0))(
  ( (V!52258 (val!17757 Int)) )
))
(declare-datatypes ((ValueCell!16784 0))(
  ( (ValueCellFull!16784 (v!20379 V!52257)) (EmptyCell!16784) )
))
(declare-datatypes ((array!87769 0))(
  ( (array!87770 (arr!42360 (Array (_ BitVec 32) ValueCell!16784)) (size!42911 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87769)

(declare-fun mapDefault!54676 () ValueCell!16784)

(assert (=> b!1312707 (= condMapEmpty!54676 (= (arr!42360 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16784)) mapDefault!54676)))))

(declare-fun b!1312708 () Bool)

(declare-fun e!748970 () Bool)

(assert (=> b!1312708 (= e!748970 tp_is_empty!35365)))

(declare-fun res!871112 () Bool)

(declare-fun e!748967 () Bool)

(assert (=> start!111024 (=> (not res!871112) (not e!748967))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111024 (= res!871112 (validMask!0 mask!2040))))

(assert (=> start!111024 e!748967))

(assert (=> start!111024 tp!104226))

(declare-datatypes ((array!87771 0))(
  ( (array!87772 (arr!42361 (Array (_ BitVec 32) (_ BitVec 64))) (size!42912 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87771)

(declare-fun array_inv!32273 (array!87771) Bool)

(assert (=> start!111024 (array_inv!32273 _keys!1628)))

(assert (=> start!111024 true))

(assert (=> start!111024 tp_is_empty!35365))

(declare-fun array_inv!32274 (array!87769) Bool)

(assert (=> start!111024 (and (array_inv!32274 _values!1354) e!748968)))

(declare-fun mapIsEmpty!54676 () Bool)

(assert (=> mapIsEmpty!54676 mapRes!54676))

(declare-fun b!1312709 () Bool)

(declare-fun res!871114 () Bool)

(assert (=> b!1312709 (=> (not res!871114) (not e!748967))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312709 (= res!871114 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42912 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312710 () Bool)

(assert (=> b!1312710 (= e!748967 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52257)

(declare-fun lt!585947 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!52257)

(declare-datatypes ((tuple2!22918 0))(
  ( (tuple2!22919 (_1!11470 (_ BitVec 64)) (_2!11470 V!52257)) )
))
(declare-datatypes ((List!30073 0))(
  ( (Nil!30070) (Cons!30069 (h!31287 tuple2!22918) (t!43671 List!30073)) )
))
(declare-datatypes ((ListLongMap!20583 0))(
  ( (ListLongMap!20584 (toList!10307 List!30073)) )
))
(declare-fun contains!8469 (ListLongMap!20583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5311 (array!87771 array!87769 (_ BitVec 32) (_ BitVec 32) V!52257 V!52257 (_ BitVec 32) Int) ListLongMap!20583)

(assert (=> b!1312710 (= lt!585947 (contains!8469 (getCurrentListMap!5311 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312711 () Bool)

(declare-fun res!871113 () Bool)

(assert (=> b!1312711 (=> (not res!871113) (not e!748967))))

(assert (=> b!1312711 (= res!871113 (and (= (size!42911 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42912 _keys!1628) (size!42911 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312712 () Bool)

(declare-fun res!871111 () Bool)

(assert (=> b!1312712 (=> (not res!871111) (not e!748967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87771 (_ BitVec 32)) Bool)

(assert (=> b!1312712 (= res!871111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312713 () Bool)

(declare-fun res!871115 () Bool)

(assert (=> b!1312713 (=> (not res!871115) (not e!748967))))

(declare-datatypes ((List!30074 0))(
  ( (Nil!30071) (Cons!30070 (h!31288 (_ BitVec 64)) (t!43672 List!30074)) )
))
(declare-fun arrayNoDuplicates!0 (array!87771 (_ BitVec 32) List!30074) Bool)

(assert (=> b!1312713 (= res!871115 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30071))))

(declare-fun mapNonEmpty!54676 () Bool)

(declare-fun tp!104227 () Bool)

(assert (=> mapNonEmpty!54676 (= mapRes!54676 (and tp!104227 e!748970))))

(declare-fun mapRest!54676 () (Array (_ BitVec 32) ValueCell!16784))

(declare-fun mapValue!54676 () ValueCell!16784)

(declare-fun mapKey!54676 () (_ BitVec 32))

(assert (=> mapNonEmpty!54676 (= (arr!42360 _values!1354) (store mapRest!54676 mapKey!54676 mapValue!54676))))

(assert (= (and start!111024 res!871112) b!1312711))

(assert (= (and b!1312711 res!871113) b!1312712))

(assert (= (and b!1312712 res!871111) b!1312713))

(assert (= (and b!1312713 res!871115) b!1312709))

(assert (= (and b!1312709 res!871114) b!1312710))

(assert (= (and b!1312707 condMapEmpty!54676) mapIsEmpty!54676))

(assert (= (and b!1312707 (not condMapEmpty!54676)) mapNonEmpty!54676))

(get-info :version)

(assert (= (and mapNonEmpty!54676 ((_ is ValueCellFull!16784) mapValue!54676)) b!1312708))

(assert (= (and b!1312707 ((_ is ValueCellFull!16784) mapDefault!54676)) b!1312706))

(assert (= start!111024 b!1312707))

(declare-fun m!1202483 () Bool)

(assert (=> b!1312712 m!1202483))

(declare-fun m!1202485 () Bool)

(assert (=> mapNonEmpty!54676 m!1202485))

(declare-fun m!1202487 () Bool)

(assert (=> b!1312710 m!1202487))

(assert (=> b!1312710 m!1202487))

(declare-fun m!1202489 () Bool)

(assert (=> b!1312710 m!1202489))

(declare-fun m!1202491 () Bool)

(assert (=> start!111024 m!1202491))

(declare-fun m!1202493 () Bool)

(assert (=> start!111024 m!1202493))

(declare-fun m!1202495 () Bool)

(assert (=> start!111024 m!1202495))

(declare-fun m!1202497 () Bool)

(assert (=> b!1312713 m!1202497))

(check-sat tp_is_empty!35365 (not b!1312713) (not b!1312710) (not b_next!29635) (not mapNonEmpty!54676) b_and!47845 (not b!1312712) (not start!111024))
(check-sat b_and!47845 (not b_next!29635))
