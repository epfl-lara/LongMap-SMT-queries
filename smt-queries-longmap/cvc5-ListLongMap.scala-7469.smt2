; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94738 () Bool)

(assert start!94738)

(declare-fun b_free!21991 () Bool)

(declare-fun b_next!21991 () Bool)

(assert (=> start!94738 (= b_free!21991 (not b_next!21991))))

(declare-fun tp!77431 () Bool)

(declare-fun b_and!34821 () Bool)

(assert (=> start!94738 (= tp!77431 b_and!34821)))

(declare-fun b!1071183 () Bool)

(declare-fun res!714571 () Bool)

(declare-fun e!611599 () Bool)

(assert (=> b!1071183 (=> (not res!714571) (not e!611599))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39537 0))(
  ( (V!39538 (val!12951 Int)) )
))
(declare-datatypes ((ValueCell!12197 0))(
  ( (ValueCellFull!12197 (v!15567 V!39537)) (EmptyCell!12197) )
))
(declare-datatypes ((array!68579 0))(
  ( (array!68580 (arr!32985 (Array (_ BitVec 32) ValueCell!12197)) (size!33521 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68579)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68581 0))(
  ( (array!68582 (arr!32986 (Array (_ BitVec 32) (_ BitVec 64))) (size!33522 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68581)

(assert (=> b!1071183 (= res!714571 (and (= (size!33521 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33522 _keys!1163) (size!33521 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071184 () Bool)

(declare-fun e!611595 () Bool)

(declare-fun tp_is_empty!25801 () Bool)

(assert (=> b!1071184 (= e!611595 tp_is_empty!25801)))

(declare-fun b!1071185 () Bool)

(declare-fun res!714573 () Bool)

(assert (=> b!1071185 (=> (not res!714573) (not e!611599))))

(declare-datatypes ((List!23023 0))(
  ( (Nil!23020) (Cons!23019 (h!24228 (_ BitVec 64)) (t!32356 List!23023)) )
))
(declare-fun arrayNoDuplicates!0 (array!68581 (_ BitVec 32) List!23023) Bool)

(assert (=> b!1071185 (= res!714573 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23020))))

(declare-fun b!1071187 () Bool)

(declare-fun e!611596 () Bool)

(assert (=> b!1071187 (= e!611596 true)))

(declare-datatypes ((tuple2!16482 0))(
  ( (tuple2!16483 (_1!8252 (_ BitVec 64)) (_2!8252 V!39537)) )
))
(declare-datatypes ((List!23024 0))(
  ( (Nil!23021) (Cons!23020 (h!24229 tuple2!16482) (t!32357 List!23024)) )
))
(declare-datatypes ((ListLongMap!14451 0))(
  ( (ListLongMap!14452 (toList!7241 List!23024)) )
))
(declare-fun lt!473711 () ListLongMap!14451)

(declare-fun lt!473716 () ListLongMap!14451)

(declare-fun -!676 (ListLongMap!14451 (_ BitVec 64)) ListLongMap!14451)

(assert (=> b!1071187 (= lt!473711 (-!676 lt!473716 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473710 () ListLongMap!14451)

(declare-fun lt!473715 () ListLongMap!14451)

(assert (=> b!1071187 (= lt!473710 lt!473715)))

(declare-fun zeroValueBefore!47 () V!39537)

(declare-datatypes ((Unit!35278 0))(
  ( (Unit!35279) )
))
(declare-fun lt!473712 () Unit!35278)

(declare-fun minValue!907 () V!39537)

(declare-fun lt!473708 () ListLongMap!14451)

(declare-fun addCommutativeForDiffKeys!721 (ListLongMap!14451 (_ BitVec 64) V!39537 (_ BitVec 64) V!39537) Unit!35278)

(assert (=> b!1071187 (= lt!473712 (addCommutativeForDiffKeys!721 lt!473708 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473718 () ListLongMap!14451)

(assert (=> b!1071187 (= (-!676 lt!473715 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473718)))

(declare-fun lt!473713 () tuple2!16482)

(declare-fun +!3176 (ListLongMap!14451 tuple2!16482) ListLongMap!14451)

(assert (=> b!1071187 (= lt!473715 (+!3176 lt!473718 lt!473713))))

(declare-fun lt!473717 () Unit!35278)

(declare-fun addThenRemoveForNewKeyIsSame!46 (ListLongMap!14451 (_ BitVec 64) V!39537) Unit!35278)

(assert (=> b!1071187 (= lt!473717 (addThenRemoveForNewKeyIsSame!46 lt!473718 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473719 () tuple2!16482)

(assert (=> b!1071187 (= lt!473718 (+!3176 lt!473708 lt!473719))))

(declare-fun e!611598 () Bool)

(assert (=> b!1071187 e!611598))

(declare-fun res!714570 () Bool)

(assert (=> b!1071187 (=> (not res!714570) (not e!611598))))

(assert (=> b!1071187 (= res!714570 (= lt!473716 lt!473710))))

(assert (=> b!1071187 (= lt!473710 (+!3176 (+!3176 lt!473708 lt!473713) lt!473719))))

(assert (=> b!1071187 (= lt!473719 (tuple2!16483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071187 (= lt!473713 (tuple2!16483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473714 () ListLongMap!14451)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39537)

(declare-fun getCurrentListMap!4142 (array!68581 array!68579 (_ BitVec 32) (_ BitVec 32) V!39537 V!39537 (_ BitVec 32) Int) ListLongMap!14451)

(assert (=> b!1071187 (= lt!473714 (getCurrentListMap!4142 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071187 (= lt!473716 (getCurrentListMap!4142 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071188 () Bool)

(declare-fun e!611600 () Bool)

(declare-fun e!611597 () Bool)

(declare-fun mapRes!40408 () Bool)

(assert (=> b!1071188 (= e!611600 (and e!611597 mapRes!40408))))

(declare-fun condMapEmpty!40408 () Bool)

(declare-fun mapDefault!40408 () ValueCell!12197)

