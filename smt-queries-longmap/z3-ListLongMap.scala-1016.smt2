; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21698 () Bool)

(assert start!21698)

(declare-fun b!217992 () Bool)

(declare-fun b_free!5847 () Bool)

(declare-fun b_next!5847 () Bool)

(assert (=> b!217992 (= b_free!5847 (not b_next!5847))))

(declare-fun tp!20676 () Bool)

(declare-fun b_and!12737 () Bool)

(assert (=> b!217992 (= tp!20676 b_and!12737)))

(declare-fun b!217987 () Bool)

(declare-fun res!106822 () Bool)

(declare-fun e!141806 () Bool)

(assert (=> b!217987 (=> (not res!106822) (not e!141806))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217987 (= res!106822 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217988 () Bool)

(declare-fun res!106821 () Bool)

(declare-fun e!141803 () Bool)

(assert (=> b!217988 (=> (not res!106821) (not e!141803))))

(declare-datatypes ((V!7259 0))(
  ( (V!7260 (val!2899 Int)) )
))
(declare-datatypes ((ValueCell!2511 0))(
  ( (ValueCellFull!2511 (v!4917 V!7259)) (EmptyCell!2511) )
))
(declare-datatypes ((array!10657 0))(
  ( (array!10658 (arr!5050 (Array (_ BitVec 32) ValueCell!2511)) (size!5382 (_ BitVec 32))) )
))
(declare-datatypes ((array!10659 0))(
  ( (array!10660 (arr!5051 (Array (_ BitVec 32) (_ BitVec 64))) (size!5383 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2922 0))(
  ( (LongMapFixedSize!2923 (defaultEntry!4111 Int) (mask!9878 (_ BitVec 32)) (extraKeys!3848 (_ BitVec 32)) (zeroValue!3952 V!7259) (minValue!3952 V!7259) (_size!1510 (_ BitVec 32)) (_keys!6160 array!10659) (_values!4094 array!10657) (_vacant!1510 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2922)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10659 (_ BitVec 32)) Bool)

(assert (=> b!217988 (= res!106821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6160 thiss!1504) (mask!9878 thiss!1504)))))

(declare-fun b!217989 () Bool)

(declare-fun res!106823 () Bool)

(assert (=> b!217989 (=> (not res!106823) (not e!141803))))

(declare-datatypes ((tuple2!4308 0))(
  ( (tuple2!4309 (_1!2165 (_ BitVec 64)) (_2!2165 V!7259)) )
))
(declare-datatypes ((List!3213 0))(
  ( (Nil!3210) (Cons!3209 (h!3856 tuple2!4308) (t!8168 List!3213)) )
))
(declare-datatypes ((ListLongMap!3221 0))(
  ( (ListLongMap!3222 (toList!1626 List!3213)) )
))
(declare-fun contains!1467 (ListLongMap!3221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1154 (array!10659 array!10657 (_ BitVec 32) (_ BitVec 32) V!7259 V!7259 (_ BitVec 32) Int) ListLongMap!3221)

(assert (=> b!217989 (= res!106823 (not (contains!1467 (getCurrentListMap!1154 (_keys!6160 thiss!1504) (_values!4094 thiss!1504) (mask!9878 thiss!1504) (extraKeys!3848 thiss!1504) (zeroValue!3952 thiss!1504) (minValue!3952 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4111 thiss!1504)) key!932)))))

(declare-fun b!217990 () Bool)

(declare-fun e!141805 () Bool)

(declare-fun e!141802 () Bool)

(declare-fun mapRes!9726 () Bool)

(assert (=> b!217990 (= e!141805 (and e!141802 mapRes!9726))))

(declare-fun condMapEmpty!9726 () Bool)

(declare-fun mapDefault!9726 () ValueCell!2511)

(assert (=> b!217990 (= condMapEmpty!9726 (= (arr!5050 (_values!4094 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2511)) mapDefault!9726)))))

(declare-fun tp_is_empty!5709 () Bool)

(declare-fun e!141808 () Bool)

(declare-fun array_inv!3343 (array!10659) Bool)

(declare-fun array_inv!3344 (array!10657) Bool)

(assert (=> b!217992 (= e!141808 (and tp!20676 tp_is_empty!5709 (array_inv!3343 (_keys!6160 thiss!1504)) (array_inv!3344 (_values!4094 thiss!1504)) e!141805))))

(declare-fun b!217993 () Bool)

(declare-fun e!141804 () Bool)

(assert (=> b!217993 (= e!141804 tp_is_empty!5709)))

(declare-fun mapIsEmpty!9726 () Bool)

(assert (=> mapIsEmpty!9726 mapRes!9726))

(declare-fun b!217994 () Bool)

(declare-fun res!106819 () Bool)

(assert (=> b!217994 (=> (not res!106819) (not e!141803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217994 (= res!106819 (validMask!0 (mask!9878 thiss!1504)))))

(declare-fun b!217995 () Bool)

(assert (=> b!217995 (= e!141803 false)))

(declare-fun lt!111447 () Bool)

(declare-datatypes ((List!3214 0))(
  ( (Nil!3211) (Cons!3210 (h!3857 (_ BitVec 64)) (t!8169 List!3214)) )
))
(declare-fun arrayNoDuplicates!0 (array!10659 (_ BitVec 32) List!3214) Bool)

(assert (=> b!217995 (= lt!111447 (arrayNoDuplicates!0 (_keys!6160 thiss!1504) #b00000000000000000000000000000000 Nil!3211))))

(declare-fun b!217996 () Bool)

(assert (=> b!217996 (= e!141806 e!141803)))

(declare-fun res!106820 () Bool)

(assert (=> b!217996 (=> (not res!106820) (not e!141803))))

(declare-datatypes ((SeekEntryResult!777 0))(
  ( (MissingZero!777 (index!5278 (_ BitVec 32))) (Found!777 (index!5279 (_ BitVec 32))) (Intermediate!777 (undefined!1589 Bool) (index!5280 (_ BitVec 32)) (x!22793 (_ BitVec 32))) (Undefined!777) (MissingVacant!777 (index!5281 (_ BitVec 32))) )
))
(declare-fun lt!111446 () SeekEntryResult!777)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217996 (= res!106820 (or (= lt!111446 (MissingZero!777 index!297)) (= lt!111446 (MissingVacant!777 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10659 (_ BitVec 32)) SeekEntryResult!777)

(assert (=> b!217996 (= lt!111446 (seekEntryOrOpen!0 key!932 (_keys!6160 thiss!1504) (mask!9878 thiss!1504)))))

(declare-fun b!217991 () Bool)

(declare-fun res!106824 () Bool)

(assert (=> b!217991 (=> (not res!106824) (not e!141803))))

(assert (=> b!217991 (= res!106824 (and (= (size!5382 (_values!4094 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9878 thiss!1504))) (= (size!5383 (_keys!6160 thiss!1504)) (size!5382 (_values!4094 thiss!1504))) (bvsge (mask!9878 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3848 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3848 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!106818 () Bool)

(assert (=> start!21698 (=> (not res!106818) (not e!141806))))

(declare-fun valid!1184 (LongMapFixedSize!2922) Bool)

(assert (=> start!21698 (= res!106818 (valid!1184 thiss!1504))))

(assert (=> start!21698 e!141806))

(assert (=> start!21698 e!141808))

(assert (=> start!21698 true))

(declare-fun b!217997 () Bool)

(assert (=> b!217997 (= e!141802 tp_is_empty!5709)))

(declare-fun mapNonEmpty!9726 () Bool)

(declare-fun tp!20675 () Bool)

(assert (=> mapNonEmpty!9726 (= mapRes!9726 (and tp!20675 e!141804))))

(declare-fun mapRest!9726 () (Array (_ BitVec 32) ValueCell!2511))

(declare-fun mapValue!9726 () ValueCell!2511)

(declare-fun mapKey!9726 () (_ BitVec 32))

(assert (=> mapNonEmpty!9726 (= (arr!5050 (_values!4094 thiss!1504)) (store mapRest!9726 mapKey!9726 mapValue!9726))))

(assert (= (and start!21698 res!106818) b!217987))

(assert (= (and b!217987 res!106822) b!217996))

(assert (= (and b!217996 res!106820) b!217989))

(assert (= (and b!217989 res!106823) b!217994))

(assert (= (and b!217994 res!106819) b!217991))

(assert (= (and b!217991 res!106824) b!217988))

(assert (= (and b!217988 res!106821) b!217995))

(assert (= (and b!217990 condMapEmpty!9726) mapIsEmpty!9726))

(assert (= (and b!217990 (not condMapEmpty!9726)) mapNonEmpty!9726))

(get-info :version)

(assert (= (and mapNonEmpty!9726 ((_ is ValueCellFull!2511) mapValue!9726)) b!217993))

(assert (= (and b!217990 ((_ is ValueCellFull!2511) mapDefault!9726)) b!217997))

(assert (= b!217992 b!217990))

(assert (= start!21698 b!217992))

(declare-fun m!244089 () Bool)

(assert (=> b!217988 m!244089))

(declare-fun m!244091 () Bool)

(assert (=> b!217992 m!244091))

(declare-fun m!244093 () Bool)

(assert (=> b!217992 m!244093))

(declare-fun m!244095 () Bool)

(assert (=> b!217995 m!244095))

(declare-fun m!244097 () Bool)

(assert (=> start!21698 m!244097))

(declare-fun m!244099 () Bool)

(assert (=> b!217996 m!244099))

(declare-fun m!244101 () Bool)

(assert (=> b!217989 m!244101))

(assert (=> b!217989 m!244101))

(declare-fun m!244103 () Bool)

(assert (=> b!217989 m!244103))

(declare-fun m!244105 () Bool)

(assert (=> mapNonEmpty!9726 m!244105))

(declare-fun m!244107 () Bool)

(assert (=> b!217994 m!244107))

(check-sat (not b!217994) (not b!217992) (not start!21698) (not b!217995) (not b!217996) (not b!217989) (not b!217988) (not mapNonEmpty!9726) (not b_next!5847) tp_is_empty!5709 b_and!12737)
(check-sat b_and!12737 (not b_next!5847))
