; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71308 () Bool)

(assert start!71308)

(declare-fun b_free!13309 () Bool)

(declare-fun b_next!13309 () Bool)

(assert (=> start!71308 (= b_free!13309 (not b_next!13309))))

(declare-fun tp!46687 () Bool)

(declare-fun b_and!22245 () Bool)

(assert (=> start!71308 (= tp!46687 b_and!22245)))

(declare-fun b!827198 () Bool)

(declare-fun res!563614 () Bool)

(declare-fun e!460674 () Bool)

(assert (=> b!827198 (=> (not res!563614) (not e!460674))))

(declare-datatypes ((array!46221 0))(
  ( (array!46222 (arr!22151 (Array (_ BitVec 32) (_ BitVec 64))) (size!22571 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46221)

(declare-datatypes ((List!15714 0))(
  ( (Nil!15711) (Cons!15710 (h!16845 (_ BitVec 64)) (t!22053 List!15714)) )
))
(declare-fun arrayNoDuplicates!0 (array!46221 (_ BitVec 32) List!15714) Bool)

(assert (=> b!827198 (= res!563614 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15711))))

(declare-fun b!827199 () Bool)

(declare-fun e!460675 () Bool)

(assert (=> b!827199 (= e!460675 true)))

(declare-datatypes ((V!25027 0))(
  ( (V!25028 (val!7557 Int)) )
))
(declare-datatypes ((tuple2!9936 0))(
  ( (tuple2!9937 (_1!4979 (_ BitVec 64)) (_2!4979 V!25027)) )
))
(declare-fun lt!374139 () tuple2!9936)

(declare-fun lt!374132 () tuple2!9936)

(declare-datatypes ((List!15715 0))(
  ( (Nil!15712) (Cons!15711 (h!16846 tuple2!9936) (t!22054 List!15715)) )
))
(declare-datatypes ((ListLongMap!8761 0))(
  ( (ListLongMap!8762 (toList!4396 List!15715)) )
))
(declare-fun lt!374129 () ListLongMap!8761)

(declare-fun lt!374138 () ListLongMap!8761)

(declare-fun +!1943 (ListLongMap!8761 tuple2!9936) ListLongMap!8761)

(assert (=> b!827199 (= lt!374129 (+!1943 (+!1943 lt!374138 lt!374132) lt!374139))))

(declare-fun lt!374128 () ListLongMap!8761)

(declare-fun lt!374127 () ListLongMap!8761)

(declare-fun lt!374137 () ListLongMap!8761)

(assert (=> b!827199 (and (= lt!374128 lt!374127) (= lt!374137 lt!374127) (= lt!374137 lt!374128))))

(declare-fun lt!374135 () ListLongMap!8761)

(assert (=> b!827199 (= lt!374127 (+!1943 lt!374135 lt!374132))))

(declare-fun lt!374140 () ListLongMap!8761)

(assert (=> b!827199 (= lt!374128 (+!1943 lt!374140 lt!374132))))

(declare-fun zeroValueBefore!34 () V!25027)

(declare-fun zeroValueAfter!34 () V!25027)

(declare-datatypes ((Unit!28344 0))(
  ( (Unit!28345) )
))
(declare-fun lt!374134 () Unit!28344)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!227 (ListLongMap!8761 (_ BitVec 64) V!25027 V!25027) Unit!28344)

(assert (=> b!827199 (= lt!374134 (addSameAsAddTwiceSameKeyDiffValues!227 lt!374140 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460676 () Bool)

(assert (=> b!827199 e!460676))

(declare-fun res!563611 () Bool)

(assert (=> b!827199 (=> (not res!563611) (not e!460676))))

(declare-fun lt!374131 () ListLongMap!8761)

(assert (=> b!827199 (= res!563611 (= lt!374131 lt!374135))))

(declare-fun lt!374136 () tuple2!9936)

(assert (=> b!827199 (= lt!374135 (+!1943 lt!374140 lt!374136))))

(assert (=> b!827199 (= lt!374140 (+!1943 lt!374138 lt!374139))))

(assert (=> b!827199 (= lt!374132 (tuple2!9937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460670 () Bool)

(assert (=> b!827199 e!460670))

(declare-fun res!563608 () Bool)

(assert (=> b!827199 (=> (not res!563608) (not e!460670))))

(assert (=> b!827199 (= res!563608 (= lt!374131 (+!1943 (+!1943 lt!374138 lt!374136) lt!374139)))))

(declare-fun minValue!754 () V!25027)

(assert (=> b!827199 (= lt!374139 (tuple2!9937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!827199 (= lt!374136 (tuple2!9937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((ValueCell!7094 0))(
  ( (ValueCellFull!7094 (v!9991 V!25027)) (EmptyCell!7094) )
))
(declare-datatypes ((array!46223 0))(
  ( (array!46224 (arr!22152 (Array (_ BitVec 32) ValueCell!7094)) (size!22572 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46223)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2518 (array!46221 array!46223 (_ BitVec 32) (_ BitVec 32) V!25027 V!25027 (_ BitVec 32) Int) ListLongMap!8761)

(assert (=> b!827199 (= lt!374137 (getCurrentListMap!2518 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!827199 (= lt!374131 (getCurrentListMap!2518 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827200 () Bool)

(declare-fun res!563612 () Bool)

(assert (=> b!827200 (=> (not res!563612) (not e!460674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46221 (_ BitVec 32)) Bool)

(assert (=> b!827200 (= res!563612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827201 () Bool)

(assert (=> b!827201 (= e!460674 (not e!460675))))

(declare-fun res!563613 () Bool)

(assert (=> b!827201 (=> res!563613 e!460675)))

(assert (=> b!827201 (= res!563613 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!374130 () ListLongMap!8761)

(assert (=> b!827201 (= lt!374138 lt!374130)))

(declare-fun lt!374133 () Unit!28344)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!562 (array!46221 array!46223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25027 V!25027 V!25027 V!25027 (_ BitVec 32) Int) Unit!28344)

(assert (=> b!827201 (= lt!374133 (lemmaNoChangeToArrayThenSameMapNoExtras!562 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2474 (array!46221 array!46223 (_ BitVec 32) (_ BitVec 32) V!25027 V!25027 (_ BitVec 32) Int) ListLongMap!8761)

(assert (=> b!827201 (= lt!374130 (getCurrentListMapNoExtraKeys!2474 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827201 (= lt!374138 (getCurrentListMapNoExtraKeys!2474 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827202 () Bool)

(declare-fun e!460673 () Bool)

(declare-fun tp_is_empty!15019 () Bool)

(assert (=> b!827202 (= e!460673 tp_is_empty!15019)))

(declare-fun b!827203 () Bool)

(declare-fun e!460671 () Bool)

(declare-fun e!460672 () Bool)

(declare-fun mapRes!24154 () Bool)

(assert (=> b!827203 (= e!460671 (and e!460672 mapRes!24154))))

(declare-fun condMapEmpty!24154 () Bool)

(declare-fun mapDefault!24154 () ValueCell!7094)

(assert (=> b!827203 (= condMapEmpty!24154 (= (arr!22152 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7094)) mapDefault!24154)))))

(declare-fun b!827204 () Bool)

(assert (=> b!827204 (= e!460676 (= lt!374137 (+!1943 (+!1943 lt!374130 lt!374139) lt!374132)))))

(declare-fun b!827205 () Bool)

(assert (=> b!827205 (= e!460670 (= lt!374137 (+!1943 (+!1943 lt!374130 (tuple2!9937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374139)))))

(declare-fun mapIsEmpty!24154 () Bool)

(assert (=> mapIsEmpty!24154 mapRes!24154))

(declare-fun mapNonEmpty!24154 () Bool)

(declare-fun tp!46686 () Bool)

(assert (=> mapNonEmpty!24154 (= mapRes!24154 (and tp!46686 e!460673))))

(declare-fun mapKey!24154 () (_ BitVec 32))

(declare-fun mapValue!24154 () ValueCell!7094)

(declare-fun mapRest!24154 () (Array (_ BitVec 32) ValueCell!7094))

(assert (=> mapNonEmpty!24154 (= (arr!22152 _values!788) (store mapRest!24154 mapKey!24154 mapValue!24154))))

(declare-fun b!827206 () Bool)

(assert (=> b!827206 (= e!460672 tp_is_empty!15019)))

(declare-fun b!827207 () Bool)

(declare-fun res!563610 () Bool)

(assert (=> b!827207 (=> (not res!563610) (not e!460674))))

(assert (=> b!827207 (= res!563610 (and (= (size!22572 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22571 _keys!976) (size!22572 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!563609 () Bool)

(assert (=> start!71308 (=> (not res!563609) (not e!460674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71308 (= res!563609 (validMask!0 mask!1312))))

(assert (=> start!71308 e!460674))

(assert (=> start!71308 tp_is_empty!15019))

(declare-fun array_inv!17699 (array!46221) Bool)

(assert (=> start!71308 (array_inv!17699 _keys!976)))

(assert (=> start!71308 true))

(declare-fun array_inv!17700 (array!46223) Bool)

(assert (=> start!71308 (and (array_inv!17700 _values!788) e!460671)))

(assert (=> start!71308 tp!46687))

(assert (= (and start!71308 res!563609) b!827207))

(assert (= (and b!827207 res!563610) b!827200))

(assert (= (and b!827200 res!563612) b!827198))

(assert (= (and b!827198 res!563614) b!827201))

(assert (= (and b!827201 (not res!563613)) b!827199))

(assert (= (and b!827199 res!563608) b!827205))

(assert (= (and b!827199 res!563611) b!827204))

(assert (= (and b!827203 condMapEmpty!24154) mapIsEmpty!24154))

(assert (= (and b!827203 (not condMapEmpty!24154)) mapNonEmpty!24154))

(get-info :version)

(assert (= (and mapNonEmpty!24154 ((_ is ValueCellFull!7094) mapValue!24154)) b!827202))

(assert (= (and b!827203 ((_ is ValueCellFull!7094) mapDefault!24154)) b!827206))

(assert (= start!71308 b!827203))

(declare-fun m!770245 () Bool)

(assert (=> b!827198 m!770245))

(declare-fun m!770247 () Bool)

(assert (=> b!827201 m!770247))

(declare-fun m!770249 () Bool)

(assert (=> b!827201 m!770249))

(declare-fun m!770251 () Bool)

(assert (=> b!827201 m!770251))

(declare-fun m!770253 () Bool)

(assert (=> mapNonEmpty!24154 m!770253))

(declare-fun m!770255 () Bool)

(assert (=> b!827204 m!770255))

(assert (=> b!827204 m!770255))

(declare-fun m!770257 () Bool)

(assert (=> b!827204 m!770257))

(declare-fun m!770259 () Bool)

(assert (=> start!71308 m!770259))

(declare-fun m!770261 () Bool)

(assert (=> start!71308 m!770261))

(declare-fun m!770263 () Bool)

(assert (=> start!71308 m!770263))

(declare-fun m!770265 () Bool)

(assert (=> b!827199 m!770265))

(declare-fun m!770267 () Bool)

(assert (=> b!827199 m!770267))

(declare-fun m!770269 () Bool)

(assert (=> b!827199 m!770269))

(declare-fun m!770271 () Bool)

(assert (=> b!827199 m!770271))

(declare-fun m!770273 () Bool)

(assert (=> b!827199 m!770273))

(declare-fun m!770275 () Bool)

(assert (=> b!827199 m!770275))

(declare-fun m!770277 () Bool)

(assert (=> b!827199 m!770277))

(declare-fun m!770279 () Bool)

(assert (=> b!827199 m!770279))

(declare-fun m!770281 () Bool)

(assert (=> b!827199 m!770281))

(declare-fun m!770283 () Bool)

(assert (=> b!827199 m!770283))

(assert (=> b!827199 m!770273))

(assert (=> b!827199 m!770277))

(declare-fun m!770285 () Bool)

(assert (=> b!827199 m!770285))

(declare-fun m!770287 () Bool)

(assert (=> b!827200 m!770287))

(declare-fun m!770289 () Bool)

(assert (=> b!827205 m!770289))

(assert (=> b!827205 m!770289))

(declare-fun m!770291 () Bool)

(assert (=> b!827205 m!770291))

(check-sat (not b!827204) (not start!71308) (not b!827205) (not mapNonEmpty!24154) (not b!827201) (not b!827199) (not b_next!13309) tp_is_empty!15019 b_and!22245 (not b!827200) (not b!827198))
(check-sat b_and!22245 (not b_next!13309))
