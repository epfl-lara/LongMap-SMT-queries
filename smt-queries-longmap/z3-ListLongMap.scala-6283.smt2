; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80544 () Bool)

(assert start!80544)

(declare-fun b!944873 () Bool)

(declare-fun b_free!18019 () Bool)

(declare-fun b_next!18019 () Bool)

(assert (=> b!944873 (= b_free!18019 (not b_next!18019))))

(declare-fun tp!62567 () Bool)

(declare-fun b_and!29447 () Bool)

(assert (=> b!944873 (= tp!62567 b_and!29447)))

(declare-fun b!944868 () Bool)

(declare-fun res!634510 () Bool)

(declare-fun e!531364 () Bool)

(assert (=> b!944868 (=> (not res!634510) (not e!531364))))

(declare-datatypes ((V!32335 0))(
  ( (V!32336 (val!10314 Int)) )
))
(declare-datatypes ((ValueCell!9782 0))(
  ( (ValueCellFull!9782 (v!12843 V!32335)) (EmptyCell!9782) )
))
(declare-datatypes ((array!57073 0))(
  ( (array!57074 (arr!27457 (Array (_ BitVec 32) ValueCell!9782)) (size!27924 (_ BitVec 32))) )
))
(declare-datatypes ((array!57075 0))(
  ( (array!57076 (arr!27458 (Array (_ BitVec 32) (_ BitVec 64))) (size!27925 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4714 0))(
  ( (LongMapFixedSize!4715 (defaultEntry!5652 Int) (mask!27335 (_ BitVec 32)) (extraKeys!5384 (_ BitVec 32)) (zeroValue!5488 V!32335) (minValue!5488 V!32335) (_size!2412 (_ BitVec 32)) (_keys!10558 array!57075) (_values!5675 array!57073) (_vacant!2412 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4714)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13440 0))(
  ( (tuple2!13441 (_1!6731 (_ BitVec 64)) (_2!6731 V!32335)) )
))
(declare-datatypes ((List!19249 0))(
  ( (Nil!19246) (Cons!19245 (h!20402 tuple2!13440) (t!27558 List!19249)) )
))
(declare-datatypes ((ListLongMap!12139 0))(
  ( (ListLongMap!12140 (toList!6085 List!19249)) )
))
(declare-fun contains!5168 (ListLongMap!12139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3319 (array!57075 array!57073 (_ BitVec 32) (_ BitVec 32) V!32335 V!32335 (_ BitVec 32) Int) ListLongMap!12139)

(assert (=> b!944868 (= res!634510 (contains!5168 (getCurrentListMap!3319 (_keys!10558 thiss!1141) (_values!5675 thiss!1141) (mask!27335 thiss!1141) (extraKeys!5384 thiss!1141) (zeroValue!5488 thiss!1141) (minValue!5488 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5652 thiss!1141)) key!756))))

(declare-fun b!944869 () Bool)

(declare-fun e!531359 () Bool)

(declare-fun tp_is_empty!20527 () Bool)

(assert (=> b!944869 (= e!531359 tp_is_empty!20527)))

(declare-fun b!944870 () Bool)

(declare-fun e!531363 () Bool)

(declare-fun mapRes!32616 () Bool)

(assert (=> b!944870 (= e!531363 (and e!531359 mapRes!32616))))

(declare-fun condMapEmpty!32616 () Bool)

(declare-fun mapDefault!32616 () ValueCell!9782)

(assert (=> b!944870 (= condMapEmpty!32616 (= (arr!27457 (_values!5675 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9782)) mapDefault!32616)))))

(declare-fun b!944871 () Bool)

(declare-fun e!531358 () Bool)

(assert (=> b!944871 (= e!531358 tp_is_empty!20527)))

(declare-fun res!634509 () Bool)

(assert (=> start!80544 (=> (not res!634509) (not e!531364))))

(declare-fun valid!1811 (LongMapFixedSize!4714) Bool)

(assert (=> start!80544 (= res!634509 (valid!1811 thiss!1141))))

(assert (=> start!80544 e!531364))

(declare-fun e!531362 () Bool)

(assert (=> start!80544 e!531362))

(assert (=> start!80544 true))

(declare-fun b!944872 () Bool)

(declare-fun e!531361 () Bool)

(assert (=> b!944872 (= e!531364 (not e!531361))))

(declare-fun res!634511 () Bool)

(assert (=> b!944872 (=> res!634511 e!531361)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944872 (= res!634511 (not (validMask!0 (mask!27335 thiss!1141))))))

(declare-fun lt!425848 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57075 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944872 (= lt!425848 (arrayScanForKey!0 (_keys!10558 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944872 (arrayContainsKey!0 (_keys!10558 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31804 0))(
  ( (Unit!31805) )
))
(declare-fun lt!425846 () Unit!31804)

(declare-fun lemmaKeyInListMapIsInArray!293 (array!57075 array!57073 (_ BitVec 32) (_ BitVec 32) V!32335 V!32335 (_ BitVec 64) Int) Unit!31804)

(assert (=> b!944872 (= lt!425846 (lemmaKeyInListMapIsInArray!293 (_keys!10558 thiss!1141) (_values!5675 thiss!1141) (mask!27335 thiss!1141) (extraKeys!5384 thiss!1141) (zeroValue!5488 thiss!1141) (minValue!5488 thiss!1141) key!756 (defaultEntry!5652 thiss!1141)))))

(declare-fun mapIsEmpty!32616 () Bool)

(assert (=> mapIsEmpty!32616 mapRes!32616))

(declare-fun mapNonEmpty!32616 () Bool)

(declare-fun tp!62568 () Bool)

(assert (=> mapNonEmpty!32616 (= mapRes!32616 (and tp!62568 e!531358))))

(declare-fun mapValue!32616 () ValueCell!9782)

(declare-fun mapRest!32616 () (Array (_ BitVec 32) ValueCell!9782))

(declare-fun mapKey!32616 () (_ BitVec 32))

(assert (=> mapNonEmpty!32616 (= (arr!27457 (_values!5675 thiss!1141)) (store mapRest!32616 mapKey!32616 mapValue!32616))))

(declare-fun array_inv!21418 (array!57075) Bool)

(declare-fun array_inv!21419 (array!57073) Bool)

(assert (=> b!944873 (= e!531362 (and tp!62567 tp_is_empty!20527 (array_inv!21418 (_keys!10558 thiss!1141)) (array_inv!21419 (_values!5675 thiss!1141)) e!531363))))

(declare-fun b!944874 () Bool)

(declare-fun res!634508 () Bool)

(assert (=> b!944874 (=> (not res!634508) (not e!531364))))

(assert (=> b!944874 (= res!634508 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944875 () Bool)

(assert (=> b!944875 (= e!531361 true)))

(declare-fun lt!425847 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57075 (_ BitVec 32)) Bool)

(assert (=> b!944875 (= lt!425847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10558 thiss!1141) (mask!27335 thiss!1141)))))

(declare-fun b!944876 () Bool)

(declare-fun res!634507 () Bool)

(assert (=> b!944876 (=> res!634507 e!531361)))

(assert (=> b!944876 (= res!634507 (or (not (= (size!27925 (_keys!10558 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27335 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27925 (_keys!10558 thiss!1141))) (bvslt lt!425848 #b00000000000000000000000000000000) (bvsgt lt!425848 (size!27925 (_keys!10558 thiss!1141)))))))

(declare-fun b!944877 () Bool)

(declare-fun res!634506 () Bool)

(assert (=> b!944877 (=> (not res!634506) (not e!531364))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9017 0))(
  ( (MissingZero!9017 (index!38439 (_ BitVec 32))) (Found!9017 (index!38440 (_ BitVec 32))) (Intermediate!9017 (undefined!9829 Bool) (index!38441 (_ BitVec 32)) (x!81042 (_ BitVec 32))) (Undefined!9017) (MissingVacant!9017 (index!38442 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57075 (_ BitVec 32)) SeekEntryResult!9017)

(assert (=> b!944877 (= res!634506 (not ((_ is Found!9017) (seekEntry!0 key!756 (_keys!10558 thiss!1141) (mask!27335 thiss!1141)))))))

(assert (= (and start!80544 res!634509) b!944874))

(assert (= (and b!944874 res!634508) b!944877))

(assert (= (and b!944877 res!634506) b!944868))

(assert (= (and b!944868 res!634510) b!944872))

(assert (= (and b!944872 (not res!634511)) b!944876))

(assert (= (and b!944876 (not res!634507)) b!944875))

(assert (= (and b!944870 condMapEmpty!32616) mapIsEmpty!32616))

(assert (= (and b!944870 (not condMapEmpty!32616)) mapNonEmpty!32616))

(assert (= (and mapNonEmpty!32616 ((_ is ValueCellFull!9782) mapValue!32616)) b!944871))

(assert (= (and b!944870 ((_ is ValueCellFull!9782) mapDefault!32616)) b!944869))

(assert (= b!944873 b!944870))

(assert (= start!80544 b!944873))

(declare-fun m!879355 () Bool)

(assert (=> b!944872 m!879355))

(declare-fun m!879357 () Bool)

(assert (=> b!944872 m!879357))

(declare-fun m!879359 () Bool)

(assert (=> b!944872 m!879359))

(declare-fun m!879361 () Bool)

(assert (=> b!944872 m!879361))

(declare-fun m!879363 () Bool)

(assert (=> b!944873 m!879363))

(declare-fun m!879365 () Bool)

(assert (=> b!944873 m!879365))

(declare-fun m!879367 () Bool)

(assert (=> b!944875 m!879367))

(declare-fun m!879369 () Bool)

(assert (=> mapNonEmpty!32616 m!879369))

(declare-fun m!879371 () Bool)

(assert (=> b!944868 m!879371))

(assert (=> b!944868 m!879371))

(declare-fun m!879373 () Bool)

(assert (=> b!944868 m!879373))

(declare-fun m!879375 () Bool)

(assert (=> start!80544 m!879375))

(declare-fun m!879377 () Bool)

(assert (=> b!944877 m!879377))

(check-sat (not start!80544) (not b_next!18019) (not b!944875) (not mapNonEmpty!32616) (not b!944873) (not b!944872) b_and!29447 (not b!944877) (not b!944868) tp_is_empty!20527)
(check-sat b_and!29447 (not b_next!18019))
