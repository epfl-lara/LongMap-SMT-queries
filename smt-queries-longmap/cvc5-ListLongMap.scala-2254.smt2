; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36986 () Bool)

(assert start!36986)

(declare-fun b_free!8113 () Bool)

(declare-fun b_next!8113 () Bool)

(assert (=> start!36986 (= b_free!8113 (not b_next!8113))))

(declare-fun tp!29054 () Bool)

(declare-fun b_and!15355 () Bool)

(assert (=> start!36986 (= tp!29054 b_and!15355)))

(declare-fun b!371243 () Bool)

(declare-fun e!226631 () Bool)

(declare-fun tp_is_empty!8761 () Bool)

(assert (=> b!371243 (= e!226631 tp_is_empty!8761)))

(declare-fun b!371244 () Bool)

(declare-fun e!226627 () Bool)

(declare-fun e!226629 () Bool)

(declare-fun mapRes!14706 () Bool)

(assert (=> b!371244 (= e!226627 (and e!226629 mapRes!14706))))

(declare-fun condMapEmpty!14706 () Bool)

(declare-datatypes ((V!12787 0))(
  ( (V!12788 (val!4425 Int)) )
))
(declare-datatypes ((ValueCell!4037 0))(
  ( (ValueCellFull!4037 (v!6622 V!12787)) (EmptyCell!4037) )
))
(declare-datatypes ((array!21465 0))(
  ( (array!21466 (arr!10201 (Array (_ BitVec 32) ValueCell!4037)) (size!10553 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21465)

(declare-fun mapDefault!14706 () ValueCell!4037)

