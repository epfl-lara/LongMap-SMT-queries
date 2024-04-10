; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94614 () Bool)

(assert start!94614)

(declare-fun b_free!21897 () Bool)

(declare-fun b_next!21897 () Bool)

(assert (=> start!94614 (= b_free!21897 (not b_next!21897))))

(declare-fun tp!77144 () Bool)

(declare-fun b_and!34709 () Bool)

(assert (=> start!94614 (= tp!77144 b_and!34709)))

(declare-fun b!1069806 () Bool)

(declare-fun res!713760 () Bool)

(declare-fun e!610586 () Bool)

(assert (=> b!1069806 (=> (not res!713760) (not e!610586))))

(declare-datatypes ((array!68391 0))(
  ( (array!68392 (arr!32893 (Array (_ BitVec 32) (_ BitVec 64))) (size!33429 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68391)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68391 (_ BitVec 32)) Bool)

(assert (=> b!1069806 (= res!713760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40261 () Bool)

(declare-fun mapRes!40261 () Bool)

(assert (=> mapIsEmpty!40261 mapRes!40261))

(declare-fun b!1069807 () Bool)

(assert (=> b!1069807 (= e!610586 (not true))))

(declare-datatypes ((V!39411 0))(
  ( (V!39412 (val!12904 Int)) )
))
(declare-datatypes ((tuple2!16402 0))(
  ( (tuple2!16403 (_1!8212 (_ BitVec 64)) (_2!8212 V!39411)) )
))
(declare-datatypes ((List!22946 0))(
  ( (Nil!22943) (Cons!22942 (h!24151 tuple2!16402) (t!32275 List!22946)) )
))
(declare-datatypes ((ListLongMap!14371 0))(
  ( (ListLongMap!14372 (toList!7201 List!22946)) )
))
(declare-fun lt!472768 () ListLongMap!14371)

(declare-fun lt!472770 () ListLongMap!14371)

(assert (=> b!1069807 (= lt!472768 lt!472770)))

(declare-fun zeroValueBefore!47 () V!39411)

(declare-datatypes ((Unit!35201 0))(
  ( (Unit!35202) )
))
(declare-fun lt!472769 () Unit!35201)

(declare-fun minValue!907 () V!39411)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12150 0))(
  ( (ValueCellFull!12150 (v!15520 V!39411)) (EmptyCell!12150) )
))
(declare-datatypes ((array!68393 0))(
  ( (array!68394 (arr!32894 (Array (_ BitVec 32) ValueCell!12150)) (size!33430 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68393)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39411)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!814 (array!68391 array!68393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39411 V!39411 V!39411 V!39411 (_ BitVec 32) Int) Unit!35201)

(assert (=> b!1069807 (= lt!472769 (lemmaNoChangeToArrayThenSameMapNoExtras!814 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3777 (array!68391 array!68393 (_ BitVec 32) (_ BitVec 32) V!39411 V!39411 (_ BitVec 32) Int) ListLongMap!14371)

(assert (=> b!1069807 (= lt!472770 (getCurrentListMapNoExtraKeys!3777 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069807 (= lt!472768 (getCurrentListMapNoExtraKeys!3777 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40261 () Bool)

(declare-fun tp!77143 () Bool)

(declare-fun e!610585 () Bool)

(assert (=> mapNonEmpty!40261 (= mapRes!40261 (and tp!77143 e!610585))))

(declare-fun mapKey!40261 () (_ BitVec 32))

(declare-fun mapValue!40261 () ValueCell!12150)

(declare-fun mapRest!40261 () (Array (_ BitVec 32) ValueCell!12150))

(assert (=> mapNonEmpty!40261 (= (arr!32894 _values!955) (store mapRest!40261 mapKey!40261 mapValue!40261))))

(declare-fun res!713762 () Bool)

(assert (=> start!94614 (=> (not res!713762) (not e!610586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94614 (= res!713762 (validMask!0 mask!1515))))

(assert (=> start!94614 e!610586))

(assert (=> start!94614 true))

(declare-fun tp_is_empty!25707 () Bool)

(assert (=> start!94614 tp_is_empty!25707))

(declare-fun e!610583 () Bool)

(declare-fun array_inv!25448 (array!68393) Bool)

(assert (=> start!94614 (and (array_inv!25448 _values!955) e!610583)))

(assert (=> start!94614 tp!77144))

(declare-fun array_inv!25449 (array!68391) Bool)

(assert (=> start!94614 (array_inv!25449 _keys!1163)))

(declare-fun b!1069808 () Bool)

(assert (=> b!1069808 (= e!610585 tp_is_empty!25707)))

(declare-fun b!1069809 () Bool)

(declare-fun e!610587 () Bool)

(assert (=> b!1069809 (= e!610587 tp_is_empty!25707)))

(declare-fun b!1069810 () Bool)

(declare-fun res!713759 () Bool)

(assert (=> b!1069810 (=> (not res!713759) (not e!610586))))

(declare-datatypes ((List!22947 0))(
  ( (Nil!22944) (Cons!22943 (h!24152 (_ BitVec 64)) (t!32276 List!22947)) )
))
(declare-fun arrayNoDuplicates!0 (array!68391 (_ BitVec 32) List!22947) Bool)

(assert (=> b!1069810 (= res!713759 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22944))))

(declare-fun b!1069811 () Bool)

(declare-fun res!713761 () Bool)

(assert (=> b!1069811 (=> (not res!713761) (not e!610586))))

(assert (=> b!1069811 (= res!713761 (and (= (size!33430 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33429 _keys!1163) (size!33430 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069812 () Bool)

(assert (=> b!1069812 (= e!610583 (and e!610587 mapRes!40261))))

(declare-fun condMapEmpty!40261 () Bool)

(declare-fun mapDefault!40261 () ValueCell!12150)

(assert (=> b!1069812 (= condMapEmpty!40261 (= (arr!32894 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12150)) mapDefault!40261)))))

(assert (= (and start!94614 res!713762) b!1069811))

(assert (= (and b!1069811 res!713761) b!1069806))

(assert (= (and b!1069806 res!713760) b!1069810))

(assert (= (and b!1069810 res!713759) b!1069807))

(assert (= (and b!1069812 condMapEmpty!40261) mapIsEmpty!40261))

(assert (= (and b!1069812 (not condMapEmpty!40261)) mapNonEmpty!40261))

(get-info :version)

(assert (= (and mapNonEmpty!40261 ((_ is ValueCellFull!12150) mapValue!40261)) b!1069808))

(assert (= (and b!1069812 ((_ is ValueCellFull!12150) mapDefault!40261)) b!1069809))

(assert (= start!94614 b!1069812))

(declare-fun m!988263 () Bool)

(assert (=> b!1069807 m!988263))

(declare-fun m!988265 () Bool)

(assert (=> b!1069807 m!988265))

(declare-fun m!988267 () Bool)

(assert (=> b!1069807 m!988267))

(declare-fun m!988269 () Bool)

(assert (=> b!1069806 m!988269))

(declare-fun m!988271 () Bool)

(assert (=> mapNonEmpty!40261 m!988271))

(declare-fun m!988273 () Bool)

(assert (=> start!94614 m!988273))

(declare-fun m!988275 () Bool)

(assert (=> start!94614 m!988275))

(declare-fun m!988277 () Bool)

(assert (=> start!94614 m!988277))

(declare-fun m!988279 () Bool)

(assert (=> b!1069810 m!988279))

(check-sat tp_is_empty!25707 (not start!94614) (not mapNonEmpty!40261) (not b!1069806) b_and!34709 (not b!1069810) (not b_next!21897) (not b!1069807))
(check-sat b_and!34709 (not b_next!21897))
