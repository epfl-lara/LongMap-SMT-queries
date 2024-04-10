; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70178 () Bool)

(assert start!70178)

(declare-fun b_free!12585 () Bool)

(declare-fun b_next!12585 () Bool)

(assert (=> start!70178 (= b_free!12585 (not b_next!12585))))

(declare-fun tp!44472 () Bool)

(declare-fun b_and!21365 () Bool)

(assert (=> start!70178 (= tp!44472 b_and!21365)))

(declare-fun b!815382 () Bool)

(declare-fun e!452126 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((array!44790 0))(
  ( (array!44791 (arr!21454 (Array (_ BitVec 32) (_ BitVec 64))) (size!21875 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44790)

(assert (=> b!815382 (= e!452126 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!21875 _keys!976)))))))

(declare-datatypes ((V!24061 0))(
  ( (V!24062 (val!7195 Int)) )
))
(declare-datatypes ((tuple2!9436 0))(
  ( (tuple2!9437 (_1!4729 (_ BitVec 64)) (_2!4729 V!24061)) )
))
(declare-datatypes ((List!15268 0))(
  ( (Nil!15265) (Cons!15264 (h!16393 tuple2!9436) (t!21587 List!15268)) )
))
(declare-datatypes ((ListLongMap!8259 0))(
  ( (ListLongMap!8260 (toList!4145 List!15268)) )
))
(declare-fun lt!365026 () ListLongMap!8259)

(declare-fun lt!365025 () ListLongMap!8259)

(assert (=> b!815382 (= lt!365026 lt!365025)))

(declare-fun zeroValueBefore!34 () V!24061)

(declare-fun zeroValueAfter!34 () V!24061)

(declare-fun minValue!754 () V!24061)

(declare-datatypes ((ValueCell!6732 0))(
  ( (ValueCellFull!6732 (v!9622 V!24061)) (EmptyCell!6732) )
))
(declare-datatypes ((array!44792 0))(
  ( (array!44793 (arr!21455 (Array (_ BitVec 32) ValueCell!6732)) (size!21876 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44792)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27788 0))(
  ( (Unit!27789) )
))
(declare-fun lt!365024 () Unit!27788)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!305 (array!44790 array!44792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24061 V!24061 V!24061 V!24061 (_ BitVec 32) Int) Unit!27788)

