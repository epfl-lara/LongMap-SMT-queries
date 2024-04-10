; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73166 () Bool)

(assert start!73166)

(declare-fun b_free!14081 () Bool)

(declare-fun b_next!14081 () Bool)

(assert (=> start!73166 (= b_free!14081 (not b_next!14081))))

(declare-fun tp!49746 () Bool)

(declare-fun b_and!23321 () Bool)

(assert (=> start!73166 (= tp!49746 b_and!23321)))

(declare-fun b!852058 () Bool)

(declare-fun res!578745 () Bool)

(declare-fun e!475240 () Bool)

(assert (=> b!852058 (=> (not res!578745) (not e!475240))))

(declare-datatypes ((array!48632 0))(
  ( (array!48633 (arr!23347 (Array (_ BitVec 32) (_ BitVec 64))) (size!23787 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48632)

(declare-datatypes ((List!16541 0))(
  ( (Nil!16538) (Cons!16537 (h!17668 (_ BitVec 64)) (t!23068 List!16541)) )
))
(declare-fun arrayNoDuplicates!0 (array!48632 (_ BitVec 32) List!16541) Bool)

(assert (=> b!852058 (= res!578745 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16538))))

(declare-fun b!852059 () Bool)

(declare-fun res!578746 () Bool)

(assert (=> b!852059 (=> (not res!578746) (not e!475240))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852059 (= res!578746 (validKeyInArray!0 k!854))))

(declare-fun b!852060 () Bool)

(declare-fun e!475233 () Bool)

(declare-fun tp_is_empty!16217 () Bool)

(assert (=> b!852060 (= e!475233 tp_is_empty!16217)))

(declare-fun mapNonEmpty!25925 () Bool)

(declare-fun mapRes!25925 () Bool)

(declare-fun tp!49747 () Bool)

(assert (=> mapNonEmpty!25925 (= mapRes!25925 (and tp!49747 e!475233))))

(declare-fun mapKey!25925 () (_ BitVec 32))

(declare-datatypes ((V!26669 0))(
  ( (V!26670 (val!8156 Int)) )
))
(declare-datatypes ((ValueCell!7669 0))(
  ( (ValueCellFull!7669 (v!10581 V!26669)) (EmptyCell!7669) )
))
(declare-fun mapValue!25925 () ValueCell!7669)

(declare-datatypes ((array!48634 0))(
  ( (array!48635 (arr!23348 (Array (_ BitVec 32) ValueCell!7669)) (size!23788 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48634)

(declare-fun mapRest!25925 () (Array (_ BitVec 32) ValueCell!7669))

(assert (=> mapNonEmpty!25925 (= (arr!23348 _values!688) (store mapRest!25925 mapKey!25925 mapValue!25925))))

(declare-fun b!852061 () Bool)

(declare-fun res!578740 () Bool)

(assert (=> b!852061 (=> (not res!578740) (not e!475240))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48632 (_ BitVec 32)) Bool)

(assert (=> b!852061 (= res!578740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852062 () Bool)

(declare-fun e!475236 () Bool)

(assert (=> b!852062 (= e!475240 e!475236)))

(declare-fun res!578747 () Bool)

(assert (=> b!852062 (=> (not res!578747) (not e!475236))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852062 (= res!578747 (= from!1053 i!612))))

(declare-fun lt!383863 () array!48634)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10706 0))(
  ( (tuple2!10707 (_1!5364 (_ BitVec 64)) (_2!5364 V!26669)) )
))
(declare-datatypes ((List!16542 0))(
  ( (Nil!16539) (Cons!16538 (h!17669 tuple2!10706) (t!23069 List!16542)) )
))
(declare-datatypes ((ListLongMap!9475 0))(
  ( (ListLongMap!9476 (toList!4753 List!16542)) )
))
(declare-fun lt!383855 () ListLongMap!9475)

(declare-fun minValue!654 () V!26669)

(declare-fun zeroValue!654 () V!26669)

(declare-fun getCurrentListMapNoExtraKeys!2735 (array!48632 array!48634 (_ BitVec 32) (_ BitVec 32) V!26669 V!26669 (_ BitVec 32) Int) ListLongMap!9475)

(assert (=> b!852062 (= lt!383855 (getCurrentListMapNoExtraKeys!2735 _keys!868 lt!383863 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26669)

(assert (=> b!852062 (= lt!383863 (array!48635 (store (arr!23348 _values!688) i!612 (ValueCellFull!7669 v!557)) (size!23788 _values!688)))))

(declare-fun lt!383856 () ListLongMap!9475)

(assert (=> b!852062 (= lt!383856 (getCurrentListMapNoExtraKeys!2735 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852063 () Bool)

(declare-fun res!578739 () Bool)

(assert (=> b!852063 (=> (not res!578739) (not e!475240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852063 (= res!578739 (validMask!0 mask!1196))))

(declare-fun call!38099 () ListLongMap!9475)

(declare-fun e!475237 () Bool)

(declare-fun b!852064 () Bool)

(declare-fun call!38098 () ListLongMap!9475)

(declare-fun +!2151 (ListLongMap!9475 tuple2!10706) ListLongMap!9475)

(assert (=> b!852064 (= e!475237 (= call!38099 (+!2151 call!38098 (tuple2!10707 k!854 v!557))))))

(declare-fun b!852065 () Bool)

(declare-fun res!578744 () Bool)

(assert (=> b!852065 (=> (not res!578744) (not e!475240))))

(assert (=> b!852065 (= res!578744 (and (= (size!23788 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23787 _keys!868) (size!23788 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852066 () Bool)

(declare-fun e!475239 () Bool)

(assert (=> b!852066 (= e!475239 tp_is_empty!16217)))

(declare-fun bm!38096 () Bool)

(assert (=> bm!38096 (= call!38099 (getCurrentListMapNoExtraKeys!2735 _keys!868 lt!383863 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852067 () Bool)

(declare-fun e!475238 () Bool)

(assert (=> b!852067 (= e!475238 (and e!475239 mapRes!25925))))

(declare-fun condMapEmpty!25925 () Bool)

(declare-fun mapDefault!25925 () ValueCell!7669)

