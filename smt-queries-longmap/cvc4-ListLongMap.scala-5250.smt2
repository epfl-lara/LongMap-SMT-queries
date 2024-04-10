; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70604 () Bool)

(assert start!70604)

(declare-fun b_free!12911 () Bool)

(declare-fun b_next!12911 () Bool)

(assert (=> start!70604 (= b_free!12911 (not b_next!12911))))

(declare-fun tp!45469 () Bool)

(declare-fun b_and!21753 () Bool)

(assert (=> start!70604 (= tp!45469 b_and!21753)))

(declare-fun b!820258 () Bool)

(declare-fun e!455692 () Bool)

(declare-datatypes ((V!24495 0))(
  ( (V!24496 (val!7358 Int)) )
))
(declare-datatypes ((tuple2!9694 0))(
  ( (tuple2!9695 (_1!4858 (_ BitVec 64)) (_2!4858 V!24495)) )
))
(declare-datatypes ((List!15516 0))(
  ( (Nil!15513) (Cons!15512 (h!16641 tuple2!9694) (t!21847 List!15516)) )
))
(declare-datatypes ((ListLongMap!8517 0))(
  ( (ListLongMap!8518 (toList!4274 List!15516)) )
))
(declare-fun lt!368606 () ListLongMap!8517)

(declare-fun lt!368604 () ListLongMap!8517)

(declare-fun zeroValueAfter!34 () V!24495)

(declare-fun +!1868 (ListLongMap!8517 tuple2!9694) ListLongMap!8517)

(assert (=> b!820258 (= e!455692 (= lt!368604 (+!1868 lt!368606 (tuple2!9695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820259 () Bool)

(declare-fun e!455691 () Bool)

(declare-fun e!455694 () Bool)

(declare-fun mapRes!23533 () Bool)

(assert (=> b!820259 (= e!455691 (and e!455694 mapRes!23533))))

(declare-fun condMapEmpty!23533 () Bool)

(declare-datatypes ((ValueCell!6895 0))(
  ( (ValueCellFull!6895 (v!9788 V!24495)) (EmptyCell!6895) )
))
(declare-datatypes ((array!45436 0))(
  ( (array!45437 (arr!21771 (Array (_ BitVec 32) ValueCell!6895)) (size!22192 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45436)

(declare-fun mapDefault!23533 () ValueCell!6895)

