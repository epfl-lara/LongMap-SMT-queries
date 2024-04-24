; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71484 () Bool)

(assert start!71484)

(declare-fun b_free!13435 () Bool)

(declare-fun b_next!13435 () Bool)

(assert (=> start!71484 (= b_free!13435 (not b_next!13435))))

(declare-fun tp!47074 () Bool)

(declare-fun b_and!22403 () Bool)

(assert (=> start!71484 (= tp!47074 b_and!22403)))

(declare-fun b!829190 () Bool)

(declare-fun e!462116 () Bool)

(declare-fun e!462115 () Bool)

(assert (=> b!829190 (= e!462116 (not e!462115))))

(declare-fun res!564777 () Bool)

(assert (=> b!829190 (=> res!564777 e!462115)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829190 (= res!564777 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!25195 0))(
  ( (V!25196 (val!7620 Int)) )
))
(declare-datatypes ((tuple2!10024 0))(
  ( (tuple2!10025 (_1!5023 (_ BitVec 64)) (_2!5023 V!25195)) )
))
(declare-datatypes ((List!15801 0))(
  ( (Nil!15798) (Cons!15797 (h!16932 tuple2!10024) (t!22146 List!15801)) )
))
(declare-datatypes ((ListLongMap!8849 0))(
  ( (ListLongMap!8850 (toList!4440 List!15801)) )
))
(declare-fun lt!375642 () ListLongMap!8849)

(declare-fun lt!375644 () ListLongMap!8849)

(assert (=> b!829190 (= lt!375642 lt!375644)))

(declare-fun zeroValueBefore!34 () V!25195)

(declare-datatypes ((Unit!28394 0))(
  ( (Unit!28395) )
))
(declare-fun lt!375641 () Unit!28394)

