; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3214 () Bool)

(assert start!3214)

(declare-fun b!19522 () Bool)

(declare-fun b_free!685 () Bool)

(declare-fun b_next!685 () Bool)

(assert (=> b!19522 (= b_free!685 (not b_next!685))))

(declare-fun tp!3271 () Bool)

(declare-fun b_and!1339 () Bool)

(assert (=> b!19522 (= tp!3271 b_and!1339)))

(declare-fun b!19519 () Bool)

(declare-fun e!12640 () Bool)

(declare-fun tp_is_empty!949 () Bool)

(assert (=> b!19519 (= e!12640 tp_is_empty!949)))

(declare-fun b!19520 () Bool)

(declare-fun e!12636 () Bool)

(declare-fun e!12638 () Bool)

(assert (=> b!19520 (= e!12636 e!12638)))

(declare-fun b!19521 () Bool)

(declare-fun e!12634 () Bool)

(declare-datatypes ((V!1091 0))(
  ( (V!1092 (val!501 Int)) )
))
(declare-datatypes ((array!1097 0))(
  ( (array!1098 (arr!524 (Array (_ BitVec 32) (_ BitVec 64))) (size!617 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!275 0))(
  ( (ValueCellFull!275 (v!1518 V!1091)) (EmptyCell!275) )
))
(declare-datatypes ((array!1099 0))(
  ( (array!1100 (arr!525 (Array (_ BitVec 32) ValueCell!275)) (size!618 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!136 0))(
  ( (LongMapFixedSize!137 (defaultEntry!1687 Int) (mask!4641 (_ BitVec 32)) (extraKeys!1597 (_ BitVec 32)) (zeroValue!1621 V!1091) (minValue!1621 V!1091) (_size!102 (_ BitVec 32)) (_keys!3115 array!1097) (_values!1683 array!1099) (_vacant!102 (_ BitVec 32))) )
))
(declare-fun lt!5433 () LongMapFixedSize!136)

(declare-fun valid!75 (LongMapFixedSize!136) Bool)

(assert (=> b!19521 (= e!12634 (not (valid!75 lt!5433)))))

(declare-fun e!12642 () Bool)

(declare-datatypes ((Cell!136 0))(
  ( (Cell!137 (v!1519 LongMapFixedSize!136)) )
))
(declare-datatypes ((LongMap!136 0))(
  ( (LongMap!137 (underlying!79 Cell!136)) )
))
(declare-fun thiss!938 () LongMap!136)

(declare-fun array_inv!375 (array!1097) Bool)

(declare-fun array_inv!376 (array!1099) Bool)

(assert (=> b!19522 (= e!12638 (and tp!3271 tp_is_empty!949 (array_inv!375 (_keys!3115 (v!1519 (underlying!79 thiss!938)))) (array_inv!376 (_values!1683 (v!1519 (underlying!79 thiss!938)))) e!12642))))

(declare-fun b!19523 () Bool)

(declare-fun e!12639 () Bool)

(declare-fun mapRes!883 () Bool)

(assert (=> b!19523 (= e!12642 (and e!12639 mapRes!883))))

(declare-fun condMapEmpty!883 () Bool)

(declare-fun mapDefault!883 () ValueCell!275)

(assert (=> b!19523 (= condMapEmpty!883 (= (arr!525 (_values!1683 (v!1519 (underlying!79 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!275)) mapDefault!883)))))

(declare-fun mapIsEmpty!883 () Bool)

(assert (=> mapIsEmpty!883 mapRes!883))

(declare-fun res!13203 () Bool)

(declare-fun e!12635 () Bool)

(assert (=> start!3214 (=> (not res!13203) (not e!12635))))

(declare-fun valid!76 (LongMap!136) Bool)

(assert (=> start!3214 (= res!13203 (valid!76 thiss!938))))

(assert (=> start!3214 e!12635))

(declare-fun e!12637 () Bool)

(assert (=> start!3214 e!12637))

(declare-fun b!19524 () Bool)

(assert (=> b!19524 (= e!12635 e!12634)))

(declare-fun res!13202 () Bool)

(assert (=> b!19524 (=> (not res!13202) (not e!12634))))

(assert (=> b!19524 (= res!13202 (and (not (= (bvand (extraKeys!1597 (v!1519 (underlying!79 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1597 (v!1519 (underlying!79 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun getNewLongMapFixedSize!10 ((_ BitVec 32) Int) LongMapFixedSize!136)

(declare-fun computeNewMask!5 (LongMap!136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19524 (= lt!5433 (getNewLongMapFixedSize!10 (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) (defaultEntry!1687 (v!1519 (underlying!79 thiss!938)))))))

(declare-fun b!19525 () Bool)

(assert (=> b!19525 (= e!12639 tp_is_empty!949)))

(declare-fun mapNonEmpty!883 () Bool)

(declare-fun tp!3270 () Bool)

(assert (=> mapNonEmpty!883 (= mapRes!883 (and tp!3270 e!12640))))

(declare-fun mapRest!883 () (Array (_ BitVec 32) ValueCell!275))

(declare-fun mapKey!883 () (_ BitVec 32))

(declare-fun mapValue!883 () ValueCell!275)

(assert (=> mapNonEmpty!883 (= (arr!525 (_values!1683 (v!1519 (underlying!79 thiss!938)))) (store mapRest!883 mapKey!883 mapValue!883))))

(declare-fun b!19526 () Bool)

(assert (=> b!19526 (= e!12637 e!12636)))

(assert (= (and start!3214 res!13203) b!19524))

(assert (= (and b!19524 res!13202) b!19521))

(assert (= (and b!19523 condMapEmpty!883) mapIsEmpty!883))

(assert (= (and b!19523 (not condMapEmpty!883)) mapNonEmpty!883))

(get-info :version)

(assert (= (and mapNonEmpty!883 ((_ is ValueCellFull!275) mapValue!883)) b!19519))

(assert (= (and b!19523 ((_ is ValueCellFull!275) mapDefault!883)) b!19525))

(assert (= b!19522 b!19523))

(assert (= b!19520 b!19522))

(assert (= b!19526 b!19520))

(assert (= start!3214 b!19526))

(declare-fun m!13705 () Bool)

(assert (=> start!3214 m!13705))

(declare-fun m!13707 () Bool)

(assert (=> mapNonEmpty!883 m!13707))

(declare-fun m!13709 () Bool)

(assert (=> b!19524 m!13709))

(assert (=> b!19524 m!13709))

(declare-fun m!13711 () Bool)

(assert (=> b!19524 m!13711))

(declare-fun m!13713 () Bool)

(assert (=> b!19522 m!13713))

(declare-fun m!13715 () Bool)

(assert (=> b!19522 m!13715))

(declare-fun m!13717 () Bool)

(assert (=> b!19521 m!13717))

(check-sat (not b!19524) (not start!3214) (not mapNonEmpty!883) (not b_next!685) (not b!19521) (not b!19522) tp_is_empty!949 b_and!1339)
(check-sat b_and!1339 (not b_next!685))
(get-model)

(declare-fun d!3587 () Bool)

(assert (=> d!3587 (= (array_inv!375 (_keys!3115 (v!1519 (underlying!79 thiss!938)))) (bvsge (size!617 (_keys!3115 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19522 d!3587))

(declare-fun d!3589 () Bool)

(assert (=> d!3589 (= (array_inv!376 (_values!1683 (v!1519 (underlying!79 thiss!938)))) (bvsge (size!618 (_values!1683 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19522 d!3589))

(declare-fun b!19588 () Bool)

(declare-fun e!12704 () Bool)

(declare-fun lt!5487 () array!1097)

(declare-datatypes ((tuple2!826 0))(
  ( (tuple2!827 (_1!416 (_ BitVec 64)) (_2!416 V!1091)) )
))
(declare-fun lt!5496 () tuple2!826)

(declare-fun arrayContainsKey!0 (array!1097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19588 (= e!12704 (arrayContainsKey!0 lt!5487 (_1!416 lt!5496) #b00000000000000000000000000000000))))

(declare-fun b!19589 () Bool)

(declare-fun res!13221 () Bool)

(declare-fun e!12703 () Bool)

(assert (=> b!19589 (=> (not res!13221) (not e!12703))))

(declare-fun lt!5492 () LongMapFixedSize!136)

(assert (=> b!19589 (= res!13221 (= (mask!4641 lt!5492) (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938))))))))

(declare-fun b!19590 () Bool)

(declare-fun lt!5504 () (_ BitVec 32))

(assert (=> b!19590 (= e!12704 (ite (= (_1!416 lt!5496) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5504 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5504 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!19591 () Bool)

(declare-datatypes ((Unit!399 0))(
  ( (Unit!400) )
))
(declare-fun e!12705 () Unit!399)

(declare-fun Unit!401 () Unit!399)

(assert (=> b!19591 (= e!12705 Unit!401)))

(declare-fun b!19592 () Bool)

(declare-fun Unit!402 () Unit!399)

(assert (=> b!19592 (= e!12705 Unit!402)))

(declare-fun lt!5489 () LongMapFixedSize!136)

(declare-datatypes ((List!544 0))(
  ( (Nil!541) (Cons!540 (h!1106 tuple2!826) (t!3183 List!544)) )
))
(declare-fun head!818 (List!544) tuple2!826)

(declare-datatypes ((ListLongMap!543 0))(
  ( (ListLongMap!544 (toList!287 List!544)) )
))
(declare-fun map!374 (LongMapFixedSize!136) ListLongMap!543)

(assert (=> b!19592 (= lt!5496 (head!818 (toList!287 (map!374 lt!5489))))))

(assert (=> b!19592 (= lt!5487 (array!1098 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!19592 (= lt!5504 #b00000000000000000000000000000000)))

(declare-fun lt!5505 () Unit!399)

(declare-fun lemmaKeyInListMapIsInArray!87 (array!1097 array!1099 (_ BitVec 32) (_ BitVec 32) V!1091 V!1091 (_ BitVec 64) Int) Unit!399)

(declare-fun dynLambda!130 (Int (_ BitVec 64)) V!1091)

(assert (=> b!19592 (= lt!5505 (lemmaKeyInListMapIsInArray!87 lt!5487 (array!1100 ((as const (Array (_ BitVec 32) ValueCell!275)) EmptyCell!275) (bvadd (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) lt!5504 (dynLambda!130 (defaultEntry!1687 (v!1519 (underlying!79 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!130 (defaultEntry!1687 (v!1519 (underlying!79 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!416 lt!5496) (defaultEntry!1687 (v!1519 (underlying!79 thiss!938)))))))

(declare-fun c!2077 () Bool)

(assert (=> b!19592 (= c!2077 (and (not (= (_1!416 lt!5496) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!416 lt!5496) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!19592 e!12704))

(declare-fun lt!5491 () Unit!399)

(assert (=> b!19592 (= lt!5491 lt!5505)))

(declare-fun lt!5503 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1097 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19592 (= lt!5503 (arrayScanForKey!0 (array!1098 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)) (_1!416 lt!5496) #b00000000000000000000000000000000))))

(assert (=> b!19592 false))

(declare-fun d!3591 () Bool)

(assert (=> d!3591 e!12703))

(declare-fun res!13220 () Bool)

(assert (=> d!3591 (=> (not res!13220) (not e!12703))))

(assert (=> d!3591 (= res!13220 (valid!75 lt!5492))))

(assert (=> d!3591 (= lt!5492 lt!5489)))

(declare-fun lt!5498 () Unit!399)

(assert (=> d!3591 (= lt!5498 e!12705)))

(declare-fun c!2078 () Bool)

(assert (=> d!3591 (= c!2078 (not (= (map!374 lt!5489) (ListLongMap!544 Nil!541))))))

(declare-fun lt!5497 () Unit!399)

(declare-fun lt!5495 () Unit!399)

(assert (=> d!3591 (= lt!5497 lt!5495)))

(declare-fun lt!5486 () array!1097)

(declare-fun lt!5507 () (_ BitVec 32))

(declare-datatypes ((List!545 0))(
  ( (Nil!542) (Cons!541 (h!1107 (_ BitVec 64)) (t!3184 List!545)) )
))
(declare-fun lt!5502 () List!545)

(declare-fun arrayNoDuplicates!0 (array!1097 (_ BitVec 32) List!545) Bool)

(assert (=> d!3591 (arrayNoDuplicates!0 lt!5486 lt!5507 lt!5502)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1097 (_ BitVec 32) (_ BitVec 32) List!545) Unit!399)

(assert (=> d!3591 (= lt!5495 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5486 lt!5507 (bvadd (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000001) lt!5502))))

(assert (=> d!3591 (= lt!5502 Nil!542)))

(assert (=> d!3591 (= lt!5507 #b00000000000000000000000000000000)))

(assert (=> d!3591 (= lt!5486 (array!1098 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5493 () Unit!399)

(declare-fun lt!5501 () Unit!399)

(assert (=> d!3591 (= lt!5493 lt!5501)))

(declare-fun lt!5499 () (_ BitVec 32))

(declare-fun lt!5506 () array!1097)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1097 (_ BitVec 32)) Bool)

(assert (=> d!3591 (arrayForallSeekEntryOrOpenFound!0 lt!5499 lt!5506 (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1097 (_ BitVec 32) (_ BitVec 32)) Unit!399)

(assert (=> d!3591 (= lt!5501 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5506 (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) lt!5499))))

(assert (=> d!3591 (= lt!5499 #b00000000000000000000000000000000)))

(assert (=> d!3591 (= lt!5506 (array!1098 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5494 () Unit!399)

(declare-fun lt!5490 () Unit!399)

(assert (=> d!3591 (= lt!5494 lt!5490)))

(declare-fun lt!5500 () array!1097)

(declare-fun lt!5488 () (_ BitVec 32))

(declare-fun lt!5508 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1097 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3591 (= (arrayCountValidKeys!0 lt!5500 lt!5488 lt!5508) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1097 (_ BitVec 32) (_ BitVec 32)) Unit!399)

(assert (=> d!3591 (= lt!5490 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5500 lt!5488 lt!5508))))

(assert (=> d!3591 (= lt!5508 (bvadd (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3591 (= lt!5488 #b00000000000000000000000000000000)))

(assert (=> d!3591 (= lt!5500 (array!1098 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3591 (= lt!5489 (LongMapFixedSize!137 (defaultEntry!1687 (v!1519 (underlying!79 thiss!938))) (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!130 (defaultEntry!1687 (v!1519 (underlying!79 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!130 (defaultEntry!1687 (v!1519 (underlying!79 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1098 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)) (array!1100 ((as const (Array (_ BitVec 32) ValueCell!275)) EmptyCell!275) (bvadd (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3591 (validMask!0 (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))))))

(assert (=> d!3591 (= (getNewLongMapFixedSize!10 (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) (defaultEntry!1687 (v!1519 (underlying!79 thiss!938)))) lt!5492)))

(declare-fun b!19587 () Bool)

(assert (=> b!19587 (= e!12703 (= (map!374 lt!5492) (ListLongMap!544 Nil!541)))))

(assert (= (and d!3591 c!2078) b!19592))

(assert (= (and d!3591 (not c!2078)) b!19591))

(assert (= (and b!19592 c!2077) b!19588))

(assert (= (and b!19592 (not c!2077)) b!19590))

(assert (= (and d!3591 res!13220) b!19589))

(assert (= (and b!19589 res!13221) b!19587))

(declare-fun b_lambda!1453 () Bool)

(assert (=> (not b_lambda!1453) (not b!19592)))

(declare-fun t!3182 () Bool)

(declare-fun tb!625 () Bool)

(assert (=> (and b!19522 (= (defaultEntry!1687 (v!1519 (underlying!79 thiss!938))) (defaultEntry!1687 (v!1519 (underlying!79 thiss!938)))) t!3182) tb!625))

(declare-fun result!1021 () Bool)

(assert (=> tb!625 (= result!1021 tp_is_empty!949)))

(assert (=> b!19592 t!3182))

(declare-fun b_and!1345 () Bool)

(assert (= b_and!1339 (and (=> t!3182 result!1021) b_and!1345)))

(declare-fun b_lambda!1455 () Bool)

(assert (=> (not b_lambda!1455) (not d!3591)))

(assert (=> d!3591 t!3182))

(declare-fun b_and!1347 () Bool)

(assert (= b_and!1345 (and (=> t!3182 result!1021) b_and!1347)))

(declare-fun m!13747 () Bool)

(assert (=> b!19588 m!13747))

(declare-fun m!13749 () Bool)

(assert (=> b!19592 m!13749))

(declare-fun m!13751 () Bool)

(assert (=> b!19592 m!13751))

(assert (=> b!19592 m!13709))

(assert (=> b!19592 m!13749))

(assert (=> b!19592 m!13749))

(declare-fun m!13753 () Bool)

(assert (=> b!19592 m!13753))

(declare-fun m!13755 () Bool)

(assert (=> b!19592 m!13755))

(declare-fun m!13757 () Bool)

(assert (=> b!19592 m!13757))

(declare-fun m!13759 () Bool)

(assert (=> d!3591 m!13759))

(assert (=> d!3591 m!13709))

(declare-fun m!13761 () Bool)

(assert (=> d!3591 m!13761))

(declare-fun m!13763 () Bool)

(assert (=> d!3591 m!13763))

(declare-fun m!13765 () Bool)

(assert (=> d!3591 m!13765))

(declare-fun m!13767 () Bool)

(assert (=> d!3591 m!13767))

(declare-fun m!13769 () Bool)

(assert (=> d!3591 m!13769))

(assert (=> d!3591 m!13755))

(assert (=> d!3591 m!13709))

(declare-fun m!13771 () Bool)

(assert (=> d!3591 m!13771))

(assert (=> d!3591 m!13749))

(assert (=> d!3591 m!13709))

(declare-fun m!13773 () Bool)

(assert (=> d!3591 m!13773))

(declare-fun m!13775 () Bool)

(assert (=> b!19587 m!13775))

(assert (=> b!19524 d!3591))

(declare-fun d!3593 () Bool)

(declare-fun e!12711 () Bool)

(assert (=> d!3593 e!12711))

(declare-fun res!13224 () Bool)

(assert (=> d!3593 (=> (not res!13224) (not e!12711))))

(declare-fun lt!5513 () (_ BitVec 32))

(assert (=> d!3593 (= res!13224 (validMask!0 lt!5513))))

(declare-datatypes ((tuple2!828 0))(
  ( (tuple2!829 (_1!417 Unit!399) (_2!417 (_ BitVec 32))) )
))
(declare-fun e!12710 () tuple2!828)

(assert (=> d!3593 (= lt!5513 (_2!417 e!12710))))

(declare-fun c!2081 () Bool)

(declare-fun lt!5514 () tuple2!828)

(assert (=> d!3593 (= c!2081 (and (bvsgt (_2!417 lt!5514) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!102 (v!1519 (underlying!79 thiss!938)))) (_2!417 lt!5514)) (bvsge (bvadd (bvand (bvashr (_2!417 lt!5514) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!102 (v!1519 (underlying!79 thiss!938))))))))

(declare-fun Unit!403 () Unit!399)

(declare-fun Unit!404 () Unit!399)

(assert (=> d!3593 (= lt!5514 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!102 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))))) (mask!4641 (v!1519 (underlying!79 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!102 (v!1519 (underlying!79 thiss!938)))) (mask!4641 (v!1519 (underlying!79 thiss!938))))) (tuple2!829 Unit!403 (bvand (bvadd (bvshl (mask!4641 (v!1519 (underlying!79 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!829 Unit!404 (mask!4641 (v!1519 (underlying!79 thiss!938))))))))

(assert (=> d!3593 (validMask!0 (mask!4641 (v!1519 (underlying!79 thiss!938))))))

(assert (=> d!3593 (= (computeNewMask!5 thiss!938 (mask!4641 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (_size!102 (v!1519 (underlying!79 thiss!938)))) lt!5513)))

(declare-fun b!19601 () Bool)

(declare-fun computeNewMaskWhile!4 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!828)

(assert (=> b!19601 (= e!12710 (computeNewMaskWhile!4 (_size!102 (v!1519 (underlying!79 thiss!938))) (_vacant!102 (v!1519 (underlying!79 thiss!938))) (mask!4641 (v!1519 (underlying!79 thiss!938))) (_2!417 lt!5514)))))

(declare-fun b!19602 () Bool)

(declare-fun Unit!405 () Unit!399)

(assert (=> b!19602 (= e!12710 (tuple2!829 Unit!405 (_2!417 lt!5514)))))

(declare-fun b!19603 () Bool)

(assert (=> b!19603 (= e!12711 (bvsle (_size!102 (v!1519 (underlying!79 thiss!938))) (bvadd lt!5513 #b00000000000000000000000000000001)))))

(assert (= (and d!3593 c!2081) b!19601))

(assert (= (and d!3593 (not c!2081)) b!19602))

(assert (= (and d!3593 res!13224) b!19603))

(declare-fun m!13777 () Bool)

(assert (=> d!3593 m!13777))

(declare-fun m!13779 () Bool)

(assert (=> d!3593 m!13779))

(declare-fun m!13781 () Bool)

(assert (=> b!19601 m!13781))

(assert (=> b!19524 d!3593))

(declare-fun d!3595 () Bool)

(declare-fun res!13231 () Bool)

(declare-fun e!12714 () Bool)

(assert (=> d!3595 (=> (not res!13231) (not e!12714))))

(declare-fun simpleValid!13 (LongMapFixedSize!136) Bool)

(assert (=> d!3595 (= res!13231 (simpleValid!13 lt!5433))))

(assert (=> d!3595 (= (valid!75 lt!5433) e!12714)))

(declare-fun b!19610 () Bool)

(declare-fun res!13232 () Bool)

(assert (=> b!19610 (=> (not res!13232) (not e!12714))))

(assert (=> b!19610 (= res!13232 (= (arrayCountValidKeys!0 (_keys!3115 lt!5433) #b00000000000000000000000000000000 (size!617 (_keys!3115 lt!5433))) (_size!102 lt!5433)))))

(declare-fun b!19611 () Bool)

(declare-fun res!13233 () Bool)

(assert (=> b!19611 (=> (not res!13233) (not e!12714))))

(assert (=> b!19611 (= res!13233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3115 lt!5433) (mask!4641 lt!5433)))))

(declare-fun b!19612 () Bool)

(assert (=> b!19612 (= e!12714 (arrayNoDuplicates!0 (_keys!3115 lt!5433) #b00000000000000000000000000000000 Nil!542))))

(assert (= (and d!3595 res!13231) b!19610))

(assert (= (and b!19610 res!13232) b!19611))

(assert (= (and b!19611 res!13233) b!19612))

(declare-fun m!13783 () Bool)

(assert (=> d!3595 m!13783))

(declare-fun m!13785 () Bool)

(assert (=> b!19610 m!13785))

(declare-fun m!13787 () Bool)

(assert (=> b!19611 m!13787))

(declare-fun m!13789 () Bool)

(assert (=> b!19612 m!13789))

(assert (=> b!19521 d!3595))

(declare-fun d!3597 () Bool)

(assert (=> d!3597 (= (valid!76 thiss!938) (valid!75 (v!1519 (underlying!79 thiss!938))))))

(declare-fun bs!876 () Bool)

(assert (= bs!876 d!3597))

(declare-fun m!13791 () Bool)

(assert (=> bs!876 m!13791))

(assert (=> start!3214 d!3597))

(declare-fun mapIsEmpty!892 () Bool)

(declare-fun mapRes!892 () Bool)

(assert (=> mapIsEmpty!892 mapRes!892))

(declare-fun b!19619 () Bool)

(declare-fun e!12719 () Bool)

(assert (=> b!19619 (= e!12719 tp_is_empty!949)))

(declare-fun mapNonEmpty!892 () Bool)

(declare-fun tp!3286 () Bool)

(assert (=> mapNonEmpty!892 (= mapRes!892 (and tp!3286 e!12719))))

(declare-fun mapValue!892 () ValueCell!275)

(declare-fun mapRest!892 () (Array (_ BitVec 32) ValueCell!275))

(declare-fun mapKey!892 () (_ BitVec 32))

(assert (=> mapNonEmpty!892 (= mapRest!883 (store mapRest!892 mapKey!892 mapValue!892))))

(declare-fun b!19620 () Bool)

(declare-fun e!12720 () Bool)

(assert (=> b!19620 (= e!12720 tp_is_empty!949)))

(declare-fun condMapEmpty!892 () Bool)

(declare-fun mapDefault!892 () ValueCell!275)

(assert (=> mapNonEmpty!883 (= condMapEmpty!892 (= mapRest!883 ((as const (Array (_ BitVec 32) ValueCell!275)) mapDefault!892)))))

(assert (=> mapNonEmpty!883 (= tp!3270 (and e!12720 mapRes!892))))

(assert (= (and mapNonEmpty!883 condMapEmpty!892) mapIsEmpty!892))

(assert (= (and mapNonEmpty!883 (not condMapEmpty!892)) mapNonEmpty!892))

(assert (= (and mapNonEmpty!892 ((_ is ValueCellFull!275) mapValue!892)) b!19619))

(assert (= (and mapNonEmpty!883 ((_ is ValueCellFull!275) mapDefault!892)) b!19620))

(declare-fun m!13793 () Bool)

(assert (=> mapNonEmpty!892 m!13793))

(declare-fun b_lambda!1457 () Bool)

(assert (= b_lambda!1455 (or (and b!19522 b_free!685) b_lambda!1457)))

(declare-fun b_lambda!1459 () Bool)

(assert (= b_lambda!1453 (or (and b!19522 b_free!685) b_lambda!1459)))

(check-sat (not b!19611) (not mapNonEmpty!892) b_and!1347 (not b!19612) (not d!3591) (not b!19610) (not b!19592) (not b!19587) (not b!19601) (not d!3595) (not d!3597) (not b_next!685) (not b_lambda!1457) (not b_lambda!1459) (not d!3593) tp_is_empty!949 (not b!19588))
(check-sat b_and!1347 (not b_next!685))
