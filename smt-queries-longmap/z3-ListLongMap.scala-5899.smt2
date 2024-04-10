; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76236 () Bool)

(assert start!76236)

(declare-fun b!895095 () Bool)

(declare-fun b_free!15897 () Bool)

(declare-fun b_next!15897 () Bool)

(assert (=> b!895095 (= b_free!15897 (not b_next!15897))))

(declare-fun tp!55693 () Bool)

(declare-fun b_and!26189 () Bool)

(assert (=> b!895095 (= tp!55693 b_and!26189)))

(declare-fun mapIsEmpty!28925 () Bool)

(declare-fun mapRes!28925 () Bool)

(assert (=> mapIsEmpty!28925 mapRes!28925))

(declare-fun b!895094 () Bool)

(declare-fun e!500077 () Bool)

(declare-datatypes ((array!52448 0))(
  ( (array!52449 (arr!25221 (Array (_ BitVec 32) (_ BitVec 64))) (size!25669 (_ BitVec 32))) )
))
(declare-datatypes ((V!29265 0))(
  ( (V!29266 (val!9163 Int)) )
))
(declare-datatypes ((ValueCell!8631 0))(
  ( (ValueCellFull!8631 (v!11653 V!29265)) (EmptyCell!8631) )
))
(declare-datatypes ((array!52450 0))(
  ( (array!52451 (arr!25222 (Array (_ BitVec 32) ValueCell!8631)) (size!25670 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4278 0))(
  ( (LongMapFixedSize!4279 (defaultEntry!5351 Int) (mask!25934 (_ BitVec 32)) (extraKeys!5047 (_ BitVec 32)) (zeroValue!5151 V!29265) (minValue!5151 V!29265) (_size!2194 (_ BitVec 32)) (_keys!10058 array!52448) (_values!5338 array!52450) (_vacant!2194 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4278)

(assert (=> b!895094 (= e!500077 (and (= (size!25670 (_values!5338 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25934 thiss!1181))) (= (size!25669 (_keys!10058 thiss!1181)) (size!25670 (_values!5338 thiss!1181))) (bvsge (mask!25934 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5047 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun e!500074 () Bool)

(declare-fun e!500071 () Bool)

(declare-fun tp_is_empty!18225 () Bool)

(declare-fun array_inv!19800 (array!52448) Bool)

(declare-fun array_inv!19801 (array!52450) Bool)

(assert (=> b!895095 (= e!500074 (and tp!55693 tp_is_empty!18225 (array_inv!19800 (_keys!10058 thiss!1181)) (array_inv!19801 (_values!5338 thiss!1181)) e!500071))))

(declare-fun b!895096 () Bool)

(declare-fun res!605582 () Bool)

(declare-fun e!500075 () Bool)

(assert (=> b!895096 (=> (not res!605582) (not e!500075))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895096 (= res!605582 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895097 () Bool)

(declare-fun e!500073 () Bool)

(assert (=> b!895097 (= e!500073 tp_is_empty!18225)))

(declare-fun res!605583 () Bool)

(assert (=> start!76236 (=> (not res!605583) (not e!500075))))

(declare-fun valid!1650 (LongMapFixedSize!4278) Bool)

(assert (=> start!76236 (= res!605583 (valid!1650 thiss!1181))))

(assert (=> start!76236 e!500075))

(assert (=> start!76236 e!500074))

(assert (=> start!76236 true))

(declare-fun mapNonEmpty!28925 () Bool)

(declare-fun tp!55692 () Bool)

(assert (=> mapNonEmpty!28925 (= mapRes!28925 (and tp!55692 e!500073))))

(declare-fun mapKey!28925 () (_ BitVec 32))

(declare-fun mapRest!28925 () (Array (_ BitVec 32) ValueCell!8631))

(declare-fun mapValue!28925 () ValueCell!8631)

(assert (=> mapNonEmpty!28925 (= (arr!25222 (_values!5338 thiss!1181)) (store mapRest!28925 mapKey!28925 mapValue!28925))))

(declare-fun b!895098 () Bool)

(declare-fun e!500072 () Bool)

(assert (=> b!895098 (= e!500072 tp_is_empty!18225)))

(declare-fun b!895099 () Bool)

(assert (=> b!895099 (= e!500071 (and e!500072 mapRes!28925))))

(declare-fun condMapEmpty!28925 () Bool)

(declare-fun mapDefault!28925 () ValueCell!8631)

(assert (=> b!895099 (= condMapEmpty!28925 (= (arr!25222 (_values!5338 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8631)) mapDefault!28925)))))

(declare-fun b!895100 () Bool)

(assert (=> b!895100 (= e!500075 e!500077)))

(declare-fun res!605581 () Bool)

(assert (=> b!895100 (=> (not res!605581) (not e!500077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895100 (= res!605581 (validMask!0 (mask!25934 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8875 0))(
  ( (MissingZero!8875 (index!37871 (_ BitVec 32))) (Found!8875 (index!37872 (_ BitVec 32))) (Intermediate!8875 (undefined!9687 Bool) (index!37873 (_ BitVec 32)) (x!76137 (_ BitVec 32))) (Undefined!8875) (MissingVacant!8875 (index!37874 (_ BitVec 32))) )
))
(declare-fun lt!404434 () SeekEntryResult!8875)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52448 (_ BitVec 32)) SeekEntryResult!8875)

(assert (=> b!895100 (= lt!404434 (seekEntry!0 key!785 (_keys!10058 thiss!1181) (mask!25934 thiss!1181)))))

(assert (= (and start!76236 res!605583) b!895096))

(assert (= (and b!895096 res!605582) b!895100))

(assert (= (and b!895100 res!605581) b!895094))

(assert (= (and b!895099 condMapEmpty!28925) mapIsEmpty!28925))

(assert (= (and b!895099 (not condMapEmpty!28925)) mapNonEmpty!28925))

(get-info :version)

(assert (= (and mapNonEmpty!28925 ((_ is ValueCellFull!8631) mapValue!28925)) b!895097))

(assert (= (and b!895099 ((_ is ValueCellFull!8631) mapDefault!28925)) b!895098))

(assert (= b!895095 b!895099))

(assert (= start!76236 b!895095))

(declare-fun m!832853 () Bool)

(assert (=> b!895095 m!832853))

(declare-fun m!832855 () Bool)

(assert (=> b!895095 m!832855))

(declare-fun m!832857 () Bool)

(assert (=> start!76236 m!832857))

(declare-fun m!832859 () Bool)

(assert (=> mapNonEmpty!28925 m!832859))

(declare-fun m!832861 () Bool)

(assert (=> b!895100 m!832861))

(declare-fun m!832863 () Bool)

(assert (=> b!895100 m!832863))

(check-sat b_and!26189 (not mapNonEmpty!28925) (not start!76236) (not b_next!15897) (not b!895095) tp_is_empty!18225 (not b!895100))
(check-sat b_and!26189 (not b_next!15897))
(get-model)

(declare-fun d!110731 () Bool)

(assert (=> d!110731 (= (validMask!0 (mask!25934 thiss!1181)) (and (or (= (mask!25934 thiss!1181) #b00000000000000000000000000000111) (= (mask!25934 thiss!1181) #b00000000000000000000000000001111) (= (mask!25934 thiss!1181) #b00000000000000000000000000011111) (= (mask!25934 thiss!1181) #b00000000000000000000000000111111) (= (mask!25934 thiss!1181) #b00000000000000000000000001111111) (= (mask!25934 thiss!1181) #b00000000000000000000000011111111) (= (mask!25934 thiss!1181) #b00000000000000000000000111111111) (= (mask!25934 thiss!1181) #b00000000000000000000001111111111) (= (mask!25934 thiss!1181) #b00000000000000000000011111111111) (= (mask!25934 thiss!1181) #b00000000000000000000111111111111) (= (mask!25934 thiss!1181) #b00000000000000000001111111111111) (= (mask!25934 thiss!1181) #b00000000000000000011111111111111) (= (mask!25934 thiss!1181) #b00000000000000000111111111111111) (= (mask!25934 thiss!1181) #b00000000000000001111111111111111) (= (mask!25934 thiss!1181) #b00000000000000011111111111111111) (= (mask!25934 thiss!1181) #b00000000000000111111111111111111) (= (mask!25934 thiss!1181) #b00000000000001111111111111111111) (= (mask!25934 thiss!1181) #b00000000000011111111111111111111) (= (mask!25934 thiss!1181) #b00000000000111111111111111111111) (= (mask!25934 thiss!1181) #b00000000001111111111111111111111) (= (mask!25934 thiss!1181) #b00000000011111111111111111111111) (= (mask!25934 thiss!1181) #b00000000111111111111111111111111) (= (mask!25934 thiss!1181) #b00000001111111111111111111111111) (= (mask!25934 thiss!1181) #b00000011111111111111111111111111) (= (mask!25934 thiss!1181) #b00000111111111111111111111111111) (= (mask!25934 thiss!1181) #b00001111111111111111111111111111) (= (mask!25934 thiss!1181) #b00011111111111111111111111111111) (= (mask!25934 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25934 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895100 d!110731))

(declare-fun b!895134 () Bool)

(declare-fun e!500105 () SeekEntryResult!8875)

(assert (=> b!895134 (= e!500105 Undefined!8875)))

(declare-fun d!110733 () Bool)

(declare-fun lt!404448 () SeekEntryResult!8875)

(assert (=> d!110733 (and (or ((_ is MissingVacant!8875) lt!404448) (not ((_ is Found!8875) lt!404448)) (and (bvsge (index!37872 lt!404448) #b00000000000000000000000000000000) (bvslt (index!37872 lt!404448) (size!25669 (_keys!10058 thiss!1181))))) (not ((_ is MissingVacant!8875) lt!404448)) (or (not ((_ is Found!8875) lt!404448)) (= (select (arr!25221 (_keys!10058 thiss!1181)) (index!37872 lt!404448)) key!785)))))

(assert (=> d!110733 (= lt!404448 e!500105)))

(declare-fun c!94504 () Bool)

(declare-fun lt!404447 () SeekEntryResult!8875)

(assert (=> d!110733 (= c!94504 (and ((_ is Intermediate!8875) lt!404447) (undefined!9687 lt!404447)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52448 (_ BitVec 32)) SeekEntryResult!8875)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110733 (= lt!404447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25934 thiss!1181)) key!785 (_keys!10058 thiss!1181) (mask!25934 thiss!1181)))))

(assert (=> d!110733 (validMask!0 (mask!25934 thiss!1181))))

(assert (=> d!110733 (= (seekEntry!0 key!785 (_keys!10058 thiss!1181) (mask!25934 thiss!1181)) lt!404448)))

(declare-fun b!895135 () Bool)

(declare-fun e!500107 () SeekEntryResult!8875)

(assert (=> b!895135 (= e!500107 (MissingZero!8875 (index!37873 lt!404447)))))

(declare-fun b!895136 () Bool)

(declare-fun lt!404449 () SeekEntryResult!8875)

(assert (=> b!895136 (= e!500107 (ite ((_ is MissingVacant!8875) lt!404449) (MissingZero!8875 (index!37874 lt!404449)) lt!404449))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52448 (_ BitVec 32)) SeekEntryResult!8875)

(assert (=> b!895136 (= lt!404449 (seekKeyOrZeroReturnVacant!0 (x!76137 lt!404447) (index!37873 lt!404447) (index!37873 lt!404447) key!785 (_keys!10058 thiss!1181) (mask!25934 thiss!1181)))))

(declare-fun b!895137 () Bool)

(declare-fun e!500106 () SeekEntryResult!8875)

(assert (=> b!895137 (= e!500106 (Found!8875 (index!37873 lt!404447)))))

(declare-fun b!895138 () Bool)

(declare-fun c!94503 () Bool)

(declare-fun lt!404446 () (_ BitVec 64))

(assert (=> b!895138 (= c!94503 (= lt!404446 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895138 (= e!500106 e!500107)))

(declare-fun b!895139 () Bool)

(assert (=> b!895139 (= e!500105 e!500106)))

(assert (=> b!895139 (= lt!404446 (select (arr!25221 (_keys!10058 thiss!1181)) (index!37873 lt!404447)))))

(declare-fun c!94505 () Bool)

(assert (=> b!895139 (= c!94505 (= lt!404446 key!785))))

(assert (= (and d!110733 c!94504) b!895134))

(assert (= (and d!110733 (not c!94504)) b!895139))

(assert (= (and b!895139 c!94505) b!895137))

(assert (= (and b!895139 (not c!94505)) b!895138))

(assert (= (and b!895138 c!94503) b!895135))

(assert (= (and b!895138 (not c!94503)) b!895136))

(declare-fun m!832877 () Bool)

(assert (=> d!110733 m!832877))

(declare-fun m!832879 () Bool)

(assert (=> d!110733 m!832879))

(assert (=> d!110733 m!832879))

(declare-fun m!832881 () Bool)

(assert (=> d!110733 m!832881))

(assert (=> d!110733 m!832861))

(declare-fun m!832883 () Bool)

(assert (=> b!895136 m!832883))

(declare-fun m!832885 () Bool)

(assert (=> b!895139 m!832885))

(assert (=> b!895100 d!110733))

(declare-fun d!110735 () Bool)

(assert (=> d!110735 (= (array_inv!19800 (_keys!10058 thiss!1181)) (bvsge (size!25669 (_keys!10058 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895095 d!110735))

(declare-fun d!110737 () Bool)

(assert (=> d!110737 (= (array_inv!19801 (_values!5338 thiss!1181)) (bvsge (size!25670 (_values!5338 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895095 d!110737))

(declare-fun d!110739 () Bool)

(declare-fun res!605599 () Bool)

(declare-fun e!500110 () Bool)

(assert (=> d!110739 (=> (not res!605599) (not e!500110))))

(declare-fun simpleValid!304 (LongMapFixedSize!4278) Bool)

(assert (=> d!110739 (= res!605599 (simpleValid!304 thiss!1181))))

(assert (=> d!110739 (= (valid!1650 thiss!1181) e!500110)))

(declare-fun b!895146 () Bool)

(declare-fun res!605600 () Bool)

(assert (=> b!895146 (=> (not res!605600) (not e!500110))))

(declare-fun arrayCountValidKeys!0 (array!52448 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895146 (= res!605600 (= (arrayCountValidKeys!0 (_keys!10058 thiss!1181) #b00000000000000000000000000000000 (size!25669 (_keys!10058 thiss!1181))) (_size!2194 thiss!1181)))))

(declare-fun b!895147 () Bool)

(declare-fun res!605601 () Bool)

(assert (=> b!895147 (=> (not res!605601) (not e!500110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52448 (_ BitVec 32)) Bool)

(assert (=> b!895147 (= res!605601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10058 thiss!1181) (mask!25934 thiss!1181)))))

(declare-fun b!895148 () Bool)

(declare-datatypes ((List!17811 0))(
  ( (Nil!17808) (Cons!17807 (h!18942 (_ BitVec 64)) (t!25150 List!17811)) )
))
(declare-fun arrayNoDuplicates!0 (array!52448 (_ BitVec 32) List!17811) Bool)

(assert (=> b!895148 (= e!500110 (arrayNoDuplicates!0 (_keys!10058 thiss!1181) #b00000000000000000000000000000000 Nil!17808))))

(assert (= (and d!110739 res!605599) b!895146))

(assert (= (and b!895146 res!605600) b!895147))

(assert (= (and b!895147 res!605601) b!895148))

(declare-fun m!832887 () Bool)

(assert (=> d!110739 m!832887))

(declare-fun m!832889 () Bool)

(assert (=> b!895146 m!832889))

(declare-fun m!832891 () Bool)

(assert (=> b!895147 m!832891))

(declare-fun m!832893 () Bool)

(assert (=> b!895148 m!832893))

(assert (=> start!76236 d!110739))

(declare-fun b!895156 () Bool)

(declare-fun e!500115 () Bool)

(assert (=> b!895156 (= e!500115 tp_is_empty!18225)))

(declare-fun b!895155 () Bool)

(declare-fun e!500116 () Bool)

(assert (=> b!895155 (= e!500116 tp_is_empty!18225)))

(declare-fun condMapEmpty!28931 () Bool)

(declare-fun mapDefault!28931 () ValueCell!8631)

(assert (=> mapNonEmpty!28925 (= condMapEmpty!28931 (= mapRest!28925 ((as const (Array (_ BitVec 32) ValueCell!8631)) mapDefault!28931)))))

(declare-fun mapRes!28931 () Bool)

(assert (=> mapNonEmpty!28925 (= tp!55692 (and e!500115 mapRes!28931))))

(declare-fun mapIsEmpty!28931 () Bool)

(assert (=> mapIsEmpty!28931 mapRes!28931))

(declare-fun mapNonEmpty!28931 () Bool)

(declare-fun tp!55702 () Bool)

(assert (=> mapNonEmpty!28931 (= mapRes!28931 (and tp!55702 e!500116))))

(declare-fun mapValue!28931 () ValueCell!8631)

(declare-fun mapKey!28931 () (_ BitVec 32))

(declare-fun mapRest!28931 () (Array (_ BitVec 32) ValueCell!8631))

(assert (=> mapNonEmpty!28931 (= mapRest!28925 (store mapRest!28931 mapKey!28931 mapValue!28931))))

(assert (= (and mapNonEmpty!28925 condMapEmpty!28931) mapIsEmpty!28931))

(assert (= (and mapNonEmpty!28925 (not condMapEmpty!28931)) mapNonEmpty!28931))

(assert (= (and mapNonEmpty!28931 ((_ is ValueCellFull!8631) mapValue!28931)) b!895155))

(assert (= (and mapNonEmpty!28925 ((_ is ValueCellFull!8631) mapDefault!28931)) b!895156))

(declare-fun m!832895 () Bool)

(assert (=> mapNonEmpty!28931 m!832895))

(check-sat (not b!895147) b_and!26189 (not d!110739) (not b!895148) (not mapNonEmpty!28931) (not b!895146) (not b_next!15897) tp_is_empty!18225 (not d!110733) (not b!895136))
(check-sat b_and!26189 (not b_next!15897))
(get-model)

(declare-fun b!895165 () Bool)

(declare-fun e!500122 () (_ BitVec 32))

(declare-fun call!39739 () (_ BitVec 32))

(assert (=> b!895165 (= e!500122 (bvadd #b00000000000000000000000000000001 call!39739))))

(declare-fun b!895166 () Bool)

(declare-fun e!500121 () (_ BitVec 32))

(assert (=> b!895166 (= e!500121 #b00000000000000000000000000000000)))

(declare-fun b!895167 () Bool)

(assert (=> b!895167 (= e!500122 call!39739)))

(declare-fun d!110741 () Bool)

(declare-fun lt!404452 () (_ BitVec 32))

(assert (=> d!110741 (and (bvsge lt!404452 #b00000000000000000000000000000000) (bvsle lt!404452 (bvsub (size!25669 (_keys!10058 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110741 (= lt!404452 e!500121)))

(declare-fun c!94511 () Bool)

(assert (=> d!110741 (= c!94511 (bvsge #b00000000000000000000000000000000 (size!25669 (_keys!10058 thiss!1181))))))

(assert (=> d!110741 (and (bvsle #b00000000000000000000000000000000 (size!25669 (_keys!10058 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25669 (_keys!10058 thiss!1181)) (size!25669 (_keys!10058 thiss!1181))))))

(assert (=> d!110741 (= (arrayCountValidKeys!0 (_keys!10058 thiss!1181) #b00000000000000000000000000000000 (size!25669 (_keys!10058 thiss!1181))) lt!404452)))

(declare-fun bm!39736 () Bool)

(assert (=> bm!39736 (= call!39739 (arrayCountValidKeys!0 (_keys!10058 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25669 (_keys!10058 thiss!1181))))))

(declare-fun b!895168 () Bool)

(assert (=> b!895168 (= e!500121 e!500122)))

(declare-fun c!94510 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895168 (= c!94510 (validKeyInArray!0 (select (arr!25221 (_keys!10058 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110741 c!94511) b!895166))

(assert (= (and d!110741 (not c!94511)) b!895168))

(assert (= (and b!895168 c!94510) b!895165))

(assert (= (and b!895168 (not c!94510)) b!895167))

(assert (= (or b!895165 b!895167) bm!39736))

(declare-fun m!832897 () Bool)

(assert (=> bm!39736 m!832897))

(declare-fun m!832899 () Bool)

(assert (=> b!895168 m!832899))

(assert (=> b!895168 m!832899))

(declare-fun m!832901 () Bool)

(assert (=> b!895168 m!832901))

(assert (=> b!895146 d!110741))

(declare-fun b!895178 () Bool)

(declare-fun res!605613 () Bool)

(declare-fun e!500125 () Bool)

(assert (=> b!895178 (=> (not res!605613) (not e!500125))))

(declare-fun size!25673 (LongMapFixedSize!4278) (_ BitVec 32))

(assert (=> b!895178 (= res!605613 (bvsge (size!25673 thiss!1181) (_size!2194 thiss!1181)))))

(declare-fun b!895177 () Bool)

(declare-fun res!605612 () Bool)

(assert (=> b!895177 (=> (not res!605612) (not e!500125))))

(assert (=> b!895177 (= res!605612 (and (= (size!25670 (_values!5338 thiss!1181)) (bvadd (mask!25934 thiss!1181) #b00000000000000000000000000000001)) (= (size!25669 (_keys!10058 thiss!1181)) (size!25670 (_values!5338 thiss!1181))) (bvsge (_size!2194 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2194 thiss!1181) (bvadd (mask!25934 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!110743 () Bool)

(declare-fun res!605610 () Bool)

(assert (=> d!110743 (=> (not res!605610) (not e!500125))))

(assert (=> d!110743 (= res!605610 (validMask!0 (mask!25934 thiss!1181)))))

(assert (=> d!110743 (= (simpleValid!304 thiss!1181) e!500125)))

(declare-fun b!895180 () Bool)

(assert (=> b!895180 (= e!500125 (and (bvsge (extraKeys!5047 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5047 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2194 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!895179 () Bool)

(declare-fun res!605611 () Bool)

(assert (=> b!895179 (=> (not res!605611) (not e!500125))))

(assert (=> b!895179 (= res!605611 (= (size!25673 thiss!1181) (bvadd (_size!2194 thiss!1181) (bvsdiv (bvadd (extraKeys!5047 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!110743 res!605610) b!895177))

(assert (= (and b!895177 res!605612) b!895178))

(assert (= (and b!895178 res!605613) b!895179))

(assert (= (and b!895179 res!605611) b!895180))

(declare-fun m!832903 () Bool)

(assert (=> b!895178 m!832903))

(assert (=> d!110743 m!832861))

(assert (=> b!895179 m!832903))

(assert (=> d!110739 d!110743))

(declare-fun b!895199 () Bool)

(declare-fun e!500140 () SeekEntryResult!8875)

(declare-fun e!500138 () SeekEntryResult!8875)

(assert (=> b!895199 (= e!500140 e!500138)))

(declare-fun c!94520 () Bool)

(declare-fun lt!404458 () (_ BitVec 64))

(assert (=> b!895199 (= c!94520 (or (= lt!404458 key!785) (= (bvadd lt!404458 lt!404458) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!895200 () Bool)

(declare-fun e!500139 () Bool)

(declare-fun e!500136 () Bool)

(assert (=> b!895200 (= e!500139 e!500136)))

(declare-fun res!605621 () Bool)

(declare-fun lt!404457 () SeekEntryResult!8875)

(assert (=> b!895200 (= res!605621 (and ((_ is Intermediate!8875) lt!404457) (not (undefined!9687 lt!404457)) (bvslt (x!76137 lt!404457) #b01111111111111111111111111111110) (bvsge (x!76137 lt!404457) #b00000000000000000000000000000000) (bvsge (x!76137 lt!404457) #b00000000000000000000000000000000)))))

(assert (=> b!895200 (=> (not res!605621) (not e!500136))))

(declare-fun b!895201 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895201 (= e!500138 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25934 thiss!1181)) #b00000000000000000000000000000000 (mask!25934 thiss!1181)) key!785 (_keys!10058 thiss!1181) (mask!25934 thiss!1181)))))

(declare-fun b!895203 () Bool)

(assert (=> b!895203 (and (bvsge (index!37873 lt!404457) #b00000000000000000000000000000000) (bvslt (index!37873 lt!404457) (size!25669 (_keys!10058 thiss!1181))))))

(declare-fun res!605620 () Bool)

(assert (=> b!895203 (= res!605620 (= (select (arr!25221 (_keys!10058 thiss!1181)) (index!37873 lt!404457)) key!785))))

(declare-fun e!500137 () Bool)

(assert (=> b!895203 (=> res!605620 e!500137)))

(assert (=> b!895203 (= e!500136 e!500137)))

(declare-fun b!895204 () Bool)

(assert (=> b!895204 (and (bvsge (index!37873 lt!404457) #b00000000000000000000000000000000) (bvslt (index!37873 lt!404457) (size!25669 (_keys!10058 thiss!1181))))))

(assert (=> b!895204 (= e!500137 (= (select (arr!25221 (_keys!10058 thiss!1181)) (index!37873 lt!404457)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!895205 () Bool)

(assert (=> b!895205 (= e!500140 (Intermediate!8875 true (toIndex!0 key!785 (mask!25934 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895206 () Bool)

(assert (=> b!895206 (= e!500138 (Intermediate!8875 false (toIndex!0 key!785 (mask!25934 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895207 () Bool)

(assert (=> b!895207 (and (bvsge (index!37873 lt!404457) #b00000000000000000000000000000000) (bvslt (index!37873 lt!404457) (size!25669 (_keys!10058 thiss!1181))))))

(declare-fun res!605622 () Bool)

(assert (=> b!895207 (= res!605622 (= (select (arr!25221 (_keys!10058 thiss!1181)) (index!37873 lt!404457)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895207 (=> res!605622 e!500137)))

(declare-fun d!110745 () Bool)

(assert (=> d!110745 e!500139))

(declare-fun c!94518 () Bool)

(assert (=> d!110745 (= c!94518 (and ((_ is Intermediate!8875) lt!404457) (undefined!9687 lt!404457)))))

(assert (=> d!110745 (= lt!404457 e!500140)))

(declare-fun c!94519 () Bool)

(assert (=> d!110745 (= c!94519 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110745 (= lt!404458 (select (arr!25221 (_keys!10058 thiss!1181)) (toIndex!0 key!785 (mask!25934 thiss!1181))))))

(assert (=> d!110745 (validMask!0 (mask!25934 thiss!1181))))

(assert (=> d!110745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25934 thiss!1181)) key!785 (_keys!10058 thiss!1181) (mask!25934 thiss!1181)) lt!404457)))

(declare-fun b!895202 () Bool)

(assert (=> b!895202 (= e!500139 (bvsge (x!76137 lt!404457) #b01111111111111111111111111111110))))

(assert (= (and d!110745 c!94519) b!895205))

(assert (= (and d!110745 (not c!94519)) b!895199))

(assert (= (and b!895199 c!94520) b!895206))

(assert (= (and b!895199 (not c!94520)) b!895201))

(assert (= (and d!110745 c!94518) b!895202))

(assert (= (and d!110745 (not c!94518)) b!895200))

(assert (= (and b!895200 res!605621) b!895203))

(assert (= (and b!895203 (not res!605620)) b!895207))

(assert (= (and b!895207 (not res!605622)) b!895204))

(declare-fun m!832905 () Bool)

(assert (=> b!895207 m!832905))

(assert (=> b!895204 m!832905))

(assert (=> b!895203 m!832905))

(assert (=> b!895201 m!832879))

(declare-fun m!832907 () Bool)

(assert (=> b!895201 m!832907))

(assert (=> b!895201 m!832907))

(declare-fun m!832909 () Bool)

(assert (=> b!895201 m!832909))

(assert (=> d!110745 m!832879))

(declare-fun m!832911 () Bool)

(assert (=> d!110745 m!832911))

(assert (=> d!110745 m!832861))

(assert (=> d!110733 d!110745))

(declare-fun d!110747 () Bool)

(declare-fun lt!404464 () (_ BitVec 32))

(declare-fun lt!404463 () (_ BitVec 32))

(assert (=> d!110747 (= lt!404464 (bvmul (bvxor lt!404463 (bvlshr lt!404463 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110747 (= lt!404463 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110747 (and (bvsge (mask!25934 thiss!1181) #b00000000000000000000000000000000) (let ((res!605623 (let ((h!18943 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76154 (bvmul (bvxor h!18943 (bvlshr h!18943 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76154 (bvlshr x!76154 #b00000000000000000000000000001101)) (mask!25934 thiss!1181)))))) (and (bvslt res!605623 (bvadd (mask!25934 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605623 #b00000000000000000000000000000000))))))

(assert (=> d!110747 (= (toIndex!0 key!785 (mask!25934 thiss!1181)) (bvand (bvxor lt!404464 (bvlshr lt!404464 #b00000000000000000000000000001101)) (mask!25934 thiss!1181)))))

(assert (=> d!110733 d!110747))

(assert (=> d!110733 d!110731))

(declare-fun bm!39739 () Bool)

(declare-fun call!39742 () Bool)

(declare-fun c!94523 () Bool)

(assert (=> bm!39739 (= call!39742 (arrayNoDuplicates!0 (_keys!10058 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94523 (Cons!17807 (select (arr!25221 (_keys!10058 thiss!1181)) #b00000000000000000000000000000000) Nil!17808) Nil!17808)))))

(declare-fun b!895218 () Bool)

(declare-fun e!500152 () Bool)

(declare-fun contains!4396 (List!17811 (_ BitVec 64)) Bool)

(assert (=> b!895218 (= e!500152 (contains!4396 Nil!17808 (select (arr!25221 (_keys!10058 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895219 () Bool)

(declare-fun e!500149 () Bool)

(declare-fun e!500150 () Bool)

(assert (=> b!895219 (= e!500149 e!500150)))

(declare-fun res!605632 () Bool)

(assert (=> b!895219 (=> (not res!605632) (not e!500150))))

(assert (=> b!895219 (= res!605632 (not e!500152))))

(declare-fun res!605631 () Bool)

(assert (=> b!895219 (=> (not res!605631) (not e!500152))))

(assert (=> b!895219 (= res!605631 (validKeyInArray!0 (select (arr!25221 (_keys!10058 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110749 () Bool)

(declare-fun res!605630 () Bool)

(assert (=> d!110749 (=> res!605630 e!500149)))

(assert (=> d!110749 (= res!605630 (bvsge #b00000000000000000000000000000000 (size!25669 (_keys!10058 thiss!1181))))))

(assert (=> d!110749 (= (arrayNoDuplicates!0 (_keys!10058 thiss!1181) #b00000000000000000000000000000000 Nil!17808) e!500149)))

(declare-fun b!895220 () Bool)

(declare-fun e!500151 () Bool)

(assert (=> b!895220 (= e!500151 call!39742)))

(declare-fun b!895221 () Bool)

(assert (=> b!895221 (= e!500151 call!39742)))

(declare-fun b!895222 () Bool)

(assert (=> b!895222 (= e!500150 e!500151)))

(assert (=> b!895222 (= c!94523 (validKeyInArray!0 (select (arr!25221 (_keys!10058 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110749 (not res!605630)) b!895219))

(assert (= (and b!895219 res!605631) b!895218))

(assert (= (and b!895219 res!605632) b!895222))

(assert (= (and b!895222 c!94523) b!895220))

(assert (= (and b!895222 (not c!94523)) b!895221))

(assert (= (or b!895220 b!895221) bm!39739))

(assert (=> bm!39739 m!832899))

(declare-fun m!832913 () Bool)

(assert (=> bm!39739 m!832913))

(assert (=> b!895218 m!832899))

(assert (=> b!895218 m!832899))

(declare-fun m!832915 () Bool)

(assert (=> b!895218 m!832915))

(assert (=> b!895219 m!832899))

(assert (=> b!895219 m!832899))

(assert (=> b!895219 m!832901))

(assert (=> b!895222 m!832899))

(assert (=> b!895222 m!832899))

(assert (=> b!895222 m!832901))

(assert (=> b!895148 d!110749))

(declare-fun b!895235 () Bool)

(declare-fun e!500160 () SeekEntryResult!8875)

(assert (=> b!895235 (= e!500160 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76137 lt!404447) #b00000000000000000000000000000001) (nextIndex!0 (index!37873 lt!404447) (x!76137 lt!404447) (mask!25934 thiss!1181)) (index!37873 lt!404447) key!785 (_keys!10058 thiss!1181) (mask!25934 thiss!1181)))))

(declare-fun b!895236 () Bool)

(assert (=> b!895236 (= e!500160 (MissingVacant!8875 (index!37873 lt!404447)))))

(declare-fun b!895238 () Bool)

(declare-fun e!500161 () SeekEntryResult!8875)

(assert (=> b!895238 (= e!500161 Undefined!8875)))

(declare-fun b!895239 () Bool)

(declare-fun c!94532 () Bool)

(declare-fun lt!404469 () (_ BitVec 64))

(assert (=> b!895239 (= c!94532 (= lt!404469 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500159 () SeekEntryResult!8875)

(assert (=> b!895239 (= e!500159 e!500160)))

(declare-fun b!895240 () Bool)

(assert (=> b!895240 (= e!500161 e!500159)))

(declare-fun c!94531 () Bool)

(assert (=> b!895240 (= c!94531 (= lt!404469 key!785))))

(declare-fun d!110751 () Bool)

(declare-fun lt!404470 () SeekEntryResult!8875)

(assert (=> d!110751 (and (or ((_ is Undefined!8875) lt!404470) (not ((_ is Found!8875) lt!404470)) (and (bvsge (index!37872 lt!404470) #b00000000000000000000000000000000) (bvslt (index!37872 lt!404470) (size!25669 (_keys!10058 thiss!1181))))) (or ((_ is Undefined!8875) lt!404470) ((_ is Found!8875) lt!404470) (not ((_ is MissingVacant!8875) lt!404470)) (not (= (index!37874 lt!404470) (index!37873 lt!404447))) (and (bvsge (index!37874 lt!404470) #b00000000000000000000000000000000) (bvslt (index!37874 lt!404470) (size!25669 (_keys!10058 thiss!1181))))) (or ((_ is Undefined!8875) lt!404470) (ite ((_ is Found!8875) lt!404470) (= (select (arr!25221 (_keys!10058 thiss!1181)) (index!37872 lt!404470)) key!785) (and ((_ is MissingVacant!8875) lt!404470) (= (index!37874 lt!404470) (index!37873 lt!404447)) (= (select (arr!25221 (_keys!10058 thiss!1181)) (index!37874 lt!404470)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110751 (= lt!404470 e!500161)))

(declare-fun c!94530 () Bool)

(assert (=> d!110751 (= c!94530 (bvsge (x!76137 lt!404447) #b01111111111111111111111111111110))))

(assert (=> d!110751 (= lt!404469 (select (arr!25221 (_keys!10058 thiss!1181)) (index!37873 lt!404447)))))

(assert (=> d!110751 (validMask!0 (mask!25934 thiss!1181))))

(assert (=> d!110751 (= (seekKeyOrZeroReturnVacant!0 (x!76137 lt!404447) (index!37873 lt!404447) (index!37873 lt!404447) key!785 (_keys!10058 thiss!1181) (mask!25934 thiss!1181)) lt!404470)))

(declare-fun b!895237 () Bool)

(assert (=> b!895237 (= e!500159 (Found!8875 (index!37873 lt!404447)))))

(assert (= (and d!110751 c!94530) b!895238))

(assert (= (and d!110751 (not c!94530)) b!895240))

(assert (= (and b!895240 c!94531) b!895237))

(assert (= (and b!895240 (not c!94531)) b!895239))

(assert (= (and b!895239 c!94532) b!895236))

(assert (= (and b!895239 (not c!94532)) b!895235))

(declare-fun m!832917 () Bool)

(assert (=> b!895235 m!832917))

(assert (=> b!895235 m!832917))

(declare-fun m!832919 () Bool)

(assert (=> b!895235 m!832919))

(declare-fun m!832921 () Bool)

(assert (=> d!110751 m!832921))

(declare-fun m!832923 () Bool)

(assert (=> d!110751 m!832923))

(assert (=> d!110751 m!832885))

(assert (=> d!110751 m!832861))

(assert (=> b!895136 d!110751))

(declare-fun b!895249 () Bool)

(declare-fun e!500168 () Bool)

(declare-fun e!500169 () Bool)

(assert (=> b!895249 (= e!500168 e!500169)))

(declare-fun c!94535 () Bool)

(assert (=> b!895249 (= c!94535 (validKeyInArray!0 (select (arr!25221 (_keys!10058 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895250 () Bool)

(declare-fun call!39745 () Bool)

(assert (=> b!895250 (= e!500169 call!39745)))

(declare-fun b!895251 () Bool)

(declare-fun e!500170 () Bool)

(assert (=> b!895251 (= e!500169 e!500170)))

(declare-fun lt!404477 () (_ BitVec 64))

(assert (=> b!895251 (= lt!404477 (select (arr!25221 (_keys!10058 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30458 0))(
  ( (Unit!30459) )
))
(declare-fun lt!404478 () Unit!30458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52448 (_ BitVec 64) (_ BitVec 32)) Unit!30458)

(assert (=> b!895251 (= lt!404478 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10058 thiss!1181) lt!404477 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895251 (arrayContainsKey!0 (_keys!10058 thiss!1181) lt!404477 #b00000000000000000000000000000000)))

(declare-fun lt!404479 () Unit!30458)

(assert (=> b!895251 (= lt!404479 lt!404478)))

(declare-fun res!605638 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52448 (_ BitVec 32)) SeekEntryResult!8875)

(assert (=> b!895251 (= res!605638 (= (seekEntryOrOpen!0 (select (arr!25221 (_keys!10058 thiss!1181)) #b00000000000000000000000000000000) (_keys!10058 thiss!1181) (mask!25934 thiss!1181)) (Found!8875 #b00000000000000000000000000000000)))))

(assert (=> b!895251 (=> (not res!605638) (not e!500170))))

(declare-fun d!110753 () Bool)

(declare-fun res!605637 () Bool)

(assert (=> d!110753 (=> res!605637 e!500168)))

(assert (=> d!110753 (= res!605637 (bvsge #b00000000000000000000000000000000 (size!25669 (_keys!10058 thiss!1181))))))

(assert (=> d!110753 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10058 thiss!1181) (mask!25934 thiss!1181)) e!500168)))

(declare-fun bm!39742 () Bool)

(assert (=> bm!39742 (= call!39745 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10058 thiss!1181) (mask!25934 thiss!1181)))))

(declare-fun b!895252 () Bool)

(assert (=> b!895252 (= e!500170 call!39745)))

(assert (= (and d!110753 (not res!605637)) b!895249))

(assert (= (and b!895249 c!94535) b!895251))

(assert (= (and b!895249 (not c!94535)) b!895250))

(assert (= (and b!895251 res!605638) b!895252))

(assert (= (or b!895252 b!895250) bm!39742))

(assert (=> b!895249 m!832899))

(assert (=> b!895249 m!832899))

(assert (=> b!895249 m!832901))

(assert (=> b!895251 m!832899))

(declare-fun m!832925 () Bool)

(assert (=> b!895251 m!832925))

(declare-fun m!832927 () Bool)

(assert (=> b!895251 m!832927))

(assert (=> b!895251 m!832899))

(declare-fun m!832929 () Bool)

(assert (=> b!895251 m!832929))

(declare-fun m!832931 () Bool)

(assert (=> bm!39742 m!832931))

(assert (=> b!895147 d!110753))

(declare-fun b!895254 () Bool)

(declare-fun e!500171 () Bool)

(assert (=> b!895254 (= e!500171 tp_is_empty!18225)))

(declare-fun b!895253 () Bool)

(declare-fun e!500172 () Bool)

(assert (=> b!895253 (= e!500172 tp_is_empty!18225)))

(declare-fun condMapEmpty!28932 () Bool)

(declare-fun mapDefault!28932 () ValueCell!8631)

(assert (=> mapNonEmpty!28931 (= condMapEmpty!28932 (= mapRest!28931 ((as const (Array (_ BitVec 32) ValueCell!8631)) mapDefault!28932)))))

(declare-fun mapRes!28932 () Bool)

(assert (=> mapNonEmpty!28931 (= tp!55702 (and e!500171 mapRes!28932))))

(declare-fun mapIsEmpty!28932 () Bool)

(assert (=> mapIsEmpty!28932 mapRes!28932))

(declare-fun mapNonEmpty!28932 () Bool)

(declare-fun tp!55703 () Bool)

(assert (=> mapNonEmpty!28932 (= mapRes!28932 (and tp!55703 e!500172))))

(declare-fun mapRest!28932 () (Array (_ BitVec 32) ValueCell!8631))

(declare-fun mapValue!28932 () ValueCell!8631)

(declare-fun mapKey!28932 () (_ BitVec 32))

(assert (=> mapNonEmpty!28932 (= mapRest!28931 (store mapRest!28932 mapKey!28932 mapValue!28932))))

(assert (= (and mapNonEmpty!28931 condMapEmpty!28932) mapIsEmpty!28932))

(assert (= (and mapNonEmpty!28931 (not condMapEmpty!28932)) mapNonEmpty!28932))

(assert (= (and mapNonEmpty!28932 ((_ is ValueCellFull!8631) mapValue!28932)) b!895253))

(assert (= (and mapNonEmpty!28931 ((_ is ValueCellFull!8631) mapDefault!28932)) b!895254))

(declare-fun m!832933 () Bool)

(assert (=> mapNonEmpty!28932 m!832933))

(check-sat (not bm!39736) b_and!26189 (not b!895168) (not b!895179) (not b!895235) (not bm!39739) (not b!895178) (not b!895222) (not b!895218) (not d!110743) (not b!895251) (not d!110745) (not b!895201) (not b!895249) tp_is_empty!18225 (not d!110751) (not bm!39742) (not b!895219) (not mapNonEmpty!28932) (not b_next!15897))
(check-sat b_and!26189 (not b_next!15897))
