; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89220 () Bool)

(assert start!89220)

(declare-fun b!1022859 () Bool)

(declare-fun b_free!20263 () Bool)

(declare-fun b_next!20263 () Bool)

(assert (=> b!1022859 (= b_free!20263 (not b_next!20263))))

(declare-fun tp!71824 () Bool)

(declare-fun b_and!32459 () Bool)

(assert (=> b!1022859 (= tp!71824 b_and!32459)))

(declare-fun res!685122 () Bool)

(declare-fun e!576310 () Bool)

(assert (=> start!89220 (=> (not res!685122) (not e!576310))))

(declare-datatypes ((V!36851 0))(
  ( (V!36852 (val!12042 Int)) )
))
(declare-datatypes ((ValueCell!11288 0))(
  ( (ValueCellFull!11288 (v!14610 V!36851)) (EmptyCell!11288) )
))
(declare-datatypes ((array!63949 0))(
  ( (array!63950 (arr!30786 (Array (_ BitVec 32) (_ BitVec 64))) (size!31299 (_ BitVec 32))) )
))
(declare-datatypes ((array!63951 0))(
  ( (array!63952 (arr!30787 (Array (_ BitVec 32) ValueCell!11288)) (size!31300 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5170 0))(
  ( (LongMapFixedSize!5171 (defaultEntry!5937 Int) (mask!29543 (_ BitVec 32)) (extraKeys!5669 (_ BitVec 32)) (zeroValue!5773 V!36851) (minValue!5773 V!36851) (_size!2640 (_ BitVec 32)) (_keys!11078 array!63949) (_values!5960 array!63951) (_vacant!2640 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5170)

(declare-fun valid!1968 (LongMapFixedSize!5170) Bool)

(assert (=> start!89220 (= res!685122 (valid!1968 thiss!1427))))

(assert (=> start!89220 e!576310))

(declare-fun e!576312 () Bool)

(assert (=> start!89220 e!576312))

(assert (=> start!89220 true))

(declare-fun b!1022854 () Bool)

(declare-fun res!685124 () Bool)

(assert (=> b!1022854 (=> (not res!685124) (not e!576310))))

(assert (=> b!1022854 (= res!685124 (and (= (size!31300 (_values!5960 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29543 thiss!1427))) (= (size!31299 (_keys!11078 thiss!1427)) (size!31300 (_values!5960 thiss!1427))) (bvsge (mask!29543 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5669 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5669 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5669 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5669 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5669 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5669 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5669 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022855 () Bool)

(assert (=> b!1022855 (= e!576310 false)))

(declare-fun lt!450160 () Bool)

(declare-datatypes ((List!21732 0))(
  ( (Nil!21729) (Cons!21728 (h!22926 (_ BitVec 64)) (t!30761 List!21732)) )
))
(declare-fun arrayNoDuplicates!0 (array!63949 (_ BitVec 32) List!21732) Bool)

(assert (=> b!1022855 (= lt!450160 (arrayNoDuplicates!0 (_keys!11078 thiss!1427) #b00000000000000000000000000000000 Nil!21729))))

(declare-fun b!1022856 () Bool)

(declare-fun res!685125 () Bool)

(assert (=> b!1022856 (=> (not res!685125) (not e!576310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022856 (= res!685125 (validMask!0 (mask!29543 thiss!1427)))))

(declare-fun b!1022857 () Bool)

(declare-fun e!576311 () Bool)

(declare-fun tp_is_empty!23983 () Bool)

(assert (=> b!1022857 (= e!576311 tp_is_empty!23983)))

(declare-fun b!1022858 () Bool)

(declare-fun e!576313 () Bool)

(declare-fun e!576314 () Bool)

(declare-fun mapRes!37392 () Bool)

(assert (=> b!1022858 (= e!576313 (and e!576314 mapRes!37392))))

(declare-fun condMapEmpty!37392 () Bool)

(declare-fun mapDefault!37392 () ValueCell!11288)

(assert (=> b!1022858 (= condMapEmpty!37392 (= (arr!30787 (_values!5960 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11288)) mapDefault!37392)))))

(declare-fun array_inv!23879 (array!63949) Bool)

(declare-fun array_inv!23880 (array!63951) Bool)

(assert (=> b!1022859 (= e!576312 (and tp!71824 tp_is_empty!23983 (array_inv!23879 (_keys!11078 thiss!1427)) (array_inv!23880 (_values!5960 thiss!1427)) e!576313))))

(declare-fun mapIsEmpty!37392 () Bool)

(assert (=> mapIsEmpty!37392 mapRes!37392))

(declare-fun b!1022860 () Bool)

(assert (=> b!1022860 (= e!576314 tp_is_empty!23983)))

(declare-fun b!1022861 () Bool)

(declare-fun res!685123 () Bool)

(assert (=> b!1022861 (=> (not res!685123) (not e!576310))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022861 (= res!685123 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1022862 () Bool)

(declare-fun res!685126 () Bool)

(assert (=> b!1022862 (=> (not res!685126) (not e!576310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63949 (_ BitVec 32)) Bool)

(assert (=> b!1022862 (= res!685126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11078 thiss!1427) (mask!29543 thiss!1427)))))

(declare-fun mapNonEmpty!37392 () Bool)

(declare-fun tp!71823 () Bool)

(assert (=> mapNonEmpty!37392 (= mapRes!37392 (and tp!71823 e!576311))))

(declare-fun mapRest!37392 () (Array (_ BitVec 32) ValueCell!11288))

(declare-fun mapKey!37392 () (_ BitVec 32))

(declare-fun mapValue!37392 () ValueCell!11288)

(assert (=> mapNonEmpty!37392 (= (arr!30787 (_values!5960 thiss!1427)) (store mapRest!37392 mapKey!37392 mapValue!37392))))

(assert (= (and start!89220 res!685122) b!1022861))

(assert (= (and b!1022861 res!685123) b!1022856))

(assert (= (and b!1022856 res!685125) b!1022854))

(assert (= (and b!1022854 res!685124) b!1022862))

(assert (= (and b!1022862 res!685126) b!1022855))

(assert (= (and b!1022858 condMapEmpty!37392) mapIsEmpty!37392))

(assert (= (and b!1022858 (not condMapEmpty!37392)) mapNonEmpty!37392))

(get-info :version)

(assert (= (and mapNonEmpty!37392 ((_ is ValueCellFull!11288) mapValue!37392)) b!1022857))

(assert (= (and b!1022858 ((_ is ValueCellFull!11288) mapDefault!37392)) b!1022860))

(assert (= b!1022859 b!1022858))

(assert (= start!89220 b!1022859))

(declare-fun m!941277 () Bool)

(assert (=> b!1022859 m!941277))

(declare-fun m!941279 () Bool)

(assert (=> b!1022859 m!941279))

(declare-fun m!941281 () Bool)

(assert (=> mapNonEmpty!37392 m!941281))

(declare-fun m!941283 () Bool)

(assert (=> start!89220 m!941283))

(declare-fun m!941285 () Bool)

(assert (=> b!1022856 m!941285))

(declare-fun m!941287 () Bool)

(assert (=> b!1022862 m!941287))

(declare-fun m!941289 () Bool)

(assert (=> b!1022855 m!941289))

(check-sat (not mapNonEmpty!37392) tp_is_empty!23983 (not b!1022855) (not b_next!20263) (not b!1022856) (not start!89220) (not b!1022862) (not b!1022859) b_and!32459)
(check-sat b_and!32459 (not b_next!20263))
