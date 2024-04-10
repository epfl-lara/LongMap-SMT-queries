; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16480 () Bool)

(assert start!16480)

(declare-fun b!163932 () Bool)

(declare-fun b_free!3813 () Bool)

(declare-fun b_next!3813 () Bool)

(assert (=> b!163932 (= b_free!3813 (not b_next!3813))))

(declare-fun tp!14034 () Bool)

(declare-fun b_and!10227 () Bool)

(assert (=> b!163932 (= tp!14034 b_and!10227)))

(declare-fun b!163931 () Bool)

(declare-fun res!77563 () Bool)

(declare-fun e!107564 () Bool)

(assert (=> b!163931 (=> (not res!77563) (not e!107564))))

(declare-datatypes ((V!4467 0))(
  ( (V!4468 (val!1852 Int)) )
))
(declare-datatypes ((ValueCell!1464 0))(
  ( (ValueCellFull!1464 (v!3717 V!4467)) (EmptyCell!1464) )
))
(declare-datatypes ((array!6323 0))(
  ( (array!6324 (arr!2999 (Array (_ BitVec 32) (_ BitVec 64))) (size!3287 (_ BitVec 32))) )
))
(declare-datatypes ((array!6325 0))(
  ( (array!6326 (arr!3000 (Array (_ BitVec 32) ValueCell!1464)) (size!3288 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1836 0))(
  ( (LongMapFixedSize!1837 (defaultEntry!3360 Int) (mask!8037 (_ BitVec 32)) (extraKeys!3101 (_ BitVec 32)) (zeroValue!3203 V!4467) (minValue!3203 V!4467) (_size!967 (_ BitVec 32)) (_keys!5181 array!6323) (_values!3343 array!6325) (_vacant!967 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1836)

(assert (=> b!163931 (= res!77563 (and (= (size!3288 (_values!3343 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8037 thiss!1248))) (= (size!3287 (_keys!5181 thiss!1248)) (size!3288 (_values!3343 thiss!1248))) (bvsge (mask!8037 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3101 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3101 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6135 () Bool)

(declare-fun mapRes!6135 () Bool)

(declare-fun tp!14033 () Bool)

(declare-fun e!107563 () Bool)

(assert (=> mapNonEmpty!6135 (= mapRes!6135 (and tp!14033 e!107563))))

(declare-fun mapRest!6135 () (Array (_ BitVec 32) ValueCell!1464))

(declare-fun mapKey!6135 () (_ BitVec 32))

(declare-fun mapValue!6135 () ValueCell!1464)

(assert (=> mapNonEmpty!6135 (= (arr!3000 (_values!3343 thiss!1248)) (store mapRest!6135 mapKey!6135 mapValue!6135))))

(declare-fun e!107566 () Bool)

(declare-fun e!107562 () Bool)

(declare-fun tp_is_empty!3615 () Bool)

(declare-fun array_inv!1917 (array!6323) Bool)

(declare-fun array_inv!1918 (array!6325) Bool)

(assert (=> b!163932 (= e!107566 (and tp!14034 tp_is_empty!3615 (array_inv!1917 (_keys!5181 thiss!1248)) (array_inv!1918 (_values!3343 thiss!1248)) e!107562))))

(declare-fun b!163933 () Bool)

(declare-fun res!77565 () Bool)

(declare-fun e!107561 () Bool)

(assert (=> b!163933 (=> (not res!77565) (not e!107561))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163933 (= res!77565 (not (= key!828 (bvneg key!828))))))

(declare-fun res!77568 () Bool)

(assert (=> start!16480 (=> (not res!77568) (not e!107561))))

(declare-fun valid!819 (LongMapFixedSize!1836) Bool)

(assert (=> start!16480 (= res!77568 (valid!819 thiss!1248))))

(assert (=> start!16480 e!107561))

(assert (=> start!16480 e!107566))

(assert (=> start!16480 true))

(declare-fun b!163934 () Bool)

(declare-fun e!107567 () Bool)

(assert (=> b!163934 (= e!107567 tp_is_empty!3615)))

(declare-fun mapIsEmpty!6135 () Bool)

(assert (=> mapIsEmpty!6135 mapRes!6135))

(declare-fun b!163935 () Bool)

(declare-fun res!77567 () Bool)

(assert (=> b!163935 (=> (not res!77567) (not e!107564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163935 (= res!77567 (validMask!0 (mask!8037 thiss!1248)))))

(declare-fun b!163936 () Bool)

(declare-datatypes ((List!1995 0))(
  ( (Nil!1992) (Cons!1991 (h!2608 (_ BitVec 64)) (t!6797 List!1995)) )
))
(declare-fun arrayNoDuplicates!0 (array!6323 (_ BitVec 32) List!1995) Bool)

(assert (=> b!163936 (= e!107564 (not (arrayNoDuplicates!0 (_keys!5181 thiss!1248) #b00000000000000000000000000000000 Nil!1992)))))

(declare-fun b!163937 () Bool)

(assert (=> b!163937 (= e!107561 e!107564)))

(declare-fun res!77564 () Bool)

(assert (=> b!163937 (=> (not res!77564) (not e!107564))))

(declare-datatypes ((SeekEntryResult!407 0))(
  ( (MissingZero!407 (index!3796 (_ BitVec 32))) (Found!407 (index!3797 (_ BitVec 32))) (Intermediate!407 (undefined!1219 Bool) (index!3798 (_ BitVec 32)) (x!18179 (_ BitVec 32))) (Undefined!407) (MissingVacant!407 (index!3799 (_ BitVec 32))) )
))
(declare-fun lt!82795 () SeekEntryResult!407)

(get-info :version)

(assert (=> b!163937 (= res!77564 (and (not ((_ is Undefined!407) lt!82795)) (not ((_ is MissingVacant!407) lt!82795)) (not ((_ is MissingZero!407) lt!82795)) ((_ is Found!407) lt!82795)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6323 (_ BitVec 32)) SeekEntryResult!407)

(assert (=> b!163937 (= lt!82795 (seekEntryOrOpen!0 key!828 (_keys!5181 thiss!1248) (mask!8037 thiss!1248)))))

(declare-fun b!163938 () Bool)

(assert (=> b!163938 (= e!107562 (and e!107567 mapRes!6135))))

(declare-fun condMapEmpty!6135 () Bool)

(declare-fun mapDefault!6135 () ValueCell!1464)

(assert (=> b!163938 (= condMapEmpty!6135 (= (arr!3000 (_values!3343 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1464)) mapDefault!6135)))))

(declare-fun b!163939 () Bool)

(declare-fun res!77566 () Bool)

(assert (=> b!163939 (=> (not res!77566) (not e!107564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6323 (_ BitVec 32)) Bool)

(assert (=> b!163939 (= res!77566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5181 thiss!1248) (mask!8037 thiss!1248)))))

(declare-fun b!163940 () Bool)

(assert (=> b!163940 (= e!107563 tp_is_empty!3615)))

(assert (= (and start!16480 res!77568) b!163933))

(assert (= (and b!163933 res!77565) b!163937))

(assert (= (and b!163937 res!77564) b!163935))

(assert (= (and b!163935 res!77567) b!163931))

(assert (= (and b!163931 res!77563) b!163939))

(assert (= (and b!163939 res!77566) b!163936))

(assert (= (and b!163938 condMapEmpty!6135) mapIsEmpty!6135))

(assert (= (and b!163938 (not condMapEmpty!6135)) mapNonEmpty!6135))

(assert (= (and mapNonEmpty!6135 ((_ is ValueCellFull!1464) mapValue!6135)) b!163940))

(assert (= (and b!163938 ((_ is ValueCellFull!1464) mapDefault!6135)) b!163934))

(assert (= b!163932 b!163938))

(assert (= start!16480 b!163932))

(declare-fun m!194359 () Bool)

(assert (=> b!163935 m!194359))

(declare-fun m!194361 () Bool)

(assert (=> start!16480 m!194361))

(declare-fun m!194363 () Bool)

(assert (=> mapNonEmpty!6135 m!194363))

(declare-fun m!194365 () Bool)

(assert (=> b!163937 m!194365))

(declare-fun m!194367 () Bool)

(assert (=> b!163932 m!194367))

(declare-fun m!194369 () Bool)

(assert (=> b!163932 m!194369))

(declare-fun m!194371 () Bool)

(assert (=> b!163939 m!194371))

(declare-fun m!194373 () Bool)

(assert (=> b!163936 m!194373))

(check-sat (not b!163939) (not b!163937) b_and!10227 (not start!16480) tp_is_empty!3615 (not mapNonEmpty!6135) (not b!163932) (not b_next!3813) (not b!163936) (not b!163935))
(check-sat b_and!10227 (not b_next!3813))
(get-model)

(declare-fun d!51499 () Bool)

(declare-fun res!77591 () Bool)

(declare-fun e!107597 () Bool)

(assert (=> d!51499 (=> res!77591 e!107597)))

(assert (=> d!51499 (= res!77591 (bvsge #b00000000000000000000000000000000 (size!3287 (_keys!5181 thiss!1248))))))

(assert (=> d!51499 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5181 thiss!1248) (mask!8037 thiss!1248)) e!107597)))

(declare-fun b!163979 () Bool)

(declare-fun e!107596 () Bool)

(declare-fun e!107595 () Bool)

(assert (=> b!163979 (= e!107596 e!107595)))

(declare-fun lt!82807 () (_ BitVec 64))

(assert (=> b!163979 (= lt!82807 (select (arr!2999 (_keys!5181 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5045 0))(
  ( (Unit!5046) )
))
(declare-fun lt!82806 () Unit!5045)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6323 (_ BitVec 64) (_ BitVec 32)) Unit!5045)

(assert (=> b!163979 (= lt!82806 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5181 thiss!1248) lt!82807 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163979 (arrayContainsKey!0 (_keys!5181 thiss!1248) lt!82807 #b00000000000000000000000000000000)))

(declare-fun lt!82805 () Unit!5045)

(assert (=> b!163979 (= lt!82805 lt!82806)))

(declare-fun res!77592 () Bool)

(assert (=> b!163979 (= res!77592 (= (seekEntryOrOpen!0 (select (arr!2999 (_keys!5181 thiss!1248)) #b00000000000000000000000000000000) (_keys!5181 thiss!1248) (mask!8037 thiss!1248)) (Found!407 #b00000000000000000000000000000000)))))

(assert (=> b!163979 (=> (not res!77592) (not e!107595))))

(declare-fun b!163980 () Bool)

(declare-fun call!17326 () Bool)

(assert (=> b!163980 (= e!107595 call!17326)))

(declare-fun bm!17323 () Bool)

(assert (=> bm!17323 (= call!17326 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5181 thiss!1248) (mask!8037 thiss!1248)))))

(declare-fun b!163981 () Bool)

(assert (=> b!163981 (= e!107597 e!107596)))

(declare-fun c!30166 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163981 (= c!30166 (validKeyInArray!0 (select (arr!2999 (_keys!5181 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163982 () Bool)

(assert (=> b!163982 (= e!107596 call!17326)))

(assert (= (and d!51499 (not res!77591)) b!163981))

(assert (= (and b!163981 c!30166) b!163979))

(assert (= (and b!163981 (not c!30166)) b!163982))

(assert (= (and b!163979 res!77592) b!163980))

(assert (= (or b!163980 b!163982) bm!17323))

(declare-fun m!194391 () Bool)

(assert (=> b!163979 m!194391))

(declare-fun m!194393 () Bool)

(assert (=> b!163979 m!194393))

(declare-fun m!194395 () Bool)

(assert (=> b!163979 m!194395))

(assert (=> b!163979 m!194391))

(declare-fun m!194397 () Bool)

(assert (=> b!163979 m!194397))

(declare-fun m!194399 () Bool)

(assert (=> bm!17323 m!194399))

(assert (=> b!163981 m!194391))

(assert (=> b!163981 m!194391))

(declare-fun m!194401 () Bool)

(assert (=> b!163981 m!194401))

(assert (=> b!163939 d!51499))

(declare-fun d!51501 () Bool)

(declare-fun res!77599 () Bool)

(declare-fun e!107600 () Bool)

(assert (=> d!51501 (=> (not res!77599) (not e!107600))))

(declare-fun simpleValid!125 (LongMapFixedSize!1836) Bool)

(assert (=> d!51501 (= res!77599 (simpleValid!125 thiss!1248))))

(assert (=> d!51501 (= (valid!819 thiss!1248) e!107600)))

(declare-fun b!163989 () Bool)

(declare-fun res!77600 () Bool)

(assert (=> b!163989 (=> (not res!77600) (not e!107600))))

(declare-fun arrayCountValidKeys!0 (array!6323 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163989 (= res!77600 (= (arrayCountValidKeys!0 (_keys!5181 thiss!1248) #b00000000000000000000000000000000 (size!3287 (_keys!5181 thiss!1248))) (_size!967 thiss!1248)))))

(declare-fun b!163990 () Bool)

(declare-fun res!77601 () Bool)

(assert (=> b!163990 (=> (not res!77601) (not e!107600))))

(assert (=> b!163990 (= res!77601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5181 thiss!1248) (mask!8037 thiss!1248)))))

(declare-fun b!163991 () Bool)

(assert (=> b!163991 (= e!107600 (arrayNoDuplicates!0 (_keys!5181 thiss!1248) #b00000000000000000000000000000000 Nil!1992))))

(assert (= (and d!51501 res!77599) b!163989))

(assert (= (and b!163989 res!77600) b!163990))

(assert (= (and b!163990 res!77601) b!163991))

(declare-fun m!194403 () Bool)

(assert (=> d!51501 m!194403))

(declare-fun m!194405 () Bool)

(assert (=> b!163989 m!194405))

(assert (=> b!163990 m!194371))

(assert (=> b!163991 m!194373))

(assert (=> start!16480 d!51501))

(declare-fun b!164004 () Bool)

(declare-fun e!107607 () SeekEntryResult!407)

(declare-fun e!107609 () SeekEntryResult!407)

(assert (=> b!164004 (= e!107607 e!107609)))

(declare-fun lt!82814 () (_ BitVec 64))

(declare-fun lt!82815 () SeekEntryResult!407)

(assert (=> b!164004 (= lt!82814 (select (arr!2999 (_keys!5181 thiss!1248)) (index!3798 lt!82815)))))

(declare-fun c!30174 () Bool)

(assert (=> b!164004 (= c!30174 (= lt!82814 key!828))))

(declare-fun d!51503 () Bool)

(declare-fun lt!82816 () SeekEntryResult!407)

(assert (=> d!51503 (and (or ((_ is Undefined!407) lt!82816) (not ((_ is Found!407) lt!82816)) (and (bvsge (index!3797 lt!82816) #b00000000000000000000000000000000) (bvslt (index!3797 lt!82816) (size!3287 (_keys!5181 thiss!1248))))) (or ((_ is Undefined!407) lt!82816) ((_ is Found!407) lt!82816) (not ((_ is MissingZero!407) lt!82816)) (and (bvsge (index!3796 lt!82816) #b00000000000000000000000000000000) (bvslt (index!3796 lt!82816) (size!3287 (_keys!5181 thiss!1248))))) (or ((_ is Undefined!407) lt!82816) ((_ is Found!407) lt!82816) ((_ is MissingZero!407) lt!82816) (not ((_ is MissingVacant!407) lt!82816)) (and (bvsge (index!3799 lt!82816) #b00000000000000000000000000000000) (bvslt (index!3799 lt!82816) (size!3287 (_keys!5181 thiss!1248))))) (or ((_ is Undefined!407) lt!82816) (ite ((_ is Found!407) lt!82816) (= (select (arr!2999 (_keys!5181 thiss!1248)) (index!3797 lt!82816)) key!828) (ite ((_ is MissingZero!407) lt!82816) (= (select (arr!2999 (_keys!5181 thiss!1248)) (index!3796 lt!82816)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!407) lt!82816) (= (select (arr!2999 (_keys!5181 thiss!1248)) (index!3799 lt!82816)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51503 (= lt!82816 e!107607)))

(declare-fun c!30173 () Bool)

(assert (=> d!51503 (= c!30173 (and ((_ is Intermediate!407) lt!82815) (undefined!1219 lt!82815)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6323 (_ BitVec 32)) SeekEntryResult!407)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51503 (= lt!82815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8037 thiss!1248)) key!828 (_keys!5181 thiss!1248) (mask!8037 thiss!1248)))))

(assert (=> d!51503 (validMask!0 (mask!8037 thiss!1248))))

(assert (=> d!51503 (= (seekEntryOrOpen!0 key!828 (_keys!5181 thiss!1248) (mask!8037 thiss!1248)) lt!82816)))

(declare-fun e!107608 () SeekEntryResult!407)

(declare-fun b!164005 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6323 (_ BitVec 32)) SeekEntryResult!407)

(assert (=> b!164005 (= e!107608 (seekKeyOrZeroReturnVacant!0 (x!18179 lt!82815) (index!3798 lt!82815) (index!3798 lt!82815) key!828 (_keys!5181 thiss!1248) (mask!8037 thiss!1248)))))

(declare-fun b!164006 () Bool)

(declare-fun c!30175 () Bool)

(assert (=> b!164006 (= c!30175 (= lt!82814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!164006 (= e!107609 e!107608)))

(declare-fun b!164007 () Bool)

(assert (=> b!164007 (= e!107608 (MissingZero!407 (index!3798 lt!82815)))))

(declare-fun b!164008 () Bool)

(assert (=> b!164008 (= e!107609 (Found!407 (index!3798 lt!82815)))))

(declare-fun b!164009 () Bool)

(assert (=> b!164009 (= e!107607 Undefined!407)))

(assert (= (and d!51503 c!30173) b!164009))

(assert (= (and d!51503 (not c!30173)) b!164004))

(assert (= (and b!164004 c!30174) b!164008))

(assert (= (and b!164004 (not c!30174)) b!164006))

(assert (= (and b!164006 c!30175) b!164007))

(assert (= (and b!164006 (not c!30175)) b!164005))

(declare-fun m!194407 () Bool)

(assert (=> b!164004 m!194407))

(assert (=> d!51503 m!194359))

(declare-fun m!194409 () Bool)

(assert (=> d!51503 m!194409))

(declare-fun m!194411 () Bool)

(assert (=> d!51503 m!194411))

(declare-fun m!194413 () Bool)

(assert (=> d!51503 m!194413))

(declare-fun m!194415 () Bool)

(assert (=> d!51503 m!194415))

(declare-fun m!194417 () Bool)

(assert (=> d!51503 m!194417))

(assert (=> d!51503 m!194413))

(declare-fun m!194419 () Bool)

(assert (=> b!164005 m!194419))

(assert (=> b!163937 d!51503))

(declare-fun d!51505 () Bool)

(assert (=> d!51505 (= (array_inv!1917 (_keys!5181 thiss!1248)) (bvsge (size!3287 (_keys!5181 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163932 d!51505))

(declare-fun d!51507 () Bool)

(assert (=> d!51507 (= (array_inv!1918 (_values!3343 thiss!1248)) (bvsge (size!3288 (_values!3343 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163932 d!51507))

(declare-fun bm!17326 () Bool)

(declare-fun call!17329 () Bool)

(declare-fun c!30178 () Bool)

(assert (=> bm!17326 (= call!17329 (arrayNoDuplicates!0 (_keys!5181 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30178 (Cons!1991 (select (arr!2999 (_keys!5181 thiss!1248)) #b00000000000000000000000000000000) Nil!1992) Nil!1992)))))

(declare-fun b!164020 () Bool)

(declare-fun e!107618 () Bool)

(assert (=> b!164020 (= e!107618 call!17329)))

(declare-fun d!51509 () Bool)

(declare-fun res!77610 () Bool)

(declare-fun e!107621 () Bool)

(assert (=> d!51509 (=> res!77610 e!107621)))

(assert (=> d!51509 (= res!77610 (bvsge #b00000000000000000000000000000000 (size!3287 (_keys!5181 thiss!1248))))))

(assert (=> d!51509 (= (arrayNoDuplicates!0 (_keys!5181 thiss!1248) #b00000000000000000000000000000000 Nil!1992) e!107621)))

(declare-fun b!164021 () Bool)

(declare-fun e!107619 () Bool)

(declare-fun contains!1040 (List!1995 (_ BitVec 64)) Bool)

(assert (=> b!164021 (= e!107619 (contains!1040 Nil!1992 (select (arr!2999 (_keys!5181 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164022 () Bool)

(declare-fun e!107620 () Bool)

(assert (=> b!164022 (= e!107621 e!107620)))

(declare-fun res!77609 () Bool)

(assert (=> b!164022 (=> (not res!77609) (not e!107620))))

(assert (=> b!164022 (= res!77609 (not e!107619))))

(declare-fun res!77608 () Bool)

(assert (=> b!164022 (=> (not res!77608) (not e!107619))))

(assert (=> b!164022 (= res!77608 (validKeyInArray!0 (select (arr!2999 (_keys!5181 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164023 () Bool)

(assert (=> b!164023 (= e!107620 e!107618)))

(assert (=> b!164023 (= c!30178 (validKeyInArray!0 (select (arr!2999 (_keys!5181 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164024 () Bool)

(assert (=> b!164024 (= e!107618 call!17329)))

(assert (= (and d!51509 (not res!77610)) b!164022))

(assert (= (and b!164022 res!77608) b!164021))

(assert (= (and b!164022 res!77609) b!164023))

(assert (= (and b!164023 c!30178) b!164020))

(assert (= (and b!164023 (not c!30178)) b!164024))

(assert (= (or b!164020 b!164024) bm!17326))

(assert (=> bm!17326 m!194391))

(declare-fun m!194421 () Bool)

(assert (=> bm!17326 m!194421))

(assert (=> b!164021 m!194391))

(assert (=> b!164021 m!194391))

(declare-fun m!194423 () Bool)

(assert (=> b!164021 m!194423))

(assert (=> b!164022 m!194391))

(assert (=> b!164022 m!194391))

(assert (=> b!164022 m!194401))

(assert (=> b!164023 m!194391))

(assert (=> b!164023 m!194391))

(assert (=> b!164023 m!194401))

(assert (=> b!163936 d!51509))

(declare-fun d!51511 () Bool)

(assert (=> d!51511 (= (validMask!0 (mask!8037 thiss!1248)) (and (or (= (mask!8037 thiss!1248) #b00000000000000000000000000000111) (= (mask!8037 thiss!1248) #b00000000000000000000000000001111) (= (mask!8037 thiss!1248) #b00000000000000000000000000011111) (= (mask!8037 thiss!1248) #b00000000000000000000000000111111) (= (mask!8037 thiss!1248) #b00000000000000000000000001111111) (= (mask!8037 thiss!1248) #b00000000000000000000000011111111) (= (mask!8037 thiss!1248) #b00000000000000000000000111111111) (= (mask!8037 thiss!1248) #b00000000000000000000001111111111) (= (mask!8037 thiss!1248) #b00000000000000000000011111111111) (= (mask!8037 thiss!1248) #b00000000000000000000111111111111) (= (mask!8037 thiss!1248) #b00000000000000000001111111111111) (= (mask!8037 thiss!1248) #b00000000000000000011111111111111) (= (mask!8037 thiss!1248) #b00000000000000000111111111111111) (= (mask!8037 thiss!1248) #b00000000000000001111111111111111) (= (mask!8037 thiss!1248) #b00000000000000011111111111111111) (= (mask!8037 thiss!1248) #b00000000000000111111111111111111) (= (mask!8037 thiss!1248) #b00000000000001111111111111111111) (= (mask!8037 thiss!1248) #b00000000000011111111111111111111) (= (mask!8037 thiss!1248) #b00000000000111111111111111111111) (= (mask!8037 thiss!1248) #b00000000001111111111111111111111) (= (mask!8037 thiss!1248) #b00000000011111111111111111111111) (= (mask!8037 thiss!1248) #b00000000111111111111111111111111) (= (mask!8037 thiss!1248) #b00000001111111111111111111111111) (= (mask!8037 thiss!1248) #b00000011111111111111111111111111) (= (mask!8037 thiss!1248) #b00000111111111111111111111111111) (= (mask!8037 thiss!1248) #b00001111111111111111111111111111) (= (mask!8037 thiss!1248) #b00011111111111111111111111111111) (= (mask!8037 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8037 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163935 d!51511))

(declare-fun mapNonEmpty!6141 () Bool)

(declare-fun mapRes!6141 () Bool)

(declare-fun tp!14043 () Bool)

(declare-fun e!107626 () Bool)

(assert (=> mapNonEmpty!6141 (= mapRes!6141 (and tp!14043 e!107626))))

(declare-fun mapKey!6141 () (_ BitVec 32))

(declare-fun mapValue!6141 () ValueCell!1464)

(declare-fun mapRest!6141 () (Array (_ BitVec 32) ValueCell!1464))

(assert (=> mapNonEmpty!6141 (= mapRest!6135 (store mapRest!6141 mapKey!6141 mapValue!6141))))

(declare-fun b!164032 () Bool)

(declare-fun e!107627 () Bool)

(assert (=> b!164032 (= e!107627 tp_is_empty!3615)))

(declare-fun b!164031 () Bool)

(assert (=> b!164031 (= e!107626 tp_is_empty!3615)))

(declare-fun mapIsEmpty!6141 () Bool)

(assert (=> mapIsEmpty!6141 mapRes!6141))

(declare-fun condMapEmpty!6141 () Bool)

(declare-fun mapDefault!6141 () ValueCell!1464)

(assert (=> mapNonEmpty!6135 (= condMapEmpty!6141 (= mapRest!6135 ((as const (Array (_ BitVec 32) ValueCell!1464)) mapDefault!6141)))))

(assert (=> mapNonEmpty!6135 (= tp!14033 (and e!107627 mapRes!6141))))

(assert (= (and mapNonEmpty!6135 condMapEmpty!6141) mapIsEmpty!6141))

(assert (= (and mapNonEmpty!6135 (not condMapEmpty!6141)) mapNonEmpty!6141))

(assert (= (and mapNonEmpty!6141 ((_ is ValueCellFull!1464) mapValue!6141)) b!164031))

(assert (= (and mapNonEmpty!6135 ((_ is ValueCellFull!1464) mapDefault!6141)) b!164032))

(declare-fun m!194425 () Bool)

(assert (=> mapNonEmpty!6141 m!194425))

(check-sat (not b!164023) (not bm!17323) (not b!164022) (not b!163981) (not b!163990) (not b!163991) (not b!163979) tp_is_empty!3615 (not d!51501) (not mapNonEmpty!6141) (not b!164021) (not d!51503) b_and!10227 (not bm!17326) (not b!164005) (not b!163989) (not b_next!3813))
(check-sat b_and!10227 (not b_next!3813))
