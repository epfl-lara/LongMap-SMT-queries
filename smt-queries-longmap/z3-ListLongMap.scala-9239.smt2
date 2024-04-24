; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111006 () Bool)

(assert start!111006)

(declare-fun b_free!29617 () Bool)

(declare-fun b_next!29617 () Bool)

(assert (=> start!111006 (= b_free!29617 (not b_next!29617))))

(declare-fun tp!104173 () Bool)

(declare-fun b_and!47827 () Bool)

(assert (=> start!111006 (= tp!104173 b_and!47827)))

(declare-fun b!1312491 () Bool)

(declare-fun res!870978 () Bool)

(declare-fun e!748833 () Bool)

(assert (=> b!1312491 (=> (not res!870978) (not e!748833))))

(declare-datatypes ((array!87735 0))(
  ( (array!87736 (arr!42343 (Array (_ BitVec 32) (_ BitVec 64))) (size!42894 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87735)

(declare-datatypes ((List!30060 0))(
  ( (Nil!30057) (Cons!30056 (h!31274 (_ BitVec 64)) (t!43658 List!30060)) )
))
(declare-fun arrayNoDuplicates!0 (array!87735 (_ BitVec 32) List!30060) Bool)

(assert (=> b!1312491 (= res!870978 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30057))))

(declare-fun b!1312492 () Bool)

(assert (=> b!1312492 (= e!748833 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun lt!585920 () Bool)

(declare-datatypes ((V!52233 0))(
  ( (V!52234 (val!17748 Int)) )
))
(declare-fun minValue!1296 () V!52233)

(declare-datatypes ((ValueCell!16775 0))(
  ( (ValueCellFull!16775 (v!20370 V!52233)) (EmptyCell!16775) )
))
(declare-datatypes ((array!87737 0))(
  ( (array!87738 (arr!42344 (Array (_ BitVec 32) ValueCell!16775)) (size!42895 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87737)

(declare-fun zeroValue!1296 () V!52233)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22906 0))(
  ( (tuple2!22907 (_1!11464 (_ BitVec 64)) (_2!11464 V!52233)) )
))
(declare-datatypes ((List!30061 0))(
  ( (Nil!30058) (Cons!30057 (h!31275 tuple2!22906) (t!43659 List!30061)) )
))
(declare-datatypes ((ListLongMap!20571 0))(
  ( (ListLongMap!20572 (toList!10301 List!30061)) )
))
(declare-fun contains!8463 (ListLongMap!20571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5305 (array!87735 array!87737 (_ BitVec 32) (_ BitVec 32) V!52233 V!52233 (_ BitVec 32) Int) ListLongMap!20571)

(assert (=> b!1312492 (= lt!585920 (contains!8463 (getCurrentListMap!5305 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312493 () Bool)

(declare-fun res!870977 () Bool)

(assert (=> b!1312493 (=> (not res!870977) (not e!748833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87735 (_ BitVec 32)) Bool)

(assert (=> b!1312493 (= res!870977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312494 () Bool)

(declare-fun res!870979 () Bool)

(assert (=> b!1312494 (=> (not res!870979) (not e!748833))))

(assert (=> b!1312494 (= res!870979 (and (= (size!42895 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42894 _keys!1628) (size!42895 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54649 () Bool)

(declare-fun mapRes!54649 () Bool)

(declare-fun tp!104172 () Bool)

(declare-fun e!748832 () Bool)

(assert (=> mapNonEmpty!54649 (= mapRes!54649 (and tp!104172 e!748832))))

(declare-fun mapRest!54649 () (Array (_ BitVec 32) ValueCell!16775))

(declare-fun mapValue!54649 () ValueCell!16775)

(declare-fun mapKey!54649 () (_ BitVec 32))

(assert (=> mapNonEmpty!54649 (= (arr!42344 _values!1354) (store mapRest!54649 mapKey!54649 mapValue!54649))))

(declare-fun b!1312490 () Bool)

(declare-fun res!870976 () Bool)

(assert (=> b!1312490 (=> (not res!870976) (not e!748833))))

(assert (=> b!1312490 (= res!870976 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42894 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!870980 () Bool)

(assert (=> start!111006 (=> (not res!870980) (not e!748833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111006 (= res!870980 (validMask!0 mask!2040))))

(assert (=> start!111006 e!748833))

(assert (=> start!111006 tp!104173))

(declare-fun array_inv!32263 (array!87735) Bool)

(assert (=> start!111006 (array_inv!32263 _keys!1628)))

(assert (=> start!111006 true))

(declare-fun tp_is_empty!35347 () Bool)

(assert (=> start!111006 tp_is_empty!35347))

(declare-fun e!748834 () Bool)

(declare-fun array_inv!32264 (array!87737) Bool)

(assert (=> start!111006 (and (array_inv!32264 _values!1354) e!748834)))

(declare-fun mapIsEmpty!54649 () Bool)

(assert (=> mapIsEmpty!54649 mapRes!54649))

(declare-fun b!1312495 () Bool)

(assert (=> b!1312495 (= e!748832 tp_is_empty!35347)))

(declare-fun b!1312496 () Bool)

(declare-fun e!748831 () Bool)

(assert (=> b!1312496 (= e!748831 tp_is_empty!35347)))

(declare-fun b!1312497 () Bool)

(assert (=> b!1312497 (= e!748834 (and e!748831 mapRes!54649))))

(declare-fun condMapEmpty!54649 () Bool)

(declare-fun mapDefault!54649 () ValueCell!16775)

(assert (=> b!1312497 (= condMapEmpty!54649 (= (arr!42344 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16775)) mapDefault!54649)))))

(assert (= (and start!111006 res!870980) b!1312494))

(assert (= (and b!1312494 res!870979) b!1312493))

(assert (= (and b!1312493 res!870977) b!1312491))

(assert (= (and b!1312491 res!870978) b!1312490))

(assert (= (and b!1312490 res!870976) b!1312492))

(assert (= (and b!1312497 condMapEmpty!54649) mapIsEmpty!54649))

(assert (= (and b!1312497 (not condMapEmpty!54649)) mapNonEmpty!54649))

(get-info :version)

(assert (= (and mapNonEmpty!54649 ((_ is ValueCellFull!16775) mapValue!54649)) b!1312495))

(assert (= (and b!1312497 ((_ is ValueCellFull!16775) mapDefault!54649)) b!1312496))

(assert (= start!111006 b!1312497))

(declare-fun m!1202339 () Bool)

(assert (=> b!1312493 m!1202339))

(declare-fun m!1202341 () Bool)

(assert (=> mapNonEmpty!54649 m!1202341))

(declare-fun m!1202343 () Bool)

(assert (=> b!1312492 m!1202343))

(assert (=> b!1312492 m!1202343))

(declare-fun m!1202345 () Bool)

(assert (=> b!1312492 m!1202345))

(declare-fun m!1202347 () Bool)

(assert (=> start!111006 m!1202347))

(declare-fun m!1202349 () Bool)

(assert (=> start!111006 m!1202349))

(declare-fun m!1202351 () Bool)

(assert (=> start!111006 m!1202351))

(declare-fun m!1202353 () Bool)

(assert (=> b!1312491 m!1202353))

(check-sat (not b!1312492) b_and!47827 (not b_next!29617) (not b!1312491) tp_is_empty!35347 (not mapNonEmpty!54649) (not b!1312493) (not start!111006))
(check-sat b_and!47827 (not b_next!29617))
