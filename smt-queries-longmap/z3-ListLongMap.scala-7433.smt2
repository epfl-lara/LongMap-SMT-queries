; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94684 () Bool)

(assert start!94684)

(declare-fun b_free!21775 () Bool)

(declare-fun b_next!21775 () Bool)

(assert (=> start!94684 (= b_free!21775 (not b_next!21775))))

(declare-fun tp!76772 () Bool)

(declare-fun b_and!34577 () Bool)

(assert (=> start!94684 (= tp!76772 b_and!34577)))

(declare-fun b!1069290 () Bool)

(declare-fun e!610081 () Bool)

(declare-fun e!610077 () Bool)

(assert (=> b!1069290 (= e!610081 e!610077)))

(declare-fun res!713179 () Bool)

(assert (=> b!1069290 (=> res!713179 e!610077)))

(declare-datatypes ((V!39249 0))(
  ( (V!39250 (val!12843 Int)) )
))
(declare-datatypes ((tuple2!16282 0))(
  ( (tuple2!16283 (_1!8152 (_ BitVec 64)) (_2!8152 V!39249)) )
))
(declare-datatypes ((List!22851 0))(
  ( (Nil!22848) (Cons!22847 (h!24065 tuple2!16282) (t!32168 List!22851)) )
))
(declare-datatypes ((ListLongMap!14259 0))(
  ( (ListLongMap!14260 (toList!7145 List!22851)) )
))
(declare-fun lt!472239 () ListLongMap!14259)

(declare-fun contains!6308 (ListLongMap!14259 (_ BitVec 64)) Bool)

