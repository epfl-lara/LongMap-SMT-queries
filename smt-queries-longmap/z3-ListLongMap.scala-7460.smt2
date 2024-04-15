; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94662 () Bool)

(assert start!94662)

(declare-fun b_free!21937 () Bool)

(declare-fun b_next!21937 () Bool)

(assert (=> start!94662 (= b_free!21937 (not b_next!21937))))

(declare-fun tp!77266 () Bool)

(declare-fun b_and!34731 () Bool)

(assert (=> start!94662 (= tp!77266 b_and!34731)))

(declare-fun b!1070196 () Bool)

(declare-fun res!714002 () Bool)

(declare-fun e!610886 () Bool)

(assert (=> b!1070196 (=> (not res!714002) (not e!610886))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39465 0))(
  ( (V!39466 (val!12924 Int)) )
))
(declare-datatypes ((ValueCell!12170 0))(
  ( (ValueCellFull!12170 (v!15539 V!39465)) (EmptyCell!12170) )
))
(declare-datatypes ((array!68408 0))(
  ( (array!68409 (arr!32901 (Array (_ BitVec 32) ValueCell!12170)) (size!33439 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68408)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68410 0))(
  ( (array!68411 (arr!32902 (Array (_ BitVec 32) (_ BitVec 64))) (size!33440 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68410)

(assert (=> b!1070196 (= res!714002 (and (= (size!33439 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33440 _keys!1163) (size!33439 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!714003 () Bool)

(assert (=> start!94662 (=> (not res!714003) (not e!610886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94662 (= res!714003 (validMask!0 mask!1515))))

(assert (=> start!94662 e!610886))

(assert (=> start!94662 true))

(declare-fun tp_is_empty!25747 () Bool)

(assert (=> start!94662 tp_is_empty!25747))

(declare-fun e!610888 () Bool)

(declare-fun array_inv!25452 (array!68408) Bool)

(assert (=> start!94662 (and (array_inv!25452 _values!955) e!610888)))

(assert (=> start!94662 tp!77266))

(declare-fun array_inv!25453 (array!68410) Bool)

(assert (=> start!94662 (array_inv!25453 _keys!1163)))

(declare-fun mapNonEmpty!40324 () Bool)

(declare-fun mapRes!40324 () Bool)

(declare-fun tp!77267 () Bool)

(declare-fun e!610883 () Bool)

(assert (=> mapNonEmpty!40324 (= mapRes!40324 (and tp!77267 e!610883))))

(declare-fun mapKey!40324 () (_ BitVec 32))

(declare-fun mapRest!40324 () (Array (_ BitVec 32) ValueCell!12170))

(declare-fun mapValue!40324 () ValueCell!12170)

(assert (=> mapNonEmpty!40324 (= (arr!32901 _values!955) (store mapRest!40324 mapKey!40324 mapValue!40324))))

(declare-fun b!1070197 () Bool)

(declare-fun e!610884 () Bool)

(assert (=> b!1070197 (= e!610888 (and e!610884 mapRes!40324))))

(declare-fun condMapEmpty!40324 () Bool)

(declare-fun mapDefault!40324 () ValueCell!12170)

(assert (=> b!1070197 (= condMapEmpty!40324 (= (arr!32901 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12170)) mapDefault!40324)))))

(declare-fun b!1070198 () Bool)

(assert (=> b!1070198 (= e!610883 tp_is_empty!25747)))

(declare-fun b!1070199 () Bool)

(declare-fun res!714000 () Bool)

(assert (=> b!1070199 (=> (not res!714000) (not e!610886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68410 (_ BitVec 32)) Bool)

(assert (=> b!1070199 (= res!714000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070200 () Bool)

(assert (=> b!1070200 (= e!610884 tp_is_empty!25747)))

(declare-fun b!1070201 () Bool)

(declare-fun res!713999 () Bool)

(assert (=> b!1070201 (=> (not res!713999) (not e!610886))))

(declare-datatypes ((List!23015 0))(
  ( (Nil!23012) (Cons!23011 (h!24220 (_ BitVec 64)) (t!32337 List!23015)) )
))
(declare-fun arrayNoDuplicates!0 (array!68410 (_ BitVec 32) List!23015) Bool)

(assert (=> b!1070201 (= res!713999 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23012))))

(declare-fun mapIsEmpty!40324 () Bool)

(assert (=> mapIsEmpty!40324 mapRes!40324))

(declare-fun b!1070202 () Bool)

(declare-fun e!610885 () Bool)

(assert (=> b!1070202 (= e!610885 true)))

(declare-fun zeroValueBefore!47 () V!39465)

(declare-datatypes ((tuple2!16486 0))(
  ( (tuple2!16487 (_1!8254 (_ BitVec 64)) (_2!8254 V!39465)) )
))
(declare-datatypes ((List!23016 0))(
  ( (Nil!23013) (Cons!23012 (h!24221 tuple2!16486) (t!32338 List!23016)) )
))
(declare-datatypes ((ListLongMap!14455 0))(
  ( (ListLongMap!14456 (toList!7243 List!23016)) )
))
(declare-fun lt!472829 () ListLongMap!14455)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39465)

(declare-fun getCurrentListMap!4058 (array!68410 array!68408 (_ BitVec 32) (_ BitVec 32) V!39465 V!39465 (_ BitVec 32) Int) ListLongMap!14455)

(assert (=> b!1070202 (= lt!472829 (getCurrentListMap!4058 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070203 () Bool)

(assert (=> b!1070203 (= e!610886 (not e!610885))))

(declare-fun res!714001 () Bool)

(assert (=> b!1070203 (=> res!714001 e!610885)))

(assert (=> b!1070203 (= res!714001 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!472828 () ListLongMap!14455)

(declare-fun lt!472826 () ListLongMap!14455)

(assert (=> b!1070203 (= lt!472828 lt!472826)))

(declare-datatypes ((Unit!35072 0))(
  ( (Unit!35073) )
))
(declare-fun lt!472827 () Unit!35072)

(declare-fun zeroValueAfter!47 () V!39465)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!825 (array!68410 array!68408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39465 V!39465 V!39465 V!39465 (_ BitVec 32) Int) Unit!35072)

(assert (=> b!1070203 (= lt!472827 (lemmaNoChangeToArrayThenSameMapNoExtras!825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3831 (array!68410 array!68408 (_ BitVec 32) (_ BitVec 32) V!39465 V!39465 (_ BitVec 32) Int) ListLongMap!14455)

(assert (=> b!1070203 (= lt!472826 (getCurrentListMapNoExtraKeys!3831 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070203 (= lt!472828 (getCurrentListMapNoExtraKeys!3831 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94662 res!714003) b!1070196))

(assert (= (and b!1070196 res!714002) b!1070199))

(assert (= (and b!1070199 res!714000) b!1070201))

(assert (= (and b!1070201 res!713999) b!1070203))

(assert (= (and b!1070203 (not res!714001)) b!1070202))

(assert (= (and b!1070197 condMapEmpty!40324) mapIsEmpty!40324))

(assert (= (and b!1070197 (not condMapEmpty!40324)) mapNonEmpty!40324))

(get-info :version)

(assert (= (and mapNonEmpty!40324 ((_ is ValueCellFull!12170) mapValue!40324)) b!1070198))

(assert (= (and b!1070197 ((_ is ValueCellFull!12170) mapDefault!40324)) b!1070200))

(assert (= start!94662 b!1070197))

(declare-fun m!988087 () Bool)

(assert (=> b!1070202 m!988087))

(declare-fun m!988089 () Bool)

(assert (=> start!94662 m!988089))

(declare-fun m!988091 () Bool)

(assert (=> start!94662 m!988091))

(declare-fun m!988093 () Bool)

(assert (=> start!94662 m!988093))

(declare-fun m!988095 () Bool)

(assert (=> b!1070203 m!988095))

(declare-fun m!988097 () Bool)

(assert (=> b!1070203 m!988097))

(declare-fun m!988099 () Bool)

(assert (=> b!1070203 m!988099))

(declare-fun m!988101 () Bool)

(assert (=> b!1070199 m!988101))

(declare-fun m!988103 () Bool)

(assert (=> b!1070201 m!988103))

(declare-fun m!988105 () Bool)

(assert (=> mapNonEmpty!40324 m!988105))

(check-sat b_and!34731 tp_is_empty!25747 (not b_next!21937) (not mapNonEmpty!40324) (not b!1070203) (not b!1070201) (not b!1070199) (not start!94662) (not b!1070202))
(check-sat b_and!34731 (not b_next!21937))
