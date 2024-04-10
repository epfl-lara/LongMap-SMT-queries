; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93778 () Bool)

(assert start!93778)

(declare-fun b_free!21251 () Bool)

(declare-fun b_next!21251 () Bool)

(assert (=> start!93778 (= b_free!21251 (not b_next!21251))))

(declare-fun tp!75175 () Bool)

(declare-fun b_and!33965 () Bool)

(assert (=> start!93778 (= tp!75175 b_and!33965)))

(declare-fun b!1060697 () Bool)

(declare-fun e!603916 () Bool)

(declare-fun e!603915 () Bool)

(declare-fun mapRes!39262 () Bool)

(assert (=> b!1060697 (= e!603916 (and e!603915 mapRes!39262))))

(declare-fun condMapEmpty!39262 () Bool)

(declare-datatypes ((V!38549 0))(
  ( (V!38550 (val!12581 Int)) )
))
(declare-datatypes ((ValueCell!11827 0))(
  ( (ValueCellFull!11827 (v!15191 V!38549)) (EmptyCell!11827) )
))
(declare-datatypes ((array!67137 0))(
  ( (array!67138 (arr!32276 (Array (_ BitVec 32) ValueCell!11827)) (size!32812 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67137)

(declare-fun mapDefault!39262 () ValueCell!11827)