(assert (=> b!1069290 (= res!713179 (contains!6308 lt!472239 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39249)

(declare-datatypes ((ValueCell!12089 0))(
  ( (ValueCellFull!12089 (v!15453 V!39249)) (EmptyCell!12089) )
))
(declare-datatypes ((array!68197 0))(
  ( (array!68198 (arr!32792 (Array (_ BitVec 32) ValueCell!12089)) (size!33329 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68197)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39249)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68199 0))(
  ( (array!68200 (arr!32793 (Array (_ BitVec 32) (_ BitVec 64))) (size!33330 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68199)

(declare-fun getCurrentListMap!4071 (array!68199 array!68197 (_ BitVec 32) (_ BitVec 32) V!39249 V!39249 (_ BitVec 32) Int) ListLongMap!14259)

(assert (=> b!1069290 (= lt!472239 (getCurrentListMap!4071 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069291 () Bool)

(declare-fun res!713182 () Bool)

(declare-fun e!610075 () Bool)

(assert (=> b!1069291 (=> (not res!713182) (not e!610075))))

(declare-datatypes ((List!22852 0))(
  ( (Nil!22849) (Cons!22848 (h!24066 (_ BitVec 64)) (t!32169 List!22852)) )
))
(declare-fun arrayNoDuplicates!0 (array!68199 (_ BitVec 32) List!22852) Bool)

(assert (=> b!1069291 (= res!713182 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22849))))

(declare-fun res!713184 () Bool)

(assert (=> start!94684 (=> (not res!713184) (not e!610075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94684 (= res!713184 (validMask!0 mask!1515))))

(assert (=> start!94684 e!610075))

(assert (=> start!94684 true))

(declare-fun tp_is_empty!25585 () Bool)

(assert (=> start!94684 tp_is_empty!25585))

(declare-fun e!610080 () Bool)

(declare-fun array_inv!25406 (array!68197) Bool)

(assert (=> start!94684 (and (array_inv!25406 _values!955) e!610080)))

(assert (=> start!94684 tp!76772))

(declare-fun array_inv!25407 (array!68199) Bool)

(assert (=> start!94684 (array_inv!25407 _keys!1163)))

(declare-fun b!1069292 () Bool)

(declare-fun e!610076 () Bool)

(assert (=> b!1069292 (= e!610076 tp_is_empty!25585)))

(declare-fun b!1069293 () Bool)

(declare-fun res!713181 () Bool)

(assert (=> b!1069293 (=> (not res!713181) (not e!610075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68199 (_ BitVec 32)) Bool)

(assert (=> b!1069293 (= res!713181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069294 () Bool)

(assert (=> b!1069294 (= e!610075 (not e!610081))))

(declare-fun res!713180 () Bool)

(assert (=> b!1069294 (=> res!713180 e!610081)))

(assert (=> b!1069294 (= res!713180 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472238 () ListLongMap!14259)

(declare-fun lt!472242 () ListLongMap!14259)

(assert (=> b!1069294 (= lt!472238 lt!472242)))

(declare-fun zeroValueAfter!47 () V!39249)

(declare-datatypes ((Unit!35084 0))(
  ( (Unit!35085) )
))
(declare-fun lt!472240 () Unit!35084)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!764 (array!68199 array!68197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39249 V!39249 V!39249 V!39249 (_ BitVec 32) Int) Unit!35084)

(assert (=> b!1069294 (= lt!472240 (lemmaNoChangeToArrayThenSameMapNoExtras!764 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3761 (array!68199 array!68197 (_ BitVec 32) (_ BitVec 32) V!39249 V!39249 (_ BitVec 32) Int) ListLongMap!14259)

(assert (=> b!1069294 (= lt!472242 (getCurrentListMapNoExtraKeys!3761 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069294 (= lt!472238 (getCurrentListMapNoExtraKeys!3761 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069295 () Bool)

(declare-fun e!610078 () Bool)

(assert (=> b!1069295 (= e!610078 tp_is_empty!25585)))

(declare-fun b!1069296 () Bool)

(declare-fun res!713183 () Bool)

(assert (=> b!1069296 (=> (not res!713183) (not e!610075))))

(assert (=> b!1069296 (= res!713183 (and (= (size!33329 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33330 _keys!1163) (size!33329 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069297 () Bool)

(assert (=> b!1069297 (= e!610077 true)))

(declare-fun -!632 (ListLongMap!14259 (_ BitVec 64)) ListLongMap!14259)

(assert (=> b!1069297 (= (-!632 lt!472239 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472239)))

(declare-fun lt!472241 () Unit!35084)

(declare-fun removeNotPresentStillSame!49 (ListLongMap!14259 (_ BitVec 64)) Unit!35084)

(assert (=> b!1069297 (= lt!472241 (removeNotPresentStillSame!49 lt!472239 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40072 () Bool)

(declare-fun mapRes!40072 () Bool)

(assert (=> mapIsEmpty!40072 mapRes!40072))

(declare-fun mapNonEmpty!40072 () Bool)

(declare-fun tp!76771 () Bool)

(assert (=> mapNonEmpty!40072 (= mapRes!40072 (and tp!76771 e!610078))))

(declare-fun mapRest!40072 () (Array (_ BitVec 32) ValueCell!12089))

(declare-fun mapValue!40072 () ValueCell!12089)

(declare-fun mapKey!40072 () (_ BitVec 32))

(assert (=> mapNonEmpty!40072 (= (arr!32792 _values!955) (store mapRest!40072 mapKey!40072 mapValue!40072))))

(declare-fun b!1069298 () Bool)

(assert (=> b!1069298 (= e!610080 (and e!610076 mapRes!40072))))

(declare-fun condMapEmpty!40072 () Bool)

(declare-fun mapDefault!40072 () ValueCell!12089)

(assert (=> b!1069298 (= condMapEmpty!40072 (= (arr!32792 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12089)) mapDefault!40072)))))

(assert (= (and start!94684 res!713184) b!1069296))

(assert (= (and b!1069296 res!713183) b!1069293))

(assert (= (and b!1069293 res!713181) b!1069291))

(assert (= (and b!1069291 res!713182) b!1069294))

(assert (= (and b!1069294 (not res!713180)) b!1069290))

(assert (= (and b!1069290 (not res!713179)) b!1069297))

(assert (= (and b!1069298 condMapEmpty!40072) mapIsEmpty!40072))

(assert (= (and b!1069298 (not condMapEmpty!40072)) mapNonEmpty!40072))

(get-info :version)

(assert (= (and mapNonEmpty!40072 ((_ is ValueCellFull!12089) mapValue!40072)) b!1069295))

(assert (= (and b!1069298 ((_ is ValueCellFull!12089) mapDefault!40072)) b!1069292))

(assert (= start!94684 b!1069298))

(declare-fun m!988249 () Bool)

(assert (=> mapNonEmpty!40072 m!988249))

(declare-fun m!988251 () Bool)

(assert (=> b!1069294 m!988251))

(declare-fun m!988253 () Bool)

(assert (=> b!1069294 m!988253))

(declare-fun m!988255 () Bool)

(assert (=> b!1069294 m!988255))

(declare-fun m!988257 () Bool)

(assert (=> b!1069290 m!988257))

(declare-fun m!988259 () Bool)

(assert (=> b!1069290 m!988259))

(declare-fun m!988261 () Bool)

(assert (=> b!1069291 m!988261))

(declare-fun m!988263 () Bool)

(assert (=> b!1069297 m!988263))

(declare-fun m!988265 () Bool)

(assert (=> b!1069297 m!988265))

(declare-fun m!988267 () Bool)

(assert (=> b!1069293 m!988267))

(declare-fun m!988269 () Bool)

(assert (=> start!94684 m!988269))

(declare-fun m!988271 () Bool)

(assert (=> start!94684 m!988271))

(declare-fun m!988273 () Bool)

(assert (=> start!94684 m!988273))

(check-sat (not b!1069297) b_and!34577 (not b!1069293) (not mapNonEmpty!40072) (not start!94684) tp_is_empty!25585 (not b_next!21775) (not b!1069294) (not b!1069290) (not b!1069291))
(check-sat b_and!34577 (not b_next!21775))
