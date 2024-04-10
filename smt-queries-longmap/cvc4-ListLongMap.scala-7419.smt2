; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94354 () Bool)

(assert start!94354)

(declare-fun b_free!21695 () Bool)

(declare-fun b_next!21695 () Bool)

(assert (=> start!94354 (= b_free!21695 (not b_next!21695))))

(declare-fun tp!76528 () Bool)

(declare-fun b_and!34479 () Bool)

(assert (=> start!94354 (= tp!76528 b_and!34479)))

(declare-fun res!712063 () Bool)

(declare-fun e!608484 () Bool)

(assert (=> start!94354 (=> (not res!712063) (not e!608484))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94354 (= res!712063 (validMask!0 mask!1515))))

(assert (=> start!94354 e!608484))

(assert (=> start!94354 true))

(declare-fun tp_is_empty!25505 () Bool)

(assert (=> start!94354 tp_is_empty!25505))

(declare-datatypes ((V!39141 0))(
  ( (V!39142 (val!12803 Int)) )
))
(declare-datatypes ((ValueCell!12049 0))(
  ( (ValueCellFull!12049 (v!15417 V!39141)) (EmptyCell!12049) )
))
(declare-datatypes ((array!67995 0))(
  ( (array!67996 (arr!32698 (Array (_ BitVec 32) ValueCell!12049)) (size!33234 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67995)

(declare-fun e!608483 () Bool)

(declare-fun array_inv!25316 (array!67995) Bool)

(assert (=> start!94354 (and (array_inv!25316 _values!955) e!608483)))

(assert (=> start!94354 tp!76528))

(declare-datatypes ((array!67997 0))(
  ( (array!67998 (arr!32699 (Array (_ BitVec 32) (_ BitVec 64))) (size!33235 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67997)

(declare-fun array_inv!25317 (array!67997) Bool)

(assert (=> start!94354 (array_inv!25317 _keys!1163)))

(declare-fun b!1066953 () Bool)

(declare-fun res!712062 () Bool)

(assert (=> b!1066953 (=> (not res!712062) (not e!608484))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066953 (= res!712062 (and (= (size!33234 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33235 _keys!1163) (size!33234 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39949 () Bool)

(declare-fun mapRes!39949 () Bool)

(assert (=> mapIsEmpty!39949 mapRes!39949))

(declare-fun b!1066954 () Bool)

(assert (=> b!1066954 (= e!608484 (not true))))

(declare-datatypes ((tuple2!16242 0))(
  ( (tuple2!16243 (_1!8132 (_ BitVec 64)) (_2!8132 V!39141)) )
))
(declare-datatypes ((List!22804 0))(
  ( (Nil!22801) (Cons!22800 (h!24009 tuple2!16242) (t!32127 List!22804)) )
))
(declare-datatypes ((ListLongMap!14211 0))(
  ( (ListLongMap!14212 (toList!7121 List!22804)) )
))
(declare-fun lt!471239 () ListLongMap!14211)

(declare-fun lt!471240 () ListLongMap!14211)

(assert (=> b!1066954 (= lt!471239 lt!471240)))

(declare-fun zeroValueBefore!47 () V!39141)

(declare-datatypes ((Unit!35039 0))(
  ( (Unit!35040) )
))
(declare-fun lt!471238 () Unit!35039)

(declare-fun minValue!907 () V!39141)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39141)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!742 (array!67997 array!67995 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39141 V!39141 V!39141 V!39141 (_ BitVec 32) Int) Unit!35039)

(assert (=> b!1066954 (= lt!471238 (lemmaNoChangeToArrayThenSameMapNoExtras!742 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3705 (array!67997 array!67995 (_ BitVec 32) (_ BitVec 32) V!39141 V!39141 (_ BitVec 32) Int) ListLongMap!14211)

(assert (=> b!1066954 (= lt!471240 (getCurrentListMapNoExtraKeys!3705 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066954 (= lt!471239 (getCurrentListMapNoExtraKeys!3705 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066955 () Bool)

(declare-fun e!608482 () Bool)

(assert (=> b!1066955 (= e!608483 (and e!608482 mapRes!39949))))

(declare-fun condMapEmpty!39949 () Bool)

(declare-fun mapDefault!39949 () ValueCell!12049)

