; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94298 () Bool)

(assert start!94298)

(declare-fun b_free!21661 () Bool)

(declare-fun b_next!21661 () Bool)

(assert (=> start!94298 (= b_free!21661 (not b_next!21661))))

(declare-fun tp!76424 () Bool)

(declare-fun b_and!34433 () Bool)

(assert (=> start!94298 (= tp!76424 b_and!34433)))

(declare-fun mapNonEmpty!39895 () Bool)

(declare-fun mapRes!39895 () Bool)

(declare-fun tp!76423 () Bool)

(declare-fun e!608068 () Bool)

(assert (=> mapNonEmpty!39895 (= mapRes!39895 (and tp!76423 e!608068))))

(declare-fun mapKey!39895 () (_ BitVec 32))

(declare-datatypes ((V!39097 0))(
  ( (V!39098 (val!12786 Int)) )
))
(declare-datatypes ((ValueCell!12032 0))(
  ( (ValueCellFull!12032 (v!15399 V!39097)) (EmptyCell!12032) )
))
(declare-fun mapRest!39895 () (Array (_ BitVec 32) ValueCell!12032))

(declare-fun mapValue!39895 () ValueCell!12032)

(declare-datatypes ((array!67927 0))(
  ( (array!67928 (arr!32665 (Array (_ BitVec 32) ValueCell!12032)) (size!33201 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67927)

(assert (=> mapNonEmpty!39895 (= (arr!32665 _values!955) (store mapRest!39895 mapKey!39895 mapValue!39895))))

(declare-fun b!1066369 () Bool)

(declare-fun res!711736 () Bool)

(declare-fun e!608067 () Bool)

(assert (=> b!1066369 (=> (not res!711736) (not e!608067))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67929 0))(
  ( (array!67930 (arr!32666 (Array (_ BitVec 32) (_ BitVec 64))) (size!33202 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67929)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1066369 (= res!711736 (and (= (size!33201 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33202 _keys!1163) (size!33201 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!711733 () Bool)

(assert (=> start!94298 (=> (not res!711733) (not e!608067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94298 (= res!711733 (validMask!0 mask!1515))))

(assert (=> start!94298 e!608067))

(assert (=> start!94298 true))

(declare-fun tp_is_empty!25471 () Bool)

(assert (=> start!94298 tp_is_empty!25471))

(declare-fun e!608064 () Bool)

(declare-fun array_inv!25292 (array!67927) Bool)

(assert (=> start!94298 (and (array_inv!25292 _values!955) e!608064)))

(assert (=> start!94298 tp!76424))

(declare-fun array_inv!25293 (array!67929) Bool)

(assert (=> start!94298 (array_inv!25293 _keys!1163)))

(declare-fun b!1066370 () Bool)

(declare-fun res!711735 () Bool)

(assert (=> b!1066370 (=> (not res!711735) (not e!608067))))

(declare-datatypes ((List!22777 0))(
  ( (Nil!22774) (Cons!22773 (h!23982 (_ BitVec 64)) (t!32098 List!22777)) )
))
(declare-fun arrayNoDuplicates!0 (array!67929 (_ BitVec 32) List!22777) Bool)

(assert (=> b!1066370 (= res!711735 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22774))))

(declare-fun b!1066371 () Bool)

(declare-fun e!608065 () Bool)

(assert (=> b!1066371 (= e!608064 (and e!608065 mapRes!39895))))

(declare-fun condMapEmpty!39895 () Bool)

(declare-fun mapDefault!39895 () ValueCell!12032)

