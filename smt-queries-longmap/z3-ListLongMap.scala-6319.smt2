; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81182 () Bool)

(assert start!81182)

(declare-fun b!949963 () Bool)

(declare-fun b_free!18235 () Bool)

(declare-fun b_next!18235 () Bool)

(assert (=> b!949963 (= b_free!18235 (not b_next!18235))))

(declare-fun tp!63301 () Bool)

(declare-fun b_and!29665 () Bool)

(assert (=> b!949963 (= tp!63301 b_and!29665)))

(declare-fun b!949955 () Bool)

(declare-fun res!636974 () Bool)

(declare-fun e!534811 () Bool)

(assert (=> b!949955 (=> (not res!636974) (not e!534811))))

(declare-datatypes ((V!32623 0))(
  ( (V!32624 (val!10422 Int)) )
))
(declare-datatypes ((ValueCell!9890 0))(
  ( (ValueCellFull!9890 (v!12964 V!32623)) (EmptyCell!9890) )
))
(declare-datatypes ((array!57469 0))(
  ( (array!57470 (arr!27635 (Array (_ BitVec 32) ValueCell!9890)) (size!28114 (_ BitVec 32))) )
))
(declare-datatypes ((array!57471 0))(
  ( (array!57472 (arr!27636 (Array (_ BitVec 32) (_ BitVec 64))) (size!28115 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4930 0))(
  ( (LongMapFixedSize!4931 (defaultEntry!5776 Int) (mask!27567 (_ BitVec 32)) (extraKeys!5508 (_ BitVec 32)) (zeroValue!5612 V!32623) (minValue!5612 V!32623) (_size!2520 (_ BitVec 32)) (_keys!10707 array!57471) (_values!5799 array!57469) (_vacant!2520 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4930)

(assert (=> b!949955 (= res!636974 (and (= (size!28114 (_values!5799 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27567 thiss!1141))) (= (size!28115 (_keys!10707 thiss!1141)) (size!28114 (_values!5799 thiss!1141))) (bvsge (mask!27567 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5508 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5508 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!949956 () Bool)

(declare-fun res!636979 () Bool)

(assert (=> b!949956 (=> (not res!636979) (not e!534811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57471 (_ BitVec 32)) Bool)

(assert (=> b!949956 (= res!636979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10707 thiss!1141) (mask!27567 thiss!1141)))))

(declare-fun b!949957 () Bool)

(declare-fun res!636976 () Bool)

(assert (=> b!949957 (=> (not res!636976) (not e!534811))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!949957 (= res!636976 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949958 () Bool)

(declare-fun res!636977 () Bool)

(assert (=> b!949958 (=> (not res!636977) (not e!534811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949958 (= res!636977 (validMask!0 (mask!27567 thiss!1141)))))

(declare-fun b!949959 () Bool)

(declare-fun e!534813 () Bool)

(declare-fun tp_is_empty!20743 () Bool)

(assert (=> b!949959 (= e!534813 tp_is_empty!20743)))

(declare-fun b!949960 () Bool)

(declare-fun res!636975 () Bool)

(assert (=> b!949960 (=> (not res!636975) (not e!534811))))

(declare-datatypes ((tuple2!13594 0))(
  ( (tuple2!13595 (_1!6808 (_ BitVec 64)) (_2!6808 V!32623)) )
))
(declare-datatypes ((List!19340 0))(
  ( (Nil!19337) (Cons!19336 (h!20496 tuple2!13594) (t!27670 List!19340)) )
))
(declare-datatypes ((ListLongMap!12281 0))(
  ( (ListLongMap!12282 (toList!6156 List!19340)) )
))
(declare-fun contains!5190 (ListLongMap!12281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3318 (array!57471 array!57469 (_ BitVec 32) (_ BitVec 32) V!32623 V!32623 (_ BitVec 32) Int) ListLongMap!12281)

(assert (=> b!949960 (= res!636975 (contains!5190 (getCurrentListMap!3318 (_keys!10707 thiss!1141) (_values!5799 thiss!1141) (mask!27567 thiss!1141) (extraKeys!5508 thiss!1141) (zeroValue!5612 thiss!1141) (minValue!5612 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5776 thiss!1141)) key!756))))

(declare-fun b!949961 () Bool)

(declare-fun res!636978 () Bool)

(assert (=> b!949961 (=> (not res!636978) (not e!534811))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9138 0))(
  ( (MissingZero!9138 (index!38923 (_ BitVec 32))) (Found!9138 (index!38924 (_ BitVec 32))) (Intermediate!9138 (undefined!9950 Bool) (index!38925 (_ BitVec 32)) (x!81743 (_ BitVec 32))) (Undefined!9138) (MissingVacant!9138 (index!38926 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57471 (_ BitVec 32)) SeekEntryResult!9138)

(assert (=> b!949961 (= res!636978 (not ((_ is Found!9138) (seekEntry!0 key!756 (_keys!10707 thiss!1141) (mask!27567 thiss!1141)))))))

(declare-fun b!949962 () Bool)

(assert (=> b!949962 (= e!534811 false)))

(declare-fun lt!427696 () Bool)

(declare-datatypes ((List!19341 0))(
  ( (Nil!19338) (Cons!19337 (h!20497 (_ BitVec 64)) (t!27671 List!19341)) )
))
(declare-fun arrayNoDuplicates!0 (array!57471 (_ BitVec 32) List!19341) Bool)

(assert (=> b!949962 (= lt!427696 (arrayNoDuplicates!0 (_keys!10707 thiss!1141) #b00000000000000000000000000000000 Nil!19338))))

(declare-fun res!636980 () Bool)

(assert (=> start!81182 (=> (not res!636980) (not e!534811))))

(declare-fun valid!1882 (LongMapFixedSize!4930) Bool)

(assert (=> start!81182 (= res!636980 (valid!1882 thiss!1141))))

(assert (=> start!81182 e!534811))

(declare-fun e!534815 () Bool)

(assert (=> start!81182 e!534815))

(assert (=> start!81182 true))

(declare-fun mapNonEmpty!33026 () Bool)

(declare-fun mapRes!33026 () Bool)

(declare-fun tp!63302 () Bool)

(assert (=> mapNonEmpty!33026 (= mapRes!33026 (and tp!63302 e!534813))))

(declare-fun mapValue!33026 () ValueCell!9890)

(declare-fun mapRest!33026 () (Array (_ BitVec 32) ValueCell!9890))

(declare-fun mapKey!33026 () (_ BitVec 32))

(assert (=> mapNonEmpty!33026 (= (arr!27635 (_values!5799 thiss!1141)) (store mapRest!33026 mapKey!33026 mapValue!33026))))

(declare-fun mapIsEmpty!33026 () Bool)

(assert (=> mapIsEmpty!33026 mapRes!33026))

(declare-fun e!534814 () Bool)

(declare-fun array_inv!21510 (array!57471) Bool)

(declare-fun array_inv!21511 (array!57469) Bool)

(assert (=> b!949963 (= e!534815 (and tp!63301 tp_is_empty!20743 (array_inv!21510 (_keys!10707 thiss!1141)) (array_inv!21511 (_values!5799 thiss!1141)) e!534814))))

(declare-fun b!949964 () Bool)

(declare-fun e!534810 () Bool)

(assert (=> b!949964 (= e!534814 (and e!534810 mapRes!33026))))

(declare-fun condMapEmpty!33026 () Bool)

(declare-fun mapDefault!33026 () ValueCell!9890)

(assert (=> b!949964 (= condMapEmpty!33026 (= (arr!27635 (_values!5799 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9890)) mapDefault!33026)))))

(declare-fun b!949965 () Bool)

(assert (=> b!949965 (= e!534810 tp_is_empty!20743)))

(assert (= (and start!81182 res!636980) b!949957))

(assert (= (and b!949957 res!636976) b!949961))

(assert (= (and b!949961 res!636978) b!949960))

(assert (= (and b!949960 res!636975) b!949958))

(assert (= (and b!949958 res!636977) b!949955))

(assert (= (and b!949955 res!636974) b!949956))

(assert (= (and b!949956 res!636979) b!949962))

(assert (= (and b!949964 condMapEmpty!33026) mapIsEmpty!33026))

(assert (= (and b!949964 (not condMapEmpty!33026)) mapNonEmpty!33026))

(assert (= (and mapNonEmpty!33026 ((_ is ValueCellFull!9890) mapValue!33026)) b!949959))

(assert (= (and b!949964 ((_ is ValueCellFull!9890) mapDefault!33026)) b!949965))

(assert (= b!949963 b!949964))

(assert (= start!81182 b!949963))

(declare-fun m!881913 () Bool)

(assert (=> b!949961 m!881913))

(declare-fun m!881915 () Bool)

(assert (=> b!949958 m!881915))

(declare-fun m!881917 () Bool)

(assert (=> start!81182 m!881917))

(declare-fun m!881919 () Bool)

(assert (=> b!949962 m!881919))

(declare-fun m!881921 () Bool)

(assert (=> b!949963 m!881921))

(declare-fun m!881923 () Bool)

(assert (=> b!949963 m!881923))

(declare-fun m!881925 () Bool)

(assert (=> b!949956 m!881925))

(declare-fun m!881927 () Bool)

(assert (=> b!949960 m!881927))

(assert (=> b!949960 m!881927))

(declare-fun m!881929 () Bool)

(assert (=> b!949960 m!881929))

(declare-fun m!881931 () Bool)

(assert (=> mapNonEmpty!33026 m!881931))

(check-sat b_and!29665 (not b!949958) (not b!949960) (not mapNonEmpty!33026) (not b!949962) (not b!949963) (not b!949961) (not b_next!18235) tp_is_empty!20743 (not start!81182) (not b!949956))
(check-sat b_and!29665 (not b_next!18235))
