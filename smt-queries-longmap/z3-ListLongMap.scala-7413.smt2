; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94528 () Bool)

(assert start!94528)

(declare-fun b_free!21655 () Bool)

(declare-fun b_next!21655 () Bool)

(assert (=> start!94528 (= b_free!21655 (not b_next!21655))))

(declare-fun tp!76406 () Bool)

(declare-fun b_and!34437 () Bool)

(assert (=> start!94528 (= tp!76406 b_and!34437)))

(declare-fun b!1067624 () Bool)

(declare-fun e!608867 () Bool)

(declare-fun e!608864 () Bool)

(assert (=> b!1067624 (= e!608867 (not e!608864))))

(declare-fun res!712210 () Bool)

(assert (=> b!1067624 (=> res!712210 e!608864)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067624 (= res!712210 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39089 0))(
  ( (V!39090 (val!12783 Int)) )
))
(declare-datatypes ((tuple2!16192 0))(
  ( (tuple2!16193 (_1!8107 (_ BitVec 64)) (_2!8107 V!39089)) )
))
(declare-datatypes ((List!22760 0))(
  ( (Nil!22757) (Cons!22756 (h!23974 tuple2!16192) (t!32073 List!22760)) )
))
(declare-datatypes ((ListLongMap!14169 0))(
  ( (ListLongMap!14170 (toList!7100 List!22760)) )
))
(declare-fun lt!471179 () ListLongMap!14169)

(declare-fun lt!471180 () ListLongMap!14169)

