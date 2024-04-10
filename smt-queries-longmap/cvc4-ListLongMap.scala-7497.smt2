; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94970 () Bool)

(assert start!94970)

(declare-fun b_free!22163 () Bool)

(declare-fun b_next!22163 () Bool)

(assert (=> start!94970 (= b_free!22163 (not b_next!22163))))

(declare-fun tp!77957 () Bool)

(declare-fun b_and!35025 () Bool)

(assert (=> start!94970 (= tp!77957 b_and!35025)))

(declare-fun b!1073750 () Bool)

(declare-fun res!716106 () Bool)

(declare-fun e!613479 () Bool)

(assert (=> b!1073750 (=> (not res!716106) (not e!613479))))

(declare-datatypes ((array!68907 0))(
  ( (array!68908 (arr!33146 (Array (_ BitVec 32) (_ BitVec 64))) (size!33682 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68907)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68907 (_ BitVec 32)) Bool)

(assert (=> b!1073750 (= res!716106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073751 () Bool)

(declare-fun e!613481 () Bool)

(assert (=> b!1073751 (= e!613479 (not e!613481))))

(declare-fun res!716107 () Bool)

(assert (=> b!1073751 (=> res!716107 e!613481)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073751 (= res!716107 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39765 0))(
  ( (V!39766 (val!13037 Int)) )
))
(declare-datatypes ((tuple2!16602 0))(
  ( (tuple2!16603 (_1!8312 (_ BitVec 64)) (_2!8312 V!39765)) )
))
(declare-datatypes ((List!23140 0))(
  ( (Nil!23137) (Cons!23136 (h!24345 tuple2!16602) (t!32479 List!23140)) )
))
(declare-datatypes ((ListLongMap!14571 0))(
  ( (ListLongMap!14572 (toList!7301 List!23140)) )
))
(declare-fun lt!476155 () ListLongMap!14571)

(declare-fun lt!476156 () ListLongMap!14571)

(assert (=> b!1073751 (= lt!476155 lt!476156)))

(declare-fun zeroValueBefore!47 () V!39765)

(declare-datatypes ((Unit!35358 0))(
  ( (Unit!35359) )
))
(declare-fun lt!476154 () Unit!35358)

(declare-datatypes ((ValueCell!12283 0))(
  ( (ValueCellFull!12283 (v!15655 V!39765)) (EmptyCell!12283) )
))
(declare-datatypes ((array!68909 0))(
  ( (array!68910 (arr!33147 (Array (_ BitVec 32) ValueCell!12283)) (size!33683 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68909)

(declare-fun minValue!907 () V!39765)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39765)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!881 (array!68907 array!68909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39765 V!39765 V!39765 V!39765 (_ BitVec 32) Int) Unit!35358)

(assert (=> b!1073751 (= lt!476154 (lemmaNoChangeToArrayThenSameMapNoExtras!881 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3865 (array!68907 array!68909 (_ BitVec 32) (_ BitVec 32) V!39765 V!39765 (_ BitVec 32) Int) ListLongMap!14571)

(assert (=> b!1073751 (= lt!476156 (getCurrentListMapNoExtraKeys!3865 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073751 (= lt!476155 (getCurrentListMapNoExtraKeys!3865 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073752 () Bool)

(declare-fun e!613477 () Bool)

(declare-fun tp_is_empty!25973 () Bool)

(assert (=> b!1073752 (= e!613477 tp_is_empty!25973)))

(declare-fun b!1073753 () Bool)

(declare-fun e!613480 () Bool)

(declare-fun mapRes!40675 () Bool)

(assert (=> b!1073753 (= e!613480 (and e!613477 mapRes!40675))))

(declare-fun condMapEmpty!40675 () Bool)

(declare-fun mapDefault!40675 () ValueCell!12283)

