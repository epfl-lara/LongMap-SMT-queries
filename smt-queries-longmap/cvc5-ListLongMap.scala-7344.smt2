; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93768 () Bool)

(assert start!93768)

(declare-fun b_free!21241 () Bool)

(declare-fun b_next!21241 () Bool)

(assert (=> start!93768 (= b_free!21241 (not b_next!21241))))

(declare-fun tp!75146 () Bool)

(declare-fun b_and!33955 () Bool)

(assert (=> start!93768 (= tp!75146 b_and!33955)))

(declare-fun b!1060592 () Bool)

(declare-fun e!603841 () Bool)

(declare-fun tp_is_empty!25051 () Bool)

(assert (=> b!1060592 (= e!603841 tp_is_empty!25051)))

(declare-fun b!1060593 () Bool)

(declare-fun e!603839 () Bool)

(declare-fun e!603843 () Bool)

(declare-fun mapRes!39247 () Bool)

(assert (=> b!1060593 (= e!603839 (and e!603843 mapRes!39247))))

(declare-fun condMapEmpty!39247 () Bool)

(declare-datatypes ((V!38537 0))(
  ( (V!38538 (val!12576 Int)) )
))
(declare-datatypes ((ValueCell!11822 0))(
  ( (ValueCellFull!11822 (v!15186 V!38537)) (EmptyCell!11822) )
))
(declare-datatypes ((array!67121 0))(
  ( (array!67122 (arr!32268 (Array (_ BitVec 32) ValueCell!11822)) (size!32804 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67121)

(declare-fun mapDefault!39247 () ValueCell!11822)

