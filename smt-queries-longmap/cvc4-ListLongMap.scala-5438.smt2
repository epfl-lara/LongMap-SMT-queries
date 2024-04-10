; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72416 () Bool)

(assert start!72416)

(declare-fun b_free!13601 () Bool)

(declare-fun b_next!13601 () Bool)

(assert (=> start!72416 (= b_free!13601 (not b_next!13601))))

(declare-fun tp!47902 () Bool)

(declare-fun b_and!22687 () Bool)

(assert (=> start!72416 (= tp!47902 b_and!22687)))

(declare-fun b!839532 () Bool)

(declare-fun e!468526 () Bool)

(declare-datatypes ((V!25669 0))(
  ( (V!25670 (val!7781 Int)) )
))
(declare-datatypes ((tuple2!10302 0))(
  ( (tuple2!10303 (_1!5162 (_ BitVec 64)) (_2!5162 V!25669)) )
))
(declare-datatypes ((List!16100 0))(
  ( (Nil!16097) (Cons!16096 (h!17227 tuple2!10302) (t!22471 List!16100)) )
))
(declare-datatypes ((ListLongMap!9071 0))(
  ( (ListLongMap!9072 (toList!4551 List!16100)) )
))
(declare-fun call!37037 () ListLongMap!9071)

(declare-fun call!37036 () ListLongMap!9071)

(assert (=> b!839532 (= e!468526 (= call!37037 call!37036))))

(declare-fun b!839533 () Bool)

(declare-fun res!570805 () Bool)

(declare-fun e!468522 () Bool)

(assert (=> b!839533 (=> (not res!570805) (not e!468522))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7294 0))(
  ( (ValueCellFull!7294 (v!10206 V!25669)) (EmptyCell!7294) )
))
(declare-datatypes ((array!47216 0))(
  ( (array!47217 (arr!22639 (Array (_ BitVec 32) ValueCell!7294)) (size!23079 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47216)

(declare-datatypes ((array!47218 0))(
  ( (array!47219 (arr!22640 (Array (_ BitVec 32) (_ BitVec 64))) (size!23080 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47218)

(assert (=> b!839533 (= res!570805 (and (= (size!23079 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23080 _keys!868) (size!23079 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839534 () Bool)

(declare-fun res!570804 () Bool)

(assert (=> b!839534 (=> (not res!570804) (not e!468522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839534 (= res!570804 (validMask!0 mask!1196))))

(declare-fun b!839535 () Bool)

(declare-fun res!570808 () Bool)

(assert (=> b!839535 (=> (not res!570808) (not e!468522))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839535 (= res!570808 (validKeyInArray!0 k!854))))

(declare-fun b!839536 () Bool)

(declare-fun res!570806 () Bool)

(assert (=> b!839536 (=> (not res!570806) (not e!468522))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839536 (= res!570806 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23080 _keys!868))))))

(declare-fun b!839537 () Bool)

(declare-fun res!570803 () Bool)

(assert (=> b!839537 (=> (not res!570803) (not e!468522))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!839537 (= res!570803 (and (= (select (arr!22640 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23080 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!24800 () Bool)

(declare-fun mapRes!24800 () Bool)

(declare-fun tp!47901 () Bool)

(declare-fun e!468524 () Bool)

(assert (=> mapNonEmpty!24800 (= mapRes!24800 (and tp!47901 e!468524))))

(declare-fun mapValue!24800 () ValueCell!7294)

(declare-fun mapRest!24800 () (Array (_ BitVec 32) ValueCell!7294))

(declare-fun mapKey!24800 () (_ BitVec 32))

(assert (=> mapNonEmpty!24800 (= (arr!22639 _values!688) (store mapRest!24800 mapKey!24800 mapValue!24800))))

(declare-fun b!839538 () Bool)

(declare-fun res!570809 () Bool)

(assert (=> b!839538 (=> (not res!570809) (not e!468522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47218 (_ BitVec 32)) Bool)

(assert (=> b!839538 (= res!570809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!570802 () Bool)

(assert (=> start!72416 (=> (not res!570802) (not e!468522))))

(assert (=> start!72416 (= res!570802 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23080 _keys!868))))))

(assert (=> start!72416 e!468522))

(declare-fun tp_is_empty!15467 () Bool)

(assert (=> start!72416 tp_is_empty!15467))

(assert (=> start!72416 true))

(assert (=> start!72416 tp!47902))

(declare-fun array_inv!18032 (array!47218) Bool)

(assert (=> start!72416 (array_inv!18032 _keys!868)))

(declare-fun e!468523 () Bool)

(declare-fun array_inv!18033 (array!47216) Bool)

(assert (=> start!72416 (and (array_inv!18033 _values!688) e!468523)))

(declare-fun b!839531 () Bool)

(declare-fun res!570807 () Bool)

(assert (=> b!839531 (=> (not res!570807) (not e!468522))))

(declare-datatypes ((List!16101 0))(
  ( (Nil!16098) (Cons!16097 (h!17228 (_ BitVec 64)) (t!22472 List!16101)) )
))
(declare-fun arrayNoDuplicates!0 (array!47218 (_ BitVec 32) List!16101) Bool)

(assert (=> b!839531 (= res!570807 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16098))))

(declare-fun v!557 () V!25669)

(declare-fun b!839539 () Bool)

(declare-fun +!2022 (ListLongMap!9071 tuple2!10302) ListLongMap!9071)

(assert (=> b!839539 (= e!468526 (= call!37037 (+!2022 call!37036 (tuple2!10303 k!854 v!557))))))

(declare-fun b!839540 () Bool)

(declare-fun e!468525 () Bool)

(assert (=> b!839540 (= e!468525 tp_is_empty!15467)))

(declare-fun b!839541 () Bool)

(assert (=> b!839541 (= e!468524 tp_is_empty!15467)))

(declare-fun b!839542 () Bool)

(assert (=> b!839542 (= e!468522 (not true))))

(assert (=> b!839542 e!468526))

(declare-fun c!91261 () Bool)

(assert (=> b!839542 (= c!91261 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!25669)

(declare-fun zeroValue!654 () V!25669)

(declare-datatypes ((Unit!28831 0))(
  ( (Unit!28832) )
))
(declare-fun lt!380767 () Unit!28831)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!261 (array!47218 array!47216 (_ BitVec 32) (_ BitVec 32) V!25669 V!25669 (_ BitVec 32) (_ BitVec 64) V!25669 (_ BitVec 32) Int) Unit!28831)

(assert (=> b!839542 (= lt!380767 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!261 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37033 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2541 (array!47218 array!47216 (_ BitVec 32) (_ BitVec 32) V!25669 V!25669 (_ BitVec 32) Int) ListLongMap!9071)

(assert (=> bm!37033 (= call!37037 (getCurrentListMapNoExtraKeys!2541 _keys!868 (array!47217 (store (arr!22639 _values!688) i!612 (ValueCellFull!7294 v!557)) (size!23079 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24800 () Bool)

(assert (=> mapIsEmpty!24800 mapRes!24800))

(declare-fun b!839543 () Bool)

(assert (=> b!839543 (= e!468523 (and e!468525 mapRes!24800))))

(declare-fun condMapEmpty!24800 () Bool)

(declare-fun mapDefault!24800 () ValueCell!7294)

