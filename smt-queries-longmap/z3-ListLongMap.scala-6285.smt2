; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80370 () Bool)

(assert start!80370)

(declare-fun b!943909 () Bool)

(declare-fun b_free!18031 () Bool)

(declare-fun b_next!18031 () Bool)

(assert (=> b!943909 (= b_free!18031 (not b_next!18031))))

(declare-fun tp!62604 () Bool)

(declare-fun b_and!29423 () Bool)

(assert (=> b!943909 (= tp!62604 b_and!29423)))

(declare-fun mapNonEmpty!32634 () Bool)

(declare-fun mapRes!32634 () Bool)

(declare-fun tp!62603 () Bool)

(declare-fun e!530757 () Bool)

(assert (=> mapNonEmpty!32634 (= mapRes!32634 (and tp!62603 e!530757))))

(declare-datatypes ((V!32351 0))(
  ( (V!32352 (val!10320 Int)) )
))
(declare-datatypes ((ValueCell!9788 0))(
  ( (ValueCellFull!9788 (v!12851 V!32351)) (EmptyCell!9788) )
))
(declare-fun mapValue!32634 () ValueCell!9788)

(declare-fun mapKey!32634 () (_ BitVec 32))

(declare-fun mapRest!32634 () (Array (_ BitVec 32) ValueCell!9788))

