; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15218 () Bool)

(assert start!15218)

(declare-fun b!146527 () Bool)

(declare-fun b_free!3133 () Bool)

(declare-fun b_next!3133 () Bool)

(assert (=> b!146527 (= b_free!3133 (not b_next!3133))))

(declare-fun tp!11903 () Bool)

(declare-fun b_and!9185 () Bool)

(assert (=> b!146527 (= tp!11903 b_and!9185)))

(declare-fun b!146529 () Bool)

(declare-fun b_free!3135 () Bool)

(declare-fun b_next!3135 () Bool)

(assert (=> b!146529 (= b_free!3135 (not b_next!3135))))

(declare-fun tp!11904 () Bool)

(declare-fun b_and!9187 () Bool)

(assert (=> b!146529 (= tp!11904 b_and!9187)))

(declare-datatypes ((V!3625 0))(
  ( (V!3626 (val!1536 Int)) )
))
(declare-datatypes ((array!4997 0))(
  ( (array!4998 (arr!2360 (Array (_ BitVec 32) (_ BitVec 64))) (size!2636 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1148 0))(
  ( (ValueCellFull!1148 (v!3363 V!3625)) (EmptyCell!1148) )
))
(declare-datatypes ((array!4999 0))(
  ( (array!5000 (arr!2361 (Array (_ BitVec 32) ValueCell!1148)) (size!2637 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1204 0))(
  ( (LongMapFixedSize!1205 (defaultEntry!3018 Int) (mask!7398 (_ BitVec 32)) (extraKeys!2763 (_ BitVec 32)) (zeroValue!2863 V!3625) (minValue!2863 V!3625) (_size!651 (_ BitVec 32)) (_keys!4787 array!4997) (_values!3001 array!4999) (_vacant!651 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!988 0))(
  ( (Cell!989 (v!3364 LongMapFixedSize!1204)) )
))
(declare-datatypes ((LongMap!988 0))(
  ( (LongMap!989 (underlying!505 Cell!988)) )
))
(declare-fun thiss!992 () LongMap!988)

(declare-fun e!95649 () Bool)

(declare-fun tp_is_empty!2983 () Bool)

(declare-fun e!95644 () Bool)

(declare-fun array_inv!1479 (array!4997) Bool)

(declare-fun array_inv!1480 (array!4999) Bool)

(assert (=> b!146527 (= e!95644 (and tp!11903 tp_is_empty!2983 (array_inv!1479 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (array_inv!1480 (_values!3001 (v!3364 (underlying!505 thiss!992)))) e!95649))))

(declare-fun b!146528 () Bool)

(declare-fun e!95639 () Bool)

(assert (=> b!146528 (= e!95639 tp_is_empty!2983)))

(declare-fun e!95640 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1204)

(declare-fun e!95641 () Bool)

(assert (=> b!146529 (= e!95641 (and tp!11904 tp_is_empty!2983 (array_inv!1479 (_keys!4787 newMap!16)) (array_inv!1480 (_values!3001 newMap!16)) e!95640))))

(declare-fun mapIsEmpty!5021 () Bool)

(declare-fun mapRes!5021 () Bool)

(assert (=> mapIsEmpty!5021 mapRes!5021))

(declare-fun b!146530 () Bool)

(declare-fun res!69697 () Bool)

(declare-fun e!95643 () Bool)

(assert (=> b!146530 (=> (not res!69697) (not e!95643))))

(declare-fun valid!605 (LongMapFixedSize!1204) Bool)

(assert (=> b!146530 (= res!69697 (valid!605 newMap!16))))

(declare-fun b!146531 () Bool)

(declare-fun e!95638 () Bool)

(declare-fun e!95652 () Bool)

(assert (=> b!146531 (= e!95638 e!95652)))

(declare-fun res!69699 () Bool)

(assert (=> b!146531 (=> res!69699 e!95652)))

(declare-datatypes ((tuple2!2696 0))(
  ( (tuple2!2697 (_1!1359 Bool) (_2!1359 LongMapFixedSize!1204)) )
))
(declare-fun lt!77136 () tuple2!2696)

(assert (=> b!146531 (= res!69699 (not (_1!1359 lt!77136)))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!77124 () tuple2!2696)

(declare-fun repackFrom!15 (LongMap!988 LongMapFixedSize!1204 (_ BitVec 32)) tuple2!2696)

(assert (=> b!146531 (= lt!77136 (repackFrom!15 thiss!992 (_2!1359 lt!77124) (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!146532 () Bool)

(declare-fun e!95637 () Bool)

(assert (=> b!146532 (= e!95637 tp_is_empty!2983)))

(declare-fun b!146533 () Bool)

(declare-fun e!95654 () Bool)

(declare-fun e!95646 () Bool)

(assert (=> b!146533 (= e!95654 e!95646)))

(declare-fun mapNonEmpty!5021 () Bool)

(declare-fun tp!11902 () Bool)

(assert (=> mapNonEmpty!5021 (= mapRes!5021 (and tp!11902 e!95639))))

(declare-fun mapValue!5022 () ValueCell!1148)

(declare-fun mapKey!5022 () (_ BitVec 32))

(declare-fun mapRest!5022 () (Array (_ BitVec 32) ValueCell!1148))

(assert (=> mapNonEmpty!5021 (= (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) (store mapRest!5022 mapKey!5022 mapValue!5022))))

(declare-fun b!146534 () Bool)

(declare-fun res!69704 () Bool)

(assert (=> b!146534 (=> (not res!69704) (not e!95643))))

(assert (=> b!146534 (= res!69704 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7398 newMap!16)) (_size!651 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146535 () Bool)

(declare-fun e!95635 () Bool)

(declare-fun mapRes!5022 () Bool)

(assert (=> b!146535 (= e!95640 (and e!95635 mapRes!5022))))

(declare-fun condMapEmpty!5021 () Bool)

(declare-fun mapDefault!5022 () ValueCell!1148)

(assert (=> b!146535 (= condMapEmpty!5021 (= (arr!2361 (_values!3001 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1148)) mapDefault!5022)))))

(declare-fun b!146536 () Bool)

(declare-fun e!95648 () Bool)

(declare-fun e!95651 () Bool)

(assert (=> b!146536 (= e!95648 e!95651)))

(declare-fun res!69700 () Bool)

(assert (=> b!146536 (=> (not res!69700) (not e!95651))))

(assert (=> b!146536 (= res!69700 (and (not (= (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77119 () V!3625)

(declare-fun get!1583 (ValueCell!1148 V!3625) V!3625)

(declare-fun dynLambda!459 (Int (_ BitVec 64)) V!3625)

(assert (=> b!146536 (= lt!77119 (get!1583 (select (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) from!355) (dynLambda!459 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!146537 () Bool)

(declare-datatypes ((Unit!4629 0))(
  ( (Unit!4630) )
))
(declare-fun e!95645 () Unit!4629)

(declare-fun Unit!4631 () Unit!4629)

(assert (=> b!146537 (= e!95645 Unit!4631)))

(declare-fun lt!77122 () Unit!4629)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!155 (array!4997 array!4999 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 64) (_ BitVec 32) Int) Unit!4629)

(assert (=> b!146537 (= lt!77122 (lemmaListMapContainsThenArrayContainsFrom!155 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146537 (arrayContainsKey!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!77125 () Unit!4629)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4997 (_ BitVec 32) (_ BitVec 32)) Unit!4629)

(assert (=> b!146537 (= lt!77125 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1761 0))(
  ( (Nil!1758) (Cons!1757 (h!2365 (_ BitVec 64)) (t!6470 List!1761)) )
))
(declare-fun arrayNoDuplicates!0 (array!4997 (_ BitVec 32) List!1761) Bool)

(assert (=> b!146537 (arrayNoDuplicates!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) from!355 Nil!1758)))

(declare-fun lt!77131 () Unit!4629)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4997 (_ BitVec 32) (_ BitVec 64) List!1761) Unit!4629)

(assert (=> b!146537 (= lt!77131 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (Cons!1757 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) Nil!1758)))))

(assert (=> b!146537 false))

(declare-fun b!146538 () Bool)

(declare-fun e!95647 () Bool)

(assert (=> b!146538 (= e!95651 e!95647)))

(declare-fun res!69702 () Bool)

(assert (=> b!146538 (=> (not res!69702) (not e!95647))))

(assert (=> b!146538 (= res!69702 (and (_1!1359 lt!77124) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!77135 () Unit!4629)

(assert (=> b!146538 (= lt!77135 e!95645)))

(declare-datatypes ((tuple2!2698 0))(
  ( (tuple2!2699 (_1!1360 (_ BitVec 64)) (_2!1360 V!3625)) )
))
(declare-datatypes ((List!1762 0))(
  ( (Nil!1759) (Cons!1758 (h!2366 tuple2!2698) (t!6471 List!1762)) )
))
(declare-datatypes ((ListLongMap!1725 0))(
  ( (ListLongMap!1726 (toList!878 List!1762)) )
))
(declare-fun lt!77121 () ListLongMap!1725)

(declare-fun c!27639 () Bool)

(declare-fun contains!933 (ListLongMap!1725 (_ BitVec 64)) Bool)

(assert (=> b!146538 (= c!27639 (contains!933 lt!77121 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun update!226 (LongMapFixedSize!1204 (_ BitVec 64) V!3625) tuple2!2696)

(assert (=> b!146538 (= lt!77124 (update!226 newMap!16 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119))))

(declare-fun mapNonEmpty!5022 () Bool)

(declare-fun tp!11901 () Bool)

(assert (=> mapNonEmpty!5022 (= mapRes!5022 (and tp!11901 e!95637))))

(declare-fun mapKey!5021 () (_ BitVec 32))

(declare-fun mapRest!5021 () (Array (_ BitVec 32) ValueCell!1148))

(declare-fun mapValue!5021 () ValueCell!1148)

(assert (=> mapNonEmpty!5022 (= (arr!2361 (_values!3001 newMap!16)) (store mapRest!5021 mapKey!5021 mapValue!5021))))

(declare-fun b!146539 () Bool)

(declare-fun Unit!4632 () Unit!4629)

(assert (=> b!146539 (= e!95645 Unit!4632)))

(declare-fun b!146540 () Bool)

(assert (=> b!146540 (= e!95647 (not e!95638))))

(declare-fun res!69698 () Bool)

(assert (=> b!146540 (=> res!69698 e!95638)))

(declare-fun getCurrentListMap!548 (array!4997 array!4999 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 32) Int) ListLongMap!1725)

(declare-fun map!1464 (LongMapFixedSize!1204) ListLongMap!1725)

(assert (=> b!146540 (= res!69698 (not (= (getCurrentListMap!548 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))) (map!1464 (_2!1359 lt!77124)))))))

(declare-fun lt!77127 () ListLongMap!1725)

(declare-fun lt!77132 () tuple2!2698)

(declare-fun lt!77130 () tuple2!2698)

(declare-fun lt!77120 () ListLongMap!1725)

(declare-fun +!182 (ListLongMap!1725 tuple2!2698) ListLongMap!1725)

(assert (=> b!146540 (= (+!182 lt!77127 lt!77130) (+!182 (+!182 lt!77120 lt!77130) lt!77132))))

(assert (=> b!146540 (= lt!77130 (tuple2!2699 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77129 () Unit!4629)

(declare-fun addCommutativeForDiffKeys!76 (ListLongMap!1725 (_ BitVec 64) V!3625 (_ BitVec 64) V!3625) Unit!4629)

(assert (=> b!146540 (= lt!77129 (addCommutativeForDiffKeys!76 lt!77120 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77118 () ListLongMap!1725)

(assert (=> b!146540 (= lt!77118 lt!77127)))

(assert (=> b!146540 (= lt!77127 (+!182 lt!77120 lt!77132))))

(declare-fun lt!77134 () ListLongMap!1725)

(declare-fun lt!77128 () tuple2!2698)

(assert (=> b!146540 (= lt!77118 (+!182 lt!77134 lt!77128))))

(declare-fun lt!77133 () ListLongMap!1725)

(assert (=> b!146540 (= lt!77120 (+!182 lt!77133 lt!77128))))

(assert (=> b!146540 (= lt!77128 (tuple2!2699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))))))

(assert (=> b!146540 (= lt!77134 (+!182 lt!77133 lt!77132))))

(assert (=> b!146540 (= lt!77132 (tuple2!2699 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119))))

(declare-fun lt!77123 () Unit!4629)

(assert (=> b!146540 (= lt!77123 (addCommutativeForDiffKeys!76 lt!77133 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!150 (array!4997 array!4999 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 32) Int) ListLongMap!1725)

(assert (=> b!146540 (= lt!77133 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146541 () Bool)

(declare-fun e!95650 () Bool)

(assert (=> b!146541 (= e!95650 (= (map!1464 (_2!1359 lt!77136)) (map!1464 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146542 () Bool)

(assert (=> b!146542 (= e!95635 tp_is_empty!2983)))

(declare-fun mapIsEmpty!5022 () Bool)

(assert (=> mapIsEmpty!5022 mapRes!5022))

(declare-fun b!146543 () Bool)

(assert (=> b!146543 (= e!95643 e!95648)))

(declare-fun res!69701 () Bool)

(assert (=> b!146543 (=> (not res!69701) (not e!95648))))

(declare-fun lt!77126 () ListLongMap!1725)

(assert (=> b!146543 (= res!69701 (= lt!77126 lt!77121))))

(assert (=> b!146543 (= lt!77121 (map!1464 newMap!16))))

(assert (=> b!146543 (= lt!77126 (getCurrentListMap!548 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146544 () Bool)

(assert (=> b!146544 (= e!95652 e!95650)))

(declare-fun res!69705 () Bool)

(assert (=> b!146544 (=> (not res!69705) (not e!95650))))

(assert (=> b!146544 (= res!69705 (valid!605 (_2!1359 lt!77136)))))

(declare-fun b!146545 () Bool)

(assert (=> b!146545 (= e!95646 e!95644)))

(declare-fun b!146546 () Bool)

(declare-fun e!95642 () Bool)

(assert (=> b!146546 (= e!95642 tp_is_empty!2983)))

(declare-fun b!146547 () Bool)

(assert (=> b!146547 (= e!95649 (and e!95642 mapRes!5021))))

(declare-fun condMapEmpty!5022 () Bool)

(declare-fun mapDefault!5021 () ValueCell!1148)

(assert (=> b!146547 (= condMapEmpty!5022 (= (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1148)) mapDefault!5021)))))

(declare-fun res!69703 () Bool)

(assert (=> start!15218 (=> (not res!69703) (not e!95643))))

(declare-fun valid!606 (LongMap!988) Bool)

(assert (=> start!15218 (= res!69703 (valid!606 thiss!992))))

(assert (=> start!15218 e!95643))

(assert (=> start!15218 e!95654))

(assert (=> start!15218 true))

(assert (=> start!15218 e!95641))

(declare-fun b!146548 () Bool)

(declare-fun res!69706 () Bool)

(assert (=> b!146548 (=> (not res!69706) (not e!95643))))

(assert (=> b!146548 (= res!69706 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992)))))))))

(assert (= (and start!15218 res!69703) b!146548))

(assert (= (and b!146548 res!69706) b!146530))

(assert (= (and b!146530 res!69697) b!146534))

(assert (= (and b!146534 res!69704) b!146543))

(assert (= (and b!146543 res!69701) b!146536))

(assert (= (and b!146536 res!69700) b!146538))

(assert (= (and b!146538 c!27639) b!146537))

(assert (= (and b!146538 (not c!27639)) b!146539))

(assert (= (and b!146538 res!69702) b!146540))

(assert (= (and b!146540 (not res!69698)) b!146531))

(assert (= (and b!146531 (not res!69699)) b!146544))

(assert (= (and b!146544 res!69705) b!146541))

(assert (= (and b!146547 condMapEmpty!5022) mapIsEmpty!5021))

(assert (= (and b!146547 (not condMapEmpty!5022)) mapNonEmpty!5021))

(get-info :version)

(assert (= (and mapNonEmpty!5021 ((_ is ValueCellFull!1148) mapValue!5022)) b!146528))

(assert (= (and b!146547 ((_ is ValueCellFull!1148) mapDefault!5021)) b!146546))

(assert (= b!146527 b!146547))

(assert (= b!146545 b!146527))

(assert (= b!146533 b!146545))

(assert (= start!15218 b!146533))

(assert (= (and b!146535 condMapEmpty!5021) mapIsEmpty!5022))

(assert (= (and b!146535 (not condMapEmpty!5021)) mapNonEmpty!5022))

(assert (= (and mapNonEmpty!5022 ((_ is ValueCellFull!1148) mapValue!5021)) b!146532))

(assert (= (and b!146535 ((_ is ValueCellFull!1148) mapDefault!5022)) b!146542))

(assert (= b!146529 b!146535))

(assert (= start!15218 b!146529))

(declare-fun b_lambda!6569 () Bool)

(assert (=> (not b_lambda!6569) (not b!146536)))

(declare-fun t!6467 () Bool)

(declare-fun tb!2669 () Bool)

(assert (=> (and b!146527 (= (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))) t!6467) tb!2669))

(declare-fun result!4363 () Bool)

(assert (=> tb!2669 (= result!4363 tp_is_empty!2983)))

(assert (=> b!146536 t!6467))

(declare-fun b_and!9189 () Bool)

(assert (= b_and!9185 (and (=> t!6467 result!4363) b_and!9189)))

(declare-fun t!6469 () Bool)

(declare-fun tb!2671 () Bool)

(assert (=> (and b!146529 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))) t!6469) tb!2671))

(declare-fun result!4367 () Bool)

(assert (= result!4367 result!4363))

(assert (=> b!146536 t!6469))

(declare-fun b_and!9191 () Bool)

(assert (= b_and!9187 (and (=> t!6469 result!4367) b_and!9191)))

(declare-fun m!176271 () Bool)

(assert (=> b!146527 m!176271))

(declare-fun m!176273 () Bool)

(assert (=> b!146527 m!176273))

(declare-fun m!176275 () Bool)

(assert (=> b!146536 m!176275))

(declare-fun m!176277 () Bool)

(assert (=> b!146536 m!176277))

(declare-fun m!176279 () Bool)

(assert (=> b!146536 m!176279))

(assert (=> b!146536 m!176277))

(assert (=> b!146536 m!176279))

(declare-fun m!176281 () Bool)

(assert (=> b!146536 m!176281))

(declare-fun m!176283 () Bool)

(assert (=> b!146543 m!176283))

(declare-fun m!176285 () Bool)

(assert (=> b!146543 m!176285))

(declare-fun m!176287 () Bool)

(assert (=> b!146531 m!176287))

(declare-fun m!176289 () Bool)

(assert (=> b!146529 m!176289))

(declare-fun m!176291 () Bool)

(assert (=> b!146529 m!176291))

(assert (=> b!146538 m!176275))

(assert (=> b!146538 m!176275))

(declare-fun m!176293 () Bool)

(assert (=> b!146538 m!176293))

(assert (=> b!146538 m!176275))

(declare-fun m!176295 () Bool)

(assert (=> b!146538 m!176295))

(declare-fun m!176297 () Bool)

(assert (=> start!15218 m!176297))

(declare-fun m!176299 () Bool)

(assert (=> b!146537 m!176299))

(declare-fun m!176301 () Bool)

(assert (=> b!146537 m!176301))

(assert (=> b!146537 m!176275))

(declare-fun m!176303 () Bool)

(assert (=> b!146537 m!176303))

(assert (=> b!146537 m!176275))

(assert (=> b!146537 m!176275))

(declare-fun m!176305 () Bool)

(assert (=> b!146537 m!176305))

(assert (=> b!146537 m!176275))

(declare-fun m!176307 () Bool)

(assert (=> b!146537 m!176307))

(declare-fun m!176309 () Bool)

(assert (=> b!146541 m!176309))

(declare-fun m!176311 () Bool)

(assert (=> b!146541 m!176311))

(declare-fun m!176313 () Bool)

(assert (=> mapNonEmpty!5022 m!176313))

(declare-fun m!176315 () Bool)

(assert (=> b!146540 m!176315))

(declare-fun m!176317 () Bool)

(assert (=> b!146540 m!176317))

(declare-fun m!176319 () Bool)

(assert (=> b!146540 m!176319))

(declare-fun m!176321 () Bool)

(assert (=> b!146540 m!176321))

(declare-fun m!176323 () Bool)

(assert (=> b!146540 m!176323))

(declare-fun m!176325 () Bool)

(assert (=> b!146540 m!176325))

(assert (=> b!146540 m!176275))

(declare-fun m!176327 () Bool)

(assert (=> b!146540 m!176327))

(declare-fun m!176329 () Bool)

(assert (=> b!146540 m!176329))

(declare-fun m!176331 () Bool)

(assert (=> b!146540 m!176331))

(assert (=> b!146540 m!176275))

(declare-fun m!176333 () Bool)

(assert (=> b!146540 m!176333))

(declare-fun m!176335 () Bool)

(assert (=> b!146540 m!176335))

(assert (=> b!146540 m!176275))

(declare-fun m!176337 () Bool)

(assert (=> b!146540 m!176337))

(assert (=> b!146540 m!176321))

(declare-fun m!176339 () Bool)

(assert (=> mapNonEmpty!5021 m!176339))

(declare-fun m!176341 () Bool)

(assert (=> b!146530 m!176341))

(declare-fun m!176343 () Bool)

(assert (=> b!146544 m!176343))

(check-sat (not b!146543) (not b!146531) (not b!146527) b_and!9189 (not b!146537) (not start!15218) (not b_next!3133) (not b!146530) (not b!146541) (not mapNonEmpty!5022) (not b_next!3135) (not b!146544) (not b!146540) (not b!146538) (not b_lambda!6569) tp_is_empty!2983 b_and!9191 (not b!146529) (not b!146536) (not mapNonEmpty!5021))
(check-sat b_and!9189 b_and!9191 (not b_next!3133) (not b_next!3135))
(get-model)

(declare-fun b_lambda!6575 () Bool)

(assert (= b_lambda!6569 (or (and b!146527 b_free!3133) (and b!146529 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))))) b_lambda!6575)))

(check-sat (not b!146543) (not b!146531) (not b_lambda!6575) (not b!146527) b_and!9189 (not b!146537) (not start!15218) (not b_next!3133) tp_is_empty!2983 (not b!146530) (not b!146541) (not mapNonEmpty!5022) (not b_next!3135) (not b!146544) (not b!146540) (not b!146538) b_and!9191 (not b!146529) (not b!146536) (not mapNonEmpty!5021))
(check-sat b_and!9189 b_and!9191 (not b_next!3133) (not b_next!3135))
(get-model)

(declare-fun d!46349 () Bool)

(assert (=> d!46349 (= (map!1464 (_2!1359 lt!77136)) (getCurrentListMap!548 (_keys!4787 (_2!1359 lt!77136)) (_values!3001 (_2!1359 lt!77136)) (mask!7398 (_2!1359 lt!77136)) (extraKeys!2763 (_2!1359 lt!77136)) (zeroValue!2863 (_2!1359 lt!77136)) (minValue!2863 (_2!1359 lt!77136)) #b00000000000000000000000000000000 (defaultEntry!3018 (_2!1359 lt!77136))))))

(declare-fun bs!6152 () Bool)

(assert (= bs!6152 d!46349))

(declare-fun m!176493 () Bool)

(assert (=> bs!6152 m!176493))

(assert (=> b!146541 d!46349))

(declare-fun d!46351 () Bool)

(assert (=> d!46351 (= (map!1464 (v!3364 (underlying!505 thiss!992))) (getCurrentListMap!548 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun bs!6153 () Bool)

(assert (= bs!6153 d!46351))

(declare-fun m!176495 () Bool)

(assert (=> bs!6153 m!176495))

(assert (=> b!146541 d!46351))

(declare-fun d!46353 () Bool)

(declare-fun res!69773 () Bool)

(declare-fun e!95777 () Bool)

(assert (=> d!46353 (=> (not res!69773) (not e!95777))))

(declare-fun simpleValid!101 (LongMapFixedSize!1204) Bool)

(assert (=> d!46353 (= res!69773 (simpleValid!101 (_2!1359 lt!77136)))))

(assert (=> d!46353 (= (valid!605 (_2!1359 lt!77136)) e!95777)))

(declare-fun b!146693 () Bool)

(declare-fun res!69774 () Bool)

(assert (=> b!146693 (=> (not res!69774) (not e!95777))))

(declare-fun arrayCountValidKeys!0 (array!4997 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!146693 (= res!69774 (= (arrayCountValidKeys!0 (_keys!4787 (_2!1359 lt!77136)) #b00000000000000000000000000000000 (size!2636 (_keys!4787 (_2!1359 lt!77136)))) (_size!651 (_2!1359 lt!77136))))))

(declare-fun b!146694 () Bool)

(declare-fun res!69775 () Bool)

(assert (=> b!146694 (=> (not res!69775) (not e!95777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4997 (_ BitVec 32)) Bool)

(assert (=> b!146694 (= res!69775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4787 (_2!1359 lt!77136)) (mask!7398 (_2!1359 lt!77136))))))

(declare-fun b!146695 () Bool)

(assert (=> b!146695 (= e!95777 (arrayNoDuplicates!0 (_keys!4787 (_2!1359 lt!77136)) #b00000000000000000000000000000000 Nil!1758))))

(assert (= (and d!46353 res!69773) b!146693))

(assert (= (and b!146693 res!69774) b!146694))

(assert (= (and b!146694 res!69775) b!146695))

(declare-fun m!176497 () Bool)

(assert (=> d!46353 m!176497))

(declare-fun m!176499 () Bool)

(assert (=> b!146693 m!176499))

(declare-fun m!176501 () Bool)

(assert (=> b!146694 m!176501))

(declare-fun m!176503 () Bool)

(assert (=> b!146695 m!176503))

(assert (=> b!146544 d!46353))

(declare-fun d!46355 () Bool)

(assert (=> d!46355 (= (array_inv!1479 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvsge (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!146527 d!46355))

(declare-fun d!46357 () Bool)

(assert (=> d!46357 (= (array_inv!1480 (_values!3001 (v!3364 (underlying!505 thiss!992)))) (bvsge (size!2637 (_values!3001 (v!3364 (underlying!505 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!146527 d!46357))

(declare-fun d!46359 () Bool)

(assert (=> d!46359 (= (map!1464 newMap!16) (getCurrentListMap!548 (_keys!4787 newMap!16) (_values!3001 newMap!16) (mask!7398 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3018 newMap!16)))))

(declare-fun bs!6154 () Bool)

(assert (= bs!6154 d!46359))

(declare-fun m!176505 () Bool)

(assert (=> bs!6154 m!176505))

(assert (=> b!146543 d!46359))

(declare-fun b!146738 () Bool)

(declare-fun e!95814 () Bool)

(declare-fun e!95806 () Bool)

(assert (=> b!146738 (= e!95814 e!95806)))

(declare-fun res!69796 () Bool)

(declare-fun call!16340 () Bool)

(assert (=> b!146738 (= res!69796 call!16340)))

(assert (=> b!146738 (=> (not res!69796) (not e!95806))))

(declare-fun b!146739 () Bool)

(declare-fun e!95807 () Bool)

(declare-fun e!95815 () Bool)

(assert (=> b!146739 (= e!95807 e!95815)))

(declare-fun res!69799 () Bool)

(assert (=> b!146739 (=> (not res!69799) (not e!95815))))

(declare-fun lt!77316 () ListLongMap!1725)

(assert (=> b!146739 (= res!69799 (contains!933 lt!77316 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!146739 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146740 () Bool)

(declare-fun e!95812 () ListLongMap!1725)

(declare-fun call!16345 () ListLongMap!1725)

(assert (=> b!146740 (= e!95812 call!16345)))

(declare-fun b!146741 () Bool)

(declare-fun apply!125 (ListLongMap!1725 (_ BitVec 64)) V!3625)

(assert (=> b!146741 (= e!95806 (= (apply!125 lt!77316 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2863 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146742 () Bool)

(declare-fun e!95816 () Unit!4629)

(declare-fun Unit!4638 () Unit!4629)

(assert (=> b!146742 (= e!95816 Unit!4638)))

(declare-fun b!146743 () Bool)

(declare-fun e!95805 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!146743 (= e!95805 (validKeyInArray!0 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!16336 () Bool)

(declare-fun call!16342 () ListLongMap!1725)

(assert (=> bm!16336 (= call!16345 call!16342)))

(declare-fun bm!16337 () Bool)

(assert (=> bm!16337 (= call!16340 (contains!933 lt!77316 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!146744 () Bool)

(declare-fun e!95811 () ListLongMap!1725)

(declare-fun e!95813 () ListLongMap!1725)

(assert (=> b!146744 (= e!95811 e!95813)))

(declare-fun c!27663 () Bool)

(assert (=> b!146744 (= c!27663 (and (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!146745 () Bool)

(declare-fun res!69800 () Bool)

(declare-fun e!95810 () Bool)

(assert (=> b!146745 (=> (not res!69800) (not e!95810))))

(assert (=> b!146745 (= res!69800 e!95807)))

(declare-fun res!69797 () Bool)

(assert (=> b!146745 (=> res!69797 e!95807)))

(assert (=> b!146745 (= res!69797 (not e!95805))))

(declare-fun res!69795 () Bool)

(assert (=> b!146745 (=> (not res!69795) (not e!95805))))

(assert (=> b!146745 (= res!69795 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146746 () Bool)

(declare-fun e!95808 () Bool)

(assert (=> b!146746 (= e!95808 (validKeyInArray!0 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!146747 () Bool)

(assert (=> b!146747 (= e!95814 (not call!16340))))

(declare-fun bm!16338 () Bool)

(declare-fun call!16339 () ListLongMap!1725)

(declare-fun call!16343 () ListLongMap!1725)

(assert (=> bm!16338 (= call!16339 call!16343)))

(declare-fun bm!16339 () Bool)

(declare-fun call!16341 () ListLongMap!1725)

(assert (=> bm!16339 (= call!16341 call!16339)))

(declare-fun b!146748 () Bool)

(assert (=> b!146748 (= e!95815 (= (apply!125 lt!77316 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1583 (select (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!459 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!146748 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2637 (_values!3001 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> b!146748 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146749 () Bool)

(assert (=> b!146749 (= e!95813 call!16345)))

(declare-fun b!146750 () Bool)

(declare-fun c!27658 () Bool)

(assert (=> b!146750 (= c!27658 (and (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!146750 (= e!95813 e!95812)))

(declare-fun b!146751 () Bool)

(declare-fun res!69798 () Bool)

(assert (=> b!146751 (=> (not res!69798) (not e!95810))))

(declare-fun e!95804 () Bool)

(assert (=> b!146751 (= res!69798 e!95804)))

(declare-fun c!27660 () Bool)

(assert (=> b!146751 (= c!27660 (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!146752 () Bool)

(declare-fun lt!77298 () Unit!4629)

(assert (=> b!146752 (= e!95816 lt!77298)))

(declare-fun lt!77313 () ListLongMap!1725)

(assert (=> b!146752 (= lt!77313 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77308 () (_ BitVec 64))

(assert (=> b!146752 (= lt!77308 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77301 () (_ BitVec 64))

(assert (=> b!146752 (= lt!77301 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77312 () Unit!4629)

(declare-fun addStillContains!101 (ListLongMap!1725 (_ BitVec 64) V!3625 (_ BitVec 64)) Unit!4629)

(assert (=> b!146752 (= lt!77312 (addStillContains!101 lt!77313 lt!77308 (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) lt!77301))))

(assert (=> b!146752 (contains!933 (+!182 lt!77313 (tuple2!2699 lt!77308 (zeroValue!2863 (v!3364 (underlying!505 thiss!992))))) lt!77301)))

(declare-fun lt!77304 () Unit!4629)

(assert (=> b!146752 (= lt!77304 lt!77312)))

(declare-fun lt!77302 () ListLongMap!1725)

(assert (=> b!146752 (= lt!77302 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77299 () (_ BitVec 64))

(assert (=> b!146752 (= lt!77299 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77309 () (_ BitVec 64))

(assert (=> b!146752 (= lt!77309 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77300 () Unit!4629)

(declare-fun addApplyDifferent!101 (ListLongMap!1725 (_ BitVec 64) V!3625 (_ BitVec 64)) Unit!4629)

(assert (=> b!146752 (= lt!77300 (addApplyDifferent!101 lt!77302 lt!77299 (minValue!2863 (v!3364 (underlying!505 thiss!992))) lt!77309))))

(assert (=> b!146752 (= (apply!125 (+!182 lt!77302 (tuple2!2699 lt!77299 (minValue!2863 (v!3364 (underlying!505 thiss!992))))) lt!77309) (apply!125 lt!77302 lt!77309))))

(declare-fun lt!77307 () Unit!4629)

(assert (=> b!146752 (= lt!77307 lt!77300)))

(declare-fun lt!77303 () ListLongMap!1725)

(assert (=> b!146752 (= lt!77303 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77296 () (_ BitVec 64))

(assert (=> b!146752 (= lt!77296 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77310 () (_ BitVec 64))

(assert (=> b!146752 (= lt!77310 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77297 () Unit!4629)

(assert (=> b!146752 (= lt!77297 (addApplyDifferent!101 lt!77303 lt!77296 (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) lt!77310))))

(assert (=> b!146752 (= (apply!125 (+!182 lt!77303 (tuple2!2699 lt!77296 (zeroValue!2863 (v!3364 (underlying!505 thiss!992))))) lt!77310) (apply!125 lt!77303 lt!77310))))

(declare-fun lt!77315 () Unit!4629)

(assert (=> b!146752 (= lt!77315 lt!77297)))

(declare-fun lt!77305 () ListLongMap!1725)

(assert (=> b!146752 (= lt!77305 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77311 () (_ BitVec 64))

(assert (=> b!146752 (= lt!77311 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77306 () (_ BitVec 64))

(assert (=> b!146752 (= lt!77306 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!146752 (= lt!77298 (addApplyDifferent!101 lt!77305 lt!77311 (minValue!2863 (v!3364 (underlying!505 thiss!992))) lt!77306))))

(assert (=> b!146752 (= (apply!125 (+!182 lt!77305 (tuple2!2699 lt!77311 (minValue!2863 (v!3364 (underlying!505 thiss!992))))) lt!77306) (apply!125 lt!77305 lt!77306))))

(declare-fun bm!16340 () Bool)

(assert (=> bm!16340 (= call!16343 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146753 () Bool)

(declare-fun e!95809 () Bool)

(assert (=> b!146753 (= e!95809 (= (apply!125 lt!77316 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146754 () Bool)

(assert (=> b!146754 (= e!95804 e!95809)))

(declare-fun res!69794 () Bool)

(declare-fun call!16344 () Bool)

(assert (=> b!146754 (= res!69794 call!16344)))

(assert (=> b!146754 (=> (not res!69794) (not e!95809))))

(declare-fun b!146755 () Bool)

(assert (=> b!146755 (= e!95812 call!16341)))

(declare-fun d!46361 () Bool)

(assert (=> d!46361 e!95810))

(declare-fun res!69801 () Bool)

(assert (=> d!46361 (=> (not res!69801) (not e!95810))))

(assert (=> d!46361 (= res!69801 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))))

(declare-fun lt!77314 () ListLongMap!1725)

(assert (=> d!46361 (= lt!77316 lt!77314)))

(declare-fun lt!77295 () Unit!4629)

(assert (=> d!46361 (= lt!77295 e!95816)))

(declare-fun c!27662 () Bool)

(assert (=> d!46361 (= c!27662 e!95808)))

(declare-fun res!69802 () Bool)

(assert (=> d!46361 (=> (not res!69802) (not e!95808))))

(assert (=> d!46361 (= res!69802 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> d!46361 (= lt!77314 e!95811)))

(declare-fun c!27659 () Bool)

(assert (=> d!46361 (= c!27659 (and (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!46361 (validMask!0 (mask!7398 (v!3364 (underlying!505 thiss!992))))))

(assert (=> d!46361 (= (getCurrentListMap!548 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))) lt!77316)))

(declare-fun b!146756 () Bool)

(assert (=> b!146756 (= e!95804 (not call!16344))))

(declare-fun b!146757 () Bool)

(assert (=> b!146757 (= e!95811 (+!182 call!16342 (tuple2!2699 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun bm!16341 () Bool)

(assert (=> bm!16341 (= call!16342 (+!182 (ite c!27659 call!16343 (ite c!27663 call!16339 call!16341)) (ite (or c!27659 c!27663) (tuple2!2699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))) (tuple2!2699 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3364 (underlying!505 thiss!992)))))))))

(declare-fun bm!16342 () Bool)

(assert (=> bm!16342 (= call!16344 (contains!933 lt!77316 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!146758 () Bool)

(assert (=> b!146758 (= e!95810 e!95814)))

(declare-fun c!27661 () Bool)

(assert (=> b!146758 (= c!27661 (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!46361 c!27659) b!146757))

(assert (= (and d!46361 (not c!27659)) b!146744))

(assert (= (and b!146744 c!27663) b!146749))

(assert (= (and b!146744 (not c!27663)) b!146750))

(assert (= (and b!146750 c!27658) b!146740))

(assert (= (and b!146750 (not c!27658)) b!146755))

(assert (= (or b!146740 b!146755) bm!16339))

(assert (= (or b!146749 bm!16339) bm!16338))

(assert (= (or b!146749 b!146740) bm!16336))

(assert (= (or b!146757 bm!16338) bm!16340))

(assert (= (or b!146757 bm!16336) bm!16341))

(assert (= (and d!46361 res!69802) b!146746))

(assert (= (and d!46361 c!27662) b!146752))

(assert (= (and d!46361 (not c!27662)) b!146742))

(assert (= (and d!46361 res!69801) b!146745))

(assert (= (and b!146745 res!69795) b!146743))

(assert (= (and b!146745 (not res!69797)) b!146739))

(assert (= (and b!146739 res!69799) b!146748))

(assert (= (and b!146745 res!69800) b!146751))

(assert (= (and b!146751 c!27660) b!146754))

(assert (= (and b!146751 (not c!27660)) b!146756))

(assert (= (and b!146754 res!69794) b!146753))

(assert (= (or b!146754 b!146756) bm!16342))

(assert (= (and b!146751 res!69798) b!146758))

(assert (= (and b!146758 c!27661) b!146738))

(assert (= (and b!146758 (not c!27661)) b!146747))

(assert (= (and b!146738 res!69796) b!146741))

(assert (= (or b!146738 b!146747) bm!16337))

(declare-fun b_lambda!6577 () Bool)

(assert (=> (not b_lambda!6577) (not b!146748)))

(assert (=> b!146748 t!6467))

(declare-fun b_and!9209 () Bool)

(assert (= b_and!9189 (and (=> t!6467 result!4363) b_and!9209)))

(assert (=> b!146748 t!6469))

(declare-fun b_and!9211 () Bool)

(assert (= b_and!9191 (and (=> t!6469 result!4367) b_and!9211)))

(declare-fun m!176507 () Bool)

(assert (=> b!146752 m!176507))

(assert (=> b!146752 m!176335))

(declare-fun m!176509 () Bool)

(assert (=> b!146752 m!176509))

(declare-fun m!176511 () Bool)

(assert (=> b!146752 m!176511))

(declare-fun m!176513 () Bool)

(assert (=> b!146752 m!176513))

(declare-fun m!176515 () Bool)

(assert (=> b!146752 m!176515))

(declare-fun m!176517 () Bool)

(assert (=> b!146752 m!176517))

(declare-fun m!176519 () Bool)

(assert (=> b!146752 m!176519))

(declare-fun m!176521 () Bool)

(assert (=> b!146752 m!176521))

(declare-fun m!176523 () Bool)

(assert (=> b!146752 m!176523))

(declare-fun m!176525 () Bool)

(assert (=> b!146752 m!176525))

(declare-fun m!176527 () Bool)

(assert (=> b!146752 m!176527))

(assert (=> b!146752 m!176515))

(declare-fun m!176529 () Bool)

(assert (=> b!146752 m!176529))

(assert (=> b!146752 m!176513))

(declare-fun m!176531 () Bool)

(assert (=> b!146752 m!176531))

(assert (=> b!146752 m!176523))

(assert (=> b!146752 m!176511))

(declare-fun m!176533 () Bool)

(assert (=> b!146752 m!176533))

(declare-fun m!176535 () Bool)

(assert (=> b!146752 m!176535))

(declare-fun m!176537 () Bool)

(assert (=> b!146752 m!176537))

(assert (=> b!146739 m!176521))

(assert (=> b!146739 m!176521))

(declare-fun m!176539 () Bool)

(assert (=> b!146739 m!176539))

(assert (=> b!146743 m!176521))

(assert (=> b!146743 m!176521))

(declare-fun m!176541 () Bool)

(assert (=> b!146743 m!176541))

(assert (=> b!146746 m!176521))

(assert (=> b!146746 m!176521))

(assert (=> b!146746 m!176541))

(assert (=> bm!16340 m!176335))

(declare-fun m!176543 () Bool)

(assert (=> b!146753 m!176543))

(declare-fun m!176545 () Bool)

(assert (=> bm!16337 m!176545))

(declare-fun m!176547 () Bool)

(assert (=> b!146757 m!176547))

(declare-fun m!176549 () Bool)

(assert (=> bm!16342 m!176549))

(declare-fun m!176551 () Bool)

(assert (=> d!46361 m!176551))

(declare-fun m!176553 () Bool)

(assert (=> bm!16341 m!176553))

(declare-fun m!176555 () Bool)

(assert (=> b!146748 m!176555))

(assert (=> b!146748 m!176555))

(assert (=> b!146748 m!176279))

(declare-fun m!176557 () Bool)

(assert (=> b!146748 m!176557))

(assert (=> b!146748 m!176521))

(declare-fun m!176559 () Bool)

(assert (=> b!146748 m!176559))

(assert (=> b!146748 m!176279))

(assert (=> b!146748 m!176521))

(declare-fun m!176561 () Bool)

(assert (=> b!146741 m!176561))

(assert (=> b!146543 d!46361))

(declare-fun d!46363 () Bool)

(assert (=> d!46363 (= (array_inv!1479 (_keys!4787 newMap!16)) (bvsge (size!2636 (_keys!4787 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!146529 d!46363))

(declare-fun d!46365 () Bool)

(assert (=> d!46365 (= (array_inv!1480 (_values!3001 newMap!16)) (bvsge (size!2637 (_values!3001 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!146529 d!46365))

(declare-fun d!46367 () Bool)

(declare-fun e!95822 () Bool)

(assert (=> d!46367 e!95822))

(declare-fun res!69805 () Bool)

(assert (=> d!46367 (=> res!69805 e!95822)))

(declare-fun lt!77327 () Bool)

(assert (=> d!46367 (= res!69805 (not lt!77327))))

(declare-fun lt!77326 () Bool)

(assert (=> d!46367 (= lt!77327 lt!77326)))

(declare-fun lt!77328 () Unit!4629)

(declare-fun e!95821 () Unit!4629)

(assert (=> d!46367 (= lt!77328 e!95821)))

(declare-fun c!27666 () Bool)

(assert (=> d!46367 (= c!27666 lt!77326)))

(declare-fun containsKey!185 (List!1762 (_ BitVec 64)) Bool)

(assert (=> d!46367 (= lt!77326 (containsKey!185 (toList!878 lt!77121) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(assert (=> d!46367 (= (contains!933 lt!77121 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)) lt!77327)))

(declare-fun b!146765 () Bool)

(declare-fun lt!77325 () Unit!4629)

(assert (=> b!146765 (= e!95821 lt!77325)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!133 (List!1762 (_ BitVec 64)) Unit!4629)

(assert (=> b!146765 (= lt!77325 (lemmaContainsKeyImpliesGetValueByKeyDefined!133 (toList!878 lt!77121) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-datatypes ((Option!188 0))(
  ( (Some!187 (v!3370 V!3625)) (None!186) )
))
(declare-fun isDefined!134 (Option!188) Bool)

(declare-fun getValueByKey!182 (List!1762 (_ BitVec 64)) Option!188)

(assert (=> b!146765 (isDefined!134 (getValueByKey!182 (toList!878 lt!77121) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!146766 () Bool)

(declare-fun Unit!4639 () Unit!4629)

(assert (=> b!146766 (= e!95821 Unit!4639)))

(declare-fun b!146767 () Bool)

(assert (=> b!146767 (= e!95822 (isDefined!134 (getValueByKey!182 (toList!878 lt!77121) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355))))))

(assert (= (and d!46367 c!27666) b!146765))

(assert (= (and d!46367 (not c!27666)) b!146766))

(assert (= (and d!46367 (not res!69805)) b!146767))

(assert (=> d!46367 m!176275))

(declare-fun m!176563 () Bool)

(assert (=> d!46367 m!176563))

(assert (=> b!146765 m!176275))

(declare-fun m!176565 () Bool)

(assert (=> b!146765 m!176565))

(assert (=> b!146765 m!176275))

(declare-fun m!176567 () Bool)

(assert (=> b!146765 m!176567))

(assert (=> b!146765 m!176567))

(declare-fun m!176569 () Bool)

(assert (=> b!146765 m!176569))

(assert (=> b!146767 m!176275))

(assert (=> b!146767 m!176567))

(assert (=> b!146767 m!176567))

(assert (=> b!146767 m!176569))

(assert (=> b!146538 d!46367))

(declare-fun b!146848 () Bool)

(declare-fun res!69840 () Bool)

(declare-fun e!95876 () Bool)

(assert (=> b!146848 (=> (not res!69840) (not e!95876))))

(declare-datatypes ((SeekEntryResult!278 0))(
  ( (MissingZero!278 (index!3279 (_ BitVec 32))) (Found!278 (index!3280 (_ BitVec 32))) (Intermediate!278 (undefined!1090 Bool) (index!3281 (_ BitVec 32)) (x!16704 (_ BitVec 32))) (Undefined!278) (MissingVacant!278 (index!3282 (_ BitVec 32))) )
))
(declare-fun lt!77403 () SeekEntryResult!278)

(assert (=> b!146848 (= res!69840 (= (select (arr!2360 (_keys!4787 newMap!16)) (index!3279 lt!77403)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!146849 () Bool)

(declare-fun lt!77387 () Unit!4629)

(declare-fun lt!77397 () Unit!4629)

(assert (=> b!146849 (= lt!77387 lt!77397)))

(declare-fun call!16410 () ListLongMap!1725)

(declare-fun call!16416 () ListLongMap!1725)

(assert (=> b!146849 (= call!16410 call!16416)))

(declare-fun lt!77401 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!70 (array!4997 array!4999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 V!3625 Int) Unit!4629)

(assert (=> b!146849 (= lt!77397 (lemmaChangeLongMinValueKeyThenAddPairToListMap!70 (_keys!4787 newMap!16) (_values!3001 newMap!16) (mask!7398 newMap!16) (extraKeys!2763 newMap!16) lt!77401 (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) lt!77119 (defaultEntry!3018 newMap!16)))))

(assert (=> b!146849 (= lt!77401 (bvor (extraKeys!2763 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!95875 () tuple2!2696)

(assert (=> b!146849 (= e!95875 (tuple2!2697 true (LongMapFixedSize!1205 (defaultEntry!3018 newMap!16) (mask!7398 newMap!16) (bvor (extraKeys!2763 newMap!16) #b00000000000000000000000000000010) (zeroValue!2863 newMap!16) lt!77119 (_size!651 newMap!16) (_keys!4787 newMap!16) (_values!3001 newMap!16) (_vacant!651 newMap!16))))))

(declare-fun b!146850 () Bool)

(declare-fun res!69845 () Bool)

(declare-fun call!16401 () Bool)

(assert (=> b!146850 (= res!69845 call!16401)))

(declare-fun e!95868 () Bool)

(assert (=> b!146850 (=> (not res!69845) (not e!95868))))

(declare-fun b!146851 () Bool)

(declare-fun call!16415 () Bool)

(assert (=> b!146851 (= e!95876 (not call!16415))))

(declare-fun e!95873 () ListLongMap!1725)

(declare-fun c!27697 () Bool)

(declare-fun c!27698 () Bool)

(declare-fun call!16402 () ListLongMap!1725)

(declare-fun bm!16391 () Bool)

(assert (=> bm!16391 (= call!16402 (+!182 e!95873 (ite c!27698 (ite c!27697 (tuple2!2699 #b0000000000000000000000000000000000000000000000000000000000000000 lt!77119) (tuple2!2699 #b1000000000000000000000000000000000000000000000000000000000000000 lt!77119)) (tuple2!2699 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119))))))

(declare-fun c!27699 () Bool)

(assert (=> bm!16391 (= c!27699 c!27698)))

(declare-fun call!16411 () ListLongMap!1725)

(declare-fun lt!77391 () SeekEntryResult!278)

(declare-fun bm!16392 () Bool)

(assert (=> bm!16392 (= call!16411 (getCurrentListMap!548 (_keys!4787 newMap!16) (ite c!27698 (_values!3001 newMap!16) (array!5000 (store (arr!2361 (_values!3001 newMap!16)) (index!3280 lt!77391) (ValueCellFull!1148 lt!77119)) (size!2637 (_values!3001 newMap!16)))) (mask!7398 newMap!16) (ite c!27698 (ite c!27697 (extraKeys!2763 newMap!16) lt!77401) (extraKeys!2763 newMap!16)) (zeroValue!2863 newMap!16) (ite c!27698 (ite c!27697 (minValue!2863 newMap!16) lt!77119) (minValue!2863 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!3018 newMap!16)))))

(declare-fun bm!16393 () Bool)

(declare-fun call!16396 () ListLongMap!1725)

(declare-fun call!16399 () ListLongMap!1725)

(assert (=> bm!16393 (= call!16396 call!16399)))

(declare-fun b!146852 () Bool)

(declare-fun res!69839 () Bool)

(assert (=> b!146852 (= res!69839 (= (select (arr!2360 (_keys!4787 newMap!16)) (index!3282 lt!77403)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!95870 () Bool)

(assert (=> b!146852 (=> (not res!69839) (not e!95870))))

(declare-fun bm!16394 () Bool)

(declare-fun call!16403 () SeekEntryResult!278)

(declare-fun call!16398 () SeekEntryResult!278)

(assert (=> bm!16394 (= call!16403 call!16398)))

(declare-fun b!146853 () Bool)

(declare-fun lt!77399 () tuple2!2696)

(declare-fun call!16408 () tuple2!2696)

(assert (=> b!146853 (= lt!77399 call!16408)))

(declare-fun e!95885 () tuple2!2696)

(assert (=> b!146853 (= e!95885 (tuple2!2697 (_1!1359 lt!77399) (_2!1359 lt!77399)))))

(declare-fun bm!16395 () Bool)

(declare-fun call!16407 () Bool)

(assert (=> bm!16395 (= call!16407 call!16401)))

(declare-fun c!27702 () Bool)

(declare-fun lt!77404 () array!4999)

(declare-fun lt!77409 () (_ BitVec 32))

(declare-fun bm!16396 () Bool)

(assert (=> bm!16396 (= call!16399 (getCurrentListMap!548 (_keys!4787 newMap!16) (ite (or c!27698 c!27702) (_values!3001 newMap!16) lt!77404) (mask!7398 newMap!16) (ite (and c!27698 c!27697) lt!77409 (extraKeys!2763 newMap!16)) (ite (and c!27698 c!27697) lt!77119 (zeroValue!2863 newMap!16)) (minValue!2863 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3018 newMap!16)))))

(declare-fun lt!77405 () SeekEntryResult!278)

(declare-fun b!146854 () Bool)

(declare-fun e!95872 () Bool)

(assert (=> b!146854 (= e!95872 (= (select (arr!2360 (_keys!4787 newMap!16)) (index!3280 lt!77405)) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!146855 () Bool)

(declare-fun e!95874 () tuple2!2696)

(assert (=> b!146855 (= e!95874 e!95875)))

(assert (=> b!146855 (= c!27697 (= (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16397 () Bool)

(declare-fun call!16409 () Bool)

(declare-fun call!16397 () Bool)

(assert (=> bm!16397 (= call!16409 call!16397)))

(declare-fun bm!16398 () Bool)

(declare-fun call!16406 () Unit!4629)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!70 (array!4997 array!4999 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 64) Int) Unit!4629)

(assert (=> bm!16398 (= call!16406 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!70 (_keys!4787 newMap!16) (_values!3001 newMap!16) (mask!7398 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (defaultEntry!3018 newMap!16)))))

(declare-fun b!146856 () Bool)

(declare-fun e!95878 () Bool)

(declare-fun e!95867 () Bool)

(assert (=> b!146856 (= e!95878 e!95867)))

(declare-fun res!69847 () Bool)

(assert (=> b!146856 (= res!69847 call!16409)))

(assert (=> b!146856 (=> (not res!69847) (not e!95867))))

(declare-fun b!146857 () Bool)

(declare-fun e!95884 () Bool)

(declare-fun call!16414 () ListLongMap!1725)

(declare-fun call!16405 () ListLongMap!1725)

(assert (=> b!146857 (= e!95884 (= call!16414 call!16405))))

(declare-fun b!146858 () Bool)

(declare-fun e!95882 () Bool)

(assert (=> b!146858 (= e!95882 e!95870)))

(declare-fun res!69836 () Bool)

(assert (=> b!146858 (= res!69836 call!16407)))

(assert (=> b!146858 (=> (not res!69836) (not e!95870))))

(declare-fun bm!16399 () Bool)

(declare-fun call!16413 () Bool)

(assert (=> bm!16399 (= call!16397 call!16413)))

(declare-fun bm!16400 () Bool)

(assert (=> bm!16400 (= call!16401 call!16413)))

(declare-fun bm!16401 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4997 (_ BitVec 32)) SeekEntryResult!278)

(assert (=> bm!16401 (= call!16398 (seekEntryOrOpen!0 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (_keys!4787 newMap!16) (mask!7398 newMap!16)))))

(declare-fun b!146859 () Bool)

(declare-fun res!69834 () Bool)

(assert (=> b!146859 (=> (not res!69834) (not e!95876))))

(assert (=> b!146859 (= res!69834 call!16407)))

(declare-fun e!95865 () Bool)

(assert (=> b!146859 (= e!95865 e!95876)))

(declare-fun b!146860 () Bool)

(declare-fun e!95877 () Bool)

(declare-fun call!16417 () Bool)

(assert (=> b!146860 (= e!95877 (not call!16417))))

(declare-fun b!146861 () Bool)

(declare-fun lt!77398 () Unit!4629)

(declare-fun e!95869 () Unit!4629)

(assert (=> b!146861 (= lt!77398 e!95869)))

(declare-fun c!27696 () Bool)

(declare-fun call!16404 () Bool)

(assert (=> b!146861 (= c!27696 call!16404)))

(declare-fun e!95880 () tuple2!2696)

(assert (=> b!146861 (= e!95880 (tuple2!2697 false newMap!16))))

(declare-fun d!46369 () Bool)

(declare-fun e!95881 () Bool)

(assert (=> d!46369 e!95881))

(declare-fun res!69843 () Bool)

(assert (=> d!46369 (=> (not res!69843) (not e!95881))))

(declare-fun lt!77407 () tuple2!2696)

(assert (=> d!46369 (= res!69843 (valid!605 (_2!1359 lt!77407)))))

(assert (=> d!46369 (= lt!77407 e!95874)))

(assert (=> d!46369 (= c!27698 (= (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (bvneg (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355))))))

(assert (=> d!46369 (valid!605 newMap!16)))

(assert (=> d!46369 (= (update!226 newMap!16 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119) lt!77407)))

(declare-fun bm!16402 () Bool)

(declare-fun call!16395 () ListLongMap!1725)

(assert (=> bm!16402 (= call!16395 call!16399)))

(declare-fun bm!16403 () Bool)

(assert (=> bm!16403 (= call!16404 (contains!933 call!16396 (ite c!27702 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (select (arr!2360 (_keys!4787 newMap!16)) (index!3280 lt!77391)))))))

(declare-fun b!146862 () Bool)

(declare-fun e!95883 () Bool)

(assert (=> b!146862 (= e!95884 e!95883)))

(declare-fun res!69835 () Bool)

(assert (=> b!146862 (= res!69835 (contains!933 call!16414 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(assert (=> b!146862 (=> (not res!69835) (not e!95883))))

(declare-fun b!146863 () Bool)

(declare-fun lt!77408 () SeekEntryResult!278)

(assert (=> b!146863 (= e!95878 ((_ is Undefined!278) lt!77408))))

(declare-fun b!146864 () Bool)

(assert (=> b!146864 (= e!95873 (ite c!27697 call!16416 call!16395))))

(declare-fun bm!16404 () Bool)

(assert (=> bm!16404 (= call!16410 call!16402)))

(declare-fun b!146865 () Bool)

(declare-fun res!69842 () Bool)

(assert (=> b!146865 (=> (not res!69842) (not e!95877))))

(assert (=> b!146865 (= res!69842 (= (select (arr!2360 (_keys!4787 newMap!16)) (index!3279 lt!77408)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!16412 () Unit!4629)

(declare-fun bm!16405 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!70 (array!4997 array!4999 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 64) Int) Unit!4629)

(assert (=> bm!16405 (= call!16412 (lemmaInListMapThenSeekEntryOrOpenFindsIt!70 (_keys!4787 newMap!16) (_values!3001 newMap!16) (mask!7398 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (defaultEntry!3018 newMap!16)))))

(declare-fun bm!16406 () Bool)

(assert (=> bm!16406 (= call!16414 (map!1464 (_2!1359 lt!77407)))))

(declare-fun b!146866 () Bool)

(declare-fun lt!77389 () Unit!4629)

(declare-fun lt!77390 () Unit!4629)

(assert (=> b!146866 (= lt!77389 lt!77390)))

(assert (=> b!146866 call!16404))

(declare-fun lemmaValidKeyInArrayIsInListMap!130 (array!4997 array!4999 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 32) Int) Unit!4629)

(assert (=> b!146866 (= lt!77390 (lemmaValidKeyInArrayIsInListMap!130 (_keys!4787 newMap!16) lt!77404 (mask!7398 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) (index!3280 lt!77391) (defaultEntry!3018 newMap!16)))))

(assert (=> b!146866 (= lt!77404 (array!5000 (store (arr!2361 (_values!3001 newMap!16)) (index!3280 lt!77391) (ValueCellFull!1148 lt!77119)) (size!2637 (_values!3001 newMap!16))))))

(declare-fun lt!77400 () Unit!4629)

(declare-fun lt!77402 () Unit!4629)

(assert (=> b!146866 (= lt!77400 lt!77402)))

(assert (=> b!146866 (= call!16402 call!16411)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!70 (array!4997 array!4999 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 32) (_ BitVec 64) V!3625 Int) Unit!4629)

(assert (=> b!146866 (= lt!77402 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!70 (_keys!4787 newMap!16) (_values!3001 newMap!16) (mask!7398 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) (index!3280 lt!77391) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119 (defaultEntry!3018 newMap!16)))))

(declare-fun lt!77388 () Unit!4629)

(declare-fun e!95871 () Unit!4629)

(assert (=> b!146866 (= lt!77388 e!95871)))

(declare-fun c!27703 () Bool)

(assert (=> b!146866 (= c!27703 (contains!933 (getCurrentListMap!548 (_keys!4787 newMap!16) (_values!3001 newMap!16) (mask!7398 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3018 newMap!16)) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(assert (=> b!146866 (= e!95885 (tuple2!2697 true (LongMapFixedSize!1205 (defaultEntry!3018 newMap!16) (mask!7398 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) (_size!651 newMap!16) (_keys!4787 newMap!16) (array!5000 (store (arr!2361 (_values!3001 newMap!16)) (index!3280 lt!77391) (ValueCellFull!1148 lt!77119)) (size!2637 (_values!3001 newMap!16))) (_vacant!651 newMap!16))))))

(declare-fun b!146867 () Bool)

(assert (=> b!146867 (= e!95874 e!95880)))

(assert (=> b!146867 (= lt!77391 (seekEntryOrOpen!0 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (_keys!4787 newMap!16) (mask!7398 newMap!16)))))

(assert (=> b!146867 (= c!27702 ((_ is Undefined!278) lt!77391))))

(declare-fun b!146868 () Bool)

(declare-fun lt!77396 () Unit!4629)

(assert (=> b!146868 (= e!95871 lt!77396)))

(assert (=> b!146868 (= lt!77396 call!16412)))

(assert (=> b!146868 (= lt!77405 call!16403)))

(declare-fun res!69837 () Bool)

(assert (=> b!146868 (= res!69837 ((_ is Found!278) lt!77405))))

(assert (=> b!146868 (=> (not res!69837) (not e!95872))))

(assert (=> b!146868 e!95872))

(declare-fun bm!16407 () Bool)

(declare-fun call!16394 () Bool)

(assert (=> bm!16407 (= call!16415 call!16394)))

(declare-fun b!146869 () Bool)

(assert (=> b!146869 (= e!95882 ((_ is Undefined!278) lt!77403))))

(declare-fun b!146870 () Bool)

(declare-fun Unit!4640 () Unit!4629)

(assert (=> b!146870 (= e!95871 Unit!4640)))

(declare-fun lt!77384 () Unit!4629)

(assert (=> b!146870 (= lt!77384 call!16406)))

(assert (=> b!146870 (= lt!77408 call!16403)))

(declare-fun c!27705 () Bool)

(assert (=> b!146870 (= c!27705 ((_ is MissingZero!278) lt!77408))))

(declare-fun e!95866 () Bool)

(assert (=> b!146870 e!95866))

(declare-fun lt!77392 () Unit!4629)

(assert (=> b!146870 (= lt!77392 lt!77384)))

(assert (=> b!146870 false))

(declare-fun bm!16408 () Bool)

(assert (=> bm!16408 (= call!16394 (arrayContainsKey!0 (_keys!4787 newMap!16) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!146871 () Bool)

(declare-fun Unit!4641 () Unit!4629)

(assert (=> b!146871 (= e!95869 Unit!4641)))

(declare-fun lt!77383 () Unit!4629)

(assert (=> b!146871 (= lt!77383 call!16412)))

(declare-fun lt!77385 () SeekEntryResult!278)

(declare-fun call!16400 () SeekEntryResult!278)

(assert (=> b!146871 (= lt!77385 call!16400)))

(declare-fun res!69841 () Bool)

(assert (=> b!146871 (= res!69841 ((_ is Found!278) lt!77385))))

(assert (=> b!146871 (=> (not res!69841) (not e!95868))))

(assert (=> b!146871 e!95868))

(declare-fun lt!77393 () Unit!4629)

(assert (=> b!146871 (= lt!77393 lt!77383)))

(assert (=> b!146871 false))

(declare-fun bm!16409 () Bool)

(declare-fun c!27695 () Bool)

(declare-fun updateHelperNewKey!70 (LongMapFixedSize!1204 (_ BitVec 64) V!3625 (_ BitVec 32)) tuple2!2696)

(assert (=> bm!16409 (= call!16408 (updateHelperNewKey!70 newMap!16 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119 (ite c!27695 (index!3282 lt!77391) (index!3279 lt!77391))))))

(declare-fun b!146872 () Bool)

(assert (=> b!146872 (= e!95870 (not call!16415))))

(declare-fun b!146873 () Bool)

(declare-fun lt!77394 () Unit!4629)

(assert (=> b!146873 (= e!95869 lt!77394)))

(assert (=> b!146873 (= lt!77394 call!16406)))

(assert (=> b!146873 (= lt!77403 call!16400)))

(declare-fun c!27700 () Bool)

(assert (=> b!146873 (= c!27700 ((_ is MissingZero!278) lt!77403))))

(assert (=> b!146873 e!95865))

(declare-fun bm!16410 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16410 (= call!16413 (inRange!0 (ite c!27702 (ite c!27696 (index!3280 lt!77385) (ite c!27700 (index!3279 lt!77403) (index!3282 lt!77403))) (ite c!27703 (index!3280 lt!77405) (ite c!27705 (index!3279 lt!77408) (index!3282 lt!77408)))) (mask!7398 newMap!16)))))

(declare-fun b!146874 () Bool)

(assert (=> b!146874 (= e!95883 (= call!16414 (+!182 call!16405 (tuple2!2699 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119))))))

(declare-fun b!146875 () Bool)

(assert (=> b!146875 (= c!27695 ((_ is MissingVacant!278) lt!77391))))

(declare-fun e!95879 () tuple2!2696)

(assert (=> b!146875 (= e!95880 e!95879)))

(declare-fun b!146876 () Bool)

(assert (=> b!146876 (= e!95881 e!95884)))

(declare-fun c!27704 () Bool)

(assert (=> b!146876 (= c!27704 (_1!1359 lt!77407))))

(declare-fun bm!16411 () Bool)

(assert (=> bm!16411 (= call!16417 call!16394)))

(declare-fun bm!16412 () Bool)

(assert (=> bm!16412 (= call!16405 (map!1464 newMap!16))))

(declare-fun b!146877 () Bool)

(assert (=> b!146877 (= e!95868 (= (select (arr!2360 (_keys!4787 newMap!16)) (index!3280 lt!77385)) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!146878 () Bool)

(declare-fun res!69844 () Bool)

(assert (=> b!146878 (=> (not res!69844) (not e!95877))))

(assert (=> b!146878 (= res!69844 call!16409)))

(assert (=> b!146878 (= e!95866 e!95877)))

(declare-fun b!146879 () Bool)

(assert (=> b!146879 (= e!95879 e!95885)))

(declare-fun c!27701 () Bool)

(assert (=> b!146879 (= c!27701 ((_ is MissingZero!278) lt!77391))))

(declare-fun b!146880 () Bool)

(assert (=> b!146880 (= e!95873 (getCurrentListMap!548 (_keys!4787 newMap!16) (_values!3001 newMap!16) (mask!7398 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3018 newMap!16)))))

(declare-fun b!146881 () Bool)

(declare-fun res!69846 () Bool)

(assert (=> b!146881 (= res!69846 (= (select (arr!2360 (_keys!4787 newMap!16)) (index!3282 lt!77408)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!146881 (=> (not res!69846) (not e!95867))))

(declare-fun b!146882 () Bool)

(declare-fun lt!77406 () tuple2!2696)

(assert (=> b!146882 (= e!95879 (tuple2!2697 (_1!1359 lt!77406) (_2!1359 lt!77406)))))

(assert (=> b!146882 (= lt!77406 call!16408)))

(declare-fun bm!16413 () Bool)

(assert (=> bm!16413 (= call!16416 call!16411)))

(declare-fun b!146883 () Bool)

(declare-fun c!27694 () Bool)

(assert (=> b!146883 (= c!27694 ((_ is MissingVacant!278) lt!77403))))

(assert (=> b!146883 (= e!95865 e!95882)))

(declare-fun b!146884 () Bool)

(declare-fun c!27693 () Bool)

(assert (=> b!146884 (= c!27693 ((_ is MissingVacant!278) lt!77408))))

(assert (=> b!146884 (= e!95866 e!95878)))

(declare-fun b!146885 () Bool)

(declare-fun lt!77386 () Unit!4629)

(declare-fun lt!77395 () Unit!4629)

(assert (=> b!146885 (= lt!77386 lt!77395)))

(assert (=> b!146885 (= call!16410 call!16395)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!70 (array!4997 array!4999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 V!3625 Int) Unit!4629)

(assert (=> b!146885 (= lt!77395 (lemmaChangeZeroKeyThenAddPairToListMap!70 (_keys!4787 newMap!16) (_values!3001 newMap!16) (mask!7398 newMap!16) (extraKeys!2763 newMap!16) lt!77409 (zeroValue!2863 newMap!16) lt!77119 (minValue!2863 newMap!16) (defaultEntry!3018 newMap!16)))))

(assert (=> b!146885 (= lt!77409 (bvor (extraKeys!2763 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!146885 (= e!95875 (tuple2!2697 true (LongMapFixedSize!1205 (defaultEntry!3018 newMap!16) (mask!7398 newMap!16) (bvor (extraKeys!2763 newMap!16) #b00000000000000000000000000000001) lt!77119 (minValue!2863 newMap!16) (_size!651 newMap!16) (_keys!4787 newMap!16) (_values!3001 newMap!16) (_vacant!651 newMap!16))))))

(declare-fun b!146886 () Bool)

(assert (=> b!146886 (= e!95867 (not call!16417))))

(declare-fun bm!16414 () Bool)

(assert (=> bm!16414 (= call!16400 call!16398)))

(declare-fun b!146887 () Bool)

(declare-fun res!69838 () Bool)

(assert (=> b!146887 (= res!69838 call!16397)))

(assert (=> b!146887 (=> (not res!69838) (not e!95872))))

(assert (= (and d!46369 c!27698) b!146855))

(assert (= (and d!46369 (not c!27698)) b!146867))

(assert (= (and b!146855 c!27697) b!146885))

(assert (= (and b!146855 (not c!27697)) b!146849))

(assert (= (or b!146885 b!146849) bm!16402))

(assert (= (or b!146885 b!146849) bm!16413))

(assert (= (or b!146885 b!146849) bm!16404))

(assert (= (and b!146867 c!27702) b!146861))

(assert (= (and b!146867 (not c!27702)) b!146875))

(assert (= (and b!146861 c!27696) b!146871))

(assert (= (and b!146861 (not c!27696)) b!146873))

(assert (= (and b!146871 res!69841) b!146850))

(assert (= (and b!146850 res!69845) b!146877))

(assert (= (and b!146873 c!27700) b!146859))

(assert (= (and b!146873 (not c!27700)) b!146883))

(assert (= (and b!146859 res!69834) b!146848))

(assert (= (and b!146848 res!69840) b!146851))

(assert (= (and b!146883 c!27694) b!146858))

(assert (= (and b!146883 (not c!27694)) b!146869))

(assert (= (and b!146858 res!69836) b!146852))

(assert (= (and b!146852 res!69839) b!146872))

(assert (= (or b!146859 b!146858) bm!16395))

(assert (= (or b!146851 b!146872) bm!16407))

(assert (= (or b!146850 bm!16395) bm!16400))

(assert (= (or b!146871 b!146873) bm!16414))

(assert (= (and b!146875 c!27695) b!146882))

(assert (= (and b!146875 (not c!27695)) b!146879))

(assert (= (and b!146879 c!27701) b!146853))

(assert (= (and b!146879 (not c!27701)) b!146866))

(assert (= (and b!146866 c!27703) b!146868))

(assert (= (and b!146866 (not c!27703)) b!146870))

(assert (= (and b!146868 res!69837) b!146887))

(assert (= (and b!146887 res!69838) b!146854))

(assert (= (and b!146870 c!27705) b!146878))

(assert (= (and b!146870 (not c!27705)) b!146884))

(assert (= (and b!146878 res!69844) b!146865))

(assert (= (and b!146865 res!69842) b!146860))

(assert (= (and b!146884 c!27693) b!146856))

(assert (= (and b!146884 (not c!27693)) b!146863))

(assert (= (and b!146856 res!69847) b!146881))

(assert (= (and b!146881 res!69846) b!146886))

(assert (= (or b!146878 b!146856) bm!16397))

(assert (= (or b!146860 b!146886) bm!16411))

(assert (= (or b!146887 bm!16397) bm!16399))

(assert (= (or b!146868 b!146870) bm!16394))

(assert (= (or b!146882 b!146853) bm!16409))

(assert (= (or bm!16400 bm!16399) bm!16410))

(assert (= (or bm!16407 bm!16411) bm!16408))

(assert (= (or bm!16414 bm!16394) bm!16401))

(assert (= (or b!146871 b!146868) bm!16405))

(assert (= (or b!146873 b!146870) bm!16398))

(assert (= (or b!146861 b!146866) bm!16393))

(assert (= (or b!146861 b!146866) bm!16403))

(assert (= (or bm!16402 bm!16393) bm!16396))

(assert (= (or bm!16413 b!146866) bm!16392))

(assert (= (or bm!16404 b!146866) bm!16391))

(assert (= (and bm!16391 c!27699) b!146864))

(assert (= (and bm!16391 (not c!27699)) b!146880))

(assert (= (and d!46369 res!69843) b!146876))

(assert (= (and b!146876 c!27704) b!146862))

(assert (= (and b!146876 (not c!27704)) b!146857))

(assert (= (and b!146862 res!69835) b!146874))

(assert (= (or b!146874 b!146857) bm!16412))

(assert (= (or b!146862 b!146874 b!146857) bm!16406))

(declare-fun m!176571 () Bool)

(assert (=> b!146877 m!176571))

(declare-fun m!176573 () Bool)

(assert (=> bm!16403 m!176573))

(declare-fun m!176575 () Bool)

(assert (=> bm!16403 m!176575))

(declare-fun m!176577 () Bool)

(assert (=> bm!16391 m!176577))

(declare-fun m!176579 () Bool)

(assert (=> b!146874 m!176579))

(assert (=> bm!16412 m!176283))

(assert (=> bm!16408 m!176275))

(declare-fun m!176581 () Bool)

(assert (=> bm!16408 m!176581))

(declare-fun m!176583 () Bool)

(assert (=> bm!16396 m!176583))

(declare-fun m!176585 () Bool)

(assert (=> bm!16410 m!176585))

(declare-fun m!176587 () Bool)

(assert (=> d!46369 m!176587))

(assert (=> d!46369 m!176341))

(assert (=> bm!16398 m!176275))

(declare-fun m!176589 () Bool)

(assert (=> bm!16398 m!176589))

(assert (=> b!146862 m!176275))

(declare-fun m!176591 () Bool)

(assert (=> b!146862 m!176591))

(assert (=> b!146867 m!176275))

(declare-fun m!176593 () Bool)

(assert (=> b!146867 m!176593))

(declare-fun m!176595 () Bool)

(assert (=> b!146881 m!176595))

(declare-fun m!176597 () Bool)

(assert (=> bm!16406 m!176597))

(assert (=> bm!16401 m!176275))

(assert (=> bm!16401 m!176593))

(assert (=> bm!16405 m!176275))

(declare-fun m!176599 () Bool)

(assert (=> bm!16405 m!176599))

(declare-fun m!176601 () Bool)

(assert (=> b!146848 m!176601))

(assert (=> bm!16409 m!176275))

(declare-fun m!176603 () Bool)

(assert (=> bm!16409 m!176603))

(declare-fun m!176605 () Bool)

(assert (=> b!146885 m!176605))

(declare-fun m!176607 () Bool)

(assert (=> b!146854 m!176607))

(declare-fun m!176609 () Bool)

(assert (=> b!146865 m!176609))

(assert (=> b!146866 m!176505))

(declare-fun m!176611 () Bool)

(assert (=> b!146866 m!176611))

(assert (=> b!146866 m!176275))

(declare-fun m!176613 () Bool)

(assert (=> b!146866 m!176613))

(declare-fun m!176615 () Bool)

(assert (=> b!146866 m!176615))

(assert (=> b!146866 m!176505))

(assert (=> b!146866 m!176275))

(declare-fun m!176617 () Bool)

(assert (=> b!146866 m!176617))

(assert (=> bm!16392 m!176615))

(declare-fun m!176619 () Bool)

(assert (=> bm!16392 m!176619))

(declare-fun m!176621 () Bool)

(assert (=> b!146849 m!176621))

(declare-fun m!176623 () Bool)

(assert (=> b!146852 m!176623))

(assert (=> b!146880 m!176505))

(assert (=> b!146538 d!46369))

(declare-fun d!46371 () Bool)

(declare-fun c!27708 () Bool)

(assert (=> d!46371 (= c!27708 ((_ is ValueCellFull!1148) (select (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun e!95888 () V!3625)

(assert (=> d!46371 (= (get!1583 (select (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) from!355) (dynLambda!459 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!95888)))

(declare-fun b!146892 () Bool)

(declare-fun get!1585 (ValueCell!1148 V!3625) V!3625)

(assert (=> b!146892 (= e!95888 (get!1585 (select (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) from!355) (dynLambda!459 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!146893 () Bool)

(declare-fun get!1586 (ValueCell!1148 V!3625) V!3625)

(assert (=> b!146893 (= e!95888 (get!1586 (select (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) from!355) (dynLambda!459 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46371 c!27708) b!146892))

(assert (= (and d!46371 (not c!27708)) b!146893))

(assert (=> b!146892 m!176277))

(assert (=> b!146892 m!176279))

(declare-fun m!176625 () Bool)

(assert (=> b!146892 m!176625))

(assert (=> b!146893 m!176277))

(assert (=> b!146893 m!176279))

(declare-fun m!176627 () Bool)

(assert (=> b!146893 m!176627))

(assert (=> b!146536 d!46371))

(declare-fun d!46373 () Bool)

(assert (=> d!46373 (not (arrayContainsKey!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77412 () Unit!4629)

(declare-fun choose!68 (array!4997 (_ BitVec 32) (_ BitVec 64) List!1761) Unit!4629)

(assert (=> d!46373 (= lt!77412 (choose!68 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (Cons!1757 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) Nil!1758)))))

(assert (=> d!46373 (bvslt (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46373 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (Cons!1757 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) Nil!1758)) lt!77412)))

(declare-fun bs!6155 () Bool)

(assert (= bs!6155 d!46373))

(assert (=> bs!6155 m!176275))

(assert (=> bs!6155 m!176305))

(assert (=> bs!6155 m!176275))

(declare-fun m!176629 () Bool)

(assert (=> bs!6155 m!176629))

(assert (=> b!146537 d!46373))

(declare-fun d!46375 () Bool)

(assert (=> d!46375 (arrayNoDuplicates!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) from!355 Nil!1758)))

(declare-fun lt!77415 () Unit!4629)

(declare-fun choose!39 (array!4997 (_ BitVec 32) (_ BitVec 32)) Unit!4629)

(assert (=> d!46375 (= lt!77415 (choose!39 (_keys!4787 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!46375 (bvslt (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46375 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000000 from!355) lt!77415)))

(declare-fun bs!6156 () Bool)

(assert (= bs!6156 d!46375))

(assert (=> bs!6156 m!176301))

(declare-fun m!176631 () Bool)

(assert (=> bs!6156 m!176631))

(assert (=> b!146537 d!46375))

(declare-fun d!46377 () Bool)

(declare-fun res!69852 () Bool)

(declare-fun e!95893 () Bool)

(assert (=> d!46377 (=> res!69852 e!95893)))

(assert (=> d!46377 (= res!69852 (= (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(assert (=> d!46377 (= (arrayContainsKey!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!95893)))

(declare-fun b!146898 () Bool)

(declare-fun e!95894 () Bool)

(assert (=> b!146898 (= e!95893 e!95894)))

(declare-fun res!69853 () Bool)

(assert (=> b!146898 (=> (not res!69853) (not e!95894))))

(assert (=> b!146898 (= res!69853 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146899 () Bool)

(assert (=> b!146899 (= e!95894 (arrayContainsKey!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!46377 (not res!69852)) b!146898))

(assert (= (and b!146898 res!69853) b!146899))

(assert (=> d!46377 m!176521))

(assert (=> b!146899 m!176275))

(declare-fun m!176633 () Bool)

(assert (=> b!146899 m!176633))

(assert (=> b!146537 d!46377))

(declare-fun d!46379 () Bool)

(declare-fun e!95897 () Bool)

(assert (=> d!46379 e!95897))

(declare-fun c!27711 () Bool)

(assert (=> d!46379 (= c!27711 (and (not (= (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77418 () Unit!4629)

(declare-fun choose!907 (array!4997 array!4999 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 64) (_ BitVec 32) Int) Unit!4629)

(assert (=> d!46379 (= lt!77418 (choose!907 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(assert (=> d!46379 (validMask!0 (mask!7398 (v!3364 (underlying!505 thiss!992))))))

(assert (=> d!46379 (= (lemmaListMapContainsThenArrayContainsFrom!155 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))) lt!77418)))

(declare-fun b!146904 () Bool)

(assert (=> b!146904 (= e!95897 (arrayContainsKey!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!146905 () Bool)

(assert (=> b!146905 (= e!95897 (ite (= (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46379 c!27711) b!146904))

(assert (= (and d!46379 (not c!27711)) b!146905))

(assert (=> d!46379 m!176275))

(declare-fun m!176635 () Bool)

(assert (=> d!46379 m!176635))

(assert (=> d!46379 m!176551))

(assert (=> b!146904 m!176275))

(assert (=> b!146904 m!176305))

(assert (=> b!146537 d!46379))

(declare-fun b!146916 () Bool)

(declare-fun e!95909 () Bool)

(declare-fun call!16420 () Bool)

(assert (=> b!146916 (= e!95909 call!16420)))

(declare-fun c!27714 () Bool)

(declare-fun bm!16417 () Bool)

(assert (=> bm!16417 (= call!16420 (arrayNoDuplicates!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27714 (Cons!1757 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) Nil!1758) Nil!1758)))))

(declare-fun d!46381 () Bool)

(declare-fun res!69862 () Bool)

(declare-fun e!95908 () Bool)

(assert (=> d!46381 (=> res!69862 e!95908)))

(assert (=> d!46381 (= res!69862 (bvsge from!355 (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> d!46381 (= (arrayNoDuplicates!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) from!355 Nil!1758) e!95908)))

(declare-fun b!146917 () Bool)

(declare-fun e!95906 () Bool)

(assert (=> b!146917 (= e!95908 e!95906)))

(declare-fun res!69860 () Bool)

(assert (=> b!146917 (=> (not res!69860) (not e!95906))))

(declare-fun e!95907 () Bool)

(assert (=> b!146917 (= res!69860 (not e!95907))))

(declare-fun res!69861 () Bool)

(assert (=> b!146917 (=> (not res!69861) (not e!95907))))

(assert (=> b!146917 (= res!69861 (validKeyInArray!0 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!146918 () Bool)

(assert (=> b!146918 (= e!95909 call!16420)))

(declare-fun b!146919 () Bool)

(declare-fun contains!935 (List!1761 (_ BitVec 64)) Bool)

(assert (=> b!146919 (= e!95907 (contains!935 Nil!1758 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!146920 () Bool)

(assert (=> b!146920 (= e!95906 e!95909)))

(assert (=> b!146920 (= c!27714 (validKeyInArray!0 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(assert (= (and d!46381 (not res!69862)) b!146917))

(assert (= (and b!146917 res!69861) b!146919))

(assert (= (and b!146917 res!69860) b!146920))

(assert (= (and b!146920 c!27714) b!146916))

(assert (= (and b!146920 (not c!27714)) b!146918))

(assert (= (or b!146916 b!146918) bm!16417))

(assert (=> bm!16417 m!176275))

(declare-fun m!176637 () Bool)

(assert (=> bm!16417 m!176637))

(assert (=> b!146917 m!176275))

(assert (=> b!146917 m!176275))

(declare-fun m!176639 () Bool)

(assert (=> b!146917 m!176639))

(assert (=> b!146919 m!176275))

(assert (=> b!146919 m!176275))

(declare-fun m!176641 () Bool)

(assert (=> b!146919 m!176641))

(assert (=> b!146920 m!176275))

(assert (=> b!146920 m!176275))

(assert (=> b!146920 m!176639))

(assert (=> b!146537 d!46381))

(declare-fun lt!77487 () (_ BitVec 64))

(declare-fun bm!16444 () Bool)

(declare-fun lt!77484 () ListLongMap!1725)

(declare-fun lt!77499 () V!3625)

(declare-fun c!27731 () Bool)

(declare-fun call!16455 () Unit!4629)

(declare-fun lt!77498 () ListLongMap!1725)

(declare-fun lt!77511 () (_ BitVec 64))

(declare-fun lt!77486 () (_ BitVec 64))

(assert (=> bm!16444 (= call!16455 (addCommutativeForDiffKeys!76 (ite c!27731 lt!77484 lt!77498) lt!77486 lt!77499 (ite c!27731 lt!77487 lt!77511) (ite c!27731 (minValue!2863 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun call!16453 () ListLongMap!1725)

(declare-fun bm!16445 () Bool)

(declare-fun call!16450 () ListLongMap!1725)

(assert (=> bm!16445 (= call!16453 (+!182 call!16450 (ite c!27731 (tuple2!2699 lt!77487 (minValue!2863 (v!3364 (underlying!505 thiss!992)))) (tuple2!2699 lt!77511 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))))))))

(declare-fun call!16456 () ListLongMap!1725)

(declare-fun call!16454 () ListLongMap!1725)

(declare-fun call!16458 () ListLongMap!1725)

(declare-fun bm!16446 () Bool)

(assert (=> bm!16446 (= call!16454 (+!182 (ite c!27731 call!16456 call!16458) (ite c!27731 (tuple2!2699 lt!77486 lt!77499) (tuple2!2699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))))))))

(declare-fun b!146949 () Bool)

(assert (=> b!146949 false))

(declare-fun lt!77503 () Unit!4629)

(declare-fun lt!77507 () Unit!4629)

(assert (=> b!146949 (= lt!77503 lt!77507)))

(declare-fun lt!77512 () (_ BitVec 32))

(assert (=> b!146949 (not (arrayContainsKey!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) lt!77486 lt!77512))))

(assert (=> b!146949 (= lt!77507 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) lt!77512 lt!77486 (Cons!1757 lt!77486 Nil!1758)))))

(assert (=> b!146949 (= lt!77512 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!77494 () Unit!4629)

(declare-fun lt!77508 () Unit!4629)

(assert (=> b!146949 (= lt!77494 lt!77508)))

(assert (=> b!146949 (arrayNoDuplicates!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1758)))

(assert (=> b!146949 (= lt!77508 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!77496 () Unit!4629)

(declare-fun lt!77510 () Unit!4629)

(assert (=> b!146949 (= lt!77496 lt!77510)))

(declare-fun e!95926 () Bool)

(assert (=> b!146949 e!95926))

(declare-fun c!27732 () Bool)

(assert (=> b!146949 (= c!27732 (and (not (= lt!77486 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!77486 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77506 () (_ BitVec 32))

(assert (=> b!146949 (= lt!77510 (lemmaListMapContainsThenArrayContainsFrom!155 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) lt!77486 lt!77506 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(assert (=> b!146949 (= lt!77506 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun e!95930 () Unit!4629)

(declare-fun Unit!4642 () Unit!4629)

(assert (=> b!146949 (= e!95930 Unit!4642)))

(declare-fun lt!77505 () (_ BitVec 64))

(declare-fun lt!77502 () ListLongMap!1725)

(declare-fun bm!16447 () Bool)

(declare-fun call!16451 () Unit!4629)

(declare-fun lt!77500 () ListLongMap!1725)

(declare-fun lt!77489 () (_ BitVec 64))

(assert (=> bm!16447 (= call!16451 (addCommutativeForDiffKeys!76 (ite c!27731 lt!77502 lt!77500) lt!77486 lt!77499 (ite c!27731 lt!77489 lt!77505) (ite c!27731 (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146950 () Bool)

(declare-fun e!95932 () tuple2!2696)

(declare-fun e!95929 () tuple2!2696)

(assert (=> b!146950 (= e!95932 e!95929)))

(declare-fun c!27729 () Bool)

(assert (=> b!146950 (= c!27729 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun call!16447 () ListLongMap!1725)

(declare-fun bm!16448 () Bool)

(declare-fun call!16452 () ListLongMap!1725)

(declare-fun call!16459 () ListLongMap!1725)

(assert (=> bm!16448 (= call!16452 (+!182 (ite c!27731 call!16459 call!16447) (tuple2!2699 lt!77486 lt!77499)))))

(declare-fun b!146951 () Bool)

(assert (=> b!146951 (= e!95929 (tuple2!2697 true (_2!1359 lt!77124)))))

(declare-fun bm!16449 () Bool)

(assert (=> bm!16449 (= call!16450 (+!182 (ite c!27731 lt!77484 lt!77498) (tuple2!2699 lt!77486 lt!77499)))))

(declare-fun b!146952 () Bool)

(declare-fun e!95931 () tuple2!2696)

(assert (=> b!146952 (= e!95932 e!95931)))

(declare-fun lt!77514 () tuple2!2696)

(assert (=> b!146952 (= lt!77514 (update!226 (_2!1359 lt!77124) lt!77486 lt!77499))))

(declare-fun c!27727 () Bool)

(declare-fun lt!77492 () ListLongMap!1725)

(assert (=> b!146952 (= c!27727 (contains!933 lt!77492 lt!77486))))

(declare-fun lt!77495 () Unit!4629)

(assert (=> b!146952 (= lt!77495 e!95930)))

(declare-fun c!27728 () Bool)

(assert (=> b!146952 (= c!27728 (_1!1359 lt!77514))))

(declare-fun b!146953 () Bool)

(assert (=> b!146953 (= e!95931 (tuple2!2697 false (_2!1359 lt!77514)))))

(declare-fun b!146955 () Bool)

(declare-fun Unit!4643 () Unit!4629)

(assert (=> b!146955 (= e!95930 Unit!4643)))

(declare-fun bm!16450 () Bool)

(assert (=> bm!16450 (= call!16447 (+!182 (ite c!27731 lt!77502 lt!77498) (ite c!27731 (tuple2!2699 lt!77486 lt!77499) (tuple2!2699 lt!77511 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))))))))

(declare-fun b!146956 () Bool)

(declare-fun e!95933 () Bool)

(declare-fun lt!77490 () tuple2!2696)

(assert (=> b!146956 (= e!95933 (= (map!1464 (_2!1359 lt!77490)) (map!1464 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146957 () Bool)

(assert (=> b!146957 (= e!95926 (arrayContainsKey!0 (_keys!4787 (v!3364 (underlying!505 thiss!992))) lt!77486 lt!77506))))

(declare-fun bm!16451 () Bool)

(declare-fun call!16457 () ListLongMap!1725)

(assert (=> bm!16451 (= call!16457 (+!182 (ite c!27731 call!16447 call!16459) (ite c!27731 (tuple2!2699 lt!77489 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))) (tuple2!2699 lt!77486 lt!77499))))))

(declare-fun bm!16452 () Bool)

(assert (=> bm!16452 (= call!16458 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun bm!16453 () Bool)

(assert (=> bm!16453 (= call!16456 (+!182 (ite c!27731 lt!77502 lt!77500) (ite c!27731 (tuple2!2699 lt!77489 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))) (tuple2!2699 lt!77486 lt!77499))))))

(declare-fun b!146958 () Bool)

(declare-fun e!95928 () tuple2!2696)

(assert (=> b!146958 (= e!95928 (tuple2!2697 true (_2!1359 lt!77514)))))

(assert (=> b!146958 (= lt!77498 call!16458)))

(assert (=> b!146958 (= lt!77511 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77513 () Unit!4629)

(assert (=> b!146958 (= lt!77513 call!16455)))

(assert (=> b!146958 (= call!16453 call!16452)))

(declare-fun lt!77488 () Unit!4629)

(assert (=> b!146958 (= lt!77488 lt!77513)))

(assert (=> b!146958 (= lt!77500 call!16454)))

(assert (=> b!146958 (= lt!77505 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77504 () Unit!4629)

(assert (=> b!146958 (= lt!77504 call!16451)))

(declare-fun call!16449 () ListLongMap!1725)

(assert (=> b!146958 (= call!16449 call!16457)))

(declare-fun lt!77497 () Unit!4629)

(assert (=> b!146958 (= lt!77497 lt!77504)))

(declare-fun b!146959 () Bool)

(declare-fun lt!77509 () tuple2!2696)

(declare-fun call!16448 () tuple2!2696)

(assert (=> b!146959 (= lt!77509 call!16448)))

(assert (=> b!146959 (= e!95929 (tuple2!2697 (_1!1359 lt!77509) (_2!1359 lt!77509)))))

(declare-fun b!146954 () Bool)

(declare-fun e!95927 () Bool)

(assert (=> b!146954 (= e!95927 e!95933)))

(declare-fun res!69868 () Bool)

(assert (=> b!146954 (=> (not res!69868) (not e!95933))))

(assert (=> b!146954 (= res!69868 (valid!605 (_2!1359 lt!77490)))))

(declare-fun d!46383 () Bool)

(assert (=> d!46383 e!95927))

(declare-fun res!69867 () Bool)

(assert (=> d!46383 (=> res!69867 e!95927)))

(assert (=> d!46383 (= res!69867 (not (_1!1359 lt!77490)))))

(assert (=> d!46383 (= lt!77490 e!95932)))

(declare-fun c!27730 () Bool)

(assert (=> d!46383 (= c!27730 (and (not (= lt!77486 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!77486 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!46383 (= lt!77492 (map!1464 (_2!1359 lt!77124)))))

(assert (=> d!46383 (= lt!77499 (get!1583 (select (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!459 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46383 (= lt!77486 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!46383 (valid!606 thiss!992)))

(assert (=> d!46383 (= (repackFrom!15 thiss!992 (_2!1359 lt!77124) (bvsub from!355 #b00000000000000000000000000000001)) lt!77490)))

(declare-fun bm!16454 () Bool)

(assert (=> bm!16454 (= call!16448 (repackFrom!15 thiss!992 (ite c!27730 (_2!1359 lt!77514) (_2!1359 lt!77124)) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun b!146960 () Bool)

(declare-fun lt!77485 () tuple2!2696)

(assert (=> b!146960 (= e!95928 (tuple2!2697 (_1!1359 lt!77485) (_2!1359 lt!77485)))))

(assert (=> b!146960 (= lt!77502 call!16458)))

(assert (=> b!146960 (= lt!77489 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77491 () Unit!4629)

(assert (=> b!146960 (= lt!77491 call!16451)))

(assert (=> b!146960 (= call!16457 call!16454)))

(declare-fun lt!77501 () Unit!4629)

(assert (=> b!146960 (= lt!77501 lt!77491)))

(assert (=> b!146960 (= lt!77484 call!16449)))

(assert (=> b!146960 (= lt!77487 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77483 () Unit!4629)

(assert (=> b!146960 (= lt!77483 call!16455)))

(assert (=> b!146960 (= call!16453 call!16452)))

(declare-fun lt!77493 () Unit!4629)

(assert (=> b!146960 (= lt!77493 lt!77483)))

(assert (=> b!146960 (= lt!77485 call!16448)))

(declare-fun bm!16455 () Bool)

(assert (=> bm!16455 (= call!16449 (+!182 (ite c!27731 call!16458 call!16456) (ite c!27731 (tuple2!2699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))) (tuple2!2699 lt!77505 (minValue!2863 (v!3364 (underlying!505 thiss!992)))))))))

(declare-fun b!146961 () Bool)

(assert (=> b!146961 (= c!27731 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!146961 (= e!95931 e!95928)))

(declare-fun bm!16456 () Bool)

(assert (=> bm!16456 (= call!16459 (+!182 (ite c!27731 lt!77484 lt!77500) (ite c!27731 (tuple2!2699 lt!77487 (minValue!2863 (v!3364 (underlying!505 thiss!992)))) (tuple2!2699 lt!77505 (minValue!2863 (v!3364 (underlying!505 thiss!992)))))))))

(declare-fun b!146962 () Bool)

(assert (=> b!146962 (= e!95926 (ite (= lt!77486 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46383 c!27730) b!146952))

(assert (= (and d!46383 (not c!27730)) b!146950))

(assert (= (and b!146952 c!27727) b!146949))

(assert (= (and b!146952 (not c!27727)) b!146955))

(assert (= (and b!146949 c!27732) b!146957))

(assert (= (and b!146949 (not c!27732)) b!146962))

(assert (= (and b!146952 c!27728) b!146961))

(assert (= (and b!146952 (not c!27728)) b!146953))

(assert (= (and b!146961 c!27731) b!146960))

(assert (= (and b!146961 (not c!27731)) b!146958))

(assert (= (or b!146960 b!146958) bm!16456))

(assert (= (or b!146960 b!146958) bm!16450))

(assert (= (or b!146960 b!146958) bm!16447))

(assert (= (or b!146960 b!146958) bm!16449))

(assert (= (or b!146960 b!146958) bm!16452))

(assert (= (or b!146960 b!146958) bm!16453))

(assert (= (or b!146960 b!146958) bm!16444))

(assert (= (or b!146960 b!146958) bm!16448))

(assert (= (or b!146960 b!146958) bm!16455))

(assert (= (or b!146960 b!146958) bm!16451))

(assert (= (or b!146960 b!146958) bm!16446))

(assert (= (or b!146960 b!146958) bm!16445))

(assert (= (and b!146950 c!27729) b!146959))

(assert (= (and b!146950 (not c!27729)) b!146951))

(assert (= (or b!146960 b!146959) bm!16454))

(assert (= (and d!46383 (not res!69867)) b!146954))

(assert (= (and b!146954 res!69868) b!146956))

(declare-fun b_lambda!6579 () Bool)

(assert (=> (not b_lambda!6579) (not d!46383)))

(assert (=> d!46383 t!6467))

(declare-fun b_and!9213 () Bool)

(assert (= b_and!9209 (and (=> t!6467 result!4363) b_and!9213)))

(assert (=> d!46383 t!6469))

(declare-fun b_and!9215 () Bool)

(assert (= b_and!9211 (and (=> t!6469 result!4367) b_and!9215)))

(declare-fun m!176643 () Bool)

(assert (=> bm!16446 m!176643))

(declare-fun m!176645 () Bool)

(assert (=> bm!16451 m!176645))

(declare-fun m!176647 () Bool)

(assert (=> bm!16455 m!176647))

(declare-fun m!176649 () Bool)

(assert (=> bm!16444 m!176649))

(declare-fun m!176651 () Bool)

(assert (=> bm!16453 m!176651))

(declare-fun m!176653 () Bool)

(assert (=> bm!16449 m!176653))

(declare-fun m!176655 () Bool)

(assert (=> b!146954 m!176655))

(declare-fun m!176657 () Bool)

(assert (=> b!146952 m!176657))

(declare-fun m!176659 () Bool)

(assert (=> b!146952 m!176659))

(declare-fun m!176661 () Bool)

(assert (=> b!146949 m!176661))

(declare-fun m!176663 () Bool)

(assert (=> b!146949 m!176663))

(declare-fun m!176665 () Bool)

(assert (=> b!146949 m!176665))

(declare-fun m!176667 () Bool)

(assert (=> b!146949 m!176667))

(declare-fun m!176669 () Bool)

(assert (=> b!146949 m!176669))

(declare-fun m!176671 () Bool)

(assert (=> d!46383 m!176671))

(assert (=> d!46383 m!176279))

(declare-fun m!176673 () Bool)

(assert (=> d!46383 m!176673))

(assert (=> d!46383 m!176279))

(assert (=> d!46383 m!176297))

(assert (=> d!46383 m!176319))

(assert (=> d!46383 m!176671))

(declare-fun m!176675 () Bool)

(assert (=> d!46383 m!176675))

(declare-fun m!176677 () Bool)

(assert (=> bm!16454 m!176677))

(declare-fun m!176679 () Bool)

(assert (=> bm!16448 m!176679))

(declare-fun m!176681 () Bool)

(assert (=> bm!16447 m!176681))

(declare-fun m!176683 () Bool)

(assert (=> bm!16450 m!176683))

(declare-fun m!176685 () Bool)

(assert (=> bm!16452 m!176685))

(declare-fun m!176687 () Bool)

(assert (=> b!146957 m!176687))

(declare-fun m!176689 () Bool)

(assert (=> bm!16456 m!176689))

(declare-fun m!176691 () Bool)

(assert (=> b!146956 m!176691))

(assert (=> b!146956 m!176311))

(declare-fun m!176693 () Bool)

(assert (=> bm!16445 m!176693))

(assert (=> b!146531 d!46383))

(declare-fun d!46385 () Bool)

(assert (=> d!46385 (= (map!1464 (_2!1359 lt!77124)) (getCurrentListMap!548 (_keys!4787 (_2!1359 lt!77124)) (_values!3001 (_2!1359 lt!77124)) (mask!7398 (_2!1359 lt!77124)) (extraKeys!2763 (_2!1359 lt!77124)) (zeroValue!2863 (_2!1359 lt!77124)) (minValue!2863 (_2!1359 lt!77124)) #b00000000000000000000000000000000 (defaultEntry!3018 (_2!1359 lt!77124))))))

(declare-fun bs!6157 () Bool)

(assert (= bs!6157 d!46385))

(declare-fun m!176695 () Bool)

(assert (=> bs!6157 m!176695))

(assert (=> b!146540 d!46385))

(declare-fun b!146987 () Bool)

(declare-fun lt!77531 () Unit!4629)

(declare-fun lt!77532 () Unit!4629)

(assert (=> b!146987 (= lt!77531 lt!77532)))

(declare-fun lt!77530 () (_ BitVec 64))

(declare-fun lt!77534 () V!3625)

(declare-fun lt!77535 () ListLongMap!1725)

(declare-fun lt!77533 () (_ BitVec 64))

(assert (=> b!146987 (not (contains!933 (+!182 lt!77535 (tuple2!2699 lt!77530 lt!77534)) lt!77533))))

(declare-fun addStillNotContains!70 (ListLongMap!1725 (_ BitVec 64) V!3625 (_ BitVec 64)) Unit!4629)

(assert (=> b!146987 (= lt!77532 (addStillNotContains!70 lt!77535 lt!77530 lt!77534 lt!77533))))

(assert (=> b!146987 (= lt!77533 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!146987 (= lt!77534 (get!1583 (select (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!459 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146987 (= lt!77530 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!16462 () ListLongMap!1725)

(assert (=> b!146987 (= lt!77535 call!16462)))

(declare-fun e!95952 () ListLongMap!1725)

(assert (=> b!146987 (= e!95952 (+!182 call!16462 (tuple2!2699 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1583 (select (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!459 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!77529 () ListLongMap!1725)

(declare-fun b!146988 () Bool)

(declare-fun e!95951 () Bool)

(assert (=> b!146988 (= e!95951 (= lt!77529 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146989 () Bool)

(declare-fun e!95953 () ListLongMap!1725)

(assert (=> b!146989 (= e!95953 e!95952)))

(declare-fun c!27743 () Bool)

(assert (=> b!146989 (= c!27743 (validKeyInArray!0 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!146990 () Bool)

(declare-fun e!95948 () Bool)

(declare-fun e!95950 () Bool)

(assert (=> b!146990 (= e!95948 e!95950)))

(assert (=> b!146990 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun res!69879 () Bool)

(assert (=> b!146990 (= res!69879 (contains!933 lt!77529 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!146990 (=> (not res!69879) (not e!95950))))

(declare-fun b!146991 () Bool)

(declare-fun isEmpty!432 (ListLongMap!1725) Bool)

(assert (=> b!146991 (= e!95951 (isEmpty!432 lt!77529))))

(declare-fun b!146992 () Bool)

(declare-fun e!95949 () Bool)

(assert (=> b!146992 (= e!95949 (validKeyInArray!0 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!146992 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!146993 () Bool)

(assert (=> b!146993 (= e!95953 (ListLongMap!1726 Nil!1759))))

(declare-fun bm!16459 () Bool)

(assert (=> bm!16459 (= call!16462 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146994 () Bool)

(assert (=> b!146994 (= e!95952 call!16462)))

(declare-fun b!146995 () Bool)

(declare-fun e!95954 () Bool)

(assert (=> b!146995 (= e!95954 e!95948)))

(declare-fun c!27742 () Bool)

(assert (=> b!146995 (= c!27742 e!95949)))

(declare-fun res!69877 () Bool)

(assert (=> b!146995 (=> (not res!69877) (not e!95949))))

(assert (=> b!146995 (= res!69877 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146996 () Bool)

(declare-fun res!69880 () Bool)

(assert (=> b!146996 (=> (not res!69880) (not e!95954))))

(assert (=> b!146996 (= res!69880 (not (contains!933 lt!77529 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!46387 () Bool)

(assert (=> d!46387 e!95954))

(declare-fun res!69878 () Bool)

(assert (=> d!46387 (=> (not res!69878) (not e!95954))))

(assert (=> d!46387 (= res!69878 (not (contains!933 lt!77529 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46387 (= lt!77529 e!95953)))

(declare-fun c!27744 () Bool)

(assert (=> d!46387 (= c!27744 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> d!46387 (validMask!0 (mask!7398 (v!3364 (underlying!505 thiss!992))))))

(assert (=> d!46387 (= (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))) lt!77529)))

(declare-fun b!146997 () Bool)

(assert (=> b!146997 (= e!95948 e!95951)))

(declare-fun c!27741 () Bool)

(assert (=> b!146997 (= c!27741 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146998 () Bool)

(assert (=> b!146998 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> b!146998 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2637 (_values!3001 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> b!146998 (= e!95950 (= (apply!125 lt!77529 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1583 (select (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!459 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!46387 c!27744) b!146993))

(assert (= (and d!46387 (not c!27744)) b!146989))

(assert (= (and b!146989 c!27743) b!146987))

(assert (= (and b!146989 (not c!27743)) b!146994))

(assert (= (or b!146987 b!146994) bm!16459))

(assert (= (and d!46387 res!69878) b!146996))

(assert (= (and b!146996 res!69880) b!146995))

(assert (= (and b!146995 res!69877) b!146992))

(assert (= (and b!146995 c!27742) b!146990))

(assert (= (and b!146995 (not c!27742)) b!146997))

(assert (= (and b!146990 res!69879) b!146998))

(assert (= (and b!146997 c!27741) b!146988))

(assert (= (and b!146997 (not c!27741)) b!146991))

(declare-fun b_lambda!6581 () Bool)

(assert (=> (not b_lambda!6581) (not b!146987)))

(assert (=> b!146987 t!6467))

(declare-fun b_and!9217 () Bool)

(assert (= b_and!9213 (and (=> t!6467 result!4363) b_and!9217)))

(assert (=> b!146987 t!6469))

(declare-fun b_and!9219 () Bool)

(assert (= b_and!9215 (and (=> t!6469 result!4367) b_and!9219)))

(declare-fun b_lambda!6583 () Bool)

(assert (=> (not b_lambda!6583) (not b!146998)))

(assert (=> b!146998 t!6467))

(declare-fun b_and!9221 () Bool)

(assert (= b_and!9217 (and (=> t!6467 result!4363) b_and!9221)))

(assert (=> b!146998 t!6469))

(declare-fun b_and!9223 () Bool)

(assert (= b_and!9219 (and (=> t!6469 result!4367) b_and!9223)))

(assert (=> b!146998 m!176521))

(assert (=> b!146998 m!176555))

(assert (=> b!146998 m!176279))

(assert (=> b!146998 m!176557))

(assert (=> b!146998 m!176521))

(declare-fun m!176697 () Bool)

(assert (=> b!146998 m!176697))

(assert (=> b!146998 m!176555))

(assert (=> b!146998 m!176279))

(declare-fun m!176699 () Bool)

(assert (=> b!146988 m!176699))

(assert (=> b!146987 m!176521))

(assert (=> b!146987 m!176555))

(assert (=> b!146987 m!176279))

(assert (=> b!146987 m!176557))

(declare-fun m!176701 () Bool)

(assert (=> b!146987 m!176701))

(declare-fun m!176703 () Bool)

(assert (=> b!146987 m!176703))

(declare-fun m!176705 () Bool)

(assert (=> b!146987 m!176705))

(assert (=> b!146987 m!176279))

(assert (=> b!146987 m!176555))

(assert (=> b!146987 m!176705))

(declare-fun m!176707 () Bool)

(assert (=> b!146987 m!176707))

(declare-fun m!176709 () Bool)

(assert (=> d!46387 m!176709))

(assert (=> d!46387 m!176551))

(declare-fun m!176711 () Bool)

(assert (=> b!146991 m!176711))

(assert (=> b!146992 m!176521))

(assert (=> b!146992 m!176521))

(assert (=> b!146992 m!176541))

(declare-fun m!176713 () Bool)

(assert (=> b!146996 m!176713))

(assert (=> b!146990 m!176521))

(assert (=> b!146990 m!176521))

(declare-fun m!176715 () Bool)

(assert (=> b!146990 m!176715))

(assert (=> b!146989 m!176521))

(assert (=> b!146989 m!176521))

(assert (=> b!146989 m!176541))

(assert (=> bm!16459 m!176699))

(assert (=> b!146540 d!46387))

(declare-fun d!46389 () Bool)

(declare-fun e!95957 () Bool)

(assert (=> d!46389 e!95957))

(declare-fun res!69886 () Bool)

(assert (=> d!46389 (=> (not res!69886) (not e!95957))))

(declare-fun lt!77545 () ListLongMap!1725)

(assert (=> d!46389 (= res!69886 (contains!933 lt!77545 (_1!1360 lt!77132)))))

(declare-fun lt!77544 () List!1762)

(assert (=> d!46389 (= lt!77545 (ListLongMap!1726 lt!77544))))

(declare-fun lt!77547 () Unit!4629)

(declare-fun lt!77546 () Unit!4629)

(assert (=> d!46389 (= lt!77547 lt!77546)))

(assert (=> d!46389 (= (getValueByKey!182 lt!77544 (_1!1360 lt!77132)) (Some!187 (_2!1360 lt!77132)))))

(declare-fun lemmaContainsTupThenGetReturnValue!95 (List!1762 (_ BitVec 64) V!3625) Unit!4629)

(assert (=> d!46389 (= lt!77546 (lemmaContainsTupThenGetReturnValue!95 lt!77544 (_1!1360 lt!77132) (_2!1360 lt!77132)))))

(declare-fun insertStrictlySorted!98 (List!1762 (_ BitVec 64) V!3625) List!1762)

(assert (=> d!46389 (= lt!77544 (insertStrictlySorted!98 (toList!878 lt!77133) (_1!1360 lt!77132) (_2!1360 lt!77132)))))

(assert (=> d!46389 (= (+!182 lt!77133 lt!77132) lt!77545)))

(declare-fun b!147003 () Bool)

(declare-fun res!69885 () Bool)

(assert (=> b!147003 (=> (not res!69885) (not e!95957))))

(assert (=> b!147003 (= res!69885 (= (getValueByKey!182 (toList!878 lt!77545) (_1!1360 lt!77132)) (Some!187 (_2!1360 lt!77132))))))

(declare-fun b!147004 () Bool)

(declare-fun contains!936 (List!1762 tuple2!2698) Bool)

(assert (=> b!147004 (= e!95957 (contains!936 (toList!878 lt!77545) lt!77132))))

(assert (= (and d!46389 res!69886) b!147003))

(assert (= (and b!147003 res!69885) b!147004))

(declare-fun m!176717 () Bool)

(assert (=> d!46389 m!176717))

(declare-fun m!176719 () Bool)

(assert (=> d!46389 m!176719))

(declare-fun m!176721 () Bool)

(assert (=> d!46389 m!176721))

(declare-fun m!176723 () Bool)

(assert (=> d!46389 m!176723))

(declare-fun m!176725 () Bool)

(assert (=> b!147003 m!176725))

(declare-fun m!176727 () Bool)

(assert (=> b!147004 m!176727))

(assert (=> b!146540 d!46389))

(declare-fun d!46391 () Bool)

(assert (=> d!46391 (= (+!182 (+!182 lt!77133 (tuple2!2699 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119)) (tuple2!2699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3364 (underlying!505 thiss!992))))) (+!182 (+!182 lt!77133 (tuple2!2699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3364 (underlying!505 thiss!992))))) (tuple2!2699 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119)))))

(declare-fun lt!77550 () Unit!4629)

(declare-fun choose!908 (ListLongMap!1725 (_ BitVec 64) V!3625 (_ BitVec 64) V!3625) Unit!4629)

(assert (=> d!46391 (= lt!77550 (choose!908 lt!77133 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))))))

(assert (=> d!46391 (not (= (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46391 (= (addCommutativeForDiffKeys!76 lt!77133 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))) lt!77550)))

(declare-fun bs!6158 () Bool)

(assert (= bs!6158 d!46391))

(declare-fun m!176729 () Bool)

(assert (=> bs!6158 m!176729))

(declare-fun m!176731 () Bool)

(assert (=> bs!6158 m!176731))

(declare-fun m!176733 () Bool)

(assert (=> bs!6158 m!176733))

(assert (=> bs!6158 m!176275))

(declare-fun m!176735 () Bool)

(assert (=> bs!6158 m!176735))

(assert (=> bs!6158 m!176729))

(assert (=> bs!6158 m!176733))

(declare-fun m!176737 () Bool)

(assert (=> bs!6158 m!176737))

(assert (=> b!146540 d!46391))

(declare-fun b!147005 () Bool)

(declare-fun e!95968 () Bool)

(declare-fun e!95960 () Bool)

(assert (=> b!147005 (= e!95968 e!95960)))

(declare-fun res!69889 () Bool)

(declare-fun call!16464 () Bool)

(assert (=> b!147005 (= res!69889 call!16464)))

(assert (=> b!147005 (=> (not res!69889) (not e!95960))))

(declare-fun b!147006 () Bool)

(declare-fun e!95961 () Bool)

(declare-fun e!95969 () Bool)

(assert (=> b!147006 (= e!95961 e!95969)))

(declare-fun res!69892 () Bool)

(assert (=> b!147006 (=> (not res!69892) (not e!95969))))

(declare-fun lt!77572 () ListLongMap!1725)

(assert (=> b!147006 (= res!69892 (contains!933 lt!77572 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(assert (=> b!147006 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!147007 () Bool)

(declare-fun e!95966 () ListLongMap!1725)

(declare-fun call!16469 () ListLongMap!1725)

(assert (=> b!147007 (= e!95966 call!16469)))

(declare-fun b!147008 () Bool)

(assert (=> b!147008 (= e!95960 (= (apply!125 lt!77572 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2863 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!147009 () Bool)

(declare-fun e!95970 () Unit!4629)

(declare-fun Unit!4644 () Unit!4629)

(assert (=> b!147009 (= e!95970 Unit!4644)))

(declare-fun b!147010 () Bool)

(declare-fun e!95959 () Bool)

(assert (=> b!147010 (= e!95959 (validKeyInArray!0 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun bm!16460 () Bool)

(declare-fun call!16466 () ListLongMap!1725)

(assert (=> bm!16460 (= call!16469 call!16466)))

(declare-fun bm!16461 () Bool)

(assert (=> bm!16461 (= call!16464 (contains!933 lt!77572 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!147011 () Bool)

(declare-fun e!95965 () ListLongMap!1725)

(declare-fun e!95967 () ListLongMap!1725)

(assert (=> b!147011 (= e!95965 e!95967)))

(declare-fun c!27750 () Bool)

(assert (=> b!147011 (= c!27750 (and (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!147012 () Bool)

(declare-fun res!69893 () Bool)

(declare-fun e!95964 () Bool)

(assert (=> b!147012 (=> (not res!69893) (not e!95964))))

(assert (=> b!147012 (= res!69893 e!95961)))

(declare-fun res!69890 () Bool)

(assert (=> b!147012 (=> res!69890 e!95961)))

(assert (=> b!147012 (= res!69890 (not e!95959))))

(declare-fun res!69888 () Bool)

(assert (=> b!147012 (=> (not res!69888) (not e!95959))))

(assert (=> b!147012 (= res!69888 (bvslt from!355 (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!147013 () Bool)

(declare-fun e!95962 () Bool)

(assert (=> b!147013 (= e!95962 (validKeyInArray!0 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!147014 () Bool)

(assert (=> b!147014 (= e!95968 (not call!16464))))

(declare-fun bm!16462 () Bool)

(declare-fun call!16463 () ListLongMap!1725)

(declare-fun call!16467 () ListLongMap!1725)

(assert (=> bm!16462 (= call!16463 call!16467)))

(declare-fun bm!16463 () Bool)

(declare-fun call!16465 () ListLongMap!1725)

(assert (=> bm!16463 (= call!16465 call!16463)))

(declare-fun b!147015 () Bool)

(assert (=> b!147015 (= e!95969 (= (apply!125 lt!77572 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355)) (get!1583 (select (arr!2361 (_values!3001 (v!3364 (underlying!505 thiss!992)))) from!355) (dynLambda!459 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!147015 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2637 (_values!3001 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> b!147015 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!147016 () Bool)

(assert (=> b!147016 (= e!95967 call!16469)))

(declare-fun b!147017 () Bool)

(declare-fun c!27745 () Bool)

(assert (=> b!147017 (= c!27745 (and (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!147017 (= e!95967 e!95966)))

(declare-fun b!147018 () Bool)

(declare-fun res!69891 () Bool)

(assert (=> b!147018 (=> (not res!69891) (not e!95964))))

(declare-fun e!95958 () Bool)

(assert (=> b!147018 (= res!69891 e!95958)))

(declare-fun c!27747 () Bool)

(assert (=> b!147018 (= c!27747 (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!147019 () Bool)

(declare-fun lt!77554 () Unit!4629)

(assert (=> b!147019 (= e!95970 lt!77554)))

(declare-fun lt!77569 () ListLongMap!1725)

(assert (=> b!147019 (= lt!77569 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77564 () (_ BitVec 64))

(assert (=> b!147019 (= lt!77564 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77557 () (_ BitVec 64))

(assert (=> b!147019 (= lt!77557 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355))))

(declare-fun lt!77568 () Unit!4629)

(assert (=> b!147019 (= lt!77568 (addStillContains!101 lt!77569 lt!77564 (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) lt!77557))))

(assert (=> b!147019 (contains!933 (+!182 lt!77569 (tuple2!2699 lt!77564 (zeroValue!2863 (v!3364 (underlying!505 thiss!992))))) lt!77557)))

(declare-fun lt!77560 () Unit!4629)

(assert (=> b!147019 (= lt!77560 lt!77568)))

(declare-fun lt!77558 () ListLongMap!1725)

(assert (=> b!147019 (= lt!77558 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77555 () (_ BitVec 64))

(assert (=> b!147019 (= lt!77555 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77565 () (_ BitVec 64))

(assert (=> b!147019 (= lt!77565 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355))))

(declare-fun lt!77556 () Unit!4629)

(assert (=> b!147019 (= lt!77556 (addApplyDifferent!101 lt!77558 lt!77555 (minValue!2863 (v!3364 (underlying!505 thiss!992))) lt!77565))))

(assert (=> b!147019 (= (apply!125 (+!182 lt!77558 (tuple2!2699 lt!77555 (minValue!2863 (v!3364 (underlying!505 thiss!992))))) lt!77565) (apply!125 lt!77558 lt!77565))))

(declare-fun lt!77563 () Unit!4629)

(assert (=> b!147019 (= lt!77563 lt!77556)))

(declare-fun lt!77559 () ListLongMap!1725)

(assert (=> b!147019 (= lt!77559 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77552 () (_ BitVec 64))

(assert (=> b!147019 (= lt!77552 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77566 () (_ BitVec 64))

(assert (=> b!147019 (= lt!77566 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355))))

(declare-fun lt!77553 () Unit!4629)

(assert (=> b!147019 (= lt!77553 (addApplyDifferent!101 lt!77559 lt!77552 (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) lt!77566))))

(assert (=> b!147019 (= (apply!125 (+!182 lt!77559 (tuple2!2699 lt!77552 (zeroValue!2863 (v!3364 (underlying!505 thiss!992))))) lt!77566) (apply!125 lt!77559 lt!77566))))

(declare-fun lt!77571 () Unit!4629)

(assert (=> b!147019 (= lt!77571 lt!77553)))

(declare-fun lt!77561 () ListLongMap!1725)

(assert (=> b!147019 (= lt!77561 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77567 () (_ BitVec 64))

(assert (=> b!147019 (= lt!77567 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77562 () (_ BitVec 64))

(assert (=> b!147019 (= lt!77562 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355))))

(assert (=> b!147019 (= lt!77554 (addApplyDifferent!101 lt!77561 lt!77567 (minValue!2863 (v!3364 (underlying!505 thiss!992))) lt!77562))))

(assert (=> b!147019 (= (apply!125 (+!182 lt!77561 (tuple2!2699 lt!77567 (minValue!2863 (v!3364 (underlying!505 thiss!992))))) lt!77562) (apply!125 lt!77561 lt!77562))))

(declare-fun bm!16464 () Bool)

(assert (=> bm!16464 (= call!16467 (getCurrentListMapNoExtraKeys!150 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!147020 () Bool)

(declare-fun e!95963 () Bool)

(assert (=> b!147020 (= e!95963 (= (apply!125 lt!77572 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!147021 () Bool)

(assert (=> b!147021 (= e!95958 e!95963)))

(declare-fun res!69887 () Bool)

(declare-fun call!16468 () Bool)

(assert (=> b!147021 (= res!69887 call!16468)))

(assert (=> b!147021 (=> (not res!69887) (not e!95963))))

(declare-fun b!147022 () Bool)

(assert (=> b!147022 (= e!95966 call!16465)))

(declare-fun d!46393 () Bool)

(assert (=> d!46393 e!95964))

(declare-fun res!69894 () Bool)

(assert (=> d!46393 (=> (not res!69894) (not e!95964))))

(assert (=> d!46393 (= res!69894 (or (bvsge from!355 (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))))

(declare-fun lt!77570 () ListLongMap!1725)

(assert (=> d!46393 (= lt!77572 lt!77570)))

(declare-fun lt!77551 () Unit!4629)

(assert (=> d!46393 (= lt!77551 e!95970)))

(declare-fun c!27749 () Bool)

(assert (=> d!46393 (= c!27749 e!95962)))

(declare-fun res!69895 () Bool)

(assert (=> d!46393 (=> (not res!69895) (not e!95962))))

(assert (=> d!46393 (= res!69895 (bvslt from!355 (size!2636 (_keys!4787 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> d!46393 (= lt!77570 e!95965)))

(declare-fun c!27746 () Bool)

(assert (=> d!46393 (= c!27746 (and (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46393 (validMask!0 (mask!7398 (v!3364 (underlying!505 thiss!992))))))

(assert (=> d!46393 (= (getCurrentListMap!548 (_keys!4787 (v!3364 (underlying!505 thiss!992))) (_values!3001 (v!3364 (underlying!505 thiss!992))) (mask!7398 (v!3364 (underlying!505 thiss!992))) (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) (zeroValue!2863 (v!3364 (underlying!505 thiss!992))) (minValue!2863 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3018 (v!3364 (underlying!505 thiss!992)))) lt!77572)))

(declare-fun b!147023 () Bool)

(assert (=> b!147023 (= e!95958 (not call!16468))))

(declare-fun b!147024 () Bool)

(assert (=> b!147024 (= e!95965 (+!182 call!16466 (tuple2!2699 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun bm!16465 () Bool)

(assert (=> bm!16465 (= call!16466 (+!182 (ite c!27746 call!16467 (ite c!27750 call!16463 call!16465)) (ite (or c!27746 c!27750) (tuple2!2699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3364 (underlying!505 thiss!992)))) (tuple2!2699 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3364 (underlying!505 thiss!992)))))))))

(declare-fun bm!16466 () Bool)

(assert (=> bm!16466 (= call!16468 (contains!933 lt!77572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!147025 () Bool)

(assert (=> b!147025 (= e!95964 e!95968)))

(declare-fun c!27748 () Bool)

(assert (=> b!147025 (= c!27748 (not (= (bvand (extraKeys!2763 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!46393 c!27746) b!147024))

(assert (= (and d!46393 (not c!27746)) b!147011))

(assert (= (and b!147011 c!27750) b!147016))

(assert (= (and b!147011 (not c!27750)) b!147017))

(assert (= (and b!147017 c!27745) b!147007))

(assert (= (and b!147017 (not c!27745)) b!147022))

(assert (= (or b!147007 b!147022) bm!16463))

(assert (= (or b!147016 bm!16463) bm!16462))

(assert (= (or b!147016 b!147007) bm!16460))

(assert (= (or b!147024 bm!16462) bm!16464))

(assert (= (or b!147024 bm!16460) bm!16465))

(assert (= (and d!46393 res!69895) b!147013))

(assert (= (and d!46393 c!27749) b!147019))

(assert (= (and d!46393 (not c!27749)) b!147009))

(assert (= (and d!46393 res!69894) b!147012))

(assert (= (and b!147012 res!69888) b!147010))

(assert (= (and b!147012 (not res!69890)) b!147006))

(assert (= (and b!147006 res!69892) b!147015))

(assert (= (and b!147012 res!69893) b!147018))

(assert (= (and b!147018 c!27747) b!147021))

(assert (= (and b!147018 (not c!27747)) b!147023))

(assert (= (and b!147021 res!69887) b!147020))

(assert (= (or b!147021 b!147023) bm!16466))

(assert (= (and b!147018 res!69891) b!147025))

(assert (= (and b!147025 c!27748) b!147005))

(assert (= (and b!147025 (not c!27748)) b!147014))

(assert (= (and b!147005 res!69889) b!147008))

(assert (= (or b!147005 b!147014) bm!16461))

(declare-fun b_lambda!6585 () Bool)

(assert (=> (not b_lambda!6585) (not b!147015)))

(assert (=> b!147015 t!6467))

(declare-fun b_and!9225 () Bool)

(assert (= b_and!9221 (and (=> t!6467 result!4363) b_and!9225)))

(assert (=> b!147015 t!6469))

(declare-fun b_and!9227 () Bool)

(assert (= b_and!9223 (and (=> t!6469 result!4367) b_and!9227)))

(declare-fun m!176739 () Bool)

(assert (=> b!147019 m!176739))

(declare-fun m!176741 () Bool)

(assert (=> b!147019 m!176741))

(declare-fun m!176743 () Bool)

(assert (=> b!147019 m!176743))

(declare-fun m!176745 () Bool)

(assert (=> b!147019 m!176745))

(declare-fun m!176747 () Bool)

(assert (=> b!147019 m!176747))

(declare-fun m!176749 () Bool)

(assert (=> b!147019 m!176749))

(declare-fun m!176751 () Bool)

(assert (=> b!147019 m!176751))

(declare-fun m!176753 () Bool)

(assert (=> b!147019 m!176753))

(assert (=> b!147019 m!176275))

(declare-fun m!176755 () Bool)

(assert (=> b!147019 m!176755))

(declare-fun m!176757 () Bool)

(assert (=> b!147019 m!176757))

(declare-fun m!176759 () Bool)

(assert (=> b!147019 m!176759))

(assert (=> b!147019 m!176749))

(declare-fun m!176761 () Bool)

(assert (=> b!147019 m!176761))

(assert (=> b!147019 m!176747))

(declare-fun m!176763 () Bool)

(assert (=> b!147019 m!176763))

(assert (=> b!147019 m!176755))

(assert (=> b!147019 m!176745))

(declare-fun m!176765 () Bool)

(assert (=> b!147019 m!176765))

(declare-fun m!176767 () Bool)

(assert (=> b!147019 m!176767))

(declare-fun m!176769 () Bool)

(assert (=> b!147019 m!176769))

(assert (=> b!147006 m!176275))

(assert (=> b!147006 m!176275))

(declare-fun m!176771 () Bool)

(assert (=> b!147006 m!176771))

(assert (=> b!147010 m!176275))

(assert (=> b!147010 m!176275))

(assert (=> b!147010 m!176639))

(assert (=> b!147013 m!176275))

(assert (=> b!147013 m!176275))

(assert (=> b!147013 m!176639))

(assert (=> bm!16464 m!176741))

(declare-fun m!176773 () Bool)

(assert (=> b!147020 m!176773))

(declare-fun m!176775 () Bool)

(assert (=> bm!16461 m!176775))

(declare-fun m!176777 () Bool)

(assert (=> b!147024 m!176777))

(declare-fun m!176779 () Bool)

(assert (=> bm!16466 m!176779))

(assert (=> d!46393 m!176551))

(declare-fun m!176781 () Bool)

(assert (=> bm!16465 m!176781))

(assert (=> b!147015 m!176277))

(assert (=> b!147015 m!176277))

(assert (=> b!147015 m!176279))

(assert (=> b!147015 m!176281))

(assert (=> b!147015 m!176275))

(declare-fun m!176783 () Bool)

(assert (=> b!147015 m!176783))

(assert (=> b!147015 m!176279))

(assert (=> b!147015 m!176275))

(declare-fun m!176785 () Bool)

(assert (=> b!147008 m!176785))

(assert (=> b!146540 d!46393))

(declare-fun d!46395 () Bool)

(declare-fun e!95971 () Bool)

(assert (=> d!46395 e!95971))

(declare-fun res!69897 () Bool)

(assert (=> d!46395 (=> (not res!69897) (not e!95971))))

(declare-fun lt!77574 () ListLongMap!1725)

(assert (=> d!46395 (= res!69897 (contains!933 lt!77574 (_1!1360 lt!77128)))))

(declare-fun lt!77573 () List!1762)

(assert (=> d!46395 (= lt!77574 (ListLongMap!1726 lt!77573))))

(declare-fun lt!77576 () Unit!4629)

(declare-fun lt!77575 () Unit!4629)

(assert (=> d!46395 (= lt!77576 lt!77575)))

(assert (=> d!46395 (= (getValueByKey!182 lt!77573 (_1!1360 lt!77128)) (Some!187 (_2!1360 lt!77128)))))

(assert (=> d!46395 (= lt!77575 (lemmaContainsTupThenGetReturnValue!95 lt!77573 (_1!1360 lt!77128) (_2!1360 lt!77128)))))

(assert (=> d!46395 (= lt!77573 (insertStrictlySorted!98 (toList!878 lt!77134) (_1!1360 lt!77128) (_2!1360 lt!77128)))))

(assert (=> d!46395 (= (+!182 lt!77134 lt!77128) lt!77574)))

(declare-fun b!147026 () Bool)

(declare-fun res!69896 () Bool)

(assert (=> b!147026 (=> (not res!69896) (not e!95971))))

(assert (=> b!147026 (= res!69896 (= (getValueByKey!182 (toList!878 lt!77574) (_1!1360 lt!77128)) (Some!187 (_2!1360 lt!77128))))))

(declare-fun b!147027 () Bool)

(assert (=> b!147027 (= e!95971 (contains!936 (toList!878 lt!77574) lt!77128))))

(assert (= (and d!46395 res!69897) b!147026))

(assert (= (and b!147026 res!69896) b!147027))

(declare-fun m!176787 () Bool)

(assert (=> d!46395 m!176787))

(declare-fun m!176789 () Bool)

(assert (=> d!46395 m!176789))

(declare-fun m!176791 () Bool)

(assert (=> d!46395 m!176791))

(declare-fun m!176793 () Bool)

(assert (=> d!46395 m!176793))

(declare-fun m!176795 () Bool)

(assert (=> b!147026 m!176795))

(declare-fun m!176797 () Bool)

(assert (=> b!147027 m!176797))

(assert (=> b!146540 d!46395))

(declare-fun d!46397 () Bool)

(declare-fun e!95972 () Bool)

(assert (=> d!46397 e!95972))

(declare-fun res!69899 () Bool)

(assert (=> d!46397 (=> (not res!69899) (not e!95972))))

(declare-fun lt!77578 () ListLongMap!1725)

(assert (=> d!46397 (= res!69899 (contains!933 lt!77578 (_1!1360 lt!77132)))))

(declare-fun lt!77577 () List!1762)

(assert (=> d!46397 (= lt!77578 (ListLongMap!1726 lt!77577))))

(declare-fun lt!77580 () Unit!4629)

(declare-fun lt!77579 () Unit!4629)

(assert (=> d!46397 (= lt!77580 lt!77579)))

(assert (=> d!46397 (= (getValueByKey!182 lt!77577 (_1!1360 lt!77132)) (Some!187 (_2!1360 lt!77132)))))

(assert (=> d!46397 (= lt!77579 (lemmaContainsTupThenGetReturnValue!95 lt!77577 (_1!1360 lt!77132) (_2!1360 lt!77132)))))

(assert (=> d!46397 (= lt!77577 (insertStrictlySorted!98 (toList!878 (+!182 lt!77120 lt!77130)) (_1!1360 lt!77132) (_2!1360 lt!77132)))))

(assert (=> d!46397 (= (+!182 (+!182 lt!77120 lt!77130) lt!77132) lt!77578)))

(declare-fun b!147028 () Bool)

(declare-fun res!69898 () Bool)

(assert (=> b!147028 (=> (not res!69898) (not e!95972))))

(assert (=> b!147028 (= res!69898 (= (getValueByKey!182 (toList!878 lt!77578) (_1!1360 lt!77132)) (Some!187 (_2!1360 lt!77132))))))

(declare-fun b!147029 () Bool)

(assert (=> b!147029 (= e!95972 (contains!936 (toList!878 lt!77578) lt!77132))))

(assert (= (and d!46397 res!69899) b!147028))

(assert (= (and b!147028 res!69898) b!147029))

(declare-fun m!176799 () Bool)

(assert (=> d!46397 m!176799))

(declare-fun m!176801 () Bool)

(assert (=> d!46397 m!176801))

(declare-fun m!176803 () Bool)

(assert (=> d!46397 m!176803))

(declare-fun m!176805 () Bool)

(assert (=> d!46397 m!176805))

(declare-fun m!176807 () Bool)

(assert (=> b!147028 m!176807))

(declare-fun m!176809 () Bool)

(assert (=> b!147029 m!176809))

(assert (=> b!146540 d!46397))

(declare-fun d!46399 () Bool)

(declare-fun e!95973 () Bool)

(assert (=> d!46399 e!95973))

(declare-fun res!69901 () Bool)

(assert (=> d!46399 (=> (not res!69901) (not e!95973))))

(declare-fun lt!77582 () ListLongMap!1725)

(assert (=> d!46399 (= res!69901 (contains!933 lt!77582 (_1!1360 lt!77132)))))

(declare-fun lt!77581 () List!1762)

(assert (=> d!46399 (= lt!77582 (ListLongMap!1726 lt!77581))))

(declare-fun lt!77584 () Unit!4629)

(declare-fun lt!77583 () Unit!4629)

(assert (=> d!46399 (= lt!77584 lt!77583)))

(assert (=> d!46399 (= (getValueByKey!182 lt!77581 (_1!1360 lt!77132)) (Some!187 (_2!1360 lt!77132)))))

(assert (=> d!46399 (= lt!77583 (lemmaContainsTupThenGetReturnValue!95 lt!77581 (_1!1360 lt!77132) (_2!1360 lt!77132)))))

(assert (=> d!46399 (= lt!77581 (insertStrictlySorted!98 (toList!878 lt!77120) (_1!1360 lt!77132) (_2!1360 lt!77132)))))

(assert (=> d!46399 (= (+!182 lt!77120 lt!77132) lt!77582)))

(declare-fun b!147030 () Bool)

(declare-fun res!69900 () Bool)

(assert (=> b!147030 (=> (not res!69900) (not e!95973))))

(assert (=> b!147030 (= res!69900 (= (getValueByKey!182 (toList!878 lt!77582) (_1!1360 lt!77132)) (Some!187 (_2!1360 lt!77132))))))

(declare-fun b!147031 () Bool)

(assert (=> b!147031 (= e!95973 (contains!936 (toList!878 lt!77582) lt!77132))))

(assert (= (and d!46399 res!69901) b!147030))

(assert (= (and b!147030 res!69900) b!147031))

(declare-fun m!176811 () Bool)

(assert (=> d!46399 m!176811))

(declare-fun m!176813 () Bool)

(assert (=> d!46399 m!176813))

(declare-fun m!176815 () Bool)

(assert (=> d!46399 m!176815))

(declare-fun m!176817 () Bool)

(assert (=> d!46399 m!176817))

(declare-fun m!176819 () Bool)

(assert (=> b!147030 m!176819))

(declare-fun m!176821 () Bool)

(assert (=> b!147031 m!176821))

(assert (=> b!146540 d!46399))

(declare-fun d!46401 () Bool)

(assert (=> d!46401 (= (+!182 (+!182 lt!77120 (tuple2!2699 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119)) (tuple2!2699 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3364 (underlying!505 thiss!992))))) (+!182 (+!182 lt!77120 (tuple2!2699 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3364 (underlying!505 thiss!992))))) (tuple2!2699 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119)))))

(declare-fun lt!77585 () Unit!4629)

(assert (=> d!46401 (= lt!77585 (choose!908 lt!77120 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3364 (underlying!505 thiss!992)))))))

(assert (=> d!46401 (not (= (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46401 (= (addCommutativeForDiffKeys!76 lt!77120 (select (arr!2360 (_keys!4787 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77119 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3364 (underlying!505 thiss!992)))) lt!77585)))

(declare-fun bs!6159 () Bool)

(assert (= bs!6159 d!46401))

(declare-fun m!176823 () Bool)

(assert (=> bs!6159 m!176823))

(declare-fun m!176825 () Bool)

(assert (=> bs!6159 m!176825))

(declare-fun m!176827 () Bool)

(assert (=> bs!6159 m!176827))

(assert (=> bs!6159 m!176275))

(declare-fun m!176829 () Bool)

(assert (=> bs!6159 m!176829))

(assert (=> bs!6159 m!176823))

(assert (=> bs!6159 m!176827))

(declare-fun m!176831 () Bool)

(assert (=> bs!6159 m!176831))

(assert (=> b!146540 d!46401))

(declare-fun d!46403 () Bool)

(declare-fun e!95974 () Bool)

(assert (=> d!46403 e!95974))

(declare-fun res!69903 () Bool)

(assert (=> d!46403 (=> (not res!69903) (not e!95974))))

(declare-fun lt!77587 () ListLongMap!1725)

(assert (=> d!46403 (= res!69903 (contains!933 lt!77587 (_1!1360 lt!77130)))))

(declare-fun lt!77586 () List!1762)

(assert (=> d!46403 (= lt!77587 (ListLongMap!1726 lt!77586))))

(declare-fun lt!77589 () Unit!4629)

(declare-fun lt!77588 () Unit!4629)

(assert (=> d!46403 (= lt!77589 lt!77588)))

(assert (=> d!46403 (= (getValueByKey!182 lt!77586 (_1!1360 lt!77130)) (Some!187 (_2!1360 lt!77130)))))

(assert (=> d!46403 (= lt!77588 (lemmaContainsTupThenGetReturnValue!95 lt!77586 (_1!1360 lt!77130) (_2!1360 lt!77130)))))

(assert (=> d!46403 (= lt!77586 (insertStrictlySorted!98 (toList!878 lt!77120) (_1!1360 lt!77130) (_2!1360 lt!77130)))))

(assert (=> d!46403 (= (+!182 lt!77120 lt!77130) lt!77587)))

(declare-fun b!147032 () Bool)

(declare-fun res!69902 () Bool)

(assert (=> b!147032 (=> (not res!69902) (not e!95974))))

(assert (=> b!147032 (= res!69902 (= (getValueByKey!182 (toList!878 lt!77587) (_1!1360 lt!77130)) (Some!187 (_2!1360 lt!77130))))))

(declare-fun b!147033 () Bool)

(assert (=> b!147033 (= e!95974 (contains!936 (toList!878 lt!77587) lt!77130))))

(assert (= (and d!46403 res!69903) b!147032))

(assert (= (and b!147032 res!69902) b!147033))

(declare-fun m!176833 () Bool)

(assert (=> d!46403 m!176833))

(declare-fun m!176835 () Bool)

(assert (=> d!46403 m!176835))

(declare-fun m!176837 () Bool)

(assert (=> d!46403 m!176837))

(declare-fun m!176839 () Bool)

(assert (=> d!46403 m!176839))

(declare-fun m!176841 () Bool)

(assert (=> b!147032 m!176841))

(declare-fun m!176843 () Bool)

(assert (=> b!147033 m!176843))

(assert (=> b!146540 d!46403))

(declare-fun d!46405 () Bool)

(declare-fun e!95975 () Bool)

(assert (=> d!46405 e!95975))

(declare-fun res!69905 () Bool)

(assert (=> d!46405 (=> (not res!69905) (not e!95975))))

(declare-fun lt!77591 () ListLongMap!1725)

(assert (=> d!46405 (= res!69905 (contains!933 lt!77591 (_1!1360 lt!77128)))))

(declare-fun lt!77590 () List!1762)

(assert (=> d!46405 (= lt!77591 (ListLongMap!1726 lt!77590))))

(declare-fun lt!77593 () Unit!4629)

(declare-fun lt!77592 () Unit!4629)

(assert (=> d!46405 (= lt!77593 lt!77592)))

(assert (=> d!46405 (= (getValueByKey!182 lt!77590 (_1!1360 lt!77128)) (Some!187 (_2!1360 lt!77128)))))

(assert (=> d!46405 (= lt!77592 (lemmaContainsTupThenGetReturnValue!95 lt!77590 (_1!1360 lt!77128) (_2!1360 lt!77128)))))

(assert (=> d!46405 (= lt!77590 (insertStrictlySorted!98 (toList!878 lt!77133) (_1!1360 lt!77128) (_2!1360 lt!77128)))))

(assert (=> d!46405 (= (+!182 lt!77133 lt!77128) lt!77591)))

(declare-fun b!147034 () Bool)

(declare-fun res!69904 () Bool)

(assert (=> b!147034 (=> (not res!69904) (not e!95975))))

(assert (=> b!147034 (= res!69904 (= (getValueByKey!182 (toList!878 lt!77591) (_1!1360 lt!77128)) (Some!187 (_2!1360 lt!77128))))))

(declare-fun b!147035 () Bool)

(assert (=> b!147035 (= e!95975 (contains!936 (toList!878 lt!77591) lt!77128))))

(assert (= (and d!46405 res!69905) b!147034))

(assert (= (and b!147034 res!69904) b!147035))

(declare-fun m!176845 () Bool)

(assert (=> d!46405 m!176845))

(declare-fun m!176847 () Bool)

(assert (=> d!46405 m!176847))

(declare-fun m!176849 () Bool)

(assert (=> d!46405 m!176849))

(declare-fun m!176851 () Bool)

(assert (=> d!46405 m!176851))

(declare-fun m!176853 () Bool)

(assert (=> b!147034 m!176853))

(declare-fun m!176855 () Bool)

(assert (=> b!147035 m!176855))

(assert (=> b!146540 d!46405))

(declare-fun d!46407 () Bool)

(declare-fun e!95976 () Bool)

(assert (=> d!46407 e!95976))

(declare-fun res!69907 () Bool)

(assert (=> d!46407 (=> (not res!69907) (not e!95976))))

(declare-fun lt!77595 () ListLongMap!1725)

(assert (=> d!46407 (= res!69907 (contains!933 lt!77595 (_1!1360 lt!77130)))))

(declare-fun lt!77594 () List!1762)

(assert (=> d!46407 (= lt!77595 (ListLongMap!1726 lt!77594))))

(declare-fun lt!77597 () Unit!4629)

(declare-fun lt!77596 () Unit!4629)

(assert (=> d!46407 (= lt!77597 lt!77596)))

(assert (=> d!46407 (= (getValueByKey!182 lt!77594 (_1!1360 lt!77130)) (Some!187 (_2!1360 lt!77130)))))

(assert (=> d!46407 (= lt!77596 (lemmaContainsTupThenGetReturnValue!95 lt!77594 (_1!1360 lt!77130) (_2!1360 lt!77130)))))

(assert (=> d!46407 (= lt!77594 (insertStrictlySorted!98 (toList!878 lt!77127) (_1!1360 lt!77130) (_2!1360 lt!77130)))))

(assert (=> d!46407 (= (+!182 lt!77127 lt!77130) lt!77595)))

(declare-fun b!147036 () Bool)

(declare-fun res!69906 () Bool)

(assert (=> b!147036 (=> (not res!69906) (not e!95976))))

(assert (=> b!147036 (= res!69906 (= (getValueByKey!182 (toList!878 lt!77595) (_1!1360 lt!77130)) (Some!187 (_2!1360 lt!77130))))))

(declare-fun b!147037 () Bool)

(assert (=> b!147037 (= e!95976 (contains!936 (toList!878 lt!77595) lt!77130))))

(assert (= (and d!46407 res!69907) b!147036))

(assert (= (and b!147036 res!69906) b!147037))

(declare-fun m!176857 () Bool)

(assert (=> d!46407 m!176857))

(declare-fun m!176859 () Bool)

(assert (=> d!46407 m!176859))

(declare-fun m!176861 () Bool)

(assert (=> d!46407 m!176861))

(declare-fun m!176863 () Bool)

(assert (=> d!46407 m!176863))

(declare-fun m!176865 () Bool)

(assert (=> b!147036 m!176865))

(declare-fun m!176867 () Bool)

(assert (=> b!147037 m!176867))

(assert (=> b!146540 d!46407))

(declare-fun d!46409 () Bool)

(assert (=> d!46409 (= (valid!606 thiss!992) (valid!605 (v!3364 (underlying!505 thiss!992))))))

(declare-fun bs!6160 () Bool)

(assert (= bs!6160 d!46409))

(declare-fun m!176869 () Bool)

(assert (=> bs!6160 m!176869))

(assert (=> start!15218 d!46409))

(declare-fun d!46411 () Bool)

(declare-fun res!69908 () Bool)

(declare-fun e!95977 () Bool)

(assert (=> d!46411 (=> (not res!69908) (not e!95977))))

(assert (=> d!46411 (= res!69908 (simpleValid!101 newMap!16))))

(assert (=> d!46411 (= (valid!605 newMap!16) e!95977)))

(declare-fun b!147038 () Bool)

(declare-fun res!69909 () Bool)

(assert (=> b!147038 (=> (not res!69909) (not e!95977))))

(assert (=> b!147038 (= res!69909 (= (arrayCountValidKeys!0 (_keys!4787 newMap!16) #b00000000000000000000000000000000 (size!2636 (_keys!4787 newMap!16))) (_size!651 newMap!16)))))

(declare-fun b!147039 () Bool)

(declare-fun res!69910 () Bool)

(assert (=> b!147039 (=> (not res!69910) (not e!95977))))

(assert (=> b!147039 (= res!69910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4787 newMap!16) (mask!7398 newMap!16)))))

(declare-fun b!147040 () Bool)

(assert (=> b!147040 (= e!95977 (arrayNoDuplicates!0 (_keys!4787 newMap!16) #b00000000000000000000000000000000 Nil!1758))))

(assert (= (and d!46411 res!69908) b!147038))

(assert (= (and b!147038 res!69909) b!147039))

(assert (= (and b!147039 res!69910) b!147040))

(declare-fun m!176871 () Bool)

(assert (=> d!46411 m!176871))

(declare-fun m!176873 () Bool)

(assert (=> b!147038 m!176873))

(declare-fun m!176875 () Bool)

(assert (=> b!147039 m!176875))

(declare-fun m!176877 () Bool)

(assert (=> b!147040 m!176877))

(assert (=> b!146530 d!46411))

(declare-fun condMapEmpty!5037 () Bool)

(declare-fun mapDefault!5037 () ValueCell!1148)

(assert (=> mapNonEmpty!5021 (= condMapEmpty!5037 (= mapRest!5022 ((as const (Array (_ BitVec 32) ValueCell!1148)) mapDefault!5037)))))

(declare-fun e!95982 () Bool)

(declare-fun mapRes!5037 () Bool)

(assert (=> mapNonEmpty!5021 (= tp!11902 (and e!95982 mapRes!5037))))

(declare-fun b!147047 () Bool)

(declare-fun e!95983 () Bool)

(assert (=> b!147047 (= e!95983 tp_is_empty!2983)))

(declare-fun mapIsEmpty!5037 () Bool)

(assert (=> mapIsEmpty!5037 mapRes!5037))

(declare-fun b!147048 () Bool)

(assert (=> b!147048 (= e!95982 tp_is_empty!2983)))

(declare-fun mapNonEmpty!5037 () Bool)

(declare-fun tp!11931 () Bool)

(assert (=> mapNonEmpty!5037 (= mapRes!5037 (and tp!11931 e!95983))))

(declare-fun mapValue!5037 () ValueCell!1148)

(declare-fun mapKey!5037 () (_ BitVec 32))

(declare-fun mapRest!5037 () (Array (_ BitVec 32) ValueCell!1148))

(assert (=> mapNonEmpty!5037 (= mapRest!5022 (store mapRest!5037 mapKey!5037 mapValue!5037))))

(assert (= (and mapNonEmpty!5021 condMapEmpty!5037) mapIsEmpty!5037))

(assert (= (and mapNonEmpty!5021 (not condMapEmpty!5037)) mapNonEmpty!5037))

(assert (= (and mapNonEmpty!5037 ((_ is ValueCellFull!1148) mapValue!5037)) b!147047))

(assert (= (and mapNonEmpty!5021 ((_ is ValueCellFull!1148) mapDefault!5037)) b!147048))

(declare-fun m!176879 () Bool)

(assert (=> mapNonEmpty!5037 m!176879))

(declare-fun condMapEmpty!5038 () Bool)

(declare-fun mapDefault!5038 () ValueCell!1148)

(assert (=> mapNonEmpty!5022 (= condMapEmpty!5038 (= mapRest!5021 ((as const (Array (_ BitVec 32) ValueCell!1148)) mapDefault!5038)))))

(declare-fun e!95984 () Bool)

(declare-fun mapRes!5038 () Bool)

(assert (=> mapNonEmpty!5022 (= tp!11901 (and e!95984 mapRes!5038))))

(declare-fun b!147049 () Bool)

(declare-fun e!95985 () Bool)

(assert (=> b!147049 (= e!95985 tp_is_empty!2983)))

(declare-fun mapIsEmpty!5038 () Bool)

(assert (=> mapIsEmpty!5038 mapRes!5038))

(declare-fun b!147050 () Bool)

(assert (=> b!147050 (= e!95984 tp_is_empty!2983)))

(declare-fun mapNonEmpty!5038 () Bool)

(declare-fun tp!11932 () Bool)

(assert (=> mapNonEmpty!5038 (= mapRes!5038 (and tp!11932 e!95985))))

(declare-fun mapRest!5038 () (Array (_ BitVec 32) ValueCell!1148))

(declare-fun mapKey!5038 () (_ BitVec 32))

(declare-fun mapValue!5038 () ValueCell!1148)

(assert (=> mapNonEmpty!5038 (= mapRest!5021 (store mapRest!5038 mapKey!5038 mapValue!5038))))

(assert (= (and mapNonEmpty!5022 condMapEmpty!5038) mapIsEmpty!5038))

(assert (= (and mapNonEmpty!5022 (not condMapEmpty!5038)) mapNonEmpty!5038))

(assert (= (and mapNonEmpty!5038 ((_ is ValueCellFull!1148) mapValue!5038)) b!147049))

(assert (= (and mapNonEmpty!5022 ((_ is ValueCellFull!1148) mapDefault!5038)) b!147050))

(declare-fun m!176881 () Bool)

(assert (=> mapNonEmpty!5038 m!176881))

(declare-fun b_lambda!6587 () Bool)

(assert (= b_lambda!6583 (or (and b!146527 b_free!3133) (and b!146529 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))))) b_lambda!6587)))

(declare-fun b_lambda!6589 () Bool)

(assert (= b_lambda!6585 (or (and b!146527 b_free!3133) (and b!146529 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))))) b_lambda!6589)))

(declare-fun b_lambda!6591 () Bool)

(assert (= b_lambda!6581 (or (and b!146527 b_free!3133) (and b!146529 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))))) b_lambda!6591)))

(declare-fun b_lambda!6593 () Bool)

(assert (= b_lambda!6579 (or (and b!146527 b_free!3133) (and b!146529 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))))) b_lambda!6593)))

(declare-fun b_lambda!6595 () Bool)

(assert (= b_lambda!6577 (or (and b!146527 b_free!3133) (and b!146529 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3364 (underlying!505 thiss!992))))) b_lambda!6595)))

(check-sat (not bm!16405) b_and!9225 (not b!146988) (not bm!16342) (not bm!16452) (not d!46391) (not b!146693) (not b!146917) (not b!147027) (not b!146746) (not bm!16396) (not b!146957) (not bm!16456) (not b!147033) (not b!147034) (not b!146892) (not d!46361) b_and!9227 (not b!147036) (not d!46397) (not b!146874) (not b!147003) (not d!46399) (not bm!16450) (not bm!16401) (not b_next!3135) (not b!147028) (not b!147019) (not b!146919) (not b!146996) (not d!46395) (not d!46401) (not b!146991) (not b!147037) (not d!46409) (not b_lambda!6575) (not b!146694) (not b!147031) (not bm!16448) (not b!146752) (not bm!16392) (not b_lambda!6589) (not bm!16412) (not b!146904) (not b!147030) (not d!46351) (not b_lambda!6587) (not b!146741) (not b!147039) (not b!146753) (not b!146893) (not b!146989) (not bm!16410) (not d!46389) (not bm!16465) (not b!147006) (not bm!16466) (not d!46411) (not b!146757) (not b!146954) (not b!146866) (not b_next!3133) (not b!146765) (not b!146748) (not mapNonEmpty!5037) (not b!147032) (not b_lambda!6591) (not b_lambda!6593) (not b!147035) (not bm!16453) (not b!146743) (not b!146739) (not b!146992) (not b!147008) tp_is_empty!2983 (not d!46359) (not b!146956) (not bm!16459) (not bm!16340) (not d!46383) (not bm!16406) (not d!46403) (not b!146949) (not bm!16446) (not b!147024) (not b!147004) (not d!46393) (not bm!16445) (not b!146767) (not b!146862) (not b!146885) (not d!46353) (not b!147015) (not bm!16449) (not b!146867) (not b!146920) (not bm!16403) (not b!147020) (not bm!16391) (not b!146695) (not d!46385) (not d!46369) (not b!146998) (not bm!16417) (not b_lambda!6595) (not mapNonEmpty!5038) (not b!146880) (not bm!16451) (not d!46373) (not d!46379) (not b!146899) (not b!147026) (not bm!16455) (not bm!16464) (not d!46387) (not bm!16447) (not d!46349) (not bm!16409) (not bm!16398) (not b!147010) (not d!46375) (not bm!16461) (not bm!16408) (not bm!16454) (not b!147040) (not d!46407) (not bm!16444) (not d!46367) (not b!146952) (not d!46405) (not b!147013) (not b!147038) (not b!147029) (not b!146990) (not bm!16341) (not b!146987) (not b!146849) (not bm!16337))
(check-sat b_and!9225 b_and!9227 (not b_next!3133) (not b_next!3135))
