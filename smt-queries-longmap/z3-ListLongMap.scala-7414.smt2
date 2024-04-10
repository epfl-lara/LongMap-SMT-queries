; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94300 () Bool)

(assert start!94300)

(declare-fun b_free!21663 () Bool)

(declare-fun b_next!21663 () Bool)

(assert (=> start!94300 (= b_free!21663 (not b_next!21663))))

(declare-fun tp!76430 () Bool)

(declare-fun b_and!34435 () Bool)

(assert (=> start!94300 (= tp!76430 b_and!34435)))

(declare-fun b!1066393 () Bool)

(declare-fun res!711748 () Bool)

(declare-fun e!608085 () Bool)

(assert (=> b!1066393 (=> (not res!711748) (not e!608085))))

(declare-datatypes ((array!67931 0))(
  ( (array!67932 (arr!32667 (Array (_ BitVec 32) (_ BitVec 64))) (size!33203 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67931)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67931 (_ BitVec 32)) Bool)

(assert (=> b!1066393 (= res!711748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066394 () Bool)

(declare-fun res!711750 () Bool)

(assert (=> b!1066394 (=> (not res!711750) (not e!608085))))

(declare-datatypes ((List!22778 0))(
  ( (Nil!22775) (Cons!22774 (h!23983 (_ BitVec 64)) (t!32099 List!22778)) )
))
(declare-fun arrayNoDuplicates!0 (array!67931 (_ BitVec 32) List!22778) Bool)

(assert (=> b!1066394 (= res!711750 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22775))))

(declare-fun b!1066395 () Bool)

(declare-fun e!608086 () Bool)

(declare-fun tp_is_empty!25473 () Bool)

(assert (=> b!1066395 (= e!608086 tp_is_empty!25473)))

(declare-fun mapNonEmpty!39898 () Bool)

(declare-fun mapRes!39898 () Bool)

(declare-fun tp!76429 () Bool)

(assert (=> mapNonEmpty!39898 (= mapRes!39898 (and tp!76429 e!608086))))

(declare-datatypes ((V!39099 0))(
  ( (V!39100 (val!12787 Int)) )
))
(declare-datatypes ((ValueCell!12033 0))(
  ( (ValueCellFull!12033 (v!15400 V!39099)) (EmptyCell!12033) )
))
(declare-fun mapValue!39898 () ValueCell!12033)

(declare-fun mapRest!39898 () (Array (_ BitVec 32) ValueCell!12033))

(declare-datatypes ((array!67933 0))(
  ( (array!67934 (arr!32668 (Array (_ BitVec 32) ValueCell!12033)) (size!33204 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67933)

(declare-fun mapKey!39898 () (_ BitVec 32))

(assert (=> mapNonEmpty!39898 (= (arr!32668 _values!955) (store mapRest!39898 mapKey!39898 mapValue!39898))))

(declare-fun b!1066396 () Bool)

(declare-fun e!608083 () Bool)

(declare-fun e!608081 () Bool)

(assert (=> b!1066396 (= e!608083 (and e!608081 mapRes!39898))))

(declare-fun condMapEmpty!39898 () Bool)

(declare-fun mapDefault!39898 () ValueCell!12033)

(assert (=> b!1066396 (= condMapEmpty!39898 (= (arr!32668 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12033)) mapDefault!39898)))))

(declare-fun b!1066397 () Bool)

(declare-fun e!608084 () Bool)

(assert (=> b!1066397 (= e!608085 (not e!608084))))

(declare-fun res!711747 () Bool)

(assert (=> b!1066397 (=> res!711747 e!608084)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066397 (= res!711747 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16214 0))(
  ( (tuple2!16215 (_1!8118 (_ BitVec 64)) (_2!8118 V!39099)) )
))
(declare-datatypes ((List!22779 0))(
  ( (Nil!22776) (Cons!22775 (h!23984 tuple2!16214) (t!32100 List!22779)) )
))
(declare-datatypes ((ListLongMap!14183 0))(
  ( (ListLongMap!14184 (toList!7107 List!22779)) )
))
(declare-fun lt!470758 () ListLongMap!14183)

(declare-fun lt!470762 () ListLongMap!14183)

(assert (=> b!1066397 (= lt!470758 lt!470762)))

(declare-fun zeroValueBefore!47 () V!39099)

(declare-datatypes ((Unit!35009 0))(
  ( (Unit!35010) )
))
(declare-fun lt!470759 () Unit!35009)

(declare-fun minValue!907 () V!39099)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39099)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!730 (array!67931 array!67933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39099 V!39099 V!39099 V!39099 (_ BitVec 32) Int) Unit!35009)

(assert (=> b!1066397 (= lt!470759 (lemmaNoChangeToArrayThenSameMapNoExtras!730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3693 (array!67931 array!67933 (_ BitVec 32) (_ BitVec 32) V!39099 V!39099 (_ BitVec 32) Int) ListLongMap!14183)

(assert (=> b!1066397 (= lt!470762 (getCurrentListMapNoExtraKeys!3693 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066397 (= lt!470758 (getCurrentListMapNoExtraKeys!3693 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066398 () Bool)

(assert (=> b!1066398 (= e!608081 tp_is_empty!25473)))

(declare-fun b!1066399 () Bool)

(assert (=> b!1066399 (= e!608084 true)))

(declare-fun lt!470756 () ListLongMap!14183)

(declare-fun lt!470760 () ListLongMap!14183)

(declare-fun -!619 (ListLongMap!14183 (_ BitVec 64)) ListLongMap!14183)

(assert (=> b!1066399 (= lt!470756 (-!619 lt!470760 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470761 () ListLongMap!14183)

(assert (=> b!1066399 (= (-!619 lt!470761 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470758)))

(declare-fun lt!470763 () Unit!35009)

(declare-fun addThenRemoveForNewKeyIsSame!28 (ListLongMap!14183 (_ BitVec 64) V!39099) Unit!35009)

(assert (=> b!1066399 (= lt!470763 (addThenRemoveForNewKeyIsSame!28 lt!470758 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470757 () ListLongMap!14183)

(assert (=> b!1066399 (and (= lt!470760 lt!470761) (= lt!470757 lt!470762))))

(declare-fun +!3150 (ListLongMap!14183 tuple2!16214) ListLongMap!14183)

(assert (=> b!1066399 (= lt!470761 (+!3150 lt!470758 (tuple2!16215 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4063 (array!67931 array!67933 (_ BitVec 32) (_ BitVec 32) V!39099 V!39099 (_ BitVec 32) Int) ListLongMap!14183)

(assert (=> b!1066399 (= lt!470757 (getCurrentListMap!4063 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066399 (= lt!470760 (getCurrentListMap!4063 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711749 () Bool)

(assert (=> start!94300 (=> (not res!711749) (not e!608085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94300 (= res!711749 (validMask!0 mask!1515))))

(assert (=> start!94300 e!608085))

(assert (=> start!94300 true))

(assert (=> start!94300 tp_is_empty!25473))

(declare-fun array_inv!25294 (array!67933) Bool)

(assert (=> start!94300 (and (array_inv!25294 _values!955) e!608083)))

(assert (=> start!94300 tp!76430))

(declare-fun array_inv!25295 (array!67931) Bool)

(assert (=> start!94300 (array_inv!25295 _keys!1163)))

(declare-fun b!1066400 () Bool)

(declare-fun res!711751 () Bool)

(assert (=> b!1066400 (=> (not res!711751) (not e!608085))))

(assert (=> b!1066400 (= res!711751 (and (= (size!33204 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33203 _keys!1163) (size!33204 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39898 () Bool)

(assert (=> mapIsEmpty!39898 mapRes!39898))

(assert (= (and start!94300 res!711749) b!1066400))

(assert (= (and b!1066400 res!711751) b!1066393))

(assert (= (and b!1066393 res!711748) b!1066394))

(assert (= (and b!1066394 res!711750) b!1066397))

(assert (= (and b!1066397 (not res!711747)) b!1066399))

(assert (= (and b!1066396 condMapEmpty!39898) mapIsEmpty!39898))

(assert (= (and b!1066396 (not condMapEmpty!39898)) mapNonEmpty!39898))

(get-info :version)

(assert (= (and mapNonEmpty!39898 ((_ is ValueCellFull!12033) mapValue!39898)) b!1066395))

(assert (= (and b!1066396 ((_ is ValueCellFull!12033) mapDefault!39898)) b!1066398))

(assert (= start!94300 b!1066396))

(declare-fun m!985043 () Bool)

(assert (=> b!1066399 m!985043))

(declare-fun m!985045 () Bool)

(assert (=> b!1066399 m!985045))

(declare-fun m!985047 () Bool)

(assert (=> b!1066399 m!985047))

(declare-fun m!985049 () Bool)

(assert (=> b!1066399 m!985049))

(declare-fun m!985051 () Bool)

(assert (=> b!1066399 m!985051))

(declare-fun m!985053 () Bool)

(assert (=> b!1066399 m!985053))

(declare-fun m!985055 () Bool)

(assert (=> b!1066393 m!985055))

(declare-fun m!985057 () Bool)

(assert (=> b!1066397 m!985057))

(declare-fun m!985059 () Bool)

(assert (=> b!1066397 m!985059))

(declare-fun m!985061 () Bool)

(assert (=> b!1066397 m!985061))

(declare-fun m!985063 () Bool)

(assert (=> start!94300 m!985063))

(declare-fun m!985065 () Bool)

(assert (=> start!94300 m!985065))

(declare-fun m!985067 () Bool)

(assert (=> start!94300 m!985067))

(declare-fun m!985069 () Bool)

(assert (=> b!1066394 m!985069))

(declare-fun m!985071 () Bool)

(assert (=> mapNonEmpty!39898 m!985071))

(check-sat (not b!1066397) (not b!1066394) (not b_next!21663) (not start!94300) (not b!1066393) (not b!1066399) b_and!34435 tp_is_empty!25473 (not mapNonEmpty!39898))
(check-sat b_and!34435 (not b_next!21663))
