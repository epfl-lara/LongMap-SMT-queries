; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111132 () Bool)

(assert start!111132)

(declare-fun b_free!29743 () Bool)

(declare-fun b_next!29743 () Bool)

(assert (=> start!111132 (= b_free!29743 (not b_next!29743))))

(declare-fun tp!104550 () Bool)

(declare-fun b_and!47953 () Bool)

(assert (=> start!111132 (= tp!104550 b_and!47953)))

(declare-fun mapIsEmpty!54838 () Bool)

(declare-fun mapRes!54838 () Bool)

(assert (=> mapIsEmpty!54838 mapRes!54838))

(declare-fun res!872246 () Bool)

(declare-fun e!749780 () Bool)

(assert (=> start!111132 (=> (not res!872246) (not e!749780))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111132 (= res!872246 (validMask!0 mask!2040))))

(assert (=> start!111132 e!749780))

(assert (=> start!111132 tp!104550))

(declare-datatypes ((array!87977 0))(
  ( (array!87978 (arr!42464 (Array (_ BitVec 32) (_ BitVec 64))) (size!43015 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87977)

(declare-fun array_inv!32335 (array!87977) Bool)

(assert (=> start!111132 (array_inv!32335 _keys!1628)))

(assert (=> start!111132 true))

(declare-fun tp_is_empty!35473 () Bool)

(assert (=> start!111132 tp_is_empty!35473))

(declare-datatypes ((V!52401 0))(
  ( (V!52402 (val!17811 Int)) )
))
(declare-datatypes ((ValueCell!16838 0))(
  ( (ValueCellFull!16838 (v!20433 V!52401)) (EmptyCell!16838) )
))
(declare-datatypes ((array!87979 0))(
  ( (array!87980 (arr!42465 (Array (_ BitVec 32) ValueCell!16838)) (size!43016 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87979)

(declare-fun e!749778 () Bool)

(declare-fun array_inv!32336 (array!87979) Bool)

(assert (=> start!111132 (and (array_inv!32336 _values!1354) e!749778)))

(declare-fun b!1314326 () Bool)

(declare-fun res!872248 () Bool)

(assert (=> b!1314326 (=> (not res!872248) (not e!749780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87977 (_ BitVec 32)) Bool)

(assert (=> b!1314326 (= res!872248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314327 () Bool)

(declare-fun e!749777 () Bool)

(assert (=> b!1314327 (= e!749777 tp_is_empty!35473)))

(declare-fun b!1314328 () Bool)

(declare-fun res!872249 () Bool)

(assert (=> b!1314328 (=> (not res!872249) (not e!749780))))

(declare-datatypes ((List!30141 0))(
  ( (Nil!30138) (Cons!30137 (h!31355 (_ BitVec 64)) (t!43739 List!30141)) )
))
(declare-fun arrayNoDuplicates!0 (array!87977 (_ BitVec 32) List!30141) Bool)

(assert (=> b!1314328 (= res!872249 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30138))))

(declare-fun mapNonEmpty!54838 () Bool)

(declare-fun tp!104551 () Bool)

(assert (=> mapNonEmpty!54838 (= mapRes!54838 (and tp!104551 e!749777))))

(declare-fun mapValue!54838 () ValueCell!16838)

(declare-fun mapRest!54838 () (Array (_ BitVec 32) ValueCell!16838))

(declare-fun mapKey!54838 () (_ BitVec 32))

(assert (=> mapNonEmpty!54838 (= (arr!42465 _values!1354) (store mapRest!54838 mapKey!54838 mapValue!54838))))

(declare-fun b!1314329 () Bool)

(declare-fun e!749779 () Bool)

(assert (=> b!1314329 (= e!749779 tp_is_empty!35473)))

(declare-fun b!1314330 () Bool)

(assert (=> b!1314330 (= e!749778 (and e!749779 mapRes!54838))))

(declare-fun condMapEmpty!54838 () Bool)

(declare-fun mapDefault!54838 () ValueCell!16838)

(assert (=> b!1314330 (= condMapEmpty!54838 (= (arr!42465 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16838)) mapDefault!54838)))))

(declare-fun b!1314331 () Bool)

(declare-fun res!872247 () Bool)

(assert (=> b!1314331 (=> (not res!872247) (not e!749780))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314331 (= res!872247 (and (= (size!43016 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43015 _keys!1628) (size!43016 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314332 () Bool)

(assert (=> b!1314332 (= e!749780 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586109 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52401)

(declare-fun zeroValue!1296 () V!52401)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22990 0))(
  ( (tuple2!22991 (_1!11506 (_ BitVec 64)) (_2!11506 V!52401)) )
))
(declare-datatypes ((List!30142 0))(
  ( (Nil!30139) (Cons!30138 (h!31356 tuple2!22990) (t!43740 List!30142)) )
))
(declare-datatypes ((ListLongMap!20655 0))(
  ( (ListLongMap!20656 (toList!10343 List!30142)) )
))
(declare-fun contains!8505 (ListLongMap!20655 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5347 (array!87977 array!87979 (_ BitVec 32) (_ BitVec 32) V!52401 V!52401 (_ BitVec 32) Int) ListLongMap!20655)

(assert (=> b!1314332 (= lt!586109 (contains!8505 (getCurrentListMap!5347 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314333 () Bool)

(declare-fun res!872245 () Bool)

(assert (=> b!1314333 (=> (not res!872245) (not e!749780))))

(assert (=> b!1314333 (= res!872245 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43015 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111132 res!872246) b!1314331))

(assert (= (and b!1314331 res!872247) b!1314326))

(assert (= (and b!1314326 res!872248) b!1314328))

(assert (= (and b!1314328 res!872249) b!1314333))

(assert (= (and b!1314333 res!872245) b!1314332))

(assert (= (and b!1314330 condMapEmpty!54838) mapIsEmpty!54838))

(assert (= (and b!1314330 (not condMapEmpty!54838)) mapNonEmpty!54838))

(get-info :version)

(assert (= (and mapNonEmpty!54838 ((_ is ValueCellFull!16838) mapValue!54838)) b!1314327))

(assert (= (and b!1314330 ((_ is ValueCellFull!16838) mapDefault!54838)) b!1314329))

(assert (= start!111132 b!1314330))

(declare-fun m!1203617 () Bool)

(assert (=> b!1314328 m!1203617))

(declare-fun m!1203619 () Bool)

(assert (=> start!111132 m!1203619))

(declare-fun m!1203621 () Bool)

(assert (=> start!111132 m!1203621))

(declare-fun m!1203623 () Bool)

(assert (=> start!111132 m!1203623))

(declare-fun m!1203625 () Bool)

(assert (=> b!1314326 m!1203625))

(declare-fun m!1203627 () Bool)

(assert (=> b!1314332 m!1203627))

(assert (=> b!1314332 m!1203627))

(declare-fun m!1203629 () Bool)

(assert (=> b!1314332 m!1203629))

(declare-fun m!1203631 () Bool)

(assert (=> mapNonEmpty!54838 m!1203631))

(check-sat (not b_next!29743) tp_is_empty!35473 (not b!1314328) (not start!111132) (not b!1314326) (not b!1314332) (not mapNonEmpty!54838) b_and!47953)
(check-sat b_and!47953 (not b_next!29743))
