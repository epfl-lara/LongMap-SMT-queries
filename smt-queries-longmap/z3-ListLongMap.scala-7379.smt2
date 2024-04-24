; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94250 () Bool)

(assert start!94250)

(declare-fun b_free!21451 () Bool)

(declare-fun b_next!21451 () Bool)

(assert (=> start!94250 (= b_free!21451 (not b_next!21451))))

(declare-fun tp!75782 () Bool)

(declare-fun b_and!34193 () Bool)

(assert (=> start!94250 (= tp!75782 b_and!34193)))

(declare-fun b!1064649 () Bool)

(declare-fun e!606709 () Bool)

(declare-fun e!606707 () Bool)

(assert (=> b!1064649 (= e!606709 (not e!606707))))

(declare-fun res!710495 () Bool)

(assert (=> b!1064649 (=> res!710495 e!606707)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064649 (= res!710495 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38817 0))(
  ( (V!38818 (val!12681 Int)) )
))
(declare-datatypes ((tuple2!16040 0))(
  ( (tuple2!16041 (_1!8031 (_ BitVec 64)) (_2!8031 V!38817)) )
))
(declare-datatypes ((List!22613 0))(
  ( (Nil!22610) (Cons!22609 (h!23827 tuple2!16040) (t!31918 List!22613)) )
))
(declare-datatypes ((ListLongMap!14017 0))(
  ( (ListLongMap!14018 (toList!7024 List!22613)) )
))
(declare-fun lt!469144 () ListLongMap!14017)

(declare-fun lt!469143 () ListLongMap!14017)

