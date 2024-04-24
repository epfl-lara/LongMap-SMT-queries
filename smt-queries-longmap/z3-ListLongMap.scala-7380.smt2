; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94256 () Bool)

(assert start!94256)

(declare-fun b_free!21457 () Bool)

(declare-fun b_next!21457 () Bool)

(assert (=> start!94256 (= b_free!21457 (not b_next!21457))))

(declare-fun tp!75799 () Bool)

(declare-fun b_and!34199 () Bool)

(assert (=> start!94256 (= tp!75799 b_and!34199)))

(declare-fun b!1064730 () Bool)

(declare-fun e!606772 () Bool)

(declare-fun tp_is_empty!25267 () Bool)

(assert (=> b!1064730 (= e!606772 tp_is_empty!25267)))

(declare-fun b!1064731 () Bool)

(declare-fun res!710553 () Bool)

(declare-fun e!606774 () Bool)

(assert (=> b!1064731 (=> (not res!710553) (not e!606774))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((V!38825 0))(
  ( (V!38826 (val!12684 Int)) )
))
(declare-datatypes ((ValueCell!11930 0))(
  ( (ValueCellFull!11930 (v!15291 V!38825)) (EmptyCell!11930) )
))
(declare-datatypes ((array!67577 0))(
  ( (array!67578 (arr!32488 (Array (_ BitVec 32) ValueCell!11930)) (size!33025 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67577)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67579 0))(
  ( (array!67580 (arr!32489 (Array (_ BitVec 32) (_ BitVec 64))) (size!33026 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67579)

(assert (=> b!1064731 (= res!710553 (and (= (size!33025 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33026 _keys!1163) (size!33025 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064732 () Bool)

(declare-fun res!710552 () Bool)

(assert (=> b!1064732 (=> (not res!710552) (not e!606774))))

(declare-datatypes ((List!22619 0))(
  ( (Nil!22616) (Cons!22615 (h!23833 (_ BitVec 64)) (t!31924 List!22619)) )
))
(declare-fun arrayNoDuplicates!0 (array!67579 (_ BitVec 32) List!22619) Bool)

(assert (=> b!1064732 (= res!710552 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22616))))

(declare-fun b!1064733 () Bool)

(declare-fun e!606771 () Bool)

(declare-fun mapRes!39577 () Bool)

(assert (=> b!1064733 (= e!606771 (and e!606772 mapRes!39577))))

(declare-fun condMapEmpty!39577 () Bool)

(declare-fun mapDefault!39577 () ValueCell!11930)

(assert (=> b!1064733 (= condMapEmpty!39577 (= (arr!32488 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11930)) mapDefault!39577)))))

(declare-fun mapNonEmpty!39577 () Bool)

(declare-fun tp!75800 () Bool)

(declare-fun e!606770 () Bool)

(assert (=> mapNonEmpty!39577 (= mapRes!39577 (and tp!75800 e!606770))))

(declare-fun mapRest!39577 () (Array (_ BitVec 32) ValueCell!11930))

(declare-fun mapValue!39577 () ValueCell!11930)

(declare-fun mapKey!39577 () (_ BitVec 32))

(assert (=> mapNonEmpty!39577 (= (arr!32488 _values!955) (store mapRest!39577 mapKey!39577 mapValue!39577))))

(declare-fun b!1064734 () Bool)

(declare-fun e!606773 () Bool)

(declare-fun e!606776 () Bool)

(assert (=> b!1064734 (= e!606773 e!606776)))

(declare-fun res!710548 () Bool)

(assert (=> b!1064734 (=> res!710548 e!606776)))

(declare-datatypes ((tuple2!16046 0))(
  ( (tuple2!16047 (_1!8034 (_ BitVec 64)) (_2!8034 V!38825)) )
))
(declare-datatypes ((List!22620 0))(
  ( (Nil!22617) (Cons!22616 (h!23834 tuple2!16046) (t!31925 List!22620)) )
))
(declare-datatypes ((ListLongMap!14023 0))(
  ( (ListLongMap!14024 (toList!7027 List!22620)) )
))
(declare-fun lt!469188 () ListLongMap!14023)

(declare-fun contains!6277 (ListLongMap!14023 (_ BitVec 64)) Bool)

(assert (=> b!1064734 (= res!710548 (contains!6277 lt!469188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38825)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38825)

(declare-fun getCurrentListMap!4002 (array!67579 array!67577 (_ BitVec 32) (_ BitVec 32) V!38825 V!38825 (_ BitVec 32) Int) ListLongMap!14023)

(assert (=> b!1064734 (= lt!469188 (getCurrentListMap!4002 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39577 () Bool)

(assert (=> mapIsEmpty!39577 mapRes!39577))

(declare-fun res!710549 () Bool)

(assert (=> start!94256 (=> (not res!710549) (not e!606774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94256 (= res!710549 (validMask!0 mask!1515))))

(assert (=> start!94256 e!606774))

(assert (=> start!94256 true))

(assert (=> start!94256 tp_is_empty!25267))

(declare-fun array_inv!25184 (array!67577) Bool)

(assert (=> start!94256 (and (array_inv!25184 _values!955) e!606771)))

(assert (=> start!94256 tp!75799))

(declare-fun array_inv!25185 (array!67579) Bool)

(assert (=> start!94256 (array_inv!25185 _keys!1163)))

(declare-fun b!1064735 () Bool)

(assert (=> b!1064735 (= e!606776 true)))

(declare-fun -!586 (ListLongMap!14023 (_ BitVec 64)) ListLongMap!14023)

(assert (=> b!1064735 (= (-!586 lt!469188 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469188)))

(declare-datatypes ((Unit!34855 0))(
  ( (Unit!34856) )
))
(declare-fun lt!469190 () Unit!34855)

(declare-fun removeNotPresentStillSame!37 (ListLongMap!14023 (_ BitVec 64)) Unit!34855)

(assert (=> b!1064735 (= lt!469190 (removeNotPresentStillSame!37 lt!469188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064736 () Bool)

(assert (=> b!1064736 (= e!606774 (not e!606773))))

(declare-fun res!710551 () Bool)

(assert (=> b!1064736 (=> res!710551 e!606773)))

(assert (=> b!1064736 (= res!710551 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!469189 () ListLongMap!14023)

(declare-fun lt!469186 () ListLongMap!14023)

(assert (=> b!1064736 (= lt!469189 lt!469186)))

(declare-fun lt!469187 () Unit!34855)

(declare-fun zeroValueAfter!47 () V!38825)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!666 (array!67579 array!67577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38825 V!38825 V!38825 V!38825 (_ BitVec 32) Int) Unit!34855)

(assert (=> b!1064736 (= lt!469187 (lemmaNoChangeToArrayThenSameMapNoExtras!666 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3663 (array!67579 array!67577 (_ BitVec 32) (_ BitVec 32) V!38825 V!38825 (_ BitVec 32) Int) ListLongMap!14023)

(assert (=> b!1064736 (= lt!469186 (getCurrentListMapNoExtraKeys!3663 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064736 (= lt!469189 (getCurrentListMapNoExtraKeys!3663 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064737 () Bool)

(assert (=> b!1064737 (= e!606770 tp_is_empty!25267)))

(declare-fun b!1064738 () Bool)

(declare-fun res!710550 () Bool)

(assert (=> b!1064738 (=> (not res!710550) (not e!606774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67579 (_ BitVec 32)) Bool)

(assert (=> b!1064738 (= res!710550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94256 res!710549) b!1064731))

(assert (= (and b!1064731 res!710553) b!1064738))

(assert (= (and b!1064738 res!710550) b!1064732))

(assert (= (and b!1064732 res!710552) b!1064736))

(assert (= (and b!1064736 (not res!710551)) b!1064734))

(assert (= (and b!1064734 (not res!710548)) b!1064735))

(assert (= (and b!1064733 condMapEmpty!39577) mapIsEmpty!39577))

(assert (= (and b!1064733 (not condMapEmpty!39577)) mapNonEmpty!39577))

(get-info :version)

(assert (= (and mapNonEmpty!39577 ((_ is ValueCellFull!11930) mapValue!39577)) b!1064737))

(assert (= (and b!1064733 ((_ is ValueCellFull!11930) mapDefault!39577)) b!1064730))

(assert (= start!94256 b!1064733))

(declare-fun m!983767 () Bool)

(assert (=> b!1064732 m!983767))

(declare-fun m!983769 () Bool)

(assert (=> mapNonEmpty!39577 m!983769))

(declare-fun m!983771 () Bool)

(assert (=> start!94256 m!983771))

(declare-fun m!983773 () Bool)

(assert (=> start!94256 m!983773))

(declare-fun m!983775 () Bool)

(assert (=> start!94256 m!983775))

(declare-fun m!983777 () Bool)

(assert (=> b!1064734 m!983777))

(declare-fun m!983779 () Bool)

(assert (=> b!1064734 m!983779))

(declare-fun m!983781 () Bool)

(assert (=> b!1064736 m!983781))

(declare-fun m!983783 () Bool)

(assert (=> b!1064736 m!983783))

(declare-fun m!983785 () Bool)

(assert (=> b!1064736 m!983785))

(declare-fun m!983787 () Bool)

(assert (=> b!1064735 m!983787))

(declare-fun m!983789 () Bool)

(assert (=> b!1064735 m!983789))

(declare-fun m!983791 () Bool)

(assert (=> b!1064738 m!983791))

(check-sat (not b_next!21457) (not b!1064732) (not b!1064734) b_and!34199 (not b!1064738) (not mapNonEmpty!39577) tp_is_empty!25267 (not b!1064736) (not start!94256) (not b!1064735))
(check-sat b_and!34199 (not b_next!21457))
