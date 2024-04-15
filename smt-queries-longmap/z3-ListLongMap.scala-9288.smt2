; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111076 () Bool)

(assert start!111076)

(declare-fun b_free!29911 () Bool)

(declare-fun b_next!29911 () Bool)

(assert (=> start!111076 (= b_free!29911 (not b_next!29911))))

(declare-fun tp!105056 () Bool)

(declare-fun b_and!48101 () Bool)

(assert (=> start!111076 (= tp!105056 b_and!48101)))

(declare-fun b!1315036 () Bool)

(declare-fun e!750161 () Bool)

(declare-fun tp_is_empty!35641 () Bool)

(assert (=> b!1315036 (= e!750161 tp_is_empty!35641)))

(declare-fun b!1315037 () Bool)

(declare-fun res!873023 () Bool)

(declare-fun e!750163 () Bool)

(assert (=> b!1315037 (=> (not res!873023) (not e!750163))))

(declare-datatypes ((array!88155 0))(
  ( (array!88156 (arr!42558 (Array (_ BitVec 32) (_ BitVec 64))) (size!43110 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88155)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88155 (_ BitVec 32)) Bool)

(assert (=> b!1315037 (= res!873023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315038 () Bool)

(declare-fun res!873024 () Bool)

(assert (=> b!1315038 (=> (not res!873024) (not e!750163))))

(declare-datatypes ((V!52625 0))(
  ( (V!52626 (val!17895 Int)) )
))
(declare-datatypes ((ValueCell!16922 0))(
  ( (ValueCellFull!16922 (v!20521 V!52625)) (EmptyCell!16922) )
))
(declare-datatypes ((array!88157 0))(
  ( (array!88158 (arr!42559 (Array (_ BitVec 32) ValueCell!16922)) (size!43111 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88157)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315038 (= res!873024 (and (= (size!43111 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43110 _keys!1628) (size!43111 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315039 () Bool)

(assert (=> b!1315039 (= e!750163 false)))

(declare-fun lt!585690 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52625)

(declare-fun zeroValue!1296 () V!52625)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23168 0))(
  ( (tuple2!23169 (_1!11595 (_ BitVec 64)) (_2!11595 V!52625)) )
))
(declare-datatypes ((List!30283 0))(
  ( (Nil!30280) (Cons!30279 (h!31488 tuple2!23168) (t!43881 List!30283)) )
))
(declare-datatypes ((ListLongMap!20825 0))(
  ( (ListLongMap!20826 (toList!10428 List!30283)) )
))
(declare-fun contains!8505 (ListLongMap!20825 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5323 (array!88155 array!88157 (_ BitVec 32) (_ BitVec 32) V!52625 V!52625 (_ BitVec 32) Int) ListLongMap!20825)

(assert (=> b!1315039 (= lt!585690 (contains!8505 (getCurrentListMap!5323 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315040 () Bool)

(declare-fun res!873022 () Bool)

(assert (=> b!1315040 (=> (not res!873022) (not e!750163))))

(assert (=> b!1315040 (= res!873022 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43110 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315041 () Bool)

(declare-fun e!750162 () Bool)

(declare-fun e!750164 () Bool)

(declare-fun mapRes!55090 () Bool)

(assert (=> b!1315041 (= e!750162 (and e!750164 mapRes!55090))))

(declare-fun condMapEmpty!55090 () Bool)

(declare-fun mapDefault!55090 () ValueCell!16922)

(assert (=> b!1315041 (= condMapEmpty!55090 (= (arr!42559 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16922)) mapDefault!55090)))))

(declare-fun b!1315042 () Bool)

(declare-fun res!873021 () Bool)

(assert (=> b!1315042 (=> (not res!873021) (not e!750163))))

(declare-datatypes ((List!30284 0))(
  ( (Nil!30281) (Cons!30280 (h!31489 (_ BitVec 64)) (t!43882 List!30284)) )
))
(declare-fun arrayNoDuplicates!0 (array!88155 (_ BitVec 32) List!30284) Bool)

(assert (=> b!1315042 (= res!873021 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30281))))

(declare-fun b!1315043 () Bool)

(assert (=> b!1315043 (= e!750164 tp_is_empty!35641)))

(declare-fun mapIsEmpty!55090 () Bool)

(assert (=> mapIsEmpty!55090 mapRes!55090))

(declare-fun res!873025 () Bool)

(assert (=> start!111076 (=> (not res!873025) (not e!750163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111076 (= res!873025 (validMask!0 mask!2040))))

(assert (=> start!111076 e!750163))

(assert (=> start!111076 tp!105056))

(declare-fun array_inv!32329 (array!88155) Bool)

(assert (=> start!111076 (array_inv!32329 _keys!1628)))

(assert (=> start!111076 true))

(assert (=> start!111076 tp_is_empty!35641))

(declare-fun array_inv!32330 (array!88157) Bool)

(assert (=> start!111076 (and (array_inv!32330 _values!1354) e!750162)))

(declare-fun mapNonEmpty!55090 () Bool)

(declare-fun tp!105055 () Bool)

(assert (=> mapNonEmpty!55090 (= mapRes!55090 (and tp!105055 e!750161))))

(declare-fun mapValue!55090 () ValueCell!16922)

(declare-fun mapRest!55090 () (Array (_ BitVec 32) ValueCell!16922))

(declare-fun mapKey!55090 () (_ BitVec 32))

(assert (=> mapNonEmpty!55090 (= (arr!42559 _values!1354) (store mapRest!55090 mapKey!55090 mapValue!55090))))

(assert (= (and start!111076 res!873025) b!1315038))

(assert (= (and b!1315038 res!873024) b!1315037))

(assert (= (and b!1315037 res!873023) b!1315042))

(assert (= (and b!1315042 res!873021) b!1315040))

(assert (= (and b!1315040 res!873022) b!1315039))

(assert (= (and b!1315041 condMapEmpty!55090) mapIsEmpty!55090))

(assert (= (and b!1315041 (not condMapEmpty!55090)) mapNonEmpty!55090))

(get-info :version)

(assert (= (and mapNonEmpty!55090 ((_ is ValueCellFull!16922) mapValue!55090)) b!1315036))

(assert (= (and b!1315041 ((_ is ValueCellFull!16922) mapDefault!55090)) b!1315043))

(assert (= start!111076 b!1315041))

(declare-fun m!1202889 () Bool)

(assert (=> b!1315042 m!1202889))

(declare-fun m!1202891 () Bool)

(assert (=> mapNonEmpty!55090 m!1202891))

(declare-fun m!1202893 () Bool)

(assert (=> b!1315039 m!1202893))

(assert (=> b!1315039 m!1202893))

(declare-fun m!1202895 () Bool)

(assert (=> b!1315039 m!1202895))

(declare-fun m!1202897 () Bool)

(assert (=> b!1315037 m!1202897))

(declare-fun m!1202899 () Bool)

(assert (=> start!111076 m!1202899))

(declare-fun m!1202901 () Bool)

(assert (=> start!111076 m!1202901))

(declare-fun m!1202903 () Bool)

(assert (=> start!111076 m!1202903))

(check-sat (not b!1315037) (not start!111076) (not b!1315039) (not b!1315042) b_and!48101 (not mapNonEmpty!55090) tp_is_empty!35641 (not b_next!29911))
(check-sat b_and!48101 (not b_next!29911))
