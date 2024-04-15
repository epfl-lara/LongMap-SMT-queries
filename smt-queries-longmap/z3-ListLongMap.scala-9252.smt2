; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110860 () Bool)

(assert start!110860)

(declare-fun b_free!29695 () Bool)

(declare-fun b_next!29695 () Bool)

(assert (=> start!110860 (= b_free!29695 (not b_next!29695))))

(declare-fun tp!104408 () Bool)

(declare-fun b_and!47885 () Bool)

(assert (=> start!110860 (= tp!104408 b_and!47885)))

(declare-fun mapIsEmpty!54766 () Bool)

(declare-fun mapRes!54766 () Bool)

(assert (=> mapIsEmpty!54766 mapRes!54766))

(declare-fun mapNonEmpty!54766 () Bool)

(declare-fun tp!104407 () Bool)

(declare-fun e!748542 () Bool)

(assert (=> mapNonEmpty!54766 (= mapRes!54766 (and tp!104407 e!748542))))

(declare-datatypes ((V!52337 0))(
  ( (V!52338 (val!17787 Int)) )
))
(declare-datatypes ((ValueCell!16814 0))(
  ( (ValueCellFull!16814 (v!20413 V!52337)) (EmptyCell!16814) )
))
(declare-fun mapRest!54766 () (Array (_ BitVec 32) ValueCell!16814))

(declare-fun mapValue!54766 () ValueCell!16814)

