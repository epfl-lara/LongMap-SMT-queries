; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94730 () Bool)

(assert start!94730)

(declare-fun b_free!21983 () Bool)

(declare-fun b_next!21983 () Bool)

(assert (=> start!94730 (= b_free!21983 (not b_next!21983))))

(declare-fun tp!77408 () Bool)

(declare-fun b_and!34813 () Bool)

(assert (=> start!94730 (= tp!77408 b_and!34813)))

(declare-fun b!1071075 () Bool)

(declare-datatypes ((V!39525 0))(
  ( (V!39526 (val!12947 Int)) )
))
(declare-datatypes ((tuple2!16474 0))(
  ( (tuple2!16475 (_1!8248 (_ BitVec 64)) (_2!8248 V!39525)) )
))
(declare-fun lt!473554 () tuple2!16474)

(declare-datatypes ((List!23015 0))(
  ( (Nil!23012) (Cons!23011 (h!24220 tuple2!16474) (t!32348 List!23015)) )
))
(declare-datatypes ((ListLongMap!14443 0))(
  ( (ListLongMap!14444 (toList!7237 List!23015)) )
))
(declare-fun lt!473560 () ListLongMap!14443)

(declare-fun e!611513 () Bool)

(declare-fun lt!473557 () ListLongMap!14443)

(declare-fun +!3172 (ListLongMap!14443 tuple2!16474) ListLongMap!14443)

(assert (=> b!1071075 (= e!611513 (= lt!473560 (+!3172 lt!473557 lt!473554)))))

(declare-fun b!1071076 () Bool)

(declare-fun res!714502 () Bool)

(declare-fun e!611510 () Bool)

(assert (=> b!1071076 (=> (not res!714502) (not e!611510))))

