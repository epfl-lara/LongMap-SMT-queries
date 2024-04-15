; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21652 () Bool)

(assert start!21652)

(declare-fun b!217022 () Bool)

(declare-fun b_free!5797 () Bool)

(declare-fun b_next!5797 () Bool)

(assert (=> b!217022 (= b_free!5797 (not b_next!5797))))

(declare-fun tp!20525 () Bool)

(declare-fun b_and!12661 () Bool)

(assert (=> b!217022 (= tp!20525 b_and!12661)))

(declare-fun b!217015 () Bool)

(declare-fun res!106199 () Bool)

(declare-fun e!141179 () Bool)

(assert (=> b!217015 (=> (not res!106199) (not e!141179))))

(declare-datatypes ((V!7193 0))(
  ( (V!7194 (val!2874 Int)) )
))
(declare-datatypes ((ValueCell!2486 0))(
  ( (ValueCellFull!2486 (v!4886 V!7193)) (EmptyCell!2486) )
))
(declare-datatypes ((array!10549 0))(
  ( (array!10550 (arr!4995 (Array (_ BitVec 32) ValueCell!2486)) (size!5328 (_ BitVec 32))) )
))
(declare-datatypes ((array!10551 0))(
  ( (array!10552 (arr!4996 (Array (_ BitVec 32) (_ BitVec 64))) (size!5329 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2872 0))(
  ( (LongMapFixedSize!2873 (defaultEntry!4086 Int) (mask!9836 (_ BitVec 32)) (extraKeys!3823 (_ BitVec 32)) (zeroValue!3927 V!7193) (minValue!3927 V!7193) (_size!1485 (_ BitVec 32)) (_keys!6134 array!10551) (_values!4069 array!10549) (_vacant!1485 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2872)

(assert (=> b!217015 (= res!106199 (and (= (size!5328 (_values!4069 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9836 thiss!1504))) (= (size!5329 (_keys!6134 thiss!1504)) (size!5328 (_values!4069 thiss!1504))) (bvsge (mask!9836 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3823 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3823 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217016 () Bool)

(declare-fun e!141177 () Bool)

(declare-fun e!141181 () Bool)

(declare-fun mapRes!9651 () Bool)

(assert (=> b!217016 (= e!141177 (and e!141181 mapRes!9651))))

(declare-fun condMapEmpty!9651 () Bool)

(declare-fun mapDefault!9651 () ValueCell!2486)

(assert (=> b!217016 (= condMapEmpty!9651 (= (arr!4995 (_values!4069 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2486)) mapDefault!9651)))))

(declare-fun b!217017 () Bool)

(assert (=> b!217017 (= e!141179 false)))

(declare-fun lt!111115 () Bool)

(declare-datatypes ((List!3162 0))(
  ( (Nil!3159) (Cons!3158 (h!3805 (_ BitVec 64)) (t!8108 List!3162)) )
))
(declare-fun arrayNoDuplicates!0 (array!10551 (_ BitVec 32) List!3162) Bool)

(assert (=> b!217017 (= lt!111115 (arrayNoDuplicates!0 (_keys!6134 thiss!1504) #b00000000000000000000000000000000 Nil!3159))))

(declare-fun b!217018 () Bool)

(declare-fun tp_is_empty!5659 () Bool)

(assert (=> b!217018 (= e!141181 tp_is_empty!5659)))

(declare-fun mapIsEmpty!9651 () Bool)

(assert (=> mapIsEmpty!9651 mapRes!9651))

(declare-fun mapNonEmpty!9651 () Bool)

(declare-fun tp!20526 () Bool)

(declare-fun e!141176 () Bool)

(assert (=> mapNonEmpty!9651 (= mapRes!9651 (and tp!20526 e!141176))))

(declare-fun mapRest!9651 () (Array (_ BitVec 32) ValueCell!2486))

(declare-fun mapKey!9651 () (_ BitVec 32))

(declare-fun mapValue!9651 () ValueCell!2486)

(assert (=> mapNonEmpty!9651 (= (arr!4995 (_values!4069 thiss!1504)) (store mapRest!9651 mapKey!9651 mapValue!9651))))

(declare-fun b!217019 () Bool)

(declare-fun res!106204 () Bool)

(declare-fun e!141178 () Bool)

(assert (=> b!217019 (=> (not res!106204) (not e!141178))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217019 (= res!106204 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217020 () Bool)

(assert (=> b!217020 (= e!141178 e!141179)))

(declare-fun res!106201 () Bool)

(assert (=> b!217020 (=> (not res!106201) (not e!141179))))

(declare-datatypes ((SeekEntryResult!755 0))(
  ( (MissingZero!755 (index!5190 (_ BitVec 32))) (Found!755 (index!5191 (_ BitVec 32))) (Intermediate!755 (undefined!1567 Bool) (index!5192 (_ BitVec 32)) (x!22706 (_ BitVec 32))) (Undefined!755) (MissingVacant!755 (index!5193 (_ BitVec 32))) )
))
(declare-fun lt!111116 () SeekEntryResult!755)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217020 (= res!106201 (or (= lt!111116 (MissingZero!755 index!297)) (= lt!111116 (MissingVacant!755 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10551 (_ BitVec 32)) SeekEntryResult!755)

(assert (=> b!217020 (= lt!111116 (seekEntryOrOpen!0 key!932 (_keys!6134 thiss!1504) (mask!9836 thiss!1504)))))

(declare-fun res!106202 () Bool)

(assert (=> start!21652 (=> (not res!106202) (not e!141178))))

(declare-fun valid!1182 (LongMapFixedSize!2872) Bool)

(assert (=> start!21652 (= res!106202 (valid!1182 thiss!1504))))

(assert (=> start!21652 e!141178))

(declare-fun e!141182 () Bool)

(assert (=> start!21652 e!141182))

(assert (=> start!21652 true))

(declare-fun b!217021 () Bool)

(declare-fun res!106203 () Bool)

(assert (=> b!217021 (=> (not res!106203) (not e!141179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217021 (= res!106203 (validMask!0 (mask!9836 thiss!1504)))))

(declare-fun array_inv!3289 (array!10551) Bool)

(declare-fun array_inv!3290 (array!10549) Bool)

(assert (=> b!217022 (= e!141182 (and tp!20525 tp_is_empty!5659 (array_inv!3289 (_keys!6134 thiss!1504)) (array_inv!3290 (_values!4069 thiss!1504)) e!141177))))

(declare-fun b!217023 () Bool)

(declare-fun res!106198 () Bool)

(assert (=> b!217023 (=> (not res!106198) (not e!141179))))

(declare-datatypes ((tuple2!4236 0))(
  ( (tuple2!4237 (_1!2129 (_ BitVec 64)) (_2!2129 V!7193)) )
))
(declare-datatypes ((List!3163 0))(
  ( (Nil!3160) (Cons!3159 (h!3806 tuple2!4236) (t!8109 List!3163)) )
))
(declare-datatypes ((ListLongMap!3139 0))(
  ( (ListLongMap!3140 (toList!1585 List!3163)) )
))
(declare-fun contains!1426 (ListLongMap!3139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1094 (array!10551 array!10549 (_ BitVec 32) (_ BitVec 32) V!7193 V!7193 (_ BitVec 32) Int) ListLongMap!3139)

(assert (=> b!217023 (= res!106198 (contains!1426 (getCurrentListMap!1094 (_keys!6134 thiss!1504) (_values!4069 thiss!1504) (mask!9836 thiss!1504) (extraKeys!3823 thiss!1504) (zeroValue!3927 thiss!1504) (minValue!3927 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4086 thiss!1504)) key!932))))

(declare-fun b!217024 () Bool)

(assert (=> b!217024 (= e!141176 tp_is_empty!5659)))

(declare-fun b!217025 () Bool)

(declare-fun res!106200 () Bool)

(assert (=> b!217025 (=> (not res!106200) (not e!141179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10551 (_ BitVec 32)) Bool)

(assert (=> b!217025 (= res!106200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6134 thiss!1504) (mask!9836 thiss!1504)))))

(assert (= (and start!21652 res!106202) b!217019))

(assert (= (and b!217019 res!106204) b!217020))

(assert (= (and b!217020 res!106201) b!217023))

(assert (= (and b!217023 res!106198) b!217021))

(assert (= (and b!217021 res!106203) b!217015))

(assert (= (and b!217015 res!106199) b!217025))

(assert (= (and b!217025 res!106200) b!217017))

(assert (= (and b!217016 condMapEmpty!9651) mapIsEmpty!9651))

(assert (= (and b!217016 (not condMapEmpty!9651)) mapNonEmpty!9651))

(get-info :version)

(assert (= (and mapNonEmpty!9651 ((_ is ValueCellFull!2486) mapValue!9651)) b!217024))

(assert (= (and b!217016 ((_ is ValueCellFull!2486) mapDefault!9651)) b!217018))

(assert (= b!217022 b!217016))

(assert (= start!21652 b!217022))

(declare-fun m!242973 () Bool)

(assert (=> mapNonEmpty!9651 m!242973))

(declare-fun m!242975 () Bool)

(assert (=> b!217023 m!242975))

(assert (=> b!217023 m!242975))

(declare-fun m!242977 () Bool)

(assert (=> b!217023 m!242977))

(declare-fun m!242979 () Bool)

(assert (=> b!217022 m!242979))

(declare-fun m!242981 () Bool)

(assert (=> b!217022 m!242981))

(declare-fun m!242983 () Bool)

(assert (=> b!217021 m!242983))

(declare-fun m!242985 () Bool)

(assert (=> b!217020 m!242985))

(declare-fun m!242987 () Bool)

(assert (=> start!21652 m!242987))

(declare-fun m!242989 () Bool)

(assert (=> b!217025 m!242989))

(declare-fun m!242991 () Bool)

(assert (=> b!217017 m!242991))

(check-sat (not b_next!5797) (not b!217017) (not mapNonEmpty!9651) (not b!217023) (not b!217025) tp_is_empty!5659 (not start!21652) (not b!217020) b_and!12661 (not b!217021) (not b!217022))
(check-sat b_and!12661 (not b_next!5797))
