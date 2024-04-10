; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94774 () Bool)

(assert start!94774)

(declare-fun b_free!22027 () Bool)

(declare-fun b_next!22027 () Bool)

(assert (=> start!94774 (= b_free!22027 (not b_next!22027))))

(declare-fun tp!77539 () Bool)

(declare-fun b_and!34857 () Bool)

(assert (=> start!94774 (= tp!77539 b_and!34857)))

(declare-fun b!1071671 () Bool)

(declare-fun e!611978 () Bool)

(declare-fun e!611976 () Bool)

(assert (=> b!1071671 (= e!611978 e!611976)))

(declare-fun res!714900 () Bool)

(assert (=> b!1071671 (=> res!714900 e!611976)))

(declare-datatypes ((V!39585 0))(
  ( (V!39586 (val!12969 Int)) )
))
(declare-datatypes ((tuple2!16512 0))(
  ( (tuple2!16513 (_1!8267 (_ BitVec 64)) (_2!8267 V!39585)) )
))
(declare-datatypes ((List!23049 0))(
  ( (Nil!23046) (Cons!23045 (h!24254 tuple2!16512) (t!32382 List!23049)) )
))
(declare-datatypes ((ListLongMap!14481 0))(
  ( (ListLongMap!14482 (toList!7256 List!23049)) )
))
(declare-fun lt!474411 () ListLongMap!14481)

(declare-fun lt!474412 () ListLongMap!14481)

(declare-fun -!687 (ListLongMap!14481 (_ BitVec 64)) ListLongMap!14481)

(assert (=> b!1071671 (= res!714900 (not (= (-!687 lt!474411 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474412)))))

(declare-fun lt!474416 () ListLongMap!14481)

(declare-fun lt!474418 () ListLongMap!14481)

(assert (=> b!1071671 (= lt!474416 lt!474418)))

(declare-fun zeroValueBefore!47 () V!39585)

(declare-datatypes ((Unit!35306 0))(
  ( (Unit!35307) )
))
(declare-fun lt!474409 () Unit!35306)

(declare-fun minValue!907 () V!39585)

(declare-fun lt!474414 () ListLongMap!14481)

(declare-fun addCommutativeForDiffKeys!732 (ListLongMap!14481 (_ BitVec 64) V!39585 (_ BitVec 64) V!39585) Unit!35306)

(assert (=> b!1071671 (= lt!474409 (addCommutativeForDiffKeys!732 lt!474414 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474419 () ListLongMap!14481)

(assert (=> b!1071671 (= (-!687 lt!474418 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474419)))

(declare-fun lt!474413 () tuple2!16512)

(declare-fun +!3191 (ListLongMap!14481 tuple2!16512) ListLongMap!14481)

(assert (=> b!1071671 (= lt!474418 (+!3191 lt!474419 lt!474413))))

(declare-fun lt!474417 () Unit!35306)

(declare-fun addThenRemoveForNewKeyIsSame!57 (ListLongMap!14481 (_ BitVec 64) V!39585) Unit!35306)

(assert (=> b!1071671 (= lt!474417 (addThenRemoveForNewKeyIsSame!57 lt!474419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474415 () tuple2!16512)

(assert (=> b!1071671 (= lt!474419 (+!3191 lt!474414 lt!474415))))

(declare-fun e!611979 () Bool)

(assert (=> b!1071671 e!611979))

(declare-fun res!714897 () Bool)

(assert (=> b!1071671 (=> (not res!714897) (not e!611979))))

(assert (=> b!1071671 (= res!714897 (= lt!474411 lt!474416))))

(assert (=> b!1071671 (= lt!474416 (+!3191 (+!3191 lt!474414 lt!474413) lt!474415))))

(assert (=> b!1071671 (= lt!474415 (tuple2!16513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071671 (= lt!474413 (tuple2!16513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12215 0))(
  ( (ValueCellFull!12215 (v!15585 V!39585)) (EmptyCell!12215) )
))
(declare-datatypes ((array!68645 0))(
  ( (array!68646 (arr!33018 (Array (_ BitVec 32) ValueCell!12215)) (size!33554 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68645)

(declare-datatypes ((array!68647 0))(
  ( (array!68648 (arr!33019 (Array (_ BitVec 32) (_ BitVec 64))) (size!33555 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68647)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39585)

(declare-fun getCurrentListMap!4153 (array!68647 array!68645 (_ BitVec 32) (_ BitVec 32) V!39585 V!39585 (_ BitVec 32) Int) ListLongMap!14481)

(assert (=> b!1071671 (= lt!474412 (getCurrentListMap!4153 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071671 (= lt!474411 (getCurrentListMap!4153 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071672 () Bool)

(declare-fun e!611980 () Bool)

(declare-fun tp_is_empty!25837 () Bool)

(assert (=> b!1071672 (= e!611980 tp_is_empty!25837)))

(declare-fun b!1071673 () Bool)

(assert (=> b!1071673 (= e!611976 (bvsle #b00000000000000000000000000000000 (size!33555 _keys!1163)))))

(declare-fun b!1071674 () Bool)

(declare-fun e!611977 () Bool)

(declare-fun e!611975 () Bool)

(declare-fun mapRes!40462 () Bool)

(assert (=> b!1071674 (= e!611977 (and e!611975 mapRes!40462))))

(declare-fun condMapEmpty!40462 () Bool)

(declare-fun mapDefault!40462 () ValueCell!12215)

