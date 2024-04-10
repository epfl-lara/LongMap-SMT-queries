; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94078 () Bool)

(assert start!94078)

(declare-fun b_free!21493 () Bool)

(declare-fun b_next!21493 () Bool)

(assert (=> start!94078 (= b_free!21493 (not b_next!21493))))

(declare-fun tp!75910 () Bool)

(declare-fun b_and!34235 () Bool)

(assert (=> start!94078 (= tp!75910 b_and!34235)))

(declare-fun b!1063970 () Bool)

(declare-fun e!606321 () Bool)

(declare-fun e!606319 () Bool)

(declare-fun mapRes!39634 () Bool)

(assert (=> b!1063970 (= e!606321 (and e!606319 mapRes!39634))))

(declare-fun condMapEmpty!39634 () Bool)

(declare-datatypes ((V!38873 0))(
  ( (V!38874 (val!12702 Int)) )
))
(declare-datatypes ((ValueCell!11948 0))(
  ( (ValueCellFull!11948 (v!15314 V!38873)) (EmptyCell!11948) )
))
(declare-datatypes ((array!67605 0))(
  ( (array!67606 (arr!32507 (Array (_ BitVec 32) ValueCell!11948)) (size!33043 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67605)

(declare-fun mapDefault!39634 () ValueCell!11948)

