; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94840 () Bool)

(assert start!94840)

(declare-fun b_free!22069 () Bool)

(declare-fun b_next!22069 () Bool)

(assert (=> start!94840 (= b_free!22069 (not b_next!22069))))

(declare-fun tp!77669 () Bool)

(declare-fun b_and!34911 () Bool)

(assert (=> start!94840 (= tp!77669 b_and!34911)))

(declare-fun b!1072428 () Bool)

(declare-fun e!612539 () Bool)

(declare-fun tp_is_empty!25879 () Bool)

(assert (=> b!1072428 (= e!612539 tp_is_empty!25879)))

(declare-fun b!1072429 () Bool)

(declare-fun res!715365 () Bool)

(declare-fun e!612536 () Bool)

(assert (=> b!1072429 (=> (not res!715365) (not e!612536))))

(declare-datatypes ((array!68727 0))(
  ( (array!68728 (arr!33058 (Array (_ BitVec 32) (_ BitVec 64))) (size!33594 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68727)

(declare-datatypes ((List!23078 0))(
  ( (Nil!23075) (Cons!23074 (h!24283 (_ BitVec 64)) (t!32413 List!23078)) )
))
(declare-fun arrayNoDuplicates!0 (array!68727 (_ BitVec 32) List!23078) Bool)

(assert (=> b!1072429 (= res!715365 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23075))))

(declare-fun mapIsEmpty!40528 () Bool)

(declare-fun mapRes!40528 () Bool)

(assert (=> mapIsEmpty!40528 mapRes!40528))

(declare-fun res!715366 () Bool)

(assert (=> start!94840 (=> (not res!715366) (not e!612536))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94840 (= res!715366 (validMask!0 mask!1515))))

(assert (=> start!94840 e!612536))

(assert (=> start!94840 true))

(assert (=> start!94840 tp_is_empty!25879))

(declare-datatypes ((V!39641 0))(
  ( (V!39642 (val!12990 Int)) )
))
(declare-datatypes ((ValueCell!12236 0))(
  ( (ValueCellFull!12236 (v!15607 V!39641)) (EmptyCell!12236) )
))
(declare-datatypes ((array!68729 0))(
  ( (array!68730 (arr!33059 (Array (_ BitVec 32) ValueCell!12236)) (size!33595 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68729)

(declare-fun e!612537 () Bool)

(declare-fun array_inv!25556 (array!68729) Bool)

(assert (=> start!94840 (and (array_inv!25556 _values!955) e!612537)))

(assert (=> start!94840 tp!77669))

(declare-fun array_inv!25557 (array!68727) Bool)

(assert (=> start!94840 (array_inv!25557 _keys!1163)))

(declare-fun b!1072430 () Bool)

(declare-fun res!715362 () Bool)

(assert (=> b!1072430 (=> (not res!715362) (not e!612536))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072430 (= res!715362 (and (= (size!33595 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33594 _keys!1163) (size!33595 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40528 () Bool)

(declare-fun tp!77668 () Bool)

(assert (=> mapNonEmpty!40528 (= mapRes!40528 (and tp!77668 e!612539))))

(declare-fun mapValue!40528 () ValueCell!12236)

(declare-fun mapKey!40528 () (_ BitVec 32))

(declare-fun mapRest!40528 () (Array (_ BitVec 32) ValueCell!12236))

(assert (=> mapNonEmpty!40528 (= (arr!33059 _values!955) (store mapRest!40528 mapKey!40528 mapValue!40528))))

(declare-fun b!1072431 () Bool)

(declare-fun e!612538 () Bool)

(assert (=> b!1072431 (= e!612538 true)))

(declare-datatypes ((tuple2!16544 0))(
  ( (tuple2!16545 (_1!8283 (_ BitVec 64)) (_2!8283 V!39641)) )
))
(declare-datatypes ((List!23079 0))(
  ( (Nil!23076) (Cons!23075 (h!24284 tuple2!16544) (t!32414 List!23079)) )
))
(declare-datatypes ((ListLongMap!14513 0))(
  ( (ListLongMap!14514 (toList!7272 List!23079)) )
))
(declare-fun lt!475397 () ListLongMap!14513)

(declare-fun lt!475387 () ListLongMap!14513)

(declare-fun -!700 (ListLongMap!14513 (_ BitVec 64)) ListLongMap!14513)

(assert (=> b!1072431 (= lt!475397 (-!700 lt!475387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475388 () ListLongMap!14513)

(declare-fun lt!475394 () ListLongMap!14513)

(assert (=> b!1072431 (= lt!475388 lt!475394)))

(declare-fun zeroValueBefore!47 () V!39641)

(declare-datatypes ((Unit!35338 0))(
  ( (Unit!35339) )
))
(declare-fun lt!475386 () Unit!35338)

(declare-fun lt!475398 () ListLongMap!14513)

(declare-fun minValue!907 () V!39641)

(declare-fun addCommutativeForDiffKeys!745 (ListLongMap!14513 (_ BitVec 64) V!39641 (_ BitVec 64) V!39641) Unit!35338)

(assert (=> b!1072431 (= lt!475386 (addCommutativeForDiffKeys!745 lt!475398 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475390 () ListLongMap!14513)

(assert (=> b!1072431 (= (-!700 lt!475394 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475390)))

(declare-fun lt!475396 () tuple2!16544)

(declare-fun +!3206 (ListLongMap!14513 tuple2!16544) ListLongMap!14513)

(assert (=> b!1072431 (= lt!475394 (+!3206 lt!475390 lt!475396))))

(declare-fun lt!475395 () Unit!35338)

(declare-fun addThenRemoveForNewKeyIsSame!70 (ListLongMap!14513 (_ BitVec 64) V!39641) Unit!35338)

(assert (=> b!1072431 (= lt!475395 (addThenRemoveForNewKeyIsSame!70 lt!475390 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475392 () tuple2!16544)

(assert (=> b!1072431 (= lt!475390 (+!3206 lt!475398 lt!475392))))

(declare-fun e!612540 () Bool)

(assert (=> b!1072431 e!612540))

(declare-fun res!715361 () Bool)

(assert (=> b!1072431 (=> (not res!715361) (not e!612540))))

(assert (=> b!1072431 (= res!715361 (= lt!475387 lt!475388))))

(assert (=> b!1072431 (= lt!475388 (+!3206 (+!3206 lt!475398 lt!475396) lt!475392))))

(assert (=> b!1072431 (= lt!475392 (tuple2!16545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072431 (= lt!475396 (tuple2!16545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475391 () ListLongMap!14513)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39641)

(declare-fun getCurrentListMap!4166 (array!68727 array!68729 (_ BitVec 32) (_ BitVec 32) V!39641 V!39641 (_ BitVec 32) Int) ListLongMap!14513)

(assert (=> b!1072431 (= lt!475391 (getCurrentListMap!4166 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072431 (= lt!475387 (getCurrentListMap!4166 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072432 () Bool)

(assert (=> b!1072432 (= e!612536 (not e!612538))))

(declare-fun res!715364 () Bool)

(assert (=> b!1072432 (=> res!715364 e!612538)))

(assert (=> b!1072432 (= res!715364 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!475393 () ListLongMap!14513)

(assert (=> b!1072432 (= lt!475398 lt!475393)))

(declare-fun lt!475389 () Unit!35338)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!873 (array!68727 array!68729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39641 V!39641 V!39641 V!39641 (_ BitVec 32) Int) Unit!35338)

(assert (=> b!1072432 (= lt!475389 (lemmaNoChangeToArrayThenSameMapNoExtras!873 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3836 (array!68727 array!68729 (_ BitVec 32) (_ BitVec 32) V!39641 V!39641 (_ BitVec 32) Int) ListLongMap!14513)

(assert (=> b!1072432 (= lt!475393 (getCurrentListMapNoExtraKeys!3836 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072432 (= lt!475398 (getCurrentListMapNoExtraKeys!3836 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072433 () Bool)

(assert (=> b!1072433 (= e!612540 (= lt!475391 (+!3206 lt!475393 lt!475392)))))

(declare-fun b!1072434 () Bool)

(declare-fun e!612541 () Bool)

(assert (=> b!1072434 (= e!612537 (and e!612541 mapRes!40528))))

(declare-fun condMapEmpty!40528 () Bool)

(declare-fun mapDefault!40528 () ValueCell!12236)

