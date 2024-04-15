; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110626 () Bool)

(assert start!110626)

(declare-fun b_free!29461 () Bool)

(declare-fun b_next!29461 () Bool)

(assert (=> start!110626 (= b_free!29461 (not b_next!29461))))

(declare-fun tp!103706 () Bool)

(declare-fun b_and!47651 () Bool)

(assert (=> start!110626 (= tp!103706 b_and!47651)))

(declare-fun b!1308925 () Bool)

(declare-fun res!868938 () Bool)

(declare-fun e!746787 () Bool)

(assert (=> b!1308925 (=> (not res!868938) (not e!746787))))

(declare-datatypes ((array!87295 0))(
  ( (array!87296 (arr!42128 (Array (_ BitVec 32) (_ BitVec 64))) (size!42680 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87295)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308925 (= res!868938 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42680 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308926 () Bool)

(declare-fun res!868939 () Bool)

(assert (=> b!1308926 (=> (not res!868939) (not e!746787))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87295 (_ BitVec 32)) Bool)

(assert (=> b!1308926 (= res!868939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308927 () Bool)

(declare-fun res!868937 () Bool)

(assert (=> b!1308927 (=> (not res!868937) (not e!746787))))

(declare-datatypes ((List!29966 0))(
  ( (Nil!29963) (Cons!29962 (h!31171 (_ BitVec 64)) (t!43564 List!29966)) )
))
(declare-fun arrayNoDuplicates!0 (array!87295 (_ BitVec 32) List!29966) Bool)

(assert (=> b!1308927 (= res!868937 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29963))))

(declare-fun b!1308928 () Bool)

(declare-fun e!746788 () Bool)

(declare-fun tp_is_empty!35191 () Bool)

(assert (=> b!1308928 (= e!746788 tp_is_empty!35191)))

(declare-fun b!1308929 () Bool)

(declare-fun res!868935 () Bool)

(assert (=> b!1308929 (=> (not res!868935) (not e!746787))))

(declare-datatypes ((V!52025 0))(
  ( (V!52026 (val!17670 Int)) )
))
(declare-datatypes ((ValueCell!16697 0))(
  ( (ValueCellFull!16697 (v!20296 V!52025)) (EmptyCell!16697) )
))
(declare-datatypes ((array!87297 0))(
  ( (array!87298 (arr!42129 (Array (_ BitVec 32) ValueCell!16697)) (size!42681 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87297)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308929 (= res!868935 (and (= (size!42681 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42680 _keys!1628) (size!42681 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308930 () Bool)

(declare-fun e!746789 () Bool)

(assert (=> b!1308930 (= e!746789 tp_is_empty!35191)))

(declare-fun b!1308931 () Bool)

(declare-fun e!746785 () Bool)

(declare-fun mapRes!54415 () Bool)

(assert (=> b!1308931 (= e!746785 (and e!746788 mapRes!54415))))

(declare-fun condMapEmpty!54415 () Bool)

(declare-fun mapDefault!54415 () ValueCell!16697)

(assert (=> b!1308931 (= condMapEmpty!54415 (= (arr!42129 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16697)) mapDefault!54415)))))

(declare-fun res!868936 () Bool)

(assert (=> start!110626 (=> (not res!868936) (not e!746787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110626 (= res!868936 (validMask!0 mask!2040))))

(assert (=> start!110626 e!746787))

(assert (=> start!110626 tp!103706))

(declare-fun array_inv!32033 (array!87295) Bool)

(assert (=> start!110626 (array_inv!32033 _keys!1628)))

(assert (=> start!110626 true))

(assert (=> start!110626 tp_is_empty!35191))

(declare-fun array_inv!32034 (array!87297) Bool)

(assert (=> start!110626 (and (array_inv!32034 _values!1354) e!746785)))

(declare-fun mapIsEmpty!54415 () Bool)

(assert (=> mapIsEmpty!54415 mapRes!54415))

(declare-fun mapNonEmpty!54415 () Bool)

(declare-fun tp!103705 () Bool)

(assert (=> mapNonEmpty!54415 (= mapRes!54415 (and tp!103705 e!746789))))

(declare-fun mapRest!54415 () (Array (_ BitVec 32) ValueCell!16697))

(declare-fun mapKey!54415 () (_ BitVec 32))

(declare-fun mapValue!54415 () ValueCell!16697)

(assert (=> mapNonEmpty!54415 (= (arr!42129 _values!1354) (store mapRest!54415 mapKey!54415 mapValue!54415))))

(declare-fun b!1308932 () Bool)

(assert (=> b!1308932 (= e!746787 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585024 () Bool)

(declare-fun minValue!1296 () V!52025)

(declare-fun zeroValue!1296 () V!52025)

(declare-datatypes ((tuple2!22838 0))(
  ( (tuple2!22839 (_1!11430 (_ BitVec 64)) (_2!11430 V!52025)) )
))
(declare-datatypes ((List!29967 0))(
  ( (Nil!29964) (Cons!29963 (h!31172 tuple2!22838) (t!43565 List!29967)) )
))
(declare-datatypes ((ListLongMap!20495 0))(
  ( (ListLongMap!20496 (toList!10263 List!29967)) )
))
(declare-fun contains!8340 (ListLongMap!20495 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5158 (array!87295 array!87297 (_ BitVec 32) (_ BitVec 32) V!52025 V!52025 (_ BitVec 32) Int) ListLongMap!20495)

(assert (=> b!1308932 (= lt!585024 (contains!8340 (getCurrentListMap!5158 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110626 res!868936) b!1308929))

(assert (= (and b!1308929 res!868935) b!1308926))

(assert (= (and b!1308926 res!868939) b!1308927))

(assert (= (and b!1308927 res!868937) b!1308925))

(assert (= (and b!1308925 res!868938) b!1308932))

(assert (= (and b!1308931 condMapEmpty!54415) mapIsEmpty!54415))

(assert (= (and b!1308931 (not condMapEmpty!54415)) mapNonEmpty!54415))

(get-info :version)

(assert (= (and mapNonEmpty!54415 ((_ is ValueCellFull!16697) mapValue!54415)) b!1308930))

(assert (= (and b!1308931 ((_ is ValueCellFull!16697) mapDefault!54415)) b!1308928))

(assert (= start!110626 b!1308931))

(declare-fun m!1198707 () Bool)

(assert (=> b!1308927 m!1198707))

(declare-fun m!1198709 () Bool)

(assert (=> start!110626 m!1198709))

(declare-fun m!1198711 () Bool)

(assert (=> start!110626 m!1198711))

(declare-fun m!1198713 () Bool)

(assert (=> start!110626 m!1198713))

(declare-fun m!1198715 () Bool)

(assert (=> mapNonEmpty!54415 m!1198715))

(declare-fun m!1198717 () Bool)

(assert (=> b!1308932 m!1198717))

(assert (=> b!1308932 m!1198717))

(declare-fun m!1198719 () Bool)

(assert (=> b!1308932 m!1198719))

(declare-fun m!1198721 () Bool)

(assert (=> b!1308926 m!1198721))

(check-sat (not start!110626) (not mapNonEmpty!54415) (not b!1308932) (not b_next!29461) (not b!1308927) (not b!1308926) tp_is_empty!35191 b_and!47651)
(check-sat b_and!47651 (not b_next!29461))
