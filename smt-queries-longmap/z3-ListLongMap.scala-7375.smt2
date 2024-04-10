; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93992 () Bool)

(assert start!93992)

(declare-fun b_free!21429 () Bool)

(declare-fun b_next!21429 () Bool)

(assert (=> start!93992 (= b_free!21429 (not b_next!21429))))

(declare-fun tp!75715 () Bool)

(declare-fun b_and!34161 () Bool)

(assert (=> start!93992 (= tp!75715 b_and!34161)))

(declare-fun mapIsEmpty!39535 () Bool)

(declare-fun mapRes!39535 () Bool)

(assert (=> mapIsEmpty!39535 mapRes!39535))

(declare-fun b!1063025 () Bool)

(declare-fun e!605624 () Bool)

(declare-fun e!605626 () Bool)

(assert (=> b!1063025 (= e!605624 (not e!605626))))

(declare-fun res!709778 () Bool)

(assert (=> b!1063025 (=> res!709778 e!605626)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063025 (= res!709778 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38787 0))(
  ( (V!38788 (val!12670 Int)) )
))
(declare-datatypes ((tuple2!16034 0))(
  ( (tuple2!16035 (_1!8028 (_ BitVec 64)) (_2!8028 V!38787)) )
))
(declare-datatypes ((List!22614 0))(
  ( (Nil!22611) (Cons!22610 (h!23819 tuple2!16034) (t!31927 List!22614)) )
))
(declare-datatypes ((ListLongMap!14003 0))(
  ( (ListLongMap!14004 (toList!7017 List!22614)) )
))
(declare-fun lt!468464 () ListLongMap!14003)

(declare-fun lt!468463 () ListLongMap!14003)

