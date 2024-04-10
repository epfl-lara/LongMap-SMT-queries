; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94398 () Bool)

(assert start!94398)

(declare-fun b_free!21739 () Bool)

(declare-fun b_next!21739 () Bool)

(assert (=> start!94398 (= b_free!21739 (not b_next!21739))))

(declare-fun tp!76660 () Bool)

(declare-fun b_and!34523 () Bool)

(assert (=> start!94398 (= tp!76660 b_and!34523)))

(declare-fun b!1067415 () Bool)

(declare-fun res!712327 () Bool)

(declare-fun e!608810 () Bool)

(assert (=> b!1067415 (=> (not res!712327) (not e!608810))))

(declare-datatypes ((array!68079 0))(
  ( (array!68080 (arr!32740 (Array (_ BitVec 32) (_ BitVec 64))) (size!33276 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68079)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68079 (_ BitVec 32)) Bool)

(assert (=> b!1067415 (= res!712327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067416 () Bool)

(declare-fun e!608812 () Bool)

(declare-fun tp_is_empty!25549 () Bool)

(assert (=> b!1067416 (= e!608812 tp_is_empty!25549)))

(declare-fun b!1067417 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067417 (= e!608810 (not (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!33276 _keys!1163)))))))

(declare-datatypes ((V!39201 0))(
  ( (V!39202 (val!12825 Int)) )
))
(declare-datatypes ((tuple2!16272 0))(
  ( (tuple2!16273 (_1!8147 (_ BitVec 64)) (_2!8147 V!39201)) )
))
(declare-datatypes ((List!22832 0))(
  ( (Nil!22829) (Cons!22828 (h!24037 tuple2!16272) (t!32155 List!22832)) )
))
(declare-datatypes ((ListLongMap!14241 0))(
  ( (ListLongMap!14242 (toList!7136 List!22832)) )
))
(declare-fun lt!471438 () ListLongMap!14241)

(declare-fun lt!471437 () ListLongMap!14241)

(assert (=> b!1067417 (= lt!471438 lt!471437)))

(declare-datatypes ((Unit!35069 0))(
  ( (Unit!35070) )
))
(declare-fun lt!471436 () Unit!35069)

(declare-datatypes ((ValueCell!12071 0))(
  ( (ValueCellFull!12071 (v!15439 V!39201)) (EmptyCell!12071) )
))
(declare-datatypes ((array!68081 0))(
  ( (array!68082 (arr!32741 (Array (_ BitVec 32) ValueCell!12071)) (size!33277 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68081)

(declare-fun minValue!907 () V!39201)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39201)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39201)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!757 (array!68079 array!68081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39201 V!39201 V!39201 V!39201 (_ BitVec 32) Int) Unit!35069)

(assert (=> b!1067417 (= lt!471436 (lemmaNoChangeToArrayThenSameMapNoExtras!757 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3720 (array!68079 array!68081 (_ BitVec 32) (_ BitVec 32) V!39201 V!39201 (_ BitVec 32) Int) ListLongMap!14241)

(assert (=> b!1067417 (= lt!471437 (getCurrentListMapNoExtraKeys!3720 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067417 (= lt!471438 (getCurrentListMapNoExtraKeys!3720 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067418 () Bool)

(declare-fun e!608813 () Bool)

(declare-fun mapRes!40015 () Bool)

(assert (=> b!1067418 (= e!608813 (and e!608812 mapRes!40015))))

(declare-fun condMapEmpty!40015 () Bool)

(declare-fun mapDefault!40015 () ValueCell!12071)

