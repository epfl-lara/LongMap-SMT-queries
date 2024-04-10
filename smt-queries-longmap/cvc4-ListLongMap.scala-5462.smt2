; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72560 () Bool)

(assert start!72560)

(declare-fun b_free!13745 () Bool)

(declare-fun b_next!13745 () Bool)

(assert (=> start!72560 (= b_free!13745 (not b_next!13745))))

(declare-fun tp!48333 () Bool)

(declare-fun b_and!22831 () Bool)

(assert (=> start!72560 (= tp!48333 b_and!22831)))

(declare-fun b!842340 () Bool)

(declare-fun e!469821 () Bool)

(declare-fun tp_is_empty!15611 () Bool)

(assert (=> b!842340 (= e!469821 tp_is_empty!15611)))

(declare-fun mapNonEmpty!25016 () Bool)

(declare-fun mapRes!25016 () Bool)

(declare-fun tp!48334 () Bool)

(declare-fun e!469820 () Bool)

(assert (=> mapNonEmpty!25016 (= mapRes!25016 (and tp!48334 e!469820))))

(declare-datatypes ((V!25861 0))(
  ( (V!25862 (val!7853 Int)) )
))
(declare-datatypes ((ValueCell!7366 0))(
  ( (ValueCellFull!7366 (v!10278 V!25861)) (EmptyCell!7366) )
))
(declare-fun mapRest!25016 () (Array (_ BitVec 32) ValueCell!7366))

(declare-fun mapValue!25016 () ValueCell!7366)

(declare-datatypes ((array!47496 0))(
  ( (array!47497 (arr!22779 (Array (_ BitVec 32) ValueCell!7366)) (size!23219 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47496)

(declare-fun mapKey!25016 () (_ BitVec 32))

(assert (=> mapNonEmpty!25016 (= (arr!22779 _values!688) (store mapRest!25016 mapKey!25016 mapValue!25016))))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37465 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10432 0))(
  ( (tuple2!10433 (_1!5227 (_ BitVec 64)) (_2!5227 V!25861)) )
))
(declare-datatypes ((List!16208 0))(
  ( (Nil!16205) (Cons!16204 (h!17335 tuple2!10432) (t!22579 List!16208)) )
))
(declare-datatypes ((ListLongMap!9201 0))(
  ( (ListLongMap!9202 (toList!4616 List!16208)) )
))
(declare-fun call!37469 () ListLongMap!9201)

(declare-datatypes ((array!47498 0))(
  ( (array!47499 (arr!22780 (Array (_ BitVec 32) (_ BitVec 64))) (size!23220 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47498)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25861)

(declare-fun zeroValue!654 () V!25861)

(declare-fun getCurrentListMapNoExtraKeys!2601 (array!47498 array!47496 (_ BitVec 32) (_ BitVec 32) V!25861 V!25861 (_ BitVec 32) Int) ListLongMap!9201)

(assert (=> bm!37465 (= call!37469 (getCurrentListMapNoExtraKeys!2601 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842341 () Bool)

(declare-fun e!469819 () Bool)

(declare-fun call!37468 () ListLongMap!9201)

(assert (=> b!842341 (= e!469819 (= call!37468 call!37469))))

(declare-fun mapIsEmpty!25016 () Bool)

(assert (=> mapIsEmpty!25016 mapRes!25016))

(declare-fun b!842342 () Bool)

(assert (=> b!842342 (= e!469820 tp_is_empty!15611)))

(declare-fun v!557 () V!25861)

(declare-fun b!842343 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2076 (ListLongMap!9201 tuple2!10432) ListLongMap!9201)

(assert (=> b!842343 (= e!469819 (= call!37468 (+!2076 call!37469 (tuple2!10433 k!854 v!557))))))

(declare-fun b!842344 () Bool)

(declare-fun res!572536 () Bool)

(declare-fun e!469818 () Bool)

(assert (=> b!842344 (=> (not res!572536) (not e!469818))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!842344 (= res!572536 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23220 _keys!868))))))

(declare-fun bm!37466 () Bool)

(assert (=> bm!37466 (= call!37468 (getCurrentListMapNoExtraKeys!2601 _keys!868 (array!47497 (store (arr!22779 _values!688) i!612 (ValueCellFull!7366 v!557)) (size!23219 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842345 () Bool)

(declare-fun res!572530 () Bool)

(assert (=> b!842345 (=> (not res!572530) (not e!469818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47498 (_ BitVec 32)) Bool)

(assert (=> b!842345 (= res!572530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842346 () Bool)

(declare-fun res!572534 () Bool)

(assert (=> b!842346 (=> (not res!572534) (not e!469818))))

(assert (=> b!842346 (= res!572534 (and (= (size!23219 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23220 _keys!868) (size!23219 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!572533 () Bool)

(assert (=> start!72560 (=> (not res!572533) (not e!469818))))

(assert (=> start!72560 (= res!572533 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23220 _keys!868))))))

(assert (=> start!72560 e!469818))

(assert (=> start!72560 tp_is_empty!15611))

(assert (=> start!72560 true))

(assert (=> start!72560 tp!48333))

(declare-fun array_inv!18126 (array!47498) Bool)

(assert (=> start!72560 (array_inv!18126 _keys!868)))

(declare-fun e!469822 () Bool)

(declare-fun array_inv!18127 (array!47496) Bool)

(assert (=> start!72560 (and (array_inv!18127 _values!688) e!469822)))

(declare-fun b!842339 () Bool)

(declare-fun res!572531 () Bool)

(assert (=> b!842339 (=> (not res!572531) (not e!469818))))

(assert (=> b!842339 (= res!572531 (and (= (select (arr!22780 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23220 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!842347 () Bool)

(assert (=> b!842347 (= e!469822 (and e!469821 mapRes!25016))))

(declare-fun condMapEmpty!25016 () Bool)

(declare-fun mapDefault!25016 () ValueCell!7366)

