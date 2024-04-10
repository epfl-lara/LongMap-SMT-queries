; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76622 () Bool)

(assert start!76622)

(declare-fun b!897355 () Bool)

(declare-fun b_free!15981 () Bool)

(declare-fun b_next!15981 () Bool)

(assert (=> b!897355 (= b_free!15981 (not b_next!15981))))

(declare-fun tp!55993 () Bool)

(declare-fun b_and!26273 () Bool)

(assert (=> b!897355 (= tp!55993 b_and!26273)))

(declare-fun res!606582 () Bool)

(declare-fun e!501779 () Bool)

(assert (=> start!76622 (=> (not res!606582) (not e!501779))))

(declare-datatypes ((array!52644 0))(
  ( (array!52645 (arr!25305 (Array (_ BitVec 32) (_ BitVec 64))) (size!25759 (_ BitVec 32))) )
))
(declare-datatypes ((V!29377 0))(
  ( (V!29378 (val!9205 Int)) )
))
(declare-datatypes ((ValueCell!8673 0))(
  ( (ValueCellFull!8673 (v!11695 V!29377)) (EmptyCell!8673) )
))
(declare-datatypes ((array!52646 0))(
  ( (array!52647 (arr!25306 (Array (_ BitVec 32) ValueCell!8673)) (size!25760 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4362 0))(
  ( (LongMapFixedSize!4363 (defaultEntry!5393 Int) (mask!26078 (_ BitVec 32)) (extraKeys!5102 (_ BitVec 32)) (zeroValue!5206 V!29377) (minValue!5206 V!29377) (_size!2236 (_ BitVec 32)) (_keys!10148 array!52644) (_values!5393 array!52646) (_vacant!2236 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4362)

(declare-fun valid!1680 (LongMapFixedSize!4362) Bool)

(assert (=> start!76622 (= res!606582 (valid!1680 thiss!1181))))

(assert (=> start!76622 e!501779))

(declare-fun e!501774 () Bool)

(assert (=> start!76622 e!501774))

(assert (=> start!76622 true))

(declare-fun tp_is_empty!18309 () Bool)

(declare-fun e!501773 () Bool)

(declare-fun array_inv!19860 (array!52644) Bool)

(declare-fun array_inv!19861 (array!52646) Bool)

(assert (=> b!897355 (= e!501774 (and tp!55993 tp_is_empty!18309 (array_inv!19860 (_keys!10148 thiss!1181)) (array_inv!19861 (_values!5393 thiss!1181)) e!501773))))

(declare-fun b!897356 () Bool)

(declare-fun e!501780 () Bool)

(assert (=> b!897356 (= e!501780 tp_is_empty!18309)))

(declare-fun b!897357 () Bool)

(declare-fun e!501775 () Bool)

(assert (=> b!897357 (= e!501775 tp_is_empty!18309)))

(declare-fun b!897358 () Bool)

(declare-fun res!606581 () Bool)

(assert (=> b!897358 (=> (not res!606581) (not e!501779))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897358 (= res!606581 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29099 () Bool)

(declare-fun mapRes!29099 () Bool)

(assert (=> mapIsEmpty!29099 mapRes!29099))

(declare-fun b!897359 () Bool)

(declare-fun e!501778 () Bool)

(declare-datatypes ((SeekEntryResult!8908 0))(
  ( (MissingZero!8908 (index!38003 (_ BitVec 32))) (Found!8908 (index!38004 (_ BitVec 32))) (Intermediate!8908 (undefined!9720 Bool) (index!38005 (_ BitVec 32)) (x!76448 (_ BitVec 32))) (Undefined!8908) (MissingVacant!8908 (index!38006 (_ BitVec 32))) )
))
(declare-fun lt!405152 () SeekEntryResult!8908)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897359 (= e!501778 (inRange!0 (index!38004 lt!405152) (mask!26078 thiss!1181)))))

(declare-fun b!897360 () Bool)

(declare-fun e!501777 () Bool)

(assert (=> b!897360 (= e!501777 (or (not (= (size!25760 (_values!5393 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26078 thiss!1181)))) (not (= (size!25759 (_keys!10148 thiss!1181)) (size!25760 (_values!5393 thiss!1181)))) (bvslt (mask!26078 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5102 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5102 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!897361 () Bool)

(assert (=> b!897361 (= e!501773 (and e!501775 mapRes!29099))))

(declare-fun condMapEmpty!29099 () Bool)

(declare-fun mapDefault!29099 () ValueCell!8673)

(assert (=> b!897361 (= condMapEmpty!29099 (= (arr!25306 (_values!5393 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8673)) mapDefault!29099)))))

(declare-fun mapNonEmpty!29099 () Bool)

(declare-fun tp!55992 () Bool)

(assert (=> mapNonEmpty!29099 (= mapRes!29099 (and tp!55992 e!501780))))

(declare-fun mapKey!29099 () (_ BitVec 32))

(declare-fun mapValue!29099 () ValueCell!8673)

(declare-fun mapRest!29099 () (Array (_ BitVec 32) ValueCell!8673))

(assert (=> mapNonEmpty!29099 (= (arr!25306 (_values!5393 thiss!1181)) (store mapRest!29099 mapKey!29099 mapValue!29099))))

(declare-fun b!897362 () Bool)

(declare-fun e!501781 () Bool)

(assert (=> b!897362 (= e!501781 e!501777)))

(declare-fun res!606578 () Bool)

(assert (=> b!897362 (=> res!606578 e!501777)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897362 (= res!606578 (not (validMask!0 (mask!26078 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897362 (arrayContainsKey!0 (_keys!10148 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30506 0))(
  ( (Unit!30507) )
))
(declare-fun lt!405153 () Unit!30506)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52644 (_ BitVec 64) (_ BitVec 32)) Unit!30506)

(assert (=> b!897362 (= lt!405153 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10148 thiss!1181) key!785 (index!38004 lt!405152)))))

(declare-fun b!897363 () Bool)

(assert (=> b!897363 (= e!501779 (not e!501781))))

(declare-fun res!606580 () Bool)

(assert (=> b!897363 (=> res!606580 e!501781)))

(get-info :version)

(assert (=> b!897363 (= res!606580 (not ((_ is Found!8908) lt!405152)))))

(assert (=> b!897363 e!501778))

(declare-fun res!606579 () Bool)

(assert (=> b!897363 (=> res!606579 e!501778)))

(assert (=> b!897363 (= res!606579 (not ((_ is Found!8908) lt!405152)))))

(declare-fun lt!405154 () Unit!30506)

(declare-fun lemmaSeekEntryGivesInRangeIndex!79 (array!52644 array!52646 (_ BitVec 32) (_ BitVec 32) V!29377 V!29377 (_ BitVec 64)) Unit!30506)

(assert (=> b!897363 (= lt!405154 (lemmaSeekEntryGivesInRangeIndex!79 (_keys!10148 thiss!1181) (_values!5393 thiss!1181) (mask!26078 thiss!1181) (extraKeys!5102 thiss!1181) (zeroValue!5206 thiss!1181) (minValue!5206 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52644 (_ BitVec 32)) SeekEntryResult!8908)

(assert (=> b!897363 (= lt!405152 (seekEntry!0 key!785 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)))))

(assert (= (and start!76622 res!606582) b!897358))

(assert (= (and b!897358 res!606581) b!897363))

(assert (= (and b!897363 (not res!606579)) b!897359))

(assert (= (and b!897363 (not res!606580)) b!897362))

(assert (= (and b!897362 (not res!606578)) b!897360))

(assert (= (and b!897361 condMapEmpty!29099) mapIsEmpty!29099))

(assert (= (and b!897361 (not condMapEmpty!29099)) mapNonEmpty!29099))

(assert (= (and mapNonEmpty!29099 ((_ is ValueCellFull!8673) mapValue!29099)) b!897356))

(assert (= (and b!897361 ((_ is ValueCellFull!8673) mapDefault!29099)) b!897357))

(assert (= b!897355 b!897361))

(assert (= start!76622 b!897355))

(declare-fun m!834185 () Bool)

(assert (=> b!897355 m!834185))

(declare-fun m!834187 () Bool)

(assert (=> b!897355 m!834187))

(declare-fun m!834189 () Bool)

(assert (=> start!76622 m!834189))

(declare-fun m!834191 () Bool)

(assert (=> mapNonEmpty!29099 m!834191))

(declare-fun m!834193 () Bool)

(assert (=> b!897359 m!834193))

(declare-fun m!834195 () Bool)

(assert (=> b!897363 m!834195))

(declare-fun m!834197 () Bool)

(assert (=> b!897363 m!834197))

(declare-fun m!834199 () Bool)

(assert (=> b!897362 m!834199))

(declare-fun m!834201 () Bool)

(assert (=> b!897362 m!834201))

(declare-fun m!834203 () Bool)

(assert (=> b!897362 m!834203))

(check-sat b_and!26273 tp_is_empty!18309 (not b_next!15981) (not b!897363) (not b!897362) (not start!76622) (not mapNonEmpty!29099) (not b!897359) (not b!897355))
(check-sat b_and!26273 (not b_next!15981))
(get-model)

(declare-fun d!111075 () Bool)

(declare-fun e!501811 () Bool)

(assert (=> d!111075 e!501811))

(declare-fun res!606600 () Bool)

(assert (=> d!111075 (=> res!606600 e!501811)))

(declare-fun lt!405169 () SeekEntryResult!8908)

(assert (=> d!111075 (= res!606600 (not ((_ is Found!8908) lt!405169)))))

(assert (=> d!111075 (= lt!405169 (seekEntry!0 key!785 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)))))

(declare-fun lt!405168 () Unit!30506)

(declare-fun choose!1483 (array!52644 array!52646 (_ BitVec 32) (_ BitVec 32) V!29377 V!29377 (_ BitVec 64)) Unit!30506)

(assert (=> d!111075 (= lt!405168 (choose!1483 (_keys!10148 thiss!1181) (_values!5393 thiss!1181) (mask!26078 thiss!1181) (extraKeys!5102 thiss!1181) (zeroValue!5206 thiss!1181) (minValue!5206 thiss!1181) key!785))))

(assert (=> d!111075 (validMask!0 (mask!26078 thiss!1181))))

(assert (=> d!111075 (= (lemmaSeekEntryGivesInRangeIndex!79 (_keys!10148 thiss!1181) (_values!5393 thiss!1181) (mask!26078 thiss!1181) (extraKeys!5102 thiss!1181) (zeroValue!5206 thiss!1181) (minValue!5206 thiss!1181) key!785) lt!405168)))

(declare-fun b!897393 () Bool)

(assert (=> b!897393 (= e!501811 (inRange!0 (index!38004 lt!405169) (mask!26078 thiss!1181)))))

(assert (= (and d!111075 (not res!606600)) b!897393))

(assert (=> d!111075 m!834197))

(declare-fun m!834225 () Bool)

(assert (=> d!111075 m!834225))

(assert (=> d!111075 m!834199))

(declare-fun m!834227 () Bool)

(assert (=> b!897393 m!834227))

(assert (=> b!897363 d!111075))

(declare-fun b!897406 () Bool)

(declare-fun e!501820 () SeekEntryResult!8908)

(declare-fun e!501818 () SeekEntryResult!8908)

(assert (=> b!897406 (= e!501820 e!501818)))

(declare-fun lt!405181 () (_ BitVec 64))

(declare-fun lt!405180 () SeekEntryResult!8908)

(assert (=> b!897406 (= lt!405181 (select (arr!25305 (_keys!10148 thiss!1181)) (index!38005 lt!405180)))))

(declare-fun c!94824 () Bool)

(assert (=> b!897406 (= c!94824 (= lt!405181 key!785))))

(declare-fun b!897407 () Bool)

(declare-fun e!501819 () SeekEntryResult!8908)

(declare-fun lt!405179 () SeekEntryResult!8908)

(assert (=> b!897407 (= e!501819 (ite ((_ is MissingVacant!8908) lt!405179) (MissingZero!8908 (index!38006 lt!405179)) lt!405179))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52644 (_ BitVec 32)) SeekEntryResult!8908)

(assert (=> b!897407 (= lt!405179 (seekKeyOrZeroReturnVacant!0 (x!76448 lt!405180) (index!38005 lt!405180) (index!38005 lt!405180) key!785 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)))))

(declare-fun b!897408 () Bool)

(assert (=> b!897408 (= e!501820 Undefined!8908)))

(declare-fun b!897409 () Bool)

(assert (=> b!897409 (= e!501818 (Found!8908 (index!38005 lt!405180)))))

(declare-fun d!111077 () Bool)

(declare-fun lt!405178 () SeekEntryResult!8908)

(assert (=> d!111077 (and (or ((_ is MissingVacant!8908) lt!405178) (not ((_ is Found!8908) lt!405178)) (and (bvsge (index!38004 lt!405178) #b00000000000000000000000000000000) (bvslt (index!38004 lt!405178) (size!25759 (_keys!10148 thiss!1181))))) (not ((_ is MissingVacant!8908) lt!405178)) (or (not ((_ is Found!8908) lt!405178)) (= (select (arr!25305 (_keys!10148 thiss!1181)) (index!38004 lt!405178)) key!785)))))

(assert (=> d!111077 (= lt!405178 e!501820)))

(declare-fun c!94826 () Bool)

(assert (=> d!111077 (= c!94826 (and ((_ is Intermediate!8908) lt!405180) (undefined!9720 lt!405180)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52644 (_ BitVec 32)) SeekEntryResult!8908)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111077 (= lt!405180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26078 thiss!1181)) key!785 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)))))

(assert (=> d!111077 (validMask!0 (mask!26078 thiss!1181))))

(assert (=> d!111077 (= (seekEntry!0 key!785 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)) lt!405178)))

(declare-fun b!897410 () Bool)

(declare-fun c!94825 () Bool)

(assert (=> b!897410 (= c!94825 (= lt!405181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897410 (= e!501818 e!501819)))

(declare-fun b!897411 () Bool)

(assert (=> b!897411 (= e!501819 (MissingZero!8908 (index!38005 lt!405180)))))

(assert (= (and d!111077 c!94826) b!897408))

(assert (= (and d!111077 (not c!94826)) b!897406))

(assert (= (and b!897406 c!94824) b!897409))

(assert (= (and b!897406 (not c!94824)) b!897410))

(assert (= (and b!897410 c!94825) b!897411))

(assert (= (and b!897410 (not c!94825)) b!897407))

(declare-fun m!834229 () Bool)

(assert (=> b!897406 m!834229))

(declare-fun m!834231 () Bool)

(assert (=> b!897407 m!834231))

(declare-fun m!834233 () Bool)

(assert (=> d!111077 m!834233))

(declare-fun m!834235 () Bool)

(assert (=> d!111077 m!834235))

(assert (=> d!111077 m!834235))

(declare-fun m!834237 () Bool)

(assert (=> d!111077 m!834237))

(assert (=> d!111077 m!834199))

(assert (=> b!897363 d!111077))

(declare-fun d!111079 () Bool)

(assert (=> d!111079 (= (inRange!0 (index!38004 lt!405152) (mask!26078 thiss!1181)) (and (bvsge (index!38004 lt!405152) #b00000000000000000000000000000000) (bvslt (index!38004 lt!405152) (bvadd (mask!26078 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897359 d!111079))

(declare-fun d!111081 () Bool)

(assert (=> d!111081 (= (array_inv!19860 (_keys!10148 thiss!1181)) (bvsge (size!25759 (_keys!10148 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897355 d!111081))

(declare-fun d!111083 () Bool)

(assert (=> d!111083 (= (array_inv!19861 (_values!5393 thiss!1181)) (bvsge (size!25760 (_values!5393 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897355 d!111083))

(declare-fun d!111085 () Bool)

(declare-fun res!606607 () Bool)

(declare-fun e!501823 () Bool)

(assert (=> d!111085 (=> (not res!606607) (not e!501823))))

(declare-fun simpleValid!318 (LongMapFixedSize!4362) Bool)

(assert (=> d!111085 (= res!606607 (simpleValid!318 thiss!1181))))

(assert (=> d!111085 (= (valid!1680 thiss!1181) e!501823)))

(declare-fun b!897418 () Bool)

(declare-fun res!606608 () Bool)

(assert (=> b!897418 (=> (not res!606608) (not e!501823))))

(declare-fun arrayCountValidKeys!0 (array!52644 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897418 (= res!606608 (= (arrayCountValidKeys!0 (_keys!10148 thiss!1181) #b00000000000000000000000000000000 (size!25759 (_keys!10148 thiss!1181))) (_size!2236 thiss!1181)))))

(declare-fun b!897419 () Bool)

(declare-fun res!606609 () Bool)

(assert (=> b!897419 (=> (not res!606609) (not e!501823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52644 (_ BitVec 32)) Bool)

(assert (=> b!897419 (= res!606609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)))))

(declare-fun b!897420 () Bool)

(declare-datatypes ((List!17828 0))(
  ( (Nil!17825) (Cons!17824 (h!18965 (_ BitVec 64)) (t!25167 List!17828)) )
))
(declare-fun arrayNoDuplicates!0 (array!52644 (_ BitVec 32) List!17828) Bool)

(assert (=> b!897420 (= e!501823 (arrayNoDuplicates!0 (_keys!10148 thiss!1181) #b00000000000000000000000000000000 Nil!17825))))

(assert (= (and d!111085 res!606607) b!897418))

(assert (= (and b!897418 res!606608) b!897419))

(assert (= (and b!897419 res!606609) b!897420))

(declare-fun m!834239 () Bool)

(assert (=> d!111085 m!834239))

(declare-fun m!834241 () Bool)

(assert (=> b!897418 m!834241))

(declare-fun m!834243 () Bool)

(assert (=> b!897419 m!834243))

(declare-fun m!834245 () Bool)

(assert (=> b!897420 m!834245))

(assert (=> start!76622 d!111085))

(declare-fun d!111087 () Bool)

(assert (=> d!111087 (= (validMask!0 (mask!26078 thiss!1181)) (and (or (= (mask!26078 thiss!1181) #b00000000000000000000000000000111) (= (mask!26078 thiss!1181) #b00000000000000000000000000001111) (= (mask!26078 thiss!1181) #b00000000000000000000000000011111) (= (mask!26078 thiss!1181) #b00000000000000000000000000111111) (= (mask!26078 thiss!1181) #b00000000000000000000000001111111) (= (mask!26078 thiss!1181) #b00000000000000000000000011111111) (= (mask!26078 thiss!1181) #b00000000000000000000000111111111) (= (mask!26078 thiss!1181) #b00000000000000000000001111111111) (= (mask!26078 thiss!1181) #b00000000000000000000011111111111) (= (mask!26078 thiss!1181) #b00000000000000000000111111111111) (= (mask!26078 thiss!1181) #b00000000000000000001111111111111) (= (mask!26078 thiss!1181) #b00000000000000000011111111111111) (= (mask!26078 thiss!1181) #b00000000000000000111111111111111) (= (mask!26078 thiss!1181) #b00000000000000001111111111111111) (= (mask!26078 thiss!1181) #b00000000000000011111111111111111) (= (mask!26078 thiss!1181) #b00000000000000111111111111111111) (= (mask!26078 thiss!1181) #b00000000000001111111111111111111) (= (mask!26078 thiss!1181) #b00000000000011111111111111111111) (= (mask!26078 thiss!1181) #b00000000000111111111111111111111) (= (mask!26078 thiss!1181) #b00000000001111111111111111111111) (= (mask!26078 thiss!1181) #b00000000011111111111111111111111) (= (mask!26078 thiss!1181) #b00000000111111111111111111111111) (= (mask!26078 thiss!1181) #b00000001111111111111111111111111) (= (mask!26078 thiss!1181) #b00000011111111111111111111111111) (= (mask!26078 thiss!1181) #b00000111111111111111111111111111) (= (mask!26078 thiss!1181) #b00001111111111111111111111111111) (= (mask!26078 thiss!1181) #b00011111111111111111111111111111) (= (mask!26078 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26078 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897362 d!111087))

(declare-fun d!111089 () Bool)

(declare-fun res!606614 () Bool)

(declare-fun e!501828 () Bool)

(assert (=> d!111089 (=> res!606614 e!501828)))

(assert (=> d!111089 (= res!606614 (= (select (arr!25305 (_keys!10148 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111089 (= (arrayContainsKey!0 (_keys!10148 thiss!1181) key!785 #b00000000000000000000000000000000) e!501828)))

(declare-fun b!897425 () Bool)

(declare-fun e!501829 () Bool)

(assert (=> b!897425 (= e!501828 e!501829)))

(declare-fun res!606615 () Bool)

(assert (=> b!897425 (=> (not res!606615) (not e!501829))))

(assert (=> b!897425 (= res!606615 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25759 (_keys!10148 thiss!1181))))))

(declare-fun b!897426 () Bool)

(assert (=> b!897426 (= e!501829 (arrayContainsKey!0 (_keys!10148 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111089 (not res!606614)) b!897425))

(assert (= (and b!897425 res!606615) b!897426))

(declare-fun m!834247 () Bool)

(assert (=> d!111089 m!834247))

(declare-fun m!834249 () Bool)

(assert (=> b!897426 m!834249))

(assert (=> b!897362 d!111089))

(declare-fun d!111091 () Bool)

(assert (=> d!111091 (arrayContainsKey!0 (_keys!10148 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405184 () Unit!30506)

(declare-fun choose!13 (array!52644 (_ BitVec 64) (_ BitVec 32)) Unit!30506)

(assert (=> d!111091 (= lt!405184 (choose!13 (_keys!10148 thiss!1181) key!785 (index!38004 lt!405152)))))

(assert (=> d!111091 (bvsge (index!38004 lt!405152) #b00000000000000000000000000000000)))

(assert (=> d!111091 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10148 thiss!1181) key!785 (index!38004 lt!405152)) lt!405184)))

(declare-fun bs!25189 () Bool)

(assert (= bs!25189 d!111091))

(assert (=> bs!25189 m!834201))

(declare-fun m!834251 () Bool)

(assert (=> bs!25189 m!834251))

(assert (=> b!897362 d!111091))

(declare-fun mapNonEmpty!29105 () Bool)

(declare-fun mapRes!29105 () Bool)

(declare-fun tp!56002 () Bool)

(declare-fun e!501834 () Bool)

(assert (=> mapNonEmpty!29105 (= mapRes!29105 (and tp!56002 e!501834))))

(declare-fun mapValue!29105 () ValueCell!8673)

(declare-fun mapRest!29105 () (Array (_ BitVec 32) ValueCell!8673))

(declare-fun mapKey!29105 () (_ BitVec 32))

(assert (=> mapNonEmpty!29105 (= mapRest!29099 (store mapRest!29105 mapKey!29105 mapValue!29105))))

(declare-fun b!897434 () Bool)

(declare-fun e!501835 () Bool)

(assert (=> b!897434 (= e!501835 tp_is_empty!18309)))

(declare-fun mapIsEmpty!29105 () Bool)

(assert (=> mapIsEmpty!29105 mapRes!29105))

(declare-fun b!897433 () Bool)

(assert (=> b!897433 (= e!501834 tp_is_empty!18309)))

(declare-fun condMapEmpty!29105 () Bool)

(declare-fun mapDefault!29105 () ValueCell!8673)

(assert (=> mapNonEmpty!29099 (= condMapEmpty!29105 (= mapRest!29099 ((as const (Array (_ BitVec 32) ValueCell!8673)) mapDefault!29105)))))

(assert (=> mapNonEmpty!29099 (= tp!55992 (and e!501835 mapRes!29105))))

(assert (= (and mapNonEmpty!29099 condMapEmpty!29105) mapIsEmpty!29105))

(assert (= (and mapNonEmpty!29099 (not condMapEmpty!29105)) mapNonEmpty!29105))

(assert (= (and mapNonEmpty!29105 ((_ is ValueCellFull!8673) mapValue!29105)) b!897433))

(assert (= (and mapNonEmpty!29099 ((_ is ValueCellFull!8673) mapDefault!29105)) b!897434))

(declare-fun m!834253 () Bool)

(assert (=> mapNonEmpty!29105 m!834253))

(check-sat tp_is_empty!18309 (not b_next!15981) (not d!111075) (not d!111091) (not b!897393) (not b!897418) (not b!897407) (not b!897426) b_and!26273 (not b!897420) (not b!897419) (not mapNonEmpty!29105) (not d!111085) (not d!111077))
(check-sat b_and!26273 (not b_next!15981))
(get-model)

(assert (=> d!111091 d!111089))

(declare-fun d!111093 () Bool)

(assert (=> d!111093 (arrayContainsKey!0 (_keys!10148 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111093 true))

(declare-fun _$60!415 () Unit!30506)

(assert (=> d!111093 (= (choose!13 (_keys!10148 thiss!1181) key!785 (index!38004 lt!405152)) _$60!415)))

(declare-fun bs!25190 () Bool)

(assert (= bs!25190 d!111093))

(assert (=> bs!25190 m!834201))

(assert (=> d!111091 d!111093))

(declare-fun b!897445 () Bool)

(declare-fun res!606625 () Bool)

(declare-fun e!501838 () Bool)

(assert (=> b!897445 (=> (not res!606625) (not e!501838))))

(declare-fun size!25763 (LongMapFixedSize!4362) (_ BitVec 32))

(assert (=> b!897445 (= res!606625 (= (size!25763 thiss!1181) (bvadd (_size!2236 thiss!1181) (bvsdiv (bvadd (extraKeys!5102 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!897443 () Bool)

(declare-fun res!606624 () Bool)

(assert (=> b!897443 (=> (not res!606624) (not e!501838))))

(assert (=> b!897443 (= res!606624 (and (= (size!25760 (_values!5393 thiss!1181)) (bvadd (mask!26078 thiss!1181) #b00000000000000000000000000000001)) (= (size!25759 (_keys!10148 thiss!1181)) (size!25760 (_values!5393 thiss!1181))) (bvsge (_size!2236 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2236 thiss!1181) (bvadd (mask!26078 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!111095 () Bool)

(declare-fun res!606627 () Bool)

(assert (=> d!111095 (=> (not res!606627) (not e!501838))))

(assert (=> d!111095 (= res!606627 (validMask!0 (mask!26078 thiss!1181)))))

(assert (=> d!111095 (= (simpleValid!318 thiss!1181) e!501838)))

(declare-fun b!897444 () Bool)

(declare-fun res!606626 () Bool)

(assert (=> b!897444 (=> (not res!606626) (not e!501838))))

(assert (=> b!897444 (= res!606626 (bvsge (size!25763 thiss!1181) (_size!2236 thiss!1181)))))

(declare-fun b!897446 () Bool)

(assert (=> b!897446 (= e!501838 (and (bvsge (extraKeys!5102 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5102 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2236 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!111095 res!606627) b!897443))

(assert (= (and b!897443 res!606624) b!897444))

(assert (= (and b!897444 res!606626) b!897445))

(assert (= (and b!897445 res!606625) b!897446))

(declare-fun m!834255 () Bool)

(assert (=> b!897445 m!834255))

(assert (=> d!111095 m!834199))

(assert (=> b!897444 m!834255))

(assert (=> d!111085 d!111095))

(declare-fun b!897459 () Bool)

(declare-fun c!94835 () Bool)

(declare-fun lt!405189 () (_ BitVec 64))

(assert (=> b!897459 (= c!94835 (= lt!405189 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501847 () SeekEntryResult!8908)

(declare-fun e!501845 () SeekEntryResult!8908)

(assert (=> b!897459 (= e!501847 e!501845)))

(declare-fun b!897460 () Bool)

(assert (=> b!897460 (= e!501845 (MissingVacant!8908 (index!38005 lt!405180)))))

(declare-fun b!897461 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897461 (= e!501845 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76448 lt!405180) #b00000000000000000000000000000001) (nextIndex!0 (index!38005 lt!405180) (x!76448 lt!405180) (mask!26078 thiss!1181)) (index!38005 lt!405180) key!785 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)))))

(declare-fun b!897462 () Bool)

(declare-fun e!501846 () SeekEntryResult!8908)

(assert (=> b!897462 (= e!501846 Undefined!8908)))

(declare-fun d!111097 () Bool)

(declare-fun lt!405190 () SeekEntryResult!8908)

(assert (=> d!111097 (and (or ((_ is Undefined!8908) lt!405190) (not ((_ is Found!8908) lt!405190)) (and (bvsge (index!38004 lt!405190) #b00000000000000000000000000000000) (bvslt (index!38004 lt!405190) (size!25759 (_keys!10148 thiss!1181))))) (or ((_ is Undefined!8908) lt!405190) ((_ is Found!8908) lt!405190) (not ((_ is MissingVacant!8908) lt!405190)) (not (= (index!38006 lt!405190) (index!38005 lt!405180))) (and (bvsge (index!38006 lt!405190) #b00000000000000000000000000000000) (bvslt (index!38006 lt!405190) (size!25759 (_keys!10148 thiss!1181))))) (or ((_ is Undefined!8908) lt!405190) (ite ((_ is Found!8908) lt!405190) (= (select (arr!25305 (_keys!10148 thiss!1181)) (index!38004 lt!405190)) key!785) (and ((_ is MissingVacant!8908) lt!405190) (= (index!38006 lt!405190) (index!38005 lt!405180)) (= (select (arr!25305 (_keys!10148 thiss!1181)) (index!38006 lt!405190)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111097 (= lt!405190 e!501846)))

(declare-fun c!94834 () Bool)

(assert (=> d!111097 (= c!94834 (bvsge (x!76448 lt!405180) #b01111111111111111111111111111110))))

(assert (=> d!111097 (= lt!405189 (select (arr!25305 (_keys!10148 thiss!1181)) (index!38005 lt!405180)))))

(assert (=> d!111097 (validMask!0 (mask!26078 thiss!1181))))

(assert (=> d!111097 (= (seekKeyOrZeroReturnVacant!0 (x!76448 lt!405180) (index!38005 lt!405180) (index!38005 lt!405180) key!785 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)) lt!405190)))

(declare-fun b!897463 () Bool)

(assert (=> b!897463 (= e!501846 e!501847)))

(declare-fun c!94833 () Bool)

(assert (=> b!897463 (= c!94833 (= lt!405189 key!785))))

(declare-fun b!897464 () Bool)

(assert (=> b!897464 (= e!501847 (Found!8908 (index!38005 lt!405180)))))

(assert (= (and d!111097 c!94834) b!897462))

(assert (= (and d!111097 (not c!94834)) b!897463))

(assert (= (and b!897463 c!94833) b!897464))

(assert (= (and b!897463 (not c!94833)) b!897459))

(assert (= (and b!897459 c!94835) b!897460))

(assert (= (and b!897459 (not c!94835)) b!897461))

(declare-fun m!834257 () Bool)

(assert (=> b!897461 m!834257))

(assert (=> b!897461 m!834257))

(declare-fun m!834259 () Bool)

(assert (=> b!897461 m!834259))

(declare-fun m!834261 () Bool)

(assert (=> d!111097 m!834261))

(declare-fun m!834263 () Bool)

(assert (=> d!111097 m!834263))

(assert (=> d!111097 m!834229))

(assert (=> d!111097 m!834199))

(assert (=> b!897407 d!111097))

(assert (=> d!111075 d!111077))

(declare-fun d!111099 () Bool)

(declare-fun e!501850 () Bool)

(assert (=> d!111099 e!501850))

(declare-fun res!606630 () Bool)

(assert (=> d!111099 (=> res!606630 e!501850)))

(declare-fun lt!405193 () SeekEntryResult!8908)

(assert (=> d!111099 (= res!606630 (not ((_ is Found!8908) lt!405193)))))

(assert (=> d!111099 (= lt!405193 (seekEntry!0 key!785 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)))))

(assert (=> d!111099 true))

(declare-fun _$36!363 () Unit!30506)

(assert (=> d!111099 (= (choose!1483 (_keys!10148 thiss!1181) (_values!5393 thiss!1181) (mask!26078 thiss!1181) (extraKeys!5102 thiss!1181) (zeroValue!5206 thiss!1181) (minValue!5206 thiss!1181) key!785) _$36!363)))

(declare-fun b!897467 () Bool)

(assert (=> b!897467 (= e!501850 (inRange!0 (index!38004 lt!405193) (mask!26078 thiss!1181)))))

(assert (= (and d!111099 (not res!606630)) b!897467))

(assert (=> d!111099 m!834197))

(declare-fun m!834265 () Bool)

(assert (=> b!897467 m!834265))

(assert (=> d!111075 d!111099))

(assert (=> d!111075 d!111087))

(declare-fun d!111101 () Bool)

(declare-fun lt!405196 () (_ BitVec 32))

(assert (=> d!111101 (and (bvsge lt!405196 #b00000000000000000000000000000000) (bvsle lt!405196 (bvsub (size!25759 (_keys!10148 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!501855 () (_ BitVec 32))

(assert (=> d!111101 (= lt!405196 e!501855)))

(declare-fun c!94841 () Bool)

(assert (=> d!111101 (= c!94841 (bvsge #b00000000000000000000000000000000 (size!25759 (_keys!10148 thiss!1181))))))

(assert (=> d!111101 (and (bvsle #b00000000000000000000000000000000 (size!25759 (_keys!10148 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25759 (_keys!10148 thiss!1181)) (size!25759 (_keys!10148 thiss!1181))))))

(assert (=> d!111101 (= (arrayCountValidKeys!0 (_keys!10148 thiss!1181) #b00000000000000000000000000000000 (size!25759 (_keys!10148 thiss!1181))) lt!405196)))

(declare-fun b!897476 () Bool)

(declare-fun e!501856 () (_ BitVec 32))

(declare-fun call!39808 () (_ BitVec 32))

(assert (=> b!897476 (= e!501856 call!39808)))

(declare-fun b!897477 () Bool)

(assert (=> b!897477 (= e!501855 #b00000000000000000000000000000000)))

(declare-fun bm!39805 () Bool)

(assert (=> bm!39805 (= call!39808 (arrayCountValidKeys!0 (_keys!10148 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25759 (_keys!10148 thiss!1181))))))

(declare-fun b!897478 () Bool)

(assert (=> b!897478 (= e!501855 e!501856)))

(declare-fun c!94840 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897478 (= c!94840 (validKeyInArray!0 (select (arr!25305 (_keys!10148 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897479 () Bool)

(assert (=> b!897479 (= e!501856 (bvadd #b00000000000000000000000000000001 call!39808))))

(assert (= (and d!111101 c!94841) b!897477))

(assert (= (and d!111101 (not c!94841)) b!897478))

(assert (= (and b!897478 c!94840) b!897479))

(assert (= (and b!897478 (not c!94840)) b!897476))

(assert (= (or b!897479 b!897476) bm!39805))

(declare-fun m!834267 () Bool)

(assert (=> bm!39805 m!834267))

(assert (=> b!897478 m!834247))

(assert (=> b!897478 m!834247))

(declare-fun m!834269 () Bool)

(assert (=> b!897478 m!834269))

(assert (=> b!897418 d!111101))

(declare-fun bm!39808 () Bool)

(declare-fun call!39811 () Bool)

(assert (=> bm!39808 (= call!39811 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10148 thiss!1181) (mask!26078 thiss!1181)))))

(declare-fun b!897488 () Bool)

(declare-fun e!501864 () Bool)

(declare-fun e!501865 () Bool)

(assert (=> b!897488 (= e!501864 e!501865)))

(declare-fun c!94844 () Bool)

(assert (=> b!897488 (= c!94844 (validKeyInArray!0 (select (arr!25305 (_keys!10148 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897489 () Bool)

(assert (=> b!897489 (= e!501865 call!39811)))

(declare-fun d!111103 () Bool)

(declare-fun res!606636 () Bool)

(assert (=> d!111103 (=> res!606636 e!501864)))

(assert (=> d!111103 (= res!606636 (bvsge #b00000000000000000000000000000000 (size!25759 (_keys!10148 thiss!1181))))))

(assert (=> d!111103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)) e!501864)))

(declare-fun b!897490 () Bool)

(declare-fun e!501863 () Bool)

(assert (=> b!897490 (= e!501863 call!39811)))

(declare-fun b!897491 () Bool)

(assert (=> b!897491 (= e!501865 e!501863)))

(declare-fun lt!405205 () (_ BitVec 64))

(assert (=> b!897491 (= lt!405205 (select (arr!25305 (_keys!10148 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405203 () Unit!30506)

(assert (=> b!897491 (= lt!405203 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10148 thiss!1181) lt!405205 #b00000000000000000000000000000000))))

(assert (=> b!897491 (arrayContainsKey!0 (_keys!10148 thiss!1181) lt!405205 #b00000000000000000000000000000000)))

(declare-fun lt!405204 () Unit!30506)

(assert (=> b!897491 (= lt!405204 lt!405203)))

(declare-fun res!606635 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52644 (_ BitVec 32)) SeekEntryResult!8908)

(assert (=> b!897491 (= res!606635 (= (seekEntryOrOpen!0 (select (arr!25305 (_keys!10148 thiss!1181)) #b00000000000000000000000000000000) (_keys!10148 thiss!1181) (mask!26078 thiss!1181)) (Found!8908 #b00000000000000000000000000000000)))))

(assert (=> b!897491 (=> (not res!606635) (not e!501863))))

(assert (= (and d!111103 (not res!606636)) b!897488))

(assert (= (and b!897488 c!94844) b!897491))

(assert (= (and b!897488 (not c!94844)) b!897489))

(assert (= (and b!897491 res!606635) b!897490))

(assert (= (or b!897490 b!897489) bm!39808))

(declare-fun m!834271 () Bool)

(assert (=> bm!39808 m!834271))

(assert (=> b!897488 m!834247))

(assert (=> b!897488 m!834247))

(assert (=> b!897488 m!834269))

(assert (=> b!897491 m!834247))

(declare-fun m!834273 () Bool)

(assert (=> b!897491 m!834273))

(declare-fun m!834275 () Bool)

(assert (=> b!897491 m!834275))

(assert (=> b!897491 m!834247))

(declare-fun m!834277 () Bool)

(assert (=> b!897491 m!834277))

(assert (=> b!897419 d!111103))

(declare-fun b!897502 () Bool)

(declare-fun e!501874 () Bool)

(declare-fun call!39814 () Bool)

(assert (=> b!897502 (= e!501874 call!39814)))

(declare-fun b!897503 () Bool)

(declare-fun e!501877 () Bool)

(declare-fun contains!4404 (List!17828 (_ BitVec 64)) Bool)

(assert (=> b!897503 (= e!501877 (contains!4404 Nil!17825 (select (arr!25305 (_keys!10148 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897504 () Bool)

(assert (=> b!897504 (= e!501874 call!39814)))

(declare-fun b!897505 () Bool)

(declare-fun e!501876 () Bool)

(declare-fun e!501875 () Bool)

(assert (=> b!897505 (= e!501876 e!501875)))

(declare-fun res!606644 () Bool)

(assert (=> b!897505 (=> (not res!606644) (not e!501875))))

(assert (=> b!897505 (= res!606644 (not e!501877))))

(declare-fun res!606643 () Bool)

(assert (=> b!897505 (=> (not res!606643) (not e!501877))))

(assert (=> b!897505 (= res!606643 (validKeyInArray!0 (select (arr!25305 (_keys!10148 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897506 () Bool)

(assert (=> b!897506 (= e!501875 e!501874)))

(declare-fun c!94847 () Bool)

(assert (=> b!897506 (= c!94847 (validKeyInArray!0 (select (arr!25305 (_keys!10148 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39811 () Bool)

(assert (=> bm!39811 (= call!39814 (arrayNoDuplicates!0 (_keys!10148 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94847 (Cons!17824 (select (arr!25305 (_keys!10148 thiss!1181)) #b00000000000000000000000000000000) Nil!17825) Nil!17825)))))

(declare-fun d!111105 () Bool)

(declare-fun res!606645 () Bool)

(assert (=> d!111105 (=> res!606645 e!501876)))

(assert (=> d!111105 (= res!606645 (bvsge #b00000000000000000000000000000000 (size!25759 (_keys!10148 thiss!1181))))))

(assert (=> d!111105 (= (arrayNoDuplicates!0 (_keys!10148 thiss!1181) #b00000000000000000000000000000000 Nil!17825) e!501876)))

(assert (= (and d!111105 (not res!606645)) b!897505))

(assert (= (and b!897505 res!606643) b!897503))

(assert (= (and b!897505 res!606644) b!897506))

(assert (= (and b!897506 c!94847) b!897504))

(assert (= (and b!897506 (not c!94847)) b!897502))

(assert (= (or b!897504 b!897502) bm!39811))

(assert (=> b!897503 m!834247))

(assert (=> b!897503 m!834247))

(declare-fun m!834279 () Bool)

(assert (=> b!897503 m!834279))

(assert (=> b!897505 m!834247))

(assert (=> b!897505 m!834247))

(assert (=> b!897505 m!834269))

(assert (=> b!897506 m!834247))

(assert (=> b!897506 m!834247))

(assert (=> b!897506 m!834269))

(assert (=> bm!39811 m!834247))

(declare-fun m!834281 () Bool)

(assert (=> bm!39811 m!834281))

(assert (=> b!897420 d!111105))

(declare-fun d!111107 () Bool)

(assert (=> d!111107 (= (inRange!0 (index!38004 lt!405169) (mask!26078 thiss!1181)) (and (bvsge (index!38004 lt!405169) #b00000000000000000000000000000000) (bvslt (index!38004 lt!405169) (bvadd (mask!26078 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897393 d!111107))

(declare-fun d!111109 () Bool)

(declare-fun res!606646 () Bool)

(declare-fun e!501878 () Bool)

(assert (=> d!111109 (=> res!606646 e!501878)))

(assert (=> d!111109 (= res!606646 (= (select (arr!25305 (_keys!10148 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111109 (= (arrayContainsKey!0 (_keys!10148 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!501878)))

(declare-fun b!897507 () Bool)

(declare-fun e!501879 () Bool)

(assert (=> b!897507 (= e!501878 e!501879)))

(declare-fun res!606647 () Bool)

(assert (=> b!897507 (=> (not res!606647) (not e!501879))))

(assert (=> b!897507 (= res!606647 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25759 (_keys!10148 thiss!1181))))))

(declare-fun b!897508 () Bool)

(assert (=> b!897508 (= e!501879 (arrayContainsKey!0 (_keys!10148 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111109 (not res!606646)) b!897507))

(assert (= (and b!897507 res!606647) b!897508))

(declare-fun m!834283 () Bool)

(assert (=> d!111109 m!834283))

(declare-fun m!834285 () Bool)

(assert (=> b!897508 m!834285))

(assert (=> b!897426 d!111109))

(declare-fun b!897527 () Bool)

(declare-fun e!501894 () SeekEntryResult!8908)

(assert (=> b!897527 (= e!501894 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26078 thiss!1181)) #b00000000000000000000000000000000 (mask!26078 thiss!1181)) key!785 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)))))

(declare-fun b!897528 () Bool)

(declare-fun e!501890 () SeekEntryResult!8908)

(assert (=> b!897528 (= e!501890 (Intermediate!8908 true (toIndex!0 key!785 (mask!26078 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!897529 () Bool)

(declare-fun lt!405211 () SeekEntryResult!8908)

(assert (=> b!897529 (and (bvsge (index!38005 lt!405211) #b00000000000000000000000000000000) (bvslt (index!38005 lt!405211) (size!25759 (_keys!10148 thiss!1181))))))

(declare-fun e!501891 () Bool)

(assert (=> b!897529 (= e!501891 (= (select (arr!25305 (_keys!10148 thiss!1181)) (index!38005 lt!405211)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!897530 () Bool)

(declare-fun e!501893 () Bool)

(assert (=> b!897530 (= e!501893 (bvsge (x!76448 lt!405211) #b01111111111111111111111111111110))))

(declare-fun b!897531 () Bool)

(declare-fun e!501892 () Bool)

(assert (=> b!897531 (= e!501893 e!501892)))

(declare-fun res!606656 () Bool)

(assert (=> b!897531 (= res!606656 (and ((_ is Intermediate!8908) lt!405211) (not (undefined!9720 lt!405211)) (bvslt (x!76448 lt!405211) #b01111111111111111111111111111110) (bvsge (x!76448 lt!405211) #b00000000000000000000000000000000) (bvsge (x!76448 lt!405211) #b00000000000000000000000000000000)))))

(assert (=> b!897531 (=> (not res!606656) (not e!501892))))

(declare-fun b!897532 () Bool)

(assert (=> b!897532 (and (bvsge (index!38005 lt!405211) #b00000000000000000000000000000000) (bvslt (index!38005 lt!405211) (size!25759 (_keys!10148 thiss!1181))))))

(declare-fun res!606654 () Bool)

(assert (=> b!897532 (= res!606654 (= (select (arr!25305 (_keys!10148 thiss!1181)) (index!38005 lt!405211)) key!785))))

(assert (=> b!897532 (=> res!606654 e!501891)))

(assert (=> b!897532 (= e!501892 e!501891)))

(declare-fun b!897534 () Bool)

(assert (=> b!897534 (and (bvsge (index!38005 lt!405211) #b00000000000000000000000000000000) (bvslt (index!38005 lt!405211) (size!25759 (_keys!10148 thiss!1181))))))

(declare-fun res!606655 () Bool)

(assert (=> b!897534 (= res!606655 (= (select (arr!25305 (_keys!10148 thiss!1181)) (index!38005 lt!405211)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897534 (=> res!606655 e!501891)))

(declare-fun b!897535 () Bool)

(assert (=> b!897535 (= e!501890 e!501894)))

(declare-fun c!94856 () Bool)

(declare-fun lt!405210 () (_ BitVec 64))

(assert (=> b!897535 (= c!94856 (or (= lt!405210 key!785) (= (bvadd lt!405210 lt!405210) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!897533 () Bool)

(assert (=> b!897533 (= e!501894 (Intermediate!8908 false (toIndex!0 key!785 (mask!26078 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun d!111111 () Bool)

(assert (=> d!111111 e!501893))

(declare-fun c!94855 () Bool)

(assert (=> d!111111 (= c!94855 (and ((_ is Intermediate!8908) lt!405211) (undefined!9720 lt!405211)))))

(assert (=> d!111111 (= lt!405211 e!501890)))

(declare-fun c!94854 () Bool)

(assert (=> d!111111 (= c!94854 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111111 (= lt!405210 (select (arr!25305 (_keys!10148 thiss!1181)) (toIndex!0 key!785 (mask!26078 thiss!1181))))))

(assert (=> d!111111 (validMask!0 (mask!26078 thiss!1181))))

(assert (=> d!111111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26078 thiss!1181)) key!785 (_keys!10148 thiss!1181) (mask!26078 thiss!1181)) lt!405211)))

(assert (= (and d!111111 c!94854) b!897528))

(assert (= (and d!111111 (not c!94854)) b!897535))

(assert (= (and b!897535 c!94856) b!897533))

(assert (= (and b!897535 (not c!94856)) b!897527))

(assert (= (and d!111111 c!94855) b!897530))

(assert (= (and d!111111 (not c!94855)) b!897531))

(assert (= (and b!897531 res!606656) b!897532))

(assert (= (and b!897532 (not res!606654)) b!897534))

(assert (= (and b!897534 (not res!606655)) b!897529))

(declare-fun m!834287 () Bool)

(assert (=> b!897534 m!834287))

(assert (=> d!111111 m!834235))

(declare-fun m!834289 () Bool)

(assert (=> d!111111 m!834289))

(assert (=> d!111111 m!834199))

(assert (=> b!897532 m!834287))

(assert (=> b!897527 m!834235))

(declare-fun m!834291 () Bool)

(assert (=> b!897527 m!834291))

(assert (=> b!897527 m!834291))

(declare-fun m!834293 () Bool)

(assert (=> b!897527 m!834293))

(assert (=> b!897529 m!834287))

(assert (=> d!111077 d!111111))

(declare-fun d!111113 () Bool)

(declare-fun lt!405217 () (_ BitVec 32))

(declare-fun lt!405216 () (_ BitVec 32))

(assert (=> d!111113 (= lt!405217 (bvmul (bvxor lt!405216 (bvlshr lt!405216 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111113 (= lt!405216 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111113 (and (bvsge (mask!26078 thiss!1181) #b00000000000000000000000000000000) (let ((res!606657 (let ((h!18966 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76466 (bvmul (bvxor h!18966 (bvlshr h!18966 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76466 (bvlshr x!76466 #b00000000000000000000000000001101)) (mask!26078 thiss!1181)))))) (and (bvslt res!606657 (bvadd (mask!26078 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606657 #b00000000000000000000000000000000))))))

(assert (=> d!111113 (= (toIndex!0 key!785 (mask!26078 thiss!1181)) (bvand (bvxor lt!405217 (bvlshr lt!405217 #b00000000000000000000000000001101)) (mask!26078 thiss!1181)))))

(assert (=> d!111077 d!111113))

(assert (=> d!111077 d!111087))

(declare-fun mapNonEmpty!29106 () Bool)

(declare-fun mapRes!29106 () Bool)

(declare-fun tp!56003 () Bool)

(declare-fun e!501895 () Bool)

(assert (=> mapNonEmpty!29106 (= mapRes!29106 (and tp!56003 e!501895))))

(declare-fun mapRest!29106 () (Array (_ BitVec 32) ValueCell!8673))

(declare-fun mapValue!29106 () ValueCell!8673)

(declare-fun mapKey!29106 () (_ BitVec 32))

(assert (=> mapNonEmpty!29106 (= mapRest!29105 (store mapRest!29106 mapKey!29106 mapValue!29106))))

(declare-fun b!897537 () Bool)

(declare-fun e!501896 () Bool)

(assert (=> b!897537 (= e!501896 tp_is_empty!18309)))

(declare-fun mapIsEmpty!29106 () Bool)

(assert (=> mapIsEmpty!29106 mapRes!29106))

(declare-fun b!897536 () Bool)

(assert (=> b!897536 (= e!501895 tp_is_empty!18309)))

(declare-fun condMapEmpty!29106 () Bool)

(declare-fun mapDefault!29106 () ValueCell!8673)

(assert (=> mapNonEmpty!29105 (= condMapEmpty!29106 (= mapRest!29105 ((as const (Array (_ BitVec 32) ValueCell!8673)) mapDefault!29106)))))

(assert (=> mapNonEmpty!29105 (= tp!56002 (and e!501896 mapRes!29106))))

(assert (= (and mapNonEmpty!29105 condMapEmpty!29106) mapIsEmpty!29106))

(assert (= (and mapNonEmpty!29105 (not condMapEmpty!29106)) mapNonEmpty!29106))

(assert (= (and mapNonEmpty!29106 ((_ is ValueCellFull!8673) mapValue!29106)) b!897536))

(assert (= (and mapNonEmpty!29105 ((_ is ValueCellFull!8673) mapDefault!29106)) b!897537))

(declare-fun m!834295 () Bool)

(assert (=> mapNonEmpty!29106 m!834295))

(check-sat b_and!26273 (not d!111093) (not b_next!15981) (not bm!39808) (not mapNonEmpty!29106) (not b!897478) (not b!897445) (not d!111095) (not b!897503) (not b!897461) tp_is_empty!18309 (not bm!39811) (not b!897444) (not d!111111) (not d!111097) (not b!897467) (not b!897506) (not b!897508) (not b!897491) (not b!897488) (not b!897527) (not b!897505) (not bm!39805) (not d!111099))
(check-sat b_and!26273 (not b_next!15981))
