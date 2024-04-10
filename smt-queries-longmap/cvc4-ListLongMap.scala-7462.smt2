; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94684 () Bool)

(assert start!94684)

(declare-fun b_free!21953 () Bool)

(declare-fun b_next!21953 () Bool)

(assert (=> start!94684 (= b_free!21953 (not b_next!21953))))

(declare-fun tp!77315 () Bool)

(declare-fun b_and!34773 () Bool)

(assert (=> start!94684 (= tp!77315 b_and!34773)))

(declare-fun b!1070542 () Bool)

(declare-fun res!714192 () Bool)

(declare-fun e!611123 () Bool)

(assert (=> b!1070542 (=> (not res!714192) (not e!611123))))

(declare-datatypes ((V!39485 0))(
  ( (V!39486 (val!12932 Int)) )
))
(declare-datatypes ((ValueCell!12178 0))(
  ( (ValueCellFull!12178 (v!15548 V!39485)) (EmptyCell!12178) )
))
(declare-datatypes ((array!68501 0))(
  ( (array!68502 (arr!32947 (Array (_ BitVec 32) ValueCell!12178)) (size!33483 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68501)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68503 0))(
  ( (array!68504 (arr!32948 (Array (_ BitVec 32) (_ BitVec 64))) (size!33484 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68503)

(assert (=> b!1070542 (= res!714192 (and (= (size!33483 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33484 _keys!1163) (size!33483 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40348 () Bool)

(declare-fun mapRes!40348 () Bool)

(assert (=> mapIsEmpty!40348 mapRes!40348))

(declare-fun b!1070543 () Bool)

(declare-fun e!611124 () Bool)

(declare-fun tp_is_empty!25763 () Bool)

(assert (=> b!1070543 (= e!611124 tp_is_empty!25763)))

(declare-fun b!1070544 () Bool)

(declare-fun res!714191 () Bool)

(assert (=> b!1070544 (=> (not res!714191) (not e!611123))))

(declare-datatypes ((List!22990 0))(
  ( (Nil!22987) (Cons!22986 (h!24195 (_ BitVec 64)) (t!32321 List!22990)) )
))
(declare-fun arrayNoDuplicates!0 (array!68503 (_ BitVec 32) List!22990) Bool)

(assert (=> b!1070544 (= res!714191 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22987))))

(declare-fun b!1070545 () Bool)

(declare-fun e!611121 () Bool)

(assert (=> b!1070545 (= e!611121 true)))

(declare-fun zeroValueBefore!47 () V!39485)

(declare-datatypes ((tuple2!16446 0))(
  ( (tuple2!16447 (_1!8234 (_ BitVec 64)) (_2!8234 V!39485)) )
))
(declare-datatypes ((List!22991 0))(
  ( (Nil!22988) (Cons!22987 (h!24196 tuple2!16446) (t!32322 List!22991)) )
))
(declare-datatypes ((ListLongMap!14415 0))(
  ( (ListLongMap!14416 (toList!7223 List!22991)) )
))
(declare-fun lt!473125 () ListLongMap!14415)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39485)

(declare-fun getCurrentListMap!4126 (array!68503 array!68501 (_ BitVec 32) (_ BitVec 32) V!39485 V!39485 (_ BitVec 32) Int) ListLongMap!14415)

(assert (=> b!1070545 (= lt!473125 (getCurrentListMap!4126 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40348 () Bool)

(declare-fun tp!77314 () Bool)

(declare-fun e!611120 () Bool)

(assert (=> mapNonEmpty!40348 (= mapRes!40348 (and tp!77314 e!611120))))

(declare-fun mapRest!40348 () (Array (_ BitVec 32) ValueCell!12178))

(declare-fun mapKey!40348 () (_ BitVec 32))

(declare-fun mapValue!40348 () ValueCell!12178)

(assert (=> mapNonEmpty!40348 (= (arr!32947 _values!955) (store mapRest!40348 mapKey!40348 mapValue!40348))))

(declare-fun b!1070546 () Bool)

(assert (=> b!1070546 (= e!611120 tp_is_empty!25763)))

(declare-fun b!1070547 () Bool)

(assert (=> b!1070547 (= e!611123 (not e!611121))))

(declare-fun res!714189 () Bool)

(assert (=> b!1070547 (=> res!714189 e!611121)))

(assert (=> b!1070547 (= res!714189 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473123 () ListLongMap!14415)

(declare-fun lt!473124 () ListLongMap!14415)

(assert (=> b!1070547 (= lt!473123 lt!473124)))

(declare-fun zeroValueAfter!47 () V!39485)

(declare-datatypes ((Unit!35245 0))(
  ( (Unit!35246) )
))
(declare-fun lt!473122 () Unit!35245)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!836 (array!68503 array!68501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39485 V!39485 V!39485 V!39485 (_ BitVec 32) Int) Unit!35245)

(assert (=> b!1070547 (= lt!473122 (lemmaNoChangeToArrayThenSameMapNoExtras!836 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3799 (array!68503 array!68501 (_ BitVec 32) (_ BitVec 32) V!39485 V!39485 (_ BitVec 32) Int) ListLongMap!14415)

(assert (=> b!1070547 (= lt!473124 (getCurrentListMapNoExtraKeys!3799 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070547 (= lt!473123 (getCurrentListMapNoExtraKeys!3799 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070548 () Bool)

(declare-fun e!611125 () Bool)

(assert (=> b!1070548 (= e!611125 (and e!611124 mapRes!40348))))

(declare-fun condMapEmpty!40348 () Bool)

(declare-fun mapDefault!40348 () ValueCell!12178)

