; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94206 () Bool)

(assert start!94206)

(declare-fun b_free!21591 () Bool)

(declare-fun b_next!21591 () Bool)

(assert (=> start!94206 (= b_free!21591 (not b_next!21591))))

(declare-fun tp!76211 () Bool)

(declare-fun b_and!34351 () Bool)

(assert (=> start!94206 (= tp!76211 b_and!34351)))

(declare-fun b!1065345 () Bool)

(declare-fun res!711125 () Bool)

(declare-fun e!607317 () Bool)

(assert (=> b!1065345 (=> (not res!711125) (not e!607317))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39003 0))(
  ( (V!39004 (val!12751 Int)) )
))
(declare-datatypes ((ValueCell!11997 0))(
  ( (ValueCellFull!11997 (v!15363 V!39003)) (EmptyCell!11997) )
))
(declare-datatypes ((array!67789 0))(
  ( (array!67790 (arr!32597 (Array (_ BitVec 32) ValueCell!11997)) (size!33133 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67789)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67791 0))(
  ( (array!67792 (arr!32598 (Array (_ BitVec 32) (_ BitVec 64))) (size!33134 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67791)

(assert (=> b!1065345 (= res!711125 (and (= (size!33133 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33134 _keys!1163) (size!33133 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065346 () Bool)

(declare-fun e!607314 () Bool)

(assert (=> b!1065346 (= e!607317 (not e!607314))))

(declare-fun res!711129 () Bool)

(assert (=> b!1065346 (=> res!711129 e!607314)))

(assert (=> b!1065346 (= res!711129 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16158 0))(
  ( (tuple2!16159 (_1!8090 (_ BitVec 64)) (_2!8090 V!39003)) )
))
(declare-datatypes ((List!22726 0))(
  ( (Nil!22723) (Cons!22722 (h!23931 tuple2!16158) (t!32045 List!22726)) )
))
(declare-datatypes ((ListLongMap!14127 0))(
  ( (ListLongMap!14128 (toList!7079 List!22726)) )
))
(declare-fun lt!469756 () ListLongMap!14127)

(declare-fun lt!469759 () ListLongMap!14127)

(assert (=> b!1065346 (= lt!469756 lt!469759)))

(declare-datatypes ((Unit!34951 0))(
  ( (Unit!34952) )
))
(declare-fun lt!469757 () Unit!34951)

(declare-fun zeroValueBefore!47 () V!39003)

(declare-fun minValue!907 () V!39003)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39003)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!704 (array!67791 array!67789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39003 V!39003 V!39003 V!39003 (_ BitVec 32) Int) Unit!34951)

(assert (=> b!1065346 (= lt!469757 (lemmaNoChangeToArrayThenSameMapNoExtras!704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3667 (array!67791 array!67789 (_ BitVec 32) (_ BitVec 32) V!39003 V!39003 (_ BitVec 32) Int) ListLongMap!14127)

(assert (=> b!1065346 (= lt!469759 (getCurrentListMapNoExtraKeys!3667 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065346 (= lt!469756 (getCurrentListMapNoExtraKeys!3667 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39787 () Bool)

(declare-fun mapRes!39787 () Bool)

(declare-fun tp!76210 () Bool)

(declare-fun e!607316 () Bool)

(assert (=> mapNonEmpty!39787 (= mapRes!39787 (and tp!76210 e!607316))))

(declare-fun mapValue!39787 () ValueCell!11997)

(declare-fun mapKey!39787 () (_ BitVec 32))

(declare-fun mapRest!39787 () (Array (_ BitVec 32) ValueCell!11997))

(assert (=> mapNonEmpty!39787 (= (arr!32597 _values!955) (store mapRest!39787 mapKey!39787 mapValue!39787))))

(declare-fun b!1065347 () Bool)

(assert (=> b!1065347 (= e!607314 true)))

(declare-fun lt!469754 () ListLongMap!14127)

(declare-fun lt!469758 () ListLongMap!14127)

(declare-fun -!594 (ListLongMap!14127 (_ BitVec 64)) ListLongMap!14127)

(assert (=> b!1065347 (= lt!469754 (-!594 lt!469758 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469760 () ListLongMap!14127)

(assert (=> b!1065347 (= (-!594 lt!469760 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469756)))

(declare-fun lt!469761 () Unit!34951)

(declare-fun addThenRemoveForNewKeyIsSame!3 (ListLongMap!14127 (_ BitVec 64) V!39003) Unit!34951)

(assert (=> b!1065347 (= lt!469761 (addThenRemoveForNewKeyIsSame!3 lt!469756 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469755 () ListLongMap!14127)

(assert (=> b!1065347 (and (= lt!469758 lt!469760) (= lt!469755 lt!469759))))

(declare-fun +!3125 (ListLongMap!14127 tuple2!16158) ListLongMap!14127)

(assert (=> b!1065347 (= lt!469760 (+!3125 lt!469756 (tuple2!16159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4038 (array!67791 array!67789 (_ BitVec 32) (_ BitVec 32) V!39003 V!39003 (_ BitVec 32) Int) ListLongMap!14127)

(assert (=> b!1065347 (= lt!469755 (getCurrentListMap!4038 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065347 (= lt!469758 (getCurrentListMap!4038 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711127 () Bool)

(assert (=> start!94206 (=> (not res!711127) (not e!607317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94206 (= res!711127 (validMask!0 mask!1515))))

(assert (=> start!94206 e!607317))

(assert (=> start!94206 true))

(declare-fun tp_is_empty!25401 () Bool)

(assert (=> start!94206 tp_is_empty!25401))

(declare-fun e!607318 () Bool)

(declare-fun array_inv!25240 (array!67789) Bool)

(assert (=> start!94206 (and (array_inv!25240 _values!955) e!607318)))

(assert (=> start!94206 tp!76211))

(declare-fun array_inv!25241 (array!67791) Bool)

(assert (=> start!94206 (array_inv!25241 _keys!1163)))

(declare-fun b!1065348 () Bool)

(declare-fun res!711128 () Bool)

(assert (=> b!1065348 (=> (not res!711128) (not e!607317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67791 (_ BitVec 32)) Bool)

(assert (=> b!1065348 (= res!711128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065349 () Bool)

(declare-fun res!711126 () Bool)

(assert (=> b!1065349 (=> (not res!711126) (not e!607317))))

(declare-datatypes ((List!22727 0))(
  ( (Nil!22724) (Cons!22723 (h!23932 (_ BitVec 64)) (t!32046 List!22727)) )
))
(declare-fun arrayNoDuplicates!0 (array!67791 (_ BitVec 32) List!22727) Bool)

(assert (=> b!1065349 (= res!711126 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22724))))

(declare-fun b!1065350 () Bool)

(assert (=> b!1065350 (= e!607316 tp_is_empty!25401)))

(declare-fun b!1065351 () Bool)

(declare-fun e!607319 () Bool)

(assert (=> b!1065351 (= e!607318 (and e!607319 mapRes!39787))))

(declare-fun condMapEmpty!39787 () Bool)

(declare-fun mapDefault!39787 () ValueCell!11997)

(assert (=> b!1065351 (= condMapEmpty!39787 (= (arr!32597 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11997)) mapDefault!39787)))))

(declare-fun mapIsEmpty!39787 () Bool)

(assert (=> mapIsEmpty!39787 mapRes!39787))

(declare-fun b!1065352 () Bool)

(assert (=> b!1065352 (= e!607319 tp_is_empty!25401)))

(assert (= (and start!94206 res!711127) b!1065345))

(assert (= (and b!1065345 res!711125) b!1065348))

(assert (= (and b!1065348 res!711128) b!1065349))

(assert (= (and b!1065349 res!711126) b!1065346))

(assert (= (and b!1065346 (not res!711129)) b!1065347))

(assert (= (and b!1065351 condMapEmpty!39787) mapIsEmpty!39787))

(assert (= (and b!1065351 (not condMapEmpty!39787)) mapNonEmpty!39787))

(get-info :version)

(assert (= (and mapNonEmpty!39787 ((_ is ValueCellFull!11997) mapValue!39787)) b!1065350))

(assert (= (and b!1065351 ((_ is ValueCellFull!11997) mapDefault!39787)) b!1065352))

(assert (= start!94206 b!1065351))

(declare-fun m!983779 () Bool)

(assert (=> b!1065346 m!983779))

(declare-fun m!983781 () Bool)

(assert (=> b!1065346 m!983781))

(declare-fun m!983783 () Bool)

(assert (=> b!1065346 m!983783))

(declare-fun m!983785 () Bool)

(assert (=> b!1065348 m!983785))

(declare-fun m!983787 () Bool)

(assert (=> b!1065347 m!983787))

(declare-fun m!983789 () Bool)

(assert (=> b!1065347 m!983789))

(declare-fun m!983791 () Bool)

(assert (=> b!1065347 m!983791))

(declare-fun m!983793 () Bool)

(assert (=> b!1065347 m!983793))

(declare-fun m!983795 () Bool)

(assert (=> b!1065347 m!983795))

(declare-fun m!983797 () Bool)

(assert (=> b!1065347 m!983797))

(declare-fun m!983799 () Bool)

(assert (=> mapNonEmpty!39787 m!983799))

(declare-fun m!983801 () Bool)

(assert (=> b!1065349 m!983801))

(declare-fun m!983803 () Bool)

(assert (=> start!94206 m!983803))

(declare-fun m!983805 () Bool)

(assert (=> start!94206 m!983805))

(declare-fun m!983807 () Bool)

(assert (=> start!94206 m!983807))

(check-sat (not mapNonEmpty!39787) (not b!1065347) (not b_next!21591) b_and!34351 (not start!94206) tp_is_empty!25401 (not b!1065348) (not b!1065349) (not b!1065346))
(check-sat b_and!34351 (not b_next!21591))
