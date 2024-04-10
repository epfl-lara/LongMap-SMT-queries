; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94624 () Bool)

(assert start!94624)

(declare-fun b_free!21907 () Bool)

(declare-fun b_next!21907 () Bool)

(assert (=> start!94624 (= b_free!21907 (not b_next!21907))))

(declare-fun tp!77174 () Bool)

(declare-fun b_and!34719 () Bool)

(assert (=> start!94624 (= tp!77174 b_and!34719)))

(declare-fun mapNonEmpty!40276 () Bool)

(declare-fun mapRes!40276 () Bool)

(declare-fun tp!77173 () Bool)

(declare-fun e!610662 () Bool)

(assert (=> mapNonEmpty!40276 (= mapRes!40276 (and tp!77173 e!610662))))

(declare-datatypes ((V!39425 0))(
  ( (V!39426 (val!12909 Int)) )
))
(declare-datatypes ((ValueCell!12155 0))(
  ( (ValueCellFull!12155 (v!15525 V!39425)) (EmptyCell!12155) )
))
(declare-fun mapValue!40276 () ValueCell!12155)

(declare-fun mapRest!40276 () (Array (_ BitVec 32) ValueCell!12155))

(declare-datatypes ((array!68411 0))(
  ( (array!68412 (arr!32903 (Array (_ BitVec 32) ValueCell!12155)) (size!33439 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68411)

(declare-fun mapKey!40276 () (_ BitVec 32))

(assert (=> mapNonEmpty!40276 (= (arr!32903 _values!955) (store mapRest!40276 mapKey!40276 mapValue!40276))))

(declare-fun b!1069911 () Bool)

(declare-fun e!610660 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68413 0))(
  ( (array!68414 (arr!32904 (Array (_ BitVec 32) (_ BitVec 64))) (size!33440 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68413)

(assert (=> b!1069911 (= e!610660 (not (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!33440 _keys!1163)))))))

(declare-datatypes ((tuple2!16410 0))(
  ( (tuple2!16411 (_1!8216 (_ BitVec 64)) (_2!8216 V!39425)) )
))
(declare-datatypes ((List!22954 0))(
  ( (Nil!22951) (Cons!22950 (h!24159 tuple2!16410) (t!32283 List!22954)) )
))
(declare-datatypes ((ListLongMap!14379 0))(
  ( (ListLongMap!14380 (toList!7205 List!22954)) )
))
(declare-fun lt!472813 () ListLongMap!14379)

(declare-fun lt!472814 () ListLongMap!14379)

(assert (=> b!1069911 (= lt!472813 lt!472814)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39425)

(declare-fun minValue!907 () V!39425)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39425)

(declare-datatypes ((Unit!35209 0))(
  ( (Unit!35210) )
))
(declare-fun lt!472815 () Unit!35209)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!818 (array!68413 array!68411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39425 V!39425 V!39425 V!39425 (_ BitVec 32) Int) Unit!35209)

(assert (=> b!1069911 (= lt!472815 (lemmaNoChangeToArrayThenSameMapNoExtras!818 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3781 (array!68413 array!68411 (_ BitVec 32) (_ BitVec 32) V!39425 V!39425 (_ BitVec 32) Int) ListLongMap!14379)

(assert (=> b!1069911 (= lt!472814 (getCurrentListMapNoExtraKeys!3781 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069911 (= lt!472813 (getCurrentListMapNoExtraKeys!3781 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069912 () Bool)

(declare-fun e!610661 () Bool)

(declare-fun e!610659 () Bool)

(assert (=> b!1069912 (= e!610661 (and e!610659 mapRes!40276))))

(declare-fun condMapEmpty!40276 () Bool)

(declare-fun mapDefault!40276 () ValueCell!12155)

