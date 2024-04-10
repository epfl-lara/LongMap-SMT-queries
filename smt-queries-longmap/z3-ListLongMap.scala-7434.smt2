; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94456 () Bool)

(assert start!94456)

(declare-fun b_free!21783 () Bool)

(declare-fun b_next!21783 () Bool)

(assert (=> start!94456 (= b_free!21783 (not b_next!21783))))

(declare-fun tp!76795 () Bool)

(declare-fun b_and!34575 () Bool)

(assert (=> start!94456 (= tp!76795 b_and!34575)))

(declare-fun b!1068071 () Bool)

(declare-fun e!609310 () Bool)

(declare-fun e!609306 () Bool)

(assert (=> b!1068071 (= e!609310 (not e!609306))))

(declare-fun res!712732 () Bool)

(assert (=> b!1068071 (=> res!712732 e!609306)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068071 (= res!712732 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39259 0))(
  ( (V!39260 (val!12847 Int)) )
))
(declare-datatypes ((tuple2!16314 0))(
  ( (tuple2!16315 (_1!8168 (_ BitVec 64)) (_2!8168 V!39259)) )
))
(declare-datatypes ((List!22867 0))(
  ( (Nil!22864) (Cons!22863 (h!24072 tuple2!16314) (t!32192 List!22867)) )
))
(declare-datatypes ((ListLongMap!14283 0))(
  ( (ListLongMap!14284 (toList!7157 List!22867)) )
))
(declare-fun lt!471787 () ListLongMap!14283)

(declare-fun lt!471785 () ListLongMap!14283)

