; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94442 () Bool)

(assert start!94442)

(declare-fun b_free!21769 () Bool)

(declare-fun b_next!21769 () Bool)

(assert (=> start!94442 (= b_free!21769 (not b_next!21769))))

(declare-fun tp!76754 () Bool)

(declare-fun b_and!34561 () Bool)

(assert (=> start!94442 (= tp!76754 b_and!34561)))

(declare-fun b!1067882 () Bool)

(declare-fun e!609163 () Bool)

(declare-fun tp_is_empty!25579 () Bool)

(assert (=> b!1067882 (= e!609163 tp_is_empty!25579)))

(declare-fun mapIsEmpty!40063 () Bool)

(declare-fun mapRes!40063 () Bool)

(assert (=> mapIsEmpty!40063 mapRes!40063))

(declare-fun b!1067883 () Bool)

(declare-fun res!712607 () Bool)

(declare-fun e!609160 () Bool)

(assert (=> b!1067883 (=> (not res!712607) (not e!609160))))

(declare-datatypes ((array!68141 0))(
  ( (array!68142 (arr!32770 (Array (_ BitVec 32) (_ BitVec 64))) (size!33306 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68141)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68141 (_ BitVec 32)) Bool)

(assert (=> b!1067883 (= res!712607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067884 () Bool)

(declare-fun res!712604 () Bool)

(assert (=> b!1067884 (=> (not res!712604) (not e!609160))))

(declare-datatypes ((List!22855 0))(
  ( (Nil!22852) (Cons!22851 (h!24060 (_ BitVec 64)) (t!32180 List!22855)) )
))
(declare-fun arrayNoDuplicates!0 (array!68141 (_ BitVec 32) List!22855) Bool)

(assert (=> b!1067884 (= res!712604 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22852))))

(declare-fun b!1067885 () Bool)

(declare-fun e!609161 () Bool)

(assert (=> b!1067885 (= e!609161 tp_is_empty!25579)))

(declare-fun mapNonEmpty!40063 () Bool)

(declare-fun tp!76753 () Bool)

(assert (=> mapNonEmpty!40063 (= mapRes!40063 (and tp!76753 e!609161))))

(declare-datatypes ((V!39241 0))(
  ( (V!39242 (val!12840 Int)) )
))
(declare-datatypes ((ValueCell!12086 0))(
  ( (ValueCellFull!12086 (v!15454 V!39241)) (EmptyCell!12086) )
))
(declare-fun mapValue!40063 () ValueCell!12086)

(declare-fun mapRest!40063 () (Array (_ BitVec 32) ValueCell!12086))

(declare-fun mapKey!40063 () (_ BitVec 32))

(declare-datatypes ((array!68143 0))(
  ( (array!68144 (arr!32771 (Array (_ BitVec 32) ValueCell!12086)) (size!33307 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68143)

(assert (=> mapNonEmpty!40063 (= (arr!32771 _values!955) (store mapRest!40063 mapKey!40063 mapValue!40063))))

(declare-fun b!1067886 () Bool)

(declare-fun e!609162 () Bool)

(declare-fun e!609157 () Bool)

(assert (=> b!1067886 (= e!609162 e!609157)))

(declare-fun res!712606 () Bool)

(assert (=> b!1067886 (=> res!712606 e!609157)))

(declare-datatypes ((tuple2!16300 0))(
  ( (tuple2!16301 (_1!8161 (_ BitVec 64)) (_2!8161 V!39241)) )
))
(declare-datatypes ((List!22856 0))(
  ( (Nil!22853) (Cons!22852 (h!24061 tuple2!16300) (t!32181 List!22856)) )
))
(declare-datatypes ((ListLongMap!14269 0))(
  ( (ListLongMap!14270 (toList!7150 List!22856)) )
))
(declare-fun lt!471679 () ListLongMap!14269)

(declare-fun contains!6286 (ListLongMap!14269 (_ BitVec 64)) Bool)

(assert (=> b!1067886 (= res!712606 (contains!6286 lt!471679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39241)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39241)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4083 (array!68141 array!68143 (_ BitVec 32) (_ BitVec 32) V!39241 V!39241 (_ BitVec 32) Int) ListLongMap!14269)

(assert (=> b!1067886 (= lt!471679 (getCurrentListMap!4083 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067887 () Bool)

(assert (=> b!1067887 (= e!609157 true)))

(declare-fun -!635 (ListLongMap!14269 (_ BitVec 64)) ListLongMap!14269)

(assert (=> b!1067887 (= (-!635 lt!471679 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471679)))

(declare-datatypes ((Unit!35097 0))(
  ( (Unit!35098) )
))
(declare-fun lt!471682 () Unit!35097)

(declare-fun removeNotPresentStillSame!45 (ListLongMap!14269 (_ BitVec 64)) Unit!35097)

(assert (=> b!1067887 (= lt!471682 (removeNotPresentStillSame!45 lt!471679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!712605 () Bool)

(assert (=> start!94442 (=> (not res!712605) (not e!609160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94442 (= res!712605 (validMask!0 mask!1515))))

(assert (=> start!94442 e!609160))

(assert (=> start!94442 true))

(assert (=> start!94442 tp_is_empty!25579))

(declare-fun e!609158 () Bool)

(declare-fun array_inv!25370 (array!68143) Bool)

(assert (=> start!94442 (and (array_inv!25370 _values!955) e!609158)))

(assert (=> start!94442 tp!76754))

(declare-fun array_inv!25371 (array!68141) Bool)

(assert (=> start!94442 (array_inv!25371 _keys!1163)))

(declare-fun b!1067888 () Bool)

(assert (=> b!1067888 (= e!609158 (and e!609163 mapRes!40063))))

(declare-fun condMapEmpty!40063 () Bool)

(declare-fun mapDefault!40063 () ValueCell!12086)

