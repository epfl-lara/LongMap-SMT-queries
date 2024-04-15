; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110908 () Bool)

(assert start!110908)

(declare-fun b_free!29743 () Bool)

(declare-fun b_next!29743 () Bool)

(assert (=> start!110908 (= b_free!29743 (not b_next!29743))))

(declare-fun tp!104551 () Bool)

(declare-fun b_and!47933 () Bool)

(assert (=> start!110908 (= tp!104551 b_and!47933)))

(declare-fun b!1312957 () Bool)

(declare-fun res!871701 () Bool)

(declare-fun e!748903 () Bool)

(assert (=> b!1312957 (=> (not res!871701) (not e!748903))))

(declare-datatypes ((array!87829 0))(
  ( (array!87830 (arr!42395 (Array (_ BitVec 32) (_ BitVec 64))) (size!42947 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87829)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52401 0))(
  ( (V!52402 (val!17811 Int)) )
))
(declare-datatypes ((ValueCell!16838 0))(
  ( (ValueCellFull!16838 (v!20437 V!52401)) (EmptyCell!16838) )
))
(declare-datatypes ((array!87831 0))(
  ( (array!87832 (arr!42396 (Array (_ BitVec 32) ValueCell!16838)) (size!42948 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87831)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312957 (= res!871701 (and (= (size!42948 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42947 _keys!1628) (size!42948 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312958 () Bool)

(declare-fun res!871700 () Bool)

(assert (=> b!1312958 (=> (not res!871700) (not e!748903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87829 (_ BitVec 32)) Bool)

(assert (=> b!1312958 (= res!871700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54838 () Bool)

(declare-fun mapRes!54838 () Bool)

(assert (=> mapIsEmpty!54838 mapRes!54838))

(declare-fun res!871699 () Bool)

(assert (=> start!110908 (=> (not res!871699) (not e!748903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110908 (= res!871699 (validMask!0 mask!2040))))

(assert (=> start!110908 e!748903))

(assert (=> start!110908 tp!104551))

(declare-fun array_inv!32219 (array!87829) Bool)

(assert (=> start!110908 (array_inv!32219 _keys!1628)))

(assert (=> start!110908 true))

(declare-fun tp_is_empty!35473 () Bool)

(assert (=> start!110908 tp_is_empty!35473))

(declare-fun e!748901 () Bool)

(declare-fun array_inv!32220 (array!87831) Bool)

(assert (=> start!110908 (and (array_inv!32220 _values!1354) e!748901)))

(declare-fun b!1312959 () Bool)

(declare-fun e!748904 () Bool)

(assert (=> b!1312959 (= e!748901 (and e!748904 mapRes!54838))))

(declare-fun condMapEmpty!54838 () Bool)

(declare-fun mapDefault!54838 () ValueCell!16838)

(assert (=> b!1312959 (= condMapEmpty!54838 (= (arr!42396 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16838)) mapDefault!54838)))))

(declare-fun b!1312960 () Bool)

(declare-fun e!748900 () Bool)

(assert (=> b!1312960 (= e!748900 tp_is_empty!35473)))

(declare-fun b!1312961 () Bool)

(declare-fun res!871702 () Bool)

(assert (=> b!1312961 (=> (not res!871702) (not e!748903))))

(declare-datatypes ((List!30168 0))(
  ( (Nil!30165) (Cons!30164 (h!31373 (_ BitVec 64)) (t!43766 List!30168)) )
))
(declare-fun arrayNoDuplicates!0 (array!87829 (_ BitVec 32) List!30168) Bool)

(assert (=> b!1312961 (= res!871702 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30165))))

(declare-fun b!1312962 () Bool)

(assert (=> b!1312962 (= e!748903 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52401)

(declare-fun zeroValue!1296 () V!52401)

(declare-fun lt!585447 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23050 0))(
  ( (tuple2!23051 (_1!11536 (_ BitVec 64)) (_2!11536 V!52401)) )
))
(declare-datatypes ((List!30169 0))(
  ( (Nil!30166) (Cons!30165 (h!31374 tuple2!23050) (t!43767 List!30169)) )
))
(declare-datatypes ((ListLongMap!20707 0))(
  ( (ListLongMap!20708 (toList!10369 List!30169)) )
))
(declare-fun contains!8446 (ListLongMap!20707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5264 (array!87829 array!87831 (_ BitVec 32) (_ BitVec 32) V!52401 V!52401 (_ BitVec 32) Int) ListLongMap!20707)

(assert (=> b!1312962 (= lt!585447 (contains!8446 (getCurrentListMap!5264 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312963 () Bool)

(declare-fun res!871698 () Bool)

(assert (=> b!1312963 (=> (not res!871698) (not e!748903))))

(assert (=> b!1312963 (= res!871698 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42947 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312964 () Bool)

(assert (=> b!1312964 (= e!748904 tp_is_empty!35473)))

(declare-fun mapNonEmpty!54838 () Bool)

(declare-fun tp!104552 () Bool)

(assert (=> mapNonEmpty!54838 (= mapRes!54838 (and tp!104552 e!748900))))

(declare-fun mapValue!54838 () ValueCell!16838)

(declare-fun mapRest!54838 () (Array (_ BitVec 32) ValueCell!16838))

(declare-fun mapKey!54838 () (_ BitVec 32))

(assert (=> mapNonEmpty!54838 (= (arr!42396 _values!1354) (store mapRest!54838 mapKey!54838 mapValue!54838))))

(assert (= (and start!110908 res!871699) b!1312957))

(assert (= (and b!1312957 res!871701) b!1312958))

(assert (= (and b!1312958 res!871700) b!1312961))

(assert (= (and b!1312961 res!871702) b!1312963))

(assert (= (and b!1312963 res!871698) b!1312962))

(assert (= (and b!1312959 condMapEmpty!54838) mapIsEmpty!54838))

(assert (= (and b!1312959 (not condMapEmpty!54838)) mapNonEmpty!54838))

(get-info :version)

(assert (= (and mapNonEmpty!54838 ((_ is ValueCellFull!16838) mapValue!54838)) b!1312960))

(assert (= (and b!1312959 ((_ is ValueCellFull!16838) mapDefault!54838)) b!1312964))

(assert (= start!110908 b!1312959))

(declare-fun m!1201503 () Bool)

(assert (=> start!110908 m!1201503))

(declare-fun m!1201505 () Bool)

(assert (=> start!110908 m!1201505))

(declare-fun m!1201507 () Bool)

(assert (=> start!110908 m!1201507))

(declare-fun m!1201509 () Bool)

(assert (=> b!1312961 m!1201509))

(declare-fun m!1201511 () Bool)

(assert (=> b!1312958 m!1201511))

(declare-fun m!1201513 () Bool)

(assert (=> b!1312962 m!1201513))

(assert (=> b!1312962 m!1201513))

(declare-fun m!1201515 () Bool)

(assert (=> b!1312962 m!1201515))

(declare-fun m!1201517 () Bool)

(assert (=> mapNonEmpty!54838 m!1201517))

(check-sat tp_is_empty!35473 (not b!1312961) (not b!1312962) (not b!1312958) (not mapNonEmpty!54838) b_and!47933 (not start!110908) (not b_next!29743))
(check-sat b_and!47933 (not b_next!29743))