(assert (=> b!815382 (= lt!365024 (lemmaNoChangeToArrayThenSameMapNoExtras!305 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2195 (array!44790 array!44792 (_ BitVec 32) (_ BitVec 32) V!24061 V!24061 (_ BitVec 32) Int) ListLongMap!8259)

(assert (=> b!815382 (= lt!365025 (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815382 (= lt!365026 (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815383 () Bool)

(declare-fun e!452127 () Bool)

(declare-fun e!452124 () Bool)

(declare-fun mapRes!23026 () Bool)

(assert (=> b!815383 (= e!452127 (and e!452124 mapRes!23026))))

(declare-fun condMapEmpty!23026 () Bool)

(declare-fun mapDefault!23026 () ValueCell!6732)

(assert (=> b!815383 (= condMapEmpty!23026 (= (arr!21455 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6732)) mapDefault!23026)))))

(declare-fun mapIsEmpty!23026 () Bool)

(assert (=> mapIsEmpty!23026 mapRes!23026))

(declare-fun b!815384 () Bool)

(declare-fun res!556799 () Bool)

(assert (=> b!815384 (=> (not res!556799) (not e!452126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44790 (_ BitVec 32)) Bool)

(assert (=> b!815384 (= res!556799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23026 () Bool)

(declare-fun tp!44473 () Bool)

(declare-fun e!452128 () Bool)

(assert (=> mapNonEmpty!23026 (= mapRes!23026 (and tp!44473 e!452128))))

(declare-fun mapRest!23026 () (Array (_ BitVec 32) ValueCell!6732))

(declare-fun mapValue!23026 () ValueCell!6732)

(declare-fun mapKey!23026 () (_ BitVec 32))

(assert (=> mapNonEmpty!23026 (= (arr!21455 _values!788) (store mapRest!23026 mapKey!23026 mapValue!23026))))

(declare-fun b!815385 () Bool)

(declare-fun tp_is_empty!14295 () Bool)

(assert (=> b!815385 (= e!452124 tp_is_empty!14295)))

(declare-fun b!815386 () Bool)

(assert (=> b!815386 (= e!452128 tp_is_empty!14295)))

(declare-fun res!556800 () Bool)

(assert (=> start!70178 (=> (not res!556800) (not e!452126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70178 (= res!556800 (validMask!0 mask!1312))))

(assert (=> start!70178 e!452126))

(assert (=> start!70178 tp_is_empty!14295))

(declare-fun array_inv!17167 (array!44790) Bool)

(assert (=> start!70178 (array_inv!17167 _keys!976)))

(assert (=> start!70178 true))

(declare-fun array_inv!17168 (array!44792) Bool)

(assert (=> start!70178 (and (array_inv!17168 _values!788) e!452127)))

(assert (=> start!70178 tp!44472))

(declare-fun b!815387 () Bool)

(declare-fun res!556801 () Bool)

(assert (=> b!815387 (=> (not res!556801) (not e!452126))))

(declare-datatypes ((List!15269 0))(
  ( (Nil!15266) (Cons!15265 (h!16394 (_ BitVec 64)) (t!21588 List!15269)) )
))
(declare-fun arrayNoDuplicates!0 (array!44790 (_ BitVec 32) List!15269) Bool)

(assert (=> b!815387 (= res!556801 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15266))))

(declare-fun b!815388 () Bool)

(declare-fun res!556798 () Bool)

(assert (=> b!815388 (=> (not res!556798) (not e!452126))))

(assert (=> b!815388 (= res!556798 (and (= (size!21876 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21875 _keys!976) (size!21876 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70178 res!556800) b!815388))

(assert (= (and b!815388 res!556798) b!815384))

(assert (= (and b!815384 res!556799) b!815387))

(assert (= (and b!815387 res!556801) b!815382))

(assert (= (and b!815383 condMapEmpty!23026) mapIsEmpty!23026))

(assert (= (and b!815383 (not condMapEmpty!23026)) mapNonEmpty!23026))

(get-info :version)

(assert (= (and mapNonEmpty!23026 ((_ is ValueCellFull!6732) mapValue!23026)) b!815386))

(assert (= (and b!815383 ((_ is ValueCellFull!6732) mapDefault!23026)) b!815385))

(assert (= start!70178 b!815383))

(declare-fun m!757055 () Bool)

(assert (=> mapNonEmpty!23026 m!757055))

(declare-fun m!757057 () Bool)

(assert (=> b!815382 m!757057))

(declare-fun m!757059 () Bool)

(assert (=> b!815382 m!757059))

(declare-fun m!757061 () Bool)

(assert (=> b!815382 m!757061))

(declare-fun m!757063 () Bool)

(assert (=> b!815384 m!757063))

(declare-fun m!757065 () Bool)

(assert (=> start!70178 m!757065))

(declare-fun m!757067 () Bool)

(assert (=> start!70178 m!757067))

(declare-fun m!757069 () Bool)

(assert (=> start!70178 m!757069))

(declare-fun m!757071 () Bool)

(assert (=> b!815387 m!757071))

(check-sat (not mapNonEmpty!23026) (not b!815384) (not b!815382) (not b!815387) (not b_next!12585) b_and!21365 (not start!70178) tp_is_empty!14295)
(check-sat b_and!21365 (not b_next!12585))
(get-model)

(declare-fun d!104469 () Bool)

(declare-fun res!556819 () Bool)

(declare-fun e!452151 () Bool)

(assert (=> d!104469 (=> res!556819 e!452151)))

(assert (=> d!104469 (= res!556819 (bvsge #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(assert (=> d!104469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!452151)))

(declare-fun b!815418 () Bool)

(declare-fun e!452150 () Bool)

(assert (=> b!815418 (= e!452151 e!452150)))

(declare-fun c!88949 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!815418 (= c!88949 (validKeyInArray!0 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815419 () Bool)

(declare-fun e!452152 () Bool)

(declare-fun call!35512 () Bool)

(assert (=> b!815419 (= e!452152 call!35512)))

(declare-fun b!815420 () Bool)

(assert (=> b!815420 (= e!452150 e!452152)))

(declare-fun lt!365042 () (_ BitVec 64))

(assert (=> b!815420 (= lt!365042 (select (arr!21454 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365044 () Unit!27788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44790 (_ BitVec 64) (_ BitVec 32)) Unit!27788)

(assert (=> b!815420 (= lt!365044 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!365042 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!815420 (arrayContainsKey!0 _keys!976 lt!365042 #b00000000000000000000000000000000)))

(declare-fun lt!365043 () Unit!27788)

(assert (=> b!815420 (= lt!365043 lt!365044)))

(declare-fun res!556818 () Bool)

(declare-datatypes ((SeekEntryResult!8721 0))(
  ( (MissingZero!8721 (index!37255 (_ BitVec 32))) (Found!8721 (index!37256 (_ BitVec 32))) (Intermediate!8721 (undefined!9533 Bool) (index!37257 (_ BitVec 32)) (x!68617 (_ BitVec 32))) (Undefined!8721) (MissingVacant!8721 (index!37258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44790 (_ BitVec 32)) SeekEntryResult!8721)

(assert (=> b!815420 (= res!556818 (= (seekEntryOrOpen!0 (select (arr!21454 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8721 #b00000000000000000000000000000000)))))

(assert (=> b!815420 (=> (not res!556818) (not e!452152))))

(declare-fun b!815421 () Bool)

(assert (=> b!815421 (= e!452150 call!35512)))

(declare-fun bm!35509 () Bool)

(assert (=> bm!35509 (= call!35512 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!104469 (not res!556819)) b!815418))

(assert (= (and b!815418 c!88949) b!815420))

(assert (= (and b!815418 (not c!88949)) b!815421))

(assert (= (and b!815420 res!556818) b!815419))

(assert (= (or b!815419 b!815421) bm!35509))

(declare-fun m!757091 () Bool)

(assert (=> b!815418 m!757091))

(assert (=> b!815418 m!757091))

(declare-fun m!757093 () Bool)

(assert (=> b!815418 m!757093))

(assert (=> b!815420 m!757091))

(declare-fun m!757095 () Bool)

(assert (=> b!815420 m!757095))

(declare-fun m!757097 () Bool)

(assert (=> b!815420 m!757097))

(assert (=> b!815420 m!757091))

(declare-fun m!757099 () Bool)

(assert (=> b!815420 m!757099))

(declare-fun m!757101 () Bool)

(assert (=> bm!35509 m!757101))

(assert (=> b!815384 d!104469))

(declare-fun d!104471 () Bool)

(declare-fun res!556826 () Bool)

(declare-fun e!452161 () Bool)

(assert (=> d!104471 (=> res!556826 e!452161)))

(assert (=> d!104471 (= res!556826 (bvsge #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(assert (=> d!104471 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15266) e!452161)))

(declare-fun b!815432 () Bool)

(declare-fun e!452164 () Bool)

(declare-fun call!35515 () Bool)

(assert (=> b!815432 (= e!452164 call!35515)))

(declare-fun b!815433 () Bool)

(declare-fun e!452162 () Bool)

(declare-fun contains!4147 (List!15269 (_ BitVec 64)) Bool)

(assert (=> b!815433 (= e!452162 (contains!4147 Nil!15266 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35512 () Bool)

(declare-fun c!88952 () Bool)

(assert (=> bm!35512 (= call!35515 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88952 (Cons!15265 (select (arr!21454 _keys!976) #b00000000000000000000000000000000) Nil!15266) Nil!15266)))))

(declare-fun b!815434 () Bool)

(declare-fun e!452163 () Bool)

(assert (=> b!815434 (= e!452163 e!452164)))

(assert (=> b!815434 (= c!88952 (validKeyInArray!0 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815435 () Bool)

(assert (=> b!815435 (= e!452164 call!35515)))

(declare-fun b!815436 () Bool)

(assert (=> b!815436 (= e!452161 e!452163)))

(declare-fun res!556827 () Bool)

(assert (=> b!815436 (=> (not res!556827) (not e!452163))))

(assert (=> b!815436 (= res!556827 (not e!452162))))

(declare-fun res!556828 () Bool)

(assert (=> b!815436 (=> (not res!556828) (not e!452162))))

(assert (=> b!815436 (= res!556828 (validKeyInArray!0 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104471 (not res!556826)) b!815436))

(assert (= (and b!815436 res!556828) b!815433))

(assert (= (and b!815436 res!556827) b!815434))

(assert (= (and b!815434 c!88952) b!815432))

(assert (= (and b!815434 (not c!88952)) b!815435))

(assert (= (or b!815432 b!815435) bm!35512))

(assert (=> b!815433 m!757091))

(assert (=> b!815433 m!757091))

(declare-fun m!757103 () Bool)

(assert (=> b!815433 m!757103))

(assert (=> bm!35512 m!757091))

(declare-fun m!757105 () Bool)

(assert (=> bm!35512 m!757105))

(assert (=> b!815434 m!757091))

(assert (=> b!815434 m!757091))

(assert (=> b!815434 m!757093))

(assert (=> b!815436 m!757091))

(assert (=> b!815436 m!757091))

(assert (=> b!815436 m!757093))

(assert (=> b!815387 d!104471))

(declare-fun d!104473 () Bool)

(assert (=> d!104473 (= (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365047 () Unit!27788)

(declare-fun choose!1388 (array!44790 array!44792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24061 V!24061 V!24061 V!24061 (_ BitVec 32) Int) Unit!27788)

(assert (=> d!104473 (= lt!365047 (choose!1388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104473 (validMask!0 mask!1312)))

(assert (=> d!104473 (= (lemmaNoChangeToArrayThenSameMapNoExtras!305 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365047)))

(declare-fun bs!22700 () Bool)

(assert (= bs!22700 d!104473))

(assert (=> bs!22700 m!757061))

(assert (=> bs!22700 m!757059))

(declare-fun m!757107 () Bool)

(assert (=> bs!22700 m!757107))

(assert (=> bs!22700 m!757065))

(assert (=> b!815382 d!104473))

(declare-fun b!815461 () Bool)

(declare-fun e!452185 () ListLongMap!8259)

(declare-fun call!35518 () ListLongMap!8259)

(assert (=> b!815461 (= e!452185 call!35518)))

(declare-fun b!815462 () Bool)

(assert (=> b!815462 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(assert (=> b!815462 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21876 _values!788)))))

(declare-fun e!452183 () Bool)

(declare-fun lt!365062 () ListLongMap!8259)

(declare-fun apply!349 (ListLongMap!8259 (_ BitVec 64)) V!24061)

(declare-fun get!11490 (ValueCell!6732 V!24061) V!24061)

(declare-fun dynLambda!960 (Int (_ BitVec 64)) V!24061)

(assert (=> b!815462 (= e!452183 (= (apply!349 lt!365062 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)) (get!11490 (select (arr!21455 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!815463 () Bool)

(declare-fun e!452182 () Bool)

(declare-fun e!452181 () Bool)

(assert (=> b!815463 (= e!452182 e!452181)))

(declare-fun c!88963 () Bool)

(assert (=> b!815463 (= c!88963 (bvslt #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(declare-fun b!815464 () Bool)

(assert (=> b!815464 (= e!452181 (= lt!365062 (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!35515 () Bool)

(assert (=> bm!35515 (= call!35518 (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!815465 () Bool)

(declare-fun lt!365065 () Unit!27788)

(declare-fun lt!365067 () Unit!27788)

(assert (=> b!815465 (= lt!365065 lt!365067)))

(declare-fun lt!365063 () (_ BitVec 64))

(declare-fun lt!365064 () V!24061)

(declare-fun lt!365066 () (_ BitVec 64))

(declare-fun lt!365068 () ListLongMap!8259)

(declare-fun contains!4148 (ListLongMap!8259 (_ BitVec 64)) Bool)

(declare-fun +!1781 (ListLongMap!8259 tuple2!9436) ListLongMap!8259)

(assert (=> b!815465 (not (contains!4148 (+!1781 lt!365068 (tuple2!9437 lt!365063 lt!365064)) lt!365066))))

(declare-fun addStillNotContains!174 (ListLongMap!8259 (_ BitVec 64) V!24061 (_ BitVec 64)) Unit!27788)

(assert (=> b!815465 (= lt!365067 (addStillNotContains!174 lt!365068 lt!365063 lt!365064 lt!365066))))

(assert (=> b!815465 (= lt!365066 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!815465 (= lt!365064 (get!11490 (select (arr!21455 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!815465 (= lt!365063 (select (arr!21454 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!815465 (= lt!365068 call!35518)))

(assert (=> b!815465 (= e!452185 (+!1781 call!35518 (tuple2!9437 (select (arr!21454 _keys!976) #b00000000000000000000000000000000) (get!11490 (select (arr!21455 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!815466 () Bool)

(declare-fun e!452179 () ListLongMap!8259)

(assert (=> b!815466 (= e!452179 (ListLongMap!8260 Nil!15265))))

(declare-fun b!815467 () Bool)

(assert (=> b!815467 (= e!452182 e!452183)))

(assert (=> b!815467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(declare-fun res!556838 () Bool)

(assert (=> b!815467 (= res!556838 (contains!4148 lt!365062 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815467 (=> (not res!556838) (not e!452183))))

(declare-fun b!815468 () Bool)

(declare-fun res!556839 () Bool)

(declare-fun e!452184 () Bool)

(assert (=> b!815468 (=> (not res!556839) (not e!452184))))

(assert (=> b!815468 (= res!556839 (not (contains!4148 lt!365062 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!815469 () Bool)

(declare-fun isEmpty!631 (ListLongMap!8259) Bool)

(assert (=> b!815469 (= e!452181 (isEmpty!631 lt!365062))))

(declare-fun b!815470 () Bool)

(assert (=> b!815470 (= e!452179 e!452185)))

(declare-fun c!88964 () Bool)

(assert (=> b!815470 (= c!88964 (validKeyInArray!0 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104475 () Bool)

(assert (=> d!104475 e!452184))

(declare-fun res!556837 () Bool)

(assert (=> d!104475 (=> (not res!556837) (not e!452184))))

(assert (=> d!104475 (= res!556837 (not (contains!4148 lt!365062 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104475 (= lt!365062 e!452179)))

(declare-fun c!88961 () Bool)

(assert (=> d!104475 (= c!88961 (bvsge #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(assert (=> d!104475 (validMask!0 mask!1312)))

(assert (=> d!104475 (= (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365062)))

(declare-fun b!815471 () Bool)

(assert (=> b!815471 (= e!452184 e!452182)))

(declare-fun c!88962 () Bool)

(declare-fun e!452180 () Bool)

(assert (=> b!815471 (= c!88962 e!452180)))

(declare-fun res!556840 () Bool)

(assert (=> b!815471 (=> (not res!556840) (not e!452180))))

(assert (=> b!815471 (= res!556840 (bvslt #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(declare-fun b!815472 () Bool)

(assert (=> b!815472 (= e!452180 (validKeyInArray!0 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815472 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!104475 c!88961) b!815466))

(assert (= (and d!104475 (not c!88961)) b!815470))

(assert (= (and b!815470 c!88964) b!815465))

(assert (= (and b!815470 (not c!88964)) b!815461))

(assert (= (or b!815465 b!815461) bm!35515))

(assert (= (and d!104475 res!556837) b!815468))

(assert (= (and b!815468 res!556839) b!815471))

(assert (= (and b!815471 res!556840) b!815472))

(assert (= (and b!815471 c!88962) b!815467))

(assert (= (and b!815471 (not c!88962)) b!815463))

(assert (= (and b!815467 res!556838) b!815462))

(assert (= (and b!815463 c!88963) b!815464))

(assert (= (and b!815463 (not c!88963)) b!815469))

(declare-fun b_lambda!10847 () Bool)

(assert (=> (not b_lambda!10847) (not b!815462)))

(declare-fun t!21591 () Bool)

(declare-fun tb!4179 () Bool)

(assert (=> (and start!70178 (= defaultEntry!796 defaultEntry!796) t!21591) tb!4179))

(declare-fun result!7877 () Bool)

(assert (=> tb!4179 (= result!7877 tp_is_empty!14295)))

(assert (=> b!815462 t!21591))

(declare-fun b_and!21369 () Bool)

(assert (= b_and!21365 (and (=> t!21591 result!7877) b_and!21369)))

(declare-fun b_lambda!10849 () Bool)

(assert (=> (not b_lambda!10849) (not b!815465)))

(assert (=> b!815465 t!21591))

(declare-fun b_and!21371 () Bool)

(assert (= b_and!21369 (and (=> t!21591 result!7877) b_and!21371)))

(declare-fun m!757109 () Bool)

(assert (=> b!815469 m!757109))

(declare-fun m!757111 () Bool)

(assert (=> b!815468 m!757111))

(declare-fun m!757113 () Bool)

(assert (=> b!815464 m!757113))

(declare-fun m!757115 () Bool)

(assert (=> b!815465 m!757115))

(declare-fun m!757117 () Bool)

(assert (=> b!815465 m!757117))

(assert (=> b!815465 m!757115))

(declare-fun m!757119 () Bool)

(assert (=> b!815465 m!757119))

(declare-fun m!757121 () Bool)

(assert (=> b!815465 m!757121))

(declare-fun m!757123 () Bool)

(assert (=> b!815465 m!757123))

(declare-fun m!757125 () Bool)

(assert (=> b!815465 m!757125))

(assert (=> b!815465 m!757123))

(assert (=> b!815465 m!757091))

(assert (=> b!815465 m!757121))

(declare-fun m!757127 () Bool)

(assert (=> b!815465 m!757127))

(assert (=> b!815462 m!757121))

(assert (=> b!815462 m!757123))

(assert (=> b!815462 m!757125))

(assert (=> b!815462 m!757123))

(assert (=> b!815462 m!757091))

(assert (=> b!815462 m!757121))

(assert (=> b!815462 m!757091))

(declare-fun m!757129 () Bool)

(assert (=> b!815462 m!757129))

(declare-fun m!757131 () Bool)

(assert (=> d!104475 m!757131))

(assert (=> d!104475 m!757065))

(assert (=> b!815470 m!757091))

(assert (=> b!815470 m!757091))

(assert (=> b!815470 m!757093))

(assert (=> b!815472 m!757091))

(assert (=> b!815472 m!757091))

(assert (=> b!815472 m!757093))

(assert (=> bm!35515 m!757113))

(assert (=> b!815467 m!757091))

(assert (=> b!815467 m!757091))

(declare-fun m!757133 () Bool)

(assert (=> b!815467 m!757133))

(assert (=> b!815382 d!104475))

(declare-fun b!815475 () Bool)

(declare-fun e!452192 () ListLongMap!8259)

(declare-fun call!35519 () ListLongMap!8259)

(assert (=> b!815475 (= e!452192 call!35519)))

(declare-fun b!815476 () Bool)

(assert (=> b!815476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(assert (=> b!815476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21876 _values!788)))))

(declare-fun e!452190 () Bool)

(declare-fun lt!365069 () ListLongMap!8259)

(assert (=> b!815476 (= e!452190 (= (apply!349 lt!365069 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)) (get!11490 (select (arr!21455 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!815477 () Bool)

(declare-fun e!452189 () Bool)

(declare-fun e!452188 () Bool)

(assert (=> b!815477 (= e!452189 e!452188)))

(declare-fun c!88967 () Bool)

(assert (=> b!815477 (= c!88967 (bvslt #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(declare-fun b!815478 () Bool)

(assert (=> b!815478 (= e!452188 (= lt!365069 (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!35516 () Bool)

(assert (=> bm!35516 (= call!35519 (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!815479 () Bool)

(declare-fun lt!365072 () Unit!27788)

(declare-fun lt!365074 () Unit!27788)

(assert (=> b!815479 (= lt!365072 lt!365074)))

(declare-fun lt!365070 () (_ BitVec 64))

(declare-fun lt!365071 () V!24061)

(declare-fun lt!365073 () (_ BitVec 64))

(declare-fun lt!365075 () ListLongMap!8259)

(assert (=> b!815479 (not (contains!4148 (+!1781 lt!365075 (tuple2!9437 lt!365070 lt!365071)) lt!365073))))

(assert (=> b!815479 (= lt!365074 (addStillNotContains!174 lt!365075 lt!365070 lt!365071 lt!365073))))

(assert (=> b!815479 (= lt!365073 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!815479 (= lt!365071 (get!11490 (select (arr!21455 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!815479 (= lt!365070 (select (arr!21454 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!815479 (= lt!365075 call!35519)))

(assert (=> b!815479 (= e!452192 (+!1781 call!35519 (tuple2!9437 (select (arr!21454 _keys!976) #b00000000000000000000000000000000) (get!11490 (select (arr!21455 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!815480 () Bool)

(declare-fun e!452186 () ListLongMap!8259)

(assert (=> b!815480 (= e!452186 (ListLongMap!8260 Nil!15265))))

(declare-fun b!815481 () Bool)

(assert (=> b!815481 (= e!452189 e!452190)))

(assert (=> b!815481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(declare-fun res!556842 () Bool)

(assert (=> b!815481 (= res!556842 (contains!4148 lt!365069 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815481 (=> (not res!556842) (not e!452190))))

(declare-fun b!815482 () Bool)

(declare-fun res!556843 () Bool)

(declare-fun e!452191 () Bool)

(assert (=> b!815482 (=> (not res!556843) (not e!452191))))

(assert (=> b!815482 (= res!556843 (not (contains!4148 lt!365069 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!815483 () Bool)

(assert (=> b!815483 (= e!452188 (isEmpty!631 lt!365069))))

(declare-fun b!815484 () Bool)

(assert (=> b!815484 (= e!452186 e!452192)))

(declare-fun c!88968 () Bool)

(assert (=> b!815484 (= c!88968 (validKeyInArray!0 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104477 () Bool)

(assert (=> d!104477 e!452191))

(declare-fun res!556841 () Bool)

(assert (=> d!104477 (=> (not res!556841) (not e!452191))))

(assert (=> d!104477 (= res!556841 (not (contains!4148 lt!365069 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104477 (= lt!365069 e!452186)))

(declare-fun c!88965 () Bool)

(assert (=> d!104477 (= c!88965 (bvsge #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(assert (=> d!104477 (validMask!0 mask!1312)))

(assert (=> d!104477 (= (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365069)))

(declare-fun b!815485 () Bool)

(assert (=> b!815485 (= e!452191 e!452189)))

(declare-fun c!88966 () Bool)

(declare-fun e!452187 () Bool)

(assert (=> b!815485 (= c!88966 e!452187)))

(declare-fun res!556844 () Bool)

(assert (=> b!815485 (=> (not res!556844) (not e!452187))))

(assert (=> b!815485 (= res!556844 (bvslt #b00000000000000000000000000000000 (size!21875 _keys!976)))))

(declare-fun b!815486 () Bool)

(assert (=> b!815486 (= e!452187 (validKeyInArray!0 (select (arr!21454 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815486 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!104477 c!88965) b!815480))

(assert (= (and d!104477 (not c!88965)) b!815484))

(assert (= (and b!815484 c!88968) b!815479))

(assert (= (and b!815484 (not c!88968)) b!815475))

(assert (= (or b!815479 b!815475) bm!35516))

(assert (= (and d!104477 res!556841) b!815482))

(assert (= (and b!815482 res!556843) b!815485))

(assert (= (and b!815485 res!556844) b!815486))

(assert (= (and b!815485 c!88966) b!815481))

(assert (= (and b!815485 (not c!88966)) b!815477))

(assert (= (and b!815481 res!556842) b!815476))

(assert (= (and b!815477 c!88967) b!815478))

(assert (= (and b!815477 (not c!88967)) b!815483))

(declare-fun b_lambda!10851 () Bool)

(assert (=> (not b_lambda!10851) (not b!815476)))

(assert (=> b!815476 t!21591))

(declare-fun b_and!21373 () Bool)

(assert (= b_and!21371 (and (=> t!21591 result!7877) b_and!21373)))

(declare-fun b_lambda!10853 () Bool)

(assert (=> (not b_lambda!10853) (not b!815479)))

(assert (=> b!815479 t!21591))

(declare-fun b_and!21375 () Bool)

(assert (= b_and!21373 (and (=> t!21591 result!7877) b_and!21375)))

(declare-fun m!757135 () Bool)

(assert (=> b!815483 m!757135))

(declare-fun m!757137 () Bool)

(assert (=> b!815482 m!757137))

(declare-fun m!757139 () Bool)

(assert (=> b!815478 m!757139))

(declare-fun m!757141 () Bool)

(assert (=> b!815479 m!757141))

(declare-fun m!757143 () Bool)

(assert (=> b!815479 m!757143))

(assert (=> b!815479 m!757141))

(declare-fun m!757145 () Bool)

(assert (=> b!815479 m!757145))

(assert (=> b!815479 m!757121))

(assert (=> b!815479 m!757123))

(assert (=> b!815479 m!757125))

(assert (=> b!815479 m!757123))

(assert (=> b!815479 m!757091))

(assert (=> b!815479 m!757121))

(declare-fun m!757147 () Bool)

(assert (=> b!815479 m!757147))

(assert (=> b!815476 m!757121))

(assert (=> b!815476 m!757123))

(assert (=> b!815476 m!757125))

(assert (=> b!815476 m!757123))

(assert (=> b!815476 m!757091))

(assert (=> b!815476 m!757121))

(assert (=> b!815476 m!757091))

(declare-fun m!757149 () Bool)

(assert (=> b!815476 m!757149))

(declare-fun m!757151 () Bool)

(assert (=> d!104477 m!757151))

(assert (=> d!104477 m!757065))

(assert (=> b!815484 m!757091))

(assert (=> b!815484 m!757091))

(assert (=> b!815484 m!757093))

(assert (=> b!815486 m!757091))

(assert (=> b!815486 m!757091))

(assert (=> b!815486 m!757093))

(assert (=> bm!35516 m!757139))

(assert (=> b!815481 m!757091))

(assert (=> b!815481 m!757091))

(declare-fun m!757153 () Bool)

(assert (=> b!815481 m!757153))

(assert (=> b!815382 d!104477))

(declare-fun d!104479 () Bool)

(assert (=> d!104479 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70178 d!104479))

(declare-fun d!104481 () Bool)

(assert (=> d!104481 (= (array_inv!17167 _keys!976) (bvsge (size!21875 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70178 d!104481))

(declare-fun d!104483 () Bool)

(assert (=> d!104483 (= (array_inv!17168 _values!788) (bvsge (size!21876 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70178 d!104483))

(declare-fun b!815494 () Bool)

(declare-fun e!452198 () Bool)

(assert (=> b!815494 (= e!452198 tp_is_empty!14295)))

(declare-fun mapIsEmpty!23032 () Bool)

(declare-fun mapRes!23032 () Bool)

(assert (=> mapIsEmpty!23032 mapRes!23032))

(declare-fun condMapEmpty!23032 () Bool)

(declare-fun mapDefault!23032 () ValueCell!6732)

(assert (=> mapNonEmpty!23026 (= condMapEmpty!23032 (= mapRest!23026 ((as const (Array (_ BitVec 32) ValueCell!6732)) mapDefault!23032)))))

(assert (=> mapNonEmpty!23026 (= tp!44473 (and e!452198 mapRes!23032))))

(declare-fun mapNonEmpty!23032 () Bool)

(declare-fun tp!44482 () Bool)

(declare-fun e!452197 () Bool)

(assert (=> mapNonEmpty!23032 (= mapRes!23032 (and tp!44482 e!452197))))

(declare-fun mapValue!23032 () ValueCell!6732)

(declare-fun mapRest!23032 () (Array (_ BitVec 32) ValueCell!6732))

(declare-fun mapKey!23032 () (_ BitVec 32))

(assert (=> mapNonEmpty!23032 (= mapRest!23026 (store mapRest!23032 mapKey!23032 mapValue!23032))))

(declare-fun b!815493 () Bool)

(assert (=> b!815493 (= e!452197 tp_is_empty!14295)))

(assert (= (and mapNonEmpty!23026 condMapEmpty!23032) mapIsEmpty!23032))

(assert (= (and mapNonEmpty!23026 (not condMapEmpty!23032)) mapNonEmpty!23032))

(assert (= (and mapNonEmpty!23032 ((_ is ValueCellFull!6732) mapValue!23032)) b!815493))

(assert (= (and mapNonEmpty!23026 ((_ is ValueCellFull!6732) mapDefault!23032)) b!815494))

(declare-fun m!757155 () Bool)

(assert (=> mapNonEmpty!23032 m!757155))

(declare-fun b_lambda!10855 () Bool)

(assert (= b_lambda!10847 (or (and start!70178 b_free!12585) b_lambda!10855)))

(declare-fun b_lambda!10857 () Bool)

(assert (= b_lambda!10851 (or (and start!70178 b_free!12585) b_lambda!10857)))

(declare-fun b_lambda!10859 () Bool)

(assert (= b_lambda!10849 (or (and start!70178 b_free!12585) b_lambda!10859)))

(declare-fun b_lambda!10861 () Bool)

(assert (= b_lambda!10853 (or (and start!70178 b_free!12585) b_lambda!10861)))

(check-sat tp_is_empty!14295 (not b_lambda!10861) (not bm!35516) (not b!815481) (not d!104473) (not b!815478) (not b!815482) (not b!815469) (not b!815468) (not d!104477) (not b!815462) (not b!815436) b_and!21375 (not mapNonEmpty!23032) (not bm!35509) (not b!815479) (not b!815476) (not b!815434) (not b!815420) (not b!815464) (not b!815433) (not bm!35515) (not b!815483) (not b!815472) (not b_lambda!10859) (not b!815465) (not b_lambda!10855) (not b!815467) (not b!815486) (not bm!35512) (not b_next!12585) (not b!815484) (not d!104475) (not b_lambda!10857) (not b!815418) (not b!815470))
(check-sat b_and!21375 (not b_next!12585))
