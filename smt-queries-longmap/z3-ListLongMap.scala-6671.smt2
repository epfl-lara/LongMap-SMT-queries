; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84000 () Bool)

(assert start!84000)

(declare-fun b_free!19755 () Bool)

(declare-fun b_next!19755 () Bool)

(assert (=> start!84000 (= b_free!19755 (not b_next!19755))))

(declare-fun tp!68787 () Bool)

(declare-fun b_and!31593 () Bool)

(assert (=> start!84000 (= tp!68787 b_and!31593)))

(declare-fun mapIsEmpty!36233 () Bool)

(declare-fun mapRes!36233 () Bool)

(assert (=> mapIsEmpty!36233 mapRes!36233))

(declare-fun b!981754 () Bool)

(declare-fun e!553441 () Bool)

(declare-fun tp_is_empty!22803 () Bool)

(assert (=> b!981754 (= e!553441 tp_is_empty!22803)))

(declare-fun b!981755 () Bool)

(declare-fun e!553442 () Bool)

(assert (=> b!981755 (= e!553442 (not true))))

(declare-datatypes ((V!35387 0))(
  ( (V!35388 (val!11452 Int)) )
))
(declare-datatypes ((tuple2!14660 0))(
  ( (tuple2!14661 (_1!7341 (_ BitVec 64)) (_2!7341 V!35387)) )
))
(declare-datatypes ((List!20543 0))(
  ( (Nil!20540) (Cons!20539 (h!21701 tuple2!14660) (t!29248 List!20543)) )
))
(declare-datatypes ((ListLongMap!13357 0))(
  ( (ListLongMap!13358 (toList!6694 List!20543)) )
))
(declare-fun lt!435844 () ListLongMap!13357)

(declare-fun lt!435845 () tuple2!14660)

(declare-fun lt!435842 () tuple2!14660)

(declare-fun +!2994 (ListLongMap!13357 tuple2!14660) ListLongMap!13357)

(assert (=> b!981755 (= (+!2994 (+!2994 lt!435844 lt!435845) lt!435842) (+!2994 (+!2994 lt!435844 lt!435842) lt!435845))))

(declare-fun lt!435843 () V!35387)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61601 0))(
  ( (array!61602 (arr!29658 (Array (_ BitVec 32) (_ BitVec 64))) (size!30137 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61601)

(assert (=> b!981755 (= lt!435842 (tuple2!14661 (select (arr!29658 _keys!1544) from!1932) lt!435843))))

(declare-fun zeroValue!1220 () V!35387)

(assert (=> b!981755 (= lt!435845 (tuple2!14661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32627 0))(
  ( (Unit!32628) )
))
(declare-fun lt!435841 () Unit!32627)

(declare-fun addCommutativeForDiffKeys!622 (ListLongMap!13357 (_ BitVec 64) V!35387 (_ BitVec 64) V!35387) Unit!32627)

(assert (=> b!981755 (= lt!435841 (addCommutativeForDiffKeys!622 lt!435844 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29658 _keys!1544) from!1932) lt!435843))))

(declare-fun b!981756 () Bool)

(declare-fun e!553446 () Bool)

(assert (=> b!981756 (= e!553446 e!553442)))

(declare-fun res!656978 () Bool)

(assert (=> b!981756 (=> (not res!656978) (not e!553442))))

(assert (=> b!981756 (= res!656978 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29658 _keys!1544) from!1932))))))

