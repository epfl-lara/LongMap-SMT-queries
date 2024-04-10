; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81156 () Bool)

(assert start!81156)

(declare-fun b!949782 () Bool)

(declare-fun b_free!18225 () Bool)

(declare-fun b_next!18225 () Bool)

(assert (=> b!949782 (= b_free!18225 (not b_next!18225))))

(declare-fun tp!63265 () Bool)

(declare-fun b_and!29677 () Bool)

(assert (=> b!949782 (= tp!63265 b_and!29677)))

(declare-fun mapNonEmpty!33005 () Bool)

(declare-fun mapRes!33005 () Bool)

(declare-fun tp!63264 () Bool)

(declare-fun e!534713 () Bool)

(assert (=> mapNonEmpty!33005 (= mapRes!33005 (and tp!63264 e!534713))))

(declare-datatypes ((V!32609 0))(
  ( (V!32610 (val!10417 Int)) )
))
(declare-datatypes ((ValueCell!9885 0))(
  ( (ValueCellFull!9885 (v!12958 V!32609)) (EmptyCell!9885) )
))
(declare-fun mapValue!33005 () ValueCell!9885)

(declare-datatypes ((array!57480 0))(
  ( (array!57481 (arr!27642 (Array (_ BitVec 32) ValueCell!9885)) (size!28119 (_ BitVec 32))) )
))
(declare-datatypes ((array!57482 0))(
  ( (array!57483 (arr!27643 (Array (_ BitVec 32) (_ BitVec 64))) (size!28120 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4920 0))(
  ( (LongMapFixedSize!4921 (defaultEntry!5769 Int) (mask!27557 (_ BitVec 32)) (extraKeys!5501 (_ BitVec 32)) (zeroValue!5605 V!32609) (minValue!5605 V!32609) (_size!2515 (_ BitVec 32)) (_keys!10701 array!57482) (_values!5792 array!57480) (_vacant!2515 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4920)

(declare-fun mapRest!33005 () (Array (_ BitVec 32) ValueCell!9885))

(declare-fun mapKey!33005 () (_ BitVec 32))

(assert (=> mapNonEmpty!33005 (= (arr!27642 (_values!5792 thiss!1141)) (store mapRest!33005 mapKey!33005 mapValue!33005))))

(declare-fun b!949776 () Bool)

(declare-fun e!534716 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57482 (_ BitVec 32)) Bool)

(assert (=> b!949776 (= e!534716 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10701 thiss!1141) (mask!27557 thiss!1141))))))

(declare-fun b!949777 () Bool)

(declare-fun res!636884 () Bool)

(assert (=> b!949777 (=> (not res!636884) (not e!534716))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!949777 (= res!636884 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949778 () Bool)

(declare-fun e!534715 () Bool)

(declare-fun e!534714 () Bool)

(assert (=> b!949778 (= e!534715 (and e!534714 mapRes!33005))))

(declare-fun condMapEmpty!33005 () Bool)

(declare-fun mapDefault!33005 () ValueCell!9885)

(assert (=> b!949778 (= condMapEmpty!33005 (= (arr!27642 (_values!5792 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9885)) mapDefault!33005)))))

(declare-fun b!949780 () Bool)

(declare-fun res!636886 () Bool)

(assert (=> b!949780 (=> (not res!636886) (not e!534716))))

(assert (=> b!949780 (= res!636886 (and (= (size!28119 (_values!5792 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27557 thiss!1141))) (= (size!28120 (_keys!10701 thiss!1141)) (size!28119 (_values!5792 thiss!1141))) (bvsge (mask!27557 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5501 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5501 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!949781 () Bool)

(declare-fun tp_is_empty!20733 () Bool)

(assert (=> b!949781 (= e!534713 tp_is_empty!20733)))

(declare-fun e!534717 () Bool)

(declare-fun array_inv!21456 (array!57482) Bool)

(declare-fun array_inv!21457 (array!57480) Bool)

(assert (=> b!949782 (= e!534717 (and tp!63265 tp_is_empty!20733 (array_inv!21456 (_keys!10701 thiss!1141)) (array_inv!21457 (_values!5792 thiss!1141)) e!534715))))

(declare-fun b!949783 () Bool)

(declare-fun res!636885 () Bool)

(assert (=> b!949783 (=> (not res!636885) (not e!534716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949783 (= res!636885 (validMask!0 (mask!27557 thiss!1141)))))

(declare-fun b!949784 () Bool)

(assert (=> b!949784 (= e!534714 tp_is_empty!20733)))

(declare-fun b!949785 () Bool)

(declare-fun res!636887 () Bool)

(assert (=> b!949785 (=> (not res!636887) (not e!534716))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9134 0))(
  ( (MissingZero!9134 (index!38907 (_ BitVec 32))) (Found!9134 (index!38908 (_ BitVec 32))) (Intermediate!9134 (undefined!9946 Bool) (index!38909 (_ BitVec 32)) (x!81708 (_ BitVec 32))) (Undefined!9134) (MissingVacant!9134 (index!38910 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57482 (_ BitVec 32)) SeekEntryResult!9134)

(assert (=> b!949785 (= res!636887 (not ((_ is Found!9134) (seekEntry!0 key!756 (_keys!10701 thiss!1141) (mask!27557 thiss!1141)))))))

(declare-fun mapIsEmpty!33005 () Bool)

(assert (=> mapIsEmpty!33005 mapRes!33005))

(declare-fun b!949779 () Bool)

(declare-fun res!636888 () Bool)

(assert (=> b!949779 (=> (not res!636888) (not e!534716))))

(declare-datatypes ((tuple2!13538 0))(
  ( (tuple2!13539 (_1!6780 (_ BitVec 64)) (_2!6780 V!32609)) )
))
(declare-datatypes ((List!19329 0))(
  ( (Nil!19326) (Cons!19325 (h!20485 tuple2!13538) (t!27664 List!19329)) )
))
(declare-datatypes ((ListLongMap!12235 0))(
  ( (ListLongMap!12236 (toList!6133 List!19329)) )
))
(declare-fun contains!5223 (ListLongMap!12235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3366 (array!57482 array!57480 (_ BitVec 32) (_ BitVec 32) V!32609 V!32609 (_ BitVec 32) Int) ListLongMap!12235)

(assert (=> b!949779 (= res!636888 (contains!5223 (getCurrentListMap!3366 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141)) key!756))))

(declare-fun res!636889 () Bool)

(assert (=> start!81156 (=> (not res!636889) (not e!534716))))

(declare-fun valid!1873 (LongMapFixedSize!4920) Bool)

(assert (=> start!81156 (= res!636889 (valid!1873 thiss!1141))))

(assert (=> start!81156 e!534716))

(assert (=> start!81156 e!534717))

(assert (=> start!81156 true))

(assert (= (and start!81156 res!636889) b!949777))

(assert (= (and b!949777 res!636884) b!949785))

(assert (= (and b!949785 res!636887) b!949779))

(assert (= (and b!949779 res!636888) b!949783))

(assert (= (and b!949783 res!636885) b!949780))

(assert (= (and b!949780 res!636886) b!949776))

(assert (= (and b!949778 condMapEmpty!33005) mapIsEmpty!33005))

(assert (= (and b!949778 (not condMapEmpty!33005)) mapNonEmpty!33005))

(assert (= (and mapNonEmpty!33005 ((_ is ValueCellFull!9885) mapValue!33005)) b!949781))

(assert (= (and b!949778 ((_ is ValueCellFull!9885) mapDefault!33005)) b!949784))

(assert (= b!949782 b!949778))

(assert (= start!81156 b!949782))

(declare-fun m!882389 () Bool)

(assert (=> b!949782 m!882389))

(declare-fun m!882391 () Bool)

(assert (=> b!949782 m!882391))

(declare-fun m!882393 () Bool)

(assert (=> b!949779 m!882393))

(assert (=> b!949779 m!882393))

(declare-fun m!882395 () Bool)

(assert (=> b!949779 m!882395))

(declare-fun m!882397 () Bool)

(assert (=> start!81156 m!882397))

(declare-fun m!882399 () Bool)

(assert (=> mapNonEmpty!33005 m!882399))

(declare-fun m!882401 () Bool)

(assert (=> b!949776 m!882401))

(declare-fun m!882403 () Bool)

(assert (=> b!949783 m!882403))

(declare-fun m!882405 () Bool)

(assert (=> b!949785 m!882405))

(check-sat tp_is_empty!20733 b_and!29677 (not b!949785) (not b!949783) (not b!949782) (not b!949779) (not mapNonEmpty!33005) (not b_next!18225) (not b!949776) (not start!81156))
(check-sat b_and!29677 (not b_next!18225))
(get-model)

(declare-fun d!115127 () Bool)

(assert (=> d!115127 (= (validMask!0 (mask!27557 thiss!1141)) (and (or (= (mask!27557 thiss!1141) #b00000000000000000000000000000111) (= (mask!27557 thiss!1141) #b00000000000000000000000000001111) (= (mask!27557 thiss!1141) #b00000000000000000000000000011111) (= (mask!27557 thiss!1141) #b00000000000000000000000000111111) (= (mask!27557 thiss!1141) #b00000000000000000000000001111111) (= (mask!27557 thiss!1141) #b00000000000000000000000011111111) (= (mask!27557 thiss!1141) #b00000000000000000000000111111111) (= (mask!27557 thiss!1141) #b00000000000000000000001111111111) (= (mask!27557 thiss!1141) #b00000000000000000000011111111111) (= (mask!27557 thiss!1141) #b00000000000000000000111111111111) (= (mask!27557 thiss!1141) #b00000000000000000001111111111111) (= (mask!27557 thiss!1141) #b00000000000000000011111111111111) (= (mask!27557 thiss!1141) #b00000000000000000111111111111111) (= (mask!27557 thiss!1141) #b00000000000000001111111111111111) (= (mask!27557 thiss!1141) #b00000000000000011111111111111111) (= (mask!27557 thiss!1141) #b00000000000000111111111111111111) (= (mask!27557 thiss!1141) #b00000000000001111111111111111111) (= (mask!27557 thiss!1141) #b00000000000011111111111111111111) (= (mask!27557 thiss!1141) #b00000000000111111111111111111111) (= (mask!27557 thiss!1141) #b00000000001111111111111111111111) (= (mask!27557 thiss!1141) #b00000000011111111111111111111111) (= (mask!27557 thiss!1141) #b00000000111111111111111111111111) (= (mask!27557 thiss!1141) #b00000001111111111111111111111111) (= (mask!27557 thiss!1141) #b00000011111111111111111111111111) (= (mask!27557 thiss!1141) #b00000111111111111111111111111111) (= (mask!27557 thiss!1141) #b00001111111111111111111111111111) (= (mask!27557 thiss!1141) #b00011111111111111111111111111111) (= (mask!27557 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27557 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!949783 d!115127))

(declare-fun d!115129 () Bool)

(assert (=> d!115129 (= (array_inv!21456 (_keys!10701 thiss!1141)) (bvsge (size!28120 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949782 d!115129))

(declare-fun d!115131 () Bool)

(assert (=> d!115131 (= (array_inv!21457 (_values!5792 thiss!1141)) (bvsge (size!28119 (_values!5792 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949782 d!115131))

(declare-fun b!949824 () Bool)

(declare-fun e!534743 () Bool)

(declare-fun e!534742 () Bool)

(assert (=> b!949824 (= e!534743 e!534742)))

(declare-fun c!99151 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!949824 (= c!99151 (validKeyInArray!0 (select (arr!27643 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949825 () Bool)

(declare-fun call!41322 () Bool)

(assert (=> b!949825 (= e!534742 call!41322)))

(declare-fun bm!41319 () Bool)

(assert (=> bm!41319 (= call!41322 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10701 thiss!1141) (mask!27557 thiss!1141)))))

(declare-fun b!949826 () Bool)

(declare-fun e!534744 () Bool)

(assert (=> b!949826 (= e!534742 e!534744)))

(declare-fun lt!427739 () (_ BitVec 64))

(assert (=> b!949826 (= lt!427739 (select (arr!27643 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31981 0))(
  ( (Unit!31982) )
))
(declare-fun lt!427740 () Unit!31981)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57482 (_ BitVec 64) (_ BitVec 32)) Unit!31981)

(assert (=> b!949826 (= lt!427740 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10701 thiss!1141) lt!427739 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!949826 (arrayContainsKey!0 (_keys!10701 thiss!1141) lt!427739 #b00000000000000000000000000000000)))

(declare-fun lt!427738 () Unit!31981)

(assert (=> b!949826 (= lt!427738 lt!427740)))

(declare-fun res!636912 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57482 (_ BitVec 32)) SeekEntryResult!9134)

(assert (=> b!949826 (= res!636912 (= (seekEntryOrOpen!0 (select (arr!27643 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000) (_keys!10701 thiss!1141) (mask!27557 thiss!1141)) (Found!9134 #b00000000000000000000000000000000)))))

(assert (=> b!949826 (=> (not res!636912) (not e!534744))))

(declare-fun b!949827 () Bool)

(assert (=> b!949827 (= e!534744 call!41322)))

(declare-fun d!115133 () Bool)

(declare-fun res!636913 () Bool)

(assert (=> d!115133 (=> res!636913 e!534743)))

(assert (=> d!115133 (= res!636913 (bvsge #b00000000000000000000000000000000 (size!28120 (_keys!10701 thiss!1141))))))

(assert (=> d!115133 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10701 thiss!1141) (mask!27557 thiss!1141)) e!534743)))

(assert (= (and d!115133 (not res!636913)) b!949824))

(assert (= (and b!949824 c!99151) b!949826))

(assert (= (and b!949824 (not c!99151)) b!949825))

(assert (= (and b!949826 res!636912) b!949827))

(assert (= (or b!949827 b!949825) bm!41319))

(declare-fun m!882425 () Bool)

(assert (=> b!949824 m!882425))

(assert (=> b!949824 m!882425))

(declare-fun m!882427 () Bool)

(assert (=> b!949824 m!882427))

(declare-fun m!882429 () Bool)

(assert (=> bm!41319 m!882429))

(assert (=> b!949826 m!882425))

(declare-fun m!882431 () Bool)

(assert (=> b!949826 m!882431))

(declare-fun m!882433 () Bool)

(assert (=> b!949826 m!882433))

(assert (=> b!949826 m!882425))

(declare-fun m!882435 () Bool)

(assert (=> b!949826 m!882435))

(assert (=> b!949776 d!115133))

(declare-fun b!949840 () Bool)

(declare-fun e!534752 () SeekEntryResult!9134)

(declare-fun lt!427751 () SeekEntryResult!9134)

(assert (=> b!949840 (= e!534752 (Found!9134 (index!38909 lt!427751)))))

(declare-fun b!949841 () Bool)

(declare-fun e!534753 () SeekEntryResult!9134)

(assert (=> b!949841 (= e!534753 Undefined!9134)))

(declare-fun b!949842 () Bool)

(declare-fun e!534751 () SeekEntryResult!9134)

(assert (=> b!949842 (= e!534751 (MissingZero!9134 (index!38909 lt!427751)))))

(declare-fun b!949843 () Bool)

(declare-fun c!99160 () Bool)

(declare-fun lt!427750 () (_ BitVec 64))

(assert (=> b!949843 (= c!99160 (= lt!427750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949843 (= e!534752 e!534751)))

(declare-fun d!115135 () Bool)

(declare-fun lt!427752 () SeekEntryResult!9134)

(assert (=> d!115135 (and (or ((_ is MissingVacant!9134) lt!427752) (not ((_ is Found!9134) lt!427752)) (and (bvsge (index!38908 lt!427752) #b00000000000000000000000000000000) (bvslt (index!38908 lt!427752) (size!28120 (_keys!10701 thiss!1141))))) (not ((_ is MissingVacant!9134) lt!427752)) (or (not ((_ is Found!9134) lt!427752)) (= (select (arr!27643 (_keys!10701 thiss!1141)) (index!38908 lt!427752)) key!756)))))

(assert (=> d!115135 (= lt!427752 e!534753)))

(declare-fun c!99159 () Bool)

(assert (=> d!115135 (= c!99159 (and ((_ is Intermediate!9134) lt!427751) (undefined!9946 lt!427751)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57482 (_ BitVec 32)) SeekEntryResult!9134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115135 (= lt!427751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27557 thiss!1141)) key!756 (_keys!10701 thiss!1141) (mask!27557 thiss!1141)))))

(assert (=> d!115135 (validMask!0 (mask!27557 thiss!1141))))

(assert (=> d!115135 (= (seekEntry!0 key!756 (_keys!10701 thiss!1141) (mask!27557 thiss!1141)) lt!427752)))

(declare-fun b!949844 () Bool)

(assert (=> b!949844 (= e!534753 e!534752)))

(assert (=> b!949844 (= lt!427750 (select (arr!27643 (_keys!10701 thiss!1141)) (index!38909 lt!427751)))))

(declare-fun c!99158 () Bool)

(assert (=> b!949844 (= c!99158 (= lt!427750 key!756))))

(declare-fun b!949845 () Bool)

(declare-fun lt!427749 () SeekEntryResult!9134)

(assert (=> b!949845 (= e!534751 (ite ((_ is MissingVacant!9134) lt!427749) (MissingZero!9134 (index!38910 lt!427749)) lt!427749))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57482 (_ BitVec 32)) SeekEntryResult!9134)

(assert (=> b!949845 (= lt!427749 (seekKeyOrZeroReturnVacant!0 (x!81708 lt!427751) (index!38909 lt!427751) (index!38909 lt!427751) key!756 (_keys!10701 thiss!1141) (mask!27557 thiss!1141)))))

(assert (= (and d!115135 c!99159) b!949841))

(assert (= (and d!115135 (not c!99159)) b!949844))

(assert (= (and b!949844 c!99158) b!949840))

(assert (= (and b!949844 (not c!99158)) b!949843))

(assert (= (and b!949843 c!99160) b!949842))

(assert (= (and b!949843 (not c!99160)) b!949845))

(declare-fun m!882437 () Bool)

(assert (=> d!115135 m!882437))

(declare-fun m!882439 () Bool)

(assert (=> d!115135 m!882439))

(assert (=> d!115135 m!882439))

(declare-fun m!882441 () Bool)

(assert (=> d!115135 m!882441))

(assert (=> d!115135 m!882403))

(declare-fun m!882443 () Bool)

(assert (=> b!949844 m!882443))

(declare-fun m!882445 () Bool)

(assert (=> b!949845 m!882445))

(assert (=> b!949785 d!115135))

(declare-fun d!115137 () Bool)

(declare-fun e!534758 () Bool)

(assert (=> d!115137 e!534758))

(declare-fun res!636916 () Bool)

(assert (=> d!115137 (=> res!636916 e!534758)))

(declare-fun lt!427763 () Bool)

(assert (=> d!115137 (= res!636916 (not lt!427763))))

(declare-fun lt!427762 () Bool)

(assert (=> d!115137 (= lt!427763 lt!427762)))

(declare-fun lt!427761 () Unit!31981)

(declare-fun e!534759 () Unit!31981)

(assert (=> d!115137 (= lt!427761 e!534759)))

(declare-fun c!99163 () Bool)

(assert (=> d!115137 (= c!99163 lt!427762)))

(declare-fun containsKey!462 (List!19329 (_ BitVec 64)) Bool)

(assert (=> d!115137 (= lt!427762 (containsKey!462 (toList!6133 (getCurrentListMap!3366 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141))) key!756))))

(assert (=> d!115137 (= (contains!5223 (getCurrentListMap!3366 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141)) key!756) lt!427763)))

(declare-fun b!949852 () Bool)

(declare-fun lt!427764 () Unit!31981)

(assert (=> b!949852 (= e!534759 lt!427764)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!358 (List!19329 (_ BitVec 64)) Unit!31981)

(assert (=> b!949852 (= lt!427764 (lemmaContainsKeyImpliesGetValueByKeyDefined!358 (toList!6133 (getCurrentListMap!3366 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141))) key!756))))

(declare-datatypes ((Option!501 0))(
  ( (Some!500 (v!12960 V!32609)) (None!499) )
))
(declare-fun isDefined!367 (Option!501) Bool)

(declare-fun getValueByKey!495 (List!19329 (_ BitVec 64)) Option!501)

(assert (=> b!949852 (isDefined!367 (getValueByKey!495 (toList!6133 (getCurrentListMap!3366 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141))) key!756))))

(declare-fun b!949853 () Bool)

(declare-fun Unit!31983 () Unit!31981)

(assert (=> b!949853 (= e!534759 Unit!31983)))

(declare-fun b!949854 () Bool)

(assert (=> b!949854 (= e!534758 (isDefined!367 (getValueByKey!495 (toList!6133 (getCurrentListMap!3366 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141))) key!756)))))

(assert (= (and d!115137 c!99163) b!949852))

(assert (= (and d!115137 (not c!99163)) b!949853))

(assert (= (and d!115137 (not res!636916)) b!949854))

(declare-fun m!882447 () Bool)

(assert (=> d!115137 m!882447))

(declare-fun m!882449 () Bool)

(assert (=> b!949852 m!882449))

(declare-fun m!882451 () Bool)

(assert (=> b!949852 m!882451))

(assert (=> b!949852 m!882451))

(declare-fun m!882453 () Bool)

(assert (=> b!949852 m!882453))

(assert (=> b!949854 m!882451))

(assert (=> b!949854 m!882451))

(assert (=> b!949854 m!882453))

(assert (=> b!949779 d!115137))

(declare-fun bm!41334 () Bool)

(declare-fun call!41341 () ListLongMap!12235)

(declare-fun call!41338 () ListLongMap!12235)

(assert (=> bm!41334 (= call!41341 call!41338)))

(declare-fun bm!41335 () Bool)

(declare-fun call!41340 () ListLongMap!12235)

(assert (=> bm!41335 (= call!41338 call!41340)))

(declare-fun b!949897 () Bool)

(declare-fun e!534792 () ListLongMap!12235)

(declare-fun call!41337 () ListLongMap!12235)

(declare-fun +!2860 (ListLongMap!12235 tuple2!13538) ListLongMap!12235)

(assert (=> b!949897 (= e!534792 (+!2860 call!41337 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5605 thiss!1141))))))

(declare-fun b!949898 () Bool)

(declare-fun e!534794 () ListLongMap!12235)

(assert (=> b!949898 (= e!534794 call!41341)))

(declare-fun b!949899 () Bool)

(declare-fun e!534791 () Bool)

(declare-fun call!41343 () Bool)

(assert (=> b!949899 (= e!534791 (not call!41343))))

(declare-fun b!949900 () Bool)

(declare-fun e!534795 () Bool)

(declare-fun lt!427818 () ListLongMap!12235)

(declare-fun apply!876 (ListLongMap!12235 (_ BitVec 64)) V!32609)

(assert (=> b!949900 (= e!534795 (= (apply!876 lt!427818 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5605 thiss!1141)))))

(declare-fun b!949901 () Bool)

(declare-fun e!534787 () Bool)

(assert (=> b!949901 (= e!534787 (validKeyInArray!0 (select (arr!27643 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41336 () Bool)

(declare-fun call!41342 () Bool)

(assert (=> bm!41336 (= call!41342 (contains!5223 lt!427818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949902 () Bool)

(declare-fun e!534788 () Bool)

(declare-fun e!534786 () Bool)

(assert (=> b!949902 (= e!534788 e!534786)))

(declare-fun res!636939 () Bool)

(assert (=> b!949902 (=> (not res!636939) (not e!534786))))

(assert (=> b!949902 (= res!636939 (contains!5223 lt!427818 (select (arr!27643 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949902 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28120 (_keys!10701 thiss!1141))))))

(declare-fun b!949903 () Bool)

(declare-fun c!99179 () Bool)

(assert (=> b!949903 (= c!99179 (and (not (= (bvand (extraKeys!5501 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5501 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!534790 () ListLongMap!12235)

(assert (=> b!949903 (= e!534790 e!534794)))

(declare-fun b!949904 () Bool)

(declare-fun res!636935 () Bool)

(declare-fun e!534797 () Bool)

(assert (=> b!949904 (=> (not res!636935) (not e!534797))))

(declare-fun e!534796 () Bool)

(assert (=> b!949904 (= res!636935 e!534796)))

(declare-fun c!99177 () Bool)

(assert (=> b!949904 (= c!99177 (not (= (bvand (extraKeys!5501 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!115139 () Bool)

(assert (=> d!115139 e!534797))

(declare-fun res!636943 () Bool)

(assert (=> d!115139 (=> (not res!636943) (not e!534797))))

(assert (=> d!115139 (= res!636943 (or (bvsge #b00000000000000000000000000000000 (size!28120 (_keys!10701 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28120 (_keys!10701 thiss!1141))))))))

(declare-fun lt!427815 () ListLongMap!12235)

(assert (=> d!115139 (= lt!427818 lt!427815)))

(declare-fun lt!427809 () Unit!31981)

(declare-fun e!534793 () Unit!31981)

(assert (=> d!115139 (= lt!427809 e!534793)))

(declare-fun c!99181 () Bool)

(declare-fun e!534789 () Bool)

(assert (=> d!115139 (= c!99181 e!534789)))

(declare-fun res!636940 () Bool)

(assert (=> d!115139 (=> (not res!636940) (not e!534789))))

(assert (=> d!115139 (= res!636940 (bvslt #b00000000000000000000000000000000 (size!28120 (_keys!10701 thiss!1141))))))

(assert (=> d!115139 (= lt!427815 e!534792)))

(declare-fun c!99178 () Bool)

(assert (=> d!115139 (= c!99178 (and (not (= (bvand (extraKeys!5501 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5501 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115139 (validMask!0 (mask!27557 thiss!1141))))

(assert (=> d!115139 (= (getCurrentListMap!3366 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141)) lt!427818)))

(declare-fun b!949905 () Bool)

(declare-fun get!14527 (ValueCell!9885 V!32609) V!32609)

(declare-fun dynLambda!1649 (Int (_ BitVec 64)) V!32609)

(assert (=> b!949905 (= e!534786 (= (apply!876 lt!427818 (select (arr!27643 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)) (get!14527 (select (arr!27642 (_values!5792 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1649 (defaultEntry!5769 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949905 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28119 (_values!5792 thiss!1141))))))

(assert (=> b!949905 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28120 (_keys!10701 thiss!1141))))))

(declare-fun b!949906 () Bool)

(declare-fun e!534798 () Bool)

(assert (=> b!949906 (= e!534798 (= (apply!876 lt!427818 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5605 thiss!1141)))))

(declare-fun bm!41337 () Bool)

(declare-fun call!41339 () ListLongMap!12235)

(assert (=> bm!41337 (= call!41339 call!41337)))

(declare-fun b!949907 () Bool)

(assert (=> b!949907 (= e!534789 (validKeyInArray!0 (select (arr!27643 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949908 () Bool)

(assert (=> b!949908 (= e!534794 call!41339)))

(declare-fun b!949909 () Bool)

(assert (=> b!949909 (= e!534797 e!534791)))

(declare-fun c!99180 () Bool)

(assert (=> b!949909 (= c!99180 (not (= (bvand (extraKeys!5501 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949910 () Bool)

(declare-fun res!636938 () Bool)

(assert (=> b!949910 (=> (not res!636938) (not e!534797))))

(assert (=> b!949910 (= res!636938 e!534788)))

(declare-fun res!636937 () Bool)

(assert (=> b!949910 (=> res!636937 e!534788)))

(assert (=> b!949910 (= res!636937 (not e!534787))))

(declare-fun res!636936 () Bool)

(assert (=> b!949910 (=> (not res!636936) (not e!534787))))

(assert (=> b!949910 (= res!636936 (bvslt #b00000000000000000000000000000000 (size!28120 (_keys!10701 thiss!1141))))))

(declare-fun b!949911 () Bool)

(declare-fun lt!427821 () Unit!31981)

(assert (=> b!949911 (= e!534793 lt!427821)))

(declare-fun lt!427822 () ListLongMap!12235)

(declare-fun getCurrentListMapNoExtraKeys!3315 (array!57482 array!57480 (_ BitVec 32) (_ BitVec 32) V!32609 V!32609 (_ BitVec 32) Int) ListLongMap!12235)

(assert (=> b!949911 (= lt!427822 (getCurrentListMapNoExtraKeys!3315 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141)))))

(declare-fun lt!427819 () (_ BitVec 64))

(assert (=> b!949911 (= lt!427819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427820 () (_ BitVec 64))

(assert (=> b!949911 (= lt!427820 (select (arr!27643 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427817 () Unit!31981)

(declare-fun addStillContains!579 (ListLongMap!12235 (_ BitVec 64) V!32609 (_ BitVec 64)) Unit!31981)

(assert (=> b!949911 (= lt!427817 (addStillContains!579 lt!427822 lt!427819 (zeroValue!5605 thiss!1141) lt!427820))))

(assert (=> b!949911 (contains!5223 (+!2860 lt!427822 (tuple2!13539 lt!427819 (zeroValue!5605 thiss!1141))) lt!427820)))

(declare-fun lt!427811 () Unit!31981)

(assert (=> b!949911 (= lt!427811 lt!427817)))

(declare-fun lt!427816 () ListLongMap!12235)

(assert (=> b!949911 (= lt!427816 (getCurrentListMapNoExtraKeys!3315 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141)))))

(declare-fun lt!427813 () (_ BitVec 64))

(assert (=> b!949911 (= lt!427813 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427812 () (_ BitVec 64))

(assert (=> b!949911 (= lt!427812 (select (arr!27643 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427825 () Unit!31981)

(declare-fun addApplyDifferent!459 (ListLongMap!12235 (_ BitVec 64) V!32609 (_ BitVec 64)) Unit!31981)

(assert (=> b!949911 (= lt!427825 (addApplyDifferent!459 lt!427816 lt!427813 (minValue!5605 thiss!1141) lt!427812))))

(assert (=> b!949911 (= (apply!876 (+!2860 lt!427816 (tuple2!13539 lt!427813 (minValue!5605 thiss!1141))) lt!427812) (apply!876 lt!427816 lt!427812))))

(declare-fun lt!427810 () Unit!31981)

(assert (=> b!949911 (= lt!427810 lt!427825)))

(declare-fun lt!427827 () ListLongMap!12235)

(assert (=> b!949911 (= lt!427827 (getCurrentListMapNoExtraKeys!3315 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141)))))

(declare-fun lt!427823 () (_ BitVec 64))

(assert (=> b!949911 (= lt!427823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427830 () (_ BitVec 64))

(assert (=> b!949911 (= lt!427830 (select (arr!27643 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427824 () Unit!31981)

(assert (=> b!949911 (= lt!427824 (addApplyDifferent!459 lt!427827 lt!427823 (zeroValue!5605 thiss!1141) lt!427830))))

(assert (=> b!949911 (= (apply!876 (+!2860 lt!427827 (tuple2!13539 lt!427823 (zeroValue!5605 thiss!1141))) lt!427830) (apply!876 lt!427827 lt!427830))))

(declare-fun lt!427814 () Unit!31981)

(assert (=> b!949911 (= lt!427814 lt!427824)))

(declare-fun lt!427828 () ListLongMap!12235)

(assert (=> b!949911 (= lt!427828 (getCurrentListMapNoExtraKeys!3315 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141)))))

(declare-fun lt!427826 () (_ BitVec 64))

(assert (=> b!949911 (= lt!427826 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427829 () (_ BitVec 64))

(assert (=> b!949911 (= lt!427829 (select (arr!27643 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949911 (= lt!427821 (addApplyDifferent!459 lt!427828 lt!427826 (minValue!5605 thiss!1141) lt!427829))))

(assert (=> b!949911 (= (apply!876 (+!2860 lt!427828 (tuple2!13539 lt!427826 (minValue!5605 thiss!1141))) lt!427829) (apply!876 lt!427828 lt!427829))))

(declare-fun b!949912 () Bool)

(assert (=> b!949912 (= e!534791 e!534795)))

(declare-fun res!636941 () Bool)

(assert (=> b!949912 (= res!636941 call!41343)))

(assert (=> b!949912 (=> (not res!636941) (not e!534795))))

(declare-fun b!949913 () Bool)

(assert (=> b!949913 (= e!534790 call!41339)))

(declare-fun bm!41338 () Bool)

(assert (=> bm!41338 (= call!41340 (getCurrentListMapNoExtraKeys!3315 (_keys!10701 thiss!1141) (_values!5792 thiss!1141) (mask!27557 thiss!1141) (extraKeys!5501 thiss!1141) (zeroValue!5605 thiss!1141) (minValue!5605 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5769 thiss!1141)))))

(declare-fun b!949914 () Bool)

(assert (=> b!949914 (= e!534796 (not call!41342))))

(declare-fun bm!41339 () Bool)

(assert (=> bm!41339 (= call!41343 (contains!5223 lt!427818 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949915 () Bool)

(declare-fun Unit!31984 () Unit!31981)

(assert (=> b!949915 (= e!534793 Unit!31984)))

(declare-fun b!949916 () Bool)

(assert (=> b!949916 (= e!534792 e!534790)))

(declare-fun c!99176 () Bool)

(assert (=> b!949916 (= c!99176 (and (not (= (bvand (extraKeys!5501 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5501 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41340 () Bool)

(assert (=> bm!41340 (= call!41337 (+!2860 (ite c!99178 call!41340 (ite c!99176 call!41338 call!41341)) (ite (or c!99178 c!99176) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5605 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5605 thiss!1141)))))))

(declare-fun b!949917 () Bool)

(assert (=> b!949917 (= e!534796 e!534798)))

(declare-fun res!636942 () Bool)

(assert (=> b!949917 (= res!636942 call!41342)))

(assert (=> b!949917 (=> (not res!636942) (not e!534798))))

(assert (= (and d!115139 c!99178) b!949897))

(assert (= (and d!115139 (not c!99178)) b!949916))

(assert (= (and b!949916 c!99176) b!949913))

(assert (= (and b!949916 (not c!99176)) b!949903))

(assert (= (and b!949903 c!99179) b!949908))

(assert (= (and b!949903 (not c!99179)) b!949898))

(assert (= (or b!949908 b!949898) bm!41334))

(assert (= (or b!949913 bm!41334) bm!41335))

(assert (= (or b!949913 b!949908) bm!41337))

(assert (= (or b!949897 bm!41335) bm!41338))

(assert (= (or b!949897 bm!41337) bm!41340))

(assert (= (and d!115139 res!636940) b!949907))

(assert (= (and d!115139 c!99181) b!949911))

(assert (= (and d!115139 (not c!99181)) b!949915))

(assert (= (and d!115139 res!636943) b!949910))

(assert (= (and b!949910 res!636936) b!949901))

(assert (= (and b!949910 (not res!636937)) b!949902))

(assert (= (and b!949902 res!636939) b!949905))

(assert (= (and b!949910 res!636938) b!949904))

(assert (= (and b!949904 c!99177) b!949917))

(assert (= (and b!949904 (not c!99177)) b!949914))

(assert (= (and b!949917 res!636942) b!949906))

(assert (= (or b!949917 b!949914) bm!41336))

(assert (= (and b!949904 res!636935) b!949909))

(assert (= (and b!949909 c!99180) b!949912))

(assert (= (and b!949909 (not c!99180)) b!949899))

(assert (= (and b!949912 res!636941) b!949900))

(assert (= (or b!949912 b!949899) bm!41339))

(declare-fun b_lambda!14359 () Bool)

(assert (=> (not b_lambda!14359) (not b!949905)))

(declare-fun t!27667 () Bool)

(declare-fun tb!6187 () Bool)

(assert (=> (and b!949782 (= (defaultEntry!5769 thiss!1141) (defaultEntry!5769 thiss!1141)) t!27667) tb!6187))

(declare-fun result!12283 () Bool)

(assert (=> tb!6187 (= result!12283 tp_is_empty!20733)))

(assert (=> b!949905 t!27667))

(declare-fun b_and!29681 () Bool)

(assert (= b_and!29677 (and (=> t!27667 result!12283) b_and!29681)))

(declare-fun m!882455 () Bool)

(assert (=> bm!41340 m!882455))

(declare-fun m!882457 () Bool)

(assert (=> b!949897 m!882457))

(assert (=> b!949907 m!882425))

(assert (=> b!949907 m!882425))

(assert (=> b!949907 m!882427))

(declare-fun m!882459 () Bool)

(assert (=> bm!41338 m!882459))

(assert (=> b!949902 m!882425))

(assert (=> b!949902 m!882425))

(declare-fun m!882461 () Bool)

(assert (=> b!949902 m!882461))

(declare-fun m!882463 () Bool)

(assert (=> b!949900 m!882463))

(declare-fun m!882465 () Bool)

(assert (=> b!949911 m!882465))

(declare-fun m!882467 () Bool)

(assert (=> b!949911 m!882467))

(declare-fun m!882469 () Bool)

(assert (=> b!949911 m!882469))

(declare-fun m!882471 () Bool)

(assert (=> b!949911 m!882471))

(declare-fun m!882473 () Bool)

(assert (=> b!949911 m!882473))

(declare-fun m!882475 () Bool)

(assert (=> b!949911 m!882475))

(declare-fun m!882477 () Bool)

(assert (=> b!949911 m!882477))

(declare-fun m!882479 () Bool)

(assert (=> b!949911 m!882479))

(assert (=> b!949911 m!882477))

(declare-fun m!882481 () Bool)

(assert (=> b!949911 m!882481))

(declare-fun m!882483 () Bool)

(assert (=> b!949911 m!882483))

(assert (=> b!949911 m!882473))

(declare-fun m!882485 () Bool)

(assert (=> b!949911 m!882485))

(declare-fun m!882487 () Bool)

(assert (=> b!949911 m!882487))

(declare-fun m!882489 () Bool)

(assert (=> b!949911 m!882489))

(assert (=> b!949911 m!882481))

(declare-fun m!882491 () Bool)

(assert (=> b!949911 m!882491))

(declare-fun m!882493 () Bool)

(assert (=> b!949911 m!882493))

(assert (=> b!949911 m!882459))

(assert (=> b!949911 m!882425))

(assert (=> b!949911 m!882485))

(declare-fun m!882495 () Bool)

(assert (=> bm!41336 m!882495))

(declare-fun m!882497 () Bool)

(assert (=> b!949905 m!882497))

(assert (=> b!949905 m!882497))

(declare-fun m!882499 () Bool)

(assert (=> b!949905 m!882499))

(declare-fun m!882501 () Bool)

(assert (=> b!949905 m!882501))

(assert (=> b!949905 m!882499))

(assert (=> b!949905 m!882425))

(declare-fun m!882503 () Bool)

(assert (=> b!949905 m!882503))

(assert (=> b!949905 m!882425))

(assert (=> d!115139 m!882403))

(declare-fun m!882505 () Bool)

(assert (=> bm!41339 m!882505))

(assert (=> b!949901 m!882425))

(assert (=> b!949901 m!882425))

(assert (=> b!949901 m!882427))

(declare-fun m!882507 () Bool)

(assert (=> b!949906 m!882507))

(assert (=> b!949779 d!115139))

(declare-fun d!115141 () Bool)

(declare-fun res!636950 () Bool)

(declare-fun e!534801 () Bool)

(assert (=> d!115141 (=> (not res!636950) (not e!534801))))

(declare-fun simpleValid!372 (LongMapFixedSize!4920) Bool)

(assert (=> d!115141 (= res!636950 (simpleValid!372 thiss!1141))))

(assert (=> d!115141 (= (valid!1873 thiss!1141) e!534801)))

(declare-fun b!949926 () Bool)

(declare-fun res!636951 () Bool)

(assert (=> b!949926 (=> (not res!636951) (not e!534801))))

(declare-fun arrayCountValidKeys!0 (array!57482 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949926 (= res!636951 (= (arrayCountValidKeys!0 (_keys!10701 thiss!1141) #b00000000000000000000000000000000 (size!28120 (_keys!10701 thiss!1141))) (_size!2515 thiss!1141)))))

(declare-fun b!949927 () Bool)

(declare-fun res!636952 () Bool)

(assert (=> b!949927 (=> (not res!636952) (not e!534801))))

(assert (=> b!949927 (= res!636952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10701 thiss!1141) (mask!27557 thiss!1141)))))

(declare-fun b!949928 () Bool)

(declare-datatypes ((List!19331 0))(
  ( (Nil!19328) (Cons!19327 (h!20487 (_ BitVec 64)) (t!27668 List!19331)) )
))
(declare-fun arrayNoDuplicates!0 (array!57482 (_ BitVec 32) List!19331) Bool)

(assert (=> b!949928 (= e!534801 (arrayNoDuplicates!0 (_keys!10701 thiss!1141) #b00000000000000000000000000000000 Nil!19328))))

(assert (= (and d!115141 res!636950) b!949926))

(assert (= (and b!949926 res!636951) b!949927))

(assert (= (and b!949927 res!636952) b!949928))

(declare-fun m!882509 () Bool)

(assert (=> d!115141 m!882509))

(declare-fun m!882511 () Bool)

(assert (=> b!949926 m!882511))

(assert (=> b!949927 m!882401))

(declare-fun m!882513 () Bool)

(assert (=> b!949928 m!882513))

(assert (=> start!81156 d!115141))

(declare-fun b!949935 () Bool)

(declare-fun e!534807 () Bool)

(assert (=> b!949935 (= e!534807 tp_is_empty!20733)))

(declare-fun condMapEmpty!33011 () Bool)

(declare-fun mapDefault!33011 () ValueCell!9885)

(assert (=> mapNonEmpty!33005 (= condMapEmpty!33011 (= mapRest!33005 ((as const (Array (_ BitVec 32) ValueCell!9885)) mapDefault!33011)))))

(declare-fun e!534806 () Bool)

(declare-fun mapRes!33011 () Bool)

(assert (=> mapNonEmpty!33005 (= tp!63264 (and e!534806 mapRes!33011))))

(declare-fun b!949936 () Bool)

(assert (=> b!949936 (= e!534806 tp_is_empty!20733)))

(declare-fun mapIsEmpty!33011 () Bool)

(assert (=> mapIsEmpty!33011 mapRes!33011))

(declare-fun mapNonEmpty!33011 () Bool)

(declare-fun tp!63274 () Bool)

(assert (=> mapNonEmpty!33011 (= mapRes!33011 (and tp!63274 e!534807))))

(declare-fun mapValue!33011 () ValueCell!9885)

(declare-fun mapKey!33011 () (_ BitVec 32))

(declare-fun mapRest!33011 () (Array (_ BitVec 32) ValueCell!9885))

(assert (=> mapNonEmpty!33011 (= mapRest!33005 (store mapRest!33011 mapKey!33011 mapValue!33011))))

(assert (= (and mapNonEmpty!33005 condMapEmpty!33011) mapIsEmpty!33011))

(assert (= (and mapNonEmpty!33005 (not condMapEmpty!33011)) mapNonEmpty!33011))

(assert (= (and mapNonEmpty!33011 ((_ is ValueCellFull!9885) mapValue!33011)) b!949935))

(assert (= (and mapNonEmpty!33005 ((_ is ValueCellFull!9885) mapDefault!33011)) b!949936))

(declare-fun m!882515 () Bool)

(assert (=> mapNonEmpty!33011 m!882515))

(declare-fun b_lambda!14361 () Bool)

(assert (= b_lambda!14359 (or (and b!949782 b_free!18225) b_lambda!14361)))

(check-sat tp_is_empty!20733 (not b!949911) (not mapNonEmpty!33011) (not b!949826) (not b!949900) (not b!949824) (not b!949852) (not b!949845) (not d!115141) (not bm!41338) b_and!29681 (not b!949854) (not b!949926) (not d!115139) (not b!949907) (not b!949901) (not bm!41319) (not b_next!18225) (not b!949928) (not b!949927) (not b!949902) (not b_lambda!14361) (not b!949905) (not d!115137) (not bm!41339) (not d!115135) (not bm!41340) (not b!949906) (not bm!41336) (not b!949897))
(check-sat b_and!29681 (not b_next!18225))
