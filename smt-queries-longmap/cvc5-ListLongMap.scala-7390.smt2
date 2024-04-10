; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94102 () Bool)

(assert start!94102)

(declare-fun b_free!21517 () Bool)

(declare-fun b_next!21517 () Bool)

(assert (=> start!94102 (= b_free!21517 (not b_next!21517))))

(declare-fun tp!75983 () Bool)

(declare-fun b_and!34259 () Bool)

(assert (=> start!94102 (= tp!75983 b_and!34259)))

(declare-fun b!1064222 () Bool)

(declare-fun res!710481 () Bool)

(declare-fun e!606499 () Bool)

(assert (=> b!1064222 (=> (not res!710481) (not e!606499))))

(declare-datatypes ((array!67645 0))(
  ( (array!67646 (arr!32527 (Array (_ BitVec 32) (_ BitVec 64))) (size!33063 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67645)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67645 (_ BitVec 32)) Bool)

(assert (=> b!1064222 (= res!710481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39670 () Bool)

(declare-fun mapRes!39670 () Bool)

(declare-fun tp!75982 () Bool)

(declare-fun e!606500 () Bool)

(assert (=> mapNonEmpty!39670 (= mapRes!39670 (and tp!75982 e!606500))))

(declare-datatypes ((V!38905 0))(
  ( (V!38906 (val!12714 Int)) )
))
(declare-datatypes ((ValueCell!11960 0))(
  ( (ValueCellFull!11960 (v!15326 V!38905)) (EmptyCell!11960) )
))
(declare-fun mapValue!39670 () ValueCell!11960)

(declare-fun mapKey!39670 () (_ BitVec 32))

(declare-fun mapRest!39670 () (Array (_ BitVec 32) ValueCell!11960))

(declare-datatypes ((array!67647 0))(
  ( (array!67648 (arr!32528 (Array (_ BitVec 32) ValueCell!11960)) (size!33064 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67647)

(assert (=> mapNonEmpty!39670 (= (arr!32528 _values!955) (store mapRest!39670 mapKey!39670 mapValue!39670))))

(declare-fun b!1064223 () Bool)

(declare-fun e!606497 () Bool)

(declare-fun tp_is_empty!25327 () Bool)

(assert (=> b!1064223 (= e!606497 tp_is_empty!25327)))

(declare-fun mapIsEmpty!39670 () Bool)

(assert (=> mapIsEmpty!39670 mapRes!39670))

(declare-fun res!710479 () Bool)

(assert (=> start!94102 (=> (not res!710479) (not e!606499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94102 (= res!710479 (validMask!0 mask!1515))))

(assert (=> start!94102 e!606499))

(assert (=> start!94102 true))

(assert (=> start!94102 tp_is_empty!25327))

(declare-fun e!606501 () Bool)

(declare-fun array_inv!25188 (array!67647) Bool)

(assert (=> start!94102 (and (array_inv!25188 _values!955) e!606501)))

(assert (=> start!94102 tp!75983))

(declare-fun array_inv!25189 (array!67645) Bool)

(assert (=> start!94102 (array_inv!25189 _keys!1163)))

(declare-fun b!1064224 () Bool)

(declare-fun res!710480 () Bool)

(assert (=> b!1064224 (=> (not res!710480) (not e!606499))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064224 (= res!710480 (and (= (size!33064 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33063 _keys!1163) (size!33064 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064225 () Bool)

(assert (=> b!1064225 (= e!606501 (and e!606497 mapRes!39670))))

(declare-fun condMapEmpty!39670 () Bool)

(declare-fun mapDefault!39670 () ValueCell!11960)

