; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94680 () Bool)

(assert start!94680)

(declare-fun b_free!21949 () Bool)

(declare-fun b_next!21949 () Bool)

(assert (=> start!94680 (= b_free!21949 (not b_next!21949))))

(declare-fun tp!77302 () Bool)

(declare-fun b_and!34769 () Bool)

(assert (=> start!94680 (= tp!77302 b_and!34769)))

(declare-fun b!1070493 () Bool)

(declare-fun e!611089 () Bool)

(declare-fun e!611084 () Bool)

(assert (=> b!1070493 (= e!611089 (not e!611084))))

(declare-fun res!714158 () Bool)

(assert (=> b!1070493 (=> res!714158 e!611084)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070493 (= res!714158 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39481 0))(
  ( (V!39482 (val!12930 Int)) )
))
(declare-datatypes ((tuple2!16442 0))(
  ( (tuple2!16443 (_1!8232 (_ BitVec 64)) (_2!8232 V!39481)) )
))
(declare-datatypes ((List!22986 0))(
  ( (Nil!22983) (Cons!22982 (h!24191 tuple2!16442) (t!32317 List!22986)) )
))
(declare-datatypes ((ListLongMap!14411 0))(
  ( (ListLongMap!14412 (toList!7221 List!22986)) )
))
(declare-fun lt!473099 () ListLongMap!14411)

(declare-fun lt!473098 () ListLongMap!14411)

(assert (=> b!1070493 (= lt!473099 lt!473098)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39481)

(declare-datatypes ((ValueCell!12176 0))(
  ( (ValueCellFull!12176 (v!15546 V!39481)) (EmptyCell!12176) )
))
(declare-datatypes ((array!68493 0))(
  ( (array!68494 (arr!32943 (Array (_ BitVec 32) ValueCell!12176)) (size!33479 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68493)

(declare-fun minValue!907 () V!39481)

(declare-datatypes ((Unit!35241 0))(
  ( (Unit!35242) )
))
(declare-fun lt!473100 () Unit!35241)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39481)

(declare-datatypes ((array!68495 0))(
  ( (array!68496 (arr!32944 (Array (_ BitVec 32) (_ BitVec 64))) (size!33480 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68495)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!834 (array!68495 array!68493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39481 V!39481 V!39481 V!39481 (_ BitVec 32) Int) Unit!35241)

(assert (=> b!1070493 (= lt!473100 (lemmaNoChangeToArrayThenSameMapNoExtras!834 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3797 (array!68495 array!68493 (_ BitVec 32) (_ BitVec 32) V!39481 V!39481 (_ BitVec 32) Int) ListLongMap!14411)

(assert (=> b!1070493 (= lt!473098 (getCurrentListMapNoExtraKeys!3797 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070493 (= lt!473099 (getCurrentListMapNoExtraKeys!3797 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070494 () Bool)

(declare-fun res!714160 () Bool)

(assert (=> b!1070494 (=> (not res!714160) (not e!611089))))

(declare-datatypes ((List!22987 0))(
  ( (Nil!22984) (Cons!22983 (h!24192 (_ BitVec 64)) (t!32318 List!22987)) )
))
(declare-fun arrayNoDuplicates!0 (array!68495 (_ BitVec 32) List!22987) Bool)

(assert (=> b!1070494 (= res!714160 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22984))))

(declare-fun mapIsEmpty!40342 () Bool)

(declare-fun mapRes!40342 () Bool)

(assert (=> mapIsEmpty!40342 mapRes!40342))

(declare-fun b!1070495 () Bool)

(assert (=> b!1070495 (= e!611084 true)))

(declare-fun lt!473101 () ListLongMap!14411)

(declare-fun getCurrentListMap!4124 (array!68495 array!68493 (_ BitVec 32) (_ BitVec 32) V!39481 V!39481 (_ BitVec 32) Int) ListLongMap!14411)

(assert (=> b!1070495 (= lt!473101 (getCurrentListMap!4124 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070497 () Bool)

(declare-fun e!611087 () Bool)

(declare-fun e!611086 () Bool)

(assert (=> b!1070497 (= e!611087 (and e!611086 mapRes!40342))))

(declare-fun condMapEmpty!40342 () Bool)

(declare-fun mapDefault!40342 () ValueCell!12176)

