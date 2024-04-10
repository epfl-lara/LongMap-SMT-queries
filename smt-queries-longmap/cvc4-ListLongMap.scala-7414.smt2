; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94302 () Bool)

(assert start!94302)

(declare-fun b_free!21665 () Bool)

(declare-fun b_next!21665 () Bool)

(assert (=> start!94302 (= b_free!21665 (not b_next!21665))))

(declare-fun tp!76436 () Bool)

(declare-fun b_and!34437 () Bool)

(assert (=> start!94302 (= tp!76436 b_and!34437)))

(declare-fun b!1066417 () Bool)

(declare-fun e!608101 () Bool)

(declare-fun tp_is_empty!25475 () Bool)

(assert (=> b!1066417 (= e!608101 tp_is_empty!25475)))

(declare-fun b!1066418 () Bool)

(declare-fun e!608099 () Bool)

(declare-fun e!608103 () Bool)

(assert (=> b!1066418 (= e!608099 (not e!608103))))

(declare-fun res!711765 () Bool)

(assert (=> b!1066418 (=> res!711765 e!608103)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066418 (= res!711765 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39101 0))(
  ( (V!39102 (val!12788 Int)) )
))
(declare-datatypes ((tuple2!16216 0))(
  ( (tuple2!16217 (_1!8119 (_ BitVec 64)) (_2!8119 V!39101)) )
))
(declare-datatypes ((List!22780 0))(
  ( (Nil!22777) (Cons!22776 (h!23985 tuple2!16216) (t!32101 List!22780)) )
))
(declare-datatypes ((ListLongMap!14185 0))(
  ( (ListLongMap!14186 (toList!7108 List!22780)) )
))
(declare-fun lt!470781 () ListLongMap!14185)

(declare-fun lt!470783 () ListLongMap!14185)

(assert (=> b!1066418 (= lt!470781 lt!470783)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39101)

(declare-datatypes ((Unit!35011 0))(
  ( (Unit!35012) )
))
(declare-fun lt!470780 () Unit!35011)

(declare-datatypes ((ValueCell!12034 0))(
  ( (ValueCellFull!12034 (v!15401 V!39101)) (EmptyCell!12034) )
))
(declare-datatypes ((array!67935 0))(
  ( (array!67936 (arr!32669 (Array (_ BitVec 32) ValueCell!12034)) (size!33205 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67935)

(declare-fun minValue!907 () V!39101)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39101)

(declare-datatypes ((array!67937 0))(
  ( (array!67938 (arr!32670 (Array (_ BitVec 32) (_ BitVec 64))) (size!33206 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67937)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!731 (array!67937 array!67935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39101 V!39101 V!39101 V!39101 (_ BitVec 32) Int) Unit!35011)

(assert (=> b!1066418 (= lt!470780 (lemmaNoChangeToArrayThenSameMapNoExtras!731 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3694 (array!67937 array!67935 (_ BitVec 32) (_ BitVec 32) V!39101 V!39101 (_ BitVec 32) Int) ListLongMap!14185)

(assert (=> b!1066418 (= lt!470783 (getCurrentListMapNoExtraKeys!3694 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066418 (= lt!470781 (getCurrentListMapNoExtraKeys!3694 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066419 () Bool)

(declare-fun res!711766 () Bool)

(assert (=> b!1066419 (=> (not res!711766) (not e!608099))))

(declare-datatypes ((List!22781 0))(
  ( (Nil!22778) (Cons!22777 (h!23986 (_ BitVec 64)) (t!32102 List!22781)) )
))
(declare-fun arrayNoDuplicates!0 (array!67937 (_ BitVec 32) List!22781) Bool)

(assert (=> b!1066419 (= res!711766 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22778))))

(declare-fun b!1066420 () Bool)

(declare-fun e!608104 () Bool)

(assert (=> b!1066420 (= e!608104 tp_is_empty!25475)))

(declare-fun b!1066421 () Bool)

(declare-fun res!711763 () Bool)

(assert (=> b!1066421 (=> (not res!711763) (not e!608099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67937 (_ BitVec 32)) Bool)

(assert (=> b!1066421 (= res!711763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066422 () Bool)

(assert (=> b!1066422 (= e!608103 true)))

(declare-fun lt!470782 () ListLongMap!14185)

(declare-fun lt!470785 () ListLongMap!14185)

(declare-fun -!620 (ListLongMap!14185 (_ BitVec 64)) ListLongMap!14185)

(assert (=> b!1066422 (= lt!470782 (-!620 lt!470785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470784 () ListLongMap!14185)

(assert (=> b!1066422 (= (-!620 lt!470784 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470781)))

(declare-fun lt!470787 () Unit!35011)

(declare-fun addThenRemoveForNewKeyIsSame!29 (ListLongMap!14185 (_ BitVec 64) V!39101) Unit!35011)

(assert (=> b!1066422 (= lt!470787 (addThenRemoveForNewKeyIsSame!29 lt!470781 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470786 () ListLongMap!14185)

(assert (=> b!1066422 (and (= lt!470785 lt!470784) (= lt!470786 lt!470783))))

(declare-fun +!3151 (ListLongMap!14185 tuple2!16216) ListLongMap!14185)

(assert (=> b!1066422 (= lt!470784 (+!3151 lt!470781 (tuple2!16217 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4064 (array!67937 array!67935 (_ BitVec 32) (_ BitVec 32) V!39101 V!39101 (_ BitVec 32) Int) ListLongMap!14185)

(assert (=> b!1066422 (= lt!470786 (getCurrentListMap!4064 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066422 (= lt!470785 (getCurrentListMap!4064 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711764 () Bool)

(assert (=> start!94302 (=> (not res!711764) (not e!608099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94302 (= res!711764 (validMask!0 mask!1515))))

(assert (=> start!94302 e!608099))

(assert (=> start!94302 true))

(assert (=> start!94302 tp_is_empty!25475))

(declare-fun e!608100 () Bool)

(declare-fun array_inv!25296 (array!67935) Bool)

(assert (=> start!94302 (and (array_inv!25296 _values!955) e!608100)))

(assert (=> start!94302 tp!76436))

(declare-fun array_inv!25297 (array!67937) Bool)

(assert (=> start!94302 (array_inv!25297 _keys!1163)))

(declare-fun mapIsEmpty!39901 () Bool)

(declare-fun mapRes!39901 () Bool)

(assert (=> mapIsEmpty!39901 mapRes!39901))

(declare-fun b!1066423 () Bool)

(declare-fun res!711762 () Bool)

(assert (=> b!1066423 (=> (not res!711762) (not e!608099))))

(assert (=> b!1066423 (= res!711762 (and (= (size!33205 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33206 _keys!1163) (size!33205 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39901 () Bool)

(declare-fun tp!76435 () Bool)

(assert (=> mapNonEmpty!39901 (= mapRes!39901 (and tp!76435 e!608104))))

(declare-fun mapKey!39901 () (_ BitVec 32))

(declare-fun mapValue!39901 () ValueCell!12034)

(declare-fun mapRest!39901 () (Array (_ BitVec 32) ValueCell!12034))

(assert (=> mapNonEmpty!39901 (= (arr!32669 _values!955) (store mapRest!39901 mapKey!39901 mapValue!39901))))

(declare-fun b!1066424 () Bool)

(assert (=> b!1066424 (= e!608100 (and e!608101 mapRes!39901))))

(declare-fun condMapEmpty!39901 () Bool)

(declare-fun mapDefault!39901 () ValueCell!12034)

