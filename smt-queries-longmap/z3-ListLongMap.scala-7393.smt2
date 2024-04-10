; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94136 () Bool)

(assert start!94136)

(declare-fun b_free!21537 () Bool)

(declare-fun b_next!21537 () Bool)

(assert (=> start!94136 (= b_free!21537 (not b_next!21537))))

(declare-fun tp!76045 () Bool)

(declare-fun b_and!34287 () Bool)

(assert (=> start!94136 (= tp!76045 b_and!34287)))

(declare-fun b!1064540 () Bool)

(declare-fun e!606727 () Bool)

(declare-fun e!606729 () Bool)

(assert (=> b!1064540 (= e!606727 (not e!606729))))

(declare-fun res!710655 () Bool)

(assert (=> b!1064540 (=> res!710655 e!606729)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064540 (= res!710655 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!38931 0))(
  ( (V!38932 (val!12724 Int)) )
))
(declare-datatypes ((tuple2!16114 0))(
  ( (tuple2!16115 (_1!8068 (_ BitVec 64)) (_2!8068 V!38931)) )
))
(declare-datatypes ((List!22687 0))(
  ( (Nil!22684) (Cons!22683 (h!23892 tuple2!16114) (t!32004 List!22687)) )
))
(declare-datatypes ((ListLongMap!14083 0))(
  ( (ListLongMap!14084 (toList!7057 List!22687)) )
))
(declare-fun lt!469252 () ListLongMap!14083)

(declare-fun lt!469253 () ListLongMap!14083)

