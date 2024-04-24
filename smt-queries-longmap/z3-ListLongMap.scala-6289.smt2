; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80580 () Bool)

(assert start!80580)

(declare-fun b!945431 () Bool)

(declare-fun b_free!18055 () Bool)

(declare-fun b_next!18055 () Bool)

(assert (=> b!945431 (= b_free!18055 (not b_next!18055))))

(declare-fun tp!62676 () Bool)

(declare-fun b_and!29483 () Bool)

(assert (=> b!945431 (= tp!62676 b_and!29483)))

(declare-fun b!945430 () Bool)

(declare-fun e!531742 () Bool)

(declare-fun tp_is_empty!20563 () Bool)

(assert (=> b!945430 (= e!531742 tp_is_empty!20563)))

(declare-fun e!531737 () Bool)

(declare-fun e!531739 () Bool)

(declare-datatypes ((V!32383 0))(
  ( (V!32384 (val!10332 Int)) )
))
(declare-datatypes ((ValueCell!9800 0))(
  ( (ValueCellFull!9800 (v!12861 V!32383)) (EmptyCell!9800) )
))
(declare-datatypes ((array!57145 0))(
  ( (array!57146 (arr!27493 (Array (_ BitVec 32) ValueCell!9800)) (size!27960 (_ BitVec 32))) )
))
(declare-datatypes ((array!57147 0))(
  ( (array!57148 (arr!27494 (Array (_ BitVec 32) (_ BitVec 64))) (size!27961 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4750 0))(
  ( (LongMapFixedSize!4751 (defaultEntry!5670 Int) (mask!27365 (_ BitVec 32)) (extraKeys!5402 (_ BitVec 32)) (zeroValue!5506 V!32383) (minValue!5506 V!32383) (_size!2430 (_ BitVec 32)) (_keys!10576 array!57147) (_values!5693 array!57145) (_vacant!2430 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4750)

(declare-fun array_inv!21446 (array!57147) Bool)

(declare-fun array_inv!21447 (array!57145) Bool)

(assert (=> b!945431 (= e!531739 (and tp!62676 tp_is_empty!20563 (array_inv!21446 (_keys!10576 thiss!1141)) (array_inv!21447 (_values!5693 thiss!1141)) e!531737))))

(declare-fun mapNonEmpty!32670 () Bool)

(declare-fun mapRes!32670 () Bool)

(declare-fun tp!62675 () Bool)

(assert (=> mapNonEmpty!32670 (= mapRes!32670 (and tp!62675 e!531742))))

(declare-fun mapValue!32670 () ValueCell!9800)

(declare-fun mapRest!32670 () (Array (_ BitVec 32) ValueCell!9800))

(declare-fun mapKey!32670 () (_ BitVec 32))

(assert (=> mapNonEmpty!32670 (= (arr!27493 (_values!5693 thiss!1141)) (store mapRest!32670 mapKey!32670 mapValue!32670))))

(declare-fun b!945432 () Bool)

(declare-fun e!531738 () Bool)

(assert (=> b!945432 (= e!531738 true)))

(declare-datatypes ((SeekEntryResult!9030 0))(
  ( (MissingZero!9030 (index!38491 (_ BitVec 32))) (Found!9030 (index!38492 (_ BitVec 32))) (Intermediate!9030 (undefined!9842 Bool) (index!38493 (_ BitVec 32)) (x!81103 (_ BitVec 32))) (Undefined!9030) (MissingVacant!9030 (index!38494 (_ BitVec 32))) )
))
(declare-fun lt!426021 () SeekEntryResult!9030)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57147 (_ BitVec 32)) SeekEntryResult!9030)

(assert (=> b!945432 (= lt!426021 (seekEntryOrOpen!0 key!756 (_keys!10576 thiss!1141) (mask!27365 thiss!1141)))))

(declare-fun res!634857 () Bool)

(declare-fun e!531740 () Bool)

(assert (=> start!80580 (=> (not res!634857) (not e!531740))))

(declare-fun valid!1824 (LongMapFixedSize!4750) Bool)

(assert (=> start!80580 (= res!634857 (valid!1824 thiss!1141))))

(assert (=> start!80580 e!531740))

(assert (=> start!80580 e!531739))

(assert (=> start!80580 true))

(declare-fun b!945433 () Bool)

(declare-fun res!634855 () Bool)

(assert (=> b!945433 (=> res!634855 e!531738)))

(assert (=> b!945433 (= res!634855 (not (= (size!27961 (_keys!10576 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27365 thiss!1141)))))))

(declare-fun b!945434 () Bool)

(declare-fun res!634859 () Bool)

(assert (=> b!945434 (=> (not res!634859) (not e!531740))))

(declare-datatypes ((tuple2!13460 0))(
  ( (tuple2!13461 (_1!6741 (_ BitVec 64)) (_2!6741 V!32383)) )
))
(declare-datatypes ((List!19259 0))(
  ( (Nil!19256) (Cons!19255 (h!20412 tuple2!13460) (t!27568 List!19259)) )
))
(declare-datatypes ((ListLongMap!12159 0))(
  ( (ListLongMap!12160 (toList!6095 List!19259)) )
))
(declare-fun contains!5178 (ListLongMap!12159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3329 (array!57147 array!57145 (_ BitVec 32) (_ BitVec 32) V!32383 V!32383 (_ BitVec 32) Int) ListLongMap!12159)

(assert (=> b!945434 (= res!634859 (contains!5178 (getCurrentListMap!3329 (_keys!10576 thiss!1141) (_values!5693 thiss!1141) (mask!27365 thiss!1141) (extraKeys!5402 thiss!1141) (zeroValue!5506 thiss!1141) (minValue!5506 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5670 thiss!1141)) key!756))))

(declare-fun b!945435 () Bool)

(assert (=> b!945435 (= e!531740 (not e!531738))))

(declare-fun res!634852 () Bool)

(assert (=> b!945435 (=> res!634852 e!531738)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945435 (= res!634852 (not (validMask!0 (mask!27365 thiss!1141))))))

(declare-fun lt!426019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57147 (_ BitVec 32)) Bool)

(assert (=> b!945435 (arrayForallSeekEntryOrOpenFound!0 lt!426019 (_keys!10576 thiss!1141) (mask!27365 thiss!1141))))

(declare-datatypes ((Unit!31834 0))(
  ( (Unit!31835) )
))
(declare-fun lt!426022 () Unit!31834)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31834)

(assert (=> b!945435 (= lt!426022 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10576 thiss!1141) (mask!27365 thiss!1141) #b00000000000000000000000000000000 lt!426019))))

(declare-fun arrayScanForKey!0 (array!57147 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945435 (= lt!426019 (arrayScanForKey!0 (_keys!10576 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945435 (arrayContainsKey!0 (_keys!10576 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426020 () Unit!31834)

(declare-fun lemmaKeyInListMapIsInArray!308 (array!57147 array!57145 (_ BitVec 32) (_ BitVec 32) V!32383 V!32383 (_ BitVec 64) Int) Unit!31834)

(assert (=> b!945435 (= lt!426020 (lemmaKeyInListMapIsInArray!308 (_keys!10576 thiss!1141) (_values!5693 thiss!1141) (mask!27365 thiss!1141) (extraKeys!5402 thiss!1141) (zeroValue!5506 thiss!1141) (minValue!5506 thiss!1141) key!756 (defaultEntry!5670 thiss!1141)))))

(declare-fun b!945436 () Bool)

(declare-fun e!531736 () Bool)

(assert (=> b!945436 (= e!531736 tp_is_empty!20563)))

(declare-fun b!945437 () Bool)

(declare-fun res!634853 () Bool)

(assert (=> b!945437 (=> res!634853 e!531738)))

(assert (=> b!945437 (= res!634853 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10576 thiss!1141) (mask!27365 thiss!1141))))))

(declare-fun mapIsEmpty!32670 () Bool)

(assert (=> mapIsEmpty!32670 mapRes!32670))

(declare-fun b!945438 () Bool)

(assert (=> b!945438 (= e!531737 (and e!531736 mapRes!32670))))

(declare-fun condMapEmpty!32670 () Bool)

(declare-fun mapDefault!32670 () ValueCell!9800)

(assert (=> b!945438 (= condMapEmpty!32670 (= (arr!27493 (_values!5693 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9800)) mapDefault!32670)))))

(declare-fun b!945439 () Bool)

(declare-fun res!634854 () Bool)

(assert (=> b!945439 (=> (not res!634854) (not e!531740))))

(get-info :version)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57147 (_ BitVec 32)) SeekEntryResult!9030)

(assert (=> b!945439 (= res!634854 (not ((_ is Found!9030) (seekEntry!0 key!756 (_keys!10576 thiss!1141) (mask!27365 thiss!1141)))))))

(declare-fun b!945440 () Bool)

(declare-fun res!634858 () Bool)

(assert (=> b!945440 (=> (not res!634858) (not e!531740))))

(assert (=> b!945440 (= res!634858 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945441 () Bool)

(declare-fun res!634856 () Bool)

(assert (=> b!945441 (=> res!634856 e!531738)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!945441 (= res!634856 (not (validKeyInArray!0 key!756)))))

(assert (= (and start!80580 res!634857) b!945440))

(assert (= (and b!945440 res!634858) b!945439))

(assert (= (and b!945439 res!634854) b!945434))

(assert (= (and b!945434 res!634859) b!945435))

(assert (= (and b!945435 (not res!634852)) b!945433))

(assert (= (and b!945433 (not res!634855)) b!945437))

(assert (= (and b!945437 (not res!634853)) b!945441))

(assert (= (and b!945441 (not res!634856)) b!945432))

(assert (= (and b!945438 condMapEmpty!32670) mapIsEmpty!32670))

(assert (= (and b!945438 (not condMapEmpty!32670)) mapNonEmpty!32670))

(assert (= (and mapNonEmpty!32670 ((_ is ValueCellFull!9800) mapValue!32670)) b!945430))

(assert (= (and b!945438 ((_ is ValueCellFull!9800) mapDefault!32670)) b!945436))

(assert (= b!945431 b!945438))

(assert (= start!80580 b!945431))

(declare-fun m!879811 () Bool)

(assert (=> b!945439 m!879811))

(declare-fun m!879813 () Bool)

(assert (=> b!945435 m!879813))

(declare-fun m!879815 () Bool)

(assert (=> b!945435 m!879815))

(declare-fun m!879817 () Bool)

(assert (=> b!945435 m!879817))

(declare-fun m!879819 () Bool)

(assert (=> b!945435 m!879819))

(declare-fun m!879821 () Bool)

(assert (=> b!945435 m!879821))

(declare-fun m!879823 () Bool)

(assert (=> b!945435 m!879823))

(declare-fun m!879825 () Bool)

(assert (=> b!945431 m!879825))

(declare-fun m!879827 () Bool)

(assert (=> b!945431 m!879827))

(declare-fun m!879829 () Bool)

(assert (=> b!945437 m!879829))

(declare-fun m!879831 () Bool)

(assert (=> b!945432 m!879831))

(declare-fun m!879833 () Bool)

(assert (=> b!945441 m!879833))

(declare-fun m!879835 () Bool)

(assert (=> mapNonEmpty!32670 m!879835))

(declare-fun m!879837 () Bool)

(assert (=> b!945434 m!879837))

(assert (=> b!945434 m!879837))

(declare-fun m!879839 () Bool)

(assert (=> b!945434 m!879839))

(declare-fun m!879841 () Bool)

(assert (=> start!80580 m!879841))

(check-sat tp_is_empty!20563 (not mapNonEmpty!32670) (not b!945441) (not b!945435) (not b!945437) (not b_next!18055) (not b!945439) b_and!29483 (not start!80580) (not b!945432) (not b!945431) (not b!945434))
(check-sat b_and!29483 (not b_next!18055))
