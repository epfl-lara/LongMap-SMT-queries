; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21318 () Bool)

(assert start!21318)

(declare-fun b!214492 () Bool)

(declare-fun b_free!5679 () Bool)

(declare-fun b_next!5679 () Bool)

(assert (=> b!214492 (= b_free!5679 (not b_next!5679))))

(declare-fun tp!20127 () Bool)

(declare-fun b_and!12569 () Bool)

(assert (=> b!214492 (= tp!20127 b_and!12569)))

(declare-fun b!214490 () Bool)

(declare-fun e!139507 () Bool)

(declare-fun tp_is_empty!5541 () Bool)

(assert (=> b!214490 (= e!139507 tp_is_empty!5541)))

(declare-fun b!214491 () Bool)

(declare-fun res!105002 () Bool)

(declare-fun e!139506 () Bool)

(assert (=> b!214491 (=> (not res!105002) (not e!139506))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214491 (= res!105002 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!105004 () Bool)

(assert (=> start!21318 (=> (not res!105004) (not e!139506))))

(declare-datatypes ((V!7035 0))(
  ( (V!7036 (val!2815 Int)) )
))
(declare-datatypes ((ValueCell!2427 0))(
  ( (ValueCellFull!2427 (v!4833 V!7035)) (EmptyCell!2427) )
))
(declare-datatypes ((array!10295 0))(
  ( (array!10296 (arr!4882 (Array (_ BitVec 32) ValueCell!2427)) (size!5209 (_ BitVec 32))) )
))
(declare-datatypes ((array!10297 0))(
  ( (array!10298 (arr!4883 (Array (_ BitVec 32) (_ BitVec 64))) (size!5210 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2754 0))(
  ( (LongMapFixedSize!2755 (defaultEntry!4027 Int) (mask!9689 (_ BitVec 32)) (extraKeys!3764 (_ BitVec 32)) (zeroValue!3868 V!7035) (minValue!3868 V!7035) (_size!1426 (_ BitVec 32)) (_keys!6045 array!10297) (_values!4010 array!10295) (_vacant!1426 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2754)

(declare-fun valid!1127 (LongMapFixedSize!2754) Bool)

(assert (=> start!21318 (= res!105004 (valid!1127 thiss!1504))))

(assert (=> start!21318 e!139506))

(declare-fun e!139509 () Bool)

(assert (=> start!21318 e!139509))

(assert (=> start!21318 true))

(declare-fun e!139508 () Bool)

(declare-fun array_inv!3227 (array!10297) Bool)

(declare-fun array_inv!3228 (array!10295) Bool)

(assert (=> b!214492 (= e!139509 (and tp!20127 tp_is_empty!5541 (array_inv!3227 (_keys!6045 thiss!1504)) (array_inv!3228 (_values!4010 thiss!1504)) e!139508))))

(declare-fun b!214493 () Bool)

(declare-fun e!139504 () Bool)

(assert (=> b!214493 (= e!139504 tp_is_empty!5541)))

(declare-fun mapNonEmpty!9430 () Bool)

(declare-fun mapRes!9430 () Bool)

(declare-fun tp!20128 () Bool)

(assert (=> mapNonEmpty!9430 (= mapRes!9430 (and tp!20128 e!139504))))

(declare-fun mapKey!9430 () (_ BitVec 32))

(declare-fun mapRest!9430 () (Array (_ BitVec 32) ValueCell!2427))

(declare-fun mapValue!9430 () ValueCell!2427)

(assert (=> mapNonEmpty!9430 (= (arr!4882 (_values!4010 thiss!1504)) (store mapRest!9430 mapKey!9430 mapValue!9430))))

(declare-fun mapIsEmpty!9430 () Bool)

(assert (=> mapIsEmpty!9430 mapRes!9430))

(declare-fun b!214494 () Bool)

(assert (=> b!214494 (= e!139508 (and e!139507 mapRes!9430))))

(declare-fun condMapEmpty!9430 () Bool)

(declare-fun mapDefault!9430 () ValueCell!2427)

(assert (=> b!214494 (= condMapEmpty!9430 (= (arr!4882 (_values!4010 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2427)) mapDefault!9430)))))

(declare-fun b!214495 () Bool)

(declare-fun res!105003 () Bool)

(assert (=> b!214495 (=> (not res!105003) (not e!139506))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!718 0))(
  ( (MissingZero!718 (index!5042 (_ BitVec 32))) (Found!718 (index!5043 (_ BitVec 32))) (Intermediate!718 (undefined!1530 Bool) (index!5044 (_ BitVec 32)) (x!22361 (_ BitVec 32))) (Undefined!718) (MissingVacant!718 (index!5045 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10297 (_ BitVec 32)) SeekEntryResult!718)

(assert (=> b!214495 (= res!105003 (not (= (seekEntryOrOpen!0 key!932 (_keys!6045 thiss!1504) (mask!9689 thiss!1504)) (MissingZero!718 index!297))))))

(declare-fun b!214496 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214496 (= e!139506 (not (validMask!0 (mask!9689 thiss!1504))))))

(assert (= (and start!21318 res!105004) b!214491))

(assert (= (and b!214491 res!105002) b!214495))

(assert (= (and b!214495 res!105003) b!214496))

(assert (= (and b!214494 condMapEmpty!9430) mapIsEmpty!9430))

(assert (= (and b!214494 (not condMapEmpty!9430)) mapNonEmpty!9430))

(get-info :version)

(assert (= (and mapNonEmpty!9430 ((_ is ValueCellFull!2427) mapValue!9430)) b!214493))

(assert (= (and b!214494 ((_ is ValueCellFull!2427) mapDefault!9430)) b!214490))

(assert (= b!214492 b!214494))

(assert (= start!21318 b!214492))

(declare-fun m!242141 () Bool)

(assert (=> start!21318 m!242141))

(declare-fun m!242143 () Bool)

(assert (=> mapNonEmpty!9430 m!242143))

(declare-fun m!242145 () Bool)

(assert (=> b!214495 m!242145))

(declare-fun m!242147 () Bool)

(assert (=> b!214492 m!242147))

(declare-fun m!242149 () Bool)

(assert (=> b!214492 m!242149))

(declare-fun m!242151 () Bool)

(assert (=> b!214496 m!242151))

(check-sat tp_is_empty!5541 b_and!12569 (not b_next!5679) (not start!21318) (not b!214492) (not b!214495) (not b!214496) (not mapNonEmpty!9430))
(check-sat b_and!12569 (not b_next!5679))
(get-model)

(declare-fun d!58319 () Bool)

(assert (=> d!58319 (= (validMask!0 (mask!9689 thiss!1504)) (and (or (= (mask!9689 thiss!1504) #b00000000000000000000000000000111) (= (mask!9689 thiss!1504) #b00000000000000000000000000001111) (= (mask!9689 thiss!1504) #b00000000000000000000000000011111) (= (mask!9689 thiss!1504) #b00000000000000000000000000111111) (= (mask!9689 thiss!1504) #b00000000000000000000000001111111) (= (mask!9689 thiss!1504) #b00000000000000000000000011111111) (= (mask!9689 thiss!1504) #b00000000000000000000000111111111) (= (mask!9689 thiss!1504) #b00000000000000000000001111111111) (= (mask!9689 thiss!1504) #b00000000000000000000011111111111) (= (mask!9689 thiss!1504) #b00000000000000000000111111111111) (= (mask!9689 thiss!1504) #b00000000000000000001111111111111) (= (mask!9689 thiss!1504) #b00000000000000000011111111111111) (= (mask!9689 thiss!1504) #b00000000000000000111111111111111) (= (mask!9689 thiss!1504) #b00000000000000001111111111111111) (= (mask!9689 thiss!1504) #b00000000000000011111111111111111) (= (mask!9689 thiss!1504) #b00000000000000111111111111111111) (= (mask!9689 thiss!1504) #b00000000000001111111111111111111) (= (mask!9689 thiss!1504) #b00000000000011111111111111111111) (= (mask!9689 thiss!1504) #b00000000000111111111111111111111) (= (mask!9689 thiss!1504) #b00000000001111111111111111111111) (= (mask!9689 thiss!1504) #b00000000011111111111111111111111) (= (mask!9689 thiss!1504) #b00000000111111111111111111111111) (= (mask!9689 thiss!1504) #b00000001111111111111111111111111) (= (mask!9689 thiss!1504) #b00000011111111111111111111111111) (= (mask!9689 thiss!1504) #b00000111111111111111111111111111) (= (mask!9689 thiss!1504) #b00001111111111111111111111111111) (= (mask!9689 thiss!1504) #b00011111111111111111111111111111) (= (mask!9689 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9689 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214496 d!58319))

(declare-fun d!58321 () Bool)

(declare-fun res!105020 () Bool)

(declare-fun e!139530 () Bool)

(assert (=> d!58321 (=> (not res!105020) (not e!139530))))

(declare-fun simpleValid!211 (LongMapFixedSize!2754) Bool)

(assert (=> d!58321 (= res!105020 (simpleValid!211 thiss!1504))))

(assert (=> d!58321 (= (valid!1127 thiss!1504) e!139530)))

(declare-fun b!214524 () Bool)

(declare-fun res!105021 () Bool)

(assert (=> b!214524 (=> (not res!105021) (not e!139530))))

(declare-fun arrayCountValidKeys!0 (array!10297 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214524 (= res!105021 (= (arrayCountValidKeys!0 (_keys!6045 thiss!1504) #b00000000000000000000000000000000 (size!5210 (_keys!6045 thiss!1504))) (_size!1426 thiss!1504)))))

(declare-fun b!214525 () Bool)

(declare-fun res!105022 () Bool)

(assert (=> b!214525 (=> (not res!105022) (not e!139530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10297 (_ BitVec 32)) Bool)

(assert (=> b!214525 (= res!105022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6045 thiss!1504) (mask!9689 thiss!1504)))))

(declare-fun b!214526 () Bool)

(declare-datatypes ((List!3130 0))(
  ( (Nil!3127) (Cons!3126 (h!3768 (_ BitVec 64)) (t!8085 List!3130)) )
))
(declare-fun arrayNoDuplicates!0 (array!10297 (_ BitVec 32) List!3130) Bool)

(assert (=> b!214526 (= e!139530 (arrayNoDuplicates!0 (_keys!6045 thiss!1504) #b00000000000000000000000000000000 Nil!3127))))

(assert (= (and d!58321 res!105020) b!214524))

(assert (= (and b!214524 res!105021) b!214525))

(assert (= (and b!214525 res!105022) b!214526))

(declare-fun m!242165 () Bool)

(assert (=> d!58321 m!242165))

(declare-fun m!242167 () Bool)

(assert (=> b!214524 m!242167))

(declare-fun m!242169 () Bool)

(assert (=> b!214525 m!242169))

(declare-fun m!242171 () Bool)

(assert (=> b!214526 m!242171))

(assert (=> start!21318 d!58321))

(declare-fun d!58323 () Bool)

(assert (=> d!58323 (= (array_inv!3227 (_keys!6045 thiss!1504)) (bvsge (size!5210 (_keys!6045 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214492 d!58323))

(declare-fun d!58325 () Bool)

(assert (=> d!58325 (= (array_inv!3228 (_values!4010 thiss!1504)) (bvsge (size!5209 (_values!4010 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214492 d!58325))

(declare-fun b!214539 () Bool)

(declare-fun c!36054 () Bool)

(declare-fun lt!110799 () (_ BitVec 64))

(assert (=> b!214539 (= c!36054 (= lt!110799 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139537 () SeekEntryResult!718)

(declare-fun e!139538 () SeekEntryResult!718)

(assert (=> b!214539 (= e!139537 e!139538)))

(declare-fun b!214540 () Bool)

(declare-fun lt!110798 () SeekEntryResult!718)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10297 (_ BitVec 32)) SeekEntryResult!718)

(assert (=> b!214540 (= e!139538 (seekKeyOrZeroReturnVacant!0 (x!22361 lt!110798) (index!5044 lt!110798) (index!5044 lt!110798) key!932 (_keys!6045 thiss!1504) (mask!9689 thiss!1504)))))

(declare-fun b!214541 () Bool)

(assert (=> b!214541 (= e!139538 (MissingZero!718 (index!5044 lt!110798)))))

(declare-fun b!214542 () Bool)

(assert (=> b!214542 (= e!139537 (Found!718 (index!5044 lt!110798)))))

(declare-fun b!214543 () Bool)

(declare-fun e!139539 () SeekEntryResult!718)

(assert (=> b!214543 (= e!139539 e!139537)))

(assert (=> b!214543 (= lt!110799 (select (arr!4883 (_keys!6045 thiss!1504)) (index!5044 lt!110798)))))

(declare-fun c!36056 () Bool)

(assert (=> b!214543 (= c!36056 (= lt!110799 key!932))))

(declare-fun b!214544 () Bool)

(assert (=> b!214544 (= e!139539 Undefined!718)))

(declare-fun d!58327 () Bool)

(declare-fun lt!110797 () SeekEntryResult!718)

(assert (=> d!58327 (and (or ((_ is Undefined!718) lt!110797) (not ((_ is Found!718) lt!110797)) (and (bvsge (index!5043 lt!110797) #b00000000000000000000000000000000) (bvslt (index!5043 lt!110797) (size!5210 (_keys!6045 thiss!1504))))) (or ((_ is Undefined!718) lt!110797) ((_ is Found!718) lt!110797) (not ((_ is MissingZero!718) lt!110797)) (and (bvsge (index!5042 lt!110797) #b00000000000000000000000000000000) (bvslt (index!5042 lt!110797) (size!5210 (_keys!6045 thiss!1504))))) (or ((_ is Undefined!718) lt!110797) ((_ is Found!718) lt!110797) ((_ is MissingZero!718) lt!110797) (not ((_ is MissingVacant!718) lt!110797)) (and (bvsge (index!5045 lt!110797) #b00000000000000000000000000000000) (bvslt (index!5045 lt!110797) (size!5210 (_keys!6045 thiss!1504))))) (or ((_ is Undefined!718) lt!110797) (ite ((_ is Found!718) lt!110797) (= (select (arr!4883 (_keys!6045 thiss!1504)) (index!5043 lt!110797)) key!932) (ite ((_ is MissingZero!718) lt!110797) (= (select (arr!4883 (_keys!6045 thiss!1504)) (index!5042 lt!110797)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!718) lt!110797) (= (select (arr!4883 (_keys!6045 thiss!1504)) (index!5045 lt!110797)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58327 (= lt!110797 e!139539)))

(declare-fun c!36055 () Bool)

(assert (=> d!58327 (= c!36055 (and ((_ is Intermediate!718) lt!110798) (undefined!1530 lt!110798)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10297 (_ BitVec 32)) SeekEntryResult!718)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58327 (= lt!110798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9689 thiss!1504)) key!932 (_keys!6045 thiss!1504) (mask!9689 thiss!1504)))))

(assert (=> d!58327 (validMask!0 (mask!9689 thiss!1504))))

(assert (=> d!58327 (= (seekEntryOrOpen!0 key!932 (_keys!6045 thiss!1504) (mask!9689 thiss!1504)) lt!110797)))

(assert (= (and d!58327 c!36055) b!214544))

(assert (= (and d!58327 (not c!36055)) b!214543))

(assert (= (and b!214543 c!36056) b!214542))

(assert (= (and b!214543 (not c!36056)) b!214539))

(assert (= (and b!214539 c!36054) b!214541))

(assert (= (and b!214539 (not c!36054)) b!214540))

(declare-fun m!242173 () Bool)

(assert (=> b!214540 m!242173))

(declare-fun m!242175 () Bool)

(assert (=> b!214543 m!242175))

(declare-fun m!242177 () Bool)

(assert (=> d!58327 m!242177))

(declare-fun m!242179 () Bool)

(assert (=> d!58327 m!242179))

(declare-fun m!242181 () Bool)

(assert (=> d!58327 m!242181))

(declare-fun m!242183 () Bool)

(assert (=> d!58327 m!242183))

(assert (=> d!58327 m!242151))

(assert (=> d!58327 m!242181))

(declare-fun m!242185 () Bool)

(assert (=> d!58327 m!242185))

(assert (=> b!214495 d!58327))

(declare-fun b!214552 () Bool)

(declare-fun e!139545 () Bool)

(assert (=> b!214552 (= e!139545 tp_is_empty!5541)))

(declare-fun mapNonEmpty!9436 () Bool)

(declare-fun mapRes!9436 () Bool)

(declare-fun tp!20137 () Bool)

(declare-fun e!139544 () Bool)

(assert (=> mapNonEmpty!9436 (= mapRes!9436 (and tp!20137 e!139544))))

(declare-fun mapKey!9436 () (_ BitVec 32))

(declare-fun mapValue!9436 () ValueCell!2427)

(declare-fun mapRest!9436 () (Array (_ BitVec 32) ValueCell!2427))

(assert (=> mapNonEmpty!9436 (= mapRest!9430 (store mapRest!9436 mapKey!9436 mapValue!9436))))

(declare-fun b!214551 () Bool)

(assert (=> b!214551 (= e!139544 tp_is_empty!5541)))

(declare-fun mapIsEmpty!9436 () Bool)

(assert (=> mapIsEmpty!9436 mapRes!9436))

(declare-fun condMapEmpty!9436 () Bool)

(declare-fun mapDefault!9436 () ValueCell!2427)

(assert (=> mapNonEmpty!9430 (= condMapEmpty!9436 (= mapRest!9430 ((as const (Array (_ BitVec 32) ValueCell!2427)) mapDefault!9436)))))

(assert (=> mapNonEmpty!9430 (= tp!20128 (and e!139545 mapRes!9436))))

(assert (= (and mapNonEmpty!9430 condMapEmpty!9436) mapIsEmpty!9436))

(assert (= (and mapNonEmpty!9430 (not condMapEmpty!9436)) mapNonEmpty!9436))

(assert (= (and mapNonEmpty!9436 ((_ is ValueCellFull!2427) mapValue!9436)) b!214551))

(assert (= (and mapNonEmpty!9430 ((_ is ValueCellFull!2427) mapDefault!9436)) b!214552))

(declare-fun m!242187 () Bool)

(assert (=> mapNonEmpty!9436 m!242187))

(check-sat (not b!214524) tp_is_empty!5541 (not b!214525) (not mapNonEmpty!9436) b_and!12569 (not b!214540) (not b_next!5679) (not b!214526) (not d!58321) (not d!58327))
(check-sat b_and!12569 (not b_next!5679))
