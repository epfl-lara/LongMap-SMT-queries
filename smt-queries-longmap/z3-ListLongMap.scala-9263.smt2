; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111150 () Bool)

(assert start!111150)

(declare-fun b_free!29761 () Bool)

(declare-fun b_next!29761 () Bool)

(assert (=> start!111150 (= b_free!29761 (not b_next!29761))))

(declare-fun tp!104605 () Bool)

(declare-fun b_and!47971 () Bool)

(assert (=> start!111150 (= tp!104605 b_and!47971)))

(declare-fun mapNonEmpty!54865 () Bool)

(declare-fun mapRes!54865 () Bool)

(declare-fun tp!104604 () Bool)

(declare-fun e!749911 () Bool)

(assert (=> mapNonEmpty!54865 (= mapRes!54865 (and tp!104604 e!749911))))

(declare-fun mapKey!54865 () (_ BitVec 32))

(declare-datatypes ((V!52425 0))(
  ( (V!52426 (val!17820 Int)) )
))
(declare-datatypes ((ValueCell!16847 0))(
  ( (ValueCellFull!16847 (v!20442 V!52425)) (EmptyCell!16847) )
))
(declare-datatypes ((array!88011 0))(
  ( (array!88012 (arr!42481 (Array (_ BitVec 32) ValueCell!16847)) (size!43032 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88011)

(declare-fun mapRest!54865 () (Array (_ BitVec 32) ValueCell!16847))

(declare-fun mapValue!54865 () ValueCell!16847)

(assert (=> mapNonEmpty!54865 (= (arr!42481 _values!1354) (store mapRest!54865 mapKey!54865 mapValue!54865))))

(declare-fun b!1314569 () Bool)

(declare-fun res!872411 () Bool)

(declare-fun e!749913 () Bool)

(assert (=> b!1314569 (=> (not res!872411) (not e!749913))))

(declare-datatypes ((array!88013 0))(
  ( (array!88014 (arr!42482 (Array (_ BitVec 32) (_ BitVec 64))) (size!43033 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88013)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314569 (= res!872411 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43033 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54865 () Bool)

(assert (=> mapIsEmpty!54865 mapRes!54865))

(declare-fun b!1314570 () Bool)

(declare-fun res!872408 () Bool)

(assert (=> b!1314570 (=> (not res!872408) (not e!749913))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88013 (_ BitVec 32)) Bool)

(assert (=> b!1314570 (= res!872408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314571 () Bool)

(declare-fun e!749915 () Bool)

(declare-fun e!749914 () Bool)

(assert (=> b!1314571 (= e!749915 (and e!749914 mapRes!54865))))

(declare-fun condMapEmpty!54865 () Bool)

(declare-fun mapDefault!54865 () ValueCell!16847)

(assert (=> b!1314571 (= condMapEmpty!54865 (= (arr!42481 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16847)) mapDefault!54865)))))

(declare-fun b!1314572 () Bool)

(declare-fun res!872409 () Bool)

(assert (=> b!1314572 (=> (not res!872409) (not e!749913))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314572 (= res!872409 (and (= (size!43032 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43033 _keys!1628) (size!43032 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314573 () Bool)

(declare-fun res!872407 () Bool)

(assert (=> b!1314573 (=> (not res!872407) (not e!749913))))

(declare-datatypes ((List!30153 0))(
  ( (Nil!30150) (Cons!30149 (h!31367 (_ BitVec 64)) (t!43751 List!30153)) )
))
(declare-fun arrayNoDuplicates!0 (array!88013 (_ BitVec 32) List!30153) Bool)

(assert (=> b!1314573 (= res!872407 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30150))))

(declare-fun b!1314574 () Bool)

(declare-fun tp_is_empty!35491 () Bool)

(assert (=> b!1314574 (= e!749911 tp_is_empty!35491)))

(declare-fun res!872410 () Bool)

(assert (=> start!111150 (=> (not res!872410) (not e!749913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111150 (= res!872410 (validMask!0 mask!2040))))

(assert (=> start!111150 e!749913))

(assert (=> start!111150 tp!104605))

(declare-fun array_inv!32347 (array!88013) Bool)

(assert (=> start!111150 (array_inv!32347 _keys!1628)))

(assert (=> start!111150 true))

(assert (=> start!111150 tp_is_empty!35491))

(declare-fun array_inv!32348 (array!88011) Bool)

(assert (=> start!111150 (and (array_inv!32348 _values!1354) e!749915)))

(declare-fun b!1314575 () Bool)

(assert (=> b!1314575 (= e!749914 tp_is_empty!35491)))

(declare-fun b!1314576 () Bool)

(assert (=> b!1314576 (= e!749913 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52425)

(declare-fun zeroValue!1296 () V!52425)

(declare-fun lt!586127 () Bool)

(declare-datatypes ((tuple2!23002 0))(
  ( (tuple2!23003 (_1!11512 (_ BitVec 64)) (_2!11512 V!52425)) )
))
(declare-datatypes ((List!30154 0))(
  ( (Nil!30151) (Cons!30150 (h!31368 tuple2!23002) (t!43752 List!30154)) )
))
(declare-datatypes ((ListLongMap!20667 0))(
  ( (ListLongMap!20668 (toList!10349 List!30154)) )
))
(declare-fun contains!8511 (ListLongMap!20667 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5353 (array!88013 array!88011 (_ BitVec 32) (_ BitVec 32) V!52425 V!52425 (_ BitVec 32) Int) ListLongMap!20667)

(assert (=> b!1314576 (= lt!586127 (contains!8511 (getCurrentListMap!5353 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!111150 res!872410) b!1314572))

(assert (= (and b!1314572 res!872409) b!1314570))

(assert (= (and b!1314570 res!872408) b!1314573))

(assert (= (and b!1314573 res!872407) b!1314569))

(assert (= (and b!1314569 res!872411) b!1314576))

(assert (= (and b!1314571 condMapEmpty!54865) mapIsEmpty!54865))

(assert (= (and b!1314571 (not condMapEmpty!54865)) mapNonEmpty!54865))

(get-info :version)

(assert (= (and mapNonEmpty!54865 ((_ is ValueCellFull!16847) mapValue!54865)) b!1314574))

(assert (= (and b!1314571 ((_ is ValueCellFull!16847) mapDefault!54865)) b!1314575))

(assert (= start!111150 b!1314571))

(declare-fun m!1203773 () Bool)

(assert (=> start!111150 m!1203773))

(declare-fun m!1203775 () Bool)

(assert (=> start!111150 m!1203775))

(declare-fun m!1203777 () Bool)

(assert (=> start!111150 m!1203777))

(declare-fun m!1203779 () Bool)

(assert (=> b!1314576 m!1203779))

(assert (=> b!1314576 m!1203779))

(declare-fun m!1203781 () Bool)

(assert (=> b!1314576 m!1203781))

(declare-fun m!1203783 () Bool)

(assert (=> b!1314573 m!1203783))

(declare-fun m!1203785 () Bool)

(assert (=> b!1314570 m!1203785))

(declare-fun m!1203787 () Bool)

(assert (=> mapNonEmpty!54865 m!1203787))

(check-sat (not start!111150) (not b!1314573) tp_is_empty!35491 (not b!1314576) (not b_next!29761) (not b!1314570) b_and!47971 (not mapNonEmpty!54865))
(check-sat b_and!47971 (not b_next!29761))
