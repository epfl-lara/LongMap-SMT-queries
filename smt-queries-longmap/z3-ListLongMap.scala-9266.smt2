; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110946 () Bool)

(assert start!110946)

(declare-fun b_free!29781 () Bool)

(declare-fun b_next!29781 () Bool)

(assert (=> start!110946 (= b_free!29781 (not b_next!29781))))

(declare-fun tp!104665 () Bool)

(declare-fun b_and!47989 () Bool)

(assert (=> start!110946 (= tp!104665 b_and!47989)))

(declare-fun b!1313510 () Bool)

(declare-fun res!872042 () Bool)

(declare-fun e!749221 () Bool)

(assert (=> b!1313510 (=> (not res!872042) (not e!749221))))

(declare-datatypes ((array!88000 0))(
  ( (array!88001 (arr!42480 (Array (_ BitVec 32) (_ BitVec 64))) (size!43030 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88000)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88000 (_ BitVec 32)) Bool)

(assert (=> b!1313510 (= res!872042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313511 () Bool)

(assert (=> b!1313511 (= e!749221 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52451 0))(
  ( (V!52452 (val!17830 Int)) )
))
(declare-fun minValue!1296 () V!52451)

(declare-datatypes ((ValueCell!16857 0))(
  ( (ValueCellFull!16857 (v!20457 V!52451)) (EmptyCell!16857) )
))
(declare-datatypes ((array!88002 0))(
  ( (array!88003 (arr!42481 (Array (_ BitVec 32) ValueCell!16857)) (size!43031 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88002)

(declare-fun zeroValue!1296 () V!52451)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585681 () Bool)

(declare-datatypes ((tuple2!22988 0))(
  ( (tuple2!22989 (_1!11505 (_ BitVec 64)) (_2!11505 V!52451)) )
))
(declare-datatypes ((List!30124 0))(
  ( (Nil!30121) (Cons!30120 (h!31329 tuple2!22988) (t!43730 List!30124)) )
))
(declare-datatypes ((ListLongMap!20645 0))(
  ( (ListLongMap!20646 (toList!10338 List!30124)) )
))
(declare-fun contains!8488 (ListLongMap!20645 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5351 (array!88000 array!88002 (_ BitVec 32) (_ BitVec 32) V!52451 V!52451 (_ BitVec 32) Int) ListLongMap!20645)

(assert (=> b!1313511 (= lt!585681 (contains!8488 (getCurrentListMap!5351 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313512 () Bool)

(declare-fun e!749222 () Bool)

(declare-fun tp_is_empty!35511 () Bool)

(assert (=> b!1313512 (= e!749222 tp_is_empty!35511)))

(declare-fun res!872039 () Bool)

(assert (=> start!110946 (=> (not res!872039) (not e!749221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110946 (= res!872039 (validMask!0 mask!2040))))

(assert (=> start!110946 e!749221))

(assert (=> start!110946 tp!104665))

(declare-fun array_inv!32087 (array!88000) Bool)

(assert (=> start!110946 (array_inv!32087 _keys!1628)))

(assert (=> start!110946 true))

(assert (=> start!110946 tp_is_empty!35511))

(declare-fun e!749219 () Bool)

(declare-fun array_inv!32088 (array!88002) Bool)

(assert (=> start!110946 (and (array_inv!32088 _values!1354) e!749219)))

(declare-fun mapNonEmpty!54895 () Bool)

(declare-fun mapRes!54895 () Bool)

(declare-fun tp!104664 () Bool)

(assert (=> mapNonEmpty!54895 (= mapRes!54895 (and tp!104664 e!749222))))

(declare-fun mapValue!54895 () ValueCell!16857)

(declare-fun mapRest!54895 () (Array (_ BitVec 32) ValueCell!16857))

(declare-fun mapKey!54895 () (_ BitVec 32))

(assert (=> mapNonEmpty!54895 (= (arr!42481 _values!1354) (store mapRest!54895 mapKey!54895 mapValue!54895))))

(declare-fun b!1313513 () Bool)

(declare-fun res!872041 () Bool)

(assert (=> b!1313513 (=> (not res!872041) (not e!749221))))

(declare-datatypes ((List!30125 0))(
  ( (Nil!30122) (Cons!30121 (h!31330 (_ BitVec 64)) (t!43731 List!30125)) )
))
(declare-fun arrayNoDuplicates!0 (array!88000 (_ BitVec 32) List!30125) Bool)

(assert (=> b!1313513 (= res!872041 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30122))))

(declare-fun b!1313514 () Bool)

(declare-fun e!749218 () Bool)

(assert (=> b!1313514 (= e!749218 tp_is_empty!35511)))

(declare-fun mapIsEmpty!54895 () Bool)

(assert (=> mapIsEmpty!54895 mapRes!54895))

(declare-fun b!1313515 () Bool)

(declare-fun res!872043 () Bool)

(assert (=> b!1313515 (=> (not res!872043) (not e!749221))))

(assert (=> b!1313515 (= res!872043 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43030 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313516 () Bool)

(declare-fun res!872040 () Bool)

(assert (=> b!1313516 (=> (not res!872040) (not e!749221))))

(assert (=> b!1313516 (= res!872040 (and (= (size!43031 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43030 _keys!1628) (size!43031 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313517 () Bool)

(assert (=> b!1313517 (= e!749219 (and e!749218 mapRes!54895))))

(declare-fun condMapEmpty!54895 () Bool)

(declare-fun mapDefault!54895 () ValueCell!16857)

(assert (=> b!1313517 (= condMapEmpty!54895 (= (arr!42481 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16857)) mapDefault!54895)))))

(assert (= (and start!110946 res!872039) b!1313516))

(assert (= (and b!1313516 res!872040) b!1313510))

(assert (= (and b!1313510 res!872042) b!1313513))

(assert (= (and b!1313513 res!872041) b!1313515))

(assert (= (and b!1313515 res!872043) b!1313511))

(assert (= (and b!1313517 condMapEmpty!54895) mapIsEmpty!54895))

(assert (= (and b!1313517 (not condMapEmpty!54895)) mapNonEmpty!54895))

(get-info :version)

(assert (= (and mapNonEmpty!54895 ((_ is ValueCellFull!16857) mapValue!54895)) b!1313512))

(assert (= (and b!1313517 ((_ is ValueCellFull!16857) mapDefault!54895)) b!1313514))

(assert (= start!110946 b!1313517))

(declare-fun m!1202335 () Bool)

(assert (=> b!1313511 m!1202335))

(assert (=> b!1313511 m!1202335))

(declare-fun m!1202337 () Bool)

(assert (=> b!1313511 m!1202337))

(declare-fun m!1202339 () Bool)

(assert (=> b!1313510 m!1202339))

(declare-fun m!1202341 () Bool)

(assert (=> b!1313513 m!1202341))

(declare-fun m!1202343 () Bool)

(assert (=> mapNonEmpty!54895 m!1202343))

(declare-fun m!1202345 () Bool)

(assert (=> start!110946 m!1202345))

(declare-fun m!1202347 () Bool)

(assert (=> start!110946 m!1202347))

(declare-fun m!1202349 () Bool)

(assert (=> start!110946 m!1202349))

(check-sat b_and!47989 (not b_next!29781) (not start!110946) tp_is_empty!35511 (not mapNonEmpty!54895) (not b!1313513) (not b!1313510) (not b!1313511))
(check-sat b_and!47989 (not b_next!29781))
