; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22954 () Bool)

(assert start!22954)

(declare-fun b!240119 () Bool)

(declare-fun b_free!6457 () Bool)

(declare-fun b_next!6457 () Bool)

(assert (=> b!240119 (= b_free!6457 (not b_next!6457))))

(declare-fun tp!22574 () Bool)

(declare-fun b_and!13423 () Bool)

(assert (=> b!240119 (= tp!22574 b_and!13423)))

(declare-fun b!240113 () Bool)

(declare-fun res!117701 () Bool)

(declare-fun e!155884 () Bool)

(assert (=> b!240113 (=> (not res!117701) (not e!155884))))

(declare-datatypes ((V!8073 0))(
  ( (V!8074 (val!3204 Int)) )
))
(declare-datatypes ((ValueCell!2816 0))(
  ( (ValueCellFull!2816 (v!5242 V!8073)) (EmptyCell!2816) )
))
(declare-datatypes ((array!11917 0))(
  ( (array!11918 (arr!5660 (Array (_ BitVec 32) ValueCell!2816)) (size!6001 (_ BitVec 32))) )
))
(declare-datatypes ((array!11919 0))(
  ( (array!11920 (arr!5661 (Array (_ BitVec 32) (_ BitVec 64))) (size!6002 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3532 0))(
  ( (LongMapFixedSize!3533 (defaultEntry!4451 Int) (mask!10505 (_ BitVec 32)) (extraKeys!4188 (_ BitVec 32)) (zeroValue!4292 V!8073) (minValue!4292 V!8073) (_size!1815 (_ BitVec 32)) (_keys!6553 array!11919) (_values!4434 array!11917) (_vacant!1815 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3532)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!240113 (= res!117701 (validMask!0 (mask!10505 thiss!1504)))))

(declare-fun b!240114 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!240114 (= e!155884 (not (validKeyInArray!0 key!932)))))

(declare-fun b!240115 () Bool)

(declare-fun res!117711 () Bool)

(declare-datatypes ((SeekEntryResult!1042 0))(
  ( (MissingZero!1042 (index!6338 (_ BitVec 32))) (Found!1042 (index!6339 (_ BitVec 32))) (Intermediate!1042 (undefined!1854 Bool) (index!6340 (_ BitVec 32)) (x!24146 (_ BitVec 32))) (Undefined!1042) (MissingVacant!1042 (index!6341 (_ BitVec 32))) )
))
(declare-fun lt!120918 () SeekEntryResult!1042)

(assert (=> b!240115 (= res!117711 (= (select (arr!5661 (_keys!6553 thiss!1504)) (index!6341 lt!120918)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155882 () Bool)

(assert (=> b!240115 (=> (not res!117711) (not e!155882))))

(declare-fun b!240116 () Bool)

(declare-datatypes ((Unit!7382 0))(
  ( (Unit!7383) )
))
(declare-fun e!155880 () Unit!7382)

(declare-fun lt!120920 () Unit!7382)

(assert (=> b!240116 (= e!155880 lt!120920)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!349 (array!11919 array!11917 (_ BitVec 32) (_ BitVec 32) V!8073 V!8073 (_ BitVec 64) Int) Unit!7382)

(assert (=> b!240116 (= lt!120920 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!349 (_keys!6553 thiss!1504) (_values!4434 thiss!1504) (mask!10505 thiss!1504) (extraKeys!4188 thiss!1504) (zeroValue!4292 thiss!1504) (minValue!4292 thiss!1504) key!932 (defaultEntry!4451 thiss!1504)))))

(declare-fun c!40010 () Bool)

(assert (=> b!240116 (= c!40010 (is-MissingZero!1042 lt!120918))))

(declare-fun e!155877 () Bool)

(assert (=> b!240116 e!155877))

(declare-fun b!240117 () Bool)

(declare-fun e!155883 () Bool)

(declare-fun tp_is_empty!6319 () Bool)

(assert (=> b!240117 (= e!155883 tp_is_empty!6319)))

(declare-fun b!240118 () Bool)

(declare-fun res!117702 () Bool)

(assert (=> b!240118 (=> (not res!117702) (not e!155884))))

(assert (=> b!240118 (= res!117702 (and (= (size!6001 (_values!4434 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10505 thiss!1504))) (= (size!6002 (_keys!6553 thiss!1504)) (size!6001 (_values!4434 thiss!1504))) (bvsge (mask!10505 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4188 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4188 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!10710 () Bool)

(declare-fun mapRes!10710 () Bool)

(assert (=> mapIsEmpty!10710 mapRes!10710))

(declare-fun e!155879 () Bool)

(declare-fun e!155886 () Bool)

(declare-fun array_inv!3745 (array!11919) Bool)

(declare-fun array_inv!3746 (array!11917) Bool)

(assert (=> b!240119 (= e!155879 (and tp!22574 tp_is_empty!6319 (array_inv!3745 (_keys!6553 thiss!1504)) (array_inv!3746 (_values!4434 thiss!1504)) e!155886))))

(declare-fun b!240120 () Bool)

(declare-fun e!155889 () Bool)

(assert (=> b!240120 (= e!155889 (is-Undefined!1042 lt!120918))))

(declare-fun b!240121 () Bool)

(declare-fun e!155888 () Bool)

(assert (=> b!240121 (= e!155888 tp_is_empty!6319)))

(declare-fun b!240122 () Bool)

(declare-fun res!117708 () Bool)

(assert (=> b!240122 (=> (not res!117708) (not e!155884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11919 (_ BitVec 32)) Bool)

(assert (=> b!240122 (= res!117708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6553 thiss!1504) (mask!10505 thiss!1504)))))

(declare-fun b!240123 () Bool)

(declare-fun call!22332 () Bool)

(assert (=> b!240123 (= e!155882 (not call!22332))))

(declare-fun b!240124 () Bool)

(declare-fun e!155878 () Bool)

(declare-fun e!155887 () Bool)

(assert (=> b!240124 (= e!155878 e!155887)))

(declare-fun res!117705 () Bool)

(assert (=> b!240124 (=> (not res!117705) (not e!155887))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240124 (= res!117705 (or (= lt!120918 (MissingZero!1042 index!297)) (= lt!120918 (MissingVacant!1042 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11919 (_ BitVec 32)) SeekEntryResult!1042)

(assert (=> b!240124 (= lt!120918 (seekEntryOrOpen!0 key!932 (_keys!6553 thiss!1504) (mask!10505 thiss!1504)))))

(declare-fun b!240125 () Bool)

(assert (=> b!240125 (= e!155889 e!155882)))

(declare-fun res!117704 () Bool)

(declare-fun call!22331 () Bool)

(assert (=> b!240125 (= res!117704 call!22331)))

(assert (=> b!240125 (=> (not res!117704) (not e!155882))))

(declare-fun mapNonEmpty!10710 () Bool)

(declare-fun tp!22575 () Bool)

(assert (=> mapNonEmpty!10710 (= mapRes!10710 (and tp!22575 e!155883))))

(declare-fun mapValue!10710 () ValueCell!2816)

(declare-fun mapRest!10710 () (Array (_ BitVec 32) ValueCell!2816))

(declare-fun mapKey!10710 () (_ BitVec 32))

(assert (=> mapNonEmpty!10710 (= (arr!5660 (_values!4434 thiss!1504)) (store mapRest!10710 mapKey!10710 mapValue!10710))))

(declare-fun b!240126 () Bool)

(declare-fun res!117713 () Bool)

(declare-fun e!155885 () Bool)

(assert (=> b!240126 (=> (not res!117713) (not e!155885))))

(assert (=> b!240126 (= res!117713 (= (select (arr!5661 (_keys!6553 thiss!1504)) (index!6338 lt!120918)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240127 () Bool)

(declare-fun res!117709 () Bool)

(assert (=> b!240127 (=> (not res!117709) (not e!155884))))

(declare-fun arrayContainsKey!0 (array!11919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240127 (= res!117709 (arrayContainsKey!0 (_keys!6553 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!22328 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22328 (= call!22331 (inRange!0 (ite c!40010 (index!6338 lt!120918) (index!6341 lt!120918)) (mask!10505 thiss!1504)))))

(declare-fun b!240128 () Bool)

(declare-fun res!117712 () Bool)

(assert (=> b!240128 (=> (not res!117712) (not e!155878))))

(assert (=> b!240128 (= res!117712 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!22329 () Bool)

(assert (=> bm!22329 (= call!22332 (arrayContainsKey!0 (_keys!6553 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240129 () Bool)

(assert (=> b!240129 (= e!155887 e!155884)))

(declare-fun res!117707 () Bool)

(assert (=> b!240129 (=> (not res!117707) (not e!155884))))

(assert (=> b!240129 (= res!117707 (inRange!0 index!297 (mask!10505 thiss!1504)))))

(declare-fun lt!120921 () Unit!7382)

(assert (=> b!240129 (= lt!120921 e!155880)))

(declare-fun c!40008 () Bool)

(declare-datatypes ((tuple2!4722 0))(
  ( (tuple2!4723 (_1!2372 (_ BitVec 64)) (_2!2372 V!8073)) )
))
(declare-datatypes ((List!3605 0))(
  ( (Nil!3602) (Cons!3601 (h!4257 tuple2!4722) (t!8600 List!3605)) )
))
(declare-datatypes ((ListLongMap!3635 0))(
  ( (ListLongMap!3636 (toList!1833 List!3605)) )
))
(declare-fun contains!1721 (ListLongMap!3635 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1361 (array!11919 array!11917 (_ BitVec 32) (_ BitVec 32) V!8073 V!8073 (_ BitVec 32) Int) ListLongMap!3635)

(assert (=> b!240129 (= c!40008 (contains!1721 (getCurrentListMap!1361 (_keys!6553 thiss!1504) (_values!4434 thiss!1504) (mask!10505 thiss!1504) (extraKeys!4188 thiss!1504) (zeroValue!4292 thiss!1504) (minValue!4292 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4451 thiss!1504)) key!932))))

(declare-fun res!117706 () Bool)

(assert (=> start!22954 (=> (not res!117706) (not e!155878))))

(declare-fun valid!1391 (LongMapFixedSize!3532) Bool)

(assert (=> start!22954 (= res!117706 (valid!1391 thiss!1504))))

(assert (=> start!22954 e!155878))

(assert (=> start!22954 e!155879))

(assert (=> start!22954 true))

(declare-fun b!240130 () Bool)

(declare-fun res!117703 () Bool)

(assert (=> b!240130 (=> (not res!117703) (not e!155885))))

(assert (=> b!240130 (= res!117703 call!22331)))

(assert (=> b!240130 (= e!155877 e!155885)))

(declare-fun b!240131 () Bool)

(assert (=> b!240131 (= e!155885 (not call!22332))))

(declare-fun b!240132 () Bool)

(declare-fun Unit!7384 () Unit!7382)

(assert (=> b!240132 (= e!155880 Unit!7384)))

(declare-fun lt!120919 () Unit!7382)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!336 (array!11919 array!11917 (_ BitVec 32) (_ BitVec 32) V!8073 V!8073 (_ BitVec 64) Int) Unit!7382)

(assert (=> b!240132 (= lt!120919 (lemmaInListMapThenSeekEntryOrOpenFindsIt!336 (_keys!6553 thiss!1504) (_values!4434 thiss!1504) (mask!10505 thiss!1504) (extraKeys!4188 thiss!1504) (zeroValue!4292 thiss!1504) (minValue!4292 thiss!1504) key!932 (defaultEntry!4451 thiss!1504)))))

(assert (=> b!240132 false))

(declare-fun b!240133 () Bool)

(declare-fun res!117710 () Bool)

(assert (=> b!240133 (=> (not res!117710) (not e!155884))))

(declare-datatypes ((List!3606 0))(
  ( (Nil!3603) (Cons!3602 (h!4258 (_ BitVec 64)) (t!8601 List!3606)) )
))
(declare-fun arrayNoDuplicates!0 (array!11919 (_ BitVec 32) List!3606) Bool)

(assert (=> b!240133 (= res!117710 (arrayNoDuplicates!0 (_keys!6553 thiss!1504) #b00000000000000000000000000000000 Nil!3603))))

(declare-fun b!240134 () Bool)

(declare-fun c!40009 () Bool)

(assert (=> b!240134 (= c!40009 (is-MissingVacant!1042 lt!120918))))

(assert (=> b!240134 (= e!155877 e!155889)))

(declare-fun b!240135 () Bool)

(assert (=> b!240135 (= e!155886 (and e!155888 mapRes!10710))))

(declare-fun condMapEmpty!10710 () Bool)

(declare-fun mapDefault!10710 () ValueCell!2816)

