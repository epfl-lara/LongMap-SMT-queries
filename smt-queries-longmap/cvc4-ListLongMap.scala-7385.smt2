; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94076 () Bool)

(assert start!94076)

(declare-fun b_free!21491 () Bool)

(declare-fun b_next!21491 () Bool)

(assert (=> start!94076 (= b_free!21491 (not b_next!21491))))

(declare-fun tp!75904 () Bool)

(declare-fun b_and!34233 () Bool)

(assert (=> start!94076 (= tp!75904 b_and!34233)))

(declare-fun b!1063949 () Bool)

(declare-fun e!606303 () Bool)

(assert (=> b!1063949 (= e!606303 (not true))))

(declare-datatypes ((V!38869 0))(
  ( (V!38870 (val!12701 Int)) )
))
(declare-datatypes ((tuple2!16084 0))(
  ( (tuple2!16085 (_1!8053 (_ BitVec 64)) (_2!8053 V!38869)) )
))
(declare-datatypes ((List!22660 0))(
  ( (Nil!22657) (Cons!22656 (h!23865 tuple2!16084) (t!31975 List!22660)) )
))
(declare-datatypes ((ListLongMap!14053 0))(
  ( (ListLongMap!14054 (toList!7042 List!22660)) )
))
(declare-fun lt!468981 () ListLongMap!14053)

(declare-fun lt!468982 () ListLongMap!14053)

(assert (=> b!1063949 (= lt!468981 lt!468982)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11947 0))(
  ( (ValueCellFull!11947 (v!15313 V!38869)) (EmptyCell!11947) )
))
(declare-datatypes ((array!67601 0))(
  ( (array!67602 (arr!32505 (Array (_ BitVec 32) ValueCell!11947)) (size!33041 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67601)

(declare-fun minValue!907 () V!38869)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38869)

(declare-datatypes ((Unit!34884 0))(
  ( (Unit!34885) )
))
(declare-fun lt!468980 () Unit!34884)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38869)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67603 0))(
  ( (array!67604 (arr!32506 (Array (_ BitVec 32) (_ BitVec 64))) (size!33042 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67603)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!671 (array!67603 array!67601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38869 V!38869 V!38869 V!38869 (_ BitVec 32) Int) Unit!34884)

(assert (=> b!1063949 (= lt!468980 (lemmaNoChangeToArrayThenSameMapNoExtras!671 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3634 (array!67603 array!67601 (_ BitVec 32) (_ BitVec 32) V!38869 V!38869 (_ BitVec 32) Int) ListLongMap!14053)

(assert (=> b!1063949 (= lt!468982 (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063949 (= lt!468981 (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063950 () Bool)

(declare-fun e!606306 () Bool)

(declare-fun tp_is_empty!25301 () Bool)

(assert (=> b!1063950 (= e!606306 tp_is_empty!25301)))

(declare-fun b!1063951 () Bool)

(declare-fun e!606304 () Bool)

(assert (=> b!1063951 (= e!606304 tp_is_empty!25301)))

(declare-fun mapNonEmpty!39631 () Bool)

(declare-fun mapRes!39631 () Bool)

(declare-fun tp!75905 () Bool)

(assert (=> mapNonEmpty!39631 (= mapRes!39631 (and tp!75905 e!606304))))

(declare-fun mapValue!39631 () ValueCell!11947)

(declare-fun mapRest!39631 () (Array (_ BitVec 32) ValueCell!11947))

(declare-fun mapKey!39631 () (_ BitVec 32))

(assert (=> mapNonEmpty!39631 (= (arr!32505 _values!955) (store mapRest!39631 mapKey!39631 mapValue!39631))))

(declare-fun b!1063952 () Bool)

(declare-fun e!606305 () Bool)

(assert (=> b!1063952 (= e!606305 (and e!606306 mapRes!39631))))

(declare-fun condMapEmpty!39631 () Bool)

(declare-fun mapDefault!39631 () ValueCell!11947)

