; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39862 () Bool)

(assert start!39862)

(declare-fun b_free!10129 () Bool)

(declare-fun b_next!10129 () Bool)

(assert (=> start!39862 (= b_free!10129 (not b_next!10129))))

(declare-fun tp!35916 () Bool)

(declare-fun b_and!17917 () Bool)

(assert (=> start!39862 (= tp!35916 b_and!17917)))

(declare-fun b!431200 () Bool)

(declare-fun e!255196 () Bool)

(declare-fun tp_is_empty!11281 () Bool)

(assert (=> b!431200 (= e!255196 tp_is_empty!11281)))

(declare-fun mapIsEmpty!18543 () Bool)

(declare-fun mapRes!18543 () Bool)

(assert (=> mapIsEmpty!18543 mapRes!18543))

(declare-fun b!431201 () Bool)

(declare-fun res!253477 () Bool)

(declare-fun e!255193 () Bool)

(assert (=> b!431201 (=> (not res!253477) (not e!255193))))

(declare-datatypes ((array!26397 0))(
  ( (array!26398 (arr!12648 (Array (_ BitVec 32) (_ BitVec 64))) (size!13000 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26397)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16147 0))(
  ( (V!16148 (val!5685 Int)) )
))
(declare-datatypes ((ValueCell!5297 0))(
  ( (ValueCellFull!5297 (v!7932 V!16147)) (EmptyCell!5297) )
))
(declare-datatypes ((array!26399 0))(
  ( (array!26400 (arr!12649 (Array (_ BitVec 32) ValueCell!5297)) (size!13001 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26399)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!431201 (= res!253477 (and (= (size!13001 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13000 _keys!709) (size!13001 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431202 () Bool)

(declare-datatypes ((Unit!12704 0))(
  ( (Unit!12705) )
))
(declare-fun e!255200 () Unit!12704)

(declare-fun Unit!12706 () Unit!12704)

(assert (=> b!431202 (= e!255200 Unit!12706)))

(declare-fun lt!197407 () Unit!12704)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26397 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12704)

(assert (=> b!431202 (= lt!197407 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431202 false))

(declare-fun b!431203 () Bool)

(declare-fun e!255192 () Bool)

(assert (=> b!431203 (= e!255192 true)))

(declare-datatypes ((tuple2!7494 0))(
  ( (tuple2!7495 (_1!3758 (_ BitVec 64)) (_2!3758 V!16147)) )
))
(declare-fun lt!197415 () tuple2!7494)

(declare-datatypes ((List!7510 0))(
  ( (Nil!7507) (Cons!7506 (h!8362 tuple2!7494) (t!13088 List!7510)) )
))
(declare-datatypes ((ListLongMap!6407 0))(
  ( (ListLongMap!6408 (toList!3219 List!7510)) )
))
(declare-fun lt!197417 () ListLongMap!6407)

(declare-fun lt!197408 () ListLongMap!6407)

(declare-fun lt!197406 () tuple2!7494)

(declare-fun +!1367 (ListLongMap!6407 tuple2!7494) ListLongMap!6407)

(assert (=> b!431203 (= lt!197408 (+!1367 (+!1367 lt!197417 lt!197406) lt!197415))))

(declare-fun lt!197413 () V!16147)

(declare-fun lt!197412 () Unit!12704)

(declare-fun v!412 () V!16147)

(declare-fun addCommutativeForDiffKeys!361 (ListLongMap!6407 (_ BitVec 64) V!16147 (_ BitVec 64) V!16147) Unit!12704)

(assert (=> b!431203 (= lt!197412 (addCommutativeForDiffKeys!361 lt!197417 k!794 v!412 (select (arr!12648 _keys!709) from!863) lt!197413))))

(declare-fun b!431204 () Bool)

(declare-fun res!253479 () Bool)

(assert (=> b!431204 (=> (not res!253479) (not e!255193))))

(declare-datatypes ((List!7511 0))(
  ( (Nil!7508) (Cons!7507 (h!8363 (_ BitVec 64)) (t!13089 List!7511)) )
))
(declare-fun arrayNoDuplicates!0 (array!26397 (_ BitVec 32) List!7511) Bool)

(assert (=> b!431204 (= res!253479 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7508))))

(declare-fun b!431205 () Bool)

(declare-fun res!253484 () Bool)

(assert (=> b!431205 (=> (not res!253484) (not e!255193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431205 (= res!253484 (validMask!0 mask!1025))))

(declare-fun b!431206 () Bool)

(declare-fun res!253480 () Bool)

(assert (=> b!431206 (=> (not res!253480) (not e!255193))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431206 (= res!253480 (or (= (select (arr!12648 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12648 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431207 () Bool)

(declare-fun e!255197 () Bool)

(assert (=> b!431207 (= e!255197 (and e!255196 mapRes!18543))))

(declare-fun condMapEmpty!18543 () Bool)

(declare-fun mapDefault!18543 () ValueCell!5297)

