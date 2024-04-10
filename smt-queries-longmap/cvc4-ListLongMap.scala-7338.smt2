; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93724 () Bool)

(assert start!93724)

(declare-fun b_free!21209 () Bool)

(declare-fun b_next!21209 () Bool)

(assert (=> start!93724 (= b_free!21209 (not b_next!21209))))

(declare-fun tp!75046 () Bool)

(declare-fun b_and!33919 () Bool)

(assert (=> start!93724 (= tp!75046 b_and!33919)))

(declare-fun res!708118 () Bool)

(declare-fun e!603551 () Bool)

(assert (=> start!93724 (=> (not res!708118) (not e!603551))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93724 (= res!708118 (validMask!0 mask!1515))))

(assert (=> start!93724 e!603551))

(assert (=> start!93724 true))

(declare-fun tp_is_empty!25019 () Bool)

(assert (=> start!93724 tp_is_empty!25019))

(declare-datatypes ((V!38493 0))(
  ( (V!38494 (val!12560 Int)) )
))
(declare-datatypes ((ValueCell!11806 0))(
  ( (ValueCellFull!11806 (v!15170 V!38493)) (EmptyCell!11806) )
))
(declare-datatypes ((array!67059 0))(
  ( (array!67060 (arr!32238 (Array (_ BitVec 32) ValueCell!11806)) (size!32774 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67059)

(declare-fun e!603555 () Bool)

(declare-fun array_inv!24984 (array!67059) Bool)

(assert (=> start!93724 (and (array_inv!24984 _values!955) e!603555)))

(assert (=> start!93724 tp!75046))

(declare-datatypes ((array!67061 0))(
  ( (array!67062 (arr!32239 (Array (_ BitVec 32) (_ BitVec 64))) (size!32775 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67061)

(declare-fun array_inv!24985 (array!67061) Bool)

(assert (=> start!93724 (array_inv!24985 _keys!1163)))

(declare-fun mapNonEmpty!39196 () Bool)

(declare-fun mapRes!39196 () Bool)

(declare-fun tp!75047 () Bool)

(declare-fun e!603553 () Bool)

(assert (=> mapNonEmpty!39196 (= mapRes!39196 (and tp!75047 e!603553))))

(declare-fun mapKey!39196 () (_ BitVec 32))

(declare-fun mapRest!39196 () (Array (_ BitVec 32) ValueCell!11806))

(declare-fun mapValue!39196 () ValueCell!11806)

(assert (=> mapNonEmpty!39196 (= (arr!32238 _values!955) (store mapRest!39196 mapKey!39196 mapValue!39196))))

(declare-fun mapIsEmpty!39196 () Bool)

(assert (=> mapIsEmpty!39196 mapRes!39196))

(declare-fun b!1060183 () Bool)

(declare-fun res!708120 () Bool)

(assert (=> b!1060183 (=> (not res!708120) (not e!603551))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060183 (= res!708120 (and (= (size!32774 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32775 _keys!1163) (size!32774 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060184 () Bool)

(assert (=> b!1060184 (= e!603553 tp_is_empty!25019)))

(declare-fun b!1060185 () Bool)

(declare-fun e!603552 () Bool)

(assert (=> b!1060185 (= e!603555 (and e!603552 mapRes!39196))))

(declare-fun condMapEmpty!39196 () Bool)

(declare-fun mapDefault!39196 () ValueCell!11806)

