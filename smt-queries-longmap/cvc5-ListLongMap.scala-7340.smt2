; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93732 () Bool)

(assert start!93732)

(declare-fun b_free!21217 () Bool)

(declare-fun b_next!21217 () Bool)

(assert (=> start!93732 (= b_free!21217 (not b_next!21217))))

(declare-fun tp!75071 () Bool)

(declare-fun b_and!33927 () Bool)

(assert (=> start!93732 (= tp!75071 b_and!33927)))

(declare-fun b!1060267 () Bool)

(declare-fun e!603613 () Bool)

(declare-fun e!603612 () Bool)

(declare-fun mapRes!39208 () Bool)

(assert (=> b!1060267 (= e!603613 (and e!603612 mapRes!39208))))

(declare-fun condMapEmpty!39208 () Bool)

(declare-datatypes ((V!38505 0))(
  ( (V!38506 (val!12564 Int)) )
))
(declare-datatypes ((ValueCell!11810 0))(
  ( (ValueCellFull!11810 (v!15174 V!38505)) (EmptyCell!11810) )
))
(declare-datatypes ((array!67075 0))(
  ( (array!67076 (arr!32246 (Array (_ BitVec 32) ValueCell!11810)) (size!32782 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67075)

(declare-fun mapDefault!39208 () ValueCell!11810)

