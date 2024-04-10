; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94766 () Bool)

(assert start!94766)

(declare-fun b_free!22019 () Bool)

(declare-fun b_next!22019 () Bool)

(assert (=> start!94766 (= b_free!22019 (not b_next!22019))))

(declare-fun tp!77515 () Bool)

(declare-fun b_and!34849 () Bool)

(assert (=> start!94766 (= tp!77515 b_and!34849)))

(declare-fun mapNonEmpty!40450 () Bool)

(declare-fun mapRes!40450 () Bool)

(declare-fun tp!77516 () Bool)

(declare-fun e!611892 () Bool)

(assert (=> mapNonEmpty!40450 (= mapRes!40450 (and tp!77516 e!611892))))

(declare-datatypes ((V!39573 0))(
  ( (V!39574 (val!12965 Int)) )
))
(declare-datatypes ((ValueCell!12211 0))(
  ( (ValueCellFull!12211 (v!15581 V!39573)) (EmptyCell!12211) )
))
(declare-fun mapRest!40450 () (Array (_ BitVec 32) ValueCell!12211))

(declare-fun mapKey!40450 () (_ BitVec 32))

(declare-datatypes ((array!68631 0))(
  ( (array!68632 (arr!33011 (Array (_ BitVec 32) ValueCell!12211)) (size!33547 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68631)

(declare-fun mapValue!40450 () ValueCell!12211)

(assert (=> mapNonEmpty!40450 (= (arr!33011 _values!955) (store mapRest!40450 mapKey!40450 mapValue!40450))))

(declare-fun b!1071561 () Bool)

(declare-fun e!611888 () Bool)

(assert (=> b!1071561 (= e!611888 true)))

(declare-datatypes ((tuple2!16504 0))(
  ( (tuple2!16505 (_1!8263 (_ BitVec 64)) (_2!8263 V!39573)) )
))
(declare-datatypes ((List!23043 0))(
  ( (Nil!23040) (Cons!23039 (h!24248 tuple2!16504) (t!32376 List!23043)) )
))
(declare-datatypes ((ListLongMap!14473 0))(
  ( (ListLongMap!14474 (toList!7252 List!23043)) )
))
(declare-fun lt!474254 () ListLongMap!14473)

(declare-fun lt!474260 () ListLongMap!14473)

(declare-fun -!685 (ListLongMap!14473 (_ BitVec 64)) ListLongMap!14473)

(assert (=> b!1071561 (= lt!474254 (-!685 lt!474260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474256 () ListLongMap!14473)

(declare-fun lt!474257 () ListLongMap!14473)

(assert (=> b!1071561 (= lt!474256 lt!474257)))

(declare-fun zeroValueBefore!47 () V!39573)

(declare-datatypes ((Unit!35300 0))(
  ( (Unit!35301) )
))
(declare-fun lt!474258 () Unit!35300)

(declare-fun minValue!907 () V!39573)

(declare-fun lt!474262 () ListLongMap!14473)

(declare-fun addCommutativeForDiffKeys!730 (ListLongMap!14473 (_ BitVec 64) V!39573 (_ BitVec 64) V!39573) Unit!35300)

(assert (=> b!1071561 (= lt!474258 (addCommutativeForDiffKeys!730 lt!474262 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474265 () ListLongMap!14473)

(assert (=> b!1071561 (= (-!685 lt!474257 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474265)))

(declare-fun lt!474264 () tuple2!16504)

(declare-fun +!3187 (ListLongMap!14473 tuple2!16504) ListLongMap!14473)

(assert (=> b!1071561 (= lt!474257 (+!3187 lt!474265 lt!474264))))

(declare-fun lt!474266 () Unit!35300)

(declare-fun addThenRemoveForNewKeyIsSame!55 (ListLongMap!14473 (_ BitVec 64) V!39573) Unit!35300)

(assert (=> b!1071561 (= lt!474266 (addThenRemoveForNewKeyIsSame!55 lt!474265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474259 () tuple2!16504)

(assert (=> b!1071561 (= lt!474265 (+!3187 lt!474262 lt!474259))))

(declare-fun e!611894 () Bool)

(assert (=> b!1071561 e!611894))

(declare-fun res!714825 () Bool)

(assert (=> b!1071561 (=> (not res!714825) (not e!611894))))

(assert (=> b!1071561 (= res!714825 (= lt!474260 lt!474256))))

(assert (=> b!1071561 (= lt!474256 (+!3187 (+!3187 lt!474262 lt!474264) lt!474259))))

(assert (=> b!1071561 (= lt!474259 (tuple2!16505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071561 (= lt!474264 (tuple2!16505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!474255 () ListLongMap!14473)

(declare-datatypes ((array!68633 0))(
  ( (array!68634 (arr!33012 (Array (_ BitVec 32) (_ BitVec 64))) (size!33548 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68633)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39573)

(declare-fun getCurrentListMap!4151 (array!68633 array!68631 (_ BitVec 32) (_ BitVec 32) V!39573 V!39573 (_ BitVec 32) Int) ListLongMap!14473)

(assert (=> b!1071561 (= lt!474255 (getCurrentListMap!4151 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071561 (= lt!474260 (getCurrentListMap!4151 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071562 () Bool)

(declare-fun lt!474263 () ListLongMap!14473)

(assert (=> b!1071562 (= e!611894 (= lt!474255 (+!3187 lt!474263 lt!474259)))))

(declare-fun b!1071563 () Bool)

(declare-fun res!714826 () Bool)

(declare-fun e!611890 () Bool)

(assert (=> b!1071563 (=> (not res!714826) (not e!611890))))

(declare-datatypes ((List!23044 0))(
  ( (Nil!23041) (Cons!23040 (h!24249 (_ BitVec 64)) (t!32377 List!23044)) )
))
(declare-fun arrayNoDuplicates!0 (array!68633 (_ BitVec 32) List!23044) Bool)

(assert (=> b!1071563 (= res!714826 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23041))))

(declare-fun b!1071565 () Bool)

(declare-fun e!611889 () Bool)

(declare-fun e!611893 () Bool)

(assert (=> b!1071565 (= e!611889 (and e!611893 mapRes!40450))))

(declare-fun condMapEmpty!40450 () Bool)

(declare-fun mapDefault!40450 () ValueCell!12211)

