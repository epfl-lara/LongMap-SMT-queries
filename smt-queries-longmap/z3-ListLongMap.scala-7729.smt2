; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97088 () Bool)

(assert start!97088)

(declare-fun res!736731 () Bool)

(declare-fun e!630332 () Bool)

(assert (=> start!97088 (=> (not res!736731) (not e!630332))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71625 0))(
  ( (array!71626 (arr!34467 (Array (_ BitVec 32) (_ BitVec 64))) (size!35003 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71625)

(assert (=> start!97088 (= res!736731 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35003 _keys!1208))))))

(assert (=> start!97088 e!630332))

(declare-fun array_inv!26534 (array!71625) Bool)

(assert (=> start!97088 (array_inv!26534 _keys!1208)))

(assert (=> start!97088 true))

(declare-datatypes ((V!41595 0))(
  ( (V!41596 (val!13732 Int)) )
))
(declare-datatypes ((ValueCell!12966 0))(
  ( (ValueCellFull!12966 (v!16364 V!41595)) (EmptyCell!12966) )
))
(declare-datatypes ((array!71627 0))(
  ( (array!71628 (arr!34468 (Array (_ BitVec 32) ValueCell!12966)) (size!35004 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71627)

(declare-fun e!630328 () Bool)

(declare-fun array_inv!26535 (array!71627) Bool)

(assert (=> start!97088 (and (array_inv!26535 _values!996) e!630328)))

(declare-fun b!1104279 () Bool)

(declare-fun res!736736 () Bool)

(assert (=> b!1104279 (=> (not res!736736) (not e!630332))))

(declare-datatypes ((List!24055 0))(
  ( (Nil!24052) (Cons!24051 (h!25260 (_ BitVec 64)) (t!34320 List!24055)) )
))
(declare-fun noDuplicate!1589 (List!24055) Bool)

(assert (=> b!1104279 (= res!736736 (noDuplicate!1589 Nil!24052))))

(declare-fun b!1104280 () Bool)

(declare-fun res!736737 () Bool)

(assert (=> b!1104280 (=> (not res!736737) (not e!630332))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71625 (_ BitVec 32)) Bool)

(assert (=> b!1104280 (= res!736737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104281 () Bool)

(declare-fun res!736733 () Bool)

(assert (=> b!1104281 (=> (not res!736733) (not e!630332))))

(assert (=> b!1104281 (= res!736733 (and (bvsle #b00000000000000000000000000000000 (size!35003 _keys!1208)) (bvslt (size!35003 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!42838 () Bool)

(declare-fun mapRes!42838 () Bool)

(assert (=> mapIsEmpty!42838 mapRes!42838))

(declare-fun b!1104282 () Bool)

(declare-fun res!736739 () Bool)

(assert (=> b!1104282 (=> (not res!736739) (not e!630332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104282 (= res!736739 (validMask!0 mask!1564))))

(declare-fun b!1104283 () Bool)

(declare-fun e!630329 () Bool)

(assert (=> b!1104283 (= e!630332 e!630329)))

(declare-fun res!736740 () Bool)

(assert (=> b!1104283 (=> res!736740 e!630329)))

(declare-fun contains!6417 (List!24055 (_ BitVec 64)) Bool)

(assert (=> b!1104283 (= res!736740 (contains!6417 Nil!24052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104284 () Bool)

(declare-fun res!736735 () Bool)

(assert (=> b!1104284 (=> (not res!736735) (not e!630332))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104284 (= res!736735 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35003 _keys!1208))))))

(declare-fun b!1104285 () Bool)

(declare-fun e!630333 () Bool)

(declare-fun tp_is_empty!27351 () Bool)

(assert (=> b!1104285 (= e!630333 tp_is_empty!27351)))

(declare-fun b!1104286 () Bool)

(assert (=> b!1104286 (= e!630328 (and e!630333 mapRes!42838))))

(declare-fun condMapEmpty!42838 () Bool)

(declare-fun mapDefault!42838 () ValueCell!12966)

(assert (=> b!1104286 (= condMapEmpty!42838 (= (arr!34468 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12966)) mapDefault!42838)))))

(declare-fun mapNonEmpty!42838 () Bool)

(declare-fun tp!81758 () Bool)

(declare-fun e!630330 () Bool)

(assert (=> mapNonEmpty!42838 (= mapRes!42838 (and tp!81758 e!630330))))

(declare-fun mapRest!42838 () (Array (_ BitVec 32) ValueCell!12966))

(declare-fun mapValue!42838 () ValueCell!12966)

(declare-fun mapKey!42838 () (_ BitVec 32))

(assert (=> mapNonEmpty!42838 (= (arr!34468 _values!996) (store mapRest!42838 mapKey!42838 mapValue!42838))))

(declare-fun b!1104287 () Bool)

(assert (=> b!1104287 (= e!630330 tp_is_empty!27351)))

(declare-fun b!1104288 () Bool)

(assert (=> b!1104288 (= e!630329 (contains!6417 Nil!24052 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104289 () Bool)

(declare-fun res!736741 () Bool)

(assert (=> b!1104289 (=> (not res!736741) (not e!630332))))

(assert (=> b!1104289 (= res!736741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71626 (store (arr!34467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35003 _keys!1208)) mask!1564))))

(declare-fun b!1104290 () Bool)

(declare-fun res!736730 () Bool)

(assert (=> b!1104290 (=> (not res!736730) (not e!630332))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1104290 (= res!736730 (= (select (arr!34467 _keys!1208) i!673) k0!934))))

(declare-fun b!1104291 () Bool)

(declare-fun res!736732 () Bool)

(assert (=> b!1104291 (=> (not res!736732) (not e!630332))))

(declare-fun arrayNoDuplicates!0 (array!71625 (_ BitVec 32) List!24055) Bool)

(assert (=> b!1104291 (= res!736732 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24052))))

(declare-fun b!1104292 () Bool)

(declare-fun res!736734 () Bool)

(assert (=> b!1104292 (=> (not res!736734) (not e!630332))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104292 (= res!736734 (and (= (size!35004 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35003 _keys!1208) (size!35004 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104293 () Bool)

(declare-fun res!736738 () Bool)

(assert (=> b!1104293 (=> (not res!736738) (not e!630332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104293 (= res!736738 (validKeyInArray!0 k0!934))))

(assert (= (and start!97088 res!736731) b!1104282))

(assert (= (and b!1104282 res!736739) b!1104292))

(assert (= (and b!1104292 res!736734) b!1104280))

(assert (= (and b!1104280 res!736737) b!1104291))

(assert (= (and b!1104291 res!736732) b!1104284))

(assert (= (and b!1104284 res!736735) b!1104293))

(assert (= (and b!1104293 res!736738) b!1104290))

(assert (= (and b!1104290 res!736730) b!1104289))

(assert (= (and b!1104289 res!736741) b!1104281))

(assert (= (and b!1104281 res!736733) b!1104279))

(assert (= (and b!1104279 res!736736) b!1104283))

(assert (= (and b!1104283 (not res!736740)) b!1104288))

(assert (= (and b!1104286 condMapEmpty!42838) mapIsEmpty!42838))

(assert (= (and b!1104286 (not condMapEmpty!42838)) mapNonEmpty!42838))

(get-info :version)

(assert (= (and mapNonEmpty!42838 ((_ is ValueCellFull!12966) mapValue!42838)) b!1104287))

(assert (= (and b!1104286 ((_ is ValueCellFull!12966) mapDefault!42838)) b!1104285))

(assert (= start!97088 b!1104286))

(declare-fun m!1024077 () Bool)

(assert (=> mapNonEmpty!42838 m!1024077))

(declare-fun m!1024079 () Bool)

(assert (=> start!97088 m!1024079))

(declare-fun m!1024081 () Bool)

(assert (=> start!97088 m!1024081))

(declare-fun m!1024083 () Bool)

(assert (=> b!1104289 m!1024083))

(declare-fun m!1024085 () Bool)

(assert (=> b!1104289 m!1024085))

(declare-fun m!1024087 () Bool)

(assert (=> b!1104279 m!1024087))

(declare-fun m!1024089 () Bool)

(assert (=> b!1104280 m!1024089))

(declare-fun m!1024091 () Bool)

(assert (=> b!1104293 m!1024091))

(declare-fun m!1024093 () Bool)

(assert (=> b!1104290 m!1024093))

(declare-fun m!1024095 () Bool)

(assert (=> b!1104291 m!1024095))

(declare-fun m!1024097 () Bool)

(assert (=> b!1104288 m!1024097))

(declare-fun m!1024099 () Bool)

(assert (=> b!1104282 m!1024099))

(declare-fun m!1024101 () Bool)

(assert (=> b!1104283 m!1024101))

(check-sat (not b!1104293) (not start!97088) (not b!1104282) tp_is_empty!27351 (not b!1104280) (not b!1104279) (not b!1104288) (not b!1104289) (not b!1104291) (not b!1104283) (not mapNonEmpty!42838))
(check-sat)
(get-model)

(declare-fun d!130885 () Bool)

(assert (=> d!130885 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1104282 d!130885))

(declare-fun b!1104349 () Bool)

(declare-fun e!630361 () Bool)

(declare-fun call!46342 () Bool)

(assert (=> b!1104349 (= e!630361 call!46342)))

(declare-fun b!1104350 () Bool)

(declare-fun e!630362 () Bool)

(assert (=> b!1104350 (= e!630362 (contains!6417 Nil!24052 (select (arr!34467 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104351 () Bool)

(assert (=> b!1104351 (= e!630361 call!46342)))

(declare-fun d!130887 () Bool)

(declare-fun res!736784 () Bool)

(declare-fun e!630363 () Bool)

(assert (=> d!130887 (=> res!736784 e!630363)))

(assert (=> d!130887 (= res!736784 (bvsge #b00000000000000000000000000000000 (size!35003 _keys!1208)))))

(assert (=> d!130887 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24052) e!630363)))

(declare-fun bm!46339 () Bool)

(declare-fun c!108996 () Bool)

(assert (=> bm!46339 (= call!46342 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108996 (Cons!24051 (select (arr!34467 _keys!1208) #b00000000000000000000000000000000) Nil!24052) Nil!24052)))))

(declare-fun b!1104352 () Bool)

(declare-fun e!630360 () Bool)

(assert (=> b!1104352 (= e!630363 e!630360)))

(declare-fun res!736786 () Bool)

(assert (=> b!1104352 (=> (not res!736786) (not e!630360))))

(assert (=> b!1104352 (= res!736786 (not e!630362))))

(declare-fun res!736785 () Bool)

(assert (=> b!1104352 (=> (not res!736785) (not e!630362))))

(assert (=> b!1104352 (= res!736785 (validKeyInArray!0 (select (arr!34467 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104353 () Bool)

(assert (=> b!1104353 (= e!630360 e!630361)))

(assert (=> b!1104353 (= c!108996 (validKeyInArray!0 (select (arr!34467 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!130887 (not res!736784)) b!1104352))

(assert (= (and b!1104352 res!736785) b!1104350))

(assert (= (and b!1104352 res!736786) b!1104353))

(assert (= (and b!1104353 c!108996) b!1104349))

(assert (= (and b!1104353 (not c!108996)) b!1104351))

(assert (= (or b!1104349 b!1104351) bm!46339))

(declare-fun m!1024129 () Bool)

(assert (=> b!1104350 m!1024129))

(assert (=> b!1104350 m!1024129))

(declare-fun m!1024131 () Bool)

(assert (=> b!1104350 m!1024131))

(assert (=> bm!46339 m!1024129))

(declare-fun m!1024133 () Bool)

(assert (=> bm!46339 m!1024133))

(assert (=> b!1104352 m!1024129))

(assert (=> b!1104352 m!1024129))

(declare-fun m!1024135 () Bool)

(assert (=> b!1104352 m!1024135))

(assert (=> b!1104353 m!1024129))

(assert (=> b!1104353 m!1024129))

(assert (=> b!1104353 m!1024135))

(assert (=> b!1104291 d!130887))

(declare-fun d!130889 () Bool)

(declare-fun res!736791 () Bool)

(declare-fun e!630370 () Bool)

(assert (=> d!130889 (=> res!736791 e!630370)))

(assert (=> d!130889 (= res!736791 (bvsge #b00000000000000000000000000000000 (size!35003 _keys!1208)))))

(assert (=> d!130889 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!630370)))

(declare-fun b!1104362 () Bool)

(declare-fun e!630372 () Bool)

(assert (=> b!1104362 (= e!630370 e!630372)))

(declare-fun c!108999 () Bool)

(assert (=> b!1104362 (= c!108999 (validKeyInArray!0 (select (arr!34467 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104363 () Bool)

(declare-fun e!630371 () Bool)

(assert (=> b!1104363 (= e!630372 e!630371)))

(declare-fun lt!495124 () (_ BitVec 64))

(assert (=> b!1104363 (= lt!495124 (select (arr!34467 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36250 0))(
  ( (Unit!36251) )
))
(declare-fun lt!495122 () Unit!36250)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71625 (_ BitVec 64) (_ BitVec 32)) Unit!36250)

(assert (=> b!1104363 (= lt!495122 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495124 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104363 (arrayContainsKey!0 _keys!1208 lt!495124 #b00000000000000000000000000000000)))

(declare-fun lt!495123 () Unit!36250)

(assert (=> b!1104363 (= lt!495123 lt!495122)))

(declare-fun res!736792 () Bool)

(declare-datatypes ((SeekEntryResult!9923 0))(
  ( (MissingZero!9923 (index!42063 (_ BitVec 32))) (Found!9923 (index!42064 (_ BitVec 32))) (Intermediate!9923 (undefined!10735 Bool) (index!42065 (_ BitVec 32)) (x!99322 (_ BitVec 32))) (Undefined!9923) (MissingVacant!9923 (index!42066 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71625 (_ BitVec 32)) SeekEntryResult!9923)

(assert (=> b!1104363 (= res!736792 (= (seekEntryOrOpen!0 (select (arr!34467 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9923 #b00000000000000000000000000000000)))))

(assert (=> b!1104363 (=> (not res!736792) (not e!630371))))

(declare-fun b!1104364 () Bool)

(declare-fun call!46345 () Bool)

(assert (=> b!1104364 (= e!630371 call!46345)))

(declare-fun bm!46342 () Bool)

(assert (=> bm!46342 (= call!46345 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1104365 () Bool)

(assert (=> b!1104365 (= e!630372 call!46345)))

(assert (= (and d!130889 (not res!736791)) b!1104362))

(assert (= (and b!1104362 c!108999) b!1104363))

(assert (= (and b!1104362 (not c!108999)) b!1104365))

(assert (= (and b!1104363 res!736792) b!1104364))

(assert (= (or b!1104364 b!1104365) bm!46342))

(assert (=> b!1104362 m!1024129))

(assert (=> b!1104362 m!1024129))

(assert (=> b!1104362 m!1024135))

(assert (=> b!1104363 m!1024129))

(declare-fun m!1024137 () Bool)

(assert (=> b!1104363 m!1024137))

(declare-fun m!1024139 () Bool)

(assert (=> b!1104363 m!1024139))

(assert (=> b!1104363 m!1024129))

(declare-fun m!1024141 () Bool)

(assert (=> b!1104363 m!1024141))

(declare-fun m!1024143 () Bool)

(assert (=> bm!46342 m!1024143))

(assert (=> b!1104280 d!130889))

(declare-fun d!130891 () Bool)

(declare-fun res!736793 () Bool)

(declare-fun e!630373 () Bool)

(assert (=> d!130891 (=> res!736793 e!630373)))

(assert (=> d!130891 (= res!736793 (bvsge #b00000000000000000000000000000000 (size!35003 (array!71626 (store (arr!34467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35003 _keys!1208)))))))

(assert (=> d!130891 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71626 (store (arr!34467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35003 _keys!1208)) mask!1564) e!630373)))

(declare-fun b!1104366 () Bool)

(declare-fun e!630375 () Bool)

(assert (=> b!1104366 (= e!630373 e!630375)))

(declare-fun c!109000 () Bool)

(assert (=> b!1104366 (= c!109000 (validKeyInArray!0 (select (arr!34467 (array!71626 (store (arr!34467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35003 _keys!1208))) #b00000000000000000000000000000000)))))

(declare-fun b!1104367 () Bool)

(declare-fun e!630374 () Bool)

(assert (=> b!1104367 (= e!630375 e!630374)))

(declare-fun lt!495127 () (_ BitVec 64))

(assert (=> b!1104367 (= lt!495127 (select (arr!34467 (array!71626 (store (arr!34467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35003 _keys!1208))) #b00000000000000000000000000000000))))

(declare-fun lt!495125 () Unit!36250)

(assert (=> b!1104367 (= lt!495125 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71626 (store (arr!34467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35003 _keys!1208)) lt!495127 #b00000000000000000000000000000000))))

(assert (=> b!1104367 (arrayContainsKey!0 (array!71626 (store (arr!34467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35003 _keys!1208)) lt!495127 #b00000000000000000000000000000000)))

(declare-fun lt!495126 () Unit!36250)

(assert (=> b!1104367 (= lt!495126 lt!495125)))

(declare-fun res!736794 () Bool)

(assert (=> b!1104367 (= res!736794 (= (seekEntryOrOpen!0 (select (arr!34467 (array!71626 (store (arr!34467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35003 _keys!1208))) #b00000000000000000000000000000000) (array!71626 (store (arr!34467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35003 _keys!1208)) mask!1564) (Found!9923 #b00000000000000000000000000000000)))))

(assert (=> b!1104367 (=> (not res!736794) (not e!630374))))

(declare-fun b!1104368 () Bool)

(declare-fun call!46346 () Bool)

(assert (=> b!1104368 (= e!630374 call!46346)))

(declare-fun bm!46343 () Bool)

(assert (=> bm!46343 (= call!46346 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!71626 (store (arr!34467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35003 _keys!1208)) mask!1564))))

(declare-fun b!1104369 () Bool)

(assert (=> b!1104369 (= e!630375 call!46346)))

(assert (= (and d!130891 (not res!736793)) b!1104366))

(assert (= (and b!1104366 c!109000) b!1104367))

(assert (= (and b!1104366 (not c!109000)) b!1104369))

(assert (= (and b!1104367 res!736794) b!1104368))

(assert (= (or b!1104368 b!1104369) bm!46343))

(declare-fun m!1024145 () Bool)

(assert (=> b!1104366 m!1024145))

(assert (=> b!1104366 m!1024145))

(declare-fun m!1024147 () Bool)

(assert (=> b!1104366 m!1024147))

(assert (=> b!1104367 m!1024145))

(declare-fun m!1024149 () Bool)

(assert (=> b!1104367 m!1024149))

(declare-fun m!1024151 () Bool)

(assert (=> b!1104367 m!1024151))

(assert (=> b!1104367 m!1024145))

(declare-fun m!1024153 () Bool)

(assert (=> b!1104367 m!1024153))

(declare-fun m!1024155 () Bool)

(assert (=> bm!46343 m!1024155))

(assert (=> b!1104289 d!130891))

(declare-fun d!130893 () Bool)

(declare-fun lt!495130 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!538 (List!24055) (InoxSet (_ BitVec 64)))

(assert (=> d!130893 (= lt!495130 (select (content!538 Nil!24052) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!630381 () Bool)

(assert (=> d!130893 (= lt!495130 e!630381)))

(declare-fun res!736799 () Bool)

(assert (=> d!130893 (=> (not res!736799) (not e!630381))))

(assert (=> d!130893 (= res!736799 ((_ is Cons!24051) Nil!24052))))

(assert (=> d!130893 (= (contains!6417 Nil!24052 #b1000000000000000000000000000000000000000000000000000000000000000) lt!495130)))

(declare-fun b!1104374 () Bool)

(declare-fun e!630380 () Bool)

(assert (=> b!1104374 (= e!630381 e!630380)))

(declare-fun res!736800 () Bool)

(assert (=> b!1104374 (=> res!736800 e!630380)))

(assert (=> b!1104374 (= res!736800 (= (h!25260 Nil!24052) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104375 () Bool)

(assert (=> b!1104375 (= e!630380 (contains!6417 (t!34320 Nil!24052) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130893 res!736799) b!1104374))

(assert (= (and b!1104374 (not res!736800)) b!1104375))

(declare-fun m!1024157 () Bool)

(assert (=> d!130893 m!1024157))

(declare-fun m!1024159 () Bool)

(assert (=> d!130893 m!1024159))

(declare-fun m!1024161 () Bool)

(assert (=> b!1104375 m!1024161))

(assert (=> b!1104288 d!130893))

(declare-fun d!130895 () Bool)

(declare-fun lt!495131 () Bool)

(assert (=> d!130895 (= lt!495131 (select (content!538 Nil!24052) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!630383 () Bool)

(assert (=> d!130895 (= lt!495131 e!630383)))

(declare-fun res!736801 () Bool)

(assert (=> d!130895 (=> (not res!736801) (not e!630383))))

(assert (=> d!130895 (= res!736801 ((_ is Cons!24051) Nil!24052))))

(assert (=> d!130895 (= (contains!6417 Nil!24052 #b0000000000000000000000000000000000000000000000000000000000000000) lt!495131)))

(declare-fun b!1104376 () Bool)

(declare-fun e!630382 () Bool)

(assert (=> b!1104376 (= e!630383 e!630382)))

(declare-fun res!736802 () Bool)

(assert (=> b!1104376 (=> res!736802 e!630382)))

(assert (=> b!1104376 (= res!736802 (= (h!25260 Nil!24052) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104377 () Bool)

(assert (=> b!1104377 (= e!630382 (contains!6417 (t!34320 Nil!24052) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130895 res!736801) b!1104376))

(assert (= (and b!1104376 (not res!736802)) b!1104377))

(assert (=> d!130895 m!1024157))

(declare-fun m!1024163 () Bool)

(assert (=> d!130895 m!1024163))

(declare-fun m!1024165 () Bool)

(assert (=> b!1104377 m!1024165))

(assert (=> b!1104283 d!130895))

(declare-fun d!130897 () Bool)

(assert (=> d!130897 (= (array_inv!26534 _keys!1208) (bvsge (size!35003 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97088 d!130897))

(declare-fun d!130899 () Bool)

(assert (=> d!130899 (= (array_inv!26535 _values!996) (bvsge (size!35004 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97088 d!130899))

(declare-fun d!130901 () Bool)

(declare-fun res!736807 () Bool)

(declare-fun e!630388 () Bool)

(assert (=> d!130901 (=> res!736807 e!630388)))

(assert (=> d!130901 (= res!736807 ((_ is Nil!24052) Nil!24052))))

(assert (=> d!130901 (= (noDuplicate!1589 Nil!24052) e!630388)))

(declare-fun b!1104382 () Bool)

(declare-fun e!630389 () Bool)

(assert (=> b!1104382 (= e!630388 e!630389)))

(declare-fun res!736808 () Bool)

(assert (=> b!1104382 (=> (not res!736808) (not e!630389))))

(assert (=> b!1104382 (= res!736808 (not (contains!6417 (t!34320 Nil!24052) (h!25260 Nil!24052))))))

(declare-fun b!1104383 () Bool)

(assert (=> b!1104383 (= e!630389 (noDuplicate!1589 (t!34320 Nil!24052)))))

(assert (= (and d!130901 (not res!736807)) b!1104382))

(assert (= (and b!1104382 res!736808) b!1104383))

(declare-fun m!1024167 () Bool)

(assert (=> b!1104382 m!1024167))

(declare-fun m!1024169 () Bool)

(assert (=> b!1104383 m!1024169))

(assert (=> b!1104279 d!130901))

(declare-fun d!130903 () Bool)

(assert (=> d!130903 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1104293 d!130903))

(declare-fun condMapEmpty!42844 () Bool)

(declare-fun mapDefault!42844 () ValueCell!12966)

(assert (=> mapNonEmpty!42838 (= condMapEmpty!42844 (= mapRest!42838 ((as const (Array (_ BitVec 32) ValueCell!12966)) mapDefault!42844)))))

(declare-fun e!630394 () Bool)

(declare-fun mapRes!42844 () Bool)

(assert (=> mapNonEmpty!42838 (= tp!81758 (and e!630394 mapRes!42844))))

(declare-fun mapNonEmpty!42844 () Bool)

(declare-fun tp!81764 () Bool)

(declare-fun e!630395 () Bool)

(assert (=> mapNonEmpty!42844 (= mapRes!42844 (and tp!81764 e!630395))))

(declare-fun mapRest!42844 () (Array (_ BitVec 32) ValueCell!12966))

(declare-fun mapValue!42844 () ValueCell!12966)

(declare-fun mapKey!42844 () (_ BitVec 32))

(assert (=> mapNonEmpty!42844 (= mapRest!42838 (store mapRest!42844 mapKey!42844 mapValue!42844))))

(declare-fun b!1104391 () Bool)

(assert (=> b!1104391 (= e!630394 tp_is_empty!27351)))

(declare-fun mapIsEmpty!42844 () Bool)

(assert (=> mapIsEmpty!42844 mapRes!42844))

(declare-fun b!1104390 () Bool)

(assert (=> b!1104390 (= e!630395 tp_is_empty!27351)))

(assert (= (and mapNonEmpty!42838 condMapEmpty!42844) mapIsEmpty!42844))

(assert (= (and mapNonEmpty!42838 (not condMapEmpty!42844)) mapNonEmpty!42844))

(assert (= (and mapNonEmpty!42844 ((_ is ValueCellFull!12966) mapValue!42844)) b!1104390))

(assert (= (and mapNonEmpty!42838 ((_ is ValueCellFull!12966) mapDefault!42844)) b!1104391))

(declare-fun m!1024171 () Bool)

(assert (=> mapNonEmpty!42844 m!1024171))

(check-sat (not d!130893) (not b!1104367) tp_is_empty!27351 (not b!1104377) (not b!1104375) (not bm!46343) (not mapNonEmpty!42844) (not bm!46339) (not b!1104383) (not b!1104366) (not b!1104352) (not b!1104362) (not bm!46342) (not d!130895) (not b!1104363) (not b!1104350) (not b!1104353) (not b!1104382))
(check-sat)
