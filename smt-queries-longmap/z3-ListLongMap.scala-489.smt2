; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10950 () Bool)

(assert start!10950)

(declare-fun b!88685 () Bool)

(declare-fun b_free!2257 () Bool)

(declare-fun b_next!2257 () Bool)

(assert (=> b!88685 (= b_free!2257 (not b_next!2257))))

(declare-fun tp!9011 () Bool)

(declare-fun b_and!5325 () Bool)

(assert (=> b!88685 (= tp!9011 b_and!5325)))

(declare-fun b!88690 () Bool)

(declare-fun b_free!2259 () Bool)

(declare-fun b_next!2259 () Bool)

(assert (=> b!88690 (= b_free!2259 (not b_next!2259))))

(declare-fun tp!9009 () Bool)

(declare-fun b_and!5327 () Bool)

(assert (=> b!88690 (= tp!9009 b_and!5327)))

(declare-fun mapNonEmpty!3443 () Bool)

(declare-fun mapRes!3443 () Bool)

(declare-fun tp!9010 () Bool)

(declare-fun e!57748 () Bool)

(assert (=> mapNonEmpty!3443 (= mapRes!3443 (and tp!9010 e!57748))))

(declare-datatypes ((V!3041 0))(
  ( (V!3042 (val!1317 Int)) )
))
(declare-datatypes ((ValueCell!929 0))(
  ( (ValueCellFull!929 (v!2676 V!3041)) (EmptyCell!929) )
))
(declare-fun mapValue!3443 () ValueCell!929)

(declare-datatypes ((array!4039 0))(
  ( (array!4040 (arr!1922 (Array (_ BitVec 32) (_ BitVec 64))) (size!2168 (_ BitVec 32))) )
))
(declare-datatypes ((array!4041 0))(
  ( (array!4042 (arr!1923 (Array (_ BitVec 32) ValueCell!929)) (size!2169 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!766 0))(
  ( (LongMapFixedSize!767 (defaultEntry!2371 Int) (mask!6415 (_ BitVec 32)) (extraKeys!2204 (_ BitVec 32)) (zeroValue!2260 V!3041) (minValue!2260 V!3041) (_size!432 (_ BitVec 32)) (_keys!4049 array!4039) (_values!2354 array!4041) (_vacant!432 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!574 0))(
  ( (Cell!575 (v!2677 LongMapFixedSize!766)) )
))
(declare-datatypes ((LongMap!574 0))(
  ( (LongMap!575 (underlying!298 Cell!574)) )
))
(declare-fun thiss!992 () LongMap!574)

(declare-fun mapRest!3443 () (Array (_ BitVec 32) ValueCell!929))

(declare-fun mapKey!3443 () (_ BitVec 32))

(assert (=> mapNonEmpty!3443 (= (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (store mapRest!3443 mapKey!3443 mapValue!3443))))

(declare-fun res!45391 () Bool)

(declare-fun e!57750 () Bool)

(assert (=> start!10950 (=> (not res!45391) (not e!57750))))

(declare-fun valid!342 (LongMap!574) Bool)

(assert (=> start!10950 (= res!45391 (valid!342 thiss!992))))

(assert (=> start!10950 e!57750))

(declare-fun e!57751 () Bool)

(assert (=> start!10950 e!57751))

(assert (=> start!10950 true))

(declare-fun e!57746 () Bool)

(assert (=> start!10950 e!57746))

(declare-fun mapNonEmpty!3444 () Bool)

(declare-fun mapRes!3444 () Bool)

(declare-fun tp!9012 () Bool)

(declare-fun e!57755 () Bool)

(assert (=> mapNonEmpty!3444 (= mapRes!3444 (and tp!9012 e!57755))))

(declare-fun mapKey!3444 () (_ BitVec 32))

(declare-fun mapValue!3444 () ValueCell!929)

(declare-fun newMap!16 () LongMapFixedSize!766)

(declare-fun mapRest!3444 () (Array (_ BitVec 32) ValueCell!929))

(assert (=> mapNonEmpty!3444 (= (arr!1923 (_values!2354 newMap!16)) (store mapRest!3444 mapKey!3444 mapValue!3444))))

(declare-fun b!88680 () Bool)

(declare-fun e!57739 () Bool)

(declare-datatypes ((List!1516 0))(
  ( (Nil!1513) (Cons!1512 (h!2104 (_ BitVec 64)) (t!5266 List!1516)) )
))
(declare-fun arrayNoDuplicates!0 (array!4039 (_ BitVec 32) List!1516) Bool)

(assert (=> b!88680 (= e!57739 (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000000 Nil!1513))))

(declare-fun b!88681 () Bool)

(declare-fun res!45390 () Bool)

(assert (=> b!88681 (=> (not res!45390) (not e!57750))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!88681 (= res!45390 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992)))))))))

(declare-fun b!88682 () Bool)

(declare-datatypes ((Unit!2620 0))(
  ( (Unit!2621) )
))
(declare-fun e!57747 () Unit!2620)

(declare-fun Unit!2622 () Unit!2620)

(assert (=> b!88682 (= e!57747 Unit!2622)))

(declare-fun b!88683 () Bool)

(declare-fun e!57745 () Bool)

(assert (=> b!88683 (= e!57745 (not e!57739))))

(declare-fun res!45392 () Bool)

(assert (=> b!88683 (=> res!45392 e!57739)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!88683 (= res!45392 (not (validMask!0 (mask!6415 (v!2677 (underlying!298 thiss!992))))))))

(declare-datatypes ((tuple2!2200 0))(
  ( (tuple2!2201 (_1!1111 (_ BitVec 64)) (_2!1111 V!3041)) )
))
(declare-fun lt!42408 () tuple2!2200)

(declare-datatypes ((List!1517 0))(
  ( (Nil!1514) (Cons!1513 (h!2105 tuple2!2200) (t!5267 List!1517)) )
))
(declare-datatypes ((ListLongMap!1449 0))(
  ( (ListLongMap!1450 (toList!740 List!1517)) )
))
(declare-fun lt!42402 () ListLongMap!1449)

(declare-fun lt!42413 () ListLongMap!1449)

(declare-fun lt!42406 () tuple2!2200)

(declare-fun +!111 (ListLongMap!1449 tuple2!2200) ListLongMap!1449)

(assert (=> b!88683 (= (+!111 lt!42402 lt!42406) (+!111 (+!111 lt!42413 lt!42406) lt!42408))))

(assert (=> b!88683 (= lt!42406 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun lt!42411 () Unit!2620)

(declare-fun lt!42407 () V!3041)

(declare-fun addCommutativeForDiffKeys!31 (ListLongMap!1449 (_ BitVec 64) V!3041 (_ BitVec 64) V!3041) Unit!2620)

(assert (=> b!88683 (= lt!42411 (addCommutativeForDiffKeys!31 lt!42413 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun lt!42396 () ListLongMap!1449)

(assert (=> b!88683 (= lt!42396 lt!42402)))

(assert (=> b!88683 (= lt!42402 (+!111 lt!42413 lt!42408))))

(declare-fun lt!42401 () ListLongMap!1449)

(declare-fun lt!42410 () tuple2!2200)

(assert (=> b!88683 (= lt!42396 (+!111 lt!42401 lt!42410))))

(declare-fun lt!42397 () ListLongMap!1449)

(assert (=> b!88683 (= lt!42413 (+!111 lt!42397 lt!42410))))

(assert (=> b!88683 (= lt!42410 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))

(assert (=> b!88683 (= lt!42401 (+!111 lt!42397 lt!42408))))

(assert (=> b!88683 (= lt!42408 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))

(declare-fun lt!42399 () Unit!2620)

(assert (=> b!88683 (= lt!42399 (addCommutativeForDiffKeys!31 lt!42397 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!76 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) Int) ListLongMap!1449)

(assert (=> b!88683 (= lt!42397 (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun b!88684 () Bool)

(declare-fun res!45389 () Bool)

(assert (=> b!88684 (=> res!45389 e!57739)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4039 (_ BitVec 32)) Bool)

(assert (=> b!88684 (= res!45389 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun e!57753 () Bool)

(declare-fun e!57749 () Bool)

(declare-fun tp_is_empty!2545 () Bool)

(declare-fun array_inv!1185 (array!4039) Bool)

(declare-fun array_inv!1186 (array!4041) Bool)

(assert (=> b!88685 (= e!57749 (and tp!9011 tp_is_empty!2545 (array_inv!1185 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (array_inv!1186 (_values!2354 (v!2677 (underlying!298 thiss!992)))) e!57753))))

(declare-fun b!88686 () Bool)

(declare-fun res!45388 () Bool)

(assert (=> b!88686 (=> (not res!45388) (not e!57750))))

(declare-fun valid!343 (LongMapFixedSize!766) Bool)

(assert (=> b!88686 (= res!45388 (valid!343 newMap!16))))

(declare-fun b!88687 () Bool)

(declare-fun e!57752 () Bool)

(assert (=> b!88687 (= e!57750 e!57752)))

(declare-fun res!45394 () Bool)

(assert (=> b!88687 (=> (not res!45394) (not e!57752))))

(declare-fun lt!42403 () ListLongMap!1449)

(declare-fun lt!42409 () ListLongMap!1449)

(assert (=> b!88687 (= res!45394 (= lt!42403 lt!42409))))

(declare-fun map!1203 (LongMapFixedSize!766) ListLongMap!1449)

(assert (=> b!88687 (= lt!42409 (map!1203 newMap!16))))

(declare-fun getCurrentListMap!433 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) Int) ListLongMap!1449)

(assert (=> b!88687 (= lt!42403 (getCurrentListMap!433 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun b!88688 () Bool)

(declare-fun e!57741 () Bool)

(assert (=> b!88688 (= e!57741 tp_is_empty!2545)))

(declare-fun b!88689 () Bool)

(declare-fun e!57738 () Bool)

(assert (=> b!88689 (= e!57738 (and e!57741 mapRes!3444))))

(declare-fun condMapEmpty!3444 () Bool)

(declare-fun mapDefault!3444 () ValueCell!929)

(assert (=> b!88689 (= condMapEmpty!3444 (= (arr!1923 (_values!2354 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3444)))))

(declare-fun mapIsEmpty!3443 () Bool)

(assert (=> mapIsEmpty!3443 mapRes!3444))

(declare-fun mapIsEmpty!3444 () Bool)

(assert (=> mapIsEmpty!3444 mapRes!3443))

(assert (=> b!88690 (= e!57746 (and tp!9009 tp_is_empty!2545 (array_inv!1185 (_keys!4049 newMap!16)) (array_inv!1186 (_values!2354 newMap!16)) e!57738))))

(declare-fun b!88691 () Bool)

(declare-fun e!57743 () Bool)

(assert (=> b!88691 (= e!57743 tp_is_empty!2545)))

(declare-fun b!88692 () Bool)

(declare-fun e!57742 () Bool)

(assert (=> b!88692 (= e!57751 e!57742)))

(declare-fun b!88693 () Bool)

(declare-fun e!57740 () Bool)

(assert (=> b!88693 (= e!57752 e!57740)))

(declare-fun res!45397 () Bool)

(assert (=> b!88693 (=> (not res!45397) (not e!57740))))

(assert (=> b!88693 (= res!45397 (and (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1217 (ValueCell!929 V!3041) V!3041)

(declare-fun dynLambda!347 (Int (_ BitVec 64)) V!3041)

(assert (=> b!88693 (= lt!42407 (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88694 () Bool)

(assert (=> b!88694 (= e!57742 e!57749)))

(declare-fun b!88695 () Bool)

(assert (=> b!88695 (= e!57740 e!57745)))

(declare-fun res!45393 () Bool)

(assert (=> b!88695 (=> (not res!45393) (not e!57745))))

(declare-datatypes ((tuple2!2202 0))(
  ( (tuple2!2203 (_1!1112 Bool) (_2!1112 LongMapFixedSize!766)) )
))
(declare-fun lt!42404 () tuple2!2202)

(assert (=> b!88695 (= res!45393 (and (_1!1112 lt!42404) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!42405 () Unit!2620)

(assert (=> b!88695 (= lt!42405 e!57747)))

(declare-fun c!14700 () Bool)

(declare-fun contains!754 (ListLongMap!1449 (_ BitVec 64)) Bool)

(assert (=> b!88695 (= c!14700 (contains!754 lt!42409 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun update!126 (LongMapFixedSize!766 (_ BitVec 64) V!3041) tuple2!2202)

(assert (=> b!88695 (= lt!42404 (update!126 newMap!16 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))

(declare-fun b!88696 () Bool)

(declare-fun Unit!2623 () Unit!2620)

(assert (=> b!88696 (= e!57747 Unit!2623)))

(declare-fun lt!42398 () Unit!2620)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!63 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) (_ BitVec 32) Int) Unit!2620)

(assert (=> b!88696 (= lt!42398 (lemmaListMapContainsThenArrayContainsFrom!63 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!88696 (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!42412 () Unit!2620)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4039 (_ BitVec 32) (_ BitVec 32)) Unit!2620)

(assert (=> b!88696 (= lt!42412 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!88696 (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) from!355 Nil!1513)))

(declare-fun lt!42400 () Unit!2620)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4039 (_ BitVec 32) (_ BitVec 64) List!1516) Unit!2620)

(assert (=> b!88696 (= lt!42400 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) Nil!1513)))))

(assert (=> b!88696 false))

(declare-fun b!88697 () Bool)

(declare-fun res!45396 () Bool)

(assert (=> b!88697 (=> (not res!45396) (not e!57750))))

(assert (=> b!88697 (= res!45396 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6415 newMap!16)) (_size!432 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun b!88698 () Bool)

(assert (=> b!88698 (= e!57748 tp_is_empty!2545)))

(declare-fun b!88699 () Bool)

(assert (=> b!88699 (= e!57753 (and e!57743 mapRes!3443))))

(declare-fun condMapEmpty!3443 () Bool)

(declare-fun mapDefault!3443 () ValueCell!929)

(assert (=> b!88699 (= condMapEmpty!3443 (= (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3443)))))

(declare-fun b!88700 () Bool)

(declare-fun res!45395 () Bool)

(assert (=> b!88700 (=> res!45395 e!57739)))

(assert (=> b!88700 (= res!45395 (or (not (= (size!2169 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6415 (v!2677 (underlying!298 thiss!992)))))) (not (= (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (size!2169 (_values!2354 (v!2677 (underlying!298 thiss!992)))))) (bvslt (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!88701 () Bool)

(assert (=> b!88701 (= e!57755 tp_is_empty!2545)))

(assert (= (and start!10950 res!45391) b!88681))

(assert (= (and b!88681 res!45390) b!88686))

(assert (= (and b!88686 res!45388) b!88697))

(assert (= (and b!88697 res!45396) b!88687))

(assert (= (and b!88687 res!45394) b!88693))

(assert (= (and b!88693 res!45397) b!88695))

(assert (= (and b!88695 c!14700) b!88696))

(assert (= (and b!88695 (not c!14700)) b!88682))

(assert (= (and b!88695 res!45393) b!88683))

(assert (= (and b!88683 (not res!45392)) b!88700))

(assert (= (and b!88700 (not res!45395)) b!88684))

(assert (= (and b!88684 (not res!45389)) b!88680))

(assert (= (and b!88699 condMapEmpty!3443) mapIsEmpty!3444))

(assert (= (and b!88699 (not condMapEmpty!3443)) mapNonEmpty!3443))

(get-info :version)

(assert (= (and mapNonEmpty!3443 ((_ is ValueCellFull!929) mapValue!3443)) b!88698))

(assert (= (and b!88699 ((_ is ValueCellFull!929) mapDefault!3443)) b!88691))

(assert (= b!88685 b!88699))

(assert (= b!88694 b!88685))

(assert (= b!88692 b!88694))

(assert (= start!10950 b!88692))

(assert (= (and b!88689 condMapEmpty!3444) mapIsEmpty!3443))

(assert (= (and b!88689 (not condMapEmpty!3444)) mapNonEmpty!3444))

(assert (= (and mapNonEmpty!3444 ((_ is ValueCellFull!929) mapValue!3444)) b!88701))

(assert (= (and b!88689 ((_ is ValueCellFull!929) mapDefault!3444)) b!88688))

(assert (= b!88690 b!88689))

(assert (= start!10950 b!88690))

(declare-fun b_lambda!3927 () Bool)

(assert (=> (not b_lambda!3927) (not b!88693)))

(declare-fun t!5263 () Bool)

(declare-fun tb!1717 () Bool)

(assert (=> (and b!88685 (= (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))) t!5263) tb!1717))

(declare-fun result!2955 () Bool)

(assert (=> tb!1717 (= result!2955 tp_is_empty!2545)))

(assert (=> b!88693 t!5263))

(declare-fun b_and!5329 () Bool)

(assert (= b_and!5325 (and (=> t!5263 result!2955) b_and!5329)))

(declare-fun tb!1719 () Bool)

(declare-fun t!5265 () Bool)

(assert (=> (and b!88690 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))) t!5265) tb!1719))

(declare-fun result!2959 () Bool)

(assert (= result!2959 result!2955))

(assert (=> b!88693 t!5265))

(declare-fun b_and!5331 () Bool)

(assert (= b_and!5327 (and (=> t!5265 result!2959) b_and!5331)))

(declare-fun m!94891 () Bool)

(assert (=> b!88695 m!94891))

(assert (=> b!88695 m!94891))

(declare-fun m!94893 () Bool)

(assert (=> b!88695 m!94893))

(assert (=> b!88695 m!94891))

(declare-fun m!94895 () Bool)

(assert (=> b!88695 m!94895))

(declare-fun m!94897 () Bool)

(assert (=> b!88683 m!94897))

(declare-fun m!94899 () Bool)

(assert (=> b!88683 m!94899))

(declare-fun m!94901 () Bool)

(assert (=> b!88683 m!94901))

(assert (=> b!88683 m!94891))

(declare-fun m!94903 () Bool)

(assert (=> b!88683 m!94903))

(declare-fun m!94905 () Bool)

(assert (=> b!88683 m!94905))

(assert (=> b!88683 m!94891))

(assert (=> b!88683 m!94897))

(declare-fun m!94907 () Bool)

(assert (=> b!88683 m!94907))

(declare-fun m!94909 () Bool)

(assert (=> b!88683 m!94909))

(declare-fun m!94911 () Bool)

(assert (=> b!88683 m!94911))

(declare-fun m!94913 () Bool)

(assert (=> b!88683 m!94913))

(assert (=> b!88683 m!94891))

(declare-fun m!94915 () Bool)

(assert (=> b!88683 m!94915))

(declare-fun m!94917 () Bool)

(assert (=> b!88683 m!94917))

(declare-fun m!94919 () Bool)

(assert (=> b!88696 m!94919))

(declare-fun m!94921 () Bool)

(assert (=> b!88696 m!94921))

(assert (=> b!88696 m!94891))

(declare-fun m!94923 () Bool)

(assert (=> b!88696 m!94923))

(assert (=> b!88696 m!94891))

(assert (=> b!88696 m!94891))

(declare-fun m!94925 () Bool)

(assert (=> b!88696 m!94925))

(assert (=> b!88696 m!94891))

(declare-fun m!94927 () Bool)

(assert (=> b!88696 m!94927))

(declare-fun m!94929 () Bool)

(assert (=> b!88680 m!94929))

(declare-fun m!94931 () Bool)

(assert (=> b!88687 m!94931))

(declare-fun m!94933 () Bool)

(assert (=> b!88687 m!94933))

(declare-fun m!94935 () Bool)

(assert (=> b!88685 m!94935))

(declare-fun m!94937 () Bool)

(assert (=> b!88685 m!94937))

(assert (=> b!88693 m!94891))

(declare-fun m!94939 () Bool)

(assert (=> b!88693 m!94939))

(declare-fun m!94941 () Bool)

(assert (=> b!88693 m!94941))

(assert (=> b!88693 m!94939))

(assert (=> b!88693 m!94941))

(declare-fun m!94943 () Bool)

(assert (=> b!88693 m!94943))

(declare-fun m!94945 () Bool)

(assert (=> start!10950 m!94945))

(declare-fun m!94947 () Bool)

(assert (=> b!88690 m!94947))

(declare-fun m!94949 () Bool)

(assert (=> b!88690 m!94949))

(declare-fun m!94951 () Bool)

(assert (=> b!88684 m!94951))

(declare-fun m!94953 () Bool)

(assert (=> b!88686 m!94953))

(declare-fun m!94955 () Bool)

(assert (=> mapNonEmpty!3444 m!94955))

(declare-fun m!94957 () Bool)

(assert (=> mapNonEmpty!3443 m!94957))

(check-sat (not mapNonEmpty!3444) (not b!88690) (not b_lambda!3927) (not b!88680) b_and!5331 tp_is_empty!2545 (not b!88695) (not start!10950) (not b!88696) (not b_next!2259) (not b!88693) (not mapNonEmpty!3443) (not b_next!2257) (not b!88685) (not b!88687) (not b!88686) (not b!88683) b_and!5329 (not b!88684))
(check-sat b_and!5329 b_and!5331 (not b_next!2257) (not b_next!2259))
(get-model)

(declare-fun b_lambda!3933 () Bool)

(assert (= b_lambda!3927 (or (and b!88685 b_free!2257) (and b!88690 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))))) b_lambda!3933)))

(check-sat (not mapNonEmpty!3444) (not b!88690) (not b!88680) b_and!5331 tp_is_empty!2545 (not start!10950) (not b!88696) (not b_next!2259) (not b!88693) (not mapNonEmpty!3443) (not b_next!2257) (not b!88685) (not b!88687) (not b!88686) (not b!88683) b_and!5329 (not b!88684) (not b!88695) (not b_lambda!3933))
(check-sat b_and!5329 b_and!5331 (not b_next!2257) (not b_next!2259))
(get-model)

(declare-fun d!23651 () Bool)

(assert (=> d!23651 (= (+!111 (+!111 lt!42397 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (+!111 (+!111 lt!42397 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))

(declare-fun lt!42524 () Unit!2620)

(declare-fun choose!533 (ListLongMap!1449 (_ BitVec 64) V!3041 (_ BitVec 64) V!3041) Unit!2620)

(assert (=> d!23651 (= lt!42524 (choose!533 lt!42397 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))

(assert (=> d!23651 (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23651 (= (addCommutativeForDiffKeys!31 lt!42397 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) lt!42524)))

(declare-fun bs!3746 () Bool)

(assert (= bs!3746 d!23651))

(declare-fun m!95095 () Bool)

(assert (=> bs!3746 m!95095))

(declare-fun m!95097 () Bool)

(assert (=> bs!3746 m!95097))

(assert (=> bs!3746 m!95095))

(assert (=> bs!3746 m!94891))

(declare-fun m!95099 () Bool)

(assert (=> bs!3746 m!95099))

(declare-fun m!95101 () Bool)

(assert (=> bs!3746 m!95101))

(declare-fun m!95103 () Bool)

(assert (=> bs!3746 m!95103))

(assert (=> bs!3746 m!95101))

(assert (=> b!88683 d!23651))

(declare-fun d!23653 () Bool)

(declare-fun e!57878 () Bool)

(assert (=> d!23653 e!57878))

(declare-fun res!45466 () Bool)

(assert (=> d!23653 (=> (not res!45466) (not e!57878))))

(declare-fun lt!42544 () ListLongMap!1449)

(assert (=> d!23653 (= res!45466 (not (contains!754 lt!42544 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!57883 () ListLongMap!1449)

(assert (=> d!23653 (= lt!42544 e!57883)))

(declare-fun c!14716 () Bool)

(assert (=> d!23653 (= c!14716 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> d!23653 (validMask!0 (mask!6415 (v!2677 (underlying!298 thiss!992))))))

(assert (=> d!23653 (= (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))) lt!42544)))

(declare-fun b!88864 () Bool)

(declare-fun e!57879 () Bool)

(declare-fun e!57881 () Bool)

(assert (=> b!88864 (= e!57879 e!57881)))

(assert (=> b!88864 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun res!45469 () Bool)

(assert (=> b!88864 (= res!45469 (contains!754 lt!42544 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88864 (=> (not res!45469) (not e!57881))))

(declare-fun bm!8522 () Bool)

(declare-fun call!8525 () ListLongMap!1449)

(assert (=> bm!8522 (= call!8525 (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun b!88865 () Bool)

(declare-fun e!57882 () ListLongMap!1449)

(assert (=> b!88865 (= e!57883 e!57882)))

(declare-fun c!14715 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!88865 (= c!14715 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!57884 () Bool)

(declare-fun b!88866 () Bool)

(assert (=> b!88866 (= e!57884 (= lt!42544 (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun b!88867 () Bool)

(assert (=> b!88867 (= e!57882 call!8525)))

(declare-fun b!88868 () Bool)

(declare-fun isEmpty!347 (ListLongMap!1449) Bool)

(assert (=> b!88868 (= e!57884 (isEmpty!347 lt!42544))))

(declare-fun b!88869 () Bool)

(assert (=> b!88869 (= e!57879 e!57884)))

(declare-fun c!14718 () Bool)

(assert (=> b!88869 (= c!14718 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun b!88870 () Bool)

(declare-fun lt!42542 () Unit!2620)

(declare-fun lt!42545 () Unit!2620)

(assert (=> b!88870 (= lt!42542 lt!42545)))

(declare-fun lt!42539 () (_ BitVec 64))

(declare-fun lt!42541 () V!3041)

(declare-fun lt!42543 () ListLongMap!1449)

(declare-fun lt!42540 () (_ BitVec 64))

(assert (=> b!88870 (not (contains!754 (+!111 lt!42543 (tuple2!2201 lt!42539 lt!42541)) lt!42540))))

(declare-fun addStillNotContains!35 (ListLongMap!1449 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2620)

(assert (=> b!88870 (= lt!42545 (addStillNotContains!35 lt!42543 lt!42539 lt!42541 lt!42540))))

(assert (=> b!88870 (= lt!42540 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!88870 (= lt!42541 (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!88870 (= lt!42539 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!88870 (= lt!42543 call!8525)))

(assert (=> b!88870 (= e!57882 (+!111 call!8525 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!88871 () Bool)

(assert (=> b!88871 (= e!57878 e!57879)))

(declare-fun c!14717 () Bool)

(declare-fun e!57880 () Bool)

(assert (=> b!88871 (= c!14717 e!57880)))

(declare-fun res!45467 () Bool)

(assert (=> b!88871 (=> (not res!45467) (not e!57880))))

(assert (=> b!88871 (= res!45467 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun b!88872 () Bool)

(assert (=> b!88872 (= e!57880 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88872 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!88873 () Bool)

(assert (=> b!88873 (= e!57883 (ListLongMap!1450 Nil!1514))))

(declare-fun b!88874 () Bool)

(assert (=> b!88874 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> b!88874 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2169 (_values!2354 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun apply!84 (ListLongMap!1449 (_ BitVec 64)) V!3041)

(assert (=> b!88874 (= e!57881 (= (apply!84 lt!42544 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!88875 () Bool)

(declare-fun res!45468 () Bool)

(assert (=> b!88875 (=> (not res!45468) (not e!57878))))

(assert (=> b!88875 (= res!45468 (not (contains!754 lt!42544 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23653 c!14716) b!88873))

(assert (= (and d!23653 (not c!14716)) b!88865))

(assert (= (and b!88865 c!14715) b!88870))

(assert (= (and b!88865 (not c!14715)) b!88867))

(assert (= (or b!88870 b!88867) bm!8522))

(assert (= (and d!23653 res!45466) b!88875))

(assert (= (and b!88875 res!45468) b!88871))

(assert (= (and b!88871 res!45467) b!88872))

(assert (= (and b!88871 c!14717) b!88864))

(assert (= (and b!88871 (not c!14717)) b!88869))

(assert (= (and b!88864 res!45469) b!88874))

(assert (= (and b!88869 c!14718) b!88866))

(assert (= (and b!88869 (not c!14718)) b!88868))

(declare-fun b_lambda!3935 () Bool)

(assert (=> (not b_lambda!3935) (not b!88870)))

(assert (=> b!88870 t!5263))

(declare-fun b_and!5349 () Bool)

(assert (= b_and!5329 (and (=> t!5263 result!2955) b_and!5349)))

(assert (=> b!88870 t!5265))

(declare-fun b_and!5351 () Bool)

(assert (= b_and!5331 (and (=> t!5265 result!2959) b_and!5351)))

(declare-fun b_lambda!3937 () Bool)

(assert (=> (not b_lambda!3937) (not b!88874)))

(assert (=> b!88874 t!5263))

(declare-fun b_and!5353 () Bool)

(assert (= b_and!5349 (and (=> t!5263 result!2955) b_and!5353)))

(assert (=> b!88874 t!5265))

(declare-fun b_and!5355 () Bool)

(assert (= b_and!5351 (and (=> t!5265 result!2959) b_and!5355)))

(declare-fun m!95105 () Bool)

(assert (=> b!88866 m!95105))

(declare-fun m!95107 () Bool)

(assert (=> b!88872 m!95107))

(assert (=> b!88872 m!95107))

(declare-fun m!95109 () Bool)

(assert (=> b!88872 m!95109))

(assert (=> b!88865 m!95107))

(assert (=> b!88865 m!95107))

(assert (=> b!88865 m!95109))

(declare-fun m!95111 () Bool)

(assert (=> b!88870 m!95111))

(declare-fun m!95113 () Bool)

(assert (=> b!88870 m!95113))

(declare-fun m!95115 () Bool)

(assert (=> b!88870 m!95115))

(declare-fun m!95117 () Bool)

(assert (=> b!88870 m!95117))

(assert (=> b!88870 m!95111))

(assert (=> b!88870 m!94941))

(declare-fun m!95119 () Bool)

(assert (=> b!88870 m!95119))

(declare-fun m!95121 () Bool)

(assert (=> b!88870 m!95121))

(assert (=> b!88870 m!94941))

(assert (=> b!88870 m!95115))

(assert (=> b!88870 m!95107))

(assert (=> b!88874 m!95111))

(assert (=> b!88874 m!94941))

(assert (=> b!88874 m!95107))

(assert (=> b!88874 m!95111))

(assert (=> b!88874 m!94941))

(assert (=> b!88874 m!95119))

(assert (=> b!88874 m!95107))

(declare-fun m!95123 () Bool)

(assert (=> b!88874 m!95123))

(declare-fun m!95125 () Bool)

(assert (=> d!23653 m!95125))

(assert (=> d!23653 m!94911))

(assert (=> b!88864 m!95107))

(assert (=> b!88864 m!95107))

(declare-fun m!95127 () Bool)

(assert (=> b!88864 m!95127))

(declare-fun m!95129 () Bool)

(assert (=> b!88875 m!95129))

(declare-fun m!95131 () Bool)

(assert (=> b!88868 m!95131))

(assert (=> bm!8522 m!95105))

(assert (=> b!88683 d!23653))

(declare-fun d!23655 () Bool)

(declare-fun e!57887 () Bool)

(assert (=> d!23655 e!57887))

(declare-fun res!45474 () Bool)

(assert (=> d!23655 (=> (not res!45474) (not e!57887))))

(declare-fun lt!42556 () ListLongMap!1449)

(assert (=> d!23655 (= res!45474 (contains!754 lt!42556 (_1!1111 lt!42406)))))

(declare-fun lt!42555 () List!1517)

(assert (=> d!23655 (= lt!42556 (ListLongMap!1450 lt!42555))))

(declare-fun lt!42557 () Unit!2620)

(declare-fun lt!42554 () Unit!2620)

(assert (=> d!23655 (= lt!42557 lt!42554)))

(declare-datatypes ((Option!149 0))(
  ( (Some!148 (v!2682 V!3041)) (None!147) )
))
(declare-fun getValueByKey!143 (List!1517 (_ BitVec 64)) Option!149)

(assert (=> d!23655 (= (getValueByKey!143 lt!42555 (_1!1111 lt!42406)) (Some!148 (_2!1111 lt!42406)))))

(declare-fun lemmaContainsTupThenGetReturnValue!60 (List!1517 (_ BitVec 64) V!3041) Unit!2620)

(assert (=> d!23655 (= lt!42554 (lemmaContainsTupThenGetReturnValue!60 lt!42555 (_1!1111 lt!42406) (_2!1111 lt!42406)))))

(declare-fun insertStrictlySorted!63 (List!1517 (_ BitVec 64) V!3041) List!1517)

(assert (=> d!23655 (= lt!42555 (insertStrictlySorted!63 (toList!740 lt!42413) (_1!1111 lt!42406) (_2!1111 lt!42406)))))

(assert (=> d!23655 (= (+!111 lt!42413 lt!42406) lt!42556)))

(declare-fun b!88880 () Bool)

(declare-fun res!45475 () Bool)

(assert (=> b!88880 (=> (not res!45475) (not e!57887))))

(assert (=> b!88880 (= res!45475 (= (getValueByKey!143 (toList!740 lt!42556) (_1!1111 lt!42406)) (Some!148 (_2!1111 lt!42406))))))

(declare-fun b!88881 () Bool)

(declare-fun contains!755 (List!1517 tuple2!2200) Bool)

(assert (=> b!88881 (= e!57887 (contains!755 (toList!740 lt!42556) lt!42406))))

(assert (= (and d!23655 res!45474) b!88880))

(assert (= (and b!88880 res!45475) b!88881))

(declare-fun m!95133 () Bool)

(assert (=> d!23655 m!95133))

(declare-fun m!95135 () Bool)

(assert (=> d!23655 m!95135))

(declare-fun m!95137 () Bool)

(assert (=> d!23655 m!95137))

(declare-fun m!95139 () Bool)

(assert (=> d!23655 m!95139))

(declare-fun m!95141 () Bool)

(assert (=> b!88880 m!95141))

(declare-fun m!95143 () Bool)

(assert (=> b!88881 m!95143))

(assert (=> b!88683 d!23655))

(declare-fun d!23657 () Bool)

(declare-fun e!57888 () Bool)

(assert (=> d!23657 e!57888))

(declare-fun res!45476 () Bool)

(assert (=> d!23657 (=> (not res!45476) (not e!57888))))

(declare-fun lt!42560 () ListLongMap!1449)

(assert (=> d!23657 (= res!45476 (contains!754 lt!42560 (_1!1111 lt!42408)))))

(declare-fun lt!42559 () List!1517)

(assert (=> d!23657 (= lt!42560 (ListLongMap!1450 lt!42559))))

(declare-fun lt!42561 () Unit!2620)

(declare-fun lt!42558 () Unit!2620)

(assert (=> d!23657 (= lt!42561 lt!42558)))

(assert (=> d!23657 (= (getValueByKey!143 lt!42559 (_1!1111 lt!42408)) (Some!148 (_2!1111 lt!42408)))))

(assert (=> d!23657 (= lt!42558 (lemmaContainsTupThenGetReturnValue!60 lt!42559 (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(assert (=> d!23657 (= lt!42559 (insertStrictlySorted!63 (toList!740 lt!42413) (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(assert (=> d!23657 (= (+!111 lt!42413 lt!42408) lt!42560)))

(declare-fun b!88882 () Bool)

(declare-fun res!45477 () Bool)

(assert (=> b!88882 (=> (not res!45477) (not e!57888))))

(assert (=> b!88882 (= res!45477 (= (getValueByKey!143 (toList!740 lt!42560) (_1!1111 lt!42408)) (Some!148 (_2!1111 lt!42408))))))

(declare-fun b!88883 () Bool)

(assert (=> b!88883 (= e!57888 (contains!755 (toList!740 lt!42560) lt!42408))))

(assert (= (and d!23657 res!45476) b!88882))

(assert (= (and b!88882 res!45477) b!88883))

(declare-fun m!95145 () Bool)

(assert (=> d!23657 m!95145))

(declare-fun m!95147 () Bool)

(assert (=> d!23657 m!95147))

(declare-fun m!95149 () Bool)

(assert (=> d!23657 m!95149))

(declare-fun m!95151 () Bool)

(assert (=> d!23657 m!95151))

(declare-fun m!95153 () Bool)

(assert (=> b!88882 m!95153))

(declare-fun m!95155 () Bool)

(assert (=> b!88883 m!95155))

(assert (=> b!88683 d!23657))

(declare-fun d!23659 () Bool)

(declare-fun e!57889 () Bool)

(assert (=> d!23659 e!57889))

(declare-fun res!45478 () Bool)

(assert (=> d!23659 (=> (not res!45478) (not e!57889))))

(declare-fun lt!42564 () ListLongMap!1449)

(assert (=> d!23659 (= res!45478 (contains!754 lt!42564 (_1!1111 lt!42406)))))

(declare-fun lt!42563 () List!1517)

(assert (=> d!23659 (= lt!42564 (ListLongMap!1450 lt!42563))))

(declare-fun lt!42565 () Unit!2620)

(declare-fun lt!42562 () Unit!2620)

(assert (=> d!23659 (= lt!42565 lt!42562)))

(assert (=> d!23659 (= (getValueByKey!143 lt!42563 (_1!1111 lt!42406)) (Some!148 (_2!1111 lt!42406)))))

(assert (=> d!23659 (= lt!42562 (lemmaContainsTupThenGetReturnValue!60 lt!42563 (_1!1111 lt!42406) (_2!1111 lt!42406)))))

(assert (=> d!23659 (= lt!42563 (insertStrictlySorted!63 (toList!740 lt!42402) (_1!1111 lt!42406) (_2!1111 lt!42406)))))

(assert (=> d!23659 (= (+!111 lt!42402 lt!42406) lt!42564)))

(declare-fun b!88884 () Bool)

(declare-fun res!45479 () Bool)

(assert (=> b!88884 (=> (not res!45479) (not e!57889))))

(assert (=> b!88884 (= res!45479 (= (getValueByKey!143 (toList!740 lt!42564) (_1!1111 lt!42406)) (Some!148 (_2!1111 lt!42406))))))

(declare-fun b!88885 () Bool)

(assert (=> b!88885 (= e!57889 (contains!755 (toList!740 lt!42564) lt!42406))))

(assert (= (and d!23659 res!45478) b!88884))

(assert (= (and b!88884 res!45479) b!88885))

(declare-fun m!95157 () Bool)

(assert (=> d!23659 m!95157))

(declare-fun m!95159 () Bool)

(assert (=> d!23659 m!95159))

(declare-fun m!95161 () Bool)

(assert (=> d!23659 m!95161))

(declare-fun m!95163 () Bool)

(assert (=> d!23659 m!95163))

(declare-fun m!95165 () Bool)

(assert (=> b!88884 m!95165))

(declare-fun m!95167 () Bool)

(assert (=> b!88885 m!95167))

(assert (=> b!88683 d!23659))

(declare-fun d!23661 () Bool)

(declare-fun e!57890 () Bool)

(assert (=> d!23661 e!57890))

(declare-fun res!45480 () Bool)

(assert (=> d!23661 (=> (not res!45480) (not e!57890))))

(declare-fun lt!42568 () ListLongMap!1449)

(assert (=> d!23661 (= res!45480 (contains!754 lt!42568 (_1!1111 lt!42410)))))

(declare-fun lt!42567 () List!1517)

(assert (=> d!23661 (= lt!42568 (ListLongMap!1450 lt!42567))))

(declare-fun lt!42569 () Unit!2620)

(declare-fun lt!42566 () Unit!2620)

(assert (=> d!23661 (= lt!42569 lt!42566)))

(assert (=> d!23661 (= (getValueByKey!143 lt!42567 (_1!1111 lt!42410)) (Some!148 (_2!1111 lt!42410)))))

(assert (=> d!23661 (= lt!42566 (lemmaContainsTupThenGetReturnValue!60 lt!42567 (_1!1111 lt!42410) (_2!1111 lt!42410)))))

(assert (=> d!23661 (= lt!42567 (insertStrictlySorted!63 (toList!740 lt!42401) (_1!1111 lt!42410) (_2!1111 lt!42410)))))

(assert (=> d!23661 (= (+!111 lt!42401 lt!42410) lt!42568)))

(declare-fun b!88886 () Bool)

(declare-fun res!45481 () Bool)

(assert (=> b!88886 (=> (not res!45481) (not e!57890))))

(assert (=> b!88886 (= res!45481 (= (getValueByKey!143 (toList!740 lt!42568) (_1!1111 lt!42410)) (Some!148 (_2!1111 lt!42410))))))

(declare-fun b!88887 () Bool)

(assert (=> b!88887 (= e!57890 (contains!755 (toList!740 lt!42568) lt!42410))))

(assert (= (and d!23661 res!45480) b!88886))

(assert (= (and b!88886 res!45481) b!88887))

(declare-fun m!95169 () Bool)

(assert (=> d!23661 m!95169))

(declare-fun m!95171 () Bool)

(assert (=> d!23661 m!95171))

(declare-fun m!95173 () Bool)

(assert (=> d!23661 m!95173))

(declare-fun m!95175 () Bool)

(assert (=> d!23661 m!95175))

(declare-fun m!95177 () Bool)

(assert (=> b!88886 m!95177))

(declare-fun m!95179 () Bool)

(assert (=> b!88887 m!95179))

(assert (=> b!88683 d!23661))

(declare-fun d!23663 () Bool)

(assert (=> d!23663 (= (validMask!0 (mask!6415 (v!2677 (underlying!298 thiss!992)))) (and (or (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000001111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000011111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000001111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000011111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000001111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000011111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000001111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000011111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000000111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000001111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000011111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000000111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000001111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000011111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000000111111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000001111111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000011111111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000000111111111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000001111111111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000011111111111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00000111111111111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00001111111111111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00011111111111111111111111111111) (= (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6415 (v!2677 (underlying!298 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!88683 d!23663))

(declare-fun d!23665 () Bool)

(declare-fun e!57891 () Bool)

(assert (=> d!23665 e!57891))

(declare-fun res!45482 () Bool)

(assert (=> d!23665 (=> (not res!45482) (not e!57891))))

(declare-fun lt!42572 () ListLongMap!1449)

(assert (=> d!23665 (= res!45482 (contains!754 lt!42572 (_1!1111 lt!42408)))))

(declare-fun lt!42571 () List!1517)

(assert (=> d!23665 (= lt!42572 (ListLongMap!1450 lt!42571))))

(declare-fun lt!42573 () Unit!2620)

(declare-fun lt!42570 () Unit!2620)

(assert (=> d!23665 (= lt!42573 lt!42570)))

(assert (=> d!23665 (= (getValueByKey!143 lt!42571 (_1!1111 lt!42408)) (Some!148 (_2!1111 lt!42408)))))

(assert (=> d!23665 (= lt!42570 (lemmaContainsTupThenGetReturnValue!60 lt!42571 (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(assert (=> d!23665 (= lt!42571 (insertStrictlySorted!63 (toList!740 lt!42397) (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(assert (=> d!23665 (= (+!111 lt!42397 lt!42408) lt!42572)))

(declare-fun b!88888 () Bool)

(declare-fun res!45483 () Bool)

(assert (=> b!88888 (=> (not res!45483) (not e!57891))))

(assert (=> b!88888 (= res!45483 (= (getValueByKey!143 (toList!740 lt!42572) (_1!1111 lt!42408)) (Some!148 (_2!1111 lt!42408))))))

(declare-fun b!88889 () Bool)

(assert (=> b!88889 (= e!57891 (contains!755 (toList!740 lt!42572) lt!42408))))

(assert (= (and d!23665 res!45482) b!88888))

(assert (= (and b!88888 res!45483) b!88889))

(declare-fun m!95181 () Bool)

(assert (=> d!23665 m!95181))

(declare-fun m!95183 () Bool)

(assert (=> d!23665 m!95183))

(declare-fun m!95185 () Bool)

(assert (=> d!23665 m!95185))

(declare-fun m!95187 () Bool)

(assert (=> d!23665 m!95187))

(declare-fun m!95189 () Bool)

(assert (=> b!88888 m!95189))

(declare-fun m!95191 () Bool)

(assert (=> b!88889 m!95191))

(assert (=> b!88683 d!23665))

(declare-fun d!23667 () Bool)

(assert (=> d!23667 (= (+!111 (+!111 lt!42413 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (+!111 (+!111 lt!42413 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))

(declare-fun lt!42574 () Unit!2620)

(assert (=> d!23667 (= lt!42574 (choose!533 lt!42413 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))

(assert (=> d!23667 (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23667 (= (addCommutativeForDiffKeys!31 lt!42413 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))) lt!42574)))

(declare-fun bs!3747 () Bool)

(assert (= bs!3747 d!23667))

(declare-fun m!95193 () Bool)

(assert (=> bs!3747 m!95193))

(declare-fun m!95195 () Bool)

(assert (=> bs!3747 m!95195))

(assert (=> bs!3747 m!95193))

(assert (=> bs!3747 m!94891))

(declare-fun m!95197 () Bool)

(assert (=> bs!3747 m!95197))

(declare-fun m!95199 () Bool)

(assert (=> bs!3747 m!95199))

(declare-fun m!95201 () Bool)

(assert (=> bs!3747 m!95201))

(assert (=> bs!3747 m!95199))

(assert (=> b!88683 d!23667))

(declare-fun d!23669 () Bool)

(declare-fun e!57892 () Bool)

(assert (=> d!23669 e!57892))

(declare-fun res!45484 () Bool)

(assert (=> d!23669 (=> (not res!45484) (not e!57892))))

(declare-fun lt!42577 () ListLongMap!1449)

(assert (=> d!23669 (= res!45484 (contains!754 lt!42577 (_1!1111 lt!42410)))))

(declare-fun lt!42576 () List!1517)

(assert (=> d!23669 (= lt!42577 (ListLongMap!1450 lt!42576))))

(declare-fun lt!42578 () Unit!2620)

(declare-fun lt!42575 () Unit!2620)

(assert (=> d!23669 (= lt!42578 lt!42575)))

(assert (=> d!23669 (= (getValueByKey!143 lt!42576 (_1!1111 lt!42410)) (Some!148 (_2!1111 lt!42410)))))

(assert (=> d!23669 (= lt!42575 (lemmaContainsTupThenGetReturnValue!60 lt!42576 (_1!1111 lt!42410) (_2!1111 lt!42410)))))

(assert (=> d!23669 (= lt!42576 (insertStrictlySorted!63 (toList!740 lt!42397) (_1!1111 lt!42410) (_2!1111 lt!42410)))))

(assert (=> d!23669 (= (+!111 lt!42397 lt!42410) lt!42577)))

(declare-fun b!88890 () Bool)

(declare-fun res!45485 () Bool)

(assert (=> b!88890 (=> (not res!45485) (not e!57892))))

(assert (=> b!88890 (= res!45485 (= (getValueByKey!143 (toList!740 lt!42577) (_1!1111 lt!42410)) (Some!148 (_2!1111 lt!42410))))))

(declare-fun b!88891 () Bool)

(assert (=> b!88891 (= e!57892 (contains!755 (toList!740 lt!42577) lt!42410))))

(assert (= (and d!23669 res!45484) b!88890))

(assert (= (and b!88890 res!45485) b!88891))

(declare-fun m!95203 () Bool)

(assert (=> d!23669 m!95203))

(declare-fun m!95205 () Bool)

(assert (=> d!23669 m!95205))

(declare-fun m!95207 () Bool)

(assert (=> d!23669 m!95207))

(declare-fun m!95209 () Bool)

(assert (=> d!23669 m!95209))

(declare-fun m!95211 () Bool)

(assert (=> b!88890 m!95211))

(declare-fun m!95213 () Bool)

(assert (=> b!88891 m!95213))

(assert (=> b!88683 d!23669))

(declare-fun d!23671 () Bool)

(declare-fun e!57893 () Bool)

(assert (=> d!23671 e!57893))

(declare-fun res!45486 () Bool)

(assert (=> d!23671 (=> (not res!45486) (not e!57893))))

(declare-fun lt!42581 () ListLongMap!1449)

(assert (=> d!23671 (= res!45486 (contains!754 lt!42581 (_1!1111 lt!42408)))))

(declare-fun lt!42580 () List!1517)

(assert (=> d!23671 (= lt!42581 (ListLongMap!1450 lt!42580))))

(declare-fun lt!42582 () Unit!2620)

(declare-fun lt!42579 () Unit!2620)

(assert (=> d!23671 (= lt!42582 lt!42579)))

(assert (=> d!23671 (= (getValueByKey!143 lt!42580 (_1!1111 lt!42408)) (Some!148 (_2!1111 lt!42408)))))

(assert (=> d!23671 (= lt!42579 (lemmaContainsTupThenGetReturnValue!60 lt!42580 (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(assert (=> d!23671 (= lt!42580 (insertStrictlySorted!63 (toList!740 (+!111 lt!42413 lt!42406)) (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(assert (=> d!23671 (= (+!111 (+!111 lt!42413 lt!42406) lt!42408) lt!42581)))

(declare-fun b!88892 () Bool)

(declare-fun res!45487 () Bool)

(assert (=> b!88892 (=> (not res!45487) (not e!57893))))

(assert (=> b!88892 (= res!45487 (= (getValueByKey!143 (toList!740 lt!42581) (_1!1111 lt!42408)) (Some!148 (_2!1111 lt!42408))))))

(declare-fun b!88893 () Bool)

(assert (=> b!88893 (= e!57893 (contains!755 (toList!740 lt!42581) lt!42408))))

(assert (= (and d!23671 res!45486) b!88892))

(assert (= (and b!88892 res!45487) b!88893))

(declare-fun m!95215 () Bool)

(assert (=> d!23671 m!95215))

(declare-fun m!95217 () Bool)

(assert (=> d!23671 m!95217))

(declare-fun m!95219 () Bool)

(assert (=> d!23671 m!95219))

(declare-fun m!95221 () Bool)

(assert (=> d!23671 m!95221))

(declare-fun m!95223 () Bool)

(assert (=> b!88892 m!95223))

(declare-fun m!95225 () Bool)

(assert (=> b!88893 m!95225))

(assert (=> b!88683 d!23671))

(declare-fun d!23673 () Bool)

(assert (=> d!23673 (= (array_inv!1185 (_keys!4049 newMap!16)) (bvsge (size!2168 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88690 d!23673))

(declare-fun d!23675 () Bool)

(assert (=> d!23675 (= (array_inv!1186 (_values!2354 newMap!16)) (bvsge (size!2169 (_values!2354 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88690 d!23675))

(declare-fun d!23677 () Bool)

(assert (=> d!23677 (= (array_inv!1185 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvsge (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!88685 d!23677))

(declare-fun d!23679 () Bool)

(assert (=> d!23679 (= (array_inv!1186 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvsge (size!2169 (_values!2354 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!88685 d!23679))

(declare-fun b!88902 () Bool)

(declare-fun e!57900 () Bool)

(declare-fun e!57901 () Bool)

(assert (=> b!88902 (= e!57900 e!57901)))

(declare-fun c!14721 () Bool)

(assert (=> b!88902 (= c!14721 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!8525 () Bool)

(declare-fun call!8528 () Bool)

(assert (=> bm!8525 (= call!8528 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4049 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun d!23681 () Bool)

(declare-fun res!45493 () Bool)

(assert (=> d!23681 (=> res!45493 e!57900)))

(assert (=> d!23681 (= res!45493 (bvsge #b00000000000000000000000000000000 (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> d!23681 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992)))) e!57900)))

(declare-fun b!88903 () Bool)

(declare-fun e!57902 () Bool)

(assert (=> b!88903 (= e!57901 e!57902)))

(declare-fun lt!42589 () (_ BitVec 64))

(assert (=> b!88903 (= lt!42589 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!42591 () Unit!2620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4039 (_ BitVec 64) (_ BitVec 32)) Unit!2620)

(assert (=> b!88903 (= lt!42591 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) lt!42589 #b00000000000000000000000000000000))))

(assert (=> b!88903 (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) lt!42589 #b00000000000000000000000000000000)))

(declare-fun lt!42590 () Unit!2620)

(assert (=> b!88903 (= lt!42590 lt!42591)))

(declare-fun res!45492 () Bool)

(declare-datatypes ((SeekEntryResult!239 0))(
  ( (MissingZero!239 (index!3095 (_ BitVec 32))) (Found!239 (index!3096 (_ BitVec 32))) (Intermediate!239 (undefined!1051 Bool) (index!3097 (_ BitVec 32)) (x!12225 (_ BitVec 32))) (Undefined!239) (MissingVacant!239 (index!3098 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4039 (_ BitVec 32)) SeekEntryResult!239)

(assert (=> b!88903 (= res!45492 (= (seekEntryOrOpen!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) (_keys!4049 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992)))) (Found!239 #b00000000000000000000000000000000)))))

(assert (=> b!88903 (=> (not res!45492) (not e!57902))))

(declare-fun b!88904 () Bool)

(assert (=> b!88904 (= e!57901 call!8528)))

(declare-fun b!88905 () Bool)

(assert (=> b!88905 (= e!57902 call!8528)))

(assert (= (and d!23681 (not res!45493)) b!88902))

(assert (= (and b!88902 c!14721) b!88903))

(assert (= (and b!88902 (not c!14721)) b!88904))

(assert (= (and b!88903 res!45492) b!88905))

(assert (= (or b!88905 b!88904) bm!8525))

(declare-fun m!95227 () Bool)

(assert (=> b!88902 m!95227))

(assert (=> b!88902 m!95227))

(declare-fun m!95229 () Bool)

(assert (=> b!88902 m!95229))

(declare-fun m!95231 () Bool)

(assert (=> bm!8525 m!95231))

(assert (=> b!88903 m!95227))

(declare-fun m!95233 () Bool)

(assert (=> b!88903 m!95233))

(declare-fun m!95235 () Bool)

(assert (=> b!88903 m!95235))

(assert (=> b!88903 m!95227))

(declare-fun m!95237 () Bool)

(assert (=> b!88903 m!95237))

(assert (=> b!88684 d!23681))

(declare-fun d!23683 () Bool)

(declare-fun c!14724 () Bool)

(assert (=> d!23683 (= c!14724 ((_ is ValueCellFull!929) (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun e!57905 () V!3041)

(assert (=> d!23683 (= (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!57905)))

(declare-fun b!88910 () Bool)

(declare-fun get!1218 (ValueCell!929 V!3041) V!3041)

(assert (=> b!88910 (= e!57905 (get!1218 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88911 () Bool)

(declare-fun get!1219 (ValueCell!929 V!3041) V!3041)

(assert (=> b!88911 (= e!57905 (get!1219 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23683 c!14724) b!88910))

(assert (= (and d!23683 (not c!14724)) b!88911))

(assert (=> b!88910 m!94939))

(assert (=> b!88910 m!94941))

(declare-fun m!95239 () Bool)

(assert (=> b!88910 m!95239))

(assert (=> b!88911 m!94939))

(assert (=> b!88911 m!94941))

(declare-fun m!95241 () Bool)

(assert (=> b!88911 m!95241))

(assert (=> b!88693 d!23683))

(declare-fun d!23685 () Bool)

(assert (=> d!23685 (not (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42594 () Unit!2620)

(declare-fun choose!68 (array!4039 (_ BitVec 32) (_ BitVec 64) List!1516) Unit!2620)

(assert (=> d!23685 (= lt!42594 (choose!68 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) Nil!1513)))))

(assert (=> d!23685 (bvslt (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23685 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) Nil!1513)) lt!42594)))

(declare-fun bs!3748 () Bool)

(assert (= bs!3748 d!23685))

(assert (=> bs!3748 m!94891))

(assert (=> bs!3748 m!94925))

(assert (=> bs!3748 m!94891))

(declare-fun m!95243 () Bool)

(assert (=> bs!3748 m!95243))

(assert (=> b!88696 d!23685))

(declare-fun d!23687 () Bool)

(assert (=> d!23687 (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) from!355 Nil!1513)))

(declare-fun lt!42597 () Unit!2620)

(declare-fun choose!39 (array!4039 (_ BitVec 32) (_ BitVec 32)) Unit!2620)

(assert (=> d!23687 (= lt!42597 (choose!39 (_keys!4049 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!23687 (bvslt (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23687 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000000 from!355) lt!42597)))

(declare-fun bs!3749 () Bool)

(assert (= bs!3749 d!23687))

(assert (=> bs!3749 m!94921))

(declare-fun m!95245 () Bool)

(assert (=> bs!3749 m!95245))

(assert (=> b!88696 d!23687))

(declare-fun d!23689 () Bool)

(declare-fun res!45498 () Bool)

(declare-fun e!57910 () Bool)

(assert (=> d!23689 (=> res!45498 e!57910)))

(assert (=> d!23689 (= res!45498 (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> d!23689 (= (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!57910)))

(declare-fun b!88916 () Bool)

(declare-fun e!57911 () Bool)

(assert (=> b!88916 (= e!57910 e!57911)))

(declare-fun res!45499 () Bool)

(assert (=> b!88916 (=> (not res!45499) (not e!57911))))

(assert (=> b!88916 (= res!45499 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun b!88917 () Bool)

(assert (=> b!88917 (= e!57911 (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!23689 (not res!45498)) b!88916))

(assert (= (and b!88916 res!45499) b!88917))

(assert (=> d!23689 m!95107))

(assert (=> b!88917 m!94891))

(declare-fun m!95247 () Bool)

(assert (=> b!88917 m!95247))

(assert (=> b!88696 d!23689))

(declare-fun d!23691 () Bool)

(declare-fun e!57914 () Bool)

(assert (=> d!23691 e!57914))

(declare-fun c!14727 () Bool)

(assert (=> d!23691 (= c!14727 (and (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!42600 () Unit!2620)

(declare-fun choose!534 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) (_ BitVec 32) Int) Unit!2620)

(assert (=> d!23691 (= lt!42600 (choose!534 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))))))

(assert (=> d!23691 (validMask!0 (mask!6415 (v!2677 (underlying!298 thiss!992))))))

(assert (=> d!23691 (= (lemmaListMapContainsThenArrayContainsFrom!63 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))) lt!42600)))

(declare-fun b!88922 () Bool)

(assert (=> b!88922 (= e!57914 (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!88923 () Bool)

(assert (=> b!88923 (= e!57914 (ite (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23691 c!14727) b!88922))

(assert (= (and d!23691 (not c!14727)) b!88923))

(assert (=> d!23691 m!94891))

(declare-fun m!95249 () Bool)

(assert (=> d!23691 m!95249))

(assert (=> d!23691 m!94911))

(assert (=> b!88922 m!94891))

(assert (=> b!88922 m!94925))

(assert (=> b!88696 d!23691))

(declare-fun b!88934 () Bool)

(declare-fun e!57925 () Bool)

(declare-fun e!57926 () Bool)

(assert (=> b!88934 (= e!57925 e!57926)))

(declare-fun res!45508 () Bool)

(assert (=> b!88934 (=> (not res!45508) (not e!57926))))

(declare-fun e!57924 () Bool)

(assert (=> b!88934 (= res!45508 (not e!57924))))

(declare-fun res!45507 () Bool)

(assert (=> b!88934 (=> (not res!45507) (not e!57924))))

(assert (=> b!88934 (= res!45507 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun b!88935 () Bool)

(declare-fun e!57923 () Bool)

(declare-fun call!8531 () Bool)

(assert (=> b!88935 (= e!57923 call!8531)))

(declare-fun b!88936 () Bool)

(declare-fun contains!756 (List!1516 (_ BitVec 64)) Bool)

(assert (=> b!88936 (= e!57924 (contains!756 Nil!1513 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun b!88937 () Bool)

(assert (=> b!88937 (= e!57923 call!8531)))

(declare-fun c!14730 () Bool)

(declare-fun bm!8528 () Bool)

(assert (=> bm!8528 (= call!8531 (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14730 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) Nil!1513) Nil!1513)))))

(declare-fun d!23693 () Bool)

(declare-fun res!45506 () Bool)

(assert (=> d!23693 (=> res!45506 e!57925)))

(assert (=> d!23693 (= res!45506 (bvsge from!355 (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> d!23693 (= (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) from!355 Nil!1513) e!57925)))

(declare-fun b!88938 () Bool)

(assert (=> b!88938 (= e!57926 e!57923)))

(assert (=> b!88938 (= c!14730 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (= (and d!23693 (not res!45506)) b!88934))

(assert (= (and b!88934 res!45507) b!88936))

(assert (= (and b!88934 res!45508) b!88938))

(assert (= (and b!88938 c!14730) b!88935))

(assert (= (and b!88938 (not c!14730)) b!88937))

(assert (= (or b!88935 b!88937) bm!8528))

(assert (=> b!88934 m!94891))

(assert (=> b!88934 m!94891))

(declare-fun m!95251 () Bool)

(assert (=> b!88934 m!95251))

(assert (=> b!88936 m!94891))

(assert (=> b!88936 m!94891))

(declare-fun m!95253 () Bool)

(assert (=> b!88936 m!95253))

(assert (=> bm!8528 m!94891))

(declare-fun m!95255 () Bool)

(assert (=> bm!8528 m!95255))

(assert (=> b!88938 m!94891))

(assert (=> b!88938 m!94891))

(assert (=> b!88938 m!95251))

(assert (=> b!88696 d!23693))

(declare-fun d!23695 () Bool)

(declare-fun res!45515 () Bool)

(declare-fun e!57929 () Bool)

(assert (=> d!23695 (=> (not res!45515) (not e!57929))))

(declare-fun simpleValid!60 (LongMapFixedSize!766) Bool)

(assert (=> d!23695 (= res!45515 (simpleValid!60 newMap!16))))

(assert (=> d!23695 (= (valid!343 newMap!16) e!57929)))

(declare-fun b!88945 () Bool)

(declare-fun res!45516 () Bool)

(assert (=> b!88945 (=> (not res!45516) (not e!57929))))

(declare-fun arrayCountValidKeys!0 (array!4039 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!88945 (= res!45516 (= (arrayCountValidKeys!0 (_keys!4049 newMap!16) #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))) (_size!432 newMap!16)))))

(declare-fun b!88946 () Bool)

(declare-fun res!45517 () Bool)

(assert (=> b!88946 (=> (not res!45517) (not e!57929))))

(assert (=> b!88946 (= res!45517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4049 newMap!16) (mask!6415 newMap!16)))))

(declare-fun b!88947 () Bool)

(assert (=> b!88947 (= e!57929 (arrayNoDuplicates!0 (_keys!4049 newMap!16) #b00000000000000000000000000000000 Nil!1513))))

(assert (= (and d!23695 res!45515) b!88945))

(assert (= (and b!88945 res!45516) b!88946))

(assert (= (and b!88946 res!45517) b!88947))

(declare-fun m!95257 () Bool)

(assert (=> d!23695 m!95257))

(declare-fun m!95259 () Bool)

(assert (=> b!88945 m!95259))

(declare-fun m!95261 () Bool)

(assert (=> b!88946 m!95261))

(declare-fun m!95263 () Bool)

(assert (=> b!88947 m!95263))

(assert (=> b!88686 d!23695))

(declare-fun d!23697 () Bool)

(declare-fun e!57934 () Bool)

(assert (=> d!23697 e!57934))

(declare-fun res!45520 () Bool)

(assert (=> d!23697 (=> res!45520 e!57934)))

(declare-fun lt!42610 () Bool)

(assert (=> d!23697 (= res!45520 (not lt!42610))))

(declare-fun lt!42611 () Bool)

(assert (=> d!23697 (= lt!42610 lt!42611)))

(declare-fun lt!42612 () Unit!2620)

(declare-fun e!57935 () Unit!2620)

(assert (=> d!23697 (= lt!42612 e!57935)))

(declare-fun c!14733 () Bool)

(assert (=> d!23697 (= c!14733 lt!42611)))

(declare-fun containsKey!146 (List!1517 (_ BitVec 64)) Bool)

(assert (=> d!23697 (= lt!42611 (containsKey!146 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> d!23697 (= (contains!754 lt!42409 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) lt!42610)))

(declare-fun b!88954 () Bool)

(declare-fun lt!42609 () Unit!2620)

(assert (=> b!88954 (= e!57935 lt!42609)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!94 (List!1517 (_ BitVec 64)) Unit!2620)

(assert (=> b!88954 (= lt!42609 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun isDefined!95 (Option!149) Bool)

(assert (=> b!88954 (isDefined!95 (getValueByKey!143 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun b!88955 () Bool)

(declare-fun Unit!2626 () Unit!2620)

(assert (=> b!88955 (= e!57935 Unit!2626)))

(declare-fun b!88956 () Bool)

(assert (=> b!88956 (= e!57934 (isDefined!95 (getValueByKey!143 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355))))))

(assert (= (and d!23697 c!14733) b!88954))

(assert (= (and d!23697 (not c!14733)) b!88955))

(assert (= (and d!23697 (not res!45520)) b!88956))

(assert (=> d!23697 m!94891))

(declare-fun m!95265 () Bool)

(assert (=> d!23697 m!95265))

(assert (=> b!88954 m!94891))

(declare-fun m!95267 () Bool)

(assert (=> b!88954 m!95267))

(assert (=> b!88954 m!94891))

(declare-fun m!95269 () Bool)

(assert (=> b!88954 m!95269))

(assert (=> b!88954 m!95269))

(declare-fun m!95271 () Bool)

(assert (=> b!88954 m!95271))

(assert (=> b!88956 m!94891))

(assert (=> b!88956 m!95269))

(assert (=> b!88956 m!95269))

(assert (=> b!88956 m!95271))

(assert (=> b!88695 d!23697))

(declare-fun b!89037 () Bool)

(declare-fun lt!42689 () Unit!2620)

(declare-fun lt!42680 () Unit!2620)

(assert (=> b!89037 (= lt!42689 lt!42680)))

(declare-fun call!8599 () Bool)

(assert (=> b!89037 call!8599))

(declare-fun lt!42678 () SeekEntryResult!239)

(declare-fun lt!42672 () array!4041)

(declare-fun lemmaValidKeyInArrayIsInListMap!93 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) Int) Unit!2620)

(assert (=> b!89037 (= lt!42680 (lemmaValidKeyInArrayIsInListMap!93 (_keys!4049 newMap!16) lt!42672 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3096 lt!42678) (defaultEntry!2371 newMap!16)))))

(assert (=> b!89037 (= lt!42672 (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16))))))

(declare-fun lt!42691 () Unit!2620)

(declare-fun lt!42673 () Unit!2620)

(assert (=> b!89037 (= lt!42691 lt!42673)))

(declare-fun call!8590 () ListLongMap!1449)

(declare-fun call!8585 () ListLongMap!1449)

(assert (=> b!89037 (= call!8590 call!8585)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!33 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) (_ BitVec 64) V!3041 Int) Unit!2620)

(assert (=> b!89037 (= lt!42673 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3096 lt!42678) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42690 () Unit!2620)

(declare-fun e!57979 () Unit!2620)

(assert (=> b!89037 (= lt!42690 e!57979)))

(declare-fun c!14764 () Bool)

(declare-fun call!8581 () ListLongMap!1449)

(assert (=> b!89037 (= c!14764 (contains!754 call!8581 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun e!57998 () tuple2!2202)

(assert (=> b!89037 (= e!57998 (tuple2!2203 true (LongMapFixedSize!767 (defaultEntry!2371 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (_size!432 newMap!16) (_keys!4049 newMap!16) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16))) (_vacant!432 newMap!16))))))

(declare-fun b!89038 () Bool)

(declare-fun e!57990 () Bool)

(declare-fun e!57996 () Bool)

(assert (=> b!89038 (= e!57990 e!57996)))

(declare-fun res!45559 () Bool)

(declare-fun call!8584 () Bool)

(assert (=> b!89038 (= res!45559 call!8584)))

(assert (=> b!89038 (=> (not res!45559) (not e!57996))))

(declare-fun bm!8577 () Bool)

(declare-fun call!8595 () Bool)

(assert (=> bm!8577 (= call!8584 call!8595)))

(declare-fun lt!42682 () SeekEntryResult!239)

(declare-fun e!57980 () Bool)

(declare-fun b!89039 () Bool)

(assert (=> b!89039 (= e!57980 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!42682)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun bm!8578 () Bool)

(declare-fun call!8588 () tuple2!2202)

(declare-fun c!14766 () Bool)

(declare-fun updateHelperNewKey!33 (LongMapFixedSize!766 (_ BitVec 64) V!3041 (_ BitVec 32)) tuple2!2202)

(assert (=> bm!8578 (= call!8588 (updateHelperNewKey!33 newMap!16 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678))))))

(declare-fun bm!8579 () Bool)

(declare-fun call!8594 () SeekEntryResult!239)

(assert (=> bm!8579 (= call!8594 (seekEntryOrOpen!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (_keys!4049 newMap!16) (mask!6415 newMap!16)))))

(declare-fun bm!8580 () Bool)

(declare-fun call!8583 () SeekEntryResult!239)

(assert (=> bm!8580 (= call!8583 call!8594)))

(declare-fun b!89040 () Bool)

(declare-fun e!57982 () ListLongMap!1449)

(assert (=> b!89040 (= e!57982 (getCurrentListMap!433 (_keys!4049 newMap!16) lt!42672 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun b!89041 () Bool)

(declare-fun e!57995 () Bool)

(declare-fun e!57994 () Bool)

(assert (=> b!89041 (= e!57995 e!57994)))

(declare-fun res!45554 () Bool)

(declare-fun call!8597 () ListLongMap!1449)

(assert (=> b!89041 (= res!45554 (contains!754 call!8597 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> b!89041 (=> (not res!45554) (not e!57994))))

(declare-fun b!89042 () Bool)

(declare-fun e!57988 () Unit!2620)

(declare-fun Unit!2627 () Unit!2620)

(assert (=> b!89042 (= e!57988 Unit!2627)))

(declare-fun lt!42687 () Unit!2620)

(declare-fun call!8589 () Unit!2620)

(assert (=> b!89042 (= lt!42687 call!8589)))

(declare-fun lt!42669 () SeekEntryResult!239)

(assert (=> b!89042 (= lt!42669 call!8583)))

(declare-fun res!45551 () Bool)

(assert (=> b!89042 (= res!45551 ((_ is Found!239) lt!42669))))

(declare-fun e!57992 () Bool)

(assert (=> b!89042 (=> (not res!45551) (not e!57992))))

(assert (=> b!89042 e!57992))

(declare-fun lt!42679 () Unit!2620)

(assert (=> b!89042 (= lt!42679 lt!42687)))

(assert (=> b!89042 false))

(declare-fun bm!8581 () Bool)

(declare-fun call!8601 () Bool)

(assert (=> bm!8581 (= call!8595 call!8601)))

(declare-fun b!89043 () Bool)

(declare-fun res!45561 () Bool)

(declare-fun call!8591 () Bool)

(assert (=> b!89043 (= res!45561 call!8591)))

(assert (=> b!89043 (=> (not res!45561) (not e!57980))))

(declare-fun b!89044 () Bool)

(declare-fun res!45552 () Bool)

(declare-fun e!57978 () Bool)

(assert (=> b!89044 (=> (not res!45552) (not e!57978))))

(declare-fun lt!42693 () SeekEntryResult!239)

(assert (=> b!89044 (= res!45552 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3095 lt!42693)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89045 () Bool)

(declare-fun lt!42681 () Unit!2620)

(declare-fun lt!42684 () Unit!2620)

(assert (=> b!89045 (= lt!42681 lt!42684)))

(declare-fun call!8598 () ListLongMap!1449)

(declare-fun call!8582 () ListLongMap!1449)

(assert (=> b!89045 (= call!8598 call!8582)))

(declare-fun lt!42668 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!33 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 V!3041 Int) Unit!2620)

(assert (=> b!89045 (= lt!42684 (lemmaChangeZeroKeyThenAddPairToListMap!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) lt!42668 (zeroValue!2260 newMap!16) lt!42407 (minValue!2260 newMap!16) (defaultEntry!2371 newMap!16)))))

(assert (=> b!89045 (= lt!42668 (bvor (extraKeys!2204 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!57991 () tuple2!2202)

(assert (=> b!89045 (= e!57991 (tuple2!2203 true (LongMapFixedSize!767 (defaultEntry!2371 newMap!16) (mask!6415 newMap!16) (bvor (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) lt!42407 (minValue!2260 newMap!16) (_size!432 newMap!16) (_keys!4049 newMap!16) (_values!2354 newMap!16) (_vacant!432 newMap!16))))))

(declare-fun bm!8582 () Bool)

(declare-fun call!8587 () Bool)

(declare-fun call!8580 () Bool)

(assert (=> bm!8582 (= call!8587 call!8580)))

(declare-fun bm!8583 () Bool)

(assert (=> bm!8583 (= call!8591 call!8601)))

(declare-fun b!89046 () Bool)

(declare-fun c!14767 () Bool)

(assert (=> b!89046 (= c!14767 ((_ is MissingVacant!239) lt!42693))))

(declare-fun e!57987 () Bool)

(assert (=> b!89046 (= e!57987 e!57990)))

(declare-fun b!89047 () Bool)

(assert (=> b!89047 (= e!57992 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!42669)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun call!8586 () Unit!2620)

(declare-fun bm!8584 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) Int) Unit!2620)

(assert (=> bm!8584 (= call!8586 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(declare-fun b!89048 () Bool)

(declare-fun call!8593 () Bool)

(assert (=> b!89048 (= e!57978 (not call!8593))))

(declare-fun bm!8585 () Bool)

(declare-fun call!8596 () ListLongMap!1449)

(assert (=> bm!8585 (= call!8585 call!8596)))

(declare-fun b!89049 () Bool)

(declare-fun e!57985 () Bool)

(assert (=> b!89049 (= e!57985 (not call!8587))))

(declare-fun c!14772 () Bool)

(declare-fun c!14770 () Bool)

(declare-fun bm!8586 () Bool)

(declare-fun c!14771 () Bool)

(assert (=> bm!8586 (= call!8596 (getCurrentListMap!433 (_keys!4049 newMap!16) (ite (or c!14770 c!14771) (_values!2354 newMap!16) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16)))) (mask!6415 newMap!16) (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16)) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun b!89050 () Bool)

(declare-fun lt!42675 () Unit!2620)

(assert (=> b!89050 (= e!57988 lt!42675)))

(assert (=> b!89050 (= lt!42675 call!8586)))

(assert (=> b!89050 (= lt!42693 call!8583)))

(declare-fun c!14761 () Bool)

(assert (=> b!89050 (= c!14761 ((_ is MissingZero!239) lt!42693))))

(assert (=> b!89050 e!57987))

(declare-fun b!89051 () Bool)

(declare-fun lt!42671 () tuple2!2202)

(assert (=> b!89051 (= lt!42671 call!8588)))

(assert (=> b!89051 (= e!57998 (tuple2!2203 (_1!1112 lt!42671) (_2!1112 lt!42671)))))

(declare-fun b!89052 () Bool)

(declare-fun lt!42688 () Unit!2620)

(assert (=> b!89052 (= lt!42688 e!57988)))

(declare-fun c!14765 () Bool)

(assert (=> b!89052 (= c!14765 call!8599)))

(declare-fun e!57981 () tuple2!2202)

(assert (=> b!89052 (= e!57981 (tuple2!2203 false newMap!16))))

(declare-fun bm!8587 () Bool)

(declare-fun call!8592 () Bool)

(assert (=> bm!8587 (= call!8592 call!8591)))

(declare-fun bm!8588 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) Int) Unit!2620)

(assert (=> bm!8588 (= call!8589 (lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(declare-fun b!89053 () Bool)

(declare-fun c!14760 () Bool)

(declare-fun lt!42670 () SeekEntryResult!239)

(assert (=> b!89053 (= c!14760 ((_ is MissingVacant!239) lt!42670))))

(declare-fun e!57984 () Bool)

(declare-fun e!57989 () Bool)

(assert (=> b!89053 (= e!57984 e!57989)))

(declare-fun bm!8589 () Bool)

(declare-fun call!8603 () SeekEntryResult!239)

(assert (=> bm!8589 (= call!8603 call!8594)))

(declare-fun b!89054 () Bool)

(declare-fun e!57997 () tuple2!2202)

(assert (=> b!89054 (= e!57997 e!57991)))

(assert (=> b!89054 (= c!14772 (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8590 () Bool)

(declare-fun c!14762 () Bool)

(assert (=> bm!8590 (= c!14762 c!14771)))

(assert (=> bm!8590 (= call!8599 (contains!754 e!57982 (ite c!14771 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!42678)))))))

(declare-fun b!89055 () Bool)

(declare-fun e!57993 () Bool)

(assert (=> b!89055 (= e!57993 e!57995)))

(declare-fun c!14768 () Bool)

(declare-fun lt!42677 () tuple2!2202)

(assert (=> b!89055 (= c!14768 (_1!1112 lt!42677))))

(declare-fun b!89056 () Bool)

(declare-fun call!8600 () ListLongMap!1449)

(assert (=> b!89056 (= e!57995 (= call!8597 call!8600))))

(declare-fun b!89057 () Bool)

(declare-fun res!45553 () Bool)

(assert (=> b!89057 (= res!45553 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3098 lt!42693)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89057 (=> (not res!45553) (not e!57996))))

(declare-fun bm!8591 () Bool)

(declare-fun lt!42692 () (_ BitVec 32))

(assert (=> bm!8591 (= call!8581 (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) (zeroValue!2260 newMap!16) (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun bm!8592 () Bool)

(assert (=> bm!8592 (= call!8580 (arrayContainsKey!0 (_keys!4049 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!89058 () Bool)

(declare-fun e!57983 () Bool)

(assert (=> b!89058 (= e!57989 e!57983)))

(declare-fun res!45558 () Bool)

(assert (=> b!89058 (= res!45558 call!8592)))

(assert (=> b!89058 (=> (not res!45558) (not e!57983))))

(declare-fun b!89059 () Bool)

(assert (=> b!89059 (= e!57997 e!57981)))

(assert (=> b!89059 (= lt!42678 (seekEntryOrOpen!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (_keys!4049 newMap!16) (mask!6415 newMap!16)))))

(assert (=> b!89059 (= c!14771 ((_ is Undefined!239) lt!42678))))

(declare-fun bm!8593 () Bool)

(assert (=> bm!8593 (= call!8600 (map!1203 newMap!16))))

(declare-fun b!89060 () Bool)

(declare-fun res!45555 () Bool)

(assert (=> b!89060 (=> (not res!45555) (not e!57985))))

(assert (=> b!89060 (= res!45555 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3095 lt!42670)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!23699 () Bool)

(assert (=> d!23699 e!57993))

(declare-fun res!45560 () Bool)

(assert (=> d!23699 (=> (not res!45560) (not e!57993))))

(assert (=> d!23699 (= res!45560 (valid!343 (_2!1112 lt!42677)))))

(assert (=> d!23699 (= lt!42677 e!57997)))

(assert (=> d!23699 (= c!14770 (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvneg (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355))))))

(assert (=> d!23699 (valid!343 newMap!16)))

(assert (=> d!23699 (= (update!126 newMap!16 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407) lt!42677)))

(declare-fun bm!8594 () Bool)

(assert (=> bm!8594 (= call!8582 call!8596)))

(declare-fun bm!8595 () Bool)

(assert (=> bm!8595 (= call!8593 call!8580)))

(declare-fun b!89061 () Bool)

(assert (=> b!89061 (= e!57994 (= call!8597 (+!111 call!8600 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(declare-fun b!89062 () Bool)

(declare-fun Unit!2628 () Unit!2620)

(assert (=> b!89062 (= e!57979 Unit!2628)))

(declare-fun lt!42667 () Unit!2620)

(assert (=> b!89062 (= lt!42667 call!8586)))

(assert (=> b!89062 (= lt!42670 call!8603)))

(declare-fun c!14769 () Bool)

(assert (=> b!89062 (= c!14769 ((_ is MissingZero!239) lt!42670))))

(assert (=> b!89062 e!57984))

(declare-fun lt!42674 () Unit!2620)

(assert (=> b!89062 (= lt!42674 lt!42667)))

(assert (=> b!89062 false))

(declare-fun bm!8596 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8596 (= call!8601 (inRange!0 (ite c!14771 (ite c!14765 (index!3096 lt!42669) (ite c!14761 (index!3095 lt!42693) (index!3098 lt!42693))) (ite c!14764 (index!3096 lt!42682) (ite c!14769 (index!3095 lt!42670) (index!3098 lt!42670)))) (mask!6415 newMap!16)))))

(declare-fun b!89063 () Bool)

(declare-fun res!45557 () Bool)

(assert (=> b!89063 (=> (not res!45557) (not e!57978))))

(assert (=> b!89063 (= res!45557 call!8584)))

(assert (=> b!89063 (= e!57987 e!57978)))

(declare-fun b!89064 () Bool)

(assert (=> b!89064 (= e!57996 (not call!8593))))

(declare-fun bm!8597 () Bool)

(assert (=> bm!8597 (= call!8597 (map!1203 (_2!1112 lt!42677)))))

(declare-fun b!89065 () Bool)

(declare-fun res!45549 () Bool)

(assert (=> b!89065 (=> (not res!45549) (not e!57985))))

(assert (=> b!89065 (= res!45549 call!8592)))

(assert (=> b!89065 (= e!57984 e!57985)))

(declare-fun b!89066 () Bool)

(declare-fun e!57986 () tuple2!2202)

(assert (=> b!89066 (= e!57986 e!57998)))

(declare-fun c!14763 () Bool)

(assert (=> b!89066 (= c!14763 ((_ is MissingZero!239) lt!42678))))

(declare-fun bm!8598 () Bool)

(declare-fun call!8602 () ListLongMap!1449)

(assert (=> bm!8598 (= call!8590 (+!111 (ite c!14770 (ite c!14772 call!8602 call!8582) call!8581) (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(declare-fun b!89067 () Bool)

(assert (=> b!89067 (= e!57990 ((_ is Undefined!239) lt!42693))))

(declare-fun b!89068 () Bool)

(assert (=> b!89068 (= e!57982 call!8585)))

(declare-fun b!89069 () Bool)

(assert (=> b!89069 (= e!57983 (not call!8587))))

(declare-fun bm!8599 () Bool)

(assert (=> bm!8599 (= call!8602 call!8581)))

(declare-fun b!89070 () Bool)

(assert (=> b!89070 (= c!14766 ((_ is MissingVacant!239) lt!42678))))

(assert (=> b!89070 (= e!57981 e!57986)))

(declare-fun bm!8600 () Bool)

(assert (=> bm!8600 (= call!8598 call!8590)))

(declare-fun b!89071 () Bool)

(declare-fun lt!42685 () Unit!2620)

(assert (=> b!89071 (= e!57979 lt!42685)))

(assert (=> b!89071 (= lt!42685 call!8589)))

(assert (=> b!89071 (= lt!42682 call!8603)))

(declare-fun res!45562 () Bool)

(assert (=> b!89071 (= res!45562 ((_ is Found!239) lt!42682))))

(assert (=> b!89071 (=> (not res!45562) (not e!57980))))

(assert (=> b!89071 e!57980))

(declare-fun b!89072 () Bool)

(assert (=> b!89072 (= e!57989 ((_ is Undefined!239) lt!42670))))

(declare-fun b!89073 () Bool)

(declare-fun res!45550 () Bool)

(assert (=> b!89073 (= res!45550 call!8595)))

(assert (=> b!89073 (=> (not res!45550) (not e!57992))))

(declare-fun b!89074 () Bool)

(declare-fun lt!42676 () Unit!2620)

(declare-fun lt!42686 () Unit!2620)

(assert (=> b!89074 (= lt!42676 lt!42686)))

(assert (=> b!89074 (= call!8598 call!8602)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!33 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 V!3041 Int) Unit!2620)

(assert (=> b!89074 (= lt!42686 (lemmaChangeLongMinValueKeyThenAddPairToListMap!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) lt!42692 (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) lt!42407 (defaultEntry!2371 newMap!16)))))

(assert (=> b!89074 (= lt!42692 (bvor (extraKeys!2204 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!89074 (= e!57991 (tuple2!2203 true (LongMapFixedSize!767 (defaultEntry!2371 newMap!16) (mask!6415 newMap!16) (bvor (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) (zeroValue!2260 newMap!16) lt!42407 (_size!432 newMap!16) (_keys!4049 newMap!16) (_values!2354 newMap!16) (_vacant!432 newMap!16))))))

(declare-fun b!89075 () Bool)

(declare-fun lt!42683 () tuple2!2202)

(assert (=> b!89075 (= e!57986 (tuple2!2203 (_1!1112 lt!42683) (_2!1112 lt!42683)))))

(assert (=> b!89075 (= lt!42683 call!8588)))

(declare-fun b!89076 () Bool)

(declare-fun res!45556 () Bool)

(assert (=> b!89076 (= res!45556 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3098 lt!42670)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89076 (=> (not res!45556) (not e!57983))))

(assert (= (and d!23699 c!14770) b!89054))

(assert (= (and d!23699 (not c!14770)) b!89059))

(assert (= (and b!89054 c!14772) b!89045))

(assert (= (and b!89054 (not c!14772)) b!89074))

(assert (= (or b!89045 b!89074) bm!8599))

(assert (= (or b!89045 b!89074) bm!8594))

(assert (= (or b!89045 b!89074) bm!8600))

(assert (= (and b!89059 c!14771) b!89052))

(assert (= (and b!89059 (not c!14771)) b!89070))

(assert (= (and b!89052 c!14765) b!89042))

(assert (= (and b!89052 (not c!14765)) b!89050))

(assert (= (and b!89042 res!45551) b!89073))

(assert (= (and b!89073 res!45550) b!89047))

(assert (= (and b!89050 c!14761) b!89063))

(assert (= (and b!89050 (not c!14761)) b!89046))

(assert (= (and b!89063 res!45557) b!89044))

(assert (= (and b!89044 res!45552) b!89048))

(assert (= (and b!89046 c!14767) b!89038))

(assert (= (and b!89046 (not c!14767)) b!89067))

(assert (= (and b!89038 res!45559) b!89057))

(assert (= (and b!89057 res!45553) b!89064))

(assert (= (or b!89063 b!89038) bm!8577))

(assert (= (or b!89048 b!89064) bm!8595))

(assert (= (or b!89073 bm!8577) bm!8581))

(assert (= (or b!89042 b!89050) bm!8580))

(assert (= (and b!89070 c!14766) b!89075))

(assert (= (and b!89070 (not c!14766)) b!89066))

(assert (= (and b!89066 c!14763) b!89051))

(assert (= (and b!89066 (not c!14763)) b!89037))

(assert (= (and b!89037 c!14764) b!89071))

(assert (= (and b!89037 (not c!14764)) b!89062))

(assert (= (and b!89071 res!45562) b!89043))

(assert (= (and b!89043 res!45561) b!89039))

(assert (= (and b!89062 c!14769) b!89065))

(assert (= (and b!89062 (not c!14769)) b!89053))

(assert (= (and b!89065 res!45549) b!89060))

(assert (= (and b!89060 res!45555) b!89049))

(assert (= (and b!89053 c!14760) b!89058))

(assert (= (and b!89053 (not c!14760)) b!89072))

(assert (= (and b!89058 res!45558) b!89076))

(assert (= (and b!89076 res!45556) b!89069))

(assert (= (or b!89065 b!89058) bm!8587))

(assert (= (or b!89049 b!89069) bm!8582))

(assert (= (or b!89043 bm!8587) bm!8583))

(assert (= (or b!89071 b!89062) bm!8589))

(assert (= (or b!89075 b!89051) bm!8578))

(assert (= (or bm!8580 bm!8589) bm!8579))

(assert (= (or bm!8581 bm!8583) bm!8596))

(assert (= (or b!89052 b!89037) bm!8585))

(assert (= (or b!89050 b!89062) bm!8584))

(assert (= (or bm!8595 bm!8582) bm!8592))

(assert (= (or b!89042 b!89071) bm!8588))

(assert (= (or b!89052 b!89037) bm!8590))

(assert (= (and bm!8590 c!14762) b!89068))

(assert (= (and bm!8590 (not c!14762)) b!89040))

(assert (= (or bm!8594 bm!8585) bm!8586))

(assert (= (or bm!8599 b!89037) bm!8591))

(assert (= (or bm!8600 b!89037) bm!8598))

(assert (= (and d!23699 res!45560) b!89055))

(assert (= (and b!89055 c!14768) b!89041))

(assert (= (and b!89055 (not c!14768)) b!89056))

(assert (= (and b!89041 res!45554) b!89061))

(assert (= (or b!89041 b!89061 b!89056) bm!8597))

(assert (= (or b!89061 b!89056) bm!8593))

(declare-fun m!95273 () Bool)

(assert (=> b!89037 m!95273))

(declare-fun m!95275 () Bool)

(assert (=> b!89037 m!95275))

(assert (=> b!89037 m!94891))

(declare-fun m!95277 () Bool)

(assert (=> b!89037 m!95277))

(assert (=> b!89037 m!94891))

(declare-fun m!95279 () Bool)

(assert (=> b!89037 m!95279))

(assert (=> bm!8593 m!94931))

(declare-fun m!95281 () Bool)

(assert (=> b!89057 m!95281))

(assert (=> bm!8592 m!94891))

(declare-fun m!95283 () Bool)

(assert (=> bm!8592 m!95283))

(declare-fun m!95285 () Bool)

(assert (=> b!89074 m!95285))

(declare-fun m!95287 () Bool)

(assert (=> b!89047 m!95287))

(declare-fun m!95289 () Bool)

(assert (=> bm!8598 m!95289))

(assert (=> b!89041 m!94891))

(declare-fun m!95291 () Bool)

(assert (=> b!89041 m!95291))

(assert (=> bm!8586 m!95275))

(declare-fun m!95293 () Bool)

(assert (=> bm!8586 m!95293))

(assert (=> bm!8579 m!94891))

(declare-fun m!95295 () Bool)

(assert (=> bm!8579 m!95295))

(declare-fun m!95297 () Bool)

(assert (=> b!89061 m!95297))

(declare-fun m!95299 () Bool)

(assert (=> bm!8597 m!95299))

(declare-fun m!95301 () Bool)

(assert (=> b!89040 m!95301))

(declare-fun m!95303 () Bool)

(assert (=> bm!8596 m!95303))

(assert (=> bm!8584 m!94891))

(declare-fun m!95305 () Bool)

(assert (=> bm!8584 m!95305))

(declare-fun m!95307 () Bool)

(assert (=> b!89039 m!95307))

(assert (=> bm!8578 m!94891))

(declare-fun m!95309 () Bool)

(assert (=> bm!8578 m!95309))

(assert (=> bm!8588 m!94891))

(declare-fun m!95311 () Bool)

(assert (=> bm!8588 m!95311))

(declare-fun m!95313 () Bool)

(assert (=> b!89045 m!95313))

(assert (=> b!89059 m!94891))

(assert (=> b!89059 m!95295))

(declare-fun m!95315 () Bool)

(assert (=> b!89044 m!95315))

(declare-fun m!95317 () Bool)

(assert (=> bm!8590 m!95317))

(declare-fun m!95319 () Bool)

(assert (=> bm!8590 m!95319))

(declare-fun m!95321 () Bool)

(assert (=> d!23699 m!95321))

(assert (=> d!23699 m!94953))

(declare-fun m!95323 () Bool)

(assert (=> bm!8591 m!95323))

(declare-fun m!95325 () Bool)

(assert (=> b!89060 m!95325))

(declare-fun m!95327 () Bool)

(assert (=> b!89076 m!95327))

(assert (=> b!88695 d!23699))

(declare-fun d!23701 () Bool)

(assert (=> d!23701 (= (map!1203 newMap!16) (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun bs!3750 () Bool)

(assert (= bs!3750 d!23701))

(declare-fun m!95329 () Bool)

(assert (=> bs!3750 m!95329))

(assert (=> b!88687 d!23701))

(declare-fun b!89119 () Bool)

(declare-fun e!58027 () Bool)

(declare-fun lt!42758 () ListLongMap!1449)

(assert (=> b!89119 (= e!58027 (= (apply!84 lt!42758 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun b!89120 () Bool)

(declare-fun e!58035 () ListLongMap!1449)

(declare-fun e!58029 () ListLongMap!1449)

(assert (=> b!89120 (= e!58035 e!58029)))

(declare-fun c!14787 () Bool)

(assert (=> b!89120 (= c!14787 (and (not (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89121 () Bool)

(declare-fun e!58028 () Bool)

(declare-fun e!58032 () Bool)

(assert (=> b!89121 (= e!58028 e!58032)))

(declare-fun res!45581 () Bool)

(declare-fun call!8618 () Bool)

(assert (=> b!89121 (= res!45581 call!8618)))

(assert (=> b!89121 (=> (not res!45581) (not e!58032))))

(declare-fun bm!8615 () Bool)

(declare-fun call!8620 () Bool)

(assert (=> bm!8615 (= call!8620 (contains!754 lt!42758 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89122 () Bool)

(declare-fun e!58037 () Bool)

(assert (=> b!89122 (= e!58037 (not call!8620))))

(declare-fun b!89123 () Bool)

(declare-fun e!58025 () ListLongMap!1449)

(declare-fun call!8624 () ListLongMap!1449)

(assert (=> b!89123 (= e!58025 call!8624)))

(declare-fun b!89124 () Bool)

(declare-fun e!58030 () Unit!2620)

(declare-fun Unit!2629 () Unit!2620)

(assert (=> b!89124 (= e!58030 Unit!2629)))

(declare-fun b!89125 () Bool)

(assert (=> b!89125 (= e!58028 (not call!8618))))

(declare-fun b!89126 () Bool)

(declare-fun res!45587 () Bool)

(declare-fun e!58033 () Bool)

(assert (=> b!89126 (=> (not res!45587) (not e!58033))))

(declare-fun e!58036 () Bool)

(assert (=> b!89126 (= res!45587 e!58036)))

(declare-fun res!45585 () Bool)

(assert (=> b!89126 (=> res!45585 e!58036)))

(declare-fun e!58031 () Bool)

(assert (=> b!89126 (= res!45585 (not e!58031))))

(declare-fun res!45588 () Bool)

(assert (=> b!89126 (=> (not res!45588) (not e!58031))))

(assert (=> b!89126 (= res!45588 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun d!23703 () Bool)

(assert (=> d!23703 e!58033))

(declare-fun res!45583 () Bool)

(assert (=> d!23703 (=> (not res!45583) (not e!58033))))

(assert (=> d!23703 (= res!45583 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))))

(declare-fun lt!42755 () ListLongMap!1449)

(assert (=> d!23703 (= lt!42758 lt!42755)))

(declare-fun lt!42747 () Unit!2620)

(assert (=> d!23703 (= lt!42747 e!58030)))

(declare-fun c!14786 () Bool)

(declare-fun e!58034 () Bool)

(assert (=> d!23703 (= c!14786 e!58034)))

(declare-fun res!45589 () Bool)

(assert (=> d!23703 (=> (not res!45589) (not e!58034))))

(assert (=> d!23703 (= res!45589 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> d!23703 (= lt!42755 e!58035)))

(declare-fun c!14785 () Bool)

(assert (=> d!23703 (= c!14785 (and (not (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23703 (validMask!0 (mask!6415 (v!2677 (underlying!298 thiss!992))))))

(assert (=> d!23703 (= (getCurrentListMap!433 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))) lt!42758)))

(declare-fun b!89127 () Bool)

(declare-fun call!8623 () ListLongMap!1449)

(assert (=> b!89127 (= e!58025 call!8623)))

(declare-fun b!89128 () Bool)

(declare-fun c!14789 () Bool)

(assert (=> b!89128 (= c!14789 (and (not (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!89128 (= e!58029 e!58025)))

(declare-fun b!89129 () Bool)

(assert (=> b!89129 (= e!58029 call!8623)))

(declare-fun bm!8616 () Bool)

(declare-fun call!8621 () ListLongMap!1449)

(assert (=> bm!8616 (= call!8621 (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun b!89130 () Bool)

(declare-fun e!58026 () Bool)

(assert (=> b!89130 (= e!58036 e!58026)))

(declare-fun res!45584 () Bool)

(assert (=> b!89130 (=> (not res!45584) (not e!58026))))

(assert (=> b!89130 (= res!45584 (contains!754 lt!42758 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!89130 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun b!89131 () Bool)

(declare-fun call!8622 () ListLongMap!1449)

(assert (=> b!89131 (= e!58035 (+!111 call!8622 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun b!89132 () Bool)

(declare-fun lt!42742 () Unit!2620)

(assert (=> b!89132 (= e!58030 lt!42742)))

(declare-fun lt!42739 () ListLongMap!1449)

(assert (=> b!89132 (= lt!42739 (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun lt!42738 () (_ BitVec 64))

(assert (=> b!89132 (= lt!42738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42746 () (_ BitVec 64))

(assert (=> b!89132 (= lt!42746 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42748 () Unit!2620)

(declare-fun addStillContains!60 (ListLongMap!1449 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2620)

(assert (=> b!89132 (= lt!42748 (addStillContains!60 lt!42739 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42746))))

(assert (=> b!89132 (contains!754 (+!111 lt!42739 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42746)))

(declare-fun lt!42740 () Unit!2620)

(assert (=> b!89132 (= lt!42740 lt!42748)))

(declare-fun lt!42756 () ListLongMap!1449)

(assert (=> b!89132 (= lt!42756 (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun lt!42745 () (_ BitVec 64))

(assert (=> b!89132 (= lt!42745 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42752 () (_ BitVec 64))

(assert (=> b!89132 (= lt!42752 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42751 () Unit!2620)

(declare-fun addApplyDifferent!60 (ListLongMap!1449 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2620)

(assert (=> b!89132 (= lt!42751 (addApplyDifferent!60 lt!42756 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42752))))

(assert (=> b!89132 (= (apply!84 (+!111 lt!42756 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42752) (apply!84 lt!42756 lt!42752))))

(declare-fun lt!42753 () Unit!2620)

(assert (=> b!89132 (= lt!42753 lt!42751)))

(declare-fun lt!42750 () ListLongMap!1449)

(assert (=> b!89132 (= lt!42750 (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun lt!42743 () (_ BitVec 64))

(assert (=> b!89132 (= lt!42743 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42754 () (_ BitVec 64))

(assert (=> b!89132 (= lt!42754 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42749 () Unit!2620)

(assert (=> b!89132 (= lt!42749 (addApplyDifferent!60 lt!42750 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42754))))

(assert (=> b!89132 (= (apply!84 (+!111 lt!42750 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42754) (apply!84 lt!42750 lt!42754))))

(declare-fun lt!42757 () Unit!2620)

(assert (=> b!89132 (= lt!42757 lt!42749)))

(declare-fun lt!42759 () ListLongMap!1449)

(assert (=> b!89132 (= lt!42759 (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun lt!42744 () (_ BitVec 64))

(assert (=> b!89132 (= lt!42744 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42741 () (_ BitVec 64))

(assert (=> b!89132 (= lt!42741 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!89132 (= lt!42742 (addApplyDifferent!60 lt!42759 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42741))))

(assert (=> b!89132 (= (apply!84 (+!111 lt!42759 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42741) (apply!84 lt!42759 lt!42741))))

(declare-fun bm!8617 () Bool)

(declare-fun call!8619 () ListLongMap!1449)

(assert (=> bm!8617 (= call!8624 call!8619)))

(declare-fun b!89133 () Bool)

(assert (=> b!89133 (= e!58034 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!89134 () Bool)

(assert (=> b!89134 (= e!58037 e!58027)))

(declare-fun res!45586 () Bool)

(assert (=> b!89134 (= res!45586 call!8620)))

(assert (=> b!89134 (=> (not res!45586) (not e!58027))))

(declare-fun b!89135 () Bool)

(assert (=> b!89135 (= e!58032 (= (apply!84 lt!42758 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun b!89136 () Bool)

(assert (=> b!89136 (= e!58026 (= (apply!84 lt!42758 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89136 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2169 (_values!2354 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> b!89136 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun bm!8618 () Bool)

(assert (=> bm!8618 (= call!8623 call!8622)))

(declare-fun b!89137 () Bool)

(declare-fun res!45582 () Bool)

(assert (=> b!89137 (=> (not res!45582) (not e!58033))))

(assert (=> b!89137 (= res!45582 e!58028)))

(declare-fun c!14788 () Bool)

(assert (=> b!89137 (= c!14788 (not (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!89138 () Bool)

(assert (=> b!89138 (= e!58033 e!58037)))

(declare-fun c!14790 () Bool)

(assert (=> b!89138 (= c!14790 (not (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89139 () Bool)

(assert (=> b!89139 (= e!58031 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!8619 () Bool)

(assert (=> bm!8619 (= call!8619 call!8621)))

(declare-fun bm!8620 () Bool)

(assert (=> bm!8620 (= call!8622 (+!111 (ite c!14785 call!8621 (ite c!14787 call!8619 call!8624)) (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(declare-fun bm!8621 () Bool)

(assert (=> bm!8621 (= call!8618 (contains!754 lt!42758 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23703 c!14785) b!89131))

(assert (= (and d!23703 (not c!14785)) b!89120))

(assert (= (and b!89120 c!14787) b!89129))

(assert (= (and b!89120 (not c!14787)) b!89128))

(assert (= (and b!89128 c!14789) b!89127))

(assert (= (and b!89128 (not c!14789)) b!89123))

(assert (= (or b!89127 b!89123) bm!8617))

(assert (= (or b!89129 bm!8617) bm!8619))

(assert (= (or b!89129 b!89127) bm!8618))

(assert (= (or b!89131 bm!8619) bm!8616))

(assert (= (or b!89131 bm!8618) bm!8620))

(assert (= (and d!23703 res!45589) b!89133))

(assert (= (and d!23703 c!14786) b!89132))

(assert (= (and d!23703 (not c!14786)) b!89124))

(assert (= (and d!23703 res!45583) b!89126))

(assert (= (and b!89126 res!45588) b!89139))

(assert (= (and b!89126 (not res!45585)) b!89130))

(assert (= (and b!89130 res!45584) b!89136))

(assert (= (and b!89126 res!45587) b!89137))

(assert (= (and b!89137 c!14788) b!89121))

(assert (= (and b!89137 (not c!14788)) b!89125))

(assert (= (and b!89121 res!45581) b!89135))

(assert (= (or b!89121 b!89125) bm!8621))

(assert (= (and b!89137 res!45582) b!89138))

(assert (= (and b!89138 c!14790) b!89134))

(assert (= (and b!89138 (not c!14790)) b!89122))

(assert (= (and b!89134 res!45586) b!89119))

(assert (= (or b!89134 b!89122) bm!8615))

(declare-fun b_lambda!3939 () Bool)

(assert (=> (not b_lambda!3939) (not b!89136)))

(assert (=> b!89136 t!5263))

(declare-fun b_and!5357 () Bool)

(assert (= b_and!5353 (and (=> t!5263 result!2955) b_and!5357)))

(assert (=> b!89136 t!5265))

(declare-fun b_and!5359 () Bool)

(assert (= b_and!5355 (and (=> t!5265 result!2959) b_and!5359)))

(declare-fun m!95331 () Bool)

(assert (=> bm!8620 m!95331))

(assert (=> d!23703 m!94911))

(declare-fun m!95333 () Bool)

(assert (=> bm!8615 m!95333))

(assert (=> b!89139 m!95107))

(assert (=> b!89139 m!95107))

(assert (=> b!89139 m!95109))

(assert (=> b!89133 m!95107))

(assert (=> b!89133 m!95107))

(assert (=> b!89133 m!95109))

(declare-fun m!95335 () Bool)

(assert (=> bm!8621 m!95335))

(declare-fun m!95337 () Bool)

(assert (=> b!89132 m!95337))

(declare-fun m!95339 () Bool)

(assert (=> b!89132 m!95339))

(declare-fun m!95341 () Bool)

(assert (=> b!89132 m!95341))

(assert (=> b!89132 m!94909))

(declare-fun m!95343 () Bool)

(assert (=> b!89132 m!95343))

(declare-fun m!95345 () Bool)

(assert (=> b!89132 m!95345))

(declare-fun m!95347 () Bool)

(assert (=> b!89132 m!95347))

(declare-fun m!95349 () Bool)

(assert (=> b!89132 m!95349))

(assert (=> b!89132 m!95349))

(declare-fun m!95351 () Bool)

(assert (=> b!89132 m!95351))

(declare-fun m!95353 () Bool)

(assert (=> b!89132 m!95353))

(assert (=> b!89132 m!95345))

(declare-fun m!95355 () Bool)

(assert (=> b!89132 m!95355))

(declare-fun m!95357 () Bool)

(assert (=> b!89132 m!95357))

(assert (=> b!89132 m!95339))

(declare-fun m!95359 () Bool)

(assert (=> b!89132 m!95359))

(declare-fun m!95361 () Bool)

(assert (=> b!89132 m!95361))

(assert (=> b!89132 m!95107))

(assert (=> b!89132 m!95357))

(declare-fun m!95363 () Bool)

(assert (=> b!89132 m!95363))

(declare-fun m!95365 () Bool)

(assert (=> b!89132 m!95365))

(assert (=> bm!8616 m!94909))

(declare-fun m!95367 () Bool)

(assert (=> b!89119 m!95367))

(declare-fun m!95369 () Bool)

(assert (=> b!89131 m!95369))

(assert (=> b!89136 m!95111))

(assert (=> b!89136 m!94941))

(assert (=> b!89136 m!95119))

(assert (=> b!89136 m!94941))

(assert (=> b!89136 m!95107))

(assert (=> b!89136 m!95107))

(declare-fun m!95371 () Bool)

(assert (=> b!89136 m!95371))

(assert (=> b!89136 m!95111))

(assert (=> b!89130 m!95107))

(assert (=> b!89130 m!95107))

(declare-fun m!95373 () Bool)

(assert (=> b!89130 m!95373))

(declare-fun m!95375 () Bool)

(assert (=> b!89135 m!95375))

(assert (=> b!88687 d!23703))

(declare-fun d!23705 () Bool)

(assert (=> d!23705 (= (valid!342 thiss!992) (valid!343 (v!2677 (underlying!298 thiss!992))))))

(declare-fun bs!3751 () Bool)

(assert (= bs!3751 d!23705))

(declare-fun m!95377 () Bool)

(assert (=> bs!3751 m!95377))

(assert (=> start!10950 d!23705))

(declare-fun b!89140 () Bool)

(declare-fun e!58040 () Bool)

(declare-fun e!58041 () Bool)

(assert (=> b!89140 (= e!58040 e!58041)))

(declare-fun res!45592 () Bool)

(assert (=> b!89140 (=> (not res!45592) (not e!58041))))

(declare-fun e!58039 () Bool)

(assert (=> b!89140 (= res!45592 (not e!58039))))

(declare-fun res!45591 () Bool)

(assert (=> b!89140 (=> (not res!45591) (not e!58039))))

(assert (=> b!89140 (= res!45591 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!89141 () Bool)

(declare-fun e!58038 () Bool)

(declare-fun call!8625 () Bool)

(assert (=> b!89141 (= e!58038 call!8625)))

(declare-fun b!89142 () Bool)

(assert (=> b!89142 (= e!58039 (contains!756 Nil!1513 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!89143 () Bool)

(assert (=> b!89143 (= e!58038 call!8625)))

(declare-fun bm!8622 () Bool)

(declare-fun c!14791 () Bool)

(assert (=> bm!8622 (= call!8625 (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14791 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) Nil!1513) Nil!1513)))))

(declare-fun d!23707 () Bool)

(declare-fun res!45590 () Bool)

(assert (=> d!23707 (=> res!45590 e!58040)))

(assert (=> d!23707 (= res!45590 (bvsge #b00000000000000000000000000000000 (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> d!23707 (= (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000000 Nil!1513) e!58040)))

(declare-fun b!89144 () Bool)

(assert (=> b!89144 (= e!58041 e!58038)))

(assert (=> b!89144 (= c!14791 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!23707 (not res!45590)) b!89140))

(assert (= (and b!89140 res!45591) b!89142))

(assert (= (and b!89140 res!45592) b!89144))

(assert (= (and b!89144 c!14791) b!89141))

(assert (= (and b!89144 (not c!14791)) b!89143))

(assert (= (or b!89141 b!89143) bm!8622))

(assert (=> b!89140 m!95227))

(assert (=> b!89140 m!95227))

(assert (=> b!89140 m!95229))

(assert (=> b!89142 m!95227))

(assert (=> b!89142 m!95227))

(declare-fun m!95379 () Bool)

(assert (=> b!89142 m!95379))

(assert (=> bm!8622 m!95227))

(declare-fun m!95381 () Bool)

(assert (=> bm!8622 m!95381))

(assert (=> b!89144 m!95227))

(assert (=> b!89144 m!95227))

(assert (=> b!89144 m!95229))

(assert (=> b!88680 d!23707))

(declare-fun b!89152 () Bool)

(declare-fun e!58047 () Bool)

(assert (=> b!89152 (= e!58047 tp_is_empty!2545)))

(declare-fun b!89151 () Bool)

(declare-fun e!58046 () Bool)

(assert (=> b!89151 (= e!58046 tp_is_empty!2545)))

(declare-fun condMapEmpty!3459 () Bool)

(declare-fun mapDefault!3459 () ValueCell!929)

(assert (=> mapNonEmpty!3443 (= condMapEmpty!3459 (= mapRest!3443 ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3459)))))

(declare-fun mapRes!3459 () Bool)

(assert (=> mapNonEmpty!3443 (= tp!9010 (and e!58047 mapRes!3459))))

(declare-fun mapIsEmpty!3459 () Bool)

(assert (=> mapIsEmpty!3459 mapRes!3459))

(declare-fun mapNonEmpty!3459 () Bool)

(declare-fun tp!9039 () Bool)

(assert (=> mapNonEmpty!3459 (= mapRes!3459 (and tp!9039 e!58046))))

(declare-fun mapRest!3459 () (Array (_ BitVec 32) ValueCell!929))

(declare-fun mapKey!3459 () (_ BitVec 32))

(declare-fun mapValue!3459 () ValueCell!929)

(assert (=> mapNonEmpty!3459 (= mapRest!3443 (store mapRest!3459 mapKey!3459 mapValue!3459))))

(assert (= (and mapNonEmpty!3443 condMapEmpty!3459) mapIsEmpty!3459))

(assert (= (and mapNonEmpty!3443 (not condMapEmpty!3459)) mapNonEmpty!3459))

(assert (= (and mapNonEmpty!3459 ((_ is ValueCellFull!929) mapValue!3459)) b!89151))

(assert (= (and mapNonEmpty!3443 ((_ is ValueCellFull!929) mapDefault!3459)) b!89152))

(declare-fun m!95383 () Bool)

(assert (=> mapNonEmpty!3459 m!95383))

(declare-fun b!89154 () Bool)

(declare-fun e!58049 () Bool)

(assert (=> b!89154 (= e!58049 tp_is_empty!2545)))

(declare-fun b!89153 () Bool)

(declare-fun e!58048 () Bool)

(assert (=> b!89153 (= e!58048 tp_is_empty!2545)))

(declare-fun condMapEmpty!3460 () Bool)

(declare-fun mapDefault!3460 () ValueCell!929)

(assert (=> mapNonEmpty!3444 (= condMapEmpty!3460 (= mapRest!3444 ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3460)))))

(declare-fun mapRes!3460 () Bool)

(assert (=> mapNonEmpty!3444 (= tp!9012 (and e!58049 mapRes!3460))))

(declare-fun mapIsEmpty!3460 () Bool)

(assert (=> mapIsEmpty!3460 mapRes!3460))

(declare-fun mapNonEmpty!3460 () Bool)

(declare-fun tp!9040 () Bool)

(assert (=> mapNonEmpty!3460 (= mapRes!3460 (and tp!9040 e!58048))))

(declare-fun mapRest!3460 () (Array (_ BitVec 32) ValueCell!929))

(declare-fun mapKey!3460 () (_ BitVec 32))

(declare-fun mapValue!3460 () ValueCell!929)

(assert (=> mapNonEmpty!3460 (= mapRest!3444 (store mapRest!3460 mapKey!3460 mapValue!3460))))

(assert (= (and mapNonEmpty!3444 condMapEmpty!3460) mapIsEmpty!3460))

(assert (= (and mapNonEmpty!3444 (not condMapEmpty!3460)) mapNonEmpty!3460))

(assert (= (and mapNonEmpty!3460 ((_ is ValueCellFull!929) mapValue!3460)) b!89153))

(assert (= (and mapNonEmpty!3444 ((_ is ValueCellFull!929) mapDefault!3460)) b!89154))

(declare-fun m!95385 () Bool)

(assert (=> mapNonEmpty!3460 m!95385))

(declare-fun b_lambda!3941 () Bool)

(assert (= b_lambda!3937 (or (and b!88685 b_free!2257) (and b!88690 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))))) b_lambda!3941)))

(declare-fun b_lambda!3943 () Bool)

(assert (= b_lambda!3935 (or (and b!88685 b_free!2257) (and b!88690 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))))) b_lambda!3943)))

(declare-fun b_lambda!3945 () Bool)

(assert (= b_lambda!3939 (or (and b!88685 b_free!2257) (and b!88690 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))))) b_lambda!3945)))

(check-sat (not bm!8522) (not b!89142) (not b!89136) (not b!89045) (not b!88954) (not d!23665) (not bm!8616) (not b!88946) (not b!88885) (not bm!8525) (not bm!8591) (not bm!8578) (not d!23667) (not b!89131) (not b!88893) (not b!89130) (not mapNonEmpty!3459) (not b!88864) (not b!88890) (not b!88956) (not bm!8588) (not b!89144) (not bm!8615) (not b!88947) (not b!89133) (not b_lambda!3941) (not d!23705) (not b!88945) (not d!23687) (not b_lambda!3943) (not d!23651) (not bm!8620) (not b!89040) (not bm!8596) (not b!88874) (not b!88866) (not d!23701) (not b_lambda!3945) (not bm!8579) (not bm!8598) (not b!88888) (not b!88883) (not b!88886) (not b!88872) (not d!23659) (not b!89041) (not d!23691) (not b!88880) (not bm!8622) (not b!88881) b_and!5359 tp_is_empty!2545 (not d!23697) (not b!88882) (not b!89074) (not b!88892) (not bm!8528) (not b!89140) (not b!88868) b_and!5357 (not b_next!2257) (not b!88934) (not d!23655) (not mapNonEmpty!3460) (not b!89139) (not bm!8590) (not d!23661) (not d!23669) (not bm!8621) (not b!89135) (not b!89061) (not bm!8586) (not b!89059) (not b!88922) (not b!88902) (not b!89037) (not b!88870) (not b_lambda!3933) (not b!88917) (not b!88936) (not b!89119) (not b!88903) (not bm!8593) (not b!88887) (not d!23703) (not bm!8592) (not d!23657) (not d!23685) (not bm!8597) (not b!88875) (not d!23671) (not bm!8584) (not b!88891) (not d!23653) (not b!88884) (not b!88865) (not b!88910) (not d!23699) (not b_next!2259) (not b!89132) (not b!88938) (not b!88911) (not d!23695) (not b!88889))
(check-sat b_and!5357 b_and!5359 (not b_next!2257) (not b_next!2259))
(get-model)

(declare-fun d!23709 () Bool)

(declare-fun e!58050 () Bool)

(assert (=> d!23709 e!58050))

(declare-fun res!45593 () Bool)

(assert (=> d!23709 (=> res!45593 e!58050)))

(declare-fun lt!42761 () Bool)

(assert (=> d!23709 (= res!45593 (not lt!42761))))

(declare-fun lt!42762 () Bool)

(assert (=> d!23709 (= lt!42761 lt!42762)))

(declare-fun lt!42763 () Unit!2620)

(declare-fun e!58051 () Unit!2620)

(assert (=> d!23709 (= lt!42763 e!58051)))

(declare-fun c!14792 () Bool)

(assert (=> d!23709 (= c!14792 lt!42762)))

(assert (=> d!23709 (= lt!42762 (containsKey!146 (toList!740 e!57982) (ite c!14771 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!42678)))))))

(assert (=> d!23709 (= (contains!754 e!57982 (ite c!14771 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!42678)))) lt!42761)))

(declare-fun b!89155 () Bool)

(declare-fun lt!42760 () Unit!2620)

(assert (=> b!89155 (= e!58051 lt!42760)))

(assert (=> b!89155 (= lt!42760 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 e!57982) (ite c!14771 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!42678)))))))

(assert (=> b!89155 (isDefined!95 (getValueByKey!143 (toList!740 e!57982) (ite c!14771 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!42678)))))))

(declare-fun b!89156 () Bool)

(declare-fun Unit!2630 () Unit!2620)

(assert (=> b!89156 (= e!58051 Unit!2630)))

(declare-fun b!89157 () Bool)

(assert (=> b!89157 (= e!58050 (isDefined!95 (getValueByKey!143 (toList!740 e!57982) (ite c!14771 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!42678))))))))

(assert (= (and d!23709 c!14792) b!89155))

(assert (= (and d!23709 (not c!14792)) b!89156))

(assert (= (and d!23709 (not res!45593)) b!89157))

(declare-fun m!95387 () Bool)

(assert (=> d!23709 m!95387))

(declare-fun m!95389 () Bool)

(assert (=> b!89155 m!95389))

(declare-fun m!95391 () Bool)

(assert (=> b!89155 m!95391))

(assert (=> b!89155 m!95391))

(declare-fun m!95393 () Bool)

(assert (=> b!89155 m!95393))

(assert (=> b!89157 m!95391))

(assert (=> b!89157 m!95391))

(assert (=> b!89157 m!95393))

(assert (=> bm!8590 d!23709))

(declare-fun d!23711 () Bool)

(declare-fun e!58052 () Bool)

(assert (=> d!23711 e!58052))

(declare-fun res!45594 () Bool)

(assert (=> d!23711 (=> res!45594 e!58052)))

(declare-fun lt!42765 () Bool)

(assert (=> d!23711 (= res!45594 (not lt!42765))))

(declare-fun lt!42766 () Bool)

(assert (=> d!23711 (= lt!42765 lt!42766)))

(declare-fun lt!42767 () Unit!2620)

(declare-fun e!58053 () Unit!2620)

(assert (=> d!23711 (= lt!42767 e!58053)))

(declare-fun c!14793 () Bool)

(assert (=> d!23711 (= c!14793 lt!42766)))

(assert (=> d!23711 (= lt!42766 (containsKey!146 (toList!740 lt!42568) (_1!1111 lt!42410)))))

(assert (=> d!23711 (= (contains!754 lt!42568 (_1!1111 lt!42410)) lt!42765)))

(declare-fun b!89158 () Bool)

(declare-fun lt!42764 () Unit!2620)

(assert (=> b!89158 (= e!58053 lt!42764)))

(assert (=> b!89158 (= lt!42764 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42568) (_1!1111 lt!42410)))))

(assert (=> b!89158 (isDefined!95 (getValueByKey!143 (toList!740 lt!42568) (_1!1111 lt!42410)))))

(declare-fun b!89159 () Bool)

(declare-fun Unit!2631 () Unit!2620)

(assert (=> b!89159 (= e!58053 Unit!2631)))

(declare-fun b!89160 () Bool)

(assert (=> b!89160 (= e!58052 (isDefined!95 (getValueByKey!143 (toList!740 lt!42568) (_1!1111 lt!42410))))))

(assert (= (and d!23711 c!14793) b!89158))

(assert (= (and d!23711 (not c!14793)) b!89159))

(assert (= (and d!23711 (not res!45594)) b!89160))

(declare-fun m!95395 () Bool)

(assert (=> d!23711 m!95395))

(declare-fun m!95397 () Bool)

(assert (=> b!89158 m!95397))

(assert (=> b!89158 m!95177))

(assert (=> b!89158 m!95177))

(declare-fun m!95399 () Bool)

(assert (=> b!89158 m!95399))

(assert (=> b!89160 m!95177))

(assert (=> b!89160 m!95177))

(assert (=> b!89160 m!95399))

(assert (=> d!23661 d!23711))

(declare-fun b!89172 () Bool)

(declare-fun e!58059 () Option!149)

(assert (=> b!89172 (= e!58059 None!147)))

(declare-fun b!89170 () Bool)

(declare-fun e!58058 () Option!149)

(assert (=> b!89170 (= e!58058 e!58059)))

(declare-fun c!14799 () Bool)

(assert (=> b!89170 (= c!14799 (and ((_ is Cons!1513) lt!42567) (not (= (_1!1111 (h!2105 lt!42567)) (_1!1111 lt!42410)))))))

(declare-fun d!23713 () Bool)

(declare-fun c!14798 () Bool)

(assert (=> d!23713 (= c!14798 (and ((_ is Cons!1513) lt!42567) (= (_1!1111 (h!2105 lt!42567)) (_1!1111 lt!42410))))))

(assert (=> d!23713 (= (getValueByKey!143 lt!42567 (_1!1111 lt!42410)) e!58058)))

(declare-fun b!89169 () Bool)

(assert (=> b!89169 (= e!58058 (Some!148 (_2!1111 (h!2105 lt!42567))))))

(declare-fun b!89171 () Bool)

(assert (=> b!89171 (= e!58059 (getValueByKey!143 (t!5267 lt!42567) (_1!1111 lt!42410)))))

(assert (= (and d!23713 c!14798) b!89169))

(assert (= (and d!23713 (not c!14798)) b!89170))

(assert (= (and b!89170 c!14799) b!89171))

(assert (= (and b!89170 (not c!14799)) b!89172))

(declare-fun m!95401 () Bool)

(assert (=> b!89171 m!95401))

(assert (=> d!23661 d!23713))

(declare-fun d!23715 () Bool)

(assert (=> d!23715 (= (getValueByKey!143 lt!42567 (_1!1111 lt!42410)) (Some!148 (_2!1111 lt!42410)))))

(declare-fun lt!42770 () Unit!2620)

(declare-fun choose!535 (List!1517 (_ BitVec 64) V!3041) Unit!2620)

(assert (=> d!23715 (= lt!42770 (choose!535 lt!42567 (_1!1111 lt!42410) (_2!1111 lt!42410)))))

(declare-fun e!58062 () Bool)

(assert (=> d!23715 e!58062))

(declare-fun res!45599 () Bool)

(assert (=> d!23715 (=> (not res!45599) (not e!58062))))

(declare-fun isStrictlySorted!287 (List!1517) Bool)

(assert (=> d!23715 (= res!45599 (isStrictlySorted!287 lt!42567))))

(assert (=> d!23715 (= (lemmaContainsTupThenGetReturnValue!60 lt!42567 (_1!1111 lt!42410) (_2!1111 lt!42410)) lt!42770)))

(declare-fun b!89177 () Bool)

(declare-fun res!45600 () Bool)

(assert (=> b!89177 (=> (not res!45600) (not e!58062))))

(assert (=> b!89177 (= res!45600 (containsKey!146 lt!42567 (_1!1111 lt!42410)))))

(declare-fun b!89178 () Bool)

(assert (=> b!89178 (= e!58062 (contains!755 lt!42567 (tuple2!2201 (_1!1111 lt!42410) (_2!1111 lt!42410))))))

(assert (= (and d!23715 res!45599) b!89177))

(assert (= (and b!89177 res!45600) b!89178))

(assert (=> d!23715 m!95171))

(declare-fun m!95403 () Bool)

(assert (=> d!23715 m!95403))

(declare-fun m!95405 () Bool)

(assert (=> d!23715 m!95405))

(declare-fun m!95407 () Bool)

(assert (=> b!89177 m!95407))

(declare-fun m!95409 () Bool)

(assert (=> b!89178 m!95409))

(assert (=> d!23661 d!23715))

(declare-fun b!89199 () Bool)

(declare-fun e!58073 () List!1517)

(declare-fun call!8632 () List!1517)

(assert (=> b!89199 (= e!58073 call!8632)))

(declare-fun b!89200 () Bool)

(declare-fun e!58075 () List!1517)

(assert (=> b!89200 (= e!58075 (insertStrictlySorted!63 (t!5267 (toList!740 lt!42401)) (_1!1111 lt!42410) (_2!1111 lt!42410)))))

(declare-fun b!89201 () Bool)

(declare-fun e!58076 () List!1517)

(declare-fun call!8633 () List!1517)

(assert (=> b!89201 (= e!58076 call!8633)))

(declare-fun c!14808 () Bool)

(declare-fun call!8634 () List!1517)

(declare-fun bm!8629 () Bool)

(declare-fun $colon$colon!73 (List!1517 tuple2!2200) List!1517)

(assert (=> bm!8629 (= call!8634 ($colon$colon!73 e!58075 (ite c!14808 (h!2105 (toList!740 lt!42401)) (tuple2!2201 (_1!1111 lt!42410) (_2!1111 lt!42410)))))))

(declare-fun c!14810 () Bool)

(assert (=> bm!8629 (= c!14810 c!14808)))

(declare-fun b!89202 () Bool)

(declare-fun res!45605 () Bool)

(declare-fun e!58077 () Bool)

(assert (=> b!89202 (=> (not res!45605) (not e!58077))))

(declare-fun lt!42773 () List!1517)

(assert (=> b!89202 (= res!45605 (containsKey!146 lt!42773 (_1!1111 lt!42410)))))

(declare-fun b!89203 () Bool)

(assert (=> b!89203 (= e!58077 (contains!755 lt!42773 (tuple2!2201 (_1!1111 lt!42410) (_2!1111 lt!42410))))))

(declare-fun b!89204 () Bool)

(assert (=> b!89204 (= e!58076 call!8633)))

(declare-fun d!23717 () Bool)

(assert (=> d!23717 e!58077))

(declare-fun res!45606 () Bool)

(assert (=> d!23717 (=> (not res!45606) (not e!58077))))

(assert (=> d!23717 (= res!45606 (isStrictlySorted!287 lt!42773))))

(declare-fun e!58074 () List!1517)

(assert (=> d!23717 (= lt!42773 e!58074)))

(assert (=> d!23717 (= c!14808 (and ((_ is Cons!1513) (toList!740 lt!42401)) (bvslt (_1!1111 (h!2105 (toList!740 lt!42401))) (_1!1111 lt!42410))))))

(assert (=> d!23717 (isStrictlySorted!287 (toList!740 lt!42401))))

(assert (=> d!23717 (= (insertStrictlySorted!63 (toList!740 lt!42401) (_1!1111 lt!42410) (_2!1111 lt!42410)) lt!42773)))

(declare-fun b!89205 () Bool)

(assert (=> b!89205 (= e!58074 e!58073)))

(declare-fun c!14809 () Bool)

(assert (=> b!89205 (= c!14809 (and ((_ is Cons!1513) (toList!740 lt!42401)) (= (_1!1111 (h!2105 (toList!740 lt!42401))) (_1!1111 lt!42410))))))

(declare-fun c!14811 () Bool)

(declare-fun b!89206 () Bool)

(assert (=> b!89206 (= e!58075 (ite c!14809 (t!5267 (toList!740 lt!42401)) (ite c!14811 (Cons!1513 (h!2105 (toList!740 lt!42401)) (t!5267 (toList!740 lt!42401))) Nil!1514)))))

(declare-fun bm!8630 () Bool)

(assert (=> bm!8630 (= call!8632 call!8634)))

(declare-fun b!89207 () Bool)

(assert (=> b!89207 (= c!14811 (and ((_ is Cons!1513) (toList!740 lt!42401)) (bvsgt (_1!1111 (h!2105 (toList!740 lt!42401))) (_1!1111 lt!42410))))))

(assert (=> b!89207 (= e!58073 e!58076)))

(declare-fun b!89208 () Bool)

(assert (=> b!89208 (= e!58074 call!8634)))

(declare-fun bm!8631 () Bool)

(assert (=> bm!8631 (= call!8633 call!8632)))

(assert (= (and d!23717 c!14808) b!89208))

(assert (= (and d!23717 (not c!14808)) b!89205))

(assert (= (and b!89205 c!14809) b!89199))

(assert (= (and b!89205 (not c!14809)) b!89207))

(assert (= (and b!89207 c!14811) b!89204))

(assert (= (and b!89207 (not c!14811)) b!89201))

(assert (= (or b!89204 b!89201) bm!8631))

(assert (= (or b!89199 bm!8631) bm!8630))

(assert (= (or b!89208 bm!8630) bm!8629))

(assert (= (and bm!8629 c!14810) b!89200))

(assert (= (and bm!8629 (not c!14810)) b!89206))

(assert (= (and d!23717 res!45606) b!89202))

(assert (= (and b!89202 res!45605) b!89203))

(declare-fun m!95411 () Bool)

(assert (=> b!89203 m!95411))

(declare-fun m!95413 () Bool)

(assert (=> d!23717 m!95413))

(declare-fun m!95415 () Bool)

(assert (=> d!23717 m!95415))

(declare-fun m!95417 () Bool)

(assert (=> b!89200 m!95417))

(declare-fun m!95419 () Bool)

(assert (=> b!89202 m!95419))

(declare-fun m!95421 () Bool)

(assert (=> bm!8629 m!95421))

(assert (=> d!23661 d!23717))

(declare-fun d!23719 () Bool)

(declare-fun e!58078 () Bool)

(assert (=> d!23719 e!58078))

(declare-fun res!45607 () Bool)

(assert (=> d!23719 (=> res!45607 e!58078)))

(declare-fun lt!42775 () Bool)

(assert (=> d!23719 (= res!45607 (not lt!42775))))

(declare-fun lt!42776 () Bool)

(assert (=> d!23719 (= lt!42775 lt!42776)))

(declare-fun lt!42777 () Unit!2620)

(declare-fun e!58079 () Unit!2620)

(assert (=> d!23719 (= lt!42777 e!58079)))

(declare-fun c!14812 () Bool)

(assert (=> d!23719 (= c!14812 lt!42776)))

(assert (=> d!23719 (= lt!42776 (containsKey!146 (toList!740 lt!42758) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23719 (= (contains!754 lt!42758 #b0000000000000000000000000000000000000000000000000000000000000000) lt!42775)))

(declare-fun b!89209 () Bool)

(declare-fun lt!42774 () Unit!2620)

(assert (=> b!89209 (= e!58079 lt!42774)))

(assert (=> b!89209 (= lt!42774 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42758) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89209 (isDefined!95 (getValueByKey!143 (toList!740 lt!42758) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89210 () Bool)

(declare-fun Unit!2632 () Unit!2620)

(assert (=> b!89210 (= e!58079 Unit!2632)))

(declare-fun b!89211 () Bool)

(assert (=> b!89211 (= e!58078 (isDefined!95 (getValueByKey!143 (toList!740 lt!42758) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23719 c!14812) b!89209))

(assert (= (and d!23719 (not c!14812)) b!89210))

(assert (= (and d!23719 (not res!45607)) b!89211))

(declare-fun m!95423 () Bool)

(assert (=> d!23719 m!95423))

(declare-fun m!95425 () Bool)

(assert (=> b!89209 m!95425))

(declare-fun m!95427 () Bool)

(assert (=> b!89209 m!95427))

(assert (=> b!89209 m!95427))

(declare-fun m!95429 () Bool)

(assert (=> b!89209 m!95429))

(assert (=> b!89211 m!95427))

(assert (=> b!89211 m!95427))

(assert (=> b!89211 m!95429))

(assert (=> bm!8621 d!23719))

(declare-fun b!89212 () Bool)

(declare-fun e!58080 () Bool)

(declare-fun e!58081 () Bool)

(assert (=> b!89212 (= e!58080 e!58081)))

(declare-fun c!14813 () Bool)

(assert (=> b!89212 (= c!14813 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!8632 () Bool)

(declare-fun call!8635 () Bool)

(assert (=> bm!8632 (= call!8635 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4049 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun d!23721 () Bool)

(declare-fun res!45609 () Bool)

(assert (=> d!23721 (=> res!45609 e!58080)))

(assert (=> d!23721 (= res!45609 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> d!23721 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4049 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992)))) e!58080)))

(declare-fun b!89213 () Bool)

(declare-fun e!58082 () Bool)

(assert (=> b!89213 (= e!58081 e!58082)))

(declare-fun lt!42778 () (_ BitVec 64))

(assert (=> b!89213 (= lt!42778 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!42780 () Unit!2620)

(assert (=> b!89213 (= lt!42780 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) lt!42778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!89213 (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) lt!42778 #b00000000000000000000000000000000)))

(declare-fun lt!42779 () Unit!2620)

(assert (=> b!89213 (= lt!42779 lt!42780)))

(declare-fun res!45608 () Bool)

(assert (=> b!89213 (= res!45608 (= (seekEntryOrOpen!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4049 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992)))) (Found!239 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!89213 (=> (not res!45608) (not e!58082))))

(declare-fun b!89214 () Bool)

(assert (=> b!89214 (= e!58081 call!8635)))

(declare-fun b!89215 () Bool)

(assert (=> b!89215 (= e!58082 call!8635)))

(assert (= (and d!23721 (not res!45609)) b!89212))

(assert (= (and b!89212 c!14813) b!89213))

(assert (= (and b!89212 (not c!14813)) b!89214))

(assert (= (and b!89213 res!45608) b!89215))

(assert (= (or b!89215 b!89214) bm!8632))

(declare-fun m!95431 () Bool)

(assert (=> b!89212 m!95431))

(assert (=> b!89212 m!95431))

(declare-fun m!95433 () Bool)

(assert (=> b!89212 m!95433))

(declare-fun m!95435 () Bool)

(assert (=> bm!8632 m!95435))

(assert (=> b!89213 m!95431))

(declare-fun m!95437 () Bool)

(assert (=> b!89213 m!95437))

(declare-fun m!95439 () Bool)

(assert (=> b!89213 m!95439))

(assert (=> b!89213 m!95431))

(declare-fun m!95441 () Bool)

(assert (=> b!89213 m!95441))

(assert (=> bm!8525 d!23721))

(declare-fun d!23723 () Bool)

(declare-fun e!58083 () Bool)

(assert (=> d!23723 e!58083))

(declare-fun res!45610 () Bool)

(assert (=> d!23723 (=> res!45610 e!58083)))

(declare-fun lt!42782 () Bool)

(assert (=> d!23723 (= res!45610 (not lt!42782))))

(declare-fun lt!42783 () Bool)

(assert (=> d!23723 (= lt!42782 lt!42783)))

(declare-fun lt!42784 () Unit!2620)

(declare-fun e!58084 () Unit!2620)

(assert (=> d!23723 (= lt!42784 e!58084)))

(declare-fun c!14814 () Bool)

(assert (=> d!23723 (= c!14814 lt!42783)))

(assert (=> d!23723 (= lt!42783 (containsKey!146 (toList!740 lt!42577) (_1!1111 lt!42410)))))

(assert (=> d!23723 (= (contains!754 lt!42577 (_1!1111 lt!42410)) lt!42782)))

(declare-fun b!89216 () Bool)

(declare-fun lt!42781 () Unit!2620)

(assert (=> b!89216 (= e!58084 lt!42781)))

(assert (=> b!89216 (= lt!42781 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42577) (_1!1111 lt!42410)))))

(assert (=> b!89216 (isDefined!95 (getValueByKey!143 (toList!740 lt!42577) (_1!1111 lt!42410)))))

(declare-fun b!89217 () Bool)

(declare-fun Unit!2633 () Unit!2620)

(assert (=> b!89217 (= e!58084 Unit!2633)))

(declare-fun b!89218 () Bool)

(assert (=> b!89218 (= e!58083 (isDefined!95 (getValueByKey!143 (toList!740 lt!42577) (_1!1111 lt!42410))))))

(assert (= (and d!23723 c!14814) b!89216))

(assert (= (and d!23723 (not c!14814)) b!89217))

(assert (= (and d!23723 (not res!45610)) b!89218))

(declare-fun m!95443 () Bool)

(assert (=> d!23723 m!95443))

(declare-fun m!95445 () Bool)

(assert (=> b!89216 m!95445))

(assert (=> b!89216 m!95211))

(assert (=> b!89216 m!95211))

(declare-fun m!95447 () Bool)

(assert (=> b!89216 m!95447))

(assert (=> b!89218 m!95211))

(assert (=> b!89218 m!95211))

(assert (=> b!89218 m!95447))

(assert (=> d!23669 d!23723))

(declare-fun b!89222 () Bool)

(declare-fun e!58086 () Option!149)

(assert (=> b!89222 (= e!58086 None!147)))

(declare-fun b!89220 () Bool)

(declare-fun e!58085 () Option!149)

(assert (=> b!89220 (= e!58085 e!58086)))

(declare-fun c!14816 () Bool)

(assert (=> b!89220 (= c!14816 (and ((_ is Cons!1513) lt!42576) (not (= (_1!1111 (h!2105 lt!42576)) (_1!1111 lt!42410)))))))

(declare-fun d!23725 () Bool)

(declare-fun c!14815 () Bool)

(assert (=> d!23725 (= c!14815 (and ((_ is Cons!1513) lt!42576) (= (_1!1111 (h!2105 lt!42576)) (_1!1111 lt!42410))))))

(assert (=> d!23725 (= (getValueByKey!143 lt!42576 (_1!1111 lt!42410)) e!58085)))

(declare-fun b!89219 () Bool)

(assert (=> b!89219 (= e!58085 (Some!148 (_2!1111 (h!2105 lt!42576))))))

(declare-fun b!89221 () Bool)

(assert (=> b!89221 (= e!58086 (getValueByKey!143 (t!5267 lt!42576) (_1!1111 lt!42410)))))

(assert (= (and d!23725 c!14815) b!89219))

(assert (= (and d!23725 (not c!14815)) b!89220))

(assert (= (and b!89220 c!14816) b!89221))

(assert (= (and b!89220 (not c!14816)) b!89222))

(declare-fun m!95449 () Bool)

(assert (=> b!89221 m!95449))

(assert (=> d!23669 d!23725))

(declare-fun d!23727 () Bool)

(assert (=> d!23727 (= (getValueByKey!143 lt!42576 (_1!1111 lt!42410)) (Some!148 (_2!1111 lt!42410)))))

(declare-fun lt!42785 () Unit!2620)

(assert (=> d!23727 (= lt!42785 (choose!535 lt!42576 (_1!1111 lt!42410) (_2!1111 lt!42410)))))

(declare-fun e!58087 () Bool)

(assert (=> d!23727 e!58087))

(declare-fun res!45611 () Bool)

(assert (=> d!23727 (=> (not res!45611) (not e!58087))))

(assert (=> d!23727 (= res!45611 (isStrictlySorted!287 lt!42576))))

(assert (=> d!23727 (= (lemmaContainsTupThenGetReturnValue!60 lt!42576 (_1!1111 lt!42410) (_2!1111 lt!42410)) lt!42785)))

(declare-fun b!89223 () Bool)

(declare-fun res!45612 () Bool)

(assert (=> b!89223 (=> (not res!45612) (not e!58087))))

(assert (=> b!89223 (= res!45612 (containsKey!146 lt!42576 (_1!1111 lt!42410)))))

(declare-fun b!89224 () Bool)

(assert (=> b!89224 (= e!58087 (contains!755 lt!42576 (tuple2!2201 (_1!1111 lt!42410) (_2!1111 lt!42410))))))

(assert (= (and d!23727 res!45611) b!89223))

(assert (= (and b!89223 res!45612) b!89224))

(assert (=> d!23727 m!95205))

(declare-fun m!95451 () Bool)

(assert (=> d!23727 m!95451))

(declare-fun m!95453 () Bool)

(assert (=> d!23727 m!95453))

(declare-fun m!95455 () Bool)

(assert (=> b!89223 m!95455))

(declare-fun m!95457 () Bool)

(assert (=> b!89224 m!95457))

(assert (=> d!23669 d!23727))

(declare-fun b!89225 () Bool)

(declare-fun e!58088 () List!1517)

(declare-fun call!8636 () List!1517)

(assert (=> b!89225 (= e!58088 call!8636)))

(declare-fun b!89226 () Bool)

(declare-fun e!58090 () List!1517)

(assert (=> b!89226 (= e!58090 (insertStrictlySorted!63 (t!5267 (toList!740 lt!42397)) (_1!1111 lt!42410) (_2!1111 lt!42410)))))

(declare-fun b!89227 () Bool)

(declare-fun e!58091 () List!1517)

(declare-fun call!8637 () List!1517)

(assert (=> b!89227 (= e!58091 call!8637)))

(declare-fun c!14817 () Bool)

(declare-fun bm!8633 () Bool)

(declare-fun call!8638 () List!1517)

(assert (=> bm!8633 (= call!8638 ($colon$colon!73 e!58090 (ite c!14817 (h!2105 (toList!740 lt!42397)) (tuple2!2201 (_1!1111 lt!42410) (_2!1111 lt!42410)))))))

(declare-fun c!14819 () Bool)

(assert (=> bm!8633 (= c!14819 c!14817)))

(declare-fun b!89228 () Bool)

(declare-fun res!45613 () Bool)

(declare-fun e!58092 () Bool)

(assert (=> b!89228 (=> (not res!45613) (not e!58092))))

(declare-fun lt!42786 () List!1517)

(assert (=> b!89228 (= res!45613 (containsKey!146 lt!42786 (_1!1111 lt!42410)))))

(declare-fun b!89229 () Bool)

(assert (=> b!89229 (= e!58092 (contains!755 lt!42786 (tuple2!2201 (_1!1111 lt!42410) (_2!1111 lt!42410))))))

(declare-fun b!89230 () Bool)

(assert (=> b!89230 (= e!58091 call!8637)))

(declare-fun d!23729 () Bool)

(assert (=> d!23729 e!58092))

(declare-fun res!45614 () Bool)

(assert (=> d!23729 (=> (not res!45614) (not e!58092))))

(assert (=> d!23729 (= res!45614 (isStrictlySorted!287 lt!42786))))

(declare-fun e!58089 () List!1517)

(assert (=> d!23729 (= lt!42786 e!58089)))

(assert (=> d!23729 (= c!14817 (and ((_ is Cons!1513) (toList!740 lt!42397)) (bvslt (_1!1111 (h!2105 (toList!740 lt!42397))) (_1!1111 lt!42410))))))

(assert (=> d!23729 (isStrictlySorted!287 (toList!740 lt!42397))))

(assert (=> d!23729 (= (insertStrictlySorted!63 (toList!740 lt!42397) (_1!1111 lt!42410) (_2!1111 lt!42410)) lt!42786)))

(declare-fun b!89231 () Bool)

(assert (=> b!89231 (= e!58089 e!58088)))

(declare-fun c!14818 () Bool)

(assert (=> b!89231 (= c!14818 (and ((_ is Cons!1513) (toList!740 lt!42397)) (= (_1!1111 (h!2105 (toList!740 lt!42397))) (_1!1111 lt!42410))))))

(declare-fun b!89232 () Bool)

(declare-fun c!14820 () Bool)

(assert (=> b!89232 (= e!58090 (ite c!14818 (t!5267 (toList!740 lt!42397)) (ite c!14820 (Cons!1513 (h!2105 (toList!740 lt!42397)) (t!5267 (toList!740 lt!42397))) Nil!1514)))))

(declare-fun bm!8634 () Bool)

(assert (=> bm!8634 (= call!8636 call!8638)))

(declare-fun b!89233 () Bool)

(assert (=> b!89233 (= c!14820 (and ((_ is Cons!1513) (toList!740 lt!42397)) (bvsgt (_1!1111 (h!2105 (toList!740 lt!42397))) (_1!1111 lt!42410))))))

(assert (=> b!89233 (= e!58088 e!58091)))

(declare-fun b!89234 () Bool)

(assert (=> b!89234 (= e!58089 call!8638)))

(declare-fun bm!8635 () Bool)

(assert (=> bm!8635 (= call!8637 call!8636)))

(assert (= (and d!23729 c!14817) b!89234))

(assert (= (and d!23729 (not c!14817)) b!89231))

(assert (= (and b!89231 c!14818) b!89225))

(assert (= (and b!89231 (not c!14818)) b!89233))

(assert (= (and b!89233 c!14820) b!89230))

(assert (= (and b!89233 (not c!14820)) b!89227))

(assert (= (or b!89230 b!89227) bm!8635))

(assert (= (or b!89225 bm!8635) bm!8634))

(assert (= (or b!89234 bm!8634) bm!8633))

(assert (= (and bm!8633 c!14819) b!89226))

(assert (= (and bm!8633 (not c!14819)) b!89232))

(assert (= (and d!23729 res!45614) b!89228))

(assert (= (and b!89228 res!45613) b!89229))

(declare-fun m!95459 () Bool)

(assert (=> b!89229 m!95459))

(declare-fun m!95461 () Bool)

(assert (=> d!23729 m!95461))

(declare-fun m!95463 () Bool)

(assert (=> d!23729 m!95463))

(declare-fun m!95465 () Bool)

(assert (=> b!89226 m!95465))

(declare-fun m!95467 () Bool)

(assert (=> b!89228 m!95467))

(declare-fun m!95469 () Bool)

(assert (=> bm!8633 m!95469))

(assert (=> d!23669 d!23729))

(declare-fun d!23731 () Bool)

(declare-fun lt!42789 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!94 (List!1516) (InoxSet (_ BitVec 64)))

(assert (=> d!23731 (= lt!42789 (select (content!94 Nil!1513) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun e!58098 () Bool)

(assert (=> d!23731 (= lt!42789 e!58098)))

(declare-fun res!45619 () Bool)

(assert (=> d!23731 (=> (not res!45619) (not e!58098))))

(assert (=> d!23731 (= res!45619 ((_ is Cons!1512) Nil!1513))))

(assert (=> d!23731 (= (contains!756 Nil!1513 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) lt!42789)))

(declare-fun b!89239 () Bool)

(declare-fun e!58097 () Bool)

(assert (=> b!89239 (= e!58098 e!58097)))

(declare-fun res!45620 () Bool)

(assert (=> b!89239 (=> res!45620 e!58097)))

(assert (=> b!89239 (= res!45620 (= (h!2104 Nil!1513) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun b!89240 () Bool)

(assert (=> b!89240 (= e!58097 (contains!756 (t!5266 Nil!1513) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (= (and d!23731 res!45619) b!89239))

(assert (= (and b!89239 (not res!45620)) b!89240))

(declare-fun m!95471 () Bool)

(assert (=> d!23731 m!95471))

(assert (=> d!23731 m!94891))

(declare-fun m!95473 () Bool)

(assert (=> d!23731 m!95473))

(assert (=> b!89240 m!94891))

(declare-fun m!95475 () Bool)

(assert (=> b!89240 m!95475))

(assert (=> b!88936 d!23731))

(declare-fun b!89244 () Bool)

(declare-fun e!58100 () Option!149)

(assert (=> b!89244 (= e!58100 None!147)))

(declare-fun b!89242 () Bool)

(declare-fun e!58099 () Option!149)

(assert (=> b!89242 (= e!58099 e!58100)))

(declare-fun c!14822 () Bool)

(assert (=> b!89242 (= c!14822 (and ((_ is Cons!1513) (toList!740 lt!42556)) (not (= (_1!1111 (h!2105 (toList!740 lt!42556))) (_1!1111 lt!42406)))))))

(declare-fun d!23733 () Bool)

(declare-fun c!14821 () Bool)

(assert (=> d!23733 (= c!14821 (and ((_ is Cons!1513) (toList!740 lt!42556)) (= (_1!1111 (h!2105 (toList!740 lt!42556))) (_1!1111 lt!42406))))))

(assert (=> d!23733 (= (getValueByKey!143 (toList!740 lt!42556) (_1!1111 lt!42406)) e!58099)))

(declare-fun b!89241 () Bool)

(assert (=> b!89241 (= e!58099 (Some!148 (_2!1111 (h!2105 (toList!740 lt!42556)))))))

(declare-fun b!89243 () Bool)

(assert (=> b!89243 (= e!58100 (getValueByKey!143 (t!5267 (toList!740 lt!42556)) (_1!1111 lt!42406)))))

(assert (= (and d!23733 c!14821) b!89241))

(assert (= (and d!23733 (not c!14821)) b!89242))

(assert (= (and b!89242 c!14822) b!89243))

(assert (= (and b!89242 (not c!14822)) b!89244))

(declare-fun m!95477 () Bool)

(assert (=> b!89243 m!95477))

(assert (=> b!88880 d!23733))

(declare-fun b!89245 () Bool)

(declare-fun e!58103 () Bool)

(declare-fun e!58104 () Bool)

(assert (=> b!89245 (= e!58103 e!58104)))

(declare-fun res!45623 () Bool)

(assert (=> b!89245 (=> (not res!45623) (not e!58104))))

(declare-fun e!58102 () Bool)

(assert (=> b!89245 (= res!45623 (not e!58102))))

(declare-fun res!45622 () Bool)

(assert (=> b!89245 (=> (not res!45622) (not e!58102))))

(assert (=> b!89245 (= res!45622 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!89246 () Bool)

(declare-fun e!58101 () Bool)

(declare-fun call!8639 () Bool)

(assert (=> b!89246 (= e!58101 call!8639)))

(declare-fun b!89247 () Bool)

(assert (=> b!89247 (= e!58102 (contains!756 (ite c!14730 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) Nil!1513) Nil!1513) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!89248 () Bool)

(assert (=> b!89248 (= e!58101 call!8639)))

(declare-fun bm!8636 () Bool)

(declare-fun c!14823 () Bool)

(assert (=> bm!8636 (= call!8639 (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!14823 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!14730 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) Nil!1513) Nil!1513)) (ite c!14730 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) Nil!1513) Nil!1513))))))

(declare-fun d!23735 () Bool)

(declare-fun res!45621 () Bool)

(assert (=> d!23735 (=> res!45621 e!58103)))

(assert (=> d!23735 (= res!45621 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> d!23735 (= (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14730 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) Nil!1513) Nil!1513)) e!58103)))

(declare-fun b!89249 () Bool)

(assert (=> b!89249 (= e!58104 e!58101)))

(assert (=> b!89249 (= c!14823 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!23735 (not res!45621)) b!89245))

(assert (= (and b!89245 res!45622) b!89247))

(assert (= (and b!89245 res!45623) b!89249))

(assert (= (and b!89249 c!14823) b!89246))

(assert (= (and b!89249 (not c!14823)) b!89248))

(assert (= (or b!89246 b!89248) bm!8636))

(declare-fun m!95479 () Bool)

(assert (=> b!89245 m!95479))

(assert (=> b!89245 m!95479))

(declare-fun m!95481 () Bool)

(assert (=> b!89245 m!95481))

(assert (=> b!89247 m!95479))

(assert (=> b!89247 m!95479))

(declare-fun m!95483 () Bool)

(assert (=> b!89247 m!95483))

(assert (=> bm!8636 m!95479))

(declare-fun m!95485 () Bool)

(assert (=> bm!8636 m!95485))

(assert (=> b!89249 m!95479))

(assert (=> b!89249 m!95479))

(assert (=> b!89249 m!95481))

(assert (=> bm!8528 d!23735))

(declare-fun d!23737 () Bool)

(declare-fun e!58105 () Bool)

(assert (=> d!23737 e!58105))

(declare-fun res!45624 () Bool)

(assert (=> d!23737 (=> res!45624 e!58105)))

(declare-fun lt!42791 () Bool)

(assert (=> d!23737 (= res!45624 (not lt!42791))))

(declare-fun lt!42792 () Bool)

(assert (=> d!23737 (= lt!42791 lt!42792)))

(declare-fun lt!42793 () Unit!2620)

(declare-fun e!58106 () Unit!2620)

(assert (=> d!23737 (= lt!42793 e!58106)))

(declare-fun c!14824 () Bool)

(assert (=> d!23737 (= c!14824 lt!42792)))

(assert (=> d!23737 (= lt!42792 (containsKey!146 (toList!740 lt!42581) (_1!1111 lt!42408)))))

(assert (=> d!23737 (= (contains!754 lt!42581 (_1!1111 lt!42408)) lt!42791)))

(declare-fun b!89250 () Bool)

(declare-fun lt!42790 () Unit!2620)

(assert (=> b!89250 (= e!58106 lt!42790)))

(assert (=> b!89250 (= lt!42790 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42581) (_1!1111 lt!42408)))))

(assert (=> b!89250 (isDefined!95 (getValueByKey!143 (toList!740 lt!42581) (_1!1111 lt!42408)))))

(declare-fun b!89251 () Bool)

(declare-fun Unit!2634 () Unit!2620)

(assert (=> b!89251 (= e!58106 Unit!2634)))

(declare-fun b!89252 () Bool)

(assert (=> b!89252 (= e!58105 (isDefined!95 (getValueByKey!143 (toList!740 lt!42581) (_1!1111 lt!42408))))))

(assert (= (and d!23737 c!14824) b!89250))

(assert (= (and d!23737 (not c!14824)) b!89251))

(assert (= (and d!23737 (not res!45624)) b!89252))

(declare-fun m!95487 () Bool)

(assert (=> d!23737 m!95487))

(declare-fun m!95489 () Bool)

(assert (=> b!89250 m!95489))

(assert (=> b!89250 m!95223))

(assert (=> b!89250 m!95223))

(declare-fun m!95491 () Bool)

(assert (=> b!89250 m!95491))

(assert (=> b!89252 m!95223))

(assert (=> b!89252 m!95223))

(assert (=> b!89252 m!95491))

(assert (=> d!23671 d!23737))

(declare-fun b!89256 () Bool)

(declare-fun e!58108 () Option!149)

(assert (=> b!89256 (= e!58108 None!147)))

(declare-fun b!89254 () Bool)

(declare-fun e!58107 () Option!149)

(assert (=> b!89254 (= e!58107 e!58108)))

(declare-fun c!14826 () Bool)

(assert (=> b!89254 (= c!14826 (and ((_ is Cons!1513) lt!42580) (not (= (_1!1111 (h!2105 lt!42580)) (_1!1111 lt!42408)))))))

(declare-fun d!23739 () Bool)

(declare-fun c!14825 () Bool)

(assert (=> d!23739 (= c!14825 (and ((_ is Cons!1513) lt!42580) (= (_1!1111 (h!2105 lt!42580)) (_1!1111 lt!42408))))))

(assert (=> d!23739 (= (getValueByKey!143 lt!42580 (_1!1111 lt!42408)) e!58107)))

(declare-fun b!89253 () Bool)

(assert (=> b!89253 (= e!58107 (Some!148 (_2!1111 (h!2105 lt!42580))))))

(declare-fun b!89255 () Bool)

(assert (=> b!89255 (= e!58108 (getValueByKey!143 (t!5267 lt!42580) (_1!1111 lt!42408)))))

(assert (= (and d!23739 c!14825) b!89253))

(assert (= (and d!23739 (not c!14825)) b!89254))

(assert (= (and b!89254 c!14826) b!89255))

(assert (= (and b!89254 (not c!14826)) b!89256))

(declare-fun m!95493 () Bool)

(assert (=> b!89255 m!95493))

(assert (=> d!23671 d!23739))

(declare-fun d!23741 () Bool)

(assert (=> d!23741 (= (getValueByKey!143 lt!42580 (_1!1111 lt!42408)) (Some!148 (_2!1111 lt!42408)))))

(declare-fun lt!42794 () Unit!2620)

(assert (=> d!23741 (= lt!42794 (choose!535 lt!42580 (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(declare-fun e!58109 () Bool)

(assert (=> d!23741 e!58109))

(declare-fun res!45625 () Bool)

(assert (=> d!23741 (=> (not res!45625) (not e!58109))))

(assert (=> d!23741 (= res!45625 (isStrictlySorted!287 lt!42580))))

(assert (=> d!23741 (= (lemmaContainsTupThenGetReturnValue!60 lt!42580 (_1!1111 lt!42408) (_2!1111 lt!42408)) lt!42794)))

(declare-fun b!89257 () Bool)

(declare-fun res!45626 () Bool)

(assert (=> b!89257 (=> (not res!45626) (not e!58109))))

(assert (=> b!89257 (= res!45626 (containsKey!146 lt!42580 (_1!1111 lt!42408)))))

(declare-fun b!89258 () Bool)

(assert (=> b!89258 (= e!58109 (contains!755 lt!42580 (tuple2!2201 (_1!1111 lt!42408) (_2!1111 lt!42408))))))

(assert (= (and d!23741 res!45625) b!89257))

(assert (= (and b!89257 res!45626) b!89258))

(assert (=> d!23741 m!95217))

(declare-fun m!95495 () Bool)

(assert (=> d!23741 m!95495))

(declare-fun m!95497 () Bool)

(assert (=> d!23741 m!95497))

(declare-fun m!95499 () Bool)

(assert (=> b!89257 m!95499))

(declare-fun m!95501 () Bool)

(assert (=> b!89258 m!95501))

(assert (=> d!23671 d!23741))

(declare-fun b!89259 () Bool)

(declare-fun e!58110 () List!1517)

(declare-fun call!8640 () List!1517)

(assert (=> b!89259 (= e!58110 call!8640)))

(declare-fun b!89260 () Bool)

(declare-fun e!58112 () List!1517)

(assert (=> b!89260 (= e!58112 (insertStrictlySorted!63 (t!5267 (toList!740 (+!111 lt!42413 lt!42406))) (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(declare-fun b!89261 () Bool)

(declare-fun e!58113 () List!1517)

(declare-fun call!8641 () List!1517)

(assert (=> b!89261 (= e!58113 call!8641)))

(declare-fun call!8642 () List!1517)

(declare-fun c!14827 () Bool)

(declare-fun bm!8637 () Bool)

(assert (=> bm!8637 (= call!8642 ($colon$colon!73 e!58112 (ite c!14827 (h!2105 (toList!740 (+!111 lt!42413 lt!42406))) (tuple2!2201 (_1!1111 lt!42408) (_2!1111 lt!42408)))))))

(declare-fun c!14829 () Bool)

(assert (=> bm!8637 (= c!14829 c!14827)))

(declare-fun b!89262 () Bool)

(declare-fun res!45627 () Bool)

(declare-fun e!58114 () Bool)

(assert (=> b!89262 (=> (not res!45627) (not e!58114))))

(declare-fun lt!42795 () List!1517)

(assert (=> b!89262 (= res!45627 (containsKey!146 lt!42795 (_1!1111 lt!42408)))))

(declare-fun b!89263 () Bool)

(assert (=> b!89263 (= e!58114 (contains!755 lt!42795 (tuple2!2201 (_1!1111 lt!42408) (_2!1111 lt!42408))))))

(declare-fun b!89264 () Bool)

(assert (=> b!89264 (= e!58113 call!8641)))

(declare-fun d!23743 () Bool)

(assert (=> d!23743 e!58114))

(declare-fun res!45628 () Bool)

(assert (=> d!23743 (=> (not res!45628) (not e!58114))))

(assert (=> d!23743 (= res!45628 (isStrictlySorted!287 lt!42795))))

(declare-fun e!58111 () List!1517)

(assert (=> d!23743 (= lt!42795 e!58111)))

(assert (=> d!23743 (= c!14827 (and ((_ is Cons!1513) (toList!740 (+!111 lt!42413 lt!42406))) (bvslt (_1!1111 (h!2105 (toList!740 (+!111 lt!42413 lt!42406)))) (_1!1111 lt!42408))))))

(assert (=> d!23743 (isStrictlySorted!287 (toList!740 (+!111 lt!42413 lt!42406)))))

(assert (=> d!23743 (= (insertStrictlySorted!63 (toList!740 (+!111 lt!42413 lt!42406)) (_1!1111 lt!42408) (_2!1111 lt!42408)) lt!42795)))

(declare-fun b!89265 () Bool)

(assert (=> b!89265 (= e!58111 e!58110)))

(declare-fun c!14828 () Bool)

(assert (=> b!89265 (= c!14828 (and ((_ is Cons!1513) (toList!740 (+!111 lt!42413 lt!42406))) (= (_1!1111 (h!2105 (toList!740 (+!111 lt!42413 lt!42406)))) (_1!1111 lt!42408))))))

(declare-fun c!14830 () Bool)

(declare-fun b!89266 () Bool)

(assert (=> b!89266 (= e!58112 (ite c!14828 (t!5267 (toList!740 (+!111 lt!42413 lt!42406))) (ite c!14830 (Cons!1513 (h!2105 (toList!740 (+!111 lt!42413 lt!42406))) (t!5267 (toList!740 (+!111 lt!42413 lt!42406)))) Nil!1514)))))

(declare-fun bm!8638 () Bool)

(assert (=> bm!8638 (= call!8640 call!8642)))

(declare-fun b!89267 () Bool)

(assert (=> b!89267 (= c!14830 (and ((_ is Cons!1513) (toList!740 (+!111 lt!42413 lt!42406))) (bvsgt (_1!1111 (h!2105 (toList!740 (+!111 lt!42413 lt!42406)))) (_1!1111 lt!42408))))))

(assert (=> b!89267 (= e!58110 e!58113)))

(declare-fun b!89268 () Bool)

(assert (=> b!89268 (= e!58111 call!8642)))

(declare-fun bm!8639 () Bool)

(assert (=> bm!8639 (= call!8641 call!8640)))

(assert (= (and d!23743 c!14827) b!89268))

(assert (= (and d!23743 (not c!14827)) b!89265))

(assert (= (and b!89265 c!14828) b!89259))

(assert (= (and b!89265 (not c!14828)) b!89267))

(assert (= (and b!89267 c!14830) b!89264))

(assert (= (and b!89267 (not c!14830)) b!89261))

(assert (= (or b!89264 b!89261) bm!8639))

(assert (= (or b!89259 bm!8639) bm!8638))

(assert (= (or b!89268 bm!8638) bm!8637))

(assert (= (and bm!8637 c!14829) b!89260))

(assert (= (and bm!8637 (not c!14829)) b!89266))

(assert (= (and d!23743 res!45628) b!89262))

(assert (= (and b!89262 res!45627) b!89263))

(declare-fun m!95503 () Bool)

(assert (=> b!89263 m!95503))

(declare-fun m!95505 () Bool)

(assert (=> d!23743 m!95505))

(declare-fun m!95507 () Bool)

(assert (=> d!23743 m!95507))

(declare-fun m!95509 () Bool)

(assert (=> b!89260 m!95509))

(declare-fun m!95511 () Bool)

(assert (=> b!89262 m!95511))

(declare-fun m!95513 () Bool)

(assert (=> bm!8637 m!95513))

(assert (=> d!23671 d!23743))

(declare-fun d!23745 () Bool)

(declare-fun e!58115 () Bool)

(assert (=> d!23745 e!58115))

(declare-fun res!45629 () Bool)

(assert (=> d!23745 (=> (not res!45629) (not e!58115))))

(declare-fun lt!42798 () ListLongMap!1449)

(assert (=> d!23745 (= res!45629 (contains!754 lt!42798 (_1!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(declare-fun lt!42797 () List!1517)

(assert (=> d!23745 (= lt!42798 (ListLongMap!1450 lt!42797))))

(declare-fun lt!42799 () Unit!2620)

(declare-fun lt!42796 () Unit!2620)

(assert (=> d!23745 (= lt!42799 lt!42796)))

(assert (=> d!23745 (= (getValueByKey!143 lt!42797 (_1!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23745 (= lt!42796 (lemmaContainsTupThenGetReturnValue!60 lt!42797 (_1!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23745 (= lt!42797 (insertStrictlySorted!63 (toList!740 lt!42397) (_1!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23745 (= (+!111 lt!42397 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42798)))

(declare-fun b!89269 () Bool)

(declare-fun res!45630 () Bool)

(assert (=> b!89269 (=> (not res!45630) (not e!58115))))

(assert (=> b!89269 (= res!45630 (= (getValueByKey!143 (toList!740 lt!42798) (_1!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(declare-fun b!89270 () Bool)

(assert (=> b!89270 (= e!58115 (contains!755 (toList!740 lt!42798) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))))))

(assert (= (and d!23745 res!45629) b!89269))

(assert (= (and b!89269 res!45630) b!89270))

(declare-fun m!95515 () Bool)

(assert (=> d!23745 m!95515))

(declare-fun m!95517 () Bool)

(assert (=> d!23745 m!95517))

(declare-fun m!95519 () Bool)

(assert (=> d!23745 m!95519))

(declare-fun m!95521 () Bool)

(assert (=> d!23745 m!95521))

(declare-fun m!95523 () Bool)

(assert (=> b!89269 m!95523))

(declare-fun m!95525 () Bool)

(assert (=> b!89270 m!95525))

(assert (=> d!23651 d!23745))

(declare-fun d!23747 () Bool)

(assert (=> d!23747 (= (+!111 (+!111 lt!42397 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (+!111 (+!111 lt!42397 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))

(assert (=> d!23747 true))

(declare-fun _$28!150 () Unit!2620)

(assert (=> d!23747 (= (choose!533 lt!42397 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) _$28!150)))

(declare-fun bs!3752 () Bool)

(assert (= bs!3752 d!23747))

(assert (=> bs!3752 m!95095))

(assert (=> bs!3752 m!95095))

(assert (=> bs!3752 m!95097))

(assert (=> bs!3752 m!95101))

(assert (=> bs!3752 m!95101))

(assert (=> bs!3752 m!95103))

(assert (=> d!23651 d!23747))

(declare-fun d!23749 () Bool)

(declare-fun e!58116 () Bool)

(assert (=> d!23749 e!58116))

(declare-fun res!45631 () Bool)

(assert (=> d!23749 (=> (not res!45631) (not e!58116))))

(declare-fun lt!42802 () ListLongMap!1449)

(assert (=> d!23749 (= res!45631 (contains!754 lt!42802 (_1!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(declare-fun lt!42801 () List!1517)

(assert (=> d!23749 (= lt!42802 (ListLongMap!1450 lt!42801))))

(declare-fun lt!42803 () Unit!2620)

(declare-fun lt!42800 () Unit!2620)

(assert (=> d!23749 (= lt!42803 lt!42800)))

(assert (=> d!23749 (= (getValueByKey!143 lt!42801 (_1!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23749 (= lt!42800 (lemmaContainsTupThenGetReturnValue!60 lt!42801 (_1!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23749 (= lt!42801 (insertStrictlySorted!63 (toList!740 (+!111 lt!42397 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (_1!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23749 (= (+!111 (+!111 lt!42397 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42802)))

(declare-fun b!89271 () Bool)

(declare-fun res!45632 () Bool)

(assert (=> b!89271 (=> (not res!45632) (not e!58116))))

(assert (=> b!89271 (= res!45632 (= (getValueByKey!143 (toList!740 lt!42802) (_1!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(declare-fun b!89272 () Bool)

(assert (=> b!89272 (= e!58116 (contains!755 (toList!740 lt!42802) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))))))

(assert (= (and d!23749 res!45631) b!89271))

(assert (= (and b!89271 res!45632) b!89272))

(declare-fun m!95527 () Bool)

(assert (=> d!23749 m!95527))

(declare-fun m!95529 () Bool)

(assert (=> d!23749 m!95529))

(declare-fun m!95531 () Bool)

(assert (=> d!23749 m!95531))

(declare-fun m!95533 () Bool)

(assert (=> d!23749 m!95533))

(declare-fun m!95535 () Bool)

(assert (=> b!89271 m!95535))

(declare-fun m!95537 () Bool)

(assert (=> b!89272 m!95537))

(assert (=> d!23651 d!23749))

(declare-fun d!23751 () Bool)

(declare-fun e!58117 () Bool)

(assert (=> d!23751 e!58117))

(declare-fun res!45633 () Bool)

(assert (=> d!23751 (=> (not res!45633) (not e!58117))))

(declare-fun lt!42806 () ListLongMap!1449)

(assert (=> d!23751 (= res!45633 (contains!754 lt!42806 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(declare-fun lt!42805 () List!1517)

(assert (=> d!23751 (= lt!42806 (ListLongMap!1450 lt!42805))))

(declare-fun lt!42807 () Unit!2620)

(declare-fun lt!42804 () Unit!2620)

(assert (=> d!23751 (= lt!42807 lt!42804)))

(assert (=> d!23751 (= (getValueByKey!143 lt!42805 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23751 (= lt!42804 (lemmaContainsTupThenGetReturnValue!60 lt!42805 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23751 (= lt!42805 (insertStrictlySorted!63 (toList!740 lt!42397) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23751 (= (+!111 lt!42397 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) lt!42806)))

(declare-fun b!89273 () Bool)

(declare-fun res!45634 () Bool)

(assert (=> b!89273 (=> (not res!45634) (not e!58117))))

(assert (=> b!89273 (= res!45634 (= (getValueByKey!143 (toList!740 lt!42806) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))))

(declare-fun b!89274 () Bool)

(assert (=> b!89274 (= e!58117 (contains!755 (toList!740 lt!42806) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))

(assert (= (and d!23751 res!45633) b!89273))

(assert (= (and b!89273 res!45634) b!89274))

(declare-fun m!95539 () Bool)

(assert (=> d!23751 m!95539))

(declare-fun m!95541 () Bool)

(assert (=> d!23751 m!95541))

(declare-fun m!95543 () Bool)

(assert (=> d!23751 m!95543))

(declare-fun m!95545 () Bool)

(assert (=> d!23751 m!95545))

(declare-fun m!95547 () Bool)

(assert (=> b!89273 m!95547))

(declare-fun m!95549 () Bool)

(assert (=> b!89274 m!95549))

(assert (=> d!23651 d!23751))

(declare-fun d!23753 () Bool)

(declare-fun e!58118 () Bool)

(assert (=> d!23753 e!58118))

(declare-fun res!45635 () Bool)

(assert (=> d!23753 (=> (not res!45635) (not e!58118))))

(declare-fun lt!42810 () ListLongMap!1449)

(assert (=> d!23753 (= res!45635 (contains!754 lt!42810 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(declare-fun lt!42809 () List!1517)

(assert (=> d!23753 (= lt!42810 (ListLongMap!1450 lt!42809))))

(declare-fun lt!42811 () Unit!2620)

(declare-fun lt!42808 () Unit!2620)

(assert (=> d!23753 (= lt!42811 lt!42808)))

(assert (=> d!23753 (= (getValueByKey!143 lt!42809 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23753 (= lt!42808 (lemmaContainsTupThenGetReturnValue!60 lt!42809 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23753 (= lt!42809 (insertStrictlySorted!63 (toList!740 (+!111 lt!42397 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23753 (= (+!111 (+!111 lt!42397 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) lt!42810)))

(declare-fun b!89275 () Bool)

(declare-fun res!45636 () Bool)

(assert (=> b!89275 (=> (not res!45636) (not e!58118))))

(assert (=> b!89275 (= res!45636 (= (getValueByKey!143 (toList!740 lt!42810) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))))

(declare-fun b!89276 () Bool)

(assert (=> b!89276 (= e!58118 (contains!755 (toList!740 lt!42810) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))

(assert (= (and d!23753 res!45635) b!89275))

(assert (= (and b!89275 res!45636) b!89276))

(declare-fun m!95551 () Bool)

(assert (=> d!23753 m!95551))

(declare-fun m!95553 () Bool)

(assert (=> d!23753 m!95553))

(declare-fun m!95555 () Bool)

(assert (=> d!23753 m!95555))

(declare-fun m!95557 () Bool)

(assert (=> d!23753 m!95557))

(declare-fun m!95559 () Bool)

(assert (=> b!89275 m!95559))

(declare-fun m!95561 () Bool)

(assert (=> b!89276 m!95561))

(assert (=> d!23651 d!23753))

(declare-fun d!23755 () Bool)

(declare-fun e!58119 () Bool)

(assert (=> d!23755 e!58119))

(declare-fun res!45637 () Bool)

(assert (=> d!23755 (=> res!45637 e!58119)))

(declare-fun lt!42813 () Bool)

(assert (=> d!23755 (= res!45637 (not lt!42813))))

(declare-fun lt!42814 () Bool)

(assert (=> d!23755 (= lt!42813 lt!42814)))

(declare-fun lt!42815 () Unit!2620)

(declare-fun e!58120 () Unit!2620)

(assert (=> d!23755 (= lt!42815 e!58120)))

(declare-fun c!14831 () Bool)

(assert (=> d!23755 (= c!14831 lt!42814)))

(assert (=> d!23755 (= lt!42814 (containsKey!146 (toList!740 lt!42544) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23755 (= (contains!754 lt!42544 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!42813)))

(declare-fun b!89277 () Bool)

(declare-fun lt!42812 () Unit!2620)

(assert (=> b!89277 (= e!58120 lt!42812)))

(assert (=> b!89277 (= lt!42812 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42544) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!89277 (isDefined!95 (getValueByKey!143 (toList!740 lt!42544) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!89278 () Bool)

(declare-fun Unit!2635 () Unit!2620)

(assert (=> b!89278 (= e!58120 Unit!2635)))

(declare-fun b!89279 () Bool)

(assert (=> b!89279 (= e!58119 (isDefined!95 (getValueByKey!143 (toList!740 lt!42544) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23755 c!14831) b!89277))

(assert (= (and d!23755 (not c!14831)) b!89278))

(assert (= (and d!23755 (not res!45637)) b!89279))

(assert (=> d!23755 m!95107))

(declare-fun m!95563 () Bool)

(assert (=> d!23755 m!95563))

(assert (=> b!89277 m!95107))

(declare-fun m!95565 () Bool)

(assert (=> b!89277 m!95565))

(assert (=> b!89277 m!95107))

(declare-fun m!95567 () Bool)

(assert (=> b!89277 m!95567))

(assert (=> b!89277 m!95567))

(declare-fun m!95569 () Bool)

(assert (=> b!89277 m!95569))

(assert (=> b!89279 m!95107))

(assert (=> b!89279 m!95567))

(assert (=> b!89279 m!95567))

(assert (=> b!89279 m!95569))

(assert (=> b!88864 d!23755))

(declare-fun lt!42836 () ListLongMap!1449)

(declare-fun b!89280 () Bool)

(declare-fun e!58123 () Bool)

(assert (=> b!89280 (= e!58123 (= (apply!84 lt!42836 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16))))))

(declare-fun b!89281 () Bool)

(declare-fun e!58131 () ListLongMap!1449)

(declare-fun e!58125 () ListLongMap!1449)

(assert (=> b!89281 (= e!58131 e!58125)))

(declare-fun c!14834 () Bool)

(assert (=> b!89281 (= c!14834 (and (not (= (bvand (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89282 () Bool)

(declare-fun e!58124 () Bool)

(declare-fun e!58128 () Bool)

(assert (=> b!89282 (= e!58124 e!58128)))

(declare-fun res!45638 () Bool)

(declare-fun call!8643 () Bool)

(assert (=> b!89282 (= res!45638 call!8643)))

(assert (=> b!89282 (=> (not res!45638) (not e!58128))))

(declare-fun bm!8640 () Bool)

(declare-fun call!8645 () Bool)

(assert (=> bm!8640 (= call!8645 (contains!754 lt!42836 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89283 () Bool)

(declare-fun e!58133 () Bool)

(assert (=> b!89283 (= e!58133 (not call!8645))))

(declare-fun b!89284 () Bool)

(declare-fun e!58121 () ListLongMap!1449)

(declare-fun call!8649 () ListLongMap!1449)

(assert (=> b!89284 (= e!58121 call!8649)))

(declare-fun b!89285 () Bool)

(declare-fun e!58126 () Unit!2620)

(declare-fun Unit!2636 () Unit!2620)

(assert (=> b!89285 (= e!58126 Unit!2636)))

(declare-fun b!89286 () Bool)

(assert (=> b!89286 (= e!58124 (not call!8643))))

(declare-fun b!89287 () Bool)

(declare-fun res!45644 () Bool)

(declare-fun e!58129 () Bool)

(assert (=> b!89287 (=> (not res!45644) (not e!58129))))

(declare-fun e!58132 () Bool)

(assert (=> b!89287 (= res!45644 e!58132)))

(declare-fun res!45642 () Bool)

(assert (=> b!89287 (=> res!45642 e!58132)))

(declare-fun e!58127 () Bool)

(assert (=> b!89287 (= res!45642 (not e!58127))))

(declare-fun res!45645 () Bool)

(assert (=> b!89287 (=> (not res!45645) (not e!58127))))

(assert (=> b!89287 (= res!45645 (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun d!23757 () Bool)

(assert (=> d!23757 e!58129))

(declare-fun res!45640 () Bool)

(assert (=> d!23757 (=> (not res!45640) (not e!58129))))

(assert (=> d!23757 (= res!45640 (or (bvsge #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))))

(declare-fun lt!42833 () ListLongMap!1449)

(assert (=> d!23757 (= lt!42836 lt!42833)))

(declare-fun lt!42825 () Unit!2620)

(assert (=> d!23757 (= lt!42825 e!58126)))

(declare-fun c!14833 () Bool)

(declare-fun e!58130 () Bool)

(assert (=> d!23757 (= c!14833 e!58130)))

(declare-fun res!45646 () Bool)

(assert (=> d!23757 (=> (not res!45646) (not e!58130))))

(assert (=> d!23757 (= res!45646 (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(assert (=> d!23757 (= lt!42833 e!58131)))

(declare-fun c!14832 () Bool)

(assert (=> d!23757 (= c!14832 (and (not (= (bvand (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23757 (validMask!0 (mask!6415 newMap!16))))

(assert (=> d!23757 (= (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) (zeroValue!2260 newMap!16) (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) lt!42836)))

(declare-fun b!89288 () Bool)

(declare-fun call!8648 () ListLongMap!1449)

(assert (=> b!89288 (= e!58121 call!8648)))

(declare-fun b!89289 () Bool)

(declare-fun c!14836 () Bool)

(assert (=> b!89289 (= c!14836 (and (not (= (bvand (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!89289 (= e!58125 e!58121)))

(declare-fun b!89290 () Bool)

(assert (=> b!89290 (= e!58125 call!8648)))

(declare-fun bm!8641 () Bool)

(declare-fun call!8646 () ListLongMap!1449)

(assert (=> bm!8641 (= call!8646 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) (zeroValue!2260 newMap!16) (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun b!89291 () Bool)

(declare-fun e!58122 () Bool)

(assert (=> b!89291 (= e!58132 e!58122)))

(declare-fun res!45641 () Bool)

(assert (=> b!89291 (=> (not res!45641) (not e!58122))))

(assert (=> b!89291 (= res!45641 (contains!754 lt!42836 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!89291 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun b!89292 () Bool)

(declare-fun call!8647 () ListLongMap!1449)

(assert (=> b!89292 (= e!58131 (+!111 call!8647 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)))))))

(declare-fun b!89293 () Bool)

(declare-fun lt!42820 () Unit!2620)

(assert (=> b!89293 (= e!58126 lt!42820)))

(declare-fun lt!42817 () ListLongMap!1449)

(assert (=> b!89293 (= lt!42817 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) (zeroValue!2260 newMap!16) (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42816 () (_ BitVec 64))

(assert (=> b!89293 (= lt!42816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42824 () (_ BitVec 64))

(assert (=> b!89293 (= lt!42824 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42826 () Unit!2620)

(assert (=> b!89293 (= lt!42826 (addStillContains!60 lt!42817 lt!42816 (zeroValue!2260 newMap!16) lt!42824))))

(assert (=> b!89293 (contains!754 (+!111 lt!42817 (tuple2!2201 lt!42816 (zeroValue!2260 newMap!16))) lt!42824)))

(declare-fun lt!42818 () Unit!2620)

(assert (=> b!89293 (= lt!42818 lt!42826)))

(declare-fun lt!42834 () ListLongMap!1449)

(assert (=> b!89293 (= lt!42834 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) (zeroValue!2260 newMap!16) (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42823 () (_ BitVec 64))

(assert (=> b!89293 (= lt!42823 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42830 () (_ BitVec 64))

(assert (=> b!89293 (= lt!42830 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42829 () Unit!2620)

(assert (=> b!89293 (= lt!42829 (addApplyDifferent!60 lt!42834 lt!42823 (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)) lt!42830))))

(assert (=> b!89293 (= (apply!84 (+!111 lt!42834 (tuple2!2201 lt!42823 (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)))) lt!42830) (apply!84 lt!42834 lt!42830))))

(declare-fun lt!42831 () Unit!2620)

(assert (=> b!89293 (= lt!42831 lt!42829)))

(declare-fun lt!42828 () ListLongMap!1449)

(assert (=> b!89293 (= lt!42828 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) (zeroValue!2260 newMap!16) (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42821 () (_ BitVec 64))

(assert (=> b!89293 (= lt!42821 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42832 () (_ BitVec 64))

(assert (=> b!89293 (= lt!42832 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42827 () Unit!2620)

(assert (=> b!89293 (= lt!42827 (addApplyDifferent!60 lt!42828 lt!42821 (zeroValue!2260 newMap!16) lt!42832))))

(assert (=> b!89293 (= (apply!84 (+!111 lt!42828 (tuple2!2201 lt!42821 (zeroValue!2260 newMap!16))) lt!42832) (apply!84 lt!42828 lt!42832))))

(declare-fun lt!42835 () Unit!2620)

(assert (=> b!89293 (= lt!42835 lt!42827)))

(declare-fun lt!42837 () ListLongMap!1449)

(assert (=> b!89293 (= lt!42837 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) (zeroValue!2260 newMap!16) (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42822 () (_ BitVec 64))

(assert (=> b!89293 (= lt!42822 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42819 () (_ BitVec 64))

(assert (=> b!89293 (= lt!42819 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89293 (= lt!42820 (addApplyDifferent!60 lt!42837 lt!42822 (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)) lt!42819))))

(assert (=> b!89293 (= (apply!84 (+!111 lt!42837 (tuple2!2201 lt!42822 (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16)))) lt!42819) (apply!84 lt!42837 lt!42819))))

(declare-fun bm!8642 () Bool)

(declare-fun call!8644 () ListLongMap!1449)

(assert (=> bm!8642 (= call!8649 call!8644)))

(declare-fun b!89294 () Bool)

(assert (=> b!89294 (= e!58130 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89295 () Bool)

(assert (=> b!89295 (= e!58133 e!58123)))

(declare-fun res!45643 () Bool)

(assert (=> b!89295 (= res!45643 call!8645)))

(assert (=> b!89295 (=> (not res!45643) (not e!58123))))

(declare-fun b!89296 () Bool)

(assert (=> b!89296 (= e!58128 (= (apply!84 lt!42836 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2260 newMap!16)))))

(declare-fun b!89297 () Bool)

(assert (=> b!89297 (= e!58122 (= (apply!84 lt!42836 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)) (get!1217 (select (arr!1923 (_values!2354 newMap!16)) #b00000000000000000000000000000000) (dynLambda!347 (defaultEntry!2371 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89297 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2169 (_values!2354 newMap!16))))))

(assert (=> b!89297 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun bm!8643 () Bool)

(assert (=> bm!8643 (= call!8648 call!8647)))

(declare-fun b!89298 () Bool)

(declare-fun res!45639 () Bool)

(assert (=> b!89298 (=> (not res!45639) (not e!58129))))

(assert (=> b!89298 (= res!45639 e!58124)))

(declare-fun c!14835 () Bool)

(assert (=> b!89298 (= c!14835 (not (= (bvand (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!89299 () Bool)

(assert (=> b!89299 (= e!58129 e!58133)))

(declare-fun c!14837 () Bool)

(assert (=> b!89299 (= c!14837 (not (= (bvand (ite c!14770 (ite c!14772 (extraKeys!2204 newMap!16) lt!42692) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89300 () Bool)

(assert (=> b!89300 (= e!58127 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8644 () Bool)

(assert (=> bm!8644 (= call!8644 call!8646)))

(declare-fun bm!8645 () Bool)

(assert (=> bm!8645 (= call!8647 (+!111 (ite c!14832 call!8646 (ite c!14834 call!8644 call!8649)) (ite (or c!14832 c!14834) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 newMap!16)) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14770 (ite c!14772 (minValue!2260 newMap!16) lt!42407) (minValue!2260 newMap!16))))))))

(declare-fun bm!8646 () Bool)

(assert (=> bm!8646 (= call!8643 (contains!754 lt!42836 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23757 c!14832) b!89292))

(assert (= (and d!23757 (not c!14832)) b!89281))

(assert (= (and b!89281 c!14834) b!89290))

(assert (= (and b!89281 (not c!14834)) b!89289))

(assert (= (and b!89289 c!14836) b!89288))

(assert (= (and b!89289 (not c!14836)) b!89284))

(assert (= (or b!89288 b!89284) bm!8642))

(assert (= (or b!89290 bm!8642) bm!8644))

(assert (= (or b!89290 b!89288) bm!8643))

(assert (= (or b!89292 bm!8644) bm!8641))

(assert (= (or b!89292 bm!8643) bm!8645))

(assert (= (and d!23757 res!45646) b!89294))

(assert (= (and d!23757 c!14833) b!89293))

(assert (= (and d!23757 (not c!14833)) b!89285))

(assert (= (and d!23757 res!45640) b!89287))

(assert (= (and b!89287 res!45645) b!89300))

(assert (= (and b!89287 (not res!45642)) b!89291))

(assert (= (and b!89291 res!45641) b!89297))

(assert (= (and b!89287 res!45644) b!89298))

(assert (= (and b!89298 c!14835) b!89282))

(assert (= (and b!89298 (not c!14835)) b!89286))

(assert (= (and b!89282 res!45638) b!89296))

(assert (= (or b!89282 b!89286) bm!8646))

(assert (= (and b!89298 res!45639) b!89299))

(assert (= (and b!89299 c!14837) b!89295))

(assert (= (and b!89299 (not c!14837)) b!89283))

(assert (= (and b!89295 res!45643) b!89280))

(assert (= (or b!89295 b!89283) bm!8640))

(declare-fun b_lambda!3947 () Bool)

(assert (=> (not b_lambda!3947) (not b!89297)))

(declare-fun t!5278 () Bool)

(declare-fun tb!1729 () Bool)

(assert (=> (and b!88685 (= (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) (defaultEntry!2371 newMap!16)) t!5278) tb!1729))

(declare-fun result!2975 () Bool)

(assert (=> tb!1729 (= result!2975 tp_is_empty!2545)))

(assert (=> b!89297 t!5278))

(declare-fun b_and!5361 () Bool)

(assert (= b_and!5357 (and (=> t!5278 result!2975) b_and!5361)))

(declare-fun t!5280 () Bool)

(declare-fun tb!1731 () Bool)

(assert (=> (and b!88690 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 newMap!16)) t!5280) tb!1731))

(declare-fun result!2977 () Bool)

(assert (= result!2977 result!2975))

(assert (=> b!89297 t!5280))

(declare-fun b_and!5363 () Bool)

(assert (= b_and!5359 (and (=> t!5280 result!2977) b_and!5363)))

(declare-fun m!95571 () Bool)

(assert (=> bm!8645 m!95571))

(declare-fun m!95573 () Bool)

(assert (=> d!23757 m!95573))

(declare-fun m!95575 () Bool)

(assert (=> bm!8640 m!95575))

(declare-fun m!95577 () Bool)

(assert (=> b!89300 m!95577))

(assert (=> b!89300 m!95577))

(declare-fun m!95579 () Bool)

(assert (=> b!89300 m!95579))

(assert (=> b!89294 m!95577))

(assert (=> b!89294 m!95577))

(assert (=> b!89294 m!95579))

(declare-fun m!95581 () Bool)

(assert (=> bm!8646 m!95581))

(declare-fun m!95583 () Bool)

(assert (=> b!89293 m!95583))

(declare-fun m!95585 () Bool)

(assert (=> b!89293 m!95585))

(declare-fun m!95587 () Bool)

(assert (=> b!89293 m!95587))

(declare-fun m!95589 () Bool)

(assert (=> b!89293 m!95589))

(declare-fun m!95591 () Bool)

(assert (=> b!89293 m!95591))

(declare-fun m!95593 () Bool)

(assert (=> b!89293 m!95593))

(declare-fun m!95595 () Bool)

(assert (=> b!89293 m!95595))

(declare-fun m!95597 () Bool)

(assert (=> b!89293 m!95597))

(assert (=> b!89293 m!95597))

(declare-fun m!95599 () Bool)

(assert (=> b!89293 m!95599))

(declare-fun m!95601 () Bool)

(assert (=> b!89293 m!95601))

(assert (=> b!89293 m!95593))

(declare-fun m!95603 () Bool)

(assert (=> b!89293 m!95603))

(declare-fun m!95605 () Bool)

(assert (=> b!89293 m!95605))

(assert (=> b!89293 m!95585))

(declare-fun m!95607 () Bool)

(assert (=> b!89293 m!95607))

(declare-fun m!95609 () Bool)

(assert (=> b!89293 m!95609))

(assert (=> b!89293 m!95577))

(assert (=> b!89293 m!95605))

(declare-fun m!95611 () Bool)

(assert (=> b!89293 m!95611))

(declare-fun m!95613 () Bool)

(assert (=> b!89293 m!95613))

(assert (=> bm!8641 m!95589))

(declare-fun m!95615 () Bool)

(assert (=> b!89280 m!95615))

(declare-fun m!95617 () Bool)

(assert (=> b!89292 m!95617))

(declare-fun m!95619 () Bool)

(assert (=> b!89297 m!95619))

(declare-fun m!95621 () Bool)

(assert (=> b!89297 m!95621))

(declare-fun m!95623 () Bool)

(assert (=> b!89297 m!95623))

(assert (=> b!89297 m!95621))

(assert (=> b!89297 m!95577))

(assert (=> b!89297 m!95577))

(declare-fun m!95625 () Bool)

(assert (=> b!89297 m!95625))

(assert (=> b!89297 m!95619))

(assert (=> b!89291 m!95577))

(assert (=> b!89291 m!95577))

(declare-fun m!95627 () Bool)

(assert (=> b!89291 m!95627))

(declare-fun m!95629 () Bool)

(assert (=> b!89296 m!95629))

(assert (=> bm!8591 d!23757))

(declare-fun d!23759 () Bool)

(declare-fun e!58134 () Bool)

(assert (=> d!23759 e!58134))

(declare-fun res!45647 () Bool)

(assert (=> d!23759 (=> res!45647 e!58134)))

(declare-fun lt!42839 () Bool)

(assert (=> d!23759 (= res!45647 (not lt!42839))))

(declare-fun lt!42840 () Bool)

(assert (=> d!23759 (= lt!42839 lt!42840)))

(declare-fun lt!42841 () Unit!2620)

(declare-fun e!58135 () Unit!2620)

(assert (=> d!23759 (= lt!42841 e!58135)))

(declare-fun c!14838 () Bool)

(assert (=> d!23759 (= c!14838 lt!42840)))

(assert (=> d!23759 (= lt!42840 (containsKey!146 (toList!740 lt!42544) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23759 (= (contains!754 lt!42544 #b0000000000000000000000000000000000000000000000000000000000000000) lt!42839)))

(declare-fun b!89301 () Bool)

(declare-fun lt!42838 () Unit!2620)

(assert (=> b!89301 (= e!58135 lt!42838)))

(assert (=> b!89301 (= lt!42838 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42544) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89301 (isDefined!95 (getValueByKey!143 (toList!740 lt!42544) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89302 () Bool)

(declare-fun Unit!2637 () Unit!2620)

(assert (=> b!89302 (= e!58135 Unit!2637)))

(declare-fun b!89303 () Bool)

(assert (=> b!89303 (= e!58134 (isDefined!95 (getValueByKey!143 (toList!740 lt!42544) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23759 c!14838) b!89301))

(assert (= (and d!23759 (not c!14838)) b!89302))

(assert (= (and d!23759 (not res!45647)) b!89303))

(declare-fun m!95631 () Bool)

(assert (=> d!23759 m!95631))

(declare-fun m!95633 () Bool)

(assert (=> b!89301 m!95633))

(declare-fun m!95635 () Bool)

(assert (=> b!89301 m!95635))

(assert (=> b!89301 m!95635))

(declare-fun m!95637 () Bool)

(assert (=> b!89301 m!95637))

(assert (=> b!89303 m!95635))

(assert (=> b!89303 m!95635))

(assert (=> b!89303 m!95637))

(assert (=> d!23653 d!23759))

(assert (=> d!23653 d!23663))

(declare-fun d!23761 () Bool)

(declare-fun get!1220 (Option!149) V!3041)

(assert (=> d!23761 (= (apply!84 lt!42758 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1220 (getValueByKey!143 (toList!740 lt!42758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3753 () Bool)

(assert (= bs!3753 d!23761))

(declare-fun m!95639 () Bool)

(assert (=> bs!3753 m!95639))

(assert (=> bs!3753 m!95639))

(declare-fun m!95641 () Bool)

(assert (=> bs!3753 m!95641))

(assert (=> b!89119 d!23761))

(declare-fun d!23763 () Bool)

(assert (=> d!23763 (= (apply!84 lt!42544 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1220 (getValueByKey!143 (toList!740 lt!42544) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3754 () Bool)

(assert (= bs!3754 d!23763))

(assert (=> bs!3754 m!95107))

(assert (=> bs!3754 m!95567))

(assert (=> bs!3754 m!95567))

(declare-fun m!95643 () Bool)

(assert (=> bs!3754 m!95643))

(assert (=> b!88874 d!23763))

(declare-fun d!23765 () Bool)

(declare-fun c!14839 () Bool)

(assert (=> d!23765 (= c!14839 ((_ is ValueCellFull!929) (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!58136 () V!3041)

(assert (=> d!23765 (= (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!58136)))

(declare-fun b!89304 () Bool)

(assert (=> b!89304 (= e!58136 (get!1218 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89305 () Bool)

(assert (=> b!89305 (= e!58136 (get!1219 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23765 c!14839) b!89304))

(assert (= (and d!23765 (not c!14839)) b!89305))

(assert (=> b!89304 m!95111))

(assert (=> b!89304 m!94941))

(declare-fun m!95645 () Bool)

(assert (=> b!89304 m!95645))

(assert (=> b!89305 m!95111))

(assert (=> b!89305 m!94941))

(declare-fun m!95647 () Bool)

(assert (=> b!89305 m!95647))

(assert (=> b!88874 d!23765))

(declare-fun call!8659 () Bool)

(declare-fun bm!8655 () Bool)

(assert (=> bm!8655 (= call!8659 (arrayContainsKey!0 (_keys!4049 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!89340 () Bool)

(declare-fun c!14851 () Bool)

(declare-fun lt!42924 () SeekEntryResult!239)

(assert (=> b!89340 (= c!14851 ((_ is MissingVacant!239) lt!42924))))

(declare-fun e!58158 () Bool)

(declare-fun e!58157 () Bool)

(assert (=> b!89340 (= e!58158 e!58157)))

(declare-fun b!89341 () Bool)

(declare-fun e!58154 () Unit!2620)

(declare-fun Unit!2638 () Unit!2620)

(assert (=> b!89341 (= e!58154 Unit!2638)))

(declare-fun b!89342 () Bool)

(declare-fun e!58156 () Bool)

(assert (=> b!89342 (= e!58156 (not call!8659))))

(declare-fun b!89343 () Bool)

(declare-fun e!58155 () Bool)

(assert (=> b!89343 (= e!58157 e!58155)))

(declare-fun res!45669 () Bool)

(declare-fun call!8660 () Bool)

(assert (=> b!89343 (= res!45669 call!8660)))

(assert (=> b!89343 (=> (not res!45669) (not e!58155))))

(declare-fun call!8658 () Bool)

(declare-fun c!14850 () Bool)

(declare-fun lt!42917 () SeekEntryResult!239)

(declare-fun c!14849 () Bool)

(declare-fun bm!8656 () Bool)

(assert (=> bm!8656 (= call!8658 (inRange!0 (ite c!14849 (index!3096 lt!42917) (ite c!14850 (index!3095 lt!42924) (index!3098 lt!42924))) (mask!6415 newMap!16)))))

(declare-fun b!89344 () Bool)

(declare-fun res!45672 () Bool)

(assert (=> b!89344 (=> (not res!45672) (not e!58156))))

(assert (=> b!89344 (= res!45672 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3095 lt!42924)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89345 () Bool)

(declare-fun Unit!2639 () Unit!2620)

(assert (=> b!89345 (= e!58154 Unit!2639)))

(declare-fun lt!42908 () Unit!2620)

(declare-fun lemmaArrayContainsKeyThenInListMap!21 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) (_ BitVec 32) Int) Unit!2620)

(assert (=> b!89345 (= lt!42908 (lemmaArrayContainsKeyThenInListMap!21 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(assert (=> b!89345 (contains!754 (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355))))

(declare-fun lt!42930 () Unit!2620)

(assert (=> b!89345 (= lt!42930 lt!42908)))

(assert (=> b!89345 false))

(declare-fun b!89346 () Bool)

(declare-fun res!45668 () Bool)

(declare-fun e!58159 () Bool)

(assert (=> b!89346 (=> (not res!45668) (not e!58159))))

(declare-fun lt!42910 () tuple2!2202)

(assert (=> b!89346 (= res!45668 (contains!754 (map!1203 (_2!1112 lt!42910)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun d!23767 () Bool)

(assert (=> d!23767 e!58159))

(declare-fun res!45673 () Bool)

(assert (=> d!23767 (=> (not res!45673) (not e!58159))))

(assert (=> d!23767 (= res!45673 (_1!1112 lt!42910))))

(assert (=> d!23767 (= lt!42910 (tuple2!2203 true (LongMapFixedSize!767 (defaultEntry!2371 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (bvadd (_size!432 newMap!16) #b00000000000000000000000000000001) (array!4040 (store (arr!1922 (_keys!4049 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) (size!2168 (_keys!4049 newMap!16))) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16))) (_vacant!432 newMap!16))))))

(declare-fun lt!42927 () Unit!2620)

(declare-fun lt!42913 () Unit!2620)

(assert (=> d!23767 (= lt!42927 lt!42913)))

(declare-fun lt!42916 () array!4039)

(declare-fun lt!42929 () array!4041)

(assert (=> d!23767 (contains!754 (getCurrentListMap!433 lt!42916 lt!42929 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (select (store (arr!1922 (_keys!4049 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678))))))

(assert (=> d!23767 (= lt!42913 (lemmaValidKeyInArrayIsInListMap!93 lt!42916 lt!42929 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (defaultEntry!2371 newMap!16)))))

(assert (=> d!23767 (= lt!42929 (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16))))))

(assert (=> d!23767 (= lt!42916 (array!4040 (store (arr!1922 (_keys!4049 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) (size!2168 (_keys!4049 newMap!16))))))

(declare-fun lt!42911 () Unit!2620)

(declare-fun lt!42909 () Unit!2620)

(assert (=> d!23767 (= lt!42911 lt!42909)))

(declare-fun lt!42931 () array!4039)

(assert (=> d!23767 (= (arrayCountValidKeys!0 lt!42931 (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (bvadd (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4039 (_ BitVec 32)) Unit!2620)

(assert (=> d!23767 (= lt!42909 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!42931 (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678))))))

(assert (=> d!23767 (= lt!42931 (array!4040 (store (arr!1922 (_keys!4049 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) (size!2168 (_keys!4049 newMap!16))))))

(declare-fun lt!42904 () Unit!2620)

(declare-fun lt!42926 () Unit!2620)

(assert (=> d!23767 (= lt!42904 lt!42926)))

(declare-fun lt!42903 () array!4039)

(assert (=> d!23767 (arrayContainsKey!0 lt!42903 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!23767 (= lt!42926 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!42903 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678))))))

(assert (=> d!23767 (= lt!42903 (array!4040 (store (arr!1922 (_keys!4049 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) (size!2168 (_keys!4049 newMap!16))))))

(declare-fun lt!42915 () Unit!2620)

(declare-fun lt!42928 () Unit!2620)

(assert (=> d!23767 (= lt!42915 lt!42928)))

(assert (=> d!23767 (= (+!111 (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (getCurrentListMap!433 (array!4040 (store (arr!1922 (_keys!4049 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) (size!2168 (_keys!4049 newMap!16))) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16))) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!21 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) (_ BitVec 64) V!3041 Int) Unit!2620)

(assert (=> d!23767 (= lt!42928 (lemmaAddValidKeyToArrayThenAddPairToListMap!21 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42907 () Unit!2620)

(declare-fun lt!42912 () Unit!2620)

(assert (=> d!23767 (= lt!42907 lt!42912)))

(assert (=> d!23767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4040 (store (arr!1922 (_keys!4049 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) (size!2168 (_keys!4049 newMap!16))) (mask!6415 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4039 (_ BitVec 32) (_ BitVec 32)) Unit!2620)

(assert (=> d!23767 (= lt!42912 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (_keys!4049 newMap!16) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (mask!6415 newMap!16)))))

(declare-fun lt!42923 () Unit!2620)

(declare-fun lt!42919 () Unit!2620)

(assert (=> d!23767 (= lt!42923 lt!42919)))

(assert (=> d!23767 (= (arrayCountValidKeys!0 (array!4040 (store (arr!1922 (_keys!4049 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) (size!2168 (_keys!4049 newMap!16))) #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4049 newMap!16) #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4039 (_ BitVec 32) (_ BitVec 64)) Unit!2620)

(assert (=> d!23767 (= lt!42919 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4049 newMap!16) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun lt!42925 () Unit!2620)

(declare-fun lt!42914 () Unit!2620)

(assert (=> d!23767 (= lt!42925 lt!42914)))

(declare-fun lt!42902 () List!1516)

(declare-fun lt!42922 () (_ BitVec 32))

(assert (=> d!23767 (arrayNoDuplicates!0 (array!4040 (store (arr!1922 (_keys!4049 newMap!16)) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) (size!2168 (_keys!4049 newMap!16))) lt!42922 lt!42902)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4039 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1516) Unit!2620)

(assert (=> d!23767 (= lt!42914 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4049 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678)) lt!42922 lt!42902))))

(assert (=> d!23767 (= lt!42902 Nil!1513)))

(assert (=> d!23767 (= lt!42922 #b00000000000000000000000000000000)))

(declare-fun lt!42906 () Unit!2620)

(assert (=> d!23767 (= lt!42906 e!58154)))

(declare-fun c!14848 () Bool)

(assert (=> d!23767 (= c!14848 (arrayContainsKey!0 (_keys!4049 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!42921 () Unit!2620)

(declare-fun e!58160 () Unit!2620)

(assert (=> d!23767 (= lt!42921 e!58160)))

(assert (=> d!23767 (= c!14849 (contains!754 (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> d!23767 (valid!343 newMap!16)))

(assert (=> d!23767 (= (updateHelperNewKey!33 newMap!16 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 (ite c!14766 (index!3098 lt!42678) (index!3095 lt!42678))) lt!42910)))

(declare-fun b!89347 () Bool)

(assert (=> b!89347 (= e!58155 (not call!8659))))

(declare-fun b!89348 () Bool)

(declare-fun Unit!2640 () Unit!2620)

(assert (=> b!89348 (= e!58160 Unit!2640)))

(declare-fun lt!42905 () Unit!2620)

(assert (=> b!89348 (= lt!42905 (lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(declare-fun call!8661 () SeekEntryResult!239)

(assert (=> b!89348 (= lt!42917 call!8661)))

(declare-fun res!45670 () Bool)

(assert (=> b!89348 (= res!45670 ((_ is Found!239) lt!42917))))

(declare-fun e!58153 () Bool)

(assert (=> b!89348 (=> (not res!45670) (not e!58153))))

(assert (=> b!89348 e!58153))

(declare-fun lt!42918 () Unit!2620)

(assert (=> b!89348 (= lt!42918 lt!42905)))

(assert (=> b!89348 false))

(declare-fun b!89349 () Bool)

(declare-fun res!45667 () Bool)

(assert (=> b!89349 (=> (not res!45667) (not e!58159))))

(assert (=> b!89349 (= res!45667 (valid!343 (_2!1112 lt!42910)))))

(declare-fun b!89350 () Bool)

(declare-fun res!45674 () Bool)

(assert (=> b!89350 (=> (not res!45674) (not e!58156))))

(assert (=> b!89350 (= res!45674 call!8660)))

(assert (=> b!89350 (= e!58158 e!58156)))

(declare-fun b!89351 () Bool)

(assert (=> b!89351 (= e!58157 ((_ is Undefined!239) lt!42924))))

(declare-fun bm!8657 () Bool)

(assert (=> bm!8657 (= call!8661 (seekEntryOrOpen!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (_keys!4049 newMap!16) (mask!6415 newMap!16)))))

(declare-fun b!89352 () Bool)

(assert (=> b!89352 (= e!58159 (= (map!1203 (_2!1112 lt!42910)) (+!111 (map!1203 newMap!16) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(declare-fun b!89353 () Bool)

(declare-fun res!45666 () Bool)

(assert (=> b!89353 (= res!45666 call!8658)))

(assert (=> b!89353 (=> (not res!45666) (not e!58153))))

(declare-fun bm!8658 () Bool)

(assert (=> bm!8658 (= call!8660 call!8658)))

(declare-fun b!89354 () Bool)

(declare-fun res!45671 () Bool)

(assert (=> b!89354 (= res!45671 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3098 lt!42924)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89354 (=> (not res!45671) (not e!58155))))

(declare-fun b!89355 () Bool)

(assert (=> b!89355 (= e!58153 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!42917)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun b!89356 () Bool)

(declare-fun lt!42920 () Unit!2620)

(assert (=> b!89356 (= e!58160 lt!42920)))

(assert (=> b!89356 (= lt!42920 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(assert (=> b!89356 (= lt!42924 call!8661)))

(assert (=> b!89356 (= c!14850 ((_ is MissingZero!239) lt!42924))))

(assert (=> b!89356 e!58158))

(assert (= (and d!23767 c!14849) b!89348))

(assert (= (and d!23767 (not c!14849)) b!89356))

(assert (= (and b!89348 res!45670) b!89353))

(assert (= (and b!89353 res!45666) b!89355))

(assert (= (and b!89356 c!14850) b!89350))

(assert (= (and b!89356 (not c!14850)) b!89340))

(assert (= (and b!89350 res!45674) b!89344))

(assert (= (and b!89344 res!45672) b!89342))

(assert (= (and b!89340 c!14851) b!89343))

(assert (= (and b!89340 (not c!14851)) b!89351))

(assert (= (and b!89343 res!45669) b!89354))

(assert (= (and b!89354 res!45671) b!89347))

(assert (= (or b!89350 b!89343) bm!8658))

(assert (= (or b!89342 b!89347) bm!8655))

(assert (= (or b!89353 bm!8658) bm!8656))

(assert (= (or b!89348 b!89356) bm!8657))

(assert (= (and d!23767 c!14848) b!89345))

(assert (= (and d!23767 (not c!14848)) b!89341))

(assert (= (and d!23767 res!45673) b!89349))

(assert (= (and b!89349 res!45667) b!89346))

(assert (= (and b!89346 res!45668) b!89352))

(assert (=> d!23767 m!94891))

(declare-fun m!95649 () Bool)

(assert (=> d!23767 m!95649))

(declare-fun m!95651 () Bool)

(assert (=> d!23767 m!95651))

(assert (=> d!23767 m!95329))

(assert (=> d!23767 m!94891))

(declare-fun m!95653 () Bool)

(assert (=> d!23767 m!95653))

(assert (=> d!23767 m!95329))

(declare-fun m!95655 () Bool)

(assert (=> d!23767 m!95655))

(declare-fun m!95657 () Bool)

(assert (=> d!23767 m!95657))

(declare-fun m!95659 () Bool)

(assert (=> d!23767 m!95659))

(assert (=> d!23767 m!94891))

(declare-fun m!95661 () Bool)

(assert (=> d!23767 m!95661))

(declare-fun m!95663 () Bool)

(assert (=> d!23767 m!95663))

(declare-fun m!95665 () Bool)

(assert (=> d!23767 m!95665))

(declare-fun m!95667 () Bool)

(assert (=> d!23767 m!95667))

(assert (=> d!23767 m!95259))

(assert (=> d!23767 m!94953))

(assert (=> d!23767 m!95329))

(declare-fun m!95669 () Bool)

(assert (=> d!23767 m!95669))

(assert (=> d!23767 m!94891))

(declare-fun m!95671 () Bool)

(assert (=> d!23767 m!95671))

(declare-fun m!95673 () Bool)

(assert (=> d!23767 m!95673))

(assert (=> d!23767 m!95667))

(assert (=> d!23767 m!95663))

(declare-fun m!95675 () Bool)

(assert (=> d!23767 m!95675))

(assert (=> d!23767 m!94891))

(declare-fun m!95677 () Bool)

(assert (=> d!23767 m!95677))

(declare-fun m!95679 () Bool)

(assert (=> d!23767 m!95679))

(declare-fun m!95681 () Bool)

(assert (=> d!23767 m!95681))

(assert (=> d!23767 m!94891))

(declare-fun m!95683 () Bool)

(assert (=> d!23767 m!95683))

(assert (=> d!23767 m!94891))

(declare-fun m!95685 () Bool)

(assert (=> d!23767 m!95685))

(assert (=> d!23767 m!94891))

(assert (=> d!23767 m!95283))

(declare-fun m!95687 () Bool)

(assert (=> d!23767 m!95687))

(declare-fun m!95689 () Bool)

(assert (=> b!89355 m!95689))

(assert (=> b!89345 m!94891))

(declare-fun m!95691 () Bool)

(assert (=> b!89345 m!95691))

(assert (=> b!89345 m!95329))

(assert (=> b!89345 m!95329))

(assert (=> b!89345 m!94891))

(assert (=> b!89345 m!95653))

(assert (=> bm!8657 m!94891))

(assert (=> bm!8657 m!95295))

(assert (=> b!89356 m!94891))

(assert (=> b!89356 m!95305))

(declare-fun m!95693 () Bool)

(assert (=> b!89352 m!95693))

(assert (=> b!89352 m!94931))

(assert (=> b!89352 m!94931))

(declare-fun m!95695 () Bool)

(assert (=> b!89352 m!95695))

(declare-fun m!95697 () Bool)

(assert (=> b!89354 m!95697))

(assert (=> b!89348 m!94891))

(assert (=> b!89348 m!95311))

(declare-fun m!95699 () Bool)

(assert (=> bm!8656 m!95699))

(declare-fun m!95701 () Bool)

(assert (=> b!89349 m!95701))

(assert (=> b!89346 m!95693))

(assert (=> b!89346 m!95693))

(assert (=> b!89346 m!94891))

(declare-fun m!95703 () Bool)

(assert (=> b!89346 m!95703))

(declare-fun m!95705 () Bool)

(assert (=> b!89344 m!95705))

(assert (=> bm!8655 m!94891))

(assert (=> bm!8655 m!95283))

(assert (=> bm!8578 d!23767))

(declare-fun d!23769 () Bool)

(declare-fun e!58163 () Bool)

(assert (=> d!23769 e!58163))

(declare-fun res!45680 () Bool)

(assert (=> d!23769 (=> (not res!45680) (not e!58163))))

(declare-fun lt!42936 () SeekEntryResult!239)

(assert (=> d!23769 (= res!45680 ((_ is Found!239) lt!42936))))

(assert (=> d!23769 (= lt!42936 (seekEntryOrOpen!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (_keys!4049 newMap!16) (mask!6415 newMap!16)))))

(declare-fun lt!42937 () Unit!2620)

(declare-fun choose!536 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) Int) Unit!2620)

(assert (=> d!23769 (= lt!42937 (choose!536 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(assert (=> d!23769 (validMask!0 (mask!6415 newMap!16))))

(assert (=> d!23769 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)) lt!42937)))

(declare-fun b!89361 () Bool)

(declare-fun res!45679 () Bool)

(assert (=> b!89361 (=> (not res!45679) (not e!58163))))

(assert (=> b!89361 (= res!45679 (inRange!0 (index!3096 lt!42936) (mask!6415 newMap!16)))))

(declare-fun b!89362 () Bool)

(assert (=> b!89362 (= e!58163 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!42936)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> b!89362 (and (bvsge (index!3096 lt!42936) #b00000000000000000000000000000000) (bvslt (index!3096 lt!42936) (size!2168 (_keys!4049 newMap!16))))))

(assert (= (and d!23769 res!45680) b!89361))

(assert (= (and b!89361 res!45679) b!89362))

(assert (=> d!23769 m!94891))

(assert (=> d!23769 m!95295))

(assert (=> d!23769 m!94891))

(declare-fun m!95707 () Bool)

(assert (=> d!23769 m!95707))

(assert (=> d!23769 m!95573))

(declare-fun m!95709 () Bool)

(assert (=> b!89361 m!95709))

(declare-fun m!95711 () Bool)

(assert (=> b!89362 m!95711))

(assert (=> bm!8588 d!23769))

(declare-fun d!23771 () Bool)

(assert (=> d!23771 (isDefined!95 (getValueByKey!143 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun lt!42940 () Unit!2620)

(declare-fun choose!537 (List!1517 (_ BitVec 64)) Unit!2620)

(assert (=> d!23771 (= lt!42940 (choose!537 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun e!58166 () Bool)

(assert (=> d!23771 e!58166))

(declare-fun res!45683 () Bool)

(assert (=> d!23771 (=> (not res!45683) (not e!58166))))

(assert (=> d!23771 (= res!45683 (isStrictlySorted!287 (toList!740 lt!42409)))))

(assert (=> d!23771 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) lt!42940)))

(declare-fun b!89365 () Bool)

(assert (=> b!89365 (= e!58166 (containsKey!146 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (= (and d!23771 res!45683) b!89365))

(assert (=> d!23771 m!94891))

(assert (=> d!23771 m!95269))

(assert (=> d!23771 m!95269))

(assert (=> d!23771 m!95271))

(assert (=> d!23771 m!94891))

(declare-fun m!95713 () Bool)

(assert (=> d!23771 m!95713))

(declare-fun m!95715 () Bool)

(assert (=> d!23771 m!95715))

(assert (=> b!89365 m!94891))

(assert (=> b!89365 m!95265))

(assert (=> b!88954 d!23771))

(declare-fun d!23773 () Bool)

(declare-fun isEmpty!348 (Option!149) Bool)

(assert (=> d!23773 (= (isDefined!95 (getValueByKey!143 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355))) (not (isEmpty!348 (getValueByKey!143 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))))

(declare-fun bs!3755 () Bool)

(assert (= bs!3755 d!23773))

(assert (=> bs!3755 m!95269))

(declare-fun m!95717 () Bool)

(assert (=> bs!3755 m!95717))

(assert (=> b!88954 d!23773))

(declare-fun b!89369 () Bool)

(declare-fun e!58168 () Option!149)

(assert (=> b!89369 (= e!58168 None!147)))

(declare-fun b!89367 () Bool)

(declare-fun e!58167 () Option!149)

(assert (=> b!89367 (= e!58167 e!58168)))

(declare-fun c!14853 () Bool)

(assert (=> b!89367 (= c!14853 (and ((_ is Cons!1513) (toList!740 lt!42409)) (not (= (_1!1111 (h!2105 (toList!740 lt!42409))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))))

(declare-fun d!23775 () Bool)

(declare-fun c!14852 () Bool)

(assert (=> d!23775 (= c!14852 (and ((_ is Cons!1513) (toList!740 lt!42409)) (= (_1!1111 (h!2105 (toList!740 lt!42409))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355))))))

(assert (=> d!23775 (= (getValueByKey!143 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) e!58167)))

(declare-fun b!89366 () Bool)

(assert (=> b!89366 (= e!58167 (Some!148 (_2!1111 (h!2105 (toList!740 lt!42409)))))))

(declare-fun b!89368 () Bool)

(assert (=> b!89368 (= e!58168 (getValueByKey!143 (t!5267 (toList!740 lt!42409)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (= (and d!23775 c!14852) b!89366))

(assert (= (and d!23775 (not c!14852)) b!89367))

(assert (= (and b!89367 c!14853) b!89368))

(assert (= (and b!89367 (not c!14853)) b!89369))

(assert (=> b!89368 m!94891))

(declare-fun m!95719 () Bool)

(assert (=> b!89368 m!95719))

(assert (=> b!88954 d!23775))

(declare-fun d!23777 () Bool)

(assert (=> d!23777 (= (map!1203 (_2!1112 lt!42677)) (getCurrentListMap!433 (_keys!4049 (_2!1112 lt!42677)) (_values!2354 (_2!1112 lt!42677)) (mask!6415 (_2!1112 lt!42677)) (extraKeys!2204 (_2!1112 lt!42677)) (zeroValue!2260 (_2!1112 lt!42677)) (minValue!2260 (_2!1112 lt!42677)) #b00000000000000000000000000000000 (defaultEntry!2371 (_2!1112 lt!42677))))))

(declare-fun bs!3756 () Bool)

(assert (= bs!3756 d!23777))

(declare-fun m!95721 () Bool)

(assert (=> bs!3756 m!95721))

(assert (=> bm!8597 d!23777))

(assert (=> b!88956 d!23773))

(assert (=> b!88956 d!23775))

(declare-fun d!23779 () Bool)

(declare-fun e!58169 () Bool)

(assert (=> d!23779 e!58169))

(declare-fun res!45684 () Bool)

(assert (=> d!23779 (=> res!45684 e!58169)))

(declare-fun lt!42942 () Bool)

(assert (=> d!23779 (= res!45684 (not lt!42942))))

(declare-fun lt!42943 () Bool)

(assert (=> d!23779 (= lt!42942 lt!42943)))

(declare-fun lt!42944 () Unit!2620)

(declare-fun e!58170 () Unit!2620)

(assert (=> d!23779 (= lt!42944 e!58170)))

(declare-fun c!14854 () Bool)

(assert (=> d!23779 (= c!14854 lt!42943)))

(assert (=> d!23779 (= lt!42943 (containsKey!146 (toList!740 lt!42560) (_1!1111 lt!42408)))))

(assert (=> d!23779 (= (contains!754 lt!42560 (_1!1111 lt!42408)) lt!42942)))

(declare-fun b!89370 () Bool)

(declare-fun lt!42941 () Unit!2620)

(assert (=> b!89370 (= e!58170 lt!42941)))

(assert (=> b!89370 (= lt!42941 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42560) (_1!1111 lt!42408)))))

(assert (=> b!89370 (isDefined!95 (getValueByKey!143 (toList!740 lt!42560) (_1!1111 lt!42408)))))

(declare-fun b!89371 () Bool)

(declare-fun Unit!2641 () Unit!2620)

(assert (=> b!89371 (= e!58170 Unit!2641)))

(declare-fun b!89372 () Bool)

(assert (=> b!89372 (= e!58169 (isDefined!95 (getValueByKey!143 (toList!740 lt!42560) (_1!1111 lt!42408))))))

(assert (= (and d!23779 c!14854) b!89370))

(assert (= (and d!23779 (not c!14854)) b!89371))

(assert (= (and d!23779 (not res!45684)) b!89372))

(declare-fun m!95723 () Bool)

(assert (=> d!23779 m!95723))

(declare-fun m!95725 () Bool)

(assert (=> b!89370 m!95725))

(assert (=> b!89370 m!95153))

(assert (=> b!89370 m!95153))

(declare-fun m!95727 () Bool)

(assert (=> b!89370 m!95727))

(assert (=> b!89372 m!95153))

(assert (=> b!89372 m!95153))

(assert (=> b!89372 m!95727))

(assert (=> d!23657 d!23779))

(declare-fun b!89376 () Bool)

(declare-fun e!58172 () Option!149)

(assert (=> b!89376 (= e!58172 None!147)))

(declare-fun b!89374 () Bool)

(declare-fun e!58171 () Option!149)

(assert (=> b!89374 (= e!58171 e!58172)))

(declare-fun c!14856 () Bool)

(assert (=> b!89374 (= c!14856 (and ((_ is Cons!1513) lt!42559) (not (= (_1!1111 (h!2105 lt!42559)) (_1!1111 lt!42408)))))))

(declare-fun d!23781 () Bool)

(declare-fun c!14855 () Bool)

(assert (=> d!23781 (= c!14855 (and ((_ is Cons!1513) lt!42559) (= (_1!1111 (h!2105 lt!42559)) (_1!1111 lt!42408))))))

(assert (=> d!23781 (= (getValueByKey!143 lt!42559 (_1!1111 lt!42408)) e!58171)))

(declare-fun b!89373 () Bool)

(assert (=> b!89373 (= e!58171 (Some!148 (_2!1111 (h!2105 lt!42559))))))

(declare-fun b!89375 () Bool)

(assert (=> b!89375 (= e!58172 (getValueByKey!143 (t!5267 lt!42559) (_1!1111 lt!42408)))))

(assert (= (and d!23781 c!14855) b!89373))

(assert (= (and d!23781 (not c!14855)) b!89374))

(assert (= (and b!89374 c!14856) b!89375))

(assert (= (and b!89374 (not c!14856)) b!89376))

(declare-fun m!95729 () Bool)

(assert (=> b!89375 m!95729))

(assert (=> d!23657 d!23781))

(declare-fun d!23783 () Bool)

(assert (=> d!23783 (= (getValueByKey!143 lt!42559 (_1!1111 lt!42408)) (Some!148 (_2!1111 lt!42408)))))

(declare-fun lt!42945 () Unit!2620)

(assert (=> d!23783 (= lt!42945 (choose!535 lt!42559 (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(declare-fun e!58173 () Bool)

(assert (=> d!23783 e!58173))

(declare-fun res!45685 () Bool)

(assert (=> d!23783 (=> (not res!45685) (not e!58173))))

(assert (=> d!23783 (= res!45685 (isStrictlySorted!287 lt!42559))))

(assert (=> d!23783 (= (lemmaContainsTupThenGetReturnValue!60 lt!42559 (_1!1111 lt!42408) (_2!1111 lt!42408)) lt!42945)))

(declare-fun b!89377 () Bool)

(declare-fun res!45686 () Bool)

(assert (=> b!89377 (=> (not res!45686) (not e!58173))))

(assert (=> b!89377 (= res!45686 (containsKey!146 lt!42559 (_1!1111 lt!42408)))))

(declare-fun b!89378 () Bool)

(assert (=> b!89378 (= e!58173 (contains!755 lt!42559 (tuple2!2201 (_1!1111 lt!42408) (_2!1111 lt!42408))))))

(assert (= (and d!23783 res!45685) b!89377))

(assert (= (and b!89377 res!45686) b!89378))

(assert (=> d!23783 m!95147))

(declare-fun m!95731 () Bool)

(assert (=> d!23783 m!95731))

(declare-fun m!95733 () Bool)

(assert (=> d!23783 m!95733))

(declare-fun m!95735 () Bool)

(assert (=> b!89377 m!95735))

(declare-fun m!95737 () Bool)

(assert (=> b!89378 m!95737))

(assert (=> d!23657 d!23783))

(declare-fun b!89379 () Bool)

(declare-fun e!58174 () List!1517)

(declare-fun call!8662 () List!1517)

(assert (=> b!89379 (= e!58174 call!8662)))

(declare-fun b!89380 () Bool)

(declare-fun e!58176 () List!1517)

(assert (=> b!89380 (= e!58176 (insertStrictlySorted!63 (t!5267 (toList!740 lt!42413)) (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(declare-fun b!89381 () Bool)

(declare-fun e!58177 () List!1517)

(declare-fun call!8663 () List!1517)

(assert (=> b!89381 (= e!58177 call!8663)))

(declare-fun call!8664 () List!1517)

(declare-fun c!14857 () Bool)

(declare-fun bm!8659 () Bool)

(assert (=> bm!8659 (= call!8664 ($colon$colon!73 e!58176 (ite c!14857 (h!2105 (toList!740 lt!42413)) (tuple2!2201 (_1!1111 lt!42408) (_2!1111 lt!42408)))))))

(declare-fun c!14859 () Bool)

(assert (=> bm!8659 (= c!14859 c!14857)))

(declare-fun b!89382 () Bool)

(declare-fun res!45687 () Bool)

(declare-fun e!58178 () Bool)

(assert (=> b!89382 (=> (not res!45687) (not e!58178))))

(declare-fun lt!42946 () List!1517)

(assert (=> b!89382 (= res!45687 (containsKey!146 lt!42946 (_1!1111 lt!42408)))))

(declare-fun b!89383 () Bool)

(assert (=> b!89383 (= e!58178 (contains!755 lt!42946 (tuple2!2201 (_1!1111 lt!42408) (_2!1111 lt!42408))))))

(declare-fun b!89384 () Bool)

(assert (=> b!89384 (= e!58177 call!8663)))

(declare-fun d!23785 () Bool)

(assert (=> d!23785 e!58178))

(declare-fun res!45688 () Bool)

(assert (=> d!23785 (=> (not res!45688) (not e!58178))))

(assert (=> d!23785 (= res!45688 (isStrictlySorted!287 lt!42946))))

(declare-fun e!58175 () List!1517)

(assert (=> d!23785 (= lt!42946 e!58175)))

(assert (=> d!23785 (= c!14857 (and ((_ is Cons!1513) (toList!740 lt!42413)) (bvslt (_1!1111 (h!2105 (toList!740 lt!42413))) (_1!1111 lt!42408))))))

(assert (=> d!23785 (isStrictlySorted!287 (toList!740 lt!42413))))

(assert (=> d!23785 (= (insertStrictlySorted!63 (toList!740 lt!42413) (_1!1111 lt!42408) (_2!1111 lt!42408)) lt!42946)))

(declare-fun b!89385 () Bool)

(assert (=> b!89385 (= e!58175 e!58174)))

(declare-fun c!14858 () Bool)

(assert (=> b!89385 (= c!14858 (and ((_ is Cons!1513) (toList!740 lt!42413)) (= (_1!1111 (h!2105 (toList!740 lt!42413))) (_1!1111 lt!42408))))))

(declare-fun c!14860 () Bool)

(declare-fun b!89386 () Bool)

(assert (=> b!89386 (= e!58176 (ite c!14858 (t!5267 (toList!740 lt!42413)) (ite c!14860 (Cons!1513 (h!2105 (toList!740 lt!42413)) (t!5267 (toList!740 lt!42413))) Nil!1514)))))

(declare-fun bm!8660 () Bool)

(assert (=> bm!8660 (= call!8662 call!8664)))

(declare-fun b!89387 () Bool)

(assert (=> b!89387 (= c!14860 (and ((_ is Cons!1513) (toList!740 lt!42413)) (bvsgt (_1!1111 (h!2105 (toList!740 lt!42413))) (_1!1111 lt!42408))))))

(assert (=> b!89387 (= e!58174 e!58177)))

(declare-fun b!89388 () Bool)

(assert (=> b!89388 (= e!58175 call!8664)))

(declare-fun bm!8661 () Bool)

(assert (=> bm!8661 (= call!8663 call!8662)))

(assert (= (and d!23785 c!14857) b!89388))

(assert (= (and d!23785 (not c!14857)) b!89385))

(assert (= (and b!89385 c!14858) b!89379))

(assert (= (and b!89385 (not c!14858)) b!89387))

(assert (= (and b!89387 c!14860) b!89384))

(assert (= (and b!89387 (not c!14860)) b!89381))

(assert (= (or b!89384 b!89381) bm!8661))

(assert (= (or b!89379 bm!8661) bm!8660))

(assert (= (or b!89388 bm!8660) bm!8659))

(assert (= (and bm!8659 c!14859) b!89380))

(assert (= (and bm!8659 (not c!14859)) b!89386))

(assert (= (and d!23785 res!45688) b!89382))

(assert (= (and b!89382 res!45687) b!89383))

(declare-fun m!95739 () Bool)

(assert (=> b!89383 m!95739))

(declare-fun m!95741 () Bool)

(assert (=> d!23785 m!95741))

(declare-fun m!95743 () Bool)

(assert (=> d!23785 m!95743))

(declare-fun m!95745 () Bool)

(assert (=> b!89380 m!95745))

(declare-fun m!95747 () Bool)

(assert (=> b!89382 m!95747))

(declare-fun m!95749 () Bool)

(assert (=> bm!8659 m!95749))

(assert (=> d!23657 d!23785))

(declare-fun d!23787 () Bool)

(assert (=> d!23787 (= (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) (and (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88934 d!23787))

(declare-fun d!23789 () Bool)

(declare-fun e!58179 () Bool)

(assert (=> d!23789 e!58179))

(declare-fun res!45689 () Bool)

(assert (=> d!23789 (=> res!45689 e!58179)))

(declare-fun lt!42948 () Bool)

(assert (=> d!23789 (= res!45689 (not lt!42948))))

(declare-fun lt!42949 () Bool)

(assert (=> d!23789 (= lt!42948 lt!42949)))

(declare-fun lt!42950 () Unit!2620)

(declare-fun e!58180 () Unit!2620)

(assert (=> d!23789 (= lt!42950 e!58180)))

(declare-fun c!14861 () Bool)

(assert (=> d!23789 (= c!14861 lt!42949)))

(assert (=> d!23789 (= lt!42949 (containsKey!146 (toList!740 lt!42564) (_1!1111 lt!42406)))))

(assert (=> d!23789 (= (contains!754 lt!42564 (_1!1111 lt!42406)) lt!42948)))

(declare-fun b!89389 () Bool)

(declare-fun lt!42947 () Unit!2620)

(assert (=> b!89389 (= e!58180 lt!42947)))

(assert (=> b!89389 (= lt!42947 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42564) (_1!1111 lt!42406)))))

(assert (=> b!89389 (isDefined!95 (getValueByKey!143 (toList!740 lt!42564) (_1!1111 lt!42406)))))

(declare-fun b!89390 () Bool)

(declare-fun Unit!2642 () Unit!2620)

(assert (=> b!89390 (= e!58180 Unit!2642)))

(declare-fun b!89391 () Bool)

(assert (=> b!89391 (= e!58179 (isDefined!95 (getValueByKey!143 (toList!740 lt!42564) (_1!1111 lt!42406))))))

(assert (= (and d!23789 c!14861) b!89389))

(assert (= (and d!23789 (not c!14861)) b!89390))

(assert (= (and d!23789 (not res!45689)) b!89391))

(declare-fun m!95751 () Bool)

(assert (=> d!23789 m!95751))

(declare-fun m!95753 () Bool)

(assert (=> b!89389 m!95753))

(assert (=> b!89389 m!95165))

(assert (=> b!89389 m!95165))

(declare-fun m!95755 () Bool)

(assert (=> b!89389 m!95755))

(assert (=> b!89391 m!95165))

(assert (=> b!89391 m!95165))

(assert (=> b!89391 m!95755))

(assert (=> d!23659 d!23789))

(declare-fun b!89395 () Bool)

(declare-fun e!58182 () Option!149)

(assert (=> b!89395 (= e!58182 None!147)))

(declare-fun b!89393 () Bool)

(declare-fun e!58181 () Option!149)

(assert (=> b!89393 (= e!58181 e!58182)))

(declare-fun c!14863 () Bool)

(assert (=> b!89393 (= c!14863 (and ((_ is Cons!1513) lt!42563) (not (= (_1!1111 (h!2105 lt!42563)) (_1!1111 lt!42406)))))))

(declare-fun d!23791 () Bool)

(declare-fun c!14862 () Bool)

(assert (=> d!23791 (= c!14862 (and ((_ is Cons!1513) lt!42563) (= (_1!1111 (h!2105 lt!42563)) (_1!1111 lt!42406))))))

(assert (=> d!23791 (= (getValueByKey!143 lt!42563 (_1!1111 lt!42406)) e!58181)))

(declare-fun b!89392 () Bool)

(assert (=> b!89392 (= e!58181 (Some!148 (_2!1111 (h!2105 lt!42563))))))

(declare-fun b!89394 () Bool)

(assert (=> b!89394 (= e!58182 (getValueByKey!143 (t!5267 lt!42563) (_1!1111 lt!42406)))))

(assert (= (and d!23791 c!14862) b!89392))

(assert (= (and d!23791 (not c!14862)) b!89393))

(assert (= (and b!89393 c!14863) b!89394))

(assert (= (and b!89393 (not c!14863)) b!89395))

(declare-fun m!95757 () Bool)

(assert (=> b!89394 m!95757))

(assert (=> d!23659 d!23791))

(declare-fun d!23793 () Bool)

(assert (=> d!23793 (= (getValueByKey!143 lt!42563 (_1!1111 lt!42406)) (Some!148 (_2!1111 lt!42406)))))

(declare-fun lt!42951 () Unit!2620)

(assert (=> d!23793 (= lt!42951 (choose!535 lt!42563 (_1!1111 lt!42406) (_2!1111 lt!42406)))))

(declare-fun e!58183 () Bool)

(assert (=> d!23793 e!58183))

(declare-fun res!45690 () Bool)

(assert (=> d!23793 (=> (not res!45690) (not e!58183))))

(assert (=> d!23793 (= res!45690 (isStrictlySorted!287 lt!42563))))

(assert (=> d!23793 (= (lemmaContainsTupThenGetReturnValue!60 lt!42563 (_1!1111 lt!42406) (_2!1111 lt!42406)) lt!42951)))

(declare-fun b!89396 () Bool)

(declare-fun res!45691 () Bool)

(assert (=> b!89396 (=> (not res!45691) (not e!58183))))

(assert (=> b!89396 (= res!45691 (containsKey!146 lt!42563 (_1!1111 lt!42406)))))

(declare-fun b!89397 () Bool)

(assert (=> b!89397 (= e!58183 (contains!755 lt!42563 (tuple2!2201 (_1!1111 lt!42406) (_2!1111 lt!42406))))))

(assert (= (and d!23793 res!45690) b!89396))

(assert (= (and b!89396 res!45691) b!89397))

(assert (=> d!23793 m!95159))

(declare-fun m!95759 () Bool)

(assert (=> d!23793 m!95759))

(declare-fun m!95761 () Bool)

(assert (=> d!23793 m!95761))

(declare-fun m!95763 () Bool)

(assert (=> b!89396 m!95763))

(declare-fun m!95765 () Bool)

(assert (=> b!89397 m!95765))

(assert (=> d!23659 d!23793))

(declare-fun b!89398 () Bool)

(declare-fun e!58184 () List!1517)

(declare-fun call!8665 () List!1517)

(assert (=> b!89398 (= e!58184 call!8665)))

(declare-fun b!89399 () Bool)

(declare-fun e!58186 () List!1517)

(assert (=> b!89399 (= e!58186 (insertStrictlySorted!63 (t!5267 (toList!740 lt!42402)) (_1!1111 lt!42406) (_2!1111 lt!42406)))))

(declare-fun b!89400 () Bool)

(declare-fun e!58187 () List!1517)

(declare-fun call!8666 () List!1517)

(assert (=> b!89400 (= e!58187 call!8666)))

(declare-fun call!8667 () List!1517)

(declare-fun bm!8662 () Bool)

(declare-fun c!14864 () Bool)

(assert (=> bm!8662 (= call!8667 ($colon$colon!73 e!58186 (ite c!14864 (h!2105 (toList!740 lt!42402)) (tuple2!2201 (_1!1111 lt!42406) (_2!1111 lt!42406)))))))

(declare-fun c!14866 () Bool)

(assert (=> bm!8662 (= c!14866 c!14864)))

(declare-fun b!89401 () Bool)

(declare-fun res!45692 () Bool)

(declare-fun e!58188 () Bool)

(assert (=> b!89401 (=> (not res!45692) (not e!58188))))

(declare-fun lt!42952 () List!1517)

(assert (=> b!89401 (= res!45692 (containsKey!146 lt!42952 (_1!1111 lt!42406)))))

(declare-fun b!89402 () Bool)

(assert (=> b!89402 (= e!58188 (contains!755 lt!42952 (tuple2!2201 (_1!1111 lt!42406) (_2!1111 lt!42406))))))

(declare-fun b!89403 () Bool)

(assert (=> b!89403 (= e!58187 call!8666)))

(declare-fun d!23795 () Bool)

(assert (=> d!23795 e!58188))

(declare-fun res!45693 () Bool)

(assert (=> d!23795 (=> (not res!45693) (not e!58188))))

(assert (=> d!23795 (= res!45693 (isStrictlySorted!287 lt!42952))))

(declare-fun e!58185 () List!1517)

(assert (=> d!23795 (= lt!42952 e!58185)))

(assert (=> d!23795 (= c!14864 (and ((_ is Cons!1513) (toList!740 lt!42402)) (bvslt (_1!1111 (h!2105 (toList!740 lt!42402))) (_1!1111 lt!42406))))))

(assert (=> d!23795 (isStrictlySorted!287 (toList!740 lt!42402))))

(assert (=> d!23795 (= (insertStrictlySorted!63 (toList!740 lt!42402) (_1!1111 lt!42406) (_2!1111 lt!42406)) lt!42952)))

(declare-fun b!89404 () Bool)

(assert (=> b!89404 (= e!58185 e!58184)))

(declare-fun c!14865 () Bool)

(assert (=> b!89404 (= c!14865 (and ((_ is Cons!1513) (toList!740 lt!42402)) (= (_1!1111 (h!2105 (toList!740 lt!42402))) (_1!1111 lt!42406))))))

(declare-fun c!14867 () Bool)

(declare-fun b!89405 () Bool)

(assert (=> b!89405 (= e!58186 (ite c!14865 (t!5267 (toList!740 lt!42402)) (ite c!14867 (Cons!1513 (h!2105 (toList!740 lt!42402)) (t!5267 (toList!740 lt!42402))) Nil!1514)))))

(declare-fun bm!8663 () Bool)

(assert (=> bm!8663 (= call!8665 call!8667)))

(declare-fun b!89406 () Bool)

(assert (=> b!89406 (= c!14867 (and ((_ is Cons!1513) (toList!740 lt!42402)) (bvsgt (_1!1111 (h!2105 (toList!740 lt!42402))) (_1!1111 lt!42406))))))

(assert (=> b!89406 (= e!58184 e!58187)))

(declare-fun b!89407 () Bool)

(assert (=> b!89407 (= e!58185 call!8667)))

(declare-fun bm!8664 () Bool)

(assert (=> bm!8664 (= call!8666 call!8665)))

(assert (= (and d!23795 c!14864) b!89407))

(assert (= (and d!23795 (not c!14864)) b!89404))

(assert (= (and b!89404 c!14865) b!89398))

(assert (= (and b!89404 (not c!14865)) b!89406))

(assert (= (and b!89406 c!14867) b!89403))

(assert (= (and b!89406 (not c!14867)) b!89400))

(assert (= (or b!89403 b!89400) bm!8664))

(assert (= (or b!89398 bm!8664) bm!8663))

(assert (= (or b!89407 bm!8663) bm!8662))

(assert (= (and bm!8662 c!14866) b!89399))

(assert (= (and bm!8662 (not c!14866)) b!89405))

(assert (= (and d!23795 res!45693) b!89401))

(assert (= (and b!89401 res!45692) b!89402))

(declare-fun m!95767 () Bool)

(assert (=> b!89402 m!95767))

(declare-fun m!95769 () Bool)

(assert (=> d!23795 m!95769))

(declare-fun m!95771 () Bool)

(assert (=> d!23795 m!95771))

(declare-fun m!95773 () Bool)

(assert (=> b!89399 m!95773))

(declare-fun m!95775 () Bool)

(assert (=> b!89401 m!95775))

(declare-fun m!95777 () Bool)

(assert (=> bm!8662 m!95777))

(assert (=> d!23659 d!23795))

(declare-fun d!23797 () Bool)

(declare-fun e!58189 () Bool)

(assert (=> d!23797 e!58189))

(declare-fun res!45694 () Bool)

(assert (=> d!23797 (=> res!45694 e!58189)))

(declare-fun lt!42954 () Bool)

(assert (=> d!23797 (= res!45694 (not lt!42954))))

(declare-fun lt!42955 () Bool)

(assert (=> d!23797 (= lt!42954 lt!42955)))

(declare-fun lt!42956 () Unit!2620)

(declare-fun e!58190 () Unit!2620)

(assert (=> d!23797 (= lt!42956 e!58190)))

(declare-fun c!14868 () Bool)

(assert (=> d!23797 (= c!14868 lt!42955)))

(assert (=> d!23797 (= lt!42955 (containsKey!146 (toList!740 call!8597) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> d!23797 (= (contains!754 call!8597 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) lt!42954)))

(declare-fun b!89408 () Bool)

(declare-fun lt!42953 () Unit!2620)

(assert (=> b!89408 (= e!58190 lt!42953)))

(assert (=> b!89408 (= lt!42953 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 call!8597) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> b!89408 (isDefined!95 (getValueByKey!143 (toList!740 call!8597) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun b!89409 () Bool)

(declare-fun Unit!2643 () Unit!2620)

(assert (=> b!89409 (= e!58190 Unit!2643)))

(declare-fun b!89410 () Bool)

(assert (=> b!89410 (= e!58189 (isDefined!95 (getValueByKey!143 (toList!740 call!8597) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355))))))

(assert (= (and d!23797 c!14868) b!89408))

(assert (= (and d!23797 (not c!14868)) b!89409))

(assert (= (and d!23797 (not res!45694)) b!89410))

(assert (=> d!23797 m!94891))

(declare-fun m!95779 () Bool)

(assert (=> d!23797 m!95779))

(assert (=> b!89408 m!94891))

(declare-fun m!95781 () Bool)

(assert (=> b!89408 m!95781))

(assert (=> b!89408 m!94891))

(declare-fun m!95783 () Bool)

(assert (=> b!89408 m!95783))

(assert (=> b!89408 m!95783))

(declare-fun m!95785 () Bool)

(assert (=> b!89408 m!95785))

(assert (=> b!89410 m!94891))

(assert (=> b!89410 m!95783))

(assert (=> b!89410 m!95783))

(assert (=> b!89410 m!95785))

(assert (=> b!89041 d!23797))

(declare-fun b!89414 () Bool)

(declare-fun e!58192 () Option!149)

(assert (=> b!89414 (= e!58192 None!147)))

(declare-fun b!89412 () Bool)

(declare-fun e!58191 () Option!149)

(assert (=> b!89412 (= e!58191 e!58192)))

(declare-fun c!14870 () Bool)

(assert (=> b!89412 (= c!14870 (and ((_ is Cons!1513) (toList!740 lt!42581)) (not (= (_1!1111 (h!2105 (toList!740 lt!42581))) (_1!1111 lt!42408)))))))

(declare-fun d!23799 () Bool)

(declare-fun c!14869 () Bool)

(assert (=> d!23799 (= c!14869 (and ((_ is Cons!1513) (toList!740 lt!42581)) (= (_1!1111 (h!2105 (toList!740 lt!42581))) (_1!1111 lt!42408))))))

(assert (=> d!23799 (= (getValueByKey!143 (toList!740 lt!42581) (_1!1111 lt!42408)) e!58191)))

(declare-fun b!89411 () Bool)

(assert (=> b!89411 (= e!58191 (Some!148 (_2!1111 (h!2105 (toList!740 lt!42581)))))))

(declare-fun b!89413 () Bool)

(assert (=> b!89413 (= e!58192 (getValueByKey!143 (t!5267 (toList!740 lt!42581)) (_1!1111 lt!42408)))))

(assert (= (and d!23799 c!14869) b!89411))

(assert (= (and d!23799 (not c!14869)) b!89412))

(assert (= (and b!89412 c!14870) b!89413))

(assert (= (and b!89412 (not c!14870)) b!89414))

(declare-fun m!95787 () Bool)

(assert (=> b!89413 m!95787))

(assert (=> b!88892 d!23799))

(declare-fun b!89423 () Bool)

(declare-fun e!58198 () (_ BitVec 32))

(declare-fun e!58197 () (_ BitVec 32))

(assert (=> b!89423 (= e!58198 e!58197)))

(declare-fun c!14875 () Bool)

(assert (=> b!89423 (= c!14875 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89424 () Bool)

(assert (=> b!89424 (= e!58198 #b00000000000000000000000000000000)))

(declare-fun d!23801 () Bool)

(declare-fun lt!42959 () (_ BitVec 32))

(assert (=> d!23801 (and (bvsge lt!42959 #b00000000000000000000000000000000) (bvsle lt!42959 (bvsub (size!2168 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!23801 (= lt!42959 e!58198)))

(declare-fun c!14876 () Bool)

(assert (=> d!23801 (= c!14876 (bvsge #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(assert (=> d!23801 (and (bvsle #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2168 (_keys!4049 newMap!16)) (size!2168 (_keys!4049 newMap!16))))))

(assert (=> d!23801 (= (arrayCountValidKeys!0 (_keys!4049 newMap!16) #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))) lt!42959)))

(declare-fun b!89425 () Bool)

(declare-fun call!8670 () (_ BitVec 32))

(assert (=> b!89425 (= e!58197 (bvadd #b00000000000000000000000000000001 call!8670))))

(declare-fun b!89426 () Bool)

(assert (=> b!89426 (= e!58197 call!8670)))

(declare-fun bm!8667 () Bool)

(assert (=> bm!8667 (= call!8670 (arrayCountValidKeys!0 (_keys!4049 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2168 (_keys!4049 newMap!16))))))

(assert (= (and d!23801 c!14876) b!89424))

(assert (= (and d!23801 (not c!14876)) b!89423))

(assert (= (and b!89423 c!14875) b!89425))

(assert (= (and b!89423 (not c!14875)) b!89426))

(assert (= (or b!89425 b!89426) bm!8667))

(assert (=> b!89423 m!95577))

(assert (=> b!89423 m!95577))

(assert (=> b!89423 m!95579))

(declare-fun m!95789 () Bool)

(assert (=> bm!8667 m!95789))

(assert (=> b!88945 d!23801))

(declare-fun d!23803 () Bool)

(declare-fun e!58199 () Bool)

(assert (=> d!23803 e!58199))

(declare-fun res!45695 () Bool)

(assert (=> d!23803 (=> (not res!45695) (not e!58199))))

(declare-fun lt!42962 () ListLongMap!1449)

(assert (=> d!23803 (= res!45695 (contains!754 lt!42962 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(declare-fun lt!42961 () List!1517)

(assert (=> d!23803 (= lt!42962 (ListLongMap!1450 lt!42961))))

(declare-fun lt!42963 () Unit!2620)

(declare-fun lt!42960 () Unit!2620)

(assert (=> d!23803 (= lt!42963 lt!42960)))

(assert (=> d!23803 (= (getValueByKey!143 lt!42961 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23803 (= lt!42960 (lemmaContainsTupThenGetReturnValue!60 lt!42961 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23803 (= lt!42961 (insertStrictlySorted!63 (toList!740 call!8600) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23803 (= (+!111 call!8600 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) lt!42962)))

(declare-fun b!89427 () Bool)

(declare-fun res!45696 () Bool)

(assert (=> b!89427 (=> (not res!45696) (not e!58199))))

(assert (=> b!89427 (= res!45696 (= (getValueByKey!143 (toList!740 lt!42962) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))))

(declare-fun b!89428 () Bool)

(assert (=> b!89428 (= e!58199 (contains!755 (toList!740 lt!42962) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))

(assert (= (and d!23803 res!45695) b!89427))

(assert (= (and b!89427 res!45696) b!89428))

(declare-fun m!95791 () Bool)

(assert (=> d!23803 m!95791))

(declare-fun m!95793 () Bool)

(assert (=> d!23803 m!95793))

(declare-fun m!95795 () Bool)

(assert (=> d!23803 m!95795))

(declare-fun m!95797 () Bool)

(assert (=> d!23803 m!95797))

(declare-fun m!95799 () Bool)

(assert (=> b!89427 m!95799))

(declare-fun m!95801 () Bool)

(assert (=> b!89428 m!95801))

(assert (=> b!89061 d!23803))

(declare-fun b!89429 () Bool)

(declare-fun e!58202 () Bool)

(declare-fun lt!42984 () ListLongMap!1449)

(assert (=> b!89429 (= e!58202 (= (apply!84 lt!42984 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2260 newMap!16)))))

(declare-fun b!89430 () Bool)

(declare-fun e!58210 () ListLongMap!1449)

(declare-fun e!58204 () ListLongMap!1449)

(assert (=> b!89430 (= e!58210 e!58204)))

(declare-fun c!14879 () Bool)

(assert (=> b!89430 (= c!14879 (and (not (= (bvand (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89431 () Bool)

(declare-fun e!58203 () Bool)

(declare-fun e!58207 () Bool)

(assert (=> b!89431 (= e!58203 e!58207)))

(declare-fun res!45697 () Bool)

(declare-fun call!8671 () Bool)

(assert (=> b!89431 (= res!45697 call!8671)))

(assert (=> b!89431 (=> (not res!45697) (not e!58207))))

(declare-fun bm!8668 () Bool)

(declare-fun call!8673 () Bool)

(assert (=> bm!8668 (= call!8673 (contains!754 lt!42984 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89432 () Bool)

(declare-fun e!58212 () Bool)

(assert (=> b!89432 (= e!58212 (not call!8673))))

(declare-fun b!89433 () Bool)

(declare-fun e!58200 () ListLongMap!1449)

(declare-fun call!8677 () ListLongMap!1449)

(assert (=> b!89433 (= e!58200 call!8677)))

(declare-fun b!89434 () Bool)

(declare-fun e!58205 () Unit!2620)

(declare-fun Unit!2644 () Unit!2620)

(assert (=> b!89434 (= e!58205 Unit!2644)))

(declare-fun b!89435 () Bool)

(assert (=> b!89435 (= e!58203 (not call!8671))))

(declare-fun b!89436 () Bool)

(declare-fun res!45703 () Bool)

(declare-fun e!58208 () Bool)

(assert (=> b!89436 (=> (not res!45703) (not e!58208))))

(declare-fun e!58211 () Bool)

(assert (=> b!89436 (= res!45703 e!58211)))

(declare-fun res!45701 () Bool)

(assert (=> b!89436 (=> res!45701 e!58211)))

(declare-fun e!58206 () Bool)

(assert (=> b!89436 (= res!45701 (not e!58206))))

(declare-fun res!45704 () Bool)

(assert (=> b!89436 (=> (not res!45704) (not e!58206))))

(assert (=> b!89436 (= res!45704 (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun d!23805 () Bool)

(assert (=> d!23805 e!58208))

(declare-fun res!45699 () Bool)

(assert (=> d!23805 (=> (not res!45699) (not e!58208))))

(assert (=> d!23805 (= res!45699 (or (bvsge #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))))

(declare-fun lt!42981 () ListLongMap!1449)

(assert (=> d!23805 (= lt!42984 lt!42981)))

(declare-fun lt!42973 () Unit!2620)

(assert (=> d!23805 (= lt!42973 e!58205)))

(declare-fun c!14878 () Bool)

(declare-fun e!58209 () Bool)

(assert (=> d!23805 (= c!14878 e!58209)))

(declare-fun res!45705 () Bool)

(assert (=> d!23805 (=> (not res!45705) (not e!58209))))

(assert (=> d!23805 (= res!45705 (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(assert (=> d!23805 (= lt!42981 e!58210)))

(declare-fun c!14877 () Bool)

(assert (=> d!23805 (= c!14877 (and (not (= (bvand (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23805 (validMask!0 (mask!6415 newMap!16))))

(assert (=> d!23805 (= (getCurrentListMap!433 (_keys!4049 newMap!16) (ite (or c!14770 c!14771) (_values!2354 newMap!16) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16)))) (mask!6415 newMap!16) (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16)) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) lt!42984)))

(declare-fun b!89437 () Bool)

(declare-fun call!8676 () ListLongMap!1449)

(assert (=> b!89437 (= e!58200 call!8676)))

(declare-fun b!89438 () Bool)

(declare-fun c!14881 () Bool)

(assert (=> b!89438 (= c!14881 (and (not (= (bvand (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!89438 (= e!58204 e!58200)))

(declare-fun b!89439 () Bool)

(assert (=> b!89439 (= e!58204 call!8676)))

(declare-fun call!8674 () ListLongMap!1449)

(declare-fun bm!8669 () Bool)

(assert (=> bm!8669 (= call!8674 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (ite (or c!14770 c!14771) (_values!2354 newMap!16) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16)))) (mask!6415 newMap!16) (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16)) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun b!89440 () Bool)

(declare-fun e!58201 () Bool)

(assert (=> b!89440 (= e!58211 e!58201)))

(declare-fun res!45700 () Bool)

(assert (=> b!89440 (=> (not res!45700) (not e!58201))))

(assert (=> b!89440 (= res!45700 (contains!754 lt!42984 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!89440 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun b!89441 () Bool)

(declare-fun call!8675 () ListLongMap!1449)

(assert (=> b!89441 (= e!58210 (+!111 call!8675 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 newMap!16))))))

(declare-fun b!89442 () Bool)

(declare-fun lt!42968 () Unit!2620)

(assert (=> b!89442 (= e!58205 lt!42968)))

(declare-fun lt!42965 () ListLongMap!1449)

(assert (=> b!89442 (= lt!42965 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (ite (or c!14770 c!14771) (_values!2354 newMap!16) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16)))) (mask!6415 newMap!16) (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16)) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42964 () (_ BitVec 64))

(assert (=> b!89442 (= lt!42964 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42972 () (_ BitVec 64))

(assert (=> b!89442 (= lt!42972 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42974 () Unit!2620)

(assert (=> b!89442 (= lt!42974 (addStillContains!60 lt!42965 lt!42964 (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16)) lt!42972))))

(assert (=> b!89442 (contains!754 (+!111 lt!42965 (tuple2!2201 lt!42964 (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16)))) lt!42972)))

(declare-fun lt!42966 () Unit!2620)

(assert (=> b!89442 (= lt!42966 lt!42974)))

(declare-fun lt!42982 () ListLongMap!1449)

(assert (=> b!89442 (= lt!42982 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (ite (or c!14770 c!14771) (_values!2354 newMap!16) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16)))) (mask!6415 newMap!16) (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16)) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42971 () (_ BitVec 64))

(assert (=> b!89442 (= lt!42971 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42978 () (_ BitVec 64))

(assert (=> b!89442 (= lt!42978 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42977 () Unit!2620)

(assert (=> b!89442 (= lt!42977 (addApplyDifferent!60 lt!42982 lt!42971 (minValue!2260 newMap!16) lt!42978))))

(assert (=> b!89442 (= (apply!84 (+!111 lt!42982 (tuple2!2201 lt!42971 (minValue!2260 newMap!16))) lt!42978) (apply!84 lt!42982 lt!42978))))

(declare-fun lt!42979 () Unit!2620)

(assert (=> b!89442 (= lt!42979 lt!42977)))

(declare-fun lt!42976 () ListLongMap!1449)

(assert (=> b!89442 (= lt!42976 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (ite (or c!14770 c!14771) (_values!2354 newMap!16) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16)))) (mask!6415 newMap!16) (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16)) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42969 () (_ BitVec 64))

(assert (=> b!89442 (= lt!42969 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42980 () (_ BitVec 64))

(assert (=> b!89442 (= lt!42980 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42975 () Unit!2620)

(assert (=> b!89442 (= lt!42975 (addApplyDifferent!60 lt!42976 lt!42969 (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16)) lt!42980))))

(assert (=> b!89442 (= (apply!84 (+!111 lt!42976 (tuple2!2201 lt!42969 (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16)))) lt!42980) (apply!84 lt!42976 lt!42980))))

(declare-fun lt!42983 () Unit!2620)

(assert (=> b!89442 (= lt!42983 lt!42975)))

(declare-fun lt!42985 () ListLongMap!1449)

(assert (=> b!89442 (= lt!42985 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (ite (or c!14770 c!14771) (_values!2354 newMap!16) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16)))) (mask!6415 newMap!16) (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16)) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42970 () (_ BitVec 64))

(assert (=> b!89442 (= lt!42970 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42967 () (_ BitVec 64))

(assert (=> b!89442 (= lt!42967 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89442 (= lt!42968 (addApplyDifferent!60 lt!42985 lt!42970 (minValue!2260 newMap!16) lt!42967))))

(assert (=> b!89442 (= (apply!84 (+!111 lt!42985 (tuple2!2201 lt!42970 (minValue!2260 newMap!16))) lt!42967) (apply!84 lt!42985 lt!42967))))

(declare-fun bm!8670 () Bool)

(declare-fun call!8672 () ListLongMap!1449)

(assert (=> bm!8670 (= call!8677 call!8672)))

(declare-fun b!89443 () Bool)

(assert (=> b!89443 (= e!58209 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89444 () Bool)

(assert (=> b!89444 (= e!58212 e!58202)))

(declare-fun res!45702 () Bool)

(assert (=> b!89444 (= res!45702 call!8673)))

(assert (=> b!89444 (=> (not res!45702) (not e!58202))))

(declare-fun b!89445 () Bool)

(assert (=> b!89445 (= e!58207 (= (apply!84 lt!42984 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16))))))

(declare-fun b!89446 () Bool)

(assert (=> b!89446 (= e!58201 (= (apply!84 lt!42984 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)) (get!1217 (select (arr!1923 (ite (or c!14770 c!14771) (_values!2354 newMap!16) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!347 (defaultEntry!2371 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89446 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2169 (ite (or c!14770 c!14771) (_values!2354 newMap!16) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16)))))))))

(assert (=> b!89446 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun bm!8671 () Bool)

(assert (=> bm!8671 (= call!8676 call!8675)))

(declare-fun b!89447 () Bool)

(declare-fun res!45698 () Bool)

(assert (=> b!89447 (=> (not res!45698) (not e!58208))))

(assert (=> b!89447 (= res!45698 e!58203)))

(declare-fun c!14880 () Bool)

(assert (=> b!89447 (= c!14880 (not (= (bvand (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!89448 () Bool)

(assert (=> b!89448 (= e!58208 e!58212)))

(declare-fun c!14882 () Bool)

(assert (=> b!89448 (= c!14882 (not (= (bvand (ite (and c!14770 c!14772) lt!42668 (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89449 () Bool)

(assert (=> b!89449 (= e!58206 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8672 () Bool)

(assert (=> bm!8672 (= call!8672 call!8674)))

(declare-fun bm!8673 () Bool)

(assert (=> bm!8673 (= call!8675 (+!111 (ite c!14877 call!8674 (ite c!14879 call!8672 call!8677)) (ite (or c!14877 c!14879) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!14770 c!14772) lt!42407 (zeroValue!2260 newMap!16))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 newMap!16)))))))

(declare-fun bm!8674 () Bool)

(assert (=> bm!8674 (= call!8671 (contains!754 lt!42984 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23805 c!14877) b!89441))

(assert (= (and d!23805 (not c!14877)) b!89430))

(assert (= (and b!89430 c!14879) b!89439))

(assert (= (and b!89430 (not c!14879)) b!89438))

(assert (= (and b!89438 c!14881) b!89437))

(assert (= (and b!89438 (not c!14881)) b!89433))

(assert (= (or b!89437 b!89433) bm!8670))

(assert (= (or b!89439 bm!8670) bm!8672))

(assert (= (or b!89439 b!89437) bm!8671))

(assert (= (or b!89441 bm!8672) bm!8669))

(assert (= (or b!89441 bm!8671) bm!8673))

(assert (= (and d!23805 res!45705) b!89443))

(assert (= (and d!23805 c!14878) b!89442))

(assert (= (and d!23805 (not c!14878)) b!89434))

(assert (= (and d!23805 res!45699) b!89436))

(assert (= (and b!89436 res!45704) b!89449))

(assert (= (and b!89436 (not res!45701)) b!89440))

(assert (= (and b!89440 res!45700) b!89446))

(assert (= (and b!89436 res!45703) b!89447))

(assert (= (and b!89447 c!14880) b!89431))

(assert (= (and b!89447 (not c!14880)) b!89435))

(assert (= (and b!89431 res!45697) b!89445))

(assert (= (or b!89431 b!89435) bm!8674))

(assert (= (and b!89447 res!45698) b!89448))

(assert (= (and b!89448 c!14882) b!89444))

(assert (= (and b!89448 (not c!14882)) b!89432))

(assert (= (and b!89444 res!45702) b!89429))

(assert (= (or b!89444 b!89432) bm!8668))

(declare-fun b_lambda!3949 () Bool)

(assert (=> (not b_lambda!3949) (not b!89446)))

(assert (=> b!89446 t!5278))

(declare-fun b_and!5365 () Bool)

(assert (= b_and!5361 (and (=> t!5278 result!2975) b_and!5365)))

(assert (=> b!89446 t!5280))

(declare-fun b_and!5367 () Bool)

(assert (= b_and!5363 (and (=> t!5280 result!2977) b_and!5367)))

(declare-fun m!95803 () Bool)

(assert (=> bm!8673 m!95803))

(assert (=> d!23805 m!95573))

(declare-fun m!95805 () Bool)

(assert (=> bm!8668 m!95805))

(assert (=> b!89449 m!95577))

(assert (=> b!89449 m!95577))

(assert (=> b!89449 m!95579))

(assert (=> b!89443 m!95577))

(assert (=> b!89443 m!95577))

(assert (=> b!89443 m!95579))

(declare-fun m!95807 () Bool)

(assert (=> bm!8674 m!95807))

(declare-fun m!95809 () Bool)

(assert (=> b!89442 m!95809))

(declare-fun m!95811 () Bool)

(assert (=> b!89442 m!95811))

(declare-fun m!95813 () Bool)

(assert (=> b!89442 m!95813))

(declare-fun m!95815 () Bool)

(assert (=> b!89442 m!95815))

(declare-fun m!95817 () Bool)

(assert (=> b!89442 m!95817))

(declare-fun m!95819 () Bool)

(assert (=> b!89442 m!95819))

(declare-fun m!95821 () Bool)

(assert (=> b!89442 m!95821))

(declare-fun m!95823 () Bool)

(assert (=> b!89442 m!95823))

(assert (=> b!89442 m!95823))

(declare-fun m!95825 () Bool)

(assert (=> b!89442 m!95825))

(declare-fun m!95827 () Bool)

(assert (=> b!89442 m!95827))

(assert (=> b!89442 m!95819))

(declare-fun m!95829 () Bool)

(assert (=> b!89442 m!95829))

(declare-fun m!95831 () Bool)

(assert (=> b!89442 m!95831))

(assert (=> b!89442 m!95811))

(declare-fun m!95833 () Bool)

(assert (=> b!89442 m!95833))

(declare-fun m!95835 () Bool)

(assert (=> b!89442 m!95835))

(assert (=> b!89442 m!95577))

(assert (=> b!89442 m!95831))

(declare-fun m!95837 () Bool)

(assert (=> b!89442 m!95837))

(declare-fun m!95839 () Bool)

(assert (=> b!89442 m!95839))

(assert (=> bm!8669 m!95815))

(declare-fun m!95841 () Bool)

(assert (=> b!89429 m!95841))

(declare-fun m!95843 () Bool)

(assert (=> b!89441 m!95843))

(declare-fun m!95845 () Bool)

(assert (=> b!89446 m!95845))

(assert (=> b!89446 m!95621))

(declare-fun m!95847 () Bool)

(assert (=> b!89446 m!95847))

(assert (=> b!89446 m!95621))

(assert (=> b!89446 m!95577))

(assert (=> b!89446 m!95577))

(declare-fun m!95849 () Bool)

(assert (=> b!89446 m!95849))

(assert (=> b!89446 m!95845))

(assert (=> b!89440 m!95577))

(assert (=> b!89440 m!95577))

(declare-fun m!95851 () Bool)

(assert (=> b!89440 m!95851))

(declare-fun m!95853 () Bool)

(assert (=> b!89445 m!95853))

(assert (=> bm!8586 d!23805))

(declare-fun d!23807 () Bool)

(declare-fun res!45706 () Bool)

(declare-fun e!58213 () Bool)

(assert (=> d!23807 (=> (not res!45706) (not e!58213))))

(assert (=> d!23807 (= res!45706 (simpleValid!60 (v!2677 (underlying!298 thiss!992))))))

(assert (=> d!23807 (= (valid!343 (v!2677 (underlying!298 thiss!992))) e!58213)))

(declare-fun b!89450 () Bool)

(declare-fun res!45707 () Bool)

(assert (=> b!89450 (=> (not res!45707) (not e!58213))))

(assert (=> b!89450 (= res!45707 (= (arrayCountValidKeys!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000000 (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))) (_size!432 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun b!89451 () Bool)

(declare-fun res!45708 () Bool)

(assert (=> b!89451 (=> (not res!45708) (not e!58213))))

(assert (=> b!89451 (= res!45708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun b!89452 () Bool)

(assert (=> b!89452 (= e!58213 (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000000 Nil!1513))))

(assert (= (and d!23807 res!45706) b!89450))

(assert (= (and b!89450 res!45707) b!89451))

(assert (= (and b!89451 res!45708) b!89452))

(declare-fun m!95855 () Bool)

(assert (=> d!23807 m!95855))

(declare-fun m!95857 () Bool)

(assert (=> b!89450 m!95857))

(assert (=> b!89451 m!94951))

(assert (=> b!89452 m!94929))

(assert (=> d!23705 d!23807))

(declare-fun d!23809 () Bool)

(assert (=> d!23809 (= (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89144 d!23809))

(declare-fun d!23811 () Bool)

(assert (=> d!23811 (= (get!1219 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88911 d!23811))

(assert (=> d!23703 d!23663))

(declare-fun d!23813 () Bool)

(assert (=> d!23813 (= (apply!84 lt!42758 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1220 (getValueByKey!143 (toList!740 lt!42758) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3757 () Bool)

(assert (= bs!3757 d!23813))

(assert (=> bs!3757 m!95107))

(declare-fun m!95859 () Bool)

(assert (=> bs!3757 m!95859))

(assert (=> bs!3757 m!95859))

(declare-fun m!95861 () Bool)

(assert (=> bs!3757 m!95861))

(assert (=> b!89136 d!23813))

(assert (=> b!89136 d!23765))

(declare-fun b!89453 () Bool)

(declare-fun e!58216 () Bool)

(declare-fun e!58217 () Bool)

(assert (=> b!89453 (= e!58216 e!58217)))

(declare-fun res!45711 () Bool)

(assert (=> b!89453 (=> (not res!45711) (not e!58217))))

(declare-fun e!58215 () Bool)

(assert (=> b!89453 (= res!45711 (not e!58215))))

(declare-fun res!45710 () Bool)

(assert (=> b!89453 (=> (not res!45710) (not e!58215))))

(assert (=> b!89453 (= res!45710 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89454 () Bool)

(declare-fun e!58214 () Bool)

(declare-fun call!8678 () Bool)

(assert (=> b!89454 (= e!58214 call!8678)))

(declare-fun b!89455 () Bool)

(assert (=> b!89455 (= e!58215 (contains!756 Nil!1513 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89456 () Bool)

(assert (=> b!89456 (= e!58214 call!8678)))

(declare-fun bm!8675 () Bool)

(declare-fun c!14883 () Bool)

(assert (=> bm!8675 (= call!8678 (arrayNoDuplicates!0 (_keys!4049 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14883 (Cons!1512 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000) Nil!1513) Nil!1513)))))

(declare-fun d!23815 () Bool)

(declare-fun res!45709 () Bool)

(assert (=> d!23815 (=> res!45709 e!58216)))

(assert (=> d!23815 (= res!45709 (bvsge #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(assert (=> d!23815 (= (arrayNoDuplicates!0 (_keys!4049 newMap!16) #b00000000000000000000000000000000 Nil!1513) e!58216)))

(declare-fun b!89457 () Bool)

(assert (=> b!89457 (= e!58217 e!58214)))

(assert (=> b!89457 (= c!14883 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!23815 (not res!45709)) b!89453))

(assert (= (and b!89453 res!45710) b!89455))

(assert (= (and b!89453 res!45711) b!89457))

(assert (= (and b!89457 c!14883) b!89454))

(assert (= (and b!89457 (not c!14883)) b!89456))

(assert (= (or b!89454 b!89456) bm!8675))

(assert (=> b!89453 m!95577))

(assert (=> b!89453 m!95577))

(assert (=> b!89453 m!95579))

(assert (=> b!89455 m!95577))

(assert (=> b!89455 m!95577))

(declare-fun m!95863 () Bool)

(assert (=> b!89455 m!95863))

(assert (=> bm!8675 m!95577))

(declare-fun m!95865 () Bool)

(assert (=> bm!8675 m!95865))

(assert (=> b!89457 m!95577))

(assert (=> b!89457 m!95577))

(assert (=> b!89457 m!95579))

(assert (=> b!88947 d!23815))

(declare-fun d!23817 () Bool)

(assert (=> d!23817 (= (inRange!0 (ite c!14771 (ite c!14765 (index!3096 lt!42669) (ite c!14761 (index!3095 lt!42693) (index!3098 lt!42693))) (ite c!14764 (index!3096 lt!42682) (ite c!14769 (index!3095 lt!42670) (index!3098 lt!42670)))) (mask!6415 newMap!16)) (and (bvsge (ite c!14771 (ite c!14765 (index!3096 lt!42669) (ite c!14761 (index!3095 lt!42693) (index!3098 lt!42693))) (ite c!14764 (index!3096 lt!42682) (ite c!14769 (index!3095 lt!42670) (index!3098 lt!42670)))) #b00000000000000000000000000000000) (bvslt (ite c!14771 (ite c!14765 (index!3096 lt!42669) (ite c!14761 (index!3095 lt!42693) (index!3098 lt!42693))) (ite c!14764 (index!3096 lt!42682) (ite c!14769 (index!3095 lt!42670) (index!3098 lt!42670)))) (bvadd (mask!6415 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!8596 d!23817))

(declare-fun b!89458 () Bool)

(declare-fun e!58220 () Bool)

(declare-fun lt!43006 () ListLongMap!1449)

(assert (=> b!89458 (= e!58220 (= (apply!84 lt!43006 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2260 newMap!16)))))

(declare-fun b!89459 () Bool)

(declare-fun e!58228 () ListLongMap!1449)

(declare-fun e!58222 () ListLongMap!1449)

(assert (=> b!89459 (= e!58228 e!58222)))

(declare-fun c!14886 () Bool)

(assert (=> b!89459 (= c!14886 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89460 () Bool)

(declare-fun e!58221 () Bool)

(declare-fun e!58225 () Bool)

(assert (=> b!89460 (= e!58221 e!58225)))

(declare-fun res!45712 () Bool)

(declare-fun call!8679 () Bool)

(assert (=> b!89460 (= res!45712 call!8679)))

(assert (=> b!89460 (=> (not res!45712) (not e!58225))))

(declare-fun bm!8676 () Bool)

(declare-fun call!8681 () Bool)

(assert (=> bm!8676 (= call!8681 (contains!754 lt!43006 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89461 () Bool)

(declare-fun e!58230 () Bool)

(assert (=> b!89461 (= e!58230 (not call!8681))))

(declare-fun b!89462 () Bool)

(declare-fun e!58218 () ListLongMap!1449)

(declare-fun call!8685 () ListLongMap!1449)

(assert (=> b!89462 (= e!58218 call!8685)))

(declare-fun b!89463 () Bool)

(declare-fun e!58223 () Unit!2620)

(declare-fun Unit!2645 () Unit!2620)

(assert (=> b!89463 (= e!58223 Unit!2645)))

(declare-fun b!89464 () Bool)

(assert (=> b!89464 (= e!58221 (not call!8679))))

(declare-fun b!89465 () Bool)

(declare-fun res!45718 () Bool)

(declare-fun e!58226 () Bool)

(assert (=> b!89465 (=> (not res!45718) (not e!58226))))

(declare-fun e!58229 () Bool)

(assert (=> b!89465 (= res!45718 e!58229)))

(declare-fun res!45716 () Bool)

(assert (=> b!89465 (=> res!45716 e!58229)))

(declare-fun e!58224 () Bool)

(assert (=> b!89465 (= res!45716 (not e!58224))))

(declare-fun res!45719 () Bool)

(assert (=> b!89465 (=> (not res!45719) (not e!58224))))

(assert (=> b!89465 (= res!45719 (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun d!23819 () Bool)

(assert (=> d!23819 e!58226))

(declare-fun res!45714 () Bool)

(assert (=> d!23819 (=> (not res!45714) (not e!58226))))

(assert (=> d!23819 (= res!45714 (or (bvsge #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))))

(declare-fun lt!43003 () ListLongMap!1449)

(assert (=> d!23819 (= lt!43006 lt!43003)))

(declare-fun lt!42995 () Unit!2620)

(assert (=> d!23819 (= lt!42995 e!58223)))

(declare-fun c!14885 () Bool)

(declare-fun e!58227 () Bool)

(assert (=> d!23819 (= c!14885 e!58227)))

(declare-fun res!45720 () Bool)

(assert (=> d!23819 (=> (not res!45720) (not e!58227))))

(assert (=> d!23819 (= res!45720 (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(assert (=> d!23819 (= lt!43003 e!58228)))

(declare-fun c!14884 () Bool)

(assert (=> d!23819 (= c!14884 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23819 (validMask!0 (mask!6415 newMap!16))))

(assert (=> d!23819 (= (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) lt!43006)))

(declare-fun b!89466 () Bool)

(declare-fun call!8684 () ListLongMap!1449)

(assert (=> b!89466 (= e!58218 call!8684)))

(declare-fun b!89467 () Bool)

(declare-fun c!14888 () Bool)

(assert (=> b!89467 (= c!14888 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!89467 (= e!58222 e!58218)))

(declare-fun b!89468 () Bool)

(assert (=> b!89468 (= e!58222 call!8684)))

(declare-fun bm!8677 () Bool)

(declare-fun call!8682 () ListLongMap!1449)

(assert (=> bm!8677 (= call!8682 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun b!89469 () Bool)

(declare-fun e!58219 () Bool)

(assert (=> b!89469 (= e!58229 e!58219)))

(declare-fun res!45715 () Bool)

(assert (=> b!89469 (=> (not res!45715) (not e!58219))))

(assert (=> b!89469 (= res!45715 (contains!754 lt!43006 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!89469 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun b!89470 () Bool)

(declare-fun call!8683 () ListLongMap!1449)

(assert (=> b!89470 (= e!58228 (+!111 call!8683 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 newMap!16))))))

(declare-fun b!89471 () Bool)

(declare-fun lt!42990 () Unit!2620)

(assert (=> b!89471 (= e!58223 lt!42990)))

(declare-fun lt!42987 () ListLongMap!1449)

(assert (=> b!89471 (= lt!42987 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42986 () (_ BitVec 64))

(assert (=> b!89471 (= lt!42986 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42994 () (_ BitVec 64))

(assert (=> b!89471 (= lt!42994 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42996 () Unit!2620)

(assert (=> b!89471 (= lt!42996 (addStillContains!60 lt!42987 lt!42986 (zeroValue!2260 newMap!16) lt!42994))))

(assert (=> b!89471 (contains!754 (+!111 lt!42987 (tuple2!2201 lt!42986 (zeroValue!2260 newMap!16))) lt!42994)))

(declare-fun lt!42988 () Unit!2620)

(assert (=> b!89471 (= lt!42988 lt!42996)))

(declare-fun lt!43004 () ListLongMap!1449)

(assert (=> b!89471 (= lt!43004 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42993 () (_ BitVec 64))

(assert (=> b!89471 (= lt!42993 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43000 () (_ BitVec 64))

(assert (=> b!89471 (= lt!43000 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42999 () Unit!2620)

(assert (=> b!89471 (= lt!42999 (addApplyDifferent!60 lt!43004 lt!42993 (minValue!2260 newMap!16) lt!43000))))

(assert (=> b!89471 (= (apply!84 (+!111 lt!43004 (tuple2!2201 lt!42993 (minValue!2260 newMap!16))) lt!43000) (apply!84 lt!43004 lt!43000))))

(declare-fun lt!43001 () Unit!2620)

(assert (=> b!89471 (= lt!43001 lt!42999)))

(declare-fun lt!42998 () ListLongMap!1449)

(assert (=> b!89471 (= lt!42998 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42991 () (_ BitVec 64))

(assert (=> b!89471 (= lt!42991 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43002 () (_ BitVec 64))

(assert (=> b!89471 (= lt!43002 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42997 () Unit!2620)

(assert (=> b!89471 (= lt!42997 (addApplyDifferent!60 lt!42998 lt!42991 (zeroValue!2260 newMap!16) lt!43002))))

(assert (=> b!89471 (= (apply!84 (+!111 lt!42998 (tuple2!2201 lt!42991 (zeroValue!2260 newMap!16))) lt!43002) (apply!84 lt!42998 lt!43002))))

(declare-fun lt!43005 () Unit!2620)

(assert (=> b!89471 (= lt!43005 lt!42997)))

(declare-fun lt!43007 () ListLongMap!1449)

(assert (=> b!89471 (= lt!43007 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42992 () (_ BitVec 64))

(assert (=> b!89471 (= lt!42992 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42989 () (_ BitVec 64))

(assert (=> b!89471 (= lt!42989 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89471 (= lt!42990 (addApplyDifferent!60 lt!43007 lt!42992 (minValue!2260 newMap!16) lt!42989))))

(assert (=> b!89471 (= (apply!84 (+!111 lt!43007 (tuple2!2201 lt!42992 (minValue!2260 newMap!16))) lt!42989) (apply!84 lt!43007 lt!42989))))

(declare-fun bm!8678 () Bool)

(declare-fun call!8680 () ListLongMap!1449)

(assert (=> bm!8678 (= call!8685 call!8680)))

(declare-fun b!89472 () Bool)

(assert (=> b!89472 (= e!58227 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89473 () Bool)

(assert (=> b!89473 (= e!58230 e!58220)))

(declare-fun res!45717 () Bool)

(assert (=> b!89473 (= res!45717 call!8681)))

(assert (=> b!89473 (=> (not res!45717) (not e!58220))))

(declare-fun b!89474 () Bool)

(assert (=> b!89474 (= e!58225 (= (apply!84 lt!43006 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2260 newMap!16)))))

(declare-fun b!89475 () Bool)

(assert (=> b!89475 (= e!58219 (= (apply!84 lt!43006 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)) (get!1217 (select (arr!1923 (_values!2354 newMap!16)) #b00000000000000000000000000000000) (dynLambda!347 (defaultEntry!2371 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89475 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2169 (_values!2354 newMap!16))))))

(assert (=> b!89475 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun bm!8679 () Bool)

(assert (=> bm!8679 (= call!8684 call!8683)))

(declare-fun b!89476 () Bool)

(declare-fun res!45713 () Bool)

(assert (=> b!89476 (=> (not res!45713) (not e!58226))))

(assert (=> b!89476 (= res!45713 e!58221)))

(declare-fun c!14887 () Bool)

(assert (=> b!89476 (= c!14887 (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!89477 () Bool)

(assert (=> b!89477 (= e!58226 e!58230)))

(declare-fun c!14889 () Bool)

(assert (=> b!89477 (= c!14889 (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89478 () Bool)

(assert (=> b!89478 (= e!58224 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8680 () Bool)

(assert (=> bm!8680 (= call!8680 call!8682)))

(declare-fun bm!8681 () Bool)

(assert (=> bm!8681 (= call!8683 (+!111 (ite c!14884 call!8682 (ite c!14886 call!8680 call!8685)) (ite (or c!14884 c!14886) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 newMap!16)) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 newMap!16)))))))

(declare-fun bm!8682 () Bool)

(assert (=> bm!8682 (= call!8679 (contains!754 lt!43006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23819 c!14884) b!89470))

(assert (= (and d!23819 (not c!14884)) b!89459))

(assert (= (and b!89459 c!14886) b!89468))

(assert (= (and b!89459 (not c!14886)) b!89467))

(assert (= (and b!89467 c!14888) b!89466))

(assert (= (and b!89467 (not c!14888)) b!89462))

(assert (= (or b!89466 b!89462) bm!8678))

(assert (= (or b!89468 bm!8678) bm!8680))

(assert (= (or b!89468 b!89466) bm!8679))

(assert (= (or b!89470 bm!8680) bm!8677))

(assert (= (or b!89470 bm!8679) bm!8681))

(assert (= (and d!23819 res!45720) b!89472))

(assert (= (and d!23819 c!14885) b!89471))

(assert (= (and d!23819 (not c!14885)) b!89463))

(assert (= (and d!23819 res!45714) b!89465))

(assert (= (and b!89465 res!45719) b!89478))

(assert (= (and b!89465 (not res!45716)) b!89469))

(assert (= (and b!89469 res!45715) b!89475))

(assert (= (and b!89465 res!45718) b!89476))

(assert (= (and b!89476 c!14887) b!89460))

(assert (= (and b!89476 (not c!14887)) b!89464))

(assert (= (and b!89460 res!45712) b!89474))

(assert (= (or b!89460 b!89464) bm!8682))

(assert (= (and b!89476 res!45713) b!89477))

(assert (= (and b!89477 c!14889) b!89473))

(assert (= (and b!89477 (not c!14889)) b!89461))

(assert (= (and b!89473 res!45717) b!89458))

(assert (= (or b!89473 b!89461) bm!8676))

(declare-fun b_lambda!3951 () Bool)

(assert (=> (not b_lambda!3951) (not b!89475)))

(assert (=> b!89475 t!5278))

(declare-fun b_and!5369 () Bool)

(assert (= b_and!5365 (and (=> t!5278 result!2975) b_and!5369)))

(assert (=> b!89475 t!5280))

(declare-fun b_and!5371 () Bool)

(assert (= b_and!5367 (and (=> t!5280 result!2977) b_and!5371)))

(declare-fun m!95867 () Bool)

(assert (=> bm!8681 m!95867))

(assert (=> d!23819 m!95573))

(declare-fun m!95869 () Bool)

(assert (=> bm!8676 m!95869))

(assert (=> b!89478 m!95577))

(assert (=> b!89478 m!95577))

(assert (=> b!89478 m!95579))

(assert (=> b!89472 m!95577))

(assert (=> b!89472 m!95577))

(assert (=> b!89472 m!95579))

(declare-fun m!95871 () Bool)

(assert (=> bm!8682 m!95871))

(declare-fun m!95873 () Bool)

(assert (=> b!89471 m!95873))

(declare-fun m!95875 () Bool)

(assert (=> b!89471 m!95875))

(declare-fun m!95877 () Bool)

(assert (=> b!89471 m!95877))

(declare-fun m!95879 () Bool)

(assert (=> b!89471 m!95879))

(declare-fun m!95881 () Bool)

(assert (=> b!89471 m!95881))

(declare-fun m!95883 () Bool)

(assert (=> b!89471 m!95883))

(declare-fun m!95885 () Bool)

(assert (=> b!89471 m!95885))

(declare-fun m!95887 () Bool)

(assert (=> b!89471 m!95887))

(assert (=> b!89471 m!95887))

(declare-fun m!95889 () Bool)

(assert (=> b!89471 m!95889))

(declare-fun m!95891 () Bool)

(assert (=> b!89471 m!95891))

(assert (=> b!89471 m!95883))

(declare-fun m!95893 () Bool)

(assert (=> b!89471 m!95893))

(declare-fun m!95895 () Bool)

(assert (=> b!89471 m!95895))

(assert (=> b!89471 m!95875))

(declare-fun m!95897 () Bool)

(assert (=> b!89471 m!95897))

(declare-fun m!95899 () Bool)

(assert (=> b!89471 m!95899))

(assert (=> b!89471 m!95577))

(assert (=> b!89471 m!95895))

(declare-fun m!95901 () Bool)

(assert (=> b!89471 m!95901))

(declare-fun m!95903 () Bool)

(assert (=> b!89471 m!95903))

(assert (=> bm!8677 m!95879))

(declare-fun m!95905 () Bool)

(assert (=> b!89458 m!95905))

(declare-fun m!95907 () Bool)

(assert (=> b!89470 m!95907))

(assert (=> b!89475 m!95619))

(assert (=> b!89475 m!95621))

(assert (=> b!89475 m!95623))

(assert (=> b!89475 m!95621))

(assert (=> b!89475 m!95577))

(assert (=> b!89475 m!95577))

(declare-fun m!95909 () Bool)

(assert (=> b!89475 m!95909))

(assert (=> b!89475 m!95619))

(assert (=> b!89469 m!95577))

(assert (=> b!89469 m!95577))

(declare-fun m!95911 () Bool)

(assert (=> b!89469 m!95911))

(declare-fun m!95913 () Bool)

(assert (=> b!89474 m!95913))

(assert (=> d!23701 d!23819))

(declare-fun b!89482 () Bool)

(declare-fun e!58232 () Option!149)

(assert (=> b!89482 (= e!58232 None!147)))

(declare-fun b!89480 () Bool)

(declare-fun e!58231 () Option!149)

(assert (=> b!89480 (= e!58231 e!58232)))

(declare-fun c!14891 () Bool)

(assert (=> b!89480 (= c!14891 (and ((_ is Cons!1513) (toList!740 lt!42560)) (not (= (_1!1111 (h!2105 (toList!740 lt!42560))) (_1!1111 lt!42408)))))))

(declare-fun d!23821 () Bool)

(declare-fun c!14890 () Bool)

(assert (=> d!23821 (= c!14890 (and ((_ is Cons!1513) (toList!740 lt!42560)) (= (_1!1111 (h!2105 (toList!740 lt!42560))) (_1!1111 lt!42408))))))

(assert (=> d!23821 (= (getValueByKey!143 (toList!740 lt!42560) (_1!1111 lt!42408)) e!58231)))

(declare-fun b!89479 () Bool)

(assert (=> b!89479 (= e!58231 (Some!148 (_2!1111 (h!2105 (toList!740 lt!42560)))))))

(declare-fun b!89481 () Bool)

(assert (=> b!89481 (= e!58232 (getValueByKey!143 (t!5267 (toList!740 lt!42560)) (_1!1111 lt!42408)))))

(assert (= (and d!23821 c!14890) b!89479))

(assert (= (and d!23821 (not c!14890)) b!89480))

(assert (= (and b!89480 c!14891) b!89481))

(assert (= (and b!89480 (not c!14891)) b!89482))

(declare-fun m!95915 () Bool)

(assert (=> b!89481 m!95915))

(assert (=> b!88882 d!23821))

(assert (=> bm!8616 d!23653))

(declare-fun b!89486 () Bool)

(declare-fun e!58234 () Option!149)

(assert (=> b!89486 (= e!58234 None!147)))

(declare-fun b!89484 () Bool)

(declare-fun e!58233 () Option!149)

(assert (=> b!89484 (= e!58233 e!58234)))

(declare-fun c!14893 () Bool)

(assert (=> b!89484 (= c!14893 (and ((_ is Cons!1513) (toList!740 lt!42564)) (not (= (_1!1111 (h!2105 (toList!740 lt!42564))) (_1!1111 lt!42406)))))))

(declare-fun d!23823 () Bool)

(declare-fun c!14892 () Bool)

(assert (=> d!23823 (= c!14892 (and ((_ is Cons!1513) (toList!740 lt!42564)) (= (_1!1111 (h!2105 (toList!740 lt!42564))) (_1!1111 lt!42406))))))

(assert (=> d!23823 (= (getValueByKey!143 (toList!740 lt!42564) (_1!1111 lt!42406)) e!58233)))

(declare-fun b!89483 () Bool)

(assert (=> b!89483 (= e!58233 (Some!148 (_2!1111 (h!2105 (toList!740 lt!42564)))))))

(declare-fun b!89485 () Bool)

(assert (=> b!89485 (= e!58234 (getValueByKey!143 (t!5267 (toList!740 lt!42564)) (_1!1111 lt!42406)))))

(assert (= (and d!23823 c!14892) b!89483))

(assert (= (and d!23823 (not c!14892)) b!89484))

(assert (= (and b!89484 c!14893) b!89485))

(assert (= (and b!89484 (not c!14893)) b!89486))

(declare-fun m!95917 () Bool)

(assert (=> b!89485 m!95917))

(assert (=> b!88884 d!23823))

(declare-fun d!23825 () Bool)

(assert (=> d!23825 (= (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88865 d!23825))

(assert (=> bm!8593 d!23701))

(declare-fun b!89490 () Bool)

(declare-fun e!58236 () Option!149)

(assert (=> b!89490 (= e!58236 None!147)))

(declare-fun b!89488 () Bool)

(declare-fun e!58235 () Option!149)

(assert (=> b!89488 (= e!58235 e!58236)))

(declare-fun c!14895 () Bool)

(assert (=> b!89488 (= c!14895 (and ((_ is Cons!1513) (toList!740 lt!42568)) (not (= (_1!1111 (h!2105 (toList!740 lt!42568))) (_1!1111 lt!42410)))))))

(declare-fun d!23827 () Bool)

(declare-fun c!14894 () Bool)

(assert (=> d!23827 (= c!14894 (and ((_ is Cons!1513) (toList!740 lt!42568)) (= (_1!1111 (h!2105 (toList!740 lt!42568))) (_1!1111 lt!42410))))))

(assert (=> d!23827 (= (getValueByKey!143 (toList!740 lt!42568) (_1!1111 lt!42410)) e!58235)))

(declare-fun b!89487 () Bool)

(assert (=> b!89487 (= e!58235 (Some!148 (_2!1111 (h!2105 (toList!740 lt!42568)))))))

(declare-fun b!89489 () Bool)

(assert (=> b!89489 (= e!58236 (getValueByKey!143 (t!5267 (toList!740 lt!42568)) (_1!1111 lt!42410)))))

(assert (= (and d!23827 c!14894) b!89487))

(assert (= (and d!23827 (not c!14894)) b!89488))

(assert (= (and b!89488 c!14895) b!89489))

(assert (= (and b!89488 (not c!14895)) b!89490))

(declare-fun m!95919 () Bool)

(assert (=> b!89489 m!95919))

(assert (=> b!88886 d!23827))

(declare-fun bm!8687 () Bool)

(declare-fun call!8691 () Bool)

(assert (=> bm!8687 (= call!8691 (arrayContainsKey!0 (_keys!4049 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!8688 () Bool)

(declare-fun c!14900 () Bool)

(declare-fun lt!43012 () SeekEntryResult!239)

(declare-fun call!8690 () Bool)

(assert (=> bm!8688 (= call!8690 (inRange!0 (ite c!14900 (index!3095 lt!43012) (index!3098 lt!43012)) (mask!6415 newMap!16)))))

(declare-fun b!89507 () Bool)

(declare-fun e!58245 () Bool)

(declare-fun e!58247 () Bool)

(assert (=> b!89507 (= e!58245 e!58247)))

(declare-fun c!14901 () Bool)

(assert (=> b!89507 (= c!14901 ((_ is MissingVacant!239) lt!43012))))

(declare-fun b!89508 () Bool)

(assert (=> b!89508 (= e!58247 ((_ is Undefined!239) lt!43012))))

(declare-fun b!89509 () Bool)

(declare-fun res!45729 () Bool)

(declare-fun e!58246 () Bool)

(assert (=> b!89509 (=> (not res!45729) (not e!58246))))

(assert (=> b!89509 (= res!45729 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3098 lt!43012)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89509 (and (bvsge (index!3098 lt!43012) #b00000000000000000000000000000000) (bvslt (index!3098 lt!43012) (size!2168 (_keys!4049 newMap!16))))))

(declare-fun b!89510 () Bool)

(assert (=> b!89510 (and (bvsge (index!3095 lt!43012) #b00000000000000000000000000000000) (bvslt (index!3095 lt!43012) (size!2168 (_keys!4049 newMap!16))))))

(declare-fun res!45730 () Bool)

(assert (=> b!89510 (= res!45730 (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3095 lt!43012)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!58248 () Bool)

(assert (=> b!89510 (=> (not res!45730) (not e!58248))))

(declare-fun b!89511 () Bool)

(assert (=> b!89511 (= e!58246 (not call!8691))))

(declare-fun b!89512 () Bool)

(assert (=> b!89512 (= e!58248 (not call!8691))))

(declare-fun d!23829 () Bool)

(assert (=> d!23829 e!58245))

(assert (=> d!23829 (= c!14900 ((_ is MissingZero!239) lt!43012))))

(assert (=> d!23829 (= lt!43012 (seekEntryOrOpen!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (_keys!4049 newMap!16) (mask!6415 newMap!16)))))

(declare-fun lt!43013 () Unit!2620)

(declare-fun choose!538 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) Int) Unit!2620)

(assert (=> d!23829 (= lt!43013 (choose!538 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(assert (=> d!23829 (validMask!0 (mask!6415 newMap!16))))

(assert (=> d!23829 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)) lt!43013)))

(declare-fun b!89513 () Bool)

(declare-fun res!45731 () Bool)

(assert (=> b!89513 (=> (not res!45731) (not e!58246))))

(assert (=> b!89513 (= res!45731 call!8690)))

(assert (=> b!89513 (= e!58247 e!58246)))

(declare-fun b!89514 () Bool)

(assert (=> b!89514 (= e!58245 e!58248)))

(declare-fun res!45732 () Bool)

(assert (=> b!89514 (= res!45732 call!8690)))

(assert (=> b!89514 (=> (not res!45732) (not e!58248))))

(assert (= (and d!23829 c!14900) b!89514))

(assert (= (and d!23829 (not c!14900)) b!89507))

(assert (= (and b!89514 res!45732) b!89510))

(assert (= (and b!89510 res!45730) b!89512))

(assert (= (and b!89507 c!14901) b!89513))

(assert (= (and b!89507 (not c!14901)) b!89508))

(assert (= (and b!89513 res!45731) b!89509))

(assert (= (and b!89509 res!45729) b!89511))

(assert (= (or b!89514 b!89513) bm!8688))

(assert (= (or b!89512 b!89511) bm!8687))

(declare-fun m!95921 () Bool)

(assert (=> b!89509 m!95921))

(declare-fun m!95923 () Bool)

(assert (=> bm!8688 m!95923))

(declare-fun m!95925 () Bool)

(assert (=> b!89510 m!95925))

(assert (=> bm!8687 m!94891))

(assert (=> bm!8687 m!95283))

(assert (=> d!23829 m!94891))

(assert (=> d!23829 m!95295))

(assert (=> d!23829 m!94891))

(declare-fun m!95927 () Bool)

(assert (=> d!23829 m!95927))

(assert (=> d!23829 m!95573))

(assert (=> bm!8584 d!23829))

(declare-fun d!23831 () Bool)

(declare-fun res!45733 () Bool)

(declare-fun e!58249 () Bool)

(assert (=> d!23831 (=> (not res!45733) (not e!58249))))

(assert (=> d!23831 (= res!45733 (simpleValid!60 (_2!1112 lt!42677)))))

(assert (=> d!23831 (= (valid!343 (_2!1112 lt!42677)) e!58249)))

(declare-fun b!89515 () Bool)

(declare-fun res!45734 () Bool)

(assert (=> b!89515 (=> (not res!45734) (not e!58249))))

(assert (=> b!89515 (= res!45734 (= (arrayCountValidKeys!0 (_keys!4049 (_2!1112 lt!42677)) #b00000000000000000000000000000000 (size!2168 (_keys!4049 (_2!1112 lt!42677)))) (_size!432 (_2!1112 lt!42677))))))

(declare-fun b!89516 () Bool)

(declare-fun res!45735 () Bool)

(assert (=> b!89516 (=> (not res!45735) (not e!58249))))

(assert (=> b!89516 (= res!45735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4049 (_2!1112 lt!42677)) (mask!6415 (_2!1112 lt!42677))))))

(declare-fun b!89517 () Bool)

(assert (=> b!89517 (= e!58249 (arrayNoDuplicates!0 (_keys!4049 (_2!1112 lt!42677)) #b00000000000000000000000000000000 Nil!1513))))

(assert (= (and d!23831 res!45733) b!89515))

(assert (= (and b!89515 res!45734) b!89516))

(assert (= (and b!89516 res!45735) b!89517))

(declare-fun m!95929 () Bool)

(assert (=> d!23831 m!95929))

(declare-fun m!95931 () Bool)

(assert (=> b!89515 m!95931))

(declare-fun m!95933 () Bool)

(assert (=> b!89516 m!95933))

(declare-fun m!95935 () Bool)

(assert (=> b!89517 m!95935))

(assert (=> d!23699 d!23831))

(assert (=> d!23699 d!23695))

(declare-fun b!89521 () Bool)

(declare-fun e!58251 () Option!149)

(assert (=> b!89521 (= e!58251 None!147)))

(declare-fun b!89519 () Bool)

(declare-fun e!58250 () Option!149)

(assert (=> b!89519 (= e!58250 e!58251)))

(declare-fun c!14903 () Bool)

(assert (=> b!89519 (= c!14903 (and ((_ is Cons!1513) (toList!740 lt!42577)) (not (= (_1!1111 (h!2105 (toList!740 lt!42577))) (_1!1111 lt!42410)))))))

(declare-fun d!23833 () Bool)

(declare-fun c!14902 () Bool)

(assert (=> d!23833 (= c!14902 (and ((_ is Cons!1513) (toList!740 lt!42577)) (= (_1!1111 (h!2105 (toList!740 lt!42577))) (_1!1111 lt!42410))))))

(assert (=> d!23833 (= (getValueByKey!143 (toList!740 lt!42577) (_1!1111 lt!42410)) e!58250)))

(declare-fun b!89518 () Bool)

(assert (=> b!89518 (= e!58250 (Some!148 (_2!1111 (h!2105 (toList!740 lt!42577)))))))

(declare-fun b!89520 () Bool)

(assert (=> b!89520 (= e!58251 (getValueByKey!143 (t!5267 (toList!740 lt!42577)) (_1!1111 lt!42410)))))

(assert (= (and d!23833 c!14902) b!89518))

(assert (= (and d!23833 (not c!14902)) b!89519))

(assert (= (and b!89519 c!14903) b!89520))

(assert (= (and b!89519 (not c!14903)) b!89521))

(declare-fun m!95937 () Bool)

(assert (=> b!89520 m!95937))

(assert (=> b!88890 d!23833))

(declare-fun d!23835 () Bool)

(declare-fun e!58252 () Bool)

(assert (=> d!23835 e!58252))

(declare-fun res!45736 () Bool)

(assert (=> d!23835 (=> (not res!45736) (not e!58252))))

(declare-fun lt!43016 () ListLongMap!1449)

(assert (=> d!23835 (= res!45736 (contains!754 lt!43016 (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(declare-fun lt!43015 () List!1517)

(assert (=> d!23835 (= lt!43016 (ListLongMap!1450 lt!43015))))

(declare-fun lt!43017 () Unit!2620)

(declare-fun lt!43014 () Unit!2620)

(assert (=> d!23835 (= lt!43017 lt!43014)))

(assert (=> d!23835 (= (getValueByKey!143 lt!43015 (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23835 (= lt!43014 (lemmaContainsTupThenGetReturnValue!60 lt!43015 (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23835 (= lt!43015 (insertStrictlySorted!63 (toList!740 call!8622) (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23835 (= (+!111 call!8622 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!43016)))

(declare-fun b!89522 () Bool)

(declare-fun res!45737 () Bool)

(assert (=> b!89522 (=> (not res!45737) (not e!58252))))

(assert (=> b!89522 (= res!45737 (= (getValueByKey!143 (toList!740 lt!43016) (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(declare-fun b!89523 () Bool)

(assert (=> b!89523 (= e!58252 (contains!755 (toList!740 lt!43016) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))

(assert (= (and d!23835 res!45736) b!89522))

(assert (= (and b!89522 res!45737) b!89523))

(declare-fun m!95939 () Bool)

(assert (=> d!23835 m!95939))

(declare-fun m!95941 () Bool)

(assert (=> d!23835 m!95941))

(declare-fun m!95943 () Bool)

(assert (=> d!23835 m!95943))

(declare-fun m!95945 () Bool)

(assert (=> d!23835 m!95945))

(declare-fun m!95947 () Bool)

(assert (=> b!89522 m!95947))

(declare-fun m!95949 () Bool)

(assert (=> b!89523 m!95949))

(assert (=> b!89131 d!23835))

(assert (=> b!88902 d!23809))

(declare-fun d!23837 () Bool)

(declare-fun e!58253 () Bool)

(assert (=> d!23837 e!58253))

(declare-fun res!45738 () Bool)

(assert (=> d!23837 (=> (not res!45738) (not e!58253))))

(declare-fun lt!43020 () ListLongMap!1449)

(assert (=> d!23837 (= res!45738 (contains!754 lt!43020 (_1!1111 (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(declare-fun lt!43019 () List!1517)

(assert (=> d!23837 (= lt!43020 (ListLongMap!1450 lt!43019))))

(declare-fun lt!43021 () Unit!2620)

(declare-fun lt!43018 () Unit!2620)

(assert (=> d!23837 (= lt!43021 lt!43018)))

(assert (=> d!23837 (= (getValueByKey!143 lt!43019 (_1!1111 (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))) (Some!148 (_2!1111 (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(assert (=> d!23837 (= lt!43018 (lemmaContainsTupThenGetReturnValue!60 lt!43019 (_1!1111 (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (_2!1111 (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(assert (=> d!23837 (= lt!43019 (insertStrictlySorted!63 (toList!740 (ite c!14785 call!8621 (ite c!14787 call!8619 call!8624))) (_1!1111 (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (_2!1111 (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(assert (=> d!23837 (= (+!111 (ite c!14785 call!8621 (ite c!14787 call!8619 call!8624)) (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) lt!43020)))

(declare-fun b!89524 () Bool)

(declare-fun res!45739 () Bool)

(assert (=> b!89524 (=> (not res!45739) (not e!58253))))

(assert (=> b!89524 (= res!45739 (= (getValueByKey!143 (toList!740 lt!43020) (_1!1111 (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))) (Some!148 (_2!1111 (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))))

(declare-fun b!89525 () Bool)

(assert (=> b!89525 (= e!58253 (contains!755 (toList!740 lt!43020) (ite (or c!14785 c!14787) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (= (and d!23837 res!45738) b!89524))

(assert (= (and b!89524 res!45739) b!89525))

(declare-fun m!95951 () Bool)

(assert (=> d!23837 m!95951))

(declare-fun m!95953 () Bool)

(assert (=> d!23837 m!95953))

(declare-fun m!95955 () Bool)

(assert (=> d!23837 m!95955))

(declare-fun m!95957 () Bool)

(assert (=> d!23837 m!95957))

(declare-fun m!95959 () Bool)

(assert (=> b!89524 m!95959))

(declare-fun m!95961 () Bool)

(assert (=> b!89525 m!95961))

(assert (=> bm!8620 d!23837))

(declare-fun d!23839 () Bool)

(declare-fun res!45744 () Bool)

(declare-fun e!58258 () Bool)

(assert (=> d!23839 (=> res!45744 e!58258)))

(assert (=> d!23839 (= res!45744 (and ((_ is Cons!1513) (toList!740 lt!42409)) (= (_1!1111 (h!2105 (toList!740 lt!42409))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355))))))

(assert (=> d!23839 (= (containsKey!146 (toList!740 lt!42409) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) e!58258)))

(declare-fun b!89530 () Bool)

(declare-fun e!58259 () Bool)

(assert (=> b!89530 (= e!58258 e!58259)))

(declare-fun res!45745 () Bool)

(assert (=> b!89530 (=> (not res!45745) (not e!58259))))

(assert (=> b!89530 (= res!45745 (and (or (not ((_ is Cons!1513) (toList!740 lt!42409))) (bvsle (_1!1111 (h!2105 (toList!740 lt!42409))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355))) ((_ is Cons!1513) (toList!740 lt!42409)) (bvslt (_1!1111 (h!2105 (toList!740 lt!42409))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355))))))

(declare-fun b!89531 () Bool)

(assert (=> b!89531 (= e!58259 (containsKey!146 (t!5267 (toList!740 lt!42409)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (= (and d!23839 (not res!45744)) b!89530))

(assert (= (and b!89530 res!45745) b!89531))

(assert (=> b!89531 m!94891))

(declare-fun m!95963 () Bool)

(assert (=> b!89531 m!95963))

(assert (=> d!23697 d!23839))

(declare-fun d!23841 () Bool)

(assert (=> d!23841 (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) lt!42589 #b00000000000000000000000000000000)))

(declare-fun lt!43024 () Unit!2620)

(declare-fun choose!13 (array!4039 (_ BitVec 64) (_ BitVec 32)) Unit!2620)

(assert (=> d!23841 (= lt!43024 (choose!13 (_keys!4049 (v!2677 (underlying!298 thiss!992))) lt!42589 #b00000000000000000000000000000000))))

(assert (=> d!23841 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!23841 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) lt!42589 #b00000000000000000000000000000000) lt!43024)))

(declare-fun bs!3758 () Bool)

(assert (= bs!3758 d!23841))

(assert (=> bs!3758 m!95235))

(declare-fun m!95965 () Bool)

(assert (=> bs!3758 m!95965))

(assert (=> b!88903 d!23841))

(declare-fun d!23843 () Bool)

(declare-fun res!45746 () Bool)

(declare-fun e!58260 () Bool)

(assert (=> d!23843 (=> res!45746 e!58260)))

(assert (=> d!23843 (= res!45746 (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) lt!42589))))

(assert (=> d!23843 (= (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) lt!42589 #b00000000000000000000000000000000) e!58260)))

(declare-fun b!89532 () Bool)

(declare-fun e!58261 () Bool)

(assert (=> b!89532 (= e!58260 e!58261)))

(declare-fun res!45747 () Bool)

(assert (=> b!89532 (=> (not res!45747) (not e!58261))))

(assert (=> b!89532 (= res!45747 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun b!89533 () Bool)

(assert (=> b!89533 (= e!58261 (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) lt!42589 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23843 (not res!45746)) b!89532))

(assert (= (and b!89532 res!45747) b!89533))

(assert (=> d!23843 m!95227))

(declare-fun m!95967 () Bool)

(assert (=> b!89533 m!95967))

(assert (=> b!88903 d!23843))

(declare-fun b!89546 () Bool)

(declare-fun e!58269 () SeekEntryResult!239)

(declare-fun lt!43033 () SeekEntryResult!239)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4039 (_ BitVec 32)) SeekEntryResult!239)

(assert (=> b!89546 (= e!58269 (seekKeyOrZeroReturnVacant!0 (x!12225 lt!43033) (index!3097 lt!43033) (index!3097 lt!43033) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) (_keys!4049 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun b!89548 () Bool)

(declare-fun c!14910 () Bool)

(declare-fun lt!43032 () (_ BitVec 64))

(assert (=> b!89548 (= c!14910 (= lt!43032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!58268 () SeekEntryResult!239)

(assert (=> b!89548 (= e!58268 e!58269)))

(declare-fun b!89549 () Bool)

(assert (=> b!89549 (= e!58269 (MissingZero!239 (index!3097 lt!43033)))))

(declare-fun b!89550 () Bool)

(declare-fun e!58270 () SeekEntryResult!239)

(assert (=> b!89550 (= e!58270 Undefined!239)))

(declare-fun b!89551 () Bool)

(assert (=> b!89551 (= e!58270 e!58268)))

(assert (=> b!89551 (= lt!43032 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (index!3097 lt!43033)))))

(declare-fun c!14911 () Bool)

(assert (=> b!89551 (= c!14911 (= lt!43032 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!89547 () Bool)

(assert (=> b!89547 (= e!58268 (Found!239 (index!3097 lt!43033)))))

(declare-fun d!23845 () Bool)

(declare-fun lt!43031 () SeekEntryResult!239)

(assert (=> d!23845 (and (or ((_ is Undefined!239) lt!43031) (not ((_ is Found!239) lt!43031)) (and (bvsge (index!3096 lt!43031) #b00000000000000000000000000000000) (bvslt (index!3096 lt!43031) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))) (or ((_ is Undefined!239) lt!43031) ((_ is Found!239) lt!43031) (not ((_ is MissingZero!239) lt!43031)) (and (bvsge (index!3095 lt!43031) #b00000000000000000000000000000000) (bvslt (index!3095 lt!43031) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))) (or ((_ is Undefined!239) lt!43031) ((_ is Found!239) lt!43031) ((_ is MissingZero!239) lt!43031) (not ((_ is MissingVacant!239) lt!43031)) (and (bvsge (index!3098 lt!43031) #b00000000000000000000000000000000) (bvslt (index!3098 lt!43031) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))) (or ((_ is Undefined!239) lt!43031) (ite ((_ is Found!239) lt!43031) (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (index!3096 lt!43031)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!239) lt!43031) (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (index!3095 lt!43031)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!239) lt!43031) (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (index!3098 lt!43031)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23845 (= lt!43031 e!58270)))

(declare-fun c!14912 () Bool)

(assert (=> d!23845 (= c!14912 (and ((_ is Intermediate!239) lt!43033) (undefined!1051 lt!43033)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4039 (_ BitVec 32)) SeekEntryResult!239)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!23845 (= lt!43033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) (mask!6415 (v!2677 (underlying!298 thiss!992)))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) (_keys!4049 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992)))))))

(assert (=> d!23845 (validMask!0 (mask!6415 (v!2677 (underlying!298 thiss!992))))))

(assert (=> d!23845 (= (seekEntryOrOpen!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) (_keys!4049 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992)))) lt!43031)))

(assert (= (and d!23845 c!14912) b!89550))

(assert (= (and d!23845 (not c!14912)) b!89551))

(assert (= (and b!89551 c!14911) b!89547))

(assert (= (and b!89551 (not c!14911)) b!89548))

(assert (= (and b!89548 c!14910) b!89549))

(assert (= (and b!89548 (not c!14910)) b!89546))

(assert (=> b!89546 m!95227))

(declare-fun m!95969 () Bool)

(assert (=> b!89546 m!95969))

(declare-fun m!95971 () Bool)

(assert (=> b!89551 m!95971))

(assert (=> d!23845 m!94911))

(declare-fun m!95973 () Bool)

(assert (=> d!23845 m!95973))

(declare-fun m!95975 () Bool)

(assert (=> d!23845 m!95975))

(assert (=> d!23845 m!95227))

(declare-fun m!95977 () Bool)

(assert (=> d!23845 m!95977))

(declare-fun m!95979 () Bool)

(assert (=> d!23845 m!95979))

(assert (=> d!23845 m!95977))

(assert (=> d!23845 m!95227))

(declare-fun m!95981 () Bool)

(assert (=> d!23845 m!95981))

(assert (=> b!88903 d!23845))

(declare-fun d!23847 () Bool)

(declare-fun lt!43036 () Bool)

(declare-fun content!95 (List!1517) (InoxSet tuple2!2200))

(assert (=> d!23847 (= lt!43036 (select (content!95 (toList!740 lt!42556)) lt!42406))))

(declare-fun e!58275 () Bool)

(assert (=> d!23847 (= lt!43036 e!58275)))

(declare-fun res!45753 () Bool)

(assert (=> d!23847 (=> (not res!45753) (not e!58275))))

(assert (=> d!23847 (= res!45753 ((_ is Cons!1513) (toList!740 lt!42556)))))

(assert (=> d!23847 (= (contains!755 (toList!740 lt!42556) lt!42406) lt!43036)))

(declare-fun b!89556 () Bool)

(declare-fun e!58276 () Bool)

(assert (=> b!89556 (= e!58275 e!58276)))

(declare-fun res!45752 () Bool)

(assert (=> b!89556 (=> res!45752 e!58276)))

(assert (=> b!89556 (= res!45752 (= (h!2105 (toList!740 lt!42556)) lt!42406))))

(declare-fun b!89557 () Bool)

(assert (=> b!89557 (= e!58276 (contains!755 (t!5267 (toList!740 lt!42556)) lt!42406))))

(assert (= (and d!23847 res!45753) b!89556))

(assert (= (and b!89556 (not res!45752)) b!89557))

(declare-fun m!95983 () Bool)

(assert (=> d!23847 m!95983))

(declare-fun m!95985 () Bool)

(assert (=> d!23847 m!95985))

(declare-fun m!95987 () Bool)

(assert (=> b!89557 m!95987))

(assert (=> b!88881 d!23847))

(assert (=> b!88938 d!23787))

(declare-fun d!23849 () Bool)

(assert (=> d!23849 (= (+!111 (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) lt!42668 lt!42407 (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!43039 () Unit!2620)

(declare-fun choose!539 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 V!3041 Int) Unit!2620)

(assert (=> d!23849 (= lt!43039 (choose!539 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) lt!42668 (zeroValue!2260 newMap!16) lt!42407 (minValue!2260 newMap!16) (defaultEntry!2371 newMap!16)))))

(assert (=> d!23849 (validMask!0 (mask!6415 newMap!16))))

(assert (=> d!23849 (= (lemmaChangeZeroKeyThenAddPairToListMap!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) lt!42668 (zeroValue!2260 newMap!16) lt!42407 (minValue!2260 newMap!16) (defaultEntry!2371 newMap!16)) lt!43039)))

(declare-fun bs!3759 () Bool)

(assert (= bs!3759 d!23849))

(declare-fun m!95989 () Bool)

(assert (=> bs!3759 m!95989))

(assert (=> bs!3759 m!95329))

(declare-fun m!95991 () Bool)

(assert (=> bs!3759 m!95991))

(assert (=> bs!3759 m!95329))

(declare-fun m!95993 () Bool)

(assert (=> bs!3759 m!95993))

(assert (=> bs!3759 m!95573))

(assert (=> b!89045 d!23849))

(declare-fun d!23851 () Bool)

(declare-fun e!58277 () Bool)

(assert (=> d!23851 e!58277))

(declare-fun res!45754 () Bool)

(assert (=> d!23851 (=> res!45754 e!58277)))

(declare-fun lt!43041 () Bool)

(assert (=> d!23851 (= res!45754 (not lt!43041))))

(declare-fun lt!43042 () Bool)

(assert (=> d!23851 (= lt!43041 lt!43042)))

(declare-fun lt!43043 () Unit!2620)

(declare-fun e!58278 () Unit!2620)

(assert (=> d!23851 (= lt!43043 e!58278)))

(declare-fun c!14913 () Bool)

(assert (=> d!23851 (= c!14913 lt!43042)))

(assert (=> d!23851 (= lt!43042 (containsKey!146 (toList!740 lt!42544) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23851 (= (contains!754 lt!42544 #b1000000000000000000000000000000000000000000000000000000000000000) lt!43041)))

(declare-fun b!89558 () Bool)

(declare-fun lt!43040 () Unit!2620)

(assert (=> b!89558 (= e!58278 lt!43040)))

(assert (=> b!89558 (= lt!43040 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42544) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89558 (isDefined!95 (getValueByKey!143 (toList!740 lt!42544) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89559 () Bool)

(declare-fun Unit!2646 () Unit!2620)

(assert (=> b!89559 (= e!58278 Unit!2646)))

(declare-fun b!89560 () Bool)

(assert (=> b!89560 (= e!58277 (isDefined!95 (getValueByKey!143 (toList!740 lt!42544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23851 c!14913) b!89558))

(assert (= (and d!23851 (not c!14913)) b!89559))

(assert (= (and d!23851 (not res!45754)) b!89560))

(declare-fun m!95995 () Bool)

(assert (=> d!23851 m!95995))

(declare-fun m!95997 () Bool)

(assert (=> b!89558 m!95997))

(declare-fun m!95999 () Bool)

(assert (=> b!89558 m!95999))

(assert (=> b!89558 m!95999))

(declare-fun m!96001 () Bool)

(assert (=> b!89558 m!96001))

(assert (=> b!89560 m!95999))

(assert (=> b!89560 m!95999))

(assert (=> b!89560 m!96001))

(assert (=> b!88875 d!23851))

(declare-fun d!23853 () Bool)

(declare-fun lt!43044 () Bool)

(assert (=> d!23853 (= lt!43044 (select (content!95 (toList!740 lt!42572)) lt!42408))))

(declare-fun e!58279 () Bool)

(assert (=> d!23853 (= lt!43044 e!58279)))

(declare-fun res!45756 () Bool)

(assert (=> d!23853 (=> (not res!45756) (not e!58279))))

(assert (=> d!23853 (= res!45756 ((_ is Cons!1513) (toList!740 lt!42572)))))

(assert (=> d!23853 (= (contains!755 (toList!740 lt!42572) lt!42408) lt!43044)))

(declare-fun b!89561 () Bool)

(declare-fun e!58280 () Bool)

(assert (=> b!89561 (= e!58279 e!58280)))

(declare-fun res!45755 () Bool)

(assert (=> b!89561 (=> res!45755 e!58280)))

(assert (=> b!89561 (= res!45755 (= (h!2105 (toList!740 lt!42572)) lt!42408))))

(declare-fun b!89562 () Bool)

(assert (=> b!89562 (= e!58280 (contains!755 (t!5267 (toList!740 lt!42572)) lt!42408))))

(assert (= (and d!23853 res!45756) b!89561))

(assert (= (and b!89561 (not res!45755)) b!89562))

(declare-fun m!96003 () Bool)

(assert (=> d!23853 m!96003))

(declare-fun m!96005 () Bool)

(assert (=> d!23853 m!96005))

(declare-fun m!96007 () Bool)

(assert (=> b!89562 m!96007))

(assert (=> b!88889 d!23853))

(declare-fun d!23855 () Bool)

(declare-fun e!58281 () Bool)

(assert (=> d!23855 e!58281))

(declare-fun res!45757 () Bool)

(assert (=> d!23855 (=> res!45757 e!58281)))

(declare-fun lt!43046 () Bool)

(assert (=> d!23855 (= res!45757 (not lt!43046))))

(declare-fun lt!43047 () Bool)

(assert (=> d!23855 (= lt!43046 lt!43047)))

(declare-fun lt!43048 () Unit!2620)

(declare-fun e!58282 () Unit!2620)

(assert (=> d!23855 (= lt!43048 e!58282)))

(declare-fun c!14914 () Bool)

(assert (=> d!23855 (= c!14914 lt!43047)))

(assert (=> d!23855 (= lt!43047 (containsKey!146 (toList!740 lt!42556) (_1!1111 lt!42406)))))

(assert (=> d!23855 (= (contains!754 lt!42556 (_1!1111 lt!42406)) lt!43046)))

(declare-fun b!89563 () Bool)

(declare-fun lt!43045 () Unit!2620)

(assert (=> b!89563 (= e!58282 lt!43045)))

(assert (=> b!89563 (= lt!43045 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42556) (_1!1111 lt!42406)))))

(assert (=> b!89563 (isDefined!95 (getValueByKey!143 (toList!740 lt!42556) (_1!1111 lt!42406)))))

(declare-fun b!89564 () Bool)

(declare-fun Unit!2647 () Unit!2620)

(assert (=> b!89564 (= e!58282 Unit!2647)))

(declare-fun b!89565 () Bool)

(assert (=> b!89565 (= e!58281 (isDefined!95 (getValueByKey!143 (toList!740 lt!42556) (_1!1111 lt!42406))))))

(assert (= (and d!23855 c!14914) b!89563))

(assert (= (and d!23855 (not c!14914)) b!89564))

(assert (= (and d!23855 (not res!45757)) b!89565))

(declare-fun m!96009 () Bool)

(assert (=> d!23855 m!96009))

(declare-fun m!96011 () Bool)

(assert (=> b!89563 m!96011))

(assert (=> b!89563 m!95141))

(assert (=> b!89563 m!95141))

(declare-fun m!96013 () Bool)

(assert (=> b!89563 m!96013))

(assert (=> b!89565 m!95141))

(assert (=> b!89565 m!95141))

(assert (=> b!89565 m!96013))

(assert (=> d!23655 d!23855))

(declare-fun b!89569 () Bool)

(declare-fun e!58284 () Option!149)

(assert (=> b!89569 (= e!58284 None!147)))

(declare-fun b!89567 () Bool)

(declare-fun e!58283 () Option!149)

(assert (=> b!89567 (= e!58283 e!58284)))

(declare-fun c!14916 () Bool)

(assert (=> b!89567 (= c!14916 (and ((_ is Cons!1513) lt!42555) (not (= (_1!1111 (h!2105 lt!42555)) (_1!1111 lt!42406)))))))

(declare-fun d!23857 () Bool)

(declare-fun c!14915 () Bool)

(assert (=> d!23857 (= c!14915 (and ((_ is Cons!1513) lt!42555) (= (_1!1111 (h!2105 lt!42555)) (_1!1111 lt!42406))))))

(assert (=> d!23857 (= (getValueByKey!143 lt!42555 (_1!1111 lt!42406)) e!58283)))

(declare-fun b!89566 () Bool)

(assert (=> b!89566 (= e!58283 (Some!148 (_2!1111 (h!2105 lt!42555))))))

(declare-fun b!89568 () Bool)

(assert (=> b!89568 (= e!58284 (getValueByKey!143 (t!5267 lt!42555) (_1!1111 lt!42406)))))

(assert (= (and d!23857 c!14915) b!89566))

(assert (= (and d!23857 (not c!14915)) b!89567))

(assert (= (and b!89567 c!14916) b!89568))

(assert (= (and b!89567 (not c!14916)) b!89569))

(declare-fun m!96015 () Bool)

(assert (=> b!89568 m!96015))

(assert (=> d!23655 d!23857))

(declare-fun d!23859 () Bool)

(assert (=> d!23859 (= (getValueByKey!143 lt!42555 (_1!1111 lt!42406)) (Some!148 (_2!1111 lt!42406)))))

(declare-fun lt!43049 () Unit!2620)

(assert (=> d!23859 (= lt!43049 (choose!535 lt!42555 (_1!1111 lt!42406) (_2!1111 lt!42406)))))

(declare-fun e!58285 () Bool)

(assert (=> d!23859 e!58285))

(declare-fun res!45758 () Bool)

(assert (=> d!23859 (=> (not res!45758) (not e!58285))))

(assert (=> d!23859 (= res!45758 (isStrictlySorted!287 lt!42555))))

(assert (=> d!23859 (= (lemmaContainsTupThenGetReturnValue!60 lt!42555 (_1!1111 lt!42406) (_2!1111 lt!42406)) lt!43049)))

(declare-fun b!89570 () Bool)

(declare-fun res!45759 () Bool)

(assert (=> b!89570 (=> (not res!45759) (not e!58285))))

(assert (=> b!89570 (= res!45759 (containsKey!146 lt!42555 (_1!1111 lt!42406)))))

(declare-fun b!89571 () Bool)

(assert (=> b!89571 (= e!58285 (contains!755 lt!42555 (tuple2!2201 (_1!1111 lt!42406) (_2!1111 lt!42406))))))

(assert (= (and d!23859 res!45758) b!89570))

(assert (= (and b!89570 res!45759) b!89571))

(assert (=> d!23859 m!95135))

(declare-fun m!96017 () Bool)

(assert (=> d!23859 m!96017))

(declare-fun m!96019 () Bool)

(assert (=> d!23859 m!96019))

(declare-fun m!96021 () Bool)

(assert (=> b!89570 m!96021))

(declare-fun m!96023 () Bool)

(assert (=> b!89571 m!96023))

(assert (=> d!23655 d!23859))

(declare-fun b!89572 () Bool)

(declare-fun e!58286 () List!1517)

(declare-fun call!8692 () List!1517)

(assert (=> b!89572 (= e!58286 call!8692)))

(declare-fun b!89573 () Bool)

(declare-fun e!58288 () List!1517)

(assert (=> b!89573 (= e!58288 (insertStrictlySorted!63 (t!5267 (toList!740 lt!42413)) (_1!1111 lt!42406) (_2!1111 lt!42406)))))

(declare-fun b!89574 () Bool)

(declare-fun e!58289 () List!1517)

(declare-fun call!8693 () List!1517)

(assert (=> b!89574 (= e!58289 call!8693)))

(declare-fun call!8694 () List!1517)

(declare-fun c!14917 () Bool)

(declare-fun bm!8689 () Bool)

(assert (=> bm!8689 (= call!8694 ($colon$colon!73 e!58288 (ite c!14917 (h!2105 (toList!740 lt!42413)) (tuple2!2201 (_1!1111 lt!42406) (_2!1111 lt!42406)))))))

(declare-fun c!14919 () Bool)

(assert (=> bm!8689 (= c!14919 c!14917)))

(declare-fun b!89575 () Bool)

(declare-fun res!45760 () Bool)

(declare-fun e!58290 () Bool)

(assert (=> b!89575 (=> (not res!45760) (not e!58290))))

(declare-fun lt!43050 () List!1517)

(assert (=> b!89575 (= res!45760 (containsKey!146 lt!43050 (_1!1111 lt!42406)))))

(declare-fun b!89576 () Bool)

(assert (=> b!89576 (= e!58290 (contains!755 lt!43050 (tuple2!2201 (_1!1111 lt!42406) (_2!1111 lt!42406))))))

(declare-fun b!89577 () Bool)

(assert (=> b!89577 (= e!58289 call!8693)))

(declare-fun d!23861 () Bool)

(assert (=> d!23861 e!58290))

(declare-fun res!45761 () Bool)

(assert (=> d!23861 (=> (not res!45761) (not e!58290))))

(assert (=> d!23861 (= res!45761 (isStrictlySorted!287 lt!43050))))

(declare-fun e!58287 () List!1517)

(assert (=> d!23861 (= lt!43050 e!58287)))

(assert (=> d!23861 (= c!14917 (and ((_ is Cons!1513) (toList!740 lt!42413)) (bvslt (_1!1111 (h!2105 (toList!740 lt!42413))) (_1!1111 lt!42406))))))

(assert (=> d!23861 (isStrictlySorted!287 (toList!740 lt!42413))))

(assert (=> d!23861 (= (insertStrictlySorted!63 (toList!740 lt!42413) (_1!1111 lt!42406) (_2!1111 lt!42406)) lt!43050)))

(declare-fun b!89578 () Bool)

(assert (=> b!89578 (= e!58287 e!58286)))

(declare-fun c!14918 () Bool)

(assert (=> b!89578 (= c!14918 (and ((_ is Cons!1513) (toList!740 lt!42413)) (= (_1!1111 (h!2105 (toList!740 lt!42413))) (_1!1111 lt!42406))))))

(declare-fun c!14920 () Bool)

(declare-fun b!89579 () Bool)

(assert (=> b!89579 (= e!58288 (ite c!14918 (t!5267 (toList!740 lt!42413)) (ite c!14920 (Cons!1513 (h!2105 (toList!740 lt!42413)) (t!5267 (toList!740 lt!42413))) Nil!1514)))))

(declare-fun bm!8690 () Bool)

(assert (=> bm!8690 (= call!8692 call!8694)))

(declare-fun b!89580 () Bool)

(assert (=> b!89580 (= c!14920 (and ((_ is Cons!1513) (toList!740 lt!42413)) (bvsgt (_1!1111 (h!2105 (toList!740 lt!42413))) (_1!1111 lt!42406))))))

(assert (=> b!89580 (= e!58286 e!58289)))

(declare-fun b!89581 () Bool)

(assert (=> b!89581 (= e!58287 call!8694)))

(declare-fun bm!8691 () Bool)

(assert (=> bm!8691 (= call!8693 call!8692)))

(assert (= (and d!23861 c!14917) b!89581))

(assert (= (and d!23861 (not c!14917)) b!89578))

(assert (= (and b!89578 c!14918) b!89572))

(assert (= (and b!89578 (not c!14918)) b!89580))

(assert (= (and b!89580 c!14920) b!89577))

(assert (= (and b!89580 (not c!14920)) b!89574))

(assert (= (or b!89577 b!89574) bm!8691))

(assert (= (or b!89572 bm!8691) bm!8690))

(assert (= (or b!89581 bm!8690) bm!8689))

(assert (= (and bm!8689 c!14919) b!89573))

(assert (= (and bm!8689 (not c!14919)) b!89579))

(assert (= (and d!23861 res!45761) b!89575))

(assert (= (and b!89575 res!45760) b!89576))

(declare-fun m!96025 () Bool)

(assert (=> b!89576 m!96025))

(declare-fun m!96027 () Bool)

(assert (=> d!23861 m!96027))

(assert (=> d!23861 m!95743))

(declare-fun m!96029 () Bool)

(assert (=> b!89573 m!96029))

(declare-fun m!96031 () Bool)

(assert (=> b!89575 m!96031))

(declare-fun m!96033 () Bool)

(assert (=> bm!8689 m!96033))

(assert (=> d!23655 d!23861))

(declare-fun lt!43053 () SeekEntryResult!239)

(declare-fun e!58292 () SeekEntryResult!239)

(declare-fun b!89582 () Bool)

(assert (=> b!89582 (= e!58292 (seekKeyOrZeroReturnVacant!0 (x!12225 lt!43053) (index!3097 lt!43053) (index!3097 lt!43053) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (_keys!4049 newMap!16) (mask!6415 newMap!16)))))

(declare-fun b!89584 () Bool)

(declare-fun c!14921 () Bool)

(declare-fun lt!43052 () (_ BitVec 64))

(assert (=> b!89584 (= c!14921 (= lt!43052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!58291 () SeekEntryResult!239)

(assert (=> b!89584 (= e!58291 e!58292)))

(declare-fun b!89585 () Bool)

(assert (=> b!89585 (= e!58292 (MissingZero!239 (index!3097 lt!43053)))))

(declare-fun b!89586 () Bool)

(declare-fun e!58293 () SeekEntryResult!239)

(assert (=> b!89586 (= e!58293 Undefined!239)))

(declare-fun b!89587 () Bool)

(assert (=> b!89587 (= e!58293 e!58291)))

(assert (=> b!89587 (= lt!43052 (select (arr!1922 (_keys!4049 newMap!16)) (index!3097 lt!43053)))))

(declare-fun c!14922 () Bool)

(assert (=> b!89587 (= c!14922 (= lt!43052 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun b!89583 () Bool)

(assert (=> b!89583 (= e!58291 (Found!239 (index!3097 lt!43053)))))

(declare-fun d!23863 () Bool)

(declare-fun lt!43051 () SeekEntryResult!239)

(assert (=> d!23863 (and (or ((_ is Undefined!239) lt!43051) (not ((_ is Found!239) lt!43051)) (and (bvsge (index!3096 lt!43051) #b00000000000000000000000000000000) (bvslt (index!3096 lt!43051) (size!2168 (_keys!4049 newMap!16))))) (or ((_ is Undefined!239) lt!43051) ((_ is Found!239) lt!43051) (not ((_ is MissingZero!239) lt!43051)) (and (bvsge (index!3095 lt!43051) #b00000000000000000000000000000000) (bvslt (index!3095 lt!43051) (size!2168 (_keys!4049 newMap!16))))) (or ((_ is Undefined!239) lt!43051) ((_ is Found!239) lt!43051) ((_ is MissingZero!239) lt!43051) (not ((_ is MissingVacant!239) lt!43051)) (and (bvsge (index!3098 lt!43051) #b00000000000000000000000000000000) (bvslt (index!3098 lt!43051) (size!2168 (_keys!4049 newMap!16))))) (or ((_ is Undefined!239) lt!43051) (ite ((_ is Found!239) lt!43051) (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!43051)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) (ite ((_ is MissingZero!239) lt!43051) (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3095 lt!43051)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!239) lt!43051) (= (select (arr!1922 (_keys!4049 newMap!16)) (index!3098 lt!43051)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23863 (= lt!43051 e!58293)))

(declare-fun c!14923 () Bool)

(assert (=> d!23863 (= c!14923 (and ((_ is Intermediate!239) lt!43053) (undefined!1051 lt!43053)))))

(assert (=> d!23863 (= lt!43053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (mask!6415 newMap!16)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (_keys!4049 newMap!16) (mask!6415 newMap!16)))))

(assert (=> d!23863 (validMask!0 (mask!6415 newMap!16))))

(assert (=> d!23863 (= (seekEntryOrOpen!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (_keys!4049 newMap!16) (mask!6415 newMap!16)) lt!43051)))

(assert (= (and d!23863 c!14923) b!89586))

(assert (= (and d!23863 (not c!14923)) b!89587))

(assert (= (and b!89587 c!14922) b!89583))

(assert (= (and b!89587 (not c!14922)) b!89584))

(assert (= (and b!89584 c!14921) b!89585))

(assert (= (and b!89584 (not c!14921)) b!89582))

(assert (=> b!89582 m!94891))

(declare-fun m!96035 () Bool)

(assert (=> b!89582 m!96035))

(declare-fun m!96037 () Bool)

(assert (=> b!89587 m!96037))

(assert (=> d!23863 m!95573))

(declare-fun m!96039 () Bool)

(assert (=> d!23863 m!96039))

(declare-fun m!96041 () Bool)

(assert (=> d!23863 m!96041))

(assert (=> d!23863 m!94891))

(declare-fun m!96043 () Bool)

(assert (=> d!23863 m!96043))

(declare-fun m!96045 () Bool)

(assert (=> d!23863 m!96045))

(assert (=> d!23863 m!96043))

(assert (=> d!23863 m!94891))

(declare-fun m!96047 () Bool)

(assert (=> d!23863 m!96047))

(assert (=> bm!8579 d!23863))

(assert (=> d!23685 d!23689))

(declare-fun d!23865 () Bool)

(assert (=> d!23865 (not (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!23865 true))

(declare-fun _$68!79 () Unit!2620)

(assert (=> d!23865 (= (choose!68 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) Nil!1513)) _$68!79)))

(declare-fun bs!3760 () Bool)

(assert (= bs!3760 d!23865))

(assert (=> bs!3760 m!94891))

(assert (=> bs!3760 m!94925))

(assert (=> d!23685 d!23865))

(assert (=> b!89139 d!23825))

(declare-fun b!89588 () Bool)

(declare-fun e!58296 () Bool)

(declare-fun lt!43074 () ListLongMap!1449)

(assert (=> b!89588 (= e!58296 (= (apply!84 lt!43074 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2260 newMap!16)))))

(declare-fun b!89589 () Bool)

(declare-fun e!58304 () ListLongMap!1449)

(declare-fun e!58298 () ListLongMap!1449)

(assert (=> b!89589 (= e!58304 e!58298)))

(declare-fun c!14926 () Bool)

(assert (=> b!89589 (= c!14926 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89590 () Bool)

(declare-fun e!58297 () Bool)

(declare-fun e!58301 () Bool)

(assert (=> b!89590 (= e!58297 e!58301)))

(declare-fun res!45762 () Bool)

(declare-fun call!8695 () Bool)

(assert (=> b!89590 (= res!45762 call!8695)))

(assert (=> b!89590 (=> (not res!45762) (not e!58301))))

(declare-fun bm!8692 () Bool)

(declare-fun call!8697 () Bool)

(assert (=> bm!8692 (= call!8697 (contains!754 lt!43074 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89591 () Bool)

(declare-fun e!58306 () Bool)

(assert (=> b!89591 (= e!58306 (not call!8697))))

(declare-fun b!89592 () Bool)

(declare-fun e!58294 () ListLongMap!1449)

(declare-fun call!8701 () ListLongMap!1449)

(assert (=> b!89592 (= e!58294 call!8701)))

(declare-fun b!89593 () Bool)

(declare-fun e!58299 () Unit!2620)

(declare-fun Unit!2648 () Unit!2620)

(assert (=> b!89593 (= e!58299 Unit!2648)))

(declare-fun b!89594 () Bool)

(assert (=> b!89594 (= e!58297 (not call!8695))))

(declare-fun b!89595 () Bool)

(declare-fun res!45768 () Bool)

(declare-fun e!58302 () Bool)

(assert (=> b!89595 (=> (not res!45768) (not e!58302))))

(declare-fun e!58305 () Bool)

(assert (=> b!89595 (= res!45768 e!58305)))

(declare-fun res!45766 () Bool)

(assert (=> b!89595 (=> res!45766 e!58305)))

(declare-fun e!58300 () Bool)

(assert (=> b!89595 (= res!45766 (not e!58300))))

(declare-fun res!45769 () Bool)

(assert (=> b!89595 (=> (not res!45769) (not e!58300))))

(assert (=> b!89595 (= res!45769 (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun d!23867 () Bool)

(assert (=> d!23867 e!58302))

(declare-fun res!45764 () Bool)

(assert (=> d!23867 (=> (not res!45764) (not e!58302))))

(assert (=> d!23867 (= res!45764 (or (bvsge #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))))

(declare-fun lt!43071 () ListLongMap!1449)

(assert (=> d!23867 (= lt!43074 lt!43071)))

(declare-fun lt!43063 () Unit!2620)

(assert (=> d!23867 (= lt!43063 e!58299)))

(declare-fun c!14925 () Bool)

(declare-fun e!58303 () Bool)

(assert (=> d!23867 (= c!14925 e!58303)))

(declare-fun res!45770 () Bool)

(assert (=> d!23867 (=> (not res!45770) (not e!58303))))

(assert (=> d!23867 (= res!45770 (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(assert (=> d!23867 (= lt!43071 e!58304)))

(declare-fun c!14924 () Bool)

(assert (=> d!23867 (= c!14924 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23867 (validMask!0 (mask!6415 newMap!16))))

(assert (=> d!23867 (= (getCurrentListMap!433 (_keys!4049 newMap!16) lt!42672 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) lt!43074)))

(declare-fun b!89596 () Bool)

(declare-fun call!8700 () ListLongMap!1449)

(assert (=> b!89596 (= e!58294 call!8700)))

(declare-fun b!89597 () Bool)

(declare-fun c!14928 () Bool)

(assert (=> b!89597 (= c!14928 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!89597 (= e!58298 e!58294)))

(declare-fun b!89598 () Bool)

(assert (=> b!89598 (= e!58298 call!8700)))

(declare-fun bm!8693 () Bool)

(declare-fun call!8698 () ListLongMap!1449)

(assert (=> bm!8693 (= call!8698 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) lt!42672 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun b!89599 () Bool)

(declare-fun e!58295 () Bool)

(assert (=> b!89599 (= e!58305 e!58295)))

(declare-fun res!45765 () Bool)

(assert (=> b!89599 (=> (not res!45765) (not e!58295))))

(assert (=> b!89599 (= res!45765 (contains!754 lt!43074 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!89599 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun b!89600 () Bool)

(declare-fun call!8699 () ListLongMap!1449)

(assert (=> b!89600 (= e!58304 (+!111 call!8699 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 newMap!16))))))

(declare-fun b!89601 () Bool)

(declare-fun lt!43058 () Unit!2620)

(assert (=> b!89601 (= e!58299 lt!43058)))

(declare-fun lt!43055 () ListLongMap!1449)

(assert (=> b!89601 (= lt!43055 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) lt!42672 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!43054 () (_ BitVec 64))

(assert (=> b!89601 (= lt!43054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43062 () (_ BitVec 64))

(assert (=> b!89601 (= lt!43062 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!43064 () Unit!2620)

(assert (=> b!89601 (= lt!43064 (addStillContains!60 lt!43055 lt!43054 (zeroValue!2260 newMap!16) lt!43062))))

(assert (=> b!89601 (contains!754 (+!111 lt!43055 (tuple2!2201 lt!43054 (zeroValue!2260 newMap!16))) lt!43062)))

(declare-fun lt!43056 () Unit!2620)

(assert (=> b!89601 (= lt!43056 lt!43064)))

(declare-fun lt!43072 () ListLongMap!1449)

(assert (=> b!89601 (= lt!43072 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) lt!42672 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!43061 () (_ BitVec 64))

(assert (=> b!89601 (= lt!43061 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43068 () (_ BitVec 64))

(assert (=> b!89601 (= lt!43068 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!43067 () Unit!2620)

(assert (=> b!89601 (= lt!43067 (addApplyDifferent!60 lt!43072 lt!43061 (minValue!2260 newMap!16) lt!43068))))

(assert (=> b!89601 (= (apply!84 (+!111 lt!43072 (tuple2!2201 lt!43061 (minValue!2260 newMap!16))) lt!43068) (apply!84 lt!43072 lt!43068))))

(declare-fun lt!43069 () Unit!2620)

(assert (=> b!89601 (= lt!43069 lt!43067)))

(declare-fun lt!43066 () ListLongMap!1449)

(assert (=> b!89601 (= lt!43066 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) lt!42672 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!43059 () (_ BitVec 64))

(assert (=> b!89601 (= lt!43059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43070 () (_ BitVec 64))

(assert (=> b!89601 (= lt!43070 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!43065 () Unit!2620)

(assert (=> b!89601 (= lt!43065 (addApplyDifferent!60 lt!43066 lt!43059 (zeroValue!2260 newMap!16) lt!43070))))

(assert (=> b!89601 (= (apply!84 (+!111 lt!43066 (tuple2!2201 lt!43059 (zeroValue!2260 newMap!16))) lt!43070) (apply!84 lt!43066 lt!43070))))

(declare-fun lt!43073 () Unit!2620)

(assert (=> b!89601 (= lt!43073 lt!43065)))

(declare-fun lt!43075 () ListLongMap!1449)

(assert (=> b!89601 (= lt!43075 (getCurrentListMapNoExtraKeys!76 (_keys!4049 newMap!16) lt!42672 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!43060 () (_ BitVec 64))

(assert (=> b!89601 (= lt!43060 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43057 () (_ BitVec 64))

(assert (=> b!89601 (= lt!43057 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89601 (= lt!43058 (addApplyDifferent!60 lt!43075 lt!43060 (minValue!2260 newMap!16) lt!43057))))

(assert (=> b!89601 (= (apply!84 (+!111 lt!43075 (tuple2!2201 lt!43060 (minValue!2260 newMap!16))) lt!43057) (apply!84 lt!43075 lt!43057))))

(declare-fun bm!8694 () Bool)

(declare-fun call!8696 () ListLongMap!1449)

(assert (=> bm!8694 (= call!8701 call!8696)))

(declare-fun b!89602 () Bool)

(assert (=> b!89602 (= e!58303 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89603 () Bool)

(assert (=> b!89603 (= e!58306 e!58296)))

(declare-fun res!45767 () Bool)

(assert (=> b!89603 (= res!45767 call!8697)))

(assert (=> b!89603 (=> (not res!45767) (not e!58296))))

(declare-fun b!89604 () Bool)

(assert (=> b!89604 (= e!58301 (= (apply!84 lt!43074 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2260 newMap!16)))))

(declare-fun b!89605 () Bool)

(assert (=> b!89605 (= e!58295 (= (apply!84 lt!43074 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)) (get!1217 (select (arr!1923 lt!42672) #b00000000000000000000000000000000) (dynLambda!347 (defaultEntry!2371 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89605 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2169 lt!42672)))))

(assert (=> b!89605 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(declare-fun bm!8695 () Bool)

(assert (=> bm!8695 (= call!8700 call!8699)))

(declare-fun b!89606 () Bool)

(declare-fun res!45763 () Bool)

(assert (=> b!89606 (=> (not res!45763) (not e!58302))))

(assert (=> b!89606 (= res!45763 e!58297)))

(declare-fun c!14927 () Bool)

(assert (=> b!89606 (= c!14927 (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!89607 () Bool)

(assert (=> b!89607 (= e!58302 e!58306)))

(declare-fun c!14929 () Bool)

(assert (=> b!89607 (= c!14929 (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89608 () Bool)

(assert (=> b!89608 (= e!58300 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8696 () Bool)

(assert (=> bm!8696 (= call!8696 call!8698)))

(declare-fun bm!8697 () Bool)

(assert (=> bm!8697 (= call!8699 (+!111 (ite c!14924 call!8698 (ite c!14926 call!8696 call!8701)) (ite (or c!14924 c!14926) (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 newMap!16)) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 newMap!16)))))))

(declare-fun bm!8698 () Bool)

(assert (=> bm!8698 (= call!8695 (contains!754 lt!43074 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23867 c!14924) b!89600))

(assert (= (and d!23867 (not c!14924)) b!89589))

(assert (= (and b!89589 c!14926) b!89598))

(assert (= (and b!89589 (not c!14926)) b!89597))

(assert (= (and b!89597 c!14928) b!89596))

(assert (= (and b!89597 (not c!14928)) b!89592))

(assert (= (or b!89596 b!89592) bm!8694))

(assert (= (or b!89598 bm!8694) bm!8696))

(assert (= (or b!89598 b!89596) bm!8695))

(assert (= (or b!89600 bm!8696) bm!8693))

(assert (= (or b!89600 bm!8695) bm!8697))

(assert (= (and d!23867 res!45770) b!89602))

(assert (= (and d!23867 c!14925) b!89601))

(assert (= (and d!23867 (not c!14925)) b!89593))

(assert (= (and d!23867 res!45764) b!89595))

(assert (= (and b!89595 res!45769) b!89608))

(assert (= (and b!89595 (not res!45766)) b!89599))

(assert (= (and b!89599 res!45765) b!89605))

(assert (= (and b!89595 res!45768) b!89606))

(assert (= (and b!89606 c!14927) b!89590))

(assert (= (and b!89606 (not c!14927)) b!89594))

(assert (= (and b!89590 res!45762) b!89604))

(assert (= (or b!89590 b!89594) bm!8698))

(assert (= (and b!89606 res!45763) b!89607))

(assert (= (and b!89607 c!14929) b!89603))

(assert (= (and b!89607 (not c!14929)) b!89591))

(assert (= (and b!89603 res!45767) b!89588))

(assert (= (or b!89603 b!89591) bm!8692))

(declare-fun b_lambda!3953 () Bool)

(assert (=> (not b_lambda!3953) (not b!89605)))

(assert (=> b!89605 t!5278))

(declare-fun b_and!5373 () Bool)

(assert (= b_and!5369 (and (=> t!5278 result!2975) b_and!5373)))

(assert (=> b!89605 t!5280))

(declare-fun b_and!5375 () Bool)

(assert (= b_and!5371 (and (=> t!5280 result!2977) b_and!5375)))

(declare-fun m!96049 () Bool)

(assert (=> bm!8697 m!96049))

(assert (=> d!23867 m!95573))

(declare-fun m!96051 () Bool)

(assert (=> bm!8692 m!96051))

(assert (=> b!89608 m!95577))

(assert (=> b!89608 m!95577))

(assert (=> b!89608 m!95579))

(assert (=> b!89602 m!95577))

(assert (=> b!89602 m!95577))

(assert (=> b!89602 m!95579))

(declare-fun m!96053 () Bool)

(assert (=> bm!8698 m!96053))

(declare-fun m!96055 () Bool)

(assert (=> b!89601 m!96055))

(declare-fun m!96057 () Bool)

(assert (=> b!89601 m!96057))

(declare-fun m!96059 () Bool)

(assert (=> b!89601 m!96059))

(declare-fun m!96061 () Bool)

(assert (=> b!89601 m!96061))

(declare-fun m!96063 () Bool)

(assert (=> b!89601 m!96063))

(declare-fun m!96065 () Bool)

(assert (=> b!89601 m!96065))

(declare-fun m!96067 () Bool)

(assert (=> b!89601 m!96067))

(declare-fun m!96069 () Bool)

(assert (=> b!89601 m!96069))

(assert (=> b!89601 m!96069))

(declare-fun m!96071 () Bool)

(assert (=> b!89601 m!96071))

(declare-fun m!96073 () Bool)

(assert (=> b!89601 m!96073))

(assert (=> b!89601 m!96065))

(declare-fun m!96075 () Bool)

(assert (=> b!89601 m!96075))

(declare-fun m!96077 () Bool)

(assert (=> b!89601 m!96077))

(assert (=> b!89601 m!96057))

(declare-fun m!96079 () Bool)

(assert (=> b!89601 m!96079))

(declare-fun m!96081 () Bool)

(assert (=> b!89601 m!96081))

(assert (=> b!89601 m!95577))

(assert (=> b!89601 m!96077))

(declare-fun m!96083 () Bool)

(assert (=> b!89601 m!96083))

(declare-fun m!96085 () Bool)

(assert (=> b!89601 m!96085))

(assert (=> bm!8693 m!96061))

(declare-fun m!96087 () Bool)

(assert (=> b!89588 m!96087))

(declare-fun m!96089 () Bool)

(assert (=> b!89600 m!96089))

(declare-fun m!96091 () Bool)

(assert (=> b!89605 m!96091))

(assert (=> b!89605 m!95621))

(declare-fun m!96093 () Bool)

(assert (=> b!89605 m!96093))

(assert (=> b!89605 m!95621))

(assert (=> b!89605 m!95577))

(assert (=> b!89605 m!95577))

(declare-fun m!96095 () Bool)

(assert (=> b!89605 m!96095))

(assert (=> b!89605 m!96091))

(assert (=> b!89599 m!95577))

(assert (=> b!89599 m!95577))

(declare-fun m!96097 () Bool)

(assert (=> b!89599 m!96097))

(declare-fun m!96099 () Bool)

(assert (=> b!89604 m!96099))

(assert (=> b!89040 d!23867))

(declare-fun d!23869 () Bool)

(declare-fun e!58307 () Bool)

(assert (=> d!23869 e!58307))

(declare-fun res!45771 () Bool)

(assert (=> d!23869 (=> res!45771 e!58307)))

(declare-fun lt!43077 () Bool)

(assert (=> d!23869 (= res!45771 (not lt!43077))))

(declare-fun lt!43078 () Bool)

(assert (=> d!23869 (= lt!43077 lt!43078)))

(declare-fun lt!43079 () Unit!2620)

(declare-fun e!58308 () Unit!2620)

(assert (=> d!23869 (= lt!43079 e!58308)))

(declare-fun c!14930 () Bool)

(assert (=> d!23869 (= c!14930 lt!43078)))

(assert (=> d!23869 (= lt!43078 (containsKey!146 (toList!740 lt!42758) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23869 (= (contains!754 lt!42758 #b1000000000000000000000000000000000000000000000000000000000000000) lt!43077)))

(declare-fun b!89609 () Bool)

(declare-fun lt!43076 () Unit!2620)

(assert (=> b!89609 (= e!58308 lt!43076)))

(assert (=> b!89609 (= lt!43076 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42758) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89609 (isDefined!95 (getValueByKey!143 (toList!740 lt!42758) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89610 () Bool)

(declare-fun Unit!2649 () Unit!2620)

(assert (=> b!89610 (= e!58308 Unit!2649)))

(declare-fun b!89611 () Bool)

(assert (=> b!89611 (= e!58307 (isDefined!95 (getValueByKey!143 (toList!740 lt!42758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23869 c!14930) b!89609))

(assert (= (and d!23869 (not c!14930)) b!89610))

(assert (= (and d!23869 (not res!45771)) b!89611))

(declare-fun m!96101 () Bool)

(assert (=> d!23869 m!96101))

(declare-fun m!96103 () Bool)

(assert (=> b!89609 m!96103))

(assert (=> b!89609 m!95639))

(assert (=> b!89609 m!95639))

(declare-fun m!96105 () Bool)

(assert (=> b!89609 m!96105))

(assert (=> b!89611 m!95639))

(assert (=> b!89611 m!95639))

(assert (=> b!89611 m!96105))

(assert (=> bm!8615 d!23869))

(declare-fun d!23871 () Bool)

(declare-fun e!58309 () Bool)

(assert (=> d!23871 e!58309))

(declare-fun res!45772 () Bool)

(assert (=> d!23871 (=> (not res!45772) (not e!58309))))

(declare-fun lt!43082 () ListLongMap!1449)

(assert (=> d!23871 (= res!45772 (contains!754 lt!43082 (_1!1111 (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))))

(declare-fun lt!43081 () List!1517)

(assert (=> d!23871 (= lt!43082 (ListLongMap!1450 lt!43081))))

(declare-fun lt!43083 () Unit!2620)

(declare-fun lt!43080 () Unit!2620)

(assert (=> d!23871 (= lt!43083 lt!43080)))

(assert (=> d!23871 (= (getValueByKey!143 lt!43081 (_1!1111 (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))) (Some!148 (_2!1111 (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))))

(assert (=> d!23871 (= lt!43080 (lemmaContainsTupThenGetReturnValue!60 lt!43081 (_1!1111 (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (_2!1111 (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))))

(assert (=> d!23871 (= lt!43081 (insertStrictlySorted!63 (toList!740 (ite c!14770 (ite c!14772 call!8602 call!8582) call!8581)) (_1!1111 (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (_2!1111 (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))))

(assert (=> d!23871 (= (+!111 (ite c!14770 (ite c!14772 call!8602 call!8582) call!8581) (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) lt!43082)))

(declare-fun b!89612 () Bool)

(declare-fun res!45773 () Bool)

(assert (=> b!89612 (=> (not res!45773) (not e!58309))))

(assert (=> b!89612 (= res!45773 (= (getValueByKey!143 (toList!740 lt!43082) (_1!1111 (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))) (Some!148 (_2!1111 (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))))

(declare-fun b!89613 () Bool)

(assert (=> b!89613 (= e!58309 (contains!755 (toList!740 lt!43082) (ite c!14770 (ite c!14772 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42407) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (= (and d!23871 res!45772) b!89612))

(assert (= (and b!89612 res!45773) b!89613))

(declare-fun m!96107 () Bool)

(assert (=> d!23871 m!96107))

(declare-fun m!96109 () Bool)

(assert (=> d!23871 m!96109))

(declare-fun m!96111 () Bool)

(assert (=> d!23871 m!96111))

(declare-fun m!96113 () Bool)

(assert (=> d!23871 m!96113))

(declare-fun m!96115 () Bool)

(assert (=> b!89612 m!96115))

(declare-fun m!96117 () Bool)

(assert (=> b!89613 m!96117))

(assert (=> bm!8598 d!23871))

(declare-fun d!23873 () Bool)

(declare-fun lt!43084 () Bool)

(assert (=> d!23873 (= lt!43084 (select (content!95 (toList!740 lt!42577)) lt!42410))))

(declare-fun e!58310 () Bool)

(assert (=> d!23873 (= lt!43084 e!58310)))

(declare-fun res!45775 () Bool)

(assert (=> d!23873 (=> (not res!45775) (not e!58310))))

(assert (=> d!23873 (= res!45775 ((_ is Cons!1513) (toList!740 lt!42577)))))

(assert (=> d!23873 (= (contains!755 (toList!740 lt!42577) lt!42410) lt!43084)))

(declare-fun b!89614 () Bool)

(declare-fun e!58311 () Bool)

(assert (=> b!89614 (= e!58310 e!58311)))

(declare-fun res!45774 () Bool)

(assert (=> b!89614 (=> res!45774 e!58311)))

(assert (=> b!89614 (= res!45774 (= (h!2105 (toList!740 lt!42577)) lt!42410))))

(declare-fun b!89615 () Bool)

(assert (=> b!89615 (= e!58311 (contains!755 (t!5267 (toList!740 lt!42577)) lt!42410))))

(assert (= (and d!23873 res!45775) b!89614))

(assert (= (and b!89614 (not res!45774)) b!89615))

(declare-fun m!96119 () Bool)

(assert (=> d!23873 m!96119))

(declare-fun m!96121 () Bool)

(assert (=> d!23873 m!96121))

(declare-fun m!96123 () Bool)

(assert (=> b!89615 m!96123))

(assert (=> b!88891 d!23873))

(declare-fun d!23875 () Bool)

(declare-fun lt!43085 () Bool)

(assert (=> d!23875 (= lt!43085 (select (content!94 Nil!1513) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!58313 () Bool)

(assert (=> d!23875 (= lt!43085 e!58313)))

(declare-fun res!45776 () Bool)

(assert (=> d!23875 (=> (not res!45776) (not e!58313))))

(assert (=> d!23875 (= res!45776 ((_ is Cons!1512) Nil!1513))))

(assert (=> d!23875 (= (contains!756 Nil!1513 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000)) lt!43085)))

(declare-fun b!89616 () Bool)

(declare-fun e!58312 () Bool)

(assert (=> b!89616 (= e!58313 e!58312)))

(declare-fun res!45777 () Bool)

(assert (=> b!89616 (=> res!45777 e!58312)))

(assert (=> b!89616 (= res!45777 (= (h!2104 Nil!1513) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!89617 () Bool)

(assert (=> b!89617 (= e!58312 (contains!756 (t!5266 Nil!1513) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!23875 res!45776) b!89616))

(assert (= (and b!89616 (not res!45777)) b!89617))

(assert (=> d!23875 m!95471))

(assert (=> d!23875 m!95227))

(declare-fun m!96125 () Bool)

(assert (=> d!23875 m!96125))

(assert (=> b!89617 m!95227))

(declare-fun m!96127 () Bool)

(assert (=> b!89617 m!96127))

(assert (=> b!89142 d!23875))

(declare-fun d!23877 () Bool)

(assert (=> d!23877 (= (get!1218 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2676 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> b!88910 d!23877))

(declare-fun b!89618 () Bool)

(declare-fun e!58316 () Bool)

(declare-fun e!58317 () Bool)

(assert (=> b!89618 (= e!58316 e!58317)))

(declare-fun res!45780 () Bool)

(assert (=> b!89618 (=> (not res!45780) (not e!58317))))

(declare-fun e!58315 () Bool)

(assert (=> b!89618 (= res!45780 (not e!58315))))

(declare-fun res!45779 () Bool)

(assert (=> b!89618 (=> (not res!45779) (not e!58315))))

(assert (=> b!89618 (= res!45779 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!89619 () Bool)

(declare-fun e!58314 () Bool)

(declare-fun call!8702 () Bool)

(assert (=> b!89619 (= e!58314 call!8702)))

(declare-fun b!89620 () Bool)

(assert (=> b!89620 (= e!58315 (contains!756 (ite c!14791 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) Nil!1513) Nil!1513) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!89621 () Bool)

(assert (=> b!89621 (= e!58314 call!8702)))

(declare-fun c!14931 () Bool)

(declare-fun bm!8699 () Bool)

(assert (=> bm!8699 (= call!8702 (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!14931 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!14791 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) Nil!1513) Nil!1513)) (ite c!14791 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) Nil!1513) Nil!1513))))))

(declare-fun d!23879 () Bool)

(declare-fun res!45778 () Bool)

(assert (=> d!23879 (=> res!45778 e!58316)))

(assert (=> d!23879 (= res!45778 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> d!23879 (= (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14791 (Cons!1512 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) #b00000000000000000000000000000000) Nil!1513) Nil!1513)) e!58316)))

(declare-fun b!89622 () Bool)

(assert (=> b!89622 (= e!58317 e!58314)))

(assert (=> b!89622 (= c!14931 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!23879 (not res!45778)) b!89618))

(assert (= (and b!89618 res!45779) b!89620))

(assert (= (and b!89618 res!45780) b!89622))

(assert (= (and b!89622 c!14931) b!89619))

(assert (= (and b!89622 (not c!14931)) b!89621))

(assert (= (or b!89619 b!89621) bm!8699))

(assert (=> b!89618 m!95431))

(assert (=> b!89618 m!95431))

(assert (=> b!89618 m!95433))

(assert (=> b!89620 m!95431))

(assert (=> b!89620 m!95431))

(declare-fun m!96129 () Bool)

(assert (=> b!89620 m!96129))

(assert (=> bm!8699 m!95431))

(declare-fun m!96131 () Bool)

(assert (=> bm!8699 m!96131))

(assert (=> b!89622 m!95431))

(assert (=> b!89622 m!95431))

(assert (=> b!89622 m!95433))

(assert (=> bm!8622 d!23879))

(declare-fun b!89631 () Bool)

(declare-fun res!45790 () Bool)

(declare-fun e!58320 () Bool)

(assert (=> b!89631 (=> (not res!45790) (not e!58320))))

(assert (=> b!89631 (= res!45790 (and (= (size!2169 (_values!2354 newMap!16)) (bvadd (mask!6415 newMap!16) #b00000000000000000000000000000001)) (= (size!2168 (_keys!4049 newMap!16)) (size!2169 (_values!2354 newMap!16))) (bvsge (_size!432 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!432 newMap!16) (bvadd (mask!6415 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!89632 () Bool)

(declare-fun res!45791 () Bool)

(assert (=> b!89632 (=> (not res!45791) (not e!58320))))

(declare-fun size!2174 (LongMapFixedSize!766) (_ BitVec 32))

(assert (=> b!89632 (= res!45791 (bvsge (size!2174 newMap!16) (_size!432 newMap!16)))))

(declare-fun b!89634 () Bool)

(assert (=> b!89634 (= e!58320 (and (bvsge (extraKeys!2204 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2204 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!432 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!89633 () Bool)

(declare-fun res!45789 () Bool)

(assert (=> b!89633 (=> (not res!45789) (not e!58320))))

(assert (=> b!89633 (= res!45789 (= (size!2174 newMap!16) (bvadd (_size!432 newMap!16) (bvsdiv (bvadd (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!23881 () Bool)

(declare-fun res!45792 () Bool)

(assert (=> d!23881 (=> (not res!45792) (not e!58320))))

(assert (=> d!23881 (= res!45792 (validMask!0 (mask!6415 newMap!16)))))

(assert (=> d!23881 (= (simpleValid!60 newMap!16) e!58320)))

(assert (= (and d!23881 res!45792) b!89631))

(assert (= (and b!89631 res!45790) b!89632))

(assert (= (and b!89632 res!45791) b!89633))

(assert (= (and b!89633 res!45789) b!89634))

(declare-fun m!96133 () Bool)

(assert (=> b!89632 m!96133))

(assert (=> b!89633 m!96133))

(assert (=> d!23881 m!95573))

(assert (=> d!23695 d!23881))

(assert (=> d!23687 d!23693))

(declare-fun d!23883 () Bool)

(assert (=> d!23883 (arrayNoDuplicates!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) from!355 Nil!1513)))

(assert (=> d!23883 true))

(declare-fun _$71!120 () Unit!2620)

(assert (=> d!23883 (= (choose!39 (_keys!4049 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!120)))

(declare-fun bs!3761 () Bool)

(assert (= bs!3761 d!23883))

(assert (=> bs!3761 m!94921))

(assert (=> d!23687 d!23883))

(declare-fun d!23885 () Bool)

(declare-fun lt!43086 () Bool)

(assert (=> d!23885 (= lt!43086 (select (content!95 (toList!740 lt!42581)) lt!42408))))

(declare-fun e!58321 () Bool)

(assert (=> d!23885 (= lt!43086 e!58321)))

(declare-fun res!45794 () Bool)

(assert (=> d!23885 (=> (not res!45794) (not e!58321))))

(assert (=> d!23885 (= res!45794 ((_ is Cons!1513) (toList!740 lt!42581)))))

(assert (=> d!23885 (= (contains!755 (toList!740 lt!42581) lt!42408) lt!43086)))

(declare-fun b!89635 () Bool)

(declare-fun e!58322 () Bool)

(assert (=> b!89635 (= e!58321 e!58322)))

(declare-fun res!45793 () Bool)

(assert (=> b!89635 (=> res!45793 e!58322)))

(assert (=> b!89635 (= res!45793 (= (h!2105 (toList!740 lt!42581)) lt!42408))))

(declare-fun b!89636 () Bool)

(assert (=> b!89636 (= e!58322 (contains!755 (t!5267 (toList!740 lt!42581)) lt!42408))))

(assert (= (and d!23885 res!45794) b!89635))

(assert (= (and b!89635 (not res!45793)) b!89636))

(declare-fun m!96135 () Bool)

(assert (=> d!23885 m!96135))

(declare-fun m!96137 () Bool)

(assert (=> d!23885 m!96137))

(declare-fun m!96139 () Bool)

(assert (=> b!89636 m!96139))

(assert (=> b!88893 d!23885))

(assert (=> b!88870 d!23765))

(declare-fun d!23887 () Bool)

(declare-fun e!58323 () Bool)

(assert (=> d!23887 e!58323))

(declare-fun res!45795 () Bool)

(assert (=> d!23887 (=> res!45795 e!58323)))

(declare-fun lt!43088 () Bool)

(assert (=> d!23887 (= res!45795 (not lt!43088))))

(declare-fun lt!43089 () Bool)

(assert (=> d!23887 (= lt!43088 lt!43089)))

(declare-fun lt!43090 () Unit!2620)

(declare-fun e!58324 () Unit!2620)

(assert (=> d!23887 (= lt!43090 e!58324)))

(declare-fun c!14932 () Bool)

(assert (=> d!23887 (= c!14932 lt!43089)))

(assert (=> d!23887 (= lt!43089 (containsKey!146 (toList!740 (+!111 lt!42543 (tuple2!2201 lt!42539 lt!42541))) lt!42540))))

(assert (=> d!23887 (= (contains!754 (+!111 lt!42543 (tuple2!2201 lt!42539 lt!42541)) lt!42540) lt!43088)))

(declare-fun b!89637 () Bool)

(declare-fun lt!43087 () Unit!2620)

(assert (=> b!89637 (= e!58324 lt!43087)))

(assert (=> b!89637 (= lt!43087 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 (+!111 lt!42543 (tuple2!2201 lt!42539 lt!42541))) lt!42540))))

(assert (=> b!89637 (isDefined!95 (getValueByKey!143 (toList!740 (+!111 lt!42543 (tuple2!2201 lt!42539 lt!42541))) lt!42540))))

(declare-fun b!89638 () Bool)

(declare-fun Unit!2650 () Unit!2620)

(assert (=> b!89638 (= e!58324 Unit!2650)))

(declare-fun b!89639 () Bool)

(assert (=> b!89639 (= e!58323 (isDefined!95 (getValueByKey!143 (toList!740 (+!111 lt!42543 (tuple2!2201 lt!42539 lt!42541))) lt!42540)))))

(assert (= (and d!23887 c!14932) b!89637))

(assert (= (and d!23887 (not c!14932)) b!89638))

(assert (= (and d!23887 (not res!45795)) b!89639))

(declare-fun m!96141 () Bool)

(assert (=> d!23887 m!96141))

(declare-fun m!96143 () Bool)

(assert (=> b!89637 m!96143))

(declare-fun m!96145 () Bool)

(assert (=> b!89637 m!96145))

(assert (=> b!89637 m!96145))

(declare-fun m!96147 () Bool)

(assert (=> b!89637 m!96147))

(assert (=> b!89639 m!96145))

(assert (=> b!89639 m!96145))

(assert (=> b!89639 m!96147))

(assert (=> b!88870 d!23887))

(declare-fun d!23889 () Bool)

(declare-fun e!58325 () Bool)

(assert (=> d!23889 e!58325))

(declare-fun res!45796 () Bool)

(assert (=> d!23889 (=> (not res!45796) (not e!58325))))

(declare-fun lt!43093 () ListLongMap!1449)

(assert (=> d!23889 (= res!45796 (contains!754 lt!43093 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!43092 () List!1517)

(assert (=> d!23889 (= lt!43093 (ListLongMap!1450 lt!43092))))

(declare-fun lt!43094 () Unit!2620)

(declare-fun lt!43091 () Unit!2620)

(assert (=> d!23889 (= lt!43094 lt!43091)))

(assert (=> d!23889 (= (getValueByKey!143 lt!43092 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23889 (= lt!43091 (lemmaContainsTupThenGetReturnValue!60 lt!43092 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23889 (= lt!43092 (insertStrictlySorted!63 (toList!740 call!8525) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23889 (= (+!111 call!8525 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!43093)))

(declare-fun b!89640 () Bool)

(declare-fun res!45797 () Bool)

(assert (=> b!89640 (=> (not res!45797) (not e!58325))))

(assert (=> b!89640 (= res!45797 (= (getValueByKey!143 (toList!740 lt!43093) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!89641 () Bool)

(assert (=> b!89641 (= e!58325 (contains!755 (toList!740 lt!43093) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!23889 res!45796) b!89640))

(assert (= (and b!89640 res!45797) b!89641))

(declare-fun m!96149 () Bool)

(assert (=> d!23889 m!96149))

(declare-fun m!96151 () Bool)

(assert (=> d!23889 m!96151))

(declare-fun m!96153 () Bool)

(assert (=> d!23889 m!96153))

(declare-fun m!96155 () Bool)

(assert (=> d!23889 m!96155))

(declare-fun m!96157 () Bool)

(assert (=> b!89640 m!96157))

(declare-fun m!96159 () Bool)

(assert (=> b!89641 m!96159))

(assert (=> b!88870 d!23889))

(declare-fun d!23891 () Bool)

(declare-fun e!58326 () Bool)

(assert (=> d!23891 e!58326))

(declare-fun res!45798 () Bool)

(assert (=> d!23891 (=> (not res!45798) (not e!58326))))

(declare-fun lt!43097 () ListLongMap!1449)

(assert (=> d!23891 (= res!45798 (contains!754 lt!43097 (_1!1111 (tuple2!2201 lt!42539 lt!42541))))))

(declare-fun lt!43096 () List!1517)

(assert (=> d!23891 (= lt!43097 (ListLongMap!1450 lt!43096))))

(declare-fun lt!43098 () Unit!2620)

(declare-fun lt!43095 () Unit!2620)

(assert (=> d!23891 (= lt!43098 lt!43095)))

(assert (=> d!23891 (= (getValueByKey!143 lt!43096 (_1!1111 (tuple2!2201 lt!42539 lt!42541))) (Some!148 (_2!1111 (tuple2!2201 lt!42539 lt!42541))))))

(assert (=> d!23891 (= lt!43095 (lemmaContainsTupThenGetReturnValue!60 lt!43096 (_1!1111 (tuple2!2201 lt!42539 lt!42541)) (_2!1111 (tuple2!2201 lt!42539 lt!42541))))))

(assert (=> d!23891 (= lt!43096 (insertStrictlySorted!63 (toList!740 lt!42543) (_1!1111 (tuple2!2201 lt!42539 lt!42541)) (_2!1111 (tuple2!2201 lt!42539 lt!42541))))))

(assert (=> d!23891 (= (+!111 lt!42543 (tuple2!2201 lt!42539 lt!42541)) lt!43097)))

(declare-fun b!89642 () Bool)

(declare-fun res!45799 () Bool)

(assert (=> b!89642 (=> (not res!45799) (not e!58326))))

(assert (=> b!89642 (= res!45799 (= (getValueByKey!143 (toList!740 lt!43097) (_1!1111 (tuple2!2201 lt!42539 lt!42541))) (Some!148 (_2!1111 (tuple2!2201 lt!42539 lt!42541)))))))

(declare-fun b!89643 () Bool)

(assert (=> b!89643 (= e!58326 (contains!755 (toList!740 lt!43097) (tuple2!2201 lt!42539 lt!42541)))))

(assert (= (and d!23891 res!45798) b!89642))

(assert (= (and b!89642 res!45799) b!89643))

(declare-fun m!96161 () Bool)

(assert (=> d!23891 m!96161))

(declare-fun m!96163 () Bool)

(assert (=> d!23891 m!96163))

(declare-fun m!96165 () Bool)

(assert (=> d!23891 m!96165))

(declare-fun m!96167 () Bool)

(assert (=> d!23891 m!96167))

(declare-fun m!96169 () Bool)

(assert (=> b!89642 m!96169))

(declare-fun m!96171 () Bool)

(assert (=> b!89643 m!96171))

(assert (=> b!88870 d!23891))

(declare-fun d!23893 () Bool)

(assert (=> d!23893 (not (contains!754 (+!111 lt!42543 (tuple2!2201 lt!42539 lt!42541)) lt!42540))))

(declare-fun lt!43101 () Unit!2620)

(declare-fun choose!540 (ListLongMap!1449 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2620)

(assert (=> d!23893 (= lt!43101 (choose!540 lt!42543 lt!42539 lt!42541 lt!42540))))

(declare-fun e!58329 () Bool)

(assert (=> d!23893 e!58329))

(declare-fun res!45802 () Bool)

(assert (=> d!23893 (=> (not res!45802) (not e!58329))))

(assert (=> d!23893 (= res!45802 (not (contains!754 lt!42543 lt!42540)))))

(assert (=> d!23893 (= (addStillNotContains!35 lt!42543 lt!42539 lt!42541 lt!42540) lt!43101)))

(declare-fun b!89647 () Bool)

(assert (=> b!89647 (= e!58329 (not (= lt!42539 lt!42540)))))

(assert (= (and d!23893 res!45802) b!89647))

(assert (=> d!23893 m!95115))

(assert (=> d!23893 m!95115))

(assert (=> d!23893 m!95117))

(declare-fun m!96173 () Bool)

(assert (=> d!23893 m!96173))

(declare-fun m!96175 () Bool)

(assert (=> d!23893 m!96175))

(assert (=> b!88870 d!23893))

(assert (=> b!89133 d!23825))

(declare-fun d!23895 () Bool)

(declare-fun e!58332 () Bool)

(assert (=> d!23895 e!58332))

(declare-fun res!45805 () Bool)

(assert (=> d!23895 (=> (not res!45805) (not e!58332))))

(assert (=> d!23895 (= res!45805 (and (bvsge (index!3096 lt!42678) #b00000000000000000000000000000000) (bvslt (index!3096 lt!42678) (size!2168 (_keys!4049 newMap!16)))))))

(declare-fun lt!43104 () Unit!2620)

(declare-fun choose!541 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) Int) Unit!2620)

(assert (=> d!23895 (= lt!43104 (choose!541 (_keys!4049 newMap!16) lt!42672 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3096 lt!42678) (defaultEntry!2371 newMap!16)))))

(assert (=> d!23895 (validMask!0 (mask!6415 newMap!16))))

(assert (=> d!23895 (= (lemmaValidKeyInArrayIsInListMap!93 (_keys!4049 newMap!16) lt!42672 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3096 lt!42678) (defaultEntry!2371 newMap!16)) lt!43104)))

(declare-fun b!89650 () Bool)

(assert (=> b!89650 (= e!58332 (contains!754 (getCurrentListMap!433 (_keys!4049 newMap!16) lt!42672 (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (select (arr!1922 (_keys!4049 newMap!16)) (index!3096 lt!42678))))))

(assert (= (and d!23895 res!45805) b!89650))

(declare-fun m!96177 () Bool)

(assert (=> d!23895 m!96177))

(assert (=> d!23895 m!95573))

(assert (=> b!89650 m!95301))

(assert (=> b!89650 m!95317))

(assert (=> b!89650 m!95301))

(assert (=> b!89650 m!95317))

(declare-fun m!96179 () Bool)

(assert (=> b!89650 m!96179))

(assert (=> b!89037 d!23895))

(declare-fun d!23897 () Bool)

(declare-fun e!58335 () Bool)

(assert (=> d!23897 e!58335))

(declare-fun res!45808 () Bool)

(assert (=> d!23897 (=> (not res!45808) (not e!58335))))

(assert (=> d!23897 (= res!45808 (and (bvsge (index!3096 lt!42678) #b00000000000000000000000000000000) (bvslt (index!3096 lt!42678) (size!2169 (_values!2354 newMap!16)))))))

(declare-fun lt!43107 () Unit!2620)

(declare-fun choose!542 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) (_ BitVec 64) V!3041 Int) Unit!2620)

(assert (=> d!23897 (= lt!43107 (choose!542 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3096 lt!42678) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 (defaultEntry!2371 newMap!16)))))

(assert (=> d!23897 (validMask!0 (mask!6415 newMap!16))))

(assert (=> d!23897 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3096 lt!42678) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 (defaultEntry!2371 newMap!16)) lt!43107)))

(declare-fun b!89653 () Bool)

(assert (=> b!89653 (= e!58335 (= (+!111 (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (getCurrentListMap!433 (_keys!4049 newMap!16) (array!4042 (store (arr!1923 (_values!2354 newMap!16)) (index!3096 lt!42678) (ValueCellFull!929 lt!42407)) (size!2169 (_values!2354 newMap!16))) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16))))))

(assert (= (and d!23897 res!45808) b!89653))

(assert (=> d!23897 m!94891))

(declare-fun m!96181 () Bool)

(assert (=> d!23897 m!96181))

(assert (=> d!23897 m!95573))

(assert (=> b!89653 m!95329))

(assert (=> b!89653 m!95329))

(assert (=> b!89653 m!95655))

(assert (=> b!89653 m!95275))

(declare-fun m!96183 () Bool)

(assert (=> b!89653 m!96183))

(assert (=> b!89037 d!23897))

(declare-fun d!23899 () Bool)

(declare-fun e!58336 () Bool)

(assert (=> d!23899 e!58336))

(declare-fun res!45809 () Bool)

(assert (=> d!23899 (=> res!45809 e!58336)))

(declare-fun lt!43109 () Bool)

(assert (=> d!23899 (= res!45809 (not lt!43109))))

(declare-fun lt!43110 () Bool)

(assert (=> d!23899 (= lt!43109 lt!43110)))

(declare-fun lt!43111 () Unit!2620)

(declare-fun e!58337 () Unit!2620)

(assert (=> d!23899 (= lt!43111 e!58337)))

(declare-fun c!14933 () Bool)

(assert (=> d!23899 (= c!14933 lt!43110)))

(assert (=> d!23899 (= lt!43110 (containsKey!146 (toList!740 call!8581) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> d!23899 (= (contains!754 call!8581 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)) lt!43109)))

(declare-fun b!89654 () Bool)

(declare-fun lt!43108 () Unit!2620)

(assert (=> b!89654 (= e!58337 lt!43108)))

(assert (=> b!89654 (= lt!43108 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 call!8581) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> b!89654 (isDefined!95 (getValueByKey!143 (toList!740 call!8581) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(declare-fun b!89655 () Bool)

(declare-fun Unit!2651 () Unit!2620)

(assert (=> b!89655 (= e!58337 Unit!2651)))

(declare-fun b!89656 () Bool)

(assert (=> b!89656 (= e!58336 (isDefined!95 (getValueByKey!143 (toList!740 call!8581) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355))))))

(assert (= (and d!23899 c!14933) b!89654))

(assert (= (and d!23899 (not c!14933)) b!89655))

(assert (= (and d!23899 (not res!45809)) b!89656))

(assert (=> d!23899 m!94891))

(declare-fun m!96185 () Bool)

(assert (=> d!23899 m!96185))

(assert (=> b!89654 m!94891))

(declare-fun m!96187 () Bool)

(assert (=> b!89654 m!96187))

(assert (=> b!89654 m!94891))

(declare-fun m!96189 () Bool)

(assert (=> b!89654 m!96189))

(assert (=> b!89654 m!96189))

(declare-fun m!96191 () Bool)

(assert (=> b!89654 m!96191))

(assert (=> b!89656 m!94891))

(assert (=> b!89656 m!96189))

(assert (=> b!89656 m!96189))

(assert (=> b!89656 m!96191))

(assert (=> b!89037 d!23899))

(declare-fun b!89657 () Bool)

(declare-fun e!58338 () Bool)

(declare-fun e!58339 () Bool)

(assert (=> b!89657 (= e!58338 e!58339)))

(declare-fun c!14934 () Bool)

(assert (=> b!89657 (= c!14934 (validKeyInArray!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8700 () Bool)

(declare-fun call!8703 () Bool)

(assert (=> bm!8700 (= call!8703 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4049 newMap!16) (mask!6415 newMap!16)))))

(declare-fun d!23901 () Bool)

(declare-fun res!45811 () Bool)

(assert (=> d!23901 (=> res!45811 e!58338)))

(assert (=> d!23901 (= res!45811 (bvsge #b00000000000000000000000000000000 (size!2168 (_keys!4049 newMap!16))))))

(assert (=> d!23901 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4049 newMap!16) (mask!6415 newMap!16)) e!58338)))

(declare-fun b!89658 () Bool)

(declare-fun e!58340 () Bool)

(assert (=> b!89658 (= e!58339 e!58340)))

(declare-fun lt!43112 () (_ BitVec 64))

(assert (=> b!89658 (= lt!43112 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!43114 () Unit!2620)

(assert (=> b!89658 (= lt!43114 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4049 newMap!16) lt!43112 #b00000000000000000000000000000000))))

(assert (=> b!89658 (arrayContainsKey!0 (_keys!4049 newMap!16) lt!43112 #b00000000000000000000000000000000)))

(declare-fun lt!43113 () Unit!2620)

(assert (=> b!89658 (= lt!43113 lt!43114)))

(declare-fun res!45810 () Bool)

(assert (=> b!89658 (= res!45810 (= (seekEntryOrOpen!0 (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000) (_keys!4049 newMap!16) (mask!6415 newMap!16)) (Found!239 #b00000000000000000000000000000000)))))

(assert (=> b!89658 (=> (not res!45810) (not e!58340))))

(declare-fun b!89659 () Bool)

(assert (=> b!89659 (= e!58339 call!8703)))

(declare-fun b!89660 () Bool)

(assert (=> b!89660 (= e!58340 call!8703)))

(assert (= (and d!23901 (not res!45811)) b!89657))

(assert (= (and b!89657 c!14934) b!89658))

(assert (= (and b!89657 (not c!14934)) b!89659))

(assert (= (and b!89658 res!45810) b!89660))

(assert (= (or b!89660 b!89659) bm!8700))

(assert (=> b!89657 m!95577))

(assert (=> b!89657 m!95577))

(assert (=> b!89657 m!95579))

(declare-fun m!96193 () Bool)

(assert (=> bm!8700 m!96193))

(assert (=> b!89658 m!95577))

(declare-fun m!96195 () Bool)

(assert (=> b!89658 m!96195))

(declare-fun m!96197 () Bool)

(assert (=> b!89658 m!96197))

(assert (=> b!89658 m!95577))

(declare-fun m!96199 () Bool)

(assert (=> b!89658 m!96199))

(assert (=> b!88946 d!23901))

(assert (=> b!88872 d!23825))

(declare-fun d!23903 () Bool)

(assert (=> d!23903 (= (apply!84 lt!42758 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1220 (getValueByKey!143 (toList!740 lt!42758) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3762 () Bool)

(assert (= bs!3762 d!23903))

(assert (=> bs!3762 m!95427))

(assert (=> bs!3762 m!95427))

(declare-fun m!96201 () Bool)

(assert (=> bs!3762 m!96201))

(assert (=> b!89135 d!23903))

(assert (=> b!88922 d!23689))

(declare-fun b!89664 () Bool)

(declare-fun e!58342 () Option!149)

(assert (=> b!89664 (= e!58342 None!147)))

(declare-fun b!89662 () Bool)

(declare-fun e!58341 () Option!149)

(assert (=> b!89662 (= e!58341 e!58342)))

(declare-fun c!14936 () Bool)

(assert (=> b!89662 (= c!14936 (and ((_ is Cons!1513) (toList!740 lt!42572)) (not (= (_1!1111 (h!2105 (toList!740 lt!42572))) (_1!1111 lt!42408)))))))

(declare-fun d!23905 () Bool)

(declare-fun c!14935 () Bool)

(assert (=> d!23905 (= c!14935 (and ((_ is Cons!1513) (toList!740 lt!42572)) (= (_1!1111 (h!2105 (toList!740 lt!42572))) (_1!1111 lt!42408))))))

(assert (=> d!23905 (= (getValueByKey!143 (toList!740 lt!42572) (_1!1111 lt!42408)) e!58341)))

(declare-fun b!89661 () Bool)

(assert (=> b!89661 (= e!58341 (Some!148 (_2!1111 (h!2105 (toList!740 lt!42572)))))))

(declare-fun b!89663 () Bool)

(assert (=> b!89663 (= e!58342 (getValueByKey!143 (t!5267 (toList!740 lt!42572)) (_1!1111 lt!42408)))))

(assert (= (and d!23905 c!14935) b!89661))

(assert (= (and d!23905 (not c!14935)) b!89662))

(assert (= (and b!89662 c!14936) b!89663))

(assert (= (and b!89662 (not c!14936)) b!89664))

(declare-fun m!96203 () Bool)

(assert (=> b!89663 m!96203))

(assert (=> b!88888 d!23905))

(declare-fun d!23907 () Bool)

(declare-fun lt!43115 () Bool)

(assert (=> d!23907 (= lt!43115 (select (content!95 (toList!740 lt!42560)) lt!42408))))

(declare-fun e!58343 () Bool)

(assert (=> d!23907 (= lt!43115 e!58343)))

(declare-fun res!45813 () Bool)

(assert (=> d!23907 (=> (not res!45813) (not e!58343))))

(assert (=> d!23907 (= res!45813 ((_ is Cons!1513) (toList!740 lt!42560)))))

(assert (=> d!23907 (= (contains!755 (toList!740 lt!42560) lt!42408) lt!43115)))

(declare-fun b!89665 () Bool)

(declare-fun e!58344 () Bool)

(assert (=> b!89665 (= e!58343 e!58344)))

(declare-fun res!45812 () Bool)

(assert (=> b!89665 (=> res!45812 e!58344)))

(assert (=> b!89665 (= res!45812 (= (h!2105 (toList!740 lt!42560)) lt!42408))))

(declare-fun b!89666 () Bool)

(assert (=> b!89666 (= e!58344 (contains!755 (t!5267 (toList!740 lt!42560)) lt!42408))))

(assert (= (and d!23907 res!45813) b!89665))

(assert (= (and b!89665 (not res!45812)) b!89666))

(declare-fun m!96205 () Bool)

(assert (=> d!23907 m!96205))

(declare-fun m!96207 () Bool)

(assert (=> d!23907 m!96207))

(declare-fun m!96209 () Bool)

(assert (=> b!89666 m!96209))

(assert (=> b!88883 d!23907))

(declare-fun d!23909 () Bool)

(declare-fun e!58345 () Bool)

(assert (=> d!23909 e!58345))

(declare-fun res!45814 () Bool)

(assert (=> d!23909 (=> (not res!45814) (not e!58345))))

(declare-fun lt!43121 () ListLongMap!1449)

(assert (=> d!23909 (= res!45814 (not (contains!754 lt!43121 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!58350 () ListLongMap!1449)

(assert (=> d!23909 (= lt!43121 e!58350)))

(declare-fun c!14938 () Bool)

(assert (=> d!23909 (= c!14938 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> d!23909 (validMask!0 (mask!6415 (v!2677 (underlying!298 thiss!992))))))

(assert (=> d!23909 (= (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))) lt!43121)))

(declare-fun b!89667 () Bool)

(declare-fun e!58346 () Bool)

(declare-fun e!58348 () Bool)

(assert (=> b!89667 (= e!58346 e!58348)))

(assert (=> b!89667 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun res!45817 () Bool)

(assert (=> b!89667 (= res!45817 (contains!754 lt!43121 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!89667 (=> (not res!45817) (not e!58348))))

(declare-fun bm!8701 () Bool)

(declare-fun call!8704 () ListLongMap!1449)

(assert (=> bm!8701 (= call!8704 (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))))))

(declare-fun b!89668 () Bool)

(declare-fun e!58349 () ListLongMap!1449)

(assert (=> b!89668 (= e!58350 e!58349)))

(declare-fun c!14937 () Bool)

(assert (=> b!89668 (= c!14937 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun e!58351 () Bool)

(declare-fun b!89669 () Bool)

(assert (=> b!89669 (= e!58351 (= lt!43121 (getCurrentListMapNoExtraKeys!76 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun b!89670 () Bool)

(assert (=> b!89670 (= e!58349 call!8704)))

(declare-fun b!89671 () Bool)

(assert (=> b!89671 (= e!58351 (isEmpty!347 lt!43121))))

(declare-fun b!89672 () Bool)

(assert (=> b!89672 (= e!58346 e!58351)))

(declare-fun c!14940 () Bool)

(assert (=> b!89672 (= c!14940 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun b!89673 () Bool)

(declare-fun lt!43119 () Unit!2620)

(declare-fun lt!43122 () Unit!2620)

(assert (=> b!89673 (= lt!43119 lt!43122)))

(declare-fun lt!43118 () V!3041)

(declare-fun lt!43117 () (_ BitVec 64))

(declare-fun lt!43120 () ListLongMap!1449)

(declare-fun lt!43116 () (_ BitVec 64))

(assert (=> b!89673 (not (contains!754 (+!111 lt!43120 (tuple2!2201 lt!43116 lt!43118)) lt!43117))))

(assert (=> b!89673 (= lt!43122 (addStillNotContains!35 lt!43120 lt!43116 lt!43118 lt!43117))))

(assert (=> b!89673 (= lt!43117 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!89673 (= lt!43118 (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!89673 (= lt!43116 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!89673 (= lt!43120 call!8704)))

(assert (=> b!89673 (= e!58349 (+!111 call!8704 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!89674 () Bool)

(assert (=> b!89674 (= e!58345 e!58346)))

(declare-fun c!14939 () Bool)

(declare-fun e!58347 () Bool)

(assert (=> b!89674 (= c!14939 e!58347)))

(declare-fun res!45815 () Bool)

(assert (=> b!89674 (=> (not res!45815) (not e!58347))))

(assert (=> b!89674 (= res!45815 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun b!89675 () Bool)

(assert (=> b!89675 (= e!58347 (validKeyInArray!0 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!89675 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!89676 () Bool)

(assert (=> b!89676 (= e!58350 (ListLongMap!1450 Nil!1514))))

(declare-fun b!89677 () Bool)

(assert (=> b!89677 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> b!89677 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2169 (_values!2354 (v!2677 (underlying!298 thiss!992))))))))

(assert (=> b!89677 (= e!58348 (= (apply!84 lt!43121 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1217 (select (arr!1923 (_values!2354 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!347 (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!89678 () Bool)

(declare-fun res!45816 () Bool)

(assert (=> b!89678 (=> (not res!45816) (not e!58345))))

(assert (=> b!89678 (= res!45816 (not (contains!754 lt!43121 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23909 c!14938) b!89676))

(assert (= (and d!23909 (not c!14938)) b!89668))

(assert (= (and b!89668 c!14937) b!89673))

(assert (= (and b!89668 (not c!14937)) b!89670))

(assert (= (or b!89673 b!89670) bm!8701))

(assert (= (and d!23909 res!45814) b!89678))

(assert (= (and b!89678 res!45816) b!89674))

(assert (= (and b!89674 res!45815) b!89675))

(assert (= (and b!89674 c!14939) b!89667))

(assert (= (and b!89674 (not c!14939)) b!89672))

(assert (= (and b!89667 res!45817) b!89677))

(assert (= (and b!89672 c!14940) b!89669))

(assert (= (and b!89672 (not c!14940)) b!89671))

(declare-fun b_lambda!3955 () Bool)

(assert (=> (not b_lambda!3955) (not b!89673)))

(assert (=> b!89673 t!5263))

(declare-fun b_and!5377 () Bool)

(assert (= b_and!5373 (and (=> t!5263 result!2955) b_and!5377)))

(assert (=> b!89673 t!5265))

(declare-fun b_and!5379 () Bool)

(assert (= b_and!5375 (and (=> t!5265 result!2959) b_and!5379)))

(declare-fun b_lambda!3957 () Bool)

(assert (=> (not b_lambda!3957) (not b!89677)))

(assert (=> b!89677 t!5263))

(declare-fun b_and!5381 () Bool)

(assert (= b_and!5377 (and (=> t!5263 result!2955) b_and!5381)))

(assert (=> b!89677 t!5265))

(declare-fun b_and!5383 () Bool)

(assert (= b_and!5379 (and (=> t!5265 result!2959) b_and!5383)))

(declare-fun m!96211 () Bool)

(assert (=> b!89669 m!96211))

(declare-fun m!96213 () Bool)

(assert (=> b!89675 m!96213))

(assert (=> b!89675 m!96213))

(declare-fun m!96215 () Bool)

(assert (=> b!89675 m!96215))

(assert (=> b!89668 m!96213))

(assert (=> b!89668 m!96213))

(assert (=> b!89668 m!96215))

(declare-fun m!96217 () Bool)

(assert (=> b!89673 m!96217))

(declare-fun m!96219 () Bool)

(assert (=> b!89673 m!96219))

(declare-fun m!96221 () Bool)

(assert (=> b!89673 m!96221))

(declare-fun m!96223 () Bool)

(assert (=> b!89673 m!96223))

(assert (=> b!89673 m!96217))

(assert (=> b!89673 m!94941))

(declare-fun m!96225 () Bool)

(assert (=> b!89673 m!96225))

(declare-fun m!96227 () Bool)

(assert (=> b!89673 m!96227))

(assert (=> b!89673 m!94941))

(assert (=> b!89673 m!96221))

(assert (=> b!89673 m!96213))

(assert (=> b!89677 m!96217))

(assert (=> b!89677 m!94941))

(assert (=> b!89677 m!96213))

(assert (=> b!89677 m!96217))

(assert (=> b!89677 m!94941))

(assert (=> b!89677 m!96225))

(assert (=> b!89677 m!96213))

(declare-fun m!96229 () Bool)

(assert (=> b!89677 m!96229))

(declare-fun m!96231 () Bool)

(assert (=> d!23909 m!96231))

(assert (=> d!23909 m!94911))

(assert (=> b!89667 m!96213))

(assert (=> b!89667 m!96213))

(declare-fun m!96233 () Bool)

(assert (=> b!89667 m!96233))

(declare-fun m!96235 () Bool)

(assert (=> b!89678 m!96235))

(declare-fun m!96237 () Bool)

(assert (=> b!89671 m!96237))

(assert (=> bm!8701 m!96211))

(assert (=> bm!8522 d!23909))

(declare-fun d!23911 () Bool)

(declare-fun res!45818 () Bool)

(declare-fun e!58352 () Bool)

(assert (=> d!23911 (=> res!45818 e!58352)))

(assert (=> d!23911 (= res!45818 (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> d!23911 (= (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!58352)))

(declare-fun b!89679 () Bool)

(declare-fun e!58353 () Bool)

(assert (=> b!89679 (= e!58352 e!58353)))

(declare-fun res!45819 () Bool)

(assert (=> b!89679 (=> (not res!45819) (not e!58353))))

(assert (=> b!89679 (= res!45819 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2168 (_keys!4049 (v!2677 (underlying!298 thiss!992))))))))

(declare-fun b!89680 () Bool)

(assert (=> b!89680 (= e!58353 (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!23911 (not res!45818)) b!89679))

(assert (= (and b!89679 res!45819) b!89680))

(assert (=> d!23911 m!96213))

(assert (=> b!89680 m!94891))

(declare-fun m!96239 () Bool)

(assert (=> b!89680 m!96239))

(assert (=> b!88917 d!23911))

(declare-fun d!23913 () Bool)

(declare-fun res!45820 () Bool)

(declare-fun e!58354 () Bool)

(assert (=> d!23913 (=> res!45820 e!58354)))

(assert (=> d!23913 (= res!45820 (= (select (arr!1922 (_keys!4049 newMap!16)) #b00000000000000000000000000000000) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355)))))

(assert (=> d!23913 (= (arrayContainsKey!0 (_keys!4049 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b00000000000000000000000000000000) e!58354)))

(declare-fun b!89681 () Bool)

(declare-fun e!58355 () Bool)

(assert (=> b!89681 (= e!58354 e!58355)))

(declare-fun res!45821 () Bool)

(assert (=> b!89681 (=> (not res!45821) (not e!58355))))

(assert (=> b!89681 (= res!45821 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2168 (_keys!4049 newMap!16))))))

(declare-fun b!89682 () Bool)

(assert (=> b!89682 (= e!58355 (arrayContainsKey!0 (_keys!4049 newMap!16) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23913 (not res!45820)) b!89681))

(assert (= (and b!89681 res!45821) b!89682))

(assert (=> d!23913 m!95577))

(assert (=> b!89682 m!94891))

(declare-fun m!96241 () Bool)

(assert (=> b!89682 m!96241))

(assert (=> bm!8592 d!23913))

(declare-fun d!23915 () Bool)

(declare-fun e!58356 () Bool)

(assert (=> d!23915 e!58356))

(declare-fun res!45822 () Bool)

(assert (=> d!23915 (=> res!45822 e!58356)))

(declare-fun lt!43124 () Bool)

(assert (=> d!23915 (= res!45822 (not lt!43124))))

(declare-fun lt!43125 () Bool)

(assert (=> d!23915 (= lt!43124 lt!43125)))

(declare-fun lt!43126 () Unit!2620)

(declare-fun e!58357 () Unit!2620)

(assert (=> d!23915 (= lt!43126 e!58357)))

(declare-fun c!14941 () Bool)

(assert (=> d!23915 (= c!14941 lt!43125)))

(assert (=> d!23915 (= lt!43125 (containsKey!146 (toList!740 lt!42572) (_1!1111 lt!42408)))))

(assert (=> d!23915 (= (contains!754 lt!42572 (_1!1111 lt!42408)) lt!43124)))

(declare-fun b!89683 () Bool)

(declare-fun lt!43123 () Unit!2620)

(assert (=> b!89683 (= e!58357 lt!43123)))

(assert (=> b!89683 (= lt!43123 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42572) (_1!1111 lt!42408)))))

(assert (=> b!89683 (isDefined!95 (getValueByKey!143 (toList!740 lt!42572) (_1!1111 lt!42408)))))

(declare-fun b!89684 () Bool)

(declare-fun Unit!2652 () Unit!2620)

(assert (=> b!89684 (= e!58357 Unit!2652)))

(declare-fun b!89685 () Bool)

(assert (=> b!89685 (= e!58356 (isDefined!95 (getValueByKey!143 (toList!740 lt!42572) (_1!1111 lt!42408))))))

(assert (= (and d!23915 c!14941) b!89683))

(assert (= (and d!23915 (not c!14941)) b!89684))

(assert (= (and d!23915 (not res!45822)) b!89685))

(declare-fun m!96243 () Bool)

(assert (=> d!23915 m!96243))

(declare-fun m!96245 () Bool)

(assert (=> b!89683 m!96245))

(assert (=> b!89683 m!95189))

(assert (=> b!89683 m!95189))

(declare-fun m!96247 () Bool)

(assert (=> b!89683 m!96247))

(assert (=> b!89685 m!95189))

(assert (=> b!89685 m!95189))

(assert (=> b!89685 m!96247))

(assert (=> d!23665 d!23915))

(declare-fun b!89689 () Bool)

(declare-fun e!58359 () Option!149)

(assert (=> b!89689 (= e!58359 None!147)))

(declare-fun b!89687 () Bool)

(declare-fun e!58358 () Option!149)

(assert (=> b!89687 (= e!58358 e!58359)))

(declare-fun c!14943 () Bool)

(assert (=> b!89687 (= c!14943 (and ((_ is Cons!1513) lt!42571) (not (= (_1!1111 (h!2105 lt!42571)) (_1!1111 lt!42408)))))))

(declare-fun d!23917 () Bool)

(declare-fun c!14942 () Bool)

(assert (=> d!23917 (= c!14942 (and ((_ is Cons!1513) lt!42571) (= (_1!1111 (h!2105 lt!42571)) (_1!1111 lt!42408))))))

(assert (=> d!23917 (= (getValueByKey!143 lt!42571 (_1!1111 lt!42408)) e!58358)))

(declare-fun b!89686 () Bool)

(assert (=> b!89686 (= e!58358 (Some!148 (_2!1111 (h!2105 lt!42571))))))

(declare-fun b!89688 () Bool)

(assert (=> b!89688 (= e!58359 (getValueByKey!143 (t!5267 lt!42571) (_1!1111 lt!42408)))))

(assert (= (and d!23917 c!14942) b!89686))

(assert (= (and d!23917 (not c!14942)) b!89687))

(assert (= (and b!89687 c!14943) b!89688))

(assert (= (and b!89687 (not c!14943)) b!89689))

(declare-fun m!96249 () Bool)

(assert (=> b!89688 m!96249))

(assert (=> d!23665 d!23917))

(declare-fun d!23919 () Bool)

(assert (=> d!23919 (= (getValueByKey!143 lt!42571 (_1!1111 lt!42408)) (Some!148 (_2!1111 lt!42408)))))

(declare-fun lt!43127 () Unit!2620)

(assert (=> d!23919 (= lt!43127 (choose!535 lt!42571 (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(declare-fun e!58360 () Bool)

(assert (=> d!23919 e!58360))

(declare-fun res!45823 () Bool)

(assert (=> d!23919 (=> (not res!45823) (not e!58360))))

(assert (=> d!23919 (= res!45823 (isStrictlySorted!287 lt!42571))))

(assert (=> d!23919 (= (lemmaContainsTupThenGetReturnValue!60 lt!42571 (_1!1111 lt!42408) (_2!1111 lt!42408)) lt!43127)))

(declare-fun b!89690 () Bool)

(declare-fun res!45824 () Bool)

(assert (=> b!89690 (=> (not res!45824) (not e!58360))))

(assert (=> b!89690 (= res!45824 (containsKey!146 lt!42571 (_1!1111 lt!42408)))))

(declare-fun b!89691 () Bool)

(assert (=> b!89691 (= e!58360 (contains!755 lt!42571 (tuple2!2201 (_1!1111 lt!42408) (_2!1111 lt!42408))))))

(assert (= (and d!23919 res!45823) b!89690))

(assert (= (and b!89690 res!45824) b!89691))

(assert (=> d!23919 m!95183))

(declare-fun m!96251 () Bool)

(assert (=> d!23919 m!96251))

(declare-fun m!96253 () Bool)

(assert (=> d!23919 m!96253))

(declare-fun m!96255 () Bool)

(assert (=> b!89690 m!96255))

(declare-fun m!96257 () Bool)

(assert (=> b!89691 m!96257))

(assert (=> d!23665 d!23919))

(declare-fun b!89692 () Bool)

(declare-fun e!58361 () List!1517)

(declare-fun call!8705 () List!1517)

(assert (=> b!89692 (= e!58361 call!8705)))

(declare-fun b!89693 () Bool)

(declare-fun e!58363 () List!1517)

(assert (=> b!89693 (= e!58363 (insertStrictlySorted!63 (t!5267 (toList!740 lt!42397)) (_1!1111 lt!42408) (_2!1111 lt!42408)))))

(declare-fun b!89694 () Bool)

(declare-fun e!58364 () List!1517)

(declare-fun call!8706 () List!1517)

(assert (=> b!89694 (= e!58364 call!8706)))

(declare-fun call!8707 () List!1517)

(declare-fun c!14944 () Bool)

(declare-fun bm!8702 () Bool)

(assert (=> bm!8702 (= call!8707 ($colon$colon!73 e!58363 (ite c!14944 (h!2105 (toList!740 lt!42397)) (tuple2!2201 (_1!1111 lt!42408) (_2!1111 lt!42408)))))))

(declare-fun c!14946 () Bool)

(assert (=> bm!8702 (= c!14946 c!14944)))

(declare-fun b!89695 () Bool)

(declare-fun res!45825 () Bool)

(declare-fun e!58365 () Bool)

(assert (=> b!89695 (=> (not res!45825) (not e!58365))))

(declare-fun lt!43128 () List!1517)

(assert (=> b!89695 (= res!45825 (containsKey!146 lt!43128 (_1!1111 lt!42408)))))

(declare-fun b!89696 () Bool)

(assert (=> b!89696 (= e!58365 (contains!755 lt!43128 (tuple2!2201 (_1!1111 lt!42408) (_2!1111 lt!42408))))))

(declare-fun b!89697 () Bool)

(assert (=> b!89697 (= e!58364 call!8706)))

(declare-fun d!23921 () Bool)

(assert (=> d!23921 e!58365))

(declare-fun res!45826 () Bool)

(assert (=> d!23921 (=> (not res!45826) (not e!58365))))

(assert (=> d!23921 (= res!45826 (isStrictlySorted!287 lt!43128))))

(declare-fun e!58362 () List!1517)

(assert (=> d!23921 (= lt!43128 e!58362)))

(assert (=> d!23921 (= c!14944 (and ((_ is Cons!1513) (toList!740 lt!42397)) (bvslt (_1!1111 (h!2105 (toList!740 lt!42397))) (_1!1111 lt!42408))))))

(assert (=> d!23921 (isStrictlySorted!287 (toList!740 lt!42397))))

(assert (=> d!23921 (= (insertStrictlySorted!63 (toList!740 lt!42397) (_1!1111 lt!42408) (_2!1111 lt!42408)) lt!43128)))

(declare-fun b!89698 () Bool)

(assert (=> b!89698 (= e!58362 e!58361)))

(declare-fun c!14945 () Bool)

(assert (=> b!89698 (= c!14945 (and ((_ is Cons!1513) (toList!740 lt!42397)) (= (_1!1111 (h!2105 (toList!740 lt!42397))) (_1!1111 lt!42408))))))

(declare-fun b!89699 () Bool)

(declare-fun c!14947 () Bool)

(assert (=> b!89699 (= e!58363 (ite c!14945 (t!5267 (toList!740 lt!42397)) (ite c!14947 (Cons!1513 (h!2105 (toList!740 lt!42397)) (t!5267 (toList!740 lt!42397))) Nil!1514)))))

(declare-fun bm!8703 () Bool)

(assert (=> bm!8703 (= call!8705 call!8707)))

(declare-fun b!89700 () Bool)

(assert (=> b!89700 (= c!14947 (and ((_ is Cons!1513) (toList!740 lt!42397)) (bvsgt (_1!1111 (h!2105 (toList!740 lt!42397))) (_1!1111 lt!42408))))))

(assert (=> b!89700 (= e!58361 e!58364)))

(declare-fun b!89701 () Bool)

(assert (=> b!89701 (= e!58362 call!8707)))

(declare-fun bm!8704 () Bool)

(assert (=> bm!8704 (= call!8706 call!8705)))

(assert (= (and d!23921 c!14944) b!89701))

(assert (= (and d!23921 (not c!14944)) b!89698))

(assert (= (and b!89698 c!14945) b!89692))

(assert (= (and b!89698 (not c!14945)) b!89700))

(assert (= (and b!89700 c!14947) b!89697))

(assert (= (and b!89700 (not c!14947)) b!89694))

(assert (= (or b!89697 b!89694) bm!8704))

(assert (= (or b!89692 bm!8704) bm!8703))

(assert (= (or b!89701 bm!8703) bm!8702))

(assert (= (and bm!8702 c!14946) b!89693))

(assert (= (and bm!8702 (not c!14946)) b!89699))

(assert (= (and d!23921 res!45826) b!89695))

(assert (= (and b!89695 res!45825) b!89696))

(declare-fun m!96259 () Bool)

(assert (=> b!89696 m!96259))

(declare-fun m!96261 () Bool)

(assert (=> d!23921 m!96261))

(assert (=> d!23921 m!95463))

(declare-fun m!96263 () Bool)

(assert (=> b!89693 m!96263))

(declare-fun m!96265 () Bool)

(assert (=> b!89695 m!96265))

(declare-fun m!96267 () Bool)

(assert (=> bm!8702 m!96267))

(assert (=> d!23665 d!23921))

(assert (=> b!89059 d!23863))

(declare-fun d!23923 () Bool)

(declare-fun e!58366 () Bool)

(assert (=> d!23923 e!58366))

(declare-fun res!45827 () Bool)

(assert (=> d!23923 (=> (not res!45827) (not e!58366))))

(declare-fun lt!43131 () ListLongMap!1449)

(assert (=> d!23923 (= res!45827 (contains!754 lt!43131 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(declare-fun lt!43130 () List!1517)

(assert (=> d!23923 (= lt!43131 (ListLongMap!1450 lt!43130))))

(declare-fun lt!43132 () Unit!2620)

(declare-fun lt!43129 () Unit!2620)

(assert (=> d!23923 (= lt!43132 lt!43129)))

(assert (=> d!23923 (= (getValueByKey!143 lt!43130 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23923 (= lt!43129 (lemmaContainsTupThenGetReturnValue!60 lt!43130 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23923 (= lt!43130 (insertStrictlySorted!63 (toList!740 lt!42413) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23923 (= (+!111 lt!42413 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) lt!43131)))

(declare-fun b!89702 () Bool)

(declare-fun res!45828 () Bool)

(assert (=> b!89702 (=> (not res!45828) (not e!58366))))

(assert (=> b!89702 (= res!45828 (= (getValueByKey!143 (toList!740 lt!43131) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))))

(declare-fun b!89703 () Bool)

(assert (=> b!89703 (= e!58366 (contains!755 (toList!740 lt!43131) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))

(assert (= (and d!23923 res!45827) b!89702))

(assert (= (and b!89702 res!45828) b!89703))

(declare-fun m!96269 () Bool)

(assert (=> d!23923 m!96269))

(declare-fun m!96271 () Bool)

(assert (=> d!23923 m!96271))

(declare-fun m!96273 () Bool)

(assert (=> d!23923 m!96273))

(declare-fun m!96275 () Bool)

(assert (=> d!23923 m!96275))

(declare-fun m!96277 () Bool)

(assert (=> b!89702 m!96277))

(declare-fun m!96279 () Bool)

(assert (=> b!89703 m!96279))

(assert (=> d!23667 d!23923))

(declare-fun d!23925 () Bool)

(declare-fun e!58367 () Bool)

(assert (=> d!23925 e!58367))

(declare-fun res!45829 () Bool)

(assert (=> d!23925 (=> (not res!45829) (not e!58367))))

(declare-fun lt!43135 () ListLongMap!1449)

(assert (=> d!23925 (= res!45829 (contains!754 lt!43135 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(declare-fun lt!43134 () List!1517)

(assert (=> d!23925 (= lt!43135 (ListLongMap!1450 lt!43134))))

(declare-fun lt!43136 () Unit!2620)

(declare-fun lt!43133 () Unit!2620)

(assert (=> d!23925 (= lt!43136 lt!43133)))

(assert (=> d!23925 (= (getValueByKey!143 lt!43134 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23925 (= lt!43133 (lemmaContainsTupThenGetReturnValue!60 lt!43134 (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23925 (= lt!43134 (insertStrictlySorted!63 (toList!740 (+!111 lt!42413 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))))))

(assert (=> d!23925 (= (+!111 (+!111 lt!42413 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) lt!43135)))

(declare-fun b!89704 () Bool)

(declare-fun res!45830 () Bool)

(assert (=> b!89704 (=> (not res!45830) (not e!58367))))

(assert (=> b!89704 (= res!45830 (= (getValueByKey!143 (toList!740 lt!43135) (_1!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (Some!148 (_2!1111 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))))

(declare-fun b!89705 () Bool)

(assert (=> b!89705 (= e!58367 (contains!755 (toList!740 lt!43135) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))

(assert (= (and d!23925 res!45829) b!89704))

(assert (= (and b!89704 res!45830) b!89705))

(declare-fun m!96281 () Bool)

(assert (=> d!23925 m!96281))

(declare-fun m!96283 () Bool)

(assert (=> d!23925 m!96283))

(declare-fun m!96285 () Bool)

(assert (=> d!23925 m!96285))

(declare-fun m!96287 () Bool)

(assert (=> d!23925 m!96287))

(declare-fun m!96289 () Bool)

(assert (=> b!89704 m!96289))

(declare-fun m!96291 () Bool)

(assert (=> b!89705 m!96291))

(assert (=> d!23667 d!23925))

(declare-fun d!23927 () Bool)

(assert (=> d!23927 (= (+!111 (+!111 lt!42413 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (+!111 (+!111 lt!42413 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)))))

(assert (=> d!23927 true))

(declare-fun _$28!151 () Unit!2620)

(assert (=> d!23927 (= (choose!533 lt!42413 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))) _$28!151)))

(declare-fun bs!3763 () Bool)

(assert (= bs!3763 d!23927))

(assert (=> bs!3763 m!95193))

(assert (=> bs!3763 m!95193))

(assert (=> bs!3763 m!95195))

(assert (=> bs!3763 m!95199))

(assert (=> bs!3763 m!95199))

(assert (=> bs!3763 m!95201))

(assert (=> d!23667 d!23927))

(declare-fun d!23929 () Bool)

(declare-fun e!58368 () Bool)

(assert (=> d!23929 e!58368))

(declare-fun res!45831 () Bool)

(assert (=> d!23929 (=> (not res!45831) (not e!58368))))

(declare-fun lt!43139 () ListLongMap!1449)

(assert (=> d!23929 (= res!45831 (contains!754 lt!43139 (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(declare-fun lt!43138 () List!1517)

(assert (=> d!23929 (= lt!43139 (ListLongMap!1450 lt!43138))))

(declare-fun lt!43140 () Unit!2620)

(declare-fun lt!43137 () Unit!2620)

(assert (=> d!23929 (= lt!43140 lt!43137)))

(assert (=> d!23929 (= (getValueByKey!143 lt!43138 (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23929 (= lt!43137 (lemmaContainsTupThenGetReturnValue!60 lt!43138 (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23929 (= lt!43138 (insertStrictlySorted!63 (toList!740 lt!42413) (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23929 (= (+!111 lt!42413 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!43139)))

(declare-fun b!89706 () Bool)

(declare-fun res!45832 () Bool)

(assert (=> b!89706 (=> (not res!45832) (not e!58368))))

(assert (=> b!89706 (= res!45832 (= (getValueByKey!143 (toList!740 lt!43139) (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(declare-fun b!89707 () Bool)

(assert (=> b!89707 (= e!58368 (contains!755 (toList!740 lt!43139) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))

(assert (= (and d!23929 res!45831) b!89706))

(assert (= (and b!89706 res!45832) b!89707))

(declare-fun m!96293 () Bool)

(assert (=> d!23929 m!96293))

(declare-fun m!96295 () Bool)

(assert (=> d!23929 m!96295))

(declare-fun m!96297 () Bool)

(assert (=> d!23929 m!96297))

(declare-fun m!96299 () Bool)

(assert (=> d!23929 m!96299))

(declare-fun m!96301 () Bool)

(assert (=> b!89706 m!96301))

(declare-fun m!96303 () Bool)

(assert (=> b!89707 m!96303))

(assert (=> d!23667 d!23929))

(declare-fun d!23931 () Bool)

(declare-fun e!58369 () Bool)

(assert (=> d!23931 e!58369))

(declare-fun res!45833 () Bool)

(assert (=> d!23931 (=> (not res!45833) (not e!58369))))

(declare-fun lt!43143 () ListLongMap!1449)

(assert (=> d!23931 (= res!45833 (contains!754 lt!43143 (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(declare-fun lt!43142 () List!1517)

(assert (=> d!23931 (= lt!43143 (ListLongMap!1450 lt!43142))))

(declare-fun lt!43144 () Unit!2620)

(declare-fun lt!43141 () Unit!2620)

(assert (=> d!23931 (= lt!43144 lt!43141)))

(assert (=> d!23931 (= (getValueByKey!143 lt!43142 (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23931 (= lt!43141 (lemmaContainsTupThenGetReturnValue!60 lt!43142 (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23931 (= lt!43142 (insertStrictlySorted!63 (toList!740 (+!111 lt!42413 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407))) (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23931 (= (+!111 (+!111 lt!42413 (tuple2!2201 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) lt!42407)) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!43143)))

(declare-fun b!89708 () Bool)

(declare-fun res!45834 () Bool)

(assert (=> b!89708 (=> (not res!45834) (not e!58369))))

(assert (=> b!89708 (= res!45834 (= (getValueByKey!143 (toList!740 lt!43143) (_1!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(declare-fun b!89709 () Bool)

(assert (=> b!89709 (= e!58369 (contains!755 (toList!740 lt!43143) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))

(assert (= (and d!23931 res!45833) b!89708))

(assert (= (and b!89708 res!45834) b!89709))

(declare-fun m!96305 () Bool)

(assert (=> d!23931 m!96305))

(declare-fun m!96307 () Bool)

(assert (=> d!23931 m!96307))

(declare-fun m!96309 () Bool)

(assert (=> d!23931 m!96309))

(declare-fun m!96311 () Bool)

(assert (=> d!23931 m!96311))

(declare-fun m!96313 () Bool)

(assert (=> b!89708 m!96313))

(declare-fun m!96315 () Bool)

(assert (=> b!89709 m!96315))

(assert (=> d!23667 d!23931))

(assert (=> b!89140 d!23809))

(declare-fun d!23933 () Bool)

(declare-fun lt!43145 () Bool)

(assert (=> d!23933 (= lt!43145 (select (content!95 (toList!740 lt!42564)) lt!42406))))

(declare-fun e!58370 () Bool)

(assert (=> d!23933 (= lt!43145 e!58370)))

(declare-fun res!45836 () Bool)

(assert (=> d!23933 (=> (not res!45836) (not e!58370))))

(assert (=> d!23933 (= res!45836 ((_ is Cons!1513) (toList!740 lt!42564)))))

(assert (=> d!23933 (= (contains!755 (toList!740 lt!42564) lt!42406) lt!43145)))

(declare-fun b!89710 () Bool)

(declare-fun e!58371 () Bool)

(assert (=> b!89710 (= e!58370 e!58371)))

(declare-fun res!45835 () Bool)

(assert (=> b!89710 (=> res!45835 e!58371)))

(assert (=> b!89710 (= res!45835 (= (h!2105 (toList!740 lt!42564)) lt!42406))))

(declare-fun b!89711 () Bool)

(assert (=> b!89711 (= e!58371 (contains!755 (t!5267 (toList!740 lt!42564)) lt!42406))))

(assert (= (and d!23933 res!45836) b!89710))

(assert (= (and b!89710 (not res!45835)) b!89711))

(declare-fun m!96317 () Bool)

(assert (=> d!23933 m!96317))

(declare-fun m!96319 () Bool)

(assert (=> d!23933 m!96319))

(declare-fun m!96321 () Bool)

(assert (=> b!89711 m!96321))

(assert (=> b!88885 d!23933))

(assert (=> b!88866 d!23909))

(declare-fun d!23935 () Bool)

(declare-fun e!58372 () Bool)

(assert (=> d!23935 e!58372))

(declare-fun res!45837 () Bool)

(assert (=> d!23935 (=> res!45837 e!58372)))

(declare-fun lt!43147 () Bool)

(assert (=> d!23935 (= res!45837 (not lt!43147))))

(declare-fun lt!43148 () Bool)

(assert (=> d!23935 (= lt!43147 lt!43148)))

(declare-fun lt!43149 () Unit!2620)

(declare-fun e!58373 () Unit!2620)

(assert (=> d!23935 (= lt!43149 e!58373)))

(declare-fun c!14948 () Bool)

(assert (=> d!23935 (= c!14948 lt!43148)))

(assert (=> d!23935 (= lt!43148 (containsKey!146 (toList!740 lt!42758) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23935 (= (contains!754 lt!42758 (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!43147)))

(declare-fun b!89712 () Bool)

(declare-fun lt!43146 () Unit!2620)

(assert (=> b!89712 (= e!58373 lt!43146)))

(assert (=> b!89712 (= lt!43146 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 lt!42758) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!89712 (isDefined!95 (getValueByKey!143 (toList!740 lt!42758) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!89713 () Bool)

(declare-fun Unit!2653 () Unit!2620)

(assert (=> b!89713 (= e!58373 Unit!2653)))

(declare-fun b!89714 () Bool)

(assert (=> b!89714 (= e!58372 (isDefined!95 (getValueByKey!143 (toList!740 lt!42758) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23935 c!14948) b!89712))

(assert (= (and d!23935 (not c!14948)) b!89713))

(assert (= (and d!23935 (not res!45837)) b!89714))

(assert (=> d!23935 m!95107))

(declare-fun m!96323 () Bool)

(assert (=> d!23935 m!96323))

(assert (=> b!89712 m!95107))

(declare-fun m!96325 () Bool)

(assert (=> b!89712 m!96325))

(assert (=> b!89712 m!95107))

(assert (=> b!89712 m!95859))

(assert (=> b!89712 m!95859))

(declare-fun m!96327 () Bool)

(assert (=> b!89712 m!96327))

(assert (=> b!89714 m!95107))

(assert (=> b!89714 m!95859))

(assert (=> b!89714 m!95859))

(assert (=> b!89714 m!96327))

(assert (=> b!89130 d!23935))

(declare-fun d!23937 () Bool)

(declare-fun isEmpty!349 (List!1517) Bool)

(assert (=> d!23937 (= (isEmpty!347 lt!42544) (isEmpty!349 (toList!740 lt!42544)))))

(declare-fun bs!3764 () Bool)

(assert (= bs!3764 d!23937))

(declare-fun m!96329 () Bool)

(assert (=> bs!3764 m!96329))

(assert (=> b!88868 d!23937))

(declare-fun d!23939 () Bool)

(assert (=> d!23939 (= (apply!84 (+!111 lt!42756 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42752) (get!1220 (getValueByKey!143 (toList!740 (+!111 lt!42756 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) lt!42752)))))

(declare-fun bs!3765 () Bool)

(assert (= bs!3765 d!23939))

(declare-fun m!96331 () Bool)

(assert (=> bs!3765 m!96331))

(assert (=> bs!3765 m!96331))

(declare-fun m!96333 () Bool)

(assert (=> bs!3765 m!96333))

(assert (=> b!89132 d!23939))

(declare-fun d!23941 () Bool)

(declare-fun e!58374 () Bool)

(assert (=> d!23941 e!58374))

(declare-fun res!45838 () Bool)

(assert (=> d!23941 (=> (not res!45838) (not e!58374))))

(declare-fun lt!43152 () ListLongMap!1449)

(assert (=> d!23941 (= res!45838 (contains!754 lt!43152 (_1!1111 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(declare-fun lt!43151 () List!1517)

(assert (=> d!23941 (= lt!43152 (ListLongMap!1450 lt!43151))))

(declare-fun lt!43153 () Unit!2620)

(declare-fun lt!43150 () Unit!2620)

(assert (=> d!23941 (= lt!43153 lt!43150)))

(assert (=> d!23941 (= (getValueByKey!143 lt!43151 (_1!1111 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23941 (= lt!43150 (lemmaContainsTupThenGetReturnValue!60 lt!43151 (_1!1111 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23941 (= lt!43151 (insertStrictlySorted!63 (toList!740 lt!42759) (_1!1111 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23941 (= (+!111 lt!42759 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!43152)))

(declare-fun b!89715 () Bool)

(declare-fun res!45839 () Bool)

(assert (=> b!89715 (=> (not res!45839) (not e!58374))))

(assert (=> b!89715 (= res!45839 (= (getValueByKey!143 (toList!740 lt!43152) (_1!1111 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(declare-fun b!89716 () Bool)

(assert (=> b!89716 (= e!58374 (contains!755 (toList!740 lt!43152) (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))

(assert (= (and d!23941 res!45838) b!89715))

(assert (= (and b!89715 res!45839) b!89716))

(declare-fun m!96335 () Bool)

(assert (=> d!23941 m!96335))

(declare-fun m!96337 () Bool)

(assert (=> d!23941 m!96337))

(declare-fun m!96339 () Bool)

(assert (=> d!23941 m!96339))

(declare-fun m!96341 () Bool)

(assert (=> d!23941 m!96341))

(declare-fun m!96343 () Bool)

(assert (=> b!89715 m!96343))

(declare-fun m!96345 () Bool)

(assert (=> b!89716 m!96345))

(assert (=> b!89132 d!23941))

(declare-fun d!23943 () Bool)

(assert (=> d!23943 (= (apply!84 (+!111 lt!42759 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42741) (apply!84 lt!42759 lt!42741))))

(declare-fun lt!43156 () Unit!2620)

(declare-fun choose!543 (ListLongMap!1449 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2620)

(assert (=> d!23943 (= lt!43156 (choose!543 lt!42759 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42741))))

(declare-fun e!58377 () Bool)

(assert (=> d!23943 e!58377))

(declare-fun res!45842 () Bool)

(assert (=> d!23943 (=> (not res!45842) (not e!58377))))

(assert (=> d!23943 (= res!45842 (contains!754 lt!42759 lt!42741))))

(assert (=> d!23943 (= (addApplyDifferent!60 lt!42759 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42741) lt!43156)))

(declare-fun b!89720 () Bool)

(assert (=> b!89720 (= e!58377 (not (= lt!42741 lt!42744)))))

(assert (= (and d!23943 res!45842) b!89720))

(declare-fun m!96347 () Bool)

(assert (=> d!23943 m!96347))

(assert (=> d!23943 m!95339))

(assert (=> d!23943 m!95339))

(assert (=> d!23943 m!95341))

(declare-fun m!96349 () Bool)

(assert (=> d!23943 m!96349))

(assert (=> d!23943 m!95361))

(assert (=> b!89132 d!23943))

(assert (=> b!89132 d!23653))

(declare-fun d!23945 () Bool)

(declare-fun e!58378 () Bool)

(assert (=> d!23945 e!58378))

(declare-fun res!45843 () Bool)

(assert (=> d!23945 (=> res!45843 e!58378)))

(declare-fun lt!43158 () Bool)

(assert (=> d!23945 (= res!45843 (not lt!43158))))

(declare-fun lt!43159 () Bool)

(assert (=> d!23945 (= lt!43158 lt!43159)))

(declare-fun lt!43160 () Unit!2620)

(declare-fun e!58379 () Unit!2620)

(assert (=> d!23945 (= lt!43160 e!58379)))

(declare-fun c!14949 () Bool)

(assert (=> d!23945 (= c!14949 lt!43159)))

(assert (=> d!23945 (= lt!43159 (containsKey!146 (toList!740 (+!111 lt!42739 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) lt!42746))))

(assert (=> d!23945 (= (contains!754 (+!111 lt!42739 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42746) lt!43158)))

(declare-fun b!89721 () Bool)

(declare-fun lt!43157 () Unit!2620)

(assert (=> b!89721 (= e!58379 lt!43157)))

(assert (=> b!89721 (= lt!43157 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!740 (+!111 lt!42739 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) lt!42746))))

(assert (=> b!89721 (isDefined!95 (getValueByKey!143 (toList!740 (+!111 lt!42739 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) lt!42746))))

(declare-fun b!89722 () Bool)

(declare-fun Unit!2654 () Unit!2620)

(assert (=> b!89722 (= e!58379 Unit!2654)))

(declare-fun b!89723 () Bool)

(assert (=> b!89723 (= e!58378 (isDefined!95 (getValueByKey!143 (toList!740 (+!111 lt!42739 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) lt!42746)))))

(assert (= (and d!23945 c!14949) b!89721))

(assert (= (and d!23945 (not c!14949)) b!89722))

(assert (= (and d!23945 (not res!45843)) b!89723))

(declare-fun m!96351 () Bool)

(assert (=> d!23945 m!96351))

(declare-fun m!96353 () Bool)

(assert (=> b!89721 m!96353))

(declare-fun m!96355 () Bool)

(assert (=> b!89721 m!96355))

(assert (=> b!89721 m!96355))

(declare-fun m!96357 () Bool)

(assert (=> b!89721 m!96357))

(assert (=> b!89723 m!96355))

(assert (=> b!89723 m!96355))

(assert (=> b!89723 m!96357))

(assert (=> b!89132 d!23945))

(declare-fun d!23947 () Bool)

(declare-fun e!58380 () Bool)

(assert (=> d!23947 e!58380))

(declare-fun res!45844 () Bool)

(assert (=> d!23947 (=> (not res!45844) (not e!58380))))

(declare-fun lt!43163 () ListLongMap!1449)

(assert (=> d!23947 (= res!45844 (contains!754 lt!43163 (_1!1111 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(declare-fun lt!43162 () List!1517)

(assert (=> d!23947 (= lt!43163 (ListLongMap!1450 lt!43162))))

(declare-fun lt!43164 () Unit!2620)

(declare-fun lt!43161 () Unit!2620)

(assert (=> d!23947 (= lt!43164 lt!43161)))

(assert (=> d!23947 (= (getValueByKey!143 lt!43162 (_1!1111 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23947 (= lt!43161 (lemmaContainsTupThenGetReturnValue!60 lt!43162 (_1!1111 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23947 (= lt!43162 (insertStrictlySorted!63 (toList!740 lt!42750) (_1!1111 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23947 (= (+!111 lt!42750 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!43163)))

(declare-fun b!89724 () Bool)

(declare-fun res!45845 () Bool)

(assert (=> b!89724 (=> (not res!45845) (not e!58380))))

(assert (=> b!89724 (= res!45845 (= (getValueByKey!143 (toList!740 lt!43163) (_1!1111 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(declare-fun b!89725 () Bool)

(assert (=> b!89725 (= e!58380 (contains!755 (toList!740 lt!43163) (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))))))

(assert (= (and d!23947 res!45844) b!89724))

(assert (= (and b!89724 res!45845) b!89725))

(declare-fun m!96359 () Bool)

(assert (=> d!23947 m!96359))

(declare-fun m!96361 () Bool)

(assert (=> d!23947 m!96361))

(declare-fun m!96363 () Bool)

(assert (=> d!23947 m!96363))

(declare-fun m!96365 () Bool)

(assert (=> d!23947 m!96365))

(declare-fun m!96367 () Bool)

(assert (=> b!89724 m!96367))

(declare-fun m!96369 () Bool)

(assert (=> b!89725 m!96369))

(assert (=> b!89132 d!23947))

(declare-fun d!23949 () Bool)

(declare-fun e!58381 () Bool)

(assert (=> d!23949 e!58381))

(declare-fun res!45846 () Bool)

(assert (=> d!23949 (=> (not res!45846) (not e!58381))))

(declare-fun lt!43167 () ListLongMap!1449)

(assert (=> d!23949 (= res!45846 (contains!754 lt!43167 (_1!1111 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(declare-fun lt!43166 () List!1517)

(assert (=> d!23949 (= lt!43167 (ListLongMap!1450 lt!43166))))

(declare-fun lt!43168 () Unit!2620)

(declare-fun lt!43165 () Unit!2620)

(assert (=> d!23949 (= lt!43168 lt!43165)))

(assert (=> d!23949 (= (getValueByKey!143 lt!43166 (_1!1111 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23949 (= lt!43165 (lemmaContainsTupThenGetReturnValue!60 lt!43166 (_1!1111 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23949 (= lt!43166 (insertStrictlySorted!63 (toList!740 lt!42739) (_1!1111 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23949 (= (+!111 lt!42739 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!43167)))

(declare-fun b!89726 () Bool)

(declare-fun res!45847 () Bool)

(assert (=> b!89726 (=> (not res!45847) (not e!58381))))

(assert (=> b!89726 (= res!45847 (= (getValueByKey!143 (toList!740 lt!43167) (_1!1111 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(declare-fun b!89727 () Bool)

(assert (=> b!89727 (= e!58381 (contains!755 (toList!740 lt!43167) (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))))))

(assert (= (and d!23949 res!45846) b!89726))

(assert (= (and b!89726 res!45847) b!89727))

(declare-fun m!96371 () Bool)

(assert (=> d!23949 m!96371))

(declare-fun m!96373 () Bool)

(assert (=> d!23949 m!96373))

(declare-fun m!96375 () Bool)

(assert (=> d!23949 m!96375))

(declare-fun m!96377 () Bool)

(assert (=> d!23949 m!96377))

(declare-fun m!96379 () Bool)

(assert (=> b!89726 m!96379))

(declare-fun m!96381 () Bool)

(assert (=> b!89727 m!96381))

(assert (=> b!89132 d!23949))

(declare-fun d!23951 () Bool)

(assert (=> d!23951 (= (apply!84 (+!111 lt!42759 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42741) (get!1220 (getValueByKey!143 (toList!740 (+!111 lt!42759 (tuple2!2201 lt!42744 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) lt!42741)))))

(declare-fun bs!3766 () Bool)

(assert (= bs!3766 d!23951))

(declare-fun m!96383 () Bool)

(assert (=> bs!3766 m!96383))

(assert (=> bs!3766 m!96383))

(declare-fun m!96385 () Bool)

(assert (=> bs!3766 m!96385))

(assert (=> b!89132 d!23951))

(declare-fun d!23953 () Bool)

(assert (=> d!23953 (= (apply!84 (+!111 lt!42750 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42754) (apply!84 lt!42750 lt!42754))))

(declare-fun lt!43169 () Unit!2620)

(assert (=> d!23953 (= lt!43169 (choose!543 lt!42750 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42754))))

(declare-fun e!58382 () Bool)

(assert (=> d!23953 e!58382))

(declare-fun res!45848 () Bool)

(assert (=> d!23953 (=> (not res!45848) (not e!58382))))

(assert (=> d!23953 (= res!45848 (contains!754 lt!42750 lt!42754))))

(assert (=> d!23953 (= (addApplyDifferent!60 lt!42750 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42754) lt!43169)))

(declare-fun b!89728 () Bool)

(assert (=> b!89728 (= e!58382 (not (= lt!42754 lt!42743)))))

(assert (= (and d!23953 res!45848) b!89728))

(declare-fun m!96387 () Bool)

(assert (=> d!23953 m!96387))

(assert (=> d!23953 m!95345))

(assert (=> d!23953 m!95345))

(assert (=> d!23953 m!95347))

(declare-fun m!96389 () Bool)

(assert (=> d!23953 m!96389))

(assert (=> d!23953 m!95359))

(assert (=> b!89132 d!23953))

(declare-fun d!23955 () Bool)

(assert (=> d!23955 (= (apply!84 lt!42759 lt!42741) (get!1220 (getValueByKey!143 (toList!740 lt!42759) lt!42741)))))

(declare-fun bs!3767 () Bool)

(assert (= bs!3767 d!23955))

(declare-fun m!96391 () Bool)

(assert (=> bs!3767 m!96391))

(assert (=> bs!3767 m!96391))

(declare-fun m!96393 () Bool)

(assert (=> bs!3767 m!96393))

(assert (=> b!89132 d!23955))

(declare-fun d!23957 () Bool)

(declare-fun e!58383 () Bool)

(assert (=> d!23957 e!58383))

(declare-fun res!45849 () Bool)

(assert (=> d!23957 (=> (not res!45849) (not e!58383))))

(declare-fun lt!43172 () ListLongMap!1449)

(assert (=> d!23957 (= res!45849 (contains!754 lt!43172 (_1!1111 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(declare-fun lt!43171 () List!1517)

(assert (=> d!23957 (= lt!43172 (ListLongMap!1450 lt!43171))))

(declare-fun lt!43173 () Unit!2620)

(declare-fun lt!43170 () Unit!2620)

(assert (=> d!23957 (= lt!43173 lt!43170)))

(assert (=> d!23957 (= (getValueByKey!143 lt!43171 (_1!1111 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23957 (= lt!43170 (lemmaContainsTupThenGetReturnValue!60 lt!43171 (_1!1111 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23957 (= lt!43171 (insertStrictlySorted!63 (toList!740 lt!42756) (_1!1111 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) (_2!1111 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))))))

(assert (=> d!23957 (= (+!111 lt!42756 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!43172)))

(declare-fun b!89729 () Bool)

(declare-fun res!45850 () Bool)

(assert (=> b!89729 (=> (not res!45850) (not e!58383))))

(assert (=> b!89729 (= res!45850 (= (getValueByKey!143 (toList!740 lt!43172) (_1!1111 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992)))))) (Some!148 (_2!1111 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))))

(declare-fun b!89730 () Bool)

(assert (=> b!89730 (= e!58383 (contains!755 (toList!740 lt!43172) (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992))))))))

(assert (= (and d!23957 res!45849) b!89729))

(assert (= (and b!89729 res!45850) b!89730))

(declare-fun m!96395 () Bool)

(assert (=> d!23957 m!96395))

(declare-fun m!96397 () Bool)

(assert (=> d!23957 m!96397))

(declare-fun m!96399 () Bool)

(assert (=> d!23957 m!96399))

(declare-fun m!96401 () Bool)

(assert (=> d!23957 m!96401))

(declare-fun m!96403 () Bool)

(assert (=> b!89729 m!96403))

(declare-fun m!96405 () Bool)

(assert (=> b!89730 m!96405))

(assert (=> b!89132 d!23957))

(declare-fun d!23959 () Bool)

(assert (=> d!23959 (= (apply!84 (+!111 lt!42750 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42754) (get!1220 (getValueByKey!143 (toList!740 (+!111 lt!42750 (tuple2!2201 lt!42743 (zeroValue!2260 (v!2677 (underlying!298 thiss!992)))))) lt!42754)))))

(declare-fun bs!3768 () Bool)

(assert (= bs!3768 d!23959))

(declare-fun m!96407 () Bool)

(assert (=> bs!3768 m!96407))

(assert (=> bs!3768 m!96407))

(declare-fun m!96409 () Bool)

(assert (=> bs!3768 m!96409))

(assert (=> b!89132 d!23959))

(declare-fun d!23961 () Bool)

(assert (=> d!23961 (= (apply!84 lt!42756 lt!42752) (get!1220 (getValueByKey!143 (toList!740 lt!42756) lt!42752)))))

(declare-fun bs!3769 () Bool)

(assert (= bs!3769 d!23961))

(declare-fun m!96411 () Bool)

(assert (=> bs!3769 m!96411))

(assert (=> bs!3769 m!96411))

(declare-fun m!96413 () Bool)

(assert (=> bs!3769 m!96413))

(assert (=> b!89132 d!23961))

(declare-fun d!23963 () Bool)

(assert (=> d!23963 (= (apply!84 (+!111 lt!42756 (tuple2!2201 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42752) (apply!84 lt!42756 lt!42752))))

(declare-fun lt!43174 () Unit!2620)

(assert (=> d!23963 (= lt!43174 (choose!543 lt!42756 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42752))))

(declare-fun e!58384 () Bool)

(assert (=> d!23963 e!58384))

(declare-fun res!45851 () Bool)

(assert (=> d!23963 (=> (not res!45851) (not e!58384))))

(assert (=> d!23963 (= res!45851 (contains!754 lt!42756 lt!42752))))

(assert (=> d!23963 (= (addApplyDifferent!60 lt!42756 lt!42745 (minValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42752) lt!43174)))

(declare-fun b!89731 () Bool)

(assert (=> b!89731 (= e!58384 (not (= lt!42752 lt!42745)))))

(assert (= (and d!23963 res!45851) b!89731))

(declare-fun m!96415 () Bool)

(assert (=> d!23963 m!96415))

(assert (=> d!23963 m!95357))

(assert (=> d!23963 m!95357))

(assert (=> d!23963 m!95363))

(declare-fun m!96417 () Bool)

(assert (=> d!23963 m!96417))

(assert (=> d!23963 m!95353))

(assert (=> b!89132 d!23963))

(declare-fun d!23965 () Bool)

(assert (=> d!23965 (contains!754 (+!111 lt!42739 (tuple2!2201 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))))) lt!42746)))

(declare-fun lt!43177 () Unit!2620)

(declare-fun choose!544 (ListLongMap!1449 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2620)

(assert (=> d!23965 (= lt!43177 (choose!544 lt!42739 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42746))))

(assert (=> d!23965 (contains!754 lt!42739 lt!42746)))

(assert (=> d!23965 (= (addStillContains!60 lt!42739 lt!42738 (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) lt!42746) lt!43177)))

(declare-fun bs!3770 () Bool)

(assert (= bs!3770 d!23965))

(assert (=> bs!3770 m!95349))

(assert (=> bs!3770 m!95349))

(assert (=> bs!3770 m!95351))

(declare-fun m!96419 () Bool)

(assert (=> bs!3770 m!96419))

(declare-fun m!96421 () Bool)

(assert (=> bs!3770 m!96421))

(assert (=> b!89132 d!23965))

(declare-fun d!23967 () Bool)

(assert (=> d!23967 (= (apply!84 lt!42750 lt!42754) (get!1220 (getValueByKey!143 (toList!740 lt!42750) lt!42754)))))

(declare-fun bs!3771 () Bool)

(assert (= bs!3771 d!23967))

(declare-fun m!96423 () Bool)

(assert (=> bs!3771 m!96423))

(assert (=> bs!3771 m!96423))

(declare-fun m!96425 () Bool)

(assert (=> bs!3771 m!96425))

(assert (=> b!89132 d!23967))

(declare-fun d!23969 () Bool)

(declare-fun e!58387 () Bool)

(assert (=> d!23969 e!58387))

(declare-fun c!14952 () Bool)

(assert (=> d!23969 (= c!14952 (and (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23969 true))

(declare-fun _$29!114 () Unit!2620)

(assert (=> d!23969 (= (choose!534 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (_values!2354 (v!2677 (underlying!298 thiss!992))) (mask!6415 (v!2677 (underlying!298 thiss!992))) (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) (zeroValue!2260 (v!2677 (underlying!298 thiss!992))) (minValue!2260 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992)))) _$29!114)))

(declare-fun b!89737 () Bool)

(assert (=> b!89737 (= e!58387 (arrayContainsKey!0 (_keys!4049 (v!2677 (underlying!298 thiss!992))) (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!89738 () Bool)

(assert (=> b!89738 (= e!58387 (ite (= (select (arr!1922 (_keys!4049 (v!2677 (underlying!298 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2204 (v!2677 (underlying!298 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23969 c!14952) b!89737))

(assert (= (and d!23969 (not c!14952)) b!89738))

(assert (=> b!89737 m!94891))

(assert (=> b!89737 m!94925))

(assert (=> d!23691 d!23969))

(assert (=> d!23691 d!23663))

(declare-fun d!23971 () Bool)

(declare-fun lt!43178 () Bool)

(assert (=> d!23971 (= lt!43178 (select (content!95 (toList!740 lt!42568)) lt!42410))))

(declare-fun e!58388 () Bool)

(assert (=> d!23971 (= lt!43178 e!58388)))

(declare-fun res!45853 () Bool)

(assert (=> d!23971 (=> (not res!45853) (not e!58388))))

(assert (=> d!23971 (= res!45853 ((_ is Cons!1513) (toList!740 lt!42568)))))

(assert (=> d!23971 (= (contains!755 (toList!740 lt!42568) lt!42410) lt!43178)))

(declare-fun b!89739 () Bool)

(declare-fun e!58389 () Bool)

(assert (=> b!89739 (= e!58388 e!58389)))

(declare-fun res!45852 () Bool)

(assert (=> b!89739 (=> res!45852 e!58389)))

(assert (=> b!89739 (= res!45852 (= (h!2105 (toList!740 lt!42568)) lt!42410))))

(declare-fun b!89740 () Bool)

(assert (=> b!89740 (= e!58389 (contains!755 (t!5267 (toList!740 lt!42568)) lt!42410))))

(assert (= (and d!23971 res!45853) b!89739))

(assert (= (and b!89739 (not res!45852)) b!89740))

(declare-fun m!96427 () Bool)

(assert (=> d!23971 m!96427))

(declare-fun m!96429 () Bool)

(assert (=> d!23971 m!96429))

(declare-fun m!96431 () Bool)

(assert (=> b!89740 m!96431))

(assert (=> b!88887 d!23971))

(declare-fun d!23973 () Bool)

(assert (=> d!23973 (= (+!111 (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42407)) (getCurrentListMap!433 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) lt!42692 (zeroValue!2260 newMap!16) lt!42407 #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!43181 () Unit!2620)

(declare-fun choose!545 (array!4039 array!4041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 V!3041 Int) Unit!2620)

(assert (=> d!23973 (= lt!43181 (choose!545 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) lt!42692 (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) lt!42407 (defaultEntry!2371 newMap!16)))))

(assert (=> d!23973 (validMask!0 (mask!6415 newMap!16))))

(assert (=> d!23973 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!33 (_keys!4049 newMap!16) (_values!2354 newMap!16) (mask!6415 newMap!16) (extraKeys!2204 newMap!16) lt!42692 (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) lt!42407 (defaultEntry!2371 newMap!16)) lt!43181)))

(declare-fun bs!3772 () Bool)

(assert (= bs!3772 d!23973))

(assert (=> bs!3772 m!95329))

(declare-fun m!96433 () Bool)

(assert (=> bs!3772 m!96433))

(declare-fun m!96435 () Bool)

(assert (=> bs!3772 m!96435))

(assert (=> bs!3772 m!95573))

(assert (=> bs!3772 m!95329))

(declare-fun m!96437 () Bool)

(assert (=> bs!3772 m!96437))

(assert (=> b!89074 d!23973))

(declare-fun b!89742 () Bool)

(declare-fun e!58391 () Bool)

(assert (=> b!89742 (= e!58391 tp_is_empty!2545)))

(declare-fun b!89741 () Bool)

(declare-fun e!58390 () Bool)

(assert (=> b!89741 (= e!58390 tp_is_empty!2545)))

(declare-fun condMapEmpty!3461 () Bool)

(declare-fun mapDefault!3461 () ValueCell!929)

(assert (=> mapNonEmpty!3459 (= condMapEmpty!3461 (= mapRest!3459 ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3461)))))

(declare-fun mapRes!3461 () Bool)

(assert (=> mapNonEmpty!3459 (= tp!9039 (and e!58391 mapRes!3461))))

(declare-fun mapIsEmpty!3461 () Bool)

(assert (=> mapIsEmpty!3461 mapRes!3461))

(declare-fun mapNonEmpty!3461 () Bool)

(declare-fun tp!9041 () Bool)

(assert (=> mapNonEmpty!3461 (= mapRes!3461 (and tp!9041 e!58390))))

(declare-fun mapValue!3461 () ValueCell!929)

(declare-fun mapRest!3461 () (Array (_ BitVec 32) ValueCell!929))

(declare-fun mapKey!3461 () (_ BitVec 32))

(assert (=> mapNonEmpty!3461 (= mapRest!3459 (store mapRest!3461 mapKey!3461 mapValue!3461))))

(assert (= (and mapNonEmpty!3459 condMapEmpty!3461) mapIsEmpty!3461))

(assert (= (and mapNonEmpty!3459 (not condMapEmpty!3461)) mapNonEmpty!3461))

(assert (= (and mapNonEmpty!3461 ((_ is ValueCellFull!929) mapValue!3461)) b!89741))

(assert (= (and mapNonEmpty!3459 ((_ is ValueCellFull!929) mapDefault!3461)) b!89742))

(declare-fun m!96439 () Bool)

(assert (=> mapNonEmpty!3461 m!96439))

(declare-fun b!89744 () Bool)

(declare-fun e!58393 () Bool)

(assert (=> b!89744 (= e!58393 tp_is_empty!2545)))

(declare-fun b!89743 () Bool)

(declare-fun e!58392 () Bool)

(assert (=> b!89743 (= e!58392 tp_is_empty!2545)))

(declare-fun condMapEmpty!3462 () Bool)

(declare-fun mapDefault!3462 () ValueCell!929)

(assert (=> mapNonEmpty!3460 (= condMapEmpty!3462 (= mapRest!3460 ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3462)))))

(declare-fun mapRes!3462 () Bool)

(assert (=> mapNonEmpty!3460 (= tp!9040 (and e!58393 mapRes!3462))))

(declare-fun mapIsEmpty!3462 () Bool)

(assert (=> mapIsEmpty!3462 mapRes!3462))

(declare-fun mapNonEmpty!3462 () Bool)

(declare-fun tp!9042 () Bool)

(assert (=> mapNonEmpty!3462 (= mapRes!3462 (and tp!9042 e!58392))))

(declare-fun mapRest!3462 () (Array (_ BitVec 32) ValueCell!929))

(declare-fun mapValue!3462 () ValueCell!929)

(declare-fun mapKey!3462 () (_ BitVec 32))

(assert (=> mapNonEmpty!3462 (= mapRest!3460 (store mapRest!3462 mapKey!3462 mapValue!3462))))

(assert (= (and mapNonEmpty!3460 condMapEmpty!3462) mapIsEmpty!3462))

(assert (= (and mapNonEmpty!3460 (not condMapEmpty!3462)) mapNonEmpty!3462))

(assert (= (and mapNonEmpty!3462 ((_ is ValueCellFull!929) mapValue!3462)) b!89743))

(assert (= (and mapNonEmpty!3460 ((_ is ValueCellFull!929) mapDefault!3462)) b!89744))

(declare-fun m!96441 () Bool)

(assert (=> mapNonEmpty!3462 m!96441))

(declare-fun b_lambda!3959 () Bool)

(assert (= b_lambda!3953 (or (and b!88685 b_free!2257 (= (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) (defaultEntry!2371 newMap!16))) (and b!88690 b_free!2259) b_lambda!3959)))

(declare-fun b_lambda!3961 () Bool)

(assert (= b_lambda!3949 (or (and b!88685 b_free!2257 (= (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) (defaultEntry!2371 newMap!16))) (and b!88690 b_free!2259) b_lambda!3961)))

(declare-fun b_lambda!3963 () Bool)

(assert (= b_lambda!3955 (or (and b!88685 b_free!2257) (and b!88690 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))))) b_lambda!3963)))

(declare-fun b_lambda!3965 () Bool)

(assert (= b_lambda!3957 (or (and b!88685 b_free!2257) (and b!88690 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))))) b_lambda!3965)))

(declare-fun b_lambda!3967 () Bool)

(assert (= b_lambda!3947 (or (and b!88685 b_free!2257 (= (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) (defaultEntry!2371 newMap!16))) (and b!88690 b_free!2259) b_lambda!3967)))

(declare-fun b_lambda!3969 () Bool)

(assert (= b_lambda!3951 (or (and b!88685 b_free!2257 (= (defaultEntry!2371 (v!2677 (underlying!298 thiss!992))) (defaultEntry!2371 newMap!16))) (and b!88690 b_free!2259) b_lambda!3969)))

(check-sat (not b!89703) (not bm!8698) (not d!23887) (not b!89157) (not d!23855) (not bm!8637) (not b!89171) (not d!23865) (not b!89582) (not b_lambda!3965) (not b!89401) (not b!89250) (not b!89361) (not d!23949) (not b!89706) (not b!89211) (not d!23963) (not b!89604) (not b!89588) (not d!23939) (not d!23761) (not b!89573) (not b!89348) (not d!23745) (not bm!8673) (not d!23757) (not b!89693) (not b!89620) (not bm!8667) (not b!89226) (not b!89262) (not b!89292) (not d!23881) (not d!23813) (not b!89255) (not d!23891) (not bm!8700) (not d!23943) (not bm!8656) (not b!89408) (not b!89446) (not bm!8689) (not b!89356) (not b!89471) (not b!89571) (not b!89155) (not b!89678) (not b!89280) (not b!89370) (not b!89365) (not b!89305) (not b!89472) (not b!89345) (not b_lambda!3961) (not b!89653) (not b!89160) (not b!89523) (not b!89245) (not d!23897) (not b!89304) (not d!23971) (not d!23873) (not b!89378) (not b!89683) (not b_lambda!3959) (not b!89712) (not d!23923) (not bm!8662) (not d!23875) (not b!89212) (not b!89273) (not b!89695) (not b!89740) (not d!23783) (not b!89600) (not b!89216) (not bm!8677) (not b_lambda!3941) (not bm!8697) (not b!89346) (not bm!8692) (not b!89481) (not b!89475) (not b!89605) (not b!89294) (not b!89221) (not mapNonEmpty!3461) (not d!23803) (not bm!8646) (not b!89663) (not b!89601) (not bm!8701) (not d!23947) (not d!23895) (not b!89382) (not b_lambda!3943) (not b!89269) (not b!89632) (not b!89709) (not d!23957) (not b!89303) (not b!89711) (not b!89611) (not b!89702) (not b!89423) (not b!89657) (not d!23751) (not bm!8681) (not b!89218) (not bm!8674) (not d!23965) (not b!89729) (not b!89727) (not b!89453) (not b!89615) (not b!89375) (not b!89715) (not bm!8633) (not b!89399) (not d!23961) (not d!23773) (not b!89263) (not b!89213) (not b!89469) (not b!89516) (not b!89640) (not b!89716) (not b!89451) (not bm!8641) (not b!89730) (not d!23795) (not d!23777) (not b!89450) (not b!89442) (not b_lambda!3945) (not b!89178) (not b!89650) (not d!23717) (not d!23927) (not b!89293) (not b!89429) (not b!89673) (not b!89643) b_and!5383 (not b!89688) (not bm!8688) (not b!89300) (not b!89522) (not d!23789) (not b!89440) (not b!89158) (not bm!8655) (not bm!8699) (not b_lambda!3963) (not bm!8668) (not b!89249) (not bm!8675) (not bm!8629) (not b!89349) (not b!89243) (not b!89383) (not b!89297) (not d!23955) (not d!23907) (not b!89247) (not b!89301) (not b!89558) (not d!23793) (not b_lambda!3967) (not d!23841) (not b!89270) (not d!23869) (not b!89200) (not bm!8702) (not d!23931) (not d!23743) (not b!89656) (not d!23741) (not mapNonEmpty!3462) (not b!89391) (not d!23719) (not b!89704) (not b!89533) (not b!89277) (not b!89658) (not b!89636) (not b!89443) (not d!23797) (not b!89441) (not b!89568) (not b!89618) (not b!89252) (not b!89209) (not b!89271) (not bm!8687) (not b!89517) (not b!89599) (not b!89352) (not b!89642) (not bm!8632) (not b!89489) (not d!23863) (not b!89654) (not d!23851) (not d!23737) (not b!89617) (not d!23871) (not b!89397) (not b!89721) (not b!89524) (not bm!8659) tp_is_empty!2545 (not d!23731) (not b!89705) (not b!89557) (not b!89455) (not b!89291) (not b!89677) (not d!23763) (not b!89413) (not d!23849) (not d!23769) (not b_lambda!3969) (not b!89608) (not d!23903) (not d!23899) (not d!23861) (not d!23755) (not b!89470) (not b!89708) (not b!89428) (not b!89410) (not b!89402) (not b!89612) (not d!23937) (not bm!8676) (not b!89458) (not b!89427) (not b_next!2257) (not b!89260) (not d!23749) (not d!23819) (not b!89633) (not b!89474) (not b!89714) (not bm!8640) (not b!89457) (not b!89368) (not b!89202) (not b!89203) (not b!89445) (not b!89377) (not d!23935) (not bm!8693) (not d!23835) (not d!23867) (not d!23921) (not d!23807) (not b!89258) (not b!89707) (not d!23785) (not b!89279) (not b!89274) (not b!89396) (not b!89394) (not b!89675) (not d!23747) (not b!89563) (not d!23847) (not b!89685) (not b!89296) (not d!23831) (not d!23771) (not d!23759) (not d!23885) (not b!89525) (not b!89724) (not d!23845) (not b!89531) (not bm!8669) (not b!89372) (not b_lambda!3933) (not b!89229) (not b!89546) (not b!89240) (not d!23929) (not b!89668) (not d!23909) (not d!23715) (not d!23859) (not b!89449) (not b!89452) (not d!23711) (not b!89609) (not b!89275) (not bm!8682) (not b!89669) (not b!89680) (not d!23767) (not d!23853) (not d!23919) (not d!23753) (not b!89666) (not b!89515) (not b!89737) (not b!89380) (not bm!8657) (not d!23779) (not d!23837) (not b!89228) (not b!89478) (not b!89671) (not b!89622) (not d!23829) (not b!89576) (not b!89570) (not bm!8636) b_and!5381 (not b!89272) (not d!23941) (not b!89723) (not b!89690) (not d!23945) (not d!23915) (not b!89726) (not d!23953) (not b!89562) (not d!23967) (not b!89691) (not d!23933) (not d!23959) (not b!89257) (not b!89520) (not b!89575) (not d!23729) (not d!23925) (not b_next!2259) (not b!89224) (not b!89696) (not d!23973) (not b!89565) (not b!89560) (not d!23893) (not b!89485) (not bm!8645) (not b!89602) (not b!89389) (not b!89637) (not b!89276) (not b!89667) (not b!89223) (not d!23723) (not b!89725) (not b!89682) (not b!89639) (not b!89641) (not d!23709) (not d!23727) (not d!23883) (not d!23805) (not d!23889) (not d!23951) (not b!89177) (not b!89613))
(check-sat b_and!5381 b_and!5383 (not b_next!2257) (not b_next!2259))