(declare-datatypes ((ValueCell!10920 0))(
  ( (ValueCellFull!10920 (v!14014 V!35387)) (EmptyCell!10920) )
))
(declare-datatypes ((array!61603 0))(
  ( (array!61604 (arr!29659 (Array (_ BitVec 32) ValueCell!10920)) (size!30138 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61603)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15372 (ValueCell!10920 V!35387) V!35387)

(declare-fun dynLambda!1777 (Int (_ BitVec 64)) V!35387)

(assert (=> b!981756 (= lt!435843 (get!15372 (select (arr!29659 _values!1278) from!1932) (dynLambda!1777 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35387)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3394 (array!61601 array!61603 (_ BitVec 32) (_ BitVec 32) V!35387 V!35387 (_ BitVec 32) Int) ListLongMap!13357)

(assert (=> b!981756 (= lt!435844 (getCurrentListMapNoExtraKeys!3394 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981757 () Bool)

(declare-fun res!656974 () Bool)

(assert (=> b!981757 (=> (not res!656974) (not e!553446))))

(assert (=> b!981757 (= res!656974 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!656975 () Bool)

(assert (=> start!84000 (=> (not res!656975) (not e!553446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84000 (= res!656975 (validMask!0 mask!1948))))

(assert (=> start!84000 e!553446))

(assert (=> start!84000 true))

(assert (=> start!84000 tp_is_empty!22803))

(declare-fun e!553444 () Bool)

(declare-fun array_inv!22933 (array!61603) Bool)

(assert (=> start!84000 (and (array_inv!22933 _values!1278) e!553444)))

(assert (=> start!84000 tp!68787))

(declare-fun array_inv!22934 (array!61601) Bool)

(assert (=> start!84000 (array_inv!22934 _keys!1544)))

(declare-fun b!981758 () Bool)

(assert (=> b!981758 (= e!553444 (and e!553441 mapRes!36233))))

(declare-fun condMapEmpty!36233 () Bool)

(declare-fun mapDefault!36233 () ValueCell!10920)

(assert (=> b!981758 (= condMapEmpty!36233 (= (arr!29659 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10920)) mapDefault!36233)))))

(declare-fun b!981759 () Bool)

(declare-fun res!656976 () Bool)

(assert (=> b!981759 (=> (not res!656976) (not e!553446))))

(declare-datatypes ((List!20544 0))(
  ( (Nil!20541) (Cons!20540 (h!21702 (_ BitVec 64)) (t!29249 List!20544)) )
))
(declare-fun arrayNoDuplicates!0 (array!61601 (_ BitVec 32) List!20544) Bool)

(assert (=> b!981759 (= res!656976 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20541))))

(declare-fun b!981760 () Bool)

(declare-fun e!553443 () Bool)

(assert (=> b!981760 (= e!553443 tp_is_empty!22803)))

(declare-fun mapNonEmpty!36233 () Bool)

(declare-fun tp!68788 () Bool)

(assert (=> mapNonEmpty!36233 (= mapRes!36233 (and tp!68788 e!553443))))

(declare-fun mapKey!36233 () (_ BitVec 32))

(declare-fun mapValue!36233 () ValueCell!10920)

(declare-fun mapRest!36233 () (Array (_ BitVec 32) ValueCell!10920))

(assert (=> mapNonEmpty!36233 (= (arr!29659 _values!1278) (store mapRest!36233 mapKey!36233 mapValue!36233))))

(declare-fun b!981761 () Bool)

(declare-fun res!656977 () Bool)

(assert (=> b!981761 (=> (not res!656977) (not e!553446))))

(assert (=> b!981761 (= res!656977 (and (= (size!30138 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30137 _keys!1544) (size!30138 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981762 () Bool)

(declare-fun res!656973 () Bool)

(assert (=> b!981762 (=> (not res!656973) (not e!553446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61601 (_ BitVec 32)) Bool)

(assert (=> b!981762 (= res!656973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981763 () Bool)

(declare-fun res!656971 () Bool)

(assert (=> b!981763 (=> (not res!656971) (not e!553446))))

(assert (=> b!981763 (= res!656971 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30137 _keys!1544))))))

(declare-fun b!981764 () Bool)

(declare-fun res!656972 () Bool)

(assert (=> b!981764 (=> (not res!656972) (not e!553446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981764 (= res!656972 (validKeyInArray!0 (select (arr!29658 _keys!1544) from!1932)))))

(assert (= (and start!84000 res!656975) b!981761))

(assert (= (and b!981761 res!656977) b!981762))

(assert (= (and b!981762 res!656973) b!981759))

(assert (= (and b!981759 res!656976) b!981763))

(assert (= (and b!981763 res!656971) b!981764))

(assert (= (and b!981764 res!656972) b!981757))

(assert (= (and b!981757 res!656974) b!981756))

(assert (= (and b!981756 res!656978) b!981755))

(assert (= (and b!981758 condMapEmpty!36233) mapIsEmpty!36233))

(assert (= (and b!981758 (not condMapEmpty!36233)) mapNonEmpty!36233))

(get-info :version)

(assert (= (and mapNonEmpty!36233 ((_ is ValueCellFull!10920) mapValue!36233)) b!981760))

(assert (= (and b!981758 ((_ is ValueCellFull!10920) mapDefault!36233)) b!981754))

(assert (= start!84000 b!981758))

(declare-fun b_lambda!14793 () Bool)

(assert (=> (not b_lambda!14793) (not b!981756)))

(declare-fun t!29247 () Bool)

(declare-fun tb!6555 () Bool)

(assert (=> (and start!84000 (= defaultEntry!1281 defaultEntry!1281) t!29247) tb!6555))

(declare-fun result!13099 () Bool)

(assert (=> tb!6555 (= result!13099 tp_is_empty!22803)))

(assert (=> b!981756 t!29247))

(declare-fun b_and!31595 () Bool)

(assert (= b_and!31593 (and (=> t!29247 result!13099) b_and!31595)))

(declare-fun m!909113 () Bool)

(assert (=> b!981755 m!909113))

(declare-fun m!909115 () Bool)

(assert (=> b!981755 m!909115))

(declare-fun m!909117 () Bool)

(assert (=> b!981755 m!909117))

(assert (=> b!981755 m!909113))

(declare-fun m!909119 () Bool)

(assert (=> b!981755 m!909119))

(assert (=> b!981755 m!909115))

(declare-fun m!909121 () Bool)

(assert (=> b!981755 m!909121))

(assert (=> b!981755 m!909117))

(declare-fun m!909123 () Bool)

(assert (=> b!981755 m!909123))

(declare-fun m!909125 () Bool)

(assert (=> b!981759 m!909125))

(declare-fun m!909127 () Bool)

(assert (=> mapNonEmpty!36233 m!909127))

(declare-fun m!909129 () Bool)

(assert (=> b!981762 m!909129))

(declare-fun m!909131 () Bool)

(assert (=> start!84000 m!909131))

(declare-fun m!909133 () Bool)

(assert (=> start!84000 m!909133))

(declare-fun m!909135 () Bool)

(assert (=> start!84000 m!909135))

(assert (=> b!981756 m!909113))

(declare-fun m!909137 () Bool)

(assert (=> b!981756 m!909137))

(declare-fun m!909139 () Bool)

(assert (=> b!981756 m!909139))

(declare-fun m!909141 () Bool)

(assert (=> b!981756 m!909141))

(assert (=> b!981756 m!909137))

(assert (=> b!981756 m!909141))

(declare-fun m!909143 () Bool)

(assert (=> b!981756 m!909143))

(assert (=> b!981764 m!909113))

(assert (=> b!981764 m!909113))

(declare-fun m!909145 () Bool)

(assert (=> b!981764 m!909145))

(check-sat (not start!84000) (not b_lambda!14793) (not b!981756) b_and!31595 tp_is_empty!22803 (not b!981762) (not mapNonEmpty!36233) (not b_next!19755) (not b!981759) (not b!981755) (not b!981764))
(check-sat b_and!31595 (not b_next!19755))
