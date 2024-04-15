; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97080 () Bool)

(assert start!97080)

(declare-fun mapIsEmpty!42835 () Bool)

(declare-fun mapRes!42835 () Bool)

(assert (=> mapIsEmpty!42835 mapRes!42835))

(declare-fun res!736633 () Bool)

(declare-fun e!630221 () Bool)

(assert (=> start!97080 (=> (not res!736633) (not e!630221))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71532 0))(
  ( (array!71533 (arr!34421 (Array (_ BitVec 32) (_ BitVec 64))) (size!34959 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71532)

(assert (=> start!97080 (= res!736633 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34959 _keys!1208))))))

(assert (=> start!97080 e!630221))

(declare-fun array_inv!26546 (array!71532) Bool)

(assert (=> start!97080 (array_inv!26546 _keys!1208)))

(assert (=> start!97080 true))

(declare-datatypes ((V!41593 0))(
  ( (V!41594 (val!13731 Int)) )
))
(declare-datatypes ((ValueCell!12965 0))(
  ( (ValueCellFull!12965 (v!16362 V!41593)) (EmptyCell!12965) )
))
(declare-datatypes ((array!71534 0))(
  ( (array!71535 (arr!34422 (Array (_ BitVec 32) ValueCell!12965)) (size!34960 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71534)

(declare-fun e!630220 () Bool)

(declare-fun array_inv!26547 (array!71534) Bool)

(assert (=> start!97080 (and (array_inv!26547 _values!996) e!630220)))

(declare-fun b!1104081 () Bool)

(declare-fun res!736636 () Bool)

(assert (=> b!1104081 (=> (not res!736636) (not e!630221))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104081 (= res!736636 (validMask!0 mask!1564))))

(declare-fun b!1104082 () Bool)

(declare-fun e!630218 () Bool)

(declare-fun tp_is_empty!27349 () Bool)

(assert (=> b!1104082 (= e!630218 tp_is_empty!27349)))

(declare-fun b!1104083 () Bool)

(declare-fun res!736632 () Bool)

(assert (=> b!1104083 (=> (not res!736632) (not e!630221))))

(declare-datatypes ((List!24085 0))(
  ( (Nil!24082) (Cons!24081 (h!25290 (_ BitVec 64)) (t!34341 List!24085)) )
))
(declare-fun arrayNoDuplicates!0 (array!71532 (_ BitVec 32) List!24085) Bool)

(assert (=> b!1104083 (= res!736632 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24082))))

(declare-fun b!1104084 () Bool)

(declare-fun res!736626 () Bool)

(assert (=> b!1104084 (=> (not res!736626) (not e!630221))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71532 (_ BitVec 32)) Bool)

(assert (=> b!1104084 (= res!736626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71533 (store (arr!34421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34959 _keys!1208)) mask!1564))))

(declare-fun b!1104085 () Bool)

(declare-fun res!736635 () Bool)

(assert (=> b!1104085 (=> (not res!736635) (not e!630221))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104085 (= res!736635 (and (= (size!34960 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34959 _keys!1208) (size!34960 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42835 () Bool)

(declare-fun tp!81755 () Bool)

(declare-fun e!630219 () Bool)

(assert (=> mapNonEmpty!42835 (= mapRes!42835 (and tp!81755 e!630219))))

(declare-fun mapRest!42835 () (Array (_ BitVec 32) ValueCell!12965))

(declare-fun mapKey!42835 () (_ BitVec 32))

(declare-fun mapValue!42835 () ValueCell!12965)

(assert (=> mapNonEmpty!42835 (= (arr!34422 _values!996) (store mapRest!42835 mapKey!42835 mapValue!42835))))

(declare-fun b!1104086 () Bool)

(declare-fun res!736634 () Bool)

(assert (=> b!1104086 (=> (not res!736634) (not e!630221))))

(assert (=> b!1104086 (= res!736634 (and (bvsle #b00000000000000000000000000000000 (size!34959 _keys!1208)) (bvslt (size!34959 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1104087 () Bool)

(declare-fun res!736628 () Bool)

(assert (=> b!1104087 (=> (not res!736628) (not e!630221))))

(declare-fun noDuplicate!1598 (List!24085) Bool)

(assert (=> b!1104087 (= res!736628 (noDuplicate!1598 Nil!24082))))

(declare-fun b!1104088 () Bool)

(declare-fun res!736630 () Bool)

(assert (=> b!1104088 (=> (not res!736630) (not e!630221))))

(assert (=> b!1104088 (= res!736630 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34959 _keys!1208))))))

(declare-fun b!1104089 () Bool)

(assert (=> b!1104089 (= e!630220 (and e!630218 mapRes!42835))))

(declare-fun condMapEmpty!42835 () Bool)

(declare-fun mapDefault!42835 () ValueCell!12965)

(assert (=> b!1104089 (= condMapEmpty!42835 (= (arr!34422 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12965)) mapDefault!42835)))))

(declare-fun b!1104090 () Bool)

(declare-fun res!736627 () Bool)

(assert (=> b!1104090 (=> (not res!736627) (not e!630221))))

(assert (=> b!1104090 (= res!736627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104091 () Bool)

(declare-fun res!736625 () Bool)

(assert (=> b!1104091 (=> (not res!736625) (not e!630221))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1104091 (= res!736625 (= (select (arr!34421 _keys!1208) i!673) k0!934))))

(declare-fun b!1104092 () Bool)

(declare-fun e!630222 () Bool)

(declare-fun contains!6385 (List!24085 (_ BitVec 64)) Bool)

(assert (=> b!1104092 (= e!630222 (contains!6385 Nil!24082 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104093 () Bool)

(assert (=> b!1104093 (= e!630221 e!630222)))

(declare-fun res!736629 () Bool)

(assert (=> b!1104093 (=> res!736629 e!630222)))

(assert (=> b!1104093 (= res!736629 (contains!6385 Nil!24082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104094 () Bool)

(declare-fun res!736631 () Bool)

(assert (=> b!1104094 (=> (not res!736631) (not e!630221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104094 (= res!736631 (validKeyInArray!0 k0!934))))

(declare-fun b!1104095 () Bool)

(assert (=> b!1104095 (= e!630219 tp_is_empty!27349)))

(assert (= (and start!97080 res!736633) b!1104081))

(assert (= (and b!1104081 res!736636) b!1104085))

(assert (= (and b!1104085 res!736635) b!1104090))

(assert (= (and b!1104090 res!736627) b!1104083))

(assert (= (and b!1104083 res!736632) b!1104088))

(assert (= (and b!1104088 res!736630) b!1104094))

(assert (= (and b!1104094 res!736631) b!1104091))

(assert (= (and b!1104091 res!736625) b!1104084))

(assert (= (and b!1104084 res!736626) b!1104086))

(assert (= (and b!1104086 res!736634) b!1104087))

(assert (= (and b!1104087 res!736628) b!1104093))

(assert (= (and b!1104093 (not res!736629)) b!1104092))

(assert (= (and b!1104089 condMapEmpty!42835) mapIsEmpty!42835))

(assert (= (and b!1104089 (not condMapEmpty!42835)) mapNonEmpty!42835))

(get-info :version)

(assert (= (and mapNonEmpty!42835 ((_ is ValueCellFull!12965) mapValue!42835)) b!1104095))

(assert (= (and b!1104089 ((_ is ValueCellFull!12965) mapDefault!42835)) b!1104082))

(assert (= start!97080 b!1104089))

(declare-fun m!1023425 () Bool)

(assert (=> b!1104093 m!1023425))

(declare-fun m!1023427 () Bool)

(assert (=> b!1104084 m!1023427))

(declare-fun m!1023429 () Bool)

(assert (=> b!1104084 m!1023429))

(declare-fun m!1023431 () Bool)

(assert (=> b!1104083 m!1023431))

(declare-fun m!1023433 () Bool)

(assert (=> b!1104091 m!1023433))

(declare-fun m!1023435 () Bool)

(assert (=> b!1104094 m!1023435))

(declare-fun m!1023437 () Bool)

(assert (=> b!1104081 m!1023437))

(declare-fun m!1023439 () Bool)

(assert (=> start!97080 m!1023439))

(declare-fun m!1023441 () Bool)

(assert (=> start!97080 m!1023441))

(declare-fun m!1023443 () Bool)

(assert (=> b!1104087 m!1023443))

(declare-fun m!1023445 () Bool)

(assert (=> mapNonEmpty!42835 m!1023445))

(declare-fun m!1023447 () Bool)

(assert (=> b!1104092 m!1023447))

(declare-fun m!1023449 () Bool)

(assert (=> b!1104090 m!1023449))

(check-sat (not b!1104087) (not b!1104081) (not mapNonEmpty!42835) (not b!1104093) (not b!1104083) (not start!97080) (not b!1104092) (not b!1104084) (not b!1104094) (not b!1104090) tp_is_empty!27349)
(check-sat)
(get-model)

(declare-fun b!1104194 () Bool)

(declare-fun e!630267 () Bool)

(declare-fun call!46319 () Bool)

(assert (=> b!1104194 (= e!630267 call!46319)))

(declare-fun bm!46316 () Bool)

(assert (=> bm!46316 (= call!46319 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1104195 () Bool)

(declare-fun e!630265 () Bool)

(assert (=> b!1104195 (= e!630265 call!46319)))

(declare-fun d!130729 () Bool)

(declare-fun res!736713 () Bool)

(declare-fun e!630266 () Bool)

(assert (=> d!130729 (=> res!736713 e!630266)))

(assert (=> d!130729 (= res!736713 (bvsge #b00000000000000000000000000000000 (size!34959 _keys!1208)))))

(assert (=> d!130729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!630266)))

(declare-fun b!1104196 () Bool)

(assert (=> b!1104196 (= e!630266 e!630265)))

(declare-fun c!108957 () Bool)

(assert (=> b!1104196 (= c!108957 (validKeyInArray!0 (select (arr!34421 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104197 () Bool)

(assert (=> b!1104197 (= e!630265 e!630267)))

(declare-fun lt!494923 () (_ BitVec 64))

(assert (=> b!1104197 (= lt!494923 (select (arr!34421 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36071 0))(
  ( (Unit!36072) )
))
(declare-fun lt!494924 () Unit!36071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71532 (_ BitVec 64) (_ BitVec 32)) Unit!36071)

(assert (=> b!1104197 (= lt!494924 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!494923 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104197 (arrayContainsKey!0 _keys!1208 lt!494923 #b00000000000000000000000000000000)))

(declare-fun lt!494922 () Unit!36071)

(assert (=> b!1104197 (= lt!494922 lt!494924)))

(declare-fun res!736714 () Bool)

(declare-datatypes ((SeekEntryResult!9922 0))(
  ( (MissingZero!9922 (index!42059 (_ BitVec 32))) (Found!9922 (index!42060 (_ BitVec 32))) (Intermediate!9922 (undefined!10734 Bool) (index!42061 (_ BitVec 32)) (x!99318 (_ BitVec 32))) (Undefined!9922) (MissingVacant!9922 (index!42062 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71532 (_ BitVec 32)) SeekEntryResult!9922)

(assert (=> b!1104197 (= res!736714 (= (seekEntryOrOpen!0 (select (arr!34421 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9922 #b00000000000000000000000000000000)))))

(assert (=> b!1104197 (=> (not res!736714) (not e!630267))))

(assert (= (and d!130729 (not res!736713)) b!1104196))

(assert (= (and b!1104196 c!108957) b!1104197))

(assert (= (and b!1104196 (not c!108957)) b!1104195))

(assert (= (and b!1104197 res!736714) b!1104194))

(assert (= (or b!1104194 b!1104195) bm!46316))

(declare-fun m!1023503 () Bool)

(assert (=> bm!46316 m!1023503))

(declare-fun m!1023505 () Bool)

(assert (=> b!1104196 m!1023505))

(assert (=> b!1104196 m!1023505))

(declare-fun m!1023507 () Bool)

(assert (=> b!1104196 m!1023507))

(assert (=> b!1104197 m!1023505))

(declare-fun m!1023509 () Bool)

(assert (=> b!1104197 m!1023509))

(declare-fun m!1023511 () Bool)

(assert (=> b!1104197 m!1023511))

(assert (=> b!1104197 m!1023505))

(declare-fun m!1023513 () Bool)

(assert (=> b!1104197 m!1023513))

(assert (=> b!1104090 d!130729))

(declare-fun d!130731 () Bool)

(assert (=> d!130731 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1104081 d!130731))

(declare-fun d!130733 () Bool)

(declare-fun lt!494927 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!537 (List!24085) (InoxSet (_ BitVec 64)))

(assert (=> d!130733 (= lt!494927 (select (content!537 Nil!24082) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!630272 () Bool)

(assert (=> d!130733 (= lt!494927 e!630272)))

(declare-fun res!736719 () Bool)

(assert (=> d!130733 (=> (not res!736719) (not e!630272))))

(assert (=> d!130733 (= res!736719 ((_ is Cons!24081) Nil!24082))))

(assert (=> d!130733 (= (contains!6385 Nil!24082 #b1000000000000000000000000000000000000000000000000000000000000000) lt!494927)))

(declare-fun b!1104202 () Bool)

(declare-fun e!630273 () Bool)

(assert (=> b!1104202 (= e!630272 e!630273)))

(declare-fun res!736720 () Bool)

(assert (=> b!1104202 (=> res!736720 e!630273)))

(assert (=> b!1104202 (= res!736720 (= (h!25290 Nil!24082) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104203 () Bool)

(assert (=> b!1104203 (= e!630273 (contains!6385 (t!34341 Nil!24082) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130733 res!736719) b!1104202))

(assert (= (and b!1104202 (not res!736720)) b!1104203))

(declare-fun m!1023515 () Bool)

(assert (=> d!130733 m!1023515))

(declare-fun m!1023517 () Bool)

(assert (=> d!130733 m!1023517))

(declare-fun m!1023519 () Bool)

(assert (=> b!1104203 m!1023519))

(assert (=> b!1104092 d!130733))

(declare-fun d!130735 () Bool)

(declare-fun res!736725 () Bool)

(declare-fun e!630278 () Bool)

(assert (=> d!130735 (=> res!736725 e!630278)))

(assert (=> d!130735 (= res!736725 ((_ is Nil!24082) Nil!24082))))

(assert (=> d!130735 (= (noDuplicate!1598 Nil!24082) e!630278)))

(declare-fun b!1104208 () Bool)

(declare-fun e!630279 () Bool)

(assert (=> b!1104208 (= e!630278 e!630279)))

(declare-fun res!736726 () Bool)

(assert (=> b!1104208 (=> (not res!736726) (not e!630279))))

(assert (=> b!1104208 (= res!736726 (not (contains!6385 (t!34341 Nil!24082) (h!25290 Nil!24082))))))

(declare-fun b!1104209 () Bool)

(assert (=> b!1104209 (= e!630279 (noDuplicate!1598 (t!34341 Nil!24082)))))

(assert (= (and d!130735 (not res!736725)) b!1104208))

(assert (= (and b!1104208 res!736726) b!1104209))

(declare-fun m!1023521 () Bool)

(assert (=> b!1104208 m!1023521))

(declare-fun m!1023523 () Bool)

(assert (=> b!1104209 m!1023523))

(assert (=> b!1104087 d!130735))

(declare-fun bm!46319 () Bool)

(declare-fun call!46322 () Bool)

(declare-fun c!108960 () Bool)

(assert (=> bm!46319 (= call!46322 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108960 (Cons!24081 (select (arr!34421 _keys!1208) #b00000000000000000000000000000000) Nil!24082) Nil!24082)))))

(declare-fun b!1104220 () Bool)

(declare-fun e!630289 () Bool)

(assert (=> b!1104220 (= e!630289 call!46322)))

(declare-fun b!1104221 () Bool)

(assert (=> b!1104221 (= e!630289 call!46322)))

(declare-fun b!1104222 () Bool)

(declare-fun e!630290 () Bool)

(assert (=> b!1104222 (= e!630290 e!630289)))

(assert (=> b!1104222 (= c!108960 (validKeyInArray!0 (select (arr!34421 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104223 () Bool)

(declare-fun e!630288 () Bool)

(assert (=> b!1104223 (= e!630288 e!630290)))

(declare-fun res!736735 () Bool)

(assert (=> b!1104223 (=> (not res!736735) (not e!630290))))

(declare-fun e!630291 () Bool)

(assert (=> b!1104223 (= res!736735 (not e!630291))))

(declare-fun res!736733 () Bool)

(assert (=> b!1104223 (=> (not res!736733) (not e!630291))))

(assert (=> b!1104223 (= res!736733 (validKeyInArray!0 (select (arr!34421 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!130737 () Bool)

(declare-fun res!736734 () Bool)

(assert (=> d!130737 (=> res!736734 e!630288)))

(assert (=> d!130737 (= res!736734 (bvsge #b00000000000000000000000000000000 (size!34959 _keys!1208)))))

(assert (=> d!130737 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24082) e!630288)))

(declare-fun b!1104224 () Bool)

(assert (=> b!1104224 (= e!630291 (contains!6385 Nil!24082 (select (arr!34421 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!130737 (not res!736734)) b!1104223))

(assert (= (and b!1104223 res!736733) b!1104224))

(assert (= (and b!1104223 res!736735) b!1104222))

(assert (= (and b!1104222 c!108960) b!1104220))

(assert (= (and b!1104222 (not c!108960)) b!1104221))

(assert (= (or b!1104220 b!1104221) bm!46319))

(assert (=> bm!46319 m!1023505))

(declare-fun m!1023525 () Bool)

(assert (=> bm!46319 m!1023525))

(assert (=> b!1104222 m!1023505))

(assert (=> b!1104222 m!1023505))

(assert (=> b!1104222 m!1023507))

(assert (=> b!1104223 m!1023505))

(assert (=> b!1104223 m!1023505))

(assert (=> b!1104223 m!1023507))

(assert (=> b!1104224 m!1023505))

(assert (=> b!1104224 m!1023505))

(declare-fun m!1023527 () Bool)

(assert (=> b!1104224 m!1023527))

(assert (=> b!1104083 d!130737))

(declare-fun d!130739 () Bool)

(declare-fun lt!494928 () Bool)

(assert (=> d!130739 (= lt!494928 (select (content!537 Nil!24082) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!630292 () Bool)

(assert (=> d!130739 (= lt!494928 e!630292)))

(declare-fun res!736736 () Bool)

(assert (=> d!130739 (=> (not res!736736) (not e!630292))))

(assert (=> d!130739 (= res!736736 ((_ is Cons!24081) Nil!24082))))

(assert (=> d!130739 (= (contains!6385 Nil!24082 #b0000000000000000000000000000000000000000000000000000000000000000) lt!494928)))

(declare-fun b!1104225 () Bool)

(declare-fun e!630293 () Bool)

(assert (=> b!1104225 (= e!630292 e!630293)))

(declare-fun res!736737 () Bool)

(assert (=> b!1104225 (=> res!736737 e!630293)))

(assert (=> b!1104225 (= res!736737 (= (h!25290 Nil!24082) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104226 () Bool)

(assert (=> b!1104226 (= e!630293 (contains!6385 (t!34341 Nil!24082) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130739 res!736736) b!1104225))

(assert (= (and b!1104225 (not res!736737)) b!1104226))

(assert (=> d!130739 m!1023515))

(declare-fun m!1023529 () Bool)

(assert (=> d!130739 m!1023529))

(declare-fun m!1023531 () Bool)

(assert (=> b!1104226 m!1023531))

(assert (=> b!1104093 d!130739))

(declare-fun b!1104227 () Bool)

(declare-fun e!630296 () Bool)

(declare-fun call!46323 () Bool)

(assert (=> b!1104227 (= e!630296 call!46323)))

(declare-fun bm!46320 () Bool)

(assert (=> bm!46320 (= call!46323 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!71533 (store (arr!34421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34959 _keys!1208)) mask!1564))))

(declare-fun b!1104228 () Bool)

(declare-fun e!630294 () Bool)

(assert (=> b!1104228 (= e!630294 call!46323)))

(declare-fun d!130741 () Bool)

(declare-fun res!736738 () Bool)

(declare-fun e!630295 () Bool)

(assert (=> d!130741 (=> res!736738 e!630295)))

(assert (=> d!130741 (= res!736738 (bvsge #b00000000000000000000000000000000 (size!34959 (array!71533 (store (arr!34421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34959 _keys!1208)))))))

(assert (=> d!130741 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71533 (store (arr!34421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34959 _keys!1208)) mask!1564) e!630295)))

(declare-fun b!1104229 () Bool)

(assert (=> b!1104229 (= e!630295 e!630294)))

(declare-fun c!108961 () Bool)

(assert (=> b!1104229 (= c!108961 (validKeyInArray!0 (select (arr!34421 (array!71533 (store (arr!34421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34959 _keys!1208))) #b00000000000000000000000000000000)))))

(declare-fun b!1104230 () Bool)

(assert (=> b!1104230 (= e!630294 e!630296)))

(declare-fun lt!494930 () (_ BitVec 64))

(assert (=> b!1104230 (= lt!494930 (select (arr!34421 (array!71533 (store (arr!34421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34959 _keys!1208))) #b00000000000000000000000000000000))))

(declare-fun lt!494931 () Unit!36071)

(assert (=> b!1104230 (= lt!494931 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71533 (store (arr!34421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34959 _keys!1208)) lt!494930 #b00000000000000000000000000000000))))

(assert (=> b!1104230 (arrayContainsKey!0 (array!71533 (store (arr!34421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34959 _keys!1208)) lt!494930 #b00000000000000000000000000000000)))

(declare-fun lt!494929 () Unit!36071)

(assert (=> b!1104230 (= lt!494929 lt!494931)))

(declare-fun res!736739 () Bool)

(assert (=> b!1104230 (= res!736739 (= (seekEntryOrOpen!0 (select (arr!34421 (array!71533 (store (arr!34421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34959 _keys!1208))) #b00000000000000000000000000000000) (array!71533 (store (arr!34421 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34959 _keys!1208)) mask!1564) (Found!9922 #b00000000000000000000000000000000)))))

(assert (=> b!1104230 (=> (not res!736739) (not e!630296))))

(assert (= (and d!130741 (not res!736738)) b!1104229))

(assert (= (and b!1104229 c!108961) b!1104230))

(assert (= (and b!1104229 (not c!108961)) b!1104228))

(assert (= (and b!1104230 res!736739) b!1104227))

(assert (= (or b!1104227 b!1104228) bm!46320))

(declare-fun m!1023533 () Bool)

(assert (=> bm!46320 m!1023533))

(declare-fun m!1023535 () Bool)

(assert (=> b!1104229 m!1023535))

(assert (=> b!1104229 m!1023535))

(declare-fun m!1023537 () Bool)

(assert (=> b!1104229 m!1023537))

(assert (=> b!1104230 m!1023535))

(declare-fun m!1023539 () Bool)

(assert (=> b!1104230 m!1023539))

(declare-fun m!1023541 () Bool)

(assert (=> b!1104230 m!1023541))

(assert (=> b!1104230 m!1023535))

(declare-fun m!1023543 () Bool)

(assert (=> b!1104230 m!1023543))

(assert (=> b!1104084 d!130741))

(declare-fun d!130743 () Bool)

(assert (=> d!130743 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1104094 d!130743))

(declare-fun d!130745 () Bool)

(assert (=> d!130745 (= (array_inv!26546 _keys!1208) (bvsge (size!34959 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97080 d!130745))

(declare-fun d!130747 () Bool)

(assert (=> d!130747 (= (array_inv!26547 _values!996) (bvsge (size!34960 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97080 d!130747))

(declare-fun mapIsEmpty!42844 () Bool)

(declare-fun mapRes!42844 () Bool)

(assert (=> mapIsEmpty!42844 mapRes!42844))

(declare-fun mapNonEmpty!42844 () Bool)

(declare-fun tp!81764 () Bool)

(declare-fun e!630301 () Bool)

(assert (=> mapNonEmpty!42844 (= mapRes!42844 (and tp!81764 e!630301))))

(declare-fun mapRest!42844 () (Array (_ BitVec 32) ValueCell!12965))

(declare-fun mapValue!42844 () ValueCell!12965)

(declare-fun mapKey!42844 () (_ BitVec 32))

(assert (=> mapNonEmpty!42844 (= mapRest!42835 (store mapRest!42844 mapKey!42844 mapValue!42844))))

(declare-fun condMapEmpty!42844 () Bool)

(declare-fun mapDefault!42844 () ValueCell!12965)

(assert (=> mapNonEmpty!42835 (= condMapEmpty!42844 (= mapRest!42835 ((as const (Array (_ BitVec 32) ValueCell!12965)) mapDefault!42844)))))

(declare-fun e!630302 () Bool)

(assert (=> mapNonEmpty!42835 (= tp!81755 (and e!630302 mapRes!42844))))

(declare-fun b!1104238 () Bool)

(assert (=> b!1104238 (= e!630302 tp_is_empty!27349)))

(declare-fun b!1104237 () Bool)

(assert (=> b!1104237 (= e!630301 tp_is_empty!27349)))

(assert (= (and mapNonEmpty!42835 condMapEmpty!42844) mapIsEmpty!42844))

(assert (= (and mapNonEmpty!42835 (not condMapEmpty!42844)) mapNonEmpty!42844))

(assert (= (and mapNonEmpty!42844 ((_ is ValueCellFull!12965) mapValue!42844)) b!1104237))

(assert (= (and mapNonEmpty!42835 ((_ is ValueCellFull!12965) mapDefault!42844)) b!1104238))

(declare-fun m!1023545 () Bool)

(assert (=> mapNonEmpty!42844 m!1023545))

(check-sat (not b!1104224) (not b!1104223) (not b!1104229) (not b!1104226) tp_is_empty!27349 (not bm!46316) (not d!130733) (not bm!46320) (not b!1104203) (not mapNonEmpty!42844) (not b!1104208) (not b!1104230) (not b!1104196) (not d!130739) (not b!1104209) (not b!1104197) (not bm!46319) (not b!1104222))
(check-sat)
