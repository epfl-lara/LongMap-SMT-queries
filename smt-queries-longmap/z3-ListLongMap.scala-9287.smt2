; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111072 () Bool)

(assert start!111072)

(declare-fun b_free!29907 () Bool)

(declare-fun b_next!29907 () Bool)

(assert (=> start!111072 (= b_free!29907 (not b_next!29907))))

(declare-fun tp!105043 () Bool)

(declare-fun b_and!48115 () Bool)

(assert (=> start!111072 (= tp!105043 b_and!48115)))

(declare-fun b!1315058 () Bool)

(declare-fun e!750163 () Bool)

(assert (=> b!1315058 (= e!750163 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88238 0))(
  ( (array!88239 (arr!42599 (Array (_ BitVec 32) (_ BitVec 64))) (size!43149 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88238)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun lt!585870 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52619 0))(
  ( (V!52620 (val!17893 Int)) )
))
(declare-fun minValue!1296 () V!52619)

(declare-datatypes ((ValueCell!16920 0))(
  ( (ValueCellFull!16920 (v!20520 V!52619)) (EmptyCell!16920) )
))
(declare-datatypes ((array!88240 0))(
  ( (array!88241 (arr!42600 (Array (_ BitVec 32) ValueCell!16920)) (size!43150 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88240)

(declare-fun zeroValue!1296 () V!52619)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23078 0))(
  ( (tuple2!23079 (_1!11550 (_ BitVec 64)) (_2!11550 V!52619)) )
))
(declare-datatypes ((List!30214 0))(
  ( (Nil!30211) (Cons!30210 (h!31419 tuple2!23078) (t!43820 List!30214)) )
))
(declare-datatypes ((ListLongMap!20735 0))(
  ( (ListLongMap!20736 (toList!10383 List!30214)) )
))
(declare-fun contains!8533 (ListLongMap!20735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5396 (array!88238 array!88240 (_ BitVec 32) (_ BitVec 32) V!52619 V!52619 (_ BitVec 32) Int) ListLongMap!20735)

(assert (=> b!1315058 (= lt!585870 (contains!8533 (getCurrentListMap!5396 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315059 () Bool)

(declare-fun e!750167 () Bool)

(declare-fun tp_is_empty!35637 () Bool)

(assert (=> b!1315059 (= e!750167 tp_is_empty!35637)))

(declare-fun b!1315060 () Bool)

(declare-fun res!873020 () Bool)

(assert (=> b!1315060 (=> (not res!873020) (not e!750163))))

(declare-datatypes ((List!30215 0))(
  ( (Nil!30212) (Cons!30211 (h!31420 (_ BitVec 64)) (t!43821 List!30215)) )
))
(declare-fun arrayNoDuplicates!0 (array!88238 (_ BitVec 32) List!30215) Bool)

(assert (=> b!1315060 (= res!873020 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30212))))

(declare-fun b!1315062 () Bool)

(declare-fun res!873023 () Bool)

(assert (=> b!1315062 (=> (not res!873023) (not e!750163))))

(assert (=> b!1315062 (= res!873023 (and (= (size!43150 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43149 _keys!1628) (size!43150 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315063 () Bool)

(declare-fun res!873022 () Bool)

(assert (=> b!1315063 (=> (not res!873022) (not e!750163))))

(assert (=> b!1315063 (= res!873022 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43149 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315064 () Bool)

(declare-fun e!750165 () Bool)

(declare-fun e!750164 () Bool)

(declare-fun mapRes!55084 () Bool)

(assert (=> b!1315064 (= e!750165 (and e!750164 mapRes!55084))))

(declare-fun condMapEmpty!55084 () Bool)

(declare-fun mapDefault!55084 () ValueCell!16920)

(assert (=> b!1315064 (= condMapEmpty!55084 (= (arr!42600 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16920)) mapDefault!55084)))))

(declare-fun mapIsEmpty!55084 () Bool)

(assert (=> mapIsEmpty!55084 mapRes!55084))

(declare-fun b!1315061 () Bool)

(assert (=> b!1315061 (= e!750164 tp_is_empty!35637)))

(declare-fun res!873024 () Bool)

(assert (=> start!111072 (=> (not res!873024) (not e!750163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111072 (= res!873024 (validMask!0 mask!2040))))

(assert (=> start!111072 e!750163))

(assert (=> start!111072 tp!105043))

(declare-fun array_inv!32173 (array!88238) Bool)

(assert (=> start!111072 (array_inv!32173 _keys!1628)))

(assert (=> start!111072 true))

(assert (=> start!111072 tp_is_empty!35637))

(declare-fun array_inv!32174 (array!88240) Bool)

(assert (=> start!111072 (and (array_inv!32174 _values!1354) e!750165)))

(declare-fun b!1315065 () Bool)

(declare-fun res!873021 () Bool)

(assert (=> b!1315065 (=> (not res!873021) (not e!750163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88238 (_ BitVec 32)) Bool)

(assert (=> b!1315065 (= res!873021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!55084 () Bool)

(declare-fun tp!105042 () Bool)

(assert (=> mapNonEmpty!55084 (= mapRes!55084 (and tp!105042 e!750167))))

(declare-fun mapKey!55084 () (_ BitVec 32))

(declare-fun mapRest!55084 () (Array (_ BitVec 32) ValueCell!16920))

(declare-fun mapValue!55084 () ValueCell!16920)

(assert (=> mapNonEmpty!55084 (= (arr!42600 _values!1354) (store mapRest!55084 mapKey!55084 mapValue!55084))))

(assert (= (and start!111072 res!873024) b!1315062))

(assert (= (and b!1315062 res!873023) b!1315065))

(assert (= (and b!1315065 res!873021) b!1315060))

(assert (= (and b!1315060 res!873020) b!1315063))

(assert (= (and b!1315063 res!873022) b!1315058))

(assert (= (and b!1315064 condMapEmpty!55084) mapIsEmpty!55084))

(assert (= (and b!1315064 (not condMapEmpty!55084)) mapNonEmpty!55084))

(get-info :version)

(assert (= (and mapNonEmpty!55084 ((_ is ValueCellFull!16920) mapValue!55084)) b!1315059))

(assert (= (and b!1315064 ((_ is ValueCellFull!16920) mapDefault!55084)) b!1315061))

(assert (= start!111072 b!1315064))

(declare-fun m!1203373 () Bool)

(assert (=> b!1315058 m!1203373))

(assert (=> b!1315058 m!1203373))

(declare-fun m!1203375 () Bool)

(assert (=> b!1315058 m!1203375))

(declare-fun m!1203377 () Bool)

(assert (=> start!111072 m!1203377))

(declare-fun m!1203379 () Bool)

(assert (=> start!111072 m!1203379))

(declare-fun m!1203381 () Bool)

(assert (=> start!111072 m!1203381))

(declare-fun m!1203383 () Bool)

(assert (=> b!1315065 m!1203383))

(declare-fun m!1203385 () Bool)

(assert (=> b!1315060 m!1203385))

(declare-fun m!1203387 () Bool)

(assert (=> mapNonEmpty!55084 m!1203387))

(check-sat (not b!1315058) b_and!48115 tp_is_empty!35637 (not b_next!29907) (not b!1315065) (not mapNonEmpty!55084) (not b!1315060) (not start!111072))
(check-sat b_and!48115 (not b_next!29907))
