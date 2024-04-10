; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93786 () Bool)

(assert start!93786)

(declare-fun b_free!21259 () Bool)

(declare-fun b_next!21259 () Bool)

(assert (=> start!93786 (= b_free!21259 (not b_next!21259))))

(declare-fun tp!75199 () Bool)

(declare-fun b_and!33973 () Bool)

(assert (=> start!93786 (= tp!75199 b_and!33973)))

(declare-fun b!1060781 () Bool)

(declare-fun e!603978 () Bool)

(declare-fun e!603977 () Bool)

(declare-fun mapRes!39274 () Bool)

(assert (=> b!1060781 (= e!603978 (and e!603977 mapRes!39274))))

(declare-fun condMapEmpty!39274 () Bool)

(declare-datatypes ((V!38561 0))(
  ( (V!38562 (val!12585 Int)) )
))
(declare-datatypes ((ValueCell!11831 0))(
  ( (ValueCellFull!11831 (v!15195 V!38561)) (EmptyCell!11831) )
))
(declare-datatypes ((array!67151 0))(
  ( (array!67152 (arr!32283 (Array (_ BitVec 32) ValueCell!11831)) (size!32819 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67151)

(declare-fun mapDefault!39274 () ValueCell!11831)

