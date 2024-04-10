; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21878 () Bool)

(assert start!21878)

(declare-fun b!221183 () Bool)

(declare-fun b_free!5945 () Bool)

(declare-fun b_next!5945 () Bool)

(assert (=> b!221183 (= b_free!5945 (not b_next!5945))))

(declare-fun tp!20976 () Bool)

(declare-fun b_and!12843 () Bool)

(assert (=> b!221183 (= tp!20976 b_and!12843)))

(declare-fun b!221182 () Bool)

(declare-fun e!143767 () Bool)

(declare-fun tp_is_empty!5807 () Bool)

(assert (=> b!221182 (= e!143767 tp_is_empty!5807)))

(declare-fun mapIsEmpty!9880 () Bool)

(declare-fun mapRes!9880 () Bool)

(assert (=> mapIsEmpty!9880 mapRes!9880))

(declare-fun b!221184 () Bool)

(declare-fun res!108501 () Bool)

(declare-fun e!143776 () Bool)

(assert (=> b!221184 (=> (not res!108501) (not e!143776))))

(declare-datatypes ((V!7389 0))(
  ( (V!7390 (val!2948 Int)) )
))
(declare-datatypes ((ValueCell!2560 0))(
  ( (ValueCellFull!2560 (v!4968 V!7389)) (EmptyCell!2560) )
))
(declare-datatypes ((array!10857 0))(
  ( (array!10858 (arr!5148 (Array (_ BitVec 32) ValueCell!2560)) (size!5481 (_ BitVec 32))) )
))
(declare-datatypes ((array!10859 0))(
  ( (array!10860 (arr!5149 (Array (_ BitVec 32) (_ BitVec 64))) (size!5482 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3020 0))(
  ( (LongMapFixedSize!3021 (defaultEntry!4169 Int) (mask!9977 (_ BitVec 32)) (extraKeys!3906 (_ BitVec 32)) (zeroValue!4010 V!7389) (minValue!4010 V!7389) (_size!1559 (_ BitVec 32)) (_keys!6223 array!10859) (_values!4152 array!10857) (_vacant!1559 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3020)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!221184 (= res!108501 (arrayContainsKey!0 (_keys!6223 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221185 () Bool)

(declare-datatypes ((Unit!6605 0))(
  ( (Unit!6606) )
))
(declare-fun e!143773 () Unit!6605)

(declare-fun lt!112352 () Unit!6605)

(assert (=> b!221185 (= e!143773 lt!112352)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!223 (array!10859 array!10857 (_ BitVec 32) (_ BitVec 32) V!7389 V!7389 (_ BitVec 64) Int) Unit!6605)

(assert (=> b!221185 (= lt!112352 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!223 (_keys!6223 thiss!1504) (_values!4152 thiss!1504) (mask!9977 thiss!1504) (extraKeys!3906 thiss!1504) (zeroValue!4010 thiss!1504) (minValue!4010 thiss!1504) key!932 (defaultEntry!4169 thiss!1504)))))

(declare-fun c!36784 () Bool)

(declare-datatypes ((SeekEntryResult!821 0))(
  ( (MissingZero!821 (index!5454 (_ BitVec 32))) (Found!821 (index!5455 (_ BitVec 32))) (Intermediate!821 (undefined!1633 Bool) (index!5456 (_ BitVec 32)) (x!22993 (_ BitVec 32))) (Undefined!821) (MissingVacant!821 (index!5457 (_ BitVec 32))) )
))
(declare-fun lt!112350 () SeekEntryResult!821)

(assert (=> b!221185 (= c!36784 (is-MissingZero!821 lt!112350))))

(declare-fun e!143774 () Bool)

(assert (=> b!221185 e!143774))

(declare-fun b!221186 () Bool)

(declare-fun e!143771 () Bool)

(assert (=> b!221186 (= e!143771 (is-Undefined!821 lt!112350))))

(declare-fun b!221187 () Bool)

(declare-fun res!108496 () Bool)

(declare-fun e!143769 () Bool)

(assert (=> b!221187 (=> (not res!108496) (not e!143769))))

(assert (=> b!221187 (= res!108496 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221188 () Bool)

(declare-fun res!108498 () Bool)

(assert (=> b!221188 (=> (not res!108498) (not e!143776))))

(assert (=> b!221188 (= res!108498 (and (= (size!5481 (_values!4152 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9977 thiss!1504))) (= (size!5482 (_keys!6223 thiss!1504)) (size!5481 (_values!4152 thiss!1504))) (bvsge (mask!9977 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3906 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3906 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!221189 () Bool)

(declare-fun res!108500 () Bool)

(assert (=> b!221189 (= res!108500 (= (select (arr!5149 (_keys!6223 thiss!1504)) (index!5457 lt!112350)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143768 () Bool)

(assert (=> b!221189 (=> (not res!108500) (not e!143768))))

(declare-fun b!221190 () Bool)

(declare-fun res!108495 () Bool)

(assert (=> b!221190 (=> (not res!108495) (not e!143776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10859 (_ BitVec 32)) Bool)

(assert (=> b!221190 (= res!108495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6223 thiss!1504) (mask!9977 thiss!1504)))))

(declare-fun b!221191 () Bool)

(declare-fun e!143772 () Bool)

(declare-fun call!20670 () Bool)

(assert (=> b!221191 (= e!143772 (not call!20670))))

(declare-fun b!221192 () Bool)

(declare-fun Unit!6607 () Unit!6605)

(assert (=> b!221192 (= e!143773 Unit!6607)))

(declare-fun lt!112348 () Unit!6605)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!212 (array!10859 array!10857 (_ BitVec 32) (_ BitVec 32) V!7389 V!7389 (_ BitVec 64) Int) Unit!6605)

(assert (=> b!221192 (= lt!112348 (lemmaInListMapThenSeekEntryOrOpenFindsIt!212 (_keys!6223 thiss!1504) (_values!4152 thiss!1504) (mask!9977 thiss!1504) (extraKeys!3906 thiss!1504) (zeroValue!4010 thiss!1504) (minValue!4010 thiss!1504) key!932 (defaultEntry!4169 thiss!1504)))))

(assert (=> b!221192 false))

(declare-fun b!221193 () Bool)

(assert (=> b!221193 (= e!143768 (not call!20670))))

(declare-fun res!108502 () Bool)

(assert (=> start!21878 (=> (not res!108502) (not e!143769))))

(declare-fun valid!1219 (LongMapFixedSize!3020) Bool)

(assert (=> start!21878 (= res!108502 (valid!1219 thiss!1504))))

(assert (=> start!21878 e!143769))

(declare-fun e!143765 () Bool)

(assert (=> start!21878 e!143765))

(assert (=> start!21878 true))

(declare-fun e!143766 () Bool)

(declare-fun array_inv!3407 (array!10859) Bool)

(declare-fun array_inv!3408 (array!10857) Bool)

(assert (=> b!221183 (= e!143765 (and tp!20976 tp_is_empty!5807 (array_inv!3407 (_keys!6223 thiss!1504)) (array_inv!3408 (_values!4152 thiss!1504)) e!143766))))

(declare-fun b!221194 () Bool)

(declare-fun e!143775 () Bool)

(assert (=> b!221194 (= e!143766 (and e!143775 mapRes!9880))))

(declare-fun condMapEmpty!9880 () Bool)

(declare-fun mapDefault!9880 () ValueCell!2560)

