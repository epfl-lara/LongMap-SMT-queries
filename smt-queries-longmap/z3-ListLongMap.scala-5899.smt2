; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76402 () Bool)

(assert start!76402)

(declare-fun b!895981 () Bool)

(declare-fun b_free!15895 () Bool)

(declare-fun b_next!15895 () Bool)

(assert (=> b!895981 (= b_free!15895 (not b_next!15895))))

(declare-fun tp!55688 () Bool)

(declare-fun b_and!26197 () Bool)

(assert (=> b!895981 (= tp!55688 b_and!26197)))

(declare-fun b!895976 () Bool)

(declare-fun e!500637 () Bool)

(declare-fun e!500633 () Bool)

(declare-fun mapRes!28922 () Bool)

(assert (=> b!895976 (= e!500637 (and e!500633 mapRes!28922))))

(declare-fun condMapEmpty!28922 () Bool)

(declare-datatypes ((array!52483 0))(
  ( (array!52484 (arr!25234 (Array (_ BitVec 32) (_ BitVec 64))) (size!25683 (_ BitVec 32))) )
))
(declare-datatypes ((V!29263 0))(
  ( (V!29264 (val!9162 Int)) )
))
(declare-datatypes ((ValueCell!8630 0))(
  ( (ValueCellFull!8630 (v!11649 V!29263)) (EmptyCell!8630) )
))
(declare-datatypes ((array!52485 0))(
  ( (array!52486 (arr!25235 (Array (_ BitVec 32) ValueCell!8630)) (size!25684 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4276 0))(
  ( (LongMapFixedSize!4277 (defaultEntry!5350 Int) (mask!25976 (_ BitVec 32)) (extraKeys!5046 (_ BitVec 32)) (zeroValue!5150 V!29263) (minValue!5150 V!29263) (_size!2193 (_ BitVec 32)) (_keys!10085 array!52483) (_values!5337 array!52485) (_vacant!2193 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4276)

(declare-fun mapDefault!28922 () ValueCell!8630)

(assert (=> b!895976 (= condMapEmpty!28922 (= (arr!25235 (_values!5337 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8630)) mapDefault!28922)))))

(declare-fun mapNonEmpty!28922 () Bool)

(declare-fun tp!55687 () Bool)

(declare-fun e!500632 () Bool)

(assert (=> mapNonEmpty!28922 (= mapRes!28922 (and tp!55687 e!500632))))

(declare-fun mapKey!28922 () (_ BitVec 32))

(declare-fun mapValue!28922 () ValueCell!8630)

(declare-fun mapRest!28922 () (Array (_ BitVec 32) ValueCell!8630))

(assert (=> mapNonEmpty!28922 (= (arr!25235 (_values!5337 thiss!1181)) (store mapRest!28922 mapKey!28922 mapValue!28922))))

(declare-fun b!895977 () Bool)

(declare-fun e!500635 () Bool)

(assert (=> b!895977 (= e!500635 (and (= (size!25684 (_values!5337 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25976 thiss!1181))) (= (size!25683 (_keys!10085 thiss!1181)) (size!25684 (_values!5337 thiss!1181))) (bvsge (mask!25976 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5046 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!895978 () Bool)

(declare-fun tp_is_empty!18223 () Bool)

(assert (=> b!895978 (= e!500633 tp_is_empty!18223)))

(declare-fun res!605918 () Bool)

(declare-fun e!500638 () Bool)

(assert (=> start!76402 (=> (not res!605918) (not e!500638))))

(declare-fun valid!1663 (LongMapFixedSize!4276) Bool)

(assert (=> start!76402 (= res!605918 (valid!1663 thiss!1181))))

(assert (=> start!76402 e!500638))

(declare-fun e!500634 () Bool)

(assert (=> start!76402 e!500634))

(assert (=> start!76402 true))

(declare-fun b!895979 () Bool)

(assert (=> b!895979 (= e!500632 tp_is_empty!18223)))

(declare-fun b!895980 () Bool)

(assert (=> b!895980 (= e!500638 e!500635)))

(declare-fun res!605916 () Bool)

(assert (=> b!895980 (=> (not res!605916) (not e!500635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895980 (= res!605916 (validMask!0 (mask!25976 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8829 0))(
  ( (MissingZero!8829 (index!37687 (_ BitVec 32))) (Found!8829 (index!37688 (_ BitVec 32))) (Intermediate!8829 (undefined!9641 Bool) (index!37689 (_ BitVec 32)) (x!76105 (_ BitVec 32))) (Undefined!8829) (MissingVacant!8829 (index!37690 (_ BitVec 32))) )
))
(declare-fun lt!404792 () SeekEntryResult!8829)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52483 (_ BitVec 32)) SeekEntryResult!8829)

(assert (=> b!895980 (= lt!404792 (seekEntry!0 key!785 (_keys!10085 thiss!1181) (mask!25976 thiss!1181)))))

(declare-fun array_inv!19860 (array!52483) Bool)

(declare-fun array_inv!19861 (array!52485) Bool)

(assert (=> b!895981 (= e!500634 (and tp!55688 tp_is_empty!18223 (array_inv!19860 (_keys!10085 thiss!1181)) (array_inv!19861 (_values!5337 thiss!1181)) e!500637))))

(declare-fun mapIsEmpty!28922 () Bool)

(assert (=> mapIsEmpty!28922 mapRes!28922))

(declare-fun b!895982 () Bool)

(declare-fun res!605917 () Bool)

(assert (=> b!895982 (=> (not res!605917) (not e!500638))))

(assert (=> b!895982 (= res!605917 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!76402 res!605918) b!895982))

(assert (= (and b!895982 res!605917) b!895980))

(assert (= (and b!895980 res!605916) b!895977))

(assert (= (and b!895976 condMapEmpty!28922) mapIsEmpty!28922))

(assert (= (and b!895976 (not condMapEmpty!28922)) mapNonEmpty!28922))

(get-info :version)

(assert (= (and mapNonEmpty!28922 ((_ is ValueCellFull!8630) mapValue!28922)) b!895979))

(assert (= (and b!895976 ((_ is ValueCellFull!8630) mapDefault!28922)) b!895978))

(assert (= b!895981 b!895976))

(assert (= start!76402 b!895981))

(declare-fun m!834135 () Bool)

(assert (=> mapNonEmpty!28922 m!834135))

(declare-fun m!834137 () Bool)

(assert (=> start!76402 m!834137))

(declare-fun m!834139 () Bool)

(assert (=> b!895980 m!834139))

(declare-fun m!834141 () Bool)

(assert (=> b!895980 m!834141))

(declare-fun m!834143 () Bool)

(assert (=> b!895981 m!834143))

(declare-fun m!834145 () Bool)

(assert (=> b!895981 m!834145))

(check-sat (not b!895980) (not start!76402) tp_is_empty!18223 b_and!26197 (not b_next!15895) (not b!895981) (not mapNonEmpty!28922))
(check-sat b_and!26197 (not b_next!15895))
(get-model)

(declare-fun d!111053 () Bool)

(assert (=> d!111053 (= (array_inv!19860 (_keys!10085 thiss!1181)) (bvsge (size!25683 (_keys!10085 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895981 d!111053))

(declare-fun d!111055 () Bool)

(assert (=> d!111055 (= (array_inv!19861 (_values!5337 thiss!1181)) (bvsge (size!25684 (_values!5337 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895981 d!111055))

(declare-fun d!111057 () Bool)

(assert (=> d!111057 (= (validMask!0 (mask!25976 thiss!1181)) (and (or (= (mask!25976 thiss!1181) #b00000000000000000000000000000111) (= (mask!25976 thiss!1181) #b00000000000000000000000000001111) (= (mask!25976 thiss!1181) #b00000000000000000000000000011111) (= (mask!25976 thiss!1181) #b00000000000000000000000000111111) (= (mask!25976 thiss!1181) #b00000000000000000000000001111111) (= (mask!25976 thiss!1181) #b00000000000000000000000011111111) (= (mask!25976 thiss!1181) #b00000000000000000000000111111111) (= (mask!25976 thiss!1181) #b00000000000000000000001111111111) (= (mask!25976 thiss!1181) #b00000000000000000000011111111111) (= (mask!25976 thiss!1181) #b00000000000000000000111111111111) (= (mask!25976 thiss!1181) #b00000000000000000001111111111111) (= (mask!25976 thiss!1181) #b00000000000000000011111111111111) (= (mask!25976 thiss!1181) #b00000000000000000111111111111111) (= (mask!25976 thiss!1181) #b00000000000000001111111111111111) (= (mask!25976 thiss!1181) #b00000000000000011111111111111111) (= (mask!25976 thiss!1181) #b00000000000000111111111111111111) (= (mask!25976 thiss!1181) #b00000000000001111111111111111111) (= (mask!25976 thiss!1181) #b00000000000011111111111111111111) (= (mask!25976 thiss!1181) #b00000000000111111111111111111111) (= (mask!25976 thiss!1181) #b00000000001111111111111111111111) (= (mask!25976 thiss!1181) #b00000000011111111111111111111111) (= (mask!25976 thiss!1181) #b00000000111111111111111111111111) (= (mask!25976 thiss!1181) #b00000001111111111111111111111111) (= (mask!25976 thiss!1181) #b00000011111111111111111111111111) (= (mask!25976 thiss!1181) #b00000111111111111111111111111111) (= (mask!25976 thiss!1181) #b00001111111111111111111111111111) (= (mask!25976 thiss!1181) #b00011111111111111111111111111111) (= (mask!25976 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25976 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895980 d!111057))

(declare-fun b!896037 () Bool)

(declare-fun c!94786 () Bool)

(declare-fun lt!404807 () (_ BitVec 64))

(assert (=> b!896037 (= c!94786 (= lt!404807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500688 () SeekEntryResult!8829)

(declare-fun e!500689 () SeekEntryResult!8829)

(assert (=> b!896037 (= e!500688 e!500689)))

(declare-fun b!896038 () Bool)

(declare-fun lt!404810 () SeekEntryResult!8829)

(assert (=> b!896038 (= e!500689 (ite ((_ is MissingVacant!8829) lt!404810) (MissingZero!8829 (index!37690 lt!404810)) lt!404810))))

(declare-fun lt!404808 () SeekEntryResult!8829)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52483 (_ BitVec 32)) SeekEntryResult!8829)

(assert (=> b!896038 (= lt!404810 (seekKeyOrZeroReturnVacant!0 (x!76105 lt!404808) (index!37689 lt!404808) (index!37689 lt!404808) key!785 (_keys!10085 thiss!1181) (mask!25976 thiss!1181)))))

(declare-fun b!896039 () Bool)

(assert (=> b!896039 (= e!500688 (Found!8829 (index!37689 lt!404808)))))

(declare-fun d!111059 () Bool)

(declare-fun lt!404809 () SeekEntryResult!8829)

(assert (=> d!111059 (and (or ((_ is MissingVacant!8829) lt!404809) (not ((_ is Found!8829) lt!404809)) (and (bvsge (index!37688 lt!404809) #b00000000000000000000000000000000) (bvslt (index!37688 lt!404809) (size!25683 (_keys!10085 thiss!1181))))) (not ((_ is MissingVacant!8829) lt!404809)) (or (not ((_ is Found!8829) lt!404809)) (= (select (arr!25234 (_keys!10085 thiss!1181)) (index!37688 lt!404809)) key!785)))))

(declare-fun e!500687 () SeekEntryResult!8829)

(assert (=> d!111059 (= lt!404809 e!500687)))

(declare-fun c!94785 () Bool)

(assert (=> d!111059 (= c!94785 (and ((_ is Intermediate!8829) lt!404808) (undefined!9641 lt!404808)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52483 (_ BitVec 32)) SeekEntryResult!8829)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111059 (= lt!404808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25976 thiss!1181)) key!785 (_keys!10085 thiss!1181) (mask!25976 thiss!1181)))))

(assert (=> d!111059 (validMask!0 (mask!25976 thiss!1181))))

(assert (=> d!111059 (= (seekEntry!0 key!785 (_keys!10085 thiss!1181) (mask!25976 thiss!1181)) lt!404809)))

(declare-fun b!896040 () Bool)

(assert (=> b!896040 (= e!500687 e!500688)))

(assert (=> b!896040 (= lt!404807 (select (arr!25234 (_keys!10085 thiss!1181)) (index!37689 lt!404808)))))

(declare-fun c!94787 () Bool)

(assert (=> b!896040 (= c!94787 (= lt!404807 key!785))))

(declare-fun b!896041 () Bool)

(assert (=> b!896041 (= e!500687 Undefined!8829)))

(declare-fun b!896042 () Bool)

(assert (=> b!896042 (= e!500689 (MissingZero!8829 (index!37689 lt!404808)))))

(assert (= (and d!111059 c!94785) b!896041))

(assert (= (and d!111059 (not c!94785)) b!896040))

(assert (= (and b!896040 c!94787) b!896039))

(assert (= (and b!896040 (not c!94787)) b!896037))

(assert (= (and b!896037 c!94786) b!896042))

(assert (= (and b!896037 (not c!94786)) b!896038))

(declare-fun m!834171 () Bool)

(assert (=> b!896038 m!834171))

(declare-fun m!834173 () Bool)

(assert (=> d!111059 m!834173))

(declare-fun m!834175 () Bool)

(assert (=> d!111059 m!834175))

(assert (=> d!111059 m!834175))

(declare-fun m!834177 () Bool)

(assert (=> d!111059 m!834177))

(assert (=> d!111059 m!834139))

(declare-fun m!834179 () Bool)

(assert (=> b!896040 m!834179))

(assert (=> b!895980 d!111059))

(declare-fun d!111061 () Bool)

(declare-fun res!605943 () Bool)

(declare-fun e!500692 () Bool)

(assert (=> d!111061 (=> (not res!605943) (not e!500692))))

(declare-fun simpleValid!304 (LongMapFixedSize!4276) Bool)

(assert (=> d!111061 (= res!605943 (simpleValid!304 thiss!1181))))

(assert (=> d!111061 (= (valid!1663 thiss!1181) e!500692)))

(declare-fun b!896049 () Bool)

(declare-fun res!605944 () Bool)

(assert (=> b!896049 (=> (not res!605944) (not e!500692))))

(declare-fun arrayCountValidKeys!0 (array!52483 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896049 (= res!605944 (= (arrayCountValidKeys!0 (_keys!10085 thiss!1181) #b00000000000000000000000000000000 (size!25683 (_keys!10085 thiss!1181))) (_size!2193 thiss!1181)))))

(declare-fun b!896050 () Bool)

(declare-fun res!605945 () Bool)

(assert (=> b!896050 (=> (not res!605945) (not e!500692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52483 (_ BitVec 32)) Bool)

(assert (=> b!896050 (= res!605945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10085 thiss!1181) (mask!25976 thiss!1181)))))

(declare-fun b!896051 () Bool)

(declare-datatypes ((List!17763 0))(
  ( (Nil!17760) (Cons!17759 (h!18900 (_ BitVec 64)) (t!25094 List!17763)) )
))
(declare-fun arrayNoDuplicates!0 (array!52483 (_ BitVec 32) List!17763) Bool)

(assert (=> b!896051 (= e!500692 (arrayNoDuplicates!0 (_keys!10085 thiss!1181) #b00000000000000000000000000000000 Nil!17760))))

(assert (= (and d!111061 res!605943) b!896049))

(assert (= (and b!896049 res!605944) b!896050))

(assert (= (and b!896050 res!605945) b!896051))

(declare-fun m!834181 () Bool)

(assert (=> d!111061 m!834181))

(declare-fun m!834183 () Bool)

(assert (=> b!896049 m!834183))

(declare-fun m!834185 () Bool)

(assert (=> b!896050 m!834185))

(declare-fun m!834187 () Bool)

(assert (=> b!896051 m!834187))

(assert (=> start!76402 d!111061))

(declare-fun b!896059 () Bool)

(declare-fun e!500698 () Bool)

(assert (=> b!896059 (= e!500698 tp_is_empty!18223)))

(declare-fun mapNonEmpty!28931 () Bool)

(declare-fun mapRes!28931 () Bool)

(declare-fun tp!55703 () Bool)

(declare-fun e!500697 () Bool)

(assert (=> mapNonEmpty!28931 (= mapRes!28931 (and tp!55703 e!500697))))

(declare-fun mapKey!28931 () (_ BitVec 32))

(declare-fun mapRest!28931 () (Array (_ BitVec 32) ValueCell!8630))

(declare-fun mapValue!28931 () ValueCell!8630)

(assert (=> mapNonEmpty!28931 (= mapRest!28922 (store mapRest!28931 mapKey!28931 mapValue!28931))))

(declare-fun condMapEmpty!28931 () Bool)

(declare-fun mapDefault!28931 () ValueCell!8630)

(assert (=> mapNonEmpty!28922 (= condMapEmpty!28931 (= mapRest!28922 ((as const (Array (_ BitVec 32) ValueCell!8630)) mapDefault!28931)))))

(assert (=> mapNonEmpty!28922 (= tp!55687 (and e!500698 mapRes!28931))))

(declare-fun mapIsEmpty!28931 () Bool)

(assert (=> mapIsEmpty!28931 mapRes!28931))

(declare-fun b!896058 () Bool)

(assert (=> b!896058 (= e!500697 tp_is_empty!18223)))

(assert (= (and mapNonEmpty!28922 condMapEmpty!28931) mapIsEmpty!28931))

(assert (= (and mapNonEmpty!28922 (not condMapEmpty!28931)) mapNonEmpty!28931))

(assert (= (and mapNonEmpty!28931 ((_ is ValueCellFull!8630) mapValue!28931)) b!896058))

(assert (= (and mapNonEmpty!28922 ((_ is ValueCellFull!8630) mapDefault!28931)) b!896059))

(declare-fun m!834189 () Bool)

(assert (=> mapNonEmpty!28931 m!834189))

(check-sat (not b!896051) (not b!896049) tp_is_empty!18223 (not b!896038) (not b_next!15895) (not b!896050) (not d!111061) (not mapNonEmpty!28931) b_and!26197 (not d!111059))
(check-sat b_and!26197 (not b_next!15895))
(get-model)

(declare-fun b!896068 () Bool)

(declare-fun e!500704 () (_ BitVec 32))

(assert (=> b!896068 (= e!500704 #b00000000000000000000000000000000)))

(declare-fun d!111063 () Bool)

(declare-fun lt!404813 () (_ BitVec 32))

(assert (=> d!111063 (and (bvsge lt!404813 #b00000000000000000000000000000000) (bvsle lt!404813 (bvsub (size!25683 (_keys!10085 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111063 (= lt!404813 e!500704)))

(declare-fun c!94792 () Bool)

(assert (=> d!111063 (= c!94792 (bvsge #b00000000000000000000000000000000 (size!25683 (_keys!10085 thiss!1181))))))

(assert (=> d!111063 (and (bvsle #b00000000000000000000000000000000 (size!25683 (_keys!10085 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25683 (_keys!10085 thiss!1181)) (size!25683 (_keys!10085 thiss!1181))))))

(assert (=> d!111063 (= (arrayCountValidKeys!0 (_keys!10085 thiss!1181) #b00000000000000000000000000000000 (size!25683 (_keys!10085 thiss!1181))) lt!404813)))

(declare-fun b!896069 () Bool)

(declare-fun e!500703 () (_ BitVec 32))

(declare-fun call!39784 () (_ BitVec 32))

(assert (=> b!896069 (= e!500703 call!39784)))

(declare-fun bm!39781 () Bool)

(assert (=> bm!39781 (= call!39784 (arrayCountValidKeys!0 (_keys!10085 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25683 (_keys!10085 thiss!1181))))))

(declare-fun b!896070 () Bool)

(assert (=> b!896070 (= e!500704 e!500703)))

(declare-fun c!94793 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!896070 (= c!94793 (validKeyInArray!0 (select (arr!25234 (_keys!10085 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896071 () Bool)

(assert (=> b!896071 (= e!500703 (bvadd #b00000000000000000000000000000001 call!39784))))

(assert (= (and d!111063 c!94792) b!896068))

(assert (= (and d!111063 (not c!94792)) b!896070))

(assert (= (and b!896070 c!94793) b!896071))

(assert (= (and b!896070 (not c!94793)) b!896069))

(assert (= (or b!896071 b!896069) bm!39781))

(declare-fun m!834191 () Bool)

(assert (=> bm!39781 m!834191))

(declare-fun m!834193 () Bool)

(assert (=> b!896070 m!834193))

(assert (=> b!896070 m!834193))

(declare-fun m!834195 () Bool)

(assert (=> b!896070 m!834195))

(assert (=> b!896049 d!111063))

(declare-fun d!111065 () Bool)

(declare-fun res!605957 () Bool)

(declare-fun e!500707 () Bool)

(assert (=> d!111065 (=> (not res!605957) (not e!500707))))

(assert (=> d!111065 (= res!605957 (validMask!0 (mask!25976 thiss!1181)))))

(assert (=> d!111065 (= (simpleValid!304 thiss!1181) e!500707)))

(declare-fun b!896083 () Bool)

(assert (=> b!896083 (= e!500707 (and (bvsge (extraKeys!5046 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5046 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2193 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!896080 () Bool)

(declare-fun res!605954 () Bool)

(assert (=> b!896080 (=> (not res!605954) (not e!500707))))

(assert (=> b!896080 (= res!605954 (and (= (size!25684 (_values!5337 thiss!1181)) (bvadd (mask!25976 thiss!1181) #b00000000000000000000000000000001)) (= (size!25683 (_keys!10085 thiss!1181)) (size!25684 (_values!5337 thiss!1181))) (bvsge (_size!2193 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2193 thiss!1181) (bvadd (mask!25976 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!896082 () Bool)

(declare-fun res!605956 () Bool)

(assert (=> b!896082 (=> (not res!605956) (not e!500707))))

(declare-fun size!25689 (LongMapFixedSize!4276) (_ BitVec 32))

(assert (=> b!896082 (= res!605956 (= (size!25689 thiss!1181) (bvadd (_size!2193 thiss!1181) (bvsdiv (bvadd (extraKeys!5046 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!896081 () Bool)

(declare-fun res!605955 () Bool)

(assert (=> b!896081 (=> (not res!605955) (not e!500707))))

(assert (=> b!896081 (= res!605955 (bvsge (size!25689 thiss!1181) (_size!2193 thiss!1181)))))

(assert (= (and d!111065 res!605957) b!896080))

(assert (= (and b!896080 res!605954) b!896081))

(assert (= (and b!896081 res!605955) b!896082))

(assert (= (and b!896082 res!605956) b!896083))

(assert (=> d!111065 m!834139))

(declare-fun m!834197 () Bool)

(assert (=> b!896082 m!834197))

(assert (=> b!896081 m!834197))

(assert (=> d!111061 d!111065))

(declare-fun b!896096 () Bool)

(declare-fun e!500715 () SeekEntryResult!8829)

(assert (=> b!896096 (= e!500715 (MissingVacant!8829 (index!37689 lt!404808)))))

(declare-fun b!896097 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896097 (= e!500715 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76105 lt!404808) #b00000000000000000000000000000001) (nextIndex!0 (index!37689 lt!404808) (bvadd (x!76105 lt!404808) #b00000000000000000000000000000001) (mask!25976 thiss!1181)) (index!37689 lt!404808) key!785 (_keys!10085 thiss!1181) (mask!25976 thiss!1181)))))

(declare-fun b!896098 () Bool)

(declare-fun e!500714 () SeekEntryResult!8829)

(assert (=> b!896098 (= e!500714 Undefined!8829)))

(declare-fun b!896099 () Bool)

(declare-fun e!500716 () SeekEntryResult!8829)

(assert (=> b!896099 (= e!500714 e!500716)))

(declare-fun c!94802 () Bool)

(declare-fun lt!404818 () (_ BitVec 64))

(assert (=> b!896099 (= c!94802 (= lt!404818 key!785))))

(declare-fun b!896100 () Bool)

(declare-fun c!94800 () Bool)

(assert (=> b!896100 (= c!94800 (= lt!404818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896100 (= e!500716 e!500715)))

(declare-fun lt!404819 () SeekEntryResult!8829)

(declare-fun d!111067 () Bool)

(assert (=> d!111067 (and (or ((_ is Undefined!8829) lt!404819) (not ((_ is Found!8829) lt!404819)) (and (bvsge (index!37688 lt!404819) #b00000000000000000000000000000000) (bvslt (index!37688 lt!404819) (size!25683 (_keys!10085 thiss!1181))))) (or ((_ is Undefined!8829) lt!404819) ((_ is Found!8829) lt!404819) (not ((_ is MissingVacant!8829) lt!404819)) (not (= (index!37690 lt!404819) (index!37689 lt!404808))) (and (bvsge (index!37690 lt!404819) #b00000000000000000000000000000000) (bvslt (index!37690 lt!404819) (size!25683 (_keys!10085 thiss!1181))))) (or ((_ is Undefined!8829) lt!404819) (ite ((_ is Found!8829) lt!404819) (= (select (arr!25234 (_keys!10085 thiss!1181)) (index!37688 lt!404819)) key!785) (and ((_ is MissingVacant!8829) lt!404819) (= (index!37690 lt!404819) (index!37689 lt!404808)) (= (select (arr!25234 (_keys!10085 thiss!1181)) (index!37690 lt!404819)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111067 (= lt!404819 e!500714)))

(declare-fun c!94801 () Bool)

(assert (=> d!111067 (= c!94801 (bvsge (x!76105 lt!404808) #b01111111111111111111111111111110))))

(assert (=> d!111067 (= lt!404818 (select (arr!25234 (_keys!10085 thiss!1181)) (index!37689 lt!404808)))))

(assert (=> d!111067 (validMask!0 (mask!25976 thiss!1181))))

(assert (=> d!111067 (= (seekKeyOrZeroReturnVacant!0 (x!76105 lt!404808) (index!37689 lt!404808) (index!37689 lt!404808) key!785 (_keys!10085 thiss!1181) (mask!25976 thiss!1181)) lt!404819)))

(declare-fun b!896101 () Bool)

(assert (=> b!896101 (= e!500716 (Found!8829 (index!37689 lt!404808)))))

(assert (= (and d!111067 c!94801) b!896098))

(assert (= (and d!111067 (not c!94801)) b!896099))

(assert (= (and b!896099 c!94802) b!896101))

(assert (= (and b!896099 (not c!94802)) b!896100))

(assert (= (and b!896100 c!94800) b!896096))

(assert (= (and b!896100 (not c!94800)) b!896097))

(declare-fun m!834199 () Bool)

(assert (=> b!896097 m!834199))

(assert (=> b!896097 m!834199))

(declare-fun m!834201 () Bool)

(assert (=> b!896097 m!834201))

(declare-fun m!834203 () Bool)

(assert (=> d!111067 m!834203))

(declare-fun m!834205 () Bool)

(assert (=> d!111067 m!834205))

(assert (=> d!111067 m!834179))

(assert (=> d!111067 m!834139))

(assert (=> b!896038 d!111067))

(declare-fun d!111069 () Bool)

(declare-fun res!605962 () Bool)

(declare-fun e!500724 () Bool)

(assert (=> d!111069 (=> res!605962 e!500724)))

(assert (=> d!111069 (= res!605962 (bvsge #b00000000000000000000000000000000 (size!25683 (_keys!10085 thiss!1181))))))

(assert (=> d!111069 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10085 thiss!1181) (mask!25976 thiss!1181)) e!500724)))

(declare-fun b!896110 () Bool)

(declare-fun e!500723 () Bool)

(declare-fun call!39787 () Bool)

(assert (=> b!896110 (= e!500723 call!39787)))

(declare-fun b!896111 () Bool)

(declare-fun e!500725 () Bool)

(assert (=> b!896111 (= e!500723 e!500725)))

(declare-fun lt!404827 () (_ BitVec 64))

(assert (=> b!896111 (= lt!404827 (select (arr!25234 (_keys!10085 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30444 0))(
  ( (Unit!30445) )
))
(declare-fun lt!404826 () Unit!30444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52483 (_ BitVec 64) (_ BitVec 32)) Unit!30444)

(assert (=> b!896111 (= lt!404826 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10085 thiss!1181) lt!404827 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896111 (arrayContainsKey!0 (_keys!10085 thiss!1181) lt!404827 #b00000000000000000000000000000000)))

(declare-fun lt!404828 () Unit!30444)

(assert (=> b!896111 (= lt!404828 lt!404826)))

(declare-fun res!605963 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52483 (_ BitVec 32)) SeekEntryResult!8829)

(assert (=> b!896111 (= res!605963 (= (seekEntryOrOpen!0 (select (arr!25234 (_keys!10085 thiss!1181)) #b00000000000000000000000000000000) (_keys!10085 thiss!1181) (mask!25976 thiss!1181)) (Found!8829 #b00000000000000000000000000000000)))))

(assert (=> b!896111 (=> (not res!605963) (not e!500725))))

(declare-fun b!896112 () Bool)

(assert (=> b!896112 (= e!500724 e!500723)))

(declare-fun c!94805 () Bool)

(assert (=> b!896112 (= c!94805 (validKeyInArray!0 (select (arr!25234 (_keys!10085 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39784 () Bool)

(assert (=> bm!39784 (= call!39787 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10085 thiss!1181) (mask!25976 thiss!1181)))))

(declare-fun b!896113 () Bool)

(assert (=> b!896113 (= e!500725 call!39787)))

(assert (= (and d!111069 (not res!605962)) b!896112))

(assert (= (and b!896112 c!94805) b!896111))

(assert (= (and b!896112 (not c!94805)) b!896110))

(assert (= (and b!896111 res!605963) b!896113))

(assert (= (or b!896113 b!896110) bm!39784))

(assert (=> b!896111 m!834193))

(declare-fun m!834207 () Bool)

(assert (=> b!896111 m!834207))

(declare-fun m!834209 () Bool)

(assert (=> b!896111 m!834209))

(assert (=> b!896111 m!834193))

(declare-fun m!834211 () Bool)

(assert (=> b!896111 m!834211))

(assert (=> b!896112 m!834193))

(assert (=> b!896112 m!834193))

(assert (=> b!896112 m!834195))

(declare-fun m!834213 () Bool)

(assert (=> bm!39784 m!834213))

(assert (=> b!896050 d!111069))

(declare-fun b!896132 () Bool)

(declare-fun e!500739 () SeekEntryResult!8829)

(assert (=> b!896132 (= e!500739 (Intermediate!8829 false (toIndex!0 key!785 (mask!25976 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896133 () Bool)

(declare-fun e!500738 () SeekEntryResult!8829)

(assert (=> b!896133 (= e!500738 e!500739)))

(declare-fun c!94813 () Bool)

(declare-fun lt!404833 () (_ BitVec 64))

(assert (=> b!896133 (= c!94813 (or (= lt!404833 key!785) (= (bvadd lt!404833 lt!404833) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!896134 () Bool)

(declare-fun lt!404834 () SeekEntryResult!8829)

(assert (=> b!896134 (and (bvsge (index!37689 lt!404834) #b00000000000000000000000000000000) (bvslt (index!37689 lt!404834) (size!25683 (_keys!10085 thiss!1181))))))

(declare-fun res!605970 () Bool)

(assert (=> b!896134 (= res!605970 (= (select (arr!25234 (_keys!10085 thiss!1181)) (index!37689 lt!404834)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500736 () Bool)

(assert (=> b!896134 (=> res!605970 e!500736)))

(declare-fun b!896135 () Bool)

(assert (=> b!896135 (= e!500739 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25976 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!25976 thiss!1181)) key!785 (_keys!10085 thiss!1181) (mask!25976 thiss!1181)))))

(declare-fun b!896136 () Bool)

(declare-fun e!500737 () Bool)

(assert (=> b!896136 (= e!500737 (bvsge (x!76105 lt!404834) #b01111111111111111111111111111110))))

(declare-fun b!896137 () Bool)

(assert (=> b!896137 (and (bvsge (index!37689 lt!404834) #b00000000000000000000000000000000) (bvslt (index!37689 lt!404834) (size!25683 (_keys!10085 thiss!1181))))))

(declare-fun res!605972 () Bool)

(assert (=> b!896137 (= res!605972 (= (select (arr!25234 (_keys!10085 thiss!1181)) (index!37689 lt!404834)) key!785))))

(assert (=> b!896137 (=> res!605972 e!500736)))

(declare-fun e!500740 () Bool)

(assert (=> b!896137 (= e!500740 e!500736)))

(declare-fun b!896138 () Bool)

(assert (=> b!896138 (= e!500738 (Intermediate!8829 true (toIndex!0 key!785 (mask!25976 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896139 () Bool)

(assert (=> b!896139 (= e!500737 e!500740)))

(declare-fun res!605971 () Bool)

(assert (=> b!896139 (= res!605971 (and ((_ is Intermediate!8829) lt!404834) (not (undefined!9641 lt!404834)) (bvslt (x!76105 lt!404834) #b01111111111111111111111111111110) (bvsge (x!76105 lt!404834) #b00000000000000000000000000000000) (bvsge (x!76105 lt!404834) #b00000000000000000000000000000000)))))

(assert (=> b!896139 (=> (not res!605971) (not e!500740))))

(declare-fun b!896140 () Bool)

(assert (=> b!896140 (and (bvsge (index!37689 lt!404834) #b00000000000000000000000000000000) (bvslt (index!37689 lt!404834) (size!25683 (_keys!10085 thiss!1181))))))

(assert (=> b!896140 (= e!500736 (= (select (arr!25234 (_keys!10085 thiss!1181)) (index!37689 lt!404834)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!111071 () Bool)

(assert (=> d!111071 e!500737))

(declare-fun c!94812 () Bool)

(assert (=> d!111071 (= c!94812 (and ((_ is Intermediate!8829) lt!404834) (undefined!9641 lt!404834)))))

(assert (=> d!111071 (= lt!404834 e!500738)))

(declare-fun c!94814 () Bool)

(assert (=> d!111071 (= c!94814 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111071 (= lt!404833 (select (arr!25234 (_keys!10085 thiss!1181)) (toIndex!0 key!785 (mask!25976 thiss!1181))))))

(assert (=> d!111071 (validMask!0 (mask!25976 thiss!1181))))

(assert (=> d!111071 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25976 thiss!1181)) key!785 (_keys!10085 thiss!1181) (mask!25976 thiss!1181)) lt!404834)))

(assert (= (and d!111071 c!94814) b!896138))

(assert (= (and d!111071 (not c!94814)) b!896133))

(assert (= (and b!896133 c!94813) b!896132))

(assert (= (and b!896133 (not c!94813)) b!896135))

(assert (= (and d!111071 c!94812) b!896136))

(assert (= (and d!111071 (not c!94812)) b!896139))

(assert (= (and b!896139 res!605971) b!896137))

(assert (= (and b!896137 (not res!605972)) b!896134))

(assert (= (and b!896134 (not res!605970)) b!896140))

(assert (=> b!896135 m!834175))

(declare-fun m!834215 () Bool)

(assert (=> b!896135 m!834215))

(assert (=> b!896135 m!834215))

(declare-fun m!834217 () Bool)

(assert (=> b!896135 m!834217))

(assert (=> d!111071 m!834175))

(declare-fun m!834219 () Bool)

(assert (=> d!111071 m!834219))

(assert (=> d!111071 m!834139))

(declare-fun m!834221 () Bool)

(assert (=> b!896134 m!834221))

(assert (=> b!896140 m!834221))

(assert (=> b!896137 m!834221))

(assert (=> d!111059 d!111071))

(declare-fun d!111073 () Bool)

(declare-fun lt!404840 () (_ BitVec 32))

(declare-fun lt!404839 () (_ BitVec 32))

(assert (=> d!111073 (= lt!404840 (bvmul (bvxor lt!404839 (bvlshr lt!404839 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111073 (= lt!404839 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111073 (and (bvsge (mask!25976 thiss!1181) #b00000000000000000000000000000000) (let ((res!605973 (let ((h!18901 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76122 (bvmul (bvxor h!18901 (bvlshr h!18901 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76122 (bvlshr x!76122 #b00000000000000000000000000001101)) (mask!25976 thiss!1181)))))) (and (bvslt res!605973 (bvadd (mask!25976 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605973 #b00000000000000000000000000000000))))))

(assert (=> d!111073 (= (toIndex!0 key!785 (mask!25976 thiss!1181)) (bvand (bvxor lt!404840 (bvlshr lt!404840 #b00000000000000000000000000001101)) (mask!25976 thiss!1181)))))

(assert (=> d!111059 d!111073))

(assert (=> d!111059 d!111057))

(declare-fun b!896151 () Bool)

(declare-fun e!500750 () Bool)

(declare-fun call!39790 () Bool)

(assert (=> b!896151 (= e!500750 call!39790)))

(declare-fun b!896152 () Bool)

(declare-fun e!500751 () Bool)

(declare-fun contains!4367 (List!17763 (_ BitVec 64)) Bool)

(assert (=> b!896152 (= e!500751 (contains!4367 Nil!17760 (select (arr!25234 (_keys!10085 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896153 () Bool)

(assert (=> b!896153 (= e!500750 call!39790)))

(declare-fun b!896154 () Bool)

(declare-fun e!500749 () Bool)

(declare-fun e!500752 () Bool)

(assert (=> b!896154 (= e!500749 e!500752)))

(declare-fun res!605982 () Bool)

(assert (=> b!896154 (=> (not res!605982) (not e!500752))))

(assert (=> b!896154 (= res!605982 (not e!500751))))

(declare-fun res!605981 () Bool)

(assert (=> b!896154 (=> (not res!605981) (not e!500751))))

(assert (=> b!896154 (= res!605981 (validKeyInArray!0 (select (arr!25234 (_keys!10085 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39787 () Bool)

(declare-fun c!94817 () Bool)

(assert (=> bm!39787 (= call!39790 (arrayNoDuplicates!0 (_keys!10085 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94817 (Cons!17759 (select (arr!25234 (_keys!10085 thiss!1181)) #b00000000000000000000000000000000) Nil!17760) Nil!17760)))))

(declare-fun d!111075 () Bool)

(declare-fun res!605980 () Bool)

(assert (=> d!111075 (=> res!605980 e!500749)))

(assert (=> d!111075 (= res!605980 (bvsge #b00000000000000000000000000000000 (size!25683 (_keys!10085 thiss!1181))))))

(assert (=> d!111075 (= (arrayNoDuplicates!0 (_keys!10085 thiss!1181) #b00000000000000000000000000000000 Nil!17760) e!500749)))

(declare-fun b!896155 () Bool)

(assert (=> b!896155 (= e!500752 e!500750)))

(assert (=> b!896155 (= c!94817 (validKeyInArray!0 (select (arr!25234 (_keys!10085 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111075 (not res!605980)) b!896154))

(assert (= (and b!896154 res!605981) b!896152))

(assert (= (and b!896154 res!605982) b!896155))

(assert (= (and b!896155 c!94817) b!896151))

(assert (= (and b!896155 (not c!94817)) b!896153))

(assert (= (or b!896151 b!896153) bm!39787))

(assert (=> b!896152 m!834193))

(assert (=> b!896152 m!834193))

(declare-fun m!834223 () Bool)

(assert (=> b!896152 m!834223))

(assert (=> b!896154 m!834193))

(assert (=> b!896154 m!834193))

(assert (=> b!896154 m!834195))

(assert (=> bm!39787 m!834193))

(declare-fun m!834225 () Bool)

(assert (=> bm!39787 m!834225))

(assert (=> b!896155 m!834193))

(assert (=> b!896155 m!834193))

(assert (=> b!896155 m!834195))

(assert (=> b!896051 d!111075))

(declare-fun b!896157 () Bool)

(declare-fun e!500754 () Bool)

(assert (=> b!896157 (= e!500754 tp_is_empty!18223)))

(declare-fun mapNonEmpty!28932 () Bool)

(declare-fun mapRes!28932 () Bool)

(declare-fun tp!55704 () Bool)

(declare-fun e!500753 () Bool)

(assert (=> mapNonEmpty!28932 (= mapRes!28932 (and tp!55704 e!500753))))

(declare-fun mapRest!28932 () (Array (_ BitVec 32) ValueCell!8630))

(declare-fun mapKey!28932 () (_ BitVec 32))

(declare-fun mapValue!28932 () ValueCell!8630)

(assert (=> mapNonEmpty!28932 (= mapRest!28931 (store mapRest!28932 mapKey!28932 mapValue!28932))))

(declare-fun condMapEmpty!28932 () Bool)

(declare-fun mapDefault!28932 () ValueCell!8630)

(assert (=> mapNonEmpty!28931 (= condMapEmpty!28932 (= mapRest!28931 ((as const (Array (_ BitVec 32) ValueCell!8630)) mapDefault!28932)))))

(assert (=> mapNonEmpty!28931 (= tp!55703 (and e!500754 mapRes!28932))))

(declare-fun mapIsEmpty!28932 () Bool)

(assert (=> mapIsEmpty!28932 mapRes!28932))

(declare-fun b!896156 () Bool)

(assert (=> b!896156 (= e!500753 tp_is_empty!18223)))

(assert (= (and mapNonEmpty!28931 condMapEmpty!28932) mapIsEmpty!28932))

(assert (= (and mapNonEmpty!28931 (not condMapEmpty!28932)) mapNonEmpty!28932))

(assert (= (and mapNonEmpty!28932 ((_ is ValueCellFull!8630) mapValue!28932)) b!896156))

(assert (= (and mapNonEmpty!28931 ((_ is ValueCellFull!8630) mapDefault!28932)) b!896157))

(declare-fun m!834227 () Bool)

(assert (=> mapNonEmpty!28932 m!834227))

(check-sat (not b!896152) (not bm!39784) (not d!111067) (not b!896111) (not bm!39787) (not b!896081) (not b!896155) (not b!896154) (not b!896097) (not d!111071) (not bm!39781) (not b!896070) (not d!111065) tp_is_empty!18223 b_and!26197 (not b!896112) (not b!896082) (not b!896135) (not mapNonEmpty!28932) (not b_next!15895))
(check-sat b_and!26197 (not b_next!15895))
