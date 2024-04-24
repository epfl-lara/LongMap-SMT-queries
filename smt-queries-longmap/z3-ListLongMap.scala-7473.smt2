; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94998 () Bool)

(assert start!94998)

(declare-fun b_free!22015 () Bool)

(declare-fun b_next!22015 () Bool)

(assert (=> start!94998 (= b_free!22015 (not b_next!22015))))

(declare-fun tp!77503 () Bool)

(declare-fun b_and!34855 () Bool)

(assert (=> start!94998 (= tp!77503 b_and!34855)))

(declare-fun b!1072834 () Bool)

(declare-fun res!715312 () Bool)

(declare-fun e!612705 () Bool)

(assert (=> b!1072834 (=> (not res!715312) (not e!612705))))

(declare-datatypes ((array!68663 0))(
  ( (array!68664 (arr!33021 (Array (_ BitVec 32) (_ BitVec 64))) (size!33558 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68663)

(declare-datatypes ((List!23030 0))(
  ( (Nil!23027) (Cons!23026 (h!24244 (_ BitVec 64)) (t!32355 List!23030)) )
))
(declare-fun arrayNoDuplicates!0 (array!68663 (_ BitVec 32) List!23030) Bool)

(assert (=> b!1072834 (= res!715312 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23027))))

(declare-datatypes ((V!39569 0))(
  ( (V!39570 (val!12963 Int)) )
))
(declare-datatypes ((tuple2!16472 0))(
  ( (tuple2!16473 (_1!8247 (_ BitVec 64)) (_2!8247 V!39569)) )
))
(declare-datatypes ((List!23031 0))(
  ( (Nil!23028) (Cons!23027 (h!24245 tuple2!16472) (t!32356 List!23031)) )
))
(declare-datatypes ((ListLongMap!14449 0))(
  ( (ListLongMap!14450 (toList!7240 List!23031)) )
))
(declare-fun lt!474700 () ListLongMap!14449)

(declare-fun b!1072835 () Bool)

(declare-fun e!612704 () Bool)

(declare-fun lt!474696 () ListLongMap!14449)

(declare-fun lt!474702 () tuple2!16472)

(declare-fun +!3203 (ListLongMap!14449 tuple2!16472) ListLongMap!14449)

(assert (=> b!1072835 (= e!612704 (= lt!474696 (+!3203 lt!474700 lt!474702)))))

(declare-fun b!1072836 () Bool)

(declare-fun res!715311 () Bool)

(assert (=> b!1072836 (=> (not res!715311) (not e!612705))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68663 (_ BitVec 32)) Bool)

(assert (=> b!1072836 (= res!715311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072837 () Bool)

(declare-fun e!612701 () Bool)

(assert (=> b!1072837 (= e!612701 true)))

(declare-fun lt!474693 () ListLongMap!14449)

(declare-fun lt!474701 () ListLongMap!14449)

(declare-fun -!673 (ListLongMap!14449 (_ BitVec 64)) ListLongMap!14449)

(assert (=> b!1072837 (= lt!474693 (-!673 lt!474701 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474703 () ListLongMap!14449)

(declare-fun lt!474695 () ListLongMap!14449)

(assert (=> b!1072837 (= lt!474703 lt!474695)))

(declare-fun zeroValueBefore!47 () V!39569)

(declare-datatypes ((Unit!35263 0))(
  ( (Unit!35264) )
))
(declare-fun lt!474697 () Unit!35263)

(declare-fun minValue!907 () V!39569)

(declare-fun lt!474692 () ListLongMap!14449)

(declare-fun addCommutativeForDiffKeys!730 (ListLongMap!14449 (_ BitVec 64) V!39569 (_ BitVec 64) V!39569) Unit!35263)

(assert (=> b!1072837 (= lt!474697 (addCommutativeForDiffKeys!730 lt!474692 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474698 () ListLongMap!14449)

(assert (=> b!1072837 (= (-!673 lt!474695 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474698)))

(declare-fun lt!474699 () tuple2!16472)

(assert (=> b!1072837 (= lt!474695 (+!3203 lt!474698 lt!474699))))

(declare-fun lt!474694 () Unit!35263)

(declare-fun addThenRemoveForNewKeyIsSame!48 (ListLongMap!14449 (_ BitVec 64) V!39569) Unit!35263)

(assert (=> b!1072837 (= lt!474694 (addThenRemoveForNewKeyIsSame!48 lt!474698 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072837 (= lt!474698 (+!3203 lt!474692 lt!474702))))

(assert (=> b!1072837 e!612704))

(declare-fun res!715307 () Bool)

(assert (=> b!1072837 (=> (not res!715307) (not e!612704))))

(assert (=> b!1072837 (= res!715307 (= lt!474701 lt!474703))))

(assert (=> b!1072837 (= lt!474703 (+!3203 (+!3203 lt!474692 lt!474699) lt!474702))))

(assert (=> b!1072837 (= lt!474702 (tuple2!16473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072837 (= lt!474699 (tuple2!16473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-datatypes ((ValueCell!12209 0))(
  ( (ValueCellFull!12209 (v!15575 V!39569)) (EmptyCell!12209) )
))
(declare-datatypes ((array!68665 0))(
  ( (array!68666 (arr!33022 (Array (_ BitVec 32) ValueCell!12209)) (size!33559 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68665)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39569)

(declare-fun getCurrentListMap!4134 (array!68663 array!68665 (_ BitVec 32) (_ BitVec 32) V!39569 V!39569 (_ BitVec 32) Int) ListLongMap!14449)

(assert (=> b!1072837 (= lt!474696 (getCurrentListMap!4134 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072837 (= lt!474701 (getCurrentListMap!4134 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072838 () Bool)

(declare-fun res!715309 () Bool)

(assert (=> b!1072838 (=> (not res!715309) (not e!612705))))

(assert (=> b!1072838 (= res!715309 (and (= (size!33559 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33558 _keys!1163) (size!33559 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072839 () Bool)

(declare-fun e!612702 () Bool)

(declare-fun tp_is_empty!25825 () Bool)

(assert (=> b!1072839 (= e!612702 tp_is_empty!25825)))

(declare-fun res!715310 () Bool)

(assert (=> start!94998 (=> (not res!715310) (not e!612705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94998 (= res!715310 (validMask!0 mask!1515))))

(assert (=> start!94998 e!612705))

(assert (=> start!94998 true))

(assert (=> start!94998 tp_is_empty!25825))

(declare-fun e!612706 () Bool)

(declare-fun array_inv!25562 (array!68665) Bool)

(assert (=> start!94998 (and (array_inv!25562 _values!955) e!612706)))

(assert (=> start!94998 tp!77503))

(declare-fun array_inv!25563 (array!68663) Bool)

(assert (=> start!94998 (array_inv!25563 _keys!1163)))

(declare-fun mapNonEmpty!40444 () Bool)

(declare-fun mapRes!40444 () Bool)

(declare-fun tp!77504 () Bool)

(declare-fun e!612707 () Bool)

(assert (=> mapNonEmpty!40444 (= mapRes!40444 (and tp!77504 e!612707))))

(declare-fun mapValue!40444 () ValueCell!12209)

(declare-fun mapRest!40444 () (Array (_ BitVec 32) ValueCell!12209))

(declare-fun mapKey!40444 () (_ BitVec 32))

(assert (=> mapNonEmpty!40444 (= (arr!33022 _values!955) (store mapRest!40444 mapKey!40444 mapValue!40444))))

(declare-fun b!1072840 () Bool)

(assert (=> b!1072840 (= e!612706 (and e!612702 mapRes!40444))))

(declare-fun condMapEmpty!40444 () Bool)

(declare-fun mapDefault!40444 () ValueCell!12209)

(assert (=> b!1072840 (= condMapEmpty!40444 (= (arr!33022 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12209)) mapDefault!40444)))))

(declare-fun mapIsEmpty!40444 () Bool)

(assert (=> mapIsEmpty!40444 mapRes!40444))

(declare-fun b!1072841 () Bool)

(assert (=> b!1072841 (= e!612707 tp_is_empty!25825)))

(declare-fun b!1072842 () Bool)

(assert (=> b!1072842 (= e!612705 (not e!612701))))

(declare-fun res!715308 () Bool)

(assert (=> b!1072842 (=> res!715308 e!612701)))

(assert (=> b!1072842 (= res!715308 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072842 (= lt!474692 lt!474700)))

(declare-fun lt!474691 () Unit!35263)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!848 (array!68663 array!68665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39569 V!39569 V!39569 V!39569 (_ BitVec 32) Int) Unit!35263)

(assert (=> b!1072842 (= lt!474691 (lemmaNoChangeToArrayThenSameMapNoExtras!848 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3845 (array!68663 array!68665 (_ BitVec 32) (_ BitVec 32) V!39569 V!39569 (_ BitVec 32) Int) ListLongMap!14449)

(assert (=> b!1072842 (= lt!474700 (getCurrentListMapNoExtraKeys!3845 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072842 (= lt!474692 (getCurrentListMapNoExtraKeys!3845 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94998 res!715310) b!1072838))

(assert (= (and b!1072838 res!715309) b!1072836))

(assert (= (and b!1072836 res!715311) b!1072834))

(assert (= (and b!1072834 res!715312) b!1072842))

(assert (= (and b!1072842 (not res!715308)) b!1072837))

(assert (= (and b!1072837 res!715307) b!1072835))

(assert (= (and b!1072840 condMapEmpty!40444) mapIsEmpty!40444))

(assert (= (and b!1072840 (not condMapEmpty!40444)) mapNonEmpty!40444))

(get-info :version)

(assert (= (and mapNonEmpty!40444 ((_ is ValueCellFull!12209) mapValue!40444)) b!1072841))

(assert (= (and b!1072840 ((_ is ValueCellFull!12209) mapDefault!40444)) b!1072839))

(assert (= start!94998 b!1072840))

(declare-fun m!991721 () Bool)

(assert (=> b!1072836 m!991721))

(declare-fun m!991723 () Bool)

(assert (=> start!94998 m!991723))

(declare-fun m!991725 () Bool)

(assert (=> start!94998 m!991725))

(declare-fun m!991727 () Bool)

(assert (=> start!94998 m!991727))

(declare-fun m!991729 () Bool)

(assert (=> mapNonEmpty!40444 m!991729))

(declare-fun m!991731 () Bool)

(assert (=> b!1072842 m!991731))

(declare-fun m!991733 () Bool)

(assert (=> b!1072842 m!991733))

(declare-fun m!991735 () Bool)

(assert (=> b!1072842 m!991735))

(declare-fun m!991737 () Bool)

(assert (=> b!1072834 m!991737))

(declare-fun m!991739 () Bool)

(assert (=> b!1072835 m!991739))

(declare-fun m!991741 () Bool)

(assert (=> b!1072837 m!991741))

(declare-fun m!991743 () Bool)

(assert (=> b!1072837 m!991743))

(declare-fun m!991745 () Bool)

(assert (=> b!1072837 m!991745))

(declare-fun m!991747 () Bool)

(assert (=> b!1072837 m!991747))

(declare-fun m!991749 () Bool)

(assert (=> b!1072837 m!991749))

(declare-fun m!991751 () Bool)

(assert (=> b!1072837 m!991751))

(declare-fun m!991753 () Bool)

(assert (=> b!1072837 m!991753))

(declare-fun m!991755 () Bool)

(assert (=> b!1072837 m!991755))

(declare-fun m!991757 () Bool)

(assert (=> b!1072837 m!991757))

(declare-fun m!991759 () Bool)

(assert (=> b!1072837 m!991759))

(assert (=> b!1072837 m!991747))

(check-sat b_and!34855 (not b!1072834) (not b!1072837) (not b!1072835) (not b_next!22015) (not b!1072836) (not start!94998) (not b!1072842) tp_is_empty!25825 (not mapNonEmpty!40444))
(check-sat b_and!34855 (not b_next!22015))
