; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95328 () Bool)

(assert start!95328)

(declare-fun b_free!22189 () Bool)

(declare-fun b_next!22189 () Bool)

(assert (=> start!95328 (= b_free!22189 (not b_next!22189))))

(declare-fun tp!78050 () Bool)

(declare-fun b_and!35119 () Bool)

(assert (=> start!95328 (= tp!78050 b_and!35119)))

(declare-fun mapIsEmpty!40729 () Bool)

(declare-fun mapRes!40729 () Bool)

(assert (=> mapIsEmpty!40729 mapRes!40729))

(declare-fun b!1076294 () Bool)

(declare-fun res!717214 () Bool)

(declare-fun e!615154 () Bool)

(assert (=> b!1076294 (=> (not res!717214) (not e!615154))))

(declare-datatypes ((V!39801 0))(
  ( (V!39802 (val!13050 Int)) )
))
(declare-datatypes ((ValueCell!12296 0))(
  ( (ValueCellFull!12296 (v!15669 V!39801)) (EmptyCell!12296) )
))
(declare-datatypes ((array!69009 0))(
  ( (array!69010 (arr!33186 (Array (_ BitVec 32) ValueCell!12296)) (size!33723 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69009)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!69011 0))(
  ( (array!69012 (arr!33187 (Array (_ BitVec 32) (_ BitVec 64))) (size!33724 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69011)

(assert (=> b!1076294 (= res!717214 (and (= (size!33723 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33724 _keys!1163) (size!33723 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076296 () Bool)

(declare-fun e!615151 () Bool)

(declare-fun tp_is_empty!25999 () Bool)

(assert (=> b!1076296 (= e!615151 tp_is_empty!25999)))

(declare-fun b!1076297 () Bool)

(declare-fun e!615156 () Bool)

(assert (=> b!1076297 (= e!615156 tp_is_empty!25999)))

(declare-fun mapNonEmpty!40729 () Bool)

(declare-fun tp!78049 () Bool)

(assert (=> mapNonEmpty!40729 (= mapRes!40729 (and tp!78049 e!615156))))

(declare-fun mapKey!40729 () (_ BitVec 32))

(declare-fun mapValue!40729 () ValueCell!12296)

(declare-fun mapRest!40729 () (Array (_ BitVec 32) ValueCell!12296))

(assert (=> mapNonEmpty!40729 (= (arr!33186 _values!955) (store mapRest!40729 mapKey!40729 mapValue!40729))))

(declare-fun b!1076298 () Bool)

(declare-fun e!615152 () Bool)

(declare-datatypes ((tuple2!16610 0))(
  ( (tuple2!16611 (_1!8316 (_ BitVec 64)) (_2!8316 V!39801)) )
))
(declare-datatypes ((List!23163 0))(
  ( (Nil!23160) (Cons!23159 (h!24377 tuple2!16610) (t!32504 List!23163)) )
))
(declare-datatypes ((ListLongMap!14587 0))(
  ( (ListLongMap!14588 (toList!7309 List!23163)) )
))
(declare-fun lt!477550 () ListLongMap!14587)

(declare-fun lt!477544 () ListLongMap!14587)

(declare-fun -!700 (ListLongMap!14587 (_ BitVec 64)) ListLongMap!14587)

(assert (=> b!1076298 (= e!615152 (= (-!700 lt!477550 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477544))))

(declare-fun lt!477549 () ListLongMap!14587)

(declare-fun lt!477546 () ListLongMap!14587)

(assert (=> b!1076298 (= (-!700 lt!477549 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477546)))

(declare-datatypes ((Unit!35361 0))(
  ( (Unit!35362) )
))
(declare-fun lt!477545 () Unit!35361)

(declare-fun zeroValueBefore!47 () V!39801)

(declare-fun addThenRemoveForNewKeyIsSame!74 (ListLongMap!14587 (_ BitVec 64) V!39801) Unit!35361)

(assert (=> b!1076298 (= lt!477545 (addThenRemoveForNewKeyIsSame!74 lt!477546 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!477547 () ListLongMap!14587)

(assert (=> b!1076298 (and (= lt!477550 lt!477549) (= lt!477544 lt!477547))))

(declare-fun +!3241 (ListLongMap!14587 tuple2!16610) ListLongMap!14587)

(assert (=> b!1076298 (= lt!477549 (+!3241 lt!477546 (tuple2!16611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39801)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39801)

(declare-fun getCurrentListMap!4168 (array!69011 array!69009 (_ BitVec 32) (_ BitVec 32) V!39801 V!39801 (_ BitVec 32) Int) ListLongMap!14587)

(assert (=> b!1076298 (= lt!477544 (getCurrentListMap!4168 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076298 (= lt!477550 (getCurrentListMap!4168 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076299 () Bool)

(assert (=> b!1076299 (= e!615154 (not e!615152))))

(declare-fun res!717211 () Bool)

(assert (=> b!1076299 (=> res!717211 e!615152)))

(assert (=> b!1076299 (= res!717211 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1076299 (= lt!477546 lt!477547)))

(declare-fun lt!477548 () Unit!35361)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!884 (array!69011 array!69009 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39801 V!39801 V!39801 V!39801 (_ BitVec 32) Int) Unit!35361)

(assert (=> b!1076299 (= lt!477548 (lemmaNoChangeToArrayThenSameMapNoExtras!884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3904 (array!69011 array!69009 (_ BitVec 32) (_ BitVec 32) V!39801 V!39801 (_ BitVec 32) Int) ListLongMap!14587)

(assert (=> b!1076299 (= lt!477547 (getCurrentListMapNoExtraKeys!3904 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076299 (= lt!477546 (getCurrentListMapNoExtraKeys!3904 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076300 () Bool)

(declare-fun e!615153 () Bool)

(assert (=> b!1076300 (= e!615153 (and e!615151 mapRes!40729))))

(declare-fun condMapEmpty!40729 () Bool)

(declare-fun mapDefault!40729 () ValueCell!12296)

(assert (=> b!1076300 (= condMapEmpty!40729 (= (arr!33186 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12296)) mapDefault!40729)))))

(declare-fun b!1076301 () Bool)

(declare-fun res!717212 () Bool)

(assert (=> b!1076301 (=> (not res!717212) (not e!615154))))

(declare-datatypes ((List!23164 0))(
  ( (Nil!23161) (Cons!23160 (h!24378 (_ BitVec 64)) (t!32505 List!23164)) )
))
(declare-fun arrayNoDuplicates!0 (array!69011 (_ BitVec 32) List!23164) Bool)

(assert (=> b!1076301 (= res!717212 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23161))))

(declare-fun b!1076295 () Bool)

(declare-fun res!717213 () Bool)

(assert (=> b!1076295 (=> (not res!717213) (not e!615154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69011 (_ BitVec 32)) Bool)

(assert (=> b!1076295 (= res!717213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!717210 () Bool)

(assert (=> start!95328 (=> (not res!717210) (not e!615154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95328 (= res!717210 (validMask!0 mask!1515))))

(assert (=> start!95328 e!615154))

(assert (=> start!95328 true))

(assert (=> start!95328 tp_is_empty!25999))

(declare-fun array_inv!25686 (array!69009) Bool)

(assert (=> start!95328 (and (array_inv!25686 _values!955) e!615153)))

(assert (=> start!95328 tp!78050))

(declare-fun array_inv!25687 (array!69011) Bool)

(assert (=> start!95328 (array_inv!25687 _keys!1163)))

(assert (= (and start!95328 res!717210) b!1076294))

(assert (= (and b!1076294 res!717214) b!1076295))

(assert (= (and b!1076295 res!717213) b!1076301))

(assert (= (and b!1076301 res!717212) b!1076299))

(assert (= (and b!1076299 (not res!717211)) b!1076298))

(assert (= (and b!1076300 condMapEmpty!40729) mapIsEmpty!40729))

(assert (= (and b!1076300 (not condMapEmpty!40729)) mapNonEmpty!40729))

(get-info :version)

(assert (= (and mapNonEmpty!40729 ((_ is ValueCellFull!12296) mapValue!40729)) b!1076297))

(assert (= (and b!1076300 ((_ is ValueCellFull!12296) mapDefault!40729)) b!1076296))

(assert (= start!95328 b!1076300))

(declare-fun m!995477 () Bool)

(assert (=> start!95328 m!995477))

(declare-fun m!995479 () Bool)

(assert (=> start!95328 m!995479))

(declare-fun m!995481 () Bool)

(assert (=> start!95328 m!995481))

(declare-fun m!995483 () Bool)

(assert (=> b!1076299 m!995483))

(declare-fun m!995485 () Bool)

(assert (=> b!1076299 m!995485))

(declare-fun m!995487 () Bool)

(assert (=> b!1076299 m!995487))

(declare-fun m!995489 () Bool)

(assert (=> mapNonEmpty!40729 m!995489))

(declare-fun m!995491 () Bool)

(assert (=> b!1076301 m!995491))

(declare-fun m!995493 () Bool)

(assert (=> b!1076298 m!995493))

(declare-fun m!995495 () Bool)

(assert (=> b!1076298 m!995495))

(declare-fun m!995497 () Bool)

(assert (=> b!1076298 m!995497))

(declare-fun m!995499 () Bool)

(assert (=> b!1076298 m!995499))

(declare-fun m!995501 () Bool)

(assert (=> b!1076298 m!995501))

(declare-fun m!995503 () Bool)

(assert (=> b!1076298 m!995503))

(declare-fun m!995505 () Bool)

(assert (=> b!1076295 m!995505))

(check-sat (not b!1076299) (not b!1076298) (not b!1076295) (not start!95328) b_and!35119 (not mapNonEmpty!40729) (not b!1076301) tp_is_empty!25999 (not b_next!22189))
(check-sat b_and!35119 (not b_next!22189))
