; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20502 () Bool)

(assert start!20502)

(declare-fun b_free!5161 () Bool)

(declare-fun b_next!5161 () Bool)

(assert (=> start!20502 (= b_free!5161 (not b_next!5161))))

(declare-fun tp!18515 () Bool)

(declare-fun b_and!11907 () Bool)

(assert (=> start!20502 (= tp!18515 b_and!11907)))

(declare-fun b!203535 () Bool)

(declare-fun e!133239 () Bool)

(declare-fun tp_is_empty!5017 () Bool)

(assert (=> b!203535 (= e!133239 tp_is_empty!5017)))

(declare-fun b!203536 () Bool)

(declare-fun res!97829 () Bool)

(declare-fun e!133242 () Bool)

(assert (=> b!203536 (=> (not res!97829) (not e!133242))))

(declare-datatypes ((array!9257 0))(
  ( (array!9258 (arr!4379 (Array (_ BitVec 32) (_ BitVec 64))) (size!4704 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9257)

(declare-datatypes ((List!2777 0))(
  ( (Nil!2774) (Cons!2773 (h!3415 (_ BitVec 64)) (t!7708 List!2777)) )
))
(declare-fun arrayNoDuplicates!0 (array!9257 (_ BitVec 32) List!2777) Bool)

(assert (=> b!203536 (= res!97829 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2774))))

(declare-fun mapIsEmpty!8594 () Bool)

(declare-fun mapRes!8594 () Bool)

(assert (=> mapIsEmpty!8594 mapRes!8594))

(declare-fun b!203537 () Bool)

(declare-fun res!97830 () Bool)

(assert (=> b!203537 (=> (not res!97830) (not e!133242))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203537 (= res!97830 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4704 _keys!825))))))

(declare-fun b!203538 () Bool)

(declare-fun e!133243 () Bool)

(assert (=> b!203538 (= e!133243 (and e!133239 mapRes!8594))))

(declare-fun condMapEmpty!8594 () Bool)

(declare-datatypes ((V!6337 0))(
  ( (V!6338 (val!2553 Int)) )
))
(declare-datatypes ((ValueCell!2165 0))(
  ( (ValueCellFull!2165 (v!4523 V!6337)) (EmptyCell!2165) )
))
(declare-datatypes ((array!9259 0))(
  ( (array!9260 (arr!4380 (Array (_ BitVec 32) ValueCell!2165)) (size!4705 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9259)

(declare-fun mapDefault!8594 () ValueCell!2165)

