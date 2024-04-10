; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132028 () Bool)

(assert start!132028)

(declare-fun b_free!31741 () Bool)

(declare-fun b_next!31741 () Bool)

(assert (=> start!132028 (= b_free!31741 (not b_next!31741))))

(declare-fun tp!111474 () Bool)

(declare-fun b_and!51151 () Bool)

(assert (=> start!132028 (= tp!111474 b_and!51151)))

(declare-fun b!1547225 () Bool)

(declare-datatypes ((V!59133 0))(
  ( (V!59134 (val!19086 Int)) )
))
(declare-datatypes ((tuple2!24552 0))(
  ( (tuple2!24553 (_1!12287 (_ BitVec 64)) (_2!12287 V!59133)) )
))
(declare-datatypes ((List!36052 0))(
  ( (Nil!36049) (Cons!36048 (h!37493 tuple2!24552) (t!50746 List!36052)) )
))
(declare-datatypes ((ListLongMap!22161 0))(
  ( (ListLongMap!22162 (toList!11096 List!36052)) )
))
(declare-fun e!861232 () ListLongMap!22161)

(declare-fun call!69787 () ListLongMap!22161)

(assert (=> b!1547225 (= e!861232 call!69787)))

(declare-fun bm!69782 () Bool)

(declare-fun call!69788 () ListLongMap!22161)

(assert (=> bm!69782 (= call!69787 call!69788)))

(declare-fun b!1547226 () Bool)

(declare-fun e!861231 () Bool)

(assert (=> b!1547226 (= e!861231 (not true))))

(declare-datatypes ((array!103234 0))(
  ( (array!103235 (arr!49819 (Array (_ BitVec 32) (_ BitVec 64))) (size!50369 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103234)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!666812 () ListLongMap!22161)

(declare-fun minValue!436 () V!59133)

(declare-fun apply!1049 (ListLongMap!22161 (_ BitVec 64)) V!59133)

(declare-fun +!4927 (ListLongMap!22161 tuple2!24552) ListLongMap!22161)

(assert (=> b!1547226 (= (apply!1049 (+!4927 lt!666812 (tuple2!24553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49819 _keys!618) from!762)) (apply!1049 lt!666812 (select (arr!49819 _keys!618) from!762)))))

(declare-datatypes ((Unit!51548 0))(
  ( (Unit!51549) )
))
(declare-fun lt!666809 () Unit!51548)

(declare-fun addApplyDifferent!591 (ListLongMap!22161 (_ BitVec 64) V!59133 (_ BitVec 64)) Unit!51548)

(assert (=> b!1547226 (= lt!666809 (addApplyDifferent!591 lt!666812 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49819 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59133)

(declare-fun contains!10056 (ListLongMap!22161 (_ BitVec 64)) Bool)

(assert (=> b!1547226 (contains!10056 (+!4927 lt!666812 (tuple2!24553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49819 _keys!618) from!762))))

(declare-fun lt!666810 () Unit!51548)

(declare-fun addStillContains!1244 (ListLongMap!22161 (_ BitVec 64) V!59133 (_ BitVec 64)) Unit!51548)

(assert (=> b!1547226 (= lt!666810 (addStillContains!1244 lt!666812 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49819 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-datatypes ((ValueCell!18098 0))(
  ( (ValueCellFull!18098 (v!21887 V!59133)) (EmptyCell!18098) )
))
(declare-datatypes ((array!103236 0))(
  ( (array!103237 (arr!49820 (Array (_ BitVec 32) ValueCell!18098)) (size!50370 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103236)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6556 (array!103234 array!103236 (_ BitVec 32) (_ BitVec 32) V!59133 V!59133 (_ BitVec 32) Int) ListLongMap!22161)

(assert (=> b!1547226 (= lt!666812 (getCurrentListMapNoExtraKeys!6556 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547227 () Bool)

(declare-fun e!861234 () ListLongMap!22161)

(declare-fun call!69789 () ListLongMap!22161)

(assert (=> b!1547227 (= e!861234 call!69789)))

(declare-fun c!141963 () Bool)

(declare-fun call!69785 () ListLongMap!22161)

(declare-fun c!141965 () Bool)

(declare-fun call!69786 () ListLongMap!22161)

(declare-fun bm!69783 () Bool)

(assert (=> bm!69783 (= call!69788 (+!4927 (ite c!141963 call!69785 (ite c!141965 call!69786 call!69789)) (ite (or c!141963 c!141965) (tuple2!24553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547228 () Bool)

(declare-fun c!141964 () Bool)

(declare-fun lt!666808 () Bool)

(assert (=> b!1547228 (= c!141964 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666808))))

(assert (=> b!1547228 (= e!861232 e!861234)))

(declare-fun b!1547229 () Bool)

(declare-fun res!1060591 () Bool)

(declare-fun e!861233 () Bool)

(assert (=> b!1547229 (=> (not res!1060591) (not e!861233))))

(declare-datatypes ((List!36053 0))(
  ( (Nil!36050) (Cons!36049 (h!37494 (_ BitVec 64)) (t!50747 List!36053)) )
))
(declare-fun arrayNoDuplicates!0 (array!103234 (_ BitVec 32) List!36053) Bool)

(assert (=> b!1547229 (= res!1060591 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36050))))

(declare-fun b!1547230 () Bool)

(assert (=> b!1547230 (= e!861233 e!861231)))

(declare-fun res!1060588 () Bool)

(assert (=> b!1547230 (=> (not res!1060588) (not e!861231))))

(assert (=> b!1547230 (= res!1060588 (bvslt from!762 (size!50369 _keys!618)))))

(declare-fun lt!666811 () ListLongMap!22161)

(declare-fun e!861227 () ListLongMap!22161)

(assert (=> b!1547230 (= lt!666811 e!861227)))

(assert (=> b!1547230 (= c!141963 (and (not lt!666808) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547230 (= lt!666808 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547231 () Bool)

(declare-fun e!861226 () Bool)

(declare-fun e!861230 () Bool)

(declare-fun mapRes!58729 () Bool)

(assert (=> b!1547231 (= e!861226 (and e!861230 mapRes!58729))))

(declare-fun condMapEmpty!58729 () Bool)

(declare-fun mapDefault!58729 () ValueCell!18098)

