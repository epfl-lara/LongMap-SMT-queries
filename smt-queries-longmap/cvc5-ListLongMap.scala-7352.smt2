; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93816 () Bool)

(assert start!93816)

(declare-fun b_free!21289 () Bool)

(declare-fun b_next!21289 () Bool)

(assert (=> start!93816 (= b_free!21289 (not b_next!21289))))

(declare-fun tp!75290 () Bool)

(declare-fun b_and!34003 () Bool)

(assert (=> start!93816 (= tp!75290 b_and!34003)))

(declare-fun b!1061096 () Bool)

(declare-fun e!604200 () Bool)

(declare-fun e!604203 () Bool)

(declare-fun mapRes!39319 () Bool)

(assert (=> b!1061096 (= e!604200 (and e!604203 mapRes!39319))))

(declare-fun condMapEmpty!39319 () Bool)

(declare-datatypes ((V!38601 0))(
  ( (V!38602 (val!12600 Int)) )
))
(declare-datatypes ((ValueCell!11846 0))(
  ( (ValueCellFull!11846 (v!15210 V!38601)) (EmptyCell!11846) )
))
(declare-datatypes ((array!67205 0))(
  ( (array!67206 (arr!32310 (Array (_ BitVec 32) ValueCell!11846)) (size!32846 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67205)

(declare-fun mapDefault!39319 () ValueCell!11846)

