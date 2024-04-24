; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76290 () Bool)

(assert start!76290)

(declare-fun b!895274 () Bool)

(declare-fun b_free!15865 () Bool)

(declare-fun b_next!15865 () Bool)

(assert (=> b!895274 (= b_free!15865 (not b_next!15865))))

(declare-fun tp!55581 () Bool)

(declare-fun b_and!26161 () Bool)

(assert (=> b!895274 (= tp!55581 b_and!26161)))

(declare-fun b!895269 () Bool)

(declare-fun e!500119 () Bool)

(declare-fun tp_is_empty!18193 () Bool)

(assert (=> b!895269 (= e!500119 tp_is_empty!18193)))

(declare-fun mapNonEmpty!28860 () Bool)

(declare-fun mapRes!28860 () Bool)

(declare-fun tp!55580 () Bool)

(declare-fun e!500120 () Bool)

(assert (=> mapNonEmpty!28860 (= mapRes!28860 (and tp!55580 e!500120))))

(declare-fun mapKey!28860 () (_ BitVec 32))

(declare-datatypes ((V!29223 0))(
  ( (V!29224 (val!9147 Int)) )
))
(declare-datatypes ((ValueCell!8615 0))(
  ( (ValueCellFull!8615 (v!11631 V!29223)) (EmptyCell!8615) )
))
(declare-fun mapRest!28860 () (Array (_ BitVec 32) ValueCell!8615))

