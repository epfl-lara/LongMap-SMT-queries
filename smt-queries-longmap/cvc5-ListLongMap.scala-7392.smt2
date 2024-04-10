; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94128 () Bool)

(assert start!94128)

(declare-fun b_free!21529 () Bool)

(declare-fun b_next!21529 () Bool)

(assert (=> start!94128 (= b_free!21529 (not b_next!21529))))

(declare-fun tp!76022 () Bool)

(declare-fun b_and!34279 () Bool)

(assert (=> start!94128 (= tp!76022 b_and!34279)))

(declare-fun res!710596 () Bool)

(declare-fun e!606656 () Bool)

(assert (=> start!94128 (=> (not res!710596) (not e!606656))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94128 (= res!710596 (validMask!0 mask!1515))))

(assert (=> start!94128 e!606656))

(assert (=> start!94128 true))

(declare-fun tp_is_empty!25339 () Bool)

(assert (=> start!94128 tp_is_empty!25339))

(declare-datatypes ((V!38921 0))(
  ( (V!38922 (val!12720 Int)) )
))
(declare-datatypes ((ValueCell!11966 0))(
  ( (ValueCellFull!11966 (v!15332 V!38921)) (EmptyCell!11966) )
))
(declare-datatypes ((array!67667 0))(
  ( (array!67668 (arr!32537 (Array (_ BitVec 32) ValueCell!11966)) (size!33073 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67667)

(declare-fun e!606655 () Bool)

(declare-fun array_inv!25196 (array!67667) Bool)

(assert (=> start!94128 (and (array_inv!25196 _values!955) e!606655)))

(assert (=> start!94128 tp!76022))

(declare-datatypes ((array!67669 0))(
  ( (array!67670 (arr!32538 (Array (_ BitVec 32) (_ BitVec 64))) (size!33074 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67669)

(declare-fun array_inv!25197 (array!67669) Bool)

(assert (=> start!94128 (array_inv!25197 _keys!1163)))

(declare-fun b!1064444 () Bool)

(declare-fun res!710597 () Bool)

(assert (=> b!1064444 (=> (not res!710597) (not e!606656))))

(declare-datatypes ((List!22680 0))(
  ( (Nil!22677) (Cons!22676 (h!23885 (_ BitVec 64)) (t!31997 List!22680)) )
))
(declare-fun arrayNoDuplicates!0 (array!67669 (_ BitVec 32) List!22680) Bool)

(assert (=> b!1064444 (= res!710597 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22677))))

(declare-fun b!1064445 () Bool)

(declare-fun e!606658 () Bool)

(assert (=> b!1064445 (= e!606658 tp_is_empty!25339)))

(declare-fun b!1064446 () Bool)

(declare-fun e!606657 () Bool)

(assert (=> b!1064446 (= e!606657 true)))

(declare-fun zeroValueBefore!47 () V!38921)

(declare-datatypes ((tuple2!16106 0))(
  ( (tuple2!16107 (_1!8064 (_ BitVec 64)) (_2!8064 V!38921)) )
))
(declare-datatypes ((List!22681 0))(
  ( (Nil!22678) (Cons!22677 (h!23886 tuple2!16106) (t!31998 List!22681)) )
))
(declare-datatypes ((ListLongMap!14075 0))(
  ( (ListLongMap!14076 (toList!7053 List!22681)) )
))
(declare-fun lt!469204 () ListLongMap!14075)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38921)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4015 (array!67669 array!67667 (_ BitVec 32) (_ BitVec 32) V!38921 V!38921 (_ BitVec 32) Int) ListLongMap!14075)

(assert (=> b!1064446 (= lt!469204 (getCurrentListMap!4015 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064447 () Bool)

(assert (=> b!1064447 (= e!606656 (not e!606657))))

(declare-fun res!710593 () Bool)

(assert (=> b!1064447 (=> res!710593 e!606657)))

(assert (=> b!1064447 (= res!710593 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469202 () ListLongMap!14075)

(declare-fun lt!469205 () ListLongMap!14075)

(assert (=> b!1064447 (= lt!469202 lt!469205)))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38921)

(declare-datatypes ((Unit!34906 0))(
  ( (Unit!34907) )
))
(declare-fun lt!469203 () Unit!34906)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!682 (array!67669 array!67667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38921 V!38921 V!38921 V!38921 (_ BitVec 32) Int) Unit!34906)

(assert (=> b!1064447 (= lt!469203 (lemmaNoChangeToArrayThenSameMapNoExtras!682 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3645 (array!67669 array!67667 (_ BitVec 32) (_ BitVec 32) V!38921 V!38921 (_ BitVec 32) Int) ListLongMap!14075)

(assert (=> b!1064447 (= lt!469205 (getCurrentListMapNoExtraKeys!3645 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064447 (= lt!469202 (getCurrentListMapNoExtraKeys!3645 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064448 () Bool)

(declare-fun res!710594 () Bool)

(assert (=> b!1064448 (=> (not res!710594) (not e!606656))))

(assert (=> b!1064448 (= res!710594 (and (= (size!33073 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33074 _keys!1163) (size!33073 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064449 () Bool)

(declare-fun res!710595 () Bool)

(assert (=> b!1064449 (=> (not res!710595) (not e!606656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67669 (_ BitVec 32)) Bool)

(assert (=> b!1064449 (= res!710595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064450 () Bool)

(declare-fun e!606654 () Bool)

(assert (=> b!1064450 (= e!606654 tp_is_empty!25339)))

(declare-fun b!1064451 () Bool)

(declare-fun mapRes!39691 () Bool)

(assert (=> b!1064451 (= e!606655 (and e!606654 mapRes!39691))))

(declare-fun condMapEmpty!39691 () Bool)

(declare-fun mapDefault!39691 () ValueCell!11966)

