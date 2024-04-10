; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97050 () Bool)

(assert start!97050)

(declare-fun b!1103955 () Bool)

(declare-fun e!630167 () Bool)

(declare-datatypes ((array!71599 0))(
  ( (array!71600 (arr!34456 (Array (_ BitVec 32) (_ BitVec 64))) (size!34992 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71599)

(assert (=> b!1103955 (= e!630167 (and (bvsle #b00000000000000000000000000000000 (size!34992 _keys!1208)) (bvsge (size!34992 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1103956 () Bool)

(declare-fun res!736505 () Bool)

(assert (=> b!1103956 (=> (not res!736505) (not e!630167))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103956 (= res!736505 (validMask!0 mask!1564))))

(declare-fun b!1103957 () Bool)

(declare-fun res!736512 () Bool)

(assert (=> b!1103957 (=> (not res!736512) (not e!630167))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1103957 (= res!736512 (= (select (arr!34456 _keys!1208) i!673) k0!934))))

(declare-fun b!1103958 () Bool)

(declare-fun res!736511 () Bool)

(assert (=> b!1103958 (=> (not res!736511) (not e!630167))))

(declare-datatypes ((List!24051 0))(
  ( (Nil!24048) (Cons!24047 (h!25256 (_ BitVec 64)) (t!34316 List!24051)) )
))
(declare-fun arrayNoDuplicates!0 (array!71599 (_ BitVec 32) List!24051) Bool)

(assert (=> b!1103958 (= res!736511 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24048))))

(declare-fun b!1103959 () Bool)

(declare-fun res!736509 () Bool)

(assert (=> b!1103959 (=> (not res!736509) (not e!630167))))

(assert (=> b!1103959 (= res!736509 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34992 _keys!1208))))))

(declare-fun b!1103960 () Bool)

(declare-fun e!630170 () Bool)

(declare-fun tp_is_empty!27339 () Bool)

(assert (=> b!1103960 (= e!630170 tp_is_empty!27339)))

(declare-fun b!1103961 () Bool)

(declare-fun res!736510 () Bool)

(assert (=> b!1103961 (=> (not res!736510) (not e!630167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103961 (= res!736510 (validKeyInArray!0 k0!934))))

(declare-fun b!1103962 () Bool)

(declare-fun res!736508 () Bool)

(assert (=> b!1103962 (=> (not res!736508) (not e!630167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71599 (_ BitVec 32)) Bool)

(assert (=> b!1103962 (= res!736508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71600 (store (arr!34456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34992 _keys!1208)) mask!1564))))

(declare-fun b!1103963 () Bool)

(declare-fun res!736506 () Bool)

(assert (=> b!1103963 (=> (not res!736506) (not e!630167))))

(assert (=> b!1103963 (= res!736506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!42814 () Bool)

(declare-fun mapRes!42814 () Bool)

(declare-fun tp!81734 () Bool)

(assert (=> mapNonEmpty!42814 (= mapRes!42814 (and tp!81734 e!630170))))

(declare-datatypes ((V!41579 0))(
  ( (V!41580 (val!13726 Int)) )
))
(declare-datatypes ((ValueCell!12960 0))(
  ( (ValueCellFull!12960 (v!16358 V!41579)) (EmptyCell!12960) )
))
(declare-fun mapValue!42814 () ValueCell!12960)

(declare-datatypes ((array!71601 0))(
  ( (array!71602 (arr!34457 (Array (_ BitVec 32) ValueCell!12960)) (size!34993 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71601)

(declare-fun mapKey!42814 () (_ BitVec 32))

(declare-fun mapRest!42814 () (Array (_ BitVec 32) ValueCell!12960))

(assert (=> mapNonEmpty!42814 (= (arr!34457 _values!996) (store mapRest!42814 mapKey!42814 mapValue!42814))))

(declare-fun b!1103964 () Bool)

(declare-fun e!630168 () Bool)

(declare-fun e!630169 () Bool)

(assert (=> b!1103964 (= e!630168 (and e!630169 mapRes!42814))))

(declare-fun condMapEmpty!42814 () Bool)

(declare-fun mapDefault!42814 () ValueCell!12960)

(assert (=> b!1103964 (= condMapEmpty!42814 (= (arr!34457 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12960)) mapDefault!42814)))))

(declare-fun b!1103965 () Bool)

(assert (=> b!1103965 (= e!630169 tp_is_empty!27339)))

(declare-fun res!736504 () Bool)

(assert (=> start!97050 (=> (not res!736504) (not e!630167))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97050 (= res!736504 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34992 _keys!1208))))))

(assert (=> start!97050 e!630167))

(declare-fun array_inv!26530 (array!71599) Bool)

(assert (=> start!97050 (array_inv!26530 _keys!1208)))

(assert (=> start!97050 true))

(declare-fun array_inv!26531 (array!71601) Bool)

(assert (=> start!97050 (and (array_inv!26531 _values!996) e!630168)))

(declare-fun b!1103966 () Bool)

(declare-fun res!736507 () Bool)

(assert (=> b!1103966 (=> (not res!736507) (not e!630167))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103966 (= res!736507 (and (= (size!34993 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34992 _keys!1208) (size!34993 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42814 () Bool)

(assert (=> mapIsEmpty!42814 mapRes!42814))

(assert (= (and start!97050 res!736504) b!1103956))

(assert (= (and b!1103956 res!736505) b!1103966))

(assert (= (and b!1103966 res!736507) b!1103963))

(assert (= (and b!1103963 res!736506) b!1103958))

(assert (= (and b!1103958 res!736511) b!1103959))

(assert (= (and b!1103959 res!736509) b!1103961))

(assert (= (and b!1103961 res!736510) b!1103957))

(assert (= (and b!1103957 res!736512) b!1103962))

(assert (= (and b!1103962 res!736508) b!1103955))

(assert (= (and b!1103964 condMapEmpty!42814) mapIsEmpty!42814))

(assert (= (and b!1103964 (not condMapEmpty!42814)) mapNonEmpty!42814))

(get-info :version)

(assert (= (and mapNonEmpty!42814 ((_ is ValueCellFull!12960) mapValue!42814)) b!1103960))

(assert (= (and b!1103964 ((_ is ValueCellFull!12960) mapDefault!42814)) b!1103965))

(assert (= start!97050 b!1103964))

(declare-fun m!1023881 () Bool)

(assert (=> b!1103963 m!1023881))

(declare-fun m!1023883 () Bool)

(assert (=> b!1103962 m!1023883))

(declare-fun m!1023885 () Bool)

(assert (=> b!1103962 m!1023885))

(declare-fun m!1023887 () Bool)

(assert (=> b!1103956 m!1023887))

(declare-fun m!1023889 () Bool)

(assert (=> b!1103961 m!1023889))

(declare-fun m!1023891 () Bool)

(assert (=> b!1103958 m!1023891))

(declare-fun m!1023893 () Bool)

(assert (=> start!97050 m!1023893))

(declare-fun m!1023895 () Bool)

(assert (=> start!97050 m!1023895))

(declare-fun m!1023897 () Bool)

(assert (=> mapNonEmpty!42814 m!1023897))

(declare-fun m!1023899 () Bool)

(assert (=> b!1103957 m!1023899))

(check-sat (not b!1103961) (not b!1103958) tp_is_empty!27339 (not b!1103962) (not b!1103963) (not b!1103956) (not start!97050) (not mapNonEmpty!42814))
(check-sat)
(get-model)

(declare-fun d!130851 () Bool)

(assert (=> d!130851 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1103961 d!130851))

(declare-fun d!130853 () Bool)

(assert (=> d!130853 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1103956 d!130853))

(declare-fun d!130855 () Bool)

(declare-fun res!736544 () Bool)

(declare-fun e!630195 () Bool)

(assert (=> d!130855 (=> res!736544 e!630195)))

(assert (=> d!130855 (= res!736544 (bvsge #b00000000000000000000000000000000 (size!34992 (array!71600 (store (arr!34456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34992 _keys!1208)))))))

(assert (=> d!130855 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71600 (store (arr!34456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34992 _keys!1208)) mask!1564) e!630195)))

(declare-fun b!1104011 () Bool)

(declare-fun e!630193 () Bool)

(declare-fun call!46328 () Bool)

(assert (=> b!1104011 (= e!630193 call!46328)))

(declare-fun b!1104012 () Bool)

(declare-fun e!630194 () Bool)

(assert (=> b!1104012 (= e!630194 e!630193)))

(declare-fun lt!495100 () (_ BitVec 64))

(assert (=> b!1104012 (= lt!495100 (select (arr!34456 (array!71600 (store (arr!34456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34992 _keys!1208))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36246 0))(
  ( (Unit!36247) )
))
(declare-fun lt!495099 () Unit!36246)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71599 (_ BitVec 64) (_ BitVec 32)) Unit!36246)

(assert (=> b!1104012 (= lt!495099 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71600 (store (arr!34456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34992 _keys!1208)) lt!495100 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104012 (arrayContainsKey!0 (array!71600 (store (arr!34456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34992 _keys!1208)) lt!495100 #b00000000000000000000000000000000)))

(declare-fun lt!495098 () Unit!36246)

(assert (=> b!1104012 (= lt!495098 lt!495099)))

(declare-fun res!736545 () Bool)

(declare-datatypes ((SeekEntryResult!9921 0))(
  ( (MissingZero!9921 (index!42055 (_ BitVec 32))) (Found!9921 (index!42056 (_ BitVec 32))) (Intermediate!9921 (undefined!10733 Bool) (index!42057 (_ BitVec 32)) (x!99300 (_ BitVec 32))) (Undefined!9921) (MissingVacant!9921 (index!42058 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71599 (_ BitVec 32)) SeekEntryResult!9921)

(assert (=> b!1104012 (= res!736545 (= (seekEntryOrOpen!0 (select (arr!34456 (array!71600 (store (arr!34456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34992 _keys!1208))) #b00000000000000000000000000000000) (array!71600 (store (arr!34456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34992 _keys!1208)) mask!1564) (Found!9921 #b00000000000000000000000000000000)))))

(assert (=> b!1104012 (=> (not res!736545) (not e!630193))))

(declare-fun b!1104013 () Bool)

(assert (=> b!1104013 (= e!630195 e!630194)))

(declare-fun c!108982 () Bool)

(assert (=> b!1104013 (= c!108982 (validKeyInArray!0 (select (arr!34456 (array!71600 (store (arr!34456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34992 _keys!1208))) #b00000000000000000000000000000000)))))

(declare-fun b!1104014 () Bool)

(assert (=> b!1104014 (= e!630194 call!46328)))

(declare-fun bm!46325 () Bool)

(assert (=> bm!46325 (= call!46328 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!71600 (store (arr!34456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34992 _keys!1208)) mask!1564))))

(assert (= (and d!130855 (not res!736544)) b!1104013))

(assert (= (and b!1104013 c!108982) b!1104012))

(assert (= (and b!1104013 (not c!108982)) b!1104014))

(assert (= (and b!1104012 res!736545) b!1104011))

(assert (= (or b!1104011 b!1104014) bm!46325))

(declare-fun m!1023921 () Bool)

(assert (=> b!1104012 m!1023921))

(declare-fun m!1023923 () Bool)

(assert (=> b!1104012 m!1023923))

(declare-fun m!1023925 () Bool)

(assert (=> b!1104012 m!1023925))

(assert (=> b!1104012 m!1023921))

(declare-fun m!1023927 () Bool)

(assert (=> b!1104012 m!1023927))

(assert (=> b!1104013 m!1023921))

(assert (=> b!1104013 m!1023921))

(declare-fun m!1023929 () Bool)

(assert (=> b!1104013 m!1023929))

(declare-fun m!1023931 () Bool)

(assert (=> bm!46325 m!1023931))

(assert (=> b!1103962 d!130855))

(declare-fun d!130857 () Bool)

(assert (=> d!130857 (= (array_inv!26530 _keys!1208) (bvsge (size!34992 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97050 d!130857))

(declare-fun d!130859 () Bool)

(assert (=> d!130859 (= (array_inv!26531 _values!996) (bvsge (size!34993 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97050 d!130859))

(declare-fun d!130861 () Bool)

(declare-fun res!736546 () Bool)

(declare-fun e!630198 () Bool)

(assert (=> d!130861 (=> res!736546 e!630198)))

(assert (=> d!130861 (= res!736546 (bvsge #b00000000000000000000000000000000 (size!34992 _keys!1208)))))

(assert (=> d!130861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!630198)))

(declare-fun b!1104015 () Bool)

(declare-fun e!630196 () Bool)

(declare-fun call!46329 () Bool)

(assert (=> b!1104015 (= e!630196 call!46329)))

(declare-fun b!1104016 () Bool)

(declare-fun e!630197 () Bool)

(assert (=> b!1104016 (= e!630197 e!630196)))

(declare-fun lt!495103 () (_ BitVec 64))

(assert (=> b!1104016 (= lt!495103 (select (arr!34456 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!495102 () Unit!36246)

(assert (=> b!1104016 (= lt!495102 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495103 #b00000000000000000000000000000000))))

(assert (=> b!1104016 (arrayContainsKey!0 _keys!1208 lt!495103 #b00000000000000000000000000000000)))

(declare-fun lt!495101 () Unit!36246)

(assert (=> b!1104016 (= lt!495101 lt!495102)))

(declare-fun res!736547 () Bool)

(assert (=> b!1104016 (= res!736547 (= (seekEntryOrOpen!0 (select (arr!34456 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9921 #b00000000000000000000000000000000)))))

(assert (=> b!1104016 (=> (not res!736547) (not e!630196))))

(declare-fun b!1104017 () Bool)

(assert (=> b!1104017 (= e!630198 e!630197)))

(declare-fun c!108983 () Bool)

(assert (=> b!1104017 (= c!108983 (validKeyInArray!0 (select (arr!34456 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104018 () Bool)

(assert (=> b!1104018 (= e!630197 call!46329)))

(declare-fun bm!46326 () Bool)

(assert (=> bm!46326 (= call!46329 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!130861 (not res!736546)) b!1104017))

(assert (= (and b!1104017 c!108983) b!1104016))

(assert (= (and b!1104017 (not c!108983)) b!1104018))

(assert (= (and b!1104016 res!736547) b!1104015))

(assert (= (or b!1104015 b!1104018) bm!46326))

(declare-fun m!1023933 () Bool)

(assert (=> b!1104016 m!1023933))

(declare-fun m!1023935 () Bool)

(assert (=> b!1104016 m!1023935))

(declare-fun m!1023937 () Bool)

(assert (=> b!1104016 m!1023937))

(assert (=> b!1104016 m!1023933))

(declare-fun m!1023939 () Bool)

(assert (=> b!1104016 m!1023939))

(assert (=> b!1104017 m!1023933))

(assert (=> b!1104017 m!1023933))

(declare-fun m!1023941 () Bool)

(assert (=> b!1104017 m!1023941))

(declare-fun m!1023943 () Bool)

(assert (=> bm!46326 m!1023943))

(assert (=> b!1103963 d!130861))

(declare-fun b!1104029 () Bool)

(declare-fun e!630207 () Bool)

(declare-fun call!46332 () Bool)

(assert (=> b!1104029 (= e!630207 call!46332)))

(declare-fun bm!46329 () Bool)

(declare-fun c!108986 () Bool)

(assert (=> bm!46329 (= call!46332 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108986 (Cons!24047 (select (arr!34456 _keys!1208) #b00000000000000000000000000000000) Nil!24048) Nil!24048)))))

(declare-fun b!1104030 () Bool)

(declare-fun e!630210 () Bool)

(declare-fun contains!6414 (List!24051 (_ BitVec 64)) Bool)

(assert (=> b!1104030 (= e!630210 (contains!6414 Nil!24048 (select (arr!34456 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104032 () Bool)

(declare-fun e!630208 () Bool)

(assert (=> b!1104032 (= e!630208 e!630207)))

(assert (=> b!1104032 (= c!108986 (validKeyInArray!0 (select (arr!34456 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104033 () Bool)

(declare-fun e!630209 () Bool)

(assert (=> b!1104033 (= e!630209 e!630208)))

(declare-fun res!736554 () Bool)

(assert (=> b!1104033 (=> (not res!736554) (not e!630208))))

(assert (=> b!1104033 (= res!736554 (not e!630210))))

(declare-fun res!736555 () Bool)

(assert (=> b!1104033 (=> (not res!736555) (not e!630210))))

(assert (=> b!1104033 (= res!736555 (validKeyInArray!0 (select (arr!34456 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!130863 () Bool)

(declare-fun res!736556 () Bool)

(assert (=> d!130863 (=> res!736556 e!630209)))

(assert (=> d!130863 (= res!736556 (bvsge #b00000000000000000000000000000000 (size!34992 _keys!1208)))))

(assert (=> d!130863 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24048) e!630209)))

(declare-fun b!1104031 () Bool)

(assert (=> b!1104031 (= e!630207 call!46332)))

(assert (= (and d!130863 (not res!736556)) b!1104033))

(assert (= (and b!1104033 res!736555) b!1104030))

(assert (= (and b!1104033 res!736554) b!1104032))

(assert (= (and b!1104032 c!108986) b!1104031))

(assert (= (and b!1104032 (not c!108986)) b!1104029))

(assert (= (or b!1104031 b!1104029) bm!46329))

(assert (=> bm!46329 m!1023933))

(declare-fun m!1023945 () Bool)

(assert (=> bm!46329 m!1023945))

(assert (=> b!1104030 m!1023933))

(assert (=> b!1104030 m!1023933))

(declare-fun m!1023947 () Bool)

(assert (=> b!1104030 m!1023947))

(assert (=> b!1104032 m!1023933))

(assert (=> b!1104032 m!1023933))

(assert (=> b!1104032 m!1023941))

(assert (=> b!1104033 m!1023933))

(assert (=> b!1104033 m!1023933))

(assert (=> b!1104033 m!1023941))

(assert (=> b!1103958 d!130863))

(declare-fun mapNonEmpty!42820 () Bool)

(declare-fun mapRes!42820 () Bool)

(declare-fun tp!81740 () Bool)

(declare-fun e!630215 () Bool)

(assert (=> mapNonEmpty!42820 (= mapRes!42820 (and tp!81740 e!630215))))

(declare-fun mapKey!42820 () (_ BitVec 32))

(declare-fun mapRest!42820 () (Array (_ BitVec 32) ValueCell!12960))

(declare-fun mapValue!42820 () ValueCell!12960)

(assert (=> mapNonEmpty!42820 (= mapRest!42814 (store mapRest!42820 mapKey!42820 mapValue!42820))))

(declare-fun b!1104040 () Bool)

(assert (=> b!1104040 (= e!630215 tp_is_empty!27339)))

(declare-fun mapIsEmpty!42820 () Bool)

(assert (=> mapIsEmpty!42820 mapRes!42820))

(declare-fun condMapEmpty!42820 () Bool)

(declare-fun mapDefault!42820 () ValueCell!12960)

(assert (=> mapNonEmpty!42814 (= condMapEmpty!42820 (= mapRest!42814 ((as const (Array (_ BitVec 32) ValueCell!12960)) mapDefault!42820)))))

(declare-fun e!630216 () Bool)

(assert (=> mapNonEmpty!42814 (= tp!81734 (and e!630216 mapRes!42820))))

(declare-fun b!1104041 () Bool)

(assert (=> b!1104041 (= e!630216 tp_is_empty!27339)))

(assert (= (and mapNonEmpty!42814 condMapEmpty!42820) mapIsEmpty!42820))

(assert (= (and mapNonEmpty!42814 (not condMapEmpty!42820)) mapNonEmpty!42820))

(assert (= (and mapNonEmpty!42820 ((_ is ValueCellFull!12960) mapValue!42820)) b!1104040))

(assert (= (and mapNonEmpty!42814 ((_ is ValueCellFull!12960) mapDefault!42820)) b!1104041))

(declare-fun m!1023949 () Bool)

(assert (=> mapNonEmpty!42820 m!1023949))

(check-sat (not bm!46329) (not b!1104016) tp_is_empty!27339 (not b!1104032) (not bm!46325) (not b!1104012) (not mapNonEmpty!42820) (not b!1104017) (not bm!46326) (not b!1104033) (not b!1104013) (not b!1104030))
(check-sat)
