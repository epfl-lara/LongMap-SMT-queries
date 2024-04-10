; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39950 () Bool)

(assert start!39950)

(declare-fun b_free!10217 () Bool)

(declare-fun b_next!10217 () Bool)

(assert (=> start!39950 (= b_free!10217 (not b_next!10217))))

(declare-fun tp!36179 () Bool)

(declare-fun b_and!18093 () Bool)

(assert (=> start!39950 (= tp!36179 b_and!18093)))

(declare-fun res!255460 () Bool)

(declare-fun e!256520 () Bool)

(assert (=> start!39950 (=> (not res!255460) (not e!256520))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26571 0))(
  ( (array!26572 (arr!12735 (Array (_ BitVec 32) (_ BitVec 64))) (size!13087 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26571)

(assert (=> start!39950 (= res!255460 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13087 _keys!709))))))

(assert (=> start!39950 e!256520))

(declare-fun tp_is_empty!11369 () Bool)

(assert (=> start!39950 tp_is_empty!11369))

(assert (=> start!39950 tp!36179))

(assert (=> start!39950 true))

(declare-datatypes ((V!16263 0))(
  ( (V!16264 (val!5729 Int)) )
))
(declare-datatypes ((ValueCell!5341 0))(
  ( (ValueCellFull!5341 (v!7976 V!16263)) (EmptyCell!5341) )
))
(declare-datatypes ((array!26573 0))(
  ( (array!26574 (arr!12736 (Array (_ BitVec 32) ValueCell!5341)) (size!13088 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26573)

(declare-fun e!256517 () Bool)

(declare-fun array_inv!9266 (array!26573) Bool)

(assert (=> start!39950 (and (array_inv!9266 _values!549) e!256517)))

(declare-fun array_inv!9267 (array!26571) Bool)

(assert (=> start!39950 (array_inv!9267 _keys!709)))

(declare-fun b!433928 () Bool)

(declare-fun e!256518 () Bool)

(assert (=> b!433928 (= e!256518 true)))

(declare-datatypes ((tuple2!7576 0))(
  ( (tuple2!7577 (_1!3799 (_ BitVec 64)) (_2!3799 V!16263)) )
))
(declare-fun lt!199391 () tuple2!7576)

(declare-datatypes ((List!7583 0))(
  ( (Nil!7580) (Cons!7579 (h!8435 tuple2!7576) (t!13249 List!7583)) )
))
(declare-datatypes ((ListLongMap!6489 0))(
  ( (ListLongMap!6490 (toList!3260 List!7583)) )
))
(declare-fun lt!199398 () ListLongMap!6489)

(declare-fun lt!199392 () ListLongMap!6489)

(declare-fun lt!199399 () tuple2!7576)

(declare-fun +!1408 (ListLongMap!6489 tuple2!7576) ListLongMap!6489)

(assert (=> b!433928 (= lt!199392 (+!1408 (+!1408 lt!199398 lt!199399) lt!199391))))

(declare-datatypes ((Unit!12857 0))(
  ( (Unit!12858) )
))
(declare-fun lt!199386 () Unit!12857)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!199395 () V!16263)

(declare-fun v!412 () V!16263)

(declare-fun addCommutativeForDiffKeys!396 (ListLongMap!6489 (_ BitVec 64) V!16263 (_ BitVec 64) V!16263) Unit!12857)

(assert (=> b!433928 (= lt!199386 (addCommutativeForDiffKeys!396 lt!199398 k!794 v!412 (select (arr!12735 _keys!709) from!863) lt!199395))))

(declare-fun b!433929 () Bool)

(declare-fun e!256512 () Bool)

(declare-fun e!256516 () Bool)

(assert (=> b!433929 (= e!256512 e!256516)))

(declare-fun res!255458 () Bool)

(assert (=> b!433929 (=> (not res!255458) (not e!256516))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433929 (= res!255458 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16263)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!199389 () array!26573)

(declare-fun lt!199400 () array!26571)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!199394 () ListLongMap!6489)

(declare-fun zeroValue!515 () V!16263)

(declare-fun getCurrentListMapNoExtraKeys!1454 (array!26571 array!26573 (_ BitVec 32) (_ BitVec 32) V!16263 V!16263 (_ BitVec 32) Int) ListLongMap!6489)

(assert (=> b!433929 (= lt!199394 (getCurrentListMapNoExtraKeys!1454 lt!199400 lt!199389 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433929 (= lt!199389 (array!26574 (store (arr!12736 _values!549) i!563 (ValueCellFull!5341 v!412)) (size!13088 _values!549)))))

(declare-fun lt!199390 () ListLongMap!6489)

(assert (=> b!433929 (= lt!199390 (getCurrentListMapNoExtraKeys!1454 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433930 () Bool)

(declare-fun res!255451 () Bool)

(assert (=> b!433930 (=> (not res!255451) (not e!256520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26571 (_ BitVec 32)) Bool)

(assert (=> b!433930 (= res!255451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433931 () Bool)

(declare-fun res!255457 () Bool)

(assert (=> b!433931 (=> (not res!255457) (not e!256520))))

(declare-fun arrayContainsKey!0 (array!26571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433931 (= res!255457 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!433932 () Bool)

(declare-fun e!256514 () Bool)

(declare-fun mapRes!18675 () Bool)

(assert (=> b!433932 (= e!256517 (and e!256514 mapRes!18675))))

(declare-fun condMapEmpty!18675 () Bool)

(declare-fun mapDefault!18675 () ValueCell!5341)

