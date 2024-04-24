; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1818 () Bool)

(assert start!1818)

(declare-fun b_free!463 () Bool)

(declare-fun b_next!463 () Bool)

(assert (=> start!1818 (= b_free!463 (not b_next!463))))

(declare-fun tp!2114 () Bool)

(declare-fun b_and!861 () Bool)

(assert (=> start!1818 (= tp!2114 b_and!861)))

(declare-fun res!10151 () Bool)

(declare-fun e!7600 () Bool)

(assert (=> start!1818 (=> (not res!10151) (not e!7600))))

(declare-fun initialSize!1 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1818 (= res!10151 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(assert (=> start!1818 e!7600))

(assert (=> start!1818 true))

(assert (=> start!1818 tp!2114))

(declare-fun b!12685 () Bool)

(declare-fun e!7599 () Bool)

(assert (=> b!12685 (= e!7600 e!7599)))

(declare-fun res!10150 () Bool)

(assert (=> b!12685 (=> res!10150 e!7599)))

(declare-datatypes ((array!855 0))(
  ( (array!856 (arr!410 (Array (_ BitVec 32) (_ BitVec 64))) (size!472 (_ BitVec 32))) )
))
(declare-datatypes ((V!861 0))(
  ( (V!862 (val!327 Int)) )
))
(declare-datatypes ((ValueCell!218 0))(
  ( (ValueCellFull!218 (v!1382 V!861)) (EmptyCell!218) )
))
(declare-datatypes ((array!857 0))(
  ( (array!858 (arr!411 (Array (_ BitVec 32) ValueCell!218)) (size!473 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!22 0))(
  ( (LongMapFixedSize!23 (defaultEntry!1615 Int) (mask!4434 (_ BitVec 32)) (extraKeys!1532 (_ BitVec 32)) (zeroValue!1555 V!861) (minValue!1555 V!861) (_size!42 (_ BitVec 32)) (_keys!3037 array!855) (_values!1616 array!857) (_vacant!42 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!22 0))(
  ( (Cell!23 (v!1383 LongMapFixedSize!22)) )
))
(declare-datatypes ((LongMap!22 0))(
  ( (LongMap!23 (underlying!22 Cell!22)) )
))
(declare-fun lt!3186 () LongMap!22)

(declare-fun valid!16 (LongMap!22) Bool)

(assert (=> b!12685 (= res!10150 (not (valid!16 lt!3186)))))

(declare-fun defaultEntry!183 () Int)

(declare-fun getNewLongMapFixedSize!4 ((_ BitVec 32) Int) LongMapFixedSize!22)

(assert (=> b!12685 (= lt!3186 (LongMap!23 (Cell!23 (getNewLongMapFixedSize!4 (bvsub initialSize!1 #b00000000000000000000000000000001) defaultEntry!183))))))

(declare-fun b!12686 () Bool)

(declare-fun size!474 (LongMap!22) (_ BitVec 32))

(assert (=> b!12686 (= e!7599 (not (= (size!474 lt!3186) #b00000000000000000000000000000000)))))

(assert (= (and start!1818 res!10151) b!12685))

(assert (= (and b!12685 (not res!10150)) b!12686))

(declare-fun m!8589 () Bool)

(assert (=> start!1818 m!8589))

(declare-fun m!8591 () Bool)

(assert (=> b!12685 m!8591))

(declare-fun m!8593 () Bool)

(assert (=> b!12685 m!8593))

(declare-fun m!8595 () Bool)

(assert (=> b!12686 m!8595))

(check-sat (not b_next!463) (not start!1818) (not b!12686) b_and!861 (not b!12685))
(check-sat b_and!861 (not b_next!463))
(get-model)

(declare-fun d!1815 () Bool)

(declare-fun size!482 (LongMapFixedSize!22) (_ BitVec 32))

(assert (=> d!1815 (= (size!474 lt!3186) (size!482 (v!1383 (underlying!22 lt!3186))))))

(declare-fun bs!484 () Bool)

(assert (= bs!484 d!1815))

(declare-fun m!8615 () Bool)

(assert (=> bs!484 m!8615))

(assert (=> b!12686 d!1815))

(declare-fun d!1821 () Bool)

(declare-fun valid!20 (LongMapFixedSize!22) Bool)

(assert (=> d!1821 (= (valid!16 lt!3186) (valid!20 (v!1383 (underlying!22 lt!3186))))))

(declare-fun bs!486 () Bool)

(assert (= bs!486 d!1821))

(declare-fun m!8619 () Bool)

(assert (=> bs!486 m!8619))

(assert (=> b!12685 d!1821))

(declare-fun d!1825 () Bool)

(declare-fun e!7625 () Bool)

(assert (=> d!1825 e!7625))

(declare-fun res!10173 () Bool)

(assert (=> d!1825 (=> (not res!10173) (not e!7625))))

(declare-fun lt!3285 () LongMapFixedSize!22)

(assert (=> d!1825 (= res!10173 (valid!20 lt!3285))))

(declare-fun lt!3293 () LongMapFixedSize!22)

(assert (=> d!1825 (= lt!3285 lt!3293)))

(declare-datatypes ((Unit!280 0))(
  ( (Unit!281) )
))
(declare-fun lt!3286 () Unit!280)

(declare-fun e!7626 () Unit!280)

(assert (=> d!1825 (= lt!3286 e!7626)))

(declare-fun c!1149 () Bool)

(declare-datatypes ((tuple2!452 0))(
  ( (tuple2!453 (_1!226 (_ BitVec 64)) (_2!226 V!861)) )
))
(declare-datatypes ((List!376 0))(
  ( (Nil!373) (Cons!372 (h!938 tuple2!452) (t!2767 List!376)) )
))
(declare-datatypes ((ListLongMap!391 0))(
  ( (ListLongMap!392 (toList!211 List!376)) )
))
(declare-fun map!242 (LongMapFixedSize!22) ListLongMap!391)

(assert (=> d!1825 (= c!1149 (not (= (map!242 lt!3293) (ListLongMap!392 Nil!373))))))

(declare-fun lt!3294 () Unit!280)

(declare-fun lt!3300 () Unit!280)

(assert (=> d!1825 (= lt!3294 lt!3300)))

(declare-fun lt!3295 () array!855)

(declare-fun lt!3304 () (_ BitVec 32))

(declare-datatypes ((List!377 0))(
  ( (Nil!374) (Cons!373 (h!939 (_ BitVec 64)) (t!2768 List!377)) )
))
(declare-fun lt!3305 () List!377)

(declare-fun arrayNoDuplicates!0 (array!855 (_ BitVec 32) List!377) Bool)

(assert (=> d!1825 (arrayNoDuplicates!0 lt!3295 lt!3304 lt!3305)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!855 (_ BitVec 32) (_ BitVec 32) List!377) Unit!280)

(assert (=> d!1825 (= lt!3300 (lemmaArrayNoDuplicatesInAll0Array!0 lt!3295 lt!3304 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3305))))

(assert (=> d!1825 (= lt!3305 Nil!374)))

(assert (=> d!1825 (= lt!3304 #b00000000000000000000000000000000)))

(assert (=> d!1825 (= lt!3295 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3302 () Unit!280)

(declare-fun lt!3306 () Unit!280)

(assert (=> d!1825 (= lt!3302 lt!3306)))

(declare-fun lt!3289 () (_ BitVec 32))

(declare-fun lt!3297 () array!855)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!855 (_ BitVec 32)) Bool)

(assert (=> d!1825 (arrayForallSeekEntryOrOpenFound!0 lt!3289 lt!3297 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!855 (_ BitVec 32) (_ BitVec 32)) Unit!280)

(assert (=> d!1825 (= lt!3306 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!3297 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3289))))

(assert (=> d!1825 (= lt!3289 #b00000000000000000000000000000000)))

(assert (=> d!1825 (= lt!3297 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3301 () Unit!280)

(declare-fun lt!3292 () Unit!280)

(assert (=> d!1825 (= lt!3301 lt!3292)))

(declare-fun lt!3287 () array!855)

(declare-fun lt!3303 () (_ BitVec 32))

(declare-fun lt!3290 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!855 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!1825 (= (arrayCountValidKeys!0 lt!3287 lt!3303 lt!3290) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!855 (_ BitVec 32) (_ BitVec 32)) Unit!280)

(assert (=> d!1825 (= lt!3292 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!3287 lt!3303 lt!3290))))

(assert (=> d!1825 (= lt!3290 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(assert (=> d!1825 (= lt!3303 #b00000000000000000000000000000000)))

(assert (=> d!1825 (= lt!3287 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!80 (Int (_ BitVec 64)) V!861)

(assert (=> d!1825 (= lt!3293 (LongMapFixedSize!23 defaultEntry!183 (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000000 (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (array!858 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!1825 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1825 (= (getNewLongMapFixedSize!4 (bvsub initialSize!1 #b00000000000000000000000000000001) defaultEntry!183) lt!3285)))

(declare-fun b!12723 () Bool)

(declare-fun e!7627 () Bool)

(declare-fun lt!3307 () array!855)

(declare-fun lt!3288 () tuple2!452)

(declare-fun arrayContainsKey!0 (array!855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!12723 (= e!7627 (arrayContainsKey!0 lt!3307 (_1!226 lt!3288) #b00000000000000000000000000000000))))

(declare-fun b!12724 () Bool)

(declare-fun Unit!286 () Unit!280)

(assert (=> b!12724 (= e!7626 Unit!286)))

(declare-fun head!780 (List!376) tuple2!452)

(assert (=> b!12724 (= lt!3288 (head!780 (toList!211 (map!242 lt!3293))))))

(assert (=> b!12724 (= lt!3307 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3296 () (_ BitVec 32))

(assert (=> b!12724 (= lt!3296 #b00000000000000000000000000000000)))

(declare-fun lt!3299 () Unit!280)

(declare-fun lemmaKeyInListMapIsInArray!83 (array!855 array!857 (_ BitVec 32) (_ BitVec 32) V!861 V!861 (_ BitVec 64) Int) Unit!280)

(assert (=> b!12724 (= lt!3299 (lemmaKeyInListMapIsInArray!83 lt!3307 (array!858 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3296 (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!226 lt!3288) defaultEntry!183))))

(declare-fun c!1150 () Bool)

(assert (=> b!12724 (= c!1150 (and (not (= (_1!226 lt!3288) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!226 lt!3288) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!12724 e!7627))

(declare-fun lt!3291 () Unit!280)

(assert (=> b!12724 (= lt!3291 lt!3299)))

(declare-fun lt!3298 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!855 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!12724 (= lt!3298 (arrayScanForKey!0 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!226 lt!3288) #b00000000000000000000000000000000))))

(assert (=> b!12724 false))

(declare-fun b!12725 () Bool)

(assert (=> b!12725 (= e!7625 (= (map!242 lt!3285) (ListLongMap!392 Nil!373)))))

(declare-fun b!12726 () Bool)

(declare-fun res!10172 () Bool)

(assert (=> b!12726 (=> (not res!10172) (not e!7625))))

(assert (=> b!12726 (= res!10172 (= (mask!4434 lt!3285) (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(declare-fun b!12727 () Bool)

(declare-fun Unit!287 () Unit!280)

(assert (=> b!12727 (= e!7626 Unit!287)))

(declare-fun b!12728 () Bool)

(assert (=> b!12728 (= e!7627 (ite (= (_1!226 lt!3288) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!3296 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!3296 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!1825 c!1149) b!12724))

(assert (= (and d!1825 (not c!1149)) b!12727))

(assert (= (and b!12724 c!1150) b!12723))

(assert (= (and b!12724 (not c!1150)) b!12728))

(assert (= (and d!1825 res!10173) b!12726))

(assert (= (and b!12726 res!10172) b!12725))

(declare-fun b_lambda!839 () Bool)

(assert (=> (not b_lambda!839) (not d!1825)))

(declare-fun t!2763 () Bool)

(declare-fun tb!387 () Bool)

(assert (=> (and start!1818 (= defaultEntry!183 defaultEntry!183) t!2763) tb!387))

(declare-fun result!609 () Bool)

(declare-fun tp_is_empty!637 () Bool)

(assert (=> tb!387 (= result!609 tp_is_empty!637)))

(assert (=> d!1825 t!2763))

(declare-fun b_and!867 () Bool)

(assert (= b_and!861 (and (=> t!2763 result!609) b_and!867)))

(declare-fun b_lambda!843 () Bool)

(assert (=> (not b_lambda!843) (not b!12724)))

(assert (=> b!12724 t!2763))

(declare-fun b_and!873 () Bool)

(assert (= b_and!867 (and (=> t!2763 result!609) b_and!873)))

(declare-fun m!8627 () Bool)

(assert (=> d!1825 m!8627))

(declare-fun m!8631 () Bool)

(assert (=> d!1825 m!8631))

(declare-fun m!8635 () Bool)

(assert (=> d!1825 m!8635))

(declare-fun m!8637 () Bool)

(assert (=> d!1825 m!8637))

(declare-fun m!8641 () Bool)

(assert (=> d!1825 m!8641))

(assert (=> d!1825 m!8589))

(declare-fun m!8645 () Bool)

(assert (=> d!1825 m!8645))

(declare-fun m!8649 () Bool)

(assert (=> d!1825 m!8649))

(declare-fun m!8651 () Bool)

(assert (=> d!1825 m!8651))

(declare-fun m!8655 () Bool)

(assert (=> d!1825 m!8655))

(declare-fun m!8657 () Bool)

(assert (=> b!12723 m!8657))

(declare-fun m!8661 () Bool)

(assert (=> b!12724 m!8661))

(assert (=> b!12724 m!8651))

(assert (=> b!12724 m!8651))

(declare-fun m!8669 () Bool)

(assert (=> b!12724 m!8669))

(assert (=> b!12724 m!8635))

(declare-fun m!8675 () Bool)

(assert (=> b!12724 m!8675))

(assert (=> b!12724 m!8651))

(declare-fun m!8679 () Bool)

(assert (=> b!12725 m!8679))

(assert (=> b!12685 d!1825))

(declare-fun d!1833 () Bool)

(assert (=> d!1833 (= (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001)) (and (or (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000001111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000011111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000001111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000011111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000001111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000011111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000001111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000011111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000001111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000011111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000001111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000011111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000001111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000011111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000001111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000011111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00001111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00011111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (bvsle (bvsub initialSize!1 #b00000000000000000000000000000001) #b00111111111111111111111111111111)))))

(assert (=> start!1818 d!1833))

(declare-fun b_lambda!851 () Bool)

(assert (= b_lambda!839 (or (and start!1818 b_free!463) b_lambda!851)))

(declare-fun b_lambda!853 () Bool)

(assert (= b_lambda!843 (or (and start!1818 b_free!463) b_lambda!853)))

(check-sat (not d!1821) (not d!1825) tp_is_empty!637 (not b!12724) b_and!873 (not b!12725) (not b_lambda!853) (not d!1815) (not b!12723) (not b_lambda!851) (not b_next!463))
(check-sat b_and!873 (not b_next!463))
(get-model)

(declare-fun d!1837 () Bool)

(assert (=> d!1837 (= (head!780 (toList!211 (map!242 lt!3293))) (h!938 (toList!211 (map!242 lt!3293))))))

(assert (=> b!12724 d!1837))

(declare-fun d!1839 () Bool)

(declare-fun getCurrentListMap!115 (array!855 array!857 (_ BitVec 32) (_ BitVec 32) V!861 V!861 (_ BitVec 32) Int) ListLongMap!391)

(assert (=> d!1839 (= (map!242 lt!3293) (getCurrentListMap!115 (_keys!3037 lt!3293) (_values!1616 lt!3293) (mask!4434 lt!3293) (extraKeys!1532 lt!3293) (zeroValue!1555 lt!3293) (minValue!1555 lt!3293) #b00000000000000000000000000000000 (defaultEntry!1615 lt!3293)))))

(declare-fun bs!489 () Bool)

(assert (= bs!489 d!1839))

(declare-fun m!8709 () Bool)

(assert (=> bs!489 m!8709))

(assert (=> b!12724 d!1839))

(declare-fun d!1843 () Bool)

(declare-fun e!7648 () Bool)

(assert (=> d!1843 e!7648))

(declare-fun c!1167 () Bool)

(assert (=> d!1843 (= c!1167 (and (not (= (_1!226 lt!3288) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!226 lt!3288) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!3405 () Unit!280)

(declare-fun choose!167 (array!855 array!857 (_ BitVec 32) (_ BitVec 32) V!861 V!861 (_ BitVec 64) Int) Unit!280)

(assert (=> d!1843 (= lt!3405 (choose!167 lt!3307 (array!858 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3296 (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!226 lt!3288) defaultEntry!183))))

(assert (=> d!1843 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1843 (= (lemmaKeyInListMapIsInArray!83 lt!3307 (array!858 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3296 (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!226 lt!3288) defaultEntry!183) lt!3405)))

(declare-fun b!12775 () Bool)

(assert (=> b!12775 (= e!7648 (arrayContainsKey!0 lt!3307 (_1!226 lt!3288) #b00000000000000000000000000000000))))

(declare-fun b!12776 () Bool)

(assert (=> b!12776 (= e!7648 (ite (= (_1!226 lt!3288) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!3296 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!3296 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!1843 c!1167) b!12775))

(assert (= (and d!1843 (not c!1167)) b!12776))

(assert (=> d!1843 m!8651))

(assert (=> d!1843 m!8651))

(declare-fun m!8717 () Bool)

(assert (=> d!1843 m!8717))

(assert (=> d!1843 m!8589))

(assert (=> b!12775 m!8657))

(assert (=> b!12724 d!1843))

(declare-fun d!1847 () Bool)

(declare-fun lt!3411 () (_ BitVec 32))

(assert (=> d!1847 (and (or (bvslt lt!3411 #b00000000000000000000000000000000) (bvsge lt!3411 (size!472 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (and (bvsge lt!3411 #b00000000000000000000000000000000) (bvslt lt!3411 (size!472 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))) (bvsge lt!3411 #b00000000000000000000000000000000) (bvslt lt!3411 (size!472 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (= (select (arr!410 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) lt!3411) (_1!226 lt!3288)))))

(declare-fun e!7651 () (_ BitVec 32))

(assert (=> d!1847 (= lt!3411 e!7651)))

(declare-fun c!1170 () Bool)

(assert (=> d!1847 (= c!1170 (= (select (arr!410 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) #b00000000000000000000000000000000) (_1!226 lt!3288)))))

(assert (=> d!1847 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!472 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (bvslt (size!472 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) #b01111111111111111111111111111111))))

(assert (=> d!1847 (= (arrayScanForKey!0 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!226 lt!3288) #b00000000000000000000000000000000) lt!3411)))

(declare-fun b!12781 () Bool)

(assert (=> b!12781 (= e!7651 #b00000000000000000000000000000000)))

(declare-fun b!12782 () Bool)

(assert (=> b!12782 (= e!7651 (arrayScanForKey!0 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!226 lt!3288) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!1847 c!1170) b!12781))

(assert (= (and d!1847 (not c!1170)) b!12782))

(declare-fun m!8721 () Bool)

(assert (=> d!1847 m!8721))

(declare-fun m!8723 () Bool)

(assert (=> d!1847 m!8723))

(declare-fun m!8725 () Bool)

(assert (=> b!12782 m!8725))

(assert (=> b!12724 d!1847))

(declare-fun d!1851 () Bool)

(assert (=> d!1851 (= (size!482 (v!1383 (underlying!22 lt!3186))) (bvadd (_size!42 (v!1383 (underlying!22 lt!3186))) (bvsdiv (bvadd (extraKeys!1532 (v!1383 (underlying!22 lt!3186))) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> d!1815 d!1851))

(declare-fun d!1853 () Bool)

(declare-fun res!10194 () Bool)

(declare-fun e!7663 () Bool)

(assert (=> d!1853 (=> (not res!10194) (not e!7663))))

(declare-fun simpleValid!5 (LongMapFixedSize!22) Bool)

(assert (=> d!1853 (= res!10194 (simpleValid!5 (v!1383 (underlying!22 lt!3186))))))

(assert (=> d!1853 (= (valid!20 (v!1383 (underlying!22 lt!3186))) e!7663)))

(declare-fun b!12801 () Bool)

(declare-fun res!10195 () Bool)

(assert (=> b!12801 (=> (not res!10195) (not e!7663))))

(assert (=> b!12801 (= res!10195 (= (arrayCountValidKeys!0 (_keys!3037 (v!1383 (underlying!22 lt!3186))) #b00000000000000000000000000000000 (size!472 (_keys!3037 (v!1383 (underlying!22 lt!3186))))) (_size!42 (v!1383 (underlying!22 lt!3186)))))))

(declare-fun b!12802 () Bool)

(declare-fun res!10196 () Bool)

(assert (=> b!12802 (=> (not res!10196) (not e!7663))))

(assert (=> b!12802 (= res!10196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3037 (v!1383 (underlying!22 lt!3186))) (mask!4434 (v!1383 (underlying!22 lt!3186)))))))

(declare-fun b!12803 () Bool)

(assert (=> b!12803 (= e!7663 (arrayNoDuplicates!0 (_keys!3037 (v!1383 (underlying!22 lt!3186))) #b00000000000000000000000000000000 Nil!374))))

(assert (= (and d!1853 res!10194) b!12801))

(assert (= (and b!12801 res!10195) b!12802))

(assert (= (and b!12802 res!10196) b!12803))

(declare-fun m!8739 () Bool)

(assert (=> d!1853 m!8739))

(declare-fun m!8741 () Bool)

(assert (=> b!12801 m!8741))

(declare-fun m!8743 () Bool)

(assert (=> b!12802 m!8743))

(declare-fun m!8745 () Bool)

(assert (=> b!12803 m!8745))

(assert (=> d!1821 d!1853))

(declare-fun d!1861 () Bool)

(assert (=> d!1861 (= (arrayCountValidKeys!0 lt!3287 lt!3303 lt!3290) #b00000000000000000000000000000000)))

(declare-fun lt!3423 () Unit!280)

(declare-fun choose!59 (array!855 (_ BitVec 32) (_ BitVec 32)) Unit!280)

(assert (=> d!1861 (= lt!3423 (choose!59 lt!3287 lt!3303 lt!3290))))

(assert (=> d!1861 (bvslt (size!472 lt!3287) #b01111111111111111111111111111111)))

(assert (=> d!1861 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!3287 lt!3303 lt!3290) lt!3423)))

(declare-fun bs!491 () Bool)

(assert (= bs!491 d!1861))

(assert (=> bs!491 m!8631))

(declare-fun m!8747 () Bool)

(assert (=> bs!491 m!8747))

(assert (=> d!1825 d!1861))

(declare-fun d!1865 () Bool)

(assert (=> d!1865 (arrayNoDuplicates!0 lt!3295 lt!3304 lt!3305)))

(declare-fun lt!3426 () Unit!280)

(declare-fun choose!111 (array!855 (_ BitVec 32) (_ BitVec 32) List!377) Unit!280)

(assert (=> d!1865 (= lt!3426 (choose!111 lt!3295 lt!3304 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3305))))

(assert (=> d!1865 (= (size!472 lt!3295) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(assert (=> d!1865 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!3295 lt!3304 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3305) lt!3426)))

(declare-fun bs!494 () Bool)

(assert (= bs!494 d!1865))

(assert (=> bs!494 m!8627))

(declare-fun m!8753 () Bool)

(assert (=> bs!494 m!8753))

(assert (=> d!1825 d!1865))

(declare-fun b!12824 () Bool)

(declare-fun e!7673 () (_ BitVec 32))

(declare-fun e!7674 () (_ BitVec 32))

(assert (=> b!12824 (= e!7673 e!7674)))

(declare-fun c!1181 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!12824 (= c!1181 (validKeyInArray!0 (select (arr!410 lt!3287) lt!3303)))))

(declare-fun d!1869 () Bool)

(declare-fun lt!3435 () (_ BitVec 32))

(assert (=> d!1869 (and (bvsge lt!3435 #b00000000000000000000000000000000) (bvsle lt!3435 (bvsub (size!472 lt!3287) lt!3303)))))

(assert (=> d!1869 (= lt!3435 e!7673)))

(declare-fun c!1182 () Bool)

(assert (=> d!1869 (= c!1182 (bvsge lt!3303 lt!3290))))

(assert (=> d!1869 (and (bvsle lt!3303 lt!3290) (bvsge lt!3303 #b00000000000000000000000000000000) (bvsle lt!3290 (size!472 lt!3287)))))

(assert (=> d!1869 (= (arrayCountValidKeys!0 lt!3287 lt!3303 lt!3290) lt!3435)))

(declare-fun b!12825 () Bool)

(declare-fun call!329 () (_ BitVec 32))

(assert (=> b!12825 (= e!7674 (bvadd #b00000000000000000000000000000001 call!329))))

(declare-fun b!12826 () Bool)

(assert (=> b!12826 (= e!7673 #b00000000000000000000000000000000)))

(declare-fun bm!326 () Bool)

(assert (=> bm!326 (= call!329 (arrayCountValidKeys!0 lt!3287 (bvadd lt!3303 #b00000000000000000000000000000001) lt!3290))))

(declare-fun b!12827 () Bool)

(assert (=> b!12827 (= e!7674 call!329)))

(assert (= (and d!1869 c!1182) b!12826))

(assert (= (and d!1869 (not c!1182)) b!12824))

(assert (= (and b!12824 c!1181) b!12825))

(assert (= (and b!12824 (not c!1181)) b!12827))

(assert (= (or b!12825 b!12827) bm!326))

(declare-fun m!8759 () Bool)

(assert (=> b!12824 m!8759))

(assert (=> b!12824 m!8759))

(declare-fun m!8761 () Bool)

(assert (=> b!12824 m!8761))

(declare-fun m!8763 () Bool)

(assert (=> bm!326 m!8763))

(assert (=> d!1825 d!1869))

(declare-fun b!12865 () Bool)

(declare-fun e!7701 () Bool)

(declare-fun e!7703 () Bool)

(assert (=> b!12865 (= e!7701 e!7703)))

(declare-fun lt!3448 () (_ BitVec 64))

(assert (=> b!12865 (= lt!3448 (select (arr!410 lt!3297) lt!3289))))

(declare-fun lt!3449 () Unit!280)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!855 (_ BitVec 64) (_ BitVec 32)) Unit!280)

(assert (=> b!12865 (= lt!3449 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!3297 lt!3448 lt!3289))))

(assert (=> b!12865 (arrayContainsKey!0 lt!3297 lt!3448 #b00000000000000000000000000000000)))

(declare-fun lt!3450 () Unit!280)

(assert (=> b!12865 (= lt!3450 lt!3449)))

(declare-fun res!10223 () Bool)

(declare-datatypes ((SeekEntryResult!41 0))(
  ( (MissingZero!41 (index!2283 (_ BitVec 32))) (Found!41 (index!2284 (_ BitVec 32))) (Intermediate!41 (undefined!853 Bool) (index!2285 (_ BitVec 32)) (x!3357 (_ BitVec 32))) (Undefined!41) (MissingVacant!41 (index!2286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!855 (_ BitVec 32)) SeekEntryResult!41)

(assert (=> b!12865 (= res!10223 (= (seekEntryOrOpen!0 (select (arr!410 lt!3297) lt!3289) lt!3297 (bvsub initialSize!1 #b00000000000000000000000000000001)) (Found!41 lt!3289)))))

(assert (=> b!12865 (=> (not res!10223) (not e!7703))))

(declare-fun b!12866 () Bool)

(declare-fun call!336 () Bool)

(assert (=> b!12866 (= e!7703 call!336)))

(declare-fun bm!333 () Bool)

(assert (=> bm!333 (= call!336 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!3289 #b00000000000000000000000000000001) lt!3297 (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(declare-fun b!12867 () Bool)

(declare-fun e!7702 () Bool)

(assert (=> b!12867 (= e!7702 e!7701)))

(declare-fun c!1192 () Bool)

(assert (=> b!12867 (= c!1192 (validKeyInArray!0 (select (arr!410 lt!3297) lt!3289)))))

(declare-fun b!12868 () Bool)

(assert (=> b!12868 (= e!7701 call!336)))

(declare-fun d!1875 () Bool)

(declare-fun res!10222 () Bool)

(assert (=> d!1875 (=> res!10222 e!7702)))

(assert (=> d!1875 (= res!10222 (bvsge lt!3289 (size!472 lt!3297)))))

(assert (=> d!1875 (= (arrayForallSeekEntryOrOpenFound!0 lt!3289 lt!3297 (bvsub initialSize!1 #b00000000000000000000000000000001)) e!7702)))

(assert (= (and d!1875 (not res!10222)) b!12867))

(assert (= (and b!12867 c!1192) b!12865))

(assert (= (and b!12867 (not c!1192)) b!12868))

(assert (= (and b!12865 res!10223) b!12866))

(assert (= (or b!12866 b!12868) bm!333))

(declare-fun m!8781 () Bool)

(assert (=> b!12865 m!8781))

(declare-fun m!8785 () Bool)

(assert (=> b!12865 m!8785))

(declare-fun m!8787 () Bool)

(assert (=> b!12865 m!8787))

(assert (=> b!12865 m!8781))

(declare-fun m!8791 () Bool)

(assert (=> b!12865 m!8791))

(declare-fun m!8793 () Bool)

(assert (=> bm!333 m!8793))

(assert (=> b!12867 m!8781))

(assert (=> b!12867 m!8781))

(declare-fun m!8797 () Bool)

(assert (=> b!12867 m!8797))

(assert (=> d!1825 d!1875))

(declare-fun d!1883 () Bool)

(assert (=> d!1883 (arrayForallSeekEntryOrOpenFound!0 lt!3289 lt!3297 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(declare-fun lt!3453 () Unit!280)

(declare-fun choose!34 (array!855 (_ BitVec 32) (_ BitVec 32)) Unit!280)

(assert (=> d!1883 (= lt!3453 (choose!34 lt!3297 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3289))))

(assert (=> d!1883 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1883 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!3297 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3289) lt!3453)))

(declare-fun bs!498 () Bool)

(assert (= bs!498 d!1883))

(assert (=> bs!498 m!8645))

(declare-fun m!8823 () Bool)

(assert (=> bs!498 m!8823))

(assert (=> bs!498 m!8589))

(assert (=> d!1825 d!1883))

(assert (=> d!1825 d!1839))

(assert (=> d!1825 d!1833))

(declare-fun d!1895 () Bool)

(declare-fun res!10239 () Bool)

(declare-fun e!7719 () Bool)

(assert (=> d!1895 (=> (not res!10239) (not e!7719))))

(assert (=> d!1895 (= res!10239 (simpleValid!5 lt!3285))))

(assert (=> d!1895 (= (valid!20 lt!3285) e!7719)))

(declare-fun b!12888 () Bool)

(declare-fun res!10240 () Bool)

(assert (=> b!12888 (=> (not res!10240) (not e!7719))))

(assert (=> b!12888 (= res!10240 (= (arrayCountValidKeys!0 (_keys!3037 lt!3285) #b00000000000000000000000000000000 (size!472 (_keys!3037 lt!3285))) (_size!42 lt!3285)))))

(declare-fun b!12889 () Bool)

(declare-fun res!10241 () Bool)

(assert (=> b!12889 (=> (not res!10241) (not e!7719))))

(assert (=> b!12889 (= res!10241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3037 lt!3285) (mask!4434 lt!3285)))))

(declare-fun b!12890 () Bool)

(assert (=> b!12890 (= e!7719 (arrayNoDuplicates!0 (_keys!3037 lt!3285) #b00000000000000000000000000000000 Nil!374))))

(assert (= (and d!1895 res!10239) b!12888))

(assert (= (and b!12888 res!10240) b!12889))

(assert (= (and b!12889 res!10241) b!12890))

(declare-fun m!8825 () Bool)

(assert (=> d!1895 m!8825))

(declare-fun m!8827 () Bool)

(assert (=> b!12888 m!8827))

(declare-fun m!8829 () Bool)

(assert (=> b!12889 m!8829))

(declare-fun m!8831 () Bool)

(assert (=> b!12890 m!8831))

(assert (=> d!1825 d!1895))

(declare-fun d!1897 () Bool)

(declare-fun res!10257 () Bool)

(declare-fun e!7735 () Bool)

(assert (=> d!1897 (=> res!10257 e!7735)))

(assert (=> d!1897 (= res!10257 (bvsge lt!3304 (size!472 lt!3295)))))

(assert (=> d!1897 (= (arrayNoDuplicates!0 lt!3295 lt!3304 lt!3305) e!7735)))

(declare-fun b!12916 () Bool)

(declare-fun e!7734 () Bool)

(declare-fun e!7737 () Bool)

(assert (=> b!12916 (= e!7734 e!7737)))

(declare-fun c!1200 () Bool)

(assert (=> b!12916 (= c!1200 (validKeyInArray!0 (select (arr!410 lt!3295) lt!3304)))))

(declare-fun call!341 () Bool)

(declare-fun bm!338 () Bool)

(assert (=> bm!338 (= call!341 (arrayNoDuplicates!0 lt!3295 (bvadd lt!3304 #b00000000000000000000000000000001) (ite c!1200 (Cons!373 (select (arr!410 lt!3295) lt!3304) lt!3305) lt!3305)))))

(declare-fun b!12917 () Bool)

(assert (=> b!12917 (= e!7735 e!7734)))

(declare-fun res!10259 () Bool)

(assert (=> b!12917 (=> (not res!10259) (not e!7734))))

(declare-fun e!7736 () Bool)

(assert (=> b!12917 (= res!10259 (not e!7736))))

(declare-fun res!10258 () Bool)

(assert (=> b!12917 (=> (not res!10258) (not e!7736))))

(assert (=> b!12917 (= res!10258 (validKeyInArray!0 (select (arr!410 lt!3295) lt!3304)))))

(declare-fun b!12918 () Bool)

(declare-fun contains!188 (List!377 (_ BitVec 64)) Bool)

(assert (=> b!12918 (= e!7736 (contains!188 lt!3305 (select (arr!410 lt!3295) lt!3304)))))

(declare-fun b!12919 () Bool)

(assert (=> b!12919 (= e!7737 call!341)))

(declare-fun b!12920 () Bool)

(assert (=> b!12920 (= e!7737 call!341)))

(assert (= (and d!1897 (not res!10257)) b!12917))

(assert (= (and b!12917 res!10258) b!12918))

(assert (= (and b!12917 res!10259) b!12916))

(assert (= (and b!12916 c!1200) b!12920))

(assert (= (and b!12916 (not c!1200)) b!12919))

(assert (= (or b!12920 b!12919) bm!338))

(declare-fun m!8845 () Bool)

(assert (=> b!12916 m!8845))

(assert (=> b!12916 m!8845))

(declare-fun m!8847 () Bool)

(assert (=> b!12916 m!8847))

(assert (=> bm!338 m!8845))

(declare-fun m!8849 () Bool)

(assert (=> bm!338 m!8849))

(assert (=> b!12917 m!8845))

(assert (=> b!12917 m!8845))

(assert (=> b!12917 m!8847))

(assert (=> b!12918 m!8845))

(assert (=> b!12918 m!8845))

(declare-fun m!8851 () Bool)

(assert (=> b!12918 m!8851))

(assert (=> d!1825 d!1897))

(declare-fun d!1909 () Bool)

(declare-fun res!10264 () Bool)

(declare-fun e!7742 () Bool)

(assert (=> d!1909 (=> res!10264 e!7742)))

(assert (=> d!1909 (= res!10264 (= (select (arr!410 lt!3307) #b00000000000000000000000000000000) (_1!226 lt!3288)))))

(assert (=> d!1909 (= (arrayContainsKey!0 lt!3307 (_1!226 lt!3288) #b00000000000000000000000000000000) e!7742)))

(declare-fun b!12925 () Bool)

(declare-fun e!7743 () Bool)

(assert (=> b!12925 (= e!7742 e!7743)))

(declare-fun res!10265 () Bool)

(assert (=> b!12925 (=> (not res!10265) (not e!7743))))

(assert (=> b!12925 (= res!10265 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!472 lt!3307)))))

(declare-fun b!12926 () Bool)

(assert (=> b!12926 (= e!7743 (arrayContainsKey!0 lt!3307 (_1!226 lt!3288) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!1909 (not res!10264)) b!12925))

(assert (= (and b!12925 res!10265) b!12926))

(declare-fun m!8855 () Bool)

(assert (=> d!1909 m!8855))

(declare-fun m!8857 () Bool)

(assert (=> b!12926 m!8857))

(assert (=> b!12723 d!1909))

(declare-fun d!1913 () Bool)

(assert (=> d!1913 (= (map!242 lt!3285) (getCurrentListMap!115 (_keys!3037 lt!3285) (_values!1616 lt!3285) (mask!4434 lt!3285) (extraKeys!1532 lt!3285) (zeroValue!1555 lt!3285) (minValue!1555 lt!3285) #b00000000000000000000000000000000 (defaultEntry!1615 lt!3285)))))

(declare-fun bs!501 () Bool)

(assert (= bs!501 d!1913))

(declare-fun m!8859 () Bool)

(assert (=> bs!501 m!8859))

(assert (=> b!12725 d!1913))

(check-sat (not bm!333) (not b!12801) (not b!12889) (not b!12926) tp_is_empty!637 (not d!1861) (not b!12802) (not b!12917) (not d!1913) (not b!12775) (not b_lambda!851) (not b_next!463) (not b!12916) (not bm!338) (not b!12803) (not d!1843) (not d!1865) (not b!12890) (not b!12782) (not b!12888) (not b!12824) (not d!1883) (not d!1839) (not b!12867) (not b!12918) (not d!1853) (not d!1895) (not b!12865) b_and!873 (not b_lambda!853) (not bm!326))
(check-sat b_and!873 (not b_next!463))
