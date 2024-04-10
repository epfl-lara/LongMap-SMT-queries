; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95804 () Bool)

(assert start!95804)

(declare-fun b_free!22457 () Bool)

(declare-fun b_next!22457 () Bool)

(assert (=> start!95804 (= b_free!22457 (not b_next!22457))))

(declare-fun tp!79219 () Bool)

(declare-fun b_and!35589 () Bool)

(assert (=> start!95804 (= tp!79219 b_and!35589)))

(declare-fun mapIsEmpty!41443 () Bool)

(declare-fun mapRes!41443 () Bool)

(assert (=> mapIsEmpty!41443 mapRes!41443))

(declare-fun b!1083895 () Bool)

(declare-fun res!722566 () Bool)

(declare-fun e!619291 () Bool)

(assert (=> b!1083895 (=> (not res!722566) (not e!619291))))

(declare-datatypes ((array!69861 0))(
  ( (array!69862 (arr!33604 (Array (_ BitVec 32) (_ BitVec 64))) (size!34140 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69861)

(declare-datatypes ((List!23429 0))(
  ( (Nil!23426) (Cons!23425 (h!24634 (_ BitVec 64)) (t!32944 List!23429)) )
))
(declare-fun arrayNoDuplicates!0 (array!69861 (_ BitVec 32) List!23429) Bool)

(assert (=> b!1083895 (= res!722566 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23426))))

(declare-fun b!1083896 () Bool)

(declare-fun e!619290 () Bool)

(declare-fun e!619293 () Bool)

(assert (=> b!1083896 (= e!619290 (and e!619293 mapRes!41443))))

(declare-fun condMapEmpty!41443 () Bool)

(declare-datatypes ((V!40405 0))(
  ( (V!40406 (val!13286 Int)) )
))
(declare-datatypes ((ValueCell!12520 0))(
  ( (ValueCellFull!12520 (v!15907 V!40405)) (EmptyCell!12520) )
))
(declare-datatypes ((array!69863 0))(
  ( (array!69864 (arr!33605 (Array (_ BitVec 32) ValueCell!12520)) (size!34141 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69863)

(declare-fun mapDefault!41443 () ValueCell!12520)

