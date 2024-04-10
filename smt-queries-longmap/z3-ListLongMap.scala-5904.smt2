; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76356 () Bool)

(assert start!76356)

(declare-fun b!895906 () Bool)

(declare-fun b_free!15927 () Bool)

(declare-fun b_next!15927 () Bool)

(assert (=> b!895906 (= b_free!15927 (not b_next!15927))))

(declare-fun tp!55799 () Bool)

(declare-fun b_and!26219 () Bool)

(assert (=> b!895906 (= tp!55799 b_and!26219)))

(declare-fun res!605927 () Bool)

(declare-fun e!500643 () Bool)

(assert (=> start!76356 (=> (not res!605927) (not e!500643))))

(declare-datatypes ((array!52518 0))(
  ( (array!52519 (arr!25251 (Array (_ BitVec 32) (_ BitVec 64))) (size!25701 (_ BitVec 32))) )
))
(declare-datatypes ((V!29305 0))(
  ( (V!29306 (val!9178 Int)) )
))
(declare-datatypes ((ValueCell!8646 0))(
  ( (ValueCellFull!8646 (v!11668 V!29305)) (EmptyCell!8646) )
))
(declare-datatypes ((array!52520 0))(
  ( (array!52521 (arr!25252 (Array (_ BitVec 32) ValueCell!8646)) (size!25702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4308 0))(
  ( (LongMapFixedSize!4309 (defaultEntry!5366 Int) (mask!25980 (_ BitVec 32)) (extraKeys!5062 (_ BitVec 32)) (zeroValue!5166 V!29305) (minValue!5166 V!29305) (_size!2209 (_ BitVec 32)) (_keys!10087 array!52518) (_values!5353 array!52520) (_vacant!2209 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4308)

(declare-fun valid!1661 (LongMapFixedSize!4308) Bool)

(assert (=> start!76356 (= res!605927 (valid!1661 thiss!1181))))

(assert (=> start!76356 e!500643))

(declare-fun e!500644 () Bool)

(assert (=> start!76356 e!500644))

(assert (=> start!76356 true))

(declare-fun b!895900 () Bool)

(declare-fun res!605926 () Bool)

(assert (=> b!895900 (=> (not res!605926) (not e!500643))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895900 (= res!605926 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28987 () Bool)

(declare-fun mapRes!28987 () Bool)

(declare-fun tp!55800 () Bool)

(declare-fun e!500645 () Bool)

(assert (=> mapNonEmpty!28987 (= mapRes!28987 (and tp!55800 e!500645))))

(declare-fun mapKey!28987 () (_ BitVec 32))

(declare-fun mapValue!28987 () ValueCell!8646)

(declare-fun mapRest!28987 () (Array (_ BitVec 32) ValueCell!8646))

(assert (=> mapNonEmpty!28987 (= (arr!25252 (_values!5353 thiss!1181)) (store mapRest!28987 mapKey!28987 mapValue!28987))))

(declare-fun b!895901 () Bool)

(declare-datatypes ((SeekEntryResult!8887 0))(
  ( (MissingZero!8887 (index!37919 (_ BitVec 32))) (Found!8887 (index!37920 (_ BitVec 32))) (Intermediate!8887 (undefined!9699 Bool) (index!37921 (_ BitVec 32)) (x!76247 (_ BitVec 32))) (Undefined!8887) (MissingVacant!8887 (index!37922 (_ BitVec 32))) )
))
(declare-fun lt!404631 () SeekEntryResult!8887)

(get-info :version)

(assert (=> b!895901 (= e!500643 (not (or (not ((_ is Found!8887) lt!404631)) (bvsge (index!37920 lt!404631) #b00000000000000000000000000000000))))))

(declare-fun e!500642 () Bool)

(assert (=> b!895901 e!500642))

(declare-fun res!605925 () Bool)

(assert (=> b!895901 (=> res!605925 e!500642)))

(assert (=> b!895901 (= res!605925 (not ((_ is Found!8887) lt!404631)))))

(declare-datatypes ((Unit!30468 0))(
  ( (Unit!30469) )
))
(declare-fun lt!404632 () Unit!30468)

(declare-fun lemmaSeekEntryGivesInRangeIndex!62 (array!52518 array!52520 (_ BitVec 32) (_ BitVec 32) V!29305 V!29305 (_ BitVec 64)) Unit!30468)

(assert (=> b!895901 (= lt!404632 (lemmaSeekEntryGivesInRangeIndex!62 (_keys!10087 thiss!1181) (_values!5353 thiss!1181) (mask!25980 thiss!1181) (extraKeys!5062 thiss!1181) (zeroValue!5166 thiss!1181) (minValue!5166 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52518 (_ BitVec 32)) SeekEntryResult!8887)

(assert (=> b!895901 (= lt!404631 (seekEntry!0 key!785 (_keys!10087 thiss!1181) (mask!25980 thiss!1181)))))

(declare-fun mapIsEmpty!28987 () Bool)

(assert (=> mapIsEmpty!28987 mapRes!28987))

(declare-fun b!895902 () Bool)

(declare-fun e!500640 () Bool)

(declare-fun e!500639 () Bool)

(assert (=> b!895902 (= e!500640 (and e!500639 mapRes!28987))))

(declare-fun condMapEmpty!28987 () Bool)

(declare-fun mapDefault!28987 () ValueCell!8646)

(assert (=> b!895902 (= condMapEmpty!28987 (= (arr!25252 (_values!5353 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8646)) mapDefault!28987)))))

(declare-fun b!895903 () Bool)

(declare-fun tp_is_empty!18255 () Bool)

(assert (=> b!895903 (= e!500639 tp_is_empty!18255)))

(declare-fun b!895904 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!895904 (= e!500642 (inRange!0 (index!37920 lt!404631) (mask!25980 thiss!1181)))))

(declare-fun b!895905 () Bool)

(assert (=> b!895905 (= e!500645 tp_is_empty!18255)))

(declare-fun array_inv!19824 (array!52518) Bool)

(declare-fun array_inv!19825 (array!52520) Bool)

(assert (=> b!895906 (= e!500644 (and tp!55799 tp_is_empty!18255 (array_inv!19824 (_keys!10087 thiss!1181)) (array_inv!19825 (_values!5353 thiss!1181)) e!500640))))

(assert (= (and start!76356 res!605927) b!895900))

(assert (= (and b!895900 res!605926) b!895901))

(assert (= (and b!895901 (not res!605925)) b!895904))

(assert (= (and b!895902 condMapEmpty!28987) mapIsEmpty!28987))

(assert (= (and b!895902 (not condMapEmpty!28987)) mapNonEmpty!28987))

(assert (= (and mapNonEmpty!28987 ((_ is ValueCellFull!8646) mapValue!28987)) b!895905))

(assert (= (and b!895902 ((_ is ValueCellFull!8646) mapDefault!28987)) b!895903))

(assert (= b!895906 b!895902))

(assert (= start!76356 b!895906))

(declare-fun m!833281 () Bool)

(assert (=> b!895904 m!833281))

(declare-fun m!833283 () Bool)

(assert (=> b!895901 m!833283))

(declare-fun m!833285 () Bool)

(assert (=> b!895901 m!833285))

(declare-fun m!833287 () Bool)

(assert (=> b!895906 m!833287))

(declare-fun m!833289 () Bool)

(assert (=> b!895906 m!833289))

(declare-fun m!833291 () Bool)

(assert (=> start!76356 m!833291))

(declare-fun m!833293 () Bool)

(assert (=> mapNonEmpty!28987 m!833293))

(check-sat (not b!895906) (not mapNonEmpty!28987) (not b!895901) tp_is_empty!18255 (not start!76356) (not b!895904) b_and!26219 (not b_next!15927))
(check-sat b_and!26219 (not b_next!15927))
(get-model)

(declare-fun d!110831 () Bool)

(assert (=> d!110831 (= (array_inv!19824 (_keys!10087 thiss!1181)) (bvsge (size!25701 (_keys!10087 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895906 d!110831))

(declare-fun d!110833 () Bool)

(assert (=> d!110833 (= (array_inv!19825 (_values!5353 thiss!1181)) (bvsge (size!25702 (_values!5353 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895906 d!110833))

(declare-fun d!110835 () Bool)

(declare-fun res!605943 () Bool)

(declare-fun e!500669 () Bool)

(assert (=> d!110835 (=> (not res!605943) (not e!500669))))

(declare-fun simpleValid!309 (LongMapFixedSize!4308) Bool)

(assert (=> d!110835 (= res!605943 (simpleValid!309 thiss!1181))))

(assert (=> d!110835 (= (valid!1661 thiss!1181) e!500669)))

(declare-fun b!895934 () Bool)

(declare-fun res!605944 () Bool)

(assert (=> b!895934 (=> (not res!605944) (not e!500669))))

(declare-fun arrayCountValidKeys!0 (array!52518 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895934 (= res!605944 (= (arrayCountValidKeys!0 (_keys!10087 thiss!1181) #b00000000000000000000000000000000 (size!25701 (_keys!10087 thiss!1181))) (_size!2209 thiss!1181)))))

(declare-fun b!895935 () Bool)

(declare-fun res!605945 () Bool)

(assert (=> b!895935 (=> (not res!605945) (not e!500669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52518 (_ BitVec 32)) Bool)

(assert (=> b!895935 (= res!605945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10087 thiss!1181) (mask!25980 thiss!1181)))))

(declare-fun b!895936 () Bool)

(declare-datatypes ((List!17819 0))(
  ( (Nil!17816) (Cons!17815 (h!18952 (_ BitVec 64)) (t!25158 List!17819)) )
))
(declare-fun arrayNoDuplicates!0 (array!52518 (_ BitVec 32) List!17819) Bool)

(assert (=> b!895936 (= e!500669 (arrayNoDuplicates!0 (_keys!10087 thiss!1181) #b00000000000000000000000000000000 Nil!17816))))

(assert (= (and d!110835 res!605943) b!895934))

(assert (= (and b!895934 res!605944) b!895935))

(assert (= (and b!895935 res!605945) b!895936))

(declare-fun m!833309 () Bool)

(assert (=> d!110835 m!833309))

(declare-fun m!833311 () Bool)

(assert (=> b!895934 m!833311))

(declare-fun m!833313 () Bool)

(assert (=> b!895935 m!833313))

(declare-fun m!833315 () Bool)

(assert (=> b!895936 m!833315))

(assert (=> start!76356 d!110835))

(declare-fun d!110837 () Bool)

(assert (=> d!110837 (= (inRange!0 (index!37920 lt!404631) (mask!25980 thiss!1181)) (and (bvsge (index!37920 lt!404631) #b00000000000000000000000000000000) (bvslt (index!37920 lt!404631) (bvadd (mask!25980 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!895904 d!110837))

(declare-fun d!110839 () Bool)

(declare-fun e!500672 () Bool)

(assert (=> d!110839 e!500672))

(declare-fun res!605948 () Bool)

(assert (=> d!110839 (=> res!605948 e!500672)))

(declare-fun lt!404644 () SeekEntryResult!8887)

(assert (=> d!110839 (= res!605948 (not ((_ is Found!8887) lt!404644)))))

(assert (=> d!110839 (= lt!404644 (seekEntry!0 key!785 (_keys!10087 thiss!1181) (mask!25980 thiss!1181)))))

(declare-fun lt!404643 () Unit!30468)

(declare-fun choose!1474 (array!52518 array!52520 (_ BitVec 32) (_ BitVec 32) V!29305 V!29305 (_ BitVec 64)) Unit!30468)

(assert (=> d!110839 (= lt!404643 (choose!1474 (_keys!10087 thiss!1181) (_values!5353 thiss!1181) (mask!25980 thiss!1181) (extraKeys!5062 thiss!1181) (zeroValue!5166 thiss!1181) (minValue!5166 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110839 (validMask!0 (mask!25980 thiss!1181))))

(assert (=> d!110839 (= (lemmaSeekEntryGivesInRangeIndex!62 (_keys!10087 thiss!1181) (_values!5353 thiss!1181) (mask!25980 thiss!1181) (extraKeys!5062 thiss!1181) (zeroValue!5166 thiss!1181) (minValue!5166 thiss!1181) key!785) lt!404643)))

(declare-fun b!895939 () Bool)

(assert (=> b!895939 (= e!500672 (inRange!0 (index!37920 lt!404644) (mask!25980 thiss!1181)))))

(assert (= (and d!110839 (not res!605948)) b!895939))

(assert (=> d!110839 m!833285))

(declare-fun m!833317 () Bool)

(assert (=> d!110839 m!833317))

(declare-fun m!833319 () Bool)

(assert (=> d!110839 m!833319))

(declare-fun m!833321 () Bool)

(assert (=> b!895939 m!833321))

(assert (=> b!895901 d!110839))

(declare-fun b!895952 () Bool)

(declare-fun e!500679 () SeekEntryResult!8887)

(declare-fun e!500681 () SeekEntryResult!8887)

(assert (=> b!895952 (= e!500679 e!500681)))

(declare-fun lt!404654 () (_ BitVec 64))

(declare-fun lt!404655 () SeekEntryResult!8887)

(assert (=> b!895952 (= lt!404654 (select (arr!25251 (_keys!10087 thiss!1181)) (index!37921 lt!404655)))))

(declare-fun c!94623 () Bool)

(assert (=> b!895952 (= c!94623 (= lt!404654 key!785))))

(declare-fun b!895953 () Bool)

(assert (=> b!895953 (= e!500679 Undefined!8887)))

(declare-fun b!895954 () Bool)

(declare-fun e!500680 () SeekEntryResult!8887)

(declare-fun lt!404656 () SeekEntryResult!8887)

(assert (=> b!895954 (= e!500680 (ite ((_ is MissingVacant!8887) lt!404656) (MissingZero!8887 (index!37922 lt!404656)) lt!404656))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52518 (_ BitVec 32)) SeekEntryResult!8887)

(assert (=> b!895954 (= lt!404656 (seekKeyOrZeroReturnVacant!0 (x!76247 lt!404655) (index!37921 lt!404655) (index!37921 lt!404655) key!785 (_keys!10087 thiss!1181) (mask!25980 thiss!1181)))))

(declare-fun b!895955 () Bool)

(assert (=> b!895955 (= e!500680 (MissingZero!8887 (index!37921 lt!404655)))))

(declare-fun b!895956 () Bool)

(assert (=> b!895956 (= e!500681 (Found!8887 (index!37921 lt!404655)))))

(declare-fun d!110841 () Bool)

(declare-fun lt!404653 () SeekEntryResult!8887)

(assert (=> d!110841 (and (or ((_ is MissingVacant!8887) lt!404653) (not ((_ is Found!8887) lt!404653)) (and (bvsge (index!37920 lt!404653) #b00000000000000000000000000000000) (bvslt (index!37920 lt!404653) (size!25701 (_keys!10087 thiss!1181))))) (not ((_ is MissingVacant!8887) lt!404653)) (or (not ((_ is Found!8887) lt!404653)) (= (select (arr!25251 (_keys!10087 thiss!1181)) (index!37920 lt!404653)) key!785)))))

(assert (=> d!110841 (= lt!404653 e!500679)))

(declare-fun c!94624 () Bool)

(assert (=> d!110841 (= c!94624 (and ((_ is Intermediate!8887) lt!404655) (undefined!9699 lt!404655)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52518 (_ BitVec 32)) SeekEntryResult!8887)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110841 (= lt!404655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25980 thiss!1181)) key!785 (_keys!10087 thiss!1181) (mask!25980 thiss!1181)))))

(assert (=> d!110841 (validMask!0 (mask!25980 thiss!1181))))

(assert (=> d!110841 (= (seekEntry!0 key!785 (_keys!10087 thiss!1181) (mask!25980 thiss!1181)) lt!404653)))

(declare-fun b!895957 () Bool)

(declare-fun c!94625 () Bool)

(assert (=> b!895957 (= c!94625 (= lt!404654 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895957 (= e!500681 e!500680)))

(assert (= (and d!110841 c!94624) b!895953))

(assert (= (and d!110841 (not c!94624)) b!895952))

(assert (= (and b!895952 c!94623) b!895956))

(assert (= (and b!895952 (not c!94623)) b!895957))

(assert (= (and b!895957 c!94625) b!895955))

(assert (= (and b!895957 (not c!94625)) b!895954))

(declare-fun m!833323 () Bool)

(assert (=> b!895952 m!833323))

(declare-fun m!833325 () Bool)

(assert (=> b!895954 m!833325))

(declare-fun m!833327 () Bool)

(assert (=> d!110841 m!833327))

(declare-fun m!833329 () Bool)

(assert (=> d!110841 m!833329))

(assert (=> d!110841 m!833329))

(declare-fun m!833331 () Bool)

(assert (=> d!110841 m!833331))

(assert (=> d!110841 m!833319))

(assert (=> b!895901 d!110841))

(declare-fun mapIsEmpty!28993 () Bool)

(declare-fun mapRes!28993 () Bool)

(assert (=> mapIsEmpty!28993 mapRes!28993))

(declare-fun mapNonEmpty!28993 () Bool)

(declare-fun tp!55809 () Bool)

(declare-fun e!500686 () Bool)

(assert (=> mapNonEmpty!28993 (= mapRes!28993 (and tp!55809 e!500686))))

(declare-fun mapKey!28993 () (_ BitVec 32))

(declare-fun mapValue!28993 () ValueCell!8646)

(declare-fun mapRest!28993 () (Array (_ BitVec 32) ValueCell!8646))

(assert (=> mapNonEmpty!28993 (= mapRest!28987 (store mapRest!28993 mapKey!28993 mapValue!28993))))

(declare-fun b!895964 () Bool)

(assert (=> b!895964 (= e!500686 tp_is_empty!18255)))

(declare-fun b!895965 () Bool)

(declare-fun e!500687 () Bool)

(assert (=> b!895965 (= e!500687 tp_is_empty!18255)))

(declare-fun condMapEmpty!28993 () Bool)

(declare-fun mapDefault!28993 () ValueCell!8646)

(assert (=> mapNonEmpty!28987 (= condMapEmpty!28993 (= mapRest!28987 ((as const (Array (_ BitVec 32) ValueCell!8646)) mapDefault!28993)))))

(assert (=> mapNonEmpty!28987 (= tp!55800 (and e!500687 mapRes!28993))))

(assert (= (and mapNonEmpty!28987 condMapEmpty!28993) mapIsEmpty!28993))

(assert (= (and mapNonEmpty!28987 (not condMapEmpty!28993)) mapNonEmpty!28993))

(assert (= (and mapNonEmpty!28993 ((_ is ValueCellFull!8646) mapValue!28993)) b!895964))

(assert (= (and mapNonEmpty!28987 ((_ is ValueCellFull!8646) mapDefault!28993)) b!895965))

(declare-fun m!833333 () Bool)

(assert (=> mapNonEmpty!28993 m!833333))

(check-sat (not b!895936) (not b!895954) (not d!110841) (not b!895934) (not mapNonEmpty!28993) (not d!110835) tp_is_empty!18255 (not b!895939) b_and!26219 (not b_next!15927) (not b!895935) (not d!110839))
(check-sat b_and!26219 (not b_next!15927))
