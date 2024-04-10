; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109804 () Bool)

(assert start!109804)

(declare-fun b_free!29197 () Bool)

(declare-fun b_next!29197 () Bool)

(assert (=> start!109804 (= b_free!29197 (not b_next!29197))))

(declare-fun tp!102724 () Bool)

(declare-fun b_and!47311 () Bool)

(assert (=> start!109804 (= tp!102724 b_and!47311)))

(declare-fun b!1300755 () Bool)

(declare-fun res!864347 () Bool)

(declare-fun e!741963 () Bool)

(assert (=> b!1300755 (=> (not res!864347) (not e!741963))))

(declare-datatypes ((V!51553 0))(
  ( (V!51554 (val!17493 Int)) )
))
(declare-fun minValue!1387 () V!51553)

(declare-fun zeroValue!1387 () V!51553)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16520 0))(
  ( (ValueCellFull!16520 (v!20101 V!51553)) (EmptyCell!16520) )
))
(declare-datatypes ((array!86686 0))(
  ( (array!86687 (arr!41839 (Array (_ BitVec 32) ValueCell!16520)) (size!42389 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86686)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86688 0))(
  ( (array!86689 (arr!41840 (Array (_ BitVec 32) (_ BitVec 64))) (size!42390 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86688)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22564 0))(
  ( (tuple2!22565 (_1!11293 (_ BitVec 64)) (_2!11293 V!51553)) )
))
(declare-datatypes ((List!29696 0))(
  ( (Nil!29693) (Cons!29692 (h!30901 tuple2!22564) (t!43270 List!29696)) )
))
(declare-datatypes ((ListLongMap!20221 0))(
  ( (ListLongMap!20222 (toList!10126 List!29696)) )
))
(declare-fun contains!8252 (ListLongMap!20221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5152 (array!86688 array!86686 (_ BitVec 32) (_ BitVec 32) V!51553 V!51553 (_ BitVec 32) Int) ListLongMap!20221)

(assert (=> b!1300755 (= res!864347 (contains!8252 (getCurrentListMap!5152 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun bm!63724 () Bool)

(declare-fun call!63729 () ListLongMap!20221)

(declare-fun getCurrentListMapNoExtraKeys!6085 (array!86688 array!86686 (_ BitVec 32) (_ BitVec 32) V!51553 V!51553 (_ BitVec 32) Int) ListLongMap!20221)

(assert (=> bm!63724 (= call!63729 (getCurrentListMapNoExtraKeys!6085 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1300756 () Bool)

(declare-datatypes ((Unit!43047 0))(
  ( (Unit!43048) )
))
(declare-fun e!741964 () Unit!43047)

(declare-fun e!741967 () Unit!43047)

(assert (=> b!1300756 (= e!741964 e!741967)))

(declare-fun c!124632 () Bool)

(declare-fun lt!581525 () Bool)

(assert (=> b!1300756 (= c!124632 (and (not lt!581525) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63725 () Bool)

(declare-fun call!63727 () ListLongMap!20221)

(assert (=> bm!63725 (= call!63727 call!63729)))

(declare-fun b!1300757 () Bool)

(declare-fun e!741961 () Bool)

(declare-fun e!741968 () Bool)

(declare-fun mapRes!53831 () Bool)

(assert (=> b!1300757 (= e!741961 (and e!741968 mapRes!53831))))

(declare-fun condMapEmpty!53831 () Bool)

(declare-fun mapDefault!53831 () ValueCell!16520)