(assert (=> b!1064649 (= lt!469144 lt!469143)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38817)

(declare-datatypes ((ValueCell!11927 0))(
  ( (ValueCellFull!11927 (v!15288 V!38817)) (EmptyCell!11927) )
))
(declare-datatypes ((array!67565 0))(
  ( (array!67566 (arr!32482 (Array (_ BitVec 32) ValueCell!11927)) (size!33019 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67565)

(declare-fun minValue!907 () V!38817)

(declare-datatypes ((Unit!34849 0))(
  ( (Unit!34850) )
))
(declare-fun lt!469145 () Unit!34849)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38817)

(declare-datatypes ((array!67567 0))(
  ( (array!67568 (arr!32483 (Array (_ BitVec 32) (_ BitVec 64))) (size!33020 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67567)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!665 (array!67567 array!67565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38817 V!38817 V!38817 V!38817 (_ BitVec 32) Int) Unit!34849)

(assert (=> b!1064649 (= lt!469145 (lemmaNoChangeToArrayThenSameMapNoExtras!665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3662 (array!67567 array!67565 (_ BitVec 32) (_ BitVec 32) V!38817 V!38817 (_ BitVec 32) Int) ListLongMap!14017)

(assert (=> b!1064649 (= lt!469143 (getCurrentListMapNoExtraKeys!3662 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064649 (= lt!469144 (getCurrentListMapNoExtraKeys!3662 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710499 () Bool)

(assert (=> start!94250 (=> (not res!710499) (not e!606709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94250 (= res!710499 (validMask!0 mask!1515))))

(assert (=> start!94250 e!606709))

(assert (=> start!94250 true))

(declare-fun tp_is_empty!25261 () Bool)

(assert (=> start!94250 tp_is_empty!25261))

(declare-fun e!606710 () Bool)

(declare-fun array_inv!25180 (array!67565) Bool)

(assert (=> start!94250 (and (array_inv!25180 _values!955) e!606710)))

(assert (=> start!94250 tp!75782))

(declare-fun array_inv!25181 (array!67567) Bool)

(assert (=> start!94250 (array_inv!25181 _keys!1163)))

(declare-fun b!1064650 () Bool)

(declare-fun e!606708 () Bool)

(assert (=> b!1064650 (= e!606708 tp_is_empty!25261)))

(declare-fun mapNonEmpty!39568 () Bool)

(declare-fun mapRes!39568 () Bool)

(declare-fun tp!75781 () Bool)

(declare-fun e!606712 () Bool)

(assert (=> mapNonEmpty!39568 (= mapRes!39568 (and tp!75781 e!606712))))

(declare-fun mapValue!39568 () ValueCell!11927)

(declare-fun mapKey!39568 () (_ BitVec 32))

(declare-fun mapRest!39568 () (Array (_ BitVec 32) ValueCell!11927))

(assert (=> mapNonEmpty!39568 (= (arr!32482 _values!955) (store mapRest!39568 mapKey!39568 mapValue!39568))))

(declare-fun b!1064651 () Bool)

(assert (=> b!1064651 (= e!606712 tp_is_empty!25261)))

(declare-fun b!1064652 () Bool)

(declare-fun res!710496 () Bool)

(assert (=> b!1064652 (=> (not res!710496) (not e!606709))))

(assert (=> b!1064652 (= res!710496 (and (= (size!33019 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33020 _keys!1163) (size!33019 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064653 () Bool)

(declare-fun e!606711 () Bool)

(assert (=> b!1064653 (= e!606707 e!606711)))

(declare-fun res!710498 () Bool)

(assert (=> b!1064653 (=> res!710498 e!606711)))

(declare-fun lt!469142 () ListLongMap!14017)

(declare-fun contains!6275 (ListLongMap!14017 (_ BitVec 64)) Bool)

(assert (=> b!1064653 (= res!710498 (contains!6275 lt!469142 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4000 (array!67567 array!67565 (_ BitVec 32) (_ BitVec 32) V!38817 V!38817 (_ BitVec 32) Int) ListLongMap!14017)

(assert (=> b!1064653 (= lt!469142 (getCurrentListMap!4000 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064654 () Bool)

(assert (=> b!1064654 (= e!606711 true)))

(declare-fun -!583 (ListLongMap!14017 (_ BitVec 64)) ListLongMap!14017)

(assert (=> b!1064654 (= (-!583 lt!469142 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469142)))

(declare-fun lt!469141 () Unit!34849)

(declare-fun removeNotPresentStillSame!34 (ListLongMap!14017 (_ BitVec 64)) Unit!34849)

(assert (=> b!1064654 (= lt!469141 (removeNotPresentStillSame!34 lt!469142 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064655 () Bool)

(assert (=> b!1064655 (= e!606710 (and e!606708 mapRes!39568))))

(declare-fun condMapEmpty!39568 () Bool)

(declare-fun mapDefault!39568 () ValueCell!11927)

(assert (=> b!1064655 (= condMapEmpty!39568 (= (arr!32482 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11927)) mapDefault!39568)))))

(declare-fun b!1064656 () Bool)

(declare-fun res!710497 () Bool)

(assert (=> b!1064656 (=> (not res!710497) (not e!606709))))

(declare-datatypes ((List!22614 0))(
  ( (Nil!22611) (Cons!22610 (h!23828 (_ BitVec 64)) (t!31919 List!22614)) )
))
(declare-fun arrayNoDuplicates!0 (array!67567 (_ BitVec 32) List!22614) Bool)

(assert (=> b!1064656 (= res!710497 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22611))))

(declare-fun mapIsEmpty!39568 () Bool)

(assert (=> mapIsEmpty!39568 mapRes!39568))

(declare-fun b!1064657 () Bool)

(declare-fun res!710494 () Bool)

(assert (=> b!1064657 (=> (not res!710494) (not e!606709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67567 (_ BitVec 32)) Bool)

(assert (=> b!1064657 (= res!710494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94250 res!710499) b!1064652))

(assert (= (and b!1064652 res!710496) b!1064657))

(assert (= (and b!1064657 res!710494) b!1064656))

(assert (= (and b!1064656 res!710497) b!1064649))

(assert (= (and b!1064649 (not res!710495)) b!1064653))

(assert (= (and b!1064653 (not res!710498)) b!1064654))

(assert (= (and b!1064655 condMapEmpty!39568) mapIsEmpty!39568))

(assert (= (and b!1064655 (not condMapEmpty!39568)) mapNonEmpty!39568))

(get-info :version)

(assert (= (and mapNonEmpty!39568 ((_ is ValueCellFull!11927) mapValue!39568)) b!1064651))

(assert (= (and b!1064655 ((_ is ValueCellFull!11927) mapDefault!39568)) b!1064650))

(assert (= start!94250 b!1064655))

(declare-fun m!983689 () Bool)

(assert (=> b!1064654 m!983689))

(declare-fun m!983691 () Bool)

(assert (=> b!1064654 m!983691))

(declare-fun m!983693 () Bool)

(assert (=> b!1064657 m!983693))

(declare-fun m!983695 () Bool)

(assert (=> mapNonEmpty!39568 m!983695))

(declare-fun m!983697 () Bool)

(assert (=> b!1064656 m!983697))

(declare-fun m!983699 () Bool)

(assert (=> start!94250 m!983699))

(declare-fun m!983701 () Bool)

(assert (=> start!94250 m!983701))

(declare-fun m!983703 () Bool)

(assert (=> start!94250 m!983703))

(declare-fun m!983705 () Bool)

(assert (=> b!1064649 m!983705))

(declare-fun m!983707 () Bool)

(assert (=> b!1064649 m!983707))

(declare-fun m!983709 () Bool)

(assert (=> b!1064649 m!983709))

(declare-fun m!983711 () Bool)

(assert (=> b!1064653 m!983711))

(declare-fun m!983713 () Bool)

(assert (=> b!1064653 m!983713))

(check-sat b_and!34193 (not b!1064654) (not b!1064653) tp_is_empty!25261 (not b!1064657) (not b!1064649) (not b_next!21451) (not start!94250) (not mapNonEmpty!39568) (not b!1064656))
(check-sat b_and!34193 (not b_next!21451))
