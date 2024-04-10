; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94084 () Bool)

(assert start!94084)

(declare-fun b_free!21499 () Bool)

(declare-fun b_next!21499 () Bool)

(assert (=> start!94084 (= b_free!21499 (not b_next!21499))))

(declare-fun tp!75929 () Bool)

(declare-fun b_and!34241 () Bool)

(assert (=> start!94084 (= tp!75929 b_and!34241)))

(declare-fun b!1064033 () Bool)

(declare-fun res!710372 () Bool)

(declare-fun e!606365 () Bool)

(assert (=> b!1064033 (=> (not res!710372) (not e!606365))))

(declare-datatypes ((array!67615 0))(
  ( (array!67616 (arr!32512 (Array (_ BitVec 32) (_ BitVec 64))) (size!33048 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67615)

(declare-datatypes ((List!22663 0))(
  ( (Nil!22660) (Cons!22659 (h!23868 (_ BitVec 64)) (t!31978 List!22663)) )
))
(declare-fun arrayNoDuplicates!0 (array!67615 (_ BitVec 32) List!22663) Bool)

(assert (=> b!1064033 (= res!710372 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22660))))

(declare-fun mapIsEmpty!39643 () Bool)

(declare-fun mapRes!39643 () Bool)

(assert (=> mapIsEmpty!39643 mapRes!39643))

(declare-fun res!710371 () Bool)

(assert (=> start!94084 (=> (not res!710371) (not e!606365))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94084 (= res!710371 (validMask!0 mask!1515))))

(assert (=> start!94084 e!606365))

(assert (=> start!94084 true))

(declare-fun tp_is_empty!25309 () Bool)

(assert (=> start!94084 tp_is_empty!25309))

(declare-datatypes ((V!38881 0))(
  ( (V!38882 (val!12705 Int)) )
))
(declare-datatypes ((ValueCell!11951 0))(
  ( (ValueCellFull!11951 (v!15317 V!38881)) (EmptyCell!11951) )
))
(declare-datatypes ((array!67617 0))(
  ( (array!67618 (arr!32513 (Array (_ BitVec 32) ValueCell!11951)) (size!33049 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67617)

(declare-fun e!606364 () Bool)

(declare-fun array_inv!25180 (array!67617) Bool)

(assert (=> start!94084 (and (array_inv!25180 _values!955) e!606364)))

(assert (=> start!94084 tp!75929))

(declare-fun array_inv!25181 (array!67615) Bool)

(assert (=> start!94084 (array_inv!25181 _keys!1163)))

(declare-fun b!1064034 () Bool)

(assert (=> b!1064034 (= e!606365 (not true))))

(declare-datatypes ((tuple2!16088 0))(
  ( (tuple2!16089 (_1!8055 (_ BitVec 64)) (_2!8055 V!38881)) )
))
(declare-datatypes ((List!22664 0))(
  ( (Nil!22661) (Cons!22660 (h!23869 tuple2!16088) (t!31979 List!22664)) )
))
(declare-datatypes ((ListLongMap!14057 0))(
  ( (ListLongMap!14058 (toList!7044 List!22664)) )
))
(declare-fun lt!469018 () ListLongMap!14057)

(declare-fun lt!469016 () ListLongMap!14057)

(assert (=> b!1064034 (= lt!469018 lt!469016)))

(declare-fun zeroValueBefore!47 () V!38881)

(declare-datatypes ((Unit!34888 0))(
  ( (Unit!34889) )
))
(declare-fun lt!469017 () Unit!34888)

(declare-fun minValue!907 () V!38881)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38881)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!673 (array!67615 array!67617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38881 V!38881 V!38881 V!38881 (_ BitVec 32) Int) Unit!34888)

(assert (=> b!1064034 (= lt!469017 (lemmaNoChangeToArrayThenSameMapNoExtras!673 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3636 (array!67615 array!67617 (_ BitVec 32) (_ BitVec 32) V!38881 V!38881 (_ BitVec 32) Int) ListLongMap!14057)

(assert (=> b!1064034 (= lt!469016 (getCurrentListMapNoExtraKeys!3636 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064034 (= lt!469018 (getCurrentListMapNoExtraKeys!3636 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064035 () Bool)

(declare-fun e!606363 () Bool)

(assert (=> b!1064035 (= e!606363 tp_is_empty!25309)))

(declare-fun b!1064036 () Bool)

(assert (=> b!1064036 (= e!606364 (and e!606363 mapRes!39643))))

(declare-fun condMapEmpty!39643 () Bool)

(declare-fun mapDefault!39643 () ValueCell!11951)

