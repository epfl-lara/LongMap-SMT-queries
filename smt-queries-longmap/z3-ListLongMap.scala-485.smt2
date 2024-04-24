; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10512 () Bool)

(assert start!10512)

(declare-fun b!82598 () Bool)

(declare-fun b_free!2209 () Bool)

(declare-fun b_next!2209 () Bool)

(assert (=> b!82598 (= b_free!2209 (not b_next!2209))))

(declare-fun tp!8843 () Bool)

(declare-fun b_and!5013 () Bool)

(assert (=> b!82598 (= tp!8843 b_and!5013)))

(declare-fun b!82593 () Bool)

(declare-fun b_free!2211 () Bool)

(declare-fun b_next!2211 () Bool)

(assert (=> b!82593 (= b_free!2211 (not b_next!2211))))

(declare-fun tp!8845 () Bool)

(declare-fun b_and!5015 () Bool)

(assert (=> b!82593 (= tp!8845 b_and!5015)))

(declare-fun b!82589 () Bool)

(declare-fun e!53887 () Bool)

(declare-fun e!53882 () Bool)

(assert (=> b!82589 (= e!53887 e!53882)))

(declare-fun b!82590 () Bool)

(declare-fun e!53884 () Bool)

(declare-fun tp_is_empty!2521 () Bool)

(assert (=> b!82590 (= e!53884 tp_is_empty!2521)))

(declare-fun b!82591 () Bool)

(declare-fun e!53877 () Bool)

(declare-fun e!53881 () Bool)

(declare-fun mapRes!3350 () Bool)

(assert (=> b!82591 (= e!53877 (and e!53881 mapRes!3350))))

(declare-fun condMapEmpty!3350 () Bool)

