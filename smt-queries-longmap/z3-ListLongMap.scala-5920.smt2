; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76858 () Bool)

(assert start!76858)

(declare-fun b!898600 () Bool)

(declare-fun b_free!16021 () Bool)

(declare-fun b_next!16021 () Bool)

(assert (=> b!898600 (= b_free!16021 (not b_next!16021))))

(declare-fun tp!56136 () Bool)

(declare-fun b_and!26295 () Bool)

(assert (=> b!898600 (= tp!56136 b_and!26295)))

(declare-fun b!898596 () Bool)

(declare-fun e!502698 () Bool)

(declare-fun tp_is_empty!18349 () Bool)

(assert (=> b!898596 (= e!502698 tp_is_empty!18349)))

(declare-fun mapNonEmpty!29182 () Bool)

(declare-fun mapRes!29182 () Bool)

(declare-fun tp!56137 () Bool)

(assert (=> mapNonEmpty!29182 (= mapRes!29182 (and tp!56137 e!502698))))

(declare-datatypes ((array!52721 0))(
  ( (array!52722 (arr!25337 (Array (_ BitVec 32) (_ BitVec 64))) (size!25795 (_ BitVec 32))) )
))
(declare-datatypes ((V!29431 0))(
  ( (V!29432 (val!9225 Int)) )
))
(declare-datatypes ((ValueCell!8693 0))(
  ( (ValueCellFull!8693 (v!11714 V!29431)) (EmptyCell!8693) )
))
(declare-datatypes ((array!52723 0))(
  ( (array!52724 (arr!25338 (Array (_ BitVec 32) ValueCell!8693)) (size!25796 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4402 0))(
  ( (LongMapFixedSize!4403 (defaultEntry!5419 Int) (mask!26153 (_ BitVec 32)) (extraKeys!5137 (_ BitVec 32)) (zeroValue!5241 V!29431) (minValue!5241 V!29431) (_size!2256 (_ BitVec 32)) (_keys!10195 array!52721) (_values!5428 array!52723) (_vacant!2256 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4402)

(declare-fun mapRest!29182 () (Array (_ BitVec 32) ValueCell!8693))

(declare-fun mapValue!29182 () ValueCell!8693)

(declare-fun mapKey!29182 () (_ BitVec 32))

(assert (=> mapNonEmpty!29182 (= (arr!25338 (_values!5428 thiss!1181)) (store mapRest!29182 mapKey!29182 mapValue!29182))))

(declare-fun b!898597 () Bool)

(declare-fun res!607224 () Bool)

(declare-fun e!502699 () Bool)

(assert (=> b!898597 (=> (not res!607224) (not e!502699))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!898597 (= res!607224 (not (= key!785 (bvneg key!785))))))

(declare-fun b!898598 () Bool)

(declare-fun e!502695 () Bool)

(declare-fun e!502703 () Bool)

(assert (=> b!898598 (= e!502695 (and e!502703 mapRes!29182))))

(declare-fun condMapEmpty!29182 () Bool)

(declare-fun mapDefault!29182 () ValueCell!8693)

(assert (=> b!898598 (= condMapEmpty!29182 (= (arr!25338 (_values!5428 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8693)) mapDefault!29182)))))

(declare-fun b!898599 () Bool)

(declare-fun e!502702 () Bool)

(declare-fun e!502701 () Bool)

(assert (=> b!898599 (= e!502702 e!502701)))

(declare-fun res!607223 () Bool)

(assert (=> b!898599 (=> res!607223 e!502701)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898599 (= res!607223 (not (validMask!0 (mask!26153 thiss!1181))))))

(declare-datatypes ((SeekEntryResult!8930 0))(
  ( (MissingZero!8930 (index!38091 (_ BitVec 32))) (Found!8930 (index!38092 (_ BitVec 32))) (Intermediate!8930 (undefined!9742 Bool) (index!38093 (_ BitVec 32)) (x!76598 (_ BitVec 32))) (Undefined!8930) (MissingVacant!8930 (index!38094 (_ BitVec 32))) )
))
(declare-fun lt!405607 () SeekEntryResult!8930)

(declare-datatypes ((tuple2!12060 0))(
  ( (tuple2!12061 (_1!6041 (_ BitVec 64)) (_2!6041 V!29431)) )
))
(declare-datatypes ((List!17852 0))(
  ( (Nil!17849) (Cons!17848 (h!18991 tuple2!12060) (t!25186 List!17852)) )
))
(declare-datatypes ((ListLongMap!10747 0))(
  ( (ListLongMap!10748 (toList!5389 List!17852)) )
))
(declare-fun contains!4386 (ListLongMap!10747 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2608 (array!52721 array!52723 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 32) Int) ListLongMap!10747)

(assert (=> b!898599 (contains!4386 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607)))))

(declare-datatypes ((Unit!30488 0))(
  ( (Unit!30489) )
))
(declare-fun lt!405608 () Unit!30488)

(declare-fun lemmaValidKeyInArrayIsInListMap!244 (array!52721 array!52723 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 32) Int) Unit!30488)

(assert (=> b!898599 (= lt!405608 (lemmaValidKeyInArrayIsInListMap!244 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (index!38092 lt!405607) (defaultEntry!5419 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898599 (arrayContainsKey!0 (_keys!10195 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405610 () Unit!30488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52721 (_ BitVec 64) (_ BitVec 32)) Unit!30488)

(assert (=> b!898599 (= lt!405610 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10195 thiss!1181) key!785 (index!38092 lt!405607)))))

(declare-fun b!898601 () Bool)

(assert (=> b!898601 (= e!502703 tp_is_empty!18349)))

(declare-fun mapIsEmpty!29182 () Bool)

(assert (=> mapIsEmpty!29182 mapRes!29182))

(declare-fun b!898602 () Bool)

(assert (=> b!898602 (= e!502699 (not e!502702))))

(declare-fun res!607226 () Bool)

(assert (=> b!898602 (=> res!607226 e!502702)))

(get-info :version)

(assert (=> b!898602 (= res!607226 (not ((_ is Found!8930) lt!405607)))))

(declare-fun e!502697 () Bool)

(assert (=> b!898602 e!502697))

(declare-fun res!607225 () Bool)

(assert (=> b!898602 (=> res!607225 e!502697)))

(assert (=> b!898602 (= res!607225 (not ((_ is Found!8930) lt!405607)))))

(declare-fun lt!405609 () Unit!30488)

(declare-fun lemmaSeekEntryGivesInRangeIndex!96 (array!52721 array!52723 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 64)) Unit!30488)

(assert (=> b!898602 (= lt!405609 (lemmaSeekEntryGivesInRangeIndex!96 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52721 (_ BitVec 32)) SeekEntryResult!8930)

(assert (=> b!898602 (= lt!405607 (seekEntry!0 key!785 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)))))

(declare-fun res!607222 () Bool)

(assert (=> start!76858 (=> (not res!607222) (not e!502699))))

(declare-fun valid!1701 (LongMapFixedSize!4402) Bool)

(assert (=> start!76858 (= res!607222 (valid!1701 thiss!1181))))

(assert (=> start!76858 e!502699))

(declare-fun e!502696 () Bool)

(assert (=> start!76858 e!502696))

(assert (=> start!76858 true))

(declare-fun array_inv!19936 (array!52721) Bool)

(declare-fun array_inv!19937 (array!52723) Bool)

(assert (=> b!898600 (= e!502696 (and tp!56136 tp_is_empty!18349 (array_inv!19936 (_keys!10195 thiss!1181)) (array_inv!19937 (_values!5428 thiss!1181)) e!502695))))

(declare-fun b!898603 () Bool)

(assert (=> b!898603 (= e!502701 (or (not (= (size!25796 (_values!5428 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26153 thiss!1181)))) (= (size!25795 (_keys!10195 thiss!1181)) (size!25796 (_values!5428 thiss!1181)))))))

(declare-fun b!898604 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898604 (= e!502697 (inRange!0 (index!38092 lt!405607) (mask!26153 thiss!1181)))))

(assert (= (and start!76858 res!607222) b!898597))

(assert (= (and b!898597 res!607224) b!898602))

(assert (= (and b!898602 (not res!607225)) b!898604))

(assert (= (and b!898602 (not res!607226)) b!898599))

(assert (= (and b!898599 (not res!607223)) b!898603))

(assert (= (and b!898598 condMapEmpty!29182) mapIsEmpty!29182))

(assert (= (and b!898598 (not condMapEmpty!29182)) mapNonEmpty!29182))

(assert (= (and mapNonEmpty!29182 ((_ is ValueCellFull!8693) mapValue!29182)) b!898596))

(assert (= (and b!898598 ((_ is ValueCellFull!8693) mapDefault!29182)) b!898601))

(assert (= b!898600 b!898598))

(assert (= start!76858 b!898600))

(declare-fun m!834575 () Bool)

(assert (=> b!898604 m!834575))

(declare-fun m!834577 () Bool)

(assert (=> b!898600 m!834577))

(declare-fun m!834579 () Bool)

(assert (=> b!898600 m!834579))

(declare-fun m!834581 () Bool)

(assert (=> b!898599 m!834581))

(declare-fun m!834583 () Bool)

(assert (=> b!898599 m!834583))

(declare-fun m!834585 () Bool)

(assert (=> b!898599 m!834585))

(declare-fun m!834587 () Bool)

(assert (=> b!898599 m!834587))

(declare-fun m!834589 () Bool)

(assert (=> b!898599 m!834589))

(declare-fun m!834591 () Bool)

(assert (=> b!898599 m!834591))

(assert (=> b!898599 m!834585))

(declare-fun m!834593 () Bool)

(assert (=> b!898599 m!834593))

(assert (=> b!898599 m!834591))

(declare-fun m!834595 () Bool)

(assert (=> start!76858 m!834595))

(declare-fun m!834597 () Bool)

(assert (=> b!898602 m!834597))

(declare-fun m!834599 () Bool)

(assert (=> b!898602 m!834599))

(declare-fun m!834601 () Bool)

(assert (=> mapNonEmpty!29182 m!834601))

(check-sat b_and!26295 (not b!898602) (not mapNonEmpty!29182) (not b_next!16021) (not b!898600) (not b!898604) tp_is_empty!18349 (not b!898599) (not start!76858))
(check-sat b_and!26295 (not b_next!16021))
(get-model)

(declare-fun d!111151 () Bool)

(declare-fun e!502762 () Bool)

(assert (=> d!111151 e!502762))

(declare-fun res!607259 () Bool)

(assert (=> d!111151 (=> res!607259 e!502762)))

(declare-fun lt!405646 () Bool)

(assert (=> d!111151 (= res!607259 (not lt!405646))))

(declare-fun lt!405644 () Bool)

(assert (=> d!111151 (= lt!405646 lt!405644)))

(declare-fun lt!405645 () Unit!30488)

(declare-fun e!502763 () Unit!30488)

(assert (=> d!111151 (= lt!405645 e!502763)))

(declare-fun c!94966 () Bool)

(assert (=> d!111151 (= c!94966 lt!405644)))

(declare-fun containsKey!426 (List!17852 (_ BitVec 64)) Bool)

(assert (=> d!111151 (= lt!405644 (containsKey!426 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))))))

(assert (=> d!111151 (= (contains!4386 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))) lt!405646)))

(declare-fun b!898665 () Bool)

(declare-fun lt!405643 () Unit!30488)

(assert (=> b!898665 (= e!502763 lt!405643)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!321 (List!17852 (_ BitVec 64)) Unit!30488)

(assert (=> b!898665 (= lt!405643 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))))))

(declare-datatypes ((Option!464 0))(
  ( (Some!463 (v!11717 V!29431)) (None!462) )
))
(declare-fun isDefined!334 (Option!464) Bool)

(declare-fun getValueByKey!458 (List!17852 (_ BitVec 64)) Option!464)

(assert (=> b!898665 (isDefined!334 (getValueByKey!458 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))))))

(declare-fun b!898666 () Bool)

(declare-fun Unit!30492 () Unit!30488)

(assert (=> b!898666 (= e!502763 Unit!30492)))

(declare-fun b!898667 () Bool)

(assert (=> b!898667 (= e!502762 (isDefined!334 (getValueByKey!458 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607)))))))

(assert (= (and d!111151 c!94966) b!898665))

(assert (= (and d!111151 (not c!94966)) b!898666))

(assert (= (and d!111151 (not res!607259)) b!898667))

(assert (=> d!111151 m!834585))

(declare-fun m!834659 () Bool)

(assert (=> d!111151 m!834659))

(assert (=> b!898665 m!834585))

(declare-fun m!834661 () Bool)

(assert (=> b!898665 m!834661))

(assert (=> b!898665 m!834585))

(declare-fun m!834663 () Bool)

(assert (=> b!898665 m!834663))

(assert (=> b!898665 m!834663))

(declare-fun m!834665 () Bool)

(assert (=> b!898665 m!834665))

(assert (=> b!898667 m!834585))

(assert (=> b!898667 m!834663))

(assert (=> b!898667 m!834663))

(assert (=> b!898667 m!834665))

(assert (=> b!898599 d!111151))

(declare-fun d!111153 () Bool)

(declare-fun e!502766 () Bool)

(assert (=> d!111153 e!502766))

(declare-fun res!607262 () Bool)

(assert (=> d!111153 (=> (not res!607262) (not e!502766))))

