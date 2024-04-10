; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37634 () Bool)

(assert start!37634)

(declare-fun b_free!8761 () Bool)

(declare-fun b_next!8761 () Bool)

(assert (=> start!37634 (= b_free!8761 (not b_next!8761))))

(declare-fun tp!30999 () Bool)

(declare-fun b_and!16003 () Bool)

(assert (=> start!37634 (= tp!30999 b_and!16003)))

(declare-fun b!385269 () Bool)

(declare-fun res!219757 () Bool)

(declare-fun e!233824 () Bool)

(assert (=> b!385269 (=> (not res!219757) (not e!233824))))

(declare-datatypes ((array!22719 0))(
  ( (array!22720 (arr!10828 (Array (_ BitVec 32) (_ BitVec 64))) (size!11180 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22719)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22719 (_ BitVec 32)) Bool)

(assert (=> b!385269 (= res!219757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385270 () Bool)

(declare-fun e!233826 () Bool)

(assert (=> b!385270 (= e!233824 e!233826)))

(declare-fun res!219753 () Bool)

(assert (=> b!385270 (=> (not res!219753) (not e!233826))))

(declare-fun lt!181533 () array!22719)

(assert (=> b!385270 (= res!219753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181533 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385270 (= lt!181533 (array!22720 (store (arr!10828 _keys!658) i!548 k!778) (size!11180 _keys!658)))))

(declare-fun b!385271 () Bool)

(declare-fun res!219759 () Bool)

(assert (=> b!385271 (=> (not res!219759) (not e!233824))))

(declare-datatypes ((List!6233 0))(
  ( (Nil!6230) (Cons!6229 (h!7085 (_ BitVec 64)) (t!11383 List!6233)) )
))
(declare-fun arrayNoDuplicates!0 (array!22719 (_ BitVec 32) List!6233) Bool)

(assert (=> b!385271 (= res!219759 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6230))))

(declare-fun b!385272 () Bool)

(declare-fun e!233823 () Bool)

(assert (=> b!385272 (= e!233823 (bvsle #b00000000000000000000000000000000 (size!11180 _keys!658)))))

(declare-fun res!219760 () Bool)

(assert (=> start!37634 (=> (not res!219760) (not e!233824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37634 (= res!219760 (validMask!0 mask!970))))

(assert (=> start!37634 e!233824))

(declare-datatypes ((V!13651 0))(
  ( (V!13652 (val!4749 Int)) )
))
(declare-datatypes ((ValueCell!4361 0))(
  ( (ValueCellFull!4361 (v!6946 V!13651)) (EmptyCell!4361) )
))
(declare-datatypes ((array!22721 0))(
  ( (array!22722 (arr!10829 (Array (_ BitVec 32) ValueCell!4361)) (size!11181 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22721)

(declare-fun e!233828 () Bool)

(declare-fun array_inv!7970 (array!22721) Bool)

(assert (=> start!37634 (and (array_inv!7970 _values!506) e!233828)))

(assert (=> start!37634 tp!30999))

(assert (=> start!37634 true))

(declare-fun tp_is_empty!9409 () Bool)

(assert (=> start!37634 tp_is_empty!9409))

(declare-fun array_inv!7971 (array!22719) Bool)

(assert (=> start!37634 (array_inv!7971 _keys!658)))

(declare-fun b!385273 () Bool)

(declare-fun e!233821 () Bool)

(assert (=> b!385273 (= e!233821 e!233823)))

(declare-fun res!219750 () Bool)

(assert (=> b!385273 (=> res!219750 e!233823)))

(declare-datatypes ((tuple2!6398 0))(
  ( (tuple2!6399 (_1!3210 (_ BitVec 64)) (_2!3210 V!13651)) )
))
(declare-fun lt!181539 () tuple2!6398)

(declare-datatypes ((List!6234 0))(
  ( (Nil!6231) (Cons!6230 (h!7086 tuple2!6398) (t!11384 List!6234)) )
))
(declare-datatypes ((ListLongMap!5311 0))(
  ( (ListLongMap!5312 (toList!2671 List!6234)) )
))
(declare-fun lt!181534 () ListLongMap!5311)

(declare-fun lt!181538 () ListLongMap!5311)

(declare-fun +!1006 (ListLongMap!5311 tuple2!6398) ListLongMap!5311)

(assert (=> b!385273 (= res!219750 (not (= (+!1006 lt!181538 lt!181539) lt!181534)))))

(declare-fun lt!181541 () ListLongMap!5311)

(assert (=> b!385273 (= lt!181534 lt!181541)))

(declare-fun b!385274 () Bool)

(declare-fun e!233827 () Bool)

(declare-fun mapRes!15678 () Bool)

(assert (=> b!385274 (= e!233828 (and e!233827 mapRes!15678))))

(declare-fun condMapEmpty!15678 () Bool)

(declare-fun mapDefault!15678 () ValueCell!4361)