(declare-datatypes ((array!68563 0))(
  ( (array!68564 (arr!32977 (Array (_ BitVec 32) (_ BitVec 64))) (size!33513 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68563)

(declare-datatypes ((List!23016 0))(
  ( (Nil!23013) (Cons!23012 (h!24221 (_ BitVec 64)) (t!32349 List!23016)) )
))
(declare-fun arrayNoDuplicates!0 (array!68563 (_ BitVec 32) List!23016) Bool)

(assert (=> b!1071076 (= res!714502 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23013))))

(declare-fun b!1071077 () Bool)

(declare-fun e!611515 () Bool)

(declare-fun tp_is_empty!25793 () Bool)

(assert (=> b!1071077 (= e!611515 tp_is_empty!25793)))

(declare-fun mapNonEmpty!40396 () Bool)

(declare-fun mapRes!40396 () Bool)

(declare-fun tp!77407 () Bool)

(declare-fun e!611512 () Bool)

(assert (=> mapNonEmpty!40396 (= mapRes!40396 (and tp!77407 e!611512))))

(declare-datatypes ((ValueCell!12193 0))(
  ( (ValueCellFull!12193 (v!15563 V!39525)) (EmptyCell!12193) )
))
(declare-fun mapRest!40396 () (Array (_ BitVec 32) ValueCell!12193))

(declare-datatypes ((array!68565 0))(
  ( (array!68566 (arr!32978 (Array (_ BitVec 32) ValueCell!12193)) (size!33514 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68565)

(declare-fun mapKey!40396 () (_ BitVec 32))

(declare-fun mapValue!40396 () ValueCell!12193)

(assert (=> mapNonEmpty!40396 (= (arr!32978 _values!955) (store mapRest!40396 mapKey!40396 mapValue!40396))))

(declare-fun res!714499 () Bool)

(assert (=> start!94730 (=> (not res!714499) (not e!611510))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94730 (= res!714499 (validMask!0 mask!1515))))

(assert (=> start!94730 e!611510))

(assert (=> start!94730 true))

(assert (=> start!94730 tp_is_empty!25793))

(declare-fun e!611516 () Bool)

(declare-fun array_inv!25504 (array!68565) Bool)

(assert (=> start!94730 (and (array_inv!25504 _values!955) e!611516)))

(assert (=> start!94730 tp!77408))

(declare-fun array_inv!25505 (array!68563) Bool)

(assert (=> start!94730 (array_inv!25505 _keys!1163)))

(declare-fun b!1071078 () Bool)

(declare-fun res!714497 () Bool)

(assert (=> b!1071078 (=> (not res!714497) (not e!611510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68563 (_ BitVec 32)) Bool)

(assert (=> b!1071078 (= res!714497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071079 () Bool)

(declare-fun e!611514 () Bool)

(assert (=> b!1071079 (= e!611514 true)))

(declare-fun lt!473556 () ListLongMap!14443)

(declare-fun lt!473558 () ListLongMap!14443)

(declare-fun -!673 (ListLongMap!14443 (_ BitVec 64)) ListLongMap!14443)

(assert (=> b!1071079 (= lt!473556 (-!673 lt!473558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473561 () ListLongMap!14443)

(declare-fun lt!473555 () ListLongMap!14443)

(assert (=> b!1071079 (= lt!473561 lt!473555)))

(declare-fun zeroValueBefore!47 () V!39525)

(declare-datatypes ((Unit!35270 0))(
  ( (Unit!35271) )
))
(declare-fun lt!473564 () Unit!35270)

(declare-fun minValue!907 () V!39525)

(declare-fun lt!473559 () ListLongMap!14443)

(declare-fun addCommutativeForDiffKeys!718 (ListLongMap!14443 (_ BitVec 64) V!39525 (_ BitVec 64) V!39525) Unit!35270)

(assert (=> b!1071079 (= lt!473564 (addCommutativeForDiffKeys!718 lt!473559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473563 () ListLongMap!14443)

(assert (=> b!1071079 (= (-!673 lt!473555 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473563)))

(declare-fun lt!473562 () tuple2!16474)

(assert (=> b!1071079 (= lt!473555 (+!3172 lt!473563 lt!473562))))

(declare-fun lt!473553 () Unit!35270)

(declare-fun addThenRemoveForNewKeyIsSame!43 (ListLongMap!14443 (_ BitVec 64) V!39525) Unit!35270)

(assert (=> b!1071079 (= lt!473553 (addThenRemoveForNewKeyIsSame!43 lt!473563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1071079 (= lt!473563 (+!3172 lt!473559 lt!473554))))

(assert (=> b!1071079 e!611513))

(declare-fun res!714498 () Bool)

(assert (=> b!1071079 (=> (not res!714498) (not e!611513))))

(assert (=> b!1071079 (= res!714498 (= lt!473558 lt!473561))))

(assert (=> b!1071079 (= lt!473561 (+!3172 (+!3172 lt!473559 lt!473562) lt!473554))))

(assert (=> b!1071079 (= lt!473554 (tuple2!16475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071079 (= lt!473562 (tuple2!16475 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39525)

(declare-fun getCurrentListMap!4139 (array!68563 array!68565 (_ BitVec 32) (_ BitVec 32) V!39525 V!39525 (_ BitVec 32) Int) ListLongMap!14443)

(assert (=> b!1071079 (= lt!473560 (getCurrentListMap!4139 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071079 (= lt!473558 (getCurrentListMap!4139 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40396 () Bool)

(assert (=> mapIsEmpty!40396 mapRes!40396))

(declare-fun b!1071080 () Bool)

(assert (=> b!1071080 (= e!611510 (not e!611514))))

(declare-fun res!714501 () Bool)

(assert (=> b!1071080 (=> res!714501 e!611514)))

(assert (=> b!1071080 (= res!714501 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071080 (= lt!473559 lt!473557)))

(declare-fun lt!473552 () Unit!35270)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!846 (array!68563 array!68565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39525 V!39525 V!39525 V!39525 (_ BitVec 32) Int) Unit!35270)

(assert (=> b!1071080 (= lt!473552 (lemmaNoChangeToArrayThenSameMapNoExtras!846 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3809 (array!68563 array!68565 (_ BitVec 32) (_ BitVec 32) V!39525 V!39525 (_ BitVec 32) Int) ListLongMap!14443)

(assert (=> b!1071080 (= lt!473557 (getCurrentListMapNoExtraKeys!3809 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071080 (= lt!473559 (getCurrentListMapNoExtraKeys!3809 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071081 () Bool)

(assert (=> b!1071081 (= e!611512 tp_is_empty!25793)))

(declare-fun b!1071082 () Bool)

(assert (=> b!1071082 (= e!611516 (and e!611515 mapRes!40396))))

(declare-fun condMapEmpty!40396 () Bool)

(declare-fun mapDefault!40396 () ValueCell!12193)

