; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111114 () Bool)

(assert start!111114)

(declare-fun b_free!29725 () Bool)

(declare-fun b_next!29725 () Bool)

(assert (=> start!111114 (= b_free!29725 (not b_next!29725))))

(declare-fun tp!104497 () Bool)

(declare-fun b_and!47935 () Bool)

(assert (=> start!111114 (= tp!104497 b_and!47935)))

(declare-fun mapNonEmpty!54811 () Bool)

(declare-fun mapRes!54811 () Bool)

(declare-fun tp!104496 () Bool)

(declare-fun e!749644 () Bool)

(assert (=> mapNonEmpty!54811 (= mapRes!54811 (and tp!104496 e!749644))))

(declare-datatypes ((V!52377 0))(
  ( (V!52378 (val!17802 Int)) )
))
(declare-datatypes ((ValueCell!16829 0))(
  ( (ValueCellFull!16829 (v!20424 V!52377)) (EmptyCell!16829) )
))
(declare-fun mapValue!54811 () ValueCell!16829)

(declare-datatypes ((array!87945 0))(
  ( (array!87946 (arr!42448 (Array (_ BitVec 32) ValueCell!16829)) (size!42999 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87945)

(declare-fun mapRest!54811 () (Array (_ BitVec 32) ValueCell!16829))

(declare-fun mapKey!54811 () (_ BitVec 32))

(assert (=> mapNonEmpty!54811 (= (arr!42448 _values!1354) (store mapRest!54811 mapKey!54811 mapValue!54811))))

(declare-fun b!1314110 () Bool)

(declare-fun res!872110 () Bool)

(declare-fun e!749643 () Bool)

(assert (=> b!1314110 (=> (not res!872110) (not e!749643))))

(declare-datatypes ((array!87947 0))(
  ( (array!87948 (arr!42449 (Array (_ BitVec 32) (_ BitVec 64))) (size!43000 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87947)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314110 (= res!872110 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43000 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314111 () Bool)

(declare-fun res!872114 () Bool)

(assert (=> b!1314111 (=> (not res!872114) (not e!749643))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314111 (= res!872114 (and (= (size!42999 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43000 _keys!1628) (size!42999 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314112 () Bool)

(declare-fun tp_is_empty!35455 () Bool)

(assert (=> b!1314112 (= e!749644 tp_is_empty!35455)))

(declare-fun res!872111 () Bool)

(assert (=> start!111114 (=> (not res!872111) (not e!749643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111114 (= res!872111 (validMask!0 mask!2040))))

(assert (=> start!111114 e!749643))

(assert (=> start!111114 tp!104497))

(declare-fun array_inv!32325 (array!87947) Bool)

(assert (=> start!111114 (array_inv!32325 _keys!1628)))

(assert (=> start!111114 true))

(assert (=> start!111114 tp_is_empty!35455))

(declare-fun e!749645 () Bool)

(declare-fun array_inv!32326 (array!87945) Bool)

(assert (=> start!111114 (and (array_inv!32326 _values!1354) e!749645)))

(declare-fun b!1314113 () Bool)

(declare-fun res!872112 () Bool)

(assert (=> b!1314113 (=> (not res!872112) (not e!749643))))

(declare-datatypes ((List!30130 0))(
  ( (Nil!30127) (Cons!30126 (h!31344 (_ BitVec 64)) (t!43728 List!30130)) )
))
(declare-fun arrayNoDuplicates!0 (array!87947 (_ BitVec 32) List!30130) Bool)

(assert (=> b!1314113 (= res!872112 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30127))))

(declare-fun b!1314114 () Bool)

(declare-fun e!749641 () Bool)

(assert (=> b!1314114 (= e!749645 (and e!749641 mapRes!54811))))

(declare-fun condMapEmpty!54811 () Bool)

(declare-fun mapDefault!54811 () ValueCell!16829)

(assert (=> b!1314114 (= condMapEmpty!54811 (= (arr!42448 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16829)) mapDefault!54811)))))

(declare-fun mapIsEmpty!54811 () Bool)

(assert (=> mapIsEmpty!54811 mapRes!54811))

(declare-fun b!1314115 () Bool)

(declare-fun res!872113 () Bool)

(assert (=> b!1314115 (=> (not res!872113) (not e!749643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87947 (_ BitVec 32)) Bool)

(assert (=> b!1314115 (= res!872113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314116 () Bool)

(assert (=> b!1314116 (= e!749643 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586082 () Bool)

(declare-fun minValue!1296 () V!52377)

(declare-fun zeroValue!1296 () V!52377)

(declare-datatypes ((tuple2!22978 0))(
  ( (tuple2!22979 (_1!11500 (_ BitVec 64)) (_2!11500 V!52377)) )
))
(declare-datatypes ((List!30131 0))(
  ( (Nil!30128) (Cons!30127 (h!31345 tuple2!22978) (t!43729 List!30131)) )
))
(declare-datatypes ((ListLongMap!20643 0))(
  ( (ListLongMap!20644 (toList!10337 List!30131)) )
))
(declare-fun contains!8499 (ListLongMap!20643 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5341 (array!87947 array!87945 (_ BitVec 32) (_ BitVec 32) V!52377 V!52377 (_ BitVec 32) Int) ListLongMap!20643)

(assert (=> b!1314116 (= lt!586082 (contains!8499 (getCurrentListMap!5341 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314117 () Bool)

(assert (=> b!1314117 (= e!749641 tp_is_empty!35455)))

(assert (= (and start!111114 res!872111) b!1314111))

(assert (= (and b!1314111 res!872114) b!1314115))

(assert (= (and b!1314115 res!872113) b!1314113))

(assert (= (and b!1314113 res!872112) b!1314110))

(assert (= (and b!1314110 res!872110) b!1314116))

(assert (= (and b!1314114 condMapEmpty!54811) mapIsEmpty!54811))

(assert (= (and b!1314114 (not condMapEmpty!54811)) mapNonEmpty!54811))

(get-info :version)

(assert (= (and mapNonEmpty!54811 ((_ is ValueCellFull!16829) mapValue!54811)) b!1314112))

(assert (= (and b!1314114 ((_ is ValueCellFull!16829) mapDefault!54811)) b!1314117))

(assert (= start!111114 b!1314114))

(declare-fun m!1203473 () Bool)

(assert (=> b!1314116 m!1203473))

(assert (=> b!1314116 m!1203473))

(declare-fun m!1203475 () Bool)

(assert (=> b!1314116 m!1203475))

(declare-fun m!1203477 () Bool)

(assert (=> mapNonEmpty!54811 m!1203477))

(declare-fun m!1203479 () Bool)

(assert (=> b!1314115 m!1203479))

(declare-fun m!1203481 () Bool)

(assert (=> b!1314113 m!1203481))

(declare-fun m!1203483 () Bool)

(assert (=> start!111114 m!1203483))

(declare-fun m!1203485 () Bool)

(assert (=> start!111114 m!1203485))

(declare-fun m!1203487 () Bool)

(assert (=> start!111114 m!1203487))

(check-sat (not b!1314115) tp_is_empty!35455 (not b_next!29725) b_and!47935 (not start!111114) (not b!1314116) (not mapNonEmpty!54811) (not b!1314113))
(check-sat b_and!47935 (not b_next!29725))
