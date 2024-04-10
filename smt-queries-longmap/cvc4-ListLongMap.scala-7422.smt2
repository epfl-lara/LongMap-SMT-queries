; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94372 () Bool)

(assert start!94372)

(declare-fun b_free!21713 () Bool)

(declare-fun b_next!21713 () Bool)

(assert (=> start!94372 (= b_free!21713 (not b_next!21713))))

(declare-fun tp!76582 () Bool)

(declare-fun b_and!34497 () Bool)

(assert (=> start!94372 (= tp!76582 b_and!34497)))

(declare-fun b!1067142 () Bool)

(declare-fun e!608619 () Bool)

(assert (=> b!1067142 (= e!608619 (not true))))

(declare-datatypes ((V!39165 0))(
  ( (V!39166 (val!12812 Int)) )
))
(declare-datatypes ((tuple2!16258 0))(
  ( (tuple2!16259 (_1!8140 (_ BitVec 64)) (_2!8140 V!39165)) )
))
(declare-datatypes ((List!22817 0))(
  ( (Nil!22814) (Cons!22813 (h!24022 tuple2!16258) (t!32140 List!22817)) )
))
(declare-datatypes ((ListLongMap!14227 0))(
  ( (ListLongMap!14228 (toList!7129 List!22817)) )
))
(declare-fun lt!471321 () ListLongMap!14227)

(declare-fun lt!471320 () ListLongMap!14227)

(assert (=> b!1067142 (= lt!471321 lt!471320)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39165)

(declare-datatypes ((Unit!35055 0))(
  ( (Unit!35056) )
))
(declare-fun lt!471319 () Unit!35055)

(declare-datatypes ((ValueCell!12058 0))(
  ( (ValueCellFull!12058 (v!15426 V!39165)) (EmptyCell!12058) )
))
(declare-datatypes ((array!68031 0))(
  ( (array!68032 (arr!32716 (Array (_ BitVec 32) ValueCell!12058)) (size!33252 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68031)

(declare-fun minValue!907 () V!39165)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39165)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68033 0))(
  ( (array!68034 (arr!32717 (Array (_ BitVec 32) (_ BitVec 64))) (size!33253 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68033)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!750 (array!68033 array!68031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39165 V!39165 V!39165 V!39165 (_ BitVec 32) Int) Unit!35055)

(assert (=> b!1067142 (= lt!471319 (lemmaNoChangeToArrayThenSameMapNoExtras!750 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3713 (array!68033 array!68031 (_ BitVec 32) (_ BitVec 32) V!39165 V!39165 (_ BitVec 32) Int) ListLongMap!14227)

(assert (=> b!1067142 (= lt!471320 (getCurrentListMapNoExtraKeys!3713 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067142 (= lt!471321 (getCurrentListMapNoExtraKeys!3713 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!712171 () Bool)

(assert (=> start!94372 (=> (not res!712171) (not e!608619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94372 (= res!712171 (validMask!0 mask!1515))))

(assert (=> start!94372 e!608619))

(assert (=> start!94372 true))

(declare-fun tp_is_empty!25523 () Bool)

(assert (=> start!94372 tp_is_empty!25523))

(declare-fun e!608617 () Bool)

(declare-fun array_inv!25330 (array!68031) Bool)

(assert (=> start!94372 (and (array_inv!25330 _values!955) e!608617)))

(assert (=> start!94372 tp!76582))

(declare-fun array_inv!25331 (array!68033) Bool)

(assert (=> start!94372 (array_inv!25331 _keys!1163)))

(declare-fun mapNonEmpty!39976 () Bool)

(declare-fun mapRes!39976 () Bool)

(declare-fun tp!76583 () Bool)

(declare-fun e!608618 () Bool)

(assert (=> mapNonEmpty!39976 (= mapRes!39976 (and tp!76583 e!608618))))

(declare-fun mapKey!39976 () (_ BitVec 32))

(declare-fun mapValue!39976 () ValueCell!12058)

(declare-fun mapRest!39976 () (Array (_ BitVec 32) ValueCell!12058))

(assert (=> mapNonEmpty!39976 (= (arr!32716 _values!955) (store mapRest!39976 mapKey!39976 mapValue!39976))))

(declare-fun b!1067143 () Bool)

(declare-fun e!608615 () Bool)

(assert (=> b!1067143 (= e!608615 tp_is_empty!25523)))

(declare-fun b!1067144 () Bool)

(assert (=> b!1067144 (= e!608618 tp_is_empty!25523)))

(declare-fun b!1067145 () Bool)

(declare-fun res!712172 () Bool)

(assert (=> b!1067145 (=> (not res!712172) (not e!608619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68033 (_ BitVec 32)) Bool)

(assert (=> b!1067145 (= res!712172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067146 () Bool)

(declare-fun res!712169 () Bool)

(assert (=> b!1067146 (=> (not res!712169) (not e!608619))))

(assert (=> b!1067146 (= res!712169 (and (= (size!33252 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33253 _keys!1163) (size!33252 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067147 () Bool)

(assert (=> b!1067147 (= e!608617 (and e!608615 mapRes!39976))))

(declare-fun condMapEmpty!39976 () Bool)

(declare-fun mapDefault!39976 () ValueCell!12058)

