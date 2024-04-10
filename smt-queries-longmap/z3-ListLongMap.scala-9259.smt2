; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110904 () Bool)

(assert start!110904)

(declare-fun b_free!29739 () Bool)

(declare-fun b_next!29739 () Bool)

(assert (=> start!110904 (= b_free!29739 (not b_next!29739))))

(declare-fun tp!104538 () Bool)

(declare-fun b_and!47947 () Bool)

(assert (=> start!110904 (= tp!104538 b_and!47947)))

(declare-fun b!1312979 () Bool)

(declare-fun e!748903 () Bool)

(declare-fun tp_is_empty!35469 () Bool)

(assert (=> b!1312979 (= e!748903 tp_is_empty!35469)))

(declare-fun b!1312980 () Bool)

(declare-fun e!748905 () Bool)

(assert (=> b!1312980 (= e!748905 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87920 0))(
  ( (array!87921 (arr!42440 (Array (_ BitVec 32) (_ BitVec 64))) (size!42990 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87920)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52395 0))(
  ( (V!52396 (val!17809 Int)) )
))
(declare-datatypes ((ValueCell!16836 0))(
  ( (ValueCellFull!16836 (v!20436 V!52395)) (EmptyCell!16836) )
))
(declare-datatypes ((array!87922 0))(
  ( (array!87923 (arr!42441 (Array (_ BitVec 32) ValueCell!16836)) (size!42991 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87922)

(declare-fun zeroValue!1296 () V!52395)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585627 () Bool)

(declare-fun minValue!1296 () V!52395)

(declare-datatypes ((tuple2!22958 0))(
  ( (tuple2!22959 (_1!11490 (_ BitVec 64)) (_2!11490 V!52395)) )
))
(declare-datatypes ((List!30094 0))(
  ( (Nil!30091) (Cons!30090 (h!31299 tuple2!22958) (t!43700 List!30094)) )
))
(declare-datatypes ((ListLongMap!20615 0))(
  ( (ListLongMap!20616 (toList!10323 List!30094)) )
))
(declare-fun contains!8473 (ListLongMap!20615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5336 (array!87920 array!87922 (_ BitVec 32) (_ BitVec 32) V!52395 V!52395 (_ BitVec 32) Int) ListLongMap!20615)

(assert (=> b!1312980 (= lt!585627 (contains!8473 (getCurrentListMap!5336 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312981 () Bool)

(declare-fun res!871699 () Bool)

(assert (=> b!1312981 (=> (not res!871699) (not e!748905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87920 (_ BitVec 32)) Bool)

(assert (=> b!1312981 (= res!871699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!871700 () Bool)

(assert (=> start!110904 (=> (not res!871700) (not e!748905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110904 (= res!871700 (validMask!0 mask!2040))))

(assert (=> start!110904 e!748905))

(assert (=> start!110904 tp!104538))

(declare-fun array_inv!32059 (array!87920) Bool)

(assert (=> start!110904 (array_inv!32059 _keys!1628)))

(assert (=> start!110904 true))

(assert (=> start!110904 tp_is_empty!35469))

(declare-fun e!748906 () Bool)

(declare-fun array_inv!32060 (array!87922) Bool)

(assert (=> start!110904 (and (array_inv!32060 _values!1354) e!748906)))

(declare-fun mapIsEmpty!54832 () Bool)

(declare-fun mapRes!54832 () Bool)

(assert (=> mapIsEmpty!54832 mapRes!54832))

(declare-fun b!1312982 () Bool)

(declare-fun e!748904 () Bool)

(assert (=> b!1312982 (= e!748904 tp_is_empty!35469)))

(declare-fun b!1312983 () Bool)

(declare-fun res!871698 () Bool)

(assert (=> b!1312983 (=> (not res!871698) (not e!748905))))

(assert (=> b!1312983 (= res!871698 (and (= (size!42991 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42990 _keys!1628) (size!42991 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312984 () Bool)

(declare-fun res!871697 () Bool)

(assert (=> b!1312984 (=> (not res!871697) (not e!748905))))

(declare-datatypes ((List!30095 0))(
  ( (Nil!30092) (Cons!30091 (h!31300 (_ BitVec 64)) (t!43701 List!30095)) )
))
(declare-fun arrayNoDuplicates!0 (array!87920 (_ BitVec 32) List!30095) Bool)

(assert (=> b!1312984 (= res!871697 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30092))))

(declare-fun mapNonEmpty!54832 () Bool)

(declare-fun tp!104539 () Bool)

(assert (=> mapNonEmpty!54832 (= mapRes!54832 (and tp!104539 e!748903))))

(declare-fun mapRest!54832 () (Array (_ BitVec 32) ValueCell!16836))

(declare-fun mapKey!54832 () (_ BitVec 32))

(declare-fun mapValue!54832 () ValueCell!16836)

(assert (=> mapNonEmpty!54832 (= (arr!42441 _values!1354) (store mapRest!54832 mapKey!54832 mapValue!54832))))

(declare-fun b!1312985 () Bool)

(declare-fun res!871701 () Bool)

(assert (=> b!1312985 (=> (not res!871701) (not e!748905))))

(assert (=> b!1312985 (= res!871701 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42990 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312986 () Bool)

(assert (=> b!1312986 (= e!748906 (and e!748904 mapRes!54832))))

(declare-fun condMapEmpty!54832 () Bool)

(declare-fun mapDefault!54832 () ValueCell!16836)

(assert (=> b!1312986 (= condMapEmpty!54832 (= (arr!42441 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16836)) mapDefault!54832)))))

(assert (= (and start!110904 res!871700) b!1312983))

(assert (= (and b!1312983 res!871698) b!1312981))

(assert (= (and b!1312981 res!871699) b!1312984))

(assert (= (and b!1312984 res!871697) b!1312985))

(assert (= (and b!1312985 res!871701) b!1312980))

(assert (= (and b!1312986 condMapEmpty!54832) mapIsEmpty!54832))

(assert (= (and b!1312986 (not condMapEmpty!54832)) mapNonEmpty!54832))

(get-info :version)

(assert (= (and mapNonEmpty!54832 ((_ is ValueCellFull!16836) mapValue!54832)) b!1312979))

(assert (= (and b!1312986 ((_ is ValueCellFull!16836) mapDefault!54832)) b!1312982))

(assert (= start!110904 b!1312986))

(declare-fun m!1201987 () Bool)

(assert (=> b!1312984 m!1201987))

(declare-fun m!1201989 () Bool)

(assert (=> mapNonEmpty!54832 m!1201989))

(declare-fun m!1201991 () Bool)

(assert (=> b!1312980 m!1201991))

(assert (=> b!1312980 m!1201991))

(declare-fun m!1201993 () Bool)

(assert (=> b!1312980 m!1201993))

(declare-fun m!1201995 () Bool)

(assert (=> b!1312981 m!1201995))

(declare-fun m!1201997 () Bool)

(assert (=> start!110904 m!1201997))

(declare-fun m!1201999 () Bool)

(assert (=> start!110904 m!1201999))

(declare-fun m!1202001 () Bool)

(assert (=> start!110904 m!1202001))

(check-sat tp_is_empty!35469 (not mapNonEmpty!54832) b_and!47947 (not start!110904) (not b_next!29739) (not b!1312984) (not b!1312980) (not b!1312981))
(check-sat b_and!47947 (not b_next!29739))