(assert (=> b!1064540 (= lt!469252 lt!469253)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38931)

(declare-datatypes ((ValueCell!11970 0))(
  ( (ValueCellFull!11970 (v!15336 V!38931)) (EmptyCell!11970) )
))
(declare-datatypes ((array!67683 0))(
  ( (array!67684 (arr!32545 (Array (_ BitVec 32) ValueCell!11970)) (size!33081 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67683)

(declare-fun minValue!907 () V!38931)

(declare-datatypes ((Unit!34912 0))(
  ( (Unit!34913) )
))
(declare-fun lt!469251 () Unit!34912)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38931)

(declare-datatypes ((array!67685 0))(
  ( (array!67686 (arr!32546 (Array (_ BitVec 32) (_ BitVec 64))) (size!33082 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67685)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!685 (array!67685 array!67683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38931 V!38931 V!38931 V!38931 (_ BitVec 32) Int) Unit!34912)

(assert (=> b!1064540 (= lt!469251 (lemmaNoChangeToArrayThenSameMapNoExtras!685 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3648 (array!67685 array!67683 (_ BitVec 32) (_ BitVec 32) V!38931 V!38931 (_ BitVec 32) Int) ListLongMap!14083)

(assert (=> b!1064540 (= lt!469253 (getCurrentListMapNoExtraKeys!3648 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064540 (= lt!469252 (getCurrentListMapNoExtraKeys!3648 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39703 () Bool)

(declare-fun mapRes!39703 () Bool)

(declare-fun tp!76046 () Bool)

(declare-fun e!606730 () Bool)

(assert (=> mapNonEmpty!39703 (= mapRes!39703 (and tp!76046 e!606730))))

(declare-fun mapValue!39703 () ValueCell!11970)

(declare-fun mapRest!39703 () (Array (_ BitVec 32) ValueCell!11970))

(declare-fun mapKey!39703 () (_ BitVec 32))

(assert (=> mapNonEmpty!39703 (= (arr!32545 _values!955) (store mapRest!39703 mapKey!39703 mapValue!39703))))

(declare-fun b!1064541 () Bool)

(declare-fun res!710657 () Bool)

(assert (=> b!1064541 (=> (not res!710657) (not e!606727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67685 (_ BitVec 32)) Bool)

(assert (=> b!1064541 (= res!710657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064542 () Bool)

(declare-fun tp_is_empty!25347 () Bool)

(assert (=> b!1064542 (= e!606730 tp_is_empty!25347)))

(declare-fun b!1064543 () Bool)

(assert (=> b!1064543 (= e!606729 true)))

(declare-fun lt!469250 () ListLongMap!14083)

(declare-fun getCurrentListMap!4018 (array!67685 array!67683 (_ BitVec 32) (_ BitVec 32) V!38931 V!38931 (_ BitVec 32) Int) ListLongMap!14083)

(assert (=> b!1064543 (= lt!469250 (getCurrentListMap!4018 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064544 () Bool)

(declare-fun e!606728 () Bool)

(assert (=> b!1064544 (= e!606728 tp_is_empty!25347)))

(declare-fun b!1064545 () Bool)

(declare-fun e!606726 () Bool)

(assert (=> b!1064545 (= e!606726 (and e!606728 mapRes!39703))))

(declare-fun condMapEmpty!39703 () Bool)

(declare-fun mapDefault!39703 () ValueCell!11970)

(assert (=> b!1064545 (= condMapEmpty!39703 (= (arr!32545 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11970)) mapDefault!39703)))))

(declare-fun b!1064546 () Bool)

(declare-fun res!710656 () Bool)

(assert (=> b!1064546 (=> (not res!710656) (not e!606727))))

(assert (=> b!1064546 (= res!710656 (and (= (size!33081 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33082 _keys!1163) (size!33081 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064547 () Bool)

(declare-fun res!710654 () Bool)

(assert (=> b!1064547 (=> (not res!710654) (not e!606727))))

(declare-datatypes ((List!22688 0))(
  ( (Nil!22685) (Cons!22684 (h!23893 (_ BitVec 64)) (t!32005 List!22688)) )
))
(declare-fun arrayNoDuplicates!0 (array!67685 (_ BitVec 32) List!22688) Bool)

(assert (=> b!1064547 (= res!710654 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22685))))

(declare-fun mapIsEmpty!39703 () Bool)

(assert (=> mapIsEmpty!39703 mapRes!39703))

(declare-fun res!710653 () Bool)

(assert (=> start!94136 (=> (not res!710653) (not e!606727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94136 (= res!710653 (validMask!0 mask!1515))))

(assert (=> start!94136 e!606727))

(assert (=> start!94136 true))

(assert (=> start!94136 tp_is_empty!25347))

(declare-fun array_inv!25202 (array!67683) Bool)

(assert (=> start!94136 (and (array_inv!25202 _values!955) e!606726)))

(assert (=> start!94136 tp!76045))

(declare-fun array_inv!25203 (array!67685) Bool)

(assert (=> start!94136 (array_inv!25203 _keys!1163)))

(assert (= (and start!94136 res!710653) b!1064546))

(assert (= (and b!1064546 res!710656) b!1064541))

(assert (= (and b!1064541 res!710657) b!1064547))

(assert (= (and b!1064547 res!710654) b!1064540))

(assert (= (and b!1064540 (not res!710655)) b!1064543))

(assert (= (and b!1064545 condMapEmpty!39703) mapIsEmpty!39703))

(assert (= (and b!1064545 (not condMapEmpty!39703)) mapNonEmpty!39703))

(get-info :version)

(assert (= (and mapNonEmpty!39703 ((_ is ValueCellFull!11970) mapValue!39703)) b!1064542))

(assert (= (and b!1064545 ((_ is ValueCellFull!11970) mapDefault!39703)) b!1064544))

(assert (= start!94136 b!1064545))

(declare-fun m!983069 () Bool)

(assert (=> b!1064540 m!983069))

(declare-fun m!983071 () Bool)

(assert (=> b!1064540 m!983071))

(declare-fun m!983073 () Bool)

(assert (=> b!1064540 m!983073))

(declare-fun m!983075 () Bool)

(assert (=> b!1064541 m!983075))

(declare-fun m!983077 () Bool)

(assert (=> b!1064543 m!983077))

(declare-fun m!983079 () Bool)

(assert (=> b!1064547 m!983079))

(declare-fun m!983081 () Bool)

(assert (=> start!94136 m!983081))

(declare-fun m!983083 () Bool)

(assert (=> start!94136 m!983083))

(declare-fun m!983085 () Bool)

(assert (=> start!94136 m!983085))

(declare-fun m!983087 () Bool)

(assert (=> mapNonEmpty!39703 m!983087))

(check-sat (not b!1064543) (not b!1064547) (not b!1064541) (not start!94136) (not mapNonEmpty!39703) (not b_next!21537) b_and!34287 (not b!1064540) tp_is_empty!25347)
(check-sat b_and!34287 (not b_next!21537))
