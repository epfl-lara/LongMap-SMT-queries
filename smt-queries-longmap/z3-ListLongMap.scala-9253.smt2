; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111090 () Bool)

(assert start!111090)

(declare-fun b_free!29701 () Bool)

(declare-fun b_next!29701 () Bool)

(assert (=> start!111090 (= b_free!29701 (not b_next!29701))))

(declare-fun tp!104425 () Bool)

(declare-fun b_and!47911 () Bool)

(assert (=> start!111090 (= tp!104425 b_and!47911)))

(declare-fun b!1313822 () Bool)

(declare-fun res!871931 () Bool)

(declare-fun e!749461 () Bool)

(assert (=> b!1313822 (=> (not res!871931) (not e!749461))))

(declare-datatypes ((array!87899 0))(
  ( (array!87900 (arr!42425 (Array (_ BitVec 32) (_ BitVec 64))) (size!42976 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87899)

(declare-datatypes ((List!30114 0))(
  ( (Nil!30111) (Cons!30110 (h!31328 (_ BitVec 64)) (t!43712 List!30114)) )
))
(declare-fun arrayNoDuplicates!0 (array!87899 (_ BitVec 32) List!30114) Bool)

(assert (=> b!1313822 (= res!871931 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30111))))

(declare-fun b!1313824 () Bool)

(declare-fun e!749462 () Bool)

(declare-fun e!749464 () Bool)

(declare-fun mapRes!54775 () Bool)

(assert (=> b!1313824 (= e!749462 (and e!749464 mapRes!54775))))

(declare-fun condMapEmpty!54775 () Bool)

(declare-datatypes ((V!52345 0))(
  ( (V!52346 (val!17790 Int)) )
))
(declare-datatypes ((ValueCell!16817 0))(
  ( (ValueCellFull!16817 (v!20412 V!52345)) (EmptyCell!16817) )
))
(declare-datatypes ((array!87901 0))(
  ( (array!87902 (arr!42426 (Array (_ BitVec 32) ValueCell!16817)) (size!42977 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87901)

(declare-fun mapDefault!54775 () ValueCell!16817)

(assert (=> b!1313824 (= condMapEmpty!54775 (= (arr!42426 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16817)) mapDefault!54775)))))

(declare-fun b!1313825 () Bool)

(declare-fun res!871930 () Bool)

(assert (=> b!1313825 (=> (not res!871930) (not e!749461))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313825 (= res!871930 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42976 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313826 () Bool)

(declare-fun res!871934 () Bool)

(assert (=> b!1313826 (=> (not res!871934) (not e!749461))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87899 (_ BitVec 32)) Bool)

(assert (=> b!1313826 (= res!871934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313827 () Bool)

(declare-fun e!749463 () Bool)

(declare-fun tp_is_empty!35431 () Bool)

(assert (=> b!1313827 (= e!749463 tp_is_empty!35431)))

(declare-fun b!1313828 () Bool)

(declare-fun res!871933 () Bool)

(assert (=> b!1313828 (=> (not res!871933) (not e!749461))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313828 (= res!871933 (and (= (size!42977 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42976 _keys!1628) (size!42977 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54775 () Bool)

(assert (=> mapIsEmpty!54775 mapRes!54775))

(declare-fun res!871932 () Bool)

(assert (=> start!111090 (=> (not res!871932) (not e!749461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111090 (= res!871932 (validMask!0 mask!2040))))

(assert (=> start!111090 e!749461))

(assert (=> start!111090 tp!104425))

(declare-fun array_inv!32311 (array!87899) Bool)

(assert (=> start!111090 (array_inv!32311 _keys!1628)))

(assert (=> start!111090 true))

(assert (=> start!111090 tp_is_empty!35431))

(declare-fun array_inv!32312 (array!87901) Bool)

(assert (=> start!111090 (and (array_inv!32312 _values!1354) e!749462)))

(declare-fun b!1313823 () Bool)

(assert (=> b!1313823 (= e!749461 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586046 () Bool)

(declare-fun minValue!1296 () V!52345)

(declare-fun zeroValue!1296 () V!52345)

(declare-datatypes ((tuple2!22964 0))(
  ( (tuple2!22965 (_1!11493 (_ BitVec 64)) (_2!11493 V!52345)) )
))
(declare-datatypes ((List!30115 0))(
  ( (Nil!30112) (Cons!30111 (h!31329 tuple2!22964) (t!43713 List!30115)) )
))
(declare-datatypes ((ListLongMap!20629 0))(
  ( (ListLongMap!20630 (toList!10330 List!30115)) )
))
(declare-fun contains!8492 (ListLongMap!20629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5334 (array!87899 array!87901 (_ BitVec 32) (_ BitVec 32) V!52345 V!52345 (_ BitVec 32) Int) ListLongMap!20629)

(assert (=> b!1313823 (= lt!586046 (contains!8492 (getCurrentListMap!5334 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54775 () Bool)

(declare-fun tp!104424 () Bool)

(assert (=> mapNonEmpty!54775 (= mapRes!54775 (and tp!104424 e!749463))))

(declare-fun mapValue!54775 () ValueCell!16817)

(declare-fun mapKey!54775 () (_ BitVec 32))

(declare-fun mapRest!54775 () (Array (_ BitVec 32) ValueCell!16817))

(assert (=> mapNonEmpty!54775 (= (arr!42426 _values!1354) (store mapRest!54775 mapKey!54775 mapValue!54775))))

(declare-fun b!1313829 () Bool)

(assert (=> b!1313829 (= e!749464 tp_is_empty!35431)))

(assert (= (and start!111090 res!871932) b!1313828))

(assert (= (and b!1313828 res!871933) b!1313826))

(assert (= (and b!1313826 res!871934) b!1313822))

(assert (= (and b!1313822 res!871931) b!1313825))

(assert (= (and b!1313825 res!871930) b!1313823))

(assert (= (and b!1313824 condMapEmpty!54775) mapIsEmpty!54775))

(assert (= (and b!1313824 (not condMapEmpty!54775)) mapNonEmpty!54775))

(get-info :version)

(assert (= (and mapNonEmpty!54775 ((_ is ValueCellFull!16817) mapValue!54775)) b!1313827))

(assert (= (and b!1313824 ((_ is ValueCellFull!16817) mapDefault!54775)) b!1313829))

(assert (= start!111090 b!1313824))

(declare-fun m!1203281 () Bool)

(assert (=> start!111090 m!1203281))

(declare-fun m!1203283 () Bool)

(assert (=> start!111090 m!1203283))

(declare-fun m!1203285 () Bool)

(assert (=> start!111090 m!1203285))

(declare-fun m!1203287 () Bool)

(assert (=> b!1313822 m!1203287))

(declare-fun m!1203289 () Bool)

(assert (=> b!1313823 m!1203289))

(assert (=> b!1313823 m!1203289))

(declare-fun m!1203291 () Bool)

(assert (=> b!1313823 m!1203291))

(declare-fun m!1203293 () Bool)

(assert (=> mapNonEmpty!54775 m!1203293))

(declare-fun m!1203295 () Bool)

(assert (=> b!1313826 m!1203295))

(check-sat b_and!47911 (not b!1313822) (not mapNonEmpty!54775) (not b_next!29701) (not start!111090) tp_is_empty!35431 (not b!1313823) (not b!1313826))
(check-sat b_and!47911 (not b_next!29701))
