; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76408 () Bool)

(assert start!76408)

(declare-fun b!896047 () Bool)

(declare-fun b_free!15943 () Bool)

(declare-fun b_next!15943 () Bool)

(assert (=> b!896047 (= b_free!15943 (not b_next!15943))))

(declare-fun tp!55859 () Bool)

(declare-fun b_and!26209 () Bool)

(assert (=> b!896047 (= tp!55859 b_and!26209)))

(declare-fun mapNonEmpty!29021 () Bool)

(declare-fun mapRes!29021 () Bool)

(declare-fun tp!55858 () Bool)

(declare-fun e!500784 () Bool)

(assert (=> mapNonEmpty!29021 (= mapRes!29021 (and tp!55858 e!500784))))

(declare-fun mapKey!29021 () (_ BitVec 32))

(declare-datatypes ((V!29327 0))(
  ( (V!29328 (val!9186 Int)) )
))
(declare-datatypes ((ValueCell!8654 0))(
  ( (ValueCellFull!8654 (v!11673 V!29327)) (EmptyCell!8654) )
))
(declare-fun mapValue!29021 () ValueCell!8654)

(declare-fun mapRest!29021 () (Array (_ BitVec 32) ValueCell!8654))

(declare-datatypes ((array!52539 0))(
  ( (array!52540 (arr!25259 (Array (_ BitVec 32) (_ BitVec 64))) (size!25712 (_ BitVec 32))) )
))
(declare-datatypes ((array!52541 0))(
  ( (array!52542 (arr!25260 (Array (_ BitVec 32) ValueCell!8654)) (size!25713 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4324 0))(
  ( (LongMapFixedSize!4325 (defaultEntry!5374 Int) (mask!26002 (_ BitVec 32)) (extraKeys!5074 (_ BitVec 32)) (zeroValue!5178 V!29327) (minValue!5178 V!29327) (_size!2217 (_ BitVec 32)) (_keys!10100 array!52539) (_values!5365 array!52541) (_vacant!2217 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4324)

(assert (=> mapNonEmpty!29021 (= (arr!25260 (_values!5365 thiss!1181)) (store mapRest!29021 mapKey!29021 mapValue!29021))))

(declare-fun b!896046 () Bool)

(declare-fun e!500786 () Bool)

(declare-fun tp_is_empty!18271 () Bool)

(assert (=> b!896046 (= e!500786 tp_is_empty!18271)))

(declare-fun res!605968 () Bool)

(declare-fun e!500785 () Bool)

(assert (=> start!76408 (=> (not res!605968) (not e!500785))))

(declare-fun valid!1674 (LongMapFixedSize!4324) Bool)

(assert (=> start!76408 (= res!605968 (valid!1674 thiss!1181))))

(assert (=> start!76408 e!500785))

(declare-fun e!500787 () Bool)

(assert (=> start!76408 e!500787))

(assert (=> start!76408 true))

(declare-fun e!500789 () Bool)

(declare-fun array_inv!19882 (array!52539) Bool)

(declare-fun array_inv!19883 (array!52541) Bool)

(assert (=> b!896047 (= e!500787 (and tp!55859 tp_is_empty!18271 (array_inv!19882 (_keys!10100 thiss!1181)) (array_inv!19883 (_values!5365 thiss!1181)) e!500789))))

(declare-fun b!896048 () Bool)

(declare-fun e!500790 () Bool)

(assert (=> b!896048 (= e!500785 (not e!500790))))

(declare-fun res!605966 () Bool)

(assert (=> b!896048 (=> res!605966 e!500790)))

(declare-datatypes ((SeekEntryResult!8898 0))(
  ( (MissingZero!8898 (index!37963 (_ BitVec 32))) (Found!8898 (index!37964 (_ BitVec 32))) (Intermediate!8898 (undefined!9710 Bool) (index!37965 (_ BitVec 32)) (x!76310 (_ BitVec 32))) (Undefined!8898) (MissingVacant!8898 (index!37966 (_ BitVec 32))) )
))
(declare-fun lt!404531 () SeekEntryResult!8898)

(get-info :version)

(assert (=> b!896048 (= res!605966 (or (not ((_ is Found!8898) lt!404531)) (bvslt (index!37964 lt!404531) #b00000000000000000000000000000000) (bvsge (index!37964 lt!404531) (size!25712 (_keys!10100 thiss!1181))) (bvsge (size!25712 (_keys!10100 thiss!1181)) #b01111111111111111111111111111111)))))

(declare-fun e!500783 () Bool)

(assert (=> b!896048 e!500783))

(declare-fun res!605965 () Bool)

(assert (=> b!896048 (=> res!605965 e!500783)))

(assert (=> b!896048 (= res!605965 (not ((_ is Found!8898) lt!404531)))))

(declare-datatypes ((Unit!30424 0))(
  ( (Unit!30425) )
))
(declare-fun lt!404530 () Unit!30424)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!71 (array!52539 array!52541 (_ BitVec 32) (_ BitVec 32) V!29327 V!29327 (_ BitVec 64)) Unit!30424)

(assert (=> b!896048 (= lt!404530 (lemmaSeekEntryGivesInRangeIndex!71 (_keys!10100 thiss!1181) (_values!5365 thiss!1181) (mask!26002 thiss!1181) (extraKeys!5074 thiss!1181) (zeroValue!5178 thiss!1181) (minValue!5178 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52539 (_ BitVec 32)) SeekEntryResult!8898)

(assert (=> b!896048 (= lt!404531 (seekEntry!0 key!785 (_keys!10100 thiss!1181) (mask!26002 thiss!1181)))))

(declare-fun b!896049 () Bool)

(declare-fun arrayContainsKey!0 (array!52539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896049 (= e!500790 (arrayContainsKey!0 (_keys!10100 thiss!1181) key!785 (index!37964 lt!404531)))))

(declare-fun b!896050 () Bool)

(declare-fun res!605967 () Bool)

(assert (=> b!896050 (=> (not res!605967) (not e!500785))))

(assert (=> b!896050 (= res!605967 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29021 () Bool)

(assert (=> mapIsEmpty!29021 mapRes!29021))

(declare-fun b!896051 () Bool)

(assert (=> b!896051 (= e!500789 (and e!500786 mapRes!29021))))

(declare-fun condMapEmpty!29021 () Bool)

(declare-fun mapDefault!29021 () ValueCell!8654)

(assert (=> b!896051 (= condMapEmpty!29021 (= (arr!25260 (_values!5365 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8654)) mapDefault!29021)))))

(declare-fun b!896052 () Bool)

(assert (=> b!896052 (= e!500784 tp_is_empty!18271)))

(declare-fun b!896053 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896053 (= e!500783 (inRange!0 (index!37964 lt!404531) (mask!26002 thiss!1181)))))

(assert (= (and start!76408 res!605968) b!896050))

(assert (= (and b!896050 res!605967) b!896048))

(assert (= (and b!896048 (not res!605965)) b!896053))

(assert (= (and b!896048 (not res!605966)) b!896049))

(assert (= (and b!896051 condMapEmpty!29021) mapIsEmpty!29021))

(assert (= (and b!896051 (not condMapEmpty!29021)) mapNonEmpty!29021))

(assert (= (and mapNonEmpty!29021 ((_ is ValueCellFull!8654) mapValue!29021)) b!896052))

(assert (= (and b!896051 ((_ is ValueCellFull!8654) mapDefault!29021)) b!896046))

(assert (= b!896047 b!896051))

(assert (= start!76408 b!896047))

(declare-fun m!832753 () Bool)

(assert (=> b!896047 m!832753))

(declare-fun m!832755 () Bool)

(assert (=> b!896047 m!832755))

(declare-fun m!832757 () Bool)

(assert (=> b!896048 m!832757))

(declare-fun m!832759 () Bool)

(assert (=> b!896048 m!832759))

(declare-fun m!832761 () Bool)

(assert (=> b!896049 m!832761))

(declare-fun m!832763 () Bool)

(assert (=> mapNonEmpty!29021 m!832763))

(declare-fun m!832765 () Bool)

(assert (=> start!76408 m!832765))

(declare-fun m!832767 () Bool)

(assert (=> b!896053 m!832767))

(check-sat b_and!26209 (not start!76408) (not mapNonEmpty!29021) tp_is_empty!18271 (not b!896047) (not b_next!15943) (not b!896049) (not b!896053) (not b!896048))
(check-sat b_and!26209 (not b_next!15943))
(get-model)

(declare-fun d!110695 () Bool)

(declare-fun res!605999 () Bool)

(declare-fun e!500841 () Bool)

(assert (=> d!110695 (=> (not res!605999) (not e!500841))))

(declare-fun simpleValid!312 (LongMapFixedSize!4324) Bool)

(assert (=> d!110695 (= res!605999 (simpleValid!312 thiss!1181))))

(assert (=> d!110695 (= (valid!1674 thiss!1181) e!500841)))

(declare-fun b!896108 () Bool)

(declare-fun res!606000 () Bool)

(assert (=> b!896108 (=> (not res!606000) (not e!500841))))

(declare-fun arrayCountValidKeys!0 (array!52539 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896108 (= res!606000 (= (arrayCountValidKeys!0 (_keys!10100 thiss!1181) #b00000000000000000000000000000000 (size!25712 (_keys!10100 thiss!1181))) (_size!2217 thiss!1181)))))

(declare-fun b!896109 () Bool)

(declare-fun res!606001 () Bool)

(assert (=> b!896109 (=> (not res!606001) (not e!500841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52539 (_ BitVec 32)) Bool)

(assert (=> b!896109 (= res!606001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10100 thiss!1181) (mask!26002 thiss!1181)))))

(declare-fun b!896110 () Bool)

(declare-datatypes ((List!17830 0))(
  ( (Nil!17827) (Cons!17826 (h!18964 (_ BitVec 64)) (t!25160 List!17830)) )
))
(declare-fun arrayNoDuplicates!0 (array!52539 (_ BitVec 32) List!17830) Bool)

(assert (=> b!896110 (= e!500841 (arrayNoDuplicates!0 (_keys!10100 thiss!1181) #b00000000000000000000000000000000 Nil!17827))))

(assert (= (and d!110695 res!605999) b!896108))

(assert (= (and b!896108 res!606000) b!896109))

(assert (= (and b!896109 res!606001) b!896110))

(declare-fun m!832801 () Bool)

(assert (=> d!110695 m!832801))

(declare-fun m!832803 () Bool)

(assert (=> b!896108 m!832803))

(declare-fun m!832805 () Bool)

(assert (=> b!896109 m!832805))

(declare-fun m!832807 () Bool)

(assert (=> b!896110 m!832807))

(assert (=> start!76408 d!110695))

(declare-fun d!110697 () Bool)

(assert (=> d!110697 (= (array_inv!19882 (_keys!10100 thiss!1181)) (bvsge (size!25712 (_keys!10100 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896047 d!110697))

(declare-fun d!110699 () Bool)

(assert (=> d!110699 (= (array_inv!19883 (_values!5365 thiss!1181)) (bvsge (size!25713 (_values!5365 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896047 d!110699))

(declare-fun d!110701 () Bool)

(declare-fun e!500844 () Bool)

(assert (=> d!110701 e!500844))

(declare-fun res!606004 () Bool)

(assert (=> d!110701 (=> res!606004 e!500844)))

(declare-fun lt!404549 () SeekEntryResult!8898)

(assert (=> d!110701 (= res!606004 (not ((_ is Found!8898) lt!404549)))))

(assert (=> d!110701 (= lt!404549 (seekEntry!0 key!785 (_keys!10100 thiss!1181) (mask!26002 thiss!1181)))))

(declare-fun lt!404548 () Unit!30424)

(declare-fun choose!1486 (array!52539 array!52541 (_ BitVec 32) (_ BitVec 32) V!29327 V!29327 (_ BitVec 64)) Unit!30424)

(assert (=> d!110701 (= lt!404548 (choose!1486 (_keys!10100 thiss!1181) (_values!5365 thiss!1181) (mask!26002 thiss!1181) (extraKeys!5074 thiss!1181) (zeroValue!5178 thiss!1181) (minValue!5178 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110701 (validMask!0 (mask!26002 thiss!1181))))

(assert (=> d!110701 (= (lemmaSeekEntryGivesInRangeIndex!71 (_keys!10100 thiss!1181) (_values!5365 thiss!1181) (mask!26002 thiss!1181) (extraKeys!5074 thiss!1181) (zeroValue!5178 thiss!1181) (minValue!5178 thiss!1181) key!785) lt!404548)))

(declare-fun b!896113 () Bool)

(assert (=> b!896113 (= e!500844 (inRange!0 (index!37964 lt!404549) (mask!26002 thiss!1181)))))

(assert (= (and d!110701 (not res!606004)) b!896113))

(assert (=> d!110701 m!832759))

(declare-fun m!832809 () Bool)

(assert (=> d!110701 m!832809))

(declare-fun m!832811 () Bool)

(assert (=> d!110701 m!832811))

(declare-fun m!832813 () Bool)

(assert (=> b!896113 m!832813))

(assert (=> b!896048 d!110701))

(declare-fun b!896126 () Bool)

(declare-fun e!500853 () SeekEntryResult!8898)

(assert (=> b!896126 (= e!500853 Undefined!8898)))

(declare-fun b!896127 () Bool)

(declare-fun e!500851 () SeekEntryResult!8898)

(assert (=> b!896127 (= e!500853 e!500851)))

(declare-fun lt!404559 () (_ BitVec 64))

(declare-fun lt!404558 () SeekEntryResult!8898)

(assert (=> b!896127 (= lt!404559 (select (arr!25259 (_keys!10100 thiss!1181)) (index!37965 lt!404558)))))

(declare-fun c!94617 () Bool)

(assert (=> b!896127 (= c!94617 (= lt!404559 key!785))))

(declare-fun b!896128 () Bool)

(assert (=> b!896128 (= e!500851 (Found!8898 (index!37965 lt!404558)))))

(declare-fun b!896129 () Bool)

(declare-fun e!500852 () SeekEntryResult!8898)

(declare-fun lt!404560 () SeekEntryResult!8898)

(assert (=> b!896129 (= e!500852 (ite ((_ is MissingVacant!8898) lt!404560) (MissingZero!8898 (index!37966 lt!404560)) lt!404560))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52539 (_ BitVec 32)) SeekEntryResult!8898)

(assert (=> b!896129 (= lt!404560 (seekKeyOrZeroReturnVacant!0 (x!76310 lt!404558) (index!37965 lt!404558) (index!37965 lt!404558) key!785 (_keys!10100 thiss!1181) (mask!26002 thiss!1181)))))

(declare-fun b!896130 () Bool)

(declare-fun c!94616 () Bool)

(assert (=> b!896130 (= c!94616 (= lt!404559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896130 (= e!500851 e!500852)))

(declare-fun d!110703 () Bool)

(declare-fun lt!404561 () SeekEntryResult!8898)

(assert (=> d!110703 (and (or ((_ is MissingVacant!8898) lt!404561) (not ((_ is Found!8898) lt!404561)) (and (bvsge (index!37964 lt!404561) #b00000000000000000000000000000000) (bvslt (index!37964 lt!404561) (size!25712 (_keys!10100 thiss!1181))))) (not ((_ is MissingVacant!8898) lt!404561)) (or (not ((_ is Found!8898) lt!404561)) (= (select (arr!25259 (_keys!10100 thiss!1181)) (index!37964 lt!404561)) key!785)))))

(assert (=> d!110703 (= lt!404561 e!500853)))

(declare-fun c!94615 () Bool)

(assert (=> d!110703 (= c!94615 (and ((_ is Intermediate!8898) lt!404558) (undefined!9710 lt!404558)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52539 (_ BitVec 32)) SeekEntryResult!8898)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110703 (= lt!404558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26002 thiss!1181)) key!785 (_keys!10100 thiss!1181) (mask!26002 thiss!1181)))))

(assert (=> d!110703 (validMask!0 (mask!26002 thiss!1181))))

(assert (=> d!110703 (= (seekEntry!0 key!785 (_keys!10100 thiss!1181) (mask!26002 thiss!1181)) lt!404561)))

(declare-fun b!896131 () Bool)

(assert (=> b!896131 (= e!500852 (MissingZero!8898 (index!37965 lt!404558)))))

(assert (= (and d!110703 c!94615) b!896126))

(assert (= (and d!110703 (not c!94615)) b!896127))

(assert (= (and b!896127 c!94617) b!896128))

(assert (= (and b!896127 (not c!94617)) b!896130))

(assert (= (and b!896130 c!94616) b!896131))

(assert (= (and b!896130 (not c!94616)) b!896129))

(declare-fun m!832815 () Bool)

(assert (=> b!896127 m!832815))

(declare-fun m!832817 () Bool)

(assert (=> b!896129 m!832817))

(declare-fun m!832819 () Bool)

(assert (=> d!110703 m!832819))

(declare-fun m!832821 () Bool)

(assert (=> d!110703 m!832821))

(assert (=> d!110703 m!832821))

(declare-fun m!832823 () Bool)

(assert (=> d!110703 m!832823))

(assert (=> d!110703 m!832811))

(assert (=> b!896048 d!110703))

(declare-fun d!110705 () Bool)

(assert (=> d!110705 (= (inRange!0 (index!37964 lt!404531) (mask!26002 thiss!1181)) (and (bvsge (index!37964 lt!404531) #b00000000000000000000000000000000) (bvslt (index!37964 lt!404531) (bvadd (mask!26002 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896053 d!110705))

(declare-fun d!110707 () Bool)

(declare-fun res!606009 () Bool)

(declare-fun e!500858 () Bool)

(assert (=> d!110707 (=> res!606009 e!500858)))

(assert (=> d!110707 (= res!606009 (= (select (arr!25259 (_keys!10100 thiss!1181)) (index!37964 lt!404531)) key!785))))

(assert (=> d!110707 (= (arrayContainsKey!0 (_keys!10100 thiss!1181) key!785 (index!37964 lt!404531)) e!500858)))

(declare-fun b!896136 () Bool)

(declare-fun e!500859 () Bool)

(assert (=> b!896136 (= e!500858 e!500859)))

(declare-fun res!606010 () Bool)

(assert (=> b!896136 (=> (not res!606010) (not e!500859))))

(assert (=> b!896136 (= res!606010 (bvslt (bvadd (index!37964 lt!404531) #b00000000000000000000000000000001) (size!25712 (_keys!10100 thiss!1181))))))

(declare-fun b!896137 () Bool)

(assert (=> b!896137 (= e!500859 (arrayContainsKey!0 (_keys!10100 thiss!1181) key!785 (bvadd (index!37964 lt!404531) #b00000000000000000000000000000001)))))

(assert (= (and d!110707 (not res!606009)) b!896136))

(assert (= (and b!896136 res!606010) b!896137))

(declare-fun m!832825 () Bool)

(assert (=> d!110707 m!832825))

(declare-fun m!832827 () Bool)

(assert (=> b!896137 m!832827))

(assert (=> b!896049 d!110707))

(declare-fun condMapEmpty!29030 () Bool)

(declare-fun mapDefault!29030 () ValueCell!8654)

(assert (=> mapNonEmpty!29021 (= condMapEmpty!29030 (= mapRest!29021 ((as const (Array (_ BitVec 32) ValueCell!8654)) mapDefault!29030)))))

(declare-fun e!500865 () Bool)

(declare-fun mapRes!29030 () Bool)

(assert (=> mapNonEmpty!29021 (= tp!55858 (and e!500865 mapRes!29030))))

(declare-fun mapNonEmpty!29030 () Bool)

(declare-fun tp!55874 () Bool)

(declare-fun e!500864 () Bool)

(assert (=> mapNonEmpty!29030 (= mapRes!29030 (and tp!55874 e!500864))))

(declare-fun mapRest!29030 () (Array (_ BitVec 32) ValueCell!8654))

(declare-fun mapKey!29030 () (_ BitVec 32))

(declare-fun mapValue!29030 () ValueCell!8654)

(assert (=> mapNonEmpty!29030 (= mapRest!29021 (store mapRest!29030 mapKey!29030 mapValue!29030))))

(declare-fun b!896144 () Bool)

(assert (=> b!896144 (= e!500864 tp_is_empty!18271)))

(declare-fun mapIsEmpty!29030 () Bool)

(assert (=> mapIsEmpty!29030 mapRes!29030))

(declare-fun b!896145 () Bool)

(assert (=> b!896145 (= e!500865 tp_is_empty!18271)))

(assert (= (and mapNonEmpty!29021 condMapEmpty!29030) mapIsEmpty!29030))

(assert (= (and mapNonEmpty!29021 (not condMapEmpty!29030)) mapNonEmpty!29030))

(assert (= (and mapNonEmpty!29030 ((_ is ValueCellFull!8654) mapValue!29030)) b!896144))

(assert (= (and mapNonEmpty!29021 ((_ is ValueCellFull!8654) mapDefault!29030)) b!896145))

(declare-fun m!832829 () Bool)

(assert (=> mapNonEmpty!29030 m!832829))

(check-sat b_and!26209 (not d!110701) (not b!896110) tp_is_empty!18271 (not d!110695) (not b!896129) (not b!896137) (not d!110703) (not b!896109) (not b!896108) (not b_next!15943) (not mapNonEmpty!29030) (not b!896113))
(check-sat b_and!26209 (not b_next!15943))
