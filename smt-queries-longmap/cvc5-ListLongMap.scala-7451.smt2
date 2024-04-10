; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94600 () Bool)

(assert start!94600)

(declare-fun b_free!21883 () Bool)

(declare-fun b_next!21883 () Bool)

(assert (=> start!94600 (= b_free!21883 (not b_next!21883))))

(declare-fun tp!77101 () Bool)

(declare-fun b_and!34695 () Bool)

(assert (=> start!94600 (= tp!77101 b_and!34695)))

(declare-fun b!1069659 () Bool)

(declare-fun e!610479 () Bool)

(assert (=> b!1069659 (= e!610479 (not true))))

(declare-datatypes ((V!39393 0))(
  ( (V!39394 (val!12897 Int)) )
))
(declare-datatypes ((tuple2!16392 0))(
  ( (tuple2!16393 (_1!8207 (_ BitVec 64)) (_2!8207 V!39393)) )
))
(declare-datatypes ((List!22936 0))(
  ( (Nil!22933) (Cons!22932 (h!24141 tuple2!16392) (t!32265 List!22936)) )
))
(declare-datatypes ((ListLongMap!14361 0))(
  ( (ListLongMap!14362 (toList!7196 List!22936)) )
))
(declare-fun lt!472705 () ListLongMap!14361)

(declare-fun lt!472706 () ListLongMap!14361)

(assert (=> b!1069659 (= lt!472705 lt!472706)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39393)

(declare-datatypes ((Unit!35191 0))(
  ( (Unit!35192) )
))
(declare-fun lt!472707 () Unit!35191)

(declare-datatypes ((ValueCell!12143 0))(
  ( (ValueCellFull!12143 (v!15513 V!39393)) (EmptyCell!12143) )
))
(declare-datatypes ((array!68363 0))(
  ( (array!68364 (arr!32879 (Array (_ BitVec 32) ValueCell!12143)) (size!33415 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68363)

(declare-fun minValue!907 () V!39393)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39393)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68365 0))(
  ( (array!68366 (arr!32880 (Array (_ BitVec 32) (_ BitVec 64))) (size!33416 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68365)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!809 (array!68365 array!68363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39393 V!39393 V!39393 V!39393 (_ BitVec 32) Int) Unit!35191)

(assert (=> b!1069659 (= lt!472707 (lemmaNoChangeToArrayThenSameMapNoExtras!809 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3772 (array!68365 array!68363 (_ BitVec 32) (_ BitVec 32) V!39393 V!39393 (_ BitVec 32) Int) ListLongMap!14361)

(assert (=> b!1069659 (= lt!472706 (getCurrentListMapNoExtraKeys!3772 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069659 (= lt!472705 (getCurrentListMapNoExtraKeys!3772 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069660 () Bool)

(declare-fun e!610478 () Bool)

(declare-fun tp_is_empty!25693 () Bool)

(assert (=> b!1069660 (= e!610478 tp_is_empty!25693)))

(declare-fun b!1069661 () Bool)

(declare-fun res!713676 () Bool)

(assert (=> b!1069661 (=> (not res!713676) (not e!610479))))

(assert (=> b!1069661 (= res!713676 (and (= (size!33415 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33416 _keys!1163) (size!33415 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069662 () Bool)

(declare-fun e!610482 () Bool)

(declare-fun e!610481 () Bool)

(declare-fun mapRes!40240 () Bool)

(assert (=> b!1069662 (= e!610482 (and e!610481 mapRes!40240))))

(declare-fun condMapEmpty!40240 () Bool)

(declare-fun mapDefault!40240 () ValueCell!12143)

