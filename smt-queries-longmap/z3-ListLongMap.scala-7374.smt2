; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94220 () Bool)

(assert start!94220)

(declare-fun b_free!21421 () Bool)

(declare-fun b_next!21421 () Bool)

(assert (=> start!94220 (= b_free!21421 (not b_next!21421))))

(declare-fun tp!75691 () Bool)

(declare-fun b_and!34163 () Bool)

(assert (=> start!94220 (= tp!75691 b_and!34163)))

(declare-fun mapNonEmpty!39523 () Bool)

(declare-fun mapRes!39523 () Bool)

(declare-fun tp!75692 () Bool)

(declare-fun e!606398 () Bool)

(assert (=> mapNonEmpty!39523 (= mapRes!39523 (and tp!75692 e!606398))))

(declare-fun mapKey!39523 () (_ BitVec 32))

(declare-datatypes ((V!38777 0))(
  ( (V!38778 (val!12666 Int)) )
))
(declare-datatypes ((ValueCell!11912 0))(
  ( (ValueCellFull!11912 (v!15273 V!38777)) (EmptyCell!11912) )
))
(declare-fun mapRest!39523 () (Array (_ BitVec 32) ValueCell!11912))

(declare-datatypes ((array!67507 0))(
  ( (array!67508 (arr!32453 (Array (_ BitVec 32) ValueCell!11912)) (size!32990 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67507)

(declare-fun mapValue!39523 () ValueCell!11912)

(assert (=> mapNonEmpty!39523 (= (arr!32453 _values!955) (store mapRest!39523 mapKey!39523 mapValue!39523))))

(declare-fun res!710227 () Bool)

(declare-fun e!606395 () Bool)

(assert (=> start!94220 (=> (not res!710227) (not e!606395))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94220 (= res!710227 (validMask!0 mask!1515))))

(assert (=> start!94220 e!606395))

(assert (=> start!94220 true))

(declare-fun tp_is_empty!25231 () Bool)

(assert (=> start!94220 tp_is_empty!25231))

(declare-fun e!606392 () Bool)

(declare-fun array_inv!25160 (array!67507) Bool)

(assert (=> start!94220 (and (array_inv!25160 _values!955) e!606392)))

(assert (=> start!94220 tp!75691))

(declare-datatypes ((array!67509 0))(
  ( (array!67510 (arr!32454 (Array (_ BitVec 32) (_ BitVec 64))) (size!32991 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67509)

(declare-fun array_inv!25161 (array!67509) Bool)

(assert (=> start!94220 (array_inv!25161 _keys!1163)))

(declare-fun b!1064244 () Bool)

(declare-fun e!606394 () Bool)

(assert (=> b!1064244 (= e!606395 (not e!606394))))

(declare-fun res!710224 () Bool)

(assert (=> b!1064244 (=> res!710224 e!606394)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064244 (= res!710224 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16012 0))(
  ( (tuple2!16013 (_1!8017 (_ BitVec 64)) (_2!8017 V!38777)) )
))
(declare-datatypes ((List!22591 0))(
  ( (Nil!22588) (Cons!22587 (h!23805 tuple2!16012) (t!31896 List!22591)) )
))
(declare-datatypes ((ListLongMap!13989 0))(
  ( (ListLongMap!13990 (toList!7010 List!22591)) )
))
(declare-fun lt!468916 () ListLongMap!13989)

(declare-fun lt!468918 () ListLongMap!13989)

(assert (=> b!1064244 (= lt!468916 lt!468918)))

(declare-fun zeroValueBefore!47 () V!38777)

(declare-datatypes ((Unit!34825 0))(
  ( (Unit!34826) )
))
(declare-fun lt!468917 () Unit!34825)

(declare-fun minValue!907 () V!38777)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38777)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!654 (array!67509 array!67507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38777 V!38777 V!38777 V!38777 (_ BitVec 32) Int) Unit!34825)

(assert (=> b!1064244 (= lt!468917 (lemmaNoChangeToArrayThenSameMapNoExtras!654 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3651 (array!67509 array!67507 (_ BitVec 32) (_ BitVec 32) V!38777 V!38777 (_ BitVec 32) Int) ListLongMap!13989)

(assert (=> b!1064244 (= lt!468918 (getCurrentListMapNoExtraKeys!3651 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064244 (= lt!468916 (getCurrentListMapNoExtraKeys!3651 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064245 () Bool)

(declare-fun e!606396 () Bool)

(assert (=> b!1064245 (= e!606394 e!606396)))

(declare-fun res!710229 () Bool)

(assert (=> b!1064245 (=> res!710229 e!606396)))

(declare-fun lt!468919 () ListLongMap!13989)

(declare-fun contains!6264 (ListLongMap!13989 (_ BitVec 64)) Bool)

(assert (=> b!1064245 (= res!710229 (contains!6264 lt!468919 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3989 (array!67509 array!67507 (_ BitVec 32) (_ BitVec 32) V!38777 V!38777 (_ BitVec 32) Int) ListLongMap!13989)

(assert (=> b!1064245 (= lt!468919 (getCurrentListMap!3989 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064246 () Bool)

(declare-fun res!710225 () Bool)

(assert (=> b!1064246 (=> (not res!710225) (not e!606395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67509 (_ BitVec 32)) Bool)

(assert (=> b!1064246 (= res!710225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39523 () Bool)

(assert (=> mapIsEmpty!39523 mapRes!39523))

(declare-fun b!1064247 () Bool)

(declare-fun e!606393 () Bool)

(assert (=> b!1064247 (= e!606392 (and e!606393 mapRes!39523))))

(declare-fun condMapEmpty!39523 () Bool)

(declare-fun mapDefault!39523 () ValueCell!11912)

(assert (=> b!1064247 (= condMapEmpty!39523 (= (arr!32453 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11912)) mapDefault!39523)))))

(declare-fun b!1064248 () Bool)

(assert (=> b!1064248 (= e!606393 tp_is_empty!25231)))

(declare-fun b!1064249 () Bool)

(declare-fun res!710228 () Bool)

(assert (=> b!1064249 (=> (not res!710228) (not e!606395))))

(declare-datatypes ((List!22592 0))(
  ( (Nil!22589) (Cons!22588 (h!23806 (_ BitVec 64)) (t!31897 List!22592)) )
))
(declare-fun arrayNoDuplicates!0 (array!67509 (_ BitVec 32) List!22592) Bool)

(assert (=> b!1064249 (= res!710228 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22589))))

(declare-fun b!1064250 () Bool)

(declare-fun res!710226 () Bool)

(assert (=> b!1064250 (=> (not res!710226) (not e!606395))))

(assert (=> b!1064250 (= res!710226 (and (= (size!32990 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32991 _keys!1163) (size!32990 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064251 () Bool)

(assert (=> b!1064251 (= e!606396 true)))

(declare-fun -!573 (ListLongMap!13989 (_ BitVec 64)) ListLongMap!13989)

(assert (=> b!1064251 (= (-!573 lt!468919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468919)))

(declare-fun lt!468920 () Unit!34825)

(declare-fun removeNotPresentStillSame!24 (ListLongMap!13989 (_ BitVec 64)) Unit!34825)

(assert (=> b!1064251 (= lt!468920 (removeNotPresentStillSame!24 lt!468919 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064252 () Bool)

(assert (=> b!1064252 (= e!606398 tp_is_empty!25231)))

(assert (= (and start!94220 res!710227) b!1064250))

(assert (= (and b!1064250 res!710226) b!1064246))

(assert (= (and b!1064246 res!710225) b!1064249))

(assert (= (and b!1064249 res!710228) b!1064244))

(assert (= (and b!1064244 (not res!710224)) b!1064245))

(assert (= (and b!1064245 (not res!710229)) b!1064251))

(assert (= (and b!1064247 condMapEmpty!39523) mapIsEmpty!39523))

(assert (= (and b!1064247 (not condMapEmpty!39523)) mapNonEmpty!39523))

(get-info :version)

(assert (= (and mapNonEmpty!39523 ((_ is ValueCellFull!11912) mapValue!39523)) b!1064252))

(assert (= (and b!1064247 ((_ is ValueCellFull!11912) mapDefault!39523)) b!1064248))

(assert (= start!94220 b!1064247))

(declare-fun m!983299 () Bool)

(assert (=> start!94220 m!983299))

(declare-fun m!983301 () Bool)

(assert (=> start!94220 m!983301))

(declare-fun m!983303 () Bool)

(assert (=> start!94220 m!983303))

(declare-fun m!983305 () Bool)

(assert (=> b!1064251 m!983305))

(declare-fun m!983307 () Bool)

(assert (=> b!1064251 m!983307))

(declare-fun m!983309 () Bool)

(assert (=> mapNonEmpty!39523 m!983309))

(declare-fun m!983311 () Bool)

(assert (=> b!1064244 m!983311))

(declare-fun m!983313 () Bool)

(assert (=> b!1064244 m!983313))

(declare-fun m!983315 () Bool)

(assert (=> b!1064244 m!983315))

(declare-fun m!983317 () Bool)

(assert (=> b!1064245 m!983317))

(declare-fun m!983319 () Bool)

(assert (=> b!1064245 m!983319))

(declare-fun m!983321 () Bool)

(assert (=> b!1064249 m!983321))

(declare-fun m!983323 () Bool)

(assert (=> b!1064246 m!983323))

(check-sat (not mapNonEmpty!39523) (not b!1064251) (not b!1064249) tp_is_empty!25231 b_and!34163 (not start!94220) (not b!1064245) (not b_next!21421) (not b!1064246) (not b!1064244))
(check-sat b_and!34163 (not b_next!21421))
