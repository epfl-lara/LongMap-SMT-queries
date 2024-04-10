; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94422 () Bool)

(assert start!94422)

(declare-fun b_free!21749 () Bool)

(declare-fun b_next!21749 () Bool)

(assert (=> start!94422 (= b_free!21749 (not b_next!21749))))

(declare-fun tp!76693 () Bool)

(declare-fun b_and!34541 () Bool)

(assert (=> start!94422 (= tp!76693 b_and!34541)))

(declare-fun mapIsEmpty!40033 () Bool)

(declare-fun mapRes!40033 () Bool)

(assert (=> mapIsEmpty!40033 mapRes!40033))

(declare-fun b!1067613 () Bool)

(declare-fun e!608950 () Bool)

(declare-fun tp_is_empty!25559 () Bool)

(assert (=> b!1067613 (= e!608950 tp_is_empty!25559)))

(declare-fun b!1067614 () Bool)

(declare-fun e!608951 () Bool)

(assert (=> b!1067614 (= e!608951 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39213 0))(
  ( (V!39214 (val!12830 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39213)

(declare-datatypes ((ValueCell!12076 0))(
  ( (ValueCellFull!12076 (v!15444 V!39213)) (EmptyCell!12076) )
))
(declare-datatypes ((array!68101 0))(
  ( (array!68102 (arr!32750 (Array (_ BitVec 32) ValueCell!12076)) (size!33286 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68101)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39213)

(declare-fun lt!471530 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68103 0))(
  ( (array!68104 (arr!32751 (Array (_ BitVec 32) (_ BitVec 64))) (size!33287 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68103)

(declare-datatypes ((tuple2!16282 0))(
  ( (tuple2!16283 (_1!8152 (_ BitVec 64)) (_2!8152 V!39213)) )
))
(declare-datatypes ((List!22840 0))(
  ( (Nil!22837) (Cons!22836 (h!24045 tuple2!16282) (t!32165 List!22840)) )
))
(declare-datatypes ((ListLongMap!14251 0))(
  ( (ListLongMap!14252 (toList!7141 List!22840)) )
))
(declare-fun contains!6278 (ListLongMap!14251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4075 (array!68103 array!68101 (_ BitVec 32) (_ BitVec 32) V!39213 V!39213 (_ BitVec 32) Int) ListLongMap!14251)

(assert (=> b!1067614 (= lt!471530 (contains!6278 (getCurrentListMap!4075 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067615 () Bool)

(declare-fun e!608953 () Bool)

(assert (=> b!1067615 (= e!608953 tp_is_empty!25559)))

(declare-fun b!1067616 () Bool)

(declare-fun res!712427 () Bool)

(declare-fun e!608952 () Bool)

(assert (=> b!1067616 (=> (not res!712427) (not e!608952))))

(declare-datatypes ((List!22841 0))(
  ( (Nil!22838) (Cons!22837 (h!24046 (_ BitVec 64)) (t!32166 List!22841)) )
))
(declare-fun arrayNoDuplicates!0 (array!68103 (_ BitVec 32) List!22841) Bool)

(assert (=> b!1067616 (= res!712427 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22838))))

(declare-fun mapNonEmpty!40033 () Bool)

(declare-fun tp!76694 () Bool)

(assert (=> mapNonEmpty!40033 (= mapRes!40033 (and tp!76694 e!608953))))

(declare-fun mapKey!40033 () (_ BitVec 32))

(declare-fun mapValue!40033 () ValueCell!12076)

(declare-fun mapRest!40033 () (Array (_ BitVec 32) ValueCell!12076))

(assert (=> mapNonEmpty!40033 (= (arr!32750 _values!955) (store mapRest!40033 mapKey!40033 mapValue!40033))))

(declare-fun res!712424 () Bool)

(assert (=> start!94422 (=> (not res!712424) (not e!608952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94422 (= res!712424 (validMask!0 mask!1515))))

(assert (=> start!94422 e!608952))

(assert (=> start!94422 true))

(assert (=> start!94422 tp_is_empty!25559))

(declare-fun e!608948 () Bool)

(declare-fun array_inv!25354 (array!68101) Bool)

(assert (=> start!94422 (and (array_inv!25354 _values!955) e!608948)))

(assert (=> start!94422 tp!76693))

(declare-fun array_inv!25355 (array!68103) Bool)

(assert (=> start!94422 (array_inv!25355 _keys!1163)))

(declare-fun b!1067617 () Bool)

(assert (=> b!1067617 (= e!608952 (not e!608951))))

(declare-fun res!712426 () Bool)

(assert (=> b!1067617 (=> res!712426 e!608951)))

(assert (=> b!1067617 (= res!712426 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471531 () ListLongMap!14251)

(declare-fun lt!471532 () ListLongMap!14251)

(assert (=> b!1067617 (= lt!471531 lt!471532)))

(declare-datatypes ((Unit!35079 0))(
  ( (Unit!35080) )
))
(declare-fun lt!471529 () Unit!35079)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39213)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!762 (array!68103 array!68101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39213 V!39213 V!39213 V!39213 (_ BitVec 32) Int) Unit!35079)

(assert (=> b!1067617 (= lt!471529 (lemmaNoChangeToArrayThenSameMapNoExtras!762 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3725 (array!68103 array!68101 (_ BitVec 32) (_ BitVec 32) V!39213 V!39213 (_ BitVec 32) Int) ListLongMap!14251)

(assert (=> b!1067617 (= lt!471532 (getCurrentListMapNoExtraKeys!3725 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067617 (= lt!471531 (getCurrentListMapNoExtraKeys!3725 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067618 () Bool)

(declare-fun res!712425 () Bool)

(assert (=> b!1067618 (=> (not res!712425) (not e!608952))))

(assert (=> b!1067618 (= res!712425 (and (= (size!33286 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33287 _keys!1163) (size!33286 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067619 () Bool)

(declare-fun res!712428 () Bool)

(assert (=> b!1067619 (=> (not res!712428) (not e!608952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68103 (_ BitVec 32)) Bool)

(assert (=> b!1067619 (= res!712428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067620 () Bool)

(assert (=> b!1067620 (= e!608948 (and e!608950 mapRes!40033))))

(declare-fun condMapEmpty!40033 () Bool)

(declare-fun mapDefault!40033 () ValueCell!12076)

