; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94288 () Bool)

(assert start!94288)

(declare-fun b_free!21651 () Bool)

(declare-fun b_next!21651 () Bool)

(assert (=> start!94288 (= b_free!21651 (not b_next!21651))))

(declare-fun tp!76394 () Bool)

(declare-fun b_and!34423 () Bool)

(assert (=> start!94288 (= tp!76394 b_and!34423)))

(declare-fun mapNonEmpty!39880 () Bool)

(declare-fun mapRes!39880 () Bool)

(declare-fun tp!76393 () Bool)

(declare-fun e!607976 () Bool)

(assert (=> mapNonEmpty!39880 (= mapRes!39880 (and tp!76393 e!607976))))

(declare-datatypes ((V!39083 0))(
  ( (V!39084 (val!12781 Int)) )
))
(declare-datatypes ((ValueCell!12027 0))(
  ( (ValueCellFull!12027 (v!15394 V!39083)) (EmptyCell!12027) )
))
(declare-fun mapRest!39880 () (Array (_ BitVec 32) ValueCell!12027))

(declare-fun mapValue!39880 () ValueCell!12027)

(declare-datatypes ((array!67907 0))(
  ( (array!67908 (arr!32655 (Array (_ BitVec 32) ValueCell!12027)) (size!33191 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67907)

(declare-fun mapKey!39880 () (_ BitVec 32))

(assert (=> mapNonEmpty!39880 (= (arr!32655 _values!955) (store mapRest!39880 mapKey!39880 mapValue!39880))))

(declare-fun b!1066249 () Bool)

(declare-fun res!711661 () Bool)

(declare-fun e!607973 () Bool)

(assert (=> b!1066249 (=> (not res!711661) (not e!607973))))

(declare-datatypes ((array!67909 0))(
  ( (array!67910 (arr!32656 (Array (_ BitVec 32) (_ BitVec 64))) (size!33192 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67909)

(declare-datatypes ((List!22770 0))(
  ( (Nil!22767) (Cons!22766 (h!23975 (_ BitVec 64)) (t!32091 List!22770)) )
))
(declare-fun arrayNoDuplicates!0 (array!67909 (_ BitVec 32) List!22770) Bool)

(assert (=> b!1066249 (= res!711661 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22767))))

(declare-fun b!1066250 () Bool)

(declare-fun e!607974 () Bool)

(declare-fun e!607977 () Bool)

(assert (=> b!1066250 (= e!607974 (and e!607977 mapRes!39880))))

(declare-fun condMapEmpty!39880 () Bool)

(declare-fun mapDefault!39880 () ValueCell!12027)

(assert (=> b!1066250 (= condMapEmpty!39880 (= (arr!32655 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12027)) mapDefault!39880)))))

(declare-fun res!711657 () Bool)

(assert (=> start!94288 (=> (not res!711657) (not e!607973))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94288 (= res!711657 (validMask!0 mask!1515))))

(assert (=> start!94288 e!607973))

(assert (=> start!94288 true))

(declare-fun tp_is_empty!25461 () Bool)

(assert (=> start!94288 tp_is_empty!25461))

(declare-fun array_inv!25282 (array!67907) Bool)

(assert (=> start!94288 (and (array_inv!25282 _values!955) e!607974)))

(assert (=> start!94288 tp!76394))

(declare-fun array_inv!25283 (array!67909) Bool)

(assert (=> start!94288 (array_inv!25283 _keys!1163)))

(declare-fun b!1066251 () Bool)

(assert (=> b!1066251 (= e!607976 tp_is_empty!25461)))

(declare-fun mapIsEmpty!39880 () Bool)

(assert (=> mapIsEmpty!39880 mapRes!39880))

(declare-fun b!1066252 () Bool)

(declare-fun res!711659 () Bool)

(assert (=> b!1066252 (=> (not res!711659) (not e!607973))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066252 (= res!711659 (and (= (size!33191 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33192 _keys!1163) (size!33191 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066253 () Bool)

(declare-fun res!711660 () Bool)

(assert (=> b!1066253 (=> (not res!711660) (not e!607973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67909 (_ BitVec 32)) Bool)

(assert (=> b!1066253 (= res!711660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066254 () Bool)

(declare-fun e!607975 () Bool)

(assert (=> b!1066254 (= e!607973 (not e!607975))))

(declare-fun res!711658 () Bool)

(assert (=> b!1066254 (=> res!711658 e!607975)))

(assert (=> b!1066254 (= res!711658 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16206 0))(
  ( (tuple2!16207 (_1!8114 (_ BitVec 64)) (_2!8114 V!39083)) )
))
(declare-datatypes ((List!22771 0))(
  ( (Nil!22768) (Cons!22767 (h!23976 tuple2!16206) (t!32092 List!22771)) )
))
(declare-datatypes ((ListLongMap!14175 0))(
  ( (ListLongMap!14176 (toList!7103 List!22771)) )
))
(declare-fun lt!470618 () ListLongMap!14175)

(declare-fun lt!470613 () ListLongMap!14175)

(assert (=> b!1066254 (= lt!470618 lt!470613)))

(declare-fun zeroValueBefore!47 () V!39083)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39083)

(declare-fun minValue!907 () V!39083)

(declare-datatypes ((Unit!35001 0))(
  ( (Unit!35002) )
))
(declare-fun lt!470617 () Unit!35001)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!726 (array!67909 array!67907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39083 V!39083 V!39083 V!39083 (_ BitVec 32) Int) Unit!35001)

(assert (=> b!1066254 (= lt!470617 (lemmaNoChangeToArrayThenSameMapNoExtras!726 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3689 (array!67909 array!67907 (_ BitVec 32) (_ BitVec 32) V!39083 V!39083 (_ BitVec 32) Int) ListLongMap!14175)

(assert (=> b!1066254 (= lt!470613 (getCurrentListMapNoExtraKeys!3689 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066254 (= lt!470618 (getCurrentListMapNoExtraKeys!3689 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066255 () Bool)

(assert (=> b!1066255 (= e!607977 tp_is_empty!25461)))

(declare-fun b!1066256 () Bool)

(assert (=> b!1066256 (= e!607975 true)))

(declare-fun lt!470612 () ListLongMap!14175)

(declare-fun lt!470619 () ListLongMap!14175)

(declare-fun -!615 (ListLongMap!14175 (_ BitVec 64)) ListLongMap!14175)

(assert (=> b!1066256 (= lt!470612 (-!615 lt!470619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470616 () ListLongMap!14175)

(assert (=> b!1066256 (= (-!615 lt!470616 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470618)))

(declare-fun lt!470615 () Unit!35001)

(declare-fun addThenRemoveForNewKeyIsSame!24 (ListLongMap!14175 (_ BitVec 64) V!39083) Unit!35001)

(assert (=> b!1066256 (= lt!470615 (addThenRemoveForNewKeyIsSame!24 lt!470618 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470614 () ListLongMap!14175)

(assert (=> b!1066256 (and (= lt!470619 lt!470616) (= lt!470614 lt!470613))))

(declare-fun +!3146 (ListLongMap!14175 tuple2!16206) ListLongMap!14175)

(assert (=> b!1066256 (= lt!470616 (+!3146 lt!470618 (tuple2!16207 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4059 (array!67909 array!67907 (_ BitVec 32) (_ BitVec 32) V!39083 V!39083 (_ BitVec 32) Int) ListLongMap!14175)

(assert (=> b!1066256 (= lt!470614 (getCurrentListMap!4059 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066256 (= lt!470619 (getCurrentListMap!4059 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94288 res!711657) b!1066252))

(assert (= (and b!1066252 res!711659) b!1066253))

(assert (= (and b!1066253 res!711660) b!1066249))

(assert (= (and b!1066249 res!711661) b!1066254))

(assert (= (and b!1066254 (not res!711658)) b!1066256))

(assert (= (and b!1066250 condMapEmpty!39880) mapIsEmpty!39880))

(assert (= (and b!1066250 (not condMapEmpty!39880)) mapNonEmpty!39880))

(get-info :version)

(assert (= (and mapNonEmpty!39880 ((_ is ValueCellFull!12027) mapValue!39880)) b!1066251))

(assert (= (and b!1066250 ((_ is ValueCellFull!12027) mapDefault!39880)) b!1066255))

(assert (= start!94288 b!1066250))

(declare-fun m!984863 () Bool)

(assert (=> mapNonEmpty!39880 m!984863))

(declare-fun m!984865 () Bool)

(assert (=> b!1066254 m!984865))

(declare-fun m!984867 () Bool)

(assert (=> b!1066254 m!984867))

(declare-fun m!984869 () Bool)

(assert (=> b!1066254 m!984869))

(declare-fun m!984871 () Bool)

(assert (=> b!1066253 m!984871))

(declare-fun m!984873 () Bool)

(assert (=> b!1066249 m!984873))

(declare-fun m!984875 () Bool)

(assert (=> b!1066256 m!984875))

(declare-fun m!984877 () Bool)

(assert (=> b!1066256 m!984877))

(declare-fun m!984879 () Bool)

(assert (=> b!1066256 m!984879))

(declare-fun m!984881 () Bool)

(assert (=> b!1066256 m!984881))

(declare-fun m!984883 () Bool)

(assert (=> b!1066256 m!984883))

(declare-fun m!984885 () Bool)

(assert (=> b!1066256 m!984885))

(declare-fun m!984887 () Bool)

(assert (=> start!94288 m!984887))

(declare-fun m!984889 () Bool)

(assert (=> start!94288 m!984889))

(declare-fun m!984891 () Bool)

(assert (=> start!94288 m!984891))

(check-sat (not start!94288) (not mapNonEmpty!39880) (not b!1066254) tp_is_empty!25461 (not b!1066249) (not b!1066256) b_and!34423 (not b!1066253) (not b_next!21651))
(check-sat b_and!34423 (not b_next!21651))
