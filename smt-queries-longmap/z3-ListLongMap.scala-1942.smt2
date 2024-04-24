; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34332 () Bool)

(assert start!34332)

(declare-fun b_free!7321 () Bool)

(declare-fun b_next!7321 () Bool)

(assert (=> start!34332 (= b_free!7321 (not b_next!7321))))

(declare-fun tp!25503 () Bool)

(declare-fun b_and!14539 () Bool)

(assert (=> start!34332 (= tp!25503 b_and!14539)))

(declare-fun b!342970 () Bool)

(declare-fun res!189630 () Bool)

(declare-fun e!210305 () Bool)

(assert (=> b!342970 (=> (not res!189630) (not e!210305))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10675 0))(
  ( (V!10676 (val!3681 Int)) )
))
(declare-fun zeroValue!1467 () V!10675)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3293 0))(
  ( (ValueCellFull!3293 (v!5856 V!10675)) (EmptyCell!3293) )
))
(declare-datatypes ((array!18132 0))(
  ( (array!18133 (arr!8584 (Array (_ BitVec 32) ValueCell!3293)) (size!8936 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18132)

(declare-datatypes ((array!18134 0))(
  ( (array!18135 (arr!8585 (Array (_ BitVec 32) (_ BitVec 64))) (size!8937 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18134)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10675)

(declare-datatypes ((tuple2!5252 0))(
  ( (tuple2!5253 (_1!2637 (_ BitVec 64)) (_2!2637 V!10675)) )
))
(declare-datatypes ((List!4854 0))(
  ( (Nil!4851) (Cons!4850 (h!5706 tuple2!5252) (t!9958 List!4854)) )
))
(declare-datatypes ((ListLongMap!4167 0))(
  ( (ListLongMap!4168 (toList!2099 List!4854)) )
))
(declare-fun contains!2174 (ListLongMap!4167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1628 (array!18134 array!18132 (_ BitVec 32) (_ BitVec 32) V!10675 V!10675 (_ BitVec 32) Int) ListLongMap!4167)

(assert (=> b!342970 (= res!189630 (not (contains!2174 (getCurrentListMap!1628 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12342 () Bool)

(declare-fun mapRes!12342 () Bool)

(declare-fun tp!25502 () Bool)

(declare-fun e!210298 () Bool)

(assert (=> mapNonEmpty!12342 (= mapRes!12342 (and tp!25502 e!210298))))

(declare-fun mapKey!12342 () (_ BitVec 32))

(declare-fun mapValue!12342 () ValueCell!3293)

(declare-fun mapRest!12342 () (Array (_ BitVec 32) ValueCell!3293))

(assert (=> mapNonEmpty!12342 (= (arr!8584 _values!1525) (store mapRest!12342 mapKey!12342 mapValue!12342))))

(declare-fun b!342971 () Bool)

(declare-fun res!189633 () Bool)

(assert (=> b!342971 (=> (not res!189633) (not e!210305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342971 (= res!189633 (validKeyInArray!0 k0!1348))))

(declare-fun b!342972 () Bool)

(declare-fun res!189635 () Bool)

(assert (=> b!342972 (=> (not res!189635) (not e!210305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18134 (_ BitVec 32)) Bool)

(assert (=> b!342972 (= res!189635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342973 () Bool)

(declare-fun res!189634 () Bool)

(assert (=> b!342973 (=> (not res!189634) (not e!210305))))

(declare-datatypes ((List!4855 0))(
  ( (Nil!4852) (Cons!4851 (h!5707 (_ BitVec 64)) (t!9959 List!4855)) )
))
(declare-fun arrayNoDuplicates!0 (array!18134 (_ BitVec 32) List!4855) Bool)

(assert (=> b!342973 (= res!189634 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4852))))

(declare-fun b!342974 () Bool)

(declare-fun e!210299 () Bool)

(declare-fun tp_is_empty!7273 () Bool)

(assert (=> b!342974 (= e!210299 tp_is_empty!7273)))

(declare-fun b!342975 () Bool)

(declare-datatypes ((Unit!10674 0))(
  ( (Unit!10675) )
))
(declare-fun e!210303 () Unit!10674)

(declare-fun Unit!10676 () Unit!10674)

(assert (=> b!342975 (= e!210303 Unit!10676)))

(declare-fun b!342976 () Bool)

(declare-fun e!210302 () Bool)

(declare-fun e!210300 () Bool)

(assert (=> b!342976 (= e!210302 e!210300)))

(declare-fun res!189628 () Bool)

(assert (=> b!342976 (=> (not res!189628) (not e!210300))))

(declare-fun lt!162325 () Bool)

(assert (=> b!342976 (= res!189628 (not lt!162325))))

(declare-fun lt!162322 () Unit!10674)

(assert (=> b!342976 (= lt!162322 e!210303)))

(declare-fun c!52838 () Bool)

(assert (=> b!342976 (= c!52838 lt!162325)))

(declare-fun arrayContainsKey!0 (array!18134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342976 (= lt!162325 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342977 () Bool)

(declare-fun res!189632 () Bool)

(assert (=> b!342977 (=> (not res!189632) (not e!210300))))

(declare-datatypes ((SeekEntryResult!3263 0))(
  ( (MissingZero!3263 (index!15231 (_ BitVec 32))) (Found!3263 (index!15232 (_ BitVec 32))) (Intermediate!3263 (undefined!4075 Bool) (index!15233 (_ BitVec 32)) (x!34098 (_ BitVec 32))) (Undefined!3263) (MissingVacant!3263 (index!15234 (_ BitVec 32))) )
))
(declare-fun lt!162323 () SeekEntryResult!3263)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!342977 (= res!189632 (inRange!0 (index!15234 lt!162323) mask!2385))))

(declare-fun res!189631 () Bool)

(assert (=> start!34332 (=> (not res!189631) (not e!210305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34332 (= res!189631 (validMask!0 mask!2385))))

(assert (=> start!34332 e!210305))

(assert (=> start!34332 true))

(assert (=> start!34332 tp_is_empty!7273))

(assert (=> start!34332 tp!25503))

(declare-fun e!210304 () Bool)

(declare-fun array_inv!6348 (array!18132) Bool)

(assert (=> start!34332 (and (array_inv!6348 _values!1525) e!210304)))

(declare-fun array_inv!6349 (array!18134) Bool)

(assert (=> start!34332 (array_inv!6349 _keys!1895)))

(declare-fun b!342978 () Bool)

(assert (=> b!342978 (= e!210298 tp_is_empty!7273)))

(declare-fun b!342979 () Bool)

(declare-fun res!189627 () Bool)

(assert (=> b!342979 (=> (not res!189627) (not e!210305))))

(assert (=> b!342979 (= res!189627 (and (= (size!8936 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8937 _keys!1895) (size!8936 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342980 () Bool)

(declare-fun Unit!10677 () Unit!10674)

(assert (=> b!342980 (= e!210303 Unit!10677)))

(declare-fun lt!162324 () Unit!10674)

(declare-fun lemmaArrayContainsKeyThenInListMap!319 (array!18134 array!18132 (_ BitVec 32) (_ BitVec 32) V!10675 V!10675 (_ BitVec 64) (_ BitVec 32) Int) Unit!10674)

(declare-fun arrayScanForKey!0 (array!18134 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342980 (= lt!162324 (lemmaArrayContainsKeyThenInListMap!319 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342980 false))

(declare-fun b!342981 () Bool)

(assert (=> b!342981 (= e!210304 (and e!210299 mapRes!12342))))

(declare-fun condMapEmpty!12342 () Bool)

(declare-fun mapDefault!12342 () ValueCell!3293)

(assert (=> b!342981 (= condMapEmpty!12342 (= (arr!8584 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3293)) mapDefault!12342)))))

(declare-fun b!342982 () Bool)

(assert (=> b!342982 (= e!210300 (and (= (select (arr!8585 _keys!1895) (index!15234 lt!162323)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!8937 _keys!1895))))))

(declare-fun mapIsEmpty!12342 () Bool)

(assert (=> mapIsEmpty!12342 mapRes!12342))

(declare-fun b!342983 () Bool)

(assert (=> b!342983 (= e!210305 e!210302)))

(declare-fun res!189629 () Bool)

(assert (=> b!342983 (=> (not res!189629) (not e!210302))))

(get-info :version)

(assert (=> b!342983 (= res!189629 (and (not ((_ is Found!3263) lt!162323)) (not ((_ is MissingZero!3263) lt!162323)) ((_ is MissingVacant!3263) lt!162323)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18134 (_ BitVec 32)) SeekEntryResult!3263)

(assert (=> b!342983 (= lt!162323 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34332 res!189631) b!342979))

(assert (= (and b!342979 res!189627) b!342972))

(assert (= (and b!342972 res!189635) b!342973))

(assert (= (and b!342973 res!189634) b!342971))

(assert (= (and b!342971 res!189633) b!342970))

(assert (= (and b!342970 res!189630) b!342983))

(assert (= (and b!342983 res!189629) b!342976))

(assert (= (and b!342976 c!52838) b!342980))

(assert (= (and b!342976 (not c!52838)) b!342975))

(assert (= (and b!342976 res!189628) b!342977))

(assert (= (and b!342977 res!189632) b!342982))

(assert (= (and b!342981 condMapEmpty!12342) mapIsEmpty!12342))

(assert (= (and b!342981 (not condMapEmpty!12342)) mapNonEmpty!12342))

(assert (= (and mapNonEmpty!12342 ((_ is ValueCellFull!3293) mapValue!12342)) b!342978))

(assert (= (and b!342981 ((_ is ValueCellFull!3293) mapDefault!12342)) b!342974))

(assert (= start!34332 b!342981))

(declare-fun m!345237 () Bool)

(assert (=> b!342977 m!345237))

(declare-fun m!345239 () Bool)

(assert (=> b!342971 m!345239))

(declare-fun m!345241 () Bool)

(assert (=> b!342982 m!345241))

(declare-fun m!345243 () Bool)

(assert (=> start!34332 m!345243))

(declare-fun m!345245 () Bool)

(assert (=> start!34332 m!345245))

(declare-fun m!345247 () Bool)

(assert (=> start!34332 m!345247))

(declare-fun m!345249 () Bool)

(assert (=> b!342972 m!345249))

(declare-fun m!345251 () Bool)

(assert (=> b!342970 m!345251))

(assert (=> b!342970 m!345251))

(declare-fun m!345253 () Bool)

(assert (=> b!342970 m!345253))

(declare-fun m!345255 () Bool)

(assert (=> b!342983 m!345255))

(declare-fun m!345257 () Bool)

(assert (=> b!342976 m!345257))

(declare-fun m!345259 () Bool)

(assert (=> b!342973 m!345259))

(declare-fun m!345261 () Bool)

(assert (=> b!342980 m!345261))

(assert (=> b!342980 m!345261))

(declare-fun m!345263 () Bool)

(assert (=> b!342980 m!345263))

(declare-fun m!345265 () Bool)

(assert (=> mapNonEmpty!12342 m!345265))

(check-sat (not b!342973) (not b!342971) tp_is_empty!7273 (not b!342970) (not b_next!7321) (not b!342972) (not b!342980) (not b!342976) (not start!34332) (not mapNonEmpty!12342) b_and!14539 (not b!342977) (not b!342983))
(check-sat b_and!14539 (not b_next!7321))
(get-model)

(declare-fun d!71051 () Bool)

(declare-fun res!189695 () Bool)

(declare-fun e!210361 () Bool)

(assert (=> d!71051 (=> res!189695 e!210361)))

(assert (=> d!71051 (= res!189695 (bvsge #b00000000000000000000000000000000 (size!8937 _keys!1895)))))

(assert (=> d!71051 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!210361)))

(declare-fun b!343076 () Bool)

(declare-fun e!210360 () Bool)

(declare-fun call!26609 () Bool)

(assert (=> b!343076 (= e!210360 call!26609)))

(declare-fun b!343077 () Bool)

(declare-fun e!210362 () Bool)

(assert (=> b!343077 (= e!210360 e!210362)))

(declare-fun lt!162357 () (_ BitVec 64))

(assert (=> b!343077 (= lt!162357 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162356 () Unit!10674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18134 (_ BitVec 64) (_ BitVec 32)) Unit!10674)

(assert (=> b!343077 (= lt!162356 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162357 #b00000000000000000000000000000000))))

(assert (=> b!343077 (arrayContainsKey!0 _keys!1895 lt!162357 #b00000000000000000000000000000000)))

(declare-fun lt!162358 () Unit!10674)

(assert (=> b!343077 (= lt!162358 lt!162356)))

(declare-fun res!189694 () Bool)

(assert (=> b!343077 (= res!189694 (= (seekEntryOrOpen!0 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3263 #b00000000000000000000000000000000)))))

(assert (=> b!343077 (=> (not res!189694) (not e!210362))))

(declare-fun b!343078 () Bool)

(assert (=> b!343078 (= e!210361 e!210360)))

(declare-fun c!52847 () Bool)

(assert (=> b!343078 (= c!52847 (validKeyInArray!0 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343079 () Bool)

(assert (=> b!343079 (= e!210362 call!26609)))

(declare-fun bm!26606 () Bool)

(assert (=> bm!26606 (= call!26609 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!71051 (not res!189695)) b!343078))

(assert (= (and b!343078 c!52847) b!343077))

(assert (= (and b!343078 (not c!52847)) b!343076))

(assert (= (and b!343077 res!189694) b!343079))

(assert (= (or b!343079 b!343076) bm!26606))

(declare-fun m!345327 () Bool)

(assert (=> b!343077 m!345327))

(declare-fun m!345329 () Bool)

(assert (=> b!343077 m!345329))

(declare-fun m!345331 () Bool)

(assert (=> b!343077 m!345331))

(assert (=> b!343077 m!345327))

(declare-fun m!345333 () Bool)

(assert (=> b!343077 m!345333))

(assert (=> b!343078 m!345327))

(assert (=> b!343078 m!345327))

(declare-fun m!345335 () Bool)

(assert (=> b!343078 m!345335))

(declare-fun m!345337 () Bool)

(assert (=> bm!26606 m!345337))

(assert (=> b!342972 d!71051))

(declare-fun d!71053 () Bool)

(assert (=> d!71053 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34332 d!71053))

(declare-fun d!71055 () Bool)

(assert (=> d!71055 (= (array_inv!6348 _values!1525) (bvsge (size!8936 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34332 d!71055))

(declare-fun d!71057 () Bool)

(assert (=> d!71057 (= (array_inv!6349 _keys!1895) (bvsge (size!8937 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34332 d!71057))

(declare-fun d!71059 () Bool)

(assert (=> d!71059 (= (inRange!0 (index!15234 lt!162323) mask!2385) (and (bvsge (index!15234 lt!162323) #b00000000000000000000000000000000) (bvslt (index!15234 lt!162323) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!342977 d!71059))

(declare-fun b!343092 () Bool)

(declare-fun e!210369 () SeekEntryResult!3263)

(declare-fun lt!162365 () SeekEntryResult!3263)

(assert (=> b!343092 (= e!210369 (Found!3263 (index!15233 lt!162365)))))

(declare-fun e!210370 () SeekEntryResult!3263)

(declare-fun b!343093 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18134 (_ BitVec 32)) SeekEntryResult!3263)

(assert (=> b!343093 (= e!210370 (seekKeyOrZeroReturnVacant!0 (x!34098 lt!162365) (index!15233 lt!162365) (index!15233 lt!162365) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343095 () Bool)

(declare-fun c!52855 () Bool)

(declare-fun lt!162367 () (_ BitVec 64))

(assert (=> b!343095 (= c!52855 (= lt!162367 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!343095 (= e!210369 e!210370)))

(declare-fun b!343096 () Bool)

(declare-fun e!210371 () SeekEntryResult!3263)

(assert (=> b!343096 (= e!210371 Undefined!3263)))

(declare-fun b!343097 () Bool)

(assert (=> b!343097 (= e!210370 (MissingZero!3263 (index!15233 lt!162365)))))

(declare-fun b!343094 () Bool)

(assert (=> b!343094 (= e!210371 e!210369)))

(assert (=> b!343094 (= lt!162367 (select (arr!8585 _keys!1895) (index!15233 lt!162365)))))

(declare-fun c!52854 () Bool)

(assert (=> b!343094 (= c!52854 (= lt!162367 k0!1348))))

(declare-fun d!71061 () Bool)

(declare-fun lt!162366 () SeekEntryResult!3263)

(assert (=> d!71061 (and (or ((_ is Undefined!3263) lt!162366) (not ((_ is Found!3263) lt!162366)) (and (bvsge (index!15232 lt!162366) #b00000000000000000000000000000000) (bvslt (index!15232 lt!162366) (size!8937 _keys!1895)))) (or ((_ is Undefined!3263) lt!162366) ((_ is Found!3263) lt!162366) (not ((_ is MissingZero!3263) lt!162366)) (and (bvsge (index!15231 lt!162366) #b00000000000000000000000000000000) (bvslt (index!15231 lt!162366) (size!8937 _keys!1895)))) (or ((_ is Undefined!3263) lt!162366) ((_ is Found!3263) lt!162366) ((_ is MissingZero!3263) lt!162366) (not ((_ is MissingVacant!3263) lt!162366)) (and (bvsge (index!15234 lt!162366) #b00000000000000000000000000000000) (bvslt (index!15234 lt!162366) (size!8937 _keys!1895)))) (or ((_ is Undefined!3263) lt!162366) (ite ((_ is Found!3263) lt!162366) (= (select (arr!8585 _keys!1895) (index!15232 lt!162366)) k0!1348) (ite ((_ is MissingZero!3263) lt!162366) (= (select (arr!8585 _keys!1895) (index!15231 lt!162366)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3263) lt!162366) (= (select (arr!8585 _keys!1895) (index!15234 lt!162366)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71061 (= lt!162366 e!210371)))

(declare-fun c!52856 () Bool)

(assert (=> d!71061 (= c!52856 (and ((_ is Intermediate!3263) lt!162365) (undefined!4075 lt!162365)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18134 (_ BitVec 32)) SeekEntryResult!3263)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71061 (= lt!162365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71061 (validMask!0 mask!2385)))

(assert (=> d!71061 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162366)))

(assert (= (and d!71061 c!52856) b!343096))

(assert (= (and d!71061 (not c!52856)) b!343094))

(assert (= (and b!343094 c!52854) b!343092))

(assert (= (and b!343094 (not c!52854)) b!343095))

(assert (= (and b!343095 c!52855) b!343097))

(assert (= (and b!343095 (not c!52855)) b!343093))

(declare-fun m!345339 () Bool)

(assert (=> b!343093 m!345339))

(declare-fun m!345341 () Bool)

(assert (=> b!343094 m!345341))

(declare-fun m!345343 () Bool)

(assert (=> d!71061 m!345343))

(declare-fun m!345345 () Bool)

(assert (=> d!71061 m!345345))

(assert (=> d!71061 m!345345))

(declare-fun m!345347 () Bool)

(assert (=> d!71061 m!345347))

(declare-fun m!345349 () Bool)

(assert (=> d!71061 m!345349))

(declare-fun m!345351 () Bool)

(assert (=> d!71061 m!345351))

(assert (=> d!71061 m!345243))

(assert (=> b!342983 d!71061))

(declare-fun b!343108 () Bool)

(declare-fun e!210380 () Bool)

(declare-fun e!210383 () Bool)

(assert (=> b!343108 (= e!210380 e!210383)))

(declare-fun res!189703 () Bool)

(assert (=> b!343108 (=> (not res!189703) (not e!210383))))

(declare-fun e!210382 () Bool)

(assert (=> b!343108 (= res!189703 (not e!210382))))

(declare-fun res!189704 () Bool)

(assert (=> b!343108 (=> (not res!189704) (not e!210382))))

(assert (=> b!343108 (= res!189704 (validKeyInArray!0 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71063 () Bool)

(declare-fun res!189702 () Bool)

(assert (=> d!71063 (=> res!189702 e!210380)))

(assert (=> d!71063 (= res!189702 (bvsge #b00000000000000000000000000000000 (size!8937 _keys!1895)))))

(assert (=> d!71063 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4852) e!210380)))

(declare-fun b!343109 () Bool)

(declare-fun e!210381 () Bool)

(assert (=> b!343109 (= e!210383 e!210381)))

(declare-fun c!52859 () Bool)

(assert (=> b!343109 (= c!52859 (validKeyInArray!0 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343110 () Bool)

(declare-fun call!26612 () Bool)

(assert (=> b!343110 (= e!210381 call!26612)))

(declare-fun bm!26609 () Bool)

(assert (=> bm!26609 (= call!26612 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52859 (Cons!4851 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000) Nil!4852) Nil!4852)))))

(declare-fun b!343111 () Bool)

(declare-fun contains!2177 (List!4855 (_ BitVec 64)) Bool)

(assert (=> b!343111 (= e!210382 (contains!2177 Nil!4852 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343112 () Bool)

(assert (=> b!343112 (= e!210381 call!26612)))

(assert (= (and d!71063 (not res!189702)) b!343108))

(assert (= (and b!343108 res!189704) b!343111))

(assert (= (and b!343108 res!189703) b!343109))

(assert (= (and b!343109 c!52859) b!343110))

(assert (= (and b!343109 (not c!52859)) b!343112))

(assert (= (or b!343110 b!343112) bm!26609))

(assert (=> b!343108 m!345327))

(assert (=> b!343108 m!345327))

(assert (=> b!343108 m!345335))

(assert (=> b!343109 m!345327))

(assert (=> b!343109 m!345327))

(assert (=> b!343109 m!345335))

(assert (=> bm!26609 m!345327))

(declare-fun m!345353 () Bool)

(assert (=> bm!26609 m!345353))

(assert (=> b!343111 m!345327))

(assert (=> b!343111 m!345327))

(declare-fun m!345355 () Bool)

(assert (=> b!343111 m!345355))

(assert (=> b!342973 d!71063))

(declare-fun d!71065 () Bool)

(assert (=> d!71065 (contains!2174 (getCurrentListMap!1628 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!162370 () Unit!10674)

(declare-fun choose!1311 (array!18134 array!18132 (_ BitVec 32) (_ BitVec 32) V!10675 V!10675 (_ BitVec 64) (_ BitVec 32) Int) Unit!10674)

(assert (=> d!71065 (= lt!162370 (choose!1311 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71065 (validMask!0 mask!2385)))

(assert (=> d!71065 (= (lemmaArrayContainsKeyThenInListMap!319 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!162370)))

(declare-fun bs!11778 () Bool)

(assert (= bs!11778 d!71065))

(assert (=> bs!11778 m!345251))

(assert (=> bs!11778 m!345251))

(assert (=> bs!11778 m!345253))

(assert (=> bs!11778 m!345261))

(declare-fun m!345357 () Bool)

(assert (=> bs!11778 m!345357))

(assert (=> bs!11778 m!345243))

(assert (=> b!342980 d!71065))

(declare-fun d!71067 () Bool)

(declare-fun lt!162373 () (_ BitVec 32))

(assert (=> d!71067 (and (or (bvslt lt!162373 #b00000000000000000000000000000000) (bvsge lt!162373 (size!8937 _keys!1895)) (and (bvsge lt!162373 #b00000000000000000000000000000000) (bvslt lt!162373 (size!8937 _keys!1895)))) (bvsge lt!162373 #b00000000000000000000000000000000) (bvslt lt!162373 (size!8937 _keys!1895)) (= (select (arr!8585 _keys!1895) lt!162373) k0!1348))))

(declare-fun e!210386 () (_ BitVec 32))

(assert (=> d!71067 (= lt!162373 e!210386)))

(declare-fun c!52862 () Bool)

(assert (=> d!71067 (= c!52862 (= (select (arr!8585 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8937 _keys!1895)) (bvslt (size!8937 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71067 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!162373)))

(declare-fun b!343117 () Bool)

(assert (=> b!343117 (= e!210386 #b00000000000000000000000000000000)))

(declare-fun b!343118 () Bool)

(assert (=> b!343118 (= e!210386 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71067 c!52862) b!343117))

(assert (= (and d!71067 (not c!52862)) b!343118))

(declare-fun m!345359 () Bool)

(assert (=> d!71067 m!345359))

(assert (=> d!71067 m!345327))

(declare-fun m!345361 () Bool)

(assert (=> b!343118 m!345361))

(assert (=> b!342980 d!71067))

(declare-fun d!71069 () Bool)

(declare-fun e!210392 () Bool)

(assert (=> d!71069 e!210392))

(declare-fun res!189707 () Bool)

(assert (=> d!71069 (=> res!189707 e!210392)))

(declare-fun lt!162385 () Bool)

(assert (=> d!71069 (= res!189707 (not lt!162385))))

(declare-fun lt!162382 () Bool)

(assert (=> d!71069 (= lt!162385 lt!162382)))

(declare-fun lt!162383 () Unit!10674)

(declare-fun e!210391 () Unit!10674)

(assert (=> d!71069 (= lt!162383 e!210391)))

(declare-fun c!52865 () Bool)

(assert (=> d!71069 (= c!52865 lt!162382)))

(declare-fun containsKey!328 (List!4854 (_ BitVec 64)) Bool)

(assert (=> d!71069 (= lt!162382 (containsKey!328 (toList!2099 (getCurrentListMap!1628 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71069 (= (contains!2174 (getCurrentListMap!1628 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162385)))

(declare-fun b!343125 () Bool)

(declare-fun lt!162384 () Unit!10674)

(assert (=> b!343125 (= e!210391 lt!162384)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!276 (List!4854 (_ BitVec 64)) Unit!10674)

(assert (=> b!343125 (= lt!162384 (lemmaContainsKeyImpliesGetValueByKeyDefined!276 (toList!2099 (getCurrentListMap!1628 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!343 0))(
  ( (Some!342 (v!5859 V!10675)) (None!341) )
))
(declare-fun isDefined!277 (Option!343) Bool)

(declare-fun getValueByKey!337 (List!4854 (_ BitVec 64)) Option!343)

(assert (=> b!343125 (isDefined!277 (getValueByKey!337 (toList!2099 (getCurrentListMap!1628 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!343126 () Bool)

(declare-fun Unit!10684 () Unit!10674)

(assert (=> b!343126 (= e!210391 Unit!10684)))

(declare-fun b!343127 () Bool)

(assert (=> b!343127 (= e!210392 (isDefined!277 (getValueByKey!337 (toList!2099 (getCurrentListMap!1628 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71069 c!52865) b!343125))

(assert (= (and d!71069 (not c!52865)) b!343126))

(assert (= (and d!71069 (not res!189707)) b!343127))

(declare-fun m!345363 () Bool)

(assert (=> d!71069 m!345363))

(declare-fun m!345365 () Bool)

(assert (=> b!343125 m!345365))

(declare-fun m!345367 () Bool)

(assert (=> b!343125 m!345367))

(assert (=> b!343125 m!345367))

(declare-fun m!345369 () Bool)

(assert (=> b!343125 m!345369))

(assert (=> b!343127 m!345367))

(assert (=> b!343127 m!345367))

(assert (=> b!343127 m!345369))

(assert (=> b!342970 d!71069))

(declare-fun bm!26624 () Bool)

(declare-fun call!26627 () ListLongMap!4167)

(declare-fun call!26632 () ListLongMap!4167)

(assert (=> bm!26624 (= call!26627 call!26632)))

(declare-fun b!343171 () Bool)

(declare-fun e!210430 () Bool)

(assert (=> b!343171 (= e!210430 (validKeyInArray!0 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun call!26631 () ListLongMap!4167)

(declare-fun bm!26625 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!594 (array!18134 array!18132 (_ BitVec 32) (_ BitVec 32) V!10675 V!10675 (_ BitVec 32) Int) ListLongMap!4167)

(assert (=> bm!26625 (= call!26631 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!343172 () Bool)

(declare-fun e!210420 () Unit!10674)

(declare-fun lt!162445 () Unit!10674)

(assert (=> b!343172 (= e!210420 lt!162445)))

(declare-fun lt!162438 () ListLongMap!4167)

(assert (=> b!343172 (= lt!162438 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162436 () (_ BitVec 64))

(assert (=> b!343172 (= lt!162436 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162447 () (_ BitVec 64))

(assert (=> b!343172 (= lt!162447 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162430 () Unit!10674)

(declare-fun addStillContains!254 (ListLongMap!4167 (_ BitVec 64) V!10675 (_ BitVec 64)) Unit!10674)

(assert (=> b!343172 (= lt!162430 (addStillContains!254 lt!162438 lt!162436 zeroValue!1467 lt!162447))))

(declare-fun +!729 (ListLongMap!4167 tuple2!5252) ListLongMap!4167)

(assert (=> b!343172 (contains!2174 (+!729 lt!162438 (tuple2!5253 lt!162436 zeroValue!1467)) lt!162447)))

(declare-fun lt!162434 () Unit!10674)

(assert (=> b!343172 (= lt!162434 lt!162430)))

(declare-fun lt!162449 () ListLongMap!4167)

(assert (=> b!343172 (= lt!162449 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162448 () (_ BitVec 64))

(assert (=> b!343172 (= lt!162448 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162451 () (_ BitVec 64))

(assert (=> b!343172 (= lt!162451 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162437 () Unit!10674)

(declare-fun addApplyDifferent!254 (ListLongMap!4167 (_ BitVec 64) V!10675 (_ BitVec 64)) Unit!10674)

(assert (=> b!343172 (= lt!162437 (addApplyDifferent!254 lt!162449 lt!162448 minValue!1467 lt!162451))))

(declare-fun apply!278 (ListLongMap!4167 (_ BitVec 64)) V!10675)

(assert (=> b!343172 (= (apply!278 (+!729 lt!162449 (tuple2!5253 lt!162448 minValue!1467)) lt!162451) (apply!278 lt!162449 lt!162451))))

(declare-fun lt!162439 () Unit!10674)

(assert (=> b!343172 (= lt!162439 lt!162437)))

(declare-fun lt!162441 () ListLongMap!4167)

(assert (=> b!343172 (= lt!162441 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162444 () (_ BitVec 64))

(assert (=> b!343172 (= lt!162444 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162442 () (_ BitVec 64))

(assert (=> b!343172 (= lt!162442 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162432 () Unit!10674)

(assert (=> b!343172 (= lt!162432 (addApplyDifferent!254 lt!162441 lt!162444 zeroValue!1467 lt!162442))))

(assert (=> b!343172 (= (apply!278 (+!729 lt!162441 (tuple2!5253 lt!162444 zeroValue!1467)) lt!162442) (apply!278 lt!162441 lt!162442))))

(declare-fun lt!162446 () Unit!10674)

(assert (=> b!343172 (= lt!162446 lt!162432)))

(declare-fun lt!162440 () ListLongMap!4167)

(assert (=> b!343172 (= lt!162440 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162431 () (_ BitVec 64))

(assert (=> b!343172 (= lt!162431 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162443 () (_ BitVec 64))

(assert (=> b!343172 (= lt!162443 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!343172 (= lt!162445 (addApplyDifferent!254 lt!162440 lt!162431 minValue!1467 lt!162443))))

(assert (=> b!343172 (= (apply!278 (+!729 lt!162440 (tuple2!5253 lt!162431 minValue!1467)) lt!162443) (apply!278 lt!162440 lt!162443))))

(declare-fun b!343173 () Bool)

(declare-fun Unit!10685 () Unit!10674)

(assert (=> b!343173 (= e!210420 Unit!10685)))

(declare-fun b!343174 () Bool)

(declare-fun res!189729 () Bool)

(declare-fun e!210424 () Bool)

(assert (=> b!343174 (=> (not res!189729) (not e!210424))))

(declare-fun e!210425 () Bool)

(assert (=> b!343174 (= res!189729 e!210425)))

(declare-fun c!52882 () Bool)

(assert (=> b!343174 (= c!52882 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!343175 () Bool)

(declare-fun call!26628 () Bool)

(assert (=> b!343175 (= e!210425 (not call!26628))))

(declare-fun b!343176 () Bool)

(declare-fun res!189726 () Bool)

(assert (=> b!343176 (=> (not res!189726) (not e!210424))))

(declare-fun e!210423 () Bool)

(assert (=> b!343176 (= res!189726 e!210423)))

(declare-fun res!189734 () Bool)

(assert (=> b!343176 (=> res!189734 e!210423)))

(assert (=> b!343176 (= res!189734 (not e!210430))))

(declare-fun res!189733 () Bool)

(assert (=> b!343176 (=> (not res!189733) (not e!210430))))

(assert (=> b!343176 (= res!189733 (bvslt #b00000000000000000000000000000000 (size!8937 _keys!1895)))))

(declare-fun c!52878 () Bool)

(declare-fun c!52883 () Bool)

(declare-fun bm!26626 () Bool)

(declare-fun call!26633 () ListLongMap!4167)

(assert (=> bm!26626 (= call!26633 (+!729 (ite c!52878 call!26631 (ite c!52883 call!26632 call!26627)) (ite (or c!52878 c!52883) (tuple2!5253 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5253 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!343177 () Bool)

(declare-fun e!210422 () ListLongMap!4167)

(declare-fun e!210419 () ListLongMap!4167)

(assert (=> b!343177 (= e!210422 e!210419)))

(assert (=> b!343177 (= c!52883 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!343178 () Bool)

(declare-fun e!210429 () Bool)

(assert (=> b!343178 (= e!210425 e!210429)))

(declare-fun res!189728 () Bool)

(assert (=> b!343178 (= res!189728 call!26628)))

(assert (=> b!343178 (=> (not res!189728) (not e!210429))))

(declare-fun b!343179 () Bool)

(declare-fun c!52881 () Bool)

(assert (=> b!343179 (= c!52881 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!210421 () ListLongMap!4167)

(assert (=> b!343179 (= e!210419 e!210421)))

(declare-fun b!343170 () Bool)

(assert (=> b!343170 (= e!210422 (+!729 call!26633 (tuple2!5253 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun d!71071 () Bool)

(assert (=> d!71071 e!210424))

(declare-fun res!189727 () Bool)

(assert (=> d!71071 (=> (not res!189727) (not e!210424))))

(assert (=> d!71071 (= res!189727 (or (bvsge #b00000000000000000000000000000000 (size!8937 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8937 _keys!1895)))))))

(declare-fun lt!162450 () ListLongMap!4167)

(declare-fun lt!162433 () ListLongMap!4167)

(assert (=> d!71071 (= lt!162450 lt!162433)))

(declare-fun lt!162435 () Unit!10674)

(assert (=> d!71071 (= lt!162435 e!210420)))

(declare-fun c!52879 () Bool)

(declare-fun e!210426 () Bool)

(assert (=> d!71071 (= c!52879 e!210426)))

(declare-fun res!189731 () Bool)

(assert (=> d!71071 (=> (not res!189731) (not e!210426))))

(assert (=> d!71071 (= res!189731 (bvslt #b00000000000000000000000000000000 (size!8937 _keys!1895)))))

(assert (=> d!71071 (= lt!162433 e!210422)))

(assert (=> d!71071 (= c!52878 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71071 (validMask!0 mask!2385)))

(assert (=> d!71071 (= (getCurrentListMap!1628 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162450)))

(declare-fun b!343180 () Bool)

(assert (=> b!343180 (= e!210421 call!26627)))

(declare-fun b!343181 () Bool)

(declare-fun e!210431 () Bool)

(assert (=> b!343181 (= e!210424 e!210431)))

(declare-fun c!52880 () Bool)

(assert (=> b!343181 (= c!52880 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!343182 () Bool)

(declare-fun e!210427 () Bool)

(assert (=> b!343182 (= e!210427 (= (apply!278 lt!162450 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!343183 () Bool)

(assert (=> b!343183 (= e!210426 (validKeyInArray!0 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26627 () Bool)

(assert (=> bm!26627 (= call!26632 call!26631)))

(declare-fun bm!26628 () Bool)

(declare-fun call!26630 () ListLongMap!4167)

(assert (=> bm!26628 (= call!26630 call!26633)))

(declare-fun b!343184 () Bool)

(assert (=> b!343184 (= e!210421 call!26630)))

(declare-fun b!343185 () Bool)

(declare-fun call!26629 () Bool)

(assert (=> b!343185 (= e!210431 (not call!26629))))

(declare-fun e!210428 () Bool)

(declare-fun b!343186 () Bool)

(declare-fun get!4654 (ValueCell!3293 V!10675) V!10675)

(declare-fun dynLambda!621 (Int (_ BitVec 64)) V!10675)

(assert (=> b!343186 (= e!210428 (= (apply!278 lt!162450 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000)) (get!4654 (select (arr!8584 _values!1525) #b00000000000000000000000000000000) (dynLambda!621 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!343186 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8936 _values!1525)))))

(assert (=> b!343186 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8937 _keys!1895)))))

(declare-fun b!343187 () Bool)

(assert (=> b!343187 (= e!210431 e!210427)))

(declare-fun res!189732 () Bool)

(assert (=> b!343187 (= res!189732 call!26629)))

(assert (=> b!343187 (=> (not res!189732) (not e!210427))))

(declare-fun bm!26629 () Bool)

(assert (=> bm!26629 (= call!26629 (contains!2174 lt!162450 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26630 () Bool)

(assert (=> bm!26630 (= call!26628 (contains!2174 lt!162450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!343188 () Bool)

(assert (=> b!343188 (= e!210429 (= (apply!278 lt!162450 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!343189 () Bool)

(assert (=> b!343189 (= e!210419 call!26630)))

(declare-fun b!343190 () Bool)

(assert (=> b!343190 (= e!210423 e!210428)))

(declare-fun res!189730 () Bool)

(assert (=> b!343190 (=> (not res!189730) (not e!210428))))

(assert (=> b!343190 (= res!189730 (contains!2174 lt!162450 (select (arr!8585 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!343190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8937 _keys!1895)))))

(assert (= (and d!71071 c!52878) b!343170))

(assert (= (and d!71071 (not c!52878)) b!343177))

(assert (= (and b!343177 c!52883) b!343189))

(assert (= (and b!343177 (not c!52883)) b!343179))

(assert (= (and b!343179 c!52881) b!343184))

(assert (= (and b!343179 (not c!52881)) b!343180))

(assert (= (or b!343184 b!343180) bm!26624))

(assert (= (or b!343189 bm!26624) bm!26627))

(assert (= (or b!343189 b!343184) bm!26628))

(assert (= (or b!343170 bm!26627) bm!26625))

(assert (= (or b!343170 bm!26628) bm!26626))

(assert (= (and d!71071 res!189731) b!343183))

(assert (= (and d!71071 c!52879) b!343172))

(assert (= (and d!71071 (not c!52879)) b!343173))

(assert (= (and d!71071 res!189727) b!343176))

(assert (= (and b!343176 res!189733) b!343171))

(assert (= (and b!343176 (not res!189734)) b!343190))

(assert (= (and b!343190 res!189730) b!343186))

(assert (= (and b!343176 res!189726) b!343174))

(assert (= (and b!343174 c!52882) b!343178))

(assert (= (and b!343174 (not c!52882)) b!343175))

(assert (= (and b!343178 res!189728) b!343188))

(assert (= (or b!343178 b!343175) bm!26630))

(assert (= (and b!343174 res!189729) b!343181))

(assert (= (and b!343181 c!52880) b!343187))

(assert (= (and b!343181 (not c!52880)) b!343185))

(assert (= (and b!343187 res!189732) b!343182))

(assert (= (or b!343187 b!343185) bm!26629))

(declare-fun b_lambda!8473 () Bool)

(assert (=> (not b_lambda!8473) (not b!343186)))

(declare-fun t!9965 () Bool)

(declare-fun tb!3063 () Bool)

(assert (=> (and start!34332 (= defaultEntry!1528 defaultEntry!1528) t!9965) tb!3063))

(declare-fun result!5535 () Bool)

(assert (=> tb!3063 (= result!5535 tp_is_empty!7273)))

(assert (=> b!343186 t!9965))

(declare-fun b_and!14545 () Bool)

(assert (= b_and!14539 (and (=> t!9965 result!5535) b_and!14545)))

(declare-fun m!345371 () Bool)

(assert (=> bm!26626 m!345371))

(declare-fun m!345373 () Bool)

(assert (=> b!343188 m!345373))

(assert (=> b!343190 m!345327))

(assert (=> b!343190 m!345327))

(declare-fun m!345375 () Bool)

(assert (=> b!343190 m!345375))

(declare-fun m!345377 () Bool)

(assert (=> bm!26629 m!345377))

(declare-fun m!345379 () Bool)

(assert (=> b!343172 m!345379))

(declare-fun m!345381 () Bool)

(assert (=> b!343172 m!345381))

(assert (=> b!343172 m!345379))

(declare-fun m!345383 () Bool)

(assert (=> b!343172 m!345383))

(assert (=> b!343172 m!345383))

(declare-fun m!345385 () Bool)

(assert (=> b!343172 m!345385))

(assert (=> b!343172 m!345327))

(declare-fun m!345387 () Bool)

(assert (=> b!343172 m!345387))

(declare-fun m!345389 () Bool)

(assert (=> b!343172 m!345389))

(declare-fun m!345391 () Bool)

(assert (=> b!343172 m!345391))

(declare-fun m!345393 () Bool)

(assert (=> b!343172 m!345393))

(declare-fun m!345395 () Bool)

(assert (=> b!343172 m!345395))

(declare-fun m!345397 () Bool)

(assert (=> b!343172 m!345397))

(declare-fun m!345399 () Bool)

(assert (=> b!343172 m!345399))

(declare-fun m!345401 () Bool)

(assert (=> b!343172 m!345401))

(declare-fun m!345403 () Bool)

(assert (=> b!343172 m!345403))

(assert (=> b!343172 m!345393))

(declare-fun m!345405 () Bool)

(assert (=> b!343172 m!345405))

(declare-fun m!345407 () Bool)

(assert (=> b!343172 m!345407))

(assert (=> b!343172 m!345403))

(declare-fun m!345409 () Bool)

(assert (=> b!343172 m!345409))

(assert (=> b!343171 m!345327))

(assert (=> b!343171 m!345327))

(assert (=> b!343171 m!345335))

(declare-fun m!345411 () Bool)

(assert (=> bm!26630 m!345411))

(declare-fun m!345413 () Bool)

(assert (=> b!343186 m!345413))

(declare-fun m!345415 () Bool)

(assert (=> b!343186 m!345415))

(declare-fun m!345417 () Bool)

(assert (=> b!343186 m!345417))

(assert (=> b!343186 m!345327))

(assert (=> b!343186 m!345415))

(assert (=> b!343186 m!345413))

(assert (=> b!343186 m!345327))

(declare-fun m!345419 () Bool)

(assert (=> b!343186 m!345419))

(assert (=> bm!26625 m!345407))

(assert (=> d!71071 m!345243))

(assert (=> b!343183 m!345327))

(assert (=> b!343183 m!345327))

(assert (=> b!343183 m!345335))

(declare-fun m!345421 () Bool)

(assert (=> b!343170 m!345421))

(declare-fun m!345423 () Bool)

(assert (=> b!343182 m!345423))

(assert (=> b!342970 d!71071))

(declare-fun d!71073 () Bool)

(assert (=> d!71073 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!342971 d!71073))

(declare-fun d!71075 () Bool)

(declare-fun res!189739 () Bool)

(declare-fun e!210436 () Bool)

(assert (=> d!71075 (=> res!189739 e!210436)))

(assert (=> d!71075 (= res!189739 (= (select (arr!8585 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71075 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!210436)))

(declare-fun b!343197 () Bool)

(declare-fun e!210437 () Bool)

(assert (=> b!343197 (= e!210436 e!210437)))

(declare-fun res!189740 () Bool)

(assert (=> b!343197 (=> (not res!189740) (not e!210437))))

(assert (=> b!343197 (= res!189740 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8937 _keys!1895)))))

(declare-fun b!343198 () Bool)

(assert (=> b!343198 (= e!210437 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71075 (not res!189739)) b!343197))

(assert (= (and b!343197 res!189740) b!343198))

(assert (=> d!71075 m!345327))

(declare-fun m!345425 () Bool)

(assert (=> b!343198 m!345425))

(assert (=> b!342976 d!71075))

(declare-fun b!343205 () Bool)

(declare-fun e!210442 () Bool)

(assert (=> b!343205 (= e!210442 tp_is_empty!7273)))

(declare-fun mapNonEmpty!12351 () Bool)

(declare-fun mapRes!12351 () Bool)

(declare-fun tp!25518 () Bool)

(assert (=> mapNonEmpty!12351 (= mapRes!12351 (and tp!25518 e!210442))))

(declare-fun mapKey!12351 () (_ BitVec 32))

(declare-fun mapValue!12351 () ValueCell!3293)

(declare-fun mapRest!12351 () (Array (_ BitVec 32) ValueCell!3293))

(assert (=> mapNonEmpty!12351 (= mapRest!12342 (store mapRest!12351 mapKey!12351 mapValue!12351))))

(declare-fun mapIsEmpty!12351 () Bool)

(assert (=> mapIsEmpty!12351 mapRes!12351))

(declare-fun b!343206 () Bool)

(declare-fun e!210443 () Bool)

(assert (=> b!343206 (= e!210443 tp_is_empty!7273)))

(declare-fun condMapEmpty!12351 () Bool)

(declare-fun mapDefault!12351 () ValueCell!3293)

(assert (=> mapNonEmpty!12342 (= condMapEmpty!12351 (= mapRest!12342 ((as const (Array (_ BitVec 32) ValueCell!3293)) mapDefault!12351)))))

(assert (=> mapNonEmpty!12342 (= tp!25502 (and e!210443 mapRes!12351))))

(assert (= (and mapNonEmpty!12342 condMapEmpty!12351) mapIsEmpty!12351))

(assert (= (and mapNonEmpty!12342 (not condMapEmpty!12351)) mapNonEmpty!12351))

(assert (= (and mapNonEmpty!12351 ((_ is ValueCellFull!3293) mapValue!12351)) b!343205))

(assert (= (and mapNonEmpty!12342 ((_ is ValueCellFull!3293) mapDefault!12351)) b!343206))

(declare-fun m!345427 () Bool)

(assert (=> mapNonEmpty!12351 m!345427))

(declare-fun b_lambda!8475 () Bool)

(assert (= b_lambda!8473 (or (and start!34332 b_free!7321) b_lambda!8475)))

(check-sat (not b!343111) (not b!343190) (not b!343183) (not b!343188) b_and!14545 (not b!343077) (not bm!26609) (not b!343170) (not b!343109) (not b!343093) (not b!343127) (not d!71069) (not b_lambda!8475) (not b!343125) (not b!343172) (not bm!26630) (not b!343118) (not bm!26606) (not bm!26626) (not d!71071) (not bm!26625) tp_is_empty!7273 (not b!343198) (not b!343171) (not d!71061) (not b!343078) (not bm!26629) (not b!343108) (not b!343186) (not b_next!7321) (not b!343182) (not d!71065) (not mapNonEmpty!12351))
(check-sat b_and!14545 (not b_next!7321))
