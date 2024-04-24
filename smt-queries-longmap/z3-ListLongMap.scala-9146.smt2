; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109940 () Bool)

(assert start!109940)

(declare-fun b_free!29149 () Bool)

(declare-fun b_next!29149 () Bool)

(assert (=> start!109940 (= b_free!29149 (not b_next!29149))))

(declare-fun tp!102575 () Bool)

(declare-fun b_and!47253 () Bool)

(assert (=> start!109940 (= tp!102575 b_and!47253)))

(declare-fun b!1300833 () Bool)

(declare-fun e!742222 () Bool)

(declare-fun tp_is_empty!34789 () Bool)

(assert (=> b!1300833 (= e!742222 tp_is_empty!34789)))

(declare-fun b!1300834 () Bool)

(declare-fun res!864101 () Bool)

(declare-fun e!742221 () Bool)

(assert (=> b!1300834 (=> (not res!864101) (not e!742221))))

(declare-datatypes ((array!86627 0))(
  ( (array!86628 (arr!41807 (Array (_ BitVec 32) (_ BitVec 64))) (size!42358 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86627)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86627 (_ BitVec 32)) Bool)

(assert (=> b!1300834 (= res!864101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300835 () Bool)

(declare-fun res!864099 () Bool)

(assert (=> b!1300835 (=> (not res!864099) (not e!742221))))

(declare-datatypes ((V!51489 0))(
  ( (V!51490 (val!17469 Int)) )
))
(declare-fun minValue!1387 () V!51489)

(declare-fun zeroValue!1387 () V!51489)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16496 0))(
  ( (ValueCellFull!16496 (v!20070 V!51489)) (EmptyCell!16496) )
))
(declare-datatypes ((array!86629 0))(
  ( (array!86630 (arr!41808 (Array (_ BitVec 32) ValueCell!16496)) (size!42359 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86629)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22540 0))(
  ( (tuple2!22541 (_1!11281 (_ BitVec 64)) (_2!11281 V!51489)) )
))
(declare-datatypes ((List!29699 0))(
  ( (Nil!29696) (Cons!29695 (h!30913 tuple2!22540) (t!43261 List!29699)) )
))
(declare-datatypes ((ListLongMap!20205 0))(
  ( (ListLongMap!20206 (toList!10118 List!29699)) )
))
(declare-fun contains!8252 (ListLongMap!20205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5137 (array!86627 array!86629 (_ BitVec 32) (_ BitVec 32) V!51489 V!51489 (_ BitVec 32) Int) ListLongMap!20205)

(assert (=> b!1300835 (= res!864099 (contains!8252 (getCurrentListMap!5137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300836 () Bool)

(assert (=> b!1300836 (= e!742221 false)))

(declare-fun lt!581578 () Bool)

(declare-fun +!4491 (ListLongMap!20205 tuple2!22540) ListLongMap!20205)

(declare-fun getCurrentListMapNoExtraKeys!6131 (array!86627 array!86629 (_ BitVec 32) (_ BitVec 32) V!51489 V!51489 (_ BitVec 32) Int) ListLongMap!20205)

(assert (=> b!1300836 (= lt!581578 (contains!8252 (+!4491 (+!4491 (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22541 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1300837 () Bool)

(declare-fun e!742219 () Bool)

(declare-fun mapRes!53753 () Bool)

(assert (=> b!1300837 (= e!742219 (and e!742222 mapRes!53753))))

(declare-fun condMapEmpty!53753 () Bool)

(declare-fun mapDefault!53753 () ValueCell!16496)

(assert (=> b!1300837 (= condMapEmpty!53753 (= (arr!41808 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16496)) mapDefault!53753)))))

(declare-fun b!1300838 () Bool)

(declare-fun res!864098 () Bool)

(assert (=> b!1300838 (=> (not res!864098) (not e!742221))))

(assert (=> b!1300838 (= res!864098 (and (= (size!42359 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42358 _keys!1741) (size!42359 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300839 () Bool)

(declare-fun res!864097 () Bool)

(assert (=> b!1300839 (=> (not res!864097) (not e!742221))))

(declare-datatypes ((List!29700 0))(
  ( (Nil!29697) (Cons!29696 (h!30914 (_ BitVec 64)) (t!43262 List!29700)) )
))
(declare-fun arrayNoDuplicates!0 (array!86627 (_ BitVec 32) List!29700) Bool)

(assert (=> b!1300839 (= res!864097 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29697))))

(declare-fun res!864103 () Bool)

(assert (=> start!109940 (=> (not res!864103) (not e!742221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109940 (= res!864103 (validMask!0 mask!2175))))

(assert (=> start!109940 e!742221))

(assert (=> start!109940 tp_is_empty!34789))

(assert (=> start!109940 true))

(declare-fun array_inv!31875 (array!86629) Bool)

(assert (=> start!109940 (and (array_inv!31875 _values!1445) e!742219)))

(declare-fun array_inv!31876 (array!86627) Bool)

(assert (=> start!109940 (array_inv!31876 _keys!1741)))

(assert (=> start!109940 tp!102575))

(declare-fun b!1300840 () Bool)

(declare-fun res!864095 () Bool)

(assert (=> b!1300840 (=> (not res!864095) (not e!742221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300840 (= res!864095 (validKeyInArray!0 (select (arr!41807 _keys!1741) from!2144)))))

(declare-fun b!1300841 () Bool)

(declare-fun res!864102 () Bool)

(assert (=> b!1300841 (=> (not res!864102) (not e!742221))))

(assert (=> b!1300841 (= res!864102 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1300842 () Bool)

(declare-fun res!864100 () Bool)

(assert (=> b!1300842 (=> (not res!864100) (not e!742221))))

(assert (=> b!1300842 (= res!864100 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42358 _keys!1741))))))

(declare-fun b!1300843 () Bool)

(declare-fun e!742223 () Bool)

(assert (=> b!1300843 (= e!742223 tp_is_empty!34789)))

(declare-fun mapIsEmpty!53753 () Bool)

(assert (=> mapIsEmpty!53753 mapRes!53753))

(declare-fun b!1300844 () Bool)

(declare-fun res!864096 () Bool)

(assert (=> b!1300844 (=> (not res!864096) (not e!742221))))

(assert (=> b!1300844 (= res!864096 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42358 _keys!1741))))))

(declare-fun mapNonEmpty!53753 () Bool)

(declare-fun tp!102574 () Bool)

(assert (=> mapNonEmpty!53753 (= mapRes!53753 (and tp!102574 e!742223))))

(declare-fun mapValue!53753 () ValueCell!16496)

(declare-fun mapRest!53753 () (Array (_ BitVec 32) ValueCell!16496))

(declare-fun mapKey!53753 () (_ BitVec 32))

(assert (=> mapNonEmpty!53753 (= (arr!41808 _values!1445) (store mapRest!53753 mapKey!53753 mapValue!53753))))

(assert (= (and start!109940 res!864103) b!1300838))

(assert (= (and b!1300838 res!864098) b!1300834))

(assert (= (and b!1300834 res!864101) b!1300839))

(assert (= (and b!1300839 res!864097) b!1300842))

(assert (= (and b!1300842 res!864100) b!1300835))

(assert (= (and b!1300835 res!864099) b!1300844))

(assert (= (and b!1300844 res!864096) b!1300840))

(assert (= (and b!1300840 res!864095) b!1300841))

(assert (= (and b!1300841 res!864102) b!1300836))

(assert (= (and b!1300837 condMapEmpty!53753) mapIsEmpty!53753))

(assert (= (and b!1300837 (not condMapEmpty!53753)) mapNonEmpty!53753))

(get-info :version)

(assert (= (and mapNonEmpty!53753 ((_ is ValueCellFull!16496) mapValue!53753)) b!1300843))

(assert (= (and b!1300837 ((_ is ValueCellFull!16496) mapDefault!53753)) b!1300833))

(assert (= start!109940 b!1300837))

(declare-fun m!1192299 () Bool)

(assert (=> mapNonEmpty!53753 m!1192299))

(declare-fun m!1192301 () Bool)

(assert (=> b!1300835 m!1192301))

(assert (=> b!1300835 m!1192301))

(declare-fun m!1192303 () Bool)

(assert (=> b!1300835 m!1192303))

(declare-fun m!1192305 () Bool)

(assert (=> b!1300840 m!1192305))

(assert (=> b!1300840 m!1192305))

(declare-fun m!1192307 () Bool)

(assert (=> b!1300840 m!1192307))

(declare-fun m!1192309 () Bool)

(assert (=> b!1300839 m!1192309))

(declare-fun m!1192311 () Bool)

(assert (=> start!109940 m!1192311))

(declare-fun m!1192313 () Bool)

(assert (=> start!109940 m!1192313))

(declare-fun m!1192315 () Bool)

(assert (=> start!109940 m!1192315))

(declare-fun m!1192317 () Bool)

(assert (=> b!1300834 m!1192317))

(declare-fun m!1192319 () Bool)

(assert (=> b!1300836 m!1192319))

(assert (=> b!1300836 m!1192319))

(declare-fun m!1192321 () Bool)

(assert (=> b!1300836 m!1192321))

(assert (=> b!1300836 m!1192321))

(declare-fun m!1192323 () Bool)

(assert (=> b!1300836 m!1192323))

(assert (=> b!1300836 m!1192323))

(declare-fun m!1192325 () Bool)

(assert (=> b!1300836 m!1192325))

(check-sat (not b_next!29149) (not b!1300840) (not mapNonEmpty!53753) tp_is_empty!34789 (not b!1300836) (not b!1300839) (not b!1300834) (not start!109940) (not b!1300835) b_and!47253)
(check-sat b_and!47253 (not b_next!29149))
