; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72488 () Bool)

(assert start!72488)

(declare-fun b_free!13673 () Bool)

(declare-fun b_next!13673 () Bool)

(assert (=> start!72488 (= b_free!13673 (not b_next!13673))))

(declare-fun tp!48118 () Bool)

(declare-fun b_and!22759 () Bool)

(assert (=> start!72488 (= tp!48118 b_and!22759)))

(declare-datatypes ((V!25765 0))(
  ( (V!25766 (val!7817 Int)) )
))
(declare-datatypes ((tuple2!10366 0))(
  ( (tuple2!10367 (_1!5194 (_ BitVec 64)) (_2!5194 V!25765)) )
))
(declare-datatypes ((List!16152 0))(
  ( (Nil!16149) (Cons!16148 (h!17279 tuple2!10366) (t!22523 List!16152)) )
))
(declare-datatypes ((ListLongMap!9135 0))(
  ( (ListLongMap!9136 (toList!4583 List!16152)) )
))
(declare-fun call!37253 () ListLongMap!9135)

(declare-fun b!840935 () Bool)

(declare-fun v!557 () V!25765)

(declare-fun call!37252 () ListLongMap!9135)

(declare-fun e!469173 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2052 (ListLongMap!9135 tuple2!10366) ListLongMap!9135)

(assert (=> b!840935 (= e!469173 (= call!37253 (+!2052 call!37252 (tuple2!10367 k!854 v!557))))))

(declare-fun b!840936 () Bool)

(declare-fun res!571673 () Bool)

(declare-fun e!469174 () Bool)

(assert (=> b!840936 (=> (not res!571673) (not e!469174))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47356 0))(
  ( (array!47357 (arr!22709 (Array (_ BitVec 32) (_ BitVec 64))) (size!23149 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47356)

(declare-datatypes ((ValueCell!7330 0))(
  ( (ValueCellFull!7330 (v!10242 V!25765)) (EmptyCell!7330) )
))
(declare-datatypes ((array!47358 0))(
  ( (array!47359 (arr!22710 (Array (_ BitVec 32) ValueCell!7330)) (size!23150 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47358)

(assert (=> b!840936 (= res!571673 (and (= (size!23150 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23149 _keys!868) (size!23150 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840937 () Bool)

(declare-fun e!469172 () Bool)

(declare-fun tp_is_empty!15539 () Bool)

(assert (=> b!840937 (= e!469172 tp_is_empty!15539)))

(declare-fun b!840938 () Bool)

(declare-fun res!571672 () Bool)

(assert (=> b!840938 (=> (not res!571672) (not e!469174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47356 (_ BitVec 32)) Bool)

(assert (=> b!840938 (= res!571672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!571670 () Bool)

(assert (=> start!72488 (=> (not res!571670) (not e!469174))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72488 (= res!571670 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23149 _keys!868))))))

(assert (=> start!72488 e!469174))

(assert (=> start!72488 tp_is_empty!15539))

(assert (=> start!72488 true))

(assert (=> start!72488 tp!48118))

(declare-fun array_inv!18078 (array!47356) Bool)

(assert (=> start!72488 (array_inv!18078 _keys!868)))

(declare-fun e!469169 () Bool)

(declare-fun array_inv!18079 (array!47358) Bool)

(assert (=> start!72488 (and (array_inv!18079 _values!688) e!469169)))

(declare-fun b!840939 () Bool)

(declare-fun e!469170 () Bool)

(assert (=> b!840939 (= e!469170 tp_is_empty!15539)))

(declare-fun b!840940 () Bool)

(declare-fun res!571667 () Bool)

(assert (=> b!840940 (=> (not res!571667) (not e!469174))))

(declare-datatypes ((List!16153 0))(
  ( (Nil!16150) (Cons!16149 (h!17280 (_ BitVec 64)) (t!22524 List!16153)) )
))
(declare-fun arrayNoDuplicates!0 (array!47356 (_ BitVec 32) List!16153) Bool)

(assert (=> b!840940 (= res!571667 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16150))))

(declare-fun b!840941 () Bool)

(declare-fun res!571666 () Bool)

(assert (=> b!840941 (=> (not res!571666) (not e!469174))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840941 (= res!571666 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23149 _keys!868))))))

(declare-fun b!840942 () Bool)

(declare-fun res!571669 () Bool)

(assert (=> b!840942 (=> (not res!571669) (not e!469174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840942 (= res!571669 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24908 () Bool)

(declare-fun mapRes!24908 () Bool)

(assert (=> mapIsEmpty!24908 mapRes!24908))

(declare-fun mapNonEmpty!24908 () Bool)

(declare-fun tp!48117 () Bool)

(assert (=> mapNonEmpty!24908 (= mapRes!24908 (and tp!48117 e!469172))))

(declare-fun mapValue!24908 () ValueCell!7330)

(declare-fun mapRest!24908 () (Array (_ BitVec 32) ValueCell!7330))

(declare-fun mapKey!24908 () (_ BitVec 32))

(assert (=> mapNonEmpty!24908 (= (arr!22710 _values!688) (store mapRest!24908 mapKey!24908 mapValue!24908))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!25765)

(declare-fun zeroValue!654 () V!25765)

(declare-fun bm!37249 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2570 (array!47356 array!47358 (_ BitVec 32) (_ BitVec 32) V!25765 V!25765 (_ BitVec 32) Int) ListLongMap!9135)

(assert (=> bm!37249 (= call!37253 (getCurrentListMapNoExtraKeys!2570 _keys!868 (array!47359 (store (arr!22710 _values!688) i!612 (ValueCellFull!7330 v!557)) (size!23150 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840943 () Bool)

(declare-fun res!571671 () Bool)

(assert (=> b!840943 (=> (not res!571671) (not e!469174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840943 (= res!571671 (validKeyInArray!0 k!854))))

(declare-fun b!840944 () Bool)

(assert (=> b!840944 (= e!469173 (= call!37253 call!37252))))

(declare-fun b!840945 () Bool)

(assert (=> b!840945 (= e!469169 (and e!469170 mapRes!24908))))

(declare-fun condMapEmpty!24908 () Bool)

(declare-fun mapDefault!24908 () ValueCell!7330)

