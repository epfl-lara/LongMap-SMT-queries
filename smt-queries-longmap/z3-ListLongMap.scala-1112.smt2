; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22920 () Bool)

(assert start!22920)

(declare-fun b!239070 () Bool)

(declare-fun b_free!6423 () Bool)

(declare-fun b_next!6423 () Bool)

(assert (=> b!239070 (= b_free!6423 (not b_next!6423))))

(declare-fun tp!22472 () Bool)

(declare-fun b_and!13389 () Bool)

(assert (=> b!239070 (= tp!22472 b_and!13389)))

(declare-fun b!239060 () Bool)

(declare-fun e!155215 () Bool)

(declare-fun e!155225 () Bool)

(assert (=> b!239060 (= e!155215 e!155225)))

(declare-fun res!117158 () Bool)

(declare-fun call!22230 () Bool)

(assert (=> b!239060 (= res!117158 call!22230)))

(assert (=> b!239060 (=> (not res!117158) (not e!155225))))

(declare-fun b!239061 () Bool)

(declare-fun e!155222 () Bool)

(declare-fun tp_is_empty!6285 () Bool)

(assert (=> b!239061 (= e!155222 tp_is_empty!6285)))

(declare-fun b!239063 () Bool)

(declare-fun call!22229 () Bool)

(assert (=> b!239063 (= e!155225 (not call!22229))))

(declare-fun b!239064 () Bool)

(declare-fun e!155216 () Bool)

(declare-fun e!155220 () Bool)

(assert (=> b!239064 (= e!155216 e!155220)))

(declare-fun res!117164 () Bool)

(assert (=> b!239064 (=> (not res!117164) (not e!155220))))

