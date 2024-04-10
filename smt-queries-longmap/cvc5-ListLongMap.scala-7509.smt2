; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95230 () Bool)

(assert start!95230)

(declare-fun b_free!22231 () Bool)

(declare-fun b_next!22231 () Bool)

(assert (=> start!95230 (= b_free!22231 (not b_next!22231))))

(declare-fun tp!78191 () Bool)

(declare-fun b_and!35209 () Bool)

(assert (=> start!95230 (= tp!78191 b_and!35209)))

(declare-fun mapNonEmpty!40807 () Bool)

(declare-fun mapRes!40807 () Bool)

(declare-fun tp!78190 () Bool)

(declare-fun e!615269 () Bool)

(assert (=> mapNonEmpty!40807 (= mapRes!40807 (and tp!78190 e!615269))))

(declare-fun mapKey!40807 () (_ BitVec 32))

(declare-datatypes ((V!39857 0))(
  ( (V!39858 (val!13071 Int)) )
))
(declare-datatypes ((ValueCell!12317 0))(
  ( (ValueCellFull!12317 (v!15699 V!39857)) (EmptyCell!12317) )
))
(declare-fun mapValue!40807 () ValueCell!12317)

(declare-fun mapRest!40807 () (Array (_ BitVec 32) ValueCell!12317))

(declare-datatypes ((array!69053 0))(
  ( (array!69054 (arr!33209 (Array (_ BitVec 32) ValueCell!12317)) (size!33745 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69053)

(assert (=> mapNonEmpty!40807 (= (arr!33209 _values!955) (store mapRest!40807 mapKey!40807 mapValue!40807))))

(declare-fun b!1076390 () Bool)

(declare-fun e!615270 () Bool)

(declare-fun e!615271 () Bool)

(assert (=> b!1076390 (= e!615270 (not e!615271))))

(declare-fun res!717408 () Bool)

(assert (=> b!1076390 (=> res!717408 e!615271)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076390 (= res!717408 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16652 0))(
  ( (tuple2!16653 (_1!8337 (_ BitVec 64)) (_2!8337 V!39857)) )
))
(declare-datatypes ((List!23187 0))(
  ( (Nil!23184) (Cons!23183 (h!24392 tuple2!16652) (t!32546 List!23187)) )
))
(declare-datatypes ((ListLongMap!14621 0))(
  ( (ListLongMap!14622 (toList!7326 List!23187)) )
))
(declare-fun lt!478088 () ListLongMap!14621)

(declare-fun lt!478092 () ListLongMap!14621)

(assert (=> b!1076390 (= lt!478088 lt!478092)))

(declare-fun zeroValueBefore!47 () V!39857)

(declare-datatypes ((Unit!35430 0))(
  ( (Unit!35431) )
))
(declare-fun lt!478094 () Unit!35430)

(declare-fun minValue!907 () V!39857)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39857)

(declare-datatypes ((array!69055 0))(
  ( (array!69056 (arr!33210 (Array (_ BitVec 32) (_ BitVec 64))) (size!33746 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69055)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!904 (array!69055 array!69053 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39857 V!39857 V!39857 V!39857 (_ BitVec 32) Int) Unit!35430)

(assert (=> b!1076390 (= lt!478094 (lemmaNoChangeToArrayThenSameMapNoExtras!904 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3888 (array!69055 array!69053 (_ BitVec 32) (_ BitVec 32) V!39857 V!39857 (_ BitVec 32) Int) ListLongMap!14621)

(assert (=> b!1076390 (= lt!478092 (getCurrentListMapNoExtraKeys!3888 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076390 (= lt!478088 (getCurrentListMapNoExtraKeys!3888 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076391 () Bool)

(declare-fun e!615267 () Bool)

(declare-fun tp_is_empty!26041 () Bool)

(assert (=> b!1076391 (= e!615267 tp_is_empty!26041)))

(declare-fun b!1076392 () Bool)

(declare-fun e!615272 () Bool)

(assert (=> b!1076392 (= e!615272 (and e!615267 mapRes!40807))))

(declare-fun condMapEmpty!40807 () Bool)

(declare-fun mapDefault!40807 () ValueCell!12317)

