; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76080 () Bool)

(assert start!76080)

(declare-fun b!894078 () Bool)

(declare-fun b_free!15847 () Bool)

(declare-fun b_next!15847 () Bool)

(assert (=> b!894078 (= b_free!15847 (not b_next!15847))))

(declare-fun tp!55514 () Bool)

(declare-fun b_and!26119 () Bool)

(assert (=> b!894078 (= tp!55514 b_and!26119)))

(declare-fun res!605272 () Bool)

(declare-fun e!499356 () Bool)

(assert (=> start!76080 (=> (not res!605272) (not e!499356))))

(declare-datatypes ((array!52371 0))(
  ( (array!52372 (arr!25186 (Array (_ BitVec 32) (_ BitVec 64))) (size!25631 (_ BitVec 32))) )
))
(declare-datatypes ((V!29199 0))(
  ( (V!29200 (val!9138 Int)) )
))
(declare-datatypes ((ValueCell!8606 0))(
  ( (ValueCellFull!8606 (v!11614 V!29199)) (EmptyCell!8606) )
))
(declare-datatypes ((array!52373 0))(
  ( (array!52374 (arr!25187 (Array (_ BitVec 32) ValueCell!8606)) (size!25632 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4228 0))(
  ( (LongMapFixedSize!4229 (defaultEntry!5314 Int) (mask!25883 (_ BitVec 32)) (extraKeys!5009 (_ BitVec 32)) (zeroValue!5113 V!29199) (minValue!5113 V!29199) (_size!2169 (_ BitVec 32)) (_keys!10027 array!52371) (_values!5300 array!52373) (_vacant!2169 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4228)

(declare-fun valid!1647 (LongMapFixedSize!4228) Bool)

(assert (=> start!76080 (= res!605272 (valid!1647 thiss!1181))))

(assert (=> start!76080 e!499356))

(declare-fun e!499352 () Bool)

(assert (=> start!76080 e!499352))

(assert (=> start!76080 true))

(declare-fun b!894072 () Bool)

(declare-fun res!605270 () Bool)

(assert (=> b!894072 (=> (not res!605270) (not e!499356))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!894072 (= res!605270 (not (= key!785 (bvneg key!785))))))

(declare-fun b!894073 () Bool)

(declare-fun e!499354 () Bool)

(declare-fun tp_is_empty!18175 () Bool)

(assert (=> b!894073 (= e!499354 tp_is_empty!18175)))

(declare-fun b!894074 () Bool)

(declare-fun e!499350 () Bool)

(declare-fun mapRes!28820 () Bool)

(assert (=> b!894074 (= e!499350 (and e!499354 mapRes!28820))))

(declare-fun condMapEmpty!28820 () Bool)

(declare-fun mapDefault!28820 () ValueCell!8606)

(assert (=> b!894074 (= condMapEmpty!28820 (= (arr!25187 (_values!5300 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8606)) mapDefault!28820)))))

(declare-fun b!894075 () Bool)

(declare-fun res!605268 () Bool)

(declare-fun e!499351 () Bool)

(assert (=> b!894075 (=> res!605268 e!499351)))

(declare-fun contains!4348 (LongMapFixedSize!4228 (_ BitVec 64)) Bool)

(assert (=> b!894075 (= res!605268 (not (contains!4348 thiss!1181 key!785)))))

(declare-fun b!894076 () Bool)

(assert (=> b!894076 (= e!499356 (not e!499351))))

(declare-fun res!605271 () Bool)

(assert (=> b!894076 (=> res!605271 e!499351)))

(declare-datatypes ((SeekEntryResult!8817 0))(
  ( (MissingZero!8817 (index!37639 (_ BitVec 32))) (Found!8817 (index!37640 (_ BitVec 32))) (Intermediate!8817 (undefined!9629 Bool) (index!37641 (_ BitVec 32)) (x!75899 (_ BitVec 32))) (Undefined!8817) (MissingVacant!8817 (index!37642 (_ BitVec 32))) )
))
(declare-fun lt!403912 () SeekEntryResult!8817)

(get-info :version)

(assert (=> b!894076 (= res!605271 ((_ is Found!8817) lt!403912))))

(declare-fun e!499355 () Bool)

(assert (=> b!894076 e!499355))

(declare-fun res!605269 () Bool)

(assert (=> b!894076 (=> res!605269 e!499355)))

(assert (=> b!894076 (= res!605269 (not ((_ is Found!8817) lt!403912)))))

(declare-datatypes ((Unit!30406 0))(
  ( (Unit!30407) )
))
(declare-fun lt!403913 () Unit!30406)

(declare-fun lemmaSeekEntryGivesInRangeIndex!66 (array!52371 array!52373 (_ BitVec 32) (_ BitVec 32) V!29199 V!29199 (_ BitVec 64)) Unit!30406)

(assert (=> b!894076 (= lt!403913 (lemmaSeekEntryGivesInRangeIndex!66 (_keys!10027 thiss!1181) (_values!5300 thiss!1181) (mask!25883 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52371 (_ BitVec 32)) SeekEntryResult!8817)

(assert (=> b!894076 (= lt!403912 (seekEntry!0 key!785 (_keys!10027 thiss!1181) (mask!25883 thiss!1181)))))

(declare-fun b!894077 () Bool)

(declare-datatypes ((Option!450 0))(
  ( (Some!449 (v!11615 V!29199)) (None!448) )
))
(declare-fun isDefined!324 (Option!450) Bool)

(declare-datatypes ((tuple2!11928 0))(
  ( (tuple2!11929 (_1!5975 (_ BitVec 64)) (_2!5975 V!29199)) )
))
(declare-datatypes ((List!17746 0))(
  ( (Nil!17743) (Cons!17742 (h!18879 tuple2!11928) (t!25055 List!17746)) )
))
(declare-fun getValueByKey!444 (List!17746 (_ BitVec 64)) Option!450)

(declare-datatypes ((ListLongMap!10627 0))(
  ( (ListLongMap!10628 (toList!5329 List!17746)) )
))
(declare-fun map!12197 (LongMapFixedSize!4228) ListLongMap!10627)

(assert (=> b!894077 (= e!499351 (isDefined!324 (getValueByKey!444 (toList!5329 (map!12197 thiss!1181)) key!785)))))

(declare-fun array_inv!19830 (array!52371) Bool)

(declare-fun array_inv!19831 (array!52373) Bool)

(assert (=> b!894078 (= e!499352 (and tp!55514 tp_is_empty!18175 (array_inv!19830 (_keys!10027 thiss!1181)) (array_inv!19831 (_values!5300 thiss!1181)) e!499350))))

(declare-fun mapIsEmpty!28820 () Bool)

(assert (=> mapIsEmpty!28820 mapRes!28820))

(declare-fun b!894079 () Bool)

(declare-fun e!499349 () Bool)

(assert (=> b!894079 (= e!499349 tp_is_empty!18175)))

(declare-fun mapNonEmpty!28820 () Bool)

(declare-fun tp!55513 () Bool)

(assert (=> mapNonEmpty!28820 (= mapRes!28820 (and tp!55513 e!499349))))

(declare-fun mapRest!28820 () (Array (_ BitVec 32) ValueCell!8606))

(declare-fun mapKey!28820 () (_ BitVec 32))

(declare-fun mapValue!28820 () ValueCell!8606)

(assert (=> mapNonEmpty!28820 (= (arr!25187 (_values!5300 thiss!1181)) (store mapRest!28820 mapKey!28820 mapValue!28820))))

(declare-fun b!894080 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!894080 (= e!499355 (inRange!0 (index!37640 lt!403912) (mask!25883 thiss!1181)))))

(assert (= (and start!76080 res!605272) b!894072))

(assert (= (and b!894072 res!605270) b!894076))

(assert (= (and b!894076 (not res!605269)) b!894080))

(assert (= (and b!894076 (not res!605271)) b!894075))

(assert (= (and b!894075 (not res!605268)) b!894077))

(assert (= (and b!894074 condMapEmpty!28820) mapIsEmpty!28820))

(assert (= (and b!894074 (not condMapEmpty!28820)) mapNonEmpty!28820))

(assert (= (and mapNonEmpty!28820 ((_ is ValueCellFull!8606) mapValue!28820)) b!894079))

(assert (= (and b!894074 ((_ is ValueCellFull!8606) mapDefault!28820)) b!894073))

(assert (= b!894078 b!894074))

(assert (= start!76080 b!894078))

(declare-fun m!832575 () Bool)

(assert (=> b!894080 m!832575))

(declare-fun m!832577 () Bool)

(assert (=> b!894077 m!832577))

(declare-fun m!832579 () Bool)

(assert (=> b!894077 m!832579))

(assert (=> b!894077 m!832579))

(declare-fun m!832581 () Bool)

(assert (=> b!894077 m!832581))

(declare-fun m!832583 () Bool)

(assert (=> mapNonEmpty!28820 m!832583))

(declare-fun m!832585 () Bool)

(assert (=> b!894076 m!832585))

(declare-fun m!832587 () Bool)

(assert (=> b!894076 m!832587))

(declare-fun m!832589 () Bool)

(assert (=> start!76080 m!832589))

(declare-fun m!832591 () Bool)

(assert (=> b!894075 m!832591))

(declare-fun m!832593 () Bool)

(assert (=> b!894078 m!832593))

(declare-fun m!832595 () Bool)

(assert (=> b!894078 m!832595))

(check-sat (not b!894075) (not b!894077) (not b!894078) (not b!894076) (not start!76080) b_and!26119 (not b_next!15847) (not mapNonEmpty!28820) tp_is_empty!18175 (not b!894080))
(check-sat b_and!26119 (not b_next!15847))
(get-model)

(declare-fun d!110603 () Bool)

(assert (=> d!110603 (= (array_inv!19830 (_keys!10027 thiss!1181)) (bvsge (size!25631 (_keys!10027 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894078 d!110603))

(declare-fun d!110605 () Bool)

(assert (=> d!110605 (= (array_inv!19831 (_values!5300 thiss!1181)) (bvsge (size!25632 (_values!5300 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894078 d!110605))

(declare-fun d!110607 () Bool)

(declare-fun isEmpty!685 (Option!450) Bool)

(assert (=> d!110607 (= (isDefined!324 (getValueByKey!444 (toList!5329 (map!12197 thiss!1181)) key!785)) (not (isEmpty!685 (getValueByKey!444 (toList!5329 (map!12197 thiss!1181)) key!785))))))

(declare-fun bs!25081 () Bool)

(assert (= bs!25081 d!110607))

(assert (=> bs!25081 m!832579))

(declare-fun m!832641 () Bool)

(assert (=> bs!25081 m!832641))

(assert (=> b!894077 d!110607))

(declare-fun b!894145 () Bool)

(declare-fun e!499410 () Option!450)

(assert (=> b!894145 (= e!499410 (getValueByKey!444 (t!25055 (toList!5329 (map!12197 thiss!1181))) key!785))))

(declare-fun b!894143 () Bool)

(declare-fun e!499409 () Option!450)

(assert (=> b!894143 (= e!499409 (Some!449 (_2!5975 (h!18879 (toList!5329 (map!12197 thiss!1181))))))))

(declare-fun b!894146 () Bool)

(assert (=> b!894146 (= e!499410 None!448)))

(declare-fun d!110609 () Bool)

(declare-fun c!94346 () Bool)

(assert (=> d!110609 (= c!94346 (and ((_ is Cons!17742) (toList!5329 (map!12197 thiss!1181))) (= (_1!5975 (h!18879 (toList!5329 (map!12197 thiss!1181)))) key!785)))))

(assert (=> d!110609 (= (getValueByKey!444 (toList!5329 (map!12197 thiss!1181)) key!785) e!499409)))

(declare-fun b!894144 () Bool)

(assert (=> b!894144 (= e!499409 e!499410)))

(declare-fun c!94347 () Bool)

(assert (=> b!894144 (= c!94347 (and ((_ is Cons!17742) (toList!5329 (map!12197 thiss!1181))) (not (= (_1!5975 (h!18879 (toList!5329 (map!12197 thiss!1181)))) key!785))))))

(assert (= (and d!110609 c!94346) b!894143))

(assert (= (and d!110609 (not c!94346)) b!894144))

(assert (= (and b!894144 c!94347) b!894145))

(assert (= (and b!894144 (not c!94347)) b!894146))

(declare-fun m!832643 () Bool)

(assert (=> b!894145 m!832643))

(assert (=> b!894077 d!110609))

(declare-fun d!110611 () Bool)

(declare-fun getCurrentListMap!2606 (array!52371 array!52373 (_ BitVec 32) (_ BitVec 32) V!29199 V!29199 (_ BitVec 32) Int) ListLongMap!10627)

(assert (=> d!110611 (= (map!12197 thiss!1181) (getCurrentListMap!2606 (_keys!10027 thiss!1181) (_values!5300 thiss!1181) (mask!25883 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5314 thiss!1181)))))

(declare-fun bs!25082 () Bool)

(assert (= bs!25082 d!110611))

(declare-fun m!832645 () Bool)

(assert (=> bs!25082 m!832645))

(assert (=> b!894077 d!110611))

(declare-fun d!110613 () Bool)

(assert (=> d!110613 (= (inRange!0 (index!37640 lt!403912) (mask!25883 thiss!1181)) (and (bvsge (index!37640 lt!403912) #b00000000000000000000000000000000) (bvslt (index!37640 lt!403912) (bvadd (mask!25883 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!894080 d!110613))

(declare-fun d!110615 () Bool)

(declare-fun e!499413 () Bool)

(assert (=> d!110615 e!499413))

(declare-fun res!605305 () Bool)

(assert (=> d!110615 (=> res!605305 e!499413)))

(declare-fun lt!403931 () SeekEntryResult!8817)

(assert (=> d!110615 (= res!605305 (not ((_ is Found!8817) lt!403931)))))

(assert (=> d!110615 (= lt!403931 (seekEntry!0 key!785 (_keys!10027 thiss!1181) (mask!25883 thiss!1181)))))

(declare-fun lt!403930 () Unit!30406)

(declare-fun choose!1469 (array!52371 array!52373 (_ BitVec 32) (_ BitVec 32) V!29199 V!29199 (_ BitVec 64)) Unit!30406)

(assert (=> d!110615 (= lt!403930 (choose!1469 (_keys!10027 thiss!1181) (_values!5300 thiss!1181) (mask!25883 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110615 (validMask!0 (mask!25883 thiss!1181))))

(assert (=> d!110615 (= (lemmaSeekEntryGivesInRangeIndex!66 (_keys!10027 thiss!1181) (_values!5300 thiss!1181) (mask!25883 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) key!785) lt!403930)))

(declare-fun b!894149 () Bool)

(assert (=> b!894149 (= e!499413 (inRange!0 (index!37640 lt!403931) (mask!25883 thiss!1181)))))

(assert (= (and d!110615 (not res!605305)) b!894149))

(assert (=> d!110615 m!832587))

(declare-fun m!832647 () Bool)

(assert (=> d!110615 m!832647))

(declare-fun m!832649 () Bool)

(assert (=> d!110615 m!832649))

(declare-fun m!832651 () Bool)

(assert (=> b!894149 m!832651))

(assert (=> b!894076 d!110615))

(declare-fun b!894162 () Bool)

(declare-fun e!499421 () SeekEntryResult!8817)

(declare-fun lt!403940 () SeekEntryResult!8817)

(assert (=> b!894162 (= e!499421 (ite ((_ is MissingVacant!8817) lt!403940) (MissingZero!8817 (index!37642 lt!403940)) lt!403940))))

(declare-fun lt!403941 () SeekEntryResult!8817)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52371 (_ BitVec 32)) SeekEntryResult!8817)

(assert (=> b!894162 (= lt!403940 (seekKeyOrZeroReturnVacant!0 (x!75899 lt!403941) (index!37641 lt!403941) (index!37641 lt!403941) key!785 (_keys!10027 thiss!1181) (mask!25883 thiss!1181)))))

(declare-fun b!894163 () Bool)

(declare-fun e!499422 () SeekEntryResult!8817)

(assert (=> b!894163 (= e!499422 Undefined!8817)))

(declare-fun d!110617 () Bool)

(declare-fun lt!403943 () SeekEntryResult!8817)

(assert (=> d!110617 (and (or ((_ is MissingVacant!8817) lt!403943) (not ((_ is Found!8817) lt!403943)) (and (bvsge (index!37640 lt!403943) #b00000000000000000000000000000000) (bvslt (index!37640 lt!403943) (size!25631 (_keys!10027 thiss!1181))))) (not ((_ is MissingVacant!8817) lt!403943)) (or (not ((_ is Found!8817) lt!403943)) (= (select (arr!25186 (_keys!10027 thiss!1181)) (index!37640 lt!403943)) key!785)))))

(assert (=> d!110617 (= lt!403943 e!499422)))

(declare-fun c!94356 () Bool)

(assert (=> d!110617 (= c!94356 (and ((_ is Intermediate!8817) lt!403941) (undefined!9629 lt!403941)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52371 (_ BitVec 32)) SeekEntryResult!8817)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110617 (= lt!403941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25883 thiss!1181)) key!785 (_keys!10027 thiss!1181) (mask!25883 thiss!1181)))))

(assert (=> d!110617 (validMask!0 (mask!25883 thiss!1181))))

(assert (=> d!110617 (= (seekEntry!0 key!785 (_keys!10027 thiss!1181) (mask!25883 thiss!1181)) lt!403943)))

(declare-fun b!894164 () Bool)

(declare-fun e!499420 () SeekEntryResult!8817)

(assert (=> b!894164 (= e!499420 (Found!8817 (index!37641 lt!403941)))))

(declare-fun b!894165 () Bool)

(declare-fun c!94354 () Bool)

(declare-fun lt!403942 () (_ BitVec 64))

(assert (=> b!894165 (= c!94354 (= lt!403942 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894165 (= e!499420 e!499421)))

(declare-fun b!894166 () Bool)

(assert (=> b!894166 (= e!499422 e!499420)))

(assert (=> b!894166 (= lt!403942 (select (arr!25186 (_keys!10027 thiss!1181)) (index!37641 lt!403941)))))

(declare-fun c!94355 () Bool)

(assert (=> b!894166 (= c!94355 (= lt!403942 key!785))))

(declare-fun b!894167 () Bool)

(assert (=> b!894167 (= e!499421 (MissingZero!8817 (index!37641 lt!403941)))))

(assert (= (and d!110617 c!94356) b!894163))

(assert (= (and d!110617 (not c!94356)) b!894166))

(assert (= (and b!894166 c!94355) b!894164))

(assert (= (and b!894166 (not c!94355)) b!894165))

(assert (= (and b!894165 c!94354) b!894167))

(assert (= (and b!894165 (not c!94354)) b!894162))

(declare-fun m!832653 () Bool)

(assert (=> b!894162 m!832653))

(declare-fun m!832655 () Bool)

(assert (=> d!110617 m!832655))

(declare-fun m!832657 () Bool)

(assert (=> d!110617 m!832657))

(assert (=> d!110617 m!832657))

(declare-fun m!832659 () Bool)

(assert (=> d!110617 m!832659))

(assert (=> d!110617 m!832649))

(declare-fun m!832661 () Bool)

(assert (=> b!894166 m!832661))

(assert (=> b!894076 d!110617))

(declare-fun b!894188 () Bool)

(declare-fun e!499437 () Bool)

(assert (=> b!894188 (= e!499437 false)))

(declare-fun c!94371 () Bool)

(declare-fun call!39658 () Bool)

(assert (=> b!894188 (= c!94371 call!39658)))

(declare-fun lt!403986 () Unit!30406)

(declare-fun e!499436 () Unit!30406)

(assert (=> b!894188 (= lt!403986 e!499436)))

(declare-fun bm!39655 () Bool)

(declare-fun call!39660 () Bool)

(declare-fun arrayContainsKey!0 (array!52371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39655 (= call!39660 (arrayContainsKey!0 (_keys!10027 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun bm!39656 () Bool)

(declare-fun call!39659 () ListLongMap!10627)

(assert (=> bm!39656 (= call!39659 (getCurrentListMap!2606 (_keys!10027 thiss!1181) (_values!5300 thiss!1181) (mask!25883 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5314 thiss!1181)))))

(declare-fun b!894189 () Bool)

(declare-fun e!499433 () Bool)

(declare-fun e!499435 () Bool)

(assert (=> b!894189 (= e!499433 e!499435)))

(declare-fun c!94370 () Bool)

(assert (=> b!894189 (= c!94370 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!110619 () Bool)

(declare-fun lt!403985 () Bool)

(declare-fun contains!4350 (ListLongMap!10627 (_ BitVec 64)) Bool)

(assert (=> d!110619 (= lt!403985 (contains!4350 (map!12197 thiss!1181) key!785))))

(assert (=> d!110619 (= lt!403985 e!499433)))

(declare-fun c!94368 () Bool)

(assert (=> d!110619 (= c!94368 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110619 (valid!1647 thiss!1181)))

(assert (=> d!110619 (= (contains!4348 thiss!1181 key!785) lt!403985)))

(declare-fun b!894190 () Bool)

(assert (=> b!894190 (= e!499437 true)))

(declare-fun lt!403975 () Unit!30406)

(declare-fun lt!403984 () SeekEntryResult!8817)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52371 (_ BitVec 64) (_ BitVec 32)) Unit!30406)

(assert (=> b!894190 (= lt!403975 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10027 thiss!1181) key!785 (index!37640 lt!403984)))))

(assert (=> b!894190 call!39660))

(declare-fun lt!403974 () Unit!30406)

(assert (=> b!894190 (= lt!403974 lt!403975)))

(declare-fun lt!403988 () Unit!30406)

(declare-fun lemmaValidKeyInArrayIsInListMap!236 (array!52371 array!52373 (_ BitVec 32) (_ BitVec 32) V!29199 V!29199 (_ BitVec 32) Int) Unit!30406)

(assert (=> b!894190 (= lt!403988 (lemmaValidKeyInArrayIsInListMap!236 (_keys!10027 thiss!1181) (_values!5300 thiss!1181) (mask!25883 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) (index!37640 lt!403984) (defaultEntry!5314 thiss!1181)))))

(assert (=> b!894190 call!39658))

(declare-fun lt!403981 () Unit!30406)

(assert (=> b!894190 (= lt!403981 lt!403988)))

(declare-fun b!894191 () Bool)

(declare-fun e!499434 () Bool)

(assert (=> b!894191 (= e!499434 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5009 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5009 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!894192 () Bool)

(assert (=> b!894192 (= e!499435 (not (= (bvand (extraKeys!5009 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!894193 () Bool)

(assert (=> b!894193 (= e!499434 call!39660)))

(declare-fun c!94367 () Bool)

(declare-fun bm!39657 () Bool)

(assert (=> bm!39657 (= call!39658 (contains!4350 call!39659 (ite c!94367 (select (arr!25186 (_keys!10027 thiss!1181)) (index!37640 lt!403984)) key!785)))))

(declare-fun b!894194 () Bool)

(assert (=> b!894194 (= c!94367 ((_ is Found!8817) lt!403984))))

(assert (=> b!894194 (= lt!403984 (seekEntry!0 key!785 (_keys!10027 thiss!1181) (mask!25883 thiss!1181)))))

(assert (=> b!894194 (= e!499435 e!499437)))

(declare-fun b!894195 () Bool)

(assert (=> b!894195 false))

(declare-fun lt!403976 () Unit!30406)

(declare-fun lt!403978 () Unit!30406)

(assert (=> b!894195 (= lt!403976 lt!403978)))

(declare-fun lt!403979 () SeekEntryResult!8817)

(declare-fun lt!403983 () (_ BitVec 32))

(assert (=> b!894195 (and ((_ is Found!8817) lt!403979) (= (index!37640 lt!403979) lt!403983))))

(assert (=> b!894195 (= lt!403979 (seekEntry!0 key!785 (_keys!10027 thiss!1181) (mask!25883 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52371 (_ BitVec 32)) Unit!30406)

(assert (=> b!894195 (= lt!403978 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403983 (_keys!10027 thiss!1181) (mask!25883 thiss!1181)))))

(declare-fun lt!403982 () Unit!30406)

(declare-fun lt!403980 () Unit!30406)

(assert (=> b!894195 (= lt!403982 lt!403980)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52371 (_ BitVec 32)) Bool)

(assert (=> b!894195 (arrayForallSeekEntryOrOpenFound!0 lt!403983 (_keys!10027 thiss!1181) (mask!25883 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30406)

(assert (=> b!894195 (= lt!403980 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10027 thiss!1181) (mask!25883 thiss!1181) #b00000000000000000000000000000000 lt!403983))))

(declare-fun arrayScanForKey!0 (array!52371 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894195 (= lt!403983 (arrayScanForKey!0 (_keys!10027 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!403977 () Unit!30406)

(declare-fun lt!403987 () Unit!30406)

(assert (=> b!894195 (= lt!403977 lt!403987)))

(assert (=> b!894195 e!499434))

(declare-fun c!94369 () Bool)

(assert (=> b!894195 (= c!94369 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!164 (array!52371 array!52373 (_ BitVec 32) (_ BitVec 32) V!29199 V!29199 (_ BitVec 64) Int) Unit!30406)

(assert (=> b!894195 (= lt!403987 (lemmaKeyInListMapIsInArray!164 (_keys!10027 thiss!1181) (_values!5300 thiss!1181) (mask!25883 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) key!785 (defaultEntry!5314 thiss!1181)))))

(declare-fun Unit!30410 () Unit!30406)

(assert (=> b!894195 (= e!499436 Unit!30410)))

(declare-fun b!894196 () Bool)

(declare-fun Unit!30411 () Unit!30406)

(assert (=> b!894196 (= e!499436 Unit!30411)))

(declare-fun b!894197 () Bool)

(assert (=> b!894197 (= e!499433 (not (= (bvand (extraKeys!5009 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!110619 c!94368) b!894197))

(assert (= (and d!110619 (not c!94368)) b!894189))

(assert (= (and b!894189 c!94370) b!894192))

(assert (= (and b!894189 (not c!94370)) b!894194))

(assert (= (and b!894194 c!94367) b!894190))

(assert (= (and b!894194 (not c!94367)) b!894188))

(assert (= (and b!894188 c!94371) b!894195))

(assert (= (and b!894188 (not c!94371)) b!894196))

(assert (= (and b!894195 c!94369) b!894193))

(assert (= (and b!894195 (not c!94369)) b!894191))

(assert (= (or b!894190 b!894193) bm!39655))

(assert (= (or b!894190 b!894188) bm!39656))

(assert (= (or b!894190 b!894188) bm!39657))

(assert (=> d!110619 m!832577))

(assert (=> d!110619 m!832577))

(declare-fun m!832663 () Bool)

(assert (=> d!110619 m!832663))

(assert (=> d!110619 m!832589))

(declare-fun m!832665 () Bool)

(assert (=> b!894195 m!832665))

(declare-fun m!832667 () Bool)

(assert (=> b!894195 m!832667))

(declare-fun m!832669 () Bool)

(assert (=> b!894195 m!832669))

(declare-fun m!832671 () Bool)

(assert (=> b!894195 m!832671))

(assert (=> b!894195 m!832587))

(declare-fun m!832673 () Bool)

(assert (=> b!894195 m!832673))

(assert (=> bm!39656 m!832645))

(assert (=> b!894194 m!832587))

(declare-fun m!832675 () Bool)

(assert (=> bm!39655 m!832675))

(declare-fun m!832677 () Bool)

(assert (=> b!894190 m!832677))

(declare-fun m!832679 () Bool)

(assert (=> b!894190 m!832679))

(declare-fun m!832681 () Bool)

(assert (=> bm!39657 m!832681))

(declare-fun m!832683 () Bool)

(assert (=> bm!39657 m!832683))

(assert (=> b!894075 d!110619))

(declare-fun d!110621 () Bool)

(declare-fun res!605312 () Bool)

(declare-fun e!499440 () Bool)

(assert (=> d!110621 (=> (not res!605312) (not e!499440))))

(declare-fun simpleValid!296 (LongMapFixedSize!4228) Bool)

(assert (=> d!110621 (= res!605312 (simpleValid!296 thiss!1181))))

(assert (=> d!110621 (= (valid!1647 thiss!1181) e!499440)))

(declare-fun b!894204 () Bool)

(declare-fun res!605313 () Bool)

(assert (=> b!894204 (=> (not res!605313) (not e!499440))))

(declare-fun arrayCountValidKeys!0 (array!52371 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894204 (= res!605313 (= (arrayCountValidKeys!0 (_keys!10027 thiss!1181) #b00000000000000000000000000000000 (size!25631 (_keys!10027 thiss!1181))) (_size!2169 thiss!1181)))))

(declare-fun b!894205 () Bool)

(declare-fun res!605314 () Bool)

(assert (=> b!894205 (=> (not res!605314) (not e!499440))))

(assert (=> b!894205 (= res!605314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10027 thiss!1181) (mask!25883 thiss!1181)))))

(declare-fun b!894206 () Bool)

(declare-datatypes ((List!17748 0))(
  ( (Nil!17745) (Cons!17744 (h!18881 (_ BitVec 64)) (t!25057 List!17748)) )
))
(declare-fun arrayNoDuplicates!0 (array!52371 (_ BitVec 32) List!17748) Bool)

(assert (=> b!894206 (= e!499440 (arrayNoDuplicates!0 (_keys!10027 thiss!1181) #b00000000000000000000000000000000 Nil!17745))))

(assert (= (and d!110621 res!605312) b!894204))

(assert (= (and b!894204 res!605313) b!894205))

(assert (= (and b!894205 res!605314) b!894206))

(declare-fun m!832685 () Bool)

(assert (=> d!110621 m!832685))

(declare-fun m!832687 () Bool)

(assert (=> b!894204 m!832687))

(declare-fun m!832689 () Bool)

(assert (=> b!894205 m!832689))

(declare-fun m!832691 () Bool)

(assert (=> b!894206 m!832691))

(assert (=> start!76080 d!110621))

(declare-fun condMapEmpty!28829 () Bool)

(declare-fun mapDefault!28829 () ValueCell!8606)

(assert (=> mapNonEmpty!28820 (= condMapEmpty!28829 (= mapRest!28820 ((as const (Array (_ BitVec 32) ValueCell!8606)) mapDefault!28829)))))

(declare-fun e!499445 () Bool)

(declare-fun mapRes!28829 () Bool)

(assert (=> mapNonEmpty!28820 (= tp!55513 (and e!499445 mapRes!28829))))

(declare-fun mapIsEmpty!28829 () Bool)

(assert (=> mapIsEmpty!28829 mapRes!28829))

(declare-fun b!894214 () Bool)

(assert (=> b!894214 (= e!499445 tp_is_empty!18175)))

(declare-fun mapNonEmpty!28829 () Bool)

(declare-fun tp!55529 () Bool)

(declare-fun e!499446 () Bool)

(assert (=> mapNonEmpty!28829 (= mapRes!28829 (and tp!55529 e!499446))))

(declare-fun mapRest!28829 () (Array (_ BitVec 32) ValueCell!8606))

(declare-fun mapValue!28829 () ValueCell!8606)

(declare-fun mapKey!28829 () (_ BitVec 32))

(assert (=> mapNonEmpty!28829 (= mapRest!28820 (store mapRest!28829 mapKey!28829 mapValue!28829))))

(declare-fun b!894213 () Bool)

(assert (=> b!894213 (= e!499446 tp_is_empty!18175)))

(assert (= (and mapNonEmpty!28820 condMapEmpty!28829) mapIsEmpty!28829))

(assert (= (and mapNonEmpty!28820 (not condMapEmpty!28829)) mapNonEmpty!28829))

(assert (= (and mapNonEmpty!28829 ((_ is ValueCellFull!8606) mapValue!28829)) b!894213))

(assert (= (and mapNonEmpty!28820 ((_ is ValueCellFull!8606) mapDefault!28829)) b!894214))

(declare-fun m!832693 () Bool)

(assert (=> mapNonEmpty!28829 m!832693))

(check-sat (not bm!39657) (not b!894204) (not b!894194) (not bm!39656) (not d!110617) b_and!26119 (not d!110611) (not d!110619) (not b!894206) tp_is_empty!18175 (not b!894205) (not mapNonEmpty!28829) (not b!894162) (not d!110607) (not bm!39655) (not b!894149) (not d!110615) (not b!894190) (not b_next!15847) (not d!110621) (not b!894195) (not b!894145))
(check-sat b_and!26119 (not b_next!15847))
