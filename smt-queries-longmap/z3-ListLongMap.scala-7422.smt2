; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94362 () Bool)

(assert start!94362)

(declare-fun b_free!21709 () Bool)

(declare-fun b_next!21709 () Bool)

(assert (=> start!94362 (= b_free!21709 (not b_next!21709))))

(declare-fun tp!76571 () Bool)

(declare-fun b_and!34467 () Bool)

(assert (=> start!94362 (= tp!76571 b_and!34467)))

(declare-fun mapIsEmpty!39970 () Bool)

(declare-fun mapRes!39970 () Bool)

(assert (=> mapIsEmpty!39970 mapRes!39970))

(declare-fun b!1066947 () Bool)

(declare-fun e!608496 () Bool)

(declare-fun e!608494 () Bool)

(assert (=> b!1066947 (= e!608496 (and e!608494 mapRes!39970))))

(declare-fun condMapEmpty!39970 () Bool)

(declare-datatypes ((V!39161 0))(
  ( (V!39162 (val!12810 Int)) )
))
(declare-datatypes ((ValueCell!12056 0))(
  ( (ValueCellFull!12056 (v!15423 V!39161)) (EmptyCell!12056) )
))
(declare-datatypes ((array!67966 0))(
  ( (array!67967 (arr!32684 (Array (_ BitVec 32) ValueCell!12056)) (size!33222 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67966)

(declare-fun mapDefault!39970 () ValueCell!12056)

(assert (=> b!1066947 (= condMapEmpty!39970 (= (arr!32684 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12056)) mapDefault!39970)))))

(declare-fun b!1066949 () Bool)

(declare-fun res!712077 () Bool)

(declare-fun e!608492 () Bool)

(assert (=> b!1066949 (=> (not res!712077) (not e!608492))))

(declare-datatypes ((array!67968 0))(
  ( (array!67969 (arr!32685 (Array (_ BitVec 32) (_ BitVec 64))) (size!33223 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67968)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67968 (_ BitVec 32)) Bool)

(assert (=> b!1066949 (= res!712077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39970 () Bool)

(declare-fun tp!76570 () Bool)

(declare-fun e!608495 () Bool)

(assert (=> mapNonEmpty!39970 (= mapRes!39970 (and tp!76570 e!608495))))

(declare-fun mapValue!39970 () ValueCell!12056)

(declare-fun mapKey!39970 () (_ BitVec 32))

(declare-fun mapRest!39970 () (Array (_ BitVec 32) ValueCell!12056))

(assert (=> mapNonEmpty!39970 (= (arr!32684 _values!955) (store mapRest!39970 mapKey!39970 mapValue!39970))))

(declare-fun b!1066950 () Bool)

(declare-fun tp_is_empty!25519 () Bool)

(assert (=> b!1066950 (= e!608494 tp_is_empty!25519)))

(declare-fun b!1066951 () Bool)

(assert (=> b!1066951 (= e!608495 tp_is_empty!25519)))

(declare-fun b!1066948 () Bool)

(declare-fun res!712079 () Bool)

(assert (=> b!1066948 (=> (not res!712079) (not e!608492))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066948 (= res!712079 (and (= (size!33222 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33223 _keys!1163) (size!33222 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!712078 () Bool)

(assert (=> start!94362 (=> (not res!712078) (not e!608492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94362 (= res!712078 (validMask!0 mask!1515))))

(assert (=> start!94362 e!608492))

(assert (=> start!94362 true))

(assert (=> start!94362 tp_is_empty!25519))

(declare-fun array_inv!25304 (array!67966) Bool)

(assert (=> start!94362 (and (array_inv!25304 _values!955) e!608496)))

(assert (=> start!94362 tp!76571))

(declare-fun array_inv!25305 (array!67968) Bool)

(assert (=> start!94362 (array_inv!25305 _keys!1163)))

(declare-fun b!1066952 () Bool)

(assert (=> b!1066952 (= e!608492 (not true))))

(declare-datatypes ((tuple2!16304 0))(
  ( (tuple2!16305 (_1!8163 (_ BitVec 64)) (_2!8163 V!39161)) )
))
(declare-datatypes ((List!22847 0))(
  ( (Nil!22844) (Cons!22843 (h!24052 tuple2!16304) (t!32161 List!22847)) )
))
(declare-datatypes ((ListLongMap!14273 0))(
  ( (ListLongMap!14274 (toList!7152 List!22847)) )
))
(declare-fun lt!471101 () ListLongMap!14273)

(declare-fun lt!471103 () ListLongMap!14273)

(assert (=> b!1066952 (= lt!471101 lt!471103)))

(declare-fun zeroValueBefore!47 () V!39161)

(declare-datatypes ((Unit!34894 0))(
  ( (Unit!34895) )
))
(declare-fun lt!471102 () Unit!34894)

(declare-fun minValue!907 () V!39161)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39161)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!742 (array!67968 array!67966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39161 V!39161 V!39161 V!39161 (_ BitVec 32) Int) Unit!34894)

(assert (=> b!1066952 (= lt!471102 (lemmaNoChangeToArrayThenSameMapNoExtras!742 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3748 (array!67968 array!67966 (_ BitVec 32) (_ BitVec 32) V!39161 V!39161 (_ BitVec 32) Int) ListLongMap!14273)

(assert (=> b!1066952 (= lt!471103 (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066952 (= lt!471101 (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066953 () Bool)

(declare-fun res!712076 () Bool)

(assert (=> b!1066953 (=> (not res!712076) (not e!608492))))

(declare-datatypes ((List!22848 0))(
  ( (Nil!22845) (Cons!22844 (h!24053 (_ BitVec 64)) (t!32162 List!22848)) )
))
(declare-fun arrayNoDuplicates!0 (array!67968 (_ BitVec 32) List!22848) Bool)

(assert (=> b!1066953 (= res!712076 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22845))))

(assert (= (and start!94362 res!712078) b!1066948))

(assert (= (and b!1066948 res!712079) b!1066949))

(assert (= (and b!1066949 res!712077) b!1066953))

(assert (= (and b!1066953 res!712076) b!1066952))

(assert (= (and b!1066947 condMapEmpty!39970) mapIsEmpty!39970))

(assert (= (and b!1066947 (not condMapEmpty!39970)) mapNonEmpty!39970))

(get-info :version)

(assert (= (and mapNonEmpty!39970 ((_ is ValueCellFull!12056) mapValue!39970)) b!1066951))

(assert (= (and b!1066947 ((_ is ValueCellFull!12056) mapDefault!39970)) b!1066950))

(assert (= start!94362 b!1066947))

(declare-fun m!985183 () Bool)

(assert (=> b!1066949 m!985183))

(declare-fun m!985185 () Bool)

(assert (=> mapNonEmpty!39970 m!985185))

(declare-fun m!985187 () Bool)

(assert (=> b!1066953 m!985187))

(declare-fun m!985189 () Bool)

(assert (=> start!94362 m!985189))

(declare-fun m!985191 () Bool)

(assert (=> start!94362 m!985191))

(declare-fun m!985193 () Bool)

(assert (=> start!94362 m!985193))

(declare-fun m!985195 () Bool)

(assert (=> b!1066952 m!985195))

(declare-fun m!985197 () Bool)

(assert (=> b!1066952 m!985197))

(declare-fun m!985199 () Bool)

(assert (=> b!1066952 m!985199))

(check-sat b_and!34467 (not b!1066953) (not b!1066949) tp_is_empty!25519 (not mapNonEmpty!39970) (not start!94362) (not b!1066952) (not b_next!21709))
(check-sat b_and!34467 (not b_next!21709))
