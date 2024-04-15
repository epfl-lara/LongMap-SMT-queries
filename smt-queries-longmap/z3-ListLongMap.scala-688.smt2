; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16636 () Bool)

(assert start!16636)

(declare-fun b!165955 () Bool)

(declare-fun b_free!3937 () Bool)

(declare-fun b_next!3937 () Bool)

(assert (=> b!165955 (= b_free!3937 (not b_next!3937))))

(declare-fun tp!14411 () Bool)

(declare-fun b_and!10325 () Bool)

(assert (=> b!165955 (= tp!14411 b_and!10325)))

(declare-fun b!165950 () Bool)

(declare-fun e!108846 () Bool)

(declare-fun e!108844 () Bool)

(assert (=> b!165950 (= e!108846 e!108844)))

(declare-fun res!78818 () Bool)

(assert (=> b!165950 (=> (not res!78818) (not e!108844))))

(declare-datatypes ((SeekEntryResult!459 0))(
  ( (MissingZero!459 (index!4004 (_ BitVec 32))) (Found!459 (index!4005 (_ BitVec 32))) (Intermediate!459 (undefined!1271 Bool) (index!4006 (_ BitVec 32)) (x!18414 (_ BitVec 32))) (Undefined!459) (MissingVacant!459 (index!4007 (_ BitVec 32))) )
))
(declare-fun lt!83009 () SeekEntryResult!459)

(get-info :version)

