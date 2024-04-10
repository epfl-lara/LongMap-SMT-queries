; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80430 () Bool)

(assert start!80430)

(declare-fun b!944857 () Bool)

(declare-fun b_free!18073 () Bool)

(declare-fun b_next!18073 () Bool)

(assert (=> b!944857 (= b_free!18073 (not b_next!18073))))

(declare-fun tp!62729 () Bool)

(declare-fun b_and!29491 () Bool)

(assert (=> b!944857 (= tp!62729 b_and!29491)))

(declare-fun b!944851 () Bool)

(declare-fun e!531344 () Bool)

(declare-fun e!531347 () Bool)

(assert (=> b!944851 (= e!531344 (not e!531347))))

(declare-fun res!634730 () Bool)

(assert (=> b!944851 (=> res!634730 e!531347)))

(declare-datatypes ((V!32407 0))(
  ( (V!32408 (val!10341 Int)) )
))
(declare-datatypes ((ValueCell!9809 0))(
  ( (ValueCellFull!9809 (v!12873 V!32407)) (EmptyCell!9809) )
))
(declare-datatypes ((array!57130 0))(
  ( (array!57131 (arr!27490 (Array (_ BitVec 32) ValueCell!9809)) (size!27956 (_ BitVec 32))) )
))
(declare-datatypes ((array!57132 0))(
  ( (array!57133 (arr!27491 (Array (_ BitVec 32) (_ BitVec 64))) (size!27957 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4768 0))(
  ( (LongMapFixedSize!4769 (defaultEntry!5679 Int) (mask!27337 (_ BitVec 32)) (extraKeys!5411 (_ BitVec 32)) (zeroValue!5515 V!32407) (minValue!5515 V!32407) (_size!2439 (_ BitVec 32)) (_keys!10557 array!57132) (_values!5702 array!57130) (_vacant!2439 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4768)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944851 (= res!634730 (not (validMask!0 (mask!27337 thiss!1141))))))

(declare-fun lt!425769 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57132 (_ BitVec 32)) Bool)

(assert (=> b!944851 (arrayForallSeekEntryOrOpenFound!0 lt!425769 (_keys!10557 thiss!1141) (mask!27337 thiss!1141))))

(declare-datatypes ((Unit!31870 0))(
  ( (Unit!31871) )
))
(declare-fun lt!425766 () Unit!31870)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31870)

(assert (=> b!944851 (= lt!425766 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10557 thiss!1141) (mask!27337 thiss!1141) #b00000000000000000000000000000000 lt!425769))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57132 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944851 (= lt!425769 (arrayScanForKey!0 (_keys!10557 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944851 (arrayContainsKey!0 (_keys!10557 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425767 () Unit!31870)

(declare-fun lemmaKeyInListMapIsInArray!315 (array!57132 array!57130 (_ BitVec 32) (_ BitVec 32) V!32407 V!32407 (_ BitVec 64) Int) Unit!31870)

(assert (=> b!944851 (= lt!425767 (lemmaKeyInListMapIsInArray!315 (_keys!10557 thiss!1141) (_values!5702 thiss!1141) (mask!27337 thiss!1141) (extraKeys!5411 thiss!1141) (zeroValue!5515 thiss!1141) (minValue!5515 thiss!1141) key!756 (defaultEntry!5679 thiss!1141)))))

(declare-fun b!944852 () Bool)

(declare-fun res!634725 () Bool)

(assert (=> b!944852 (=> (not res!634725) (not e!531344))))

(declare-datatypes ((SeekEntryResult!9078 0))(
  ( (MissingZero!9078 (index!38683 (_ BitVec 32))) (Found!9078 (index!38684 (_ BitVec 32))) (Intermediate!9078 (undefined!9890 Bool) (index!38685 (_ BitVec 32)) (x!81161 (_ BitVec 32))) (Undefined!9078) (MissingVacant!9078 (index!38686 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57132 (_ BitVec 32)) SeekEntryResult!9078)

(assert (=> b!944852 (= res!634725 (not (is-Found!9078 (seekEntry!0 key!756 (_keys!10557 thiss!1141) (mask!27337 thiss!1141)))))))

(declare-fun b!944853 () Bool)

(declare-fun res!634726 () Bool)

(assert (=> b!944853 (=> (not res!634726) (not e!531344))))

(declare-datatypes ((tuple2!13498 0))(
  ( (tuple2!13499 (_1!6760 (_ BitVec 64)) (_2!6760 V!32407)) )
))
(declare-datatypes ((List!19283 0))(
  ( (Nil!19280) (Cons!19279 (h!20430 tuple2!13498) (t!27600 List!19283)) )
))
(declare-datatypes ((ListLongMap!12195 0))(
  ( (ListLongMap!12196 (toList!6113 List!19283)) )
))
(declare-fun contains!5185 (ListLongMap!12195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3347 (array!57132 array!57130 (_ BitVec 32) (_ BitVec 32) V!32407 V!32407 (_ BitVec 32) Int) ListLongMap!12195)

(assert (=> b!944853 (= res!634726 (contains!5185 (getCurrentListMap!3347 (_keys!10557 thiss!1141) (_values!5702 thiss!1141) (mask!27337 thiss!1141) (extraKeys!5411 thiss!1141) (zeroValue!5515 thiss!1141) (minValue!5515 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5679 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32697 () Bool)

(declare-fun mapRes!32697 () Bool)

(declare-fun tp!62728 () Bool)

(declare-fun e!531346 () Bool)

(assert (=> mapNonEmpty!32697 (= mapRes!32697 (and tp!62728 e!531346))))

(declare-fun mapValue!32697 () ValueCell!9809)

(declare-fun mapRest!32697 () (Array (_ BitVec 32) ValueCell!9809))

(declare-fun mapKey!32697 () (_ BitVec 32))

(assert (=> mapNonEmpty!32697 (= (arr!27490 (_values!5702 thiss!1141)) (store mapRest!32697 mapKey!32697 mapValue!32697))))

(declare-fun b!944854 () Bool)

(declare-fun res!634731 () Bool)

(assert (=> b!944854 (=> (not res!634731) (not e!531344))))

(assert (=> b!944854 (= res!634731 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944855 () Bool)

(declare-fun res!634727 () Bool)

(assert (=> b!944855 (=> res!634727 e!531347)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944855 (= res!634727 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944856 () Bool)

(assert (=> b!944856 (= e!531347 true)))

(declare-fun lt!425768 () SeekEntryResult!9078)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57132 (_ BitVec 32)) SeekEntryResult!9078)

(assert (=> b!944856 (= lt!425768 (seekEntryOrOpen!0 key!756 (_keys!10557 thiss!1141) (mask!27337 thiss!1141)))))

(declare-fun res!634724 () Bool)

(assert (=> start!80430 (=> (not res!634724) (not e!531344))))

(declare-fun valid!1823 (LongMapFixedSize!4768) Bool)

(assert (=> start!80430 (= res!634724 (valid!1823 thiss!1141))))

(assert (=> start!80430 e!531344))

(declare-fun e!531343 () Bool)

(assert (=> start!80430 e!531343))

(assert (=> start!80430 true))

(declare-fun mapIsEmpty!32697 () Bool)

(assert (=> mapIsEmpty!32697 mapRes!32697))

(declare-fun tp_is_empty!20581 () Bool)

(declare-fun e!531345 () Bool)

(declare-fun array_inv!21360 (array!57132) Bool)

(declare-fun array_inv!21361 (array!57130) Bool)

(assert (=> b!944857 (= e!531343 (and tp!62729 tp_is_empty!20581 (array_inv!21360 (_keys!10557 thiss!1141)) (array_inv!21361 (_values!5702 thiss!1141)) e!531345))))

(declare-fun b!944858 () Bool)

(declare-fun res!634728 () Bool)

(assert (=> b!944858 (=> res!634728 e!531347)))

(assert (=> b!944858 (= res!634728 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10557 thiss!1141) (mask!27337 thiss!1141))))))

(declare-fun b!944859 () Bool)

(declare-fun res!634729 () Bool)

(assert (=> b!944859 (=> res!634729 e!531347)))

(assert (=> b!944859 (= res!634729 (not (= (size!27957 (_keys!10557 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27337 thiss!1141)))))))

(declare-fun b!944860 () Bool)

(assert (=> b!944860 (= e!531346 tp_is_empty!20581)))

(declare-fun b!944861 () Bool)

(declare-fun e!531349 () Bool)

(assert (=> b!944861 (= e!531345 (and e!531349 mapRes!32697))))

(declare-fun condMapEmpty!32697 () Bool)

(declare-fun mapDefault!32697 () ValueCell!9809)

