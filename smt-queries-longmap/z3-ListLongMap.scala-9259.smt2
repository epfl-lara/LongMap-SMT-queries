; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111126 () Bool)

(assert start!111126)

(declare-fun b_free!29737 () Bool)

(declare-fun b_next!29737 () Bool)

(assert (=> start!111126 (= b_free!29737 (not b_next!29737))))

(declare-fun tp!104533 () Bool)

(declare-fun b_and!47947 () Bool)

(assert (=> start!111126 (= tp!104533 b_and!47947)))

(declare-fun b!1314254 () Bool)

(declare-fun res!872201 () Bool)

(declare-fun e!749733 () Bool)

(assert (=> b!1314254 (=> (not res!872201) (not e!749733))))

(declare-datatypes ((array!87967 0))(
  ( (array!87968 (arr!42459 (Array (_ BitVec 32) (_ BitVec 64))) (size!43010 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87967)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87967 (_ BitVec 32)) Bool)

(assert (=> b!1314254 (= res!872201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314255 () Bool)

(declare-fun e!749735 () Bool)

(declare-fun tp_is_empty!35467 () Bool)

(assert (=> b!1314255 (= e!749735 tp_is_empty!35467)))

(declare-fun b!1314256 () Bool)

(assert (=> b!1314256 (= e!749733 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586100 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52393 0))(
  ( (V!52394 (val!17808 Int)) )
))
(declare-fun minValue!1296 () V!52393)

(declare-datatypes ((ValueCell!16835 0))(
  ( (ValueCellFull!16835 (v!20430 V!52393)) (EmptyCell!16835) )
))
(declare-datatypes ((array!87969 0))(
  ( (array!87970 (arr!42460 (Array (_ BitVec 32) ValueCell!16835)) (size!43011 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87969)

(declare-fun zeroValue!1296 () V!52393)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22986 0))(
  ( (tuple2!22987 (_1!11504 (_ BitVec 64)) (_2!11504 V!52393)) )
))
(declare-datatypes ((List!30138 0))(
  ( (Nil!30135) (Cons!30134 (h!31352 tuple2!22986) (t!43736 List!30138)) )
))
(declare-datatypes ((ListLongMap!20651 0))(
  ( (ListLongMap!20652 (toList!10341 List!30138)) )
))
(declare-fun contains!8503 (ListLongMap!20651 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5345 (array!87967 array!87969 (_ BitVec 32) (_ BitVec 32) V!52393 V!52393 (_ BitVec 32) Int) ListLongMap!20651)

(assert (=> b!1314256 (= lt!586100 (contains!8503 (getCurrentListMap!5345 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314257 () Bool)

(declare-fun e!749731 () Bool)

(assert (=> b!1314257 (= e!749731 tp_is_empty!35467)))

(declare-fun b!1314258 () Bool)

(declare-fun res!872204 () Bool)

(assert (=> b!1314258 (=> (not res!872204) (not e!749733))))

(assert (=> b!1314258 (= res!872204 (and (= (size!43011 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43010 _keys!1628) (size!43011 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54829 () Bool)

(declare-fun mapRes!54829 () Bool)

(assert (=> mapIsEmpty!54829 mapRes!54829))

(declare-fun b!1314260 () Bool)

(declare-fun res!872203 () Bool)

(assert (=> b!1314260 (=> (not res!872203) (not e!749733))))

(assert (=> b!1314260 (= res!872203 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43010 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54829 () Bool)

(declare-fun tp!104532 () Bool)

(assert (=> mapNonEmpty!54829 (= mapRes!54829 (and tp!104532 e!749731))))

(declare-fun mapValue!54829 () ValueCell!16835)

(declare-fun mapKey!54829 () (_ BitVec 32))

(declare-fun mapRest!54829 () (Array (_ BitVec 32) ValueCell!16835))

(assert (=> mapNonEmpty!54829 (= (arr!42460 _values!1354) (store mapRest!54829 mapKey!54829 mapValue!54829))))

(declare-fun b!1314261 () Bool)

(declare-fun e!749732 () Bool)

(assert (=> b!1314261 (= e!749732 (and e!749735 mapRes!54829))))

(declare-fun condMapEmpty!54829 () Bool)

(declare-fun mapDefault!54829 () ValueCell!16835)

(assert (=> b!1314261 (= condMapEmpty!54829 (= (arr!42460 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16835)) mapDefault!54829)))))

(declare-fun res!872200 () Bool)

(assert (=> start!111126 (=> (not res!872200) (not e!749733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111126 (= res!872200 (validMask!0 mask!2040))))

(assert (=> start!111126 e!749733))

(assert (=> start!111126 tp!104533))

(declare-fun array_inv!32333 (array!87967) Bool)

(assert (=> start!111126 (array_inv!32333 _keys!1628)))

(assert (=> start!111126 true))

(assert (=> start!111126 tp_is_empty!35467))

(declare-fun array_inv!32334 (array!87969) Bool)

(assert (=> start!111126 (and (array_inv!32334 _values!1354) e!749732)))

(declare-fun b!1314259 () Bool)

(declare-fun res!872202 () Bool)

(assert (=> b!1314259 (=> (not res!872202) (not e!749733))))

(declare-datatypes ((List!30139 0))(
  ( (Nil!30136) (Cons!30135 (h!31353 (_ BitVec 64)) (t!43737 List!30139)) )
))
(declare-fun arrayNoDuplicates!0 (array!87967 (_ BitVec 32) List!30139) Bool)

(assert (=> b!1314259 (= res!872202 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30136))))

(assert (= (and start!111126 res!872200) b!1314258))

(assert (= (and b!1314258 res!872204) b!1314254))

(assert (= (and b!1314254 res!872201) b!1314259))

(assert (= (and b!1314259 res!872202) b!1314260))

(assert (= (and b!1314260 res!872203) b!1314256))

(assert (= (and b!1314261 condMapEmpty!54829) mapIsEmpty!54829))

(assert (= (and b!1314261 (not condMapEmpty!54829)) mapNonEmpty!54829))

(get-info :version)

(assert (= (and mapNonEmpty!54829 ((_ is ValueCellFull!16835) mapValue!54829)) b!1314257))

(assert (= (and b!1314261 ((_ is ValueCellFull!16835) mapDefault!54829)) b!1314255))

(assert (= start!111126 b!1314261))

(declare-fun m!1203569 () Bool)

(assert (=> mapNonEmpty!54829 m!1203569))

(declare-fun m!1203571 () Bool)

(assert (=> b!1314254 m!1203571))

(declare-fun m!1203573 () Bool)

(assert (=> b!1314259 m!1203573))

(declare-fun m!1203575 () Bool)

(assert (=> b!1314256 m!1203575))

(assert (=> b!1314256 m!1203575))

(declare-fun m!1203577 () Bool)

(assert (=> b!1314256 m!1203577))

(declare-fun m!1203579 () Bool)

(assert (=> start!111126 m!1203579))

(declare-fun m!1203581 () Bool)

(assert (=> start!111126 m!1203581))

(declare-fun m!1203583 () Bool)

(assert (=> start!111126 m!1203583))

(check-sat (not b!1314259) b_and!47947 (not mapNonEmpty!54829) tp_is_empty!35467 (not start!111126) (not b_next!29737) (not b!1314254) (not b!1314256))
(check-sat b_and!47947 (not b_next!29737))