(assert (=> d!111153 (= res!607262 (and (bvsge (index!38092 lt!405607) #b00000000000000000000000000000000) (bvslt (index!38092 lt!405607) (size!25795 (_keys!10195 thiss!1181)))))))

(declare-fun lt!405649 () Unit!30488)

(declare-fun choose!1504 (array!52721 array!52723 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 32) Int) Unit!30488)

(assert (=> d!111153 (= lt!405649 (choose!1504 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (index!38092 lt!405607) (defaultEntry!5419 thiss!1181)))))

(assert (=> d!111153 (validMask!0 (mask!26153 thiss!1181))))

(assert (=> d!111153 (= (lemmaValidKeyInArrayIsInListMap!244 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (index!38092 lt!405607) (defaultEntry!5419 thiss!1181)) lt!405649)))

(declare-fun b!898670 () Bool)

(assert (=> b!898670 (= e!502766 (contains!4386 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))))))

(assert (= (and d!111153 res!607262) b!898670))

(declare-fun m!834667 () Bool)

(assert (=> d!111153 m!834667))

(assert (=> d!111153 m!834589))

(assert (=> b!898670 m!834591))

(assert (=> b!898670 m!834585))

(assert (=> b!898670 m!834591))

(assert (=> b!898670 m!834585))

(assert (=> b!898670 m!834593))

(assert (=> b!898599 d!111153))

(declare-fun d!111155 () Bool)

(assert (=> d!111155 (= (validMask!0 (mask!26153 thiss!1181)) (and (or (= (mask!26153 thiss!1181) #b00000000000000000000000000000111) (= (mask!26153 thiss!1181) #b00000000000000000000000000001111) (= (mask!26153 thiss!1181) #b00000000000000000000000000011111) (= (mask!26153 thiss!1181) #b00000000000000000000000000111111) (= (mask!26153 thiss!1181) #b00000000000000000000000001111111) (= (mask!26153 thiss!1181) #b00000000000000000000000011111111) (= (mask!26153 thiss!1181) #b00000000000000000000000111111111) (= (mask!26153 thiss!1181) #b00000000000000000000001111111111) (= (mask!26153 thiss!1181) #b00000000000000000000011111111111) (= (mask!26153 thiss!1181) #b00000000000000000000111111111111) (= (mask!26153 thiss!1181) #b00000000000000000001111111111111) (= (mask!26153 thiss!1181) #b00000000000000000011111111111111) (= (mask!26153 thiss!1181) #b00000000000000000111111111111111) (= (mask!26153 thiss!1181) #b00000000000000001111111111111111) (= (mask!26153 thiss!1181) #b00000000000000011111111111111111) (= (mask!26153 thiss!1181) #b00000000000000111111111111111111) (= (mask!26153 thiss!1181) #b00000000000001111111111111111111) (= (mask!26153 thiss!1181) #b00000000000011111111111111111111) (= (mask!26153 thiss!1181) #b00000000000111111111111111111111) (= (mask!26153 thiss!1181) #b00000000001111111111111111111111) (= (mask!26153 thiss!1181) #b00000000011111111111111111111111) (= (mask!26153 thiss!1181) #b00000000111111111111111111111111) (= (mask!26153 thiss!1181) #b00000001111111111111111111111111) (= (mask!26153 thiss!1181) #b00000011111111111111111111111111) (= (mask!26153 thiss!1181) #b00000111111111111111111111111111) (= (mask!26153 thiss!1181) #b00001111111111111111111111111111) (= (mask!26153 thiss!1181) #b00011111111111111111111111111111) (= (mask!26153 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26153 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898599 d!111155))

(declare-fun d!111157 () Bool)

(declare-fun res!607267 () Bool)

(declare-fun e!502771 () Bool)

(assert (=> d!111157 (=> res!607267 e!502771)))

(assert (=> d!111157 (= res!607267 (= (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111157 (= (arrayContainsKey!0 (_keys!10195 thiss!1181) key!785 #b00000000000000000000000000000000) e!502771)))

(declare-fun b!898675 () Bool)

(declare-fun e!502772 () Bool)

(assert (=> b!898675 (= e!502771 e!502772)))

(declare-fun res!607268 () Bool)

(assert (=> b!898675 (=> (not res!607268) (not e!502772))))

(assert (=> b!898675 (= res!607268 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25795 (_keys!10195 thiss!1181))))))

(declare-fun b!898676 () Bool)

(assert (=> b!898676 (= e!502772 (arrayContainsKey!0 (_keys!10195 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111157 (not res!607267)) b!898675))

(assert (= (and b!898675 res!607268) b!898676))

(declare-fun m!834669 () Bool)

(assert (=> d!111157 m!834669))

(declare-fun m!834671 () Bool)

(assert (=> b!898676 m!834671))

(assert (=> b!898599 d!111157))

(declare-fun b!898719 () Bool)

(declare-fun e!502808 () Bool)

(declare-fun lt!405706 () ListLongMap!10747)

(declare-fun apply!407 (ListLongMap!10747 (_ BitVec 64)) V!29431)

(assert (=> b!898719 (= e!502808 (= (apply!407 lt!405706 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5241 thiss!1181)))))

(declare-fun b!898720 () Bool)

(declare-fun e!502811 () Bool)

(declare-fun e!502804 () Bool)

(assert (=> b!898720 (= e!502811 e!502804)))

(declare-fun res!607290 () Bool)

(assert (=> b!898720 (=> (not res!607290) (not e!502804))))

(assert (=> b!898720 (= res!607290 (contains!4386 lt!405706 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(declare-fun b!898721 () Bool)

(declare-fun e!502805 () Bool)

(assert (=> b!898721 (= e!502805 (= (apply!407 lt!405706 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5241 thiss!1181)))))

(declare-fun b!898722 () Bool)

(declare-fun e!502807 () Bool)

(assert (=> b!898722 (= e!502807 e!502808)))

(declare-fun res!607289 () Bool)

(declare-fun call!39879 () Bool)

(assert (=> b!898722 (= res!607289 call!39879)))

(assert (=> b!898722 (=> (not res!607289) (not e!502808))))

(declare-fun b!898723 () Bool)

(declare-fun e!502802 () ListLongMap!10747)

(declare-fun call!39882 () ListLongMap!10747)

(assert (=> b!898723 (= e!502802 call!39882)))

(declare-fun b!898724 () Bool)

(declare-fun c!94980 () Bool)

(assert (=> b!898724 (= c!94980 (and (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!502809 () ListLongMap!10747)

(assert (=> b!898724 (= e!502802 e!502809)))

(declare-fun b!898725 () Bool)

(declare-fun res!607291 () Bool)

(declare-fun e!502806 () Bool)

(assert (=> b!898725 (=> (not res!607291) (not e!502806))))

(assert (=> b!898725 (= res!607291 e!502807)))

(declare-fun c!94983 () Bool)

(assert (=> b!898725 (= c!94983 (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!898726 () Bool)

(assert (=> b!898726 (= e!502809 call!39882)))

(declare-fun b!898727 () Bool)

(declare-fun e!502799 () Unit!30488)

(declare-fun Unit!30493 () Unit!30488)

(assert (=> b!898727 (= e!502799 Unit!30493)))

(declare-fun bm!39875 () Bool)

(declare-fun call!39881 () ListLongMap!10747)

(assert (=> bm!39875 (= call!39882 call!39881)))

(declare-fun bm!39876 () Bool)

(declare-fun call!39880 () ListLongMap!10747)

(declare-fun call!39884 () ListLongMap!10747)

(assert (=> bm!39876 (= call!39880 call!39884)))

(declare-fun b!898729 () Bool)

(declare-fun lt!405703 () Unit!30488)

(assert (=> b!898729 (= e!502799 lt!405703)))

(declare-fun lt!405714 () ListLongMap!10747)

(declare-fun getCurrentListMapNoExtraKeys!3315 (array!52721 array!52723 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 32) Int) ListLongMap!10747)

(assert (=> b!898729 (= lt!405714 (getCurrentListMapNoExtraKeys!3315 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))

(declare-fun lt!405701 () (_ BitVec 64))

(assert (=> b!898729 (= lt!405701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405707 () (_ BitVec 64))

(assert (=> b!898729 (= lt!405707 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405702 () Unit!30488)

(declare-fun addStillContains!333 (ListLongMap!10747 (_ BitVec 64) V!29431 (_ BitVec 64)) Unit!30488)

(assert (=> b!898729 (= lt!405702 (addStillContains!333 lt!405714 lt!405701 (zeroValue!5241 thiss!1181) lt!405707))))

(declare-fun +!2618 (ListLongMap!10747 tuple2!12060) ListLongMap!10747)

(assert (=> b!898729 (contains!4386 (+!2618 lt!405714 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181))) lt!405707)))

(declare-fun lt!405709 () Unit!30488)

(assert (=> b!898729 (= lt!405709 lt!405702)))

(declare-fun lt!405700 () ListLongMap!10747)

(assert (=> b!898729 (= lt!405700 (getCurrentListMapNoExtraKeys!3315 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))

(declare-fun lt!405712 () (_ BitVec 64))

(assert (=> b!898729 (= lt!405712 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405705 () (_ BitVec 64))

(assert (=> b!898729 (= lt!405705 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405697 () Unit!30488)

(declare-fun addApplyDifferent!333 (ListLongMap!10747 (_ BitVec 64) V!29431 (_ BitVec 64)) Unit!30488)

(assert (=> b!898729 (= lt!405697 (addApplyDifferent!333 lt!405700 lt!405712 (minValue!5241 thiss!1181) lt!405705))))

(assert (=> b!898729 (= (apply!407 (+!2618 lt!405700 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181))) lt!405705) (apply!407 lt!405700 lt!405705))))

(declare-fun lt!405713 () Unit!30488)

(assert (=> b!898729 (= lt!405713 lt!405697)))

(declare-fun lt!405695 () ListLongMap!10747)

(assert (=> b!898729 (= lt!405695 (getCurrentListMapNoExtraKeys!3315 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))

(declare-fun lt!405696 () (_ BitVec 64))

(assert (=> b!898729 (= lt!405696 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405711 () (_ BitVec 64))

(assert (=> b!898729 (= lt!405711 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405704 () Unit!30488)

(assert (=> b!898729 (= lt!405704 (addApplyDifferent!333 lt!405695 lt!405696 (zeroValue!5241 thiss!1181) lt!405711))))

(assert (=> b!898729 (= (apply!407 (+!2618 lt!405695 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181))) lt!405711) (apply!407 lt!405695 lt!405711))))

(declare-fun lt!405699 () Unit!30488)

(assert (=> b!898729 (= lt!405699 lt!405704)))

(declare-fun lt!405698 () ListLongMap!10747)

(assert (=> b!898729 (= lt!405698 (getCurrentListMapNoExtraKeys!3315 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))

(declare-fun lt!405715 () (_ BitVec 64))

(assert (=> b!898729 (= lt!405715 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405708 () (_ BitVec 64))

(assert (=> b!898729 (= lt!405708 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898729 (= lt!405703 (addApplyDifferent!333 lt!405698 lt!405715 (minValue!5241 thiss!1181) lt!405708))))

(assert (=> b!898729 (= (apply!407 (+!2618 lt!405698 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181))) lt!405708) (apply!407 lt!405698 lt!405708))))

(declare-fun b!898730 () Bool)

(declare-fun res!607293 () Bool)

(assert (=> b!898730 (=> (not res!607293) (not e!502806))))

(assert (=> b!898730 (= res!607293 e!502811)))

(declare-fun res!607294 () Bool)

(assert (=> b!898730 (=> res!607294 e!502811)))

(declare-fun e!502801 () Bool)

(assert (=> b!898730 (= res!607294 (not e!502801))))

(declare-fun res!607288 () Bool)

(assert (=> b!898730 (=> (not res!607288) (not e!502801))))

(assert (=> b!898730 (= res!607288 (bvslt #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(declare-fun b!898731 () Bool)

(declare-fun e!502803 () Bool)

(declare-fun call!39883 () Bool)

(assert (=> b!898731 (= e!502803 (not call!39883))))

(declare-fun b!898732 () Bool)

(declare-fun e!502800 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898732 (= e!502800 (validKeyInArray!0 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun c!94982 () Bool)

(declare-fun bm!39877 () Bool)

(declare-fun c!94979 () Bool)

(declare-fun call!39878 () ListLongMap!10747)

(assert (=> bm!39877 (= call!39881 (+!2618 (ite c!94979 call!39884 (ite c!94982 call!39880 call!39878)) (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(declare-fun b!898733 () Bool)

(assert (=> b!898733 (= e!502807 (not call!39879))))

(declare-fun bm!39878 () Bool)

(assert (=> bm!39878 (= call!39884 (getCurrentListMapNoExtraKeys!3315 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))

(declare-fun b!898734 () Bool)

(declare-fun e!502810 () ListLongMap!10747)

(assert (=> b!898734 (= e!502810 (+!2618 call!39881 (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))

(declare-fun b!898735 () Bool)

(assert (=> b!898735 (= e!502806 e!502803)))

(declare-fun c!94984 () Bool)

(assert (=> b!898735 (= c!94984 (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39879 () Bool)

(assert (=> bm!39879 (= call!39878 call!39880)))

(declare-fun b!898728 () Bool)

(declare-fun get!13327 (ValueCell!8693 V!29431) V!29431)

(declare-fun dynLambda!1301 (Int (_ BitVec 64)) V!29431)

(assert (=> b!898728 (= e!502804 (= (apply!407 lt!405706 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)) (get!13327 (select (arr!25338 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1301 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898728 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25796 (_values!5428 thiss!1181))))))

(assert (=> b!898728 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(declare-fun d!111159 () Bool)

(assert (=> d!111159 e!502806))

(declare-fun res!607295 () Bool)

(assert (=> d!111159 (=> (not res!607295) (not e!502806))))

(assert (=> d!111159 (= res!607295 (or (bvsge #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))))

(declare-fun lt!405694 () ListLongMap!10747)

(assert (=> d!111159 (= lt!405706 lt!405694)))

(declare-fun lt!405710 () Unit!30488)

(assert (=> d!111159 (= lt!405710 e!502799)))

(declare-fun c!94981 () Bool)

(assert (=> d!111159 (= c!94981 e!502800)))

(declare-fun res!607287 () Bool)

(assert (=> d!111159 (=> (not res!607287) (not e!502800))))

(assert (=> d!111159 (= res!607287 (bvslt #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(assert (=> d!111159 (= lt!405694 e!502810)))

(assert (=> d!111159 (= c!94979 (and (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111159 (validMask!0 (mask!26153 thiss!1181))))

(assert (=> d!111159 (= (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) lt!405706)))

(declare-fun b!898736 () Bool)

(assert (=> b!898736 (= e!502803 e!502805)))

(declare-fun res!607292 () Bool)

(assert (=> b!898736 (= res!607292 call!39883)))

(assert (=> b!898736 (=> (not res!607292) (not e!502805))))

(declare-fun bm!39880 () Bool)

(assert (=> bm!39880 (= call!39883 (contains!4386 lt!405706 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898737 () Bool)

(assert (=> b!898737 (= e!502810 e!502802)))

(assert (=> b!898737 (= c!94982 (and (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!898738 () Bool)

(assert (=> b!898738 (= e!502801 (validKeyInArray!0 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898739 () Bool)

(assert (=> b!898739 (= e!502809 call!39878)))

(declare-fun bm!39881 () Bool)

(assert (=> bm!39881 (= call!39879 (contains!4386 lt!405706 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111159 c!94979) b!898734))

(assert (= (and d!111159 (not c!94979)) b!898737))

(assert (= (and b!898737 c!94982) b!898723))

(assert (= (and b!898737 (not c!94982)) b!898724))

(assert (= (and b!898724 c!94980) b!898726))

(assert (= (and b!898724 (not c!94980)) b!898739))

(assert (= (or b!898726 b!898739) bm!39879))

(assert (= (or b!898723 bm!39879) bm!39876))

(assert (= (or b!898723 b!898726) bm!39875))

(assert (= (or b!898734 bm!39876) bm!39878))

(assert (= (or b!898734 bm!39875) bm!39877))

(assert (= (and d!111159 res!607287) b!898732))

(assert (= (and d!111159 c!94981) b!898729))

(assert (= (and d!111159 (not c!94981)) b!898727))

(assert (= (and d!111159 res!607295) b!898730))

(assert (= (and b!898730 res!607288) b!898738))

(assert (= (and b!898730 (not res!607294)) b!898720))

(assert (= (and b!898720 res!607290) b!898728))

(assert (= (and b!898730 res!607293) b!898725))

(assert (= (and b!898725 c!94983) b!898722))

(assert (= (and b!898725 (not c!94983)) b!898733))

(assert (= (and b!898722 res!607289) b!898719))

(assert (= (or b!898722 b!898733) bm!39881))

(assert (= (and b!898725 res!607291) b!898735))

(assert (= (and b!898735 c!94984) b!898736))

(assert (= (and b!898735 (not c!94984)) b!898731))

(assert (= (and b!898736 res!607292) b!898721))

(assert (= (or b!898736 b!898731) bm!39880))

(declare-fun b_lambda!12957 () Bool)

(assert (=> (not b_lambda!12957) (not b!898728)))

(declare-fun t!25189 () Bool)

(declare-fun tb!5187 () Bool)

(assert (=> (and b!898600 (= (defaultEntry!5419 thiss!1181) (defaultEntry!5419 thiss!1181)) t!25189) tb!5187))

(declare-fun result!10149 () Bool)

(assert (=> tb!5187 (= result!10149 tp_is_empty!18349)))

(assert (=> b!898728 t!25189))

(declare-fun b_and!26301 () Bool)

(assert (= b_and!26295 (and (=> t!25189 result!10149) b_and!26301)))

(declare-fun m!834673 () Bool)

(assert (=> bm!39881 m!834673))

(declare-fun m!834675 () Bool)

(assert (=> bm!39877 m!834675))

(declare-fun m!834677 () Bool)

(assert (=> b!898729 m!834677))

(declare-fun m!834679 () Bool)

(assert (=> b!898729 m!834679))

(declare-fun m!834681 () Bool)

(assert (=> b!898729 m!834681))

(declare-fun m!834683 () Bool)

(assert (=> b!898729 m!834683))

(declare-fun m!834685 () Bool)

(assert (=> b!898729 m!834685))

(declare-fun m!834687 () Bool)

(assert (=> b!898729 m!834687))

(declare-fun m!834689 () Bool)

(assert (=> b!898729 m!834689))

(declare-fun m!834691 () Bool)

(assert (=> b!898729 m!834691))

(declare-fun m!834693 () Bool)

(assert (=> b!898729 m!834693))

(assert (=> b!898729 m!834669))

(declare-fun m!834695 () Bool)

(assert (=> b!898729 m!834695))

(assert (=> b!898729 m!834677))

(declare-fun m!834697 () Bool)

(assert (=> b!898729 m!834697))

(declare-fun m!834699 () Bool)

(assert (=> b!898729 m!834699))

(assert (=> b!898729 m!834683))

(declare-fun m!834701 () Bool)

(assert (=> b!898729 m!834701))

(assert (=> b!898729 m!834679))

(declare-fun m!834703 () Bool)

(assert (=> b!898729 m!834703))

(declare-fun m!834705 () Bool)

(assert (=> b!898729 m!834705))

(assert (=> b!898729 m!834687))

(declare-fun m!834707 () Bool)

(assert (=> b!898729 m!834707))

(assert (=> bm!39878 m!834695))

(declare-fun m!834709 () Bool)

(assert (=> b!898734 m!834709))

(declare-fun m!834711 () Bool)

(assert (=> b!898719 m!834711))

(assert (=> b!898728 m!834669))

(declare-fun m!834713 () Bool)

(assert (=> b!898728 m!834713))

(assert (=> b!898728 m!834713))

(declare-fun m!834715 () Bool)

(assert (=> b!898728 m!834715))

(declare-fun m!834717 () Bool)

(assert (=> b!898728 m!834717))

(assert (=> b!898728 m!834715))

(assert (=> b!898728 m!834669))

(declare-fun m!834719 () Bool)

(assert (=> b!898728 m!834719))

(assert (=> d!111159 m!834589))

(assert (=> b!898720 m!834669))

(assert (=> b!898720 m!834669))

(declare-fun m!834721 () Bool)

(assert (=> b!898720 m!834721))

(assert (=> b!898738 m!834669))

(assert (=> b!898738 m!834669))

(declare-fun m!834723 () Bool)

(assert (=> b!898738 m!834723))

(assert (=> b!898732 m!834669))

(assert (=> b!898732 m!834669))

(assert (=> b!898732 m!834723))

(declare-fun m!834725 () Bool)

(assert (=> b!898721 m!834725))

(declare-fun m!834727 () Bool)

(assert (=> bm!39880 m!834727))

(assert (=> b!898599 d!111159))

(declare-fun d!111161 () Bool)

(assert (=> d!111161 (arrayContainsKey!0 (_keys!10195 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405718 () Unit!30488)

(declare-fun choose!13 (array!52721 (_ BitVec 64) (_ BitVec 32)) Unit!30488)

(assert (=> d!111161 (= lt!405718 (choose!13 (_keys!10195 thiss!1181) key!785 (index!38092 lt!405607)))))

(assert (=> d!111161 (bvsge (index!38092 lt!405607) #b00000000000000000000000000000000)))

(assert (=> d!111161 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10195 thiss!1181) key!785 (index!38092 lt!405607)) lt!405718)))

(declare-fun bs!25198 () Bool)

(assert (= bs!25198 d!111161))

(assert (=> bs!25198 m!834583))

(declare-fun m!834729 () Bool)

(assert (=> bs!25198 m!834729))

(assert (=> b!898599 d!111161))

(declare-fun d!111163 () Bool)

(declare-fun res!607302 () Bool)

(declare-fun e!502814 () Bool)

(assert (=> d!111163 (=> (not res!607302) (not e!502814))))

(declare-fun simpleValid!325 (LongMapFixedSize!4402) Bool)

(assert (=> d!111163 (= res!607302 (simpleValid!325 thiss!1181))))

(assert (=> d!111163 (= (valid!1701 thiss!1181) e!502814)))

(declare-fun b!898748 () Bool)

(declare-fun res!607303 () Bool)

(assert (=> b!898748 (=> (not res!607303) (not e!502814))))

(declare-fun arrayCountValidKeys!0 (array!52721 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898748 (= res!607303 (= (arrayCountValidKeys!0 (_keys!10195 thiss!1181) #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))) (_size!2256 thiss!1181)))))

(declare-fun b!898749 () Bool)

(declare-fun res!607304 () Bool)

(assert (=> b!898749 (=> (not res!607304) (not e!502814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52721 (_ BitVec 32)) Bool)

(assert (=> b!898749 (= res!607304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)))))

(declare-fun b!898750 () Bool)

(declare-datatypes ((List!17854 0))(
  ( (Nil!17851) (Cons!17850 (h!18993 (_ BitVec 64)) (t!25190 List!17854)) )
))
(declare-fun arrayNoDuplicates!0 (array!52721 (_ BitVec 32) List!17854) Bool)

(assert (=> b!898750 (= e!502814 (arrayNoDuplicates!0 (_keys!10195 thiss!1181) #b00000000000000000000000000000000 Nil!17851))))

(assert (= (and d!111163 res!607302) b!898748))

(assert (= (and b!898748 res!607303) b!898749))

(assert (= (and b!898749 res!607304) b!898750))

(declare-fun m!834731 () Bool)

(assert (=> d!111163 m!834731))

(declare-fun m!834733 () Bool)

(assert (=> b!898748 m!834733))

(declare-fun m!834735 () Bool)

(assert (=> b!898749 m!834735))

(declare-fun m!834737 () Bool)

(assert (=> b!898750 m!834737))

(assert (=> start!76858 d!111163))

(declare-fun d!111165 () Bool)

(assert (=> d!111165 (= (inRange!0 (index!38092 lt!405607) (mask!26153 thiss!1181)) (and (bvsge (index!38092 lt!405607) #b00000000000000000000000000000000) (bvslt (index!38092 lt!405607) (bvadd (mask!26153 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898604 d!111165))

(declare-fun d!111167 () Bool)

(assert (=> d!111167 (= (array_inv!19936 (_keys!10195 thiss!1181)) (bvsge (size!25795 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898600 d!111167))

(declare-fun d!111169 () Bool)

(assert (=> d!111169 (= (array_inv!19937 (_values!5428 thiss!1181)) (bvsge (size!25796 (_values!5428 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898600 d!111169))

(declare-fun d!111171 () Bool)

(declare-fun e!502817 () Bool)

(assert (=> d!111171 e!502817))

(declare-fun res!607307 () Bool)

(assert (=> d!111171 (=> res!607307 e!502817)))

(declare-fun lt!405724 () SeekEntryResult!8930)

(assert (=> d!111171 (= res!607307 (not ((_ is Found!8930) lt!405724)))))

(assert (=> d!111171 (= lt!405724 (seekEntry!0 key!785 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)))))

(declare-fun lt!405723 () Unit!30488)

(declare-fun choose!1505 (array!52721 array!52723 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 64)) Unit!30488)

(assert (=> d!111171 (= lt!405723 (choose!1505 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) key!785))))

(assert (=> d!111171 (validMask!0 (mask!26153 thiss!1181))))

(assert (=> d!111171 (= (lemmaSeekEntryGivesInRangeIndex!96 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) key!785) lt!405723)))

(declare-fun b!898753 () Bool)

(assert (=> b!898753 (= e!502817 (inRange!0 (index!38092 lt!405724) (mask!26153 thiss!1181)))))

(assert (= (and d!111171 (not res!607307)) b!898753))

(assert (=> d!111171 m!834599))

(declare-fun m!834739 () Bool)

(assert (=> d!111171 m!834739))

(assert (=> d!111171 m!834589))

(declare-fun m!834741 () Bool)

(assert (=> b!898753 m!834741))

(assert (=> b!898602 d!111171))

(declare-fun b!898766 () Bool)

(declare-fun e!502826 () SeekEntryResult!8930)

(declare-fun lt!405735 () SeekEntryResult!8930)

(assert (=> b!898766 (= e!502826 (MissingZero!8930 (index!38093 lt!405735)))))

(declare-fun b!898767 () Bool)

(declare-fun e!502825 () SeekEntryResult!8930)

(assert (=> b!898767 (= e!502825 Undefined!8930)))

(declare-fun b!898768 () Bool)

(declare-fun e!502824 () SeekEntryResult!8930)

(assert (=> b!898768 (= e!502825 e!502824)))

(declare-fun lt!405736 () (_ BitVec 64))

(assert (=> b!898768 (= lt!405736 (select (arr!25337 (_keys!10195 thiss!1181)) (index!38093 lt!405735)))))

(declare-fun c!94993 () Bool)

(assert (=> b!898768 (= c!94993 (= lt!405736 key!785))))

(declare-fun b!898769 () Bool)

(assert (=> b!898769 (= e!502824 (Found!8930 (index!38093 lt!405735)))))

(declare-fun b!898770 () Bool)

(declare-fun c!94992 () Bool)

(assert (=> b!898770 (= c!94992 (= lt!405736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898770 (= e!502824 e!502826)))

(declare-fun b!898771 () Bool)

(declare-fun lt!405734 () SeekEntryResult!8930)

(assert (=> b!898771 (= e!502826 (ite ((_ is MissingVacant!8930) lt!405734) (MissingZero!8930 (index!38094 lt!405734)) lt!405734))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52721 (_ BitVec 32)) SeekEntryResult!8930)

(assert (=> b!898771 (= lt!405734 (seekKeyOrZeroReturnVacant!0 (x!76598 lt!405735) (index!38093 lt!405735) (index!38093 lt!405735) key!785 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)))))

(declare-fun d!111173 () Bool)

(declare-fun lt!405733 () SeekEntryResult!8930)

(assert (=> d!111173 (and (or ((_ is MissingVacant!8930) lt!405733) (not ((_ is Found!8930) lt!405733)) (and (bvsge (index!38092 lt!405733) #b00000000000000000000000000000000) (bvslt (index!38092 lt!405733) (size!25795 (_keys!10195 thiss!1181))))) (not ((_ is MissingVacant!8930) lt!405733)) (or (not ((_ is Found!8930) lt!405733)) (= (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405733)) key!785)))))

(assert (=> d!111173 (= lt!405733 e!502825)))

(declare-fun c!94991 () Bool)

(assert (=> d!111173 (= c!94991 (and ((_ is Intermediate!8930) lt!405735) (undefined!9742 lt!405735)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52721 (_ BitVec 32)) SeekEntryResult!8930)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111173 (= lt!405735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26153 thiss!1181)) key!785 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)))))

(assert (=> d!111173 (validMask!0 (mask!26153 thiss!1181))))

(assert (=> d!111173 (= (seekEntry!0 key!785 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)) lt!405733)))

(assert (= (and d!111173 c!94991) b!898767))

(assert (= (and d!111173 (not c!94991)) b!898768))

(assert (= (and b!898768 c!94993) b!898769))

(assert (= (and b!898768 (not c!94993)) b!898770))

(assert (= (and b!898770 c!94992) b!898766))

(assert (= (and b!898770 (not c!94992)) b!898771))

(declare-fun m!834743 () Bool)

(assert (=> b!898768 m!834743))

(declare-fun m!834745 () Bool)

(assert (=> b!898771 m!834745))

(declare-fun m!834747 () Bool)

(assert (=> d!111173 m!834747))

(declare-fun m!834749 () Bool)

(assert (=> d!111173 m!834749))

(assert (=> d!111173 m!834749))

(declare-fun m!834751 () Bool)

(assert (=> d!111173 m!834751))

(assert (=> d!111173 m!834589))

(assert (=> b!898602 d!111173))

(declare-fun b!898778 () Bool)

(declare-fun e!502832 () Bool)

(assert (=> b!898778 (= e!502832 tp_is_empty!18349)))

(declare-fun condMapEmpty!29191 () Bool)

(declare-fun mapDefault!29191 () ValueCell!8693)

(assert (=> mapNonEmpty!29182 (= condMapEmpty!29191 (= mapRest!29182 ((as const (Array (_ BitVec 32) ValueCell!8693)) mapDefault!29191)))))

(declare-fun e!502831 () Bool)

(declare-fun mapRes!29191 () Bool)

(assert (=> mapNonEmpty!29182 (= tp!56137 (and e!502831 mapRes!29191))))

(declare-fun b!898779 () Bool)

(assert (=> b!898779 (= e!502831 tp_is_empty!18349)))

(declare-fun mapIsEmpty!29191 () Bool)

(assert (=> mapIsEmpty!29191 mapRes!29191))

(declare-fun mapNonEmpty!29191 () Bool)

(declare-fun tp!56152 () Bool)

(assert (=> mapNonEmpty!29191 (= mapRes!29191 (and tp!56152 e!502832))))

(declare-fun mapRest!29191 () (Array (_ BitVec 32) ValueCell!8693))

(declare-fun mapKey!29191 () (_ BitVec 32))

(declare-fun mapValue!29191 () ValueCell!8693)

(assert (=> mapNonEmpty!29191 (= mapRest!29182 (store mapRest!29191 mapKey!29191 mapValue!29191))))

(assert (= (and mapNonEmpty!29182 condMapEmpty!29191) mapIsEmpty!29191))

(assert (= (and mapNonEmpty!29182 (not condMapEmpty!29191)) mapNonEmpty!29191))

(assert (= (and mapNonEmpty!29191 ((_ is ValueCellFull!8693) mapValue!29191)) b!898778))

(assert (= (and mapNonEmpty!29182 ((_ is ValueCellFull!8693) mapDefault!29191)) b!898779))

(declare-fun m!834753 () Bool)

(assert (=> mapNonEmpty!29191 m!834753))

(declare-fun b_lambda!12959 () Bool)

(assert (= b_lambda!12957 (or (and b!898600 b_free!16021) b_lambda!12959)))

(check-sat (not d!111159) (not bm!39878) (not mapNonEmpty!29191) b_and!26301 (not b!898732) (not bm!39877) (not bm!39881) (not d!111173) (not d!111163) (not b!898749) (not b_lambda!12959) (not b!898748) (not d!111171) (not b!898719) (not b!898720) (not b!898667) (not b!898670) (not b!898665) (not b!898750) (not d!111153) (not b!898753) (not b_next!16021) (not b!898734) (not bm!39880) tp_is_empty!18349 (not b!898721) (not b!898728) (not d!111161) (not b!898729) (not d!111151) (not b!898738) (not b!898676) (not b!898771))
(check-sat b_and!26301 (not b_next!16021))
(get-model)

(declare-fun d!111175 () Bool)

(declare-fun get!13328 (Option!464) V!29431)

(assert (=> d!111175 (= (apply!407 lt!405706 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13328 (getValueByKey!458 (toList!5389 lt!405706) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25199 () Bool)

(assert (= bs!25199 d!111175))

(declare-fun m!834755 () Bool)

(assert (=> bs!25199 m!834755))

(assert (=> bs!25199 m!834755))

(declare-fun m!834757 () Bool)

(assert (=> bs!25199 m!834757))

(assert (=> b!898719 d!111175))

(declare-fun d!111177 () Bool)

(assert (=> d!111177 (contains!4386 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607)))))

(assert (=> d!111177 true))

(declare-fun _$16!181 () Unit!30488)

(assert (=> d!111177 (= (choose!1504 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (index!38092 lt!405607) (defaultEntry!5419 thiss!1181)) _$16!181)))

(declare-fun bs!25200 () Bool)

(assert (= bs!25200 d!111177))

(assert (=> bs!25200 m!834591))

(assert (=> bs!25200 m!834585))

(assert (=> bs!25200 m!834591))

(assert (=> bs!25200 m!834585))

(assert (=> bs!25200 m!834593))

(assert (=> d!111153 d!111177))

(assert (=> d!111153 d!111155))

(declare-fun d!111179 () Bool)

(declare-fun e!502833 () Bool)

(assert (=> d!111179 e!502833))

(declare-fun res!607308 () Bool)

(assert (=> d!111179 (=> res!607308 e!502833)))

(declare-fun lt!405740 () Bool)

(assert (=> d!111179 (= res!607308 (not lt!405740))))

(declare-fun lt!405738 () Bool)

(assert (=> d!111179 (= lt!405740 lt!405738)))

(declare-fun lt!405739 () Unit!30488)

(declare-fun e!502834 () Unit!30488)

(assert (=> d!111179 (= lt!405739 e!502834)))

(declare-fun c!94994 () Bool)

(assert (=> d!111179 (= c!94994 lt!405738)))

(assert (=> d!111179 (= lt!405738 (containsKey!426 (toList!5389 lt!405706) (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111179 (= (contains!4386 lt!405706 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)) lt!405740)))

(declare-fun b!898780 () Bool)

(declare-fun lt!405737 () Unit!30488)

(assert (=> b!898780 (= e!502834 lt!405737)))

(assert (=> b!898780 (= lt!405737 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5389 lt!405706) (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898780 (isDefined!334 (getValueByKey!458 (toList!5389 lt!405706) (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898781 () Bool)

(declare-fun Unit!30494 () Unit!30488)

(assert (=> b!898781 (= e!502834 Unit!30494)))

(declare-fun b!898782 () Bool)

(assert (=> b!898782 (= e!502833 (isDefined!334 (getValueByKey!458 (toList!5389 lt!405706) (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!111179 c!94994) b!898780))

(assert (= (and d!111179 (not c!94994)) b!898781))

(assert (= (and d!111179 (not res!607308)) b!898782))

(assert (=> d!111179 m!834669))

(declare-fun m!834759 () Bool)

(assert (=> d!111179 m!834759))

(assert (=> b!898780 m!834669))

(declare-fun m!834761 () Bool)

(assert (=> b!898780 m!834761))

(assert (=> b!898780 m!834669))

(declare-fun m!834763 () Bool)

(assert (=> b!898780 m!834763))

(assert (=> b!898780 m!834763))

(declare-fun m!834765 () Bool)

(assert (=> b!898780 m!834765))

(assert (=> b!898782 m!834669))

(assert (=> b!898782 m!834763))

(assert (=> b!898782 m!834763))

(assert (=> b!898782 m!834765))

(assert (=> b!898720 d!111179))

(assert (=> b!898670 d!111151))

(assert (=> b!898670 d!111159))

(declare-fun d!111181 () Bool)

(declare-fun e!502835 () Bool)

(assert (=> d!111181 e!502835))

(declare-fun res!607309 () Bool)

(assert (=> d!111181 (=> res!607309 e!502835)))

(declare-fun lt!405744 () Bool)

(assert (=> d!111181 (= res!607309 (not lt!405744))))

(declare-fun lt!405742 () Bool)

(assert (=> d!111181 (= lt!405744 lt!405742)))

(declare-fun lt!405743 () Unit!30488)

(declare-fun e!502836 () Unit!30488)

(assert (=> d!111181 (= lt!405743 e!502836)))

(declare-fun c!94995 () Bool)

(assert (=> d!111181 (= c!94995 lt!405742)))

(assert (=> d!111181 (= lt!405742 (containsKey!426 (toList!5389 lt!405706) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111181 (= (contains!4386 lt!405706 #b1000000000000000000000000000000000000000000000000000000000000000) lt!405744)))

(declare-fun b!898783 () Bool)

(declare-fun lt!405741 () Unit!30488)

(assert (=> b!898783 (= e!502836 lt!405741)))

(assert (=> b!898783 (= lt!405741 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5389 lt!405706) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898783 (isDefined!334 (getValueByKey!458 (toList!5389 lt!405706) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898784 () Bool)

(declare-fun Unit!30495 () Unit!30488)

(assert (=> b!898784 (= e!502836 Unit!30495)))

(declare-fun b!898785 () Bool)

(assert (=> b!898785 (= e!502835 (isDefined!334 (getValueByKey!458 (toList!5389 lt!405706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111181 c!94995) b!898783))

(assert (= (and d!111181 (not c!94995)) b!898784))

(assert (= (and d!111181 (not res!607309)) b!898785))

(declare-fun m!834767 () Bool)

(assert (=> d!111181 m!834767))

(declare-fun m!834769 () Bool)

(assert (=> b!898783 m!834769))

(declare-fun m!834771 () Bool)

(assert (=> b!898783 m!834771))

(assert (=> b!898783 m!834771))

(declare-fun m!834773 () Bool)

(assert (=> b!898783 m!834773))

(assert (=> b!898785 m!834771))

(assert (=> b!898785 m!834771))

(assert (=> b!898785 m!834773))

(assert (=> bm!39880 d!111181))

(declare-fun b!898804 () Bool)

(declare-fun lt!405749 () SeekEntryResult!8930)

(assert (=> b!898804 (and (bvsge (index!38093 lt!405749) #b00000000000000000000000000000000) (bvslt (index!38093 lt!405749) (size!25795 (_keys!10195 thiss!1181))))))

(declare-fun res!607317 () Bool)

(assert (=> b!898804 (= res!607317 (= (select (arr!25337 (_keys!10195 thiss!1181)) (index!38093 lt!405749)) key!785))))

(declare-fun e!502850 () Bool)

(assert (=> b!898804 (=> res!607317 e!502850)))

(declare-fun e!502848 () Bool)

(assert (=> b!898804 (= e!502848 e!502850)))

(declare-fun b!898805 () Bool)

(declare-fun e!502851 () Bool)

(assert (=> b!898805 (= e!502851 e!502848)))

(declare-fun res!607318 () Bool)

(assert (=> b!898805 (= res!607318 (and ((_ is Intermediate!8930) lt!405749) (not (undefined!9742 lt!405749)) (bvslt (x!76598 lt!405749) #b01111111111111111111111111111110) (bvsge (x!76598 lt!405749) #b00000000000000000000000000000000) (bvsge (x!76598 lt!405749) #b00000000000000000000000000000000)))))

(assert (=> b!898805 (=> (not res!607318) (not e!502848))))

(declare-fun b!898806 () Bool)

(declare-fun e!502847 () SeekEntryResult!8930)

(assert (=> b!898806 (= e!502847 (Intermediate!8930 false (toIndex!0 key!785 (mask!26153 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun d!111183 () Bool)

(assert (=> d!111183 e!502851))

(declare-fun c!95002 () Bool)

(assert (=> d!111183 (= c!95002 (and ((_ is Intermediate!8930) lt!405749) (undefined!9742 lt!405749)))))

(declare-fun e!502849 () SeekEntryResult!8930)

(assert (=> d!111183 (= lt!405749 e!502849)))

(declare-fun c!95003 () Bool)

(assert (=> d!111183 (= c!95003 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!405750 () (_ BitVec 64))

(assert (=> d!111183 (= lt!405750 (select (arr!25337 (_keys!10195 thiss!1181)) (toIndex!0 key!785 (mask!26153 thiss!1181))))))

(assert (=> d!111183 (validMask!0 (mask!26153 thiss!1181))))

(assert (=> d!111183 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26153 thiss!1181)) key!785 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)) lt!405749)))

(declare-fun b!898807 () Bool)

(assert (=> b!898807 (and (bvsge (index!38093 lt!405749) #b00000000000000000000000000000000) (bvslt (index!38093 lt!405749) (size!25795 (_keys!10195 thiss!1181))))))

(assert (=> b!898807 (= e!502850 (= (select (arr!25337 (_keys!10195 thiss!1181)) (index!38093 lt!405749)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898808 () Bool)

(assert (=> b!898808 (and (bvsge (index!38093 lt!405749) #b00000000000000000000000000000000) (bvslt (index!38093 lt!405749) (size!25795 (_keys!10195 thiss!1181))))))

(declare-fun res!607316 () Bool)

(assert (=> b!898808 (= res!607316 (= (select (arr!25337 (_keys!10195 thiss!1181)) (index!38093 lt!405749)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898808 (=> res!607316 e!502850)))

(declare-fun b!898809 () Bool)

(assert (=> b!898809 (= e!502851 (bvsge (x!76598 lt!405749) #b01111111111111111111111111111110))))

(declare-fun b!898810 () Bool)

(assert (=> b!898810 (= e!502849 e!502847)))

(declare-fun c!95004 () Bool)

(assert (=> b!898810 (= c!95004 (or (= lt!405750 key!785) (= (bvadd lt!405750 lt!405750) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!898811 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898811 (= e!502847 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26153 thiss!1181)) #b00000000000000000000000000000000 (mask!26153 thiss!1181)) key!785 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)))))

(declare-fun b!898812 () Bool)

(assert (=> b!898812 (= e!502849 (Intermediate!8930 true (toIndex!0 key!785 (mask!26153 thiss!1181)) #b00000000000000000000000000000000))))

(assert (= (and d!111183 c!95003) b!898812))

(assert (= (and d!111183 (not c!95003)) b!898810))

(assert (= (and b!898810 c!95004) b!898806))

(assert (= (and b!898810 (not c!95004)) b!898811))

(assert (= (and d!111183 c!95002) b!898809))

(assert (= (and d!111183 (not c!95002)) b!898805))

(assert (= (and b!898805 res!607318) b!898804))

(assert (= (and b!898804 (not res!607317)) b!898808))

(assert (= (and b!898808 (not res!607316)) b!898807))

(declare-fun m!834775 () Bool)

(assert (=> b!898804 m!834775))

(assert (=> b!898811 m!834749))

(declare-fun m!834777 () Bool)

(assert (=> b!898811 m!834777))

(assert (=> b!898811 m!834777))

(declare-fun m!834779 () Bool)

(assert (=> b!898811 m!834779))

(assert (=> d!111183 m!834749))

(declare-fun m!834781 () Bool)

(assert (=> d!111183 m!834781))

(assert (=> d!111183 m!834589))

(assert (=> b!898807 m!834775))

(assert (=> b!898808 m!834775))

(assert (=> d!111173 d!111183))

(declare-fun d!111185 () Bool)

(declare-fun lt!405756 () (_ BitVec 32))

(declare-fun lt!405755 () (_ BitVec 32))

(assert (=> d!111185 (= lt!405756 (bvmul (bvxor lt!405755 (bvlshr lt!405755 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111185 (= lt!405755 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111185 (and (bvsge (mask!26153 thiss!1181) #b00000000000000000000000000000000) (let ((res!607319 (let ((h!18994 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76615 (bvmul (bvxor h!18994 (bvlshr h!18994 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76615 (bvlshr x!76615 #b00000000000000000000000000001101)) (mask!26153 thiss!1181)))))) (and (bvslt res!607319 (bvadd (mask!26153 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!607319 #b00000000000000000000000000000000))))))

(assert (=> d!111185 (= (toIndex!0 key!785 (mask!26153 thiss!1181)) (bvand (bvxor lt!405756 (bvlshr lt!405756 #b00000000000000000000000000001101)) (mask!26153 thiss!1181)))))

(assert (=> d!111173 d!111185))

(assert (=> d!111173 d!111155))

(declare-fun d!111187 () Bool)

(assert (=> d!111187 (= (apply!407 lt!405706 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13328 (getValueByKey!458 (toList!5389 lt!405706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25201 () Bool)

(assert (= bs!25201 d!111187))

(assert (=> bs!25201 m!834771))

(assert (=> bs!25201 m!834771))

(declare-fun m!834783 () Bool)

(assert (=> bs!25201 m!834783))

(assert (=> b!898721 d!111187))

(declare-fun d!111189 () Bool)

(assert (=> d!111189 (= (validKeyInArray!0 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898738 d!111189))

(declare-fun d!111191 () Bool)

(declare-fun e!502852 () Bool)

(assert (=> d!111191 e!502852))

(declare-fun res!607320 () Bool)

(assert (=> d!111191 (=> res!607320 e!502852)))

(declare-fun lt!405760 () Bool)

(assert (=> d!111191 (= res!607320 (not lt!405760))))

(declare-fun lt!405758 () Bool)

(assert (=> d!111191 (= lt!405760 lt!405758)))

(declare-fun lt!405759 () Unit!30488)

(declare-fun e!502853 () Unit!30488)

(assert (=> d!111191 (= lt!405759 e!502853)))

(declare-fun c!95005 () Bool)

(assert (=> d!111191 (= c!95005 lt!405758)))

(assert (=> d!111191 (= lt!405758 (containsKey!426 (toList!5389 lt!405706) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111191 (= (contains!4386 lt!405706 #b0000000000000000000000000000000000000000000000000000000000000000) lt!405760)))

(declare-fun b!898813 () Bool)

(declare-fun lt!405757 () Unit!30488)

(assert (=> b!898813 (= e!502853 lt!405757)))

(assert (=> b!898813 (= lt!405757 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5389 lt!405706) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898813 (isDefined!334 (getValueByKey!458 (toList!5389 lt!405706) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898814 () Bool)

(declare-fun Unit!30496 () Unit!30488)

(assert (=> b!898814 (= e!502853 Unit!30496)))

(declare-fun b!898815 () Bool)

(assert (=> b!898815 (= e!502852 (isDefined!334 (getValueByKey!458 (toList!5389 lt!405706) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111191 c!95005) b!898813))

(assert (= (and d!111191 (not c!95005)) b!898814))

(assert (= (and d!111191 (not res!607320)) b!898815))

(declare-fun m!834785 () Bool)

(assert (=> d!111191 m!834785))

(declare-fun m!834787 () Bool)

(assert (=> b!898813 m!834787))

(assert (=> b!898813 m!834755))

(assert (=> b!898813 m!834755))

(declare-fun m!834789 () Bool)

(assert (=> b!898813 m!834789))

(assert (=> b!898815 m!834755))

(assert (=> b!898815 m!834755))

(assert (=> b!898815 m!834789))

(assert (=> bm!39881 d!111191))

(declare-fun d!111193 () Bool)

(declare-fun res!607329 () Bool)

(declare-fun e!502856 () Bool)

(assert (=> d!111193 (=> (not res!607329) (not e!502856))))

(assert (=> d!111193 (= res!607329 (validMask!0 (mask!26153 thiss!1181)))))

(assert (=> d!111193 (= (simpleValid!325 thiss!1181) e!502856)))

(declare-fun b!898826 () Bool)

(declare-fun res!607330 () Bool)

(assert (=> b!898826 (=> (not res!607330) (not e!502856))))

(declare-fun size!25801 (LongMapFixedSize!4402) (_ BitVec 32))

(assert (=> b!898826 (= res!607330 (= (size!25801 thiss!1181) (bvadd (_size!2256 thiss!1181) (bvsdiv (bvadd (extraKeys!5137 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!898824 () Bool)

(declare-fun res!607331 () Bool)

(assert (=> b!898824 (=> (not res!607331) (not e!502856))))

(assert (=> b!898824 (= res!607331 (and (= (size!25796 (_values!5428 thiss!1181)) (bvadd (mask!26153 thiss!1181) #b00000000000000000000000000000001)) (= (size!25795 (_keys!10195 thiss!1181)) (size!25796 (_values!5428 thiss!1181))) (bvsge (_size!2256 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2256 thiss!1181) (bvadd (mask!26153 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!898827 () Bool)

(assert (=> b!898827 (= e!502856 (and (bvsge (extraKeys!5137 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5137 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2256 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!898825 () Bool)

(declare-fun res!607332 () Bool)

(assert (=> b!898825 (=> (not res!607332) (not e!502856))))

(assert (=> b!898825 (= res!607332 (bvsge (size!25801 thiss!1181) (_size!2256 thiss!1181)))))

(assert (= (and d!111193 res!607329) b!898824))

(assert (= (and b!898824 res!607331) b!898825))

(assert (= (and b!898825 res!607332) b!898826))

(assert (= (and b!898826 res!607330) b!898827))

(assert (=> d!111193 m!834589))

(declare-fun m!834791 () Bool)

(assert (=> b!898826 m!834791))

(assert (=> b!898825 m!834791))

(assert (=> d!111163 d!111193))

(declare-fun b!898836 () Bool)

(declare-fun e!502862 () (_ BitVec 32))

(assert (=> b!898836 (= e!502862 #b00000000000000000000000000000000)))

(declare-fun b!898837 () Bool)

(declare-fun e!502861 () (_ BitVec 32))

(assert (=> b!898837 (= e!502862 e!502861)))

(declare-fun c!95011 () Bool)

(assert (=> b!898837 (= c!95011 (validKeyInArray!0 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39884 () Bool)

(declare-fun call!39887 () (_ BitVec 32))

(assert (=> bm!39884 (= call!39887 (arrayCountValidKeys!0 (_keys!10195 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25795 (_keys!10195 thiss!1181))))))

(declare-fun b!898838 () Bool)

(assert (=> b!898838 (= e!502861 call!39887)))

(declare-fun b!898839 () Bool)

(assert (=> b!898839 (= e!502861 (bvadd #b00000000000000000000000000000001 call!39887))))

(declare-fun d!111195 () Bool)

(declare-fun lt!405763 () (_ BitVec 32))

(assert (=> d!111195 (and (bvsge lt!405763 #b00000000000000000000000000000000) (bvsle lt!405763 (bvsub (size!25795 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111195 (= lt!405763 e!502862)))

(declare-fun c!95010 () Bool)

(assert (=> d!111195 (= c!95010 (bvsge #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(assert (=> d!111195 (and (bvsle #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25795 (_keys!10195 thiss!1181)) (size!25795 (_keys!10195 thiss!1181))))))

(assert (=> d!111195 (= (arrayCountValidKeys!0 (_keys!10195 thiss!1181) #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))) lt!405763)))

(assert (= (and d!111195 c!95010) b!898836))

(assert (= (and d!111195 (not c!95010)) b!898837))

(assert (= (and b!898837 c!95011) b!898839))

(assert (= (and b!898837 (not c!95011)) b!898838))

(assert (= (or b!898839 b!898838) bm!39884))

(assert (=> b!898837 m!834669))

(assert (=> b!898837 m!834669))

(assert (=> b!898837 m!834723))

(declare-fun m!834793 () Bool)

(assert (=> bm!39884 m!834793))

(assert (=> b!898748 d!111195))

(declare-fun b!898848 () Bool)

(declare-fun e!502870 () Bool)

(declare-fun call!39890 () Bool)

(assert (=> b!898848 (= e!502870 call!39890)))

(declare-fun bm!39887 () Bool)

(assert (=> bm!39887 (= call!39890 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10195 thiss!1181) (mask!26153 thiss!1181)))))

(declare-fun d!111197 () Bool)

(declare-fun res!607337 () Bool)

(declare-fun e!502869 () Bool)

(assert (=> d!111197 (=> res!607337 e!502869)))

(assert (=> d!111197 (= res!607337 (bvsge #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(assert (=> d!111197 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)) e!502869)))

(declare-fun b!898849 () Bool)

(declare-fun e!502871 () Bool)

(assert (=> b!898849 (= e!502869 e!502871)))

(declare-fun c!95014 () Bool)

(assert (=> b!898849 (= c!95014 (validKeyInArray!0 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898850 () Bool)

(assert (=> b!898850 (= e!502871 call!39890)))

(declare-fun b!898851 () Bool)

(assert (=> b!898851 (= e!502871 e!502870)))

(declare-fun lt!405771 () (_ BitVec 64))

(assert (=> b!898851 (= lt!405771 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405770 () Unit!30488)

(assert (=> b!898851 (= lt!405770 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10195 thiss!1181) lt!405771 #b00000000000000000000000000000000))))

(assert (=> b!898851 (arrayContainsKey!0 (_keys!10195 thiss!1181) lt!405771 #b00000000000000000000000000000000)))

(declare-fun lt!405772 () Unit!30488)

(assert (=> b!898851 (= lt!405772 lt!405770)))

(declare-fun res!607338 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52721 (_ BitVec 32)) SeekEntryResult!8930)

(assert (=> b!898851 (= res!607338 (= (seekEntryOrOpen!0 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000) (_keys!10195 thiss!1181) (mask!26153 thiss!1181)) (Found!8930 #b00000000000000000000000000000000)))))

(assert (=> b!898851 (=> (not res!607338) (not e!502870))))

(assert (= (and d!111197 (not res!607337)) b!898849))

(assert (= (and b!898849 c!95014) b!898851))

(assert (= (and b!898849 (not c!95014)) b!898850))

(assert (= (and b!898851 res!607338) b!898848))

(assert (= (or b!898848 b!898850) bm!39887))

(declare-fun m!834795 () Bool)

(assert (=> bm!39887 m!834795))

(assert (=> b!898849 m!834669))

(assert (=> b!898849 m!834669))

(assert (=> b!898849 m!834723))

(assert (=> b!898851 m!834669))

(declare-fun m!834797 () Bool)

(assert (=> b!898851 m!834797))

(declare-fun m!834799 () Bool)

(assert (=> b!898851 m!834799))

(assert (=> b!898851 m!834669))

(declare-fun m!834801 () Bool)

(assert (=> b!898851 m!834801))

(assert (=> b!898749 d!111197))

(declare-fun bm!39890 () Bool)

(declare-fun call!39893 () Bool)

(declare-fun c!95017 () Bool)

(assert (=> bm!39890 (= call!39893 (arrayNoDuplicates!0 (_keys!10195 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95017 (Cons!17850 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000) Nil!17851) Nil!17851)))))

(declare-fun b!898862 () Bool)

(declare-fun e!502880 () Bool)

(declare-fun e!502881 () Bool)

(assert (=> b!898862 (= e!502880 e!502881)))

(declare-fun res!607346 () Bool)

(assert (=> b!898862 (=> (not res!607346) (not e!502881))))

(declare-fun e!502883 () Bool)

(assert (=> b!898862 (= res!607346 (not e!502883))))

(declare-fun res!607345 () Bool)

(assert (=> b!898862 (=> (not res!607345) (not e!502883))))

(assert (=> b!898862 (= res!607345 (validKeyInArray!0 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898863 () Bool)

(declare-fun e!502882 () Bool)

(assert (=> b!898863 (= e!502881 e!502882)))

(assert (=> b!898863 (= c!95017 (validKeyInArray!0 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898864 () Bool)

(assert (=> b!898864 (= e!502882 call!39893)))

(declare-fun d!111199 () Bool)

(declare-fun res!607347 () Bool)

(assert (=> d!111199 (=> res!607347 e!502880)))

(assert (=> d!111199 (= res!607347 (bvsge #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(assert (=> d!111199 (= (arrayNoDuplicates!0 (_keys!10195 thiss!1181) #b00000000000000000000000000000000 Nil!17851) e!502880)))

(declare-fun b!898865 () Bool)

(assert (=> b!898865 (= e!502882 call!39893)))

(declare-fun b!898866 () Bool)

(declare-fun contains!4388 (List!17854 (_ BitVec 64)) Bool)

(assert (=> b!898866 (= e!502883 (contains!4388 Nil!17851 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111199 (not res!607347)) b!898862))

(assert (= (and b!898862 res!607345) b!898866))

(assert (= (and b!898862 res!607346) b!898863))

(assert (= (and b!898863 c!95017) b!898865))

(assert (= (and b!898863 (not c!95017)) b!898864))

(assert (= (or b!898865 b!898864) bm!39890))

(assert (=> bm!39890 m!834669))

(declare-fun m!834803 () Bool)

(assert (=> bm!39890 m!834803))

(assert (=> b!898862 m!834669))

(assert (=> b!898862 m!834669))

(assert (=> b!898862 m!834723))

(assert (=> b!898863 m!834669))

(assert (=> b!898863 m!834669))

(assert (=> b!898863 m!834723))

(assert (=> b!898866 m!834669))

(assert (=> b!898866 m!834669))

(declare-fun m!834805 () Bool)

(assert (=> b!898866 m!834805))

(assert (=> b!898750 d!111199))

(declare-fun d!111201 () Bool)

(assert (=> d!111201 (isDefined!334 (getValueByKey!458 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))))))

(declare-fun lt!405775 () Unit!30488)

(declare-fun choose!1506 (List!17852 (_ BitVec 64)) Unit!30488)

(assert (=> d!111201 (= lt!405775 (choose!1506 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))))))

(declare-fun e!502886 () Bool)

(assert (=> d!111201 e!502886))

(declare-fun res!607350 () Bool)

(assert (=> d!111201 (=> (not res!607350) (not e!502886))))

(declare-fun isStrictlySorted!494 (List!17852) Bool)

(assert (=> d!111201 (= res!607350 (isStrictlySorted!494 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))))

(assert (=> d!111201 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))) lt!405775)))

(declare-fun b!898869 () Bool)

(assert (=> b!898869 (= e!502886 (containsKey!426 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))))))

(assert (= (and d!111201 res!607350) b!898869))

(assert (=> d!111201 m!834585))

(assert (=> d!111201 m!834663))

(assert (=> d!111201 m!834663))

(assert (=> d!111201 m!834665))

(assert (=> d!111201 m!834585))

(declare-fun m!834807 () Bool)

(assert (=> d!111201 m!834807))

(declare-fun m!834809 () Bool)

(assert (=> d!111201 m!834809))

(assert (=> b!898869 m!834585))

(assert (=> b!898869 m!834659))

(assert (=> b!898665 d!111201))

(declare-fun d!111203 () Bool)

(declare-fun isEmpty!691 (Option!464) Bool)

(assert (=> d!111203 (= (isDefined!334 (getValueByKey!458 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607)))) (not (isEmpty!691 (getValueByKey!458 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))))))))

(declare-fun bs!25202 () Bool)

(assert (= bs!25202 d!111203))

(assert (=> bs!25202 m!834663))

(declare-fun m!834811 () Bool)

(assert (=> bs!25202 m!834811))

(assert (=> b!898665 d!111203))

(declare-fun b!898881 () Bool)

(declare-fun e!502892 () Option!464)

(assert (=> b!898881 (= e!502892 None!462)))

(declare-fun b!898880 () Bool)

(assert (=> b!898880 (= e!502892 (getValueByKey!458 (t!25186 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))))))

(declare-fun b!898878 () Bool)

(declare-fun e!502891 () Option!464)

(assert (=> b!898878 (= e!502891 (Some!463 (_2!6041 (h!18991 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))))))

(declare-fun b!898879 () Bool)

(assert (=> b!898879 (= e!502891 e!502892)))

(declare-fun c!95023 () Bool)

(assert (=> b!898879 (= c!95023 (and ((_ is Cons!17848) (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (not (= (_1!6041 (h!18991 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))))))))

(declare-fun d!111205 () Bool)

(declare-fun c!95022 () Bool)

(assert (=> d!111205 (= c!95022 (and ((_ is Cons!17848) (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (= (_1!6041 (h!18991 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607)))))))

(assert (=> d!111205 (= (getValueByKey!458 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))) e!502891)))

(assert (= (and d!111205 c!95022) b!898878))

(assert (= (and d!111205 (not c!95022)) b!898879))

(assert (= (and b!898879 c!95023) b!898880))

(assert (= (and b!898879 (not c!95023)) b!898881))

(assert (=> b!898880 m!834585))

(declare-fun m!834813 () Bool)

(assert (=> b!898880 m!834813))

(assert (=> b!898665 d!111205))

(declare-fun d!111207 () Bool)

(assert (=> d!111207 (= (apply!407 lt!405706 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)) (get!13328 (getValueByKey!458 (toList!5389 lt!405706) (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25203 () Bool)

(assert (= bs!25203 d!111207))

(assert (=> bs!25203 m!834669))

(assert (=> bs!25203 m!834763))

(assert (=> bs!25203 m!834763))

(declare-fun m!834815 () Bool)

(assert (=> bs!25203 m!834815))

(assert (=> b!898728 d!111207))

(declare-fun d!111209 () Bool)

(declare-fun c!95026 () Bool)

(assert (=> d!111209 (= c!95026 ((_ is ValueCellFull!8693) (select (arr!25338 (_values!5428 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!502895 () V!29431)

(assert (=> d!111209 (= (get!13327 (select (arr!25338 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1301 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!502895)))

(declare-fun b!898886 () Bool)

(declare-fun get!13329 (ValueCell!8693 V!29431) V!29431)

(assert (=> b!898886 (= e!502895 (get!13329 (select (arr!25338 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1301 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!898887 () Bool)

(declare-fun get!13330 (ValueCell!8693 V!29431) V!29431)

(assert (=> b!898887 (= e!502895 (get!13330 (select (arr!25338 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1301 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111209 c!95026) b!898886))

(assert (= (and d!111209 (not c!95026)) b!898887))

(assert (=> b!898886 m!834713))

(assert (=> b!898886 m!834715))

(declare-fun m!834817 () Bool)

(assert (=> b!898886 m!834817))

(assert (=> b!898887 m!834713))

(assert (=> b!898887 m!834715))

(declare-fun m!834819 () Bool)

(assert (=> b!898887 m!834819))

(assert (=> b!898728 d!111209))

(declare-fun d!111211 () Bool)

(assert (=> d!111211 (= (apply!407 lt!405698 lt!405708) (get!13328 (getValueByKey!458 (toList!5389 lt!405698) lt!405708)))))

(declare-fun bs!25204 () Bool)

(assert (= bs!25204 d!111211))

(declare-fun m!834821 () Bool)

(assert (=> bs!25204 m!834821))

(assert (=> bs!25204 m!834821))

(declare-fun m!834823 () Bool)

(assert (=> bs!25204 m!834823))

(assert (=> b!898729 d!111211))

(declare-fun d!111213 () Bool)

(declare-fun e!502896 () Bool)

(assert (=> d!111213 e!502896))

(declare-fun res!607351 () Bool)

(assert (=> d!111213 (=> res!607351 e!502896)))

(declare-fun lt!405779 () Bool)

(assert (=> d!111213 (= res!607351 (not lt!405779))))

(declare-fun lt!405777 () Bool)

(assert (=> d!111213 (= lt!405779 lt!405777)))

(declare-fun lt!405778 () Unit!30488)

(declare-fun e!502897 () Unit!30488)

(assert (=> d!111213 (= lt!405778 e!502897)))

(declare-fun c!95027 () Bool)

(assert (=> d!111213 (= c!95027 lt!405777)))

(assert (=> d!111213 (= lt!405777 (containsKey!426 (toList!5389 (+!2618 lt!405714 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181)))) lt!405707))))

(assert (=> d!111213 (= (contains!4386 (+!2618 lt!405714 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181))) lt!405707) lt!405779)))

(declare-fun b!898888 () Bool)

(declare-fun lt!405776 () Unit!30488)

(assert (=> b!898888 (= e!502897 lt!405776)))

(assert (=> b!898888 (= lt!405776 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5389 (+!2618 lt!405714 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181)))) lt!405707))))

(assert (=> b!898888 (isDefined!334 (getValueByKey!458 (toList!5389 (+!2618 lt!405714 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181)))) lt!405707))))

(declare-fun b!898889 () Bool)

(declare-fun Unit!30497 () Unit!30488)

(assert (=> b!898889 (= e!502897 Unit!30497)))

(declare-fun b!898890 () Bool)

(assert (=> b!898890 (= e!502896 (isDefined!334 (getValueByKey!458 (toList!5389 (+!2618 lt!405714 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181)))) lt!405707)))))

(assert (= (and d!111213 c!95027) b!898888))

(assert (= (and d!111213 (not c!95027)) b!898889))

(assert (= (and d!111213 (not res!607351)) b!898890))

(declare-fun m!834825 () Bool)

(assert (=> d!111213 m!834825))

(declare-fun m!834827 () Bool)

(assert (=> b!898888 m!834827))

(declare-fun m!834829 () Bool)

(assert (=> b!898888 m!834829))

(assert (=> b!898888 m!834829))

(declare-fun m!834831 () Bool)

(assert (=> b!898888 m!834831))

(assert (=> b!898890 m!834829))

(assert (=> b!898890 m!834829))

(assert (=> b!898890 m!834831))

(assert (=> b!898729 d!111213))

(declare-fun d!111215 () Bool)

(assert (=> d!111215 (= (apply!407 (+!2618 lt!405700 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181))) lt!405705) (get!13328 (getValueByKey!458 (toList!5389 (+!2618 lt!405700 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181)))) lt!405705)))))

(declare-fun bs!25205 () Bool)

(assert (= bs!25205 d!111215))

(declare-fun m!834833 () Bool)

(assert (=> bs!25205 m!834833))

(assert (=> bs!25205 m!834833))

(declare-fun m!834835 () Bool)

(assert (=> bs!25205 m!834835))

(assert (=> b!898729 d!111215))

(declare-fun d!111217 () Bool)

(assert (=> d!111217 (= (apply!407 (+!2618 lt!405698 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181))) lt!405708) (get!13328 (getValueByKey!458 (toList!5389 (+!2618 lt!405698 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181)))) lt!405708)))))

(declare-fun bs!25206 () Bool)

(assert (= bs!25206 d!111217))

(declare-fun m!834837 () Bool)

(assert (=> bs!25206 m!834837))

(assert (=> bs!25206 m!834837))

(declare-fun m!834839 () Bool)

(assert (=> bs!25206 m!834839))

(assert (=> b!898729 d!111217))

(declare-fun d!111219 () Bool)

(assert (=> d!111219 (= (apply!407 (+!2618 lt!405695 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181))) lt!405711) (get!13328 (getValueByKey!458 (toList!5389 (+!2618 lt!405695 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181)))) lt!405711)))))

(declare-fun bs!25207 () Bool)

(assert (= bs!25207 d!111219))

(declare-fun m!834841 () Bool)

(assert (=> bs!25207 m!834841))

(assert (=> bs!25207 m!834841))

(declare-fun m!834843 () Bool)

(assert (=> bs!25207 m!834843))

(assert (=> b!898729 d!111219))

(declare-fun d!111221 () Bool)

(assert (=> d!111221 (= (apply!407 lt!405695 lt!405711) (get!13328 (getValueByKey!458 (toList!5389 lt!405695) lt!405711)))))

(declare-fun bs!25208 () Bool)

(assert (= bs!25208 d!111221))

(declare-fun m!834845 () Bool)

(assert (=> bs!25208 m!834845))

(assert (=> bs!25208 m!834845))

(declare-fun m!834847 () Bool)

(assert (=> bs!25208 m!834847))

(assert (=> b!898729 d!111221))

(declare-fun d!111223 () Bool)

(assert (=> d!111223 (= (apply!407 (+!2618 lt!405695 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181))) lt!405711) (apply!407 lt!405695 lt!405711))))

(declare-fun lt!405782 () Unit!30488)

(declare-fun choose!1507 (ListLongMap!10747 (_ BitVec 64) V!29431 (_ BitVec 64)) Unit!30488)

(assert (=> d!111223 (= lt!405782 (choose!1507 lt!405695 lt!405696 (zeroValue!5241 thiss!1181) lt!405711))))

(declare-fun e!502900 () Bool)

(assert (=> d!111223 e!502900))

(declare-fun res!607354 () Bool)

(assert (=> d!111223 (=> (not res!607354) (not e!502900))))

(assert (=> d!111223 (= res!607354 (contains!4386 lt!405695 lt!405711))))

(assert (=> d!111223 (= (addApplyDifferent!333 lt!405695 lt!405696 (zeroValue!5241 thiss!1181) lt!405711) lt!405782)))

(declare-fun b!898894 () Bool)

(assert (=> b!898894 (= e!502900 (not (= lt!405711 lt!405696)))))

(assert (= (and d!111223 res!607354) b!898894))

(declare-fun m!834849 () Bool)

(assert (=> d!111223 m!834849))

(declare-fun m!834851 () Bool)

(assert (=> d!111223 m!834851))

(assert (=> d!111223 m!834687))

(assert (=> d!111223 m!834689))

(assert (=> d!111223 m!834687))

(assert (=> d!111223 m!834691))

(assert (=> b!898729 d!111223))

(declare-fun d!111225 () Bool)

(declare-fun e!502903 () Bool)

(assert (=> d!111225 e!502903))

(declare-fun res!607359 () Bool)

(assert (=> d!111225 (=> (not res!607359) (not e!502903))))

(declare-fun lt!405794 () ListLongMap!10747)

(assert (=> d!111225 (= res!607359 (contains!4386 lt!405794 (_1!6041 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181)))))))

(declare-fun lt!405793 () List!17852)

(assert (=> d!111225 (= lt!405794 (ListLongMap!10748 lt!405793))))

(declare-fun lt!405791 () Unit!30488)

(declare-fun lt!405792 () Unit!30488)

(assert (=> d!111225 (= lt!405791 lt!405792)))

(assert (=> d!111225 (= (getValueByKey!458 lt!405793 (_1!6041 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181)))) (Some!463 (_2!6041 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!250 (List!17852 (_ BitVec 64) V!29431) Unit!30488)

(assert (=> d!111225 (= lt!405792 (lemmaContainsTupThenGetReturnValue!250 lt!405793 (_1!6041 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181))) (_2!6041 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181)))))))

(declare-fun insertStrictlySorted!307 (List!17852 (_ BitVec 64) V!29431) List!17852)

(assert (=> d!111225 (= lt!405793 (insertStrictlySorted!307 (toList!5389 lt!405700) (_1!6041 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181))) (_2!6041 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181)))))))

(assert (=> d!111225 (= (+!2618 lt!405700 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181))) lt!405794)))

(declare-fun b!898899 () Bool)

(declare-fun res!607360 () Bool)

(assert (=> b!898899 (=> (not res!607360) (not e!502903))))

(assert (=> b!898899 (= res!607360 (= (getValueByKey!458 (toList!5389 lt!405794) (_1!6041 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181)))) (Some!463 (_2!6041 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181))))))))

(declare-fun b!898900 () Bool)

(declare-fun contains!4389 (List!17852 tuple2!12060) Bool)

(assert (=> b!898900 (= e!502903 (contains!4389 (toList!5389 lt!405794) (tuple2!12061 lt!405712 (minValue!5241 thiss!1181))))))

(assert (= (and d!111225 res!607359) b!898899))

(assert (= (and b!898899 res!607360) b!898900))

(declare-fun m!834853 () Bool)

(assert (=> d!111225 m!834853))

(declare-fun m!834855 () Bool)

(assert (=> d!111225 m!834855))

(declare-fun m!834857 () Bool)

(assert (=> d!111225 m!834857))

(declare-fun m!834859 () Bool)

(assert (=> d!111225 m!834859))

(declare-fun m!834861 () Bool)

(assert (=> b!898899 m!834861))

(declare-fun m!834863 () Bool)

(assert (=> b!898900 m!834863))

(assert (=> b!898729 d!111225))

(declare-fun d!111227 () Bool)

(assert (=> d!111227 (= (apply!407 lt!405700 lt!405705) (get!13328 (getValueByKey!458 (toList!5389 lt!405700) lt!405705)))))

(declare-fun bs!25209 () Bool)

(assert (= bs!25209 d!111227))

(declare-fun m!834865 () Bool)

(assert (=> bs!25209 m!834865))

(assert (=> bs!25209 m!834865))

(declare-fun m!834867 () Bool)

(assert (=> bs!25209 m!834867))

(assert (=> b!898729 d!111227))

(declare-fun d!111229 () Bool)

(declare-fun e!502904 () Bool)

(assert (=> d!111229 e!502904))

(declare-fun res!607361 () Bool)

(assert (=> d!111229 (=> (not res!607361) (not e!502904))))

(declare-fun lt!405798 () ListLongMap!10747)

(assert (=> d!111229 (= res!607361 (contains!4386 lt!405798 (_1!6041 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181)))))))

(declare-fun lt!405797 () List!17852)

(assert (=> d!111229 (= lt!405798 (ListLongMap!10748 lt!405797))))

(declare-fun lt!405795 () Unit!30488)

(declare-fun lt!405796 () Unit!30488)

(assert (=> d!111229 (= lt!405795 lt!405796)))

(assert (=> d!111229 (= (getValueByKey!458 lt!405797 (_1!6041 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181)))) (Some!463 (_2!6041 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181)))))))

(assert (=> d!111229 (= lt!405796 (lemmaContainsTupThenGetReturnValue!250 lt!405797 (_1!6041 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181))) (_2!6041 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181)))))))

(assert (=> d!111229 (= lt!405797 (insertStrictlySorted!307 (toList!5389 lt!405698) (_1!6041 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181))) (_2!6041 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181)))))))

(assert (=> d!111229 (= (+!2618 lt!405698 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181))) lt!405798)))

(declare-fun b!898901 () Bool)

(declare-fun res!607362 () Bool)

(assert (=> b!898901 (=> (not res!607362) (not e!502904))))

(assert (=> b!898901 (= res!607362 (= (getValueByKey!458 (toList!5389 lt!405798) (_1!6041 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181)))) (Some!463 (_2!6041 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181))))))))

(declare-fun b!898902 () Bool)

(assert (=> b!898902 (= e!502904 (contains!4389 (toList!5389 lt!405798) (tuple2!12061 lt!405715 (minValue!5241 thiss!1181))))))

(assert (= (and d!111229 res!607361) b!898901))

(assert (= (and b!898901 res!607362) b!898902))

(declare-fun m!834869 () Bool)

(assert (=> d!111229 m!834869))

(declare-fun m!834871 () Bool)

(assert (=> d!111229 m!834871))

(declare-fun m!834873 () Bool)

(assert (=> d!111229 m!834873))

(declare-fun m!834875 () Bool)

(assert (=> d!111229 m!834875))

(declare-fun m!834877 () Bool)

(assert (=> b!898901 m!834877))

(declare-fun m!834879 () Bool)

(assert (=> b!898902 m!834879))

(assert (=> b!898729 d!111229))

(declare-fun d!111231 () Bool)

(assert (=> d!111231 (= (apply!407 (+!2618 lt!405700 (tuple2!12061 lt!405712 (minValue!5241 thiss!1181))) lt!405705) (apply!407 lt!405700 lt!405705))))

(declare-fun lt!405799 () Unit!30488)

(assert (=> d!111231 (= lt!405799 (choose!1507 lt!405700 lt!405712 (minValue!5241 thiss!1181) lt!405705))))

(declare-fun e!502905 () Bool)

(assert (=> d!111231 e!502905))

(declare-fun res!607363 () Bool)

(assert (=> d!111231 (=> (not res!607363) (not e!502905))))

(assert (=> d!111231 (= res!607363 (contains!4386 lt!405700 lt!405705))))

(assert (=> d!111231 (= (addApplyDifferent!333 lt!405700 lt!405712 (minValue!5241 thiss!1181) lt!405705) lt!405799)))

(declare-fun b!898903 () Bool)

(assert (=> b!898903 (= e!502905 (not (= lt!405705 lt!405712)))))

(assert (= (and d!111231 res!607363) b!898903))

(declare-fun m!834881 () Bool)

(assert (=> d!111231 m!834881))

(declare-fun m!834883 () Bool)

(assert (=> d!111231 m!834883))

(assert (=> d!111231 m!834677))

(assert (=> d!111231 m!834697))

(assert (=> d!111231 m!834677))

(assert (=> d!111231 m!834703))

(assert (=> b!898729 d!111231))

(declare-fun d!111233 () Bool)

(declare-fun e!502906 () Bool)

(assert (=> d!111233 e!502906))

(declare-fun res!607364 () Bool)

(assert (=> d!111233 (=> (not res!607364) (not e!502906))))

(declare-fun lt!405803 () ListLongMap!10747)

(assert (=> d!111233 (= res!607364 (contains!4386 lt!405803 (_1!6041 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181)))))))

(declare-fun lt!405802 () List!17852)

(assert (=> d!111233 (= lt!405803 (ListLongMap!10748 lt!405802))))

(declare-fun lt!405800 () Unit!30488)

(declare-fun lt!405801 () Unit!30488)

(assert (=> d!111233 (= lt!405800 lt!405801)))

(assert (=> d!111233 (= (getValueByKey!458 lt!405802 (_1!6041 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181)))) (Some!463 (_2!6041 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111233 (= lt!405801 (lemmaContainsTupThenGetReturnValue!250 lt!405802 (_1!6041 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181))) (_2!6041 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111233 (= lt!405802 (insertStrictlySorted!307 (toList!5389 lt!405714) (_1!6041 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181))) (_2!6041 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111233 (= (+!2618 lt!405714 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181))) lt!405803)))

(declare-fun b!898904 () Bool)

(declare-fun res!607365 () Bool)

(assert (=> b!898904 (=> (not res!607365) (not e!502906))))

(assert (=> b!898904 (= res!607365 (= (getValueByKey!458 (toList!5389 lt!405803) (_1!6041 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181)))) (Some!463 (_2!6041 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181))))))))

(declare-fun b!898905 () Bool)

(assert (=> b!898905 (= e!502906 (contains!4389 (toList!5389 lt!405803) (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181))))))

(assert (= (and d!111233 res!607364) b!898904))

(assert (= (and b!898904 res!607365) b!898905))

(declare-fun m!834885 () Bool)

(assert (=> d!111233 m!834885))

(declare-fun m!834887 () Bool)

(assert (=> d!111233 m!834887))

(declare-fun m!834889 () Bool)

(assert (=> d!111233 m!834889))

(declare-fun m!834891 () Bool)

(assert (=> d!111233 m!834891))

(declare-fun m!834893 () Bool)

(assert (=> b!898904 m!834893))

(declare-fun m!834895 () Bool)

(assert (=> b!898905 m!834895))

(assert (=> b!898729 d!111233))

(declare-fun d!111235 () Bool)

(declare-fun e!502907 () Bool)

(assert (=> d!111235 e!502907))

(declare-fun res!607366 () Bool)

(assert (=> d!111235 (=> (not res!607366) (not e!502907))))

(declare-fun lt!405807 () ListLongMap!10747)

(assert (=> d!111235 (= res!607366 (contains!4386 lt!405807 (_1!6041 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181)))))))

(declare-fun lt!405806 () List!17852)

(assert (=> d!111235 (= lt!405807 (ListLongMap!10748 lt!405806))))

(declare-fun lt!405804 () Unit!30488)

(declare-fun lt!405805 () Unit!30488)

(assert (=> d!111235 (= lt!405804 lt!405805)))

(assert (=> d!111235 (= (getValueByKey!458 lt!405806 (_1!6041 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181)))) (Some!463 (_2!6041 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111235 (= lt!405805 (lemmaContainsTupThenGetReturnValue!250 lt!405806 (_1!6041 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181))) (_2!6041 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111235 (= lt!405806 (insertStrictlySorted!307 (toList!5389 lt!405695) (_1!6041 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181))) (_2!6041 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111235 (= (+!2618 lt!405695 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181))) lt!405807)))

(declare-fun b!898906 () Bool)

(declare-fun res!607367 () Bool)

(assert (=> b!898906 (=> (not res!607367) (not e!502907))))

(assert (=> b!898906 (= res!607367 (= (getValueByKey!458 (toList!5389 lt!405807) (_1!6041 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181)))) (Some!463 (_2!6041 (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181))))))))

(declare-fun b!898907 () Bool)

(assert (=> b!898907 (= e!502907 (contains!4389 (toList!5389 lt!405807) (tuple2!12061 lt!405696 (zeroValue!5241 thiss!1181))))))

(assert (= (and d!111235 res!607366) b!898906))

(assert (= (and b!898906 res!607367) b!898907))

(declare-fun m!834897 () Bool)

(assert (=> d!111235 m!834897))

(declare-fun m!834899 () Bool)

(assert (=> d!111235 m!834899))

(declare-fun m!834901 () Bool)

(assert (=> d!111235 m!834901))

(declare-fun m!834903 () Bool)

(assert (=> d!111235 m!834903))

(declare-fun m!834905 () Bool)

(assert (=> b!898906 m!834905))

(declare-fun m!834907 () Bool)

(assert (=> b!898907 m!834907))

(assert (=> b!898729 d!111235))

(declare-fun b!898932 () Bool)

(declare-fun e!502927 () Bool)

(assert (=> b!898932 (= e!502927 (validKeyInArray!0 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898932 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!898933 () Bool)

(declare-fun res!607379 () Bool)

(declare-fun e!502926 () Bool)

(assert (=> b!898933 (=> (not res!607379) (not e!502926))))

(declare-fun lt!405825 () ListLongMap!10747)

(assert (=> b!898933 (= res!607379 (not (contains!4386 lt!405825 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!39893 () Bool)

(declare-fun call!39896 () ListLongMap!10747)

(assert (=> bm!39893 (= call!39896 (getCurrentListMapNoExtraKeys!3315 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5419 thiss!1181)))))

(declare-fun b!898935 () Bool)

(declare-fun e!502923 () Bool)

(assert (=> b!898935 (= e!502923 (= lt!405825 (getCurrentListMapNoExtraKeys!3315 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5419 thiss!1181))))))

(declare-fun b!898936 () Bool)

(declare-fun e!502924 () ListLongMap!10747)

(assert (=> b!898936 (= e!502924 call!39896)))

(declare-fun b!898937 () Bool)

(declare-fun e!502928 () ListLongMap!10747)

(assert (=> b!898937 (= e!502928 e!502924)))

(declare-fun c!95037 () Bool)

(assert (=> b!898937 (= c!95037 (validKeyInArray!0 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898938 () Bool)

(declare-fun e!502925 () Bool)

(assert (=> b!898938 (= e!502925 e!502923)))

(declare-fun c!95039 () Bool)

(assert (=> b!898938 (= c!95039 (bvslt #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(declare-fun d!111237 () Bool)

(assert (=> d!111237 e!502926))

(declare-fun res!607378 () Bool)

(assert (=> d!111237 (=> (not res!607378) (not e!502926))))

(assert (=> d!111237 (= res!607378 (not (contains!4386 lt!405825 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!111237 (= lt!405825 e!502928)))

(declare-fun c!95038 () Bool)

(assert (=> d!111237 (= c!95038 (bvsge #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(assert (=> d!111237 (validMask!0 (mask!26153 thiss!1181))))

(assert (=> d!111237 (= (getCurrentListMapNoExtraKeys!3315 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) lt!405825)))

(declare-fun b!898934 () Bool)

(declare-fun lt!405826 () Unit!30488)

(declare-fun lt!405822 () Unit!30488)

(assert (=> b!898934 (= lt!405826 lt!405822)))

(declare-fun lt!405823 () (_ BitVec 64))

(declare-fun lt!405828 () V!29431)

(declare-fun lt!405824 () ListLongMap!10747)

(declare-fun lt!405827 () (_ BitVec 64))

(assert (=> b!898934 (not (contains!4386 (+!2618 lt!405824 (tuple2!12061 lt!405823 lt!405828)) lt!405827))))

(declare-fun addStillNotContains!216 (ListLongMap!10747 (_ BitVec 64) V!29431 (_ BitVec 64)) Unit!30488)

(assert (=> b!898934 (= lt!405822 (addStillNotContains!216 lt!405824 lt!405823 lt!405828 lt!405827))))

(assert (=> b!898934 (= lt!405827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!898934 (= lt!405828 (get!13327 (select (arr!25338 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1301 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!898934 (= lt!405823 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898934 (= lt!405824 call!39896)))

(assert (=> b!898934 (= e!502924 (+!2618 call!39896 (tuple2!12061 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000) (get!13327 (select (arr!25338 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1301 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!898939 () Bool)

(declare-fun e!502922 () Bool)

(assert (=> b!898939 (= e!502925 e!502922)))

(assert (=> b!898939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(declare-fun res!607376 () Bool)

(assert (=> b!898939 (= res!607376 (contains!4386 lt!405825 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898939 (=> (not res!607376) (not e!502922))))

(declare-fun b!898940 () Bool)

(declare-fun isEmpty!692 (ListLongMap!10747) Bool)

(assert (=> b!898940 (= e!502923 (isEmpty!692 lt!405825))))

(declare-fun b!898941 () Bool)

(assert (=> b!898941 (= e!502926 e!502925)))

(declare-fun c!95036 () Bool)

(assert (=> b!898941 (= c!95036 e!502927)))

(declare-fun res!607377 () Bool)

(assert (=> b!898941 (=> (not res!607377) (not e!502927))))

(assert (=> b!898941 (= res!607377 (bvslt #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(declare-fun b!898942 () Bool)

(assert (=> b!898942 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25795 (_keys!10195 thiss!1181))))))

(assert (=> b!898942 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25796 (_values!5428 thiss!1181))))))

(assert (=> b!898942 (= e!502922 (= (apply!407 lt!405825 (select (arr!25337 (_keys!10195 thiss!1181)) #b00000000000000000000000000000000)) (get!13327 (select (arr!25338 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1301 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!898943 () Bool)

(assert (=> b!898943 (= e!502928 (ListLongMap!10748 Nil!17849))))

(assert (= (and d!111237 c!95038) b!898943))

(assert (= (and d!111237 (not c!95038)) b!898937))

(assert (= (and b!898937 c!95037) b!898934))

(assert (= (and b!898937 (not c!95037)) b!898936))

(assert (= (or b!898934 b!898936) bm!39893))

(assert (= (and d!111237 res!607378) b!898933))

(assert (= (and b!898933 res!607379) b!898941))

(assert (= (and b!898941 res!607377) b!898932))

(assert (= (and b!898941 c!95036) b!898939))

(assert (= (and b!898941 (not c!95036)) b!898938))

(assert (= (and b!898939 res!607376) b!898942))

(assert (= (and b!898938 c!95039) b!898935))

(assert (= (and b!898938 (not c!95039)) b!898940))

(declare-fun b_lambda!12961 () Bool)

(assert (=> (not b_lambda!12961) (not b!898934)))

(assert (=> b!898934 t!25189))

(declare-fun b_and!26303 () Bool)

(assert (= b_and!26301 (and (=> t!25189 result!10149) b_and!26303)))

(declare-fun b_lambda!12963 () Bool)

(assert (=> (not b_lambda!12963) (not b!898942)))

(assert (=> b!898942 t!25189))

(declare-fun b_and!26305 () Bool)

(assert (= b_and!26303 (and (=> t!25189 result!10149) b_and!26305)))

(declare-fun m!834909 () Bool)

(assert (=> b!898940 m!834909))

(assert (=> b!898937 m!834669))

(assert (=> b!898937 m!834669))

(assert (=> b!898937 m!834723))

(declare-fun m!834911 () Bool)

(assert (=> b!898934 m!834911))

(assert (=> b!898934 m!834715))

(declare-fun m!834913 () Bool)

(assert (=> b!898934 m!834913))

(declare-fun m!834915 () Bool)

(assert (=> b!898934 m!834915))

(assert (=> b!898934 m!834913))

(declare-fun m!834917 () Bool)

(assert (=> b!898934 m!834917))

(assert (=> b!898934 m!834669))

(assert (=> b!898934 m!834713))

(assert (=> b!898934 m!834713))

(assert (=> b!898934 m!834715))

(assert (=> b!898934 m!834717))

(declare-fun m!834919 () Bool)

(assert (=> bm!39893 m!834919))

(assert (=> b!898932 m!834669))

(assert (=> b!898932 m!834669))

(assert (=> b!898932 m!834723))

(assert (=> b!898935 m!834919))

(assert (=> b!898942 m!834715))

(assert (=> b!898942 m!834713))

(assert (=> b!898942 m!834713))

(assert (=> b!898942 m!834715))

(assert (=> b!898942 m!834717))

(assert (=> b!898942 m!834669))

(declare-fun m!834921 () Bool)

(assert (=> b!898942 m!834921))

(assert (=> b!898942 m!834669))

(declare-fun m!834923 () Bool)

(assert (=> d!111237 m!834923))

(assert (=> d!111237 m!834589))

(assert (=> b!898939 m!834669))

(assert (=> b!898939 m!834669))

(declare-fun m!834925 () Bool)

(assert (=> b!898939 m!834925))

(declare-fun m!834927 () Bool)

(assert (=> b!898933 m!834927))

(assert (=> b!898729 d!111237))

(declare-fun d!111239 () Bool)

(assert (=> d!111239 (contains!4386 (+!2618 lt!405714 (tuple2!12061 lt!405701 (zeroValue!5241 thiss!1181))) lt!405707)))

(declare-fun lt!405831 () Unit!30488)

(declare-fun choose!1508 (ListLongMap!10747 (_ BitVec 64) V!29431 (_ BitVec 64)) Unit!30488)

(assert (=> d!111239 (= lt!405831 (choose!1508 lt!405714 lt!405701 (zeroValue!5241 thiss!1181) lt!405707))))

(assert (=> d!111239 (contains!4386 lt!405714 lt!405707)))

(assert (=> d!111239 (= (addStillContains!333 lt!405714 lt!405701 (zeroValue!5241 thiss!1181) lt!405707) lt!405831)))

(declare-fun bs!25210 () Bool)

(assert (= bs!25210 d!111239))

(assert (=> bs!25210 m!834679))

(assert (=> bs!25210 m!834679))

(assert (=> bs!25210 m!834681))

(declare-fun m!834929 () Bool)

(assert (=> bs!25210 m!834929))

(declare-fun m!834931 () Bool)

(assert (=> bs!25210 m!834931))

(assert (=> b!898729 d!111239))

(declare-fun d!111241 () Bool)

(assert (=> d!111241 (= (apply!407 (+!2618 lt!405698 (tuple2!12061 lt!405715 (minValue!5241 thiss!1181))) lt!405708) (apply!407 lt!405698 lt!405708))))

(declare-fun lt!405832 () Unit!30488)

(assert (=> d!111241 (= lt!405832 (choose!1507 lt!405698 lt!405715 (minValue!5241 thiss!1181) lt!405708))))

(declare-fun e!502929 () Bool)

(assert (=> d!111241 e!502929))

(declare-fun res!607380 () Bool)

(assert (=> d!111241 (=> (not res!607380) (not e!502929))))

(assert (=> d!111241 (= res!607380 (contains!4386 lt!405698 lt!405708))))

(assert (=> d!111241 (= (addApplyDifferent!333 lt!405698 lt!405715 (minValue!5241 thiss!1181) lt!405708) lt!405832)))

(declare-fun b!898945 () Bool)

(assert (=> b!898945 (= e!502929 (not (= lt!405708 lt!405715)))))

(assert (= (and d!111241 res!607380) b!898945))

(declare-fun m!834933 () Bool)

(assert (=> d!111241 m!834933))

(declare-fun m!834935 () Bool)

(assert (=> d!111241 m!834935))

(assert (=> d!111241 m!834683))

(assert (=> d!111241 m!834701))

(assert (=> d!111241 m!834683))

(assert (=> d!111241 m!834685))

(assert (=> b!898729 d!111241))

(declare-fun d!111243 () Bool)

(declare-fun res!607381 () Bool)

(declare-fun e!502930 () Bool)

(assert (=> d!111243 (=> res!607381 e!502930)))

(assert (=> d!111243 (= res!607381 (= (select (arr!25337 (_keys!10195 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111243 (= (arrayContainsKey!0 (_keys!10195 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!502930)))

(declare-fun b!898946 () Bool)

(declare-fun e!502931 () Bool)

(assert (=> b!898946 (= e!502930 e!502931)))

(declare-fun res!607382 () Bool)

(assert (=> b!898946 (=> (not res!607382) (not e!502931))))

(assert (=> b!898946 (= res!607382 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25795 (_keys!10195 thiss!1181))))))

(declare-fun b!898947 () Bool)

(assert (=> b!898947 (= e!502931 (arrayContainsKey!0 (_keys!10195 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111243 (not res!607381)) b!898946))

(assert (= (and b!898946 res!607382) b!898947))

(declare-fun m!834937 () Bool)

(assert (=> d!111243 m!834937))

(declare-fun m!834939 () Bool)

(assert (=> b!898947 m!834939))

(assert (=> b!898676 d!111243))

(assert (=> b!898667 d!111203))

(assert (=> b!898667 d!111205))

(declare-fun b!898960 () Bool)

(declare-fun e!502938 () SeekEntryResult!8930)

(assert (=> b!898960 (= e!502938 (MissingVacant!8930 (index!38093 lt!405735)))))

(declare-fun b!898962 () Bool)

(declare-fun e!502939 () SeekEntryResult!8930)

(assert (=> b!898962 (= e!502939 Undefined!8930)))

(declare-fun b!898963 () Bool)

(declare-fun c!95048 () Bool)

(declare-fun lt!405838 () (_ BitVec 64))

(assert (=> b!898963 (= c!95048 (= lt!405838 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502940 () SeekEntryResult!8930)

(assert (=> b!898963 (= e!502940 e!502938)))

(declare-fun b!898964 () Bool)

(assert (=> b!898964 (= e!502938 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76598 lt!405735) #b00000000000000000000000000000001) (nextIndex!0 (index!38093 lt!405735) (x!76598 lt!405735) (mask!26153 thiss!1181)) (index!38093 lt!405735) key!785 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)))))

(declare-fun b!898965 () Bool)

(assert (=> b!898965 (= e!502939 e!502940)))

(declare-fun c!95047 () Bool)

(assert (=> b!898965 (= c!95047 (= lt!405838 key!785))))

(declare-fun b!898961 () Bool)

(assert (=> b!898961 (= e!502940 (Found!8930 (index!38093 lt!405735)))))

(declare-fun d!111245 () Bool)

(declare-fun lt!405837 () SeekEntryResult!8930)

(assert (=> d!111245 (and (or ((_ is Undefined!8930) lt!405837) (not ((_ is Found!8930) lt!405837)) (and (bvsge (index!38092 lt!405837) #b00000000000000000000000000000000) (bvslt (index!38092 lt!405837) (size!25795 (_keys!10195 thiss!1181))))) (or ((_ is Undefined!8930) lt!405837) ((_ is Found!8930) lt!405837) (not ((_ is MissingVacant!8930) lt!405837)) (not (= (index!38094 lt!405837) (index!38093 lt!405735))) (and (bvsge (index!38094 lt!405837) #b00000000000000000000000000000000) (bvslt (index!38094 lt!405837) (size!25795 (_keys!10195 thiss!1181))))) (or ((_ is Undefined!8930) lt!405837) (ite ((_ is Found!8930) lt!405837) (= (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405837)) key!785) (and ((_ is MissingVacant!8930) lt!405837) (= (index!38094 lt!405837) (index!38093 lt!405735)) (= (select (arr!25337 (_keys!10195 thiss!1181)) (index!38094 lt!405837)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111245 (= lt!405837 e!502939)))

(declare-fun c!95046 () Bool)

(assert (=> d!111245 (= c!95046 (bvsge (x!76598 lt!405735) #b01111111111111111111111111111110))))

(assert (=> d!111245 (= lt!405838 (select (arr!25337 (_keys!10195 thiss!1181)) (index!38093 lt!405735)))))

(assert (=> d!111245 (validMask!0 (mask!26153 thiss!1181))))

(assert (=> d!111245 (= (seekKeyOrZeroReturnVacant!0 (x!76598 lt!405735) (index!38093 lt!405735) (index!38093 lt!405735) key!785 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)) lt!405837)))

(assert (= (and d!111245 c!95046) b!898962))

(assert (= (and d!111245 (not c!95046)) b!898965))

(assert (= (and b!898965 c!95047) b!898961))

(assert (= (and b!898965 (not c!95047)) b!898963))

(assert (= (and b!898963 c!95048) b!898960))

(assert (= (and b!898963 (not c!95048)) b!898964))

(declare-fun m!834941 () Bool)

(assert (=> b!898964 m!834941))

(assert (=> b!898964 m!834941))

(declare-fun m!834943 () Bool)

(assert (=> b!898964 m!834943))

(declare-fun m!834945 () Bool)

(assert (=> d!111245 m!834945))

(declare-fun m!834947 () Bool)

(assert (=> d!111245 m!834947))

(assert (=> d!111245 m!834743))

(assert (=> d!111245 m!834589))

(assert (=> b!898771 d!111245))

(assert (=> d!111171 d!111173))

(declare-fun d!111247 () Bool)

(declare-fun e!502943 () Bool)

(assert (=> d!111247 e!502943))

(declare-fun res!607385 () Bool)

(assert (=> d!111247 (=> res!607385 e!502943)))

(declare-fun lt!405841 () SeekEntryResult!8930)

(assert (=> d!111247 (= res!607385 (not ((_ is Found!8930) lt!405841)))))

(assert (=> d!111247 (= lt!405841 (seekEntry!0 key!785 (_keys!10195 thiss!1181) (mask!26153 thiss!1181)))))

(assert (=> d!111247 true))

(declare-fun _$36!369 () Unit!30488)

(assert (=> d!111247 (= (choose!1505 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) key!785) _$36!369)))

(declare-fun b!898968 () Bool)

(assert (=> b!898968 (= e!502943 (inRange!0 (index!38092 lt!405841) (mask!26153 thiss!1181)))))

(assert (= (and d!111247 (not res!607385)) b!898968))

(assert (=> d!111247 m!834599))

(declare-fun m!834949 () Bool)

(assert (=> b!898968 m!834949))

(assert (=> d!111171 d!111247))

(assert (=> d!111171 d!111155))

(assert (=> b!898732 d!111189))

(assert (=> d!111161 d!111157))

(declare-fun d!111249 () Bool)

(assert (=> d!111249 (arrayContainsKey!0 (_keys!10195 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111249 true))

(declare-fun _$60!418 () Unit!30488)

(assert (=> d!111249 (= (choose!13 (_keys!10195 thiss!1181) key!785 (index!38092 lt!405607)) _$60!418)))

(declare-fun bs!25211 () Bool)

(assert (= bs!25211 d!111249))

(assert (=> bs!25211 m!834583))

(assert (=> d!111161 d!111249))

(declare-fun d!111251 () Bool)

(declare-fun e!502944 () Bool)

(assert (=> d!111251 e!502944))

(declare-fun res!607386 () Bool)

(assert (=> d!111251 (=> (not res!607386) (not e!502944))))

(declare-fun lt!405845 () ListLongMap!10747)

(assert (=> d!111251 (= res!607386 (contains!4386 lt!405845 (_1!6041 (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))))

(declare-fun lt!405844 () List!17852)

(assert (=> d!111251 (= lt!405845 (ListLongMap!10748 lt!405844))))

(declare-fun lt!405842 () Unit!30488)

(declare-fun lt!405843 () Unit!30488)

(assert (=> d!111251 (= lt!405842 lt!405843)))

(assert (=> d!111251 (= (getValueByKey!458 lt!405844 (_1!6041 (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))) (Some!463 (_2!6041 (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))))

(assert (=> d!111251 (= lt!405843 (lemmaContainsTupThenGetReturnValue!250 lt!405844 (_1!6041 (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))) (_2!6041 (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))))

(assert (=> d!111251 (= lt!405844 (insertStrictlySorted!307 (toList!5389 (ite c!94979 call!39884 (ite c!94982 call!39880 call!39878))) (_1!6041 (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))) (_2!6041 (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))))

(assert (=> d!111251 (= (+!2618 (ite c!94979 call!39884 (ite c!94982 call!39880 call!39878)) (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))) lt!405845)))

(declare-fun b!898969 () Bool)

(declare-fun res!607387 () Bool)

(assert (=> b!898969 (=> (not res!607387) (not e!502944))))

(assert (=> b!898969 (= res!607387 (= (getValueByKey!458 (toList!5389 lt!405845) (_1!6041 (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))) (Some!463 (_2!6041 (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))))

(declare-fun b!898970 () Bool)

(assert (=> b!898970 (= e!502944 (contains!4389 (toList!5389 lt!405845) (ite (or c!94979 c!94982) (tuple2!12061 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(assert (= (and d!111251 res!607386) b!898969))

(assert (= (and b!898969 res!607387) b!898970))

(declare-fun m!834951 () Bool)

(assert (=> d!111251 m!834951))

(declare-fun m!834953 () Bool)

(assert (=> d!111251 m!834953))

(declare-fun m!834955 () Bool)

(assert (=> d!111251 m!834955))

(declare-fun m!834957 () Bool)

(assert (=> d!111251 m!834957))

(declare-fun m!834959 () Bool)

(assert (=> b!898969 m!834959))

(declare-fun m!834961 () Bool)

(assert (=> b!898970 m!834961))

(assert (=> bm!39877 d!111251))

(declare-fun d!111253 () Bool)

(declare-fun res!607392 () Bool)

(declare-fun e!502949 () Bool)

(assert (=> d!111253 (=> res!607392 e!502949)))

(assert (=> d!111253 (= res!607392 (and ((_ is Cons!17848) (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (= (_1!6041 (h!18991 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607)))))))

(assert (=> d!111253 (= (containsKey!426 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))) e!502949)))

(declare-fun b!898975 () Bool)

(declare-fun e!502950 () Bool)

(assert (=> b!898975 (= e!502949 e!502950)))

(declare-fun res!607393 () Bool)

(assert (=> b!898975 (=> (not res!607393) (not e!502950))))

(assert (=> b!898975 (= res!607393 (and (or (not ((_ is Cons!17848) (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (bvsle (_1!6041 (h!18991 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607)))) ((_ is Cons!17848) (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (bvslt (_1!6041 (h!18991 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607)))))))

(declare-fun b!898976 () Bool)

(assert (=> b!898976 (= e!502950 (containsKey!426 (t!25186 (toList!5389 (getCurrentListMap!2608 (_keys!10195 thiss!1181) (_values!5428 thiss!1181) (mask!26153 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (select (arr!25337 (_keys!10195 thiss!1181)) (index!38092 lt!405607))))))

(assert (= (and d!111253 (not res!607392)) b!898975))

(assert (= (and b!898975 res!607393) b!898976))

(assert (=> b!898976 m!834585))

(declare-fun m!834963 () Bool)

(assert (=> b!898976 m!834963))

(assert (=> d!111151 d!111253))

(declare-fun d!111255 () Bool)

(assert (=> d!111255 (= (inRange!0 (index!38092 lt!405724) (mask!26153 thiss!1181)) (and (bvsge (index!38092 lt!405724) #b00000000000000000000000000000000) (bvslt (index!38092 lt!405724) (bvadd (mask!26153 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898753 d!111255))

(assert (=> bm!39878 d!111237))

(assert (=> d!111159 d!111155))

(declare-fun d!111257 () Bool)

(declare-fun e!502951 () Bool)

(assert (=> d!111257 e!502951))

(declare-fun res!607394 () Bool)

(assert (=> d!111257 (=> (not res!607394) (not e!502951))))

(declare-fun lt!405849 () ListLongMap!10747)

(assert (=> d!111257 (= res!607394 (contains!4386 lt!405849 (_1!6041 (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(declare-fun lt!405848 () List!17852)

(assert (=> d!111257 (= lt!405849 (ListLongMap!10748 lt!405848))))

(declare-fun lt!405846 () Unit!30488)

(declare-fun lt!405847 () Unit!30488)

(assert (=> d!111257 (= lt!405846 lt!405847)))

(assert (=> d!111257 (= (getValueByKey!458 lt!405848 (_1!6041 (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))) (Some!463 (_2!6041 (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(assert (=> d!111257 (= lt!405847 (lemmaContainsTupThenGetReturnValue!250 lt!405848 (_1!6041 (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))) (_2!6041 (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(assert (=> d!111257 (= lt!405848 (insertStrictlySorted!307 (toList!5389 call!39881) (_1!6041 (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))) (_2!6041 (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(assert (=> d!111257 (= (+!2618 call!39881 (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))) lt!405849)))

(declare-fun b!898977 () Bool)

(declare-fun res!607395 () Bool)

(assert (=> b!898977 (=> (not res!607395) (not e!502951))))

(assert (=> b!898977 (= res!607395 (= (getValueByKey!458 (toList!5389 lt!405849) (_1!6041 (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))) (Some!463 (_2!6041 (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))))

(declare-fun b!898978 () Bool)

(assert (=> b!898978 (= e!502951 (contains!4389 (toList!5389 lt!405849) (tuple2!12061 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))

(assert (= (and d!111257 res!607394) b!898977))

(assert (= (and b!898977 res!607395) b!898978))

(declare-fun m!834965 () Bool)

(assert (=> d!111257 m!834965))

(declare-fun m!834967 () Bool)

(assert (=> d!111257 m!834967))

(declare-fun m!834969 () Bool)

(assert (=> d!111257 m!834969))

(declare-fun m!834971 () Bool)

(assert (=> d!111257 m!834971))

(declare-fun m!834973 () Bool)

(assert (=> b!898977 m!834973))

(declare-fun m!834975 () Bool)

(assert (=> b!898978 m!834975))

(assert (=> b!898734 d!111257))

(declare-fun b!898979 () Bool)

(declare-fun e!502953 () Bool)

(assert (=> b!898979 (= e!502953 tp_is_empty!18349)))

(declare-fun condMapEmpty!29192 () Bool)

(declare-fun mapDefault!29192 () ValueCell!8693)

(assert (=> mapNonEmpty!29191 (= condMapEmpty!29192 (= mapRest!29191 ((as const (Array (_ BitVec 32) ValueCell!8693)) mapDefault!29192)))))

(declare-fun e!502952 () Bool)

(declare-fun mapRes!29192 () Bool)

(assert (=> mapNonEmpty!29191 (= tp!56152 (and e!502952 mapRes!29192))))

(declare-fun b!898980 () Bool)

(assert (=> b!898980 (= e!502952 tp_is_empty!18349)))

(declare-fun mapIsEmpty!29192 () Bool)

(assert (=> mapIsEmpty!29192 mapRes!29192))

(declare-fun mapNonEmpty!29192 () Bool)

(declare-fun tp!56153 () Bool)

(assert (=> mapNonEmpty!29192 (= mapRes!29192 (and tp!56153 e!502953))))

(declare-fun mapRest!29192 () (Array (_ BitVec 32) ValueCell!8693))

(declare-fun mapKey!29192 () (_ BitVec 32))

(declare-fun mapValue!29192 () ValueCell!8693)

(assert (=> mapNonEmpty!29192 (= mapRest!29191 (store mapRest!29192 mapKey!29192 mapValue!29192))))

(assert (= (and mapNonEmpty!29191 condMapEmpty!29192) mapIsEmpty!29192))

(assert (= (and mapNonEmpty!29191 (not condMapEmpty!29192)) mapNonEmpty!29192))

(assert (= (and mapNonEmpty!29192 ((_ is ValueCellFull!8693) mapValue!29192)) b!898979))

(assert (= (and mapNonEmpty!29191 ((_ is ValueCellFull!8693) mapDefault!29192)) b!898980))

(declare-fun m!834977 () Bool)

(assert (=> mapNonEmpty!29192 m!834977))

(declare-fun b_lambda!12965 () Bool)

(assert (= b_lambda!12963 (or (and b!898600 b_free!16021) b_lambda!12965)))

(declare-fun b_lambda!12967 () Bool)

(assert (= b_lambda!12961 (or (and b!898600 b_free!16021) b_lambda!12967)))

(check-sat (not d!111193) (not b!898851) (not b!898880) (not b!898947) (not d!111247) (not b!898780) (not b!898866) b_and!26305 (not b_lambda!12967) (not bm!39893) (not d!111235) (not bm!39890) (not b!898785) (not b!898849) (not b!898933) (not b!898813) (not b!898886) (not d!111257) (not b!898782) (not b!898976) (not b!898862) (not b!898940) (not d!111231) (not d!111181) (not b!898863) (not d!111223) (not d!111249) (not bm!39887) (not b!898837) (not d!111245) (not d!111221) (not d!111227) (not d!111207) (not b!898964) (not d!111241) (not b!898899) (not d!111215) (not b!898826) (not d!111219) (not d!111211) (not b_next!16021) (not d!111233) (not d!111179) (not b!898942) (not b!898783) (not d!111225) (not d!111237) (not b!898934) (not b!898906) (not b!898977) (not d!111183) (not b!898968) (not b_lambda!12959) (not bm!39884) (not b!898869) (not d!111217) (not b!898900) (not b!898935) (not b!898887) (not b!898904) (not b!898969) (not b!898888) tp_is_empty!18349 (not d!111239) (not b!898811) (not b!898939) (not b!898970) (not d!111213) (not d!111177) (not b!898815) (not mapNonEmpty!29192) (not d!111229) (not b!898932) (not b!898905) (not b!898907) (not b!898937) (not d!111187) (not d!111191) (not b!898901) (not d!111175) (not b!898978) (not b!898890) (not b!898902) (not d!111201) (not d!111251) (not b!898825) (not b_lambda!12965) (not d!111203))
(check-sat b_and!26305 (not b_next!16021))
