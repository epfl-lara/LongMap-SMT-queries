; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81576 () Bool)

(assert start!81576)

(declare-fun b!952968 () Bool)

(declare-fun b_free!18303 () Bool)

(declare-fun b_next!18303 () Bool)

(assert (=> b!952968 (= b_free!18303 (not b_next!18303))))

(declare-fun tp!63536 () Bool)

(declare-fun b_and!29787 () Bool)

(assert (=> b!952968 (= tp!63536 b_and!29787)))

(declare-fun b!952966 () Bool)

(declare-fun e!536717 () Bool)

(assert (=> b!952966 (= e!536717 (not true))))

(assert (=> b!952966 false))

(declare-datatypes ((V!32713 0))(
  ( (V!32714 (val!10456 Int)) )
))
(declare-datatypes ((ValueCell!9924 0))(
  ( (ValueCellFull!9924 (v!13009 V!32713)) (EmptyCell!9924) )
))
(declare-datatypes ((array!57660 0))(
  ( (array!57661 (arr!27720 (Array (_ BitVec 32) ValueCell!9924)) (size!28199 (_ BitVec 32))) )
))
(declare-datatypes ((array!57662 0))(
  ( (array!57663 (arr!27721 (Array (_ BitVec 32) (_ BitVec 64))) (size!28200 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4998 0))(
  ( (LongMapFixedSize!4999 (defaultEntry!5834 Int) (mask!27695 (_ BitVec 32)) (extraKeys!5566 (_ BitVec 32)) (zeroValue!5670 V!32713) (minValue!5670 V!32713) (_size!2554 (_ BitVec 32)) (_keys!10793 array!57662) (_values!5857 array!57660) (_vacant!2554 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4998)

(declare-datatypes ((Unit!32057 0))(
  ( (Unit!32058) )
))
(declare-fun lt!429464 () Unit!32057)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun lt!429465 () (_ BitVec 32))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57662 (_ BitVec 32)) Unit!32057)

(assert (=> b!952966 (= lt!429464 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429465 (_keys!10793 thiss!1141) (mask!27695 thiss!1141)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57662 (_ BitVec 32)) Bool)

(assert (=> b!952966 (arrayForallSeekEntryOrOpenFound!0 lt!429465 (_keys!10793 thiss!1141) (mask!27695 thiss!1141))))

(declare-fun lt!429462 () Unit!32057)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32057)

(assert (=> b!952966 (= lt!429462 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10793 thiss!1141) (mask!27695 thiss!1141) #b00000000000000000000000000000000 lt!429465))))

(declare-fun arrayScanForKey!0 (array!57662 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952966 (= lt!429465 (arrayScanForKey!0 (_keys!10793 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952966 (arrayContainsKey!0 (_keys!10793 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429463 () Unit!32057)

(declare-fun lemmaKeyInListMapIsInArray!339 (array!57662 array!57660 (_ BitVec 32) (_ BitVec 32) V!32713 V!32713 (_ BitVec 64) Int) Unit!32057)

(assert (=> b!952966 (= lt!429463 (lemmaKeyInListMapIsInArray!339 (_keys!10793 thiss!1141) (_values!5857 thiss!1141) (mask!27695 thiss!1141) (extraKeys!5566 thiss!1141) (zeroValue!5670 thiss!1141) (minValue!5670 thiss!1141) key!756 (defaultEntry!5834 thiss!1141)))))

(declare-fun res!638312 () Bool)

(assert (=> start!81576 (=> (not res!638312) (not e!536717))))

(declare-fun valid!1902 (LongMapFixedSize!4998) Bool)

(assert (=> start!81576 (= res!638312 (valid!1902 thiss!1141))))

(assert (=> start!81576 e!536717))

(declare-fun e!536718 () Bool)

(assert (=> start!81576 e!536718))

(assert (=> start!81576 true))

(declare-fun b!952967 () Bool)

(declare-fun e!536716 () Bool)

(declare-fun tp_is_empty!20811 () Bool)

(assert (=> b!952967 (= e!536716 tp_is_empty!20811)))

(declare-fun e!536720 () Bool)

(declare-fun array_inv!21512 (array!57662) Bool)

(declare-fun array_inv!21513 (array!57660) Bool)

(assert (=> b!952968 (= e!536718 (and tp!63536 tp_is_empty!20811 (array_inv!21512 (_keys!10793 thiss!1141)) (array_inv!21513 (_values!5857 thiss!1141)) e!536720))))

(declare-fun mapNonEmpty!33160 () Bool)

(declare-fun mapRes!33160 () Bool)

(declare-fun tp!63537 () Bool)

(assert (=> mapNonEmpty!33160 (= mapRes!33160 (and tp!63537 e!536716))))

(declare-fun mapRest!33160 () (Array (_ BitVec 32) ValueCell!9924))

(declare-fun mapKey!33160 () (_ BitVec 32))

(declare-fun mapValue!33160 () ValueCell!9924)

(assert (=> mapNonEmpty!33160 (= (arr!27720 (_values!5857 thiss!1141)) (store mapRest!33160 mapKey!33160 mapValue!33160))))

(declare-fun b!952969 () Bool)

(declare-fun res!638310 () Bool)

(assert (=> b!952969 (=> (not res!638310) (not e!536717))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9165 0))(
  ( (MissingZero!9165 (index!39031 (_ BitVec 32))) (Found!9165 (index!39032 (_ BitVec 32))) (Intermediate!9165 (undefined!9977 Bool) (index!39033 (_ BitVec 32)) (x!81979 (_ BitVec 32))) (Undefined!9165) (MissingVacant!9165 (index!39034 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57662 (_ BitVec 32)) SeekEntryResult!9165)

(assert (=> b!952969 (= res!638310 (not ((_ is Found!9165) (seekEntry!0 key!756 (_keys!10793 thiss!1141) (mask!27695 thiss!1141)))))))

(declare-fun b!952970 () Bool)

(declare-fun e!536721 () Bool)

(assert (=> b!952970 (= e!536721 tp_is_empty!20811)))

(declare-fun b!952971 () Bool)

(declare-fun res!638311 () Bool)

(assert (=> b!952971 (=> (not res!638311) (not e!536717))))

(assert (=> b!952971 (= res!638311 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952972 () Bool)

(declare-fun res!638313 () Bool)

(assert (=> b!952972 (=> (not res!638313) (not e!536717))))

(declare-datatypes ((tuple2!13592 0))(
  ( (tuple2!13593 (_1!6807 (_ BitVec 64)) (_2!6807 V!32713)) )
))
(declare-datatypes ((List!19371 0))(
  ( (Nil!19368) (Cons!19367 (h!20529 tuple2!13592) (t!27730 List!19371)) )
))
(declare-datatypes ((ListLongMap!12289 0))(
  ( (ListLongMap!12290 (toList!6160 List!19371)) )
))
(declare-fun contains!5255 (ListLongMap!12289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3393 (array!57662 array!57660 (_ BitVec 32) (_ BitVec 32) V!32713 V!32713 (_ BitVec 32) Int) ListLongMap!12289)

(assert (=> b!952972 (= res!638313 (contains!5255 (getCurrentListMap!3393 (_keys!10793 thiss!1141) (_values!5857 thiss!1141) (mask!27695 thiss!1141) (extraKeys!5566 thiss!1141) (zeroValue!5670 thiss!1141) (minValue!5670 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5834 thiss!1141)) key!756))))

(declare-fun b!952973 () Bool)

(assert (=> b!952973 (= e!536720 (and e!536721 mapRes!33160))))

(declare-fun condMapEmpty!33160 () Bool)

(declare-fun mapDefault!33160 () ValueCell!9924)

(assert (=> b!952973 (= condMapEmpty!33160 (= (arr!27720 (_values!5857 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9924)) mapDefault!33160)))))

(declare-fun mapIsEmpty!33160 () Bool)

(assert (=> mapIsEmpty!33160 mapRes!33160))

(assert (= (and start!81576 res!638312) b!952971))

(assert (= (and b!952971 res!638311) b!952969))

(assert (= (and b!952969 res!638310) b!952972))

(assert (= (and b!952972 res!638313) b!952966))

(assert (= (and b!952973 condMapEmpty!33160) mapIsEmpty!33160))

(assert (= (and b!952973 (not condMapEmpty!33160)) mapNonEmpty!33160))

(assert (= (and mapNonEmpty!33160 ((_ is ValueCellFull!9924) mapValue!33160)) b!952967))

(assert (= (and b!952973 ((_ is ValueCellFull!9924) mapDefault!33160)) b!952970))

(assert (= b!952968 b!952973))

(assert (= start!81576 b!952968))

(declare-fun m!885045 () Bool)

(assert (=> b!952969 m!885045))

(declare-fun m!885047 () Bool)

(assert (=> start!81576 m!885047))

(declare-fun m!885049 () Bool)

(assert (=> mapNonEmpty!33160 m!885049))

(declare-fun m!885051 () Bool)

(assert (=> b!952968 m!885051))

(declare-fun m!885053 () Bool)

(assert (=> b!952968 m!885053))

(declare-fun m!885055 () Bool)

(assert (=> b!952972 m!885055))

(assert (=> b!952972 m!885055))

(declare-fun m!885057 () Bool)

(assert (=> b!952972 m!885057))

(declare-fun m!885059 () Bool)

(assert (=> b!952966 m!885059))

(declare-fun m!885061 () Bool)

(assert (=> b!952966 m!885061))

(declare-fun m!885063 () Bool)

(assert (=> b!952966 m!885063))

(declare-fun m!885065 () Bool)

(assert (=> b!952966 m!885065))

(declare-fun m!885067 () Bool)

(assert (=> b!952966 m!885067))

(declare-fun m!885069 () Bool)

(assert (=> b!952966 m!885069))

(check-sat tp_is_empty!20811 (not b!952972) b_and!29787 (not b!952968) (not mapNonEmpty!33160) (not start!81576) (not b!952969) (not b!952966) (not b_next!18303))
(check-sat b_and!29787 (not b_next!18303))
