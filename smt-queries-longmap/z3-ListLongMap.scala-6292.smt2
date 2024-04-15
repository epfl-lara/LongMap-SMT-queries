; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80412 () Bool)

(assert start!80412)

(declare-fun b!944616 () Bool)

(declare-fun b_free!18073 () Bool)

(declare-fun b_next!18073 () Bool)

(assert (=> b!944616 (= b_free!18073 (not b_next!18073))))

(declare-fun tp!62730 () Bool)

(declare-fun b_and!29465 () Bool)

(assert (=> b!944616 (= tp!62730 b_and!29465)))

(declare-fun b!944612 () Bool)

(declare-fun res!634615 () Bool)

(declare-fun e!531195 () Bool)

(assert (=> b!944612 (=> (not res!634615) (not e!531195))))

(declare-datatypes ((V!32407 0))(
  ( (V!32408 (val!10341 Int)) )
))
(declare-datatypes ((ValueCell!9809 0))(
  ( (ValueCellFull!9809 (v!12872 V!32407)) (EmptyCell!9809) )
))
(declare-datatypes ((array!57095 0))(
  ( (array!57096 (arr!27473 (Array (_ BitVec 32) ValueCell!9809)) (size!27941 (_ BitVec 32))) )
))
(declare-datatypes ((array!57097 0))(
  ( (array!57098 (arr!27474 (Array (_ BitVec 32) (_ BitVec 64))) (size!27942 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4768 0))(
  ( (LongMapFixedSize!4769 (defaultEntry!5679 Int) (mask!27330 (_ BitVec 32)) (extraKeys!5411 (_ BitVec 32)) (zeroValue!5515 V!32407) (minValue!5515 V!32407) (_size!2439 (_ BitVec 32)) (_keys!10552 array!57097) (_values!5702 array!57095) (_vacant!2439 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4768)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13544 0))(
  ( (tuple2!13545 (_1!6783 (_ BitVec 64)) (_2!6783 V!32407)) )
))
(declare-datatypes ((List!19287 0))(
  ( (Nil!19284) (Cons!19283 (h!20434 tuple2!13544) (t!27595 List!19287)) )
))
(declare-datatypes ((ListLongMap!12231 0))(
  ( (ListLongMap!12232 (toList!6131 List!19287)) )
))
(declare-fun contains!5146 (ListLongMap!12231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3294 (array!57097 array!57095 (_ BitVec 32) (_ BitVec 32) V!32407 V!32407 (_ BitVec 32) Int) ListLongMap!12231)

(assert (=> b!944612 (= res!634615 (contains!5146 (getCurrentListMap!3294 (_keys!10552 thiss!1141) (_values!5702 thiss!1141) (mask!27330 thiss!1141) (extraKeys!5411 thiss!1141) (zeroValue!5515 thiss!1141) (minValue!5515 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5679 thiss!1141)) key!756))))

(declare-fun b!944613 () Bool)

(declare-fun res!634617 () Bool)

(assert (=> b!944613 (=> (not res!634617) (not e!531195))))

(assert (=> b!944613 (= res!634617 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944614 () Bool)

(declare-fun res!634616 () Bool)

(declare-fun e!531196 () Bool)

(assert (=> b!944614 (=> res!634616 e!531196)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57097 (_ BitVec 32)) Bool)

(assert (=> b!944614 (= res!634616 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10552 thiss!1141) (mask!27330 thiss!1141))))))

(declare-fun b!944615 () Bool)

(declare-fun res!634620 () Bool)

(assert (=> b!944615 (=> res!634620 e!531196)))

(assert (=> b!944615 (= res!634620 (not (= (size!27942 (_keys!10552 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27330 thiss!1141)))))))

(declare-fun mapIsEmpty!32697 () Bool)

(declare-fun mapRes!32697 () Bool)

(assert (=> mapIsEmpty!32697 mapRes!32697))

(declare-fun e!531199 () Bool)

(declare-fun e!531200 () Bool)

(declare-fun tp_is_empty!20581 () Bool)

(declare-fun array_inv!21398 (array!57097) Bool)

(declare-fun array_inv!21399 (array!57095) Bool)

(assert (=> b!944616 (= e!531199 (and tp!62730 tp_is_empty!20581 (array_inv!21398 (_keys!10552 thiss!1141)) (array_inv!21399 (_values!5702 thiss!1141)) e!531200))))

(declare-fun b!944617 () Bool)

(declare-fun res!634621 () Bool)

(assert (=> b!944617 (=> (not res!634621) (not e!531195))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9074 0))(
  ( (MissingZero!9074 (index!38667 (_ BitVec 32))) (Found!9074 (index!38668 (_ BitVec 32))) (Intermediate!9074 (undefined!9886 Bool) (index!38669 (_ BitVec 32)) (x!81152 (_ BitVec 32))) (Undefined!9074) (MissingVacant!9074 (index!38670 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57097 (_ BitVec 32)) SeekEntryResult!9074)

(assert (=> b!944617 (= res!634621 (not ((_ is Found!9074) (seekEntry!0 key!756 (_keys!10552 thiss!1141) (mask!27330 thiss!1141)))))))

(declare-fun b!944618 () Bool)

(declare-fun res!634618 () Bool)

(assert (=> b!944618 (=> res!634618 e!531196)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944618 (= res!634618 (not (validKeyInArray!0 key!756)))))

(declare-fun res!634614 () Bool)

(assert (=> start!80412 (=> (not res!634614) (not e!531195))))

(declare-fun valid!1823 (LongMapFixedSize!4768) Bool)

(assert (=> start!80412 (= res!634614 (valid!1823 thiss!1141))))

(assert (=> start!80412 e!531195))

(assert (=> start!80412 e!531199))

(assert (=> start!80412 true))

(declare-fun b!944619 () Bool)

(assert (=> b!944619 (= e!531196 true)))

(declare-fun lt!425531 () SeekEntryResult!9074)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57097 (_ BitVec 32)) SeekEntryResult!9074)

(assert (=> b!944619 (= lt!425531 (seekEntryOrOpen!0 key!756 (_keys!10552 thiss!1141) (mask!27330 thiss!1141)))))

(declare-fun mapNonEmpty!32697 () Bool)

(declare-fun tp!62729 () Bool)

(declare-fun e!531201 () Bool)

(assert (=> mapNonEmpty!32697 (= mapRes!32697 (and tp!62729 e!531201))))

(declare-fun mapKey!32697 () (_ BitVec 32))

(declare-fun mapValue!32697 () ValueCell!9809)

(declare-fun mapRest!32697 () (Array (_ BitVec 32) ValueCell!9809))

(assert (=> mapNonEmpty!32697 (= (arr!27473 (_values!5702 thiss!1141)) (store mapRest!32697 mapKey!32697 mapValue!32697))))

(declare-fun b!944620 () Bool)

(declare-fun e!531198 () Bool)

(assert (=> b!944620 (= e!531198 tp_is_empty!20581)))

(declare-fun b!944621 () Bool)

(assert (=> b!944621 (= e!531201 tp_is_empty!20581)))

(declare-fun b!944622 () Bool)

(assert (=> b!944622 (= e!531200 (and e!531198 mapRes!32697))))

(declare-fun condMapEmpty!32697 () Bool)

(declare-fun mapDefault!32697 () ValueCell!9809)

(assert (=> b!944622 (= condMapEmpty!32697 (= (arr!27473 (_values!5702 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9809)) mapDefault!32697)))))

(declare-fun b!944623 () Bool)

(assert (=> b!944623 (= e!531195 (not e!531196))))

(declare-fun res!634619 () Bool)

(assert (=> b!944623 (=> res!634619 e!531196)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944623 (= res!634619 (not (validMask!0 (mask!27330 thiss!1141))))))

(declare-fun lt!425530 () (_ BitVec 32))

(assert (=> b!944623 (arrayForallSeekEntryOrOpenFound!0 lt!425530 (_keys!10552 thiss!1141) (mask!27330 thiss!1141))))

(declare-datatypes ((Unit!31743 0))(
  ( (Unit!31744) )
))
(declare-fun lt!425532 () Unit!31743)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31743)

(assert (=> b!944623 (= lt!425532 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10552 thiss!1141) (mask!27330 thiss!1141) #b00000000000000000000000000000000 lt!425530))))

(declare-fun arrayScanForKey!0 (array!57097 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944623 (= lt!425530 (arrayScanForKey!0 (_keys!10552 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944623 (arrayContainsKey!0 (_keys!10552 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425533 () Unit!31743)

(declare-fun lemmaKeyInListMapIsInArray!300 (array!57097 array!57095 (_ BitVec 32) (_ BitVec 32) V!32407 V!32407 (_ BitVec 64) Int) Unit!31743)

(assert (=> b!944623 (= lt!425533 (lemmaKeyInListMapIsInArray!300 (_keys!10552 thiss!1141) (_values!5702 thiss!1141) (mask!27330 thiss!1141) (extraKeys!5411 thiss!1141) (zeroValue!5515 thiss!1141) (minValue!5515 thiss!1141) key!756 (defaultEntry!5679 thiss!1141)))))

(assert (= (and start!80412 res!634614) b!944613))

(assert (= (and b!944613 res!634617) b!944617))

(assert (= (and b!944617 res!634621) b!944612))

(assert (= (and b!944612 res!634615) b!944623))

(assert (= (and b!944623 (not res!634619)) b!944615))

(assert (= (and b!944615 (not res!634620)) b!944614))

(assert (= (and b!944614 (not res!634616)) b!944618))

(assert (= (and b!944618 (not res!634618)) b!944619))

(assert (= (and b!944622 condMapEmpty!32697) mapIsEmpty!32697))

(assert (= (and b!944622 (not condMapEmpty!32697)) mapNonEmpty!32697))

(assert (= (and mapNonEmpty!32697 ((_ is ValueCellFull!9809) mapValue!32697)) b!944621))

(assert (= (and b!944622 ((_ is ValueCellFull!9809) mapDefault!32697)) b!944620))

(assert (= b!944616 b!944622))

(assert (= start!80412 b!944616))

(declare-fun m!878047 () Bool)

(assert (=> mapNonEmpty!32697 m!878047))

(declare-fun m!878049 () Bool)

(assert (=> b!944619 m!878049))

(declare-fun m!878051 () Bool)

(assert (=> start!80412 m!878051))

(declare-fun m!878053 () Bool)

(assert (=> b!944614 m!878053))

(declare-fun m!878055 () Bool)

(assert (=> b!944623 m!878055))

(declare-fun m!878057 () Bool)

(assert (=> b!944623 m!878057))

(declare-fun m!878059 () Bool)

(assert (=> b!944623 m!878059))

(declare-fun m!878061 () Bool)

(assert (=> b!944623 m!878061))

(declare-fun m!878063 () Bool)

(assert (=> b!944623 m!878063))

(declare-fun m!878065 () Bool)

(assert (=> b!944623 m!878065))

(declare-fun m!878067 () Bool)

(assert (=> b!944612 m!878067))

(assert (=> b!944612 m!878067))

(declare-fun m!878069 () Bool)

(assert (=> b!944612 m!878069))

(declare-fun m!878071 () Bool)

(assert (=> b!944617 m!878071))

(declare-fun m!878073 () Bool)

(assert (=> b!944616 m!878073))

(declare-fun m!878075 () Bool)

(assert (=> b!944616 m!878075))

(declare-fun m!878077 () Bool)

(assert (=> b!944618 m!878077))

(check-sat (not b!944619) (not b!944614) (not b!944618) (not b!944612) (not b!944616) (not b!944617) b_and!29465 (not b_next!18073) tp_is_empty!20581 (not start!80412) (not mapNonEmpty!32697) (not b!944623))
(check-sat b_and!29465 (not b_next!18073))
