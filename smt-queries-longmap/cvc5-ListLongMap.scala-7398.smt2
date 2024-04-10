; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94164 () Bool)

(assert start!94164)

(declare-fun b_free!21565 () Bool)

(declare-fun b_next!21565 () Bool)

(assert (=> start!94164 (= b_free!21565 (not b_next!21565))))

(declare-fun tp!76129 () Bool)

(declare-fun b_and!34315 () Bool)

(assert (=> start!94164 (= tp!76129 b_and!34315)))

(declare-fun b!1064876 () Bool)

(declare-fun e!606982 () Bool)

(declare-fun e!606981 () Bool)

(assert (=> b!1064876 (= e!606982 (not e!606981))))

(declare-fun res!710866 () Bool)

(assert (=> b!1064876 (=> res!710866 e!606981)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064876 (= res!710866 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!38969 0))(
  ( (V!38970 (val!12738 Int)) )
))
(declare-datatypes ((tuple2!16138 0))(
  ( (tuple2!16139 (_1!8080 (_ BitVec 64)) (_2!8080 V!38969)) )
))
(declare-datatypes ((List!22707 0))(
  ( (Nil!22704) (Cons!22703 (h!23912 tuple2!16138) (t!32024 List!22707)) )
))
(declare-datatypes ((ListLongMap!14107 0))(
  ( (ListLongMap!14108 (toList!7069 List!22707)) )
))
(declare-fun lt!469418 () ListLongMap!14107)

(declare-fun lt!469419 () ListLongMap!14107)

(assert (=> b!1064876 (= lt!469418 lt!469419)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38969)

(declare-datatypes ((ValueCell!11984 0))(
  ( (ValueCellFull!11984 (v!15350 V!38969)) (EmptyCell!11984) )
))
(declare-datatypes ((array!67735 0))(
  ( (array!67736 (arr!32571 (Array (_ BitVec 32) ValueCell!11984)) (size!33107 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67735)

(declare-fun minValue!907 () V!38969)

(declare-datatypes ((Unit!34932 0))(
  ( (Unit!34933) )
))
(declare-fun lt!469420 () Unit!34932)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38969)

(declare-datatypes ((array!67737 0))(
  ( (array!67738 (arr!32572 (Array (_ BitVec 32) (_ BitVec 64))) (size!33108 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67737)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!695 (array!67737 array!67735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38969 V!38969 V!38969 V!38969 (_ BitVec 32) Int) Unit!34932)

(assert (=> b!1064876 (= lt!469420 (lemmaNoChangeToArrayThenSameMapNoExtras!695 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3658 (array!67737 array!67735 (_ BitVec 32) (_ BitVec 32) V!38969 V!38969 (_ BitVec 32) Int) ListLongMap!14107)

(assert (=> b!1064876 (= lt!469419 (getCurrentListMapNoExtraKeys!3658 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064876 (= lt!469418 (getCurrentListMapNoExtraKeys!3658 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064877 () Bool)

(declare-fun e!606979 () Bool)

(declare-fun tp_is_empty!25375 () Bool)

(assert (=> b!1064877 (= e!606979 tp_is_empty!25375)))

(declare-fun b!1064878 () Bool)

(declare-fun res!710867 () Bool)

(assert (=> b!1064878 (=> (not res!710867) (not e!606982))))

(assert (=> b!1064878 (= res!710867 (and (= (size!33107 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33108 _keys!1163) (size!33107 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064879 () Bool)

(assert (=> b!1064879 (= e!606981 true)))

(declare-fun lt!469421 () ListLongMap!14107)

(declare-fun getCurrentListMap!4029 (array!67737 array!67735 (_ BitVec 32) (_ BitVec 32) V!38969 V!38969 (_ BitVec 32) Int) ListLongMap!14107)

(assert (=> b!1064879 (= lt!469421 (getCurrentListMap!4029 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064880 () Bool)

(declare-fun e!606980 () Bool)

(assert (=> b!1064880 (= e!606980 tp_is_empty!25375)))

(declare-fun b!1064881 () Bool)

(declare-fun e!606978 () Bool)

(declare-fun mapRes!39745 () Bool)

(assert (=> b!1064881 (= e!606978 (and e!606980 mapRes!39745))))

(declare-fun condMapEmpty!39745 () Bool)

(declare-fun mapDefault!39745 () ValueCell!11984)

