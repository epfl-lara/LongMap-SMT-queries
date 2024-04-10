; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12844 () Bool)

(assert start!12844)

(declare-fun b!111826 () Bool)

(declare-fun b_free!2573 () Bool)

(declare-fun b_next!2573 () Bool)

(assert (=> b!111826 (= b_free!2573 (not b_next!2573))))

(declare-fun tp!10066 () Bool)

(declare-fun b_and!6875 () Bool)

(assert (=> b!111826 (= tp!10066 b_and!6875)))

(declare-fun b!111832 () Bool)

(declare-fun b_free!2575 () Bool)

(declare-fun b_next!2575 () Bool)

(assert (=> b!111832 (= b_free!2575 (not b_next!2575))))

(declare-fun tp!10067 () Bool)

(declare-fun b_and!6877 () Bool)

(assert (=> b!111832 (= tp!10067 b_and!6877)))

(declare-fun b!111814 () Bool)

(declare-fun e!72716 () Bool)

(declare-datatypes ((V!3251 0))(
  ( (V!3252 (val!1396 Int)) )
))
(declare-datatypes ((array!4403 0))(
  ( (array!4404 (arr!2087 (Array (_ BitVec 32) (_ BitVec 64))) (size!2345 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1008 0))(
  ( (ValueCellFull!1008 (v!2945 V!3251)) (EmptyCell!1008) )
))
(declare-datatypes ((array!4405 0))(
  ( (array!4406 (arr!2088 (Array (_ BitVec 32) ValueCell!1008)) (size!2346 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!924 0))(
  ( (LongMapFixedSize!925 (defaultEntry!2648 Int) (mask!6826 (_ BitVec 32)) (extraKeys!2441 (_ BitVec 32)) (zeroValue!2517 V!3251) (minValue!2517 V!3251) (_size!511 (_ BitVec 32)) (_keys!4366 array!4403) (_values!2631 array!4405) (_vacant!511 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!724 0))(
  ( (Cell!725 (v!2946 LongMapFixedSize!924)) )
))
(declare-datatypes ((LongMap!724 0))(
  ( (LongMap!725 (underlying!373 Cell!724)) )
))
(declare-fun thiss!992 () LongMap!724)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4403 (_ BitVec 32)) Bool)

(assert (=> b!111814 (= e!72716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!111815 () Bool)

(declare-fun e!72710 () Bool)

(declare-fun tp_is_empty!2703 () Bool)

(assert (=> b!111815 (= e!72710 tp_is_empty!2703)))

(declare-fun b!111816 () Bool)

(declare-fun res!55197 () Bool)

(declare-fun e!72703 () Bool)

(assert (=> b!111816 (=> (not res!55197) (not e!72703))))

(declare-fun newMap!16 () LongMapFixedSize!924)

(assert (=> b!111816 (= res!55197 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6826 newMap!16)) (_size!511 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!111817 () Bool)

(declare-fun res!55199 () Bool)

(assert (=> b!111817 (=> (not res!55199) (not e!72703))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!111817 (= res!55199 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun mapNonEmpty!4025 () Bool)

(declare-fun mapRes!4025 () Bool)

(declare-fun tp!10068 () Bool)

(declare-fun e!72709 () Bool)

(assert (=> mapNonEmpty!4025 (= mapRes!4025 (and tp!10068 e!72709))))

(declare-fun mapValue!4025 () ValueCell!1008)

(declare-fun mapKey!4025 () (_ BitVec 32))

(declare-fun mapRest!4026 () (Array (_ BitVec 32) ValueCell!1008))

(assert (=> mapNonEmpty!4025 (= (arr!2088 (_values!2631 newMap!16)) (store mapRest!4026 mapKey!4025 mapValue!4025))))

(declare-fun b!111818 () Bool)

(declare-fun e!72701 () Bool)

(assert (=> b!111818 (= e!72703 e!72701)))

(declare-fun res!55198 () Bool)

(assert (=> b!111818 (=> (not res!55198) (not e!72701))))

(declare-datatypes ((tuple2!2446 0))(
  ( (tuple2!2447 (_1!1234 (_ BitVec 64)) (_2!1234 V!3251)) )
))
(declare-datatypes ((List!1634 0))(
  ( (Nil!1631) (Cons!1630 (h!2230 tuple2!2446) (t!5792 List!1634)) )
))
(declare-datatypes ((ListLongMap!1595 0))(
  ( (ListLongMap!1596 (toList!813 List!1634)) )
))
(declare-fun lt!57725 () ListLongMap!1595)

(declare-fun lt!57729 () ListLongMap!1595)

(assert (=> b!111818 (= res!55198 (= lt!57725 lt!57729))))

(declare-fun map!1302 (LongMapFixedSize!924) ListLongMap!1595)

(assert (=> b!111818 (= lt!57729 (map!1302 newMap!16))))

(declare-fun getCurrentListMap!497 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 32) Int) ListLongMap!1595)

(assert (=> b!111818 (= lt!57725 (getCurrentListMap!497 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!111819 () Bool)

(declare-datatypes ((Unit!3485 0))(
  ( (Unit!3486) )
))
(declare-fun e!72713 () Unit!3485)

(declare-fun Unit!3487 () Unit!3485)

(assert (=> b!111819 (= e!72713 Unit!3487)))

(declare-fun mapNonEmpty!4026 () Bool)

(declare-fun mapRes!4026 () Bool)

(declare-fun tp!10065 () Bool)

(declare-fun e!72711 () Bool)

(assert (=> mapNonEmpty!4026 (= mapRes!4026 (and tp!10065 e!72711))))

(declare-fun mapValue!4026 () ValueCell!1008)

(declare-fun mapKey!4026 () (_ BitVec 32))

(declare-fun mapRest!4025 () (Array (_ BitVec 32) ValueCell!1008))

(assert (=> mapNonEmpty!4026 (= (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (store mapRest!4025 mapKey!4026 mapValue!4026))))

(declare-fun b!111820 () Bool)

(declare-fun e!72714 () Bool)

(assert (=> b!111820 (= e!72714 (not e!72716))))

(declare-fun res!55204 () Bool)

(assert (=> b!111820 (=> res!55204 e!72716)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!111820 (= res!55204 (not (validMask!0 (mask!6826 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun lt!57731 () ListLongMap!1595)

(declare-fun lt!57726 () tuple2!2446)

(declare-fun lt!57733 () tuple2!2446)

(declare-fun +!152 (ListLongMap!1595 tuple2!2446) ListLongMap!1595)

(assert (=> b!111820 (= (+!152 (+!152 lt!57731 lt!57726) lt!57733) (+!152 (+!152 lt!57731 lt!57733) lt!57726))))

(assert (=> b!111820 (= lt!57733 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun lt!57730 () V!3251)

(assert (=> b!111820 (= lt!57726 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))

(declare-fun lt!57724 () Unit!3485)

(declare-fun addCommutativeForDiffKeys!64 (ListLongMap!1595 (_ BitVec 64) V!3251 (_ BitVec 64) V!3251) Unit!3485)

(assert (=> b!111820 (= lt!57724 (addCommutativeForDiffKeys!64 lt!57731 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!118 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 32) Int) ListLongMap!1595)

(assert (=> b!111820 (= lt!57731 (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!111821 () Bool)

(declare-fun res!55201 () Bool)

(assert (=> b!111821 (=> res!55201 e!72716)))

(assert (=> b!111821 (= res!55201 (or (not (= (size!2346 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6826 (v!2946 (underlying!373 thiss!992)))))) (not (= (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (size!2346 (_values!2631 (v!2946 (underlying!373 thiss!992)))))) (bvslt (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!111822 () Bool)

(declare-fun e!72704 () Bool)

(assert (=> b!111822 (= e!72704 tp_is_empty!2703)))

(declare-fun b!111823 () Bool)

(assert (=> b!111823 (= e!72711 tp_is_empty!2703)))

(declare-fun b!111824 () Bool)

(declare-fun e!72706 () Bool)

(assert (=> b!111824 (= e!72706 (and e!72704 mapRes!4025))))

(declare-fun condMapEmpty!4026 () Bool)

(declare-fun mapDefault!4026 () ValueCell!1008)

(assert (=> b!111824 (= condMapEmpty!4026 (= (arr!2088 (_values!2631 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1008)) mapDefault!4026)))))

(declare-fun mapIsEmpty!4025 () Bool)

(assert (=> mapIsEmpty!4025 mapRes!4026))

(declare-fun mapIsEmpty!4026 () Bool)

(assert (=> mapIsEmpty!4026 mapRes!4025))

(declare-fun b!111825 () Bool)

(declare-fun e!72708 () Bool)

(assert (=> b!111825 (= e!72708 e!72714)))

(declare-fun res!55200 () Bool)

(assert (=> b!111825 (=> (not res!55200) (not e!72714))))

(declare-datatypes ((tuple2!2448 0))(
  ( (tuple2!2449 (_1!1235 Bool) (_2!1235 LongMapFixedSize!924)) )
))
(declare-fun lt!57727 () tuple2!2448)

(assert (=> b!111825 (= res!55200 (and (_1!1235 lt!57727) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!57728 () Unit!3485)

(assert (=> b!111825 (= lt!57728 e!72713)))

(declare-fun c!19951 () Bool)

(declare-fun contains!842 (ListLongMap!1595 (_ BitVec 64)) Bool)

(assert (=> b!111825 (= c!19951 (contains!842 lt!57729 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun update!164 (LongMapFixedSize!924 (_ BitVec 64) V!3251) tuple2!2448)

(assert (=> b!111825 (= lt!57727 (update!164 newMap!16 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))

(declare-fun e!72717 () Bool)

(declare-fun e!72705 () Bool)

(declare-fun array_inv!1313 (array!4403) Bool)

(declare-fun array_inv!1314 (array!4405) Bool)

(assert (=> b!111826 (= e!72717 (and tp!10066 tp_is_empty!2703 (array_inv!1313 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (array_inv!1314 (_values!2631 (v!2946 (underlying!373 thiss!992)))) e!72705))))

(declare-fun b!111827 () Bool)

(assert (=> b!111827 (= e!72701 e!72708)))

(declare-fun res!55196 () Bool)

(assert (=> b!111827 (=> (not res!55196) (not e!72708))))

(assert (=> b!111827 (= res!55196 (and (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1353 (ValueCell!1008 V!3251) V!3251)

(declare-fun dynLambda!391 (Int (_ BitVec 64)) V!3251)

(assert (=> b!111827 (= lt!57730 (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!111828 () Bool)

(declare-fun e!72707 () Bool)

(declare-fun e!72700 () Bool)

(assert (=> b!111828 (= e!72707 e!72700)))

(declare-fun b!111829 () Bool)

(declare-fun res!55202 () Bool)

(assert (=> b!111829 (=> (not res!55202) (not e!72703))))

(declare-fun valid!432 (LongMapFixedSize!924) Bool)

(assert (=> b!111829 (= res!55202 (valid!432 newMap!16))))

(declare-fun b!111830 () Bool)

(assert (=> b!111830 (= e!72705 (and e!72710 mapRes!4026))))

(declare-fun condMapEmpty!4025 () Bool)

(declare-fun mapDefault!4025 () ValueCell!1008)

(assert (=> b!111830 (= condMapEmpty!4025 (= (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1008)) mapDefault!4025)))))

(declare-fun b!111831 () Bool)

(assert (=> b!111831 (= e!72709 tp_is_empty!2703)))

(declare-fun e!72712 () Bool)

(assert (=> b!111832 (= e!72712 (and tp!10067 tp_is_empty!2703 (array_inv!1313 (_keys!4366 newMap!16)) (array_inv!1314 (_values!2631 newMap!16)) e!72706))))

(declare-fun b!111833 () Bool)

(declare-fun Unit!3488 () Unit!3485)

(assert (=> b!111833 (= e!72713 Unit!3488)))

(declare-fun lt!57734 () Unit!3485)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!113 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 64) (_ BitVec 32) Int) Unit!3485)

(assert (=> b!111833 (= lt!57734 (lemmaListMapContainsThenArrayContainsFrom!113 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!111833 (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!57732 () Unit!3485)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4403 (_ BitVec 32) (_ BitVec 32)) Unit!3485)

(assert (=> b!111833 (= lt!57732 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1635 0))(
  ( (Nil!1632) (Cons!1631 (h!2231 (_ BitVec 64)) (t!5793 List!1635)) )
))
(declare-fun arrayNoDuplicates!0 (array!4403 (_ BitVec 32) List!1635) Bool)

(assert (=> b!111833 (arrayNoDuplicates!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) from!355 Nil!1632)))

(declare-fun lt!57735 () Unit!3485)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4403 (_ BitVec 32) (_ BitVec 64) List!1635) Unit!3485)

(assert (=> b!111833 (= lt!57735 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (Cons!1631 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1632)))))

(assert (=> b!111833 false))

(declare-fun b!111834 () Bool)

(assert (=> b!111834 (= e!72700 e!72717)))

(declare-fun res!55203 () Bool)

(assert (=> start!12844 (=> (not res!55203) (not e!72703))))

(declare-fun valid!433 (LongMap!724) Bool)

(assert (=> start!12844 (= res!55203 (valid!433 thiss!992))))

(assert (=> start!12844 e!72703))

(assert (=> start!12844 e!72707))

(assert (=> start!12844 true))

(assert (=> start!12844 e!72712))

(assert (= (and start!12844 res!55203) b!111817))

(assert (= (and b!111817 res!55199) b!111829))

(assert (= (and b!111829 res!55202) b!111816))

(assert (= (and b!111816 res!55197) b!111818))

(assert (= (and b!111818 res!55198) b!111827))

(assert (= (and b!111827 res!55196) b!111825))

(assert (= (and b!111825 c!19951) b!111833))

(assert (= (and b!111825 (not c!19951)) b!111819))

(assert (= (and b!111825 res!55200) b!111820))

(assert (= (and b!111820 (not res!55204)) b!111821))

(assert (= (and b!111821 (not res!55201)) b!111814))

(assert (= (and b!111830 condMapEmpty!4025) mapIsEmpty!4025))

(assert (= (and b!111830 (not condMapEmpty!4025)) mapNonEmpty!4026))

(get-info :version)

(assert (= (and mapNonEmpty!4026 ((_ is ValueCellFull!1008) mapValue!4026)) b!111823))

(assert (= (and b!111830 ((_ is ValueCellFull!1008) mapDefault!4025)) b!111815))

(assert (= b!111826 b!111830))

(assert (= b!111834 b!111826))

(assert (= b!111828 b!111834))

(assert (= start!12844 b!111828))

(assert (= (and b!111824 condMapEmpty!4026) mapIsEmpty!4026))

(assert (= (and b!111824 (not condMapEmpty!4026)) mapNonEmpty!4025))

(assert (= (and mapNonEmpty!4025 ((_ is ValueCellFull!1008) mapValue!4025)) b!111831))

(assert (= (and b!111824 ((_ is ValueCellFull!1008) mapDefault!4026)) b!111822))

(assert (= b!111832 b!111824))

(assert (= start!12844 b!111832))

(declare-fun b_lambda!5015 () Bool)

(assert (=> (not b_lambda!5015) (not b!111827)))

(declare-fun t!5789 () Bool)

(declare-fun tb!2121 () Bool)

(assert (=> (and b!111826 (= (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))) t!5789) tb!2121))

(declare-fun result!3551 () Bool)

(assert (=> tb!2121 (= result!3551 tp_is_empty!2703)))

(assert (=> b!111827 t!5789))

(declare-fun b_and!6879 () Bool)

(assert (= b_and!6875 (and (=> t!5789 result!3551) b_and!6879)))

(declare-fun tb!2123 () Bool)

(declare-fun t!5791 () Bool)

(assert (=> (and b!111832 (= (defaultEntry!2648 newMap!16) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))) t!5791) tb!2123))

(declare-fun result!3555 () Bool)

(assert (= result!3555 result!3551))

(assert (=> b!111827 t!5791))

(declare-fun b_and!6881 () Bool)

(assert (= b_and!6877 (and (=> t!5791 result!3555) b_and!6881)))

(declare-fun m!127647 () Bool)

(assert (=> b!111826 m!127647))

(declare-fun m!127649 () Bool)

(assert (=> b!111826 m!127649))

(declare-fun m!127651 () Bool)

(assert (=> b!111825 m!127651))

(assert (=> b!111825 m!127651))

(declare-fun m!127653 () Bool)

(assert (=> b!111825 m!127653))

(assert (=> b!111825 m!127651))

(declare-fun m!127655 () Bool)

(assert (=> b!111825 m!127655))

(declare-fun m!127657 () Bool)

(assert (=> b!111814 m!127657))

(declare-fun m!127659 () Bool)

(assert (=> start!12844 m!127659))

(assert (=> b!111827 m!127651))

(declare-fun m!127661 () Bool)

(assert (=> b!111827 m!127661))

(declare-fun m!127663 () Bool)

(assert (=> b!111827 m!127663))

(assert (=> b!111827 m!127661))

(assert (=> b!111827 m!127663))

(declare-fun m!127665 () Bool)

(assert (=> b!111827 m!127665))

(declare-fun m!127667 () Bool)

(assert (=> mapNonEmpty!4025 m!127667))

(declare-fun m!127669 () Bool)

(assert (=> b!111829 m!127669))

(declare-fun m!127671 () Bool)

(assert (=> b!111818 m!127671))

(declare-fun m!127673 () Bool)

(assert (=> b!111818 m!127673))

(declare-fun m!127675 () Bool)

(assert (=> b!111833 m!127675))

(declare-fun m!127677 () Bool)

(assert (=> b!111833 m!127677))

(assert (=> b!111833 m!127651))

(declare-fun m!127679 () Bool)

(assert (=> b!111833 m!127679))

(assert (=> b!111833 m!127651))

(assert (=> b!111833 m!127651))

(declare-fun m!127681 () Bool)

(assert (=> b!111833 m!127681))

(assert (=> b!111833 m!127651))

(declare-fun m!127683 () Bool)

(assert (=> b!111833 m!127683))

(declare-fun m!127685 () Bool)

(assert (=> mapNonEmpty!4026 m!127685))

(declare-fun m!127687 () Bool)

(assert (=> b!111832 m!127687))

(declare-fun m!127689 () Bool)

(assert (=> b!111832 m!127689))

(declare-fun m!127691 () Bool)

(assert (=> b!111820 m!127691))

(declare-fun m!127693 () Bool)

(assert (=> b!111820 m!127693))

(assert (=> b!111820 m!127691))

(declare-fun m!127695 () Bool)

(assert (=> b!111820 m!127695))

(assert (=> b!111820 m!127651))

(declare-fun m!127697 () Bool)

(assert (=> b!111820 m!127697))

(assert (=> b!111820 m!127651))

(declare-fun m!127699 () Bool)

(assert (=> b!111820 m!127699))

(declare-fun m!127701 () Bool)

(assert (=> b!111820 m!127701))

(assert (=> b!111820 m!127699))

(declare-fun m!127703 () Bool)

(assert (=> b!111820 m!127703))

(check-sat (not b!111826) (not mapNonEmpty!4026) (not start!12844) (not b!111825) (not b!111833) (not b_lambda!5015) (not b!111827) (not b!111818) b_and!6879 (not b!111832) (not mapNonEmpty!4025) (not b_next!2573) (not b_next!2575) (not b!111820) (not b!111814) b_and!6881 tp_is_empty!2703 (not b!111829))
(check-sat b_and!6879 b_and!6881 (not b_next!2573) (not b_next!2575))
(get-model)

(declare-fun b_lambda!5019 () Bool)

(assert (= b_lambda!5015 (or (and b!111826 b_free!2573) (and b!111832 b_free!2575 (= (defaultEntry!2648 newMap!16) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))))) b_lambda!5019)))

(check-sat (not b!111826) (not mapNonEmpty!4026) (not start!12844) (not b!111825) (not b!111833) (not b!111827) (not b!111818) b_and!6879 (not b!111832) (not mapNonEmpty!4025) (not b_next!2573) (not b_next!2575) (not b!111820) (not b_lambda!5019) (not b!111814) b_and!6881 tp_is_empty!2703 (not b!111829))
(check-sat b_and!6879 b_and!6881 (not b_next!2573) (not b_next!2575))
(get-model)

(declare-fun d!31837 () Bool)

(declare-fun e!72776 () Bool)

(assert (=> d!31837 e!72776))

(declare-fun res!55234 () Bool)

(assert (=> d!31837 (=> res!55234 e!72776)))

(declare-fun lt!57780 () Bool)

(assert (=> d!31837 (= res!55234 (not lt!57780))))

(declare-fun lt!57781 () Bool)

(assert (=> d!31837 (= lt!57780 lt!57781)))

(declare-fun lt!57782 () Unit!3485)

(declare-fun e!72777 () Unit!3485)

(assert (=> d!31837 (= lt!57782 e!72777)))

(declare-fun c!19957 () Bool)

(assert (=> d!31837 (= c!19957 lt!57781)))

(declare-fun containsKey!163 (List!1634 (_ BitVec 64)) Bool)

(assert (=> d!31837 (= lt!57781 (containsKey!163 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!31837 (= (contains!842 lt!57729 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) lt!57780)))

(declare-fun b!111908 () Bool)

(declare-fun lt!57783 () Unit!3485)

(assert (=> b!111908 (= e!72777 lt!57783)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!111 (List!1634 (_ BitVec 64)) Unit!3485)

(assert (=> b!111908 (= lt!57783 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-datatypes ((Option!165 0))(
  ( (Some!164 (v!2950 V!3251)) (None!163) )
))
(declare-fun isDefined!112 (Option!165) Bool)

(declare-fun getValueByKey!159 (List!1634 (_ BitVec 64)) Option!165)

(assert (=> b!111908 (isDefined!112 (getValueByKey!159 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!111909 () Bool)

(declare-fun Unit!3493 () Unit!3485)

(assert (=> b!111909 (= e!72777 Unit!3493)))

(declare-fun b!111910 () Bool)

(assert (=> b!111910 (= e!72776 (isDefined!112 (getValueByKey!159 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (= (and d!31837 c!19957) b!111908))

(assert (= (and d!31837 (not c!19957)) b!111909))

(assert (= (and d!31837 (not res!55234)) b!111910))

(assert (=> d!31837 m!127651))

(declare-fun m!127763 () Bool)

(assert (=> d!31837 m!127763))

(assert (=> b!111908 m!127651))

(declare-fun m!127765 () Bool)

(assert (=> b!111908 m!127765))

(assert (=> b!111908 m!127651))

(declare-fun m!127767 () Bool)

(assert (=> b!111908 m!127767))

(assert (=> b!111908 m!127767))

(declare-fun m!127769 () Bool)

(assert (=> b!111908 m!127769))

(assert (=> b!111910 m!127651))

(assert (=> b!111910 m!127767))

(assert (=> b!111910 m!127767))

(assert (=> b!111910 m!127769))

(assert (=> b!111825 d!31837))

(declare-fun bm!11981 () Bool)

(declare-fun call!11984 () Bool)

(declare-fun call!12001 () Bool)

(assert (=> bm!11981 (= call!11984 call!12001)))

(declare-fun b!111995 () Bool)

(declare-fun res!55270 () Bool)

(declare-datatypes ((SeekEntryResult!262 0))(
  ( (MissingZero!262 (index!3199 (_ BitVec 32))) (Found!262 (index!3200 (_ BitVec 32))) (Intermediate!262 (undefined!1074 Bool) (index!3201 (_ BitVec 32)) (x!14094 (_ BitVec 32))) (Undefined!262) (MissingVacant!262 (index!3202 (_ BitVec 32))) )
))
(declare-fun lt!57845 () SeekEntryResult!262)

(assert (=> b!111995 (= res!55270 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3202 lt!57845)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!72835 () Bool)

(assert (=> b!111995 (=> (not res!55270) (not e!72835))))

(declare-fun bm!11982 () Bool)

(declare-fun call!11991 () SeekEntryResult!262)

(declare-fun call!11989 () SeekEntryResult!262)

(assert (=> bm!11982 (= call!11991 call!11989)))

(declare-fun bm!11983 () Bool)

(declare-fun call!12004 () ListLongMap!1595)

(declare-fun call!11986 () ListLongMap!1595)

(assert (=> bm!11983 (= call!12004 call!11986)))

(declare-fun b!111996 () Bool)

(declare-fun lt!57864 () Unit!3485)

(declare-fun lt!57863 () Unit!3485)

(assert (=> b!111996 (= lt!57864 lt!57863)))

(declare-fun call!11998 () ListLongMap!1595)

(declare-fun call!12007 () ListLongMap!1595)

(assert (=> b!111996 (= call!11998 call!12007)))

(declare-fun lt!57847 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!50 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 V!3251 Int) Unit!3485)

(assert (=> b!111996 (= lt!57863 (lemmaChangeLongMinValueKeyThenAddPairToListMap!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) lt!57847 (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) lt!57730 (defaultEntry!2648 newMap!16)))))

(assert (=> b!111996 (= lt!57847 (bvor (extraKeys!2441 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!72836 () tuple2!2448)

(assert (=> b!111996 (= e!72836 (tuple2!2449 true (LongMapFixedSize!925 (defaultEntry!2648 newMap!16) (mask!6826 newMap!16) (bvor (extraKeys!2441 newMap!16) #b00000000000000000000000000000010) (zeroValue!2517 newMap!16) lt!57730 (_size!511 newMap!16) (_keys!4366 newMap!16) (_values!2631 newMap!16) (_vacant!511 newMap!16))))))

(declare-fun b!111997 () Bool)

(declare-fun e!72837 () Bool)

(declare-fun e!72829 () Bool)

(assert (=> b!111997 (= e!72837 e!72829)))

(declare-fun c!19991 () Bool)

(declare-fun lt!57844 () tuple2!2448)

(assert (=> b!111997 (= c!19991 (_1!1235 lt!57844))))

(declare-fun d!31839 () Bool)

(assert (=> d!31839 e!72837))

(declare-fun res!55275 () Bool)

(assert (=> d!31839 (=> (not res!55275) (not e!72837))))

(assert (=> d!31839 (= res!55275 (valid!432 (_2!1235 lt!57844)))))

(declare-fun e!72843 () tuple2!2448)

(assert (=> d!31839 (= lt!57844 e!72843)))

(declare-fun c!19992 () Bool)

(assert (=> d!31839 (= c!19992 (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvneg (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (=> d!31839 (valid!432 newMap!16)))

(assert (=> d!31839 (= (update!164 newMap!16 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730) lt!57844)))

(declare-fun bm!11984 () Bool)

(declare-fun call!12002 () Bool)

(assert (=> bm!11984 (= call!12002 call!12001)))

(declare-fun lt!57856 () SeekEntryResult!262)

(declare-fun c!19994 () Bool)

(declare-fun lt!57854 () SeekEntryResult!262)

(declare-fun c!19997 () Bool)

(declare-fun lt!57839 () SeekEntryResult!262)

(declare-fun c!19989 () Bool)

(declare-fun c!19990 () Bool)

(declare-fun bm!11985 () Bool)

(declare-fun c!19999 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!11985 (= call!12001 (inRange!0 (ite c!19994 (ite c!19999 (index!3200 lt!57856) (ite c!19990 (index!3199 lt!57854) (index!3202 lt!57854))) (ite c!19997 (index!3200 lt!57839) (ite c!19989 (index!3199 lt!57845) (index!3202 lt!57845)))) (mask!6826 newMap!16)))))

(declare-fun b!111998 () Bool)

(declare-fun e!72828 () ListLongMap!1595)

(assert (=> b!111998 (= e!72828 call!11986)))

(declare-fun b!111999 () Bool)

(declare-fun lt!57846 () Unit!3485)

(declare-fun lt!57860 () Unit!3485)

(assert (=> b!111999 (= lt!57846 lt!57860)))

(declare-fun call!11987 () Bool)

(assert (=> b!111999 call!11987))

(declare-fun lt!57840 () SeekEntryResult!262)

(declare-fun lt!57861 () array!4405)

(declare-fun lemmaValidKeyInArrayIsInListMap!111 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 32) Int) Unit!3485)

(assert (=> b!111999 (= lt!57860 (lemmaValidKeyInArrayIsInListMap!111 (_keys!4366 newMap!16) lt!57861 (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (index!3200 lt!57840) (defaultEntry!2648 newMap!16)))))

(assert (=> b!111999 (= lt!57861 (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16))))))

(declare-fun lt!57859 () Unit!3485)

(declare-fun lt!57848 () Unit!3485)

(assert (=> b!111999 (= lt!57859 lt!57848)))

(declare-fun call!11993 () ListLongMap!1595)

(declare-fun call!12005 () ListLongMap!1595)

(assert (=> b!111999 (= call!11993 call!12005)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!50 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 32) (_ BitVec 64) V!3251 Int) Unit!3485)

(assert (=> b!111999 (= lt!57848 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (index!3200 lt!57840) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!57851 () Unit!3485)

(declare-fun e!72822 () Unit!3485)

(assert (=> b!111999 (= lt!57851 e!72822)))

(assert (=> b!111999 (= c!19997 (contains!842 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun e!72826 () tuple2!2448)

(assert (=> b!111999 (= e!72826 (tuple2!2449 true (LongMapFixedSize!925 (defaultEntry!2648 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (_size!511 newMap!16) (_keys!4366 newMap!16) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16))) (_vacant!511 newMap!16))))))

(declare-fun bm!11986 () Bool)

(declare-fun call!11996 () ListLongMap!1595)

(declare-fun c!19988 () Bool)

(assert (=> bm!11986 (= call!11996 (getCurrentListMap!497 (_keys!4366 newMap!16) (ite (or c!19992 c!19994) (_values!2631 newMap!16) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16)))) (mask!6826 newMap!16) (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) (zeroValue!2517 newMap!16) (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun b!112000 () Bool)

(declare-fun res!55266 () Bool)

(declare-fun e!72842 () Bool)

(assert (=> b!112000 (=> (not res!55266) (not e!72842))))

(assert (=> b!112000 (= res!55266 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3199 lt!57845)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!11987 () Bool)

(declare-fun call!12006 () Unit!3485)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 64) Int) Unit!3485)

(assert (=> bm!11987 (= call!12006 (lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2648 newMap!16)))))

(declare-fun bm!11988 () Bool)

(declare-fun c!19993 () Bool)

(declare-fun call!11985 () tuple2!2448)

(declare-fun updateHelperNewKey!50 (LongMapFixedSize!924 (_ BitVec 64) V!3251 (_ BitVec 32)) tuple2!2448)

(assert (=> bm!11988 (= call!11985 (updateHelperNewKey!50 newMap!16 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730 (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840))))))

(declare-fun b!112001 () Bool)

(declare-fun lt!57838 () Unit!3485)

(assert (=> b!112001 (= e!72822 lt!57838)))

(assert (=> b!112001 (= lt!57838 call!12006)))

(assert (=> b!112001 (= lt!57839 call!11991)))

(declare-fun res!55269 () Bool)

(assert (=> b!112001 (= res!55269 ((_ is Found!262) lt!57839))))

(declare-fun e!72834 () Bool)

(assert (=> b!112001 (=> (not res!55269) (not e!72834))))

(assert (=> b!112001 e!72834))

(declare-fun b!112002 () Bool)

(declare-fun lt!57855 () Unit!3485)

(declare-fun e!72824 () Unit!3485)

(assert (=> b!112002 (= lt!57855 e!72824)))

(assert (=> b!112002 (= c!19999 call!11987)))

(declare-fun e!72841 () tuple2!2448)

(assert (=> b!112002 (= e!72841 (tuple2!2449 false newMap!16))))

(declare-fun b!112003 () Bool)

(declare-fun e!72838 () ListLongMap!1595)

(assert (=> b!112003 (= e!72838 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun b!112004 () Bool)

(declare-fun e!72823 () Bool)

(declare-fun e!72830 () Bool)

(assert (=> b!112004 (= e!72823 e!72830)))

(declare-fun res!55265 () Bool)

(declare-fun call!12000 () Bool)

(assert (=> b!112004 (= res!55265 call!12000)))

(assert (=> b!112004 (=> (not res!55265) (not e!72830))))

(declare-fun b!112005 () Bool)

(assert (=> b!112005 (= e!72838 (ite c!19988 call!12007 call!12004))))

(declare-fun b!112006 () Bool)

(declare-fun Unit!3494 () Unit!3485)

(assert (=> b!112006 (= e!72822 Unit!3494)))

(declare-fun lt!57853 () Unit!3485)

(declare-fun call!11992 () Unit!3485)

(assert (=> b!112006 (= lt!57853 call!11992)))

(assert (=> b!112006 (= lt!57845 call!11991)))

(assert (=> b!112006 (= c!19989 ((_ is MissingZero!262) lt!57845))))

(declare-fun e!72832 () Bool)

(assert (=> b!112006 e!72832))

(declare-fun lt!57843 () Unit!3485)

(assert (=> b!112006 (= lt!57843 lt!57853)))

(assert (=> b!112006 false))

(declare-fun bm!11989 () Bool)

(declare-fun call!11999 () Bool)

(declare-fun call!11995 () Bool)

(assert (=> bm!11989 (= call!11999 call!11995)))

(declare-fun b!112007 () Bool)

(declare-fun res!55276 () Bool)

(assert (=> b!112007 (= res!55276 call!11984)))

(assert (=> b!112007 (=> (not res!55276) (not e!72834))))

(declare-fun b!112008 () Bool)

(declare-fun e!72839 () Bool)

(assert (=> b!112008 (= e!72839 e!72835)))

(declare-fun res!55272 () Bool)

(declare-fun call!12003 () Bool)

(assert (=> b!112008 (= res!55272 call!12003)))

(assert (=> b!112008 (=> (not res!55272) (not e!72835))))

(declare-fun b!112009 () Bool)

(assert (=> b!112009 (= e!72843 e!72841)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4403 (_ BitVec 32)) SeekEntryResult!262)

(assert (=> b!112009 (= lt!57840 (seekEntryOrOpen!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4366 newMap!16) (mask!6826 newMap!16)))))

(assert (=> b!112009 (= c!19994 ((_ is Undefined!262) lt!57840))))

(declare-fun b!112010 () Bool)

(declare-fun e!72831 () Bool)

(assert (=> b!112010 (= e!72829 e!72831)))

(declare-fun call!11994 () ListLongMap!1595)

(declare-fun res!55271 () Bool)

(assert (=> b!112010 (= res!55271 (contains!842 call!11994 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> b!112010 (=> (not res!55271) (not e!72831))))

(declare-fun bm!11990 () Bool)

(declare-fun c!19998 () Bool)

(assert (=> bm!11990 (= c!19998 c!19994)))

(assert (=> bm!11990 (= call!11987 (contains!842 e!72828 (ite c!19994 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!57840)))))))

(declare-fun b!112011 () Bool)

(declare-fun call!11990 () ListLongMap!1595)

(assert (=> b!112011 (= e!72829 (= call!11994 call!11990))))

(declare-fun b!112012 () Bool)

(declare-fun Unit!3495 () Unit!3485)

(assert (=> b!112012 (= e!72824 Unit!3495)))

(declare-fun lt!57857 () Unit!3485)

(assert (=> b!112012 (= lt!57857 call!12006)))

(declare-fun call!11988 () SeekEntryResult!262)

(assert (=> b!112012 (= lt!57856 call!11988)))

(declare-fun res!55274 () Bool)

(assert (=> b!112012 (= res!55274 ((_ is Found!262) lt!57856))))

(declare-fun e!72833 () Bool)

(assert (=> b!112012 (=> (not res!55274) (not e!72833))))

(assert (=> b!112012 e!72833))

(declare-fun lt!57842 () Unit!3485)

(assert (=> b!112012 (= lt!57842 lt!57857)))

(assert (=> b!112012 false))

(declare-fun b!112013 () Bool)

(declare-fun c!19996 () Bool)

(assert (=> b!112013 (= c!19996 ((_ is MissingVacant!262) lt!57854))))

(declare-fun e!72840 () Bool)

(assert (=> b!112013 (= e!72840 e!72823)))

(declare-fun b!112014 () Bool)

(declare-fun call!11997 () Bool)

(assert (=> b!112014 (= e!72842 (not call!11997))))

(declare-fun bm!11991 () Bool)

(assert (=> bm!11991 (= call!11994 (map!1302 (_2!1235 lt!57844)))))

(declare-fun b!112015 () Bool)

(assert (=> b!112015 (= e!72831 (= call!11994 (+!152 call!11990 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(declare-fun b!112016 () Bool)

(assert (=> b!112016 (= e!72835 (not call!11997))))

(declare-fun b!112017 () Bool)

(assert (=> b!112017 (= e!72833 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!57856)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun lt!57849 () (_ BitVec 32))

(declare-fun bm!11992 () Bool)

(assert (=> bm!11992 (= call!11986 (getCurrentListMap!497 (_keys!4366 newMap!16) (ite c!19992 (_values!2631 newMap!16) lt!57861) (mask!6826 newMap!16) (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16)) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun b!112018 () Bool)

(declare-fun e!72827 () Bool)

(assert (=> b!112018 (= e!72827 (not call!11999))))

(declare-fun b!112019 () Bool)

(assert (=> b!112019 (= e!72823 ((_ is Undefined!262) lt!57854))))

(declare-fun b!112020 () Bool)

(declare-fun res!55263 () Bool)

(assert (=> b!112020 (=> (not res!55263) (not e!72827))))

(assert (=> b!112020 (= res!55263 call!12000)))

(assert (=> b!112020 (= e!72840 e!72827)))

(declare-fun bm!11993 () Bool)

(assert (=> bm!11993 (= call!12000 call!12002)))

(declare-fun bm!11994 () Bool)

(assert (=> bm!11994 (= call!11995 (arrayContainsKey!0 (_keys!4366 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!11995 () Bool)

(assert (=> bm!11995 (= call!11997 call!11995)))

(declare-fun b!112021 () Bool)

(declare-fun lt!57850 () Unit!3485)

(assert (=> b!112021 (= e!72824 lt!57850)))

(assert (=> b!112021 (= lt!57850 call!11992)))

(assert (=> b!112021 (= lt!57854 call!11988)))

(assert (=> b!112021 (= c!19990 ((_ is MissingZero!262) lt!57854))))

(assert (=> b!112021 e!72840))

(declare-fun bm!11996 () Bool)

(assert (=> bm!11996 (= call!11998 call!11993)))

(declare-fun b!112022 () Bool)

(assert (=> b!112022 (= e!72834 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!57839)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun bm!11997 () Bool)

(assert (=> bm!11997 (= call!12003 call!11984)))

(declare-fun bm!11998 () Bool)

(assert (=> bm!11998 (= call!12005 call!11996)))

(declare-fun bm!11999 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 64) Int) Unit!3485)

(assert (=> bm!11999 (= call!11992 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2648 newMap!16)))))

(declare-fun b!112023 () Bool)

(assert (=> b!112023 (= c!19993 ((_ is MissingVacant!262) lt!57840))))

(declare-fun e!72825 () tuple2!2448)

(assert (=> b!112023 (= e!72841 e!72825)))

(declare-fun bm!12000 () Bool)

(assert (=> bm!12000 (= call!12007 call!11996)))

(declare-fun b!112024 () Bool)

(declare-fun res!55264 () Bool)

(assert (=> b!112024 (=> (not res!55264) (not e!72842))))

(assert (=> b!112024 (= res!55264 call!12003)))

(assert (=> b!112024 (= e!72832 e!72842)))

(declare-fun b!112025 () Bool)

(declare-fun lt!57858 () tuple2!2448)

(assert (=> b!112025 (= lt!57858 call!11985)))

(assert (=> b!112025 (= e!72826 (tuple2!2449 (_1!1235 lt!57858) (_2!1235 lt!57858)))))

(declare-fun b!112026 () Bool)

(assert (=> b!112026 (= e!72843 e!72836)))

(assert (=> b!112026 (= c!19988 (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12001 () Bool)

(assert (=> bm!12001 (= call!11988 call!11989)))

(declare-fun b!112027 () Bool)

(declare-fun res!55273 () Bool)

(assert (=> b!112027 (= res!55273 call!12002)))

(assert (=> b!112027 (=> (not res!55273) (not e!72833))))

(declare-fun b!112028 () Bool)

(assert (=> b!112028 (= e!72830 (not call!11999))))

(declare-fun bm!12002 () Bool)

(assert (=> bm!12002 (= call!11993 (+!152 e!72838 (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(declare-fun c!19995 () Bool)

(assert (=> bm!12002 (= c!19995 c!19992)))

(declare-fun b!112029 () Bool)

(assert (=> b!112029 (= e!72839 ((_ is Undefined!262) lt!57845))))

(declare-fun b!112030 () Bool)

(declare-fun res!55267 () Bool)

(assert (=> b!112030 (=> (not res!55267) (not e!72827))))

(assert (=> b!112030 (= res!55267 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3199 lt!57854)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112031 () Bool)

(declare-fun lt!57841 () Unit!3485)

(declare-fun lt!57862 () Unit!3485)

(assert (=> b!112031 (= lt!57841 lt!57862)))

(assert (=> b!112031 (= call!11998 call!12004)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!50 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 V!3251 Int) Unit!3485)

(assert (=> b!112031 (= lt!57862 (lemmaChangeZeroKeyThenAddPairToListMap!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) lt!57849 (zeroValue!2517 newMap!16) lt!57730 (minValue!2517 newMap!16) (defaultEntry!2648 newMap!16)))))

(assert (=> b!112031 (= lt!57849 (bvor (extraKeys!2441 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!112031 (= e!72836 (tuple2!2449 true (LongMapFixedSize!925 (defaultEntry!2648 newMap!16) (mask!6826 newMap!16) (bvor (extraKeys!2441 newMap!16) #b00000000000000000000000000000001) lt!57730 (minValue!2517 newMap!16) (_size!511 newMap!16) (_keys!4366 newMap!16) (_values!2631 newMap!16) (_vacant!511 newMap!16))))))

(declare-fun b!112032 () Bool)

(declare-fun res!55268 () Bool)

(assert (=> b!112032 (= res!55268 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3202 lt!57854)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112032 (=> (not res!55268) (not e!72830))))

(declare-fun b!112033 () Bool)

(declare-fun c!19986 () Bool)

(assert (=> b!112033 (= c!19986 ((_ is MissingVacant!262) lt!57845))))

(assert (=> b!112033 (= e!72832 e!72839)))

(declare-fun bm!12003 () Bool)

(assert (=> bm!12003 (= call!11990 (map!1302 newMap!16))))

(declare-fun bm!12004 () Bool)

(assert (=> bm!12004 (= call!11989 (seekEntryOrOpen!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4366 newMap!16) (mask!6826 newMap!16)))))

(declare-fun b!112034 () Bool)

(assert (=> b!112034 (= e!72825 e!72826)))

(declare-fun c!19987 () Bool)

(assert (=> b!112034 (= c!19987 ((_ is MissingZero!262) lt!57840))))

(declare-fun b!112035 () Bool)

(assert (=> b!112035 (= e!72828 call!12005)))

(declare-fun b!112036 () Bool)

(declare-fun lt!57852 () tuple2!2448)

(assert (=> b!112036 (= e!72825 (tuple2!2449 (_1!1235 lt!57852) (_2!1235 lt!57852)))))

(assert (=> b!112036 (= lt!57852 call!11985)))

(assert (= (and d!31839 c!19992) b!112026))

(assert (= (and d!31839 (not c!19992)) b!112009))

(assert (= (and b!112026 c!19988) b!112031))

(assert (= (and b!112026 (not c!19988)) b!111996))

(assert (= (or b!112031 b!111996) bm!12000))

(assert (= (or b!112031 b!111996) bm!11983))

(assert (= (or b!112031 b!111996) bm!11996))

(assert (= (and b!112009 c!19994) b!112002))

(assert (= (and b!112009 (not c!19994)) b!112023))

(assert (= (and b!112002 c!19999) b!112012))

(assert (= (and b!112002 (not c!19999)) b!112021))

(assert (= (and b!112012 res!55274) b!112027))

(assert (= (and b!112027 res!55273) b!112017))

(assert (= (and b!112021 c!19990) b!112020))

(assert (= (and b!112021 (not c!19990)) b!112013))

(assert (= (and b!112020 res!55263) b!112030))

(assert (= (and b!112030 res!55267) b!112018))

(assert (= (and b!112013 c!19996) b!112004))

(assert (= (and b!112013 (not c!19996)) b!112019))

(assert (= (and b!112004 res!55265) b!112032))

(assert (= (and b!112032 res!55268) b!112028))

(assert (= (or b!112020 b!112004) bm!11993))

(assert (= (or b!112018 b!112028) bm!11989))

(assert (= (or b!112027 bm!11993) bm!11984))

(assert (= (or b!112012 b!112021) bm!12001))

(assert (= (and b!112023 c!19993) b!112036))

(assert (= (and b!112023 (not c!19993)) b!112034))

(assert (= (and b!112034 c!19987) b!112025))

(assert (= (and b!112034 (not c!19987)) b!111999))

(assert (= (and b!111999 c!19997) b!112001))

(assert (= (and b!111999 (not c!19997)) b!112006))

(assert (= (and b!112001 res!55269) b!112007))

(assert (= (and b!112007 res!55276) b!112022))

(assert (= (and b!112006 c!19989) b!112024))

(assert (= (and b!112006 (not c!19989)) b!112033))

(assert (= (and b!112024 res!55264) b!112000))

(assert (= (and b!112000 res!55266) b!112014))

(assert (= (and b!112033 c!19986) b!112008))

(assert (= (and b!112033 (not c!19986)) b!112029))

(assert (= (and b!112008 res!55272) b!111995))

(assert (= (and b!111995 res!55270) b!112016))

(assert (= (or b!112024 b!112008) bm!11997))

(assert (= (or b!112014 b!112016) bm!11995))

(assert (= (or b!112007 bm!11997) bm!11981))

(assert (= (or b!112001 b!112006) bm!11982))

(assert (= (or b!112036 b!112025) bm!11988))

(assert (= (or bm!12001 bm!11982) bm!12004))

(assert (= (or b!112002 b!111999) bm!11998))

(assert (= (or bm!11989 bm!11995) bm!11994))

(assert (= (or bm!11984 bm!11981) bm!11985))

(assert (= (or b!112021 b!112006) bm!11999))

(assert (= (or b!112012 b!112001) bm!11987))

(assert (= (or b!112002 b!111999) bm!11990))

(assert (= (and bm!11990 c!19998) b!112035))

(assert (= (and bm!11990 (not c!19998)) b!111998))

(assert (= (or bm!11983 b!111998) bm!11992))

(assert (= (or bm!12000 bm!11998) bm!11986))

(assert (= (or bm!11996 b!111999) bm!12002))

(assert (= (and bm!12002 c!19995) b!112005))

(assert (= (and bm!12002 (not c!19995)) b!112003))

(assert (= (and d!31839 res!55275) b!111997))

(assert (= (and b!111997 c!19991) b!112010))

(assert (= (and b!111997 (not c!19991)) b!112011))

(assert (= (and b!112010 res!55271) b!112015))

(assert (= (or b!112015 b!112011) bm!12003))

(assert (= (or b!112010 b!112015 b!112011) bm!11991))

(declare-fun m!127771 () Bool)

(assert (=> b!111995 m!127771))

(declare-fun m!127773 () Bool)

(assert (=> b!111999 m!127773))

(assert (=> b!111999 m!127651))

(declare-fun m!127775 () Bool)

(assert (=> b!111999 m!127775))

(declare-fun m!127777 () Bool)

(assert (=> b!111999 m!127777))

(assert (=> b!111999 m!127773))

(assert (=> b!111999 m!127651))

(declare-fun m!127779 () Bool)

(assert (=> b!111999 m!127779))

(declare-fun m!127781 () Bool)

(assert (=> b!111999 m!127781))

(assert (=> bm!11999 m!127651))

(declare-fun m!127783 () Bool)

(assert (=> bm!11999 m!127783))

(assert (=> b!112009 m!127651))

(declare-fun m!127785 () Bool)

(assert (=> b!112009 m!127785))

(declare-fun m!127787 () Bool)

(assert (=> b!112030 m!127787))

(declare-fun m!127789 () Bool)

(assert (=> b!112031 m!127789))

(declare-fun m!127791 () Bool)

(assert (=> bm!11992 m!127791))

(assert (=> b!112010 m!127651))

(declare-fun m!127793 () Bool)

(assert (=> b!112010 m!127793))

(declare-fun m!127795 () Bool)

(assert (=> bm!11990 m!127795))

(declare-fun m!127797 () Bool)

(assert (=> bm!11990 m!127797))

(declare-fun m!127799 () Bool)

(assert (=> bm!11985 m!127799))

(assert (=> b!112003 m!127773))

(declare-fun m!127801 () Bool)

(assert (=> bm!11991 m!127801))

(declare-fun m!127803 () Bool)

(assert (=> b!112015 m!127803))

(assert (=> bm!12003 m!127671))

(declare-fun m!127805 () Bool)

(assert (=> b!112032 m!127805))

(declare-fun m!127807 () Bool)

(assert (=> bm!12002 m!127807))

(assert (=> bm!11994 m!127651))

(declare-fun m!127809 () Bool)

(assert (=> bm!11994 m!127809))

(declare-fun m!127811 () Bool)

(assert (=> d!31839 m!127811))

(assert (=> d!31839 m!127669))

(declare-fun m!127813 () Bool)

(assert (=> b!112000 m!127813))

(declare-fun m!127815 () Bool)

(assert (=> b!111996 m!127815))

(declare-fun m!127817 () Bool)

(assert (=> b!112022 m!127817))

(declare-fun m!127819 () Bool)

(assert (=> b!112017 m!127819))

(assert (=> bm!11986 m!127777))

(declare-fun m!127821 () Bool)

(assert (=> bm!11986 m!127821))

(assert (=> bm!11988 m!127651))

(declare-fun m!127823 () Bool)

(assert (=> bm!11988 m!127823))

(assert (=> bm!12004 m!127651))

(assert (=> bm!12004 m!127785))

(assert (=> bm!11987 m!127651))

(declare-fun m!127825 () Bool)

(assert (=> bm!11987 m!127825))

(assert (=> b!111825 d!31839))

(declare-fun d!31841 () Bool)

(assert (=> d!31841 (= (map!1302 newMap!16) (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun bs!4614 () Bool)

(assert (= bs!4614 d!31841))

(assert (=> bs!4614 m!127773))

(assert (=> b!111818 d!31841))

(declare-fun d!31843 () Bool)

(declare-fun e!72875 () Bool)

(assert (=> d!31843 e!72875))

(declare-fun res!55299 () Bool)

(assert (=> d!31843 (=> (not res!55299) (not e!72875))))

(assert (=> d!31843 (= res!55299 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun lt!57914 () ListLongMap!1595)

(declare-fun lt!57916 () ListLongMap!1595)

(assert (=> d!31843 (= lt!57914 lt!57916)))

(declare-fun lt!57926 () Unit!3485)

(declare-fun e!72871 () Unit!3485)

(assert (=> d!31843 (= lt!57926 e!72871)))

(declare-fun c!20014 () Bool)

(declare-fun e!72873 () Bool)

(assert (=> d!31843 (= c!20014 e!72873)))

(declare-fun res!55300 () Bool)

(assert (=> d!31843 (=> (not res!55300) (not e!72873))))

(assert (=> d!31843 (= res!55300 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun e!72881 () ListLongMap!1595)

(assert (=> d!31843 (= lt!57916 e!72881)))

(declare-fun c!20017 () Bool)

(assert (=> d!31843 (= c!20017 (and (not (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!31843 (validMask!0 (mask!6826 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!31843 (= (getCurrentListMap!497 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))) lt!57914)))

(declare-fun b!112079 () Bool)

(declare-fun e!72876 () ListLongMap!1595)

(declare-fun call!12024 () ListLongMap!1595)

(assert (=> b!112079 (= e!72876 call!12024)))

(declare-fun b!112080 () Bool)

(declare-fun e!72872 () ListLongMap!1595)

(assert (=> b!112080 (= e!72872 call!12024)))

(declare-fun b!112081 () Bool)

(declare-fun e!72878 () Bool)

(declare-fun e!72874 () Bool)

(assert (=> b!112081 (= e!72878 e!72874)))

(declare-fun res!55297 () Bool)

(assert (=> b!112081 (=> (not res!55297) (not e!72874))))

(assert (=> b!112081 (= res!55297 (contains!842 lt!57914 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112081 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112082 () Bool)

(declare-fun e!72882 () Bool)

(declare-fun call!12025 () Bool)

(assert (=> b!112082 (= e!72882 (not call!12025))))

(declare-fun b!112083 () Bool)

(declare-fun Unit!3496 () Unit!3485)

(assert (=> b!112083 (= e!72871 Unit!3496)))

(declare-fun bm!12019 () Bool)

(declare-fun call!12022 () ListLongMap!1595)

(declare-fun call!12026 () ListLongMap!1595)

(assert (=> bm!12019 (= call!12022 call!12026)))

(declare-fun bm!12020 () Bool)

(declare-fun call!12027 () ListLongMap!1595)

(declare-fun c!20012 () Bool)

(declare-fun call!12028 () ListLongMap!1595)

(assert (=> bm!12020 (= call!12027 (+!152 (ite c!20017 call!12026 (ite c!20012 call!12022 call!12028)) (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun b!112084 () Bool)

(declare-fun e!72877 () Bool)

(declare-fun e!72880 () Bool)

(assert (=> b!112084 (= e!72877 e!72880)))

(declare-fun res!55298 () Bool)

(declare-fun call!12023 () Bool)

(assert (=> b!112084 (= res!55298 call!12023)))

(assert (=> b!112084 (=> (not res!55298) (not e!72880))))

(declare-fun bm!12021 () Bool)

(assert (=> bm!12021 (= call!12028 call!12022)))

(declare-fun b!112085 () Bool)

(declare-fun apply!101 (ListLongMap!1595 (_ BitVec 64)) V!3251)

(assert (=> b!112085 (= e!72880 (= (apply!101 lt!57914 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112086 () Bool)

(declare-fun lt!57910 () Unit!3485)

(assert (=> b!112086 (= e!72871 lt!57910)))

(declare-fun lt!57920 () ListLongMap!1595)

(assert (=> b!112086 (= lt!57920 (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun lt!57919 () (_ BitVec 64))

(assert (=> b!112086 (= lt!57919 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57925 () (_ BitVec 64))

(assert (=> b!112086 (= lt!57925 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57909 () Unit!3485)

(declare-fun addStillContains!77 (ListLongMap!1595 (_ BitVec 64) V!3251 (_ BitVec 64)) Unit!3485)

(assert (=> b!112086 (= lt!57909 (addStillContains!77 lt!57920 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57925))))

(assert (=> b!112086 (contains!842 (+!152 lt!57920 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57925)))

(declare-fun lt!57917 () Unit!3485)

(assert (=> b!112086 (= lt!57917 lt!57909)))

(declare-fun lt!57913 () ListLongMap!1595)

(assert (=> b!112086 (= lt!57913 (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun lt!57928 () (_ BitVec 64))

(assert (=> b!112086 (= lt!57928 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57918 () (_ BitVec 64))

(assert (=> b!112086 (= lt!57918 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57929 () Unit!3485)

(declare-fun addApplyDifferent!77 (ListLongMap!1595 (_ BitVec 64) V!3251 (_ BitVec 64)) Unit!3485)

(assert (=> b!112086 (= lt!57929 (addApplyDifferent!77 lt!57913 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57918))))

(assert (=> b!112086 (= (apply!101 (+!152 lt!57913 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57918) (apply!101 lt!57913 lt!57918))))

(declare-fun lt!57927 () Unit!3485)

(assert (=> b!112086 (= lt!57927 lt!57929)))

(declare-fun lt!57915 () ListLongMap!1595)

(assert (=> b!112086 (= lt!57915 (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun lt!57912 () (_ BitVec 64))

(assert (=> b!112086 (= lt!57912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57911 () (_ BitVec 64))

(assert (=> b!112086 (= lt!57911 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57930 () Unit!3485)

(assert (=> b!112086 (= lt!57930 (addApplyDifferent!77 lt!57915 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57911))))

(assert (=> b!112086 (= (apply!101 (+!152 lt!57915 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57911) (apply!101 lt!57915 lt!57911))))

(declare-fun lt!57923 () Unit!3485)

(assert (=> b!112086 (= lt!57923 lt!57930)))

(declare-fun lt!57921 () ListLongMap!1595)

(assert (=> b!112086 (= lt!57921 (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun lt!57924 () (_ BitVec 64))

(assert (=> b!112086 (= lt!57924 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57922 () (_ BitVec 64))

(assert (=> b!112086 (= lt!57922 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!112086 (= lt!57910 (addApplyDifferent!77 lt!57921 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57922))))

(assert (=> b!112086 (= (apply!101 (+!152 lt!57921 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57922) (apply!101 lt!57921 lt!57922))))

(declare-fun b!112087 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!112087 (= e!72873 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!12022 () Bool)

(assert (=> bm!12022 (= call!12023 (contains!842 lt!57914 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112088 () Bool)

(assert (=> b!112088 (= e!72881 (+!152 call!12027 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112089 () Bool)

(declare-fun e!72870 () Bool)

(assert (=> b!112089 (= e!72870 (= (apply!101 lt!57914 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112090 () Bool)

(assert (=> b!112090 (= e!72876 call!12028)))

(declare-fun b!112091 () Bool)

(assert (=> b!112091 (= e!72881 e!72872)))

(assert (=> b!112091 (= c!20012 (and (not (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112092 () Bool)

(declare-fun res!55296 () Bool)

(assert (=> b!112092 (=> (not res!55296) (not e!72875))))

(assert (=> b!112092 (= res!55296 e!72878)))

(declare-fun res!55301 () Bool)

(assert (=> b!112092 (=> res!55301 e!72878)))

(declare-fun e!72879 () Bool)

(assert (=> b!112092 (= res!55301 (not e!72879))))

(declare-fun res!55302 () Bool)

(assert (=> b!112092 (=> (not res!55302) (not e!72879))))

(assert (=> b!112092 (= res!55302 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112093 () Bool)

(assert (=> b!112093 (= e!72877 (not call!12023))))

(declare-fun bm!12023 () Bool)

(assert (=> bm!12023 (= call!12026 (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112094 () Bool)

(assert (=> b!112094 (= e!72875 e!72882)))

(declare-fun c!20013 () Bool)

(assert (=> b!112094 (= c!20013 (not (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112095 () Bool)

(assert (=> b!112095 (= e!72874 (= (apply!101 lt!57914 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112095 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2346 (_values!2631 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> b!112095 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112096 () Bool)

(declare-fun c!20016 () Bool)

(assert (=> b!112096 (= c!20016 (and (not (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!112096 (= e!72872 e!72876)))

(declare-fun bm!12024 () Bool)

(assert (=> bm!12024 (= call!12025 (contains!842 lt!57914 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112097 () Bool)

(assert (=> b!112097 (= e!72879 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!112098 () Bool)

(assert (=> b!112098 (= e!72882 e!72870)))

(declare-fun res!55295 () Bool)

(assert (=> b!112098 (= res!55295 call!12025)))

(assert (=> b!112098 (=> (not res!55295) (not e!72870))))

(declare-fun b!112099 () Bool)

(declare-fun res!55303 () Bool)

(assert (=> b!112099 (=> (not res!55303) (not e!72875))))

(assert (=> b!112099 (= res!55303 e!72877)))

(declare-fun c!20015 () Bool)

(assert (=> b!112099 (= c!20015 (not (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12025 () Bool)

(assert (=> bm!12025 (= call!12024 call!12027)))

(assert (= (and d!31843 c!20017) b!112088))

(assert (= (and d!31843 (not c!20017)) b!112091))

(assert (= (and b!112091 c!20012) b!112080))

(assert (= (and b!112091 (not c!20012)) b!112096))

(assert (= (and b!112096 c!20016) b!112079))

(assert (= (and b!112096 (not c!20016)) b!112090))

(assert (= (or b!112079 b!112090) bm!12021))

(assert (= (or b!112080 bm!12021) bm!12019))

(assert (= (or b!112080 b!112079) bm!12025))

(assert (= (or b!112088 bm!12019) bm!12023))

(assert (= (or b!112088 bm!12025) bm!12020))

(assert (= (and d!31843 res!55300) b!112087))

(assert (= (and d!31843 c!20014) b!112086))

(assert (= (and d!31843 (not c!20014)) b!112083))

(assert (= (and d!31843 res!55299) b!112092))

(assert (= (and b!112092 res!55302) b!112097))

(assert (= (and b!112092 (not res!55301)) b!112081))

(assert (= (and b!112081 res!55297) b!112095))

(assert (= (and b!112092 res!55296) b!112099))

(assert (= (and b!112099 c!20015) b!112084))

(assert (= (and b!112099 (not c!20015)) b!112093))

(assert (= (and b!112084 res!55298) b!112085))

(assert (= (or b!112084 b!112093) bm!12022))

(assert (= (and b!112099 res!55303) b!112094))

(assert (= (and b!112094 c!20013) b!112098))

(assert (= (and b!112094 (not c!20013)) b!112082))

(assert (= (and b!112098 res!55295) b!112089))

(assert (= (or b!112098 b!112082) bm!12024))

(declare-fun b_lambda!5021 () Bool)

(assert (=> (not b_lambda!5021) (not b!112095)))

(assert (=> b!112095 t!5789))

(declare-fun b_and!6891 () Bool)

(assert (= b_and!6879 (and (=> t!5789 result!3551) b_and!6891)))

(assert (=> b!112095 t!5791))

(declare-fun b_and!6893 () Bool)

(assert (= b_and!6881 (and (=> t!5791 result!3555) b_and!6893)))

(assert (=> bm!12023 m!127703))

(assert (=> d!31843 m!127695))

(declare-fun m!127827 () Bool)

(assert (=> b!112088 m!127827))

(declare-fun m!127829 () Bool)

(assert (=> bm!12020 m!127829))

(declare-fun m!127831 () Bool)

(assert (=> b!112086 m!127831))

(assert (=> b!112086 m!127703))

(declare-fun m!127833 () Bool)

(assert (=> b!112086 m!127833))

(declare-fun m!127835 () Bool)

(assert (=> b!112086 m!127835))

(declare-fun m!127837 () Bool)

(assert (=> b!112086 m!127837))

(declare-fun m!127839 () Bool)

(assert (=> b!112086 m!127839))

(declare-fun m!127841 () Bool)

(assert (=> b!112086 m!127841))

(declare-fun m!127843 () Bool)

(assert (=> b!112086 m!127843))

(declare-fun m!127845 () Bool)

(assert (=> b!112086 m!127845))

(declare-fun m!127847 () Bool)

(assert (=> b!112086 m!127847))

(declare-fun m!127849 () Bool)

(assert (=> b!112086 m!127849))

(declare-fun m!127851 () Bool)

(assert (=> b!112086 m!127851))

(assert (=> b!112086 m!127849))

(declare-fun m!127853 () Bool)

(assert (=> b!112086 m!127853))

(assert (=> b!112086 m!127845))

(declare-fun m!127855 () Bool)

(assert (=> b!112086 m!127855))

(declare-fun m!127857 () Bool)

(assert (=> b!112086 m!127857))

(assert (=> b!112086 m!127837))

(declare-fun m!127859 () Bool)

(assert (=> b!112086 m!127859))

(assert (=> b!112086 m!127835))

(declare-fun m!127861 () Bool)

(assert (=> b!112086 m!127861))

(declare-fun m!127863 () Bool)

(assert (=> bm!12022 m!127863))

(declare-fun m!127865 () Bool)

(assert (=> b!112089 m!127865))

(assert (=> b!112081 m!127831))

(assert (=> b!112081 m!127831))

(declare-fun m!127867 () Bool)

(assert (=> b!112081 m!127867))

(assert (=> b!112087 m!127831))

(assert (=> b!112087 m!127831))

(declare-fun m!127869 () Bool)

(assert (=> b!112087 m!127869))

(declare-fun m!127871 () Bool)

(assert (=> b!112085 m!127871))

(assert (=> b!112095 m!127831))

(declare-fun m!127873 () Bool)

(assert (=> b!112095 m!127873))

(assert (=> b!112095 m!127663))

(declare-fun m!127875 () Bool)

(assert (=> b!112095 m!127875))

(assert (=> b!112095 m!127831))

(declare-fun m!127877 () Bool)

(assert (=> b!112095 m!127877))

(assert (=> b!112095 m!127873))

(assert (=> b!112095 m!127663))

(assert (=> b!112097 m!127831))

(assert (=> b!112097 m!127831))

(assert (=> b!112097 m!127869))

(declare-fun m!127879 () Bool)

(assert (=> bm!12024 m!127879))

(assert (=> b!111818 d!31843))

(declare-fun d!31845 () Bool)

(assert (=> d!31845 (= (array_inv!1313 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvsge (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!111826 d!31845))

(declare-fun d!31847 () Bool)

(assert (=> d!31847 (= (array_inv!1314 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvsge (size!2346 (_values!2631 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!111826 d!31847))

(declare-fun b!112108 () Bool)

(declare-fun e!72889 () Bool)

(declare-fun call!12031 () Bool)

(assert (=> b!112108 (= e!72889 call!12031)))

(declare-fun b!112109 () Bool)

(declare-fun e!72891 () Bool)

(assert (=> b!112109 (= e!72891 call!12031)))

(declare-fun b!112110 () Bool)

(declare-fun e!72890 () Bool)

(assert (=> b!112110 (= e!72890 e!72889)))

(declare-fun c!20020 () Bool)

(assert (=> b!112110 (= c!20020 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!12028 () Bool)

(assert (=> bm!12028 (= call!12031 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4366 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112111 () Bool)

(assert (=> b!112111 (= e!72889 e!72891)))

(declare-fun lt!57939 () (_ BitVec 64))

(assert (=> b!112111 (= lt!57939 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!57938 () Unit!3485)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4403 (_ BitVec 64) (_ BitVec 32)) Unit!3485)

(assert (=> b!112111 (= lt!57938 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) lt!57939 #b00000000000000000000000000000000))))

(assert (=> b!112111 (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) lt!57939 #b00000000000000000000000000000000)))

(declare-fun lt!57937 () Unit!3485)

(assert (=> b!112111 (= lt!57937 lt!57938)))

(declare-fun res!55309 () Bool)

(assert (=> b!112111 (= res!55309 (= (seekEntryOrOpen!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) (_keys!4366 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992)))) (Found!262 #b00000000000000000000000000000000)))))

(assert (=> b!112111 (=> (not res!55309) (not e!72891))))

(declare-fun d!31849 () Bool)

(declare-fun res!55308 () Bool)

(assert (=> d!31849 (=> res!55308 e!72890)))

(assert (=> d!31849 (= res!55308 (bvsge #b00000000000000000000000000000000 (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!31849 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992)))) e!72890)))

(assert (= (and d!31849 (not res!55308)) b!112110))

(assert (= (and b!112110 c!20020) b!112111))

(assert (= (and b!112110 (not c!20020)) b!112108))

(assert (= (and b!112111 res!55309) b!112109))

(assert (= (or b!112109 b!112108) bm!12028))

(declare-fun m!127881 () Bool)

(assert (=> b!112110 m!127881))

(assert (=> b!112110 m!127881))

(declare-fun m!127883 () Bool)

(assert (=> b!112110 m!127883))

(declare-fun m!127885 () Bool)

(assert (=> bm!12028 m!127885))

(assert (=> b!112111 m!127881))

(declare-fun m!127887 () Bool)

(assert (=> b!112111 m!127887))

(declare-fun m!127889 () Bool)

(assert (=> b!112111 m!127889))

(assert (=> b!112111 m!127881))

(declare-fun m!127891 () Bool)

(assert (=> b!112111 m!127891))

(assert (=> b!111814 d!31849))

(declare-fun d!31851 () Bool)

(declare-fun res!55316 () Bool)

(declare-fun e!72894 () Bool)

(assert (=> d!31851 (=> (not res!55316) (not e!72894))))

(declare-fun simpleValid!77 (LongMapFixedSize!924) Bool)

(assert (=> d!31851 (= res!55316 (simpleValid!77 newMap!16))))

(assert (=> d!31851 (= (valid!432 newMap!16) e!72894)))

(declare-fun b!112118 () Bool)

(declare-fun res!55317 () Bool)

(assert (=> b!112118 (=> (not res!55317) (not e!72894))))

(declare-fun arrayCountValidKeys!0 (array!4403 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!112118 (= res!55317 (= (arrayCountValidKeys!0 (_keys!4366 newMap!16) #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))) (_size!511 newMap!16)))))

(declare-fun b!112119 () Bool)

(declare-fun res!55318 () Bool)

(assert (=> b!112119 (=> (not res!55318) (not e!72894))))

(assert (=> b!112119 (= res!55318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4366 newMap!16) (mask!6826 newMap!16)))))

(declare-fun b!112120 () Bool)

(assert (=> b!112120 (= e!72894 (arrayNoDuplicates!0 (_keys!4366 newMap!16) #b00000000000000000000000000000000 Nil!1632))))

(assert (= (and d!31851 res!55316) b!112118))

(assert (= (and b!112118 res!55317) b!112119))

(assert (= (and b!112119 res!55318) b!112120))

(declare-fun m!127893 () Bool)

(assert (=> d!31851 m!127893))

(declare-fun m!127895 () Bool)

(assert (=> b!112118 m!127895))

(declare-fun m!127897 () Bool)

(assert (=> b!112119 m!127897))

(declare-fun m!127899 () Bool)

(assert (=> b!112120 m!127899))

(assert (=> b!111829 d!31851))

(declare-fun d!31853 () Bool)

(assert (=> d!31853 (= (valid!433 thiss!992) (valid!432 (v!2946 (underlying!373 thiss!992))))))

(declare-fun bs!4615 () Bool)

(assert (= bs!4615 d!31853))

(declare-fun m!127901 () Bool)

(assert (=> bs!4615 m!127901))

(assert (=> start!12844 d!31853))

(declare-fun d!31855 () Bool)

(assert (=> d!31855 (not (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!57942 () Unit!3485)

(declare-fun choose!68 (array!4403 (_ BitVec 32) (_ BitVec 64) List!1635) Unit!3485)

(assert (=> d!31855 (= lt!57942 (choose!68 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (Cons!1631 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1632)))))

(assert (=> d!31855 (bvslt (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!31855 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (Cons!1631 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1632)) lt!57942)))

(declare-fun bs!4616 () Bool)

(assert (= bs!4616 d!31855))

(assert (=> bs!4616 m!127651))

(assert (=> bs!4616 m!127681))

(assert (=> bs!4616 m!127651))

(declare-fun m!127903 () Bool)

(assert (=> bs!4616 m!127903))

(assert (=> b!111833 d!31855))

(declare-fun d!31857 () Bool)

(assert (=> d!31857 (arrayNoDuplicates!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) from!355 Nil!1632)))

(declare-fun lt!57945 () Unit!3485)

(declare-fun choose!39 (array!4403 (_ BitVec 32) (_ BitVec 32)) Unit!3485)

(assert (=> d!31857 (= lt!57945 (choose!39 (_keys!4366 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!31857 (bvslt (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!31857 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 from!355) lt!57945)))

(declare-fun bs!4617 () Bool)

(assert (= bs!4617 d!31857))

(assert (=> bs!4617 m!127677))

(declare-fun m!127905 () Bool)

(assert (=> bs!4617 m!127905))

(assert (=> b!111833 d!31857))

(declare-fun d!31859 () Bool)

(declare-fun res!55323 () Bool)

(declare-fun e!72899 () Bool)

(assert (=> d!31859 (=> res!55323 e!72899)))

(assert (=> d!31859 (= res!55323 (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!31859 (= (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!72899)))

(declare-fun b!112125 () Bool)

(declare-fun e!72900 () Bool)

(assert (=> b!112125 (= e!72899 e!72900)))

(declare-fun res!55324 () Bool)

(assert (=> b!112125 (=> (not res!55324) (not e!72900))))

(assert (=> b!112125 (= res!55324 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112126 () Bool)

(assert (=> b!112126 (= e!72900 (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!31859 (not res!55323)) b!112125))

(assert (= (and b!112125 res!55324) b!112126))

(assert (=> d!31859 m!127831))

(assert (=> b!112126 m!127651))

(declare-fun m!127907 () Bool)

(assert (=> b!112126 m!127907))

(assert (=> b!111833 d!31859))

(declare-fun d!31861 () Bool)

(declare-fun e!72903 () Bool)

(assert (=> d!31861 e!72903))

(declare-fun c!20023 () Bool)

(assert (=> d!31861 (= c!20023 (and (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!57948 () Unit!3485)

(declare-fun choose!697 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 64) (_ BitVec 32) Int) Unit!3485)

(assert (=> d!31861 (= lt!57948 (choose!697 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))))))

(assert (=> d!31861 (validMask!0 (mask!6826 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!31861 (= (lemmaListMapContainsThenArrayContainsFrom!113 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))) lt!57948)))

(declare-fun b!112131 () Bool)

(assert (=> b!112131 (= e!72903 (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!112132 () Bool)

(assert (=> b!112132 (= e!72903 (ite (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!31861 c!20023) b!112131))

(assert (= (and d!31861 (not c!20023)) b!112132))

(assert (=> d!31861 m!127651))

(declare-fun m!127909 () Bool)

(assert (=> d!31861 m!127909))

(assert (=> d!31861 m!127695))

(assert (=> b!112131 m!127651))

(assert (=> b!112131 m!127681))

(assert (=> b!111833 d!31861))

(declare-fun b!112143 () Bool)

(declare-fun e!72913 () Bool)

(declare-fun call!12034 () Bool)

(assert (=> b!112143 (= e!72913 call!12034)))

(declare-fun d!31863 () Bool)

(declare-fun res!55331 () Bool)

(declare-fun e!72914 () Bool)

(assert (=> d!31863 (=> res!55331 e!72914)))

(assert (=> d!31863 (= res!55331 (bvsge from!355 (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!31863 (= (arrayNoDuplicates!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) from!355 Nil!1632) e!72914)))

(declare-fun b!112144 () Bool)

(declare-fun e!72912 () Bool)

(assert (=> b!112144 (= e!72912 e!72913)))

(declare-fun c!20026 () Bool)

(assert (=> b!112144 (= c!20026 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112145 () Bool)

(assert (=> b!112145 (= e!72913 call!12034)))

(declare-fun bm!12031 () Bool)

(assert (=> bm!12031 (= call!12034 (arrayNoDuplicates!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!20026 (Cons!1631 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1632) Nil!1632)))))

(declare-fun b!112146 () Bool)

(declare-fun e!72915 () Bool)

(declare-fun contains!844 (List!1635 (_ BitVec 64)) Bool)

(assert (=> b!112146 (= e!72915 (contains!844 Nil!1632 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112147 () Bool)

(assert (=> b!112147 (= e!72914 e!72912)))

(declare-fun res!55332 () Bool)

(assert (=> b!112147 (=> (not res!55332) (not e!72912))))

(assert (=> b!112147 (= res!55332 (not e!72915))))

(declare-fun res!55333 () Bool)

(assert (=> b!112147 (=> (not res!55333) (not e!72915))))

(assert (=> b!112147 (= res!55333 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (= (and d!31863 (not res!55331)) b!112147))

(assert (= (and b!112147 res!55333) b!112146))

(assert (= (and b!112147 res!55332) b!112144))

(assert (= (and b!112144 c!20026) b!112145))

(assert (= (and b!112144 (not c!20026)) b!112143))

(assert (= (or b!112145 b!112143) bm!12031))

(assert (=> b!112144 m!127651))

(assert (=> b!112144 m!127651))

(declare-fun m!127911 () Bool)

(assert (=> b!112144 m!127911))

(assert (=> bm!12031 m!127651))

(declare-fun m!127913 () Bool)

(assert (=> bm!12031 m!127913))

(assert (=> b!112146 m!127651))

(assert (=> b!112146 m!127651))

(declare-fun m!127915 () Bool)

(assert (=> b!112146 m!127915))

(assert (=> b!112147 m!127651))

(assert (=> b!112147 m!127651))

(assert (=> b!112147 m!127911))

(assert (=> b!111833 d!31863))

(declare-fun b!112172 () Bool)

(declare-fun e!72936 () Bool)

(declare-fun e!72932 () Bool)

(assert (=> b!112172 (= e!72936 e!72932)))

(declare-fun c!20035 () Bool)

(declare-fun e!72931 () Bool)

(assert (=> b!112172 (= c!20035 e!72931)))

(declare-fun res!55342 () Bool)

(assert (=> b!112172 (=> (not res!55342) (not e!72931))))

(assert (=> b!112172 (= res!55342 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112173 () Bool)

(declare-fun e!72934 () Bool)

(assert (=> b!112173 (= e!72932 e!72934)))

(declare-fun c!20036 () Bool)

(assert (=> b!112173 (= c!20036 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112174 () Bool)

(declare-fun e!72935 () Bool)

(assert (=> b!112174 (= e!72932 e!72935)))

(assert (=> b!112174 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun lt!57964 () ListLongMap!1595)

(declare-fun res!55344 () Bool)

(assert (=> b!112174 (= res!55344 (contains!842 lt!57964 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112174 (=> (not res!55344) (not e!72935))))

(declare-fun b!112175 () Bool)

(declare-fun e!72930 () ListLongMap!1595)

(declare-fun e!72933 () ListLongMap!1595)

(assert (=> b!112175 (= e!72930 e!72933)))

(declare-fun c!20037 () Bool)

(assert (=> b!112175 (= c!20037 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!112176 () Bool)

(declare-fun call!12037 () ListLongMap!1595)

(assert (=> b!112176 (= e!72933 call!12037)))

(declare-fun b!112177 () Bool)

(assert (=> b!112177 (= e!72930 (ListLongMap!1596 Nil!1631))))

(declare-fun b!112178 () Bool)

(assert (=> b!112178 (= e!72931 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112178 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!112179 () Bool)

(declare-fun res!55345 () Bool)

(assert (=> b!112179 (=> (not res!55345) (not e!72936))))

(assert (=> b!112179 (= res!55345 (not (contains!842 lt!57964 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!31865 () Bool)

(assert (=> d!31865 e!72936))

(declare-fun res!55343 () Bool)

(assert (=> d!31865 (=> (not res!55343) (not e!72936))))

(assert (=> d!31865 (= res!55343 (not (contains!842 lt!57964 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31865 (= lt!57964 e!72930)))

(declare-fun c!20038 () Bool)

(assert (=> d!31865 (= c!20038 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!31865 (validMask!0 (mask!6826 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!31865 (= (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))) lt!57964)))

(declare-fun b!112180 () Bool)

(declare-fun isEmpty!379 (ListLongMap!1595) Bool)

(assert (=> b!112180 (= e!72934 (isEmpty!379 lt!57964))))

(declare-fun b!112181 () Bool)

(declare-fun lt!57969 () Unit!3485)

(declare-fun lt!57965 () Unit!3485)

(assert (=> b!112181 (= lt!57969 lt!57965)))

(declare-fun lt!57968 () V!3251)

(declare-fun lt!57966 () (_ BitVec 64))

(declare-fun lt!57967 () (_ BitVec 64))

(declare-fun lt!57963 () ListLongMap!1595)

(assert (=> b!112181 (not (contains!842 (+!152 lt!57963 (tuple2!2447 lt!57966 lt!57968)) lt!57967))))

(declare-fun addStillNotContains!49 (ListLongMap!1595 (_ BitVec 64) V!3251 (_ BitVec 64)) Unit!3485)

(assert (=> b!112181 (= lt!57965 (addStillNotContains!49 lt!57963 lt!57966 lt!57968 lt!57967))))

(assert (=> b!112181 (= lt!57967 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!112181 (= lt!57968 (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112181 (= lt!57966 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!112181 (= lt!57963 call!12037)))

(assert (=> b!112181 (= e!72933 (+!152 call!12037 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!12034 () Bool)

(assert (=> bm!12034 (= call!12037 (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112182 () Bool)

(assert (=> b!112182 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> b!112182 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2346 (_values!2631 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> b!112182 (= e!72935 (= (apply!101 lt!57964 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!112183 () Bool)

(assert (=> b!112183 (= e!72934 (= lt!57964 (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!31865 c!20038) b!112177))

(assert (= (and d!31865 (not c!20038)) b!112175))

(assert (= (and b!112175 c!20037) b!112181))

(assert (= (and b!112175 (not c!20037)) b!112176))

(assert (= (or b!112181 b!112176) bm!12034))

(assert (= (and d!31865 res!55343) b!112179))

(assert (= (and b!112179 res!55345) b!112172))

(assert (= (and b!112172 res!55342) b!112178))

(assert (= (and b!112172 c!20035) b!112174))

(assert (= (and b!112172 (not c!20035)) b!112173))

(assert (= (and b!112174 res!55344) b!112182))

(assert (= (and b!112173 c!20036) b!112183))

(assert (= (and b!112173 (not c!20036)) b!112180))

(declare-fun b_lambda!5023 () Bool)

(assert (=> (not b_lambda!5023) (not b!112181)))

(assert (=> b!112181 t!5789))

(declare-fun b_and!6895 () Bool)

(assert (= b_and!6891 (and (=> t!5789 result!3551) b_and!6895)))

(assert (=> b!112181 t!5791))

(declare-fun b_and!6897 () Bool)

(assert (= b_and!6893 (and (=> t!5791 result!3555) b_and!6897)))

(declare-fun b_lambda!5025 () Bool)

(assert (=> (not b_lambda!5025) (not b!112182)))

(assert (=> b!112182 t!5789))

(declare-fun b_and!6899 () Bool)

(assert (= b_and!6895 (and (=> t!5789 result!3551) b_and!6899)))

(assert (=> b!112182 t!5791))

(declare-fun b_and!6901 () Bool)

(assert (= b_and!6897 (and (=> t!5791 result!3555) b_and!6901)))

(assert (=> b!112174 m!127831))

(assert (=> b!112174 m!127831))

(declare-fun m!127917 () Bool)

(assert (=> b!112174 m!127917))

(declare-fun m!127919 () Bool)

(assert (=> d!31865 m!127919))

(assert (=> d!31865 m!127695))

(declare-fun m!127921 () Bool)

(assert (=> b!112180 m!127921))

(assert (=> b!112175 m!127831))

(assert (=> b!112175 m!127831))

(assert (=> b!112175 m!127869))

(assert (=> b!112178 m!127831))

(assert (=> b!112178 m!127831))

(assert (=> b!112178 m!127869))

(declare-fun m!127923 () Bool)

(assert (=> bm!12034 m!127923))

(assert (=> b!112182 m!127873))

(assert (=> b!112182 m!127663))

(assert (=> b!112182 m!127875))

(assert (=> b!112182 m!127831))

(declare-fun m!127925 () Bool)

(assert (=> b!112182 m!127925))

(assert (=> b!112182 m!127873))

(assert (=> b!112182 m!127663))

(assert (=> b!112182 m!127831))

(declare-fun m!127927 () Bool)

(assert (=> b!112179 m!127927))

(assert (=> b!112183 m!127923))

(assert (=> b!112181 m!127873))

(assert (=> b!112181 m!127663))

(assert (=> b!112181 m!127875))

(declare-fun m!127929 () Bool)

(assert (=> b!112181 m!127929))

(declare-fun m!127931 () Bool)

(assert (=> b!112181 m!127931))

(assert (=> b!112181 m!127873))

(declare-fun m!127933 () Bool)

(assert (=> b!112181 m!127933))

(assert (=> b!112181 m!127663))

(declare-fun m!127935 () Bool)

(assert (=> b!112181 m!127935))

(assert (=> b!112181 m!127929))

(assert (=> b!112181 m!127831))

(assert (=> b!111820 d!31865))

(declare-fun d!31867 () Bool)

(declare-fun e!72939 () Bool)

(assert (=> d!31867 e!72939))

(declare-fun res!55350 () Bool)

(assert (=> d!31867 (=> (not res!55350) (not e!72939))))

(declare-fun lt!57981 () ListLongMap!1595)

(assert (=> d!31867 (= res!55350 (contains!842 lt!57981 (_1!1234 lt!57726)))))

(declare-fun lt!57979 () List!1634)

(assert (=> d!31867 (= lt!57981 (ListLongMap!1596 lt!57979))))

(declare-fun lt!57980 () Unit!3485)

(declare-fun lt!57978 () Unit!3485)

(assert (=> d!31867 (= lt!57980 lt!57978)))

(assert (=> d!31867 (= (getValueByKey!159 lt!57979 (_1!1234 lt!57726)) (Some!164 (_2!1234 lt!57726)))))

(declare-fun lemmaContainsTupThenGetReturnValue!75 (List!1634 (_ BitVec 64) V!3251) Unit!3485)

(assert (=> d!31867 (= lt!57978 (lemmaContainsTupThenGetReturnValue!75 lt!57979 (_1!1234 lt!57726) (_2!1234 lt!57726)))))

(declare-fun insertStrictlySorted!78 (List!1634 (_ BitVec 64) V!3251) List!1634)

(assert (=> d!31867 (= lt!57979 (insertStrictlySorted!78 (toList!813 lt!57731) (_1!1234 lt!57726) (_2!1234 lt!57726)))))

(assert (=> d!31867 (= (+!152 lt!57731 lt!57726) lt!57981)))

(declare-fun b!112188 () Bool)

(declare-fun res!55351 () Bool)

(assert (=> b!112188 (=> (not res!55351) (not e!72939))))

(assert (=> b!112188 (= res!55351 (= (getValueByKey!159 (toList!813 lt!57981) (_1!1234 lt!57726)) (Some!164 (_2!1234 lt!57726))))))

(declare-fun b!112189 () Bool)

(declare-fun contains!845 (List!1634 tuple2!2446) Bool)

(assert (=> b!112189 (= e!72939 (contains!845 (toList!813 lt!57981) lt!57726))))

(assert (= (and d!31867 res!55350) b!112188))

(assert (= (and b!112188 res!55351) b!112189))

(declare-fun m!127937 () Bool)

(assert (=> d!31867 m!127937))

(declare-fun m!127939 () Bool)

(assert (=> d!31867 m!127939))

(declare-fun m!127941 () Bool)

(assert (=> d!31867 m!127941))

(declare-fun m!127943 () Bool)

(assert (=> d!31867 m!127943))

(declare-fun m!127945 () Bool)

(assert (=> b!112188 m!127945))

(declare-fun m!127947 () Bool)

(assert (=> b!112189 m!127947))

(assert (=> b!111820 d!31867))

(declare-fun d!31869 () Bool)

(declare-fun e!72940 () Bool)

(assert (=> d!31869 e!72940))

(declare-fun res!55352 () Bool)

(assert (=> d!31869 (=> (not res!55352) (not e!72940))))

(declare-fun lt!57985 () ListLongMap!1595)

(assert (=> d!31869 (= res!55352 (contains!842 lt!57985 (_1!1234 lt!57733)))))

(declare-fun lt!57983 () List!1634)

(assert (=> d!31869 (= lt!57985 (ListLongMap!1596 lt!57983))))

(declare-fun lt!57984 () Unit!3485)

(declare-fun lt!57982 () Unit!3485)

(assert (=> d!31869 (= lt!57984 lt!57982)))

(assert (=> d!31869 (= (getValueByKey!159 lt!57983 (_1!1234 lt!57733)) (Some!164 (_2!1234 lt!57733)))))

(assert (=> d!31869 (= lt!57982 (lemmaContainsTupThenGetReturnValue!75 lt!57983 (_1!1234 lt!57733) (_2!1234 lt!57733)))))

(assert (=> d!31869 (= lt!57983 (insertStrictlySorted!78 (toList!813 (+!152 lt!57731 lt!57726)) (_1!1234 lt!57733) (_2!1234 lt!57733)))))

(assert (=> d!31869 (= (+!152 (+!152 lt!57731 lt!57726) lt!57733) lt!57985)))

(declare-fun b!112190 () Bool)

(declare-fun res!55353 () Bool)

(assert (=> b!112190 (=> (not res!55353) (not e!72940))))

(assert (=> b!112190 (= res!55353 (= (getValueByKey!159 (toList!813 lt!57985) (_1!1234 lt!57733)) (Some!164 (_2!1234 lt!57733))))))

(declare-fun b!112191 () Bool)

(assert (=> b!112191 (= e!72940 (contains!845 (toList!813 lt!57985) lt!57733))))

(assert (= (and d!31869 res!55352) b!112190))

(assert (= (and b!112190 res!55353) b!112191))

(declare-fun m!127949 () Bool)

(assert (=> d!31869 m!127949))

(declare-fun m!127951 () Bool)

(assert (=> d!31869 m!127951))

(declare-fun m!127953 () Bool)

(assert (=> d!31869 m!127953))

(declare-fun m!127955 () Bool)

(assert (=> d!31869 m!127955))

(declare-fun m!127957 () Bool)

(assert (=> b!112190 m!127957))

(declare-fun m!127959 () Bool)

(assert (=> b!112191 m!127959))

(assert (=> b!111820 d!31869))

(declare-fun d!31871 () Bool)

(declare-fun e!72941 () Bool)

(assert (=> d!31871 e!72941))

(declare-fun res!55354 () Bool)

(assert (=> d!31871 (=> (not res!55354) (not e!72941))))

(declare-fun lt!57989 () ListLongMap!1595)

(assert (=> d!31871 (= res!55354 (contains!842 lt!57989 (_1!1234 lt!57733)))))

(declare-fun lt!57987 () List!1634)

(assert (=> d!31871 (= lt!57989 (ListLongMap!1596 lt!57987))))

(declare-fun lt!57988 () Unit!3485)

(declare-fun lt!57986 () Unit!3485)

(assert (=> d!31871 (= lt!57988 lt!57986)))

(assert (=> d!31871 (= (getValueByKey!159 lt!57987 (_1!1234 lt!57733)) (Some!164 (_2!1234 lt!57733)))))

(assert (=> d!31871 (= lt!57986 (lemmaContainsTupThenGetReturnValue!75 lt!57987 (_1!1234 lt!57733) (_2!1234 lt!57733)))))

(assert (=> d!31871 (= lt!57987 (insertStrictlySorted!78 (toList!813 lt!57731) (_1!1234 lt!57733) (_2!1234 lt!57733)))))

(assert (=> d!31871 (= (+!152 lt!57731 lt!57733) lt!57989)))

(declare-fun b!112192 () Bool)

(declare-fun res!55355 () Bool)

(assert (=> b!112192 (=> (not res!55355) (not e!72941))))

(assert (=> b!112192 (= res!55355 (= (getValueByKey!159 (toList!813 lt!57989) (_1!1234 lt!57733)) (Some!164 (_2!1234 lt!57733))))))

(declare-fun b!112193 () Bool)

(assert (=> b!112193 (= e!72941 (contains!845 (toList!813 lt!57989) lt!57733))))

(assert (= (and d!31871 res!55354) b!112192))

(assert (= (and b!112192 res!55355) b!112193))

(declare-fun m!127961 () Bool)

(assert (=> d!31871 m!127961))

(declare-fun m!127963 () Bool)

(assert (=> d!31871 m!127963))

(declare-fun m!127965 () Bool)

(assert (=> d!31871 m!127965))

(declare-fun m!127967 () Bool)

(assert (=> d!31871 m!127967))

(declare-fun m!127969 () Bool)

(assert (=> b!112192 m!127969))

(declare-fun m!127971 () Bool)

(assert (=> b!112193 m!127971))

(assert (=> b!111820 d!31871))

(declare-fun d!31873 () Bool)

(declare-fun e!72942 () Bool)

(assert (=> d!31873 e!72942))

(declare-fun res!55356 () Bool)

(assert (=> d!31873 (=> (not res!55356) (not e!72942))))

(declare-fun lt!57993 () ListLongMap!1595)

(assert (=> d!31873 (= res!55356 (contains!842 lt!57993 (_1!1234 lt!57726)))))

(declare-fun lt!57991 () List!1634)

(assert (=> d!31873 (= lt!57993 (ListLongMap!1596 lt!57991))))

(declare-fun lt!57992 () Unit!3485)

(declare-fun lt!57990 () Unit!3485)

(assert (=> d!31873 (= lt!57992 lt!57990)))

(assert (=> d!31873 (= (getValueByKey!159 lt!57991 (_1!1234 lt!57726)) (Some!164 (_2!1234 lt!57726)))))

(assert (=> d!31873 (= lt!57990 (lemmaContainsTupThenGetReturnValue!75 lt!57991 (_1!1234 lt!57726) (_2!1234 lt!57726)))))

(assert (=> d!31873 (= lt!57991 (insertStrictlySorted!78 (toList!813 (+!152 lt!57731 lt!57733)) (_1!1234 lt!57726) (_2!1234 lt!57726)))))

(assert (=> d!31873 (= (+!152 (+!152 lt!57731 lt!57733) lt!57726) lt!57993)))

(declare-fun b!112194 () Bool)

(declare-fun res!55357 () Bool)

(assert (=> b!112194 (=> (not res!55357) (not e!72942))))

(assert (=> b!112194 (= res!55357 (= (getValueByKey!159 (toList!813 lt!57993) (_1!1234 lt!57726)) (Some!164 (_2!1234 lt!57726))))))

(declare-fun b!112195 () Bool)

(assert (=> b!112195 (= e!72942 (contains!845 (toList!813 lt!57993) lt!57726))))

(assert (= (and d!31873 res!55356) b!112194))

(assert (= (and b!112194 res!55357) b!112195))

(declare-fun m!127973 () Bool)

(assert (=> d!31873 m!127973))

(declare-fun m!127975 () Bool)

(assert (=> d!31873 m!127975))

(declare-fun m!127977 () Bool)

(assert (=> d!31873 m!127977))

(declare-fun m!127979 () Bool)

(assert (=> d!31873 m!127979))

(declare-fun m!127981 () Bool)

(assert (=> b!112194 m!127981))

(declare-fun m!127983 () Bool)

(assert (=> b!112195 m!127983))

(assert (=> b!111820 d!31873))

(declare-fun d!31875 () Bool)

(assert (=> d!31875 (= (+!152 (+!152 lt!57731 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (+!152 (+!152 lt!57731 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))

(declare-fun lt!57996 () Unit!3485)

(declare-fun choose!698 (ListLongMap!1595 (_ BitVec 64) V!3251 (_ BitVec 64) V!3251) Unit!3485)

(assert (=> d!31875 (= lt!57996 (choose!698 lt!57731 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))

(assert (=> d!31875 (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31875 (= (addCommutativeForDiffKeys!64 lt!57731 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) lt!57996)))

(declare-fun bs!4618 () Bool)

(assert (= bs!4618 d!31875))

(declare-fun m!127985 () Bool)

(assert (=> bs!4618 m!127985))

(declare-fun m!127987 () Bool)

(assert (=> bs!4618 m!127987))

(assert (=> bs!4618 m!127985))

(assert (=> bs!4618 m!127651))

(declare-fun m!127989 () Bool)

(assert (=> bs!4618 m!127989))

(declare-fun m!127991 () Bool)

(assert (=> bs!4618 m!127991))

(assert (=> bs!4618 m!127991))

(declare-fun m!127993 () Bool)

(assert (=> bs!4618 m!127993))

(assert (=> b!111820 d!31875))

(declare-fun d!31877 () Bool)

(assert (=> d!31877 (= (validMask!0 (mask!6826 (v!2946 (underlying!373 thiss!992)))) (and (or (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000001111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000011111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000001111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000011111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000001111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000011111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000001111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000011111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000000111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000001111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000011111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000000111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000001111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000011111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000000111111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000001111111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000011111111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000000111111111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000001111111111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000011111111111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00000111111111111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00001111111111111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00011111111111111111111111111111) (= (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6826 (v!2946 (underlying!373 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!111820 d!31877))

(declare-fun d!31879 () Bool)

(assert (=> d!31879 (= (array_inv!1313 (_keys!4366 newMap!16)) (bvsge (size!2345 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!111832 d!31879))

(declare-fun d!31881 () Bool)

(assert (=> d!31881 (= (array_inv!1314 (_values!2631 newMap!16)) (bvsge (size!2346 (_values!2631 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!111832 d!31881))

(declare-fun d!31883 () Bool)

(declare-fun c!20041 () Bool)

(assert (=> d!31883 (= c!20041 ((_ is ValueCellFull!1008) (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun e!72945 () V!3251)

(assert (=> d!31883 (= (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!72945)))

(declare-fun b!112200 () Bool)

(declare-fun get!1355 (ValueCell!1008 V!3251) V!3251)

(assert (=> b!112200 (= e!72945 (get!1355 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!112201 () Bool)

(declare-fun get!1356 (ValueCell!1008 V!3251) V!3251)

(assert (=> b!112201 (= e!72945 (get!1356 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31883 c!20041) b!112200))

(assert (= (and d!31883 (not c!20041)) b!112201))

(assert (=> b!112200 m!127661))

(assert (=> b!112200 m!127663))

(declare-fun m!127995 () Bool)

(assert (=> b!112200 m!127995))

(assert (=> b!112201 m!127661))

(assert (=> b!112201 m!127663))

(declare-fun m!127997 () Bool)

(assert (=> b!112201 m!127997))

(assert (=> b!111827 d!31883))

(declare-fun mapNonEmpty!4035 () Bool)

(declare-fun mapRes!4035 () Bool)

(declare-fun tp!10083 () Bool)

(declare-fun e!72950 () Bool)

(assert (=> mapNonEmpty!4035 (= mapRes!4035 (and tp!10083 e!72950))))

(declare-fun mapKey!4035 () (_ BitVec 32))

(declare-fun mapRest!4035 () (Array (_ BitVec 32) ValueCell!1008))

(declare-fun mapValue!4035 () ValueCell!1008)

(assert (=> mapNonEmpty!4035 (= mapRest!4026 (store mapRest!4035 mapKey!4035 mapValue!4035))))

(declare-fun mapIsEmpty!4035 () Bool)

(assert (=> mapIsEmpty!4035 mapRes!4035))

(declare-fun b!112208 () Bool)

(assert (=> b!112208 (= e!72950 tp_is_empty!2703)))

(declare-fun b!112209 () Bool)

(declare-fun e!72951 () Bool)

(assert (=> b!112209 (= e!72951 tp_is_empty!2703)))

(declare-fun condMapEmpty!4035 () Bool)

(declare-fun mapDefault!4035 () ValueCell!1008)

(assert (=> mapNonEmpty!4025 (= condMapEmpty!4035 (= mapRest!4026 ((as const (Array (_ BitVec 32) ValueCell!1008)) mapDefault!4035)))))

(assert (=> mapNonEmpty!4025 (= tp!10068 (and e!72951 mapRes!4035))))

(assert (= (and mapNonEmpty!4025 condMapEmpty!4035) mapIsEmpty!4035))

(assert (= (and mapNonEmpty!4025 (not condMapEmpty!4035)) mapNonEmpty!4035))

(assert (= (and mapNonEmpty!4035 ((_ is ValueCellFull!1008) mapValue!4035)) b!112208))

(assert (= (and mapNonEmpty!4025 ((_ is ValueCellFull!1008) mapDefault!4035)) b!112209))

(declare-fun m!127999 () Bool)

(assert (=> mapNonEmpty!4035 m!127999))

(declare-fun mapNonEmpty!4036 () Bool)

(declare-fun mapRes!4036 () Bool)

(declare-fun tp!10084 () Bool)

(declare-fun e!72952 () Bool)

(assert (=> mapNonEmpty!4036 (= mapRes!4036 (and tp!10084 e!72952))))

(declare-fun mapRest!4036 () (Array (_ BitVec 32) ValueCell!1008))

(declare-fun mapValue!4036 () ValueCell!1008)

(declare-fun mapKey!4036 () (_ BitVec 32))

(assert (=> mapNonEmpty!4036 (= mapRest!4025 (store mapRest!4036 mapKey!4036 mapValue!4036))))

(declare-fun mapIsEmpty!4036 () Bool)

(assert (=> mapIsEmpty!4036 mapRes!4036))

(declare-fun b!112210 () Bool)

(assert (=> b!112210 (= e!72952 tp_is_empty!2703)))

(declare-fun b!112211 () Bool)

(declare-fun e!72953 () Bool)

(assert (=> b!112211 (= e!72953 tp_is_empty!2703)))

(declare-fun condMapEmpty!4036 () Bool)

(declare-fun mapDefault!4036 () ValueCell!1008)

(assert (=> mapNonEmpty!4026 (= condMapEmpty!4036 (= mapRest!4025 ((as const (Array (_ BitVec 32) ValueCell!1008)) mapDefault!4036)))))

(assert (=> mapNonEmpty!4026 (= tp!10065 (and e!72953 mapRes!4036))))

(assert (= (and mapNonEmpty!4026 condMapEmpty!4036) mapIsEmpty!4036))

(assert (= (and mapNonEmpty!4026 (not condMapEmpty!4036)) mapNonEmpty!4036))

(assert (= (and mapNonEmpty!4036 ((_ is ValueCellFull!1008) mapValue!4036)) b!112210))

(assert (= (and mapNonEmpty!4026 ((_ is ValueCellFull!1008) mapDefault!4036)) b!112211))

(declare-fun m!128001 () Bool)

(assert (=> mapNonEmpty!4036 m!128001))

(declare-fun b_lambda!5027 () Bool)

(assert (= b_lambda!5021 (or (and b!111826 b_free!2573) (and b!111832 b_free!2575 (= (defaultEntry!2648 newMap!16) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))))) b_lambda!5027)))

(declare-fun b_lambda!5029 () Bool)

(assert (= b_lambda!5025 (or (and b!111826 b_free!2573) (and b!111832 b_free!2575 (= (defaultEntry!2648 newMap!16) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))))) b_lambda!5029)))

(declare-fun b_lambda!5031 () Bool)

(assert (= b_lambda!5023 (or (and b!111826 b_free!2573) (and b!111832 b_free!2575 (= (defaultEntry!2648 newMap!16) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))))) b_lambda!5031)))

(check-sat (not bm!11994) (not b!112174) (not b!112188) (not b!112180) (not b!112189) (not b!112182) (not b!112190) (not bm!11992) (not b!112194) (not d!31867) (not b!111910) (not bm!11985) (not d!31837) (not b!112097) (not b_lambda!5031) (not b!112181) (not bm!12024) (not b!112088) (not b!112193) (not d!31853) (not b!112175) (not b!112031) (not d!31857) (not d!31843) (not bm!11986) (not bm!12003) (not d!31851) (not b!112086) (not mapNonEmpty!4036) (not b!112081) (not d!31841) (not b_lambda!5029) (not mapNonEmpty!4035) (not b!112111) (not bm!11988) (not bm!12022) (not b!112131) (not bm!12031) (not b!112015) (not b!112119) (not b!111996) (not bm!12028) (not b!111908) (not bm!12023) (not b!112087) (not bm!11999) (not b!112085) (not b!112195) (not b_next!2573) (not b!112126) (not bm!12002) (not b!112201) (not b!112192) (not d!31865) (not b!112200) (not d!31855) (not b!112009) (not b!112118) (not b_next!2575) (not b_lambda!5019) (not b!112095) (not b!112003) (not bm!11987) (not b!111999) (not bm!12004) (not b!112179) b_and!6901 (not b!112191) (not b!112120) (not d!31839) (not bm!12020) (not bm!12034) (not b_lambda!5027) (not d!31875) (not bm!11990) (not b!112183) (not b!112089) (not b!112110) b_and!6899 tp_is_empty!2703 (not d!31861) (not b!112178) (not b!112147) (not bm!11991) (not b!112146) (not d!31871) (not d!31873) (not d!31869) (not b!112010) (not b!112144))
(check-sat b_and!6899 b_and!6901 (not b_next!2573) (not b_next!2575))
(get-model)

(declare-fun b!112221 () Bool)

(declare-fun e!72958 () Option!165)

(declare-fun e!72959 () Option!165)

(assert (=> b!112221 (= e!72958 e!72959)))

(declare-fun c!20047 () Bool)

(assert (=> b!112221 (= c!20047 (and ((_ is Cons!1630) (toList!813 lt!57989)) (not (= (_1!1234 (h!2230 (toList!813 lt!57989))) (_1!1234 lt!57733)))))))

(declare-fun b!112222 () Bool)

(assert (=> b!112222 (= e!72959 (getValueByKey!159 (t!5792 (toList!813 lt!57989)) (_1!1234 lt!57733)))))

(declare-fun b!112220 () Bool)

(assert (=> b!112220 (= e!72958 (Some!164 (_2!1234 (h!2230 (toList!813 lt!57989)))))))

(declare-fun b!112223 () Bool)

(assert (=> b!112223 (= e!72959 None!163)))

(declare-fun d!31885 () Bool)

(declare-fun c!20046 () Bool)

(assert (=> d!31885 (= c!20046 (and ((_ is Cons!1630) (toList!813 lt!57989)) (= (_1!1234 (h!2230 (toList!813 lt!57989))) (_1!1234 lt!57733))))))

(assert (=> d!31885 (= (getValueByKey!159 (toList!813 lt!57989) (_1!1234 lt!57733)) e!72958)))

(assert (= (and d!31885 c!20046) b!112220))

(assert (= (and d!31885 (not c!20046)) b!112221))

(assert (= (and b!112221 c!20047) b!112222))

(assert (= (and b!112221 (not c!20047)) b!112223))

(declare-fun m!128003 () Bool)

(assert (=> b!112222 m!128003))

(assert (=> b!112192 d!31885))

(declare-fun b!112225 () Bool)

(declare-fun e!72960 () Option!165)

(declare-fun e!72961 () Option!165)

(assert (=> b!112225 (= e!72960 e!72961)))

(declare-fun c!20049 () Bool)

(assert (=> b!112225 (= c!20049 (and ((_ is Cons!1630) (toList!813 lt!57993)) (not (= (_1!1234 (h!2230 (toList!813 lt!57993))) (_1!1234 lt!57726)))))))

(declare-fun b!112226 () Bool)

(assert (=> b!112226 (= e!72961 (getValueByKey!159 (t!5792 (toList!813 lt!57993)) (_1!1234 lt!57726)))))

(declare-fun b!112224 () Bool)

(assert (=> b!112224 (= e!72960 (Some!164 (_2!1234 (h!2230 (toList!813 lt!57993)))))))

(declare-fun b!112227 () Bool)

(assert (=> b!112227 (= e!72961 None!163)))

(declare-fun d!31887 () Bool)

(declare-fun c!20048 () Bool)

(assert (=> d!31887 (= c!20048 (and ((_ is Cons!1630) (toList!813 lt!57993)) (= (_1!1234 (h!2230 (toList!813 lt!57993))) (_1!1234 lt!57726))))))

(assert (=> d!31887 (= (getValueByKey!159 (toList!813 lt!57993) (_1!1234 lt!57726)) e!72960)))

(assert (= (and d!31887 c!20048) b!112224))

(assert (= (and d!31887 (not c!20048)) b!112225))

(assert (= (and b!112225 c!20049) b!112226))

(assert (= (and b!112225 (not c!20049)) b!112227))

(declare-fun m!128005 () Bool)

(assert (=> b!112226 m!128005))

(assert (=> b!112194 d!31887))

(declare-fun d!31889 () Bool)

(assert (=> d!31889 (= (get!1356 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112201 d!31889))

(declare-fun d!31891 () Bool)

(assert (=> d!31891 (= (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) (and (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112147 d!31891))

(declare-fun d!31893 () Bool)

(declare-fun res!55362 () Bool)

(declare-fun e!72966 () Bool)

(assert (=> d!31893 (=> res!55362 e!72966)))

(assert (=> d!31893 (= res!55362 (and ((_ is Cons!1630) (toList!813 lt!57729)) (= (_1!1234 (h!2230 (toList!813 lt!57729))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (=> d!31893 (= (containsKey!163 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) e!72966)))

(declare-fun b!112232 () Bool)

(declare-fun e!72967 () Bool)

(assert (=> b!112232 (= e!72966 e!72967)))

(declare-fun res!55363 () Bool)

(assert (=> b!112232 (=> (not res!55363) (not e!72967))))

(assert (=> b!112232 (= res!55363 (and (or (not ((_ is Cons!1630) (toList!813 lt!57729))) (bvsle (_1!1234 (h!2230 (toList!813 lt!57729))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355))) ((_ is Cons!1630) (toList!813 lt!57729)) (bvslt (_1!1234 (h!2230 (toList!813 lt!57729))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(declare-fun b!112233 () Bool)

(assert (=> b!112233 (= e!72967 (containsKey!163 (t!5792 (toList!813 lt!57729)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (= (and d!31893 (not res!55362)) b!112232))

(assert (= (and b!112232 res!55363) b!112233))

(assert (=> b!112233 m!127651))

(declare-fun m!128007 () Bool)

(assert (=> b!112233 m!128007))

(assert (=> d!31837 d!31893))

(declare-fun b!112235 () Bool)

(declare-fun e!72968 () Option!165)

(declare-fun e!72969 () Option!165)

(assert (=> b!112235 (= e!72968 e!72969)))

(declare-fun c!20051 () Bool)

(assert (=> b!112235 (= c!20051 (and ((_ is Cons!1630) (toList!813 lt!57981)) (not (= (_1!1234 (h!2230 (toList!813 lt!57981))) (_1!1234 lt!57726)))))))

(declare-fun b!112236 () Bool)

(assert (=> b!112236 (= e!72969 (getValueByKey!159 (t!5792 (toList!813 lt!57981)) (_1!1234 lt!57726)))))

(declare-fun b!112234 () Bool)

(assert (=> b!112234 (= e!72968 (Some!164 (_2!1234 (h!2230 (toList!813 lt!57981)))))))

(declare-fun b!112237 () Bool)

(assert (=> b!112237 (= e!72969 None!163)))

(declare-fun d!31895 () Bool)

(declare-fun c!20050 () Bool)

(assert (=> d!31895 (= c!20050 (and ((_ is Cons!1630) (toList!813 lt!57981)) (= (_1!1234 (h!2230 (toList!813 lt!57981))) (_1!1234 lt!57726))))))

(assert (=> d!31895 (= (getValueByKey!159 (toList!813 lt!57981) (_1!1234 lt!57726)) e!72968)))

(assert (= (and d!31895 c!20050) b!112234))

(assert (= (and d!31895 (not c!20050)) b!112235))

(assert (= (and b!112235 c!20051) b!112236))

(assert (= (and b!112235 (not c!20051)) b!112237))

(declare-fun m!128009 () Bool)

(assert (=> b!112236 m!128009))

(assert (=> b!112188 d!31895))

(assert (=> d!31843 d!31877))

(declare-fun d!31897 () Bool)

(declare-fun res!55364 () Bool)

(declare-fun e!72970 () Bool)

(assert (=> d!31897 (=> res!55364 e!72970)))

(assert (=> d!31897 (= res!55364 (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!31897 (= (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!72970)))

(declare-fun b!112238 () Bool)

(declare-fun e!72971 () Bool)

(assert (=> b!112238 (= e!72970 e!72971)))

(declare-fun res!55365 () Bool)

(assert (=> b!112238 (=> (not res!55365) (not e!72971))))

(assert (=> b!112238 (= res!55365 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112239 () Bool)

(assert (=> b!112239 (= e!72971 (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!31897 (not res!55364)) b!112238))

(assert (= (and b!112238 res!55365) b!112239))

(declare-fun m!128011 () Bool)

(assert (=> d!31897 m!128011))

(assert (=> b!112239 m!127651))

(declare-fun m!128013 () Bool)

(assert (=> b!112239 m!128013))

(assert (=> b!112126 d!31897))

(declare-fun b!112240 () Bool)

(declare-fun e!72972 () Bool)

(declare-fun call!12038 () Bool)

(assert (=> b!112240 (= e!72972 call!12038)))

(declare-fun b!112241 () Bool)

(declare-fun e!72974 () Bool)

(assert (=> b!112241 (= e!72974 call!12038)))

(declare-fun b!112242 () Bool)

(declare-fun e!72973 () Bool)

(assert (=> b!112242 (= e!72973 e!72972)))

(declare-fun c!20052 () Bool)

(assert (=> b!112242 (= c!20052 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!12035 () Bool)

(assert (=> bm!12035 (= call!12038 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4366 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112243 () Bool)

(assert (=> b!112243 (= e!72972 e!72974)))

(declare-fun lt!57999 () (_ BitVec 64))

(assert (=> b!112243 (= lt!57999 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!57998 () Unit!3485)

(assert (=> b!112243 (= lt!57998 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) lt!57999 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!112243 (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) lt!57999 #b00000000000000000000000000000000)))

(declare-fun lt!57997 () Unit!3485)

(assert (=> b!112243 (= lt!57997 lt!57998)))

(declare-fun res!55367 () Bool)

(assert (=> b!112243 (= res!55367 (= (seekEntryOrOpen!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4366 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992)))) (Found!262 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!112243 (=> (not res!55367) (not e!72974))))

(declare-fun d!31899 () Bool)

(declare-fun res!55366 () Bool)

(assert (=> d!31899 (=> res!55366 e!72973)))

(assert (=> d!31899 (= res!55366 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!31899 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4366 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992)))) e!72973)))

(assert (= (and d!31899 (not res!55366)) b!112242))

(assert (= (and b!112242 c!20052) b!112243))

(assert (= (and b!112242 (not c!20052)) b!112240))

(assert (= (and b!112243 res!55367) b!112241))

(assert (= (or b!112241 b!112240) bm!12035))

(declare-fun m!128015 () Bool)

(assert (=> b!112242 m!128015))

(assert (=> b!112242 m!128015))

(declare-fun m!128017 () Bool)

(assert (=> b!112242 m!128017))

(declare-fun m!128019 () Bool)

(assert (=> bm!12035 m!128019))

(assert (=> b!112243 m!128015))

(declare-fun m!128021 () Bool)

(assert (=> b!112243 m!128021))

(declare-fun m!128023 () Bool)

(assert (=> b!112243 m!128023))

(assert (=> b!112243 m!128015))

(declare-fun m!128025 () Bool)

(assert (=> b!112243 m!128025))

(assert (=> bm!12028 d!31899))

(declare-fun d!31901 () Bool)

(declare-fun e!72975 () Bool)

(assert (=> d!31901 e!72975))

(declare-fun res!55368 () Bool)

(assert (=> d!31901 (=> res!55368 e!72975)))

(declare-fun lt!58000 () Bool)

(assert (=> d!31901 (= res!55368 (not lt!58000))))

(declare-fun lt!58001 () Bool)

(assert (=> d!31901 (= lt!58000 lt!58001)))

(declare-fun lt!58002 () Unit!3485)

(declare-fun e!72976 () Unit!3485)

(assert (=> d!31901 (= lt!58002 e!72976)))

(declare-fun c!20053 () Bool)

(assert (=> d!31901 (= c!20053 lt!58001)))

(assert (=> d!31901 (= lt!58001 (containsKey!163 (toList!813 call!11994) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!31901 (= (contains!842 call!11994 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) lt!58000)))

(declare-fun b!112244 () Bool)

(declare-fun lt!58003 () Unit!3485)

(assert (=> b!112244 (= e!72976 lt!58003)))

(assert (=> b!112244 (= lt!58003 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 call!11994) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> b!112244 (isDefined!112 (getValueByKey!159 (toList!813 call!11994) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112245 () Bool)

(declare-fun Unit!3497 () Unit!3485)

(assert (=> b!112245 (= e!72976 Unit!3497)))

(declare-fun b!112246 () Bool)

(assert (=> b!112246 (= e!72975 (isDefined!112 (getValueByKey!159 (toList!813 call!11994) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (= (and d!31901 c!20053) b!112244))

(assert (= (and d!31901 (not c!20053)) b!112245))

(assert (= (and d!31901 (not res!55368)) b!112246))

(assert (=> d!31901 m!127651))

(declare-fun m!128027 () Bool)

(assert (=> d!31901 m!128027))

(assert (=> b!112244 m!127651))

(declare-fun m!128029 () Bool)

(assert (=> b!112244 m!128029))

(assert (=> b!112244 m!127651))

(declare-fun m!128031 () Bool)

(assert (=> b!112244 m!128031))

(assert (=> b!112244 m!128031))

(declare-fun m!128033 () Bool)

(assert (=> b!112244 m!128033))

(assert (=> b!112246 m!127651))

(assert (=> b!112246 m!128031))

(assert (=> b!112246 m!128031))

(assert (=> b!112246 m!128033))

(assert (=> b!112010 d!31901))

(declare-fun b!112248 () Bool)

(declare-fun e!72977 () Option!165)

(declare-fun e!72978 () Option!165)

(assert (=> b!112248 (= e!72977 e!72978)))

(declare-fun c!20055 () Bool)

(assert (=> b!112248 (= c!20055 (and ((_ is Cons!1630) (toList!813 lt!57985)) (not (= (_1!1234 (h!2230 (toList!813 lt!57985))) (_1!1234 lt!57733)))))))

(declare-fun b!112249 () Bool)

(assert (=> b!112249 (= e!72978 (getValueByKey!159 (t!5792 (toList!813 lt!57985)) (_1!1234 lt!57733)))))

(declare-fun b!112247 () Bool)

(assert (=> b!112247 (= e!72977 (Some!164 (_2!1234 (h!2230 (toList!813 lt!57985)))))))

(declare-fun b!112250 () Bool)

(assert (=> b!112250 (= e!72978 None!163)))

(declare-fun d!31903 () Bool)

(declare-fun c!20054 () Bool)

(assert (=> d!31903 (= c!20054 (and ((_ is Cons!1630) (toList!813 lt!57985)) (= (_1!1234 (h!2230 (toList!813 lt!57985))) (_1!1234 lt!57733))))))

(assert (=> d!31903 (= (getValueByKey!159 (toList!813 lt!57985) (_1!1234 lt!57733)) e!72977)))

(assert (= (and d!31903 c!20054) b!112247))

(assert (= (and d!31903 (not c!20054)) b!112248))

(assert (= (and b!112248 c!20055) b!112249))

(assert (= (and b!112248 (not c!20055)) b!112250))

(declare-fun m!128035 () Bool)

(assert (=> b!112249 m!128035))

(assert (=> b!112190 d!31903))

(declare-fun d!31905 () Bool)

(declare-fun e!72979 () Bool)

(assert (=> d!31905 e!72979))

(declare-fun res!55369 () Bool)

(assert (=> d!31905 (=> res!55369 e!72979)))

(declare-fun lt!58004 () Bool)

(assert (=> d!31905 (= res!55369 (not lt!58004))))

(declare-fun lt!58005 () Bool)

(assert (=> d!31905 (= lt!58004 lt!58005)))

(declare-fun lt!58006 () Unit!3485)

(declare-fun e!72980 () Unit!3485)

(assert (=> d!31905 (= lt!58006 e!72980)))

(declare-fun c!20056 () Bool)

(assert (=> d!31905 (= c!20056 lt!58005)))

(assert (=> d!31905 (= lt!58005 (containsKey!163 (toList!813 lt!57964) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31905 (= (contains!842 lt!57964 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58004)))

(declare-fun b!112251 () Bool)

(declare-fun lt!58007 () Unit!3485)

(assert (=> b!112251 (= e!72980 lt!58007)))

(assert (=> b!112251 (= lt!58007 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57964) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112251 (isDefined!112 (getValueByKey!159 (toList!813 lt!57964) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112252 () Bool)

(declare-fun Unit!3498 () Unit!3485)

(assert (=> b!112252 (= e!72980 Unit!3498)))

(declare-fun b!112253 () Bool)

(assert (=> b!112253 (= e!72979 (isDefined!112 (getValueByKey!159 (toList!813 lt!57964) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31905 c!20056) b!112251))

(assert (= (and d!31905 (not c!20056)) b!112252))

(assert (= (and d!31905 (not res!55369)) b!112253))

(declare-fun m!128037 () Bool)

(assert (=> d!31905 m!128037))

(declare-fun m!128039 () Bool)

(assert (=> b!112251 m!128039))

(declare-fun m!128041 () Bool)

(assert (=> b!112251 m!128041))

(assert (=> b!112251 m!128041))

(declare-fun m!128043 () Bool)

(assert (=> b!112251 m!128043))

(assert (=> b!112253 m!128041))

(assert (=> b!112253 m!128041))

(assert (=> b!112253 m!128043))

(assert (=> d!31865 d!31905))

(assert (=> d!31865 d!31877))

(assert (=> d!31857 d!31863))

(declare-fun d!31907 () Bool)

(assert (=> d!31907 (arrayNoDuplicates!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) from!355 Nil!1632)))

(assert (=> d!31907 true))

(declare-fun _$71!156 () Unit!3485)

(assert (=> d!31907 (= (choose!39 (_keys!4366 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!156)))

(declare-fun bs!4619 () Bool)

(assert (= bs!4619 d!31907))

(assert (=> bs!4619 m!127677))

(assert (=> d!31857 d!31907))

(declare-fun d!31909 () Bool)

(declare-fun e!72983 () Bool)

(assert (=> d!31909 e!72983))

(declare-fun res!55372 () Bool)

(assert (=> d!31909 (=> (not res!55372) (not e!72983))))

(assert (=> d!31909 (= res!55372 (and (bvsge (index!3200 lt!57840) #b00000000000000000000000000000000) (bvslt (index!3200 lt!57840) (size!2345 (_keys!4366 newMap!16)))))))

(declare-fun lt!58010 () Unit!3485)

(declare-fun choose!699 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 32) Int) Unit!3485)

(assert (=> d!31909 (= lt!58010 (choose!699 (_keys!4366 newMap!16) lt!57861 (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (index!3200 lt!57840) (defaultEntry!2648 newMap!16)))))

(assert (=> d!31909 (validMask!0 (mask!6826 newMap!16))))

(assert (=> d!31909 (= (lemmaValidKeyInArrayIsInListMap!111 (_keys!4366 newMap!16) lt!57861 (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (index!3200 lt!57840) (defaultEntry!2648 newMap!16)) lt!58010)))

(declare-fun b!112256 () Bool)

(assert (=> b!112256 (= e!72983 (contains!842 (getCurrentListMap!497 (_keys!4366 newMap!16) lt!57861 (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!57840))))))

(assert (= (and d!31909 res!55372) b!112256))

(declare-fun m!128045 () Bool)

(assert (=> d!31909 m!128045))

(declare-fun m!128047 () Bool)

(assert (=> d!31909 m!128047))

(declare-fun m!128049 () Bool)

(assert (=> b!112256 m!128049))

(assert (=> b!112256 m!127795))

(assert (=> b!112256 m!128049))

(assert (=> b!112256 m!127795))

(declare-fun m!128051 () Bool)

(assert (=> b!112256 m!128051))

(assert (=> b!111999 d!31909))

(declare-fun d!31911 () Bool)

(declare-fun e!72986 () Bool)

(assert (=> d!31911 e!72986))

(declare-fun res!55375 () Bool)

(assert (=> d!31911 (=> (not res!55375) (not e!72986))))

(assert (=> d!31911 (= res!55375 (and (bvsge (index!3200 lt!57840) #b00000000000000000000000000000000) (bvslt (index!3200 lt!57840) (size!2346 (_values!2631 newMap!16)))))))

(declare-fun lt!58013 () Unit!3485)

(declare-fun choose!700 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 32) (_ BitVec 64) V!3251 Int) Unit!3485)

(assert (=> d!31911 (= lt!58013 (choose!700 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (index!3200 lt!57840) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730 (defaultEntry!2648 newMap!16)))))

(assert (=> d!31911 (validMask!0 (mask!6826 newMap!16))))

(assert (=> d!31911 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (index!3200 lt!57840) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730 (defaultEntry!2648 newMap!16)) lt!58013)))

(declare-fun b!112259 () Bool)

(assert (=> b!112259 (= e!72986 (= (+!152 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) (getCurrentListMap!497 (_keys!4366 newMap!16) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16))) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16))))))

(assert (= (and d!31911 res!55375) b!112259))

(assert (=> d!31911 m!127651))

(declare-fun m!128053 () Bool)

(assert (=> d!31911 m!128053))

(assert (=> d!31911 m!128047))

(assert (=> b!112259 m!127773))

(assert (=> b!112259 m!127773))

(declare-fun m!128055 () Bool)

(assert (=> b!112259 m!128055))

(assert (=> b!112259 m!127777))

(declare-fun m!128057 () Bool)

(assert (=> b!112259 m!128057))

(assert (=> b!111999 d!31911))

(declare-fun d!31913 () Bool)

(declare-fun e!72987 () Bool)

(assert (=> d!31913 e!72987))

(declare-fun res!55376 () Bool)

(assert (=> d!31913 (=> res!55376 e!72987)))

(declare-fun lt!58014 () Bool)

(assert (=> d!31913 (= res!55376 (not lt!58014))))

(declare-fun lt!58015 () Bool)

(assert (=> d!31913 (= lt!58014 lt!58015)))

(declare-fun lt!58016 () Unit!3485)

(declare-fun e!72988 () Unit!3485)

(assert (=> d!31913 (= lt!58016 e!72988)))

(declare-fun c!20057 () Bool)

(assert (=> d!31913 (= c!20057 lt!58015)))

(assert (=> d!31913 (= lt!58015 (containsKey!163 (toList!813 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!31913 (= (contains!842 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) lt!58014)))

(declare-fun b!112260 () Bool)

(declare-fun lt!58017 () Unit!3485)

(assert (=> b!112260 (= e!72988 lt!58017)))

(assert (=> b!112260 (= lt!58017 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> b!112260 (isDefined!112 (getValueByKey!159 (toList!813 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112261 () Bool)

(declare-fun Unit!3499 () Unit!3485)

(assert (=> b!112261 (= e!72988 Unit!3499)))

(declare-fun b!112262 () Bool)

(assert (=> b!112262 (= e!72987 (isDefined!112 (getValueByKey!159 (toList!813 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (= (and d!31913 c!20057) b!112260))

(assert (= (and d!31913 (not c!20057)) b!112261))

(assert (= (and d!31913 (not res!55376)) b!112262))

(assert (=> d!31913 m!127651))

(declare-fun m!128059 () Bool)

(assert (=> d!31913 m!128059))

(assert (=> b!112260 m!127651))

(declare-fun m!128061 () Bool)

(assert (=> b!112260 m!128061))

(assert (=> b!112260 m!127651))

(declare-fun m!128063 () Bool)

(assert (=> b!112260 m!128063))

(assert (=> b!112260 m!128063))

(declare-fun m!128065 () Bool)

(assert (=> b!112260 m!128065))

(assert (=> b!112262 m!127651))

(assert (=> b!112262 m!128063))

(assert (=> b!112262 m!128063))

(assert (=> b!112262 m!128065))

(assert (=> b!111999 d!31913))

(declare-fun d!31915 () Bool)

(declare-fun e!72994 () Bool)

(assert (=> d!31915 e!72994))

(declare-fun res!55381 () Bool)

(assert (=> d!31915 (=> (not res!55381) (not e!72994))))

(assert (=> d!31915 (= res!55381 (or (bvsge #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))))

(declare-fun lt!58023 () ListLongMap!1595)

(declare-fun lt!58025 () ListLongMap!1595)

(assert (=> d!31915 (= lt!58023 lt!58025)))

(declare-fun lt!58035 () Unit!3485)

(declare-fun e!72990 () Unit!3485)

(assert (=> d!31915 (= lt!58035 e!72990)))

(declare-fun c!20060 () Bool)

(declare-fun e!72992 () Bool)

(assert (=> d!31915 (= c!20060 e!72992)))

(declare-fun res!55382 () Bool)

(assert (=> d!31915 (=> (not res!55382) (not e!72992))))

(assert (=> d!31915 (= res!55382 (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun e!73000 () ListLongMap!1595)

(assert (=> d!31915 (= lt!58025 e!73000)))

(declare-fun c!20063 () Bool)

(assert (=> d!31915 (= c!20063 (and (not (= (bvand (extraKeys!2441 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2441 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!31915 (validMask!0 (mask!6826 newMap!16))))

(assert (=> d!31915 (= (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) lt!58023)))

(declare-fun b!112263 () Bool)

(declare-fun e!72995 () ListLongMap!1595)

(declare-fun call!12041 () ListLongMap!1595)

(assert (=> b!112263 (= e!72995 call!12041)))

(declare-fun b!112264 () Bool)

(declare-fun e!72991 () ListLongMap!1595)

(assert (=> b!112264 (= e!72991 call!12041)))

(declare-fun b!112265 () Bool)

(declare-fun e!72997 () Bool)

(declare-fun e!72993 () Bool)

(assert (=> b!112265 (= e!72997 e!72993)))

(declare-fun res!55379 () Bool)

(assert (=> b!112265 (=> (not res!55379) (not e!72993))))

(assert (=> b!112265 (= res!55379 (contains!842 lt!58023 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!112265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun b!112266 () Bool)

(declare-fun e!73001 () Bool)

(declare-fun call!12042 () Bool)

(assert (=> b!112266 (= e!73001 (not call!12042))))

(declare-fun b!112267 () Bool)

(declare-fun Unit!3500 () Unit!3485)

(assert (=> b!112267 (= e!72990 Unit!3500)))

(declare-fun bm!12036 () Bool)

(declare-fun call!12039 () ListLongMap!1595)

(declare-fun call!12043 () ListLongMap!1595)

(assert (=> bm!12036 (= call!12039 call!12043)))

(declare-fun c!20058 () Bool)

(declare-fun call!12045 () ListLongMap!1595)

(declare-fun call!12044 () ListLongMap!1595)

(declare-fun bm!12037 () Bool)

(assert (=> bm!12037 (= call!12044 (+!152 (ite c!20063 call!12043 (ite c!20058 call!12039 call!12045)) (ite (or c!20063 c!20058) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 newMap!16)) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 newMap!16)))))))

(declare-fun b!112268 () Bool)

(declare-fun e!72996 () Bool)

(declare-fun e!72999 () Bool)

(assert (=> b!112268 (= e!72996 e!72999)))

(declare-fun res!55380 () Bool)

(declare-fun call!12040 () Bool)

(assert (=> b!112268 (= res!55380 call!12040)))

(assert (=> b!112268 (=> (not res!55380) (not e!72999))))

(declare-fun bm!12038 () Bool)

(assert (=> bm!12038 (= call!12045 call!12039)))

(declare-fun b!112269 () Bool)

(assert (=> b!112269 (= e!72999 (= (apply!101 lt!58023 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2517 newMap!16)))))

(declare-fun b!112270 () Bool)

(declare-fun lt!58019 () Unit!3485)

(assert (=> b!112270 (= e!72990 lt!58019)))

(declare-fun lt!58029 () ListLongMap!1595)

(assert (=> b!112270 (= lt!58029 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58028 () (_ BitVec 64))

(assert (=> b!112270 (= lt!58028 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58034 () (_ BitVec 64))

(assert (=> b!112270 (= lt!58034 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58018 () Unit!3485)

(assert (=> b!112270 (= lt!58018 (addStillContains!77 lt!58029 lt!58028 (zeroValue!2517 newMap!16) lt!58034))))

(assert (=> b!112270 (contains!842 (+!152 lt!58029 (tuple2!2447 lt!58028 (zeroValue!2517 newMap!16))) lt!58034)))

(declare-fun lt!58026 () Unit!3485)

(assert (=> b!112270 (= lt!58026 lt!58018)))

(declare-fun lt!58022 () ListLongMap!1595)

(assert (=> b!112270 (= lt!58022 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58037 () (_ BitVec 64))

(assert (=> b!112270 (= lt!58037 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58027 () (_ BitVec 64))

(assert (=> b!112270 (= lt!58027 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58038 () Unit!3485)

(assert (=> b!112270 (= lt!58038 (addApplyDifferent!77 lt!58022 lt!58037 (minValue!2517 newMap!16) lt!58027))))

(assert (=> b!112270 (= (apply!101 (+!152 lt!58022 (tuple2!2447 lt!58037 (minValue!2517 newMap!16))) lt!58027) (apply!101 lt!58022 lt!58027))))

(declare-fun lt!58036 () Unit!3485)

(assert (=> b!112270 (= lt!58036 lt!58038)))

(declare-fun lt!58024 () ListLongMap!1595)

(assert (=> b!112270 (= lt!58024 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58021 () (_ BitVec 64))

(assert (=> b!112270 (= lt!58021 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58020 () (_ BitVec 64))

(assert (=> b!112270 (= lt!58020 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58039 () Unit!3485)

(assert (=> b!112270 (= lt!58039 (addApplyDifferent!77 lt!58024 lt!58021 (zeroValue!2517 newMap!16) lt!58020))))

(assert (=> b!112270 (= (apply!101 (+!152 lt!58024 (tuple2!2447 lt!58021 (zeroValue!2517 newMap!16))) lt!58020) (apply!101 lt!58024 lt!58020))))

(declare-fun lt!58032 () Unit!3485)

(assert (=> b!112270 (= lt!58032 lt!58039)))

(declare-fun lt!58030 () ListLongMap!1595)

(assert (=> b!112270 (= lt!58030 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58033 () (_ BitVec 64))

(assert (=> b!112270 (= lt!58033 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58031 () (_ BitVec 64))

(assert (=> b!112270 (= lt!58031 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112270 (= lt!58019 (addApplyDifferent!77 lt!58030 lt!58033 (minValue!2517 newMap!16) lt!58031))))

(assert (=> b!112270 (= (apply!101 (+!152 lt!58030 (tuple2!2447 lt!58033 (minValue!2517 newMap!16))) lt!58031) (apply!101 lt!58030 lt!58031))))

(declare-fun b!112271 () Bool)

(assert (=> b!112271 (= e!72992 (validKeyInArray!0 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12039 () Bool)

(assert (=> bm!12039 (= call!12040 (contains!842 lt!58023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112272 () Bool)

(assert (=> b!112272 (= e!73000 (+!152 call!12044 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 newMap!16))))))

(declare-fun b!112273 () Bool)

(declare-fun e!72989 () Bool)

(assert (=> b!112273 (= e!72989 (= (apply!101 lt!58023 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2517 newMap!16)))))

(declare-fun b!112274 () Bool)

(assert (=> b!112274 (= e!72995 call!12045)))

(declare-fun b!112275 () Bool)

(assert (=> b!112275 (= e!73000 e!72991)))

(assert (=> b!112275 (= c!20058 (and (not (= (bvand (extraKeys!2441 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2441 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112276 () Bool)

(declare-fun res!55378 () Bool)

(assert (=> b!112276 (=> (not res!55378) (not e!72994))))

(assert (=> b!112276 (= res!55378 e!72997)))

(declare-fun res!55383 () Bool)

(assert (=> b!112276 (=> res!55383 e!72997)))

(declare-fun e!72998 () Bool)

(assert (=> b!112276 (= res!55383 (not e!72998))))

(declare-fun res!55384 () Bool)

(assert (=> b!112276 (=> (not res!55384) (not e!72998))))

(assert (=> b!112276 (= res!55384 (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun b!112277 () Bool)

(assert (=> b!112277 (= e!72996 (not call!12040))))

(declare-fun bm!12040 () Bool)

(assert (=> bm!12040 (= call!12043 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun b!112278 () Bool)

(assert (=> b!112278 (= e!72994 e!73001)))

(declare-fun c!20059 () Bool)

(assert (=> b!112278 (= c!20059 (not (= (bvand (extraKeys!2441 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112279 () Bool)

(assert (=> b!112279 (= e!72993 (= (apply!101 lt!58023 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)) (get!1353 (select (arr!2088 (_values!2631 newMap!16)) #b00000000000000000000000000000000) (dynLambda!391 (defaultEntry!2648 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2346 (_values!2631 newMap!16))))))

(assert (=> b!112279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun b!112280 () Bool)

(declare-fun c!20062 () Bool)

(assert (=> b!112280 (= c!20062 (and (not (= (bvand (extraKeys!2441 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2441 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!112280 (= e!72991 e!72995)))

(declare-fun bm!12041 () Bool)

(assert (=> bm!12041 (= call!12042 (contains!842 lt!58023 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112281 () Bool)

(assert (=> b!112281 (= e!72998 (validKeyInArray!0 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112282 () Bool)

(assert (=> b!112282 (= e!73001 e!72989)))

(declare-fun res!55377 () Bool)

(assert (=> b!112282 (= res!55377 call!12042)))

(assert (=> b!112282 (=> (not res!55377) (not e!72989))))

(declare-fun b!112283 () Bool)

(declare-fun res!55385 () Bool)

(assert (=> b!112283 (=> (not res!55385) (not e!72994))))

(assert (=> b!112283 (= res!55385 e!72996)))

(declare-fun c!20061 () Bool)

(assert (=> b!112283 (= c!20061 (not (= (bvand (extraKeys!2441 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12042 () Bool)

(assert (=> bm!12042 (= call!12041 call!12044)))

(assert (= (and d!31915 c!20063) b!112272))

(assert (= (and d!31915 (not c!20063)) b!112275))

(assert (= (and b!112275 c!20058) b!112264))

(assert (= (and b!112275 (not c!20058)) b!112280))

(assert (= (and b!112280 c!20062) b!112263))

(assert (= (and b!112280 (not c!20062)) b!112274))

(assert (= (or b!112263 b!112274) bm!12038))

(assert (= (or b!112264 bm!12038) bm!12036))

(assert (= (or b!112264 b!112263) bm!12042))

(assert (= (or b!112272 bm!12036) bm!12040))

(assert (= (or b!112272 bm!12042) bm!12037))

(assert (= (and d!31915 res!55382) b!112271))

(assert (= (and d!31915 c!20060) b!112270))

(assert (= (and d!31915 (not c!20060)) b!112267))

(assert (= (and d!31915 res!55381) b!112276))

(assert (= (and b!112276 res!55384) b!112281))

(assert (= (and b!112276 (not res!55383)) b!112265))

(assert (= (and b!112265 res!55379) b!112279))

(assert (= (and b!112276 res!55378) b!112283))

(assert (= (and b!112283 c!20061) b!112268))

(assert (= (and b!112283 (not c!20061)) b!112277))

(assert (= (and b!112268 res!55380) b!112269))

(assert (= (or b!112268 b!112277) bm!12039))

(assert (= (and b!112283 res!55385) b!112278))

(assert (= (and b!112278 c!20059) b!112282))

(assert (= (and b!112278 (not c!20059)) b!112266))

(assert (= (and b!112282 res!55377) b!112273))

(assert (= (or b!112282 b!112266) bm!12041))

(declare-fun b_lambda!5033 () Bool)

(assert (=> (not b_lambda!5033) (not b!112279)))

(declare-fun tb!2129 () Bool)

(declare-fun t!5801 () Bool)

(assert (=> (and b!111826 (= (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) (defaultEntry!2648 newMap!16)) t!5801) tb!2129))

(declare-fun result!3565 () Bool)

(assert (=> tb!2129 (= result!3565 tp_is_empty!2703)))

(assert (=> b!112279 t!5801))

(declare-fun b_and!6903 () Bool)

(assert (= b_and!6899 (and (=> t!5801 result!3565) b_and!6903)))

(declare-fun t!5803 () Bool)

(declare-fun tb!2131 () Bool)

(assert (=> (and b!111832 (= (defaultEntry!2648 newMap!16) (defaultEntry!2648 newMap!16)) t!5803) tb!2131))

(declare-fun result!3567 () Bool)

(assert (= result!3567 result!3565))

(assert (=> b!112279 t!5803))

(declare-fun b_and!6905 () Bool)

(assert (= b_and!6901 (and (=> t!5803 result!3567) b_and!6905)))

(declare-fun m!128067 () Bool)

(assert (=> bm!12040 m!128067))

(assert (=> d!31915 m!128047))

(declare-fun m!128069 () Bool)

(assert (=> b!112272 m!128069))

(declare-fun m!128071 () Bool)

(assert (=> bm!12037 m!128071))

(declare-fun m!128073 () Bool)

(assert (=> b!112270 m!128073))

(assert (=> b!112270 m!128067))

(declare-fun m!128075 () Bool)

(assert (=> b!112270 m!128075))

(declare-fun m!128077 () Bool)

(assert (=> b!112270 m!128077))

(declare-fun m!128079 () Bool)

(assert (=> b!112270 m!128079))

(declare-fun m!128081 () Bool)

(assert (=> b!112270 m!128081))

(declare-fun m!128083 () Bool)

(assert (=> b!112270 m!128083))

(declare-fun m!128085 () Bool)

(assert (=> b!112270 m!128085))

(declare-fun m!128087 () Bool)

(assert (=> b!112270 m!128087))

(declare-fun m!128089 () Bool)

(assert (=> b!112270 m!128089))

(declare-fun m!128091 () Bool)

(assert (=> b!112270 m!128091))

(declare-fun m!128093 () Bool)

(assert (=> b!112270 m!128093))

(assert (=> b!112270 m!128091))

(declare-fun m!128095 () Bool)

(assert (=> b!112270 m!128095))

(assert (=> b!112270 m!128087))

(declare-fun m!128097 () Bool)

(assert (=> b!112270 m!128097))

(declare-fun m!128099 () Bool)

(assert (=> b!112270 m!128099))

(assert (=> b!112270 m!128079))

(declare-fun m!128101 () Bool)

(assert (=> b!112270 m!128101))

(assert (=> b!112270 m!128077))

(declare-fun m!128103 () Bool)

(assert (=> b!112270 m!128103))

(declare-fun m!128105 () Bool)

(assert (=> bm!12039 m!128105))

(declare-fun m!128107 () Bool)

(assert (=> b!112273 m!128107))

(assert (=> b!112265 m!128073))

(assert (=> b!112265 m!128073))

(declare-fun m!128109 () Bool)

(assert (=> b!112265 m!128109))

(assert (=> b!112271 m!128073))

(assert (=> b!112271 m!128073))

(declare-fun m!128111 () Bool)

(assert (=> b!112271 m!128111))

(declare-fun m!128113 () Bool)

(assert (=> b!112269 m!128113))

(assert (=> b!112279 m!128073))

(declare-fun m!128115 () Bool)

(assert (=> b!112279 m!128115))

(declare-fun m!128117 () Bool)

(assert (=> b!112279 m!128117))

(declare-fun m!128119 () Bool)

(assert (=> b!112279 m!128119))

(assert (=> b!112279 m!128073))

(declare-fun m!128121 () Bool)

(assert (=> b!112279 m!128121))

(assert (=> b!112279 m!128115))

(assert (=> b!112279 m!128117))

(assert (=> b!112281 m!128073))

(assert (=> b!112281 m!128073))

(assert (=> b!112281 m!128111))

(declare-fun m!128123 () Bool)

(assert (=> bm!12041 m!128123))

(assert (=> b!111999 d!31915))

(assert (=> b!112131 d!31859))

(declare-fun d!31917 () Bool)

(declare-fun e!73004 () Bool)

(assert (=> d!31917 e!73004))

(declare-fun c!20066 () Bool)

(assert (=> d!31917 (= c!20066 (and (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!31917 true))

(declare-fun _$29!150 () Unit!3485)

(assert (=> d!31917 (= (choose!697 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))) _$29!150)))

(declare-fun b!112288 () Bool)

(assert (=> b!112288 (= e!73004 (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!112289 () Bool)

(assert (=> b!112289 (= e!73004 (ite (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!31917 c!20066) b!112288))

(assert (= (and d!31917 (not c!20066)) b!112289))

(assert (=> b!112288 m!127651))

(assert (=> b!112288 m!127681))

(assert (=> d!31861 d!31917))

(assert (=> d!31861 d!31877))

(declare-fun d!31919 () Bool)

(assert (=> d!31919 (= (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112097 d!31919))

(declare-fun d!31921 () Bool)

(assert (=> d!31921 (= (inRange!0 (ite c!19994 (ite c!19999 (index!3200 lt!57856) (ite c!19990 (index!3199 lt!57854) (index!3202 lt!57854))) (ite c!19997 (index!3200 lt!57839) (ite c!19989 (index!3199 lt!57845) (index!3202 lt!57845)))) (mask!6826 newMap!16)) (and (bvsge (ite c!19994 (ite c!19999 (index!3200 lt!57856) (ite c!19990 (index!3199 lt!57854) (index!3202 lt!57854))) (ite c!19997 (index!3200 lt!57839) (ite c!19989 (index!3199 lt!57845) (index!3202 lt!57845)))) #b00000000000000000000000000000000) (bvslt (ite c!19994 (ite c!19999 (index!3200 lt!57856) (ite c!19990 (index!3199 lt!57854) (index!3202 lt!57854))) (ite c!19997 (index!3200 lt!57839) (ite c!19989 (index!3199 lt!57845) (index!3202 lt!57845)))) (bvadd (mask!6826 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!11985 d!31921))

(declare-fun d!31923 () Bool)

(assert (=> d!31923 (= (map!1302 (_2!1235 lt!57844)) (getCurrentListMap!497 (_keys!4366 (_2!1235 lt!57844)) (_values!2631 (_2!1235 lt!57844)) (mask!6826 (_2!1235 lt!57844)) (extraKeys!2441 (_2!1235 lt!57844)) (zeroValue!2517 (_2!1235 lt!57844)) (minValue!2517 (_2!1235 lt!57844)) #b00000000000000000000000000000000 (defaultEntry!2648 (_2!1235 lt!57844))))))

(declare-fun bs!4620 () Bool)

(assert (= bs!4620 d!31923))

(declare-fun m!128125 () Bool)

(assert (=> bs!4620 m!128125))

(assert (=> bm!11991 d!31923))

(assert (=> b!112087 d!31919))

(declare-fun d!31925 () Bool)

(assert (=> d!31925 (isDefined!112 (getValueByKey!159 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun lt!58042 () Unit!3485)

(declare-fun choose!701 (List!1634 (_ BitVec 64)) Unit!3485)

(assert (=> d!31925 (= lt!58042 (choose!701 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun e!73007 () Bool)

(assert (=> d!31925 e!73007))

(declare-fun res!55388 () Bool)

(assert (=> d!31925 (=> (not res!55388) (not e!73007))))

(declare-fun isStrictlySorted!312 (List!1634) Bool)

(assert (=> d!31925 (= res!55388 (isStrictlySorted!312 (toList!813 lt!57729)))))

(assert (=> d!31925 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) lt!58042)))

(declare-fun b!112292 () Bool)

(assert (=> b!112292 (= e!73007 (containsKey!163 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (= (and d!31925 res!55388) b!112292))

(assert (=> d!31925 m!127651))

(assert (=> d!31925 m!127767))

(assert (=> d!31925 m!127767))

(assert (=> d!31925 m!127769))

(assert (=> d!31925 m!127651))

(declare-fun m!128127 () Bool)

(assert (=> d!31925 m!128127))

(declare-fun m!128129 () Bool)

(assert (=> d!31925 m!128129))

(assert (=> b!112292 m!127651))

(assert (=> b!112292 m!127763))

(assert (=> b!111908 d!31925))

(declare-fun d!31927 () Bool)

(declare-fun isEmpty!380 (Option!165) Bool)

(assert (=> d!31927 (= (isDefined!112 (getValueByKey!159 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355))) (not (isEmpty!380 (getValueByKey!159 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))))

(declare-fun bs!4621 () Bool)

(assert (= bs!4621 d!31927))

(assert (=> bs!4621 m!127767))

(declare-fun m!128131 () Bool)

(assert (=> bs!4621 m!128131))

(assert (=> b!111908 d!31927))

(declare-fun b!112294 () Bool)

(declare-fun e!73008 () Option!165)

(declare-fun e!73009 () Option!165)

(assert (=> b!112294 (= e!73008 e!73009)))

(declare-fun c!20068 () Bool)

(assert (=> b!112294 (= c!20068 (and ((_ is Cons!1630) (toList!813 lt!57729)) (not (= (_1!1234 (h!2230 (toList!813 lt!57729))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))))

(declare-fun b!112295 () Bool)

(assert (=> b!112295 (= e!73009 (getValueByKey!159 (t!5792 (toList!813 lt!57729)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112293 () Bool)

(assert (=> b!112293 (= e!73008 (Some!164 (_2!1234 (h!2230 (toList!813 lt!57729)))))))

(declare-fun b!112296 () Bool)

(assert (=> b!112296 (= e!73009 None!163)))

(declare-fun d!31929 () Bool)

(declare-fun c!20067 () Bool)

(assert (=> d!31929 (= c!20067 (and ((_ is Cons!1630) (toList!813 lt!57729)) (= (_1!1234 (h!2230 (toList!813 lt!57729))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355))))))

(assert (=> d!31929 (= (getValueByKey!159 (toList!813 lt!57729) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) e!73008)))

(assert (= (and d!31929 c!20067) b!112293))

(assert (= (and d!31929 (not c!20067)) b!112294))

(assert (= (and b!112294 c!20068) b!112295))

(assert (= (and b!112294 (not c!20068)) b!112296))

(assert (=> b!112295 m!127651))

(declare-fun m!128133 () Bool)

(assert (=> b!112295 m!128133))

(assert (=> b!111908 d!31929))

(assert (=> b!112178 d!31919))

(declare-fun d!31931 () Bool)

(declare-fun e!73015 () Bool)

(assert (=> d!31931 e!73015))

(declare-fun res!55393 () Bool)

(assert (=> d!31931 (=> (not res!55393) (not e!73015))))

(assert (=> d!31931 (= res!55393 (or (bvsge #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))))

(declare-fun lt!58048 () ListLongMap!1595)

(declare-fun lt!58050 () ListLongMap!1595)

(assert (=> d!31931 (= lt!58048 lt!58050)))

(declare-fun lt!58060 () Unit!3485)

(declare-fun e!73011 () Unit!3485)

(assert (=> d!31931 (= lt!58060 e!73011)))

(declare-fun c!20071 () Bool)

(declare-fun e!73013 () Bool)

(assert (=> d!31931 (= c!20071 e!73013)))

(declare-fun res!55394 () Bool)

(assert (=> d!31931 (=> (not res!55394) (not e!73013))))

(assert (=> d!31931 (= res!55394 (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun e!73021 () ListLongMap!1595)

(assert (=> d!31931 (= lt!58050 e!73021)))

(declare-fun c!20074 () Bool)

(assert (=> d!31931 (= c!20074 (and (not (= (bvand (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!31931 (validMask!0 (mask!6826 newMap!16))))

(assert (=> d!31931 (= (getCurrentListMap!497 (_keys!4366 newMap!16) (ite c!19992 (_values!2631 newMap!16) lt!57861) (mask!6826 newMap!16) (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16)) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) lt!58048)))

(declare-fun b!112297 () Bool)

(declare-fun e!73016 () ListLongMap!1595)

(declare-fun call!12048 () ListLongMap!1595)

(assert (=> b!112297 (= e!73016 call!12048)))

(declare-fun b!112298 () Bool)

(declare-fun e!73012 () ListLongMap!1595)

(assert (=> b!112298 (= e!73012 call!12048)))

(declare-fun b!112299 () Bool)

(declare-fun e!73018 () Bool)

(declare-fun e!73014 () Bool)

(assert (=> b!112299 (= e!73018 e!73014)))

(declare-fun res!55391 () Bool)

(assert (=> b!112299 (=> (not res!55391) (not e!73014))))

(assert (=> b!112299 (= res!55391 (contains!842 lt!58048 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!112299 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun b!112300 () Bool)

(declare-fun e!73022 () Bool)

(declare-fun call!12049 () Bool)

(assert (=> b!112300 (= e!73022 (not call!12049))))

(declare-fun b!112301 () Bool)

(declare-fun Unit!3501 () Unit!3485)

(assert (=> b!112301 (= e!73011 Unit!3501)))

(declare-fun bm!12043 () Bool)

(declare-fun call!12046 () ListLongMap!1595)

(declare-fun call!12050 () ListLongMap!1595)

(assert (=> bm!12043 (= call!12046 call!12050)))

(declare-fun c!20069 () Bool)

(declare-fun call!12051 () ListLongMap!1595)

(declare-fun bm!12044 () Bool)

(declare-fun call!12052 () ListLongMap!1595)

(assert (=> bm!12044 (= call!12051 (+!152 (ite c!20074 call!12050 (ite c!20069 call!12046 call!12052)) (ite (or c!20074 c!20069) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 newMap!16)))))))

(declare-fun b!112302 () Bool)

(declare-fun e!73017 () Bool)

(declare-fun e!73020 () Bool)

(assert (=> b!112302 (= e!73017 e!73020)))

(declare-fun res!55392 () Bool)

(declare-fun call!12047 () Bool)

(assert (=> b!112302 (= res!55392 call!12047)))

(assert (=> b!112302 (=> (not res!55392) (not e!73020))))

(declare-fun bm!12045 () Bool)

(assert (=> bm!12045 (= call!12052 call!12046)))

(declare-fun b!112303 () Bool)

(assert (=> b!112303 (= e!73020 (= (apply!101 lt!58048 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16))))))

(declare-fun b!112304 () Bool)

(declare-fun lt!58044 () Unit!3485)

(assert (=> b!112304 (= e!73011 lt!58044)))

(declare-fun lt!58054 () ListLongMap!1595)

(assert (=> b!112304 (= lt!58054 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (ite c!19992 (_values!2631 newMap!16) lt!57861) (mask!6826 newMap!16) (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16)) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58053 () (_ BitVec 64))

(assert (=> b!112304 (= lt!58053 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58059 () (_ BitVec 64))

(assert (=> b!112304 (= lt!58059 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58043 () Unit!3485)

(assert (=> b!112304 (= lt!58043 (addStillContains!77 lt!58054 lt!58053 (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16)) lt!58059))))

(assert (=> b!112304 (contains!842 (+!152 lt!58054 (tuple2!2447 lt!58053 (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16)))) lt!58059)))

(declare-fun lt!58051 () Unit!3485)

(assert (=> b!112304 (= lt!58051 lt!58043)))

(declare-fun lt!58047 () ListLongMap!1595)

(assert (=> b!112304 (= lt!58047 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (ite c!19992 (_values!2631 newMap!16) lt!57861) (mask!6826 newMap!16) (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16)) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58062 () (_ BitVec 64))

(assert (=> b!112304 (= lt!58062 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58052 () (_ BitVec 64))

(assert (=> b!112304 (= lt!58052 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58063 () Unit!3485)

(assert (=> b!112304 (= lt!58063 (addApplyDifferent!77 lt!58047 lt!58062 (minValue!2517 newMap!16) lt!58052))))

(assert (=> b!112304 (= (apply!101 (+!152 lt!58047 (tuple2!2447 lt!58062 (minValue!2517 newMap!16))) lt!58052) (apply!101 lt!58047 lt!58052))))

(declare-fun lt!58061 () Unit!3485)

(assert (=> b!112304 (= lt!58061 lt!58063)))

(declare-fun lt!58049 () ListLongMap!1595)

(assert (=> b!112304 (= lt!58049 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (ite c!19992 (_values!2631 newMap!16) lt!57861) (mask!6826 newMap!16) (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16)) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58046 () (_ BitVec 64))

(assert (=> b!112304 (= lt!58046 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58045 () (_ BitVec 64))

(assert (=> b!112304 (= lt!58045 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58064 () Unit!3485)

(assert (=> b!112304 (= lt!58064 (addApplyDifferent!77 lt!58049 lt!58046 (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16)) lt!58045))))

(assert (=> b!112304 (= (apply!101 (+!152 lt!58049 (tuple2!2447 lt!58046 (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16)))) lt!58045) (apply!101 lt!58049 lt!58045))))

(declare-fun lt!58057 () Unit!3485)

(assert (=> b!112304 (= lt!58057 lt!58064)))

(declare-fun lt!58055 () ListLongMap!1595)

(assert (=> b!112304 (= lt!58055 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (ite c!19992 (_values!2631 newMap!16) lt!57861) (mask!6826 newMap!16) (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16)) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58058 () (_ BitVec 64))

(assert (=> b!112304 (= lt!58058 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58056 () (_ BitVec 64))

(assert (=> b!112304 (= lt!58056 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112304 (= lt!58044 (addApplyDifferent!77 lt!58055 lt!58058 (minValue!2517 newMap!16) lt!58056))))

(assert (=> b!112304 (= (apply!101 (+!152 lt!58055 (tuple2!2447 lt!58058 (minValue!2517 newMap!16))) lt!58056) (apply!101 lt!58055 lt!58056))))

(declare-fun b!112305 () Bool)

(assert (=> b!112305 (= e!73013 (validKeyInArray!0 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12046 () Bool)

(assert (=> bm!12046 (= call!12047 (contains!842 lt!58048 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112306 () Bool)

(assert (=> b!112306 (= e!73021 (+!152 call!12051 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 newMap!16))))))

(declare-fun b!112307 () Bool)

(declare-fun e!73010 () Bool)

(assert (=> b!112307 (= e!73010 (= (apply!101 lt!58048 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2517 newMap!16)))))

(declare-fun b!112308 () Bool)

(assert (=> b!112308 (= e!73016 call!12052)))

(declare-fun b!112309 () Bool)

(assert (=> b!112309 (= e!73021 e!73012)))

(assert (=> b!112309 (= c!20069 (and (not (= (bvand (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112310 () Bool)

(declare-fun res!55390 () Bool)

(assert (=> b!112310 (=> (not res!55390) (not e!73015))))

(assert (=> b!112310 (= res!55390 e!73018)))

(declare-fun res!55395 () Bool)

(assert (=> b!112310 (=> res!55395 e!73018)))

(declare-fun e!73019 () Bool)

(assert (=> b!112310 (= res!55395 (not e!73019))))

(declare-fun res!55396 () Bool)

(assert (=> b!112310 (=> (not res!55396) (not e!73019))))

(assert (=> b!112310 (= res!55396 (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun b!112311 () Bool)

(assert (=> b!112311 (= e!73017 (not call!12047))))

(declare-fun bm!12047 () Bool)

(assert (=> bm!12047 (= call!12050 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (ite c!19992 (_values!2631 newMap!16) lt!57861) (mask!6826 newMap!16) (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) (ite (and c!19992 c!19988) lt!57730 (zeroValue!2517 newMap!16)) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun b!112312 () Bool)

(assert (=> b!112312 (= e!73015 e!73022)))

(declare-fun c!20070 () Bool)

(assert (=> b!112312 (= c!20070 (not (= (bvand (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112313 () Bool)

(assert (=> b!112313 (= e!73014 (= (apply!101 lt!58048 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)) (get!1353 (select (arr!2088 (ite c!19992 (_values!2631 newMap!16) lt!57861)) #b00000000000000000000000000000000) (dynLambda!391 (defaultEntry!2648 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2346 (ite c!19992 (_values!2631 newMap!16) lt!57861))))))

(assert (=> b!112313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun b!112314 () Bool)

(declare-fun c!20073 () Bool)

(assert (=> b!112314 (= c!20073 (and (not (= (bvand (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!112314 (= e!73012 e!73016)))

(declare-fun bm!12048 () Bool)

(assert (=> bm!12048 (= call!12049 (contains!842 lt!58048 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112315 () Bool)

(assert (=> b!112315 (= e!73019 (validKeyInArray!0 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112316 () Bool)

(assert (=> b!112316 (= e!73022 e!73010)))

(declare-fun res!55389 () Bool)

(assert (=> b!112316 (= res!55389 call!12049)))

(assert (=> b!112316 (=> (not res!55389) (not e!73010))))

(declare-fun b!112317 () Bool)

(declare-fun res!55397 () Bool)

(assert (=> b!112317 (=> (not res!55397) (not e!73015))))

(assert (=> b!112317 (= res!55397 e!73017)))

(declare-fun c!20072 () Bool)

(assert (=> b!112317 (= c!20072 (not (= (bvand (ite (and c!19992 c!19988) lt!57849 (extraKeys!2441 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12049 () Bool)

(assert (=> bm!12049 (= call!12048 call!12051)))

(assert (= (and d!31931 c!20074) b!112306))

(assert (= (and d!31931 (not c!20074)) b!112309))

(assert (= (and b!112309 c!20069) b!112298))

(assert (= (and b!112309 (not c!20069)) b!112314))

(assert (= (and b!112314 c!20073) b!112297))

(assert (= (and b!112314 (not c!20073)) b!112308))

(assert (= (or b!112297 b!112308) bm!12045))

(assert (= (or b!112298 bm!12045) bm!12043))

(assert (= (or b!112298 b!112297) bm!12049))

(assert (= (or b!112306 bm!12043) bm!12047))

(assert (= (or b!112306 bm!12049) bm!12044))

(assert (= (and d!31931 res!55394) b!112305))

(assert (= (and d!31931 c!20071) b!112304))

(assert (= (and d!31931 (not c!20071)) b!112301))

(assert (= (and d!31931 res!55393) b!112310))

(assert (= (and b!112310 res!55396) b!112315))

(assert (= (and b!112310 (not res!55395)) b!112299))

(assert (= (and b!112299 res!55391) b!112313))

(assert (= (and b!112310 res!55390) b!112317))

(assert (= (and b!112317 c!20072) b!112302))

(assert (= (and b!112317 (not c!20072)) b!112311))

(assert (= (and b!112302 res!55392) b!112303))

(assert (= (or b!112302 b!112311) bm!12046))

(assert (= (and b!112317 res!55397) b!112312))

(assert (= (and b!112312 c!20070) b!112316))

(assert (= (and b!112312 (not c!20070)) b!112300))

(assert (= (and b!112316 res!55389) b!112307))

(assert (= (or b!112316 b!112300) bm!12048))

(declare-fun b_lambda!5035 () Bool)

(assert (=> (not b_lambda!5035) (not b!112313)))

(assert (=> b!112313 t!5801))

(declare-fun b_and!6907 () Bool)

(assert (= b_and!6903 (and (=> t!5801 result!3565) b_and!6907)))

(assert (=> b!112313 t!5803))

(declare-fun b_and!6909 () Bool)

(assert (= b_and!6905 (and (=> t!5803 result!3567) b_and!6909)))

(declare-fun m!128135 () Bool)

(assert (=> bm!12047 m!128135))

(assert (=> d!31931 m!128047))

(declare-fun m!128137 () Bool)

(assert (=> b!112306 m!128137))

(declare-fun m!128139 () Bool)

(assert (=> bm!12044 m!128139))

(assert (=> b!112304 m!128073))

(assert (=> b!112304 m!128135))

(declare-fun m!128141 () Bool)

(assert (=> b!112304 m!128141))

(declare-fun m!128143 () Bool)

(assert (=> b!112304 m!128143))

(declare-fun m!128145 () Bool)

(assert (=> b!112304 m!128145))

(declare-fun m!128147 () Bool)

(assert (=> b!112304 m!128147))

(declare-fun m!128149 () Bool)

(assert (=> b!112304 m!128149))

(declare-fun m!128151 () Bool)

(assert (=> b!112304 m!128151))

(declare-fun m!128153 () Bool)

(assert (=> b!112304 m!128153))

(declare-fun m!128155 () Bool)

(assert (=> b!112304 m!128155))

(declare-fun m!128157 () Bool)

(assert (=> b!112304 m!128157))

(declare-fun m!128159 () Bool)

(assert (=> b!112304 m!128159))

(assert (=> b!112304 m!128157))

(declare-fun m!128161 () Bool)

(assert (=> b!112304 m!128161))

(assert (=> b!112304 m!128153))

(declare-fun m!128163 () Bool)

(assert (=> b!112304 m!128163))

(declare-fun m!128165 () Bool)

(assert (=> b!112304 m!128165))

(assert (=> b!112304 m!128145))

(declare-fun m!128167 () Bool)

(assert (=> b!112304 m!128167))

(assert (=> b!112304 m!128143))

(declare-fun m!128169 () Bool)

(assert (=> b!112304 m!128169))

(declare-fun m!128171 () Bool)

(assert (=> bm!12046 m!128171))

(declare-fun m!128173 () Bool)

(assert (=> b!112307 m!128173))

(assert (=> b!112299 m!128073))

(assert (=> b!112299 m!128073))

(declare-fun m!128175 () Bool)

(assert (=> b!112299 m!128175))

(assert (=> b!112305 m!128073))

(assert (=> b!112305 m!128073))

(assert (=> b!112305 m!128111))

(declare-fun m!128177 () Bool)

(assert (=> b!112303 m!128177))

(assert (=> b!112313 m!128073))

(declare-fun m!128179 () Bool)

(assert (=> b!112313 m!128179))

(assert (=> b!112313 m!128117))

(declare-fun m!128181 () Bool)

(assert (=> b!112313 m!128181))

(assert (=> b!112313 m!128073))

(declare-fun m!128183 () Bool)

(assert (=> b!112313 m!128183))

(assert (=> b!112313 m!128179))

(assert (=> b!112313 m!128117))

(assert (=> b!112315 m!128073))

(assert (=> b!112315 m!128073))

(assert (=> b!112315 m!128111))

(declare-fun m!128185 () Bool)

(assert (=> bm!12048 m!128185))

(assert (=> bm!11992 d!31931))

(declare-fun d!31933 () Bool)

(declare-fun e!73023 () Bool)

(assert (=> d!31933 e!73023))

(declare-fun res!55398 () Bool)

(assert (=> d!31933 (=> res!55398 e!73023)))

(declare-fun lt!58065 () Bool)

(assert (=> d!31933 (= res!55398 (not lt!58065))))

(declare-fun lt!58066 () Bool)

(assert (=> d!31933 (= lt!58065 lt!58066)))

(declare-fun lt!58067 () Unit!3485)

(declare-fun e!73024 () Unit!3485)

(assert (=> d!31933 (= lt!58067 e!73024)))

(declare-fun c!20075 () Bool)

(assert (=> d!31933 (= c!20075 lt!58066)))

(assert (=> d!31933 (= lt!58066 (containsKey!163 (toList!813 lt!57964) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!31933 (= (contains!842 lt!57964 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!58065)))

(declare-fun b!112318 () Bool)

(declare-fun lt!58068 () Unit!3485)

(assert (=> b!112318 (= e!73024 lt!58068)))

(assert (=> b!112318 (= lt!58068 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57964) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112318 (isDefined!112 (getValueByKey!159 (toList!813 lt!57964) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!112319 () Bool)

(declare-fun Unit!3502 () Unit!3485)

(assert (=> b!112319 (= e!73024 Unit!3502)))

(declare-fun b!112320 () Bool)

(assert (=> b!112320 (= e!73023 (isDefined!112 (getValueByKey!159 (toList!813 lt!57964) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!31933 c!20075) b!112318))

(assert (= (and d!31933 (not c!20075)) b!112319))

(assert (= (and d!31933 (not res!55398)) b!112320))

(assert (=> d!31933 m!127831))

(declare-fun m!128187 () Bool)

(assert (=> d!31933 m!128187))

(assert (=> b!112318 m!127831))

(declare-fun m!128189 () Bool)

(assert (=> b!112318 m!128189))

(assert (=> b!112318 m!127831))

(declare-fun m!128191 () Bool)

(assert (=> b!112318 m!128191))

(assert (=> b!112318 m!128191))

(declare-fun m!128193 () Bool)

(assert (=> b!112318 m!128193))

(assert (=> b!112320 m!127831))

(assert (=> b!112320 m!128191))

(assert (=> b!112320 m!128191))

(assert (=> b!112320 m!128193))

(assert (=> b!112174 d!31933))

(declare-fun d!31935 () Bool)

(declare-fun e!73025 () Bool)

(assert (=> d!31935 e!73025))

(declare-fun res!55399 () Bool)

(assert (=> d!31935 (=> (not res!55399) (not e!73025))))

(declare-fun lt!58072 () ListLongMap!1595)

(assert (=> d!31935 (= res!55399 (contains!842 lt!58072 (_1!1234 (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))))

(declare-fun lt!58070 () List!1634)

(assert (=> d!31935 (= lt!58072 (ListLongMap!1596 lt!58070))))

(declare-fun lt!58071 () Unit!3485)

(declare-fun lt!58069 () Unit!3485)

(assert (=> d!31935 (= lt!58071 lt!58069)))

(assert (=> d!31935 (= (getValueByKey!159 lt!58070 (_1!1234 (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))) (Some!164 (_2!1234 (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))))

(assert (=> d!31935 (= lt!58069 (lemmaContainsTupThenGetReturnValue!75 lt!58070 (_1!1234 (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))) (_2!1234 (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))))

(assert (=> d!31935 (= lt!58070 (insertStrictlySorted!78 (toList!813 e!72838) (_1!1234 (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))) (_2!1234 (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))))

(assert (=> d!31935 (= (+!152 e!72838 (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))) lt!58072)))

(declare-fun b!112321 () Bool)

(declare-fun res!55400 () Bool)

(assert (=> b!112321 (=> (not res!55400) (not e!73025))))

(assert (=> b!112321 (= res!55400 (= (getValueByKey!159 (toList!813 lt!58072) (_1!1234 (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))) (Some!164 (_2!1234 (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))))

(declare-fun b!112322 () Bool)

(assert (=> b!112322 (= e!73025 (contains!845 (toList!813 lt!58072) (ite c!19992 (ite c!19988 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(assert (= (and d!31935 res!55399) b!112321))

(assert (= (and b!112321 res!55400) b!112322))

(declare-fun m!128195 () Bool)

(assert (=> d!31935 m!128195))

(declare-fun m!128197 () Bool)

(assert (=> d!31935 m!128197))

(declare-fun m!128199 () Bool)

(assert (=> d!31935 m!128199))

(declare-fun m!128201 () Bool)

(assert (=> d!31935 m!128201))

(declare-fun m!128203 () Bool)

(assert (=> b!112321 m!128203))

(declare-fun m!128205 () Bool)

(assert (=> b!112322 m!128205))

(assert (=> bm!12002 d!31935))

(declare-fun d!31937 () Bool)

(declare-fun e!73026 () Bool)

(assert (=> d!31937 e!73026))

(declare-fun res!55401 () Bool)

(assert (=> d!31937 (=> res!55401 e!73026)))

(declare-fun lt!58073 () Bool)

(assert (=> d!31937 (= res!55401 (not lt!58073))))

(declare-fun lt!58074 () Bool)

(assert (=> d!31937 (= lt!58073 lt!58074)))

(declare-fun lt!58075 () Unit!3485)

(declare-fun e!73027 () Unit!3485)

(assert (=> d!31937 (= lt!58075 e!73027)))

(declare-fun c!20076 () Bool)

(assert (=> d!31937 (= c!20076 lt!58074)))

(assert (=> d!31937 (= lt!58074 (containsKey!163 (toList!813 lt!57981) (_1!1234 lt!57726)))))

(assert (=> d!31937 (= (contains!842 lt!57981 (_1!1234 lt!57726)) lt!58073)))

(declare-fun b!112323 () Bool)

(declare-fun lt!58076 () Unit!3485)

(assert (=> b!112323 (= e!73027 lt!58076)))

(assert (=> b!112323 (= lt!58076 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57981) (_1!1234 lt!57726)))))

(assert (=> b!112323 (isDefined!112 (getValueByKey!159 (toList!813 lt!57981) (_1!1234 lt!57726)))))

(declare-fun b!112324 () Bool)

(declare-fun Unit!3503 () Unit!3485)

(assert (=> b!112324 (= e!73027 Unit!3503)))

(declare-fun b!112325 () Bool)

(assert (=> b!112325 (= e!73026 (isDefined!112 (getValueByKey!159 (toList!813 lt!57981) (_1!1234 lt!57726))))))

(assert (= (and d!31937 c!20076) b!112323))

(assert (= (and d!31937 (not c!20076)) b!112324))

(assert (= (and d!31937 (not res!55401)) b!112325))

(declare-fun m!128207 () Bool)

(assert (=> d!31937 m!128207))

(declare-fun m!128209 () Bool)

(assert (=> b!112323 m!128209))

(assert (=> b!112323 m!127945))

(assert (=> b!112323 m!127945))

(declare-fun m!128211 () Bool)

(assert (=> b!112323 m!128211))

(assert (=> b!112325 m!127945))

(assert (=> b!112325 m!127945))

(assert (=> b!112325 m!128211))

(assert (=> d!31867 d!31937))

(declare-fun b!112327 () Bool)

(declare-fun e!73028 () Option!165)

(declare-fun e!73029 () Option!165)

(assert (=> b!112327 (= e!73028 e!73029)))

(declare-fun c!20078 () Bool)

(assert (=> b!112327 (= c!20078 (and ((_ is Cons!1630) lt!57979) (not (= (_1!1234 (h!2230 lt!57979)) (_1!1234 lt!57726)))))))

(declare-fun b!112328 () Bool)

(assert (=> b!112328 (= e!73029 (getValueByKey!159 (t!5792 lt!57979) (_1!1234 lt!57726)))))

(declare-fun b!112326 () Bool)

(assert (=> b!112326 (= e!73028 (Some!164 (_2!1234 (h!2230 lt!57979))))))

(declare-fun b!112329 () Bool)

(assert (=> b!112329 (= e!73029 None!163)))

(declare-fun d!31939 () Bool)

(declare-fun c!20077 () Bool)

(assert (=> d!31939 (= c!20077 (and ((_ is Cons!1630) lt!57979) (= (_1!1234 (h!2230 lt!57979)) (_1!1234 lt!57726))))))

(assert (=> d!31939 (= (getValueByKey!159 lt!57979 (_1!1234 lt!57726)) e!73028)))

(assert (= (and d!31939 c!20077) b!112326))

(assert (= (and d!31939 (not c!20077)) b!112327))

(assert (= (and b!112327 c!20078) b!112328))

(assert (= (and b!112327 (not c!20078)) b!112329))

(declare-fun m!128213 () Bool)

(assert (=> b!112328 m!128213))

(assert (=> d!31867 d!31939))

(declare-fun d!31941 () Bool)

(assert (=> d!31941 (= (getValueByKey!159 lt!57979 (_1!1234 lt!57726)) (Some!164 (_2!1234 lt!57726)))))

(declare-fun lt!58079 () Unit!3485)

(declare-fun choose!702 (List!1634 (_ BitVec 64) V!3251) Unit!3485)

(assert (=> d!31941 (= lt!58079 (choose!702 lt!57979 (_1!1234 lt!57726) (_2!1234 lt!57726)))))

(declare-fun e!73032 () Bool)

(assert (=> d!31941 e!73032))

(declare-fun res!55406 () Bool)

(assert (=> d!31941 (=> (not res!55406) (not e!73032))))

(assert (=> d!31941 (= res!55406 (isStrictlySorted!312 lt!57979))))

(assert (=> d!31941 (= (lemmaContainsTupThenGetReturnValue!75 lt!57979 (_1!1234 lt!57726) (_2!1234 lt!57726)) lt!58079)))

(declare-fun b!112334 () Bool)

(declare-fun res!55407 () Bool)

(assert (=> b!112334 (=> (not res!55407) (not e!73032))))

(assert (=> b!112334 (= res!55407 (containsKey!163 lt!57979 (_1!1234 lt!57726)))))

(declare-fun b!112335 () Bool)

(assert (=> b!112335 (= e!73032 (contains!845 lt!57979 (tuple2!2447 (_1!1234 lt!57726) (_2!1234 lt!57726))))))

(assert (= (and d!31941 res!55406) b!112334))

(assert (= (and b!112334 res!55407) b!112335))

(assert (=> d!31941 m!127939))

(declare-fun m!128215 () Bool)

(assert (=> d!31941 m!128215))

(declare-fun m!128217 () Bool)

(assert (=> d!31941 m!128217))

(declare-fun m!128219 () Bool)

(assert (=> b!112334 m!128219))

(declare-fun m!128221 () Bool)

(assert (=> b!112335 m!128221))

(assert (=> d!31867 d!31941))

(declare-fun b!112356 () Bool)

(declare-fun e!73045 () List!1634)

(declare-fun call!12059 () List!1634)

(assert (=> b!112356 (= e!73045 call!12059)))

(declare-fun c!20089 () Bool)

(declare-fun e!73046 () List!1634)

(declare-fun b!112357 () Bool)

(declare-fun c!20088 () Bool)

(assert (=> b!112357 (= e!73046 (ite c!20089 (t!5792 (toList!813 lt!57731)) (ite c!20088 (Cons!1630 (h!2230 (toList!813 lt!57731)) (t!5792 (toList!813 lt!57731))) Nil!1631)))))

(declare-fun b!112358 () Bool)

(assert (=> b!112358 (= e!73046 (insertStrictlySorted!78 (t!5792 (toList!813 lt!57731)) (_1!1234 lt!57726) (_2!1234 lt!57726)))))

(declare-fun b!112359 () Bool)

(declare-fun e!73047 () Bool)

(declare-fun lt!58082 () List!1634)

(assert (=> b!112359 (= e!73047 (contains!845 lt!58082 (tuple2!2447 (_1!1234 lt!57726) (_2!1234 lt!57726))))))

(declare-fun b!112360 () Bool)

(declare-fun res!55412 () Bool)

(assert (=> b!112360 (=> (not res!55412) (not e!73047))))

(assert (=> b!112360 (= res!55412 (containsKey!163 lt!58082 (_1!1234 lt!57726)))))

(declare-fun b!112361 () Bool)

(declare-fun e!73044 () List!1634)

(assert (=> b!112361 (= e!73044 e!73045)))

(assert (=> b!112361 (= c!20089 (and ((_ is Cons!1630) (toList!813 lt!57731)) (= (_1!1234 (h!2230 (toList!813 lt!57731))) (_1!1234 lt!57726))))))

(declare-fun bm!12056 () Bool)

(declare-fun call!12061 () List!1634)

(assert (=> bm!12056 (= call!12059 call!12061)))

(declare-fun b!112362 () Bool)

(declare-fun e!73043 () List!1634)

(declare-fun call!12060 () List!1634)

(assert (=> b!112362 (= e!73043 call!12060)))

(declare-fun d!31943 () Bool)

(assert (=> d!31943 e!73047))

(declare-fun res!55413 () Bool)

(assert (=> d!31943 (=> (not res!55413) (not e!73047))))

(assert (=> d!31943 (= res!55413 (isStrictlySorted!312 lt!58082))))

(assert (=> d!31943 (= lt!58082 e!73044)))

(declare-fun c!20087 () Bool)

(assert (=> d!31943 (= c!20087 (and ((_ is Cons!1630) (toList!813 lt!57731)) (bvslt (_1!1234 (h!2230 (toList!813 lt!57731))) (_1!1234 lt!57726))))))

(assert (=> d!31943 (isStrictlySorted!312 (toList!813 lt!57731))))

(assert (=> d!31943 (= (insertStrictlySorted!78 (toList!813 lt!57731) (_1!1234 lt!57726) (_2!1234 lt!57726)) lt!58082)))

(declare-fun bm!12057 () Bool)

(assert (=> bm!12057 (= call!12060 call!12059)))

(declare-fun b!112363 () Bool)

(assert (=> b!112363 (= c!20088 (and ((_ is Cons!1630) (toList!813 lt!57731)) (bvsgt (_1!1234 (h!2230 (toList!813 lt!57731))) (_1!1234 lt!57726))))))

(assert (=> b!112363 (= e!73045 e!73043)))

(declare-fun b!112364 () Bool)

(assert (=> b!112364 (= e!73044 call!12061)))

(declare-fun b!112365 () Bool)

(assert (=> b!112365 (= e!73043 call!12060)))

(declare-fun bm!12058 () Bool)

(declare-fun $colon$colon!84 (List!1634 tuple2!2446) List!1634)

(assert (=> bm!12058 (= call!12061 ($colon$colon!84 e!73046 (ite c!20087 (h!2230 (toList!813 lt!57731)) (tuple2!2447 (_1!1234 lt!57726) (_2!1234 lt!57726)))))))

(declare-fun c!20090 () Bool)

(assert (=> bm!12058 (= c!20090 c!20087)))

(assert (= (and d!31943 c!20087) b!112364))

(assert (= (and d!31943 (not c!20087)) b!112361))

(assert (= (and b!112361 c!20089) b!112356))

(assert (= (and b!112361 (not c!20089)) b!112363))

(assert (= (and b!112363 c!20088) b!112362))

(assert (= (and b!112363 (not c!20088)) b!112365))

(assert (= (or b!112362 b!112365) bm!12057))

(assert (= (or b!112356 bm!12057) bm!12056))

(assert (= (or b!112364 bm!12056) bm!12058))

(assert (= (and bm!12058 c!20090) b!112358))

(assert (= (and bm!12058 (not c!20090)) b!112357))

(assert (= (and d!31943 res!55413) b!112360))

(assert (= (and b!112360 res!55412) b!112359))

(declare-fun m!128223 () Bool)

(assert (=> b!112360 m!128223))

(declare-fun m!128225 () Bool)

(assert (=> bm!12058 m!128225))

(declare-fun m!128227 () Bool)

(assert (=> b!112359 m!128227))

(declare-fun m!128229 () Bool)

(assert (=> b!112358 m!128229))

(declare-fun m!128231 () Bool)

(assert (=> d!31943 m!128231))

(declare-fun m!128233 () Bool)

(assert (=> d!31943 m!128233))

(assert (=> d!31867 d!31943))

(declare-fun d!31945 () Bool)

(declare-fun get!1357 (Option!165) V!3251)

(assert (=> d!31945 (= (apply!101 lt!57914 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1357 (getValueByKey!159 (toList!813 lt!57914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4622 () Bool)

(assert (= bs!4622 d!31945))

(declare-fun m!128235 () Bool)

(assert (=> bs!4622 m!128235))

(assert (=> bs!4622 m!128235))

(declare-fun m!128237 () Bool)

(assert (=> bs!4622 m!128237))

(assert (=> b!112085 d!31945))

(declare-fun b!112400 () Bool)

(declare-fun c!20101 () Bool)

(declare-fun lt!58163 () SeekEntryResult!262)

(assert (=> b!112400 (= c!20101 ((_ is MissingVacant!262) lt!58163))))

(declare-fun e!73068 () Bool)

(declare-fun e!73066 () Bool)

(assert (=> b!112400 (= e!73068 e!73066)))

(declare-fun e!73069 () Bool)

(declare-fun b!112401 () Bool)

(declare-fun lt!58152 () SeekEntryResult!262)

(assert (=> b!112401 (= e!73069 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!58152)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112402 () Bool)

(declare-fun res!55440 () Bool)

(declare-fun e!73071 () Bool)

(assert (=> b!112402 (=> (not res!55440) (not e!73071))))

(declare-fun lt!58161 () tuple2!2448)

(assert (=> b!112402 (= res!55440 (valid!432 (_2!1235 lt!58161)))))

(declare-fun call!12070 () SeekEntryResult!262)

(declare-fun bm!12067 () Bool)

(assert (=> bm!12067 (= call!12070 (seekEntryOrOpen!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4366 newMap!16) (mask!6826 newMap!16)))))

(declare-fun d!31947 () Bool)

(assert (=> d!31947 e!73071))

(declare-fun res!55439 () Bool)

(assert (=> d!31947 (=> (not res!55439) (not e!73071))))

(assert (=> d!31947 (= res!55439 (_1!1235 lt!58161))))

(assert (=> d!31947 (= lt!58161 (tuple2!2449 true (LongMapFixedSize!925 (defaultEntry!2648 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (bvadd (_size!511 newMap!16) #b00000000000000000000000000000001) (array!4404 (store (arr!2087 (_keys!4366 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2345 (_keys!4366 newMap!16))) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16))) (_vacant!511 newMap!16))))))

(declare-fun lt!58151 () Unit!3485)

(declare-fun lt!58147 () Unit!3485)

(assert (=> d!31947 (= lt!58151 lt!58147)))

(declare-fun lt!58149 () array!4403)

(declare-fun lt!58156 () array!4405)

(assert (=> d!31947 (contains!842 (getCurrentListMap!497 lt!58149 lt!58156 (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) (select (store (arr!2087 (_keys!4366 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840))))))

(assert (=> d!31947 (= lt!58147 (lemmaValidKeyInArrayIsInListMap!111 lt!58149 lt!58156 (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (defaultEntry!2648 newMap!16)))))

(assert (=> d!31947 (= lt!58156 (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16))))))

(assert (=> d!31947 (= lt!58149 (array!4404 (store (arr!2087 (_keys!4366 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2345 (_keys!4366 newMap!16))))))

(declare-fun lt!58144 () Unit!3485)

(declare-fun lt!58164 () Unit!3485)

(assert (=> d!31947 (= lt!58144 lt!58164)))

(declare-fun lt!58145 () array!4403)

(assert (=> d!31947 (= (arrayCountValidKeys!0 lt!58145 (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (bvadd (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4403 (_ BitVec 32)) Unit!3485)

(assert (=> d!31947 (= lt!58164 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!58145 (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840))))))

(assert (=> d!31947 (= lt!58145 (array!4404 (store (arr!2087 (_keys!4366 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2345 (_keys!4366 newMap!16))))))

(declare-fun lt!58160 () Unit!3485)

(declare-fun lt!58168 () Unit!3485)

(assert (=> d!31947 (= lt!58160 lt!58168)))

(declare-fun lt!58159 () array!4403)

(assert (=> d!31947 (arrayContainsKey!0 lt!58159 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!31947 (= lt!58168 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!58159 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840))))))

(assert (=> d!31947 (= lt!58159 (array!4404 (store (arr!2087 (_keys!4366 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2345 (_keys!4366 newMap!16))))))

(declare-fun lt!58162 () Unit!3485)

(declare-fun lt!58150 () Unit!3485)

(assert (=> d!31947 (= lt!58162 lt!58150)))

(assert (=> d!31947 (= (+!152 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) (getCurrentListMap!497 (array!4404 (store (arr!2087 (_keys!4366 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2345 (_keys!4366 newMap!16))) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16))) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!33 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 32) (_ BitVec 64) V!3251 Int) Unit!3485)

(assert (=> d!31947 (= lt!58150 (lemmaAddValidKeyToArrayThenAddPairToListMap!33 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58143 () Unit!3485)

(declare-fun lt!58166 () Unit!3485)

(assert (=> d!31947 (= lt!58143 lt!58166)))

(assert (=> d!31947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4404 (store (arr!2087 (_keys!4366 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2345 (_keys!4366 newMap!16))) (mask!6826 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4403 (_ BitVec 32) (_ BitVec 32)) Unit!3485)

(assert (=> d!31947 (= lt!58166 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4366 newMap!16) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (mask!6826 newMap!16)))))

(declare-fun lt!58172 () Unit!3485)

(declare-fun lt!58153 () Unit!3485)

(assert (=> d!31947 (= lt!58172 lt!58153)))

(assert (=> d!31947 (= (arrayCountValidKeys!0 (array!4404 (store (arr!2087 (_keys!4366 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2345 (_keys!4366 newMap!16))) #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4366 newMap!16) #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4403 (_ BitVec 32) (_ BitVec 64)) Unit!3485)

(assert (=> d!31947 (= lt!58153 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4366 newMap!16) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun lt!58158 () Unit!3485)

(declare-fun lt!58171 () Unit!3485)

(assert (=> d!31947 (= lt!58158 lt!58171)))

(declare-fun lt!58148 () (_ BitVec 32))

(declare-fun lt!58155 () List!1635)

(assert (=> d!31947 (arrayNoDuplicates!0 (array!4404 (store (arr!2087 (_keys!4366 newMap!16)) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) (size!2345 (_keys!4366 newMap!16))) lt!58148 lt!58155)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4403 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1635) Unit!3485)

(assert (=> d!31947 (= lt!58171 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4366 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840)) lt!58148 lt!58155))))

(assert (=> d!31947 (= lt!58155 Nil!1632)))

(assert (=> d!31947 (= lt!58148 #b00000000000000000000000000000000)))

(declare-fun lt!58157 () Unit!3485)

(declare-fun e!73070 () Unit!3485)

(assert (=> d!31947 (= lt!58157 e!73070)))

(declare-fun c!20102 () Bool)

(assert (=> d!31947 (= c!20102 (arrayContainsKey!0 (_keys!4366 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!58169 () Unit!3485)

(declare-fun e!73064 () Unit!3485)

(assert (=> d!31947 (= lt!58169 e!73064)))

(declare-fun c!20099 () Bool)

(assert (=> d!31947 (= c!20099 (contains!842 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!31947 (valid!432 newMap!16)))

(assert (=> d!31947 (= (updateHelperNewKey!50 newMap!16 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730 (ite c!19993 (index!3202 lt!57840) (index!3199 lt!57840))) lt!58161)))

(declare-fun b!112403 () Bool)

(declare-fun res!55435 () Bool)

(assert (=> b!112403 (= res!55435 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3202 lt!58163)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!73067 () Bool)

(assert (=> b!112403 (=> (not res!55435) (not e!73067))))

(declare-fun bm!12068 () Bool)

(declare-fun call!12071 () Bool)

(assert (=> bm!12068 (= call!12071 (arrayContainsKey!0 (_keys!4366 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!112404 () Bool)

(assert (=> b!112404 (= e!73067 (not call!12071))))

(declare-fun b!112405 () Bool)

(declare-fun res!55437 () Bool)

(declare-fun e!73065 () Bool)

(assert (=> b!112405 (=> (not res!55437) (not e!73065))))

(declare-fun call!12072 () Bool)

(assert (=> b!112405 (= res!55437 call!12072)))

(assert (=> b!112405 (= e!73068 e!73065)))

(declare-fun b!112406 () Bool)

(assert (=> b!112406 (= e!73066 ((_ is Undefined!262) lt!58163))))

(declare-fun b!112407 () Bool)

(assert (=> b!112407 (= e!73065 (not call!12071))))

(declare-fun b!112408 () Bool)

(declare-fun res!55433 () Bool)

(declare-fun call!12073 () Bool)

(assert (=> b!112408 (= res!55433 call!12073)))

(assert (=> b!112408 (=> (not res!55433) (not e!73069))))

(declare-fun b!112409 () Bool)

(assert (=> b!112409 (= e!73071 (= (map!1302 (_2!1235 lt!58161)) (+!152 (map!1302 newMap!16) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(declare-fun b!112410 () Bool)

(declare-fun lt!58154 () Unit!3485)

(assert (=> b!112410 (= e!73064 lt!58154)))

(assert (=> b!112410 (= lt!58154 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2648 newMap!16)))))

(assert (=> b!112410 (= lt!58163 call!12070)))

(declare-fun c!20100 () Bool)

(assert (=> b!112410 (= c!20100 ((_ is MissingZero!262) lt!58163))))

(assert (=> b!112410 e!73068))

(declare-fun bm!12069 () Bool)

(assert (=> bm!12069 (= call!12072 call!12073)))

(declare-fun b!112411 () Bool)

(declare-fun Unit!3504 () Unit!3485)

(assert (=> b!112411 (= e!73070 Unit!3504)))

(declare-fun b!112412 () Bool)

(declare-fun res!55436 () Bool)

(assert (=> b!112412 (=> (not res!55436) (not e!73071))))

(assert (=> b!112412 (= res!55436 (contains!842 (map!1302 (_2!1235 lt!58161)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112413 () Bool)

(declare-fun Unit!3505 () Unit!3485)

(assert (=> b!112413 (= e!73064 Unit!3505)))

(declare-fun lt!58170 () Unit!3485)

(assert (=> b!112413 (= lt!58170 (lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2648 newMap!16)))))

(assert (=> b!112413 (= lt!58152 call!12070)))

(declare-fun res!55432 () Bool)

(assert (=> b!112413 (= res!55432 ((_ is Found!262) lt!58152))))

(assert (=> b!112413 (=> (not res!55432) (not e!73069))))

(assert (=> b!112413 e!73069))

(declare-fun lt!58165 () Unit!3485)

(assert (=> b!112413 (= lt!58165 lt!58170)))

(assert (=> b!112413 false))

(declare-fun b!112414 () Bool)

(assert (=> b!112414 (= e!73066 e!73067)))

(declare-fun res!55438 () Bool)

(assert (=> b!112414 (= res!55438 call!12072)))

(assert (=> b!112414 (=> (not res!55438) (not e!73067))))

(declare-fun b!112415 () Bool)

(declare-fun res!55434 () Bool)

(assert (=> b!112415 (=> (not res!55434) (not e!73065))))

(assert (=> b!112415 (= res!55434 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3199 lt!58163)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!12070 () Bool)

(assert (=> bm!12070 (= call!12073 (inRange!0 (ite c!20099 (index!3200 lt!58152) (ite c!20100 (index!3199 lt!58163) (index!3202 lt!58163))) (mask!6826 newMap!16)))))

(declare-fun b!112416 () Bool)

(declare-fun Unit!3506 () Unit!3485)

(assert (=> b!112416 (= e!73070 Unit!3506)))

(declare-fun lt!58146 () Unit!3485)

(declare-fun lemmaArrayContainsKeyThenInListMap!33 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 64) (_ BitVec 32) Int) Unit!3485)

(assert (=> b!112416 (= lt!58146 (lemmaArrayContainsKeyThenInListMap!33 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(assert (=> b!112416 (contains!842 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355))))

(declare-fun lt!58167 () Unit!3485)

(assert (=> b!112416 (= lt!58167 lt!58146)))

(assert (=> b!112416 false))

(assert (= (and d!31947 c!20099) b!112413))

(assert (= (and d!31947 (not c!20099)) b!112410))

(assert (= (and b!112413 res!55432) b!112408))

(assert (= (and b!112408 res!55433) b!112401))

(assert (= (and b!112410 c!20100) b!112405))

(assert (= (and b!112410 (not c!20100)) b!112400))

(assert (= (and b!112405 res!55437) b!112415))

(assert (= (and b!112415 res!55434) b!112407))

(assert (= (and b!112400 c!20101) b!112414))

(assert (= (and b!112400 (not c!20101)) b!112406))

(assert (= (and b!112414 res!55438) b!112403))

(assert (= (and b!112403 res!55435) b!112404))

(assert (= (or b!112405 b!112414) bm!12069))

(assert (= (or b!112407 b!112404) bm!12068))

(assert (= (or b!112408 bm!12069) bm!12070))

(assert (= (or b!112413 b!112410) bm!12067))

(assert (= (and d!31947 c!20102) b!112416))

(assert (= (and d!31947 (not c!20102)) b!112411))

(assert (= (and d!31947 res!55439) b!112402))

(assert (= (and b!112402 res!55440) b!112412))

(assert (= (and b!112412 res!55436) b!112409))

(declare-fun m!128239 () Bool)

(assert (=> b!112403 m!128239))

(assert (=> b!112416 m!127651))

(declare-fun m!128241 () Bool)

(assert (=> b!112416 m!128241))

(assert (=> b!112416 m!127773))

(assert (=> b!112416 m!127773))

(assert (=> b!112416 m!127651))

(assert (=> b!112416 m!127779))

(assert (=> bm!12067 m!127651))

(assert (=> bm!12067 m!127785))

(assert (=> b!112413 m!127651))

(assert (=> b!112413 m!127825))

(assert (=> bm!12068 m!127651))

(assert (=> bm!12068 m!127809))

(assert (=> b!112410 m!127651))

(assert (=> b!112410 m!127783))

(declare-fun m!128243 () Bool)

(assert (=> b!112401 m!128243))

(declare-fun m!128245 () Bool)

(assert (=> bm!12070 m!128245))

(assert (=> d!31947 m!127773))

(assert (=> d!31947 m!127651))

(declare-fun m!128247 () Bool)

(assert (=> d!31947 m!128247))

(declare-fun m!128249 () Bool)

(assert (=> d!31947 m!128249))

(assert (=> d!31947 m!127651))

(declare-fun m!128251 () Bool)

(assert (=> d!31947 m!128251))

(assert (=> d!31947 m!127651))

(declare-fun m!128253 () Bool)

(assert (=> d!31947 m!128253))

(declare-fun m!128255 () Bool)

(assert (=> d!31947 m!128255))

(declare-fun m!128257 () Bool)

(assert (=> d!31947 m!128257))

(declare-fun m!128259 () Bool)

(assert (=> d!31947 m!128259))

(declare-fun m!128261 () Bool)

(assert (=> d!31947 m!128261))

(assert (=> d!31947 m!127669))

(assert (=> d!31947 m!128255))

(declare-fun m!128263 () Bool)

(assert (=> d!31947 m!128263))

(assert (=> d!31947 m!127895))

(assert (=> d!31947 m!127773))

(assert (=> d!31947 m!127651))

(assert (=> d!31947 m!127779))

(assert (=> d!31947 m!127651))

(assert (=> d!31947 m!127809))

(declare-fun m!128265 () Bool)

(assert (=> d!31947 m!128265))

(declare-fun m!128267 () Bool)

(assert (=> d!31947 m!128267))

(assert (=> d!31947 m!128257))

(declare-fun m!128269 () Bool)

(assert (=> d!31947 m!128269))

(assert (=> d!31947 m!127773))

(assert (=> d!31947 m!128055))

(assert (=> d!31947 m!127651))

(declare-fun m!128271 () Bool)

(assert (=> d!31947 m!128271))

(declare-fun m!128273 () Bool)

(assert (=> d!31947 m!128273))

(assert (=> d!31947 m!127651))

(declare-fun m!128275 () Bool)

(assert (=> d!31947 m!128275))

(assert (=> d!31947 m!127651))

(declare-fun m!128277 () Bool)

(assert (=> d!31947 m!128277))

(declare-fun m!128279 () Bool)

(assert (=> d!31947 m!128279))

(declare-fun m!128281 () Bool)

(assert (=> d!31947 m!128281))

(declare-fun m!128283 () Bool)

(assert (=> b!112415 m!128283))

(declare-fun m!128285 () Bool)

(assert (=> b!112402 m!128285))

(declare-fun m!128287 () Bool)

(assert (=> b!112409 m!128287))

(assert (=> b!112409 m!127671))

(assert (=> b!112409 m!127671))

(declare-fun m!128289 () Bool)

(assert (=> b!112409 m!128289))

(assert (=> b!112412 m!128287))

(assert (=> b!112412 m!128287))

(assert (=> b!112412 m!127651))

(declare-fun m!128291 () Bool)

(assert (=> b!112412 m!128291))

(assert (=> bm!11988 d!31947))

(declare-fun b!112417 () Bool)

(declare-fun e!73073 () Bool)

(declare-fun call!12074 () Bool)

(assert (=> b!112417 (= e!73073 call!12074)))

(declare-fun d!31949 () Bool)

(declare-fun res!55441 () Bool)

(declare-fun e!73074 () Bool)

(assert (=> d!31949 (=> res!55441 e!73074)))

(assert (=> d!31949 (= res!55441 (bvsge #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(assert (=> d!31949 (= (arrayNoDuplicates!0 (_keys!4366 newMap!16) #b00000000000000000000000000000000 Nil!1632) e!73074)))

(declare-fun b!112418 () Bool)

(declare-fun e!73072 () Bool)

(assert (=> b!112418 (= e!73072 e!73073)))

(declare-fun c!20103 () Bool)

(assert (=> b!112418 (= c!20103 (validKeyInArray!0 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112419 () Bool)

(assert (=> b!112419 (= e!73073 call!12074)))

(declare-fun bm!12071 () Bool)

(assert (=> bm!12071 (= call!12074 (arrayNoDuplicates!0 (_keys!4366 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20103 (Cons!1631 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000) Nil!1632) Nil!1632)))))

(declare-fun b!112420 () Bool)

(declare-fun e!73075 () Bool)

(assert (=> b!112420 (= e!73075 (contains!844 Nil!1632 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112421 () Bool)

(assert (=> b!112421 (= e!73074 e!73072)))

(declare-fun res!55442 () Bool)

(assert (=> b!112421 (=> (not res!55442) (not e!73072))))

(assert (=> b!112421 (= res!55442 (not e!73075))))

(declare-fun res!55443 () Bool)

(assert (=> b!112421 (=> (not res!55443) (not e!73075))))

(assert (=> b!112421 (= res!55443 (validKeyInArray!0 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!31949 (not res!55441)) b!112421))

(assert (= (and b!112421 res!55443) b!112420))

(assert (= (and b!112421 res!55442) b!112418))

(assert (= (and b!112418 c!20103) b!112419))

(assert (= (and b!112418 (not c!20103)) b!112417))

(assert (= (or b!112419 b!112417) bm!12071))

(assert (=> b!112418 m!128073))

(assert (=> b!112418 m!128073))

(assert (=> b!112418 m!128111))

(assert (=> bm!12071 m!128073))

(declare-fun m!128293 () Bool)

(assert (=> bm!12071 m!128293))

(assert (=> b!112420 m!128073))

(assert (=> b!112420 m!128073))

(declare-fun m!128295 () Bool)

(assert (=> b!112420 m!128295))

(assert (=> b!112421 m!128073))

(assert (=> b!112421 m!128073))

(assert (=> b!112421 m!128111))

(assert (=> b!112120 d!31949))

(declare-fun b!112422 () Bool)

(declare-fun e!73082 () Bool)

(declare-fun e!73078 () Bool)

(assert (=> b!112422 (= e!73082 e!73078)))

(declare-fun c!20104 () Bool)

(declare-fun e!73077 () Bool)

(assert (=> b!112422 (= c!20104 e!73077)))

(declare-fun res!55444 () Bool)

(assert (=> b!112422 (=> (not res!55444) (not e!73077))))

(assert (=> b!112422 (= res!55444 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112423 () Bool)

(declare-fun e!73080 () Bool)

(assert (=> b!112423 (= e!73078 e!73080)))

(declare-fun c!20105 () Bool)

(assert (=> b!112423 (= c!20105 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112424 () Bool)

(declare-fun e!73081 () Bool)

(assert (=> b!112424 (= e!73078 e!73081)))

(assert (=> b!112424 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun lt!58174 () ListLongMap!1595)

(declare-fun res!55446 () Bool)

(assert (=> b!112424 (= res!55446 (contains!842 lt!58174 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!112424 (=> (not res!55446) (not e!73081))))

(declare-fun b!112425 () Bool)

(declare-fun e!73076 () ListLongMap!1595)

(declare-fun e!73079 () ListLongMap!1595)

(assert (=> b!112425 (= e!73076 e!73079)))

(declare-fun c!20106 () Bool)

(assert (=> b!112425 (= c!20106 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!112426 () Bool)

(declare-fun call!12075 () ListLongMap!1595)

(assert (=> b!112426 (= e!73079 call!12075)))

(declare-fun b!112427 () Bool)

(assert (=> b!112427 (= e!73076 (ListLongMap!1596 Nil!1631))))

(declare-fun b!112428 () Bool)

(assert (=> b!112428 (= e!73077 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!112428 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!112429 () Bool)

(declare-fun res!55447 () Bool)

(assert (=> b!112429 (=> (not res!55447) (not e!73082))))

(assert (=> b!112429 (= res!55447 (not (contains!842 lt!58174 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!31951 () Bool)

(assert (=> d!31951 e!73082))

(declare-fun res!55445 () Bool)

(assert (=> d!31951 (=> (not res!55445) (not e!73082))))

(assert (=> d!31951 (= res!55445 (not (contains!842 lt!58174 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31951 (= lt!58174 e!73076)))

(declare-fun c!20107 () Bool)

(assert (=> d!31951 (= c!20107 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!31951 (validMask!0 (mask!6826 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!31951 (= (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))) lt!58174)))

(declare-fun b!112430 () Bool)

(assert (=> b!112430 (= e!73080 (isEmpty!379 lt!58174))))

(declare-fun b!112431 () Bool)

(declare-fun lt!58179 () Unit!3485)

(declare-fun lt!58175 () Unit!3485)

(assert (=> b!112431 (= lt!58179 lt!58175)))

(declare-fun lt!58178 () V!3251)

(declare-fun lt!58176 () (_ BitVec 64))

(declare-fun lt!58173 () ListLongMap!1595)

(declare-fun lt!58177 () (_ BitVec 64))

(assert (=> b!112431 (not (contains!842 (+!152 lt!58173 (tuple2!2447 lt!58176 lt!58178)) lt!58177))))

(assert (=> b!112431 (= lt!58175 (addStillNotContains!49 lt!58173 lt!58176 lt!58178 lt!58177))))

(assert (=> b!112431 (= lt!58177 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!112431 (= lt!58178 (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112431 (= lt!58176 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!112431 (= lt!58173 call!12075)))

(assert (=> b!112431 (= e!73079 (+!152 call!12075 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!12072 () Bool)

(assert (=> bm!12072 (= call!12075 (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112432 () Bool)

(assert (=> b!112432 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> b!112432 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2346 (_values!2631 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> b!112432 (= e!73081 (= (apply!101 lt!58174 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!112433 () Bool)

(assert (=> b!112433 (= e!73080 (= lt!58174 (getCurrentListMapNoExtraKeys!118 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (_values!2631 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992))) (extraKeys!2441 (v!2946 (underlying!373 thiss!992))) (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) (minValue!2517 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!31951 c!20107) b!112427))

(assert (= (and d!31951 (not c!20107)) b!112425))

(assert (= (and b!112425 c!20106) b!112431))

(assert (= (and b!112425 (not c!20106)) b!112426))

(assert (= (or b!112431 b!112426) bm!12072))

(assert (= (and d!31951 res!55445) b!112429))

(assert (= (and b!112429 res!55447) b!112422))

(assert (= (and b!112422 res!55444) b!112428))

(assert (= (and b!112422 c!20104) b!112424))

(assert (= (and b!112422 (not c!20104)) b!112423))

(assert (= (and b!112424 res!55446) b!112432))

(assert (= (and b!112423 c!20105) b!112433))

(assert (= (and b!112423 (not c!20105)) b!112430))

(declare-fun b_lambda!5037 () Bool)

(assert (=> (not b_lambda!5037) (not b!112431)))

(assert (=> b!112431 t!5789))

(declare-fun b_and!6911 () Bool)

(assert (= b_and!6907 (and (=> t!5789 result!3551) b_and!6911)))

(assert (=> b!112431 t!5791))

(declare-fun b_and!6913 () Bool)

(assert (= b_and!6909 (and (=> t!5791 result!3555) b_and!6913)))

(declare-fun b_lambda!5039 () Bool)

(assert (=> (not b_lambda!5039) (not b!112432)))

(assert (=> b!112432 t!5789))

(declare-fun b_and!6915 () Bool)

(assert (= b_and!6911 (and (=> t!5789 result!3551) b_and!6915)))

(assert (=> b!112432 t!5791))

(declare-fun b_and!6917 () Bool)

(assert (= b_and!6913 (and (=> t!5791 result!3555) b_and!6917)))

(assert (=> b!112424 m!128011))

(assert (=> b!112424 m!128011))

(declare-fun m!128297 () Bool)

(assert (=> b!112424 m!128297))

(declare-fun m!128299 () Bool)

(assert (=> d!31951 m!128299))

(assert (=> d!31951 m!127695))

(declare-fun m!128301 () Bool)

(assert (=> b!112430 m!128301))

(assert (=> b!112425 m!128011))

(assert (=> b!112425 m!128011))

(declare-fun m!128303 () Bool)

(assert (=> b!112425 m!128303))

(assert (=> b!112428 m!128011))

(assert (=> b!112428 m!128011))

(assert (=> b!112428 m!128303))

(declare-fun m!128305 () Bool)

(assert (=> bm!12072 m!128305))

(declare-fun m!128307 () Bool)

(assert (=> b!112432 m!128307))

(assert (=> b!112432 m!127663))

(declare-fun m!128309 () Bool)

(assert (=> b!112432 m!128309))

(assert (=> b!112432 m!128011))

(declare-fun m!128311 () Bool)

(assert (=> b!112432 m!128311))

(assert (=> b!112432 m!128307))

(assert (=> b!112432 m!127663))

(assert (=> b!112432 m!128011))

(declare-fun m!128313 () Bool)

(assert (=> b!112429 m!128313))

(assert (=> b!112433 m!128305))

(assert (=> b!112431 m!128307))

(assert (=> b!112431 m!127663))

(assert (=> b!112431 m!128309))

(declare-fun m!128315 () Bool)

(assert (=> b!112431 m!128315))

(declare-fun m!128317 () Bool)

(assert (=> b!112431 m!128317))

(assert (=> b!112431 m!128307))

(declare-fun m!128319 () Bool)

(assert (=> b!112431 m!128319))

(assert (=> b!112431 m!127663))

(declare-fun m!128321 () Bool)

(assert (=> b!112431 m!128321))

(assert (=> b!112431 m!128315))

(assert (=> b!112431 m!128011))

(assert (=> bm!12034 d!31951))

(assert (=> b!111910 d!31927))

(assert (=> b!111910 d!31929))

(declare-fun d!31953 () Bool)

(declare-fun e!73083 () Bool)

(assert (=> d!31953 e!73083))

(declare-fun res!55448 () Bool)

(assert (=> d!31953 (=> (not res!55448) (not e!73083))))

(declare-fun lt!58183 () ListLongMap!1595)

(assert (=> d!31953 (= res!55448 (contains!842 lt!58183 (_1!1234 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!58181 () List!1634)

(assert (=> d!31953 (= lt!58183 (ListLongMap!1596 lt!58181))))

(declare-fun lt!58182 () Unit!3485)

(declare-fun lt!58180 () Unit!3485)

(assert (=> d!31953 (= lt!58182 lt!58180)))

(assert (=> d!31953 (= (getValueByKey!159 lt!58181 (_1!1234 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31953 (= lt!58180 (lemmaContainsTupThenGetReturnValue!75 lt!58181 (_1!1234 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31953 (= lt!58181 (insertStrictlySorted!78 (toList!813 call!12027) (_1!1234 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!31953 (= (+!152 call!12027 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!58183)))

(declare-fun b!112434 () Bool)

(declare-fun res!55449 () Bool)

(assert (=> b!112434 (=> (not res!55449) (not e!73083))))

(assert (=> b!112434 (= res!55449 (= (getValueByKey!159 (toList!813 lt!58183) (_1!1234 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112435 () Bool)

(assert (=> b!112435 (= e!73083 (contains!845 (toList!813 lt!58183) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!31953 res!55448) b!112434))

(assert (= (and b!112434 res!55449) b!112435))

(declare-fun m!128323 () Bool)

(assert (=> d!31953 m!128323))

(declare-fun m!128325 () Bool)

(assert (=> d!31953 m!128325))

(declare-fun m!128327 () Bool)

(assert (=> d!31953 m!128327))

(declare-fun m!128329 () Bool)

(assert (=> d!31953 m!128329))

(declare-fun m!128331 () Bool)

(assert (=> b!112434 m!128331))

(declare-fun m!128333 () Bool)

(assert (=> b!112435 m!128333))

(assert (=> b!112088 d!31953))

(declare-fun b!112444 () Bool)

(declare-fun e!73088 () (_ BitVec 32))

(declare-fun e!73089 () (_ BitVec 32))

(assert (=> b!112444 (= e!73088 e!73089)))

(declare-fun c!20112 () Bool)

(assert (=> b!112444 (= c!20112 (validKeyInArray!0 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12075 () Bool)

(declare-fun call!12078 () (_ BitVec 32))

(assert (=> bm!12075 (= call!12078 (arrayCountValidKeys!0 (_keys!4366 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2345 (_keys!4366 newMap!16))))))

(declare-fun d!31955 () Bool)

(declare-fun lt!58186 () (_ BitVec 32))

(assert (=> d!31955 (and (bvsge lt!58186 #b00000000000000000000000000000000) (bvsle lt!58186 (bvsub (size!2345 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!31955 (= lt!58186 e!73088)))

(declare-fun c!20113 () Bool)

(assert (=> d!31955 (= c!20113 (bvsge #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(assert (=> d!31955 (and (bvsle #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2345 (_keys!4366 newMap!16)) (size!2345 (_keys!4366 newMap!16))))))

(assert (=> d!31955 (= (arrayCountValidKeys!0 (_keys!4366 newMap!16) #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))) lt!58186)))

(declare-fun b!112445 () Bool)

(assert (=> b!112445 (= e!73088 #b00000000000000000000000000000000)))

(declare-fun b!112446 () Bool)

(assert (=> b!112446 (= e!73089 (bvadd #b00000000000000000000000000000001 call!12078))))

(declare-fun b!112447 () Bool)

(assert (=> b!112447 (= e!73089 call!12078)))

(assert (= (and d!31955 c!20113) b!112445))

(assert (= (and d!31955 (not c!20113)) b!112444))

(assert (= (and b!112444 c!20112) b!112446))

(assert (= (and b!112444 (not c!20112)) b!112447))

(assert (= (or b!112446 b!112447) bm!12075))

(assert (=> b!112444 m!128073))

(assert (=> b!112444 m!128073))

(assert (=> b!112444 m!128111))

(declare-fun m!128335 () Bool)

(assert (=> bm!12075 m!128335))

(assert (=> b!112118 d!31955))

(declare-fun d!31957 () Bool)

(declare-fun isEmpty!381 (List!1634) Bool)

(assert (=> d!31957 (= (isEmpty!379 lt!57964) (isEmpty!381 (toList!813 lt!57964)))))

(declare-fun bs!4623 () Bool)

(assert (= bs!4623 d!31957))

(declare-fun m!128337 () Bool)

(assert (=> bs!4623 m!128337))

(assert (=> b!112180 d!31957))

(assert (=> bm!12003 d!31841))

(declare-fun d!31959 () Bool)

(assert (=> d!31959 (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) lt!57939 #b00000000000000000000000000000000)))

(declare-fun lt!58189 () Unit!3485)

(declare-fun choose!13 (array!4403 (_ BitVec 64) (_ BitVec 32)) Unit!3485)

(assert (=> d!31959 (= lt!58189 (choose!13 (_keys!4366 (v!2946 (underlying!373 thiss!992))) lt!57939 #b00000000000000000000000000000000))))

(assert (=> d!31959 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!31959 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) lt!57939 #b00000000000000000000000000000000) lt!58189)))

(declare-fun bs!4624 () Bool)

(assert (= bs!4624 d!31959))

(assert (=> bs!4624 m!127889))

(declare-fun m!128339 () Bool)

(assert (=> bs!4624 m!128339))

(assert (=> b!112111 d!31959))

(declare-fun d!31961 () Bool)

(declare-fun res!55450 () Bool)

(declare-fun e!73090 () Bool)

(assert (=> d!31961 (=> res!55450 e!73090)))

(assert (=> d!31961 (= res!55450 (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) lt!57939))))

(assert (=> d!31961 (= (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) lt!57939 #b00000000000000000000000000000000) e!73090)))

(declare-fun b!112448 () Bool)

(declare-fun e!73091 () Bool)

(assert (=> b!112448 (= e!73090 e!73091)))

(declare-fun res!55451 () Bool)

(assert (=> b!112448 (=> (not res!55451) (not e!73091))))

(assert (=> b!112448 (= res!55451 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(declare-fun b!112449 () Bool)

(assert (=> b!112449 (= e!73091 (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) lt!57939 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!31961 (not res!55450)) b!112448))

(assert (= (and b!112448 res!55451) b!112449))

(assert (=> d!31961 m!127881))

(declare-fun m!128341 () Bool)

(assert (=> b!112449 m!128341))

(assert (=> b!112111 d!31961))

(declare-fun b!112462 () Bool)

(declare-fun e!73100 () SeekEntryResult!262)

(assert (=> b!112462 (= e!73100 Undefined!262)))

(declare-fun b!112463 () Bool)

(declare-fun e!73099 () SeekEntryResult!262)

(assert (=> b!112463 (= e!73100 e!73099)))

(declare-fun lt!58196 () (_ BitVec 64))

(declare-fun lt!58197 () SeekEntryResult!262)

(assert (=> b!112463 (= lt!58196 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (index!3201 lt!58197)))))

(declare-fun c!20122 () Bool)

(assert (=> b!112463 (= c!20122 (= lt!58196 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!112464 () Bool)

(assert (=> b!112464 (= e!73099 (Found!262 (index!3201 lt!58197)))))

(declare-fun d!31963 () Bool)

(declare-fun lt!58198 () SeekEntryResult!262)

(assert (=> d!31963 (and (or ((_ is Undefined!262) lt!58198) (not ((_ is Found!262) lt!58198)) (and (bvsge (index!3200 lt!58198) #b00000000000000000000000000000000) (bvslt (index!3200 lt!58198) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))) (or ((_ is Undefined!262) lt!58198) ((_ is Found!262) lt!58198) (not ((_ is MissingZero!262) lt!58198)) (and (bvsge (index!3199 lt!58198) #b00000000000000000000000000000000) (bvslt (index!3199 lt!58198) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))) (or ((_ is Undefined!262) lt!58198) ((_ is Found!262) lt!58198) ((_ is MissingZero!262) lt!58198) (not ((_ is MissingVacant!262) lt!58198)) (and (bvsge (index!3202 lt!58198) #b00000000000000000000000000000000) (bvslt (index!3202 lt!58198) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))) (or ((_ is Undefined!262) lt!58198) (ite ((_ is Found!262) lt!58198) (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (index!3200 lt!58198)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!262) lt!58198) (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (index!3199 lt!58198)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!262) lt!58198) (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (index!3202 lt!58198)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!31963 (= lt!58198 e!73100)))

(declare-fun c!20121 () Bool)

(assert (=> d!31963 (= c!20121 (and ((_ is Intermediate!262) lt!58197) (undefined!1074 lt!58197)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4403 (_ BitVec 32)) SeekEntryResult!262)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!31963 (= lt!58197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) (mask!6826 (v!2946 (underlying!373 thiss!992)))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) (_keys!4366 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992)))))))

(assert (=> d!31963 (validMask!0 (mask!6826 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!31963 (= (seekEntryOrOpen!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) (_keys!4366 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992)))) lt!58198)))

(declare-fun b!112465 () Bool)

(declare-fun e!73098 () SeekEntryResult!262)

(assert (=> b!112465 (= e!73098 (MissingZero!262 (index!3201 lt!58197)))))

(declare-fun b!112466 () Bool)

(declare-fun c!20120 () Bool)

(assert (=> b!112466 (= c!20120 (= lt!58196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112466 (= e!73099 e!73098)))

(declare-fun b!112467 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4403 (_ BitVec 32)) SeekEntryResult!262)

(assert (=> b!112467 (= e!73098 (seekKeyOrZeroReturnVacant!0 (x!14094 lt!58197) (index!3201 lt!58197) (index!3201 lt!58197) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) (_keys!4366 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992)))))))

(assert (= (and d!31963 c!20121) b!112462))

(assert (= (and d!31963 (not c!20121)) b!112463))

(assert (= (and b!112463 c!20122) b!112464))

(assert (= (and b!112463 (not c!20122)) b!112466))

(assert (= (and b!112466 c!20120) b!112465))

(assert (= (and b!112466 (not c!20120)) b!112467))

(declare-fun m!128343 () Bool)

(assert (=> b!112463 m!128343))

(declare-fun m!128345 () Bool)

(assert (=> d!31963 m!128345))

(assert (=> d!31963 m!127881))

(declare-fun m!128347 () Bool)

(assert (=> d!31963 m!128347))

(assert (=> d!31963 m!127695))

(declare-fun m!128349 () Bool)

(assert (=> d!31963 m!128349))

(declare-fun m!128351 () Bool)

(assert (=> d!31963 m!128351))

(declare-fun m!128353 () Bool)

(assert (=> d!31963 m!128353))

(assert (=> d!31963 m!127881))

(assert (=> d!31963 m!128345))

(assert (=> b!112467 m!127881))

(declare-fun m!128355 () Bool)

(assert (=> b!112467 m!128355))

(assert (=> b!112111 d!31963))

(declare-fun d!31965 () Bool)

(assert (=> d!31965 (= (apply!101 lt!57914 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1357 (getValueByKey!159 (toList!813 lt!57914) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4625 () Bool)

(assert (= bs!4625 d!31965))

(assert (=> bs!4625 m!127831))

(declare-fun m!128357 () Bool)

(assert (=> bs!4625 m!128357))

(assert (=> bs!4625 m!128357))

(declare-fun m!128359 () Bool)

(assert (=> bs!4625 m!128359))

(assert (=> b!112095 d!31965))

(declare-fun d!31967 () Bool)

(declare-fun c!20123 () Bool)

(assert (=> d!31967 (= c!20123 ((_ is ValueCellFull!1008) (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!73101 () V!3251)

(assert (=> d!31967 (= (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!73101)))

(declare-fun b!112468 () Bool)

(assert (=> b!112468 (= e!73101 (get!1355 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!112469 () Bool)

(assert (=> b!112469 (= e!73101 (get!1356 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31967 c!20123) b!112468))

(assert (= (and d!31967 (not c!20123)) b!112469))

(assert (=> b!112468 m!127873))

(assert (=> b!112468 m!127663))

(declare-fun m!128361 () Bool)

(assert (=> b!112468 m!128361))

(assert (=> b!112469 m!127873))

(assert (=> b!112469 m!127663))

(declare-fun m!128363 () Bool)

(assert (=> b!112469 m!128363))

(assert (=> b!112095 d!31967))

(declare-fun d!31969 () Bool)

(assert (=> d!31969 (= (+!152 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) lt!57847 (zeroValue!2517 newMap!16) lt!57730 #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58201 () Unit!3485)

(declare-fun choose!703 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 V!3251 Int) Unit!3485)

(assert (=> d!31969 (= lt!58201 (choose!703 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) lt!57847 (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) lt!57730 (defaultEntry!2648 newMap!16)))))

(assert (=> d!31969 (validMask!0 (mask!6826 newMap!16))))

(assert (=> d!31969 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) lt!57847 (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) lt!57730 (defaultEntry!2648 newMap!16)) lt!58201)))

(declare-fun bs!4626 () Bool)

(assert (= bs!4626 d!31969))

(assert (=> bs!4626 m!127773))

(assert (=> bs!4626 m!128047))

(assert (=> bs!4626 m!127773))

(declare-fun m!128365 () Bool)

(assert (=> bs!4626 m!128365))

(declare-fun m!128367 () Bool)

(assert (=> bs!4626 m!128367))

(declare-fun m!128369 () Bool)

(assert (=> bs!4626 m!128369))

(assert (=> b!111996 d!31969))

(declare-fun d!31971 () Bool)

(declare-fun lt!58204 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!115 (List!1634) (InoxSet tuple2!2446))

(assert (=> d!31971 (= lt!58204 (select (content!115 (toList!813 lt!57985)) lt!57733))))

(declare-fun e!73107 () Bool)

(assert (=> d!31971 (= lt!58204 e!73107)))

(declare-fun res!55456 () Bool)

(assert (=> d!31971 (=> (not res!55456) (not e!73107))))

(assert (=> d!31971 (= res!55456 ((_ is Cons!1630) (toList!813 lt!57985)))))

(assert (=> d!31971 (= (contains!845 (toList!813 lt!57985) lt!57733) lt!58204)))

(declare-fun b!112474 () Bool)

(declare-fun e!73106 () Bool)

(assert (=> b!112474 (= e!73107 e!73106)))

(declare-fun res!55457 () Bool)

(assert (=> b!112474 (=> res!55457 e!73106)))

(assert (=> b!112474 (= res!55457 (= (h!2230 (toList!813 lt!57985)) lt!57733))))

(declare-fun b!112475 () Bool)

(assert (=> b!112475 (= e!73106 (contains!845 (t!5792 (toList!813 lt!57985)) lt!57733))))

(assert (= (and d!31971 res!55456) b!112474))

(assert (= (and b!112474 (not res!55457)) b!112475))

(declare-fun m!128371 () Bool)

(assert (=> d!31971 m!128371))

(declare-fun m!128373 () Bool)

(assert (=> d!31971 m!128373))

(declare-fun m!128375 () Bool)

(assert (=> b!112475 m!128375))

(assert (=> b!112191 d!31971))

(declare-fun d!31973 () Bool)

(declare-fun e!73108 () Bool)

(assert (=> d!31973 e!73108))

(declare-fun res!55458 () Bool)

(assert (=> d!31973 (=> res!55458 e!73108)))

(declare-fun lt!58205 () Bool)

(assert (=> d!31973 (= res!55458 (not lt!58205))))

(declare-fun lt!58206 () Bool)

(assert (=> d!31973 (= lt!58205 lt!58206)))

(declare-fun lt!58207 () Unit!3485)

(declare-fun e!73109 () Unit!3485)

(assert (=> d!31973 (= lt!58207 e!73109)))

(declare-fun c!20124 () Bool)

(assert (=> d!31973 (= c!20124 lt!58206)))

(assert (=> d!31973 (= lt!58206 (containsKey!163 (toList!813 e!72828) (ite c!19994 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!57840)))))))

(assert (=> d!31973 (= (contains!842 e!72828 (ite c!19994 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!57840)))) lt!58205)))

(declare-fun b!112476 () Bool)

(declare-fun lt!58208 () Unit!3485)

(assert (=> b!112476 (= e!73109 lt!58208)))

(assert (=> b!112476 (= lt!58208 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 e!72828) (ite c!19994 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!57840)))))))

(assert (=> b!112476 (isDefined!112 (getValueByKey!159 (toList!813 e!72828) (ite c!19994 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!57840)))))))

(declare-fun b!112477 () Bool)

(declare-fun Unit!3507 () Unit!3485)

(assert (=> b!112477 (= e!73109 Unit!3507)))

(declare-fun b!112478 () Bool)

(assert (=> b!112478 (= e!73108 (isDefined!112 (getValueByKey!159 (toList!813 e!72828) (ite c!19994 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!57840))))))))

(assert (= (and d!31973 c!20124) b!112476))

(assert (= (and d!31973 (not c!20124)) b!112477))

(assert (= (and d!31973 (not res!55458)) b!112478))

(declare-fun m!128377 () Bool)

(assert (=> d!31973 m!128377))

(declare-fun m!128379 () Bool)

(assert (=> b!112476 m!128379))

(declare-fun m!128381 () Bool)

(assert (=> b!112476 m!128381))

(assert (=> b!112476 m!128381))

(declare-fun m!128383 () Bool)

(assert (=> b!112476 m!128383))

(assert (=> b!112478 m!128381))

(assert (=> b!112478 m!128381))

(assert (=> b!112478 m!128383))

(assert (=> bm!11990 d!31973))

(declare-fun d!31975 () Bool)

(assert (=> d!31975 (= (get!1355 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) from!355) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2945 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> b!112200 d!31975))

(declare-fun d!31977 () Bool)

(declare-fun e!73110 () Bool)

(assert (=> d!31977 e!73110))

(declare-fun res!55459 () Bool)

(assert (=> d!31977 (=> res!55459 e!73110)))

(declare-fun lt!58209 () Bool)

(assert (=> d!31977 (= res!55459 (not lt!58209))))

(declare-fun lt!58210 () Bool)

(assert (=> d!31977 (= lt!58209 lt!58210)))

(declare-fun lt!58211 () Unit!3485)

(declare-fun e!73111 () Unit!3485)

(assert (=> d!31977 (= lt!58211 e!73111)))

(declare-fun c!20125 () Bool)

(assert (=> d!31977 (= c!20125 lt!58210)))

(assert (=> d!31977 (= lt!58210 (containsKey!163 (toList!813 lt!57914) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31977 (= (contains!842 lt!57914 #b1000000000000000000000000000000000000000000000000000000000000000) lt!58209)))

(declare-fun b!112479 () Bool)

(declare-fun lt!58212 () Unit!3485)

(assert (=> b!112479 (= e!73111 lt!58212)))

(assert (=> b!112479 (= lt!58212 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57914) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112479 (isDefined!112 (getValueByKey!159 (toList!813 lt!57914) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112480 () Bool)

(declare-fun Unit!3508 () Unit!3485)

(assert (=> b!112480 (= e!73111 Unit!3508)))

(declare-fun b!112481 () Bool)

(assert (=> b!112481 (= e!73110 (isDefined!112 (getValueByKey!159 (toList!813 lt!57914) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!31977 c!20125) b!112479))

(assert (= (and d!31977 (not c!20125)) b!112480))

(assert (= (and d!31977 (not res!55459)) b!112481))

(declare-fun m!128385 () Bool)

(assert (=> d!31977 m!128385))

(declare-fun m!128387 () Bool)

(assert (=> b!112479 m!128387))

(declare-fun m!128389 () Bool)

(assert (=> b!112479 m!128389))

(assert (=> b!112479 m!128389))

(declare-fun m!128391 () Bool)

(assert (=> b!112479 m!128391))

(assert (=> b!112481 m!128389))

(assert (=> b!112481 m!128389))

(assert (=> b!112481 m!128391))

(assert (=> bm!12024 d!31977))

(declare-fun d!31979 () Bool)

(declare-fun lt!58213 () Bool)

(assert (=> d!31979 (= lt!58213 (select (content!115 (toList!813 lt!57989)) lt!57733))))

(declare-fun e!73113 () Bool)

(assert (=> d!31979 (= lt!58213 e!73113)))

(declare-fun res!55460 () Bool)

(assert (=> d!31979 (=> (not res!55460) (not e!73113))))

(assert (=> d!31979 (= res!55460 ((_ is Cons!1630) (toList!813 lt!57989)))))

(assert (=> d!31979 (= (contains!845 (toList!813 lt!57989) lt!57733) lt!58213)))

(declare-fun b!112482 () Bool)

(declare-fun e!73112 () Bool)

(assert (=> b!112482 (= e!73113 e!73112)))

(declare-fun res!55461 () Bool)

(assert (=> b!112482 (=> res!55461 e!73112)))

(assert (=> b!112482 (= res!55461 (= (h!2230 (toList!813 lt!57989)) lt!57733))))

(declare-fun b!112483 () Bool)

(assert (=> b!112483 (= e!73112 (contains!845 (t!5792 (toList!813 lt!57989)) lt!57733))))

(assert (= (and d!31979 res!55460) b!112482))

(assert (= (and b!112482 (not res!55461)) b!112483))

(declare-fun m!128393 () Bool)

(assert (=> d!31979 m!128393))

(declare-fun m!128395 () Bool)

(assert (=> d!31979 m!128395))

(declare-fun m!128397 () Bool)

(assert (=> b!112483 m!128397))

(assert (=> b!112193 d!31979))

(declare-fun d!31981 () Bool)

(declare-fun lt!58214 () Bool)

(assert (=> d!31981 (= lt!58214 (select (content!115 (toList!813 lt!57981)) lt!57726))))

(declare-fun e!73115 () Bool)

(assert (=> d!31981 (= lt!58214 e!73115)))

(declare-fun res!55462 () Bool)

(assert (=> d!31981 (=> (not res!55462) (not e!73115))))

(assert (=> d!31981 (= res!55462 ((_ is Cons!1630) (toList!813 lt!57981)))))

(assert (=> d!31981 (= (contains!845 (toList!813 lt!57981) lt!57726) lt!58214)))

(declare-fun b!112484 () Bool)

(declare-fun e!73114 () Bool)

(assert (=> b!112484 (= e!73115 e!73114)))

(declare-fun res!55463 () Bool)

(assert (=> b!112484 (=> res!55463 e!73114)))

(assert (=> b!112484 (= res!55463 (= (h!2230 (toList!813 lt!57981)) lt!57726))))

(declare-fun b!112485 () Bool)

(assert (=> b!112485 (= e!73114 (contains!845 (t!5792 (toList!813 lt!57981)) lt!57726))))

(assert (= (and d!31981 res!55462) b!112484))

(assert (= (and b!112484 (not res!55463)) b!112485))

(declare-fun m!128399 () Bool)

(assert (=> d!31981 m!128399))

(declare-fun m!128401 () Bool)

(assert (=> d!31981 m!128401))

(declare-fun m!128403 () Bool)

(assert (=> b!112485 m!128403))

(assert (=> b!112189 d!31981))

(declare-fun d!31983 () Bool)

(assert (=> d!31983 (= (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112110 d!31983))

(assert (=> bm!12023 d!31865))

(declare-fun b!112486 () Bool)

(declare-fun e!73118 () SeekEntryResult!262)

(assert (=> b!112486 (= e!73118 Undefined!262)))

(declare-fun b!112487 () Bool)

(declare-fun e!73117 () SeekEntryResult!262)

(assert (=> b!112487 (= e!73118 e!73117)))

(declare-fun lt!58215 () (_ BitVec 64))

(declare-fun lt!58216 () SeekEntryResult!262)

(assert (=> b!112487 (= lt!58215 (select (arr!2087 (_keys!4366 newMap!16)) (index!3201 lt!58216)))))

(declare-fun c!20128 () Bool)

(assert (=> b!112487 (= c!20128 (= lt!58215 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112488 () Bool)

(assert (=> b!112488 (= e!73117 (Found!262 (index!3201 lt!58216)))))

(declare-fun lt!58217 () SeekEntryResult!262)

(declare-fun d!31985 () Bool)

(assert (=> d!31985 (and (or ((_ is Undefined!262) lt!58217) (not ((_ is Found!262) lt!58217)) (and (bvsge (index!3200 lt!58217) #b00000000000000000000000000000000) (bvslt (index!3200 lt!58217) (size!2345 (_keys!4366 newMap!16))))) (or ((_ is Undefined!262) lt!58217) ((_ is Found!262) lt!58217) (not ((_ is MissingZero!262) lt!58217)) (and (bvsge (index!3199 lt!58217) #b00000000000000000000000000000000) (bvslt (index!3199 lt!58217) (size!2345 (_keys!4366 newMap!16))))) (or ((_ is Undefined!262) lt!58217) ((_ is Found!262) lt!58217) ((_ is MissingZero!262) lt!58217) (not ((_ is MissingVacant!262) lt!58217)) (and (bvsge (index!3202 lt!58217) #b00000000000000000000000000000000) (bvslt (index!3202 lt!58217) (size!2345 (_keys!4366 newMap!16))))) (or ((_ is Undefined!262) lt!58217) (ite ((_ is Found!262) lt!58217) (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!58217)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) (ite ((_ is MissingZero!262) lt!58217) (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3199 lt!58217)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!262) lt!58217) (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3202 lt!58217)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!31985 (= lt!58217 e!73118)))

(declare-fun c!20127 () Bool)

(assert (=> d!31985 (= c!20127 (and ((_ is Intermediate!262) lt!58216) (undefined!1074 lt!58216)))))

(assert (=> d!31985 (= lt!58216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (mask!6826 newMap!16)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4366 newMap!16) (mask!6826 newMap!16)))))

(assert (=> d!31985 (validMask!0 (mask!6826 newMap!16))))

(assert (=> d!31985 (= (seekEntryOrOpen!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4366 newMap!16) (mask!6826 newMap!16)) lt!58217)))

(declare-fun b!112489 () Bool)

(declare-fun e!73116 () SeekEntryResult!262)

(assert (=> b!112489 (= e!73116 (MissingZero!262 (index!3201 lt!58216)))))

(declare-fun b!112490 () Bool)

(declare-fun c!20126 () Bool)

(assert (=> b!112490 (= c!20126 (= lt!58215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112490 (= e!73117 e!73116)))

(declare-fun b!112491 () Bool)

(assert (=> b!112491 (= e!73116 (seekKeyOrZeroReturnVacant!0 (x!14094 lt!58216) (index!3201 lt!58216) (index!3201 lt!58216) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4366 newMap!16) (mask!6826 newMap!16)))))

(assert (= (and d!31985 c!20127) b!112486))

(assert (= (and d!31985 (not c!20127)) b!112487))

(assert (= (and b!112487 c!20128) b!112488))

(assert (= (and b!112487 (not c!20128)) b!112490))

(assert (= (and b!112490 c!20126) b!112489))

(assert (= (and b!112490 (not c!20126)) b!112491))

(declare-fun m!128405 () Bool)

(assert (=> b!112487 m!128405))

(declare-fun m!128407 () Bool)

(assert (=> d!31985 m!128407))

(assert (=> d!31985 m!127651))

(declare-fun m!128409 () Bool)

(assert (=> d!31985 m!128409))

(assert (=> d!31985 m!128047))

(declare-fun m!128411 () Bool)

(assert (=> d!31985 m!128411))

(declare-fun m!128413 () Bool)

(assert (=> d!31985 m!128413))

(declare-fun m!128415 () Bool)

(assert (=> d!31985 m!128415))

(assert (=> d!31985 m!127651))

(assert (=> d!31985 m!128407))

(assert (=> b!112491 m!127651))

(declare-fun m!128417 () Bool)

(assert (=> b!112491 m!128417))

(assert (=> b!112009 d!31985))

(assert (=> b!112183 d!31951))

(declare-fun d!31987 () Bool)

(declare-fun lt!58220 () Bool)

(declare-fun content!116 (List!1635) (InoxSet (_ BitVec 64)))

(assert (=> d!31987 (= lt!58220 (select (content!116 Nil!1632) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun e!73123 () Bool)

(assert (=> d!31987 (= lt!58220 e!73123)))

(declare-fun res!55468 () Bool)

(assert (=> d!31987 (=> (not res!55468) (not e!73123))))

(assert (=> d!31987 (= res!55468 ((_ is Cons!1631) Nil!1632))))

(assert (=> d!31987 (= (contains!844 Nil!1632 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)) lt!58220)))

(declare-fun b!112496 () Bool)

(declare-fun e!73124 () Bool)

(assert (=> b!112496 (= e!73123 e!73124)))

(declare-fun res!55469 () Bool)

(assert (=> b!112496 (=> res!55469 e!73124)))

(assert (=> b!112496 (= res!55469 (= (h!2231 Nil!1632) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(declare-fun b!112497 () Bool)

(assert (=> b!112497 (= e!73124 (contains!844 (t!5793 Nil!1632) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (= (and d!31987 res!55468) b!112496))

(assert (= (and b!112496 (not res!55469)) b!112497))

(declare-fun m!128419 () Bool)

(assert (=> d!31987 m!128419))

(assert (=> d!31987 m!127651))

(declare-fun m!128421 () Bool)

(assert (=> d!31987 m!128421))

(assert (=> b!112497 m!127651))

(declare-fun m!128423 () Bool)

(assert (=> b!112497 m!128423))

(assert (=> b!112146 d!31987))

(declare-fun b!112514 () Bool)

(declare-fun e!73136 () Bool)

(declare-fun e!73134 () Bool)

(assert (=> b!112514 (= e!73136 e!73134)))

(declare-fun res!55481 () Bool)

(declare-fun call!12084 () Bool)

(assert (=> b!112514 (= res!55481 call!12084)))

(assert (=> b!112514 (=> (not res!55481) (not e!73134))))

(declare-fun b!112515 () Bool)

(declare-fun lt!58225 () SeekEntryResult!262)

(assert (=> b!112515 (and (bvsge (index!3199 lt!58225) #b00000000000000000000000000000000) (bvslt (index!3199 lt!58225) (size!2345 (_keys!4366 newMap!16))))))

(declare-fun res!55478 () Bool)

(assert (=> b!112515 (= res!55478 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3199 lt!58225)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112515 (=> (not res!55478) (not e!73134))))

(declare-fun d!31989 () Bool)

(assert (=> d!31989 e!73136))

(declare-fun c!20134 () Bool)

(assert (=> d!31989 (= c!20134 ((_ is MissingZero!262) lt!58225))))

(assert (=> d!31989 (= lt!58225 (seekEntryOrOpen!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4366 newMap!16) (mask!6826 newMap!16)))))

(declare-fun lt!58226 () Unit!3485)

(declare-fun choose!704 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 64) Int) Unit!3485)

(assert (=> d!31989 (= lt!58226 (choose!704 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2648 newMap!16)))))

(assert (=> d!31989 (validMask!0 (mask!6826 newMap!16))))

(assert (=> d!31989 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2648 newMap!16)) lt!58226)))

(declare-fun bm!12080 () Bool)

(assert (=> bm!12080 (= call!12084 (inRange!0 (ite c!20134 (index!3199 lt!58225) (index!3202 lt!58225)) (mask!6826 newMap!16)))))

(declare-fun b!112516 () Bool)

(declare-fun e!73135 () Bool)

(assert (=> b!112516 (= e!73135 ((_ is Undefined!262) lt!58225))))

(declare-fun b!112517 () Bool)

(assert (=> b!112517 (= e!73136 e!73135)))

(declare-fun c!20133 () Bool)

(assert (=> b!112517 (= c!20133 ((_ is MissingVacant!262) lt!58225))))

(declare-fun b!112518 () Bool)

(declare-fun e!73133 () Bool)

(declare-fun call!12083 () Bool)

(assert (=> b!112518 (= e!73133 (not call!12083))))

(declare-fun b!112519 () Bool)

(declare-fun res!55479 () Bool)

(assert (=> b!112519 (=> (not res!55479) (not e!73133))))

(assert (=> b!112519 (= res!55479 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3202 lt!58225)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112519 (and (bvsge (index!3202 lt!58225) #b00000000000000000000000000000000) (bvslt (index!3202 lt!58225) (size!2345 (_keys!4366 newMap!16))))))

(declare-fun b!112520 () Bool)

(declare-fun res!55480 () Bool)

(assert (=> b!112520 (=> (not res!55480) (not e!73133))))

(assert (=> b!112520 (= res!55480 call!12084)))

(assert (=> b!112520 (= e!73135 e!73133)))

(declare-fun bm!12081 () Bool)

(assert (=> bm!12081 (= call!12083 (arrayContainsKey!0 (_keys!4366 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!112521 () Bool)

(assert (=> b!112521 (= e!73134 (not call!12083))))

(assert (= (and d!31989 c!20134) b!112514))

(assert (= (and d!31989 (not c!20134)) b!112517))

(assert (= (and b!112514 res!55481) b!112515))

(assert (= (and b!112515 res!55478) b!112521))

(assert (= (and b!112517 c!20133) b!112520))

(assert (= (and b!112517 (not c!20133)) b!112516))

(assert (= (and b!112520 res!55480) b!112519))

(assert (= (and b!112519 res!55479) b!112518))

(assert (= (or b!112514 b!112520) bm!12080))

(assert (= (or b!112521 b!112518) bm!12081))

(declare-fun m!128425 () Bool)

(assert (=> bm!12080 m!128425))

(assert (=> bm!12081 m!127651))

(assert (=> bm!12081 m!127809))

(declare-fun m!128427 () Bool)

(assert (=> b!112515 m!128427))

(assert (=> d!31989 m!127651))

(assert (=> d!31989 m!127785))

(assert (=> d!31989 m!127651))

(declare-fun m!128429 () Bool)

(assert (=> d!31989 m!128429))

(assert (=> d!31989 m!128047))

(declare-fun m!128431 () Bool)

(assert (=> b!112519 m!128431))

(assert (=> bm!11999 d!31989))

(declare-fun d!31991 () Bool)

(declare-fun e!73142 () Bool)

(assert (=> d!31991 e!73142))

(declare-fun res!55486 () Bool)

(assert (=> d!31991 (=> (not res!55486) (not e!73142))))

(assert (=> d!31991 (= res!55486 (or (bvsge #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))))

(declare-fun lt!58232 () ListLongMap!1595)

(declare-fun lt!58234 () ListLongMap!1595)

(assert (=> d!31991 (= lt!58232 lt!58234)))

(declare-fun lt!58244 () Unit!3485)

(declare-fun e!73138 () Unit!3485)

(assert (=> d!31991 (= lt!58244 e!73138)))

(declare-fun c!20137 () Bool)

(declare-fun e!73140 () Bool)

(assert (=> d!31991 (= c!20137 e!73140)))

(declare-fun res!55487 () Bool)

(assert (=> d!31991 (=> (not res!55487) (not e!73140))))

(assert (=> d!31991 (= res!55487 (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun e!73148 () ListLongMap!1595)

(assert (=> d!31991 (= lt!58234 e!73148)))

(declare-fun c!20140 () Bool)

(assert (=> d!31991 (= c!20140 (and (not (= (bvand (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!31991 (validMask!0 (mask!6826 newMap!16))))

(assert (=> d!31991 (= (getCurrentListMap!497 (_keys!4366 newMap!16) (ite (or c!19992 c!19994) (_values!2631 newMap!16) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16)))) (mask!6826 newMap!16) (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) (zeroValue!2517 newMap!16) (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) lt!58232)))

(declare-fun b!112522 () Bool)

(declare-fun e!73143 () ListLongMap!1595)

(declare-fun call!12087 () ListLongMap!1595)

(assert (=> b!112522 (= e!73143 call!12087)))

(declare-fun b!112523 () Bool)

(declare-fun e!73139 () ListLongMap!1595)

(assert (=> b!112523 (= e!73139 call!12087)))

(declare-fun b!112524 () Bool)

(declare-fun e!73145 () Bool)

(declare-fun e!73141 () Bool)

(assert (=> b!112524 (= e!73145 e!73141)))

(declare-fun res!55484 () Bool)

(assert (=> b!112524 (=> (not res!55484) (not e!73141))))

(assert (=> b!112524 (= res!55484 (contains!842 lt!58232 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!112524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun b!112525 () Bool)

(declare-fun e!73149 () Bool)

(declare-fun call!12088 () Bool)

(assert (=> b!112525 (= e!73149 (not call!12088))))

(declare-fun b!112526 () Bool)

(declare-fun Unit!3509 () Unit!3485)

(assert (=> b!112526 (= e!73138 Unit!3509)))

(declare-fun bm!12082 () Bool)

(declare-fun call!12085 () ListLongMap!1595)

(declare-fun call!12089 () ListLongMap!1595)

(assert (=> bm!12082 (= call!12085 call!12089)))

(declare-fun call!12090 () ListLongMap!1595)

(declare-fun c!20135 () Bool)

(declare-fun bm!12083 () Bool)

(declare-fun call!12091 () ListLongMap!1595)

(assert (=> bm!12083 (= call!12090 (+!152 (ite c!20140 call!12089 (ite c!20135 call!12085 call!12091)) (ite (or c!20140 c!20135) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 newMap!16)) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16))))))))

(declare-fun b!112527 () Bool)

(declare-fun e!73144 () Bool)

(declare-fun e!73147 () Bool)

(assert (=> b!112527 (= e!73144 e!73147)))

(declare-fun res!55485 () Bool)

(declare-fun call!12086 () Bool)

(assert (=> b!112527 (= res!55485 call!12086)))

(assert (=> b!112527 (=> (not res!55485) (not e!73147))))

(declare-fun bm!12084 () Bool)

(assert (=> bm!12084 (= call!12091 call!12085)))

(declare-fun b!112528 () Bool)

(assert (=> b!112528 (= e!73147 (= (apply!101 lt!58232 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2517 newMap!16)))))

(declare-fun b!112529 () Bool)

(declare-fun lt!58228 () Unit!3485)

(assert (=> b!112529 (= e!73138 lt!58228)))

(declare-fun lt!58238 () ListLongMap!1595)

(assert (=> b!112529 (= lt!58238 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (ite (or c!19992 c!19994) (_values!2631 newMap!16) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16)))) (mask!6826 newMap!16) (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) (zeroValue!2517 newMap!16) (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58237 () (_ BitVec 64))

(assert (=> b!112529 (= lt!58237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58243 () (_ BitVec 64))

(assert (=> b!112529 (= lt!58243 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58227 () Unit!3485)

(assert (=> b!112529 (= lt!58227 (addStillContains!77 lt!58238 lt!58237 (zeroValue!2517 newMap!16) lt!58243))))

(assert (=> b!112529 (contains!842 (+!152 lt!58238 (tuple2!2447 lt!58237 (zeroValue!2517 newMap!16))) lt!58243)))

(declare-fun lt!58235 () Unit!3485)

(assert (=> b!112529 (= lt!58235 lt!58227)))

(declare-fun lt!58231 () ListLongMap!1595)

(assert (=> b!112529 (= lt!58231 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (ite (or c!19992 c!19994) (_values!2631 newMap!16) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16)))) (mask!6826 newMap!16) (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) (zeroValue!2517 newMap!16) (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58246 () (_ BitVec 64))

(assert (=> b!112529 (= lt!58246 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58236 () (_ BitVec 64))

(assert (=> b!112529 (= lt!58236 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58247 () Unit!3485)

(assert (=> b!112529 (= lt!58247 (addApplyDifferent!77 lt!58231 lt!58246 (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)) lt!58236))))

(assert (=> b!112529 (= (apply!101 (+!152 lt!58231 (tuple2!2447 lt!58246 (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)))) lt!58236) (apply!101 lt!58231 lt!58236))))

(declare-fun lt!58245 () Unit!3485)

(assert (=> b!112529 (= lt!58245 lt!58247)))

(declare-fun lt!58233 () ListLongMap!1595)

(assert (=> b!112529 (= lt!58233 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (ite (or c!19992 c!19994) (_values!2631 newMap!16) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16)))) (mask!6826 newMap!16) (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) (zeroValue!2517 newMap!16) (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58230 () (_ BitVec 64))

(assert (=> b!112529 (= lt!58230 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58229 () (_ BitVec 64))

(assert (=> b!112529 (= lt!58229 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58248 () Unit!3485)

(assert (=> b!112529 (= lt!58248 (addApplyDifferent!77 lt!58233 lt!58230 (zeroValue!2517 newMap!16) lt!58229))))

(assert (=> b!112529 (= (apply!101 (+!152 lt!58233 (tuple2!2447 lt!58230 (zeroValue!2517 newMap!16))) lt!58229) (apply!101 lt!58233 lt!58229))))

(declare-fun lt!58241 () Unit!3485)

(assert (=> b!112529 (= lt!58241 lt!58248)))

(declare-fun lt!58239 () ListLongMap!1595)

(assert (=> b!112529 (= lt!58239 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (ite (or c!19992 c!19994) (_values!2631 newMap!16) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16)))) (mask!6826 newMap!16) (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) (zeroValue!2517 newMap!16) (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58242 () (_ BitVec 64))

(assert (=> b!112529 (= lt!58242 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58240 () (_ BitVec 64))

(assert (=> b!112529 (= lt!58240 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112529 (= lt!58228 (addApplyDifferent!77 lt!58239 lt!58242 (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)) lt!58240))))

(assert (=> b!112529 (= (apply!101 (+!152 lt!58239 (tuple2!2447 lt!58242 (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)))) lt!58240) (apply!101 lt!58239 lt!58240))))

(declare-fun b!112530 () Bool)

(assert (=> b!112530 (= e!73140 (validKeyInArray!0 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12085 () Bool)

(assert (=> bm!12085 (= call!12086 (contains!842 lt!58232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112531 () Bool)

(assert (=> b!112531 (= e!73148 (+!152 call!12090 (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)))))))

(declare-fun b!112532 () Bool)

(declare-fun e!73137 () Bool)

(assert (=> b!112532 (= e!73137 (= (apply!101 lt!58232 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16))))))

(declare-fun b!112533 () Bool)

(assert (=> b!112533 (= e!73143 call!12091)))

(declare-fun b!112534 () Bool)

(assert (=> b!112534 (= e!73148 e!73139)))

(assert (=> b!112534 (= c!20135 (and (not (= (bvand (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112535 () Bool)

(declare-fun res!55483 () Bool)

(assert (=> b!112535 (=> (not res!55483) (not e!73142))))

(assert (=> b!112535 (= res!55483 e!73145)))

(declare-fun res!55488 () Bool)

(assert (=> b!112535 (=> res!55488 e!73145)))

(declare-fun e!73146 () Bool)

(assert (=> b!112535 (= res!55488 (not e!73146))))

(declare-fun res!55489 () Bool)

(assert (=> b!112535 (=> (not res!55489) (not e!73146))))

(assert (=> b!112535 (= res!55489 (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun b!112536 () Bool)

(assert (=> b!112536 (= e!73144 (not call!12086))))

(declare-fun bm!12086 () Bool)

(assert (=> bm!12086 (= call!12089 (getCurrentListMapNoExtraKeys!118 (_keys!4366 newMap!16) (ite (or c!19992 c!19994) (_values!2631 newMap!16) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16)))) (mask!6826 newMap!16) (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) (zeroValue!2517 newMap!16) (ite c!19992 (ite c!19988 (minValue!2517 newMap!16) lt!57730) (minValue!2517 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun b!112537 () Bool)

(assert (=> b!112537 (= e!73142 e!73149)))

(declare-fun c!20136 () Bool)

(assert (=> b!112537 (= c!20136 (not (= (bvand (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112538 () Bool)

(assert (=> b!112538 (= e!73141 (= (apply!101 lt!58232 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)) (get!1353 (select (arr!2088 (ite (or c!19992 c!19994) (_values!2631 newMap!16) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!391 (defaultEntry!2648 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2346 (ite (or c!19992 c!19994) (_values!2631 newMap!16) (array!4406 (store (arr!2088 (_values!2631 newMap!16)) (index!3200 lt!57840) (ValueCellFull!1008 lt!57730)) (size!2346 (_values!2631 newMap!16)))))))))

(assert (=> b!112538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(declare-fun c!20139 () Bool)

(declare-fun b!112539 () Bool)

(assert (=> b!112539 (= c!20139 (and (not (= (bvand (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!112539 (= e!73139 e!73143)))

(declare-fun bm!12087 () Bool)

(assert (=> bm!12087 (= call!12088 (contains!842 lt!58232 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112540 () Bool)

(assert (=> b!112540 (= e!73146 (validKeyInArray!0 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!112541 () Bool)

(assert (=> b!112541 (= e!73149 e!73137)))

(declare-fun res!55482 () Bool)

(assert (=> b!112541 (= res!55482 call!12088)))

(assert (=> b!112541 (=> (not res!55482) (not e!73137))))

(declare-fun b!112542 () Bool)

(declare-fun res!55490 () Bool)

(assert (=> b!112542 (=> (not res!55490) (not e!73142))))

(assert (=> b!112542 (= res!55490 e!73144)))

(declare-fun c!20138 () Bool)

(assert (=> b!112542 (= c!20138 (not (= (bvand (ite c!19992 (ite c!19988 (extraKeys!2441 newMap!16) lt!57847) (extraKeys!2441 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12088 () Bool)

(assert (=> bm!12088 (= call!12087 call!12090)))

(assert (= (and d!31991 c!20140) b!112531))

(assert (= (and d!31991 (not c!20140)) b!112534))

(assert (= (and b!112534 c!20135) b!112523))

(assert (= (and b!112534 (not c!20135)) b!112539))

(assert (= (and b!112539 c!20139) b!112522))

(assert (= (and b!112539 (not c!20139)) b!112533))

(assert (= (or b!112522 b!112533) bm!12084))

(assert (= (or b!112523 bm!12084) bm!12082))

(assert (= (or b!112523 b!112522) bm!12088))

(assert (= (or b!112531 bm!12082) bm!12086))

(assert (= (or b!112531 bm!12088) bm!12083))

(assert (= (and d!31991 res!55487) b!112530))

(assert (= (and d!31991 c!20137) b!112529))

(assert (= (and d!31991 (not c!20137)) b!112526))

(assert (= (and d!31991 res!55486) b!112535))

(assert (= (and b!112535 res!55489) b!112540))

(assert (= (and b!112535 (not res!55488)) b!112524))

(assert (= (and b!112524 res!55484) b!112538))

(assert (= (and b!112535 res!55483) b!112542))

(assert (= (and b!112542 c!20138) b!112527))

(assert (= (and b!112542 (not c!20138)) b!112536))

(assert (= (and b!112527 res!55485) b!112528))

(assert (= (or b!112527 b!112536) bm!12085))

(assert (= (and b!112542 res!55490) b!112537))

(assert (= (and b!112537 c!20136) b!112541))

(assert (= (and b!112537 (not c!20136)) b!112525))

(assert (= (and b!112541 res!55482) b!112532))

(assert (= (or b!112541 b!112525) bm!12087))

(declare-fun b_lambda!5041 () Bool)

(assert (=> (not b_lambda!5041) (not b!112538)))

(assert (=> b!112538 t!5801))

(declare-fun b_and!6919 () Bool)

(assert (= b_and!6915 (and (=> t!5801 result!3565) b_and!6919)))

(assert (=> b!112538 t!5803))

(declare-fun b_and!6921 () Bool)

(assert (= b_and!6917 (and (=> t!5803 result!3567) b_and!6921)))

(declare-fun m!128433 () Bool)

(assert (=> bm!12086 m!128433))

(assert (=> d!31991 m!128047))

(declare-fun m!128435 () Bool)

(assert (=> b!112531 m!128435))

(declare-fun m!128437 () Bool)

(assert (=> bm!12083 m!128437))

(assert (=> b!112529 m!128073))

(assert (=> b!112529 m!128433))

(declare-fun m!128439 () Bool)

(assert (=> b!112529 m!128439))

(declare-fun m!128441 () Bool)

(assert (=> b!112529 m!128441))

(declare-fun m!128443 () Bool)

(assert (=> b!112529 m!128443))

(declare-fun m!128445 () Bool)

(assert (=> b!112529 m!128445))

(declare-fun m!128447 () Bool)

(assert (=> b!112529 m!128447))

(declare-fun m!128449 () Bool)

(assert (=> b!112529 m!128449))

(declare-fun m!128451 () Bool)

(assert (=> b!112529 m!128451))

(declare-fun m!128453 () Bool)

(assert (=> b!112529 m!128453))

(declare-fun m!128455 () Bool)

(assert (=> b!112529 m!128455))

(declare-fun m!128457 () Bool)

(assert (=> b!112529 m!128457))

(assert (=> b!112529 m!128455))

(declare-fun m!128459 () Bool)

(assert (=> b!112529 m!128459))

(assert (=> b!112529 m!128451))

(declare-fun m!128461 () Bool)

(assert (=> b!112529 m!128461))

(declare-fun m!128463 () Bool)

(assert (=> b!112529 m!128463))

(assert (=> b!112529 m!128443))

(declare-fun m!128465 () Bool)

(assert (=> b!112529 m!128465))

(assert (=> b!112529 m!128441))

(declare-fun m!128467 () Bool)

(assert (=> b!112529 m!128467))

(declare-fun m!128469 () Bool)

(assert (=> bm!12085 m!128469))

(declare-fun m!128471 () Bool)

(assert (=> b!112532 m!128471))

(assert (=> b!112524 m!128073))

(assert (=> b!112524 m!128073))

(declare-fun m!128473 () Bool)

(assert (=> b!112524 m!128473))

(assert (=> b!112530 m!128073))

(assert (=> b!112530 m!128073))

(assert (=> b!112530 m!128111))

(declare-fun m!128475 () Bool)

(assert (=> b!112528 m!128475))

(assert (=> b!112538 m!128073))

(declare-fun m!128477 () Bool)

(assert (=> b!112538 m!128477))

(assert (=> b!112538 m!128117))

(declare-fun m!128479 () Bool)

(assert (=> b!112538 m!128479))

(assert (=> b!112538 m!128073))

(declare-fun m!128481 () Bool)

(assert (=> b!112538 m!128481))

(assert (=> b!112538 m!128477))

(assert (=> b!112538 m!128117))

(assert (=> b!112540 m!128073))

(assert (=> b!112540 m!128073))

(assert (=> b!112540 m!128111))

(declare-fun m!128483 () Bool)

(assert (=> bm!12087 m!128483))

(assert (=> bm!11986 d!31991))

(declare-fun d!31993 () Bool)

(declare-fun e!73150 () Bool)

(assert (=> d!31993 e!73150))

(declare-fun res!55491 () Bool)

(assert (=> d!31993 (=> (not res!55491) (not e!73150))))

(declare-fun lt!58252 () ListLongMap!1595)

(assert (=> d!31993 (= res!55491 (contains!842 lt!58252 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(declare-fun lt!58250 () List!1634)

(assert (=> d!31993 (= lt!58252 (ListLongMap!1596 lt!58250))))

(declare-fun lt!58251 () Unit!3485)

(declare-fun lt!58249 () Unit!3485)

(assert (=> d!31993 (= lt!58251 lt!58249)))

(assert (=> d!31993 (= (getValueByKey!159 lt!58250 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))) (Some!164 (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(assert (=> d!31993 (= lt!58249 (lemmaContainsTupThenGetReturnValue!75 lt!58250 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(assert (=> d!31993 (= lt!58250 (insertStrictlySorted!78 (toList!813 call!11990) (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(assert (=> d!31993 (= (+!152 call!11990 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) lt!58252)))

(declare-fun b!112543 () Bool)

(declare-fun res!55492 () Bool)

(assert (=> b!112543 (=> (not res!55492) (not e!73150))))

(assert (=> b!112543 (= res!55492 (= (getValueByKey!159 (toList!813 lt!58252) (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))) (Some!164 (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))))

(declare-fun b!112544 () Bool)

(assert (=> b!112544 (= e!73150 (contains!845 (toList!813 lt!58252) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))

(assert (= (and d!31993 res!55491) b!112543))

(assert (= (and b!112543 res!55492) b!112544))

(declare-fun m!128485 () Bool)

(assert (=> d!31993 m!128485))

(declare-fun m!128487 () Bool)

(assert (=> d!31993 m!128487))

(declare-fun m!128489 () Bool)

(assert (=> d!31993 m!128489))

(declare-fun m!128491 () Bool)

(assert (=> d!31993 m!128491))

(declare-fun m!128493 () Bool)

(assert (=> b!112543 m!128493))

(declare-fun m!128495 () Bool)

(assert (=> b!112544 m!128495))

(assert (=> b!112015 d!31993))

(declare-fun d!31995 () Bool)

(declare-fun res!55493 () Bool)

(declare-fun e!73151 () Bool)

(assert (=> d!31995 (=> (not res!55493) (not e!73151))))

(assert (=> d!31995 (= res!55493 (simpleValid!77 (v!2946 (underlying!373 thiss!992))))))

(assert (=> d!31995 (= (valid!432 (v!2946 (underlying!373 thiss!992))) e!73151)))

(declare-fun b!112545 () Bool)

(declare-fun res!55494 () Bool)

(assert (=> b!112545 (=> (not res!55494) (not e!73151))))

(assert (=> b!112545 (= res!55494 (= (arrayCountValidKeys!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))) (_size!511 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112546 () Bool)

(declare-fun res!55495 () Bool)

(assert (=> b!112546 (=> (not res!55495) (not e!73151))))

(assert (=> b!112546 (= res!55495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (mask!6826 (v!2946 (underlying!373 thiss!992)))))))

(declare-fun b!112547 () Bool)

(assert (=> b!112547 (= e!73151 (arrayNoDuplicates!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) #b00000000000000000000000000000000 Nil!1632))))

(assert (= (and d!31995 res!55493) b!112545))

(assert (= (and b!112545 res!55494) b!112546))

(assert (= (and b!112546 res!55495) b!112547))

(declare-fun m!128497 () Bool)

(assert (=> d!31995 m!128497))

(declare-fun m!128499 () Bool)

(assert (=> b!112545 m!128499))

(assert (=> b!112546 m!127657))

(declare-fun m!128501 () Bool)

(assert (=> b!112547 m!128501))

(assert (=> d!31853 d!31995))

(declare-fun d!31997 () Bool)

(declare-fun e!73152 () Bool)

(assert (=> d!31997 e!73152))

(declare-fun res!55496 () Bool)

(assert (=> d!31997 (=> (not res!55496) (not e!73152))))

(declare-fun lt!58256 () ListLongMap!1595)

(assert (=> d!31997 (= res!55496 (contains!842 lt!58256 (_1!1234 (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun lt!58254 () List!1634)

(assert (=> d!31997 (= lt!58256 (ListLongMap!1596 lt!58254))))

(declare-fun lt!58255 () Unit!3485)

(declare-fun lt!58253 () Unit!3485)

(assert (=> d!31997 (= lt!58255 lt!58253)))

(assert (=> d!31997 (= (getValueByKey!159 lt!58254 (_1!1234 (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))) (Some!164 (_2!1234 (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))))))

(assert (=> d!31997 (= lt!58253 (lemmaContainsTupThenGetReturnValue!75 lt!58254 (_1!1234 (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))) (_2!1234 (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))))))

(assert (=> d!31997 (= lt!58254 (insertStrictlySorted!78 (toList!813 (ite c!20017 call!12026 (ite c!20012 call!12022 call!12028))) (_1!1234 (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))) (_2!1234 (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))))))

(assert (=> d!31997 (= (+!152 (ite c!20017 call!12026 (ite c!20012 call!12022 call!12028)) (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))) lt!58256)))

(declare-fun b!112548 () Bool)

(declare-fun res!55497 () Bool)

(assert (=> b!112548 (=> (not res!55497) (not e!73152))))

(assert (=> b!112548 (= res!55497 (= (getValueByKey!159 (toList!813 lt!58256) (_1!1234 (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))) (Some!164 (_2!1234 (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))))

(declare-fun b!112549 () Bool)

(assert (=> b!112549 (= e!73152 (contains!845 (toList!813 lt!58256) (ite (or c!20017 c!20012) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) (tuple2!2447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (= (and d!31997 res!55496) b!112548))

(assert (= (and b!112548 res!55497) b!112549))

(declare-fun m!128503 () Bool)

(assert (=> d!31997 m!128503))

(declare-fun m!128505 () Bool)

(assert (=> d!31997 m!128505))

(declare-fun m!128507 () Bool)

(assert (=> d!31997 m!128507))

(declare-fun m!128509 () Bool)

(assert (=> d!31997 m!128509))

(declare-fun m!128511 () Bool)

(assert (=> b!112548 m!128511))

(declare-fun m!128513 () Bool)

(assert (=> b!112549 m!128513))

(assert (=> bm!12020 d!31997))

(declare-fun d!31999 () Bool)

(declare-fun lt!58257 () Bool)

(assert (=> d!31999 (= lt!58257 (select (content!115 (toList!813 lt!57993)) lt!57726))))

(declare-fun e!73154 () Bool)

(assert (=> d!31999 (= lt!58257 e!73154)))

(declare-fun res!55498 () Bool)

(assert (=> d!31999 (=> (not res!55498) (not e!73154))))

(assert (=> d!31999 (= res!55498 ((_ is Cons!1630) (toList!813 lt!57993)))))

(assert (=> d!31999 (= (contains!845 (toList!813 lt!57993) lt!57726) lt!58257)))

(declare-fun b!112550 () Bool)

(declare-fun e!73153 () Bool)

(assert (=> b!112550 (= e!73154 e!73153)))

(declare-fun res!55499 () Bool)

(assert (=> b!112550 (=> res!55499 e!73153)))

(assert (=> b!112550 (= res!55499 (= (h!2230 (toList!813 lt!57993)) lt!57726))))

(declare-fun b!112551 () Bool)

(assert (=> b!112551 (= e!73153 (contains!845 (t!5792 (toList!813 lt!57993)) lt!57726))))

(assert (= (and d!31999 res!55498) b!112550))

(assert (= (and b!112550 (not res!55499)) b!112551))

(declare-fun m!128515 () Bool)

(assert (=> d!31999 m!128515))

(declare-fun m!128517 () Bool)

(assert (=> d!31999 m!128517))

(declare-fun m!128519 () Bool)

(assert (=> b!112551 m!128519))

(assert (=> b!112195 d!31999))

(declare-fun d!32001 () Bool)

(declare-fun e!73155 () Bool)

(assert (=> d!32001 e!73155))

(declare-fun res!55500 () Bool)

(assert (=> d!32001 (=> res!55500 e!73155)))

(declare-fun lt!58258 () Bool)

(assert (=> d!32001 (= res!55500 (not lt!58258))))

(declare-fun lt!58259 () Bool)

(assert (=> d!32001 (= lt!58258 lt!58259)))

(declare-fun lt!58260 () Unit!3485)

(declare-fun e!73156 () Unit!3485)

(assert (=> d!32001 (= lt!58260 e!73156)))

(declare-fun c!20141 () Bool)

(assert (=> d!32001 (= c!20141 lt!58259)))

(assert (=> d!32001 (= lt!58259 (containsKey!163 (toList!813 lt!57914) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!32001 (= (contains!842 lt!57914 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!58258)))

(declare-fun b!112552 () Bool)

(declare-fun lt!58261 () Unit!3485)

(assert (=> b!112552 (= e!73156 lt!58261)))

(assert (=> b!112552 (= lt!58261 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57914) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112552 (isDefined!112 (getValueByKey!159 (toList!813 lt!57914) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!112553 () Bool)

(declare-fun Unit!3510 () Unit!3485)

(assert (=> b!112553 (= e!73156 Unit!3510)))

(declare-fun b!112554 () Bool)

(assert (=> b!112554 (= e!73155 (isDefined!112 (getValueByKey!159 (toList!813 lt!57914) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!32001 c!20141) b!112552))

(assert (= (and d!32001 (not c!20141)) b!112553))

(assert (= (and d!32001 (not res!55500)) b!112554))

(assert (=> d!32001 m!127831))

(declare-fun m!128521 () Bool)

(assert (=> d!32001 m!128521))

(assert (=> b!112552 m!127831))

(declare-fun m!128523 () Bool)

(assert (=> b!112552 m!128523))

(assert (=> b!112552 m!127831))

(assert (=> b!112552 m!128357))

(assert (=> b!112552 m!128357))

(declare-fun m!128525 () Bool)

(assert (=> b!112552 m!128525))

(assert (=> b!112554 m!127831))

(assert (=> b!112554 m!128357))

(assert (=> b!112554 m!128357))

(assert (=> b!112554 m!128525))

(assert (=> b!112081 d!32001))

(declare-fun d!32003 () Bool)

(declare-fun res!55501 () Bool)

(declare-fun e!73157 () Bool)

(assert (=> d!32003 (=> (not res!55501) (not e!73157))))

(assert (=> d!32003 (= res!55501 (simpleValid!77 (_2!1235 lt!57844)))))

(assert (=> d!32003 (= (valid!432 (_2!1235 lt!57844)) e!73157)))

(declare-fun b!112555 () Bool)

(declare-fun res!55502 () Bool)

(assert (=> b!112555 (=> (not res!55502) (not e!73157))))

(assert (=> b!112555 (= res!55502 (= (arrayCountValidKeys!0 (_keys!4366 (_2!1235 lt!57844)) #b00000000000000000000000000000000 (size!2345 (_keys!4366 (_2!1235 lt!57844)))) (_size!511 (_2!1235 lt!57844))))))

(declare-fun b!112556 () Bool)

(declare-fun res!55503 () Bool)

(assert (=> b!112556 (=> (not res!55503) (not e!73157))))

(assert (=> b!112556 (= res!55503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4366 (_2!1235 lt!57844)) (mask!6826 (_2!1235 lt!57844))))))

(declare-fun b!112557 () Bool)

(assert (=> b!112557 (= e!73157 (arrayNoDuplicates!0 (_keys!4366 (_2!1235 lt!57844)) #b00000000000000000000000000000000 Nil!1632))))

(assert (= (and d!32003 res!55501) b!112555))

(assert (= (and b!112555 res!55502) b!112556))

(assert (= (and b!112556 res!55503) b!112557))

(declare-fun m!128527 () Bool)

(assert (=> d!32003 m!128527))

(declare-fun m!128529 () Bool)

(assert (=> b!112555 m!128529))

(declare-fun m!128531 () Bool)

(assert (=> b!112556 m!128531))

(declare-fun m!128533 () Bool)

(assert (=> b!112557 m!128533))

(assert (=> d!31839 d!32003))

(assert (=> d!31839 d!31851))

(declare-fun d!32005 () Bool)

(assert (=> d!32005 (= (+!152 (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 lt!57730)) (getCurrentListMap!497 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) lt!57849 lt!57730 (minValue!2517 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2648 newMap!16)))))

(declare-fun lt!58264 () Unit!3485)

(declare-fun choose!705 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 V!3251 Int) Unit!3485)

(assert (=> d!32005 (= lt!58264 (choose!705 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) lt!57849 (zeroValue!2517 newMap!16) lt!57730 (minValue!2517 newMap!16) (defaultEntry!2648 newMap!16)))))

(assert (=> d!32005 (validMask!0 (mask!6826 newMap!16))))

(assert (=> d!32005 (= (lemmaChangeZeroKeyThenAddPairToListMap!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) lt!57849 (zeroValue!2517 newMap!16) lt!57730 (minValue!2517 newMap!16) (defaultEntry!2648 newMap!16)) lt!58264)))

(declare-fun bs!4627 () Bool)

(assert (= bs!4627 d!32005))

(assert (=> bs!4627 m!127773))

(declare-fun m!128535 () Bool)

(assert (=> bs!4627 m!128535))

(declare-fun m!128537 () Bool)

(assert (=> bs!4627 m!128537))

(assert (=> bs!4627 m!128047))

(assert (=> bs!4627 m!127773))

(declare-fun m!128539 () Bool)

(assert (=> bs!4627 m!128539))

(assert (=> b!112031 d!32005))

(declare-fun d!32007 () Bool)

(assert (=> d!32007 (= (apply!101 lt!57915 lt!57911) (get!1357 (getValueByKey!159 (toList!813 lt!57915) lt!57911)))))

(declare-fun bs!4628 () Bool)

(assert (= bs!4628 d!32007))

(declare-fun m!128541 () Bool)

(assert (=> bs!4628 m!128541))

(assert (=> bs!4628 m!128541))

(declare-fun m!128543 () Bool)

(assert (=> bs!4628 m!128543))

(assert (=> b!112086 d!32007))

(declare-fun d!32009 () Bool)

(declare-fun e!73158 () Bool)

(assert (=> d!32009 e!73158))

(declare-fun res!55504 () Bool)

(assert (=> d!32009 (=> (not res!55504) (not e!73158))))

(declare-fun lt!58268 () ListLongMap!1595)

(assert (=> d!32009 (= res!55504 (contains!842 lt!58268 (_1!1234 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!58266 () List!1634)

(assert (=> d!32009 (= lt!58268 (ListLongMap!1596 lt!58266))))

(declare-fun lt!58267 () Unit!3485)

(declare-fun lt!58265 () Unit!3485)

(assert (=> d!32009 (= lt!58267 lt!58265)))

(assert (=> d!32009 (= (getValueByKey!159 lt!58266 (_1!1234 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32009 (= lt!58265 (lemmaContainsTupThenGetReturnValue!75 lt!58266 (_1!1234 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32009 (= lt!58266 (insertStrictlySorted!78 (toList!813 lt!57921) (_1!1234 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32009 (= (+!152 lt!57921 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!58268)))

(declare-fun b!112558 () Bool)

(declare-fun res!55505 () Bool)

(assert (=> b!112558 (=> (not res!55505) (not e!73158))))

(assert (=> b!112558 (= res!55505 (= (getValueByKey!159 (toList!813 lt!58268) (_1!1234 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112559 () Bool)

(assert (=> b!112559 (= e!73158 (contains!845 (toList!813 lt!58268) (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!32009 res!55504) b!112558))

(assert (= (and b!112558 res!55505) b!112559))

(declare-fun m!128545 () Bool)

(assert (=> d!32009 m!128545))

(declare-fun m!128547 () Bool)

(assert (=> d!32009 m!128547))

(declare-fun m!128549 () Bool)

(assert (=> d!32009 m!128549))

(declare-fun m!128551 () Bool)

(assert (=> d!32009 m!128551))

(declare-fun m!128553 () Bool)

(assert (=> b!112558 m!128553))

(declare-fun m!128555 () Bool)

(assert (=> b!112559 m!128555))

(assert (=> b!112086 d!32009))

(declare-fun d!32011 () Bool)

(declare-fun e!73159 () Bool)

(assert (=> d!32011 e!73159))

(declare-fun res!55506 () Bool)

(assert (=> d!32011 (=> (not res!55506) (not e!73159))))

(declare-fun lt!58272 () ListLongMap!1595)

(assert (=> d!32011 (= res!55506 (contains!842 lt!58272 (_1!1234 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!58270 () List!1634)

(assert (=> d!32011 (= lt!58272 (ListLongMap!1596 lt!58270))))

(declare-fun lt!58271 () Unit!3485)

(declare-fun lt!58269 () Unit!3485)

(assert (=> d!32011 (= lt!58271 lt!58269)))

(assert (=> d!32011 (= (getValueByKey!159 lt!58270 (_1!1234 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32011 (= lt!58269 (lemmaContainsTupThenGetReturnValue!75 lt!58270 (_1!1234 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32011 (= lt!58270 (insertStrictlySorted!78 (toList!813 lt!57913) (_1!1234 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32011 (= (+!152 lt!57913 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!58272)))

(declare-fun b!112560 () Bool)

(declare-fun res!55507 () Bool)

(assert (=> b!112560 (=> (not res!55507) (not e!73159))))

(assert (=> b!112560 (= res!55507 (= (getValueByKey!159 (toList!813 lt!58272) (_1!1234 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112561 () Bool)

(assert (=> b!112561 (= e!73159 (contains!845 (toList!813 lt!58272) (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!32011 res!55506) b!112560))

(assert (= (and b!112560 res!55507) b!112561))

(declare-fun m!128557 () Bool)

(assert (=> d!32011 m!128557))

(declare-fun m!128559 () Bool)

(assert (=> d!32011 m!128559))

(declare-fun m!128561 () Bool)

(assert (=> d!32011 m!128561))

(declare-fun m!128563 () Bool)

(assert (=> d!32011 m!128563))

(declare-fun m!128565 () Bool)

(assert (=> b!112560 m!128565))

(declare-fun m!128567 () Bool)

(assert (=> b!112561 m!128567))

(assert (=> b!112086 d!32011))

(declare-fun d!32013 () Bool)

(assert (=> d!32013 (= (apply!101 (+!152 lt!57913 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57918) (get!1357 (getValueByKey!159 (toList!813 (+!152 lt!57913 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))) lt!57918)))))

(declare-fun bs!4629 () Bool)

(assert (= bs!4629 d!32013))

(declare-fun m!128569 () Bool)

(assert (=> bs!4629 m!128569))

(assert (=> bs!4629 m!128569))

(declare-fun m!128571 () Bool)

(assert (=> bs!4629 m!128571))

(assert (=> b!112086 d!32013))

(declare-fun d!32015 () Bool)

(assert (=> d!32015 (= (apply!101 (+!152 lt!57921 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57922) (apply!101 lt!57921 lt!57922))))

(declare-fun lt!58275 () Unit!3485)

(declare-fun choose!706 (ListLongMap!1595 (_ BitVec 64) V!3251 (_ BitVec 64)) Unit!3485)

(assert (=> d!32015 (= lt!58275 (choose!706 lt!57921 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57922))))

(declare-fun e!73162 () Bool)

(assert (=> d!32015 e!73162))

(declare-fun res!55510 () Bool)

(assert (=> d!32015 (=> (not res!55510) (not e!73162))))

(assert (=> d!32015 (= res!55510 (contains!842 lt!57921 lt!57922))))

(assert (=> d!32015 (= (addApplyDifferent!77 lt!57921 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57922) lt!58275)))

(declare-fun b!112565 () Bool)

(assert (=> b!112565 (= e!73162 (not (= lt!57922 lt!57924)))))

(assert (= (and d!32015 res!55510) b!112565))

(assert (=> d!32015 m!127837))

(assert (=> d!32015 m!127859))

(assert (=> d!32015 m!127839))

(declare-fun m!128573 () Bool)

(assert (=> d!32015 m!128573))

(assert (=> d!32015 m!127837))

(declare-fun m!128575 () Bool)

(assert (=> d!32015 m!128575))

(assert (=> b!112086 d!32015))

(declare-fun d!32017 () Bool)

(assert (=> d!32017 (= (apply!101 lt!57921 lt!57922) (get!1357 (getValueByKey!159 (toList!813 lt!57921) lt!57922)))))

(declare-fun bs!4630 () Bool)

(assert (= bs!4630 d!32017))

(declare-fun m!128577 () Bool)

(assert (=> bs!4630 m!128577))

(assert (=> bs!4630 m!128577))

(declare-fun m!128579 () Bool)

(assert (=> bs!4630 m!128579))

(assert (=> b!112086 d!32017))

(declare-fun d!32019 () Bool)

(assert (=> d!32019 (= (apply!101 (+!152 lt!57915 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57911) (apply!101 lt!57915 lt!57911))))

(declare-fun lt!58276 () Unit!3485)

(assert (=> d!32019 (= lt!58276 (choose!706 lt!57915 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57911))))

(declare-fun e!73163 () Bool)

(assert (=> d!32019 e!73163))

(declare-fun res!55511 () Bool)

(assert (=> d!32019 (=> (not res!55511) (not e!73163))))

(assert (=> d!32019 (= res!55511 (contains!842 lt!57915 lt!57911))))

(assert (=> d!32019 (= (addApplyDifferent!77 lt!57915 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57911) lt!58276)))

(declare-fun b!112566 () Bool)

(assert (=> b!112566 (= e!73163 (not (= lt!57911 lt!57912)))))

(assert (= (and d!32019 res!55511) b!112566))

(assert (=> d!32019 m!127845))

(assert (=> d!32019 m!127855))

(assert (=> d!32019 m!127833))

(declare-fun m!128581 () Bool)

(assert (=> d!32019 m!128581))

(assert (=> d!32019 m!127845))

(declare-fun m!128583 () Bool)

(assert (=> d!32019 m!128583))

(assert (=> b!112086 d!32019))

(declare-fun d!32021 () Bool)

(declare-fun e!73164 () Bool)

(assert (=> d!32021 e!73164))

(declare-fun res!55512 () Bool)

(assert (=> d!32021 (=> (not res!55512) (not e!73164))))

(declare-fun lt!58280 () ListLongMap!1595)

(assert (=> d!32021 (= res!55512 (contains!842 lt!58280 (_1!1234 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!58278 () List!1634)

(assert (=> d!32021 (= lt!58280 (ListLongMap!1596 lt!58278))))

(declare-fun lt!58279 () Unit!3485)

(declare-fun lt!58277 () Unit!3485)

(assert (=> d!32021 (= lt!58279 lt!58277)))

(assert (=> d!32021 (= (getValueByKey!159 lt!58278 (_1!1234 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32021 (= lt!58277 (lemmaContainsTupThenGetReturnValue!75 lt!58278 (_1!1234 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32021 (= lt!58278 (insertStrictlySorted!78 (toList!813 lt!57920) (_1!1234 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32021 (= (+!152 lt!57920 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!58280)))

(declare-fun b!112567 () Bool)

(declare-fun res!55513 () Bool)

(assert (=> b!112567 (=> (not res!55513) (not e!73164))))

(assert (=> b!112567 (= res!55513 (= (getValueByKey!159 (toList!813 lt!58280) (_1!1234 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112568 () Bool)

(assert (=> b!112568 (= e!73164 (contains!845 (toList!813 lt!58280) (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!32021 res!55512) b!112567))

(assert (= (and b!112567 res!55513) b!112568))

(declare-fun m!128585 () Bool)

(assert (=> d!32021 m!128585))

(declare-fun m!128587 () Bool)

(assert (=> d!32021 m!128587))

(declare-fun m!128589 () Bool)

(assert (=> d!32021 m!128589))

(declare-fun m!128591 () Bool)

(assert (=> d!32021 m!128591))

(declare-fun m!128593 () Bool)

(assert (=> b!112567 m!128593))

(declare-fun m!128595 () Bool)

(assert (=> b!112568 m!128595))

(assert (=> b!112086 d!32021))

(declare-fun d!32023 () Bool)

(assert (=> d!32023 (contains!842 (+!152 lt!57920 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57925)))

(declare-fun lt!58283 () Unit!3485)

(declare-fun choose!707 (ListLongMap!1595 (_ BitVec 64) V!3251 (_ BitVec 64)) Unit!3485)

(assert (=> d!32023 (= lt!58283 (choose!707 lt!57920 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57925))))

(assert (=> d!32023 (contains!842 lt!57920 lt!57925)))

(assert (=> d!32023 (= (addStillContains!77 lt!57920 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57925) lt!58283)))

(declare-fun bs!4631 () Bool)

(assert (= bs!4631 d!32023))

(assert (=> bs!4631 m!127849))

(assert (=> bs!4631 m!127849))

(assert (=> bs!4631 m!127851))

(declare-fun m!128597 () Bool)

(assert (=> bs!4631 m!128597))

(declare-fun m!128599 () Bool)

(assert (=> bs!4631 m!128599))

(assert (=> b!112086 d!32023))

(declare-fun d!32025 () Bool)

(assert (=> d!32025 (= (apply!101 (+!152 lt!57921 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57922) (get!1357 (getValueByKey!159 (toList!813 (+!152 lt!57921 (tuple2!2447 lt!57924 (minValue!2517 (v!2946 (underlying!373 thiss!992)))))) lt!57922)))))

(declare-fun bs!4632 () Bool)

(assert (= bs!4632 d!32025))

(declare-fun m!128601 () Bool)

(assert (=> bs!4632 m!128601))

(assert (=> bs!4632 m!128601))

(declare-fun m!128603 () Bool)

(assert (=> bs!4632 m!128603))

(assert (=> b!112086 d!32025))

(declare-fun d!32027 () Bool)

(assert (=> d!32027 (= (apply!101 lt!57913 lt!57918) (get!1357 (getValueByKey!159 (toList!813 lt!57913) lt!57918)))))

(declare-fun bs!4633 () Bool)

(assert (= bs!4633 d!32027))

(declare-fun m!128605 () Bool)

(assert (=> bs!4633 m!128605))

(assert (=> bs!4633 m!128605))

(declare-fun m!128607 () Bool)

(assert (=> bs!4633 m!128607))

(assert (=> b!112086 d!32027))

(declare-fun d!32029 () Bool)

(declare-fun e!73165 () Bool)

(assert (=> d!32029 e!73165))

(declare-fun res!55514 () Bool)

(assert (=> d!32029 (=> res!55514 e!73165)))

(declare-fun lt!58284 () Bool)

(assert (=> d!32029 (= res!55514 (not lt!58284))))

(declare-fun lt!58285 () Bool)

(assert (=> d!32029 (= lt!58284 lt!58285)))

(declare-fun lt!58286 () Unit!3485)

(declare-fun e!73166 () Unit!3485)

(assert (=> d!32029 (= lt!58286 e!73166)))

(declare-fun c!20142 () Bool)

(assert (=> d!32029 (= c!20142 lt!58285)))

(assert (=> d!32029 (= lt!58285 (containsKey!163 (toList!813 (+!152 lt!57920 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) lt!57925))))

(assert (=> d!32029 (= (contains!842 (+!152 lt!57920 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57925) lt!58284)))

(declare-fun b!112570 () Bool)

(declare-fun lt!58287 () Unit!3485)

(assert (=> b!112570 (= e!73166 lt!58287)))

(assert (=> b!112570 (= lt!58287 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 (+!152 lt!57920 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) lt!57925))))

(assert (=> b!112570 (isDefined!112 (getValueByKey!159 (toList!813 (+!152 lt!57920 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) lt!57925))))

(declare-fun b!112571 () Bool)

(declare-fun Unit!3511 () Unit!3485)

(assert (=> b!112571 (= e!73166 Unit!3511)))

(declare-fun b!112572 () Bool)

(assert (=> b!112572 (= e!73165 (isDefined!112 (getValueByKey!159 (toList!813 (+!152 lt!57920 (tuple2!2447 lt!57919 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) lt!57925)))))

(assert (= (and d!32029 c!20142) b!112570))

(assert (= (and d!32029 (not c!20142)) b!112571))

(assert (= (and d!32029 (not res!55514)) b!112572))

(declare-fun m!128609 () Bool)

(assert (=> d!32029 m!128609))

(declare-fun m!128611 () Bool)

(assert (=> b!112570 m!128611))

(declare-fun m!128613 () Bool)

(assert (=> b!112570 m!128613))

(assert (=> b!112570 m!128613))

(declare-fun m!128615 () Bool)

(assert (=> b!112570 m!128615))

(assert (=> b!112572 m!128613))

(assert (=> b!112572 m!128613))

(assert (=> b!112572 m!128615))

(assert (=> b!112086 d!32029))

(assert (=> b!112086 d!31865))

(declare-fun d!32031 () Bool)

(assert (=> d!32031 (= (apply!101 (+!152 lt!57913 (tuple2!2447 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57918) (apply!101 lt!57913 lt!57918))))

(declare-fun lt!58288 () Unit!3485)

(assert (=> d!32031 (= lt!58288 (choose!706 lt!57913 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57918))))

(declare-fun e!73167 () Bool)

(assert (=> d!32031 e!73167))

(declare-fun res!55515 () Bool)

(assert (=> d!32031 (=> (not res!55515) (not e!73167))))

(assert (=> d!32031 (= res!55515 (contains!842 lt!57913 lt!57918))))

(assert (=> d!32031 (= (addApplyDifferent!77 lt!57913 lt!57928 (minValue!2517 (v!2946 (underlying!373 thiss!992))) lt!57918) lt!58288)))

(declare-fun b!112573 () Bool)

(assert (=> b!112573 (= e!73167 (not (= lt!57918 lt!57928)))))

(assert (= (and d!32031 res!55515) b!112573))

(assert (=> d!32031 m!127835))

(assert (=> d!32031 m!127861))

(assert (=> d!32031 m!127853))

(declare-fun m!128617 () Bool)

(assert (=> d!32031 m!128617))

(assert (=> d!32031 m!127835))

(declare-fun m!128619 () Bool)

(assert (=> d!32031 m!128619))

(assert (=> b!112086 d!32031))

(declare-fun d!32033 () Bool)

(declare-fun e!73168 () Bool)

(assert (=> d!32033 e!73168))

(declare-fun res!55516 () Bool)

(assert (=> d!32033 (=> (not res!55516) (not e!73168))))

(declare-fun lt!58292 () ListLongMap!1595)

(assert (=> d!32033 (= res!55516 (contains!842 lt!58292 (_1!1234 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!58290 () List!1634)

(assert (=> d!32033 (= lt!58292 (ListLongMap!1596 lt!58290))))

(declare-fun lt!58291 () Unit!3485)

(declare-fun lt!58289 () Unit!3485)

(assert (=> d!32033 (= lt!58291 lt!58289)))

(assert (=> d!32033 (= (getValueByKey!159 lt!58290 (_1!1234 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32033 (= lt!58289 (lemmaContainsTupThenGetReturnValue!75 lt!58290 (_1!1234 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32033 (= lt!58290 (insertStrictlySorted!78 (toList!813 lt!57915) (_1!1234 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32033 (= (+!152 lt!57915 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!58292)))

(declare-fun b!112574 () Bool)

(declare-fun res!55517 () Bool)

(assert (=> b!112574 (=> (not res!55517) (not e!73168))))

(assert (=> b!112574 (= res!55517 (= (getValueByKey!159 (toList!813 lt!58292) (_1!1234 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112575 () Bool)

(assert (=> b!112575 (= e!73168 (contains!845 (toList!813 lt!58292) (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!32033 res!55516) b!112574))

(assert (= (and b!112574 res!55517) b!112575))

(declare-fun m!128621 () Bool)

(assert (=> d!32033 m!128621))

(declare-fun m!128623 () Bool)

(assert (=> d!32033 m!128623))

(declare-fun m!128625 () Bool)

(assert (=> d!32033 m!128625))

(declare-fun m!128627 () Bool)

(assert (=> d!32033 m!128627))

(declare-fun m!128629 () Bool)

(assert (=> b!112574 m!128629))

(declare-fun m!128631 () Bool)

(assert (=> b!112575 m!128631))

(assert (=> b!112086 d!32033))

(declare-fun d!32035 () Bool)

(assert (=> d!32035 (= (apply!101 (+!152 lt!57915 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!57911) (get!1357 (getValueByKey!159 (toList!813 (+!152 lt!57915 (tuple2!2447 lt!57912 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) lt!57911)))))

(declare-fun bs!4634 () Bool)

(assert (= bs!4634 d!32035))

(declare-fun m!128633 () Bool)

(assert (=> bs!4634 m!128633))

(assert (=> bs!4634 m!128633))

(declare-fun m!128635 () Bool)

(assert (=> bs!4634 m!128635))

(assert (=> b!112086 d!32035))

(declare-fun d!32037 () Bool)

(declare-fun e!73169 () Bool)

(assert (=> d!32037 e!73169))

(declare-fun res!55518 () Bool)

(assert (=> d!32037 (=> res!55518 e!73169)))

(declare-fun lt!58293 () Bool)

(assert (=> d!32037 (= res!55518 (not lt!58293))))

(declare-fun lt!58294 () Bool)

(assert (=> d!32037 (= lt!58293 lt!58294)))

(declare-fun lt!58295 () Unit!3485)

(declare-fun e!73170 () Unit!3485)

(assert (=> d!32037 (= lt!58295 e!73170)))

(declare-fun c!20143 () Bool)

(assert (=> d!32037 (= c!20143 lt!58294)))

(assert (=> d!32037 (= lt!58294 (containsKey!163 (toList!813 lt!57914) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32037 (= (contains!842 lt!57914 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58293)))

(declare-fun b!112576 () Bool)

(declare-fun lt!58296 () Unit!3485)

(assert (=> b!112576 (= e!73170 lt!58296)))

(assert (=> b!112576 (= lt!58296 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57914) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112576 (isDefined!112 (getValueByKey!159 (toList!813 lt!57914) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112577 () Bool)

(declare-fun Unit!3512 () Unit!3485)

(assert (=> b!112577 (= e!73170 Unit!3512)))

(declare-fun b!112578 () Bool)

(assert (=> b!112578 (= e!73169 (isDefined!112 (getValueByKey!159 (toList!813 lt!57914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32037 c!20143) b!112576))

(assert (= (and d!32037 (not c!20143)) b!112577))

(assert (= (and d!32037 (not res!55518)) b!112578))

(declare-fun m!128637 () Bool)

(assert (=> d!32037 m!128637))

(declare-fun m!128639 () Bool)

(assert (=> b!112576 m!128639))

(assert (=> b!112576 m!128235))

(assert (=> b!112576 m!128235))

(declare-fun m!128641 () Bool)

(assert (=> b!112576 m!128641))

(assert (=> b!112578 m!128235))

(assert (=> b!112578 m!128235))

(assert (=> b!112578 m!128641))

(assert (=> bm!12022 d!32037))

(assert (=> d!31841 d!31915))

(assert (=> b!112003 d!31915))

(declare-fun d!32039 () Bool)

(declare-fun e!73171 () Bool)

(assert (=> d!32039 e!73171))

(declare-fun res!55519 () Bool)

(assert (=> d!32039 (=> res!55519 e!73171)))

(declare-fun lt!58297 () Bool)

(assert (=> d!32039 (= res!55519 (not lt!58297))))

(declare-fun lt!58298 () Bool)

(assert (=> d!32039 (= lt!58297 lt!58298)))

(declare-fun lt!58299 () Unit!3485)

(declare-fun e!73172 () Unit!3485)

(assert (=> d!32039 (= lt!58299 e!73172)))

(declare-fun c!20144 () Bool)

(assert (=> d!32039 (= c!20144 lt!58298)))

(assert (=> d!32039 (= lt!58298 (containsKey!163 (toList!813 lt!57985) (_1!1234 lt!57733)))))

(assert (=> d!32039 (= (contains!842 lt!57985 (_1!1234 lt!57733)) lt!58297)))

(declare-fun b!112579 () Bool)

(declare-fun lt!58300 () Unit!3485)

(assert (=> b!112579 (= e!73172 lt!58300)))

(assert (=> b!112579 (= lt!58300 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57985) (_1!1234 lt!57733)))))

(assert (=> b!112579 (isDefined!112 (getValueByKey!159 (toList!813 lt!57985) (_1!1234 lt!57733)))))

(declare-fun b!112580 () Bool)

(declare-fun Unit!3513 () Unit!3485)

(assert (=> b!112580 (= e!73172 Unit!3513)))

(declare-fun b!112581 () Bool)

(assert (=> b!112581 (= e!73171 (isDefined!112 (getValueByKey!159 (toList!813 lt!57985) (_1!1234 lt!57733))))))

(assert (= (and d!32039 c!20144) b!112579))

(assert (= (and d!32039 (not c!20144)) b!112580))

(assert (= (and d!32039 (not res!55519)) b!112581))

(declare-fun m!128643 () Bool)

(assert (=> d!32039 m!128643))

(declare-fun m!128645 () Bool)

(assert (=> b!112579 m!128645))

(assert (=> b!112579 m!127957))

(assert (=> b!112579 m!127957))

(declare-fun m!128647 () Bool)

(assert (=> b!112579 m!128647))

(assert (=> b!112581 m!127957))

(assert (=> b!112581 m!127957))

(assert (=> b!112581 m!128647))

(assert (=> d!31869 d!32039))

(declare-fun b!112583 () Bool)

(declare-fun e!73173 () Option!165)

(declare-fun e!73174 () Option!165)

(assert (=> b!112583 (= e!73173 e!73174)))

(declare-fun c!20146 () Bool)

(assert (=> b!112583 (= c!20146 (and ((_ is Cons!1630) lt!57983) (not (= (_1!1234 (h!2230 lt!57983)) (_1!1234 lt!57733)))))))

(declare-fun b!112584 () Bool)

(assert (=> b!112584 (= e!73174 (getValueByKey!159 (t!5792 lt!57983) (_1!1234 lt!57733)))))

(declare-fun b!112582 () Bool)

(assert (=> b!112582 (= e!73173 (Some!164 (_2!1234 (h!2230 lt!57983))))))

(declare-fun b!112585 () Bool)

(assert (=> b!112585 (= e!73174 None!163)))

(declare-fun d!32041 () Bool)

(declare-fun c!20145 () Bool)

(assert (=> d!32041 (= c!20145 (and ((_ is Cons!1630) lt!57983) (= (_1!1234 (h!2230 lt!57983)) (_1!1234 lt!57733))))))

(assert (=> d!32041 (= (getValueByKey!159 lt!57983 (_1!1234 lt!57733)) e!73173)))

(assert (= (and d!32041 c!20145) b!112582))

(assert (= (and d!32041 (not c!20145)) b!112583))

(assert (= (and b!112583 c!20146) b!112584))

(assert (= (and b!112583 (not c!20146)) b!112585))

(declare-fun m!128649 () Bool)

(assert (=> b!112584 m!128649))

(assert (=> d!31869 d!32041))

(declare-fun d!32043 () Bool)

(assert (=> d!32043 (= (getValueByKey!159 lt!57983 (_1!1234 lt!57733)) (Some!164 (_2!1234 lt!57733)))))

(declare-fun lt!58301 () Unit!3485)

(assert (=> d!32043 (= lt!58301 (choose!702 lt!57983 (_1!1234 lt!57733) (_2!1234 lt!57733)))))

(declare-fun e!73175 () Bool)

(assert (=> d!32043 e!73175))

(declare-fun res!55520 () Bool)

(assert (=> d!32043 (=> (not res!55520) (not e!73175))))

(assert (=> d!32043 (= res!55520 (isStrictlySorted!312 lt!57983))))

(assert (=> d!32043 (= (lemmaContainsTupThenGetReturnValue!75 lt!57983 (_1!1234 lt!57733) (_2!1234 lt!57733)) lt!58301)))

(declare-fun b!112586 () Bool)

(declare-fun res!55521 () Bool)

(assert (=> b!112586 (=> (not res!55521) (not e!73175))))

(assert (=> b!112586 (= res!55521 (containsKey!163 lt!57983 (_1!1234 lt!57733)))))

(declare-fun b!112587 () Bool)

(assert (=> b!112587 (= e!73175 (contains!845 lt!57983 (tuple2!2447 (_1!1234 lt!57733) (_2!1234 lt!57733))))))

(assert (= (and d!32043 res!55520) b!112586))

(assert (= (and b!112586 res!55521) b!112587))

(assert (=> d!32043 m!127951))

(declare-fun m!128651 () Bool)

(assert (=> d!32043 m!128651))

(declare-fun m!128653 () Bool)

(assert (=> d!32043 m!128653))

(declare-fun m!128655 () Bool)

(assert (=> b!112586 m!128655))

(declare-fun m!128657 () Bool)

(assert (=> b!112587 m!128657))

(assert (=> d!31869 d!32043))

(declare-fun b!112588 () Bool)

(declare-fun e!73178 () List!1634)

(declare-fun call!12092 () List!1634)

(assert (=> b!112588 (= e!73178 call!12092)))

(declare-fun e!73179 () List!1634)

(declare-fun c!20149 () Bool)

(declare-fun b!112589 () Bool)

(declare-fun c!20148 () Bool)

(assert (=> b!112589 (= e!73179 (ite c!20149 (t!5792 (toList!813 (+!152 lt!57731 lt!57726))) (ite c!20148 (Cons!1630 (h!2230 (toList!813 (+!152 lt!57731 lt!57726))) (t!5792 (toList!813 (+!152 lt!57731 lt!57726)))) Nil!1631)))))

(declare-fun b!112590 () Bool)

(assert (=> b!112590 (= e!73179 (insertStrictlySorted!78 (t!5792 (toList!813 (+!152 lt!57731 lt!57726))) (_1!1234 lt!57733) (_2!1234 lt!57733)))))

(declare-fun b!112591 () Bool)

(declare-fun e!73180 () Bool)

(declare-fun lt!58302 () List!1634)

(assert (=> b!112591 (= e!73180 (contains!845 lt!58302 (tuple2!2447 (_1!1234 lt!57733) (_2!1234 lt!57733))))))

(declare-fun b!112592 () Bool)

(declare-fun res!55522 () Bool)

(assert (=> b!112592 (=> (not res!55522) (not e!73180))))

(assert (=> b!112592 (= res!55522 (containsKey!163 lt!58302 (_1!1234 lt!57733)))))

(declare-fun b!112593 () Bool)

(declare-fun e!73177 () List!1634)

(assert (=> b!112593 (= e!73177 e!73178)))

(assert (=> b!112593 (= c!20149 (and ((_ is Cons!1630) (toList!813 (+!152 lt!57731 lt!57726))) (= (_1!1234 (h!2230 (toList!813 (+!152 lt!57731 lt!57726)))) (_1!1234 lt!57733))))))

(declare-fun bm!12089 () Bool)

(declare-fun call!12094 () List!1634)

(assert (=> bm!12089 (= call!12092 call!12094)))

(declare-fun b!112594 () Bool)

(declare-fun e!73176 () List!1634)

(declare-fun call!12093 () List!1634)

(assert (=> b!112594 (= e!73176 call!12093)))

(declare-fun d!32045 () Bool)

(assert (=> d!32045 e!73180))

(declare-fun res!55523 () Bool)

(assert (=> d!32045 (=> (not res!55523) (not e!73180))))

(assert (=> d!32045 (= res!55523 (isStrictlySorted!312 lt!58302))))

(assert (=> d!32045 (= lt!58302 e!73177)))

(declare-fun c!20147 () Bool)

(assert (=> d!32045 (= c!20147 (and ((_ is Cons!1630) (toList!813 (+!152 lt!57731 lt!57726))) (bvslt (_1!1234 (h!2230 (toList!813 (+!152 lt!57731 lt!57726)))) (_1!1234 lt!57733))))))

(assert (=> d!32045 (isStrictlySorted!312 (toList!813 (+!152 lt!57731 lt!57726)))))

(assert (=> d!32045 (= (insertStrictlySorted!78 (toList!813 (+!152 lt!57731 lt!57726)) (_1!1234 lt!57733) (_2!1234 lt!57733)) lt!58302)))

(declare-fun bm!12090 () Bool)

(assert (=> bm!12090 (= call!12093 call!12092)))

(declare-fun b!112595 () Bool)

(assert (=> b!112595 (= c!20148 (and ((_ is Cons!1630) (toList!813 (+!152 lt!57731 lt!57726))) (bvsgt (_1!1234 (h!2230 (toList!813 (+!152 lt!57731 lt!57726)))) (_1!1234 lt!57733))))))

(assert (=> b!112595 (= e!73178 e!73176)))

(declare-fun b!112596 () Bool)

(assert (=> b!112596 (= e!73177 call!12094)))

(declare-fun b!112597 () Bool)

(assert (=> b!112597 (= e!73176 call!12093)))

(declare-fun bm!12091 () Bool)

(assert (=> bm!12091 (= call!12094 ($colon$colon!84 e!73179 (ite c!20147 (h!2230 (toList!813 (+!152 lt!57731 lt!57726))) (tuple2!2447 (_1!1234 lt!57733) (_2!1234 lt!57733)))))))

(declare-fun c!20150 () Bool)

(assert (=> bm!12091 (= c!20150 c!20147)))

(assert (= (and d!32045 c!20147) b!112596))

(assert (= (and d!32045 (not c!20147)) b!112593))

(assert (= (and b!112593 c!20149) b!112588))

(assert (= (and b!112593 (not c!20149)) b!112595))

(assert (= (and b!112595 c!20148) b!112594))

(assert (= (and b!112595 (not c!20148)) b!112597))

(assert (= (or b!112594 b!112597) bm!12090))

(assert (= (or b!112588 bm!12090) bm!12089))

(assert (= (or b!112596 bm!12089) bm!12091))

(assert (= (and bm!12091 c!20150) b!112590))

(assert (= (and bm!12091 (not c!20150)) b!112589))

(assert (= (and d!32045 res!55523) b!112592))

(assert (= (and b!112592 res!55522) b!112591))

(declare-fun m!128659 () Bool)

(assert (=> b!112592 m!128659))

(declare-fun m!128661 () Bool)

(assert (=> bm!12091 m!128661))

(declare-fun m!128663 () Bool)

(assert (=> b!112591 m!128663))

(declare-fun m!128665 () Bool)

(assert (=> b!112590 m!128665))

(declare-fun m!128667 () Bool)

(assert (=> d!32045 m!128667))

(declare-fun m!128669 () Bool)

(assert (=> d!32045 m!128669))

(assert (=> d!31869 d!32045))

(declare-fun d!32047 () Bool)

(declare-fun e!73183 () Bool)

(assert (=> d!32047 e!73183))

(declare-fun res!55529 () Bool)

(assert (=> d!32047 (=> (not res!55529) (not e!73183))))

(declare-fun lt!58307 () SeekEntryResult!262)

(assert (=> d!32047 (= res!55529 ((_ is Found!262) lt!58307))))

(assert (=> d!32047 (= lt!58307 (seekEntryOrOpen!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (_keys!4366 newMap!16) (mask!6826 newMap!16)))))

(declare-fun lt!58308 () Unit!3485)

(declare-fun choose!708 (array!4403 array!4405 (_ BitVec 32) (_ BitVec 32) V!3251 V!3251 (_ BitVec 64) Int) Unit!3485)

(assert (=> d!32047 (= lt!58308 (choose!708 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2648 newMap!16)))))

(assert (=> d!32047 (validMask!0 (mask!6826 newMap!16))))

(assert (=> d!32047 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!50 (_keys!4366 newMap!16) (_values!2631 newMap!16) (mask!6826 newMap!16) (extraKeys!2441 newMap!16) (zeroValue!2517 newMap!16) (minValue!2517 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (defaultEntry!2648 newMap!16)) lt!58308)))

(declare-fun b!112602 () Bool)

(declare-fun res!55528 () Bool)

(assert (=> b!112602 (=> (not res!55528) (not e!73183))))

(assert (=> b!112602 (= res!55528 (inRange!0 (index!3200 lt!58307) (mask!6826 newMap!16)))))

(declare-fun b!112603 () Bool)

(assert (=> b!112603 (= e!73183 (= (select (arr!2087 (_keys!4366 newMap!16)) (index!3200 lt!58307)) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> b!112603 (and (bvsge (index!3200 lt!58307) #b00000000000000000000000000000000) (bvslt (index!3200 lt!58307) (size!2345 (_keys!4366 newMap!16))))))

(assert (= (and d!32047 res!55529) b!112602))

(assert (= (and b!112602 res!55528) b!112603))

(assert (=> d!32047 m!127651))

(assert (=> d!32047 m!127785))

(assert (=> d!32047 m!127651))

(declare-fun m!128671 () Bool)

(assert (=> d!32047 m!128671))

(assert (=> d!32047 m!128047))

(declare-fun m!128673 () Bool)

(assert (=> b!112602 m!128673))

(declare-fun m!128675 () Bool)

(assert (=> b!112603 m!128675))

(assert (=> bm!11987 d!32047))

(assert (=> b!112175 d!31919))

(declare-fun b!112604 () Bool)

(declare-fun e!73184 () Bool)

(declare-fun call!12095 () Bool)

(assert (=> b!112604 (= e!73184 call!12095)))

(declare-fun b!112605 () Bool)

(declare-fun e!73186 () Bool)

(assert (=> b!112605 (= e!73186 call!12095)))

(declare-fun b!112606 () Bool)

(declare-fun e!73185 () Bool)

(assert (=> b!112606 (= e!73185 e!73184)))

(declare-fun c!20151 () Bool)

(assert (=> b!112606 (= c!20151 (validKeyInArray!0 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12092 () Bool)

(assert (=> bm!12092 (= call!12095 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4366 newMap!16) (mask!6826 newMap!16)))))

(declare-fun b!112607 () Bool)

(assert (=> b!112607 (= e!73184 e!73186)))

(declare-fun lt!58311 () (_ BitVec 64))

(assert (=> b!112607 (= lt!58311 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58310 () Unit!3485)

(assert (=> b!112607 (= lt!58310 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4366 newMap!16) lt!58311 #b00000000000000000000000000000000))))

(assert (=> b!112607 (arrayContainsKey!0 (_keys!4366 newMap!16) lt!58311 #b00000000000000000000000000000000)))

(declare-fun lt!58309 () Unit!3485)

(assert (=> b!112607 (= lt!58309 lt!58310)))

(declare-fun res!55531 () Bool)

(assert (=> b!112607 (= res!55531 (= (seekEntryOrOpen!0 (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000) (_keys!4366 newMap!16) (mask!6826 newMap!16)) (Found!262 #b00000000000000000000000000000000)))))

(assert (=> b!112607 (=> (not res!55531) (not e!73186))))

(declare-fun d!32049 () Bool)

(declare-fun res!55530 () Bool)

(assert (=> d!32049 (=> res!55530 e!73185)))

(assert (=> d!32049 (= res!55530 (bvsge #b00000000000000000000000000000000 (size!2345 (_keys!4366 newMap!16))))))

(assert (=> d!32049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4366 newMap!16) (mask!6826 newMap!16)) e!73185)))

(assert (= (and d!32049 (not res!55530)) b!112606))

(assert (= (and b!112606 c!20151) b!112607))

(assert (= (and b!112606 (not c!20151)) b!112604))

(assert (= (and b!112607 res!55531) b!112605))

(assert (= (or b!112605 b!112604) bm!12092))

(assert (=> b!112606 m!128073))

(assert (=> b!112606 m!128073))

(assert (=> b!112606 m!128111))

(declare-fun m!128677 () Bool)

(assert (=> bm!12092 m!128677))

(assert (=> b!112607 m!128073))

(declare-fun m!128679 () Bool)

(assert (=> b!112607 m!128679))

(declare-fun m!128681 () Bool)

(assert (=> b!112607 m!128681))

(assert (=> b!112607 m!128073))

(declare-fun m!128683 () Bool)

(assert (=> b!112607 m!128683))

(assert (=> b!112119 d!32049))

(declare-fun d!32051 () Bool)

(assert (=> d!32051 (= (apply!101 lt!57964 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1357 (getValueByKey!159 (toList!813 lt!57964) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4635 () Bool)

(assert (= bs!4635 d!32051))

(assert (=> bs!4635 m!127831))

(assert (=> bs!4635 m!128191))

(assert (=> bs!4635 m!128191))

(declare-fun m!128685 () Bool)

(assert (=> bs!4635 m!128685))

(assert (=> b!112182 d!32051))

(assert (=> b!112182 d!31967))

(declare-fun b!112608 () Bool)

(declare-fun e!73188 () Bool)

(declare-fun call!12096 () Bool)

(assert (=> b!112608 (= e!73188 call!12096)))

(declare-fun d!32053 () Bool)

(declare-fun res!55532 () Bool)

(declare-fun e!73189 () Bool)

(assert (=> d!32053 (=> res!55532 e!73189)))

(assert (=> d!32053 (= res!55532 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2345 (_keys!4366 (v!2946 (underlying!373 thiss!992))))))))

(assert (=> d!32053 (= (arrayNoDuplicates!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!20026 (Cons!1631 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1632) Nil!1632)) e!73189)))

(declare-fun b!112609 () Bool)

(declare-fun e!73187 () Bool)

(assert (=> b!112609 (= e!73187 e!73188)))

(declare-fun c!20152 () Bool)

(assert (=> b!112609 (= c!20152 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!112610 () Bool)

(assert (=> b!112610 (= e!73188 call!12096)))

(declare-fun bm!12093 () Bool)

(assert (=> bm!12093 (= call!12096 (arrayNoDuplicates!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!20152 (Cons!1631 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!20026 (Cons!1631 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1632) Nil!1632)) (ite c!20026 (Cons!1631 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1632) Nil!1632))))))

(declare-fun b!112611 () Bool)

(declare-fun e!73190 () Bool)

(assert (=> b!112611 (= e!73190 (contains!844 (ite c!20026 (Cons!1631 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1632) Nil!1632) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!112612 () Bool)

(assert (=> b!112612 (= e!73189 e!73187)))

(declare-fun res!55533 () Bool)

(assert (=> b!112612 (=> (not res!55533) (not e!73187))))

(assert (=> b!112612 (= res!55533 (not e!73190))))

(declare-fun res!55534 () Bool)

(assert (=> b!112612 (=> (not res!55534) (not e!73190))))

(assert (=> b!112612 (= res!55534 (validKeyInArray!0 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!32053 (not res!55532)) b!112612))

(assert (= (and b!112612 res!55534) b!112611))

(assert (= (and b!112612 res!55533) b!112609))

(assert (= (and b!112609 c!20152) b!112610))

(assert (= (and b!112609 (not c!20152)) b!112608))

(assert (= (or b!112610 b!112608) bm!12093))

(declare-fun m!128687 () Bool)

(assert (=> b!112609 m!128687))

(assert (=> b!112609 m!128687))

(declare-fun m!128689 () Bool)

(assert (=> b!112609 m!128689))

(assert (=> bm!12093 m!128687))

(declare-fun m!128691 () Bool)

(assert (=> bm!12093 m!128691))

(assert (=> b!112611 m!128687))

(assert (=> b!112611 m!128687))

(declare-fun m!128693 () Bool)

(assert (=> b!112611 m!128693))

(assert (=> b!112612 m!128687))

(assert (=> b!112612 m!128687))

(assert (=> b!112612 m!128689))

(assert (=> bm!12031 d!32053))

(declare-fun d!32055 () Bool)

(declare-fun e!73191 () Bool)

(assert (=> d!32055 e!73191))

(declare-fun res!55535 () Bool)

(assert (=> d!32055 (=> (not res!55535) (not e!73191))))

(declare-fun lt!58315 () ListLongMap!1595)

(assert (=> d!32055 (= res!55535 (contains!842 lt!58315 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(declare-fun lt!58313 () List!1634)

(assert (=> d!32055 (= lt!58315 (ListLongMap!1596 lt!58313))))

(declare-fun lt!58314 () Unit!3485)

(declare-fun lt!58312 () Unit!3485)

(assert (=> d!32055 (= lt!58314 lt!58312)))

(assert (=> d!32055 (= (getValueByKey!159 lt!58313 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))) (Some!164 (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(assert (=> d!32055 (= lt!58312 (lemmaContainsTupThenGetReturnValue!75 lt!58313 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(assert (=> d!32055 (= lt!58313 (insertStrictlySorted!78 (toList!813 (+!152 lt!57731 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(assert (=> d!32055 (= (+!152 (+!152 lt!57731 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) lt!58315)))

(declare-fun b!112613 () Bool)

(declare-fun res!55536 () Bool)

(assert (=> b!112613 (=> (not res!55536) (not e!73191))))

(assert (=> b!112613 (= res!55536 (= (getValueByKey!159 (toList!813 lt!58315) (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))) (Some!164 (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))))

(declare-fun b!112614 () Bool)

(assert (=> b!112614 (= e!73191 (contains!845 (toList!813 lt!58315) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))

(assert (= (and d!32055 res!55535) b!112613))

(assert (= (and b!112613 res!55536) b!112614))

(declare-fun m!128695 () Bool)

(assert (=> d!32055 m!128695))

(declare-fun m!128697 () Bool)

(assert (=> d!32055 m!128697))

(declare-fun m!128699 () Bool)

(assert (=> d!32055 m!128699))

(declare-fun m!128701 () Bool)

(assert (=> d!32055 m!128701))

(declare-fun m!128703 () Bool)

(assert (=> b!112613 m!128703))

(declare-fun m!128705 () Bool)

(assert (=> b!112614 m!128705))

(assert (=> d!31875 d!32055))

(declare-fun d!32057 () Bool)

(assert (=> d!32057 (= (+!152 (+!152 lt!57731 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (+!152 (+!152 lt!57731 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))

(assert (=> d!32057 true))

(declare-fun _$28!170 () Unit!3485)

(assert (=> d!32057 (= (choose!698 lt!57731 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))) _$28!170)))

(declare-fun bs!4636 () Bool)

(assert (= bs!4636 d!32057))

(assert (=> bs!4636 m!127985))

(assert (=> bs!4636 m!127985))

(assert (=> bs!4636 m!127987))

(assert (=> bs!4636 m!127991))

(assert (=> bs!4636 m!127991))

(assert (=> bs!4636 m!127993))

(assert (=> d!31875 d!32057))

(declare-fun d!32059 () Bool)

(declare-fun e!73192 () Bool)

(assert (=> d!32059 e!73192))

(declare-fun res!55537 () Bool)

(assert (=> d!32059 (=> (not res!55537) (not e!73192))))

(declare-fun lt!58319 () ListLongMap!1595)

(assert (=> d!32059 (= res!55537 (contains!842 lt!58319 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(declare-fun lt!58317 () List!1634)

(assert (=> d!32059 (= lt!58319 (ListLongMap!1596 lt!58317))))

(declare-fun lt!58318 () Unit!3485)

(declare-fun lt!58316 () Unit!3485)

(assert (=> d!32059 (= lt!58318 lt!58316)))

(assert (=> d!32059 (= (getValueByKey!159 lt!58317 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))) (Some!164 (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(assert (=> d!32059 (= lt!58316 (lemmaContainsTupThenGetReturnValue!75 lt!58317 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(assert (=> d!32059 (= lt!58317 (insertStrictlySorted!78 (toList!813 lt!57731) (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))))))

(assert (=> d!32059 (= (+!152 lt!57731 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) lt!58319)))

(declare-fun b!112615 () Bool)

(declare-fun res!55538 () Bool)

(assert (=> b!112615 (=> (not res!55538) (not e!73192))))

(assert (=> b!112615 (= res!55538 (= (getValueByKey!159 (toList!813 lt!58319) (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))) (Some!164 (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))))

(declare-fun b!112616 () Bool)

(assert (=> b!112616 (= e!73192 (contains!845 (toList!813 lt!58319) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)))))

(assert (= (and d!32059 res!55537) b!112615))

(assert (= (and b!112615 res!55538) b!112616))

(declare-fun m!128707 () Bool)

(assert (=> d!32059 m!128707))

(declare-fun m!128709 () Bool)

(assert (=> d!32059 m!128709))

(declare-fun m!128711 () Bool)

(assert (=> d!32059 m!128711))

(declare-fun m!128713 () Bool)

(assert (=> d!32059 m!128713))

(declare-fun m!128715 () Bool)

(assert (=> b!112615 m!128715))

(declare-fun m!128717 () Bool)

(assert (=> b!112616 m!128717))

(assert (=> d!31875 d!32059))

(declare-fun d!32061 () Bool)

(declare-fun e!73193 () Bool)

(assert (=> d!32061 e!73193))

(declare-fun res!55539 () Bool)

(assert (=> d!32061 (=> (not res!55539) (not e!73193))))

(declare-fun lt!58323 () ListLongMap!1595)

(assert (=> d!32061 (= res!55539 (contains!842 lt!58323 (_1!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!58321 () List!1634)

(assert (=> d!32061 (= lt!58323 (ListLongMap!1596 lt!58321))))

(declare-fun lt!58322 () Unit!3485)

(declare-fun lt!58320 () Unit!3485)

(assert (=> d!32061 (= lt!58322 lt!58320)))

(assert (=> d!32061 (= (getValueByKey!159 lt!58321 (_1!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32061 (= lt!58320 (lemmaContainsTupThenGetReturnValue!75 lt!58321 (_1!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32061 (= lt!58321 (insertStrictlySorted!78 (toList!813 lt!57731) (_1!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32061 (= (+!152 lt!57731 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!58323)))

(declare-fun b!112617 () Bool)

(declare-fun res!55540 () Bool)

(assert (=> b!112617 (=> (not res!55540) (not e!73193))))

(assert (=> b!112617 (= res!55540 (= (getValueByKey!159 (toList!813 lt!58323) (_1!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112618 () Bool)

(assert (=> b!112618 (= e!73193 (contains!845 (toList!813 lt!58323) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!32061 res!55539) b!112617))

(assert (= (and b!112617 res!55540) b!112618))

(declare-fun m!128719 () Bool)

(assert (=> d!32061 m!128719))

(declare-fun m!128721 () Bool)

(assert (=> d!32061 m!128721))

(declare-fun m!128723 () Bool)

(assert (=> d!32061 m!128723))

(declare-fun m!128725 () Bool)

(assert (=> d!32061 m!128725))

(declare-fun m!128727 () Bool)

(assert (=> b!112617 m!128727))

(declare-fun m!128729 () Bool)

(assert (=> b!112618 m!128729))

(assert (=> d!31875 d!32061))

(declare-fun d!32063 () Bool)

(declare-fun e!73194 () Bool)

(assert (=> d!32063 e!73194))

(declare-fun res!55541 () Bool)

(assert (=> d!32063 (=> (not res!55541) (not e!73194))))

(declare-fun lt!58327 () ListLongMap!1595)

(assert (=> d!32063 (= res!55541 (contains!842 lt!58327 (_1!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(declare-fun lt!58325 () List!1634)

(assert (=> d!32063 (= lt!58327 (ListLongMap!1596 lt!58325))))

(declare-fun lt!58326 () Unit!3485)

(declare-fun lt!58324 () Unit!3485)

(assert (=> d!32063 (= lt!58326 lt!58324)))

(assert (=> d!32063 (= (getValueByKey!159 lt!58325 (_1!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32063 (= lt!58324 (lemmaContainsTupThenGetReturnValue!75 lt!58325 (_1!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32063 (= lt!58325 (insertStrictlySorted!78 (toList!813 (+!152 lt!57731 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730))) (_1!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) (_2!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))))))

(assert (=> d!32063 (= (+!152 (+!152 lt!57731 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) lt!57730)) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))) lt!58327)))

(declare-fun b!112619 () Bool)

(declare-fun res!55542 () Bool)

(assert (=> b!112619 (=> (not res!55542) (not e!73194))))

(assert (=> b!112619 (= res!55542 (= (getValueByKey!159 (toList!813 lt!58327) (_1!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992)))))) (Some!164 (_2!1234 (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))))))))

(declare-fun b!112620 () Bool)

(assert (=> b!112620 (= e!73194 (contains!845 (toList!813 lt!58327) (tuple2!2447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2517 (v!2946 (underlying!373 thiss!992))))))))

(assert (= (and d!32063 res!55541) b!112619))

(assert (= (and b!112619 res!55542) b!112620))

(declare-fun m!128731 () Bool)

(assert (=> d!32063 m!128731))

(declare-fun m!128733 () Bool)

(assert (=> d!32063 m!128733))

(declare-fun m!128735 () Bool)

(assert (=> d!32063 m!128735))

(declare-fun m!128737 () Bool)

(assert (=> d!32063 m!128737))

(declare-fun m!128739 () Bool)

(assert (=> b!112619 m!128739))

(declare-fun m!128741 () Bool)

(assert (=> b!112620 m!128741))

(assert (=> d!31875 d!32063))

(declare-fun b!112629 () Bool)

(declare-fun res!55553 () Bool)

(declare-fun e!73197 () Bool)

(assert (=> b!112629 (=> (not res!55553) (not e!73197))))

(assert (=> b!112629 (= res!55553 (and (= (size!2346 (_values!2631 newMap!16)) (bvadd (mask!6826 newMap!16) #b00000000000000000000000000000001)) (= (size!2345 (_keys!4366 newMap!16)) (size!2346 (_values!2631 newMap!16))) (bvsge (_size!511 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!511 newMap!16) (bvadd (mask!6826 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!32065 () Bool)

(declare-fun res!55551 () Bool)

(assert (=> d!32065 (=> (not res!55551) (not e!73197))))

(assert (=> d!32065 (= res!55551 (validMask!0 (mask!6826 newMap!16)))))

(assert (=> d!32065 (= (simpleValid!77 newMap!16) e!73197)))

(declare-fun b!112632 () Bool)

(assert (=> b!112632 (= e!73197 (and (bvsge (extraKeys!2441 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2441 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!511 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!112631 () Bool)

(declare-fun res!55552 () Bool)

(assert (=> b!112631 (=> (not res!55552) (not e!73197))))

(declare-fun size!2349 (LongMapFixedSize!924) (_ BitVec 32))

(assert (=> b!112631 (= res!55552 (= (size!2349 newMap!16) (bvadd (_size!511 newMap!16) (bvsdiv (bvadd (extraKeys!2441 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!112630 () Bool)

(declare-fun res!55554 () Bool)

(assert (=> b!112630 (=> (not res!55554) (not e!73197))))

(assert (=> b!112630 (= res!55554 (bvsge (size!2349 newMap!16) (_size!511 newMap!16)))))

(assert (= (and d!32065 res!55551) b!112629))

(assert (= (and b!112629 res!55553) b!112630))

(assert (= (and b!112630 res!55554) b!112631))

(assert (= (and b!112631 res!55552) b!112632))

(assert (=> d!32065 m!128047))

(declare-fun m!128743 () Bool)

(assert (=> b!112631 m!128743))

(assert (=> b!112630 m!128743))

(assert (=> d!31851 d!32065))

(declare-fun d!32067 () Bool)

(declare-fun e!73198 () Bool)

(assert (=> d!32067 e!73198))

(declare-fun res!55555 () Bool)

(assert (=> d!32067 (=> res!55555 e!73198)))

(declare-fun lt!58328 () Bool)

(assert (=> d!32067 (= res!55555 (not lt!58328))))

(declare-fun lt!58329 () Bool)

(assert (=> d!32067 (= lt!58328 lt!58329)))

(declare-fun lt!58330 () Unit!3485)

(declare-fun e!73199 () Unit!3485)

(assert (=> d!32067 (= lt!58330 e!73199)))

(declare-fun c!20153 () Bool)

(assert (=> d!32067 (= c!20153 lt!58329)))

(assert (=> d!32067 (= lt!58329 (containsKey!163 (toList!813 lt!57989) (_1!1234 lt!57733)))))

(assert (=> d!32067 (= (contains!842 lt!57989 (_1!1234 lt!57733)) lt!58328)))

(declare-fun b!112633 () Bool)

(declare-fun lt!58331 () Unit!3485)

(assert (=> b!112633 (= e!73199 lt!58331)))

(assert (=> b!112633 (= lt!58331 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57989) (_1!1234 lt!57733)))))

(assert (=> b!112633 (isDefined!112 (getValueByKey!159 (toList!813 lt!57989) (_1!1234 lt!57733)))))

(declare-fun b!112634 () Bool)

(declare-fun Unit!3514 () Unit!3485)

(assert (=> b!112634 (= e!73199 Unit!3514)))

(declare-fun b!112635 () Bool)

(assert (=> b!112635 (= e!73198 (isDefined!112 (getValueByKey!159 (toList!813 lt!57989) (_1!1234 lt!57733))))))

(assert (= (and d!32067 c!20153) b!112633))

(assert (= (and d!32067 (not c!20153)) b!112634))

(assert (= (and d!32067 (not res!55555)) b!112635))

(declare-fun m!128745 () Bool)

(assert (=> d!32067 m!128745))

(declare-fun m!128747 () Bool)

(assert (=> b!112633 m!128747))

(assert (=> b!112633 m!127969))

(assert (=> b!112633 m!127969))

(declare-fun m!128749 () Bool)

(assert (=> b!112633 m!128749))

(assert (=> b!112635 m!127969))

(assert (=> b!112635 m!127969))

(assert (=> b!112635 m!128749))

(assert (=> d!31871 d!32067))

(declare-fun b!112637 () Bool)

(declare-fun e!73200 () Option!165)

(declare-fun e!73201 () Option!165)

(assert (=> b!112637 (= e!73200 e!73201)))

(declare-fun c!20155 () Bool)

(assert (=> b!112637 (= c!20155 (and ((_ is Cons!1630) lt!57987) (not (= (_1!1234 (h!2230 lt!57987)) (_1!1234 lt!57733)))))))

(declare-fun b!112638 () Bool)

(assert (=> b!112638 (= e!73201 (getValueByKey!159 (t!5792 lt!57987) (_1!1234 lt!57733)))))

(declare-fun b!112636 () Bool)

(assert (=> b!112636 (= e!73200 (Some!164 (_2!1234 (h!2230 lt!57987))))))

(declare-fun b!112639 () Bool)

(assert (=> b!112639 (= e!73201 None!163)))

(declare-fun d!32069 () Bool)

(declare-fun c!20154 () Bool)

(assert (=> d!32069 (= c!20154 (and ((_ is Cons!1630) lt!57987) (= (_1!1234 (h!2230 lt!57987)) (_1!1234 lt!57733))))))

(assert (=> d!32069 (= (getValueByKey!159 lt!57987 (_1!1234 lt!57733)) e!73200)))

(assert (= (and d!32069 c!20154) b!112636))

(assert (= (and d!32069 (not c!20154)) b!112637))

(assert (= (and b!112637 c!20155) b!112638))

(assert (= (and b!112637 (not c!20155)) b!112639))

(declare-fun m!128751 () Bool)

(assert (=> b!112638 m!128751))

(assert (=> d!31871 d!32069))

(declare-fun d!32071 () Bool)

(assert (=> d!32071 (= (getValueByKey!159 lt!57987 (_1!1234 lt!57733)) (Some!164 (_2!1234 lt!57733)))))

(declare-fun lt!58332 () Unit!3485)

(assert (=> d!32071 (= lt!58332 (choose!702 lt!57987 (_1!1234 lt!57733) (_2!1234 lt!57733)))))

(declare-fun e!73202 () Bool)

(assert (=> d!32071 e!73202))

(declare-fun res!55556 () Bool)

(assert (=> d!32071 (=> (not res!55556) (not e!73202))))

(assert (=> d!32071 (= res!55556 (isStrictlySorted!312 lt!57987))))

(assert (=> d!32071 (= (lemmaContainsTupThenGetReturnValue!75 lt!57987 (_1!1234 lt!57733) (_2!1234 lt!57733)) lt!58332)))

(declare-fun b!112640 () Bool)

(declare-fun res!55557 () Bool)

(assert (=> b!112640 (=> (not res!55557) (not e!73202))))

(assert (=> b!112640 (= res!55557 (containsKey!163 lt!57987 (_1!1234 lt!57733)))))

(declare-fun b!112641 () Bool)

(assert (=> b!112641 (= e!73202 (contains!845 lt!57987 (tuple2!2447 (_1!1234 lt!57733) (_2!1234 lt!57733))))))

(assert (= (and d!32071 res!55556) b!112640))

(assert (= (and b!112640 res!55557) b!112641))

(assert (=> d!32071 m!127963))

(declare-fun m!128753 () Bool)

(assert (=> d!32071 m!128753))

(declare-fun m!128755 () Bool)

(assert (=> d!32071 m!128755))

(declare-fun m!128757 () Bool)

(assert (=> b!112640 m!128757))

(declare-fun m!128759 () Bool)

(assert (=> b!112641 m!128759))

(assert (=> d!31871 d!32071))

(declare-fun b!112642 () Bool)

(declare-fun e!73205 () List!1634)

(declare-fun call!12097 () List!1634)

(assert (=> b!112642 (= e!73205 call!12097)))

(declare-fun b!112643 () Bool)

(declare-fun e!73206 () List!1634)

(declare-fun c!20158 () Bool)

(declare-fun c!20157 () Bool)

(assert (=> b!112643 (= e!73206 (ite c!20158 (t!5792 (toList!813 lt!57731)) (ite c!20157 (Cons!1630 (h!2230 (toList!813 lt!57731)) (t!5792 (toList!813 lt!57731))) Nil!1631)))))

(declare-fun b!112644 () Bool)

(assert (=> b!112644 (= e!73206 (insertStrictlySorted!78 (t!5792 (toList!813 lt!57731)) (_1!1234 lt!57733) (_2!1234 lt!57733)))))

(declare-fun b!112645 () Bool)

(declare-fun e!73207 () Bool)

(declare-fun lt!58333 () List!1634)

(assert (=> b!112645 (= e!73207 (contains!845 lt!58333 (tuple2!2447 (_1!1234 lt!57733) (_2!1234 lt!57733))))))

(declare-fun b!112646 () Bool)

(declare-fun res!55558 () Bool)

(assert (=> b!112646 (=> (not res!55558) (not e!73207))))

(assert (=> b!112646 (= res!55558 (containsKey!163 lt!58333 (_1!1234 lt!57733)))))

(declare-fun b!112647 () Bool)

(declare-fun e!73204 () List!1634)

(assert (=> b!112647 (= e!73204 e!73205)))

(assert (=> b!112647 (= c!20158 (and ((_ is Cons!1630) (toList!813 lt!57731)) (= (_1!1234 (h!2230 (toList!813 lt!57731))) (_1!1234 lt!57733))))))

(declare-fun bm!12094 () Bool)

(declare-fun call!12099 () List!1634)

(assert (=> bm!12094 (= call!12097 call!12099)))

(declare-fun b!112648 () Bool)

(declare-fun e!73203 () List!1634)

(declare-fun call!12098 () List!1634)

(assert (=> b!112648 (= e!73203 call!12098)))

(declare-fun d!32073 () Bool)

(assert (=> d!32073 e!73207))

(declare-fun res!55559 () Bool)

(assert (=> d!32073 (=> (not res!55559) (not e!73207))))

(assert (=> d!32073 (= res!55559 (isStrictlySorted!312 lt!58333))))

(assert (=> d!32073 (= lt!58333 e!73204)))

(declare-fun c!20156 () Bool)

(assert (=> d!32073 (= c!20156 (and ((_ is Cons!1630) (toList!813 lt!57731)) (bvslt (_1!1234 (h!2230 (toList!813 lt!57731))) (_1!1234 lt!57733))))))

(assert (=> d!32073 (isStrictlySorted!312 (toList!813 lt!57731))))

(assert (=> d!32073 (= (insertStrictlySorted!78 (toList!813 lt!57731) (_1!1234 lt!57733) (_2!1234 lt!57733)) lt!58333)))

(declare-fun bm!12095 () Bool)

(assert (=> bm!12095 (= call!12098 call!12097)))

(declare-fun b!112649 () Bool)

(assert (=> b!112649 (= c!20157 (and ((_ is Cons!1630) (toList!813 lt!57731)) (bvsgt (_1!1234 (h!2230 (toList!813 lt!57731))) (_1!1234 lt!57733))))))

(assert (=> b!112649 (= e!73205 e!73203)))

(declare-fun b!112650 () Bool)

(assert (=> b!112650 (= e!73204 call!12099)))

(declare-fun b!112651 () Bool)

(assert (=> b!112651 (= e!73203 call!12098)))

(declare-fun bm!12096 () Bool)

(assert (=> bm!12096 (= call!12099 ($colon$colon!84 e!73206 (ite c!20156 (h!2230 (toList!813 lt!57731)) (tuple2!2447 (_1!1234 lt!57733) (_2!1234 lt!57733)))))))

(declare-fun c!20159 () Bool)

(assert (=> bm!12096 (= c!20159 c!20156)))

(assert (= (and d!32073 c!20156) b!112650))

(assert (= (and d!32073 (not c!20156)) b!112647))

(assert (= (and b!112647 c!20158) b!112642))

(assert (= (and b!112647 (not c!20158)) b!112649))

(assert (= (and b!112649 c!20157) b!112648))

(assert (= (and b!112649 (not c!20157)) b!112651))

(assert (= (or b!112648 b!112651) bm!12095))

(assert (= (or b!112642 bm!12095) bm!12094))

(assert (= (or b!112650 bm!12094) bm!12096))

(assert (= (and bm!12096 c!20159) b!112644))

(assert (= (and bm!12096 (not c!20159)) b!112643))

(assert (= (and d!32073 res!55559) b!112646))

(assert (= (and b!112646 res!55558) b!112645))

(declare-fun m!128761 () Bool)

(assert (=> b!112646 m!128761))

(declare-fun m!128763 () Bool)

(assert (=> bm!12096 m!128763))

(declare-fun m!128765 () Bool)

(assert (=> b!112645 m!128765))

(declare-fun m!128767 () Bool)

(assert (=> b!112644 m!128767))

(declare-fun m!128769 () Bool)

(assert (=> d!32073 m!128769))

(assert (=> d!32073 m!128233))

(assert (=> d!31871 d!32073))

(declare-fun d!32075 () Bool)

(declare-fun res!55560 () Bool)

(declare-fun e!73208 () Bool)

(assert (=> d!32075 (=> res!55560 e!73208)))

(assert (=> d!32075 (= res!55560 (= (select (arr!2087 (_keys!4366 newMap!16)) #b00000000000000000000000000000000) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355)))))

(assert (=> d!32075 (= (arrayContainsKey!0 (_keys!4366 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) #b00000000000000000000000000000000) e!73208)))

(declare-fun b!112652 () Bool)

(declare-fun e!73209 () Bool)

(assert (=> b!112652 (= e!73208 e!73209)))

(declare-fun res!55561 () Bool)

(assert (=> b!112652 (=> (not res!55561) (not e!73209))))

(assert (=> b!112652 (= res!55561 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2345 (_keys!4366 newMap!16))))))

(declare-fun b!112653 () Bool)

(assert (=> b!112653 (= e!73209 (arrayContainsKey!0 (_keys!4366 newMap!16) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!32075 (not res!55560)) b!112652))

(assert (= (and b!112652 res!55561) b!112653))

(assert (=> d!32075 m!128073))

(assert (=> b!112653 m!127651))

(declare-fun m!128771 () Bool)

(assert (=> b!112653 m!128771))

(assert (=> bm!11994 d!32075))

(declare-fun d!32077 () Bool)

(declare-fun e!73210 () Bool)

(assert (=> d!32077 e!73210))

(declare-fun res!55562 () Bool)

(assert (=> d!32077 (=> res!55562 e!73210)))

(declare-fun lt!58334 () Bool)

(assert (=> d!32077 (= res!55562 (not lt!58334))))

(declare-fun lt!58335 () Bool)

(assert (=> d!32077 (= lt!58334 lt!58335)))

(declare-fun lt!58336 () Unit!3485)

(declare-fun e!73211 () Unit!3485)

(assert (=> d!32077 (= lt!58336 e!73211)))

(declare-fun c!20160 () Bool)

(assert (=> d!32077 (= c!20160 lt!58335)))

(assert (=> d!32077 (= lt!58335 (containsKey!163 (toList!813 lt!57964) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32077 (= (contains!842 lt!57964 #b1000000000000000000000000000000000000000000000000000000000000000) lt!58334)))

(declare-fun b!112654 () Bool)

(declare-fun lt!58337 () Unit!3485)

(assert (=> b!112654 (= e!73211 lt!58337)))

(assert (=> b!112654 (= lt!58337 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57964) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112654 (isDefined!112 (getValueByKey!159 (toList!813 lt!57964) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112655 () Bool)

(declare-fun Unit!3515 () Unit!3485)

(assert (=> b!112655 (= e!73211 Unit!3515)))

(declare-fun b!112656 () Bool)

(assert (=> b!112656 (= e!73210 (isDefined!112 (getValueByKey!159 (toList!813 lt!57964) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32077 c!20160) b!112654))

(assert (= (and d!32077 (not c!20160)) b!112655))

(assert (= (and d!32077 (not res!55562)) b!112656))

(declare-fun m!128773 () Bool)

(assert (=> d!32077 m!128773))

(declare-fun m!128775 () Bool)

(assert (=> b!112654 m!128775))

(declare-fun m!128777 () Bool)

(assert (=> b!112654 m!128777))

(assert (=> b!112654 m!128777))

(declare-fun m!128779 () Bool)

(assert (=> b!112654 m!128779))

(assert (=> b!112656 m!128777))

(assert (=> b!112656 m!128777))

(assert (=> b!112656 m!128779))

(assert (=> b!112179 d!32077))

(assert (=> d!31855 d!31859))

(declare-fun d!32079 () Bool)

(assert (=> d!32079 (not (arrayContainsKey!0 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!32079 true))

(declare-fun _$68!115 () Unit!3485)

(assert (=> d!32079 (= (choose!68 (_keys!4366 (v!2946 (underlying!373 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) (Cons!1631 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) from!355) Nil!1632)) _$68!115)))

(declare-fun bs!4637 () Bool)

(assert (= bs!4637 d!32079))

(assert (=> bs!4637 m!127651))

(assert (=> bs!4637 m!127681))

(assert (=> d!31855 d!32079))

(assert (=> b!112181 d!31967))

(declare-fun d!32081 () Bool)

(declare-fun e!73212 () Bool)

(assert (=> d!32081 e!73212))

(declare-fun res!55563 () Bool)

(assert (=> d!32081 (=> (not res!55563) (not e!73212))))

(declare-fun lt!58341 () ListLongMap!1595)

(assert (=> d!32081 (= res!55563 (contains!842 lt!58341 (_1!1234 (tuple2!2447 lt!57966 lt!57968))))))

(declare-fun lt!58339 () List!1634)

(assert (=> d!32081 (= lt!58341 (ListLongMap!1596 lt!58339))))

(declare-fun lt!58340 () Unit!3485)

(declare-fun lt!58338 () Unit!3485)

(assert (=> d!32081 (= lt!58340 lt!58338)))

(assert (=> d!32081 (= (getValueByKey!159 lt!58339 (_1!1234 (tuple2!2447 lt!57966 lt!57968))) (Some!164 (_2!1234 (tuple2!2447 lt!57966 lt!57968))))))

(assert (=> d!32081 (= lt!58338 (lemmaContainsTupThenGetReturnValue!75 lt!58339 (_1!1234 (tuple2!2447 lt!57966 lt!57968)) (_2!1234 (tuple2!2447 lt!57966 lt!57968))))))

(assert (=> d!32081 (= lt!58339 (insertStrictlySorted!78 (toList!813 lt!57963) (_1!1234 (tuple2!2447 lt!57966 lt!57968)) (_2!1234 (tuple2!2447 lt!57966 lt!57968))))))

(assert (=> d!32081 (= (+!152 lt!57963 (tuple2!2447 lt!57966 lt!57968)) lt!58341)))

(declare-fun b!112657 () Bool)

(declare-fun res!55564 () Bool)

(assert (=> b!112657 (=> (not res!55564) (not e!73212))))

(assert (=> b!112657 (= res!55564 (= (getValueByKey!159 (toList!813 lt!58341) (_1!1234 (tuple2!2447 lt!57966 lt!57968))) (Some!164 (_2!1234 (tuple2!2447 lt!57966 lt!57968)))))))

(declare-fun b!112658 () Bool)

(assert (=> b!112658 (= e!73212 (contains!845 (toList!813 lt!58341) (tuple2!2447 lt!57966 lt!57968)))))

(assert (= (and d!32081 res!55563) b!112657))

(assert (= (and b!112657 res!55564) b!112658))

(declare-fun m!128781 () Bool)

(assert (=> d!32081 m!128781))

(declare-fun m!128783 () Bool)

(assert (=> d!32081 m!128783))

(declare-fun m!128785 () Bool)

(assert (=> d!32081 m!128785))

(declare-fun m!128787 () Bool)

(assert (=> d!32081 m!128787))

(declare-fun m!128789 () Bool)

(assert (=> b!112657 m!128789))

(declare-fun m!128791 () Bool)

(assert (=> b!112658 m!128791))

(assert (=> b!112181 d!32081))

(declare-fun d!32083 () Bool)

(declare-fun e!73213 () Bool)

(assert (=> d!32083 e!73213))

(declare-fun res!55565 () Bool)

(assert (=> d!32083 (=> res!55565 e!73213)))

(declare-fun lt!58342 () Bool)

(assert (=> d!32083 (= res!55565 (not lt!58342))))

(declare-fun lt!58343 () Bool)

(assert (=> d!32083 (= lt!58342 lt!58343)))

(declare-fun lt!58344 () Unit!3485)

(declare-fun e!73214 () Unit!3485)

(assert (=> d!32083 (= lt!58344 e!73214)))

(declare-fun c!20161 () Bool)

(assert (=> d!32083 (= c!20161 lt!58343)))

(assert (=> d!32083 (= lt!58343 (containsKey!163 (toList!813 (+!152 lt!57963 (tuple2!2447 lt!57966 lt!57968))) lt!57967))))

(assert (=> d!32083 (= (contains!842 (+!152 lt!57963 (tuple2!2447 lt!57966 lt!57968)) lt!57967) lt!58342)))

(declare-fun b!112659 () Bool)

(declare-fun lt!58345 () Unit!3485)

(assert (=> b!112659 (= e!73214 lt!58345)))

(assert (=> b!112659 (= lt!58345 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 (+!152 lt!57963 (tuple2!2447 lt!57966 lt!57968))) lt!57967))))

(assert (=> b!112659 (isDefined!112 (getValueByKey!159 (toList!813 (+!152 lt!57963 (tuple2!2447 lt!57966 lt!57968))) lt!57967))))

(declare-fun b!112660 () Bool)

(declare-fun Unit!3516 () Unit!3485)

(assert (=> b!112660 (= e!73214 Unit!3516)))

(declare-fun b!112661 () Bool)

(assert (=> b!112661 (= e!73213 (isDefined!112 (getValueByKey!159 (toList!813 (+!152 lt!57963 (tuple2!2447 lt!57966 lt!57968))) lt!57967)))))

(assert (= (and d!32083 c!20161) b!112659))

(assert (= (and d!32083 (not c!20161)) b!112660))

(assert (= (and d!32083 (not res!55565)) b!112661))

(declare-fun m!128793 () Bool)

(assert (=> d!32083 m!128793))

(declare-fun m!128795 () Bool)

(assert (=> b!112659 m!128795))

(declare-fun m!128797 () Bool)

(assert (=> b!112659 m!128797))

(assert (=> b!112659 m!128797))

(declare-fun m!128799 () Bool)

(assert (=> b!112659 m!128799))

(assert (=> b!112661 m!128797))

(assert (=> b!112661 m!128797))

(assert (=> b!112661 m!128799))

(assert (=> b!112181 d!32083))

(declare-fun d!32085 () Bool)

(declare-fun e!73215 () Bool)

(assert (=> d!32085 e!73215))

(declare-fun res!55566 () Bool)

(assert (=> d!32085 (=> (not res!55566) (not e!73215))))

(declare-fun lt!58349 () ListLongMap!1595)

(assert (=> d!32085 (= res!55566 (contains!842 lt!58349 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!58347 () List!1634)

(assert (=> d!32085 (= lt!58349 (ListLongMap!1596 lt!58347))))

(declare-fun lt!58348 () Unit!3485)

(declare-fun lt!58346 () Unit!3485)

(assert (=> d!32085 (= lt!58348 lt!58346)))

(assert (=> d!32085 (= (getValueByKey!159 lt!58347 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!164 (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32085 (= lt!58346 (lemmaContainsTupThenGetReturnValue!75 lt!58347 (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32085 (= lt!58347 (insertStrictlySorted!78 (toList!813 call!12037) (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32085 (= (+!152 call!12037 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!58349)))

(declare-fun b!112662 () Bool)

(declare-fun res!55567 () Bool)

(assert (=> b!112662 (=> (not res!55567) (not e!73215))))

(assert (=> b!112662 (= res!55567 (= (getValueByKey!159 (toList!813 lt!58349) (_1!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!164 (_2!1234 (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!112663 () Bool)

(assert (=> b!112663 (= e!73215 (contains!845 (toList!813 lt!58349) (tuple2!2447 (select (arr!2087 (_keys!4366 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1353 (select (arr!2088 (_values!2631 (v!2946 (underlying!373 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!391 (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!32085 res!55566) b!112662))

(assert (= (and b!112662 res!55567) b!112663))

(declare-fun m!128801 () Bool)

(assert (=> d!32085 m!128801))

(declare-fun m!128803 () Bool)

(assert (=> d!32085 m!128803))

(declare-fun m!128805 () Bool)

(assert (=> d!32085 m!128805))

(declare-fun m!128807 () Bool)

(assert (=> d!32085 m!128807))

(declare-fun m!128809 () Bool)

(assert (=> b!112662 m!128809))

(declare-fun m!128811 () Bool)

(assert (=> b!112663 m!128811))

(assert (=> b!112181 d!32085))

(declare-fun d!32087 () Bool)

(assert (=> d!32087 (not (contains!842 (+!152 lt!57963 (tuple2!2447 lt!57966 lt!57968)) lt!57967))))

(declare-fun lt!58352 () Unit!3485)

(declare-fun choose!709 (ListLongMap!1595 (_ BitVec 64) V!3251 (_ BitVec 64)) Unit!3485)

(assert (=> d!32087 (= lt!58352 (choose!709 lt!57963 lt!57966 lt!57968 lt!57967))))

(declare-fun e!73218 () Bool)

(assert (=> d!32087 e!73218))

(declare-fun res!55570 () Bool)

(assert (=> d!32087 (=> (not res!55570) (not e!73218))))

(assert (=> d!32087 (= res!55570 (not (contains!842 lt!57963 lt!57967)))))

(assert (=> d!32087 (= (addStillNotContains!49 lt!57963 lt!57966 lt!57968 lt!57967) lt!58352)))

(declare-fun b!112667 () Bool)

(assert (=> b!112667 (= e!73218 (not (= lt!57966 lt!57967)))))

(assert (= (and d!32087 res!55570) b!112667))

(assert (=> d!32087 m!127929))

(assert (=> d!32087 m!127929))

(assert (=> d!32087 m!127931))

(declare-fun m!128813 () Bool)

(assert (=> d!32087 m!128813))

(declare-fun m!128815 () Bool)

(assert (=> d!32087 m!128815))

(assert (=> b!112181 d!32087))

(assert (=> b!112144 d!31891))

(assert (=> bm!12004 d!31985))

(declare-fun d!32089 () Bool)

(declare-fun e!73219 () Bool)

(assert (=> d!32089 e!73219))

(declare-fun res!55571 () Bool)

(assert (=> d!32089 (=> res!55571 e!73219)))

(declare-fun lt!58353 () Bool)

(assert (=> d!32089 (= res!55571 (not lt!58353))))

(declare-fun lt!58354 () Bool)

(assert (=> d!32089 (= lt!58353 lt!58354)))

(declare-fun lt!58355 () Unit!3485)

(declare-fun e!73220 () Unit!3485)

(assert (=> d!32089 (= lt!58355 e!73220)))

(declare-fun c!20162 () Bool)

(assert (=> d!32089 (= c!20162 lt!58354)))

(assert (=> d!32089 (= lt!58354 (containsKey!163 (toList!813 lt!57993) (_1!1234 lt!57726)))))

(assert (=> d!32089 (= (contains!842 lt!57993 (_1!1234 lt!57726)) lt!58353)))

(declare-fun b!112668 () Bool)

(declare-fun lt!58356 () Unit!3485)

(assert (=> b!112668 (= e!73220 lt!58356)))

(assert (=> b!112668 (= lt!58356 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!813 lt!57993) (_1!1234 lt!57726)))))

(assert (=> b!112668 (isDefined!112 (getValueByKey!159 (toList!813 lt!57993) (_1!1234 lt!57726)))))

(declare-fun b!112669 () Bool)

(declare-fun Unit!3517 () Unit!3485)

(assert (=> b!112669 (= e!73220 Unit!3517)))

(declare-fun b!112670 () Bool)

(assert (=> b!112670 (= e!73219 (isDefined!112 (getValueByKey!159 (toList!813 lt!57993) (_1!1234 lt!57726))))))

(assert (= (and d!32089 c!20162) b!112668))

(assert (= (and d!32089 (not c!20162)) b!112669))

(assert (= (and d!32089 (not res!55571)) b!112670))

(declare-fun m!128817 () Bool)

(assert (=> d!32089 m!128817))

(declare-fun m!128819 () Bool)

(assert (=> b!112668 m!128819))

(assert (=> b!112668 m!127981))

(assert (=> b!112668 m!127981))

(declare-fun m!128821 () Bool)

(assert (=> b!112668 m!128821))

(assert (=> b!112670 m!127981))

(assert (=> b!112670 m!127981))

(assert (=> b!112670 m!128821))

(assert (=> d!31873 d!32089))

(declare-fun b!112672 () Bool)

(declare-fun e!73221 () Option!165)

(declare-fun e!73222 () Option!165)

(assert (=> b!112672 (= e!73221 e!73222)))

(declare-fun c!20164 () Bool)

(assert (=> b!112672 (= c!20164 (and ((_ is Cons!1630) lt!57991) (not (= (_1!1234 (h!2230 lt!57991)) (_1!1234 lt!57726)))))))

(declare-fun b!112673 () Bool)

(assert (=> b!112673 (= e!73222 (getValueByKey!159 (t!5792 lt!57991) (_1!1234 lt!57726)))))

(declare-fun b!112671 () Bool)

(assert (=> b!112671 (= e!73221 (Some!164 (_2!1234 (h!2230 lt!57991))))))

(declare-fun b!112674 () Bool)

(assert (=> b!112674 (= e!73222 None!163)))

(declare-fun d!32091 () Bool)

(declare-fun c!20163 () Bool)

(assert (=> d!32091 (= c!20163 (and ((_ is Cons!1630) lt!57991) (= (_1!1234 (h!2230 lt!57991)) (_1!1234 lt!57726))))))

(assert (=> d!32091 (= (getValueByKey!159 lt!57991 (_1!1234 lt!57726)) e!73221)))

(assert (= (and d!32091 c!20163) b!112671))

(assert (= (and d!32091 (not c!20163)) b!112672))

(assert (= (and b!112672 c!20164) b!112673))

(assert (= (and b!112672 (not c!20164)) b!112674))

(declare-fun m!128823 () Bool)

(assert (=> b!112673 m!128823))

(assert (=> d!31873 d!32091))

(declare-fun d!32093 () Bool)

(assert (=> d!32093 (= (getValueByKey!159 lt!57991 (_1!1234 lt!57726)) (Some!164 (_2!1234 lt!57726)))))

(declare-fun lt!58357 () Unit!3485)

(assert (=> d!32093 (= lt!58357 (choose!702 lt!57991 (_1!1234 lt!57726) (_2!1234 lt!57726)))))

(declare-fun e!73223 () Bool)

(assert (=> d!32093 e!73223))

(declare-fun res!55572 () Bool)

(assert (=> d!32093 (=> (not res!55572) (not e!73223))))

(assert (=> d!32093 (= res!55572 (isStrictlySorted!312 lt!57991))))

(assert (=> d!32093 (= (lemmaContainsTupThenGetReturnValue!75 lt!57991 (_1!1234 lt!57726) (_2!1234 lt!57726)) lt!58357)))

(declare-fun b!112675 () Bool)

(declare-fun res!55573 () Bool)

(assert (=> b!112675 (=> (not res!55573) (not e!73223))))

(assert (=> b!112675 (= res!55573 (containsKey!163 lt!57991 (_1!1234 lt!57726)))))

(declare-fun b!112676 () Bool)

(assert (=> b!112676 (= e!73223 (contains!845 lt!57991 (tuple2!2447 (_1!1234 lt!57726) (_2!1234 lt!57726))))))

(assert (= (and d!32093 res!55572) b!112675))

(assert (= (and b!112675 res!55573) b!112676))

(assert (=> d!32093 m!127975))

(declare-fun m!128825 () Bool)

(assert (=> d!32093 m!128825))

(declare-fun m!128827 () Bool)

(assert (=> d!32093 m!128827))

(declare-fun m!128829 () Bool)

(assert (=> b!112675 m!128829))

(declare-fun m!128831 () Bool)

(assert (=> b!112676 m!128831))

(assert (=> d!31873 d!32093))

(declare-fun b!112677 () Bool)

(declare-fun e!73226 () List!1634)

(declare-fun call!12100 () List!1634)

(assert (=> b!112677 (= e!73226 call!12100)))

(declare-fun c!20167 () Bool)

(declare-fun c!20166 () Bool)

(declare-fun b!112678 () Bool)

(declare-fun e!73227 () List!1634)

(assert (=> b!112678 (= e!73227 (ite c!20167 (t!5792 (toList!813 (+!152 lt!57731 lt!57733))) (ite c!20166 (Cons!1630 (h!2230 (toList!813 (+!152 lt!57731 lt!57733))) (t!5792 (toList!813 (+!152 lt!57731 lt!57733)))) Nil!1631)))))

(declare-fun b!112679 () Bool)

(assert (=> b!112679 (= e!73227 (insertStrictlySorted!78 (t!5792 (toList!813 (+!152 lt!57731 lt!57733))) (_1!1234 lt!57726) (_2!1234 lt!57726)))))

(declare-fun b!112680 () Bool)

(declare-fun e!73228 () Bool)

(declare-fun lt!58358 () List!1634)

(assert (=> b!112680 (= e!73228 (contains!845 lt!58358 (tuple2!2447 (_1!1234 lt!57726) (_2!1234 lt!57726))))))

(declare-fun b!112681 () Bool)

(declare-fun res!55574 () Bool)

(assert (=> b!112681 (=> (not res!55574) (not e!73228))))

(assert (=> b!112681 (= res!55574 (containsKey!163 lt!58358 (_1!1234 lt!57726)))))

(declare-fun b!112682 () Bool)

(declare-fun e!73225 () List!1634)

(assert (=> b!112682 (= e!73225 e!73226)))

(assert (=> b!112682 (= c!20167 (and ((_ is Cons!1630) (toList!813 (+!152 lt!57731 lt!57733))) (= (_1!1234 (h!2230 (toList!813 (+!152 lt!57731 lt!57733)))) (_1!1234 lt!57726))))))

(declare-fun bm!12097 () Bool)

(declare-fun call!12102 () List!1634)

(assert (=> bm!12097 (= call!12100 call!12102)))

(declare-fun b!112683 () Bool)

(declare-fun e!73224 () List!1634)

(declare-fun call!12101 () List!1634)

(assert (=> b!112683 (= e!73224 call!12101)))

(declare-fun d!32095 () Bool)

(assert (=> d!32095 e!73228))

(declare-fun res!55575 () Bool)

(assert (=> d!32095 (=> (not res!55575) (not e!73228))))

(assert (=> d!32095 (= res!55575 (isStrictlySorted!312 lt!58358))))

(assert (=> d!32095 (= lt!58358 e!73225)))

(declare-fun c!20165 () Bool)

(assert (=> d!32095 (= c!20165 (and ((_ is Cons!1630) (toList!813 (+!152 lt!57731 lt!57733))) (bvslt (_1!1234 (h!2230 (toList!813 (+!152 lt!57731 lt!57733)))) (_1!1234 lt!57726))))))

(assert (=> d!32095 (isStrictlySorted!312 (toList!813 (+!152 lt!57731 lt!57733)))))

(assert (=> d!32095 (= (insertStrictlySorted!78 (toList!813 (+!152 lt!57731 lt!57733)) (_1!1234 lt!57726) (_2!1234 lt!57726)) lt!58358)))

(declare-fun bm!12098 () Bool)

(assert (=> bm!12098 (= call!12101 call!12100)))

(declare-fun b!112684 () Bool)

(assert (=> b!112684 (= c!20166 (and ((_ is Cons!1630) (toList!813 (+!152 lt!57731 lt!57733))) (bvsgt (_1!1234 (h!2230 (toList!813 (+!152 lt!57731 lt!57733)))) (_1!1234 lt!57726))))))

(assert (=> b!112684 (= e!73226 e!73224)))

(declare-fun b!112685 () Bool)

(assert (=> b!112685 (= e!73225 call!12102)))

(declare-fun b!112686 () Bool)

(assert (=> b!112686 (= e!73224 call!12101)))

(declare-fun bm!12099 () Bool)

(assert (=> bm!12099 (= call!12102 ($colon$colon!84 e!73227 (ite c!20165 (h!2230 (toList!813 (+!152 lt!57731 lt!57733))) (tuple2!2447 (_1!1234 lt!57726) (_2!1234 lt!57726)))))))

(declare-fun c!20168 () Bool)

(assert (=> bm!12099 (= c!20168 c!20165)))

(assert (= (and d!32095 c!20165) b!112685))

(assert (= (and d!32095 (not c!20165)) b!112682))

(assert (= (and b!112682 c!20167) b!112677))

(assert (= (and b!112682 (not c!20167)) b!112684))

(assert (= (and b!112684 c!20166) b!112683))

(assert (= (and b!112684 (not c!20166)) b!112686))

(assert (= (or b!112683 b!112686) bm!12098))

(assert (= (or b!112677 bm!12098) bm!12097))

(assert (= (or b!112685 bm!12097) bm!12099))

(assert (= (and bm!12099 c!20168) b!112679))

(assert (= (and bm!12099 (not c!20168)) b!112678))

(assert (= (and d!32095 res!55575) b!112681))

(assert (= (and b!112681 res!55574) b!112680))

(declare-fun m!128833 () Bool)

(assert (=> b!112681 m!128833))

(declare-fun m!128835 () Bool)

(assert (=> bm!12099 m!128835))

(declare-fun m!128837 () Bool)

(assert (=> b!112680 m!128837))

(declare-fun m!128839 () Bool)

(assert (=> b!112679 m!128839))

(declare-fun m!128841 () Bool)

(assert (=> d!32095 m!128841))

(declare-fun m!128843 () Bool)

(assert (=> d!32095 m!128843))

(assert (=> d!31873 d!32095))

(declare-fun d!32097 () Bool)

(assert (=> d!32097 (= (apply!101 lt!57914 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1357 (getValueByKey!159 (toList!813 lt!57914) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4638 () Bool)

(assert (= bs!4638 d!32097))

(assert (=> bs!4638 m!128389))

(assert (=> bs!4638 m!128389))

(declare-fun m!128845 () Bool)

(assert (=> bs!4638 m!128845))

(assert (=> b!112089 d!32097))

(declare-fun mapNonEmpty!4037 () Bool)

(declare-fun mapRes!4037 () Bool)

(declare-fun tp!10085 () Bool)

(declare-fun e!73229 () Bool)

(assert (=> mapNonEmpty!4037 (= mapRes!4037 (and tp!10085 e!73229))))

(declare-fun mapKey!4037 () (_ BitVec 32))

(declare-fun mapValue!4037 () ValueCell!1008)

(declare-fun mapRest!4037 () (Array (_ BitVec 32) ValueCell!1008))

(assert (=> mapNonEmpty!4037 (= mapRest!4035 (store mapRest!4037 mapKey!4037 mapValue!4037))))

(declare-fun mapIsEmpty!4037 () Bool)

(assert (=> mapIsEmpty!4037 mapRes!4037))

(declare-fun b!112687 () Bool)

(assert (=> b!112687 (= e!73229 tp_is_empty!2703)))

(declare-fun b!112688 () Bool)

(declare-fun e!73230 () Bool)

(assert (=> b!112688 (= e!73230 tp_is_empty!2703)))

(declare-fun condMapEmpty!4037 () Bool)

(declare-fun mapDefault!4037 () ValueCell!1008)

(assert (=> mapNonEmpty!4035 (= condMapEmpty!4037 (= mapRest!4035 ((as const (Array (_ BitVec 32) ValueCell!1008)) mapDefault!4037)))))

(assert (=> mapNonEmpty!4035 (= tp!10083 (and e!73230 mapRes!4037))))

(assert (= (and mapNonEmpty!4035 condMapEmpty!4037) mapIsEmpty!4037))

(assert (= (and mapNonEmpty!4035 (not condMapEmpty!4037)) mapNonEmpty!4037))

(assert (= (and mapNonEmpty!4037 ((_ is ValueCellFull!1008) mapValue!4037)) b!112687))

(assert (= (and mapNonEmpty!4035 ((_ is ValueCellFull!1008) mapDefault!4037)) b!112688))

(declare-fun m!128847 () Bool)

(assert (=> mapNonEmpty!4037 m!128847))

(declare-fun mapNonEmpty!4038 () Bool)

(declare-fun mapRes!4038 () Bool)

(declare-fun tp!10086 () Bool)

(declare-fun e!73231 () Bool)

(assert (=> mapNonEmpty!4038 (= mapRes!4038 (and tp!10086 e!73231))))

(declare-fun mapKey!4038 () (_ BitVec 32))

(declare-fun mapRest!4038 () (Array (_ BitVec 32) ValueCell!1008))

(declare-fun mapValue!4038 () ValueCell!1008)

(assert (=> mapNonEmpty!4038 (= mapRest!4036 (store mapRest!4038 mapKey!4038 mapValue!4038))))

(declare-fun mapIsEmpty!4038 () Bool)

(assert (=> mapIsEmpty!4038 mapRes!4038))

(declare-fun b!112689 () Bool)

(assert (=> b!112689 (= e!73231 tp_is_empty!2703)))

(declare-fun b!112690 () Bool)

(declare-fun e!73232 () Bool)

(assert (=> b!112690 (= e!73232 tp_is_empty!2703)))

(declare-fun condMapEmpty!4038 () Bool)

(declare-fun mapDefault!4038 () ValueCell!1008)

(assert (=> mapNonEmpty!4036 (= condMapEmpty!4038 (= mapRest!4036 ((as const (Array (_ BitVec 32) ValueCell!1008)) mapDefault!4038)))))

(assert (=> mapNonEmpty!4036 (= tp!10084 (and e!73232 mapRes!4038))))

(assert (= (and mapNonEmpty!4036 condMapEmpty!4038) mapIsEmpty!4038))

(assert (= (and mapNonEmpty!4036 (not condMapEmpty!4038)) mapNonEmpty!4038))

(assert (= (and mapNonEmpty!4038 ((_ is ValueCellFull!1008) mapValue!4038)) b!112689))

(assert (= (and mapNonEmpty!4036 ((_ is ValueCellFull!1008) mapDefault!4038)) b!112690))

(declare-fun m!128849 () Bool)

(assert (=> mapNonEmpty!4038 m!128849))

(declare-fun b_lambda!5043 () Bool)

(assert (= b_lambda!5033 (or (and b!111826 b_free!2573 (= (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) (defaultEntry!2648 newMap!16))) (and b!111832 b_free!2575) b_lambda!5043)))

(declare-fun b_lambda!5045 () Bool)

(assert (= b_lambda!5041 (or (and b!111826 b_free!2573 (= (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) (defaultEntry!2648 newMap!16))) (and b!111832 b_free!2575) b_lambda!5045)))

(declare-fun b_lambda!5047 () Bool)

(assert (= b_lambda!5037 (or (and b!111826 b_free!2573) (and b!111832 b_free!2575 (= (defaultEntry!2648 newMap!16) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))))) b_lambda!5047)))

(declare-fun b_lambda!5049 () Bool)

(assert (= b_lambda!5035 (or (and b!111826 b_free!2573 (= (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))) (defaultEntry!2648 newMap!16))) (and b!111832 b_free!2575) b_lambda!5049)))

(declare-fun b_lambda!5051 () Bool)

(assert (= b_lambda!5039 (or (and b!111826 b_free!2573) (and b!111832 b_free!2575 (= (defaultEntry!2648 newMap!16) (defaultEntry!2648 (v!2946 (underlying!373 thiss!992))))) b_lambda!5051)))

(check-sat (not b!112555) (not b!112618) (not b!112497) (not d!31985) (not b!112269) (not bm!12087) (not b!112633) (not d!32055) (not bm!12092) (not bm!12071) (not b!112617) (not b!112545) (not b!112242) (not bm!12040) (not bm!12046) (not bm!12091) (not d!31957) (not b!112641) (not d!31901) (not b!112431) (not b!112528) (not b!112631) (not d!32005) (not d!31951) (not b!112304) (not d!31953) (not b!112654) (not mapNonEmpty!4038) (not d!32023) (not b!112418) (not d!32071) (not b!112313) (not b!112485) (not b!112663) (not d!31977) (not bm!12067) (not b!112670) (not d!32061) (not b!112554) (not b!112645) (not b!112679) (not b!112435) (not bm!12096) (not b_lambda!5031) (not b!112529) (not b!112586) b_and!6921 (not b!112444) (not d!31931) (not b!112668) (not b!112681) (not bm!12068) (not d!32097) (not bm!12075) (not bm!12044) (not b!112644) (not d!32063) (not b!112483) (not d!31905) (not b!112615) (not bm!12058) (not d!32045) (not b!112531) (not b!112638) (not b!112662) (not b!112305) (not b!112673) (not b!112552) (not b!112325) (not b!112570) (not b!112253) (not b!112271) (not b!112479) (not b!112544) (not b!112425) (not b!112328) (not b!112413) (not b!112478) (not bm!12035) (not b!112590) (not b!112551) (not b!112538) (not d!31969) (not b!112360) (not bm!12070) (not b!112607) (not b!112659) (not b!112249) (not d!32067) (not d!31993) (not b!112680) (not d!32027) (not b!112222) (not b!112635) (not d!32081) (not d!32025) (not d!31989) (not b!112646) (not bm!12085) (not b!112549) (not d!32095) (not d!31997) (not b_lambda!5029) (not b!112233) (not b!112587) (not bm!12041) (not b!112273) (not d!32017) (not b!112676) (not b!112359) (not d!32051) (not b!112402) (not b!112243) (not b!112292) (not b!112429) (not b!112315) (not b!112661) (not d!31909) (not b_lambda!5047) (not b!112540) (not b!112335) (not b!112468) (not b!112306) (not b!112321) (not bm!12039) (not d!32039) (not d!32013) (not b!112558) (not d!32047) (not b!112557) (not b!112620) (not d!31937) (not b!112236) (not b!112295) (not d!31923) (not d!31935) (not b!112320) (not b!112239) (not b!112322) (not d!32001) (not b!112424) (not b!112568) (not d!32043) (not d!31971) (not b!112299) (not d!31995) (not d!31987) (not bm!12093) (not d!31907) (not d!32015) (not d!32003) (not b!112530) (not b!112578) (not b!112246) (not b!112584) (not b!112256) (not d!31963) (not b!112619) (not d!32079) (not d!31933) (not b!112281) (not d!32021) (not b!112656) (not d!31981) (not b!112547) (not b!112609) (not b!112614) (not b!112546) (not b!112226) (not b!112567) (not b!112640) (not b!112602) (not d!32033) (not b!112612) (not d!31965) (not bm!12081) (not b_next!2573) (not b!112475) (not b!112433) (not b_lambda!5051) (not b!112449) (not d!32085) (not b!112288) (not d!32009) (not b!112524) (not bm!12047) (not b!112412) (not d!31927) (not b!112543) (not b!112467) (not b!112611) (not d!32029) (not d!32019) (not bm!12037) (not bm!12083) (not b!112481) (not bm!12086) (not d!31991) (not b!112307) (not b!112556) (not b!112559) (not b!112658) (not d!32087) (not d!32007) (not d!31913) (not b_next!2575) (not d!32011) (not b!112657) (not d!31959) (not d!31979) (not b_lambda!5019) (not b!112591) (not d!32031) (not b!112613) (not d!32083) (not bm!12072) (not d!31925) (not b!112548) (not b!112272) (not d!32093) (not b!112675) (not d!31941) (not b!112260) (not b!112560) (not b!112303) (not b!112279) (not d!31947) (not b!112334) (not b!112581) (not b!112576) (not d!31943) (not b!112532) (not d!32035) (not b!112421) (not b!112409) (not b!112491) (not d!31915) (not b!112575) (not bm!12099) (not d!31973) (not b_lambda!5049) (not b!112561) (not d!32065) (not b_lambda!5043) (not b!112420) (not b!112432) (not d!31945) (not b_lambda!5027) (not d!31999) (not b!112410) (not d!32037) (not b!112318) (not b!112259) (not b!112579) (not b!112428) (not b!112476) (not b!112630) (not bm!12048) (not bm!12080) (not b!112606) tp_is_empty!2703 (not d!31911) (not d!32073) (not b!112469) (not mapNonEmpty!4037) (not d!32057) (not b!112572) (not b!112616) (not b!112262) (not b!112265) (not b!112358) (not b_lambda!5045) (not b!112323) (not b!112653) (not b!112430) (not b!112592) (not d!32077) (not b!112416) (not b!112434) (not d!32089) b_and!6919 (not d!32059) (not b!112574) (not b!112270) (not b!112244) (not b!112251))
(check-sat b_and!6919 b_and!6921 (not b_next!2573) (not b_next!2575))
