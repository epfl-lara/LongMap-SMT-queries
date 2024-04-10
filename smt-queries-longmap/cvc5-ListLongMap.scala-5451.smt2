; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72490 () Bool)

(assert start!72490)

(declare-fun b_free!13675 () Bool)

(declare-fun b_next!13675 () Bool)

(assert (=> start!72490 (= b_free!13675 (not b_next!13675))))

(declare-fun tp!48123 () Bool)

(declare-fun b_and!22761 () Bool)

(assert (=> start!72490 (= tp!48123 b_and!22761)))

(declare-datatypes ((V!25769 0))(
  ( (V!25770 (val!7818 Int)) )
))
(declare-datatypes ((tuple2!10368 0))(
  ( (tuple2!10369 (_1!5195 (_ BitVec 64)) (_2!5195 V!25769)) )
))
(declare-datatypes ((List!16154 0))(
  ( (Nil!16151) (Cons!16150 (h!17281 tuple2!10368) (t!22525 List!16154)) )
))
(declare-datatypes ((ListLongMap!9137 0))(
  ( (ListLongMap!9138 (toList!4584 List!16154)) )
))
(declare-fun call!37258 () ListLongMap!9137)

(declare-fun v!557 () V!25769)

(declare-fun b!840974 () Bool)

(declare-fun call!37259 () ListLongMap!9137)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun e!469192 () Bool)

(declare-fun +!2053 (ListLongMap!9137 tuple2!10368) ListLongMap!9137)

(assert (=> b!840974 (= e!469192 (= call!37258 (+!2053 call!37259 (tuple2!10369 k!854 v!557))))))

(declare-fun b!840975 () Bool)

(declare-fun e!469188 () Bool)

(declare-fun tp_is_empty!15541 () Bool)

(assert (=> b!840975 (= e!469188 tp_is_empty!15541)))

(declare-fun mapNonEmpty!24911 () Bool)

(declare-fun mapRes!24911 () Bool)

(declare-fun tp!48124 () Bool)

(declare-fun e!469191 () Bool)

(assert (=> mapNonEmpty!24911 (= mapRes!24911 (and tp!48124 e!469191))))

(declare-fun mapKey!24911 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7331 0))(
  ( (ValueCellFull!7331 (v!10243 V!25769)) (EmptyCell!7331) )
))
(declare-fun mapRest!24911 () (Array (_ BitVec 32) ValueCell!7331))

(declare-datatypes ((array!47360 0))(
  ( (array!47361 (arr!22711 (Array (_ BitVec 32) ValueCell!7331)) (size!23151 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47360)

(declare-fun mapValue!24911 () ValueCell!7331)

(assert (=> mapNonEmpty!24911 (= (arr!22711 _values!688) (store mapRest!24911 mapKey!24911 mapValue!24911))))

(declare-fun b!840976 () Bool)

(declare-fun res!571691 () Bool)

(declare-fun e!469187 () Bool)

(assert (=> b!840976 (=> (not res!571691) (not e!469187))))

(declare-datatypes ((array!47362 0))(
  ( (array!47363 (arr!22712 (Array (_ BitVec 32) (_ BitVec 64))) (size!23152 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47362)

(declare-datatypes ((List!16155 0))(
  ( (Nil!16152) (Cons!16151 (h!17282 (_ BitVec 64)) (t!22526 List!16155)) )
))
(declare-fun arrayNoDuplicates!0 (array!47362 (_ BitVec 32) List!16155) Bool)

(assert (=> b!840976 (= res!571691 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16152))))

(declare-fun b!840977 () Bool)

(declare-fun res!571697 () Bool)

(assert (=> b!840977 (=> (not res!571697) (not e!469187))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47362 (_ BitVec 32)) Bool)

(assert (=> b!840977 (= res!571697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840979 () Bool)

(declare-fun res!571690 () Bool)

(assert (=> b!840979 (=> (not res!571690) (not e!469187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840979 (= res!571690 (validMask!0 mask!1196))))

(declare-fun bm!37255 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25769)

(declare-fun zeroValue!654 () V!25769)

(declare-fun getCurrentListMapNoExtraKeys!2571 (array!47362 array!47360 (_ BitVec 32) (_ BitVec 32) V!25769 V!25769 (_ BitVec 32) Int) ListLongMap!9137)

(assert (=> bm!37255 (= call!37258 (getCurrentListMapNoExtraKeys!2571 _keys!868 (array!47361 (store (arr!22711 _values!688) i!612 (ValueCellFull!7331 v!557)) (size!23151 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24911 () Bool)

(assert (=> mapIsEmpty!24911 mapRes!24911))

(declare-fun b!840980 () Bool)

(declare-fun res!571695 () Bool)

(assert (=> b!840980 (=> (not res!571695) (not e!469187))))

(assert (=> b!840980 (= res!571695 (and (= (select (arr!22712 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23152 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840981 () Bool)

(declare-fun e!469190 () Bool)

(assert (=> b!840981 (= e!469190 (and e!469188 mapRes!24911))))

(declare-fun condMapEmpty!24911 () Bool)

(declare-fun mapDefault!24911 () ValueCell!7331)

