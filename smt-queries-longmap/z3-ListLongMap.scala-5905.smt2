; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76374 () Bool)

(assert start!76374)

(declare-fun b!896003 () Bool)

(declare-fun b_free!15933 () Bool)

(declare-fun b_next!15933 () Bool)

(assert (=> b!896003 (= b_free!15933 (not b_next!15933))))

(declare-fun tp!55820 () Bool)

(declare-fun b_and!26225 () Bool)

(assert (=> b!896003 (= tp!55820 b_and!26225)))

(declare-fun b!896001 () Bool)

(declare-fun e!500725 () Bool)

(declare-datatypes ((SeekEntryResult!8890 0))(
  ( (MissingZero!8890 (index!37931 (_ BitVec 32))) (Found!8890 (index!37932 (_ BitVec 32))) (Intermediate!8890 (undefined!9702 Bool) (index!37933 (_ BitVec 32)) (x!76266 (_ BitVec 32))) (Undefined!8890) (MissingVacant!8890 (index!37934 (_ BitVec 32))) )
))
(declare-fun lt!404667 () SeekEntryResult!8890)

(declare-datatypes ((array!52532 0))(
  ( (array!52533 (arr!25257 (Array (_ BitVec 32) (_ BitVec 64))) (size!25707 (_ BitVec 32))) )
))
(declare-datatypes ((V!29313 0))(
  ( (V!29314 (val!9181 Int)) )
))
(declare-datatypes ((ValueCell!8649 0))(
  ( (ValueCellFull!8649 (v!11671 V!29313)) (EmptyCell!8649) )
))
(declare-datatypes ((array!52534 0))(
  ( (array!52535 (arr!25258 (Array (_ BitVec 32) ValueCell!8649)) (size!25708 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4314 0))(
  ( (LongMapFixedSize!4315 (defaultEntry!5369 Int) (mask!25988 (_ BitVec 32)) (extraKeys!5066 (_ BitVec 32)) (zeroValue!5170 V!29313) (minValue!5170 V!29313) (_size!2212 (_ BitVec 32)) (_keys!10092 array!52532) (_values!5357 array!52534) (_vacant!2212 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4314)

(get-info :version)

(assert (=> b!896001 (= e!500725 (not (or (not ((_ is Found!8890) lt!404667)) (bvslt (index!37932 lt!404667) #b00000000000000000000000000000000) (bvslt (index!37932 lt!404667) (size!25707 (_keys!10092 thiss!1181))))))))

(declare-fun e!500723 () Bool)

(assert (=> b!896001 e!500723))

(declare-fun res!605964 () Bool)

(assert (=> b!896001 (=> res!605964 e!500723)))

(assert (=> b!896001 (= res!605964 (not ((_ is Found!8890) lt!404667)))))

(declare-datatypes ((Unit!30472 0))(
  ( (Unit!30473) )
))
(declare-fun lt!404668 () Unit!30472)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!64 (array!52532 array!52534 (_ BitVec 32) (_ BitVec 32) V!29313 V!29313 (_ BitVec 64)) Unit!30472)

(assert (=> b!896001 (= lt!404668 (lemmaSeekEntryGivesInRangeIndex!64 (_keys!10092 thiss!1181) (_values!5357 thiss!1181) (mask!25988 thiss!1181) (extraKeys!5066 thiss!1181) (zeroValue!5170 thiss!1181) (minValue!5170 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52532 (_ BitVec 32)) SeekEntryResult!8890)

(assert (=> b!896001 (= lt!404667 (seekEntry!0 key!785 (_keys!10092 thiss!1181) (mask!25988 thiss!1181)))))

(declare-fun res!605966 () Bool)

(assert (=> start!76374 (=> (not res!605966) (not e!500725))))

(declare-fun valid!1664 (LongMapFixedSize!4314) Bool)

(assert (=> start!76374 (= res!605966 (valid!1664 thiss!1181))))

(assert (=> start!76374 e!500725))

(declare-fun e!500724 () Bool)

(assert (=> start!76374 e!500724))

(assert (=> start!76374 true))

(declare-fun b!896002 () Bool)

(declare-fun e!500729 () Bool)

(declare-fun tp_is_empty!18261 () Bool)

(assert (=> b!896002 (= e!500729 tp_is_empty!18261)))

(declare-fun e!500727 () Bool)

(declare-fun array_inv!19828 (array!52532) Bool)

(declare-fun array_inv!19829 (array!52534) Bool)

(assert (=> b!896003 (= e!500724 (and tp!55820 tp_is_empty!18261 (array_inv!19828 (_keys!10092 thiss!1181)) (array_inv!19829 (_values!5357 thiss!1181)) e!500727))))

(declare-fun b!896004 () Bool)

(declare-fun e!500728 () Bool)

(assert (=> b!896004 (= e!500728 tp_is_empty!18261)))

(declare-fun mapNonEmpty!28999 () Bool)

(declare-fun mapRes!28999 () Bool)

(declare-fun tp!55821 () Bool)

(assert (=> mapNonEmpty!28999 (= mapRes!28999 (and tp!55821 e!500728))))

(declare-fun mapKey!28999 () (_ BitVec 32))

(declare-fun mapValue!28999 () ValueCell!8649)

(declare-fun mapRest!28999 () (Array (_ BitVec 32) ValueCell!8649))

(assert (=> mapNonEmpty!28999 (= (arr!25258 (_values!5357 thiss!1181)) (store mapRest!28999 mapKey!28999 mapValue!28999))))

(declare-fun b!896005 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896005 (= e!500723 (inRange!0 (index!37932 lt!404667) (mask!25988 thiss!1181)))))

(declare-fun mapIsEmpty!28999 () Bool)

(assert (=> mapIsEmpty!28999 mapRes!28999))

(declare-fun b!896006 () Bool)

(assert (=> b!896006 (= e!500727 (and e!500729 mapRes!28999))))

(declare-fun condMapEmpty!28999 () Bool)

(declare-fun mapDefault!28999 () ValueCell!8649)

(assert (=> b!896006 (= condMapEmpty!28999 (= (arr!25258 (_values!5357 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8649)) mapDefault!28999)))))

(declare-fun b!896007 () Bool)

(declare-fun res!605965 () Bool)

(assert (=> b!896007 (=> (not res!605965) (not e!500725))))

(assert (=> b!896007 (= res!605965 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!76374 res!605966) b!896007))

(assert (= (and b!896007 res!605965) b!896001))

(assert (= (and b!896001 (not res!605964)) b!896005))

(assert (= (and b!896006 condMapEmpty!28999) mapIsEmpty!28999))

(assert (= (and b!896006 (not condMapEmpty!28999)) mapNonEmpty!28999))

(assert (= (and mapNonEmpty!28999 ((_ is ValueCellFull!8649) mapValue!28999)) b!896004))

(assert (= (and b!896006 ((_ is ValueCellFull!8649) mapDefault!28999)) b!896002))

(assert (= b!896003 b!896006))

(assert (= start!76374 b!896003))

(declare-fun m!833349 () Bool)

(assert (=> start!76374 m!833349))

(declare-fun m!833351 () Bool)

(assert (=> b!896003 m!833351))

(declare-fun m!833353 () Bool)

(assert (=> b!896003 m!833353))

(declare-fun m!833355 () Bool)

(assert (=> b!896001 m!833355))

(declare-fun m!833357 () Bool)

(assert (=> b!896001 m!833357))

(declare-fun m!833359 () Bool)

(assert (=> b!896005 m!833359))

(declare-fun m!833361 () Bool)

(assert (=> mapNonEmpty!28999 m!833361))

(check-sat tp_is_empty!18261 (not b!896001) b_and!26225 (not start!76374) (not b!896005) (not mapNonEmpty!28999) (not b!896003) (not b_next!15933))
(check-sat b_and!26225 (not b_next!15933))
(get-model)

(declare-fun d!110845 () Bool)

(assert (=> d!110845 (= (inRange!0 (index!37932 lt!404667) (mask!25988 thiss!1181)) (and (bvsge (index!37932 lt!404667) #b00000000000000000000000000000000) (bvslt (index!37932 lt!404667) (bvadd (mask!25988 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896005 d!110845))

(declare-fun d!110847 () Bool)

(declare-fun e!500753 () Bool)

(assert (=> d!110847 e!500753))

(declare-fun res!605978 () Bool)

(assert (=> d!110847 (=> res!605978 e!500753)))

(declare-fun lt!404680 () SeekEntryResult!8890)

(assert (=> d!110847 (= res!605978 (not ((_ is Found!8890) lt!404680)))))

(assert (=> d!110847 (= lt!404680 (seekEntry!0 key!785 (_keys!10092 thiss!1181) (mask!25988 thiss!1181)))))

(declare-fun lt!404679 () Unit!30472)

(declare-fun choose!1475 (array!52532 array!52534 (_ BitVec 32) (_ BitVec 32) V!29313 V!29313 (_ BitVec 64)) Unit!30472)

(assert (=> d!110847 (= lt!404679 (choose!1475 (_keys!10092 thiss!1181) (_values!5357 thiss!1181) (mask!25988 thiss!1181) (extraKeys!5066 thiss!1181) (zeroValue!5170 thiss!1181) (minValue!5170 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110847 (validMask!0 (mask!25988 thiss!1181))))

(assert (=> d!110847 (= (lemmaSeekEntryGivesInRangeIndex!64 (_keys!10092 thiss!1181) (_values!5357 thiss!1181) (mask!25988 thiss!1181) (extraKeys!5066 thiss!1181) (zeroValue!5170 thiss!1181) (minValue!5170 thiss!1181) key!785) lt!404679)))

(declare-fun b!896031 () Bool)

(assert (=> b!896031 (= e!500753 (inRange!0 (index!37932 lt!404680) (mask!25988 thiss!1181)))))

(assert (= (and d!110847 (not res!605978)) b!896031))

(assert (=> d!110847 m!833357))

(declare-fun m!833377 () Bool)

(assert (=> d!110847 m!833377))

(declare-fun m!833379 () Bool)

(assert (=> d!110847 m!833379))

(declare-fun m!833381 () Bool)

(assert (=> b!896031 m!833381))

(assert (=> b!896001 d!110847))

(declare-fun b!896044 () Bool)

(declare-fun e!500761 () SeekEntryResult!8890)

(declare-fun e!500760 () SeekEntryResult!8890)

(assert (=> b!896044 (= e!500761 e!500760)))

(declare-fun lt!404690 () (_ BitVec 64))

(declare-fun lt!404689 () SeekEntryResult!8890)

(assert (=> b!896044 (= lt!404690 (select (arr!25257 (_keys!10092 thiss!1181)) (index!37933 lt!404689)))))

(declare-fun c!94633 () Bool)

(assert (=> b!896044 (= c!94633 (= lt!404690 key!785))))

(declare-fun b!896045 () Bool)

(assert (=> b!896045 (= e!500760 (Found!8890 (index!37933 lt!404689)))))

(declare-fun b!896046 () Bool)

(assert (=> b!896046 (= e!500761 Undefined!8890)))

(declare-fun d!110849 () Bool)

(declare-fun lt!404692 () SeekEntryResult!8890)

(assert (=> d!110849 (and (or ((_ is MissingVacant!8890) lt!404692) (not ((_ is Found!8890) lt!404692)) (and (bvsge (index!37932 lt!404692) #b00000000000000000000000000000000) (bvslt (index!37932 lt!404692) (size!25707 (_keys!10092 thiss!1181))))) (not ((_ is MissingVacant!8890) lt!404692)) (or (not ((_ is Found!8890) lt!404692)) (= (select (arr!25257 (_keys!10092 thiss!1181)) (index!37932 lt!404692)) key!785)))))

(assert (=> d!110849 (= lt!404692 e!500761)))

(declare-fun c!94634 () Bool)

(assert (=> d!110849 (= c!94634 (and ((_ is Intermediate!8890) lt!404689) (undefined!9702 lt!404689)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52532 (_ BitVec 32)) SeekEntryResult!8890)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110849 (= lt!404689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25988 thiss!1181)) key!785 (_keys!10092 thiss!1181) (mask!25988 thiss!1181)))))

(assert (=> d!110849 (validMask!0 (mask!25988 thiss!1181))))

(assert (=> d!110849 (= (seekEntry!0 key!785 (_keys!10092 thiss!1181) (mask!25988 thiss!1181)) lt!404692)))

(declare-fun b!896047 () Bool)

(declare-fun e!500762 () SeekEntryResult!8890)

(declare-fun lt!404691 () SeekEntryResult!8890)

(assert (=> b!896047 (= e!500762 (ite ((_ is MissingVacant!8890) lt!404691) (MissingZero!8890 (index!37934 lt!404691)) lt!404691))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52532 (_ BitVec 32)) SeekEntryResult!8890)

(assert (=> b!896047 (= lt!404691 (seekKeyOrZeroReturnVacant!0 (x!76266 lt!404689) (index!37933 lt!404689) (index!37933 lt!404689) key!785 (_keys!10092 thiss!1181) (mask!25988 thiss!1181)))))

(declare-fun b!896048 () Bool)

(assert (=> b!896048 (= e!500762 (MissingZero!8890 (index!37933 lt!404689)))))

(declare-fun b!896049 () Bool)

(declare-fun c!94632 () Bool)

(assert (=> b!896049 (= c!94632 (= lt!404690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896049 (= e!500760 e!500762)))

(assert (= (and d!110849 c!94634) b!896046))

(assert (= (and d!110849 (not c!94634)) b!896044))

(assert (= (and b!896044 c!94633) b!896045))

(assert (= (and b!896044 (not c!94633)) b!896049))

(assert (= (and b!896049 c!94632) b!896048))

(assert (= (and b!896049 (not c!94632)) b!896047))

(declare-fun m!833383 () Bool)

(assert (=> b!896044 m!833383))

(declare-fun m!833385 () Bool)

(assert (=> d!110849 m!833385))

(declare-fun m!833387 () Bool)

(assert (=> d!110849 m!833387))

(assert (=> d!110849 m!833387))

(declare-fun m!833389 () Bool)

(assert (=> d!110849 m!833389))

(assert (=> d!110849 m!833379))

(declare-fun m!833391 () Bool)

(assert (=> b!896047 m!833391))

(assert (=> b!896001 d!110849))

(declare-fun d!110851 () Bool)

(assert (=> d!110851 (= (array_inv!19828 (_keys!10092 thiss!1181)) (bvsge (size!25707 (_keys!10092 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896003 d!110851))

(declare-fun d!110853 () Bool)

(assert (=> d!110853 (= (array_inv!19829 (_values!5357 thiss!1181)) (bvsge (size!25708 (_values!5357 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896003 d!110853))

(declare-fun d!110855 () Bool)

(declare-fun res!605985 () Bool)

(declare-fun e!500765 () Bool)

(assert (=> d!110855 (=> (not res!605985) (not e!500765))))

(declare-fun simpleValid!310 (LongMapFixedSize!4314) Bool)

(assert (=> d!110855 (= res!605985 (simpleValid!310 thiss!1181))))

(assert (=> d!110855 (= (valid!1664 thiss!1181) e!500765)))

(declare-fun b!896056 () Bool)

(declare-fun res!605986 () Bool)

(assert (=> b!896056 (=> (not res!605986) (not e!500765))))

(declare-fun arrayCountValidKeys!0 (array!52532 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896056 (= res!605986 (= (arrayCountValidKeys!0 (_keys!10092 thiss!1181) #b00000000000000000000000000000000 (size!25707 (_keys!10092 thiss!1181))) (_size!2212 thiss!1181)))))

(declare-fun b!896057 () Bool)

(declare-fun res!605987 () Bool)

(assert (=> b!896057 (=> (not res!605987) (not e!500765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52532 (_ BitVec 32)) Bool)

(assert (=> b!896057 (= res!605987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10092 thiss!1181) (mask!25988 thiss!1181)))))

(declare-fun b!896058 () Bool)

(declare-datatypes ((List!17820 0))(
  ( (Nil!17817) (Cons!17816 (h!18953 (_ BitVec 64)) (t!25159 List!17820)) )
))
(declare-fun arrayNoDuplicates!0 (array!52532 (_ BitVec 32) List!17820) Bool)

(assert (=> b!896058 (= e!500765 (arrayNoDuplicates!0 (_keys!10092 thiss!1181) #b00000000000000000000000000000000 Nil!17817))))

(assert (= (and d!110855 res!605985) b!896056))

(assert (= (and b!896056 res!605986) b!896057))

(assert (= (and b!896057 res!605987) b!896058))

(declare-fun m!833393 () Bool)

(assert (=> d!110855 m!833393))

(declare-fun m!833395 () Bool)

(assert (=> b!896056 m!833395))

(declare-fun m!833397 () Bool)

(assert (=> b!896057 m!833397))

(declare-fun m!833399 () Bool)

(assert (=> b!896058 m!833399))

(assert (=> start!76374 d!110855))

(declare-fun condMapEmpty!29005 () Bool)

(declare-fun mapDefault!29005 () ValueCell!8649)

(assert (=> mapNonEmpty!28999 (= condMapEmpty!29005 (= mapRest!28999 ((as const (Array (_ BitVec 32) ValueCell!8649)) mapDefault!29005)))))

(declare-fun e!500771 () Bool)

(declare-fun mapRes!29005 () Bool)

(assert (=> mapNonEmpty!28999 (= tp!55821 (and e!500771 mapRes!29005))))

(declare-fun mapIsEmpty!29005 () Bool)

(assert (=> mapIsEmpty!29005 mapRes!29005))

(declare-fun mapNonEmpty!29005 () Bool)

(declare-fun tp!55830 () Bool)

(declare-fun e!500770 () Bool)

(assert (=> mapNonEmpty!29005 (= mapRes!29005 (and tp!55830 e!500770))))

(declare-fun mapValue!29005 () ValueCell!8649)

(declare-fun mapKey!29005 () (_ BitVec 32))

(declare-fun mapRest!29005 () (Array (_ BitVec 32) ValueCell!8649))

(assert (=> mapNonEmpty!29005 (= mapRest!28999 (store mapRest!29005 mapKey!29005 mapValue!29005))))

(declare-fun b!896066 () Bool)

(assert (=> b!896066 (= e!500771 tp_is_empty!18261)))

(declare-fun b!896065 () Bool)

(assert (=> b!896065 (= e!500770 tp_is_empty!18261)))

(assert (= (and mapNonEmpty!28999 condMapEmpty!29005) mapIsEmpty!29005))

(assert (= (and mapNonEmpty!28999 (not condMapEmpty!29005)) mapNonEmpty!29005))

(assert (= (and mapNonEmpty!29005 ((_ is ValueCellFull!8649) mapValue!29005)) b!896065))

(assert (= (and mapNonEmpty!28999 ((_ is ValueCellFull!8649) mapDefault!29005)) b!896066))

(declare-fun m!833401 () Bool)

(assert (=> mapNonEmpty!29005 m!833401))

(check-sat (not d!110847) tp_is_empty!18261 b_and!26225 (not mapNonEmpty!29005) (not d!110849) (not b!896058) (not b!896057) (not b!896047) (not b!896031) (not d!110855) (not b_next!15933) (not b!896056))
(check-sat b_and!26225 (not b_next!15933))
