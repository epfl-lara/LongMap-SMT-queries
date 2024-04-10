; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72524 () Bool)

(assert start!72524)

(declare-fun b_free!13709 () Bool)

(declare-fun b_next!13709 () Bool)

(assert (=> start!72524 (= b_free!13709 (not b_next!13709))))

(declare-fun tp!48225 () Bool)

(declare-fun b_and!22795 () Bool)

(assert (=> start!72524 (= tp!48225 b_and!22795)))

(declare-fun b!841637 () Bool)

(declare-fun res!572101 () Bool)

(declare-fun e!469495 () Bool)

(assert (=> b!841637 (=> (not res!572101) (not e!469495))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47426 0))(
  ( (array!47427 (arr!22744 (Array (_ BitVec 32) (_ BitVec 64))) (size!23184 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47426)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!841637 (= res!572101 (and (= (select (arr!22744 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23184 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841638 () Bool)

(declare-fun res!572098 () Bool)

(assert (=> b!841638 (=> (not res!572098) (not e!469495))))

(assert (=> b!841638 (= res!572098 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23184 _keys!868))))))

(declare-fun bm!37357 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!25813 0))(
  ( (V!25814 (val!7835 Int)) )
))
(declare-datatypes ((tuple2!10400 0))(
  ( (tuple2!10401 (_1!5211 (_ BitVec 64)) (_2!5211 V!25813)) )
))
(declare-datatypes ((List!16179 0))(
  ( (Nil!16176) (Cons!16175 (h!17306 tuple2!10400) (t!22550 List!16179)) )
))
(declare-datatypes ((ListLongMap!9169 0))(
  ( (ListLongMap!9170 (toList!4600 List!16179)) )
))
(declare-fun call!37361 () ListLongMap!9169)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7348 0))(
  ( (ValueCellFull!7348 (v!10260 V!25813)) (EmptyCell!7348) )
))
(declare-datatypes ((array!47428 0))(
  ( (array!47429 (arr!22745 (Array (_ BitVec 32) ValueCell!7348)) (size!23185 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47428)

(declare-fun minValue!654 () V!25813)

(declare-fun zeroValue!654 () V!25813)

(declare-fun getCurrentListMapNoExtraKeys!2585 (array!47426 array!47428 (_ BitVec 32) (_ BitVec 32) V!25813 V!25813 (_ BitVec 32) Int) ListLongMap!9169)

(assert (=> bm!37357 (= call!37361 (getCurrentListMapNoExtraKeys!2585 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24962 () Bool)

(declare-fun mapRes!24962 () Bool)

(assert (=> mapIsEmpty!24962 mapRes!24962))

(declare-fun e!469494 () Bool)

(declare-fun v!557 () V!25813)

(declare-fun call!37360 () ListLongMap!9169)

(declare-fun b!841639 () Bool)

(declare-fun +!2064 (ListLongMap!9169 tuple2!10400) ListLongMap!9169)

(assert (=> b!841639 (= e!469494 (= call!37360 (+!2064 call!37361 (tuple2!10401 k!854 v!557))))))

(declare-fun b!841640 () Bool)

(assert (=> b!841640 (= e!469495 (not true))))

(assert (=> b!841640 e!469494))

(declare-fun c!91423 () Bool)

(assert (=> b!841640 (= c!91423 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28905 0))(
  ( (Unit!28906) )
))
(declare-fun lt!380929 () Unit!28905)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!298 (array!47426 array!47428 (_ BitVec 32) (_ BitVec 32) V!25813 V!25813 (_ BitVec 32) (_ BitVec 64) V!25813 (_ BitVec 32) Int) Unit!28905)

(assert (=> b!841640 (= lt!380929 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!298 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841641 () Bool)

(declare-fun res!572099 () Bool)

(assert (=> b!841641 (=> (not res!572099) (not e!469495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47426 (_ BitVec 32)) Bool)

(assert (=> b!841641 (= res!572099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841642 () Bool)

(declare-fun res!572100 () Bool)

(assert (=> b!841642 (=> (not res!572100) (not e!469495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841642 (= res!572100 (validMask!0 mask!1196))))

(declare-fun b!841643 () Bool)

(declare-fun res!572103 () Bool)

(assert (=> b!841643 (=> (not res!572103) (not e!469495))))

(assert (=> b!841643 (= res!572103 (and (= (size!23185 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23184 _keys!868) (size!23185 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37358 () Bool)

(assert (=> bm!37358 (= call!37360 (getCurrentListMapNoExtraKeys!2585 _keys!868 (array!47429 (store (arr!22745 _values!688) i!612 (ValueCellFull!7348 v!557)) (size!23185 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841644 () Bool)

(declare-fun res!572105 () Bool)

(assert (=> b!841644 (=> (not res!572105) (not e!469495))))

(declare-datatypes ((List!16180 0))(
  ( (Nil!16177) (Cons!16176 (h!17307 (_ BitVec 64)) (t!22551 List!16180)) )
))
(declare-fun arrayNoDuplicates!0 (array!47426 (_ BitVec 32) List!16180) Bool)

(assert (=> b!841644 (= res!572105 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16177))))

(declare-fun res!572104 () Bool)

(assert (=> start!72524 (=> (not res!572104) (not e!469495))))

(assert (=> start!72524 (= res!572104 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23184 _keys!868))))))

(assert (=> start!72524 e!469495))

(declare-fun tp_is_empty!15575 () Bool)

(assert (=> start!72524 tp_is_empty!15575))

(assert (=> start!72524 true))

(assert (=> start!72524 tp!48225))

(declare-fun array_inv!18096 (array!47426) Bool)

(assert (=> start!72524 (array_inv!18096 _keys!868)))

(declare-fun e!469496 () Bool)

(declare-fun array_inv!18097 (array!47428) Bool)

(assert (=> start!72524 (and (array_inv!18097 _values!688) e!469496)))

(declare-fun b!841645 () Bool)

(assert (=> b!841645 (= e!469494 (= call!37360 call!37361))))

(declare-fun mapNonEmpty!24962 () Bool)

(declare-fun tp!48226 () Bool)

(declare-fun e!469497 () Bool)

(assert (=> mapNonEmpty!24962 (= mapRes!24962 (and tp!48226 e!469497))))

(declare-fun mapValue!24962 () ValueCell!7348)

(declare-fun mapKey!24962 () (_ BitVec 32))

(declare-fun mapRest!24962 () (Array (_ BitVec 32) ValueCell!7348))

(assert (=> mapNonEmpty!24962 (= (arr!22745 _values!688) (store mapRest!24962 mapKey!24962 mapValue!24962))))

(declare-fun b!841646 () Bool)

(declare-fun e!469498 () Bool)

(assert (=> b!841646 (= e!469498 tp_is_empty!15575)))

(declare-fun b!841647 () Bool)

(assert (=> b!841647 (= e!469497 tp_is_empty!15575)))

(declare-fun b!841648 () Bool)

(assert (=> b!841648 (= e!469496 (and e!469498 mapRes!24962))))

(declare-fun condMapEmpty!24962 () Bool)

(declare-fun mapDefault!24962 () ValueCell!7348)

