; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94994 () Bool)

(assert start!94994)

(declare-fun b_free!22169 () Bool)

(declare-fun b_next!22169 () Bool)

(assert (=> start!94994 (= b_free!22169 (not b_next!22169))))

(declare-fun tp!77977 () Bool)

(declare-fun b_and!35041 () Bool)

(assert (=> start!94994 (= tp!77977 b_and!35041)))

(declare-fun b!1073987 () Bool)

(declare-fun e!613642 () Bool)

(declare-fun e!613641 () Bool)

(assert (=> b!1073987 (= e!613642 (not e!613641))))

(declare-fun res!716222 () Bool)

(assert (=> b!1073987 (=> res!716222 e!613641)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073987 (= res!716222 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39773 0))(
  ( (V!39774 (val!13040 Int)) )
))
(declare-datatypes ((tuple2!16608 0))(
  ( (tuple2!16609 (_1!8315 (_ BitVec 64)) (_2!8315 V!39773)) )
))
(declare-datatypes ((List!23145 0))(
  ( (Nil!23142) (Cons!23141 (h!24350 tuple2!16608) (t!32486 List!23145)) )
))
(declare-datatypes ((ListLongMap!14577 0))(
  ( (ListLongMap!14578 (toList!7304 List!23145)) )
))
(declare-fun lt!476327 () ListLongMap!14577)

(declare-fun lt!476325 () ListLongMap!14577)

(assert (=> b!1073987 (= lt!476327 lt!476325)))

(declare-fun zeroValueBefore!47 () V!39773)

(declare-datatypes ((ValueCell!12286 0))(
  ( (ValueCellFull!12286 (v!15659 V!39773)) (EmptyCell!12286) )
))
(declare-datatypes ((array!68921 0))(
  ( (array!68922 (arr!33152 (Array (_ BitVec 32) ValueCell!12286)) (size!33688 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68921)

(declare-fun minValue!907 () V!39773)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!35366 0))(
  ( (Unit!35367) )
))
(declare-fun lt!476324 () Unit!35366)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39773)

(declare-datatypes ((array!68923 0))(
  ( (array!68924 (arr!33153 (Array (_ BitVec 32) (_ BitVec 64))) (size!33689 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68923)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!883 (array!68923 array!68921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39773 V!39773 V!39773 V!39773 (_ BitVec 32) Int) Unit!35366)

(assert (=> b!1073987 (= lt!476324 (lemmaNoChangeToArrayThenSameMapNoExtras!883 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3867 (array!68923 array!68921 (_ BitVec 32) (_ BitVec 32) V!39773 V!39773 (_ BitVec 32) Int) ListLongMap!14577)

(assert (=> b!1073987 (= lt!476325 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073987 (= lt!476327 (getCurrentListMapNoExtraKeys!3867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073989 () Bool)

(declare-fun e!613645 () Bool)

(declare-fun lt!476326 () ListLongMap!14577)

(declare-fun getCurrentListMap!4175 (array!68923 array!68921 (_ BitVec 32) (_ BitVec 32) V!39773 V!39773 (_ BitVec 32) Int) ListLongMap!14577)

(assert (=> b!1073989 (= e!613645 (= lt!476326 (getCurrentListMap!4175 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)))))

(declare-fun lt!476323 () ListLongMap!14577)

(assert (=> b!1073989 (= lt!476326 lt!476323)))

(declare-fun -!708 (ListLongMap!14577 (_ BitVec 64)) ListLongMap!14577)

(assert (=> b!1073989 (= lt!476326 (-!708 lt!476323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!476328 () Unit!35366)

(declare-fun removeNotPresentStillSame!80 (ListLongMap!14577 (_ BitVec 64)) Unit!35366)

(assert (=> b!1073989 (= lt!476328 (removeNotPresentStillSame!80 lt!476323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073990 () Bool)

(declare-fun e!613644 () Bool)

(declare-fun tp_is_empty!25979 () Bool)

(assert (=> b!1073990 (= e!613644 tp_is_empty!25979)))

(declare-fun b!1073991 () Bool)

(declare-fun e!613640 () Bool)

(declare-fun e!613639 () Bool)

(declare-fun mapRes!40687 () Bool)

(assert (=> b!1073991 (= e!613640 (and e!613639 mapRes!40687))))

(declare-fun condMapEmpty!40687 () Bool)

(declare-fun mapDefault!40687 () ValueCell!12286)

