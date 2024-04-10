; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4496 () Bool)

(assert start!4496)

(declare-fun b_free!1257 () Bool)

(declare-fun b_next!1257 () Bool)

(assert (=> start!4496 (= b_free!1257 (not b_next!1257))))

(declare-fun tp!5208 () Bool)

(declare-fun b_and!2079 () Bool)

(assert (=> start!4496 (= tp!5208 b_and!2079)))

(declare-fun b!35071 () Bool)

(declare-fun e!22161 () Bool)

(declare-fun tp_is_empty!1611 () Bool)

(assert (=> b!35071 (= e!22161 tp_is_empty!1611)))

(declare-fun b!35072 () Bool)

(declare-fun e!22162 () Bool)

(assert (=> b!35072 (= e!22162 tp_is_empty!1611)))

(declare-fun b!35073 () Bool)

(declare-fun res!21331 () Bool)

(declare-fun e!22165 () Bool)

(assert (=> b!35073 (=> (not res!21331) (not e!22165))))

(declare-datatypes ((array!2435 0))(
  ( (array!2436 (arr!1165 (Array (_ BitVec 32) (_ BitVec 64))) (size!1266 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2435)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35073 (= res!21331 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun res!21330 () Bool)

(assert (=> start!4496 (=> (not res!21330) (not e!22165))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4496 (= res!21330 (validMask!0 mask!2294))))

(assert (=> start!4496 e!22165))

(assert (=> start!4496 true))

(assert (=> start!4496 tp!5208))

(declare-datatypes ((V!1973 0))(
  ( (V!1974 (val!832 Int)) )
))
(declare-datatypes ((ValueCell!606 0))(
  ( (ValueCellFull!606 (v!1927 V!1973)) (EmptyCell!606) )
))
(declare-datatypes ((array!2437 0))(
  ( (array!2438 (arr!1166 (Array (_ BitVec 32) ValueCell!606)) (size!1267 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2437)

(declare-fun e!22163 () Bool)

(declare-fun array_inv!823 (array!2437) Bool)

(assert (=> start!4496 (and (array_inv!823 _values!1501) e!22163)))

(declare-fun array_inv!824 (array!2435) Bool)

(assert (=> start!4496 (array_inv!824 _keys!1833)))

(assert (=> start!4496 tp_is_empty!1611))

(declare-fun b!35074 () Bool)

(declare-fun res!21332 () Bool)

(assert (=> b!35074 (=> (not res!21332) (not e!22165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35074 (= res!21332 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1963 () Bool)

(declare-fun mapRes!1963 () Bool)

(assert (=> mapIsEmpty!1963 mapRes!1963))

(declare-fun b!35075 () Bool)

(declare-fun res!21336 () Bool)

(assert (=> b!35075 (=> (not res!21336) (not e!22165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2435 (_ BitVec 32)) Bool)

(assert (=> b!35075 (= res!21336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35076 () Bool)

(declare-datatypes ((SeekEntryResult!159 0))(
  ( (MissingZero!159 (index!2758 (_ BitVec 32))) (Found!159 (index!2759 (_ BitVec 32))) (Intermediate!159 (undefined!971 Bool) (index!2760 (_ BitVec 32)) (x!6985 (_ BitVec 32))) (Undefined!159) (MissingVacant!159 (index!2761 (_ BitVec 32))) )
))
(declare-fun lt!12843 () SeekEntryResult!159)

(get-info :version)

(assert (=> b!35076 (= e!22165 (and ((_ is Found!159) lt!12843) (or (bvslt (index!2759 lt!12843) #b00000000000000000000000000000000) (bvsge (index!2759 lt!12843) (size!1266 _keys!1833)))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2435 (_ BitVec 32)) SeekEntryResult!159)

(assert (=> b!35076 (= lt!12843 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35077 () Bool)

(declare-fun res!21335 () Bool)

(assert (=> b!35077 (=> (not res!21335) (not e!22165))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!35077 (= res!21335 (and (= (size!1267 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1266 _keys!1833) (size!1267 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1963 () Bool)

(declare-fun tp!5209 () Bool)

(assert (=> mapNonEmpty!1963 (= mapRes!1963 (and tp!5209 e!22162))))

(declare-fun mapValue!1963 () ValueCell!606)

(declare-fun mapRest!1963 () (Array (_ BitVec 32) ValueCell!606))

(declare-fun mapKey!1963 () (_ BitVec 32))

(assert (=> mapNonEmpty!1963 (= (arr!1166 _values!1501) (store mapRest!1963 mapKey!1963 mapValue!1963))))

(declare-fun b!35078 () Bool)

(declare-fun res!21333 () Bool)

(assert (=> b!35078 (=> (not res!21333) (not e!22165))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1973)

(declare-fun minValue!1443 () V!1973)

(declare-datatypes ((tuple2!1346 0))(
  ( (tuple2!1347 (_1!684 (_ BitVec 64)) (_2!684 V!1973)) )
))
(declare-datatypes ((List!937 0))(
  ( (Nil!934) (Cons!933 (h!1500 tuple2!1346) (t!3642 List!937)) )
))
(declare-datatypes ((ListLongMap!923 0))(
  ( (ListLongMap!924 (toList!477 List!937)) )
))
(declare-fun contains!423 (ListLongMap!923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!301 (array!2435 array!2437 (_ BitVec 32) (_ BitVec 32) V!1973 V!1973 (_ BitVec 32) Int) ListLongMap!923)

(assert (=> b!35078 (= res!21333 (not (contains!423 (getCurrentListMap!301 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!35079 () Bool)

(declare-fun res!21334 () Bool)

(assert (=> b!35079 (=> (not res!21334) (not e!22165))))

(declare-datatypes ((List!938 0))(
  ( (Nil!935) (Cons!934 (h!1501 (_ BitVec 64)) (t!3643 List!938)) )
))
(declare-fun arrayNoDuplicates!0 (array!2435 (_ BitVec 32) List!938) Bool)

(assert (=> b!35079 (= res!21334 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!935))))

(declare-fun b!35080 () Bool)

(assert (=> b!35080 (= e!22163 (and e!22161 mapRes!1963))))

(declare-fun condMapEmpty!1963 () Bool)

(declare-fun mapDefault!1963 () ValueCell!606)

(assert (=> b!35080 (= condMapEmpty!1963 (= (arr!1166 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!606)) mapDefault!1963)))))

(assert (= (and start!4496 res!21330) b!35077))

(assert (= (and b!35077 res!21335) b!35075))

(assert (= (and b!35075 res!21336) b!35079))

(assert (= (and b!35079 res!21334) b!35074))

(assert (= (and b!35074 res!21332) b!35078))

(assert (= (and b!35078 res!21333) b!35073))

(assert (= (and b!35073 res!21331) b!35076))

(assert (= (and b!35080 condMapEmpty!1963) mapIsEmpty!1963))

(assert (= (and b!35080 (not condMapEmpty!1963)) mapNonEmpty!1963))

(assert (= (and mapNonEmpty!1963 ((_ is ValueCellFull!606) mapValue!1963)) b!35072))

(assert (= (and b!35080 ((_ is ValueCellFull!606) mapDefault!1963)) b!35071))

(assert (= start!4496 b!35080))

(declare-fun m!28231 () Bool)

(assert (=> start!4496 m!28231))

(declare-fun m!28233 () Bool)

(assert (=> start!4496 m!28233))

(declare-fun m!28235 () Bool)

(assert (=> start!4496 m!28235))

(declare-fun m!28237 () Bool)

(assert (=> b!35078 m!28237))

(assert (=> b!35078 m!28237))

(declare-fun m!28239 () Bool)

(assert (=> b!35078 m!28239))

(declare-fun m!28241 () Bool)

(assert (=> mapNonEmpty!1963 m!28241))

(declare-fun m!28243 () Bool)

(assert (=> b!35079 m!28243))

(declare-fun m!28245 () Bool)

(assert (=> b!35075 m!28245))

(declare-fun m!28247 () Bool)

(assert (=> b!35076 m!28247))

(declare-fun m!28249 () Bool)

(assert (=> b!35074 m!28249))

(declare-fun m!28251 () Bool)

(assert (=> b!35073 m!28251))

(check-sat (not b!35076) (not b!35078) (not b_next!1257) b_and!2079 (not b!35073) (not b!35074) (not b!35075) (not b!35079) tp_is_empty!1611 (not mapNonEmpty!1963) (not start!4496))
(check-sat b_and!2079 (not b_next!1257))
(get-model)

(declare-fun d!5275 () Bool)

(declare-fun res!21362 () Bool)

(declare-fun e!22185 () Bool)

(assert (=> d!5275 (=> res!21362 e!22185)))

(assert (=> d!5275 (= res!21362 (= (select (arr!1165 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5275 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22185)))

(declare-fun b!35115 () Bool)

(declare-fun e!22186 () Bool)

(assert (=> b!35115 (= e!22185 e!22186)))

(declare-fun res!21363 () Bool)

(assert (=> b!35115 (=> (not res!21363) (not e!22186))))

(assert (=> b!35115 (= res!21363 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1266 _keys!1833)))))

(declare-fun b!35116 () Bool)

(assert (=> b!35116 (= e!22186 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5275 (not res!21362)) b!35115))

(assert (= (and b!35115 res!21363) b!35116))

(declare-fun m!28275 () Bool)

(assert (=> d!5275 m!28275))

(declare-fun m!28277 () Bool)

(assert (=> b!35116 m!28277))

(assert (=> b!35073 d!5275))

(declare-fun d!5277 () Bool)

(assert (=> d!5277 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35074 d!5277))

(declare-fun b!35129 () Bool)

(declare-fun c!3966 () Bool)

(declare-fun lt!12856 () (_ BitVec 64))

(assert (=> b!35129 (= c!3966 (= lt!12856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22193 () SeekEntryResult!159)

(declare-fun e!22194 () SeekEntryResult!159)

(assert (=> b!35129 (= e!22193 e!22194)))

(declare-fun d!5279 () Bool)

(declare-fun lt!12858 () SeekEntryResult!159)

(assert (=> d!5279 (and (or ((_ is MissingVacant!159) lt!12858) (not ((_ is Found!159) lt!12858)) (and (bvsge (index!2759 lt!12858) #b00000000000000000000000000000000) (bvslt (index!2759 lt!12858) (size!1266 _keys!1833)))) (not ((_ is MissingVacant!159) lt!12858)) (or (not ((_ is Found!159) lt!12858)) (= (select (arr!1165 _keys!1833) (index!2759 lt!12858)) k0!1304)))))

(declare-fun e!22195 () SeekEntryResult!159)

(assert (=> d!5279 (= lt!12858 e!22195)))

(declare-fun c!3965 () Bool)

(declare-fun lt!12855 () SeekEntryResult!159)

(assert (=> d!5279 (= c!3965 (and ((_ is Intermediate!159) lt!12855) (undefined!971 lt!12855)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2435 (_ BitVec 32)) SeekEntryResult!159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5279 (= lt!12855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5279 (validMask!0 mask!2294)))

(assert (=> d!5279 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12858)))

(declare-fun b!35130 () Bool)

(assert (=> b!35130 (= e!22195 Undefined!159)))

(declare-fun b!35131 () Bool)

(assert (=> b!35131 (= e!22195 e!22193)))

(assert (=> b!35131 (= lt!12856 (select (arr!1165 _keys!1833) (index!2760 lt!12855)))))

(declare-fun c!3967 () Bool)

(assert (=> b!35131 (= c!3967 (= lt!12856 k0!1304))))

(declare-fun b!35132 () Bool)

(declare-fun lt!12857 () SeekEntryResult!159)

(assert (=> b!35132 (= e!22194 (ite ((_ is MissingVacant!159) lt!12857) (MissingZero!159 (index!2761 lt!12857)) lt!12857))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2435 (_ BitVec 32)) SeekEntryResult!159)

(assert (=> b!35132 (= lt!12857 (seekKeyOrZeroReturnVacant!0 (x!6985 lt!12855) (index!2760 lt!12855) (index!2760 lt!12855) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35133 () Bool)

(assert (=> b!35133 (= e!22194 (MissingZero!159 (index!2760 lt!12855)))))

(declare-fun b!35134 () Bool)

(assert (=> b!35134 (= e!22193 (Found!159 (index!2760 lt!12855)))))

(assert (= (and d!5279 c!3965) b!35130))

(assert (= (and d!5279 (not c!3965)) b!35131))

(assert (= (and b!35131 c!3967) b!35134))

(assert (= (and b!35131 (not c!3967)) b!35129))

(assert (= (and b!35129 c!3966) b!35133))

(assert (= (and b!35129 (not c!3966)) b!35132))

(declare-fun m!28279 () Bool)

(assert (=> d!5279 m!28279))

(declare-fun m!28281 () Bool)

(assert (=> d!5279 m!28281))

(assert (=> d!5279 m!28281))

(declare-fun m!28283 () Bool)

(assert (=> d!5279 m!28283))

(assert (=> d!5279 m!28231))

(declare-fun m!28285 () Bool)

(assert (=> b!35131 m!28285))

(declare-fun m!28287 () Bool)

(assert (=> b!35132 m!28287))

(assert (=> b!35076 d!5279))

(declare-fun d!5281 () Bool)

(assert (=> d!5281 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4496 d!5281))

(declare-fun d!5283 () Bool)

(assert (=> d!5283 (= (array_inv!823 _values!1501) (bvsge (size!1267 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4496 d!5283))

(declare-fun d!5285 () Bool)

(assert (=> d!5285 (= (array_inv!824 _keys!1833) (bvsge (size!1266 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4496 d!5285))

(declare-fun b!35145 () Bool)

(declare-fun e!22204 () Bool)

(declare-fun call!2754 () Bool)

(assert (=> b!35145 (= e!22204 call!2754)))

(declare-fun b!35146 () Bool)

(assert (=> b!35146 (= e!22204 call!2754)))

(declare-fun b!35147 () Bool)

(declare-fun e!22207 () Bool)

(declare-fun e!22205 () Bool)

(assert (=> b!35147 (= e!22207 e!22205)))

(declare-fun res!21370 () Bool)

(assert (=> b!35147 (=> (not res!21370) (not e!22205))))

(declare-fun e!22206 () Bool)

(assert (=> b!35147 (= res!21370 (not e!22206))))

(declare-fun res!21371 () Bool)

(assert (=> b!35147 (=> (not res!21371) (not e!22206))))

(assert (=> b!35147 (= res!21371 (validKeyInArray!0 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35148 () Bool)

(assert (=> b!35148 (= e!22205 e!22204)))

(declare-fun c!3970 () Bool)

(assert (=> b!35148 (= c!3970 (validKeyInArray!0 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2751 () Bool)

(assert (=> bm!2751 (= call!2754 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3970 (Cons!934 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000) Nil!935) Nil!935)))))

(declare-fun b!35149 () Bool)

(declare-fun contains!424 (List!938 (_ BitVec 64)) Bool)

(assert (=> b!35149 (= e!22206 (contains!424 Nil!935 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5287 () Bool)

(declare-fun res!21372 () Bool)

(assert (=> d!5287 (=> res!21372 e!22207)))

(assert (=> d!5287 (= res!21372 (bvsge #b00000000000000000000000000000000 (size!1266 _keys!1833)))))

(assert (=> d!5287 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!935) e!22207)))

(assert (= (and d!5287 (not res!21372)) b!35147))

(assert (= (and b!35147 res!21371) b!35149))

(assert (= (and b!35147 res!21370) b!35148))

(assert (= (and b!35148 c!3970) b!35145))

(assert (= (and b!35148 (not c!3970)) b!35146))

(assert (= (or b!35145 b!35146) bm!2751))

(assert (=> b!35147 m!28275))

(assert (=> b!35147 m!28275))

(declare-fun m!28289 () Bool)

(assert (=> b!35147 m!28289))

(assert (=> b!35148 m!28275))

(assert (=> b!35148 m!28275))

(assert (=> b!35148 m!28289))

(assert (=> bm!2751 m!28275))

(declare-fun m!28291 () Bool)

(assert (=> bm!2751 m!28291))

(assert (=> b!35149 m!28275))

(assert (=> b!35149 m!28275))

(declare-fun m!28293 () Bool)

(assert (=> b!35149 m!28293))

(assert (=> b!35079 d!5287))

(declare-fun b!35158 () Bool)

(declare-fun e!22215 () Bool)

(declare-fun call!2757 () Bool)

(assert (=> b!35158 (= e!22215 call!2757)))

(declare-fun b!35159 () Bool)

(declare-fun e!22214 () Bool)

(assert (=> b!35159 (= e!22214 call!2757)))

(declare-fun b!35160 () Bool)

(assert (=> b!35160 (= e!22214 e!22215)))

(declare-fun lt!12867 () (_ BitVec 64))

(assert (=> b!35160 (= lt!12867 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!777 0))(
  ( (Unit!778) )
))
(declare-fun lt!12866 () Unit!777)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2435 (_ BitVec 64) (_ BitVec 32)) Unit!777)

(assert (=> b!35160 (= lt!12866 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12867 #b00000000000000000000000000000000))))

(assert (=> b!35160 (arrayContainsKey!0 _keys!1833 lt!12867 #b00000000000000000000000000000000)))

(declare-fun lt!12865 () Unit!777)

(assert (=> b!35160 (= lt!12865 lt!12866)))

(declare-fun res!21377 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2435 (_ BitVec 32)) SeekEntryResult!159)

(assert (=> b!35160 (= res!21377 (= (seekEntryOrOpen!0 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!159 #b00000000000000000000000000000000)))))

(assert (=> b!35160 (=> (not res!21377) (not e!22215))))

(declare-fun d!5289 () Bool)

(declare-fun res!21378 () Bool)

(declare-fun e!22216 () Bool)

(assert (=> d!5289 (=> res!21378 e!22216)))

(assert (=> d!5289 (= res!21378 (bvsge #b00000000000000000000000000000000 (size!1266 _keys!1833)))))

(assert (=> d!5289 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22216)))

(declare-fun b!35161 () Bool)

(assert (=> b!35161 (= e!22216 e!22214)))

(declare-fun c!3973 () Bool)

(assert (=> b!35161 (= c!3973 (validKeyInArray!0 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2754 () Bool)

(assert (=> bm!2754 (= call!2757 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(assert (= (and d!5289 (not res!21378)) b!35161))

(assert (= (and b!35161 c!3973) b!35160))

(assert (= (and b!35161 (not c!3973)) b!35159))

(assert (= (and b!35160 res!21377) b!35158))

(assert (= (or b!35158 b!35159) bm!2754))

(assert (=> b!35160 m!28275))

(declare-fun m!28295 () Bool)

(assert (=> b!35160 m!28295))

(declare-fun m!28297 () Bool)

(assert (=> b!35160 m!28297))

(assert (=> b!35160 m!28275))

(declare-fun m!28299 () Bool)

(assert (=> b!35160 m!28299))

(assert (=> b!35161 m!28275))

(assert (=> b!35161 m!28275))

(assert (=> b!35161 m!28289))

(declare-fun m!28301 () Bool)

(assert (=> bm!2754 m!28301))

(assert (=> b!35075 d!5289))

(declare-fun d!5291 () Bool)

(declare-fun e!22222 () Bool)

(assert (=> d!5291 e!22222))

(declare-fun res!21381 () Bool)

(assert (=> d!5291 (=> res!21381 e!22222)))

(declare-fun lt!12877 () Bool)

(assert (=> d!5291 (= res!21381 (not lt!12877))))

(declare-fun lt!12878 () Bool)

(assert (=> d!5291 (= lt!12877 lt!12878)))

(declare-fun lt!12876 () Unit!777)

(declare-fun e!22221 () Unit!777)

(assert (=> d!5291 (= lt!12876 e!22221)))

(declare-fun c!3976 () Bool)

(assert (=> d!5291 (= c!3976 lt!12878)))

(declare-fun containsKey!35 (List!937 (_ BitVec 64)) Bool)

(assert (=> d!5291 (= lt!12878 (containsKey!35 (toList!477 (getCurrentListMap!301 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5291 (= (contains!423 (getCurrentListMap!301 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!12877)))

(declare-fun b!35168 () Bool)

(declare-fun lt!12879 () Unit!777)

(assert (=> b!35168 (= e!22221 lt!12879)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!32 (List!937 (_ BitVec 64)) Unit!777)

(assert (=> b!35168 (= lt!12879 (lemmaContainsKeyImpliesGetValueByKeyDefined!32 (toList!477 (getCurrentListMap!301 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!77 0))(
  ( (Some!76 (v!1929 V!1973)) (None!75) )
))
(declare-fun isDefined!33 (Option!77) Bool)

(declare-fun getValueByKey!71 (List!937 (_ BitVec 64)) Option!77)

(assert (=> b!35168 (isDefined!33 (getValueByKey!71 (toList!477 (getCurrentListMap!301 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!35169 () Bool)

(declare-fun Unit!779 () Unit!777)

(assert (=> b!35169 (= e!22221 Unit!779)))

(declare-fun b!35170 () Bool)

(assert (=> b!35170 (= e!22222 (isDefined!33 (getValueByKey!71 (toList!477 (getCurrentListMap!301 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5291 c!3976) b!35168))

(assert (= (and d!5291 (not c!3976)) b!35169))

(assert (= (and d!5291 (not res!21381)) b!35170))

(declare-fun m!28303 () Bool)

(assert (=> d!5291 m!28303))

(declare-fun m!28305 () Bool)

(assert (=> b!35168 m!28305))

(declare-fun m!28307 () Bool)

(assert (=> b!35168 m!28307))

(assert (=> b!35168 m!28307))

(declare-fun m!28309 () Bool)

(assert (=> b!35168 m!28309))

(assert (=> b!35170 m!28307))

(assert (=> b!35170 m!28307))

(assert (=> b!35170 m!28309))

(assert (=> b!35078 d!5291))

(declare-fun call!2772 () ListLongMap!923)

(declare-fun bm!2769 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!26 (array!2435 array!2437 (_ BitVec 32) (_ BitVec 32) V!1973 V!1973 (_ BitVec 32) Int) ListLongMap!923)

(assert (=> bm!2769 (= call!2772 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun bm!2770 () Bool)

(declare-fun call!2777 () ListLongMap!923)

(declare-fun call!2778 () ListLongMap!923)

(assert (=> bm!2770 (= call!2777 call!2778)))

(declare-fun b!35213 () Bool)

(declare-fun res!21403 () Bool)

(declare-fun e!22259 () Bool)

(assert (=> b!35213 (=> (not res!21403) (not e!22259))))

(declare-fun e!22251 () Bool)

(assert (=> b!35213 (= res!21403 e!22251)))

(declare-fun c!3989 () Bool)

(assert (=> b!35213 (= c!3989 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!2771 () Bool)

(declare-fun call!2776 () ListLongMap!923)

(declare-fun call!2775 () ListLongMap!923)

(assert (=> bm!2771 (= call!2776 call!2775)))

(declare-fun b!35214 () Bool)

(declare-fun e!22255 () Bool)

(declare-fun e!22250 () Bool)

(assert (=> b!35214 (= e!22255 e!22250)))

(declare-fun res!21408 () Bool)

(declare-fun call!2773 () Bool)

(assert (=> b!35214 (= res!21408 call!2773)))

(assert (=> b!35214 (=> (not res!21408) (not e!22250))))

(declare-fun b!35215 () Bool)

(declare-fun e!22254 () ListLongMap!923)

(declare-fun e!22260 () ListLongMap!923)

(assert (=> b!35215 (= e!22254 e!22260)))

(declare-fun c!3993 () Bool)

(assert (=> b!35215 (= c!3993 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!5293 () Bool)

(assert (=> d!5293 e!22259))

(declare-fun res!21407 () Bool)

(assert (=> d!5293 (=> (not res!21407) (not e!22259))))

(assert (=> d!5293 (= res!21407 (or (bvsge #b00000000000000000000000000000000 (size!1266 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1266 _keys!1833)))))))

(declare-fun lt!12929 () ListLongMap!923)

(declare-fun lt!12945 () ListLongMap!923)

(assert (=> d!5293 (= lt!12929 lt!12945)))

(declare-fun lt!12936 () Unit!777)

(declare-fun e!22253 () Unit!777)

(assert (=> d!5293 (= lt!12936 e!22253)))

(declare-fun c!3992 () Bool)

(declare-fun e!22261 () Bool)

(assert (=> d!5293 (= c!3992 e!22261)))

(declare-fun res!21406 () Bool)

(assert (=> d!5293 (=> (not res!21406) (not e!22261))))

(assert (=> d!5293 (= res!21406 (bvslt #b00000000000000000000000000000000 (size!1266 _keys!1833)))))

(assert (=> d!5293 (= lt!12945 e!22254)))

(declare-fun c!3991 () Bool)

(assert (=> d!5293 (= c!3991 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5293 (validMask!0 mask!2294)))

(assert (=> d!5293 (= (getCurrentListMap!301 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12929)))

(declare-fun b!35216 () Bool)

(assert (=> b!35216 (= e!22260 call!2776)))

(declare-fun b!35217 () Bool)

(assert (=> b!35217 (= e!22255 (not call!2773))))

(declare-fun b!35218 () Bool)

(declare-fun +!57 (ListLongMap!923 tuple2!1346) ListLongMap!923)

(assert (=> b!35218 (= e!22254 (+!57 call!2775 (tuple2!1347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun bm!2772 () Bool)

(assert (=> bm!2772 (= call!2775 (+!57 (ite c!3991 call!2772 (ite c!3993 call!2778 call!2777)) (ite (or c!3991 c!3993) (tuple2!1347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!35219 () Bool)

(assert (=> b!35219 (= e!22261 (validKeyInArray!0 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35220 () Bool)

(declare-fun e!22257 () Bool)

(assert (=> b!35220 (= e!22251 e!22257)))

(declare-fun res!21401 () Bool)

(declare-fun call!2774 () Bool)

(assert (=> b!35220 (= res!21401 call!2774)))

(assert (=> b!35220 (=> (not res!21401) (not e!22257))))

(declare-fun b!35221 () Bool)

(declare-fun e!22252 () Bool)

(declare-fun e!22258 () Bool)

(assert (=> b!35221 (= e!22252 e!22258)))

(declare-fun res!21405 () Bool)

(assert (=> b!35221 (=> (not res!21405) (not e!22258))))

(assert (=> b!35221 (= res!21405 (contains!423 lt!12929 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1266 _keys!1833)))))

(declare-fun bm!2773 () Bool)

(assert (=> bm!2773 (= call!2778 call!2772)))

(declare-fun b!35222 () Bool)

(declare-fun apply!39 (ListLongMap!923 (_ BitVec 64)) V!1973)

(assert (=> b!35222 (= e!22250 (= (apply!39 lt!12929 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun bm!2774 () Bool)

(assert (=> bm!2774 (= call!2774 (contains!423 lt!12929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35223 () Bool)

(assert (=> b!35223 (= e!22251 (not call!2774))))

(declare-fun b!35224 () Bool)

(declare-fun e!22256 () ListLongMap!923)

(assert (=> b!35224 (= e!22256 call!2777)))

(declare-fun b!35225 () Bool)

(declare-fun Unit!780 () Unit!777)

(assert (=> b!35225 (= e!22253 Unit!780)))

(declare-fun b!35226 () Bool)

(declare-fun e!22249 () Bool)

(assert (=> b!35226 (= e!22249 (validKeyInArray!0 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35227 () Bool)

(declare-fun c!3990 () Bool)

(assert (=> b!35227 (= c!3990 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!35227 (= e!22260 e!22256)))

(declare-fun b!35228 () Bool)

(assert (=> b!35228 (= e!22257 (= (apply!39 lt!12929 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!35229 () Bool)

(assert (=> b!35229 (= e!22256 call!2776)))

(declare-fun b!35230 () Bool)

(declare-fun get!600 (ValueCell!606 V!1973) V!1973)

(declare-fun dynLambda!156 (Int (_ BitVec 64)) V!1973)

(assert (=> b!35230 (= e!22258 (= (apply!39 lt!12929 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000)) (get!600 (select (arr!1166 _values!1501) #b00000000000000000000000000000000) (dynLambda!156 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35230 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1267 _values!1501)))))

(assert (=> b!35230 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1266 _keys!1833)))))

(declare-fun b!35231 () Bool)

(declare-fun res!21402 () Bool)

(assert (=> b!35231 (=> (not res!21402) (not e!22259))))

(assert (=> b!35231 (= res!21402 e!22252)))

(declare-fun res!21404 () Bool)

(assert (=> b!35231 (=> res!21404 e!22252)))

(assert (=> b!35231 (= res!21404 (not e!22249))))

(declare-fun res!21400 () Bool)

(assert (=> b!35231 (=> (not res!21400) (not e!22249))))

(assert (=> b!35231 (= res!21400 (bvslt #b00000000000000000000000000000000 (size!1266 _keys!1833)))))

(declare-fun b!35232 () Bool)

(declare-fun lt!12937 () Unit!777)

(assert (=> b!35232 (= e!22253 lt!12937)))

(declare-fun lt!12930 () ListLongMap!923)

(assert (=> b!35232 (= lt!12930 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12928 () (_ BitVec 64))

(assert (=> b!35232 (= lt!12928 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12927 () (_ BitVec 64))

(assert (=> b!35232 (= lt!12927 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12941 () Unit!777)

(declare-fun addStillContains!24 (ListLongMap!923 (_ BitVec 64) V!1973 (_ BitVec 64)) Unit!777)

(assert (=> b!35232 (= lt!12941 (addStillContains!24 lt!12930 lt!12928 zeroValue!1443 lt!12927))))

(assert (=> b!35232 (contains!423 (+!57 lt!12930 (tuple2!1347 lt!12928 zeroValue!1443)) lt!12927)))

(declare-fun lt!12934 () Unit!777)

(assert (=> b!35232 (= lt!12934 lt!12941)))

(declare-fun lt!12939 () ListLongMap!923)

(assert (=> b!35232 (= lt!12939 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12943 () (_ BitVec 64))

(assert (=> b!35232 (= lt!12943 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12925 () (_ BitVec 64))

(assert (=> b!35232 (= lt!12925 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12942 () Unit!777)

(declare-fun addApplyDifferent!24 (ListLongMap!923 (_ BitVec 64) V!1973 (_ BitVec 64)) Unit!777)

(assert (=> b!35232 (= lt!12942 (addApplyDifferent!24 lt!12939 lt!12943 minValue!1443 lt!12925))))

(assert (=> b!35232 (= (apply!39 (+!57 lt!12939 (tuple2!1347 lt!12943 minValue!1443)) lt!12925) (apply!39 lt!12939 lt!12925))))

(declare-fun lt!12933 () Unit!777)

(assert (=> b!35232 (= lt!12933 lt!12942)))

(declare-fun lt!12935 () ListLongMap!923)

(assert (=> b!35232 (= lt!12935 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12944 () (_ BitVec 64))

(assert (=> b!35232 (= lt!12944 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12940 () (_ BitVec 64))

(assert (=> b!35232 (= lt!12940 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12924 () Unit!777)

(assert (=> b!35232 (= lt!12924 (addApplyDifferent!24 lt!12935 lt!12944 zeroValue!1443 lt!12940))))

(assert (=> b!35232 (= (apply!39 (+!57 lt!12935 (tuple2!1347 lt!12944 zeroValue!1443)) lt!12940) (apply!39 lt!12935 lt!12940))))

(declare-fun lt!12931 () Unit!777)

(assert (=> b!35232 (= lt!12931 lt!12924)))

(declare-fun lt!12932 () ListLongMap!923)

(assert (=> b!35232 (= lt!12932 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12926 () (_ BitVec 64))

(assert (=> b!35232 (= lt!12926 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12938 () (_ BitVec 64))

(assert (=> b!35232 (= lt!12938 (select (arr!1165 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35232 (= lt!12937 (addApplyDifferent!24 lt!12932 lt!12926 minValue!1443 lt!12938))))

(assert (=> b!35232 (= (apply!39 (+!57 lt!12932 (tuple2!1347 lt!12926 minValue!1443)) lt!12938) (apply!39 lt!12932 lt!12938))))

(declare-fun b!35233 () Bool)

(assert (=> b!35233 (= e!22259 e!22255)))

(declare-fun c!3994 () Bool)

(assert (=> b!35233 (= c!3994 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2775 () Bool)

(assert (=> bm!2775 (= call!2773 (contains!423 lt!12929 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!5293 c!3991) b!35218))

(assert (= (and d!5293 (not c!3991)) b!35215))

(assert (= (and b!35215 c!3993) b!35216))

(assert (= (and b!35215 (not c!3993)) b!35227))

(assert (= (and b!35227 c!3990) b!35229))

(assert (= (and b!35227 (not c!3990)) b!35224))

(assert (= (or b!35229 b!35224) bm!2770))

(assert (= (or b!35216 bm!2770) bm!2773))

(assert (= (or b!35216 b!35229) bm!2771))

(assert (= (or b!35218 bm!2773) bm!2769))

(assert (= (or b!35218 bm!2771) bm!2772))

(assert (= (and d!5293 res!21406) b!35219))

(assert (= (and d!5293 c!3992) b!35232))

(assert (= (and d!5293 (not c!3992)) b!35225))

(assert (= (and d!5293 res!21407) b!35231))

(assert (= (and b!35231 res!21400) b!35226))

(assert (= (and b!35231 (not res!21404)) b!35221))

(assert (= (and b!35221 res!21405) b!35230))

(assert (= (and b!35231 res!21402) b!35213))

(assert (= (and b!35213 c!3989) b!35220))

(assert (= (and b!35213 (not c!3989)) b!35223))

(assert (= (and b!35220 res!21401) b!35228))

(assert (= (or b!35220 b!35223) bm!2774))

(assert (= (and b!35213 res!21403) b!35233))

(assert (= (and b!35233 c!3994) b!35214))

(assert (= (and b!35233 (not c!3994)) b!35217))

(assert (= (and b!35214 res!21408) b!35222))

(assert (= (or b!35214 b!35217) bm!2775))

(declare-fun b_lambda!1719 () Bool)

(assert (=> (not b_lambda!1719) (not b!35230)))

(declare-fun t!3646 () Bool)

(declare-fun tb!693 () Bool)

(assert (=> (and start!4496 (= defaultEntry!1504 defaultEntry!1504) t!3646) tb!693))

(declare-fun result!1189 () Bool)

(assert (=> tb!693 (= result!1189 tp_is_empty!1611)))

(assert (=> b!35230 t!3646))

(declare-fun b_and!2083 () Bool)

(assert (= b_and!2079 (and (=> t!3646 result!1189) b_and!2083)))

(declare-fun m!28311 () Bool)

(assert (=> bm!2772 m!28311))

(assert (=> b!35219 m!28275))

(assert (=> b!35219 m!28275))

(assert (=> b!35219 m!28289))

(declare-fun m!28313 () Bool)

(assert (=> b!35232 m!28313))

(declare-fun m!28315 () Bool)

(assert (=> b!35232 m!28315))

(declare-fun m!28317 () Bool)

(assert (=> b!35232 m!28317))

(declare-fun m!28319 () Bool)

(assert (=> b!35232 m!28319))

(declare-fun m!28321 () Bool)

(assert (=> b!35232 m!28321))

(declare-fun m!28323 () Bool)

(assert (=> b!35232 m!28323))

(declare-fun m!28325 () Bool)

(assert (=> b!35232 m!28325))

(declare-fun m!28327 () Bool)

(assert (=> b!35232 m!28327))

(assert (=> b!35232 m!28275))

(assert (=> b!35232 m!28327))

(declare-fun m!28329 () Bool)

(assert (=> b!35232 m!28329))

(assert (=> b!35232 m!28313))

(declare-fun m!28331 () Bool)

(assert (=> b!35232 m!28331))

(declare-fun m!28333 () Bool)

(assert (=> b!35232 m!28333))

(declare-fun m!28335 () Bool)

(assert (=> b!35232 m!28335))

(declare-fun m!28337 () Bool)

(assert (=> b!35232 m!28337))

(declare-fun m!28339 () Bool)

(assert (=> b!35232 m!28339))

(assert (=> b!35232 m!28325))

(declare-fun m!28341 () Bool)

(assert (=> b!35232 m!28341))

(declare-fun m!28343 () Bool)

(assert (=> b!35232 m!28343))

(assert (=> b!35232 m!28331))

(declare-fun m!28345 () Bool)

(assert (=> bm!2774 m!28345))

(declare-fun m!28347 () Bool)

(assert (=> b!35230 m!28347))

(declare-fun m!28349 () Bool)

(assert (=> b!35230 m!28349))

(declare-fun m!28351 () Bool)

(assert (=> b!35230 m!28351))

(assert (=> b!35230 m!28349))

(assert (=> b!35230 m!28275))

(assert (=> b!35230 m!28347))

(assert (=> b!35230 m!28275))

(declare-fun m!28353 () Bool)

(assert (=> b!35230 m!28353))

(declare-fun m!28355 () Bool)

(assert (=> bm!2775 m!28355))

(assert (=> d!5293 m!28231))

(assert (=> bm!2769 m!28335))

(declare-fun m!28357 () Bool)

(assert (=> b!35228 m!28357))

(assert (=> b!35221 m!28275))

(assert (=> b!35221 m!28275))

(declare-fun m!28359 () Bool)

(assert (=> b!35221 m!28359))

(declare-fun m!28361 () Bool)

(assert (=> b!35218 m!28361))

(declare-fun m!28363 () Bool)

(assert (=> b!35222 m!28363))

(assert (=> b!35226 m!28275))

(assert (=> b!35226 m!28275))

(assert (=> b!35226 m!28289))

(assert (=> b!35078 d!5293))

(declare-fun mapNonEmpty!1969 () Bool)

(declare-fun mapRes!1969 () Bool)

(declare-fun tp!5218 () Bool)

(declare-fun e!22266 () Bool)

(assert (=> mapNonEmpty!1969 (= mapRes!1969 (and tp!5218 e!22266))))

(declare-fun mapValue!1969 () ValueCell!606)

(declare-fun mapKey!1969 () (_ BitVec 32))

(declare-fun mapRest!1969 () (Array (_ BitVec 32) ValueCell!606))

(assert (=> mapNonEmpty!1969 (= mapRest!1963 (store mapRest!1969 mapKey!1969 mapValue!1969))))

(declare-fun condMapEmpty!1969 () Bool)

(declare-fun mapDefault!1969 () ValueCell!606)

(assert (=> mapNonEmpty!1963 (= condMapEmpty!1969 (= mapRest!1963 ((as const (Array (_ BitVec 32) ValueCell!606)) mapDefault!1969)))))

(declare-fun e!22267 () Bool)

(assert (=> mapNonEmpty!1963 (= tp!5209 (and e!22267 mapRes!1969))))

(declare-fun mapIsEmpty!1969 () Bool)

(assert (=> mapIsEmpty!1969 mapRes!1969))

(declare-fun b!35242 () Bool)

(assert (=> b!35242 (= e!22266 tp_is_empty!1611)))

(declare-fun b!35243 () Bool)

(assert (=> b!35243 (= e!22267 tp_is_empty!1611)))

(assert (= (and mapNonEmpty!1963 condMapEmpty!1969) mapIsEmpty!1969))

(assert (= (and mapNonEmpty!1963 (not condMapEmpty!1969)) mapNonEmpty!1969))

(assert (= (and mapNonEmpty!1969 ((_ is ValueCellFull!606) mapValue!1969)) b!35242))

(assert (= (and mapNonEmpty!1963 ((_ is ValueCellFull!606) mapDefault!1969)) b!35243))

(declare-fun m!28365 () Bool)

(assert (=> mapNonEmpty!1969 m!28365))

(declare-fun b_lambda!1721 () Bool)

(assert (= b_lambda!1719 (or (and start!4496 b_free!1257) b_lambda!1721)))

(check-sat (not b!35132) (not b!35161) (not d!5293) (not b!35232) (not bm!2751) (not d!5291) (not b!35170) (not bm!2769) b_and!2083 (not b!35116) (not b!35222) (not b_lambda!1721) (not d!5279) (not b!35160) (not b_next!1257) (not b!35221) (not b!35168) (not b!35218) (not b!35147) (not bm!2754) (not b!35148) (not bm!2775) (not b!35228) (not b!35149) (not b!35219) (not b!35226) (not bm!2772) (not b!35230) tp_is_empty!1611 (not bm!2774) (not mapNonEmpty!1969))
(check-sat b_and!2083 (not b_next!1257))
