; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94924 () Bool)

(assert start!94924)

(declare-fun b_free!22135 () Bool)

(declare-fun b_next!22135 () Bool)

(assert (=> start!94924 (= b_free!22135 (not b_next!22135))))

(declare-fun tp!77869 () Bool)

(declare-fun b_and!34963 () Bool)

(assert (=> start!94924 (= tp!77869 b_and!34963)))

(declare-fun b!1073210 () Bool)

(declare-fun e!613114 () Bool)

(declare-fun e!613111 () Bool)

(declare-fun mapRes!40630 () Bool)

(assert (=> b!1073210 (= e!613114 (and e!613111 mapRes!40630))))

(declare-fun condMapEmpty!40630 () Bool)

(declare-datatypes ((V!39729 0))(
  ( (V!39730 (val!13023 Int)) )
))
(declare-datatypes ((ValueCell!12269 0))(
  ( (ValueCellFull!12269 (v!15640 V!39729)) (EmptyCell!12269) )
))
(declare-datatypes ((array!68792 0))(
  ( (array!68793 (arr!33090 (Array (_ BitVec 32) ValueCell!12269)) (size!33628 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68792)

(declare-fun mapDefault!40630 () ValueCell!12269)

(assert (=> b!1073210 (= condMapEmpty!40630 (= (arr!33090 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12269)) mapDefault!40630)))))

(declare-fun res!715830 () Bool)

(declare-fun e!613115 () Bool)

(assert (=> start!94924 (=> (not res!715830) (not e!613115))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94924 (= res!715830 (validMask!0 mask!1515))))

(assert (=> start!94924 e!613115))

(assert (=> start!94924 true))

(declare-fun tp_is_empty!25945 () Bool)

(assert (=> start!94924 tp_is_empty!25945))

(declare-fun array_inv!25604 (array!68792) Bool)

(assert (=> start!94924 (and (array_inv!25604 _values!955) e!613114)))

(assert (=> start!94924 tp!77869))

(declare-datatypes ((array!68794 0))(
  ( (array!68795 (arr!33091 (Array (_ BitVec 32) (_ BitVec 64))) (size!33629 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68794)

(declare-fun array_inv!25605 (array!68794) Bool)

(assert (=> start!94924 (array_inv!25605 _keys!1163)))

(declare-fun mapNonEmpty!40630 () Bool)

(declare-fun tp!77870 () Bool)

(declare-fun e!613113 () Bool)

(assert (=> mapNonEmpty!40630 (= mapRes!40630 (and tp!77870 e!613113))))

(declare-fun mapValue!40630 () ValueCell!12269)

(declare-fun mapRest!40630 () (Array (_ BitVec 32) ValueCell!12269))

(declare-fun mapKey!40630 () (_ BitVec 32))

(assert (=> mapNonEmpty!40630 (= (arr!33090 _values!955) (store mapRest!40630 mapKey!40630 mapValue!40630))))

(declare-fun b!1073211 () Bool)

(assert (=> b!1073211 (= e!613111 tp_is_empty!25945)))

(declare-fun b!1073212 () Bool)

(assert (=> b!1073212 (= e!613113 tp_is_empty!25945)))

(declare-fun b!1073213 () Bool)

(declare-fun res!715828 () Bool)

(assert (=> b!1073213 (=> (not res!715828) (not e!613115))))

(declare-datatypes ((List!23175 0))(
  ( (Nil!23172) (Cons!23171 (h!24380 (_ BitVec 64)) (t!32503 List!23175)) )
))
(declare-fun arrayNoDuplicates!0 (array!68794 (_ BitVec 32) List!23175) Bool)

(assert (=> b!1073213 (= res!715828 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23172))))

(declare-fun b!1073214 () Bool)

(assert (=> b!1073214 (= e!613115 false)))

(declare-datatypes ((tuple2!16650 0))(
  ( (tuple2!16651 (_1!8336 (_ BitVec 64)) (_2!8336 V!39729)) )
))
(declare-datatypes ((List!23176 0))(
  ( (Nil!23173) (Cons!23172 (h!24381 tuple2!16650) (t!32504 List!23176)) )
))
(declare-datatypes ((ListLongMap!14619 0))(
  ( (ListLongMap!14620 (toList!7325 List!23176)) )
))
(declare-fun lt!475826 () ListLongMap!14619)

(declare-fun minValue!907 () V!39729)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39729)

(declare-fun getCurrentListMapNoExtraKeys!3905 (array!68794 array!68792 (_ BitVec 32) (_ BitVec 32) V!39729 V!39729 (_ BitVec 32) Int) ListLongMap!14619)

(assert (=> b!1073214 (= lt!475826 (getCurrentListMapNoExtraKeys!3905 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39729)

(declare-fun lt!475825 () ListLongMap!14619)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073214 (= lt!475825 (getCurrentListMapNoExtraKeys!3905 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073215 () Bool)

(declare-fun res!715829 () Bool)

(assert (=> b!1073215 (=> (not res!715829) (not e!613115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68794 (_ BitVec 32)) Bool)

(assert (=> b!1073215 (= res!715829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40630 () Bool)

(assert (=> mapIsEmpty!40630 mapRes!40630))

(declare-fun b!1073216 () Bool)

(declare-fun res!715831 () Bool)

(assert (=> b!1073216 (=> (not res!715831) (not e!613115))))

(assert (=> b!1073216 (= res!715831 (and (= (size!33628 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33629 _keys!1163) (size!33628 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94924 res!715830) b!1073216))

(assert (= (and b!1073216 res!715831) b!1073215))

(assert (= (and b!1073215 res!715829) b!1073213))

(assert (= (and b!1073213 res!715828) b!1073214))

(assert (= (and b!1073210 condMapEmpty!40630) mapIsEmpty!40630))

(assert (= (and b!1073210 (not condMapEmpty!40630)) mapNonEmpty!40630))

(get-info :version)

(assert (= (and mapNonEmpty!40630 ((_ is ValueCellFull!12269) mapValue!40630)) b!1073212))

(assert (= (and b!1073210 ((_ is ValueCellFull!12269) mapDefault!40630)) b!1073211))

(assert (= start!94924 b!1073210))

(declare-fun m!991741 () Bool)

(assert (=> mapNonEmpty!40630 m!991741))

(declare-fun m!991743 () Bool)

(assert (=> b!1073214 m!991743))

(declare-fun m!991745 () Bool)

(assert (=> b!1073214 m!991745))

(declare-fun m!991747 () Bool)

(assert (=> b!1073213 m!991747))

(declare-fun m!991749 () Bool)

(assert (=> b!1073215 m!991749))

(declare-fun m!991751 () Bool)

(assert (=> start!94924 m!991751))

(declare-fun m!991753 () Bool)

(assert (=> start!94924 m!991753))

(declare-fun m!991755 () Bool)

(assert (=> start!94924 m!991755))

(check-sat tp_is_empty!25945 (not b_next!22135) (not b!1073213) (not b!1073215) (not b!1073214) b_and!34963 (not mapNonEmpty!40630) (not start!94924))
(check-sat b_and!34963 (not b_next!22135))
