; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93820 () Bool)

(assert start!93820)

(declare-fun b_free!21293 () Bool)

(declare-fun b_next!21293 () Bool)

(assert (=> start!93820 (= b_free!21293 (not b_next!21293))))

(declare-fun tp!75302 () Bool)

(declare-fun b_and!34007 () Bool)

(assert (=> start!93820 (= tp!75302 b_and!34007)))

(declare-fun b!1061138 () Bool)

(declare-fun e!604233 () Bool)

(declare-fun e!604231 () Bool)

(declare-fun mapRes!39325 () Bool)

(assert (=> b!1061138 (= e!604233 (and e!604231 mapRes!39325))))

(declare-fun condMapEmpty!39325 () Bool)

(declare-datatypes ((V!38605 0))(
  ( (V!38606 (val!12602 Int)) )
))
(declare-datatypes ((ValueCell!11848 0))(
  ( (ValueCellFull!11848 (v!15212 V!38605)) (EmptyCell!11848) )
))
(declare-datatypes ((array!67211 0))(
  ( (array!67212 (arr!32313 (Array (_ BitVec 32) ValueCell!11848)) (size!32849 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67211)

(declare-fun mapDefault!39325 () ValueCell!11848)

