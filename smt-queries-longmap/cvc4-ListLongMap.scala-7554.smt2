; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95648 () Bool)

(assert start!95648)

(declare-fun b_free!22301 () Bool)

(declare-fun b_next!22301 () Bool)

(assert (=> start!95648 (= b_free!22301 (not b_next!22301))))

(declare-fun tp!78752 () Bool)

(declare-fun b_and!35279 () Bool)

(assert (=> start!95648 (= tp!78752 b_and!35279)))

(declare-fun b!1080933 () Bool)

(declare-fun e!617887 () Bool)

(declare-fun e!617888 () Bool)

(declare-fun mapRes!41209 () Bool)

(assert (=> b!1080933 (= e!617887 (and e!617888 mapRes!41209))))

(declare-fun condMapEmpty!41209 () Bool)

(declare-datatypes ((V!40197 0))(
  ( (V!40198 (val!13208 Int)) )
))
(declare-datatypes ((ValueCell!12442 0))(
  ( (ValueCellFull!12442 (v!15829 V!40197)) (EmptyCell!12442) )
))
(declare-datatypes ((array!69557 0))(
  ( (array!69558 (arr!33452 (Array (_ BitVec 32) ValueCell!12442)) (size!33988 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69557)

(declare-fun mapDefault!41209 () ValueCell!12442)

