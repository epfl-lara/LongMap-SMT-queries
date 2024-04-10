; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73162 () Bool)

(assert start!73162)

(declare-fun b_free!14077 () Bool)

(declare-fun b_next!14077 () Bool)

(assert (=> start!73162 (= b_free!14077 (not b_next!14077))))

(declare-fun tp!49735 () Bool)

(declare-fun b_and!23313 () Bool)

(assert (=> start!73162 (= tp!49735 b_and!23313)))

(declare-fun b!851964 () Bool)

(declare-fun res!578680 () Bool)

(declare-fun e!475186 () Bool)

(assert (=> b!851964 (=> (not res!578680) (not e!475186))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851964 (= res!578680 (validMask!0 mask!1196))))

(declare-fun b!851965 () Bool)

(declare-fun e!475192 () Bool)

(assert (=> b!851965 (= e!475186 e!475192)))

(declare-fun res!578678 () Bool)

(assert (=> b!851965 (=> (not res!578678) (not e!475192))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851965 (= res!578678 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26665 0))(
  ( (V!26666 (val!8154 Int)) )
))
(declare-datatypes ((ValueCell!7667 0))(
  ( (ValueCellFull!7667 (v!10579 V!26665)) (EmptyCell!7667) )
))
(declare-datatypes ((array!48624 0))(
  ( (array!48625 (arr!23343 (Array (_ BitVec 32) ValueCell!7667)) (size!23783 (_ BitVec 32))) )
))
(declare-fun lt!383797 () array!48624)

(declare-fun minValue!654 () V!26665)

(declare-fun zeroValue!654 () V!26665)

(declare-datatypes ((array!48626 0))(
  ( (array!48627 (arr!23344 (Array (_ BitVec 32) (_ BitVec 64))) (size!23784 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48626)

(declare-datatypes ((tuple2!10702 0))(
  ( (tuple2!10703 (_1!5362 (_ BitVec 64)) (_2!5362 V!26665)) )
))
(declare-datatypes ((List!16537 0))(
  ( (Nil!16534) (Cons!16533 (h!17664 tuple2!10702) (t!23060 List!16537)) )
))
(declare-datatypes ((ListLongMap!9471 0))(
  ( (ListLongMap!9472 (toList!4751 List!16537)) )
))
(declare-fun lt!383794 () ListLongMap!9471)

(declare-fun getCurrentListMapNoExtraKeys!2733 (array!48626 array!48624 (_ BitVec 32) (_ BitVec 32) V!26665 V!26665 (_ BitVec 32) Int) ListLongMap!9471)

(assert (=> b!851965 (= lt!383794 (getCurrentListMapNoExtraKeys!2733 _keys!868 lt!383797 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26665)

(declare-fun _values!688 () array!48624)

(assert (=> b!851965 (= lt!383797 (array!48625 (store (arr!23343 _values!688) i!612 (ValueCellFull!7667 v!557)) (size!23783 _values!688)))))

(declare-fun lt!383798 () ListLongMap!9471)

(assert (=> b!851965 (= lt!383798 (getCurrentListMapNoExtraKeys!2733 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851966 () Bool)

(declare-fun res!578683 () Bool)

(assert (=> b!851966 (=> (not res!578683) (not e!475186))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!851966 (= res!578683 (and (= (select (arr!23344 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!851967 () Bool)

(declare-fun res!578685 () Bool)

(assert (=> b!851967 (=> (not res!578685) (not e!475186))))

(assert (=> b!851967 (= res!578685 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23784 _keys!868))))))

(declare-fun b!851968 () Bool)

(declare-fun res!578679 () Bool)

(assert (=> b!851968 (=> (not res!578679) (not e!475186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851968 (= res!578679 (validKeyInArray!0 k!854))))

(declare-fun b!851969 () Bool)

(declare-fun res!578686 () Bool)

(assert (=> b!851969 (=> (not res!578686) (not e!475186))))

(declare-datatypes ((List!16538 0))(
  ( (Nil!16535) (Cons!16534 (h!17665 (_ BitVec 64)) (t!23061 List!16538)) )
))
(declare-fun arrayNoDuplicates!0 (array!48626 (_ BitVec 32) List!16538) Bool)

(assert (=> b!851969 (= res!578686 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16535))))

(declare-fun b!851970 () Bool)

(declare-fun e!475190 () Bool)

(declare-fun tp_is_empty!16213 () Bool)

(assert (=> b!851970 (= e!475190 tp_is_empty!16213)))

(declare-fun bm!38083 () Bool)

(declare-fun call!38086 () ListLongMap!9471)

(assert (=> bm!38083 (= call!38086 (getCurrentListMapNoExtraKeys!2733 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851971 () Bool)

(declare-fun e!475189 () Bool)

(declare-fun e!475185 () Bool)

(declare-fun mapRes!25919 () Bool)

(assert (=> b!851971 (= e!475189 (and e!475185 mapRes!25919))))

(declare-fun condMapEmpty!25919 () Bool)

(declare-fun mapDefault!25919 () ValueCell!7667)

