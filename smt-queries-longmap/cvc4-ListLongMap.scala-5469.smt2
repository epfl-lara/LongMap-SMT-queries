; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72602 () Bool)

(assert start!72602)

(declare-fun b!842786 () Bool)

(declare-fun e!470136 () Bool)

(declare-fun e!470135 () Bool)

(declare-fun mapRes!25079 () Bool)

(assert (=> b!842786 (= e!470136 (and e!470135 mapRes!25079))))

(declare-fun condMapEmpty!25079 () Bool)

(declare-datatypes ((V!25917 0))(
  ( (V!25918 (val!7874 Int)) )
))
(declare-datatypes ((ValueCell!7387 0))(
  ( (ValueCellFull!7387 (v!10299 V!25917)) (EmptyCell!7387) )
))
(declare-datatypes ((array!47574 0))(
  ( (array!47575 (arr!22818 (Array (_ BitVec 32) ValueCell!7387)) (size!23258 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47574)

(declare-fun mapDefault!25079 () ValueCell!7387)