(declare-datatypes ((array!87741 0))(
  ( (array!87742 (arr!42351 (Array (_ BitVec 32) ValueCell!16814)) (size!42903 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87741)

(declare-fun mapKey!54766 () (_ BitVec 32))

(assert (=> mapNonEmpty!54766 (= (arr!42351 _values!1354) (store mapRest!54766 mapKey!54766 mapValue!54766))))

(declare-fun b!1312353 () Bool)

(declare-fun res!871312 () Bool)

(declare-fun e!748544 () Bool)

(assert (=> b!1312353 (=> (not res!871312) (not e!748544))))

(declare-datatypes ((array!87743 0))(
  ( (array!87744 (arr!42352 (Array (_ BitVec 32) (_ BitVec 64))) (size!42904 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87743)

(declare-datatypes ((List!30135 0))(
  ( (Nil!30132) (Cons!30131 (h!31340 (_ BitVec 64)) (t!43733 List!30135)) )
))
(declare-fun arrayNoDuplicates!0 (array!87743 (_ BitVec 32) List!30135) Bool)

(assert (=> b!1312353 (= res!871312 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30132))))

(declare-fun b!1312354 () Bool)

(declare-fun tp_is_empty!35425 () Bool)

(assert (=> b!1312354 (= e!748542 tp_is_empty!35425)))

(declare-fun b!1312355 () Bool)

(declare-fun res!871314 () Bool)

(assert (=> b!1312355 (=> (not res!871314) (not e!748544))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312355 (= res!871314 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42904 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!871310 () Bool)

(assert (=> start!110860 (=> (not res!871310) (not e!748544))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110860 (= res!871310 (validMask!0 mask!2040))))

(assert (=> start!110860 e!748544))

(assert (=> start!110860 tp!104408))

(declare-fun array_inv!32185 (array!87743) Bool)

(assert (=> start!110860 (array_inv!32185 _keys!1628)))

(assert (=> start!110860 true))

(assert (=> start!110860 tp_is_empty!35425))

(declare-fun e!748541 () Bool)

(declare-fun array_inv!32186 (array!87741) Bool)

(assert (=> start!110860 (and (array_inv!32186 _values!1354) e!748541)))

(declare-fun b!1312356 () Bool)

(declare-fun e!748543 () Bool)

(assert (=> b!1312356 (= e!748543 tp_is_empty!35425)))

(declare-fun b!1312357 () Bool)

(declare-fun res!871318 () Bool)

(assert (=> b!1312357 (=> (not res!871318) (not e!748544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87743 (_ BitVec 32)) Bool)

(assert (=> b!1312357 (= res!871318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312358 () Bool)

(assert (=> b!1312358 (= e!748544 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52337)

(declare-fun zeroValue!1296 () V!52337)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23016 0))(
  ( (tuple2!23017 (_1!11519 (_ BitVec 64)) (_2!11519 V!52337)) )
))
(declare-datatypes ((List!30136 0))(
  ( (Nil!30133) (Cons!30132 (h!31341 tuple2!23016) (t!43734 List!30136)) )
))
(declare-datatypes ((ListLongMap!20673 0))(
  ( (ListLongMap!20674 (toList!10352 List!30136)) )
))
(declare-fun contains!8429 (ListLongMap!20673 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5247 (array!87743 array!87741 (_ BitVec 32) (_ BitVec 32) V!52337 V!52337 (_ BitVec 32) Int) ListLongMap!20673)

(assert (=> b!1312358 (contains!8429 (getCurrentListMap!5247 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43215 0))(
  ( (Unit!43216) )
))
(declare-fun lt!585375 () Unit!43215)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!18 (array!87743 array!87741 (_ BitVec 32) (_ BitVec 32) V!52337 V!52337 (_ BitVec 64) (_ BitVec 32) Int) Unit!43215)

(assert (=> b!1312358 (= lt!585375 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!18 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312359 () Bool)

(declare-fun res!871317 () Bool)

(assert (=> b!1312359 (=> (not res!871317) (not e!748544))))

(assert (=> b!1312359 (= res!871317 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312360 () Bool)

(declare-fun res!871316 () Bool)

(assert (=> b!1312360 (=> (not res!871316) (not e!748544))))

(assert (=> b!1312360 (= res!871316 (and (= (size!42903 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42904 _keys!1628) (size!42903 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312361 () Bool)

(assert (=> b!1312361 (= e!748541 (and e!748543 mapRes!54766))))

(declare-fun condMapEmpty!54766 () Bool)

(declare-fun mapDefault!54766 () ValueCell!16814)

(assert (=> b!1312361 (= condMapEmpty!54766 (= (arr!42351 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16814)) mapDefault!54766)))))

(declare-fun b!1312362 () Bool)

(declare-fun res!871315 () Bool)

(assert (=> b!1312362 (=> (not res!871315) (not e!748544))))

(assert (=> b!1312362 (= res!871315 (not (= (select (arr!42352 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1312363 () Bool)

(declare-fun res!871311 () Bool)

(assert (=> b!1312363 (=> (not res!871311) (not e!748544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312363 (= res!871311 (validKeyInArray!0 (select (arr!42352 _keys!1628) from!2020)))))

(declare-fun b!1312364 () Bool)

(declare-fun res!871313 () Bool)

(assert (=> b!1312364 (=> (not res!871313) (not e!748544))))

(assert (=> b!1312364 (= res!871313 (contains!8429 (getCurrentListMap!5247 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110860 res!871310) b!1312360))

(assert (= (and b!1312360 res!871316) b!1312357))

(assert (= (and b!1312357 res!871318) b!1312353))

(assert (= (and b!1312353 res!871312) b!1312355))

(assert (= (and b!1312355 res!871314) b!1312364))

(assert (= (and b!1312364 res!871313) b!1312362))

(assert (= (and b!1312362 res!871315) b!1312363))

(assert (= (and b!1312363 res!871311) b!1312359))

(assert (= (and b!1312359 res!871317) b!1312358))

(assert (= (and b!1312361 condMapEmpty!54766) mapIsEmpty!54766))

(assert (= (and b!1312361 (not condMapEmpty!54766)) mapNonEmpty!54766))

(get-info :version)

(assert (= (and mapNonEmpty!54766 ((_ is ValueCellFull!16814) mapValue!54766)) b!1312354))

(assert (= (and b!1312361 ((_ is ValueCellFull!16814) mapDefault!54766)) b!1312356))

(assert (= start!110860 b!1312361))

(declare-fun m!1201089 () Bool)

(assert (=> b!1312364 m!1201089))

(assert (=> b!1312364 m!1201089))

(declare-fun m!1201091 () Bool)

(assert (=> b!1312364 m!1201091))

(declare-fun m!1201093 () Bool)

(assert (=> b!1312358 m!1201093))

(assert (=> b!1312358 m!1201093))

(declare-fun m!1201095 () Bool)

(assert (=> b!1312358 m!1201095))

(declare-fun m!1201097 () Bool)

(assert (=> b!1312358 m!1201097))

(declare-fun m!1201099 () Bool)

(assert (=> b!1312363 m!1201099))

(assert (=> b!1312363 m!1201099))

(declare-fun m!1201101 () Bool)

(assert (=> b!1312363 m!1201101))

(declare-fun m!1201103 () Bool)

(assert (=> start!110860 m!1201103))

(declare-fun m!1201105 () Bool)

(assert (=> start!110860 m!1201105))

(declare-fun m!1201107 () Bool)

(assert (=> start!110860 m!1201107))

(assert (=> b!1312362 m!1201099))

(declare-fun m!1201109 () Bool)

(assert (=> b!1312353 m!1201109))

(declare-fun m!1201111 () Bool)

(assert (=> mapNonEmpty!54766 m!1201111))

(declare-fun m!1201113 () Bool)

(assert (=> b!1312357 m!1201113))

(check-sat (not b!1312364) (not b_next!29695) tp_is_empty!35425 (not mapNonEmpty!54766) b_and!47885 (not start!110860) (not b!1312357) (not b!1312358) (not b!1312353) (not b!1312363))
(check-sat b_and!47885 (not b_next!29695))
