; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81990 () Bool)

(assert start!81990)

(declare-fun b!956293 () Bool)

(declare-fun e!538827 () Bool)

(declare-fun e!538824 () Bool)

(declare-fun mapRes!33505 () Bool)

(assert (=> b!956293 (= e!538827 (and e!538824 mapRes!33505))))

(declare-fun condMapEmpty!33505 () Bool)

(declare-datatypes ((V!33021 0))(
  ( (V!33022 (val!10565 Int)) )
))
(declare-datatypes ((ValueCell!10033 0))(
  ( (ValueCellFull!10033 (v!13120 V!33021)) (EmptyCell!10033) )
))
(declare-datatypes ((array!58157 0))(
  ( (array!58158 (arr!27958 (Array (_ BitVec 32) ValueCell!10033)) (size!28437 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58157)

(declare-fun mapDefault!33505 () ValueCell!10033)

