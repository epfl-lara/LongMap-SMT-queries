; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94418 () Bool)

(assert start!94418)

(declare-fun b_free!21745 () Bool)

(declare-fun b_next!21745 () Bool)

(assert (=> start!94418 (= b_free!21745 (not b_next!21745))))

(declare-fun tp!76681 () Bool)

(declare-fun b_and!34537 () Bool)

(assert (=> start!94418 (= tp!76681 b_and!34537)))

(declare-fun b!1067565 () Bool)

(declare-fun res!712395 () Bool)

(declare-fun e!608916 () Bool)

(assert (=> b!1067565 (=> (not res!712395) (not e!608916))))

(declare-datatypes ((V!39209 0))(
  ( (V!39210 (val!12828 Int)) )
))
(declare-datatypes ((ValueCell!12074 0))(
  ( (ValueCellFull!12074 (v!15442 V!39209)) (EmptyCell!12074) )
))
(declare-datatypes ((array!68093 0))(
  ( (array!68094 (arr!32746 (Array (_ BitVec 32) ValueCell!12074)) (size!33282 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68093)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68095 0))(
  ( (array!68096 (arr!32747 (Array (_ BitVec 32) (_ BitVec 64))) (size!33283 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68095)

(assert (=> b!1067565 (= res!712395 (and (= (size!33282 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33283 _keys!1163) (size!33282 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067566 () Bool)

(declare-fun e!608913 () Bool)

(declare-fun tp_is_empty!25555 () Bool)

(assert (=> b!1067566 (= e!608913 tp_is_empty!25555)))

(declare-fun mapNonEmpty!40027 () Bool)

(declare-fun mapRes!40027 () Bool)

(declare-fun tp!76682 () Bool)

(declare-fun e!608917 () Bool)

(assert (=> mapNonEmpty!40027 (= mapRes!40027 (and tp!76682 e!608917))))

(declare-fun mapValue!40027 () ValueCell!12074)

(declare-fun mapRest!40027 () (Array (_ BitVec 32) ValueCell!12074))

(declare-fun mapKey!40027 () (_ BitVec 32))

(assert (=> mapNonEmpty!40027 (= (arr!32746 _values!955) (store mapRest!40027 mapKey!40027 mapValue!40027))))

(declare-fun b!1067567 () Bool)

(declare-fun res!712397 () Bool)

(assert (=> b!1067567 (=> (not res!712397) (not e!608916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68095 (_ BitVec 32)) Bool)

(assert (=> b!1067567 (= res!712397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067568 () Bool)

(declare-fun e!608914 () Bool)

(assert (=> b!1067568 (= e!608914 true)))

(declare-fun zeroValueBefore!47 () V!39209)

(declare-fun lt!471508 () Bool)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39209)

(declare-datatypes ((tuple2!16278 0))(
  ( (tuple2!16279 (_1!8150 (_ BitVec 64)) (_2!8150 V!39209)) )
))
(declare-datatypes ((List!22836 0))(
  ( (Nil!22833) (Cons!22832 (h!24041 tuple2!16278) (t!32161 List!22836)) )
))
(declare-datatypes ((ListLongMap!14247 0))(
  ( (ListLongMap!14248 (toList!7139 List!22836)) )
))
(declare-fun contains!6276 (ListLongMap!14247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4073 (array!68095 array!68093 (_ BitVec 32) (_ BitVec 32) V!39209 V!39209 (_ BitVec 32) Int) ListLongMap!14247)

(assert (=> b!1067568 (= lt!471508 (contains!6276 (getCurrentListMap!4073 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067569 () Bool)

(assert (=> b!1067569 (= e!608917 tp_is_empty!25555)))

(declare-fun b!1067570 () Bool)

(declare-fun res!712398 () Bool)

(assert (=> b!1067570 (=> (not res!712398) (not e!608916))))

(declare-datatypes ((List!22837 0))(
  ( (Nil!22834) (Cons!22833 (h!24042 (_ BitVec 64)) (t!32162 List!22837)) )
))
(declare-fun arrayNoDuplicates!0 (array!68095 (_ BitVec 32) List!22837) Bool)

(assert (=> b!1067570 (= res!712398 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22834))))

(declare-fun mapIsEmpty!40027 () Bool)

(assert (=> mapIsEmpty!40027 mapRes!40027))

(declare-fun b!1067571 () Bool)

(assert (=> b!1067571 (= e!608916 (not e!608914))))

(declare-fun res!712396 () Bool)

(assert (=> b!1067571 (=> res!712396 e!608914)))

(assert (=> b!1067571 (= res!712396 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471506 () ListLongMap!14247)

(declare-fun lt!471507 () ListLongMap!14247)

(assert (=> b!1067571 (= lt!471506 lt!471507)))

(declare-datatypes ((Unit!35075 0))(
  ( (Unit!35076) )
))
(declare-fun lt!471505 () Unit!35075)

(declare-fun zeroValueAfter!47 () V!39209)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!760 (array!68095 array!68093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39209 V!39209 V!39209 V!39209 (_ BitVec 32) Int) Unit!35075)

(assert (=> b!1067571 (= lt!471505 (lemmaNoChangeToArrayThenSameMapNoExtras!760 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3723 (array!68095 array!68093 (_ BitVec 32) (_ BitVec 32) V!39209 V!39209 (_ BitVec 32) Int) ListLongMap!14247)

(assert (=> b!1067571 (= lt!471507 (getCurrentListMapNoExtraKeys!3723 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067571 (= lt!471506 (getCurrentListMapNoExtraKeys!3723 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!712394 () Bool)

(assert (=> start!94418 (=> (not res!712394) (not e!608916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94418 (= res!712394 (validMask!0 mask!1515))))

(assert (=> start!94418 e!608916))

(assert (=> start!94418 true))

(assert (=> start!94418 tp_is_empty!25555))

(declare-fun e!608915 () Bool)

(declare-fun array_inv!25350 (array!68093) Bool)

(assert (=> start!94418 (and (array_inv!25350 _values!955) e!608915)))

(assert (=> start!94418 tp!76681))

(declare-fun array_inv!25351 (array!68095) Bool)

(assert (=> start!94418 (array_inv!25351 _keys!1163)))

(declare-fun b!1067572 () Bool)

(assert (=> b!1067572 (= e!608915 (and e!608913 mapRes!40027))))

(declare-fun condMapEmpty!40027 () Bool)

(declare-fun mapDefault!40027 () ValueCell!12074)