(declare-datatypes ((array!52413 0))(
  ( (array!52414 (arr!25204 (Array (_ BitVec 32) (_ BitVec 64))) (size!25651 (_ BitVec 32))) )
))
(declare-datatypes ((array!52415 0))(
  ( (array!52416 (arr!25205 (Array (_ BitVec 32) ValueCell!8615)) (size!25652 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4246 0))(
  ( (LongMapFixedSize!4247 (defaultEntry!5335 Int) (mask!25935 (_ BitVec 32)) (extraKeys!5031 (_ BitVec 32)) (zeroValue!5135 V!29223) (minValue!5135 V!29223) (_size!2178 (_ BitVec 32)) (_keys!10060 array!52413) (_values!5322 array!52415) (_vacant!2178 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4246)

(declare-fun mapValue!28860 () ValueCell!8615)

(assert (=> mapNonEmpty!28860 (= (arr!25205 (_values!5322 thiss!1181)) (store mapRest!28860 mapKey!28860 mapValue!28860))))

(declare-fun b!895270 () Bool)

(declare-fun e!500123 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun dynLambda!1317 (Int (_ BitVec 64)) V!29223)

(declare-datatypes ((Option!456 0))(
  ( (Some!455 (v!11632 V!29223)) (None!454) )
))
(declare-fun get!13289 (Option!456) V!29223)

(declare-datatypes ((tuple2!11940 0))(
  ( (tuple2!11941 (_1!5981 (_ BitVec 64)) (_2!5981 V!29223)) )
))
(declare-datatypes ((List!17755 0))(
  ( (Nil!17752) (Cons!17751 (h!18890 tuple2!11940) (t!25082 List!17755)) )
))
(declare-fun getValueByKey!450 (List!17755 (_ BitVec 64)) Option!456)

(declare-datatypes ((ListLongMap!10639 0))(
  ( (ListLongMap!10640 (toList!5335 List!17755)) )
))
(declare-fun map!12209 (LongMapFixedSize!4246) ListLongMap!10639)

(assert (=> b!895270 (= e!500123 (not (= (dynLambda!1317 (defaultEntry!5335 thiss!1181) key!785) (get!13289 (getValueByKey!450 (toList!5335 (map!12209 thiss!1181)) key!785)))))))

(declare-fun b!895271 () Bool)

(declare-fun res!605672 () Bool)

(assert (=> b!895271 (=> (not res!605672) (not e!500123))))

(assert (=> b!895271 (= res!605672 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!895272 () Bool)

(declare-fun res!605671 () Bool)

(assert (=> b!895272 (=> (not res!605671) (not e!500123))))

(declare-fun contains!4361 (LongMapFixedSize!4246 (_ BitVec 64)) Bool)

(assert (=> b!895272 (= res!605671 (contains!4361 thiss!1181 key!785))))

(declare-fun mapIsEmpty!28860 () Bool)

(assert (=> mapIsEmpty!28860 mapRes!28860))

(declare-fun res!605673 () Bool)

(assert (=> start!76290 (=> (not res!605673) (not e!500123))))

(declare-fun valid!1653 (LongMapFixedSize!4246) Bool)

(assert (=> start!76290 (= res!605673 (valid!1653 thiss!1181))))

(assert (=> start!76290 e!500123))

(declare-fun e!500121 () Bool)

(assert (=> start!76290 e!500121))

(assert (=> start!76290 true))

(declare-fun b!895273 () Bool)

(assert (=> b!895273 (= e!500120 tp_is_empty!18193)))

(declare-fun e!500124 () Bool)

(declare-fun array_inv!19840 (array!52413) Bool)

(declare-fun array_inv!19841 (array!52415) Bool)

(assert (=> b!895274 (= e!500121 (and tp!55581 tp_is_empty!18193 (array_inv!19840 (_keys!10060 thiss!1181)) (array_inv!19841 (_values!5322 thiss!1181)) e!500124))))

(declare-fun b!895275 () Bool)

(assert (=> b!895275 (= e!500124 (and e!500119 mapRes!28860))))

(declare-fun condMapEmpty!28860 () Bool)

(declare-fun mapDefault!28860 () ValueCell!8615)

(assert (=> b!895275 (= condMapEmpty!28860 (= (arr!25205 (_values!5322 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8615)) mapDefault!28860)))))

(assert (= (and start!76290 res!605673) b!895271))

(assert (= (and b!895271 res!605672) b!895272))

(assert (= (and b!895272 res!605671) b!895270))

(assert (= (and b!895275 condMapEmpty!28860) mapIsEmpty!28860))

(assert (= (and b!895275 (not condMapEmpty!28860)) mapNonEmpty!28860))

(get-info :version)

(assert (= (and mapNonEmpty!28860 ((_ is ValueCellFull!8615) mapValue!28860)) b!895273))

(assert (= (and b!895275 ((_ is ValueCellFull!8615) mapDefault!28860)) b!895269))

(assert (= b!895274 b!895275))

(assert (= start!76290 b!895274))

(declare-fun b_lambda!12965 () Bool)

(assert (=> (not b_lambda!12965) (not b!895270)))

(declare-fun t!25081 () Bool)

(declare-fun tb!5177 () Bool)

(assert (=> (and b!895274 (= (defaultEntry!5335 thiss!1181) (defaultEntry!5335 thiss!1181)) t!25081) tb!5177))

(declare-fun result!10077 () Bool)

(assert (=> tb!5177 (= result!10077 tp_is_empty!18193)))

(assert (=> b!895270 t!25081))

(declare-fun b_and!26163 () Bool)

(assert (= b_and!26161 (and (=> t!25081 result!10077) b_and!26163)))

(declare-fun m!833743 () Bool)

(assert (=> b!895274 m!833743))

(declare-fun m!833745 () Bool)

(assert (=> b!895274 m!833745))

(declare-fun m!833747 () Bool)

(assert (=> start!76290 m!833747))

(declare-fun m!833749 () Bool)

(assert (=> b!895270 m!833749))

(declare-fun m!833751 () Bool)

(assert (=> b!895270 m!833751))

(declare-fun m!833753 () Bool)

(assert (=> b!895270 m!833753))

(assert (=> b!895270 m!833753))

(declare-fun m!833755 () Bool)

(assert (=> b!895270 m!833755))

(declare-fun m!833757 () Bool)

(assert (=> mapNonEmpty!28860 m!833757))

(declare-fun m!833759 () Bool)

(assert (=> b!895272 m!833759))

(check-sat (not mapNonEmpty!28860) (not b_lambda!12965) (not b!895270) b_and!26163 tp_is_empty!18193 (not start!76290) (not b!895272) (not b_next!15865) (not b!895274))
(check-sat b_and!26163 (not b_next!15865))
(get-model)

(declare-fun b_lambda!12971 () Bool)

(assert (= b_lambda!12965 (or (and b!895274 b_free!15865) b_lambda!12971)))

(check-sat (not mapNonEmpty!28860) (not b!895270) b_and!26163 tp_is_empty!18193 (not start!76290) (not b!895272) (not b_next!15865) (not b!895274) (not b_lambda!12971))
(check-sat b_and!26163 (not b_next!15865))
(get-model)

(declare-fun bm!39758 () Bool)

(declare-fun call!39762 () ListLongMap!10639)

(declare-fun getCurrentListMap!2609 (array!52413 array!52415 (_ BitVec 32) (_ BitVec 32) V!29223 V!29223 (_ BitVec 32) Int) ListLongMap!10639)

(assert (=> bm!39758 (= call!39762 (getCurrentListMap!2609 (_keys!10060 thiss!1181) (_values!5322 thiss!1181) (mask!25935 thiss!1181) (extraKeys!5031 thiss!1181) (zeroValue!5135 thiss!1181) (minValue!5135 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5335 thiss!1181)))))

(declare-fun b!895344 () Bool)

(declare-fun e!500175 () Bool)

(declare-fun e!500171 () Bool)

(assert (=> b!895344 (= e!500175 e!500171)))

(declare-fun c!94675 () Bool)

(assert (=> b!895344 (= c!94675 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!110961 () Bool)

(declare-fun lt!404637 () Bool)

(declare-fun contains!4364 (ListLongMap!10639 (_ BitVec 64)) Bool)

(assert (=> d!110961 (= lt!404637 (contains!4364 (map!12209 thiss!1181) key!785))))

(assert (=> d!110961 (= lt!404637 e!500175)))

(declare-fun c!94676 () Bool)

(assert (=> d!110961 (= c!94676 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110961 (valid!1653 thiss!1181)))

(assert (=> d!110961 (= (contains!4361 thiss!1181 key!785) lt!404637)))

(declare-fun b!895345 () Bool)

(declare-datatypes ((Unit!30436 0))(
  ( (Unit!30437) )
))
(declare-fun e!500174 () Unit!30436)

(declare-fun Unit!30438 () Unit!30436)

(assert (=> b!895345 (= e!500174 Unit!30438)))

(declare-fun bm!39759 () Bool)

(declare-fun call!39761 () Bool)

(declare-fun arrayContainsKey!0 (array!52413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39759 (= call!39761 (arrayContainsKey!0 (_keys!10060 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!895346 () Bool)

(declare-fun c!94674 () Bool)

(declare-datatypes ((SeekEntryResult!8821 0))(
  ( (MissingZero!8821 (index!37655 (_ BitVec 32))) (Found!8821 (index!37656 (_ BitVec 32))) (Intermediate!8821 (undefined!9633 Bool) (index!37657 (_ BitVec 32)) (x!76007 (_ BitVec 32))) (Undefined!8821) (MissingVacant!8821 (index!37658 (_ BitVec 32))) )
))
(declare-fun lt!404636 () SeekEntryResult!8821)

(assert (=> b!895346 (= c!94674 ((_ is Found!8821) lt!404636))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52413 (_ BitVec 32)) SeekEntryResult!8821)

(assert (=> b!895346 (= lt!404636 (seekEntry!0 key!785 (_keys!10060 thiss!1181) (mask!25935 thiss!1181)))))

(declare-fun e!500173 () Bool)

(assert (=> b!895346 (= e!500171 e!500173)))

(declare-fun call!39763 () Bool)

(declare-fun bm!39760 () Bool)

(assert (=> bm!39760 (= call!39763 (contains!4364 call!39762 (ite c!94674 (select (arr!25204 (_keys!10060 thiss!1181)) (index!37656 lt!404636)) key!785)))))

(declare-fun b!895347 () Bool)

(assert (=> b!895347 (= e!500175 (not (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!895348 () Bool)

(assert (=> b!895348 (= e!500173 true)))

(declare-fun lt!404638 () Unit!30436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52413 (_ BitVec 64) (_ BitVec 32)) Unit!30436)

(assert (=> b!895348 (= lt!404638 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10060 thiss!1181) key!785 (index!37656 lt!404636)))))

(assert (=> b!895348 call!39761))

(declare-fun lt!404643 () Unit!30436)

(assert (=> b!895348 (= lt!404643 lt!404638)))

(declare-fun lt!404645 () Unit!30436)

(declare-fun lemmaValidKeyInArrayIsInListMap!239 (array!52413 array!52415 (_ BitVec 32) (_ BitVec 32) V!29223 V!29223 (_ BitVec 32) Int) Unit!30436)

(assert (=> b!895348 (= lt!404645 (lemmaValidKeyInArrayIsInListMap!239 (_keys!10060 thiss!1181) (_values!5322 thiss!1181) (mask!25935 thiss!1181) (extraKeys!5031 thiss!1181) (zeroValue!5135 thiss!1181) (minValue!5135 thiss!1181) (index!37656 lt!404636) (defaultEntry!5335 thiss!1181)))))

(assert (=> b!895348 call!39763))

(declare-fun lt!404633 () Unit!30436)

(assert (=> b!895348 (= lt!404633 lt!404645)))

(declare-fun b!895349 () Bool)

(assert (=> b!895349 (= e!500171 (not (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!895350 () Bool)

(declare-fun e!500172 () Bool)

(assert (=> b!895350 (= e!500172 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!895351 () Bool)

(assert (=> b!895351 (= e!500173 false)))

(declare-fun c!94672 () Bool)

(assert (=> b!895351 (= c!94672 call!39763)))

(declare-fun lt!404634 () Unit!30436)

(assert (=> b!895351 (= lt!404634 e!500174)))

(declare-fun b!895352 () Bool)

(assert (=> b!895352 (= e!500172 call!39761)))

(declare-fun b!895353 () Bool)

(assert (=> b!895353 false))

(declare-fun lt!404632 () Unit!30436)

(declare-fun lt!404641 () Unit!30436)

(assert (=> b!895353 (= lt!404632 lt!404641)))

(declare-fun lt!404640 () SeekEntryResult!8821)

(declare-fun lt!404635 () (_ BitVec 32))

(assert (=> b!895353 (and ((_ is Found!8821) lt!404640) (= (index!37656 lt!404640) lt!404635))))

(assert (=> b!895353 (= lt!404640 (seekEntry!0 key!785 (_keys!10060 thiss!1181) (mask!25935 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52413 (_ BitVec 32)) Unit!30436)

(assert (=> b!895353 (= lt!404641 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!404635 (_keys!10060 thiss!1181) (mask!25935 thiss!1181)))))

(declare-fun lt!404639 () Unit!30436)

(declare-fun lt!404642 () Unit!30436)

(assert (=> b!895353 (= lt!404639 lt!404642)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52413 (_ BitVec 32)) Bool)

(assert (=> b!895353 (arrayForallSeekEntryOrOpenFound!0 lt!404635 (_keys!10060 thiss!1181) (mask!25935 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30436)

(assert (=> b!895353 (= lt!404642 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10060 thiss!1181) (mask!25935 thiss!1181) #b00000000000000000000000000000000 lt!404635))))

(declare-fun arrayScanForKey!0 (array!52413 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895353 (= lt!404635 (arrayScanForKey!0 (_keys!10060 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!404644 () Unit!30436)

(declare-fun lt!404631 () Unit!30436)

(assert (=> b!895353 (= lt!404644 lt!404631)))

(assert (=> b!895353 e!500172))

(declare-fun c!94673 () Bool)

(assert (=> b!895353 (= c!94673 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!167 (array!52413 array!52415 (_ BitVec 32) (_ BitVec 32) V!29223 V!29223 (_ BitVec 64) Int) Unit!30436)

(assert (=> b!895353 (= lt!404631 (lemmaKeyInListMapIsInArray!167 (_keys!10060 thiss!1181) (_values!5322 thiss!1181) (mask!25935 thiss!1181) (extraKeys!5031 thiss!1181) (zeroValue!5135 thiss!1181) (minValue!5135 thiss!1181) key!785 (defaultEntry!5335 thiss!1181)))))

(declare-fun Unit!30439 () Unit!30436)

(assert (=> b!895353 (= e!500174 Unit!30439)))

(assert (= (and d!110961 c!94676) b!895347))

(assert (= (and d!110961 (not c!94676)) b!895344))

(assert (= (and b!895344 c!94675) b!895349))

(assert (= (and b!895344 (not c!94675)) b!895346))

(assert (= (and b!895346 c!94674) b!895348))

(assert (= (and b!895346 (not c!94674)) b!895351))

(assert (= (and b!895351 c!94672) b!895353))

(assert (= (and b!895351 (not c!94672)) b!895345))

(assert (= (and b!895353 c!94673) b!895352))

(assert (= (and b!895353 (not c!94673)) b!895350))

(assert (= (or b!895348 b!895352) bm!39759))

(assert (= (or b!895348 b!895351) bm!39758))

(assert (= (or b!895348 b!895351) bm!39760))

(declare-fun m!833797 () Bool)

(assert (=> bm!39758 m!833797))

(declare-fun m!833799 () Bool)

(assert (=> bm!39760 m!833799))

(declare-fun m!833801 () Bool)

(assert (=> bm!39760 m!833801))

(declare-fun m!833803 () Bool)

(assert (=> b!895346 m!833803))

(declare-fun m!833805 () Bool)

(assert (=> b!895353 m!833805))

(declare-fun m!833807 () Bool)

(assert (=> b!895353 m!833807))

(declare-fun m!833809 () Bool)

(assert (=> b!895353 m!833809))

(declare-fun m!833811 () Bool)

(assert (=> b!895353 m!833811))

(assert (=> b!895353 m!833803))

(declare-fun m!833813 () Bool)

(assert (=> b!895353 m!833813))

(declare-fun m!833815 () Bool)

(assert (=> bm!39759 m!833815))

(assert (=> d!110961 m!833751))

(assert (=> d!110961 m!833751))

(declare-fun m!833817 () Bool)

(assert (=> d!110961 m!833817))

(assert (=> d!110961 m!833747))

(declare-fun m!833819 () Bool)

(assert (=> b!895348 m!833819))

(declare-fun m!833821 () Bool)

(assert (=> b!895348 m!833821))

(assert (=> b!895272 d!110961))

(declare-fun d!110963 () Bool)

(declare-fun res!605698 () Bool)

(declare-fun e!500178 () Bool)

(assert (=> d!110963 (=> (not res!605698) (not e!500178))))

(declare-fun simpleValid!299 (LongMapFixedSize!4246) Bool)

(assert (=> d!110963 (= res!605698 (simpleValid!299 thiss!1181))))

(assert (=> d!110963 (= (valid!1653 thiss!1181) e!500178)))

(declare-fun b!895360 () Bool)

(declare-fun res!605699 () Bool)

(assert (=> b!895360 (=> (not res!605699) (not e!500178))))

(declare-fun arrayCountValidKeys!0 (array!52413 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895360 (= res!605699 (= (arrayCountValidKeys!0 (_keys!10060 thiss!1181) #b00000000000000000000000000000000 (size!25651 (_keys!10060 thiss!1181))) (_size!2178 thiss!1181)))))

(declare-fun b!895361 () Bool)

(declare-fun res!605700 () Bool)

(assert (=> b!895361 (=> (not res!605700) (not e!500178))))

(assert (=> b!895361 (= res!605700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10060 thiss!1181) (mask!25935 thiss!1181)))))

(declare-fun b!895362 () Bool)

(declare-datatypes ((List!17758 0))(
  ( (Nil!17755) (Cons!17754 (h!18893 (_ BitVec 64)) (t!25089 List!17758)) )
))
(declare-fun arrayNoDuplicates!0 (array!52413 (_ BitVec 32) List!17758) Bool)

(assert (=> b!895362 (= e!500178 (arrayNoDuplicates!0 (_keys!10060 thiss!1181) #b00000000000000000000000000000000 Nil!17755))))

(assert (= (and d!110963 res!605698) b!895360))

(assert (= (and b!895360 res!605699) b!895361))

(assert (= (and b!895361 res!605700) b!895362))

(declare-fun m!833823 () Bool)

(assert (=> d!110963 m!833823))

(declare-fun m!833825 () Bool)

(assert (=> b!895360 m!833825))

(declare-fun m!833827 () Bool)

(assert (=> b!895361 m!833827))

(declare-fun m!833829 () Bool)

(assert (=> b!895362 m!833829))

(assert (=> start!76290 d!110963))

(declare-fun d!110965 () Bool)

(assert (=> d!110965 (= (get!13289 (getValueByKey!450 (toList!5335 (map!12209 thiss!1181)) key!785)) (v!11632 (getValueByKey!450 (toList!5335 (map!12209 thiss!1181)) key!785)))))

(assert (=> b!895270 d!110965))

(declare-fun b!895374 () Bool)

(declare-fun e!500184 () Option!456)

(assert (=> b!895374 (= e!500184 None!454)))

(declare-fun b!895373 () Bool)

(assert (=> b!895373 (= e!500184 (getValueByKey!450 (t!25082 (toList!5335 (map!12209 thiss!1181))) key!785))))

(declare-fun d!110967 () Bool)

(declare-fun c!94681 () Bool)

(assert (=> d!110967 (= c!94681 (and ((_ is Cons!17751) (toList!5335 (map!12209 thiss!1181))) (= (_1!5981 (h!18890 (toList!5335 (map!12209 thiss!1181)))) key!785)))))

(declare-fun e!500183 () Option!456)

(assert (=> d!110967 (= (getValueByKey!450 (toList!5335 (map!12209 thiss!1181)) key!785) e!500183)))

(declare-fun b!895372 () Bool)

(assert (=> b!895372 (= e!500183 e!500184)))

(declare-fun c!94682 () Bool)

(assert (=> b!895372 (= c!94682 (and ((_ is Cons!17751) (toList!5335 (map!12209 thiss!1181))) (not (= (_1!5981 (h!18890 (toList!5335 (map!12209 thiss!1181)))) key!785))))))

(declare-fun b!895371 () Bool)

(assert (=> b!895371 (= e!500183 (Some!455 (_2!5981 (h!18890 (toList!5335 (map!12209 thiss!1181))))))))

(assert (= (and d!110967 c!94681) b!895371))

(assert (= (and d!110967 (not c!94681)) b!895372))

(assert (= (and b!895372 c!94682) b!895373))

(assert (= (and b!895372 (not c!94682)) b!895374))

(declare-fun m!833831 () Bool)

(assert (=> b!895373 m!833831))

(assert (=> b!895270 d!110967))

(declare-fun d!110969 () Bool)

(assert (=> d!110969 (= (map!12209 thiss!1181) (getCurrentListMap!2609 (_keys!10060 thiss!1181) (_values!5322 thiss!1181) (mask!25935 thiss!1181) (extraKeys!5031 thiss!1181) (zeroValue!5135 thiss!1181) (minValue!5135 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5335 thiss!1181)))))

(declare-fun bs!25136 () Bool)

(assert (= bs!25136 d!110969))

(assert (=> bs!25136 m!833797))

(assert (=> b!895270 d!110969))

(declare-fun d!110971 () Bool)

(assert (=> d!110971 (= (array_inv!19840 (_keys!10060 thiss!1181)) (bvsge (size!25651 (_keys!10060 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895274 d!110971))

(declare-fun d!110973 () Bool)

(assert (=> d!110973 (= (array_inv!19841 (_values!5322 thiss!1181)) (bvsge (size!25652 (_values!5322 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895274 d!110973))

(declare-fun condMapEmpty!28869 () Bool)

(declare-fun mapDefault!28869 () ValueCell!8615)

(assert (=> mapNonEmpty!28860 (= condMapEmpty!28869 (= mapRest!28860 ((as const (Array (_ BitVec 32) ValueCell!8615)) mapDefault!28869)))))

(declare-fun e!500190 () Bool)

(declare-fun mapRes!28869 () Bool)

(assert (=> mapNonEmpty!28860 (= tp!55580 (and e!500190 mapRes!28869))))

(declare-fun b!895382 () Bool)

(assert (=> b!895382 (= e!500190 tp_is_empty!18193)))

(declare-fun b!895381 () Bool)

(declare-fun e!500189 () Bool)

(assert (=> b!895381 (= e!500189 tp_is_empty!18193)))

(declare-fun mapIsEmpty!28869 () Bool)

(assert (=> mapIsEmpty!28869 mapRes!28869))

(declare-fun mapNonEmpty!28869 () Bool)

(declare-fun tp!55596 () Bool)

(assert (=> mapNonEmpty!28869 (= mapRes!28869 (and tp!55596 e!500189))))

(declare-fun mapKey!28869 () (_ BitVec 32))

(declare-fun mapValue!28869 () ValueCell!8615)

(declare-fun mapRest!28869 () (Array (_ BitVec 32) ValueCell!8615))

(assert (=> mapNonEmpty!28869 (= mapRest!28860 (store mapRest!28869 mapKey!28869 mapValue!28869))))

(assert (= (and mapNonEmpty!28860 condMapEmpty!28869) mapIsEmpty!28869))

(assert (= (and mapNonEmpty!28860 (not condMapEmpty!28869)) mapNonEmpty!28869))

(assert (= (and mapNonEmpty!28869 ((_ is ValueCellFull!8615) mapValue!28869)) b!895381))

(assert (= (and mapNonEmpty!28860 ((_ is ValueCellFull!8615) mapDefault!28869)) b!895382))

(declare-fun m!833833 () Bool)

(assert (=> mapNonEmpty!28869 m!833833))

(check-sat (not d!110969) (not d!110961) (not b!895348) (not mapNonEmpty!28869) (not d!110963) (not b_next!15865) (not bm!39760) (not b!895346) (not b_lambda!12971) (not b!895360) (not b!895361) (not b!895373) b_and!26163 (not b!895353) (not b!895362) tp_is_empty!18193 (not bm!39758) (not bm!39759))
(check-sat b_and!26163 (not b_next!15865))
