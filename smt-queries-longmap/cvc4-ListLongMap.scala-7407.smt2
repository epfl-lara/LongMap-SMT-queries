; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94238 () Bool)

(assert start!94238)

(declare-fun b_free!21623 () Bool)

(declare-fun b_next!21623 () Bool)

(assert (=> start!94238 (= b_free!21623 (not b_next!21623))))

(declare-fun tp!76306 () Bool)

(declare-fun b_and!34383 () Bool)

(assert (=> start!94238 (= tp!76306 b_and!34383)))

(declare-fun res!711369 () Bool)

(declare-fun e!607604 () Bool)

(assert (=> start!94238 (=> (not res!711369) (not e!607604))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94238 (= res!711369 (validMask!0 mask!1515))))

(assert (=> start!94238 e!607604))

(assert (=> start!94238 true))

(declare-fun tp_is_empty!25433 () Bool)

(assert (=> start!94238 tp_is_empty!25433))

(declare-datatypes ((V!39045 0))(
  ( (V!39046 (val!12767 Int)) )
))
(declare-datatypes ((ValueCell!12013 0))(
  ( (ValueCellFull!12013 (v!15379 V!39045)) (EmptyCell!12013) )
))
(declare-datatypes ((array!67851 0))(
  ( (array!67852 (arr!32628 (Array (_ BitVec 32) ValueCell!12013)) (size!33164 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67851)

(declare-fun e!607606 () Bool)

(declare-fun array_inv!25266 (array!67851) Bool)

(assert (=> start!94238 (and (array_inv!25266 _values!955) e!607606)))

(assert (=> start!94238 tp!76306))

(declare-datatypes ((array!67853 0))(
  ( (array!67854 (arr!32629 (Array (_ BitVec 32) (_ BitVec 64))) (size!33165 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67853)

(declare-fun array_inv!25267 (array!67853) Bool)

(assert (=> start!94238 (array_inv!25267 _keys!1163)))

(declare-fun mapIsEmpty!39835 () Bool)

(declare-fun mapRes!39835 () Bool)

(assert (=> mapIsEmpty!39835 mapRes!39835))

(declare-fun b!1065729 () Bool)

(declare-fun e!607605 () Bool)

(assert (=> b!1065729 (= e!607604 (not e!607605))))

(declare-fun res!711365 () Bool)

(assert (=> b!1065729 (=> res!711365 e!607605)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065729 (= res!711365 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16186 0))(
  ( (tuple2!16187 (_1!8104 (_ BitVec 64)) (_2!8104 V!39045)) )
))
(declare-datatypes ((List!22752 0))(
  ( (Nil!22749) (Cons!22748 (h!23957 tuple2!16186) (t!32071 List!22752)) )
))
(declare-datatypes ((ListLongMap!14155 0))(
  ( (ListLongMap!14156 (toList!7093 List!22752)) )
))
(declare-fun lt!470139 () ListLongMap!14155)

(declare-fun lt!470140 () ListLongMap!14155)

(assert (=> b!1065729 (= lt!470139 lt!470140)))

(declare-fun zeroValueBefore!47 () V!39045)

(declare-fun minValue!907 () V!39045)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39045)

(declare-datatypes ((Unit!34979 0))(
  ( (Unit!34980) )
))
(declare-fun lt!470143 () Unit!34979)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!716 (array!67853 array!67851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39045 V!39045 V!39045 V!39045 (_ BitVec 32) Int) Unit!34979)

(assert (=> b!1065729 (= lt!470143 (lemmaNoChangeToArrayThenSameMapNoExtras!716 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3679 (array!67853 array!67851 (_ BitVec 32) (_ BitVec 32) V!39045 V!39045 (_ BitVec 32) Int) ListLongMap!14155)

(assert (=> b!1065729 (= lt!470140 (getCurrentListMapNoExtraKeys!3679 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065729 (= lt!470139 (getCurrentListMapNoExtraKeys!3679 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065730 () Bool)

(declare-fun res!711368 () Bool)

(assert (=> b!1065730 (=> (not res!711368) (not e!607604))))

(assert (=> b!1065730 (= res!711368 (and (= (size!33164 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33165 _keys!1163) (size!33164 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065731 () Bool)

(declare-fun e!607602 () Bool)

(assert (=> b!1065731 (= e!607602 tp_is_empty!25433)))

(declare-fun b!1065732 () Bool)

(declare-fun res!711367 () Bool)

(assert (=> b!1065732 (=> (not res!711367) (not e!607604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67853 (_ BitVec 32)) Bool)

(assert (=> b!1065732 (= res!711367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065733 () Bool)

(declare-fun res!711366 () Bool)

(assert (=> b!1065733 (=> (not res!711366) (not e!607604))))

(declare-datatypes ((List!22753 0))(
  ( (Nil!22750) (Cons!22749 (h!23958 (_ BitVec 64)) (t!32072 List!22753)) )
))
(declare-fun arrayNoDuplicates!0 (array!67853 (_ BitVec 32) List!22753) Bool)

(assert (=> b!1065733 (= res!711366 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22750))))

(declare-fun b!1065734 () Bool)

(assert (=> b!1065734 (= e!607605 true)))

(declare-fun lt!470141 () ListLongMap!14155)

(declare-fun lt!470138 () ListLongMap!14155)

(declare-fun -!608 (ListLongMap!14155 (_ BitVec 64)) ListLongMap!14155)

(assert (=> b!1065734 (= lt!470141 (-!608 lt!470138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470145 () ListLongMap!14155)

(assert (=> b!1065734 (= (-!608 lt!470145 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470139)))

(declare-fun lt!470142 () Unit!34979)

(declare-fun addThenRemoveForNewKeyIsSame!17 (ListLongMap!14155 (_ BitVec 64) V!39045) Unit!34979)

(assert (=> b!1065734 (= lt!470142 (addThenRemoveForNewKeyIsSame!17 lt!470139 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470144 () ListLongMap!14155)

(assert (=> b!1065734 (and (= lt!470138 lt!470145) (= lt!470144 lt!470140))))

(declare-fun +!3139 (ListLongMap!14155 tuple2!16186) ListLongMap!14155)

(assert (=> b!1065734 (= lt!470145 (+!3139 lt!470139 (tuple2!16187 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4052 (array!67853 array!67851 (_ BitVec 32) (_ BitVec 32) V!39045 V!39045 (_ BitVec 32) Int) ListLongMap!14155)

(assert (=> b!1065734 (= lt!470144 (getCurrentListMap!4052 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065734 (= lt!470138 (getCurrentListMap!4052 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065735 () Bool)

(declare-fun e!607603 () Bool)

(assert (=> b!1065735 (= e!607603 tp_is_empty!25433)))

(declare-fun mapNonEmpty!39835 () Bool)

(declare-fun tp!76307 () Bool)

(assert (=> mapNonEmpty!39835 (= mapRes!39835 (and tp!76307 e!607603))))

(declare-fun mapRest!39835 () (Array (_ BitVec 32) ValueCell!12013))

(declare-fun mapValue!39835 () ValueCell!12013)

(declare-fun mapKey!39835 () (_ BitVec 32))

(assert (=> mapNonEmpty!39835 (= (arr!32628 _values!955) (store mapRest!39835 mapKey!39835 mapValue!39835))))

(declare-fun b!1065736 () Bool)

(assert (=> b!1065736 (= e!607606 (and e!607602 mapRes!39835))))

(declare-fun condMapEmpty!39835 () Bool)

(declare-fun mapDefault!39835 () ValueCell!12013)

