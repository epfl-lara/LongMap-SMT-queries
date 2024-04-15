; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97060 () Bool)

(assert start!97060)

(declare-fun b!1103915 () Bool)

(declare-fun res!736516 () Bool)

(declare-fun e!630135 () Bool)

(assert (=> b!1103915 (=> (not res!736516) (not e!630135))))

(declare-datatypes ((array!71518 0))(
  ( (array!71519 (arr!34415 (Array (_ BitVec 32) (_ BitVec 64))) (size!34953 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71518)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1103915 (= res!736516 (= (select (arr!34415 _keys!1208) i!673) k0!934))))

(declare-fun b!1103916 () Bool)

(declare-datatypes ((List!24082 0))(
  ( (Nil!24079) (Cons!24078 (h!25287 (_ BitVec 64)) (t!34338 List!24082)) )
))
(declare-fun noDuplicate!1595 (List!24082) Bool)

(assert (=> b!1103916 (= e!630135 (not (noDuplicate!1595 Nil!24079)))))

(declare-fun b!1103917 () Bool)

(declare-fun res!736514 () Bool)

(assert (=> b!1103917 (=> (not res!736514) (not e!630135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103917 (= res!736514 (validKeyInArray!0 k0!934))))

(declare-fun b!1103918 () Bool)

(declare-fun res!736509 () Bool)

(assert (=> b!1103918 (=> (not res!736509) (not e!630135))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71518 (_ BitVec 32)) Bool)

(assert (=> b!1103918 (= res!736509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71519 (store (arr!34415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34953 _keys!1208)) mask!1564))))

(declare-fun b!1103919 () Bool)

(declare-fun res!736512 () Bool)

(assert (=> b!1103919 (=> (not res!736512) (not e!630135))))

(assert (=> b!1103919 (= res!736512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103920 () Bool)

(declare-fun e!630137 () Bool)

(declare-fun tp_is_empty!27343 () Bool)

(assert (=> b!1103920 (= e!630137 tp_is_empty!27343)))

(declare-fun b!1103921 () Bool)

(declare-fun e!630136 () Bool)

(declare-fun mapRes!42823 () Bool)

(assert (=> b!1103921 (= e!630136 (and e!630137 mapRes!42823))))

(declare-fun condMapEmpty!42823 () Bool)

(declare-datatypes ((V!41585 0))(
  ( (V!41586 (val!13728 Int)) )
))
(declare-datatypes ((ValueCell!12962 0))(
  ( (ValueCellFull!12962 (v!16359 V!41585)) (EmptyCell!12962) )
))
(declare-datatypes ((array!71520 0))(
  ( (array!71521 (arr!34416 (Array (_ BitVec 32) ValueCell!12962)) (size!34954 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71520)

(declare-fun mapDefault!42823 () ValueCell!12962)

(assert (=> b!1103921 (= condMapEmpty!42823 (= (arr!34416 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12962)) mapDefault!42823)))))

(declare-fun res!736515 () Bool)

(assert (=> start!97060 (=> (not res!736515) (not e!630135))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97060 (= res!736515 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34953 _keys!1208))))))

(assert (=> start!97060 e!630135))

(declare-fun array_inv!26540 (array!71518) Bool)

(assert (=> start!97060 (array_inv!26540 _keys!1208)))

(assert (=> start!97060 true))

(declare-fun array_inv!26541 (array!71520) Bool)

(assert (=> start!97060 (and (array_inv!26541 _values!996) e!630136)))

(declare-fun mapNonEmpty!42823 () Bool)

(declare-fun tp!81743 () Bool)

(declare-fun e!630134 () Bool)

(assert (=> mapNonEmpty!42823 (= mapRes!42823 (and tp!81743 e!630134))))

(declare-fun mapKey!42823 () (_ BitVec 32))

(declare-fun mapRest!42823 () (Array (_ BitVec 32) ValueCell!12962))

(declare-fun mapValue!42823 () ValueCell!12962)

(assert (=> mapNonEmpty!42823 (= (arr!34416 _values!996) (store mapRest!42823 mapKey!42823 mapValue!42823))))

(declare-fun b!1103922 () Bool)

(declare-fun res!736517 () Bool)

(assert (=> b!1103922 (=> (not res!736517) (not e!630135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103922 (= res!736517 (validMask!0 mask!1564))))

(declare-fun b!1103923 () Bool)

(declare-fun res!736511 () Bool)

(assert (=> b!1103923 (=> (not res!736511) (not e!630135))))

(assert (=> b!1103923 (= res!736511 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34953 _keys!1208))))))

(declare-fun mapIsEmpty!42823 () Bool)

(assert (=> mapIsEmpty!42823 mapRes!42823))

(declare-fun b!1103924 () Bool)

(assert (=> b!1103924 (= e!630134 tp_is_empty!27343)))

(declare-fun b!1103925 () Bool)

(declare-fun res!736510 () Bool)

(assert (=> b!1103925 (=> (not res!736510) (not e!630135))))

(assert (=> b!1103925 (= res!736510 (and (bvsle #b00000000000000000000000000000000 (size!34953 _keys!1208)) (bvslt (size!34953 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1103926 () Bool)

(declare-fun res!736508 () Bool)

(assert (=> b!1103926 (=> (not res!736508) (not e!630135))))

(declare-fun arrayNoDuplicates!0 (array!71518 (_ BitVec 32) List!24082) Bool)

(assert (=> b!1103926 (= res!736508 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24079))))

(declare-fun b!1103927 () Bool)

(declare-fun res!736513 () Bool)

(assert (=> b!1103927 (=> (not res!736513) (not e!630135))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103927 (= res!736513 (and (= (size!34954 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34953 _keys!1208) (size!34954 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97060 res!736515) b!1103922))

(assert (= (and b!1103922 res!736517) b!1103927))

(assert (= (and b!1103927 res!736513) b!1103919))

(assert (= (and b!1103919 res!736512) b!1103926))

(assert (= (and b!1103926 res!736508) b!1103923))

(assert (= (and b!1103923 res!736511) b!1103917))

(assert (= (and b!1103917 res!736514) b!1103915))

(assert (= (and b!1103915 res!736516) b!1103918))

(assert (= (and b!1103918 res!736509) b!1103925))

(assert (= (and b!1103925 res!736510) b!1103916))

(assert (= (and b!1103921 condMapEmpty!42823) mapIsEmpty!42823))

(assert (= (and b!1103921 (not condMapEmpty!42823)) mapNonEmpty!42823))

(get-info :version)

(assert (= (and mapNonEmpty!42823 ((_ is ValueCellFull!12962) mapValue!42823)) b!1103924))

(assert (= (and b!1103921 ((_ is ValueCellFull!12962) mapDefault!42823)) b!1103920))

(assert (= start!97060 b!1103921))

(declare-fun m!1023325 () Bool)

(assert (=> b!1103915 m!1023325))

(declare-fun m!1023327 () Bool)

(assert (=> b!1103916 m!1023327))

(declare-fun m!1023329 () Bool)

(assert (=> b!1103917 m!1023329))

(declare-fun m!1023331 () Bool)

(assert (=> b!1103926 m!1023331))

(declare-fun m!1023333 () Bool)

(assert (=> start!97060 m!1023333))

(declare-fun m!1023335 () Bool)

(assert (=> start!97060 m!1023335))

(declare-fun m!1023337 () Bool)

(assert (=> b!1103918 m!1023337))

(declare-fun m!1023339 () Bool)

(assert (=> b!1103918 m!1023339))

(declare-fun m!1023341 () Bool)

(assert (=> b!1103922 m!1023341))

(declare-fun m!1023343 () Bool)

(assert (=> mapNonEmpty!42823 m!1023343))

(declare-fun m!1023345 () Bool)

(assert (=> b!1103919 m!1023345))

(check-sat (not b!1103917) (not start!97060) tp_is_empty!27343 (not mapNonEmpty!42823) (not b!1103918) (not b!1103922) (not b!1103926) (not b!1103919) (not b!1103916))
(check-sat)
(get-model)

(declare-fun b!1104014 () Bool)

(declare-fun e!630175 () Bool)

(declare-fun call!46312 () Bool)

(assert (=> b!1104014 (= e!630175 call!46312)))

(declare-fun b!1104015 () Bool)

(declare-fun e!630176 () Bool)

(assert (=> b!1104015 (= e!630176 call!46312)))

(declare-fun b!1104016 () Bool)

(assert (=> b!1104016 (= e!630175 e!630176)))

(declare-fun lt!494910 () (_ BitVec 64))

(assert (=> b!1104016 (= lt!494910 (select (arr!34415 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36069 0))(
  ( (Unit!36070) )
))
(declare-fun lt!494911 () Unit!36069)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71518 (_ BitVec 64) (_ BitVec 32)) Unit!36069)

(assert (=> b!1104016 (= lt!494911 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!494910 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104016 (arrayContainsKey!0 _keys!1208 lt!494910 #b00000000000000000000000000000000)))

(declare-fun lt!494912 () Unit!36069)

(assert (=> b!1104016 (= lt!494912 lt!494911)))

(declare-fun res!736582 () Bool)

(declare-datatypes ((SeekEntryResult!9921 0))(
  ( (MissingZero!9921 (index!42055 (_ BitVec 32))) (Found!9921 (index!42056 (_ BitVec 32))) (Intermediate!9921 (undefined!10733 Bool) (index!42057 (_ BitVec 32)) (x!99307 (_ BitVec 32))) (Undefined!9921) (MissingVacant!9921 (index!42058 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71518 (_ BitVec 32)) SeekEntryResult!9921)

(assert (=> b!1104016 (= res!736582 (= (seekEntryOrOpen!0 (select (arr!34415 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9921 #b00000000000000000000000000000000)))))

(assert (=> b!1104016 (=> (not res!736582) (not e!630176))))

(declare-fun b!1104017 () Bool)

(declare-fun e!630177 () Bool)

(assert (=> b!1104017 (= e!630177 e!630175)))

(declare-fun c!108950 () Bool)

(assert (=> b!1104017 (= c!108950 (validKeyInArray!0 (select (arr!34415 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!46309 () Bool)

(assert (=> bm!46309 (= call!46312 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!130711 () Bool)

(declare-fun res!736583 () Bool)

(assert (=> d!130711 (=> res!736583 e!630177)))

(assert (=> d!130711 (= res!736583 (bvsge #b00000000000000000000000000000000 (size!34953 _keys!1208)))))

(assert (=> d!130711 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!630177)))

(assert (= (and d!130711 (not res!736583)) b!1104017))

(assert (= (and b!1104017 c!108950) b!1104016))

(assert (= (and b!1104017 (not c!108950)) b!1104014))

(assert (= (and b!1104016 res!736582) b!1104015))

(assert (= (or b!1104015 b!1104014) bm!46309))

(declare-fun m!1023391 () Bool)

(assert (=> b!1104016 m!1023391))

(declare-fun m!1023393 () Bool)

(assert (=> b!1104016 m!1023393))

(declare-fun m!1023395 () Bool)

(assert (=> b!1104016 m!1023395))

(assert (=> b!1104016 m!1023391))

(declare-fun m!1023397 () Bool)

(assert (=> b!1104016 m!1023397))

(assert (=> b!1104017 m!1023391))

(assert (=> b!1104017 m!1023391))

(declare-fun m!1023399 () Bool)

(assert (=> b!1104017 m!1023399))

(declare-fun m!1023401 () Bool)

(assert (=> bm!46309 m!1023401))

(assert (=> b!1103919 d!130711))

(declare-fun d!130713 () Bool)

(declare-fun res!736588 () Bool)

(declare-fun e!630182 () Bool)

(assert (=> d!130713 (=> res!736588 e!630182)))

(assert (=> d!130713 (= res!736588 ((_ is Nil!24079) Nil!24079))))

(assert (=> d!130713 (= (noDuplicate!1595 Nil!24079) e!630182)))

(declare-fun b!1104022 () Bool)

(declare-fun e!630183 () Bool)

(assert (=> b!1104022 (= e!630182 e!630183)))

(declare-fun res!736589 () Bool)

(assert (=> b!1104022 (=> (not res!736589) (not e!630183))))

(declare-fun contains!6384 (List!24082 (_ BitVec 64)) Bool)

(assert (=> b!1104022 (= res!736589 (not (contains!6384 (t!34338 Nil!24079) (h!25287 Nil!24079))))))

(declare-fun b!1104023 () Bool)

(assert (=> b!1104023 (= e!630183 (noDuplicate!1595 (t!34338 Nil!24079)))))

(assert (= (and d!130713 (not res!736588)) b!1104022))

(assert (= (and b!1104022 res!736589) b!1104023))

(declare-fun m!1023403 () Bool)

(assert (=> b!1104022 m!1023403))

(declare-fun m!1023405 () Bool)

(assert (=> b!1104023 m!1023405))

(assert (=> b!1103916 d!130713))

(declare-fun d!130715 () Bool)

(assert (=> d!130715 (= (array_inv!26540 _keys!1208) (bvsge (size!34953 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97060 d!130715))

(declare-fun d!130717 () Bool)

(assert (=> d!130717 (= (array_inv!26541 _values!996) (bvsge (size!34954 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97060 d!130717))

(declare-fun bm!46312 () Bool)

(declare-fun call!46315 () Bool)

(declare-fun c!108953 () Bool)

(assert (=> bm!46312 (= call!46315 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108953 (Cons!24078 (select (arr!34415 _keys!1208) #b00000000000000000000000000000000) Nil!24079) Nil!24079)))))

(declare-fun b!1104034 () Bool)

(declare-fun e!630194 () Bool)

(declare-fun e!630193 () Bool)

(assert (=> b!1104034 (= e!630194 e!630193)))

(declare-fun res!736597 () Bool)

(assert (=> b!1104034 (=> (not res!736597) (not e!630193))))

(declare-fun e!630192 () Bool)

(assert (=> b!1104034 (= res!736597 (not e!630192))))

(declare-fun res!736596 () Bool)

(assert (=> b!1104034 (=> (not res!736596) (not e!630192))))

(assert (=> b!1104034 (= res!736596 (validKeyInArray!0 (select (arr!34415 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104035 () Bool)

(declare-fun e!630195 () Bool)

(assert (=> b!1104035 (= e!630195 call!46315)))

(declare-fun d!130719 () Bool)

(declare-fun res!736598 () Bool)

(assert (=> d!130719 (=> res!736598 e!630194)))

(assert (=> d!130719 (= res!736598 (bvsge #b00000000000000000000000000000000 (size!34953 _keys!1208)))))

(assert (=> d!130719 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24079) e!630194)))

(declare-fun b!1104036 () Bool)

(assert (=> b!1104036 (= e!630195 call!46315)))

(declare-fun b!1104037 () Bool)

(assert (=> b!1104037 (= e!630192 (contains!6384 Nil!24079 (select (arr!34415 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104038 () Bool)

(assert (=> b!1104038 (= e!630193 e!630195)))

(assert (=> b!1104038 (= c!108953 (validKeyInArray!0 (select (arr!34415 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!130719 (not res!736598)) b!1104034))

(assert (= (and b!1104034 res!736596) b!1104037))

(assert (= (and b!1104034 res!736597) b!1104038))

(assert (= (and b!1104038 c!108953) b!1104035))

(assert (= (and b!1104038 (not c!108953)) b!1104036))

(assert (= (or b!1104035 b!1104036) bm!46312))

(assert (=> bm!46312 m!1023391))

(declare-fun m!1023407 () Bool)

(assert (=> bm!46312 m!1023407))

(assert (=> b!1104034 m!1023391))

(assert (=> b!1104034 m!1023391))

(assert (=> b!1104034 m!1023399))

(assert (=> b!1104037 m!1023391))

(assert (=> b!1104037 m!1023391))

(declare-fun m!1023409 () Bool)

(assert (=> b!1104037 m!1023409))

(assert (=> b!1104038 m!1023391))

(assert (=> b!1104038 m!1023391))

(assert (=> b!1104038 m!1023399))

(assert (=> b!1103926 d!130719))

(declare-fun d!130721 () Bool)

(assert (=> d!130721 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1103917 d!130721))

(declare-fun b!1104039 () Bool)

(declare-fun e!630196 () Bool)

(declare-fun call!46316 () Bool)

(assert (=> b!1104039 (= e!630196 call!46316)))

(declare-fun b!1104040 () Bool)

(declare-fun e!630197 () Bool)

(assert (=> b!1104040 (= e!630197 call!46316)))

(declare-fun b!1104041 () Bool)

(assert (=> b!1104041 (= e!630196 e!630197)))

(declare-fun lt!494913 () (_ BitVec 64))

(assert (=> b!1104041 (= lt!494913 (select (arr!34415 (array!71519 (store (arr!34415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34953 _keys!1208))) #b00000000000000000000000000000000))))

(declare-fun lt!494914 () Unit!36069)

(assert (=> b!1104041 (= lt!494914 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71519 (store (arr!34415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34953 _keys!1208)) lt!494913 #b00000000000000000000000000000000))))

(assert (=> b!1104041 (arrayContainsKey!0 (array!71519 (store (arr!34415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34953 _keys!1208)) lt!494913 #b00000000000000000000000000000000)))

(declare-fun lt!494915 () Unit!36069)

(assert (=> b!1104041 (= lt!494915 lt!494914)))

(declare-fun res!736599 () Bool)

(assert (=> b!1104041 (= res!736599 (= (seekEntryOrOpen!0 (select (arr!34415 (array!71519 (store (arr!34415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34953 _keys!1208))) #b00000000000000000000000000000000) (array!71519 (store (arr!34415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34953 _keys!1208)) mask!1564) (Found!9921 #b00000000000000000000000000000000)))))

(assert (=> b!1104041 (=> (not res!736599) (not e!630197))))

(declare-fun b!1104042 () Bool)

(declare-fun e!630198 () Bool)

(assert (=> b!1104042 (= e!630198 e!630196)))

(declare-fun c!108954 () Bool)

(assert (=> b!1104042 (= c!108954 (validKeyInArray!0 (select (arr!34415 (array!71519 (store (arr!34415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34953 _keys!1208))) #b00000000000000000000000000000000)))))

(declare-fun bm!46313 () Bool)

(assert (=> bm!46313 (= call!46316 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!71519 (store (arr!34415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34953 _keys!1208)) mask!1564))))

(declare-fun d!130723 () Bool)

(declare-fun res!736600 () Bool)

(assert (=> d!130723 (=> res!736600 e!630198)))

(assert (=> d!130723 (= res!736600 (bvsge #b00000000000000000000000000000000 (size!34953 (array!71519 (store (arr!34415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34953 _keys!1208)))))))

(assert (=> d!130723 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71519 (store (arr!34415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34953 _keys!1208)) mask!1564) e!630198)))

(assert (= (and d!130723 (not res!736600)) b!1104042))

(assert (= (and b!1104042 c!108954) b!1104041))

(assert (= (and b!1104042 (not c!108954)) b!1104039))

(assert (= (and b!1104041 res!736599) b!1104040))

(assert (= (or b!1104040 b!1104039) bm!46313))

(declare-fun m!1023411 () Bool)

(assert (=> b!1104041 m!1023411))

(declare-fun m!1023413 () Bool)

(assert (=> b!1104041 m!1023413))

(declare-fun m!1023415 () Bool)

(assert (=> b!1104041 m!1023415))

(assert (=> b!1104041 m!1023411))

(declare-fun m!1023417 () Bool)

(assert (=> b!1104041 m!1023417))

(assert (=> b!1104042 m!1023411))

(assert (=> b!1104042 m!1023411))

(declare-fun m!1023419 () Bool)

(assert (=> b!1104042 m!1023419))

(declare-fun m!1023421 () Bool)

(assert (=> bm!46313 m!1023421))

(assert (=> b!1103918 d!130723))

(declare-fun d!130725 () Bool)

(assert (=> d!130725 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1103922 d!130725))

(declare-fun mapNonEmpty!42832 () Bool)

(declare-fun mapRes!42832 () Bool)

(declare-fun tp!81752 () Bool)

(declare-fun e!630203 () Bool)

(assert (=> mapNonEmpty!42832 (= mapRes!42832 (and tp!81752 e!630203))))

(declare-fun mapRest!42832 () (Array (_ BitVec 32) ValueCell!12962))

(declare-fun mapKey!42832 () (_ BitVec 32))

(declare-fun mapValue!42832 () ValueCell!12962)

(assert (=> mapNonEmpty!42832 (= mapRest!42823 (store mapRest!42832 mapKey!42832 mapValue!42832))))

(declare-fun condMapEmpty!42832 () Bool)

(declare-fun mapDefault!42832 () ValueCell!12962)

(assert (=> mapNonEmpty!42823 (= condMapEmpty!42832 (= mapRest!42823 ((as const (Array (_ BitVec 32) ValueCell!12962)) mapDefault!42832)))))

(declare-fun e!630204 () Bool)

(assert (=> mapNonEmpty!42823 (= tp!81743 (and e!630204 mapRes!42832))))

(declare-fun b!1104049 () Bool)

(assert (=> b!1104049 (= e!630203 tp_is_empty!27343)))

(declare-fun mapIsEmpty!42832 () Bool)

(assert (=> mapIsEmpty!42832 mapRes!42832))

(declare-fun b!1104050 () Bool)

(assert (=> b!1104050 (= e!630204 tp_is_empty!27343)))

(assert (= (and mapNonEmpty!42823 condMapEmpty!42832) mapIsEmpty!42832))

(assert (= (and mapNonEmpty!42823 (not condMapEmpty!42832)) mapNonEmpty!42832))

(assert (= (and mapNonEmpty!42832 ((_ is ValueCellFull!12962) mapValue!42832)) b!1104049))

(assert (= (and mapNonEmpty!42823 ((_ is ValueCellFull!12962) mapDefault!42832)) b!1104050))

(declare-fun m!1023423 () Bool)

(assert (=> mapNonEmpty!42832 m!1023423))

(check-sat (not bm!46309) (not mapNonEmpty!42832) (not bm!46312) (not b!1104016) (not b!1104041) (not bm!46313) tp_is_empty!27343 (not b!1104034) (not b!1104038) (not b!1104022) (not b!1104042) (not b!1104037) (not b!1104023) (not b!1104017))
(check-sat)
