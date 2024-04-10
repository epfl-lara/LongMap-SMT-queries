; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94064 () Bool)

(assert start!94064)

(declare-fun b_free!21479 () Bool)

(declare-fun b_next!21479 () Bool)

(assert (=> start!94064 (= b_free!21479 (not b_next!21479))))

(declare-fun tp!75868 () Bool)

(declare-fun b_and!34221 () Bool)

(assert (=> start!94064 (= tp!75868 b_and!34221)))

(declare-fun b!1063823 () Bool)

(declare-fun res!710253 () Bool)

(declare-fun e!606216 () Bool)

(assert (=> b!1063823 (=> (not res!710253) (not e!606216))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38853 0))(
  ( (V!38854 (val!12695 Int)) )
))
(declare-datatypes ((ValueCell!11941 0))(
  ( (ValueCellFull!11941 (v!15307 V!38853)) (EmptyCell!11941) )
))
(declare-datatypes ((array!67577 0))(
  ( (array!67578 (arr!32493 (Array (_ BitVec 32) ValueCell!11941)) (size!33029 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67577)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67579 0))(
  ( (array!67580 (arr!32494 (Array (_ BitVec 32) (_ BitVec 64))) (size!33030 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67579)

(assert (=> b!1063823 (= res!710253 (and (= (size!33029 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33030 _keys!1163) (size!33029 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063824 () Bool)

(declare-fun e!606212 () Bool)

(declare-fun e!606215 () Bool)

(declare-fun mapRes!39613 () Bool)

(assert (=> b!1063824 (= e!606212 (and e!606215 mapRes!39613))))

(declare-fun condMapEmpty!39613 () Bool)

(declare-fun mapDefault!39613 () ValueCell!11941)