(declare-datatypes ((V!3009 0))(
  ( (V!3010 (val!1305 Int)) )
))
(declare-datatypes ((array!3985 0))(
  ( (array!3986 (arr!1898 (Array (_ BitVec 32) (_ BitVec 64))) (size!2141 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!917 0))(
  ( (ValueCellFull!917 (v!2625 V!3009)) (EmptyCell!917) )
))
(declare-datatypes ((array!3987 0))(
  ( (array!3988 (arr!1899 (Array (_ BitVec 32) ValueCell!917)) (size!2142 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!742 0))(
  ( (LongMapFixedSize!743 (defaultEntry!2313 Int) (mask!6329 (_ BitVec 32)) (extraKeys!2156 (_ BitVec 32)) (zeroValue!2207 V!3009) (minValue!2207 V!3009) (_size!420 (_ BitVec 32)) (_keys!3981 array!3985) (_values!2296 array!3987) (_vacant!420 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!742)

(declare-fun mapDefault!3349 () ValueCell!917)

(assert (=> b!82591 (= condMapEmpty!3350 (= (arr!1899 (_values!2296 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!917)) mapDefault!3349)))))

(declare-fun b!82592 () Bool)

(declare-fun e!53873 () Bool)

(declare-fun e!53874 () Bool)

(assert (=> b!82592 (= e!53873 e!53874)))

(declare-fun res!42822 () Bool)

(assert (=> b!82592 (=> (not res!42822) (not e!53874))))

(declare-datatypes ((tuple2!2176 0))(
  ( (tuple2!2177 (_1!1099 Bool) (_2!1099 LongMapFixedSize!742)) )
))
(declare-fun lt!38614 () tuple2!2176)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!82592 (= res!42822 (and (_1!1099 lt!38614) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2409 0))(
  ( (Unit!2410) )
))
(declare-fun lt!38605 () Unit!2409)

(declare-fun e!53880 () Unit!2409)

(assert (=> b!82592 (= lt!38605 e!53880)))

(declare-datatypes ((Cell!550 0))(
  ( (Cell!551 (v!2626 LongMapFixedSize!742)) )
))
(declare-datatypes ((LongMap!550 0))(
  ( (LongMap!551 (underlying!286 Cell!550)) )
))
(declare-fun thiss!992 () LongMap!550)

(declare-fun c!13164 () Bool)

(declare-datatypes ((tuple2!2178 0))(
  ( (tuple2!2179 (_1!1100 (_ BitVec 64)) (_2!1100 V!3009)) )
))
(declare-datatypes ((List!1502 0))(
  ( (Nil!1499) (Cons!1498 (h!2088 tuple2!2178) (t!5182 List!1502)) )
))
(declare-datatypes ((ListLongMap!1435 0))(
  ( (ListLongMap!1436 (toList!733 List!1502)) )
))
(declare-fun lt!38620 () ListLongMap!1435)

(declare-fun contains!743 (ListLongMap!1435 (_ BitVec 64)) Bool)

(assert (=> b!82592 (= c!13164 (contains!743 lt!38620 (select (arr!1898 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) from!355)))))

(declare-fun lt!38611 () V!3009)

(declare-fun update!121 (LongMapFixedSize!742 (_ BitVec 64) V!3009) tuple2!2176)

(assert (=> b!82592 (= lt!38614 (update!121 newMap!16 (select (arr!1898 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) from!355) lt!38611))))

(declare-fun mapIsEmpty!3349 () Bool)

(assert (=> mapIsEmpty!3349 mapRes!3350))

(declare-fun e!53885 () Bool)

(declare-fun array_inv!1169 (array!3985) Bool)

(declare-fun array_inv!1170 (array!3987) Bool)

(assert (=> b!82593 (= e!53885 (and tp!8845 tp_is_empty!2521 (array_inv!1169 (_keys!3981 newMap!16)) (array_inv!1170 (_values!2296 newMap!16)) e!53877))))

(declare-fun mapNonEmpty!3349 () Bool)

(declare-fun tp!8846 () Bool)

(declare-fun e!53876 () Bool)

(assert (=> mapNonEmpty!3349 (= mapRes!3350 (and tp!8846 e!53876))))

(declare-fun mapKey!3349 () (_ BitVec 32))

(declare-fun mapRest!3350 () (Array (_ BitVec 32) ValueCell!917))

(declare-fun mapValue!3349 () ValueCell!917)

(assert (=> mapNonEmpty!3349 (= (arr!1899 (_values!2296 newMap!16)) (store mapRest!3350 mapKey!3349 mapValue!3349))))

(declare-fun b!82594 () Bool)

(declare-fun res!42816 () Bool)

(declare-fun e!53888 () Bool)

(assert (=> b!82594 (=> (not res!42816) (not e!53888))))

(assert (=> b!82594 (= res!42816 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2141 (_keys!3981 (v!2626 (underlying!286 thiss!992)))))))))

(declare-fun b!82595 () Bool)

(declare-fun e!53875 () Bool)

(assert (=> b!82595 (= e!53874 (not e!53875))))

(declare-fun res!42819 () Bool)

(assert (=> b!82595 (=> res!42819 e!53875)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!82595 (= res!42819 (not (validMask!0 (mask!6329 (v!2626 (underlying!286 thiss!992))))))))

(declare-fun lt!38617 () ListLongMap!1435)

(declare-fun lt!38619 () ListLongMap!1435)

(declare-fun lt!38615 () tuple2!2178)

(declare-fun lt!38618 () tuple2!2178)

(declare-fun +!104 (ListLongMap!1435 tuple2!2178) ListLongMap!1435)

(assert (=> b!82595 (= (+!104 lt!38617 lt!38615) (+!104 (+!104 lt!38619 lt!38615) lt!38618))))

(assert (=> b!82595 (= lt!38615 (tuple2!2179 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2207 (v!2626 (underlying!286 thiss!992)))))))

(declare-fun lt!38610 () Unit!2409)

(declare-fun addCommutativeForDiffKeys!24 (ListLongMap!1435 (_ BitVec 64) V!3009 (_ BitVec 64) V!3009) Unit!2409)

(assert (=> b!82595 (= lt!38610 (addCommutativeForDiffKeys!24 lt!38619 (select (arr!1898 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) from!355) lt!38611 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2207 (v!2626 (underlying!286 thiss!992)))))))

(declare-fun lt!38609 () ListLongMap!1435)

(assert (=> b!82595 (= lt!38609 lt!38617)))

(assert (=> b!82595 (= lt!38617 (+!104 lt!38619 lt!38618))))

(declare-fun lt!38607 () ListLongMap!1435)

(declare-fun lt!38622 () tuple2!2178)

(assert (=> b!82595 (= lt!38609 (+!104 lt!38607 lt!38622))))

(declare-fun lt!38616 () ListLongMap!1435)

(assert (=> b!82595 (= lt!38619 (+!104 lt!38616 lt!38622))))

(assert (=> b!82595 (= lt!38622 (tuple2!2179 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2207 (v!2626 (underlying!286 thiss!992)))))))

