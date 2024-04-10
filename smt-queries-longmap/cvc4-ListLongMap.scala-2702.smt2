; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40034 () Bool)

(assert start!40034)

(declare-fun b_free!10301 () Bool)

(declare-fun b_next!10301 () Bool)

(assert (=> start!40034 (= b_free!10301 (not b_next!10301))))

(declare-fun tp!36431 () Bool)

(declare-fun b_and!18261 () Bool)

(assert (=> start!40034 (= tp!36431 b_and!18261)))

(declare-fun b!436532 () Bool)

(declare-datatypes ((Unit!12986 0))(
  ( (Unit!12987) )
))
(declare-fun e!257772 () Unit!12986)

(declare-fun Unit!12988 () Unit!12986)

(assert (=> b!436532 (= e!257772 Unit!12988)))

(declare-fun b!436533 () Bool)

(declare-fun e!257773 () Bool)

(assert (=> b!436533 (= e!257773 true)))

(declare-datatypes ((V!16375 0))(
  ( (V!16376 (val!5771 Int)) )
))
(declare-datatypes ((tuple2!7648 0))(
  ( (tuple2!7649 (_1!3835 (_ BitVec 64)) (_2!3835 V!16375)) )
))
(declare-datatypes ((List!7647 0))(
  ( (Nil!7644) (Cons!7643 (h!8499 tuple2!7648) (t!13397 List!7647)) )
))
(declare-datatypes ((ListLongMap!6561 0))(
  ( (ListLongMap!6562 (toList!3296 List!7647)) )
))
(declare-fun lt!201284 () ListLongMap!6561)

(declare-fun lt!201290 () ListLongMap!6561)

(declare-fun lt!201276 () tuple2!7648)

(declare-fun lt!201288 () tuple2!7648)

(declare-fun +!1443 (ListLongMap!6561 tuple2!7648) ListLongMap!6561)

(assert (=> b!436533 (= lt!201284 (+!1443 (+!1443 lt!201290 lt!201276) lt!201288))))

(declare-fun lt!201278 () V!16375)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16375)

(declare-fun lt!201277 () Unit!12986)

(declare-datatypes ((array!26731 0))(
  ( (array!26732 (arr!12815 (Array (_ BitVec 32) (_ BitVec 64))) (size!13167 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26731)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!424 (ListLongMap!6561 (_ BitVec 64) V!16375 (_ BitVec 64) V!16375) Unit!12986)

(assert (=> b!436533 (= lt!201277 (addCommutativeForDiffKeys!424 lt!201290 k!794 v!412 (select (arr!12815 _keys!709) from!863) lt!201278))))

(declare-fun b!436534 () Bool)

(declare-fun e!257780 () Bool)

(declare-fun e!257775 () Bool)

(assert (=> b!436534 (= e!257780 e!257775)))

(declare-fun res!257354 () Bool)

(assert (=> b!436534 (=> (not res!257354) (not e!257775))))

(declare-fun lt!201282 () array!26731)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26731 (_ BitVec 32)) Bool)

(assert (=> b!436534 (= res!257354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201282 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436534 (= lt!201282 (array!26732 (store (arr!12815 _keys!709) i!563 k!794) (size!13167 _keys!709)))))

(declare-fun b!436535 () Bool)

(declare-fun res!257341 () Bool)

(assert (=> b!436535 (=> (not res!257341) (not e!257780))))

(assert (=> b!436535 (= res!257341 (or (= (select (arr!12815 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12815 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436536 () Bool)

(declare-fun res!257347 () Bool)

(assert (=> b!436536 (=> (not res!257347) (not e!257780))))

(assert (=> b!436536 (= res!257347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436537 () Bool)

(declare-fun res!257350 () Bool)

(assert (=> b!436537 (=> (not res!257350) (not e!257780))))

(declare-fun arrayContainsKey!0 (array!26731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436537 (= res!257350 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!436538 () Bool)

(declare-fun e!257778 () Bool)

(declare-fun tp_is_empty!11453 () Bool)

(assert (=> b!436538 (= e!257778 tp_is_empty!11453)))

(declare-fun b!436539 () Bool)

(declare-fun e!257781 () Bool)

(declare-fun e!257774 () Bool)

(declare-fun mapRes!18801 () Bool)

(assert (=> b!436539 (= e!257781 (and e!257774 mapRes!18801))))

(declare-fun condMapEmpty!18801 () Bool)

(declare-datatypes ((ValueCell!5383 0))(
  ( (ValueCellFull!5383 (v!8018 V!16375)) (EmptyCell!5383) )
))
(declare-datatypes ((array!26733 0))(
  ( (array!26734 (arr!12816 (Array (_ BitVec 32) ValueCell!5383)) (size!13168 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26733)

(declare-fun mapDefault!18801 () ValueCell!5383)

