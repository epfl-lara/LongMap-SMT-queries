; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20896 () Bool)

(assert start!20896)

(declare-fun b_free!5529 () Bool)

(declare-fun b_next!5529 () Bool)

(assert (=> start!20896 (= b_free!5529 (not b_next!5529))))

(declare-fun tp!19631 () Bool)

(declare-fun b_and!12287 () Bool)

(assert (=> start!20896 (= tp!19631 b_and!12287)))

(declare-fun b!209802 () Bool)

(declare-fun res!102309 () Bool)

(declare-fun e!136658 () Bool)

(assert (=> b!209802 (=> (not res!102309) (not e!136658))))

(declare-datatypes ((array!9979 0))(
  ( (array!9980 (arr!4739 (Array (_ BitVec 32) (_ BitVec 64))) (size!5064 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9979)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9979 (_ BitVec 32)) Bool)

(assert (=> b!209802 (= res!102309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!9158 () Bool)

(declare-fun mapRes!9158 () Bool)

(assert (=> mapIsEmpty!9158 mapRes!9158))

(declare-fun b!209803 () Bool)

(declare-fun e!136660 () Bool)

(declare-fun e!136657 () Bool)

(assert (=> b!209803 (= e!136660 (and e!136657 mapRes!9158))))

(declare-fun condMapEmpty!9158 () Bool)

(declare-datatypes ((V!6835 0))(
  ( (V!6836 (val!2740 Int)) )
))
(declare-datatypes ((ValueCell!2352 0))(
  ( (ValueCellFull!2352 (v!4714 V!6835)) (EmptyCell!2352) )
))
(declare-datatypes ((array!9981 0))(
  ( (array!9982 (arr!4740 (Array (_ BitVec 32) ValueCell!2352)) (size!5065 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9981)

(declare-fun mapDefault!9158 () ValueCell!2352)

(assert (=> b!209803 (= condMapEmpty!9158 (= (arr!4740 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2352)) mapDefault!9158)))))

(declare-fun b!209804 () Bool)

(declare-fun res!102308 () Bool)

(assert (=> b!209804 (=> (not res!102308) (not e!136658))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209804 (= res!102308 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5064 _keys!825))))))

(declare-fun res!102307 () Bool)

(assert (=> start!20896 (=> (not res!102307) (not e!136658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20896 (= res!102307 (validMask!0 mask!1149))))

(assert (=> start!20896 e!136658))

(declare-fun array_inv!3139 (array!9981) Bool)

(assert (=> start!20896 (and (array_inv!3139 _values!649) e!136660)))

(assert (=> start!20896 true))

(declare-fun tp_is_empty!5391 () Bool)

(assert (=> start!20896 tp_is_empty!5391))

(declare-fun array_inv!3140 (array!9979) Bool)

(assert (=> start!20896 (array_inv!3140 _keys!825)))

(assert (=> start!20896 tp!19631))

(declare-fun b!209805 () Bool)

(declare-fun e!136661 () Bool)

(assert (=> b!209805 (= e!136658 (not e!136661))))

(declare-fun res!102304 () Bool)

(assert (=> b!209805 (=> res!102304 e!136661)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209805 (= res!102304 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4140 0))(
  ( (tuple2!4141 (_1!2081 (_ BitVec 64)) (_2!2081 V!6835)) )
))
(declare-datatypes ((List!3036 0))(
  ( (Nil!3033) (Cons!3032 (h!3674 tuple2!4140) (t!7969 List!3036)) )
))
(declare-datatypes ((ListLongMap!3053 0))(
  ( (ListLongMap!3054 (toList!1542 List!3036)) )
))
(declare-fun lt!107289 () ListLongMap!3053)

(declare-fun zeroValue!615 () V!6835)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6835)

(declare-fun getCurrentListMap!1080 (array!9979 array!9981 (_ BitVec 32) (_ BitVec 32) V!6835 V!6835 (_ BitVec 32) Int) ListLongMap!3053)

(assert (=> b!209805 (= lt!107289 (getCurrentListMap!1080 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107287 () array!9981)

(declare-fun lt!107283 () ListLongMap!3053)

(assert (=> b!209805 (= lt!107283 (getCurrentListMap!1080 _keys!825 lt!107287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107286 () ListLongMap!3053)

(declare-fun lt!107282 () ListLongMap!3053)

(assert (=> b!209805 (and (= lt!107286 lt!107282) (= lt!107282 lt!107286))))

(declare-fun v!520 () V!6835)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!107288 () ListLongMap!3053)

(declare-fun +!545 (ListLongMap!3053 tuple2!4140) ListLongMap!3053)

(assert (=> b!209805 (= lt!107282 (+!545 lt!107288 (tuple2!4141 k0!843 v!520)))))

(declare-datatypes ((Unit!6378 0))(
  ( (Unit!6379) )
))
(declare-fun lt!107285 () Unit!6378)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!197 (array!9979 array!9981 (_ BitVec 32) (_ BitVec 32) V!6835 V!6835 (_ BitVec 32) (_ BitVec 64) V!6835 (_ BitVec 32) Int) Unit!6378)

(assert (=> b!209805 (= lt!107285 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!197 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!482 (array!9979 array!9981 (_ BitVec 32) (_ BitVec 32) V!6835 V!6835 (_ BitVec 32) Int) ListLongMap!3053)

(assert (=> b!209805 (= lt!107286 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209805 (= lt!107287 (array!9982 (store (arr!4740 _values!649) i!601 (ValueCellFull!2352 v!520)) (size!5065 _values!649)))))

(assert (=> b!209805 (= lt!107288 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209806 () Bool)

(declare-fun res!102305 () Bool)

(assert (=> b!209806 (=> (not res!102305) (not e!136658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209806 (= res!102305 (validKeyInArray!0 k0!843))))

(declare-fun b!209807 () Bool)

(declare-fun e!136662 () Bool)

(assert (=> b!209807 (= e!136662 tp_is_empty!5391)))

(declare-fun b!209808 () Bool)

(declare-fun res!102306 () Bool)

(assert (=> b!209808 (=> (not res!102306) (not e!136658))))

(declare-datatypes ((List!3037 0))(
  ( (Nil!3034) (Cons!3033 (h!3675 (_ BitVec 64)) (t!7970 List!3037)) )
))
(declare-fun arrayNoDuplicates!0 (array!9979 (_ BitVec 32) List!3037) Bool)

(assert (=> b!209808 (= res!102306 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3034))))

(declare-fun b!209809 () Bool)

(assert (=> b!209809 (= e!136657 tp_is_empty!5391)))

(declare-fun b!209810 () Bool)

(declare-fun res!102303 () Bool)

(assert (=> b!209810 (=> (not res!102303) (not e!136658))))

(assert (=> b!209810 (= res!102303 (= (select (arr!4739 _keys!825) i!601) k0!843))))

(declare-fun lt!107284 () tuple2!4140)

(declare-fun lt!107290 () tuple2!4140)

(declare-fun b!209811 () Bool)

(assert (=> b!209811 (= e!136661 (= lt!107289 (+!545 (+!545 lt!107288 lt!107290) lt!107284)))))

(assert (=> b!209811 (= lt!107283 (+!545 (+!545 lt!107286 lt!107290) lt!107284))))

(assert (=> b!209811 (= lt!107284 (tuple2!4141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!209811 (= lt!107290 (tuple2!4141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!209812 () Bool)

(declare-fun res!102302 () Bool)

(assert (=> b!209812 (=> (not res!102302) (not e!136658))))

(assert (=> b!209812 (= res!102302 (and (= (size!5065 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5064 _keys!825) (size!5065 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9158 () Bool)

(declare-fun tp!19630 () Bool)

(assert (=> mapNonEmpty!9158 (= mapRes!9158 (and tp!19630 e!136662))))

(declare-fun mapValue!9158 () ValueCell!2352)

(declare-fun mapRest!9158 () (Array (_ BitVec 32) ValueCell!2352))

(declare-fun mapKey!9158 () (_ BitVec 32))

(assert (=> mapNonEmpty!9158 (= (arr!4740 _values!649) (store mapRest!9158 mapKey!9158 mapValue!9158))))

(assert (= (and start!20896 res!102307) b!209812))

(assert (= (and b!209812 res!102302) b!209802))

(assert (= (and b!209802 res!102309) b!209808))

(assert (= (and b!209808 res!102306) b!209804))

(assert (= (and b!209804 res!102308) b!209806))

(assert (= (and b!209806 res!102305) b!209810))

(assert (= (and b!209810 res!102303) b!209805))

(assert (= (and b!209805 (not res!102304)) b!209811))

(assert (= (and b!209803 condMapEmpty!9158) mapIsEmpty!9158))

(assert (= (and b!209803 (not condMapEmpty!9158)) mapNonEmpty!9158))

(get-info :version)

(assert (= (and mapNonEmpty!9158 ((_ is ValueCellFull!2352) mapValue!9158)) b!209807))

(assert (= (and b!209803 ((_ is ValueCellFull!2352) mapDefault!9158)) b!209809))

(assert (= start!20896 b!209803))

(declare-fun m!237199 () Bool)

(assert (=> b!209806 m!237199))

(declare-fun m!237201 () Bool)

(assert (=> b!209805 m!237201))

(declare-fun m!237203 () Bool)

(assert (=> b!209805 m!237203))

(declare-fun m!237205 () Bool)

(assert (=> b!209805 m!237205))

(declare-fun m!237207 () Bool)

(assert (=> b!209805 m!237207))

(declare-fun m!237209 () Bool)

(assert (=> b!209805 m!237209))

(declare-fun m!237211 () Bool)

(assert (=> b!209805 m!237211))

(declare-fun m!237213 () Bool)

(assert (=> b!209805 m!237213))

(declare-fun m!237215 () Bool)

(assert (=> b!209802 m!237215))

(declare-fun m!237217 () Bool)

(assert (=> mapNonEmpty!9158 m!237217))

(declare-fun m!237219 () Bool)

(assert (=> b!209811 m!237219))

(assert (=> b!209811 m!237219))

(declare-fun m!237221 () Bool)

(assert (=> b!209811 m!237221))

(declare-fun m!237223 () Bool)

(assert (=> b!209811 m!237223))

(assert (=> b!209811 m!237223))

(declare-fun m!237225 () Bool)

(assert (=> b!209811 m!237225))

(declare-fun m!237227 () Bool)

(assert (=> start!20896 m!237227))

(declare-fun m!237229 () Bool)

(assert (=> start!20896 m!237229))

(declare-fun m!237231 () Bool)

(assert (=> start!20896 m!237231))

(declare-fun m!237233 () Bool)

(assert (=> b!209808 m!237233))

(declare-fun m!237235 () Bool)

(assert (=> b!209810 m!237235))

(check-sat (not b_next!5529) b_and!12287 (not start!20896) (not mapNonEmpty!9158) (not b!209802) (not b!209806) (not b!209805) (not b!209811) tp_is_empty!5391 (not b!209808))
(check-sat b_and!12287 (not b_next!5529))
(get-model)

(declare-fun b!209856 () Bool)

(declare-fun e!136691 () Bool)

(declare-fun call!19823 () Bool)

(assert (=> b!209856 (= e!136691 call!19823)))

(declare-fun b!209857 () Bool)

(declare-fun e!136690 () Bool)

(declare-fun contains!1392 (List!3037 (_ BitVec 64)) Bool)

(assert (=> b!209857 (= e!136690 (contains!1392 Nil!3034 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19820 () Bool)

(declare-fun c!35487 () Bool)

(assert (=> bm!19820 (= call!19823 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35487 (Cons!3033 (select (arr!4739 _keys!825) #b00000000000000000000000000000000) Nil!3034) Nil!3034)))))

(declare-fun b!209858 () Bool)

(assert (=> b!209858 (= e!136691 call!19823)))

(declare-fun d!57891 () Bool)

(declare-fun res!102341 () Bool)

(declare-fun e!136692 () Bool)

(assert (=> d!57891 (=> res!102341 e!136692)))

(assert (=> d!57891 (= res!102341 (bvsge #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(assert (=> d!57891 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3034) e!136692)))

(declare-fun b!209859 () Bool)

(declare-fun e!136689 () Bool)

(assert (=> b!209859 (= e!136689 e!136691)))

(assert (=> b!209859 (= c!35487 (validKeyInArray!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209860 () Bool)

(assert (=> b!209860 (= e!136692 e!136689)))

(declare-fun res!102342 () Bool)

(assert (=> b!209860 (=> (not res!102342) (not e!136689))))

(assert (=> b!209860 (= res!102342 (not e!136690))))

(declare-fun res!102340 () Bool)

(assert (=> b!209860 (=> (not res!102340) (not e!136690))))

(assert (=> b!209860 (= res!102340 (validKeyInArray!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57891 (not res!102341)) b!209860))

(assert (= (and b!209860 res!102340) b!209857))

(assert (= (and b!209860 res!102342) b!209859))

(assert (= (and b!209859 c!35487) b!209858))

(assert (= (and b!209859 (not c!35487)) b!209856))

(assert (= (or b!209858 b!209856) bm!19820))

(declare-fun m!237275 () Bool)

(assert (=> b!209857 m!237275))

(assert (=> b!209857 m!237275))

(declare-fun m!237277 () Bool)

(assert (=> b!209857 m!237277))

(assert (=> bm!19820 m!237275))

(declare-fun m!237279 () Bool)

(assert (=> bm!19820 m!237279))

(assert (=> b!209859 m!237275))

(assert (=> b!209859 m!237275))

(declare-fun m!237281 () Bool)

(assert (=> b!209859 m!237281))

(assert (=> b!209860 m!237275))

(assert (=> b!209860 m!237275))

(assert (=> b!209860 m!237281))

(assert (=> b!209808 d!57891))

(declare-fun b!209869 () Bool)

(declare-fun e!136699 () Bool)

(declare-fun call!19826 () Bool)

(assert (=> b!209869 (= e!136699 call!19826)))

(declare-fun d!57893 () Bool)

(declare-fun res!102348 () Bool)

(declare-fun e!136701 () Bool)

(assert (=> d!57893 (=> res!102348 e!136701)))

(assert (=> d!57893 (= res!102348 (bvsge #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(assert (=> d!57893 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!136701)))

(declare-fun b!209870 () Bool)

(declare-fun e!136700 () Bool)

(assert (=> b!209870 (= e!136700 e!136699)))

(declare-fun lt!107324 () (_ BitVec 64))

(assert (=> b!209870 (= lt!107324 (select (arr!4739 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107326 () Unit!6378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!9979 (_ BitVec 64) (_ BitVec 32)) Unit!6378)

(assert (=> b!209870 (= lt!107326 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!107324 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!9979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!209870 (arrayContainsKey!0 _keys!825 lt!107324 #b00000000000000000000000000000000)))

(declare-fun lt!107325 () Unit!6378)

(assert (=> b!209870 (= lt!107325 lt!107326)))

(declare-fun res!102347 () Bool)

(declare-datatypes ((SeekEntryResult!705 0))(
  ( (MissingZero!705 (index!4990 (_ BitVec 32))) (Found!705 (index!4991 (_ BitVec 32))) (Intermediate!705 (undefined!1517 Bool) (index!4992 (_ BitVec 32)) (x!21994 (_ BitVec 32))) (Undefined!705) (MissingVacant!705 (index!4993 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!9979 (_ BitVec 32)) SeekEntryResult!705)

(assert (=> b!209870 (= res!102347 (= (seekEntryOrOpen!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!705 #b00000000000000000000000000000000)))))

(assert (=> b!209870 (=> (not res!102347) (not e!136699))))

(declare-fun b!209871 () Bool)

(assert (=> b!209871 (= e!136700 call!19826)))

(declare-fun bm!19823 () Bool)

(assert (=> bm!19823 (= call!19826 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!209872 () Bool)

(assert (=> b!209872 (= e!136701 e!136700)))

(declare-fun c!35490 () Bool)

(assert (=> b!209872 (= c!35490 (validKeyInArray!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57893 (not res!102348)) b!209872))

(assert (= (and b!209872 c!35490) b!209870))

(assert (= (and b!209872 (not c!35490)) b!209871))

(assert (= (and b!209870 res!102347) b!209869))

(assert (= (or b!209869 b!209871) bm!19823))

(assert (=> b!209870 m!237275))

(declare-fun m!237283 () Bool)

(assert (=> b!209870 m!237283))

(declare-fun m!237285 () Bool)

(assert (=> b!209870 m!237285))

(assert (=> b!209870 m!237275))

(declare-fun m!237287 () Bool)

(assert (=> b!209870 m!237287))

(declare-fun m!237289 () Bool)

(assert (=> bm!19823 m!237289))

(assert (=> b!209872 m!237275))

(assert (=> b!209872 m!237275))

(assert (=> b!209872 m!237281))

(assert (=> b!209802 d!57893))

(declare-fun d!57895 () Bool)

(assert (=> d!57895 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209806 d!57895))

(declare-fun d!57897 () Bool)

(assert (=> d!57897 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20896 d!57897))

(declare-fun d!57899 () Bool)

(assert (=> d!57899 (= (array_inv!3139 _values!649) (bvsge (size!5065 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20896 d!57899))

(declare-fun d!57901 () Bool)

(assert (=> d!57901 (= (array_inv!3140 _keys!825) (bvsge (size!5064 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20896 d!57901))

(declare-fun b!209897 () Bool)

(assert (=> b!209897 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(assert (=> b!209897 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5065 _values!649)))))

(declare-fun e!136716 () Bool)

(declare-fun lt!107341 () ListLongMap!3053)

(declare-fun apply!190 (ListLongMap!3053 (_ BitVec 64)) V!6835)

(declare-fun get!2542 (ValueCell!2352 V!6835) V!6835)

(declare-fun dynLambda!533 (Int (_ BitVec 64)) V!6835)

(assert (=> b!209897 (= e!136716 (= (apply!190 lt!107341 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)) (get!2542 (select (arr!4740 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!209898 () Bool)

(declare-fun e!136718 () ListLongMap!3053)

(declare-fun e!136722 () ListLongMap!3053)

(assert (=> b!209898 (= e!136718 e!136722)))

(declare-fun c!35499 () Bool)

(assert (=> b!209898 (= c!35499 (validKeyInArray!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209899 () Bool)

(declare-fun res!102358 () Bool)

(declare-fun e!136717 () Bool)

(assert (=> b!209899 (=> (not res!102358) (not e!136717))))

(declare-fun contains!1393 (ListLongMap!3053 (_ BitVec 64)) Bool)

(assert (=> b!209899 (= res!102358 (not (contains!1393 lt!107341 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!19829 () ListLongMap!3053)

(declare-fun bm!19826 () Bool)

(assert (=> bm!19826 (= call!19829 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!209900 () Bool)

(declare-fun lt!107345 () Unit!6378)

(declare-fun lt!107347 () Unit!6378)

(assert (=> b!209900 (= lt!107345 lt!107347)))

(declare-fun lt!107344 () (_ BitVec 64))

(declare-fun lt!107342 () ListLongMap!3053)

(declare-fun lt!107343 () (_ BitVec 64))

(declare-fun lt!107346 () V!6835)

(assert (=> b!209900 (not (contains!1393 (+!545 lt!107342 (tuple2!4141 lt!107344 lt!107346)) lt!107343))))

(declare-fun addStillNotContains!99 (ListLongMap!3053 (_ BitVec 64) V!6835 (_ BitVec 64)) Unit!6378)

(assert (=> b!209900 (= lt!107347 (addStillNotContains!99 lt!107342 lt!107344 lt!107346 lt!107343))))

(assert (=> b!209900 (= lt!107343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!209900 (= lt!107346 (get!2542 (select (arr!4740 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209900 (= lt!107344 (select (arr!4739 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209900 (= lt!107342 call!19829)))

(assert (=> b!209900 (= e!136722 (+!545 call!19829 (tuple2!4141 (select (arr!4739 _keys!825) #b00000000000000000000000000000000) (get!2542 (select (arr!4740 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209901 () Bool)

(declare-fun e!136720 () Bool)

(declare-fun e!136721 () Bool)

(assert (=> b!209901 (= e!136720 e!136721)))

(declare-fun c!35500 () Bool)

(assert (=> b!209901 (= c!35500 (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun b!209902 () Bool)

(assert (=> b!209902 (= e!136718 (ListLongMap!3054 Nil!3033))))

(declare-fun b!209903 () Bool)

(assert (=> b!209903 (= e!136722 call!19829)))

(declare-fun b!209904 () Bool)

(declare-fun e!136719 () Bool)

(assert (=> b!209904 (= e!136719 (validKeyInArray!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209904 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!57903 () Bool)

(assert (=> d!57903 e!136717))

(declare-fun res!102359 () Bool)

(assert (=> d!57903 (=> (not res!102359) (not e!136717))))

(assert (=> d!57903 (= res!102359 (not (contains!1393 lt!107341 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57903 (= lt!107341 e!136718)))

(declare-fun c!35502 () Bool)

(assert (=> d!57903 (= c!35502 (bvsge #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(assert (=> d!57903 (validMask!0 mask!1149)))

(assert (=> d!57903 (= (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107341)))

(declare-fun b!209905 () Bool)

(assert (=> b!209905 (= e!136717 e!136720)))

(declare-fun c!35501 () Bool)

(assert (=> b!209905 (= c!35501 e!136719)))

(declare-fun res!102357 () Bool)

(assert (=> b!209905 (=> (not res!102357) (not e!136719))))

(assert (=> b!209905 (= res!102357 (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun b!209906 () Bool)

(declare-fun isEmpty!491 (ListLongMap!3053) Bool)

(assert (=> b!209906 (= e!136721 (isEmpty!491 lt!107341))))

(declare-fun b!209907 () Bool)

(assert (=> b!209907 (= e!136720 e!136716)))

(assert (=> b!209907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun res!102360 () Bool)

(assert (=> b!209907 (= res!102360 (contains!1393 lt!107341 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209907 (=> (not res!102360) (not e!136716))))

(declare-fun b!209908 () Bool)

(assert (=> b!209908 (= e!136721 (= lt!107341 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(assert (= (and d!57903 c!35502) b!209902))

(assert (= (and d!57903 (not c!35502)) b!209898))

(assert (= (and b!209898 c!35499) b!209900))

(assert (= (and b!209898 (not c!35499)) b!209903))

(assert (= (or b!209900 b!209903) bm!19826))

(assert (= (and d!57903 res!102359) b!209899))

(assert (= (and b!209899 res!102358) b!209905))

(assert (= (and b!209905 res!102357) b!209904))

(assert (= (and b!209905 c!35501) b!209907))

(assert (= (and b!209905 (not c!35501)) b!209901))

(assert (= (and b!209907 res!102360) b!209897))

(assert (= (and b!209901 c!35500) b!209908))

(assert (= (and b!209901 (not c!35500)) b!209906))

(declare-fun b_lambda!7563 () Bool)

(assert (=> (not b_lambda!7563) (not b!209897)))

(declare-fun t!7973 () Bool)

(declare-fun tb!2893 () Bool)

(assert (=> (and start!20896 (= defaultEntry!657 defaultEntry!657) t!7973) tb!2893))

(declare-fun result!4967 () Bool)

(assert (=> tb!2893 (= result!4967 tp_is_empty!5391)))

(assert (=> b!209897 t!7973))

(declare-fun b_and!12291 () Bool)

(assert (= b_and!12287 (and (=> t!7973 result!4967) b_and!12291)))

(declare-fun b_lambda!7565 () Bool)

(assert (=> (not b_lambda!7565) (not b!209900)))

(assert (=> b!209900 t!7973))

(declare-fun b_and!12293 () Bool)

(assert (= b_and!12291 (and (=> t!7973 result!4967) b_and!12293)))

(declare-fun m!237291 () Bool)

(assert (=> b!209906 m!237291))

(declare-fun m!237293 () Bool)

(assert (=> b!209908 m!237293))

(assert (=> b!209904 m!237275))

(assert (=> b!209904 m!237275))

(assert (=> b!209904 m!237281))

(assert (=> b!209907 m!237275))

(assert (=> b!209907 m!237275))

(declare-fun m!237295 () Bool)

(assert (=> b!209907 m!237295))

(declare-fun m!237297 () Bool)

(assert (=> b!209897 m!237297))

(declare-fun m!237299 () Bool)

(assert (=> b!209897 m!237299))

(declare-fun m!237301 () Bool)

(assert (=> b!209897 m!237301))

(assert (=> b!209897 m!237299))

(assert (=> b!209897 m!237275))

(assert (=> b!209897 m!237275))

(declare-fun m!237303 () Bool)

(assert (=> b!209897 m!237303))

(assert (=> b!209897 m!237297))

(declare-fun m!237305 () Bool)

(assert (=> b!209899 m!237305))

(declare-fun m!237307 () Bool)

(assert (=> b!209900 m!237307))

(declare-fun m!237309 () Bool)

(assert (=> b!209900 m!237309))

(declare-fun m!237311 () Bool)

(assert (=> b!209900 m!237311))

(assert (=> b!209900 m!237299))

(assert (=> b!209900 m!237275))

(assert (=> b!209900 m!237297))

(assert (=> b!209900 m!237297))

(assert (=> b!209900 m!237299))

(assert (=> b!209900 m!237301))

(assert (=> b!209900 m!237309))

(declare-fun m!237313 () Bool)

(assert (=> b!209900 m!237313))

(declare-fun m!237315 () Bool)

(assert (=> d!57903 m!237315))

(assert (=> d!57903 m!237227))

(assert (=> bm!19826 m!237293))

(assert (=> b!209898 m!237275))

(assert (=> b!209898 m!237275))

(assert (=> b!209898 m!237281))

(assert (=> b!209805 d!57903))

(declare-fun b!209911 () Bool)

(assert (=> b!209911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(assert (=> b!209911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5065 lt!107287)))))

(declare-fun e!136723 () Bool)

(declare-fun lt!107348 () ListLongMap!3053)

(assert (=> b!209911 (= e!136723 (= (apply!190 lt!107348 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)) (get!2542 (select (arr!4740 lt!107287) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!209912 () Bool)

(declare-fun e!136725 () ListLongMap!3053)

(declare-fun e!136729 () ListLongMap!3053)

(assert (=> b!209912 (= e!136725 e!136729)))

(declare-fun c!35503 () Bool)

(assert (=> b!209912 (= c!35503 (validKeyInArray!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209913 () Bool)

(declare-fun res!102362 () Bool)

(declare-fun e!136724 () Bool)

(assert (=> b!209913 (=> (not res!102362) (not e!136724))))

(assert (=> b!209913 (= res!102362 (not (contains!1393 lt!107348 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!19827 () Bool)

(declare-fun call!19830 () ListLongMap!3053)

(assert (=> bm!19827 (= call!19830 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!209914 () Bool)

(declare-fun lt!107352 () Unit!6378)

(declare-fun lt!107354 () Unit!6378)

(assert (=> b!209914 (= lt!107352 lt!107354)))

(declare-fun lt!107351 () (_ BitVec 64))

(declare-fun lt!107350 () (_ BitVec 64))

(declare-fun lt!107353 () V!6835)

(declare-fun lt!107349 () ListLongMap!3053)

(assert (=> b!209914 (not (contains!1393 (+!545 lt!107349 (tuple2!4141 lt!107351 lt!107353)) lt!107350))))

(assert (=> b!209914 (= lt!107354 (addStillNotContains!99 lt!107349 lt!107351 lt!107353 lt!107350))))

(assert (=> b!209914 (= lt!107350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!209914 (= lt!107353 (get!2542 (select (arr!4740 lt!107287) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209914 (= lt!107351 (select (arr!4739 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209914 (= lt!107349 call!19830)))

(assert (=> b!209914 (= e!136729 (+!545 call!19830 (tuple2!4141 (select (arr!4739 _keys!825) #b00000000000000000000000000000000) (get!2542 (select (arr!4740 lt!107287) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209915 () Bool)

(declare-fun e!136727 () Bool)

(declare-fun e!136728 () Bool)

(assert (=> b!209915 (= e!136727 e!136728)))

(declare-fun c!35504 () Bool)

(assert (=> b!209915 (= c!35504 (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun b!209916 () Bool)

(assert (=> b!209916 (= e!136725 (ListLongMap!3054 Nil!3033))))

(declare-fun b!209917 () Bool)

(assert (=> b!209917 (= e!136729 call!19830)))

(declare-fun b!209918 () Bool)

(declare-fun e!136726 () Bool)

(assert (=> b!209918 (= e!136726 (validKeyInArray!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209918 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!57905 () Bool)

(assert (=> d!57905 e!136724))

(declare-fun res!102363 () Bool)

(assert (=> d!57905 (=> (not res!102363) (not e!136724))))

(assert (=> d!57905 (= res!102363 (not (contains!1393 lt!107348 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57905 (= lt!107348 e!136725)))

(declare-fun c!35506 () Bool)

(assert (=> d!57905 (= c!35506 (bvsge #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(assert (=> d!57905 (validMask!0 mask!1149)))

(assert (=> d!57905 (= (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107348)))

(declare-fun b!209919 () Bool)

(assert (=> b!209919 (= e!136724 e!136727)))

(declare-fun c!35505 () Bool)

(assert (=> b!209919 (= c!35505 e!136726)))

(declare-fun res!102361 () Bool)

(assert (=> b!209919 (=> (not res!102361) (not e!136726))))

(assert (=> b!209919 (= res!102361 (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun b!209920 () Bool)

(assert (=> b!209920 (= e!136728 (isEmpty!491 lt!107348))))

(declare-fun b!209921 () Bool)

(assert (=> b!209921 (= e!136727 e!136723)))

(assert (=> b!209921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun res!102364 () Bool)

(assert (=> b!209921 (= res!102364 (contains!1393 lt!107348 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209921 (=> (not res!102364) (not e!136723))))

(declare-fun b!209922 () Bool)

(assert (=> b!209922 (= e!136728 (= lt!107348 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(assert (= (and d!57905 c!35506) b!209916))

(assert (= (and d!57905 (not c!35506)) b!209912))

(assert (= (and b!209912 c!35503) b!209914))

(assert (= (and b!209912 (not c!35503)) b!209917))

(assert (= (or b!209914 b!209917) bm!19827))

(assert (= (and d!57905 res!102363) b!209913))

(assert (= (and b!209913 res!102362) b!209919))

(assert (= (and b!209919 res!102361) b!209918))

(assert (= (and b!209919 c!35505) b!209921))

(assert (= (and b!209919 (not c!35505)) b!209915))

(assert (= (and b!209921 res!102364) b!209911))

(assert (= (and b!209915 c!35504) b!209922))

(assert (= (and b!209915 (not c!35504)) b!209920))

(declare-fun b_lambda!7567 () Bool)

(assert (=> (not b_lambda!7567) (not b!209911)))

(assert (=> b!209911 t!7973))

(declare-fun b_and!12295 () Bool)

(assert (= b_and!12293 (and (=> t!7973 result!4967) b_and!12295)))

(declare-fun b_lambda!7569 () Bool)

(assert (=> (not b_lambda!7569) (not b!209914)))

(assert (=> b!209914 t!7973))

(declare-fun b_and!12297 () Bool)

(assert (= b_and!12295 (and (=> t!7973 result!4967) b_and!12297)))

(declare-fun m!237317 () Bool)

(assert (=> b!209920 m!237317))

(declare-fun m!237319 () Bool)

(assert (=> b!209922 m!237319))

(assert (=> b!209918 m!237275))

(assert (=> b!209918 m!237275))

(assert (=> b!209918 m!237281))

(assert (=> b!209921 m!237275))

(assert (=> b!209921 m!237275))

(declare-fun m!237321 () Bool)

(assert (=> b!209921 m!237321))

(declare-fun m!237323 () Bool)

(assert (=> b!209911 m!237323))

(assert (=> b!209911 m!237299))

(declare-fun m!237325 () Bool)

(assert (=> b!209911 m!237325))

(assert (=> b!209911 m!237299))

(assert (=> b!209911 m!237275))

(assert (=> b!209911 m!237275))

(declare-fun m!237327 () Bool)

(assert (=> b!209911 m!237327))

(assert (=> b!209911 m!237323))

(declare-fun m!237329 () Bool)

(assert (=> b!209913 m!237329))

(declare-fun m!237331 () Bool)

(assert (=> b!209914 m!237331))

(declare-fun m!237333 () Bool)

(assert (=> b!209914 m!237333))

(declare-fun m!237335 () Bool)

(assert (=> b!209914 m!237335))

(assert (=> b!209914 m!237299))

(assert (=> b!209914 m!237275))

(assert (=> b!209914 m!237323))

(assert (=> b!209914 m!237323))

(assert (=> b!209914 m!237299))

(assert (=> b!209914 m!237325))

(assert (=> b!209914 m!237333))

(declare-fun m!237337 () Bool)

(assert (=> b!209914 m!237337))

(declare-fun m!237339 () Bool)

(assert (=> d!57905 m!237339))

(assert (=> d!57905 m!237227))

(assert (=> bm!19827 m!237319))

(assert (=> b!209912 m!237275))

(assert (=> b!209912 m!237275))

(assert (=> b!209912 m!237281))

(assert (=> b!209805 d!57905))

(declare-fun bm!19842 () Bool)

(declare-fun call!19846 () ListLongMap!3053)

(declare-fun call!19847 () ListLongMap!3053)

(assert (=> bm!19842 (= call!19846 call!19847)))

(declare-fun b!209965 () Bool)

(declare-fun e!136764 () Bool)

(assert (=> b!209965 (= e!136764 (validKeyInArray!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209966 () Bool)

(declare-fun res!102388 () Bool)

(declare-fun e!136761 () Bool)

(assert (=> b!209966 (=> (not res!102388) (not e!136761))))

(declare-fun e!136762 () Bool)

(assert (=> b!209966 (= res!102388 e!136762)))

(declare-fun c!35519 () Bool)

(assert (=> b!209966 (= c!35519 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!209967 () Bool)

(declare-fun e!136756 () Bool)

(assert (=> b!209967 (= e!136756 (validKeyInArray!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209968 () Bool)

(declare-fun e!136757 () ListLongMap!3053)

(declare-fun call!19850 () ListLongMap!3053)

(assert (=> b!209968 (= e!136757 (+!545 call!19850 (tuple2!4141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!19843 () Bool)

(declare-fun call!19851 () ListLongMap!3053)

(assert (=> bm!19843 (= call!19851 call!19850)))

(declare-fun bm!19844 () Bool)

(declare-fun call!19849 () ListLongMap!3053)

(assert (=> bm!19844 (= call!19847 call!19849)))

(declare-fun bm!19845 () Bool)

(declare-fun call!19848 () Bool)

(declare-fun lt!107413 () ListLongMap!3053)

(assert (=> bm!19845 (= call!19848 (contains!1393 lt!107413 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209969 () Bool)

(declare-fun e!136765 () Unit!6378)

(declare-fun lt!107410 () Unit!6378)

(assert (=> b!209969 (= e!136765 lt!107410)))

(declare-fun lt!107411 () ListLongMap!3053)

(assert (=> b!209969 (= lt!107411 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107419 () (_ BitVec 64))

(assert (=> b!209969 (= lt!107419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107420 () (_ BitVec 64))

(assert (=> b!209969 (= lt!107420 (select (arr!4739 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107418 () Unit!6378)

(declare-fun addStillContains!166 (ListLongMap!3053 (_ BitVec 64) V!6835 (_ BitVec 64)) Unit!6378)

(assert (=> b!209969 (= lt!107418 (addStillContains!166 lt!107411 lt!107419 zeroValue!615 lt!107420))))

(assert (=> b!209969 (contains!1393 (+!545 lt!107411 (tuple2!4141 lt!107419 zeroValue!615)) lt!107420)))

(declare-fun lt!107406 () Unit!6378)

(assert (=> b!209969 (= lt!107406 lt!107418)))

(declare-fun lt!107404 () ListLongMap!3053)

(assert (=> b!209969 (= lt!107404 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107405 () (_ BitVec 64))

(assert (=> b!209969 (= lt!107405 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107399 () (_ BitVec 64))

(assert (=> b!209969 (= lt!107399 (select (arr!4739 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107402 () Unit!6378)

(declare-fun addApplyDifferent!166 (ListLongMap!3053 (_ BitVec 64) V!6835 (_ BitVec 64)) Unit!6378)

(assert (=> b!209969 (= lt!107402 (addApplyDifferent!166 lt!107404 lt!107405 minValue!615 lt!107399))))

(assert (=> b!209969 (= (apply!190 (+!545 lt!107404 (tuple2!4141 lt!107405 minValue!615)) lt!107399) (apply!190 lt!107404 lt!107399))))

(declare-fun lt!107416 () Unit!6378)

(assert (=> b!209969 (= lt!107416 lt!107402)))

(declare-fun lt!107415 () ListLongMap!3053)

(assert (=> b!209969 (= lt!107415 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107412 () (_ BitVec 64))

(assert (=> b!209969 (= lt!107412 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107408 () (_ BitVec 64))

(assert (=> b!209969 (= lt!107408 (select (arr!4739 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107407 () Unit!6378)

(assert (=> b!209969 (= lt!107407 (addApplyDifferent!166 lt!107415 lt!107412 zeroValue!615 lt!107408))))

(assert (=> b!209969 (= (apply!190 (+!545 lt!107415 (tuple2!4141 lt!107412 zeroValue!615)) lt!107408) (apply!190 lt!107415 lt!107408))))

(declare-fun lt!107400 () Unit!6378)

(assert (=> b!209969 (= lt!107400 lt!107407)))

(declare-fun lt!107409 () ListLongMap!3053)

(assert (=> b!209969 (= lt!107409 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107403 () (_ BitVec 64))

(assert (=> b!209969 (= lt!107403 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107417 () (_ BitVec 64))

(assert (=> b!209969 (= lt!107417 (select (arr!4739 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209969 (= lt!107410 (addApplyDifferent!166 lt!107409 lt!107403 minValue!615 lt!107417))))

(assert (=> b!209969 (= (apply!190 (+!545 lt!107409 (tuple2!4141 lt!107403 minValue!615)) lt!107417) (apply!190 lt!107409 lt!107417))))

(declare-fun c!35523 () Bool)

(declare-fun c!35524 () Bool)

(declare-fun bm!19846 () Bool)

(assert (=> bm!19846 (= call!19850 (+!545 (ite c!35523 call!19849 (ite c!35524 call!19847 call!19846)) (ite (or c!35523 c!35524) (tuple2!4141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!19847 () Bool)

(declare-fun call!19845 () Bool)

(assert (=> bm!19847 (= call!19845 (contains!1393 lt!107413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209970 () Bool)

(declare-fun e!136763 () Bool)

(assert (=> b!209970 (= e!136763 (= (apply!190 lt!107413 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!19848 () Bool)

(assert (=> bm!19848 (= call!19849 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209971 () Bool)

(declare-fun e!136760 () ListLongMap!3053)

(assert (=> b!209971 (= e!136760 call!19846)))

(declare-fun b!209972 () Bool)

(declare-fun Unit!6382 () Unit!6378)

(assert (=> b!209972 (= e!136765 Unit!6382)))

(declare-fun b!209973 () Bool)

(declare-fun c!35521 () Bool)

(assert (=> b!209973 (= c!35521 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!136758 () ListLongMap!3053)

(assert (=> b!209973 (= e!136758 e!136760)))

(declare-fun b!209974 () Bool)

(assert (=> b!209974 (= e!136762 (not call!19845))))

(declare-fun b!209975 () Bool)

(declare-fun res!102383 () Bool)

(assert (=> b!209975 (=> (not res!102383) (not e!136761))))

(declare-fun e!136766 () Bool)

(assert (=> b!209975 (= res!102383 e!136766)))

(declare-fun res!102387 () Bool)

(assert (=> b!209975 (=> res!102387 e!136766)))

(assert (=> b!209975 (= res!102387 (not e!136764))))

(declare-fun res!102384 () Bool)

(assert (=> b!209975 (=> (not res!102384) (not e!136764))))

(assert (=> b!209975 (= res!102384 (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun b!209976 () Bool)

(declare-fun e!136768 () Bool)

(assert (=> b!209976 (= e!136766 e!136768)))

(declare-fun res!102385 () Bool)

(assert (=> b!209976 (=> (not res!102385) (not e!136768))))

(assert (=> b!209976 (= res!102385 (contains!1393 lt!107413 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209976 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun b!209977 () Bool)

(declare-fun e!136767 () Bool)

(assert (=> b!209977 (= e!136767 (not call!19848))))

(declare-fun b!209978 () Bool)

(assert (=> b!209978 (= e!136762 e!136763)))

(declare-fun res!102389 () Bool)

(assert (=> b!209978 (= res!102389 call!19845)))

(assert (=> b!209978 (=> (not res!102389) (not e!136763))))

(declare-fun b!209979 () Bool)

(declare-fun e!136759 () Bool)

(assert (=> b!209979 (= e!136759 (= (apply!190 lt!107413 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!209980 () Bool)

(assert (=> b!209980 (= e!136768 (= (apply!190 lt!107413 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)) (get!2542 (select (arr!4740 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209980 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5065 _values!649)))))

(assert (=> b!209980 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun b!209981 () Bool)

(assert (=> b!209981 (= e!136758 call!19851)))

(declare-fun b!209982 () Bool)

(assert (=> b!209982 (= e!136757 e!136758)))

(assert (=> b!209982 (= c!35524 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209983 () Bool)

(assert (=> b!209983 (= e!136760 call!19851)))

(declare-fun d!57907 () Bool)

(assert (=> d!57907 e!136761))

(declare-fun res!102391 () Bool)

(assert (=> d!57907 (=> (not res!102391) (not e!136761))))

(assert (=> d!57907 (= res!102391 (or (bvsge #b00000000000000000000000000000000 (size!5064 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))))

(declare-fun lt!107414 () ListLongMap!3053)

(assert (=> d!57907 (= lt!107413 lt!107414)))

(declare-fun lt!107401 () Unit!6378)

(assert (=> d!57907 (= lt!107401 e!136765)))

(declare-fun c!35522 () Bool)

(assert (=> d!57907 (= c!35522 e!136756)))

(declare-fun res!102390 () Bool)

(assert (=> d!57907 (=> (not res!102390) (not e!136756))))

(assert (=> d!57907 (= res!102390 (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(assert (=> d!57907 (= lt!107414 e!136757)))

(assert (=> d!57907 (= c!35523 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57907 (validMask!0 mask!1149)))

(assert (=> d!57907 (= (getCurrentListMap!1080 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107413)))

(declare-fun b!209984 () Bool)

(assert (=> b!209984 (= e!136767 e!136759)))

(declare-fun res!102386 () Bool)

(assert (=> b!209984 (= res!102386 call!19848)))

(assert (=> b!209984 (=> (not res!102386) (not e!136759))))

(declare-fun b!209985 () Bool)

(assert (=> b!209985 (= e!136761 e!136767)))

(declare-fun c!35520 () Bool)

(assert (=> b!209985 (= c!35520 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!57907 c!35523) b!209968))

(assert (= (and d!57907 (not c!35523)) b!209982))

(assert (= (and b!209982 c!35524) b!209981))

(assert (= (and b!209982 (not c!35524)) b!209973))

(assert (= (and b!209973 c!35521) b!209983))

(assert (= (and b!209973 (not c!35521)) b!209971))

(assert (= (or b!209983 b!209971) bm!19842))

(assert (= (or b!209981 bm!19842) bm!19844))

(assert (= (or b!209981 b!209983) bm!19843))

(assert (= (or b!209968 bm!19844) bm!19848))

(assert (= (or b!209968 bm!19843) bm!19846))

(assert (= (and d!57907 res!102390) b!209967))

(assert (= (and d!57907 c!35522) b!209969))

(assert (= (and d!57907 (not c!35522)) b!209972))

(assert (= (and d!57907 res!102391) b!209975))

(assert (= (and b!209975 res!102384) b!209965))

(assert (= (and b!209975 (not res!102387)) b!209976))

(assert (= (and b!209976 res!102385) b!209980))

(assert (= (and b!209975 res!102383) b!209966))

(assert (= (and b!209966 c!35519) b!209978))

(assert (= (and b!209966 (not c!35519)) b!209974))

(assert (= (and b!209978 res!102389) b!209970))

(assert (= (or b!209978 b!209974) bm!19847))

(assert (= (and b!209966 res!102388) b!209985))

(assert (= (and b!209985 c!35520) b!209984))

(assert (= (and b!209985 (not c!35520)) b!209977))

(assert (= (and b!209984 res!102386) b!209979))

(assert (= (or b!209984 b!209977) bm!19845))

(declare-fun b_lambda!7571 () Bool)

(assert (=> (not b_lambda!7571) (not b!209980)))

(assert (=> b!209980 t!7973))

(declare-fun b_and!12299 () Bool)

(assert (= b_and!12297 (and (=> t!7973 result!4967) b_and!12299)))

(assert (=> b!209980 m!237297))

(assert (=> b!209980 m!237299))

(assert (=> b!209980 m!237301))

(assert (=> b!209980 m!237275))

(assert (=> b!209980 m!237297))

(assert (=> b!209980 m!237299))

(assert (=> b!209980 m!237275))

(declare-fun m!237341 () Bool)

(assert (=> b!209980 m!237341))

(assert (=> d!57907 m!237227))

(assert (=> b!209965 m!237275))

(assert (=> b!209965 m!237275))

(assert (=> b!209965 m!237281))

(declare-fun m!237343 () Bool)

(assert (=> b!209970 m!237343))

(assert (=> b!209976 m!237275))

(assert (=> b!209976 m!237275))

(declare-fun m!237345 () Bool)

(assert (=> b!209976 m!237345))

(declare-fun m!237347 () Bool)

(assert (=> b!209968 m!237347))

(declare-fun m!237349 () Bool)

(assert (=> b!209969 m!237349))

(assert (=> b!209969 m!237275))

(declare-fun m!237351 () Bool)

(assert (=> b!209969 m!237351))

(declare-fun m!237353 () Bool)

(assert (=> b!209969 m!237353))

(declare-fun m!237355 () Bool)

(assert (=> b!209969 m!237355))

(declare-fun m!237357 () Bool)

(assert (=> b!209969 m!237357))

(assert (=> b!209969 m!237349))

(declare-fun m!237359 () Bool)

(assert (=> b!209969 m!237359))

(declare-fun m!237361 () Bool)

(assert (=> b!209969 m!237361))

(declare-fun m!237363 () Bool)

(assert (=> b!209969 m!237363))

(declare-fun m!237365 () Bool)

(assert (=> b!209969 m!237365))

(assert (=> b!209969 m!237361))

(declare-fun m!237367 () Bool)

(assert (=> b!209969 m!237367))

(declare-fun m!237369 () Bool)

(assert (=> b!209969 m!237369))

(declare-fun m!237371 () Bool)

(assert (=> b!209969 m!237371))

(assert (=> b!209969 m!237209))

(declare-fun m!237373 () Bool)

(assert (=> b!209969 m!237373))

(assert (=> b!209969 m!237367))

(declare-fun m!237375 () Bool)

(assert (=> b!209969 m!237375))

(assert (=> b!209969 m!237353))

(declare-fun m!237377 () Bool)

(assert (=> b!209969 m!237377))

(declare-fun m!237379 () Bool)

(assert (=> bm!19847 m!237379))

(assert (=> b!209967 m!237275))

(assert (=> b!209967 m!237275))

(assert (=> b!209967 m!237281))

(assert (=> bm!19848 m!237209))

(declare-fun m!237381 () Bool)

(assert (=> b!209979 m!237381))

(declare-fun m!237383 () Bool)

(assert (=> bm!19845 m!237383))

(declare-fun m!237385 () Bool)

(assert (=> bm!19846 m!237385))

(assert (=> b!209805 d!57907))

(declare-fun bm!19849 () Bool)

(declare-fun call!19853 () ListLongMap!3053)

(declare-fun call!19854 () ListLongMap!3053)

(assert (=> bm!19849 (= call!19853 call!19854)))

(declare-fun b!209986 () Bool)

(declare-fun e!136777 () Bool)

(assert (=> b!209986 (= e!136777 (validKeyInArray!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209987 () Bool)

(declare-fun res!102397 () Bool)

(declare-fun e!136774 () Bool)

(assert (=> b!209987 (=> (not res!102397) (not e!136774))))

(declare-fun e!136775 () Bool)

(assert (=> b!209987 (= res!102397 e!136775)))

(declare-fun c!35525 () Bool)

(assert (=> b!209987 (= c!35525 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!209988 () Bool)

(declare-fun e!136769 () Bool)

(assert (=> b!209988 (= e!136769 (validKeyInArray!0 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209989 () Bool)

(declare-fun e!136770 () ListLongMap!3053)

(declare-fun call!19857 () ListLongMap!3053)

(assert (=> b!209989 (= e!136770 (+!545 call!19857 (tuple2!4141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!19850 () Bool)

(declare-fun call!19858 () ListLongMap!3053)

(assert (=> bm!19850 (= call!19858 call!19857)))

(declare-fun bm!19851 () Bool)

(declare-fun call!19856 () ListLongMap!3053)

(assert (=> bm!19851 (= call!19854 call!19856)))

(declare-fun bm!19852 () Bool)

(declare-fun call!19855 () Bool)

(declare-fun lt!107435 () ListLongMap!3053)

(assert (=> bm!19852 (= call!19855 (contains!1393 lt!107435 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209990 () Bool)

(declare-fun e!136778 () Unit!6378)

(declare-fun lt!107432 () Unit!6378)

(assert (=> b!209990 (= e!136778 lt!107432)))

(declare-fun lt!107433 () ListLongMap!3053)

(assert (=> b!209990 (= lt!107433 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107441 () (_ BitVec 64))

(assert (=> b!209990 (= lt!107441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107442 () (_ BitVec 64))

(assert (=> b!209990 (= lt!107442 (select (arr!4739 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107440 () Unit!6378)

(assert (=> b!209990 (= lt!107440 (addStillContains!166 lt!107433 lt!107441 zeroValue!615 lt!107442))))

(assert (=> b!209990 (contains!1393 (+!545 lt!107433 (tuple2!4141 lt!107441 zeroValue!615)) lt!107442)))

(declare-fun lt!107428 () Unit!6378)

(assert (=> b!209990 (= lt!107428 lt!107440)))

(declare-fun lt!107426 () ListLongMap!3053)

(assert (=> b!209990 (= lt!107426 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107427 () (_ BitVec 64))

(assert (=> b!209990 (= lt!107427 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107421 () (_ BitVec 64))

(assert (=> b!209990 (= lt!107421 (select (arr!4739 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107424 () Unit!6378)

(assert (=> b!209990 (= lt!107424 (addApplyDifferent!166 lt!107426 lt!107427 minValue!615 lt!107421))))

(assert (=> b!209990 (= (apply!190 (+!545 lt!107426 (tuple2!4141 lt!107427 minValue!615)) lt!107421) (apply!190 lt!107426 lt!107421))))

(declare-fun lt!107438 () Unit!6378)

(assert (=> b!209990 (= lt!107438 lt!107424)))

(declare-fun lt!107437 () ListLongMap!3053)

(assert (=> b!209990 (= lt!107437 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107434 () (_ BitVec 64))

(assert (=> b!209990 (= lt!107434 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107430 () (_ BitVec 64))

(assert (=> b!209990 (= lt!107430 (select (arr!4739 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107429 () Unit!6378)

(assert (=> b!209990 (= lt!107429 (addApplyDifferent!166 lt!107437 lt!107434 zeroValue!615 lt!107430))))

(assert (=> b!209990 (= (apply!190 (+!545 lt!107437 (tuple2!4141 lt!107434 zeroValue!615)) lt!107430) (apply!190 lt!107437 lt!107430))))

(declare-fun lt!107422 () Unit!6378)

(assert (=> b!209990 (= lt!107422 lt!107429)))

(declare-fun lt!107431 () ListLongMap!3053)

(assert (=> b!209990 (= lt!107431 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107425 () (_ BitVec 64))

(assert (=> b!209990 (= lt!107425 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107439 () (_ BitVec 64))

(assert (=> b!209990 (= lt!107439 (select (arr!4739 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209990 (= lt!107432 (addApplyDifferent!166 lt!107431 lt!107425 minValue!615 lt!107439))))

(assert (=> b!209990 (= (apply!190 (+!545 lt!107431 (tuple2!4141 lt!107425 minValue!615)) lt!107439) (apply!190 lt!107431 lt!107439))))

(declare-fun c!35530 () Bool)

(declare-fun c!35529 () Bool)

(declare-fun bm!19853 () Bool)

(assert (=> bm!19853 (= call!19857 (+!545 (ite c!35529 call!19856 (ite c!35530 call!19854 call!19853)) (ite (or c!35529 c!35530) (tuple2!4141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!19854 () Bool)

(declare-fun call!19852 () Bool)

(assert (=> bm!19854 (= call!19852 (contains!1393 lt!107435 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209991 () Bool)

(declare-fun e!136776 () Bool)

(assert (=> b!209991 (= e!136776 (= (apply!190 lt!107435 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!19855 () Bool)

(assert (=> bm!19855 (= call!19856 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209992 () Bool)

(declare-fun e!136773 () ListLongMap!3053)

(assert (=> b!209992 (= e!136773 call!19853)))

(declare-fun b!209993 () Bool)

(declare-fun Unit!6383 () Unit!6378)

(assert (=> b!209993 (= e!136778 Unit!6383)))

(declare-fun b!209994 () Bool)

(declare-fun c!35527 () Bool)

(assert (=> b!209994 (= c!35527 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!136771 () ListLongMap!3053)

(assert (=> b!209994 (= e!136771 e!136773)))

(declare-fun b!209995 () Bool)

(assert (=> b!209995 (= e!136775 (not call!19852))))

(declare-fun b!209996 () Bool)

(declare-fun res!102392 () Bool)

(assert (=> b!209996 (=> (not res!102392) (not e!136774))))

(declare-fun e!136779 () Bool)

(assert (=> b!209996 (= res!102392 e!136779)))

(declare-fun res!102396 () Bool)

(assert (=> b!209996 (=> res!102396 e!136779)))

(assert (=> b!209996 (= res!102396 (not e!136777))))

(declare-fun res!102393 () Bool)

(assert (=> b!209996 (=> (not res!102393) (not e!136777))))

(assert (=> b!209996 (= res!102393 (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun b!209997 () Bool)

(declare-fun e!136781 () Bool)

(assert (=> b!209997 (= e!136779 e!136781)))

(declare-fun res!102394 () Bool)

(assert (=> b!209997 (=> (not res!102394) (not e!136781))))

(assert (=> b!209997 (= res!102394 (contains!1393 lt!107435 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun b!209998 () Bool)

(declare-fun e!136780 () Bool)

(assert (=> b!209998 (= e!136780 (not call!19855))))

(declare-fun b!209999 () Bool)

(assert (=> b!209999 (= e!136775 e!136776)))

(declare-fun res!102398 () Bool)

(assert (=> b!209999 (= res!102398 call!19852)))

(assert (=> b!209999 (=> (not res!102398) (not e!136776))))

(declare-fun b!210000 () Bool)

(declare-fun e!136772 () Bool)

(assert (=> b!210000 (= e!136772 (= (apply!190 lt!107435 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!210001 () Bool)

(assert (=> b!210001 (= e!136781 (= (apply!190 lt!107435 (select (arr!4739 _keys!825) #b00000000000000000000000000000000)) (get!2542 (select (arr!4740 lt!107287) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5065 lt!107287)))))

(assert (=> b!210001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(declare-fun b!210002 () Bool)

(assert (=> b!210002 (= e!136771 call!19858)))

(declare-fun b!210003 () Bool)

(assert (=> b!210003 (= e!136770 e!136771)))

(assert (=> b!210003 (= c!35530 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210004 () Bool)

(assert (=> b!210004 (= e!136773 call!19858)))

(declare-fun d!57909 () Bool)

(assert (=> d!57909 e!136774))

(declare-fun res!102400 () Bool)

(assert (=> d!57909 (=> (not res!102400) (not e!136774))))

(assert (=> d!57909 (= res!102400 (or (bvsge #b00000000000000000000000000000000 (size!5064 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))))

(declare-fun lt!107436 () ListLongMap!3053)

(assert (=> d!57909 (= lt!107435 lt!107436)))

(declare-fun lt!107423 () Unit!6378)

(assert (=> d!57909 (= lt!107423 e!136778)))

(declare-fun c!35528 () Bool)

(assert (=> d!57909 (= c!35528 e!136769)))

(declare-fun res!102399 () Bool)

(assert (=> d!57909 (=> (not res!102399) (not e!136769))))

(assert (=> d!57909 (= res!102399 (bvslt #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(assert (=> d!57909 (= lt!107436 e!136770)))

(assert (=> d!57909 (= c!35529 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57909 (validMask!0 mask!1149)))

(assert (=> d!57909 (= (getCurrentListMap!1080 _keys!825 lt!107287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107435)))

(declare-fun b!210005 () Bool)

(assert (=> b!210005 (= e!136780 e!136772)))

(declare-fun res!102395 () Bool)

(assert (=> b!210005 (= res!102395 call!19855)))

(assert (=> b!210005 (=> (not res!102395) (not e!136772))))

(declare-fun b!210006 () Bool)

(assert (=> b!210006 (= e!136774 e!136780)))

(declare-fun c!35526 () Bool)

(assert (=> b!210006 (= c!35526 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!57909 c!35529) b!209989))

(assert (= (and d!57909 (not c!35529)) b!210003))

(assert (= (and b!210003 c!35530) b!210002))

(assert (= (and b!210003 (not c!35530)) b!209994))

(assert (= (and b!209994 c!35527) b!210004))

(assert (= (and b!209994 (not c!35527)) b!209992))

(assert (= (or b!210004 b!209992) bm!19849))

(assert (= (or b!210002 bm!19849) bm!19851))

(assert (= (or b!210002 b!210004) bm!19850))

(assert (= (or b!209989 bm!19851) bm!19855))

(assert (= (or b!209989 bm!19850) bm!19853))

(assert (= (and d!57909 res!102399) b!209988))

(assert (= (and d!57909 c!35528) b!209990))

(assert (= (and d!57909 (not c!35528)) b!209993))

(assert (= (and d!57909 res!102400) b!209996))

(assert (= (and b!209996 res!102393) b!209986))

(assert (= (and b!209996 (not res!102396)) b!209997))

(assert (= (and b!209997 res!102394) b!210001))

(assert (= (and b!209996 res!102392) b!209987))

(assert (= (and b!209987 c!35525) b!209999))

(assert (= (and b!209987 (not c!35525)) b!209995))

(assert (= (and b!209999 res!102398) b!209991))

(assert (= (or b!209999 b!209995) bm!19854))

(assert (= (and b!209987 res!102397) b!210006))

(assert (= (and b!210006 c!35526) b!210005))

(assert (= (and b!210006 (not c!35526)) b!209998))

(assert (= (and b!210005 res!102395) b!210000))

(assert (= (or b!210005 b!209998) bm!19852))

(declare-fun b_lambda!7573 () Bool)

(assert (=> (not b_lambda!7573) (not b!210001)))

(assert (=> b!210001 t!7973))

(declare-fun b_and!12301 () Bool)

(assert (= b_and!12299 (and (=> t!7973 result!4967) b_and!12301)))

(assert (=> b!210001 m!237323))

(assert (=> b!210001 m!237299))

(assert (=> b!210001 m!237325))

(assert (=> b!210001 m!237275))

(assert (=> b!210001 m!237323))

(assert (=> b!210001 m!237299))

(assert (=> b!210001 m!237275))

(declare-fun m!237387 () Bool)

(assert (=> b!210001 m!237387))

(assert (=> d!57909 m!237227))

(assert (=> b!209986 m!237275))

(assert (=> b!209986 m!237275))

(assert (=> b!209986 m!237281))

(declare-fun m!237389 () Bool)

(assert (=> b!209991 m!237389))

(assert (=> b!209997 m!237275))

(assert (=> b!209997 m!237275))

(declare-fun m!237391 () Bool)

(assert (=> b!209997 m!237391))

(declare-fun m!237393 () Bool)

(assert (=> b!209989 m!237393))

(declare-fun m!237395 () Bool)

(assert (=> b!209990 m!237395))

(assert (=> b!209990 m!237275))

(declare-fun m!237397 () Bool)

(assert (=> b!209990 m!237397))

(declare-fun m!237399 () Bool)

(assert (=> b!209990 m!237399))

(declare-fun m!237401 () Bool)

(assert (=> b!209990 m!237401))

(declare-fun m!237403 () Bool)

(assert (=> b!209990 m!237403))

(assert (=> b!209990 m!237395))

(declare-fun m!237405 () Bool)

(assert (=> b!209990 m!237405))

(declare-fun m!237407 () Bool)

(assert (=> b!209990 m!237407))

(declare-fun m!237409 () Bool)

(assert (=> b!209990 m!237409))

(declare-fun m!237411 () Bool)

(assert (=> b!209990 m!237411))

(assert (=> b!209990 m!237407))

(declare-fun m!237413 () Bool)

(assert (=> b!209990 m!237413))

(declare-fun m!237415 () Bool)

(assert (=> b!209990 m!237415))

(declare-fun m!237417 () Bool)

(assert (=> b!209990 m!237417))

(assert (=> b!209990 m!237211))

(declare-fun m!237419 () Bool)

(assert (=> b!209990 m!237419))

(assert (=> b!209990 m!237413))

(declare-fun m!237421 () Bool)

(assert (=> b!209990 m!237421))

(assert (=> b!209990 m!237399))

(declare-fun m!237423 () Bool)

(assert (=> b!209990 m!237423))

(declare-fun m!237425 () Bool)

(assert (=> bm!19854 m!237425))

(assert (=> b!209988 m!237275))

(assert (=> b!209988 m!237275))

(assert (=> b!209988 m!237281))

(assert (=> bm!19855 m!237211))

(declare-fun m!237427 () Bool)

(assert (=> b!210000 m!237427))

(declare-fun m!237429 () Bool)

(assert (=> bm!19852 m!237429))

(declare-fun m!237431 () Bool)

(assert (=> bm!19853 m!237431))

(assert (=> b!209805 d!57909))

(declare-fun d!57911 () Bool)

(declare-fun e!136784 () Bool)

(assert (=> d!57911 e!136784))

(declare-fun res!102406 () Bool)

(assert (=> d!57911 (=> (not res!102406) (not e!136784))))

(declare-fun lt!107453 () ListLongMap!3053)

(assert (=> d!57911 (= res!102406 (contains!1393 lt!107453 (_1!2081 (tuple2!4141 k0!843 v!520))))))

(declare-fun lt!107454 () List!3036)

(assert (=> d!57911 (= lt!107453 (ListLongMap!3054 lt!107454))))

(declare-fun lt!107452 () Unit!6378)

(declare-fun lt!107451 () Unit!6378)

(assert (=> d!57911 (= lt!107452 lt!107451)))

(declare-datatypes ((Option!254 0))(
  ( (Some!253 (v!4719 V!6835)) (None!252) )
))
(declare-fun getValueByKey!248 (List!3036 (_ BitVec 64)) Option!254)

(assert (=> d!57911 (= (getValueByKey!248 lt!107454 (_1!2081 (tuple2!4141 k0!843 v!520))) (Some!253 (_2!2081 (tuple2!4141 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!135 (List!3036 (_ BitVec 64) V!6835) Unit!6378)

(assert (=> d!57911 (= lt!107451 (lemmaContainsTupThenGetReturnValue!135 lt!107454 (_1!2081 (tuple2!4141 k0!843 v!520)) (_2!2081 (tuple2!4141 k0!843 v!520))))))

(declare-fun insertStrictlySorted!138 (List!3036 (_ BitVec 64) V!6835) List!3036)

(assert (=> d!57911 (= lt!107454 (insertStrictlySorted!138 (toList!1542 lt!107288) (_1!2081 (tuple2!4141 k0!843 v!520)) (_2!2081 (tuple2!4141 k0!843 v!520))))))

(assert (=> d!57911 (= (+!545 lt!107288 (tuple2!4141 k0!843 v!520)) lt!107453)))

(declare-fun b!210011 () Bool)

(declare-fun res!102405 () Bool)

(assert (=> b!210011 (=> (not res!102405) (not e!136784))))

(assert (=> b!210011 (= res!102405 (= (getValueByKey!248 (toList!1542 lt!107453) (_1!2081 (tuple2!4141 k0!843 v!520))) (Some!253 (_2!2081 (tuple2!4141 k0!843 v!520)))))))

(declare-fun b!210012 () Bool)

(declare-fun contains!1394 (List!3036 tuple2!4140) Bool)

(assert (=> b!210012 (= e!136784 (contains!1394 (toList!1542 lt!107453) (tuple2!4141 k0!843 v!520)))))

(assert (= (and d!57911 res!102406) b!210011))

(assert (= (and b!210011 res!102405) b!210012))

(declare-fun m!237433 () Bool)

(assert (=> d!57911 m!237433))

(declare-fun m!237435 () Bool)

(assert (=> d!57911 m!237435))

(declare-fun m!237437 () Bool)

(assert (=> d!57911 m!237437))

(declare-fun m!237439 () Bool)

(assert (=> d!57911 m!237439))

(declare-fun m!237441 () Bool)

(assert (=> b!210011 m!237441))

(declare-fun m!237443 () Bool)

(assert (=> b!210012 m!237443))

(assert (=> b!209805 d!57911))

(declare-fun bm!19860 () Bool)

(declare-fun call!19864 () ListLongMap!3053)

(assert (=> bm!19860 (= call!19864 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun call!19863 () ListLongMap!3053)

(declare-fun e!136789 () Bool)

(declare-fun b!210020 () Bool)

(assert (=> b!210020 (= e!136789 (= call!19863 (+!545 call!19864 (tuple2!4141 k0!843 v!520))))))

(declare-fun b!210021 () Bool)

(assert (=> b!210021 (= e!136789 (= call!19863 call!19864))))

(declare-fun bm!19861 () Bool)

(assert (=> bm!19861 (= call!19863 (getCurrentListMapNoExtraKeys!482 _keys!825 (array!9982 (store (arr!4740 _values!649) i!601 (ValueCellFull!2352 v!520)) (size!5065 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210019 () Bool)

(declare-fun e!136790 () Bool)

(assert (=> b!210019 (= e!136790 e!136789)))

(declare-fun c!35533 () Bool)

(assert (=> b!210019 (= c!35533 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun d!57913 () Bool)

(assert (=> d!57913 e!136790))

(declare-fun res!102409 () Bool)

(assert (=> d!57913 (=> (not res!102409) (not e!136790))))

(assert (=> d!57913 (= res!102409 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5065 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5065 _values!649))))))))

(declare-fun lt!107457 () Unit!6378)

(declare-fun choose!1073 (array!9979 array!9981 (_ BitVec 32) (_ BitVec 32) V!6835 V!6835 (_ BitVec 32) (_ BitVec 64) V!6835 (_ BitVec 32) Int) Unit!6378)

(assert (=> d!57913 (= lt!107457 (choose!1073 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5064 _keys!825)))))

(assert (=> d!57913 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!197 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!107457)))

(assert (= (and d!57913 res!102409) b!210019))

(assert (= (and b!210019 c!35533) b!210020))

(assert (= (and b!210019 (not c!35533)) b!210021))

(assert (= (or b!210020 b!210021) bm!19861))

(assert (= (or b!210020 b!210021) bm!19860))

(assert (=> bm!19860 m!237209))

(declare-fun m!237445 () Bool)

(assert (=> b!210020 m!237445))

(assert (=> bm!19861 m!237203))

(declare-fun m!237447 () Bool)

(assert (=> bm!19861 m!237447))

(declare-fun m!237449 () Bool)

(assert (=> d!57913 m!237449))

(assert (=> b!209805 d!57913))

(declare-fun d!57915 () Bool)

(declare-fun e!136791 () Bool)

(assert (=> d!57915 e!136791))

(declare-fun res!102411 () Bool)

(assert (=> d!57915 (=> (not res!102411) (not e!136791))))

(declare-fun lt!107460 () ListLongMap!3053)

(assert (=> d!57915 (= res!102411 (contains!1393 lt!107460 (_1!2081 lt!107284)))))

(declare-fun lt!107461 () List!3036)

(assert (=> d!57915 (= lt!107460 (ListLongMap!3054 lt!107461))))

(declare-fun lt!107459 () Unit!6378)

(declare-fun lt!107458 () Unit!6378)

(assert (=> d!57915 (= lt!107459 lt!107458)))

(assert (=> d!57915 (= (getValueByKey!248 lt!107461 (_1!2081 lt!107284)) (Some!253 (_2!2081 lt!107284)))))

(assert (=> d!57915 (= lt!107458 (lemmaContainsTupThenGetReturnValue!135 lt!107461 (_1!2081 lt!107284) (_2!2081 lt!107284)))))

(assert (=> d!57915 (= lt!107461 (insertStrictlySorted!138 (toList!1542 (+!545 lt!107288 lt!107290)) (_1!2081 lt!107284) (_2!2081 lt!107284)))))

(assert (=> d!57915 (= (+!545 (+!545 lt!107288 lt!107290) lt!107284) lt!107460)))

(declare-fun b!210022 () Bool)

(declare-fun res!102410 () Bool)

(assert (=> b!210022 (=> (not res!102410) (not e!136791))))

(assert (=> b!210022 (= res!102410 (= (getValueByKey!248 (toList!1542 lt!107460) (_1!2081 lt!107284)) (Some!253 (_2!2081 lt!107284))))))

(declare-fun b!210023 () Bool)

(assert (=> b!210023 (= e!136791 (contains!1394 (toList!1542 lt!107460) lt!107284))))

(assert (= (and d!57915 res!102411) b!210022))

(assert (= (and b!210022 res!102410) b!210023))

(declare-fun m!237451 () Bool)

(assert (=> d!57915 m!237451))

(declare-fun m!237453 () Bool)

(assert (=> d!57915 m!237453))

(declare-fun m!237455 () Bool)

(assert (=> d!57915 m!237455))

(declare-fun m!237457 () Bool)

(assert (=> d!57915 m!237457))

(declare-fun m!237459 () Bool)

(assert (=> b!210022 m!237459))

(declare-fun m!237461 () Bool)

(assert (=> b!210023 m!237461))

(assert (=> b!209811 d!57915))

(declare-fun d!57917 () Bool)

(declare-fun e!136792 () Bool)

(assert (=> d!57917 e!136792))

(declare-fun res!102413 () Bool)

(assert (=> d!57917 (=> (not res!102413) (not e!136792))))

(declare-fun lt!107464 () ListLongMap!3053)

(assert (=> d!57917 (= res!102413 (contains!1393 lt!107464 (_1!2081 lt!107290)))))

(declare-fun lt!107465 () List!3036)

(assert (=> d!57917 (= lt!107464 (ListLongMap!3054 lt!107465))))

(declare-fun lt!107463 () Unit!6378)

(declare-fun lt!107462 () Unit!6378)

(assert (=> d!57917 (= lt!107463 lt!107462)))

(assert (=> d!57917 (= (getValueByKey!248 lt!107465 (_1!2081 lt!107290)) (Some!253 (_2!2081 lt!107290)))))

(assert (=> d!57917 (= lt!107462 (lemmaContainsTupThenGetReturnValue!135 lt!107465 (_1!2081 lt!107290) (_2!2081 lt!107290)))))

(assert (=> d!57917 (= lt!107465 (insertStrictlySorted!138 (toList!1542 lt!107288) (_1!2081 lt!107290) (_2!2081 lt!107290)))))

(assert (=> d!57917 (= (+!545 lt!107288 lt!107290) lt!107464)))

(declare-fun b!210024 () Bool)

(declare-fun res!102412 () Bool)

(assert (=> b!210024 (=> (not res!102412) (not e!136792))))

(assert (=> b!210024 (= res!102412 (= (getValueByKey!248 (toList!1542 lt!107464) (_1!2081 lt!107290)) (Some!253 (_2!2081 lt!107290))))))

(declare-fun b!210025 () Bool)

(assert (=> b!210025 (= e!136792 (contains!1394 (toList!1542 lt!107464) lt!107290))))

(assert (= (and d!57917 res!102413) b!210024))

(assert (= (and b!210024 res!102412) b!210025))

(declare-fun m!237463 () Bool)

(assert (=> d!57917 m!237463))

(declare-fun m!237465 () Bool)

(assert (=> d!57917 m!237465))

(declare-fun m!237467 () Bool)

(assert (=> d!57917 m!237467))

(declare-fun m!237469 () Bool)

(assert (=> d!57917 m!237469))

(declare-fun m!237471 () Bool)

(assert (=> b!210024 m!237471))

(declare-fun m!237473 () Bool)

(assert (=> b!210025 m!237473))

(assert (=> b!209811 d!57917))

(declare-fun d!57919 () Bool)

(declare-fun e!136793 () Bool)

(assert (=> d!57919 e!136793))

(declare-fun res!102415 () Bool)

(assert (=> d!57919 (=> (not res!102415) (not e!136793))))

(declare-fun lt!107468 () ListLongMap!3053)

(assert (=> d!57919 (= res!102415 (contains!1393 lt!107468 (_1!2081 lt!107284)))))

(declare-fun lt!107469 () List!3036)

(assert (=> d!57919 (= lt!107468 (ListLongMap!3054 lt!107469))))

(declare-fun lt!107467 () Unit!6378)

(declare-fun lt!107466 () Unit!6378)

(assert (=> d!57919 (= lt!107467 lt!107466)))

(assert (=> d!57919 (= (getValueByKey!248 lt!107469 (_1!2081 lt!107284)) (Some!253 (_2!2081 lt!107284)))))

(assert (=> d!57919 (= lt!107466 (lemmaContainsTupThenGetReturnValue!135 lt!107469 (_1!2081 lt!107284) (_2!2081 lt!107284)))))

(assert (=> d!57919 (= lt!107469 (insertStrictlySorted!138 (toList!1542 (+!545 lt!107286 lt!107290)) (_1!2081 lt!107284) (_2!2081 lt!107284)))))

(assert (=> d!57919 (= (+!545 (+!545 lt!107286 lt!107290) lt!107284) lt!107468)))

(declare-fun b!210026 () Bool)

(declare-fun res!102414 () Bool)

(assert (=> b!210026 (=> (not res!102414) (not e!136793))))

(assert (=> b!210026 (= res!102414 (= (getValueByKey!248 (toList!1542 lt!107468) (_1!2081 lt!107284)) (Some!253 (_2!2081 lt!107284))))))

(declare-fun b!210027 () Bool)

(assert (=> b!210027 (= e!136793 (contains!1394 (toList!1542 lt!107468) lt!107284))))

(assert (= (and d!57919 res!102415) b!210026))

(assert (= (and b!210026 res!102414) b!210027))

(declare-fun m!237475 () Bool)

(assert (=> d!57919 m!237475))

(declare-fun m!237477 () Bool)

(assert (=> d!57919 m!237477))

(declare-fun m!237479 () Bool)

(assert (=> d!57919 m!237479))

(declare-fun m!237481 () Bool)

(assert (=> d!57919 m!237481))

(declare-fun m!237483 () Bool)

(assert (=> b!210026 m!237483))

(declare-fun m!237485 () Bool)

(assert (=> b!210027 m!237485))

(assert (=> b!209811 d!57919))

(declare-fun d!57921 () Bool)

(declare-fun e!136794 () Bool)

(assert (=> d!57921 e!136794))

(declare-fun res!102417 () Bool)

(assert (=> d!57921 (=> (not res!102417) (not e!136794))))

(declare-fun lt!107472 () ListLongMap!3053)

(assert (=> d!57921 (= res!102417 (contains!1393 lt!107472 (_1!2081 lt!107290)))))

(declare-fun lt!107473 () List!3036)

(assert (=> d!57921 (= lt!107472 (ListLongMap!3054 lt!107473))))

(declare-fun lt!107471 () Unit!6378)

(declare-fun lt!107470 () Unit!6378)

(assert (=> d!57921 (= lt!107471 lt!107470)))

(assert (=> d!57921 (= (getValueByKey!248 lt!107473 (_1!2081 lt!107290)) (Some!253 (_2!2081 lt!107290)))))

(assert (=> d!57921 (= lt!107470 (lemmaContainsTupThenGetReturnValue!135 lt!107473 (_1!2081 lt!107290) (_2!2081 lt!107290)))))

(assert (=> d!57921 (= lt!107473 (insertStrictlySorted!138 (toList!1542 lt!107286) (_1!2081 lt!107290) (_2!2081 lt!107290)))))

(assert (=> d!57921 (= (+!545 lt!107286 lt!107290) lt!107472)))

(declare-fun b!210028 () Bool)

(declare-fun res!102416 () Bool)

(assert (=> b!210028 (=> (not res!102416) (not e!136794))))

(assert (=> b!210028 (= res!102416 (= (getValueByKey!248 (toList!1542 lt!107472) (_1!2081 lt!107290)) (Some!253 (_2!2081 lt!107290))))))

(declare-fun b!210029 () Bool)

(assert (=> b!210029 (= e!136794 (contains!1394 (toList!1542 lt!107472) lt!107290))))

(assert (= (and d!57921 res!102417) b!210028))

(assert (= (and b!210028 res!102416) b!210029))

(declare-fun m!237487 () Bool)

(assert (=> d!57921 m!237487))

(declare-fun m!237489 () Bool)

(assert (=> d!57921 m!237489))

(declare-fun m!237491 () Bool)

(assert (=> d!57921 m!237491))

(declare-fun m!237493 () Bool)

(assert (=> d!57921 m!237493))

(declare-fun m!237495 () Bool)

(assert (=> b!210028 m!237495))

(declare-fun m!237497 () Bool)

(assert (=> b!210029 m!237497))

(assert (=> b!209811 d!57921))

(declare-fun b!210037 () Bool)

(declare-fun e!136799 () Bool)

(assert (=> b!210037 (= e!136799 tp_is_empty!5391)))

(declare-fun b!210036 () Bool)

(declare-fun e!136800 () Bool)

(assert (=> b!210036 (= e!136800 tp_is_empty!5391)))

(declare-fun mapIsEmpty!9164 () Bool)

(declare-fun mapRes!9164 () Bool)

(assert (=> mapIsEmpty!9164 mapRes!9164))

(declare-fun condMapEmpty!9164 () Bool)

(declare-fun mapDefault!9164 () ValueCell!2352)

(assert (=> mapNonEmpty!9158 (= condMapEmpty!9164 (= mapRest!9158 ((as const (Array (_ BitVec 32) ValueCell!2352)) mapDefault!9164)))))

(assert (=> mapNonEmpty!9158 (= tp!19630 (and e!136799 mapRes!9164))))

(declare-fun mapNonEmpty!9164 () Bool)

(declare-fun tp!19640 () Bool)

(assert (=> mapNonEmpty!9164 (= mapRes!9164 (and tp!19640 e!136800))))

(declare-fun mapRest!9164 () (Array (_ BitVec 32) ValueCell!2352))

(declare-fun mapValue!9164 () ValueCell!2352)

(declare-fun mapKey!9164 () (_ BitVec 32))

(assert (=> mapNonEmpty!9164 (= mapRest!9158 (store mapRest!9164 mapKey!9164 mapValue!9164))))

(assert (= (and mapNonEmpty!9158 condMapEmpty!9164) mapIsEmpty!9164))

(assert (= (and mapNonEmpty!9158 (not condMapEmpty!9164)) mapNonEmpty!9164))

(assert (= (and mapNonEmpty!9164 ((_ is ValueCellFull!2352) mapValue!9164)) b!210036))

(assert (= (and mapNonEmpty!9158 ((_ is ValueCellFull!2352) mapDefault!9164)) b!210037))

(declare-fun m!237499 () Bool)

(assert (=> mapNonEmpty!9164 m!237499))

(declare-fun b_lambda!7575 () Bool)

(assert (= b_lambda!7567 (or (and start!20896 b_free!5529) b_lambda!7575)))

(declare-fun b_lambda!7577 () Bool)

(assert (= b_lambda!7563 (or (and start!20896 b_free!5529) b_lambda!7577)))

(declare-fun b_lambda!7579 () Bool)

(assert (= b_lambda!7573 (or (and start!20896 b_free!5529) b_lambda!7579)))

(declare-fun b_lambda!7581 () Bool)

(assert (= b_lambda!7569 (or (and start!20896 b_free!5529) b_lambda!7581)))

(declare-fun b_lambda!7583 () Bool)

(assert (= b_lambda!7565 (or (and start!20896 b_free!5529) b_lambda!7583)))

(declare-fun b_lambda!7585 () Bool)

(assert (= b_lambda!7571 (or (and start!20896 b_free!5529) b_lambda!7585)))

(check-sat (not b!209997) (not b!209918) (not b!210028) (not b_lambda!7585) (not b!209990) (not bm!19848) (not b!210027) (not d!57909) (not d!57907) (not b!210024) (not b!210029) (not d!57903) (not d!57911) (not bm!19861) (not b_next!5529) (not b!209969) (not d!57913) (not b!209912) (not bm!19852) (not bm!19820) (not bm!19847) (not b!210012) (not b!209979) (not bm!19853) (not b!209900) (not b!209922) (not b_lambda!7581) (not d!57921) (not b!209860) (not b!210001) (not b!209859) (not b!209991) (not b!209897) (not b!210020) (not b_lambda!7577) (not bm!19845) (not b!209914) (not bm!19827) (not bm!19855) (not b!209913) (not b!210023) (not mapNonEmpty!9164) (not b!209857) (not b!209911) (not bm!19823) (not b!210011) (not b!209976) (not b!209906) (not b!209989) (not b!210025) (not b!209921) (not b!209898) (not b!210022) (not b!209980) (not d!57919) (not bm!19846) (not b!210026) (not d!57915) (not b!209920) (not b!209968) (not bm!19860) (not b!209988) (not b!209899) (not b!209908) (not b_lambda!7579) (not b!209907) (not b_lambda!7575) (not b!209872) (not b!209904) (not d!57917) (not b!210000) (not b!209965) (not bm!19854) (not bm!19826) b_and!12301 (not d!57905) (not b!209986) (not b!209870) tp_is_empty!5391 (not b!209970) (not b!209967) (not b_lambda!7583))
(check-sat b_and!12301 (not b_next!5529))
