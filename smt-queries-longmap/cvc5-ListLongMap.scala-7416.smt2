; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94310 () Bool)

(assert start!94310)

(declare-fun b_free!21673 () Bool)

(declare-fun b_next!21673 () Bool)

(assert (=> start!94310 (= b_free!21673 (not b_next!21673))))

(declare-fun tp!76460 () Bool)

(declare-fun b_and!34445 () Bool)

(assert (=> start!94310 (= tp!76460 b_and!34445)))

(declare-fun mapNonEmpty!39913 () Bool)

(declare-fun mapRes!39913 () Bool)

(declare-fun tp!76459 () Bool)

(declare-fun e!608172 () Bool)

(assert (=> mapNonEmpty!39913 (= mapRes!39913 (and tp!76459 e!608172))))

(declare-datatypes ((V!39113 0))(
  ( (V!39114 (val!12792 Int)) )
))
(declare-datatypes ((ValueCell!12038 0))(
  ( (ValueCellFull!12038 (v!15405 V!39113)) (EmptyCell!12038) )
))
(declare-fun mapRest!39913 () (Array (_ BitVec 32) ValueCell!12038))

(declare-fun mapValue!39913 () ValueCell!12038)

(declare-datatypes ((array!67951 0))(
  ( (array!67952 (arr!32677 (Array (_ BitVec 32) ValueCell!12038)) (size!33213 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67951)

(declare-fun mapKey!39913 () (_ BitVec 32))

(assert (=> mapNonEmpty!39913 (= (arr!32677 _values!955) (store mapRest!39913 mapKey!39913 mapValue!39913))))

(declare-fun b!1066513 () Bool)

(declare-fun res!711823 () Bool)

(declare-fun e!608171 () Bool)

(assert (=> b!1066513 (=> (not res!711823) (not e!608171))))

(declare-datatypes ((array!67953 0))(
  ( (array!67954 (arr!32678 (Array (_ BitVec 32) (_ BitVec 64))) (size!33214 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67953)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67953 (_ BitVec 32)) Bool)

(assert (=> b!1066513 (= res!711823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066514 () Bool)

(declare-fun e!608174 () Bool)

(assert (=> b!1066514 (= e!608174 true)))

(declare-datatypes ((tuple2!16224 0))(
  ( (tuple2!16225 (_1!8123 (_ BitVec 64)) (_2!8123 V!39113)) )
))
(declare-datatypes ((List!22787 0))(
  ( (Nil!22784) (Cons!22783 (h!23992 tuple2!16224) (t!32108 List!22787)) )
))
(declare-datatypes ((ListLongMap!14193 0))(
  ( (ListLongMap!14194 (toList!7112 List!22787)) )
))
(declare-fun lt!470878 () ListLongMap!14193)

(declare-fun lt!470877 () ListLongMap!14193)

(declare-fun -!622 (ListLongMap!14193 (_ BitVec 64)) ListLongMap!14193)

(assert (=> b!1066514 (= lt!470878 (-!622 lt!470877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470882 () ListLongMap!14193)

(declare-fun lt!470881 () ListLongMap!14193)

(assert (=> b!1066514 (= (-!622 lt!470882 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470881)))

(declare-datatypes ((Unit!35019 0))(
  ( (Unit!35020) )
))
(declare-fun lt!470879 () Unit!35019)

(declare-fun zeroValueBefore!47 () V!39113)

(declare-fun addThenRemoveForNewKeyIsSame!31 (ListLongMap!14193 (_ BitVec 64) V!39113) Unit!35019)

(assert (=> b!1066514 (= lt!470879 (addThenRemoveForNewKeyIsSame!31 lt!470881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470883 () ListLongMap!14193)

(declare-fun lt!470876 () ListLongMap!14193)

(assert (=> b!1066514 (and (= lt!470877 lt!470882) (= lt!470876 lt!470883))))

(declare-fun +!3153 (ListLongMap!14193 tuple2!16224) ListLongMap!14193)

(assert (=> b!1066514 (= lt!470882 (+!3153 lt!470881 (tuple2!16225 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39113)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39113)

(declare-fun getCurrentListMap!4066 (array!67953 array!67951 (_ BitVec 32) (_ BitVec 32) V!39113 V!39113 (_ BitVec 32) Int) ListLongMap!14193)

(assert (=> b!1066514 (= lt!470876 (getCurrentListMap!4066 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066514 (= lt!470877 (getCurrentListMap!4066 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066515 () Bool)

(declare-fun res!711826 () Bool)

(assert (=> b!1066515 (=> (not res!711826) (not e!608171))))

(assert (=> b!1066515 (= res!711826 (and (= (size!33213 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33214 _keys!1163) (size!33213 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066516 () Bool)

(declare-fun e!608176 () Bool)

(declare-fun tp_is_empty!25483 () Bool)

(assert (=> b!1066516 (= e!608176 tp_is_empty!25483)))

(declare-fun b!1066517 () Bool)

(declare-fun res!711824 () Bool)

(assert (=> b!1066517 (=> (not res!711824) (not e!608171))))

(declare-datatypes ((List!22788 0))(
  ( (Nil!22785) (Cons!22784 (h!23993 (_ BitVec 64)) (t!32109 List!22788)) )
))
(declare-fun arrayNoDuplicates!0 (array!67953 (_ BitVec 32) List!22788) Bool)

(assert (=> b!1066517 (= res!711824 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22785))))

(declare-fun b!1066518 () Bool)

(assert (=> b!1066518 (= e!608172 tp_is_empty!25483)))

(declare-fun b!1066519 () Bool)

(declare-fun e!608173 () Bool)

(assert (=> b!1066519 (= e!608173 (and e!608176 mapRes!39913))))

(declare-fun condMapEmpty!39913 () Bool)

(declare-fun mapDefault!39913 () ValueCell!12038)

