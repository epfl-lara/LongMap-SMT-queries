; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!750 () Bool)

(assert start!750)

(declare-fun b_free!163 () Bool)

(declare-fun b_next!163 () Bool)

(assert (=> start!750 (= b_free!163 (not b_next!163))))

(declare-fun tp!715 () Bool)

(declare-fun b_and!307 () Bool)

(assert (=> start!750 (= tp!715 b_and!307)))

(declare-fun mapIsEmpty!329 () Bool)

(declare-fun mapRes!329 () Bool)

(assert (=> mapIsEmpty!329 mapRes!329))

(declare-fun b!5288 () Bool)

(declare-fun res!6166 () Bool)

(declare-fun e!2853 () Bool)

(assert (=> b!5288 (=> (not res!6166) (not e!2853))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!499 0))(
  ( (V!500 (val!126 Int)) )
))
(declare-datatypes ((ValueCell!104 0))(
  ( (ValueCellFull!104 (v!1216 V!499)) (EmptyCell!104) )
))
(declare-datatypes ((array!409 0))(
  ( (array!410 (arr!194 (Array (_ BitVec 32) ValueCell!104)) (size!256 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!409)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!499)

(declare-fun minValue!1434 () V!499)

(declare-datatypes ((array!411 0))(
  ( (array!412 (arr!195 (Array (_ BitVec 32) (_ BitVec 64))) (size!257 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!411)

(declare-datatypes ((tuple2!118 0))(
  ( (tuple2!119 (_1!59 (_ BitVec 64)) (_2!59 V!499)) )
))
(declare-datatypes ((List!127 0))(
  ( (Nil!124) (Cons!123 (h!689 tuple2!118) (t!2260 List!127)) )
))
(declare-datatypes ((ListLongMap!123 0))(
  ( (ListLongMap!124 (toList!77 List!127)) )
))
(declare-fun contains!50 (ListLongMap!123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!36 (array!411 array!409 (_ BitVec 32) (_ BitVec 32) V!499 V!499 (_ BitVec 32) Int) ListLongMap!123)

(assert (=> b!5288 (= res!6166 (contains!50 (getCurrentListMap!36 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!5289 () Bool)

(declare-fun e!2850 () Bool)

(assert (=> b!5289 (= e!2850 (and (bvslt #b00000000000000000000000000000000 (size!257 _keys!1806)) (bvslt (size!257 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun b!5290 () Bool)

(assert (=> b!5290 (= e!2853 (not e!2850))))

(declare-fun res!6161 () Bool)

(assert (=> b!5290 (=> res!6161 e!2850)))

(declare-fun arrayContainsKey!0 (array!411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5290 (= res!6161 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!2849 () Bool)

(assert (=> b!5290 e!2849))

(declare-fun c!347 () Bool)

(assert (=> b!5290 (= c!347 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!65 0))(
  ( (Unit!66) )
))
(declare-fun lt!915 () Unit!65)

(declare-fun lemmaKeyInListMapIsInArray!19 (array!411 array!409 (_ BitVec 32) (_ BitVec 32) V!499 V!499 (_ BitVec 64) Int) Unit!65)

(assert (=> b!5290 (= lt!915 (lemmaKeyInListMapIsInArray!19 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!5291 () Bool)

(declare-fun e!2851 () Bool)

(declare-fun tp_is_empty!241 () Bool)

(assert (=> b!5291 (= e!2851 tp_is_empty!241)))

(declare-fun b!5293 () Bool)

(declare-fun e!2852 () Bool)

(assert (=> b!5293 (= e!2852 tp_is_empty!241)))

(declare-fun b!5294 () Bool)

(declare-fun e!2855 () Bool)

(assert (=> b!5294 (= e!2855 (and e!2852 mapRes!329))))

(declare-fun condMapEmpty!329 () Bool)

(declare-fun mapDefault!329 () ValueCell!104)

(assert (=> b!5294 (= condMapEmpty!329 (= (arr!194 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!104)) mapDefault!329)))))

(declare-fun b!5295 () Bool)

(declare-fun res!6164 () Bool)

(assert (=> b!5295 (=> (not res!6164) (not e!2853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5295 (= res!6164 (validKeyInArray!0 k0!1278))))

(declare-fun b!5296 () Bool)

(declare-fun res!6160 () Bool)

(assert (=> b!5296 (=> (not res!6160) (not e!2853))))

(assert (=> b!5296 (= res!6160 (and (= (size!256 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!257 _keys!1806) (size!256 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5297 () Bool)

(declare-fun res!6163 () Bool)

(assert (=> b!5297 (=> (not res!6163) (not e!2853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!411 (_ BitVec 32)) Bool)

(assert (=> b!5297 (= res!6163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!5298 () Bool)

(declare-fun res!6162 () Bool)

(assert (=> b!5298 (=> (not res!6162) (not e!2853))))

(declare-datatypes ((List!128 0))(
  ( (Nil!125) (Cons!124 (h!690 (_ BitVec 64)) (t!2261 List!128)) )
))
(declare-fun arrayNoDuplicates!0 (array!411 (_ BitVec 32) List!128) Bool)

(assert (=> b!5298 (= res!6162 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!125))))

(declare-fun b!5299 () Bool)

(assert (=> b!5299 (= e!2849 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!329 () Bool)

(declare-fun tp!716 () Bool)

(assert (=> mapNonEmpty!329 (= mapRes!329 (and tp!716 e!2851))))

(declare-fun mapRest!329 () (Array (_ BitVec 32) ValueCell!104))

(declare-fun mapValue!329 () ValueCell!104)

(declare-fun mapKey!329 () (_ BitVec 32))

(assert (=> mapNonEmpty!329 (= (arr!194 _values!1492) (store mapRest!329 mapKey!329 mapValue!329))))

(declare-fun res!6165 () Bool)

(assert (=> start!750 (=> (not res!6165) (not e!2853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!750 (= res!6165 (validMask!0 mask!2250))))

(assert (=> start!750 e!2853))

(assert (=> start!750 tp!715))

(assert (=> start!750 true))

(declare-fun array_inv!137 (array!409) Bool)

(assert (=> start!750 (and (array_inv!137 _values!1492) e!2855)))

(assert (=> start!750 tp_is_empty!241))

(declare-fun array_inv!138 (array!411) Bool)

(assert (=> start!750 (array_inv!138 _keys!1806)))

(declare-fun b!5292 () Bool)

(assert (=> b!5292 (= e!2849 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!750 res!6165) b!5296))

(assert (= (and b!5296 res!6160) b!5297))

(assert (= (and b!5297 res!6163) b!5298))

(assert (= (and b!5298 res!6162) b!5288))

(assert (= (and b!5288 res!6166) b!5295))

(assert (= (and b!5295 res!6164) b!5290))

(assert (= (and b!5290 c!347) b!5299))

(assert (= (and b!5290 (not c!347)) b!5292))

(assert (= (and b!5290 (not res!6161)) b!5289))

(assert (= (and b!5294 condMapEmpty!329) mapIsEmpty!329))

(assert (= (and b!5294 (not condMapEmpty!329)) mapNonEmpty!329))

(get-info :version)

(assert (= (and mapNonEmpty!329 ((_ is ValueCellFull!104) mapValue!329)) b!5291))

(assert (= (and b!5294 ((_ is ValueCellFull!104) mapDefault!329)) b!5293))

(assert (= start!750 b!5294))

(declare-fun m!2921 () Bool)

(assert (=> b!5298 m!2921))

(declare-fun m!2923 () Bool)

(assert (=> start!750 m!2923))

(declare-fun m!2925 () Bool)

(assert (=> start!750 m!2925))

(declare-fun m!2927 () Bool)

(assert (=> start!750 m!2927))

(declare-fun m!2929 () Bool)

(assert (=> mapNonEmpty!329 m!2929))

(declare-fun m!2931 () Bool)

(assert (=> b!5299 m!2931))

(declare-fun m!2933 () Bool)

(assert (=> b!5295 m!2933))

(assert (=> b!5290 m!2931))

(declare-fun m!2935 () Bool)

(assert (=> b!5290 m!2935))

(declare-fun m!2937 () Bool)

(assert (=> b!5297 m!2937))

(declare-fun m!2939 () Bool)

(assert (=> b!5288 m!2939))

(assert (=> b!5288 m!2939))

(declare-fun m!2941 () Bool)

(assert (=> b!5288 m!2941))

(check-sat b_and!307 (not mapNonEmpty!329) (not b!5298) (not start!750) (not b_next!163) (not b!5288) (not b!5290) (not b!5299) (not b!5295) tp_is_empty!241 (not b!5297))
(check-sat b_and!307 (not b_next!163))
(get-model)

(declare-fun d!741 () Bool)

(assert (=> d!741 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!5295 d!741))

(declare-fun d!743 () Bool)

(declare-fun res!6213 () Bool)

(declare-fun e!2902 () Bool)

(assert (=> d!743 (=> res!6213 e!2902)))

(assert (=> d!743 (= res!6213 (= (select (arr!195 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!743 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!2902)))

(declare-fun b!5376 () Bool)

(declare-fun e!2903 () Bool)

(assert (=> b!5376 (= e!2902 e!2903)))

(declare-fun res!6214 () Bool)

(assert (=> b!5376 (=> (not res!6214) (not e!2903))))

(assert (=> b!5376 (= res!6214 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!257 _keys!1806)))))

(declare-fun b!5377 () Bool)

(assert (=> b!5377 (= e!2903 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!743 (not res!6213)) b!5376))

(assert (= (and b!5376 res!6214) b!5377))

(declare-fun m!2987 () Bool)

(assert (=> d!743 m!2987))

(declare-fun m!2989 () Bool)

(assert (=> b!5377 m!2989))

(assert (=> b!5290 d!743))

(declare-fun d!745 () Bool)

(declare-fun e!2906 () Bool)

(assert (=> d!745 e!2906))

(declare-fun c!356 () Bool)

(assert (=> d!745 (= c!356 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!924 () Unit!65)

(declare-fun choose!138 (array!411 array!409 (_ BitVec 32) (_ BitVec 32) V!499 V!499 (_ BitVec 64) Int) Unit!65)

(assert (=> d!745 (= lt!924 (choose!138 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!745 (validMask!0 mask!2250)))

(assert (=> d!745 (= (lemmaKeyInListMapIsInArray!19 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!924)))

(declare-fun b!5382 () Bool)

(assert (=> b!5382 (= e!2906 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5383 () Bool)

(assert (=> b!5383 (= e!2906 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!745 c!356) b!5382))

(assert (= (and d!745 (not c!356)) b!5383))

(declare-fun m!2991 () Bool)

(assert (=> d!745 m!2991))

(assert (=> d!745 m!2923))

(assert (=> b!5382 m!2931))

(assert (=> b!5290 d!745))

(assert (=> b!5299 d!743))

(declare-fun d!747 () Bool)

(declare-fun e!2911 () Bool)

(assert (=> d!747 e!2911))

(declare-fun res!6217 () Bool)

(assert (=> d!747 (=> res!6217 e!2911)))

(declare-fun lt!933 () Bool)

(assert (=> d!747 (= res!6217 (not lt!933))))

(declare-fun lt!934 () Bool)

(assert (=> d!747 (= lt!933 lt!934)))

(declare-fun lt!936 () Unit!65)

(declare-fun e!2912 () Unit!65)

(assert (=> d!747 (= lt!936 e!2912)))

(declare-fun c!359 () Bool)

(assert (=> d!747 (= c!359 lt!934)))

(declare-fun containsKey!4 (List!127 (_ BitVec 64)) Bool)

(assert (=> d!747 (= lt!934 (containsKey!4 (toList!77 (getCurrentListMap!36 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!747 (= (contains!50 (getCurrentListMap!36 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!933)))

(declare-fun b!5390 () Bool)

(declare-fun lt!935 () Unit!65)

(assert (=> b!5390 (= e!2912 lt!935)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!4 (List!127 (_ BitVec 64)) Unit!65)

(assert (=> b!5390 (= lt!935 (lemmaContainsKeyImpliesGetValueByKeyDefined!4 (toList!77 (getCurrentListMap!36 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!16 0))(
  ( (Some!15 (v!1219 V!499)) (None!14) )
))
(declare-fun isDefined!5 (Option!16) Bool)

(declare-fun getValueByKey!10 (List!127 (_ BitVec 64)) Option!16)

(assert (=> b!5390 (isDefined!5 (getValueByKey!10 (toList!77 (getCurrentListMap!36 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!5391 () Bool)

(declare-fun Unit!69 () Unit!65)

(assert (=> b!5391 (= e!2912 Unit!69)))

(declare-fun b!5392 () Bool)

(assert (=> b!5392 (= e!2911 (isDefined!5 (getValueByKey!10 (toList!77 (getCurrentListMap!36 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!747 c!359) b!5390))

(assert (= (and d!747 (not c!359)) b!5391))

(assert (= (and d!747 (not res!6217)) b!5392))

(declare-fun m!2993 () Bool)

(assert (=> d!747 m!2993))

(declare-fun m!2995 () Bool)

(assert (=> b!5390 m!2995))

(declare-fun m!2997 () Bool)

(assert (=> b!5390 m!2997))

(assert (=> b!5390 m!2997))

(declare-fun m!2999 () Bool)

(assert (=> b!5390 m!2999))

(assert (=> b!5392 m!2997))

(assert (=> b!5392 m!2997))

(assert (=> b!5392 m!2999))

(assert (=> b!5288 d!747))

(declare-fun b!5435 () Bool)

(declare-fun e!2943 () Bool)

(declare-fun e!2939 () Bool)

(assert (=> b!5435 (= e!2943 e!2939)))

(declare-fun res!6239 () Bool)

(declare-fun call!145 () Bool)

(assert (=> b!5435 (= res!6239 call!145)))

(assert (=> b!5435 (=> (not res!6239) (not e!2939))))

(declare-fun b!5436 () Bool)

(declare-fun e!2948 () ListLongMap!123)

(declare-fun call!144 () ListLongMap!123)

(declare-fun +!7 (ListLongMap!123 tuple2!118) ListLongMap!123)

(assert (=> b!5436 (= e!2948 (+!7 call!144 (tuple2!119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!5437 () Bool)

(declare-fun e!2951 () Bool)

(declare-fun e!2945 () Bool)

(assert (=> b!5437 (= e!2951 e!2945)))

(declare-fun res!6243 () Bool)

(declare-fun call!143 () Bool)

(assert (=> b!5437 (= res!6243 call!143)))

(assert (=> b!5437 (=> (not res!6243) (not e!2945))))

(declare-fun call!149 () ListLongMap!123)

(declare-fun bm!140 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4 (array!411 array!409 (_ BitVec 32) (_ BitVec 32) V!499 V!499 (_ BitVec 32) Int) ListLongMap!123)

(assert (=> bm!140 (= call!149 (getCurrentListMapNoExtraKeys!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!5438 () Bool)

(declare-fun e!2944 () ListLongMap!123)

(declare-fun call!148 () ListLongMap!123)

(assert (=> b!5438 (= e!2944 call!148)))

(declare-fun b!5439 () Bool)

(declare-fun e!2947 () Bool)

(declare-fun e!2946 () Bool)

(assert (=> b!5439 (= e!2947 e!2946)))

(declare-fun res!6244 () Bool)

(assert (=> b!5439 (=> (not res!6244) (not e!2946))))

(declare-fun lt!1000 () ListLongMap!123)

(assert (=> b!5439 (= res!6244 (contains!50 lt!1000 (select (arr!195 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!5439 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!257 _keys!1806)))))

(declare-fun b!5440 () Bool)

(declare-fun e!2950 () ListLongMap!123)

(assert (=> b!5440 (= e!2948 e!2950)))

(declare-fun c!373 () Bool)

(assert (=> b!5440 (= c!373 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!749 () Bool)

(declare-fun e!2949 () Bool)

(assert (=> d!749 e!2949))

(declare-fun res!6237 () Bool)

(assert (=> d!749 (=> (not res!6237) (not e!2949))))

(assert (=> d!749 (= res!6237 (or (bvsge #b00000000000000000000000000000000 (size!257 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!257 _keys!1806)))))))

(declare-fun lt!988 () ListLongMap!123)

(assert (=> d!749 (= lt!1000 lt!988)))

(declare-fun lt!991 () Unit!65)

(declare-fun e!2940 () Unit!65)

(assert (=> d!749 (= lt!991 e!2940)))

(declare-fun c!377 () Bool)

(declare-fun e!2941 () Bool)

(assert (=> d!749 (= c!377 e!2941)))

(declare-fun res!6242 () Bool)

(assert (=> d!749 (=> (not res!6242) (not e!2941))))

(assert (=> d!749 (= res!6242 (bvslt #b00000000000000000000000000000000 (size!257 _keys!1806)))))

(assert (=> d!749 (= lt!988 e!2948)))

(declare-fun c!375 () Bool)

(assert (=> d!749 (= c!375 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!749 (validMask!0 mask!2250)))

(assert (=> d!749 (= (getCurrentListMap!36 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!1000)))

(declare-fun b!5441 () Bool)

(assert (=> b!5441 (= e!2949 e!2951)))

(declare-fun c!376 () Bool)

(assert (=> b!5441 (= c!376 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!5442 () Bool)

(declare-fun res!6240 () Bool)

(assert (=> b!5442 (=> (not res!6240) (not e!2949))))

(assert (=> b!5442 (= res!6240 e!2947)))

(declare-fun res!6241 () Bool)

(assert (=> b!5442 (=> res!6241 e!2947)))

(declare-fun e!2942 () Bool)

(assert (=> b!5442 (= res!6241 (not e!2942))))

(declare-fun res!6236 () Bool)

(assert (=> b!5442 (=> (not res!6236) (not e!2942))))

(assert (=> b!5442 (= res!6236 (bvslt #b00000000000000000000000000000000 (size!257 _keys!1806)))))

(declare-fun b!5443 () Bool)

(declare-fun call!146 () ListLongMap!123)

(assert (=> b!5443 (= e!2944 call!146)))

(declare-fun b!5444 () Bool)

(assert (=> b!5444 (= e!2942 (validKeyInArray!0 (select (arr!195 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5445 () Bool)

(assert (=> b!5445 (= e!2951 (not call!143))))

(declare-fun b!5446 () Bool)

(declare-fun Unit!70 () Unit!65)

(assert (=> b!5446 (= e!2940 Unit!70)))

(declare-fun bm!141 () Bool)

(declare-fun call!147 () ListLongMap!123)

(assert (=> bm!141 (= call!147 call!149)))

(declare-fun b!5447 () Bool)

(declare-fun res!6238 () Bool)

(assert (=> b!5447 (=> (not res!6238) (not e!2949))))

(assert (=> b!5447 (= res!6238 e!2943)))

(declare-fun c!372 () Bool)

(assert (=> b!5447 (= c!372 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!5448 () Bool)

(assert (=> b!5448 (= e!2950 call!148)))

(declare-fun bm!142 () Bool)

(assert (=> bm!142 (= call!146 call!147)))

(declare-fun b!5449 () Bool)

(assert (=> b!5449 (= e!2943 (not call!145))))

(declare-fun b!5450 () Bool)

(declare-fun apply!20 (ListLongMap!123 (_ BitVec 64)) V!499)

(assert (=> b!5450 (= e!2939 (= (apply!20 lt!1000 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun bm!143 () Bool)

(assert (=> bm!143 (= call!144 (+!7 (ite c!375 call!149 (ite c!373 call!147 call!146)) (ite (or c!375 c!373) (tuple2!119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!5451 () Bool)

(assert (=> b!5451 (= e!2941 (validKeyInArray!0 (select (arr!195 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5452 () Bool)

(declare-fun c!374 () Bool)

(assert (=> b!5452 (= c!374 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!5452 (= e!2950 e!2944)))

(declare-fun b!5453 () Bool)

(assert (=> b!5453 (= e!2945 (= (apply!20 lt!1000 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun b!5454 () Bool)

(declare-fun lt!985 () Unit!65)

(assert (=> b!5454 (= e!2940 lt!985)))

(declare-fun lt!981 () ListLongMap!123)

(assert (=> b!5454 (= lt!981 (getCurrentListMapNoExtraKeys!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!992 () (_ BitVec 64))

(assert (=> b!5454 (= lt!992 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!984 () (_ BitVec 64))

(assert (=> b!5454 (= lt!984 (select (arr!195 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!993 () Unit!65)

(declare-fun addStillContains!5 (ListLongMap!123 (_ BitVec 64) V!499 (_ BitVec 64)) Unit!65)

(assert (=> b!5454 (= lt!993 (addStillContains!5 lt!981 lt!992 zeroValue!1434 lt!984))))

(assert (=> b!5454 (contains!50 (+!7 lt!981 (tuple2!119 lt!992 zeroValue!1434)) lt!984)))

(declare-fun lt!986 () Unit!65)

(assert (=> b!5454 (= lt!986 lt!993)))

(declare-fun lt!995 () ListLongMap!123)

(assert (=> b!5454 (= lt!995 (getCurrentListMapNoExtraKeys!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!983 () (_ BitVec 64))

(assert (=> b!5454 (= lt!983 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1002 () (_ BitVec 64))

(assert (=> b!5454 (= lt!1002 (select (arr!195 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!982 () Unit!65)

(declare-fun addApplyDifferent!5 (ListLongMap!123 (_ BitVec 64) V!499 (_ BitVec 64)) Unit!65)

(assert (=> b!5454 (= lt!982 (addApplyDifferent!5 lt!995 lt!983 minValue!1434 lt!1002))))

(assert (=> b!5454 (= (apply!20 (+!7 lt!995 (tuple2!119 lt!983 minValue!1434)) lt!1002) (apply!20 lt!995 lt!1002))))

(declare-fun lt!990 () Unit!65)

(assert (=> b!5454 (= lt!990 lt!982)))

(declare-fun lt!998 () ListLongMap!123)

(assert (=> b!5454 (= lt!998 (getCurrentListMapNoExtraKeys!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!994 () (_ BitVec 64))

(assert (=> b!5454 (= lt!994 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!999 () (_ BitVec 64))

(assert (=> b!5454 (= lt!999 (select (arr!195 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!996 () Unit!65)

(assert (=> b!5454 (= lt!996 (addApplyDifferent!5 lt!998 lt!994 zeroValue!1434 lt!999))))

(assert (=> b!5454 (= (apply!20 (+!7 lt!998 (tuple2!119 lt!994 zeroValue!1434)) lt!999) (apply!20 lt!998 lt!999))))

(declare-fun lt!989 () Unit!65)

(assert (=> b!5454 (= lt!989 lt!996)))

(declare-fun lt!987 () ListLongMap!123)

(assert (=> b!5454 (= lt!987 (getCurrentListMapNoExtraKeys!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1001 () (_ BitVec 64))

(assert (=> b!5454 (= lt!1001 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!997 () (_ BitVec 64))

(assert (=> b!5454 (= lt!997 (select (arr!195 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!5454 (= lt!985 (addApplyDifferent!5 lt!987 lt!1001 minValue!1434 lt!997))))

(assert (=> b!5454 (= (apply!20 (+!7 lt!987 (tuple2!119 lt!1001 minValue!1434)) lt!997) (apply!20 lt!987 lt!997))))

(declare-fun b!5455 () Bool)

(declare-fun get!102 (ValueCell!104 V!499) V!499)

(declare-fun dynLambda!42 (Int (_ BitVec 64)) V!499)

(assert (=> b!5455 (= e!2946 (= (apply!20 lt!1000 (select (arr!195 _keys!1806) #b00000000000000000000000000000000)) (get!102 (select (arr!194 _values!1492) #b00000000000000000000000000000000) (dynLambda!42 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!5455 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!256 _values!1492)))))

(assert (=> b!5455 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!257 _keys!1806)))))

(declare-fun bm!144 () Bool)

(assert (=> bm!144 (= call!145 (contains!50 lt!1000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!145 () Bool)

(assert (=> bm!145 (= call!143 (contains!50 lt!1000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!146 () Bool)

(assert (=> bm!146 (= call!148 call!144)))

(assert (= (and d!749 c!375) b!5436))

(assert (= (and d!749 (not c!375)) b!5440))

(assert (= (and b!5440 c!373) b!5448))

(assert (= (and b!5440 (not c!373)) b!5452))

(assert (= (and b!5452 c!374) b!5438))

(assert (= (and b!5452 (not c!374)) b!5443))

(assert (= (or b!5438 b!5443) bm!142))

(assert (= (or b!5448 bm!142) bm!141))

(assert (= (or b!5448 b!5438) bm!146))

(assert (= (or b!5436 bm!141) bm!140))

(assert (= (or b!5436 bm!146) bm!143))

(assert (= (and d!749 res!6242) b!5451))

(assert (= (and d!749 c!377) b!5454))

(assert (= (and d!749 (not c!377)) b!5446))

(assert (= (and d!749 res!6237) b!5442))

(assert (= (and b!5442 res!6236) b!5444))

(assert (= (and b!5442 (not res!6241)) b!5439))

(assert (= (and b!5439 res!6244) b!5455))

(assert (= (and b!5442 res!6240) b!5447))

(assert (= (and b!5447 c!372) b!5435))

(assert (= (and b!5447 (not c!372)) b!5449))

(assert (= (and b!5435 res!6239) b!5450))

(assert (= (or b!5435 b!5449) bm!144))

(assert (= (and b!5447 res!6238) b!5441))

(assert (= (and b!5441 c!376) b!5437))

(assert (= (and b!5441 (not c!376)) b!5445))

(assert (= (and b!5437 res!6243) b!5453))

(assert (= (or b!5437 b!5445) bm!145))

(declare-fun b_lambda!331 () Bool)

(assert (=> (not b_lambda!331) (not b!5455)))

(declare-fun t!2265 () Bool)

(declare-fun tb!133 () Bool)

(assert (=> (and start!750 (= defaultEntry!1495 defaultEntry!1495) t!2265) tb!133))

(declare-fun result!201 () Bool)

(assert (=> tb!133 (= result!201 tp_is_empty!241)))

(assert (=> b!5455 t!2265))

(declare-fun b_and!313 () Bool)

(assert (= b_and!307 (and (=> t!2265 result!201) b_and!313)))

(declare-fun m!3001 () Bool)

(assert (=> bm!143 m!3001))

(assert (=> b!5451 m!2987))

(assert (=> b!5451 m!2987))

(declare-fun m!3003 () Bool)

(assert (=> b!5451 m!3003))

(declare-fun m!3005 () Bool)

(assert (=> bm!140 m!3005))

(declare-fun m!3007 () Bool)

(assert (=> b!5453 m!3007))

(declare-fun m!3009 () Bool)

(assert (=> b!5436 m!3009))

(assert (=> b!5439 m!2987))

(assert (=> b!5439 m!2987))

(declare-fun m!3011 () Bool)

(assert (=> b!5439 m!3011))

(assert (=> d!749 m!2923))

(declare-fun m!3013 () Bool)

(assert (=> bm!144 m!3013))

(assert (=> b!5454 m!3005))

(declare-fun m!3015 () Bool)

(assert (=> b!5454 m!3015))

(declare-fun m!3017 () Bool)

(assert (=> b!5454 m!3017))

(declare-fun m!3019 () Bool)

(assert (=> b!5454 m!3019))

(declare-fun m!3021 () Bool)

(assert (=> b!5454 m!3021))

(declare-fun m!3023 () Bool)

(assert (=> b!5454 m!3023))

(declare-fun m!3025 () Bool)

(assert (=> b!5454 m!3025))

(declare-fun m!3027 () Bool)

(assert (=> b!5454 m!3027))

(assert (=> b!5454 m!3023))

(declare-fun m!3029 () Bool)

(assert (=> b!5454 m!3029))

(declare-fun m!3031 () Bool)

(assert (=> b!5454 m!3031))

(assert (=> b!5454 m!3015))

(declare-fun m!3033 () Bool)

(assert (=> b!5454 m!3033))

(declare-fun m!3035 () Bool)

(assert (=> b!5454 m!3035))

(assert (=> b!5454 m!3029))

(declare-fun m!3037 () Bool)

(assert (=> b!5454 m!3037))

(assert (=> b!5454 m!3033))

(declare-fun m!3039 () Bool)

(assert (=> b!5454 m!3039))

(declare-fun m!3041 () Bool)

(assert (=> b!5454 m!3041))

(declare-fun m!3043 () Bool)

(assert (=> b!5454 m!3043))

(assert (=> b!5454 m!2987))

(declare-fun m!3045 () Bool)

(assert (=> b!5450 m!3045))

(declare-fun m!3047 () Bool)

(assert (=> bm!145 m!3047))

(declare-fun m!3049 () Bool)

(assert (=> b!5455 m!3049))

(declare-fun m!3051 () Bool)

(assert (=> b!5455 m!3051))

(assert (=> b!5455 m!3049))

(declare-fun m!3053 () Bool)

(assert (=> b!5455 m!3053))

(assert (=> b!5455 m!2987))

(assert (=> b!5455 m!2987))

(declare-fun m!3055 () Bool)

(assert (=> b!5455 m!3055))

(assert (=> b!5455 m!3051))

(assert (=> b!5444 m!2987))

(assert (=> b!5444 m!2987))

(assert (=> b!5444 m!3003))

(assert (=> b!5288 d!749))

(declare-fun b!5468 () Bool)

(declare-fun e!2962 () Bool)

(declare-fun e!2961 () Bool)

(assert (=> b!5468 (= e!2962 e!2961)))

(declare-fun c!380 () Bool)

(assert (=> b!5468 (= c!380 (validKeyInArray!0 (select (arr!195 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5469 () Bool)

(declare-fun e!2963 () Bool)

(declare-fun contains!52 (List!128 (_ BitVec 64)) Bool)

(assert (=> b!5469 (= e!2963 (contains!52 Nil!125 (select (arr!195 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5470 () Bool)

(declare-fun call!152 () Bool)

(assert (=> b!5470 (= e!2961 call!152)))

(declare-fun b!5471 () Bool)

(declare-fun e!2960 () Bool)

(assert (=> b!5471 (= e!2960 e!2962)))

(declare-fun res!6252 () Bool)

(assert (=> b!5471 (=> (not res!6252) (not e!2962))))

(assert (=> b!5471 (= res!6252 (not e!2963))))

(declare-fun res!6253 () Bool)

(assert (=> b!5471 (=> (not res!6253) (not e!2963))))

(assert (=> b!5471 (= res!6253 (validKeyInArray!0 (select (arr!195 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5472 () Bool)

(assert (=> b!5472 (= e!2961 call!152)))

(declare-fun bm!149 () Bool)

(assert (=> bm!149 (= call!152 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!380 (Cons!124 (select (arr!195 _keys!1806) #b00000000000000000000000000000000) Nil!125) Nil!125)))))

(declare-fun d!751 () Bool)

(declare-fun res!6251 () Bool)

(assert (=> d!751 (=> res!6251 e!2960)))

(assert (=> d!751 (= res!6251 (bvsge #b00000000000000000000000000000000 (size!257 _keys!1806)))))

(assert (=> d!751 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!125) e!2960)))

(assert (= (and d!751 (not res!6251)) b!5471))

(assert (= (and b!5471 res!6253) b!5469))

(assert (= (and b!5471 res!6252) b!5468))

(assert (= (and b!5468 c!380) b!5472))

(assert (= (and b!5468 (not c!380)) b!5470))

(assert (= (or b!5472 b!5470) bm!149))

(assert (=> b!5468 m!2987))

(assert (=> b!5468 m!2987))

(assert (=> b!5468 m!3003))

(assert (=> b!5469 m!2987))

(assert (=> b!5469 m!2987))

(declare-fun m!3057 () Bool)

(assert (=> b!5469 m!3057))

(assert (=> b!5471 m!2987))

(assert (=> b!5471 m!2987))

(assert (=> b!5471 m!3003))

(assert (=> bm!149 m!2987))

(declare-fun m!3059 () Bool)

(assert (=> bm!149 m!3059))

(assert (=> b!5298 d!751))

(declare-fun d!753 () Bool)

(assert (=> d!753 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!750 d!753))

(declare-fun d!755 () Bool)

(assert (=> d!755 (= (array_inv!137 _values!1492) (bvsge (size!256 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!750 d!755))

(declare-fun d!757 () Bool)

(assert (=> d!757 (= (array_inv!138 _keys!1806) (bvsge (size!257 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!750 d!757))

(declare-fun b!5481 () Bool)

(declare-fun e!2972 () Bool)

(declare-fun call!155 () Bool)

(assert (=> b!5481 (= e!2972 call!155)))

(declare-fun bm!152 () Bool)

(assert (=> bm!152 (= call!155 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!5482 () Bool)

(declare-fun e!2970 () Bool)

(assert (=> b!5482 (= e!2970 call!155)))

(declare-fun d!759 () Bool)

(declare-fun res!6259 () Bool)

(declare-fun e!2971 () Bool)

(assert (=> d!759 (=> res!6259 e!2971)))

(assert (=> d!759 (= res!6259 (bvsge #b00000000000000000000000000000000 (size!257 _keys!1806)))))

(assert (=> d!759 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!2971)))

(declare-fun b!5483 () Bool)

(assert (=> b!5483 (= e!2971 e!2970)))

(declare-fun c!383 () Bool)

(assert (=> b!5483 (= c!383 (validKeyInArray!0 (select (arr!195 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5484 () Bool)

(assert (=> b!5484 (= e!2970 e!2972)))

(declare-fun lt!1009 () (_ BitVec 64))

(assert (=> b!5484 (= lt!1009 (select (arr!195 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1011 () Unit!65)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!411 (_ BitVec 64) (_ BitVec 32)) Unit!65)

(assert (=> b!5484 (= lt!1011 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!1009 #b00000000000000000000000000000000))))

(assert (=> b!5484 (arrayContainsKey!0 _keys!1806 lt!1009 #b00000000000000000000000000000000)))

(declare-fun lt!1010 () Unit!65)

(assert (=> b!5484 (= lt!1010 lt!1011)))

(declare-fun res!6258 () Bool)

(declare-datatypes ((SeekEntryResult!13 0))(
  ( (MissingZero!13 (index!2171 (_ BitVec 32))) (Found!13 (index!2172 (_ BitVec 32))) (Intermediate!13 (undefined!825 Bool) (index!2173 (_ BitVec 32)) (x!2447 (_ BitVec 32))) (Undefined!13) (MissingVacant!13 (index!2174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!411 (_ BitVec 32)) SeekEntryResult!13)

(assert (=> b!5484 (= res!6258 (= (seekEntryOrOpen!0 (select (arr!195 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!13 #b00000000000000000000000000000000)))))

(assert (=> b!5484 (=> (not res!6258) (not e!2972))))

(assert (= (and d!759 (not res!6259)) b!5483))

(assert (= (and b!5483 c!383) b!5484))

(assert (= (and b!5483 (not c!383)) b!5482))

(assert (= (and b!5484 res!6258) b!5481))

(assert (= (or b!5481 b!5482) bm!152))

(declare-fun m!3061 () Bool)

(assert (=> bm!152 m!3061))

(assert (=> b!5483 m!2987))

(assert (=> b!5483 m!2987))

(assert (=> b!5483 m!3003))

(assert (=> b!5484 m!2987))

(declare-fun m!3063 () Bool)

(assert (=> b!5484 m!3063))

(declare-fun m!3065 () Bool)

(assert (=> b!5484 m!3065))

(assert (=> b!5484 m!2987))

(declare-fun m!3067 () Bool)

(assert (=> b!5484 m!3067))

(assert (=> b!5297 d!759))

(declare-fun b!5491 () Bool)

(declare-fun e!2978 () Bool)

(assert (=> b!5491 (= e!2978 tp_is_empty!241)))

(declare-fun mapIsEmpty!338 () Bool)

(declare-fun mapRes!338 () Bool)

(assert (=> mapIsEmpty!338 mapRes!338))

(declare-fun mapNonEmpty!338 () Bool)

(declare-fun tp!731 () Bool)

(assert (=> mapNonEmpty!338 (= mapRes!338 (and tp!731 e!2978))))

(declare-fun mapValue!338 () ValueCell!104)

(declare-fun mapRest!338 () (Array (_ BitVec 32) ValueCell!104))

(declare-fun mapKey!338 () (_ BitVec 32))

(assert (=> mapNonEmpty!338 (= mapRest!329 (store mapRest!338 mapKey!338 mapValue!338))))

(declare-fun condMapEmpty!338 () Bool)

(declare-fun mapDefault!338 () ValueCell!104)

(assert (=> mapNonEmpty!329 (= condMapEmpty!338 (= mapRest!329 ((as const (Array (_ BitVec 32) ValueCell!104)) mapDefault!338)))))

(declare-fun e!2977 () Bool)

(assert (=> mapNonEmpty!329 (= tp!716 (and e!2977 mapRes!338))))

(declare-fun b!5492 () Bool)

(assert (=> b!5492 (= e!2977 tp_is_empty!241)))

(assert (= (and mapNonEmpty!329 condMapEmpty!338) mapIsEmpty!338))

(assert (= (and mapNonEmpty!329 (not condMapEmpty!338)) mapNonEmpty!338))

(assert (= (and mapNonEmpty!338 ((_ is ValueCellFull!104) mapValue!338)) b!5491))

(assert (= (and mapNonEmpty!329 ((_ is ValueCellFull!104) mapDefault!338)) b!5492))

(declare-fun m!3069 () Bool)

(assert (=> mapNonEmpty!338 m!3069))

(declare-fun b_lambda!333 () Bool)

(assert (= b_lambda!331 (or (and start!750 b_free!163) b_lambda!333)))

(check-sat (not d!749) (not b_lambda!333) (not b!5454) (not b!5382) (not b!5469) (not bm!149) b_and!313 (not d!745) (not b!5484) (not bm!152) (not mapNonEmpty!338) (not b!5453) (not b!5468) (not b!5444) tp_is_empty!241 (not bm!144) (not bm!143) (not b!5439) (not d!747) (not bm!145) (not bm!140) (not b!5450) (not b!5455) (not b!5451) (not b!5392) (not b_next!163) (not b!5483) (not b!5377) (not b!5471) (not b!5436) (not b!5390))
(check-sat b_and!313 (not b_next!163))
