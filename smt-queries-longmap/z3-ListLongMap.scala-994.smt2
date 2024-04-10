; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21444 () Bool)

(assert start!21444)

(declare-fun b!215328 () Bool)

(declare-fun b_free!5715 () Bool)

(declare-fun b_next!5715 () Bool)

(assert (=> b!215328 (= b_free!5715 (not b_next!5715))))

(declare-fun tp!20256 () Bool)

(declare-fun b_and!12605 () Bool)

(assert (=> b!215328 (= tp!20256 b_and!12605)))

(declare-fun res!105345 () Bool)

(declare-fun e!140074 () Bool)

(assert (=> start!21444 (=> (not res!105345) (not e!140074))))

(declare-datatypes ((V!7083 0))(
  ( (V!7084 (val!2833 Int)) )
))
(declare-datatypes ((ValueCell!2445 0))(
  ( (ValueCellFull!2445 (v!4851 V!7083)) (EmptyCell!2445) )
))
(declare-datatypes ((array!10379 0))(
  ( (array!10380 (arr!4918 (Array (_ BitVec 32) ValueCell!2445)) (size!5247 (_ BitVec 32))) )
))
(declare-datatypes ((array!10381 0))(
  ( (array!10382 (arr!4919 (Array (_ BitVec 32) (_ BitVec 64))) (size!5248 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2790 0))(
  ( (LongMapFixedSize!2791 (defaultEntry!4045 Int) (mask!9739 (_ BitVec 32)) (extraKeys!3782 (_ BitVec 32)) (zeroValue!3886 V!7083) (minValue!3886 V!7083) (_size!1444 (_ BitVec 32)) (_keys!6075 array!10381) (_values!4028 array!10379) (_vacant!1444 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2790)

(declare-fun valid!1138 (LongMapFixedSize!2790) Bool)

(assert (=> start!21444 (= res!105345 (valid!1138 thiss!1504))))

(assert (=> start!21444 e!140074))

(declare-fun e!140073 () Bool)

(assert (=> start!21444 e!140073))

(assert (=> start!21444 true))

(declare-fun b!215324 () Bool)

(declare-fun e!140076 () Bool)

(declare-fun tp_is_empty!5577 () Bool)

(assert (=> b!215324 (= e!140076 tp_is_empty!5577)))

(declare-fun b!215325 () Bool)

(declare-fun e!140075 () Bool)

(declare-fun mapRes!9504 () Bool)

(assert (=> b!215325 (= e!140075 (and e!140076 mapRes!9504))))

(declare-fun condMapEmpty!9504 () Bool)

(declare-fun mapDefault!9504 () ValueCell!2445)

(assert (=> b!215325 (= condMapEmpty!9504 (= (arr!4918 (_values!4028 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2445)) mapDefault!9504)))))

(declare-fun b!215326 () Bool)

(declare-fun e!140071 () Bool)

(assert (=> b!215326 (= e!140071 (and (= (size!5247 (_values!4028 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9739 thiss!1504))) (not (= (size!5248 (_keys!6075 thiss!1504)) (size!5247 (_values!4028 thiss!1504))))))))

(declare-fun b!215327 () Bool)

(declare-fun res!105344 () Bool)

(assert (=> b!215327 (=> (not res!105344) (not e!140071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215327 (= res!105344 (validMask!0 (mask!9739 thiss!1504)))))

(declare-fun array_inv!3257 (array!10381) Bool)

(declare-fun array_inv!3258 (array!10379) Bool)

(assert (=> b!215328 (= e!140073 (and tp!20256 tp_is_empty!5577 (array_inv!3257 (_keys!6075 thiss!1504)) (array_inv!3258 (_values!4028 thiss!1504)) e!140075))))

(declare-fun b!215329 () Bool)

(declare-fun e!140072 () Bool)

(assert (=> b!215329 (= e!140072 tp_is_empty!5577)))

(declare-fun b!215330 () Bool)

(assert (=> b!215330 (= e!140074 e!140071)))

(declare-fun res!105342 () Bool)

(assert (=> b!215330 (=> (not res!105342) (not e!140071))))

(declare-datatypes ((SeekEntryResult!730 0))(
  ( (MissingZero!730 (index!5090 (_ BitVec 32))) (Found!730 (index!5091 (_ BitVec 32))) (Intermediate!730 (undefined!1542 Bool) (index!5092 (_ BitVec 32)) (x!22487 (_ BitVec 32))) (Undefined!730) (MissingVacant!730 (index!5093 (_ BitVec 32))) )
))
(declare-fun lt!110928 () SeekEntryResult!730)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215330 (= res!105342 (or (= lt!110928 (MissingZero!730 index!297)) (= lt!110928 (MissingVacant!730 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10381 (_ BitVec 32)) SeekEntryResult!730)

(assert (=> b!215330 (= lt!110928 (seekEntryOrOpen!0 key!932 (_keys!6075 thiss!1504) (mask!9739 thiss!1504)))))

(declare-fun mapIsEmpty!9504 () Bool)

(assert (=> mapIsEmpty!9504 mapRes!9504))

(declare-fun b!215331 () Bool)

(declare-fun res!105343 () Bool)

(assert (=> b!215331 (=> (not res!105343) (not e!140074))))

(assert (=> b!215331 (= res!105343 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9504 () Bool)

(declare-fun tp!20255 () Bool)

(assert (=> mapNonEmpty!9504 (= mapRes!9504 (and tp!20255 e!140072))))

(declare-fun mapKey!9504 () (_ BitVec 32))

(declare-fun mapValue!9504 () ValueCell!2445)

(declare-fun mapRest!9504 () (Array (_ BitVec 32) ValueCell!2445))

(assert (=> mapNonEmpty!9504 (= (arr!4918 (_values!4028 thiss!1504)) (store mapRest!9504 mapKey!9504 mapValue!9504))))

(assert (= (and start!21444 res!105345) b!215331))

(assert (= (and b!215331 res!105343) b!215330))

(assert (= (and b!215330 res!105342) b!215327))

(assert (= (and b!215327 res!105344) b!215326))

(assert (= (and b!215325 condMapEmpty!9504) mapIsEmpty!9504))

(assert (= (and b!215325 (not condMapEmpty!9504)) mapNonEmpty!9504))

(get-info :version)

(assert (= (and mapNonEmpty!9504 ((_ is ValueCellFull!2445) mapValue!9504)) b!215329))

(assert (= (and b!215325 ((_ is ValueCellFull!2445) mapDefault!9504)) b!215324))

(assert (= b!215328 b!215325))

(assert (= start!21444 b!215328))

(declare-fun m!242583 () Bool)

(assert (=> start!21444 m!242583))

(declare-fun m!242585 () Bool)

(assert (=> b!215327 m!242585))

(declare-fun m!242587 () Bool)

(assert (=> b!215330 m!242587))

(declare-fun m!242589 () Bool)

(assert (=> mapNonEmpty!9504 m!242589))

(declare-fun m!242591 () Bool)

(assert (=> b!215328 m!242591))

(declare-fun m!242593 () Bool)

(assert (=> b!215328 m!242593))

(check-sat tp_is_empty!5577 (not b!215330) (not mapNonEmpty!9504) (not b!215328) (not start!21444) (not b!215327) b_and!12605 (not b_next!5715))
(check-sat b_and!12605 (not b_next!5715))
(get-model)

(declare-fun b!215368 () Bool)

(declare-fun e!140107 () SeekEntryResult!730)

(declare-fun lt!110940 () SeekEntryResult!730)

(assert (=> b!215368 (= e!140107 (MissingZero!730 (index!5092 lt!110940)))))

(declare-fun b!215369 () Bool)

(declare-fun c!36168 () Bool)

(declare-fun lt!110938 () (_ BitVec 64))

(assert (=> b!215369 (= c!36168 (= lt!110938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140105 () SeekEntryResult!730)

(assert (=> b!215369 (= e!140105 e!140107)))

(declare-fun d!58421 () Bool)

(declare-fun lt!110939 () SeekEntryResult!730)

(assert (=> d!58421 (and (or ((_ is Undefined!730) lt!110939) (not ((_ is Found!730) lt!110939)) (and (bvsge (index!5091 lt!110939) #b00000000000000000000000000000000) (bvslt (index!5091 lt!110939) (size!5248 (_keys!6075 thiss!1504))))) (or ((_ is Undefined!730) lt!110939) ((_ is Found!730) lt!110939) (not ((_ is MissingZero!730) lt!110939)) (and (bvsge (index!5090 lt!110939) #b00000000000000000000000000000000) (bvslt (index!5090 lt!110939) (size!5248 (_keys!6075 thiss!1504))))) (or ((_ is Undefined!730) lt!110939) ((_ is Found!730) lt!110939) ((_ is MissingZero!730) lt!110939) (not ((_ is MissingVacant!730) lt!110939)) (and (bvsge (index!5093 lt!110939) #b00000000000000000000000000000000) (bvslt (index!5093 lt!110939) (size!5248 (_keys!6075 thiss!1504))))) (or ((_ is Undefined!730) lt!110939) (ite ((_ is Found!730) lt!110939) (= (select (arr!4919 (_keys!6075 thiss!1504)) (index!5091 lt!110939)) key!932) (ite ((_ is MissingZero!730) lt!110939) (= (select (arr!4919 (_keys!6075 thiss!1504)) (index!5090 lt!110939)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!730) lt!110939) (= (select (arr!4919 (_keys!6075 thiss!1504)) (index!5093 lt!110939)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140106 () SeekEntryResult!730)

(assert (=> d!58421 (= lt!110939 e!140106)))

(declare-fun c!36169 () Bool)

(assert (=> d!58421 (= c!36169 (and ((_ is Intermediate!730) lt!110940) (undefined!1542 lt!110940)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10381 (_ BitVec 32)) SeekEntryResult!730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58421 (= lt!110940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9739 thiss!1504)) key!932 (_keys!6075 thiss!1504) (mask!9739 thiss!1504)))))

(assert (=> d!58421 (validMask!0 (mask!9739 thiss!1504))))

(assert (=> d!58421 (= (seekEntryOrOpen!0 key!932 (_keys!6075 thiss!1504) (mask!9739 thiss!1504)) lt!110939)))

(declare-fun b!215370 () Bool)

(assert (=> b!215370 (= e!140106 e!140105)))

(assert (=> b!215370 (= lt!110938 (select (arr!4919 (_keys!6075 thiss!1504)) (index!5092 lt!110940)))))

(declare-fun c!36170 () Bool)

(assert (=> b!215370 (= c!36170 (= lt!110938 key!932))))

(declare-fun b!215371 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10381 (_ BitVec 32)) SeekEntryResult!730)

(assert (=> b!215371 (= e!140107 (seekKeyOrZeroReturnVacant!0 (x!22487 lt!110940) (index!5092 lt!110940) (index!5092 lt!110940) key!932 (_keys!6075 thiss!1504) (mask!9739 thiss!1504)))))

(declare-fun b!215372 () Bool)

(assert (=> b!215372 (= e!140106 Undefined!730)))

(declare-fun b!215373 () Bool)

(assert (=> b!215373 (= e!140105 (Found!730 (index!5092 lt!110940)))))

(assert (= (and d!58421 c!36169) b!215372))

(assert (= (and d!58421 (not c!36169)) b!215370))

(assert (= (and b!215370 c!36170) b!215373))

(assert (= (and b!215370 (not c!36170)) b!215369))

(assert (= (and b!215369 c!36168) b!215368))

(assert (= (and b!215369 (not c!36168)) b!215371))

(declare-fun m!242607 () Bool)

(assert (=> d!58421 m!242607))

(assert (=> d!58421 m!242607))

(declare-fun m!242609 () Bool)

(assert (=> d!58421 m!242609))

(assert (=> d!58421 m!242585))

(declare-fun m!242611 () Bool)

(assert (=> d!58421 m!242611))

(declare-fun m!242613 () Bool)

(assert (=> d!58421 m!242613))

(declare-fun m!242615 () Bool)

(assert (=> d!58421 m!242615))

(declare-fun m!242617 () Bool)

(assert (=> b!215370 m!242617))

(declare-fun m!242619 () Bool)

(assert (=> b!215371 m!242619))

(assert (=> b!215330 d!58421))

(declare-fun d!58423 () Bool)

(declare-fun res!105364 () Bool)

(declare-fun e!140110 () Bool)

(assert (=> d!58423 (=> (not res!105364) (not e!140110))))

(declare-fun simpleValid!217 (LongMapFixedSize!2790) Bool)

(assert (=> d!58423 (= res!105364 (simpleValid!217 thiss!1504))))

(assert (=> d!58423 (= (valid!1138 thiss!1504) e!140110)))

(declare-fun b!215380 () Bool)

(declare-fun res!105365 () Bool)

(assert (=> b!215380 (=> (not res!105365) (not e!140110))))

(declare-fun arrayCountValidKeys!0 (array!10381 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215380 (= res!105365 (= (arrayCountValidKeys!0 (_keys!6075 thiss!1504) #b00000000000000000000000000000000 (size!5248 (_keys!6075 thiss!1504))) (_size!1444 thiss!1504)))))

(declare-fun b!215381 () Bool)

(declare-fun res!105366 () Bool)

(assert (=> b!215381 (=> (not res!105366) (not e!140110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10381 (_ BitVec 32)) Bool)

(assert (=> b!215381 (= res!105366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6075 thiss!1504) (mask!9739 thiss!1504)))))

(declare-fun b!215382 () Bool)

(declare-datatypes ((List!3136 0))(
  ( (Nil!3133) (Cons!3132 (h!3776 (_ BitVec 64)) (t!8091 List!3136)) )
))
(declare-fun arrayNoDuplicates!0 (array!10381 (_ BitVec 32) List!3136) Bool)

(assert (=> b!215382 (= e!140110 (arrayNoDuplicates!0 (_keys!6075 thiss!1504) #b00000000000000000000000000000000 Nil!3133))))

(assert (= (and d!58423 res!105364) b!215380))

(assert (= (and b!215380 res!105365) b!215381))

(assert (= (and b!215381 res!105366) b!215382))

(declare-fun m!242621 () Bool)

(assert (=> d!58423 m!242621))

(declare-fun m!242623 () Bool)

(assert (=> b!215380 m!242623))

(declare-fun m!242625 () Bool)

(assert (=> b!215381 m!242625))

(declare-fun m!242627 () Bool)

(assert (=> b!215382 m!242627))

(assert (=> start!21444 d!58423))

(declare-fun d!58425 () Bool)

(assert (=> d!58425 (= (array_inv!3257 (_keys!6075 thiss!1504)) (bvsge (size!5248 (_keys!6075 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215328 d!58425))

(declare-fun d!58427 () Bool)

(assert (=> d!58427 (= (array_inv!3258 (_values!4028 thiss!1504)) (bvsge (size!5247 (_values!4028 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215328 d!58427))

(declare-fun d!58429 () Bool)

(assert (=> d!58429 (= (validMask!0 (mask!9739 thiss!1504)) (and (or (= (mask!9739 thiss!1504) #b00000000000000000000000000000111) (= (mask!9739 thiss!1504) #b00000000000000000000000000001111) (= (mask!9739 thiss!1504) #b00000000000000000000000000011111) (= (mask!9739 thiss!1504) #b00000000000000000000000000111111) (= (mask!9739 thiss!1504) #b00000000000000000000000001111111) (= (mask!9739 thiss!1504) #b00000000000000000000000011111111) (= (mask!9739 thiss!1504) #b00000000000000000000000111111111) (= (mask!9739 thiss!1504) #b00000000000000000000001111111111) (= (mask!9739 thiss!1504) #b00000000000000000000011111111111) (= (mask!9739 thiss!1504) #b00000000000000000000111111111111) (= (mask!9739 thiss!1504) #b00000000000000000001111111111111) (= (mask!9739 thiss!1504) #b00000000000000000011111111111111) (= (mask!9739 thiss!1504) #b00000000000000000111111111111111) (= (mask!9739 thiss!1504) #b00000000000000001111111111111111) (= (mask!9739 thiss!1504) #b00000000000000011111111111111111) (= (mask!9739 thiss!1504) #b00000000000000111111111111111111) (= (mask!9739 thiss!1504) #b00000000000001111111111111111111) (= (mask!9739 thiss!1504) #b00000000000011111111111111111111) (= (mask!9739 thiss!1504) #b00000000000111111111111111111111) (= (mask!9739 thiss!1504) #b00000000001111111111111111111111) (= (mask!9739 thiss!1504) #b00000000011111111111111111111111) (= (mask!9739 thiss!1504) #b00000000111111111111111111111111) (= (mask!9739 thiss!1504) #b00000001111111111111111111111111) (= (mask!9739 thiss!1504) #b00000011111111111111111111111111) (= (mask!9739 thiss!1504) #b00000111111111111111111111111111) (= (mask!9739 thiss!1504) #b00001111111111111111111111111111) (= (mask!9739 thiss!1504) #b00011111111111111111111111111111) (= (mask!9739 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9739 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215327 d!58429))

(declare-fun b!215389 () Bool)

(declare-fun e!140115 () Bool)

(assert (=> b!215389 (= e!140115 tp_is_empty!5577)))

(declare-fun mapIsEmpty!9510 () Bool)

(declare-fun mapRes!9510 () Bool)

(assert (=> mapIsEmpty!9510 mapRes!9510))

(declare-fun condMapEmpty!9510 () Bool)

(declare-fun mapDefault!9510 () ValueCell!2445)

(assert (=> mapNonEmpty!9504 (= condMapEmpty!9510 (= mapRest!9504 ((as const (Array (_ BitVec 32) ValueCell!2445)) mapDefault!9510)))))

(declare-fun e!140116 () Bool)

(assert (=> mapNonEmpty!9504 (= tp!20255 (and e!140116 mapRes!9510))))

(declare-fun mapNonEmpty!9510 () Bool)

(declare-fun tp!20265 () Bool)

(assert (=> mapNonEmpty!9510 (= mapRes!9510 (and tp!20265 e!140115))))

(declare-fun mapValue!9510 () ValueCell!2445)

(declare-fun mapKey!9510 () (_ BitVec 32))

(declare-fun mapRest!9510 () (Array (_ BitVec 32) ValueCell!2445))

(assert (=> mapNonEmpty!9510 (= mapRest!9504 (store mapRest!9510 mapKey!9510 mapValue!9510))))

(declare-fun b!215390 () Bool)

(assert (=> b!215390 (= e!140116 tp_is_empty!5577)))

(assert (= (and mapNonEmpty!9504 condMapEmpty!9510) mapIsEmpty!9510))

(assert (= (and mapNonEmpty!9504 (not condMapEmpty!9510)) mapNonEmpty!9510))

(assert (= (and mapNonEmpty!9510 ((_ is ValueCellFull!2445) mapValue!9510)) b!215389))

(assert (= (and mapNonEmpty!9504 ((_ is ValueCellFull!2445) mapDefault!9510)) b!215390))

(declare-fun m!242629 () Bool)

(assert (=> mapNonEmpty!9510 m!242629))

(check-sat (not mapNonEmpty!9510) (not b!215381) (not d!58423) tp_is_empty!5577 (not b!215371) b_and!12605 (not b_next!5715) (not b!215382) (not d!58421) (not b!215380))
(check-sat b_and!12605 (not b_next!5715))
(get-model)

(declare-fun b!215403 () Bool)

(declare-fun e!140125 () SeekEntryResult!730)

(assert (=> b!215403 (= e!140125 (MissingVacant!730 (index!5092 lt!110940)))))

(declare-fun b!215404 () Bool)

(declare-fun e!140124 () SeekEntryResult!730)

(assert (=> b!215404 (= e!140124 (Found!730 (index!5092 lt!110940)))))

(declare-fun b!215405 () Bool)

(declare-fun e!140123 () SeekEntryResult!730)

(assert (=> b!215405 (= e!140123 Undefined!730)))

(declare-fun d!58431 () Bool)

(declare-fun lt!110945 () SeekEntryResult!730)

(assert (=> d!58431 (and (or ((_ is Undefined!730) lt!110945) (not ((_ is Found!730) lt!110945)) (and (bvsge (index!5091 lt!110945) #b00000000000000000000000000000000) (bvslt (index!5091 lt!110945) (size!5248 (_keys!6075 thiss!1504))))) (or ((_ is Undefined!730) lt!110945) ((_ is Found!730) lt!110945) (not ((_ is MissingVacant!730) lt!110945)) (not (= (index!5093 lt!110945) (index!5092 lt!110940))) (and (bvsge (index!5093 lt!110945) #b00000000000000000000000000000000) (bvslt (index!5093 lt!110945) (size!5248 (_keys!6075 thiss!1504))))) (or ((_ is Undefined!730) lt!110945) (ite ((_ is Found!730) lt!110945) (= (select (arr!4919 (_keys!6075 thiss!1504)) (index!5091 lt!110945)) key!932) (and ((_ is MissingVacant!730) lt!110945) (= (index!5093 lt!110945) (index!5092 lt!110940)) (= (select (arr!4919 (_keys!6075 thiss!1504)) (index!5093 lt!110945)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58431 (= lt!110945 e!140123)))

(declare-fun c!36179 () Bool)

(assert (=> d!58431 (= c!36179 (bvsge (x!22487 lt!110940) #b01111111111111111111111111111110))))

(declare-fun lt!110946 () (_ BitVec 64))

(assert (=> d!58431 (= lt!110946 (select (arr!4919 (_keys!6075 thiss!1504)) (index!5092 lt!110940)))))

(assert (=> d!58431 (validMask!0 (mask!9739 thiss!1504))))

(assert (=> d!58431 (= (seekKeyOrZeroReturnVacant!0 (x!22487 lt!110940) (index!5092 lt!110940) (index!5092 lt!110940) key!932 (_keys!6075 thiss!1504) (mask!9739 thiss!1504)) lt!110945)))

(declare-fun b!215406 () Bool)

(assert (=> b!215406 (= e!140123 e!140124)))

(declare-fun c!36178 () Bool)

(assert (=> b!215406 (= c!36178 (= lt!110946 key!932))))

(declare-fun b!215407 () Bool)

(declare-fun c!36177 () Bool)

(assert (=> b!215407 (= c!36177 (= lt!110946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215407 (= e!140124 e!140125)))

(declare-fun b!215408 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215408 (= e!140125 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22487 lt!110940) #b00000000000000000000000000000001) (nextIndex!0 (index!5092 lt!110940) (x!22487 lt!110940) (mask!9739 thiss!1504)) (index!5092 lt!110940) key!932 (_keys!6075 thiss!1504) (mask!9739 thiss!1504)))))

(assert (= (and d!58431 c!36179) b!215405))

(assert (= (and d!58431 (not c!36179)) b!215406))

(assert (= (and b!215406 c!36178) b!215404))

(assert (= (and b!215406 (not c!36178)) b!215407))

(assert (= (and b!215407 c!36177) b!215403))

(assert (= (and b!215407 (not c!36177)) b!215408))

(declare-fun m!242631 () Bool)

(assert (=> d!58431 m!242631))

(declare-fun m!242633 () Bool)

(assert (=> d!58431 m!242633))

(assert (=> d!58431 m!242617))

(assert (=> d!58431 m!242585))

(declare-fun m!242635 () Bool)

(assert (=> b!215408 m!242635))

(assert (=> b!215408 m!242635))

(declare-fun m!242637 () Bool)

(assert (=> b!215408 m!242637))

(assert (=> b!215371 d!58431))

(declare-fun b!215418 () Bool)

(declare-fun res!105378 () Bool)

(declare-fun e!140128 () Bool)

(assert (=> b!215418 (=> (not res!105378) (not e!140128))))

(declare-fun size!5251 (LongMapFixedSize!2790) (_ BitVec 32))

(assert (=> b!215418 (= res!105378 (bvsge (size!5251 thiss!1504) (_size!1444 thiss!1504)))))

(declare-fun b!215419 () Bool)

(declare-fun res!105376 () Bool)

(assert (=> b!215419 (=> (not res!105376) (not e!140128))))

(assert (=> b!215419 (= res!105376 (= (size!5251 thiss!1504) (bvadd (_size!1444 thiss!1504) (bvsdiv (bvadd (extraKeys!3782 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!215420 () Bool)

(assert (=> b!215420 (= e!140128 (and (bvsge (extraKeys!3782 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3782 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1444 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215417 () Bool)

(declare-fun res!105375 () Bool)

(assert (=> b!215417 (=> (not res!105375) (not e!140128))))

(assert (=> b!215417 (= res!105375 (and (= (size!5247 (_values!4028 thiss!1504)) (bvadd (mask!9739 thiss!1504) #b00000000000000000000000000000001)) (= (size!5248 (_keys!6075 thiss!1504)) (size!5247 (_values!4028 thiss!1504))) (bvsge (_size!1444 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1444 thiss!1504) (bvadd (mask!9739 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!58433 () Bool)

(declare-fun res!105377 () Bool)

(assert (=> d!58433 (=> (not res!105377) (not e!140128))))

(assert (=> d!58433 (= res!105377 (validMask!0 (mask!9739 thiss!1504)))))

(assert (=> d!58433 (= (simpleValid!217 thiss!1504) e!140128)))

(assert (= (and d!58433 res!105377) b!215417))

(assert (= (and b!215417 res!105375) b!215418))

(assert (= (and b!215418 res!105378) b!215419))

(assert (= (and b!215419 res!105376) b!215420))

(declare-fun m!242639 () Bool)

(assert (=> b!215418 m!242639))

(assert (=> b!215419 m!242639))

(assert (=> d!58433 m!242585))

(assert (=> d!58423 d!58433))

(declare-fun b!215439 () Bool)

(declare-fun e!140139 () SeekEntryResult!730)

(assert (=> b!215439 (= e!140139 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9739 thiss!1504)) #b00000000000000000000000000000000 (mask!9739 thiss!1504)) key!932 (_keys!6075 thiss!1504) (mask!9739 thiss!1504)))))

(declare-fun b!215440 () Bool)

(declare-fun e!140143 () SeekEntryResult!730)

(assert (=> b!215440 (= e!140143 (Intermediate!730 true (toIndex!0 key!932 (mask!9739 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215441 () Bool)

(declare-fun e!140142 () Bool)

(declare-fun lt!110952 () SeekEntryResult!730)

(assert (=> b!215441 (= e!140142 (bvsge (x!22487 lt!110952) #b01111111111111111111111111111110))))

(declare-fun b!215442 () Bool)

(assert (=> b!215442 (and (bvsge (index!5092 lt!110952) #b00000000000000000000000000000000) (bvslt (index!5092 lt!110952) (size!5248 (_keys!6075 thiss!1504))))))

(declare-fun res!105387 () Bool)

(assert (=> b!215442 (= res!105387 (= (select (arr!4919 (_keys!6075 thiss!1504)) (index!5092 lt!110952)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140140 () Bool)

(assert (=> b!215442 (=> res!105387 e!140140)))

(declare-fun d!58435 () Bool)

(assert (=> d!58435 e!140142))

(declare-fun c!36188 () Bool)

(assert (=> d!58435 (= c!36188 (and ((_ is Intermediate!730) lt!110952) (undefined!1542 lt!110952)))))

(assert (=> d!58435 (= lt!110952 e!140143)))

(declare-fun c!36186 () Bool)

(assert (=> d!58435 (= c!36186 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!110951 () (_ BitVec 64))

(assert (=> d!58435 (= lt!110951 (select (arr!4919 (_keys!6075 thiss!1504)) (toIndex!0 key!932 (mask!9739 thiss!1504))))))

(assert (=> d!58435 (validMask!0 (mask!9739 thiss!1504))))

(assert (=> d!58435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9739 thiss!1504)) key!932 (_keys!6075 thiss!1504) (mask!9739 thiss!1504)) lt!110952)))

(declare-fun b!215443 () Bool)

(assert (=> b!215443 (= e!140143 e!140139)))

(declare-fun c!36187 () Bool)

(assert (=> b!215443 (= c!36187 (or (= lt!110951 key!932) (= (bvadd lt!110951 lt!110951) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!215444 () Bool)

(assert (=> b!215444 (and (bvsge (index!5092 lt!110952) #b00000000000000000000000000000000) (bvslt (index!5092 lt!110952) (size!5248 (_keys!6075 thiss!1504))))))

(assert (=> b!215444 (= e!140140 (= (select (arr!4919 (_keys!6075 thiss!1504)) (index!5092 lt!110952)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!215445 () Bool)

(declare-fun e!140141 () Bool)

(assert (=> b!215445 (= e!140142 e!140141)))

(declare-fun res!105385 () Bool)

(assert (=> b!215445 (= res!105385 (and ((_ is Intermediate!730) lt!110952) (not (undefined!1542 lt!110952)) (bvslt (x!22487 lt!110952) #b01111111111111111111111111111110) (bvsge (x!22487 lt!110952) #b00000000000000000000000000000000) (bvsge (x!22487 lt!110952) #b00000000000000000000000000000000)))))

(assert (=> b!215445 (=> (not res!105385) (not e!140141))))

(declare-fun b!215446 () Bool)

(assert (=> b!215446 (and (bvsge (index!5092 lt!110952) #b00000000000000000000000000000000) (bvslt (index!5092 lt!110952) (size!5248 (_keys!6075 thiss!1504))))))

(declare-fun res!105386 () Bool)

(assert (=> b!215446 (= res!105386 (= (select (arr!4919 (_keys!6075 thiss!1504)) (index!5092 lt!110952)) key!932))))

(assert (=> b!215446 (=> res!105386 e!140140)))

(assert (=> b!215446 (= e!140141 e!140140)))

(declare-fun b!215447 () Bool)

(assert (=> b!215447 (= e!140139 (Intermediate!730 false (toIndex!0 key!932 (mask!9739 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!58435 c!36186) b!215440))

(assert (= (and d!58435 (not c!36186)) b!215443))

(assert (= (and b!215443 c!36187) b!215447))

(assert (= (and b!215443 (not c!36187)) b!215439))

(assert (= (and d!58435 c!36188) b!215441))

(assert (= (and d!58435 (not c!36188)) b!215445))

(assert (= (and b!215445 res!105385) b!215446))

(assert (= (and b!215446 (not res!105386)) b!215442))

(assert (= (and b!215442 (not res!105387)) b!215444))

(assert (=> d!58435 m!242607))

(declare-fun m!242641 () Bool)

(assert (=> d!58435 m!242641))

(assert (=> d!58435 m!242585))

(declare-fun m!242643 () Bool)

(assert (=> b!215446 m!242643))

(assert (=> b!215444 m!242643))

(assert (=> b!215439 m!242607))

(declare-fun m!242645 () Bool)

(assert (=> b!215439 m!242645))

(assert (=> b!215439 m!242645))

(declare-fun m!242647 () Bool)

(assert (=> b!215439 m!242647))

(assert (=> b!215442 m!242643))

(assert (=> d!58421 d!58435))

(declare-fun d!58437 () Bool)

(declare-fun lt!110958 () (_ BitVec 32))

(declare-fun lt!110957 () (_ BitVec 32))

(assert (=> d!58437 (= lt!110958 (bvmul (bvxor lt!110957 (bvlshr lt!110957 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58437 (= lt!110957 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58437 (and (bvsge (mask!9739 thiss!1504) #b00000000000000000000000000000000) (let ((res!105388 (let ((h!3777 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22504 (bvmul (bvxor h!3777 (bvlshr h!3777 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22504 (bvlshr x!22504 #b00000000000000000000000000001101)) (mask!9739 thiss!1504)))))) (and (bvslt res!105388 (bvadd (mask!9739 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105388 #b00000000000000000000000000000000))))))

(assert (=> d!58437 (= (toIndex!0 key!932 (mask!9739 thiss!1504)) (bvand (bvxor lt!110958 (bvlshr lt!110958 #b00000000000000000000000000001101)) (mask!9739 thiss!1504)))))

(assert (=> d!58421 d!58437))

(assert (=> d!58421 d!58429))

(declare-fun bm!20340 () Bool)

(declare-fun call!20343 () Bool)

(assert (=> bm!20340 (= call!20343 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6075 thiss!1504) (mask!9739 thiss!1504)))))

(declare-fun b!215456 () Bool)

(declare-fun e!140151 () Bool)

(assert (=> b!215456 (= e!140151 call!20343)))

(declare-fun b!215457 () Bool)

(declare-fun e!140150 () Bool)

(assert (=> b!215457 (= e!140150 e!140151)))

(declare-fun c!36191 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215457 (= c!36191 (validKeyInArray!0 (select (arr!4919 (_keys!6075 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215458 () Bool)

(declare-fun e!140152 () Bool)

(assert (=> b!215458 (= e!140152 call!20343)))

(declare-fun d!58439 () Bool)

(declare-fun res!105393 () Bool)

(assert (=> d!58439 (=> res!105393 e!140150)))

(assert (=> d!58439 (= res!105393 (bvsge #b00000000000000000000000000000000 (size!5248 (_keys!6075 thiss!1504))))))

(assert (=> d!58439 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6075 thiss!1504) (mask!9739 thiss!1504)) e!140150)))

(declare-fun b!215459 () Bool)

(assert (=> b!215459 (= e!140151 e!140152)))

(declare-fun lt!110965 () (_ BitVec 64))

(assert (=> b!215459 (= lt!110965 (select (arr!4919 (_keys!6075 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6496 0))(
  ( (Unit!6497) )
))
(declare-fun lt!110967 () Unit!6496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10381 (_ BitVec 64) (_ BitVec 32)) Unit!6496)

(assert (=> b!215459 (= lt!110967 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6075 thiss!1504) lt!110965 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215459 (arrayContainsKey!0 (_keys!6075 thiss!1504) lt!110965 #b00000000000000000000000000000000)))

(declare-fun lt!110966 () Unit!6496)

(assert (=> b!215459 (= lt!110966 lt!110967)))

(declare-fun res!105394 () Bool)

(assert (=> b!215459 (= res!105394 (= (seekEntryOrOpen!0 (select (arr!4919 (_keys!6075 thiss!1504)) #b00000000000000000000000000000000) (_keys!6075 thiss!1504) (mask!9739 thiss!1504)) (Found!730 #b00000000000000000000000000000000)))))

(assert (=> b!215459 (=> (not res!105394) (not e!140152))))

(assert (= (and d!58439 (not res!105393)) b!215457))

(assert (= (and b!215457 c!36191) b!215459))

(assert (= (and b!215457 (not c!36191)) b!215456))

(assert (= (and b!215459 res!105394) b!215458))

(assert (= (or b!215458 b!215456) bm!20340))

(declare-fun m!242649 () Bool)

(assert (=> bm!20340 m!242649))

(declare-fun m!242651 () Bool)

(assert (=> b!215457 m!242651))

(assert (=> b!215457 m!242651))

(declare-fun m!242653 () Bool)

(assert (=> b!215457 m!242653))

(assert (=> b!215459 m!242651))

(declare-fun m!242655 () Bool)

(assert (=> b!215459 m!242655))

(declare-fun m!242657 () Bool)

(assert (=> b!215459 m!242657))

(assert (=> b!215459 m!242651))

(declare-fun m!242659 () Bool)

(assert (=> b!215459 m!242659))

(assert (=> b!215381 d!58439))

(declare-fun b!215468 () Bool)

(declare-fun e!140157 () (_ BitVec 32))

(declare-fun call!20346 () (_ BitVec 32))

(assert (=> b!215468 (= e!140157 (bvadd #b00000000000000000000000000000001 call!20346))))

(declare-fun b!215469 () Bool)

(declare-fun e!140158 () (_ BitVec 32))

(assert (=> b!215469 (= e!140158 #b00000000000000000000000000000000)))

(declare-fun bm!20343 () Bool)

(assert (=> bm!20343 (= call!20346 (arrayCountValidKeys!0 (_keys!6075 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5248 (_keys!6075 thiss!1504))))))

(declare-fun d!58441 () Bool)

(declare-fun lt!110970 () (_ BitVec 32))

(assert (=> d!58441 (and (bvsge lt!110970 #b00000000000000000000000000000000) (bvsle lt!110970 (bvsub (size!5248 (_keys!6075 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58441 (= lt!110970 e!140158)))

(declare-fun c!36196 () Bool)

(assert (=> d!58441 (= c!36196 (bvsge #b00000000000000000000000000000000 (size!5248 (_keys!6075 thiss!1504))))))

(assert (=> d!58441 (and (bvsle #b00000000000000000000000000000000 (size!5248 (_keys!6075 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5248 (_keys!6075 thiss!1504)) (size!5248 (_keys!6075 thiss!1504))))))

(assert (=> d!58441 (= (arrayCountValidKeys!0 (_keys!6075 thiss!1504) #b00000000000000000000000000000000 (size!5248 (_keys!6075 thiss!1504))) lt!110970)))

(declare-fun b!215470 () Bool)

(assert (=> b!215470 (= e!140158 e!140157)))

(declare-fun c!36197 () Bool)

(assert (=> b!215470 (= c!36197 (validKeyInArray!0 (select (arr!4919 (_keys!6075 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215471 () Bool)

(assert (=> b!215471 (= e!140157 call!20346)))

(assert (= (and d!58441 c!36196) b!215469))

(assert (= (and d!58441 (not c!36196)) b!215470))

(assert (= (and b!215470 c!36197) b!215468))

(assert (= (and b!215470 (not c!36197)) b!215471))

(assert (= (or b!215468 b!215471) bm!20343))

(declare-fun m!242661 () Bool)

(assert (=> bm!20343 m!242661))

(assert (=> b!215470 m!242651))

(assert (=> b!215470 m!242651))

(assert (=> b!215470 m!242653))

(assert (=> b!215380 d!58441))

(declare-fun d!58443 () Bool)

(declare-fun res!105402 () Bool)

(declare-fun e!140167 () Bool)

(assert (=> d!58443 (=> res!105402 e!140167)))

(assert (=> d!58443 (= res!105402 (bvsge #b00000000000000000000000000000000 (size!5248 (_keys!6075 thiss!1504))))))

(assert (=> d!58443 (= (arrayNoDuplicates!0 (_keys!6075 thiss!1504) #b00000000000000000000000000000000 Nil!3133) e!140167)))

(declare-fun bm!20346 () Bool)

(declare-fun call!20349 () Bool)

(declare-fun c!36200 () Bool)

(assert (=> bm!20346 (= call!20349 (arrayNoDuplicates!0 (_keys!6075 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36200 (Cons!3132 (select (arr!4919 (_keys!6075 thiss!1504)) #b00000000000000000000000000000000) Nil!3133) Nil!3133)))))

(declare-fun b!215482 () Bool)

(declare-fun e!140170 () Bool)

(assert (=> b!215482 (= e!140170 call!20349)))

(declare-fun b!215483 () Bool)

(declare-fun e!140169 () Bool)

(assert (=> b!215483 (= e!140169 e!140170)))

(assert (=> b!215483 (= c!36200 (validKeyInArray!0 (select (arr!4919 (_keys!6075 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215484 () Bool)

(assert (=> b!215484 (= e!140167 e!140169)))

(declare-fun res!105401 () Bool)

(assert (=> b!215484 (=> (not res!105401) (not e!140169))))

(declare-fun e!140168 () Bool)

(assert (=> b!215484 (= res!105401 (not e!140168))))

(declare-fun res!105403 () Bool)

(assert (=> b!215484 (=> (not res!105403) (not e!140168))))

(assert (=> b!215484 (= res!105403 (validKeyInArray!0 (select (arr!4919 (_keys!6075 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215485 () Bool)

(declare-fun contains!1429 (List!3136 (_ BitVec 64)) Bool)

(assert (=> b!215485 (= e!140168 (contains!1429 Nil!3133 (select (arr!4919 (_keys!6075 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215486 () Bool)

(assert (=> b!215486 (= e!140170 call!20349)))

(assert (= (and d!58443 (not res!105402)) b!215484))

(assert (= (and b!215484 res!105403) b!215485))

(assert (= (and b!215484 res!105401) b!215483))

(assert (= (and b!215483 c!36200) b!215486))

(assert (= (and b!215483 (not c!36200)) b!215482))

(assert (= (or b!215486 b!215482) bm!20346))

(assert (=> bm!20346 m!242651))

(declare-fun m!242663 () Bool)

(assert (=> bm!20346 m!242663))

(assert (=> b!215483 m!242651))

(assert (=> b!215483 m!242651))

(assert (=> b!215483 m!242653))

(assert (=> b!215484 m!242651))

(assert (=> b!215484 m!242651))

(assert (=> b!215484 m!242653))

(assert (=> b!215485 m!242651))

(assert (=> b!215485 m!242651))

(declare-fun m!242665 () Bool)

(assert (=> b!215485 m!242665))

(assert (=> b!215382 d!58443))

(declare-fun b!215487 () Bool)

(declare-fun e!140171 () Bool)

(assert (=> b!215487 (= e!140171 tp_is_empty!5577)))

(declare-fun mapIsEmpty!9511 () Bool)

(declare-fun mapRes!9511 () Bool)

(assert (=> mapIsEmpty!9511 mapRes!9511))

(declare-fun condMapEmpty!9511 () Bool)

(declare-fun mapDefault!9511 () ValueCell!2445)

(assert (=> mapNonEmpty!9510 (= condMapEmpty!9511 (= mapRest!9510 ((as const (Array (_ BitVec 32) ValueCell!2445)) mapDefault!9511)))))

(declare-fun e!140172 () Bool)

(assert (=> mapNonEmpty!9510 (= tp!20265 (and e!140172 mapRes!9511))))

(declare-fun mapNonEmpty!9511 () Bool)

(declare-fun tp!20266 () Bool)

(assert (=> mapNonEmpty!9511 (= mapRes!9511 (and tp!20266 e!140171))))

(declare-fun mapRest!9511 () (Array (_ BitVec 32) ValueCell!2445))

(declare-fun mapValue!9511 () ValueCell!2445)

(declare-fun mapKey!9511 () (_ BitVec 32))

(assert (=> mapNonEmpty!9511 (= mapRest!9510 (store mapRest!9511 mapKey!9511 mapValue!9511))))

(declare-fun b!215488 () Bool)

(assert (=> b!215488 (= e!140172 tp_is_empty!5577)))

(assert (= (and mapNonEmpty!9510 condMapEmpty!9511) mapIsEmpty!9511))

(assert (= (and mapNonEmpty!9510 (not condMapEmpty!9511)) mapNonEmpty!9511))

(assert (= (and mapNonEmpty!9511 ((_ is ValueCellFull!2445) mapValue!9511)) b!215487))

(assert (= (and mapNonEmpty!9510 ((_ is ValueCellFull!2445) mapDefault!9511)) b!215488))

(declare-fun m!242667 () Bool)

(assert (=> mapNonEmpty!9511 m!242667))

(check-sat tp_is_empty!5577 (not b!215485) (not d!58433) (not d!58435) (not b!215459) (not bm!20340) (not b!215484) (not b!215439) b_and!12605 (not b_next!5715) (not b!215419) (not b!215408) (not b!215470) (not d!58431) (not b!215418) (not bm!20343) (not b!215483) (not bm!20346) (not mapNonEmpty!9511) (not b!215457))
(check-sat b_and!12605 (not b_next!5715))
