; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94460 () Bool)

(assert start!94460)

(declare-fun b_free!21793 () Bool)

(declare-fun b_next!21793 () Bool)

(assert (=> start!94460 (= b_free!21793 (not b_next!21793))))

(declare-fun tp!76825 () Bool)

(declare-fun b_and!34559 () Bool)

(assert (=> start!94460 (= tp!76825 b_and!34559)))

(declare-fun b!1068053 () Bool)

(declare-fun res!712754 () Bool)

(declare-fun e!609318 () Bool)

(assert (=> b!1068053 (=> (not res!712754) (not e!609318))))

(declare-datatypes ((array!68128 0))(
  ( (array!68129 (arr!32764 (Array (_ BitVec 32) (_ BitVec 64))) (size!33302 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68128)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68128 (_ BitVec 32)) Bool)

(assert (=> b!1068053 (= res!712754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068054 () Bool)

(declare-fun e!609320 () Bool)

(declare-fun tp_is_empty!25603 () Bool)

(assert (=> b!1068054 (= e!609320 tp_is_empty!25603)))

(declare-fun b!1068055 () Bool)

(declare-fun e!609322 () Bool)

(declare-fun e!609321 () Bool)

(declare-fun mapRes!40099 () Bool)

(assert (=> b!1068055 (= e!609322 (and e!609321 mapRes!40099))))

(declare-fun condMapEmpty!40099 () Bool)

(declare-datatypes ((V!39273 0))(
  ( (V!39274 (val!12852 Int)) )
))
(declare-datatypes ((ValueCell!12098 0))(
  ( (ValueCellFull!12098 (v!15465 V!39273)) (EmptyCell!12098) )
))
(declare-datatypes ((array!68130 0))(
  ( (array!68131 (arr!32765 (Array (_ BitVec 32) ValueCell!12098)) (size!33303 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68130)

(declare-fun mapDefault!40099 () ValueCell!12098)

(assert (=> b!1068055 (= condMapEmpty!40099 (= (arr!32765 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12098)) mapDefault!40099)))))

(declare-fun b!1068056 () Bool)

(declare-fun res!712755 () Bool)

(assert (=> b!1068056 (=> (not res!712755) (not e!609318))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068056 (= res!712755 (and (= (size!33303 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33302 _keys!1163) (size!33303 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!712751 () Bool)

(assert (=> start!94460 (=> (not res!712751) (not e!609318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94460 (= res!712751 (validMask!0 mask!1515))))

(assert (=> start!94460 e!609318))

(assert (=> start!94460 true))

(assert (=> start!94460 tp_is_empty!25603))

(declare-fun array_inv!25362 (array!68130) Bool)

(assert (=> start!94460 (and (array_inv!25362 _values!955) e!609322)))

(assert (=> start!94460 tp!76825))

(declare-fun array_inv!25363 (array!68128) Bool)

(assert (=> start!94460 (array_inv!25363 _keys!1163)))

(declare-fun mapNonEmpty!40099 () Bool)

(declare-fun tp!76826 () Bool)

(assert (=> mapNonEmpty!40099 (= mapRes!40099 (and tp!76826 e!609320))))

(declare-fun mapValue!40099 () ValueCell!12098)

(declare-fun mapRest!40099 () (Array (_ BitVec 32) ValueCell!12098))

(declare-fun mapKey!40099 () (_ BitVec 32))

(assert (=> mapNonEmpty!40099 (= (arr!32765 _values!955) (store mapRest!40099 mapKey!40099 mapValue!40099))))

(declare-fun mapIsEmpty!40099 () Bool)

(assert (=> mapIsEmpty!40099 mapRes!40099))

(declare-fun b!1068057 () Bool)

(declare-fun e!609319 () Bool)

(assert (=> b!1068057 (= e!609319 true)))

(declare-datatypes ((tuple2!16374 0))(
  ( (tuple2!16375 (_1!8198 (_ BitVec 64)) (_2!8198 V!39273)) )
))
(declare-datatypes ((List!22912 0))(
  ( (Nil!22909) (Cons!22908 (h!24117 tuple2!16374) (t!32228 List!22912)) )
))
(declare-datatypes ((ListLongMap!14343 0))(
  ( (ListLongMap!14344 (toList!7187 List!22912)) )
))
(declare-fun lt!471660 () ListLongMap!14343)

(declare-fun -!632 (ListLongMap!14343 (_ BitVec 64)) ListLongMap!14343)

(assert (=> b!1068057 (= (-!632 lt!471660 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471660)))

(declare-datatypes ((Unit!34962 0))(
  ( (Unit!34963) )
))
(declare-fun lt!471662 () Unit!34962)

(declare-fun removeNotPresentStillSame!49 (ListLongMap!14343 (_ BitVec 64)) Unit!34962)

(assert (=> b!1068057 (= lt!471662 (removeNotPresentStillSame!49 lt!471660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068058 () Bool)

(declare-fun e!609317 () Bool)

(assert (=> b!1068058 (= e!609318 (not e!609317))))

(declare-fun res!712752 () Bool)

(assert (=> b!1068058 (=> res!712752 e!609317)))

(assert (=> b!1068058 (= res!712752 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471658 () ListLongMap!14343)

(declare-fun lt!471659 () ListLongMap!14343)

(assert (=> b!1068058 (= lt!471658 lt!471659)))

(declare-fun zeroValueBefore!47 () V!39273)

(declare-fun lt!471661 () Unit!34962)

(declare-fun minValue!907 () V!39273)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39273)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!774 (array!68128 array!68130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39273 V!39273 V!39273 V!39273 (_ BitVec 32) Int) Unit!34962)

(assert (=> b!1068058 (= lt!471661 (lemmaNoChangeToArrayThenSameMapNoExtras!774 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3780 (array!68128 array!68130 (_ BitVec 32) (_ BitVec 32) V!39273 V!39273 (_ BitVec 32) Int) ListLongMap!14343)

(assert (=> b!1068058 (= lt!471659 (getCurrentListMapNoExtraKeys!3780 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068058 (= lt!471658 (getCurrentListMapNoExtraKeys!3780 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068059 () Bool)

(declare-fun res!712753 () Bool)

(assert (=> b!1068059 (=> (not res!712753) (not e!609318))))

(declare-datatypes ((List!22913 0))(
  ( (Nil!22910) (Cons!22909 (h!24118 (_ BitVec 64)) (t!32229 List!22913)) )
))
(declare-fun arrayNoDuplicates!0 (array!68128 (_ BitVec 32) List!22913) Bool)

(assert (=> b!1068059 (= res!712753 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22910))))

(declare-fun b!1068060 () Bool)

(assert (=> b!1068060 (= e!609321 tp_is_empty!25603)))

(declare-fun b!1068061 () Bool)

(assert (=> b!1068061 (= e!609317 e!609319)))

(declare-fun res!712750 () Bool)

(assert (=> b!1068061 (=> res!712750 e!609319)))

(declare-fun contains!6261 (ListLongMap!14343 (_ BitVec 64)) Bool)

(assert (=> b!1068061 (= res!712750 (contains!6261 lt!471660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4030 (array!68128 array!68130 (_ BitVec 32) (_ BitVec 32) V!39273 V!39273 (_ BitVec 32) Int) ListLongMap!14343)

(assert (=> b!1068061 (= lt!471660 (getCurrentListMap!4030 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94460 res!712751) b!1068056))

(assert (= (and b!1068056 res!712755) b!1068053))

(assert (= (and b!1068053 res!712754) b!1068059))

(assert (= (and b!1068059 res!712753) b!1068058))

(assert (= (and b!1068058 (not res!712752)) b!1068061))

(assert (= (and b!1068061 (not res!712750)) b!1068057))

(assert (= (and b!1068055 condMapEmpty!40099) mapIsEmpty!40099))

(assert (= (and b!1068055 (not condMapEmpty!40099)) mapNonEmpty!40099))

(get-info :version)

(assert (= (and mapNonEmpty!40099 ((_ is ValueCellFull!12098) mapValue!40099)) b!1068054))

(assert (= (and b!1068055 ((_ is ValueCellFull!12098) mapDefault!40099)) b!1068060))

(assert (= start!94460 b!1068055))

(declare-fun m!986185 () Bool)

(assert (=> start!94460 m!986185))

(declare-fun m!986187 () Bool)

(assert (=> start!94460 m!986187))

(declare-fun m!986189 () Bool)

(assert (=> start!94460 m!986189))

(declare-fun m!986191 () Bool)

(assert (=> mapNonEmpty!40099 m!986191))

(declare-fun m!986193 () Bool)

(assert (=> b!1068053 m!986193))

(declare-fun m!986195 () Bool)

(assert (=> b!1068059 m!986195))

(declare-fun m!986197 () Bool)

(assert (=> b!1068061 m!986197))

(declare-fun m!986199 () Bool)

(assert (=> b!1068061 m!986199))

(declare-fun m!986201 () Bool)

(assert (=> b!1068058 m!986201))

(declare-fun m!986203 () Bool)

(assert (=> b!1068058 m!986203))

(declare-fun m!986205 () Bool)

(assert (=> b!1068058 m!986205))

(declare-fun m!986207 () Bool)

(assert (=> b!1068057 m!986207))

(declare-fun m!986209 () Bool)

(assert (=> b!1068057 m!986209))

(check-sat b_and!34559 tp_is_empty!25603 (not b_next!21793) (not mapNonEmpty!40099) (not b!1068053) (not b!1068061) (not start!94460) (not b!1068059) (not b!1068057) (not b!1068058))
(check-sat b_and!34559 (not b_next!21793))
