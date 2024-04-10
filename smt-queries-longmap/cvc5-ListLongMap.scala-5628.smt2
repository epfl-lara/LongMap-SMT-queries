; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73552 () Bool)

(assert start!73552)

(declare-fun b_free!14467 () Bool)

(declare-fun b_next!14467 () Bool)

(assert (=> start!73552 (= b_free!14467 (not b_next!14467))))

(declare-fun tp!50904 () Bool)

(declare-fun b_and!23913 () Bool)

(assert (=> start!73552 (= tp!50904 b_and!23913)))

(declare-fun b!859972 () Bool)

(declare-fun e!479222 () Bool)

(declare-fun e!479227 () Bool)

(assert (=> b!859972 (= e!479222 e!479227)))

(declare-fun res!584372 () Bool)

(assert (=> b!859972 (=> (not res!584372) (not e!479227))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859972 (= res!584372 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27185 0))(
  ( (V!27186 (val!8349 Int)) )
))
(declare-datatypes ((ValueCell!7862 0))(
  ( (ValueCellFull!7862 (v!10774 V!27185)) (EmptyCell!7862) )
))
(declare-datatypes ((array!49382 0))(
  ( (array!49383 (arr!23722 (Array (_ BitVec 32) ValueCell!7862)) (size!24162 (_ BitVec 32))) )
))
(declare-fun lt!387570 () array!49382)

(declare-datatypes ((array!49384 0))(
  ( (array!49385 (arr!23723 (Array (_ BitVec 32) (_ BitVec 64))) (size!24163 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49384)

(declare-fun minValue!654 () V!27185)

(declare-fun zeroValue!654 () V!27185)

(declare-datatypes ((tuple2!11030 0))(
  ( (tuple2!11031 (_1!5526 (_ BitVec 64)) (_2!5526 V!27185)) )
))
(declare-datatypes ((List!16839 0))(
  ( (Nil!16836) (Cons!16835 (h!17966 tuple2!11030) (t!23572 List!16839)) )
))
(declare-datatypes ((ListLongMap!9799 0))(
  ( (ListLongMap!9800 (toList!4915 List!16839)) )
))
(declare-fun lt!387565 () ListLongMap!9799)

(declare-fun getCurrentListMapNoExtraKeys!2893 (array!49384 array!49382 (_ BitVec 32) (_ BitVec 32) V!27185 V!27185 (_ BitVec 32) Int) ListLongMap!9799)

(assert (=> b!859972 (= lt!387565 (getCurrentListMapNoExtraKeys!2893 _keys!868 lt!387570 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27185)

(declare-fun _values!688 () array!49382)

(assert (=> b!859972 (= lt!387570 (array!49383 (store (arr!23722 _values!688) i!612 (ValueCellFull!7862 v!557)) (size!24162 _values!688)))))

(declare-fun lt!387568 () ListLongMap!9799)

(assert (=> b!859972 (= lt!387568 (getCurrentListMapNoExtraKeys!2893 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859973 () Bool)

(declare-fun e!479223 () Bool)

(declare-fun e!479219 () Bool)

(declare-fun mapRes!26504 () Bool)

(assert (=> b!859973 (= e!479223 (and e!479219 mapRes!26504))))

(declare-fun condMapEmpty!26504 () Bool)

(declare-fun mapDefault!26504 () ValueCell!7862)

