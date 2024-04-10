; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94500 () Bool)

(assert start!94500)

(declare-fun b_free!21805 () Bool)

(declare-fun b_next!21805 () Bool)

(assert (=> start!94500 (= b_free!21805 (not b_next!21805))))

(declare-fun tp!76864 () Bool)

(declare-fun b_and!34607 () Bool)

(assert (=> start!94500 (= tp!76864 b_and!34607)))

(declare-fun b!1068525 () Bool)

(declare-fun e!609638 () Bool)

(assert (=> b!1068525 (= e!609638 true)))

(declare-datatypes ((V!39289 0))(
  ( (V!39290 (val!12858 Int)) )
))
(declare-datatypes ((tuple2!16332 0))(
  ( (tuple2!16333 (_1!8177 (_ BitVec 64)) (_2!8177 V!39289)) )
))
(declare-datatypes ((List!22882 0))(
  ( (Nil!22879) (Cons!22878 (h!24087 tuple2!16332) (t!32209 List!22882)) )
))
(declare-datatypes ((ListLongMap!14301 0))(
  ( (ListLongMap!14302 (toList!7166 List!22882)) )
))
(declare-fun lt!472074 () ListLongMap!14301)

(declare-fun -!649 (ListLongMap!14301 (_ BitVec 64)) ListLongMap!14301)

(assert (=> b!1068525 (= (-!649 lt!472074 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472074)))

(declare-datatypes ((Unit!35131 0))(
  ( (Unit!35132) )
))
(declare-fun lt!472073 () Unit!35131)

(declare-fun removeNotPresentStillSame!59 (ListLongMap!14301 (_ BitVec 64)) Unit!35131)

(assert (=> b!1068525 (= lt!472073 (removeNotPresentStillSame!59 lt!472074 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068526 () Bool)

(declare-fun e!609639 () Bool)

(declare-fun e!609635 () Bool)

(assert (=> b!1068526 (= e!609639 (not e!609635))))

(declare-fun res!712990 () Bool)

(assert (=> b!1068526 (=> res!712990 e!609635)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068526 (= res!712990 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472075 () ListLongMap!14301)

(declare-fun lt!472072 () ListLongMap!14301)

(assert (=> b!1068526 (= lt!472075 lt!472072)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39289)

(declare-datatypes ((ValueCell!12104 0))(
  ( (ValueCellFull!12104 (v!15473 V!39289)) (EmptyCell!12104) )
))
(declare-datatypes ((array!68211 0))(
  ( (array!68212 (arr!32804 (Array (_ BitVec 32) ValueCell!12104)) (size!33340 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68211)

(declare-fun minValue!907 () V!39289)

(declare-fun lt!472076 () Unit!35131)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39289)

(declare-datatypes ((array!68213 0))(
  ( (array!68214 (arr!32805 (Array (_ BitVec 32) (_ BitVec 64))) (size!33341 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68213)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!783 (array!68213 array!68211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39289 V!39289 V!39289 V!39289 (_ BitVec 32) Int) Unit!35131)

(assert (=> b!1068526 (= lt!472076 (lemmaNoChangeToArrayThenSameMapNoExtras!783 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3746 (array!68213 array!68211 (_ BitVec 32) (_ BitVec 32) V!39289 V!39289 (_ BitVec 32) Int) ListLongMap!14301)

(assert (=> b!1068526 (= lt!472072 (getCurrentListMapNoExtraKeys!3746 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068526 (= lt!472075 (getCurrentListMapNoExtraKeys!3746 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068527 () Bool)

(declare-fun e!609636 () Bool)

(declare-fun tp_is_empty!25615 () Bool)

(assert (=> b!1068527 (= e!609636 tp_is_empty!25615)))

(declare-fun b!1068528 () Bool)

(declare-fun res!712993 () Bool)

(assert (=> b!1068528 (=> (not res!712993) (not e!609639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68213 (_ BitVec 32)) Bool)

(assert (=> b!1068528 (= res!712993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068529 () Bool)

(declare-fun res!712991 () Bool)

(assert (=> b!1068529 (=> (not res!712991) (not e!609639))))

(declare-datatypes ((List!22883 0))(
  ( (Nil!22880) (Cons!22879 (h!24088 (_ BitVec 64)) (t!32210 List!22883)) )
))
(declare-fun arrayNoDuplicates!0 (array!68213 (_ BitVec 32) List!22883) Bool)

(assert (=> b!1068529 (= res!712991 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22880))))

(declare-fun b!1068530 () Bool)

(declare-fun res!712988 () Bool)

(assert (=> b!1068530 (=> (not res!712988) (not e!609639))))

(assert (=> b!1068530 (= res!712988 (and (= (size!33340 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33341 _keys!1163) (size!33340 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068531 () Bool)

(declare-fun e!609637 () Bool)

(assert (=> b!1068531 (= e!609637 tp_is_empty!25615)))

(declare-fun mapNonEmpty!40120 () Bool)

(declare-fun mapRes!40120 () Bool)

(declare-fun tp!76865 () Bool)

(assert (=> mapNonEmpty!40120 (= mapRes!40120 (and tp!76865 e!609637))))

(declare-fun mapValue!40120 () ValueCell!12104)

(declare-fun mapKey!40120 () (_ BitVec 32))

(declare-fun mapRest!40120 () (Array (_ BitVec 32) ValueCell!12104))

(assert (=> mapNonEmpty!40120 (= (arr!32804 _values!955) (store mapRest!40120 mapKey!40120 mapValue!40120))))

(declare-fun res!712989 () Bool)

(assert (=> start!94500 (=> (not res!712989) (not e!609639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94500 (= res!712989 (validMask!0 mask!1515))))

(assert (=> start!94500 e!609639))

(assert (=> start!94500 true))

(assert (=> start!94500 tp_is_empty!25615))

(declare-fun e!609640 () Bool)

(declare-fun array_inv!25394 (array!68211) Bool)

(assert (=> start!94500 (and (array_inv!25394 _values!955) e!609640)))

(assert (=> start!94500 tp!76864))

(declare-fun array_inv!25395 (array!68213) Bool)

(assert (=> start!94500 (array_inv!25395 _keys!1163)))

(declare-fun b!1068532 () Bool)

(assert (=> b!1068532 (= e!609640 (and e!609636 mapRes!40120))))

(declare-fun condMapEmpty!40120 () Bool)

(declare-fun mapDefault!40120 () ValueCell!12104)

