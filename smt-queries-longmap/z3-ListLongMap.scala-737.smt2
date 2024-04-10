; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17184 () Bool)

(assert start!17184)

(declare-fun b!172541 () Bool)

(declare-fun b_free!4263 () Bool)

(declare-fun b_next!4263 () Bool)

(assert (=> b!172541 (= b_free!4263 (not b_next!4263))))

(declare-fun tp!15439 () Bool)

(declare-fun b_and!10703 () Bool)

(assert (=> b!172541 (= tp!15439 b_and!10703)))

(declare-fun b!172540 () Bool)

(declare-fun e!113903 () Bool)

(declare-fun tp_is_empty!4035 () Bool)

(assert (=> b!172540 (= e!113903 tp_is_empty!4035)))

(declare-fun e!113908 () Bool)

(declare-datatypes ((V!5027 0))(
  ( (V!5028 (val!2062 Int)) )
))
(declare-datatypes ((ValueCell!1674 0))(
  ( (ValueCellFull!1674 (v!3930 V!5027)) (EmptyCell!1674) )
))
(declare-datatypes ((array!7193 0))(
  ( (array!7194 (arr!3419 (Array (_ BitVec 32) (_ BitVec 64))) (size!3716 (_ BitVec 32))) )
))
(declare-datatypes ((array!7195 0))(
  ( (array!7196 (arr!3420 (Array (_ BitVec 32) ValueCell!1674)) (size!3717 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2256 0))(
  ( (LongMapFixedSize!2257 (defaultEntry!3574 Int) (mask!8422 (_ BitVec 32)) (extraKeys!3313 (_ BitVec 32)) (zeroValue!3415 V!5027) (minValue!3417 V!5027) (_size!1177 (_ BitVec 32)) (_keys!5411 array!7193) (_values!3557 array!7195) (_vacant!1177 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2256)

(declare-fun e!113905 () Bool)

(declare-fun array_inv!2189 (array!7193) Bool)

(declare-fun array_inv!2190 (array!7195) Bool)

(assert (=> b!172541 (= e!113905 (and tp!15439 tp_is_empty!4035 (array_inv!2189 (_keys!5411 thiss!1248)) (array_inv!2190 (_values!3557 thiss!1248)) e!113908))))

(declare-fun res!81925 () Bool)

(declare-fun e!113904 () Bool)

(assert (=> start!17184 (=> (not res!81925) (not e!113904))))

(declare-fun valid!957 (LongMapFixedSize!2256) Bool)

(assert (=> start!17184 (= res!81925 (valid!957 thiss!1248))))

(assert (=> start!17184 e!113904))

(assert (=> start!17184 e!113905))

(assert (=> start!17184 true))

(declare-fun b!172542 () Bool)

(declare-fun e!113906 () Bool)

(assert (=> b!172542 (= e!113906 tp_is_empty!4035)))

(declare-fun mapNonEmpty!6865 () Bool)

(declare-fun mapRes!6865 () Bool)

(declare-fun tp!15438 () Bool)

(assert (=> mapNonEmpty!6865 (= mapRes!6865 (and tp!15438 e!113903))))

(declare-fun mapValue!6865 () ValueCell!1674)

(declare-fun mapRest!6865 () (Array (_ BitVec 32) ValueCell!1674))

(declare-fun mapKey!6865 () (_ BitVec 32))

(assert (=> mapNonEmpty!6865 (= (arr!3420 (_values!3557 thiss!1248)) (store mapRest!6865 mapKey!6865 mapValue!6865))))

(declare-fun b!172543 () Bool)

(declare-fun res!81926 () Bool)

(assert (=> b!172543 (=> (not res!81926) (not e!113904))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172543 (= res!81926 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!6865 () Bool)

(assert (=> mapIsEmpty!6865 mapRes!6865))

(declare-fun b!172544 () Bool)

(assert (=> b!172544 (= e!113908 (and e!113906 mapRes!6865))))

(declare-fun condMapEmpty!6865 () Bool)

(declare-fun mapDefault!6865 () ValueCell!1674)

(assert (=> b!172544 (= condMapEmpty!6865 (= (arr!3420 (_values!3557 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1674)) mapDefault!6865)))))

(declare-fun b!172545 () Bool)

(declare-fun res!81927 () Bool)

(assert (=> b!172545 (=> (not res!81927) (not e!113904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172545 (= res!81927 (validMask!0 (mask!8422 thiss!1248)))))

(declare-fun b!172546 () Bool)

(assert (=> b!172546 (= e!113904 (and (= (size!3717 (_values!3557 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8422 thiss!1248))) (= (size!3716 (_keys!5411 thiss!1248)) (size!3717 (_values!3557 thiss!1248))) (bvsge (mask!8422 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3313 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and start!17184 res!81925) b!172543))

(assert (= (and b!172543 res!81926) b!172545))

(assert (= (and b!172545 res!81927) b!172546))

(assert (= (and b!172544 condMapEmpty!6865) mapIsEmpty!6865))

(assert (= (and b!172544 (not condMapEmpty!6865)) mapNonEmpty!6865))

(get-info :version)

(assert (= (and mapNonEmpty!6865 ((_ is ValueCellFull!1674) mapValue!6865)) b!172540))

(assert (= (and b!172544 ((_ is ValueCellFull!1674) mapDefault!6865)) b!172542))

(assert (= b!172541 b!172544))

(assert (= start!17184 b!172541))

(declare-fun m!201279 () Bool)

(assert (=> b!172541 m!201279))

(declare-fun m!201281 () Bool)

(assert (=> b!172541 m!201281))

(declare-fun m!201283 () Bool)

(assert (=> start!17184 m!201283))

(declare-fun m!201285 () Bool)

(assert (=> mapNonEmpty!6865 m!201285))

(declare-fun m!201287 () Bool)

(assert (=> b!172545 m!201287))

(check-sat (not b!172545) (not start!17184) (not b_next!4263) (not mapNonEmpty!6865) tp_is_empty!4035 (not b!172541) b_and!10703)
(check-sat b_and!10703 (not b_next!4263))
(get-model)

(declare-fun d!52519 () Bool)

(assert (=> d!52519 (= (validMask!0 (mask!8422 thiss!1248)) (and (or (= (mask!8422 thiss!1248) #b00000000000000000000000000000111) (= (mask!8422 thiss!1248) #b00000000000000000000000000001111) (= (mask!8422 thiss!1248) #b00000000000000000000000000011111) (= (mask!8422 thiss!1248) #b00000000000000000000000000111111) (= (mask!8422 thiss!1248) #b00000000000000000000000001111111) (= (mask!8422 thiss!1248) #b00000000000000000000000011111111) (= (mask!8422 thiss!1248) #b00000000000000000000000111111111) (= (mask!8422 thiss!1248) #b00000000000000000000001111111111) (= (mask!8422 thiss!1248) #b00000000000000000000011111111111) (= (mask!8422 thiss!1248) #b00000000000000000000111111111111) (= (mask!8422 thiss!1248) #b00000000000000000001111111111111) (= (mask!8422 thiss!1248) #b00000000000000000011111111111111) (= (mask!8422 thiss!1248) #b00000000000000000111111111111111) (= (mask!8422 thiss!1248) #b00000000000000001111111111111111) (= (mask!8422 thiss!1248) #b00000000000000011111111111111111) (= (mask!8422 thiss!1248) #b00000000000000111111111111111111) (= (mask!8422 thiss!1248) #b00000000000001111111111111111111) (= (mask!8422 thiss!1248) #b00000000000011111111111111111111) (= (mask!8422 thiss!1248) #b00000000000111111111111111111111) (= (mask!8422 thiss!1248) #b00000000001111111111111111111111) (= (mask!8422 thiss!1248) #b00000000011111111111111111111111) (= (mask!8422 thiss!1248) #b00000000111111111111111111111111) (= (mask!8422 thiss!1248) #b00000001111111111111111111111111) (= (mask!8422 thiss!1248) #b00000011111111111111111111111111) (= (mask!8422 thiss!1248) #b00000111111111111111111111111111) (= (mask!8422 thiss!1248) #b00001111111111111111111111111111) (= (mask!8422 thiss!1248) #b00011111111111111111111111111111) (= (mask!8422 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8422 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172545 d!52519))

(declare-fun d!52521 () Bool)

(assert (=> d!52521 (= (array_inv!2189 (_keys!5411 thiss!1248)) (bvsge (size!3716 (_keys!5411 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172541 d!52521))

(declare-fun d!52523 () Bool)

(assert (=> d!52523 (= (array_inv!2190 (_values!3557 thiss!1248)) (bvsge (size!3717 (_values!3557 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172541 d!52523))

(declare-fun d!52525 () Bool)

(declare-fun res!81943 () Bool)

(declare-fun e!113929 () Bool)

(assert (=> d!52525 (=> (not res!81943) (not e!113929))))

(declare-fun simpleValid!140 (LongMapFixedSize!2256) Bool)

(assert (=> d!52525 (= res!81943 (simpleValid!140 thiss!1248))))

(assert (=> d!52525 (= (valid!957 thiss!1248) e!113929)))

(declare-fun b!172574 () Bool)

(declare-fun res!81944 () Bool)

(assert (=> b!172574 (=> (not res!81944) (not e!113929))))

(declare-fun arrayCountValidKeys!0 (array!7193 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172574 (= res!81944 (= (arrayCountValidKeys!0 (_keys!5411 thiss!1248) #b00000000000000000000000000000000 (size!3716 (_keys!5411 thiss!1248))) (_size!1177 thiss!1248)))))

(declare-fun b!172575 () Bool)

(declare-fun res!81945 () Bool)

(assert (=> b!172575 (=> (not res!81945) (not e!113929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7193 (_ BitVec 32)) Bool)

(assert (=> b!172575 (= res!81945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5411 thiss!1248) (mask!8422 thiss!1248)))))

(declare-fun b!172576 () Bool)

(declare-datatypes ((List!2200 0))(
  ( (Nil!2197) (Cons!2196 (h!2813 (_ BitVec 64)) (t!7007 List!2200)) )
))
(declare-fun arrayNoDuplicates!0 (array!7193 (_ BitVec 32) List!2200) Bool)

(assert (=> b!172576 (= e!113929 (arrayNoDuplicates!0 (_keys!5411 thiss!1248) #b00000000000000000000000000000000 Nil!2197))))

(assert (= (and d!52525 res!81943) b!172574))

(assert (= (and b!172574 res!81944) b!172575))

(assert (= (and b!172575 res!81945) b!172576))

(declare-fun m!201299 () Bool)

(assert (=> d!52525 m!201299))

(declare-fun m!201301 () Bool)

(assert (=> b!172574 m!201301))

(declare-fun m!201303 () Bool)

(assert (=> b!172575 m!201303))

(declare-fun m!201305 () Bool)

(assert (=> b!172576 m!201305))

(assert (=> start!17184 d!52525))

(declare-fun condMapEmpty!6871 () Bool)

(declare-fun mapDefault!6871 () ValueCell!1674)

(assert (=> mapNonEmpty!6865 (= condMapEmpty!6871 (= mapRest!6865 ((as const (Array (_ BitVec 32) ValueCell!1674)) mapDefault!6871)))))

(declare-fun e!113935 () Bool)

(declare-fun mapRes!6871 () Bool)

(assert (=> mapNonEmpty!6865 (= tp!15438 (and e!113935 mapRes!6871))))

(declare-fun mapNonEmpty!6871 () Bool)

(declare-fun tp!15448 () Bool)

(declare-fun e!113934 () Bool)

(assert (=> mapNonEmpty!6871 (= mapRes!6871 (and tp!15448 e!113934))))

(declare-fun mapRest!6871 () (Array (_ BitVec 32) ValueCell!1674))

(declare-fun mapValue!6871 () ValueCell!1674)

(declare-fun mapKey!6871 () (_ BitVec 32))

(assert (=> mapNonEmpty!6871 (= mapRest!6865 (store mapRest!6871 mapKey!6871 mapValue!6871))))

(declare-fun mapIsEmpty!6871 () Bool)

(assert (=> mapIsEmpty!6871 mapRes!6871))

(declare-fun b!172584 () Bool)

(assert (=> b!172584 (= e!113935 tp_is_empty!4035)))

(declare-fun b!172583 () Bool)

(assert (=> b!172583 (= e!113934 tp_is_empty!4035)))

(assert (= (and mapNonEmpty!6865 condMapEmpty!6871) mapIsEmpty!6871))

(assert (= (and mapNonEmpty!6865 (not condMapEmpty!6871)) mapNonEmpty!6871))

(assert (= (and mapNonEmpty!6871 ((_ is ValueCellFull!1674) mapValue!6871)) b!172583))

(assert (= (and mapNonEmpty!6865 ((_ is ValueCellFull!1674) mapDefault!6871)) b!172584))

(declare-fun m!201307 () Bool)

(assert (=> mapNonEmpty!6871 m!201307))

(check-sat (not b!172575) (not b_next!4263) (not mapNonEmpty!6871) tp_is_empty!4035 (not d!52525) (not b!172574) (not b!172576) b_and!10703)
(check-sat b_and!10703 (not b_next!4263))
(get-model)

(declare-fun b!172595 () Bool)

(declare-fun e!113947 () Bool)

(declare-fun e!113946 () Bool)

(assert (=> b!172595 (= e!113947 e!113946)))

(declare-fun res!81952 () Bool)

(assert (=> b!172595 (=> (not res!81952) (not e!113946))))

(declare-fun e!113945 () Bool)

(assert (=> b!172595 (= res!81952 (not e!113945))))

(declare-fun res!81953 () Bool)

(assert (=> b!172595 (=> (not res!81953) (not e!113945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172595 (= res!81953 (validKeyInArray!0 (select (arr!3419 (_keys!5411 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172596 () Bool)

(declare-fun contains!1151 (List!2200 (_ BitVec 64)) Bool)

(assert (=> b!172596 (= e!113945 (contains!1151 Nil!2197 (select (arr!3419 (_keys!5411 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172597 () Bool)

(declare-fun e!113944 () Bool)

(declare-fun call!17533 () Bool)

(assert (=> b!172597 (= e!113944 call!17533)))

(declare-fun d!52527 () Bool)

(declare-fun res!81954 () Bool)

(assert (=> d!52527 (=> res!81954 e!113947)))

(assert (=> d!52527 (= res!81954 (bvsge #b00000000000000000000000000000000 (size!3716 (_keys!5411 thiss!1248))))))

(assert (=> d!52527 (= (arrayNoDuplicates!0 (_keys!5411 thiss!1248) #b00000000000000000000000000000000 Nil!2197) e!113947)))

(declare-fun b!172598 () Bool)

(assert (=> b!172598 (= e!113946 e!113944)))

(declare-fun c!30866 () Bool)

(assert (=> b!172598 (= c!30866 (validKeyInArray!0 (select (arr!3419 (_keys!5411 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172599 () Bool)

(assert (=> b!172599 (= e!113944 call!17533)))

(declare-fun bm!17530 () Bool)

(assert (=> bm!17530 (= call!17533 (arrayNoDuplicates!0 (_keys!5411 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30866 (Cons!2196 (select (arr!3419 (_keys!5411 thiss!1248)) #b00000000000000000000000000000000) Nil!2197) Nil!2197)))))

(assert (= (and d!52527 (not res!81954)) b!172595))

(assert (= (and b!172595 res!81953) b!172596))

(assert (= (and b!172595 res!81952) b!172598))

(assert (= (and b!172598 c!30866) b!172599))

(assert (= (and b!172598 (not c!30866)) b!172597))

(assert (= (or b!172599 b!172597) bm!17530))

(declare-fun m!201309 () Bool)

(assert (=> b!172595 m!201309))

(assert (=> b!172595 m!201309))

(declare-fun m!201311 () Bool)

(assert (=> b!172595 m!201311))

(assert (=> b!172596 m!201309))

(assert (=> b!172596 m!201309))

(declare-fun m!201313 () Bool)

(assert (=> b!172596 m!201313))

(assert (=> b!172598 m!201309))

(assert (=> b!172598 m!201309))

(assert (=> b!172598 m!201311))

(assert (=> bm!17530 m!201309))

(declare-fun m!201315 () Bool)

(assert (=> bm!17530 m!201315))

(assert (=> b!172576 d!52527))

(declare-fun d!52529 () Bool)

(declare-fun res!81959 () Bool)

(declare-fun e!113955 () Bool)

(assert (=> d!52529 (=> res!81959 e!113955)))

(assert (=> d!52529 (= res!81959 (bvsge #b00000000000000000000000000000000 (size!3716 (_keys!5411 thiss!1248))))))

(assert (=> d!52529 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5411 thiss!1248) (mask!8422 thiss!1248)) e!113955)))

(declare-fun b!172608 () Bool)

(declare-fun e!113954 () Bool)

(declare-fun e!113956 () Bool)

(assert (=> b!172608 (= e!113954 e!113956)))

(declare-fun lt!85677 () (_ BitVec 64))

(assert (=> b!172608 (= lt!85677 (select (arr!3419 (_keys!5411 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5306 0))(
  ( (Unit!5307) )
))
(declare-fun lt!85676 () Unit!5306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7193 (_ BitVec 64) (_ BitVec 32)) Unit!5306)

(assert (=> b!172608 (= lt!85676 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5411 thiss!1248) lt!85677 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172608 (arrayContainsKey!0 (_keys!5411 thiss!1248) lt!85677 #b00000000000000000000000000000000)))

(declare-fun lt!85678 () Unit!5306)

(assert (=> b!172608 (= lt!85678 lt!85676)))

(declare-fun res!81960 () Bool)

(declare-datatypes ((SeekEntryResult!538 0))(
  ( (MissingZero!538 (index!4320 (_ BitVec 32))) (Found!538 (index!4321 (_ BitVec 32))) (Intermediate!538 (undefined!1350 Bool) (index!4322 (_ BitVec 32)) (x!19075 (_ BitVec 32))) (Undefined!538) (MissingVacant!538 (index!4323 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7193 (_ BitVec 32)) SeekEntryResult!538)

(assert (=> b!172608 (= res!81960 (= (seekEntryOrOpen!0 (select (arr!3419 (_keys!5411 thiss!1248)) #b00000000000000000000000000000000) (_keys!5411 thiss!1248) (mask!8422 thiss!1248)) (Found!538 #b00000000000000000000000000000000)))))

(assert (=> b!172608 (=> (not res!81960) (not e!113956))))

(declare-fun bm!17533 () Bool)

(declare-fun call!17536 () Bool)

(assert (=> bm!17533 (= call!17536 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5411 thiss!1248) (mask!8422 thiss!1248)))))

(declare-fun b!172609 () Bool)

(assert (=> b!172609 (= e!113956 call!17536)))

(declare-fun b!172610 () Bool)

(assert (=> b!172610 (= e!113954 call!17536)))

(declare-fun b!172611 () Bool)

(assert (=> b!172611 (= e!113955 e!113954)))

(declare-fun c!30869 () Bool)

(assert (=> b!172611 (= c!30869 (validKeyInArray!0 (select (arr!3419 (_keys!5411 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52529 (not res!81959)) b!172611))

(assert (= (and b!172611 c!30869) b!172608))

(assert (= (and b!172611 (not c!30869)) b!172610))

(assert (= (and b!172608 res!81960) b!172609))

(assert (= (or b!172609 b!172610) bm!17533))

(assert (=> b!172608 m!201309))

(declare-fun m!201317 () Bool)

(assert (=> b!172608 m!201317))

(declare-fun m!201319 () Bool)

(assert (=> b!172608 m!201319))

(assert (=> b!172608 m!201309))

(declare-fun m!201321 () Bool)

(assert (=> b!172608 m!201321))

(declare-fun m!201323 () Bool)

(assert (=> bm!17533 m!201323))

(assert (=> b!172611 m!201309))

(assert (=> b!172611 m!201309))

(assert (=> b!172611 m!201311))

(assert (=> b!172575 d!52529))

(declare-fun b!172620 () Bool)

(declare-fun e!113961 () (_ BitVec 32))

(declare-fun e!113962 () (_ BitVec 32))

(assert (=> b!172620 (= e!113961 e!113962)))

(declare-fun c!30875 () Bool)

(assert (=> b!172620 (= c!30875 (validKeyInArray!0 (select (arr!3419 (_keys!5411 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52531 () Bool)

(declare-fun lt!85681 () (_ BitVec 32))

(assert (=> d!52531 (and (bvsge lt!85681 #b00000000000000000000000000000000) (bvsle lt!85681 (bvsub (size!3716 (_keys!5411 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52531 (= lt!85681 e!113961)))

(declare-fun c!30874 () Bool)

(assert (=> d!52531 (= c!30874 (bvsge #b00000000000000000000000000000000 (size!3716 (_keys!5411 thiss!1248))))))

(assert (=> d!52531 (and (bvsle #b00000000000000000000000000000000 (size!3716 (_keys!5411 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3716 (_keys!5411 thiss!1248)) (size!3716 (_keys!5411 thiss!1248))))))

(assert (=> d!52531 (= (arrayCountValidKeys!0 (_keys!5411 thiss!1248) #b00000000000000000000000000000000 (size!3716 (_keys!5411 thiss!1248))) lt!85681)))

(declare-fun b!172621 () Bool)

(declare-fun call!17539 () (_ BitVec 32))

(assert (=> b!172621 (= e!113962 (bvadd #b00000000000000000000000000000001 call!17539))))

(declare-fun b!172622 () Bool)

(assert (=> b!172622 (= e!113962 call!17539)))

(declare-fun b!172623 () Bool)

(assert (=> b!172623 (= e!113961 #b00000000000000000000000000000000)))

(declare-fun bm!17536 () Bool)

(assert (=> bm!17536 (= call!17539 (arrayCountValidKeys!0 (_keys!5411 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3716 (_keys!5411 thiss!1248))))))

(assert (= (and d!52531 c!30874) b!172623))

(assert (= (and d!52531 (not c!30874)) b!172620))

(assert (= (and b!172620 c!30875) b!172621))

(assert (= (and b!172620 (not c!30875)) b!172622))

(assert (= (or b!172621 b!172622) bm!17536))

(assert (=> b!172620 m!201309))

(assert (=> b!172620 m!201309))

(assert (=> b!172620 m!201311))

(declare-fun m!201325 () Bool)

(assert (=> bm!17536 m!201325))

(assert (=> b!172574 d!52531))

(declare-fun b!172634 () Bool)

(declare-fun res!81972 () Bool)

(declare-fun e!113965 () Bool)

(assert (=> b!172634 (=> (not res!81972) (not e!113965))))

(declare-fun size!3720 (LongMapFixedSize!2256) (_ BitVec 32))

(assert (=> b!172634 (= res!81972 (= (size!3720 thiss!1248) (bvadd (_size!1177 thiss!1248) (bvsdiv (bvadd (extraKeys!3313 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!52533 () Bool)

(declare-fun res!81971 () Bool)

(assert (=> d!52533 (=> (not res!81971) (not e!113965))))

(assert (=> d!52533 (= res!81971 (validMask!0 (mask!8422 thiss!1248)))))

(assert (=> d!52533 (= (simpleValid!140 thiss!1248) e!113965)))

(declare-fun b!172633 () Bool)

(declare-fun res!81969 () Bool)

(assert (=> b!172633 (=> (not res!81969) (not e!113965))))

(assert (=> b!172633 (= res!81969 (bvsge (size!3720 thiss!1248) (_size!1177 thiss!1248)))))

(declare-fun b!172635 () Bool)

(assert (=> b!172635 (= e!113965 (and (bvsge (extraKeys!3313 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3313 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1177 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172632 () Bool)

(declare-fun res!81970 () Bool)

(assert (=> b!172632 (=> (not res!81970) (not e!113965))))

(assert (=> b!172632 (= res!81970 (and (= (size!3717 (_values!3557 thiss!1248)) (bvadd (mask!8422 thiss!1248) #b00000000000000000000000000000001)) (= (size!3716 (_keys!5411 thiss!1248)) (size!3717 (_values!3557 thiss!1248))) (bvsge (_size!1177 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1177 thiss!1248) (bvadd (mask!8422 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!52533 res!81971) b!172632))

(assert (= (and b!172632 res!81970) b!172633))

(assert (= (and b!172633 res!81969) b!172634))

(assert (= (and b!172634 res!81972) b!172635))

(declare-fun m!201327 () Bool)

(assert (=> b!172634 m!201327))

(assert (=> d!52533 m!201287))

(assert (=> b!172633 m!201327))

(assert (=> d!52525 d!52533))

(declare-fun condMapEmpty!6872 () Bool)

(declare-fun mapDefault!6872 () ValueCell!1674)

(assert (=> mapNonEmpty!6871 (= condMapEmpty!6872 (= mapRest!6871 ((as const (Array (_ BitVec 32) ValueCell!1674)) mapDefault!6872)))))

(declare-fun e!113967 () Bool)

(declare-fun mapRes!6872 () Bool)

(assert (=> mapNonEmpty!6871 (= tp!15448 (and e!113967 mapRes!6872))))

(declare-fun mapNonEmpty!6872 () Bool)

(declare-fun tp!15449 () Bool)

(declare-fun e!113966 () Bool)

(assert (=> mapNonEmpty!6872 (= mapRes!6872 (and tp!15449 e!113966))))

(declare-fun mapValue!6872 () ValueCell!1674)

(declare-fun mapKey!6872 () (_ BitVec 32))

(declare-fun mapRest!6872 () (Array (_ BitVec 32) ValueCell!1674))

(assert (=> mapNonEmpty!6872 (= mapRest!6871 (store mapRest!6872 mapKey!6872 mapValue!6872))))

(declare-fun mapIsEmpty!6872 () Bool)

(assert (=> mapIsEmpty!6872 mapRes!6872))

(declare-fun b!172637 () Bool)

(assert (=> b!172637 (= e!113967 tp_is_empty!4035)))

(declare-fun b!172636 () Bool)

(assert (=> b!172636 (= e!113966 tp_is_empty!4035)))

(assert (= (and mapNonEmpty!6871 condMapEmpty!6872) mapIsEmpty!6872))

(assert (= (and mapNonEmpty!6871 (not condMapEmpty!6872)) mapNonEmpty!6872))

(assert (= (and mapNonEmpty!6872 ((_ is ValueCellFull!1674) mapValue!6872)) b!172636))

(assert (= (and mapNonEmpty!6871 ((_ is ValueCellFull!1674) mapDefault!6872)) b!172637))

(declare-fun m!201329 () Bool)

(assert (=> mapNonEmpty!6872 m!201329))

(check-sat (not mapNonEmpty!6872) (not b!172634) (not b!172595) tp_is_empty!4035 (not b!172608) (not b!172620) (not b!172611) (not bm!17536) (not b!172633) (not b!172596) b_and!10703 (not bm!17530) (not b!172598) (not b_next!4263) (not d!52533) (not bm!17533))
(check-sat b_and!10703 (not b_next!4263))
