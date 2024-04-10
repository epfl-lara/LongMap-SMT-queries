; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39454 () Bool)

(assert start!39454)

(declare-fun b_free!9721 () Bool)

(declare-fun b_next!9721 () Bool)

(assert (=> start!39454 (= b_free!9721 (not b_next!9721))))

(declare-fun tp!34691 () Bool)

(declare-fun b_and!17317 () Bool)

(assert (=> start!39454 (= tp!34691 b_and!17317)))

(declare-fun b!420557 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((V!15603 0))(
  ( (V!15604 (val!5481 Int)) )
))
(declare-datatypes ((tuple2!7184 0))(
  ( (tuple2!7185 (_1!3603 (_ BitVec 64)) (_2!3603 V!15603)) )
))
(declare-datatypes ((List!7191 0))(
  ( (Nil!7188) (Cons!7187 (h!8043 tuple2!7184) (t!12577 List!7191)) )
))
(declare-datatypes ((ListLongMap!6097 0))(
  ( (ListLongMap!6098 (toList!3064 List!7191)) )
))
(declare-fun call!29342 () ListLongMap!6097)

(declare-fun e!250490 () Bool)

(declare-fun call!29341 () ListLongMap!6097)

(declare-fun v!412 () V!15603)

(declare-fun +!1261 (ListLongMap!6097 tuple2!7184) ListLongMap!6097)

(assert (=> b!420557 (= e!250490 (= call!29342 (+!1261 call!29341 (tuple2!7185 k!794 v!412))))))

(declare-fun b!420558 () Bool)

(declare-fun res!245328 () Bool)

(declare-fun e!250491 () Bool)

(assert (=> b!420558 (=> (not res!245328) (not e!250491))))

(declare-datatypes ((array!25595 0))(
  ( (array!25596 (arr!12247 (Array (_ BitVec 32) (_ BitVec 64))) (size!12599 (_ BitVec 32))) )
))
(declare-fun lt!192970 () array!25595)

(declare-datatypes ((List!7192 0))(
  ( (Nil!7189) (Cons!7188 (h!8044 (_ BitVec 64)) (t!12578 List!7192)) )
))
(declare-fun arrayNoDuplicates!0 (array!25595 (_ BitVec 32) List!7192) Bool)

(assert (=> b!420558 (= res!245328 (arrayNoDuplicates!0 lt!192970 #b00000000000000000000000000000000 Nil!7189))))

(declare-fun b!420559 () Bool)

(declare-fun e!250486 () Bool)

(declare-fun e!250485 () Bool)

(declare-fun mapRes!17931 () Bool)

(assert (=> b!420559 (= e!250486 (and e!250485 mapRes!17931))))

(declare-fun condMapEmpty!17931 () Bool)

(declare-datatypes ((ValueCell!5093 0))(
  ( (ValueCellFull!5093 (v!7728 V!15603)) (EmptyCell!5093) )
))
(declare-datatypes ((array!25597 0))(
  ( (array!25598 (arr!12248 (Array (_ BitVec 32) ValueCell!5093)) (size!12600 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25597)

(declare-fun mapDefault!17931 () ValueCell!5093)

