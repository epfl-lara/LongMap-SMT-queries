; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94724 () Bool)

(assert start!94724)

(declare-fun b_free!21977 () Bool)

(declare-fun b_next!21977 () Bool)

(assert (=> start!94724 (= b_free!21977 (not b_next!21977))))

(declare-fun tp!77390 () Bool)

(declare-fun b_and!34807 () Bool)

(assert (=> start!94724 (= tp!77390 b_and!34807)))

(declare-fun b!1070994 () Bool)

(declare-fun res!714444 () Bool)

(declare-fun e!611448 () Bool)

(assert (=> b!1070994 (=> (not res!714444) (not e!611448))))

(declare-datatypes ((array!68551 0))(
  ( (array!68552 (arr!32971 (Array (_ BitVec 32) (_ BitVec 64))) (size!33507 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68551)

(declare-datatypes ((List!23009 0))(
  ( (Nil!23006) (Cons!23005 (h!24214 (_ BitVec 64)) (t!32342 List!23009)) )
))
(declare-fun arrayNoDuplicates!0 (array!68551 (_ BitVec 32) List!23009) Bool)

(assert (=> b!1070994 (= res!714444 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23006))))

(declare-fun b!1070995 () Bool)

(declare-fun e!611447 () Bool)

(assert (=> b!1070995 (= e!611447 true)))

(declare-datatypes ((V!39517 0))(
  ( (V!39518 (val!12944 Int)) )
))
(declare-datatypes ((tuple2!16468 0))(
  ( (tuple2!16469 (_1!8245 (_ BitVec 64)) (_2!8245 V!39517)) )
))
(declare-datatypes ((List!23010 0))(
  ( (Nil!23007) (Cons!23006 (h!24215 tuple2!16468) (t!32343 List!23010)) )
))
(declare-datatypes ((ListLongMap!14437 0))(
  ( (ListLongMap!14438 (toList!7234 List!23010)) )
))
(declare-fun lt!473443 () ListLongMap!14437)

(declare-fun lt!473442 () tuple2!16468)

(declare-fun -!670 (ListLongMap!14437 (_ BitVec 64)) ListLongMap!14437)

(declare-fun +!3169 (ListLongMap!14437 tuple2!16468) ListLongMap!14437)

(assert (=> b!1070995 (= (-!670 (+!3169 lt!473443 lt!473442) #b0000000000000000000000000000000000000000000000000000000000000000) lt!473443)))

(declare-datatypes ((Unit!35264 0))(
  ( (Unit!35265) )
))
(declare-fun lt!473447 () Unit!35264)

(declare-fun zeroValueBefore!47 () V!39517)

(declare-fun addThenRemoveForNewKeyIsSame!40 (ListLongMap!14437 (_ BitVec 64) V!39517) Unit!35264)

(assert (=> b!1070995 (= lt!473447 (addThenRemoveForNewKeyIsSame!40 lt!473443 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473445 () ListLongMap!14437)

(declare-fun lt!473444 () tuple2!16468)

(assert (=> b!1070995 (= lt!473443 (+!3169 lt!473445 lt!473444))))

(declare-fun e!611453 () Bool)

(assert (=> b!1070995 e!611453))

(declare-fun res!714447 () Bool)

(assert (=> b!1070995 (=> (not res!714447) (not e!611453))))

(declare-fun lt!473441 () ListLongMap!14437)

(assert (=> b!1070995 (= res!714447 (= lt!473441 (+!3169 (+!3169 lt!473445 lt!473442) lt!473444)))))

(declare-fun minValue!907 () V!39517)

(assert (=> b!1070995 (= lt!473444 (tuple2!16469 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1070995 (= lt!473442 (tuple2!16469 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12190 0))(
  ( (ValueCellFull!12190 (v!15560 V!39517)) (EmptyCell!12190) )
))
(declare-datatypes ((array!68553 0))(
  ( (array!68554 (arr!32972 (Array (_ BitVec 32) ValueCell!12190)) (size!33508 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68553)

(declare-fun lt!473439 () ListLongMap!14437)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39517)

(declare-fun getCurrentListMap!4136 (array!68551 array!68553 (_ BitVec 32) (_ BitVec 32) V!39517 V!39517 (_ BitVec 32) Int) ListLongMap!14437)

(assert (=> b!1070995 (= lt!473439 (getCurrentListMap!4136 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070995 (= lt!473441 (getCurrentListMap!4136 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40387 () Bool)

(declare-fun mapRes!40387 () Bool)

(assert (=> mapIsEmpty!40387 mapRes!40387))

(declare-fun b!1070996 () Bool)

(declare-fun e!611449 () Bool)

(declare-fun tp_is_empty!25787 () Bool)

(assert (=> b!1070996 (= e!611449 tp_is_empty!25787)))

(declare-fun b!1070998 () Bool)

(declare-fun e!611451 () Bool)

(assert (=> b!1070998 (= e!611451 (and e!611449 mapRes!40387))))

(declare-fun condMapEmpty!40387 () Bool)

(declare-fun mapDefault!40387 () ValueCell!12190)

