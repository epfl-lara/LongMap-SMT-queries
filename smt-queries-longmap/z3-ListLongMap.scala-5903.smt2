; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76334 () Bool)

(assert start!76334)

(declare-fun b!895767 () Bool)

(declare-fun b_free!15921 () Bool)

(declare-fun b_next!15921 () Bool)

(assert (=> b!895767 (= b_free!15921 (not b_next!15921))))

(declare-fun tp!55778 () Bool)

(declare-fun b_and!26213 () Bool)

(assert (=> b!895767 (= tp!55778 b_and!26213)))

(declare-fun res!605862 () Bool)

(declare-fun e!500537 () Bool)

(assert (=> start!76334 (=> (not res!605862) (not e!500537))))

(declare-datatypes ((array!52504 0))(
  ( (array!52505 (arr!25245 (Array (_ BitVec 32) (_ BitVec 64))) (size!25695 (_ BitVec 32))) )
))
(declare-datatypes ((V!29297 0))(
  ( (V!29298 (val!9175 Int)) )
))
(declare-datatypes ((ValueCell!8643 0))(
  ( (ValueCellFull!8643 (v!11665 V!29297)) (EmptyCell!8643) )
))
(declare-datatypes ((array!52506 0))(
  ( (array!52507 (arr!25246 (Array (_ BitVec 32) ValueCell!8643)) (size!25696 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4302 0))(
  ( (LongMapFixedSize!4303 (defaultEntry!5363 Int) (mask!25972 (_ BitVec 32)) (extraKeys!5059 (_ BitVec 32)) (zeroValue!5163 V!29297) (minValue!5163 V!29297) (_size!2206 (_ BitVec 32)) (_keys!10082 array!52504) (_values!5350 array!52506) (_vacant!2206 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4302)

(declare-fun valid!1659 (LongMapFixedSize!4302) Bool)

(assert (=> start!76334 (= res!605862 (valid!1659 thiss!1181))))

(assert (=> start!76334 e!500537))

(declare-fun e!500539 () Bool)

(assert (=> start!76334 e!500539))

(assert (=> start!76334 true))

(declare-fun b!895763 () Bool)

(declare-fun e!500538 () Bool)

(declare-fun tp_is_empty!18249 () Bool)

(assert (=> b!895763 (= e!500538 tp_is_empty!18249)))

(declare-fun mapIsEmpty!28975 () Bool)

(declare-fun mapRes!28975 () Bool)

(assert (=> mapIsEmpty!28975 mapRes!28975))

(declare-fun b!895764 () Bool)

(declare-fun e!500540 () Bool)

(assert (=> b!895764 (= e!500540 tp_is_empty!18249)))

(declare-fun b!895765 () Bool)

(declare-fun e!500542 () Bool)

(assert (=> b!895765 (= e!500542 (and e!500540 mapRes!28975))))

(declare-fun condMapEmpty!28975 () Bool)

(declare-fun mapDefault!28975 () ValueCell!8643)

(assert (=> b!895765 (= condMapEmpty!28975 (= (arr!25246 (_values!5350 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8643)) mapDefault!28975)))))

(declare-fun b!895766 () Bool)

(declare-fun res!605864 () Bool)

(declare-fun e!500543 () Bool)

(assert (=> b!895766 (=> (not res!605864) (not e!500543))))

(declare-datatypes ((List!17817 0))(
  ( (Nil!17814) (Cons!17813 (h!18950 (_ BitVec 64)) (t!25156 List!17817)) )
))
(declare-fun arrayNoDuplicates!0 (array!52504 (_ BitVec 32) List!17817) Bool)

(assert (=> b!895766 (= res!605864 (arrayNoDuplicates!0 (_keys!10082 thiss!1181) #b00000000000000000000000000000000 Nil!17814))))

(declare-fun array_inv!19820 (array!52504) Bool)

(declare-fun array_inv!19821 (array!52506) Bool)

(assert (=> b!895767 (= e!500539 (and tp!55778 tp_is_empty!18249 (array_inv!19820 (_keys!10082 thiss!1181)) (array_inv!19821 (_values!5350 thiss!1181)) e!500542))))

(declare-fun b!895768 () Bool)

(declare-fun res!605866 () Bool)

(assert (=> b!895768 (=> (not res!605866) (not e!500543))))

(assert (=> b!895768 (= res!605866 (and (= (size!25696 (_values!5350 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25972 thiss!1181))) (= (size!25695 (_keys!10082 thiss!1181)) (size!25696 (_values!5350 thiss!1181))) (bvsge (mask!25972 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5059 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5059 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28975 () Bool)

(declare-fun tp!55779 () Bool)

(assert (=> mapNonEmpty!28975 (= mapRes!28975 (and tp!55779 e!500538))))

(declare-fun mapRest!28975 () (Array (_ BitVec 32) ValueCell!8643))

(declare-fun mapValue!28975 () ValueCell!8643)

(declare-fun mapKey!28975 () (_ BitVec 32))

(assert (=> mapNonEmpty!28975 (= (arr!25246 (_values!5350 thiss!1181)) (store mapRest!28975 mapKey!28975 mapValue!28975))))

(declare-fun b!895769 () Bool)

(declare-fun res!605867 () Bool)

(assert (=> b!895769 (=> (not res!605867) (not e!500543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52504 (_ BitVec 32)) Bool)

(assert (=> b!895769 (= res!605867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10082 thiss!1181) (mask!25972 thiss!1181)))))

(declare-fun b!895770 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895770 (= e!500543 (not (validKeyInArray!0 key!785)))))

(declare-fun b!895771 () Bool)

(declare-fun res!605865 () Bool)

(assert (=> b!895771 (=> (not res!605865) (not e!500537))))

(assert (=> b!895771 (= res!605865 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895772 () Bool)

(assert (=> b!895772 (= e!500537 e!500543)))

(declare-fun res!605863 () Bool)

(assert (=> b!895772 (=> (not res!605863) (not e!500543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895772 (= res!605863 (validMask!0 (mask!25972 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8886 0))(
  ( (MissingZero!8886 (index!37915 (_ BitVec 32))) (Found!8886 (index!37916 (_ BitVec 32))) (Intermediate!8886 (undefined!9698 Bool) (index!37917 (_ BitVec 32)) (x!76230 (_ BitVec 32))) (Undefined!8886) (MissingVacant!8886 (index!37918 (_ BitVec 32))) )
))
(declare-fun lt!404596 () SeekEntryResult!8886)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52504 (_ BitVec 32)) SeekEntryResult!8886)

(assert (=> b!895772 (= lt!404596 (seekEntry!0 key!785 (_keys!10082 thiss!1181) (mask!25972 thiss!1181)))))

(assert (= (and start!76334 res!605862) b!895771))

(assert (= (and b!895771 res!605865) b!895772))

(assert (= (and b!895772 res!605863) b!895768))

(assert (= (and b!895768 res!605866) b!895769))

(assert (= (and b!895769 res!605867) b!895766))

(assert (= (and b!895766 res!605864) b!895770))

(assert (= (and b!895765 condMapEmpty!28975) mapIsEmpty!28975))

(assert (= (and b!895765 (not condMapEmpty!28975)) mapNonEmpty!28975))

(get-info :version)

(assert (= (and mapNonEmpty!28975 ((_ is ValueCellFull!8643) mapValue!28975)) b!895763))

(assert (= (and b!895765 ((_ is ValueCellFull!8643) mapDefault!28975)) b!895764))

(assert (= b!895767 b!895765))

(assert (= start!76334 b!895767))

(declare-fun m!833199 () Bool)

(assert (=> b!895769 m!833199))

(declare-fun m!833201 () Bool)

(assert (=> start!76334 m!833201))

(declare-fun m!833203 () Bool)

(assert (=> b!895770 m!833203))

(declare-fun m!833205 () Bool)

(assert (=> mapNonEmpty!28975 m!833205))

(declare-fun m!833207 () Bool)

(assert (=> b!895767 m!833207))

(declare-fun m!833209 () Bool)

(assert (=> b!895767 m!833209))

(declare-fun m!833211 () Bool)

(assert (=> b!895772 m!833211))

(declare-fun m!833213 () Bool)

(assert (=> b!895772 m!833213))

(declare-fun m!833215 () Bool)

(assert (=> b!895766 m!833215))

(check-sat (not b!895766) b_and!26213 (not b!895769) (not mapNonEmpty!28975) (not b!895772) tp_is_empty!18249 (not start!76334) (not b!895770) (not b!895767) (not b_next!15921))
(check-sat b_and!26213 (not b_next!15921))
(get-model)

(declare-fun d!110813 () Bool)

(assert (=> d!110813 (= (array_inv!19820 (_keys!10082 thiss!1181)) (bvsge (size!25695 (_keys!10082 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895767 d!110813))

(declare-fun d!110815 () Bool)

(assert (=> d!110815 (= (array_inv!19821 (_values!5350 thiss!1181)) (bvsge (size!25696 (_values!5350 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895767 d!110815))

(declare-fun d!110817 () Bool)

(assert (=> d!110817 (= (validMask!0 (mask!25972 thiss!1181)) (and (or (= (mask!25972 thiss!1181) #b00000000000000000000000000000111) (= (mask!25972 thiss!1181) #b00000000000000000000000000001111) (= (mask!25972 thiss!1181) #b00000000000000000000000000011111) (= (mask!25972 thiss!1181) #b00000000000000000000000000111111) (= (mask!25972 thiss!1181) #b00000000000000000000000001111111) (= (mask!25972 thiss!1181) #b00000000000000000000000011111111) (= (mask!25972 thiss!1181) #b00000000000000000000000111111111) (= (mask!25972 thiss!1181) #b00000000000000000000001111111111) (= (mask!25972 thiss!1181) #b00000000000000000000011111111111) (= (mask!25972 thiss!1181) #b00000000000000000000111111111111) (= (mask!25972 thiss!1181) #b00000000000000000001111111111111) (= (mask!25972 thiss!1181) #b00000000000000000011111111111111) (= (mask!25972 thiss!1181) #b00000000000000000111111111111111) (= (mask!25972 thiss!1181) #b00000000000000001111111111111111) (= (mask!25972 thiss!1181) #b00000000000000011111111111111111) (= (mask!25972 thiss!1181) #b00000000000000111111111111111111) (= (mask!25972 thiss!1181) #b00000000000001111111111111111111) (= (mask!25972 thiss!1181) #b00000000000011111111111111111111) (= (mask!25972 thiss!1181) #b00000000000111111111111111111111) (= (mask!25972 thiss!1181) #b00000000001111111111111111111111) (= (mask!25972 thiss!1181) #b00000000011111111111111111111111) (= (mask!25972 thiss!1181) #b00000000111111111111111111111111) (= (mask!25972 thiss!1181) #b00000001111111111111111111111111) (= (mask!25972 thiss!1181) #b00000011111111111111111111111111) (= (mask!25972 thiss!1181) #b00000111111111111111111111111111) (= (mask!25972 thiss!1181) #b00001111111111111111111111111111) (= (mask!25972 thiss!1181) #b00011111111111111111111111111111) (= (mask!25972 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25972 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895772 d!110817))

(declare-fun b!895815 () Bool)

(declare-fun e!500571 () SeekEntryResult!8886)

(declare-fun lt!404609 () SeekEntryResult!8886)

(assert (=> b!895815 (= e!500571 (ite ((_ is MissingVacant!8886) lt!404609) (MissingZero!8886 (index!37918 lt!404609)) lt!404609))))

(declare-fun lt!404611 () SeekEntryResult!8886)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52504 (_ BitVec 32)) SeekEntryResult!8886)

(assert (=> b!895815 (= lt!404609 (seekKeyOrZeroReturnVacant!0 (x!76230 lt!404611) (index!37917 lt!404611) (index!37917 lt!404611) key!785 (_keys!10082 thiss!1181) (mask!25972 thiss!1181)))))

(declare-fun b!895816 () Bool)

(declare-fun e!500573 () SeekEntryResult!8886)

(assert (=> b!895816 (= e!500573 Undefined!8886)))

(declare-fun d!110819 () Bool)

(declare-fun lt!404608 () SeekEntryResult!8886)

(assert (=> d!110819 (and (or ((_ is MissingVacant!8886) lt!404608) (not ((_ is Found!8886) lt!404608)) (and (bvsge (index!37916 lt!404608) #b00000000000000000000000000000000) (bvslt (index!37916 lt!404608) (size!25695 (_keys!10082 thiss!1181))))) (not ((_ is MissingVacant!8886) lt!404608)) (or (not ((_ is Found!8886) lt!404608)) (= (select (arr!25245 (_keys!10082 thiss!1181)) (index!37916 lt!404608)) key!785)))))

(assert (=> d!110819 (= lt!404608 e!500573)))

(declare-fun c!94609 () Bool)

(assert (=> d!110819 (= c!94609 (and ((_ is Intermediate!8886) lt!404611) (undefined!9698 lt!404611)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52504 (_ BitVec 32)) SeekEntryResult!8886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110819 (= lt!404611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25972 thiss!1181)) key!785 (_keys!10082 thiss!1181) (mask!25972 thiss!1181)))))

(assert (=> d!110819 (validMask!0 (mask!25972 thiss!1181))))

(assert (=> d!110819 (= (seekEntry!0 key!785 (_keys!10082 thiss!1181) (mask!25972 thiss!1181)) lt!404608)))

(declare-fun b!895817 () Bool)

(declare-fun e!500572 () SeekEntryResult!8886)

(assert (=> b!895817 (= e!500573 e!500572)))

(declare-fun lt!404610 () (_ BitVec 64))

(assert (=> b!895817 (= lt!404610 (select (arr!25245 (_keys!10082 thiss!1181)) (index!37917 lt!404611)))))

(declare-fun c!94610 () Bool)

(assert (=> b!895817 (= c!94610 (= lt!404610 key!785))))

(declare-fun b!895818 () Bool)

(assert (=> b!895818 (= e!500571 (MissingZero!8886 (index!37917 lt!404611)))))

(declare-fun b!895819 () Bool)

(declare-fun c!94608 () Bool)

(assert (=> b!895819 (= c!94608 (= lt!404610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895819 (= e!500572 e!500571)))

(declare-fun b!895820 () Bool)

(assert (=> b!895820 (= e!500572 (Found!8886 (index!37917 lt!404611)))))

(assert (= (and d!110819 c!94609) b!895816))

(assert (= (and d!110819 (not c!94609)) b!895817))

(assert (= (and b!895817 c!94610) b!895820))

(assert (= (and b!895817 (not c!94610)) b!895819))

(assert (= (and b!895819 c!94608) b!895818))

(assert (= (and b!895819 (not c!94608)) b!895815))

(declare-fun m!833235 () Bool)

(assert (=> b!895815 m!833235))

(declare-fun m!833237 () Bool)

(assert (=> d!110819 m!833237))

(declare-fun m!833239 () Bool)

(assert (=> d!110819 m!833239))

(assert (=> d!110819 m!833239))

(declare-fun m!833241 () Bool)

(assert (=> d!110819 m!833241))

(assert (=> d!110819 m!833211))

(declare-fun m!833243 () Bool)

(assert (=> b!895817 m!833243))

(assert (=> b!895772 d!110819))

(declare-fun b!895829 () Bool)

(declare-fun e!500582 () Bool)

(declare-fun call!39766 () Bool)

(assert (=> b!895829 (= e!500582 call!39766)))

(declare-fun b!895830 () Bool)

(declare-fun e!500580 () Bool)

(assert (=> b!895830 (= e!500580 call!39766)))

(declare-fun b!895831 () Bool)

(assert (=> b!895831 (= e!500582 e!500580)))

(declare-fun lt!404618 () (_ BitVec 64))

(assert (=> b!895831 (= lt!404618 (select (arr!25245 (_keys!10082 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30466 0))(
  ( (Unit!30467) )
))
(declare-fun lt!404619 () Unit!30466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52504 (_ BitVec 64) (_ BitVec 32)) Unit!30466)

(assert (=> b!895831 (= lt!404619 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10082 thiss!1181) lt!404618 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895831 (arrayContainsKey!0 (_keys!10082 thiss!1181) lt!404618 #b00000000000000000000000000000000)))

(declare-fun lt!404620 () Unit!30466)

(assert (=> b!895831 (= lt!404620 lt!404619)))

(declare-fun res!605890 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52504 (_ BitVec 32)) SeekEntryResult!8886)

(assert (=> b!895831 (= res!605890 (= (seekEntryOrOpen!0 (select (arr!25245 (_keys!10082 thiss!1181)) #b00000000000000000000000000000000) (_keys!10082 thiss!1181) (mask!25972 thiss!1181)) (Found!8886 #b00000000000000000000000000000000)))))

(assert (=> b!895831 (=> (not res!605890) (not e!500580))))

(declare-fun b!895832 () Bool)

(declare-fun e!500581 () Bool)

(assert (=> b!895832 (= e!500581 e!500582)))

(declare-fun c!94613 () Bool)

(assert (=> b!895832 (= c!94613 (validKeyInArray!0 (select (arr!25245 (_keys!10082 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39763 () Bool)

(assert (=> bm!39763 (= call!39766 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10082 thiss!1181) (mask!25972 thiss!1181)))))

(declare-fun d!110821 () Bool)

(declare-fun res!605891 () Bool)

(assert (=> d!110821 (=> res!605891 e!500581)))

(assert (=> d!110821 (= res!605891 (bvsge #b00000000000000000000000000000000 (size!25695 (_keys!10082 thiss!1181))))))

(assert (=> d!110821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10082 thiss!1181) (mask!25972 thiss!1181)) e!500581)))

(assert (= (and d!110821 (not res!605891)) b!895832))

(assert (= (and b!895832 c!94613) b!895831))

(assert (= (and b!895832 (not c!94613)) b!895829))

(assert (= (and b!895831 res!605890) b!895830))

(assert (= (or b!895830 b!895829) bm!39763))

(declare-fun m!833245 () Bool)

(assert (=> b!895831 m!833245))

(declare-fun m!833247 () Bool)

(assert (=> b!895831 m!833247))

(declare-fun m!833249 () Bool)

(assert (=> b!895831 m!833249))

(assert (=> b!895831 m!833245))

(declare-fun m!833251 () Bool)

(assert (=> b!895831 m!833251))

(assert (=> b!895832 m!833245))

(assert (=> b!895832 m!833245))

(declare-fun m!833253 () Bool)

(assert (=> b!895832 m!833253))

(declare-fun m!833255 () Bool)

(assert (=> bm!39763 m!833255))

(assert (=> b!895769 d!110821))

(declare-fun d!110823 () Bool)

(assert (=> d!110823 (= (validKeyInArray!0 key!785) (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!895770 d!110823))

(declare-fun b!895843 () Bool)

(declare-fun e!500593 () Bool)

(declare-fun call!39769 () Bool)

(assert (=> b!895843 (= e!500593 call!39769)))

(declare-fun b!895845 () Bool)

(declare-fun e!500592 () Bool)

(declare-fun e!500591 () Bool)

(assert (=> b!895845 (= e!500592 e!500591)))

(declare-fun res!605900 () Bool)

(assert (=> b!895845 (=> (not res!605900) (not e!500591))))

(declare-fun e!500594 () Bool)

(assert (=> b!895845 (= res!605900 (not e!500594))))

(declare-fun res!605899 () Bool)

(assert (=> b!895845 (=> (not res!605899) (not e!500594))))

(assert (=> b!895845 (= res!605899 (validKeyInArray!0 (select (arr!25245 (_keys!10082 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895846 () Bool)

(declare-fun contains!4399 (List!17817 (_ BitVec 64)) Bool)

(assert (=> b!895846 (= e!500594 (contains!4399 Nil!17814 (select (arr!25245 (_keys!10082 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110825 () Bool)

(declare-fun res!605898 () Bool)

(assert (=> d!110825 (=> res!605898 e!500592)))

(assert (=> d!110825 (= res!605898 (bvsge #b00000000000000000000000000000000 (size!25695 (_keys!10082 thiss!1181))))))

(assert (=> d!110825 (= (arrayNoDuplicates!0 (_keys!10082 thiss!1181) #b00000000000000000000000000000000 Nil!17814) e!500592)))

(declare-fun b!895844 () Bool)

(assert (=> b!895844 (= e!500593 call!39769)))

(declare-fun b!895847 () Bool)

(assert (=> b!895847 (= e!500591 e!500593)))

(declare-fun c!94616 () Bool)

(assert (=> b!895847 (= c!94616 (validKeyInArray!0 (select (arr!25245 (_keys!10082 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39766 () Bool)

(assert (=> bm!39766 (= call!39769 (arrayNoDuplicates!0 (_keys!10082 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94616 (Cons!17813 (select (arr!25245 (_keys!10082 thiss!1181)) #b00000000000000000000000000000000) Nil!17814) Nil!17814)))))

(assert (= (and d!110825 (not res!605898)) b!895845))

(assert (= (and b!895845 res!605899) b!895846))

(assert (= (and b!895845 res!605900) b!895847))

(assert (= (and b!895847 c!94616) b!895843))

(assert (= (and b!895847 (not c!94616)) b!895844))

(assert (= (or b!895843 b!895844) bm!39766))

(assert (=> b!895845 m!833245))

(assert (=> b!895845 m!833245))

(assert (=> b!895845 m!833253))

(assert (=> b!895846 m!833245))

(assert (=> b!895846 m!833245))

(declare-fun m!833257 () Bool)

(assert (=> b!895846 m!833257))

(assert (=> b!895847 m!833245))

(assert (=> b!895847 m!833245))

(assert (=> b!895847 m!833253))

(assert (=> bm!39766 m!833245))

(declare-fun m!833259 () Bool)

(assert (=> bm!39766 m!833259))

(assert (=> b!895766 d!110825))

(declare-fun d!110827 () Bool)

(declare-fun res!605907 () Bool)

(declare-fun e!500597 () Bool)

(assert (=> d!110827 (=> (not res!605907) (not e!500597))))

(declare-fun simpleValid!308 (LongMapFixedSize!4302) Bool)

(assert (=> d!110827 (= res!605907 (simpleValid!308 thiss!1181))))

(assert (=> d!110827 (= (valid!1659 thiss!1181) e!500597)))

(declare-fun b!895854 () Bool)

(declare-fun res!605908 () Bool)

(assert (=> b!895854 (=> (not res!605908) (not e!500597))))

(declare-fun arrayCountValidKeys!0 (array!52504 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895854 (= res!605908 (= (arrayCountValidKeys!0 (_keys!10082 thiss!1181) #b00000000000000000000000000000000 (size!25695 (_keys!10082 thiss!1181))) (_size!2206 thiss!1181)))))

(declare-fun b!895855 () Bool)

(declare-fun res!605909 () Bool)

(assert (=> b!895855 (=> (not res!605909) (not e!500597))))

(assert (=> b!895855 (= res!605909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10082 thiss!1181) (mask!25972 thiss!1181)))))

(declare-fun b!895856 () Bool)

(assert (=> b!895856 (= e!500597 (arrayNoDuplicates!0 (_keys!10082 thiss!1181) #b00000000000000000000000000000000 Nil!17814))))

(assert (= (and d!110827 res!605907) b!895854))

(assert (= (and b!895854 res!605908) b!895855))

(assert (= (and b!895855 res!605909) b!895856))

(declare-fun m!833261 () Bool)

(assert (=> d!110827 m!833261))

(declare-fun m!833263 () Bool)

(assert (=> b!895854 m!833263))

(assert (=> b!895855 m!833199))

(assert (=> b!895856 m!833215))

(assert (=> start!76334 d!110827))

(declare-fun mapIsEmpty!28981 () Bool)

(declare-fun mapRes!28981 () Bool)

(assert (=> mapIsEmpty!28981 mapRes!28981))

(declare-fun b!895863 () Bool)

(declare-fun e!500602 () Bool)

(assert (=> b!895863 (= e!500602 tp_is_empty!18249)))

(declare-fun condMapEmpty!28981 () Bool)

(declare-fun mapDefault!28981 () ValueCell!8643)

(assert (=> mapNonEmpty!28975 (= condMapEmpty!28981 (= mapRest!28975 ((as const (Array (_ BitVec 32) ValueCell!8643)) mapDefault!28981)))))

(declare-fun e!500603 () Bool)

(assert (=> mapNonEmpty!28975 (= tp!55779 (and e!500603 mapRes!28981))))

(declare-fun b!895864 () Bool)

(assert (=> b!895864 (= e!500603 tp_is_empty!18249)))

(declare-fun mapNonEmpty!28981 () Bool)

(declare-fun tp!55788 () Bool)

(assert (=> mapNonEmpty!28981 (= mapRes!28981 (and tp!55788 e!500602))))

(declare-fun mapKey!28981 () (_ BitVec 32))

(declare-fun mapRest!28981 () (Array (_ BitVec 32) ValueCell!8643))

(declare-fun mapValue!28981 () ValueCell!8643)

(assert (=> mapNonEmpty!28981 (= mapRest!28975 (store mapRest!28981 mapKey!28981 mapValue!28981))))

(assert (= (and mapNonEmpty!28975 condMapEmpty!28981) mapIsEmpty!28981))

(assert (= (and mapNonEmpty!28975 (not condMapEmpty!28981)) mapNonEmpty!28981))

(assert (= (and mapNonEmpty!28981 ((_ is ValueCellFull!8643) mapValue!28981)) b!895863))

(assert (= (and mapNonEmpty!28975 ((_ is ValueCellFull!8643) mapDefault!28981)) b!895864))

(declare-fun m!833265 () Bool)

(assert (=> mapNonEmpty!28981 m!833265))

(check-sat (not d!110819) b_and!26213 (not mapNonEmpty!28981) (not b!895845) (not b!895854) (not b!895832) (not bm!39763) (not bm!39766) (not b_next!15921) (not b!895847) (not b!895831) (not b!895846) (not b!895855) (not b!895856) (not b!895815) tp_is_empty!18249 (not d!110827))
(check-sat b_and!26213 (not b_next!15921))
