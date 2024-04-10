; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73210 () Bool)

(assert start!73210)

(declare-fun b_free!14125 () Bool)

(declare-fun b_next!14125 () Bool)

(assert (=> start!73210 (= b_free!14125 (not b_next!14125))))

(declare-fun tp!49878 () Bool)

(declare-fun b_and!23409 () Bool)

(assert (=> start!73210 (= tp!49878 b_and!23409)))

(declare-fun b!853092 () Bool)

(declare-fun res!579400 () Bool)

(declare-fun e!475767 () Bool)

(assert (=> b!853092 (=> (not res!579400) (not e!475767))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48720 0))(
  ( (array!48721 (arr!23391 (Array (_ BitVec 32) (_ BitVec 64))) (size!23831 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48720)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!853092 (= res!579400 (and (= (select (arr!23391 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!853093 () Bool)

(declare-fun res!579404 () Bool)

(assert (=> b!853093 (=> (not res!579404) (not e!475767))))

(declare-datatypes ((List!16574 0))(
  ( (Nil!16571) (Cons!16570 (h!17701 (_ BitVec 64)) (t!23145 List!16574)) )
))
(declare-fun arrayNoDuplicates!0 (array!48720 (_ BitVec 32) List!16574) Bool)

(assert (=> b!853093 (= res!579404 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16571))))

(declare-fun b!853094 () Bool)

(declare-fun e!475768 () Bool)

(declare-fun tp_is_empty!16261 () Bool)

(assert (=> b!853094 (= e!475768 tp_is_empty!16261)))

(declare-fun b!853095 () Bool)

(declare-fun res!579398 () Bool)

(assert (=> b!853095 (=> (not res!579398) (not e!475767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853095 (= res!579398 (validKeyInArray!0 k!854))))

(declare-datatypes ((V!26729 0))(
  ( (V!26730 (val!8178 Int)) )
))
(declare-datatypes ((tuple2!10746 0))(
  ( (tuple2!10747 (_1!5384 (_ BitVec 64)) (_2!5384 V!26729)) )
))
(declare-datatypes ((List!16575 0))(
  ( (Nil!16572) (Cons!16571 (h!17702 tuple2!10746) (t!23146 List!16575)) )
))
(declare-datatypes ((ListLongMap!9515 0))(
  ( (ListLongMap!9516 (toList!4773 List!16575)) )
))
(declare-fun call!38231 () ListLongMap!9515)

(declare-fun v!557 () V!26729)

(declare-fun b!853096 () Bool)

(declare-fun e!475764 () Bool)

(declare-fun call!38230 () ListLongMap!9515)

(declare-fun +!2166 (ListLongMap!9515 tuple2!10746) ListLongMap!9515)

(assert (=> b!853096 (= e!475764 (= call!38231 (+!2166 call!38230 (tuple2!10747 k!854 v!557))))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7691 0))(
  ( (ValueCellFull!7691 (v!10603 V!26729)) (EmptyCell!7691) )
))
(declare-datatypes ((array!48722 0))(
  ( (array!48723 (arr!23392 (Array (_ BitVec 32) ValueCell!7691)) (size!23832 (_ BitVec 32))) )
))
(declare-fun lt!384515 () array!48722)

(declare-fun minValue!654 () V!26729)

(declare-fun zeroValue!654 () V!26729)

(declare-fun bm!38227 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2754 (array!48720 array!48722 (_ BitVec 32) (_ BitVec 32) V!26729 V!26729 (_ BitVec 32) Int) ListLongMap!9515)

(assert (=> bm!38227 (= call!38231 (getCurrentListMapNoExtraKeys!2754 _keys!868 lt!384515 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853097 () Bool)

(assert (=> b!853097 (= e!475764 (= call!38231 call!38230))))

(declare-fun res!579407 () Bool)

(assert (=> start!73210 (=> (not res!579407) (not e!475767))))

(assert (=> start!73210 (= res!579407 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23831 _keys!868))))))

(assert (=> start!73210 e!475767))

(assert (=> start!73210 tp_is_empty!16261))

(assert (=> start!73210 true))

(assert (=> start!73210 tp!49878))

(declare-fun array_inv!18548 (array!48720) Bool)

(assert (=> start!73210 (array_inv!18548 _keys!868)))

(declare-fun _values!688 () array!48722)

(declare-fun e!475766 () Bool)

(declare-fun array_inv!18549 (array!48722) Bool)

(assert (=> start!73210 (and (array_inv!18549 _values!688) e!475766)))

(declare-fun b!853098 () Bool)

(declare-fun res!579402 () Bool)

(assert (=> b!853098 (=> (not res!579402) (not e!475767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48720 (_ BitVec 32)) Bool)

(assert (=> b!853098 (= res!579402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853099 () Bool)

(declare-fun e!475765 () Bool)

(assert (=> b!853099 (= e!475767 e!475765)))

(declare-fun res!579403 () Bool)

(assert (=> b!853099 (=> (not res!579403) (not e!475765))))

(assert (=> b!853099 (= res!579403 (= from!1053 i!612))))

(declare-fun lt!384520 () ListLongMap!9515)

(assert (=> b!853099 (= lt!384520 (getCurrentListMapNoExtraKeys!2754 _keys!868 lt!384515 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853099 (= lt!384515 (array!48723 (store (arr!23392 _values!688) i!612 (ValueCellFull!7691 v!557)) (size!23832 _values!688)))))

(declare-fun lt!384519 () ListLongMap!9515)

(assert (=> b!853099 (= lt!384519 (getCurrentListMapNoExtraKeys!2754 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!38228 () Bool)

(assert (=> bm!38228 (= call!38230 (getCurrentListMapNoExtraKeys!2754 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853100 () Bool)

(declare-fun e!475762 () Bool)

(declare-fun mapRes!25991 () Bool)

(assert (=> b!853100 (= e!475766 (and e!475762 mapRes!25991))))

(declare-fun condMapEmpty!25991 () Bool)

(declare-fun mapDefault!25991 () ValueCell!7691)

