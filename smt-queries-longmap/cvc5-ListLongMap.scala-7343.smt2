; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93762 () Bool)

(assert start!93762)

(declare-fun b_free!21235 () Bool)

(declare-fun b_next!21235 () Bool)

(assert (=> start!93762 (= b_free!21235 (not b_next!21235))))

(declare-fun tp!75128 () Bool)

(declare-fun b_and!33949 () Bool)

(assert (=> start!93762 (= tp!75128 b_and!33949)))

(declare-fun b!1060529 () Bool)

(declare-fun e!603796 () Bool)

(declare-fun tp_is_empty!25045 () Bool)

(assert (=> b!1060529 (= e!603796 tp_is_empty!25045)))

(declare-fun mapIsEmpty!39238 () Bool)

(declare-fun mapRes!39238 () Bool)

(assert (=> mapIsEmpty!39238 mapRes!39238))

(declare-fun b!1060530 () Bool)

(declare-fun e!603795 () Bool)

(assert (=> b!1060530 (= e!603795 (and e!603796 mapRes!39238))))

(declare-fun condMapEmpty!39238 () Bool)

(declare-datatypes ((V!38529 0))(
  ( (V!38530 (val!12573 Int)) )
))
(declare-datatypes ((ValueCell!11819 0))(
  ( (ValueCellFull!11819 (v!15183 V!38529)) (EmptyCell!11819) )
))
(declare-datatypes ((array!67111 0))(
  ( (array!67112 (arr!32263 (Array (_ BitVec 32) ValueCell!11819)) (size!32799 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67111)

(declare-fun mapDefault!39238 () ValueCell!11819)

