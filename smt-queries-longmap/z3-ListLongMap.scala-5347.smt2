; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71628 () Bool)

(assert start!71628)

(declare-fun b_free!13489 () Bool)

(declare-fun b_next!13489 () Bool)

(assert (=> start!71628 (= b_free!13489 (not b_next!13489))))

(declare-fun tp!47251 () Bool)

(declare-fun b_and!22517 () Bool)

(assert (=> start!71628 (= tp!47251 b_and!22517)))

(declare-fun res!565633 () Bool)

(declare-fun e!463234 () Bool)

(assert (=> start!71628 (=> (not res!565633) (not e!463234))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71628 (= res!565633 (validMask!0 mask!1312))))

(assert (=> start!71628 e!463234))

(declare-fun tp_is_empty!15199 () Bool)

(assert (=> start!71628 tp_is_empty!15199))

(declare-datatypes ((array!46575 0))(
  ( (array!46576 (arr!22320 (Array (_ BitVec 32) (_ BitVec 64))) (size!22740 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46575)

(declare-fun array_inv!17819 (array!46575) Bool)

(assert (=> start!71628 (array_inv!17819 _keys!976)))

(assert (=> start!71628 true))

(declare-datatypes ((V!25267 0))(
  ( (V!25268 (val!7647 Int)) )
))
(declare-datatypes ((ValueCell!7184 0))(
  ( (ValueCellFull!7184 (v!10088 V!25267)) (EmptyCell!7184) )
))
(declare-datatypes ((array!46577 0))(
  ( (array!46578 (arr!22321 (Array (_ BitVec 32) ValueCell!7184)) (size!22741 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46577)

(declare-fun e!463232 () Bool)

(declare-fun array_inv!17820 (array!46577) Bool)

(assert (=> start!71628 (and (array_inv!17820 _values!788) e!463232)))

(assert (=> start!71628 tp!47251))

(declare-fun zeroValueBefore!34 () V!25267)

(declare-fun e!463233 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!25267)

(declare-datatypes ((tuple2!10072 0))(
  ( (tuple2!10073 (_1!5047 (_ BitVec 64)) (_2!5047 V!25267)) )
))
(declare-datatypes ((List!15843 0))(
  ( (Nil!15840) (Cons!15839 (h!16974 tuple2!10072) (t!22198 List!15843)) )
))
(declare-datatypes ((ListLongMap!8897 0))(
  ( (ListLongMap!8898 (toList!4464 List!15843)) )
))
(declare-fun lt!376823 () ListLongMap!8897)

(declare-fun b!830797 () Bool)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2557 (array!46575 array!46577 (_ BitVec 32) (_ BitVec 32) V!25267 V!25267 (_ BitVec 32) Int) ListLongMap!8897)

(declare-fun +!1986 (ListLongMap!8897 tuple2!10072) ListLongMap!8897)

(assert (=> b!830797 (= e!463233 (= (getCurrentListMap!2557 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1986 (+!1986 lt!376823 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun mapNonEmpty!24448 () Bool)

(declare-fun mapRes!24448 () Bool)

(declare-fun tp!47250 () Bool)

(declare-fun e!463230 () Bool)

(assert (=> mapNonEmpty!24448 (= mapRes!24448 (and tp!47250 e!463230))))

(declare-fun mapKey!24448 () (_ BitVec 32))

(declare-fun mapRest!24448 () (Array (_ BitVec 32) ValueCell!7184))

(declare-fun mapValue!24448 () ValueCell!7184)

(assert (=> mapNonEmpty!24448 (= (arr!22321 _values!788) (store mapRest!24448 mapKey!24448 mapValue!24448))))

(declare-fun b!830798 () Bool)

(declare-fun res!565631 () Bool)

(assert (=> b!830798 (=> (not res!565631) (not e!463234))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!830798 (= res!565631 (and (= (size!22741 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22740 _keys!976) (size!22741 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!830799 () Bool)

(declare-fun e!463229 () Bool)

(assert (=> b!830799 (= e!463229 tp_is_empty!15199)))

(declare-fun b!830800 () Bool)

(assert (=> b!830800 (= e!463232 (and e!463229 mapRes!24448))))

(declare-fun condMapEmpty!24448 () Bool)

(declare-fun mapDefault!24448 () ValueCell!7184)

(assert (=> b!830800 (= condMapEmpty!24448 (= (arr!22321 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7184)) mapDefault!24448)))))

(declare-fun b!830801 () Bool)

(declare-fun res!565635 () Bool)

(assert (=> b!830801 (=> (not res!565635) (not e!463234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46575 (_ BitVec 32)) Bool)

(assert (=> b!830801 (= res!565635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!830802 () Bool)

(assert (=> b!830802 (= e!463230 tp_is_empty!15199)))

(declare-fun mapIsEmpty!24448 () Bool)

(assert (=> mapIsEmpty!24448 mapRes!24448))

(declare-fun b!830803 () Bool)

(declare-fun zeroValueAfter!34 () V!25267)

(declare-fun lt!376824 () ListLongMap!8897)

(declare-fun e!463231 () Bool)

(assert (=> b!830803 (= e!463231 (= (getCurrentListMap!2557 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1986 (+!1986 lt!376824 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830804 () Bool)

(declare-fun e!463236 () Bool)

(assert (=> b!830804 (= e!463236 e!463233)))

(declare-fun res!565632 () Bool)

(assert (=> b!830804 (=> res!565632 e!463233)))

(assert (=> b!830804 (= res!565632 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830805 () Bool)

(assert (=> b!830805 (= e!463234 (not e!463231))))

(declare-fun res!565629 () Bool)

(assert (=> b!830805 (=> res!565629 e!463231)))

(assert (=> b!830805 (= res!565629 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!830805 e!463236))

(declare-fun res!565630 () Bool)

(assert (=> b!830805 (=> (not res!565630) (not e!463236))))

(assert (=> b!830805 (= res!565630 (= lt!376823 lt!376824))))

(declare-datatypes ((Unit!28442 0))(
  ( (Unit!28443) )
))
(declare-fun lt!376825 () Unit!28442)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!602 (array!46575 array!46577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25267 V!25267 V!25267 V!25267 (_ BitVec 32) Int) Unit!28442)

(assert (=> b!830805 (= lt!376825 (lemmaNoChangeToArrayThenSameMapNoExtras!602 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2535 (array!46575 array!46577 (_ BitVec 32) (_ BitVec 32) V!25267 V!25267 (_ BitVec 32) Int) ListLongMap!8897)

(assert (=> b!830805 (= lt!376824 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!830805 (= lt!376823 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830806 () Bool)

(declare-fun res!565634 () Bool)

(assert (=> b!830806 (=> (not res!565634) (not e!463234))))

(declare-datatypes ((List!15844 0))(
  ( (Nil!15841) (Cons!15840 (h!16975 (_ BitVec 64)) (t!22199 List!15844)) )
))
(declare-fun arrayNoDuplicates!0 (array!46575 (_ BitVec 32) List!15844) Bool)

(assert (=> b!830806 (= res!565634 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15841))))

(assert (= (and start!71628 res!565633) b!830798))

(assert (= (and b!830798 res!565631) b!830801))

(assert (= (and b!830801 res!565635) b!830806))

(assert (= (and b!830806 res!565634) b!830805))

(assert (= (and b!830805 res!565630) b!830804))

(assert (= (and b!830804 (not res!565632)) b!830797))

(assert (= (and b!830805 (not res!565629)) b!830803))

(assert (= (and b!830800 condMapEmpty!24448) mapIsEmpty!24448))

(assert (= (and b!830800 (not condMapEmpty!24448)) mapNonEmpty!24448))

(get-info :version)

(assert (= (and mapNonEmpty!24448 ((_ is ValueCellFull!7184) mapValue!24448)) b!830802))

(assert (= (and b!830800 ((_ is ValueCellFull!7184) mapDefault!24448)) b!830799))

(assert (= start!71628 b!830800))

(declare-fun m!774213 () Bool)

(assert (=> b!830801 m!774213))

(declare-fun m!774215 () Bool)

(assert (=> start!71628 m!774215))

(declare-fun m!774217 () Bool)

(assert (=> start!71628 m!774217))

(declare-fun m!774219 () Bool)

(assert (=> start!71628 m!774219))

(declare-fun m!774221 () Bool)

(assert (=> b!830797 m!774221))

(declare-fun m!774223 () Bool)

(assert (=> b!830797 m!774223))

(assert (=> b!830797 m!774223))

(declare-fun m!774225 () Bool)

(assert (=> b!830797 m!774225))

(declare-fun m!774227 () Bool)

(assert (=> b!830803 m!774227))

(declare-fun m!774229 () Bool)

(assert (=> b!830803 m!774229))

(assert (=> b!830803 m!774229))

(declare-fun m!774231 () Bool)

(assert (=> b!830803 m!774231))

(declare-fun m!774233 () Bool)

(assert (=> b!830806 m!774233))

(declare-fun m!774235 () Bool)

(assert (=> b!830805 m!774235))

(declare-fun m!774237 () Bool)

(assert (=> b!830805 m!774237))

(declare-fun m!774239 () Bool)

(assert (=> b!830805 m!774239))

(declare-fun m!774241 () Bool)

(assert (=> mapNonEmpty!24448 m!774241))

(check-sat tp_is_empty!15199 (not b!830801) (not b!830805) (not b_next!13489) (not mapNonEmpty!24448) (not b!830797) (not b!830806) (not b!830803) (not start!71628) b_and!22517)
(check-sat b_and!22517 (not b_next!13489))
(get-model)

(declare-fun b!830877 () Bool)

(declare-fun e!463294 () Bool)

(declare-fun call!36232 () Bool)

(assert (=> b!830877 (= e!463294 call!36232)))

(declare-fun b!830878 () Bool)

(assert (=> b!830878 (= e!463294 call!36232)))

(declare-fun b!830879 () Bool)

(declare-fun e!463296 () Bool)

(declare-fun contains!4183 (List!15844 (_ BitVec 64)) Bool)

(assert (=> b!830879 (= e!463296 (contains!4183 Nil!15841 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36229 () Bool)

(declare-fun c!90100 () Bool)

(assert (=> bm!36229 (= call!36232 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!90100 (Cons!15840 (select (arr!22320 _keys!976) #b00000000000000000000000000000000) Nil!15841) Nil!15841)))))

(declare-fun b!830880 () Bool)

(declare-fun e!463295 () Bool)

(assert (=> b!830880 (= e!463295 e!463294)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!830880 (= c!90100 (validKeyInArray!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830881 () Bool)

(declare-fun e!463293 () Bool)

(assert (=> b!830881 (= e!463293 e!463295)))

(declare-fun res!565686 () Bool)

(assert (=> b!830881 (=> (not res!565686) (not e!463295))))

(assert (=> b!830881 (= res!565686 (not e!463296))))

(declare-fun res!565684 () Bool)

(assert (=> b!830881 (=> (not res!565684) (not e!463296))))

(assert (=> b!830881 (= res!565684 (validKeyInArray!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105627 () Bool)

(declare-fun res!565685 () Bool)

(assert (=> d!105627 (=> res!565685 e!463293)))

(assert (=> d!105627 (= res!565685 (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> d!105627 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15841) e!463293)))

(assert (= (and d!105627 (not res!565685)) b!830881))

(assert (= (and b!830881 res!565684) b!830879))

(assert (= (and b!830881 res!565686) b!830880))

(assert (= (and b!830880 c!90100) b!830877))

(assert (= (and b!830880 (not c!90100)) b!830878))

(assert (= (or b!830877 b!830878) bm!36229))

(declare-fun m!774303 () Bool)

(assert (=> b!830879 m!774303))

(assert (=> b!830879 m!774303))

(declare-fun m!774305 () Bool)

(assert (=> b!830879 m!774305))

(assert (=> bm!36229 m!774303))

(declare-fun m!774307 () Bool)

(assert (=> bm!36229 m!774307))

(assert (=> b!830880 m!774303))

(assert (=> b!830880 m!774303))

(declare-fun m!774309 () Bool)

(assert (=> b!830880 m!774309))

(assert (=> b!830881 m!774303))

(assert (=> b!830881 m!774303))

(assert (=> b!830881 m!774309))

(assert (=> b!830806 d!105627))

(declare-fun d!105629 () Bool)

(assert (=> d!105629 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71628 d!105629))

(declare-fun d!105631 () Bool)

(assert (=> d!105631 (= (array_inv!17819 _keys!976) (bvsge (size!22740 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71628 d!105631))

(declare-fun d!105633 () Bool)

(assert (=> d!105633 (= (array_inv!17820 _values!788) (bvsge (size!22741 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71628 d!105633))

(declare-fun b!830924 () Bool)

(declare-fun res!565709 () Bool)

(declare-fun e!463327 () Bool)

(assert (=> b!830924 (=> (not res!565709) (not e!463327))))

(declare-fun e!463325 () Bool)

(assert (=> b!830924 (= res!565709 e!463325)))

(declare-fun c!90118 () Bool)

(assert (=> b!830924 (= c!90118 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830925 () Bool)

(declare-fun e!463331 () Bool)

(declare-fun lt!376890 () ListLongMap!8897)

(declare-fun apply!371 (ListLongMap!8897 (_ BitVec 64)) V!25267)

(assert (=> b!830925 (= e!463331 (= (apply!371 lt!376890 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun bm!36244 () Bool)

(declare-fun call!36249 () ListLongMap!8897)

(declare-fun call!36248 () ListLongMap!8897)

(assert (=> bm!36244 (= call!36249 call!36248)))

(declare-fun b!830927 () Bool)

(declare-fun e!463333 () Bool)

(assert (=> b!830927 (= e!463333 (validKeyInArray!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830928 () Bool)

(declare-fun res!565705 () Bool)

(assert (=> b!830928 (=> (not res!565705) (not e!463327))))

(declare-fun e!463330 () Bool)

(assert (=> b!830928 (= res!565705 e!463330)))

(declare-fun res!565713 () Bool)

(assert (=> b!830928 (=> res!565713 e!463330)))

(assert (=> b!830928 (= res!565713 (not e!463333))))

(declare-fun res!565711 () Bool)

(assert (=> b!830928 (=> (not res!565711) (not e!463333))))

(assert (=> b!830928 (= res!565711 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!830929 () Bool)

(declare-fun e!463335 () Bool)

(declare-fun e!463334 () Bool)

(assert (=> b!830929 (= e!463335 e!463334)))

(declare-fun res!565706 () Bool)

(declare-fun call!36247 () Bool)

(assert (=> b!830929 (= res!565706 call!36247)))

(assert (=> b!830929 (=> (not res!565706) (not e!463334))))

(declare-fun b!830930 () Bool)

(declare-fun e!463332 () ListLongMap!8897)

(declare-fun call!36250 () ListLongMap!8897)

(assert (=> b!830930 (= e!463332 call!36250)))

(declare-fun b!830931 () Bool)

(declare-fun e!463328 () ListLongMap!8897)

(declare-fun e!463323 () ListLongMap!8897)

(assert (=> b!830931 (= e!463328 e!463323)))

(declare-fun c!90116 () Bool)

(assert (=> b!830931 (= c!90116 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830932 () Bool)

(declare-fun call!36253 () ListLongMap!8897)

(assert (=> b!830932 (= e!463328 (+!1986 call!36253 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!830933 () Bool)

(declare-fun e!463329 () Unit!28442)

(declare-fun Unit!28444 () Unit!28442)

(assert (=> b!830933 (= e!463329 Unit!28444)))

(declare-fun b!830934 () Bool)

(assert (=> b!830934 (= e!463327 e!463335)))

(declare-fun c!90117 () Bool)

(assert (=> b!830934 (= c!90117 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36245 () Bool)

(assert (=> bm!36245 (= call!36248 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830926 () Bool)

(declare-fun e!463324 () Bool)

(assert (=> b!830926 (= e!463330 e!463324)))

(declare-fun res!565710 () Bool)

(assert (=> b!830926 (=> (not res!565710) (not e!463324))))

(declare-fun contains!4184 (ListLongMap!8897 (_ BitVec 64)) Bool)

(assert (=> b!830926 (= res!565710 (contains!4184 lt!376890 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830926 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun d!105635 () Bool)

(assert (=> d!105635 e!463327))

(declare-fun res!565708 () Bool)

(assert (=> d!105635 (=> (not res!565708) (not e!463327))))

(assert (=> d!105635 (= res!565708 (or (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))))

(declare-fun lt!376895 () ListLongMap!8897)

(assert (=> d!105635 (= lt!376890 lt!376895)))

(declare-fun lt!376904 () Unit!28442)

(assert (=> d!105635 (= lt!376904 e!463329)))

(declare-fun c!90115 () Bool)

(declare-fun e!463326 () Bool)

(assert (=> d!105635 (= c!90115 e!463326)))

(declare-fun res!565707 () Bool)

(assert (=> d!105635 (=> (not res!565707) (not e!463326))))

(assert (=> d!105635 (= res!565707 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> d!105635 (= lt!376895 e!463328)))

(declare-fun c!90113 () Bool)

(assert (=> d!105635 (= c!90113 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105635 (validMask!0 mask!1312)))

(assert (=> d!105635 (= (getCurrentListMap!2557 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376890)))

(declare-fun b!830935 () Bool)

(declare-fun call!36252 () ListLongMap!8897)

(assert (=> b!830935 (= e!463332 call!36252)))

(declare-fun bm!36246 () Bool)

(declare-fun call!36251 () Bool)

(assert (=> bm!36246 (= call!36251 (contains!4184 lt!376890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830936 () Bool)

(assert (=> b!830936 (= e!463326 (validKeyInArray!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830937 () Bool)

(assert (=> b!830937 (= e!463334 (= (apply!371 lt!376890 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830938 () Bool)

(declare-fun get!11817 (ValueCell!7184 V!25267) V!25267)

(declare-fun dynLambda!979 (Int (_ BitVec 64)) V!25267)

(assert (=> b!830938 (= e!463324 (= (apply!371 lt!376890 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22321 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830938 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22741 _values!788)))))

(assert (=> b!830938 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!830939 () Bool)

(assert (=> b!830939 (= e!463335 (not call!36247))))

(declare-fun b!830940 () Bool)

(declare-fun c!90114 () Bool)

(assert (=> b!830940 (= c!90114 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!830940 (= e!463323 e!463332)))

(declare-fun bm!36247 () Bool)

(assert (=> bm!36247 (= call!36250 call!36253)))

(declare-fun b!830941 () Bool)

(assert (=> b!830941 (= e!463323 call!36250)))

(declare-fun b!830942 () Bool)

(declare-fun lt!376905 () Unit!28442)

(assert (=> b!830942 (= e!463329 lt!376905)))

(declare-fun lt!376897 () ListLongMap!8897)

(assert (=> b!830942 (= lt!376897 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376901 () (_ BitVec 64))

(assert (=> b!830942 (= lt!376901 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376894 () (_ BitVec 64))

(assert (=> b!830942 (= lt!376894 (select (arr!22320 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376899 () Unit!28442)

(declare-fun addStillContains!322 (ListLongMap!8897 (_ BitVec 64) V!25267 (_ BitVec 64)) Unit!28442)

(assert (=> b!830942 (= lt!376899 (addStillContains!322 lt!376897 lt!376901 zeroValueAfter!34 lt!376894))))

(assert (=> b!830942 (contains!4184 (+!1986 lt!376897 (tuple2!10073 lt!376901 zeroValueAfter!34)) lt!376894)))

(declare-fun lt!376898 () Unit!28442)

(assert (=> b!830942 (= lt!376898 lt!376899)))

(declare-fun lt!376893 () ListLongMap!8897)

(assert (=> b!830942 (= lt!376893 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376892 () (_ BitVec 64))

(assert (=> b!830942 (= lt!376892 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376889 () (_ BitVec 64))

(assert (=> b!830942 (= lt!376889 (select (arr!22320 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376891 () Unit!28442)

(declare-fun addApplyDifferent!322 (ListLongMap!8897 (_ BitVec 64) V!25267 (_ BitVec 64)) Unit!28442)

(assert (=> b!830942 (= lt!376891 (addApplyDifferent!322 lt!376893 lt!376892 minValue!754 lt!376889))))

(assert (=> b!830942 (= (apply!371 (+!1986 lt!376893 (tuple2!10073 lt!376892 minValue!754)) lt!376889) (apply!371 lt!376893 lt!376889))))

(declare-fun lt!376902 () Unit!28442)

(assert (=> b!830942 (= lt!376902 lt!376891)))

(declare-fun lt!376907 () ListLongMap!8897)

(assert (=> b!830942 (= lt!376907 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376906 () (_ BitVec 64))

(assert (=> b!830942 (= lt!376906 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376908 () (_ BitVec 64))

(assert (=> b!830942 (= lt!376908 (select (arr!22320 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376896 () Unit!28442)

(assert (=> b!830942 (= lt!376896 (addApplyDifferent!322 lt!376907 lt!376906 zeroValueAfter!34 lt!376908))))

(assert (=> b!830942 (= (apply!371 (+!1986 lt!376907 (tuple2!10073 lt!376906 zeroValueAfter!34)) lt!376908) (apply!371 lt!376907 lt!376908))))

(declare-fun lt!376909 () Unit!28442)

(assert (=> b!830942 (= lt!376909 lt!376896)))

(declare-fun lt!376900 () ListLongMap!8897)

(assert (=> b!830942 (= lt!376900 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376888 () (_ BitVec 64))

(assert (=> b!830942 (= lt!376888 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376903 () (_ BitVec 64))

(assert (=> b!830942 (= lt!376903 (select (arr!22320 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830942 (= lt!376905 (addApplyDifferent!322 lt!376900 lt!376888 minValue!754 lt!376903))))

(assert (=> b!830942 (= (apply!371 (+!1986 lt!376900 (tuple2!10073 lt!376888 minValue!754)) lt!376903) (apply!371 lt!376900 lt!376903))))

(declare-fun bm!36248 () Bool)

(assert (=> bm!36248 (= call!36252 call!36249)))

(declare-fun b!830943 () Bool)

(assert (=> b!830943 (= e!463325 (not call!36251))))

(declare-fun b!830944 () Bool)

(assert (=> b!830944 (= e!463325 e!463331)))

(declare-fun res!565712 () Bool)

(assert (=> b!830944 (= res!565712 call!36251)))

(assert (=> b!830944 (=> (not res!565712) (not e!463331))))

(declare-fun bm!36249 () Bool)

(assert (=> bm!36249 (= call!36247 (contains!4184 lt!376890 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36250 () Bool)

(assert (=> bm!36250 (= call!36253 (+!1986 (ite c!90113 call!36248 (ite c!90116 call!36249 call!36252)) (ite (or c!90113 c!90116) (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105635 c!90113) b!830932))

(assert (= (and d!105635 (not c!90113)) b!830931))

(assert (= (and b!830931 c!90116) b!830941))

(assert (= (and b!830931 (not c!90116)) b!830940))

(assert (= (and b!830940 c!90114) b!830930))

(assert (= (and b!830940 (not c!90114)) b!830935))

(assert (= (or b!830930 b!830935) bm!36248))

(assert (= (or b!830941 bm!36248) bm!36244))

(assert (= (or b!830941 b!830930) bm!36247))

(assert (= (or b!830932 bm!36244) bm!36245))

(assert (= (or b!830932 bm!36247) bm!36250))

(assert (= (and d!105635 res!565707) b!830936))

(assert (= (and d!105635 c!90115) b!830942))

(assert (= (and d!105635 (not c!90115)) b!830933))

(assert (= (and d!105635 res!565708) b!830928))

(assert (= (and b!830928 res!565711) b!830927))

(assert (= (and b!830928 (not res!565713)) b!830926))

(assert (= (and b!830926 res!565710) b!830938))

(assert (= (and b!830928 res!565705) b!830924))

(assert (= (and b!830924 c!90118) b!830944))

(assert (= (and b!830924 (not c!90118)) b!830943))

(assert (= (and b!830944 res!565712) b!830925))

(assert (= (or b!830944 b!830943) bm!36246))

(assert (= (and b!830924 res!565709) b!830934))

(assert (= (and b!830934 c!90117) b!830929))

(assert (= (and b!830934 (not c!90117)) b!830939))

(assert (= (and b!830929 res!565706) b!830937))

(assert (= (or b!830929 b!830939) bm!36249))

(declare-fun b_lambda!11337 () Bool)

(assert (=> (not b_lambda!11337) (not b!830938)))

(declare-fun t!22202 () Bool)

(declare-fun tb!4215 () Bool)

(assert (=> (and start!71628 (= defaultEntry!796 defaultEntry!796) t!22202) tb!4215))

(declare-fun result!8001 () Bool)

(assert (=> tb!4215 (= result!8001 tp_is_empty!15199)))

(assert (=> b!830938 t!22202))

(declare-fun b_and!22523 () Bool)

(assert (= b_and!22517 (and (=> t!22202 result!8001) b_and!22523)))

(assert (=> b!830938 m!774303))

(declare-fun m!774311 () Bool)

(assert (=> b!830938 m!774311))

(assert (=> b!830938 m!774311))

(declare-fun m!774313 () Bool)

(assert (=> b!830938 m!774313))

(declare-fun m!774315 () Bool)

(assert (=> b!830938 m!774315))

(assert (=> b!830938 m!774313))

(assert (=> b!830938 m!774303))

(declare-fun m!774317 () Bool)

(assert (=> b!830938 m!774317))

(assert (=> b!830926 m!774303))

(assert (=> b!830926 m!774303))

(declare-fun m!774319 () Bool)

(assert (=> b!830926 m!774319))

(assert (=> b!830927 m!774303))

(assert (=> b!830927 m!774303))

(assert (=> b!830927 m!774309))

(declare-fun m!774321 () Bool)

(assert (=> bm!36250 m!774321))

(assert (=> bm!36245 m!774237))

(assert (=> b!830936 m!774303))

(assert (=> b!830936 m!774303))

(assert (=> b!830936 m!774309))

(declare-fun m!774323 () Bool)

(assert (=> b!830925 m!774323))

(declare-fun m!774325 () Bool)

(assert (=> bm!36246 m!774325))

(declare-fun m!774327 () Bool)

(assert (=> bm!36249 m!774327))

(declare-fun m!774329 () Bool)

(assert (=> b!830937 m!774329))

(assert (=> d!105635 m!774215))

(declare-fun m!774331 () Bool)

(assert (=> b!830932 m!774331))

(declare-fun m!774333 () Bool)

(assert (=> b!830942 m!774333))

(declare-fun m!774335 () Bool)

(assert (=> b!830942 m!774335))

(assert (=> b!830942 m!774333))

(declare-fun m!774337 () Bool)

(assert (=> b!830942 m!774337))

(declare-fun m!774339 () Bool)

(assert (=> b!830942 m!774339))

(assert (=> b!830942 m!774337))

(declare-fun m!774341 () Bool)

(assert (=> b!830942 m!774341))

(declare-fun m!774343 () Bool)

(assert (=> b!830942 m!774343))

(declare-fun m!774345 () Bool)

(assert (=> b!830942 m!774345))

(assert (=> b!830942 m!774341))

(declare-fun m!774347 () Bool)

(assert (=> b!830942 m!774347))

(assert (=> b!830942 m!774343))

(declare-fun m!774349 () Bool)

(assert (=> b!830942 m!774349))

(declare-fun m!774351 () Bool)

(assert (=> b!830942 m!774351))

(assert (=> b!830942 m!774237))

(declare-fun m!774353 () Bool)

(assert (=> b!830942 m!774353))

(assert (=> b!830942 m!774303))

(declare-fun m!774355 () Bool)

(assert (=> b!830942 m!774355))

(declare-fun m!774357 () Bool)

(assert (=> b!830942 m!774357))

(declare-fun m!774359 () Bool)

(assert (=> b!830942 m!774359))

(declare-fun m!774361 () Bool)

(assert (=> b!830942 m!774361))

(assert (=> b!830803 d!105635))

(declare-fun d!105637 () Bool)

(declare-fun e!463338 () Bool)

(assert (=> d!105637 e!463338))

(declare-fun res!565718 () Bool)

(assert (=> d!105637 (=> (not res!565718) (not e!463338))))

(declare-fun lt!376918 () ListLongMap!8897)

(assert (=> d!105637 (= res!565718 (contains!4184 lt!376918 (_1!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376920 () List!15843)

(assert (=> d!105637 (= lt!376918 (ListLongMap!8898 lt!376920))))

(declare-fun lt!376919 () Unit!28442)

(declare-fun lt!376921 () Unit!28442)

(assert (=> d!105637 (= lt!376919 lt!376921)))

(declare-datatypes ((Option!421 0))(
  ( (Some!420 (v!10091 V!25267)) (None!419) )
))
(declare-fun getValueByKey!415 (List!15843 (_ BitVec 64)) Option!421)

(assert (=> d!105637 (= (getValueByKey!415 lt!376920 (_1!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!420 (_2!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!229 (List!15843 (_ BitVec 64) V!25267) Unit!28442)

(assert (=> d!105637 (= lt!376921 (lemmaContainsTupThenGetReturnValue!229 lt!376920 (_1!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!268 (List!15843 (_ BitVec 64) V!25267) List!15843)

(assert (=> d!105637 (= lt!376920 (insertStrictlySorted!268 (toList!4464 (+!1986 lt!376824 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105637 (= (+!1986 (+!1986 lt!376824 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376918)))

(declare-fun b!830951 () Bool)

(declare-fun res!565719 () Bool)

(assert (=> b!830951 (=> (not res!565719) (not e!463338))))

(assert (=> b!830951 (= res!565719 (= (getValueByKey!415 (toList!4464 lt!376918) (_1!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!420 (_2!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830952 () Bool)

(declare-fun contains!4185 (List!15843 tuple2!10072) Bool)

(assert (=> b!830952 (= e!463338 (contains!4185 (toList!4464 lt!376918) (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105637 res!565718) b!830951))

(assert (= (and b!830951 res!565719) b!830952))

(declare-fun m!774363 () Bool)

(assert (=> d!105637 m!774363))

(declare-fun m!774365 () Bool)

(assert (=> d!105637 m!774365))

(declare-fun m!774367 () Bool)

(assert (=> d!105637 m!774367))

(declare-fun m!774369 () Bool)

(assert (=> d!105637 m!774369))

(declare-fun m!774371 () Bool)

(assert (=> b!830951 m!774371))

(declare-fun m!774373 () Bool)

(assert (=> b!830952 m!774373))

(assert (=> b!830803 d!105637))

(declare-fun d!105639 () Bool)

(declare-fun e!463339 () Bool)

(assert (=> d!105639 e!463339))

(declare-fun res!565720 () Bool)

(assert (=> d!105639 (=> (not res!565720) (not e!463339))))

(declare-fun lt!376922 () ListLongMap!8897)

(assert (=> d!105639 (= res!565720 (contains!4184 lt!376922 (_1!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!376924 () List!15843)

(assert (=> d!105639 (= lt!376922 (ListLongMap!8898 lt!376924))))

(declare-fun lt!376923 () Unit!28442)

(declare-fun lt!376925 () Unit!28442)

(assert (=> d!105639 (= lt!376923 lt!376925)))

(assert (=> d!105639 (= (getValueByKey!415 lt!376924 (_1!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!420 (_2!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105639 (= lt!376925 (lemmaContainsTupThenGetReturnValue!229 lt!376924 (_1!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105639 (= lt!376924 (insertStrictlySorted!268 (toList!4464 lt!376824) (_1!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105639 (= (+!1986 lt!376824 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376922)))

(declare-fun b!830953 () Bool)

(declare-fun res!565721 () Bool)

(assert (=> b!830953 (=> (not res!565721) (not e!463339))))

(assert (=> b!830953 (= res!565721 (= (getValueByKey!415 (toList!4464 lt!376922) (_1!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!420 (_2!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!830954 () Bool)

(assert (=> b!830954 (= e!463339 (contains!4185 (toList!4464 lt!376922) (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105639 res!565720) b!830953))

(assert (= (and b!830953 res!565721) b!830954))

(declare-fun m!774375 () Bool)

(assert (=> d!105639 m!774375))

(declare-fun m!774377 () Bool)

(assert (=> d!105639 m!774377))

(declare-fun m!774379 () Bool)

(assert (=> d!105639 m!774379))

(declare-fun m!774381 () Bool)

(assert (=> d!105639 m!774381))

(declare-fun m!774383 () Bool)

(assert (=> b!830953 m!774383))

(declare-fun m!774385 () Bool)

(assert (=> b!830954 m!774385))

(assert (=> b!830803 d!105639))

(declare-fun d!105641 () Bool)

(declare-fun res!565727 () Bool)

(declare-fun e!463346 () Bool)

(assert (=> d!105641 (=> res!565727 e!463346)))

(assert (=> d!105641 (= res!565727 (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> d!105641 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!463346)))

(declare-fun b!830963 () Bool)

(declare-fun e!463347 () Bool)

(declare-fun call!36256 () Bool)

(assert (=> b!830963 (= e!463347 call!36256)))

(declare-fun b!830964 () Bool)

(declare-fun e!463348 () Bool)

(assert (=> b!830964 (= e!463348 call!36256)))

(declare-fun b!830965 () Bool)

(assert (=> b!830965 (= e!463346 e!463347)))

(declare-fun c!90121 () Bool)

(assert (=> b!830965 (= c!90121 (validKeyInArray!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830966 () Bool)

(assert (=> b!830966 (= e!463347 e!463348)))

(declare-fun lt!376932 () (_ BitVec 64))

(assert (=> b!830966 (= lt!376932 (select (arr!22320 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376934 () Unit!28442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46575 (_ BitVec 64) (_ BitVec 32)) Unit!28442)

(assert (=> b!830966 (= lt!376934 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376932 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!830966 (arrayContainsKey!0 _keys!976 lt!376932 #b00000000000000000000000000000000)))

(declare-fun lt!376933 () Unit!28442)

(assert (=> b!830966 (= lt!376933 lt!376934)))

(declare-fun res!565726 () Bool)

(declare-datatypes ((SeekEntryResult!8694 0))(
  ( (MissingZero!8694 (index!37147 (_ BitVec 32))) (Found!8694 (index!37148 (_ BitVec 32))) (Intermediate!8694 (undefined!9506 Bool) (index!37149 (_ BitVec 32)) (x!70054 (_ BitVec 32))) (Undefined!8694) (MissingVacant!8694 (index!37150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46575 (_ BitVec 32)) SeekEntryResult!8694)

(assert (=> b!830966 (= res!565726 (= (seekEntryOrOpen!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8694 #b00000000000000000000000000000000)))))

(assert (=> b!830966 (=> (not res!565726) (not e!463348))))

(declare-fun bm!36253 () Bool)

(assert (=> bm!36253 (= call!36256 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!105641 (not res!565727)) b!830965))

(assert (= (and b!830965 c!90121) b!830966))

(assert (= (and b!830965 (not c!90121)) b!830963))

(assert (= (and b!830966 res!565726) b!830964))

(assert (= (or b!830964 b!830963) bm!36253))

(assert (=> b!830965 m!774303))

(assert (=> b!830965 m!774303))

(assert (=> b!830965 m!774309))

(assert (=> b!830966 m!774303))

(declare-fun m!774387 () Bool)

(assert (=> b!830966 m!774387))

(declare-fun m!774389 () Bool)

(assert (=> b!830966 m!774389))

(assert (=> b!830966 m!774303))

(declare-fun m!774391 () Bool)

(assert (=> b!830966 m!774391))

(declare-fun m!774393 () Bool)

(assert (=> bm!36253 m!774393))

(assert (=> b!830801 d!105641))

(declare-fun b!830967 () Bool)

(declare-fun res!565732 () Bool)

(declare-fun e!463353 () Bool)

(assert (=> b!830967 (=> (not res!565732) (not e!463353))))

(declare-fun e!463351 () Bool)

(assert (=> b!830967 (= res!565732 e!463351)))

(declare-fun c!90127 () Bool)

(assert (=> b!830967 (= c!90127 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830968 () Bool)

(declare-fun e!463357 () Bool)

(declare-fun lt!376937 () ListLongMap!8897)

(assert (=> b!830968 (= e!463357 (= (apply!371 lt!376937 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!36254 () Bool)

(declare-fun call!36259 () ListLongMap!8897)

(declare-fun call!36258 () ListLongMap!8897)

(assert (=> bm!36254 (= call!36259 call!36258)))

(declare-fun b!830970 () Bool)

(declare-fun e!463359 () Bool)

(assert (=> b!830970 (= e!463359 (validKeyInArray!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830971 () Bool)

(declare-fun res!565728 () Bool)

(assert (=> b!830971 (=> (not res!565728) (not e!463353))))

(declare-fun e!463356 () Bool)

(assert (=> b!830971 (= res!565728 e!463356)))

(declare-fun res!565736 () Bool)

(assert (=> b!830971 (=> res!565736 e!463356)))

(assert (=> b!830971 (= res!565736 (not e!463359))))

(declare-fun res!565734 () Bool)

(assert (=> b!830971 (=> (not res!565734) (not e!463359))))

(assert (=> b!830971 (= res!565734 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!830972 () Bool)

(declare-fun e!463361 () Bool)

(declare-fun e!463360 () Bool)

(assert (=> b!830972 (= e!463361 e!463360)))

(declare-fun res!565729 () Bool)

(declare-fun call!36257 () Bool)

(assert (=> b!830972 (= res!565729 call!36257)))

(assert (=> b!830972 (=> (not res!565729) (not e!463360))))

(declare-fun b!830973 () Bool)

(declare-fun e!463358 () ListLongMap!8897)

(declare-fun call!36260 () ListLongMap!8897)

(assert (=> b!830973 (= e!463358 call!36260)))

(declare-fun b!830974 () Bool)

(declare-fun e!463354 () ListLongMap!8897)

(declare-fun e!463349 () ListLongMap!8897)

(assert (=> b!830974 (= e!463354 e!463349)))

(declare-fun c!90125 () Bool)

(assert (=> b!830974 (= c!90125 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830975 () Bool)

(declare-fun call!36263 () ListLongMap!8897)

(assert (=> b!830975 (= e!463354 (+!1986 call!36263 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!830976 () Bool)

(declare-fun e!463355 () Unit!28442)

(declare-fun Unit!28445 () Unit!28442)

(assert (=> b!830976 (= e!463355 Unit!28445)))

(declare-fun b!830977 () Bool)

(assert (=> b!830977 (= e!463353 e!463361)))

(declare-fun c!90126 () Bool)

(assert (=> b!830977 (= c!90126 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36255 () Bool)

(assert (=> bm!36255 (= call!36258 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830969 () Bool)

(declare-fun e!463350 () Bool)

(assert (=> b!830969 (= e!463356 e!463350)))

(declare-fun res!565733 () Bool)

(assert (=> b!830969 (=> (not res!565733) (not e!463350))))

(assert (=> b!830969 (= res!565733 (contains!4184 lt!376937 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun d!105643 () Bool)

(assert (=> d!105643 e!463353))

(declare-fun res!565731 () Bool)

(assert (=> d!105643 (=> (not res!565731) (not e!463353))))

(assert (=> d!105643 (= res!565731 (or (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))))

(declare-fun lt!376942 () ListLongMap!8897)

(assert (=> d!105643 (= lt!376937 lt!376942)))

(declare-fun lt!376951 () Unit!28442)

(assert (=> d!105643 (= lt!376951 e!463355)))

(declare-fun c!90124 () Bool)

(declare-fun e!463352 () Bool)

(assert (=> d!105643 (= c!90124 e!463352)))

(declare-fun res!565730 () Bool)

(assert (=> d!105643 (=> (not res!565730) (not e!463352))))

(assert (=> d!105643 (= res!565730 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> d!105643 (= lt!376942 e!463354)))

(declare-fun c!90122 () Bool)

(assert (=> d!105643 (= c!90122 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105643 (validMask!0 mask!1312)))

(assert (=> d!105643 (= (getCurrentListMap!2557 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376937)))

(declare-fun b!830978 () Bool)

(declare-fun call!36262 () ListLongMap!8897)

(assert (=> b!830978 (= e!463358 call!36262)))

(declare-fun bm!36256 () Bool)

(declare-fun call!36261 () Bool)

(assert (=> bm!36256 (= call!36261 (contains!4184 lt!376937 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830979 () Bool)

(assert (=> b!830979 (= e!463352 (validKeyInArray!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830980 () Bool)

(assert (=> b!830980 (= e!463360 (= (apply!371 lt!376937 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830981 () Bool)

(assert (=> b!830981 (= e!463350 (= (apply!371 lt!376937 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22321 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830981 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22741 _values!788)))))

(assert (=> b!830981 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!830982 () Bool)

(assert (=> b!830982 (= e!463361 (not call!36257))))

(declare-fun b!830983 () Bool)

(declare-fun c!90123 () Bool)

(assert (=> b!830983 (= c!90123 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!830983 (= e!463349 e!463358)))

(declare-fun bm!36257 () Bool)

(assert (=> bm!36257 (= call!36260 call!36263)))

(declare-fun b!830984 () Bool)

(assert (=> b!830984 (= e!463349 call!36260)))

(declare-fun b!830985 () Bool)

(declare-fun lt!376952 () Unit!28442)

(assert (=> b!830985 (= e!463355 lt!376952)))

(declare-fun lt!376944 () ListLongMap!8897)

(assert (=> b!830985 (= lt!376944 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376948 () (_ BitVec 64))

(assert (=> b!830985 (= lt!376948 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376941 () (_ BitVec 64))

(assert (=> b!830985 (= lt!376941 (select (arr!22320 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376946 () Unit!28442)

(assert (=> b!830985 (= lt!376946 (addStillContains!322 lt!376944 lt!376948 zeroValueBefore!34 lt!376941))))

(assert (=> b!830985 (contains!4184 (+!1986 lt!376944 (tuple2!10073 lt!376948 zeroValueBefore!34)) lt!376941)))

(declare-fun lt!376945 () Unit!28442)

(assert (=> b!830985 (= lt!376945 lt!376946)))

(declare-fun lt!376940 () ListLongMap!8897)

(assert (=> b!830985 (= lt!376940 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376939 () (_ BitVec 64))

(assert (=> b!830985 (= lt!376939 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376936 () (_ BitVec 64))

(assert (=> b!830985 (= lt!376936 (select (arr!22320 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376938 () Unit!28442)

(assert (=> b!830985 (= lt!376938 (addApplyDifferent!322 lt!376940 lt!376939 minValue!754 lt!376936))))

(assert (=> b!830985 (= (apply!371 (+!1986 lt!376940 (tuple2!10073 lt!376939 minValue!754)) lt!376936) (apply!371 lt!376940 lt!376936))))

(declare-fun lt!376949 () Unit!28442)

(assert (=> b!830985 (= lt!376949 lt!376938)))

(declare-fun lt!376954 () ListLongMap!8897)

(assert (=> b!830985 (= lt!376954 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376953 () (_ BitVec 64))

(assert (=> b!830985 (= lt!376953 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376955 () (_ BitVec 64))

(assert (=> b!830985 (= lt!376955 (select (arr!22320 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376943 () Unit!28442)

(assert (=> b!830985 (= lt!376943 (addApplyDifferent!322 lt!376954 lt!376953 zeroValueBefore!34 lt!376955))))

(assert (=> b!830985 (= (apply!371 (+!1986 lt!376954 (tuple2!10073 lt!376953 zeroValueBefore!34)) lt!376955) (apply!371 lt!376954 lt!376955))))

(declare-fun lt!376956 () Unit!28442)

(assert (=> b!830985 (= lt!376956 lt!376943)))

(declare-fun lt!376947 () ListLongMap!8897)

(assert (=> b!830985 (= lt!376947 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376935 () (_ BitVec 64))

(assert (=> b!830985 (= lt!376935 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376950 () (_ BitVec 64))

(assert (=> b!830985 (= lt!376950 (select (arr!22320 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830985 (= lt!376952 (addApplyDifferent!322 lt!376947 lt!376935 minValue!754 lt!376950))))

(assert (=> b!830985 (= (apply!371 (+!1986 lt!376947 (tuple2!10073 lt!376935 minValue!754)) lt!376950) (apply!371 lt!376947 lt!376950))))

(declare-fun bm!36258 () Bool)

(assert (=> bm!36258 (= call!36262 call!36259)))

(declare-fun b!830986 () Bool)

(assert (=> b!830986 (= e!463351 (not call!36261))))

(declare-fun b!830987 () Bool)

(assert (=> b!830987 (= e!463351 e!463357)))

(declare-fun res!565735 () Bool)

(assert (=> b!830987 (= res!565735 call!36261)))

(assert (=> b!830987 (=> (not res!565735) (not e!463357))))

(declare-fun bm!36259 () Bool)

(assert (=> bm!36259 (= call!36257 (contains!4184 lt!376937 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36260 () Bool)

(assert (=> bm!36260 (= call!36263 (+!1986 (ite c!90122 call!36258 (ite c!90125 call!36259 call!36262)) (ite (or c!90122 c!90125) (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105643 c!90122) b!830975))

(assert (= (and d!105643 (not c!90122)) b!830974))

(assert (= (and b!830974 c!90125) b!830984))

(assert (= (and b!830974 (not c!90125)) b!830983))

(assert (= (and b!830983 c!90123) b!830973))

(assert (= (and b!830983 (not c!90123)) b!830978))

(assert (= (or b!830973 b!830978) bm!36258))

(assert (= (or b!830984 bm!36258) bm!36254))

(assert (= (or b!830984 b!830973) bm!36257))

(assert (= (or b!830975 bm!36254) bm!36255))

(assert (= (or b!830975 bm!36257) bm!36260))

(assert (= (and d!105643 res!565730) b!830979))

(assert (= (and d!105643 c!90124) b!830985))

(assert (= (and d!105643 (not c!90124)) b!830976))

(assert (= (and d!105643 res!565731) b!830971))

(assert (= (and b!830971 res!565734) b!830970))

(assert (= (and b!830971 (not res!565736)) b!830969))

(assert (= (and b!830969 res!565733) b!830981))

(assert (= (and b!830971 res!565728) b!830967))

(assert (= (and b!830967 c!90127) b!830987))

(assert (= (and b!830967 (not c!90127)) b!830986))

(assert (= (and b!830987 res!565735) b!830968))

(assert (= (or b!830987 b!830986) bm!36256))

(assert (= (and b!830967 res!565732) b!830977))

(assert (= (and b!830977 c!90126) b!830972))

(assert (= (and b!830977 (not c!90126)) b!830982))

(assert (= (and b!830972 res!565729) b!830980))

(assert (= (or b!830972 b!830982) bm!36259))

(declare-fun b_lambda!11339 () Bool)

(assert (=> (not b_lambda!11339) (not b!830981)))

(assert (=> b!830981 t!22202))

(declare-fun b_and!22525 () Bool)

(assert (= b_and!22523 (and (=> t!22202 result!8001) b_and!22525)))

(assert (=> b!830981 m!774303))

(assert (=> b!830981 m!774311))

(assert (=> b!830981 m!774311))

(assert (=> b!830981 m!774313))

(assert (=> b!830981 m!774315))

(assert (=> b!830981 m!774313))

(assert (=> b!830981 m!774303))

(declare-fun m!774395 () Bool)

(assert (=> b!830981 m!774395))

(assert (=> b!830969 m!774303))

(assert (=> b!830969 m!774303))

(declare-fun m!774397 () Bool)

(assert (=> b!830969 m!774397))

(assert (=> b!830970 m!774303))

(assert (=> b!830970 m!774303))

(assert (=> b!830970 m!774309))

(declare-fun m!774399 () Bool)

(assert (=> bm!36260 m!774399))

(assert (=> bm!36255 m!774239))

(assert (=> b!830979 m!774303))

(assert (=> b!830979 m!774303))

(assert (=> b!830979 m!774309))

(declare-fun m!774401 () Bool)

(assert (=> b!830968 m!774401))

(declare-fun m!774403 () Bool)

(assert (=> bm!36256 m!774403))

(declare-fun m!774405 () Bool)

(assert (=> bm!36259 m!774405))

(declare-fun m!774407 () Bool)

(assert (=> b!830980 m!774407))

(assert (=> d!105643 m!774215))

(declare-fun m!774409 () Bool)

(assert (=> b!830975 m!774409))

(declare-fun m!774411 () Bool)

(assert (=> b!830985 m!774411))

(declare-fun m!774413 () Bool)

(assert (=> b!830985 m!774413))

(assert (=> b!830985 m!774411))

(declare-fun m!774415 () Bool)

(assert (=> b!830985 m!774415))

(declare-fun m!774417 () Bool)

(assert (=> b!830985 m!774417))

(assert (=> b!830985 m!774415))

(declare-fun m!774419 () Bool)

(assert (=> b!830985 m!774419))

(declare-fun m!774421 () Bool)

(assert (=> b!830985 m!774421))

(declare-fun m!774423 () Bool)

(assert (=> b!830985 m!774423))

(assert (=> b!830985 m!774419))

(declare-fun m!774425 () Bool)

(assert (=> b!830985 m!774425))

(assert (=> b!830985 m!774421))

(declare-fun m!774427 () Bool)

(assert (=> b!830985 m!774427))

(declare-fun m!774429 () Bool)

(assert (=> b!830985 m!774429))

(assert (=> b!830985 m!774239))

(declare-fun m!774431 () Bool)

(assert (=> b!830985 m!774431))

(assert (=> b!830985 m!774303))

(declare-fun m!774433 () Bool)

(assert (=> b!830985 m!774433))

(declare-fun m!774435 () Bool)

(assert (=> b!830985 m!774435))

(declare-fun m!774437 () Bool)

(assert (=> b!830985 m!774437))

(declare-fun m!774439 () Bool)

(assert (=> b!830985 m!774439))

(assert (=> b!830797 d!105643))

(declare-fun d!105645 () Bool)

(declare-fun e!463362 () Bool)

(assert (=> d!105645 e!463362))

(declare-fun res!565737 () Bool)

(assert (=> d!105645 (=> (not res!565737) (not e!463362))))

(declare-fun lt!376957 () ListLongMap!8897)

(assert (=> d!105645 (= res!565737 (contains!4184 lt!376957 (_1!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376959 () List!15843)

(assert (=> d!105645 (= lt!376957 (ListLongMap!8898 lt!376959))))

(declare-fun lt!376958 () Unit!28442)

(declare-fun lt!376960 () Unit!28442)

(assert (=> d!105645 (= lt!376958 lt!376960)))

(assert (=> d!105645 (= (getValueByKey!415 lt!376959 (_1!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!420 (_2!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105645 (= lt!376960 (lemmaContainsTupThenGetReturnValue!229 lt!376959 (_1!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105645 (= lt!376959 (insertStrictlySorted!268 (toList!4464 (+!1986 lt!376823 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (_1!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105645 (= (+!1986 (+!1986 lt!376823 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376957)))

(declare-fun b!830988 () Bool)

(declare-fun res!565738 () Bool)

(assert (=> b!830988 (=> (not res!565738) (not e!463362))))

(assert (=> b!830988 (= res!565738 (= (getValueByKey!415 (toList!4464 lt!376957) (_1!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!420 (_2!5047 (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830989 () Bool)

(assert (=> b!830989 (= e!463362 (contains!4185 (toList!4464 lt!376957) (tuple2!10073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105645 res!565737) b!830988))

(assert (= (and b!830988 res!565738) b!830989))

(declare-fun m!774441 () Bool)

(assert (=> d!105645 m!774441))

(declare-fun m!774443 () Bool)

(assert (=> d!105645 m!774443))

(declare-fun m!774445 () Bool)

(assert (=> d!105645 m!774445))

(declare-fun m!774447 () Bool)

(assert (=> d!105645 m!774447))

(declare-fun m!774449 () Bool)

(assert (=> b!830988 m!774449))

(declare-fun m!774451 () Bool)

(assert (=> b!830989 m!774451))

(assert (=> b!830797 d!105645))

(declare-fun d!105647 () Bool)

(declare-fun e!463363 () Bool)

(assert (=> d!105647 e!463363))

(declare-fun res!565739 () Bool)

(assert (=> d!105647 (=> (not res!565739) (not e!463363))))

(declare-fun lt!376961 () ListLongMap!8897)

(assert (=> d!105647 (= res!565739 (contains!4184 lt!376961 (_1!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!376963 () List!15843)

(assert (=> d!105647 (= lt!376961 (ListLongMap!8898 lt!376963))))

(declare-fun lt!376962 () Unit!28442)

(declare-fun lt!376964 () Unit!28442)

(assert (=> d!105647 (= lt!376962 lt!376964)))

(assert (=> d!105647 (= (getValueByKey!415 lt!376963 (_1!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!420 (_2!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105647 (= lt!376964 (lemmaContainsTupThenGetReturnValue!229 lt!376963 (_1!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105647 (= lt!376963 (insertStrictlySorted!268 (toList!4464 lt!376823) (_1!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105647 (= (+!1986 lt!376823 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!376961)))

(declare-fun b!830990 () Bool)

(declare-fun res!565740 () Bool)

(assert (=> b!830990 (=> (not res!565740) (not e!463363))))

(assert (=> b!830990 (= res!565740 (= (getValueByKey!415 (toList!4464 lt!376961) (_1!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!420 (_2!5047 (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!830991 () Bool)

(assert (=> b!830991 (= e!463363 (contains!4185 (toList!4464 lt!376961) (tuple2!10073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!105647 res!565739) b!830990))

(assert (= (and b!830990 res!565740) b!830991))

(declare-fun m!774453 () Bool)

(assert (=> d!105647 m!774453))

(declare-fun m!774455 () Bool)

(assert (=> d!105647 m!774455))

(declare-fun m!774457 () Bool)

(assert (=> d!105647 m!774457))

(declare-fun m!774459 () Bool)

(assert (=> d!105647 m!774459))

(declare-fun m!774461 () Bool)

(assert (=> b!830990 m!774461))

(declare-fun m!774463 () Bool)

(assert (=> b!830991 m!774463))

(assert (=> b!830797 d!105647))

(declare-fun d!105649 () Bool)

(assert (=> d!105649 (= (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376967 () Unit!28442)

(declare-fun choose!1421 (array!46575 array!46577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25267 V!25267 V!25267 V!25267 (_ BitVec 32) Int) Unit!28442)

(assert (=> d!105649 (= lt!376967 (choose!1421 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105649 (validMask!0 mask!1312)))

(assert (=> d!105649 (= (lemmaNoChangeToArrayThenSameMapNoExtras!602 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376967)))

(declare-fun bs!23194 () Bool)

(assert (= bs!23194 d!105649))

(assert (=> bs!23194 m!774239))

(assert (=> bs!23194 m!774237))

(declare-fun m!774465 () Bool)

(assert (=> bs!23194 m!774465))

(assert (=> bs!23194 m!774215))

(assert (=> b!830805 d!105649))

(declare-fun b!831016 () Bool)

(declare-fun lt!376982 () Unit!28442)

(declare-fun lt!376983 () Unit!28442)

(assert (=> b!831016 (= lt!376982 lt!376983)))

(declare-fun lt!376985 () (_ BitVec 64))

(declare-fun lt!376984 () (_ BitVec 64))

(declare-fun lt!376987 () ListLongMap!8897)

(declare-fun lt!376988 () V!25267)

(assert (=> b!831016 (not (contains!4184 (+!1986 lt!376987 (tuple2!10073 lt!376985 lt!376988)) lt!376984))))

(declare-fun addStillNotContains!198 (ListLongMap!8897 (_ BitVec 64) V!25267 (_ BitVec 64)) Unit!28442)

(assert (=> b!831016 (= lt!376983 (addStillNotContains!198 lt!376987 lt!376985 lt!376988 lt!376984))))

(assert (=> b!831016 (= lt!376984 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!831016 (= lt!376988 (get!11817 (select (arr!22321 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831016 (= lt!376985 (select (arr!22320 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36266 () ListLongMap!8897)

(assert (=> b!831016 (= lt!376987 call!36266)))

(declare-fun e!463382 () ListLongMap!8897)

(assert (=> b!831016 (= e!463382 (+!1986 call!36266 (tuple2!10073 (select (arr!22320 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22321 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831017 () Bool)

(declare-fun e!463378 () ListLongMap!8897)

(assert (=> b!831017 (= e!463378 e!463382)))

(declare-fun c!90136 () Bool)

(assert (=> b!831017 (= c!90136 (validKeyInArray!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831018 () Bool)

(assert (=> b!831018 (= e!463378 (ListLongMap!8898 Nil!15840))))

(declare-fun b!831019 () Bool)

(declare-fun e!463381 () Bool)

(declare-fun e!463384 () Bool)

(assert (=> b!831019 (= e!463381 e!463384)))

(assert (=> b!831019 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun res!565749 () Bool)

(declare-fun lt!376986 () ListLongMap!8897)

(assert (=> b!831019 (= res!565749 (contains!4184 lt!376986 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831019 (=> (not res!565749) (not e!463384))))

(declare-fun b!831020 () Bool)

(declare-fun res!565750 () Bool)

(declare-fun e!463380 () Bool)

(assert (=> b!831020 (=> (not res!565750) (not e!463380))))

(assert (=> b!831020 (= res!565750 (not (contains!4184 lt!376986 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831021 () Bool)

(declare-fun e!463379 () Bool)

(assert (=> b!831021 (= e!463379 (validKeyInArray!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831021 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!105651 () Bool)

(assert (=> d!105651 e!463380))

(declare-fun res!565751 () Bool)

(assert (=> d!105651 (=> (not res!565751) (not e!463380))))

(assert (=> d!105651 (= res!565751 (not (contains!4184 lt!376986 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105651 (= lt!376986 e!463378)))

(declare-fun c!90139 () Bool)

(assert (=> d!105651 (= c!90139 (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> d!105651 (validMask!0 mask!1312)))

(assert (=> d!105651 (= (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376986)))

(declare-fun b!831022 () Bool)

(assert (=> b!831022 (= e!463382 call!36266)))

(declare-fun b!831023 () Bool)

(assert (=> b!831023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> b!831023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22741 _values!788)))))

(assert (=> b!831023 (= e!463384 (= (apply!371 lt!376986 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22321 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831024 () Bool)

(declare-fun e!463383 () Bool)

(assert (=> b!831024 (= e!463381 e!463383)))

(declare-fun c!90137 () Bool)

(assert (=> b!831024 (= c!90137 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!831025 () Bool)

(assert (=> b!831025 (= e!463383 (= lt!376986 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!831026 () Bool)

(declare-fun isEmpty!659 (ListLongMap!8897) Bool)

(assert (=> b!831026 (= e!463383 (isEmpty!659 lt!376986))))

(declare-fun bm!36263 () Bool)

(assert (=> bm!36263 (= call!36266 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!831027 () Bool)

(assert (=> b!831027 (= e!463380 e!463381)))

(declare-fun c!90138 () Bool)

(assert (=> b!831027 (= c!90138 e!463379)))

(declare-fun res!565752 () Bool)

(assert (=> b!831027 (=> (not res!565752) (not e!463379))))

(assert (=> b!831027 (= res!565752 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (= (and d!105651 c!90139) b!831018))

(assert (= (and d!105651 (not c!90139)) b!831017))

(assert (= (and b!831017 c!90136) b!831016))

(assert (= (and b!831017 (not c!90136)) b!831022))

(assert (= (or b!831016 b!831022) bm!36263))

(assert (= (and d!105651 res!565751) b!831020))

(assert (= (and b!831020 res!565750) b!831027))

(assert (= (and b!831027 res!565752) b!831021))

(assert (= (and b!831027 c!90138) b!831019))

(assert (= (and b!831027 (not c!90138)) b!831024))

(assert (= (and b!831019 res!565749) b!831023))

(assert (= (and b!831024 c!90137) b!831025))

(assert (= (and b!831024 (not c!90137)) b!831026))

(declare-fun b_lambda!11341 () Bool)

(assert (=> (not b_lambda!11341) (not b!831016)))

(assert (=> b!831016 t!22202))

(declare-fun b_and!22527 () Bool)

(assert (= b_and!22525 (and (=> t!22202 result!8001) b_and!22527)))

(declare-fun b_lambda!11343 () Bool)

(assert (=> (not b_lambda!11343) (not b!831023)))

(assert (=> b!831023 t!22202))

(declare-fun b_and!22529 () Bool)

(assert (= b_and!22527 (and (=> t!22202 result!8001) b_and!22529)))

(assert (=> b!831019 m!774303))

(assert (=> b!831019 m!774303))

(declare-fun m!774467 () Bool)

(assert (=> b!831019 m!774467))

(assert (=> b!831017 m!774303))

(assert (=> b!831017 m!774303))

(assert (=> b!831017 m!774309))

(declare-fun m!774469 () Bool)

(assert (=> bm!36263 m!774469))

(assert (=> b!831025 m!774469))

(assert (=> b!831023 m!774303))

(assert (=> b!831023 m!774311))

(assert (=> b!831023 m!774313))

(assert (=> b!831023 m!774315))

(assert (=> b!831023 m!774313))

(assert (=> b!831023 m!774303))

(declare-fun m!774471 () Bool)

(assert (=> b!831023 m!774471))

(assert (=> b!831023 m!774311))

(assert (=> b!831021 m!774303))

(assert (=> b!831021 m!774303))

(assert (=> b!831021 m!774309))

(declare-fun m!774473 () Bool)

(assert (=> b!831020 m!774473))

(assert (=> b!831016 m!774303))

(declare-fun m!774475 () Bool)

(assert (=> b!831016 m!774475))

(declare-fun m!774477 () Bool)

(assert (=> b!831016 m!774477))

(assert (=> b!831016 m!774313))

(declare-fun m!774479 () Bool)

(assert (=> b!831016 m!774479))

(assert (=> b!831016 m!774311))

(assert (=> b!831016 m!774311))

(assert (=> b!831016 m!774313))

(assert (=> b!831016 m!774315))

(assert (=> b!831016 m!774477))

(declare-fun m!774481 () Bool)

(assert (=> b!831016 m!774481))

(declare-fun m!774483 () Bool)

(assert (=> b!831026 m!774483))

(declare-fun m!774485 () Bool)

(assert (=> d!105651 m!774485))

(assert (=> d!105651 m!774215))

(assert (=> b!830805 d!105651))

(declare-fun b!831028 () Bool)

(declare-fun lt!376989 () Unit!28442)

(declare-fun lt!376990 () Unit!28442)

(assert (=> b!831028 (= lt!376989 lt!376990)))

(declare-fun lt!376995 () V!25267)

(declare-fun lt!376994 () ListLongMap!8897)

(declare-fun lt!376992 () (_ BitVec 64))

(declare-fun lt!376991 () (_ BitVec 64))

(assert (=> b!831028 (not (contains!4184 (+!1986 lt!376994 (tuple2!10073 lt!376992 lt!376995)) lt!376991))))

(assert (=> b!831028 (= lt!376990 (addStillNotContains!198 lt!376994 lt!376992 lt!376995 lt!376991))))

(assert (=> b!831028 (= lt!376991 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!831028 (= lt!376995 (get!11817 (select (arr!22321 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831028 (= lt!376992 (select (arr!22320 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36267 () ListLongMap!8897)

(assert (=> b!831028 (= lt!376994 call!36267)))

(declare-fun e!463389 () ListLongMap!8897)

(assert (=> b!831028 (= e!463389 (+!1986 call!36267 (tuple2!10073 (select (arr!22320 _keys!976) #b00000000000000000000000000000000) (get!11817 (select (arr!22321 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831029 () Bool)

(declare-fun e!463385 () ListLongMap!8897)

(assert (=> b!831029 (= e!463385 e!463389)))

(declare-fun c!90140 () Bool)

(assert (=> b!831029 (= c!90140 (validKeyInArray!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831030 () Bool)

(assert (=> b!831030 (= e!463385 (ListLongMap!8898 Nil!15840))))

(declare-fun b!831031 () Bool)

(declare-fun e!463388 () Bool)

(declare-fun e!463391 () Bool)

(assert (=> b!831031 (= e!463388 e!463391)))

(assert (=> b!831031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun res!565753 () Bool)

(declare-fun lt!376993 () ListLongMap!8897)

(assert (=> b!831031 (= res!565753 (contains!4184 lt!376993 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831031 (=> (not res!565753) (not e!463391))))

(declare-fun b!831032 () Bool)

(declare-fun res!565754 () Bool)

(declare-fun e!463387 () Bool)

(assert (=> b!831032 (=> (not res!565754) (not e!463387))))

(assert (=> b!831032 (= res!565754 (not (contains!4184 lt!376993 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831033 () Bool)

(declare-fun e!463386 () Bool)

(assert (=> b!831033 (= e!463386 (validKeyInArray!0 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831033 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!105653 () Bool)

(assert (=> d!105653 e!463387))

(declare-fun res!565755 () Bool)

(assert (=> d!105653 (=> (not res!565755) (not e!463387))))

(assert (=> d!105653 (= res!565755 (not (contains!4184 lt!376993 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105653 (= lt!376993 e!463385)))

(declare-fun c!90143 () Bool)

(assert (=> d!105653 (= c!90143 (bvsge #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> d!105653 (validMask!0 mask!1312)))

(assert (=> d!105653 (= (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376993)))

(declare-fun b!831034 () Bool)

(assert (=> b!831034 (= e!463389 call!36267)))

(declare-fun b!831035 () Bool)

(assert (=> b!831035 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (=> b!831035 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22741 _values!788)))))

(assert (=> b!831035 (= e!463391 (= (apply!371 lt!376993 (select (arr!22320 _keys!976) #b00000000000000000000000000000000)) (get!11817 (select (arr!22321 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831036 () Bool)

(declare-fun e!463390 () Bool)

(assert (=> b!831036 (= e!463388 e!463390)))

(declare-fun c!90141 () Bool)

(assert (=> b!831036 (= c!90141 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(declare-fun b!831037 () Bool)

(assert (=> b!831037 (= e!463390 (= lt!376993 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!831038 () Bool)

(assert (=> b!831038 (= e!463390 (isEmpty!659 lt!376993))))

(declare-fun bm!36264 () Bool)

(assert (=> bm!36264 (= call!36267 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!831039 () Bool)

(assert (=> b!831039 (= e!463387 e!463388)))

(declare-fun c!90142 () Bool)

(assert (=> b!831039 (= c!90142 e!463386)))

(declare-fun res!565756 () Bool)

(assert (=> b!831039 (=> (not res!565756) (not e!463386))))

(assert (=> b!831039 (= res!565756 (bvslt #b00000000000000000000000000000000 (size!22740 _keys!976)))))

(assert (= (and d!105653 c!90143) b!831030))

(assert (= (and d!105653 (not c!90143)) b!831029))

(assert (= (and b!831029 c!90140) b!831028))

(assert (= (and b!831029 (not c!90140)) b!831034))

(assert (= (or b!831028 b!831034) bm!36264))

(assert (= (and d!105653 res!565755) b!831032))

(assert (= (and b!831032 res!565754) b!831039))

(assert (= (and b!831039 res!565756) b!831033))

(assert (= (and b!831039 c!90142) b!831031))

(assert (= (and b!831039 (not c!90142)) b!831036))

(assert (= (and b!831031 res!565753) b!831035))

(assert (= (and b!831036 c!90141) b!831037))

(assert (= (and b!831036 (not c!90141)) b!831038))

(declare-fun b_lambda!11345 () Bool)

(assert (=> (not b_lambda!11345) (not b!831028)))

(assert (=> b!831028 t!22202))

(declare-fun b_and!22531 () Bool)

(assert (= b_and!22529 (and (=> t!22202 result!8001) b_and!22531)))

(declare-fun b_lambda!11347 () Bool)

(assert (=> (not b_lambda!11347) (not b!831035)))

(assert (=> b!831035 t!22202))

(declare-fun b_and!22533 () Bool)

(assert (= b_and!22531 (and (=> t!22202 result!8001) b_and!22533)))

(assert (=> b!831031 m!774303))

(assert (=> b!831031 m!774303))

(declare-fun m!774487 () Bool)

(assert (=> b!831031 m!774487))

(assert (=> b!831029 m!774303))

(assert (=> b!831029 m!774303))

(assert (=> b!831029 m!774309))

(declare-fun m!774489 () Bool)

(assert (=> bm!36264 m!774489))

(assert (=> b!831037 m!774489))

(assert (=> b!831035 m!774303))

(assert (=> b!831035 m!774311))

(assert (=> b!831035 m!774313))

(assert (=> b!831035 m!774315))

(assert (=> b!831035 m!774313))

(assert (=> b!831035 m!774303))

(declare-fun m!774491 () Bool)

(assert (=> b!831035 m!774491))

(assert (=> b!831035 m!774311))

(assert (=> b!831033 m!774303))

(assert (=> b!831033 m!774303))

(assert (=> b!831033 m!774309))

(declare-fun m!774493 () Bool)

(assert (=> b!831032 m!774493))

(assert (=> b!831028 m!774303))

(declare-fun m!774495 () Bool)

(assert (=> b!831028 m!774495))

(declare-fun m!774497 () Bool)

(assert (=> b!831028 m!774497))

(assert (=> b!831028 m!774313))

(declare-fun m!774499 () Bool)

(assert (=> b!831028 m!774499))

(assert (=> b!831028 m!774311))

(assert (=> b!831028 m!774311))

(assert (=> b!831028 m!774313))

(assert (=> b!831028 m!774315))

(assert (=> b!831028 m!774497))

(declare-fun m!774501 () Bool)

(assert (=> b!831028 m!774501))

(declare-fun m!774503 () Bool)

(assert (=> b!831038 m!774503))

(declare-fun m!774505 () Bool)

(assert (=> d!105653 m!774505))

(assert (=> d!105653 m!774215))

(assert (=> b!830805 d!105653))

(declare-fun condMapEmpty!24457 () Bool)

(declare-fun mapDefault!24457 () ValueCell!7184)

(assert (=> mapNonEmpty!24448 (= condMapEmpty!24457 (= mapRest!24448 ((as const (Array (_ BitVec 32) ValueCell!7184)) mapDefault!24457)))))

(declare-fun e!463397 () Bool)

(declare-fun mapRes!24457 () Bool)

(assert (=> mapNonEmpty!24448 (= tp!47250 (and e!463397 mapRes!24457))))

(declare-fun mapIsEmpty!24457 () Bool)

(assert (=> mapIsEmpty!24457 mapRes!24457))

(declare-fun b!831046 () Bool)

(declare-fun e!463396 () Bool)

(assert (=> b!831046 (= e!463396 tp_is_empty!15199)))

(declare-fun b!831047 () Bool)

(assert (=> b!831047 (= e!463397 tp_is_empty!15199)))

(declare-fun mapNonEmpty!24457 () Bool)

(declare-fun tp!47266 () Bool)

(assert (=> mapNonEmpty!24457 (= mapRes!24457 (and tp!47266 e!463396))))

(declare-fun mapKey!24457 () (_ BitVec 32))

(declare-fun mapRest!24457 () (Array (_ BitVec 32) ValueCell!7184))

(declare-fun mapValue!24457 () ValueCell!7184)

(assert (=> mapNonEmpty!24457 (= mapRest!24448 (store mapRest!24457 mapKey!24457 mapValue!24457))))

(assert (= (and mapNonEmpty!24448 condMapEmpty!24457) mapIsEmpty!24457))

(assert (= (and mapNonEmpty!24448 (not condMapEmpty!24457)) mapNonEmpty!24457))

(assert (= (and mapNonEmpty!24457 ((_ is ValueCellFull!7184) mapValue!24457)) b!831046))

(assert (= (and mapNonEmpty!24448 ((_ is ValueCellFull!7184) mapDefault!24457)) b!831047))

(declare-fun m!774507 () Bool)

(assert (=> mapNonEmpty!24457 m!774507))

(declare-fun b_lambda!11349 () Bool)

(assert (= b_lambda!11337 (or (and start!71628 b_free!13489) b_lambda!11349)))

(declare-fun b_lambda!11351 () Bool)

(assert (= b_lambda!11339 (or (and start!71628 b_free!13489) b_lambda!11351)))

(declare-fun b_lambda!11353 () Bool)

(assert (= b_lambda!11341 (or (and start!71628 b_free!13489) b_lambda!11353)))

(declare-fun b_lambda!11355 () Bool)

(assert (= b_lambda!11343 (or (and start!71628 b_free!13489) b_lambda!11355)))

(declare-fun b_lambda!11357 () Bool)

(assert (= b_lambda!11345 (or (and start!71628 b_free!13489) b_lambda!11357)))

(declare-fun b_lambda!11359 () Bool)

(assert (= b_lambda!11347 (or (and start!71628 b_free!13489) b_lambda!11359)))

(check-sat (not bm!36264) (not b!830942) (not b!831021) (not b!830938) (not bm!36260) (not b_lambda!11357) (not b!831037) (not mapNonEmpty!24457) (not b!830965) tp_is_empty!15199 (not b!830966) (not b_lambda!11353) (not b!831031) (not b!831025) (not bm!36259) (not d!105635) (not b!831016) (not b!830880) (not b!830975) (not d!105645) (not b!830932) (not b!830951) (not d!105647) (not b!830954) (not bm!36253) (not b!831035) (not b!830970) (not b!830879) (not b!831026) (not d!105649) (not b!830979) (not b!830952) (not b_lambda!11355) (not d!105639) (not b!831028) (not b!830991) (not b!831023) (not b!830989) (not d!105643) (not bm!36256) (not bm!36229) (not b!831017) (not d!105653) (not bm!36246) (not b!830990) (not b!831038) (not b!830927) (not b_lambda!11351) (not b_next!13489) (not b_lambda!11359) (not b!830937) (not b!831032) (not bm!36245) (not b!830925) (not b!830980) (not bm!36249) (not b!831020) (not bm!36263) (not d!105637) (not b!830988) (not b_lambda!11349) (not bm!36255) (not b!830968) (not b!830881) (not b!831019) (not b!831029) (not b!830926) (not b!830936) b_and!22533 (not bm!36250) (not b!830981) (not d!105651) (not b!830985) (not b!831033) (not b!830969) (not b!830953))
(check-sat b_and!22533 (not b_next!13489))
