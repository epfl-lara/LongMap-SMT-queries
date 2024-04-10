; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93872 () Bool)

(assert start!93872)

(declare-fun b_free!21345 () Bool)

(declare-fun b_next!21345 () Bool)

(assert (=> start!93872 (= b_free!21345 (not b_next!21345))))

(declare-fun tp!75458 () Bool)

(declare-fun b_and!34059 () Bool)

(assert (=> start!93872 (= tp!75458 b_and!34059)))

(declare-fun mapNonEmpty!39403 () Bool)

(declare-fun mapRes!39403 () Bool)

(declare-fun tp!75457 () Bool)

(declare-fun e!604621 () Bool)

(assert (=> mapNonEmpty!39403 (= mapRes!39403 (and tp!75457 e!604621))))

(declare-datatypes ((V!38675 0))(
  ( (V!38676 (val!12628 Int)) )
))
(declare-datatypes ((ValueCell!11874 0))(
  ( (ValueCellFull!11874 (v!15238 V!38675)) (EmptyCell!11874) )
))
(declare-fun mapValue!39403 () ValueCell!11874)

(declare-fun mapRest!39403 () (Array (_ BitVec 32) ValueCell!11874))

(declare-datatypes ((array!67313 0))(
  ( (array!67314 (arr!32364 (Array (_ BitVec 32) ValueCell!11874)) (size!32900 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67313)

(declare-fun mapKey!39403 () (_ BitVec 32))

(assert (=> mapNonEmpty!39403 (= (arr!32364 _values!955) (store mapRest!39403 mapKey!39403 mapValue!39403))))

(declare-fun b!1061684 () Bool)

(declare-fun e!604619 () Bool)

(declare-fun e!604622 () Bool)

(assert (=> b!1061684 (= e!604619 (and e!604622 mapRes!39403))))

(declare-fun condMapEmpty!39403 () Bool)

(declare-fun mapDefault!39403 () ValueCell!11874)

(assert (=> b!1061684 (= condMapEmpty!39403 (= (arr!32364 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11874)) mapDefault!39403)))))

(declare-fun b!1061685 () Bool)

(declare-fun tp_is_empty!25155 () Bool)

(assert (=> b!1061685 (= e!604622 tp_is_empty!25155)))

(declare-fun b!1061686 () Bool)

(declare-fun res!708961 () Bool)

(declare-fun e!604623 () Bool)

(assert (=> b!1061686 (=> (not res!708961) (not e!604623))))

(declare-datatypes ((array!67315 0))(
  ( (array!67316 (arr!32365 (Array (_ BitVec 32) (_ BitVec 64))) (size!32901 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67315)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67315 (_ BitVec 32)) Bool)

(assert (=> b!1061686 (= res!708961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061687 () Bool)

(assert (=> b!1061687 (= e!604621 tp_is_empty!25155)))

(declare-fun res!708962 () Bool)

(assert (=> start!93872 (=> (not res!708962) (not e!604623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93872 (= res!708962 (validMask!0 mask!1515))))

(assert (=> start!93872 e!604623))

(assert (=> start!93872 true))

(assert (=> start!93872 tp_is_empty!25155))

(declare-fun array_inv!25076 (array!67313) Bool)

(assert (=> start!93872 (and (array_inv!25076 _values!955) e!604619)))

(assert (=> start!93872 tp!75458))

(declare-fun array_inv!25077 (array!67315) Bool)

(assert (=> start!93872 (array_inv!25077 _keys!1163)))

(declare-fun b!1061688 () Bool)

(declare-fun res!708963 () Bool)

(assert (=> b!1061688 (=> (not res!708963) (not e!604623))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061688 (= res!708963 (and (= (size!32900 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32901 _keys!1163) (size!32900 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061689 () Bool)

(declare-fun res!708964 () Bool)

(assert (=> b!1061689 (=> (not res!708964) (not e!604623))))

(declare-datatypes ((List!22547 0))(
  ( (Nil!22544) (Cons!22543 (h!23752 (_ BitVec 64)) (t!31856 List!22547)) )
))
(declare-fun arrayNoDuplicates!0 (array!67315 (_ BitVec 32) List!22547) Bool)

(assert (=> b!1061689 (= res!708964 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22544))))

(declare-fun b!1061690 () Bool)

(assert (=> b!1061690 (= e!604623 (not true))))

(declare-datatypes ((tuple2!15962 0))(
  ( (tuple2!15963 (_1!7992 (_ BitVec 64)) (_2!7992 V!38675)) )
))
(declare-datatypes ((List!22548 0))(
  ( (Nil!22545) (Cons!22544 (h!23753 tuple2!15962) (t!31857 List!22548)) )
))
(declare-datatypes ((ListLongMap!13931 0))(
  ( (ListLongMap!13932 (toList!6981 List!22548)) )
))
(declare-fun lt!467704 () ListLongMap!13931)

(declare-fun lt!467703 () ListLongMap!13931)

(assert (=> b!1061690 (= lt!467704 lt!467703)))

(declare-fun zeroValueBefore!47 () V!38675)

(declare-fun minValue!907 () V!38675)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38675)

(declare-datatypes ((Unit!34764 0))(
  ( (Unit!34765) )
))
(declare-fun lt!467702 () Unit!34764)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!620 (array!67315 array!67313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38675 V!38675 V!38675 V!38675 (_ BitVec 32) Int) Unit!34764)

(assert (=> b!1061690 (= lt!467702 (lemmaNoChangeToArrayThenSameMapNoExtras!620 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3583 (array!67315 array!67313 (_ BitVec 32) (_ BitVec 32) V!38675 V!38675 (_ BitVec 32) Int) ListLongMap!13931)

(assert (=> b!1061690 (= lt!467703 (getCurrentListMapNoExtraKeys!3583 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061690 (= lt!467704 (getCurrentListMapNoExtraKeys!3583 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39403 () Bool)

(assert (=> mapIsEmpty!39403 mapRes!39403))

(assert (= (and start!93872 res!708962) b!1061688))

(assert (= (and b!1061688 res!708963) b!1061686))

(assert (= (and b!1061686 res!708961) b!1061689))

(assert (= (and b!1061689 res!708964) b!1061690))

(assert (= (and b!1061684 condMapEmpty!39403) mapIsEmpty!39403))

(assert (= (and b!1061684 (not condMapEmpty!39403)) mapNonEmpty!39403))

(get-info :version)

(assert (= (and mapNonEmpty!39403 ((_ is ValueCellFull!11874) mapValue!39403)) b!1061687))

(assert (= (and b!1061684 ((_ is ValueCellFull!11874) mapDefault!39403)) b!1061685))

(assert (= start!93872 b!1061684))

(declare-fun m!980499 () Bool)

(assert (=> mapNonEmpty!39403 m!980499))

(declare-fun m!980501 () Bool)

(assert (=> b!1061689 m!980501))

(declare-fun m!980503 () Bool)

(assert (=> b!1061686 m!980503))

(declare-fun m!980505 () Bool)

(assert (=> start!93872 m!980505))

(declare-fun m!980507 () Bool)

(assert (=> start!93872 m!980507))

(declare-fun m!980509 () Bool)

(assert (=> start!93872 m!980509))

(declare-fun m!980511 () Bool)

(assert (=> b!1061690 m!980511))

(declare-fun m!980513 () Bool)

(assert (=> b!1061690 m!980513))

(declare-fun m!980515 () Bool)

(assert (=> b!1061690 m!980515))

(check-sat (not b!1061689) (not mapNonEmpty!39403) (not b!1061686) tp_is_empty!25155 b_and!34059 (not b!1061690) (not b_next!21345) (not start!93872))
(check-sat b_and!34059 (not b_next!21345))
