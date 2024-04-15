; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96994 () Bool)

(assert start!96994)

(declare-fun b!1103224 () Bool)

(declare-fun e!629756 () Bool)

(declare-datatypes ((List!24068 0))(
  ( (Nil!24065) (Cons!24064 (h!25273 (_ BitVec 64)) (t!34324 List!24068)) )
))
(declare-fun contains!6382 (List!24068 (_ BitVec 64)) Bool)

(assert (=> b!1103224 (= e!629756 (contains!6382 Nil!24065 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103225 () Bool)

(declare-fun e!629754 () Bool)

(declare-fun tp_is_empty!27301 () Bool)

(assert (=> b!1103225 (= e!629754 tp_is_empty!27301)))

(declare-fun res!736045 () Bool)

(declare-fun e!629755 () Bool)

(assert (=> start!96994 (=> (not res!736045) (not e!629755))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71434 0))(
  ( (array!71435 (arr!34375 (Array (_ BitVec 32) (_ BitVec 64))) (size!34913 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71434)

(assert (=> start!96994 (= res!736045 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34913 _keys!1208))))))

(assert (=> start!96994 e!629755))

(declare-fun array_inv!26508 (array!71434) Bool)

(assert (=> start!96994 (array_inv!26508 _keys!1208)))

(assert (=> start!96994 true))

(declare-datatypes ((V!41529 0))(
  ( (V!41530 (val!13707 Int)) )
))
(declare-datatypes ((ValueCell!12941 0))(
  ( (ValueCellFull!12941 (v!16337 V!41529)) (EmptyCell!12941) )
))
(declare-datatypes ((array!71436 0))(
  ( (array!71437 (arr!34376 (Array (_ BitVec 32) ValueCell!12941)) (size!34914 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71436)

(declare-fun e!629758 () Bool)

(declare-fun array_inv!26509 (array!71436) Bool)

(assert (=> start!96994 (and (array_inv!26509 _values!996) e!629758)))

(declare-fun mapNonEmpty!42754 () Bool)

(declare-fun mapRes!42754 () Bool)

(declare-fun tp!81674 () Bool)

(assert (=> mapNonEmpty!42754 (= mapRes!42754 (and tp!81674 e!629754))))

(declare-fun mapKey!42754 () (_ BitVec 32))

(declare-fun mapRest!42754 () (Array (_ BitVec 32) ValueCell!12941))

(declare-fun mapValue!42754 () ValueCell!12941)

(assert (=> mapNonEmpty!42754 (= (arr!34376 _values!996) (store mapRest!42754 mapKey!42754 mapValue!42754))))

(declare-fun b!1103226 () Bool)

(declare-fun res!736047 () Bool)

(assert (=> b!1103226 (=> (not res!736047) (not e!629755))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71434 (_ BitVec 32)) Bool)

(assert (=> b!1103226 (= res!736047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!42754 () Bool)

(assert (=> mapIsEmpty!42754 mapRes!42754))

(declare-fun b!1103227 () Bool)

(declare-fun res!736043 () Bool)

(assert (=> b!1103227 (=> (not res!736043) (not e!629755))))

(assert (=> b!1103227 (= res!736043 (and (bvsle #b00000000000000000000000000000000 (size!34913 _keys!1208)) (bvslt (size!34913 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1103228 () Bool)

(assert (=> b!1103228 (= e!629755 e!629756)))

(declare-fun res!736046 () Bool)

(assert (=> b!1103228 (=> res!736046 e!629756)))

(assert (=> b!1103228 (= res!736046 (contains!6382 Nil!24065 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103229 () Bool)

(declare-fun e!629753 () Bool)

(assert (=> b!1103229 (= e!629753 tp_is_empty!27301)))

(declare-fun b!1103230 () Bool)

(declare-fun res!736048 () Bool)

(assert (=> b!1103230 (=> (not res!736048) (not e!629755))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103230 (= res!736048 (and (= (size!34914 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34913 _keys!1208) (size!34914 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103231 () Bool)

(declare-fun res!736042 () Bool)

(assert (=> b!1103231 (=> (not res!736042) (not e!629755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103231 (= res!736042 (validMask!0 mask!1564))))

(declare-fun b!1103232 () Bool)

(assert (=> b!1103232 (= e!629758 (and e!629753 mapRes!42754))))

(declare-fun condMapEmpty!42754 () Bool)

(declare-fun mapDefault!42754 () ValueCell!12941)

(assert (=> b!1103232 (= condMapEmpty!42754 (= (arr!34376 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12941)) mapDefault!42754)))))

(declare-fun b!1103233 () Bool)

(declare-fun res!736044 () Bool)

(assert (=> b!1103233 (=> (not res!736044) (not e!629755))))

(declare-fun noDuplicate!1593 (List!24068) Bool)

(assert (=> b!1103233 (= res!736044 (noDuplicate!1593 Nil!24065))))

(assert (= (and start!96994 res!736045) b!1103231))

(assert (= (and b!1103231 res!736042) b!1103230))

(assert (= (and b!1103230 res!736048) b!1103226))

(assert (= (and b!1103226 res!736047) b!1103227))

(assert (= (and b!1103227 res!736043) b!1103233))

(assert (= (and b!1103233 res!736044) b!1103228))

(assert (= (and b!1103228 (not res!736046)) b!1103224))

(assert (= (and b!1103232 condMapEmpty!42754) mapIsEmpty!42754))

(assert (= (and b!1103232 (not condMapEmpty!42754)) mapNonEmpty!42754))

(get-info :version)

(assert (= (and mapNonEmpty!42754 ((_ is ValueCellFull!12941) mapValue!42754)) b!1103225))

(assert (= (and b!1103232 ((_ is ValueCellFull!12941) mapDefault!42754)) b!1103229))

(assert (= start!96994 b!1103232))

(declare-fun m!1022931 () Bool)

(assert (=> mapNonEmpty!42754 m!1022931))

(declare-fun m!1022933 () Bool)

(assert (=> b!1103226 m!1022933))

(declare-fun m!1022935 () Bool)

(assert (=> b!1103224 m!1022935))

(declare-fun m!1022937 () Bool)

(assert (=> start!96994 m!1022937))

(declare-fun m!1022939 () Bool)

(assert (=> start!96994 m!1022939))

(declare-fun m!1022941 () Bool)

(assert (=> b!1103233 m!1022941))

(declare-fun m!1022943 () Bool)

(assert (=> b!1103231 m!1022943))

(declare-fun m!1022945 () Bool)

(assert (=> b!1103228 m!1022945))

(check-sat (not b!1103233) (not start!96994) tp_is_empty!27301 (not b!1103231) (not b!1103228) (not b!1103226) (not mapNonEmpty!42754) (not b!1103224))
(check-sat)
(get-model)

(declare-fun d!130669 () Bool)

(assert (=> d!130669 (= (array_inv!26508 _keys!1208) (bvsge (size!34913 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!96994 d!130669))

(declare-fun d!130671 () Bool)

(assert (=> d!130671 (= (array_inv!26509 _values!996) (bvsge (size!34914 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!96994 d!130671))

(declare-fun d!130673 () Bool)

(assert (=> d!130673 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1103231 d!130673))

(declare-fun b!1103302 () Bool)

(declare-fun e!629802 () Bool)

(declare-fun call!46302 () Bool)

(assert (=> b!1103302 (= e!629802 call!46302)))

(declare-fun b!1103303 () Bool)

(declare-fun e!629803 () Bool)

(assert (=> b!1103303 (= e!629803 call!46302)))

(declare-fun b!1103304 () Bool)

(assert (=> b!1103304 (= e!629802 e!629803)))

(declare-fun lt!494867 () (_ BitVec 64))

(assert (=> b!1103304 (= lt!494867 (select (arr!34375 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36065 0))(
  ( (Unit!36066) )
))
(declare-fun lt!494868 () Unit!36065)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71434 (_ BitVec 64) (_ BitVec 32)) Unit!36065)

(assert (=> b!1103304 (= lt!494868 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!494867 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103304 (arrayContainsKey!0 _keys!1208 lt!494867 #b00000000000000000000000000000000)))

(declare-fun lt!494869 () Unit!36065)

(assert (=> b!1103304 (= lt!494869 lt!494868)))

(declare-fun res!736095 () Bool)

(declare-datatypes ((SeekEntryResult!9919 0))(
  ( (MissingZero!9919 (index!42047 (_ BitVec 32))) (Found!9919 (index!42048 (_ BitVec 32))) (Intermediate!9919 (undefined!10731 Bool) (index!42049 (_ BitVec 32)) (x!99245 (_ BitVec 32))) (Undefined!9919) (MissingVacant!9919 (index!42050 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71434 (_ BitVec 32)) SeekEntryResult!9919)

(assert (=> b!1103304 (= res!736095 (= (seekEntryOrOpen!0 (select (arr!34375 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9919 #b00000000000000000000000000000000)))))

(assert (=> b!1103304 (=> (not res!736095) (not e!629803))))

(declare-fun b!1103305 () Bool)

(declare-fun e!629801 () Bool)

(assert (=> b!1103305 (= e!629801 e!629802)))

(declare-fun c!108940 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103305 (= c!108940 (validKeyInArray!0 (select (arr!34375 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!46299 () Bool)

(assert (=> bm!46299 (= call!46302 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!130675 () Bool)

(declare-fun res!736096 () Bool)

(assert (=> d!130675 (=> res!736096 e!629801)))

(assert (=> d!130675 (= res!736096 (bvsge #b00000000000000000000000000000000 (size!34913 _keys!1208)))))

(assert (=> d!130675 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!629801)))

(assert (= (and d!130675 (not res!736096)) b!1103305))

(assert (= (and b!1103305 c!108940) b!1103304))

(assert (= (and b!1103305 (not c!108940)) b!1103302))

(assert (= (and b!1103304 res!736095) b!1103303))

(assert (= (or b!1103303 b!1103302) bm!46299))

(declare-fun m!1022979 () Bool)

(assert (=> b!1103304 m!1022979))

(declare-fun m!1022981 () Bool)

(assert (=> b!1103304 m!1022981))

(declare-fun m!1022983 () Bool)

(assert (=> b!1103304 m!1022983))

(assert (=> b!1103304 m!1022979))

(declare-fun m!1022985 () Bool)

(assert (=> b!1103304 m!1022985))

(assert (=> b!1103305 m!1022979))

(assert (=> b!1103305 m!1022979))

(declare-fun m!1022987 () Bool)

(assert (=> b!1103305 m!1022987))

(declare-fun m!1022989 () Bool)

(assert (=> bm!46299 m!1022989))

(assert (=> b!1103226 d!130675))

(declare-fun d!130677 () Bool)

(declare-fun lt!494872 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!536 (List!24068) (InoxSet (_ BitVec 64)))

(assert (=> d!130677 (= lt!494872 (select (content!536 Nil!24065) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!629808 () Bool)

(assert (=> d!130677 (= lt!494872 e!629808)))

(declare-fun res!736102 () Bool)

(assert (=> d!130677 (=> (not res!736102) (not e!629808))))

(assert (=> d!130677 (= res!736102 ((_ is Cons!24064) Nil!24065))))

(assert (=> d!130677 (= (contains!6382 Nil!24065 #b1000000000000000000000000000000000000000000000000000000000000000) lt!494872)))

(declare-fun b!1103310 () Bool)

(declare-fun e!629809 () Bool)

(assert (=> b!1103310 (= e!629808 e!629809)))

(declare-fun res!736101 () Bool)

(assert (=> b!1103310 (=> res!736101 e!629809)))

(assert (=> b!1103310 (= res!736101 (= (h!25273 Nil!24065) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103311 () Bool)

(assert (=> b!1103311 (= e!629809 (contains!6382 (t!34324 Nil!24065) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130677 res!736102) b!1103310))

(assert (= (and b!1103310 (not res!736101)) b!1103311))

(declare-fun m!1022991 () Bool)

(assert (=> d!130677 m!1022991))

(declare-fun m!1022993 () Bool)

(assert (=> d!130677 m!1022993))

(declare-fun m!1022995 () Bool)

(assert (=> b!1103311 m!1022995))

(assert (=> b!1103224 d!130677))

(declare-fun d!130679 () Bool)

(declare-fun lt!494873 () Bool)

(assert (=> d!130679 (= lt!494873 (select (content!536 Nil!24065) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!629810 () Bool)

(assert (=> d!130679 (= lt!494873 e!629810)))

(declare-fun res!736104 () Bool)

(assert (=> d!130679 (=> (not res!736104) (not e!629810))))

(assert (=> d!130679 (= res!736104 ((_ is Cons!24064) Nil!24065))))

(assert (=> d!130679 (= (contains!6382 Nil!24065 #b0000000000000000000000000000000000000000000000000000000000000000) lt!494873)))

(declare-fun b!1103312 () Bool)

(declare-fun e!629811 () Bool)

(assert (=> b!1103312 (= e!629810 e!629811)))

(declare-fun res!736103 () Bool)

(assert (=> b!1103312 (=> res!736103 e!629811)))

(assert (=> b!1103312 (= res!736103 (= (h!25273 Nil!24065) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103313 () Bool)

(assert (=> b!1103313 (= e!629811 (contains!6382 (t!34324 Nil!24065) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130679 res!736104) b!1103312))

(assert (= (and b!1103312 (not res!736103)) b!1103313))

(assert (=> d!130679 m!1022991))

(declare-fun m!1022997 () Bool)

(assert (=> d!130679 m!1022997))

(declare-fun m!1022999 () Bool)

(assert (=> b!1103313 m!1022999))

(assert (=> b!1103228 d!130679))

(declare-fun d!130681 () Bool)

(declare-fun res!736109 () Bool)

(declare-fun e!629816 () Bool)

(assert (=> d!130681 (=> res!736109 e!629816)))

(assert (=> d!130681 (= res!736109 ((_ is Nil!24065) Nil!24065))))

(assert (=> d!130681 (= (noDuplicate!1593 Nil!24065) e!629816)))

(declare-fun b!1103318 () Bool)

(declare-fun e!629817 () Bool)

(assert (=> b!1103318 (= e!629816 e!629817)))

(declare-fun res!736110 () Bool)

(assert (=> b!1103318 (=> (not res!736110) (not e!629817))))

(assert (=> b!1103318 (= res!736110 (not (contains!6382 (t!34324 Nil!24065) (h!25273 Nil!24065))))))

(declare-fun b!1103319 () Bool)

(assert (=> b!1103319 (= e!629817 (noDuplicate!1593 (t!34324 Nil!24065)))))

(assert (= (and d!130681 (not res!736109)) b!1103318))

(assert (= (and b!1103318 res!736110) b!1103319))

(declare-fun m!1023001 () Bool)

(assert (=> b!1103318 m!1023001))

(declare-fun m!1023003 () Bool)

(assert (=> b!1103319 m!1023003))

(assert (=> b!1103233 d!130681))

(declare-fun b!1103327 () Bool)

(declare-fun e!629822 () Bool)

(assert (=> b!1103327 (= e!629822 tp_is_empty!27301)))

(declare-fun condMapEmpty!42763 () Bool)

(declare-fun mapDefault!42763 () ValueCell!12941)

(assert (=> mapNonEmpty!42754 (= condMapEmpty!42763 (= mapRest!42754 ((as const (Array (_ BitVec 32) ValueCell!12941)) mapDefault!42763)))))

(declare-fun mapRes!42763 () Bool)

(assert (=> mapNonEmpty!42754 (= tp!81674 (and e!629822 mapRes!42763))))

(declare-fun mapNonEmpty!42763 () Bool)

(declare-fun tp!81683 () Bool)

(declare-fun e!629823 () Bool)

(assert (=> mapNonEmpty!42763 (= mapRes!42763 (and tp!81683 e!629823))))

(declare-fun mapKey!42763 () (_ BitVec 32))

(declare-fun mapValue!42763 () ValueCell!12941)

(declare-fun mapRest!42763 () (Array (_ BitVec 32) ValueCell!12941))

(assert (=> mapNonEmpty!42763 (= mapRest!42754 (store mapRest!42763 mapKey!42763 mapValue!42763))))

(declare-fun mapIsEmpty!42763 () Bool)

(assert (=> mapIsEmpty!42763 mapRes!42763))

(declare-fun b!1103326 () Bool)

(assert (=> b!1103326 (= e!629823 tp_is_empty!27301)))

(assert (= (and mapNonEmpty!42754 condMapEmpty!42763) mapIsEmpty!42763))

(assert (= (and mapNonEmpty!42754 (not condMapEmpty!42763)) mapNonEmpty!42763))

(assert (= (and mapNonEmpty!42763 ((_ is ValueCellFull!12941) mapValue!42763)) b!1103326))

(assert (= (and mapNonEmpty!42754 ((_ is ValueCellFull!12941) mapDefault!42763)) b!1103327))

(declare-fun m!1023005 () Bool)

(assert (=> mapNonEmpty!42763 m!1023005))

(check-sat (not b!1103304) (not mapNonEmpty!42763) (not d!130677) (not bm!46299) (not b!1103311) (not b!1103305) (not b!1103319) (not b!1103318) tp_is_empty!27301 (not d!130679) (not b!1103313))
(check-sat)
