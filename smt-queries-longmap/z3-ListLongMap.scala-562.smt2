; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15218 () Bool)

(assert start!15218)

(declare-fun b!146646 () Bool)

(declare-fun b_free!3133 () Bool)

(declare-fun b_next!3133 () Bool)

(assert (=> b!146646 (= b_free!3133 (not b_next!3133))))

(declare-fun tp!11901 () Bool)

(declare-fun b_and!9165 () Bool)

(assert (=> b!146646 (= tp!11901 b_and!9165)))

(declare-fun b!146651 () Bool)

(declare-fun b_free!3135 () Bool)

(declare-fun b_next!3135 () Bool)

(assert (=> b!146651 (= b_free!3135 (not b_next!3135))))

(declare-fun tp!11902 () Bool)

(declare-fun b_and!9167 () Bool)

(assert (=> b!146651 (= tp!11902 b_and!9167)))

(declare-fun res!69695 () Bool)

(declare-fun e!95700 () Bool)

(assert (=> start!15218 (=> (not res!69695) (not e!95700))))

(declare-datatypes ((V!3625 0))(
  ( (V!3626 (val!1536 Int)) )
))
(declare-datatypes ((array!4991 0))(
  ( (array!4992 (arr!2356 (Array (_ BitVec 32) (_ BitVec 64))) (size!2633 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1148 0))(
  ( (ValueCellFull!1148 (v!3355 V!3625)) (EmptyCell!1148) )
))
(declare-datatypes ((array!4993 0))(
  ( (array!4994 (arr!2357 (Array (_ BitVec 32) ValueCell!1148)) (size!2634 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1204 0))(
  ( (LongMapFixedSize!1205 (defaultEntry!3018 Int) (mask!7397 (_ BitVec 32)) (extraKeys!2763 (_ BitVec 32)) (zeroValue!2863 V!3625) (minValue!2863 V!3625) (_size!651 (_ BitVec 32)) (_keys!4786 array!4991) (_values!3001 array!4993) (_vacant!651 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!978 0))(
  ( (Cell!979 (v!3356 LongMapFixedSize!1204)) )
))
(declare-datatypes ((LongMap!978 0))(
  ( (LongMap!979 (underlying!500 Cell!978)) )
))
(declare-fun thiss!992 () LongMap!978)

(declare-fun valid!593 (LongMap!978) Bool)

(assert (=> start!15218 (= res!69695 (valid!593 thiss!992))))

(assert (=> start!15218 e!95700))

(declare-fun e!95706 () Bool)

(assert (=> start!15218 e!95706))

(assert (=> start!15218 true))

(declare-fun e!95709 () Bool)

(assert (=> start!15218 e!95709))

(declare-fun b!146634 () Bool)

(declare-fun res!69689 () Bool)

(assert (=> b!146634 (=> (not res!69689) (not e!95700))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!146634 (= res!69689 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992)))))))))

(declare-fun mapNonEmpty!5021 () Bool)

(declare-fun mapRes!5022 () Bool)

(declare-fun tp!11903 () Bool)

(declare-fun e!95691 () Bool)

(assert (=> mapNonEmpty!5021 (= mapRes!5022 (and tp!11903 e!95691))))

(declare-fun mapValue!5022 () ValueCell!1148)

(declare-fun mapKey!5022 () (_ BitVec 32))

(declare-fun mapRest!5021 () (Array (_ BitVec 32) ValueCell!1148))

(declare-fun newMap!16 () LongMapFixedSize!1204)

(assert (=> mapNonEmpty!5021 (= (arr!2357 (_values!3001 newMap!16)) (store mapRest!5021 mapKey!5022 mapValue!5022))))

(declare-fun b!146635 () Bool)

(declare-fun res!69690 () Bool)

(assert (=> b!146635 (=> (not res!69690) (not e!95700))))

