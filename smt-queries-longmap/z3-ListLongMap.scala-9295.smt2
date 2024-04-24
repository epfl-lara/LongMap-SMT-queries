; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111342 () Bool)

(assert start!111342)

(declare-fun b_free!29953 () Bool)

(declare-fun b_next!29953 () Bool)

(assert (=> start!111342 (= b_free!29953 (not b_next!29953))))

(declare-fun tp!105181 () Bool)

(declare-fun b_and!48163 () Bool)

(assert (=> start!111342 (= tp!105181 b_and!48163)))

(declare-fun b!1316945 () Bool)

(declare-fun e!751354 () Bool)

(declare-fun tp_is_empty!35683 () Bool)

(assert (=> b!1316945 (= e!751354 tp_is_empty!35683)))

(declare-fun b!1316946 () Bool)

(declare-fun e!751352 () Bool)

(assert (=> b!1316946 (= e!751352 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88383 0))(
  ( (array!88384 (arr!42667 (Array (_ BitVec 32) (_ BitVec 64))) (size!43218 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88383)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52681 0))(
  ( (V!52682 (val!17916 Int)) )
))
(declare-fun minValue!1296 () V!52681)

(declare-datatypes ((ValueCell!16943 0))(
  ( (ValueCellFull!16943 (v!20538 V!52681)) (EmptyCell!16943) )
))
(declare-datatypes ((array!88385 0))(
  ( (array!88386 (arr!42668 (Array (_ BitVec 32) ValueCell!16943)) (size!43219 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88385)

(declare-fun zeroValue!1296 () V!52681)

(declare-fun lt!586415 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23136 0))(
  ( (tuple2!23137 (_1!11579 (_ BitVec 64)) (_2!11579 V!52681)) )
))
(declare-datatypes ((List!30282 0))(
  ( (Nil!30279) (Cons!30278 (h!31496 tuple2!23136) (t!43880 List!30282)) )
))
(declare-datatypes ((ListLongMap!20801 0))(
  ( (ListLongMap!20802 (toList!10416 List!30282)) )
))
(declare-fun contains!8578 (ListLongMap!20801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5420 (array!88383 array!88385 (_ BitVec 32) (_ BitVec 32) V!52681 V!52681 (_ BitVec 32) Int) ListLongMap!20801)

(assert (=> b!1316946 (= lt!586415 (contains!8578 (getCurrentListMap!5420 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!55153 () Bool)

(declare-fun mapRes!55153 () Bool)

(assert (=> mapIsEmpty!55153 mapRes!55153))

(declare-fun b!1316947 () Bool)

(declare-fun res!873922 () Bool)

(assert (=> b!1316947 (=> (not res!873922) (not e!751352))))

(declare-datatypes ((List!30283 0))(
  ( (Nil!30280) (Cons!30279 (h!31497 (_ BitVec 64)) (t!43881 List!30283)) )
))
(declare-fun arrayNoDuplicates!0 (array!88383 (_ BitVec 32) List!30283) Bool)

(assert (=> b!1316947 (= res!873922 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30280))))

(declare-fun b!1316948 () Bool)

(declare-fun res!873920 () Bool)

(assert (=> b!1316948 (=> (not res!873920) (not e!751352))))

(assert (=> b!1316948 (= res!873920 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43218 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316949 () Bool)

(declare-fun e!751353 () Bool)

(assert (=> b!1316949 (= e!751353 (and e!751354 mapRes!55153))))

(declare-fun condMapEmpty!55153 () Bool)

(declare-fun mapDefault!55153 () ValueCell!16943)

(assert (=> b!1316949 (= condMapEmpty!55153 (= (arr!42668 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16943)) mapDefault!55153)))))

(declare-fun b!1316950 () Bool)

(declare-fun e!751355 () Bool)

(assert (=> b!1316950 (= e!751355 tp_is_empty!35683)))

(declare-fun b!1316951 () Bool)

(declare-fun res!873923 () Bool)

(assert (=> b!1316951 (=> (not res!873923) (not e!751352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88383 (_ BitVec 32)) Bool)

(assert (=> b!1316951 (= res!873923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316952 () Bool)

(declare-fun res!873921 () Bool)

(assert (=> b!1316952 (=> (not res!873921) (not e!751352))))

(assert (=> b!1316952 (= res!873921 (and (= (size!43219 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43218 _keys!1628) (size!43219 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!873919 () Bool)

(assert (=> start!111342 (=> (not res!873919) (not e!751352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111342 (= res!873919 (validMask!0 mask!2040))))

(assert (=> start!111342 e!751352))

(assert (=> start!111342 tp!105181))

(declare-fun array_inv!32493 (array!88383) Bool)

(assert (=> start!111342 (array_inv!32493 _keys!1628)))

(assert (=> start!111342 true))

(assert (=> start!111342 tp_is_empty!35683))

(declare-fun array_inv!32494 (array!88385) Bool)

(assert (=> start!111342 (and (array_inv!32494 _values!1354) e!751353)))

(declare-fun mapNonEmpty!55153 () Bool)

(declare-fun tp!105180 () Bool)

(assert (=> mapNonEmpty!55153 (= mapRes!55153 (and tp!105180 e!751355))))

(declare-fun mapValue!55153 () ValueCell!16943)

(declare-fun mapKey!55153 () (_ BitVec 32))

(declare-fun mapRest!55153 () (Array (_ BitVec 32) ValueCell!16943))

(assert (=> mapNonEmpty!55153 (= (arr!42668 _values!1354) (store mapRest!55153 mapKey!55153 mapValue!55153))))

(assert (= (and start!111342 res!873919) b!1316952))

(assert (= (and b!1316952 res!873921) b!1316951))

(assert (= (and b!1316951 res!873923) b!1316947))

(assert (= (and b!1316947 res!873922) b!1316948))

(assert (= (and b!1316948 res!873920) b!1316946))

(assert (= (and b!1316949 condMapEmpty!55153) mapIsEmpty!55153))

(assert (= (and b!1316949 (not condMapEmpty!55153)) mapNonEmpty!55153))

(get-info :version)

(assert (= (and mapNonEmpty!55153 ((_ is ValueCellFull!16943) mapValue!55153)) b!1316950))

(assert (= (and b!1316949 ((_ is ValueCellFull!16943) mapDefault!55153)) b!1316945))

(assert (= start!111342 b!1316949))

(declare-fun m!1205369 () Bool)

(assert (=> start!111342 m!1205369))

(declare-fun m!1205371 () Bool)

(assert (=> start!111342 m!1205371))

(declare-fun m!1205373 () Bool)

(assert (=> start!111342 m!1205373))

(declare-fun m!1205375 () Bool)

(assert (=> b!1316946 m!1205375))

(assert (=> b!1316946 m!1205375))

(declare-fun m!1205377 () Bool)

(assert (=> b!1316946 m!1205377))

(declare-fun m!1205379 () Bool)

(assert (=> b!1316947 m!1205379))

(declare-fun m!1205381 () Bool)

(assert (=> b!1316951 m!1205381))

(declare-fun m!1205383 () Bool)

(assert (=> mapNonEmpty!55153 m!1205383))

(check-sat (not b!1316951) (not b_next!29953) (not mapNonEmpty!55153) (not start!111342) (not b!1316947) tp_is_empty!35683 b_and!48163 (not b!1316946))
(check-sat b_and!48163 (not b_next!29953))
