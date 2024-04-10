; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22078 () Bool)

(assert start!22078)

(declare-fun b!228932 () Bool)

(declare-fun b_free!6145 () Bool)

(declare-fun b_next!6145 () Bool)

(assert (=> b!228932 (= b_free!6145 (not b_next!6145))))

(declare-fun tp!21577 () Bool)

(declare-fun b_and!13043 () Bool)

(assert (=> b!228932 (= tp!21577 b_and!13043)))

(declare-fun b!228918 () Bool)

(declare-fun res!112672 () Bool)

(declare-fun e!148525 () Bool)

(assert (=> b!228918 (=> res!112672 e!148525)))

(declare-datatypes ((V!7657 0))(
  ( (V!7658 (val!3048 Int)) )
))
(declare-datatypes ((ValueCell!2660 0))(
  ( (ValueCellFull!2660 (v!5068 V!7657)) (EmptyCell!2660) )
))
(declare-datatypes ((array!11257 0))(
  ( (array!11258 (arr!5348 (Array (_ BitVec 32) ValueCell!2660)) (size!5681 (_ BitVec 32))) )
))
(declare-datatypes ((array!11259 0))(
  ( (array!11260 (arr!5349 (Array (_ BitVec 32) (_ BitVec 64))) (size!5682 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3220 0))(
  ( (LongMapFixedSize!3221 (defaultEntry!4269 Int) (mask!10145 (_ BitVec 32)) (extraKeys!4006 (_ BitVec 32)) (zeroValue!4110 V!7657) (minValue!4110 V!7657) (_size!1659 (_ BitVec 32)) (_keys!6323 array!11259) (_values!4252 array!11257) (_vacant!1659 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3220)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11259 (_ BitVec 32)) Bool)

(assert (=> b!228918 (= res!112672 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6323 thiss!1504) (mask!10145 thiss!1504))))))

(declare-fun b!228919 () Bool)

(declare-fun e!148527 () Bool)

(declare-fun e!148524 () Bool)

(assert (=> b!228919 (= e!148527 e!148524)))

(declare-fun res!112671 () Bool)

(declare-fun call!21269 () Bool)

(assert (=> b!228919 (= res!112671 call!21269)))

(assert (=> b!228919 (=> (not res!112671) (not e!148524))))

(declare-fun b!228920 () Bool)

(declare-fun e!148517 () Bool)

(declare-fun tp_is_empty!6007 () Bool)

(assert (=> b!228920 (= e!148517 tp_is_empty!6007)))

(declare-fun b!228921 () Bool)

(declare-datatypes ((Unit!6971 0))(
  ( (Unit!6972) )
))
(declare-fun e!148519 () Unit!6971)

(declare-fun lt!115157 () Unit!6971)

(assert (=> b!228921 (= e!148519 lt!115157)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!292 (array!11259 array!11257 (_ BitVec 32) (_ BitVec 32) V!7657 V!7657 (_ BitVec 64) Int) Unit!6971)

(assert (=> b!228921 (= lt!115157 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!292 (_keys!6323 thiss!1504) (_values!4252 thiss!1504) (mask!10145 thiss!1504) (extraKeys!4006 thiss!1504) (zeroValue!4110 thiss!1504) (minValue!4110 thiss!1504) key!932 (defaultEntry!4269 thiss!1504)))))

(declare-fun c!37967 () Bool)

(declare-datatypes ((SeekEntryResult!914 0))(
  ( (MissingZero!914 (index!5826 (_ BitVec 32))) (Found!914 (index!5827 (_ BitVec 32))) (Intermediate!914 (undefined!1726 Bool) (index!5828 (_ BitVec 32)) (x!23358 (_ BitVec 32))) (Undefined!914) (MissingVacant!914 (index!5829 (_ BitVec 32))) )
))
(declare-fun lt!115161 () SeekEntryResult!914)

(assert (=> b!228921 (= c!37967 (is-MissingZero!914 lt!115161))))

(declare-fun e!148515 () Bool)

(assert (=> b!228921 e!148515))

(declare-fun b!228922 () Bool)

(declare-fun c!37966 () Bool)

(assert (=> b!228922 (= c!37966 (is-MissingVacant!914 lt!115161))))

(assert (=> b!228922 (= e!148515 e!148527)))

(declare-fun b!228923 () Bool)

(declare-fun res!112677 () Bool)

(assert (=> b!228923 (= res!112677 (= (select (arr!5349 (_keys!6323 thiss!1504)) (index!5829 lt!115161)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228923 (=> (not res!112677) (not e!148524))))

(declare-fun bm!21266 () Bool)

(declare-fun call!21270 () Bool)

(declare-fun arrayContainsKey!0 (array!11259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21266 (= call!21270 (arrayContainsKey!0 (_keys!6323 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228924 () Bool)

(declare-fun e!148521 () Bool)

(assert (=> b!228924 (= e!148521 (not call!21270))))

(declare-fun b!228925 () Bool)

(declare-fun res!112669 () Bool)

(assert (=> b!228925 (=> (not res!112669) (not e!148521))))

(assert (=> b!228925 (= res!112669 (= (select (arr!5349 (_keys!6323 thiss!1504)) (index!5826 lt!115161)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!228927 () Bool)

(declare-fun res!112676 () Bool)

(assert (=> b!228927 (=> res!112676 e!148525)))

(assert (=> b!228927 (= res!112676 (or (not (= (size!5681 (_values!4252 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10145 thiss!1504)))) (not (= (size!5682 (_keys!6323 thiss!1504)) (size!5681 (_values!4252 thiss!1504)))) (bvslt (mask!10145 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4006 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4006 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228928 () Bool)

(declare-fun e!148516 () Bool)

(declare-fun e!148528 () Bool)

(declare-fun mapRes!10180 () Bool)

(assert (=> b!228928 (= e!148516 (and e!148528 mapRes!10180))))

(declare-fun condMapEmpty!10180 () Bool)

(declare-fun mapDefault!10180 () ValueCell!2660)

