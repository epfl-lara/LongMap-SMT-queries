; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110934 () Bool)

(assert start!110934)

(declare-fun b_free!29769 () Bool)

(declare-fun b_next!29769 () Bool)

(assert (=> start!110934 (= b_free!29769 (not b_next!29769))))

(declare-fun tp!104628 () Bool)

(declare-fun b_and!47977 () Bool)

(assert (=> start!110934 (= tp!104628 b_and!47977)))

(declare-fun b!1313366 () Bool)

(declare-fun res!871951 () Bool)

(declare-fun e!749130 () Bool)

(assert (=> b!1313366 (=> (not res!871951) (not e!749130))))

(declare-datatypes ((array!87978 0))(
  ( (array!87979 (arr!42469 (Array (_ BitVec 32) (_ BitVec 64))) (size!43019 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87978)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87978 (_ BitVec 32)) Bool)

(assert (=> b!1313366 (= res!871951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313367 () Bool)

(declare-fun e!749128 () Bool)

(declare-fun tp_is_empty!35499 () Bool)

(assert (=> b!1313367 (= e!749128 tp_is_empty!35499)))

(declare-fun b!1313368 () Bool)

(declare-fun res!871953 () Bool)

(assert (=> b!1313368 (=> (not res!871953) (not e!749130))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313368 (= res!871953 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43019 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54877 () Bool)

(declare-fun mapRes!54877 () Bool)

(assert (=> mapIsEmpty!54877 mapRes!54877))

(declare-fun b!1313369 () Bool)

(declare-fun e!749131 () Bool)

(assert (=> b!1313369 (= e!749131 tp_is_empty!35499)))

(declare-fun res!871950 () Bool)

(assert (=> start!110934 (=> (not res!871950) (not e!749130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110934 (= res!871950 (validMask!0 mask!2040))))

(assert (=> start!110934 e!749130))

(assert (=> start!110934 tp!104628))

(declare-fun array_inv!32081 (array!87978) Bool)

(assert (=> start!110934 (array_inv!32081 _keys!1628)))

(assert (=> start!110934 true))

(assert (=> start!110934 tp_is_empty!35499))

(declare-datatypes ((V!52435 0))(
  ( (V!52436 (val!17824 Int)) )
))
(declare-datatypes ((ValueCell!16851 0))(
  ( (ValueCellFull!16851 (v!20451 V!52435)) (EmptyCell!16851) )
))
(declare-datatypes ((array!87980 0))(
  ( (array!87981 (arr!42470 (Array (_ BitVec 32) ValueCell!16851)) (size!43020 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87980)

(declare-fun e!749129 () Bool)

(declare-fun array_inv!32082 (array!87980) Bool)

(assert (=> start!110934 (and (array_inv!32082 _values!1354) e!749129)))

(declare-fun b!1313370 () Bool)

(assert (=> b!1313370 (= e!749130 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52435)

(declare-fun lt!585663 () Bool)

(declare-fun zeroValue!1296 () V!52435)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22980 0))(
  ( (tuple2!22981 (_1!11501 (_ BitVec 64)) (_2!11501 V!52435)) )
))
(declare-datatypes ((List!30116 0))(
  ( (Nil!30113) (Cons!30112 (h!31321 tuple2!22980) (t!43722 List!30116)) )
))
(declare-datatypes ((ListLongMap!20637 0))(
  ( (ListLongMap!20638 (toList!10334 List!30116)) )
))
(declare-fun contains!8484 (ListLongMap!20637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5347 (array!87978 array!87980 (_ BitVec 32) (_ BitVec 32) V!52435 V!52435 (_ BitVec 32) Int) ListLongMap!20637)

(assert (=> b!1313370 (= lt!585663 (contains!8484 (getCurrentListMap!5347 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313371 () Bool)

(declare-fun res!871949 () Bool)

(assert (=> b!1313371 (=> (not res!871949) (not e!749130))))

(declare-datatypes ((List!30117 0))(
  ( (Nil!30114) (Cons!30113 (h!31322 (_ BitVec 64)) (t!43723 List!30117)) )
))
(declare-fun arrayNoDuplicates!0 (array!87978 (_ BitVec 32) List!30117) Bool)

(assert (=> b!1313371 (= res!871949 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30114))))

(declare-fun mapNonEmpty!54877 () Bool)

(declare-fun tp!104629 () Bool)

(assert (=> mapNonEmpty!54877 (= mapRes!54877 (and tp!104629 e!749131))))

(declare-fun mapValue!54877 () ValueCell!16851)

(declare-fun mapKey!54877 () (_ BitVec 32))

(declare-fun mapRest!54877 () (Array (_ BitVec 32) ValueCell!16851))

(assert (=> mapNonEmpty!54877 (= (arr!42470 _values!1354) (store mapRest!54877 mapKey!54877 mapValue!54877))))

(declare-fun b!1313372 () Bool)

(declare-fun res!871952 () Bool)

(assert (=> b!1313372 (=> (not res!871952) (not e!749130))))

(assert (=> b!1313372 (= res!871952 (and (= (size!43020 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43019 _keys!1628) (size!43020 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313373 () Bool)

(assert (=> b!1313373 (= e!749129 (and e!749128 mapRes!54877))))

(declare-fun condMapEmpty!54877 () Bool)

(declare-fun mapDefault!54877 () ValueCell!16851)

(assert (=> b!1313373 (= condMapEmpty!54877 (= (arr!42470 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16851)) mapDefault!54877)))))

(assert (= (and start!110934 res!871950) b!1313372))

(assert (= (and b!1313372 res!871952) b!1313366))

(assert (= (and b!1313366 res!871951) b!1313371))

(assert (= (and b!1313371 res!871949) b!1313368))

(assert (= (and b!1313368 res!871953) b!1313370))

(assert (= (and b!1313373 condMapEmpty!54877) mapIsEmpty!54877))

(assert (= (and b!1313373 (not condMapEmpty!54877)) mapNonEmpty!54877))

(get-info :version)

(assert (= (and mapNonEmpty!54877 ((_ is ValueCellFull!16851) mapValue!54877)) b!1313369))

(assert (= (and b!1313373 ((_ is ValueCellFull!16851) mapDefault!54877)) b!1313367))

(assert (= start!110934 b!1313373))

(declare-fun m!1202239 () Bool)

(assert (=> b!1313371 m!1202239))

(declare-fun m!1202241 () Bool)

(assert (=> start!110934 m!1202241))

(declare-fun m!1202243 () Bool)

(assert (=> start!110934 m!1202243))

(declare-fun m!1202245 () Bool)

(assert (=> start!110934 m!1202245))

(declare-fun m!1202247 () Bool)

(assert (=> b!1313370 m!1202247))

(assert (=> b!1313370 m!1202247))

(declare-fun m!1202249 () Bool)

(assert (=> b!1313370 m!1202249))

(declare-fun m!1202251 () Bool)

(assert (=> b!1313366 m!1202251))

(declare-fun m!1202253 () Bool)

(assert (=> mapNonEmpty!54877 m!1202253))

(check-sat (not mapNonEmpty!54877) (not b_next!29769) (not b!1313366) (not b!1313370) (not b!1313371) (not start!110934) tp_is_empty!35499 b_and!47977)
(check-sat b_and!47977 (not b_next!29769))
