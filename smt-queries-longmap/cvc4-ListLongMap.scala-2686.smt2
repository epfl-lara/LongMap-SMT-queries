; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39938 () Bool)

(assert start!39938)

(declare-fun b_free!10205 () Bool)

(declare-fun b_next!10205 () Bool)

(assert (=> start!39938 (= b_free!10205 (not b_next!10205))))

(declare-fun tp!36144 () Bool)

(declare-fun b_and!18069 () Bool)

(assert (=> start!39938 (= tp!36144 b_and!18069)))

(declare-fun b!433556 () Bool)

(declare-fun e!256332 () Bool)

(declare-fun e!256339 () Bool)

(assert (=> b!433556 (= e!256332 e!256339)))

(declare-fun res!255190 () Bool)

(assert (=> b!433556 (=> res!255190 e!256339)))

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26547 0))(
  ( (array!26548 (arr!12723 (Array (_ BitVec 32) (_ BitVec 64))) (size!13075 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26547)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433556 (= res!255190 (= k!794 (select (arr!12723 _keys!709) from!863)))))

(assert (=> b!433556 (not (= (select (arr!12723 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12836 0))(
  ( (Unit!12837) )
))
(declare-fun lt!199119 () Unit!12836)

(declare-fun e!256338 () Unit!12836)

(assert (=> b!433556 (= lt!199119 e!256338)))

(declare-fun c!55643 () Bool)

(assert (=> b!433556 (= c!55643 (= (select (arr!12723 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16247 0))(
  ( (V!16248 (val!5723 Int)) )
))
(declare-datatypes ((tuple2!7564 0))(
  ( (tuple2!7565 (_1!3793 (_ BitVec 64)) (_2!3793 V!16247)) )
))
(declare-datatypes ((List!7573 0))(
  ( (Nil!7570) (Cons!7569 (h!8425 tuple2!7564) (t!13227 List!7573)) )
))
(declare-datatypes ((ListLongMap!6477 0))(
  ( (ListLongMap!6478 (toList!3254 List!7573)) )
))
(declare-fun lt!199122 () ListLongMap!6477)

(declare-fun lt!199121 () ListLongMap!6477)

(assert (=> b!433556 (= lt!199122 lt!199121)))

(declare-fun lt!199126 () ListLongMap!6477)

(declare-fun lt!199129 () tuple2!7564)

(declare-fun +!1402 (ListLongMap!6477 tuple2!7564) ListLongMap!6477)

(assert (=> b!433556 (= lt!199121 (+!1402 lt!199126 lt!199129))))

(declare-fun lt!199130 () V!16247)

(assert (=> b!433556 (= lt!199129 (tuple2!7565 (select (arr!12723 _keys!709) from!863) lt!199130))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5335 0))(
  ( (ValueCellFull!5335 (v!7970 V!16247)) (EmptyCell!5335) )
))
(declare-datatypes ((array!26549 0))(
  ( (array!26550 (arr!12724 (Array (_ BitVec 32) ValueCell!5335)) (size!13076 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26549)

(declare-fun get!6330 (ValueCell!5335 V!16247) V!16247)

(declare-fun dynLambda!815 (Int (_ BitVec 64)) V!16247)

(assert (=> b!433556 (= lt!199130 (get!6330 (select (arr!12724 _values!549) from!863) (dynLambda!815 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433557 () Bool)

(declare-fun Unit!12838 () Unit!12836)

(assert (=> b!433557 (= e!256338 Unit!12838)))

(declare-fun b!433558 () Bool)

(declare-fun e!256340 () Bool)

(declare-fun tp_is_empty!11357 () Bool)

(assert (=> b!433558 (= e!256340 tp_is_empty!11357)))

(declare-fun b!433559 () Bool)

(declare-fun res!255191 () Bool)

(declare-fun e!256335 () Bool)

(assert (=> b!433559 (=> (not res!255191) (not e!256335))))

(declare-fun arrayContainsKey!0 (array!26547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433559 (= res!255191 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!433561 () Bool)

(assert (=> b!433561 (= e!256339 true)))

(declare-fun lt!199120 () ListLongMap!6477)

(declare-fun lt!199116 () tuple2!7564)

(assert (=> b!433561 (= lt!199121 (+!1402 (+!1402 lt!199120 lt!199129) lt!199116))))

(declare-fun lt!199125 () Unit!12836)

(declare-fun v!412 () V!16247)

(declare-fun addCommutativeForDiffKeys!391 (ListLongMap!6477 (_ BitVec 64) V!16247 (_ BitVec 64) V!16247) Unit!12836)

(assert (=> b!433561 (= lt!199125 (addCommutativeForDiffKeys!391 lt!199120 k!794 v!412 (select (arr!12723 _keys!709) from!863) lt!199130))))

(declare-fun b!433562 () Bool)

(declare-fun e!256333 () Bool)

(assert (=> b!433562 (= e!256335 e!256333)))

(declare-fun res!255181 () Bool)

(assert (=> b!433562 (=> (not res!255181) (not e!256333))))

(declare-fun lt!199123 () array!26547)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26547 (_ BitVec 32)) Bool)

(assert (=> b!433562 (= res!255181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199123 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433562 (= lt!199123 (array!26548 (store (arr!12723 _keys!709) i!563 k!794) (size!13075 _keys!709)))))

(declare-fun b!433563 () Bool)

(declare-fun res!255195 () Bool)

(assert (=> b!433563 (=> (not res!255195) (not e!256333))))

(assert (=> b!433563 (= res!255195 (bvsle from!863 i!563))))

(declare-fun b!433564 () Bool)

(declare-fun Unit!12839 () Unit!12836)

(assert (=> b!433564 (= e!256338 Unit!12839)))

(declare-fun lt!199124 () Unit!12836)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26547 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12836)

(assert (=> b!433564 (= lt!199124 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433564 false))

(declare-fun b!433565 () Bool)

(declare-fun e!256341 () Bool)

(declare-fun mapRes!18657 () Bool)

(assert (=> b!433565 (= e!256341 (and e!256340 mapRes!18657))))

(declare-fun condMapEmpty!18657 () Bool)

(declare-fun mapDefault!18657 () ValueCell!5335)

