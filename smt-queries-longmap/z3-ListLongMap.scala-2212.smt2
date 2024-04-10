; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36688 () Bool)

(assert start!36688)

(declare-fun res!204865 () Bool)

(declare-fun e!224263 () Bool)

(assert (=> start!36688 (=> (not res!204865) (not e!224263))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36688 (= res!204865 (validMask!0 mask!970))))

(assert (=> start!36688 e!224263))

(assert (=> start!36688 true))

(declare-datatypes ((V!12453 0))(
  ( (V!12454 (val!4300 Int)) )
))
(declare-datatypes ((ValueCell!3912 0))(
  ( (ValueCellFull!3912 (v!6496 V!12453)) (EmptyCell!3912) )
))
(declare-datatypes ((array!20975 0))(
  ( (array!20976 (arr!9959 (Array (_ BitVec 32) ValueCell!3912)) (size!10311 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20975)

(declare-fun e!224261 () Bool)

(declare-fun array_inv!7366 (array!20975) Bool)

(assert (=> start!36688 (and (array_inv!7366 _values!506) e!224261)))

(declare-datatypes ((array!20977 0))(
  ( (array!20978 (arr!9960 (Array (_ BitVec 32) (_ BitVec 64))) (size!10312 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20977)

(declare-fun array_inv!7367 (array!20977) Bool)

(assert (=> start!36688 (array_inv!7367 _keys!658)))

(declare-fun b!366271 () Bool)

(declare-fun res!204861 () Bool)

(assert (=> b!366271 (=> (not res!204861) (not e!224263))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366271 (= res!204861 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10312 _keys!658))))))

(declare-fun b!366272 () Bool)

(declare-fun res!204864 () Bool)

(assert (=> b!366272 (=> (not res!204864) (not e!224263))))

(declare-datatypes ((List!5546 0))(
  ( (Nil!5543) (Cons!5542 (h!6398 (_ BitVec 64)) (t!10696 List!5546)) )
))
(declare-fun arrayNoDuplicates!0 (array!20977 (_ BitVec 32) List!5546) Bool)

(assert (=> b!366272 (= res!204864 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5543))))

(declare-fun b!366273 () Bool)

(declare-fun res!204862 () Bool)

(assert (=> b!366273 (=> (not res!204862) (not e!224263))))

(assert (=> b!366273 (= res!204862 (or (= (select (arr!9960 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9960 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366274 () Bool)

(declare-fun e!224262 () Bool)

(declare-fun tp_is_empty!8511 () Bool)

(assert (=> b!366274 (= e!224262 tp_is_empty!8511)))

(declare-fun b!366275 () Bool)

(declare-fun res!204867 () Bool)

(assert (=> b!366275 (=> (not res!204867) (not e!224263))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20977 (_ BitVec 32)) Bool)

(assert (=> b!366275 (= res!204867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20978 (store (arr!9960 _keys!658) i!548 k0!778) (size!10312 _keys!658)) mask!970))))

(declare-fun b!366276 () Bool)

(declare-fun res!204863 () Bool)

(assert (=> b!366276 (=> (not res!204863) (not e!224263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366276 (= res!204863 (validKeyInArray!0 k0!778))))

(declare-fun b!366277 () Bool)

(declare-fun res!204859 () Bool)

(assert (=> b!366277 (=> (not res!204859) (not e!224263))))

(declare-fun arrayContainsKey!0 (array!20977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366277 (= res!204859 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366278 () Bool)

(declare-fun res!204860 () Bool)

(assert (=> b!366278 (=> (not res!204860) (not e!224263))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366278 (= res!204860 (and (= (size!10311 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10312 _keys!658) (size!10311 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366279 () Bool)

(declare-fun e!224264 () Bool)

(assert (=> b!366279 (= e!224264 tp_is_empty!8511)))

(declare-fun b!366280 () Bool)

(declare-fun res!204866 () Bool)

(assert (=> b!366280 (=> (not res!204866) (not e!224263))))

(assert (=> b!366280 (= res!204866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14322 () Bool)

(declare-fun mapRes!14322 () Bool)

(assert (=> mapIsEmpty!14322 mapRes!14322))

(declare-fun b!366281 () Bool)

(assert (=> b!366281 (= e!224263 (and (bvsle #b00000000000000000000000000000000 (size!10312 _keys!658)) (bvsge (size!10312 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!14322 () Bool)

(declare-fun tp!28398 () Bool)

(assert (=> mapNonEmpty!14322 (= mapRes!14322 (and tp!28398 e!224262))))

(declare-fun mapRest!14322 () (Array (_ BitVec 32) ValueCell!3912))

(declare-fun mapKey!14322 () (_ BitVec 32))

(declare-fun mapValue!14322 () ValueCell!3912)

(assert (=> mapNonEmpty!14322 (= (arr!9959 _values!506) (store mapRest!14322 mapKey!14322 mapValue!14322))))

(declare-fun b!366282 () Bool)

(assert (=> b!366282 (= e!224261 (and e!224264 mapRes!14322))))

(declare-fun condMapEmpty!14322 () Bool)

(declare-fun mapDefault!14322 () ValueCell!3912)

(assert (=> b!366282 (= condMapEmpty!14322 (= (arr!9959 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3912)) mapDefault!14322)))))

(assert (= (and start!36688 res!204865) b!366278))

(assert (= (and b!366278 res!204860) b!366280))

(assert (= (and b!366280 res!204866) b!366272))

(assert (= (and b!366272 res!204864) b!366271))

(assert (= (and b!366271 res!204861) b!366276))

(assert (= (and b!366276 res!204863) b!366273))

(assert (= (and b!366273 res!204862) b!366277))

(assert (= (and b!366277 res!204859) b!366275))

(assert (= (and b!366275 res!204867) b!366281))

(assert (= (and b!366282 condMapEmpty!14322) mapIsEmpty!14322))

(assert (= (and b!366282 (not condMapEmpty!14322)) mapNonEmpty!14322))

(get-info :version)

(assert (= (and mapNonEmpty!14322 ((_ is ValueCellFull!3912) mapValue!14322)) b!366274))

(assert (= (and b!366282 ((_ is ValueCellFull!3912) mapDefault!14322)) b!366279))

(assert (= start!36688 b!366282))

(declare-fun m!363649 () Bool)

(assert (=> b!366275 m!363649))

(declare-fun m!363651 () Bool)

(assert (=> b!366275 m!363651))

(declare-fun m!363653 () Bool)

(assert (=> b!366272 m!363653))

(declare-fun m!363655 () Bool)

(assert (=> b!366273 m!363655))

(declare-fun m!363657 () Bool)

(assert (=> b!366280 m!363657))

(declare-fun m!363659 () Bool)

(assert (=> b!366277 m!363659))

(declare-fun m!363661 () Bool)

(assert (=> b!366276 m!363661))

(declare-fun m!363663 () Bool)

(assert (=> mapNonEmpty!14322 m!363663))

(declare-fun m!363665 () Bool)

(assert (=> start!36688 m!363665))

(declare-fun m!363667 () Bool)

(assert (=> start!36688 m!363667))

(declare-fun m!363669 () Bool)

(assert (=> start!36688 m!363669))

(check-sat (not b!366272) (not start!36688) (not mapNonEmpty!14322) tp_is_empty!8511 (not b!366276) (not b!366280) (not b!366277) (not b!366275))
(check-sat)
(get-model)

(declare-fun d!72387 () Bool)

(assert (=> d!72387 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!366276 d!72387))

(declare-fun b!366329 () Bool)

(declare-fun e!224292 () Bool)

(declare-fun e!224289 () Bool)

(assert (=> b!366329 (= e!224292 e!224289)))

(declare-fun res!204901 () Bool)

(assert (=> b!366329 (=> (not res!204901) (not e!224289))))

(declare-fun e!224291 () Bool)

(assert (=> b!366329 (= res!204901 (not e!224291))))

(declare-fun res!204903 () Bool)

(assert (=> b!366329 (=> (not res!204903) (not e!224291))))

(assert (=> b!366329 (= res!204903 (validKeyInArray!0 (select (arr!9960 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27287 () Bool)

(declare-fun call!27290 () Bool)

(declare-fun c!53906 () Bool)

(assert (=> bm!27287 (= call!27290 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53906 (Cons!5542 (select (arr!9960 _keys!658) #b00000000000000000000000000000000) Nil!5543) Nil!5543)))))

(declare-fun b!366330 () Bool)

(declare-fun e!224290 () Bool)

(assert (=> b!366330 (= e!224290 call!27290)))

(declare-fun b!366331 () Bool)

(assert (=> b!366331 (= e!224290 call!27290)))

(declare-fun d!72389 () Bool)

(declare-fun res!204902 () Bool)

(assert (=> d!72389 (=> res!204902 e!224292)))

(assert (=> d!72389 (= res!204902 (bvsge #b00000000000000000000000000000000 (size!10312 _keys!658)))))

(assert (=> d!72389 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5543) e!224292)))

(declare-fun b!366332 () Bool)

(assert (=> b!366332 (= e!224289 e!224290)))

(assert (=> b!366332 (= c!53906 (validKeyInArray!0 (select (arr!9960 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366333 () Bool)

(declare-fun contains!2435 (List!5546 (_ BitVec 64)) Bool)

(assert (=> b!366333 (= e!224291 (contains!2435 Nil!5543 (select (arr!9960 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72389 (not res!204902)) b!366329))

(assert (= (and b!366329 res!204903) b!366333))

(assert (= (and b!366329 res!204901) b!366332))

(assert (= (and b!366332 c!53906) b!366330))

(assert (= (and b!366332 (not c!53906)) b!366331))

(assert (= (or b!366330 b!366331) bm!27287))

(declare-fun m!363693 () Bool)

(assert (=> b!366329 m!363693))

(assert (=> b!366329 m!363693))

(declare-fun m!363695 () Bool)

(assert (=> b!366329 m!363695))

(assert (=> bm!27287 m!363693))

(declare-fun m!363697 () Bool)

(assert (=> bm!27287 m!363697))

(assert (=> b!366332 m!363693))

(assert (=> b!366332 m!363693))

(assert (=> b!366332 m!363695))

(assert (=> b!366333 m!363693))

(assert (=> b!366333 m!363693))

(declare-fun m!363699 () Bool)

(assert (=> b!366333 m!363699))

(assert (=> b!366272 d!72389))

(declare-fun d!72391 () Bool)

(declare-fun res!204908 () Bool)

(declare-fun e!224297 () Bool)

(assert (=> d!72391 (=> res!204908 e!224297)))

(assert (=> d!72391 (= res!204908 (= (select (arr!9960 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72391 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!224297)))

(declare-fun b!366338 () Bool)

(declare-fun e!224298 () Bool)

(assert (=> b!366338 (= e!224297 e!224298)))

(declare-fun res!204909 () Bool)

(assert (=> b!366338 (=> (not res!204909) (not e!224298))))

(assert (=> b!366338 (= res!204909 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!10312 _keys!658)))))

(declare-fun b!366339 () Bool)

(assert (=> b!366339 (= e!224298 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72391 (not res!204908)) b!366338))

(assert (= (and b!366338 res!204909) b!366339))

(assert (=> d!72391 m!363693))

(declare-fun m!363701 () Bool)

(assert (=> b!366339 m!363701))

(assert (=> b!366277 d!72391))

(declare-fun d!72393 () Bool)

(assert (=> d!72393 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36688 d!72393))

(declare-fun d!72395 () Bool)

(assert (=> d!72395 (= (array_inv!7366 _values!506) (bvsge (size!10311 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36688 d!72395))

(declare-fun d!72397 () Bool)

(assert (=> d!72397 (= (array_inv!7367 _keys!658) (bvsge (size!10312 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36688 d!72397))

(declare-fun bm!27290 () Bool)

(declare-fun call!27293 () Bool)

(assert (=> bm!27290 (= call!27293 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!366349 () Bool)

(declare-fun e!224306 () Bool)

(declare-fun e!224307 () Bool)

(assert (=> b!366349 (= e!224306 e!224307)))

(declare-fun lt!169231 () (_ BitVec 64))

(assert (=> b!366349 (= lt!169231 (select (arr!9960 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11392 0))(
  ( (Unit!11393) )
))
(declare-fun lt!169232 () Unit!11392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20977 (_ BitVec 64) (_ BitVec 32)) Unit!11392)

(assert (=> b!366349 (= lt!169232 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169231 #b00000000000000000000000000000000))))

(assert (=> b!366349 (arrayContainsKey!0 _keys!658 lt!169231 #b00000000000000000000000000000000)))

(declare-fun lt!169230 () Unit!11392)

(assert (=> b!366349 (= lt!169230 lt!169232)))

(declare-fun res!204915 () Bool)

(declare-datatypes ((SeekEntryResult!3505 0))(
  ( (MissingZero!3505 (index!16199 (_ BitVec 32))) (Found!3505 (index!16200 (_ BitVec 32))) (Intermediate!3505 (undefined!4317 Bool) (index!16201 (_ BitVec 32)) (x!36739 (_ BitVec 32))) (Undefined!3505) (MissingVacant!3505 (index!16202 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20977 (_ BitVec 32)) SeekEntryResult!3505)

(assert (=> b!366349 (= res!204915 (= (seekEntryOrOpen!0 (select (arr!9960 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3505 #b00000000000000000000000000000000)))))

(assert (=> b!366349 (=> (not res!204915) (not e!224307))))

(declare-fun b!366350 () Bool)

(assert (=> b!366350 (= e!224306 call!27293)))

(declare-fun b!366351 () Bool)

(declare-fun e!224305 () Bool)

(assert (=> b!366351 (= e!224305 e!224306)))

(declare-fun c!53909 () Bool)

(assert (=> b!366351 (= c!53909 (validKeyInArray!0 (select (arr!9960 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72399 () Bool)

(declare-fun res!204914 () Bool)

(assert (=> d!72399 (=> res!204914 e!224305)))

(assert (=> d!72399 (= res!204914 (bvsge #b00000000000000000000000000000000 (size!10312 _keys!658)))))

(assert (=> d!72399 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!224305)))

(declare-fun b!366348 () Bool)

(assert (=> b!366348 (= e!224307 call!27293)))

(assert (= (and d!72399 (not res!204914)) b!366351))

(assert (= (and b!366351 c!53909) b!366349))

(assert (= (and b!366351 (not c!53909)) b!366350))

(assert (= (and b!366349 res!204915) b!366348))

(assert (= (or b!366348 b!366350) bm!27290))

(declare-fun m!363703 () Bool)

(assert (=> bm!27290 m!363703))

(assert (=> b!366349 m!363693))

(declare-fun m!363705 () Bool)

(assert (=> b!366349 m!363705))

(declare-fun m!363707 () Bool)

(assert (=> b!366349 m!363707))

(assert (=> b!366349 m!363693))

(declare-fun m!363709 () Bool)

(assert (=> b!366349 m!363709))

(assert (=> b!366351 m!363693))

(assert (=> b!366351 m!363693))

(assert (=> b!366351 m!363695))

(assert (=> b!366280 d!72399))

(declare-fun bm!27291 () Bool)

(declare-fun call!27294 () Bool)

(assert (=> bm!27291 (= call!27294 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!20978 (store (arr!9960 _keys!658) i!548 k0!778) (size!10312 _keys!658)) mask!970))))

(declare-fun b!366353 () Bool)

(declare-fun e!224309 () Bool)

(declare-fun e!224310 () Bool)

(assert (=> b!366353 (= e!224309 e!224310)))

(declare-fun lt!169234 () (_ BitVec 64))

(assert (=> b!366353 (= lt!169234 (select (arr!9960 (array!20978 (store (arr!9960 _keys!658) i!548 k0!778) (size!10312 _keys!658))) #b00000000000000000000000000000000))))

(declare-fun lt!169235 () Unit!11392)

(assert (=> b!366353 (= lt!169235 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20978 (store (arr!9960 _keys!658) i!548 k0!778) (size!10312 _keys!658)) lt!169234 #b00000000000000000000000000000000))))

(assert (=> b!366353 (arrayContainsKey!0 (array!20978 (store (arr!9960 _keys!658) i!548 k0!778) (size!10312 _keys!658)) lt!169234 #b00000000000000000000000000000000)))

(declare-fun lt!169233 () Unit!11392)

(assert (=> b!366353 (= lt!169233 lt!169235)))

(declare-fun res!204917 () Bool)

(assert (=> b!366353 (= res!204917 (= (seekEntryOrOpen!0 (select (arr!9960 (array!20978 (store (arr!9960 _keys!658) i!548 k0!778) (size!10312 _keys!658))) #b00000000000000000000000000000000) (array!20978 (store (arr!9960 _keys!658) i!548 k0!778) (size!10312 _keys!658)) mask!970) (Found!3505 #b00000000000000000000000000000000)))))

(assert (=> b!366353 (=> (not res!204917) (not e!224310))))

(declare-fun b!366354 () Bool)

(assert (=> b!366354 (= e!224309 call!27294)))

(declare-fun b!366355 () Bool)

(declare-fun e!224308 () Bool)

(assert (=> b!366355 (= e!224308 e!224309)))

(declare-fun c!53910 () Bool)

(assert (=> b!366355 (= c!53910 (validKeyInArray!0 (select (arr!9960 (array!20978 (store (arr!9960 _keys!658) i!548 k0!778) (size!10312 _keys!658))) #b00000000000000000000000000000000)))))

(declare-fun d!72401 () Bool)

(declare-fun res!204916 () Bool)

(assert (=> d!72401 (=> res!204916 e!224308)))

(assert (=> d!72401 (= res!204916 (bvsge #b00000000000000000000000000000000 (size!10312 (array!20978 (store (arr!9960 _keys!658) i!548 k0!778) (size!10312 _keys!658)))))))

(assert (=> d!72401 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20978 (store (arr!9960 _keys!658) i!548 k0!778) (size!10312 _keys!658)) mask!970) e!224308)))

(declare-fun b!366352 () Bool)

(assert (=> b!366352 (= e!224310 call!27294)))

(assert (= (and d!72401 (not res!204916)) b!366355))

(assert (= (and b!366355 c!53910) b!366353))

(assert (= (and b!366355 (not c!53910)) b!366354))

(assert (= (and b!366353 res!204917) b!366352))

(assert (= (or b!366352 b!366354) bm!27291))

(declare-fun m!363711 () Bool)

(assert (=> bm!27291 m!363711))

(declare-fun m!363713 () Bool)

(assert (=> b!366353 m!363713))

(declare-fun m!363715 () Bool)

(assert (=> b!366353 m!363715))

(declare-fun m!363717 () Bool)

(assert (=> b!366353 m!363717))

(assert (=> b!366353 m!363713))

(declare-fun m!363719 () Bool)

(assert (=> b!366353 m!363719))

(assert (=> b!366355 m!363713))

(assert (=> b!366355 m!363713))

(declare-fun m!363721 () Bool)

(assert (=> b!366355 m!363721))

(assert (=> b!366275 d!72401))

(declare-fun b!366363 () Bool)

(declare-fun e!224316 () Bool)

(assert (=> b!366363 (= e!224316 tp_is_empty!8511)))

(declare-fun b!366362 () Bool)

(declare-fun e!224315 () Bool)

(assert (=> b!366362 (= e!224315 tp_is_empty!8511)))

(declare-fun mapIsEmpty!14328 () Bool)

(declare-fun mapRes!14328 () Bool)

(assert (=> mapIsEmpty!14328 mapRes!14328))

(declare-fun condMapEmpty!14328 () Bool)

(declare-fun mapDefault!14328 () ValueCell!3912)

(assert (=> mapNonEmpty!14322 (= condMapEmpty!14328 (= mapRest!14322 ((as const (Array (_ BitVec 32) ValueCell!3912)) mapDefault!14328)))))

(assert (=> mapNonEmpty!14322 (= tp!28398 (and e!224316 mapRes!14328))))

(declare-fun mapNonEmpty!14328 () Bool)

(declare-fun tp!28404 () Bool)

(assert (=> mapNonEmpty!14328 (= mapRes!14328 (and tp!28404 e!224315))))

(declare-fun mapValue!14328 () ValueCell!3912)

(declare-fun mapRest!14328 () (Array (_ BitVec 32) ValueCell!3912))

(declare-fun mapKey!14328 () (_ BitVec 32))

(assert (=> mapNonEmpty!14328 (= mapRest!14322 (store mapRest!14328 mapKey!14328 mapValue!14328))))

(assert (= (and mapNonEmpty!14322 condMapEmpty!14328) mapIsEmpty!14328))

(assert (= (and mapNonEmpty!14322 (not condMapEmpty!14328)) mapNonEmpty!14328))

(assert (= (and mapNonEmpty!14328 ((_ is ValueCellFull!3912) mapValue!14328)) b!366362))

(assert (= (and mapNonEmpty!14322 ((_ is ValueCellFull!3912) mapDefault!14328)) b!366363))

(declare-fun m!363723 () Bool)

(assert (=> mapNonEmpty!14328 m!363723))

(check-sat (not b!366329) (not bm!27291) (not bm!27290) (not b!366332) (not bm!27287) (not b!366339) (not b!366349) tp_is_empty!8511 (not mapNonEmpty!14328) (not b!366355) (not b!366353) (not b!366333) (not b!366351))
(check-sat)
