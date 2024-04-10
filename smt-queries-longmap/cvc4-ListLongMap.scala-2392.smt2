; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37862 () Bool)

(assert start!37862)

(declare-fun b_free!8921 () Bool)

(declare-fun b_next!8921 () Bool)

(assert (=> start!37862 (= b_free!8921 (not b_next!8921))))

(declare-fun tp!31520 () Bool)

(declare-fun b_and!16187 () Bool)

(assert (=> start!37862 (= tp!31520 b_and!16187)))

(declare-fun b!389108 () Bool)

(declare-fun res!222540 () Bool)

(declare-fun e!235753 () Bool)

(assert (=> b!389108 (=> (not res!222540) (not e!235753))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389108 (= res!222540 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!15960 () Bool)

(declare-fun mapRes!15960 () Bool)

(declare-fun tp!31521 () Bool)

(declare-fun e!235759 () Bool)

(assert (=> mapNonEmpty!15960 (= mapRes!15960 (and tp!31521 e!235759))))

(declare-datatypes ((V!13895 0))(
  ( (V!13896 (val!4841 Int)) )
))
(declare-datatypes ((ValueCell!4453 0))(
  ( (ValueCellFull!4453 (v!7046 V!13895)) (EmptyCell!4453) )
))
(declare-fun mapValue!15960 () ValueCell!4453)

(declare-datatypes ((array!23081 0))(
  ( (array!23082 (arr!11007 (Array (_ BitVec 32) ValueCell!4453)) (size!11359 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23081)

(declare-fun mapKey!15960 () (_ BitVec 32))

(declare-fun mapRest!15960 () (Array (_ BitVec 32) ValueCell!4453))

(assert (=> mapNonEmpty!15960 (= (arr!11007 _values!506) (store mapRest!15960 mapKey!15960 mapValue!15960))))

(declare-fun b!389109 () Bool)

(declare-fun e!235755 () Bool)

(declare-fun e!235756 () Bool)

(assert (=> b!389109 (= e!235755 (and e!235756 mapRes!15960))))

(declare-fun condMapEmpty!15960 () Bool)

(declare-fun mapDefault!15960 () ValueCell!4453)

