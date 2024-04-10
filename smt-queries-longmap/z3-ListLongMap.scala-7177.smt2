; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91774 () Bool)

(assert start!91774)

(declare-fun b!1044339 () Bool)

(declare-fun b_free!21117 () Bool)

(declare-fun b_next!21117 () Bool)

(assert (=> b!1044339 (= b_free!21117 (not b_next!21117))))

(declare-fun tp!74597 () Bool)

(declare-fun b_and!33689 () Bool)

(assert (=> b!1044339 (= tp!74597 b_and!33689)))

(declare-fun mapIsEmpty!38885 () Bool)

(declare-fun mapRes!38885 () Bool)

(assert (=> mapIsEmpty!38885 mapRes!38885))

(declare-fun b!1044332 () Bool)

(declare-fun res!695576 () Bool)

(declare-fun e!591841 () Bool)

(assert (=> b!1044332 (=> (not res!695576) (not e!591841))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1044332 (= res!695576 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1044333 () Bool)

(declare-fun res!695578 () Bool)

(declare-fun e!591845 () Bool)

(assert (=> b!1044333 (=> res!695578 e!591845)))

(declare-datatypes ((V!37989 0))(
  ( (V!37990 (val!12469 Int)) )
))
(declare-datatypes ((ValueCell!11715 0))(
  ( (ValueCellFull!11715 (v!15061 V!37989)) (EmptyCell!11715) )
))
(declare-datatypes ((Unit!34099 0))(
  ( (Unit!34100) )
))
(declare-datatypes ((array!65842 0))(
  ( (array!65843 (arr!31671 (Array (_ BitVec 32) (_ BitVec 64))) (size!32206 (_ BitVec 32))) )
))
(declare-datatypes ((array!65844 0))(
  ( (array!65845 (arr!31672 (Array (_ BitVec 32) ValueCell!11715)) (size!32207 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6024 0))(
  ( (LongMapFixedSize!6025 (defaultEntry!6400 Int) (mask!30507 (_ BitVec 32)) (extraKeys!6128 (_ BitVec 32)) (zeroValue!6234 V!37989) (minValue!6234 V!37989) (_size!3067 (_ BitVec 32)) (_keys!11664 array!65842) (_values!6423 array!65844) (_vacant!3067 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15756 0))(
  ( (tuple2!15757 (_1!7889 Unit!34099) (_2!7889 LongMapFixedSize!6024)) )
))
(declare-fun lt!460637 () tuple2!15756)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044333 (= res!695578 (not (validMask!0 (mask!30507 (_2!7889 lt!460637)))))))

(declare-fun b!1044334 () Bool)

(assert (=> b!1044334 (= e!591845 (= (size!32207 (_values!6423 (_2!7889 lt!460637))) (bvadd #b00000000000000000000000000000001 (mask!30507 (_2!7889 lt!460637)))))))

(declare-fun b!1044335 () Bool)

(declare-fun e!591842 () Bool)

(declare-fun e!591840 () Bool)

(assert (=> b!1044335 (= e!591842 (and e!591840 mapRes!38885))))

(declare-fun condMapEmpty!38885 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!6024)

(declare-fun mapDefault!38885 () ValueCell!11715)

(assert (=> b!1044335 (= condMapEmpty!38885 (= (arr!31672 (_values!6423 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11715)) mapDefault!38885)))))

(declare-fun mapNonEmpty!38885 () Bool)

(declare-fun tp!74598 () Bool)

(declare-fun e!591846 () Bool)

(assert (=> mapNonEmpty!38885 (= mapRes!38885 (and tp!74598 e!591846))))

(declare-fun mapRest!38885 () (Array (_ BitVec 32) ValueCell!11715))

(declare-fun mapKey!38885 () (_ BitVec 32))

(declare-fun mapValue!38885 () ValueCell!11715)

(assert (=> mapNonEmpty!38885 (= (arr!31672 (_values!6423 thiss!1427)) (store mapRest!38885 mapKey!38885 mapValue!38885))))

(declare-fun b!1044336 () Bool)

(declare-fun tp_is_empty!24837 () Bool)

(assert (=> b!1044336 (= e!591840 tp_is_empty!24837)))

(declare-fun res!695579 () Bool)

(assert (=> start!91774 (=> (not res!695579) (not e!591841))))

(declare-fun valid!2260 (LongMapFixedSize!6024) Bool)

(assert (=> start!91774 (= res!695579 (valid!2260 thiss!1427))))

(assert (=> start!91774 e!591841))

(declare-fun e!591844 () Bool)

(assert (=> start!91774 e!591844))

(assert (=> start!91774 true))

(declare-fun b!1044337 () Bool)

(assert (=> b!1044337 (= e!591846 tp_is_empty!24837)))

(declare-fun b!1044338 () Bool)

(declare-fun e!591843 () Bool)

(assert (=> b!1044338 (= e!591843 (not e!591845))))

(declare-fun res!695580 () Bool)

(assert (=> b!1044338 (=> res!695580 e!591845)))

(declare-datatypes ((tuple2!15758 0))(
  ( (tuple2!15759 (_1!7890 (_ BitVec 64)) (_2!7890 V!37989)) )
))
(declare-datatypes ((List!22004 0))(
  ( (Nil!22001) (Cons!22000 (h!23208 tuple2!15758) (t!31242 List!22004)) )
))
(declare-datatypes ((ListLongMap!13779 0))(
  ( (ListLongMap!13780 (toList!6905 List!22004)) )
))
(declare-fun contains!6070 (ListLongMap!13779 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3953 (array!65842 array!65844 (_ BitVec 32) (_ BitVec 32) V!37989 V!37989 (_ BitVec 32) Int) ListLongMap!13779)

(assert (=> b!1044338 (= res!695580 (not (contains!6070 (getCurrentListMap!3953 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637))) key!909)))))

(declare-fun lt!460638 () array!65844)

(declare-fun lt!460635 () array!65842)

(declare-fun Unit!34101 () Unit!34099)

(declare-fun Unit!34102 () Unit!34099)

(assert (=> b!1044338 (= lt!460637 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3067 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15757 Unit!34101 (LongMapFixedSize!6025 (defaultEntry!6400 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) (bvsub (_size!3067 thiss!1427) #b00000000000000000000000000000001) lt!460635 lt!460638 (bvadd #b00000000000000000000000000000001 (_vacant!3067 thiss!1427)))) (tuple2!15757 Unit!34102 (LongMapFixedSize!6025 (defaultEntry!6400 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) (bvsub (_size!3067 thiss!1427) #b00000000000000000000000000000001) lt!460635 lt!460638 (_vacant!3067 thiss!1427)))))))

(declare-fun -!532 (ListLongMap!13779 (_ BitVec 64)) ListLongMap!13779)

(assert (=> b!1044338 (= (-!532 (getCurrentListMap!3953 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)) key!909) (getCurrentListMap!3953 lt!460635 lt!460638 (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9839 0))(
  ( (MissingZero!9839 (index!41727 (_ BitVec 32))) (Found!9839 (index!41728 (_ BitVec 32))) (Intermediate!9839 (undefined!10651 Bool) (index!41729 (_ BitVec 32)) (x!93255 (_ BitVec 32))) (Undefined!9839) (MissingVacant!9839 (index!41730 (_ BitVec 32))) )
))
(declare-fun lt!460642 () SeekEntryResult!9839)

(declare-fun dynLambda!2002 (Int (_ BitVec 64)) V!37989)

(assert (=> b!1044338 (= lt!460638 (array!65845 (store (arr!31672 (_values!6423 thiss!1427)) (index!41728 lt!460642) (ValueCellFull!11715 (dynLambda!2002 (defaultEntry!6400 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32207 (_values!6423 thiss!1427))))))

(declare-fun lt!460643 () Unit!34099)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!53 (array!65842 array!65844 (_ BitVec 32) (_ BitVec 32) V!37989 V!37989 (_ BitVec 32) (_ BitVec 64) Int) Unit!34099)

(assert (=> b!1044338 (= lt!460643 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!53 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) (index!41728 lt!460642) key!909 (defaultEntry!6400 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044338 (not (arrayContainsKey!0 lt!460635 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460639 () Unit!34099)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65842 (_ BitVec 32) (_ BitVec 64)) Unit!34099)

(assert (=> b!1044338 (= lt!460639 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11664 thiss!1427) (index!41728 lt!460642) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65842 (_ BitVec 32)) Bool)

(assert (=> b!1044338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460635 (mask!30507 thiss!1427))))

(declare-fun lt!460640 () Unit!34099)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65842 (_ BitVec 32) (_ BitVec 32)) Unit!34099)

(assert (=> b!1044338 (= lt!460640 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11664 thiss!1427) (index!41728 lt!460642) (mask!30507 thiss!1427)))))

(declare-datatypes ((List!22005 0))(
  ( (Nil!22002) (Cons!22001 (h!23209 (_ BitVec 64)) (t!31243 List!22005)) )
))
(declare-fun arrayNoDuplicates!0 (array!65842 (_ BitVec 32) List!22005) Bool)

(assert (=> b!1044338 (arrayNoDuplicates!0 lt!460635 #b00000000000000000000000000000000 Nil!22002)))

(declare-fun lt!460636 () Unit!34099)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65842 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22005) Unit!34099)

(assert (=> b!1044338 (= lt!460636 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11664 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41728 lt!460642) #b00000000000000000000000000000000 Nil!22002))))

(declare-fun arrayCountValidKeys!0 (array!65842 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044338 (= (arrayCountValidKeys!0 lt!460635 #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044338 (= lt!460635 (array!65843 (store (arr!31671 (_keys!11664 thiss!1427)) (index!41728 lt!460642) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32206 (_keys!11664 thiss!1427))))))

(declare-fun lt!460641 () Unit!34099)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65842 (_ BitVec 32) (_ BitVec 64)) Unit!34099)

(assert (=> b!1044338 (= lt!460641 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11664 thiss!1427) (index!41728 lt!460642) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!24463 (array!65842) Bool)

(declare-fun array_inv!24464 (array!65844) Bool)

(assert (=> b!1044339 (= e!591844 (and tp!74597 tp_is_empty!24837 (array_inv!24463 (_keys!11664 thiss!1427)) (array_inv!24464 (_values!6423 thiss!1427)) e!591842))))

(declare-fun b!1044340 () Bool)

(assert (=> b!1044340 (= e!591841 e!591843)))

(declare-fun res!695577 () Bool)

(assert (=> b!1044340 (=> (not res!695577) (not e!591843))))

(get-info :version)

(assert (=> b!1044340 (= res!695577 ((_ is Found!9839) lt!460642))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65842 (_ BitVec 32)) SeekEntryResult!9839)

(assert (=> b!1044340 (= lt!460642 (seekEntry!0 key!909 (_keys!11664 thiss!1427) (mask!30507 thiss!1427)))))

(assert (= (and start!91774 res!695579) b!1044332))

(assert (= (and b!1044332 res!695576) b!1044340))

(assert (= (and b!1044340 res!695577) b!1044338))

(assert (= (and b!1044338 (not res!695580)) b!1044333))

(assert (= (and b!1044333 (not res!695578)) b!1044334))

(assert (= (and b!1044335 condMapEmpty!38885) mapIsEmpty!38885))

(assert (= (and b!1044335 (not condMapEmpty!38885)) mapNonEmpty!38885))

(assert (= (and mapNonEmpty!38885 ((_ is ValueCellFull!11715) mapValue!38885)) b!1044337))

(assert (= (and b!1044335 ((_ is ValueCellFull!11715) mapDefault!38885)) b!1044336))

(assert (= b!1044339 b!1044335))

(assert (= start!91774 b!1044339))

(declare-fun b_lambda!16221 () Bool)

(assert (=> (not b_lambda!16221) (not b!1044338)))

(declare-fun t!31241 () Bool)

(declare-fun tb!7059 () Bool)

(assert (=> (and b!1044339 (= (defaultEntry!6400 thiss!1427) (defaultEntry!6400 thiss!1427)) t!31241) tb!7059))

(declare-fun result!14543 () Bool)

(assert (=> tb!7059 (= result!14543 tp_is_empty!24837)))

(assert (=> b!1044338 t!31241))

(declare-fun b_and!33691 () Bool)

(assert (= b_and!33689 (and (=> t!31241 result!14543) b_and!33691)))

(declare-fun m!963749 () Bool)

(assert (=> start!91774 m!963749))

(declare-fun m!963751 () Bool)

(assert (=> b!1044339 m!963751))

(declare-fun m!963753 () Bool)

(assert (=> b!1044339 m!963753))

(declare-fun m!963755 () Bool)

(assert (=> b!1044340 m!963755))

(declare-fun m!963757 () Bool)

(assert (=> b!1044333 m!963757))

(declare-fun m!963759 () Bool)

(assert (=> mapNonEmpty!38885 m!963759))

(declare-fun m!963761 () Bool)

(assert (=> b!1044338 m!963761))

(declare-fun m!963763 () Bool)

(assert (=> b!1044338 m!963763))

(declare-fun m!963765 () Bool)

(assert (=> b!1044338 m!963765))

(declare-fun m!963767 () Bool)

(assert (=> b!1044338 m!963767))

(declare-fun m!963769 () Bool)

(assert (=> b!1044338 m!963769))

(declare-fun m!963771 () Bool)

(assert (=> b!1044338 m!963771))

(declare-fun m!963773 () Bool)

(assert (=> b!1044338 m!963773))

(declare-fun m!963775 () Bool)

(assert (=> b!1044338 m!963775))

(declare-fun m!963777 () Bool)

(assert (=> b!1044338 m!963777))

(declare-fun m!963779 () Bool)

(assert (=> b!1044338 m!963779))

(declare-fun m!963781 () Bool)

(assert (=> b!1044338 m!963781))

(declare-fun m!963783 () Bool)

(assert (=> b!1044338 m!963783))

(assert (=> b!1044338 m!963765))

(declare-fun m!963785 () Bool)

(assert (=> b!1044338 m!963785))

(declare-fun m!963787 () Bool)

(assert (=> b!1044338 m!963787))

(declare-fun m!963789 () Bool)

(assert (=> b!1044338 m!963789))

(declare-fun m!963791 () Bool)

(assert (=> b!1044338 m!963791))

(declare-fun m!963793 () Bool)

(assert (=> b!1044338 m!963793))

(assert (=> b!1044338 m!963785))

(declare-fun m!963795 () Bool)

(assert (=> b!1044338 m!963795))

(check-sat (not b!1044338) (not b!1044340) tp_is_empty!24837 b_and!33691 (not b_next!21117) (not b_lambda!16221) (not mapNonEmpty!38885) (not b!1044339) (not b!1044333) (not start!91774))
(check-sat b_and!33691 (not b_next!21117))
(get-model)

(declare-fun b_lambda!16225 () Bool)

(assert (= b_lambda!16221 (or (and b!1044339 b_free!21117) b_lambda!16225)))

(check-sat (not b!1044338) (not b_lambda!16225) (not b!1044340) tp_is_empty!24837 b_and!33691 (not b_next!21117) (not mapNonEmpty!38885) (not b!1044339) (not b!1044333) (not start!91774))
(check-sat b_and!33691 (not b_next!21117))
(get-model)

(declare-fun b!1044384 () Bool)

(declare-fun e!591878 () SeekEntryResult!9839)

(assert (=> b!1044384 (= e!591878 Undefined!9839)))

(declare-fun b!1044385 () Bool)

(declare-fun e!591879 () SeekEntryResult!9839)

(declare-fun lt!460680 () SeekEntryResult!9839)

(assert (=> b!1044385 (= e!591879 (Found!9839 (index!41729 lt!460680)))))

(declare-fun b!1044386 () Bool)

(assert (=> b!1044386 (= e!591878 e!591879)))

(declare-fun lt!460679 () (_ BitVec 64))

(assert (=> b!1044386 (= lt!460679 (select (arr!31671 (_keys!11664 thiss!1427)) (index!41729 lt!460680)))))

(declare-fun c!106089 () Bool)

(assert (=> b!1044386 (= c!106089 (= lt!460679 key!909))))

(declare-fun d!126375 () Bool)

(declare-fun lt!460682 () SeekEntryResult!9839)

(assert (=> d!126375 (and (or ((_ is MissingVacant!9839) lt!460682) (not ((_ is Found!9839) lt!460682)) (and (bvsge (index!41728 lt!460682) #b00000000000000000000000000000000) (bvslt (index!41728 lt!460682) (size!32206 (_keys!11664 thiss!1427))))) (not ((_ is MissingVacant!9839) lt!460682)) (or (not ((_ is Found!9839) lt!460682)) (= (select (arr!31671 (_keys!11664 thiss!1427)) (index!41728 lt!460682)) key!909)))))

(assert (=> d!126375 (= lt!460682 e!591878)))

(declare-fun c!106091 () Bool)

(assert (=> d!126375 (= c!106091 (and ((_ is Intermediate!9839) lt!460680) (undefined!10651 lt!460680)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65842 (_ BitVec 32)) SeekEntryResult!9839)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126375 (= lt!460680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30507 thiss!1427)) key!909 (_keys!11664 thiss!1427) (mask!30507 thiss!1427)))))

(assert (=> d!126375 (validMask!0 (mask!30507 thiss!1427))))

(assert (=> d!126375 (= (seekEntry!0 key!909 (_keys!11664 thiss!1427) (mask!30507 thiss!1427)) lt!460682)))

(declare-fun b!1044387 () Bool)

(declare-fun c!106090 () Bool)

(assert (=> b!1044387 (= c!106090 (= lt!460679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!591880 () SeekEntryResult!9839)

(assert (=> b!1044387 (= e!591879 e!591880)))

(declare-fun b!1044388 () Bool)

(assert (=> b!1044388 (= e!591880 (MissingZero!9839 (index!41729 lt!460680)))))

(declare-fun b!1044389 () Bool)

(declare-fun lt!460681 () SeekEntryResult!9839)

(assert (=> b!1044389 (= e!591880 (ite ((_ is MissingVacant!9839) lt!460681) (MissingZero!9839 (index!41730 lt!460681)) lt!460681))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65842 (_ BitVec 32)) SeekEntryResult!9839)

(assert (=> b!1044389 (= lt!460681 (seekKeyOrZeroReturnVacant!0 (x!93255 lt!460680) (index!41729 lt!460680) (index!41729 lt!460680) key!909 (_keys!11664 thiss!1427) (mask!30507 thiss!1427)))))

(assert (= (and d!126375 c!106091) b!1044384))

(assert (= (and d!126375 (not c!106091)) b!1044386))

(assert (= (and b!1044386 c!106089) b!1044385))

(assert (= (and b!1044386 (not c!106089)) b!1044387))

(assert (= (and b!1044387 c!106090) b!1044388))

(assert (= (and b!1044387 (not c!106090)) b!1044389))

(declare-fun m!963845 () Bool)

(assert (=> b!1044386 m!963845))

(declare-fun m!963847 () Bool)

(assert (=> d!126375 m!963847))

(declare-fun m!963849 () Bool)

(assert (=> d!126375 m!963849))

(assert (=> d!126375 m!963849))

(declare-fun m!963851 () Bool)

(assert (=> d!126375 m!963851))

(declare-fun m!963853 () Bool)

(assert (=> d!126375 m!963853))

(declare-fun m!963855 () Bool)

(assert (=> b!1044389 m!963855))

(assert (=> b!1044340 d!126375))

(declare-fun d!126377 () Bool)

(declare-fun e!591885 () Bool)

(assert (=> d!126377 e!591885))

(declare-fun res!695598 () Bool)

(assert (=> d!126377 (=> res!695598 e!591885)))

(declare-fun lt!460692 () Bool)

(assert (=> d!126377 (= res!695598 (not lt!460692))))

(declare-fun lt!460694 () Bool)

(assert (=> d!126377 (= lt!460692 lt!460694)))

(declare-fun lt!460693 () Unit!34099)

(declare-fun e!591886 () Unit!34099)

(assert (=> d!126377 (= lt!460693 e!591886)))

(declare-fun c!106094 () Bool)

(assert (=> d!126377 (= c!106094 lt!460694)))

(declare-fun containsKey!566 (List!22004 (_ BitVec 64)) Bool)

(assert (=> d!126377 (= lt!460694 (containsKey!566 (toList!6905 (getCurrentListMap!3953 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637)))) key!909))))

(assert (=> d!126377 (= (contains!6070 (getCurrentListMap!3953 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637))) key!909) lt!460692)))

(declare-fun b!1044396 () Bool)

(declare-fun lt!460691 () Unit!34099)

(assert (=> b!1044396 (= e!591886 lt!460691)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!399 (List!22004 (_ BitVec 64)) Unit!34099)

(assert (=> b!1044396 (= lt!460691 (lemmaContainsKeyImpliesGetValueByKeyDefined!399 (toList!6905 (getCurrentListMap!3953 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637)))) key!909))))

(declare-datatypes ((Option!642 0))(
  ( (Some!641 (v!15063 V!37989)) (None!640) )
))
(declare-fun isDefined!438 (Option!642) Bool)

(declare-fun getValueByKey!591 (List!22004 (_ BitVec 64)) Option!642)

(assert (=> b!1044396 (isDefined!438 (getValueByKey!591 (toList!6905 (getCurrentListMap!3953 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637)))) key!909))))

(declare-fun b!1044397 () Bool)

(declare-fun Unit!34107 () Unit!34099)

(assert (=> b!1044397 (= e!591886 Unit!34107)))

(declare-fun b!1044398 () Bool)

(assert (=> b!1044398 (= e!591885 (isDefined!438 (getValueByKey!591 (toList!6905 (getCurrentListMap!3953 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637)))) key!909)))))

(assert (= (and d!126377 c!106094) b!1044396))

(assert (= (and d!126377 (not c!106094)) b!1044397))

(assert (= (and d!126377 (not res!695598)) b!1044398))

(declare-fun m!963857 () Bool)

(assert (=> d!126377 m!963857))

(declare-fun m!963859 () Bool)

(assert (=> b!1044396 m!963859))

(declare-fun m!963861 () Bool)

(assert (=> b!1044396 m!963861))

(assert (=> b!1044396 m!963861))

(declare-fun m!963863 () Bool)

(assert (=> b!1044396 m!963863))

(assert (=> b!1044398 m!963861))

(assert (=> b!1044398 m!963861))

(assert (=> b!1044398 m!963863))

(assert (=> b!1044338 d!126377))

(declare-fun b!1044407 () Bool)

(declare-fun e!591894 () Bool)

(declare-fun call!44346 () Bool)

(assert (=> b!1044407 (= e!591894 call!44346)))

(declare-fun b!1044408 () Bool)

(declare-fun e!591893 () Bool)

(declare-fun e!591895 () Bool)

(assert (=> b!1044408 (= e!591893 e!591895)))

(declare-fun c!106097 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1044408 (= c!106097 (validKeyInArray!0 (select (arr!31671 lt!460635) #b00000000000000000000000000000000)))))

(declare-fun bm!44343 () Bool)

(assert (=> bm!44343 (= call!44346 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460635 (mask!30507 thiss!1427)))))

(declare-fun d!126379 () Bool)

(declare-fun res!695603 () Bool)

(assert (=> d!126379 (=> res!695603 e!591893)))

(assert (=> d!126379 (= res!695603 (bvsge #b00000000000000000000000000000000 (size!32206 lt!460635)))))

(assert (=> d!126379 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460635 (mask!30507 thiss!1427)) e!591893)))

(declare-fun b!1044409 () Bool)

(assert (=> b!1044409 (= e!591895 e!591894)))

(declare-fun lt!460703 () (_ BitVec 64))

(assert (=> b!1044409 (= lt!460703 (select (arr!31671 lt!460635) #b00000000000000000000000000000000))))

(declare-fun lt!460701 () Unit!34099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65842 (_ BitVec 64) (_ BitVec 32)) Unit!34099)

(assert (=> b!1044409 (= lt!460701 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460635 lt!460703 #b00000000000000000000000000000000))))

(assert (=> b!1044409 (arrayContainsKey!0 lt!460635 lt!460703 #b00000000000000000000000000000000)))

(declare-fun lt!460702 () Unit!34099)

(assert (=> b!1044409 (= lt!460702 lt!460701)))

(declare-fun res!695604 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65842 (_ BitVec 32)) SeekEntryResult!9839)

(assert (=> b!1044409 (= res!695604 (= (seekEntryOrOpen!0 (select (arr!31671 lt!460635) #b00000000000000000000000000000000) lt!460635 (mask!30507 thiss!1427)) (Found!9839 #b00000000000000000000000000000000)))))

(assert (=> b!1044409 (=> (not res!695604) (not e!591894))))

(declare-fun b!1044410 () Bool)

(assert (=> b!1044410 (= e!591895 call!44346)))

(assert (= (and d!126379 (not res!695603)) b!1044408))

(assert (= (and b!1044408 c!106097) b!1044409))

(assert (= (and b!1044408 (not c!106097)) b!1044410))

(assert (= (and b!1044409 res!695604) b!1044407))

(assert (= (or b!1044407 b!1044410) bm!44343))

(declare-fun m!963865 () Bool)

(assert (=> b!1044408 m!963865))

(assert (=> b!1044408 m!963865))

(declare-fun m!963867 () Bool)

(assert (=> b!1044408 m!963867))

(declare-fun m!963869 () Bool)

(assert (=> bm!44343 m!963869))

(assert (=> b!1044409 m!963865))

(declare-fun m!963871 () Bool)

(assert (=> b!1044409 m!963871))

(declare-fun m!963873 () Bool)

(assert (=> b!1044409 m!963873))

(assert (=> b!1044409 m!963865))

(declare-fun m!963875 () Bool)

(assert (=> b!1044409 m!963875))

(assert (=> b!1044338 d!126379))

(declare-fun b!1044453 () Bool)

(declare-fun e!591926 () ListLongMap!13779)

(declare-fun call!44365 () ListLongMap!13779)

(assert (=> b!1044453 (= e!591926 call!44365)))

(declare-fun b!1044454 () Bool)

(declare-fun c!106113 () Bool)

(assert (=> b!1044454 (= c!106113 (and (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591929 () ListLongMap!13779)

(assert (=> b!1044454 (= e!591929 e!591926)))

(declare-fun b!1044455 () Bool)

(declare-fun e!591930 () Bool)

(declare-fun lt!460768 () ListLongMap!13779)

(declare-fun apply!911 (ListLongMap!13779 (_ BitVec 64)) V!37989)

(assert (=> b!1044455 (= e!591930 (= (apply!911 lt!460768 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6234 thiss!1427)))))

(declare-fun b!1044456 () Bool)

(declare-fun e!591925 () Bool)

(declare-fun call!44362 () Bool)

(assert (=> b!1044456 (= e!591925 (not call!44362))))

(declare-fun b!1044457 () Bool)

(declare-fun e!591927 () ListLongMap!13779)

(declare-fun call!44363 () ListLongMap!13779)

(declare-fun +!3109 (ListLongMap!13779 tuple2!15758) ListLongMap!13779)

(assert (=> b!1044457 (= e!591927 (+!3109 call!44363 (tuple2!15759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6234 thiss!1427))))))

(declare-fun bm!44358 () Bool)

(declare-fun call!44361 () ListLongMap!13779)

(declare-fun getCurrentListMapNoExtraKeys!3525 (array!65842 array!65844 (_ BitVec 32) (_ BitVec 32) V!37989 V!37989 (_ BitVec 32) Int) ListLongMap!13779)

(assert (=> bm!44358 (= call!44361 (getCurrentListMapNoExtraKeys!3525 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)))))

(declare-fun b!1044458 () Bool)

(declare-fun e!591933 () Bool)

(declare-fun get!16550 (ValueCell!11715 V!37989) V!37989)

(assert (=> b!1044458 (= e!591933 (= (apply!911 lt!460768 (select (arr!31671 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)) (get!16550 (select (arr!31672 (_values!6423 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2002 (defaultEntry!6400 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32207 (_values!6423 thiss!1427))))))

(assert (=> b!1044458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))))))

(declare-fun b!1044459 () Bool)

(declare-fun call!44366 () ListLongMap!13779)

(assert (=> b!1044459 (= e!591926 call!44366)))

(declare-fun bm!44359 () Bool)

(declare-fun c!106114 () Bool)

(declare-fun call!44364 () ListLongMap!13779)

(declare-fun c!106115 () Bool)

(assert (=> bm!44359 (= call!44363 (+!3109 (ite c!106114 call!44361 (ite c!106115 call!44364 call!44366)) (ite (or c!106114 c!106115) (tuple2!15759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6234 thiss!1427)) (tuple2!15759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6234 thiss!1427)))))))

(declare-fun b!1044460 () Bool)

(declare-fun e!591923 () Bool)

(assert (=> b!1044460 (= e!591923 (validKeyInArray!0 (select (arr!31671 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44360 () Bool)

(assert (=> bm!44360 (= call!44362 (contains!6070 lt!460768 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44361 () Bool)

(assert (=> bm!44361 (= call!44366 call!44364)))

(declare-fun b!1044461 () Bool)

(assert (=> b!1044461 (= e!591927 e!591929)))

(assert (=> b!1044461 (= c!106115 (and (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044462 () Bool)

(declare-fun res!695630 () Bool)

(declare-fun e!591922 () Bool)

(assert (=> b!1044462 (=> (not res!695630) (not e!591922))))

(declare-fun e!591924 () Bool)

(assert (=> b!1044462 (= res!695630 e!591924)))

(declare-fun c!106112 () Bool)

(assert (=> b!1044462 (= c!106112 (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1044463 () Bool)

(assert (=> b!1044463 (= e!591925 e!591930)))

(declare-fun res!695623 () Bool)

(assert (=> b!1044463 (= res!695623 call!44362)))

(assert (=> b!1044463 (=> (not res!695623) (not e!591930))))

(declare-fun d!126381 () Bool)

(assert (=> d!126381 e!591922))

(declare-fun res!695629 () Bool)

(assert (=> d!126381 (=> (not res!695629) (not e!591922))))

(assert (=> d!126381 (= res!695629 (or (bvsge #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))))))))

(declare-fun lt!460758 () ListLongMap!13779)

(assert (=> d!126381 (= lt!460768 lt!460758)))

(declare-fun lt!460769 () Unit!34099)

(declare-fun e!591928 () Unit!34099)

(assert (=> d!126381 (= lt!460769 e!591928)))

(declare-fun c!106111 () Bool)

(assert (=> d!126381 (= c!106111 e!591923)))

(declare-fun res!695628 () Bool)

(assert (=> d!126381 (=> (not res!695628) (not e!591923))))

(assert (=> d!126381 (= res!695628 (bvslt #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))))))

(assert (=> d!126381 (= lt!460758 e!591927)))

(assert (=> d!126381 (= c!106114 (and (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126381 (validMask!0 (mask!30507 thiss!1427))))

(assert (=> d!126381 (= (getCurrentListMap!3953 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)) lt!460768)))

(declare-fun b!1044464 () Bool)

(declare-fun lt!460756 () Unit!34099)

(assert (=> b!1044464 (= e!591928 lt!460756)))

(declare-fun lt!460749 () ListLongMap!13779)

(assert (=> b!1044464 (= lt!460749 (getCurrentListMapNoExtraKeys!3525 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)))))

(declare-fun lt!460766 () (_ BitVec 64))

(assert (=> b!1044464 (= lt!460766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460750 () (_ BitVec 64))

(assert (=> b!1044464 (= lt!460750 (select (arr!31671 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460762 () Unit!34099)

(declare-fun addStillContains!630 (ListLongMap!13779 (_ BitVec 64) V!37989 (_ BitVec 64)) Unit!34099)

(assert (=> b!1044464 (= lt!460762 (addStillContains!630 lt!460749 lt!460766 (zeroValue!6234 thiss!1427) lt!460750))))

(assert (=> b!1044464 (contains!6070 (+!3109 lt!460749 (tuple2!15759 lt!460766 (zeroValue!6234 thiss!1427))) lt!460750)))

(declare-fun lt!460760 () Unit!34099)

(assert (=> b!1044464 (= lt!460760 lt!460762)))

(declare-fun lt!460761 () ListLongMap!13779)

(assert (=> b!1044464 (= lt!460761 (getCurrentListMapNoExtraKeys!3525 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)))))

(declare-fun lt!460748 () (_ BitVec 64))

(assert (=> b!1044464 (= lt!460748 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460752 () (_ BitVec 64))

(assert (=> b!1044464 (= lt!460752 (select (arr!31671 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460751 () Unit!34099)

(declare-fun addApplyDifferent!490 (ListLongMap!13779 (_ BitVec 64) V!37989 (_ BitVec 64)) Unit!34099)

(assert (=> b!1044464 (= lt!460751 (addApplyDifferent!490 lt!460761 lt!460748 (minValue!6234 thiss!1427) lt!460752))))

(assert (=> b!1044464 (= (apply!911 (+!3109 lt!460761 (tuple2!15759 lt!460748 (minValue!6234 thiss!1427))) lt!460752) (apply!911 lt!460761 lt!460752))))

(declare-fun lt!460753 () Unit!34099)

(assert (=> b!1044464 (= lt!460753 lt!460751)))

(declare-fun lt!460764 () ListLongMap!13779)

(assert (=> b!1044464 (= lt!460764 (getCurrentListMapNoExtraKeys!3525 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)))))

(declare-fun lt!460765 () (_ BitVec 64))

(assert (=> b!1044464 (= lt!460765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460763 () (_ BitVec 64))

(assert (=> b!1044464 (= lt!460763 (select (arr!31671 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460757 () Unit!34099)

(assert (=> b!1044464 (= lt!460757 (addApplyDifferent!490 lt!460764 lt!460765 (zeroValue!6234 thiss!1427) lt!460763))))

(assert (=> b!1044464 (= (apply!911 (+!3109 lt!460764 (tuple2!15759 lt!460765 (zeroValue!6234 thiss!1427))) lt!460763) (apply!911 lt!460764 lt!460763))))

(declare-fun lt!460755 () Unit!34099)

(assert (=> b!1044464 (= lt!460755 lt!460757)))

(declare-fun lt!460754 () ListLongMap!13779)

(assert (=> b!1044464 (= lt!460754 (getCurrentListMapNoExtraKeys!3525 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)))))

(declare-fun lt!460759 () (_ BitVec 64))

(assert (=> b!1044464 (= lt!460759 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460767 () (_ BitVec 64))

(assert (=> b!1044464 (= lt!460767 (select (arr!31671 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044464 (= lt!460756 (addApplyDifferent!490 lt!460754 lt!460759 (minValue!6234 thiss!1427) lt!460767))))

(assert (=> b!1044464 (= (apply!911 (+!3109 lt!460754 (tuple2!15759 lt!460759 (minValue!6234 thiss!1427))) lt!460767) (apply!911 lt!460754 lt!460767))))

(declare-fun b!1044465 () Bool)

(declare-fun Unit!34108 () Unit!34099)

(assert (=> b!1044465 (= e!591928 Unit!34108)))

(declare-fun bm!44362 () Bool)

(declare-fun call!44367 () Bool)

(assert (=> bm!44362 (= call!44367 (contains!6070 lt!460768 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044466 () Bool)

(assert (=> b!1044466 (= e!591922 e!591925)))

(declare-fun c!106110 () Bool)

(assert (=> b!1044466 (= c!106110 (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044467 () Bool)

(declare-fun res!695627 () Bool)

(assert (=> b!1044467 (=> (not res!695627) (not e!591922))))

(declare-fun e!591931 () Bool)

(assert (=> b!1044467 (= res!695627 e!591931)))

(declare-fun res!695624 () Bool)

(assert (=> b!1044467 (=> res!695624 e!591931)))

(declare-fun e!591932 () Bool)

(assert (=> b!1044467 (= res!695624 (not e!591932))))

(declare-fun res!695626 () Bool)

(assert (=> b!1044467 (=> (not res!695626) (not e!591932))))

(assert (=> b!1044467 (= res!695626 (bvslt #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))))))

(declare-fun b!1044468 () Bool)

(assert (=> b!1044468 (= e!591929 call!44365)))

(declare-fun b!1044469 () Bool)

(declare-fun e!591934 () Bool)

(assert (=> b!1044469 (= e!591934 (= (apply!911 lt!460768 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6234 thiss!1427)))))

(declare-fun b!1044470 () Bool)

(assert (=> b!1044470 (= e!591924 e!591934)))

(declare-fun res!695625 () Bool)

(assert (=> b!1044470 (= res!695625 call!44367)))

(assert (=> b!1044470 (=> (not res!695625) (not e!591934))))

(declare-fun b!1044471 () Bool)

(assert (=> b!1044471 (= e!591931 e!591933)))

(declare-fun res!695631 () Bool)

(assert (=> b!1044471 (=> (not res!695631) (not e!591933))))

(assert (=> b!1044471 (= res!695631 (contains!6070 lt!460768 (select (arr!31671 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1044471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))))))

(declare-fun b!1044472 () Bool)

(assert (=> b!1044472 (= e!591924 (not call!44367))))

(declare-fun b!1044473 () Bool)

(assert (=> b!1044473 (= e!591932 (validKeyInArray!0 (select (arr!31671 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44363 () Bool)

(assert (=> bm!44363 (= call!44364 call!44361)))

(declare-fun bm!44364 () Bool)

(assert (=> bm!44364 (= call!44365 call!44363)))

(assert (= (and d!126381 c!106114) b!1044457))

(assert (= (and d!126381 (not c!106114)) b!1044461))

(assert (= (and b!1044461 c!106115) b!1044468))

(assert (= (and b!1044461 (not c!106115)) b!1044454))

(assert (= (and b!1044454 c!106113) b!1044453))

(assert (= (and b!1044454 (not c!106113)) b!1044459))

(assert (= (or b!1044453 b!1044459) bm!44361))

(assert (= (or b!1044468 bm!44361) bm!44363))

(assert (= (or b!1044468 b!1044453) bm!44364))

(assert (= (or b!1044457 bm!44363) bm!44358))

(assert (= (or b!1044457 bm!44364) bm!44359))

(assert (= (and d!126381 res!695628) b!1044460))

(assert (= (and d!126381 c!106111) b!1044464))

(assert (= (and d!126381 (not c!106111)) b!1044465))

(assert (= (and d!126381 res!695629) b!1044467))

(assert (= (and b!1044467 res!695626) b!1044473))

(assert (= (and b!1044467 (not res!695624)) b!1044471))

(assert (= (and b!1044471 res!695631) b!1044458))

(assert (= (and b!1044467 res!695627) b!1044462))

(assert (= (and b!1044462 c!106112) b!1044470))

(assert (= (and b!1044462 (not c!106112)) b!1044472))

(assert (= (and b!1044470 res!695625) b!1044469))

(assert (= (or b!1044470 b!1044472) bm!44362))

(assert (= (and b!1044462 res!695630) b!1044466))

(assert (= (and b!1044466 c!106110) b!1044463))

(assert (= (and b!1044466 (not c!106110)) b!1044456))

(assert (= (and b!1044463 res!695623) b!1044455))

(assert (= (or b!1044463 b!1044456) bm!44360))

(declare-fun b_lambda!16227 () Bool)

(assert (=> (not b_lambda!16227) (not b!1044458)))

(assert (=> b!1044458 t!31241))

(declare-fun b_and!33697 () Bool)

(assert (= b_and!33691 (and (=> t!31241 result!14543) b_and!33697)))

(declare-fun m!963877 () Bool)

(assert (=> b!1044457 m!963877))

(declare-fun m!963879 () Bool)

(assert (=> b!1044471 m!963879))

(assert (=> b!1044471 m!963879))

(declare-fun m!963881 () Bool)

(assert (=> b!1044471 m!963881))

(declare-fun m!963883 () Bool)

(assert (=> b!1044464 m!963883))

(declare-fun m!963885 () Bool)

(assert (=> b!1044464 m!963885))

(declare-fun m!963887 () Bool)

(assert (=> b!1044464 m!963887))

(declare-fun m!963889 () Bool)

(assert (=> b!1044464 m!963889))

(declare-fun m!963891 () Bool)

(assert (=> b!1044464 m!963891))

(declare-fun m!963893 () Bool)

(assert (=> b!1044464 m!963893))

(declare-fun m!963895 () Bool)

(assert (=> b!1044464 m!963895))

(declare-fun m!963897 () Bool)

(assert (=> b!1044464 m!963897))

(declare-fun m!963899 () Bool)

(assert (=> b!1044464 m!963899))

(declare-fun m!963901 () Bool)

(assert (=> b!1044464 m!963901))

(declare-fun m!963903 () Bool)

(assert (=> b!1044464 m!963903))

(declare-fun m!963905 () Bool)

(assert (=> b!1044464 m!963905))

(assert (=> b!1044464 m!963899))

(assert (=> b!1044464 m!963903))

(declare-fun m!963907 () Bool)

(assert (=> b!1044464 m!963907))

(declare-fun m!963909 () Bool)

(assert (=> b!1044464 m!963909))

(assert (=> b!1044464 m!963885))

(assert (=> b!1044464 m!963879))

(declare-fun m!963911 () Bool)

(assert (=> b!1044464 m!963911))

(assert (=> b!1044464 m!963893))

(declare-fun m!963913 () Bool)

(assert (=> b!1044464 m!963913))

(declare-fun m!963915 () Bool)

(assert (=> bm!44360 m!963915))

(declare-fun m!963917 () Bool)

(assert (=> b!1044458 m!963917))

(assert (=> b!1044458 m!963917))

(assert (=> b!1044458 m!963791))

(declare-fun m!963919 () Bool)

(assert (=> b!1044458 m!963919))

(assert (=> b!1044458 m!963879))

(declare-fun m!963921 () Bool)

(assert (=> b!1044458 m!963921))

(assert (=> b!1044458 m!963791))

(assert (=> b!1044458 m!963879))

(assert (=> b!1044473 m!963879))

(assert (=> b!1044473 m!963879))

(declare-fun m!963923 () Bool)

(assert (=> b!1044473 m!963923))

(assert (=> b!1044460 m!963879))

(assert (=> b!1044460 m!963879))

(assert (=> b!1044460 m!963923))

(assert (=> bm!44358 m!963897))

(declare-fun m!963925 () Bool)

(assert (=> bm!44359 m!963925))

(declare-fun m!963927 () Bool)

(assert (=> bm!44362 m!963927))

(assert (=> d!126381 m!963853))

(declare-fun m!963929 () Bool)

(assert (=> b!1044455 m!963929))

(declare-fun m!963931 () Bool)

(assert (=> b!1044469 m!963931))

(assert (=> b!1044338 d!126381))

(declare-fun d!126383 () Bool)

(declare-fun lt!460772 () ListLongMap!13779)

(assert (=> d!126383 (not (contains!6070 lt!460772 key!909))))

(declare-fun removeStrictlySorted!61 (List!22004 (_ BitVec 64)) List!22004)

(assert (=> d!126383 (= lt!460772 (ListLongMap!13780 (removeStrictlySorted!61 (toList!6905 (getCurrentListMap!3953 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427))) key!909)))))

(assert (=> d!126383 (= (-!532 (getCurrentListMap!3953 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)) key!909) lt!460772)))

(declare-fun bs!30515 () Bool)

(assert (= bs!30515 d!126383))

(declare-fun m!963933 () Bool)

(assert (=> bs!30515 m!963933))

(declare-fun m!963935 () Bool)

(assert (=> bs!30515 m!963935))

(assert (=> b!1044338 d!126383))

(declare-fun b!1044474 () Bool)

(declare-fun e!591939 () ListLongMap!13779)

(declare-fun call!44372 () ListLongMap!13779)

(assert (=> b!1044474 (= e!591939 call!44372)))

(declare-fun b!1044475 () Bool)

(declare-fun c!106119 () Bool)

(assert (=> b!1044475 (= c!106119 (and (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591942 () ListLongMap!13779)

(assert (=> b!1044475 (= e!591942 e!591939)))

(declare-fun b!1044476 () Bool)

(declare-fun e!591943 () Bool)

(declare-fun lt!460793 () ListLongMap!13779)

(assert (=> b!1044476 (= e!591943 (= (apply!911 lt!460793 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6234 thiss!1427)))))

(declare-fun b!1044477 () Bool)

(declare-fun e!591938 () Bool)

(declare-fun call!44369 () Bool)

(assert (=> b!1044477 (= e!591938 (not call!44369))))

(declare-fun b!1044478 () Bool)

(declare-fun e!591940 () ListLongMap!13779)

(declare-fun call!44370 () ListLongMap!13779)

(assert (=> b!1044478 (= e!591940 (+!3109 call!44370 (tuple2!15759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6234 thiss!1427))))))

(declare-fun bm!44365 () Bool)

(declare-fun call!44368 () ListLongMap!13779)

(assert (=> bm!44365 (= call!44368 (getCurrentListMapNoExtraKeys!3525 lt!460635 lt!460638 (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)))))

(declare-fun b!1044479 () Bool)

(declare-fun e!591946 () Bool)

(assert (=> b!1044479 (= e!591946 (= (apply!911 lt!460793 (select (arr!31671 lt!460635) #b00000000000000000000000000000000)) (get!16550 (select (arr!31672 lt!460638) #b00000000000000000000000000000000) (dynLambda!2002 (defaultEntry!6400 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32207 lt!460638)))))

(assert (=> b!1044479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32206 lt!460635)))))

(declare-fun b!1044480 () Bool)

(declare-fun call!44373 () ListLongMap!13779)

(assert (=> b!1044480 (= e!591939 call!44373)))

(declare-fun c!106121 () Bool)

(declare-fun call!44371 () ListLongMap!13779)

(declare-fun bm!44366 () Bool)

(declare-fun c!106120 () Bool)

(assert (=> bm!44366 (= call!44370 (+!3109 (ite c!106120 call!44368 (ite c!106121 call!44371 call!44373)) (ite (or c!106120 c!106121) (tuple2!15759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6234 thiss!1427)) (tuple2!15759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6234 thiss!1427)))))))

(declare-fun b!1044481 () Bool)

(declare-fun e!591936 () Bool)

(assert (=> b!1044481 (= e!591936 (validKeyInArray!0 (select (arr!31671 lt!460635) #b00000000000000000000000000000000)))))

(declare-fun bm!44367 () Bool)

(assert (=> bm!44367 (= call!44369 (contains!6070 lt!460793 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44368 () Bool)

(assert (=> bm!44368 (= call!44373 call!44371)))

(declare-fun b!1044482 () Bool)

(assert (=> b!1044482 (= e!591940 e!591942)))

(assert (=> b!1044482 (= c!106121 (and (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044483 () Bool)

(declare-fun res!695639 () Bool)

(declare-fun e!591935 () Bool)

(assert (=> b!1044483 (=> (not res!695639) (not e!591935))))

(declare-fun e!591937 () Bool)

(assert (=> b!1044483 (= res!695639 e!591937)))

(declare-fun c!106118 () Bool)

(assert (=> b!1044483 (= c!106118 (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1044484 () Bool)

(assert (=> b!1044484 (= e!591938 e!591943)))

(declare-fun res!695632 () Bool)

(assert (=> b!1044484 (= res!695632 call!44369)))

(assert (=> b!1044484 (=> (not res!695632) (not e!591943))))

(declare-fun d!126385 () Bool)

(assert (=> d!126385 e!591935))

(declare-fun res!695638 () Bool)

(assert (=> d!126385 (=> (not res!695638) (not e!591935))))

(assert (=> d!126385 (= res!695638 (or (bvsge #b00000000000000000000000000000000 (size!32206 lt!460635)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32206 lt!460635)))))))

(declare-fun lt!460783 () ListLongMap!13779)

(assert (=> d!126385 (= lt!460793 lt!460783)))

(declare-fun lt!460794 () Unit!34099)

(declare-fun e!591941 () Unit!34099)

(assert (=> d!126385 (= lt!460794 e!591941)))

(declare-fun c!106117 () Bool)

(assert (=> d!126385 (= c!106117 e!591936)))

(declare-fun res!695637 () Bool)

(assert (=> d!126385 (=> (not res!695637) (not e!591936))))

(assert (=> d!126385 (= res!695637 (bvslt #b00000000000000000000000000000000 (size!32206 lt!460635)))))

(assert (=> d!126385 (= lt!460783 e!591940)))

(assert (=> d!126385 (= c!106120 (and (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126385 (validMask!0 (mask!30507 thiss!1427))))

(assert (=> d!126385 (= (getCurrentListMap!3953 lt!460635 lt!460638 (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)) lt!460793)))

(declare-fun b!1044485 () Bool)

(declare-fun lt!460781 () Unit!34099)

(assert (=> b!1044485 (= e!591941 lt!460781)))

(declare-fun lt!460774 () ListLongMap!13779)

(assert (=> b!1044485 (= lt!460774 (getCurrentListMapNoExtraKeys!3525 lt!460635 lt!460638 (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)))))

(declare-fun lt!460791 () (_ BitVec 64))

(assert (=> b!1044485 (= lt!460791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460775 () (_ BitVec 64))

(assert (=> b!1044485 (= lt!460775 (select (arr!31671 lt!460635) #b00000000000000000000000000000000))))

(declare-fun lt!460787 () Unit!34099)

(assert (=> b!1044485 (= lt!460787 (addStillContains!630 lt!460774 lt!460791 (zeroValue!6234 thiss!1427) lt!460775))))

(assert (=> b!1044485 (contains!6070 (+!3109 lt!460774 (tuple2!15759 lt!460791 (zeroValue!6234 thiss!1427))) lt!460775)))

(declare-fun lt!460785 () Unit!34099)

(assert (=> b!1044485 (= lt!460785 lt!460787)))

(declare-fun lt!460786 () ListLongMap!13779)

(assert (=> b!1044485 (= lt!460786 (getCurrentListMapNoExtraKeys!3525 lt!460635 lt!460638 (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)))))

(declare-fun lt!460773 () (_ BitVec 64))

(assert (=> b!1044485 (= lt!460773 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460777 () (_ BitVec 64))

(assert (=> b!1044485 (= lt!460777 (select (arr!31671 lt!460635) #b00000000000000000000000000000000))))

(declare-fun lt!460776 () Unit!34099)

(assert (=> b!1044485 (= lt!460776 (addApplyDifferent!490 lt!460786 lt!460773 (minValue!6234 thiss!1427) lt!460777))))

(assert (=> b!1044485 (= (apply!911 (+!3109 lt!460786 (tuple2!15759 lt!460773 (minValue!6234 thiss!1427))) lt!460777) (apply!911 lt!460786 lt!460777))))

(declare-fun lt!460778 () Unit!34099)

(assert (=> b!1044485 (= lt!460778 lt!460776)))

(declare-fun lt!460789 () ListLongMap!13779)

(assert (=> b!1044485 (= lt!460789 (getCurrentListMapNoExtraKeys!3525 lt!460635 lt!460638 (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)))))

(declare-fun lt!460790 () (_ BitVec 64))

(assert (=> b!1044485 (= lt!460790 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460788 () (_ BitVec 64))

(assert (=> b!1044485 (= lt!460788 (select (arr!31671 lt!460635) #b00000000000000000000000000000000))))

(declare-fun lt!460782 () Unit!34099)

(assert (=> b!1044485 (= lt!460782 (addApplyDifferent!490 lt!460789 lt!460790 (zeroValue!6234 thiss!1427) lt!460788))))

(assert (=> b!1044485 (= (apply!911 (+!3109 lt!460789 (tuple2!15759 lt!460790 (zeroValue!6234 thiss!1427))) lt!460788) (apply!911 lt!460789 lt!460788))))

(declare-fun lt!460780 () Unit!34099)

(assert (=> b!1044485 (= lt!460780 lt!460782)))

(declare-fun lt!460779 () ListLongMap!13779)

(assert (=> b!1044485 (= lt!460779 (getCurrentListMapNoExtraKeys!3525 lt!460635 lt!460638 (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)))))

(declare-fun lt!460784 () (_ BitVec 64))

(assert (=> b!1044485 (= lt!460784 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460792 () (_ BitVec 64))

(assert (=> b!1044485 (= lt!460792 (select (arr!31671 lt!460635) #b00000000000000000000000000000000))))

(assert (=> b!1044485 (= lt!460781 (addApplyDifferent!490 lt!460779 lt!460784 (minValue!6234 thiss!1427) lt!460792))))

(assert (=> b!1044485 (= (apply!911 (+!3109 lt!460779 (tuple2!15759 lt!460784 (minValue!6234 thiss!1427))) lt!460792) (apply!911 lt!460779 lt!460792))))

(declare-fun b!1044486 () Bool)

(declare-fun Unit!34109 () Unit!34099)

(assert (=> b!1044486 (= e!591941 Unit!34109)))

(declare-fun bm!44369 () Bool)

(declare-fun call!44374 () Bool)

(assert (=> bm!44369 (= call!44374 (contains!6070 lt!460793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044487 () Bool)

(assert (=> b!1044487 (= e!591935 e!591938)))

(declare-fun c!106116 () Bool)

(assert (=> b!1044487 (= c!106116 (not (= (bvand (extraKeys!6128 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044488 () Bool)

(declare-fun res!695636 () Bool)

(assert (=> b!1044488 (=> (not res!695636) (not e!591935))))

(declare-fun e!591944 () Bool)

(assert (=> b!1044488 (= res!695636 e!591944)))

(declare-fun res!695633 () Bool)

(assert (=> b!1044488 (=> res!695633 e!591944)))

(declare-fun e!591945 () Bool)

(assert (=> b!1044488 (= res!695633 (not e!591945))))

(declare-fun res!695635 () Bool)

(assert (=> b!1044488 (=> (not res!695635) (not e!591945))))

(assert (=> b!1044488 (= res!695635 (bvslt #b00000000000000000000000000000000 (size!32206 lt!460635)))))

(declare-fun b!1044489 () Bool)

(assert (=> b!1044489 (= e!591942 call!44372)))

(declare-fun b!1044490 () Bool)

(declare-fun e!591947 () Bool)

(assert (=> b!1044490 (= e!591947 (= (apply!911 lt!460793 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6234 thiss!1427)))))

(declare-fun b!1044491 () Bool)

(assert (=> b!1044491 (= e!591937 e!591947)))

(declare-fun res!695634 () Bool)

(assert (=> b!1044491 (= res!695634 call!44374)))

(assert (=> b!1044491 (=> (not res!695634) (not e!591947))))

(declare-fun b!1044492 () Bool)

(assert (=> b!1044492 (= e!591944 e!591946)))

(declare-fun res!695640 () Bool)

(assert (=> b!1044492 (=> (not res!695640) (not e!591946))))

(assert (=> b!1044492 (= res!695640 (contains!6070 lt!460793 (select (arr!31671 lt!460635) #b00000000000000000000000000000000)))))

(assert (=> b!1044492 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32206 lt!460635)))))

(declare-fun b!1044493 () Bool)

(assert (=> b!1044493 (= e!591937 (not call!44374))))

(declare-fun b!1044494 () Bool)

(assert (=> b!1044494 (= e!591945 (validKeyInArray!0 (select (arr!31671 lt!460635) #b00000000000000000000000000000000)))))

(declare-fun bm!44370 () Bool)

(assert (=> bm!44370 (= call!44371 call!44368)))

(declare-fun bm!44371 () Bool)

(assert (=> bm!44371 (= call!44372 call!44370)))

(assert (= (and d!126385 c!106120) b!1044478))

(assert (= (and d!126385 (not c!106120)) b!1044482))

(assert (= (and b!1044482 c!106121) b!1044489))

(assert (= (and b!1044482 (not c!106121)) b!1044475))

(assert (= (and b!1044475 c!106119) b!1044474))

(assert (= (and b!1044475 (not c!106119)) b!1044480))

(assert (= (or b!1044474 b!1044480) bm!44368))

(assert (= (or b!1044489 bm!44368) bm!44370))

(assert (= (or b!1044489 b!1044474) bm!44371))

(assert (= (or b!1044478 bm!44370) bm!44365))

(assert (= (or b!1044478 bm!44371) bm!44366))

(assert (= (and d!126385 res!695637) b!1044481))

(assert (= (and d!126385 c!106117) b!1044485))

(assert (= (and d!126385 (not c!106117)) b!1044486))

(assert (= (and d!126385 res!695638) b!1044488))

(assert (= (and b!1044488 res!695635) b!1044494))

(assert (= (and b!1044488 (not res!695633)) b!1044492))

(assert (= (and b!1044492 res!695640) b!1044479))

(assert (= (and b!1044488 res!695636) b!1044483))

(assert (= (and b!1044483 c!106118) b!1044491))

(assert (= (and b!1044483 (not c!106118)) b!1044493))

(assert (= (and b!1044491 res!695634) b!1044490))

(assert (= (or b!1044491 b!1044493) bm!44369))

(assert (= (and b!1044483 res!695639) b!1044487))

(assert (= (and b!1044487 c!106116) b!1044484))

(assert (= (and b!1044487 (not c!106116)) b!1044477))

(assert (= (and b!1044484 res!695632) b!1044476))

(assert (= (or b!1044484 b!1044477) bm!44367))

(declare-fun b_lambda!16229 () Bool)

(assert (=> (not b_lambda!16229) (not b!1044479)))

(assert (=> b!1044479 t!31241))

(declare-fun b_and!33699 () Bool)

(assert (= b_and!33697 (and (=> t!31241 result!14543) b_and!33699)))

(declare-fun m!963937 () Bool)

(assert (=> b!1044478 m!963937))

(assert (=> b!1044492 m!963865))

(assert (=> b!1044492 m!963865))

(declare-fun m!963939 () Bool)

(assert (=> b!1044492 m!963939))

(declare-fun m!963941 () Bool)

(assert (=> b!1044485 m!963941))

(declare-fun m!963943 () Bool)

(assert (=> b!1044485 m!963943))

(declare-fun m!963945 () Bool)

(assert (=> b!1044485 m!963945))

(declare-fun m!963947 () Bool)

(assert (=> b!1044485 m!963947))

(declare-fun m!963949 () Bool)

(assert (=> b!1044485 m!963949))

(declare-fun m!963951 () Bool)

(assert (=> b!1044485 m!963951))

(declare-fun m!963953 () Bool)

(assert (=> b!1044485 m!963953))

(declare-fun m!963955 () Bool)

(assert (=> b!1044485 m!963955))

(declare-fun m!963957 () Bool)

(assert (=> b!1044485 m!963957))

(declare-fun m!963959 () Bool)

(assert (=> b!1044485 m!963959))

(declare-fun m!963961 () Bool)

(assert (=> b!1044485 m!963961))

(declare-fun m!963963 () Bool)

(assert (=> b!1044485 m!963963))

(assert (=> b!1044485 m!963957))

(assert (=> b!1044485 m!963961))

(declare-fun m!963965 () Bool)

(assert (=> b!1044485 m!963965))

(declare-fun m!963967 () Bool)

(assert (=> b!1044485 m!963967))

(assert (=> b!1044485 m!963943))

(assert (=> b!1044485 m!963865))

(declare-fun m!963969 () Bool)

(assert (=> b!1044485 m!963969))

(assert (=> b!1044485 m!963951))

(declare-fun m!963971 () Bool)

(assert (=> b!1044485 m!963971))

(declare-fun m!963973 () Bool)

(assert (=> bm!44367 m!963973))

(declare-fun m!963975 () Bool)

(assert (=> b!1044479 m!963975))

(assert (=> b!1044479 m!963975))

(assert (=> b!1044479 m!963791))

(declare-fun m!963977 () Bool)

(assert (=> b!1044479 m!963977))

(assert (=> b!1044479 m!963865))

(declare-fun m!963979 () Bool)

(assert (=> b!1044479 m!963979))

(assert (=> b!1044479 m!963791))

(assert (=> b!1044479 m!963865))

(assert (=> b!1044494 m!963865))

(assert (=> b!1044494 m!963865))

(assert (=> b!1044494 m!963867))

(assert (=> b!1044481 m!963865))

(assert (=> b!1044481 m!963865))

(assert (=> b!1044481 m!963867))

(assert (=> bm!44365 m!963955))

(declare-fun m!963981 () Bool)

(assert (=> bm!44366 m!963981))

(declare-fun m!963983 () Bool)

(assert (=> bm!44369 m!963983))

(assert (=> d!126385 m!963853))

(declare-fun m!963985 () Bool)

(assert (=> b!1044476 m!963985))

(declare-fun m!963987 () Bool)

(assert (=> b!1044490 m!963987))

(assert (=> b!1044338 d!126385))

(declare-fun d!126387 () Bool)

(declare-fun e!591950 () Bool)

(assert (=> d!126387 e!591950))

(declare-fun res!695643 () Bool)

(assert (=> d!126387 (=> (not res!695643) (not e!591950))))

(assert (=> d!126387 (= res!695643 (and (bvsge (index!41728 lt!460642) #b00000000000000000000000000000000) (bvslt (index!41728 lt!460642) (size!32206 (_keys!11664 thiss!1427)))))))

(declare-fun lt!460797 () Unit!34099)

(declare-fun choose!25 (array!65842 (_ BitVec 32) (_ BitVec 32)) Unit!34099)

(assert (=> d!126387 (= lt!460797 (choose!25 (_keys!11664 thiss!1427) (index!41728 lt!460642) (mask!30507 thiss!1427)))))

(assert (=> d!126387 (validMask!0 (mask!30507 thiss!1427))))

(assert (=> d!126387 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11664 thiss!1427) (index!41728 lt!460642) (mask!30507 thiss!1427)) lt!460797)))

(declare-fun b!1044497 () Bool)

(assert (=> b!1044497 (= e!591950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65843 (store (arr!31671 (_keys!11664 thiss!1427)) (index!41728 lt!460642) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32206 (_keys!11664 thiss!1427))) (mask!30507 thiss!1427)))))

(assert (= (and d!126387 res!695643) b!1044497))

(declare-fun m!963989 () Bool)

(assert (=> d!126387 m!963989))

(assert (=> d!126387 m!963853))

(assert (=> b!1044497 m!963771))

(declare-fun m!963991 () Bool)

(assert (=> b!1044497 m!963991))

(assert (=> b!1044338 d!126387))

(declare-fun b!1044508 () Bool)

(declare-fun e!591962 () Bool)

(declare-fun call!44377 () Bool)

(assert (=> b!1044508 (= e!591962 call!44377)))

(declare-fun bm!44374 () Bool)

(declare-fun c!106124 () Bool)

(assert (=> bm!44374 (= call!44377 (arrayNoDuplicates!0 lt!460635 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106124 (Cons!22001 (select (arr!31671 lt!460635) #b00000000000000000000000000000000) Nil!22002) Nil!22002)))))

(declare-fun d!126389 () Bool)

(declare-fun res!695651 () Bool)

(declare-fun e!591960 () Bool)

(assert (=> d!126389 (=> res!695651 e!591960)))

(assert (=> d!126389 (= res!695651 (bvsge #b00000000000000000000000000000000 (size!32206 lt!460635)))))

(assert (=> d!126389 (= (arrayNoDuplicates!0 lt!460635 #b00000000000000000000000000000000 Nil!22002) e!591960)))

(declare-fun b!1044509 () Bool)

(declare-fun e!591961 () Bool)

(declare-fun contains!6072 (List!22005 (_ BitVec 64)) Bool)

(assert (=> b!1044509 (= e!591961 (contains!6072 Nil!22002 (select (arr!31671 lt!460635) #b00000000000000000000000000000000)))))

(declare-fun b!1044510 () Bool)

(declare-fun e!591959 () Bool)

(assert (=> b!1044510 (= e!591959 e!591962)))

(assert (=> b!1044510 (= c!106124 (validKeyInArray!0 (select (arr!31671 lt!460635) #b00000000000000000000000000000000)))))

(declare-fun b!1044511 () Bool)

(assert (=> b!1044511 (= e!591960 e!591959)))

(declare-fun res!695650 () Bool)

(assert (=> b!1044511 (=> (not res!695650) (not e!591959))))

(assert (=> b!1044511 (= res!695650 (not e!591961))))

(declare-fun res!695652 () Bool)

(assert (=> b!1044511 (=> (not res!695652) (not e!591961))))

(assert (=> b!1044511 (= res!695652 (validKeyInArray!0 (select (arr!31671 lt!460635) #b00000000000000000000000000000000)))))

(declare-fun b!1044512 () Bool)

(assert (=> b!1044512 (= e!591962 call!44377)))

(assert (= (and d!126389 (not res!695651)) b!1044511))

(assert (= (and b!1044511 res!695652) b!1044509))

(assert (= (and b!1044511 res!695650) b!1044510))

(assert (= (and b!1044510 c!106124) b!1044508))

(assert (= (and b!1044510 (not c!106124)) b!1044512))

(assert (= (or b!1044508 b!1044512) bm!44374))

(assert (=> bm!44374 m!963865))

(declare-fun m!963993 () Bool)

(assert (=> bm!44374 m!963993))

(assert (=> b!1044509 m!963865))

(assert (=> b!1044509 m!963865))

(declare-fun m!963995 () Bool)

(assert (=> b!1044509 m!963995))

(assert (=> b!1044510 m!963865))

(assert (=> b!1044510 m!963865))

(assert (=> b!1044510 m!963867))

(assert (=> b!1044511 m!963865))

(assert (=> b!1044511 m!963865))

(assert (=> b!1044511 m!963867))

(assert (=> b!1044338 d!126389))

(declare-fun bm!44377 () Bool)

(declare-fun call!44380 () (_ BitVec 32))

(assert (=> bm!44377 (= call!44380 (arrayCountValidKeys!0 lt!460635 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32206 (_keys!11664 thiss!1427))))))

(declare-fun b!1044522 () Bool)

(declare-fun e!591968 () (_ BitVec 32))

(assert (=> b!1044522 (= e!591968 (bvadd #b00000000000000000000000000000001 call!44380))))

(declare-fun b!1044523 () Bool)

(declare-fun e!591967 () (_ BitVec 32))

(assert (=> b!1044523 (= e!591967 e!591968)))

(declare-fun c!106130 () Bool)

(assert (=> b!1044523 (= c!106130 (validKeyInArray!0 (select (arr!31671 lt!460635) #b00000000000000000000000000000000)))))

(declare-fun b!1044524 () Bool)

(assert (=> b!1044524 (= e!591968 call!44380)))

(declare-fun b!1044521 () Bool)

(assert (=> b!1044521 (= e!591967 #b00000000000000000000000000000000)))

(declare-fun d!126391 () Bool)

(declare-fun lt!460800 () (_ BitVec 32))

(assert (=> d!126391 (and (bvsge lt!460800 #b00000000000000000000000000000000) (bvsle lt!460800 (bvsub (size!32206 lt!460635) #b00000000000000000000000000000000)))))

(assert (=> d!126391 (= lt!460800 e!591967)))

(declare-fun c!106129 () Bool)

(assert (=> d!126391 (= c!106129 (bvsge #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))))))

(assert (=> d!126391 (and (bvsle #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32206 (_keys!11664 thiss!1427)) (size!32206 lt!460635)))))

(assert (=> d!126391 (= (arrayCountValidKeys!0 lt!460635 #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))) lt!460800)))

(assert (= (and d!126391 c!106129) b!1044521))

(assert (= (and d!126391 (not c!106129)) b!1044523))

(assert (= (and b!1044523 c!106130) b!1044522))

(assert (= (and b!1044523 (not c!106130)) b!1044524))

(assert (= (or b!1044522 b!1044524) bm!44377))

(declare-fun m!963997 () Bool)

(assert (=> bm!44377 m!963997))

(assert (=> b!1044523 m!963865))

(assert (=> b!1044523 m!963865))

(assert (=> b!1044523 m!963867))

(assert (=> b!1044338 d!126391))

(declare-fun d!126393 () Bool)

(declare-fun e!591971 () Bool)

(assert (=> d!126393 e!591971))

(declare-fun res!695655 () Bool)

(assert (=> d!126393 (=> (not res!695655) (not e!591971))))

(assert (=> d!126393 (= res!695655 (and (bvsge (index!41728 lt!460642) #b00000000000000000000000000000000) (bvslt (index!41728 lt!460642) (size!32206 (_keys!11664 thiss!1427)))))))

(declare-fun lt!460803 () Unit!34099)

(declare-fun choose!1711 (array!65842 array!65844 (_ BitVec 32) (_ BitVec 32) V!37989 V!37989 (_ BitVec 32) (_ BitVec 64) Int) Unit!34099)

(assert (=> d!126393 (= lt!460803 (choose!1711 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) (index!41728 lt!460642) key!909 (defaultEntry!6400 thiss!1427)))))

(assert (=> d!126393 (validMask!0 (mask!30507 thiss!1427))))

(assert (=> d!126393 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!53 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) (index!41728 lt!460642) key!909 (defaultEntry!6400 thiss!1427)) lt!460803)))

(declare-fun b!1044527 () Bool)

(assert (=> b!1044527 (= e!591971 (= (-!532 (getCurrentListMap!3953 (_keys!11664 thiss!1427) (_values!6423 thiss!1427) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427)) key!909) (getCurrentListMap!3953 (array!65843 (store (arr!31671 (_keys!11664 thiss!1427)) (index!41728 lt!460642) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32206 (_keys!11664 thiss!1427))) (array!65845 (store (arr!31672 (_values!6423 thiss!1427)) (index!41728 lt!460642) (ValueCellFull!11715 (dynLambda!2002 (defaultEntry!6400 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32207 (_values!6423 thiss!1427))) (mask!30507 thiss!1427) (extraKeys!6128 thiss!1427) (zeroValue!6234 thiss!1427) (minValue!6234 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6400 thiss!1427))))))

(assert (=> b!1044527 (bvslt (index!41728 lt!460642) (size!32207 (_values!6423 thiss!1427)))))

(assert (= (and d!126393 res!695655) b!1044527))

(declare-fun b_lambda!16231 () Bool)

(assert (=> (not b_lambda!16231) (not b!1044527)))

(assert (=> b!1044527 t!31241))

(declare-fun b_and!33701 () Bool)

(assert (= b_and!33699 (and (=> t!31241 result!14543) b_and!33701)))

(declare-fun m!963999 () Bool)

(assert (=> d!126393 m!963999))

(assert (=> d!126393 m!963853))

(assert (=> b!1044527 m!963785))

(assert (=> b!1044527 m!963795))

(declare-fun m!964001 () Bool)

(assert (=> b!1044527 m!964001))

(assert (=> b!1044527 m!963779))

(assert (=> b!1044527 m!963791))

(assert (=> b!1044527 m!963771))

(assert (=> b!1044527 m!963785))

(assert (=> b!1044338 d!126393))

(declare-fun bm!44378 () Bool)

(declare-fun call!44381 () (_ BitVec 32))

(assert (=> bm!44378 (= call!44381 (arrayCountValidKeys!0 (_keys!11664 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32206 (_keys!11664 thiss!1427))))))

(declare-fun b!1044529 () Bool)

(declare-fun e!591973 () (_ BitVec 32))

(assert (=> b!1044529 (= e!591973 (bvadd #b00000000000000000000000000000001 call!44381))))

(declare-fun b!1044530 () Bool)

(declare-fun e!591972 () (_ BitVec 32))

(assert (=> b!1044530 (= e!591972 e!591973)))

(declare-fun c!106132 () Bool)

(assert (=> b!1044530 (= c!106132 (validKeyInArray!0 (select (arr!31671 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044531 () Bool)

(assert (=> b!1044531 (= e!591973 call!44381)))

(declare-fun b!1044528 () Bool)

(assert (=> b!1044528 (= e!591972 #b00000000000000000000000000000000)))

(declare-fun d!126395 () Bool)

(declare-fun lt!460804 () (_ BitVec 32))

(assert (=> d!126395 (and (bvsge lt!460804 #b00000000000000000000000000000000) (bvsle lt!460804 (bvsub (size!32206 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126395 (= lt!460804 e!591972)))

(declare-fun c!106131 () Bool)

(assert (=> d!126395 (= c!106131 (bvsge #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))))))

(assert (=> d!126395 (and (bvsle #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32206 (_keys!11664 thiss!1427)) (size!32206 (_keys!11664 thiss!1427))))))

(assert (=> d!126395 (= (arrayCountValidKeys!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))) lt!460804)))

(assert (= (and d!126395 c!106131) b!1044528))

(assert (= (and d!126395 (not c!106131)) b!1044530))

(assert (= (and b!1044530 c!106132) b!1044529))

(assert (= (and b!1044530 (not c!106132)) b!1044531))

(assert (= (or b!1044529 b!1044531) bm!44378))

(declare-fun m!964003 () Bool)

(assert (=> bm!44378 m!964003))

(assert (=> b!1044530 m!963879))

(assert (=> b!1044530 m!963879))

(assert (=> b!1044530 m!963923))

(assert (=> b!1044338 d!126395))

(declare-fun d!126397 () Bool)

(declare-fun res!695660 () Bool)

(declare-fun e!591978 () Bool)

(assert (=> d!126397 (=> res!695660 e!591978)))

(assert (=> d!126397 (= res!695660 (= (select (arr!31671 lt!460635) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126397 (= (arrayContainsKey!0 lt!460635 key!909 #b00000000000000000000000000000000) e!591978)))

(declare-fun b!1044536 () Bool)

(declare-fun e!591979 () Bool)

(assert (=> b!1044536 (= e!591978 e!591979)))

(declare-fun res!695661 () Bool)

(assert (=> b!1044536 (=> (not res!695661) (not e!591979))))

(assert (=> b!1044536 (= res!695661 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32206 lt!460635)))))

(declare-fun b!1044537 () Bool)

(assert (=> b!1044537 (= e!591979 (arrayContainsKey!0 lt!460635 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126397 (not res!695660)) b!1044536))

(assert (= (and b!1044536 res!695661) b!1044537))

(assert (=> d!126397 m!963865))

(declare-fun m!964005 () Bool)

(assert (=> b!1044537 m!964005))

(assert (=> b!1044338 d!126397))

(declare-fun b!1044538 () Bool)

(declare-fun e!591984 () ListLongMap!13779)

(declare-fun call!44386 () ListLongMap!13779)

(assert (=> b!1044538 (= e!591984 call!44386)))

(declare-fun b!1044539 () Bool)

(declare-fun c!106136 () Bool)

(assert (=> b!1044539 (= c!106136 (and (not (= (bvand (extraKeys!6128 (_2!7889 lt!460637)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6128 (_2!7889 lt!460637)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591987 () ListLongMap!13779)

(assert (=> b!1044539 (= e!591987 e!591984)))

(declare-fun b!1044540 () Bool)

(declare-fun e!591988 () Bool)

(declare-fun lt!460825 () ListLongMap!13779)

(assert (=> b!1044540 (= e!591988 (= (apply!911 lt!460825 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6234 (_2!7889 lt!460637))))))

(declare-fun b!1044541 () Bool)

(declare-fun e!591983 () Bool)

(declare-fun call!44383 () Bool)

(assert (=> b!1044541 (= e!591983 (not call!44383))))

(declare-fun b!1044542 () Bool)

(declare-fun e!591985 () ListLongMap!13779)

(declare-fun call!44384 () ListLongMap!13779)

(assert (=> b!1044542 (= e!591985 (+!3109 call!44384 (tuple2!15759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6234 (_2!7889 lt!460637)))))))

(declare-fun bm!44379 () Bool)

(declare-fun call!44382 () ListLongMap!13779)

(assert (=> bm!44379 (= call!44382 (getCurrentListMapNoExtraKeys!3525 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637))))))

(declare-fun b!1044543 () Bool)

(declare-fun e!591991 () Bool)

(assert (=> b!1044543 (= e!591991 (= (apply!911 lt!460825 (select (arr!31671 (_keys!11664 (_2!7889 lt!460637))) #b00000000000000000000000000000000)) (get!16550 (select (arr!31672 (_values!6423 (_2!7889 lt!460637))) #b00000000000000000000000000000000) (dynLambda!2002 (defaultEntry!6400 (_2!7889 lt!460637)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32207 (_values!6423 (_2!7889 lt!460637)))))))

(assert (=> b!1044543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32206 (_keys!11664 (_2!7889 lt!460637)))))))

(declare-fun b!1044544 () Bool)

(declare-fun call!44387 () ListLongMap!13779)

(assert (=> b!1044544 (= e!591984 call!44387)))

(declare-fun c!106138 () Bool)

(declare-fun bm!44380 () Bool)

(declare-fun c!106137 () Bool)

(declare-fun call!44385 () ListLongMap!13779)

(assert (=> bm!44380 (= call!44384 (+!3109 (ite c!106137 call!44382 (ite c!106138 call!44385 call!44387)) (ite (or c!106137 c!106138) (tuple2!15759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6234 (_2!7889 lt!460637))) (tuple2!15759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6234 (_2!7889 lt!460637))))))))

(declare-fun b!1044545 () Bool)

(declare-fun e!591981 () Bool)

(assert (=> b!1044545 (= e!591981 (validKeyInArray!0 (select (arr!31671 (_keys!11664 (_2!7889 lt!460637))) #b00000000000000000000000000000000)))))

(declare-fun bm!44381 () Bool)

(assert (=> bm!44381 (= call!44383 (contains!6070 lt!460825 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44382 () Bool)

(assert (=> bm!44382 (= call!44387 call!44385)))

(declare-fun b!1044546 () Bool)

(assert (=> b!1044546 (= e!591985 e!591987)))

(assert (=> b!1044546 (= c!106138 (and (not (= (bvand (extraKeys!6128 (_2!7889 lt!460637)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6128 (_2!7889 lt!460637)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044547 () Bool)

(declare-fun res!695669 () Bool)

(declare-fun e!591980 () Bool)

(assert (=> b!1044547 (=> (not res!695669) (not e!591980))))

(declare-fun e!591982 () Bool)

(assert (=> b!1044547 (= res!695669 e!591982)))

(declare-fun c!106135 () Bool)

(assert (=> b!1044547 (= c!106135 (not (= (bvand (extraKeys!6128 (_2!7889 lt!460637)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1044548 () Bool)

(assert (=> b!1044548 (= e!591983 e!591988)))

(declare-fun res!695662 () Bool)

(assert (=> b!1044548 (= res!695662 call!44383)))

(assert (=> b!1044548 (=> (not res!695662) (not e!591988))))

(declare-fun d!126399 () Bool)

(assert (=> d!126399 e!591980))

(declare-fun res!695668 () Bool)

(assert (=> d!126399 (=> (not res!695668) (not e!591980))))

(assert (=> d!126399 (= res!695668 (or (bvsge #b00000000000000000000000000000000 (size!32206 (_keys!11664 (_2!7889 lt!460637)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32206 (_keys!11664 (_2!7889 lt!460637)))))))))

(declare-fun lt!460815 () ListLongMap!13779)

(assert (=> d!126399 (= lt!460825 lt!460815)))

(declare-fun lt!460826 () Unit!34099)

(declare-fun e!591986 () Unit!34099)

(assert (=> d!126399 (= lt!460826 e!591986)))

(declare-fun c!106134 () Bool)

(assert (=> d!126399 (= c!106134 e!591981)))

(declare-fun res!695667 () Bool)

(assert (=> d!126399 (=> (not res!695667) (not e!591981))))

(assert (=> d!126399 (= res!695667 (bvslt #b00000000000000000000000000000000 (size!32206 (_keys!11664 (_2!7889 lt!460637)))))))

(assert (=> d!126399 (= lt!460815 e!591985)))

(assert (=> d!126399 (= c!106137 (and (not (= (bvand (extraKeys!6128 (_2!7889 lt!460637)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6128 (_2!7889 lt!460637)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126399 (validMask!0 (mask!30507 (_2!7889 lt!460637)))))

(assert (=> d!126399 (= (getCurrentListMap!3953 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637))) lt!460825)))

(declare-fun b!1044549 () Bool)

(declare-fun lt!460813 () Unit!34099)

(assert (=> b!1044549 (= e!591986 lt!460813)))

(declare-fun lt!460806 () ListLongMap!13779)

(assert (=> b!1044549 (= lt!460806 (getCurrentListMapNoExtraKeys!3525 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637))))))

(declare-fun lt!460823 () (_ BitVec 64))

(assert (=> b!1044549 (= lt!460823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460807 () (_ BitVec 64))

(assert (=> b!1044549 (= lt!460807 (select (arr!31671 (_keys!11664 (_2!7889 lt!460637))) #b00000000000000000000000000000000))))

(declare-fun lt!460819 () Unit!34099)

(assert (=> b!1044549 (= lt!460819 (addStillContains!630 lt!460806 lt!460823 (zeroValue!6234 (_2!7889 lt!460637)) lt!460807))))

(assert (=> b!1044549 (contains!6070 (+!3109 lt!460806 (tuple2!15759 lt!460823 (zeroValue!6234 (_2!7889 lt!460637)))) lt!460807)))

(declare-fun lt!460817 () Unit!34099)

(assert (=> b!1044549 (= lt!460817 lt!460819)))

(declare-fun lt!460818 () ListLongMap!13779)

(assert (=> b!1044549 (= lt!460818 (getCurrentListMapNoExtraKeys!3525 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637))))))

(declare-fun lt!460805 () (_ BitVec 64))

(assert (=> b!1044549 (= lt!460805 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460809 () (_ BitVec 64))

(assert (=> b!1044549 (= lt!460809 (select (arr!31671 (_keys!11664 (_2!7889 lt!460637))) #b00000000000000000000000000000000))))

(declare-fun lt!460808 () Unit!34099)

(assert (=> b!1044549 (= lt!460808 (addApplyDifferent!490 lt!460818 lt!460805 (minValue!6234 (_2!7889 lt!460637)) lt!460809))))

(assert (=> b!1044549 (= (apply!911 (+!3109 lt!460818 (tuple2!15759 lt!460805 (minValue!6234 (_2!7889 lt!460637)))) lt!460809) (apply!911 lt!460818 lt!460809))))

(declare-fun lt!460810 () Unit!34099)

(assert (=> b!1044549 (= lt!460810 lt!460808)))

(declare-fun lt!460821 () ListLongMap!13779)

(assert (=> b!1044549 (= lt!460821 (getCurrentListMapNoExtraKeys!3525 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637))))))

(declare-fun lt!460822 () (_ BitVec 64))

(assert (=> b!1044549 (= lt!460822 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460820 () (_ BitVec 64))

(assert (=> b!1044549 (= lt!460820 (select (arr!31671 (_keys!11664 (_2!7889 lt!460637))) #b00000000000000000000000000000000))))

(declare-fun lt!460814 () Unit!34099)

(assert (=> b!1044549 (= lt!460814 (addApplyDifferent!490 lt!460821 lt!460822 (zeroValue!6234 (_2!7889 lt!460637)) lt!460820))))

(assert (=> b!1044549 (= (apply!911 (+!3109 lt!460821 (tuple2!15759 lt!460822 (zeroValue!6234 (_2!7889 lt!460637)))) lt!460820) (apply!911 lt!460821 lt!460820))))

(declare-fun lt!460812 () Unit!34099)

(assert (=> b!1044549 (= lt!460812 lt!460814)))

(declare-fun lt!460811 () ListLongMap!13779)

(assert (=> b!1044549 (= lt!460811 (getCurrentListMapNoExtraKeys!3525 (_keys!11664 (_2!7889 lt!460637)) (_values!6423 (_2!7889 lt!460637)) (mask!30507 (_2!7889 lt!460637)) (extraKeys!6128 (_2!7889 lt!460637)) (zeroValue!6234 (_2!7889 lt!460637)) (minValue!6234 (_2!7889 lt!460637)) #b00000000000000000000000000000000 (defaultEntry!6400 (_2!7889 lt!460637))))))

(declare-fun lt!460816 () (_ BitVec 64))

(assert (=> b!1044549 (= lt!460816 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460824 () (_ BitVec 64))

(assert (=> b!1044549 (= lt!460824 (select (arr!31671 (_keys!11664 (_2!7889 lt!460637))) #b00000000000000000000000000000000))))

(assert (=> b!1044549 (= lt!460813 (addApplyDifferent!490 lt!460811 lt!460816 (minValue!6234 (_2!7889 lt!460637)) lt!460824))))

(assert (=> b!1044549 (= (apply!911 (+!3109 lt!460811 (tuple2!15759 lt!460816 (minValue!6234 (_2!7889 lt!460637)))) lt!460824) (apply!911 lt!460811 lt!460824))))

(declare-fun b!1044550 () Bool)

(declare-fun Unit!34110 () Unit!34099)

(assert (=> b!1044550 (= e!591986 Unit!34110)))

(declare-fun bm!44383 () Bool)

(declare-fun call!44388 () Bool)

(assert (=> bm!44383 (= call!44388 (contains!6070 lt!460825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044551 () Bool)

(assert (=> b!1044551 (= e!591980 e!591983)))

(declare-fun c!106133 () Bool)

(assert (=> b!1044551 (= c!106133 (not (= (bvand (extraKeys!6128 (_2!7889 lt!460637)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044552 () Bool)

(declare-fun res!695666 () Bool)

(assert (=> b!1044552 (=> (not res!695666) (not e!591980))))

(declare-fun e!591989 () Bool)

(assert (=> b!1044552 (= res!695666 e!591989)))

(declare-fun res!695663 () Bool)

(assert (=> b!1044552 (=> res!695663 e!591989)))

(declare-fun e!591990 () Bool)

(assert (=> b!1044552 (= res!695663 (not e!591990))))

(declare-fun res!695665 () Bool)

(assert (=> b!1044552 (=> (not res!695665) (not e!591990))))

(assert (=> b!1044552 (= res!695665 (bvslt #b00000000000000000000000000000000 (size!32206 (_keys!11664 (_2!7889 lt!460637)))))))

(declare-fun b!1044553 () Bool)

(assert (=> b!1044553 (= e!591987 call!44386)))

(declare-fun b!1044554 () Bool)

(declare-fun e!591992 () Bool)

(assert (=> b!1044554 (= e!591992 (= (apply!911 lt!460825 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6234 (_2!7889 lt!460637))))))

(declare-fun b!1044555 () Bool)

(assert (=> b!1044555 (= e!591982 e!591992)))

(declare-fun res!695664 () Bool)

(assert (=> b!1044555 (= res!695664 call!44388)))

(assert (=> b!1044555 (=> (not res!695664) (not e!591992))))

(declare-fun b!1044556 () Bool)

(assert (=> b!1044556 (= e!591989 e!591991)))

(declare-fun res!695670 () Bool)

(assert (=> b!1044556 (=> (not res!695670) (not e!591991))))

(assert (=> b!1044556 (= res!695670 (contains!6070 lt!460825 (select (arr!31671 (_keys!11664 (_2!7889 lt!460637))) #b00000000000000000000000000000000)))))

(assert (=> b!1044556 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32206 (_keys!11664 (_2!7889 lt!460637)))))))

(declare-fun b!1044557 () Bool)

(assert (=> b!1044557 (= e!591982 (not call!44388))))

(declare-fun b!1044558 () Bool)

(assert (=> b!1044558 (= e!591990 (validKeyInArray!0 (select (arr!31671 (_keys!11664 (_2!7889 lt!460637))) #b00000000000000000000000000000000)))))

(declare-fun bm!44384 () Bool)

(assert (=> bm!44384 (= call!44385 call!44382)))

(declare-fun bm!44385 () Bool)

(assert (=> bm!44385 (= call!44386 call!44384)))

(assert (= (and d!126399 c!106137) b!1044542))

(assert (= (and d!126399 (not c!106137)) b!1044546))

(assert (= (and b!1044546 c!106138) b!1044553))

(assert (= (and b!1044546 (not c!106138)) b!1044539))

(assert (= (and b!1044539 c!106136) b!1044538))

(assert (= (and b!1044539 (not c!106136)) b!1044544))

(assert (= (or b!1044538 b!1044544) bm!44382))

(assert (= (or b!1044553 bm!44382) bm!44384))

(assert (= (or b!1044553 b!1044538) bm!44385))

(assert (= (or b!1044542 bm!44384) bm!44379))

(assert (= (or b!1044542 bm!44385) bm!44380))

(assert (= (and d!126399 res!695667) b!1044545))

(assert (= (and d!126399 c!106134) b!1044549))

(assert (= (and d!126399 (not c!106134)) b!1044550))

(assert (= (and d!126399 res!695668) b!1044552))

(assert (= (and b!1044552 res!695665) b!1044558))

(assert (= (and b!1044552 (not res!695663)) b!1044556))

(assert (= (and b!1044556 res!695670) b!1044543))

(assert (= (and b!1044552 res!695666) b!1044547))

(assert (= (and b!1044547 c!106135) b!1044555))

(assert (= (and b!1044547 (not c!106135)) b!1044557))

(assert (= (and b!1044555 res!695664) b!1044554))

(assert (= (or b!1044555 b!1044557) bm!44383))

(assert (= (and b!1044547 res!695669) b!1044551))

(assert (= (and b!1044551 c!106133) b!1044548))

(assert (= (and b!1044551 (not c!106133)) b!1044541))

(assert (= (and b!1044548 res!695662) b!1044540))

(assert (= (or b!1044548 b!1044541) bm!44381))

(declare-fun b_lambda!16233 () Bool)

(assert (=> (not b_lambda!16233) (not b!1044543)))

(declare-fun tb!7063 () Bool)

(declare-fun t!31249 () Bool)

(assert (=> (and b!1044339 (= (defaultEntry!6400 thiss!1427) (defaultEntry!6400 (_2!7889 lt!460637))) t!31249) tb!7063))

(declare-fun result!14551 () Bool)

(assert (=> tb!7063 (= result!14551 tp_is_empty!24837)))

(assert (=> b!1044543 t!31249))

(declare-fun b_and!33703 () Bool)

(assert (= b_and!33701 (and (=> t!31249 result!14551) b_and!33703)))

(declare-fun m!964007 () Bool)

(assert (=> b!1044542 m!964007))

(declare-fun m!964009 () Bool)

(assert (=> b!1044556 m!964009))

(assert (=> b!1044556 m!964009))

(declare-fun m!964011 () Bool)

(assert (=> b!1044556 m!964011))

(declare-fun m!964013 () Bool)

(assert (=> b!1044549 m!964013))

(declare-fun m!964015 () Bool)

(assert (=> b!1044549 m!964015))

(declare-fun m!964017 () Bool)

(assert (=> b!1044549 m!964017))

(declare-fun m!964019 () Bool)

(assert (=> b!1044549 m!964019))

(declare-fun m!964021 () Bool)

(assert (=> b!1044549 m!964021))

(declare-fun m!964023 () Bool)

(assert (=> b!1044549 m!964023))

(declare-fun m!964025 () Bool)

(assert (=> b!1044549 m!964025))

(declare-fun m!964027 () Bool)

(assert (=> b!1044549 m!964027))

(declare-fun m!964029 () Bool)

(assert (=> b!1044549 m!964029))

(declare-fun m!964031 () Bool)

(assert (=> b!1044549 m!964031))

(declare-fun m!964033 () Bool)

(assert (=> b!1044549 m!964033))

(declare-fun m!964035 () Bool)

(assert (=> b!1044549 m!964035))

(assert (=> b!1044549 m!964029))

(assert (=> b!1044549 m!964033))

(declare-fun m!964037 () Bool)

(assert (=> b!1044549 m!964037))

(declare-fun m!964039 () Bool)

(assert (=> b!1044549 m!964039))

(assert (=> b!1044549 m!964015))

(assert (=> b!1044549 m!964009))

(declare-fun m!964041 () Bool)

(assert (=> b!1044549 m!964041))

(assert (=> b!1044549 m!964023))

(declare-fun m!964043 () Bool)

(assert (=> b!1044549 m!964043))

(declare-fun m!964045 () Bool)

(assert (=> bm!44381 m!964045))

(declare-fun m!964047 () Bool)

(assert (=> b!1044543 m!964047))

(assert (=> b!1044543 m!964047))

(declare-fun m!964049 () Bool)

(assert (=> b!1044543 m!964049))

(declare-fun m!964051 () Bool)

(assert (=> b!1044543 m!964051))

(assert (=> b!1044543 m!964009))

(declare-fun m!964053 () Bool)

(assert (=> b!1044543 m!964053))

(assert (=> b!1044543 m!964049))

(assert (=> b!1044543 m!964009))

(assert (=> b!1044558 m!964009))

(assert (=> b!1044558 m!964009))

(declare-fun m!964055 () Bool)

(assert (=> b!1044558 m!964055))

(assert (=> b!1044545 m!964009))

(assert (=> b!1044545 m!964009))

(assert (=> b!1044545 m!964055))

(assert (=> bm!44379 m!964027))

(declare-fun m!964057 () Bool)

(assert (=> bm!44380 m!964057))

(declare-fun m!964059 () Bool)

(assert (=> bm!44383 m!964059))

(assert (=> d!126399 m!963757))

(declare-fun m!964061 () Bool)

(assert (=> b!1044540 m!964061))

(declare-fun m!964063 () Bool)

(assert (=> b!1044554 m!964063))

(assert (=> b!1044338 d!126399))

(declare-fun b!1044569 () Bool)

(declare-fun e!591997 () Bool)

(assert (=> b!1044569 (= e!591997 (bvslt (size!32206 (_keys!11664 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1044570 () Bool)

(declare-fun e!591998 () Bool)

(assert (=> b!1044570 (= e!591998 (= (arrayCountValidKeys!0 (array!65843 (store (arr!31671 (_keys!11664 thiss!1427)) (index!41728 lt!460642) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32206 (_keys!11664 thiss!1427))) #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126401 () Bool)

(assert (=> d!126401 e!591998))

(declare-fun res!695680 () Bool)

(assert (=> d!126401 (=> (not res!695680) (not e!591998))))

(assert (=> d!126401 (= res!695680 (and (bvsge (index!41728 lt!460642) #b00000000000000000000000000000000) (bvslt (index!41728 lt!460642) (size!32206 (_keys!11664 thiss!1427)))))))

(declare-fun lt!460829 () Unit!34099)

(declare-fun choose!82 (array!65842 (_ BitVec 32) (_ BitVec 64)) Unit!34099)

(assert (=> d!126401 (= lt!460829 (choose!82 (_keys!11664 thiss!1427) (index!41728 lt!460642) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126401 e!591997))

(declare-fun res!695682 () Bool)

(assert (=> d!126401 (=> (not res!695682) (not e!591997))))

(assert (=> d!126401 (= res!695682 (and (bvsge (index!41728 lt!460642) #b00000000000000000000000000000000) (bvslt (index!41728 lt!460642) (size!32206 (_keys!11664 thiss!1427)))))))

(assert (=> d!126401 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11664 thiss!1427) (index!41728 lt!460642) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460829)))

(declare-fun b!1044568 () Bool)

(declare-fun res!695681 () Bool)

(assert (=> b!1044568 (=> (not res!695681) (not e!591997))))

(assert (=> b!1044568 (= res!695681 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1044567 () Bool)

(declare-fun res!695679 () Bool)

(assert (=> b!1044567 (=> (not res!695679) (not e!591997))))

(assert (=> b!1044567 (= res!695679 (validKeyInArray!0 (select (arr!31671 (_keys!11664 thiss!1427)) (index!41728 lt!460642))))))

(assert (= (and d!126401 res!695682) b!1044567))

(assert (= (and b!1044567 res!695679) b!1044568))

(assert (= (and b!1044568 res!695681) b!1044569))

(assert (= (and d!126401 res!695680) b!1044570))

(assert (=> b!1044570 m!963771))

(declare-fun m!964065 () Bool)

(assert (=> b!1044570 m!964065))

(assert (=> b!1044570 m!963777))

(declare-fun m!964067 () Bool)

(assert (=> d!126401 m!964067))

(declare-fun m!964069 () Bool)

(assert (=> b!1044568 m!964069))

(declare-fun m!964071 () Bool)

(assert (=> b!1044567 m!964071))

(assert (=> b!1044567 m!964071))

(declare-fun m!964073 () Bool)

(assert (=> b!1044567 m!964073))

(assert (=> b!1044338 d!126401))

(declare-fun d!126403 () Bool)

(declare-fun e!592001 () Bool)

(assert (=> d!126403 e!592001))

(declare-fun res!695685 () Bool)

(assert (=> d!126403 (=> (not res!695685) (not e!592001))))

(assert (=> d!126403 (= res!695685 (bvslt (index!41728 lt!460642) (size!32206 (_keys!11664 thiss!1427))))))

(declare-fun lt!460832 () Unit!34099)

(declare-fun choose!121 (array!65842 (_ BitVec 32) (_ BitVec 64)) Unit!34099)

(assert (=> d!126403 (= lt!460832 (choose!121 (_keys!11664 thiss!1427) (index!41728 lt!460642) key!909))))

(assert (=> d!126403 (bvsge (index!41728 lt!460642) #b00000000000000000000000000000000)))

(assert (=> d!126403 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11664 thiss!1427) (index!41728 lt!460642) key!909) lt!460832)))

(declare-fun b!1044573 () Bool)

(assert (=> b!1044573 (= e!592001 (not (arrayContainsKey!0 (array!65843 (store (arr!31671 (_keys!11664 thiss!1427)) (index!41728 lt!460642) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32206 (_keys!11664 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126403 res!695685) b!1044573))

(declare-fun m!964075 () Bool)

(assert (=> d!126403 m!964075))

(assert (=> b!1044573 m!963771))

(declare-fun m!964077 () Bool)

(assert (=> b!1044573 m!964077))

(assert (=> b!1044338 d!126403))

(declare-fun d!126405 () Bool)

(declare-fun e!592004 () Bool)

(assert (=> d!126405 e!592004))

(declare-fun res!695688 () Bool)

(assert (=> d!126405 (=> (not res!695688) (not e!592004))))

(assert (=> d!126405 (= res!695688 (and (bvsge (index!41728 lt!460642) #b00000000000000000000000000000000) (bvslt (index!41728 lt!460642) (size!32206 (_keys!11664 thiss!1427)))))))

(declare-fun lt!460835 () Unit!34099)

(declare-fun choose!53 (array!65842 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22005) Unit!34099)

(assert (=> d!126405 (= lt!460835 (choose!53 (_keys!11664 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41728 lt!460642) #b00000000000000000000000000000000 Nil!22002))))

(assert (=> d!126405 (bvslt (size!32206 (_keys!11664 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126405 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11664 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41728 lt!460642) #b00000000000000000000000000000000 Nil!22002) lt!460835)))

(declare-fun b!1044576 () Bool)

(assert (=> b!1044576 (= e!592004 (arrayNoDuplicates!0 (array!65843 (store (arr!31671 (_keys!11664 thiss!1427)) (index!41728 lt!460642) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32206 (_keys!11664 thiss!1427))) #b00000000000000000000000000000000 Nil!22002))))

(assert (= (and d!126405 res!695688) b!1044576))

(declare-fun m!964079 () Bool)

(assert (=> d!126405 m!964079))

(assert (=> b!1044576 m!963771))

(declare-fun m!964081 () Bool)

(assert (=> b!1044576 m!964081))

(assert (=> b!1044338 d!126405))

(declare-fun d!126407 () Bool)

(assert (=> d!126407 (= (array_inv!24463 (_keys!11664 thiss!1427)) (bvsge (size!32206 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044339 d!126407))

(declare-fun d!126409 () Bool)

(assert (=> d!126409 (= (array_inv!24464 (_values!6423 thiss!1427)) (bvsge (size!32207 (_values!6423 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044339 d!126409))

(declare-fun d!126411 () Bool)

(assert (=> d!126411 (= (validMask!0 (mask!30507 (_2!7889 lt!460637))) (and (or (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000000000000000111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000000000000001111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000000000000011111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000000000000111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000000000001111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000000000011111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000000000111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000000001111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000000011111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000000111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000001111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000011111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000000111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000001111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000011111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000000111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000001111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000011111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000000111111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000001111111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000011111111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000000111111111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000001111111111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000011111111111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00000111111111111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00001111111111111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00011111111111111111111111111111) (= (mask!30507 (_2!7889 lt!460637)) #b00111111111111111111111111111111)) (bvsle (mask!30507 (_2!7889 lt!460637)) #b00111111111111111111111111111111)))))

(assert (=> b!1044333 d!126411))

(declare-fun d!126413 () Bool)

(declare-fun res!695695 () Bool)

(declare-fun e!592007 () Bool)

(assert (=> d!126413 (=> (not res!695695) (not e!592007))))

(declare-fun simpleValid!449 (LongMapFixedSize!6024) Bool)

(assert (=> d!126413 (= res!695695 (simpleValid!449 thiss!1427))))

(assert (=> d!126413 (= (valid!2260 thiss!1427) e!592007)))

(declare-fun b!1044583 () Bool)

(declare-fun res!695696 () Bool)

(assert (=> b!1044583 (=> (not res!695696) (not e!592007))))

(assert (=> b!1044583 (= res!695696 (= (arrayCountValidKeys!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 (size!32206 (_keys!11664 thiss!1427))) (_size!3067 thiss!1427)))))

(declare-fun b!1044584 () Bool)

(declare-fun res!695697 () Bool)

(assert (=> b!1044584 (=> (not res!695697) (not e!592007))))

(assert (=> b!1044584 (= res!695697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11664 thiss!1427) (mask!30507 thiss!1427)))))

(declare-fun b!1044585 () Bool)

(assert (=> b!1044585 (= e!592007 (arrayNoDuplicates!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 Nil!22002))))

(assert (= (and d!126413 res!695695) b!1044583))

(assert (= (and b!1044583 res!695696) b!1044584))

(assert (= (and b!1044584 res!695697) b!1044585))

(declare-fun m!964083 () Bool)

(assert (=> d!126413 m!964083))

(assert (=> b!1044583 m!963777))

(declare-fun m!964085 () Bool)

(assert (=> b!1044584 m!964085))

(declare-fun m!964087 () Bool)

(assert (=> b!1044585 m!964087))

(assert (=> start!91774 d!126413))

(declare-fun mapNonEmpty!38891 () Bool)

(declare-fun mapRes!38891 () Bool)

(declare-fun tp!74607 () Bool)

(declare-fun e!592013 () Bool)

(assert (=> mapNonEmpty!38891 (= mapRes!38891 (and tp!74607 e!592013))))

(declare-fun mapRest!38891 () (Array (_ BitVec 32) ValueCell!11715))

(declare-fun mapKey!38891 () (_ BitVec 32))

(declare-fun mapValue!38891 () ValueCell!11715)

(assert (=> mapNonEmpty!38891 (= mapRest!38885 (store mapRest!38891 mapKey!38891 mapValue!38891))))

(declare-fun mapIsEmpty!38891 () Bool)

(assert (=> mapIsEmpty!38891 mapRes!38891))

(declare-fun condMapEmpty!38891 () Bool)

(declare-fun mapDefault!38891 () ValueCell!11715)

(assert (=> mapNonEmpty!38885 (= condMapEmpty!38891 (= mapRest!38885 ((as const (Array (_ BitVec 32) ValueCell!11715)) mapDefault!38891)))))

(declare-fun e!592012 () Bool)

(assert (=> mapNonEmpty!38885 (= tp!74598 (and e!592012 mapRes!38891))))

(declare-fun b!1044593 () Bool)

(assert (=> b!1044593 (= e!592012 tp_is_empty!24837)))

(declare-fun b!1044592 () Bool)

(assert (=> b!1044592 (= e!592013 tp_is_empty!24837)))

(assert (= (and mapNonEmpty!38885 condMapEmpty!38891) mapIsEmpty!38891))

(assert (= (and mapNonEmpty!38885 (not condMapEmpty!38891)) mapNonEmpty!38891))

(assert (= (and mapNonEmpty!38891 ((_ is ValueCellFull!11715) mapValue!38891)) b!1044592))

(assert (= (and mapNonEmpty!38885 ((_ is ValueCellFull!11715) mapDefault!38891)) b!1044593))

(declare-fun m!964089 () Bool)

(assert (=> mapNonEmpty!38891 m!964089))

(declare-fun b_lambda!16235 () Bool)

(assert (= b_lambda!16231 (or (and b!1044339 b_free!21117) b_lambda!16235)))

(declare-fun b_lambda!16237 () Bool)

(assert (= b_lambda!16227 (or (and b!1044339 b_free!21117) b_lambda!16237)))

(declare-fun b_lambda!16239 () Bool)

(assert (= b_lambda!16229 (or (and b!1044339 b_free!21117) b_lambda!16239)))

(check-sat (not b!1044492) (not b!1044509) (not bm!44381) (not b!1044479) (not b!1044490) (not b!1044481) (not b!1044409) (not d!126413) (not d!126385) (not b!1044485) (not b!1044408) (not bm!44358) (not d!126403) (not b!1044455) (not b!1044545) (not b!1044573) (not bm!44360) (not b!1044473) (not b_lambda!16225) (not b!1044398) (not b_lambda!16239) (not b!1044523) (not b_lambda!16235) (not d!126405) (not bm!44362) (not b!1044457) (not b!1044568) (not d!126401) (not b!1044554) (not b!1044458) (not b!1044511) (not b!1044556) (not bm!44367) (not d!126387) (not b_lambda!16237) (not bm!44377) (not b!1044537) (not bm!44343) (not b!1044540) tp_is_empty!24837 (not b!1044478) b_and!33703 (not b!1044567) (not bm!44383) (not bm!44369) (not b!1044558) (not bm!44365) (not b!1044570) (not bm!44379) (not b!1044460) (not bm!44366) (not b!1044585) (not b!1044583) (not bm!44374) (not b!1044543) (not d!126375) (not b!1044584) (not b!1044542) (not bm!44378) (not d!126383) (not b!1044494) (not b!1044576) (not b!1044389) (not b!1044510) (not b_next!21117) (not b!1044530) (not bm!44359) (not b!1044471) (not d!126381) (not d!126393) (not mapNonEmpty!38891) (not b!1044549) (not b_lambda!16233) (not b!1044464) (not d!126377) (not b!1044476) (not b!1044396) (not bm!44380) (not b!1044527) (not b!1044469) (not d!126399) (not b!1044497))
(check-sat b_and!33703 (not b_next!21117))
