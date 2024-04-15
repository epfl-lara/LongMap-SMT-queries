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

(declare-fun res!10152 () Bool)

(declare-fun e!7603 () Bool)

(assert (=> start!1818 (=> (not res!10152) (not e!7603))))

(declare-fun initialSize!1 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1818 (= res!10152 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(assert (=> start!1818 e!7603))

(assert (=> start!1818 true))

(assert (=> start!1818 tp!2114))

(declare-fun b!12691 () Bool)

(declare-fun e!7604 () Bool)

(assert (=> b!12691 (= e!7603 e!7604)))

(declare-fun res!10153 () Bool)

(assert (=> b!12691 (=> res!10153 e!7604)))

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

(assert (=> b!12691 (= res!10153 (not (valid!16 lt!3186)))))

(declare-fun defaultEntry!183 () Int)

(declare-fun getNewLongMapFixedSize!4 ((_ BitVec 32) Int) LongMapFixedSize!22)

(assert (=> b!12691 (= lt!3186 (LongMap!23 (Cell!23 (getNewLongMapFixedSize!4 (bvsub initialSize!1 #b00000000000000000000000000000001) defaultEntry!183))))))

(declare-fun b!12692 () Bool)

(declare-fun size!474 (LongMap!22) (_ BitVec 32))

(assert (=> b!12692 (= e!7604 (not (= (size!474 lt!3186) #b00000000000000000000000000000000)))))

(assert (= (and start!1818 res!10152) b!12691))

(assert (= (and b!12691 (not res!10153)) b!12692))

(declare-fun m!8589 () Bool)

(assert (=> start!1818 m!8589))

(declare-fun m!8591 () Bool)

(assert (=> b!12691 m!8591))

(declare-fun m!8593 () Bool)

(assert (=> b!12691 m!8593))

(declare-fun m!8595 () Bool)

(assert (=> b!12692 m!8595))

(check-sat (not b!12692) (not b!12691) b_and!861 (not b_next!463) (not start!1818))
(check-sat b_and!861 (not b_next!463))
(get-model)

(declare-fun d!1821 () Bool)

(assert (=> d!1821 (= (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001)) (and (or (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000001111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000011111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000001111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000011111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000001111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000011111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000001111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000011111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000001111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000011111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000001111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000011111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000001111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000011111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000001111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000011111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00001111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00011111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (bvsle (bvsub initialSize!1 #b00000000000000000000000000000001) #b00111111111111111111111111111111)))))

(assert (=> start!1818 d!1821))

(declare-fun d!1829 () Bool)

(declare-fun size!482 (LongMapFixedSize!22) (_ BitVec 32))

(assert (=> d!1829 (= (size!474 lt!3186) (size!482 (v!1383 (underlying!22 lt!3186))))))

(declare-fun bs!486 () Bool)

(assert (= bs!486 d!1829))

(declare-fun m!8619 () Bool)

(assert (=> bs!486 m!8619))

(assert (=> b!12692 d!1829))

(declare-fun d!1831 () Bool)

(declare-fun valid!20 (LongMapFixedSize!22) Bool)

(assert (=> d!1831 (= (valid!16 lt!3186) (valid!20 (v!1383 (underlying!22 lt!3186))))))

(declare-fun bs!488 () Bool)

(assert (= bs!488 d!1831))

(declare-fun m!8623 () Bool)

(assert (=> bs!488 m!8623))

(assert (=> b!12691 d!1831))

(declare-fun b!12749 () Bool)

(declare-fun e!7640 () Bool)

(declare-fun lt!3373 () array!855)

(declare-datatypes ((tuple2!452 0))(
  ( (tuple2!453 (_1!226 (_ BitVec 64)) (_2!226 V!861)) )
))
(declare-fun lt!3374 () tuple2!452)

(declare-fun arrayContainsKey!0 (array!855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!12749 (= e!7640 (arrayContainsKey!0 lt!3373 (_1!226 lt!3374) #b00000000000000000000000000000000))))

(declare-fun b!12750 () Bool)

(declare-fun e!7638 () Bool)

(declare-fun lt!3355 () LongMapFixedSize!22)

(declare-datatypes ((List!377 0))(
  ( (Nil!374) (Cons!373 (h!939 tuple2!452) (t!2770 List!377)) )
))
(declare-datatypes ((ListLongMap!391 0))(
  ( (ListLongMap!392 (toList!211 List!377)) )
))
(declare-fun map!242 (LongMapFixedSize!22) ListLongMap!391)

(assert (=> b!12750 (= e!7638 (= (map!242 lt!3355) (ListLongMap!392 Nil!374)))))

(declare-fun b!12751 () Bool)

(declare-fun lt!3357 () (_ BitVec 32))

(assert (=> b!12751 (= e!7640 (ite (= (_1!226 lt!3374) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!3357 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!3357 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!12752 () Bool)

(declare-datatypes ((Unit!283 0))(
  ( (Unit!284) )
))
(declare-fun e!7639 () Unit!283)

(declare-fun Unit!285 () Unit!283)

(assert (=> b!12752 (= e!7639 Unit!285)))

(declare-fun b!12753 () Bool)

(declare-fun res!10180 () Bool)

(assert (=> b!12753 (=> (not res!10180) (not e!7638))))

(assert (=> b!12753 (= res!10180 (= (mask!4434 lt!3355) (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(declare-fun b!12754 () Bool)

(declare-fun Unit!286 () Unit!283)

(assert (=> b!12754 (= e!7639 Unit!286)))

(declare-fun lt!3365 () LongMapFixedSize!22)

(declare-fun head!779 (List!377) tuple2!452)

(assert (=> b!12754 (= lt!3374 (head!779 (toList!211 (map!242 lt!3365))))))

(assert (=> b!12754 (= lt!3373 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (=> b!12754 (= lt!3357 #b00000000000000000000000000000000)))

(declare-fun lt!3370 () Unit!283)

(declare-fun lemmaKeyInListMapIsInArray!82 (array!855 array!857 (_ BitVec 32) (_ BitVec 32) V!861 V!861 (_ BitVec 64) Int) Unit!283)

(declare-fun dynLambda!79 (Int (_ BitVec 64)) V!861)

(assert (=> b!12754 (= lt!3370 (lemmaKeyInListMapIsInArray!82 lt!3373 (array!858 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3357 (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!226 lt!3374) defaultEntry!183))))

(declare-fun c!1158 () Bool)

(assert (=> b!12754 (= c!1158 (and (not (= (_1!226 lt!3374) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!226 lt!3374) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!12754 e!7640))

(declare-fun lt!3375 () Unit!283)

(assert (=> b!12754 (= lt!3375 lt!3370)))

(declare-fun lt!3361 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!855 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!12754 (= lt!3361 (arrayScanForKey!0 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!226 lt!3374) #b00000000000000000000000000000000))))

(assert (=> b!12754 false))

(declare-fun d!1835 () Bool)

(assert (=> d!1835 e!7638))

(declare-fun res!10181 () Bool)

(assert (=> d!1835 (=> (not res!10181) (not e!7638))))

(assert (=> d!1835 (= res!10181 (valid!20 lt!3355))))

(assert (=> d!1835 (= lt!3355 lt!3365)))

(declare-fun lt!3359 () Unit!283)

(assert (=> d!1835 (= lt!3359 e!7639)))

(declare-fun c!1157 () Bool)

(assert (=> d!1835 (= c!1157 (not (= (map!242 lt!3365) (ListLongMap!392 Nil!374))))))

(declare-fun lt!3369 () Unit!283)

(declare-fun lt!3372 () Unit!283)

(assert (=> d!1835 (= lt!3369 lt!3372)))

(declare-fun lt!3371 () array!855)

(declare-fun lt!3366 () (_ BitVec 32))

(declare-datatypes ((List!378 0))(
  ( (Nil!375) (Cons!374 (h!940 (_ BitVec 64)) (t!2771 List!378)) )
))
(declare-fun lt!3360 () List!378)

(declare-fun arrayNoDuplicates!0 (array!855 (_ BitVec 32) List!378) Bool)

(assert (=> d!1835 (arrayNoDuplicates!0 lt!3371 lt!3366 lt!3360)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!855 (_ BitVec 32) (_ BitVec 32) List!378) Unit!283)

(assert (=> d!1835 (= lt!3372 (lemmaArrayNoDuplicatesInAll0Array!0 lt!3371 lt!3366 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3360))))

(assert (=> d!1835 (= lt!3360 Nil!375)))

(assert (=> d!1835 (= lt!3366 #b00000000000000000000000000000000)))

(assert (=> d!1835 (= lt!3371 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3376 () Unit!283)

(declare-fun lt!3362 () Unit!283)

(assert (=> d!1835 (= lt!3376 lt!3362)))

(declare-fun lt!3367 () (_ BitVec 32))

(declare-fun lt!3364 () array!855)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!855 (_ BitVec 32)) Bool)

(assert (=> d!1835 (arrayForallSeekEntryOrOpenFound!0 lt!3367 lt!3364 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!855 (_ BitVec 32) (_ BitVec 32)) Unit!283)

(assert (=> d!1835 (= lt!3362 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!3364 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3367))))

(assert (=> d!1835 (= lt!3367 #b00000000000000000000000000000000)))

(assert (=> d!1835 (= lt!3364 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3358 () Unit!283)

(declare-fun lt!3368 () Unit!283)

(assert (=> d!1835 (= lt!3358 lt!3368)))

(declare-fun lt!3354 () array!855)

(declare-fun lt!3356 () (_ BitVec 32))

(declare-fun lt!3363 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!855 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!1835 (= (arrayCountValidKeys!0 lt!3354 lt!3356 lt!3363) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!855 (_ BitVec 32) (_ BitVec 32)) Unit!283)

(assert (=> d!1835 (= lt!3368 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!3354 lt!3356 lt!3363))))

(assert (=> d!1835 (= lt!3363 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(assert (=> d!1835 (= lt!3356 #b00000000000000000000000000000000)))

(assert (=> d!1835 (= lt!3354 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (=> d!1835 (= lt!3365 (LongMapFixedSize!23 defaultEntry!183 (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000000 (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (array!858 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!1835 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1835 (= (getNewLongMapFixedSize!4 (bvsub initialSize!1 #b00000000000000000000000000000001) defaultEntry!183) lt!3355)))

(assert (= (and d!1835 c!1157) b!12754))

(assert (= (and d!1835 (not c!1157)) b!12752))

(assert (= (and b!12754 c!1158) b!12749))

(assert (= (and b!12754 (not c!1158)) b!12751))

(assert (= (and d!1835 res!10181) b!12753))

(assert (= (and b!12753 res!10180) b!12750))

(declare-fun b_lambda!843 () Bool)

(assert (=> (not b_lambda!843) (not b!12754)))

(declare-fun t!2765 () Bool)

(declare-fun tb!389 () Bool)

(assert (=> (and start!1818 (= defaultEntry!183 defaultEntry!183) t!2765) tb!389))

(declare-fun result!613 () Bool)

(declare-fun tp_is_empty!639 () Bool)

(assert (=> tb!389 (= result!613 tp_is_empty!639)))

(assert (=> b!12754 t!2765))

(declare-fun b_and!871 () Bool)

(assert (= b_and!861 (and (=> t!2765 result!613) b_and!871)))

(declare-fun b_lambda!851 () Bool)

(assert (=> (not b_lambda!851) (not d!1835)))

(assert (=> d!1835 t!2765))

(declare-fun b_and!873 () Bool)

(assert (= b_and!871 (and (=> t!2765 result!613) b_and!873)))

(declare-fun m!8653 () Bool)

(assert (=> b!12749 m!8653))

(declare-fun m!8655 () Bool)

(assert (=> b!12750 m!8655))

(declare-fun m!8657 () Bool)

(assert (=> b!12754 m!8657))

(declare-fun m!8659 () Bool)

(assert (=> b!12754 m!8659))

(declare-fun m!8661 () Bool)

(assert (=> b!12754 m!8661))

(assert (=> b!12754 m!8659))

(assert (=> b!12754 m!8659))

(declare-fun m!8663 () Bool)

(assert (=> b!12754 m!8663))

(declare-fun m!8665 () Bool)

(assert (=> b!12754 m!8665))

(assert (=> d!1835 m!8657))

(assert (=> d!1835 m!8659))

(declare-fun m!8669 () Bool)

(assert (=> d!1835 m!8669))

(declare-fun m!8673 () Bool)

(assert (=> d!1835 m!8673))

(declare-fun m!8677 () Bool)

(assert (=> d!1835 m!8677))

(declare-fun m!8681 () Bool)

(assert (=> d!1835 m!8681))

(assert (=> d!1835 m!8589))

(declare-fun m!8685 () Bool)

(assert (=> d!1835 m!8685))

(declare-fun m!8689 () Bool)

(assert (=> d!1835 m!8689))

(declare-fun m!8691 () Bool)

(assert (=> d!1835 m!8691))

(assert (=> b!12691 d!1835))

(declare-fun b_lambda!855 () Bool)

(assert (= b_lambda!843 (or (and start!1818 b_free!463) b_lambda!855)))

(declare-fun b_lambda!857 () Bool)

(assert (= b_lambda!851 (or (and start!1818 b_free!463) b_lambda!857)))

(check-sat tp_is_empty!639 (not d!1831) (not b_next!463) (not b_lambda!857) (not b_lambda!855) (not b!12754) b_and!873 (not b!12750) (not b!12749) (not d!1835) (not d!1829))
(check-sat b_and!873 (not b_next!463))
(get-model)

(declare-fun d!1845 () Bool)

(assert (=> d!1845 (= (size!482 (v!1383 (underlying!22 lt!3186))) (bvadd (_size!42 (v!1383 (underlying!22 lt!3186))) (bvsdiv (bvadd (extraKeys!1532 (v!1383 (underlying!22 lt!3186))) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> d!1829 d!1845))

(declare-fun d!1847 () Bool)

(declare-fun res!10188 () Bool)

(declare-fun e!7648 () Bool)

(assert (=> d!1847 (=> res!10188 e!7648)))

(assert (=> d!1847 (= res!10188 (= (select (arr!410 lt!3373) #b00000000000000000000000000000000) (_1!226 lt!3374)))))

(assert (=> d!1847 (= (arrayContainsKey!0 lt!3373 (_1!226 lt!3374) #b00000000000000000000000000000000) e!7648)))

(declare-fun b!12769 () Bool)

(declare-fun e!7649 () Bool)

(assert (=> b!12769 (= e!7648 e!7649)))

(declare-fun res!10189 () Bool)

(assert (=> b!12769 (=> (not res!10189) (not e!7649))))

(assert (=> b!12769 (= res!10189 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!472 lt!3373)))))

(declare-fun b!12770 () Bool)

(assert (=> b!12770 (= e!7649 (arrayContainsKey!0 lt!3373 (_1!226 lt!3374) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!1847 (not res!10188)) b!12769))

(assert (= (and b!12769 res!10189) b!12770))

(declare-fun m!8711 () Bool)

(assert (=> d!1847 m!8711))

(declare-fun m!8713 () Bool)

(assert (=> b!12770 m!8713))

(assert (=> b!12749 d!1847))

(declare-fun d!1853 () Bool)

(declare-fun getCurrentListMap!116 (array!855 array!857 (_ BitVec 32) (_ BitVec 32) V!861 V!861 (_ BitVec 32) Int) ListLongMap!391)

(assert (=> d!1853 (= (map!242 lt!3355) (getCurrentListMap!116 (_keys!3037 lt!3355) (_values!1616 lt!3355) (mask!4434 lt!3355) (extraKeys!1532 lt!3355) (zeroValue!1555 lt!3355) (minValue!1555 lt!3355) #b00000000000000000000000000000000 (defaultEntry!1615 lt!3355)))))

(declare-fun bs!490 () Bool)

(assert (= bs!490 d!1853))

(declare-fun m!8725 () Bool)

(assert (=> bs!490 m!8725))

(assert (=> b!12750 d!1853))

(declare-fun d!1859 () Bool)

(assert (=> d!1859 (= (head!779 (toList!211 (map!242 lt!3365))) (h!939 (toList!211 (map!242 lt!3365))))))

(assert (=> b!12754 d!1859))

(declare-fun d!1861 () Bool)

(assert (=> d!1861 (= (map!242 lt!3365) (getCurrentListMap!116 (_keys!3037 lt!3365) (_values!1616 lt!3365) (mask!4434 lt!3365) (extraKeys!1532 lt!3365) (zeroValue!1555 lt!3365) (minValue!1555 lt!3365) #b00000000000000000000000000000000 (defaultEntry!1615 lt!3365)))))

(declare-fun bs!491 () Bool)

(assert (= bs!491 d!1861))

(declare-fun m!8727 () Bool)

(assert (=> bs!491 m!8727))

(assert (=> b!12754 d!1861))

(declare-fun d!1863 () Bool)

(declare-fun e!7661 () Bool)

(assert (=> d!1863 e!7661))

(declare-fun c!1169 () Bool)

(assert (=> d!1863 (= c!1169 (and (not (= (_1!226 lt!3374) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!226 lt!3374) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!3411 () Unit!283)

(declare-fun choose!166 (array!855 array!857 (_ BitVec 32) (_ BitVec 32) V!861 V!861 (_ BitVec 64) Int) Unit!283)

(assert (=> d!1863 (= lt!3411 (choose!166 lt!3373 (array!858 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3357 (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!226 lt!3374) defaultEntry!183))))

(assert (=> d!1863 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1863 (= (lemmaKeyInListMapIsInArray!82 lt!3373 (array!858 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3357 (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!79 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!226 lt!3374) defaultEntry!183) lt!3411)))

(declare-fun b!12796 () Bool)

(assert (=> b!12796 (= e!7661 (arrayContainsKey!0 lt!3373 (_1!226 lt!3374) #b00000000000000000000000000000000))))

(declare-fun b!12797 () Bool)

(assert (=> b!12797 (= e!7661 (ite (= (_1!226 lt!3374) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!3357 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!3357 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!1863 c!1169) b!12796))

(assert (= (and d!1863 (not c!1169)) b!12797))

(assert (=> d!1863 m!8659))

(assert (=> d!1863 m!8659))

(declare-fun m!8737 () Bool)

(assert (=> d!1863 m!8737))

(assert (=> d!1863 m!8589))

(assert (=> b!12796 m!8653))

(assert (=> b!12754 d!1863))

(declare-fun d!1869 () Bool)

(declare-fun lt!3417 () (_ BitVec 32))

(assert (=> d!1869 (and (or (bvslt lt!3417 #b00000000000000000000000000000000) (bvsge lt!3417 (size!472 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (and (bvsge lt!3417 #b00000000000000000000000000000000) (bvslt lt!3417 (size!472 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))) (bvsge lt!3417 #b00000000000000000000000000000000) (bvslt lt!3417 (size!472 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (= (select (arr!410 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) lt!3417) (_1!226 lt!3374)))))

(declare-fun e!7671 () (_ BitVec 32))

(assert (=> d!1869 (= lt!3417 e!7671)))

(declare-fun c!1172 () Bool)

(assert (=> d!1869 (= c!1172 (= (select (arr!410 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) #b00000000000000000000000000000000) (_1!226 lt!3374)))))

(assert (=> d!1869 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!472 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (bvslt (size!472 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) #b01111111111111111111111111111111))))

(assert (=> d!1869 (= (arrayScanForKey!0 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!226 lt!3374) #b00000000000000000000000000000000) lt!3417)))

(declare-fun b!12815 () Bool)

(assert (=> b!12815 (= e!7671 #b00000000000000000000000000000000)))

(declare-fun b!12816 () Bool)

(assert (=> b!12816 (= e!7671 (arrayScanForKey!0 (array!856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!226 lt!3374) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!1869 c!1172) b!12815))

(assert (= (and d!1869 (not c!1172)) b!12816))

(declare-fun m!8753 () Bool)

(assert (=> d!1869 m!8753))

(declare-fun m!8755 () Bool)

(assert (=> d!1869 m!8755))

(declare-fun m!8757 () Bool)

(assert (=> b!12816 m!8757))

(assert (=> b!12754 d!1869))

(declare-fun d!1879 () Bool)

(declare-fun res!10229 () Bool)

(declare-fun e!7686 () Bool)

(assert (=> d!1879 (=> (not res!10229) (not e!7686))))

(declare-fun simpleValid!7 (LongMapFixedSize!22) Bool)

(assert (=> d!1879 (= res!10229 (simpleValid!7 lt!3355))))

(assert (=> d!1879 (= (valid!20 lt!3355) e!7686)))

(declare-fun b!12840 () Bool)

(declare-fun res!10230 () Bool)

(assert (=> b!12840 (=> (not res!10230) (not e!7686))))

(assert (=> b!12840 (= res!10230 (= (arrayCountValidKeys!0 (_keys!3037 lt!3355) #b00000000000000000000000000000000 (size!472 (_keys!3037 lt!3355))) (_size!42 lt!3355)))))

(declare-fun b!12841 () Bool)

(declare-fun res!10231 () Bool)

(assert (=> b!12841 (=> (not res!10231) (not e!7686))))

(assert (=> b!12841 (= res!10231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3037 lt!3355) (mask!4434 lt!3355)))))

(declare-fun b!12842 () Bool)

(assert (=> b!12842 (= e!7686 (arrayNoDuplicates!0 (_keys!3037 lt!3355) #b00000000000000000000000000000000 Nil!375))))

(assert (= (and d!1879 res!10229) b!12840))

(assert (= (and b!12840 res!10230) b!12841))

(assert (= (and b!12841 res!10231) b!12842))

(declare-fun m!8785 () Bool)

(assert (=> d!1879 m!8785))

(declare-fun m!8787 () Bool)

(assert (=> b!12840 m!8787))

(declare-fun m!8789 () Bool)

(assert (=> b!12841 m!8789))

(declare-fun m!8791 () Bool)

(assert (=> b!12842 m!8791))

(assert (=> d!1835 d!1879))

(declare-fun d!1891 () Bool)

(assert (=> d!1891 (= (arrayCountValidKeys!0 lt!3354 lt!3356 lt!3363) #b00000000000000000000000000000000)))

(declare-fun lt!3435 () Unit!283)

(declare-fun choose!59 (array!855 (_ BitVec 32) (_ BitVec 32)) Unit!283)

(assert (=> d!1891 (= lt!3435 (choose!59 lt!3354 lt!3356 lt!3363))))

(assert (=> d!1891 (bvslt (size!472 lt!3354) #b01111111111111111111111111111111)))

(assert (=> d!1891 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!3354 lt!3356 lt!3363) lt!3435)))

(declare-fun bs!498 () Bool)

(assert (= bs!498 d!1891))

(assert (=> bs!498 m!8677))

(declare-fun m!8795 () Bool)

(assert (=> bs!498 m!8795))

(assert (=> d!1835 d!1891))

(declare-fun d!1895 () Bool)

(declare-fun res!10240 () Bool)

(declare-fun e!7701 () Bool)

(assert (=> d!1895 (=> res!10240 e!7701)))

(assert (=> d!1895 (= res!10240 (bvsge lt!3366 (size!472 lt!3371)))))

(assert (=> d!1895 (= (arrayNoDuplicates!0 lt!3371 lt!3366 lt!3360) e!7701)))

(declare-fun b!12865 () Bool)

(declare-fun e!7704 () Bool)

(declare-fun e!7703 () Bool)

(assert (=> b!12865 (= e!7704 e!7703)))

(declare-fun c!1184 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!12865 (= c!1184 (validKeyInArray!0 (select (arr!410 lt!3371) lt!3366)))))

(declare-fun b!12866 () Bool)

(declare-fun call!329 () Bool)

(assert (=> b!12866 (= e!7703 call!329)))

(declare-fun b!12867 () Bool)

(assert (=> b!12867 (= e!7701 e!7704)))

(declare-fun res!10239 () Bool)

(assert (=> b!12867 (=> (not res!10239) (not e!7704))))

(declare-fun e!7702 () Bool)

(assert (=> b!12867 (= res!10239 (not e!7702))))

(declare-fun res!10238 () Bool)

(assert (=> b!12867 (=> (not res!10238) (not e!7702))))

(assert (=> b!12867 (= res!10238 (validKeyInArray!0 (select (arr!410 lt!3371) lt!3366)))))

(declare-fun b!12868 () Bool)

(assert (=> b!12868 (= e!7703 call!329)))

(declare-fun b!12869 () Bool)

(declare-fun contains!187 (List!378 (_ BitVec 64)) Bool)

(assert (=> b!12869 (= e!7702 (contains!187 lt!3360 (select (arr!410 lt!3371) lt!3366)))))

(declare-fun bm!326 () Bool)

(assert (=> bm!326 (= call!329 (arrayNoDuplicates!0 lt!3371 (bvadd lt!3366 #b00000000000000000000000000000001) (ite c!1184 (Cons!374 (select (arr!410 lt!3371) lt!3366) lt!3360) lt!3360)))))

(assert (= (and d!1895 (not res!10240)) b!12867))

(assert (= (and b!12867 res!10238) b!12869))

(assert (= (and b!12867 res!10239) b!12865))

(assert (= (and b!12865 c!1184) b!12868))

(assert (= (and b!12865 (not c!1184)) b!12866))

(assert (= (or b!12868 b!12866) bm!326))

(declare-fun m!8807 () Bool)

(assert (=> b!12865 m!8807))

(assert (=> b!12865 m!8807))

(declare-fun m!8809 () Bool)

(assert (=> b!12865 m!8809))

(assert (=> b!12867 m!8807))

(assert (=> b!12867 m!8807))

(assert (=> b!12867 m!8809))

(assert (=> b!12869 m!8807))

(assert (=> b!12869 m!8807))

(declare-fun m!8811 () Bool)

(assert (=> b!12869 m!8811))

(assert (=> bm!326 m!8807))

(declare-fun m!8813 () Bool)

(assert (=> bm!326 m!8813))

(assert (=> d!1835 d!1895))

(assert (=> d!1835 d!1861))

(assert (=> d!1835 d!1821))

(declare-fun d!1903 () Bool)

(assert (=> d!1903 (arrayNoDuplicates!0 lt!3371 lt!3366 lt!3360)))

(declare-fun lt!3453 () Unit!283)

(declare-fun choose!111 (array!855 (_ BitVec 32) (_ BitVec 32) List!378) Unit!283)

(assert (=> d!1903 (= lt!3453 (choose!111 lt!3371 lt!3366 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3360))))

(assert (=> d!1903 (= (size!472 lt!3371) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(assert (=> d!1903 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!3371 lt!3366 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3360) lt!3453)))

(declare-fun bs!501 () Bool)

(assert (= bs!501 d!1903))

(assert (=> bs!501 m!8669))

(declare-fun m!8815 () Bool)

(assert (=> bs!501 m!8815))

(assert (=> d!1835 d!1903))

(declare-fun b!12924 () Bool)

(declare-fun e!7747 () Bool)

(declare-fun call!341 () Bool)

(assert (=> b!12924 (= e!7747 call!341)))

(declare-fun bm!338 () Bool)

(assert (=> bm!338 (= call!341 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!3367 #b00000000000000000000000000000001) lt!3364 (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(declare-fun b!12925 () Bool)

(declare-fun e!7746 () Bool)

(assert (=> b!12925 (= e!7746 e!7747)))

(declare-fun c!1198 () Bool)

(assert (=> b!12925 (= c!1198 (validKeyInArray!0 (select (arr!410 lt!3364) lt!3367)))))

(declare-fun b!12926 () Bool)

(declare-fun e!7748 () Bool)

(assert (=> b!12926 (= e!7747 e!7748)))

(declare-fun lt!3466 () (_ BitVec 64))

(assert (=> b!12926 (= lt!3466 (select (arr!410 lt!3364) lt!3367))))

(declare-fun lt!3465 () Unit!283)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!855 (_ BitVec 64) (_ BitVec 32)) Unit!283)

(assert (=> b!12926 (= lt!3465 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!3364 lt!3466 lt!3367))))

(assert (=> b!12926 (arrayContainsKey!0 lt!3364 lt!3466 #b00000000000000000000000000000000)))

(declare-fun lt!3467 () Unit!283)

(assert (=> b!12926 (= lt!3467 lt!3465)))

(declare-fun res!10269 () Bool)

(declare-datatypes ((SeekEntryResult!42 0))(
  ( (MissingZero!42 (index!2287 (_ BitVec 32))) (Found!42 (index!2288 (_ BitVec 32))) (Intermediate!42 (undefined!854 Bool) (index!2289 (_ BitVec 32)) (x!3358 (_ BitVec 32))) (Undefined!42) (MissingVacant!42 (index!2290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!855 (_ BitVec 32)) SeekEntryResult!42)

(assert (=> b!12926 (= res!10269 (= (seekEntryOrOpen!0 (select (arr!410 lt!3364) lt!3367) lt!3364 (bvsub initialSize!1 #b00000000000000000000000000000001)) (Found!42 lt!3367)))))

(assert (=> b!12926 (=> (not res!10269) (not e!7748))))

(declare-fun b!12927 () Bool)

(assert (=> b!12927 (= e!7748 call!341)))

(declare-fun d!1905 () Bool)

(declare-fun res!10270 () Bool)

(assert (=> d!1905 (=> res!10270 e!7746)))

(assert (=> d!1905 (= res!10270 (bvsge lt!3367 (size!472 lt!3364)))))

(assert (=> d!1905 (= (arrayForallSeekEntryOrOpenFound!0 lt!3367 lt!3364 (bvsub initialSize!1 #b00000000000000000000000000000001)) e!7746)))

(assert (= (and d!1905 (not res!10270)) b!12925))

(assert (= (and b!12925 c!1198) b!12926))

(assert (= (and b!12925 (not c!1198)) b!12924))

(assert (= (and b!12926 res!10269) b!12927))

(assert (= (or b!12927 b!12924) bm!338))

(declare-fun m!8845 () Bool)

(assert (=> bm!338 m!8845))

(declare-fun m!8847 () Bool)

(assert (=> b!12925 m!8847))

(assert (=> b!12925 m!8847))

(declare-fun m!8849 () Bool)

(assert (=> b!12925 m!8849))

(assert (=> b!12926 m!8847))

(declare-fun m!8851 () Bool)

(assert (=> b!12926 m!8851))

(declare-fun m!8853 () Bool)

(assert (=> b!12926 m!8853))

(assert (=> b!12926 m!8847))

(declare-fun m!8855 () Bool)

(assert (=> b!12926 m!8855))

(assert (=> d!1835 d!1905))

(declare-fun d!1915 () Bool)

(assert (=> d!1915 (arrayForallSeekEntryOrOpenFound!0 lt!3367 lt!3364 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(declare-fun lt!3473 () Unit!283)

(declare-fun choose!34 (array!855 (_ BitVec 32) (_ BitVec 32)) Unit!283)

(assert (=> d!1915 (= lt!3473 (choose!34 lt!3364 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3367))))

(assert (=> d!1915 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1915 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!3364 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3367) lt!3473)))

(declare-fun bs!502 () Bool)

(assert (= bs!502 d!1915))

(assert (=> bs!502 m!8673))

(declare-fun m!8859 () Bool)

(assert (=> bs!502 m!8859))

(assert (=> bs!502 m!8589))

(assert (=> d!1835 d!1915))

(declare-fun b!12963 () Bool)

(declare-fun e!7768 () (_ BitVec 32))

(assert (=> b!12963 (= e!7768 #b00000000000000000000000000000000)))

(declare-fun bm!344 () Bool)

(declare-fun call!347 () (_ BitVec 32))

(assert (=> bm!344 (= call!347 (arrayCountValidKeys!0 lt!3354 (bvadd lt!3356 #b00000000000000000000000000000001) lt!3363))))

(declare-fun d!1919 () Bool)

(declare-fun lt!3480 () (_ BitVec 32))

(assert (=> d!1919 (and (bvsge lt!3480 #b00000000000000000000000000000000) (bvsle lt!3480 (bvsub (size!472 lt!3354) lt!3356)))))

(assert (=> d!1919 (= lt!3480 e!7768)))

(declare-fun c!1214 () Bool)

(assert (=> d!1919 (= c!1214 (bvsge lt!3356 lt!3363))))

(assert (=> d!1919 (and (bvsle lt!3356 lt!3363) (bvsge lt!3356 #b00000000000000000000000000000000) (bvsle lt!3363 (size!472 lt!3354)))))

(assert (=> d!1919 (= (arrayCountValidKeys!0 lt!3354 lt!3356 lt!3363) lt!3480)))

(declare-fun b!12964 () Bool)

(declare-fun e!7769 () (_ BitVec 32))

(assert (=> b!12964 (= e!7768 e!7769)))

(declare-fun c!1213 () Bool)

(assert (=> b!12964 (= c!1213 (validKeyInArray!0 (select (arr!410 lt!3354) lt!3356)))))

(declare-fun b!12965 () Bool)

(assert (=> b!12965 (= e!7769 (bvadd #b00000000000000000000000000000001 call!347))))

(declare-fun b!12966 () Bool)

(assert (=> b!12966 (= e!7769 call!347)))

(assert (= (and d!1919 c!1214) b!12963))

(assert (= (and d!1919 (not c!1214)) b!12964))

(assert (= (and b!12964 c!1213) b!12965))

(assert (= (and b!12964 (not c!1213)) b!12966))

(assert (= (or b!12965 b!12966) bm!344))

(declare-fun m!8881 () Bool)

(assert (=> bm!344 m!8881))

(declare-fun m!8883 () Bool)

(assert (=> b!12964 m!8883))

(assert (=> b!12964 m!8883))

(declare-fun m!8885 () Bool)

(assert (=> b!12964 m!8885))

(assert (=> d!1835 d!1919))

(declare-fun d!1927 () Bool)

(declare-fun res!10280 () Bool)

(declare-fun e!7772 () Bool)

(assert (=> d!1927 (=> (not res!10280) (not e!7772))))

(assert (=> d!1927 (= res!10280 (simpleValid!7 (v!1383 (underlying!22 lt!3186))))))

(assert (=> d!1927 (= (valid!20 (v!1383 (underlying!22 lt!3186))) e!7772)))

(declare-fun b!12969 () Bool)

(declare-fun res!10281 () Bool)

(assert (=> b!12969 (=> (not res!10281) (not e!7772))))

(assert (=> b!12969 (= res!10281 (= (arrayCountValidKeys!0 (_keys!3037 (v!1383 (underlying!22 lt!3186))) #b00000000000000000000000000000000 (size!472 (_keys!3037 (v!1383 (underlying!22 lt!3186))))) (_size!42 (v!1383 (underlying!22 lt!3186)))))))

(declare-fun b!12970 () Bool)

(declare-fun res!10282 () Bool)

(assert (=> b!12970 (=> (not res!10282) (not e!7772))))

(assert (=> b!12970 (= res!10282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3037 (v!1383 (underlying!22 lt!3186))) (mask!4434 (v!1383 (underlying!22 lt!3186)))))))

(declare-fun b!12971 () Bool)

(assert (=> b!12971 (= e!7772 (arrayNoDuplicates!0 (_keys!3037 (v!1383 (underlying!22 lt!3186))) #b00000000000000000000000000000000 Nil!375))))

(assert (= (and d!1927 res!10280) b!12969))

(assert (= (and b!12969 res!10281) b!12970))

(assert (= (and b!12970 res!10282) b!12971))

(declare-fun m!8893 () Bool)

(assert (=> d!1927 m!8893))

(declare-fun m!8895 () Bool)

(assert (=> b!12969 m!8895))

(declare-fun m!8897 () Bool)

(assert (=> b!12970 m!8897))

(declare-fun m!8899 () Bool)

(assert (=> b!12971 m!8899))

(assert (=> d!1831 d!1927))

(check-sat (not b!12796) (not b!12865) (not b!12971) (not d!1879) (not d!1853) (not b_next!463) (not b!12969) (not b_lambda!857) (not d!1903) (not d!1927) (not d!1863) (not bm!338) (not b!12964) (not bm!344) b_and!873 (not b!12867) (not b!12841) tp_is_empty!639 (not d!1891) (not b!12770) (not b!12925) (not b!12816) (not d!1861) (not b!12926) (not b!12970) (not b!12842) (not b_lambda!855) (not bm!326) (not b!12840) (not d!1915) (not b!12869))
(check-sat b_and!873 (not b_next!463))
