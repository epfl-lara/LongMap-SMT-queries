; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133378 () Bool)

(assert start!133378)

(declare-fun mapIsEmpty!59094 () Bool)

(declare-fun mapRes!59094 () Bool)

(assert (=> mapIsEmpty!59094 mapRes!59094))

(declare-fun b!1559408 () Bool)

(declare-fun e!868891 () Bool)

(declare-fun e!868894 () Bool)

(assert (=> b!1559408 (= e!868891 (and e!868894 mapRes!59094))))

(declare-fun condMapEmpty!59094 () Bool)

(declare-datatypes ((V!59517 0))(
  ( (V!59518 (val!19325 Int)) )
))
(declare-datatypes ((ValueCell!18211 0))(
  ( (ValueCellFull!18211 (v!22076 V!59517)) (EmptyCell!18211) )
))
(declare-datatypes ((array!103690 0))(
  ( (array!103691 (arr!50039 (Array (_ BitVec 32) ValueCell!18211)) (size!50589 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103690)

(declare-fun mapDefault!59094 () ValueCell!18211)

