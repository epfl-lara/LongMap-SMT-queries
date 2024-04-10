; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94100 () Bool)

(assert start!94100)

(declare-fun b_free!21515 () Bool)

(declare-fun b_next!21515 () Bool)

(assert (=> start!94100 (= b_free!21515 (not b_next!21515))))

(declare-fun tp!75976 () Bool)

(declare-fun b_and!34257 () Bool)

(assert (=> start!94100 (= tp!75976 b_and!34257)))

(declare-fun b!1064201 () Bool)

(declare-fun e!606485 () Bool)

(declare-fun e!606484 () Bool)

(declare-fun mapRes!39667 () Bool)

(assert (=> b!1064201 (= e!606485 (and e!606484 mapRes!39667))))

(declare-fun condMapEmpty!39667 () Bool)

(declare-datatypes ((V!38901 0))(
  ( (V!38902 (val!12713 Int)) )
))
(declare-datatypes ((ValueCell!11959 0))(
  ( (ValueCellFull!11959 (v!15325 V!38901)) (EmptyCell!11959) )
))
(declare-datatypes ((array!67643 0))(
  ( (array!67644 (arr!32526 (Array (_ BitVec 32) ValueCell!11959)) (size!33062 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67643)

(declare-fun mapDefault!39667 () ValueCell!11959)

