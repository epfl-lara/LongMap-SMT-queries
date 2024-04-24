; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94616 () Bool)

(assert start!94616)

(declare-fun b_free!21721 () Bool)

(declare-fun b_next!21721 () Bool)

(assert (=> start!94616 (= b_free!21721 (not b_next!21721))))

(declare-fun tp!76606 () Bool)

(declare-fun b_and!34515 () Bool)

(assert (=> start!94616 (= tp!76606 b_and!34515)))

(declare-fun mapNonEmpty!39988 () Bool)

(declare-fun mapRes!39988 () Bool)

(declare-fun tp!76607 () Bool)

(declare-fun e!609532 () Bool)

(assert (=> mapNonEmpty!39988 (= mapRes!39988 (and tp!76607 e!609532))))

(declare-fun mapKey!39988 () (_ BitVec 32))

(declare-datatypes ((V!39177 0))(
  ( (V!39178 (val!12816 Int)) )
))
(declare-datatypes ((ValueCell!12062 0))(
  ( (ValueCellFull!12062 (v!15426 V!39177)) (EmptyCell!12062) )
))
(declare-fun mapRest!39988 () (Array (_ BitVec 32) ValueCell!12062))

(declare-datatypes ((array!68091 0))(
  ( (array!68092 (arr!32740 (Array (_ BitVec 32) ValueCell!12062)) (size!33277 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68091)

(declare-fun mapValue!39988 () ValueCell!12062)

(assert (=> mapNonEmpty!39988 (= (arr!32740 _values!955) (store mapRest!39988 mapKey!39988 mapValue!39988))))

(declare-fun b!1068553 () Bool)

(declare-fun e!609531 () Bool)

(declare-fun e!609534 () Bool)

(assert (=> b!1068553 (= e!609531 (and e!609534 mapRes!39988))))

(declare-fun condMapEmpty!39988 () Bool)

(declare-fun mapDefault!39988 () ValueCell!12062)

(assert (=> b!1068553 (= condMapEmpty!39988 (= (arr!32740 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12062)) mapDefault!39988)))))

(declare-fun b!1068554 () Bool)

(declare-fun res!712739 () Bool)

(declare-fun e!609530 () Bool)

(assert (=> b!1068554 (=> (not res!712739) (not e!609530))))

(declare-datatypes ((array!68093 0))(
  ( (array!68094 (arr!32741 (Array (_ BitVec 32) (_ BitVec 64))) (size!33278 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68093)

(declare-datatypes ((List!22810 0))(
  ( (Nil!22807) (Cons!22806 (h!24024 (_ BitVec 64)) (t!32125 List!22810)) )
))
(declare-fun arrayNoDuplicates!0 (array!68093 (_ BitVec 32) List!22810) Bool)

(assert (=> b!1068554 (= res!712739 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22807))))

(declare-fun b!1068555 () Bool)

(declare-fun tp_is_empty!25531 () Bool)

(assert (=> b!1068555 (= e!609532 tp_is_empty!25531)))

(declare-fun mapIsEmpty!39988 () Bool)

(assert (=> mapIsEmpty!39988 mapRes!39988))

(declare-fun res!712740 () Bool)

(assert (=> start!94616 (=> (not res!712740) (not e!609530))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94616 (= res!712740 (validMask!0 mask!1515))))

(assert (=> start!94616 e!609530))

(assert (=> start!94616 true))

(assert (=> start!94616 tp_is_empty!25531))

(declare-fun array_inv!25368 (array!68091) Bool)

(assert (=> start!94616 (and (array_inv!25368 _values!955) e!609531)))

(assert (=> start!94616 tp!76606))

(declare-fun array_inv!25369 (array!68093) Bool)

(assert (=> start!94616 (array_inv!25369 _keys!1163)))

(declare-fun b!1068556 () Bool)

(declare-fun res!712742 () Bool)

(assert (=> b!1068556 (=> (not res!712742) (not e!609530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68093 (_ BitVec 32)) Bool)

(assert (=> b!1068556 (= res!712742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068557 () Bool)

(declare-fun res!712741 () Bool)

(assert (=> b!1068557 (=> (not res!712741) (not e!609530))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068557 (= res!712741 (and (= (size!33277 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33278 _keys!1163) (size!33277 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068558 () Bool)

(assert (=> b!1068558 (= e!609530 (not true))))

(declare-datatypes ((tuple2!16240 0))(
  ( (tuple2!16241 (_1!8131 (_ BitVec 64)) (_2!8131 V!39177)) )
))
(declare-datatypes ((List!22811 0))(
  ( (Nil!22808) (Cons!22807 (h!24025 tuple2!16240) (t!32126 List!22811)) )
))
(declare-datatypes ((ListLongMap!14217 0))(
  ( (ListLongMap!14218 (toList!7124 List!22811)) )
))
(declare-fun lt!471870 () ListLongMap!14217)

(declare-fun lt!471872 () ListLongMap!14217)

(assert (=> b!1068558 (= lt!471870 lt!471872)))

(declare-datatypes ((Unit!35046 0))(
  ( (Unit!35047) )
))
(declare-fun lt!471871 () Unit!35046)

(declare-fun zeroValueBefore!47 () V!39177)

(declare-fun minValue!907 () V!39177)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39177)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!746 (array!68093 array!68091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39177 V!39177 V!39177 V!39177 (_ BitVec 32) Int) Unit!35046)

(assert (=> b!1068558 (= lt!471871 (lemmaNoChangeToArrayThenSameMapNoExtras!746 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3743 (array!68093 array!68091 (_ BitVec 32) (_ BitVec 32) V!39177 V!39177 (_ BitVec 32) Int) ListLongMap!14217)

(assert (=> b!1068558 (= lt!471872 (getCurrentListMapNoExtraKeys!3743 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068558 (= lt!471870 (getCurrentListMapNoExtraKeys!3743 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068559 () Bool)

(assert (=> b!1068559 (= e!609534 tp_is_empty!25531)))

(assert (= (and start!94616 res!712740) b!1068557))

(assert (= (and b!1068557 res!712741) b!1068556))

(assert (= (and b!1068556 res!712742) b!1068554))

(assert (= (and b!1068554 res!712739) b!1068558))

(assert (= (and b!1068553 condMapEmpty!39988) mapIsEmpty!39988))

(assert (= (and b!1068553 (not condMapEmpty!39988)) mapNonEmpty!39988))

(get-info :version)

(assert (= (and mapNonEmpty!39988 ((_ is ValueCellFull!12062) mapValue!39988)) b!1068555))

(assert (= (and b!1068553 ((_ is ValueCellFull!12062) mapDefault!39988)) b!1068559))

(assert (= start!94616 b!1068553))

(declare-fun m!987589 () Bool)

(assert (=> mapNonEmpty!39988 m!987589))

(declare-fun m!987591 () Bool)

(assert (=> start!94616 m!987591))

(declare-fun m!987593 () Bool)

(assert (=> start!94616 m!987593))

(declare-fun m!987595 () Bool)

(assert (=> start!94616 m!987595))

(declare-fun m!987597 () Bool)

(assert (=> b!1068556 m!987597))

(declare-fun m!987599 () Bool)

(assert (=> b!1068554 m!987599))

(declare-fun m!987601 () Bool)

(assert (=> b!1068558 m!987601))

(declare-fun m!987603 () Bool)

(assert (=> b!1068558 m!987603))

(declare-fun m!987605 () Bool)

(assert (=> b!1068558 m!987605))

(check-sat b_and!34515 (not b_next!21721) tp_is_empty!25531 (not mapNonEmpty!39988) (not b!1068554) (not b!1068558) (not b!1068556) (not start!94616))
(check-sat b_and!34515 (not b_next!21721))
