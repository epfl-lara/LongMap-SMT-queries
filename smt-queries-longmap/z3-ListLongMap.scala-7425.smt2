; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94622 () Bool)

(assert start!94622)

(declare-fun b_free!21727 () Bool)

(declare-fun b_next!21727 () Bool)

(assert (=> start!94622 (= b_free!21727 (not b_next!21727))))

(declare-fun tp!76624 () Bool)

(declare-fun b_and!34521 () Bool)

(assert (=> start!94622 (= tp!76624 b_and!34521)))

(declare-fun b!1068616 () Bool)

(declare-fun res!712778 () Bool)

(declare-fun e!609579 () Bool)

(assert (=> b!1068616 (=> (not res!712778) (not e!609579))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39185 0))(
  ( (V!39186 (val!12819 Int)) )
))
(declare-datatypes ((ValueCell!12065 0))(
  ( (ValueCellFull!12065 (v!15429 V!39185)) (EmptyCell!12065) )
))
(declare-datatypes ((array!68101 0))(
  ( (array!68102 (arr!32745 (Array (_ BitVec 32) ValueCell!12065)) (size!33282 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68101)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68103 0))(
  ( (array!68104 (arr!32746 (Array (_ BitVec 32) (_ BitVec 64))) (size!33283 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68103)

(assert (=> b!1068616 (= res!712778 (and (= (size!33282 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33283 _keys!1163) (size!33282 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068618 () Bool)

(declare-fun e!609577 () Bool)

(declare-fun e!609578 () Bool)

(declare-fun mapRes!39997 () Bool)

(assert (=> b!1068618 (= e!609577 (and e!609578 mapRes!39997))))

(declare-fun condMapEmpty!39997 () Bool)

(declare-fun mapDefault!39997 () ValueCell!12065)

(assert (=> b!1068618 (= condMapEmpty!39997 (= (arr!32745 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12065)) mapDefault!39997)))))

(declare-fun mapNonEmpty!39997 () Bool)

(declare-fun tp!76625 () Bool)

(declare-fun e!609576 () Bool)

(assert (=> mapNonEmpty!39997 (= mapRes!39997 (and tp!76625 e!609576))))

(declare-fun mapValue!39997 () ValueCell!12065)

(declare-fun mapKey!39997 () (_ BitVec 32))

(declare-fun mapRest!39997 () (Array (_ BitVec 32) ValueCell!12065))

(assert (=> mapNonEmpty!39997 (= (arr!32745 _values!955) (store mapRest!39997 mapKey!39997 mapValue!39997))))

(declare-fun b!1068619 () Bool)

(declare-fun tp_is_empty!25537 () Bool)

(assert (=> b!1068619 (= e!609576 tp_is_empty!25537)))

(declare-fun b!1068620 () Bool)

(declare-fun res!712775 () Bool)

(assert (=> b!1068620 (=> (not res!712775) (not e!609579))))

(declare-datatypes ((List!22813 0))(
  ( (Nil!22810) (Cons!22809 (h!24027 (_ BitVec 64)) (t!32128 List!22813)) )
))
(declare-fun arrayNoDuplicates!0 (array!68103 (_ BitVec 32) List!22813) Bool)

(assert (=> b!1068620 (= res!712775 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22810))))

(declare-fun b!1068621 () Bool)

(declare-fun res!712776 () Bool)

(assert (=> b!1068621 (=> (not res!712776) (not e!609579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68103 (_ BitVec 32)) Bool)

(assert (=> b!1068621 (= res!712776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39997 () Bool)

(assert (=> mapIsEmpty!39997 mapRes!39997))

(declare-fun b!1068622 () Bool)

(assert (=> b!1068622 (= e!609578 tp_is_empty!25537)))

(declare-fun b!1068617 () Bool)

(assert (=> b!1068617 (= e!609579 (not true))))

(declare-datatypes ((tuple2!16242 0))(
  ( (tuple2!16243 (_1!8132 (_ BitVec 64)) (_2!8132 V!39185)) )
))
(declare-datatypes ((List!22814 0))(
  ( (Nil!22811) (Cons!22810 (h!24028 tuple2!16242) (t!32129 List!22814)) )
))
(declare-datatypes ((ListLongMap!14219 0))(
  ( (ListLongMap!14220 (toList!7125 List!22814)) )
))
(declare-fun lt!471897 () ListLongMap!14219)

(declare-fun lt!471899 () ListLongMap!14219)

(assert (=> b!1068617 (= lt!471897 lt!471899)))

(declare-fun minValue!907 () V!39185)

(declare-fun zeroValueBefore!47 () V!39185)

(declare-datatypes ((Unit!35048 0))(
  ( (Unit!35049) )
))
(declare-fun lt!471898 () Unit!35048)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39185)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!747 (array!68103 array!68101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39185 V!39185 V!39185 V!39185 (_ BitVec 32) Int) Unit!35048)

(assert (=> b!1068617 (= lt!471898 (lemmaNoChangeToArrayThenSameMapNoExtras!747 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3744 (array!68103 array!68101 (_ BitVec 32) (_ BitVec 32) V!39185 V!39185 (_ BitVec 32) Int) ListLongMap!14219)

(assert (=> b!1068617 (= lt!471899 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068617 (= lt!471897 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!712777 () Bool)

(assert (=> start!94622 (=> (not res!712777) (not e!609579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94622 (= res!712777 (validMask!0 mask!1515))))

(assert (=> start!94622 e!609579))

(assert (=> start!94622 true))

(assert (=> start!94622 tp_is_empty!25537))

(declare-fun array_inv!25372 (array!68101) Bool)

(assert (=> start!94622 (and (array_inv!25372 _values!955) e!609577)))

(assert (=> start!94622 tp!76624))

(declare-fun array_inv!25373 (array!68103) Bool)

(assert (=> start!94622 (array_inv!25373 _keys!1163)))

(assert (= (and start!94622 res!712777) b!1068616))

(assert (= (and b!1068616 res!712778) b!1068621))

(assert (= (and b!1068621 res!712776) b!1068620))

(assert (= (and b!1068620 res!712775) b!1068617))

(assert (= (and b!1068618 condMapEmpty!39997) mapIsEmpty!39997))

(assert (= (and b!1068618 (not condMapEmpty!39997)) mapNonEmpty!39997))

(get-info :version)

(assert (= (and mapNonEmpty!39997 ((_ is ValueCellFull!12065) mapValue!39997)) b!1068619))

(assert (= (and b!1068618 ((_ is ValueCellFull!12065) mapDefault!39997)) b!1068622))

(assert (= start!94622 b!1068618))

(declare-fun m!987643 () Bool)

(assert (=> b!1068617 m!987643))

(declare-fun m!987645 () Bool)

(assert (=> b!1068617 m!987645))

(declare-fun m!987647 () Bool)

(assert (=> b!1068617 m!987647))

(declare-fun m!987649 () Bool)

(assert (=> start!94622 m!987649))

(declare-fun m!987651 () Bool)

(assert (=> start!94622 m!987651))

(declare-fun m!987653 () Bool)

(assert (=> start!94622 m!987653))

(declare-fun m!987655 () Bool)

(assert (=> mapNonEmpty!39997 m!987655))

(declare-fun m!987657 () Bool)

(assert (=> b!1068621 m!987657))

(declare-fun m!987659 () Bool)

(assert (=> b!1068620 m!987659))

(check-sat tp_is_empty!25537 (not b!1068617) (not mapNonEmpty!39997) (not b!1068620) (not start!94622) (not b!1068621) b_and!34521 (not b_next!21727))
(check-sat b_and!34521 (not b_next!21727))
