; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94534 () Bool)

(assert start!94534)

(declare-fun b_free!21839 () Bool)

(declare-fun b_next!21839 () Bool)

(assert (=> start!94534 (= b_free!21839 (not b_next!21839))))

(declare-fun tp!76966 () Bool)

(declare-fun b_and!34641 () Bool)

(assert (=> start!94534 (= tp!76966 b_and!34641)))

(declare-fun b!1068984 () Bool)

(declare-fun e!609998 () Bool)

(declare-fun tp_is_empty!25649 () Bool)

(assert (=> b!1068984 (= e!609998 tp_is_empty!25649)))

(declare-fun b!1068985 () Bool)

(declare-fun e!609997 () Bool)

(declare-fun e!609993 () Bool)

(assert (=> b!1068985 (= e!609997 (not e!609993))))

(declare-fun res!713297 () Bool)

(assert (=> b!1068985 (=> res!713297 e!609993)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068985 (= res!713297 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39333 0))(
  ( (V!39334 (val!12875 Int)) )
))
(declare-datatypes ((tuple2!16360 0))(
  ( (tuple2!16361 (_1!8191 (_ BitVec 64)) (_2!8191 V!39333)) )
))
(declare-datatypes ((List!22907 0))(
  ( (Nil!22904) (Cons!22903 (h!24112 tuple2!16360) (t!32234 List!22907)) )
))
(declare-datatypes ((ListLongMap!14329 0))(
  ( (ListLongMap!14330 (toList!7180 List!22907)) )
))
(declare-fun lt!472331 () ListLongMap!14329)

(declare-fun lt!472330 () ListLongMap!14329)

(assert (=> b!1068985 (= lt!472331 lt!472330)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39333)

(declare-datatypes ((Unit!35157 0))(
  ( (Unit!35158) )
))
(declare-fun lt!472327 () Unit!35157)

(declare-datatypes ((ValueCell!12121 0))(
  ( (ValueCellFull!12121 (v!15490 V!39333)) (EmptyCell!12121) )
))
(declare-datatypes ((array!68275 0))(
  ( (array!68276 (arr!32836 (Array (_ BitVec 32) ValueCell!12121)) (size!33372 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68275)

(declare-fun minValue!907 () V!39333)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39333)

(declare-datatypes ((array!68277 0))(
  ( (array!68278 (arr!32837 (Array (_ BitVec 32) (_ BitVec 64))) (size!33373 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68277)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!793 (array!68277 array!68275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39333 V!39333 V!39333 V!39333 (_ BitVec 32) Int) Unit!35157)

(assert (=> b!1068985 (= lt!472327 (lemmaNoChangeToArrayThenSameMapNoExtras!793 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3756 (array!68277 array!68275 (_ BitVec 32) (_ BitVec 32) V!39333 V!39333 (_ BitVec 32) Int) ListLongMap!14329)

(assert (=> b!1068985 (= lt!472330 (getCurrentListMapNoExtraKeys!3756 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068985 (= lt!472331 (getCurrentListMapNoExtraKeys!3756 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068986 () Bool)

(declare-fun res!713294 () Bool)

(assert (=> b!1068986 (=> (not res!713294) (not e!609997))))

(assert (=> b!1068986 (= res!713294 (and (= (size!33372 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33373 _keys!1163) (size!33372 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068987 () Bool)

(declare-fun e!609994 () Bool)

(assert (=> b!1068987 (= e!609993 e!609994)))

(declare-fun res!713299 () Bool)

(assert (=> b!1068987 (=> res!713299 e!609994)))

(declare-fun lt!472329 () ListLongMap!14329)

(declare-fun contains!6308 (ListLongMap!14329 (_ BitVec 64)) Bool)

(assert (=> b!1068987 (= res!713299 (contains!6308 lt!472329 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4104 (array!68277 array!68275 (_ BitVec 32) (_ BitVec 32) V!39333 V!39333 (_ BitVec 32) Int) ListLongMap!14329)

(assert (=> b!1068987 (= lt!472329 (getCurrentListMap!4104 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068988 () Bool)

(declare-fun e!609992 () Bool)

(declare-fun e!609995 () Bool)

(declare-fun mapRes!40171 () Bool)

(assert (=> b!1068988 (= e!609992 (and e!609995 mapRes!40171))))

(declare-fun condMapEmpty!40171 () Bool)

(declare-fun mapDefault!40171 () ValueCell!12121)

