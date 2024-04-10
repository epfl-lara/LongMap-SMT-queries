; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84376 () Bool)

(assert start!84376)

(declare-fun b_free!19963 () Bool)

(declare-fun b_next!19963 () Bool)

(assert (=> start!84376 (= b_free!19963 (not b_next!19963))))

(declare-fun tp!69664 () Bool)

(declare-fun b_and!31997 () Bool)

(assert (=> start!84376 (= tp!69664 b_and!31997)))

(declare-fun b!986955 () Bool)

(declare-fun e!556557 () Bool)

(declare-fun e!556555 () Bool)

(declare-fun mapRes!36797 () Bool)

(assert (=> b!986955 (= e!556557 (and e!556555 mapRes!36797))))

(declare-fun condMapEmpty!36797 () Bool)

(declare-datatypes ((V!35889 0))(
  ( (V!35890 (val!11640 Int)) )
))
(declare-datatypes ((ValueCell!11108 0))(
  ( (ValueCellFull!11108 (v!14202 V!35889)) (EmptyCell!11108) )
))
(declare-datatypes ((array!62317 0))(
  ( (array!62318 (arr!30016 (Array (_ BitVec 32) ValueCell!11108)) (size!30495 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62317)

(declare-fun mapDefault!36797 () ValueCell!11108)

