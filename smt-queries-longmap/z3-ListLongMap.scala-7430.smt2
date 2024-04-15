; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94424 () Bool)

(assert start!94424)

(declare-fun b_free!21757 () Bool)

(declare-fun b_next!21757 () Bool)

(assert (=> start!94424 (= b_free!21757 (not b_next!21757))))

(declare-fun tp!76718 () Bool)

(declare-fun b_and!34523 () Bool)

(assert (=> start!94424 (= tp!76718 b_and!34523)))

(declare-fun b!1067567 () Bool)

(declare-fun e!608944 () Bool)

(declare-fun tp_is_empty!25567 () Bool)

(assert (=> b!1067567 (= e!608944 tp_is_empty!25567)))

(declare-fun mapIsEmpty!40045 () Bool)

(declare-fun mapRes!40045 () Bool)

(assert (=> mapIsEmpty!40045 mapRes!40045))

(declare-fun b!1067568 () Bool)

(declare-fun res!712431 () Bool)

(declare-fun e!608938 () Bool)

(assert (=> b!1067568 (=> (not res!712431) (not e!608938))))

(declare-datatypes ((array!68062 0))(
  ( (array!68063 (arr!32731 (Array (_ BitVec 32) (_ BitVec 64))) (size!33269 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68062)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68062 (_ BitVec 32)) Bool)

(assert (=> b!1067568 (= res!712431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!712427 () Bool)

(assert (=> start!94424 (=> (not res!712427) (not e!608938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94424 (= res!712427 (validMask!0 mask!1515))))

(assert (=> start!94424 e!608938))

(assert (=> start!94424 true))

(assert (=> start!94424 tp_is_empty!25567))

(declare-datatypes ((V!39225 0))(
  ( (V!39226 (val!12834 Int)) )
))
(declare-datatypes ((ValueCell!12080 0))(
  ( (ValueCellFull!12080 (v!15447 V!39225)) (EmptyCell!12080) )
))
(declare-datatypes ((array!68064 0))(
  ( (array!68065 (arr!32732 (Array (_ BitVec 32) ValueCell!12080)) (size!33270 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68064)

(declare-fun e!608941 () Bool)

(declare-fun array_inv!25336 (array!68064) Bool)

(assert (=> start!94424 (and (array_inv!25336 _values!955) e!608941)))

(assert (=> start!94424 tp!76718))

(declare-fun array_inv!25337 (array!68062) Bool)

(assert (=> start!94424 (array_inv!25337 _keys!1163)))

(declare-fun b!1067569 () Bool)

(assert (=> b!1067569 (= e!608941 (and e!608944 mapRes!40045))))

(declare-fun condMapEmpty!40045 () Bool)

(declare-fun mapDefault!40045 () ValueCell!12080)

(assert (=> b!1067569 (= condMapEmpty!40045 (= (arr!32732 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12080)) mapDefault!40045)))))

(declare-fun b!1067570 () Bool)

(declare-fun e!608939 () Bool)

(assert (=> b!1067570 (= e!608939 true)))

(declare-datatypes ((tuple2!16346 0))(
  ( (tuple2!16347 (_1!8184 (_ BitVec 64)) (_2!8184 V!39225)) )
))
(declare-datatypes ((List!22887 0))(
  ( (Nil!22884) (Cons!22883 (h!24092 tuple2!16346) (t!32203 List!22887)) )
))
(declare-datatypes ((ListLongMap!14315 0))(
  ( (ListLongMap!14316 (toList!7173 List!22887)) )
))
(declare-fun lt!471388 () ListLongMap!14315)

(declare-fun -!620 (ListLongMap!14315 (_ BitVec 64)) ListLongMap!14315)

(assert (=> b!1067570 (= (-!620 lt!471388 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471388)))

(declare-datatypes ((Unit!34936 0))(
  ( (Unit!34937) )
))
(declare-fun lt!471391 () Unit!34936)

(declare-fun removeNotPresentStillSame!37 (ListLongMap!14315 (_ BitVec 64)) Unit!34936)

(assert (=> b!1067570 (= lt!471391 (removeNotPresentStillSame!37 lt!471388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067571 () Bool)

(declare-fun res!712428 () Bool)

(assert (=> b!1067571 (=> (not res!712428) (not e!608938))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067571 (= res!712428 (and (= (size!33270 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33269 _keys!1163) (size!33270 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067572 () Bool)

(declare-fun res!712430 () Bool)

(assert (=> b!1067572 (=> (not res!712430) (not e!608938))))

(declare-datatypes ((List!22888 0))(
  ( (Nil!22885) (Cons!22884 (h!24093 (_ BitVec 64)) (t!32204 List!22888)) )
))
(declare-fun arrayNoDuplicates!0 (array!68062 (_ BitVec 32) List!22888) Bool)

(assert (=> b!1067572 (= res!712430 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22885))))

(declare-fun b!1067573 () Bool)

(declare-fun e!608940 () Bool)

(assert (=> b!1067573 (= e!608938 (not e!608940))))

(declare-fun res!712426 () Bool)

(assert (=> b!1067573 (=> res!712426 e!608940)))

(assert (=> b!1067573 (= res!712426 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471390 () ListLongMap!14315)

(declare-fun lt!471392 () ListLongMap!14315)

(assert (=> b!1067573 (= lt!471390 lt!471392)))

(declare-fun zeroValueBefore!47 () V!39225)

(declare-fun minValue!907 () V!39225)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39225)

(declare-fun lt!471389 () Unit!34936)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!763 (array!68062 array!68064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39225 V!39225 V!39225 V!39225 (_ BitVec 32) Int) Unit!34936)

(assert (=> b!1067573 (= lt!471389 (lemmaNoChangeToArrayThenSameMapNoExtras!763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3769 (array!68062 array!68064 (_ BitVec 32) (_ BitVec 32) V!39225 V!39225 (_ BitVec 32) Int) ListLongMap!14315)

(assert (=> b!1067573 (= lt!471392 (getCurrentListMapNoExtraKeys!3769 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067573 (= lt!471390 (getCurrentListMapNoExtraKeys!3769 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40045 () Bool)

(declare-fun tp!76717 () Bool)

(declare-fun e!608942 () Bool)

(assert (=> mapNonEmpty!40045 (= mapRes!40045 (and tp!76717 e!608942))))

(declare-fun mapRest!40045 () (Array (_ BitVec 32) ValueCell!12080))

(declare-fun mapKey!40045 () (_ BitVec 32))

(declare-fun mapValue!40045 () ValueCell!12080)

(assert (=> mapNonEmpty!40045 (= (arr!32732 _values!955) (store mapRest!40045 mapKey!40045 mapValue!40045))))

(declare-fun b!1067574 () Bool)

(assert (=> b!1067574 (= e!608942 tp_is_empty!25567)))

(declare-fun b!1067575 () Bool)

(assert (=> b!1067575 (= e!608940 e!608939)))

(declare-fun res!712429 () Bool)

(assert (=> b!1067575 (=> res!712429 e!608939)))

(declare-fun contains!6250 (ListLongMap!14315 (_ BitVec 64)) Bool)

(assert (=> b!1067575 (= res!712429 (contains!6250 lt!471388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4019 (array!68062 array!68064 (_ BitVec 32) (_ BitVec 32) V!39225 V!39225 (_ BitVec 32) Int) ListLongMap!14315)

(assert (=> b!1067575 (= lt!471388 (getCurrentListMap!4019 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94424 res!712427) b!1067571))

(assert (= (and b!1067571 res!712428) b!1067568))

(assert (= (and b!1067568 res!712431) b!1067572))

(assert (= (and b!1067572 res!712430) b!1067573))

(assert (= (and b!1067573 (not res!712426)) b!1067575))

(assert (= (and b!1067575 (not res!712429)) b!1067570))

(assert (= (and b!1067569 condMapEmpty!40045) mapIsEmpty!40045))

(assert (= (and b!1067569 (not condMapEmpty!40045)) mapNonEmpty!40045))

(get-info :version)

(assert (= (and mapNonEmpty!40045 ((_ is ValueCellFull!12080) mapValue!40045)) b!1067574))

(assert (= (and b!1067569 ((_ is ValueCellFull!12080) mapDefault!40045)) b!1067567))

(assert (= start!94424 b!1067569))

(declare-fun m!985717 () Bool)

(assert (=> b!1067573 m!985717))

(declare-fun m!985719 () Bool)

(assert (=> b!1067573 m!985719))

(declare-fun m!985721 () Bool)

(assert (=> b!1067573 m!985721))

(declare-fun m!985723 () Bool)

(assert (=> b!1067575 m!985723))

(declare-fun m!985725 () Bool)

(assert (=> b!1067575 m!985725))

(declare-fun m!985727 () Bool)

(assert (=> b!1067570 m!985727))

(declare-fun m!985729 () Bool)

(assert (=> b!1067570 m!985729))

(declare-fun m!985731 () Bool)

(assert (=> start!94424 m!985731))

(declare-fun m!985733 () Bool)

(assert (=> start!94424 m!985733))

(declare-fun m!985735 () Bool)

(assert (=> start!94424 m!985735))

(declare-fun m!985737 () Bool)

(assert (=> b!1067568 m!985737))

(declare-fun m!985739 () Bool)

(assert (=> b!1067572 m!985739))

(declare-fun m!985741 () Bool)

(assert (=> mapNonEmpty!40045 m!985741))

(check-sat (not b!1067570) (not b!1067572) (not mapNonEmpty!40045) (not b!1067575) b_and!34523 (not start!94424) (not b!1067573) (not b_next!21757) (not b!1067568) tp_is_empty!25567)
(check-sat b_and!34523 (not b_next!21757))
