; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133842 () Bool)

(assert start!133842)

(declare-fun b!1564828 () Bool)

(declare-fun e!872203 () Bool)

(declare-datatypes ((array!104466 0))(
  ( (array!104467 (arr!50423 (Array (_ BitVec 32) (_ BitVec 64))) (size!50973 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104466)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564828 (= e!872203 (bvsge (bvsub (size!50973 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!50973 _keys!637)) from!782)))))

(declare-fun mapNonEmpty!59716 () Bool)

(declare-fun mapRes!59716 () Bool)

(declare-fun tp!113641 () Bool)

(declare-fun e!872199 () Bool)

(assert (=> mapNonEmpty!59716 (= mapRes!59716 (and tp!113641 e!872199))))

(declare-fun mapKey!59716 () (_ BitVec 32))

(declare-datatypes ((V!60059 0))(
  ( (V!60060 (val!19528 Int)) )
))
(declare-datatypes ((ValueCell!18414 0))(
  ( (ValueCellFull!18414 (v!22282 V!60059)) (EmptyCell!18414) )
))
(declare-fun mapValue!59716 () ValueCell!18414)

(declare-fun mapRest!59716 () (Array (_ BitVec 32) ValueCell!18414))

(declare-datatypes ((array!104468 0))(
  ( (array!104469 (arr!50424 (Array (_ BitVec 32) ValueCell!18414)) (size!50974 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104468)

(assert (=> mapNonEmpty!59716 (= (arr!50424 _values!487) (store mapRest!59716 mapKey!59716 mapValue!59716))))

(declare-fun b!1564829 () Bool)

(declare-fun e!872201 () Bool)

(declare-fun tp_is_empty!38889 () Bool)

(assert (=> b!1564829 (= e!872201 tp_is_empty!38889)))

(declare-fun b!1564830 () Bool)

(assert (=> b!1564830 (= e!872199 tp_is_empty!38889)))

(declare-fun res!1069753 () Bool)

(assert (=> start!133842 (=> (not res!1069753) (not e!872203))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133842 (= res!1069753 (validMask!0 mask!947))))

(assert (=> start!133842 e!872203))

(assert (=> start!133842 true))

(declare-fun array_inv!39185 (array!104466) Bool)

(assert (=> start!133842 (array_inv!39185 _keys!637)))

(declare-fun e!872202 () Bool)

(declare-fun array_inv!39186 (array!104468) Bool)

(assert (=> start!133842 (and (array_inv!39186 _values!487) e!872202)))

(declare-fun b!1564831 () Bool)

(declare-fun res!1069751 () Bool)

(assert (=> b!1564831 (=> (not res!1069751) (not e!872203))))

(assert (=> b!1564831 (= res!1069751 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50973 _keys!637)) (bvslt from!782 (size!50973 _keys!637))))))

(declare-fun b!1564832 () Bool)

(declare-fun res!1069754 () Bool)

(assert (=> b!1564832 (=> (not res!1069754) (not e!872203))))

(declare-datatypes ((List!36583 0))(
  ( (Nil!36580) (Cons!36579 (h!38025 (_ BitVec 64)) (t!51430 List!36583)) )
))
(declare-fun arrayNoDuplicates!0 (array!104466 (_ BitVec 32) List!36583) Bool)

(assert (=> b!1564832 (= res!1069754 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36580))))

(declare-fun b!1564833 () Bool)

(declare-fun res!1069752 () Bool)

(assert (=> b!1564833 (=> (not res!1069752) (not e!872203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104466 (_ BitVec 32)) Bool)

(assert (=> b!1564833 (= res!1069752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564834 () Bool)

(declare-fun res!1069755 () Bool)

(assert (=> b!1564834 (=> (not res!1069755) (not e!872203))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564834 (= res!1069755 (and (= (size!50974 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50973 _keys!637) (size!50974 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564835 () Bool)

(declare-fun res!1069756 () Bool)

(assert (=> b!1564835 (=> (not res!1069756) (not e!872203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564835 (= res!1069756 (validKeyInArray!0 (select (arr!50423 _keys!637) from!782)))))

(declare-fun b!1564836 () Bool)

(assert (=> b!1564836 (= e!872202 (and e!872201 mapRes!59716))))

(declare-fun condMapEmpty!59716 () Bool)

(declare-fun mapDefault!59716 () ValueCell!18414)

(assert (=> b!1564836 (= condMapEmpty!59716 (= (arr!50424 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18414)) mapDefault!59716)))))

(declare-fun mapIsEmpty!59716 () Bool)

(assert (=> mapIsEmpty!59716 mapRes!59716))

(assert (= (and start!133842 res!1069753) b!1564834))

(assert (= (and b!1564834 res!1069755) b!1564833))

(assert (= (and b!1564833 res!1069752) b!1564832))

(assert (= (and b!1564832 res!1069754) b!1564831))

(assert (= (and b!1564831 res!1069751) b!1564835))

(assert (= (and b!1564835 res!1069756) b!1564828))

(assert (= (and b!1564836 condMapEmpty!59716) mapIsEmpty!59716))

(assert (= (and b!1564836 (not condMapEmpty!59716)) mapNonEmpty!59716))

(get-info :version)

(assert (= (and mapNonEmpty!59716 ((_ is ValueCellFull!18414) mapValue!59716)) b!1564830))

(assert (= (and b!1564836 ((_ is ValueCellFull!18414) mapDefault!59716)) b!1564829))

(assert (= start!133842 b!1564836))

(declare-fun m!1439897 () Bool)

(assert (=> b!1564832 m!1439897))

(declare-fun m!1439899 () Bool)

(assert (=> b!1564833 m!1439899))

(declare-fun m!1439901 () Bool)

(assert (=> mapNonEmpty!59716 m!1439901))

(declare-fun m!1439903 () Bool)

(assert (=> start!133842 m!1439903))

(declare-fun m!1439905 () Bool)

(assert (=> start!133842 m!1439905))

(declare-fun m!1439907 () Bool)

(assert (=> start!133842 m!1439907))

(declare-fun m!1439909 () Bool)

(assert (=> b!1564835 m!1439909))

(assert (=> b!1564835 m!1439909))

(declare-fun m!1439911 () Bool)

(assert (=> b!1564835 m!1439911))

(check-sat (not b!1564832) (not mapNonEmpty!59716) (not start!133842) tp_is_empty!38889 (not b!1564835) (not b!1564833))
(check-sat)
(get-model)

(declare-fun d!163141 () Bool)

(assert (=> d!163141 (= (validKeyInArray!0 (select (arr!50423 _keys!637) from!782)) (and (not (= (select (arr!50423 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50423 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1564835 d!163141))

(declare-fun b!1564872 () Bool)

(declare-fun e!872225 () Bool)

(declare-fun e!872226 () Bool)

(assert (=> b!1564872 (= e!872225 e!872226)))

(declare-fun c!144254 () Bool)

(assert (=> b!1564872 (= c!144254 (validKeyInArray!0 (select (arr!50423 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163143 () Bool)

(declare-fun res!1069780 () Bool)

(assert (=> d!163143 (=> res!1069780 e!872225)))

(assert (=> d!163143 (= res!1069780 (bvsge #b00000000000000000000000000000000 (size!50973 _keys!637)))))

(assert (=> d!163143 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!872225)))

(declare-fun b!1564873 () Bool)

(declare-fun call!71861 () Bool)

(assert (=> b!1564873 (= e!872226 call!71861)))

(declare-fun b!1564874 () Bool)

(declare-fun e!872227 () Bool)

(assert (=> b!1564874 (= e!872226 e!872227)))

(declare-fun lt!672116 () (_ BitVec 64))

(assert (=> b!1564874 (= lt!672116 (select (arr!50423 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51990 0))(
  ( (Unit!51991) )
))
(declare-fun lt!672114 () Unit!51990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104466 (_ BitVec 64) (_ BitVec 32)) Unit!51990)

(assert (=> b!1564874 (= lt!672114 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672116 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1564874 (arrayContainsKey!0 _keys!637 lt!672116 #b00000000000000000000000000000000)))

(declare-fun lt!672115 () Unit!51990)

(assert (=> b!1564874 (= lt!672115 lt!672114)))

(declare-fun res!1069779 () Bool)

(declare-datatypes ((SeekEntryResult!13523 0))(
  ( (MissingZero!13523 (index!56490 (_ BitVec 32))) (Found!13523 (index!56491 (_ BitVec 32))) (Intermediate!13523 (undefined!14335 Bool) (index!56492 (_ BitVec 32)) (x!140563 (_ BitVec 32))) (Undefined!13523) (MissingVacant!13523 (index!56493 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104466 (_ BitVec 32)) SeekEntryResult!13523)

(assert (=> b!1564874 (= res!1069779 (= (seekEntryOrOpen!0 (select (arr!50423 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13523 #b00000000000000000000000000000000)))))

(assert (=> b!1564874 (=> (not res!1069779) (not e!872227))))

(declare-fun b!1564875 () Bool)

(assert (=> b!1564875 (= e!872227 call!71861)))

(declare-fun bm!71858 () Bool)

(assert (=> bm!71858 (= call!71861 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(assert (= (and d!163143 (not res!1069780)) b!1564872))

(assert (= (and b!1564872 c!144254) b!1564874))

(assert (= (and b!1564872 (not c!144254)) b!1564873))

(assert (= (and b!1564874 res!1069779) b!1564875))

(assert (= (or b!1564875 b!1564873) bm!71858))

(declare-fun m!1439929 () Bool)

(assert (=> b!1564872 m!1439929))

(assert (=> b!1564872 m!1439929))

(declare-fun m!1439931 () Bool)

(assert (=> b!1564872 m!1439931))

(assert (=> b!1564874 m!1439929))

(declare-fun m!1439933 () Bool)

(assert (=> b!1564874 m!1439933))

(declare-fun m!1439935 () Bool)

(assert (=> b!1564874 m!1439935))

(assert (=> b!1564874 m!1439929))

(declare-fun m!1439937 () Bool)

(assert (=> b!1564874 m!1439937))

(declare-fun m!1439939 () Bool)

(assert (=> bm!71858 m!1439939))

(assert (=> b!1564833 d!163143))

(declare-fun d!163145 () Bool)

(assert (=> d!163145 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133842 d!163145))

(declare-fun d!163147 () Bool)

(assert (=> d!163147 (= (array_inv!39185 _keys!637) (bvsge (size!50973 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133842 d!163147))

(declare-fun d!163149 () Bool)

(assert (=> d!163149 (= (array_inv!39186 _values!487) (bvsge (size!50974 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133842 d!163149))

(declare-fun b!1564886 () Bool)

(declare-fun e!872237 () Bool)

(declare-fun e!872238 () Bool)

(assert (=> b!1564886 (= e!872237 e!872238)))

(declare-fun c!144257 () Bool)

(assert (=> b!1564886 (= c!144257 (validKeyInArray!0 (select (arr!50423 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71861 () Bool)

(declare-fun call!71864 () Bool)

(assert (=> bm!71861 (= call!71864 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144257 (Cons!36579 (select (arr!50423 _keys!637) #b00000000000000000000000000000000) Nil!36580) Nil!36580)))))

(declare-fun b!1564887 () Bool)

(assert (=> b!1564887 (= e!872238 call!71864)))

(declare-fun b!1564888 () Bool)

(declare-fun e!872236 () Bool)

(assert (=> b!1564888 (= e!872236 e!872237)))

(declare-fun res!1069789 () Bool)

(assert (=> b!1564888 (=> (not res!1069789) (not e!872237))))

(declare-fun e!872239 () Bool)

(assert (=> b!1564888 (= res!1069789 (not e!872239))))

(declare-fun res!1069788 () Bool)

(assert (=> b!1564888 (=> (not res!1069788) (not e!872239))))

(assert (=> b!1564888 (= res!1069788 (validKeyInArray!0 (select (arr!50423 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564889 () Bool)

(declare-fun contains!10322 (List!36583 (_ BitVec 64)) Bool)

(assert (=> b!1564889 (= e!872239 (contains!10322 Nil!36580 (select (arr!50423 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564890 () Bool)

(assert (=> b!1564890 (= e!872238 call!71864)))

(declare-fun d!163151 () Bool)

(declare-fun res!1069787 () Bool)

(assert (=> d!163151 (=> res!1069787 e!872236)))

(assert (=> d!163151 (= res!1069787 (bvsge #b00000000000000000000000000000000 (size!50973 _keys!637)))))

(assert (=> d!163151 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36580) e!872236)))

(assert (= (and d!163151 (not res!1069787)) b!1564888))

(assert (= (and b!1564888 res!1069788) b!1564889))

(assert (= (and b!1564888 res!1069789) b!1564886))

(assert (= (and b!1564886 c!144257) b!1564890))

(assert (= (and b!1564886 (not c!144257)) b!1564887))

(assert (= (or b!1564890 b!1564887) bm!71861))

(assert (=> b!1564886 m!1439929))

(assert (=> b!1564886 m!1439929))

(assert (=> b!1564886 m!1439931))

(assert (=> bm!71861 m!1439929))

(declare-fun m!1439941 () Bool)

(assert (=> bm!71861 m!1439941))

(assert (=> b!1564888 m!1439929))

(assert (=> b!1564888 m!1439929))

(assert (=> b!1564888 m!1439931))

(assert (=> b!1564889 m!1439929))

(assert (=> b!1564889 m!1439929))

(declare-fun m!1439943 () Bool)

(assert (=> b!1564889 m!1439943))

(assert (=> b!1564832 d!163151))

(declare-fun b!1564898 () Bool)

(declare-fun e!872245 () Bool)

(assert (=> b!1564898 (= e!872245 tp_is_empty!38889)))

(declare-fun b!1564897 () Bool)

(declare-fun e!872244 () Bool)

(assert (=> b!1564897 (= e!872244 tp_is_empty!38889)))

(declare-fun condMapEmpty!59722 () Bool)

(declare-fun mapDefault!59722 () ValueCell!18414)

(assert (=> mapNonEmpty!59716 (= condMapEmpty!59722 (= mapRest!59716 ((as const (Array (_ BitVec 32) ValueCell!18414)) mapDefault!59722)))))

(declare-fun mapRes!59722 () Bool)

(assert (=> mapNonEmpty!59716 (= tp!113641 (and e!872245 mapRes!59722))))

(declare-fun mapNonEmpty!59722 () Bool)

(declare-fun tp!113647 () Bool)

(assert (=> mapNonEmpty!59722 (= mapRes!59722 (and tp!113647 e!872244))))

(declare-fun mapValue!59722 () ValueCell!18414)

(declare-fun mapKey!59722 () (_ BitVec 32))

(declare-fun mapRest!59722 () (Array (_ BitVec 32) ValueCell!18414))

(assert (=> mapNonEmpty!59722 (= mapRest!59716 (store mapRest!59722 mapKey!59722 mapValue!59722))))

(declare-fun mapIsEmpty!59722 () Bool)

(assert (=> mapIsEmpty!59722 mapRes!59722))

(assert (= (and mapNonEmpty!59716 condMapEmpty!59722) mapIsEmpty!59722))

(assert (= (and mapNonEmpty!59716 (not condMapEmpty!59722)) mapNonEmpty!59722))

(assert (= (and mapNonEmpty!59722 ((_ is ValueCellFull!18414) mapValue!59722)) b!1564897))

(assert (= (and mapNonEmpty!59716 ((_ is ValueCellFull!18414) mapDefault!59722)) b!1564898))

(declare-fun m!1439945 () Bool)

(assert (=> mapNonEmpty!59722 m!1439945))

(check-sat (not mapNonEmpty!59722) (not b!1564874) (not b!1564888) tp_is_empty!38889 (not bm!71861) (not b!1564889) (not b!1564872) (not b!1564886) (not bm!71858))
(check-sat)