(assert (=> b!1063025 (= lt!468464 lt!468463)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38787)

(declare-datatypes ((ValueCell!11916 0))(
  ( (ValueCellFull!11916 (v!15281 V!38787)) (EmptyCell!11916) )
))
(declare-datatypes ((array!67479 0))(
  ( (array!67480 (arr!32445 (Array (_ BitVec 32) ValueCell!11916)) (size!32981 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67479)

(declare-fun minValue!907 () V!38787)

(declare-datatypes ((Unit!34834 0))(
  ( (Unit!34835) )
))
(declare-fun lt!468465 () Unit!34834)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38787)

(declare-datatypes ((array!67481 0))(
  ( (array!67482 (arr!32446 (Array (_ BitVec 32) (_ BitVec 64))) (size!32982 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67481)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!647 (array!67481 array!67479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38787 V!38787 V!38787 V!38787 (_ BitVec 32) Int) Unit!34834)

(assert (=> b!1063025 (= lt!468465 (lemmaNoChangeToArrayThenSameMapNoExtras!647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3610 (array!67481 array!67479 (_ BitVec 32) (_ BitVec 32) V!38787 V!38787 (_ BitVec 32) Int) ListLongMap!14003)

(assert (=> b!1063025 (= lt!468463 (getCurrentListMapNoExtraKeys!3610 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063025 (= lt!468464 (getCurrentListMapNoExtraKeys!3610 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063026 () Bool)

(declare-fun e!605621 () Bool)

(declare-fun tp_is_empty!25239 () Bool)

(assert (=> b!1063026 (= e!605621 tp_is_empty!25239)))

(declare-fun b!1063027 () Bool)

(declare-fun e!605622 () Bool)

(assert (=> b!1063027 (= e!605622 true)))

(declare-fun lt!468461 () ListLongMap!14003)

(declare-fun -!580 (ListLongMap!14003 (_ BitVec 64)) ListLongMap!14003)

(assert (=> b!1063027 (= (-!580 lt!468461 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468461)))

(declare-fun lt!468462 () Unit!34834)

(declare-fun removeNotPresentStillSame!27 (ListLongMap!14003 (_ BitVec 64)) Unit!34834)

(assert (=> b!1063027 (= lt!468462 (removeNotPresentStillSame!27 lt!468461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063028 () Bool)

(assert (=> b!1063028 (= e!605626 e!605622)))

(declare-fun res!709774 () Bool)

(assert (=> b!1063028 (=> res!709774 e!605622)))

(declare-fun contains!6248 (ListLongMap!14003 (_ BitVec 64)) Bool)

(assert (=> b!1063028 (= res!709774 (contains!6248 lt!468461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4000 (array!67481 array!67479 (_ BitVec 32) (_ BitVec 32) V!38787 V!38787 (_ BitVec 32) Int) ListLongMap!14003)

(assert (=> b!1063028 (= lt!468461 (getCurrentListMap!4000 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39535 () Bool)

(declare-fun tp!75716 () Bool)

(declare-fun e!605627 () Bool)

(assert (=> mapNonEmpty!39535 (= mapRes!39535 (and tp!75716 e!605627))))

(declare-fun mapValue!39535 () ValueCell!11916)

(declare-fun mapRest!39535 () (Array (_ BitVec 32) ValueCell!11916))

(declare-fun mapKey!39535 () (_ BitVec 32))

(assert (=> mapNonEmpty!39535 (= (arr!32445 _values!955) (store mapRest!39535 mapKey!39535 mapValue!39535))))

(declare-fun b!1063030 () Bool)

(assert (=> b!1063030 (= e!605627 tp_is_empty!25239)))

(declare-fun b!1063031 () Bool)

(declare-fun e!605623 () Bool)

(assert (=> b!1063031 (= e!605623 (and e!605621 mapRes!39535))))

(declare-fun condMapEmpty!39535 () Bool)

(declare-fun mapDefault!39535 () ValueCell!11916)

(assert (=> b!1063031 (= condMapEmpty!39535 (= (arr!32445 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11916)) mapDefault!39535)))))

(declare-fun b!1063032 () Bool)

(declare-fun res!709777 () Bool)

(assert (=> b!1063032 (=> (not res!709777) (not e!605624))))

(declare-datatypes ((List!22615 0))(
  ( (Nil!22612) (Cons!22611 (h!23820 (_ BitVec 64)) (t!31928 List!22615)) )
))
(declare-fun arrayNoDuplicates!0 (array!67481 (_ BitVec 32) List!22615) Bool)

(assert (=> b!1063032 (= res!709777 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22612))))

(declare-fun b!1063033 () Bool)

(declare-fun res!709779 () Bool)

(assert (=> b!1063033 (=> (not res!709779) (not e!605624))))

(assert (=> b!1063033 (= res!709779 (and (= (size!32981 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32982 _keys!1163) (size!32981 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063029 () Bool)

(declare-fun res!709776 () Bool)

(assert (=> b!1063029 (=> (not res!709776) (not e!605624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67481 (_ BitVec 32)) Bool)

(assert (=> b!1063029 (= res!709776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!709775 () Bool)

(assert (=> start!93992 (=> (not res!709775) (not e!605624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93992 (= res!709775 (validMask!0 mask!1515))))

(assert (=> start!93992 e!605624))

(assert (=> start!93992 true))

(assert (=> start!93992 tp_is_empty!25239))

(declare-fun array_inv!25134 (array!67479) Bool)

(assert (=> start!93992 (and (array_inv!25134 _values!955) e!605623)))

(assert (=> start!93992 tp!75715))

(declare-fun array_inv!25135 (array!67481) Bool)

(assert (=> start!93992 (array_inv!25135 _keys!1163)))

(assert (= (and start!93992 res!709775) b!1063033))

(assert (= (and b!1063033 res!709779) b!1063029))

(assert (= (and b!1063029 res!709776) b!1063032))

(assert (= (and b!1063032 res!709777) b!1063025))

(assert (= (and b!1063025 (not res!709778)) b!1063028))

(assert (= (and b!1063028 (not res!709774)) b!1063027))

(assert (= (and b!1063031 condMapEmpty!39535) mapIsEmpty!39535))

(assert (= (and b!1063031 (not condMapEmpty!39535)) mapNonEmpty!39535))

(get-info :version)

(assert (= (and mapNonEmpty!39535 ((_ is ValueCellFull!11916) mapValue!39535)) b!1063030))

(assert (= (and b!1063031 ((_ is ValueCellFull!11916) mapDefault!39535)) b!1063026))

(assert (= start!93992 b!1063031))

(declare-fun m!981731 () Bool)

(assert (=> b!1063027 m!981731))

(declare-fun m!981733 () Bool)

(assert (=> b!1063027 m!981733))

(declare-fun m!981735 () Bool)

(assert (=> b!1063028 m!981735))

(declare-fun m!981737 () Bool)

(assert (=> b!1063028 m!981737))

(declare-fun m!981739 () Bool)

(assert (=> b!1063025 m!981739))

(declare-fun m!981741 () Bool)

(assert (=> b!1063025 m!981741))

(declare-fun m!981743 () Bool)

(assert (=> b!1063025 m!981743))

(declare-fun m!981745 () Bool)

(assert (=> start!93992 m!981745))

(declare-fun m!981747 () Bool)

(assert (=> start!93992 m!981747))

(declare-fun m!981749 () Bool)

(assert (=> start!93992 m!981749))

(declare-fun m!981751 () Bool)

(assert (=> mapNonEmpty!39535 m!981751))

(declare-fun m!981753 () Bool)

(assert (=> b!1063032 m!981753))

(declare-fun m!981755 () Bool)

(assert (=> b!1063029 m!981755))

(check-sat (not b!1063032) b_and!34161 (not b!1063027) (not mapNonEmpty!39535) (not b_next!21429) (not b!1063029) (not b!1063025) (not b!1063028) tp_is_empty!25239 (not start!93992))
(check-sat b_and!34161 (not b_next!21429))
