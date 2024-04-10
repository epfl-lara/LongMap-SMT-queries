; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94204 () Bool)

(assert start!94204)

(declare-fun b_free!21589 () Bool)

(declare-fun b_next!21589 () Bool)

(assert (=> start!94204 (= b_free!21589 (not b_next!21589))))

(declare-fun tp!76205 () Bool)

(declare-fun b_and!34349 () Bool)

(assert (=> start!94204 (= tp!76205 b_and!34349)))

(declare-fun b!1065321 () Bool)

(declare-fun res!711114 () Bool)

(declare-fun e!607299 () Bool)

(assert (=> b!1065321 (=> (not res!711114) (not e!607299))))

(declare-datatypes ((array!67785 0))(
  ( (array!67786 (arr!32595 (Array (_ BitVec 32) (_ BitVec 64))) (size!33131 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67785)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67785 (_ BitVec 32)) Bool)

(assert (=> b!1065321 (= res!711114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065322 () Bool)

(declare-fun e!607298 () Bool)

(declare-fun e!607301 () Bool)

(declare-fun mapRes!39784 () Bool)

(assert (=> b!1065322 (= e!607298 (and e!607301 mapRes!39784))))

(declare-fun condMapEmpty!39784 () Bool)

(declare-datatypes ((V!39001 0))(
  ( (V!39002 (val!12750 Int)) )
))
(declare-datatypes ((ValueCell!11996 0))(
  ( (ValueCellFull!11996 (v!15362 V!39001)) (EmptyCell!11996) )
))
(declare-datatypes ((array!67787 0))(
  ( (array!67788 (arr!32596 (Array (_ BitVec 32) ValueCell!11996)) (size!33132 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67787)

(declare-fun mapDefault!39784 () ValueCell!11996)