(assert (=> b!146635 (= res!69690 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7397 newMap!16)) (_size!651 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun mapIsEmpty!5021 () Bool)

(declare-fun mapRes!5021 () Bool)

(assert (=> mapIsEmpty!5021 mapRes!5021))

(declare-fun b!146636 () Bool)

(declare-datatypes ((Unit!4636 0))(
  ( (Unit!4637) )
))
(declare-fun e!95690 () Unit!4636)

(declare-fun Unit!4638 () Unit!4636)

(assert (=> b!146636 (= e!95690 Unit!4638)))

(declare-fun b!146637 () Bool)

(declare-fun e!95704 () Bool)

(assert (=> b!146637 (= e!95706 e!95704)))

(declare-fun mapIsEmpty!5022 () Bool)

(assert (=> mapIsEmpty!5022 mapRes!5022))

(declare-fun b!146638 () Bool)

(declare-fun tp_is_empty!2983 () Bool)

(assert (=> b!146638 (= e!95691 tp_is_empty!2983)))

(declare-fun b!146639 () Bool)

(declare-fun e!95698 () Bool)

(declare-fun e!95697 () Bool)

(assert (=> b!146639 (= e!95698 e!95697)))

(declare-fun res!69692 () Bool)

(assert (=> b!146639 (=> (not res!69692) (not e!95697))))

(assert (=> b!146639 (= res!69692 (and (not (= (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77052 () V!3625)

(declare-fun get!1574 (ValueCell!1148 V!3625) V!3625)

(declare-fun dynLambda!453 (Int (_ BitVec 64)) V!3625)

(assert (=> b!146639 (= lt!77052 (get!1574 (select (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) from!355) (dynLambda!453 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!146640 () Bool)

(declare-fun e!95695 () Bool)

(declare-fun e!95696 () Bool)

(assert (=> b!146640 (= e!95695 e!95696)))

(declare-fun res!69691 () Bool)

(assert (=> b!146640 (=> res!69691 e!95696)))

(declare-datatypes ((tuple2!2740 0))(
  ( (tuple2!2741 (_1!1381 Bool) (_2!1381 LongMapFixedSize!1204)) )
))
(declare-fun lt!77056 () tuple2!2740)

(assert (=> b!146640 (= res!69691 (not (_1!1381 lt!77056)))))

(declare-fun lt!77068 () tuple2!2740)

(declare-fun repackFrom!19 (LongMap!978 LongMapFixedSize!1204 (_ BitVec 32)) tuple2!2740)

(assert (=> b!146640 (= lt!77056 (repackFrom!19 thiss!992 (_2!1381 lt!77068) (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!146641 () Bool)

(declare-fun e!95694 () Bool)

(assert (=> b!146641 (= e!95696 e!95694)))

(declare-fun res!69697 () Bool)

(assert (=> b!146641 (=> (not res!69697) (not e!95694))))

(declare-fun valid!594 (LongMapFixedSize!1204) Bool)

(assert (=> b!146641 (= res!69697 (valid!594 (_2!1381 lt!77056)))))

(declare-fun b!146642 () Bool)

(declare-fun e!95701 () Bool)

(assert (=> b!146642 (= e!95701 tp_is_empty!2983)))

(declare-fun b!146643 () Bool)

(declare-fun e!95692 () Bool)

(assert (=> b!146643 (= e!95704 e!95692)))

(declare-fun b!146644 () Bool)

(declare-fun res!69693 () Bool)

(assert (=> b!146644 (=> (not res!69693) (not e!95700))))

(assert (=> b!146644 (= res!69693 (valid!594 newMap!16))))

(declare-fun b!146645 () Bool)

(declare-fun e!95707 () Bool)

(declare-fun e!95699 () Bool)

(assert (=> b!146645 (= e!95707 (and e!95699 mapRes!5021))))

(declare-fun condMapEmpty!5022 () Bool)

(declare-fun mapDefault!5022 () ValueCell!1148)

(assert (=> b!146645 (= condMapEmpty!5022 (= (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1148)) mapDefault!5022)))))

(declare-fun array_inv!1511 (array!4991) Bool)

(declare-fun array_inv!1512 (array!4993) Bool)

(assert (=> b!146646 (= e!95692 (and tp!11901 tp_is_empty!2983 (array_inv!1511 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (array_inv!1512 (_values!3001 (v!3356 (underlying!500 thiss!992)))) e!95707))))

(declare-fun b!146647 () Bool)

(declare-fun e!95693 () Bool)

(assert (=> b!146647 (= e!95693 tp_is_empty!2983)))

(declare-fun b!146648 () Bool)

(declare-datatypes ((tuple2!2742 0))(
  ( (tuple2!2743 (_1!1382 (_ BitVec 64)) (_2!1382 V!3625)) )
))
(declare-datatypes ((List!1780 0))(
  ( (Nil!1777) (Cons!1776 (h!2384 tuple2!2742) (t!6488 List!1780)) )
))
(declare-datatypes ((ListLongMap!1755 0))(
  ( (ListLongMap!1756 (toList!893 List!1780)) )
))
(declare-fun map!1458 (LongMapFixedSize!1204) ListLongMap!1755)

(assert (=> b!146648 (= e!95694 (= (map!1458 (_2!1381 lt!77056)) (map!1458 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun mapNonEmpty!5022 () Bool)

(declare-fun tp!11904 () Bool)

(assert (=> mapNonEmpty!5022 (= mapRes!5021 (and tp!11904 e!95701))))

(declare-fun mapKey!5021 () (_ BitVec 32))

(declare-fun mapValue!5021 () ValueCell!1148)

(declare-fun mapRest!5022 () (Array (_ BitVec 32) ValueCell!1148))

(assert (=> mapNonEmpty!5022 (= (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) (store mapRest!5022 mapKey!5021 mapValue!5021))))

(declare-fun b!146649 () Bool)

(declare-fun e!95705 () Bool)

(assert (=> b!146649 (= e!95705 (and e!95693 mapRes!5022))))

(declare-fun condMapEmpty!5021 () Bool)

(declare-fun mapDefault!5021 () ValueCell!1148)

(assert (=> b!146649 (= condMapEmpty!5021 (= (arr!2357 (_values!3001 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1148)) mapDefault!5021)))))

(declare-fun b!146650 () Bool)

(declare-fun Unit!4639 () Unit!4636)

(assert (=> b!146650 (= e!95690 Unit!4639)))

(declare-fun lt!77055 () Unit!4636)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!161 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 64) (_ BitVec 32) Int) Unit!4636)

(assert (=> b!146650 (= lt!77055 (lemmaListMapContainsThenArrayContainsFrom!161 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146650 (arrayContainsKey!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!77053 () Unit!4636)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4991 (_ BitVec 32) (_ BitVec 32)) Unit!4636)

(assert (=> b!146650 (= lt!77053 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1781 0))(
  ( (Nil!1778) (Cons!1777 (h!2385 (_ BitVec 64)) (t!6489 List!1781)) )
))
(declare-fun arrayNoDuplicates!0 (array!4991 (_ BitVec 32) List!1781) Bool)

(assert (=> b!146650 (arrayNoDuplicates!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) from!355 Nil!1778)))

(declare-fun lt!77060 () Unit!4636)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4991 (_ BitVec 32) (_ BitVec 64) List!1781) Unit!4636)

(assert (=> b!146650 (= lt!77060 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (Cons!1777 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) Nil!1778)))))

(assert (=> b!146650 false))

(assert (=> b!146651 (= e!95709 (and tp!11902 tp_is_empty!2983 (array_inv!1511 (_keys!4786 newMap!16)) (array_inv!1512 (_values!3001 newMap!16)) e!95705))))

(declare-fun b!146652 () Bool)

(assert (=> b!146652 (= e!95700 e!95698)))

(declare-fun res!69696 () Bool)

(assert (=> b!146652 (=> (not res!69696) (not e!95698))))

(declare-fun lt!77064 () ListLongMap!1755)

(declare-fun lt!77059 () ListLongMap!1755)

(assert (=> b!146652 (= res!69696 (= lt!77064 lt!77059))))

(assert (=> b!146652 (= lt!77059 (map!1458 newMap!16))))

(declare-fun getCurrentListMap!550 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 32) Int) ListLongMap!1755)

(assert (=> b!146652 (= lt!77064 (getCurrentListMap!550 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun b!146653 () Bool)

(declare-fun e!95702 () Bool)

(assert (=> b!146653 (= e!95702 (not e!95695))))

(declare-fun res!69688 () Bool)

(assert (=> b!146653 (=> res!69688 e!95695)))

(assert (=> b!146653 (= res!69688 (not (= (getCurrentListMap!550 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) from!355 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))) (map!1458 (_2!1381 lt!77068)))))))

(declare-fun lt!77050 () ListLongMap!1755)

(declare-fun lt!77061 () ListLongMap!1755)

(declare-fun lt!77057 () tuple2!2742)

(declare-fun lt!77066 () tuple2!2742)

(declare-fun +!175 (ListLongMap!1755 tuple2!2742) ListLongMap!1755)

(assert (=> b!146653 (= (+!175 lt!77061 lt!77066) (+!175 (+!175 lt!77050 lt!77066) lt!77057))))

(assert (=> b!146653 (= lt!77066 (tuple2!2743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun lt!77065 () Unit!4636)

(declare-fun addCommutativeForDiffKeys!68 (ListLongMap!1755 (_ BitVec 64) V!3625 (_ BitVec 64) V!3625) Unit!4636)

(assert (=> b!146653 (= lt!77065 (addCommutativeForDiffKeys!68 lt!77050 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun lt!77063 () ListLongMap!1755)

(assert (=> b!146653 (= lt!77063 lt!77061)))

(assert (=> b!146653 (= lt!77061 (+!175 lt!77050 lt!77057))))

(declare-fun lt!77051 () ListLongMap!1755)

(declare-fun lt!77062 () tuple2!2742)

(assert (=> b!146653 (= lt!77063 (+!175 lt!77051 lt!77062))))

(declare-fun lt!77067 () ListLongMap!1755)

(assert (=> b!146653 (= lt!77050 (+!175 lt!77067 lt!77062))))

(assert (=> b!146653 (= lt!77062 (tuple2!2743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))))))

(assert (=> b!146653 (= lt!77051 (+!175 lt!77067 lt!77057))))

(assert (=> b!146653 (= lt!77057 (tuple2!2743 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052))))

(declare-fun lt!77054 () Unit!4636)

(assert (=> b!146653 (= lt!77054 (addCommutativeForDiffKeys!68 lt!77067 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!141 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 32) Int) ListLongMap!1755)

(assert (=> b!146653 (= lt!77067 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun b!146654 () Bool)

(assert (=> b!146654 (= e!95697 e!95702)))

(declare-fun res!69694 () Bool)

(assert (=> b!146654 (=> (not res!69694) (not e!95702))))

(assert (=> b!146654 (= res!69694 (and (_1!1381 lt!77068) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!77058 () Unit!4636)

(assert (=> b!146654 (= lt!77058 e!95690)))

(declare-fun c!27697 () Bool)

(declare-fun contains!941 (ListLongMap!1755 (_ BitVec 64)) Bool)

(assert (=> b!146654 (= c!27697 (contains!941 lt!77059 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(declare-fun update!228 (LongMapFixedSize!1204 (_ BitVec 64) V!3625) tuple2!2740)

(assert (=> b!146654 (= lt!77068 (update!228 newMap!16 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052))))

(declare-fun b!146655 () Bool)

(assert (=> b!146655 (= e!95699 tp_is_empty!2983)))

(assert (= (and start!15218 res!69695) b!146634))

(assert (= (and b!146634 res!69689) b!146644))

(assert (= (and b!146644 res!69693) b!146635))

(assert (= (and b!146635 res!69690) b!146652))

(assert (= (and b!146652 res!69696) b!146639))

(assert (= (and b!146639 res!69692) b!146654))

(assert (= (and b!146654 c!27697) b!146650))

(assert (= (and b!146654 (not c!27697)) b!146636))

(assert (= (and b!146654 res!69694) b!146653))

(assert (= (and b!146653 (not res!69688)) b!146640))

(assert (= (and b!146640 (not res!69691)) b!146641))

(assert (= (and b!146641 res!69697) b!146648))

(assert (= (and b!146645 condMapEmpty!5022) mapIsEmpty!5021))

(assert (= (and b!146645 (not condMapEmpty!5022)) mapNonEmpty!5022))

(get-info :version)

(assert (= (and mapNonEmpty!5022 ((_ is ValueCellFull!1148) mapValue!5021)) b!146642))

(assert (= (and b!146645 ((_ is ValueCellFull!1148) mapDefault!5022)) b!146655))

(assert (= b!146646 b!146645))

(assert (= b!146643 b!146646))

(assert (= b!146637 b!146643))

(assert (= start!15218 b!146637))

(assert (= (and b!146649 condMapEmpty!5021) mapIsEmpty!5022))

(assert (= (and b!146649 (not condMapEmpty!5021)) mapNonEmpty!5021))

(assert (= (and mapNonEmpty!5021 ((_ is ValueCellFull!1148) mapValue!5022)) b!146638))

(assert (= (and b!146649 ((_ is ValueCellFull!1148) mapDefault!5021)) b!146647))

(assert (= b!146651 b!146649))

(assert (= start!15218 b!146651))

(declare-fun b_lambda!6549 () Bool)

(assert (=> (not b_lambda!6549) (not b!146639)))

(declare-fun t!6485 () Bool)

(declare-fun tb!2669 () Bool)

(assert (=> (and b!146646 (= (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))) t!6485) tb!2669))

(declare-fun result!4363 () Bool)

(assert (=> tb!2669 (= result!4363 tp_is_empty!2983)))

(assert (=> b!146639 t!6485))

(declare-fun b_and!9169 () Bool)

(assert (= b_and!9165 (and (=> t!6485 result!4363) b_and!9169)))

(declare-fun t!6487 () Bool)

(declare-fun tb!2671 () Bool)

(assert (=> (and b!146651 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))) t!6487) tb!2671))

(declare-fun result!4367 () Bool)

(assert (= result!4367 result!4363))

(assert (=> b!146639 t!6487))

(declare-fun b_and!9171 () Bool)

(assert (= b_and!9167 (and (=> t!6487 result!4367) b_and!9171)))

(declare-fun m!176083 () Bool)

(assert (=> b!146641 m!176083))

(declare-fun m!176085 () Bool)

(assert (=> b!146653 m!176085))

(declare-fun m!176087 () Bool)

(assert (=> b!146653 m!176087))

(declare-fun m!176089 () Bool)

(assert (=> b!146653 m!176089))

(declare-fun m!176091 () Bool)

(assert (=> b!146653 m!176091))

(declare-fun m!176093 () Bool)

(assert (=> b!146653 m!176093))

(declare-fun m!176095 () Bool)

(assert (=> b!146653 m!176095))

(declare-fun m!176097 () Bool)

(assert (=> b!146653 m!176097))

(declare-fun m!176099 () Bool)

(assert (=> b!146653 m!176099))

(assert (=> b!146653 m!176091))

(declare-fun m!176101 () Bool)

(assert (=> b!146653 m!176101))

(declare-fun m!176103 () Bool)

(assert (=> b!146653 m!176103))

(assert (=> b!146653 m!176095))

(declare-fun m!176105 () Bool)

(assert (=> b!146653 m!176105))

(declare-fun m!176107 () Bool)

(assert (=> b!146653 m!176107))

(assert (=> b!146653 m!176091))

(declare-fun m!176109 () Bool)

(assert (=> b!146653 m!176109))

(declare-fun m!176111 () Bool)

(assert (=> b!146644 m!176111))

(declare-fun m!176113 () Bool)

(assert (=> b!146648 m!176113))

(declare-fun m!176115 () Bool)

(assert (=> b!146648 m!176115))

(declare-fun m!176117 () Bool)

(assert (=> b!146651 m!176117))

(declare-fun m!176119 () Bool)

(assert (=> b!146651 m!176119))

(declare-fun m!176121 () Bool)

(assert (=> b!146650 m!176121))

(declare-fun m!176123 () Bool)

(assert (=> b!146650 m!176123))

(assert (=> b!146650 m!176091))

(declare-fun m!176125 () Bool)

(assert (=> b!146650 m!176125))

(assert (=> b!146650 m!176091))

(assert (=> b!146650 m!176091))

(declare-fun m!176127 () Bool)

(assert (=> b!146650 m!176127))

(assert (=> b!146650 m!176091))

(declare-fun m!176129 () Bool)

(assert (=> b!146650 m!176129))

(declare-fun m!176131 () Bool)

(assert (=> mapNonEmpty!5021 m!176131))

(declare-fun m!176133 () Bool)

(assert (=> b!146640 m!176133))

(assert (=> b!146639 m!176091))

(declare-fun m!176135 () Bool)

(assert (=> b!146639 m!176135))

(declare-fun m!176137 () Bool)

(assert (=> b!146639 m!176137))

(assert (=> b!146639 m!176135))

(assert (=> b!146639 m!176137))

(declare-fun m!176139 () Bool)

(assert (=> b!146639 m!176139))

(declare-fun m!176141 () Bool)

(assert (=> start!15218 m!176141))

(declare-fun m!176143 () Bool)

(assert (=> b!146652 m!176143))

(declare-fun m!176145 () Bool)

(assert (=> b!146652 m!176145))

(declare-fun m!176147 () Bool)

(assert (=> b!146646 m!176147))

(declare-fun m!176149 () Bool)

(assert (=> b!146646 m!176149))

(declare-fun m!176151 () Bool)

(assert (=> mapNonEmpty!5022 m!176151))

(assert (=> b!146654 m!176091))

(assert (=> b!146654 m!176091))

(declare-fun m!176153 () Bool)

(assert (=> b!146654 m!176153))

(assert (=> b!146654 m!176091))

(declare-fun m!176155 () Bool)

(assert (=> b!146654 m!176155))

(check-sat (not start!15218) (not b!146653) (not b!146644) (not b_next!3133) (not b!146651) (not b!146654) (not b_next!3135) (not b!146650) (not mapNonEmpty!5021) b_and!9169 b_and!9171 (not mapNonEmpty!5022) tp_is_empty!2983 (not b!146652) (not b!146641) (not b_lambda!6549) (not b!146648) (not b!146639) (not b!146646) (not b!146640))
(check-sat b_and!9169 b_and!9171 (not b_next!3133) (not b_next!3135))
(get-model)

(declare-fun b_lambda!6555 () Bool)

(assert (= b_lambda!6549 (or (and b!146646 b_free!3133) (and b!146651 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))))) b_lambda!6555)))

(check-sat (not start!15218) (not b!146653) (not b!146644) (not b_next!3133) (not b!146651) (not b!146654) (not b_next!3135) (not b!146650) (not mapNonEmpty!5021) b_and!9169 (not b_lambda!6555) b_and!9171 (not mapNonEmpty!5022) tp_is_empty!2983 (not b!146652) (not b!146641) (not b!146648) (not b!146639) (not b!146646) (not b!146640))
(check-sat b_and!9169 b_and!9171 (not b_next!3133) (not b_next!3135))
(get-model)

(declare-fun d!46357 () Bool)

(assert (=> d!46357 (= (array_inv!1511 (_keys!4786 newMap!16)) (bvsge (size!2633 (_keys!4786 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!146651 d!46357))

(declare-fun d!46359 () Bool)

(assert (=> d!46359 (= (array_inv!1512 (_values!3001 newMap!16)) (bvsge (size!2634 (_values!3001 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!146651 d!46359))

(declare-fun d!46361 () Bool)

(assert (=> d!46361 (= (map!1458 newMap!16) (getCurrentListMap!550 (_keys!4786 newMap!16) (_values!3001 newMap!16) (mask!7397 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3018 newMap!16)))))

(declare-fun bs!6129 () Bool)

(assert (= bs!6129 d!46361))

(declare-fun m!176305 () Bool)

(assert (=> bs!6129 m!176305))

(assert (=> b!146652 d!46361))

(declare-fun b!146836 () Bool)

(declare-fun e!95858 () ListLongMap!1755)

(declare-fun call!16359 () ListLongMap!1755)

(assert (=> b!146836 (= e!95858 call!16359)))

(declare-fun b!146837 () Bool)

(declare-fun e!95857 () ListLongMap!1755)

(declare-fun call!16357 () ListLongMap!1755)

(assert (=> b!146837 (= e!95857 call!16357)))

(declare-fun b!146838 () Bool)

(assert (=> b!146838 (= e!95857 call!16359)))

(declare-fun d!46363 () Bool)

(declare-fun e!95867 () Bool)

(assert (=> d!46363 e!95867))

(declare-fun res!69779 () Bool)

(assert (=> d!46363 (=> (not res!69779) (not e!95867))))

(assert (=> d!46363 (= res!69779 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))))

(declare-fun lt!77240 () ListLongMap!1755)

(declare-fun lt!77233 () ListLongMap!1755)

(assert (=> d!46363 (= lt!77240 lt!77233)))

(declare-fun lt!77232 () Unit!4636)

(declare-fun e!95862 () Unit!4636)

(assert (=> d!46363 (= lt!77232 e!95862)))

(declare-fun c!27716 () Bool)

(declare-fun e!95868 () Bool)

(assert (=> d!46363 (= c!27716 e!95868)))

(declare-fun res!69783 () Bool)

(assert (=> d!46363 (=> (not res!69783) (not e!95868))))

(assert (=> d!46363 (= res!69783 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun e!95859 () ListLongMap!1755)

(assert (=> d!46363 (= lt!77233 e!95859)))

(declare-fun c!27717 () Bool)

(assert (=> d!46363 (= c!27717 (and (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!46363 (validMask!0 (mask!7397 (v!3356 (underlying!500 thiss!992))))))

(assert (=> d!46363 (= (getCurrentListMap!550 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))) lt!77240)))

(declare-fun bm!16351 () Bool)

(declare-fun call!16358 () ListLongMap!1755)

(assert (=> bm!16351 (= call!16358 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun b!146839 () Bool)

(declare-fun e!95863 () Bool)

(declare-fun e!95865 () Bool)

(assert (=> b!146839 (= e!95863 e!95865)))

(declare-fun res!69780 () Bool)

(declare-fun call!16354 () Bool)

(assert (=> b!146839 (= res!69780 call!16354)))

(assert (=> b!146839 (=> (not res!69780) (not e!95865))))

(declare-fun b!146840 () Bool)

(assert (=> b!146840 (= e!95863 (not call!16354))))

(declare-fun call!16355 () ListLongMap!1755)

(declare-fun c!27719 () Bool)

(declare-fun bm!16352 () Bool)

(declare-fun call!16360 () ListLongMap!1755)

(assert (=> bm!16352 (= call!16355 (+!175 (ite c!27717 call!16358 (ite c!27719 call!16360 call!16357)) (ite (or c!27717 c!27719) (tuple2!2743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))) (tuple2!2743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3356 (underlying!500 thiss!992)))))))))

(declare-fun b!146841 () Bool)

(declare-fun c!27721 () Bool)

(assert (=> b!146841 (= c!27721 (and (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!146841 (= e!95858 e!95857)))

(declare-fun b!146842 () Bool)

(declare-fun res!69782 () Bool)

(assert (=> b!146842 (=> (not res!69782) (not e!95867))))

(declare-fun e!95864 () Bool)

(assert (=> b!146842 (= res!69782 e!95864)))

(declare-fun res!69778 () Bool)

(assert (=> b!146842 (=> res!69778 e!95864)))

(declare-fun e!95866 () Bool)

(assert (=> b!146842 (= res!69778 (not e!95866))))

(declare-fun res!69784 () Bool)

(assert (=> b!146842 (=> (not res!69784) (not e!95866))))

(assert (=> b!146842 (= res!69784 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun bm!16353 () Bool)

(assert (=> bm!16353 (= call!16360 call!16358)))

(declare-fun b!146843 () Bool)

(assert (=> b!146843 (= e!95859 e!95858)))

(assert (=> b!146843 (= c!27719 (and (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16354 () Bool)

(assert (=> bm!16354 (= call!16359 call!16355)))

(declare-fun b!146844 () Bool)

(assert (=> b!146844 (= e!95867 e!95863)))

(declare-fun c!27718 () Bool)

(assert (=> b!146844 (= c!27718 (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!146845 () Bool)

(declare-fun lt!77236 () Unit!4636)

(assert (=> b!146845 (= e!95862 lt!77236)))

(declare-fun lt!77238 () ListLongMap!1755)

(assert (=> b!146845 (= lt!77238 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun lt!77241 () (_ BitVec 64))

(assert (=> b!146845 (= lt!77241 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77228 () (_ BitVec 64))

(assert (=> b!146845 (= lt!77228 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77235 () Unit!4636)

(declare-fun addStillContains!101 (ListLongMap!1755 (_ BitVec 64) V!3625 (_ BitVec 64)) Unit!4636)

(assert (=> b!146845 (= lt!77235 (addStillContains!101 lt!77238 lt!77241 (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) lt!77228))))

(assert (=> b!146845 (contains!941 (+!175 lt!77238 (tuple2!2743 lt!77241 (zeroValue!2863 (v!3356 (underlying!500 thiss!992))))) lt!77228)))

(declare-fun lt!77230 () Unit!4636)

(assert (=> b!146845 (= lt!77230 lt!77235)))

(declare-fun lt!77245 () ListLongMap!1755)

(assert (=> b!146845 (= lt!77245 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun lt!77243 () (_ BitVec 64))

(assert (=> b!146845 (= lt!77243 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77231 () (_ BitVec 64))

(assert (=> b!146845 (= lt!77231 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77234 () Unit!4636)

(declare-fun addApplyDifferent!101 (ListLongMap!1755 (_ BitVec 64) V!3625 (_ BitVec 64)) Unit!4636)

(assert (=> b!146845 (= lt!77234 (addApplyDifferent!101 lt!77245 lt!77243 (minValue!2863 (v!3356 (underlying!500 thiss!992))) lt!77231))))

(declare-fun apply!125 (ListLongMap!1755 (_ BitVec 64)) V!3625)

(assert (=> b!146845 (= (apply!125 (+!175 lt!77245 (tuple2!2743 lt!77243 (minValue!2863 (v!3356 (underlying!500 thiss!992))))) lt!77231) (apply!125 lt!77245 lt!77231))))

(declare-fun lt!77246 () Unit!4636)

(assert (=> b!146845 (= lt!77246 lt!77234)))

(declare-fun lt!77239 () ListLongMap!1755)

(assert (=> b!146845 (= lt!77239 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun lt!77227 () (_ BitVec 64))

(assert (=> b!146845 (= lt!77227 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77248 () (_ BitVec 64))

(assert (=> b!146845 (= lt!77248 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77229 () Unit!4636)

(assert (=> b!146845 (= lt!77229 (addApplyDifferent!101 lt!77239 lt!77227 (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) lt!77248))))

(assert (=> b!146845 (= (apply!125 (+!175 lt!77239 (tuple2!2743 lt!77227 (zeroValue!2863 (v!3356 (underlying!500 thiss!992))))) lt!77248) (apply!125 lt!77239 lt!77248))))

(declare-fun lt!77242 () Unit!4636)

(assert (=> b!146845 (= lt!77242 lt!77229)))

(declare-fun lt!77244 () ListLongMap!1755)

(assert (=> b!146845 (= lt!77244 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun lt!77247 () (_ BitVec 64))

(assert (=> b!146845 (= lt!77247 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77237 () (_ BitVec 64))

(assert (=> b!146845 (= lt!77237 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!146845 (= lt!77236 (addApplyDifferent!101 lt!77244 lt!77247 (minValue!2863 (v!3356 (underlying!500 thiss!992))) lt!77237))))

(assert (=> b!146845 (= (apply!125 (+!175 lt!77244 (tuple2!2743 lt!77247 (minValue!2863 (v!3356 (underlying!500 thiss!992))))) lt!77237) (apply!125 lt!77244 lt!77237))))

(declare-fun b!146846 () Bool)

(declare-fun e!95861 () Bool)

(assert (=> b!146846 (= e!95864 e!95861)))

(declare-fun res!69777 () Bool)

(assert (=> b!146846 (=> (not res!69777) (not e!95861))))

(assert (=> b!146846 (= res!69777 (contains!941 lt!77240 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!146846 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun b!146847 () Bool)

(declare-fun e!95860 () Bool)

(assert (=> b!146847 (= e!95860 (= (apply!125 lt!77240 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun b!146848 () Bool)

(declare-fun res!69776 () Bool)

(assert (=> b!146848 (=> (not res!69776) (not e!95867))))

(declare-fun e!95856 () Bool)

(assert (=> b!146848 (= res!69776 e!95856)))

(declare-fun c!27720 () Bool)

(assert (=> b!146848 (= c!27720 (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!146849 () Bool)

(assert (=> b!146849 (= e!95859 (+!175 call!16355 (tuple2!2743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun b!146850 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!146850 (= e!95868 (validKeyInArray!0 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!146851 () Bool)

(declare-fun call!16356 () Bool)

(assert (=> b!146851 (= e!95856 (not call!16356))))

(declare-fun bm!16355 () Bool)

(assert (=> bm!16355 (= call!16356 (contains!941 lt!77240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!146852 () Bool)

(assert (=> b!146852 (= e!95861 (= (apply!125 lt!77240 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1574 (select (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!453 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!146852 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2634 (_values!3001 (v!3356 (underlying!500 thiss!992))))))))

(assert (=> b!146852 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun b!146853 () Bool)

(assert (=> b!146853 (= e!95856 e!95860)))

(declare-fun res!69781 () Bool)

(assert (=> b!146853 (= res!69781 call!16356)))

(assert (=> b!146853 (=> (not res!69781) (not e!95860))))

(declare-fun b!146854 () Bool)

(declare-fun Unit!4644 () Unit!4636)

(assert (=> b!146854 (= e!95862 Unit!4644)))

(declare-fun bm!16356 () Bool)

(assert (=> bm!16356 (= call!16354 (contains!941 lt!77240 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!146855 () Bool)

(assert (=> b!146855 (= e!95866 (validKeyInArray!0 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!146856 () Bool)

(assert (=> b!146856 (= e!95865 (= (apply!125 lt!77240 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2863 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun bm!16357 () Bool)

(assert (=> bm!16357 (= call!16357 call!16360)))

(assert (= (and d!46363 c!27717) b!146849))

(assert (= (and d!46363 (not c!27717)) b!146843))

(assert (= (and b!146843 c!27719) b!146836))

(assert (= (and b!146843 (not c!27719)) b!146841))

(assert (= (and b!146841 c!27721) b!146838))

(assert (= (and b!146841 (not c!27721)) b!146837))

(assert (= (or b!146838 b!146837) bm!16357))

(assert (= (or b!146836 bm!16357) bm!16353))

(assert (= (or b!146836 b!146838) bm!16354))

(assert (= (or b!146849 bm!16353) bm!16351))

(assert (= (or b!146849 bm!16354) bm!16352))

(assert (= (and d!46363 res!69783) b!146850))

(assert (= (and d!46363 c!27716) b!146845))

(assert (= (and d!46363 (not c!27716)) b!146854))

(assert (= (and d!46363 res!69779) b!146842))

(assert (= (and b!146842 res!69784) b!146855))

(assert (= (and b!146842 (not res!69778)) b!146846))

(assert (= (and b!146846 res!69777) b!146852))

(assert (= (and b!146842 res!69782) b!146848))

(assert (= (and b!146848 c!27720) b!146853))

(assert (= (and b!146848 (not c!27720)) b!146851))

(assert (= (and b!146853 res!69781) b!146847))

(assert (= (or b!146853 b!146851) bm!16355))

(assert (= (and b!146848 res!69776) b!146844))

(assert (= (and b!146844 c!27718) b!146839))

(assert (= (and b!146844 (not c!27718)) b!146840))

(assert (= (and b!146839 res!69780) b!146856))

(assert (= (or b!146839 b!146840) bm!16356))

(declare-fun b_lambda!6557 () Bool)

(assert (=> (not b_lambda!6557) (not b!146852)))

(assert (=> b!146852 t!6485))

(declare-fun b_and!9189 () Bool)

(assert (= b_and!9169 (and (=> t!6485 result!4363) b_and!9189)))

(assert (=> b!146852 t!6487))

(declare-fun b_and!9191 () Bool)

(assert (= b_and!9171 (and (=> t!6487 result!4367) b_and!9191)))

(declare-fun m!176307 () Bool)

(assert (=> b!146849 m!176307))

(declare-fun m!176309 () Bool)

(assert (=> b!146850 m!176309))

(assert (=> b!146850 m!176309))

(declare-fun m!176311 () Bool)

(assert (=> b!146850 m!176311))

(assert (=> bm!16351 m!176099))

(declare-fun m!176313 () Bool)

(assert (=> b!146852 m!176313))

(assert (=> b!146852 m!176137))

(declare-fun m!176315 () Bool)

(assert (=> b!146852 m!176315))

(assert (=> b!146852 m!176309))

(assert (=> b!146852 m!176313))

(assert (=> b!146852 m!176137))

(assert (=> b!146852 m!176309))

(declare-fun m!176317 () Bool)

(assert (=> b!146852 m!176317))

(declare-fun m!176319 () Bool)

(assert (=> b!146847 m!176319))

(declare-fun m!176321 () Bool)

(assert (=> bm!16352 m!176321))

(assert (=> b!146846 m!176309))

(assert (=> b!146846 m!176309))

(declare-fun m!176323 () Bool)

(assert (=> b!146846 m!176323))

(declare-fun m!176325 () Bool)

(assert (=> b!146856 m!176325))

(declare-fun m!176327 () Bool)

(assert (=> bm!16355 m!176327))

(declare-fun m!176329 () Bool)

(assert (=> d!46363 m!176329))

(assert (=> b!146855 m!176309))

(assert (=> b!146855 m!176309))

(assert (=> b!146855 m!176311))

(declare-fun m!176331 () Bool)

(assert (=> bm!16356 m!176331))

(declare-fun m!176333 () Bool)

(assert (=> b!146845 m!176333))

(declare-fun m!176335 () Bool)

(assert (=> b!146845 m!176335))

(assert (=> b!146845 m!176099))

(declare-fun m!176337 () Bool)

(assert (=> b!146845 m!176337))

(declare-fun m!176339 () Bool)

(assert (=> b!146845 m!176339))

(assert (=> b!146845 m!176335))

(declare-fun m!176341 () Bool)

(assert (=> b!146845 m!176341))

(declare-fun m!176343 () Bool)

(assert (=> b!146845 m!176343))

(declare-fun m!176345 () Bool)

(assert (=> b!146845 m!176345))

(declare-fun m!176347 () Bool)

(assert (=> b!146845 m!176347))

(declare-fun m!176349 () Bool)

(assert (=> b!146845 m!176349))

(declare-fun m!176351 () Bool)

(assert (=> b!146845 m!176351))

(declare-fun m!176353 () Bool)

(assert (=> b!146845 m!176353))

(assert (=> b!146845 m!176337))

(declare-fun m!176355 () Bool)

(assert (=> b!146845 m!176355))

(declare-fun m!176357 () Bool)

(assert (=> b!146845 m!176357))

(assert (=> b!146845 m!176309))

(assert (=> b!146845 m!176345))

(declare-fun m!176359 () Bool)

(assert (=> b!146845 m!176359))

(assert (=> b!146845 m!176343))

(declare-fun m!176361 () Bool)

(assert (=> b!146845 m!176361))

(assert (=> b!146652 d!46363))

(declare-fun e!95889 () Bool)

(declare-fun lt!77342 () (_ BitVec 32))

(declare-fun b!146885 () Bool)

(declare-fun lt!77331 () (_ BitVec 64))

(assert (=> b!146885 (= e!95889 (arrayContainsKey!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) lt!77331 lt!77342))))

(declare-fun bm!16384 () Bool)

(declare-fun call!16395 () ListLongMap!1755)

(assert (=> bm!16384 (= call!16395 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun b!146886 () Bool)

(declare-fun e!95887 () Bool)

(declare-fun lt!77329 () tuple2!2740)

(assert (=> b!146886 (= e!95887 (= (map!1458 (_2!1381 lt!77329)) (map!1458 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun call!16390 () Unit!4636)

(declare-fun lt!77316 () ListLongMap!1755)

(declare-fun bm!16385 () Bool)

(declare-fun lt!77322 () V!3625)

(declare-fun lt!77323 () (_ BitVec 64))

(declare-fun c!27738 () Bool)

(declare-fun lt!77330 () ListLongMap!1755)

(declare-fun lt!77321 () (_ BitVec 64))

(assert (=> bm!16385 (= call!16390 (addCommutativeForDiffKeys!68 (ite c!27738 lt!77316 lt!77330) lt!77331 lt!77322 (ite c!27738 lt!77323 lt!77321) (ite c!27738 (minValue!2863 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun lt!77318 () (_ BitVec 64))

(declare-fun bm!16386 () Bool)

(declare-fun lt!77332 () ListLongMap!1755)

(declare-fun call!16398 () ListLongMap!1755)

(declare-fun lt!77327 () ListLongMap!1755)

(declare-fun lt!77335 () (_ BitVec 64))

(assert (=> bm!16386 (= call!16398 (+!175 (ite c!27738 lt!77327 lt!77332) (ite c!27738 (tuple2!2743 lt!77318 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))) (tuple2!2743 lt!77335 (minValue!2863 (v!3356 (underlying!500 thiss!992)))))))))

(declare-fun bm!16387 () Bool)

(declare-fun call!16397 () ListLongMap!1755)

(assert (=> bm!16387 (= call!16397 (+!175 (ite c!27738 lt!77316 lt!77330) (ite c!27738 (tuple2!2743 lt!77323 (minValue!2863 (v!3356 (underlying!500 thiss!992)))) (tuple2!2743 lt!77321 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))))))))

(declare-fun b!146887 () Bool)

(assert (=> b!146887 (= c!27738 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun e!95888 () tuple2!2740)

(declare-fun e!95891 () tuple2!2740)

(assert (=> b!146887 (= e!95888 e!95891)))

(declare-fun call!16393 () ListLongMap!1755)

(declare-fun bm!16389 () Bool)

(declare-fun call!16396 () ListLongMap!1755)

(assert (=> bm!16389 (= call!16396 (+!175 (ite c!27738 call!16393 call!16397) (ite c!27738 (tuple2!2743 lt!77323 (minValue!2863 (v!3356 (underlying!500 thiss!992)))) (tuple2!2743 lt!77331 lt!77322))))))

(declare-fun call!16389 () Unit!4636)

(declare-fun bm!16390 () Bool)

(assert (=> bm!16390 (= call!16389 (addCommutativeForDiffKeys!68 (ite c!27738 lt!77327 lt!77332) lt!77331 lt!77322 (ite c!27738 lt!77318 lt!77335) (ite c!27738 (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun b!146888 () Bool)

(declare-fun lt!77326 () tuple2!2740)

(declare-fun call!16399 () tuple2!2740)

(assert (=> b!146888 (= lt!77326 call!16399)))

(declare-fun e!95886 () tuple2!2740)

(assert (=> b!146888 (= e!95886 (tuple2!2741 (_1!1381 lt!77326) (_2!1381 lt!77326)))))

(declare-fun bm!16391 () Bool)

(declare-fun call!16387 () ListLongMap!1755)

(declare-fun call!16391 () ListLongMap!1755)

(assert (=> bm!16391 (= call!16387 (+!175 (ite c!27738 call!16395 call!16391) (ite c!27738 (tuple2!2743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))) (tuple2!2743 lt!77335 (minValue!2863 (v!3356 (underlying!500 thiss!992)))))))))

(declare-fun b!146889 () Bool)

(assert (=> b!146889 false))

(declare-fun lt!77313 () Unit!4636)

(declare-fun lt!77328 () Unit!4636)

(assert (=> b!146889 (= lt!77313 lt!77328)))

(declare-fun lt!77320 () (_ BitVec 32))

(assert (=> b!146889 (not (arrayContainsKey!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) lt!77331 lt!77320))))

(assert (=> b!146889 (= lt!77328 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) lt!77320 lt!77331 (Cons!1777 lt!77331 Nil!1778)))))

(assert (=> b!146889 (= lt!77320 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!77334 () Unit!4636)

(declare-fun lt!77340 () Unit!4636)

(assert (=> b!146889 (= lt!77334 lt!77340)))

(assert (=> b!146889 (arrayNoDuplicates!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1778)))

(assert (=> b!146889 (= lt!77340 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!77325 () Unit!4636)

(declare-fun lt!77344 () Unit!4636)

(assert (=> b!146889 (= lt!77325 lt!77344)))

(assert (=> b!146889 e!95889))

(declare-fun c!27736 () Bool)

(assert (=> b!146889 (= c!27736 (and (not (= lt!77331 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!77331 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!146889 (= lt!77344 (lemmaListMapContainsThenArrayContainsFrom!161 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) lt!77331 lt!77342 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(assert (=> b!146889 (= lt!77342 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun e!95890 () Unit!4636)

(declare-fun Unit!4645 () Unit!4636)

(assert (=> b!146889 (= e!95890 Unit!4645)))

(declare-fun c!27735 () Bool)

(declare-fun lt!77319 () tuple2!2740)

(declare-fun bm!16392 () Bool)

(assert (=> bm!16392 (= call!16399 (repackFrom!19 thiss!992 (ite c!27735 (_2!1381 lt!77319) (_2!1381 lt!77068)) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun call!16392 () ListLongMap!1755)

(declare-fun bm!16393 () Bool)

(assert (=> bm!16393 (= call!16392 (+!175 (ite c!27738 call!16391 call!16395) (ite c!27738 (tuple2!2743 lt!77318 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))) (tuple2!2743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))))))))

(declare-fun bm!16394 () Bool)

(assert (=> bm!16394 (= call!16391 (+!175 (ite c!27738 lt!77327 lt!77332) (tuple2!2743 lt!77331 lt!77322)))))

(declare-fun bm!16395 () Bool)

(declare-fun call!16394 () ListLongMap!1755)

(assert (=> bm!16395 (= call!16394 (+!175 (ite c!27738 call!16397 call!16393) (ite c!27738 (tuple2!2743 lt!77331 lt!77322) (tuple2!2743 lt!77321 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))))))))

(declare-fun d!46365 () Bool)

(declare-fun e!95892 () Bool)

(assert (=> d!46365 e!95892))

(declare-fun res!69790 () Bool)

(assert (=> d!46365 (=> res!69790 e!95892)))

(assert (=> d!46365 (= res!69790 (not (_1!1381 lt!77329)))))

(declare-fun e!95885 () tuple2!2740)

(assert (=> d!46365 (= lt!77329 e!95885)))

(assert (=> d!46365 (= c!27735 (and (not (= lt!77331 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!77331 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77333 () ListLongMap!1755)

(assert (=> d!46365 (= lt!77333 (map!1458 (_2!1381 lt!77068)))))

(assert (=> d!46365 (= lt!77322 (get!1574 (select (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!453 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46365 (= lt!77331 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!46365 (valid!593 thiss!992)))

(assert (=> d!46365 (= (repackFrom!19 thiss!992 (_2!1381 lt!77068) (bvsub from!355 #b00000000000000000000000000000001)) lt!77329)))

(declare-fun bm!16388 () Bool)

(assert (=> bm!16388 (= call!16393 (+!175 (ite c!27738 lt!77316 lt!77330) (tuple2!2743 lt!77331 lt!77322)))))

(declare-fun b!146890 () Bool)

(declare-fun lt!77337 () tuple2!2740)

(assert (=> b!146890 (= e!95891 (tuple2!2741 (_1!1381 lt!77337) (_2!1381 lt!77337)))))

(assert (=> b!146890 (= lt!77327 call!16395)))

(assert (=> b!146890 (= lt!77318 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77315 () Unit!4636)

(assert (=> b!146890 (= lt!77315 call!16389)))

(declare-fun call!16388 () ListLongMap!1755)

(assert (=> b!146890 (= call!16392 call!16388)))

(declare-fun lt!77341 () Unit!4636)

(assert (=> b!146890 (= lt!77341 lt!77315)))

(assert (=> b!146890 (= lt!77316 call!16387)))

(assert (=> b!146890 (= lt!77323 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77338 () Unit!4636)

(assert (=> b!146890 (= lt!77338 call!16390)))

(assert (=> b!146890 (= call!16396 call!16394)))

(declare-fun lt!77317 () Unit!4636)

(assert (=> b!146890 (= lt!77317 lt!77338)))

(assert (=> b!146890 (= lt!77337 call!16399)))

(declare-fun bm!16396 () Bool)

(assert (=> bm!16396 (= call!16388 (+!175 call!16398 (tuple2!2743 lt!77331 lt!77322)))))

(declare-fun b!146891 () Bool)

(assert (=> b!146891 (= e!95891 (tuple2!2741 true (_2!1381 lt!77319)))))

(assert (=> b!146891 (= lt!77330 call!16395)))

(assert (=> b!146891 (= lt!77321 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77339 () Unit!4636)

(assert (=> b!146891 (= lt!77339 call!16390)))

(assert (=> b!146891 (= call!16394 call!16396)))

(declare-fun lt!77343 () Unit!4636)

(assert (=> b!146891 (= lt!77343 lt!77339)))

(assert (=> b!146891 (= lt!77332 call!16392)))

(assert (=> b!146891 (= lt!77335 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77314 () Unit!4636)

(assert (=> b!146891 (= lt!77314 call!16389)))

(assert (=> b!146891 (= call!16387 call!16388)))

(declare-fun lt!77336 () Unit!4636)

(assert (=> b!146891 (= lt!77336 lt!77314)))

(declare-fun b!146892 () Bool)

(assert (=> b!146892 (= e!95885 e!95886)))

(declare-fun c!27739 () Bool)

(assert (=> b!146892 (= c!27739 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!146893 () Bool)

(assert (=> b!146893 (= e!95889 (ite (= lt!77331 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!146894 () Bool)

(assert (=> b!146894 (= e!95886 (tuple2!2741 true (_2!1381 lt!77068)))))

(declare-fun b!146895 () Bool)

(assert (=> b!146895 (= e!95888 (tuple2!2741 false (_2!1381 lt!77319)))))

(declare-fun b!146896 () Bool)

(assert (=> b!146896 (= e!95892 e!95887)))

(declare-fun res!69789 () Bool)

(assert (=> b!146896 (=> (not res!69789) (not e!95887))))

(assert (=> b!146896 (= res!69789 (valid!594 (_2!1381 lt!77329)))))

(declare-fun b!146897 () Bool)

(assert (=> b!146897 (= e!95885 e!95888)))

(assert (=> b!146897 (= lt!77319 (update!228 (_2!1381 lt!77068) lt!77331 lt!77322))))

(declare-fun c!27734 () Bool)

(assert (=> b!146897 (= c!27734 (contains!941 lt!77333 lt!77331))))

(declare-fun lt!77324 () Unit!4636)

(assert (=> b!146897 (= lt!77324 e!95890)))

(declare-fun c!27737 () Bool)

(assert (=> b!146897 (= c!27737 (_1!1381 lt!77319))))

(declare-fun b!146898 () Bool)

(declare-fun Unit!4646 () Unit!4636)

(assert (=> b!146898 (= e!95890 Unit!4646)))

(assert (= (and d!46365 c!27735) b!146897))

(assert (= (and d!46365 (not c!27735)) b!146892))

(assert (= (and b!146897 c!27734) b!146889))

(assert (= (and b!146897 (not c!27734)) b!146898))

(assert (= (and b!146889 c!27736) b!146885))

(assert (= (and b!146889 (not c!27736)) b!146893))

(assert (= (and b!146897 c!27737) b!146887))

(assert (= (and b!146897 (not c!27737)) b!146895))

(assert (= (and b!146887 c!27738) b!146890))

(assert (= (and b!146887 (not c!27738)) b!146891))

(assert (= (or b!146890 b!146891) bm!16386))

(assert (= (or b!146890 b!146891) bm!16387))

(assert (= (or b!146890 b!146891) bm!16388))

(assert (= (or b!146890 b!146891) bm!16394))

(assert (= (or b!146890 b!146891) bm!16384))

(assert (= (or b!146890 b!146891) bm!16385))

(assert (= (or b!146890 b!146891) bm!16390))

(assert (= (or b!146890 b!146891) bm!16391))

(assert (= (or b!146890 b!146891) bm!16393))

(assert (= (or b!146890 b!146891) bm!16396))

(assert (= (or b!146890 b!146891) bm!16389))

(assert (= (or b!146890 b!146891) bm!16395))

(assert (= (and b!146892 c!27739) b!146888))

(assert (= (and b!146892 (not c!27739)) b!146894))

(assert (= (or b!146890 b!146888) bm!16392))

(assert (= (and d!46365 (not res!69790)) b!146896))

(assert (= (and b!146896 res!69789) b!146886))

(declare-fun b_lambda!6559 () Bool)

(assert (=> (not b_lambda!6559) (not d!46365)))

(assert (=> d!46365 t!6485))

(declare-fun b_and!9193 () Bool)

(assert (= b_and!9189 (and (=> t!6485 result!4363) b_and!9193)))

(assert (=> d!46365 t!6487))

(declare-fun b_and!9195 () Bool)

(assert (= b_and!9191 (and (=> t!6487 result!4367) b_and!9195)))

(declare-fun m!176363 () Bool)

(assert (=> bm!16395 m!176363))

(declare-fun m!176365 () Bool)

(assert (=> bm!16388 m!176365))

(declare-fun m!176367 () Bool)

(assert (=> d!46365 m!176367))

(assert (=> d!46365 m!176137))

(assert (=> d!46365 m!176141))

(declare-fun m!176369 () Bool)

(assert (=> d!46365 m!176369))

(assert (=> d!46365 m!176087))

(assert (=> d!46365 m!176369))

(assert (=> d!46365 m!176137))

(declare-fun m!176371 () Bool)

(assert (=> d!46365 m!176371))

(declare-fun m!176373 () Bool)

(assert (=> bm!16394 m!176373))

(declare-fun m!176375 () Bool)

(assert (=> b!146889 m!176375))

(declare-fun m!176377 () Bool)

(assert (=> b!146889 m!176377))

(declare-fun m!176379 () Bool)

(assert (=> b!146889 m!176379))

(declare-fun m!176381 () Bool)

(assert (=> b!146889 m!176381))

(declare-fun m!176383 () Bool)

(assert (=> b!146889 m!176383))

(declare-fun m!176385 () Bool)

(assert (=> bm!16384 m!176385))

(declare-fun m!176387 () Bool)

(assert (=> bm!16391 m!176387))

(declare-fun m!176389 () Bool)

(assert (=> b!146897 m!176389))

(declare-fun m!176391 () Bool)

(assert (=> b!146897 m!176391))

(declare-fun m!176393 () Bool)

(assert (=> b!146885 m!176393))

(declare-fun m!176395 () Bool)

(assert (=> bm!16393 m!176395))

(declare-fun m!176397 () Bool)

(assert (=> bm!16392 m!176397))

(declare-fun m!176399 () Bool)

(assert (=> b!146896 m!176399))

(declare-fun m!176401 () Bool)

(assert (=> b!146886 m!176401))

(assert (=> b!146886 m!176115))

(declare-fun m!176403 () Bool)

(assert (=> bm!16386 m!176403))

(declare-fun m!176405 () Bool)

(assert (=> bm!16389 m!176405))

(declare-fun m!176407 () Bool)

(assert (=> bm!16390 m!176407))

(declare-fun m!176409 () Bool)

(assert (=> bm!16385 m!176409))

(declare-fun m!176411 () Bool)

(assert (=> bm!16387 m!176411))

(declare-fun m!176413 () Bool)

(assert (=> bm!16396 m!176413))

(assert (=> b!146640 d!46365))

(declare-fun d!46367 () Bool)

(assert (=> d!46367 (not (arrayContainsKey!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77347 () Unit!4636)

(declare-fun choose!68 (array!4991 (_ BitVec 32) (_ BitVec 64) List!1781) Unit!4636)

(assert (=> d!46367 (= lt!77347 (choose!68 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (Cons!1777 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) Nil!1778)))))

(assert (=> d!46367 (bvslt (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46367 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (Cons!1777 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) Nil!1778)) lt!77347)))

(declare-fun bs!6130 () Bool)

(assert (= bs!6130 d!46367))

(assert (=> bs!6130 m!176091))

(assert (=> bs!6130 m!176127))

(assert (=> bs!6130 m!176091))

(declare-fun m!176415 () Bool)

(assert (=> bs!6130 m!176415))

(assert (=> b!146650 d!46367))

(declare-fun d!46369 () Bool)

(assert (=> d!46369 (arrayNoDuplicates!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) from!355 Nil!1778)))

(declare-fun lt!77350 () Unit!4636)

(declare-fun choose!39 (array!4991 (_ BitVec 32) (_ BitVec 32)) Unit!4636)

(assert (=> d!46369 (= lt!77350 (choose!39 (_keys!4786 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!46369 (bvslt (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46369 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000000 from!355) lt!77350)))

(declare-fun bs!6131 () Bool)

(assert (= bs!6131 d!46369))

(assert (=> bs!6131 m!176123))

(declare-fun m!176417 () Bool)

(assert (=> bs!6131 m!176417))

(assert (=> b!146650 d!46369))

(declare-fun d!46371 () Bool)

(declare-fun res!69795 () Bool)

(declare-fun e!95897 () Bool)

(assert (=> d!46371 (=> res!69795 e!95897)))

(assert (=> d!46371 (= res!69795 (= (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(assert (=> d!46371 (= (arrayContainsKey!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!95897)))

(declare-fun b!146903 () Bool)

(declare-fun e!95898 () Bool)

(assert (=> b!146903 (= e!95897 e!95898)))

(declare-fun res!69796 () Bool)

(assert (=> b!146903 (=> (not res!69796) (not e!95898))))

(assert (=> b!146903 (= res!69796 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun b!146904 () Bool)

(assert (=> b!146904 (= e!95898 (arrayContainsKey!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!46371 (not res!69795)) b!146903))

(assert (= (and b!146903 res!69796) b!146904))

(assert (=> d!46371 m!176309))

(assert (=> b!146904 m!176091))

(declare-fun m!176419 () Bool)

(assert (=> b!146904 m!176419))

(assert (=> b!146650 d!46371))

(declare-fun d!46373 () Bool)

(declare-fun e!95901 () Bool)

(assert (=> d!46373 e!95901))

(declare-fun c!27742 () Bool)

(assert (=> d!46373 (= c!27742 (and (not (= (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77353 () Unit!4636)

(declare-fun choose!907 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 64) (_ BitVec 32) Int) Unit!4636)

(assert (=> d!46373 (= lt!77353 (choose!907 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(assert (=> d!46373 (validMask!0 (mask!7397 (v!3356 (underlying!500 thiss!992))))))

(assert (=> d!46373 (= (lemmaListMapContainsThenArrayContainsFrom!161 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))) lt!77353)))

(declare-fun b!146909 () Bool)

(assert (=> b!146909 (= e!95901 (arrayContainsKey!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!146910 () Bool)

(assert (=> b!146910 (= e!95901 (ite (= (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46373 c!27742) b!146909))

(assert (= (and d!46373 (not c!27742)) b!146910))

(assert (=> d!46373 m!176091))

(declare-fun m!176421 () Bool)

(assert (=> d!46373 m!176421))

(assert (=> d!46373 m!176329))

(assert (=> b!146909 m!176091))

(assert (=> b!146909 m!176127))

(assert (=> b!146650 d!46373))

(declare-fun b!146921 () Bool)

(declare-fun e!95912 () Bool)

(declare-fun e!95910 () Bool)

(assert (=> b!146921 (= e!95912 e!95910)))

(declare-fun c!27745 () Bool)

(assert (=> b!146921 (= c!27745 (validKeyInArray!0 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(declare-fun b!146922 () Bool)

(declare-fun call!16402 () Bool)

(assert (=> b!146922 (= e!95910 call!16402)))

(declare-fun b!146923 () Bool)

(declare-fun e!95911 () Bool)

(assert (=> b!146923 (= e!95911 e!95912)))

(declare-fun res!69805 () Bool)

(assert (=> b!146923 (=> (not res!69805) (not e!95912))))

(declare-fun e!95913 () Bool)

(assert (=> b!146923 (= res!69805 (not e!95913))))

(declare-fun res!69803 () Bool)

(assert (=> b!146923 (=> (not res!69803) (not e!95913))))

(assert (=> b!146923 (= res!69803 (validKeyInArray!0 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(declare-fun bm!16399 () Bool)

(assert (=> bm!16399 (= call!16402 (arrayNoDuplicates!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27745 (Cons!1777 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) Nil!1778) Nil!1778)))))

(declare-fun d!46375 () Bool)

(declare-fun res!69804 () Bool)

(assert (=> d!46375 (=> res!69804 e!95911)))

(assert (=> d!46375 (= res!69804 (bvsge from!355 (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(assert (=> d!46375 (= (arrayNoDuplicates!0 (_keys!4786 (v!3356 (underlying!500 thiss!992))) from!355 Nil!1778) e!95911)))

(declare-fun b!146924 () Bool)

(assert (=> b!146924 (= e!95910 call!16402)))

(declare-fun b!146925 () Bool)

(declare-fun contains!942 (List!1781 (_ BitVec 64)) Bool)

(assert (=> b!146925 (= e!95913 (contains!942 Nil!1778 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(assert (= (and d!46375 (not res!69804)) b!146923))

(assert (= (and b!146923 res!69803) b!146925))

(assert (= (and b!146923 res!69805) b!146921))

(assert (= (and b!146921 c!27745) b!146922))

(assert (= (and b!146921 (not c!27745)) b!146924))

(assert (= (or b!146922 b!146924) bm!16399))

(assert (=> b!146921 m!176091))

(assert (=> b!146921 m!176091))

(declare-fun m!176423 () Bool)

(assert (=> b!146921 m!176423))

(assert (=> b!146923 m!176091))

(assert (=> b!146923 m!176091))

(assert (=> b!146923 m!176423))

(assert (=> bm!16399 m!176091))

(declare-fun m!176425 () Bool)

(assert (=> bm!16399 m!176425))

(assert (=> b!146925 m!176091))

(assert (=> b!146925 m!176091))

(declare-fun m!176427 () Bool)

(assert (=> b!146925 m!176427))

(assert (=> b!146650 d!46375))

(declare-fun d!46377 () Bool)

(declare-fun res!69812 () Bool)

(declare-fun e!95916 () Bool)

(assert (=> d!46377 (=> (not res!69812) (not e!95916))))

(declare-fun simpleValid!101 (LongMapFixedSize!1204) Bool)

(assert (=> d!46377 (= res!69812 (simpleValid!101 (_2!1381 lt!77056)))))

(assert (=> d!46377 (= (valid!594 (_2!1381 lt!77056)) e!95916)))

(declare-fun b!146932 () Bool)

(declare-fun res!69813 () Bool)

(assert (=> b!146932 (=> (not res!69813) (not e!95916))))

(declare-fun arrayCountValidKeys!0 (array!4991 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!146932 (= res!69813 (= (arrayCountValidKeys!0 (_keys!4786 (_2!1381 lt!77056)) #b00000000000000000000000000000000 (size!2633 (_keys!4786 (_2!1381 lt!77056)))) (_size!651 (_2!1381 lt!77056))))))

(declare-fun b!146933 () Bool)

(declare-fun res!69814 () Bool)

(assert (=> b!146933 (=> (not res!69814) (not e!95916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4991 (_ BitVec 32)) Bool)

(assert (=> b!146933 (= res!69814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4786 (_2!1381 lt!77056)) (mask!7397 (_2!1381 lt!77056))))))

(declare-fun b!146934 () Bool)

(assert (=> b!146934 (= e!95916 (arrayNoDuplicates!0 (_keys!4786 (_2!1381 lt!77056)) #b00000000000000000000000000000000 Nil!1778))))

(assert (= (and d!46377 res!69812) b!146932))

(assert (= (and b!146932 res!69813) b!146933))

(assert (= (and b!146933 res!69814) b!146934))

(declare-fun m!176429 () Bool)

(assert (=> d!46377 m!176429))

(declare-fun m!176431 () Bool)

(assert (=> b!146932 m!176431))

(declare-fun m!176433 () Bool)

(assert (=> b!146933 m!176433))

(declare-fun m!176435 () Bool)

(assert (=> b!146934 m!176435))

(assert (=> b!146641 d!46377))

(declare-fun d!46379 () Bool)

(declare-fun res!69815 () Bool)

(declare-fun e!95917 () Bool)

(assert (=> d!46379 (=> (not res!69815) (not e!95917))))

(assert (=> d!46379 (= res!69815 (simpleValid!101 newMap!16))))

(assert (=> d!46379 (= (valid!594 newMap!16) e!95917)))

(declare-fun b!146935 () Bool)

(declare-fun res!69816 () Bool)

(assert (=> b!146935 (=> (not res!69816) (not e!95917))))

(assert (=> b!146935 (= res!69816 (= (arrayCountValidKeys!0 (_keys!4786 newMap!16) #b00000000000000000000000000000000 (size!2633 (_keys!4786 newMap!16))) (_size!651 newMap!16)))))

(declare-fun b!146936 () Bool)

(declare-fun res!69817 () Bool)

(assert (=> b!146936 (=> (not res!69817) (not e!95917))))

(assert (=> b!146936 (= res!69817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4786 newMap!16) (mask!7397 newMap!16)))))

(declare-fun b!146937 () Bool)

(assert (=> b!146937 (= e!95917 (arrayNoDuplicates!0 (_keys!4786 newMap!16) #b00000000000000000000000000000000 Nil!1778))))

(assert (= (and d!46379 res!69815) b!146935))

(assert (= (and b!146935 res!69816) b!146936))

(assert (= (and b!146936 res!69817) b!146937))

(declare-fun m!176437 () Bool)

(assert (=> d!46379 m!176437))

(declare-fun m!176439 () Bool)

(assert (=> b!146935 m!176439))

(declare-fun m!176441 () Bool)

(assert (=> b!146936 m!176441))

(declare-fun m!176443 () Bool)

(assert (=> b!146937 m!176443))

(assert (=> b!146644 d!46379))

(declare-fun d!46381 () Bool)

(declare-fun e!95923 () Bool)

(assert (=> d!46381 e!95923))

(declare-fun res!69820 () Bool)

(assert (=> d!46381 (=> res!69820 e!95923)))

(declare-fun lt!77364 () Bool)

(assert (=> d!46381 (= res!69820 (not lt!77364))))

(declare-fun lt!77363 () Bool)

(assert (=> d!46381 (= lt!77364 lt!77363)))

(declare-fun lt!77365 () Unit!4636)

(declare-fun e!95922 () Unit!4636)

(assert (=> d!46381 (= lt!77365 e!95922)))

(declare-fun c!27748 () Bool)

(assert (=> d!46381 (= c!27748 lt!77363)))

(declare-fun containsKey!183 (List!1780 (_ BitVec 64)) Bool)

(assert (=> d!46381 (= lt!77363 (containsKey!183 (toList!893 lt!77059) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(assert (=> d!46381 (= (contains!941 lt!77059 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)) lt!77364)))

(declare-fun b!146944 () Bool)

(declare-fun lt!77362 () Unit!4636)

(assert (=> b!146944 (= e!95922 lt!77362)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!132 (List!1780 (_ BitVec 64)) Unit!4636)

(assert (=> b!146944 (= lt!77362 (lemmaContainsKeyImpliesGetValueByKeyDefined!132 (toList!893 lt!77059) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(declare-datatypes ((Option!185 0))(
  ( (Some!184 (v!3362 V!3625)) (None!183) )
))
(declare-fun isDefined!133 (Option!185) Bool)

(declare-fun getValueByKey!179 (List!1780 (_ BitVec 64)) Option!185)

(assert (=> b!146944 (isDefined!133 (getValueByKey!179 (toList!893 lt!77059) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(declare-fun b!146945 () Bool)

(declare-fun Unit!4647 () Unit!4636)

(assert (=> b!146945 (= e!95922 Unit!4647)))

(declare-fun b!146946 () Bool)

(assert (=> b!146946 (= e!95923 (isDefined!133 (getValueByKey!179 (toList!893 lt!77059) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355))))))

(assert (= (and d!46381 c!27748) b!146944))

(assert (= (and d!46381 (not c!27748)) b!146945))

(assert (= (and d!46381 (not res!69820)) b!146946))

(assert (=> d!46381 m!176091))

(declare-fun m!176445 () Bool)

(assert (=> d!46381 m!176445))

(assert (=> b!146944 m!176091))

(declare-fun m!176447 () Bool)

(assert (=> b!146944 m!176447))

(assert (=> b!146944 m!176091))

(declare-fun m!176449 () Bool)

(assert (=> b!146944 m!176449))

(assert (=> b!146944 m!176449))

(declare-fun m!176451 () Bool)

(assert (=> b!146944 m!176451))

(assert (=> b!146946 m!176091))

(assert (=> b!146946 m!176449))

(assert (=> b!146946 m!176449))

(assert (=> b!146946 m!176451))

(assert (=> b!146654 d!46381))

(declare-fun b!147027 () Bool)

(declare-fun e!95981 () Bool)

(declare-fun call!16462 () ListLongMap!1755)

(declare-fun call!16474 () ListLongMap!1755)

(assert (=> b!147027 (= e!95981 (= call!16474 (+!175 call!16462 (tuple2!2743 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052))))))

(declare-fun b!147028 () Bool)

(declare-fun res!69861 () Bool)

(declare-datatypes ((SeekEntryResult!287 0))(
  ( (MissingZero!287 (index!3315 (_ BitVec 32))) (Found!287 (index!3316 (_ BitVec 32))) (Intermediate!287 (undefined!1099 Bool) (index!3317 (_ BitVec 32)) (x!16712 (_ BitVec 32))) (Undefined!287) (MissingVacant!287 (index!3318 (_ BitVec 32))) )
))
(declare-fun lt!77432 () SeekEntryResult!287)

(assert (=> b!147028 (= res!69861 (= (select (arr!2356 (_keys!4786 newMap!16)) (index!3318 lt!77432)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!95973 () Bool)

(assert (=> b!147028 (=> (not res!69861) (not e!95973))))

(declare-fun bm!16449 () Bool)

(declare-fun call!16455 () ListLongMap!1755)

(declare-fun call!16468 () ListLongMap!1755)

(assert (=> bm!16449 (= call!16455 call!16468)))

(declare-fun b!147029 () Bool)

(declare-fun res!69855 () Bool)

(declare-fun lt!77430 () SeekEntryResult!287)

(assert (=> b!147029 (= res!69855 (= (select (arr!2356 (_keys!4786 newMap!16)) (index!3318 lt!77430)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!95974 () Bool)

(assert (=> b!147029 (=> (not res!69855) (not e!95974))))

(declare-fun b!147030 () Bool)

(declare-fun e!95972 () Bool)

(declare-fun call!16463 () Bool)

(assert (=> b!147030 (= e!95972 (not call!16463))))

(declare-fun b!147031 () Bool)

(declare-fun lt!77433 () Unit!4636)

(declare-fun lt!77443 () Unit!4636)

(assert (=> b!147031 (= lt!77433 lt!77443)))

(declare-fun call!16461 () ListLongMap!1755)

(assert (=> b!147031 (= call!16461 call!16455)))

(declare-fun lt!77437 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!70 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 V!3625 Int) Unit!4636)

(assert (=> b!147031 (= lt!77443 (lemmaChangeLongMinValueKeyThenAddPairToListMap!70 (_keys!4786 newMap!16) (_values!3001 newMap!16) (mask!7397 newMap!16) (extraKeys!2763 newMap!16) lt!77437 (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) lt!77052 (defaultEntry!3018 newMap!16)))))

(assert (=> b!147031 (= lt!77437 (bvor (extraKeys!2763 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!95978 () tuple2!2740)

(assert (=> b!147031 (= e!95978 (tuple2!2741 true (LongMapFixedSize!1205 (defaultEntry!3018 newMap!16) (mask!7397 newMap!16) (bvor (extraKeys!2763 newMap!16) #b00000000000000000000000000000010) (zeroValue!2863 newMap!16) lt!77052 (_size!651 newMap!16) (_keys!4786 newMap!16) (_values!3001 newMap!16) (_vacant!651 newMap!16))))))

(declare-fun bm!16450 () Bool)

(declare-fun call!16451 () Bool)

(declare-fun call!16453 () Bool)

(assert (=> bm!16450 (= call!16451 call!16453)))

(declare-fun b!147032 () Bool)

(declare-fun lt!77425 () tuple2!2740)

(declare-fun call!16464 () tuple2!2740)

(assert (=> b!147032 (= lt!77425 call!16464)))

(declare-fun e!95977 () tuple2!2740)

(assert (=> b!147032 (= e!95977 (tuple2!2741 (_1!1381 lt!77425) (_2!1381 lt!77425)))))

(declare-fun bm!16451 () Bool)

(declare-fun c!27775 () Bool)

(declare-fun c!27784 () Bool)

(assert (=> bm!16451 (= c!27775 c!27784)))

(declare-fun lt!77439 () SeekEntryResult!287)

(declare-fun call!16471 () Bool)

(declare-fun e!95982 () ListLongMap!1755)

(assert (=> bm!16451 (= call!16471 (contains!941 e!95982 (ite c!27784 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (select (arr!2356 (_keys!4786 newMap!16)) (index!3316 lt!77439)))))))

(declare-fun b!147033 () Bool)

(declare-fun e!95983 () Bool)

(assert (=> b!147033 (= e!95983 ((_ is Undefined!287) lt!77430))))

(declare-fun c!27779 () Bool)

(declare-fun lt!77431 () SeekEntryResult!287)

(declare-fun c!27785 () Bool)

(declare-fun bm!16452 () Bool)

(declare-fun c!27781 () Bool)

(declare-fun lt!77429 () SeekEntryResult!287)

(declare-fun c!27782 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16452 (= call!16453 (inRange!0 (ite c!27784 (ite c!27785 (index!3316 lt!77429) (ite c!27782 (index!3315 lt!77432) (index!3318 lt!77432))) (ite c!27779 (index!3316 lt!77431) (ite c!27781 (index!3315 lt!77430) (index!3318 lt!77430)))) (mask!7397 newMap!16)))))

(declare-fun b!147034 () Bool)

(declare-fun e!95976 () Bool)

(declare-fun e!95966 () Bool)

(assert (=> b!147034 (= e!95976 e!95966)))

(declare-fun c!27780 () Bool)

(declare-fun lt!77423 () tuple2!2740)

(assert (=> b!147034 (= c!27780 (_1!1381 lt!77423))))

(declare-fun b!147035 () Bool)

(declare-fun call!16456 () ListLongMap!1755)

(assert (=> b!147035 (= e!95982 call!16456)))

(declare-fun b!147036 () Bool)

(declare-fun e!95986 () tuple2!2740)

(assert (=> b!147036 (= e!95986 e!95977)))

(declare-fun c!27776 () Bool)

(assert (=> b!147036 (= c!27776 ((_ is MissingZero!287) lt!77439))))

(declare-fun b!147037 () Bool)

(declare-fun e!95968 () Unit!4636)

(declare-fun lt!77434 () Unit!4636)

(assert (=> b!147037 (= e!95968 lt!77434)))

(declare-fun call!16459 () Unit!4636)

(assert (=> b!147037 (= lt!77434 call!16459)))

(declare-fun call!16454 () SeekEntryResult!287)

(assert (=> b!147037 (= lt!77432 call!16454)))

(assert (=> b!147037 (= c!27782 ((_ is MissingZero!287) lt!77432))))

(declare-fun e!95979 () Bool)

(assert (=> b!147037 e!95979))

(declare-fun b!147038 () Bool)

(declare-fun call!16452 () Bool)

(assert (=> b!147038 (= e!95973 (not call!16452))))

(declare-fun b!147039 () Bool)

(declare-fun lt!77442 () tuple2!2740)

(assert (=> b!147039 (= e!95986 (tuple2!2741 (_1!1381 lt!77442) (_2!1381 lt!77442)))))

(assert (=> b!147039 (= lt!77442 call!16464)))

(declare-fun b!147040 () Bool)

(declare-fun e!95985 () Unit!4636)

(declare-fun lt!77426 () Unit!4636)

(assert (=> b!147040 (= e!95985 lt!77426)))

(declare-fun call!16472 () Unit!4636)

(assert (=> b!147040 (= lt!77426 call!16472)))

(declare-fun call!16469 () SeekEntryResult!287)

(assert (=> b!147040 (= lt!77431 call!16469)))

(declare-fun res!69849 () Bool)

(assert (=> b!147040 (= res!69849 ((_ is Found!287) lt!77431))))

(declare-fun e!95984 () Bool)

(assert (=> b!147040 (=> (not res!69849) (not e!95984))))

(assert (=> b!147040 e!95984))

(declare-fun c!27778 () Bool)

(declare-fun bm!16453 () Bool)

(declare-fun updateHelperNewKey!70 (LongMapFixedSize!1204 (_ BitVec 64) V!3625 (_ BitVec 32)) tuple2!2740)

(assert (=> bm!16453 (= call!16464 (updateHelperNewKey!70 newMap!16 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052 (ite c!27778 (index!3318 lt!77439) (index!3315 lt!77439))))))

(declare-fun bm!16454 () Bool)

(declare-fun call!16465 () ListLongMap!1755)

(assert (=> bm!16454 (= call!16465 (getCurrentListMap!550 (_keys!4786 newMap!16) (_values!3001 newMap!16) (mask!7397 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3018 newMap!16)))))

(declare-fun bm!16455 () Bool)

(assert (=> bm!16455 (= call!16456 call!16468)))

(declare-fun b!147041 () Bool)

(assert (=> b!147041 (= e!95966 (= call!16474 call!16462))))

(declare-fun b!147042 () Bool)

(declare-fun res!69860 () Bool)

(assert (=> b!147042 (= res!69860 call!16451)))

(declare-fun e!95975 () Bool)

(assert (=> b!147042 (=> (not res!69860) (not e!95975))))

(declare-fun b!147043 () Bool)

(declare-fun e!95980 () tuple2!2740)

(assert (=> b!147043 (= e!95980 e!95978)))

(declare-fun c!27777 () Bool)

(assert (=> b!147043 (= c!27777 (= (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16456 () Bool)

(declare-fun call!16470 () ListLongMap!1755)

(declare-fun call!16467 () ListLongMap!1755)

(declare-fun c!27783 () Bool)

(assert (=> bm!16456 (= call!16470 (+!175 (ite c!27783 call!16467 call!16465) (ite c!27783 (ite c!27777 (tuple2!2743 #b0000000000000000000000000000000000000000000000000000000000000000 lt!77052) (tuple2!2743 #b1000000000000000000000000000000000000000000000000000000000000000 lt!77052)) (tuple2!2743 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052))))))

(declare-fun b!147044 () Bool)

(declare-fun e!95970 () Bool)

(assert (=> b!147044 (= e!95970 e!95973)))

(declare-fun res!69851 () Bool)

(declare-fun call!16473 () Bool)

(assert (=> b!147044 (= res!69851 call!16473)))

(assert (=> b!147044 (=> (not res!69851) (not e!95973))))

(declare-fun bm!16457 () Bool)

(declare-fun call!16460 () Bool)

(assert (=> bm!16457 (= call!16463 call!16460)))

(declare-fun bm!16458 () Bool)

(assert (=> bm!16458 (= call!16462 (map!1458 newMap!16))))

(declare-fun d!46383 () Bool)

(assert (=> d!46383 e!95976))

(declare-fun res!69859 () Bool)

(assert (=> d!46383 (=> (not res!69859) (not e!95976))))

(assert (=> d!46383 (= res!69859 (valid!594 (_2!1381 lt!77423)))))

(assert (=> d!46383 (= lt!77423 e!95980)))

(assert (=> d!46383 (= c!27783 (= (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (bvneg (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355))))))

(assert (=> d!46383 (valid!594 newMap!16)))

(assert (=> d!46383 (= (update!228 newMap!16 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052) lt!77423)))

(declare-fun bm!16448 () Bool)

(declare-fun call!16458 () SeekEntryResult!287)

(assert (=> bm!16448 (= call!16454 call!16458)))

(declare-fun bm!16459 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4991 (_ BitVec 32)) SeekEntryResult!287)

(assert (=> bm!16459 (= call!16458 (seekEntryOrOpen!0 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (_keys!4786 newMap!16) (mask!7397 newMap!16)))))

(declare-fun b!147045 () Bool)

(assert (=> b!147045 (= e!95975 (= (select (arr!2356 (_keys!4786 newMap!16)) (index!3316 lt!77429)) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(declare-fun b!147046 () Bool)

(assert (=> b!147046 (= e!95983 e!95974)))

(declare-fun res!69856 () Bool)

(declare-fun call!16457 () Bool)

(assert (=> b!147046 (= res!69856 call!16457)))

(assert (=> b!147046 (=> (not res!69856) (not e!95974))))

(declare-fun bm!16460 () Bool)

(assert (=> bm!16460 (= call!16469 call!16458)))

(declare-fun b!147047 () Bool)

(declare-fun res!69850 () Bool)

(declare-fun call!16466 () Bool)

(assert (=> b!147047 (= res!69850 call!16466)))

(assert (=> b!147047 (=> (not res!69850) (not e!95984))))

(declare-fun bm!16461 () Bool)

(assert (=> bm!16461 (= call!16461 call!16470)))

(declare-fun bm!16462 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!70 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 64) Int) Unit!4636)

(assert (=> bm!16462 (= call!16472 (lemmaInListMapThenSeekEntryOrOpenFindsIt!70 (_keys!4786 newMap!16) (_values!3001 newMap!16) (mask!7397 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (defaultEntry!3018 newMap!16)))))

(declare-fun bm!16463 () Bool)

(assert (=> bm!16463 (= call!16467 call!16465)))

(declare-fun b!147048 () Bool)

(assert (=> b!147048 (= c!27778 ((_ is MissingVacant!287) lt!77439))))

(declare-fun e!95967 () tuple2!2740)

(assert (=> b!147048 (= e!95967 e!95986)))

(declare-fun bm!16464 () Bool)

(assert (=> bm!16464 (= call!16452 call!16460)))

(declare-fun b!147049 () Bool)

(declare-fun e!95971 () Bool)

(assert (=> b!147049 (= e!95971 (not call!16452))))

(declare-fun b!147050 () Bool)

(declare-fun lt!77421 () Unit!4636)

(declare-fun lt!77435 () Unit!4636)

(assert (=> b!147050 (= lt!77421 lt!77435)))

(assert (=> b!147050 (= call!16461 call!16455)))

(declare-fun lt!77427 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!70 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 V!3625 Int) Unit!4636)

(assert (=> b!147050 (= lt!77435 (lemmaChangeZeroKeyThenAddPairToListMap!70 (_keys!4786 newMap!16) (_values!3001 newMap!16) (mask!7397 newMap!16) (extraKeys!2763 newMap!16) lt!77427 (zeroValue!2863 newMap!16) lt!77052 (minValue!2863 newMap!16) (defaultEntry!3018 newMap!16)))))

(assert (=> b!147050 (= lt!77427 (bvor (extraKeys!2763 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!147050 (= e!95978 (tuple2!2741 true (LongMapFixedSize!1205 (defaultEntry!3018 newMap!16) (mask!7397 newMap!16) (bvor (extraKeys!2763 newMap!16) #b00000000000000000000000000000001) lt!77052 (minValue!2863 newMap!16) (_size!651 newMap!16) (_keys!4786 newMap!16) (_values!3001 newMap!16) (_vacant!651 newMap!16))))))

(declare-fun b!147051 () Bool)

(declare-fun lt!77446 () Unit!4636)

(assert (=> b!147051 (= lt!77446 e!95968)))

(assert (=> b!147051 (= c!27785 call!16471)))

(assert (=> b!147051 (= e!95967 (tuple2!2741 false newMap!16))))

(declare-fun bm!16465 () Bool)

(assert (=> bm!16465 (= call!16460 (arrayContainsKey!0 (_keys!4786 newMap!16) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!147052 () Bool)

(declare-fun res!69857 () Bool)

(assert (=> b!147052 (=> (not res!69857) (not e!95972))))

(assert (=> b!147052 (= res!69857 (= (select (arr!2356 (_keys!4786 newMap!16)) (index!3315 lt!77430)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!147053 () Bool)

(declare-fun lt!77420 () Unit!4636)

(declare-fun lt!77445 () Unit!4636)

(assert (=> b!147053 (= lt!77420 lt!77445)))

(assert (=> b!147053 call!16471))

(declare-fun lt!77422 () array!4993)

(declare-fun lemmaValidKeyInArrayIsInListMap!129 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 32) Int) Unit!4636)

(assert (=> b!147053 (= lt!77445 (lemmaValidKeyInArrayIsInListMap!129 (_keys!4786 newMap!16) lt!77422 (mask!7397 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) (index!3316 lt!77439) (defaultEntry!3018 newMap!16)))))

(assert (=> b!147053 (= lt!77422 (array!4994 (store (arr!2357 (_values!3001 newMap!16)) (index!3316 lt!77439) (ValueCellFull!1148 lt!77052)) (size!2634 (_values!3001 newMap!16))))))

(declare-fun lt!77438 () Unit!4636)

(declare-fun lt!77441 () Unit!4636)

(assert (=> b!147053 (= lt!77438 lt!77441)))

(assert (=> b!147053 (= call!16470 call!16456)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!70 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 32) (_ BitVec 64) V!3625 Int) Unit!4636)

(assert (=> b!147053 (= lt!77441 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!70 (_keys!4786 newMap!16) (_values!3001 newMap!16) (mask!7397 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) (index!3316 lt!77439) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052 (defaultEntry!3018 newMap!16)))))

(declare-fun lt!77440 () Unit!4636)

(assert (=> b!147053 (= lt!77440 e!95985)))

(assert (=> b!147053 (= c!27779 (contains!941 call!16465 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(assert (=> b!147053 (= e!95977 (tuple2!2741 true (LongMapFixedSize!1205 (defaultEntry!3018 newMap!16) (mask!7397 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) (_size!651 newMap!16) (_keys!4786 newMap!16) (array!4994 (store (arr!2357 (_values!3001 newMap!16)) (index!3316 lt!77439) (ValueCellFull!1148 lt!77052)) (size!2634 (_values!3001 newMap!16))) (_vacant!651 newMap!16))))))

(declare-fun b!147054 () Bool)

(declare-fun res!69854 () Bool)

(assert (=> b!147054 (=> (not res!69854) (not e!95971))))

(assert (=> b!147054 (= res!69854 (= (select (arr!2356 (_keys!4786 newMap!16)) (index!3315 lt!77432)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!147055 () Bool)

(assert (=> b!147055 (= e!95966 e!95981)))

(declare-fun res!69858 () Bool)

(assert (=> b!147055 (= res!69858 (contains!941 call!16474 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(assert (=> b!147055 (=> (not res!69858) (not e!95981))))

(declare-fun b!147056 () Bool)

(declare-fun c!27786 () Bool)

(assert (=> b!147056 (= c!27786 ((_ is MissingVacant!287) lt!77432))))

(assert (=> b!147056 (= e!95979 e!95970)))

(declare-fun b!147057 () Bool)

(declare-fun res!69862 () Bool)

(assert (=> b!147057 (=> (not res!69862) (not e!95971))))

(assert (=> b!147057 (= res!69862 call!16473)))

(assert (=> b!147057 (= e!95979 e!95971)))

(declare-fun b!147058 () Bool)

(declare-fun res!69853 () Bool)

(assert (=> b!147058 (=> (not res!69853) (not e!95972))))

(assert (=> b!147058 (= res!69853 call!16457)))

(declare-fun e!95969 () Bool)

(assert (=> b!147058 (= e!95969 e!95972)))

(declare-fun b!147059 () Bool)

(declare-fun Unit!4648 () Unit!4636)

(assert (=> b!147059 (= e!95985 Unit!4648)))

(declare-fun lt!77428 () Unit!4636)

(assert (=> b!147059 (= lt!77428 call!16459)))

(assert (=> b!147059 (= lt!77430 call!16469)))

(assert (=> b!147059 (= c!27781 ((_ is MissingZero!287) lt!77430))))

(assert (=> b!147059 e!95969))

(declare-fun lt!77444 () Unit!4636)

(assert (=> b!147059 (= lt!77444 lt!77428)))

(assert (=> b!147059 false))

(declare-fun b!147060 () Bool)

(assert (=> b!147060 (= e!95974 (not call!16463))))

(declare-fun bm!16466 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!70 (array!4991 array!4993 (_ BitVec 32) (_ BitVec 32) V!3625 V!3625 (_ BitVec 64) Int) Unit!4636)

(assert (=> bm!16466 (= call!16459 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!70 (_keys!4786 newMap!16) (_values!3001 newMap!16) (mask!7397 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (defaultEntry!3018 newMap!16)))))

(declare-fun b!147061 () Bool)

(assert (=> b!147061 (= e!95970 ((_ is Undefined!287) lt!77432))))

(declare-fun bm!16467 () Bool)

(assert (=> bm!16467 (= call!16474 (map!1458 (_2!1381 lt!77423)))))

(declare-fun b!147062 () Bool)

(assert (=> b!147062 (= e!95984 (= (select (arr!2356 (_keys!4786 newMap!16)) (index!3316 lt!77431)) (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(declare-fun bm!16468 () Bool)

(assert (=> bm!16468 (= call!16457 call!16466)))

(declare-fun b!147063 () Bool)

(declare-fun Unit!4649 () Unit!4636)

(assert (=> b!147063 (= e!95968 Unit!4649)))

(declare-fun lt!77436 () Unit!4636)

(assert (=> b!147063 (= lt!77436 call!16472)))

(assert (=> b!147063 (= lt!77429 call!16454)))

(declare-fun res!69852 () Bool)

(assert (=> b!147063 (= res!69852 ((_ is Found!287) lt!77429))))

(assert (=> b!147063 (=> (not res!69852) (not e!95975))))

(assert (=> b!147063 e!95975))

(declare-fun lt!77424 () Unit!4636)

(assert (=> b!147063 (= lt!77424 lt!77436)))

(assert (=> b!147063 false))

(declare-fun bm!16469 () Bool)

(assert (=> bm!16469 (= call!16473 call!16451)))

(declare-fun b!147064 () Bool)

(declare-fun c!27787 () Bool)

(assert (=> b!147064 (= c!27787 ((_ is MissingVacant!287) lt!77430))))

(assert (=> b!147064 (= e!95969 e!95983)))

(declare-fun b!147065 () Bool)

(assert (=> b!147065 (= e!95982 (getCurrentListMap!550 (_keys!4786 newMap!16) lt!77422 (mask!7397 newMap!16) (extraKeys!2763 newMap!16) (zeroValue!2863 newMap!16) (minValue!2863 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3018 newMap!16)))))

(declare-fun b!147066 () Bool)

(assert (=> b!147066 (= e!95980 e!95967)))

(assert (=> b!147066 (= lt!77439 (seekEntryOrOpen!0 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) (_keys!4786 newMap!16) (mask!7397 newMap!16)))))

(assert (=> b!147066 (= c!27784 ((_ is Undefined!287) lt!77439))))

(declare-fun bm!16470 () Bool)

(assert (=> bm!16470 (= call!16468 (getCurrentListMap!550 (_keys!4786 newMap!16) (ite (or c!27783 c!27784) (_values!3001 newMap!16) (array!4994 (store (arr!2357 (_values!3001 newMap!16)) (index!3316 lt!77439) (ValueCellFull!1148 lt!77052)) (size!2634 (_values!3001 newMap!16)))) (mask!7397 newMap!16) (ite c!27783 (ite c!27777 lt!77427 lt!77437) (extraKeys!2763 newMap!16)) (ite (and c!27783 c!27777) lt!77052 (zeroValue!2863 newMap!16)) (ite c!27783 (ite c!27777 (minValue!2863 newMap!16) lt!77052) (minValue!2863 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!3018 newMap!16)))))

(declare-fun bm!16471 () Bool)

(assert (=> bm!16471 (= call!16466 call!16453)))

(assert (= (and d!46383 c!27783) b!147043))

(assert (= (and d!46383 (not c!27783)) b!147066))

(assert (= (and b!147043 c!27777) b!147050))

(assert (= (and b!147043 (not c!27777)) b!147031))

(assert (= (or b!147050 b!147031) bm!16449))

(assert (= (or b!147050 b!147031) bm!16463))

(assert (= (or b!147050 b!147031) bm!16461))

(assert (= (and b!147066 c!27784) b!147051))

(assert (= (and b!147066 (not c!27784)) b!147048))

(assert (= (and b!147051 c!27785) b!147063))

(assert (= (and b!147051 (not c!27785)) b!147037))

(assert (= (and b!147063 res!69852) b!147042))

(assert (= (and b!147042 res!69860) b!147045))

(assert (= (and b!147037 c!27782) b!147057))

(assert (= (and b!147037 (not c!27782)) b!147056))

(assert (= (and b!147057 res!69862) b!147054))

(assert (= (and b!147054 res!69854) b!147049))

(assert (= (and b!147056 c!27786) b!147044))

(assert (= (and b!147056 (not c!27786)) b!147061))

(assert (= (and b!147044 res!69851) b!147028))

(assert (= (and b!147028 res!69861) b!147038))

(assert (= (or b!147057 b!147044) bm!16469))

(assert (= (or b!147049 b!147038) bm!16464))

(assert (= (or b!147042 bm!16469) bm!16450))

(assert (= (or b!147063 b!147037) bm!16448))

(assert (= (and b!147048 c!27778) b!147039))

(assert (= (and b!147048 (not c!27778)) b!147036))

(assert (= (and b!147036 c!27776) b!147032))

(assert (= (and b!147036 (not c!27776)) b!147053))

(assert (= (and b!147053 c!27779) b!147040))

(assert (= (and b!147053 (not c!27779)) b!147059))

(assert (= (and b!147040 res!69849) b!147047))

(assert (= (and b!147047 res!69850) b!147062))

(assert (= (and b!147059 c!27781) b!147058))

(assert (= (and b!147059 (not c!27781)) b!147064))

(assert (= (and b!147058 res!69853) b!147052))

(assert (= (and b!147052 res!69857) b!147030))

(assert (= (and b!147064 c!27787) b!147046))

(assert (= (and b!147064 (not c!27787)) b!147033))

(assert (= (and b!147046 res!69856) b!147029))

(assert (= (and b!147029 res!69855) b!147060))

(assert (= (or b!147058 b!147046) bm!16468))

(assert (= (or b!147030 b!147060) bm!16457))

(assert (= (or b!147047 bm!16468) bm!16471))

(assert (= (or b!147040 b!147059) bm!16460))

(assert (= (or b!147039 b!147032) bm!16453))

(assert (= (or b!147037 b!147059) bm!16466))

(assert (= (or bm!16450 bm!16471) bm!16452))

(assert (= (or bm!16448 bm!16460) bm!16459))

(assert (= (or b!147051 b!147053) bm!16455))

(assert (= (or bm!16464 bm!16457) bm!16465))

(assert (= (or b!147063 b!147040) bm!16462))

(assert (= (or b!147051 b!147053) bm!16451))

(assert (= (and bm!16451 c!27775) b!147035))

(assert (= (and bm!16451 (not c!27775)) b!147065))

(assert (= (or bm!16449 bm!16455) bm!16470))

(assert (= (or bm!16463 b!147053) bm!16454))

(assert (= (or bm!16461 b!147053) bm!16456))

(assert (= (and d!46383 res!69859) b!147034))

(assert (= (and b!147034 c!27780) b!147055))

(assert (= (and b!147034 (not c!27780)) b!147041))

(assert (= (and b!147055 res!69858) b!147027))

(assert (= (or b!147055 b!147027 b!147041) bm!16467))

(assert (= (or b!147027 b!147041) bm!16458))

(assert (=> bm!16453 m!176091))

(declare-fun m!176453 () Bool)

(assert (=> bm!16453 m!176453))

(declare-fun m!176455 () Bool)

(assert (=> b!147053 m!176455))

(declare-fun m!176457 () Bool)

(assert (=> b!147053 m!176457))

(assert (=> b!147053 m!176091))

(declare-fun m!176459 () Bool)

(assert (=> b!147053 m!176459))

(assert (=> b!147053 m!176091))

(declare-fun m!176461 () Bool)

(assert (=> b!147053 m!176461))

(assert (=> bm!16454 m!176305))

(declare-fun m!176463 () Bool)

(assert (=> b!147052 m!176463))

(assert (=> bm!16459 m!176091))

(declare-fun m!176465 () Bool)

(assert (=> bm!16459 m!176465))

(assert (=> bm!16470 m!176457))

(declare-fun m!176467 () Bool)

(assert (=> bm!16470 m!176467))

(declare-fun m!176469 () Bool)

(assert (=> bm!16467 m!176469))

(assert (=> bm!16466 m!176091))

(declare-fun m!176471 () Bool)

(assert (=> bm!16466 m!176471))

(declare-fun m!176473 () Bool)

(assert (=> b!147031 m!176473))

(declare-fun m!176475 () Bool)

(assert (=> bm!16456 m!176475))

(declare-fun m!176477 () Bool)

(assert (=> b!147045 m!176477))

(assert (=> b!147055 m!176091))

(declare-fun m!176479 () Bool)

(assert (=> b!147055 m!176479))

(declare-fun m!176481 () Bool)

(assert (=> bm!16452 m!176481))

(declare-fun m!176483 () Bool)

(assert (=> b!147054 m!176483))

(assert (=> bm!16462 m!176091))

(declare-fun m!176485 () Bool)

(assert (=> bm!16462 m!176485))

(assert (=> bm!16458 m!176143))

(declare-fun m!176487 () Bool)

(assert (=> d!46383 m!176487))

(assert (=> d!46383 m!176111))

(declare-fun m!176489 () Bool)

(assert (=> b!147050 m!176489))

(declare-fun m!176491 () Bool)

(assert (=> b!147029 m!176491))

(declare-fun m!176493 () Bool)

(assert (=> b!147065 m!176493))

(declare-fun m!176495 () Bool)

(assert (=> b!147062 m!176495))

(declare-fun m!176497 () Bool)

(assert (=> b!147028 m!176497))

(declare-fun m!176499 () Bool)

(assert (=> b!147027 m!176499))

(declare-fun m!176501 () Bool)

(assert (=> bm!16451 m!176501))

(declare-fun m!176503 () Bool)

(assert (=> bm!16451 m!176503))

(assert (=> b!147066 m!176091))

(assert (=> b!147066 m!176465))

(assert (=> bm!16465 m!176091))

(declare-fun m!176505 () Bool)

(assert (=> bm!16465 m!176505))

(assert (=> b!146654 d!46383))

(declare-fun d!46385 () Bool)

(assert (=> d!46385 (= (valid!593 thiss!992) (valid!594 (v!3356 (underlying!500 thiss!992))))))

(declare-fun bs!6132 () Bool)

(assert (= bs!6132 d!46385))

(declare-fun m!176507 () Bool)

(assert (=> bs!6132 m!176507))

(assert (=> start!15218 d!46385))

(declare-fun d!46387 () Bool)

(declare-fun e!95989 () Bool)

(assert (=> d!46387 e!95989))

(declare-fun res!69867 () Bool)

(assert (=> d!46387 (=> (not res!69867) (not e!95989))))

(declare-fun lt!77458 () ListLongMap!1755)

(assert (=> d!46387 (= res!69867 (contains!941 lt!77458 (_1!1382 lt!77062)))))

(declare-fun lt!77455 () List!1780)

(assert (=> d!46387 (= lt!77458 (ListLongMap!1756 lt!77455))))

(declare-fun lt!77457 () Unit!4636)

(declare-fun lt!77456 () Unit!4636)

(assert (=> d!46387 (= lt!77457 lt!77456)))

(assert (=> d!46387 (= (getValueByKey!179 lt!77455 (_1!1382 lt!77062)) (Some!184 (_2!1382 lt!77062)))))

(declare-fun lemmaContainsTupThenGetReturnValue!95 (List!1780 (_ BitVec 64) V!3625) Unit!4636)

(assert (=> d!46387 (= lt!77456 (lemmaContainsTupThenGetReturnValue!95 lt!77455 (_1!1382 lt!77062) (_2!1382 lt!77062)))))

(declare-fun insertStrictlySorted!98 (List!1780 (_ BitVec 64) V!3625) List!1780)

(assert (=> d!46387 (= lt!77455 (insertStrictlySorted!98 (toList!893 lt!77067) (_1!1382 lt!77062) (_2!1382 lt!77062)))))

(assert (=> d!46387 (= (+!175 lt!77067 lt!77062) lt!77458)))

(declare-fun b!147071 () Bool)

(declare-fun res!69868 () Bool)

(assert (=> b!147071 (=> (not res!69868) (not e!95989))))

(assert (=> b!147071 (= res!69868 (= (getValueByKey!179 (toList!893 lt!77458) (_1!1382 lt!77062)) (Some!184 (_2!1382 lt!77062))))))

(declare-fun b!147072 () Bool)

(declare-fun contains!943 (List!1780 tuple2!2742) Bool)

(assert (=> b!147072 (= e!95989 (contains!943 (toList!893 lt!77458) lt!77062))))

(assert (= (and d!46387 res!69867) b!147071))

(assert (= (and b!147071 res!69868) b!147072))

(declare-fun m!176509 () Bool)

(assert (=> d!46387 m!176509))

(declare-fun m!176511 () Bool)

(assert (=> d!46387 m!176511))

(declare-fun m!176513 () Bool)

(assert (=> d!46387 m!176513))

(declare-fun m!176515 () Bool)

(assert (=> d!46387 m!176515))

(declare-fun m!176517 () Bool)

(assert (=> b!147071 m!176517))

(declare-fun m!176519 () Bool)

(assert (=> b!147072 m!176519))

(assert (=> b!146653 d!46387))

(declare-fun d!46389 () Bool)

(assert (=> d!46389 (= (+!175 (+!175 lt!77050 (tuple2!2743 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052)) (tuple2!2743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3356 (underlying!500 thiss!992))))) (+!175 (+!175 lt!77050 (tuple2!2743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3356 (underlying!500 thiss!992))))) (tuple2!2743 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052)))))

(declare-fun lt!77461 () Unit!4636)

(declare-fun choose!908 (ListLongMap!1755 (_ BitVec 64) V!3625 (_ BitVec 64) V!3625) Unit!4636)

(assert (=> d!46389 (= lt!77461 (choose!908 lt!77050 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3356 (underlying!500 thiss!992)))))))

(assert (=> d!46389 (not (= (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46389 (= (addCommutativeForDiffKeys!68 lt!77050 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3356 (underlying!500 thiss!992)))) lt!77461)))

(declare-fun bs!6133 () Bool)

(assert (= bs!6133 d!46389))

(declare-fun m!176521 () Bool)

(assert (=> bs!6133 m!176521))

(assert (=> bs!6133 m!176521))

(declare-fun m!176523 () Bool)

(assert (=> bs!6133 m!176523))

(declare-fun m!176525 () Bool)

(assert (=> bs!6133 m!176525))

(declare-fun m!176527 () Bool)

(assert (=> bs!6133 m!176527))

(assert (=> bs!6133 m!176091))

(declare-fun m!176529 () Bool)

(assert (=> bs!6133 m!176529))

(assert (=> bs!6133 m!176525))

(assert (=> b!146653 d!46389))

(declare-fun b!147097 () Bool)

(assert (=> b!147097 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(assert (=> b!147097 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2634 (_values!3001 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun lt!77479 () ListLongMap!1755)

(declare-fun e!96005 () Bool)

(assert (=> b!147097 (= e!96005 (= (apply!125 lt!77479 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1574 (select (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!453 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!147098 () Bool)

(declare-fun e!96008 () Bool)

(assert (=> b!147098 (= e!96008 (validKeyInArray!0 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!147098 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun bm!16474 () Bool)

(declare-fun call!16477 () ListLongMap!1755)

(assert (=> bm!16474 (= call!16477 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun b!147099 () Bool)

(declare-fun e!96006 () Bool)

(declare-fun isEmpty!430 (ListLongMap!1755) Bool)

(assert (=> b!147099 (= e!96006 (isEmpty!430 lt!77479))))

(declare-fun d!46391 () Bool)

(declare-fun e!96009 () Bool)

(assert (=> d!46391 e!96009))

(declare-fun res!69880 () Bool)

(assert (=> d!46391 (=> (not res!69880) (not e!96009))))

(assert (=> d!46391 (= res!69880 (not (contains!941 lt!77479 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!96004 () ListLongMap!1755)

(assert (=> d!46391 (= lt!77479 e!96004)))

(declare-fun c!27797 () Bool)

(assert (=> d!46391 (= c!27797 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(assert (=> d!46391 (validMask!0 (mask!7397 (v!3356 (underlying!500 thiss!992))))))

(assert (=> d!46391 (= (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))) lt!77479)))

(declare-fun b!147100 () Bool)

(assert (=> b!147100 (= e!96006 (= lt!77479 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun b!147101 () Bool)

(declare-fun e!96010 () Bool)

(assert (=> b!147101 (= e!96010 e!96006)))

(declare-fun c!27798 () Bool)

(assert (=> b!147101 (= c!27798 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun b!147102 () Bool)

(declare-fun e!96007 () ListLongMap!1755)

(assert (=> b!147102 (= e!96007 call!16477)))

(declare-fun b!147103 () Bool)

(assert (=> b!147103 (= e!96010 e!96005)))

(assert (=> b!147103 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun res!69877 () Bool)

(assert (=> b!147103 (= res!69877 (contains!941 lt!77479 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!147103 (=> (not res!69877) (not e!96005))))

(declare-fun b!147104 () Bool)

(assert (=> b!147104 (= e!96004 e!96007)))

(declare-fun c!27799 () Bool)

(assert (=> b!147104 (= c!27799 (validKeyInArray!0 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!147105 () Bool)

(declare-fun res!69878 () Bool)

(assert (=> b!147105 (=> (not res!69878) (not e!96009))))

(assert (=> b!147105 (= res!69878 (not (contains!941 lt!77479 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!147106 () Bool)

(declare-fun lt!77481 () Unit!4636)

(declare-fun lt!77480 () Unit!4636)

(assert (=> b!147106 (= lt!77481 lt!77480)))

(declare-fun lt!77477 () (_ BitVec 64))

(declare-fun lt!77478 () ListLongMap!1755)

(declare-fun lt!77476 () (_ BitVec 64))

(declare-fun lt!77482 () V!3625)

(assert (=> b!147106 (not (contains!941 (+!175 lt!77478 (tuple2!2743 lt!77477 lt!77482)) lt!77476))))

(declare-fun addStillNotContains!69 (ListLongMap!1755 (_ BitVec 64) V!3625 (_ BitVec 64)) Unit!4636)

(assert (=> b!147106 (= lt!77480 (addStillNotContains!69 lt!77478 lt!77477 lt!77482 lt!77476))))

(assert (=> b!147106 (= lt!77476 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!147106 (= lt!77482 (get!1574 (select (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!453 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147106 (= lt!77477 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!147106 (= lt!77478 call!16477)))

(assert (=> b!147106 (= e!96007 (+!175 call!16477 (tuple2!2743 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1574 (select (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!453 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!147107 () Bool)

(assert (=> b!147107 (= e!96009 e!96010)))

(declare-fun c!27796 () Bool)

(assert (=> b!147107 (= c!27796 e!96008)))

(declare-fun res!69879 () Bool)

(assert (=> b!147107 (=> (not res!69879) (not e!96008))))

(assert (=> b!147107 (= res!69879 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun b!147108 () Bool)

(assert (=> b!147108 (= e!96004 (ListLongMap!1756 Nil!1777))))

(assert (= (and d!46391 c!27797) b!147108))

(assert (= (and d!46391 (not c!27797)) b!147104))

(assert (= (and b!147104 c!27799) b!147106))

(assert (= (and b!147104 (not c!27799)) b!147102))

(assert (= (or b!147106 b!147102) bm!16474))

(assert (= (and d!46391 res!69880) b!147105))

(assert (= (and b!147105 res!69878) b!147107))

(assert (= (and b!147107 res!69879) b!147098))

(assert (= (and b!147107 c!27796) b!147103))

(assert (= (and b!147107 (not c!27796)) b!147101))

(assert (= (and b!147103 res!69877) b!147097))

(assert (= (and b!147101 c!27798) b!147100))

(assert (= (and b!147101 (not c!27798)) b!147099))

(declare-fun b_lambda!6561 () Bool)

(assert (=> (not b_lambda!6561) (not b!147097)))

(assert (=> b!147097 t!6485))

(declare-fun b_and!9197 () Bool)

(assert (= b_and!9193 (and (=> t!6485 result!4363) b_and!9197)))

(assert (=> b!147097 t!6487))

(declare-fun b_and!9199 () Bool)

(assert (= b_and!9195 (and (=> t!6487 result!4367) b_and!9199)))

(declare-fun b_lambda!6563 () Bool)

(assert (=> (not b_lambda!6563) (not b!147106)))

(assert (=> b!147106 t!6485))

(declare-fun b_and!9201 () Bool)

(assert (= b_and!9197 (and (=> t!6485 result!4363) b_and!9201)))

(assert (=> b!147106 t!6487))

(declare-fun b_and!9203 () Bool)

(assert (= b_and!9199 (and (=> t!6487 result!4367) b_and!9203)))

(assert (=> b!147097 m!176137))

(assert (=> b!147097 m!176313))

(assert (=> b!147097 m!176309))

(assert (=> b!147097 m!176313))

(assert (=> b!147097 m!176137))

(assert (=> b!147097 m!176315))

(assert (=> b!147097 m!176309))

(declare-fun m!176531 () Bool)

(assert (=> b!147097 m!176531))

(declare-fun m!176533 () Bool)

(assert (=> b!147100 m!176533))

(assert (=> b!147098 m!176309))

(assert (=> b!147098 m!176309))

(assert (=> b!147098 m!176311))

(assert (=> b!147104 m!176309))

(assert (=> b!147104 m!176309))

(assert (=> b!147104 m!176311))

(declare-fun m!176535 () Bool)

(assert (=> b!147105 m!176535))

(declare-fun m!176537 () Bool)

(assert (=> b!147099 m!176537))

(declare-fun m!176539 () Bool)

(assert (=> d!46391 m!176539))

(assert (=> d!46391 m!176329))

(assert (=> bm!16474 m!176533))

(assert (=> b!147106 m!176137))

(assert (=> b!147106 m!176313))

(assert (=> b!147106 m!176137))

(assert (=> b!147106 m!176315))

(declare-fun m!176541 () Bool)

(assert (=> b!147106 m!176541))

(declare-fun m!176543 () Bool)

(assert (=> b!147106 m!176543))

(declare-fun m!176545 () Bool)

(assert (=> b!147106 m!176545))

(assert (=> b!147106 m!176541))

(assert (=> b!147106 m!176313))

(declare-fun m!176547 () Bool)

(assert (=> b!147106 m!176547))

(assert (=> b!147106 m!176309))

(assert (=> b!147103 m!176309))

(assert (=> b!147103 m!176309))

(declare-fun m!176549 () Bool)

(assert (=> b!147103 m!176549))

(assert (=> b!146653 d!46391))

(declare-fun d!46393 () Bool)

(declare-fun e!96011 () Bool)

(assert (=> d!46393 e!96011))

(declare-fun res!69881 () Bool)

(assert (=> d!46393 (=> (not res!69881) (not e!96011))))

(declare-fun lt!77486 () ListLongMap!1755)

(assert (=> d!46393 (= res!69881 (contains!941 lt!77486 (_1!1382 lt!77057)))))

(declare-fun lt!77483 () List!1780)

(assert (=> d!46393 (= lt!77486 (ListLongMap!1756 lt!77483))))

(declare-fun lt!77485 () Unit!4636)

(declare-fun lt!77484 () Unit!4636)

(assert (=> d!46393 (= lt!77485 lt!77484)))

(assert (=> d!46393 (= (getValueByKey!179 lt!77483 (_1!1382 lt!77057)) (Some!184 (_2!1382 lt!77057)))))

(assert (=> d!46393 (= lt!77484 (lemmaContainsTupThenGetReturnValue!95 lt!77483 (_1!1382 lt!77057) (_2!1382 lt!77057)))))

(assert (=> d!46393 (= lt!77483 (insertStrictlySorted!98 (toList!893 (+!175 lt!77050 lt!77066)) (_1!1382 lt!77057) (_2!1382 lt!77057)))))

(assert (=> d!46393 (= (+!175 (+!175 lt!77050 lt!77066) lt!77057) lt!77486)))

(declare-fun b!147109 () Bool)

(declare-fun res!69882 () Bool)

(assert (=> b!147109 (=> (not res!69882) (not e!96011))))

(assert (=> b!147109 (= res!69882 (= (getValueByKey!179 (toList!893 lt!77486) (_1!1382 lt!77057)) (Some!184 (_2!1382 lt!77057))))))

(declare-fun b!147110 () Bool)

(assert (=> b!147110 (= e!96011 (contains!943 (toList!893 lt!77486) lt!77057))))

(assert (= (and d!46393 res!69881) b!147109))

(assert (= (and b!147109 res!69882) b!147110))

(declare-fun m!176551 () Bool)

(assert (=> d!46393 m!176551))

(declare-fun m!176553 () Bool)

(assert (=> d!46393 m!176553))

(declare-fun m!176555 () Bool)

(assert (=> d!46393 m!176555))

(declare-fun m!176557 () Bool)

(assert (=> d!46393 m!176557))

(declare-fun m!176559 () Bool)

(assert (=> b!147109 m!176559))

(declare-fun m!176561 () Bool)

(assert (=> b!147110 m!176561))

(assert (=> b!146653 d!46393))

(declare-fun d!46395 () Bool)

(declare-fun e!96012 () Bool)

(assert (=> d!46395 e!96012))

(declare-fun res!69883 () Bool)

(assert (=> d!46395 (=> (not res!69883) (not e!96012))))

(declare-fun lt!77490 () ListLongMap!1755)

(assert (=> d!46395 (= res!69883 (contains!941 lt!77490 (_1!1382 lt!77057)))))

(declare-fun lt!77487 () List!1780)

(assert (=> d!46395 (= lt!77490 (ListLongMap!1756 lt!77487))))

(declare-fun lt!77489 () Unit!4636)

(declare-fun lt!77488 () Unit!4636)

(assert (=> d!46395 (= lt!77489 lt!77488)))

(assert (=> d!46395 (= (getValueByKey!179 lt!77487 (_1!1382 lt!77057)) (Some!184 (_2!1382 lt!77057)))))

(assert (=> d!46395 (= lt!77488 (lemmaContainsTupThenGetReturnValue!95 lt!77487 (_1!1382 lt!77057) (_2!1382 lt!77057)))))

(assert (=> d!46395 (= lt!77487 (insertStrictlySorted!98 (toList!893 lt!77050) (_1!1382 lt!77057) (_2!1382 lt!77057)))))

(assert (=> d!46395 (= (+!175 lt!77050 lt!77057) lt!77490)))

(declare-fun b!147111 () Bool)

(declare-fun res!69884 () Bool)

(assert (=> b!147111 (=> (not res!69884) (not e!96012))))

(assert (=> b!147111 (= res!69884 (= (getValueByKey!179 (toList!893 lt!77490) (_1!1382 lt!77057)) (Some!184 (_2!1382 lt!77057))))))

(declare-fun b!147112 () Bool)

(assert (=> b!147112 (= e!96012 (contains!943 (toList!893 lt!77490) lt!77057))))

(assert (= (and d!46395 res!69883) b!147111))

(assert (= (and b!147111 res!69884) b!147112))

(declare-fun m!176563 () Bool)

(assert (=> d!46395 m!176563))

(declare-fun m!176565 () Bool)

(assert (=> d!46395 m!176565))

(declare-fun m!176567 () Bool)

(assert (=> d!46395 m!176567))

(declare-fun m!176569 () Bool)

(assert (=> d!46395 m!176569))

(declare-fun m!176571 () Bool)

(assert (=> b!147111 m!176571))

(declare-fun m!176573 () Bool)

(assert (=> b!147112 m!176573))

(assert (=> b!146653 d!46395))

(declare-fun d!46397 () Bool)

(declare-fun e!96013 () Bool)

(assert (=> d!46397 e!96013))

(declare-fun res!69885 () Bool)

(assert (=> d!46397 (=> (not res!69885) (not e!96013))))

(declare-fun lt!77494 () ListLongMap!1755)

(assert (=> d!46397 (= res!69885 (contains!941 lt!77494 (_1!1382 lt!77057)))))

(declare-fun lt!77491 () List!1780)

(assert (=> d!46397 (= lt!77494 (ListLongMap!1756 lt!77491))))

(declare-fun lt!77493 () Unit!4636)

(declare-fun lt!77492 () Unit!4636)

(assert (=> d!46397 (= lt!77493 lt!77492)))

(assert (=> d!46397 (= (getValueByKey!179 lt!77491 (_1!1382 lt!77057)) (Some!184 (_2!1382 lt!77057)))))

(assert (=> d!46397 (= lt!77492 (lemmaContainsTupThenGetReturnValue!95 lt!77491 (_1!1382 lt!77057) (_2!1382 lt!77057)))))

(assert (=> d!46397 (= lt!77491 (insertStrictlySorted!98 (toList!893 lt!77067) (_1!1382 lt!77057) (_2!1382 lt!77057)))))

(assert (=> d!46397 (= (+!175 lt!77067 lt!77057) lt!77494)))

(declare-fun b!147113 () Bool)

(declare-fun res!69886 () Bool)

(assert (=> b!147113 (=> (not res!69886) (not e!96013))))

(assert (=> b!147113 (= res!69886 (= (getValueByKey!179 (toList!893 lt!77494) (_1!1382 lt!77057)) (Some!184 (_2!1382 lt!77057))))))

(declare-fun b!147114 () Bool)

(assert (=> b!147114 (= e!96013 (contains!943 (toList!893 lt!77494) lt!77057))))

(assert (= (and d!46397 res!69885) b!147113))

(assert (= (and b!147113 res!69886) b!147114))

(declare-fun m!176575 () Bool)

(assert (=> d!46397 m!176575))

(declare-fun m!176577 () Bool)

(assert (=> d!46397 m!176577))

(declare-fun m!176579 () Bool)

(assert (=> d!46397 m!176579))

(declare-fun m!176581 () Bool)

(assert (=> d!46397 m!176581))

(declare-fun m!176583 () Bool)

(assert (=> b!147113 m!176583))

(declare-fun m!176585 () Bool)

(assert (=> b!147114 m!176585))

(assert (=> b!146653 d!46397))

(declare-fun b!147115 () Bool)

(declare-fun e!96016 () ListLongMap!1755)

(declare-fun call!16483 () ListLongMap!1755)

(assert (=> b!147115 (= e!96016 call!16483)))

(declare-fun b!147116 () Bool)

(declare-fun e!96015 () ListLongMap!1755)

(declare-fun call!16481 () ListLongMap!1755)

(assert (=> b!147116 (= e!96015 call!16481)))

(declare-fun b!147117 () Bool)

(assert (=> b!147117 (= e!96015 call!16483)))

(declare-fun d!46399 () Bool)

(declare-fun e!96025 () Bool)

(assert (=> d!46399 e!96025))

(declare-fun res!69890 () Bool)

(assert (=> d!46399 (=> (not res!69890) (not e!96025))))

(assert (=> d!46399 (= res!69890 (or (bvsge from!355 (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))))

(declare-fun lt!77508 () ListLongMap!1755)

(declare-fun lt!77501 () ListLongMap!1755)

(assert (=> d!46399 (= lt!77508 lt!77501)))

(declare-fun lt!77500 () Unit!4636)

(declare-fun e!96020 () Unit!4636)

(assert (=> d!46399 (= lt!77500 e!96020)))

(declare-fun c!27800 () Bool)

(declare-fun e!96026 () Bool)

(assert (=> d!46399 (= c!27800 e!96026)))

(declare-fun res!69894 () Bool)

(assert (=> d!46399 (=> (not res!69894) (not e!96026))))

(assert (=> d!46399 (= res!69894 (bvslt from!355 (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun e!96017 () ListLongMap!1755)

(assert (=> d!46399 (= lt!77501 e!96017)))

(declare-fun c!27801 () Bool)

(assert (=> d!46399 (= c!27801 (and (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46399 (validMask!0 (mask!7397 (v!3356 (underlying!500 thiss!992))))))

(assert (=> d!46399 (= (getCurrentListMap!550 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) from!355 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))) lt!77508)))

(declare-fun bm!16475 () Bool)

(declare-fun call!16482 () ListLongMap!1755)

(assert (=> bm!16475 (= call!16482 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) from!355 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun b!147118 () Bool)

(declare-fun e!96021 () Bool)

(declare-fun e!96023 () Bool)

(assert (=> b!147118 (= e!96021 e!96023)))

(declare-fun res!69891 () Bool)

(declare-fun call!16478 () Bool)

(assert (=> b!147118 (= res!69891 call!16478)))

(assert (=> b!147118 (=> (not res!69891) (not e!96023))))

(declare-fun b!147119 () Bool)

(assert (=> b!147119 (= e!96021 (not call!16478))))

(declare-fun call!16484 () ListLongMap!1755)

(declare-fun bm!16476 () Bool)

(declare-fun c!27803 () Bool)

(declare-fun call!16479 () ListLongMap!1755)

(assert (=> bm!16476 (= call!16479 (+!175 (ite c!27801 call!16482 (ite c!27803 call!16484 call!16481)) (ite (or c!27801 c!27803) (tuple2!2743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))) (tuple2!2743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3356 (underlying!500 thiss!992)))))))))

(declare-fun b!147120 () Bool)

(declare-fun c!27805 () Bool)

(assert (=> b!147120 (= c!27805 (and (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!147120 (= e!96016 e!96015)))

(declare-fun b!147121 () Bool)

(declare-fun res!69893 () Bool)

(assert (=> b!147121 (=> (not res!69893) (not e!96025))))

(declare-fun e!96022 () Bool)

(assert (=> b!147121 (= res!69893 e!96022)))

(declare-fun res!69889 () Bool)

(assert (=> b!147121 (=> res!69889 e!96022)))

(declare-fun e!96024 () Bool)

(assert (=> b!147121 (= res!69889 (not e!96024))))

(declare-fun res!69895 () Bool)

(assert (=> b!147121 (=> (not res!69895) (not e!96024))))

(assert (=> b!147121 (= res!69895 (bvslt from!355 (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun bm!16477 () Bool)

(assert (=> bm!16477 (= call!16484 call!16482)))

(declare-fun b!147122 () Bool)

(assert (=> b!147122 (= e!96017 e!96016)))

(assert (=> b!147122 (= c!27803 (and (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16478 () Bool)

(assert (=> bm!16478 (= call!16483 call!16479)))

(declare-fun b!147123 () Bool)

(assert (=> b!147123 (= e!96025 e!96021)))

(declare-fun c!27802 () Bool)

(assert (=> b!147123 (= c!27802 (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!147124 () Bool)

(declare-fun lt!77504 () Unit!4636)

(assert (=> b!147124 (= e!96020 lt!77504)))

(declare-fun lt!77506 () ListLongMap!1755)

(assert (=> b!147124 (= lt!77506 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) from!355 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun lt!77509 () (_ BitVec 64))

(assert (=> b!147124 (= lt!77509 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77496 () (_ BitVec 64))

(assert (=> b!147124 (= lt!77496 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355))))

(declare-fun lt!77503 () Unit!4636)

(assert (=> b!147124 (= lt!77503 (addStillContains!101 lt!77506 lt!77509 (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) lt!77496))))

(assert (=> b!147124 (contains!941 (+!175 lt!77506 (tuple2!2743 lt!77509 (zeroValue!2863 (v!3356 (underlying!500 thiss!992))))) lt!77496)))

(declare-fun lt!77498 () Unit!4636)

(assert (=> b!147124 (= lt!77498 lt!77503)))

(declare-fun lt!77513 () ListLongMap!1755)

(assert (=> b!147124 (= lt!77513 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) from!355 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun lt!77511 () (_ BitVec 64))

(assert (=> b!147124 (= lt!77511 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77499 () (_ BitVec 64))

(assert (=> b!147124 (= lt!77499 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355))))

(declare-fun lt!77502 () Unit!4636)

(assert (=> b!147124 (= lt!77502 (addApplyDifferent!101 lt!77513 lt!77511 (minValue!2863 (v!3356 (underlying!500 thiss!992))) lt!77499))))

(assert (=> b!147124 (= (apply!125 (+!175 lt!77513 (tuple2!2743 lt!77511 (minValue!2863 (v!3356 (underlying!500 thiss!992))))) lt!77499) (apply!125 lt!77513 lt!77499))))

(declare-fun lt!77514 () Unit!4636)

(assert (=> b!147124 (= lt!77514 lt!77502)))

(declare-fun lt!77507 () ListLongMap!1755)

(assert (=> b!147124 (= lt!77507 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) from!355 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun lt!77495 () (_ BitVec 64))

(assert (=> b!147124 (= lt!77495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77516 () (_ BitVec 64))

(assert (=> b!147124 (= lt!77516 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355))))

(declare-fun lt!77497 () Unit!4636)

(assert (=> b!147124 (= lt!77497 (addApplyDifferent!101 lt!77507 lt!77495 (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) lt!77516))))

(assert (=> b!147124 (= (apply!125 (+!175 lt!77507 (tuple2!2743 lt!77495 (zeroValue!2863 (v!3356 (underlying!500 thiss!992))))) lt!77516) (apply!125 lt!77507 lt!77516))))

(declare-fun lt!77510 () Unit!4636)

(assert (=> b!147124 (= lt!77510 lt!77497)))

(declare-fun lt!77512 () ListLongMap!1755)

(assert (=> b!147124 (= lt!77512 (getCurrentListMapNoExtraKeys!141 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) from!355 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun lt!77515 () (_ BitVec 64))

(assert (=> b!147124 (= lt!77515 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77505 () (_ BitVec 64))

(assert (=> b!147124 (= lt!77505 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355))))

(assert (=> b!147124 (= lt!77504 (addApplyDifferent!101 lt!77512 lt!77515 (minValue!2863 (v!3356 (underlying!500 thiss!992))) lt!77505))))

(assert (=> b!147124 (= (apply!125 (+!175 lt!77512 (tuple2!2743 lt!77515 (minValue!2863 (v!3356 (underlying!500 thiss!992))))) lt!77505) (apply!125 lt!77512 lt!77505))))

(declare-fun b!147125 () Bool)

(declare-fun e!96019 () Bool)

(assert (=> b!147125 (= e!96022 e!96019)))

(declare-fun res!69888 () Bool)

(assert (=> b!147125 (=> (not res!69888) (not e!96019))))

(assert (=> b!147125 (= res!69888 (contains!941 lt!77508 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(assert (=> b!147125 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun b!147126 () Bool)

(declare-fun e!96018 () Bool)

(assert (=> b!147126 (= e!96018 (= (apply!125 lt!77508 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun b!147127 () Bool)

(declare-fun res!69887 () Bool)

(assert (=> b!147127 (=> (not res!69887) (not e!96025))))

(declare-fun e!96014 () Bool)

(assert (=> b!147127 (= res!69887 e!96014)))

(declare-fun c!27804 () Bool)

(assert (=> b!147127 (= c!27804 (not (= (bvand (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!147128 () Bool)

(assert (=> b!147128 (= e!96017 (+!175 call!16479 (tuple2!2743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2863 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun b!147129 () Bool)

(assert (=> b!147129 (= e!96026 (validKeyInArray!0 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(declare-fun b!147130 () Bool)

(declare-fun call!16480 () Bool)

(assert (=> b!147130 (= e!96014 (not call!16480))))

(declare-fun bm!16479 () Bool)

(assert (=> bm!16479 (= call!16480 (contains!941 lt!77508 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!147131 () Bool)

(assert (=> b!147131 (= e!96019 (= (apply!125 lt!77508 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)) (get!1574 (select (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) from!355) (dynLambda!453 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!147131 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2634 (_values!3001 (v!3356 (underlying!500 thiss!992))))))))

(assert (=> b!147131 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992))))))))

(declare-fun b!147132 () Bool)

(assert (=> b!147132 (= e!96014 e!96018)))

(declare-fun res!69892 () Bool)

(assert (=> b!147132 (= res!69892 call!16480)))

(assert (=> b!147132 (=> (not res!69892) (not e!96018))))

(declare-fun b!147133 () Bool)

(declare-fun Unit!4650 () Unit!4636)

(assert (=> b!147133 (= e!96020 Unit!4650)))

(declare-fun bm!16480 () Bool)

(assert (=> bm!16480 (= call!16478 (contains!941 lt!77508 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!147134 () Bool)

(assert (=> b!147134 (= e!96024 (validKeyInArray!0 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(declare-fun b!147135 () Bool)

(assert (=> b!147135 (= e!96023 (= (apply!125 lt!77508 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2863 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun bm!16481 () Bool)

(assert (=> bm!16481 (= call!16481 call!16484)))

(assert (= (and d!46399 c!27801) b!147128))

(assert (= (and d!46399 (not c!27801)) b!147122))

(assert (= (and b!147122 c!27803) b!147115))

(assert (= (and b!147122 (not c!27803)) b!147120))

(assert (= (and b!147120 c!27805) b!147117))

(assert (= (and b!147120 (not c!27805)) b!147116))

(assert (= (or b!147117 b!147116) bm!16481))

(assert (= (or b!147115 bm!16481) bm!16477))

(assert (= (or b!147115 b!147117) bm!16478))

(assert (= (or b!147128 bm!16477) bm!16475))

(assert (= (or b!147128 bm!16478) bm!16476))

(assert (= (and d!46399 res!69894) b!147129))

(assert (= (and d!46399 c!27800) b!147124))

(assert (= (and d!46399 (not c!27800)) b!147133))

(assert (= (and d!46399 res!69890) b!147121))

(assert (= (and b!147121 res!69895) b!147134))

(assert (= (and b!147121 (not res!69889)) b!147125))

(assert (= (and b!147125 res!69888) b!147131))

(assert (= (and b!147121 res!69893) b!147127))

(assert (= (and b!147127 c!27804) b!147132))

(assert (= (and b!147127 (not c!27804)) b!147130))

(assert (= (and b!147132 res!69892) b!147126))

(assert (= (or b!147132 b!147130) bm!16479))

(assert (= (and b!147127 res!69887) b!147123))

(assert (= (and b!147123 c!27802) b!147118))

(assert (= (and b!147123 (not c!27802)) b!147119))

(assert (= (and b!147118 res!69891) b!147135))

(assert (= (or b!147118 b!147119) bm!16480))

(declare-fun b_lambda!6565 () Bool)

(assert (=> (not b_lambda!6565) (not b!147131)))

(assert (=> b!147131 t!6485))

(declare-fun b_and!9205 () Bool)

(assert (= b_and!9201 (and (=> t!6485 result!4363) b_and!9205)))

(assert (=> b!147131 t!6487))

(declare-fun b_and!9207 () Bool)

(assert (= b_and!9203 (and (=> t!6487 result!4367) b_and!9207)))

(declare-fun m!176587 () Bool)

(assert (=> b!147128 m!176587))

(assert (=> b!147129 m!176091))

(assert (=> b!147129 m!176091))

(assert (=> b!147129 m!176423))

(declare-fun m!176589 () Bool)

(assert (=> bm!16475 m!176589))

(assert (=> b!147131 m!176135))

(assert (=> b!147131 m!176137))

(assert (=> b!147131 m!176139))

(assert (=> b!147131 m!176091))

(assert (=> b!147131 m!176135))

(assert (=> b!147131 m!176137))

(assert (=> b!147131 m!176091))

(declare-fun m!176591 () Bool)

(assert (=> b!147131 m!176591))

(declare-fun m!176593 () Bool)

(assert (=> b!147126 m!176593))

(declare-fun m!176595 () Bool)

(assert (=> bm!16476 m!176595))

(assert (=> b!147125 m!176091))

(assert (=> b!147125 m!176091))

(declare-fun m!176597 () Bool)

(assert (=> b!147125 m!176597))

(declare-fun m!176599 () Bool)

(assert (=> b!147135 m!176599))

(declare-fun m!176601 () Bool)

(assert (=> bm!16479 m!176601))

(assert (=> d!46399 m!176329))

(assert (=> b!147134 m!176091))

(assert (=> b!147134 m!176091))

(assert (=> b!147134 m!176423))

(declare-fun m!176603 () Bool)

(assert (=> bm!16480 m!176603))

(declare-fun m!176605 () Bool)

(assert (=> b!147124 m!176605))

(declare-fun m!176607 () Bool)

(assert (=> b!147124 m!176607))

(assert (=> b!147124 m!176589))

(declare-fun m!176609 () Bool)

(assert (=> b!147124 m!176609))

(declare-fun m!176611 () Bool)

(assert (=> b!147124 m!176611))

(assert (=> b!147124 m!176607))

(declare-fun m!176613 () Bool)

(assert (=> b!147124 m!176613))

(declare-fun m!176615 () Bool)

(assert (=> b!147124 m!176615))

(declare-fun m!176617 () Bool)

(assert (=> b!147124 m!176617))

(declare-fun m!176619 () Bool)

(assert (=> b!147124 m!176619))

(declare-fun m!176621 () Bool)

(assert (=> b!147124 m!176621))

(declare-fun m!176623 () Bool)

(assert (=> b!147124 m!176623))

(declare-fun m!176625 () Bool)

(assert (=> b!147124 m!176625))

(assert (=> b!147124 m!176609))

(declare-fun m!176627 () Bool)

(assert (=> b!147124 m!176627))

(declare-fun m!176629 () Bool)

(assert (=> b!147124 m!176629))

(assert (=> b!147124 m!176091))

(assert (=> b!147124 m!176617))

(declare-fun m!176631 () Bool)

(assert (=> b!147124 m!176631))

(assert (=> b!147124 m!176615))

(declare-fun m!176633 () Bool)

(assert (=> b!147124 m!176633))

(assert (=> b!146653 d!46399))

(declare-fun d!46401 () Bool)

(assert (=> d!46401 (= (+!175 (+!175 lt!77067 (tuple2!2743 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052)) (tuple2!2743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3356 (underlying!500 thiss!992))))) (+!175 (+!175 lt!77067 (tuple2!2743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3356 (underlying!500 thiss!992))))) (tuple2!2743 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052)))))

(declare-fun lt!77517 () Unit!4636)

(assert (=> d!46401 (= lt!77517 (choose!908 lt!77067 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))))))

(assert (=> d!46401 (not (= (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46401 (= (addCommutativeForDiffKeys!68 lt!77067 (select (arr!2356 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) from!355) lt!77052 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2863 (v!3356 (underlying!500 thiss!992)))) lt!77517)))

(declare-fun bs!6134 () Bool)

(assert (= bs!6134 d!46401))

(declare-fun m!176635 () Bool)

(assert (=> bs!6134 m!176635))

(assert (=> bs!6134 m!176635))

(declare-fun m!176637 () Bool)

(assert (=> bs!6134 m!176637))

(declare-fun m!176639 () Bool)

(assert (=> bs!6134 m!176639))

(declare-fun m!176641 () Bool)

(assert (=> bs!6134 m!176641))

(assert (=> bs!6134 m!176091))

(declare-fun m!176643 () Bool)

(assert (=> bs!6134 m!176643))

(assert (=> bs!6134 m!176639))

(assert (=> b!146653 d!46401))

(declare-fun d!46403 () Bool)

(declare-fun e!96027 () Bool)

(assert (=> d!46403 e!96027))

(declare-fun res!69896 () Bool)

(assert (=> d!46403 (=> (not res!69896) (not e!96027))))

(declare-fun lt!77521 () ListLongMap!1755)

(assert (=> d!46403 (= res!69896 (contains!941 lt!77521 (_1!1382 lt!77066)))))

(declare-fun lt!77518 () List!1780)

(assert (=> d!46403 (= lt!77521 (ListLongMap!1756 lt!77518))))

(declare-fun lt!77520 () Unit!4636)

(declare-fun lt!77519 () Unit!4636)

(assert (=> d!46403 (= lt!77520 lt!77519)))

(assert (=> d!46403 (= (getValueByKey!179 lt!77518 (_1!1382 lt!77066)) (Some!184 (_2!1382 lt!77066)))))

(assert (=> d!46403 (= lt!77519 (lemmaContainsTupThenGetReturnValue!95 lt!77518 (_1!1382 lt!77066) (_2!1382 lt!77066)))))

(assert (=> d!46403 (= lt!77518 (insertStrictlySorted!98 (toList!893 lt!77061) (_1!1382 lt!77066) (_2!1382 lt!77066)))))

(assert (=> d!46403 (= (+!175 lt!77061 lt!77066) lt!77521)))

(declare-fun b!147136 () Bool)

(declare-fun res!69897 () Bool)

(assert (=> b!147136 (=> (not res!69897) (not e!96027))))

(assert (=> b!147136 (= res!69897 (= (getValueByKey!179 (toList!893 lt!77521) (_1!1382 lt!77066)) (Some!184 (_2!1382 lt!77066))))))

(declare-fun b!147137 () Bool)

(assert (=> b!147137 (= e!96027 (contains!943 (toList!893 lt!77521) lt!77066))))

(assert (= (and d!46403 res!69896) b!147136))

(assert (= (and b!147136 res!69897) b!147137))

(declare-fun m!176645 () Bool)

(assert (=> d!46403 m!176645))

(declare-fun m!176647 () Bool)

(assert (=> d!46403 m!176647))

(declare-fun m!176649 () Bool)

(assert (=> d!46403 m!176649))

(declare-fun m!176651 () Bool)

(assert (=> d!46403 m!176651))

(declare-fun m!176653 () Bool)

(assert (=> b!147136 m!176653))

(declare-fun m!176655 () Bool)

(assert (=> b!147137 m!176655))

(assert (=> b!146653 d!46403))

(declare-fun d!46405 () Bool)

(declare-fun e!96028 () Bool)

(assert (=> d!46405 e!96028))

(declare-fun res!69898 () Bool)

(assert (=> d!46405 (=> (not res!69898) (not e!96028))))

(declare-fun lt!77525 () ListLongMap!1755)

(assert (=> d!46405 (= res!69898 (contains!941 lt!77525 (_1!1382 lt!77062)))))

(declare-fun lt!77522 () List!1780)

(assert (=> d!46405 (= lt!77525 (ListLongMap!1756 lt!77522))))

(declare-fun lt!77524 () Unit!4636)

(declare-fun lt!77523 () Unit!4636)

(assert (=> d!46405 (= lt!77524 lt!77523)))

(assert (=> d!46405 (= (getValueByKey!179 lt!77522 (_1!1382 lt!77062)) (Some!184 (_2!1382 lt!77062)))))

(assert (=> d!46405 (= lt!77523 (lemmaContainsTupThenGetReturnValue!95 lt!77522 (_1!1382 lt!77062) (_2!1382 lt!77062)))))

(assert (=> d!46405 (= lt!77522 (insertStrictlySorted!98 (toList!893 lt!77051) (_1!1382 lt!77062) (_2!1382 lt!77062)))))

(assert (=> d!46405 (= (+!175 lt!77051 lt!77062) lt!77525)))

(declare-fun b!147138 () Bool)

(declare-fun res!69899 () Bool)

(assert (=> b!147138 (=> (not res!69899) (not e!96028))))

(assert (=> b!147138 (= res!69899 (= (getValueByKey!179 (toList!893 lt!77525) (_1!1382 lt!77062)) (Some!184 (_2!1382 lt!77062))))))

(declare-fun b!147139 () Bool)

(assert (=> b!147139 (= e!96028 (contains!943 (toList!893 lt!77525) lt!77062))))

(assert (= (and d!46405 res!69898) b!147138))

(assert (= (and b!147138 res!69899) b!147139))

(declare-fun m!176657 () Bool)

(assert (=> d!46405 m!176657))

(declare-fun m!176659 () Bool)

(assert (=> d!46405 m!176659))

(declare-fun m!176661 () Bool)

(assert (=> d!46405 m!176661))

(declare-fun m!176663 () Bool)

(assert (=> d!46405 m!176663))

(declare-fun m!176665 () Bool)

(assert (=> b!147138 m!176665))

(declare-fun m!176667 () Bool)

(assert (=> b!147139 m!176667))

(assert (=> b!146653 d!46405))

(declare-fun d!46407 () Bool)

(assert (=> d!46407 (= (map!1458 (_2!1381 lt!77068)) (getCurrentListMap!550 (_keys!4786 (_2!1381 lt!77068)) (_values!3001 (_2!1381 lt!77068)) (mask!7397 (_2!1381 lt!77068)) (extraKeys!2763 (_2!1381 lt!77068)) (zeroValue!2863 (_2!1381 lt!77068)) (minValue!2863 (_2!1381 lt!77068)) #b00000000000000000000000000000000 (defaultEntry!3018 (_2!1381 lt!77068))))))

(declare-fun bs!6135 () Bool)

(assert (= bs!6135 d!46407))

(declare-fun m!176669 () Bool)

(assert (=> bs!6135 m!176669))

(assert (=> b!146653 d!46407))

(declare-fun d!46409 () Bool)

(declare-fun e!96029 () Bool)

(assert (=> d!46409 e!96029))

(declare-fun res!69900 () Bool)

(assert (=> d!46409 (=> (not res!69900) (not e!96029))))

(declare-fun lt!77529 () ListLongMap!1755)

(assert (=> d!46409 (= res!69900 (contains!941 lt!77529 (_1!1382 lt!77066)))))

(declare-fun lt!77526 () List!1780)

(assert (=> d!46409 (= lt!77529 (ListLongMap!1756 lt!77526))))

(declare-fun lt!77528 () Unit!4636)

(declare-fun lt!77527 () Unit!4636)

(assert (=> d!46409 (= lt!77528 lt!77527)))

(assert (=> d!46409 (= (getValueByKey!179 lt!77526 (_1!1382 lt!77066)) (Some!184 (_2!1382 lt!77066)))))

(assert (=> d!46409 (= lt!77527 (lemmaContainsTupThenGetReturnValue!95 lt!77526 (_1!1382 lt!77066) (_2!1382 lt!77066)))))

(assert (=> d!46409 (= lt!77526 (insertStrictlySorted!98 (toList!893 lt!77050) (_1!1382 lt!77066) (_2!1382 lt!77066)))))

(assert (=> d!46409 (= (+!175 lt!77050 lt!77066) lt!77529)))

(declare-fun b!147140 () Bool)

(declare-fun res!69901 () Bool)

(assert (=> b!147140 (=> (not res!69901) (not e!96029))))

(assert (=> b!147140 (= res!69901 (= (getValueByKey!179 (toList!893 lt!77529) (_1!1382 lt!77066)) (Some!184 (_2!1382 lt!77066))))))

(declare-fun b!147141 () Bool)

(assert (=> b!147141 (= e!96029 (contains!943 (toList!893 lt!77529) lt!77066))))

(assert (= (and d!46409 res!69900) b!147140))

(assert (= (and b!147140 res!69901) b!147141))

(declare-fun m!176671 () Bool)

(assert (=> d!46409 m!176671))

(declare-fun m!176673 () Bool)

(assert (=> d!46409 m!176673))

(declare-fun m!176675 () Bool)

(assert (=> d!46409 m!176675))

(declare-fun m!176677 () Bool)

(assert (=> d!46409 m!176677))

(declare-fun m!176679 () Bool)

(assert (=> b!147140 m!176679))

(declare-fun m!176681 () Bool)

(assert (=> b!147141 m!176681))

(assert (=> b!146653 d!46409))

(declare-fun d!46411 () Bool)

(assert (=> d!46411 (= (array_inv!1511 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) (bvsge (size!2633 (_keys!4786 (v!3356 (underlying!500 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!146646 d!46411))

(declare-fun d!46413 () Bool)

(assert (=> d!46413 (= (array_inv!1512 (_values!3001 (v!3356 (underlying!500 thiss!992)))) (bvsge (size!2634 (_values!3001 (v!3356 (underlying!500 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!146646 d!46413))

(declare-fun d!46415 () Bool)

(declare-fun c!27808 () Bool)

(assert (=> d!46415 (= c!27808 ((_ is ValueCellFull!1148) (select (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) from!355)))))

(declare-fun e!96032 () V!3625)

(assert (=> d!46415 (= (get!1574 (select (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) from!355) (dynLambda!453 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!96032)))

(declare-fun b!147146 () Bool)

(declare-fun get!1576 (ValueCell!1148 V!3625) V!3625)

(assert (=> b!147146 (= e!96032 (get!1576 (select (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) from!355) (dynLambda!453 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!147147 () Bool)

(declare-fun get!1577 (ValueCell!1148 V!3625) V!3625)

(assert (=> b!147147 (= e!96032 (get!1577 (select (arr!2357 (_values!3001 (v!3356 (underlying!500 thiss!992)))) from!355) (dynLambda!453 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46415 c!27808) b!147146))

(assert (= (and d!46415 (not c!27808)) b!147147))

(assert (=> b!147146 m!176135))

(assert (=> b!147146 m!176137))

(declare-fun m!176683 () Bool)

(assert (=> b!147146 m!176683))

(assert (=> b!147147 m!176135))

(assert (=> b!147147 m!176137))

(declare-fun m!176685 () Bool)

(assert (=> b!147147 m!176685))

(assert (=> b!146639 d!46415))

(declare-fun d!46417 () Bool)

(assert (=> d!46417 (= (map!1458 (_2!1381 lt!77056)) (getCurrentListMap!550 (_keys!4786 (_2!1381 lt!77056)) (_values!3001 (_2!1381 lt!77056)) (mask!7397 (_2!1381 lt!77056)) (extraKeys!2763 (_2!1381 lt!77056)) (zeroValue!2863 (_2!1381 lt!77056)) (minValue!2863 (_2!1381 lt!77056)) #b00000000000000000000000000000000 (defaultEntry!3018 (_2!1381 lt!77056))))))

(declare-fun bs!6136 () Bool)

(assert (= bs!6136 d!46417))

(declare-fun m!176687 () Bool)

(assert (=> bs!6136 m!176687))

(assert (=> b!146648 d!46417))

(declare-fun d!46419 () Bool)

(assert (=> d!46419 (= (map!1458 (v!3356 (underlying!500 thiss!992))) (getCurrentListMap!550 (_keys!4786 (v!3356 (underlying!500 thiss!992))) (_values!3001 (v!3356 (underlying!500 thiss!992))) (mask!7397 (v!3356 (underlying!500 thiss!992))) (extraKeys!2763 (v!3356 (underlying!500 thiss!992))) (zeroValue!2863 (v!3356 (underlying!500 thiss!992))) (minValue!2863 (v!3356 (underlying!500 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3018 (v!3356 (underlying!500 thiss!992)))))))

(declare-fun bs!6137 () Bool)

(assert (= bs!6137 d!46419))

(declare-fun m!176689 () Bool)

(assert (=> bs!6137 m!176689))

(assert (=> b!146648 d!46419))

(declare-fun mapIsEmpty!5037 () Bool)

(declare-fun mapRes!5037 () Bool)

(assert (=> mapIsEmpty!5037 mapRes!5037))

(declare-fun b!147155 () Bool)

(declare-fun e!96038 () Bool)

(assert (=> b!147155 (= e!96038 tp_is_empty!2983)))

(declare-fun b!147154 () Bool)

(declare-fun e!96037 () Bool)

(assert (=> b!147154 (= e!96037 tp_is_empty!2983)))

(declare-fun mapNonEmpty!5037 () Bool)

(declare-fun tp!11931 () Bool)

(assert (=> mapNonEmpty!5037 (= mapRes!5037 (and tp!11931 e!96037))))

(declare-fun mapKey!5037 () (_ BitVec 32))

(declare-fun mapValue!5037 () ValueCell!1148)

(declare-fun mapRest!5037 () (Array (_ BitVec 32) ValueCell!1148))

(assert (=> mapNonEmpty!5037 (= mapRest!5021 (store mapRest!5037 mapKey!5037 mapValue!5037))))

(declare-fun condMapEmpty!5037 () Bool)

(declare-fun mapDefault!5037 () ValueCell!1148)

(assert (=> mapNonEmpty!5021 (= condMapEmpty!5037 (= mapRest!5021 ((as const (Array (_ BitVec 32) ValueCell!1148)) mapDefault!5037)))))

(assert (=> mapNonEmpty!5021 (= tp!11903 (and e!96038 mapRes!5037))))

(assert (= (and mapNonEmpty!5021 condMapEmpty!5037) mapIsEmpty!5037))

(assert (= (and mapNonEmpty!5021 (not condMapEmpty!5037)) mapNonEmpty!5037))

(assert (= (and mapNonEmpty!5037 ((_ is ValueCellFull!1148) mapValue!5037)) b!147154))

(assert (= (and mapNonEmpty!5021 ((_ is ValueCellFull!1148) mapDefault!5037)) b!147155))

(declare-fun m!176691 () Bool)

(assert (=> mapNonEmpty!5037 m!176691))

(declare-fun mapIsEmpty!5038 () Bool)

(declare-fun mapRes!5038 () Bool)

(assert (=> mapIsEmpty!5038 mapRes!5038))

(declare-fun b!147157 () Bool)

(declare-fun e!96040 () Bool)

(assert (=> b!147157 (= e!96040 tp_is_empty!2983)))

(declare-fun b!147156 () Bool)

(declare-fun e!96039 () Bool)

(assert (=> b!147156 (= e!96039 tp_is_empty!2983)))

(declare-fun mapNonEmpty!5038 () Bool)

(declare-fun tp!11932 () Bool)

(assert (=> mapNonEmpty!5038 (= mapRes!5038 (and tp!11932 e!96039))))

(declare-fun mapKey!5038 () (_ BitVec 32))

(declare-fun mapValue!5038 () ValueCell!1148)

(declare-fun mapRest!5038 () (Array (_ BitVec 32) ValueCell!1148))

(assert (=> mapNonEmpty!5038 (= mapRest!5022 (store mapRest!5038 mapKey!5038 mapValue!5038))))

(declare-fun condMapEmpty!5038 () Bool)

(declare-fun mapDefault!5038 () ValueCell!1148)

(assert (=> mapNonEmpty!5022 (= condMapEmpty!5038 (= mapRest!5022 ((as const (Array (_ BitVec 32) ValueCell!1148)) mapDefault!5038)))))

(assert (=> mapNonEmpty!5022 (= tp!11904 (and e!96040 mapRes!5038))))

(assert (= (and mapNonEmpty!5022 condMapEmpty!5038) mapIsEmpty!5038))

(assert (= (and mapNonEmpty!5022 (not condMapEmpty!5038)) mapNonEmpty!5038))

(assert (= (and mapNonEmpty!5038 ((_ is ValueCellFull!1148) mapValue!5038)) b!147156))

(assert (= (and mapNonEmpty!5022 ((_ is ValueCellFull!1148) mapDefault!5038)) b!147157))

(declare-fun m!176693 () Bool)

(assert (=> mapNonEmpty!5038 m!176693))

(declare-fun b_lambda!6567 () Bool)

(assert (= b_lambda!6561 (or (and b!146646 b_free!3133) (and b!146651 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))))) b_lambda!6567)))

(declare-fun b_lambda!6569 () Bool)

(assert (= b_lambda!6563 (or (and b!146646 b_free!3133) (and b!146651 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))))) b_lambda!6569)))

(declare-fun b_lambda!6571 () Bool)

(assert (= b_lambda!6557 (or (and b!146646 b_free!3133) (and b!146651 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))))) b_lambda!6571)))

(declare-fun b_lambda!6573 () Bool)

(assert (= b_lambda!6559 (or (and b!146646 b_free!3133) (and b!146651 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))))) b_lambda!6573)))

(declare-fun b_lambda!6575 () Bool)

(assert (= b_lambda!6565 (or (and b!146646 b_free!3133) (and b!146651 b_free!3135 (= (defaultEntry!3018 newMap!16) (defaultEntry!3018 (v!3356 (underlying!500 thiss!992))))) b_lambda!6575)))

(check-sat (not b!147097) (not b!147138) (not d!46395) (not d!46401) (not bm!16470) (not b!146846) (not b!146933) (not b!147136) (not bm!16480) (not b!146921) (not d!46383) (not b!147104) (not d!46369) (not b!146904) (not b!146889) (not bm!16385) (not d!46387) (not b!147135) (not d!46403) (not d!46393) (not bm!16458) (not d!46399) (not b!146856) (not b!147139) (not b!147128) (not bm!16356) (not d!46407) (not b!147125) (not b!147099) (not b!146850) (not d!46419) (not b!146937) (not b!147109) (not b!146923) (not b!146936) (not b!147031) (not bm!16388) (not b!146944) (not bm!16352) (not b!147098) (not b!147103) (not bm!16474) (not b_next!3133) (not bm!16452) (not b!147137) (not b!147100) (not bm!16389) (not d!46417) (not d!46385) (not d!46381) (not bm!16386) (not b!147141) (not b!147147) (not b!147134) (not bm!16475) (not b!146946) (not b!147112) (not bm!16390) (not b!146909) (not bm!16391) (not d!46365) (not d!46397) (not bm!16355) (not bm!16465) (not bm!16459) (not mapNonEmpty!5038) (not bm!16479) b_and!9207 (not b!146935) (not bm!16454) (not b!147113) (not b_lambda!6575) (not b!147072) (not d!46377) (not b!146845) (not b_next!3135) (not b_lambda!6573) (not b!147065) (not b_lambda!6571) (not bm!16384) (not bm!16466) (not b!147140) (not d!46391) (not bm!16393) (not b!147124) (not b!146855) (not d!46379) (not bm!16395) (not bm!16462) (not b_lambda!6567) (not b!147066) (not b!147110) (not bm!16396) (not d!46373) (not b_lambda!6555) (not b!147027) (not b!146852) (not bm!16476) (not b!146934) (not d!46409) (not b!147071) (not bm!16399) (not b_lambda!6569) (not b!147106) (not bm!16451) (not bm!16456) (not bm!16394) (not b!147111) (not d!46361) (not b!146896) (not b!146886) (not b!147050) (not b!147126) (not b!147129) (not b!146885) (not bm!16453) (not d!46389) (not bm!16467) (not b!146847) b_and!9205 (not b!147146) (not d!46405) (not b!146932) (not b!146897) (not mapNonEmpty!5037) (not b!147055) (not b!147114) (not b!147105) (not bm!16387) (not d!46363) (not bm!16392) (not bm!16351) (not b!147053) (not b!146849) tp_is_empty!2983 (not b!146925) (not d!46367) (not b!147131))
(check-sat b_and!9205 b_and!9207 (not b_next!3133) (not b_next!3135))
