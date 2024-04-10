; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94024 () Bool)

(assert start!94024)

(declare-fun b_free!21461 () Bool)

(declare-fun b_next!21461 () Bool)

(assert (=> start!94024 (= b_free!21461 (not b_next!21461))))

(declare-fun tp!75811 () Bool)

(declare-fun b_and!34193 () Bool)

(assert (=> start!94024 (= tp!75811 b_and!34193)))

(declare-fun b!1063457 () Bool)

(declare-fun res!710065 () Bool)

(declare-fun e!605958 () Bool)

(assert (=> b!1063457 (=> (not res!710065) (not e!605958))))

(declare-datatypes ((array!67539 0))(
  ( (array!67540 (arr!32475 (Array (_ BitVec 32) (_ BitVec 64))) (size!33011 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67539)

(declare-datatypes ((List!22638 0))(
  ( (Nil!22635) (Cons!22634 (h!23843 (_ BitVec 64)) (t!31951 List!22638)) )
))
(declare-fun arrayNoDuplicates!0 (array!67539 (_ BitVec 32) List!22638) Bool)

(assert (=> b!1063457 (= res!710065 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22635))))

(declare-fun b!1063459 () Bool)

(declare-fun e!605961 () Bool)

(declare-fun tp_is_empty!25271 () Bool)

(assert (=> b!1063459 (= e!605961 tp_is_empty!25271)))

(declare-fun b!1063460 () Bool)

(declare-fun e!605959 () Bool)

(declare-fun e!605963 () Bool)

(declare-fun mapRes!39583 () Bool)

(assert (=> b!1063460 (= e!605959 (and e!605963 mapRes!39583))))

(declare-fun condMapEmpty!39583 () Bool)

(declare-datatypes ((V!38829 0))(
  ( (V!38830 (val!12686 Int)) )
))
(declare-datatypes ((ValueCell!11932 0))(
  ( (ValueCellFull!11932 (v!15297 V!38829)) (EmptyCell!11932) )
))
(declare-datatypes ((array!67541 0))(
  ( (array!67542 (arr!32476 (Array (_ BitVec 32) ValueCell!11932)) (size!33012 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67541)

(declare-fun mapDefault!39583 () ValueCell!11932)

