; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!800 () Bool)

(assert start!800)

(declare-fun b_free!193 () Bool)

(declare-fun b_next!193 () Bool)

(assert (=> start!800 (= b_free!193 (not b_next!193))))

(declare-fun tp!809 () Bool)

(declare-fun b_and!339 () Bool)

(assert (=> start!800 (= tp!809 b_and!339)))

(declare-fun b!5940 () Bool)

(declare-fun e!3238 () Bool)

(declare-fun e!3236 () Bool)

(declare-fun mapRes!377 () Bool)

(assert (=> b!5940 (= e!3238 (and e!3236 mapRes!377))))

(declare-fun condMapEmpty!377 () Bool)

(declare-datatypes ((V!539 0))(
  ( (V!540 (val!141 Int)) )
))
(declare-datatypes ((ValueCell!119 0))(
  ( (ValueCellFull!119 (v!1232 V!539)) (EmptyCell!119) )
))
(declare-datatypes ((array!477 0))(
  ( (array!478 (arr!227 (Array (_ BitVec 32) ValueCell!119)) (size!289 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!477)

(declare-fun mapDefault!377 () ValueCell!119)

