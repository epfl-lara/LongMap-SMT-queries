; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20320 () Bool)

(assert start!20320)

(declare-fun b_free!4979 () Bool)

(declare-fun b_next!4979 () Bool)

(assert (=> start!20320 (= b_free!4979 (not b_next!4979))))

(declare-fun tp!17968 () Bool)

(declare-fun b_and!11725 () Bool)

(assert (=> start!20320 (= tp!17968 b_and!11725)))

(declare-fun mapIsEmpty!8321 () Bool)

(declare-fun mapRes!8321 () Bool)

(assert (=> mapIsEmpty!8321 mapRes!8321))

(declare-fun b!200258 () Bool)

(declare-fun res!95376 () Bool)

(declare-fun e!131336 () Bool)

(assert (=> b!200258 (=> (not res!95376) (not e!131336))))

(declare-datatypes ((V!6093 0))(
  ( (V!6094 (val!2462 Int)) )
))
(declare-datatypes ((tuple2!3720 0))(
  ( (tuple2!3721 (_1!1871 (_ BitVec 64)) (_2!1871 V!6093)) )
))
(declare-fun lt!98819 () tuple2!3720)

(declare-fun lt!98826 () tuple2!3720)

(declare-datatypes ((List!2637 0))(
  ( (Nil!2634) (Cons!2633 (h!3275 tuple2!3720) (t!7568 List!2637)) )
))
(declare-datatypes ((ListLongMap!2633 0))(
  ( (ListLongMap!2634 (toList!1332 List!2637)) )
))
(declare-fun lt!98820 () ListLongMap!2633)

(declare-fun lt!98821 () ListLongMap!2633)

(declare-fun +!359 (ListLongMap!2633 tuple2!3720) ListLongMap!2633)

(assert (=> b!200258 (= res!95376 (= lt!98820 (+!359 (+!359 lt!98821 lt!98826) lt!98819)))))

(declare-fun b!200259 () Bool)

(declare-fun e!131341 () Bool)

(declare-fun tp_is_empty!4835 () Bool)

(assert (=> b!200259 (= e!131341 tp_is_empty!4835)))

(declare-fun b!200260 () Bool)

(declare-fun res!95373 () Bool)

(declare-fun e!131338 () Bool)

(assert (=> b!200260 (=> (not res!95373) (not e!131338))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200260 (= res!95373 (validKeyInArray!0 k!843))))

(declare-fun b!200261 () Bool)

(declare-fun e!131340 () Bool)

(declare-fun e!131337 () Bool)

(assert (=> b!200261 (= e!131340 (and e!131337 mapRes!8321))))

(declare-fun condMapEmpty!8321 () Bool)

(declare-datatypes ((ValueCell!2074 0))(
  ( (ValueCellFull!2074 (v!4432 V!6093)) (EmptyCell!2074) )
))
(declare-datatypes ((array!8905 0))(
  ( (array!8906 (arr!4203 (Array (_ BitVec 32) ValueCell!2074)) (size!4528 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8905)

(declare-fun mapDefault!8321 () ValueCell!2074)

