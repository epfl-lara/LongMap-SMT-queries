; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39214 () Bool)

(assert start!39214)

(declare-fun b_free!9481 () Bool)

(declare-fun b_next!9481 () Bool)

(assert (=> start!39214 (= b_free!9481 (not b_next!9481))))

(declare-fun tp!33972 () Bool)

(declare-fun b_and!16867 () Bool)

(assert (=> start!39214 (= tp!33972 b_and!16867)))

(declare-datatypes ((V!15283 0))(
  ( (V!15284 (val!5361 Int)) )
))
(declare-datatypes ((tuple2!6966 0))(
  ( (tuple2!6967 (_1!3494 (_ BitVec 64)) (_2!3494 V!15283)) )
))
(declare-datatypes ((List!6991 0))(
  ( (Nil!6988) (Cons!6987 (h!7843 tuple2!6966) (t!12165 List!6991)) )
))
(declare-datatypes ((ListLongMap!5879 0))(
  ( (ListLongMap!5880 (toList!2955 List!6991)) )
))
(declare-fun call!28621 () ListLongMap!5879)

(declare-fun e!247277 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun b!413541 () Bool)

(declare-fun v!412 () V!15283)

(declare-fun call!28622 () ListLongMap!5879)

(declare-fun +!1165 (ListLongMap!5879 tuple2!6966) ListLongMap!5879)

(assert (=> b!413541 (= e!247277 (= call!28622 (+!1165 call!28621 (tuple2!6967 k!794 v!412))))))

(declare-fun b!413542 () Bool)

(declare-fun res!240322 () Bool)

(declare-fun e!247281 () Bool)

(assert (=> b!413542 (=> (not res!240322) (not e!247281))))

(declare-datatypes ((array!25123 0))(
  ( (array!25124 (arr!12011 (Array (_ BitVec 32) (_ BitVec 64))) (size!12363 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25123)

(declare-fun arrayContainsKey!0 (array!25123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413542 (= res!240322 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!413543 () Bool)

(declare-fun e!247282 () Bool)

(declare-fun e!247278 () Bool)

(declare-fun mapRes!17571 () Bool)

(assert (=> b!413543 (= e!247282 (and e!247278 mapRes!17571))))

(declare-fun condMapEmpty!17571 () Bool)

(declare-datatypes ((ValueCell!4973 0))(
  ( (ValueCellFull!4973 (v!7608 V!15283)) (EmptyCell!4973) )
))
(declare-datatypes ((array!25125 0))(
  ( (array!25126 (arr!12012 (Array (_ BitVec 32) ValueCell!4973)) (size!12364 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25125)

(declare-fun mapDefault!17571 () ValueCell!4973)

