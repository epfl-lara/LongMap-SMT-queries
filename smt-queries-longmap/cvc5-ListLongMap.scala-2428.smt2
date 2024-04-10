; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38338 () Bool)

(assert start!38338)

(declare-fun b!395346 () Bool)

(declare-fun e!239359 () Bool)

(declare-fun tp_is_empty!9805 () Bool)

(assert (=> b!395346 (= e!239359 tp_is_empty!9805)))

(declare-fun b!395347 () Bool)

(declare-fun e!239361 () Bool)

(assert (=> b!395347 (= e!239361 tp_is_empty!9805)))

(declare-fun b!395348 () Bool)

(declare-fun e!239360 () Bool)

(assert (=> b!395348 (= e!239360 false)))

(declare-fun lt!187078 () Bool)

(declare-datatypes ((array!23517 0))(
  ( (array!23518 (arr!11211 (Array (_ BitVec 32) (_ BitVec 64))) (size!11563 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23517)

(declare-datatypes ((List!6508 0))(
  ( (Nil!6505) (Cons!6504 (h!7360 (_ BitVec 64)) (t!11682 List!6508)) )
))
(declare-fun arrayNoDuplicates!0 (array!23517 (_ BitVec 32) List!6508) Bool)

(assert (=> b!395348 (= lt!187078 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6505))))

(declare-fun b!395349 () Bool)

(declare-fun e!239358 () Bool)

(declare-fun mapRes!16320 () Bool)

(assert (=> b!395349 (= e!239358 (and e!239361 mapRes!16320))))

(declare-fun condMapEmpty!16320 () Bool)

(declare-datatypes ((V!14179 0))(
  ( (V!14180 (val!4947 Int)) )
))
(declare-datatypes ((ValueCell!4559 0))(
  ( (ValueCellFull!4559 (v!7193 V!14179)) (EmptyCell!4559) )
))
(declare-datatypes ((array!23519 0))(
  ( (array!23520 (arr!11212 (Array (_ BitVec 32) ValueCell!4559)) (size!11564 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23519)

(declare-fun mapDefault!16320 () ValueCell!4559)