(declare-datatypes ((array!57011 0))(
  ( (array!57012 (arr!27431 (Array (_ BitVec 32) ValueCell!9788)) (size!27899 (_ BitVec 32))) )
))
(declare-datatypes ((array!57013 0))(
  ( (array!57014 (arr!27432 (Array (_ BitVec 32) (_ BitVec 64))) (size!27900 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4726 0))(
  ( (LongMapFixedSize!4727 (defaultEntry!5658 Int) (mask!27295 (_ BitVec 32)) (extraKeys!5390 (_ BitVec 32)) (zeroValue!5494 V!32351) (minValue!5494 V!32351) (_size!2418 (_ BitVec 32)) (_keys!10531 array!57013) (_values!5681 array!57011) (_vacant!2418 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4726)

(assert (=> mapNonEmpty!32634 (= (arr!27431 (_values!5681 thiss!1141)) (store mapRest!32634 mapKey!32634 mapValue!32634))))

(declare-fun b!943906 () Bool)

(declare-fun res!634163 () Bool)

(declare-fun e!530759 () Bool)

(assert (=> b!943906 (=> (not res!634163) (not e!530759))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13512 0))(
  ( (tuple2!13513 (_1!6767 (_ BitVec 64)) (_2!6767 V!32351)) )
))
(declare-datatypes ((List!19271 0))(
  ( (Nil!19268) (Cons!19267 (h!20418 tuple2!13512) (t!27579 List!19271)) )
))
(declare-datatypes ((ListLongMap!12199 0))(
  ( (ListLongMap!12200 (toList!6115 List!19271)) )
))
(declare-fun contains!5130 (ListLongMap!12199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3278 (array!57013 array!57011 (_ BitVec 32) (_ BitVec 32) V!32351 V!32351 (_ BitVec 32) Int) ListLongMap!12199)

(assert (=> b!943906 (= res!634163 (contains!5130 (getCurrentListMap!3278 (_keys!10531 thiss!1141) (_values!5681 thiss!1141) (mask!27295 thiss!1141) (extraKeys!5390 thiss!1141) (zeroValue!5494 thiss!1141) (minValue!5494 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5658 thiss!1141)) key!756))))

(declare-fun b!943907 () Bool)

(declare-fun e!530754 () Bool)

(assert (=> b!943907 (= e!530759 (not e!530754))))

(declare-fun res!634161 () Bool)

(assert (=> b!943907 (=> res!634161 e!530754)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943907 (= res!634161 (not (validMask!0 (mask!27295 thiss!1141))))))

(declare-fun lt!425303 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57013 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!943907 (= lt!425303 (arrayScanForKey!0 (_keys!10531 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943907 (arrayContainsKey!0 (_keys!10531 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31717 0))(
  ( (Unit!31718) )
))
(declare-fun lt!425304 () Unit!31717)

(declare-fun lemmaKeyInListMapIsInArray!287 (array!57013 array!57011 (_ BitVec 32) (_ BitVec 32) V!32351 V!32351 (_ BitVec 64) Int) Unit!31717)

(assert (=> b!943907 (= lt!425304 (lemmaKeyInListMapIsInArray!287 (_keys!10531 thiss!1141) (_values!5681 thiss!1141) (mask!27295 thiss!1141) (extraKeys!5390 thiss!1141) (zeroValue!5494 thiss!1141) (minValue!5494 thiss!1141) key!756 (defaultEntry!5658 thiss!1141)))))

(declare-fun b!943908 () Bool)

(assert (=> b!943908 (= e!530754 true)))

(declare-fun lt!425305 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57013 (_ BitVec 32)) Bool)

(assert (=> b!943908 (= lt!425305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10531 thiss!1141) (mask!27295 thiss!1141)))))

(declare-fun e!530756 () Bool)

(declare-fun tp_is_empty!20539 () Bool)

(declare-fun e!530758 () Bool)

(declare-fun array_inv!21370 (array!57013) Bool)

(declare-fun array_inv!21371 (array!57011) Bool)

(assert (=> b!943909 (= e!530756 (and tp!62604 tp_is_empty!20539 (array_inv!21370 (_keys!10531 thiss!1141)) (array_inv!21371 (_values!5681 thiss!1141)) e!530758))))

(declare-fun b!943910 () Bool)

(declare-fun e!530755 () Bool)

(assert (=> b!943910 (= e!530758 (and e!530755 mapRes!32634))))

(declare-fun condMapEmpty!32634 () Bool)

(declare-fun mapDefault!32634 () ValueCell!9788)

(assert (=> b!943910 (= condMapEmpty!32634 (= (arr!27431 (_values!5681 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9788)) mapDefault!32634)))))

(declare-fun res!634165 () Bool)

(assert (=> start!80370 (=> (not res!634165) (not e!530759))))

(declare-fun valid!1810 (LongMapFixedSize!4726) Bool)

(assert (=> start!80370 (= res!634165 (valid!1810 thiss!1141))))

(assert (=> start!80370 e!530759))

(assert (=> start!80370 e!530756))

(assert (=> start!80370 true))

(declare-fun b!943911 () Bool)

(assert (=> b!943911 (= e!530755 tp_is_empty!20539)))

(declare-fun b!943912 () Bool)

(declare-fun res!634164 () Bool)

(assert (=> b!943912 (=> (not res!634164) (not e!530759))))

(assert (=> b!943912 (= res!634164 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943913 () Bool)

(declare-fun res!634160 () Bool)

(assert (=> b!943913 (=> (not res!634160) (not e!530759))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9059 0))(
  ( (MissingZero!9059 (index!38607 (_ BitVec 32))) (Found!9059 (index!38608 (_ BitVec 32))) (Intermediate!9059 (undefined!9871 Bool) (index!38609 (_ BitVec 32)) (x!81081 (_ BitVec 32))) (Undefined!9059) (MissingVacant!9059 (index!38610 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57013 (_ BitVec 32)) SeekEntryResult!9059)

(assert (=> b!943913 (= res!634160 (not ((_ is Found!9059) (seekEntry!0 key!756 (_keys!10531 thiss!1141) (mask!27295 thiss!1141)))))))

(declare-fun b!943914 () Bool)

(declare-fun res!634162 () Bool)

(assert (=> b!943914 (=> res!634162 e!530754)))

(assert (=> b!943914 (= res!634162 (or (not (= (size!27900 (_keys!10531 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27295 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27900 (_keys!10531 thiss!1141))) (bvslt lt!425303 #b00000000000000000000000000000000) (bvsgt lt!425303 (size!27900 (_keys!10531 thiss!1141)))))))

(declare-fun mapIsEmpty!32634 () Bool)

(assert (=> mapIsEmpty!32634 mapRes!32634))

(declare-fun b!943915 () Bool)

(assert (=> b!943915 (= e!530757 tp_is_empty!20539)))

(assert (= (and start!80370 res!634165) b!943912))

(assert (= (and b!943912 res!634164) b!943913))

(assert (= (and b!943913 res!634160) b!943906))

(assert (= (and b!943906 res!634163) b!943907))

(assert (= (and b!943907 (not res!634161)) b!943914))

(assert (= (and b!943914 (not res!634162)) b!943908))

(assert (= (and b!943910 condMapEmpty!32634) mapIsEmpty!32634))

(assert (= (and b!943910 (not condMapEmpty!32634)) mapNonEmpty!32634))

(assert (= (and mapNonEmpty!32634 ((_ is ValueCellFull!9788) mapValue!32634)) b!943915))

(assert (= (and b!943910 ((_ is ValueCellFull!9788) mapDefault!32634)) b!943911))

(assert (= b!943909 b!943910))

(assert (= start!80370 b!943909))

(declare-fun m!877447 () Bool)

(assert (=> mapNonEmpty!32634 m!877447))

(declare-fun m!877449 () Bool)

(assert (=> b!943908 m!877449))

(declare-fun m!877451 () Bool)

(assert (=> b!943913 m!877451))

(declare-fun m!877453 () Bool)

(assert (=> start!80370 m!877453))

(declare-fun m!877455 () Bool)

(assert (=> b!943907 m!877455))

(declare-fun m!877457 () Bool)

(assert (=> b!943907 m!877457))

(declare-fun m!877459 () Bool)

(assert (=> b!943907 m!877459))

(declare-fun m!877461 () Bool)

(assert (=> b!943907 m!877461))

(declare-fun m!877463 () Bool)

(assert (=> b!943906 m!877463))

(assert (=> b!943906 m!877463))

(declare-fun m!877465 () Bool)

(assert (=> b!943906 m!877465))

(declare-fun m!877467 () Bool)

(assert (=> b!943909 m!877467))

(declare-fun m!877469 () Bool)

(assert (=> b!943909 m!877469))

(check-sat (not b!943907) (not b_next!18031) b_and!29423 (not b!943908) (not start!80370) (not mapNonEmpty!32634) (not b!943909) (not b!943906) (not b!943913) tp_is_empty!20539)
(check-sat b_and!29423 (not b_next!18031))
