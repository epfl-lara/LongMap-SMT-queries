; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72478 () Bool)

(assert start!72478)

(declare-fun b_free!13663 () Bool)

(declare-fun b_next!13663 () Bool)

(assert (=> start!72478 (= b_free!13663 (not b_next!13663))))

(declare-fun tp!48088 () Bool)

(declare-fun b_and!22749 () Bool)

(assert (=> start!72478 (= tp!48088 b_and!22749)))

(declare-fun b!840740 () Bool)

(declare-fun res!571553 () Bool)

(declare-fun e!469079 () Bool)

(assert (=> b!840740 (=> (not res!571553) (not e!469079))))

(declare-datatypes ((array!47336 0))(
  ( (array!47337 (arr!22699 (Array (_ BitVec 32) (_ BitVec 64))) (size!23139 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47336)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47336 (_ BitVec 32)) Bool)

(assert (=> b!840740 (= res!571553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-datatypes ((V!25753 0))(
  ( (V!25754 (val!7812 Int)) )
))
(declare-fun v!557 () V!25753)

(declare-fun b!840741 () Bool)

(declare-datatypes ((tuple2!10356 0))(
  ( (tuple2!10357 (_1!5189 (_ BitVec 64)) (_2!5189 V!25753)) )
))
(declare-datatypes ((List!16145 0))(
  ( (Nil!16142) (Cons!16141 (h!17272 tuple2!10356) (t!22516 List!16145)) )
))
(declare-datatypes ((ListLongMap!9125 0))(
  ( (ListLongMap!9126 (toList!4578 List!16145)) )
))
(declare-fun call!37222 () ListLongMap!9125)

(declare-fun call!37223 () ListLongMap!9125)

(declare-fun e!469083 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2047 (ListLongMap!9125 tuple2!10356) ListLongMap!9125)

(assert (=> b!840741 (= e!469083 (= call!37222 (+!2047 call!37223 (tuple2!10357 k!854 v!557))))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37219 () Bool)

(declare-datatypes ((ValueCell!7325 0))(
  ( (ValueCellFull!7325 (v!10237 V!25753)) (EmptyCell!7325) )
))
(declare-datatypes ((array!47338 0))(
  ( (array!47339 (arr!22700 (Array (_ BitVec 32) ValueCell!7325)) (size!23140 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47338)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25753)

(declare-fun zeroValue!654 () V!25753)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2565 (array!47336 array!47338 (_ BitVec 32) (_ BitVec 32) V!25753 V!25753 (_ BitVec 32) Int) ListLongMap!9125)

(assert (=> bm!37219 (= call!37222 (getCurrentListMapNoExtraKeys!2565 _keys!868 (array!47339 (store (arr!22700 _values!688) i!612 (ValueCellFull!7325 v!557)) (size!23140 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!571552 () Bool)

(assert (=> start!72478 (=> (not res!571552) (not e!469079))))

(assert (=> start!72478 (= res!571552 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23139 _keys!868))))))

(assert (=> start!72478 e!469079))

(declare-fun tp_is_empty!15529 () Bool)

(assert (=> start!72478 tp_is_empty!15529))

(assert (=> start!72478 true))

(assert (=> start!72478 tp!48088))

(declare-fun array_inv!18070 (array!47336) Bool)

(assert (=> start!72478 (array_inv!18070 _keys!868)))

(declare-fun e!469082 () Bool)

(declare-fun array_inv!18071 (array!47338) Bool)

(assert (=> start!72478 (and (array_inv!18071 _values!688) e!469082)))

(declare-fun b!840742 () Bool)

(assert (=> b!840742 (= e!469079 (not true))))

(assert (=> b!840742 e!469083))

(declare-fun c!91354 () Bool)

(assert (=> b!840742 (= c!91354 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28877 0))(
  ( (Unit!28878) )
))
(declare-fun lt!380860 () Unit!28877)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!284 (array!47336 array!47338 (_ BitVec 32) (_ BitVec 32) V!25753 V!25753 (_ BitVec 32) (_ BitVec 64) V!25753 (_ BitVec 32) Int) Unit!28877)

(assert (=> b!840742 (= lt!380860 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24893 () Bool)

(declare-fun mapRes!24893 () Bool)

(declare-fun tp!48087 () Bool)

(declare-fun e!469084 () Bool)

(assert (=> mapNonEmpty!24893 (= mapRes!24893 (and tp!48087 e!469084))))

(declare-fun mapKey!24893 () (_ BitVec 32))

(declare-fun mapRest!24893 () (Array (_ BitVec 32) ValueCell!7325))

(declare-fun mapValue!24893 () ValueCell!7325)

(assert (=> mapNonEmpty!24893 (= (arr!22700 _values!688) (store mapRest!24893 mapKey!24893 mapValue!24893))))

(declare-fun b!840743 () Bool)

(declare-fun res!571547 () Bool)

(assert (=> b!840743 (=> (not res!571547) (not e!469079))))

(assert (=> b!840743 (= res!571547 (and (= (size!23140 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23139 _keys!868) (size!23140 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840744 () Bool)

(declare-fun res!571550 () Bool)

(assert (=> b!840744 (=> (not res!571550) (not e!469079))))

(assert (=> b!840744 (= res!571550 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23139 _keys!868))))))

(declare-fun b!840745 () Bool)

(assert (=> b!840745 (= e!469084 tp_is_empty!15529)))

(declare-fun b!840746 () Bool)

(declare-fun res!571549 () Bool)

(assert (=> b!840746 (=> (not res!571549) (not e!469079))))

(assert (=> b!840746 (= res!571549 (and (= (select (arr!22699 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23139 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840747 () Bool)

(declare-fun e!469080 () Bool)

(assert (=> b!840747 (= e!469080 tp_is_empty!15529)))

(declare-fun b!840748 () Bool)

(declare-fun res!571546 () Bool)

(assert (=> b!840748 (=> (not res!571546) (not e!469079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840748 (= res!571546 (validMask!0 mask!1196))))

(declare-fun bm!37220 () Bool)

(assert (=> bm!37220 (= call!37223 (getCurrentListMapNoExtraKeys!2565 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840749 () Bool)

(assert (=> b!840749 (= e!469083 (= call!37222 call!37223))))

(declare-fun mapIsEmpty!24893 () Bool)

(assert (=> mapIsEmpty!24893 mapRes!24893))

(declare-fun b!840750 () Bool)

(declare-fun res!571551 () Bool)

(assert (=> b!840750 (=> (not res!571551) (not e!469079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840750 (= res!571551 (validKeyInArray!0 k!854))))

(declare-fun b!840751 () Bool)

(assert (=> b!840751 (= e!469082 (and e!469080 mapRes!24893))))

(declare-fun condMapEmpty!24893 () Bool)

(declare-fun mapDefault!24893 () ValueCell!7325)

