; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70780 () Bool)

(assert start!70780)

(declare-fun b_free!13037 () Bool)

(declare-fun b_next!13037 () Bool)

(assert (=> start!70780 (= b_free!13037 (not b_next!13037))))

(declare-fun tp!45855 () Bool)

(declare-fun b_and!21909 () Bool)

(assert (=> start!70780 (= tp!45855 b_and!21909)))

(declare-fun b!822118 () Bool)

(declare-fun e!457019 () Bool)

(declare-fun e!457020 () Bool)

(declare-fun mapRes!23731 () Bool)

(assert (=> b!822118 (= e!457019 (and e!457020 mapRes!23731))))

(declare-fun condMapEmpty!23731 () Bool)

(declare-datatypes ((V!24663 0))(
  ( (V!24664 (val!7421 Int)) )
))
(declare-datatypes ((ValueCell!6958 0))(
  ( (ValueCellFull!6958 (v!9852 V!24663)) (EmptyCell!6958) )
))
(declare-datatypes ((array!45690 0))(
  ( (array!45691 (arr!21895 (Array (_ BitVec 32) ValueCell!6958)) (size!22316 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45690)

(declare-fun mapDefault!23731 () ValueCell!6958)

