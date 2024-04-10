; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94278 () Bool)

(assert start!94278)

(declare-fun b_free!21641 () Bool)

(declare-fun b_next!21641 () Bool)

(assert (=> start!94278 (= b_free!21641 (not b_next!21641))))

(declare-fun tp!76364 () Bool)

(declare-fun b_and!34413 () Bool)

(assert (=> start!94278 (= tp!76364 b_and!34413)))

(declare-fun mapIsEmpty!39865 () Bool)

(declare-fun mapRes!39865 () Bool)

(assert (=> mapIsEmpty!39865 mapRes!39865))

(declare-fun res!711582 () Bool)

(declare-fun e!607883 () Bool)

(assert (=> start!94278 (=> (not res!711582) (not e!607883))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94278 (= res!711582 (validMask!0 mask!1515))))

(assert (=> start!94278 e!607883))

(assert (=> start!94278 true))

(declare-fun tp_is_empty!25451 () Bool)

(assert (=> start!94278 tp_is_empty!25451))

(declare-datatypes ((V!39069 0))(
  ( (V!39070 (val!12776 Int)) )
))
(declare-datatypes ((ValueCell!12022 0))(
  ( (ValueCellFull!12022 (v!15389 V!39069)) (EmptyCell!12022) )
))
(declare-datatypes ((array!67887 0))(
  ( (array!67888 (arr!32645 (Array (_ BitVec 32) ValueCell!12022)) (size!33181 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67887)

(declare-fun e!607885 () Bool)

(declare-fun array_inv!25276 (array!67887) Bool)

(assert (=> start!94278 (and (array_inv!25276 _values!955) e!607885)))

(assert (=> start!94278 tp!76364))

(declare-datatypes ((array!67889 0))(
  ( (array!67890 (arr!32646 (Array (_ BitVec 32) (_ BitVec 64))) (size!33182 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67889)

(declare-fun array_inv!25277 (array!67889) Bool)

(assert (=> start!94278 (array_inv!25277 _keys!1163)))

(declare-fun b!1066129 () Bool)

(declare-fun e!607888 () Bool)

(assert (=> b!1066129 (= e!607888 tp_is_empty!25451)))

(declare-fun mapNonEmpty!39865 () Bool)

(declare-fun tp!76363 () Bool)

(declare-fun e!607884 () Bool)

(assert (=> mapNonEmpty!39865 (= mapRes!39865 (and tp!76363 e!607884))))

(declare-fun mapKey!39865 () (_ BitVec 32))

(declare-fun mapRest!39865 () (Array (_ BitVec 32) ValueCell!12022))

(declare-fun mapValue!39865 () ValueCell!12022)

(assert (=> mapNonEmpty!39865 (= (arr!32645 _values!955) (store mapRest!39865 mapKey!39865 mapValue!39865))))

(declare-fun b!1066130 () Bool)

(declare-fun res!711584 () Bool)

(assert (=> b!1066130 (=> (not res!711584) (not e!607883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67889 (_ BitVec 32)) Bool)

(assert (=> b!1066130 (= res!711584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066131 () Bool)

(declare-fun res!711583 () Bool)

(assert (=> b!1066131 (=> (not res!711583) (not e!607883))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066131 (= res!711583 (and (= (size!33181 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33182 _keys!1163) (size!33181 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066132 () Bool)

(assert (=> b!1066132 (= e!607885 (and e!607888 mapRes!39865))))

(declare-fun condMapEmpty!39865 () Bool)

(declare-fun mapDefault!39865 () ValueCell!12022)

