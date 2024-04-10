; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72410 () Bool)

(assert start!72410)

(declare-fun b_free!13595 () Bool)

(declare-fun b_next!13595 () Bool)

(assert (=> start!72410 (= b_free!13595 (not b_next!13595))))

(declare-fun tp!47883 () Bool)

(declare-fun b_and!22681 () Bool)

(assert (=> start!72410 (= tp!47883 b_and!22681)))

(declare-fun b!839414 () Bool)

(declare-fun res!570730 () Bool)

(declare-fun e!468472 () Bool)

(assert (=> b!839414 (=> (not res!570730) (not e!468472))))

(declare-datatypes ((array!47204 0))(
  ( (array!47205 (arr!22633 (Array (_ BitVec 32) (_ BitVec 64))) (size!23073 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47204)

(declare-datatypes ((List!16095 0))(
  ( (Nil!16092) (Cons!16091 (h!17222 (_ BitVec 64)) (t!22466 List!16095)) )
))
(declare-fun arrayNoDuplicates!0 (array!47204 (_ BitVec 32) List!16095) Bool)

(assert (=> b!839414 (= res!570730 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16092))))

(declare-fun b!839415 () Bool)

(declare-fun res!570731 () Bool)

(assert (=> b!839415 (=> (not res!570731) (not e!468472))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839415 (= res!570731 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!24791 () Bool)

(declare-fun mapRes!24791 () Bool)

(assert (=> mapIsEmpty!24791 mapRes!24791))

(declare-fun b!839416 () Bool)

(declare-fun e!468471 () Bool)

(declare-fun tp_is_empty!15461 () Bool)

(assert (=> b!839416 (= e!468471 tp_is_empty!15461)))

(declare-fun bm!37015 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!25661 0))(
  ( (V!25662 (val!7778 Int)) )
))
(declare-datatypes ((tuple2!10296 0))(
  ( (tuple2!10297 (_1!5159 (_ BitVec 64)) (_2!5159 V!25661)) )
))
(declare-datatypes ((List!16096 0))(
  ( (Nil!16093) (Cons!16092 (h!17223 tuple2!10296) (t!22467 List!16096)) )
))
(declare-datatypes ((ListLongMap!9065 0))(
  ( (ListLongMap!9066 (toList!4548 List!16096)) )
))
(declare-fun call!37019 () ListLongMap!9065)

(declare-datatypes ((ValueCell!7291 0))(
  ( (ValueCellFull!7291 (v!10203 V!25661)) (EmptyCell!7291) )
))
(declare-datatypes ((array!47206 0))(
  ( (array!47207 (arr!22634 (Array (_ BitVec 32) ValueCell!7291)) (size!23074 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47206)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25661)

(declare-fun zeroValue!654 () V!25661)

(declare-fun getCurrentListMapNoExtraKeys!2538 (array!47204 array!47206 (_ BitVec 32) (_ BitVec 32) V!25661 V!25661 (_ BitVec 32) Int) ListLongMap!9065)

(assert (=> bm!37015 (= call!37019 (getCurrentListMapNoExtraKeys!2538 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839418 () Bool)

(declare-fun e!468470 () Bool)

(assert (=> b!839418 (= e!468470 tp_is_empty!15461)))

(declare-fun b!839419 () Bool)

(declare-fun res!570736 () Bool)

(assert (=> b!839419 (=> (not res!570736) (not e!468472))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839419 (= res!570736 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23073 _keys!868))))))

(declare-fun v!557 () V!25661)

(declare-fun b!839420 () Bool)

(declare-fun call!37018 () ListLongMap!9065)

(declare-fun e!468469 () Bool)

(declare-fun +!2020 (ListLongMap!9065 tuple2!10296) ListLongMap!9065)

(assert (=> b!839420 (= e!468469 (= call!37018 (+!2020 call!37019 (tuple2!10297 k!854 v!557))))))

(declare-fun b!839421 () Bool)

(declare-fun res!570735 () Bool)

(assert (=> b!839421 (=> (not res!570735) (not e!468472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839421 (= res!570735 (validMask!0 mask!1196))))

(declare-fun b!839422 () Bool)

(declare-fun e!468467 () Bool)

(assert (=> b!839422 (= e!468467 (and e!468470 mapRes!24791))))

(declare-fun condMapEmpty!24791 () Bool)

(declare-fun mapDefault!24791 () ValueCell!7291)

