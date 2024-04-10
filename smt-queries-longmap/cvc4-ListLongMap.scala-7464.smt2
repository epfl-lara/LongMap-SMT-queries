; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94696 () Bool)

(assert start!94696)

(declare-fun b_free!21965 () Bool)

(declare-fun b_next!21965 () Bool)

(assert (=> start!94696 (= b_free!21965 (not b_next!21965))))

(declare-fun tp!77351 () Bool)

(declare-fun b_and!34785 () Bool)

(assert (=> start!94696 (= tp!77351 b_and!34785)))

(declare-fun mapIsEmpty!40366 () Bool)

(declare-fun mapRes!40366 () Bool)

(assert (=> mapIsEmpty!40366 mapRes!40366))

(declare-fun b!1070686 () Bool)

(declare-fun e!611229 () Bool)

(declare-fun tp_is_empty!25775 () Bool)

(assert (=> b!1070686 (= e!611229 tp_is_empty!25775)))

(declare-fun b!1070687 () Bool)

(declare-fun res!714280 () Bool)

(declare-fun e!611232 () Bool)

(assert (=> b!1070687 (=> (not res!714280) (not e!611232))))

(declare-datatypes ((array!68525 0))(
  ( (array!68526 (arr!32959 (Array (_ BitVec 32) (_ BitVec 64))) (size!33495 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68525)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68525 (_ BitVec 32)) Bool)

(assert (=> b!1070687 (= res!714280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070688 () Bool)

(declare-fun e!611228 () Bool)

(assert (=> b!1070688 (= e!611228 (bvsle #b00000000000000000000000000000000 (size!33495 _keys!1163)))))

(declare-datatypes ((V!39501 0))(
  ( (V!39502 (val!12938 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39501)

(declare-datatypes ((tuple2!16458 0))(
  ( (tuple2!16459 (_1!8240 (_ BitVec 64)) (_2!8240 V!39501)) )
))
(declare-datatypes ((List!23001 0))(
  ( (Nil!22998) (Cons!22997 (h!24206 tuple2!16458) (t!32332 List!23001)) )
))
(declare-datatypes ((ListLongMap!14427 0))(
  ( (ListLongMap!14428 (toList!7229 List!23001)) )
))
(declare-fun lt!473196 () ListLongMap!14427)

(declare-datatypes ((ValueCell!12184 0))(
  ( (ValueCellFull!12184 (v!15554 V!39501)) (EmptyCell!12184) )
))
(declare-datatypes ((array!68527 0))(
  ( (array!68528 (arr!32960 (Array (_ BitVec 32) ValueCell!12184)) (size!33496 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68527)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39501)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4132 (array!68525 array!68527 (_ BitVec 32) (_ BitVec 32) V!39501 V!39501 (_ BitVec 32) Int) ListLongMap!14427)

(assert (=> b!1070688 (= lt!473196 (getCurrentListMap!4132 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070689 () Bool)

(declare-fun e!611231 () Bool)

(assert (=> b!1070689 (= e!611231 tp_is_empty!25775)))

(declare-fun b!1070690 () Bool)

(declare-fun res!714282 () Bool)

(assert (=> b!1070690 (=> (not res!714282) (not e!611232))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1070690 (= res!714282 (and (= (size!33496 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33495 _keys!1163) (size!33496 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40366 () Bool)

(declare-fun tp!77350 () Bool)

(assert (=> mapNonEmpty!40366 (= mapRes!40366 (and tp!77350 e!611229))))

(declare-fun mapValue!40366 () ValueCell!12184)

(declare-fun mapRest!40366 () (Array (_ BitVec 32) ValueCell!12184))

(declare-fun mapKey!40366 () (_ BitVec 32))

(assert (=> mapNonEmpty!40366 (= (arr!32960 _values!955) (store mapRest!40366 mapKey!40366 mapValue!40366))))

(declare-fun res!714279 () Bool)

(assert (=> start!94696 (=> (not res!714279) (not e!611232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94696 (= res!714279 (validMask!0 mask!1515))))

(assert (=> start!94696 e!611232))

(assert (=> start!94696 true))

(assert (=> start!94696 tp_is_empty!25775))

(declare-fun e!611233 () Bool)

(declare-fun array_inv!25492 (array!68527) Bool)

(assert (=> start!94696 (and (array_inv!25492 _values!955) e!611233)))

(assert (=> start!94696 tp!77351))

(declare-fun array_inv!25493 (array!68525) Bool)

(assert (=> start!94696 (array_inv!25493 _keys!1163)))

(declare-fun b!1070685 () Bool)

(assert (=> b!1070685 (= e!611232 (not e!611228))))

(declare-fun res!714278 () Bool)

(assert (=> b!1070685 (=> res!714278 e!611228)))

(assert (=> b!1070685 (= res!714278 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473195 () ListLongMap!14427)

(declare-fun lt!473197 () ListLongMap!14427)

(assert (=> b!1070685 (= lt!473195 lt!473197)))

(declare-datatypes ((Unit!35253 0))(
  ( (Unit!35254) )
))
(declare-fun lt!473194 () Unit!35253)

(declare-fun zeroValueAfter!47 () V!39501)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!840 (array!68525 array!68527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39501 V!39501 V!39501 V!39501 (_ BitVec 32) Int) Unit!35253)

(assert (=> b!1070685 (= lt!473194 (lemmaNoChangeToArrayThenSameMapNoExtras!840 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3803 (array!68525 array!68527 (_ BitVec 32) (_ BitVec 32) V!39501 V!39501 (_ BitVec 32) Int) ListLongMap!14427)

(assert (=> b!1070685 (= lt!473197 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070685 (= lt!473195 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070691 () Bool)

(assert (=> b!1070691 (= e!611233 (and e!611231 mapRes!40366))))

(declare-fun condMapEmpty!40366 () Bool)

(declare-fun mapDefault!40366 () ValueCell!12184)

