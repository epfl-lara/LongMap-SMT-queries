; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109996 () Bool)

(assert start!109996)

(declare-fun b_free!29243 () Bool)

(declare-fun b_next!29243 () Bool)

(assert (=> start!109996 (= b_free!29243 (not b_next!29243))))

(declare-fun tp!102874 () Bool)

(declare-fun b_and!47395 () Bool)

(assert (=> start!109996 (= tp!102874 b_and!47395)))

(declare-fun b!1302781 () Bool)

(declare-fun res!865335 () Bool)

(declare-fun e!743098 () Bool)

(assert (=> b!1302781 (=> (not res!865335) (not e!743098))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51613 0))(
  ( (V!51614 (val!17516 Int)) )
))
(declare-datatypes ((ValueCell!16543 0))(
  ( (ValueCellFull!16543 (v!20130 V!51613)) (EmptyCell!16543) )
))
(declare-datatypes ((array!86778 0))(
  ( (array!86779 (arr!41882 (Array (_ BitVec 32) ValueCell!16543)) (size!42432 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86778)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86780 0))(
  ( (array!86781 (arr!41883 (Array (_ BitVec 32) (_ BitVec 64))) (size!42433 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86780)

(assert (=> b!1302781 (= res!865335 (and (= (size!42432 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42433 _keys!1741) (size!42432 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1302782 () Bool)

(declare-fun res!865339 () Bool)

(assert (=> b!1302782 (=> (not res!865339) (not e!743098))))

(declare-datatypes ((List!29727 0))(
  ( (Nil!29724) (Cons!29723 (h!30932 (_ BitVec 64)) (t!43317 List!29727)) )
))
(declare-fun arrayNoDuplicates!0 (array!86780 (_ BitVec 32) List!29727) Bool)

(assert (=> b!1302782 (= res!865339 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29724))))

(declare-fun mapNonEmpty!53911 () Bool)

(declare-fun mapRes!53911 () Bool)

(declare-fun tp!102873 () Bool)

(declare-fun e!743093 () Bool)

(assert (=> mapNonEmpty!53911 (= mapRes!53911 (and tp!102873 e!743093))))

(declare-fun mapValue!53911 () ValueCell!16543)

(declare-fun mapKey!53911 () (_ BitVec 32))

(declare-fun mapRest!53911 () (Array (_ BitVec 32) ValueCell!16543))

(assert (=> mapNonEmpty!53911 (= (arr!41882 _values!1445) (store mapRest!53911 mapKey!53911 mapValue!53911))))

(declare-fun b!1302783 () Bool)

(declare-fun res!865338 () Bool)

(assert (=> b!1302783 (=> (not res!865338) (not e!743098))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1302783 (= res!865338 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42433 _keys!1741))))))

(declare-fun b!1302784 () Bool)

(declare-fun e!743095 () Bool)

(declare-fun e!743096 () Bool)

(assert (=> b!1302784 (= e!743095 e!743096)))

(declare-fun res!865340 () Bool)

(assert (=> b!1302784 (=> (not res!865340) (not e!743096))))

(declare-datatypes ((tuple2!22600 0))(
  ( (tuple2!22601 (_1!11311 (_ BitVec 64)) (_2!11311 V!51613)) )
))
(declare-datatypes ((List!29728 0))(
  ( (Nil!29725) (Cons!29724 (h!30933 tuple2!22600) (t!43318 List!29728)) )
))
(declare-datatypes ((ListLongMap!20257 0))(
  ( (ListLongMap!20258 (toList!10144 List!29728)) )
))
(declare-fun lt!582833 () ListLongMap!20257)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!8276 (ListLongMap!20257 (_ BitVec 64)) Bool)

(assert (=> b!1302784 (= res!865340 (not (contains!8276 lt!582833 k!1205)))))

(declare-fun zeroValue!1387 () V!51613)

(declare-fun +!4470 (ListLongMap!20257 tuple2!22600) ListLongMap!20257)

(assert (=> b!1302784 (not (contains!8276 (+!4470 lt!582833 (tuple2!22601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-datatypes ((Unit!43131 0))(
  ( (Unit!43132) )
))
(declare-fun lt!582831 () Unit!43131)

(declare-fun addStillNotContains!467 (ListLongMap!20257 (_ BitVec 64) V!51613 (_ BitVec 64)) Unit!43131)

(assert (=> b!1302784 (= lt!582831 (addStillNotContains!467 lt!582833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!51613)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6103 (array!86780 array!86778 (_ BitVec 32) (_ BitVec 32) V!51613 V!51613 (_ BitVec 32) Int) ListLongMap!20257)

(assert (=> b!1302784 (= lt!582833 (getCurrentListMapNoExtraKeys!6103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302785 () Bool)

(assert (=> b!1302785 (= e!743096 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k!1205)))))

(declare-fun b!1302786 () Bool)

(declare-fun e!743094 () Bool)

(declare-fun tp_is_empty!34883 () Bool)

(assert (=> b!1302786 (= e!743094 tp_is_empty!34883)))

(declare-fun b!1302787 () Bool)

(declare-fun res!865341 () Bool)

(assert (=> b!1302787 (=> (not res!865341) (not e!743098))))

(assert (=> b!1302787 (= res!865341 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42433 _keys!1741))))))

(declare-fun b!1302788 () Bool)

(declare-fun res!865336 () Bool)

(assert (=> b!1302788 (=> (not res!865336) (not e!743098))))

(declare-fun getCurrentListMap!5168 (array!86780 array!86778 (_ BitVec 32) (_ BitVec 32) V!51613 V!51613 (_ BitVec 32) Int) ListLongMap!20257)

(assert (=> b!1302788 (= res!865336 (contains!8276 (getCurrentListMap!5168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1302789 () Bool)

(declare-fun res!865333 () Bool)

(assert (=> b!1302789 (=> (not res!865333) (not e!743098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302789 (= res!865333 (not (validKeyInArray!0 (select (arr!41883 _keys!1741) from!2144))))))

(declare-fun b!1302790 () Bool)

(assert (=> b!1302790 (= e!743093 tp_is_empty!34883)))

(declare-fun b!1302791 () Bool)

(declare-fun e!743097 () Bool)

(assert (=> b!1302791 (= e!743097 (and e!743094 mapRes!53911))))

(declare-fun condMapEmpty!53911 () Bool)

(declare-fun mapDefault!53911 () ValueCell!16543)

