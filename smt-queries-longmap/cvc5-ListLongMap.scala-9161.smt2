; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109992 () Bool)

(assert start!109992)

(declare-fun b_free!29239 () Bool)

(declare-fun b_next!29239 () Bool)

(assert (=> start!109992 (= b_free!29239 (not b_next!29239))))

(declare-fun tp!102862 () Bool)

(declare-fun b_and!47391 () Bool)

(assert (=> start!109992 (= tp!102862 b_and!47391)))

(declare-fun b!1302703 () Bool)

(declare-fun res!865279 () Bool)

(declare-fun e!743053 () Bool)

(assert (=> b!1302703 (=> (not res!865279) (not e!743053))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51609 0))(
  ( (V!51610 (val!17514 Int)) )
))
(declare-datatypes ((ValueCell!16541 0))(
  ( (ValueCellFull!16541 (v!20128 V!51609)) (EmptyCell!16541) )
))
(declare-datatypes ((array!86770 0))(
  ( (array!86771 (arr!41878 (Array (_ BitVec 32) ValueCell!16541)) (size!42428 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86770)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86772 0))(
  ( (array!86773 (arr!41879 (Array (_ BitVec 32) (_ BitVec 64))) (size!42429 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86772)

(assert (=> b!1302703 (= res!865279 (and (= (size!42428 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42429 _keys!1741) (size!42428 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1302704 () Bool)

(declare-fun res!865273 () Bool)

(assert (=> b!1302704 (=> (not res!865273) (not e!743053))))

(declare-fun minValue!1387 () V!51609)

(declare-fun zeroValue!1387 () V!51609)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22596 0))(
  ( (tuple2!22597 (_1!11309 (_ BitVec 64)) (_2!11309 V!51609)) )
))
(declare-datatypes ((List!29723 0))(
  ( (Nil!29720) (Cons!29719 (h!30928 tuple2!22596) (t!43313 List!29723)) )
))
(declare-datatypes ((ListLongMap!20253 0))(
  ( (ListLongMap!20254 (toList!10142 List!29723)) )
))
(declare-fun contains!8274 (ListLongMap!20253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5166 (array!86772 array!86770 (_ BitVec 32) (_ BitVec 32) V!51609 V!51609 (_ BitVec 32) Int) ListLongMap!20253)

(assert (=> b!1302704 (= res!865273 (contains!8274 (getCurrentListMap!5166 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1302705 () Bool)

(declare-fun res!865277 () Bool)

(assert (=> b!1302705 (=> (not res!865277) (not e!743053))))

(assert (=> b!1302705 (= res!865277 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42429 _keys!1741))))))

(declare-fun mapIsEmpty!53905 () Bool)

(declare-fun mapRes!53905 () Bool)

(assert (=> mapIsEmpty!53905 mapRes!53905))

(declare-fun res!865280 () Bool)

(assert (=> start!109992 (=> (not res!865280) (not e!743053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109992 (= res!865280 (validMask!0 mask!2175))))

(assert (=> start!109992 e!743053))

(declare-fun tp_is_empty!34879 () Bool)

(assert (=> start!109992 tp_is_empty!34879))

(assert (=> start!109992 true))

(declare-fun e!743056 () Bool)

(declare-fun array_inv!31677 (array!86770) Bool)

(assert (=> start!109992 (and (array_inv!31677 _values!1445) e!743056)))

(declare-fun array_inv!31678 (array!86772) Bool)

(assert (=> start!109992 (array_inv!31678 _keys!1741)))

(assert (=> start!109992 tp!102862))

(declare-fun b!1302706 () Bool)

(declare-fun e!743054 () Bool)

(assert (=> b!1302706 (= e!743054 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k!1205)))))

(declare-fun b!1302707 () Bool)

(declare-fun res!865281 () Bool)

(assert (=> b!1302707 (=> (not res!865281) (not e!743053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86772 (_ BitVec 32)) Bool)

(assert (=> b!1302707 (= res!865281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302708 () Bool)

(declare-fun e!743052 () Bool)

(assert (=> b!1302708 (= e!743052 tp_is_empty!34879)))

(declare-fun b!1302709 () Bool)

(declare-fun res!865275 () Bool)

(assert (=> b!1302709 (=> (not res!865275) (not e!743053))))

(assert (=> b!1302709 (= res!865275 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42429 _keys!1741))))))

(declare-fun b!1302710 () Bool)

(declare-fun e!743057 () Bool)

(assert (=> b!1302710 (= e!743057 e!743054)))

(declare-fun res!865276 () Bool)

(assert (=> b!1302710 (=> (not res!865276) (not e!743054))))

(declare-fun lt!582814 () ListLongMap!20253)

(assert (=> b!1302710 (= res!865276 (not (contains!8274 lt!582814 k!1205)))))

(declare-fun +!4468 (ListLongMap!20253 tuple2!22596) ListLongMap!20253)

(assert (=> b!1302710 (not (contains!8274 (+!4468 lt!582814 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-datatypes ((Unit!43127 0))(
  ( (Unit!43128) )
))
(declare-fun lt!582815 () Unit!43127)

(declare-fun addStillNotContains!465 (ListLongMap!20253 (_ BitVec 64) V!51609 (_ BitVec 64)) Unit!43127)

(assert (=> b!1302710 (= lt!582815 (addStillNotContains!465 lt!582814 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6101 (array!86772 array!86770 (_ BitVec 32) (_ BitVec 32) V!51609 V!51609 (_ BitVec 32) Int) ListLongMap!20253)

(assert (=> b!1302710 (= lt!582814 (getCurrentListMapNoExtraKeys!6101 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302711 () Bool)

(declare-fun res!865278 () Bool)

(assert (=> b!1302711 (=> (not res!865278) (not e!743053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302711 (= res!865278 (not (validKeyInArray!0 (select (arr!41879 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53905 () Bool)

(declare-fun tp!102861 () Bool)

(assert (=> mapNonEmpty!53905 (= mapRes!53905 (and tp!102861 e!743052))))

(declare-fun mapKey!53905 () (_ BitVec 32))

(declare-fun mapValue!53905 () ValueCell!16541)

(declare-fun mapRest!53905 () (Array (_ BitVec 32) ValueCell!16541))

(assert (=> mapNonEmpty!53905 (= (arr!41878 _values!1445) (store mapRest!53905 mapKey!53905 mapValue!53905))))

(declare-fun b!1302712 () Bool)

(declare-fun res!865274 () Bool)

(assert (=> b!1302712 (=> (not res!865274) (not e!743053))))

(declare-datatypes ((List!29724 0))(
  ( (Nil!29721) (Cons!29720 (h!30929 (_ BitVec 64)) (t!43314 List!29724)) )
))
(declare-fun arrayNoDuplicates!0 (array!86772 (_ BitVec 32) List!29724) Bool)

(assert (=> b!1302712 (= res!865274 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29721))))

(declare-fun b!1302713 () Bool)

(declare-fun e!743055 () Bool)

(assert (=> b!1302713 (= e!743055 tp_is_empty!34879)))

(declare-fun b!1302714 () Bool)

(assert (=> b!1302714 (= e!743056 (and e!743055 mapRes!53905))))

(declare-fun condMapEmpty!53905 () Bool)

(declare-fun mapDefault!53905 () ValueCell!16541)

