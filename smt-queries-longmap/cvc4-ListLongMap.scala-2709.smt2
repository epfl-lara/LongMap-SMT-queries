; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40076 () Bool)

(assert start!40076)

(declare-fun b_free!10343 () Bool)

(declare-fun b_next!10343 () Bool)

(assert (=> start!40076 (= b_free!10343 (not b_next!10343))))

(declare-fun tp!36557 () Bool)

(declare-fun b_and!18311 () Bool)

(assert (=> start!40076 (= tp!36557 b_and!18311)))

(declare-fun b!437588 () Bool)

(declare-fun res!258188 () Bool)

(declare-fun e!258246 () Bool)

(assert (=> b!437588 (=> (not res!258188) (not e!258246))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437588 (= res!258188 (validKeyInArray!0 k!794))))

(declare-fun b!437589 () Bool)

(declare-fun e!258249 () Bool)

(declare-fun tp_is_empty!11495 () Bool)

(assert (=> b!437589 (= e!258249 tp_is_empty!11495)))

(declare-fun b!437590 () Bool)

(declare-fun res!258191 () Bool)

(assert (=> b!437590 (=> (not res!258191) (not e!258246))))

(declare-datatypes ((array!26809 0))(
  ( (array!26810 (arr!12854 (Array (_ BitVec 32) (_ BitVec 64))) (size!13206 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26809)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437590 (= res!258191 (or (= (select (arr!12854 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12854 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437591 () Bool)

(declare-fun e!258248 () Bool)

(declare-fun e!258245 () Bool)

(declare-fun mapRes!18864 () Bool)

(assert (=> b!437591 (= e!258248 (and e!258245 mapRes!18864))))

(declare-fun condMapEmpty!18864 () Bool)

(declare-datatypes ((V!16431 0))(
  ( (V!16432 (val!5792 Int)) )
))
(declare-datatypes ((ValueCell!5404 0))(
  ( (ValueCellFull!5404 (v!8039 V!16431)) (EmptyCell!5404) )
))
(declare-datatypes ((array!26811 0))(
  ( (array!26812 (arr!12855 (Array (_ BitVec 32) ValueCell!5404)) (size!13207 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26811)

(declare-fun mapDefault!18864 () ValueCell!5404)