(declare-datatypes ((array!46465 0))(
  ( (array!46466 (arr!22270 (Array (_ BitVec 32) (_ BitVec 64))) (size!22690 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46465)

(declare-fun zeroValueAfter!34 () V!25195)

(declare-fun minValue!754 () V!25195)

(declare-datatypes ((ValueCell!7157 0))(
  ( (ValueCellFull!7157 (v!10056 V!25195)) (EmptyCell!7157) )
))
(declare-datatypes ((array!46467 0))(
  ( (array!46468 (arr!22271 (Array (_ BitVec 32) ValueCell!7157)) (size!22691 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46467)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!584 (array!46465 array!46467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25195 V!25195 V!25195 V!25195 (_ BitVec 32) Int) Unit!28394)

(assert (=> b!829190 (= lt!375641 (lemmaNoChangeToArrayThenSameMapNoExtras!584 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2517 (array!46465 array!46467 (_ BitVec 32) (_ BitVec 32) V!25195 V!25195 (_ BitVec 32) Int) ListLongMap!8849)

(assert (=> b!829190 (= lt!375644 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829190 (= lt!375642 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829191 () Bool)

(declare-fun res!564775 () Bool)

(assert (=> b!829191 (=> (not res!564775) (not e!462116))))

(declare-datatypes ((List!15802 0))(
  ( (Nil!15799) (Cons!15798 (h!16933 (_ BitVec 64)) (t!22147 List!15802)) )
))
(declare-fun arrayNoDuplicates!0 (array!46465 (_ BitVec 32) List!15802) Bool)

(assert (=> b!829191 (= res!564775 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15799))))

(declare-fun b!829192 () Bool)

(declare-fun e!462118 () Bool)

(declare-fun tp_is_empty!15145 () Bool)

(assert (=> b!829192 (= e!462118 tp_is_empty!15145)))

(declare-fun b!829193 () Bool)

(declare-fun res!564778 () Bool)

(assert (=> b!829193 (=> (not res!564778) (not e!462116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46465 (_ BitVec 32)) Bool)

(assert (=> b!829193 (= res!564778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!564779 () Bool)

(assert (=> start!71484 (=> (not res!564779) (not e!462116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71484 (= res!564779 (validMask!0 mask!1312))))

(assert (=> start!71484 e!462116))

(assert (=> start!71484 tp_is_empty!15145))

(declare-fun array_inv!17787 (array!46465) Bool)

(assert (=> start!71484 (array_inv!17787 _keys!976)))

(assert (=> start!71484 true))

(declare-fun e!462114 () Bool)

(declare-fun array_inv!17788 (array!46467) Bool)

(assert (=> start!71484 (and (array_inv!17788 _values!788) e!462114)))

(assert (=> start!71484 tp!47074))

(declare-fun b!829194 () Bool)

(declare-fun res!564776 () Bool)

(assert (=> b!829194 (=> (not res!564776) (not e!462116))))

(assert (=> b!829194 (= res!564776 (and (= (size!22691 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22690 _keys!976) (size!22691 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829195 () Bool)

(declare-fun mapRes!24352 () Bool)

(assert (=> b!829195 (= e!462114 (and e!462118 mapRes!24352))))

(declare-fun condMapEmpty!24352 () Bool)

(declare-fun mapDefault!24352 () ValueCell!7157)

(assert (=> b!829195 (= condMapEmpty!24352 (= (arr!22271 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7157)) mapDefault!24352)))))

(declare-fun mapIsEmpty!24352 () Bool)

(assert (=> mapIsEmpty!24352 mapRes!24352))

(declare-fun mapNonEmpty!24352 () Bool)

(declare-fun tp!47073 () Bool)

(declare-fun e!462117 () Bool)

(assert (=> mapNonEmpty!24352 (= mapRes!24352 (and tp!47073 e!462117))))

(declare-fun mapKey!24352 () (_ BitVec 32))

(declare-fun mapValue!24352 () ValueCell!7157)

(declare-fun mapRest!24352 () (Array (_ BitVec 32) ValueCell!7157))

(assert (=> mapNonEmpty!24352 (= (arr!22271 _values!788) (store mapRest!24352 mapKey!24352 mapValue!24352))))

(declare-fun b!829196 () Bool)

(assert (=> b!829196 (= e!462117 tp_is_empty!15145)))

(declare-fun b!829197 () Bool)

(declare-fun getCurrentListMap!2536 (array!46465 array!46467 (_ BitVec 32) (_ BitVec 32) V!25195 V!25195 (_ BitVec 32) Int) ListLongMap!8849)

(declare-fun +!1963 (ListLongMap!8849 tuple2!10024) ListLongMap!8849)

(assert (=> b!829197 (= e!462115 (= (getCurrentListMap!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1963 lt!375642 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!375643 () ListLongMap!8849)

(assert (=> b!829197 (= lt!375643 (getCurrentListMap!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71484 res!564779) b!829194))

(assert (= (and b!829194 res!564776) b!829193))

(assert (= (and b!829193 res!564778) b!829191))

(assert (= (and b!829191 res!564775) b!829190))

(assert (= (and b!829190 (not res!564777)) b!829197))

(assert (= (and b!829195 condMapEmpty!24352) mapIsEmpty!24352))

(assert (= (and b!829195 (not condMapEmpty!24352)) mapNonEmpty!24352))

(get-info :version)

(assert (= (and mapNonEmpty!24352 ((_ is ValueCellFull!7157) mapValue!24352)) b!829196))

(assert (= (and b!829195 ((_ is ValueCellFull!7157) mapDefault!24352)) b!829192))

(assert (= start!71484 b!829195))

(declare-fun m!772523 () Bool)

(assert (=> b!829191 m!772523))

(declare-fun m!772525 () Bool)

(assert (=> b!829190 m!772525))

(declare-fun m!772527 () Bool)

(assert (=> b!829190 m!772527))

(declare-fun m!772529 () Bool)

(assert (=> b!829190 m!772529))

(declare-fun m!772531 () Bool)

(assert (=> b!829193 m!772531))

(declare-fun m!772533 () Bool)

(assert (=> b!829197 m!772533))

(declare-fun m!772535 () Bool)

(assert (=> b!829197 m!772535))

(declare-fun m!772537 () Bool)

(assert (=> b!829197 m!772537))

(declare-fun m!772539 () Bool)

(assert (=> mapNonEmpty!24352 m!772539))

(declare-fun m!772541 () Bool)

(assert (=> start!71484 m!772541))

(declare-fun m!772543 () Bool)

(assert (=> start!71484 m!772543))

(declare-fun m!772545 () Bool)

(assert (=> start!71484 m!772545))

(check-sat (not b!829190) tp_is_empty!15145 (not mapNonEmpty!24352) (not b_next!13435) (not b!829191) (not b!829197) (not b!829193) b_and!22403 (not start!71484))
(check-sat b_and!22403 (not b_next!13435))
(get-model)

(declare-fun d!105491 () Bool)

(assert (=> d!105491 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71484 d!105491))

(declare-fun d!105493 () Bool)

(assert (=> d!105493 (= (array_inv!17787 _keys!976) (bvsge (size!22690 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71484 d!105493))

(declare-fun d!105495 () Bool)

(assert (=> d!105495 (= (array_inv!17788 _values!788) (bvsge (size!22691 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71484 d!105495))

(declare-fun b!829254 () Bool)

(declare-fun e!462162 () Bool)

(declare-fun call!36042 () Bool)

(assert (=> b!829254 (= e!462162 call!36042)))

(declare-fun b!829255 () Bool)

(declare-fun e!462163 () Bool)

(declare-fun e!462161 () Bool)

(assert (=> b!829255 (= e!462163 e!462161)))

(declare-fun c!89870 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!829255 (= c!89870 (validKeyInArray!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829256 () Bool)

(assert (=> b!829256 (= e!462161 call!36042)))

(declare-fun b!829257 () Bool)

(assert (=> b!829257 (= e!462161 e!462162)))

(declare-fun lt!375675 () (_ BitVec 64))

(assert (=> b!829257 (= lt!375675 (select (arr!22270 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375677 () Unit!28394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46465 (_ BitVec 64) (_ BitVec 32)) Unit!28394)

(assert (=> b!829257 (= lt!375677 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375675 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!829257 (arrayContainsKey!0 _keys!976 lt!375675 #b00000000000000000000000000000000)))

(declare-fun lt!375676 () Unit!28394)

(assert (=> b!829257 (= lt!375676 lt!375677)))

(declare-fun res!564814 () Bool)

(declare-datatypes ((SeekEntryResult!8689 0))(
  ( (MissingZero!8689 (index!37127 (_ BitVec 32))) (Found!8689 (index!37128 (_ BitVec 32))) (Intermediate!8689 (undefined!9501 Bool) (index!37129 (_ BitVec 32)) (x!69922 (_ BitVec 32))) (Undefined!8689) (MissingVacant!8689 (index!37130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46465 (_ BitVec 32)) SeekEntryResult!8689)

(assert (=> b!829257 (= res!564814 (= (seekEntryOrOpen!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8689 #b00000000000000000000000000000000)))))

(assert (=> b!829257 (=> (not res!564814) (not e!462162))))

(declare-fun bm!36039 () Bool)

(assert (=> bm!36039 (= call!36042 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun d!105497 () Bool)

(declare-fun res!564815 () Bool)

(assert (=> d!105497 (=> res!564815 e!462163)))

(assert (=> d!105497 (= res!564815 (bvsge #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(assert (=> d!105497 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462163)))

(assert (= (and d!105497 (not res!564815)) b!829255))

(assert (= (and b!829255 c!89870) b!829257))

(assert (= (and b!829255 (not c!89870)) b!829256))

(assert (= (and b!829257 res!564814) b!829254))

(assert (= (or b!829254 b!829256) bm!36039))

(declare-fun m!772595 () Bool)

(assert (=> b!829255 m!772595))

(assert (=> b!829255 m!772595))

(declare-fun m!772597 () Bool)

(assert (=> b!829255 m!772597))

(assert (=> b!829257 m!772595))

(declare-fun m!772599 () Bool)

(assert (=> b!829257 m!772599))

(declare-fun m!772601 () Bool)

(assert (=> b!829257 m!772601))

(assert (=> b!829257 m!772595))

(declare-fun m!772603 () Bool)

(assert (=> b!829257 m!772603))

(declare-fun m!772605 () Bool)

(assert (=> bm!36039 m!772605))

(assert (=> b!829193 d!105497))

(declare-fun b!829300 () Bool)

(declare-fun e!462199 () Bool)

(declare-fun e!462191 () Bool)

(assert (=> b!829300 (= e!462199 e!462191)))

(declare-fun res!564836 () Bool)

(declare-fun call!36063 () Bool)

(assert (=> b!829300 (= res!564836 call!36063)))

(assert (=> b!829300 (=> (not res!564836) (not e!462191))))

(declare-fun b!829301 () Bool)

(declare-fun res!564840 () Bool)

(declare-fun e!462202 () Bool)

(assert (=> b!829301 (=> (not res!564840) (not e!462202))))

(assert (=> b!829301 (= res!564840 e!462199)))

(declare-fun c!89885 () Bool)

(assert (=> b!829301 (= c!89885 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829302 () Bool)

(declare-fun e!462201 () ListLongMap!8849)

(declare-fun call!36057 () ListLongMap!8849)

(assert (=> b!829302 (= e!462201 (+!1963 call!36057 (tuple2!10025 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36054 () Bool)

(declare-fun call!36061 () ListLongMap!8849)

(declare-fun call!36058 () ListLongMap!8849)

(assert (=> bm!36054 (= call!36061 call!36058)))

(declare-fun b!829303 () Bool)

(declare-fun e!462192 () Bool)

(declare-fun lt!375731 () ListLongMap!8849)

(declare-fun apply!366 (ListLongMap!8849 (_ BitVec 64)) V!25195)

(assert (=> b!829303 (= e!462192 (= (apply!366 lt!375731 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829304 () Bool)

(assert (=> b!829304 (= e!462191 (= (apply!366 lt!375731 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!829305 () Bool)

(declare-fun res!564835 () Bool)

(assert (=> b!829305 (=> (not res!564835) (not e!462202))))

(declare-fun e!462195 () Bool)

(assert (=> b!829305 (= res!564835 e!462195)))

(declare-fun res!564837 () Bool)

(assert (=> b!829305 (=> res!564837 e!462195)))

(declare-fun e!462196 () Bool)

(assert (=> b!829305 (= res!564837 (not e!462196))))

(declare-fun res!564839 () Bool)

(assert (=> b!829305 (=> (not res!564839) (not e!462196))))

(assert (=> b!829305 (= res!564839 (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun b!829306 () Bool)

(declare-fun e!462193 () ListLongMap!8849)

(declare-fun call!36062 () ListLongMap!8849)

(assert (=> b!829306 (= e!462193 call!36062)))

(declare-fun bm!36055 () Bool)

(declare-fun call!36060 () Bool)

(declare-fun contains!4168 (ListLongMap!8849 (_ BitVec 64)) Bool)

(assert (=> bm!36055 (= call!36060 (contains!4168 lt!375731 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829307 () Bool)

(declare-fun e!462194 () Bool)

(assert (=> b!829307 (= e!462194 (validKeyInArray!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun call!36059 () ListLongMap!8849)

(declare-fun c!89884 () Bool)

(declare-fun bm!36056 () Bool)

(declare-fun c!89888 () Bool)

(assert (=> bm!36056 (= call!36057 (+!1963 (ite c!89884 call!36059 (ite c!89888 call!36058 call!36061)) (ite (or c!89884 c!89888) (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10025 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829308 () Bool)

(declare-fun e!462197 () Bool)

(assert (=> b!829308 (= e!462202 e!462197)))

(declare-fun c!89886 () Bool)

(assert (=> b!829308 (= c!89886 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829309 () Bool)

(assert (=> b!829309 (= e!462197 (not call!36060))))

(declare-fun bm!36058 () Bool)

(assert (=> bm!36058 (= call!36059 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829310 () Bool)

(assert (=> b!829310 (= e!462193 call!36061)))

(declare-fun bm!36059 () Bool)

(assert (=> bm!36059 (= call!36062 call!36057)))

(declare-fun b!829311 () Bool)

(declare-fun e!462200 () ListLongMap!8849)

(assert (=> b!829311 (= e!462200 call!36062)))

(declare-fun b!829312 () Bool)

(declare-fun e!462190 () Bool)

(declare-fun get!11794 (ValueCell!7157 V!25195) V!25195)

(declare-fun dynLambda!974 (Int (_ BitVec 64)) V!25195)

(assert (=> b!829312 (= e!462190 (= (apply!366 lt!375731 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)) (get!11794 (select (arr!22271 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829312 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22691 _values!788)))))

(assert (=> b!829312 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun b!829313 () Bool)

(declare-fun e!462198 () Unit!28394)

(declare-fun lt!375742 () Unit!28394)

(assert (=> b!829313 (= e!462198 lt!375742)))

(declare-fun lt!375726 () ListLongMap!8849)

(assert (=> b!829313 (= lt!375726 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375739 () (_ BitVec 64))

(assert (=> b!829313 (= lt!375739 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375736 () (_ BitVec 64))

(assert (=> b!829313 (= lt!375736 (select (arr!22270 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375729 () Unit!28394)

(declare-fun addStillContains!317 (ListLongMap!8849 (_ BitVec 64) V!25195 (_ BitVec 64)) Unit!28394)

(assert (=> b!829313 (= lt!375729 (addStillContains!317 lt!375726 lt!375739 zeroValueBefore!34 lt!375736))))

(assert (=> b!829313 (contains!4168 (+!1963 lt!375726 (tuple2!10025 lt!375739 zeroValueBefore!34)) lt!375736)))

(declare-fun lt!375730 () Unit!28394)

(assert (=> b!829313 (= lt!375730 lt!375729)))

(declare-fun lt!375724 () ListLongMap!8849)

(assert (=> b!829313 (= lt!375724 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375741 () (_ BitVec 64))

(assert (=> b!829313 (= lt!375741 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375743 () (_ BitVec 64))

(assert (=> b!829313 (= lt!375743 (select (arr!22270 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375740 () Unit!28394)

(declare-fun addApplyDifferent!317 (ListLongMap!8849 (_ BitVec 64) V!25195 (_ BitVec 64)) Unit!28394)

(assert (=> b!829313 (= lt!375740 (addApplyDifferent!317 lt!375724 lt!375741 minValue!754 lt!375743))))

(assert (=> b!829313 (= (apply!366 (+!1963 lt!375724 (tuple2!10025 lt!375741 minValue!754)) lt!375743) (apply!366 lt!375724 lt!375743))))

(declare-fun lt!375723 () Unit!28394)

(assert (=> b!829313 (= lt!375723 lt!375740)))

(declare-fun lt!375734 () ListLongMap!8849)

(assert (=> b!829313 (= lt!375734 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375733 () (_ BitVec 64))

(assert (=> b!829313 (= lt!375733 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375732 () (_ BitVec 64))

(assert (=> b!829313 (= lt!375732 (select (arr!22270 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375725 () Unit!28394)

(assert (=> b!829313 (= lt!375725 (addApplyDifferent!317 lt!375734 lt!375733 zeroValueBefore!34 lt!375732))))

(assert (=> b!829313 (= (apply!366 (+!1963 lt!375734 (tuple2!10025 lt!375733 zeroValueBefore!34)) lt!375732) (apply!366 lt!375734 lt!375732))))

(declare-fun lt!375735 () Unit!28394)

(assert (=> b!829313 (= lt!375735 lt!375725)))

(declare-fun lt!375727 () ListLongMap!8849)

(assert (=> b!829313 (= lt!375727 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375737 () (_ BitVec 64))

(assert (=> b!829313 (= lt!375737 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375738 () (_ BitVec 64))

(assert (=> b!829313 (= lt!375738 (select (arr!22270 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829313 (= lt!375742 (addApplyDifferent!317 lt!375727 lt!375737 minValue!754 lt!375738))))

(assert (=> b!829313 (= (apply!366 (+!1963 lt!375727 (tuple2!10025 lt!375737 minValue!754)) lt!375738) (apply!366 lt!375727 lt!375738))))

(declare-fun b!829314 () Bool)

(declare-fun c!89883 () Bool)

(assert (=> b!829314 (= c!89883 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829314 (= e!462200 e!462193)))

(declare-fun b!829315 () Bool)

(assert (=> b!829315 (= e!462195 e!462190)))

(declare-fun res!564842 () Bool)

(assert (=> b!829315 (=> (not res!564842) (not e!462190))))

(assert (=> b!829315 (= res!564842 (contains!4168 lt!375731 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829315 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun bm!36060 () Bool)

(assert (=> bm!36060 (= call!36058 call!36059)))

(declare-fun b!829316 () Bool)

(assert (=> b!829316 (= e!462201 e!462200)))

(assert (=> b!829316 (= c!89888 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36057 () Bool)

(assert (=> bm!36057 (= call!36063 (contains!4168 lt!375731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105499 () Bool)

(assert (=> d!105499 e!462202))

(declare-fun res!564841 () Bool)

(assert (=> d!105499 (=> (not res!564841) (not e!462202))))

(assert (=> d!105499 (= res!564841 (or (bvsge #b00000000000000000000000000000000 (size!22690 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))))

(declare-fun lt!375728 () ListLongMap!8849)

(assert (=> d!105499 (= lt!375731 lt!375728)))

(declare-fun lt!375722 () Unit!28394)

(assert (=> d!105499 (= lt!375722 e!462198)))

(declare-fun c!89887 () Bool)

(assert (=> d!105499 (= c!89887 e!462194)))

(declare-fun res!564838 () Bool)

(assert (=> d!105499 (=> (not res!564838) (not e!462194))))

(assert (=> d!105499 (= res!564838 (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(assert (=> d!105499 (= lt!375728 e!462201)))

(assert (=> d!105499 (= c!89884 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105499 (validMask!0 mask!1312)))

(assert (=> d!105499 (= (getCurrentListMap!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375731)))

(declare-fun b!829317 () Bool)

(assert (=> b!829317 (= e!462199 (not call!36063))))

(declare-fun b!829318 () Bool)

(assert (=> b!829318 (= e!462197 e!462192)))

(declare-fun res!564834 () Bool)

(assert (=> b!829318 (= res!564834 call!36060)))

(assert (=> b!829318 (=> (not res!564834) (not e!462192))))

(declare-fun b!829319 () Bool)

(assert (=> b!829319 (= e!462196 (validKeyInArray!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829320 () Bool)

(declare-fun Unit!28398 () Unit!28394)

(assert (=> b!829320 (= e!462198 Unit!28398)))

(assert (= (and d!105499 c!89884) b!829302))

(assert (= (and d!105499 (not c!89884)) b!829316))

(assert (= (and b!829316 c!89888) b!829311))

(assert (= (and b!829316 (not c!89888)) b!829314))

(assert (= (and b!829314 c!89883) b!829306))

(assert (= (and b!829314 (not c!89883)) b!829310))

(assert (= (or b!829306 b!829310) bm!36054))

(assert (= (or b!829311 bm!36054) bm!36060))

(assert (= (or b!829311 b!829306) bm!36059))

(assert (= (or b!829302 bm!36060) bm!36058))

(assert (= (or b!829302 bm!36059) bm!36056))

(assert (= (and d!105499 res!564838) b!829307))

(assert (= (and d!105499 c!89887) b!829313))

(assert (= (and d!105499 (not c!89887)) b!829320))

(assert (= (and d!105499 res!564841) b!829305))

(assert (= (and b!829305 res!564839) b!829319))

(assert (= (and b!829305 (not res!564837)) b!829315))

(assert (= (and b!829315 res!564842) b!829312))

(assert (= (and b!829305 res!564835) b!829301))

(assert (= (and b!829301 c!89885) b!829300))

(assert (= (and b!829301 (not c!89885)) b!829317))

(assert (= (and b!829300 res!564836) b!829304))

(assert (= (or b!829300 b!829317) bm!36057))

(assert (= (and b!829301 res!564840) b!829308))

(assert (= (and b!829308 c!89886) b!829318))

(assert (= (and b!829308 (not c!89886)) b!829309))

(assert (= (and b!829318 res!564834) b!829303))

(assert (= (or b!829318 b!829309) bm!36055))

(declare-fun b_lambda!11217 () Bool)

(assert (=> (not b_lambda!11217) (not b!829312)))

(declare-fun t!22151 () Bool)

(declare-fun tb!4205 () Bool)

(assert (=> (and start!71484 (= defaultEntry!796 defaultEntry!796) t!22151) tb!4205))

(declare-fun result!7971 () Bool)

(assert (=> tb!4205 (= result!7971 tp_is_empty!15145)))

(assert (=> b!829312 t!22151))

(declare-fun b_and!22409 () Bool)

(assert (= b_and!22403 (and (=> t!22151 result!7971) b_and!22409)))

(declare-fun m!772607 () Bool)

(assert (=> b!829302 m!772607))

(declare-fun m!772609 () Bool)

(assert (=> bm!36055 m!772609))

(assert (=> d!105499 m!772541))

(declare-fun m!772611 () Bool)

(assert (=> bm!36056 m!772611))

(assert (=> b!829315 m!772595))

(assert (=> b!829315 m!772595))

(declare-fun m!772613 () Bool)

(assert (=> b!829315 m!772613))

(assert (=> b!829312 m!772595))

(declare-fun m!772615 () Bool)

(assert (=> b!829312 m!772615))

(declare-fun m!772617 () Bool)

(assert (=> b!829312 m!772617))

(declare-fun m!772619 () Bool)

(assert (=> b!829312 m!772619))

(assert (=> b!829312 m!772615))

(assert (=> b!829312 m!772617))

(assert (=> b!829312 m!772595))

(declare-fun m!772621 () Bool)

(assert (=> b!829312 m!772621))

(declare-fun m!772623 () Bool)

(assert (=> b!829303 m!772623))

(declare-fun m!772625 () Bool)

(assert (=> bm!36057 m!772625))

(assert (=> b!829307 m!772595))

(assert (=> b!829307 m!772595))

(assert (=> b!829307 m!772597))

(assert (=> b!829319 m!772595))

(assert (=> b!829319 m!772595))

(assert (=> b!829319 m!772597))

(assert (=> b!829313 m!772595))

(declare-fun m!772627 () Bool)

(assert (=> b!829313 m!772627))

(declare-fun m!772629 () Bool)

(assert (=> b!829313 m!772629))

(declare-fun m!772631 () Bool)

(assert (=> b!829313 m!772631))

(declare-fun m!772633 () Bool)

(assert (=> b!829313 m!772633))

(declare-fun m!772635 () Bool)

(assert (=> b!829313 m!772635))

(declare-fun m!772637 () Bool)

(assert (=> b!829313 m!772637))

(assert (=> b!829313 m!772529))

(declare-fun m!772639 () Bool)

(assert (=> b!829313 m!772639))

(declare-fun m!772641 () Bool)

(assert (=> b!829313 m!772641))

(assert (=> b!829313 m!772629))

(assert (=> b!829313 m!772633))

(declare-fun m!772643 () Bool)

(assert (=> b!829313 m!772643))

(declare-fun m!772645 () Bool)

(assert (=> b!829313 m!772645))

(declare-fun m!772647 () Bool)

(assert (=> b!829313 m!772647))

(declare-fun m!772649 () Bool)

(assert (=> b!829313 m!772649))

(declare-fun m!772651 () Bool)

(assert (=> b!829313 m!772651))

(assert (=> b!829313 m!772639))

(assert (=> b!829313 m!772647))

(declare-fun m!772653 () Bool)

(assert (=> b!829313 m!772653))

(declare-fun m!772655 () Bool)

(assert (=> b!829313 m!772655))

(declare-fun m!772657 () Bool)

(assert (=> b!829304 m!772657))

(assert (=> bm!36058 m!772529))

(assert (=> b!829197 d!105499))

(declare-fun d!105501 () Bool)

(declare-fun e!462205 () Bool)

(assert (=> d!105501 e!462205))

(declare-fun res!564848 () Bool)

(assert (=> d!105501 (=> (not res!564848) (not e!462205))))

(declare-fun lt!375755 () ListLongMap!8849)

(assert (=> d!105501 (= res!564848 (contains!4168 lt!375755 (_1!5023 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!375754 () List!15801)

(assert (=> d!105501 (= lt!375755 (ListLongMap!8850 lt!375754))))

(declare-fun lt!375753 () Unit!28394)

(declare-fun lt!375752 () Unit!28394)

(assert (=> d!105501 (= lt!375753 lt!375752)))

(declare-datatypes ((Option!416 0))(
  ( (Some!415 (v!10059 V!25195)) (None!414) )
))
(declare-fun getValueByKey!410 (List!15801 (_ BitVec 64)) Option!416)

(assert (=> d!105501 (= (getValueByKey!410 lt!375754 (_1!5023 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!415 (_2!5023 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!224 (List!15801 (_ BitVec 64) V!25195) Unit!28394)

(assert (=> d!105501 (= lt!375752 (lemmaContainsTupThenGetReturnValue!224 lt!375754 (_1!5023 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5023 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun insertStrictlySorted!263 (List!15801 (_ BitVec 64) V!25195) List!15801)

(assert (=> d!105501 (= lt!375754 (insertStrictlySorted!263 (toList!4440 lt!375642) (_1!5023 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5023 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105501 (= (+!1963 lt!375642 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!375755)))

(declare-fun b!829327 () Bool)

(declare-fun res!564847 () Bool)

(assert (=> b!829327 (=> (not res!564847) (not e!462205))))

(assert (=> b!829327 (= res!564847 (= (getValueByKey!410 (toList!4440 lt!375755) (_1!5023 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!415 (_2!5023 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!829328 () Bool)

(declare-fun contains!4169 (List!15801 tuple2!10024) Bool)

(assert (=> b!829328 (= e!462205 (contains!4169 (toList!4440 lt!375755) (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!105501 res!564848) b!829327))

(assert (= (and b!829327 res!564847) b!829328))

(declare-fun m!772659 () Bool)

(assert (=> d!105501 m!772659))

(declare-fun m!772661 () Bool)

(assert (=> d!105501 m!772661))

(declare-fun m!772663 () Bool)

(assert (=> d!105501 m!772663))

(declare-fun m!772665 () Bool)

(assert (=> d!105501 m!772665))

(declare-fun m!772667 () Bool)

(assert (=> b!829327 m!772667))

(declare-fun m!772669 () Bool)

(assert (=> b!829328 m!772669))

(assert (=> b!829197 d!105501))

(declare-fun b!829329 () Bool)

(declare-fun e!462215 () Bool)

(declare-fun e!462207 () Bool)

(assert (=> b!829329 (= e!462215 e!462207)))

(declare-fun res!564851 () Bool)

(declare-fun call!36070 () Bool)

(assert (=> b!829329 (= res!564851 call!36070)))

(assert (=> b!829329 (=> (not res!564851) (not e!462207))))

(declare-fun b!829330 () Bool)

(declare-fun res!564855 () Bool)

(declare-fun e!462218 () Bool)

(assert (=> b!829330 (=> (not res!564855) (not e!462218))))

(assert (=> b!829330 (= res!564855 e!462215)))

(declare-fun c!89891 () Bool)

(assert (=> b!829330 (= c!89891 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!829331 () Bool)

(declare-fun e!462217 () ListLongMap!8849)

(declare-fun call!36064 () ListLongMap!8849)

(assert (=> b!829331 (= e!462217 (+!1963 call!36064 (tuple2!10025 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36061 () Bool)

(declare-fun call!36068 () ListLongMap!8849)

(declare-fun call!36065 () ListLongMap!8849)

(assert (=> bm!36061 (= call!36068 call!36065)))

(declare-fun b!829332 () Bool)

(declare-fun e!462208 () Bool)

(declare-fun lt!375765 () ListLongMap!8849)

(assert (=> b!829332 (= e!462208 (= (apply!366 lt!375765 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829333 () Bool)

(assert (=> b!829333 (= e!462207 (= (apply!366 lt!375765 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!829334 () Bool)

(declare-fun res!564850 () Bool)

(assert (=> b!829334 (=> (not res!564850) (not e!462218))))

(declare-fun e!462211 () Bool)

(assert (=> b!829334 (= res!564850 e!462211)))

(declare-fun res!564852 () Bool)

(assert (=> b!829334 (=> res!564852 e!462211)))

(declare-fun e!462212 () Bool)

(assert (=> b!829334 (= res!564852 (not e!462212))))

(declare-fun res!564854 () Bool)

(assert (=> b!829334 (=> (not res!564854) (not e!462212))))

(assert (=> b!829334 (= res!564854 (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun b!829335 () Bool)

(declare-fun e!462209 () ListLongMap!8849)

(declare-fun call!36069 () ListLongMap!8849)

(assert (=> b!829335 (= e!462209 call!36069)))

(declare-fun bm!36062 () Bool)

(declare-fun call!36067 () Bool)

(assert (=> bm!36062 (= call!36067 (contains!4168 lt!375765 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829336 () Bool)

(declare-fun e!462210 () Bool)

(assert (=> b!829336 (= e!462210 (validKeyInArray!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun c!89890 () Bool)

(declare-fun bm!36063 () Bool)

(declare-fun call!36066 () ListLongMap!8849)

(declare-fun c!89894 () Bool)

(assert (=> bm!36063 (= call!36064 (+!1963 (ite c!89890 call!36066 (ite c!89894 call!36065 call!36068)) (ite (or c!89890 c!89894) (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10025 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829337 () Bool)

(declare-fun e!462213 () Bool)

(assert (=> b!829337 (= e!462218 e!462213)))

(declare-fun c!89892 () Bool)

(assert (=> b!829337 (= c!89892 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829338 () Bool)

(assert (=> b!829338 (= e!462213 (not call!36067))))

(declare-fun bm!36065 () Bool)

(assert (=> bm!36065 (= call!36066 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829339 () Bool)

(assert (=> b!829339 (= e!462209 call!36068)))

(declare-fun bm!36066 () Bool)

(assert (=> bm!36066 (= call!36069 call!36064)))

(declare-fun b!829340 () Bool)

(declare-fun e!462216 () ListLongMap!8849)

(assert (=> b!829340 (= e!462216 call!36069)))

(declare-fun b!829341 () Bool)

(declare-fun e!462206 () Bool)

(assert (=> b!829341 (= e!462206 (= (apply!366 lt!375765 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)) (get!11794 (select (arr!22271 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829341 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22691 _values!788)))))

(assert (=> b!829341 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun b!829342 () Bool)

(declare-fun e!462214 () Unit!28394)

(declare-fun lt!375776 () Unit!28394)

(assert (=> b!829342 (= e!462214 lt!375776)))

(declare-fun lt!375760 () ListLongMap!8849)

(assert (=> b!829342 (= lt!375760 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375773 () (_ BitVec 64))

(assert (=> b!829342 (= lt!375773 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375770 () (_ BitVec 64))

(assert (=> b!829342 (= lt!375770 (select (arr!22270 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375763 () Unit!28394)

(assert (=> b!829342 (= lt!375763 (addStillContains!317 lt!375760 lt!375773 zeroValueAfter!34 lt!375770))))

(assert (=> b!829342 (contains!4168 (+!1963 lt!375760 (tuple2!10025 lt!375773 zeroValueAfter!34)) lt!375770)))

(declare-fun lt!375764 () Unit!28394)

(assert (=> b!829342 (= lt!375764 lt!375763)))

(declare-fun lt!375758 () ListLongMap!8849)

(assert (=> b!829342 (= lt!375758 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375775 () (_ BitVec 64))

(assert (=> b!829342 (= lt!375775 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375777 () (_ BitVec 64))

(assert (=> b!829342 (= lt!375777 (select (arr!22270 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375774 () Unit!28394)

(assert (=> b!829342 (= lt!375774 (addApplyDifferent!317 lt!375758 lt!375775 minValue!754 lt!375777))))

(assert (=> b!829342 (= (apply!366 (+!1963 lt!375758 (tuple2!10025 lt!375775 minValue!754)) lt!375777) (apply!366 lt!375758 lt!375777))))

(declare-fun lt!375757 () Unit!28394)

(assert (=> b!829342 (= lt!375757 lt!375774)))

(declare-fun lt!375768 () ListLongMap!8849)

(assert (=> b!829342 (= lt!375768 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375767 () (_ BitVec 64))

(assert (=> b!829342 (= lt!375767 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375766 () (_ BitVec 64))

(assert (=> b!829342 (= lt!375766 (select (arr!22270 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375759 () Unit!28394)

(assert (=> b!829342 (= lt!375759 (addApplyDifferent!317 lt!375768 lt!375767 zeroValueAfter!34 lt!375766))))

(assert (=> b!829342 (= (apply!366 (+!1963 lt!375768 (tuple2!10025 lt!375767 zeroValueAfter!34)) lt!375766) (apply!366 lt!375768 lt!375766))))

(declare-fun lt!375769 () Unit!28394)

(assert (=> b!829342 (= lt!375769 lt!375759)))

(declare-fun lt!375761 () ListLongMap!8849)

(assert (=> b!829342 (= lt!375761 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375771 () (_ BitVec 64))

(assert (=> b!829342 (= lt!375771 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375772 () (_ BitVec 64))

(assert (=> b!829342 (= lt!375772 (select (arr!22270 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829342 (= lt!375776 (addApplyDifferent!317 lt!375761 lt!375771 minValue!754 lt!375772))))

(assert (=> b!829342 (= (apply!366 (+!1963 lt!375761 (tuple2!10025 lt!375771 minValue!754)) lt!375772) (apply!366 lt!375761 lt!375772))))

(declare-fun b!829343 () Bool)

(declare-fun c!89889 () Bool)

(assert (=> b!829343 (= c!89889 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829343 (= e!462216 e!462209)))

(declare-fun b!829344 () Bool)

(assert (=> b!829344 (= e!462211 e!462206)))

(declare-fun res!564857 () Bool)

(assert (=> b!829344 (=> (not res!564857) (not e!462206))))

(assert (=> b!829344 (= res!564857 (contains!4168 lt!375765 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829344 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun bm!36067 () Bool)

(assert (=> bm!36067 (= call!36065 call!36066)))

(declare-fun b!829345 () Bool)

(assert (=> b!829345 (= e!462217 e!462216)))

(assert (=> b!829345 (= c!89894 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36064 () Bool)

(assert (=> bm!36064 (= call!36070 (contains!4168 lt!375765 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105503 () Bool)

(assert (=> d!105503 e!462218))

(declare-fun res!564856 () Bool)

(assert (=> d!105503 (=> (not res!564856) (not e!462218))))

(assert (=> d!105503 (= res!564856 (or (bvsge #b00000000000000000000000000000000 (size!22690 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))))

(declare-fun lt!375762 () ListLongMap!8849)

(assert (=> d!105503 (= lt!375765 lt!375762)))

(declare-fun lt!375756 () Unit!28394)

(assert (=> d!105503 (= lt!375756 e!462214)))

(declare-fun c!89893 () Bool)

(assert (=> d!105503 (= c!89893 e!462210)))

(declare-fun res!564853 () Bool)

(assert (=> d!105503 (=> (not res!564853) (not e!462210))))

(assert (=> d!105503 (= res!564853 (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(assert (=> d!105503 (= lt!375762 e!462217)))

(assert (=> d!105503 (= c!89890 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105503 (validMask!0 mask!1312)))

(assert (=> d!105503 (= (getCurrentListMap!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375765)))

(declare-fun b!829346 () Bool)

(assert (=> b!829346 (= e!462215 (not call!36070))))

(declare-fun b!829347 () Bool)

(assert (=> b!829347 (= e!462213 e!462208)))

(declare-fun res!564849 () Bool)

(assert (=> b!829347 (= res!564849 call!36067)))

(assert (=> b!829347 (=> (not res!564849) (not e!462208))))

(declare-fun b!829348 () Bool)

(assert (=> b!829348 (= e!462212 (validKeyInArray!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829349 () Bool)

(declare-fun Unit!28399 () Unit!28394)

(assert (=> b!829349 (= e!462214 Unit!28399)))

(assert (= (and d!105503 c!89890) b!829331))

(assert (= (and d!105503 (not c!89890)) b!829345))

(assert (= (and b!829345 c!89894) b!829340))

(assert (= (and b!829345 (not c!89894)) b!829343))

(assert (= (and b!829343 c!89889) b!829335))

(assert (= (and b!829343 (not c!89889)) b!829339))

(assert (= (or b!829335 b!829339) bm!36061))

(assert (= (or b!829340 bm!36061) bm!36067))

(assert (= (or b!829340 b!829335) bm!36066))

(assert (= (or b!829331 bm!36067) bm!36065))

(assert (= (or b!829331 bm!36066) bm!36063))

(assert (= (and d!105503 res!564853) b!829336))

(assert (= (and d!105503 c!89893) b!829342))

(assert (= (and d!105503 (not c!89893)) b!829349))

(assert (= (and d!105503 res!564856) b!829334))

(assert (= (and b!829334 res!564854) b!829348))

(assert (= (and b!829334 (not res!564852)) b!829344))

(assert (= (and b!829344 res!564857) b!829341))

(assert (= (and b!829334 res!564850) b!829330))

(assert (= (and b!829330 c!89891) b!829329))

(assert (= (and b!829330 (not c!89891)) b!829346))

(assert (= (and b!829329 res!564851) b!829333))

(assert (= (or b!829329 b!829346) bm!36064))

(assert (= (and b!829330 res!564855) b!829337))

(assert (= (and b!829337 c!89892) b!829347))

(assert (= (and b!829337 (not c!89892)) b!829338))

(assert (= (and b!829347 res!564849) b!829332))

(assert (= (or b!829347 b!829338) bm!36062))

(declare-fun b_lambda!11219 () Bool)

(assert (=> (not b_lambda!11219) (not b!829341)))

(assert (=> b!829341 t!22151))

(declare-fun b_and!22411 () Bool)

(assert (= b_and!22409 (and (=> t!22151 result!7971) b_and!22411)))

(declare-fun m!772671 () Bool)

(assert (=> b!829331 m!772671))

(declare-fun m!772673 () Bool)

(assert (=> bm!36062 m!772673))

(assert (=> d!105503 m!772541))

(declare-fun m!772675 () Bool)

(assert (=> bm!36063 m!772675))

(assert (=> b!829344 m!772595))

(assert (=> b!829344 m!772595))

(declare-fun m!772677 () Bool)

(assert (=> b!829344 m!772677))

(assert (=> b!829341 m!772595))

(assert (=> b!829341 m!772615))

(assert (=> b!829341 m!772617))

(assert (=> b!829341 m!772619))

(assert (=> b!829341 m!772615))

(assert (=> b!829341 m!772617))

(assert (=> b!829341 m!772595))

(declare-fun m!772679 () Bool)

(assert (=> b!829341 m!772679))

(declare-fun m!772681 () Bool)

(assert (=> b!829332 m!772681))

(declare-fun m!772683 () Bool)

(assert (=> bm!36064 m!772683))

(assert (=> b!829336 m!772595))

(assert (=> b!829336 m!772595))

(assert (=> b!829336 m!772597))

(assert (=> b!829348 m!772595))

(assert (=> b!829348 m!772595))

(assert (=> b!829348 m!772597))

(assert (=> b!829342 m!772595))

(declare-fun m!772685 () Bool)

(assert (=> b!829342 m!772685))

(declare-fun m!772687 () Bool)

(assert (=> b!829342 m!772687))

(declare-fun m!772689 () Bool)

(assert (=> b!829342 m!772689))

(declare-fun m!772691 () Bool)

(assert (=> b!829342 m!772691))

(declare-fun m!772693 () Bool)

(assert (=> b!829342 m!772693))

(declare-fun m!772695 () Bool)

(assert (=> b!829342 m!772695))

(assert (=> b!829342 m!772527))

(declare-fun m!772697 () Bool)

(assert (=> b!829342 m!772697))

(declare-fun m!772699 () Bool)

(assert (=> b!829342 m!772699))

(assert (=> b!829342 m!772687))

(assert (=> b!829342 m!772691))

(declare-fun m!772701 () Bool)

(assert (=> b!829342 m!772701))

(declare-fun m!772703 () Bool)

(assert (=> b!829342 m!772703))

(declare-fun m!772705 () Bool)

(assert (=> b!829342 m!772705))

(declare-fun m!772707 () Bool)

(assert (=> b!829342 m!772707))

(declare-fun m!772709 () Bool)

(assert (=> b!829342 m!772709))

(assert (=> b!829342 m!772697))

(assert (=> b!829342 m!772705))

(declare-fun m!772711 () Bool)

(assert (=> b!829342 m!772711))

(declare-fun m!772713 () Bool)

(assert (=> b!829342 m!772713))

(declare-fun m!772715 () Bool)

(assert (=> b!829333 m!772715))

(assert (=> bm!36065 m!772527))

(assert (=> b!829197 d!105503))

(declare-fun d!105505 () Bool)

(assert (=> d!105505 (= (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375780 () Unit!28394)

(declare-fun choose!1416 (array!46465 array!46467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25195 V!25195 V!25195 V!25195 (_ BitVec 32) Int) Unit!28394)

(assert (=> d!105505 (= lt!375780 (choose!1416 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105505 (validMask!0 mask!1312)))

(assert (=> d!105505 (= (lemmaNoChangeToArrayThenSameMapNoExtras!584 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375780)))

(declare-fun bs!23162 () Bool)

(assert (= bs!23162 d!105505))

(assert (=> bs!23162 m!772529))

(assert (=> bs!23162 m!772527))

(declare-fun m!772717 () Bool)

(assert (=> bs!23162 m!772717))

(assert (=> bs!23162 m!772541))

(assert (=> b!829190 d!105505))

(declare-fun b!829374 () Bool)

(declare-fun e!462236 () ListLongMap!8849)

(declare-fun call!36073 () ListLongMap!8849)

(assert (=> b!829374 (= e!462236 call!36073)))

(declare-fun bm!36070 () Bool)

(assert (=> bm!36070 (= call!36073 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829375 () Bool)

(declare-fun e!462237 () Bool)

(declare-fun lt!375796 () ListLongMap!8849)

(declare-fun isEmpty!654 (ListLongMap!8849) Bool)

(assert (=> b!829375 (= e!462237 (isEmpty!654 lt!375796))))

(declare-fun b!829376 () Bool)

(declare-fun e!462238 () ListLongMap!8849)

(assert (=> b!829376 (= e!462238 e!462236)))

(declare-fun c!89905 () Bool)

(assert (=> b!829376 (= c!89905 (validKeyInArray!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829377 () Bool)

(declare-fun res!564866 () Bool)

(declare-fun e!462235 () Bool)

(assert (=> b!829377 (=> (not res!564866) (not e!462235))))

(assert (=> b!829377 (= res!564866 (not (contains!4168 lt!375796 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!105507 () Bool)

(assert (=> d!105507 e!462235))

(declare-fun res!564869 () Bool)

(assert (=> d!105507 (=> (not res!564869) (not e!462235))))

(assert (=> d!105507 (= res!564869 (not (contains!4168 lt!375796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105507 (= lt!375796 e!462238)))

(declare-fun c!89904 () Bool)

(assert (=> d!105507 (= c!89904 (bvsge #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(assert (=> d!105507 (validMask!0 mask!1312)))

(assert (=> d!105507 (= (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375796)))

(declare-fun b!829378 () Bool)

(declare-fun e!462233 () Bool)

(assert (=> b!829378 (= e!462235 e!462233)))

(declare-fun c!89906 () Bool)

(declare-fun e!462239 () Bool)

(assert (=> b!829378 (= c!89906 e!462239)))

(declare-fun res!564867 () Bool)

(assert (=> b!829378 (=> (not res!564867) (not e!462239))))

(assert (=> b!829378 (= res!564867 (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun b!829379 () Bool)

(assert (=> b!829379 (= e!462237 (= lt!375796 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829380 () Bool)

(assert (=> b!829380 (= e!462239 (validKeyInArray!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829380 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829381 () Bool)

(declare-fun lt!375797 () Unit!28394)

(declare-fun lt!375795 () Unit!28394)

(assert (=> b!829381 (= lt!375797 lt!375795)))

(declare-fun lt!375801 () (_ BitVec 64))

(declare-fun lt!375799 () V!25195)

(declare-fun lt!375798 () ListLongMap!8849)

(declare-fun lt!375800 () (_ BitVec 64))

(assert (=> b!829381 (not (contains!4168 (+!1963 lt!375798 (tuple2!10025 lt!375800 lt!375799)) lt!375801))))

(declare-fun addStillNotContains!193 (ListLongMap!8849 (_ BitVec 64) V!25195 (_ BitVec 64)) Unit!28394)

(assert (=> b!829381 (= lt!375795 (addStillNotContains!193 lt!375798 lt!375800 lt!375799 lt!375801))))

(assert (=> b!829381 (= lt!375801 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829381 (= lt!375799 (get!11794 (select (arr!22271 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829381 (= lt!375800 (select (arr!22270 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829381 (= lt!375798 call!36073)))

(assert (=> b!829381 (= e!462236 (+!1963 call!36073 (tuple2!10025 (select (arr!22270 _keys!976) #b00000000000000000000000000000000) (get!11794 (select (arr!22271 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829382 () Bool)

(assert (=> b!829382 (= e!462238 (ListLongMap!8850 Nil!15798))))

(declare-fun b!829383 () Bool)

(assert (=> b!829383 (= e!462233 e!462237)))

(declare-fun c!89903 () Bool)

(assert (=> b!829383 (= c!89903 (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun b!829384 () Bool)

(assert (=> b!829384 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(assert (=> b!829384 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22691 _values!788)))))

(declare-fun e!462234 () Bool)

(assert (=> b!829384 (= e!462234 (= (apply!366 lt!375796 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)) (get!11794 (select (arr!22271 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829385 () Bool)

(assert (=> b!829385 (= e!462233 e!462234)))

(assert (=> b!829385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun res!564868 () Bool)

(assert (=> b!829385 (= res!564868 (contains!4168 lt!375796 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829385 (=> (not res!564868) (not e!462234))))

(assert (= (and d!105507 c!89904) b!829382))

(assert (= (and d!105507 (not c!89904)) b!829376))

(assert (= (and b!829376 c!89905) b!829381))

(assert (= (and b!829376 (not c!89905)) b!829374))

(assert (= (or b!829381 b!829374) bm!36070))

(assert (= (and d!105507 res!564869) b!829377))

(assert (= (and b!829377 res!564866) b!829378))

(assert (= (and b!829378 res!564867) b!829380))

(assert (= (and b!829378 c!89906) b!829385))

(assert (= (and b!829378 (not c!89906)) b!829383))

(assert (= (and b!829385 res!564868) b!829384))

(assert (= (and b!829383 c!89903) b!829379))

(assert (= (and b!829383 (not c!89903)) b!829375))

(declare-fun b_lambda!11221 () Bool)

(assert (=> (not b_lambda!11221) (not b!829381)))

(assert (=> b!829381 t!22151))

(declare-fun b_and!22413 () Bool)

(assert (= b_and!22411 (and (=> t!22151 result!7971) b_and!22413)))

(declare-fun b_lambda!11223 () Bool)

(assert (=> (not b_lambda!11223) (not b!829384)))

(assert (=> b!829384 t!22151))

(declare-fun b_and!22415 () Bool)

(assert (= b_and!22413 (and (=> t!22151 result!7971) b_and!22415)))

(assert (=> b!829376 m!772595))

(assert (=> b!829376 m!772595))

(assert (=> b!829376 m!772597))

(declare-fun m!772719 () Bool)

(assert (=> b!829375 m!772719))

(declare-fun m!772721 () Bool)

(assert (=> bm!36070 m!772721))

(declare-fun m!772723 () Bool)

(assert (=> b!829381 m!772723))

(assert (=> b!829381 m!772615))

(assert (=> b!829381 m!772595))

(declare-fun m!772725 () Bool)

(assert (=> b!829381 m!772725))

(declare-fun m!772727 () Bool)

(assert (=> b!829381 m!772727))

(declare-fun m!772729 () Bool)

(assert (=> b!829381 m!772729))

(assert (=> b!829381 m!772615))

(assert (=> b!829381 m!772617))

(assert (=> b!829381 m!772619))

(assert (=> b!829381 m!772617))

(assert (=> b!829381 m!772725))

(assert (=> b!829380 m!772595))

(assert (=> b!829380 m!772595))

(assert (=> b!829380 m!772597))

(declare-fun m!772731 () Bool)

(assert (=> d!105507 m!772731))

(assert (=> d!105507 m!772541))

(assert (=> b!829385 m!772595))

(assert (=> b!829385 m!772595))

(declare-fun m!772733 () Bool)

(assert (=> b!829385 m!772733))

(assert (=> b!829379 m!772721))

(assert (=> b!829384 m!772615))

(assert (=> b!829384 m!772617))

(assert (=> b!829384 m!772619))

(assert (=> b!829384 m!772595))

(declare-fun m!772735 () Bool)

(assert (=> b!829384 m!772735))

(assert (=> b!829384 m!772615))

(assert (=> b!829384 m!772595))

(assert (=> b!829384 m!772617))

(declare-fun m!772737 () Bool)

(assert (=> b!829377 m!772737))

(assert (=> b!829190 d!105507))

(declare-fun b!829386 () Bool)

(declare-fun e!462243 () ListLongMap!8849)

(declare-fun call!36074 () ListLongMap!8849)

(assert (=> b!829386 (= e!462243 call!36074)))

(declare-fun bm!36071 () Bool)

(assert (=> bm!36071 (= call!36074 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829387 () Bool)

(declare-fun e!462244 () Bool)

(declare-fun lt!375803 () ListLongMap!8849)

(assert (=> b!829387 (= e!462244 (isEmpty!654 lt!375803))))

(declare-fun b!829388 () Bool)

(declare-fun e!462245 () ListLongMap!8849)

(assert (=> b!829388 (= e!462245 e!462243)))

(declare-fun c!89909 () Bool)

(assert (=> b!829388 (= c!89909 (validKeyInArray!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829389 () Bool)

(declare-fun res!564870 () Bool)

(declare-fun e!462242 () Bool)

(assert (=> b!829389 (=> (not res!564870) (not e!462242))))

(assert (=> b!829389 (= res!564870 (not (contains!4168 lt!375803 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!105509 () Bool)

(assert (=> d!105509 e!462242))

(declare-fun res!564873 () Bool)

(assert (=> d!105509 (=> (not res!564873) (not e!462242))))

(assert (=> d!105509 (= res!564873 (not (contains!4168 lt!375803 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105509 (= lt!375803 e!462245)))

(declare-fun c!89908 () Bool)

(assert (=> d!105509 (= c!89908 (bvsge #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(assert (=> d!105509 (validMask!0 mask!1312)))

(assert (=> d!105509 (= (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375803)))

(declare-fun b!829390 () Bool)

(declare-fun e!462240 () Bool)

(assert (=> b!829390 (= e!462242 e!462240)))

(declare-fun c!89910 () Bool)

(declare-fun e!462246 () Bool)

(assert (=> b!829390 (= c!89910 e!462246)))

(declare-fun res!564871 () Bool)

(assert (=> b!829390 (=> (not res!564871) (not e!462246))))

(assert (=> b!829390 (= res!564871 (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun b!829391 () Bool)

(assert (=> b!829391 (= e!462244 (= lt!375803 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829392 () Bool)

(assert (=> b!829392 (= e!462246 (validKeyInArray!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829392 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829393 () Bool)

(declare-fun lt!375804 () Unit!28394)

(declare-fun lt!375802 () Unit!28394)

(assert (=> b!829393 (= lt!375804 lt!375802)))

(declare-fun lt!375808 () (_ BitVec 64))

(declare-fun lt!375806 () V!25195)

(declare-fun lt!375807 () (_ BitVec 64))

(declare-fun lt!375805 () ListLongMap!8849)

(assert (=> b!829393 (not (contains!4168 (+!1963 lt!375805 (tuple2!10025 lt!375807 lt!375806)) lt!375808))))

(assert (=> b!829393 (= lt!375802 (addStillNotContains!193 lt!375805 lt!375807 lt!375806 lt!375808))))

(assert (=> b!829393 (= lt!375808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829393 (= lt!375806 (get!11794 (select (arr!22271 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829393 (= lt!375807 (select (arr!22270 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829393 (= lt!375805 call!36074)))

(assert (=> b!829393 (= e!462243 (+!1963 call!36074 (tuple2!10025 (select (arr!22270 _keys!976) #b00000000000000000000000000000000) (get!11794 (select (arr!22271 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829394 () Bool)

(assert (=> b!829394 (= e!462245 (ListLongMap!8850 Nil!15798))))

(declare-fun b!829395 () Bool)

(assert (=> b!829395 (= e!462240 e!462244)))

(declare-fun c!89907 () Bool)

(assert (=> b!829395 (= c!89907 (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun b!829396 () Bool)

(assert (=> b!829396 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(assert (=> b!829396 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22691 _values!788)))))

(declare-fun e!462241 () Bool)

(assert (=> b!829396 (= e!462241 (= (apply!366 lt!375803 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)) (get!11794 (select (arr!22271 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!829397 () Bool)

(assert (=> b!829397 (= e!462240 e!462241)))

(assert (=> b!829397 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(declare-fun res!564872 () Bool)

(assert (=> b!829397 (= res!564872 (contains!4168 lt!375803 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829397 (=> (not res!564872) (not e!462241))))

(assert (= (and d!105509 c!89908) b!829394))

(assert (= (and d!105509 (not c!89908)) b!829388))

(assert (= (and b!829388 c!89909) b!829393))

(assert (= (and b!829388 (not c!89909)) b!829386))

(assert (= (or b!829393 b!829386) bm!36071))

(assert (= (and d!105509 res!564873) b!829389))

(assert (= (and b!829389 res!564870) b!829390))

(assert (= (and b!829390 res!564871) b!829392))

(assert (= (and b!829390 c!89910) b!829397))

(assert (= (and b!829390 (not c!89910)) b!829395))

(assert (= (and b!829397 res!564872) b!829396))

(assert (= (and b!829395 c!89907) b!829391))

(assert (= (and b!829395 (not c!89907)) b!829387))

(declare-fun b_lambda!11225 () Bool)

(assert (=> (not b_lambda!11225) (not b!829393)))

(assert (=> b!829393 t!22151))

(declare-fun b_and!22417 () Bool)

(assert (= b_and!22415 (and (=> t!22151 result!7971) b_and!22417)))

(declare-fun b_lambda!11227 () Bool)

(assert (=> (not b_lambda!11227) (not b!829396)))

(assert (=> b!829396 t!22151))

(declare-fun b_and!22419 () Bool)

(assert (= b_and!22417 (and (=> t!22151 result!7971) b_and!22419)))

(assert (=> b!829388 m!772595))

(assert (=> b!829388 m!772595))

(assert (=> b!829388 m!772597))

(declare-fun m!772739 () Bool)

(assert (=> b!829387 m!772739))

(declare-fun m!772741 () Bool)

(assert (=> bm!36071 m!772741))

(declare-fun m!772743 () Bool)

(assert (=> b!829393 m!772743))

(assert (=> b!829393 m!772615))

(assert (=> b!829393 m!772595))

(declare-fun m!772745 () Bool)

(assert (=> b!829393 m!772745))

(declare-fun m!772747 () Bool)

(assert (=> b!829393 m!772747))

(declare-fun m!772749 () Bool)

(assert (=> b!829393 m!772749))

(assert (=> b!829393 m!772615))

(assert (=> b!829393 m!772617))

(assert (=> b!829393 m!772619))

(assert (=> b!829393 m!772617))

(assert (=> b!829393 m!772745))

(assert (=> b!829392 m!772595))

(assert (=> b!829392 m!772595))

(assert (=> b!829392 m!772597))

(declare-fun m!772751 () Bool)

(assert (=> d!105509 m!772751))

(assert (=> d!105509 m!772541))

(assert (=> b!829397 m!772595))

(assert (=> b!829397 m!772595))

(declare-fun m!772753 () Bool)

(assert (=> b!829397 m!772753))

(assert (=> b!829391 m!772741))

(assert (=> b!829396 m!772615))

(assert (=> b!829396 m!772617))

(assert (=> b!829396 m!772619))

(assert (=> b!829396 m!772595))

(declare-fun m!772755 () Bool)

(assert (=> b!829396 m!772755))

(assert (=> b!829396 m!772615))

(assert (=> b!829396 m!772595))

(assert (=> b!829396 m!772617))

(declare-fun m!772757 () Bool)

(assert (=> b!829389 m!772757))

(assert (=> b!829190 d!105509))

(declare-fun b!829408 () Bool)

(declare-fun e!462256 () Bool)

(declare-fun contains!4170 (List!15802 (_ BitVec 64)) Bool)

(assert (=> b!829408 (= e!462256 (contains!4170 Nil!15799 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829409 () Bool)

(declare-fun e!462258 () Bool)

(declare-fun call!36077 () Bool)

(assert (=> b!829409 (= e!462258 call!36077)))

(declare-fun b!829410 () Bool)

(assert (=> b!829410 (= e!462258 call!36077)))

(declare-fun b!829411 () Bool)

(declare-fun e!462257 () Bool)

(assert (=> b!829411 (= e!462257 e!462258)))

(declare-fun c!89913 () Bool)

(assert (=> b!829411 (= c!89913 (validKeyInArray!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829412 () Bool)

(declare-fun e!462255 () Bool)

(assert (=> b!829412 (= e!462255 e!462257)))

(declare-fun res!564880 () Bool)

(assert (=> b!829412 (=> (not res!564880) (not e!462257))))

(assert (=> b!829412 (= res!564880 (not e!462256))))

(declare-fun res!564881 () Bool)

(assert (=> b!829412 (=> (not res!564881) (not e!462256))))

(assert (=> b!829412 (= res!564881 (validKeyInArray!0 (select (arr!22270 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105511 () Bool)

(declare-fun res!564882 () Bool)

(assert (=> d!105511 (=> res!564882 e!462255)))

(assert (=> d!105511 (= res!564882 (bvsge #b00000000000000000000000000000000 (size!22690 _keys!976)))))

(assert (=> d!105511 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15799) e!462255)))

(declare-fun bm!36074 () Bool)

(assert (=> bm!36074 (= call!36077 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89913 (Cons!15798 (select (arr!22270 _keys!976) #b00000000000000000000000000000000) Nil!15799) Nil!15799)))))

(assert (= (and d!105511 (not res!564882)) b!829412))

(assert (= (and b!829412 res!564881) b!829408))

(assert (= (and b!829412 res!564880) b!829411))

(assert (= (and b!829411 c!89913) b!829409))

(assert (= (and b!829411 (not c!89913)) b!829410))

(assert (= (or b!829409 b!829410) bm!36074))

(assert (=> b!829408 m!772595))

(assert (=> b!829408 m!772595))

(declare-fun m!772759 () Bool)

(assert (=> b!829408 m!772759))

(assert (=> b!829411 m!772595))

(assert (=> b!829411 m!772595))

(assert (=> b!829411 m!772597))

(assert (=> b!829412 m!772595))

(assert (=> b!829412 m!772595))

(assert (=> b!829412 m!772597))

(assert (=> bm!36074 m!772595))

(declare-fun m!772761 () Bool)

(assert (=> bm!36074 m!772761))

(assert (=> b!829191 d!105511))

(declare-fun b!829419 () Bool)

(declare-fun e!462264 () Bool)

(assert (=> b!829419 (= e!462264 tp_is_empty!15145)))

(declare-fun mapNonEmpty!24361 () Bool)

(declare-fun mapRes!24361 () Bool)

(declare-fun tp!47089 () Bool)

(assert (=> mapNonEmpty!24361 (= mapRes!24361 (and tp!47089 e!462264))))

(declare-fun mapRest!24361 () (Array (_ BitVec 32) ValueCell!7157))

(declare-fun mapValue!24361 () ValueCell!7157)

(declare-fun mapKey!24361 () (_ BitVec 32))

(assert (=> mapNonEmpty!24361 (= mapRest!24352 (store mapRest!24361 mapKey!24361 mapValue!24361))))

(declare-fun condMapEmpty!24361 () Bool)

(declare-fun mapDefault!24361 () ValueCell!7157)

(assert (=> mapNonEmpty!24352 (= condMapEmpty!24361 (= mapRest!24352 ((as const (Array (_ BitVec 32) ValueCell!7157)) mapDefault!24361)))))

(declare-fun e!462263 () Bool)

(assert (=> mapNonEmpty!24352 (= tp!47073 (and e!462263 mapRes!24361))))

(declare-fun b!829420 () Bool)

(assert (=> b!829420 (= e!462263 tp_is_empty!15145)))

(declare-fun mapIsEmpty!24361 () Bool)

(assert (=> mapIsEmpty!24361 mapRes!24361))

(assert (= (and mapNonEmpty!24352 condMapEmpty!24361) mapIsEmpty!24361))

(assert (= (and mapNonEmpty!24352 (not condMapEmpty!24361)) mapNonEmpty!24361))

(assert (= (and mapNonEmpty!24361 ((_ is ValueCellFull!7157) mapValue!24361)) b!829419))

(assert (= (and mapNonEmpty!24352 ((_ is ValueCellFull!7157) mapDefault!24361)) b!829420))

(declare-fun m!772763 () Bool)

(assert (=> mapNonEmpty!24361 m!772763))

(declare-fun b_lambda!11229 () Bool)

(assert (= b_lambda!11225 (or (and start!71484 b_free!13435) b_lambda!11229)))

(declare-fun b_lambda!11231 () Bool)

(assert (= b_lambda!11221 (or (and start!71484 b_free!13435) b_lambda!11231)))

(declare-fun b_lambda!11233 () Bool)

(assert (= b_lambda!11227 (or (and start!71484 b_free!13435) b_lambda!11233)))

(declare-fun b_lambda!11235 () Bool)

(assert (= b_lambda!11219 (or (and start!71484 b_free!13435) b_lambda!11235)))

(declare-fun b_lambda!11237 () Bool)

(assert (= b_lambda!11217 (or (and start!71484 b_free!13435) b_lambda!11237)))

(declare-fun b_lambda!11239 () Bool)

(assert (= b_lambda!11223 (or (and start!71484 b_free!13435) b_lambda!11239)))

(check-sat (not b!829302) (not b_lambda!11237) (not b!829396) (not b!829348) tp_is_empty!15145 (not b!829381) (not b!829307) (not b!829375) (not b!829376) (not bm!36074) (not b!829342) (not b!829393) b_and!22419 (not b!829391) (not b!829327) (not bm!36055) (not b!829328) (not b!829384) (not b!829331) (not bm!36065) (not bm!36064) (not d!105501) (not b!829380) (not bm!36070) (not bm!36039) (not b!829341) (not b!829387) (not d!105499) (not b!829379) (not b!829397) (not b!829344) (not bm!36062) (not b!829389) (not bm!36057) (not b_lambda!11229) (not b_lambda!11239) (not b_next!13435) (not b!829315) (not b!829336) (not b_lambda!11231) (not b!829385) (not bm!36056) (not bm!36071) (not b!829392) (not b!829304) (not d!105507) (not b_lambda!11235) (not b!829388) (not b!829408) (not b!829332) (not bm!36058) (not d!105509) (not d!105505) (not d!105503) (not b!829377) (not b_lambda!11233) (not b!829313) (not bm!36063) (not b!829319) (not b!829411) (not b!829412) (not b!829257) (not b!829303) (not b!829255) (not b!829312) (not b!829333) (not mapNonEmpty!24361))
(check-sat b_and!22419 (not b_next!13435))
