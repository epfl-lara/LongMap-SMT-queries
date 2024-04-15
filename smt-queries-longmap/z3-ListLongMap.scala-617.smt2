; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16054 () Bool)

(assert start!16054)

(declare-fun b!159086 () Bool)

(declare-fun b_free!3511 () Bool)

(declare-fun b_next!3511 () Bool)

(assert (=> b!159086 (= b_free!3511 (not b_next!3511))))

(declare-fun tp!13102 () Bool)

(declare-fun b_and!9899 () Bool)

(assert (=> b!159086 (= tp!13102 b_and!9899)))

(declare-fun b!159084 () Bool)

(declare-fun res!75108 () Bool)

(declare-fun e!104145 () Bool)

(assert (=> b!159084 (=> (not res!75108) (not e!104145))))

(declare-datatypes ((V!4065 0))(
  ( (V!4066 (val!1701 Int)) )
))
(declare-datatypes ((ValueCell!1313 0))(
  ( (ValueCellFull!1313 (v!3560 V!4065)) (EmptyCell!1313) )
))
(declare-datatypes ((array!5685 0))(
  ( (array!5686 (arr!2686 (Array (_ BitVec 32) (_ BitVec 64))) (size!2971 (_ BitVec 32))) )
))
(declare-datatypes ((array!5687 0))(
  ( (array!5688 (arr!2687 (Array (_ BitVec 32) ValueCell!1313)) (size!2972 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1534 0))(
  ( (LongMapFixedSize!1535 (defaultEntry!3209 Int) (mask!7754 (_ BitVec 32)) (extraKeys!2950 (_ BitVec 32)) (zeroValue!3052 V!4065) (minValue!3052 V!4065) (_size!816 (_ BitVec 32)) (_keys!5009 array!5685) (_values!3192 array!5687) (_vacant!816 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1534)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2844 0))(
  ( (tuple2!2845 (_1!1433 (_ BitVec 64)) (_2!1433 V!4065)) )
))
(declare-datatypes ((List!1894 0))(
  ( (Nil!1891) (Cons!1890 (h!2503 tuple2!2844) (t!6687 List!1894)) )
))
(declare-datatypes ((ListLongMap!1831 0))(
  ( (ListLongMap!1832 (toList!931 List!1894)) )
))
(declare-fun contains!970 (ListLongMap!1831 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!581 (array!5685 array!5687 (_ BitVec 32) (_ BitVec 32) V!4065 V!4065 (_ BitVec 32) Int) ListLongMap!1831)

(assert (=> b!159084 (= res!75108 (contains!970 (getCurrentListMap!581 (_keys!5009 thiss!1248) (_values!3192 thiss!1248) (mask!7754 thiss!1248) (extraKeys!2950 thiss!1248) (zeroValue!3052 thiss!1248) (minValue!3052 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3209 thiss!1248)) key!828))))

(declare-fun b!159085 () Bool)

(declare-fun res!75107 () Bool)

(assert (=> b!159085 (=> (not res!75107) (not e!104145))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!313 0))(
  ( (MissingZero!313 (index!3420 (_ BitVec 32))) (Found!313 (index!3421 (_ BitVec 32))) (Intermediate!313 (undefined!1125 Bool) (index!3422 (_ BitVec 32)) (x!17592 (_ BitVec 32))) (Undefined!313) (MissingVacant!313 (index!3423 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5685 (_ BitVec 32)) SeekEntryResult!313)

(assert (=> b!159085 (= res!75107 ((_ is Undefined!313) (seekEntryOrOpen!0 key!828 (_keys!5009 thiss!1248) (mask!7754 thiss!1248))))))

(declare-fun e!104148 () Bool)

(declare-fun e!104146 () Bool)

(declare-fun tp_is_empty!3313 () Bool)

(declare-fun array_inv!1725 (array!5685) Bool)

(declare-fun array_inv!1726 (array!5687) Bool)

(assert (=> b!159086 (= e!104148 (and tp!13102 tp_is_empty!3313 (array_inv!1725 (_keys!5009 thiss!1248)) (array_inv!1726 (_values!3192 thiss!1248)) e!104146))))

(declare-fun b!159087 () Bool)

(assert (=> b!159087 (= e!104145 false)))

(declare-fun lt!81798 () Bool)

(declare-datatypes ((List!1895 0))(
  ( (Nil!1892) (Cons!1891 (h!2504 (_ BitVec 64)) (t!6688 List!1895)) )
))
(declare-fun arrayNoDuplicates!0 (array!5685 (_ BitVec 32) List!1895) Bool)

(assert (=> b!159087 (= lt!81798 (arrayNoDuplicates!0 (_keys!5009 thiss!1248) #b00000000000000000000000000000000 Nil!1892))))

(declare-fun b!159088 () Bool)

(declare-fun e!104147 () Bool)

(declare-fun mapRes!5657 () Bool)

(assert (=> b!159088 (= e!104146 (and e!104147 mapRes!5657))))

(declare-fun condMapEmpty!5657 () Bool)

(declare-fun mapDefault!5657 () ValueCell!1313)

(assert (=> b!159088 (= condMapEmpty!5657 (= (arr!2687 (_values!3192 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1313)) mapDefault!5657)))))

(declare-fun b!159089 () Bool)

(declare-fun e!104149 () Bool)

(assert (=> b!159089 (= e!104149 tp_is_empty!3313)))

(declare-fun res!75105 () Bool)

(assert (=> start!16054 (=> (not res!75105) (not e!104145))))

(declare-fun valid!723 (LongMapFixedSize!1534) Bool)

(assert (=> start!16054 (= res!75105 (valid!723 thiss!1248))))

(assert (=> start!16054 e!104145))

(assert (=> start!16054 e!104148))

(assert (=> start!16054 true))

(declare-fun b!159090 () Bool)

(declare-fun res!75103 () Bool)

(assert (=> b!159090 (=> (not res!75103) (not e!104145))))

(assert (=> b!159090 (= res!75103 (and (= (size!2972 (_values!3192 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7754 thiss!1248))) (= (size!2971 (_keys!5009 thiss!1248)) (size!2972 (_values!3192 thiss!1248))) (bvsge (mask!7754 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2950 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2950 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159091 () Bool)

(assert (=> b!159091 (= e!104147 tp_is_empty!3313)))

(declare-fun b!159092 () Bool)

(declare-fun res!75102 () Bool)

(assert (=> b!159092 (=> (not res!75102) (not e!104145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5685 (_ BitVec 32)) Bool)

(assert (=> b!159092 (= res!75102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5009 thiss!1248) (mask!7754 thiss!1248)))))

(declare-fun b!159093 () Bool)

(declare-fun res!75104 () Bool)

(assert (=> b!159093 (=> (not res!75104) (not e!104145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159093 (= res!75104 (validMask!0 (mask!7754 thiss!1248)))))

(declare-fun b!159094 () Bool)

(declare-fun res!75106 () Bool)

(assert (=> b!159094 (=> (not res!75106) (not e!104145))))

(assert (=> b!159094 (= res!75106 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5657 () Bool)

(declare-fun tp!13103 () Bool)

(assert (=> mapNonEmpty!5657 (= mapRes!5657 (and tp!13103 e!104149))))

(declare-fun mapRest!5657 () (Array (_ BitVec 32) ValueCell!1313))

(declare-fun mapValue!5657 () ValueCell!1313)

(declare-fun mapKey!5657 () (_ BitVec 32))

(assert (=> mapNonEmpty!5657 (= (arr!2687 (_values!3192 thiss!1248)) (store mapRest!5657 mapKey!5657 mapValue!5657))))

(declare-fun mapIsEmpty!5657 () Bool)

(assert (=> mapIsEmpty!5657 mapRes!5657))

(assert (= (and start!16054 res!75105) b!159094))

(assert (= (and b!159094 res!75106) b!159085))

(assert (= (and b!159085 res!75107) b!159084))

(assert (= (and b!159084 res!75108) b!159093))

(assert (= (and b!159093 res!75104) b!159090))

(assert (= (and b!159090 res!75103) b!159092))

(assert (= (and b!159092 res!75102) b!159087))

(assert (= (and b!159088 condMapEmpty!5657) mapIsEmpty!5657))

(assert (= (and b!159088 (not condMapEmpty!5657)) mapNonEmpty!5657))

(assert (= (and mapNonEmpty!5657 ((_ is ValueCellFull!1313) mapValue!5657)) b!159089))

(assert (= (and b!159088 ((_ is ValueCellFull!1313) mapDefault!5657)) b!159091))

(assert (= b!159086 b!159088))

(assert (= start!16054 b!159086))

(declare-fun m!190957 () Bool)

(assert (=> b!159092 m!190957))

(declare-fun m!190959 () Bool)

(assert (=> b!159085 m!190959))

(declare-fun m!190961 () Bool)

(assert (=> b!159084 m!190961))

(assert (=> b!159084 m!190961))

(declare-fun m!190963 () Bool)

(assert (=> b!159084 m!190963))

(declare-fun m!190965 () Bool)

(assert (=> b!159086 m!190965))

(declare-fun m!190967 () Bool)

(assert (=> b!159086 m!190967))

(declare-fun m!190969 () Bool)

(assert (=> b!159087 m!190969))

(declare-fun m!190971 () Bool)

(assert (=> start!16054 m!190971))

(declare-fun m!190973 () Bool)

(assert (=> b!159093 m!190973))

(declare-fun m!190975 () Bool)

(assert (=> mapNonEmpty!5657 m!190975))

(check-sat (not b!159087) b_and!9899 (not b_next!3511) (not b!159084) (not b!159085) (not mapNonEmpty!5657) tp_is_empty!3313 (not b!159086) (not b!159093) (not b!159092) (not start!16054))
(check-sat b_and!9899 (not b_next!3511))