(declare-datatypes ((SeekEntryResult!1027 0))(
  ( (MissingZero!1027 (index!6278 (_ BitVec 32))) (Found!1027 (index!6279 (_ BitVec 32))) (Intermediate!1027 (undefined!1839 Bool) (index!6280 (_ BitVec 32)) (x!24083 (_ BitVec 32))) (Undefined!1027) (MissingVacant!1027 (index!6281 (_ BitVec 32))) )
))
(declare-fun lt!120716 () SeekEntryResult!1027)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239064 (= res!117164 (or (= lt!120716 (MissingZero!1027 index!297)) (= lt!120716 (MissingVacant!1027 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8027 0))(
  ( (V!8028 (val!3187 Int)) )
))
(declare-datatypes ((ValueCell!2799 0))(
  ( (ValueCellFull!2799 (v!5225 V!8027)) (EmptyCell!2799) )
))
(declare-datatypes ((array!11849 0))(
  ( (array!11850 (arr!5626 (Array (_ BitVec 32) ValueCell!2799)) (size!5967 (_ BitVec 32))) )
))
(declare-datatypes ((array!11851 0))(
  ( (array!11852 (arr!5627 (Array (_ BitVec 32) (_ BitVec 64))) (size!5968 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3498 0))(
  ( (LongMapFixedSize!3499 (defaultEntry!4434 Int) (mask!10476 (_ BitVec 32)) (extraKeys!4171 (_ BitVec 32)) (zeroValue!4275 V!8027) (minValue!4275 V!8027) (_size!1798 (_ BitVec 32)) (_keys!6536 array!11851) (_values!4417 array!11849) (_vacant!1798 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3498)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11851 (_ BitVec 32)) SeekEntryResult!1027)

(assert (=> b!239064 (= lt!120716 (seekEntryOrOpen!0 key!932 (_keys!6536 thiss!1504) (mask!10476 thiss!1504)))))

(declare-fun b!239065 () Bool)

(get-info :version)

(assert (=> b!239065 (= e!155215 ((_ is Undefined!1027) lt!120716))))

(declare-fun mapNonEmpty!10659 () Bool)

(declare-fun mapRes!10659 () Bool)

(declare-fun tp!22473 () Bool)

(assert (=> mapNonEmpty!10659 (= mapRes!10659 (and tp!22473 e!155222))))

(declare-fun mapRest!10659 () (Array (_ BitVec 32) ValueCell!2799))

(declare-fun mapKey!10659 () (_ BitVec 32))

(declare-fun mapValue!10659 () ValueCell!2799)

(assert (=> mapNonEmpty!10659 (= (arr!5626 (_values!4417 thiss!1504)) (store mapRest!10659 mapKey!10659 mapValue!10659))))

(declare-fun b!239066 () Bool)

(declare-fun e!155224 () Bool)

(assert (=> b!239066 (= e!155220 e!155224)))

(declare-fun res!117165 () Bool)

(assert (=> b!239066 (=> (not res!117165) (not e!155224))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239066 (= res!117165 (inRange!0 index!297 (mask!10476 thiss!1504)))))

(declare-datatypes ((Unit!7336 0))(
  ( (Unit!7337) )
))
(declare-fun lt!120714 () Unit!7336)

(declare-fun e!155223 () Unit!7336)

(assert (=> b!239066 (= lt!120714 e!155223)))

(declare-fun c!39856 () Bool)

(declare-datatypes ((tuple2!4696 0))(
  ( (tuple2!4697 (_1!2359 (_ BitVec 64)) (_2!2359 V!8027)) )
))
(declare-datatypes ((List!3590 0))(
  ( (Nil!3587) (Cons!3586 (h!4242 tuple2!4696) (t!8585 List!3590)) )
))
(declare-datatypes ((ListLongMap!3609 0))(
  ( (ListLongMap!3610 (toList!1820 List!3590)) )
))
(declare-fun contains!1708 (ListLongMap!3609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1348 (array!11851 array!11849 (_ BitVec 32) (_ BitVec 32) V!8027 V!8027 (_ BitVec 32) Int) ListLongMap!3609)

(assert (=> b!239066 (= c!39856 (contains!1708 (getCurrentListMap!1348 (_keys!6536 thiss!1504) (_values!4417 thiss!1504) (mask!10476 thiss!1504) (extraKeys!4171 thiss!1504) (zeroValue!4275 thiss!1504) (minValue!4275 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4434 thiss!1504)) key!932))))

(declare-fun c!39857 () Bool)

(declare-fun bm!22226 () Bool)

(assert (=> bm!22226 (= call!22230 (inRange!0 (ite c!39857 (index!6278 lt!120716) (index!6281 lt!120716)) (mask!10476 thiss!1504)))))

(declare-fun b!239067 () Bool)

(declare-fun res!117163 () Bool)

(declare-fun e!155214 () Bool)

(assert (=> b!239067 (=> (not res!117163) (not e!155214))))

(assert (=> b!239067 (= res!117163 (= (select (arr!5627 (_keys!6536 thiss!1504)) (index!6278 lt!120716)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239068 () Bool)

(declare-fun e!155218 () Bool)

(assert (=> b!239068 (= e!155218 tp_is_empty!6285)))

(declare-fun b!239069 () Bool)

(declare-fun res!117161 () Bool)

(assert (=> b!239069 (=> (not res!117161) (not e!155224))))

(declare-fun arrayContainsKey!0 (array!11851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!239069 (= res!117161 (arrayContainsKey!0 (_keys!6536 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!155226 () Bool)

(declare-fun e!155217 () Bool)

(declare-fun array_inv!3721 (array!11851) Bool)

(declare-fun array_inv!3722 (array!11849) Bool)

(assert (=> b!239070 (= e!155226 (and tp!22472 tp_is_empty!6285 (array_inv!3721 (_keys!6536 thiss!1504)) (array_inv!3722 (_values!4417 thiss!1504)) e!155217))))

(declare-fun b!239071 () Bool)

(declare-fun res!117159 () Bool)

(assert (=> b!239071 (= res!117159 (= (select (arr!5627 (_keys!6536 thiss!1504)) (index!6281 lt!120716)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239071 (=> (not res!117159) (not e!155225))))

(declare-fun res!117167 () Bool)

(assert (=> start!22920 (=> (not res!117167) (not e!155216))))

(declare-fun valid!1379 (LongMapFixedSize!3498) Bool)

(assert (=> start!22920 (= res!117167 (valid!1379 thiss!1504))))

(assert (=> start!22920 e!155216))

(assert (=> start!22920 e!155226))

(assert (=> start!22920 true))

(declare-fun b!239062 () Bool)

(declare-fun Unit!7338 () Unit!7336)

(assert (=> b!239062 (= e!155223 Unit!7338)))

(declare-fun lt!120717 () Unit!7336)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!322 (array!11851 array!11849 (_ BitVec 32) (_ BitVec 32) V!8027 V!8027 (_ BitVec 64) Int) Unit!7336)

(assert (=> b!239062 (= lt!120717 (lemmaInListMapThenSeekEntryOrOpenFindsIt!322 (_keys!6536 thiss!1504) (_values!4417 thiss!1504) (mask!10476 thiss!1504) (extraKeys!4171 thiss!1504) (zeroValue!4275 thiss!1504) (minValue!4275 thiss!1504) key!932 (defaultEntry!4434 thiss!1504)))))

(assert (=> b!239062 false))

(declare-fun b!239072 () Bool)

(assert (=> b!239072 (= e!155224 (and (= (size!5967 (_values!4417 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10476 thiss!1504))) (not (= (size!5968 (_keys!6536 thiss!1504)) (size!5967 (_values!4417 thiss!1504))))))))

(declare-fun bm!22227 () Bool)

(assert (=> bm!22227 (= call!22229 (arrayContainsKey!0 (_keys!6536 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239073 () Bool)

(assert (=> b!239073 (= e!155217 (and e!155218 mapRes!10659))))

(declare-fun condMapEmpty!10659 () Bool)

(declare-fun mapDefault!10659 () ValueCell!2799)

(assert (=> b!239073 (= condMapEmpty!10659 (= (arr!5626 (_values!4417 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2799)) mapDefault!10659)))))

(declare-fun b!239074 () Bool)

(assert (=> b!239074 (= e!155214 (not call!22229))))

(declare-fun mapIsEmpty!10659 () Bool)

(assert (=> mapIsEmpty!10659 mapRes!10659))

(declare-fun b!239075 () Bool)

(declare-fun res!117160 () Bool)

(assert (=> b!239075 (=> (not res!117160) (not e!155216))))

(assert (=> b!239075 (= res!117160 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239076 () Bool)

(declare-fun lt!120715 () Unit!7336)

(assert (=> b!239076 (= e!155223 lt!120715)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!338 (array!11851 array!11849 (_ BitVec 32) (_ BitVec 32) V!8027 V!8027 (_ BitVec 64) Int) Unit!7336)

(assert (=> b!239076 (= lt!120715 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!338 (_keys!6536 thiss!1504) (_values!4417 thiss!1504) (mask!10476 thiss!1504) (extraKeys!4171 thiss!1504) (zeroValue!4275 thiss!1504) (minValue!4275 thiss!1504) key!932 (defaultEntry!4434 thiss!1504)))))

(assert (=> b!239076 (= c!39857 ((_ is MissingZero!1027) lt!120716))))

(declare-fun e!155219 () Bool)

(assert (=> b!239076 e!155219))

(declare-fun b!239077 () Bool)

(declare-fun res!117162 () Bool)

(assert (=> b!239077 (=> (not res!117162) (not e!155224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239077 (= res!117162 (validMask!0 (mask!10476 thiss!1504)))))

(declare-fun b!239078 () Bool)

(declare-fun c!39855 () Bool)

(assert (=> b!239078 (= c!39855 ((_ is MissingVacant!1027) lt!120716))))

(assert (=> b!239078 (= e!155219 e!155215)))

(declare-fun b!239079 () Bool)

(declare-fun res!117166 () Bool)

(assert (=> b!239079 (=> (not res!117166) (not e!155214))))

(assert (=> b!239079 (= res!117166 call!22230)))

(assert (=> b!239079 (= e!155219 e!155214)))

(assert (= (and start!22920 res!117167) b!239075))

(assert (= (and b!239075 res!117160) b!239064))

(assert (= (and b!239064 res!117164) b!239066))

(assert (= (and b!239066 c!39856) b!239062))

(assert (= (and b!239066 (not c!39856)) b!239076))

(assert (= (and b!239076 c!39857) b!239079))

(assert (= (and b!239076 (not c!39857)) b!239078))

(assert (= (and b!239079 res!117166) b!239067))

(assert (= (and b!239067 res!117163) b!239074))

(assert (= (and b!239078 c!39855) b!239060))

(assert (= (and b!239078 (not c!39855)) b!239065))

(assert (= (and b!239060 res!117158) b!239071))

(assert (= (and b!239071 res!117159) b!239063))

(assert (= (or b!239079 b!239060) bm!22226))

(assert (= (or b!239074 b!239063) bm!22227))

(assert (= (and b!239066 res!117165) b!239069))

(assert (= (and b!239069 res!117161) b!239077))

(assert (= (and b!239077 res!117162) b!239072))

(assert (= (and b!239073 condMapEmpty!10659) mapIsEmpty!10659))

(assert (= (and b!239073 (not condMapEmpty!10659)) mapNonEmpty!10659))

(assert (= (and mapNonEmpty!10659 ((_ is ValueCellFull!2799) mapValue!10659)) b!239061))

(assert (= (and b!239073 ((_ is ValueCellFull!2799) mapDefault!10659)) b!239068))

(assert (= b!239070 b!239073))

(assert (= start!22920 b!239070))

(declare-fun m!259319 () Bool)

(assert (=> mapNonEmpty!10659 m!259319))

(declare-fun m!259321 () Bool)

(assert (=> b!239066 m!259321))

(declare-fun m!259323 () Bool)

(assert (=> b!239066 m!259323))

(assert (=> b!239066 m!259323))

(declare-fun m!259325 () Bool)

(assert (=> b!239066 m!259325))

(declare-fun m!259327 () Bool)

(assert (=> bm!22227 m!259327))

(declare-fun m!259329 () Bool)

(assert (=> b!239064 m!259329))

(declare-fun m!259331 () Bool)

(assert (=> b!239071 m!259331))

(declare-fun m!259333 () Bool)

(assert (=> start!22920 m!259333))

(declare-fun m!259335 () Bool)

(assert (=> b!239070 m!259335))

(declare-fun m!259337 () Bool)

(assert (=> b!239070 m!259337))

(declare-fun m!259339 () Bool)

(assert (=> b!239077 m!259339))

(assert (=> b!239069 m!259327))

(declare-fun m!259341 () Bool)

(assert (=> b!239067 m!259341))

(declare-fun m!259343 () Bool)

(assert (=> bm!22226 m!259343))

(declare-fun m!259345 () Bool)

(assert (=> b!239062 m!259345))

(declare-fun m!259347 () Bool)

(assert (=> b!239076 m!259347))

(check-sat (not bm!22227) (not b!239076) (not b!239077) (not b!239062) b_and!13389 (not b!239070) (not bm!22226) (not mapNonEmpty!10659) (not b!239066) (not b_next!6423) tp_is_empty!6285 (not b!239069) (not b!239064) (not start!22920))
(check-sat b_and!13389 (not b_next!6423))
