; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1818 () Bool)

(assert start!1818)

(declare-fun b_free!463 () Bool)

(declare-fun b_next!463 () Bool)

(assert (=> start!1818 (= b_free!463 (not b_next!463))))

(declare-fun tp!2114 () Bool)

(declare-fun b_and!861 () Bool)

(assert (=> start!1818 (= tp!2114 b_and!861)))

(declare-fun res!10153 () Bool)

(declare-fun e!7604 () Bool)

(assert (=> start!1818 (=> (not res!10153) (not e!7604))))

(declare-fun initialSize!1 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1818 (= res!10153 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(assert (=> start!1818 e!7604))

(assert (=> start!1818 true))

(assert (=> start!1818 tp!2114))

(declare-fun b!12691 () Bool)

(declare-fun e!7603 () Bool)

(assert (=> b!12691 (= e!7604 e!7603)))

(declare-fun res!10152 () Bool)

(assert (=> b!12691 (=> res!10152 e!7603)))

(declare-datatypes ((array!873 0))(
  ( (array!874 (arr!419 (Array (_ BitVec 32) (_ BitVec 64))) (size!481 (_ BitVec 32))) )
))
(declare-datatypes ((V!861 0))(
  ( (V!862 (val!327 Int)) )
))
(declare-datatypes ((ValueCell!218 0))(
  ( (ValueCellFull!218 (v!1382 V!861)) (EmptyCell!218) )
))
(declare-datatypes ((array!875 0))(
  ( (array!876 (arr!420 (Array (_ BitVec 32) ValueCell!218)) (size!482 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!22 0))(
  ( (LongMapFixedSize!23 (defaultEntry!1615 Int) (mask!4434 (_ BitVec 32)) (extraKeys!1532 (_ BitVec 32)) (zeroValue!1555 V!861) (minValue!1555 V!861) (_size!42 (_ BitVec 32)) (_keys!3037 array!873) (_values!1616 array!875) (_vacant!42 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!22 0))(
  ( (Cell!23 (v!1383 LongMapFixedSize!22)) )
))
(declare-datatypes ((LongMap!22 0))(
  ( (LongMap!23 (underlying!22 Cell!22)) )
))
(declare-fun lt!3186 () LongMap!22)

(declare-fun valid!12 (LongMap!22) Bool)

(assert (=> b!12691 (= res!10152 (not (valid!12 lt!3186)))))

(declare-fun defaultEntry!183 () Int)

(declare-fun getNewLongMapFixedSize!4 ((_ BitVec 32) Int) LongMapFixedSize!22)

(assert (=> b!12691 (= lt!3186 (LongMap!23 (Cell!23 (getNewLongMapFixedSize!4 (bvsub initialSize!1 #b00000000000000000000000000000001) defaultEntry!183))))))

(declare-fun b!12692 () Bool)

(declare-fun size!483 (LongMap!22) (_ BitVec 32))

(assert (=> b!12692 (= e!7603 (not (= (size!483 lt!3186) #b00000000000000000000000000000000)))))

(assert (= (and start!1818 res!10153) b!12691))

(assert (= (and b!12691 (not res!10152)) b!12692))

(declare-fun m!8597 () Bool)

(assert (=> start!1818 m!8597))

(declare-fun m!8599 () Bool)

(assert (=> b!12691 m!8599))

(declare-fun m!8601 () Bool)

(assert (=> b!12691 m!8601))

(declare-fun m!8603 () Bool)

(assert (=> b!12692 m!8603))

(push 1)

(assert b_and!861)

(assert (not b_next!463))

(assert (not b!12691))

(assert (not b!12692))

(assert (not start!1818))

(check-sat)

(pop 1)

(push 1)

(assert b_and!861)

(assert (not b_next!463))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1819 () Bool)

(assert (=> d!1819 (= (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001)) (and (or (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000001111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000011111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000001111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000011111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000001111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000011111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000001111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000011111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000001111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000011111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000001111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000011111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000001111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000011111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000001111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000011111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00001111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00011111111111111111111111111111) (= (bvsub initialSize!1 #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (bvsle (bvsub initialSize!1 #b00000000000000000000000000000001) #b00111111111111111111111111111111)))))

(assert (=> start!1818 d!1819))

(declare-fun d!1827 () Bool)

(declare-fun size!491 (LongMapFixedSize!22) (_ BitVec 32))

(assert (=> d!1827 (= (size!483 lt!3186) (size!491 (v!1383 (underlying!22 lt!3186))))))

(declare-fun bs!485 () Bool)

(assert (= bs!485 d!1827))

(declare-fun m!8625 () Bool)

(assert (=> bs!485 m!8625))

(assert (=> b!12692 d!1827))

(declare-fun d!1831 () Bool)

(declare-fun valid!17 (LongMapFixedSize!22) Bool)

(assert (=> d!1831 (= (valid!12 lt!3186) (valid!17 (v!1383 (underlying!22 lt!3186))))))

(declare-fun bs!488 () Bool)

(assert (= bs!488 d!1831))

(declare-fun m!8631 () Bool)

(assert (=> bs!488 m!8631))

(assert (=> b!12691 d!1831))

(declare-fun b!12749 () Bool)

(declare-datatypes ((Unit!274 0))(
  ( (Unit!275) )
))
(declare-fun e!7642 () Unit!274)

(declare-fun Unit!278 () Unit!274)

(assert (=> b!12749 (= e!7642 Unit!278)))

(declare-fun b!12752 () Bool)

(declare-fun e!7639 () Bool)

(declare-fun lt!3395 () array!873)

(declare-datatypes ((tuple2!456 0))(
  ( (tuple2!457 (_1!228 (_ BitVec 64)) (_2!228 V!861)) )
))
(declare-fun lt!3372 () tuple2!456)

(declare-fun arrayContainsKey!0 (array!873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!12752 (= e!7639 (arrayContainsKey!0 lt!3395 (_1!228 lt!3372) #b00000000000000000000000000000000))))

(declare-fun b!12754 () Bool)

(declare-fun lt!3385 () (_ BitVec 32))

(assert (=> b!12754 (= e!7639 (ite (= (_1!228 lt!3372) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!3385 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!3385 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!12756 () Bool)

(declare-fun Unit!279 () Unit!274)

(assert (=> b!12756 (= e!7642 Unit!279)))

(declare-fun lt!3373 () LongMapFixedSize!22)

(declare-datatypes ((List!383 0))(
  ( (Nil!380) (Cons!379 (h!945 tuple2!456) (t!2776 List!383)) )
))
(declare-fun head!780 (List!383) tuple2!456)

(declare-datatypes ((ListLongMap!397 0))(
  ( (ListLongMap!398 (toList!214 List!383)) )
))
(declare-fun map!243 (LongMapFixedSize!22) ListLongMap!397)

(assert (=> b!12756 (= lt!3372 (head!780 (toList!214 (map!243 lt!3373))))))

(assert (=> b!12756 (= lt!3395 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (=> b!12756 (= lt!3385 #b00000000000000000000000000000000)))

(declare-fun lt!3362 () Unit!274)

(declare-fun lemmaKeyInListMapIsInArray!77 (array!873 array!875 (_ BitVec 32) (_ BitVec 32) V!861 V!861 (_ BitVec 64) Int) Unit!274)

(declare-fun dynLambda!80 (Int (_ BitVec 64)) V!861)

(assert (=> b!12756 (= lt!3362 (lemmaKeyInListMapIsInArray!77 lt!3395 (array!876 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3385 (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!228 lt!3372) defaultEntry!183))))

(declare-fun c!1160 () Bool)

(assert (=> b!12756 (= c!1160 (and (not (= (_1!228 lt!3372) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!228 lt!3372) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!12756 e!7639))

(declare-fun lt!3389 () Unit!274)

(assert (=> b!12756 (= lt!3389 lt!3362)))

(declare-fun lt!3380 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!873 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!12756 (= lt!3380 (arrayScanForKey!0 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!228 lt!3372) #b00000000000000000000000000000000))))

(assert (=> b!12756 false))

(declare-fun b!12758 () Bool)

(declare-fun res!10183 () Bool)

(declare-fun e!7638 () Bool)

(assert (=> b!12758 (=> (not res!10183) (not e!7638))))

(declare-fun lt!3376 () LongMapFixedSize!22)

(assert (=> b!12758 (= res!10183 (= (mask!4434 lt!3376) (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(declare-fun b!12760 () Bool)

(assert (=> b!12760 (= e!7638 (= (map!243 lt!3376) (ListLongMap!398 Nil!380)))))

(declare-fun d!1839 () Bool)

(assert (=> d!1839 e!7638))

(declare-fun res!10182 () Bool)

(assert (=> d!1839 (=> (not res!10182) (not e!7638))))

(assert (=> d!1839 (= res!10182 (valid!17 lt!3376))))

(assert (=> d!1839 (= lt!3376 lt!3373)))

(declare-fun lt!3393 () Unit!274)

(assert (=> d!1839 (= lt!3393 e!7642)))

(declare-fun c!1157 () Bool)

(assert (=> d!1839 (= c!1157 (not (= (map!243 lt!3373) (ListLongMap!398 Nil!380))))))

(declare-fun lt!3374 () Unit!274)

(declare-fun lt!3384 () Unit!274)

(assert (=> d!1839 (= lt!3374 lt!3384)))

(declare-fun lt!3358 () array!873)

(declare-fun lt!3369 () (_ BitVec 32))

(declare-datatypes ((List!384 0))(
  ( (Nil!381) (Cons!380 (h!946 (_ BitVec 64)) (t!2777 List!384)) )
))
(declare-fun lt!3370 () List!384)

(declare-fun arrayNoDuplicates!0 (array!873 (_ BitVec 32) List!384) Bool)

(assert (=> d!1839 (arrayNoDuplicates!0 lt!3358 lt!3369 lt!3370)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!873 (_ BitVec 32) (_ BitVec 32) List!384) Unit!274)

(assert (=> d!1839 (= lt!3384 (lemmaArrayNoDuplicatesInAll0Array!0 lt!3358 lt!3369 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3370))))

(assert (=> d!1839 (= lt!3370 Nil!381)))

(assert (=> d!1839 (= lt!3369 #b00000000000000000000000000000000)))

(assert (=> d!1839 (= lt!3358 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3378 () Unit!274)

(declare-fun lt!3387 () Unit!274)

(assert (=> d!1839 (= lt!3378 lt!3387)))

(declare-fun lt!3382 () (_ BitVec 32))

(declare-fun lt!3391 () array!873)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!873 (_ BitVec 32)) Bool)

(assert (=> d!1839 (arrayForallSeekEntryOrOpenFound!0 lt!3382 lt!3391 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!873 (_ BitVec 32) (_ BitVec 32)) Unit!274)

(assert (=> d!1839 (= lt!3387 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!3391 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3382))))

(assert (=> d!1839 (= lt!3382 #b00000000000000000000000000000000)))

(assert (=> d!1839 (= lt!3391 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!3364 () Unit!274)

(declare-fun lt!3398 () Unit!274)

(assert (=> d!1839 (= lt!3364 lt!3398)))

(declare-fun lt!3361 () array!873)

(declare-fun lt!3368 () (_ BitVec 32))

(declare-fun lt!3356 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!873 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!1839 (= (arrayCountValidKeys!0 lt!3361 lt!3368 lt!3356) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!873 (_ BitVec 32) (_ BitVec 32)) Unit!274)

(assert (=> d!1839 (= lt!3398 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!3361 lt!3368 lt!3356))))

(assert (=> d!1839 (= lt!3356 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(assert (=> d!1839 (= lt!3368 #b00000000000000000000000000000000)))

(assert (=> d!1839 (= lt!3361 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (=> d!1839 (= lt!3373 (LongMapFixedSize!23 defaultEntry!183 (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000000 (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (array!876 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!1839 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1839 (= (getNewLongMapFixedSize!4 (bvsub initialSize!1 #b00000000000000000000000000000001) defaultEntry!183) lt!3376)))

(assert (= (and d!1839 c!1157) b!12756))

(assert (= (and d!1839 (not c!1157)) b!12749))

(assert (= (and b!12756 c!1160) b!12752))

(assert (= (and b!12756 (not c!1160)) b!12754))

(assert (= (and d!1839 res!10182) b!12758))

(assert (= (and b!12758 res!10183) b!12760))

(declare-fun b_lambda!849 () Bool)

(assert (=> (not b_lambda!849) (not b!12756)))

(declare-fun t!2772 () Bool)

(declare-fun tb!390 () Bool)

(assert (=> (and start!1818 (= defaultEntry!183 defaultEntry!183) t!2772) tb!390))

(declare-fun result!614 () Bool)

(declare-fun tp_is_empty!640 () Bool)

(assert (=> tb!390 (= result!614 tp_is_empty!640)))

(assert (=> b!12756 t!2772))

(declare-fun b_and!873 () Bool)

(assert (= b_and!861 (and (=> t!2772 result!614) b_and!873)))

(declare-fun b_lambda!852 () Bool)

(assert (=> (not b_lambda!852) (not d!1839)))

(assert (=> d!1839 t!2772))

(declare-fun b_and!877 () Bool)

(assert (= b_and!873 (and (=> t!2772 result!614) b_and!877)))

(declare-fun m!8663 () Bool)

(assert (=> b!12752 m!8663))

(declare-fun m!8671 () Bool)

(assert (=> b!12756 m!8671))

(assert (=> b!12756 m!8671))

(declare-fun m!8675 () Bool)

(assert (=> b!12756 m!8675))

(declare-fun m!8681 () Bool)

(assert (=> b!12756 m!8681))

(declare-fun m!8683 () Bool)

(assert (=> b!12756 m!8683))

(declare-fun m!8686 () Bool)

(assert (=> b!12756 m!8686))

(assert (=> b!12756 m!8671))

(declare-fun m!8691 () Bool)

(assert (=> b!12760 m!8691))

(assert (=> d!1839 m!8671))

(declare-fun m!8696 () Bool)

(assert (=> d!1839 m!8696))

(assert (=> d!1839 m!8597))

(declare-fun m!8700 () Bool)

(assert (=> d!1839 m!8700))

(declare-fun m!8703 () Bool)

(assert (=> d!1839 m!8703))

(assert (=> d!1839 m!8683))

(declare-fun m!8705 () Bool)

(assert (=> d!1839 m!8705))

(declare-fun m!8707 () Bool)

(assert (=> d!1839 m!8707))

(declare-fun m!8711 () Bool)

(assert (=> d!1839 m!8711))

(declare-fun m!8715 () Bool)

(assert (=> d!1839 m!8715))

(assert (=> b!12691 d!1839))

(declare-fun b_lambda!859 () Bool)

(assert (= b_lambda!852 (or (and start!1818 b_free!463) b_lambda!859)))

(declare-fun b_lambda!861 () Bool)

(assert (= b_lambda!849 (or (and start!1818 b_free!463) b_lambda!861)))

(push 1)

(assert (not b!12756))

(assert (not b_lambda!859))

(assert b_and!877)

(assert (not b_next!463))

(assert tp_is_empty!640)

(assert (not d!1827))

(assert (not b!12760))

(assert (not d!1831))

(assert (not b!12752))

(assert (not d!1839))

(assert (not b_lambda!861))

(check-sat)

(pop 1)

(push 1)

(assert b_and!877)

(assert (not b_next!463))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1865 () Bool)

(declare-fun getCurrentListMap!119 (array!873 array!875 (_ BitVec 32) (_ BitVec 32) V!861 V!861 (_ BitVec 32) Int) ListLongMap!397)

(assert (=> d!1865 (= (map!243 lt!3373) (getCurrentListMap!119 (_keys!3037 lt!3373) (_values!1616 lt!3373) (mask!4434 lt!3373) (extraKeys!1532 lt!3373) (zeroValue!1555 lt!3373) (minValue!1555 lt!3373) #b00000000000000000000000000000000 (defaultEntry!1615 lt!3373)))))

(declare-fun bs!494 () Bool)

(assert (= bs!494 d!1865))

(declare-fun m!8761 () Bool)

(assert (=> bs!494 m!8761))

(assert (=> d!1839 d!1865))

(declare-fun d!1873 () Bool)

(declare-fun lt!3428 () (_ BitVec 32))

(assert (=> d!1873 (and (bvsge lt!3428 #b00000000000000000000000000000000) (bvsle lt!3428 (bvsub (size!481 lt!3361) lt!3368)))))

(declare-fun e!7684 () (_ BitVec 32))

(assert (=> d!1873 (= lt!3428 e!7684)))

(declare-fun c!1185 () Bool)

(assert (=> d!1873 (= c!1185 (bvsge lt!3368 lt!3356))))

(assert (=> d!1873 (and (bvsle lt!3368 lt!3356) (bvsge lt!3368 #b00000000000000000000000000000000) (bvsle lt!3356 (size!481 lt!3361)))))

(assert (=> d!1873 (= (arrayCountValidKeys!0 lt!3361 lt!3368 lt!3356) lt!3428)))

(declare-fun b!12839 () Bool)

(declare-fun e!7683 () (_ BitVec 32))

(declare-fun call!328 () (_ BitVec 32))

(assert (=> b!12839 (= e!7683 call!328)))

(declare-fun b!12840 () Bool)

(assert (=> b!12840 (= e!7684 #b00000000000000000000000000000000)))

(declare-fun b!12841 () Bool)

(assert (=> b!12841 (= e!7683 (bvadd #b00000000000000000000000000000001 call!328))))

(declare-fun b!12842 () Bool)

(assert (=> b!12842 (= e!7684 e!7683)))

(declare-fun c!1184 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!12842 (= c!1184 (validKeyInArray!0 (select (arr!419 lt!3361) lt!3368)))))

(declare-fun bm!325 () Bool)

(assert (=> bm!325 (= call!328 (arrayCountValidKeys!0 lt!3361 (bvadd lt!3368 #b00000000000000000000000000000001) lt!3356))))

(assert (= (and d!1873 c!1185) b!12840))

(assert (= (and d!1873 (not c!1185)) b!12842))

(assert (= (and b!12842 c!1184) b!12841))

(assert (= (and b!12842 (not c!1184)) b!12839))

(assert (= (or b!12841 b!12839) bm!325))

(declare-fun m!8765 () Bool)

(assert (=> b!12842 m!8765))

(assert (=> b!12842 m!8765))

(declare-fun m!8771 () Bool)

(assert (=> b!12842 m!8771))

(declare-fun m!8775 () Bool)

(assert (=> bm!325 m!8775))

(assert (=> d!1839 d!1873))

(assert (=> d!1839 d!1819))

(declare-fun d!1879 () Bool)

(assert (=> d!1879 (arrayNoDuplicates!0 lt!3358 lt!3369 lt!3370)))

(declare-fun lt!3435 () Unit!274)

(declare-fun choose!111 (array!873 (_ BitVec 32) (_ BitVec 32) List!384) Unit!274)

(assert (=> d!1879 (= lt!3435 (choose!111 lt!3358 lt!3369 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3370))))

(assert (=> d!1879 (= (size!481 lt!3358) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(assert (=> d!1879 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!3358 lt!3369 (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001) lt!3370) lt!3435)))

(declare-fun bs!495 () Bool)

(assert (= bs!495 d!1879))

(assert (=> bs!495 m!8700))

(declare-fun m!8789 () Bool)

(assert (=> bs!495 m!8789))

(assert (=> d!1839 d!1879))

(declare-fun d!1885 () Bool)

(declare-fun res!10226 () Bool)

(declare-fun e!7703 () Bool)

(assert (=> d!1885 (=> (not res!10226) (not e!7703))))

(declare-fun simpleValid!7 (LongMapFixedSize!22) Bool)

(assert (=> d!1885 (= res!10226 (simpleValid!7 lt!3376))))

(assert (=> d!1885 (= (valid!17 lt!3376) e!7703)))

(declare-fun b!12873 () Bool)

(declare-fun res!10227 () Bool)

(assert (=> b!12873 (=> (not res!10227) (not e!7703))))

(assert (=> b!12873 (= res!10227 (= (arrayCountValidKeys!0 (_keys!3037 lt!3376) #b00000000000000000000000000000000 (size!481 (_keys!3037 lt!3376))) (_size!42 lt!3376)))))

(declare-fun b!12874 () Bool)

(declare-fun res!10228 () Bool)

(assert (=> b!12874 (=> (not res!10228) (not e!7703))))

(assert (=> b!12874 (= res!10228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3037 lt!3376) (mask!4434 lt!3376)))))

(declare-fun b!12875 () Bool)

(assert (=> b!12875 (= e!7703 (arrayNoDuplicates!0 (_keys!3037 lt!3376) #b00000000000000000000000000000000 Nil!381))))

(assert (= (and d!1885 res!10226) b!12873))

(assert (= (and b!12873 res!10227) b!12874))

(assert (= (and b!12874 res!10228) b!12875))

(declare-fun m!8795 () Bool)

(assert (=> d!1885 m!8795))

(declare-fun m!8797 () Bool)

(assert (=> b!12873 m!8797))

(declare-fun m!8799 () Bool)

(assert (=> b!12874 m!8799))

(declare-fun m!8801 () Bool)

(assert (=> b!12875 m!8801))

(assert (=> d!1839 d!1885))

(declare-fun b!12896 () Bool)

(declare-fun e!7719 () Bool)

(declare-fun call!338 () Bool)

(assert (=> b!12896 (= e!7719 call!338)))

(declare-fun bm!335 () Bool)

(assert (=> bm!335 (= call!338 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!3382 #b00000000000000000000000000000001) lt!3391 (bvsub initialSize!1 #b00000000000000000000000000000001)))))

(declare-fun b!12897 () Bool)

(declare-fun e!7718 () Bool)

(declare-fun e!7717 () Bool)

(assert (=> b!12897 (= e!7718 e!7717)))

(declare-fun c!1199 () Bool)

(assert (=> b!12897 (= c!1199 (validKeyInArray!0 (select (arr!419 lt!3391) lt!3382)))))

(declare-fun b!12898 () Bool)

(assert (=> b!12898 (= e!7717 call!338)))

(declare-fun b!12899 () Bool)

(assert (=> b!12899 (= e!7717 e!7719)))

(declare-fun lt!3456 () (_ BitVec 64))

(assert (=> b!12899 (= lt!3456 (select (arr!419 lt!3391) lt!3382))))

(declare-fun lt!3454 () Unit!274)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!873 (_ BitVec 64) (_ BitVec 32)) Unit!274)

(assert (=> b!12899 (= lt!3454 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!3391 lt!3456 lt!3382))))

(assert (=> b!12899 (arrayContainsKey!0 lt!3391 lt!3456 #b00000000000000000000000000000000)))

(declare-fun lt!3455 () Unit!274)

(assert (=> b!12899 (= lt!3455 lt!3454)))

(declare-fun res!10239 () Bool)

(declare-datatypes ((SeekEntryResult!40 0))(
  ( (MissingZero!40 (index!2279 (_ BitVec 32))) (Found!40 (index!2280 (_ BitVec 32))) (Intermediate!40 (undefined!852 Bool) (index!2281 (_ BitVec 32)) (x!3356 (_ BitVec 32))) (Undefined!40) (MissingVacant!40 (index!2282 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!873 (_ BitVec 32)) SeekEntryResult!40)

(assert (=> b!12899 (= res!10239 (= (seekEntryOrOpen!0 (select (arr!419 lt!3391) lt!3382) lt!3391 (bvsub initialSize!1 #b00000000000000000000000000000001)) (Found!40 lt!3382)))))

(assert (=> b!12899 (=> (not res!10239) (not e!7719))))

(declare-fun d!1891 () Bool)

(declare-fun res!10240 () Bool)

(assert (=> d!1891 (=> res!10240 e!7718)))

(assert (=> d!1891 (= res!10240 (bvsge lt!3382 (size!481 lt!3391)))))

(assert (=> d!1891 (= (arrayForallSeekEntryOrOpenFound!0 lt!3382 lt!3391 (bvsub initialSize!1 #b00000000000000000000000000000001)) e!7718)))

(assert (= (and d!1891 (not res!10240)) b!12897))

(assert (= (and b!12897 c!1199) b!12899))

(assert (= (and b!12897 (not c!1199)) b!12898))

(assert (= (and b!12899 res!10239) b!12896))

(assert (= (or b!12896 b!12898) bm!335))

(declare-fun m!8827 () Bool)

(assert (=> bm!335 m!8827))

(declare-fun m!8829 () Bool)

(assert (=> b!12897 m!8829))

(assert (=> b!12897 m!8829))

(declare-fun m!8831 () Bool)

(assert (=> b!12897 m!8831))

(assert (=> b!12899 m!8829))

(declare-fun m!8833 () Bool)

(assert (=> b!12899 m!8833))

(declare-fun m!8835 () Bool)

(assert (=> b!12899 m!8835))

(assert (=> b!12899 m!8829))

(declare-fun m!8837 () Bool)

(assert (=> b!12899 m!8837))

(assert (=> d!1839 d!1891))

(declare-fun d!1901 () Bool)

(assert (=> d!1901 (= (arrayCountValidKeys!0 lt!3361 lt!3368 lt!3356) #b00000000000000000000000000000000)))

(declare-fun lt!3465 () Unit!274)

(declare-fun choose!59 (array!873 (_ BitVec 32) (_ BitVec 32)) Unit!274)

(assert (=> d!1901 (= lt!3465 (choose!59 lt!3361 lt!3368 lt!3356))))

(assert (=> d!1901 (bvslt (size!481 lt!3361) #b01111111111111111111111111111111)))

(assert (=> d!1901 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!3361 lt!3368 lt!3356) lt!3465)))

(declare-fun bs!499 () Bool)

(assert (= bs!499 d!1901))

(assert (=> bs!499 m!8696))

(declare-fun m!8839 () Bool)

(assert (=> bs!499 m!8839))

(assert (=> d!1839 d!1901))

(declare-fun b!12925 () Bool)

(declare-fun e!7739 () Bool)

(declare-fun e!7741 () Bool)

(assert (=> b!12925 (= e!7739 e!7741)))

(declare-fun res!10257 () Bool)

(assert (=> b!12925 (=> (not res!10257) (not e!7741))))

(declare-fun e!7740 () Bool)

(assert (=> b!12925 (= res!10257 (not e!7740))))

(declare-fun res!10258 () Bool)

(assert (=> b!12925 (=> (not res!10258) (not e!7740))))

(assert (=> b!12925 (= res!10258 (validKeyInArray!0 (select (arr!419 lt!3358) lt!3369)))))

(declare-fun b!12926 () Bool)

(declare-fun e!7738 () Bool)

(declare-fun call!344 () Bool)

(assert (=> b!12926 (= e!7738 call!344)))

(declare-fun b!12927 () Bool)

(assert (=> b!12927 (= e!7741 e!7738)))

(declare-fun c!1205 () Bool)

(assert (=> b!12927 (= c!1205 (validKeyInArray!0 (select (arr!419 lt!3358) lt!3369)))))

(declare-fun b!12928 () Bool)

(assert (=> b!12928 (= e!7738 call!344)))

(declare-fun d!1903 () Bool)

(declare-fun res!10256 () Bool)

(assert (=> d!1903 (=> res!10256 e!7739)))

(assert (=> d!1903 (= res!10256 (bvsge lt!3369 (size!481 lt!3358)))))

(assert (=> d!1903 (= (arrayNoDuplicates!0 lt!3358 lt!3369 lt!3370) e!7739)))

(declare-fun bm!341 () Bool)

(assert (=> bm!341 (= call!344 (arrayNoDuplicates!0 lt!3358 (bvadd lt!3369 #b00000000000000000000000000000001) (ite c!1205 (Cons!380 (select (arr!419 lt!3358) lt!3369) lt!3370) lt!3370)))))

(declare-fun b!12929 () Bool)

(declare-fun contains!190 (List!384 (_ BitVec 64)) Bool)

(assert (=> b!12929 (= e!7740 (contains!190 lt!3370 (select (arr!419 lt!3358) lt!3369)))))

(assert (= (and d!1903 (not res!10256)) b!12925))

(assert (= (and b!12925 res!10258) b!12929))

(assert (= (and b!12925 res!10257) b!12927))

(assert (= (and b!12927 c!1205) b!12926))

(assert (= (and b!12927 (not c!1205)) b!12928))

(assert (= (or b!12926 b!12928) bm!341))

(declare-fun m!8863 () Bool)

(assert (=> b!12925 m!8863))

(assert (=> b!12925 m!8863))

(declare-fun m!8865 () Bool)

(assert (=> b!12925 m!8865))

(assert (=> b!12927 m!8863))

(assert (=> b!12927 m!8863))

(assert (=> b!12927 m!8865))

(assert (=> bm!341 m!8863))

(declare-fun m!8867 () Bool)

(assert (=> bm!341 m!8867))

(assert (=> b!12929 m!8863))

(assert (=> b!12929 m!8863))

(declare-fun m!8869 () Bool)

(assert (=> b!12929 m!8869))

(assert (=> d!1839 d!1903))

(declare-fun d!1911 () Bool)

(assert (=> d!1911 (arrayForallSeekEntryOrOpenFound!0 lt!3382 lt!3391 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(declare-fun lt!3474 () Unit!274)

(declare-fun choose!34 (array!873 (_ BitVec 32) (_ BitVec 32)) Unit!274)

(assert (=> d!1911 (= lt!3474 (choose!34 lt!3391 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3382))))

(assert (=> d!1911 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1911 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!3391 (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3382) lt!3474)))

(declare-fun bs!501 () Bool)

(assert (= bs!501 d!1911))

(assert (=> bs!501 m!8703))

(declare-fun m!8871 () Bool)

(assert (=> bs!501 m!8871))

(assert (=> bs!501 m!8597))

(assert (=> d!1839 d!1911))

(declare-fun d!1913 () Bool)

(declare-fun res!10272 () Bool)

(declare-fun e!7758 () Bool)

(assert (=> d!1913 (=> res!10272 e!7758)))

(assert (=> d!1913 (= res!10272 (= (select (arr!419 lt!3395) #b00000000000000000000000000000000) (_1!228 lt!3372)))))

(assert (=> d!1913 (= (arrayContainsKey!0 lt!3395 (_1!228 lt!3372) #b00000000000000000000000000000000) e!7758)))

(declare-fun b!12949 () Bool)

(declare-fun e!7759 () Bool)

(assert (=> b!12949 (= e!7758 e!7759)))

(declare-fun res!10273 () Bool)

(assert (=> b!12949 (=> (not res!10273) (not e!7759))))

(assert (=> b!12949 (= res!10273 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!481 lt!3395)))))

(declare-fun b!12950 () Bool)

(assert (=> b!12950 (= e!7759 (arrayContainsKey!0 lt!3395 (_1!228 lt!3372) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!1913 (not res!10272)) b!12949))

(assert (= (and b!12949 res!10273) b!12950))

(declare-fun m!8881 () Bool)

(assert (=> d!1913 m!8881))

(declare-fun m!8883 () Bool)

(assert (=> b!12950 m!8883))

(assert (=> b!12752 d!1913))

(declare-fun d!1917 () Bool)

(assert (=> d!1917 (= (head!780 (toList!214 (map!243 lt!3373))) (h!945 (toList!214 (map!243 lt!3373))))))

(assert (=> b!12756 d!1917))

(assert (=> b!12756 d!1865))

(declare-fun d!1919 () Bool)

(declare-fun e!7768 () Bool)

(assert (=> d!1919 e!7768))

(declare-fun c!1211 () Bool)

(assert (=> d!1919 (= c!1211 (and (not (= (_1!228 lt!3372) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!228 lt!3372) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!3477 () Unit!274)

(declare-fun choose!167 (array!873 array!875 (_ BitVec 32) (_ BitVec 32) V!861 V!861 (_ BitVec 64) Int) Unit!274)

(assert (=> d!1919 (= lt!3477 (choose!167 lt!3395 (array!876 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3385 (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!228 lt!3372) defaultEntry!183))))

(assert (=> d!1919 (validMask!0 (bvsub initialSize!1 #b00000000000000000000000000000001))))

(assert (=> d!1919 (= (lemmaKeyInListMapIsInArray!77 lt!3395 (array!876 ((as const (Array (_ BitVec 32) ValueCell!218)) EmptyCell!218) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (bvsub initialSize!1 #b00000000000000000000000000000001) lt!3385 (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!80 defaultEntry!183 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!228 lt!3372) defaultEntry!183) lt!3477)))

(declare-fun b!12961 () Bool)

(assert (=> b!12961 (= e!7768 (arrayContainsKey!0 lt!3395 (_1!228 lt!3372) #b00000000000000000000000000000000))))

(declare-fun b!12962 () Bool)

(assert (=> b!12962 (= e!7768 (ite (= (_1!228 lt!3372) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!3385 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!3385 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!1919 c!1211) b!12961))

(assert (= (and d!1919 (not c!1211)) b!12962))

(assert (=> d!1919 m!8671))

(assert (=> d!1919 m!8671))

(declare-fun m!8891 () Bool)

(assert (=> d!1919 m!8891))

(assert (=> d!1919 m!8597))

(assert (=> b!12961 m!8663))

(assert (=> b!12756 d!1919))

(declare-fun d!1923 () Bool)

(declare-fun lt!3480 () (_ BitVec 32))

(assert (=> d!1923 (and (or (bvslt lt!3480 #b00000000000000000000000000000000) (bvsge lt!3480 (size!481 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (and (bvsge lt!3480 #b00000000000000000000000000000000) (bvslt lt!3480 (size!481 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))) (bvsge lt!3480 #b00000000000000000000000000000000) (bvslt lt!3480 (size!481 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (= (select (arr!419 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) lt!3480) (_1!228 lt!3372)))))

(declare-fun e!7771 () (_ BitVec 32))

(assert (=> d!1923 (= lt!3480 e!7771)))

(declare-fun c!1214 () Bool)

(assert (=> d!1923 (= c!1214 (= (select (arr!419 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) #b00000000000000000000000000000000) (_1!228 lt!3372)))))

(assert (=> d!1923 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!481 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))) (bvslt (size!481 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) #b01111111111111111111111111111111))))

(assert (=> d!1923 (= (arrayScanForKey!0 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!228 lt!3372) #b00000000000000000000000000000000) lt!3480)))

(declare-fun b!12967 () Bool)

(assert (=> b!12967 (= e!7771 #b00000000000000000000000000000000)))

(declare-fun b!12968 () Bool)

(assert (=> b!12968 (= e!7771 (arrayScanForKey!0 (array!874 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (bvsub initialSize!1 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (_1!228 lt!3372) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!1923 c!1214) b!12967))

(assert (= (and d!1923 (not c!1214)) b!12968))

(declare-fun m!8893 () Bool)

(assert (=> d!1923 m!8893))

(declare-fun m!8895 () Bool)

(assert (=> d!1923 m!8895))

(declare-fun m!8897 () Bool)

(assert (=> b!12968 m!8897))

(assert (=> b!12756 d!1923))

(declare-fun d!1925 () Bool)

(declare-fun res!10280 () Bool)

(declare-fun e!7772 () Bool)

(assert (=> d!1925 (=> (not res!10280) (not e!7772))))

