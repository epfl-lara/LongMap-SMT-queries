; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!752 () Bool)

(assert start!752)

(declare-fun b_free!165 () Bool)

(declare-fun b_next!165 () Bool)

(assert (=> start!752 (= b_free!165 (not b_next!165))))

(declare-fun tp!721 () Bool)

(declare-fun b_and!309 () Bool)

(assert (=> start!752 (= tp!721 b_and!309)))

(declare-fun b!5324 () Bool)

(declare-fun res!6182 () Bool)

(declare-fun e!2871 () Bool)

(assert (=> b!5324 (=> (not res!6182) (not e!2871))))

(declare-datatypes ((array!421 0))(
  ( (array!422 (arr!200 (Array (_ BitVec 32) (_ BitVec 64))) (size!262 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!421)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!421 (_ BitVec 32)) Bool)

(assert (=> b!5324 (= res!6182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!6181 () Bool)

(assert (=> start!752 (=> (not res!6181) (not e!2871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!752 (= res!6181 (validMask!0 mask!2250))))

(assert (=> start!752 e!2871))

(assert (=> start!752 tp!721))

(assert (=> start!752 true))

(declare-datatypes ((V!501 0))(
  ( (V!502 (val!127 Int)) )
))
(declare-datatypes ((ValueCell!105 0))(
  ( (ValueCellFull!105 (v!1217 V!501)) (EmptyCell!105) )
))
(declare-datatypes ((array!423 0))(
  ( (array!424 (arr!201 (Array (_ BitVec 32) ValueCell!105)) (size!263 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!423)

(declare-fun e!2876 () Bool)

(declare-fun array_inv!147 (array!423) Bool)

(assert (=> start!752 (and (array_inv!147 _values!1492) e!2876)))

(declare-fun tp_is_empty!243 () Bool)

(assert (=> start!752 tp_is_empty!243))

(declare-fun array_inv!148 (array!421) Bool)

(assert (=> start!752 (array_inv!148 _keys!1806)))

(declare-fun b!5325 () Bool)

(declare-fun e!2870 () Bool)

(assert (=> b!5325 (= e!2870 tp_is_empty!243)))

(declare-fun b!5326 () Bool)

(declare-fun e!2872 () Bool)

(assert (=> b!5326 (= e!2871 (not e!2872))))

(declare-fun res!6185 () Bool)

(assert (=> b!5326 (=> res!6185 e!2872)))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5326 (= res!6185 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!2874 () Bool)

(assert (=> b!5326 e!2874))

(declare-fun c!350 () Bool)

(assert (=> b!5326 (= c!350 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!501)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!501)

(declare-datatypes ((Unit!67 0))(
  ( (Unit!68) )
))
(declare-fun lt!918 () Unit!67)

(declare-fun lemmaKeyInListMapIsInArray!20 (array!421 array!423 (_ BitVec 32) (_ BitVec 32) V!501 V!501 (_ BitVec 64) Int) Unit!67)

(assert (=> b!5326 (= lt!918 (lemmaKeyInListMapIsInArray!20 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!5327 () Bool)

(assert (=> b!5327 (= e!2874 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5328 () Bool)

(assert (=> b!5328 (= e!2872 (and (bvslt #b00000000000000000000000000000000 (size!262 _keys!1806)) (bvslt (size!262 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun b!5329 () Bool)

(declare-fun e!2875 () Bool)

(declare-fun mapRes!332 () Bool)

(assert (=> b!5329 (= e!2876 (and e!2875 mapRes!332))))

(declare-fun condMapEmpty!332 () Bool)

(declare-fun mapDefault!332 () ValueCell!105)

(assert (=> b!5329 (= condMapEmpty!332 (= (arr!201 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!105)) mapDefault!332)))))

(declare-fun mapIsEmpty!332 () Bool)

(assert (=> mapIsEmpty!332 mapRes!332))

(declare-fun b!5330 () Bool)

(declare-fun res!6186 () Bool)

(assert (=> b!5330 (=> (not res!6186) (not e!2871))))

(assert (=> b!5330 (= res!6186 (and (= (size!263 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!262 _keys!1806) (size!263 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5331 () Bool)

(assert (=> b!5331 (= e!2875 tp_is_empty!243)))

(declare-fun b!5332 () Bool)

(assert (=> b!5332 (= e!2874 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5333 () Bool)

(declare-fun res!6187 () Bool)

(assert (=> b!5333 (=> (not res!6187) (not e!2871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5333 (= res!6187 (validKeyInArray!0 k0!1278))))

(declare-fun b!5334 () Bool)

(declare-fun res!6184 () Bool)

(assert (=> b!5334 (=> (not res!6184) (not e!2871))))

(declare-datatypes ((tuple2!120 0))(
  ( (tuple2!121 (_1!60 (_ BitVec 64)) (_2!60 V!501)) )
))
(declare-datatypes ((List!132 0))(
  ( (Nil!129) (Cons!128 (h!694 tuple2!120) (t!2265 List!132)) )
))
(declare-datatypes ((ListLongMap!125 0))(
  ( (ListLongMap!126 (toList!78 List!132)) )
))
(declare-fun contains!51 (ListLongMap!125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!37 (array!421 array!423 (_ BitVec 32) (_ BitVec 32) V!501 V!501 (_ BitVec 32) Int) ListLongMap!125)

(assert (=> b!5334 (= res!6184 (contains!51 (getCurrentListMap!37 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!5335 () Bool)

(declare-fun res!6183 () Bool)

(assert (=> b!5335 (=> (not res!6183) (not e!2871))))

(declare-datatypes ((List!133 0))(
  ( (Nil!130) (Cons!129 (h!695 (_ BitVec 64)) (t!2266 List!133)) )
))
(declare-fun arrayNoDuplicates!0 (array!421 (_ BitVec 32) List!133) Bool)

(assert (=> b!5335 (= res!6183 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!130))))

(declare-fun mapNonEmpty!332 () Bool)

(declare-fun tp!722 () Bool)

(assert (=> mapNonEmpty!332 (= mapRes!332 (and tp!722 e!2870))))

(declare-fun mapValue!332 () ValueCell!105)

(declare-fun mapKey!332 () (_ BitVec 32))

(declare-fun mapRest!332 () (Array (_ BitVec 32) ValueCell!105))

(assert (=> mapNonEmpty!332 (= (arr!201 _values!1492) (store mapRest!332 mapKey!332 mapValue!332))))

(assert (= (and start!752 res!6181) b!5330))

(assert (= (and b!5330 res!6186) b!5324))

(assert (= (and b!5324 res!6182) b!5335))

(assert (= (and b!5335 res!6183) b!5334))

(assert (= (and b!5334 res!6184) b!5333))

(assert (= (and b!5333 res!6187) b!5326))

(assert (= (and b!5326 c!350) b!5332))

(assert (= (and b!5326 (not c!350)) b!5327))

(assert (= (and b!5326 (not res!6185)) b!5328))

(assert (= (and b!5329 condMapEmpty!332) mapIsEmpty!332))

(assert (= (and b!5329 (not condMapEmpty!332)) mapNonEmpty!332))

(get-info :version)

(assert (= (and mapNonEmpty!332 ((_ is ValueCellFull!105) mapValue!332)) b!5325))

(assert (= (and b!5329 ((_ is ValueCellFull!105) mapDefault!332)) b!5331))

(assert (= start!752 b!5329))

(declare-fun m!2943 () Bool)

(assert (=> mapNonEmpty!332 m!2943))

(declare-fun m!2945 () Bool)

(assert (=> b!5335 m!2945))

(declare-fun m!2947 () Bool)

(assert (=> b!5333 m!2947))

(declare-fun m!2949 () Bool)

(assert (=> b!5324 m!2949))

(declare-fun m!2951 () Bool)

(assert (=> start!752 m!2951))

(declare-fun m!2953 () Bool)

(assert (=> start!752 m!2953))

(declare-fun m!2955 () Bool)

(assert (=> start!752 m!2955))

(declare-fun m!2957 () Bool)

(assert (=> b!5334 m!2957))

(assert (=> b!5334 m!2957))

(declare-fun m!2959 () Bool)

(assert (=> b!5334 m!2959))

(declare-fun m!2961 () Bool)

(assert (=> b!5326 m!2961))

(declare-fun m!2963 () Bool)

(assert (=> b!5326 m!2963))

(assert (=> b!5332 m!2961))

(check-sat (not b!5326) (not mapNonEmpty!332) (not b!5333) (not b!5334) tp_is_empty!243 (not b_next!165) (not b!5332) (not b!5324) b_and!309 (not b!5335) (not start!752))
(check-sat b_and!309 (not b_next!165))
(get-model)

(declare-fun d!741 () Bool)

(assert (=> d!741 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!5333 d!741))

(declare-fun b!5380 () Bool)

(declare-fun e!2905 () Bool)

(declare-fun call!131 () Bool)

(assert (=> b!5380 (= e!2905 call!131)))

(declare-fun b!5381 () Bool)

(declare-fun e!2904 () Bool)

(assert (=> b!5381 (= e!2905 e!2904)))

(declare-fun lt!930 () (_ BitVec 64))

(assert (=> b!5381 (= lt!930 (select (arr!200 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!928 () Unit!67)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!421 (_ BitVec 64) (_ BitVec 32)) Unit!67)

(assert (=> b!5381 (= lt!928 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!930 #b00000000000000000000000000000000))))

(assert (=> b!5381 (arrayContainsKey!0 _keys!1806 lt!930 #b00000000000000000000000000000000)))

(declare-fun lt!929 () Unit!67)

(assert (=> b!5381 (= lt!929 lt!928)))

(declare-fun res!6213 () Bool)

(declare-datatypes ((SeekEntryResult!13 0))(
  ( (MissingZero!13 (index!2171 (_ BitVec 32))) (Found!13 (index!2172 (_ BitVec 32))) (Intermediate!13 (undefined!825 Bool) (index!2173 (_ BitVec 32)) (x!2447 (_ BitVec 32))) (Undefined!13) (MissingVacant!13 (index!2174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!421 (_ BitVec 32)) SeekEntryResult!13)

(assert (=> b!5381 (= res!6213 (= (seekEntryOrOpen!0 (select (arr!200 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!13 #b00000000000000000000000000000000)))))

(assert (=> b!5381 (=> (not res!6213) (not e!2904))))

(declare-fun b!5382 () Bool)

(assert (=> b!5382 (= e!2904 call!131)))

(declare-fun b!5383 () Bool)

(declare-fun e!2906 () Bool)

(assert (=> b!5383 (= e!2906 e!2905)))

(declare-fun c!356 () Bool)

(assert (=> b!5383 (= c!356 (validKeyInArray!0 (select (arr!200 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!743 () Bool)

(declare-fun res!6214 () Bool)

(assert (=> d!743 (=> res!6214 e!2906)))

(assert (=> d!743 (= res!6214 (bvsge #b00000000000000000000000000000000 (size!262 _keys!1806)))))

(assert (=> d!743 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!2906)))

(declare-fun bm!128 () Bool)

(assert (=> bm!128 (= call!131 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(assert (= (and d!743 (not res!6214)) b!5383))

(assert (= (and b!5383 c!356) b!5381))

(assert (= (and b!5383 (not c!356)) b!5380))

(assert (= (and b!5381 res!6213) b!5382))

(assert (= (or b!5382 b!5380) bm!128))

(declare-fun m!2987 () Bool)

(assert (=> b!5381 m!2987))

(declare-fun m!2989 () Bool)

(assert (=> b!5381 m!2989))

(declare-fun m!2991 () Bool)

(assert (=> b!5381 m!2991))

(assert (=> b!5381 m!2987))

(declare-fun m!2993 () Bool)

(assert (=> b!5381 m!2993))

(assert (=> b!5383 m!2987))

(assert (=> b!5383 m!2987))

(declare-fun m!2995 () Bool)

(assert (=> b!5383 m!2995))

(declare-fun m!2997 () Bool)

(assert (=> bm!128 m!2997))

(assert (=> b!5324 d!743))

(declare-fun d!745 () Bool)

(declare-fun res!6219 () Bool)

(declare-fun e!2911 () Bool)

(assert (=> d!745 (=> res!6219 e!2911)))

(assert (=> d!745 (= res!6219 (= (select (arr!200 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!745 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!2911)))

(declare-fun b!5388 () Bool)

(declare-fun e!2912 () Bool)

(assert (=> b!5388 (= e!2911 e!2912)))

(declare-fun res!6220 () Bool)

(assert (=> b!5388 (=> (not res!6220) (not e!2912))))

(assert (=> b!5388 (= res!6220 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!262 _keys!1806)))))

(declare-fun b!5389 () Bool)

(assert (=> b!5389 (= e!2912 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!745 (not res!6219)) b!5388))

(assert (= (and b!5388 res!6220) b!5389))

(assert (=> d!745 m!2987))

(declare-fun m!2999 () Bool)

(assert (=> b!5389 m!2999))

(assert (=> b!5332 d!745))

(declare-fun d!747 () Bool)

(assert (=> d!747 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!752 d!747))

(declare-fun d!749 () Bool)

(assert (=> d!749 (= (array_inv!147 _values!1492) (bvsge (size!263 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!752 d!749))

(declare-fun d!751 () Bool)

(assert (=> d!751 (= (array_inv!148 _keys!1806) (bvsge (size!262 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!752 d!751))

(assert (=> b!5326 d!745))

(declare-fun d!753 () Bool)

(declare-fun e!2915 () Bool)

(assert (=> d!753 e!2915))

(declare-fun c!359 () Bool)

(assert (=> d!753 (= c!359 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!933 () Unit!67)

(declare-fun choose!137 (array!421 array!423 (_ BitVec 32) (_ BitVec 32) V!501 V!501 (_ BitVec 64) Int) Unit!67)

(assert (=> d!753 (= lt!933 (choose!137 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!753 (validMask!0 mask!2250)))

(assert (=> d!753 (= (lemmaKeyInListMapIsInArray!20 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!933)))

(declare-fun b!5394 () Bool)

(assert (=> b!5394 (= e!2915 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5395 () Bool)

(assert (=> b!5395 (= e!2915 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!753 c!359) b!5394))

(assert (= (and d!753 (not c!359)) b!5395))

(declare-fun m!3001 () Bool)

(assert (=> d!753 m!3001))

(assert (=> d!753 m!2951))

(assert (=> b!5394 m!2961))

(assert (=> b!5326 d!753))

(declare-fun d!755 () Bool)

(declare-fun e!2920 () Bool)

(assert (=> d!755 e!2920))

(declare-fun res!6223 () Bool)

(assert (=> d!755 (=> res!6223 e!2920)))

(declare-fun lt!942 () Bool)

(assert (=> d!755 (= res!6223 (not lt!942))))

(declare-fun lt!944 () Bool)

(assert (=> d!755 (= lt!942 lt!944)))

(declare-fun lt!945 () Unit!67)

(declare-fun e!2921 () Unit!67)

(assert (=> d!755 (= lt!945 e!2921)))

(declare-fun c!362 () Bool)

(assert (=> d!755 (= c!362 lt!944)))

(declare-fun containsKey!4 (List!132 (_ BitVec 64)) Bool)

(assert (=> d!755 (= lt!944 (containsKey!4 (toList!78 (getCurrentListMap!37 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!755 (= (contains!51 (getCurrentListMap!37 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!942)))

(declare-fun b!5402 () Bool)

(declare-fun lt!943 () Unit!67)

(assert (=> b!5402 (= e!2921 lt!943)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!4 (List!132 (_ BitVec 64)) Unit!67)

(assert (=> b!5402 (= lt!943 (lemmaContainsKeyImpliesGetValueByKeyDefined!4 (toList!78 (getCurrentListMap!37 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!16 0))(
  ( (Some!15 (v!1219 V!501)) (None!14) )
))
(declare-fun isDefined!5 (Option!16) Bool)

(declare-fun getValueByKey!10 (List!132 (_ BitVec 64)) Option!16)

(assert (=> b!5402 (isDefined!5 (getValueByKey!10 (toList!78 (getCurrentListMap!37 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!5403 () Bool)

(declare-fun Unit!71 () Unit!67)

(assert (=> b!5403 (= e!2921 Unit!71)))

(declare-fun b!5404 () Bool)

(assert (=> b!5404 (= e!2920 (isDefined!5 (getValueByKey!10 (toList!78 (getCurrentListMap!37 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!755 c!362) b!5402))

(assert (= (and d!755 (not c!362)) b!5403))

(assert (= (and d!755 (not res!6223)) b!5404))

(declare-fun m!3003 () Bool)

(assert (=> d!755 m!3003))

(declare-fun m!3005 () Bool)

(assert (=> b!5402 m!3005))

(declare-fun m!3007 () Bool)

(assert (=> b!5402 m!3007))

(assert (=> b!5402 m!3007))

(declare-fun m!3009 () Bool)

(assert (=> b!5402 m!3009))

(assert (=> b!5404 m!3007))

(assert (=> b!5404 m!3007))

(assert (=> b!5404 m!3009))

(assert (=> b!5334 d!755))

(declare-fun b!5447 () Bool)

(declare-fun e!2956 () Bool)

(declare-fun lt!1005 () ListLongMap!125)

(declare-fun apply!20 (ListLongMap!125 (_ BitVec 64)) V!501)

(assert (=> b!5447 (= e!2956 (= (apply!20 lt!1005 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!5448 () Bool)

(declare-fun e!2950 () Bool)

(assert (=> b!5448 (= e!2950 (validKeyInArray!0 (select (arr!200 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5449 () Bool)

(declare-fun e!2948 () ListLongMap!125)

(declare-fun call!150 () ListLongMap!125)

(assert (=> b!5449 (= e!2948 call!150)))

(declare-fun b!5450 () Bool)

(declare-fun e!2955 () Bool)

(assert (=> b!5450 (= e!2955 e!2956)))

(declare-fun res!6246 () Bool)

(declare-fun call!148 () Bool)

(assert (=> b!5450 (= res!6246 call!148)))

(assert (=> b!5450 (=> (not res!6246) (not e!2956))))

(declare-fun bm!143 () Bool)

(assert (=> bm!143 (= call!148 (contains!51 lt!1005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!5451 () Bool)

(declare-fun e!2954 () Bool)

(assert (=> b!5451 (= e!2954 (= (apply!20 lt!1005 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun b!5452 () Bool)

(declare-fun e!2949 () ListLongMap!125)

(assert (=> b!5452 (= e!2949 e!2948)))

(declare-fun c!379 () Bool)

(assert (=> b!5452 (= c!379 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!5453 () Bool)

(declare-fun e!2960 () Bool)

(declare-fun e!2952 () Bool)

(assert (=> b!5453 (= e!2960 e!2952)))

(declare-fun c!380 () Bool)

(assert (=> b!5453 (= c!380 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!144 () Bool)

(declare-fun call!152 () ListLongMap!125)

(declare-fun call!146 () ListLongMap!125)

(assert (=> bm!144 (= call!152 call!146)))

(declare-fun c!377 () Bool)

(declare-fun call!151 () ListLongMap!125)

(declare-fun call!147 () ListLongMap!125)

(declare-fun bm!145 () Bool)

(declare-fun +!7 (ListLongMap!125 tuple2!120) ListLongMap!125)

(assert (=> bm!145 (= call!147 (+!7 (ite c!377 call!146 (ite c!379 call!152 call!151)) (ite (or c!377 c!379) (tuple2!121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!5454 () Bool)

(declare-fun e!2951 () Unit!67)

(declare-fun lt!990 () Unit!67)

(assert (=> b!5454 (= e!2951 lt!990)))

(declare-fun lt!993 () ListLongMap!125)

(declare-fun getCurrentListMapNoExtraKeys!4 (array!421 array!423 (_ BitVec 32) (_ BitVec 32) V!501 V!501 (_ BitVec 32) Int) ListLongMap!125)

(assert (=> b!5454 (= lt!993 (getCurrentListMapNoExtraKeys!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1003 () (_ BitVec 64))

(assert (=> b!5454 (= lt!1003 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1009 () (_ BitVec 64))

(assert (=> b!5454 (= lt!1009 (select (arr!200 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1001 () Unit!67)

(declare-fun addStillContains!5 (ListLongMap!125 (_ BitVec 64) V!501 (_ BitVec 64)) Unit!67)

(assert (=> b!5454 (= lt!1001 (addStillContains!5 lt!993 lt!1003 zeroValue!1434 lt!1009))))

(assert (=> b!5454 (contains!51 (+!7 lt!993 (tuple2!121 lt!1003 zeroValue!1434)) lt!1009)))

(declare-fun lt!999 () Unit!67)

(assert (=> b!5454 (= lt!999 lt!1001)))

(declare-fun lt!1007 () ListLongMap!125)

(assert (=> b!5454 (= lt!1007 (getCurrentListMapNoExtraKeys!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!991 () (_ BitVec 64))

(assert (=> b!5454 (= lt!991 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!996 () (_ BitVec 64))

(assert (=> b!5454 (= lt!996 (select (arr!200 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!992 () Unit!67)

(declare-fun addApplyDifferent!5 (ListLongMap!125 (_ BitVec 64) V!501 (_ BitVec 64)) Unit!67)

(assert (=> b!5454 (= lt!992 (addApplyDifferent!5 lt!1007 lt!991 minValue!1434 lt!996))))

(assert (=> b!5454 (= (apply!20 (+!7 lt!1007 (tuple2!121 lt!991 minValue!1434)) lt!996) (apply!20 lt!1007 lt!996))))

(declare-fun lt!1002 () Unit!67)

(assert (=> b!5454 (= lt!1002 lt!992)))

(declare-fun lt!995 () ListLongMap!125)

(assert (=> b!5454 (= lt!995 (getCurrentListMapNoExtraKeys!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!998 () (_ BitVec 64))

(assert (=> b!5454 (= lt!998 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1000 () (_ BitVec 64))

(assert (=> b!5454 (= lt!1000 (select (arr!200 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1011 () Unit!67)

(assert (=> b!5454 (= lt!1011 (addApplyDifferent!5 lt!995 lt!998 zeroValue!1434 lt!1000))))

(assert (=> b!5454 (= (apply!20 (+!7 lt!995 (tuple2!121 lt!998 zeroValue!1434)) lt!1000) (apply!20 lt!995 lt!1000))))

(declare-fun lt!1004 () Unit!67)

(assert (=> b!5454 (= lt!1004 lt!1011)))

(declare-fun lt!1006 () ListLongMap!125)

(assert (=> b!5454 (= lt!1006 (getCurrentListMapNoExtraKeys!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1010 () (_ BitVec 64))

(assert (=> b!5454 (= lt!1010 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!994 () (_ BitVec 64))

(assert (=> b!5454 (= lt!994 (select (arr!200 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!5454 (= lt!990 (addApplyDifferent!5 lt!1006 lt!1010 minValue!1434 lt!994))))

(assert (=> b!5454 (= (apply!20 (+!7 lt!1006 (tuple2!121 lt!1010 minValue!1434)) lt!994) (apply!20 lt!1006 lt!994))))

(declare-fun b!5455 () Bool)

(declare-fun res!6247 () Bool)

(assert (=> b!5455 (=> (not res!6247) (not e!2960))))

(declare-fun e!2957 () Bool)

(assert (=> b!5455 (= res!6247 e!2957)))

(declare-fun res!6248 () Bool)

(assert (=> b!5455 (=> res!6248 e!2957)))

(assert (=> b!5455 (= res!6248 (not e!2950))))

(declare-fun res!6249 () Bool)

(assert (=> b!5455 (=> (not res!6249) (not e!2950))))

(assert (=> b!5455 (= res!6249 (bvslt #b00000000000000000000000000000000 (size!262 _keys!1806)))))

(declare-fun b!5456 () Bool)

(declare-fun e!2953 () Bool)

(assert (=> b!5456 (= e!2957 e!2953)))

(declare-fun res!6245 () Bool)

(assert (=> b!5456 (=> (not res!6245) (not e!2953))))

(assert (=> b!5456 (= res!6245 (contains!51 lt!1005 (select (arr!200 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!5456 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!262 _keys!1806)))))

(declare-fun b!5457 () Bool)

(declare-fun c!378 () Bool)

(assert (=> b!5457 (= c!378 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!2959 () ListLongMap!125)

(assert (=> b!5457 (= e!2948 e!2959)))

(declare-fun b!5458 () Bool)

(declare-fun get!102 (ValueCell!105 V!501) V!501)

(declare-fun dynLambda!42 (Int (_ BitVec 64)) V!501)

(assert (=> b!5458 (= e!2953 (= (apply!20 lt!1005 (select (arr!200 _keys!1806) #b00000000000000000000000000000000)) (get!102 (select (arr!201 _values!1492) #b00000000000000000000000000000000) (dynLambda!42 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!5458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!263 _values!1492)))))

(assert (=> b!5458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!262 _keys!1806)))))

(declare-fun b!5459 () Bool)

(assert (=> b!5459 (= e!2959 call!150)))

(declare-fun b!5460 () Bool)

(assert (=> b!5460 (= e!2955 (not call!148))))

(declare-fun b!5461 () Bool)

(declare-fun res!6243 () Bool)

(assert (=> b!5461 (=> (not res!6243) (not e!2960))))

(assert (=> b!5461 (= res!6243 e!2955)))

(declare-fun c!376 () Bool)

(assert (=> b!5461 (= c!376 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!5462 () Bool)

(declare-fun Unit!72 () Unit!67)

(assert (=> b!5462 (= e!2951 Unit!72)))

(declare-fun d!757 () Bool)

(assert (=> d!757 e!2960))

(declare-fun res!6250 () Bool)

(assert (=> d!757 (=> (not res!6250) (not e!2960))))

(assert (=> d!757 (= res!6250 (or (bvsge #b00000000000000000000000000000000 (size!262 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!262 _keys!1806)))))))

(declare-fun lt!997 () ListLongMap!125)

(assert (=> d!757 (= lt!1005 lt!997)))

(declare-fun lt!1008 () Unit!67)

(assert (=> d!757 (= lt!1008 e!2951)))

(declare-fun c!375 () Bool)

(declare-fun e!2958 () Bool)

(assert (=> d!757 (= c!375 e!2958)))

(declare-fun res!6244 () Bool)

(assert (=> d!757 (=> (not res!6244) (not e!2958))))

(assert (=> d!757 (= res!6244 (bvslt #b00000000000000000000000000000000 (size!262 _keys!1806)))))

(assert (=> d!757 (= lt!997 e!2949)))

(assert (=> d!757 (= c!377 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!757 (validMask!0 mask!2250)))

(assert (=> d!757 (= (getCurrentListMap!37 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!1005)))

(declare-fun b!5463 () Bool)

(declare-fun call!149 () Bool)

(assert (=> b!5463 (= e!2952 (not call!149))))

(declare-fun b!5464 () Bool)

(assert (=> b!5464 (= e!2958 (validKeyInArray!0 (select (arr!200 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5465 () Bool)

(assert (=> b!5465 (= e!2949 (+!7 call!147 (tuple2!121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!5466 () Bool)

(assert (=> b!5466 (= e!2952 e!2954)))

(declare-fun res!6242 () Bool)

(assert (=> b!5466 (= res!6242 call!149)))

(assert (=> b!5466 (=> (not res!6242) (not e!2954))))

(declare-fun bm!146 () Bool)

(assert (=> bm!146 (= call!150 call!147)))

(declare-fun bm!147 () Bool)

(assert (=> bm!147 (= call!151 call!152)))

(declare-fun bm!148 () Bool)

(assert (=> bm!148 (= call!146 (getCurrentListMapNoExtraKeys!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun bm!149 () Bool)

(assert (=> bm!149 (= call!149 (contains!51 lt!1005 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!5467 () Bool)

(assert (=> b!5467 (= e!2959 call!151)))

(assert (= (and d!757 c!377) b!5465))

(assert (= (and d!757 (not c!377)) b!5452))

(assert (= (and b!5452 c!379) b!5449))

(assert (= (and b!5452 (not c!379)) b!5457))

(assert (= (and b!5457 c!378) b!5459))

(assert (= (and b!5457 (not c!378)) b!5467))

(assert (= (or b!5459 b!5467) bm!147))

(assert (= (or b!5449 bm!147) bm!144))

(assert (= (or b!5449 b!5459) bm!146))

(assert (= (or b!5465 bm!144) bm!148))

(assert (= (or b!5465 bm!146) bm!145))

(assert (= (and d!757 res!6244) b!5464))

(assert (= (and d!757 c!375) b!5454))

(assert (= (and d!757 (not c!375)) b!5462))

(assert (= (and d!757 res!6250) b!5455))

(assert (= (and b!5455 res!6249) b!5448))

(assert (= (and b!5455 (not res!6248)) b!5456))

(assert (= (and b!5456 res!6245) b!5458))

(assert (= (and b!5455 res!6247) b!5461))

(assert (= (and b!5461 c!376) b!5450))

(assert (= (and b!5461 (not c!376)) b!5460))

(assert (= (and b!5450 res!6246) b!5447))

(assert (= (or b!5450 b!5460) bm!143))

(assert (= (and b!5461 res!6243) b!5453))

(assert (= (and b!5453 c!380) b!5466))

(assert (= (and b!5453 (not c!380)) b!5463))

(assert (= (and b!5466 res!6242) b!5451))

(assert (= (or b!5466 b!5463) bm!149))

(declare-fun b_lambda!331 () Bool)

(assert (=> (not b_lambda!331) (not b!5458)))

(declare-fun t!2270 () Bool)

(declare-fun tb!133 () Bool)

(assert (=> (and start!752 (= defaultEntry!1495 defaultEntry!1495) t!2270) tb!133))

(declare-fun result!201 () Bool)

(assert (=> tb!133 (= result!201 tp_is_empty!243)))

(assert (=> b!5458 t!2270))

(declare-fun b_and!313 () Bool)

(assert (= b_and!309 (and (=> t!2270 result!201) b_and!313)))

(declare-fun m!3011 () Bool)

(assert (=> b!5451 m!3011))

(declare-fun m!3013 () Bool)

(assert (=> b!5458 m!3013))

(declare-fun m!3015 () Bool)

(assert (=> b!5458 m!3015))

(declare-fun m!3017 () Bool)

(assert (=> b!5458 m!3017))

(assert (=> b!5458 m!2987))

(declare-fun m!3019 () Bool)

(assert (=> b!5458 m!3019))

(assert (=> b!5458 m!2987))

(assert (=> b!5458 m!3015))

(assert (=> b!5458 m!3013))

(declare-fun m!3021 () Bool)

(assert (=> b!5465 m!3021))

(assert (=> b!5456 m!2987))

(assert (=> b!5456 m!2987))

(declare-fun m!3023 () Bool)

(assert (=> b!5456 m!3023))

(assert (=> d!757 m!2951))

(declare-fun m!3025 () Bool)

(assert (=> b!5447 m!3025))

(assert (=> b!5448 m!2987))

(assert (=> b!5448 m!2987))

(assert (=> b!5448 m!2995))

(declare-fun m!3027 () Bool)

(assert (=> bm!143 m!3027))

(declare-fun m!3029 () Bool)

(assert (=> bm!148 m!3029))

(assert (=> b!5454 m!2987))

(assert (=> b!5454 m!3029))

(declare-fun m!3031 () Bool)

(assert (=> b!5454 m!3031))

(declare-fun m!3033 () Bool)

(assert (=> b!5454 m!3033))

(declare-fun m!3035 () Bool)

(assert (=> b!5454 m!3035))

(declare-fun m!3037 () Bool)

(assert (=> b!5454 m!3037))

(declare-fun m!3039 () Bool)

(assert (=> b!5454 m!3039))

(declare-fun m!3041 () Bool)

(assert (=> b!5454 m!3041))

(declare-fun m!3043 () Bool)

(assert (=> b!5454 m!3043))

(assert (=> b!5454 m!3033))

(declare-fun m!3045 () Bool)

(assert (=> b!5454 m!3045))

(assert (=> b!5454 m!3031))

(declare-fun m!3047 () Bool)

(assert (=> b!5454 m!3047))

(declare-fun m!3049 () Bool)

(assert (=> b!5454 m!3049))

(declare-fun m!3051 () Bool)

(assert (=> b!5454 m!3051))

(declare-fun m!3053 () Bool)

(assert (=> b!5454 m!3053))

(declare-fun m!3055 () Bool)

(assert (=> b!5454 m!3055))

(assert (=> b!5454 m!3049))

(assert (=> b!5454 m!3039))

(declare-fun m!3057 () Bool)

(assert (=> b!5454 m!3057))

(declare-fun m!3059 () Bool)

(assert (=> b!5454 m!3059))

(assert (=> b!5464 m!2987))

(assert (=> b!5464 m!2987))

(assert (=> b!5464 m!2995))

(declare-fun m!3061 () Bool)

(assert (=> bm!145 m!3061))

(declare-fun m!3063 () Bool)

(assert (=> bm!149 m!3063))

(assert (=> b!5334 d!757))

(declare-fun b!5480 () Bool)

(declare-fun e!2971 () Bool)

(declare-fun contains!53 (List!133 (_ BitVec 64)) Bool)

(assert (=> b!5480 (= e!2971 (contains!53 Nil!130 (select (arr!200 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!152 () Bool)

(declare-fun call!155 () Bool)

(declare-fun c!383 () Bool)

(assert (=> bm!152 (= call!155 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!383 (Cons!129 (select (arr!200 _keys!1806) #b00000000000000000000000000000000) Nil!130) Nil!130)))))

(declare-fun b!5481 () Bool)

(declare-fun e!2970 () Bool)

(assert (=> b!5481 (= e!2970 call!155)))

(declare-fun b!5482 () Bool)

(declare-fun e!2972 () Bool)

(assert (=> b!5482 (= e!2972 e!2970)))

(assert (=> b!5482 (= c!383 (validKeyInArray!0 (select (arr!200 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5483 () Bool)

(declare-fun e!2969 () Bool)

(assert (=> b!5483 (= e!2969 e!2972)))

(declare-fun res!6259 () Bool)

(assert (=> b!5483 (=> (not res!6259) (not e!2972))))

(assert (=> b!5483 (= res!6259 (not e!2971))))

(declare-fun res!6257 () Bool)

(assert (=> b!5483 (=> (not res!6257) (not e!2971))))

(assert (=> b!5483 (= res!6257 (validKeyInArray!0 (select (arr!200 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5484 () Bool)

(assert (=> b!5484 (= e!2970 call!155)))

(declare-fun d!759 () Bool)

(declare-fun res!6258 () Bool)

(assert (=> d!759 (=> res!6258 e!2969)))

(assert (=> d!759 (= res!6258 (bvsge #b00000000000000000000000000000000 (size!262 _keys!1806)))))

(assert (=> d!759 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!130) e!2969)))

(assert (= (and d!759 (not res!6258)) b!5483))

(assert (= (and b!5483 res!6257) b!5480))

(assert (= (and b!5483 res!6259) b!5482))

(assert (= (and b!5482 c!383) b!5481))

(assert (= (and b!5482 (not c!383)) b!5484))

(assert (= (or b!5481 b!5484) bm!152))

(assert (=> b!5480 m!2987))

(assert (=> b!5480 m!2987))

(declare-fun m!3065 () Bool)

(assert (=> b!5480 m!3065))

(assert (=> bm!152 m!2987))

(declare-fun m!3067 () Bool)

(assert (=> bm!152 m!3067))

(assert (=> b!5482 m!2987))

(assert (=> b!5482 m!2987))

(assert (=> b!5482 m!2995))

(assert (=> b!5483 m!2987))

(assert (=> b!5483 m!2987))

(assert (=> b!5483 m!2995))

(assert (=> b!5335 d!759))

(declare-fun mapIsEmpty!338 () Bool)

(declare-fun mapRes!338 () Bool)

(assert (=> mapIsEmpty!338 mapRes!338))

(declare-fun b!5491 () Bool)

(declare-fun e!2977 () Bool)

(assert (=> b!5491 (= e!2977 tp_is_empty!243)))

(declare-fun b!5492 () Bool)

(declare-fun e!2978 () Bool)

(assert (=> b!5492 (= e!2978 tp_is_empty!243)))

(declare-fun mapNonEmpty!338 () Bool)

(declare-fun tp!731 () Bool)

(assert (=> mapNonEmpty!338 (= mapRes!338 (and tp!731 e!2977))))

(declare-fun mapKey!338 () (_ BitVec 32))

(declare-fun mapRest!338 () (Array (_ BitVec 32) ValueCell!105))

(declare-fun mapValue!338 () ValueCell!105)

(assert (=> mapNonEmpty!338 (= mapRest!332 (store mapRest!338 mapKey!338 mapValue!338))))

(declare-fun condMapEmpty!338 () Bool)

(declare-fun mapDefault!338 () ValueCell!105)

(assert (=> mapNonEmpty!332 (= condMapEmpty!338 (= mapRest!332 ((as const (Array (_ BitVec 32) ValueCell!105)) mapDefault!338)))))

(assert (=> mapNonEmpty!332 (= tp!722 (and e!2978 mapRes!338))))

(assert (= (and mapNonEmpty!332 condMapEmpty!338) mapIsEmpty!338))

(assert (= (and mapNonEmpty!332 (not condMapEmpty!338)) mapNonEmpty!338))

(assert (= (and mapNonEmpty!338 ((_ is ValueCellFull!105) mapValue!338)) b!5491))

(assert (= (and mapNonEmpty!332 ((_ is ValueCellFull!105) mapDefault!338)) b!5492))

(declare-fun m!3069 () Bool)

(assert (=> mapNonEmpty!338 m!3069))

(declare-fun b_lambda!333 () Bool)

(assert (= b_lambda!331 (or (and start!752 b_free!165) b_lambda!333)))

(check-sat (not d!753) (not b!5381) (not bm!128) tp_is_empty!243 (not b!5383) (not b!5402) (not b_next!165) (not mapNonEmpty!338) (not b!5483) (not d!757) (not b!5465) (not b!5458) (not b!5454) (not b!5394) (not b!5389) b_and!313 (not b!5451) (not bm!143) (not bm!148) (not bm!149) (not b!5464) (not b!5480) (not b!5482) (not b_lambda!333) (not b!5448) (not b!5456) (not b!5404) (not bm!152) (not b!5447) (not bm!145) (not d!755))
(check-sat b_and!313 (not b_next!165))