(assert (=> b!1068071 (= lt!471787 lt!471785)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12093 0))(
  ( (ValueCellFull!12093 (v!15461 V!39259)) (EmptyCell!12093) )
))
(declare-datatypes ((array!68169 0))(
  ( (array!68170 (arr!32784 (Array (_ BitVec 32) ValueCell!12093)) (size!33320 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68169)

(declare-fun minValue!907 () V!39259)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39259)

(declare-datatypes ((Unit!35111 0))(
  ( (Unit!35112) )
))
(declare-fun lt!471784 () Unit!35111)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39259)

(declare-datatypes ((array!68171 0))(
  ( (array!68172 (arr!32785 (Array (_ BitVec 32) (_ BitVec 64))) (size!33321 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68171)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!774 (array!68171 array!68169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39259 V!39259 V!39259 V!39259 (_ BitVec 32) Int) Unit!35111)

(assert (=> b!1068071 (= lt!471784 (lemmaNoChangeToArrayThenSameMapNoExtras!774 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3737 (array!68171 array!68169 (_ BitVec 32) (_ BitVec 32) V!39259 V!39259 (_ BitVec 32) Int) ListLongMap!14283)

(assert (=> b!1068071 (= lt!471785 (getCurrentListMapNoExtraKeys!3737 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068071 (= lt!471787 (getCurrentListMapNoExtraKeys!3737 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068072 () Bool)

(declare-fun e!609308 () Bool)

(assert (=> b!1068072 (= e!609308 true)))

(declare-fun lt!471786 () ListLongMap!14283)

(declare-fun -!641 (ListLongMap!14283 (_ BitVec 64)) ListLongMap!14283)

(assert (=> b!1068072 (= (-!641 lt!471786 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471786)))

(declare-fun lt!471783 () Unit!35111)

(declare-fun removeNotPresentStillSame!51 (ListLongMap!14283 (_ BitVec 64)) Unit!35111)

(assert (=> b!1068072 (= lt!471783 (removeNotPresentStillSame!51 lt!471786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!40084 () Bool)

(declare-fun mapRes!40084 () Bool)

(declare-fun tp!76796 () Bool)

(declare-fun e!609304 () Bool)

(assert (=> mapNonEmpty!40084 (= mapRes!40084 (and tp!76796 e!609304))))

(declare-fun mapRest!40084 () (Array (_ BitVec 32) ValueCell!12093))

(declare-fun mapValue!40084 () ValueCell!12093)

(declare-fun mapKey!40084 () (_ BitVec 32))

(assert (=> mapNonEmpty!40084 (= (arr!32784 _values!955) (store mapRest!40084 mapKey!40084 mapValue!40084))))

(declare-fun mapIsEmpty!40084 () Bool)

(assert (=> mapIsEmpty!40084 mapRes!40084))

(declare-fun b!1068074 () Bool)

(declare-fun e!609305 () Bool)

(declare-fun tp_is_empty!25593 () Bool)

(assert (=> b!1068074 (= e!609305 tp_is_empty!25593)))

(declare-fun b!1068075 () Bool)

(declare-fun e!609309 () Bool)

(assert (=> b!1068075 (= e!609309 (and e!609305 mapRes!40084))))

(declare-fun condMapEmpty!40084 () Bool)

(declare-fun mapDefault!40084 () ValueCell!12093)

(assert (=> b!1068075 (= condMapEmpty!40084 (= (arr!32784 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12093)) mapDefault!40084)))))

(declare-fun b!1068076 () Bool)

(declare-fun res!712731 () Bool)

(assert (=> b!1068076 (=> (not res!712731) (not e!609310))))

(declare-datatypes ((List!22868 0))(
  ( (Nil!22865) (Cons!22864 (h!24073 (_ BitVec 64)) (t!32193 List!22868)) )
))
(declare-fun arrayNoDuplicates!0 (array!68171 (_ BitVec 32) List!22868) Bool)

(assert (=> b!1068076 (= res!712731 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22865))))

(declare-fun b!1068073 () Bool)

(assert (=> b!1068073 (= e!609306 e!609308)))

(declare-fun res!712734 () Bool)

(assert (=> b!1068073 (=> res!712734 e!609308)))

(declare-fun contains!6290 (ListLongMap!14283 (_ BitVec 64)) Bool)

(assert (=> b!1068073 (= res!712734 (contains!6290 lt!471786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4087 (array!68171 array!68169 (_ BitVec 32) (_ BitVec 32) V!39259 V!39259 (_ BitVec 32) Int) ListLongMap!14283)

(assert (=> b!1068073 (= lt!471786 (getCurrentListMap!4087 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!712729 () Bool)

(assert (=> start!94456 (=> (not res!712729) (not e!609310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94456 (= res!712729 (validMask!0 mask!1515))))

(assert (=> start!94456 e!609310))

(assert (=> start!94456 true))

(assert (=> start!94456 tp_is_empty!25593))

(declare-fun array_inv!25380 (array!68169) Bool)

(assert (=> start!94456 (and (array_inv!25380 _values!955) e!609309)))

(assert (=> start!94456 tp!76795))

(declare-fun array_inv!25381 (array!68171) Bool)

(assert (=> start!94456 (array_inv!25381 _keys!1163)))

(declare-fun b!1068077 () Bool)

(declare-fun res!712733 () Bool)

(assert (=> b!1068077 (=> (not res!712733) (not e!609310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68171 (_ BitVec 32)) Bool)

(assert (=> b!1068077 (= res!712733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068078 () Bool)

(declare-fun res!712730 () Bool)

(assert (=> b!1068078 (=> (not res!712730) (not e!609310))))

(assert (=> b!1068078 (= res!712730 (and (= (size!33320 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33321 _keys!1163) (size!33320 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068079 () Bool)

(assert (=> b!1068079 (= e!609304 tp_is_empty!25593)))

(assert (= (and start!94456 res!712729) b!1068078))

(assert (= (and b!1068078 res!712730) b!1068077))

(assert (= (and b!1068077 res!712733) b!1068076))

(assert (= (and b!1068076 res!712731) b!1068071))

(assert (= (and b!1068071 (not res!712732)) b!1068073))

(assert (= (and b!1068073 (not res!712734)) b!1068072))

(assert (= (and b!1068075 condMapEmpty!40084) mapIsEmpty!40084))

(assert (= (and b!1068075 (not condMapEmpty!40084)) mapNonEmpty!40084))

(get-info :version)

(assert (= (and mapNonEmpty!40084 ((_ is ValueCellFull!12093) mapValue!40084)) b!1068079))

(assert (= (and b!1068075 ((_ is ValueCellFull!12093) mapDefault!40084)) b!1068074))

(assert (= start!94456 b!1068075))

(declare-fun m!986681 () Bool)

(assert (=> b!1068073 m!986681))

(declare-fun m!986683 () Bool)

(assert (=> b!1068073 m!986683))

(declare-fun m!986685 () Bool)

(assert (=> b!1068072 m!986685))

(declare-fun m!986687 () Bool)

(assert (=> b!1068072 m!986687))

(declare-fun m!986689 () Bool)

(assert (=> mapNonEmpty!40084 m!986689))

(declare-fun m!986691 () Bool)

(assert (=> start!94456 m!986691))

(declare-fun m!986693 () Bool)

(assert (=> start!94456 m!986693))

(declare-fun m!986695 () Bool)

(assert (=> start!94456 m!986695))

(declare-fun m!986697 () Bool)

(assert (=> b!1068071 m!986697))

(declare-fun m!986699 () Bool)

(assert (=> b!1068071 m!986699))

(declare-fun m!986701 () Bool)

(assert (=> b!1068071 m!986701))

(declare-fun m!986703 () Bool)

(assert (=> b!1068077 m!986703))

(declare-fun m!986705 () Bool)

(assert (=> b!1068076 m!986705))

(check-sat tp_is_empty!25593 (not b!1068073) (not b!1068071) (not b!1068077) (not mapNonEmpty!40084) (not b!1068072) (not b_next!21783) (not b!1068076) b_and!34575 (not start!94456))
(check-sat b_and!34575 (not b_next!21783))
