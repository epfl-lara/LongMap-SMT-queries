; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94736 () Bool)

(assert start!94736)

(declare-fun b_free!21989 () Bool)

(declare-fun b_next!21989 () Bool)

(assert (=> start!94736 (= b_free!21989 (not b_next!21989))))

(declare-fun tp!77426 () Bool)

(declare-fun b_and!34819 () Bool)

(assert (=> start!94736 (= tp!77426 b_and!34819)))

(declare-fun res!714551 () Bool)

(declare-fun e!611575 () Bool)

(assert (=> start!94736 (=> (not res!714551) (not e!611575))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94736 (= res!714551 (validMask!0 mask!1515))))

(assert (=> start!94736 e!611575))

(assert (=> start!94736 true))

(declare-fun tp_is_empty!25799 () Bool)

(assert (=> start!94736 tp_is_empty!25799))

(declare-datatypes ((V!39533 0))(
  ( (V!39534 (val!12950 Int)) )
))
(declare-datatypes ((ValueCell!12196 0))(
  ( (ValueCellFull!12196 (v!15566 V!39533)) (EmptyCell!12196) )
))
(declare-datatypes ((array!68575 0))(
  ( (array!68576 (arr!32983 (Array (_ BitVec 32) ValueCell!12196)) (size!33519 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68575)

(declare-fun e!611578 () Bool)

(declare-fun array_inv!25510 (array!68575) Bool)

(assert (=> start!94736 (and (array_inv!25510 _values!955) e!611578)))

(assert (=> start!94736 tp!77426))

(declare-datatypes ((array!68577 0))(
  ( (array!68578 (arr!32984 (Array (_ BitVec 32) (_ BitVec 64))) (size!33520 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68577)

(declare-fun array_inv!25511 (array!68577) Bool)

(assert (=> start!94736 (array_inv!25511 _keys!1163)))

(declare-fun b!1071156 () Bool)

(declare-fun e!611577 () Bool)

(assert (=> b!1071156 (= e!611577 true)))

(declare-datatypes ((tuple2!16480 0))(
  ( (tuple2!16481 (_1!8251 (_ BitVec 64)) (_2!8251 V!39533)) )
))
(declare-datatypes ((List!23021 0))(
  ( (Nil!23018) (Cons!23017 (h!24226 tuple2!16480) (t!32354 List!23021)) )
))
(declare-datatypes ((ListLongMap!14449 0))(
  ( (ListLongMap!14450 (toList!7240 List!23021)) )
))
(declare-fun lt!473676 () ListLongMap!14449)

(declare-fun lt!473677 () ListLongMap!14449)

(declare-fun -!675 (ListLongMap!14449 (_ BitVec 64)) ListLongMap!14449)

(assert (=> b!1071156 (= lt!473676 (-!675 lt!473677 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473672 () ListLongMap!14449)

(declare-fun lt!473675 () ListLongMap!14449)

(assert (=> b!1071156 (= lt!473672 lt!473675)))

(declare-fun zeroValueBefore!47 () V!39533)

(declare-datatypes ((Unit!35276 0))(
  ( (Unit!35277) )
))
(declare-fun lt!473680 () Unit!35276)

(declare-fun minValue!907 () V!39533)

(declare-fun lt!473681 () ListLongMap!14449)

(declare-fun addCommutativeForDiffKeys!720 (ListLongMap!14449 (_ BitVec 64) V!39533 (_ BitVec 64) V!39533) Unit!35276)

(assert (=> b!1071156 (= lt!473680 (addCommutativeForDiffKeys!720 lt!473681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473669 () ListLongMap!14449)

(assert (=> b!1071156 (= (-!675 lt!473675 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473669)))

(declare-fun lt!473671 () tuple2!16480)

(declare-fun +!3175 (ListLongMap!14449 tuple2!16480) ListLongMap!14449)

(assert (=> b!1071156 (= lt!473675 (+!3175 lt!473669 lt!473671))))

(declare-fun lt!473678 () Unit!35276)

(declare-fun addThenRemoveForNewKeyIsSame!45 (ListLongMap!14449 (_ BitVec 64) V!39533) Unit!35276)

(assert (=> b!1071156 (= lt!473678 (addThenRemoveForNewKeyIsSame!45 lt!473669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473670 () tuple2!16480)

(assert (=> b!1071156 (= lt!473669 (+!3175 lt!473681 lt!473670))))

(declare-fun e!611579 () Bool)

(assert (=> b!1071156 e!611579))

(declare-fun res!714554 () Bool)

(assert (=> b!1071156 (=> (not res!714554) (not e!611579))))

(assert (=> b!1071156 (= res!714554 (= lt!473677 lt!473672))))

(assert (=> b!1071156 (= lt!473672 (+!3175 (+!3175 lt!473681 lt!473671) lt!473670))))

(assert (=> b!1071156 (= lt!473670 (tuple2!16481 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071156 (= lt!473671 (tuple2!16481 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473673 () ListLongMap!14449)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39533)

(declare-fun getCurrentListMap!4141 (array!68577 array!68575 (_ BitVec 32) (_ BitVec 32) V!39533 V!39533 (_ BitVec 32) Int) ListLongMap!14449)

(assert (=> b!1071156 (= lt!473673 (getCurrentListMap!4141 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071156 (= lt!473677 (getCurrentListMap!4141 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071157 () Bool)

(declare-fun res!714556 () Bool)

(assert (=> b!1071157 (=> (not res!714556) (not e!611575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68577 (_ BitVec 32)) Bool)

(assert (=> b!1071157 (= res!714556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40405 () Bool)

(declare-fun mapRes!40405 () Bool)

(declare-fun tp!77425 () Bool)

(declare-fun e!611576 () Bool)

(assert (=> mapNonEmpty!40405 (= mapRes!40405 (and tp!77425 e!611576))))

(declare-fun mapRest!40405 () (Array (_ BitVec 32) ValueCell!12196))

(declare-fun mapValue!40405 () ValueCell!12196)

(declare-fun mapKey!40405 () (_ BitVec 32))

(assert (=> mapNonEmpty!40405 (= (arr!32983 _values!955) (store mapRest!40405 mapKey!40405 mapValue!40405))))

(declare-fun b!1071158 () Bool)

(assert (=> b!1071158 (= e!611575 (not e!611577))))

(declare-fun res!714555 () Bool)

(assert (=> b!1071158 (=> res!714555 e!611577)))

(assert (=> b!1071158 (= res!714555 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473674 () ListLongMap!14449)

(assert (=> b!1071158 (= lt!473681 lt!473674)))

(declare-fun lt!473679 () Unit!35276)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!849 (array!68577 array!68575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39533 V!39533 V!39533 V!39533 (_ BitVec 32) Int) Unit!35276)

(assert (=> b!1071158 (= lt!473679 (lemmaNoChangeToArrayThenSameMapNoExtras!849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3812 (array!68577 array!68575 (_ BitVec 32) (_ BitVec 32) V!39533 V!39533 (_ BitVec 32) Int) ListLongMap!14449)

(assert (=> b!1071158 (= lt!473674 (getCurrentListMapNoExtraKeys!3812 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071158 (= lt!473681 (getCurrentListMapNoExtraKeys!3812 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071159 () Bool)

(assert (=> b!1071159 (= e!611579 (= lt!473673 (+!3175 lt!473674 lt!473670)))))

(declare-fun mapIsEmpty!40405 () Bool)

(assert (=> mapIsEmpty!40405 mapRes!40405))

(declare-fun b!1071160 () Bool)

(declare-fun res!714552 () Bool)

(assert (=> b!1071160 (=> (not res!714552) (not e!611575))))

(assert (=> b!1071160 (= res!714552 (and (= (size!33519 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33520 _keys!1163) (size!33519 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071161 () Bool)

(assert (=> b!1071161 (= e!611576 tp_is_empty!25799)))

(declare-fun b!1071162 () Bool)

(declare-fun res!714553 () Bool)

(assert (=> b!1071162 (=> (not res!714553) (not e!611575))))

(declare-datatypes ((List!23022 0))(
  ( (Nil!23019) (Cons!23018 (h!24227 (_ BitVec 64)) (t!32355 List!23022)) )
))
(declare-fun arrayNoDuplicates!0 (array!68577 (_ BitVec 32) List!23022) Bool)

(assert (=> b!1071162 (= res!714553 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23019))))

(declare-fun b!1071163 () Bool)

(declare-fun e!611573 () Bool)

(assert (=> b!1071163 (= e!611573 tp_is_empty!25799)))

(declare-fun b!1071164 () Bool)

(assert (=> b!1071164 (= e!611578 (and e!611573 mapRes!40405))))

(declare-fun condMapEmpty!40405 () Bool)

(declare-fun mapDefault!40405 () ValueCell!12196)

