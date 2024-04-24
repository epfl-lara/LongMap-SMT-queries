; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94818 () Bool)

(assert start!94818)

(declare-fun b_free!21865 () Bool)

(declare-fun b_next!21865 () Bool)

(assert (=> start!94818 (= b_free!21865 (not b_next!21865))))

(declare-fun tp!77048 () Bool)

(declare-fun b_and!34687 () Bool)

(assert (=> start!94818 (= tp!77048 b_and!34687)))

(declare-fun b!1070797 () Bool)

(declare-fun e!611198 () Bool)

(assert (=> b!1070797 (= e!611198 (not true))))

(declare-datatypes ((V!39369 0))(
  ( (V!39370 (val!12888 Int)) )
))
(declare-datatypes ((tuple2!16354 0))(
  ( (tuple2!16355 (_1!8188 (_ BitVec 64)) (_2!8188 V!39369)) )
))
(declare-datatypes ((List!22919 0))(
  ( (Nil!22916) (Cons!22915 (h!24133 tuple2!16354) (t!32240 List!22919)) )
))
(declare-datatypes ((ListLongMap!14331 0))(
  ( (ListLongMap!14332 (toList!7181 List!22919)) )
))
(declare-fun lt!473141 () ListLongMap!14331)

(declare-fun lt!473140 () ListLongMap!14331)

(assert (=> b!1070797 (= lt!473141 lt!473140)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12134 0))(
  ( (ValueCellFull!12134 (v!15500 V!39369)) (EmptyCell!12134) )
))
(declare-datatypes ((array!68367 0))(
  ( (array!68368 (arr!32875 (Array (_ BitVec 32) ValueCell!12134)) (size!33412 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68367)

(declare-fun minValue!907 () V!39369)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!35156 0))(
  ( (Unit!35157) )
))
(declare-fun lt!473139 () Unit!35156)

(declare-fun zeroValueBefore!47 () V!39369)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39369)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68369 0))(
  ( (array!68370 (arr!32876 (Array (_ BitVec 32) (_ BitVec 64))) (size!33413 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68369)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!796 (array!68369 array!68367 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39369 V!39369 V!39369 V!39369 (_ BitVec 32) Int) Unit!35156)

(assert (=> b!1070797 (= lt!473139 (lemmaNoChangeToArrayThenSameMapNoExtras!796 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3793 (array!68369 array!68367 (_ BitVec 32) (_ BitVec 32) V!39369 V!39369 (_ BitVec 32) Int) ListLongMap!14331)

(assert (=> b!1070797 (= lt!473140 (getCurrentListMapNoExtraKeys!3793 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070797 (= lt!473141 (getCurrentListMapNoExtraKeys!3793 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070798 () Bool)

(declare-fun e!611200 () Bool)

(declare-fun tp_is_empty!25675 () Bool)

(assert (=> b!1070798 (= e!611200 tp_is_empty!25675)))

(declare-fun mapNonEmpty!40213 () Bool)

(declare-fun mapRes!40213 () Bool)

(declare-fun tp!77047 () Bool)

(assert (=> mapNonEmpty!40213 (= mapRes!40213 (and tp!77047 e!611200))))

(declare-fun mapKey!40213 () (_ BitVec 32))

(declare-fun mapValue!40213 () ValueCell!12134)

(declare-fun mapRest!40213 () (Array (_ BitVec 32) ValueCell!12134))

(assert (=> mapNonEmpty!40213 (= (arr!32875 _values!955) (store mapRest!40213 mapKey!40213 mapValue!40213))))

(declare-fun b!1070799 () Bool)

(declare-fun e!611199 () Bool)

(assert (=> b!1070799 (= e!611199 tp_is_empty!25675)))

(declare-fun b!1070800 () Bool)

(declare-fun e!611201 () Bool)

(assert (=> b!1070800 (= e!611201 (and e!611199 mapRes!40213))))

(declare-fun condMapEmpty!40213 () Bool)

(declare-fun mapDefault!40213 () ValueCell!12134)

(assert (=> b!1070800 (= condMapEmpty!40213 (= (arr!32875 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12134)) mapDefault!40213)))))

(declare-fun b!1070801 () Bool)

(declare-fun res!714091 () Bool)

(assert (=> b!1070801 (=> (not res!714091) (not e!611198))))

(assert (=> b!1070801 (= res!714091 (and (= (size!33412 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33413 _keys!1163) (size!33412 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070802 () Bool)

(declare-fun res!714089 () Bool)

(assert (=> b!1070802 (=> (not res!714089) (not e!611198))))

(declare-datatypes ((List!22920 0))(
  ( (Nil!22917) (Cons!22916 (h!24134 (_ BitVec 64)) (t!32241 List!22920)) )
))
(declare-fun arrayNoDuplicates!0 (array!68369 (_ BitVec 32) List!22920) Bool)

(assert (=> b!1070802 (= res!714089 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22917))))

(declare-fun mapIsEmpty!40213 () Bool)

(assert (=> mapIsEmpty!40213 mapRes!40213))

(declare-fun res!714090 () Bool)

(assert (=> start!94818 (=> (not res!714090) (not e!611198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94818 (= res!714090 (validMask!0 mask!1515))))

(assert (=> start!94818 e!611198))

(assert (=> start!94818 true))

(assert (=> start!94818 tp_is_empty!25675))

(declare-fun array_inv!25466 (array!68367) Bool)

(assert (=> start!94818 (and (array_inv!25466 _values!955) e!611201)))

(assert (=> start!94818 tp!77048))

(declare-fun array_inv!25467 (array!68369) Bool)

(assert (=> start!94818 (array_inv!25467 _keys!1163)))

(declare-fun b!1070803 () Bool)

(declare-fun res!714092 () Bool)

(assert (=> b!1070803 (=> (not res!714092) (not e!611198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68369 (_ BitVec 32)) Bool)

(assert (=> b!1070803 (= res!714092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94818 res!714090) b!1070801))

(assert (= (and b!1070801 res!714091) b!1070803))

(assert (= (and b!1070803 res!714092) b!1070802))

(assert (= (and b!1070802 res!714089) b!1070797))

(assert (= (and b!1070800 condMapEmpty!40213) mapIsEmpty!40213))

(assert (= (and b!1070800 (not condMapEmpty!40213)) mapNonEmpty!40213))

(get-info :version)

(assert (= (and mapNonEmpty!40213 ((_ is ValueCellFull!12134) mapValue!40213)) b!1070798))

(assert (= (and b!1070800 ((_ is ValueCellFull!12134) mapDefault!40213)) b!1070799))

(assert (= start!94818 b!1070800))

(declare-fun m!989647 () Bool)

(assert (=> b!1070797 m!989647))

(declare-fun m!989649 () Bool)

(assert (=> b!1070797 m!989649))

(declare-fun m!989651 () Bool)

(assert (=> b!1070797 m!989651))

(declare-fun m!989653 () Bool)

(assert (=> b!1070803 m!989653))

(declare-fun m!989655 () Bool)

(assert (=> b!1070802 m!989655))

(declare-fun m!989657 () Bool)

(assert (=> start!94818 m!989657))

(declare-fun m!989659 () Bool)

(assert (=> start!94818 m!989659))

(declare-fun m!989661 () Bool)

(assert (=> start!94818 m!989661))

(declare-fun m!989663 () Bool)

(assert (=> mapNonEmpty!40213 m!989663))

(check-sat (not b!1070803) tp_is_empty!25675 (not mapNonEmpty!40213) (not start!94818) (not b!1070797) (not b_next!21865) b_and!34687 (not b!1070802))
(check-sat b_and!34687 (not b_next!21865))