(assert (=> b!165950 (= res!78818 (and (not ((_ is Undefined!459) lt!83009)) (not ((_ is MissingVacant!459) lt!83009)) (not ((_ is MissingZero!459) lt!83009)) ((_ is Found!459) lt!83009)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4633 0))(
  ( (V!4634 (val!1914 Int)) )
))
(declare-datatypes ((ValueCell!1526 0))(
  ( (ValueCellFull!1526 (v!3773 V!4633)) (EmptyCell!1526) )
))
(declare-datatypes ((array!6555 0))(
  ( (array!6556 (arr!3112 (Array (_ BitVec 32) (_ BitVec 64))) (size!3401 (_ BitVec 32))) )
))
(declare-datatypes ((array!6557 0))(
  ( (array!6558 (arr!3113 (Array (_ BitVec 32) ValueCell!1526)) (size!3402 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1960 0))(
  ( (LongMapFixedSize!1961 (defaultEntry!3422 Int) (mask!8146 (_ BitVec 32)) (extraKeys!3163 (_ BitVec 32)) (zeroValue!3265 V!4633) (minValue!3265 V!4633) (_size!1029 (_ BitVec 32)) (_keys!5246 array!6555) (_values!3405 array!6557) (_vacant!1029 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1960)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6555 (_ BitVec 32)) SeekEntryResult!459)

(assert (=> b!165950 (= lt!83009 (seekEntryOrOpen!0 key!828 (_keys!5246 thiss!1248) (mask!8146 thiss!1248)))))

(declare-fun b!165951 () Bool)

(declare-fun e!108840 () Bool)

(declare-fun e!108842 () Bool)

(declare-fun mapRes!6327 () Bool)

(assert (=> b!165951 (= e!108840 (and e!108842 mapRes!6327))))

(declare-fun condMapEmpty!6327 () Bool)

(declare-fun mapDefault!6327 () ValueCell!1526)

(assert (=> b!165951 (= condMapEmpty!6327 (= (arr!3113 (_values!3405 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1526)) mapDefault!6327)))))

(declare-fun b!165952 () Bool)

(declare-fun tp_is_empty!3739 () Bool)

(assert (=> b!165952 (= e!108842 tp_is_empty!3739)))

(declare-fun b!165953 () Bool)

(declare-fun res!78814 () Bool)

(assert (=> b!165953 (=> (not res!78814) (not e!108844))))

(declare-datatypes ((tuple2!3078 0))(
  ( (tuple2!3079 (_1!1550 (_ BitVec 64)) (_2!1550 V!4633)) )
))
(declare-datatypes ((List!2082 0))(
  ( (Nil!2079) (Cons!2078 (h!2695 tuple2!3078) (t!6875 List!2082)) )
))
(declare-datatypes ((ListLongMap!2021 0))(
  ( (ListLongMap!2022 (toList!1026 List!2082)) )
))
(declare-fun contains!1071 (ListLongMap!2021 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!668 (array!6555 array!6557 (_ BitVec 32) (_ BitVec 32) V!4633 V!4633 (_ BitVec 32) Int) ListLongMap!2021)

(assert (=> b!165953 (= res!78814 (not (contains!1071 (getCurrentListMap!668 (_keys!5246 thiss!1248) (_values!3405 thiss!1248) (mask!8146 thiss!1248) (extraKeys!3163 thiss!1248) (zeroValue!3265 thiss!1248) (minValue!3265 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3422 thiss!1248)) key!828)))))

(declare-fun b!165954 () Bool)

(declare-fun res!78816 () Bool)

(assert (=> b!165954 (=> (not res!78816) (not e!108844))))

(assert (=> b!165954 (= res!78816 (and (= (size!3402 (_values!3405 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8146 thiss!1248))) (= (size!3401 (_keys!5246 thiss!1248)) (size!3402 (_values!3405 thiss!1248))) (bvsge (mask!8146 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3163 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3163 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6327 () Bool)

(declare-fun tp!14412 () Bool)

(declare-fun e!108845 () Bool)

(assert (=> mapNonEmpty!6327 (= mapRes!6327 (and tp!14412 e!108845))))

(declare-fun mapKey!6327 () (_ BitVec 32))

(declare-fun mapValue!6327 () ValueCell!1526)

(declare-fun mapRest!6327 () (Array (_ BitVec 32) ValueCell!1526))

(assert (=> mapNonEmpty!6327 (= (arr!3113 (_values!3405 thiss!1248)) (store mapRest!6327 mapKey!6327 mapValue!6327))))

(declare-fun res!78815 () Bool)

(assert (=> start!16636 (=> (not res!78815) (not e!108846))))

(declare-fun valid!869 (LongMapFixedSize!1960) Bool)

(assert (=> start!16636 (= res!78815 (valid!869 thiss!1248))))

(assert (=> start!16636 e!108846))

(declare-fun e!108843 () Bool)

(assert (=> start!16636 e!108843))

(assert (=> start!16636 true))

(declare-fun array_inv!2003 (array!6555) Bool)

(declare-fun array_inv!2004 (array!6557) Bool)

(assert (=> b!165955 (= e!108843 (and tp!14411 tp_is_empty!3739 (array_inv!2003 (_keys!5246 thiss!1248)) (array_inv!2004 (_values!3405 thiss!1248)) e!108840))))

(declare-fun b!165956 () Bool)

(declare-fun res!78819 () Bool)

(assert (=> b!165956 (=> (not res!78819) (not e!108844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165956 (= res!78819 (validMask!0 (mask!8146 thiss!1248)))))

(declare-fun b!165957 () Bool)

(declare-fun res!78820 () Bool)

(assert (=> b!165957 (=> (not res!78820) (not e!108846))))

(assert (=> b!165957 (= res!78820 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165958 () Bool)

(declare-fun res!78817 () Bool)

(assert (=> b!165958 (=> (not res!78817) (not e!108844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6555 (_ BitVec 32)) Bool)

(assert (=> b!165958 (= res!78817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5246 thiss!1248) (mask!8146 thiss!1248)))))

(declare-fun b!165959 () Bool)

(assert (=> b!165959 (= e!108844 false)))

(declare-fun lt!83010 () Bool)

(declare-datatypes ((List!2083 0))(
  ( (Nil!2080) (Cons!2079 (h!2696 (_ BitVec 64)) (t!6876 List!2083)) )
))
(declare-fun arrayNoDuplicates!0 (array!6555 (_ BitVec 32) List!2083) Bool)

(assert (=> b!165959 (= lt!83010 (arrayNoDuplicates!0 (_keys!5246 thiss!1248) #b00000000000000000000000000000000 Nil!2080))))

(declare-fun b!165960 () Bool)

(assert (=> b!165960 (= e!108845 tp_is_empty!3739)))

(declare-fun mapIsEmpty!6327 () Bool)

(assert (=> mapIsEmpty!6327 mapRes!6327))

(assert (= (and start!16636 res!78815) b!165957))

(assert (= (and b!165957 res!78820) b!165950))

(assert (= (and b!165950 res!78818) b!165953))

(assert (= (and b!165953 res!78814) b!165956))

(assert (= (and b!165956 res!78819) b!165954))

(assert (= (and b!165954 res!78816) b!165958))

(assert (= (and b!165958 res!78817) b!165959))

(assert (= (and b!165951 condMapEmpty!6327) mapIsEmpty!6327))

(assert (= (and b!165951 (not condMapEmpty!6327)) mapNonEmpty!6327))

(assert (= (and mapNonEmpty!6327 ((_ is ValueCellFull!1526) mapValue!6327)) b!165960))

(assert (= (and b!165951 ((_ is ValueCellFull!1526) mapDefault!6327)) b!165952))

(assert (= b!165955 b!165951))

(assert (= start!16636 b!165955))

(declare-fun m!195031 () Bool)

(assert (=> b!165950 m!195031))

(declare-fun m!195033 () Bool)

(assert (=> b!165955 m!195033))

(declare-fun m!195035 () Bool)

(assert (=> b!165955 m!195035))

(declare-fun m!195037 () Bool)

(assert (=> mapNonEmpty!6327 m!195037))

(declare-fun m!195039 () Bool)

(assert (=> b!165959 m!195039))

(declare-fun m!195041 () Bool)

(assert (=> b!165958 m!195041))

(declare-fun m!195043 () Bool)

(assert (=> start!16636 m!195043))

(declare-fun m!195045 () Bool)

(assert (=> b!165956 m!195045))

(declare-fun m!195047 () Bool)

(assert (=> b!165953 m!195047))

(assert (=> b!165953 m!195047))

(declare-fun m!195049 () Bool)

(assert (=> b!165953 m!195049))

(check-sat (not b!165953) (not b!165955) (not start!16636) (not b_next!3937) (not b!165956) (not mapNonEmpty!6327) (not b!165950) (not b!165959) tp_is_empty!3739 (not b!165958) b_and!10325)
(check-sat b_and!10325 (not b_next!3937))
