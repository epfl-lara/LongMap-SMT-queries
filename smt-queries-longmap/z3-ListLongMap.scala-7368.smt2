; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93920 () Bool)

(assert start!93920)

(declare-fun b_free!21385 () Bool)

(declare-fun b_next!21385 () Bool)

(assert (=> start!93920 (= b_free!21385 (not b_next!21385))))

(declare-fun tp!75580 () Bool)

(declare-fun b_and!34081 () Bool)

(assert (=> start!93920 (= tp!75580 b_and!34081)))

(declare-fun mapIsEmpty!39466 () Bool)

(declare-fun mapRes!39466 () Bool)

(assert (=> mapIsEmpty!39466 mapRes!39466))

(declare-fun b!1062121 () Bool)

(declare-fun res!709248 () Bool)

(declare-fun e!604971 () Bool)

(assert (=> b!1062121 (=> (not res!709248) (not e!604971))))

(declare-datatypes ((array!67340 0))(
  ( (array!67341 (arr!32377 (Array (_ BitVec 32) (_ BitVec 64))) (size!32915 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67340)

(declare-datatypes ((List!22621 0))(
  ( (Nil!22618) (Cons!22617 (h!23826 (_ BitVec 64)) (t!31923 List!22621)) )
))
(declare-fun arrayNoDuplicates!0 (array!67340 (_ BitVec 32) List!22621) Bool)

(assert (=> b!1062121 (= res!709248 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22618))))

(declare-fun b!1062122 () Bool)

(declare-fun e!604970 () Bool)

(assert (=> b!1062122 (= e!604971 (not e!604970))))

(declare-fun res!709249 () Bool)

(assert (=> b!1062122 (=> res!709249 e!604970)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062122 (= res!709249 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38729 0))(
  ( (V!38730 (val!12648 Int)) )
))
(declare-datatypes ((tuple2!16068 0))(
  ( (tuple2!16069 (_1!8045 (_ BitVec 64)) (_2!8045 V!38729)) )
))
(declare-datatypes ((List!22622 0))(
  ( (Nil!22619) (Cons!22618 (h!23827 tuple2!16068) (t!31924 List!22622)) )
))
(declare-datatypes ((ListLongMap!14037 0))(
  ( (ListLongMap!14038 (toList!7034 List!22622)) )
))
(declare-fun lt!467809 () ListLongMap!14037)

(declare-fun lt!467810 () ListLongMap!14037)

(assert (=> b!1062122 (= lt!467809 lt!467810)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38729)

(declare-datatypes ((Unit!34659 0))(
  ( (Unit!34660) )
))
(declare-fun lt!467807 () Unit!34659)

(declare-datatypes ((ValueCell!11894 0))(
  ( (ValueCellFull!11894 (v!15257 V!38729)) (EmptyCell!11894) )
))
(declare-datatypes ((array!67342 0))(
  ( (array!67343 (arr!32378 (Array (_ BitVec 32) ValueCell!11894)) (size!32916 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67342)

(declare-fun minValue!907 () V!38729)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38729)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!640 (array!67340 array!67342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38729 V!38729 V!38729 V!38729 (_ BitVec 32) Int) Unit!34659)

(assert (=> b!1062122 (= lt!467807 (lemmaNoChangeToArrayThenSameMapNoExtras!640 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3646 (array!67340 array!67342 (_ BitVec 32) (_ BitVec 32) V!38729 V!38729 (_ BitVec 32) Int) ListLongMap!14037)

(assert (=> b!1062122 (= lt!467810 (getCurrentListMapNoExtraKeys!3646 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062122 (= lt!467809 (getCurrentListMapNoExtraKeys!3646 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062123 () Bool)

(declare-fun e!604966 () Bool)

(assert (=> b!1062123 (= e!604966 true)))

(declare-fun lt!467811 () ListLongMap!14037)

(declare-fun -!556 (ListLongMap!14037 (_ BitVec 64)) ListLongMap!14037)

(assert (=> b!1062123 (= (-!556 lt!467811 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467811)))

(declare-fun lt!467808 () Unit!34659)

(declare-fun removeNotPresentStillSame!8 (ListLongMap!14037 (_ BitVec 64)) Unit!34659)

(assert (=> b!1062123 (= lt!467808 (removeNotPresentStillSame!8 lt!467811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062124 () Bool)

(declare-fun res!709250 () Bool)

(assert (=> b!1062124 (=> (not res!709250) (not e!604971))))

(assert (=> b!1062124 (= res!709250 (and (= (size!32916 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32915 _keys!1163) (size!32916 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!709252 () Bool)

(assert (=> start!93920 (=> (not res!709252) (not e!604971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93920 (= res!709252 (validMask!0 mask!1515))))

(assert (=> start!93920 e!604971))

(assert (=> start!93920 true))

(declare-fun tp_is_empty!25195 () Bool)

(assert (=> start!93920 tp_is_empty!25195))

(declare-fun e!604967 () Bool)

(declare-fun array_inv!25086 (array!67342) Bool)

(assert (=> start!93920 (and (array_inv!25086 _values!955) e!604967)))

(assert (=> start!93920 tp!75580))

(declare-fun array_inv!25087 (array!67340) Bool)

(assert (=> start!93920 (array_inv!25087 _keys!1163)))

(declare-fun b!1062125 () Bool)

(declare-fun e!604968 () Bool)

(assert (=> b!1062125 (= e!604968 tp_is_empty!25195)))

(declare-fun b!1062126 () Bool)

(assert (=> b!1062126 (= e!604970 e!604966)))

(declare-fun res!709251 () Bool)

(assert (=> b!1062126 (=> res!709251 e!604966)))

(declare-fun contains!6203 (ListLongMap!14037 (_ BitVec 64)) Bool)

(assert (=> b!1062126 (= res!709251 (contains!6203 lt!467811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3935 (array!67340 array!67342 (_ BitVec 32) (_ BitVec 32) V!38729 V!38729 (_ BitVec 32) Int) ListLongMap!14037)

(assert (=> b!1062126 (= lt!467811 (getCurrentListMap!3935 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062127 () Bool)

(declare-fun e!604969 () Bool)

(assert (=> b!1062127 (= e!604969 tp_is_empty!25195)))

(declare-fun b!1062128 () Bool)

(assert (=> b!1062128 (= e!604967 (and e!604968 mapRes!39466))))

(declare-fun condMapEmpty!39466 () Bool)

(declare-fun mapDefault!39466 () ValueCell!11894)

(assert (=> b!1062128 (= condMapEmpty!39466 (= (arr!32378 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11894)) mapDefault!39466)))))

(declare-fun b!1062129 () Bool)

(declare-fun res!709253 () Bool)

(assert (=> b!1062129 (=> (not res!709253) (not e!604971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67340 (_ BitVec 32)) Bool)

(assert (=> b!1062129 (= res!709253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39466 () Bool)

(declare-fun tp!75581 () Bool)

(assert (=> mapNonEmpty!39466 (= mapRes!39466 (and tp!75581 e!604969))))

(declare-fun mapValue!39466 () ValueCell!11894)

(declare-fun mapKey!39466 () (_ BitVec 32))

(declare-fun mapRest!39466 () (Array (_ BitVec 32) ValueCell!11894))

(assert (=> mapNonEmpty!39466 (= (arr!32378 _values!955) (store mapRest!39466 mapKey!39466 mapValue!39466))))

(assert (= (and start!93920 res!709252) b!1062124))

(assert (= (and b!1062124 res!709250) b!1062129))

(assert (= (and b!1062129 res!709253) b!1062121))

(assert (= (and b!1062121 res!709248) b!1062122))

(assert (= (and b!1062122 (not res!709249)) b!1062126))

(assert (= (and b!1062126 (not res!709251)) b!1062123))

(assert (= (and b!1062128 condMapEmpty!39466) mapIsEmpty!39466))

(assert (= (and b!1062128 (not condMapEmpty!39466)) mapNonEmpty!39466))

(get-info :version)

(assert (= (and mapNonEmpty!39466 ((_ is ValueCellFull!11894) mapValue!39466)) b!1062127))

(assert (= (and b!1062128 ((_ is ValueCellFull!11894) mapDefault!39466)) b!1062125))

(assert (= start!93920 b!1062128))

(declare-fun m!980407 () Bool)

(assert (=> mapNonEmpty!39466 m!980407))

(declare-fun m!980409 () Bool)

(assert (=> start!93920 m!980409))

(declare-fun m!980411 () Bool)

(assert (=> start!93920 m!980411))

(declare-fun m!980413 () Bool)

(assert (=> start!93920 m!980413))

(declare-fun m!980415 () Bool)

(assert (=> b!1062123 m!980415))

(declare-fun m!980417 () Bool)

(assert (=> b!1062123 m!980417))

(declare-fun m!980419 () Bool)

(assert (=> b!1062122 m!980419))

(declare-fun m!980421 () Bool)

(assert (=> b!1062122 m!980421))

(declare-fun m!980423 () Bool)

(assert (=> b!1062122 m!980423))

(declare-fun m!980425 () Bool)

(assert (=> b!1062126 m!980425))

(declare-fun m!980427 () Bool)

(assert (=> b!1062126 m!980427))

(declare-fun m!980429 () Bool)

(assert (=> b!1062121 m!980429))

(declare-fun m!980431 () Bool)

(assert (=> b!1062129 m!980431))

(check-sat tp_is_empty!25195 (not start!93920) b_and!34081 (not b!1062126) (not b_next!21385) (not b!1062129) (not b!1062122) (not b!1062121) (not mapNonEmpty!39466) (not b!1062123))
(check-sat b_and!34081 (not b_next!21385))
