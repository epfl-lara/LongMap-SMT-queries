; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93780 () Bool)

(assert start!93780)

(declare-fun b_free!21253 () Bool)

(declare-fun b_next!21253 () Bool)

(assert (=> start!93780 (= b_free!21253 (not b_next!21253))))

(declare-fun tp!75181 () Bool)

(declare-fun b_and!33967 () Bool)

(assert (=> start!93780 (= tp!75181 b_and!33967)))

(declare-fun res!708412 () Bool)

(declare-fun e!603930 () Bool)

(assert (=> start!93780 (=> (not res!708412) (not e!603930))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93780 (= res!708412 (validMask!0 mask!1515))))

(assert (=> start!93780 e!603930))

(assert (=> start!93780 true))

(declare-fun tp_is_empty!25063 () Bool)

(assert (=> start!93780 tp_is_empty!25063))

(declare-datatypes ((V!38553 0))(
  ( (V!38554 (val!12582 Int)) )
))
(declare-datatypes ((ValueCell!11828 0))(
  ( (ValueCellFull!11828 (v!15192 V!38553)) (EmptyCell!11828) )
))
(declare-datatypes ((array!67139 0))(
  ( (array!67140 (arr!32277 (Array (_ BitVec 32) ValueCell!11828)) (size!32813 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67139)

(declare-fun e!603933 () Bool)

(declare-fun array_inv!25010 (array!67139) Bool)

(assert (=> start!93780 (and (array_inv!25010 _values!955) e!603933)))

(assert (=> start!93780 tp!75181))

(declare-datatypes ((array!67141 0))(
  ( (array!67142 (arr!32278 (Array (_ BitVec 32) (_ BitVec 64))) (size!32814 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67141)

(declare-fun array_inv!25011 (array!67141) Bool)

(assert (=> start!93780 (array_inv!25011 _keys!1163)))

(declare-fun b!1060718 () Bool)

(declare-fun res!708409 () Bool)

(assert (=> b!1060718 (=> (not res!708409) (not e!603930))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060718 (= res!708409 (and (= (size!32813 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32814 _keys!1163) (size!32813 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060719 () Bool)

(declare-fun e!603931 () Bool)

(declare-fun mapRes!39265 () Bool)

(assert (=> b!1060719 (= e!603933 (and e!603931 mapRes!39265))))

(declare-fun condMapEmpty!39265 () Bool)

(declare-fun mapDefault!39265 () ValueCell!11828)

