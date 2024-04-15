; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110734 () Bool)

(assert start!110734)

(declare-fun b_free!29569 () Bool)

(declare-fun b_next!29569 () Bool)

(assert (=> start!110734 (= b_free!29569 (not b_next!29569))))

(declare-fun tp!104029 () Bool)

(declare-fun b_and!47759 () Bool)

(assert (=> start!110734 (= tp!104029 b_and!47759)))

(declare-fun b!1310517 () Bool)

(declare-fun res!870046 () Bool)

(declare-fun e!747597 () Bool)

(assert (=> b!1310517 (=> (not res!870046) (not e!747597))))

(declare-datatypes ((array!87501 0))(
  ( (array!87502 (arr!42231 (Array (_ BitVec 32) (_ BitVec 64))) (size!42783 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87501)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310517 (= res!870046 (validKeyInArray!0 (select (arr!42231 _keys!1628) from!2020)))))

(declare-fun b!1310518 () Bool)

(declare-fun e!747596 () Bool)

(declare-fun e!747598 () Bool)

(declare-fun mapRes!54577 () Bool)

(assert (=> b!1310518 (= e!747596 (and e!747598 mapRes!54577))))

(declare-fun condMapEmpty!54577 () Bool)

(declare-datatypes ((V!52169 0))(
  ( (V!52170 (val!17724 Int)) )
))
(declare-datatypes ((ValueCell!16751 0))(
  ( (ValueCellFull!16751 (v!20350 V!52169)) (EmptyCell!16751) )
))
(declare-datatypes ((array!87503 0))(
  ( (array!87504 (arr!42232 (Array (_ BitVec 32) ValueCell!16751)) (size!42784 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87503)

(declare-fun mapDefault!54577 () ValueCell!16751)

(assert (=> b!1310518 (= condMapEmpty!54577 (= (arr!42232 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16751)) mapDefault!54577)))))

(declare-fun b!1310519 () Bool)

(declare-fun e!747595 () Bool)

(declare-fun tp_is_empty!35299 () Bool)

(assert (=> b!1310519 (= e!747595 tp_is_empty!35299)))

(declare-fun mapNonEmpty!54577 () Bool)

(declare-fun tp!104030 () Bool)

(assert (=> mapNonEmpty!54577 (= mapRes!54577 (and tp!104030 e!747595))))

(declare-fun mapRest!54577 () (Array (_ BitVec 32) ValueCell!16751))

(declare-fun mapKey!54577 () (_ BitVec 32))

(declare-fun mapValue!54577 () ValueCell!16751)

(assert (=> mapNonEmpty!54577 (= (arr!42232 _values!1354) (store mapRest!54577 mapKey!54577 mapValue!54577))))

(declare-fun b!1310520 () Bool)

(declare-fun res!870044 () Bool)

(assert (=> b!1310520 (=> (not res!870044) (not e!747597))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310520 (= res!870044 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310521 () Bool)

(declare-fun res!870041 () Bool)

(assert (=> b!1310521 (=> (not res!870041) (not e!747597))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1310521 (= res!870041 (not (= (select (arr!42231 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1310522 () Bool)

(declare-fun res!870045 () Bool)

(assert (=> b!1310522 (=> (not res!870045) (not e!747597))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52169)

(declare-fun zeroValue!1296 () V!52169)

(declare-datatypes ((tuple2!22920 0))(
  ( (tuple2!22921 (_1!11471 (_ BitVec 64)) (_2!11471 V!52169)) )
))
(declare-datatypes ((List!30045 0))(
  ( (Nil!30042) (Cons!30041 (h!31250 tuple2!22920) (t!43643 List!30045)) )
))
(declare-datatypes ((ListLongMap!20577 0))(
  ( (ListLongMap!20578 (toList!10304 List!30045)) )
))
(declare-fun contains!8381 (ListLongMap!20577 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5199 (array!87501 array!87503 (_ BitVec 32) (_ BitVec 32) V!52169 V!52169 (_ BitVec 32) Int) ListLongMap!20577)

(assert (=> b!1310522 (= res!870045 (contains!8381 (getCurrentListMap!5199 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310523 () Bool)

(declare-fun res!870042 () Bool)

(assert (=> b!1310523 (=> (not res!870042) (not e!747597))))

(assert (=> b!1310523 (= res!870042 (and (= (size!42784 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42783 _keys!1628) (size!42784 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310524 () Bool)

(assert (=> b!1310524 (= e!747598 tp_is_empty!35299)))

(declare-fun res!870049 () Bool)

(assert (=> start!110734 (=> (not res!870049) (not e!747597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110734 (= res!870049 (validMask!0 mask!2040))))

(assert (=> start!110734 e!747597))

(assert (=> start!110734 tp!104029))

(declare-fun array_inv!32101 (array!87501) Bool)

(assert (=> start!110734 (array_inv!32101 _keys!1628)))

(assert (=> start!110734 true))

(assert (=> start!110734 tp_is_empty!35299))

(declare-fun array_inv!32102 (array!87503) Bool)

(assert (=> start!110734 (and (array_inv!32102 _values!1354) e!747596)))

(declare-fun b!1310525 () Bool)

(assert (=> b!1310525 (= e!747597 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(assert (=> b!1310525 (contains!8381 (getCurrentListMap!5199 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43179 0))(
  ( (Unit!43180) )
))
(declare-fun lt!585186 () Unit!43179)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!16 (array!87501 array!87503 (_ BitVec 32) (_ BitVec 32) V!52169 V!52169 (_ BitVec 64) (_ BitVec 32) Int) Unit!43179)

(assert (=> b!1310525 (= lt!585186 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!16 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310526 () Bool)

(declare-fun res!870047 () Bool)

(assert (=> b!1310526 (=> (not res!870047) (not e!747597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87501 (_ BitVec 32)) Bool)

(assert (=> b!1310526 (= res!870047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54577 () Bool)

(assert (=> mapIsEmpty!54577 mapRes!54577))

(declare-fun b!1310527 () Bool)

(declare-fun res!870048 () Bool)

(assert (=> b!1310527 (=> (not res!870048) (not e!747597))))

(assert (=> b!1310527 (= res!870048 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42783 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310528 () Bool)

(declare-fun res!870043 () Bool)

(assert (=> b!1310528 (=> (not res!870043) (not e!747597))))

(declare-datatypes ((List!30046 0))(
  ( (Nil!30043) (Cons!30042 (h!31251 (_ BitVec 64)) (t!43644 List!30046)) )
))
(declare-fun arrayNoDuplicates!0 (array!87501 (_ BitVec 32) List!30046) Bool)

(assert (=> b!1310528 (= res!870043 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30043))))

(assert (= (and start!110734 res!870049) b!1310523))

(assert (= (and b!1310523 res!870042) b!1310526))

(assert (= (and b!1310526 res!870047) b!1310528))

(assert (= (and b!1310528 res!870043) b!1310527))

(assert (= (and b!1310527 res!870048) b!1310522))

(assert (= (and b!1310522 res!870045) b!1310521))

(assert (= (and b!1310521 res!870041) b!1310517))

(assert (= (and b!1310517 res!870046) b!1310520))

(assert (= (and b!1310520 res!870044) b!1310525))

(assert (= (and b!1310518 condMapEmpty!54577) mapIsEmpty!54577))

(assert (= (and b!1310518 (not condMapEmpty!54577)) mapNonEmpty!54577))

(get-info :version)

(assert (= (and mapNonEmpty!54577 ((_ is ValueCellFull!16751) mapValue!54577)) b!1310519))

(assert (= (and b!1310518 ((_ is ValueCellFull!16751) mapDefault!54577)) b!1310524))

(assert (= start!110734 b!1310518))

(declare-fun m!1199811 () Bool)

(assert (=> b!1310526 m!1199811))

(declare-fun m!1199813 () Bool)

(assert (=> b!1310517 m!1199813))

(assert (=> b!1310517 m!1199813))

(declare-fun m!1199815 () Bool)

(assert (=> b!1310517 m!1199815))

(declare-fun m!1199817 () Bool)

(assert (=> b!1310522 m!1199817))

(assert (=> b!1310522 m!1199817))

(declare-fun m!1199819 () Bool)

(assert (=> b!1310522 m!1199819))

(declare-fun m!1199821 () Bool)

(assert (=> b!1310525 m!1199821))

(assert (=> b!1310525 m!1199821))

(declare-fun m!1199823 () Bool)

(assert (=> b!1310525 m!1199823))

(declare-fun m!1199825 () Bool)

(assert (=> b!1310525 m!1199825))

(declare-fun m!1199827 () Bool)

(assert (=> b!1310528 m!1199827))

(assert (=> b!1310521 m!1199813))

(declare-fun m!1199829 () Bool)

(assert (=> mapNonEmpty!54577 m!1199829))

(declare-fun m!1199831 () Bool)

(assert (=> start!110734 m!1199831))

(declare-fun m!1199833 () Bool)

(assert (=> start!110734 m!1199833))

(declare-fun m!1199835 () Bool)

(assert (=> start!110734 m!1199835))

(check-sat b_and!47759 (not mapNonEmpty!54577) tp_is_empty!35299 (not b!1310528) (not b!1310517) (not b_next!29569) (not b!1310525) (not b!1310522) (not b!1310526) (not start!110734))
(check-sat b_and!47759 (not b_next!29569))
