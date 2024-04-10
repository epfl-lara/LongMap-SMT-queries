; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37596 () Bool)

(assert start!37596)

(declare-fun b_free!8723 () Bool)

(declare-fun b_next!8723 () Bool)

(assert (=> start!37596 (= b_free!8723 (not b_next!8723))))

(declare-fun tp!30884 () Bool)

(declare-fun b_and!15965 () Bool)

(assert (=> start!37596 (= tp!30884 b_and!15965)))

(declare-fun b!384469 () Bool)

(declare-fun res!219125 () Bool)

(declare-fun e!233422 () Bool)

(assert (=> b!384469 (=> (not res!219125) (not e!233422))))

(declare-datatypes ((array!22645 0))(
  ( (array!22646 (arr!10791 (Array (_ BitVec 32) (_ BitVec 64))) (size!11143 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22645)

(declare-datatypes ((List!6203 0))(
  ( (Nil!6200) (Cons!6199 (h!7055 (_ BitVec 64)) (t!11353 List!6203)) )
))
(declare-fun arrayNoDuplicates!0 (array!22645 (_ BitVec 32) List!6203) Bool)

(assert (=> b!384469 (= res!219125 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6200))))

(declare-fun b!384470 () Bool)

(declare-fun res!219124 () Bool)

(assert (=> b!384470 (=> (not res!219124) (not e!233422))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384470 (= res!219124 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11143 _keys!658))))))

(declare-fun b!384471 () Bool)

(declare-fun e!233423 () Bool)

(assert (=> b!384471 (= e!233422 e!233423)))

(declare-fun res!219123 () Bool)

(assert (=> b!384471 (=> (not res!219123) (not e!233423))))

(declare-fun lt!180910 () array!22645)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22645 (_ BitVec 32)) Bool)

(assert (=> b!384471 (= res!219123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180910 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!384471 (= lt!180910 (array!22646 (store (arr!10791 _keys!658) i!548 k!778) (size!11143 _keys!658)))))

(declare-fun res!219121 () Bool)

(assert (=> start!37596 (=> (not res!219121) (not e!233422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37596 (= res!219121 (validMask!0 mask!970))))

(assert (=> start!37596 e!233422))

(declare-datatypes ((V!13599 0))(
  ( (V!13600 (val!4730 Int)) )
))
(declare-datatypes ((ValueCell!4342 0))(
  ( (ValueCellFull!4342 (v!6927 V!13599)) (EmptyCell!4342) )
))
(declare-datatypes ((array!22647 0))(
  ( (array!22648 (arr!10792 (Array (_ BitVec 32) ValueCell!4342)) (size!11144 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22647)

(declare-fun e!233424 () Bool)

(declare-fun array_inv!7946 (array!22647) Bool)

(assert (=> start!37596 (and (array_inv!7946 _values!506) e!233424)))

(assert (=> start!37596 tp!30884))

(assert (=> start!37596 true))

(declare-fun tp_is_empty!9371 () Bool)

(assert (=> start!37596 tp_is_empty!9371))

(declare-fun array_inv!7947 (array!22645) Bool)

(assert (=> start!37596 (array_inv!7947 _keys!658)))

(declare-fun b!384472 () Bool)

(declare-fun res!219129 () Bool)

(assert (=> b!384472 (=> (not res!219129) (not e!233422))))

(assert (=> b!384472 (= res!219129 (or (= (select (arr!10791 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10791 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384473 () Bool)

(declare-fun e!233421 () Bool)

(assert (=> b!384473 (= e!233421 tp_is_empty!9371)))

(declare-fun b!384474 () Bool)

(declare-fun e!233420 () Bool)

(assert (=> b!384474 (= e!233420 true)))

(declare-datatypes ((tuple2!6368 0))(
  ( (tuple2!6369 (_1!3195 (_ BitVec 64)) (_2!3195 V!13599)) )
))
(declare-datatypes ((List!6204 0))(
  ( (Nil!6201) (Cons!6200 (h!7056 tuple2!6368) (t!11354 List!6204)) )
))
(declare-datatypes ((ListLongMap!5281 0))(
  ( (ListLongMap!5282 (toList!2656 List!6204)) )
))
(declare-fun lt!180914 () ListLongMap!5281)

(declare-fun lt!180918 () ListLongMap!5281)

(declare-fun lt!180908 () tuple2!6368)

(declare-fun +!991 (ListLongMap!5281 tuple2!6368) ListLongMap!5281)

(assert (=> b!384474 (= lt!180914 (+!991 lt!180918 lt!180908))))

(declare-fun lt!180909 () ListLongMap!5281)

(declare-fun lt!180915 () ListLongMap!5281)

(assert (=> b!384474 (= lt!180909 lt!180915)))

(declare-fun b!384475 () Bool)

(declare-fun mapRes!15621 () Bool)

(assert (=> b!384475 (= e!233424 (and e!233421 mapRes!15621))))

(declare-fun condMapEmpty!15621 () Bool)

(declare-fun mapDefault!15621 () ValueCell!4342)

