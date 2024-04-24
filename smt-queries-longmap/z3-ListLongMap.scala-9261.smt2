; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111138 () Bool)

(assert start!111138)

(declare-fun b_free!29749 () Bool)

(declare-fun b_next!29749 () Bool)

(assert (=> start!111138 (= b_free!29749 (not b_next!29749))))

(declare-fun tp!104568 () Bool)

(declare-fun b_and!47959 () Bool)

(assert (=> start!111138 (= tp!104568 b_and!47959)))

(declare-fun b!1314404 () Bool)

(declare-fun res!872296 () Bool)

(declare-fun e!749823 () Bool)

(assert (=> b!1314404 (=> (not res!872296) (not e!749823))))

(declare-datatypes ((array!87987 0))(
  ( (array!87988 (arr!42469 (Array (_ BitVec 32) (_ BitVec 64))) (size!43020 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87987)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1314404 (= res!872296 (not (validKeyInArray!0 (select (arr!42469 _keys!1628) from!2020))))))

(declare-fun b!1314405 () Bool)

(declare-fun res!872297 () Bool)

(assert (=> b!1314405 (=> (not res!872297) (not e!749823))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1314405 (= res!872297 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43020 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314406 () Bool)

(declare-fun res!872302 () Bool)

(assert (=> b!1314406 (=> (not res!872302) (not e!749823))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52409 0))(
  ( (V!52410 (val!17814 Int)) )
))
(declare-fun minValue!1296 () V!52409)

(declare-datatypes ((ValueCell!16841 0))(
  ( (ValueCellFull!16841 (v!20436 V!52409)) (EmptyCell!16841) )
))
(declare-datatypes ((array!87989 0))(
  ( (array!87990 (arr!42470 (Array (_ BitVec 32) ValueCell!16841)) (size!43021 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87989)

(declare-fun zeroValue!1296 () V!52409)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22992 0))(
  ( (tuple2!22993 (_1!11507 (_ BitVec 64)) (_2!11507 V!52409)) )
))
(declare-datatypes ((List!30143 0))(
  ( (Nil!30140) (Cons!30139 (h!31357 tuple2!22992) (t!43741 List!30143)) )
))
(declare-datatypes ((ListLongMap!20657 0))(
  ( (ListLongMap!20658 (toList!10344 List!30143)) )
))
(declare-fun contains!8506 (ListLongMap!20657 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5348 (array!87987 array!87989 (_ BitVec 32) (_ BitVec 32) V!52409 V!52409 (_ BitVec 32) Int) ListLongMap!20657)

(assert (=> b!1314406 (= res!872302 (contains!8506 (getCurrentListMap!5348 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314407 () Bool)

(declare-fun res!872299 () Bool)

(assert (=> b!1314407 (=> (not res!872299) (not e!749823))))

(assert (=> b!1314407 (= res!872299 (and (= (size!43021 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43020 _keys!1628) (size!43021 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314408 () Bool)

(declare-fun res!872301 () Bool)

(assert (=> b!1314408 (=> (not res!872301) (not e!749823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87987 (_ BitVec 32)) Bool)

(assert (=> b!1314408 (= res!872301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314409 () Bool)

(declare-fun res!872300 () Bool)

(assert (=> b!1314409 (=> (not res!872300) (not e!749823))))

(assert (=> b!1314409 (= res!872300 (not (= (select (arr!42469 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1314411 () Bool)

(declare-fun e!749821 () Bool)

(declare-fun tp_is_empty!35479 () Bool)

(assert (=> b!1314411 (= e!749821 tp_is_empty!35479)))

(declare-fun mapNonEmpty!54847 () Bool)

(declare-fun mapRes!54847 () Bool)

(declare-fun tp!104569 () Bool)

(assert (=> mapNonEmpty!54847 (= mapRes!54847 (and tp!104569 e!749821))))

(declare-fun mapKey!54847 () (_ BitVec 32))

(declare-fun mapValue!54847 () ValueCell!16841)

(declare-fun mapRest!54847 () (Array (_ BitVec 32) ValueCell!16841))

(assert (=> mapNonEmpty!54847 (= (arr!42470 _values!1354) (store mapRest!54847 mapKey!54847 mapValue!54847))))

(declare-fun b!1314412 () Bool)

(declare-fun e!749825 () Bool)

(assert (=> b!1314412 (= e!749825 tp_is_empty!35479)))

(declare-fun b!1314413 () Bool)

(declare-fun res!872298 () Bool)

(assert (=> b!1314413 (=> (not res!872298) (not e!749823))))

(declare-datatypes ((List!30144 0))(
  ( (Nil!30141) (Cons!30140 (h!31358 (_ BitVec 64)) (t!43742 List!30144)) )
))
(declare-fun arrayNoDuplicates!0 (array!87987 (_ BitVec 32) List!30144) Bool)

(assert (=> b!1314413 (= res!872298 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30141))))

(declare-fun b!1314410 () Bool)

(assert (=> b!1314410 (= e!749823 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000))))

(declare-fun res!872303 () Bool)

(assert (=> start!111138 (=> (not res!872303) (not e!749823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111138 (= res!872303 (validMask!0 mask!2040))))

(assert (=> start!111138 e!749823))

(assert (=> start!111138 tp!104568))

(declare-fun array_inv!32337 (array!87987) Bool)

(assert (=> start!111138 (array_inv!32337 _keys!1628)))

(assert (=> start!111138 true))

(assert (=> start!111138 tp_is_empty!35479))

(declare-fun e!749822 () Bool)

(declare-fun array_inv!32338 (array!87989) Bool)

(assert (=> start!111138 (and (array_inv!32338 _values!1354) e!749822)))

(declare-fun b!1314414 () Bool)

(assert (=> b!1314414 (= e!749822 (and e!749825 mapRes!54847))))

(declare-fun condMapEmpty!54847 () Bool)

(declare-fun mapDefault!54847 () ValueCell!16841)

(assert (=> b!1314414 (= condMapEmpty!54847 (= (arr!42470 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16841)) mapDefault!54847)))))

(declare-fun mapIsEmpty!54847 () Bool)

(assert (=> mapIsEmpty!54847 mapRes!54847))

(assert (= (and start!111138 res!872303) b!1314407))

(assert (= (and b!1314407 res!872299) b!1314408))

(assert (= (and b!1314408 res!872301) b!1314413))

(assert (= (and b!1314413 res!872298) b!1314405))

(assert (= (and b!1314405 res!872297) b!1314406))

(assert (= (and b!1314406 res!872302) b!1314409))

(assert (= (and b!1314409 res!872300) b!1314404))

(assert (= (and b!1314404 res!872296) b!1314410))

(assert (= (and b!1314414 condMapEmpty!54847) mapIsEmpty!54847))

(assert (= (and b!1314414 (not condMapEmpty!54847)) mapNonEmpty!54847))

(get-info :version)

(assert (= (and mapNonEmpty!54847 ((_ is ValueCellFull!16841) mapValue!54847)) b!1314411))

(assert (= (and b!1314414 ((_ is ValueCellFull!16841) mapDefault!54847)) b!1314412))

(assert (= start!111138 b!1314414))

(declare-fun m!1203665 () Bool)

(assert (=> b!1314406 m!1203665))

(assert (=> b!1314406 m!1203665))

(declare-fun m!1203667 () Bool)

(assert (=> b!1314406 m!1203667))

(declare-fun m!1203669 () Bool)

(assert (=> b!1314413 m!1203669))

(declare-fun m!1203671 () Bool)

(assert (=> start!111138 m!1203671))

(declare-fun m!1203673 () Bool)

(assert (=> start!111138 m!1203673))

(declare-fun m!1203675 () Bool)

(assert (=> start!111138 m!1203675))

(declare-fun m!1203677 () Bool)

(assert (=> mapNonEmpty!54847 m!1203677))

(declare-fun m!1203679 () Bool)

(assert (=> b!1314408 m!1203679))

(declare-fun m!1203681 () Bool)

(assert (=> b!1314404 m!1203681))

(assert (=> b!1314404 m!1203681))

(declare-fun m!1203683 () Bool)

(assert (=> b!1314404 m!1203683))

(assert (=> b!1314409 m!1203681))

(check-sat (not b!1314413) (not b!1314404) (not b!1314406) (not start!111138) (not mapNonEmpty!54847) tp_is_empty!35479 (not b_next!29749) (not b!1314408) b_and!47959)
(check-sat b_and!47959 (not b_next!29749))
