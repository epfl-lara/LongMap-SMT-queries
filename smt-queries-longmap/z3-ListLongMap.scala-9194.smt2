; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110736 () Bool)

(assert start!110736)

(declare-fun b_free!29347 () Bool)

(declare-fun b_next!29347 () Bool)

(assert (=> start!110736 (= b_free!29347 (not b_next!29347))))

(declare-fun tp!103362 () Bool)

(declare-fun b_and!47557 () Bool)

(assert (=> start!110736 (= tp!103362 b_and!47557)))

(declare-fun res!868304 () Bool)

(declare-fun e!746810 () Bool)

(assert (=> start!110736 (=> (not res!868304) (not e!746810))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110736 (= res!868304 (validMask!0 mask!2040))))

(assert (=> start!110736 e!746810))

(assert (=> start!110736 tp!103362))

(declare-datatypes ((array!87217 0))(
  ( (array!87218 (arr!42084 (Array (_ BitVec 32) (_ BitVec 64))) (size!42635 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87217)

(declare-fun array_inv!32067 (array!87217) Bool)

(assert (=> start!110736 (array_inv!32067 _keys!1628)))

(assert (=> start!110736 true))

(declare-fun tp_is_empty!35077 () Bool)

(assert (=> start!110736 tp_is_empty!35077))

(declare-datatypes ((V!51873 0))(
  ( (V!51874 (val!17613 Int)) )
))
(declare-datatypes ((ValueCell!16640 0))(
  ( (ValueCellFull!16640 (v!20235 V!51873)) (EmptyCell!16640) )
))
(declare-datatypes ((array!87219 0))(
  ( (array!87220 (arr!42085 (Array (_ BitVec 32) ValueCell!16640)) (size!42636 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87219)

(declare-fun e!746807 () Bool)

(declare-fun array_inv!32068 (array!87219) Bool)

(assert (=> start!110736 (and (array_inv!32068 _values!1354) e!746807)))

(declare-fun mapNonEmpty!54244 () Bool)

(declare-fun mapRes!54244 () Bool)

(declare-fun tp!103363 () Bool)

(declare-fun e!746806 () Bool)

(assert (=> mapNonEmpty!54244 (= mapRes!54244 (and tp!103363 e!746806))))

(declare-fun mapValue!54244 () ValueCell!16640)

(declare-fun mapKey!54244 () (_ BitVec 32))

(declare-fun mapRest!54244 () (Array (_ BitVec 32) ValueCell!16640))

(assert (=> mapNonEmpty!54244 (= (arr!42085 _values!1354) (store mapRest!54244 mapKey!54244 mapValue!54244))))

(declare-fun b!1308602 () Bool)

(declare-fun res!868303 () Bool)

(assert (=> b!1308602 (=> (not res!868303) (not e!746810))))

(declare-datatypes ((List!29871 0))(
  ( (Nil!29868) (Cons!29867 (h!31085 (_ BitVec 64)) (t!43469 List!29871)) )
))
(declare-fun arrayNoDuplicates!0 (array!87217 (_ BitVec 32) List!29871) Bool)

(assert (=> b!1308602 (= res!868303 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29868))))

(declare-fun b!1308603 () Bool)

(declare-fun e!746809 () Bool)

(assert (=> b!1308603 (= e!746807 (and e!746809 mapRes!54244))))

(declare-fun condMapEmpty!54244 () Bool)

(declare-fun mapDefault!54244 () ValueCell!16640)

(assert (=> b!1308603 (= condMapEmpty!54244 (= (arr!42085 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16640)) mapDefault!54244)))))

(declare-fun b!1308604 () Bool)

(declare-fun res!868307 () Bool)

(assert (=> b!1308604 (=> (not res!868307) (not e!746810))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308604 (= res!868307 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42635 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308605 () Bool)

(assert (=> b!1308605 (= e!746809 tp_is_empty!35077)))

(declare-fun b!1308606 () Bool)

(declare-fun res!868305 () Bool)

(assert (=> b!1308606 (=> (not res!868305) (not e!746810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87217 (_ BitVec 32)) Bool)

(assert (=> b!1308606 (= res!868305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308607 () Bool)

(assert (=> b!1308607 (= e!746806 tp_is_empty!35077)))

(declare-fun b!1308608 () Bool)

(declare-fun res!868306 () Bool)

(assert (=> b!1308608 (=> (not res!868306) (not e!746810))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308608 (= res!868306 (and (= (size!42636 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42635 _keys!1628) (size!42636 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308609 () Bool)

(assert (=> b!1308609 (= e!746810 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585515 () Bool)

(declare-fun minValue!1296 () V!51873)

(declare-fun zeroValue!1296 () V!51873)

(declare-datatypes ((tuple2!22704 0))(
  ( (tuple2!22705 (_1!11363 (_ BitVec 64)) (_2!11363 V!51873)) )
))
(declare-datatypes ((List!29872 0))(
  ( (Nil!29869) (Cons!29868 (h!31086 tuple2!22704) (t!43470 List!29872)) )
))
(declare-datatypes ((ListLongMap!20369 0))(
  ( (ListLongMap!20370 (toList!10200 List!29872)) )
))
(declare-fun contains!8362 (ListLongMap!20369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5204 (array!87217 array!87219 (_ BitVec 32) (_ BitVec 32) V!51873 V!51873 (_ BitVec 32) Int) ListLongMap!20369)

(assert (=> b!1308609 (= lt!585515 (contains!8362 (getCurrentListMap!5204 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54244 () Bool)

(assert (=> mapIsEmpty!54244 mapRes!54244))

(assert (= (and start!110736 res!868304) b!1308608))

(assert (= (and b!1308608 res!868306) b!1308606))

(assert (= (and b!1308606 res!868305) b!1308602))

(assert (= (and b!1308602 res!868303) b!1308604))

(assert (= (and b!1308604 res!868307) b!1308609))

(assert (= (and b!1308603 condMapEmpty!54244) mapIsEmpty!54244))

(assert (= (and b!1308603 (not condMapEmpty!54244)) mapNonEmpty!54244))

(get-info :version)

(assert (= (and mapNonEmpty!54244 ((_ is ValueCellFull!16640) mapValue!54244)) b!1308607))

(assert (= (and b!1308603 ((_ is ValueCellFull!16640) mapDefault!54244)) b!1308605))

(assert (= start!110736 b!1308603))

(declare-fun m!1199639 () Bool)

(assert (=> b!1308609 m!1199639))

(assert (=> b!1308609 m!1199639))

(declare-fun m!1199641 () Bool)

(assert (=> b!1308609 m!1199641))

(declare-fun m!1199643 () Bool)

(assert (=> start!110736 m!1199643))

(declare-fun m!1199645 () Bool)

(assert (=> start!110736 m!1199645))

(declare-fun m!1199647 () Bool)

(assert (=> start!110736 m!1199647))

(declare-fun m!1199649 () Bool)

(assert (=> b!1308606 m!1199649))

(declare-fun m!1199651 () Bool)

(assert (=> mapNonEmpty!54244 m!1199651))

(declare-fun m!1199653 () Bool)

(assert (=> b!1308602 m!1199653))

(check-sat (not mapNonEmpty!54244) (not b!1308606) (not b!1308602) tp_is_empty!35077 (not b!1308609) b_and!47557 (not start!110736) (not b_next!29347))
(check-sat b_and!47557 (not b_next!29347))
