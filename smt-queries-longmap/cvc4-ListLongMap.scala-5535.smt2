; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72998 () Bool)

(assert start!72998)

(declare-fun b_free!13913 () Bool)

(declare-fun b_next!13913 () Bool)

(assert (=> start!72998 (= b_free!13913 (not b_next!13913))))

(declare-fun tp!49243 () Bool)

(declare-fun b_and!22999 () Bool)

(assert (=> start!72998 (= tp!49243 b_and!22999)))

(declare-fun b!848135 () Bool)

(declare-fun e!473229 () Bool)

(declare-datatypes ((V!26445 0))(
  ( (V!26446 (val!8072 Int)) )
))
(declare-datatypes ((tuple2!10554 0))(
  ( (tuple2!10555 (_1!5288 (_ BitVec 64)) (_2!5288 V!26445)) )
))
(declare-datatypes ((List!16411 0))(
  ( (Nil!16408) (Cons!16407 (h!17538 tuple2!10554) (t!22782 List!16411)) )
))
(declare-datatypes ((ListLongMap!9323 0))(
  ( (ListLongMap!9324 (toList!4677 List!16411)) )
))
(declare-fun call!37594 () ListLongMap!9323)

(declare-fun call!37595 () ListLongMap!9323)

(assert (=> b!848135 (= e!473229 (= call!37594 call!37595))))

(declare-fun b!848136 () Bool)

(declare-fun res!576230 () Bool)

(declare-fun e!473232 () Bool)

(assert (=> b!848136 (=> (not res!576230) (not e!473232))))

(declare-datatypes ((array!48308 0))(
  ( (array!48309 (arr!23185 (Array (_ BitVec 32) (_ BitVec 64))) (size!23625 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48308)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48308 (_ BitVec 32)) Bool)

(assert (=> b!848136 (= res!576230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848137 () Bool)

(declare-fun e!473231 () Bool)

(assert (=> b!848137 (= e!473231 (not true))))

(assert (=> b!848137 e!473229))

(declare-fun c!91540 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848137 (= c!91540 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28967 0))(
  ( (Unit!28968) )
))
(declare-fun lt!381937 () Unit!28967)

(declare-fun v!557 () V!26445)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7585 0))(
  ( (ValueCellFull!7585 (v!10497 V!26445)) (EmptyCell!7585) )
))
(declare-datatypes ((array!48310 0))(
  ( (array!48311 (arr!23186 (Array (_ BitVec 32) ValueCell!7585)) (size!23626 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48310)

(declare-fun minValue!654 () V!26445)

(declare-fun zeroValue!654 () V!26445)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!329 (array!48308 array!48310 (_ BitVec 32) (_ BitVec 32) V!26445 V!26445 (_ BitVec 32) (_ BitVec 64) V!26445 (_ BitVec 32) Int) Unit!28967)

(assert (=> b!848137 (= lt!381937 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!329 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848138 () Bool)

(declare-fun res!576228 () Bool)

(assert (=> b!848138 (=> (not res!576228) (not e!473232))))

(assert (=> b!848138 (= res!576228 (and (= (size!23626 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23625 _keys!868) (size!23626 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848139 () Bool)

(declare-fun e!473233 () Bool)

(declare-fun e!473227 () Bool)

(declare-fun mapRes!25673 () Bool)

(assert (=> b!848139 (= e!473233 (and e!473227 mapRes!25673))))

(declare-fun condMapEmpty!25673 () Bool)

(declare-fun mapDefault!25673 () ValueCell!7585)

