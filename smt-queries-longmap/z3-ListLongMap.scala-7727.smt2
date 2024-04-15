; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97042 () Bool)

(assert start!97042)

(declare-fun b!1103766 () Bool)

(declare-fun res!736416 () Bool)

(declare-fun e!630062 () Bool)

(assert (=> b!1103766 (=> (not res!736416) (not e!630062))))

(declare-datatypes ((array!71504 0))(
  ( (array!71505 (arr!34409 (Array (_ BitVec 32) (_ BitVec 64))) (size!34947 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71504)

(declare-datatypes ((List!24080 0))(
  ( (Nil!24077) (Cons!24076 (h!25285 (_ BitVec 64)) (t!34336 List!24080)) )
))
(declare-fun arrayNoDuplicates!0 (array!71504 (_ BitVec 32) List!24080) Bool)

(assert (=> b!1103766 (= res!736416 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24077))))

(declare-fun b!1103767 () Bool)

(declare-fun res!736408 () Bool)

(assert (=> b!1103767 (=> (not res!736408) (not e!630062))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41577 0))(
  ( (V!41578 (val!13725 Int)) )
))
(declare-datatypes ((ValueCell!12959 0))(
  ( (ValueCellFull!12959 (v!16356 V!41577)) (EmptyCell!12959) )
))
(declare-datatypes ((array!71506 0))(
  ( (array!71507 (arr!34410 (Array (_ BitVec 32) ValueCell!12959)) (size!34948 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71506)

(assert (=> b!1103767 (= res!736408 (and (= (size!34948 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34947 _keys!1208) (size!34948 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42811 () Bool)

(declare-fun mapRes!42811 () Bool)

(assert (=> mapIsEmpty!42811 mapRes!42811))

(declare-fun b!1103768 () Bool)

(declare-fun e!630059 () Bool)

(declare-fun tp_is_empty!27337 () Bool)

(assert (=> b!1103768 (= e!630059 tp_is_empty!27337)))

(declare-fun b!1103769 () Bool)

(declare-fun res!736410 () Bool)

(assert (=> b!1103769 (=> (not res!736410) (not e!630062))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1103769 (= res!736410 (= (select (arr!34409 _keys!1208) i!673) k0!934))))

(declare-fun b!1103770 () Bool)

(declare-fun e!630063 () Bool)

(assert (=> b!1103770 (= e!630063 (and e!630059 mapRes!42811))))

(declare-fun condMapEmpty!42811 () Bool)

(declare-fun mapDefault!42811 () ValueCell!12959)

(assert (=> b!1103770 (= condMapEmpty!42811 (= (arr!34410 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12959)) mapDefault!42811)))))

(declare-fun mapNonEmpty!42811 () Bool)

(declare-fun tp!81731 () Bool)

(declare-fun e!630061 () Bool)

(assert (=> mapNonEmpty!42811 (= mapRes!42811 (and tp!81731 e!630061))))

(declare-fun mapValue!42811 () ValueCell!12959)

(declare-fun mapKey!42811 () (_ BitVec 32))

(declare-fun mapRest!42811 () (Array (_ BitVec 32) ValueCell!12959))

(assert (=> mapNonEmpty!42811 (= (arr!34410 _values!996) (store mapRest!42811 mapKey!42811 mapValue!42811))))

(declare-fun b!1103771 () Bool)

(declare-fun res!736412 () Bool)

(assert (=> b!1103771 (=> (not res!736412) (not e!630062))))

(assert (=> b!1103771 (= res!736412 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34947 _keys!1208))))))

(declare-fun res!736413 () Bool)

(assert (=> start!97042 (=> (not res!736413) (not e!630062))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97042 (= res!736413 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34947 _keys!1208))))))

(assert (=> start!97042 e!630062))

(declare-fun array_inv!26534 (array!71504) Bool)

(assert (=> start!97042 (array_inv!26534 _keys!1208)))

(assert (=> start!97042 true))

(declare-fun array_inv!26535 (array!71506) Bool)

(assert (=> start!97042 (and (array_inv!26535 _values!996) e!630063)))

(declare-fun b!1103772 () Bool)

(declare-fun res!736414 () Bool)

(assert (=> b!1103772 (=> (not res!736414) (not e!630062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71504 (_ BitVec 32)) Bool)

(assert (=> b!1103772 (= res!736414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103773 () Bool)

(assert (=> b!1103773 (= e!630061 tp_is_empty!27337)))

(declare-fun b!1103774 () Bool)

(declare-fun res!736415 () Bool)

(assert (=> b!1103774 (=> (not res!736415) (not e!630062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103774 (= res!736415 (validMask!0 mask!1564))))

(declare-fun b!1103775 () Bool)

(assert (=> b!1103775 (= e!630062 (and (bvsle #b00000000000000000000000000000000 (size!34947 _keys!1208)) (bvsge (size!34947 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1103776 () Bool)

(declare-fun res!736411 () Bool)

(assert (=> b!1103776 (=> (not res!736411) (not e!630062))))

(assert (=> b!1103776 (= res!736411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71505 (store (arr!34409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34947 _keys!1208)) mask!1564))))

(declare-fun b!1103777 () Bool)

(declare-fun res!736409 () Bool)

(assert (=> b!1103777 (=> (not res!736409) (not e!630062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103777 (= res!736409 (validKeyInArray!0 k0!934))))

(assert (= (and start!97042 res!736413) b!1103774))

(assert (= (and b!1103774 res!736415) b!1103767))

(assert (= (and b!1103767 res!736408) b!1103772))

(assert (= (and b!1103772 res!736414) b!1103766))

(assert (= (and b!1103766 res!736416) b!1103771))

(assert (= (and b!1103771 res!736412) b!1103777))

(assert (= (and b!1103777 res!736409) b!1103769))

(assert (= (and b!1103769 res!736410) b!1103776))

(assert (= (and b!1103776 res!736411) b!1103775))

(assert (= (and b!1103770 condMapEmpty!42811) mapIsEmpty!42811))

(assert (= (and b!1103770 (not condMapEmpty!42811)) mapNonEmpty!42811))

(get-info :version)

(assert (= (and mapNonEmpty!42811 ((_ is ValueCellFull!12959) mapValue!42811)) b!1103773))

(assert (= (and b!1103770 ((_ is ValueCellFull!12959) mapDefault!42811)) b!1103768))

(assert (= start!97042 b!1103770))

(declare-fun m!1023235 () Bool)

(assert (=> start!97042 m!1023235))

(declare-fun m!1023237 () Bool)

(assert (=> start!97042 m!1023237))

(declare-fun m!1023239 () Bool)

(assert (=> b!1103774 m!1023239))

(declare-fun m!1023241 () Bool)

(assert (=> b!1103769 m!1023241))

(declare-fun m!1023243 () Bool)

(assert (=> mapNonEmpty!42811 m!1023243))

(declare-fun m!1023245 () Bool)

(assert (=> b!1103777 m!1023245))

(declare-fun m!1023247 () Bool)

(assert (=> b!1103776 m!1023247))

(declare-fun m!1023249 () Bool)

(assert (=> b!1103776 m!1023249))

(declare-fun m!1023251 () Bool)

(assert (=> b!1103766 m!1023251))

(declare-fun m!1023253 () Bool)

(assert (=> b!1103772 m!1023253))

(check-sat (not b!1103777) (not b!1103766) (not mapNonEmpty!42811) (not b!1103774) (not start!97042) tp_is_empty!27337 (not b!1103772) (not b!1103776))
(check-sat)
(get-model)

(declare-fun d!130695 () Bool)

(declare-fun res!736477 () Bool)

(declare-fun e!630105 () Bool)

(assert (=> d!130695 (=> res!736477 e!630105)))

(assert (=> d!130695 (= res!736477 (bvsge #b00000000000000000000000000000000 (size!34947 _keys!1208)))))

(assert (=> d!130695 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24077) e!630105)))

(declare-fun b!1103860 () Bool)

(declare-fun e!630104 () Bool)

(declare-fun contains!6383 (List!24080 (_ BitVec 64)) Bool)

(assert (=> b!1103860 (= e!630104 (contains!6383 Nil!24077 (select (arr!34409 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!46302 () Bool)

(declare-fun call!46305 () Bool)

(declare-fun c!108943 () Bool)

(assert (=> bm!46302 (= call!46305 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108943 (Cons!24076 (select (arr!34409 _keys!1208) #b00000000000000000000000000000000) Nil!24077) Nil!24077)))))

(declare-fun b!1103861 () Bool)

(declare-fun e!630103 () Bool)

(assert (=> b!1103861 (= e!630103 call!46305)))

(declare-fun b!1103862 () Bool)

(declare-fun e!630102 () Bool)

(assert (=> b!1103862 (= e!630102 e!630103)))

(assert (=> b!1103862 (= c!108943 (validKeyInArray!0 (select (arr!34409 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1103863 () Bool)

(assert (=> b!1103863 (= e!630103 call!46305)))

(declare-fun b!1103864 () Bool)

(assert (=> b!1103864 (= e!630105 e!630102)))

(declare-fun res!736478 () Bool)

(assert (=> b!1103864 (=> (not res!736478) (not e!630102))))

(assert (=> b!1103864 (= res!736478 (not e!630104))))

(declare-fun res!736479 () Bool)

(assert (=> b!1103864 (=> (not res!736479) (not e!630104))))

(assert (=> b!1103864 (= res!736479 (validKeyInArray!0 (select (arr!34409 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!130695 (not res!736477)) b!1103864))

(assert (= (and b!1103864 res!736479) b!1103860))

(assert (= (and b!1103864 res!736478) b!1103862))

(assert (= (and b!1103862 c!108943) b!1103861))

(assert (= (and b!1103862 (not c!108943)) b!1103863))

(assert (= (or b!1103861 b!1103863) bm!46302))

(declare-fun m!1023295 () Bool)

(assert (=> b!1103860 m!1023295))

(assert (=> b!1103860 m!1023295))

(declare-fun m!1023297 () Bool)

(assert (=> b!1103860 m!1023297))

(assert (=> bm!46302 m!1023295))

(declare-fun m!1023299 () Bool)

(assert (=> bm!46302 m!1023299))

(assert (=> b!1103862 m!1023295))

(assert (=> b!1103862 m!1023295))

(declare-fun m!1023301 () Bool)

(assert (=> b!1103862 m!1023301))

(assert (=> b!1103864 m!1023295))

(assert (=> b!1103864 m!1023295))

(assert (=> b!1103864 m!1023301))

(assert (=> b!1103766 d!130695))

(declare-fun d!130697 () Bool)

(assert (=> d!130697 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1103774 d!130697))

(declare-fun b!1103873 () Bool)

(declare-fun e!630113 () Bool)

(declare-fun e!630112 () Bool)

(assert (=> b!1103873 (= e!630113 e!630112)))

(declare-fun lt!494899 () (_ BitVec 64))

(assert (=> b!1103873 (= lt!494899 (select (arr!34409 (array!71505 (store (arr!34409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34947 _keys!1208))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36067 0))(
  ( (Unit!36068) )
))
(declare-fun lt!494900 () Unit!36067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71504 (_ BitVec 64) (_ BitVec 32)) Unit!36067)

(assert (=> b!1103873 (= lt!494900 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71505 (store (arr!34409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34947 _keys!1208)) lt!494899 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103873 (arrayContainsKey!0 (array!71505 (store (arr!34409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34947 _keys!1208)) lt!494899 #b00000000000000000000000000000000)))

(declare-fun lt!494898 () Unit!36067)

(assert (=> b!1103873 (= lt!494898 lt!494900)))

(declare-fun res!736484 () Bool)

(declare-datatypes ((SeekEntryResult!9920 0))(
  ( (MissingZero!9920 (index!42051 (_ BitVec 32))) (Found!9920 (index!42052 (_ BitVec 32))) (Intermediate!9920 (undefined!10732 Bool) (index!42053 (_ BitVec 32)) (x!99296 (_ BitVec 32))) (Undefined!9920) (MissingVacant!9920 (index!42054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71504 (_ BitVec 32)) SeekEntryResult!9920)

(assert (=> b!1103873 (= res!736484 (= (seekEntryOrOpen!0 (select (arr!34409 (array!71505 (store (arr!34409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34947 _keys!1208))) #b00000000000000000000000000000000) (array!71505 (store (arr!34409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34947 _keys!1208)) mask!1564) (Found!9920 #b00000000000000000000000000000000)))))

(assert (=> b!1103873 (=> (not res!736484) (not e!630112))))

(declare-fun b!1103874 () Bool)

(declare-fun call!46308 () Bool)

(assert (=> b!1103874 (= e!630112 call!46308)))

(declare-fun d!130699 () Bool)

(declare-fun res!736485 () Bool)

(declare-fun e!630114 () Bool)

(assert (=> d!130699 (=> res!736485 e!630114)))

(assert (=> d!130699 (= res!736485 (bvsge #b00000000000000000000000000000000 (size!34947 (array!71505 (store (arr!34409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34947 _keys!1208)))))))

(assert (=> d!130699 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71505 (store (arr!34409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34947 _keys!1208)) mask!1564) e!630114)))

(declare-fun b!1103875 () Bool)

(assert (=> b!1103875 (= e!630113 call!46308)))

(declare-fun bm!46305 () Bool)

(assert (=> bm!46305 (= call!46308 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!71505 (store (arr!34409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34947 _keys!1208)) mask!1564))))

(declare-fun b!1103876 () Bool)

(assert (=> b!1103876 (= e!630114 e!630113)))

(declare-fun c!108946 () Bool)

(assert (=> b!1103876 (= c!108946 (validKeyInArray!0 (select (arr!34409 (array!71505 (store (arr!34409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34947 _keys!1208))) #b00000000000000000000000000000000)))))

(assert (= (and d!130699 (not res!736485)) b!1103876))

(assert (= (and b!1103876 c!108946) b!1103873))

(assert (= (and b!1103876 (not c!108946)) b!1103875))

(assert (= (and b!1103873 res!736484) b!1103874))

(assert (= (or b!1103874 b!1103875) bm!46305))

(declare-fun m!1023303 () Bool)

(assert (=> b!1103873 m!1023303))

(declare-fun m!1023305 () Bool)

(assert (=> b!1103873 m!1023305))

(declare-fun m!1023307 () Bool)

(assert (=> b!1103873 m!1023307))

(assert (=> b!1103873 m!1023303))

(declare-fun m!1023309 () Bool)

(assert (=> b!1103873 m!1023309))

(declare-fun m!1023311 () Bool)

(assert (=> bm!46305 m!1023311))

(assert (=> b!1103876 m!1023303))

(assert (=> b!1103876 m!1023303))

(declare-fun m!1023313 () Bool)

(assert (=> b!1103876 m!1023313))

(assert (=> b!1103776 d!130699))

(declare-fun b!1103877 () Bool)

(declare-fun e!630116 () Bool)

(declare-fun e!630115 () Bool)

(assert (=> b!1103877 (= e!630116 e!630115)))

(declare-fun lt!494902 () (_ BitVec 64))

(assert (=> b!1103877 (= lt!494902 (select (arr!34409 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!494903 () Unit!36067)

(assert (=> b!1103877 (= lt!494903 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!494902 #b00000000000000000000000000000000))))

(assert (=> b!1103877 (arrayContainsKey!0 _keys!1208 lt!494902 #b00000000000000000000000000000000)))

(declare-fun lt!494901 () Unit!36067)

(assert (=> b!1103877 (= lt!494901 lt!494903)))

(declare-fun res!736486 () Bool)

(assert (=> b!1103877 (= res!736486 (= (seekEntryOrOpen!0 (select (arr!34409 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9920 #b00000000000000000000000000000000)))))

(assert (=> b!1103877 (=> (not res!736486) (not e!630115))))

(declare-fun b!1103878 () Bool)

(declare-fun call!46309 () Bool)

(assert (=> b!1103878 (= e!630115 call!46309)))

(declare-fun d!130701 () Bool)

(declare-fun res!736487 () Bool)

(declare-fun e!630117 () Bool)

(assert (=> d!130701 (=> res!736487 e!630117)))

(assert (=> d!130701 (= res!736487 (bvsge #b00000000000000000000000000000000 (size!34947 _keys!1208)))))

(assert (=> d!130701 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!630117)))

(declare-fun b!1103879 () Bool)

(assert (=> b!1103879 (= e!630116 call!46309)))

(declare-fun bm!46306 () Bool)

(assert (=> bm!46306 (= call!46309 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1103880 () Bool)

(assert (=> b!1103880 (= e!630117 e!630116)))

(declare-fun c!108947 () Bool)

(assert (=> b!1103880 (= c!108947 (validKeyInArray!0 (select (arr!34409 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!130701 (not res!736487)) b!1103880))

(assert (= (and b!1103880 c!108947) b!1103877))

(assert (= (and b!1103880 (not c!108947)) b!1103879))

(assert (= (and b!1103877 res!736486) b!1103878))

(assert (= (or b!1103878 b!1103879) bm!46306))

(assert (=> b!1103877 m!1023295))

(declare-fun m!1023315 () Bool)

(assert (=> b!1103877 m!1023315))

(declare-fun m!1023317 () Bool)

(assert (=> b!1103877 m!1023317))

(assert (=> b!1103877 m!1023295))

(declare-fun m!1023319 () Bool)

(assert (=> b!1103877 m!1023319))

(declare-fun m!1023321 () Bool)

(assert (=> bm!46306 m!1023321))

(assert (=> b!1103880 m!1023295))

(assert (=> b!1103880 m!1023295))

(assert (=> b!1103880 m!1023301))

(assert (=> b!1103772 d!130701))

(declare-fun d!130703 () Bool)

(assert (=> d!130703 (= (array_inv!26534 _keys!1208) (bvsge (size!34947 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97042 d!130703))

(declare-fun d!130705 () Bool)

(assert (=> d!130705 (= (array_inv!26535 _values!996) (bvsge (size!34948 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97042 d!130705))

(declare-fun d!130707 () Bool)

(assert (=> d!130707 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1103777 d!130707))

(declare-fun condMapEmpty!42820 () Bool)

(declare-fun mapDefault!42820 () ValueCell!12959)

(assert (=> mapNonEmpty!42811 (= condMapEmpty!42820 (= mapRest!42811 ((as const (Array (_ BitVec 32) ValueCell!12959)) mapDefault!42820)))))

(declare-fun e!630122 () Bool)

(declare-fun mapRes!42820 () Bool)

(assert (=> mapNonEmpty!42811 (= tp!81731 (and e!630122 mapRes!42820))))

(declare-fun mapNonEmpty!42820 () Bool)

(declare-fun tp!81740 () Bool)

(declare-fun e!630123 () Bool)

(assert (=> mapNonEmpty!42820 (= mapRes!42820 (and tp!81740 e!630123))))

(declare-fun mapValue!42820 () ValueCell!12959)

(declare-fun mapRest!42820 () (Array (_ BitVec 32) ValueCell!12959))

(declare-fun mapKey!42820 () (_ BitVec 32))

(assert (=> mapNonEmpty!42820 (= mapRest!42811 (store mapRest!42820 mapKey!42820 mapValue!42820))))

(declare-fun b!1103888 () Bool)

(assert (=> b!1103888 (= e!630122 tp_is_empty!27337)))

(declare-fun b!1103887 () Bool)

(assert (=> b!1103887 (= e!630123 tp_is_empty!27337)))

(declare-fun mapIsEmpty!42820 () Bool)

(assert (=> mapIsEmpty!42820 mapRes!42820))

(assert (= (and mapNonEmpty!42811 condMapEmpty!42820) mapIsEmpty!42820))

(assert (= (and mapNonEmpty!42811 (not condMapEmpty!42820)) mapNonEmpty!42820))

(assert (= (and mapNonEmpty!42820 ((_ is ValueCellFull!12959) mapValue!42820)) b!1103887))

(assert (= (and mapNonEmpty!42811 ((_ is ValueCellFull!12959) mapDefault!42820)) b!1103888))

(declare-fun m!1023323 () Bool)

(assert (=> mapNonEmpty!42820 m!1023323))

(check-sat (not b!1103862) (not bm!46306) (not bm!46305) (not b!1103860) (not b!1103877) (not b!1103876) (not b!1103880) (not bm!46302) (not mapNonEmpty!42820) (not b!1103873) tp_is_empty!27337 (not b!1103864))
(check-sat)