(assert (=> b!1067624 (= lt!471179 lt!471180)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39089)

(declare-datatypes ((Unit!34996 0))(
  ( (Unit!34997) )
))
(declare-fun lt!471181 () Unit!34996)

(declare-datatypes ((ValueCell!12029 0))(
  ( (ValueCellFull!12029 (v!15392 V!39089)) (EmptyCell!12029) )
))
(declare-datatypes ((array!67961 0))(
  ( (array!67962 (arr!32676 (Array (_ BitVec 32) ValueCell!12029)) (size!33213 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67961)

(declare-fun minValue!907 () V!39089)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39089)

(declare-datatypes ((array!67963 0))(
  ( (array!67964 (arr!32677 (Array (_ BitVec 32) (_ BitVec 64))) (size!33214 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67963)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!724 (array!67963 array!67961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39089 V!39089 V!39089 V!39089 (_ BitVec 32) Int) Unit!34996)

(assert (=> b!1067624 (= lt!471181 (lemmaNoChangeToArrayThenSameMapNoExtras!724 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3721 (array!67963 array!67961 (_ BitVec 32) (_ BitVec 32) V!39089 V!39089 (_ BitVec 32) Int) ListLongMap!14169)

(assert (=> b!1067624 (= lt!471180 (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067624 (= lt!471179 (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067625 () Bool)

(assert (=> b!1067625 (= e!608864 true)))

(declare-fun lt!471182 () ListLongMap!14169)

(declare-fun lt!471178 () ListLongMap!14169)

(declare-fun -!616 (ListLongMap!14169 (_ BitVec 64)) ListLongMap!14169)

(assert (=> b!1067625 (= lt!471182 (-!616 lt!471178 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!471177 () ListLongMap!14169)

(assert (=> b!1067625 (= (-!616 lt!471177 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471179)))

(declare-fun lt!471175 () Unit!34996)

(declare-fun addThenRemoveForNewKeyIsSame!26 (ListLongMap!14169 (_ BitVec 64) V!39089) Unit!34996)

(assert (=> b!1067625 (= lt!471175 (addThenRemoveForNewKeyIsSame!26 lt!471179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!471176 () ListLongMap!14169)

(assert (=> b!1067625 (and (= lt!471178 lt!471177) (= lt!471176 lt!471180))))

(declare-fun +!3169 (ListLongMap!14169 tuple2!16192) ListLongMap!14169)

(assert (=> b!1067625 (= lt!471177 (+!3169 lt!471179 (tuple2!16193 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4050 (array!67963 array!67961 (_ BitVec 32) (_ BitVec 32) V!39089 V!39089 (_ BitVec 32) Int) ListLongMap!14169)

(assert (=> b!1067625 (= lt!471176 (getCurrentListMap!4050 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067625 (= lt!471178 (getCurrentListMap!4050 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067626 () Bool)

(declare-fun e!608868 () Bool)

(declare-fun tp_is_empty!25465 () Bool)

(assert (=> b!1067626 (= e!608868 tp_is_empty!25465)))

(declare-fun mapIsEmpty!39886 () Bool)

(declare-fun mapRes!39886 () Bool)

(assert (=> mapIsEmpty!39886 mapRes!39886))

(declare-fun res!712213 () Bool)

(assert (=> start!94528 (=> (not res!712213) (not e!608867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94528 (= res!712213 (validMask!0 mask!1515))))

(assert (=> start!94528 e!608867))

(assert (=> start!94528 true))

(assert (=> start!94528 tp_is_empty!25465))

(declare-fun e!608865 () Bool)

(declare-fun array_inv!25322 (array!67961) Bool)

(assert (=> start!94528 (and (array_inv!25322 _values!955) e!608865)))

(assert (=> start!94528 tp!76406))

(declare-fun array_inv!25323 (array!67963) Bool)

(assert (=> start!94528 (array_inv!25323 _keys!1163)))

(declare-fun b!1067627 () Bool)

(declare-fun res!712209 () Bool)

(assert (=> b!1067627 (=> (not res!712209) (not e!608867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67963 (_ BitVec 32)) Bool)

(assert (=> b!1067627 (= res!712209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067628 () Bool)

(declare-fun res!712211 () Bool)

(assert (=> b!1067628 (=> (not res!712211) (not e!608867))))

(assert (=> b!1067628 (= res!712211 (and (= (size!33213 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33214 _keys!1163) (size!33213 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067629 () Bool)

(assert (=> b!1067629 (= e!608865 (and e!608868 mapRes!39886))))

(declare-fun condMapEmpty!39886 () Bool)

(declare-fun mapDefault!39886 () ValueCell!12029)

(assert (=> b!1067629 (= condMapEmpty!39886 (= (arr!32676 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12029)) mapDefault!39886)))))

(declare-fun b!1067630 () Bool)

(declare-fun res!712212 () Bool)

(assert (=> b!1067630 (=> (not res!712212) (not e!608867))))

(declare-datatypes ((List!22761 0))(
  ( (Nil!22758) (Cons!22757 (h!23975 (_ BitVec 64)) (t!32074 List!22761)) )
))
(declare-fun arrayNoDuplicates!0 (array!67963 (_ BitVec 32) List!22761) Bool)

(assert (=> b!1067630 (= res!712212 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22758))))

(declare-fun b!1067631 () Bool)

(declare-fun e!608869 () Bool)

(assert (=> b!1067631 (= e!608869 tp_is_empty!25465)))

(declare-fun mapNonEmpty!39886 () Bool)

(declare-fun tp!76405 () Bool)

(assert (=> mapNonEmpty!39886 (= mapRes!39886 (and tp!76405 e!608869))))

(declare-fun mapRest!39886 () (Array (_ BitVec 32) ValueCell!12029))

(declare-fun mapKey!39886 () (_ BitVec 32))

(declare-fun mapValue!39886 () ValueCell!12029)

(assert (=> mapNonEmpty!39886 (= (arr!32676 _values!955) (store mapRest!39886 mapKey!39886 mapValue!39886))))

(assert (= (and start!94528 res!712213) b!1067628))

(assert (= (and b!1067628 res!712211) b!1067627))

(assert (= (and b!1067627 res!712209) b!1067630))

(assert (= (and b!1067630 res!712212) b!1067624))

(assert (= (and b!1067624 (not res!712210)) b!1067625))

(assert (= (and b!1067629 condMapEmpty!39886) mapIsEmpty!39886))

(assert (= (and b!1067629 (not condMapEmpty!39886)) mapNonEmpty!39886))

(get-info :version)

(assert (= (and mapNonEmpty!39886 ((_ is ValueCellFull!12029) mapValue!39886)) b!1067631))

(assert (= (and b!1067629 ((_ is ValueCellFull!12029) mapDefault!39886)) b!1067626))

(assert (= start!94528 b!1067629))

(declare-fun m!986595 () Bool)

(assert (=> b!1067624 m!986595))

(declare-fun m!986597 () Bool)

(assert (=> b!1067624 m!986597))

(declare-fun m!986599 () Bool)

(assert (=> b!1067624 m!986599))

(declare-fun m!986601 () Bool)

(assert (=> b!1067625 m!986601))

(declare-fun m!986603 () Bool)

(assert (=> b!1067625 m!986603))

(declare-fun m!986605 () Bool)

(assert (=> b!1067625 m!986605))

(declare-fun m!986607 () Bool)

(assert (=> b!1067625 m!986607))

(declare-fun m!986609 () Bool)

(assert (=> b!1067625 m!986609))

(declare-fun m!986611 () Bool)

(assert (=> b!1067625 m!986611))

(declare-fun m!986613 () Bool)

(assert (=> start!94528 m!986613))

(declare-fun m!986615 () Bool)

(assert (=> start!94528 m!986615))

(declare-fun m!986617 () Bool)

(assert (=> start!94528 m!986617))

(declare-fun m!986619 () Bool)

(assert (=> b!1067627 m!986619))

(declare-fun m!986621 () Bool)

(assert (=> b!1067630 m!986621))

(declare-fun m!986623 () Bool)

(assert (=> mapNonEmpty!39886 m!986623))

(check-sat (not b!1067630) (not start!94528) (not b_next!21655) (not mapNonEmpty!39886) (not b!1067624) tp_is_empty!25465 (not b!1067625) (not b!1067627) b_and!34437)
(check-sat b_and!34437 (not b_next!21655))
