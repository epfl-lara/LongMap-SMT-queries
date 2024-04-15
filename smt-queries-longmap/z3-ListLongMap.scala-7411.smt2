; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94274 () Bool)

(assert start!94274)

(declare-fun b_free!21643 () Bool)

(declare-fun b_next!21643 () Bool)

(assert (=> start!94274 (= b_free!21643 (not b_next!21643))))

(declare-fun tp!76370 () Bool)

(declare-fun b_and!34389 () Bool)

(assert (=> start!94274 (= tp!76370 b_and!34389)))

(declare-fun b!1066000 () Bool)

(declare-fun res!711528 () Bool)

(declare-fun e!607812 () Bool)

(assert (=> b!1066000 (=> (not res!711528) (not e!607812))))

(declare-datatypes ((array!67832 0))(
  ( (array!67833 (arr!32618 (Array (_ BitVec 32) (_ BitVec 64))) (size!33156 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67832)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67832 (_ BitVec 32)) Bool)

(assert (=> b!1066000 (= res!711528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066001 () Bool)

(declare-fun e!607811 () Bool)

(declare-fun tp_is_empty!25453 () Bool)

(assert (=> b!1066001 (= e!607811 tp_is_empty!25453)))

(declare-fun res!711530 () Bool)

(assert (=> start!94274 (=> (not res!711530) (not e!607812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94274 (= res!711530 (validMask!0 mask!1515))))

(assert (=> start!94274 e!607812))

(assert (=> start!94274 true))

(assert (=> start!94274 tp_is_empty!25453))

(declare-datatypes ((V!39073 0))(
  ( (V!39074 (val!12777 Int)) )
))
(declare-datatypes ((ValueCell!12023 0))(
  ( (ValueCellFull!12023 (v!15389 V!39073)) (EmptyCell!12023) )
))
(declare-datatypes ((array!67834 0))(
  ( (array!67835 (arr!32619 (Array (_ BitVec 32) ValueCell!12023)) (size!33157 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67834)

(declare-fun e!607809 () Bool)

(declare-fun array_inv!25254 (array!67834) Bool)

(assert (=> start!94274 (and (array_inv!25254 _values!955) e!607809)))

(assert (=> start!94274 tp!76370))

(declare-fun array_inv!25255 (array!67832) Bool)

(assert (=> start!94274 (array_inv!25255 _keys!1163)))

(declare-fun b!1066002 () Bool)

(declare-fun e!607810 () Bool)

(assert (=> b!1066002 (= e!607812 (not e!607810))))

(declare-fun res!711532 () Bool)

(assert (=> b!1066002 (=> res!711532 e!607810)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066002 (= res!711532 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16254 0))(
  ( (tuple2!16255 (_1!8138 (_ BitVec 64)) (_2!8138 V!39073)) )
))
(declare-datatypes ((List!22800 0))(
  ( (Nil!22797) (Cons!22796 (h!24005 tuple2!16254) (t!32112 List!22800)) )
))
(declare-datatypes ((ListLongMap!14223 0))(
  ( (ListLongMap!14224 (toList!7127 List!22800)) )
))
(declare-fun lt!470323 () ListLongMap!14223)

(declare-fun lt!470317 () ListLongMap!14223)

(assert (=> b!1066002 (= lt!470323 lt!470317)))

(declare-fun zeroValueBefore!47 () V!39073)

(declare-datatypes ((Unit!34842 0))(
  ( (Unit!34843) )
))
(declare-fun lt!470321 () Unit!34842)

(declare-fun minValue!907 () V!39073)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39073)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!720 (array!67832 array!67834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39073 V!39073 V!39073 V!39073 (_ BitVec 32) Int) Unit!34842)

(assert (=> b!1066002 (= lt!470321 (lemmaNoChangeToArrayThenSameMapNoExtras!720 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3726 (array!67832 array!67834 (_ BitVec 32) (_ BitVec 32) V!39073 V!39073 (_ BitVec 32) Int) ListLongMap!14223)

(assert (=> b!1066002 (= lt!470317 (getCurrentListMapNoExtraKeys!3726 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066002 (= lt!470323 (getCurrentListMapNoExtraKeys!3726 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066003 () Bool)

(assert (=> b!1066003 (= e!607810 true)))

(declare-fun lt!470316 () ListLongMap!14223)

(declare-fun lt!470320 () ListLongMap!14223)

(declare-fun -!601 (ListLongMap!14223 (_ BitVec 64)) ListLongMap!14223)

(assert (=> b!1066003 (= lt!470316 (-!601 lt!470320 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470322 () ListLongMap!14223)

(assert (=> b!1066003 (= (-!601 lt!470322 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470323)))

(declare-fun lt!470318 () Unit!34842)

(declare-fun addThenRemoveForNewKeyIsSame!19 (ListLongMap!14223 (_ BitVec 64) V!39073) Unit!34842)

(assert (=> b!1066003 (= lt!470318 (addThenRemoveForNewKeyIsSame!19 lt!470323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470319 () ListLongMap!14223)

(assert (=> b!1066003 (and (= lt!470320 lt!470322) (= lt!470319 lt!470317))))

(declare-fun +!3167 (ListLongMap!14223 tuple2!16254) ListLongMap!14223)

(assert (=> b!1066003 (= lt!470322 (+!3167 lt!470323 (tuple2!16255 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!3999 (array!67832 array!67834 (_ BitVec 32) (_ BitVec 32) V!39073 V!39073 (_ BitVec 32) Int) ListLongMap!14223)

(assert (=> b!1066003 (= lt!470319 (getCurrentListMap!3999 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066003 (= lt!470320 (getCurrentListMap!3999 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066004 () Bool)

(declare-fun e!607808 () Bool)

(assert (=> b!1066004 (= e!607808 tp_is_empty!25453)))

(declare-fun b!1066005 () Bool)

(declare-fun res!711529 () Bool)

(assert (=> b!1066005 (=> (not res!711529) (not e!607812))))

(declare-datatypes ((List!22801 0))(
  ( (Nil!22798) (Cons!22797 (h!24006 (_ BitVec 64)) (t!32113 List!22801)) )
))
(declare-fun arrayNoDuplicates!0 (array!67832 (_ BitVec 32) List!22801) Bool)

(assert (=> b!1066005 (= res!711529 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22798))))

(declare-fun mapIsEmpty!39868 () Bool)

(declare-fun mapRes!39868 () Bool)

(assert (=> mapIsEmpty!39868 mapRes!39868))

(declare-fun mapNonEmpty!39868 () Bool)

(declare-fun tp!76369 () Bool)

(assert (=> mapNonEmpty!39868 (= mapRes!39868 (and tp!76369 e!607808))))

(declare-fun mapValue!39868 () ValueCell!12023)

(declare-fun mapKey!39868 () (_ BitVec 32))

(declare-fun mapRest!39868 () (Array (_ BitVec 32) ValueCell!12023))

(assert (=> mapNonEmpty!39868 (= (arr!32619 _values!955) (store mapRest!39868 mapKey!39868 mapValue!39868))))

(declare-fun b!1066006 () Bool)

(assert (=> b!1066006 (= e!607809 (and e!607811 mapRes!39868))))

(declare-fun condMapEmpty!39868 () Bool)

(declare-fun mapDefault!39868 () ValueCell!12023)

(assert (=> b!1066006 (= condMapEmpty!39868 (= (arr!32619 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12023)) mapDefault!39868)))))

(declare-fun b!1066007 () Bool)

(declare-fun res!711531 () Bool)

(assert (=> b!1066007 (=> (not res!711531) (not e!607812))))

(assert (=> b!1066007 (= res!711531 (and (= (size!33157 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33156 _keys!1163) (size!33157 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94274 res!711530) b!1066007))

(assert (= (and b!1066007 res!711531) b!1066000))

(assert (= (and b!1066000 res!711528) b!1066005))

(assert (= (and b!1066005 res!711529) b!1066002))

(assert (= (and b!1066002 (not res!711532)) b!1066003))

(assert (= (and b!1066006 condMapEmpty!39868) mapIsEmpty!39868))

(assert (= (and b!1066006 (not condMapEmpty!39868)) mapNonEmpty!39868))

(get-info :version)

(assert (= (and mapNonEmpty!39868 ((_ is ValueCellFull!12023) mapValue!39868)) b!1066004))

(assert (= (and b!1066006 ((_ is ValueCellFull!12023) mapDefault!39868)) b!1066001))

(assert (= start!94274 b!1066006))

(declare-fun m!984117 () Bool)

(assert (=> b!1066002 m!984117))

(declare-fun m!984119 () Bool)

(assert (=> b!1066002 m!984119))

(declare-fun m!984121 () Bool)

(assert (=> b!1066002 m!984121))

(declare-fun m!984123 () Bool)

(assert (=> b!1066003 m!984123))

(declare-fun m!984125 () Bool)

(assert (=> b!1066003 m!984125))

(declare-fun m!984127 () Bool)

(assert (=> b!1066003 m!984127))

(declare-fun m!984129 () Bool)

(assert (=> b!1066003 m!984129))

(declare-fun m!984131 () Bool)

(assert (=> b!1066003 m!984131))

(declare-fun m!984133 () Bool)

(assert (=> b!1066003 m!984133))

(declare-fun m!984135 () Bool)

(assert (=> b!1066000 m!984135))

(declare-fun m!984137 () Bool)

(assert (=> mapNonEmpty!39868 m!984137))

(declare-fun m!984139 () Bool)

(assert (=> b!1066005 m!984139))

(declare-fun m!984141 () Bool)

(assert (=> start!94274 m!984141))

(declare-fun m!984143 () Bool)

(assert (=> start!94274 m!984143))

(declare-fun m!984145 () Bool)

(assert (=> start!94274 m!984145))

(check-sat (not mapNonEmpty!39868) (not b!1066003) (not b!1066002) (not b!1066000) b_and!34389 (not b!1066005) (not start!94274) (not b_next!21643) tp_is_empty!25453)
(check-sat b_and!34389 (not b_next!21643))