(assert (=> b!82595 (= lt!38607 (+!104 lt!38616 lt!38618))))

(assert (=> b!82595 (= lt!38618 (tuple2!2179 (select (arr!1898 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) from!355) lt!38611))))

(declare-fun lt!38608 () Unit!2409)

(assert (=> b!82595 (= lt!38608 (addCommutativeForDiffKeys!24 lt!38616 (select (arr!1898 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) from!355) lt!38611 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2207 (v!2626 (underlying!286 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!69 (array!3985 array!3987 (_ BitVec 32) (_ BitVec 32) V!3009 V!3009 (_ BitVec 32) Int) ListLongMap!1435)

(assert (=> b!82595 (= lt!38616 (getCurrentListMapNoExtraKeys!69 (_keys!3981 (v!2626 (underlying!286 thiss!992))) (_values!2296 (v!2626 (underlying!286 thiss!992))) (mask!6329 (v!2626 (underlying!286 thiss!992))) (extraKeys!2156 (v!2626 (underlying!286 thiss!992))) (zeroValue!2207 (v!2626 (underlying!286 thiss!992))) (minValue!2207 (v!2626 (underlying!286 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2313 (v!2626 (underlying!286 thiss!992)))))))

(declare-fun b!82596 () Bool)

(declare-fun e!53879 () Bool)

(assert (=> b!82596 (= e!53879 tp_is_empty!2521)))

(declare-fun b!82597 () Bool)

(declare-fun e!53883 () Bool)

(assert (=> b!82597 (= e!53888 e!53883)))

(declare-fun res!42821 () Bool)

(assert (=> b!82597 (=> (not res!42821) (not e!53883))))

(declare-fun lt!38606 () ListLongMap!1435)

(assert (=> b!82597 (= res!42821 (= lt!38606 lt!38620))))

(declare-fun map!1190 (LongMapFixedSize!742) ListLongMap!1435)

(assert (=> b!82597 (= lt!38620 (map!1190 newMap!16))))

(declare-fun getCurrentListMap!428 (array!3985 array!3987 (_ BitVec 32) (_ BitVec 32) V!3009 V!3009 (_ BitVec 32) Int) ListLongMap!1435)

(assert (=> b!82597 (= lt!38606 (getCurrentListMap!428 (_keys!3981 (v!2626 (underlying!286 thiss!992))) (_values!2296 (v!2626 (underlying!286 thiss!992))) (mask!6329 (v!2626 (underlying!286 thiss!992))) (extraKeys!2156 (v!2626 (underlying!286 thiss!992))) (zeroValue!2207 (v!2626 (underlying!286 thiss!992))) (minValue!2207 (v!2626 (underlying!286 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2313 (v!2626 (underlying!286 thiss!992)))))))

(declare-fun e!53878 () Bool)

(assert (=> b!82598 (= e!53882 (and tp!8843 tp_is_empty!2521 (array_inv!1169 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) (array_inv!1170 (_values!2296 (v!2626 (underlying!286 thiss!992)))) e!53878))))

(declare-fun b!82599 () Bool)

(declare-fun Unit!2411 () Unit!2409)

(assert (=> b!82599 (= e!53880 Unit!2411)))

(declare-fun lt!38613 () Unit!2409)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!56 (array!3985 array!3987 (_ BitVec 32) (_ BitVec 32) V!3009 V!3009 (_ BitVec 64) (_ BitVec 32) Int) Unit!2409)

(assert (=> b!82599 (= lt!38613 (lemmaListMapContainsThenArrayContainsFrom!56 (_keys!3981 (v!2626 (underlying!286 thiss!992))) (_values!2296 (v!2626 (underlying!286 thiss!992))) (mask!6329 (v!2626 (underlying!286 thiss!992))) (extraKeys!2156 (v!2626 (underlying!286 thiss!992))) (zeroValue!2207 (v!2626 (underlying!286 thiss!992))) (minValue!2207 (v!2626 (underlying!286 thiss!992))) (select (arr!1898 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2313 (v!2626 (underlying!286 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!82599 (arrayContainsKey!0 (_keys!3981 (v!2626 (underlying!286 thiss!992))) (select (arr!1898 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!38612 () Unit!2409)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3985 (_ BitVec 32) (_ BitVec 32)) Unit!2409)

(assert (=> b!82599 (= lt!38612 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3981 (v!2626 (underlying!286 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1503 0))(
  ( (Nil!1500) (Cons!1499 (h!2089 (_ BitVec 64)) (t!5183 List!1503)) )
))
(declare-fun arrayNoDuplicates!0 (array!3985 (_ BitVec 32) List!1503) Bool)

(assert (=> b!82599 (arrayNoDuplicates!0 (_keys!3981 (v!2626 (underlying!286 thiss!992))) from!355 Nil!1500)))

(declare-fun lt!38621 () Unit!2409)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3985 (_ BitVec 32) (_ BitVec 64) List!1503) Unit!2409)

(assert (=> b!82599 (= lt!38621 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3981 (v!2626 (underlying!286 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1898 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) from!355) (Cons!1499 (select (arr!1898 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) from!355) Nil!1500)))))

(assert (=> b!82599 false))

(declare-fun res!42818 () Bool)

(assert (=> start!10512 (=> (not res!42818) (not e!53888))))

(declare-fun valid!329 (LongMap!550) Bool)

(assert (=> start!10512 (= res!42818 (valid!329 thiss!992))))

(assert (=> start!10512 e!53888))

(declare-fun e!53886 () Bool)

(assert (=> start!10512 e!53886))

(assert (=> start!10512 true))

(assert (=> start!10512 e!53885))

(declare-fun mapIsEmpty!3350 () Bool)

(declare-fun mapRes!3349 () Bool)

(assert (=> mapIsEmpty!3350 mapRes!3349))

(declare-fun b!82600 () Bool)

(assert (=> b!82600 (= e!53875 (or (not (= (size!2142 (_values!2296 (v!2626 (underlying!286 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6329 (v!2626 (underlying!286 thiss!992)))))) (not (= (size!2141 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) (size!2142 (_values!2296 (v!2626 (underlying!286 thiss!992)))))) (bvsge (mask!6329 (v!2626 (underlying!286 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!82601 () Bool)

(declare-fun res!42820 () Bool)

(assert (=> b!82601 (=> (not res!42820) (not e!53888))))

(assert (=> b!82601 (= res!42820 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6329 newMap!16)) (_size!420 (v!2626 (underlying!286 thiss!992)))))))

(declare-fun b!82602 () Bool)

(assert (=> b!82602 (= e!53881 tp_is_empty!2521)))

(declare-fun b!82603 () Bool)

(declare-fun res!42817 () Bool)

(assert (=> b!82603 (=> (not res!42817) (not e!53888))))

(declare-fun valid!330 (LongMapFixedSize!742) Bool)

(assert (=> b!82603 (= res!42817 (valid!330 newMap!16))))

(declare-fun b!82604 () Bool)

(assert (=> b!82604 (= e!53878 (and e!53879 mapRes!3349))))

(declare-fun condMapEmpty!3349 () Bool)

(declare-fun mapDefault!3350 () ValueCell!917)

(assert (=> b!82604 (= condMapEmpty!3349 (= (arr!1899 (_values!2296 (v!2626 (underlying!286 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!917)) mapDefault!3350)))))

(declare-fun b!82605 () Bool)

(assert (=> b!82605 (= e!53886 e!53887)))

(declare-fun b!82606 () Bool)

(assert (=> b!82606 (= e!53876 tp_is_empty!2521)))

(declare-fun mapNonEmpty!3350 () Bool)

(declare-fun tp!8844 () Bool)

(assert (=> mapNonEmpty!3350 (= mapRes!3349 (and tp!8844 e!53884))))

(declare-fun mapValue!3350 () ValueCell!917)

(declare-fun mapRest!3349 () (Array (_ BitVec 32) ValueCell!917))

(declare-fun mapKey!3350 () (_ BitVec 32))

(assert (=> mapNonEmpty!3350 (= (arr!1899 (_values!2296 (v!2626 (underlying!286 thiss!992)))) (store mapRest!3349 mapKey!3350 mapValue!3350))))

(declare-fun b!82607 () Bool)

(declare-fun Unit!2412 () Unit!2409)

(assert (=> b!82607 (= e!53880 Unit!2412)))

(declare-fun b!82608 () Bool)

(assert (=> b!82608 (= e!53883 e!53873)))

(declare-fun res!42823 () Bool)

(assert (=> b!82608 (=> (not res!42823) (not e!53873))))

(assert (=> b!82608 (= res!42823 (and (not (= (select (arr!1898 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1898 (_keys!3981 (v!2626 (underlying!286 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1195 (ValueCell!917 V!3009) V!3009)

(declare-fun dynLambda!342 (Int (_ BitVec 64)) V!3009)

(assert (=> b!82608 (= lt!38611 (get!1195 (select (arr!1899 (_values!2296 (v!2626 (underlying!286 thiss!992)))) from!355) (dynLambda!342 (defaultEntry!2313 (v!2626 (underlying!286 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!10512 res!42818) b!82594))

(assert (= (and b!82594 res!42816) b!82603))

(assert (= (and b!82603 res!42817) b!82601))

(assert (= (and b!82601 res!42820) b!82597))

(assert (= (and b!82597 res!42821) b!82608))

(assert (= (and b!82608 res!42823) b!82592))

(assert (= (and b!82592 c!13164) b!82599))

(assert (= (and b!82592 (not c!13164)) b!82607))

(assert (= (and b!82592 res!42822) b!82595))

(assert (= (and b!82595 (not res!42819)) b!82600))

(assert (= (and b!82604 condMapEmpty!3349) mapIsEmpty!3350))

(assert (= (and b!82604 (not condMapEmpty!3349)) mapNonEmpty!3350))

(get-info :version)

(assert (= (and mapNonEmpty!3350 ((_ is ValueCellFull!917) mapValue!3350)) b!82590))

(assert (= (and b!82604 ((_ is ValueCellFull!917) mapDefault!3350)) b!82596))

(assert (= b!82598 b!82604))

(assert (= b!82589 b!82598))

(assert (= b!82605 b!82589))

(assert (= start!10512 b!82605))

(assert (= (and b!82591 condMapEmpty!3350) mapIsEmpty!3349))

(assert (= (and b!82591 (not condMapEmpty!3350)) mapNonEmpty!3349))

(assert (= (and mapNonEmpty!3349 ((_ is ValueCellFull!917) mapValue!3349)) b!82606))

(assert (= (and b!82591 ((_ is ValueCellFull!917) mapDefault!3349)) b!82602))

(assert (= b!82593 b!82591))

(assert (= start!10512 b!82593))

(declare-fun b_lambda!3685 () Bool)

(assert (=> (not b_lambda!3685) (not b!82608)))

(declare-fun t!5179 () Bool)

(declare-fun tb!1649 () Bool)

(assert (=> (and b!82598 (= (defaultEntry!2313 (v!2626 (underlying!286 thiss!992))) (defaultEntry!2313 (v!2626 (underlying!286 thiss!992)))) t!5179) tb!1649))

(declare-fun result!2857 () Bool)

(assert (=> tb!1649 (= result!2857 tp_is_empty!2521)))

(assert (=> b!82608 t!5179))

(declare-fun b_and!5017 () Bool)

(assert (= b_and!5013 (and (=> t!5179 result!2857) b_and!5017)))

(declare-fun t!5181 () Bool)

(declare-fun tb!1651 () Bool)

(assert (=> (and b!82593 (= (defaultEntry!2313 newMap!16) (defaultEntry!2313 (v!2626 (underlying!286 thiss!992)))) t!5181) tb!1651))

(declare-fun result!2861 () Bool)

(assert (= result!2861 result!2857))

(assert (=> b!82608 t!5181))

(declare-fun b_and!5019 () Bool)

(assert (= b_and!5015 (and (=> t!5181 result!2861) b_and!5019)))

(declare-fun m!85529 () Bool)

(assert (=> b!82593 m!85529))

(declare-fun m!85531 () Bool)

(assert (=> b!82593 m!85531))

(declare-fun m!85533 () Bool)

(assert (=> b!82598 m!85533))

(declare-fun m!85535 () Bool)

(assert (=> b!82598 m!85535))

(declare-fun m!85537 () Bool)

(assert (=> mapNonEmpty!3349 m!85537))

(declare-fun m!85539 () Bool)

(assert (=> b!82597 m!85539))

(declare-fun m!85541 () Bool)

(assert (=> b!82597 m!85541))

(declare-fun m!85543 () Bool)

(assert (=> start!10512 m!85543))

(declare-fun m!85545 () Bool)

(assert (=> b!82608 m!85545))

(declare-fun m!85547 () Bool)

(assert (=> b!82608 m!85547))

(declare-fun m!85549 () Bool)

(assert (=> b!82608 m!85549))

(assert (=> b!82608 m!85547))

(assert (=> b!82608 m!85549))

(declare-fun m!85551 () Bool)

(assert (=> b!82608 m!85551))

(declare-fun m!85553 () Bool)

(assert (=> b!82603 m!85553))

(declare-fun m!85555 () Bool)

(assert (=> b!82595 m!85555))

(declare-fun m!85557 () Bool)

(assert (=> b!82595 m!85557))

(assert (=> b!82595 m!85557))

(declare-fun m!85559 () Bool)

(assert (=> b!82595 m!85559))

(declare-fun m!85561 () Bool)

(assert (=> b!82595 m!85561))

(assert (=> b!82595 m!85545))

(declare-fun m!85563 () Bool)

(assert (=> b!82595 m!85563))

(declare-fun m!85565 () Bool)

(assert (=> b!82595 m!85565))

(declare-fun m!85567 () Bool)

(assert (=> b!82595 m!85567))

(declare-fun m!85569 () Bool)

(assert (=> b!82595 m!85569))

(assert (=> b!82595 m!85545))

(declare-fun m!85571 () Bool)

(assert (=> b!82595 m!85571))

(declare-fun m!85573 () Bool)

(assert (=> b!82595 m!85573))

(assert (=> b!82595 m!85545))

(declare-fun m!85575 () Bool)

(assert (=> b!82595 m!85575))

(declare-fun m!85577 () Bool)

(assert (=> b!82599 m!85577))

(declare-fun m!85579 () Bool)

(assert (=> b!82599 m!85579))

(assert (=> b!82599 m!85545))

(declare-fun m!85581 () Bool)

(assert (=> b!82599 m!85581))

(assert (=> b!82599 m!85545))

(assert (=> b!82599 m!85545))

(declare-fun m!85583 () Bool)

(assert (=> b!82599 m!85583))

(assert (=> b!82599 m!85545))

(declare-fun m!85585 () Bool)

(assert (=> b!82599 m!85585))

(assert (=> b!82592 m!85545))

(assert (=> b!82592 m!85545))

(declare-fun m!85587 () Bool)

(assert (=> b!82592 m!85587))

(assert (=> b!82592 m!85545))

(declare-fun m!85589 () Bool)

(assert (=> b!82592 m!85589))

(declare-fun m!85591 () Bool)

(assert (=> mapNonEmpty!3350 m!85591))

(check-sat (not b!82598) (not start!10512) b_and!5017 (not b!82592) (not mapNonEmpty!3349) (not mapNonEmpty!3350) (not b!82603) (not b!82608) (not b!82597) (not b!82599) (not b_next!2211) b_and!5019 (not b_next!2209) tp_is_empty!2521 (not b_lambda!3685) (not b!82593) (not b!82595))
(check-sat b_and!5017 b_and!5019 (not b_next!2209) (not b_next!2211))
