; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84530 () Bool)

(assert start!84530)

(declare-fun b_free!20025 () Bool)

(declare-fun b_next!20025 () Bool)

(assert (=> start!84530 (= b_free!20025 (not b_next!20025))))

(declare-fun tp!69859 () Bool)

(declare-fun b_and!32119 () Bool)

(assert (=> start!84530 (= tp!69859 b_and!32119)))

(declare-fun mapNonEmpty!36900 () Bool)

(declare-fun mapRes!36900 () Bool)

(declare-fun tp!69860 () Bool)

(declare-fun e!557508 () Bool)

(assert (=> mapNonEmpty!36900 (= mapRes!36900 (and tp!69860 e!557508))))

(declare-datatypes ((V!35971 0))(
  ( (V!35972 (val!11671 Int)) )
))
(declare-datatypes ((ValueCell!11139 0))(
  ( (ValueCellFull!11139 (v!14238 V!35971)) (EmptyCell!11139) )
))
(declare-fun mapValue!36900 () ValueCell!11139)

(declare-datatypes ((array!62441 0))(
  ( (array!62442 (arr!30075 (Array (_ BitVec 32) ValueCell!11139)) (size!30554 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62441)

(declare-fun mapKey!36900 () (_ BitVec 32))

(declare-fun mapRest!36900 () (Array (_ BitVec 32) ValueCell!11139))

(assert (=> mapNonEmpty!36900 (= (arr!30075 _values!1278) (store mapRest!36900 mapKey!36900 mapValue!36900))))

(declare-fun b!988702 () Bool)

(declare-fun e!557505 () Bool)

(declare-datatypes ((array!62443 0))(
  ( (array!62444 (arr!30076 (Array (_ BitVec 32) (_ BitVec 64))) (size!30555 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62443)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!988702 (= e!557505 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30076 _keys!1544) from!1932)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35971)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14872 0))(
  ( (tuple2!14873 (_1!7447 (_ BitVec 64)) (_2!7447 V!35971)) )
))
(declare-datatypes ((List!20802 0))(
  ( (Nil!20799) (Cons!20798 (h!21960 tuple2!14872) (t!29739 List!20802)) )
))
(declare-datatypes ((ListLongMap!13569 0))(
  ( (ListLongMap!13570 (toList!6800 List!20802)) )
))
(declare-fun lt!438544 () ListLongMap!13569)

(declare-fun zeroValue!1220 () V!35971)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3491 (array!62443 array!62441 (_ BitVec 32) (_ BitVec 32) V!35971 V!35971 (_ BitVec 32) Int) ListLongMap!13569)

(assert (=> b!988702 (= lt!438544 (getCurrentListMapNoExtraKeys!3491 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988703 () Bool)

(declare-fun res!661287 () Bool)

(assert (=> b!988703 (=> (not res!661287) (not e!557505))))

(assert (=> b!988703 (= res!661287 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30555 _keys!1544))))))

(declare-fun b!988704 () Bool)

(declare-fun res!661282 () Bool)

(assert (=> b!988704 (=> (not res!661282) (not e!557505))))

(assert (=> b!988704 (= res!661282 (and (= (size!30554 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30555 _keys!1544) (size!30554 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36900 () Bool)

(assert (=> mapIsEmpty!36900 mapRes!36900))

(declare-fun b!988705 () Bool)

(declare-fun e!557507 () Bool)

(declare-fun e!557509 () Bool)

(assert (=> b!988705 (= e!557507 (and e!557509 mapRes!36900))))

(declare-fun condMapEmpty!36900 () Bool)

(declare-fun mapDefault!36900 () ValueCell!11139)

(assert (=> b!988705 (= condMapEmpty!36900 (= (arr!30075 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11139)) mapDefault!36900)))))

(declare-fun b!988706 () Bool)

(declare-fun res!661284 () Bool)

(assert (=> b!988706 (=> (not res!661284) (not e!557505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988706 (= res!661284 (validKeyInArray!0 (select (arr!30076 _keys!1544) from!1932)))))

(declare-fun b!988707 () Bool)

(declare-fun tp_is_empty!23241 () Bool)

(assert (=> b!988707 (= e!557508 tp_is_empty!23241)))

(declare-fun b!988708 () Bool)

(declare-fun res!661281 () Bool)

(assert (=> b!988708 (=> (not res!661281) (not e!557505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62443 (_ BitVec 32)) Bool)

(assert (=> b!988708 (= res!661281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988709 () Bool)

(declare-fun res!661285 () Bool)

(assert (=> b!988709 (=> (not res!661285) (not e!557505))))

(declare-datatypes ((List!20803 0))(
  ( (Nil!20800) (Cons!20799 (h!21961 (_ BitVec 64)) (t!29740 List!20803)) )
))
(declare-fun arrayNoDuplicates!0 (array!62443 (_ BitVec 32) List!20803) Bool)

(assert (=> b!988709 (= res!661285 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20800))))

(declare-fun res!661286 () Bool)

(assert (=> start!84530 (=> (not res!661286) (not e!557505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84530 (= res!661286 (validMask!0 mask!1948))))

(assert (=> start!84530 e!557505))

(assert (=> start!84530 true))

(assert (=> start!84530 tp_is_empty!23241))

(declare-fun array_inv!23239 (array!62441) Bool)

(assert (=> start!84530 (and (array_inv!23239 _values!1278) e!557507)))

(assert (=> start!84530 tp!69859))

(declare-fun array_inv!23240 (array!62443) Bool)

(assert (=> start!84530 (array_inv!23240 _keys!1544)))

(declare-fun b!988710 () Bool)

(declare-fun res!661283 () Bool)

(assert (=> b!988710 (=> (not res!661283) (not e!557505))))

(assert (=> b!988710 (= res!661283 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988711 () Bool)

(assert (=> b!988711 (= e!557509 tp_is_empty!23241)))

(assert (= (and start!84530 res!661286) b!988704))

(assert (= (and b!988704 res!661282) b!988708))

(assert (= (and b!988708 res!661281) b!988709))

(assert (= (and b!988709 res!661285) b!988703))

(assert (= (and b!988703 res!661287) b!988706))

(assert (= (and b!988706 res!661284) b!988710))

(assert (= (and b!988710 res!661283) b!988702))

(assert (= (and b!988705 condMapEmpty!36900) mapIsEmpty!36900))

(assert (= (and b!988705 (not condMapEmpty!36900)) mapNonEmpty!36900))

(get-info :version)

(assert (= (and mapNonEmpty!36900 ((_ is ValueCellFull!11139) mapValue!36900)) b!988707))

(assert (= (and b!988705 ((_ is ValueCellFull!11139) mapDefault!36900)) b!988711))

(assert (= start!84530 b!988705))

(declare-fun m!915859 () Bool)

(assert (=> start!84530 m!915859))

(declare-fun m!915861 () Bool)

(assert (=> start!84530 m!915861))

(declare-fun m!915863 () Bool)

(assert (=> start!84530 m!915863))

(declare-fun m!915865 () Bool)

(assert (=> b!988706 m!915865))

(assert (=> b!988706 m!915865))

(declare-fun m!915867 () Bool)

(assert (=> b!988706 m!915867))

(declare-fun m!915869 () Bool)

(assert (=> b!988709 m!915869))

(declare-fun m!915871 () Bool)

(assert (=> mapNonEmpty!36900 m!915871))

(assert (=> b!988702 m!915865))

(declare-fun m!915873 () Bool)

(assert (=> b!988702 m!915873))

(declare-fun m!915875 () Bool)

(assert (=> b!988708 m!915875))

(check-sat (not b!988702) (not b!988709) (not b!988706) (not b_next!20025) (not start!84530) b_and!32119 (not b!988708) (not mapNonEmpty!36900) tp_is_empty!23241)
(check-sat b_and!32119 (not b_next!20025))
(get-model)

(declare-fun d!117257 () Bool)

(declare-fun res!661313 () Bool)

(declare-fun e!557531 () Bool)

(assert (=> d!117257 (=> res!661313 e!557531)))

(assert (=> d!117257 (= res!661313 (bvsge #b00000000000000000000000000000000 (size!30555 _keys!1544)))))

(assert (=> d!117257 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!557531)))

(declare-fun b!988750 () Bool)

(declare-fun e!557532 () Bool)

(declare-fun call!41885 () Bool)

(assert (=> b!988750 (= e!557532 call!41885)))

(declare-fun b!988751 () Bool)

(declare-fun e!557533 () Bool)

(assert (=> b!988751 (= e!557533 call!41885)))

(declare-fun b!988752 () Bool)

(assert (=> b!988752 (= e!557531 e!557532)))

(declare-fun c!100227 () Bool)

(assert (=> b!988752 (= c!100227 (validKeyInArray!0 (select (arr!30076 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41882 () Bool)

(assert (=> bm!41882 (= call!41885 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!988753 () Bool)

(assert (=> b!988753 (= e!557532 e!557533)))

(declare-fun lt!438555 () (_ BitVec 64))

(assert (=> b!988753 (= lt!438555 (select (arr!30076 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32813 0))(
  ( (Unit!32814) )
))
(declare-fun lt!438554 () Unit!32813)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62443 (_ BitVec 64) (_ BitVec 32)) Unit!32813)

(assert (=> b!988753 (= lt!438554 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438555 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!988753 (arrayContainsKey!0 _keys!1544 lt!438555 #b00000000000000000000000000000000)))

(declare-fun lt!438556 () Unit!32813)

(assert (=> b!988753 (= lt!438556 lt!438554)))

(declare-fun res!661314 () Bool)

(declare-datatypes ((SeekEntryResult!9209 0))(
  ( (MissingZero!9209 (index!39207 (_ BitVec 32))) (Found!9209 (index!39208 (_ BitVec 32))) (Intermediate!9209 (undefined!10021 Bool) (index!39209 (_ BitVec 32)) (x!86038 (_ BitVec 32))) (Undefined!9209) (MissingVacant!9209 (index!39210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62443 (_ BitVec 32)) SeekEntryResult!9209)

(assert (=> b!988753 (= res!661314 (= (seekEntryOrOpen!0 (select (arr!30076 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9209 #b00000000000000000000000000000000)))))

(assert (=> b!988753 (=> (not res!661314) (not e!557533))))

(assert (= (and d!117257 (not res!661313)) b!988752))

(assert (= (and b!988752 c!100227) b!988753))

(assert (= (and b!988752 (not c!100227)) b!988750))

(assert (= (and b!988753 res!661314) b!988751))

(assert (= (or b!988751 b!988750) bm!41882))

(declare-fun m!915895 () Bool)

(assert (=> b!988752 m!915895))

(assert (=> b!988752 m!915895))

(declare-fun m!915897 () Bool)

(assert (=> b!988752 m!915897))

(declare-fun m!915899 () Bool)

(assert (=> bm!41882 m!915899))

(assert (=> b!988753 m!915895))

(declare-fun m!915901 () Bool)

(assert (=> b!988753 m!915901))

(declare-fun m!915903 () Bool)

(assert (=> b!988753 m!915903))

(assert (=> b!988753 m!915895))

(declare-fun m!915905 () Bool)

(assert (=> b!988753 m!915905))

(assert (=> b!988708 d!117257))

(declare-fun b!988764 () Bool)

(declare-fun e!557543 () Bool)

(declare-fun contains!5716 (List!20803 (_ BitVec 64)) Bool)

(assert (=> b!988764 (= e!557543 (contains!5716 Nil!20800 (select (arr!30076 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41885 () Bool)

(declare-fun call!41888 () Bool)

(declare-fun c!100230 () Bool)

(assert (=> bm!41885 (= call!41888 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100230 (Cons!20799 (select (arr!30076 _keys!1544) #b00000000000000000000000000000000) Nil!20800) Nil!20800)))))

(declare-fun b!988765 () Bool)

(declare-fun e!557542 () Bool)

(declare-fun e!557544 () Bool)

(assert (=> b!988765 (= e!557542 e!557544)))

(assert (=> b!988765 (= c!100230 (validKeyInArray!0 (select (arr!30076 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117259 () Bool)

(declare-fun res!661321 () Bool)

(declare-fun e!557545 () Bool)

(assert (=> d!117259 (=> res!661321 e!557545)))

(assert (=> d!117259 (= res!661321 (bvsge #b00000000000000000000000000000000 (size!30555 _keys!1544)))))

(assert (=> d!117259 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20800) e!557545)))

(declare-fun b!988766 () Bool)

(assert (=> b!988766 (= e!557545 e!557542)))

(declare-fun res!661322 () Bool)

(assert (=> b!988766 (=> (not res!661322) (not e!557542))))

(assert (=> b!988766 (= res!661322 (not e!557543))))

(declare-fun res!661323 () Bool)

(assert (=> b!988766 (=> (not res!661323) (not e!557543))))

(assert (=> b!988766 (= res!661323 (validKeyInArray!0 (select (arr!30076 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988767 () Bool)

(assert (=> b!988767 (= e!557544 call!41888)))

(declare-fun b!988768 () Bool)

(assert (=> b!988768 (= e!557544 call!41888)))

(assert (= (and d!117259 (not res!661321)) b!988766))

(assert (= (and b!988766 res!661323) b!988764))

(assert (= (and b!988766 res!661322) b!988765))

(assert (= (and b!988765 c!100230) b!988768))

(assert (= (and b!988765 (not c!100230)) b!988767))

(assert (= (or b!988768 b!988767) bm!41885))

(assert (=> b!988764 m!915895))

(assert (=> b!988764 m!915895))

(declare-fun m!915907 () Bool)

(assert (=> b!988764 m!915907))

(assert (=> bm!41885 m!915895))

(declare-fun m!915909 () Bool)

(assert (=> bm!41885 m!915909))

(assert (=> b!988765 m!915895))

(assert (=> b!988765 m!915895))

(assert (=> b!988765 m!915897))

(assert (=> b!988766 m!915895))

(assert (=> b!988766 m!915895))

(assert (=> b!988766 m!915897))

(assert (=> b!988709 d!117259))

(declare-fun d!117261 () Bool)

(assert (=> d!117261 (= (validKeyInArray!0 (select (arr!30076 _keys!1544) from!1932)) (and (not (= (select (arr!30076 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30076 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!988706 d!117261))

(declare-fun d!117263 () Bool)

(assert (=> d!117263 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84530 d!117263))

(declare-fun d!117265 () Bool)

(assert (=> d!117265 (= (array_inv!23239 _values!1278) (bvsge (size!30554 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84530 d!117265))

(declare-fun d!117267 () Bool)

(assert (=> d!117267 (= (array_inv!23240 _keys!1544) (bvsge (size!30555 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84530 d!117267))

(declare-fun b!988793 () Bool)

(assert (=> b!988793 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30555 _keys!1544)))))

(assert (=> b!988793 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _values!1278)))))

(declare-fun lt!438576 () ListLongMap!13569)

(declare-fun e!557561 () Bool)

(declare-fun apply!894 (ListLongMap!13569 (_ BitVec 64)) V!35971)

(declare-fun get!15608 (ValueCell!11139 V!35971) V!35971)

(declare-fun dynLambda!1862 (Int (_ BitVec 64)) V!35971)

(assert (=> b!988793 (= e!557561 (= (apply!894 lt!438576 (select (arr!30076 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15608 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1862 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!117269 () Bool)

(declare-fun e!557560 () Bool)

(assert (=> d!117269 e!557560))

(declare-fun res!661332 () Bool)

(assert (=> d!117269 (=> (not res!661332) (not e!557560))))

(declare-fun contains!5717 (ListLongMap!13569 (_ BitVec 64)) Bool)

(assert (=> d!117269 (= res!661332 (not (contains!5717 lt!438576 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!557562 () ListLongMap!13569)

(assert (=> d!117269 (= lt!438576 e!557562)))

(declare-fun c!100239 () Bool)

(assert (=> d!117269 (= c!100239 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30555 _keys!1544)))))

(assert (=> d!117269 (validMask!0 mask!1948)))

(assert (=> d!117269 (= (getCurrentListMapNoExtraKeys!3491 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438576)))

(declare-fun b!988794 () Bool)

(declare-fun e!557564 () Bool)

(assert (=> b!988794 (= e!557564 (= lt!438576 (getCurrentListMapNoExtraKeys!3491 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!988795 () Bool)

(declare-fun e!557563 () Bool)

(assert (=> b!988795 (= e!557563 (validKeyInArray!0 (select (arr!30076 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988795 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun bm!41888 () Bool)

(declare-fun call!41891 () ListLongMap!13569)

(assert (=> bm!41888 (= call!41891 (getCurrentListMapNoExtraKeys!3491 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!988796 () Bool)

(declare-fun e!557565 () ListLongMap!13569)

(assert (=> b!988796 (= e!557562 e!557565)))

(declare-fun c!100240 () Bool)

(assert (=> b!988796 (= c!100240 (validKeyInArray!0 (select (arr!30076 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!988797 () Bool)

(declare-fun isEmpty!722 (ListLongMap!13569) Bool)

(assert (=> b!988797 (= e!557564 (isEmpty!722 lt!438576))))

(declare-fun b!988798 () Bool)

(assert (=> b!988798 (= e!557562 (ListLongMap!13570 Nil!20799))))

(declare-fun b!988799 () Bool)

(declare-fun e!557566 () Bool)

(assert (=> b!988799 (= e!557560 e!557566)))

(declare-fun c!100241 () Bool)

(assert (=> b!988799 (= c!100241 e!557563)))

(declare-fun res!661333 () Bool)

(assert (=> b!988799 (=> (not res!661333) (not e!557563))))

(assert (=> b!988799 (= res!661333 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30555 _keys!1544)))))

(declare-fun b!988800 () Bool)

(assert (=> b!988800 (= e!557565 call!41891)))

(declare-fun b!988801 () Bool)

(assert (=> b!988801 (= e!557566 e!557561)))

(assert (=> b!988801 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30555 _keys!1544)))))

(declare-fun res!661335 () Bool)

(assert (=> b!988801 (= res!661335 (contains!5717 lt!438576 (select (arr!30076 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988801 (=> (not res!661335) (not e!557561))))

(declare-fun b!988802 () Bool)

(assert (=> b!988802 (= e!557566 e!557564)))

(declare-fun c!100242 () Bool)

(assert (=> b!988802 (= c!100242 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30555 _keys!1544)))))

(declare-fun b!988803 () Bool)

(declare-fun lt!438572 () Unit!32813)

(declare-fun lt!438577 () Unit!32813)

(assert (=> b!988803 (= lt!438572 lt!438577)))

(declare-fun lt!438573 () (_ BitVec 64))

(declare-fun lt!438575 () V!35971)

(declare-fun lt!438571 () ListLongMap!13569)

(declare-fun lt!438574 () (_ BitVec 64))

(declare-fun +!3079 (ListLongMap!13569 tuple2!14872) ListLongMap!13569)

(assert (=> b!988803 (not (contains!5717 (+!3079 lt!438571 (tuple2!14873 lt!438574 lt!438575)) lt!438573))))

(declare-fun addStillNotContains!233 (ListLongMap!13569 (_ BitVec 64) V!35971 (_ BitVec 64)) Unit!32813)

(assert (=> b!988803 (= lt!438577 (addStillNotContains!233 lt!438571 lt!438574 lt!438575 lt!438573))))

(assert (=> b!988803 (= lt!438573 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!988803 (= lt!438575 (get!15608 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1862 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!988803 (= lt!438574 (select (arr!30076 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!988803 (= lt!438571 call!41891)))

(assert (=> b!988803 (= e!557565 (+!3079 call!41891 (tuple2!14873 (select (arr!30076 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15608 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1862 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!988804 () Bool)

(declare-fun res!661334 () Bool)

(assert (=> b!988804 (=> (not res!661334) (not e!557560))))

(assert (=> b!988804 (= res!661334 (not (contains!5717 lt!438576 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117269 c!100239) b!988798))

(assert (= (and d!117269 (not c!100239)) b!988796))

(assert (= (and b!988796 c!100240) b!988803))

(assert (= (and b!988796 (not c!100240)) b!988800))

(assert (= (or b!988803 b!988800) bm!41888))

(assert (= (and d!117269 res!661332) b!988804))

(assert (= (and b!988804 res!661334) b!988799))

(assert (= (and b!988799 res!661333) b!988795))

(assert (= (and b!988799 c!100241) b!988801))

(assert (= (and b!988799 (not c!100241)) b!988802))

(assert (= (and b!988801 res!661335) b!988793))

(assert (= (and b!988802 c!100242) b!988794))

(assert (= (and b!988802 (not c!100242)) b!988797))

(declare-fun b_lambda!15077 () Bool)

(assert (=> (not b_lambda!15077) (not b!988793)))

(declare-fun t!29743 () Bool)

(declare-fun tb!6789 () Bool)

(assert (=> (and start!84530 (= defaultEntry!1281 defaultEntry!1281) t!29743) tb!6789))

(declare-fun result!13573 () Bool)

(assert (=> tb!6789 (= result!13573 tp_is_empty!23241)))

(assert (=> b!988793 t!29743))

(declare-fun b_and!32123 () Bool)

(assert (= b_and!32119 (and (=> t!29743 result!13573) b_and!32123)))

(declare-fun b_lambda!15079 () Bool)

(assert (=> (not b_lambda!15079) (not b!988803)))

(assert (=> b!988803 t!29743))

(declare-fun b_and!32125 () Bool)

(assert (= b_and!32123 (and (=> t!29743 result!13573) b_and!32125)))

(declare-fun m!915911 () Bool)

(assert (=> b!988804 m!915911))

(declare-fun m!915913 () Bool)

(assert (=> b!988803 m!915913))

(declare-fun m!915915 () Bool)

(assert (=> b!988803 m!915915))

(declare-fun m!915917 () Bool)

(assert (=> b!988803 m!915917))

(assert (=> b!988803 m!915913))

(declare-fun m!915919 () Bool)

(assert (=> b!988803 m!915919))

(declare-fun m!915921 () Bool)

(assert (=> b!988803 m!915921))

(declare-fun m!915923 () Bool)

(assert (=> b!988803 m!915923))

(assert (=> b!988803 m!915921))

(assert (=> b!988803 m!915915))

(declare-fun m!915925 () Bool)

(assert (=> b!988803 m!915925))

(declare-fun m!915927 () Bool)

(assert (=> b!988803 m!915927))

(declare-fun m!915929 () Bool)

(assert (=> d!117269 m!915929))

(assert (=> d!117269 m!915859))

(declare-fun m!915931 () Bool)

(assert (=> b!988797 m!915931))

(declare-fun m!915933 () Bool)

(assert (=> bm!41888 m!915933))

(assert (=> b!988793 m!915915))

(assert (=> b!988793 m!915927))

(declare-fun m!915935 () Bool)

(assert (=> b!988793 m!915935))

(assert (=> b!988793 m!915921))

(assert (=> b!988793 m!915921))

(assert (=> b!988793 m!915915))

(assert (=> b!988793 m!915925))

(assert (=> b!988793 m!915927))

(assert (=> b!988801 m!915927))

(assert (=> b!988801 m!915927))

(declare-fun m!915937 () Bool)

(assert (=> b!988801 m!915937))

(assert (=> b!988794 m!915933))

(assert (=> b!988795 m!915927))

(assert (=> b!988795 m!915927))

(declare-fun m!915939 () Bool)

(assert (=> b!988795 m!915939))

(assert (=> b!988796 m!915927))

(assert (=> b!988796 m!915927))

(assert (=> b!988796 m!915939))

(assert (=> b!988702 d!117269))

(declare-fun b!988814 () Bool)

(declare-fun e!557572 () Bool)

(assert (=> b!988814 (= e!557572 tp_is_empty!23241)))

(declare-fun mapIsEmpty!36906 () Bool)

(declare-fun mapRes!36906 () Bool)

(assert (=> mapIsEmpty!36906 mapRes!36906))

(declare-fun mapNonEmpty!36906 () Bool)

(declare-fun tp!69869 () Bool)

(declare-fun e!557571 () Bool)

(assert (=> mapNonEmpty!36906 (= mapRes!36906 (and tp!69869 e!557571))))

(declare-fun mapValue!36906 () ValueCell!11139)

(declare-fun mapRest!36906 () (Array (_ BitVec 32) ValueCell!11139))

(declare-fun mapKey!36906 () (_ BitVec 32))

(assert (=> mapNonEmpty!36906 (= mapRest!36900 (store mapRest!36906 mapKey!36906 mapValue!36906))))

(declare-fun condMapEmpty!36906 () Bool)

(declare-fun mapDefault!36906 () ValueCell!11139)

(assert (=> mapNonEmpty!36900 (= condMapEmpty!36906 (= mapRest!36900 ((as const (Array (_ BitVec 32) ValueCell!11139)) mapDefault!36906)))))

(assert (=> mapNonEmpty!36900 (= tp!69860 (and e!557572 mapRes!36906))))

(declare-fun b!988813 () Bool)

(assert (=> b!988813 (= e!557571 tp_is_empty!23241)))

(assert (= (and mapNonEmpty!36900 condMapEmpty!36906) mapIsEmpty!36906))

(assert (= (and mapNonEmpty!36900 (not condMapEmpty!36906)) mapNonEmpty!36906))

(assert (= (and mapNonEmpty!36906 ((_ is ValueCellFull!11139) mapValue!36906)) b!988813))

(assert (= (and mapNonEmpty!36900 ((_ is ValueCellFull!11139) mapDefault!36906)) b!988814))

(declare-fun m!915941 () Bool)

(assert (=> mapNonEmpty!36906 m!915941))

(declare-fun b_lambda!15081 () Bool)

(assert (= b_lambda!15077 (or (and start!84530 b_free!20025) b_lambda!15081)))

(declare-fun b_lambda!15083 () Bool)

(assert (= b_lambda!15079 (or (and start!84530 b_free!20025) b_lambda!15083)))

(check-sat (not b!988796) (not mapNonEmpty!36906) (not b!988795) (not b!988801) (not b!988794) b_and!32125 (not b!988765) (not d!117269) (not bm!41888) (not b!988804) (not b!988797) (not b!988803) (not bm!41882) (not b_next!20025) (not bm!41885) (not b_lambda!15081) (not b!988752) (not b!988793) (not b!988764) (not b!988753) (not b!988766) tp_is_empty!23241 (not b_lambda!15083))
(check-sat b_and!32125 (not b_next!20025))
